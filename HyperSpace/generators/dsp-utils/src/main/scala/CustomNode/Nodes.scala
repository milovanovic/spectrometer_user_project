// SPDX-License-Identifier: Apache-2.0

package dsputils.node

import chisel3.internal.sourceinfo.SourceInfo
import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.util.AsyncQueueParams
import freechips.rocketchip.amba.axi4stream._

/**
  * Implementation of Node for AXI4 Stream
  */
object DataStreamImp extends SimpleNodeImp[DataStreamMasterPortParameters, DataStreamSlavePortParameters, DataStreamEdgeParameters, DataStreamBundle]
{
  def edge(pd: DataStreamMasterPortParameters, pu: DataStreamSlavePortParameters, p: Parameters, sourceInfo: SourceInfo): DataStreamEdgeParameters = DataStreamEdgeParameters(pd, pu, p, sourceInfo)
  def bundle(e: DataStreamEdgeParameters): DataStreamBundle = DataStreamBundle(e.bundle)
  def render(e: DataStreamEdgeParameters) = RenderedEdge(colour = "#0033ff", label = e.master.masterParams.n.toString)

  def colour = "#00ccdd"

  override def mixO(pd: DataStreamMasterPortParameters, node: OutwardNode[DataStreamMasterPortParameters, DataStreamSlavePortParameters, DataStreamBundle]): DataStreamMasterPortParameters =
    pd.copy(masters = pd.masters.map { c => c.copy (nodePath = node +: c.nodePath) })
  override def mixI(pu: DataStreamSlavePortParameters, node: InwardNode[DataStreamMasterPortParameters, DataStreamSlavePortParameters, DataStreamBundle]): DataStreamSlavePortParameters =
    pu.copy(slaves = pu.slaves.map { m => m.copy (nodePath = node +: m.nodePath) })
}

case class DataStreamIdentityNode()(implicit valName: ValName) extends IdentityNode(DataStreamImp)()
case class DataStreamMasterNode(portParams: Seq[DataStreamMasterPortParameters])(implicit valName: ValName) extends SourceNode(DataStreamImp)(portParams)
object DataStreamMasterNode {
  def apply(p: DataStreamMasterPortParameters)(implicit valName: ValName): DataStreamMasterNode = {
    DataStreamMasterNode(Seq(p))
  }
  def apply(p: DataStreamMasterParameters)(implicit valName: ValName): DataStreamMasterNode = {
    DataStreamMasterNode(DataStreamMasterPortParameters(p))
  }
}
case class DataStreamSlaveNode(portParams: Seq[DataStreamSlavePortParameters])(implicit valName: ValName) extends SinkNode(DataStreamImp)(portParams)
object DataStreamSlaveNode {
  def apply(p: DataStreamSlavePortParameters)(implicit valName: ValName): DataStreamSlaveNode = {
    DataStreamSlaveNode(Seq(p))
  }
  def apply(p: DataStreamSlaveParameters)(implicit valName: ValName): DataStreamSlaveNode = {
    DataStreamSlaveNode(DataStreamSlavePortParameters(p))
  }
}

object DataStreamNameNode {
  def apply(name: ValName) = DataStreamIdentityNode()(name)
  def apply(name: Option[String]): DataStreamIdentityNode = apply(ValName(name.getOrElse("with_no_name")))
  def apply(name: String): DataStreamIdentityNode = apply(Some(name))
}

case class DataStreamNexusNode(
  masterFn: Seq[DataStreamMasterPortParameters] => DataStreamMasterPortParameters,
  slaveFn:  Seq[DataStreamSlavePortParameters]  => DataStreamSlavePortParameters
)(implicit valName: ValName) extends NexusNode(DataStreamImp)(masterFn, slaveFn)

case class DataStreamAdapterNode(
  masterFn: DataStreamMasterPortParameters => DataStreamMasterPortParameters,
  slaveFn:  DataStreamSlavePortParameters  => DataStreamSlavePortParameters)(implicit valName: ValName)
  extends AdapterNode(DataStreamImp)(masterFn, slaveFn)

object DataStreamAdapterNode {
  def widthAdapter(in: DataStreamMasterPortParameters, dataWidthConversion: Int => Int): DataStreamMasterPortParameters = {
    val masters = in.masters
    val newMasters = masters.map { m =>
      val n = m.n
      m.copy(n = dataWidthConversion(n))
    }
    DataStreamMasterPortParameters(newMasters)
  }
}

object DataStreamAsyncImp extends
  SimpleNodeImp[
    DataStreamAsyncMasterPortParameters,
    DataStreamAsyncSlavePortParameters,
    DataStreamAsyncEdgeParameters,
    DataStreamAsyncBundle
  ] {
  def edge(
            pd: DataStreamAsyncMasterPortParameters,
            pu: DataStreamAsyncSlavePortParameters,
            p: Parameters,
            sourceInfo: SourceInfo): DataStreamAsyncEdgeParameters = {
     DataStreamAsyncEdgeParameters(pd, pu, p, sourceInfo)
  }

  override def bundle(e: DataStreamAsyncEdgeParameters): DataStreamAsyncBundle =
    DataStreamAsyncBundle(e.bundle)

  override def render(e: DataStreamAsyncEdgeParameters): RenderedEdge =
    RenderedEdge(colour = "#ffcc00", label = e.slave.async.depth.toString)

  override def mixO(
                     pd: DataStreamAsyncMasterPortParameters,
                     node: OutwardNode[
                       DataStreamAsyncMasterPortParameters,
                       DataStreamAsyncSlavePortParameters,
                       DataStreamAsyncBundle]
                   ): DataStreamAsyncMasterPortParameters = {
    pd.copy(base = pd.base.copy(masters = pd.base.masters.map { c => c.copy(nodePath = node +: c.nodePath) }))
  }

  override def mixI(
    pu: DataStreamAsyncSlavePortParameters,
    node: InwardNode[
      DataStreamAsyncMasterPortParameters,
      DataStreamAsyncSlavePortParameters,
      DataStreamAsyncBundle]
                   ): DataStreamAsyncSlavePortParameters = {
    pu.copy(base = pu.base.copy(slaves = pu.base.slaves.map { c => c.copy(nodePath = node +: c.nodePath) }))
  }
}

