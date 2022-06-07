package lis

import chisel3._
import chisel3.experimental.FixedPoint

import dsptools.DspTester
import dsptools.numbers._

import org.scalatest.{FlatSpec, Matchers}
import scala.util.{Random}
import scala.collection.mutable.ArrayBuffer


class LinearSortersSpec extends FlatSpec with Matchers {

  behavior of "Linear streaming insertion sorters"

  for (sorterType <- Seq("LIS_fixed", "LIS_FIFO", "LIS_input")) {
   // for (sorterType <- Seq("LIS_FIFO")) {
      for (sorterSize <- Seq(8, 16, 64)) {
        for(sortDir <- Seq(true, false)) {
          it should f"work for UInt, sorter type $sorterType, sorter size = $sorterSize and parameter sortDir = $sortDir" in {//ignore {//in {
            val params: LISParams[UInt] = LISParams(
              proto = UInt(16.W),
              LISsize = sorterSize,
              LIStype = sorterType,
              discardPos = if (sorterType == "LIS_fixed") Some(sorterSize/2) else None,
              rtcSize = false,
              sortDir = sortDir
            )
            val in = Seq.fill(params.LISsize)(Random.nextInt(1<<(params.proto.getWidth)).toDouble) // max is exclusive 0 is inclusive
            dsptools.Driver.execute(
              () => new LinearSorter(params),
              Array(
              "--backend-name", "treadle", // "treadle", // "verilator",
              "--target-dir", s"test_run_dir/$sorterType-$sorterSize-UInt-$sortDir")
              ) { c =>
                new LinearSorterTester(c, in, 0)
              } should be (true)
          }
        }
      }
    }

    for (sorterType <- Seq("LIS_fixed", "LIS_FIFO", "LIS_input")) {
      for (sorterSize <- Seq(2, 16, 32)) {
        for (sortDir <- Seq(true, false)) {
          it should f"work for SInt, sorter type $sorterType, sorter size = $sorterSize and sortDir = $sortDir" in {
            val params: LISParams[SInt] = LISParams(
              proto = SInt(16.W),
              LISsize = sorterSize,
              LIStype = sorterType,
              discardPos = if (sorterType == "LIS_fixed") Some(0) else None,
              rtcSize = false,
              rtcSortDir = false,
              sortDir = true
            )
            val in = Seq.fill(params.LISsize)((Random.nextInt((1<<(params.proto.getWidth-1))*2) - (1<<(params.proto.getWidth-1))).toDouble)
            dsptools.Driver.execute(
                () => new LinearSorter(params),
                Array(
                "--backend-name", "treadle", // "treadle", // "verilator",
                "--target-dir", s"test_run_dir/$sorterType-$sorterSize-SInt-$sortDir")
            ){ c =>
                  new LinearSorterTester(c, in, 0)
            } should be (true)
          }
        }
      }
    }

    for (sorterType <- Seq("LIS_fixed", "LIS_FIFO", "LIS_input")) {
      for (sorterSize <- Seq(2, 16, 32)) {
        for (sortDir <- Seq(true,false)) {
          it should f"work for FixedPoint, sorter type $sorterType, sorter size = $sorterSize and sortDir = $sortDir" in {//in {
            val params: LISParams[FixedPoint] = LISParams(
              proto = FixedPoint(16.W, 8.BP),
              LISsize = sorterSize,
              LIStype = sorterType,
              discardPos = if (sorterType == "LIS_fixed") Some(sorterSize/2) else None,
              rtcSortDir = false,
              rtcSize = false,
              sortDir = true
            )
            val in: Seq[Double] = Seq.fill(params.LISsize)((Random.nextDouble()*2-1) * ((1<<params.proto.getWidth - params.proto.binaryPoint.get-1)))
            dsptools.Driver.execute(
                () => new LinearSorter(params),
                Array(
                "--backend-name", "treadle", // "treadle", // "verilator",
                "--target-dir", s"test_run_dir/$sorterType-$sorterSize-FixedPoint-$sortDir")
            ){ c =>
                  new LinearSorterTester(c, in, 1)
            } should be (true)
          }
        }
      }
    }

    for (sorterType <- Seq("LIS_fixed", "LIS_FIFO", "LIS_input")) {
      for (sorterSize <- Seq(2, 16, 32)) {
        for (sortDir <- Seq(true, false)) {
          it should f"work for DspReal, sorter type $sorterType and  sorter size = $sorterSize and sortDir = $sortDir" in {//ignore {
            val params: LISParams[DspReal] = LISParams(
              proto = DspReal(),
              LISsize = sorterSize,
              LIStype = sorterType,
              discardPos = if (sorterType == "LIS_fixed") Some(sorterSize/2) else None,
              rtcSize = false,
              sortDir = true
            )
            val in = Seq.fill(params.LISsize)((Random.nextInt(Double.MaxValue.toInt) - Double.MaxValue.toInt).toDouble)
            dsptools.Driver.execute(
                () => new LinearSorter(params),
                Array(
                "--backend-name", "treadle", // "treadle", // "verilator",
                "--target-dir", s"test_run_dir/$sorterType-$sorterSize-DspReal-$sortDir")
            ){ c =>
                  new LinearSorterTester(c, in, 12)
            } should be (true)
          }
        }
      }
    }

