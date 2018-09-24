`timescale 1ns / 1ps

module Set_Value(
	 input wire [5:0] A_Set, B_Set, 
	 input [3:0] sel,
	 output [5:0] X_Set
    );
	 
	 reg [5:0] temp_storage; //  temp reg used to store the chosen output
	 
	 
	 // If the sel value is 0000 output the value 000000
	 // If the sel value is 1111 output the value 111111
	 always @*
	if (sel == 4'b0000)
		temp_storage = 6'b000000;
		
	else if (sel == 4'b1111)
		temp_storage = 6'b111111;
		
assign X_Set = temp_storage;   // assigning the value of the temp reg to the module output, X_Set		
		
endmodule
