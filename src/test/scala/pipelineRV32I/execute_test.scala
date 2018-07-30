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
   poke(dut.io.useImmidiate, Bool(false))
   poke(dut.io.useNPCIn, Bool(false))
   expect(dut.io.res, "h_0000_0180".U)
   step(1)

   //adding register and immidiate
   poke(dut.io.funct, "b0000000000".U)
   poke(dut.io.reg1, positiveOperand1)
   poke(dut.io.reg2, 0.U)
   poke(dut.io.immidiate, positiveOperand2)
   poke(dut.io.useImmidiate, Bool(true))
   poke(dut.io.useNPCIn, Bool(false))
   expect(dut.io.res, "h_0000_0180".U)
   step(1)
  
 
   //adding immidiate and NPC
   poke(dut.io.funct, "b0000000000".U)
   poke(dut.io.reg1, 0.U)
   poke(dut.io.reg2, 0.U)
   poke(dut.io.immidiate, positiveOperand1)
   poke(dut.io.NPCIn, positiveOperand2)
   poke(dut.io.useImmidiate, Bool(true))
   poke(dut.io.useNPCIn, Bool(true))
   expect(dut.io.res, "h_0000_0180".U)
   step(1)
}

object EXTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new rv32EX) {
    c => new EXTest(c)
  }
}
