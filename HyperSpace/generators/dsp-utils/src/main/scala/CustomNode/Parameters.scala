// SPDX-License-Identifier: Apache-2.0

package dsputils.node

import chisel3.internal.sourceinfo.SourceInfo
import chisel3.util.log2Ceil
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.util.AsyncQueueParams
import freechips.rocketchip.amba.axi4stream._

import scala.math.max

/**
  * Parameters case class for AXI4 Stream bundles (slave side)
  * @param numEndpoints number of endpoints for the purposes of the dest field
  * @param hasData bundle includes the data field
  * @param hasCtrl bundle includes the control field
  * @param hasStrb bundle includes the strobe field
  * @param hasKeep bundle includes the keep field
  * @param nodePath path of nodes that got us here
  * @param alwaysReady this interface is always ready when reset is not asserted
  * @param interleavedIdDest maximum number of transactions with unique
  *                          id/dest pairs that can be in flight at once
  */
case class DataStreamSlaveParameters(
  numEndpoints: Int = 1,
  hasData: Boolean = true,
  hasCtrl: Boolean = false,
  hasStrb: Boolean = false,
  hasKeep: Boolean = false,
  nodePath: Seq[BaseNode] = Seq(),
  alwaysReady: Boolean = false,
  interleavedIdDest: Option[Int] = None)
{
  require(numEndpoints >= 1)
  interleavedIdDest.foreach { x => require(x >= 0) }

  /**
    * Combine two parameters objects. If a field is present in either, it is present
    * in the output. The number of endpoints is the sum. For interleavedIdDest, find the min.
    * @param in parameters for another slave
    * @return
    */
  def union(in: DataStreamSlaveParameters):DataStreamSlaveParameters =
    DataStreamSlaveParameters(
      numEndpoints + in.numEndpoints,
      hasData || in.hasData,
      hasCtrl || in.hasCtrl,
      hasStrb || in.hasStrb,
      hasKeep || in.hasKeep,
      // TODO this is bad
      nodePath ++ in.nodePath,
      alwaysReady && in.alwaysReady,
      (interleavedIdDest, in.interleavedIdDest) match {
        case (Some(mine), Some(theirs)) => Some(mine min theirs)
        case (Some(mine), _)            => Some(mine)
        case (_         , Some(theirs)) => Some(theirs)
        case _                          => None
      }
  )

  val name: String = nodePath.lastOption.map(_.lazyModule.name).getOrElse("disconnected")
}

case class DataStreamSlavePortParameters(
  slaves: Seq[DataStreamSlaveParameters] = Seq(DataStreamSlaveParameters()))
{
  val slaveParams: DataStreamSlaveParameters = slaves.reduce((x, y) => x.union(y))
}

object DataStreamSlavePortParameters {
  def apply(p: DataStreamSlaveParameters): DataStreamSlavePortParameters = {
    DataStreamSlavePortParameters(Seq(p))
  }
}

/**
  * Parameters case class for AXI4 Stream bundles (master side)
  * @param name Name of master
  * @param n sets width of data, strb, keep, etc.
  * @param c sets width of conotrol bits
  * @param u sets width of user
  * @param numMasters number of entry points for purposes of id
  * @param nodePath path of nodes that got us here
  */
case class DataStreamMasterParameters(
  name: String = "",
  n: Int = 8,
  c: Int = 1,
  u: Int = 0,
  numMasters: Int = 1,
  nodePath: Seq[BaseNode] = Seq())
{
  require(n >= 0)
  require(c >= 0)
  require(u >= 0)
  require(numMasters >= 1)

  /**
    * Combine two parameters objects. Choose the max widths and add the number of masters.
    * @param in parameters to be merged with
    * @return
    */
  def union(in: DataStreamMasterParameters): DataStreamMasterParameters = {
    DataStreamMasterParameters(
      name + "|" + in.name,
      n max in.n,
      c max in.c,
      u max in.u,
      numMasters + in.numMasters,
      // TODO this is bad
      nodePath ++ in.nodePath
    )
  }
}

case class DataStreamMasterPortParameters(
  masters: Seq[DataStreamMasterParameters] = Seq(DataStreamMasterParameters()))
{
  val masterParams: DataStreamMasterParameters = masters.reduce((x, y) => x.union(y))
}

object DataStreamMasterPortParameters {
  def apply(p: DataStreamMasterParameters): DataStreamMasterPortParameters = {
    DataStreamMasterPortParameters(Seq(p))
  }
}

/**
  * Parameters case class for AXI4 Stream bundles
  * @param n sets width of data, strb, keep, etc.
  * @param c sets width of control bits
  * @param i sets width of id field
  * @param d sets width of dest field
  * @param u sets width of user field
  * @param hasData bundle includes the data field
  * @param hasCtrl bundle includes the control field
  * @param hasStrb bundle includes the strobe field
  * @param hasKeep bundle includes the keep field
  */
