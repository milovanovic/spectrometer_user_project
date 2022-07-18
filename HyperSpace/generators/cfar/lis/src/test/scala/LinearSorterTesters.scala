package lis

import chisel3._
import dsptools.DspTester
import dsptools.numbers._
import scala.util.{Random, Sorting}
import scala.collection.mutable.ArrayBuffer

class LinearSorterTesterTestLastIn[T <: Data](dut: LinearSorter[T], in: Seq[Double], tol: Int) extends DspTester(dut) {
  
  def expect_sorted_seq[T <: Data](sig_vec: Vec[T], exp_seq: Seq[Double], tol: Int) {
    sig_vec(0).cloneType match {
      case dspR: DspReal => exp_seq.zipWithIndex.foreach { case (expected, index) => realTolDecPts.withValue(tol) { expect(sig_vec(index), expected) }}
      case _ => exp_seq.zipWithIndex.foreach { case (expected, index) => fixTolLSBs.withValue(tol) { expect(sig_vec(index), expected) }}
    }
  }

  val cyclesWait = dut.params.LISsize
  val out = ArrayBuffer[Double]()
  val input1 = in.iterator
 // val input2 = in.iterator
  //var expOut = if (dut.params.sortDir == true) in.sorted.reverse.toArray else in.sorted.toArray
  var expOut = if (dut.params.sortDir == true) in.sorted.toArray else in.sorted.toArray.reverse
  var tmpData: Double = 0.0
  var tmpDataIn: Double = 0.0
  var discardPos = 0
  var cntValidOut = 0
  
  updatableDspVerbose.withValue(false) {
    poke(dut.io.out.ready, 0)
    poke(dut.io.in.valid, 0)
    step(2)

    if (dut.params.LIStype == "LIS_input") {
      discardPos = dut.params.LISsize/2
      poke(dut.io.discardPos.get, discardPos)
    }
    else if (dut.params.LIStype == "LIS_fixed") {
      discardPos = dut.params.discardPos.get
    }
    step(2)
    poke(dut.io.in.valid, 1)
    poke(dut.io.out.ready, 1)

    while (out.length < in.size) {
      if (input1.hasNext && peek(dut.io.in.ready)) {
        poke(dut.io.in.bits, input1.next())
        if (input1.hasNext == false) {
          poke(dut.io.lastIn, 1)
        }
      }
      else {
        poke(dut.io.in.valid, 0)
      }
      if (peek(dut.io.out.valid)) {
        tmpData = peek(dut.io.out.bits)
        if (dut.params.LIStype == "LIS_FIFO") {
          dut.params.proto match {
            case dspR: DspReal => realTolDecPts.withValue(tol) { expect(dut.io.out.bits, in(out.length)) }
            case _ =>  fixTolLSBs.withValue(tol) { expect(dut.io.out.bits, in(out.length)) }
          }
          if (cntValidOut == in.size - 1) {
            expect(dut.io.lastOut, 1)
          }
          cntValidOut += 1
        }
        else {
          val peekedOutput = peek(dut.io.sortedData(0))
          dut.params.proto match {
            case dspR: DspReal => realTolDecPts.withValue(tol) { expect(dut.io.out.bits,  peekedOutput) }
            case _ =>  fixTolLSBs.withValue(tol) { expect(dut.io.out.bits, peekedOutput) }
          }
        }
        out += tmpData
      }
      step(1)
    }
  }
}

class LinearSorterTester[T <: Data](dut: LinearSorter[T], in: Seq[Double], tol: Int) extends DspTester(dut) {
  
  def expect_sorted_seq[T <: Data](sig_vec: Vec[T], exp_seq: Seq[Double], tol: Int) {
    sig_vec(0).cloneType match {
      case dspR: DspReal => exp_seq.zipWithIndex.foreach { case (expected, index) => realTolDecPts.withValue(tol) { expect(sig_vec(index), expected) }}
      case _ => exp_seq.zipWithIndex.foreach { case (expected, index) => fixTolLSBs.withValue(tol) { expect(sig_vec(index), expected) }}
    }
  }

