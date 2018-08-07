package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class ForwardingUnitTest(dut: ForwardingUnit) extends PeekPokeTester(dut){
  //feed instruction without requiring forwarding on neither of the ports
  poke(io.reg1, 2.U)
  poke(io.ex_mem_inst, "b00000000001000001000000010110011".asUInt(32.W))
  poke(io.mem_wb_inst, "b00000000000000000000000000010011".asUInt(32.W))
  poke(io.reg2, 0.U)
  expect(io.forward_A, "b00".U)
  expect(io.forward_B, "b00".U)

  //feed instruciton requiring forwarding on register 1 from ex_mem
  poke(io.reg1, 1.U)
  poke(io.ex_mem_inst, "b00000000001000001000000010110011".asUInt(32.W))
  poke(io.mem_wb_inst, "b00000000000000000000000000010011".asUInt(32.W))
  poke(io.reg2, 0.U)
  expect(io.forward_A, "b10".U)
  expect(io.forward_B, "b00".U)

  
  //feed instruciton requiring forwarding on register 2 from ex_mem
  poke(io.reg1, 0.U)
  poke(io.ex_mem_inst, "b00000000001000001000000010110011".asUInt(32.W))
  poke(io.mem_wb_inst, "b00000000000000000000000000010011".asUInt(32.W))
  poke(io.reg2, 1.U)
  expect(io.forward_A, "b00".U)
  expect(io.forward_B, "b10".U)

  //feed instruciton requiring forwarding on register 1 from mem_wb
  poke(io.reg1, 1.U)
  poke(io.ex_mem_inst, "b00000000000000000000000000010011".asUInt(32.W))
  poke(io.mem_wb_inst, "b00000000001000001000000010110011".asUInt(32.W))
  poke(io.reg2, 0.U)
  expect(io.forward_A, "b01".U)
  expect(io.forward_B, "b00".U)  

  //feed instruciton requiring forwarding on register 2 from mem_wb
  poke(io.reg1, 0.U)
  poke(io.ex_mem_inst, "b00000000000000000000000000010011".asUInt(32.W))
  poke(io.mem_wb_inst, "b00000000001000001000000010110011".asUInt(32.W))
  poke(io.reg2, 1.U)
  expect(io.forward_A, "b00".U)
  expect(io.forward_B, "b01".U)

  //feed instruciton requiring forwarding on register 1 from ex_mem, while also input from mem_wb
  poke(io.reg1, 1.U)
  poke(io.ex_mem_inst, "b00000000001000001000000010110011".asUInt(32.W))
  poke(io.mem_wb_inst, "b00000000001000001000000010110011".asUInt(32.W))
  poke(io.reg2, 0.U)
  expect(io.forward_A, "b10".U)
  expect(io.forward_B, "b00".U)

  //feed instruciton requiring forwarding on register 2 from ex_mem, while also input from mem_wb
  poke(io.reg1, 0.U)
  poke(io.ex_mem_inst, "b00000000001000001000000010110011".asUInt(32.W))
  poke(io.mem_wb_inst, "b00000000001000001000000010110011".asUInt(32.W))
  poke(io.reg2, 1.U)
  expect(io.forward_A, "b00".U)
  expect(io.forward_B, "b10".U)

}

object ForwardingUnitTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new ForwardingUnit) {
    c => new ForwardingUnitTest(c)
  }
} 
