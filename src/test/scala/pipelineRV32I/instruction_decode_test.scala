package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class IDTest(dut: rv32ID) extends PeekPokeTester(dut){
  poke(dut.io.instrIn, "h_40415533".U)
  expect(dut.io.reg2, "h_4".U)
  expect(dut.io.reg1, "h_2".U)
  expect(dut.io.immidiate, "h_0".U)
  expect(dut.io.funct, "b_0100_000_101".U)
  step(1)
}

object IDTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new rv32ID) {
    c => new IDTest(c)
  }
}
