package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class ALUTest(dut: ALU32) extends PeekPokeTester(dut){
   /*
	tests all the functions of the ALU
   */
   val negativeOperand1 = "h_ffff_fff1".U //-15 in 2` complement
   val negativeOperand2 = "h_ffff_fe38".U //-456 in 2`s complement
   val positiveOperand1 = "h_0000_0013".U //19
   val positiveOperand2 = "h_0000_016D".U //365

   //adding two positive operands - 1
   poke(dut.io.funct, "b0000000000".U)
   poke(dut.io.A, positiveOperand1)
   poke(dut.io.B, positiveOperand2)
   expect(dut.io.res, "h_0000_0180".U)
   step(1)
   //adding positive and negative operand while positive is greater than negative - 2
   poke(dut.io.funct, "b0000000000".U)
   poke(dut.io.A, positiveOperand1)
   poke(dut.io.B, negativeOperand1)
   expect(dut.io.res, "h_0000_0004".U)
   step(1)
   //adding positive and negative operand while negative is greater than positive - 3
   poke(dut.io.funct, "b0000000000".U)
   poke(dut.io.A, negativeOperand2)
   poke(dut.io.B, positiveOperand2)
   expect(dut.io.res, "h_ffff_ffa5".U)
   step(1)
   //adding two negative operands - 4
   poke(dut.io.funct, "b0000000000".U)
   poke(dut.io.A, negativeOperand1)
   poke(dut.io.B, negativeOperand2)
   expect(dut.io.res, "h_ffff_fe29".U)
   step(1)

   //subtracting two positive operands, first operand greater than second - 5
   poke(dut.io.funct, "b0100000000".U)
   poke(dut.io.A, positiveOperand2)
   poke(dut.io.B, positiveOperand1)
   expect(dut.io.res, "h_0000_015a".U)
   step(1)
   //subtracting two positive operands, first operand lower than second - 6
   poke(dut.io.funct, "b0100000000".U)
   poke(dut.io.A, positiveOperand1)
   poke(dut.io.B, positiveOperand2)
   expect(dut.io.res, "h_ffff_fea6".U)
   step(1)
   //subtracting a negative number (results in addition) - 7
   poke(dut.io.funct, "b0100000000".U)
   poke(dut.io.A, positiveOperand1)
   poke(dut.io.B, negativeOperand2)
   expect(dut.io.res, "h_0000_01DB".U)
   step(1)
   //subtracting a smaller negative number from a larger - 8
   poke(dut.io.funct, "b0100000000".U)
   poke(dut.io.A, negativeOperand2)
   poke(dut.io.B, negativeOperand1)
   expect(dut.io.res, "h_ffff_fe47".U)
   step(1)   
   //subtracting a positive number from a negative - 9
   poke(dut.io.funct, "b0100000000".U)
   poke(dut.io.A, negativeOperand2)
   poke(dut.io.B, positiveOperand1)
   expect(dut.io.res, "h_ffff_fe25".U)
   step(1)
   
   //shift left test - all 0`s - 10
   poke(dut.io.funct, "b0000000001".U)
   poke(dut.io.A, "h_8000_0000".U)
   poke(dut.io.B, "h_0000_0001".U)
   expect(dut.io.res, "h_0000_0000".U)
   step(1)

   //shift left test - multiplication by 4 - 11
   poke(dut.io.funct, "b0000000001".U)
   poke(dut.io.A, "h_0000_0001".U)
   poke(dut.io.B, "h_0000_0002".U)
   expect(dut.io.res, "h_0000_0004".U)
   step(1)

   
   //slt test 1 - 12
   poke(dut.io.funct, "b0000000010".U)
   poke(dut.io.A, negativeOperand2)
   poke(dut.io.B, negativeOperand1)
   expect(dut.io.res, "h_0000_0001".U)
   step(1)
  
   
   //slt test 2 - 13
   poke(dut.io.funct, "b0000000010".U)
   poke(dut.io.A, negativeOperand1)
   poke(dut.io.B, negativeOperand2)
   expect(dut.io.res, "h_0000_0000".U)
   step(1)

   //slt test 2 - 14
   poke(dut.io.funct, "b0000000010".U)
   poke(dut.io.A, positiveOperand1)
   poke(dut.io.B, negativeOperand2)
   expect(dut.io.res, "h_0000_0000".U)
   step(1)
 
   //sltu test  - 15
   poke(dut.io.funct, "b0000000011".U)
   poke(dut.io.A, positiveOperand1)
   poke(dut.io.B, positiveOperand2)
   expect(dut.io.res, "h_0000_0001".U)
   step(1)
   
   
   //sltu test 2  - 16 - negative operand is unsigned definitely higher than any positive
   poke(dut.io.funct, "b0000000011".U)
   poke(dut.io.A, positiveOperand1)
   poke(dut.io.B, negativeOperand2)
   expect(dut.io.res, "h_0000_0001".U)
   step(1)

   
   //XOR - creates all zeros - 17
   poke(dut.io.funct, "b0000000100".U)
   poke(dut.io.A, "h_1111_1111".U)
   poke(dut.io.B, "h_1111_1111".U)
   expect(dut.io.res, "h_0000_0000".U)
   step(1)

   //XOR - creates all ones - 18
   poke(dut.io.funct, "b0000000100".U)
   poke(dut.io.A, "h_FFFF_0000".U)
   poke(dut.io.B, "h_0000_FFFF".U)
   expect(dut.io.res, "h_FFFF_FFFF".U)
   step(1)

 
   //SRL - creates all zeros - 19
   poke(dut.io.funct, "b0000000101".U)
   poke(dut.io.A, "h_0000_0001".U)
   poke(dut.io.B, "h_0000_0001".U)
   expect(dut.io.res, "h_0000_0000".U)
   step(1)

   
   //SRL - divides by 4 - 20
   poke(dut.io.funct, "b0000000101".U)
   poke(dut.io.A, "h_0000_0004".U)
   poke(dut.io.B, "h_0000_0002".U)
   expect(dut.io.res, "h_0000_0001".U)
   step(1)
   
   //SRA fills 1s - 21
   poke(dut.io.funct, "b0100000101".U)
   poke(dut.io.A, "h_F000_0000".U)
   poke(dut.io.B, "h_0000_000C".U)
   expect(dut.io.res, "h_FFFF_0000".U)
   step(1)

   //OR test fills 1s - 22
   poke(dut.io.funct, "b0000000110".U)
   poke(dut.io.A, "h_FFFF_FFFF".U)
   poke(dut.io.B, "h_0000_0000".U)
   expect(dut.io.res, "h_FFFF_FFFF".U)
   step(1)
   
   //AND test 1 fills 0s - 23
   poke(dut.io.funct, "b0000000111".U)
   poke(dut.io.A, "h_FFFF_FFFF".U)
   poke(dut.io.B, "h_0000_0000".U)
   expect(dut.io.res, "h_0000_0000".U)
   step(1)
   
   
   //AND test 2 mask - 24
   poke(dut.io.funct, "b0000000111".U)
   poke(dut.io.A, "h_FFFF_FFFF".U)
   poke(dut.io.B, "h_0000_1234".U)
   expect(dut.io.res, "h_0000_1234".U)
   step(1)
}

object ALUTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new ALU32) {
    c => new ALUTest(c)
  }
}
