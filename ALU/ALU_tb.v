`timescale 1ns / 1ps

module ALU_tb;
	
	reg [5:0] A, B;
	reg [3:0] sel;
	// Outputs
	wire [5:0] X;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.sel(sel), .A(A), .B(B), .X(X)
	);

	initial begin
		
		A = 6'b000000;
		B = 6'b000000;
		sel = 4'b0011; // 6'b000000 (Set_Value)
		// Wait 100 ns for global reset to finish
		#100;

		A = 6'b000100;
		B = 6'b000010;
		sel = 4'b0011; // A (Choice_of_input)
		#100;
		
		A = 6'b000010;
		B = 6'b000100;
		sel = 4'b0011; // B (Choice_of_input)
		#100;

		A = 6'b110000;
		B = 6'b011000;
		sel = 4'b0011; // 6'b000000 (Set_Value)
		// Wait 100 ns for global reset to finish
		#100;

		A = 6'b011000;
		B = 6'b110000;
		sel = 4'b0011; // A (Choice_of_input)
		#100;
		
		A = 6'b111111;
		B = 6'b111111;
		sel = 4'b0011; // B (Choice_of_input)
		#100;


		$stop;						
	end      
endmodule

