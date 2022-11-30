package dsputils

import chisel3._
import chisel3.util._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}

import dsputils.node._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._

case class AsyncQueueWithControlLineParams(
  dataBytes  : Int,
  ctrlBits   : Int,
  isFullFlag : Boolean,
  // AsyncQueue params
  sync       : Int,
  depth      : Int,
  safe       : Boolean
) {
  // add some requirements
}

class AsyncQueueWithControlLine(params: AsyncQueueWithControlLineParams) extends LazyModule()(Parameters.empty) {
  // Master Node parameters
  val masterParams = DataStreamMasterParameters(
    name = "outStream",
    n    = params.dataBytes,
    c    = params.ctrlBits,
    u    = 0,
    numMasters = 1
  )
  val streamNode = DataStreamMasterNode(masterParams)

  lazy val module = new LazyModuleImp(this) {
    // Output
    val (out, _) = streamNode.out(0)

    // Input
    val in_data  = IO(Input(chiselTypeOf(out.bits.data)))
    val in_valid = IO(Input(Bool()))
    val in_ctrl  = IO(Input(chiselTypeOf(out.bits.ctrl)))
    
    // Optional QueueFull flag (~in.ready), can be used as a potential monitoring help
    val queueFull = if (params.isFullFlag) Some(IO(Output(Bool()))) else None
    
    // Clock & reset (Write side)
    val write_clock  = IO(Input(Clock()))
    val write_reset = IO(Input(Bool()))

    // AsyncQueue
    val asyncQueue = Module(new AsyncQueueWithMem(chiselTypeOf(Cat(out.bits.ctrl, out.bits.data)), AsyncQueueWithMemParams(depth = params.depth, sync = params.sync, safe = params.safe)))

    // Connect asyncQueue (Write side)
    asyncQueue.io.enq_clock := write_clock
    asyncQueue.io.enq_reset := write_reset
    asyncQueue.io.enq.bits  := Cat(in_ctrl, in_data).asUInt
    asyncQueue.io.enq.valid := in_valid
    if (params.isFullFlag) {
      queueFull.get := ~asyncQueue.io.enq.ready
    }

    // Connect asyncQueue (Read side)
    asyncQueue.io.deq_clock := clock
    asyncQueue.io.deq_reset := reset.asBool
    asyncQueue.io.deq.ready := out.ready
    out.valid     := asyncQueue.io.deq.valid
    out.bits.data := asyncQueue.io.deq.bits((out.bits.data.getWidth - 1), 0).asUInt
    out.bits.ctrl := asyncQueue.io.deq.bits(out.bits.data.getWidth + out.bits.ctrl.getWidth - 1, out.bits.data.getWidth)
  }
}

trait AsyncQueueWithControlLineStandalone extends AsyncQueueWithControlLine {
  implicit val valName = ValName(s"out")
  val ioStreamNode = BundleBridgeSink[DataStreamBundle]()
  ioStreamNode := DataStreamToBundleBridge(DataStreamSlaveParameters(hasCtrl = true)) := streamNode
  val outStream = InModuleBody { ioStreamNode.makeIO() }
}

object AsyncQueueWithControlLineApp extends App
{
  implicit val p: Parameters = Parameters.empty

  val params: AsyncQueueWithControlLineParams = AsyncQueueWithControlLineParams(
    dataBytes  = 8,
    ctrlBits   = 3,
    isFullFlag = false,
    sync       = 4,
    depth      = 2048,
    safe       = true
  )
  val lazyDUT = LazyModule(new AsyncQueueWithControlLine(params) with AsyncQueueWithControlLineStandalone)
  (new ChiselStage).execute(Array("--target-dir", "verilog/AsyncQueueWithControlLine"), Seq(ChiselGeneratorAnnotation(() => lazyDUT.module)))
}