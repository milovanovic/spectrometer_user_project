// SPDX-License-Identifier: Apache-2.0

package hyperspace

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._

import org.scalatest.{FlatSpec, Matchers}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// SPEC
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
class HyperSpaceTestSpec extends FlatSpec with Matchers {
  implicit val p: Parameters = Parameters.empty
  
  val fftSize = sys.props.getOrElse("fftSize", "512")
  val minSRAMDepth = sys.props.getOrElse("minSRAMDepth", "512")
  val enablePlot = sys.props.getOrElse("enablePlot", "false")

  val simulator = "verilator" //"treadle" //"verilator"

  val params = (new HyperSpaceParams(fftSize.toInt, minSRAMDepth.toInt)).params

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//  Chain Test
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  it should "test AXI4HyperSpace" in {
    val lazyDut = LazyModule(new AXI4HyperSpace(params, 4) with AXI4HyperSpacePins)
    chisel3.iotesters.Driver.execute(Array("--backend-name", simulator, "--target-dir", "test_run_dir/AXI4HyperSpace", "--top-name", "AXI4HyperSpace"), () => lazyDut.module) {
      c => new HyperSpaceTester(lazyDut, params, fftSize.toInt, false, enablePlot.toBoolean, true)
    } should be (true)
  }
}
