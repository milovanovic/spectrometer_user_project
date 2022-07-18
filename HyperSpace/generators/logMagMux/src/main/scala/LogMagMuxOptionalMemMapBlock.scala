// SPDX-License-Identifier: Apache-2.0

package magnitude

import chisel3._
import chisel3.util._
import chisel3.experimental._

import dsptools._
import dsptools.numbers._

import dspblocks._
import freechips.rocketchip.amba.axi4._
import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.regmapper._
import freechips.rocketchip.tilelink._

abstract class LogMagMuxBlockOptionalMemMap [T <: Data : Real: BinaryRepresentation, D, U, E, O, B <: Data] (params: MAGParams[T], beatBytes: Int, hasMemMap: Boolean) extends LazyModule()(Parameters.empty) with DspBlock[D, U, E, O, B] {
  // Define regmap and addCSR functions needed for memory mapped registers
  def regmap(mapping: RegField.Map*)
  def addCSR(address: Int, field: Seq[RegField]): Unit = {}

  val streamNode = AXI4StreamIdentityNode()

  lazy val module = new LazyModuleImp(this) {
    val (in, _)  = streamNode.in(0)
    val (out, _) = streamNode.out(0)

    //  Log magnitude mux module
    val logMagMux = Module(new LogMagMuxGenerator(params))
    val sel = IO(Input(UInt(2.W)))
    
    // Case with memory mapped registers
    if (hasMemMap){
      val selReg         = RegInit(0.U(2.W))
      val fields = Seq(
        RegField(2, selReg,
          RegFieldDesc(name = "sel", desc = "selection signal for the log magnitude multiplexer")),
        // left for future addition
      )
      logMagMux.io.sel.get := selReg
      // Define abstract register map so it can be AXI4, Tilelink, APB, AHB
      regmap(fields.zipWithIndex.map({ case (f, i) => i * beatBytes -> Seq(f)}): _*)
    }
    // Case without memory mapped registers
    else {
      logMagMux.io.sel.get := sel
    }
    
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


class AXI4LogMagMuxBlockOptionalMemMap[T <: Data : Real: BinaryRepresentation](params: MAGParams[T], address: AddressSet, _beatBytes: Int = 4, hasAXI4: Boolean)(implicit p: Parameters) extends LogMagMuxBlockOptionalMemMap[T, AXI4MasterPortParameters, AXI4SlavePortParameters, AXI4EdgeParameters, AXI4EdgeParameters, AXI4Bundle](params, _beatBytes, hasAXI4) with AXI4DspBlock {
  override val mem = if (hasAXI4) Some(AXI4RegisterNode(address = address, beatBytes = _beatBytes)) else None
  override def regmap(mapping: (Int, Seq[RegField])*): Unit = if (hasAXI4) mem.get.regmap(mapping:_*) else None
}


class TLLogMagMuxBlockOptionalMemMap[T <: Data : Real: BinaryRepresentation](val params: MAGParams[T], address: AddressSet, beatBytes: Int = 4, hasTL: Boolean)(implicit p: Parameters) extends LogMagMuxBlockOptionalMemMap[T, TLClientPortParameters, TLManagerPortParameters, TLEdgeOut, TLEdgeIn, TLBundle](params, beatBytes, hasTL) with TLDspBlock {
  val devname = "TLLogMagMuxBlockOptionalMemMap"
  val devcompat = Seq("LogMagMux", "radarDSP")
  val device = new SimpleDevice(devname, devcompat) {
    override def describe(resources: ResourceBindings): Description = {
      val Description(name, mapping) = super.describe(resources)
      Description(name, mapping)
    }
  }
  // make diplomatic TL node for regmap
  override val mem = if (hasTL) Some(TLRegisterNode(address = Seq(address), device = device, beatBytes = beatBytes)) else None
  override def regmap(mapping: (Int, Seq[RegField])*): Unit = if (hasTL) mem.get.regmap(mapping:_*) else None
}


object LogMagMuxDspBlockWithAXI4 extends App
{
  // here just define parameters
  val params: MAGParams[FixedPoint] =  MAGParams(
    protoIn  = FixedPoint(16.W, 8.BP),
    protoOut = FixedPoint(16.W, 8.BP),
    protoLog = Some(FixedPoint(16.W, 8.BP)),
    magType  = MagJPLandLogMag,
    log2LookUpWidth = 8,
    useLast = true,
    numAddPipes = 1,
    numMulPipes = 1
  )
  
  val baseAddress = 0x500
  implicit val p: Parameters = Parameters.empty
  
  val mag = LazyModule(new AXI4LogMagMuxBlockOptionalMemMap(params, AddressSet(baseAddress + 0x100, 0xFF), _beatBytes = 4, hasAXI4 = true) with dspblocks.AXI4StandaloneBlock {
    override def standaloneParams = AXI4BundleParameters(addrBits = 32, dataBits = 32, idBits = 1)
  })
  chisel3.Driver.execute(args, ()=> mag.module) // generate verilog code
}

object LogMagMuxDspBlockWithoutAXI4 extends App
{
  val params: MAGParams[FixedPoint] =  MAGParams(
    protoIn  = FixedPoint(16.W, 8.BP),
    protoOut = FixedPoint(16.W, 8.BP),
    protoLog = Some(FixedPoint(16.W, 8.BP)),
    magType  = MagJPLandLogMag,
    log2LookUpWidth = 8,
    useLast = true,
    numAddPipes = 1,
    numMulPipes = 1
  )
  val baseAddress = 0x500
  implicit val p: Parameters = Parameters.empty
  
  val mag = LazyModule(new AXI4LogMagMuxBlockOptionalMemMap(params, AddressSet(baseAddress + 0x100, 0xFF), _beatBytes = 4, hasAXI4 = false) with dspblocks.AXI4StandaloneBlock {
    override def standaloneParams = AXI4BundleParameters(addrBits = 32, dataBits = 32, idBits = 1)
  })
  chisel3.Driver.execute(args, ()=> mag.module) // generate verilog code  
}
