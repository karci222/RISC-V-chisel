package pipelineRV32I


import chisel3._
import chisel3.util._

class RegistryFile() extends Module(){
   val io = IO(new Bundle{
        val regOut1       = Output(UInt(32.W))
	val regOut2       = Output(UInt(32.W))
	val regIn         = Input(UInt(32.W))
	val reg1Selector  = Input(UInt(5.W))
	val reg2Selector  = Input(UInt(5.W))
	val regInSelector = Input(UInt(5.W))
	val writeEn	  = Input(Bool())
   })

   val Reg0  = RegInit(0.U(32.W))
   val Reg1  = RegInit(0.U(32.W))
   val Reg2  = RegInit(0.U(32.W))
   val Reg3  = RegInit(0.U(32.W))
   val Reg4  = RegInit(0.U(32.W))
   val Reg5  = RegInit(0.U(32.W))
   val Reg6  = RegInit(0.U(32.W))
   val Reg7  = RegInit(0.U(32.W))
   val Reg8  = RegInit(0.U(32.W))
   val Reg9  = RegInit(0.U(32.W))
   val Reg10 = RegInit(0.U(32.W))
   val Reg11 = RegInit(0.U(32.W))
   val Reg12 = RegInit(0.U(32.W))
   val Reg13 = RegInit(0.U(32.W))
   val Reg14 = RegInit(0.U(32.W))
   val Reg15 = RegInit(0.U(32.W))
   val Reg16 = RegInit(0.U(32.W))
   val Reg17 = RegInit(0.U(32.W))
   val Reg18 = RegInit(0.U(32.W))
   val Reg19 = RegInit(0.U(32.W))
   val Reg20 = RegInit(0.U(32.W))
   val Reg21 = RegInit(0.U(32.W))
   val Reg22 = RegInit(0.U(32.W))
   val Reg23 = RegInit(0.U(32.W))
   val Reg24 = RegInit(0.U(32.W))
   val Reg25 = RegInit(0.U(32.W))
   val Reg26 = RegInit(0.U(32.W))
   val Reg27 = RegInit(0.U(32.W))
   val Reg28 = RegInit(0.U(32.W))
   val Reg29 = RegInit(0.U(32.W))
   val Reg30 = RegInit(0.U(32.W))
   val Reg31 = RegInit(0.U(32.W))
   
   
   when(io.writeEn){
      when(io.regInSelector === 1.U){
	Reg1 := io.regIn
      }
      when(io.regInSelector === 2.U){
	Reg2 := io.regIn
      }
      when(io.regInSelector === 3.U){
	Reg3 := io.regIn
      }
      when(io.regInSelector === 4.U){
	Reg4 := io.regIn
      }
      when(io.regInSelector === 5.U){
	Reg5 := io.regIn
      }
      when(io.regInSelector === 6.U){
	Reg6 := io.regIn
      }
      when(io.regInSelector === 7.U){
	Reg7 := io.regIn
      }
      when(io.regInSelector === 8.U){
	Reg8 := io.regIn
      }
      when(io.regInSelector === 9.U){
	Reg9 := io.regIn
      }
      when(io.regInSelector === 10.U){
	Reg10 := io.regIn
      }
      when(io.regInSelector === 11.U){
	Reg11 := io.regIn
      }
      when(io.regInSelector === 12.U){
	Reg12 := io.regIn
      }
      when(io.regInSelector === 13.U){
	Reg13 := io.regIn
      }
      when(io.regInSelector === 14.U){
	Reg14 := io.regIn
      }
      when(io.regInSelector === 15.U){
	Reg15 := io.regIn
      }
      when(io.regInSelector === 16.U){
	Reg16 := io.regIn
      }
      when(io.regInSelector === 17.U){
	Reg17 := io.regIn
      }
      when(io.regInSelector === 18.U){
	Reg18 := io.regIn
      }
      when(io.regInSelector === 19.U){
	Reg19 := io.regIn
      }
      when(io.regInSelector === 20.U){
	Reg20 := io.regIn
      }
      when(io.regInSelector === 21.U){
	Reg21 := io.regIn
      }
      when(io.regInSelector === 22.U){
	Reg22 := io.regIn
      }
      when(io.regInSelector === 23.U){
	Reg23 := io.regIn
      }
      when(io.regInSelector === 24.U){
	Reg24 := io.regIn
      }
      when(io.regInSelector === 25.U){
	Reg25 := io.regIn
      }
      when(io.regInSelector === 26.U){
	Reg26 := io.regIn
      }
      when(io.regInSelector === 27.U){
	Reg27 := io.regIn
      }
      when(io.regInSelector === 28.U){
	Reg28 := io.regIn
      }
      when(io.regInSelector === 29.U){
	Reg29 := io.regIn
      }
      when(io.regInSelector === 30.U){
	Reg30 := io.regIn
      }
      when(io.regInSelector === 31.U){
	Reg31 := io.regIn
      }
   }

   
   io.regOut1 := Reg0   

