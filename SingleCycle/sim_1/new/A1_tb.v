`timescale 1ns / 1ps

module A1_tb();
reg CLK,RST;
  wire [1:0]  RFWE,DMWE,Branch,MtoRFSel,RFDSel,ALUInSel,ALUOp;
    /*output wire [4:0] RFRA1,RFRA2,rt,rd; */
     wire [3:0] ALUSel;
     wire [31:0] Zero, PCin,IMRD,ALUOut,DMRD,RFRD1,RFRD2,R0,extended,ALUIn2,RFWD_reg;
     wire [4:0] RFWA;
    

top_module t1(ALUInSel,Zero,
                  ALUOp,
                  CLK,DMWE,DMRD,
                  PCin,IMRD,
                  RFRD2,
                  RFWA,RFDSel,
                  MtoRFSel,RST,
                  RFRD1,
                  Branch,RFWE,ALUOut,ALUSel,R0,shamt,extended,ALUIn2,RFWD_reg);
initial begin
CLK = 1'b0; 
#10;
 RST = 1'b1;
 #10;
RST =1'b0;
#10;
end
always #10 CLK = ~CLK;
endmodule