case class DataStreamAsyncSourceNode(sync: Option[Int])(implicit valName: ValName)
  extends MixedAdapterNode(DataStreamImp, DataStreamAsyncImp)(
    dFn = { p => DataStreamAsyncMasterPortParameters(p) },
    uFn = { p => p.base.copy() }
  )

case class DataStreamAsyncSinkNode(async: AsyncQueueParams)(implicit valName: ValName)
  extends MixedAdapterNode(DataStreamAsyncImp, DataStreamImp)(
    dFn = { p => p.base },
    uFn = { p => DataStreamAsyncSlavePortParameters(async, p) }
  )

case class DataStreamAsyncIdentityNode()(implicit valName: ValName) extends IdentityNode(DataStreamAsyncImp)()

object DataStreamAsyncNameNode {
  def apply(name: ValName) = DataStreamAsyncIdentityNode()(name)
  def apply(name: Option[String]): DataStreamAsyncIdentityNode = apply(ValName(name.getOrElse("with_no_name")))
  def apply(name: String): DataStreamAsyncIdentityNode = apply(Some(name))
}

object DataStreamBundleBridgeImp extends BundleBridgeImp[DataStreamBundle]

case class DataStreamToBundleBridgeNode(slaveParams: DataStreamSlavePortParameters)(implicit valName: ValName)
extends MixedAdapterNode(DataStreamImp, DataStreamBundleBridgeImp)(
  dFn = { masterParams =>
      BundleBridgeParams(() => DataStreamBundle(DataStreamBundleParameters.joinEdge(masterParams, slaveParams)))
  },
  uFn = { mp => slaveParams }
)

object DataStreamToBundleBridgeNode {
  def apply(slaveParams: DataStreamSlaveParameters)(implicit p: Parameters) =
    new DataStreamToBundleBridge(DataStreamSlavePortParameters(slaveParams))
}

class DataStreamToBundleBridge(slaveParams: DataStreamSlavePortParameters)(implicit p: Parameters) extends LazyModule {
  val node = DataStreamToBundleBridgeNode(slaveParams)

  lazy val module = new LazyModuleImp(this) {
    (node.in zip node.out) foreach { case ((in, _), (out, _)) =>
      out.valid := in.valid
      out.bits := in.bits
      in.ready := out.ready
    }
  }
}

object DataStreamToBundleBridge {
  def apply(slaveParams: DataStreamSlavePortParameters)(implicit p: Parameters): DataStreamToBundleBridgeNode = {
    val converter = LazyModule(new DataStreamToBundleBridge(slaveParams))
    converter.node
  }
  def apply(slaveParams: DataStreamSlaveParameters)(implicit p: Parameters): DataStreamToBundleBridgeNode = {
    apply(DataStreamSlavePortParameters(slaveParams))
  }
}

case class BundleBridgeToDataStreamNode(masterParams: DataStreamMasterPortParameters)(implicit valName: ValName)
extends MixedAdapterNode(DataStreamBundleBridgeImp, DataStreamImp)(
  dFn = { mp =>
    masterParams
  },
  uFn = { slaveParams => BundleBridgeParams(None) }// BundleBridgeParams(() => DataStreamBundle(DataStreamBundleParameters.joinEdge(masterParams, slaveParams)))}
)

object BundleBridgeToDataStreamNode {
  def apply(masterParams: DataStreamMasterParameters)(implicit valName: ValName): BundleBridgeToDataStreamNode = {
    BundleBridgeToDataStreamNode(DataStreamMasterPortParameters(masterParams))
  }
}

class BundleBridgeToDataStream(masterParams: DataStreamMasterPortParameters)(implicit p: Parameters) extends LazyModule {
  val node = BundleBridgeToDataStreamNode(masterParams)

  lazy val module = new LazyModuleImp(this) {
    (node.in zip node.out) foreach { case ((in, _), (out, _)) =>
        out.valid := in.valid
        out.bits := in.bits
        in.ready := out.ready
    }
  }
}

object BundleBridgeToDataStream {
  def apply(masterParams: DataStreamMasterPortParameters)(implicit p: Parameters): BundleBridgeToDataStreamNode = {
    val converter = LazyModule(new BundleBridgeToDataStream(masterParams))
    converter.node
  }
  def apply(masterParams: DataStreamMasterParameters)(implicit p: Parameters): BundleBridgeToDataStreamNode = {
    apply(DataStreamMasterPortParameters(masterParams))
  }
}
