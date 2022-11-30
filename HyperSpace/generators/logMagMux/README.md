Log-Magnitude Mux Chisel generator
=======================================================

[![Build Status](https://travis-ci.org/milovanovic/logMagMux.svg?branch=master)](https://travis-ci.org/milovanovic/logMagMux)

## Overview

This repository contains simple Log-Magnitude Multiplexer written in [Chisel ](https://www.chisel-lang.org/) hardware design language. Proposed design computes squared magnitude of the input complex signal, magnitude, where the complicated square root operation is replaced with JPL aproximation of the square root, and log2 of its value as well.  
The multiplexer is described with following Scala files available inside`src/main/scala` directory:
* `LogMagMux.scala` - contains generator parameter definition and `LogMagMux` module.
* `LogMagMuxDspBlock.scala` - contains description of `LogMagMuxDspBlock`.  

## Interface of the Log-Magnitude Mux

Interface of the implemented block showing inout signals as well as control register for the sel signal of the multiplexer is presented in the figure below. Signals ready/valid are controled in the following way:

For the design where pipeline registers are not used, simple passthrough logic for ready and valid signals is applied. When pipeline registers are included then additional Queues are instatiated at the output of the multiplexer. Simple [Queue](https://www.chisel-lang.org/api/latest/chisel3/util/Queue$.html) modules provide that all data will be processed and interpreted in the correct way. Module LogMagMux is ready to accept new data when ready signal from the output side is not asserted but only specific number of data, equal to the total latency of the design, can be processed (this feature is controled with `initialInDone` signal). When flushing is active, ready signal from the input side is deasserted (signal `last` denotes whether flushing is active or not). If initialization is finished (`initialInDone` is equal to true) and flushing is not active (`last` is false) then ready signal from the input side is equal to the ready signal from the output side.

![Interface of the Mux block](./doc/images/MuxInterface.svg)

[comment]: <> (Here goes explanation of the scheme with more details regarding log2 calculation)

####  Inputs 

[Decoupled](https://github.com/freechipsproject/chisel3/wiki/Interfaces-Bulk-Connections) interface is used where .bits is input  IQ sample. 
* `in: Flipped(Decoupled(DspComplex[T]))` - input IQ sample 
* `sel: UInt(2.W)` -  selection signal used to control output of the multiplexer
* `lastIn:  Bool`- optional signal, denotes the last sample of the streaming input data

#### Outputs

Decoupled interface is used where .bits is output of the multiplexer.
* `out: Decoupled(DspComplex[T])` - output of the multiplexer, if bypass mode is not active imaginary part of the complex data is driven to zero
* `lastOut: Bool` - optional signal, denotes the last sample of the streaming output (it is  the delayed version of the `lastIn` signal) 

#### Dsp Block

The  Log Magnitude Mux generator is wrapped as generic DSP block in a diplomatic interface which is actually AXI4-Stream for inputs and outputs and optional memory-mapped bus (TileLink, AXI4, APB or AHB) for control and status registers. Appropriate Chisel code which does above mentioned wrapping is available inside `LogMagMuxDspBlock.scala`.  

## Parameter settings

Design parameters are defined inside `case class MAGParams`. Users can customize design per use case by setting the appropriate parameters.
The explanation of each parameter is given below:
* `proto` - input data type 
* `log2LookUpWidth` -  number of bits that are input address to look-up table used for log2 calculation
* `useLast` - simulate AXI4 optional TLAST signal

Additionally,  number of the pipeline registers (`numAddPipes` and `numMulPipes`) used after +/- and * chisel operators can be parameterized using `DspContext` and features of the dsptools library.  Control and other logic is adjusted to adequately follow pipeline register insertion.

## Prerequisites

The following software packages should be installed prior to running this project:
* [sbt](http://www.scala-sbt.org)
* [Verilator](http://www.veripool.org/wiki/verilator)

## Setup

Clone this repository, switch directory and run tests:
```
git clone https://github.com/milovanovic/LogMagMux.git
cd LogMagMux
sbt test
```
## Tests

This repository provides also simple tests which confirm the correct behaviour of the proposed design. Tests are described with following files:
* `LogMagMuxSpec` - run tester for different parameter configurations 
* `LogMagMuxTester` - tests log-magnitude mux

Tester functions such as `peek`, `poke` and `except`, available inside `DspTester` (check [dsptools Chisel library ](http://github.com/ucb-bar/dsptools)), are extensively used for design testing.

## TODO

* Made sel signal optional and adjust README file to follow this generator
* Change block diagram
* Define logic for saturation and overflow (this is in direct connection with this [pull request](https://github.com/ucb-bar/dsptools/pull/189))
* Analyze lookUp table width impact on `log2 `calculation precision

