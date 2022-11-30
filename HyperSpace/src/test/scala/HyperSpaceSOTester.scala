// SPDX-License-Identifier: Apache-2.0

package hyperspace

import chisel3._
import chisel3.util.{log2Ceil, log2Up}
import chisel3.iotesters.PeekPokeTester

import dsptools.numbers._

import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.amba.axi4._
import freechips.rocketchip.diplomacy._

import breeze.signal.{fourierTr}
import breeze.linalg._

import scala.math._
import java.io._

import cfar._
import fft._

/* AXI4HyperSpace */
class HyperSpaceSOTester[T <: Data : Real: BinaryRepresentation]
(
  dut: AXI4HyperSpace[T] with AXI4HyperSpacePins,
  params: HyperSpaceParameters[T],
  fftSize : Int,
  runTime : Boolean = false,
  enablePlot: Boolean = false,
  silentFail: Boolean = false
) extends PeekPokeTester(dut.module) with AXI4StreamModel with AXI4MasterModel {

  val mod = dut.module
  def memAXI: AXI4Bundle = dut.ioMem.get
  val master = bindMaster(dut.in)

  // Define signals
  val numStages = log2Up(fftSize)
  val s1 = HyperSpaceTesterUtils.getTone(numSamples = fftSize, f1r = 1.0/4.0,   f1i = 1.0/4.0,   addNoise = 1.0, scalingFactor = 4, scalingFactor2 = 2)
  val s2 = HyperSpaceTesterUtils.getTone(numSamples = fftSize, f1r = 1.0/32.0,  f1i = 1.0/32.0,  addNoise = 1.0, scalingFactor = 4, scalingFactor2 = 2)
  val s3 = HyperSpaceTesterUtils.getTone(numSamples = fftSize, f1r = 1.0/128.0, f1i = 1.0/128.0, addNoise = 1.0, scalingFactor = 4, scalingFactor2 = 2)
  val testTone = s1.zip(s2).map{ case (c, d) => c + d }.zip(s3).map{ case (e, f)  => e + f }
  val inp = if (params.fftParams.get.fftParams.decimType == DITDecimType) HyperSpaceTesterUtils.bitrevorder_data(testTone) else testTone
  val input = inp.map(m => m * math.pow(2,14))
  val out = if (params.fftParams.get.fftParams.decimType == DITDecimType) fourierTr(DenseVector(testTone.toArray)).toScalaVector else HyperSpaceTesterUtils.bitrevorder_data(fourierTr(DenseVector(inp.toArray)).toScalaVector)
  var scalingFactor = if (params.fftParams.get.fftParams.expandLogic.sum != 0) {
    if (params.fftParams.get.fftParams.decimType == DIFDecimType) math.pow(2, params.fftParams.get.fftParams.expandLogic.drop(numStages - log2Up(fftSize)).filter(_ != 1).size).toInt
    else math.pow(2, params.fftParams.get.fftParams.expandLogic.take(log2Up(fftSize)).filter(_ != 1).size).toInt
  } else fftSize
  val fftScala = out.map(m => m/scalingFactor)
  val fftMagScala = fftScala.map(m => ((math.pow(m.real * math.pow(2, 14), 2) + math.pow(m.imag * math.pow(2, 14), 2))/math.pow(2, 14)).toInt)
  var testSignal: Seq[Double] = fftScala.map(c => c.abs.toDouble)
  
  // split 32 bit data to 4 bytes and send real sinusoid
  var dataByte = Seq[Int]()
  for (i <- input) {
    // imag part
    dataByte = dataByte :+ (i.imag.toInt         & 0xFF)
    dataByte = dataByte :+ ((i.imag.toInt >>> 8) & 0xFF)
    // real part
    dataByte = dataByte :+ (i.real.toInt         & 0xFF)
    dataByte = dataByte :+ ((i.real.toInt >>> 8) & 0xFF)
  }

  // magAddress
  if(params.magParams != None) {
    memWriteWord(params.magParams.get.magAddress.base, 0x2) // set jpl magnitude
  }

  step(1)
  // add master transactions
  master.addTransactions((0 until dataByte.size).map(i => AXI4StreamTransaction(data = dataByte(i), last = (i == dataByte.size-1))))

  if(params.cfarParams != None) {
    val beatBytes = 4
    val cfarModeString = "Smallest Of"
    val thresholdScaler = 2.8
    val binPointThresholdScaler = 10
    val thresholdScalerReg = (thresholdScaler * scala.math.pow(2,binPointThresholdScaler)).toInt
    val peakGrouping = 0

    val cfarMode = cfarModeString match {
      case "Cell Averaging" => 0
      case "Greatest Of" => 1
      case "Smallest Of" => 2
      case "CASH" => 3
      case _ => 0
    }

    memWriteWord(params.cfarParams.get.cfarAddress.base + 0x0*beatBytes, fftSize)
    memWriteWord(params.cfarParams.get.cfarAddress.base + 0x1*beatBytes, thresholdScalerReg)
    memWriteWord(params.cfarParams.get.cfarAddress.base + 0x2*beatBytes, peakGrouping)
    memWriteWord(params.cfarParams.get.cfarAddress.base + 0x3*beatBytes, cfarMode)

    var lWinSizes: Seq[Int] = Seq()
    if (runTime)
      lWinSizes = CFARUtils.pow2Divisors(params.cfarParams.get.cfarParams.leadLaggWindowSize).filter(_ > 2).toSeq
    else
      lWinSizes = Seq(params.cfarParams.get.cfarParams.leadLaggWindowSize)
    val startGwin: Int = if (runTime) 2 else params.cfarParams.get.cfarParams.guardWindowSize
    var subWindowSize: Int = params.cfarParams.get.cfarParams.minSubWindowSize.getOrElse(params.cfarParams.get.cfarParams.leadLaggWindowSize)
    var refCells: Int = params.cfarParams.get.cfarParams.leadLaggWindowSize
    
    for (lWinSize <- lWinSizes) {
      for (guardSize <- startGwin to params.cfarParams.get.cfarParams.guardWindowSize) {
        // form here output data
        if (params.cfarParams.get.cfarParams.includeCASH) {
          if (params.cfarParams.get.cfarParams.minSubWindowSize.get > lWinSize) {
            refCells =  params.cfarParams.get.cfarParams.minSubWindowSize.get
          }
          else if (cfarModeString != "CASH") {
            subWindowSize = lWinSize
            refCells = lWinSize
          }
          else {
            subWindowSize = params.cfarParams.get.cfarParams.minSubWindowSize.get
            refCells = lWinSize
          }
          memWriteWord(params.cfarParams.get.cfarAddress.base + 0x7*beatBytes, subWindowSize) // subCells
        }
        else {
           refCells = lWinSize
        }
        println(s"Testing CFAR core with lWinSize = $lWinSize and guardSize = $guardSize and subWindowSize = $subWindowSize")

        val considerEdges = if (params.cfarParams.get.cfarParams.includeCASH == true) false else true
        val (expThr, expPeaks) = if (params.cfarParams.get.cfarParams.includeCASH && cfarModeString == "CASH")
                                    CFARUtils.cfarCASH(testSignal, referenceCells = refCells, subCells = subWindowSize, scalingFactor = thresholdScaler, plotEn = enablePlot)
                                 else
                                    CFARUtils.cfarCA(testSignal, cfarMode = cfarModeString, referenceCells = lWinSize, guardCells = guardSize, considerEdges = considerEdges, scalingFactor = thresholdScaler, plotEn = enablePlot)

        if (cfarMode == 3) {
          memWriteWord(params.cfarParams.get.cfarAddress.base + 0x5*beatBytes, 0) // guardCells
        }
        else {
          memWriteWord(params.cfarParams.get.cfarAddress.base + 0x5*beatBytes, guardSize) // guardCells
        }
        memWriteWord(params.cfarParams.get.cfarAddress.base + 0x4*beatBytes, refCells) // windowCells

        if (params.cfarParams.get.cfarParams.CFARAlgorithm != GOSCFARType) {
          memWriteWord(params.cfarParams.get.cfarAddress.base + 0x6*beatBytes, log2Ceil(lWinSize)) // divSum
        }

        step(2) // be sure that control registers are first initilized and then set ready and valid signals
      }
    }
  }

  step(2) // be sure that control registers are first initilized and then set ready and valid signals
  poke(dut.out.ready, 1)

  var outSeq = Seq[Int]()
  var peekedVal: BigInt = 0
  var tempCounter = 0
    
  if (params.cfarParams != None) {
    while (outSeq.length < (fftSize) * 3 && tempCounter < 10000) {
      if (peek(dut.out.valid) == 1 && peek(dut.out.ready) == 1) {
        peekedVal = peek(dut.out.bits.data)
        outSeq = outSeq :+ peekedVal.toInt
      }
      step(1)
      tempCounter = tempCounter + 1
    }

    var outCUT  = Seq[Int]()
    var outBIN  = Seq[Int]()
    var outPEAK = Seq[Int]()
    var outTreshold = Seq[Int]()
    var tempString: String = ""
    
    print(s"Output length is : ${outSeq.length}")

    for (i <- 0 until outSeq.length by 3) {
      tempString = HyperSpaceTesterUtils.asNdigitBinary(outSeq(i + 2), 16) ++ HyperSpaceTesterUtils.asNdigitBinary(outSeq(i + 1), 16) ++ HyperSpaceTesterUtils.asNdigitBinary(outSeq(i), 16)
      outTreshold = outTreshold :+ (java.lang.Integer.parseInt(tempString.substring(6,22) ,2).toShort).toInt
      outCUT      = outCUT      :+ (java.lang.Integer.parseInt(tempString.substring(22,38) ,2).toShort).toInt
      outBIN      = outBIN      :+ (java.lang.Integer.parseInt(tempString.substring(38,47) ,2).toShort).toInt
      outPEAK     = outPEAK     :+ (java.lang.Integer.parseInt(tempString.substring(47,48) ,2).toShort).toInt
    }
    // check tolerance
    HyperSpaceTesterUtils.checkDataError(outCUT, fftMagScala, 3)
    // Plot data
    if (enablePlot) {
      HyperSpaceTesterUtils.plot_data(inputData = outCUT, plotName = "MAgnitude", fileName = "./AXI4HyperSpaceSO/plot_mag.pdf")
      HyperSpaceTesterUtils.plot_data(inputData = fftMagScala, plotName = "MAgnitude", fileName = "./AXI4HyperSpaceSO/plot_mag_scala.pdf")
    }
  }
  else {
    while (outSeq.length < fftSize && tempCounter < 10000) {
      if (peek(dut.out.valid) == 1 && peek(dut.out.ready) == 1) {
        peekedVal = peek(dut.out.bits.data)
        outSeq = outSeq :+ peekedVal.toInt
      }
      step(1)
      tempCounter = tempCounter + 1
    }
    var outCUT  = Seq[Int]()
    var tempString: String = ""
    for (i <- 0 until outSeq.length) {
      tempString = HyperSpaceTesterUtils.asNdigitBinary(outSeq(i), 16)
      outCUT     = outCUT :+ (java.lang.Integer.parseInt(tempString ,2).toShort).toInt
    }
    // check tolerance
    HyperSpaceTesterUtils.checkDataError(outCUT, fftMagScala, 3)
    // Plot data
    if (enablePlot) {
      HyperSpaceTesterUtils.plot_data(inputData = outCUT, plotName = "MAgnitude", fileName = "./AXI4HyperSpaceSO/plot_mag.pdf")
      HyperSpaceTesterUtils.plot_data(inputData = fftMagScala, plotName = "MAgnitude", fileName = "./AXI4HyperSpaceSO/plot_mag_scala.pdf")
    }
  }

    if (enablePlot) {
      HyperSpaceTesterUtils.plot_data(inputData = testTone.map(m => m * math.pow(2,14)).map(c => c.real.toInt), plotName = "Input real data without reordering", fileName = "AXI4HyperSpaceSO/in_real.pdf")
      HyperSpaceTesterUtils.plot_data(inputData = testTone.map(m => m * math.pow(2,14)).map(c => c.imag.toInt), plotName = "Input imag data without reordering", fileName = "AXI4HyperSpaceSO/in_imag.pdf")
      HyperSpaceTesterUtils.plot_data(inputData = input.map(c => c.real.toInt), plotName = "Input real data with reordering", fileName = "AXI4HyperSpaceSO/in_real_reordered.pdf")
      HyperSpaceTesterUtils.plot_data(inputData = input.map(c => c.imag.toInt), plotName = "Input imag data with reordering", fileName = "AXI4HyperSpaceSO/in_imag_reordered.pdf")
    }

    // Write data to text files
    val f_output = new File("./test_run_dir/AXI4HyperSpaceSO/output_data.txt")
    val w_output = new BufferedWriter(new FileWriter(f_output))
    for (i <- 0 until outSeq.length ) {
      w_output.write(f"${outSeq(i)}%04x" + "\n")
    }
    w_output.close

    val f_input = new File("./test_run_dir/AXI4HyperSpaceSO/input_data.txt")
    val w_input = new BufferedWriter(new FileWriter(f_input))
    for (i <- 0 until dataByte.length ) {
      w_input.write(f"${dataByte(i)}%02x" + "\n")
    }
    w_input.close

  step(20000)
  stepToCompletion(silentFail = silentFail)
}