  val cyclesWait = dut.params.LISsize
  val out = ArrayBuffer[Double]()
  val input1 = in.iterator
  val input2 = in.iterator
  //var expOut = if (dut.params.sortDir == true) in.sorted.reverse.toArray else in.sorted.toArray
  var expOut = if (dut.params.sortDir == true) in.sorted.toArray else in.sorted.toArray.reverse
  var tmpData: Double = 0.0
  var tmpDataIn: Double = 0.0
  var discardPos = 0

  updatableDspVerbose.withValue(false) {
    poke(dut.io.out.ready, 0)
    poke(dut.io.in.valid, 0)
    if (dut.params.flushData) {
      poke(dut.io.flushData.get, 0)
    }
    step(2)

    if (dut.params.LIStype == "LIS_input") {
      discardPos = dut.params.LISsize/2
      poke(dut.io.discardPos.get, discardPos)
    }
    else if (dut.params.LIStype == "LIS_fixed") {
      discardPos = dut.params.discardPos.get
    }
    step(2)
    poke(dut.io.in.valid, 1)
    poke(dut.io.out.ready, 1)

    while (out.length < in.size) {
      if (input1.hasNext && peek(dut.io.in.ready)) {
      //if (input1.hasNext) {
        poke(dut.io.in.bits, input1.next())
      }
      else if (input2.hasNext && peek(dut.io.in.ready) && dut.params.flushData == true) {
        poke(dut.io.in.bits, input2.next())
      }
      else if (dut.params.flushData == true) { // check flush
        poke(dut.io.in.valid, 0)
      }//*/
      //expOut = Sorting.quickSort(expOut :+ peek(dut.io.in.bits))
      if (peek(dut.io.out.valid)) {
        tmpData = peek(dut.io.out.bits)
        if (dut.params.LIStype == "LIS_FIFO") {
          //println("Expected output is: ")
          //println(expOut.map(_.toString()).mkString(", "))

          dut.params.proto match {
            case dspR: DspReal => realTolDecPts.withValue(tol) { expect(dut.io.out.bits, in(out.length)) }
            case _ =>  fixTolLSBs.withValue(tol) { expect(dut.io.out.bits, in(out.length)) }
          }
          expect_sorted_seq(dut.io.sortedData, expOut, tol)
          discardPos = expOut.indexWhere(t => t == in(out.length))
          expOut(discardPos) = tmpDataIn
          expOut = if (dut.params.sortDir) expOut.sorted else expOut.sorted.reverse
        }
        else {
         //println("Expected output is: ")
         //println(expOut.map(_.toString()).mkString(", "))

          dut.params.proto match {
            case dspR: DspReal => realTolDecPts.withValue(tol) { expect(dut.io.out.bits, expOut(discardPos)) }
            case _ =>  fixTolLSBs.withValue(tol) { expect(dut.io.out.bits, expOut(discardPos)) }
          }
          //fixTolLSBs.withValue(tol) { expect(dut.io.out.bits, expOut(discardPos)) }
          expect_sorted_seq(dut.io.sortedData, expOut, tol)
          expOut(discardPos) = tmpDataIn
          expOut = if (dut.params.sortDir) expOut.sorted else expOut.sorted.reverse // can be optimized!
        }
        out += tmpData
      }
      tmpDataIn = peek(dut.io.in.bits)
      step(1)
    }
    poke(dut.io.in.valid, 0)
    step(5)
    if (dut.params.flushData) {
      poke(dut.io.flushData.get, 1)
      val out_flush = ArrayBuffer[Double]()
      step(1)
      while (peek(dut.io.out.valid) & out_flush.length < dut.params.LISsize) {
        tmpData = peek(dut.io.out.bits)
        if (dut.params.LIStype == "LIS_FIFO") {
          dut.params.proto match {
            case dspR: DspReal => realTolDecPts.withValue(tol) { expect(dut.io.out.bits, in(out_flush.length)) }
            case _ =>  fixTolLSBs.withValue(tol) { expect(dut.io.out.bits, in(out_flush.length)) }
          }
        }
        else {
          val peekedOutput = peek(dut.io.sortedData(0))
          dut.params.proto match {
            case dspR: DspReal => realTolDecPts.withValue(tol) { expect(dut.io.out.bits,  peekedOutput) }
            case _ =>  fixTolLSBs.withValue(tol) { expect(dut.io.out.bits, peekedOutput) }
          }
        }
        out_flush += tmpData
        step(1)
      }
    }
    step(dut.params.LISsize*2)
  }
  //println(out.map(_.toString()).mkString(", "))
}