   when(io.reg1Selector === 0.U){
      io.regOut1 := Reg0
   }.elsewhen(io.reg1Selector === 1.U){
      io.regOut1 := Reg1
   }.elsewhen(io.reg1Selector === 2.U){
      io.regOut1 := Reg2
   }
   .elsewhen(io.reg1Selector === 3.U){
      io.regOut1 := Reg3
   }
   .elsewhen(io.reg1Selector === 4.U){
      io.regOut1 := Reg4
   }
   .elsewhen(io.reg1Selector === 5.U){
      io.regOut1 := Reg5
   }   
   .elsewhen(io.reg1Selector === 6.U){
      io.regOut1 := Reg6
   }
   .elsewhen(io.reg1Selector === 7.U){
      io.regOut1 := Reg7
   }
   .elsewhen(io.reg1Selector === 8.U){
      io.regOut1 := Reg8
   }
   .elsewhen(io.reg1Selector === 9.U){
      io.regOut1 := Reg9
   }
   .elsewhen(io.reg1Selector === 10.U){
      io.regOut1 := Reg10
   }
   .elsewhen(io.reg1Selector === 11.U){
      io.regOut1 := Reg11
   }
   .elsewhen(io.reg1Selector === 12.U){
      io.regOut1 := Reg12
   }
   .elsewhen(io.reg1Selector === 13.U){
      io.regOut1 := Reg13
   }
   .elsewhen(io.reg1Selector === 14.U){
      io.regOut1 := Reg14
   }
   .elsewhen(io.reg1Selector === 15.U){
      io.regOut1 := Reg15
   }
   .elsewhen(io.reg1Selector === 16.U){
      io.regOut1 := Reg16
   }
   .elsewhen(io.reg1Selector === 17.U){
      io.regOut1 := Reg17
   }
   .elsewhen(io.reg1Selector === 18.U){
      io.regOut1 := Reg18
   }
   .elsewhen(io.reg1Selector === 19.U){
      io.regOut1 := Reg19
   }
   .elsewhen(io.reg1Selector === 20.U){
      io.regOut1 := Reg20
   }
   .elsewhen(io.reg1Selector === 21.U){
      io.regOut1 := Reg21
   }
   .elsewhen(io.reg1Selector === 22.U){
      io.regOut1 := Reg22
   }
   .elsewhen(io.reg1Selector === 23.U){
      io.regOut1 := Reg23
   }
   .elsewhen(io.reg1Selector === 24.U){
      io.regOut1 := Reg24
   }
   .elsewhen(io.reg1Selector === 25.U){
      io.regOut1 := Reg25
   }
   .elsewhen(io.reg1Selector === 26.U){
      io.regOut1 := Reg26
   }
   .elsewhen(io.reg1Selector === 27.U){
      io.regOut1 := Reg27
   }
   .elsewhen(io.reg1Selector === 28.U){
      io.regOut1 := Reg28
   }
   .elsewhen(io.reg1Selector === 29.U){
      io.regOut1 := Reg29
   }
   .elsewhen(io.reg1Selector === 30.U){
      io.regOut1 := Reg30
   }
   .elsewhen(io.reg1Selector === 31.U){
      io.regOut1 := Reg31
   }

   io.regOut2 := Reg0

   when(io.reg2Selector === 0.U){
	io.regOut2 := Reg0      
   }
   .elsewhen(io.reg2Selector === 1.U){
      io.regOut2 := Reg1
   }
   .elsewhen(io.reg2Selector === 2.U){
      io.regOut2 := Reg2
   }
   .elsewhen(io.reg2Selector === 3.U){
      io.regOut2 := Reg3
   }
   .elsewhen(io.reg2Selector === 4.U){
      io.regOut2 := Reg4
   }
   .elsewhen(io.reg2Selector === 5.U){
      io.regOut2 := Reg5
   }   
   .elsewhen(io.reg2Selector === 6.U){
      io.regOut2 := Reg6
   }
   .elsewhen(io.reg2Selector === 7.U){
      io.regOut2 := Reg7
   }
   .elsewhen(io.reg2Selector === 8.U){
      io.regOut2 := Reg8
   }
   .elsewhen(io.reg2Selector === 9.U){
      io.regOut2 := Reg9
   }
   .elsewhen(io.reg2Selector === 10.U){
      io.regOut2 := Reg10
   }
   .elsewhen(io.reg2Selector === 11.U){
      io.regOut2 := Reg11
   }
   .elsewhen(io.reg2Selector === 12.U){
      io.regOut2 := Reg12
   }
   .elsewhen(io.reg2Selector === 13.U){
      io.regOut2 := Reg13
   }
   .elsewhen(io.reg2Selector === 14.U){
      io.regOut2 := Reg14
   }
   .elsewhen(io.reg2Selector === 15.U){
      io.regOut2 := Reg15
   }
   .elsewhen(io.reg2Selector === 16.U){
      io.regOut2 := Reg16
   }
   .elsewhen(io.reg2Selector === 17.U){
      io.regOut2 := Reg17
   }
   .elsewhen(io.reg2Selector === 18.U){
      io.regOut2 := Reg18
   }
   .elsewhen(io.reg2Selector === 19.U){
      io.regOut2 := Reg19
   }
   .elsewhen(io.reg2Selector === 20.U){
      io.regOut2 := Reg20
   }
   .elsewhen(io.reg2Selector === 21.U){
      io.regOut2 := Reg21
   }
   .elsewhen(io.reg2Selector === 22.U){
      io.regOut2 := Reg22
   }
   .elsewhen(io.reg2Selector === 23.U){
      io.regOut2 := Reg23
   }
   .elsewhen(io.reg2Selector === 24.U){
      io.regOut2 := Reg24
   }
   .elsewhen(io.reg2Selector === 25.U){
      io.regOut2 := Reg25
   }
   .elsewhen(io.reg2Selector === 26.U){
      io.regOut2 := Reg26
   }
   .elsewhen(io.reg2Selector === 27.U){
      io.regOut2 := Reg27
   }
   .elsewhen(io.reg2Selector === 28.U){
      io.regOut2 := Reg28
   }
   .elsewhen(io.reg2Selector === 29.U){
      io.regOut2 := Reg29
   }
   .elsewhen(io.reg2Selector === 30.U){
      io.regOut2 := Reg30
   }
   .elsewhen(io.reg2Selector === 31.U){
      io.regOut2 := Reg31
   }

}
