// SPDX-License-Identifier: Apache-2.0

package magnitude

import chisel3._
import chisel3.internal.requireIsHardware
import chisel3.util.{DecoupledIO, Queue, ShiftRegister, TransitName, log2Ceil}

// This code is taken from https://github.com/grebe/ofdm/blob/e89ae943c3525a2c932b3103055cc7bb20f18987/src/main/scala/ofdm/Skid.scala and adjusted to our design needs

object Skid {
  def apply[T <: Data](latency: Int, in: DecoupledIO[_ <: Data], out: DecoupledIO[T], en: Bool = true.B): T = {
    requireIsHardware(in)
    requireIsHardware(out)

    require(latency >= 0)
    if (latency == 0) {
      in.ready := out.ready
      out.valid := in.valid

      return out.bits
    }
    val latencyToDelay = if (latency % 2 == 0) latency + 1 else latency
  
    
    val queue = Module(new Queue(chiselTypeOf(out.bits), latencyToDelay + 1, pipe = latency == 1))
    val queueCounter = RegInit(0.U(log2Ceil(latency + 1).W))
    queueCounter := queueCounter +& in.fire() -& out.fire()
    queueCounter.suggestName("queueCounter")
    queue.io.enq.valid := ShiftRegister(in.fire(), latency, resetData = false.B, en = en)
    //assert(!queue.io.enq.valid || queue.io.enq.ready) // we control in.ready such that the queue can't fill up!

    // it can shift in one datum and shift out one datum at the same time
    //val latencyToCmp = if ()
    in.ready := (queueCounter < latencyToDelay.U) || (queueCounter === latencyToDelay.U && out.ready)
    queue.io.deq.ready := out.ready
    out.valid := queue.io.deq.valid
    out.bits := queue.io.deq.bits

    TransitName(queue.io.enq.bits, out)
  }
}
