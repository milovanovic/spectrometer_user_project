package dsputils

import chisel3._
import chisel3.util._

import dsptools._
import dsptools.numbers._

import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.util._      // AsyncQueue

trait AsyncQueueAXI4StreamOutStandalone extends AsyncQueueAXI4StreamOut {
  val ioStreamNode = BundleBridgeSink[AXI4StreamBundle]()
        ioStreamNode := AXI4StreamToBundleBridge(AXI4StreamSlaveParameters()) := streamNode
        val outStream = InModuleBody { ioStreamNode.makeIO() }
}

// no memory mapped
class AsyncQueueAXI4StreamOut(val params: AsyncQueueCustomParams) extends LazyModule()(Parameters.empty) {

  val masterParams = AXI4StreamMasterParameters(
    name = "AXI4 Stream memory",
    n = 2, // 2 times 8 equal to 16
    u = 0,
    numMasters = 1
  )
  val streamNode = AXI4StreamMasterNode(masterParams)

  lazy val module = new LazyModuleImp(this) {
    val (out, _) = streamNode.out(0)

    val in_data = IO(Input(SInt(params.radarDataWidth.W))) // if this is 12 bits then everything changes
    val in_valid = IO(Input(Bool()))

    val queueFull = if (params.isFullFlag) Some(IO(Output(Bool()))) else None // this is actually readyIn, can be used for debug purposes
    // clock from LVDS block
    val write_clock  = IO(Input(Clock()))
    // reset from LVDS block
    val write_reset = IO(Input(Bool()))

    val asyncQueue = Module(new AsyncQueueWithMem(SInt(params.radarDataWidth.W), AsyncQueueWithMemParams(depth = params.depth, sync = params.sync, safe = params.safe)))
    val enq_valid = in_valid
    clock.suggestName("read_clock")
    reset.suggestName("read_reset")

    asyncQueue.io.deq_clock := clock //clock on which AXI4 side count
    asyncQueue.io.deq_reset := reset.asBool //reset on which AXI4 stream side work

    // Connect those signals
    asyncQueue.io.enq_clock := write_clock
    asyncQueue.io.enq_reset := write_reset

    if (params.isFullFlag) {
      queueFull.get := ~asyncQueue.io.enq.ready
    }

    asyncQueue.io.enq.bits := in_data
    asyncQueue.io.enq.valid := enq_valid

    out.valid := asyncQueue.io.deq.valid
    out.bits.data := asyncQueue.io.deq.bits.asUInt
    asyncQueue.io.deq.ready := out.ready
  }
}

object AsyncQueueAXI4StreamOutApp extends App
{
  val params: AsyncQueueCustomParams = AsyncQueueCustomParams()

  implicit val p: Parameters = Parameters.empty
  val testModule = LazyModule(new AsyncQueueAXI4StreamOut(params) with AsyncQueueAXI4StreamOutStandalone)

  chisel3.Driver.execute(Array("--target-dir", "verilog", "--top-name", "AsyncQueueAXI4StreamOut"), ()=> testModule.module)
}



