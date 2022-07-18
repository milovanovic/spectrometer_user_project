package dsputils

import chisel3._
import chisel3.util._

import dsptools._
import dsptools.numbers._

import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.util._      // AsyncQueue

// no memory mapped
class AsyncQueuePackerLazyModule[T <: Data : Real : BinaryRepresentation](val beatBytes: Int, gen: T, sync: Int = 3, depth: Int = 1024, cntrThreshold: Int = 512, safe: Boolean = true) extends LazyModule()(Parameters.empty) {

  val masterParams = AXI4StreamMasterParameters(
    name = "AXI4 Stream memory",
    n = 8, // 8 times 8 equal to 64
    u = 0,
    numMasters = 1
  )
  val streamNode = AXI4StreamMasterNode(masterParams)

  lazy val module = new LazyModuleImp(this) {
    val (out, _) = streamNode.out(0)
    val cntMax = (cntrThreshold - 1).U  // just temporary solution this is going to be a register
    val in_0_data = IO(Input(SInt(16.W))) // if this is 12 bits then everything changes
    val in_0_valid = IO(Input(Bool()))
    val in_1_data = IO(Input(SInt(16.W)))
    val in_1_valid = IO(Input(Bool()))
    val in_2_data = IO(Input(SInt(16.W)))
    val in_2_valid = IO(Input(Bool()))
    val in_3_data = IO(Input(SInt(16.W)))
    val in_3_valid = IO(Input(Bool()))
    val queueFull = IO(Output(Bool())) // this is actually readyIn, can be used as a pottential help
    // clock from LVS block
    val write_clock  = IO(Input(Clock()))
    // reset from LVDS block
    val write_reset = IO(Input(Bool()))

    val asyncQueue = Module(new AsyncQueueWithMem(gen, AsyncQueueWithMemParams(depth = depth, sync = sync, safe = safe)))
    val enq_valid = in_0_valid && in_1_valid && in_2_valid && in_3_valid
    val counter = RegInit(0.U(log2Ceil(depth).W)) // it should count on clock of 100 MHZ
    clock.suggestName("read_clock")
    reset.suggestName("read_reset")

    asyncQueue.io.deq_clock := clock //clock on which AXI4 side count
    asyncQueue.io.deq_reset := reset //clock on which AXI4 stream side work

    // Connect those signals
    asyncQueue.io.enq_clock := write_clock
    asyncQueue.io.enq_reset := write_reset
    queueFull := ~asyncQueue.io.enq.ready
    asyncQueue.io.enq.bits := Cat(in_0_data, in_1_data, in_2_data, in_3_data).asSInt
    asyncQueue.io.enq.valid := enq_valid

    out.valid := asyncQueue.io.deq.valid
    out.bits.data := asyncQueue.io.deq.bits.asUInt
    asyncQueue.io.deq.ready := out.ready
    //out.bits.keep := 1.U check those signals
    // strobe // check those signals
    val outFire = out.valid && out.ready
    when (out.valid && out.ready) {
      counter := counter + 1.U
    }
    val resetCnt = counter === cntMax && outFire // 1 clock cycle in any condition
    when (resetCnt) {
      counter := 0.U
    }
    out.bits.last := counter === cntMax // generate it with counter if ready out signal is not active and valid is active check it
  }

  val ioStreamNode = BundleBridgeSink[AXI4StreamBundle]()
        ioStreamNode := AXI4StreamToBundleBridge(AXI4StreamSlaveParameters()) := streamNode
        val outStream = InModuleBody { ioStreamNode.makeIO() }
}

object AsyncQueuePackerApp extends App
{
  // beatBytes are not defined
  implicit val p: Parameters = Parameters.empty
  val testModule = LazyModule(new AsyncQueuePackerLazyModule(4, SInt(64.W), 5, 4096))

  chisel3.Driver.execute(Array("--target-dir", "verilog", "--top-name", "AsyncQueuePacker"), ()=> testModule.module)
}



