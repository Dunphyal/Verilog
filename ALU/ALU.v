`timescale 1ns / 1ps

module ALU(
	 input wire [3:0] sel,
	 input wire [5:0] A, B,
	 output wire [5:0] X
    );
	
	// wires for each module output to be assigned to within the case and then assigned to the output wire X
	wire [5:0] output_set;
	wire [5:0] output_choice;
	wire output_comparison;
	wire [5:0] output_minus;
	wire [5:0] output_shift;
	wire [5:0] output_XOR;
	wire [5:0] output_negated;
	wire [5:0] output_sub;
	wire [5:0] output_adder;
	reg [5:0] result;
	
// instantiate the modules which complete the 14 operations that can be chosen using sel
Set_Value case1_14(.A_Set(A), .B_Set(B), .sel(sel), .X_Set(output_set));
Choice_of_input case2_3(.A_Choice(A), .B_Choice(B), .sel(sel), .X_Choice(output_choice));
Greater_Than_or_Equal case4(.a(A), .b(B),.aeqb(output_comparison));
Minus_Conversion case5_6(.A_conversion(A), .B_conversion(B), .sel(sel), .X_Minus(output_minus));
Barrel_shifter case7_8(.A_shift(A), .B_shift(B), .sel(sel), .finish(output_shift));
XOR case9(.A_XOR(A), .B_XOR(B),.X_XOR(output_XOR));
Negate case10_11(.A_Negate(A), .B_Negate(B), .sel(sel), .X_Negate(output_negated));
Subtraction case12(.A_sub(A), .B_sub(B), .X_sub(output_sub));
carry_ripple_adder case13(.x(A), .y(B), .sum(output_adder));

	always @*
	case (sel)
	4'b0000: result = output_set;         // output 6'b000000
	4'b0001: result = output_choice;      // output A
	4'b0010: result = output_choice;  	  // output B
	4'b0011: result = output_comparison;  // output 000001 if A is greater than B
	4'b0100: result = output_minus;       // output -A
	4'b0101: result = output_minus;       // output -B
	4'b0110: result = output_shift;       // output A rotated 3 bits to the right
	4'b0111: result = output_shift;       // output B rotated 3 bits to the right
	4'b1000: result = output_XOR;         // output A^B (Exlusive OR)
	4'b1001: result = output_negated;     // output A'
	4'b1010: result = output_negated;     // output B'
	4'b1011: result = output_sub;         // output A-B
	4'b1100:	result = output_adder;       // output A+B
	4'b1111: result = output_set;         // output 6'b111111
	endcase
		
assign X = result;
endmodule
