package dsputils

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

import chisel3.util.Cat

import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._


class AXI4StreamSimpleSplitter(beatBytes: Int) extends LazyModule()(Parameters.empty) {

  // replace those nodes to nexus nodes
  val streamNodeIn1  = AXI4StreamSlaveNode(AXI4StreamSlaveParameters())
  val streamNodeOut1 = AXI4StreamMasterNode(Seq(AXI4StreamMasterPortParameters(Seq(AXI4StreamMasterParameters("out", n = beatBytes)))))
  val streamNodeOut2 = AXI4StreamMasterNode(Seq(AXI4StreamMasterPortParameters(Seq(AXI4StreamMasterParameters("out", n = beatBytes)))))

  lazy val module = new LazyModuleImp(this) {
    val out1 = streamNodeOut1.out(0)._1
    val out2 = streamNodeOut2.out(0)._1
    val in1 = streamNodeIn1.in(0)._1

    out1.valid := in1.valid // fft input
    out2.valid := in1.valid && in1.ready // buffer input
    in1.ready  := out1.ready && out2.ready

    out1.bits := in1.bits
    out2.bits := in1.bits
  }
}

trait AXI4StreamSimpleSplitterStandaloneBlock extends AXI4StreamSimpleSplitter {

  val ioInNode1 = BundleBridgeSource(() => new AXI4StreamBundle(AXI4StreamBundleParameters(n = 4)))
  streamNodeIn1 := BundleBridgeToAXI4Stream(AXI4StreamMasterParameters(n = 4)) := ioInNode1
  val in1 = InModuleBody { ioInNode1.makeIO() }

  val ioStreamOutNode1 = BundleBridgeSink[AXI4StreamBundle]()
    ioStreamOutNode1 :=
    AXI4StreamToBundleBridge(AXI4StreamSlaveParameters()) := streamNodeOut1

  val ioStreamOutNode2 = BundleBridgeSink[AXI4StreamBundle]()
    ioStreamOutNode2 :=
    AXI4StreamToBundleBridge(AXI4StreamSlaveParameters()) := streamNodeOut2

  val out1= InModuleBody { ioStreamOutNode1.makeIO() }
  val out2= InModuleBody { ioStreamOutNode2.makeIO() }
}

object  AXI4StreamSimpleSplitterApp extends App
{
  implicit val p: Parameters = Parameters.empty
  val lazyDut = LazyModule(new AXI4StreamSimpleSplitter(beatBytes = 4) with AXI4StreamSimpleSplitterStandaloneBlock)

  (new ChiselStage).execute(Array("--target-dir", "verilog/AXI4StreamCombiner"), Seq(ChiselGeneratorAnnotation(() => lazyDut.module)))
}
