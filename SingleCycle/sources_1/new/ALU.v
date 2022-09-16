module ALU (ALUSel, RFRD1, ALUIn2, ALUOut, Zero,shamt);

	input [3:0] ALUSel;
	input [31:0] RFRD1,ALUIn2;
	input [4:0] shamt;
	output reg [31:0] ALUOut;
	output Zero;
	assign Zero = (ALUOut == 0);
	
	always @(*)
	 begin
		case (ALUSel)
			4'b0000: ALUOut = RFRD1 + ALUIn2;
			4'b0001: ALUOut = RFRD1 - ALUIn2;
			4'b0010: ALUOut = RFRD1 << shamt;
			4'b0011: ALUOut = RFRD1 << ALUIn2;
			4'b0100: ALUOut = RFRD1 >>>ALUIn2;
			default: ALUOut <= 0;
		endcase
	end
endmodule
        