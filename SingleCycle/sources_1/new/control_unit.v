`timescale 1ns / 1ps
/*
DM DUT(.Opcode(Opcode), .RFWE(RFWE), .RFDSel(RFDSel), .ALUInSel(ALUInSel), .Branch(Branch),. DMWE(DMWE),. MtoRFsel(MtoRFsel),.ALUOp(ALUOp));
*/

module control_unit(Opcode,RFWE,RFDSel,ALUInSel,Branch,DMWE,MtoRFSel,ALUOp);

input [5:0] Opcode; 

output reg [1:0] RFWE,RFDSel,ALUInSel,Branch,DMWE,MtoRFSel;
output reg [2:0] ALUOp;
parameter Rtype = 0,Lw=1,Sw=2,branch=3; 
always @(Opcode)
begin

case(Opcode)
Rtype: begin RFWE<=1; RFDSel <=1; ALUInSel<=0; Branch <=0; DMWE<=0; MtoRFSel<=0; ALUOp<=3; end
Lw: begin RFWE<=1; RFDSel <=0; ALUInSel<=1; Branch <=0; DMWE<=0; MtoRFSel<=1; ALUOp<=0; end
Sw: begin RFWE<=0; RFDSel <=1'bX; ALUInSel<=1; Branch <=0; DMWE<=1; MtoRFSel<=1'bX; ALUOp<=0; end
Branch: begin RFWE<=0; RFDSel <=1'bX; ALUInSel<=0; Branch <=1; DMWE<=0; MtoRFSel<=1'bX; ALUOp<=1; end

endcase
end
   
endmodule 