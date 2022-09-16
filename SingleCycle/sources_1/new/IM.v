`timescale 1ns / 1ps
/*
IM DUT(.PC(PC), .IMRD(IMRD));
*/

module IM(PC, IMRD,CLK); 
    input CLK;
    input    [31:0]  PC;        // Input Address 

    output  [31:0]  IMRD;    // Instruction at memory location Address
    
    reg [31:0] memory[0:31];

	initial
	begin
		$readmemh("New Text Document.mem",memory); //reads data to mem register
	end

	 assign IMRD = memory[PC];	

endmodule