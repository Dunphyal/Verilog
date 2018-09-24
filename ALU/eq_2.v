// Listing 1.4
module gt_2
   (
    input  wire[1:0] a, b,
    output wire agtb
   );

   // internal signal declaration
   wire p0, p1, p2;

   // body
   
	assign p0 = a[0] & ~b[1] & ~b[0]; // a is greater than b if the LSB anded with the negated bits of b equal 1
	assign p1 = a[1] & ~b[1];         // a is greater than b if the MSB of a anded with the negated MSB of b equals 1
	assign p2 = a[1] & a[0] & ~b[0];  // a is greater than b if the two bits of a anded with the negated LSB of b equals 1
	
   // a is greater than b if any of the above wries equal 1
   assign agtb = p0 | p1 | p2;          
   
endmodule