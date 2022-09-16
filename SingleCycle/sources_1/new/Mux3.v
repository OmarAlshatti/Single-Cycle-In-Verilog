module Mux3(DMRD, ALUOut, MtoRFSel,RFWD_reg);
/*
Mux3 M3(.DMRD(DMRD),.C(C),.MtoRFSel(MtoRFSel),.RFWD(RFWD));
*/
input [1:0] MtoRFSel;
input [31:0] DMRD, ALUOut;
output reg [31:0] RFWD_reg;
always @(*)
begin
 case(MtoRFSel)
 0:  RFWD_reg = ALUOut;
 1: RFWD_reg = DMRD;
 endcase
end
endmodule