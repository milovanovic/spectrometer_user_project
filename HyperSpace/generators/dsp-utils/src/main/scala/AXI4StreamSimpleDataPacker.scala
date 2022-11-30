// SPDX-License-Identifier: Apache-2.0

package dsputils

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.util._
import dspblocks._
import freechips.rocketchip.amba.axi4._
import freechips.rocketchip.amba.axi4stream._
import freechips.rocketchip.config._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.regmapper._

abstract class SimpleDataPacker [D, U, E, O, B <: Data](beatBytes: Int) extends LazyModule()(Parameters.empty) with DspBlock[D, U, E, O, B] with HasCSR {

  val masterParams = AXI4StreamMasterParameters(
    name = "AXI4 Stream data packer",
    n = 8, // just 8*8 -> 64 bits
    numMasters = 1
  )
  val slaveParams = AXI4StreamSlaveParameters()

  val slaveNode  = AXI4StreamSlaveNode(slaveParams)
  val masterNode = AXI4StreamMasterNode(masterParams)

  val streamNode = NodeHandle(slaveNode, masterNode)

  lazy val module = new LazyModuleImp(this) {
    val (out, edgeOut) = masterNode.out.head
    val (in, edgeIn) = slaveNode.in.head

     // Control registers
    val r_last_counter = RegInit(256.U(16.W))
     // Define register fields
    val fields = Seq(RegField(16, r_last_counter, RegFieldDesc(name = "r_last_counter", desc = "Register used to set when to send last flag")))

     // Define abstract register map so it can be AXI4, Tilelink, APB, AHB
    regmap(fields.zipWithIndex.map({ case (f, i) => i * beatBytes -> Seq(f)}): _*)

     // Registers to hold temporary values
    val r_temp = RegInit(0.U(in.bits.data.getWidth.W))

    val r_counter = RegInit(0.U(16.W))
    val r_second  = RegInit(0.U(1.W))

    val w_data = Wire(UInt((out.bits.data.getWidth).W)) // output should be 64 bits
    dontTouch(w_data)
    w_data := Cat(in.bits.data(in.bits.data), r_temp)

    when (in.fire()) {
      r_second := r_second + 1.U
      when (r_second === 0.U) {
        r_temp := in.bits.data
      }
    }

    // output valid
    when (r_second === 1.U) {
      out.valid := in.valid
    }
    .otherwise {
      out.valid := 0.U
    }

     // output
    out.bits.data := w_data
    in.ready      := out.ready
    out.bits.last := (r_counter === (r_last_counter - 1.U)) && out.fire()

     // data counter
    when (out.fire()) {
      when (r_counter === (r_last_counter - 1.U)) {
        r_counter := 0.U
      }
     .otherwise {
        r_counter := r_counter + 1.U
      }
    }
  }
}

class AXI4StreamSimpleDataPacker(address: AddressSet, beatBytes: Int = 4)(implicit p: Parameters) extends SimpleDataPacker[AXI4MasterPortParameters, AXI4SlavePortParameters, AXI4EdgeParameters, AXI4EdgeParameters, AXI4Bundle](beatBytes) with AXI4DspBlock with AXI4HasCSR {
  override val mem = Some(AXI4RegisterNode(address = address, beatBytes = beatBytes))
}


trait AXI4StreamSimpleDataPackerPins extends AXI4StreamSimpleDataPacker {
    def numBytes : Int = 4
    def standaloneParams = AXI4BundleParameters(addrBits = 32, dataBits = 32, idBits = 1)
    val ioMem = mem.map { m => {
      val ioMemNode = BundleBridgeSource(() => AXI4Bundle(standaloneParams))

      m :=
      BundleBridgeToAXI4(AXI4MasterPortParameters(Seq(AXI4MasterParameters("bundleBridgeToAXI4")))) :=
      ioMemNode

      val ioMem = InModuleBody { ioMemNode.makeIO() }
      ioMem
    }}

    val inNode = BundleBridgeSource[AXI4StreamBundle](() => AXI4StreamBundle(AXI4StreamBundleParameters(n = 2)))
    streamNode:=
      BundleBridgeToAXI4Stream(AXI4StreamMasterPortParameters(AXI4StreamMasterParameters())) :=
      inNode

    val in = InModuleBody { inNode.makeIO() }

    val outNode = BundleBridgeSink[AXI4StreamBundle]()
    outNode := AXI4StreamToBundleBridge(AXI4StreamSlavePortParameters(AXI4StreamSlaveParameters())) := streamNode

    val out = InModuleBody { outNode.makeIO() }
}


object SimpleDataPackerApp extends App
{
  implicit val p: Parameters = Parameters.empty

  val lazyDut = LazyModule(new AXI4StreamSimpleDataPacker(AddressSet(0x00, 0xF), beatBytes = 4) with AXI4StreamSimpleDataPackerPins{override def numBytes = 8})
  (new ChiselStage).execute(Array("--target-dir", "verilog/AXI4StreamSimpleDataPacker"), Seq(ChiselGeneratorAnnotation(() => lazyDut.module)))
}
