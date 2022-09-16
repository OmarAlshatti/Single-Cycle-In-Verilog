`timescale 1ns / 1ps

/*
DM DUT(.CLK(CLK), .RST(RST), .DMA(DMA), .PCin(PCin), .PCout(PCout));
*/

module PC(CLK,RST,PCin);
input CLK,RST;
output reg[31:0] PCin;
always @(posedge  CLK)
begin
if(RST) PCin <=0;
else
PCin <= PCin+1'b1;
end
endmodule
