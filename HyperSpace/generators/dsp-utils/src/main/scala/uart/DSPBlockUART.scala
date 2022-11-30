// SPDX-License-Identifier: Apache-2.0

package dsputils.uart
import Chisel._

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.interrupts._
import freechips.rocketchip.prci._
import freechips.rocketchip.regmapper._
import freechips.rocketchip.subsystem.{BaseSubsystem, PeripheryBusKey}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.util._
import freechips.rocketchip.diplomaticobjectmodel.DiplomaticObjectModelAddressing
import freechips.rocketchip.diplomaticobjectmodel.model.{OMComponent, OMRegister}
import freechips.rocketchip.diplomaticobjectmodel.logicaltree.{LogicalModuleTree, LogicalTreeNode}

// import chisel3._
// import chisel3.util._
import dsptools._
// import dsptools.numbers._

import dspblocks._
import freechips.rocketchip.amba.axi4._
import freechips.rocketchip.amba.axi4stream._

trait DeviceParams

case class UARTParams(
  address: BigInt,
  dataBits: Int = 8,
  stopBits: Int = 2,
  divisorBits: Int = 16,
  oversample: Int = 4,
  nSamples: Int = 3,
  nTxEntries: Int = 8,
  nRxEntries: Int = 8,
  includeFourWire: Boolean = false,
  includeParity: Boolean = false,
  includeIndependentParity: Boolean = false) extends DeviceParams // Tx and Rx have opposite parity modes
{
  def oversampleFactor = 1 << oversample
  require(divisorBits > oversample)
  require(oversampleFactor > nSamples)
  require((dataBits == 8) || (dataBits == 9))
}

class UARTPortIO(val c: UARTParams) extends Bundle {
  val txd = Bool(OUTPUT)
  val rxd = Bool(INPUT)
  val cts_n = c.includeFourWire.option(Bool(INPUT))
  val rts_n = c.includeFourWire.option(Bool(OUTPUT))
}

class UARTInterrupts extends Bundle {
  val rxwm = Bool()
  val txwm = Bool()
}

abstract class UARTBlock[ D, U, E, O, B <: Data] (params: UARTParams, divisorInit: Int, beatBytes: Int) extends LazyModule()(Parameters.empty) with DspBlock[D, U, E, O, B] with HasCSR with HasClockDomainCrossing{
  val devname = "UARTBlock"
  val devcompat = Seq("nordic", "dsptools")
  val device = new SimpleDevice(devname, devcompat) {
    override def describe(resources: ResourceBindings): Description = {
      val Description(name, mapping) = super.describe(resources)
      Description(name, mapping)
    }
  }

  // Definitions from freechips.rocketchip.interrupts.HasInterruptSources
  /** Mix this trait into a RegisterRouter to be able to attach its interrupt sources to an interrupt bus */
  def nInterrupts = 1 + params.includeParity.toInt

  protected val intnode = IntSourceNode(IntSourcePortSimple(num = nInterrupts, resources = Seq(Resource(device, "int"))))

  // Externally, this helper should be used to connect the interrupts to a bus
  val intXing: IntOutwardCrossingHelper = this.crossOut(intnode)

  // Internally, this wire should be used to drive interrupt values
  val interrupts: ModuleValue[Vec[Bool]] = InModuleBody { if (intnode.out.isEmpty) Vec(0, Bool()) else intnode.out(0)._1 }
  //----------------------------------------------------------------------------------------------------------------------

  require(divisorInit != 0, "UART divisor wasn't initialized during instantiation")
  require(divisorInit >> params.divisorBits == 0, s"UART divisor reg (width $params.divisorBits) not wide enough to hold $divisorInit")

  val outNode = AXI4StreamMasterNode(Seq(AXI4StreamMasterPortParameters(Seq(AXI4StreamMasterParameters(
                                                                                "uartOut",
                                                                                n = 1)))))
  val inNode = AXI4StreamSlaveNode(AXI4StreamSlaveParameters())

  // diplomatic node for the streaming interface
  val streamNode = NodeHandle(inNode, outNode)
  // val streamNode = AXI4StreamIdentityNode()

