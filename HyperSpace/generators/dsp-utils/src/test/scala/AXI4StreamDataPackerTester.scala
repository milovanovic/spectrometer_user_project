// SPDX-License-Identifier: Apache-2.0

package dsputils

import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.amba.axi4._
import freechips.rocketchip.diplomacy._
import scala.util.Random
import chisel3.iotesters.PeekPokeTester

//---------------------------------------------------------------------------------------------------------------------------------------------------------------
// Non-Coherent adder
//---------------------------------------------------------------------------------------------------------------------------------------------------------------
class DataPackerTester(
  dut: AXI4StreamDataPacker with AXI4StreamDataPackerPins,
  testSize  : Int,
  beatBytes : Int,
  address   : AddressSet,
  silentFail: Boolean = false
) extends PeekPokeTester(dut.module) with AXI4StreamModel with AXI4MasterModel {
  
  def seqToString(c: Seq[Double]): String = "[" + c.mkString(", ") + "]"

  val dataSize = testSize // Data size
  val regCounter = dataSize/2 

  override def memAXI: AXI4Bundle = dut.ioMem.get.getWrappedValue
  val mod = dut.module

  val lo_mask = BigInt((1L << 4*beatBytes)-1L)
  val hi_mask = lo_mask << 4*beatBytes

  for (iter <- 0 until 4) {
    // r_control
    memWriteWord(address.base, iter)
    // r_counter_last
    memWriteWord(address.base + 0x04, regCounter)

    // Input data
    var data_lower = Seq[Int]()
    var data_upper = Seq[Int]()
    var data_combined = Seq[BigInt]()
    // Generate input data
    for (i <- 0 until dataSize) {
      data_lower = data_lower :+ (Random.nextInt())
      data_upper = data_upper :+ (Random.nextInt())
      data_combined = data_combined :+ ((BigInt(data_upper(i)) << 4*beatBytes) & hi_mask) + (BigInt(data_lower(i)) & lo_mask)
    }
    // Expected data
    var expectedData = Seq[BigInt]()
    iter match {
      // lower data
      case 0 => {
        for (i <- 0 until data_combined.length/2) {
          expectedData = expectedData :+ ((BigInt(data_lower(2*i+1)) << 4*beatBytes) & hi_mask) + (BigInt(data_lower(2*i)) & lo_mask)
        }
      }
      // upper data
      case 1 => {
        for (i <- 0 until data_combined.length/2) {
          expectedData = expectedData :+ ((BigInt(data_upper(2*i+1)) << 4*beatBytes) & hi_mask) + (BigInt(data_upper(2*i)) & lo_mask)
        }
      }
      // upper and lower
      case 2 => {
        for (i <- 0 until data_combined.length) {
          expectedData = expectedData :+ data_combined(i)
        }
      }
      // counter
      case _ => {
        for (i <- 0 until data_combined.length) {
          expectedData = expectedData :+ BigInt(i % regCounter)
        }
      }
    }

    // Check data
    step(1)
    poke(dut.out.ready, 0)
    poke(dut.in.valid, 0)
    var inValid = 0
    var counter = 0
    while(!expectedData.isEmpty) {
      poke(dut.out.ready, Random.nextInt(2))
      inValid = Random.nextInt(2)
      if (!data_combined.isEmpty) {
        poke(dut.in.valid, inValid)
        poke(dut.in.bits.data, data_combined.head)
        if (peek(dut.in.ready) == 1 && peek(dut.in.valid) == 1) {
          data_combined = data_combined.tail
        }
      }
      else {
        poke(dut.in.valid, 0)
      }
      
      if (peek(dut.out.ready) == 1 && peek(dut.out.valid) == 1) {
        counter = counter + 1 
        expect(dut.out.bits.last, counter % regCounter == 0)
        expect(dut.out.bits.data, expectedData.head)
        println(s"Read data    : ${peek(dut.out.bits.data).toString(16).toUpperCase}")
        println(s"Expected data: ${expectedData.head.toString(16).toUpperCase}")
        println(s"Read last    : ${peek(dut.out.bits.last)}")
        println(s"Expected last: ${if (counter % regCounter == 0) 1 else 0}")
        expectedData = expectedData.tail
      }
      step(1)
    }
    poke(dut.out.ready, 0)
    step(100)
  }
  stepToCompletion(maxCycles = 20*dataSize, silentFail = silentFail)
}