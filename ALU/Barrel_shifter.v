`timescale 1ns / 1ps

module Barrel_shifter(

input wire [5:0] A_shift, B_shift,
input [3:0] sel,
output wire [5:0] finish
);

	reg [5:0] temp; // temp reg used to store the output value before assigning to the output finish wire
	
	always @*
		if (sel == 4'b0110) // shift A
		begin
			temp = {A_shift[2:0], A_shift[5:3]}; // place bits zero to two in front of the bits five through to three                                 
		end                                     // shifting the input by 3 bits to the right
	
		else if (sel == 4'b0111) // shift B
		begin
			temp = {B_shift[2:0], B_shift[5:3]}; // place bits zero to two in front of the bits five through to three
		end	                                  // shifting the input by 3 bits to the right   

		assign finish = temp;
endmodule
