// SPDX-License-Identifier: Apache-2.0

package magnitude

import chisel3._
import chisel3.experimental._

import dsptools.numbers._

import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._

trait MagStandaloneBlock extends MagBlock[FixedPoint] {

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

abstract class MagBlock [T <: Data : Real: BinaryRepresentation] (params: MAGParams[T]) extends LazyModule()(Parameters.empty) {

  require(params.magType == MagJPL || params.magType == LogMag)

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


object MagBlock extends App
{
  // here just define parameters
  val params: MAGParams[FixedPoint] =  MAGParams(
    protoIn  = FixedPoint(16.W, 8.BP),
    protoOut = FixedPoint(20.W, 8.BP),
    protoLog = None,
    magType  = MagJPL,
    useLast = true,
    numAddPipes = 1,
    numMulPipes = 1
  )

  val baseAddress = 0x500
  implicit val p: Parameters = Parameters.empty

  val mag = LazyModule(new MagBlock(params) with MagStandaloneBlock)
  chisel3.Driver.execute(args, ()=> mag.module)
}
