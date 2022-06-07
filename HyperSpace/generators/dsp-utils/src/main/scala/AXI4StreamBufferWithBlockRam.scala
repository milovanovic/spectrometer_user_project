package dsputils

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.diplomacy._



class AXI4StreamBufferWithBlockRam(params: BufferParams) extends LazyModule()(Parameters.empty){
  val node = AXI4StreamIdentityNode()

  lazy val module = new LazyModuleImp(this) {
    (node.in zip node.out) foreach { case ((in, _), (out, _)) =>
      if (params.isDefined) {
        val queue = QueueWithSyncReadMem.irrevocable(in, params.depth, pipe=params.pipe, flow=params.flow, useSyncReadMem=true, useBlockRam=true)
        out.valid := queue.valid
        out.bits := queue.bits
        queue.ready := out.ready
      } else {
        out.valid := in.valid
        out.bits := in.bits
        in.ready := out.ready
      }
    }
  }
}

object AXI4StreamBufferWithBlockRam {
  def apply(): AXI4StreamNode = apply(BufferParams.default)
  def apply(p: BufferParams): AXI4StreamNode = {
    val buffer = LazyModule(new AXI4StreamBufferWithBlockRam(p))
    buffer.node
  }
}
