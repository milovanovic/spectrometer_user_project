// SPDX-License-Identifier: Apache-2.0

package dsputils.uart

import freechips.rocketchip.diplomaticobjectmodel.model.{OMDevice, OMInterrupt, OMMemoryRegion}

case class OMUART(
  divisorWidthBits: Int,
  divisorInit: Int,
  nRxEntries: Int,
  nTxEntries: Int,
  dataBits: Int,
  stopBits: Int,
  oversample: Int,
  nSamples: Int,
  includeFourWire: Boolean,
  includeParity: Boolean,
  includeIndependentParity: Boolean,
  memoryRegions: Seq[OMMemoryRegion],
  interrupts: Seq[OMInterrupt],
  _types: Seq[String] = Seq("OMUART", "OMDevice", "OMComponent"),
) extends OMDevice

