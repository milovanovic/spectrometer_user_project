package lis

import chisel3._
import chisel3.util._

class PEControlLogicIO extends Bundle {
  val currCompOut  = Input(Bool())
  val leftCompOut = Input(Bool())
  val rightCompOut = Input(Bool())

  val currDiscard = Input(Bool())
  val rightPropDiscard = Input(Bool())

  val propDiscard = Output(Bool())
  val load = Output(Bool())
  val leftRightShift = Output(Bool())
  val rstPEregs = Output(Bool())
}

class PEControlLogic extends Module {
  val io = IO(new PEControlLogicIO)

  val load = Wire(Bool())
  load := (io.currCompOut ^ io.rightPropDiscard) | io.currDiscard

  io.load := load
  io.leftRightShift := io.currCompOut & load
  io.propDiscard := io.currDiscard | io.rightPropDiscard

  io.rstPEregs := load & ((io.leftCompOut & !io.currCompOut) + (!io.rightCompOut & io.currCompOut))
}
