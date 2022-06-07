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


abstract class DataStoringModule [D, U, E, O, B <: Data](beatBytes: Int, totalData: Int) extends LazyModule()(Parameters.empty) with DspBlock[D, U, E, O, B] with HasCSR {

    val streamNode = AXI4StreamIdentityNode()
    lazy val module = new LazyModuleImp(this) {
      val (in, _)  = streamNode.in(0)
      val (out, _) = streamNode.out(0)

      // Control registers
      val expectedData = RegInit(totalData.U(log2Up(totalData + 1).W))
      val cntIn = RegInit(0.U(log2Up(totalData).W))
      val cntOut = RegInit(0.U(log2Up(totalData).W))
      val ram    = SyncReadMem(totalData, UInt(32.W)) // this is custom memory and used to stream radar data

      val sIdle :: sStore :: sLoad :: Nil = Enum(3)
      val state = RegInit(sIdle)
      val state_next = Wire(state.cloneType)
      state_next := state

      switch(state) {
        is (sIdle) {
          when (in.fire()) {
            state_next := sStore
          }
        }
        is (sStore) {
          when (cntIn === (expectedData - 1.U)) { // this means that all data are written
            state_next := sLoad
          }
        }
        is (sLoad) {
          when (cntOut === (expectedData - 1.U) && out.fire()) {
            when (in.fire()) {
              state_next := sStore
            }
            .otherwise {
              state_next := sIdle
            }
          }
        }
      }

      state := state_next

      when (in.fire() && state =/= sLoad) {
        ram(cntIn) := in.bits.data.asUInt
        cntIn := cntIn + 1.U
      }

      when (out.ready && state === sLoad) {
   //   when (out.fire()) {
        cntOut := cntOut + 1.U
      }
      val readAddress = Wire(cntOut.cloneType)
      readAddress := cntOut
      val readData = ram(readAddress)

     /* out.bits.data := readData
      out.valid := RegNext(state === sLoad, false.B)*/
      in.ready := state =/= sLoad

      val outQueue = Module(new Queue(chiselTypeOf(readData), entries = 1, pipe = false, flow = true)) // prev flow on true and pipe on true
      outQueue.io.enq.bits := readData
      outQueue.io.enq.valid := RegNext(state === sLoad && out.ready, false.B) // RegNext(state === sLoad && out.ready, false.B)
      outQueue.io.deq.ready := out.ready

      out.bits.data  := outQueue.io.deq.bits
      out.valid := outQueue.io.deq.valid

      // Define register fields
      val fields = Seq(RegField(log2Up(totalData+1), expectedData,   RegFieldDesc(name = "total_data", desc = "Set total data that should be used in ram")))

      // Define abstract register map so it can be AXI4, Tilelink, APB, AHB
      regmap(fields.zipWithIndex.map({ case (f, i) => i * beatBytes -> Seq(f)}): _*)
    }
}

class AXI4StreamDataStoringModule(address: AddressSet, beatBytes: Int = 4, totalData: Int)(implicit p: Parameters) extends DataStoringModule[AXI4MasterPortParameters, AXI4SlavePortParameters, AXI4EdgeParameters, AXI4EdgeParameters, AXI4Bundle](beatBytes, totalData) with AXI4DspBlock with AXI4HasCSR {
  override val mem = Some(AXI4RegisterNode(address = address, beatBytes = beatBytes))
}


trait AXI4StreamDataStoringPins extends AXI4StreamDataStoringModule {
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

object AXI4StreamDataStoringApp extends App
{
  implicit val p: Parameters = Parameters.empty
  val totalData = 512*64
  val lazyDut = LazyModule(new AXI4StreamDataStoringModule(AddressSet(0x00, 0xF), beatBytes = 4, totalData) with AXI4StreamDataStoringPins{override def numBytes = 4})
  (new ChiselStage).execute(Array("--target-dir", "verilog/AXI4StreamDataStoring"), Seq(ChiselGeneratorAnnotation(() => lazyDut.module)))
}
