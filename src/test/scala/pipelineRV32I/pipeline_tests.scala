package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._


//mockup test of the pipeline, only for the connection of the instruction fetch with the memory
//first it fills memory with some data and then instruction fetch stage fetches the data
class PipelineTest1(dut: PipelineTop) extends PeekPokeTester(dut){
  for(i <-0 until 9){
	step(1)
  }

  expect(dut.io.res, "h_63".U)//add

  step(1)
  expect(dut.io.res, "h_FFFF_FFE1".U) //SUB
  step(1)
  expect(dut.io.res, 68.U)//SLL
  step(1)
  expect(dut.io.res, 1.U)//SLT
  step(1)
  expect(dut.io.res, 1.U)//SLTU
  step(1)
  expect(dut.io.res, 99.U)//XOR
  step(1)
  expect(dut.io.res, 17.U)//SRL
  step(1)
  expect(dut.io.res, 17.U)//SRA
  step(1)
  expect(dut.io.res, 99)//OR
  step(1)
  expect(dut.io.res, 0.U)//AND
  step(1)
  step(1)//LW
  step(1)//NOP
  step(1)//NOP
  step(1)//NOP
  step(1)
  expect(dut.io.res, 34.U)//LW_test
  step(1)
  expect(dut.io.res, 1.U)//SLTI
  step(1)
  expect(dut.io.res, 0.U)//SLTIU
  step(1)
  expect(dut.io.res, 0.U)//XORI
  step(1)
  expect(dut.io.res, 0.U)//ANDI
  step(1)
  step(10)
}

//empty test that just runs a program
class PipelineTest2(dut: PipelineTop) extends PeekPokeTester(dut){
  step(1500)
}

object PipelineTest1Main extends App {
   
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new PipelineTop) {
    c => new PipelineTest1(c)
  }
}

object PipelineTest2Main extends App {
   
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new PipelineTop) {
    c => new PipelineTest2(c)
  }
}

