package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class IFTest(dut: rv32IF) extends PeekPokeTester(dut){
  poke(dut.io.condIn, UInt(0))
  poke(dut.io.nextPC, UInt(0))
  peek(dut.io.NPCOut)
  peek(dut.io.PCOut)
  expect(dut.io.PCOut, 0)
  expect(dut.io.NPCOut, 4)
  step(1)
  poke(dut.io.condIn, UInt(0))
  poke(dut.io.nextPC, UInt(0))
  peek(dut.io.NPCOut)
  peek(dut.io.PCOut)
  expect(dut.io.PCOut, 4)
  expect(dut.io.NPCOut, 8)
  step(1)
  poke(dut.io.condIn, UInt(0))
  poke(dut.io.nextPC, UInt(0))
  peek(dut.io.NPCOut)
  peek(dut.io.PCOut)
  expect(dut.io.PCOut, 8)
  expect(dut.io.NPCOut, 12)
  step(1)
  poke(dut.io.condIn, UInt(0))
  poke(dut.io.nextPC, UInt(0))
  peek(dut.io.NPCOut)
  peek(dut.io.PCOut)  
  expect(dut.io.PCOut, 12)
  expect(dut.io.NPCOut, 16)
  step(1)
  poke(dut.io.condIn, UInt(1))
  poke(dut.io.nextPC, UInt(150))
  peek(dut.io.NPCOut)
  peek(dut.io.PCOut)
  expect(dut.io.PCOut, 16)
  expect(dut.io.NPCOut, 150) 
  step(1)
  poke(dut.io.condIn, UInt(0))
  poke(dut.io.nextPC, UInt(0))
  peek(dut.io.NPCOut)
  peek(dut.io.PCOut)
  expect(dut.io.PCOut, 150)
  expect(dut.io.NPCOut, 154)
  step(1)
  poke(dut.io.condIn, UInt(0))
  poke(dut.io.nextPC, UInt(0))
  peek(dut.io.NPCOut)
  peek(dut.io.PCOut)
  expect(dut.io.PCOut, 154)
  expect(dut.io.NPCOut, 158)
  step(1)
  step(1)
}


object IFTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new rv32IF) {
    c => new IFTest(c)
  }
}
