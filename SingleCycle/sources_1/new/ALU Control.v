`timescale 1ns / 1ps
/*
ALUCtrl DUT(.ALUInsel(ALUInsel), .ALUOp(ALUOp), .Funct(Funct));
*/

module ALUCtrl(ALUSel,ALUOp,Funct);
input [5:0] Funct;
input [1:0] ALUOp;
output reg [3:0] ALUSel;
parameter add =0, sub=1,sll =2,slv=3,srav=4; 
always @(ALUSel,ALUOp,Funct)
begin
if(ALUOp==0) ALUSel <=0;
else if(ALUOp==1) ALUSel <=1;
else
case(Funct)
add: ALUSel = 0;
sub: ALUSel = 1;
sll: ALUSel = 2;
slv: ALUSel = 3;
srav: ALUSel = 4;
endcase 
end
endmodule 