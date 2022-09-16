
module Mux1(RFRD2, ALUInSel, extended,ALUIn2);
/*
Mux1 M1(.RFRD2(RFRD2),.ALUInSel(ALUInSel),.extended(extended),.B(B));
*/
input [1:0] ALUInSel;
input [31:0] RFRD2, extended;
output reg [31:0] ALUIn2;
always @(ALUInSel,RFRD2,extended)
begin
 case(ALUInSel)
 0: ALUIn2 <= RFRD2;
 1: ALUIn2 <= extended;
 endcase
end
endmodule