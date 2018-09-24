`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:38 02/09/2017 
// Design Name: 
// Module Name:    s6bit_ripple_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module 6bit_ripple_adder(x, y, c_in, overflow, c_out, sum);

input wire [5:0] x, y
input wire c_in
output wire c_out, overflow
output wire [5:0] sum

Fulladder adder_bit0(.x(x[0], .y(y[0], .cin(c_in), .cout(c_out), .s(sum));
Fulladder adder_bit1(.x(x[1], .y(y[1], .cin(c_in), .cout(c_out), .s(sum));
Fulladder adder_bit2(.x(x[2], .y(y[2], .cin(c_in), .cout(c_out), .s(sum));
Fulladder adder_bit3(.x(x[3], .y(y[3], .cin(c_in), .cout(c_out), .s(sum));
Fulladder adder_bit4(.x(x[4], .y(y[4], .cin(c_in), .cout(c_out), .s(sum));
Fulladder adder_bit5(.x(x[5], .y(y[5], .cin(c_in), .cout(c_out), .s(sum));

endmodule
