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
import chisel3.util.experimental.loadMemoryFromFile

trait AXI4DataCheckerModuleStandaloneBlock extends AXI4StreamDataCheckerModule {
  def standaloneParams = AXI4BundleParameters(addrBits = 32, dataBits = 32, idBits = 1)
  val ioMem = mem.map { m => {
    val ioMemNode = BundleBridgeSource(() => AXI4Bundle(standaloneParams))

    m :=
      BundleBridgeToAXI4(AXI4MasterPortParameters(Seq(AXI4MasterParameters("bundleBridgeToAXI4")))) :=
      ioMemNode

    val ioMem = InModuleBody { ioMemNode.makeIO() }
    ioMem
  }}

  val numIns = 2

  val ins: Seq[ModuleValue[AXI4StreamBundle]] = for (i <- 0 until numIns) yield {
    implicit val valName = ValName(s"in_$i")
    val in = BundleBridgeSource[AXI4StreamBundle](() => AXI4StreamBundle(AXI4StreamBundleParameters(n = 4)))
    streamNode :=
      BundleBridgeToAXI4Stream(AXI4StreamMasterPortParameters(AXI4StreamMasterParameters())) :=
      in
    InModuleBody { in.makeIO() }
  }
  val numOuts = 1

  val outIOs: Seq[ModuleValue[AXI4StreamBundle]] = for (o <- 0 until numOuts) yield {
    implicit val valName = ValName(s"out_$o")
    val out = BundleBridgeSink[AXI4StreamBundle]()
    out :=
      AXI4StreamToBundleBridge(AXI4StreamSlavePortParameters(AXI4StreamSlaveParameters())) :=
      streamNode
    InModuleBody { out.makeIO() }
  }
}

//Note: while for this version of chisel readmemh is not supported, generated verilog code needs to have that part inserted
//TODO: make memory with VecInit, parametrize master data width
abstract class DataCheckerModule [D, U, E, O, B <: Data](beatBytes: Int, totalData: Int, useSyncMem: Boolean, loadFromFile: Boolean, fileName: String) extends LazyModule()(Parameters.empty) with DspBlock[D, U, E, O, B] with HasCSR {

  val streamNode = AXI4StreamNexusNode(
    masterFn = (ms: Seq[AXI4StreamMasterPortParameters]) =>
      AXI4StreamMasterPortParameters(
      Seq(AXI4StreamMasterParameters(
        n = 4
     )))
    ,
    slaveFn = ss => {
      AXI4StreamSlavePortParameters(ss.map(_.slaves).reduce(_ ++ _))
    }
  )

  lazy val module = new LazyModuleImp(this) {
    //require(streamNode.out.length == 1, "Only one output is allowed")

    val (out, _) = streamNode.out.unzip
    val (ins, _) = streamNode.in.unzip

    println(s"ins.length = ${ins.length}")

    val length = ins.length
    val valid = ins.map{case (in) => in.fire()}.reduce((a, b) => a && b)

    val read_address = RegInit(0.U(log2Up(totalData).W))
    val valid_delayed = RegNext(valid, false.B)
    val ram = SyncReadMem(totalData, UInt(32.W)) // this is custom memory and used to stream radar data

    if (fileName.trim().nonEmpty && loadFromFile) {
      println("Initialized memory")
      loadMemoryFromFile(ram, fileName)
    }

    val total_data_reg = RegInit(totalData.U(log2Up(totalData + 1).W))

    when (valid) {
      read_address := read_address + 1.U
    }
    val read_data = ram(read_address)
    val success = IO(Vec(ins.length, Output(Bool())))
    val valid_success = IO(Output(Bool()))
    valid_success := valid_delayed

    for ((in, inIdx) <- ins.zipWithIndex) {
      val data_delayed = RegNext(in.bits.data, 0.U)
      data_delayed.suggestName("data_delayed")
      dontTouch(data_delayed)
      success(inIdx) := data_delayed === read_data
      in.ready := out(0).ready
    }

    out(0).bits.data := read_data
    out(0).valid := valid_delayed

    // Define register fields
    val fields = Seq(RegField(log2Up(totalData+1), total_data_reg,   RegFieldDesc(name = "total_data", desc = "Set total data that should be used in ram")))

    // Define abstract register map so it can be AXI4, Tilelink, APB, AHB
    regmap(fields.zipWithIndex.map({ case (f, i) => i * beatBytes -> Seq(f)}): _*)
  }
}

class AXI4StreamDataCheckerModule(address: AddressSet, beatBytes: Int = 4, totalData: Int, useSyncMem: Boolean = true, loadFromFile: Boolean = false, fileName: String = "" )(implicit p: Parameters) extends DataCheckerModule[AXI4MasterPortParameters, AXI4SlavePortParameters, AXI4EdgeParameters, AXI4EdgeParameters, AXI4Bundle](beatBytes, totalData, useSyncMem, loadFromFile, fileName) with AXI4DspBlock with AXI4HasCSR {
  override val mem = Some(AXI4RegisterNode(address = address, beatBytes = beatBytes))
}

object AXI4StreamDataCheckerApp extends App
{
  implicit val p: Parameters = Parameters.empty
  val totalData = 64*512
  val fileName = "py_dir/fft2_python_model_64_512_hex.txt"

  val lazyDut = LazyModule(new AXI4StreamDataCheckerModule(AddressSet(0x00, 0xF), beatBytes = 4, totalData, useSyncMem = true, loadFromFile = true, fileName = fileName) with AXI4DataCheckerModuleStandaloneBlock)
  (new ChiselStage).execute(Array("--target-dir", "verilog/AXI4StreamDataChecker"), Seq(ChiselGeneratorAnnotation(() => lazyDut.module)))
}
