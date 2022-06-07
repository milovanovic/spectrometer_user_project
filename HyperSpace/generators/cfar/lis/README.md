A Linear Insertion Sorter (LIS) Chisel Generator
================================================

[![Build Status](https://travis-ci.org/milovanovic/lis.svg?branch=master)](https://travis-ci.org/milovanovic/lis)

## Overview

This repository contains a generator of parameterizable and runtime reconfigurable fully streaming linear insertion sorters writen in [Chisel ](http://www.chisel-lang.org) hardware design language. Fully streaming linear sorters with their rather simple and low-cost hardware architecture are widely used as the fundamental building blocks in many digital signal processing applications that require sorting operations and continuous data streaming interface.

[comment]: <> (To make a Chisel project and include LIS generator, an open source starter template Chipyard Framework can be used.)

### Linear streaming sorters

Linear insertion sorters use the same principle as the well- known insertion sort algorithm. The incoming data are inserted at the appropriate location inside the sorting array thus keeping the array sorted at every moment.

The linear insertion sorter is composed of basic processing elements (PEs) connected in a cascade. The sorter generator scheme featuring streaming I/O data and accompanied with the detailed block diagram of one processing element (PE) is sketched below. Each PE comprises a comparator, multiplexers, store data registers, as well as the control logic. Also, the incoming data, left and right neighboring element data values, comparator results and additional control signals are available inside every PE. The control logic block uses this information to generate signals for left/right shifting, loading new data or resetting the register values. The illustrated generator supports three linear insertion streaming sorters differing only in decision which cell should be discarded in the insertion process and sent to the output.
![Linear sorters generator scheme](./doc/images/PEChainblock.svg)

Previously explained generator is described with following Scala files available inside`src/main/scala` directory:

* `LIS_util.scala` - contains useful objects such as `CounterWithReset` and `LifeCounter`
* `ControlLogic.scala`- contains description of Control Logic block 
* `PE.scala` - contains description of the basic processing element (PE)
* `LinearSorter.scala` - contains parameter description and top level modul `LinearSorter`

#### Inputs

[Decoupled](http://github.com/freechipsproject/chisel3/wiki/Interfaces-Bulk-Connections) interface is used where .bits are data that should be sorted.

* `in: Flipped(Decoupled(params.proto))` - input data  wrapped with valid/ready signals
* `lastIn: Input(Bool())` - indicates the last sample in the input stream and triggers data flushing
* Control registers: `sorterSize`, `flushData`, `sortDirection`, `discardPos`

#### Outputs

[Decoupled](http://github.com/freechipsproject/chisel3/wiki/Interfaces-Bulk-Connections) interface is used where .bits are data that should be sent to the streaming output.
* `out: Decoupled(params.proto)` - output streaming data wrapped with valid/ready signals
* `lastOut: Output(Bool())` - indicates the last sample in the output stream
* `sortedData: Output(Vec(params.LISsize, params.proto))` - sorted data
* Status registers: `sorterEmpty`, `sorterFull`

## Parameter settings

Design parameters are defined inside `case class LISParams`. Users can customize design per use case by setting the appropriate parameters.

    case class LISParams[T <: Data: Real](
      proto: T,
      LISsize: Int = 16,
      LIStype: String = "LIS_FIFO",
      rtcSize: Boolean = false,
      rtcSortDir: Boolean = false,
      discardPos: Option[Int] = None,
      useSorterFull: Boolean = false,
      useSorterEmpty: Boolean = false,
      flushData: Boolean = false,
      sortDir: Boolean = true,
    ) { . . . 
    }

The explanation of each parameter is given below:
* `proto:` represents type of the sorted data. Users can choose among following Chisel types: `UInt`, `SInt`, `FixedPoint`, `DspReal`. Type `DspReal`is used to make golden model of the digital design.
* `LISsize:` is sorter size and it is not limited to be a power of 2
* `LIStype:` used to define linear insertion sorter type
  * Fixed discarding element position scheme - `"fixed"`
  * Fifo based scheme -  `"FIFO"`
  * Input selected discarding element position scheme - `"input"`
* `rtcSize` - used to enable runtime configurable sorter size
* `rtcSortDir` - used to enable runtime configurable sorting direction
* `discardPos` - should be defined only if fixed discarding element scheme is chosen
* `useSorterFull` - enable corresponding status register
* `useSorterEmpty` - enable corresponding status register
* `flushData` - include flushing data functionality
* `sortDir` - used to define sorting direction (`true` denotes ascending, `false` denotes descending sorting direction)

## Prerequisites

The following software packages should be installed prior to running this project:
* [sbt](http://www.scala-sbt.org)
* [Verilator](http://www.veripool.org/wiki/verilator)

## Setup

Clone this repository, switch directory and run tests:

```
git clone https://github.com/milovanovic/lis.git
cd lis
sbt test
```

## Tests

To run all tests written in Scala simulation environment a user should execute the following command: `testOnly lis.LinearSortersSpec`. Various test cases can be found in `LinearTestersSpec.scala` which is available inside `src/test/scala` directory. Two linear insertion sorter testers are accessible inside `LinearTesters.scala`:
* `LinearSorterTester` - used for testing design when only compile time configurable parameters are active.
* `LinearSorterTesterRunTime`  - used for testing proposed design when run time configurable parameters are included.

Tester functions such as `peek`, `poke` and `except`, available inside `DspTester` (check [dsptools Chisel library](http://github.com/ucb-bar/dsptools)), are extensively used for design testing.

----------

This code is maintained by Marija Petrović and Vladimir Milovanović. Please let us know if you have any questions/feedback!