  lazy val module = new LazyModuleImp(this) {
    val (in, _)  = inNode.in(0)
    val (out, _) = outNode.out(0)

    // IO port
    val io = IO(new UARTPortIO(params))

    val txm = Module(new UARTTx(params))
    val txq = Module(new Queue(txm.io.in.bits, params.nTxEntries))

    val rxm = Module(new UARTRx(params))
    val rxq = Module(new Queue(rxm.io.out.bits, params.nRxEntries))

    val div = Reg(init = UInt(divisorInit, params.divisorBits))

    private val stopCountBits = log2Up(params.stopBits)
    private val txCountBits = log2Floor(params.nTxEntries) + 1
    private val rxCountBits = log2Floor(params.nRxEntries) + 1

    val txen = Reg(init = Bool(false))
    val rxen = Reg(init = Bool(false))
    val enwire4 = Reg(init = Bool(false))
    val invpol = Reg(init = Bool(false))
    val enparity = Reg(init = Bool(false))
    val parity = Reg(init = Bool(false)) // Odd parity - 1 , Even parity - 0
    val errorparity = Reg(init = Bool(false))
    val errie = Reg(init = Bool(false))
    val txwm = Reg(init = UInt(0, txCountBits))
    val rxwm = Reg(init = UInt(0, rxCountBits))
    val nstop = Reg(init = UInt(0, stopCountBits))
    val data8or9 = Reg(init = Bool(true))

    if (params.includeFourWire){
        txm.io.en := txen && (!io.cts_n.get || !enwire4)
        txm.io.cts_n.get := io.cts_n.get
    }
    else
        txm.io.en := txen
    txm.io.in <> txq.io.deq
    txm.io.div := div
    txm.io.nstop := nstop
    io.txd := txm.io.out

    // NovelIC added
    txq.io.enq.bits  := in.bits.data
    txq.io.enq.valid := in.valid
    in.ready         := txq.io.enq.ready

    out.bits.data    := rxq.io.deq.bits
    out.valid        := rxq.io.deq.valid
    rxq.io.deq.ready := out.ready

    if (params.dataBits == 9) {
        txm.io.data8or9.get := data8or9
        rxm.io.data8or9.get := data8or9
    }

    rxm.io.en := rxen
    rxm.io.in := io.rxd
    rxq.io.enq <> rxm.io.out
    rxm.io.div := div
    val tx_busy = (txm.io.tx_busy || txq.io.count.orR) && txen
    io.rts_n.foreach { r => r := Mux(enwire4, !(rxq.io.count < params.nRxEntries.U), tx_busy ^ invpol) }
    if (params.includeParity) {
        txm.io.enparity.get := enparity
        txm.io.parity.get := parity
        rxm.io.parity.get := parity ^ params.includeIndependentParity.B // independent parity on tx and rx
        rxm.io.enparity.get := enparity
        errorparity := rxm.io.errorparity.get || errorparity
        interrupts(1) := errorparity && errie
    }

    val ie = Reg(init = new UARTInterrupts().fromBits(Bits(0)))
    val ip = Wire(new UARTInterrupts)

    ip.txwm := (txq.io.count < txwm)
    ip.rxwm := (rxq.io.count > rxwm)
    interrupts(0) := (ip.txwm && ie.txwm) || (ip.rxwm && ie.rxwm)

    val mapping = Seq(
        UARTCtrlRegs.txfifo -> RegFieldGroup("txdata",Some("Used to transmit data"),
                            Seq(RegField(32, RegInit(0.U(32.W)), RegFieldDesc(name = "emptyTx", desc = "Empty")))),
        UARTCtrlRegs.rxfifo -> RegFieldGroup("rxdata",Some("Used to receive data"),
                            Seq(RegField(32, RegInit(0.U(32.W)), RegFieldDesc(name = "emptyRx", desc = "Empty")))),
        // UARTCtrlRegs.txfifo -> RegFieldGroup("txdata",Some("Transmit data"),
        //                     NonBlockingEnqueue(txq.io.enq)),
        // UARTCtrlRegs.rxfifo -> RegFieldGroup("rxdata",Some("Receive data"),
        //                     NonBlockingDequeue(rxq.io.deq)),
        UARTCtrlRegs.txctrl -> RegFieldGroup("txctrl",Some("Serial transmit control"),Seq(
        RegField(1, txen,
                RegFieldDesc("txen","Transmit enable", reset=Some(0))),
        RegField(stopCountBits, nstop,
                RegFieldDesc("nstop","Number of stop bits", reset=Some(0))))),
        UARTCtrlRegs.rxctrl -> Seq(RegField(1, rxen,
                RegFieldDesc("rxen","Receive enable", reset=Some(0)))),
        UARTCtrlRegs.txmark -> Seq(RegField(txCountBits, txwm,
                RegFieldDesc("txcnt","Transmit watermark level", reset=Some(0)))),
        UARTCtrlRegs.rxmark -> Seq(RegField(rxCountBits, rxwm,
                RegFieldDesc("rxcnt","Receive watermark level", reset=Some(0)))),

        UARTCtrlRegs.ie -> RegFieldGroup("ie",Some("Serial interrupt enable"),Seq(
        RegField(1, ie.txwm,
                RegFieldDesc("txwm_ie","Transmit watermark interrupt enable", reset=Some(0))),
        RegField(1, ie.rxwm,
                RegFieldDesc("rxwm_ie","Receive watermark interrupt enable", reset=Some(0))))),

        UARTCtrlRegs.ip -> RegFieldGroup("ip",Some("Serial interrupt pending"),Seq(
        RegField.r(1, ip.txwm,
                    RegFieldDesc("txwm_ip","Transmit watermark interrupt pending", volatile=true)),
        RegField.r(1, ip.rxwm,
                    RegFieldDesc("rxwm_ip","Receive watermark interrupt pending", volatile=true)))),

        UARTCtrlRegs.div -> Seq(
        RegField(params.divisorBits, div,
                    RegFieldDesc("div","Baud rate divisor",reset=Some(divisorInit))))
    )

    val optionalparity = if (params.includeParity) Seq(
        UARTCtrlRegs.parity -> RegFieldGroup("paritygenandcheck",Some("Odd/Even Parity Generation/Checking"),Seq(
        RegField(1, enparity,
                RegFieldDesc("enparity","Enable Parity Generation/Checking", reset=Some(0))),
        RegField(1, parity,
                RegFieldDesc("parity","Odd(1)/Even(0) Parity", reset=Some(0))),
        RegField(1, errorparity,
                RegFieldDesc("errorparity","Parity Status Sticky Bit", reset=Some(0))),
        RegField(1, errie,
                RegFieldDesc("errie","Interrupt on error in parity enable", reset=Some(0)))))) else Nil

    val optionalwire4 = if (params.includeFourWire) Seq(
        UARTCtrlRegs.wire4 -> RegFieldGroup("wire4",Some("Configure Clear-to-send / Request-to-send ports / RS-485"),Seq(
        RegField(1, enwire4,
                RegFieldDesc("enwire4","Enable CTS/RTS(1) or RS-485(0)", reset=Some(0))),
        RegField(1, invpol,
                RegFieldDesc("invpol","Invert polarity of RTS in RS-485 mode", reset=Some(0)))
        ))) else Nil

    val optional8or9 = if (params.dataBits == 9) Seq(
        UARTCtrlRegs.either8or9 -> RegFieldGroup("ConfigurableDataBits",Some("Configure number of data bits to be transmitted"),Seq(
        RegField(1, data8or9,
                RegFieldDesc("databits8or9","Data Bits to be 8(1) or 9(0)", reset=Some(1)))))) else Nil
    regmap(mapping ++ optionalparity ++ optionalwire4 ++ optional8or9:_*)
    val omRegMap = OMRegister.convert(mapping ++ optionalparity ++ optionalwire4 ++ optional8or9:_*)
    }

