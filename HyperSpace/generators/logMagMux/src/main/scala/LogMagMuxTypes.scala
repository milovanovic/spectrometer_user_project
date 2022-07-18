// SPDX-License-Identifier: Apache-2.0

package magnitude

import chisel3._
import chisel3.util._
import chisel3.experimental._

import dsptools._
import dsptools.numbers._
import scala.math._

class MagJPLInst[T <: Data: Real : BinaryRepresentation](val params: MAGParams[T]) extends Module {
  val io = IO(MagMuxIO(params))
  
  val numAddPipes = params.numAddPipes //DspContext.current.numAddPipes
  val latency = 2 * numAddPipes
  
  val absInReal = Real[T].abs(io.in.bits.real)
  val absInImag = Real[T].abs(io.in.bits.imag)
  // for JPL approximation
  val u = Real[T].max(absInReal, absInImag)
  val v = Real[T].min(absInReal, absInImag)
  
  val jplMagOp1 = DspContext.withNumAddPipes(2*numAddPipes) { // to be aligned with jplMagOp2
                            u context_+ BinaryRepresentation[T].shr(v,3) } // U + V/8
  val tmpOp2 = DspContext.withNumAddPipes(numAddPipes) { u context_- BinaryRepresentation[T].shr(u,3) }
  
  val jplMagOp2 = DspContext.withNumAddPipes(numAddPipes) {
                            tmpOp2 context_+  ShiftRegister(BinaryRepresentation[T].shr(v, 1), numAddPipes, true.B) }  // (7/8)*U + 1/2*V
  val jplMag = Real[T].max(jplMagOp1, jplMagOp2)
  
  val output = Wire(params.protoOut.cloneType)
  output := jplMag
  
  val skidInData = Wire(io.out.cloneType)
  skidInData.bits := output
  skidInData.valid := io.in.valid
  io.in.ready := skidInData.ready
  Skid(latency, skidInData, io.out) := output

