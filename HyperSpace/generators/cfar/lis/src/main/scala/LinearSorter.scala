package lis

import chisel3._
import chisel3.util._
import dsptools._
import dsptools.numbers._
import chisel3.experimental.FixedPoint

import chisel3.internal.requireIsChiselType

case class LISParams[T <: Data: Real](
  proto: T,
  LISsize: Int,
  LIStype: String = "LIS_FIFO",
  rtcSize: Boolean = false,
  rtcSortDir: Boolean = false,
  discardPos: Option[Int] = None,
  flushData: Boolean = false,
  useSorterFull: Boolean = false,
  useSorterEmpty: Boolean = false,
  sortDir: Boolean = true,
) {

  final val allowedLISTypes = Seq("LIS_FIFO", "LIS_input", "LIS_fixed")
  requireIsChiselType(proto,  s"($proto) must be chisel type")

  def checkLISType() {
    require(allowedLISTypes.contains(LIStype), s"""LIS type must be one of the following: ${allowedLISTypes.mkString(", ")}""")
  }
  def checkLIS_fixedSettings() {
    require((LIStype == "LIS_fixed" && !discardPos.isEmpty) || LIStype != "LIS_fixed" ,s"Position of discarding element must be defined for LIS_fixed linear sorter scheme")
  }
   def checkDiscardPosition() {
    require((discardPos.getOrElse(0) < LISsize), s"Position of discarding element must be less than sorter size")
  }
}
//dut.io.flushData.get
class LISIO[T <: Data: Real] (params: LISParams[T]) extends Bundle {
  val in = Flipped(Decoupled(params.proto))
  val lastIn = Input(Bool())
  val flushData = if (params.flushData) Some(Input(Bool())) else None
  val out = Decoupled(params.proto)
  val lastOut = Output(Bool())
  val sortedData = Output(Vec(params.LISsize, params.proto)) // for fpga testing this output is not used

  val sortDir = if (params.rtcSortDir) Some(Input(Bool())) else None
  val sorterFull = if (params.useSorterFull) Some(Output(Bool())) else None
  val sorterEmpty = if (params.useSorterEmpty) Some (Output(Bool())) else None
  val lisSize = if (params.rtcSize == true) Some(Input(UInt((log2Up(params.LISsize)+1).W))) else None
  val discardPos = if (params.LIStype == "LIS_input") Some(Input(UInt(log2Up(params.LISsize).W))) else None

  override def cloneType: this.type = LISIO(params).asInstanceOf[this.type]
}

object LISIO {
  def apply[T <: Data : Real](params: LISParams[T]): LISIO[T] = new LISIO(params)
}

class LinearSorter [T <: Data: Real] (val params: LISParams[T]) extends Module {
  require(params.LISsize > 1, s"Sorter size must be > 1")
  params.checkLISType()
  params.checkLIS_fixedSettings()
  params.checkDiscardPosition()

  val io = IO(LISIO(params))

  val initialInDone = RegInit(false.B)
  val cntInData = RegInit(0.U(log2Up(params.LISsize).W))
  val cellIndices = (0 until params.LISsize)
  val goToIdle = RegInit(false.B)
  val activeCells = Wire(Vec(params.LISsize, Bool()))

  val outputData = Wire(Vec(params.LISsize, params.proto))
  val discardSignals = Wire(Vec(params.LISsize, Bool()))

  // FSM states for control logic
  val sIdle :: sProcess :: sFlush :: Nil = Enum(3)
  val state = RegInit(sIdle)
  val state_next = Wire(state.cloneType)

  val lisSizeReg = RegInit(params.LISsize.U)
  val sortDirReg = RegInit(params.sortDir.B)

  activeCells.zipWithIndex.map { case (active, index) => {
    if (params.rtcSize)
      active := Mux(index.U <= (lisSizeReg-1.U), true.B, false.B)
    else
      active := true.B
    }
  }
  when (io.in.fire()) {
    cntInData := cntInData +% 1.U
  }
  .elsewhen (state === sIdle) {
    cntInData := 0.U
  }

  when (cntInData === (lisSizeReg - 1.U) && io.in.fire()) {
    initialInDone := true.B
  }
  .elsewhen (state_next === sIdle) {
    initialInDone := false.B
  }

  state_next := state
  val enable = io.out.valid && io.out.ready && state === sFlush
  val cntOutDataWire = Wire(UInt(log2Up(params.LISsize).W))
  val (cntOutData, wrap) = CounterWithReset(cond = enable, initValue = 0.U((log2Up(params.LISsize)).W), reset = state === sIdle, n = params.LISsize)
 
