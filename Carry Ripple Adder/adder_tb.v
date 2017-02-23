`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:26:49 02/09/2017
// Design Name:   carry_ripple_adder
// Module Name:   C:/Users/dunphyal/Documents/3C7/Lab_D/adder_tb.v
// Project Name:  Lab_D
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: carry_ripple_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_tb;
	
	
	reg [5:0] x, y;
	reg c_in;
	// Outputs
	wire [5:0] sum;
	wire c_out, overflow;
	// Instantiate the Unit Under Test (UUT)
	carry_ripple_adder uut (.x(x), .y(y), .c_in(c_in), .sum(sum), .c_out(c_out), .overflow(overflow));

	initial begin
		// Initialize Inputs
		x = 6'b000000;
		y = 6'b000000;
		c_in = 1;
		#100;
		
		x = 6'b000000;
		y = 6'b000000;
		c_in = 0;
		#100;
		
		x = 6'b000010;
		y = 6'b000001;
		c_in = 1;
		#100;
		
		x = 6'b000010;
		y = 6'b000001;
		c_in = 0;
		#100;
		
		x = 6'b010000;
		y = 6'b010000;
		c_in = 1;
		#100;		// Wait 100 ns for global reset to finish
		
		x = 6'b010000;
		y = 6'b010000;
		c_in = 0;
		#100;
		
		x = 6'b110000;
		y = 6'b011000;
		c_in = 1;
		#100;
		
		x = 6'b110000;
		y = 6'b011000;
		c_in = 0;
		#100;
		
		
		
		
        
		// Add stimulus here

	end
      
		initial
	begin
		$monitor( x[5],,x[4],,x[3],,x[2],,x[1],,x[0],,,, y[5],,y[4],,y[3],,y[2],,y[1],,y[0],,,,c_in,,,,sum[5],,sum[4],,sum[3],,sum[2],,sum[1],,sum[0],,,,c_out,,,,overflow,,,,); 
	end
		
endmodule