  val logicalTreeNode = new LogicalTreeNode(() => Some(device)) {
    def getOMComponents(resourceBindings: ResourceBindings, children: Seq[OMComponent] = Nil): Seq[OMComponent] = {
      Seq(
        OMUART(
          divisorWidthBits = params.divisorBits,
          divisorInit = divisorInit,
          nRxEntries = params.nRxEntries,
          nTxEntries = params.nTxEntries,
          dataBits = params.dataBits,
          stopBits = params.stopBits,
          oversample = params.oversample,
          nSamples = params.nSamples,
          includeFourWire = params.includeFourWire,
          includeParity = params.includeParity,
          includeIndependentParity = params.includeIndependentParity,
          memoryRegions = DiplomaticObjectModelAddressing.getOMMemoryRegions("UART", resourceBindings, Some(module.omRegMap)),
          interrupts = DiplomaticObjectModelAddressing.describeGlobalInterrupts(device.describe(resourceBindings).name, resourceBindings),
        )
      )
    }
  }
}


class AXI4UARTBlock(params: UARTParams, address: AddressSet, divisorInit: Int, _beatBytes: Int = 4)(implicit p: Parameters) extends UARTBlock[AXI4MasterPortParameters, AXI4SlavePortParameters, AXI4EdgeParameters, AXI4EdgeParameters, AXI4Bundle](params, divisorInit, _beatBytes) with AXI4DspBlock with AXI4HasCSR {
  val mem = Some(AXI4RegisterNode(address = address, beatBytes = _beatBytes)) // use AXI4 memory mapped
}

object AXI4UARTDspBlock extends App
{

  // here just define parameters
  val paramsUART = UARTParams(address = 0x54000000L, nTxEntries = 256, nRxEntries = 256)
  val divinit = (100000000 / 115200).toInt
  implicit val p: Parameters = Parameters.empty
  val uartModule = LazyModule(new AXI4UARTBlock(paramsUART, AddressSet(0x000000, 0xFFFF), divisorInit = divinit, _beatBytes = 4) with AXI4StandaloneBlock {
    override def standaloneParams = AXI4BundleParameters(addrBits = 32, dataBits = 32, idBits = 1)

    // Add interrupt bundle
    val ioIntNode = BundleBridgeSink[Vec[Bool]]()
    ioIntNode :=
        IntToBundleBridge(IntSinkPortParameters(Seq(IntSinkParameters()))) :=
        intnode
    val ioInt = InModuleBody {
        import chisel3.experimental.IO
        val io = IO(Output(ioIntNode.bundle.cloneType))
        io.suggestName("int")
        io := ioIntNode.bundle
        io
    }
  })
  chisel3.Driver.execute(args, ()=> uartModule.module) // generate verilog code
}
