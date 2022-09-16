`timescale 1ns / 1ps
/*
RF DUT(.RFRA1(RFRA1), .RFRA2(RFRA2), .CLK(CLK), .RFWA(RFWA), .RFWD(RFWD),.RFRD1(RFRD1),.RFRD2(RFRD2));
*/

module RF(RFRA1, RFRA2,RFWE,CLK,RFWA,RFWD,RFRD1,RFRD2,RST,IMRD,R0);
input [1:0] RFWE,CLK,RST;
input [31:0] RFWD,IMRD;
output [31:0] RFRD1,RFRD2;
output [31:0] R0;
integer i;
reg [31:0] RF [0:31];
input [4:0]  RFRA1, RFRA2,RFWA;        // Input Addresses
assign RFRD1 = RF[RFRA1] ;assign RFRD2 = RF[RFRA2] ;
 initial begin
     RF[0]<=0;
     RF[1]<=1;
     RF[2]<=2;
     RF[3]<=3;
     RF[4]<=4;
     RF[5]<=17;
     RF[6]<=31;
     RF[7]<= -5;
     RF[8]<= -2;
     RF[9]<=250;
     RF[10]<=267;
     RF[11]<=17;
     RF[12]<=12;
     RF[13]<=192;
     RF[14]<=0;
     RF[15]<=0;
     RF[16]<=0;
     RF[17]<=0;
     RF[18]<=0;
     RF[19]<=0;
     RF[20]<=0;
     RF[21]<=0;
     RF[22]<=0;
     RF[23]<=0;
     RF[24]<=0;
     RF[25]<=0;
     RF[26]<=0;
     RF[27]<=0;
     RF[28]<=0;
     RF[29]<=0;
     RF[30]<=0;
     RF[31]<=0;
 end
always @(posedge CLK) begin
		if (RFWE == 1)
			RF[RFWA] <= RFWD;
	end	
assign R0 =RF[RFWA];

endmodule
