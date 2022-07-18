// SPDX-License-Identifier: Apache-2.0

package magnitude

import dsptools.{DspTester, DspContext}
import chisel3._
import chisel3.iotesters.Driver
import chisel3.experimental.FixedPoint
//import scala.util.Random - for Random.nextInt

import breeze.math.Complex

class LogMagMuxTester[T <: Data](dut: LogMagMuxGenerator[T]) extends DspTester(dut) {

  def testMux(inp: Seq[Complex], out: Seq[Seq[Double]], tolLSBs: Int = 3) {
    require(dut.params.magType == LogMagMux, "This test requires that magType is LogMagMux")
    val numAddPipes = dut.params.numAddPipes
    val numMulPipes = dut.params.numMulPipes

    val magSqrLatency = numAddPipes + numMulPipes
    val jplMagLatency = 2 * numAddPipes
    val log2Latency = jplMagLatency + numAddPipes
    
    val latency = magSqrLatency.max(log2Latency)

    val outComplex : Seq[Seq[Double]] = out
    poke(dut.io.in.valid, 1)
    poke(dut.io.out.ready, 1)
    
    val genIn = dut.params.protoIn
    val genLog = dut.params.protoLog
    
    val dataWidth = genIn.getWidth
    val bposIn = (genIn match {
      case fp: FixedPoint => fp.binaryPoint.get
      case _ => 0
    })
    
    val bposLog = (genLog.getOrElse(genIn) match {
      case fp: FixedPoint => fp.binaryPoint.get
      case _ => 0
    })
    
    val mulLog = if (bposIn < bposLog) math.pow(2, bposLog - bposIn) else 1
    
    outComplex.zipWithIndex.foreach { case (value, index) =>
      poke(dut.io.in.bits, inp(index))

      println("Magnitude squared:")
      poke(dut.io.sel.get, 0)
      step(latency + 1)
      fixTolLSBs.withValue(6) { expect(dut.io.out.bits, value(0)) }
      
      println("JPL magnitude:")
      poke(dut.io.sel.get, 1)
      step(latency + 1)
      fixTolLSBs.withValue(tolLSBs) { expect(dut.io.out.bits, value(1)) }

      println("Log2 magnitude:")
      poke(dut.io.sel.get, 2)
      step(latency + 1)
      val outTmp = peek(dut.io.out.bits)
      fixTolLSBs.withValue(tolLSBs) { expect(dut.io.out.bits, value(2) * mulLog) }
      step(1)
    }
    poke(dut.io.in.valid, 0)
    poke(dut.io.out.ready, 0)
  }
  
  def testStream(inp: Seq[Complex], sel: Int, out: Seq[Double], tolLSBs: Int = 3) {
    require(dut.params.useLast, "This test must have included lastIn and lastOut signal")
    
    val genIn = dut.params.protoIn
    val genLog = dut.params.protoLog.getOrElse(genIn)

    val dataWidth = genIn.getWidth
    val bposIn = (genIn match {
      case fp: FixedPoint => fp.binaryPoint.get
      case _ => 0
    })
    
    val bposLog = (genLog match {
      case fp: FixedPoint => fp.binaryPoint.get
      case _ => 0
    })
    
    val mulLog = if (bposIn > bposLog) math.pow(2, bposIn - bposLog) else 1
    
//    println("Expected result should be: ")
//    out.map(c => println(dut.toString))
    
    val input = inp.iterator
    var cntValidOut = 0
    var cntValidIn = 0
    
    poke(dut.io.in.valid, 1)
    if (dut.params.magType == MagJPLandSqrMag || dut.params.magType == MagJPLandLogMag || dut.params.magType == LogMagMux) {
      poke(dut.io.sel.get, sel)
    }
    
    // fill pipes and then enable output side
    while (input.hasNext && peek(dut.io.in.ready)) {
      if (cntValidIn == (inp.length - 1)) {
        poke(dut.io.in.bits, input.next())
        poke(dut.io.lastIn.get, 1)
      }
      else {
        poke(dut.io.in.bits, input.next())
      }
      cntValidIn += 1
      step(1)
    }
    
    poke(dut.io.lastIn.get, 0)
    step(10)
    poke(dut.io.out.ready, 1)
  
    while (cntValidOut < out.length) {
      if (input.hasNext) {
        if (cntValidIn == (inp.length - 1)) {
          poke(dut.io.in.bits, input.next())
          poke(dut.io.lastIn.get, 1)
        }
        else {
          poke(dut.io.in.bits, input.next())
        }
        cntValidIn += 1
      }
      else {
        poke(dut.io.in.valid, 0)
        poke(dut.io.lastIn.get, 0)
      }
      if (peek(dut.io.out.valid)) {
        if (cntValidOut == (out.length - 1)) {
          fixTolLSBs.withValue(tolLSBs) { expect(dut.io.out.bits, out(cntValidOut)) }
          expect(dut.io.lastOut.get, 1)
        }
        else {
          fixTolLSBs.withValue(tolLSBs) { expect(dut.io.out.bits, out(cntValidOut)) }
          expect(dut.io.lastOut.get, 0)
        }
        cntValidOut += 1
      }
      step(1)
    }
    cntValidOut = 0

    poke(dut.io.in.valid, 0)
    poke(dut.io.out.ready, 0)
    step(2)
    poke(dut.io.out.ready, 1)
    
    for (i <- 0 until inp.size) {
      poke(dut.io.in.valid, 0)
      val delay = 2 //Random.nextInt(5)
      for (i <- 0 to delay) {
        if (peek(dut.io.out.valid) == true) {
          fixTolLSBs.withValue(tolLSBs) { expect(dut.io.out.bits, out(cntValidOut)) }
          cntValidOut += 1
        }
        step(1)
      }
      poke(dut.io.in.valid, 1)
      poke(dut.io.in.bits, inp(i))
      
      if (i == (inp.size - 1))
        poke(dut.io.lastIn.get, 1)
      if (peek(dut.io.out.valid) == true) {
        fixTolLSBs.withValue(tolLSBs) { expect(dut.io.out.bits, out(cntValidOut)) }
        cntValidOut += 1
      }
      step(1)
    }
    poke(dut.io.lastIn.get, 0)
    poke(dut.io.in.valid, 0)
    poke(dut.io.out.ready, 0)
    step(10)
    poke(dut.io.out.ready, 1)
    
    while (cntValidOut < inp.size) {
      if (cntValidOut == inp.size - 1)
        expect(dut.io.lastOut.get, 1)
      if (peek(dut.io.out.valid) == true && peek(dut.io.out.ready)) {
        fixTolLSBs.withValue(tolLSBs) { expect(dut.io.out.bits, out(cntValidOut)) }
        cntValidOut += 1
      }
      step(1)
    }
    step(5)
    cntValidOut = 0
  }

