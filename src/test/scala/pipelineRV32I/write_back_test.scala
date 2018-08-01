package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._


class WriteBackTest(dut: rv32WB) extends PeekPokeTester(dut){
  poke(dut.io.instrIn, "b00000000001100000000000010110011".asUInt(32.W))
  poke(dut.io.res, 56.U)
  poke(dut.io.dataIn, 456.U)
  expect(dut.io.dataToReg, 56.U)
  expect(dut.io.regInSelector, 1.U)
  expect(dut.io.writeRegister, true.B)
  step(1)

  poke(dut.io.instrIn, "b01000000010000000000000110110011".asUInt(32.W))
  poke(dut.io.res, 20.U)
  poke(dut.io.dataIn, 123.U)
  expect(dut.io.dataToReg, 20.U)
  expect(dut.io.regInSelector, 3.U)
  expect(dut.io.writeRegister, true.B)
  step(1)

  poke(dut.io.instrIn, "b00000000100001001001010110110011".asUInt(32.W))
  poke(dut.io.res, 5.U)
  poke(dut.io.dataIn, 123.U)
  expect(dut.io.dataToReg, 5.U)
  expect(dut.io.regInSelector, 11.U)
  expect(dut.io.writeRegister, true.B)
  step(1)

  poke(dut.io.instrIn, "b00000000000100001111000010110011".asUInt(32.W))
  poke(dut.io.res, 13.U)
  poke(dut.io.dataIn, 666.U)
  expect(dut.io.dataToReg, 13.U)
  expect(dut.io.regInSelector, 1.U)
  expect(dut.io.writeRegister, true.B)
  step(1)

  poke(dut.io.instrIn, "b00000010001100010010011010100011".asUInt(32.W))
  poke(dut.io.res, 13.U)
  poke(dut.io.dataIn, 666.U)
  expect(dut.io.writeRegister, false.B)
  step(1)

  poke(dut.io.instrIn, "b00000101011000000010000110000011".asUInt(32.W))
  poke(dut.io.res, 13.U)
  poke(dut.io.dataIn, 666.U)
  expect(dut.io.dataToReg, 666.U)
  expect(dut.io.regInSelector, 3.U)
  expect(dut.io.writeRegister, true.B)
  step(1)
  
  
  poke(dut.io.instrIn, "b00001000010011111000010000010011".asUInt(32.W))
  poke(dut.io.res,  45.U)
  poke(dut.io.dataIn, 6.U)
  expect(dut.io.dataToReg, 45.U)
  expect(dut.io.regInSelector, 8.U)
  expect(dut.io.writeRegister, true.B)
  step(1)
}

object WriteBackTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new rv32WB) {
    c => new WriteBackTest(c)
  }
}	
