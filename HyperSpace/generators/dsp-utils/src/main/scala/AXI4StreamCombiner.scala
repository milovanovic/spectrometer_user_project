package dsputils

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util.Cat

import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._

class AXI4StreamCombiner extends LazyModule()(Parameters.empty) {
  val streamNode = AXI4StreamNexusNode(
    masterFn = (ms: Seq[AXI4StreamMasterPortParameters]) => AXI4StreamMasterPortParameters(
      Seq(AXI4StreamMasterParameters(
        n = 16
    ))),
    slaveFn = ss => {AXI4StreamSlavePortParameters(ss.map(_.slaves).reduce(_ ++ _))}
  )

  lazy val module = new LazyModuleImp(this) {
    require(streamNode.out.length == 1, "Only one output is allowed")
    require(streamNode.in.length >= 1, "Module must have one or more inputs!")
    val (ins, _) = streamNode.in.unzip
    val (out, _) = streamNode.out.unzip

    println(s"Number of inputs: ${ins.length}")
    assert(ins.map{case (in) => ins.head.bits.last === in.bits.last}.reduce((a, b) => a & b), "All input last signals must be the same!")
    assert(ins.map{case (in) => ins.head.valid === in.valid}.reduce((a, b) => a & b), "All input valid signals must be the same!")

    out.head.valid     := ins.map {case (in) => in.valid }.reduce((a, b) => a && b)
    out.head.bits.last := ins.map{case (in) => in.bits.last}.reduce((a, b) => a && b)
    for (in <- ins) {
      in.ready := out.head.ready
    }
    out.head.bits.data := ins.map{case (in) => in.bits.data}.reduce((a, b) => Cat(a,b))
  }
}
trait AXI4StreamCombinerInOuts {

  self: AXI4StreamCombiner =>
  def nIn:  Int = 4
  def nOut: Int = 1
  def beatBytes: Int = 2

  val inIO: Seq[ModuleValue[AXI4StreamBundle]] = for (i <- 0 until nIn) yield {
    implicit val valName = ValName(s"inIO_$i")
    val in = BundleBridgeSource[AXI4StreamBundle](() => AXI4StreamBundle(AXI4StreamBundleParameters(n = beatBytes)))
     streamNode := BundleBridgeToAXI4Stream(AXI4StreamMasterPortParameters(AXI4StreamMasterParameters(n = beatBytes))) := in
    InModuleBody { in.makeIO() }
  }
  val outIO: Seq[ModuleValue[AXI4StreamBundle]] = for (o <- 0 until nOut) yield {
    implicit val valName = ValName(s"outIO_$o")
    val out = BundleBridgeSink[AXI4StreamBundle]()
    out := AXI4StreamToBundleBridge(AXI4StreamSlavePortParameters(AXI4StreamSlaveParameters())) := streamNode

    InModuleBody { out.makeIO() }
  }
}


object AXI4StreamCombinerApp extends App
{
  implicit val p: Parameters = Parameters.empty
  val lazyDut = LazyModule(new AXI4StreamCombiner with AXI4StreamCombinerInOuts{
    override def nIn  = 4
    override def nOut = 1
    override def beatBytes = 4
  })

  (new ChiselStage).execute(Array("--target-dir", "verilog/AXI4StreamCombiner"), Seq(ChiselGeneratorAnnotation(() => lazyDut.module)))
}
