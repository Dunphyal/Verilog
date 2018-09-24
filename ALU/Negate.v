`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module Negate(
	 input wire [5:0] A_Negate, B_Negate, 
	 input [3:0] sel,
	 output [5:0] X_Negate
    );
	 reg [5:0] temp; // temp value used to store the value before assigning to the output wire X_Negate
	 
	 // 4 selection values are used as this module is instantiated by the minus conversion module aswell 
	 always @*
	if (sel == 4'b1001 || sel == 4'b0100)     
		temp = ~A_Negate; // negate operator

	else if (sel == 4'b1010 || sel == 4'b0101)
		temp = ~B_Negate; // negate operator
		
assign X_Negate = temp;		
		
endmodule
