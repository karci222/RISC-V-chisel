package pipelineRV32I


import chisel3._
import chisel3.util._
import chisel3.iotesters._

class InstructionMemory(n: Int = 1024) extends Module(){
    val io = IO(new Bundle{
       val addrIn  = Input(UInt(32.W))
       val dataIn  = Input(UInt(32.W))
       val dataOut = Output(UInt(32.W))
       val load    = Input(Bool())
    })

    val syncMem = Mem(1024, UInt(32.W))
    
    val rdAddrReg  = RegNext(io.addrIn)
   

    when(io.load){
       syncMem(io.addrIn) := io.dataIn
    }
    
    io.dataOut := syncMem(rdAddrReg)
}

class InstructionRom(program: Seq[UInt]) extends Module(){
    val io = IO(new Bundle{
       val addrIn  = Input(UInt(32.W))
       val dataOut = Output(UInt(32.W))
    })
    
    val ROM = VecInit(program) 
    io.dataOut:= ROM(io.addrIn)
}
