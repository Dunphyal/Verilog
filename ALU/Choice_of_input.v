`timescale 1ns / 1ps


module Choice_of_input(
	 input wire [5:0] A_Choice, B_Choice, 
	 input [3:0] sel,
	 output [5:0] X_Choice
    );

	reg [5:0] temp_storage; //  temp value created to store the chosen output
	 
	// If the sel value is 0001 output the value of the input A
	// If the sel value is 0010 output the value of the input B
 
	always @*
	if (sel == 4'b0001)
	begin
		temp_storage = A_Choice;
	end
	
	else if (sel == 4'b0010)
	begin
		temp_storage = B_Choice;
	end	
		
assign X_Choice = temp_storage;	// assigning the value of the temp reg to the module output, X_Choice

endmodule