class LinearSorterTesterRunTime[T <: Data](dut: LinearSorter[T], in: Seq[Double], tolLSB: Int) extends DspTester(dut) {

  def expect_sorted_seq[T <: Data](sig_vec: Vec[T], exp_seq: Seq[Double], tolLSB: Int) {
    exp_seq.zipWithIndex.foreach { case (expected, index) => fixTolLSBs.withValue(tolLSB) { expect(sig_vec(index), expected) }}
  }

  var out = ArrayBuffer[Double]() // ArrayBuffer is resizable, Array isn't
  var input = in.iterator
  val sorterSizesSet = (2 to dut.params.LISsize).toList
  val runTimeSorterSizes = Random.shuffle(sorterSizesSet)

  var expOut = if (dut.params.sortDir == true) in.sorted.toArray else in.sorted.toArray.reverse
  var tmpData: Double = 0.0
  var tmpDataIn: Double = 0.0
  var discardPos = 0

  updatableDspVerbose.withValue(false) {
    if (dut.params.LIStype == "LIS_input") {
      discardPos = 0 
      poke(dut.io.discardPos.get, discardPos)
    }
    else if (dut.params.LIStype == "LIS_fixed") {
      discardPos = 0
    }
    step(10)

    for ((size, index) <- runTimeSorterSizes.zipWithIndex) {
      // define here 
      out = ArrayBuffer[Double]()
      expOut = if ((dut.params.sortDir && !dut.params.rtcSortDir) || (dut.params.rtcSortDir && index % 2 == 0)) in.take(size).sorted.toArray else in.take(size).sorted.toArray.reverse
      //println(expOut.map(_.toString()).mkString(", "))
      input = in.iterator

      if (dut.params.rtcSortDir) {
        poke(dut.io.sortDir.get, index % 2 == 0) //alternating true, false, true, false ...
      }
      step(1)
      reset(5)
      poke(dut.io.lisSize.get, size)
      poke(dut.io.out.ready, 0)
      poke(dut.io.in.valid, 0)
      step(5)

      poke(dut.io.out.ready, 1)
      poke(dut.io.in.valid, 1)

      while (out.length < size) {
        if (input.hasNext && peek(dut.io.in.ready)) {
          poke(dut.io.in.bits, input.next())
        }
        if (peek(dut.io.out.valid)) {
          tmpData = peek(dut.io.out.bits)
          if (dut.params.LIStype == "LIS_FIFO") {
            //println("Expected output is: ")
            //println(expOut.map(_.toString()).mkString(", "))
            fixTolLSBs.withValue(tolLSB) { expect(dut.io.out.bits, in(out.length)) }
            expect_sorted_seq(dut.io.sortedData, expOut, tolLSB)
            discardPos = expOut.indexWhere(t => t == in(out.length))

            expOut(discardPos) = peek(dut.io.in.bits) //tmpDataIn
            expOut = if ((dut.params.sortDir && !dut.params.rtcSortDir) || (dut.params.rtcSortDir && index % 2 == 0)) expOut.sorted else expOut.sorted.reverse
          }
          else {
           // println("Expected output is:")
           // println(expOut.map(_.toString()).mkString(", "))
            fixTolLSBs.withValue(tolLSB) { expect(dut.io.out.bits, expOut(discardPos)) }
            expect_sorted_seq(dut.io.sortedData, expOut, tolLSB)
            expOut(discardPos) = peek(dut.io.in.bits)
            expOut = if ((dut.params.sortDir && !dut.params.rtcSortDir) || (dut.params.rtcSortDir && index % 2 == 0)) expOut.sorted else expOut.sorted.reverse // try with sortWith
          }
          out += tmpData
        }
        // peek works on falling edge!!!
        tmpDataIn = peek(dut.io.in.bits)
        step(1)
      }
      poke(dut.io.in.valid, 0)
      step(1)
    }
  }
  // set to zero to provide correct behaviour for all sorter sizes
}
