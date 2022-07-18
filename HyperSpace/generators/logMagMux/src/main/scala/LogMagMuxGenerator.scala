// SPDX-License-Identifier: Apache-2.0

package magnitude

import chisel3._
import chisel3.util._
import chisel3.experimental._

import dsptools._
import dsptools.numbers._
import scala.math._

sealed trait MagType

case object MagJPL extends MagType // sel is zero
case object MagJPLandSqrMag extends MagType
case object LogMag extends MagType // sel is zero
case object MagJPLandLogMag extends MagType
case object LogMagMux extends MagType // Mux, this type of the design provides MagJPL, MagSqr, LogMag

// IMPORTANT TODO: use trim squared magnitude and adjust tests according to that
case class MAGParams[T <: Data] (
  val protoIn         : T,                      // type of the real and imag part of the input data
  val protoOut        : T,                      // output data type
  val protoLog        : Option[T] = None,
  val magType         : MagType = LogMagMux,    // include different magnitude types
  val log2LookUpWidth : Int = 16,               // number of bits that are input address at look_up_table
  val useLast         : Boolean = true ,        // use lastIn and lastOut AXI signals
  val numAddPipes     : Int = 1,                // number of pipeline registers after + operation
  val numMulPipes     : Int = 1,                // number of pipeline registers after * operation
  val binPointGrowth  : Int = 0,                // when multiplication is included (squared magnitude), determines binary point growth logic
  val trimType        : TrimType = RoundHalfUp  // TrimType - used for div2 and trimBinary
) {
  requireIsChiselType(protoIn)
  if (((magType == LogMag) || (magType == LogMagMux) || (magType == MagJPLandLogMag))) {
    require(!protoLog.isEmpty, s"The chosen mag type requires that protoLog is defined")
  }
}

class MagMuxIO[T <: Data: Real](val params: MAGParams[T]) extends Bundle {
  val in = Flipped(Decoupled(DspComplex(params.protoIn)))
  val lastIn = if (params.useLast) Some(Input(Bool())) else None
  val out = Decoupled(params.protoOut)
  val sel = if (params.magType == MagJPLandSqrMag || params.magType == MagJPLandLogMag || params.magType == LogMagMux) Some(Input(UInt(2.W))) else None
  val lastOut = if (params.useLast) Some(Output(Bool())) else None
  
  override def cloneType: this.type = MagMuxIO(params).asInstanceOf[this.type]
}
object MagMuxIO {
  def apply[T <: Data : Real](params: MAGParams[T]): MagMuxIO[T] = new MagMuxIO(params)
}


class LogMagMuxGenerator[T <: Data: Real : BinaryRepresentation](val params: MAGParams[T]) extends Module {
  val io = IO(MagMuxIO(params))
  
  val magModule = params.magType match {
    case MagJPL => Module(new MagJPLInst(params))
    case LogMag => Module(new LogMagInst(params))
    case MagJPLandSqrMag => Module(new MagJPLandSQRMagInst(params))
    case MagJPLandLogMag => Module(new MagJPLandLogMagInst(params))
    case LogMagMux =>  Module(new LogMagMuxInst(params))
  }
  magModule.io.in <> io.in
  io.out <> magModule.io.out

  if (params.magType == MagJPLandSqrMag || params.magType == MagJPLandLogMag || params.magType == LogMagMux) {
    magModule.io.sel.get := io.sel.get
  }

  if (params.useLast) {
    magModule.io.lastIn.get := io.lastIn.get
    io.lastOut.get := magModule.io.lastOut.get
  }
}

object LogMagMuxApp extends App
{
  val params: MAGParams[FixedPoint] =  MAGParams(
    protoIn  = FixedPoint(16.W, 8.BP),
    protoOut = FixedPoint(16.W, 8.BP), // output thres
    protoLog = Some(FixedPoint(16.W, 8.BP)),
    magType  = MagJPLandSqrMag,//MagJPLandLogMag,
    log2LookUpWidth = 8,
    useLast = true,
    numAddPipes = 1,
    numMulPipes = 1
  )
  chisel3.Driver.execute(args,()=>new LogMagMuxGenerator(params))
}


