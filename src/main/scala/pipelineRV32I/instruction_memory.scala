package pipelineRV32I


import chisel3._

class ICacheSynth(n: Int = 2**10) extends Module(){
    val io = IO(new Bundle{
       val addrIn  = Input(UInt(32.W))
       val dataIn  = Input(UInt(32.W))
       val dataOut = Output(UInt(32.W))
       val load    = Bool())
    })

    val mem = SyncReadMem(n, UInt(32.W))

    when(load){
       mem.write(addrIn, dataIn)
    }.otherwise{
       dataOut := mem.read(addr, read)
    }
}

class ICacheTest(initProgram: String) extends Module(){
   
}
