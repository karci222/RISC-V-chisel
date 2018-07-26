package pipelineRV32I


import chisel3._

class ICacheSynth(n: Int = 1024) extends Module(){
    val io = IO(new Bundle{
       val addrIn  = Input(UInt(32.W))
       val dataIn  = Input(UInt(32.W))
       val dataOut = Output(UInt(32.W))
       val load    = Bool()
    })

    val mem = SyncReadMem(n, UInt(32.W))

    when(io.load){
       mem.write(io.addrIn, io.dataIn)
    }.otherwise{
       io.dataOut := mem.read(io.addrIn)
    }
}

