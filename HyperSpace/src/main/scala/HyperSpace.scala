// SPDX-License-Identifier: Apache-2.0

package hyperspace

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util._
import chisel3.experimental.FixedPoint
import chisel3.util.experimental.FlattenInstance

import dsptools._
import dsptools.numbers._
import dspblocks._

import freechips.rocketchip.amba.axi4._
import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.config.{Parameters}
import freechips.rocketchip.diplomacy._

import fft._
import magnitude._
import cfar._

/* HyperSpace parameters */
case class HyperSpaceParameters[T <: Data: Real: BinaryRepresentation] (
  fftParams  : Option[FFTParamsAndAddresses[T]],
  magParams  : Option[MagParamsAndAddresses[T]],
  cfarParams : Option[CFARParamsAndAddresses[T]]
)

/* FFT parameters and addresses */
case class FFTParamsAndAddresses[T <: Data: Real: BinaryRepresentation] (
  fftParams  : FFTParams[T],
  fftAddress : AddressSet
)
/* Magnitude parameters and addresses */
case class MagParamsAndAddresses[T <: Data: Real: BinaryRepresentation] (
  magParams  : MAGParams[T],
  magAddress : AddressSet
)

/* CFAR parameters and addresses */
case class CFARParamsAndAddresses[T <: Data: Real: BinaryRepresentation] (
  cfarParams  : CFARParams[T],
  cfarAddress : AddressSet
)

class AXI4HyperSpace[T <: Data : Real: BinaryRepresentation](params: HyperSpaceParameters[T], beatBytes: Int)(implicit p: Parameters) extends HyperSpace[T, AXI4MasterPortParameters, AXI4SlavePortParameters, AXI4EdgeParameters, AXI4EdgeParameters, AXI4Bundle](params, beatBytes) with AXI4DspBlock {
  /* Optional memory mapped port */
  val bus = if (blocks.isEmpty) None else Some(LazyModule(new AXI4Xbar))
  override val mem = if (blocks.isEmpty) None else Some(bus.get.node)
  for (b <- blocks) {
    b.mem.foreach { _ := bus.get.node }
  }
}

abstract class HyperSpace [T <: Data : Real: BinaryRepresentation, D, U, E, O, B <: Data] (params: HyperSpaceParameters[T], beatBytes: Int) extends LazyModule()(Parameters.empty) with DspBlock[D, U, E, O, B] {

  /* Type of Blocks */
  type Block = AXI4DspBlock

  val one2N = AXI4StreamWidthAdapter.nToOne(beatBytes)
  val fft  : Option[Block] = if (params.fftParams  != None) Some(LazyModule(new AXI4FFTBlock(address = params.fftParams.get.fftAddress, params = params.fftParams.get.fftParams, _beatBytes = beatBytes, configInterface = false))) else None
  val mag  : Option[Block] = if (params.magParams  != None) Some(LazyModule(new AXI4LogMagMuxBlock(params.magParams.get.magParams, params.magParams.get.magAddress, _beatBytes = beatBytes))) else None
  val cfar : Option[Block] = if (params.cfarParams != None) Some(LazyModule(new AXI4CFARBlock(params.cfarParams.get.cfarParams, params.cfarParams.get.cfarAddress, _beatBytes = beatBytes))) else None
  val n2One = AXI4StreamWidthAdapter.oneToN(3)

  /* Blocks */
  val blocks: Seq[Block]  = Seq(fft, mag, cfar).flatten
  require(blocks.length >= 1, "At least one block should exist")
  
  /* Connect nodes */
  lazy val connections = for (i <- 1 until blocks.length) yield (blocks(i), blocks(i-1))
  for ((lhs, rhs) <- connections) {
    lhs.streamNode := AXI4StreamBuffer() := rhs.streamNode
  }

  blocks.head.streamNode := AXI4StreamBuffer() := one2N
  n2One := AXI4StreamBuffer() := blocks.last.streamNode
  /* Optional streamNode */
  val streamNode = NodeHandle(one2N, n2One)

  lazy val module = if (sys.props.getOrElse("FLATTEN", "false") == "true") new LazyModuleImp(this) with FlattenInstance {}
                    else new LazyModuleImp(this) {}
}

trait AXI4HyperSpacePins extends AXI4HyperSpace[FixedPoint] {
  def beatBytes: Int = 4

