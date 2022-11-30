package lis

import chisel3._
import chisel3.util._

// For writing following LIS utilities CounterWithReset object, based on already available Counter object from Chisel library, has been used

class CounterWithReset(n: Int, initValue: UInt) {
  require(n >= 0)
  val value = if (n > 1) RegInit(initValue) else 0.U(log2Up(n).W)
  def inc(): Bool = {
    if (n > 1) {
      val wrap = value === (n-1).asUInt
      value := value + 1.U
      if (!isPow2(n)) {
        when (wrap) { value := 0.U }
      }
      wrap
    } else {
      true.B
    }
  }
  def reset(): Unit = { value := 0.U }
}

object CounterWithReset {
  def apply(n: Int, initValue: UInt): CounterWithReset = new CounterWithReset(n, initValue)
  def apply(cond: Bool, initValue: UInt, reset: Bool, n: Int): (UInt, Bool) = {
    val c = new CounterWithReset(n, initValue)
    var wrap: Bool = null
    when (cond) { wrap = c.inc() }
    when (reset) { c.reset() }
    (c.value, cond && wrap)
  }
}

class LifeCounter(n: Int, dataToLoad: UInt, initData: UInt, sorterSize: UInt) extends CounterWithReset(n, initData) {
  val discard = value === (sorterSize - 1.U)
  override def inc(): Bool = {
    if (n > 1) {
      value := value + 1.U
      when (discard) { value := 0.U }
    }
    discard
  }
  def load(): Unit = { value := dataToLoad + 1.U }
}

object LifeCounter {
  def apply(cond: Bool, reset: Bool, initData: UInt, load: Bool, n: Int, dataToLoad: UInt, sorterSize: UInt) : (UInt, Bool) = {
    val c = new LifeCounter(n, dataToLoad, initData, sorterSize)
    var wrap: Bool = null
    when (load) { c.load() } // condition for load has a higher priority than condition for increment
    .elsewhen (cond) { wrap = c.inc() }
    when (reset && cond) { c.reset() }
    (c.value, c.discard)
  }
}
