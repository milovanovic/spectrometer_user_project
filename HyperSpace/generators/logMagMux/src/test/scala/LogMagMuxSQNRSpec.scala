
package magnitude

import org.scalatest.{FlatSpec, Matchers}

import breeze.plot._
import breeze.linalg._
import breeze.math.Complex

import chisel3._
import chisel3.util._
import chisel3.experimental._

import scala.math.pow
import scala.util.{Random}

import dsptools._
import dsptools.numbers._

class SqrMagSQNRSpec extends FlatSpec with Matchers {

  def calc_sqnr(chiselMAG: Seq[Double], scalaMAG: Seq[Double]): Double = {
    import breeze.signal._
    import breeze.linalg._
    import scala.math._

    val scaler = 1
    val signal  = scalaMAG.map { c=> pow(c/scaler, 2) }
    //val signal  = scalaMAG.map { c=> c/scaler }
    val noise = chiselMAG.zip(scalaMAG).map { case (cMAG, sMAG) => pow(math.abs((cMAG/scaler - sMAG/scaler)), 2) }
    //val noise = chiselMAG.zip(scalaMAG).map { case (cMAG, sMAG) => math.abs((cMAG/scaler - sMAG/scaler)) }
    val sumSignal = signal.foldLeft(0.0)(_ + _)
//     println("Sum signal is:")
//     println(sumSignal.toString)
    val noiseSum = noise.foldLeft(0.0)(_ + _)
//    println(noiseSum.toString)
    10*math.log10(sumSignal/noiseSum)
  }

  val numSamples = 1
  val inputDataSize = 8
  var sqnr_results16 : Double = 0
  var sqnr_results24 : Double = 0
  var sqnr_results32 : Double = 0
  var sqnr_results33 : Double = 0


  var sum16 : Double = 0
  var sum24 : Double = 0
  var sum32 : Double = 0
  var sum33 : Double = 0

  val t1 = System.nanoTime

  sum16 = 0
  sum24 = 0
  sum32 = 0
  sum33 = 0

  var dataWidthIn = 16
  var inputBinaryPoint = 10
  var outputBinaryPoint = 10
  var dataWidthOut = 16
  var binaryPointGrowth = 0
  var trimNum = ((dataWidthIn - inputBinaryPoint)*2 + 1 + inputBinaryPoint + binaryPointGrowth) - dataWidthOut
  println("Trim num for fixed16 configuration is equal to:")
  println(trimNum)

  // define magnitude parameters
  val paramsFixed16: MAGParams[FixedPoint] =  MAGParams(
    protoIn  = FixedPoint(dataWidthIn.W, inputBinaryPoint.BP),
    protoOut = FixedPoint(dataWidthOut.W, outputBinaryPoint.BP),
    magType  = MagJPLandSqrMag,//MagJPLandLogMag,
    useLast = true,
    binPointGrowth = binaryPointGrowth,
    numAddPipes = 1,
    numMulPipes = 1
  )

  dsptools.Driver.execute(
  () => new LogMagMuxGenerator(paramsFixed16), Array("-tbn", "treadle")){ c =>
  new LogMagMuxTester(c) {
    var count = 0
    while (count < numSamples) {
      val real = Seq.fill(inputDataSize)((Random.nextInt((1<<(paramsFixed16.protoIn.getWidth-1))*2) - (1<<(paramsFixed16.protoIn.getWidth-1))).toDouble/(pow(2,inputBinaryPoint)))
      // print real
      val imag = Seq.fill(inputDataSize)((Random.nextInt((1<<(paramsFixed16.protoIn.getWidth-1))*2) - (1<<(paramsFixed16.protoIn.getWidth-1))).toDouble/(pow(2,inputBinaryPoint)))
      val testSignal =  real.zip(imag).map { case (r, i) => Complex(r, i)}
      //print imag
      val scalaSqrMag = testSignal.map (c => (c.real*c.real + c.imag * c.imag)/pow(2, trimNum))

      updatableDspVerbose.withValue(false) {
        val (chiselSqrMag) = this.testStreamCollectOut(testSignal, sel = 0, scalaSqrMag)
        val sqnr16 = calc_sqnr(chiselSqrMag, scalaSqrMag)
        sum16 = sum16 + sqnr16
        count = count + 1
      }
    }
    sqnr_results16 = (sum16/numSamples)
    }
  }
  println(sqnr_results16)

  dataWidthIn = 16
  inputBinaryPoint = 10
  dataWidthOut = 24
  outputBinaryPoint = 10
  binaryPointGrowth = 0
  trimNum = if (((dataWidthIn - inputBinaryPoint)*2 + 1 + inputBinaryPoint + binaryPointGrowth) - dataWidthOut > 0)
              ((dataWidthIn - inputBinaryPoint)*2 + 1 + inputBinaryPoint + binaryPointGrowth) - dataWidthOut
            else
              0
  println("Trim num for fixed32 configuration is equal to:")
  println(trimNum)

