package dsputils

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

import chisel3.util.Cat

import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._


class AXI4StreamCustomCombiner(beatBytes: Int) extends LazyModule()(Parameters.empty) {

  val streamNodein1 = AXI4StreamSlaveNode(AXI4StreamSlaveParameters())
  val streamNodein2 = AXI4StreamSlaveNode(AXI4StreamSlaveParameters())

  val streamNode = AXI4StreamMasterNode(Seq(AXI4StreamMasterPortParameters(Seq(AXI4StreamMasterParameters("out", n = 2*beatBytes)))))

  lazy val module = new LazyModuleImp(this) {
    val out = streamNode.out(0)._1
    val in1 = streamNodein1.in(0)._1
    val in2 = streamNodein2.in(0)._1

    //assert(in1.valid === in2.valid, "All input valid signals must be the same!")

    out.valid := in1.valid && in2.valid
    out.bits.last := in2.bits.last
    in2.ready := out.ready

    in1.ready := out.ready && in2.fire()
    in2.ready := out.ready
    out.bits.data := Cat(in1.bits.data, in2.bits.data)
  }
}

trait AXI4StreamCustomCombinerStandaloneBlock extends AXI4StreamCustomCombiner {

  val ioInNode1 = BundleBridgeSource(() => new AXI4StreamBundle(AXI4StreamBundleParameters(n = 4)))
  streamNodein1 := BundleBridgeToAXI4Stream(AXI4StreamMasterParameters(n = 4)) := ioInNode1
  val in1 = InModuleBody { ioInNode1.makeIO() }

  val ioInNode2 = BundleBridgeSource(() => new AXI4StreamBundle(AXI4StreamBundleParameters(n = 4)))
  streamNodein2 := BundleBridgeToAXI4Stream(AXI4StreamMasterParameters(n = 4)) := ioInNode2
  val in2 = InModuleBody { ioInNode2.makeIO() }

  val ioStreamNode = BundleBridgeSink[AXI4StreamBundle]()
    ioStreamNode :=
    AXI4StreamToBundleBridge(AXI4StreamSlaveParameters()) := streamNode
  val out= InModuleBody { ioStreamNode.makeIO() }
}

object AXI4StreamCustomCombinerApp extends App
{
  implicit val p: Parameters = Parameters.empty
  val lazyDut = LazyModule(new AXI4StreamCustomCombiner(beatBytes = 4) with AXI4StreamCustomCombinerStandaloneBlock)

  (new ChiselStage).execute(Array("--target-dir", "verilog/AXI4StreamCombiner"), Seq(ChiselGeneratorAnnotation(() => lazyDut.module)))
}
