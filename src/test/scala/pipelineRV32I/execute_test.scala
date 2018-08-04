package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class EXTest(dut: rv32EX) extends PeekPokeTester(dut){
   val negativeOperand1 = "h_ffff_fff1".U //-15 in 2` complement
   val negativeOperand2 = "h_ffff_fe38".U //-456 in 2`s complement
   val positiveOperand1 = "h_0000_0013".U //19
   val positiveOperand2 = "h_0000_016D".U //365

   //adding two register operands
   poke(dut.io.funct, "b0000000000".U)
   poke(dut.io.reg1, positiveOperand1)
   poke(dut.io.reg2, positiveOperand2)
   poke(dut.io.instrIn, "b00000000001100000000000010110011".asUInt(32.W))
   expect(dut.io.res, "h_0000_0180".U)
   step(1)

   //adding register and immidiate
   poke(dut.io.funct, "b0000000000".U)
   poke(dut.io.reg1, positiveOperand1)
   poke(dut.io.reg2, 0.U)
   poke(dut.io.immidiate, positiveOperand2)
   poke(dut.io.instrIn, "b00001000010011111000010000010011".asUInt(32.W))
   expect(dut.io.res, "h_0000_0180".U)
   step(1)
   
   //branch instruction test
   poke(dut.io.funct, "b0000000000".U)
   poke(dut.io.reg1, 12.U)
   poke(dut.io.reg2, 14.U)
   poke(dut.io.immidiate, "h_FFFF_FFF8".U)
   poke(dut.io.NPCIn, 24.U)
   poke(dut.io.instrIn, "b00010000001100010100001001100011".asUInt(32.W))
   expect(dut.io.cond, true.B)
   expect(dut.io.res, 16.U)
   step(1)

  //LUI test
  poke(dut.io.instrIn, "b00000011110100100001101000110111".asUInt(32.W))
  poke(dut.io.immidiate, 15649<<12)
  poke(dut.io.funct, 0.U)
  poke(dut.io.reg1, 0.U)
  poke(dut.io.reg2, 13.U)
  expect(dut.io.res,  15649<<12)
  step(1)

  //AUIPC test
  poke(dut.io.instrIn, "b00000001000111011001101010010111".asUInt(32.W))
  poke(dut.io.immidiate, 4569<<12)
  poke(dut.io.reg1, 0.U)
  poke(dut.io.reg2, 13.U)
  poke(dut.io.NPCIn, 16.U)
  poke(dut.io.funct, 0.U)  
  expect(dut.io.res, (4569 << 12) + 16)
  step(1)

  //JAL test
  poke(dut.io.instrIn, "b01100001011111100000101101101111".asUInt(32.W))
  poke(dut.io.immidiate, 921110.U)
  poke(dut.io.NPCIn, 16.U)
  poke(dut.io.funct, 0.U)
  expect(dut.io.res, 921126)
  step(1)

  //JALR test
  poke(dut.io.instrIn, "b01001101001100001000101111100111".asUInt(32.W))
  poke(dut.io.reg1, 136.U)
  poke(dut.io.immidiate, 1235.U)
  expect(dut.io.res, 1371.U)
  step(1)
}

object EXTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new rv32EX) {
    c => new EXTest(c)
  }
}