  val paramsFixed24: MAGParams[FixedPoint] =  MAGParams(
    protoIn  = FixedPoint(16.W, inputBinaryPoint.BP),
    protoOut = FixedPoint(24.W, outputBinaryPoint.BP),
    magType  = MagJPLandSqrMag,//MagJPLandLogMag,
    useLast = true,
    binPointGrowth = binaryPointGrowth,
    numAddPipes = 1,
    numMulPipes = 1
  )

  dsptools.Driver.execute(
  () => new LogMagMuxGenerator(paramsFixed24), Array("-tbn", "treadle")){ c =>
  new LogMagMuxTester(c) {
    var count = 0
    while (count < numSamples) {
      val real = Seq.fill(inputDataSize)((Random.nextInt((1<<(paramsFixed24.protoIn.getWidth-1))*2) - (1<<(paramsFixed24.protoIn.getWidth-1))).toDouble/(pow(2,inputBinaryPoint)))
      val imag = Seq.fill(inputDataSize)((Random.nextInt((1<<(paramsFixed24.protoIn.getWidth-1))*2) - (1<<(paramsFixed24.protoIn.getWidth-1))).toDouble/(pow(2,inputBinaryPoint)))
      val testSignal =  real.zip(imag).map { case (r, i) => Complex(r, i)}
      //print imag
      val scalaSqrMag = testSignal.map(c => (c.real*c.real + c.imag * c.imag)*pow(2, trimNum))
      println("Scala SQR mag is:")
     // scalaSqrMag.foreach { c => println(c.toString)}

      updatableDspVerbose.withValue(false) {
        val (chiselSqrMag) = this.testStreamCollectOut(testSignal, sel = 0, scalaSqrMag)
       // println("Chisel SQR mag is:")
        chiselSqrMag.foreach { c => println(c.toString) }
        val sqnr24 = calc_sqnr(chiselSqrMag, scalaSqrMag)
        sum24 = sum24 + sqnr24
        count = count + 1
      }
    }
    sqnr_results24 = (sum24/numSamples)
    }
  }
  println(sqnr_results24)

  dataWidthIn = 16
  inputBinaryPoint = 10
  dataWidthOut = 32
  outputBinaryPoint = 20
  binaryPointGrowth = 10
  trimNum = ((dataWidthIn - inputBinaryPoint)*2 + 1 + inputBinaryPoint + binaryPointGrowth) - dataWidthOut
  println("Trim num for fixed32 configuration is equal to:")
  println(trimNum)

  val paramsFixed32: MAGParams[FixedPoint] =  MAGParams(
    protoIn  = FixedPoint(dataWidthIn.W, inputBinaryPoint.BP),
    protoOut = FixedPoint(dataWidthOut.W, outputBinaryPoint.BP),
    magType  = MagJPLandSqrMag,//MagJPLandLogMag,
    useLast = true,
    binPointGrowth = binaryPointGrowth,
    numAddPipes = 1, // not important value
    numMulPipes = 1
  )

  dsptools.Driver.execute(
 // () => new LogMagMuxGenerator(paramsFixed32), Array("-tbn", "treadle")){ c =>
  () => new LogMagMuxGenerator(paramsFixed32), Array("-tbn", "verilator")){ c =>
  new LogMagMuxTester(c) {
    var count = 0
    while (count < numSamples) {
      val real = Seq.fill(inputDataSize)((Random.nextInt((1<<(dataWidthIn-1))*2) - (1<<(dataWidthIn-1))).toDouble/(pow(2,inputBinaryPoint)))
      real.foreach { c => println(c.toString)}
      val imag = Seq.fill(inputDataSize)((Random.nextInt((1<<(dataWidthIn-1))*2) - (1<<(dataWidthIn-1))).toDouble/(pow(2,inputBinaryPoint)))
      val testSignal =  real.zip(imag).map { case (r, i) => Complex(r, i) }
      //print imag
      val scalaSqrMag = testSignal.map (c => (c.real*c.real + c.imag * c.imag)/pow(2, trimNum))

      updatableDspVerbose.withValue(false) {
        val (chiselSqrMag) = this.testStreamCollectOut(testSignal, sel = 0, scalaSqrMag)
        val sqnr32 = calc_sqnr(chiselSqrMag, scalaSqrMag)
        sum32 = sum32 + sqnr32
        count = count + 1
      }
    }
    sqnr_results32 = (sum32/numSamples)
    }
  }

  println(sqnr_results32)

  println("sqnr24 - sqnr16 is")
  println(sqnr_results24 - sqnr_results16)

  println("sqnr32 - sqnr24 is")
  println(sqnr_results32 - sqnr_results24)

  val durationTest1 = (System.nanoTime - t1) / 1e9d
  println(s"The execution time of the data width sqnr analysis is $durationTest1 s")

}