   // test run time configurability!
   for (sorterType <- Seq("LIS_fixed", "LIS_FIFO", "LIS_input")) {
      for (sorterSize <- Seq(8, 16, 32)) {
        it should f"work for FixedPoint, sorter type $sorterType, compile sorter size = $sorterSize and rtcSize configurable sorter size" in {//in {
          val params: LISParams[FixedPoint] = LISParams(
            proto = FixedPoint(16.W, 8.BP),
            LISsize = sorterSize,
            LIStype = sorterType,
            discardPos = if (sorterType == "LIS_fixed") Some(0) else None,
            rtcSize = true,
            sortDir = true
          )
          val in: Seq[Double] = Seq.fill(params.LISsize)((Random.nextDouble()*2-1) * ((1<<params.proto.getWidth - params.proto.binaryPoint.get-1)))
          dsptools.Driver.execute(
              () => new LinearSorter(params),
              Array(
              "--backend-name", "treadle", // "treadle", // "verilator",
              "--target-dir", s"test_run_dir/$sorterType-$sorterSize-FixedPoint-rtcSizeSize")
           ){ c =>
                new LinearSorterTesterRunTime(c, in, 1)
          } should be (true)
        }
      }
    }

   // test rtcSize configurable sorting direction together with rtcSize configurable sorter size
   for (sorterType <- Seq("LIS_fixed", "LIS_FIFO", "LIS_input")) {
   //for (sorterType <- Seq("LIS_FIFO")) {
      for (sorterSize <- Seq(4, 15, 32)) { // test power of 2 and non power of 2 sorter size
        it should f"work for FixedPoint, sorter type $sorterType, compile sorter size = $sorterSize and rtcSize configurable sorting direction and sorter size" in {
          val params: LISParams[FixedPoint] = LISParams(
            proto = FixedPoint(16.W, 8.BP),
            LISsize = sorterSize,
            LIStype = sorterType,
            discardPos = if (sorterType == "LIS_fixed") Some(0) else None,
            rtcSize = true,
            rtcSortDir = true, //false - works for both
            sortDir = true
          )
          val in: Seq[Double] = Seq.fill(params.LISsize)((Random.nextDouble()*2-1) * ((1<<params.proto.getWidth - params.proto.binaryPoint.get-1)))
          dsptools.Driver.execute(
              () => new LinearSorter(params),
              Array(
              "--backend-name", "verilator", // "treadle", // "verilator",
              "--target-dir", s"test_run_dir/$sorterType-$sorterSize-FixedPoint-rtcSizeSize")
           ){ c =>
                new LinearSorterTesterRunTime(c, in, 1)
          } should be (true)
        }
      }
    }

   // test flushData parameter
//     for (sorterType <- Seq("LIS_FIFO", "LIS_fixed", "LIS_input")) {
//       for (sorterSize <- Seq(2,16,32)) {
//         for (sortDir <- Seq(true,false)) {
//           it should f"work for FixedPoint, sorter type $sorterType, sorter size = $sorterSize, sortDir = $sortDir and included flushData parameter" ignore {
//             val params: LISParams[FixedPoint] = LISParams(
//               proto = FixedPoint(16.W, 8.BP),
//               LISsize = sorterSize,
//               LIStype = sorterType,
//               discardPos = if (sorterType == "LIS_fixed") Some(sorterSize/2) else None,
//               rtcSize = false,
//               flushData = true,
//               sortDir = sortDir
//             )
//           val in: Seq[Double] = Seq.fill(params.LISsize)((Random.nextDouble()*2-1) * ((1<<params.proto.getWidth - params.proto.binaryPoint.get-1)))
//             dsptools.Driver.execute(
//                 () => new LinearSorter(params),
//                 Array(
//                 "--backend-name", "firrtl", // "treadle", // "verilator",
//                 "--target-dir", s"test_run_dir/$sorterType-$sorterSize-FixedPoint")
//             ){ c =>
//                   new LinearSorterTester(c, in, 1)
//             } should be (true)
//           }
//         }
//       }
//     }
    
    for (sorterType <- Seq("LIS_FIFO", "LIS_fixed", "LIS_input")) {
      for (sorterSize <- Seq(2, 4, 16, 25)) {
        for (sortDir <- Seq(true, false)) {
          it should f"work for FixedPoint, sorter type $sorterType, sorter size = $sorterSize, sortDir = $sortDir and with lastIn/ lastOut" in {
            val params: LISParams[FixedPoint] = LISParams(
              proto = FixedPoint(16.W, 8.BP),
              LISsize = sorterSize,
              LIStype = sorterType,
              discardPos = if (sorterType == "LIS_fixed") Some(sorterSize/2) else None,
              rtcSize = false,
              flushData = false,
              sortDir = sortDir
            )
          val in: Seq[Double] = Seq.fill(params.LISsize)((Random.nextDouble()*2-1) * ((1<<params.proto.getWidth - params.proto.binaryPoint.get-1)))
             dsptools.Driver.execute(
                () => new LinearSorter(params),
                Array(
                "--backend-name", "treadle", // "treadle", // "verilator",
                "--target-dir", s"test_run_dir/$sorterType-$sorterSize-FixedPoint")
            ){ c =>
                  new LinearSorterTesterTestLastIn(c, in, 1)
            } should be (true)
          }
        }
      }
    }
    
}
