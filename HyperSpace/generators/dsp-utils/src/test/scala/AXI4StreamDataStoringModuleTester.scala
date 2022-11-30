// SPDX-License-Identifier: Apache-2.0

package dsputils

import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.amba.axi4._
import freechips.rocketchip.diplomacy._
import scala.util.Random
import chisel3.iotesters.PeekPokeTester


import freechips.rocketchip.config.Parameters
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class AXI4StreamDataStoringModuleTester(
  dut: AXI4StreamDataStoringModule with AXI4StreamDataStoringPins,
  beatBytes   : Int,
  gap         : Int,
  numSamples  : Int, // this should represent numSamples per chirp
  numBursts   : Int,
  address     : AddressSet,
  silentFail  : Boolean = false
) extends PeekPokeTester(dut.module) with AXI4StreamModel with AXI4MasterModel {

  override def memAXI: AXI4Bundle = dut.ioMem.get.getWrappedValue
  val mod = dut.module

  Random.setSeed(11110L)
  // Input data
  var dataIn = Seq[BigInt]()
  val testSize = numSamples * numBursts
  // Generate input data
  for (i <- 0 until testSize) {
    dataIn = dataIn :+ BigInt((Random.nextInt()))
  }
  var outSeq = Seq[BigInt]()
  var peekedVal: BigInt = 0

  poke(dut.out.ready, 1)

  for (i <- 0 until numBursts) {
    for (j <- 0 until numSamples) {
      if (peek(dut.in.ready) == 1) {
        poke(dut.in.valid, 1)
        poke(dut.in.bits.data, dataIn(i*(numSamples) + j))
        step(1)
      }
    }
    poke(dut.in.valid, 0)
    if (i < numBursts-1) {
      step(gap)
    }
  }

 //poke(dut.out.ready, 0)
  poke(dut.out.ready, 1)
 // step(1)

  while (outSeq.length < testSize-1) {
  //step(1)
  //poke(dut.out.ready, 1)
    if (peek(dut.out.valid) == 1 && peek(dut.out.ready) == 1) {
      peekedVal = peek(dut.out.bits.data)
     // println("Peeked value is:")
     // println(peekedVal.toInt.toString)
      outSeq = outSeq :+ peekedVal//.toInt
     // println(dataIn(outSeq.length-1).toString)
    }
    step(1)
  // step(1)
  // println(outSeq.length.toString)
  // poke(dut.out.ready, 0)
  }

//  stepToCompletion(maxCycles = 20*testSize, silentFail = silentFail)
}



class AXI4StreamDataStoringModuleSpec extends AnyFlatSpec with Matchers {
  implicit val p: Parameters = Parameters.empty

  val numSamples = 4
  val numBursts = 2
  val gap = numSamples/2
  val beatBytes = 4

  val testSize = numSamples*numBursts

  it should "test AXI4StreamDataStoringModule" in {
    val lazyDut = LazyModule(new AXI4StreamDataStoringModule(AddressSet(0x00, 0xF), beatBytes = 4, totalData = testSize) with AXI4StreamDataStoringPins {})

    dsptools.Driver.execute(() => lazyDut.module, Array("--backend-name", "verilator", "--target-dir", "test_run_dir/AXI4StreamDataStoringModule", "--top-name", "AXI4StreamDataStoringModule")) {
      c => new AXI4StreamDataStoringModuleTester(lazyDut, beatBytes, gap, numSamples, numBursts, AddressSet(0x00, 0xF), true)
    } should be (true)
  }
}
