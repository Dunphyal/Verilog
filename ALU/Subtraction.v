`timescale 1ns / 1ps

module Subtraction(
    input wire [5:0] A_sub, B_sub, 
	 output [5:0] X_sub
    );

	wire [5:0] output_minus; // wire which the output of Minus_Conversion will be assigned to
	reg [3:0] select_B = 4'b0101; // the sel value is set as an internal constant, Minus_Conversion requires a sel input	 

// The Minus_Conversion module is instantiated and the result is used as the input in the instantiation of the carry ripple adder. This is done 
// as a subtraction operation can be computed by inverting the second value and then performing an addition operation

Minus_Conversion minus(.A_conversion(A_sub), .B_conversion(B_sub), .sel(select_B), .X_Minus(output_minus)); // Minus_Conversion instantation
carry_ripple_adder add(.x(A_sub), .y(output_minus), .sum(X_sub)); // carry_ripple_adder instantation

endmodule