  def testStreamCollectOut(inp: Seq[Complex], sel: Int, out: Seq[Double], tolLSBs: Int = 3): Seq[Double] = {
    require(dut.params.useLast, "This test must have included lastIn and lastOut signal")
    var collectedOut = Seq[Double]()
    val genIn = dut.params.protoIn
    val genLog = dut.params.protoLog.getOrElse(genIn)

    val dataWidth = genIn.getWidth
    val bposIn = (genIn match {
      case fp: FixedPoint => fp.binaryPoint.get
      case _ => 0
    })

    val bposLog = (genLog match {
      case fp: FixedPoint => fp.binaryPoint.get
      case _ => 0
    })

    val mulLog = if (bposIn > bposLog) math.pow(2, bposIn - bposLog) else 1

//    println("Expected result should be: ")
//    out.map(c => println(dut.toString))

    val input = inp.iterator
    var cntValidOut = 0
    var cntValidIn = 0

    poke(dut.io.in.valid, 1)
    if (dut.params.magType == MagJPLandSqrMag || dut.params.magType == MagJPLandLogMag || dut.params.magType == LogMagMux) {
      poke(dut.io.sel.get, sel)
    }

    // fill pipes and then enable output side
    while (input.hasNext && peek(dut.io.in.ready)) {
      if (cntValidIn == (inp.length - 1)) {
        poke(dut.io.in.bits, input.next())
        poke(dut.io.lastIn.get, 1)
      }
      else {
        poke(dut.io.in.bits, input.next())
      }
      cntValidIn += 1
      step(1)
    }

    poke(dut.io.lastIn.get, 0)
    step(10)
    poke(dut.io.out.ready, 1)

    while (cntValidOut < out.length) {
      if (input.hasNext) {
        if (cntValidIn == (inp.length - 1)) {
          poke(dut.io.in.bits, input.next())
          poke(dut.io.lastIn.get, 1)
        }
        else {
          poke(dut.io.in.bits, input.next())
        }
        cntValidIn += 1
      }
      else {
        poke(dut.io.in.valid, 0)
        poke(dut.io.lastIn.get, 0)
      }
      if (peek(dut.io.out.valid)) {
        if (cntValidOut == (out.length - 1)) {
          fixTolLSBs.withValue(tolLSBs) { expect(dut.io.out.bits, out(cntValidOut)) }
          expect(dut.io.lastOut.get, 1)
        }
        else {
          fixTolLSBs.withValue(tolLSBs) { expect(dut.io.out.bits, out(cntValidOut)) }
          expect(dut.io.lastOut.get, 0)
        }
        collectedOut = collectedOut :+ peek(dut.io.out.bits)
        cntValidOut += 1
      }
      step(1)
    }
    cntValidOut = 0

    poke(dut.io.in.valid, 0)
    poke(dut.io.out.ready, 0)
    reset()
    collectedOut
  }
}

object FixedMagTester {
  def apply(params: MAGParams[FixedPoint], inp: Seq[Complex], out: Seq[Seq[Double]]): Boolean = {
		chisel3.iotesters.Driver.execute(Array("-tbn", "verilator"),
      () => new LogMagMuxGenerator(params)) { c => 
      new LogMagMuxTester(c) {
        testMux(inp, out)
      }}
  }
  // for stream tester
  def apply(params: MAGParams[FixedPoint], inp: Seq[Complex], out: Seq[Double], sel: Int, tol: Int = 3) = {
    chisel3.iotesters.Driver.execute(Array("-tbn", "verilator"),
      () => new LogMagMuxGenerator(params)) { c => 
      new LogMagMuxTester(c) {
        testStream(inp, sel, out, tol)
    }}
  }
}
