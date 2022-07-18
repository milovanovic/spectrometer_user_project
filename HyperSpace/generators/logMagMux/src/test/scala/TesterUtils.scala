// SPDX-License-Identifier: Apache-2.0

package magnitude

import breeze.math.Complex

trait HasSignalUtils {

  /**
  * Calculate signal to quantization noise ratio of the floating point magnitude/squared magnitude and chisel mag/squared magnitude
  */
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
}

/*Note: lets say that input is Q6.10 FixedPoint, 33 bits max that is FixedPoint data, this can be interpreted with 32 bits without problems while highest bit is used for sign and we know that is always positive, this then can be iterpreted as fixedPoint but CFAR should interpret that as UInt. Is it possible to multiply Uint and fixedPoint? */
