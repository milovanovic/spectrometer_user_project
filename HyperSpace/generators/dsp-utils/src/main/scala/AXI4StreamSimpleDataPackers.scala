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

abstract class SimpleDataPackers [D, U, E, O, B <: Data](beatBytes: Int) extends LazyModule()(Parameters.empty) with DspBlock[D, U, E, O, B] with HasCSR {

  val streamNode = AXI4StreamNexusNode(
    masterFn = (ms: Seq[AXI4StreamMasterPortParameters]) => AXI4StreamMasterPortParameters(
    Seq(AXI4StreamMasterParameters(
      n = 8 // output is 64 bit
    ))),
    slaveFn = ss => {AXI4StreamSlavePortParameters(ss.map(_.slaves).reduce(_ ++ _))}
  )

  lazy val module = new LazyModuleImp(this) {
    val (ins, _) = streamNode.in.unzip
    val (outs, _) = streamNode.out.unzip

    val r_last_counter = RegInit(256.U(16.W))
     // Define register fields
    val fields = Seq(RegField(16, r_last_counter, RegFieldDesc(name = "r_last_counter", desc = "Register used to set when to send last flag")))

     // Define abstract register map so it can be AXI4, Tilelink, APB, AHB
    regmap(fields.zipWithIndex.map({ case (f, i) => i * beatBytes -> Seq(f)}): _*)

    for ((in, inIdx) <- ins.zipWithIndex) {
      println(inIdx.toString)
          // Registers to hold temporary values
      val r_temp = RegInit(0.U(in.bits.data.getWidth.W))

      val r_counter = RegInit(0.U(16.W))
      val r_second  = RegInit(0.U(1.W))

      val w_data = Wire(UInt((outs(inIdx).bits.data.getWidth).W)) // output should be 64 bits
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
        outs(inIdx).valid := in.valid
      }
      .otherwise {
        outs(inIdx).valid := 0.U
      }

        // output
      outs(inIdx).bits.data := w_data
      in.ready      := outs(inIdx).ready
      outs(inIdx).bits.last := (r_counter === (r_last_counter - 1.U)) && outs(inIdx).fire()

        // data counter
      when (outs(inIdx).fire()) {
        when (r_counter === (r_last_counter - 1.U)) {
          r_counter := 0.U
        }
        .otherwise {
          r_counter := r_counter + 1.U
        }
      }
    }
  }
}

class AXI4StreamSimpleDataPackers(address: AddressSet, beatBytes: Int = 4)(implicit p: Parameters) extends SimpleDataPackers[AXI4MasterPortParameters, AXI4SlavePortParameters, AXI4EdgeParameters, AXI4EdgeParameters, AXI4Bundle](beatBytes) with AXI4DspBlock with AXI4HasCSR {
  override val mem = Some(AXI4RegisterNode(address = address, beatBytes = beatBytes))
}


trait AXI4StreamSimpleDataPackersPins extends AXI4StreamSimpleDataPackers {
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

    def nIn:  Int = 16
    def nOut: Int = 16
    def beatBytes: Int = 4

    val inIO: Seq[ModuleValue[AXI4StreamBundle]] = for (i <- 0 until nIn) yield {
      implicit val valName = ValName(s"in_$i")
      val in = BundleBridgeSource[AXI4StreamBundle](() => AXI4StreamBundle(AXI4StreamBundleParameters(n = beatBytes)))
        streamNode := BundleBridgeToAXI4Stream(AXI4StreamMasterPortParameters(AXI4StreamMasterParameters(n = beatBytes))) := in
      InModuleBody { in.makeIO() }
    }
    val outIO: Seq[ModuleValue[AXI4StreamBundle]] = for (o <- 0 until nOut) yield {
      implicit val valName = ValName(s"out_$o")
      val out = BundleBridgeSink[AXI4StreamBundle]()
      out := AXI4StreamToBundleBridge(AXI4StreamSlavePortParameters(AXI4StreamSlaveParameters())) := streamNode

      InModuleBody { out.makeIO() }
    }
}


object SimpleDataPackersApp extends App
{
  implicit val p: Parameters = Parameters.empty

  val lazyDut = LazyModule(new AXI4StreamSimpleDataPackers(AddressSet(0x00, 0xF), beatBytes = 4) with AXI4StreamSimpleDataPackersPins{override def numBytes = 8})
  (new ChiselStage).execute(Array("--target-dir", "verilog/AXI4StreamSimpleDataPackers"), Seq(ChiselGeneratorAnnotation(() => lazyDut.module)))
}
