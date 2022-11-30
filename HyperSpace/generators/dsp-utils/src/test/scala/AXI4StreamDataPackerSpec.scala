// SPDX-License-Identifier: Apache-2.0

package dsputils

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers


//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// SPEC
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
class AXI4StreamDataPackerSpec extends AnyFlatSpec with Matchers {
  implicit val p: Parameters = Parameters.empty

  val numberBytes = 8
  val testSize = 4096

  it should "test AXI4StreamDataPacker" in {
    val lazyDut = LazyModule(new AXI4StreamDataPacker(AddressSet(0x00, 0xF), beatBytes = 4) with AXI4StreamDataPackerPins{override def numBytes = numberBytes})

    dsptools.Driver.execute(() => lazyDut.module, Array("--backend-name", "verilator", "--target-dir", "test_run_dir/AXI4StreamDataPacker", "--top-name", "AXI4StreamDataPacker")) {
      c => new DataPackerTester(lazyDut, testSize, numberBytes, AddressSet(0x00, 0xF), true)
    } should be (true)
  }
}