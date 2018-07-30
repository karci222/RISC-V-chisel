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

  step(1)
}

object PipelineTest1Main extends App {
   
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new PipelineTop) {
    c => new PipelineTest1(c)
  }
}

