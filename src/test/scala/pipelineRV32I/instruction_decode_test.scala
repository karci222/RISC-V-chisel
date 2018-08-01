package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class IDTest(dut: rv32ID) extends PeekPokeTester(dut){
  //alu instruction
  poke(dut.io.instrIn, "h_40415533".U)
  expect(dut.io.reg2, "h_4".U)
  expect(dut.io.reg1, "h_2".U)
  expect(dut.io.immidiate, "h_0".U)
  expect(dut.io.funct, "b_0100_000_101".U)
  step(1)

  //store instruction
  poke(dut.io.instrIn, "b00000010001100010010011010100011".asUInt(32.W))
  expect(dut.io.reg2, 3.U)
  expect(dut.io.reg1, 2.U)
  expect(dut.io.immidiate, 45.U)
  expect(dut.io.funct, 0.U)
  step(1)

  //load instruction
  poke(dut.io.instrIn, "b00000101011000000010000110000011".asUInt(32.W))
  expect(dut.io.reg1, 0.U)
  expect(dut.io.immidiate, 86.U)
  expect(dut.io.funct, 0.U)
  step(1)

  //immidiate instruction
  poke(dut.io.instrIn, "b00000101100001111010000110010011".asUInt(32.W))
  expect(dut.io.reg1, 15.U)
  expect(dut.io.immidiate, 88.U)
  expect(dut.io.funct, 2.U)
  step(1)
  
  //immidiate instruction type 2
  poke(dut.io.instrIn, "b00000000100000010001100110010011".asUInt(32.W))
  expect(dut.io.reg1, 2.U)
  expect(dut.io.immidiate, 8)
  expect(dut.io.funct, 1.U)
  step(1)

  //branch instruction test
  poke(dut.io.instrIn, "b10010110001000001001001011100011".asUInt(32.W))
  expect(dut.io.reg1, 1)
  expect(dut.io.reg2, 2)
  expect(dut.io.immidiate, "h_FFFF_F964".U)
  expect(dut.io.funct, "b0100000000".U)
}

object IDTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new rv32ID) {
    c => new IDTest(c)
  }
}
