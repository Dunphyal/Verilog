`timescale 1ns / 1ps

module carry_ripple_adder(

input wire [5:0] x, y,
output wire [5:0] sum
);

wire [4:0] c_tb; // internal wire which will be updated on each instantation
wire c_in = 0;

// instantiation of fulladder for each set of bits
Fulladder adder_bit0(.a(x[0]), .b(y[0]), .cin(c_in), .cout(c_tb[0]), .s(sum[0]));   
 // reads in LSB of both inputs, takes in carry in and outputs c_tb[0] which will be used as the carry in for the next instantiation.
Fulladder adder_bit1(.a(x[1]), .b(y[1]), .cin(c_tb[0]), .cout(c_tb[1]), .s(sum[1])); // same operation using next bit
Fulladder adder_bit2(.a(x[2]), .b(y[2]), .cin(c_tb[1]), .cout(c_tb[2]), .s(sum[2]));
Fulladder adder_bit3(.a(x[3]), .b(y[3]), .cin(c_tb[2]), .cout(c_tb[3]), .s(sum[3]));
Fulladder adder_bit4(.a(x[4]), .b(y[4]), .cin(c_tb[3]), .cout(c_tb[4]), .s(sum[4]));
Fulladder adder_bit5(.a(x[5]), .b(y[5]), .cin(c_tb[4]), .cout(c_out), .s(sum[5]));   // same operatin using MSB and outputs c_out as carry out 

assign overflow = c_tb[4] ^ c_out; // overflow calculated by using XOR operation on carry in for MSB and carry out of MSB, used in a previous assignment
endmodule
