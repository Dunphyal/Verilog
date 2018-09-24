`timescale 1ns / 1ps

module XOR(
    input wire [5:0] A_XOR, B_XOR, 
	 output [5:0] X_XOR
    );

	assign X_XOR = A_XOR^B_XOR; // XOR operator

endmodule
