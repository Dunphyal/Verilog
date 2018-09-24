`timescale 1ns / 1ps

module Minus_Conversion(
    input wire [5:0] A_conversion, B_conversion, 
	 input [3:0] sel,
	 output [5:0] X_Minus
    );

	wire [5:0] add1 = 6'b000001; // used as the second input to the adder
	wire [5:0] output_negated; // output of the negate module

// The negate module is instantiated and the result is used as the input in the instantiation of the carry ripple adder. This is done 
// as in twos complement a number is changed to a minus by flipping the bits and adding one

carry_ripple_adder add(.x(output_negated), .y(add1), .sum(X_Minus)); //carry ripple adder instantiation
Negate case10_11(.A_Negate(A_conversion), .B_Negate(B_conversion), .sel(sel), .X_Negate(output_negated)); //negation instantiation

endmodule