case class DataStreamBundleParameters(
  n: Int,
  c: Int = 1,
  i: Int = 0,
  d: Int = 0,
  u: Int = 0,
  hasData: Boolean = true,
  hasCtrl: Boolean = false,
  hasStrb: Boolean = false,
  hasKeep: Boolean = false)
{
  require (n >= 0, s"DataStream data bytes must be non-negative (got $n)")
  require (c >= 0, s"DataStream control bits must be non-negative (got $c)")
  require (i >= 0, s"DataStream id bits must be non-negative (got $i)")
  require (d >= 0, s"DataStream dest bits must be non-negative (got $d)")
  require (u >= 0, s"DataStream user bits must be non-negative (got $u)")

  val dataBits: Int = if (hasData) 8 * n else 0
  val ctrlBits: Int = if (hasCtrl) c     else 0
  val strbBits: Int = if (hasStrb) n     else 0
  val keepBits: Int = if (hasKeep) n     else 0

  /**
    * Combine two parameters objects. Choose max of widths. If a field is present in
    * either object, include it in the combined object.
    * @param x parameters to be merged with
    * @return
    */
  def union(x: DataStreamBundleParameters) =
    DataStreamBundleParameters(
      max(n, x.n),
      max(c, x.c),
      max(i, x.i),
      max(d, x.d),
      max(u, x.u),
      hasData || x.hasData,
      hasCtrl || x.hasCtrl,
      hasStrb || x.hasStrb,
      hasKeep || x.hasKeep)
}

object DataStreamBundleParameters
{
  /**
    * Parameters for bundle with no fields
    */
  val emptyBundleParameters = DataStreamBundleParameters(
    n = 0, c = 0, i = 0, d = 0, u =0,
    hasData = false, hasCtrl = false, hasStrb = false, hasKeep = false)

  /**
    * Combine master and slave port parameters.
    * Set id width to number of bits needed for numMasters and dest width to number of bits needed for numEndpoints
    * @param master master port parameters
    * @param slave slave port parameters
    * @return
    */
  def joinEdge(master: DataStreamMasterPortParameters, slave: DataStreamSlavePortParameters): DataStreamBundleParameters = {
    val m = master.masterParams
    val s = slave.slaveParams

    DataStreamBundleParameters(
      m.n,
      m.c,
      log2Ceil(m.numMasters),
      log2Ceil(s.numEndpoints),
      m.u,
      s.hasData,
      s.hasCtrl,
      s.hasStrb,
      s.hasKeep)
  }
}

case class DataStreamEdgeParameters(
  master: DataStreamMasterPortParameters,
  slave:  DataStreamSlavePortParameters,
  p: Parameters,
  sourceInfo: SourceInfo)
{
  val bundle: DataStreamBundleParameters = DataStreamBundleParameters.joinEdge(master, slave)
}

case class DataStreamAsyncSlavePortParameters(async: AsyncQueueParams, base: DataStreamSlavePortParameters)
object DataStreamAsyncSlavePortParameters {
  def apply(async: AsyncQueueParams, base: DataStreamSlaveParameters): DataStreamAsyncSlavePortParameters =
    DataStreamAsyncSlavePortParameters(async, DataStreamSlavePortParameters(Seq(base)))
}
case class DataStreamAsyncMasterPortParameters(base: DataStreamMasterPortParameters)
object DataStreamAsyncMasterPortParameters {
  def apply(base: DataStreamMasterParameters): DataStreamAsyncMasterPortParameters =
    DataStreamAsyncMasterPortParameters(DataStreamMasterPortParameters(Seq(base)))
}

case class DataStreamAsyncBundleParameters(async: AsyncQueueParams, base: DataStreamBundleParameters)
case class DataStreamAsyncEdgeParameters
(
  master: DataStreamAsyncMasterPortParameters,
  slave: DataStreamAsyncSlavePortParameters,
  params: Parameters,
  sourceInfo: SourceInfo
) {
  val bundle =
    DataStreamAsyncBundleParameters(slave.async, DataStreamBundleParameters.joinEdge(master.base, slave.base))
}

case class DataStreamBufferParams(p: BufferParams = BufferParams.none) extends DirectedBuffers[DataStreamBufferParams] {
  // no channels in
  override def copyIn(x: BufferParams): DataStreamBufferParams = this.copy()

  // only one channel, and it is out
  override def copyOut(x: BufferParams): DataStreamBufferParams = this.copy(p = x)

  override def copyInOut(x: BufferParams): DataStreamBufferParams = this.copyIn(x).copyOut(x)
}