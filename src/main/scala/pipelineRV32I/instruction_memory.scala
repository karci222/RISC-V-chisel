package pipelineRV32I


import chisel3._
import chisel3.util._
import chisel3.iotesters._

/*
   This file contains data memory and instruction ROM
*/

class DataMemory(n: Int = 1024) extends Module(){
    val io = IO(new Bundle{
       val addrIn  = Input(UInt(32.W))
       val dataIn  = Input(UInt(32.W))
       val dataOut = Output(UInt(32.W))
       val load    = Input(Bool())
    })

    val syncMem = Mem(2048, UInt(32.W))
    
    
    when(io.load){
       syncMem(io.addrIn) := io.dataIn
    }
    
    io.dataOut := syncMem(io.addrIn)
}


//ROM is constructed using a vector
class InstructionRom(program: Seq[UInt]) extends Module(){
    val io = IO(new Bundle{
       val addrIn  = Input(UInt(32.W))
       val dataOut = Output(UInt(32.W))
    })
    
    val ROM = VecInit(program) 
    io.dataOut:= ROM(io.addrIn)
}
