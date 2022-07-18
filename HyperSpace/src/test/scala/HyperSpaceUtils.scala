// SPDX-License-Identifier: Apache-2.0

package hyperspace

import breeze.math.Complex
import breeze.signal.fourierTr
import breeze.linalg._
import breeze.plot._

import chisel3.util.log2Up


object HyperSpaceTesterUtils {
    
  /**
  * Convert int data to binary string
  */
  def asNdigitBinary (source: Int, digits: Int): String = {
    val lstring = source.toBinaryString
    //val sign = if (source > 0) "%0" else "%1"
    if (source >= 0) {
      //val l: java.lang.Long = lstring.toLong
      val l: java.lang.Long = lstring.toLong
      String.format ("%0" + digits + "d", l)
    }
    else
      lstring.takeRight(digits)
  }
  
  /**
   * Generates complex or real sinusoids with optional noise
   */
  def getTone(numSamples: Int, f1r: Double, f1i: Double = 0, addNoise: Double = 0, scalingFactor: Int = 1, scalingFactor2: Int = 1): Seq[Complex] = {
    require(f1r != 0, "Digital frequency should not be zero!")
    import scala.util.Random
    
    (0 until numSamples).map(i => Complex(
    (math.cos(2 * math.Pi * f1r * i))/scalingFactor + addNoise*((Random.nextDouble()*2.0)-1.0)/scalingFactor2,
    (math.sin(2 * math.Pi * f1i * i))/scalingFactor + addNoise*((Random.nextDouble()*2.0)-1.0)/scalingFactor2))
  }
  
  /**
  * Generate complex sinusoid. Assumption is that dataWidth of the fft input is always equal to 16
  * Scale parameter is useful when square magnitude is calculated to prevent overflow
  */
  
  def getComplexTone(numSamples: Int, f1r: Double, scale: Int = 1): Seq[Complex] = {
    (0 until numSamples).map(i => Complex((math.cos(2 * math.Pi * f1r * i) * scala.math.pow(2, 13)/scale).toInt, (math.sin(2 * math.Pi * f1r * i)*scala.math.pow(2, 13)/scale).toInt))
  }
  
  /**
  * Generate random signal. Assumption is that dataWidth of the fft input is always equal to 16
  * Scale parameter is useful when square magnitude is calculated to prevent overflow
  */
  def genRandSignal(numSamples: Int, scale: Int = 1, binPoint: Int = 14): Seq[Int] = {
    import scala.util.Random
    
    Random.setSeed(11110L)
    (0 until numSamples).map(x => (Random.nextDouble()*scala.math.pow(2, binPoint)/scale).toInt)
  }
  
  /**
  * Generate complex random signal. Assumption is that dataWidth of the fft input is always equal to 16
  * Scale parameter is useful when square magnitude is calculated to prevent overflow
  */
  def genComplexRandSignal(numSamples: Int, scale: Int = 1, binPoint: Int = 13): Seq[Complex] = {
    import scala.util.Random
    
    Random.setSeed(11110L)
    (0 until numSamples).map(x => Complex((Random.nextDouble()*scala.math.pow(2, binPoint)/scale).toInt, Random.nextDouble()*scala.math.pow(2, binPoint)/scale.toInt))
  }
  
  /**
  * Format inData so that it is compatible with 32 AXI4Stream data
  */
  def formAXI4StreamRealData(inData: Seq[Int], dataWidth: Int): Seq[Int] = {
    inData.map(data => java.lang.Long.parseLong(
                                  asNdigitBinary(data, dataWidth) ++ 
                                  asNdigitBinary(0, dataWidth), 2).toInt)
  }
  
  /**
  * Format complex inData so that it is compatible with 32 AXI4Stream data
  */
  def formAXI4StreamComplexData(inData : Seq[Complex], dataWidth: Int): Seq[Int] = {
    inData.map(data => java.lang.Long.parseLong(
                                  asNdigitBinary(data.real.toInt, dataWidth) ++ 
                                  asNdigitBinary(data.imag.toInt, dataWidth)).toInt)
  }
  
  
  /**
   * Returns bit reversed index
   */
  def bit_reverse(in: Int, width: Int): Int = {
    import scala.math.pow
    var test = in
    var out = 0
    for (i <- 0 until width) {
      if (test / pow(2, width-i-1) >= 1) {
        out += pow(2,i).toInt
        test -= pow(2,width-i-1).toInt
      }
    }
    out
  }
  
  /**
   * Reordering data
   */
  def bitrevorder_data(testSignal: Seq[Complex]): Seq[Complex] = {
    val seqLength = testSignal.size
    val new_indices = (0 until seqLength).map(x => bit_reverse(x, log2Up(seqLength)))
    new_indices.map(x => testSignal(x))
  }

 /*******************************************************/
  
  /**
  * Calculate log2
  */
  def log2(x: Double): Double =  scala.math.log(x)/scala.math.log(2)
  
