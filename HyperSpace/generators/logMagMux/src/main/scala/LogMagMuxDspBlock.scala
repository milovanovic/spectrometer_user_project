// SPDX-License-Identifier: Apache-2.0

package magnitude

import chisel3._
import chisel3.experimental._

import dsptools.numbers._

import dspblocks._
import freechips.rocketchip.amba.axi4._
import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.regmapper._
import freechips.rocketchip.tilelink._

// make standalone block for LogMagMux
trait AXI4LogMagMuxStandaloneBlock extends AXI4LogMagMuxBlock[FixedPoint] {
  def standaloneParams = AXI4BundleParameters(addrBits = 32, dataBits = 32, idBits = 1)
  val ioMem = mem.map { m => {
    val ioMemNode = BundleBridgeSource(() => AXI4Bundle(standaloneParams))

    m :=
      BundleBridgeToAXI4(AXI4MasterPortParameters(Seq(AXI4MasterParameters("bundleBridgeToAXI4")))) :=
      ioMemNode

    val ioMem = InModuleBody { ioMemNode.makeIO() }
    ioMem
  }}

  val ioInNode = BundleBridgeSource(() => new AXI4StreamBundle(AXI4StreamBundleParameters(n = 2)))
  val ioOutNode = BundleBridgeSink[AXI4StreamBundle]()

  ioOutNode :=
    AXI4StreamToBundleBridge(AXI4StreamSlaveParameters()) :=
    streamNode :=
    BundleBridgeToAXI4Stream(AXI4StreamMasterParameters(n = 2)) :=
    ioInNode

  val in = InModuleBody { ioInNode.makeIO() }
  val out = InModuleBody { ioOutNode.makeIO() }
}

abstract class LogMagMuxBlock [T <: Data : Real: BinaryRepresentation, D, U, E, O, B <: Data] (params: MAGParams[T], beatBytes: Int) extends LazyModule()(Parameters.empty) with DspBlock[D, U, E, O, B] with HasCSR {

  // this block requires that sel signal is there, no HasCSR when JPL only or Mag Sqr only or LogMag only is set
  require(params.magType == MagJPLandSqrMag || params.magType == MagJPLandLogMag || params.magType == LogMagMux)

  val dataWidthOut = params.protoOut.getWidth

  val masterParams = AXI4StreamMasterParameters(
    name = "AXI4 Stream Accumulator",
    n = (dataWidthOut + 8 - 1) / 8,
    numMasters = 1
  )
  val slaveParams = AXI4StreamSlaveParameters()

  val slaveNode  = AXI4StreamSlaveNode(slaveParams)
  val masterNode = AXI4StreamMasterNode(masterParams)

  val streamNode = NodeHandle(slaveNode, masterNode)


  lazy val module = new LazyModuleImp(this) {
    val (in, edgeIn)  = slaveNode.in.head
    val (out, edgeOut) = masterNode.out.head

    //  Log magnitude mux module
    val logMagMux = Module(new LogMagMuxGenerator(params))

    // if it is only one type then this register should not be considered at all
    val selRegDataWidth = if (params.magType == LogMagMux) 2 else 1

    val selReg = RegInit(0.U(selRegDataWidth.W))
    val fields = Seq(
      RegField(selRegDataWidth, selReg,
        RegFieldDesc(name = "sel", desc = "selection signal for the log magnitude multiplexer")),
      // left for future addition
    )
    logMagMux.io.sel.get := selReg

    // Define abstract register map so it can be AXI4, Tilelink, APB, AHB
    regmap(fields.zipWithIndex.map({ case (f, i) => i * beatBytes -> Seq(f)}): _*)
    
    // Connect inputs
    logMagMux.io.in.valid    := in.valid
    logMagMux.io.in.bits     := in.bits.data.asTypeOf(DspComplex(params.protoIn))
    in.ready                 := logMagMux.io.in.ready
    if (params.useLast) {
      logMagMux.io.lastIn.get := in.bits.last
    }

    // Connect outputs
    out.valid              := logMagMux.io.out.valid
    logMagMux.io.out.ready := out.ready
    out.bits.data          := logMagMux.io.out.bits.asUInt
    if (params.useLast) {
      out.bits.last := logMagMux.io.lastOut.get
    }
  }
}

class AXI4LogMagMuxBlock[T <: Data : Real: BinaryRepresentation](params: MAGParams[T], address: AddressSet, _beatBytes: Int = 4)(implicit p: Parameters) extends LogMagMuxBlock[T, AXI4MasterPortParameters, AXI4SlavePortParameters, AXI4EdgeParameters, AXI4EdgeParameters, AXI4Bundle](params, _beatBytes) with AXI4DspBlock with AXI4HasCSR {
  override val mem = Some(AXI4RegisterNode(address = address, beatBytes = _beatBytes))
}

class TLLogMagMuxBlock[T <: Data : Real: BinaryRepresentation](val params: MAGParams[T], address: AddressSet, beatBytes: Int = 4)(implicit p: Parameters) extends LogMagMuxBlock[T, TLClientPortParameters, TLManagerPortParameters, TLEdgeOut, TLEdgeIn, TLBundle](params, beatBytes) with TLDspBlock with TLHasCSR {
  val devname = "TLLogMagMuxBlock"
  val devcompat = Seq("LogMagMux", "radarDSP")
  val device = new SimpleDevice(devname, devcompat) {
    override def describe(resources: ResourceBindings): Description = {
      val Description(name, mapping) = super.describe(resources)
      Description(name, mapping)
    }
  }
  // make diplomatic TL node for regmap
  override val mem = Some(TLRegisterNode(address = Seq(address), device = device, beatBytes = beatBytes))
}


object LogMagMuxDspBlock extends App
{
  // here just define parameters
  val params: MAGParams[FixedPoint] =  MAGParams(
    protoIn  = FixedPoint(16.W, 8.BP),
    protoOut = FixedPoint(20.W, 8.BP),
    protoLog = Some(FixedPoint(16.W, 8.BP)),
    magType  = MagJPLandLogMag,
    log2LookUpWidth = 8,
    useLast = true,
    numAddPipes = 1,
    numMulPipes = 1
  )
  
  val baseAddress = 0x500
  implicit val p: Parameters = Parameters.empty
  
  val mag = LazyModule(new AXI4LogMagMuxBlock(params, AddressSet(baseAddress + 0x100, 0xFF), _beatBytes = 4) with AXI4LogMagMuxStandaloneBlock)
  chisel3.Driver.execute(args, ()=> mag.module)
}
