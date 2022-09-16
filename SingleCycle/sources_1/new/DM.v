`timescale 1ns / 1ps
/*
DM DUT(.CLK(CLK), .DMWE(DMWE), .DMA(DMA), .DMRD(DMRD), .DMWD(DMWD));
*/

module DM(CLK,DMWE,DMA,DMRD,DMWD);
input CLK;
input [1:0] DMWE;
input [8:0] DMA;
input [31:0] DMWD;
output reg [31:0] DMRD;
reg[31:0] DM[0:511];
initial begin
    DM[0] = 17;
    DM[1] = 31;
    DM[2] = -5;
    DM[3] = -2;
    DM[4] = 250;
end
always @(posedge CLK)
begin
if(DMWE) DM[DMA] <= DMWD;
end

always  @(*)
begin
DMRD <= DM[DMA];
end
endmodule
