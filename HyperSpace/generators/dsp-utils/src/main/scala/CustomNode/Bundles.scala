// SPDX-License-Identifier: Apache-2.0

package dsputils.node

import chisel3._
import chisel3.util._
import freechips.rocketchip.util.{AsyncBundle, GenericParameterizedBundle}
import freechips.rocketchip.amba.axi4stream._

/**
  * Base class for all DataStream bundles
  * @param params Bundle parameters
  */
abstract class DataStreamBundleBase(params: DataStreamBundleParameters) extends GenericParameterizedBundle(params)

/**
  * All fields of the AXI4 Stream interface except ready and valid
  * @param params Bundle parameters
  */
class DataStreamBundlePayload(params: DataStreamBundleParameters) extends DataStreamBundleBase(params)
{
  val data = Output(UInt(params.dataBits.W))
  val ctrl = Output(UInt(params.ctrlBits.W))
  val strb = Output(UInt(params.strbBits.W))
  val keep = Output(UInt(params.keepBits.W))
  val last = Output(Bool())
  val id   = Output(UInt(params.i.W))
  val dest = Output(UInt(params.d.W))
  val user = Output(UInt(params.u.W))

  def makeStrb: UInt = if (params.hasStrb) strb else ((BigInt(1) << params.n) - 1).U
}

/**
  * AXI4 Stream bundle with ready and valid
  * @param params Bundle parameters
  */
class DataStreamBundle(val params: DataStreamBundleParameters) extends IrrevocableIO(new DataStreamBundlePayload(params)) {
  override def cloneType= new DataStreamBundle(params).asInstanceOf[this.type]
}

/**
  * AXI4 Stream bundle with valid only (no ready)
  * @param params Bundle parameters
  */
class DataStreamValidBundle(val params: DataStreamBundleParameters) extends ValidIO(new DataStreamBundlePayload(params)) {
  override def cloneType = new DataStreamValidBundle(params).asInstanceOf[this.type]
}

object DataStreamBundle
{
  /**
    * Factory for making DataStreamBundle
    * @param params Bundle parameters
    * @return
    */
  def apply(params: DataStreamBundleParameters) = new DataStreamBundle(params)
}

object DataStreamValidBundle
{
  /**
    * Factory for Making DataStreamValidBundle
    * @param params Bundle parameters
    * @return
    */
  def apply(params: DataStreamBundleParameters) = new DataStreamValidBundle(params)
}

/**
  * Async bundle for DataStream
  * @param params
  */
class DataStreamAsyncBundle(params: DataStreamAsyncBundleParameters)
  extends AsyncBundle(new DataStreamBundlePayload(params.base).cloneType, params.async) {
  override def cloneType: this.type = new DataStreamAsyncBundle(params).asInstanceOf[this.type]
}

object DataStreamAsyncBundle {
  /**
    * Factory for making DataStreamAsyncBundle
    * @param params
    * @return
    */
  def apply(params: DataStreamAsyncBundleParameters) = new DataStreamAsyncBundle(params)
}