  // Generate AXI4 slave output
  def standaloneParams = AXI4BundleParameters(addrBits = beatBytes*8, dataBits = beatBytes*8, idBits = 1)
  val ioMem = mem.map { m => {
    val ioMemNode = BundleBridgeSource(() => AXI4Bundle(standaloneParams))
    m := BundleBridgeToAXI4(AXI4MasterPortParameters(Seq(AXI4MasterParameters("bundleBridgeToAXI4")))) := ioMemNode
    val ioMem = InModuleBody { ioMemNode.makeIO() }
    ioMem
  }}

  // streamNode
  val ioInNode = BundleBridgeSource(() => new AXI4StreamBundle(AXI4StreamBundleParameters(n = 1)))
  val ioOutNode = BundleBridgeSink[AXI4StreamBundle]()

  ioOutNode := AXI4StreamToBundleBridge(AXI4StreamSlaveParameters()) := streamNode := BundleBridgeToAXI4Stream(AXI4StreamMasterParameters(n = 1)) := ioInNode

  val in = InModuleBody { ioInNode.makeIO() }
  val out = InModuleBody { ioOutNode.makeIO() }
}


class HyperSpaceParams(fftSize: Int = 512, minSRAMdepth: Int = 512) {
  val params : HyperSpaceParameters[FixedPoint] = HyperSpaceParameters (
    fftParams = Some(FFTParamsAndAddresses(
      fftParams = FFTParams.fixed(
        dataWidth       = 16,
        binPoint        = 14,
        dataWidthOut    = 16,
        binPointOut     = 14,
        trimEnable      = false,
        twiddleWidth    = 16,
        numPoints       = fftSize,
        keepMSBorLSBReg = false,
        keepMSBorLSB    = Array.fill(log2Up(fftSize))(true),
        overflowReg     = false,
        fftType         = "sdf",
        decimType       = DITDecimType,
        sdfRadix        = "2^2",
        runTimeR22      = Some(false),
        expandLogic     = Array.fill(log2Up(fftSize))(0),
        runTime         = false,
        trimType        = RoundHalfUp,
        numAddPipes     = 0,
        numMulPipes     = 0,
        fftDir          = true,
        fftDirReg       = false,
        use4Muls        = false,
        useBitReverse   = false,
        minSRAMdepth    = minSRAMdepth,
      ),
      fftAddress = AddressSet(0x30000000, 0xFF)
    )),
    magParams = Some(MagParamsAndAddresses(
      magParams = MAGParams(
        protoIn  = FixedPoint(16.W, 14.BP),
        protoOut = FixedPoint(16.W, 14.BP),
        protoLog = Some(FixedPoint(16.W, 14.BP)),
        magType  = MagJPLandSqrMag,
        log2LookUpWidth = 14,
        useLast = true,
        numAddPipes = 1,
        numMulPipes = 1
      ),
      magAddress = AddressSet(0x30000100, 0xFF),
    )),
    cfarParams = Some(CFARParamsAndAddresses(
      cfarParams = CFARParams(
        protoIn = FixedPoint(16.W, 14.BP),
        protoThreshold = FixedPoint(16.W, 14.BP),
        protoScaler = FixedPoint(16.W, 14.BP),
        leadLaggWindowSize = 64,
        guardWindowSize = 8,
        logOrLinReg = false,
        retiming = false,
        fftSize = fftSize,
        sendCut = true,
        minSubWindowSize = None,
        includeCASH = false,
        CFARAlgorithm = CACFARType,
        numAddPipes = 1,                  // number of add pipeline registers
        numMulPipes = 1                   // number of mull pipeline registers
      ),
      cfarAddress   = AddressSet(0x30000200, 0xFF),
    ))
  )
}

object HyperSpaceApp extends App
{


  implicit val p: Parameters = Parameters.empty

  val fftSize = sys.props.getOrElse("fftSize", "512").toInt
  val minSRAMDepth = sys.props.getOrElse("minSRAMDepth", "512").toInt

  val params = (new HyperSpaceParams(fftSize, minSRAMDepth)).params

  val lazyDut = LazyModule(new AXI4HyperSpace(params, 4) with AXI4HyperSpacePins)
  

  val arguments = Array(
    "-X", "verilog",
    "--repl-seq-mem","-c:AXI4HyperSpace:-o:./verilog/rtl/HyperSpace/mem.conf",
    "--log-level", "info",
    "--target-dir", "verilog/rtl/HyperSpace"
  )

  (new ChiselStage).execute(arguments, Seq(ChiselGeneratorAnnotation(() => lazyDut.module)))
} 