  cntOutDataWire := cntOutData
  val fireLastIn = io.lastIn && io.in.fire()
  // lastOut can be asserted  either when lastIn is active and flushData register is used
  switch (state) {
    is (sIdle) {
      lisSizeReg := io.lisSize.getOrElse(params.LISsize.U)
      sortDirReg := io.sortDir.getOrElse(params.sortDir.B)
      when (io.in.fire()) { state_next := sProcess }
    }
    is (sProcess) {
      when ((io.flushData.getOrElse(false.B) || fireLastIn)) {
        state_next := sFlush
      }
    }
    is (sFlush) {
      when (cntOutDataWire === (lisSizeReg-1.U)) {
        state_next := sIdle
      }
    }
  }
//   state_next.suggestName("state_next")
//   dontTouch(state_next)
  state := state_next
  val inputData = Wire(io.in.bits.cloneType)

  if (params.LIStype != "LIS_FIFO")
  // if state is sFlush then always insert smallest or largest number depending on sorting direction
    inputData := Mux(state_next =/= sFlush, io.in.bits, outputData(lisSizeReg-1.U))
  else
    inputData := io.in.bits

  val PEChain = cellIndices.map {
    case (ind) => {
      val cell = Module(new PE(params,ind))
      cell.io.inData := inputData//RegNext(inputData)//(io.in.bits)
      if (params.rtcSize) {
        cell.io.lisSize.get := io.lisSize.get // this info is only necessary for FIFO based scheme
        cell.io.active.get := activeCells(ind)
        cell.io.lastCell.get := ind.U === (lisSizeReg - 1.U)
      }
      if (params.rtcSortDir) {
        cell.io.sortDir.get := sortDirReg
      }
      if (params.LIStype != "LIS_FIFO") {
        when (state === sFlush) {
          if (ind == 0)
            cell.io.discard.get := true.B && initialInDone
          else
            cell.io.discard.get := false.B
        }
        .elsewhen (ind.U === io.discardPos.getOrElse(params.discardPos.get.U)) {
          cell.io.discard.get := true.B && initialInDone
        }
        .otherwise {
          cell.io.discard.get := false.B
        }
      }
      //cell.io.enableSort := (RegNext(io.in.fire()) && activeCells(ind))
      cell.io.enableSort := io.in.fire() || (state === sFlush && io.out.ready)//(RegNext(io.in.fire()) || (state === sFlush && io.out.ready)) && activeCells(ind)
      cell.io.state := state_next
      outputData(ind) := cell.io.currCell.data
      discardSignals(ind) := cell.io.currDiscard
    cell
    }
  }
  // get position of discarded cell so that it can be sent to the output
  val getDiscarded = Wire(UInt(log2Up(params.LISsize+1).W))
  getDiscarded := PriorityEncoder(discardSignals.asUInt)

  // first PE doesn't have left neighbour
  PEChain(0).io.leftNBR := DontCare
  // last PE doesn't have right neighbour
  PEChain(params.LISsize-1).io.rightNBR := DontCare
  PEChain(params.LISsize-1).io.rightPropDiscard := DontCare

  PEChain.tail.map(_.io).foldLeft(PEChain(0).io) {
    case (cell1_io, cell2_io) => {
      cell2_io.leftNBR.data := cell1_io.rightOutData
      cell2_io.leftNBR.compRes := cell1_io.currCell.compRes
      cell2_io.leftNBR.lifeCNT := cell1_io.currCell.lifeCNT
      cell1_io.rightNBR.data := cell2_io.leftOutData
      cell1_io.rightNBR.compRes := cell2_io.currCell.compRes
      cell1_io.rightNBR.lifeCNT := cell2_io.currCell.lifeCNT
      cell1_io.rightPropDiscard  := cell2_io.toLeftPropDiscard
      cell2_io
    }
  }

  if (params.useSorterFull) {
    io.sorterFull.get := initialInDone && state =/= sFlush
  }
  if (params.useSorterEmpty) {
    io.sorterEmpty.get := state === sIdle
  }

  io.sortedData := outputData
  io.out.bits := outputData(getDiscarded)
  io.lastOut  := cntOutDataWire === (lisSizeReg-1.U)
  io.in.ready := ~initialInDone || io.out.ready && state =/= sFlush
  io.out.valid := initialInDone && io.in.valid || state === sFlush //initialInDone && RegNext(io.in.valid) || state === sFlush
}

object LISApp extends App
{
  val params: LISParams[FixedPoint] = LISParams(
    proto = FixedPoint(16.W, 14.BP),
    LISsize = 8,
    LIStype = "LIS_input",
    rtcSize = false,
    sortDir = true
  )
  chisel3.Driver.execute(args,()=>new LinearSorter(params))
}
