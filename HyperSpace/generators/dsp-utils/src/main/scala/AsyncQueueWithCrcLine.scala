package dsputils

import chisel3._
import chisel3.util._

import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
//import freechips.rocketchip.util._

case class AsyncQueueCustomParams(
  radarDataWidth: Int = 16,
  isFullFlag: Boolean = false,
  sync: Int = 4,
  depth: Int = 2048,
  safe: Boolean = true
) {
  // add some requirements
}

trait AsyncQueueWithCRCLineStandalone extends AsyncQueueWithCrcLine {
  val ioStreamNode = BundleBridgeSink[AXI4StreamBundle]()
        ioStreamNode := AXI4StreamToBundleBridge(AXI4StreamSlaveParameters()) := streamNode
        val outStream = InModuleBody { ioStreamNode.makeIO() }
}

class AsyncQueueWithCrcLine(params: AsyncQueueCustomParams) extends LazyModule()(Parameters.empty) {

  val masterParams = AXI4StreamMasterParameters(
    name = "AXI4 Stream memory",
    n = 2, // 8 times 2 equal to 16
    u = 0,
    numMasters = 1
  )
  val streamNode = AXI4StreamMasterNode(masterParams)

  lazy val module = new LazyModuleImp(this) {
    val (out, _) = streamNode.out(0)
    val in_0_data = IO(Input(SInt(params.radarDataWidth.W))) // if this is 12 bits then everything changes
    val in_0_valid = IO(Input(Bool()))
    val crc_on_line_in = IO(Input(Bool()))
    val crc_on_line_out = IO(Output(Bool()))
    // this SInt can be UInt without problems
    val queueFull = if (params.isFullFlag) Some(IO(Output(Bool()))) else None // this is actually readyIn, can be used as a potential monitoring help
    // clock from LVDS side
    val write_clock  = IO(Input(Clock()))
    // reset from LVDS side
    val write_reset = IO(Input(Bool()))

    // SInt?
    val asyncQueue = Module(new AsyncQueueWithMem(SInt((params.radarDataWidth + 1).W), AsyncQueueWithMemParams(depth = params.depth, sync = params.sync, safe = params.safe)))

    asyncQueue.io.deq_clock := clock //clock on which AXI4 stream side work
    asyncQueue.io.deq_reset := reset.asBool //reset on which AXI4 stream side work

    // Connect those signals
    asyncQueue.io.enq_clock := write_clock
    asyncQueue.io.enq_reset := write_reset
    if (params.isFullFlag) {
      queueFull.get := ~asyncQueue.io.enq.ready
    }
    asyncQueue.io.enq.bits := Cat(crc_on_line_in, in_0_data).asSInt
    asyncQueue.io.enq.valid := in_0_valid

    out.valid := asyncQueue.io.deq.valid
    out.bits.data := asyncQueue.io.deq.bits((params.radarDataWidth-1), 0).asUInt //.asUInt
    crc_on_line_out := asyncQueue.io.deq.bits(params.radarDataWidth)
    asyncQueue.io.deq.ready := out.ready
  }

//   val ioStreamNode = BundleBridgeSink[AXI4StreamBundle]()
//         ioStreamNode := AXI4StreamToBundleBridge(AXI4StreamSlaveParameters()) := streamNode
//         val outStream = InModuleBody { ioStreamNode.makeIO() }
}

object AsyncQueueWithCrcLineApp extends App
{
  implicit val p: Parameters = Parameters.empty

  val params: AsyncQueueCustomParams = AsyncQueueCustomParams()
  val testModule = LazyModule(new AsyncQueueWithCrcLine(params) with AsyncQueueWithCRCLineStandalone)

  chisel3.Driver.execute(Array("--target-dir", "verilog", "--top-name", "AsyncQueueWithCrcLine"), ()=> testModule.module)
}