  if (params.useLast) {
    val skidInLast = Wire(Flipped(DecoupledIO(Bool())))
    val skidOutLast = Wire(DecoupledIO(Bool()))
    skidOutLast.ready := io.out.ready
    skidInLast.bits := ShiftRegister(io.lastIn.get && io.in.fire(), latency, true.B)
    skidInLast.valid := io.in.valid
    Skid(latency, skidInLast, skidOutLast) := skidInLast.bits
    io.lastOut.get := skidOutLast.bits
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
class LogMagInst[T <: Data: Real : BinaryRepresentation](val params: MAGParams[T]) extends Module {
  val io = IO(MagMuxIO(params))
  
  val numAddPipes = params.numAddPipes
  val jplMagLatency = 2 * numAddPipes
  val latency = jplMagLatency + numAddPipes // + numAddPipes - address generation
  
  val gen = params.protoIn
  val dataWidth = gen.getWidth
  val bpos = (gen match {
    case fp: FixedPoint => fp.binaryPoint.get
    case _ => 0
  })
  val bposLog = (params.protoLog.get match {
    case fp: FixedPoint => fp.binaryPoint.get
    case _ => 0
  })
  val dataWidthLog = params.protoLog.get.getWidth
  
  val absInReal = Real[T].abs(io.in.bits.real)
  val absInImag = Real[T].abs(io.in.bits.imag)
  // for JPL approximation
  val u = Real[T].max(absInReal, absInImag)
  val v = Real[T].min(absInReal, absInImag)
  
  val jplMagOp1 = DspContext.withNumAddPipes(2*numAddPipes) { // to be aligned with jplMagOp2
                            u context_+ BinaryRepresentation[T].shr(v,3) } // U + V/8
  val tmpOp2 = DspContext.withNumAddPipes(numAddPipes) { u context_- BinaryRepresentation[T].shr(u,3) }
  
  val jplMagOp2 = DspContext.withNumAddPipes(numAddPipes) {
                            tmpOp2 context_+  ShiftRegister(BinaryRepresentation[T].shr(v, 1), numAddPipes, true.B) }  // (7/8)*U + 1/2*V
  
  val jplMag = Real[T].max(jplMagOp1, jplMagOp2)
  
  val logUInt = Log2(jplMag.asUInt())
  val logSInt = (logUInt - bpos.U).asSInt()
  
  // log(N) = k + log2(1 + f)
  // N = 2^k(1 + f)
  val logLookUp = VecInit({
    val lnOf2 = scala.math.log(2)                                // natural log of 2
    def log2(x: Double): Double = scala.math.log(x) / lnOf2      // function log of 2
    val num = 1 << (params.log2LookUpWidth)                      // number of look-up table values
    val lookup = (0 until num).map(n => {
      val lookupWire = Wire(FixedPoint((bposLog + 1).W, bposLog.BP)) // +2?
      // log2(1+f)
      DspContext.withTrimType(Convergent) {
        lookupWire := lookupWire.cloneType.fromDoubleWithFixedWidth(log2(n.toDouble/num + 1))
      }
      lookupWire })
    lookup
  })
  
  // dsptools.DspException: OverflowType Grow is not supported for UInt subtraction
  // eliminate leading 1 - think about >> <<
  
  val noLeadOne = ShiftRegister((jplMag.asUInt() - BinaryRepresentation[UInt].shl(1.U, logUInt).asTypeOf(jplMag.asUInt)), numAddPipes, true.B)
  val shiftNum = ShiftRegister(dataWidth.U - logUInt - 1.U, numAddPipes, true.B)
  
  val logLookUpAddr = BinaryRepresentation[UInt].shl(noLeadOne, shiftNum)(dataWidth - 2, dataWidth - params.log2LookUpWidth - 1)
  val logFrac = Wire(FixedPoint((bposLog+1).W, bposLog.BP))
  logFrac := logLookUp(logLookUpAddr)
  val log2Mag = Wire(FixedPoint(dataWidthLog.W, bposLog.BP))
  log2Mag := ShiftRegister(logSInt.asFixedPoint(0.BP), numAddPipes, true.B) + logFrac
  
  val output = Wire(params.protoOut.cloneType)
  
  output := log2Mag
  
  val skidInData = Wire(io.out.cloneType)
  skidInData.bits := output
  skidInData.valid := io.in.valid
  io.in.ready := skidInData.ready
  Skid(latency, skidInData, io.out) := output

  if (params.useLast) {
    val skidInLast = Wire(Flipped(DecoupledIO(Bool())))
    val skidOutLast = Wire(DecoupledIO(Bool()))
    skidOutLast.ready := io.out.ready
    skidInLast.bits := ShiftRegister(io.lastIn.get && io.in.fire(), latency, true.B)
    skidInLast.valid := io.in.valid
    Skid(latency, skidInLast, skidOutLast) := skidInLast.bits
    io.lastOut.get := skidOutLast.bits
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////
class MagJPLandSQRMagInst[T <: Data: Real : BinaryRepresentation](val params: MAGParams[T]) extends Module {
  val io = IO(MagMuxIO(params))
  
  val numAddPipes = params.numAddPipes
  val numMulPipes = params.numMulPipes
  
  val magSqrLatency = numAddPipes + numMulPipes
  val jplMagLatency = 2 * numAddPipes
  
  val latency = magSqrLatency.max(jplMagLatency)
 
  val absInReal = Real[T].abs(io.in.bits.real)
  val absInImag = Real[T].abs(io.in.bits.imag)
  // for JPL approximation
  val u = Real[T].max(absInReal, absInImag)
  val v = Real[T].min(absInReal, absInImag)

  // IMPORTANT: try to use div2 with trim type not shr, i guess that better precision can be achieved
  // IMPORTANT: check data width size of jplMag
  val jplMagOp1 = DspContext.withNumAddPipes(2*numAddPipes) { // to be aligned with jplMagOp2
                            u context_+ BinaryRepresentation[T].shr(v,3) } // U + V/8
  val tmpOp2 = DspContext.withNumAddPipes(numAddPipes) { u context_- BinaryRepresentation[T].shr(u,3) }
  
  val jplMagOp2 = DspContext.withNumAddPipes(numAddPipes) {
                            tmpOp2 context_+  ShiftRegister(BinaryRepresentation[T].shr(v, 1), numAddPipes, true.B) }  // (7/8)*U + 1/2*V
  val last = RegInit(false.B)
  
  val bpos = (absInReal.cloneType match {
        case fp: FixedPoint => fp.binaryPoint.get
        case _ => 0
      })
  // binaryPointGrowth should be set to satisfy binary point growth - extremely important to be defined in a right way
  //val magSqr = DspContext.alter(DspContext.current.copy(numAddPipes = numAddPipes,  numMulPipes = numMulPipes, binaryPointGrowth = 0)) {
  val magSqr = DspContext.alter(DspContext.current.copy(numAddPipes = numAddPipes,  numMulPipes = numMulPipes, binaryPointGrowth = params.binPointGrowth)) {
                       ShiftRegister((absInReal context_* absInReal) context_+ (absInImag context_* absInImag), latency - magSqrLatency, true.B)}
  dontTouch(magSqr)
  magSqr.suggestName("squared_magnitude")

  val trimNum = if (magSqr.getWidth - params.protoOut.getWidth > 0) magSqr.getWidth - params.protoOut.getWidth else 0
  //require(trimNum > 0, "Check core parameters such as protoIn and protoOut, some incompatibilities are detected")
  println("trimNum is")
  println(trimNum)
  println("Total data width is: ")
  println(magSqr.getWidth)
  // print binary point
  val bposMagSqr = (magSqr.cloneType match {
        case fp: FixedPoint => fp.binaryPoint.get
        case _ => 0
      })
  println("Binary data width is:")
  println(bposMagSqr
  )
  //val trimMagSqr = Wire(params.protoOut.clone)
  val trimMagSqr = DspContext.alter(DspContext.current.copy(trimType = params.trimType, binaryPointGrowth = 0)){ magSqr.div2(trimNum) }
  dontTouch(trimMagSqr)
  trimMagSqr.suggestName("trim_squared_magnitude")

  val bposTrimMagSqr = (trimMagSqr.cloneType match {
        case fp: FixedPoint => fp.binaryPoint.get
        case _ => 0
      })
  println("Binary data width is:")
  println(bposTrimMagSqr)

  val jplMagtmp = Real[T].max(jplMagOp1, jplMagOp2)
  val jplMag = ShiftRegister(jplMagtmp, latency - jplMagLatency, true.B)
  
  val output = Wire(params.protoOut.cloneType)
  
  output := MuxLookup(ShiftRegister(io.sel.get, latency, en = true.B), jplMag,
                  Array(0.U -> magSqr,//trimMagSqr,//.asTypeOf(params.protoOut),
                        1.U -> jplMag))
  
  val skidInData = Wire(io.out.cloneType)
  skidInData.bits := output
  skidInData.valid := io.in.valid
  io.in.ready := skidInData.ready
  Skid(latency, skidInData, io.out) := output

  if (params.useLast) {
    val skidInLast = Wire(Flipped(DecoupledIO(Bool())))
    val skidOutLast = Wire(DecoupledIO(Bool()))
    skidOutLast.ready := io.out.ready
    skidInLast.bits := ShiftRegister(io.lastIn.get && io.in.fire(), latency, true.B)
    skidInLast.valid := io.in.valid
    Skid(latency, skidInLast, skidOutLast) := skidInLast.bits
    io.lastOut.get := skidOutLast.bits
  }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
class MagJPLandLogMagInst[T <: Data: Real : BinaryRepresentation](val params: MAGParams[T]) extends Module {
  val io = IO(MagMuxIO(params))
  
  val numAddPipes = params.numAddPipes
  val gen = params.protoIn
  val dataWidth = gen.getWidth
  val bpos = (gen match {
    case fp: FixedPoint => fp.binaryPoint.get
    case _ => 0
  })
  
  val bposLog = (params.protoLog.get match {
    case fp: FixedPoint => fp.binaryPoint.get
    case _ => 0
  })
  val dataWidthLog = params.protoLog.get.getWidth
  
  val jplMagLatency = 2 * numAddPipes
  val latency = jplMagLatency + numAddPipes
  
  val absInReal = Real[T].abs(io.in.bits.real)
  val absInImag = Real[T].abs(io.in.bits.imag)
  // for JPL approximation
  val u = Real[T].max(absInReal, absInImag)
  val v = Real[T].min(absInReal, absInImag)
  
  val jplMagOp1 = DspContext.withNumAddPipes(2*numAddPipes) { // to be aligned with jplMagOp2
                            u context_+ BinaryRepresentation[T].shr(v,3) } // U + V/8
  val tmpOp2 = DspContext.withNumAddPipes(numAddPipes) { u context_- BinaryRepresentation[T].shr(u,3) }
  
  val jplMagOp2 = DspContext.withNumAddPipes(numAddPipes) {
                            tmpOp2 context_+  ShiftRegister(BinaryRepresentation[T].shr(v, 1), numAddPipes, true.B) }
  
  val jplMagtmp = Real[T].max(jplMagOp1, jplMagOp2)
  val jplMag = ShiftRegister(jplMagtmp, latency - jplMagLatency, true.B)
  
  val logUInt = Log2(jplMagtmp.asUInt()) // log2(jplMag.asUInt()(dataWidth-1, binPoint-1))
  val logSInt = (logUInt - bpos.U).asSInt()
  
  val logLookUp = VecInit({
    val lnOf2 = scala.math.log(2)                                // natural log of 2
    def log2(x: Double): Double = scala.math.log(x) / lnOf2      // function log of 2
    val num = 1 << (params.log2LookUpWidth)                      // number of look-up table values
    val lookup = (0 until num).map(n => {
      val lookupWire = Wire(FixedPoint((bposLog + 1).W, bposLog.BP)) // +2?
      // log2(1+f)
      DspContext.withTrimType(Convergent) {
        lookupWire := lookupWire.cloneType.fromDoubleWithFixedWidth(log2(n.toDouble/num + 1))
      }
      lookupWire })
    lookup
  })
  // dsptools.DspException: OverflowType Grow is not supported for UInt subtraction
  // eliminate leading 1 - think about >> <<
  val noLeadOne = ShiftRegister((jplMagtmp.asUInt() - BinaryRepresentation[UInt].shl(1.U, logUInt).asTypeOf(jplMagtmp.asUInt)), numAddPipes, true.B)
  val shiftNum = ShiftRegister(dataWidth.U - logUInt - 1.U, numAddPipes, true.B)
  
  val logLookUpAddr = BinaryRepresentation[UInt].shl(noLeadOne, shiftNum)(dataWidth - 2, dataWidth - params.log2LookUpWidth - 1)
  val logFrac = Wire(FixedPoint((bposLog+1).W, bposLog.BP))
  logFrac := logLookUp(logLookUpAddr)

  val log2Mag = Wire(FixedPoint(dataWidthLog.W, bposLog.BP))
  log2Mag := ShiftRegister(logSInt.asFixedPoint(0.BP), numAddPipes, true.B) + logFrac
  
  val output = Wire(params.protoOut.cloneType)
  output := MuxLookup(ShiftRegister(io.sel.get, latency, en = true.B), jplMag,
                  Array(0.U -> jplMag,
                        1.U -> log2Mag))

  val skidInData = Wire(io.out.cloneType)
  skidInData.bits := output
  skidInData.valid := io.in.valid
  io.in.ready := skidInData.ready
  Skid(latency, skidInData, io.out) := output

  if (params.useLast) {
    val skidInLast = Wire(Flipped(DecoupledIO(Bool())))
    val skidOutLast = Wire(DecoupledIO(Bool()))
    skidOutLast.ready := io.out.ready
    skidInLast.bits := ShiftRegister(io.lastIn.get && io.in.fire(), latency, true.B)
    skidInLast.valid := io.in.valid
    Skid(latency, skidInLast, skidOutLast) := skidInLast.bits
    io.lastOut.get := skidOutLast.bits
  }
}

/**
 *  LogMagMux block computes power of the input signal (squared magnitude), magnitude using JPL aproximation 
 *  and log2 of the magnitude. Also it can bypass input data depending on selection input signal.
 */
class LogMagMuxInst[T <: Data: Real : BinaryRepresentation](val params: MAGParams[T]) extends Module {
  val io = IO(MagMuxIO(params))
  
  val gen = params.protoIn
  val dataWidth = gen.getWidth
  val bpos = (gen match {
    case fp: FixedPoint => fp.binaryPoint.get
    case _ => 0
  })

  val bposLog = (params.protoLog.get match {
    case fp: FixedPoint => fp.binaryPoint.get
    case _ => 0
  })
  val dataWidthLog = params.protoLog.get.getWidth
  
  val numAddPipes = params.numAddPipes
  val numMulPipes = params.numMulPipes
  val magSqrLatency = numAddPipes + numMulPipes
  val jplMagLatency = 2 * numAddPipes
  val log2Latency = jplMagLatency + numAddPipes // + numAddPipes - address generation
  val latency = magSqrLatency.max(log2Latency)
 
  val absInReal = Real[T].abs(io.in.bits.real)
  val absInImag = Real[T].abs(io.in.bits.imag)
  // for JPL approximation
  val u = Real[T].max(absInReal, absInImag)
  val v = Real[T].min(absInReal, absInImag)
  //val magSqr = Wire(params.protoIn)
  
  val jplMagOp1 = DspContext.withNumAddPipes(2*numAddPipes) { // to be aligned with jplMagOp2
                            u context_+ BinaryRepresentation[T].shr(v,3) } // U + V/8
  val tmpOp2 = DspContext.withNumAddPipes(numAddPipes) { u context_- BinaryRepresentation[T].shr(u,3) }
  
  val jplMagOp2 = DspContext.withNumAddPipes(numAddPipes) {
                            tmpOp2 context_+  ShiftRegister(BinaryRepresentation[T].shr(v, 1), numAddPipes, true.B) }  // (7/8)*U + 1/2*V
  
  val magSqr = DspContext.alter(DspContext.current.copy(numAddPipes = numAddPipes,  numMulPipes = numMulPipes, binaryPointGrowth = 0)) {
                       ShiftRegister((absInReal context_* absInReal) context_+ (absInImag context_* absInImag), latency - magSqrLatency, true.B)}
  dontTouch(magSqr)
  magSqr.suggestName("squared_magnitude")

  val trimNum = if (magSqr.getWidth - params.protoOut.getWidth > 0) magSqr.getWidth - params.protoOut.getWidth else 0
  //require(trimNum > 0, "Check core parameters such as protoIn and protoOut, some incompatibilities are detected")

  val trimMagSqr = DspContext.alter(DspContext.current.copy(trimType = params.trimType, binaryPointGrowth = 0)){ magSqr.div2(trimNum) }
  dontTouch(trimMagSqr)
  trimMagSqr.suggestName("trim_squared_magnitude")

  val jplMagtmp = Real[T].max(jplMagOp1, jplMagOp2)
  val jplMag = ShiftRegister(jplMagtmp, latency - jplMagLatency, true.B)
  // log(N) = k + log2(1 + f)
  // N = 2^k(1 + f)

  val logUInt = Log2(jplMagtmp.asUInt()) // log2(jplMag.asUInt()(dataWidth-1, binPoint-1))
  val logSInt = (logUInt - bpos.U).asSInt()
  
  val logLookUp = VecInit({
    val lnOf2 = scala.math.log(2)                                // natural log of 2
    def log2(x: Double): Double = scala.math.log(x) / lnOf2      // function log of 2
    val num = 1 << (params.log2LookUpWidth)                      // number of look-up table values
    val lookup = (0 until num).map(n => {
      val lookupWire = Wire(FixedPoint((bposLog + 1).W, bposLog.BP)) // +2?
      // log2(1+f)
      DspContext.withTrimType(Convergent) {
        lookupWire := lookupWire.cloneType.fromDoubleWithFixedWidth(log2(n.toDouble/num + 1))
      }
      lookupWire })
    lookup
  })
  // dsptools.DspException: OverflowType Grow is not supported for UInt subtraction
  // eliminate leading 1 - think about >> <<
  val noLeadOne = ShiftRegister((jplMagtmp.asUInt() - BinaryRepresentation[UInt].shl(1.U, logUInt).asTypeOf(jplMagtmp.asUInt)), numAddPipes, true.B)
  val shiftNum = ShiftRegister(dataWidth.U - logUInt - 1.U, numAddPipes, true.B)
  
  val logLookUpAddr = BinaryRepresentation[UInt].shl(noLeadOne, shiftNum)(dataWidth - 2, dataWidth - params.log2LookUpWidth - 1)
  val logFrac = Wire(FixedPoint((bposLog+1).W, bposLog.BP))
  logFrac := logLookUp(logLookUpAddr)

  val log2Mag = Wire(FixedPoint(dataWidthLog.W, bposLog.BP))
  log2Mag := ShiftRegister(ShiftRegister(logSInt.asFixedPoint(0.BP), numAddPipes, true.B) + logFrac, latency  - log2Latency, true.B)

  val output = Wire(params.protoOut.cloneType)
  
  output := MuxLookup(ShiftRegister(io.sel.get, latency, en = true.B), jplMag,
                Array(0.U -> magSqr,//trimMagSqr.asTypeOf(params.protoOut),
                      1.U -> jplMag,
                      2.U -> log2Mag))
  
  val skidInData = Wire(io.out.cloneType)
  skidInData.bits := output
  skidInData.valid := io.in.valid
  io.in.ready := skidInData.ready
  Skid(latency, skidInData, io.out) := output

  if (params.useLast) {
    val skidInLast = Wire(Flipped(DecoupledIO(Bool())))
    val skidOutLast = Wire(DecoupledIO(Bool()))
    skidOutLast.ready := io.out.ready
    skidInLast.bits := ShiftRegister(io.lastIn.get && io.in.fire(), latency, true.B)
    skidInLast.valid := io.in.valid
    Skid(latency, skidInLast, skidOutLast) := skidInLast.bits
    io.lastOut.get := skidOutLast.bits
  }
}
