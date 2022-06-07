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


abstract class DataPacker [D, U, E, O, B <: Data](beatBytes: Int) extends LazyModule()(Parameters.empty) with DspBlock[D, U, E, O, B] with HasCSR {

    val streamNode = AXI4StreamIdentityNode()

    lazy val module = new LazyModuleImp(this) {
        val (in, _)  = streamNode.in(0)
        val (out, _) = streamNode.out(0)

        // Control registers
        val r_control = RegInit(2.U(2.W))
        val r_last_counter = RegInit(256.U(16.W))

        // Define register fields
        val fields = Seq(RegField( 2, r_control,      RegFieldDesc(name = "r_control", desc = "Register used to set the packer functionality")),
                         RegField(16, r_last_counter, RegFieldDesc(name = "r_last_counter", desc = "Register used to set when to send last flag")))
                         
        // Define abstract register map so it can be AXI4, Tilelink, APB, AHB
        regmap(fields.zipWithIndex.map({ case (f, i) => i * beatBytes -> Seq(f)}): _*)

        // Registers to hold temporary values
        val r_temp    = RegInit(0.U((in.bits.data.getWidth/2).W))
        val r_counter = RegInit(0.U(16.W))
        val r_second  = RegInit(0.U(1.W))

        val w_data = Wire(UInt((in.bits.data.getWidth).W))
        dontTouch(w_data)

        // Send only lower bits
        when(r_control === 0.U) {
            w_data   := Cat(in.bits.data(in.bits.data.getWidth/2-1,0), r_temp)
            when(in.fire()) {
                r_second := r_second + 1.U
                when (r_second === 0.U) {
                    r_temp  := in.bits.data(in.bits.data.getWidth/2-1,0)
                }
            }
            // output valid
            when(r_second === 1.U) { out.valid := in.valid }
            .otherwise { out.valid := 0.U }
        }
        // Send only upper bits
        .elsewhen(r_control === 1.U) {
            w_data   := Cat(in.bits.data(in.bits.data.getWidth-1,in.bits.data.getWidth/2), r_temp)
            when(in.fire()) {
                r_second := r_second + 1.U
                when (r_second === 0.U) {
                    r_temp  := in.bits.data(in.bits.data.getWidth-1,in.bits.data.getWidth/2)
                }
            }
            // output valid
            when(r_second === 1.U) { out.valid := in.valid }
            .otherwise { out.valid := 0.U }
        }
        // Send all
        .elsewhen(r_control === 2.U) {
            w_data    := in.bits.data
            out.valid := in.valid
            in.ready  := out.ready
        }
        // Send counter value
        .otherwise {
            w_data    := Cat(0.U((w_data.getWidth - r_counter.getWidth).W), r_counter)
            out.valid := in.valid
            in.ready  := out.ready
        }

        // output
        out.bits.data := w_data
        in.ready      := out.ready
        out.bits.last := (r_counter === (r_last_counter - 1.U)) && out.fire()

        // data counter
        when(out.fire()) {
            when (r_counter === (r_last_counter - 1.U)) {
                r_counter := 0.U
            }
            .otherwise {
                r_counter := r_counter + 1.U
            }
        }
    }
}

class AXI4StreamDataPacker(address: AddressSet, beatBytes: Int = 4)(implicit p: Parameters) extends DataPacker[AXI4MasterPortParameters, AXI4SlavePortParameters, AXI4EdgeParameters, AXI4EdgeParameters, AXI4Bundle](beatBytes) with AXI4DspBlock with AXI4HasCSR {
  override val mem = Some(AXI4RegisterNode(address = address, beatBytes = beatBytes))
}


trait AXI4StreamDataPackerPins extends AXI4StreamDataPacker {
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
    
    val ioInNode = BundleBridgeSource(() => new AXI4StreamBundle(AXI4StreamBundleParameters(n = numBytes)))
    val ioOutNode = BundleBridgeSink[AXI4StreamBundle]()

    ioOutNode := AXI4StreamToBundleBridge(AXI4StreamSlaveParameters()) := streamNode := BundleBridgeToAXI4Stream(AXI4StreamMasterParameters(n = numBytes)) := ioInNode

    val in = InModuleBody { ioInNode.makeIO() }
    val out = InModuleBody { ioOutNode.makeIO() }
}


object DataPackerApp extends App
{
  implicit val p: Parameters = Parameters.empty
  
  val lazyDut = LazyModule(new AXI4StreamDataPacker(AddressSet(0x00, 0xF), beatBytes = 4) with AXI4StreamDataPackerPins{override def numBytes = 8})
  (new ChiselStage).execute(Array("--target-dir", "verilog/AXI4StreamDataPacker"), Seq(ChiselGeneratorAnnotation(() => lazyDut.module)))
}
