package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class RegisterTest(dut: RegistryFile) extends PeekPokeTester(dut){
   //fill in the registers with some mock-up values
 
   poke(dut.io.reg1Selector, 2.U)
   poke(dut.io.reg2Selector, 3.U)

   for(i <- 0 until 32){
      poke(dut.io.regInSelector, i.U)
      poke(dut.io.regIn, i.U)
      poke(dut.io.writeEn, true.B)
      step(1)
   }
 
   poke(dut.io.writeEn, false.B)
   step(1)

   for(i <- 0 until 32){
      poke(dut.io.reg1Selector, i.U)
      expect(dut.io.regOut1, i.U)
      step(1)
   }
}

object RegisterTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new RegistryFile) {
    c => new RegisterTest(c)
  }
}
