
Digital Signal Processing Utilities
=======================================================

## Overview

This repository contains some useful digital signal processing utilities, some of them are written to support radar data receivers which compromise interface in  `LVDS data + valid line` form :

* `AXI4StreamCombiner` - combines multiple "narrow" AXI4 streams into one wide output AXI4 stream
* `AXI4StreamCustomCombiner` - combines 2 "narrow" AXI4 streams into one output AXI4 stream. Generation of ready signals differs comparing to `AXI4StreamCombiner` module.
* `Splitter` - replicates a single inbound AXI4-Stream interface into multiple outbound AXI4-Stream interfaces
* `AsyncQueueWithMem` - changed version of `AsyncQueue` available inside rocket-chip.
* `AsyncQueuePackerLazyModule` - block which uses `AsyncQueueWithMem` and concatenates LVDS lines in order to generate 64 bits `AXI4` stream
* `AsyncQueueWithCrcLine` - block which uses `AsyncQueueWithMem` with 17 bit input and 17 bit output (16 bits are LVDS data, MSB bit is `crc_on_line` bit)
* `AsyncQueueAXI4StreamOut` - input is LVDS data + valid line, output is AXI4 stream
* `AsyncQueueModule` - simple test module
* `DspQueueWithSyncReadMem` - It implements simple queue with custom parameters, it can support programmable full feature, useful for debugging purposes, it can generate last signal after specified number of samples
* `QueueWithSyncReadMem` - copy of Queue from the newest Chisel (currently not available in `chipyard`) with added optional block ram implementation
* `AXI4StreamSimpleSplitter` - custom splitter written for one input and 2 outputs (TODO: replace current nodes with nexus node)
* `AXI4StreamBufferWithBlockRam` - uses same principle as `AXI4StreamBuffer` from `rocket-dsp-utils` library only Queue is implemented using block ram
* `AsyncQueueWithControlLine` - block which uses `AsyncQueueWithMem` .  It uses custom node written to support additional field inside bits - `ctrl`.

**Important Note:**
This project needs to be run with `chipyard` dependencies due to some specific relations that `AsyncQueue` requires to have.

## TODO

* `AXI4StreamCombiner`- some changes related to output data width definition should be applied
* Splitter perhaps should be moved to some other repository (`utils`)
* Find a way how to easily test multiple clock domains (consult required)
* Update documentation
* Add more test cases
