`timescale 1ns / 1ps

module top_module(ALUInSel,Zero,
                  ALUOp,
                  CLK,DMWE,DMRD,
                  PCin,IMRD,
                  RFRD2,
                  RFWA,RFDSel,
                  MtoRFSel,RST,
                  RFRD1,
                  Branch,RFWE,ALUOut,ALUSel,R0,shamt,extended,ALUIn2,RFWD_reg);
    input CLK,RST;
    output wire [1:0]  RFWE,DMWE,Branch,MtoRFSel,RFDSel,ALUOp;
    output wire [4:0] shamt;
    /*output wire [4:0] RFRA1,RFRA2,rt,rd; */
    output wire [1:0] ALUInSel;
    output wire [3:0] ALUSel;
    output wire [31:0] Zero, PCin,IMRD,ALUOut,DMRD,RFRD1,RFRD2,R0,extended,ALUIn2,RFWD_reg;
    output wire [4:0] RFWA;
    ALU ALU0(.RFRD1(RFRD1), .ALUIn2(ALUIn2), .ALUSel(ALUSel), .Zero(Zero),.ALUOut(ALUOut),.shamt(IMRD[10:6]));
    
    ALUCtrl ALUC0(.ALUSel(ALUSel), .ALUOp(ALUOp), .Funct(IMRD[5:0]));
    
    DM DM0(.CLK(CLK), .DMWE(DMWE), .DMA(ALUOut[8:0]), .DMRD(DMRD), .DMWD(RFRD2));

    IM IM0(.PC(PCin), .IMRD(IMRD),.CLK(CLK));
    
    Mux1 M1(.RFRD2(RFRD2),.ALUInSel(ALUInSel),.extended(extended),.ALUIn2(ALUIn2));
    
    Mux2 M2(.RFWA(RFWA),.RFDSel(RFDSel),.rt(IMRD[20:16]),.rd(IMRD[15:11]));
    
    Mux3 M3(.DMRD(DMRD),.ALUOut(ALUOut),.MtoRFSel(MtoRFSel),.RFWD_reg(RFWD_reg));

    mux4 M4(ALUSel_reg);

    PC PC0(.CLK(CLK), .RST(RST), .PCin(PCin));
    RF RF0(.RFRA1(IMRD[25:21]), .RFRA2(IMRD[20:16]), .CLK(CLK), .RFWA(RFWA), .RFWD(RFWD_reg),.RFRD1(RFRD1),.RFRD2(RFRD2),.IMRD(IMRD),.R0(R0));
    Simm Simm0(.unextended(IMRD[15:0]), .extended(extended));
    control_unit CU0(.Opcode(IMRD[31:26]), .RFWE(RFWE), .RFDSel(RFDSel), .ALUInSel(ALUInSel), .Branch(Branch),. DMWE(DMWE),. MtoRFSel(MtoRFSel),.ALUOp(ALUOp));

endmodule
