package lis

import chisel3._
import chisel3.util._
import dsptools.numbers._
import chisel3.experimental.FixedPoint

class PEmembers [T <: Data: Real] (proto: T, sorterSize: Int) extends Bundle {
  val data =    proto
  val lifeCNT = UInt(log2Up(sorterSize).W)
  val compRes = Bool()
  override def cloneType: this.type = PEmembers(proto, sorterSize).asInstanceOf[this.type] // must have cloneType
}

object PEmembers {
  def apply[T <: Data: Real] (proto: T, sorterSize: Int): PEmembers[T] = new PEmembers(proto, sorterSize)
}

//Both compile and run time configurable!
class PEIO[T <: Data: Real] (params: LISParams[T]) extends Bundle {
  //must have proto.cloneType instead of proto!!!!
  val enableSort = Input(Bool())
  val state = Input(UInt(2.W))

  val leftNBR = Input(PEmembers(params.proto.cloneType, params.LISsize))
  val rightNBR = Input(PEmembers(params.proto.cloneType, params.LISsize))
  val currCell = Output(PEmembers(params.proto.cloneType, params.LISsize))

  val lisSize = if (params.rtcSize == true) Some(Input(UInt((log2Up(params.LISsize)+1).W))) else None
  val lastCell = if (params.rtcSize) Some(Input(Bool())) else None
  val active = if (params.rtcSize) Some(Input(Bool())) else None
  val discard = if (params.LIStype == "LIS_input" || params.LIStype == "LIS_fixed")  Some(Input(Bool())) else None
  val sortDir = if (params.rtcSortDir) Some(Input(Bool())) else None

  val inData = Input(params.proto.cloneType)
  val rightPropDiscard = Input(Bool()) // cnti+1

  val leftOutData = Output(params.proto.cloneType)
  val rightOutData = Output(params.proto.cloneType)
  val currDiscard = Output(Bool())
  val toLeftPropDiscard = Output(Bool())

  override def cloneType: this.type = PEIO(params).asInstanceOf[this.type]
}

object PEIO {
  def apply[T <: Data : Real](params: LISParams[T]): PEIO[T] = new PEIO(params)
}

class PE [T <: Data: Real] (val params: LISParams[T], index: Int) extends Module {
  val io = IO(PEIO(params))

  val ctrlLogic = Module(new PEControlLogic)

  if (index == 0) {
    ctrlLogic.io.leftCompOut := true.B
  }
  else {
    ctrlLogic.io.leftCompOut := io.leftNBR.compRes
  }

  when (io.active.getOrElse(true.B) && ~io.lastCell.getOrElse((index == (params.LISsize - 1)).B)) {
    ctrlLogic.io.rightCompOut := io.rightNBR.compRes
    ctrlLogic.io.rightPropDiscard := io.rightPropDiscard
  }
  .otherwise {
    ctrlLogic.io.rightCompOut := false.B//io.rightNBR.compRes
    ctrlLogic.io.rightPropDiscard := false.B //io.rightPropDiscard
  }

  val rstProto = Wire(params.proto.cloneType)

  val n_min = params.proto match {
    case f: FixedPoint => -(1 << (f.getWidth - f.binaryPoint.get - 1)).toDouble
    case s: SInt => -(1<< (s.getWidth-1)).toDouble
    case u: UInt =>  0.0
    case d: DspReal => Double.MinValue
  }

  val n_max = params.proto match {
    case f: FixedPoint => ((1 << (f.getWidth - f.binaryPoint.get - 1)) - math.pow(2, -f.binaryPoint.get)).toDouble
    case s: SInt => (1<< (s.getWidth-1)-1).toDouble
    case u: UInt =>  ((1 << u.getWidth)-1).toDouble
    case d: DspReal => Double.MaxValue
  }

  rstProto := Mux(io.sortDir.getOrElse(params.sortDir.B), Real[T].fromDouble(n_min), Real[T].fromDouble(n_max))

  val load =  io.enableSort & ctrlLogic.io.load
  val cellData = Wire(params.proto)
  val rightOrLeftCNT = Wire(io.currCell.lifeCNT.cloneType)

  when (io.lastCell.getOrElse((index == (params.LISsize-1)).B)) {
    cellData := io.leftNBR.data
    rightOrLeftCNT := io.leftNBR.lifeCNT
  }
  .elsewhen (io.active.getOrElse(true.B) && (index != 0).B) { //try to shift (index!=0) inside getOrElse
    cellData := Mux(ctrlLogic.io.leftRightShift, io.rightNBR.data, io.leftNBR.data)
    rightOrLeftCNT := Mux(ctrlLogic.io.leftRightShift, io.rightNBR.lifeCNT, io.leftNBR.lifeCNT)
  }
  .otherwise {
    if (index == 0) {
      cellData := io.rightNBR.data
      rightOrLeftCNT := io.rightNBR.lifeCNT
    }
    else {
      cellData := rstProto
      rightOrLeftCNT := index.U
    }
  }

  val saveCellData = RegInit(rstProto)//RegEnable(cellData, rstProto, load)

  when (io.state === 0.U) {
    saveCellData := rstProto
  }
  .elsewhen (load) {
    saveCellData := cellData
  }

  val compRes = Mux(io.sortDir.getOrElse(params.sortDir.B), saveCellData < io.inData, saveCellData > io.inData)

  // too long parameter list!
  val (cntLife, discard) = LifeCounter(io.enableSort, ctrlLogic.io.rstPEregs, index.U, load, params.LISsize, rightOrLeftCNT, io.lisSize.getOrElse(params.LISsize.U))

  ctrlLogic.io.currCompOut := compRes

  //Leave DontCare
  if (index == 0) {
    io.toLeftPropDiscard := DontCare
  }
  else {
    io.toLeftPropDiscard := ctrlLogic.io.propDiscard
  }

  io.currCell.compRes := compRes
  io.currCell.data := saveCellData

  if (index == 0) {
    io.leftOutData := DontCare
  }
  else {
    io.leftOutData := Mux(compRes, saveCellData, io.inData)
  }

  when (io.active.getOrElse(!(index == (params.LISsize-1)).B)) {
    io.rightOutData := Mux(compRes, io.inData, saveCellData)
  }
  .otherwise {
    io.rightOutData := saveCellData
    // what is better?
    /*if (index == (params.LISsize-1)) {
      io.rightOutData := DontCare
    }
    else {
      io.rightOutData := saveCellData
    }*/
  }

  // code below can be also reduced!
  if (params.LIStype == "LIS_FIFO") {
    ctrlLogic.io.currDiscard := discard
    io.currDiscard := discard
    io.currCell.lifeCNT := cntLife
  }
  else {
    ctrlLogic.io.currDiscard := io.discard.get
    io.currDiscard := io.discard.get
    io.currCell.lifeCNT := DontCare
  }
}

object PEApp extends App
{
  val params: LISParams[FixedPoint] = LISParams(
    proto = FixedPoint(16.W, 14.BP),
    LISsize = 64,
    LIStype = "LIS_FIFO",
    rtcSize = false,
    sortDir = true
  )
  chisel3.Driver.execute(args,()=>new PE(params, 2))
}