  /**
  * Calculate jpl magnitude of the complex input data
  */
  def jplMag(in: Complex): Int = {
    import scala.math._
    
    val u = abs(in.real).max(abs(in.imag))
    val v = abs(in.real).min(abs(in.imag))
    val jpl = (u + v/8).max(7 * u/8 + v/2).toInt
    jpl
  }

  /****************************************************************
  * Plot functions
  */
  def plot_data(inputData: Seq[Int], plotName: String, fileName: String): Unit = {

    val f = Figure()
    val p = f.subplot(0)
    p.legend_=(true)
  
    val data = inputData.map(e => e.toDouble).toSeq
    val xaxis = (0 until data.length).map(e => e.toDouble).toSeq.toArray
    
    p += plot(xaxis, data.toArray, name = plotName)
   
    p.ylim(data.min, data.max)
    p.title_=(plotName + s" ${inputData.length}")

    p.xlabel = "Time Bins"
    p.ylabel = "Amplitude"
    f.saveas(s"test_run_dir/" + fileName)
  }
  
  def plot_fft(inputData: Seq[Long], plotName: String, fileName: String): Unit = {

    val f = Figure()
    val p = f.subplot(0)
    p.legend_=(true)
    
    val data = inputData.map(e => e.toDouble).toSeq
    val xaxis = (0 until data.length).map(e => e.toDouble).toSeq.toArray
    
    p += plot(xaxis, data.toArray, name = plotName)
   
    p.ylim(data.min, data.max)
    p.title_=(plotName + s" ${inputData.length}")

    p.xlabel = "Frequency Bin"
    p.ylabel = "Amplitude"
    f.saveas(s"test_run_dir/" + fileName)
  }
  /****************************************************************/
  
  /**
  * Calculate expected sine and cosine at the output of the nco module
  */
  def calcExpectedNcoOut(fftSize: Int, binWithPeak: Int): Seq[Complex] = {
    require(binWithPeak < fftSize, "Index of expected peak can not be larger than fft size")
    
    val genSinGolden = (1 until (fftSize + 1)).map(i => (math.sin(2 * math.Pi * binWithPeak/fftSize * i) * scala.math.pow(2, 14)).toInt)
    val genCosGolden = (1 until (fftSize + 1)).map(i => (math.cos(2 * math.Pi * binWithPeak/fftSize * i) * scala.math.pow(2, 14)).toInt)
    val genComplex = genSinGolden.zip(genCosGolden).map { case (sin, cos) => Complex(cos, sin) }
    genComplex
  }
  
  /**
  * Calculate expected output of the fft module
  */
  def calcExpectedFFTOut(fftSize: Int, binWithPeak: Int, scale: Int = 1): Seq[Complex] = {
    require(binWithPeak < fftSize, "Index of expected peak can not be larger than fft size")

    val ncoOut = calcExpectedNcoOut(fftSize, binWithPeak)
    val fftOut = fourierTr(DenseVector(ncoOut.map( c => Complex(c.real.toDouble/scale, c.imag.toDouble/scale)).toArray)).toScalaVector
    fftOut
  }
  
  /**
  * Calculate jpl magnitude, square magnitude or log2 magnitude
  */
  def calcExpectedMagOut(fftSize: Int, binWithPeak: Int, scale: Int = 1, magType: String = "jplMag"): Seq[Int] = {
    require(binWithPeak < fftSize, "Index of expected peak can not be larger than fftSize")
    val fft = calcExpectedFFTOut(fftSize, binWithPeak, scale)
    val mag = magType match {
      case "jplMag" => {
        val jpl = fft.map(c => jplMag(c))
        jpl
      }
      case "sqrMag" => {
        val magSqr = fft.map(c => (c.real * c.real + c.imag * c.imag).toInt)
        magSqr
      }
      case "log2Mag" => {
        val log2Mag = fft.map(c => log2(jplMag(c).toDouble).toInt)
        log2Mag
      }
      case _ => fft.map(c => c.abs.toInt).toSeq
    }
    mag
  }
  
  /**
  * Check FFT error
  */
  def checkFFTError(expected: Seq[Complex], received: Seq[Complex], tolerance: Int = 2) {
    expected.zip(received).foreach {
      case (in, out) => 
        require(math.abs(in.real - out.real) <= tolerance & math.abs(in.imag - out.imag) <= tolerance, "Tolerance is not satisfied")
    }
  }
  
  /**
  * Check magnitude error, nco error, used also for checking output of the accumulator
  */
  def checkDataError(expected: Seq[Int], received: Seq[Int], tolerance: Int = 2) {
    var i = 0
    expected.zip(received).foreach {
      case (in, out) => {
        i = i+1
        require(math.abs(in - out) <= tolerance, f"Tolerance is not satisfied, in = ${in}%04x, out = ${out}%04x, at ${i}")
      }
    }
  }
}