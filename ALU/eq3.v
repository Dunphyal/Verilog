// Listing 1.4
module Greater_Than_or_Equal
   (
    input  wire[5:0] a, b,
    output wire aeqb
   );

   // internal signal declaration
   wire p0, p1, p2 ,p3, p4, p5, p6 ,p7, p8, p9, minus_check;
	reg p10;
   // body
   // instantiate two 1-bit comparators
   gt_2 eq_bit0_unit (.a(a[5:4]), .b(b[5:4]), .agtb(p0)); //compare the two most significant bits of each input, outputting agtb (a greater than b)
   gt_2 eq_bit1_unit (.a(a[3:2]), .b(b[3:2]), .agtb(p1)); //compare the two middle bits of each input, outputting agtb (a greater than b)
	gt_2 eq_bit2_unit (.a(a[1:0]), .b(b[1:0]), .agtb(p2)); //compare the two least significant bits of each input, outputting agtb (a greater than b)
	
	eq_2 eq_bit3_unit (.a(a[5:4]), .b(b[5:4]), .aeqb(p3)); //compare the two most significant bits of each input, outputting agtb (a equal to b)
	eq_2 eq_bit4_unit (.a(a[3:2]), .b(b[3:2]), .aeqb(p4)); //compare the two middle bits of each input, outputting agtb (a equal to b)
	eq_2 eq_bit5_unit (.a(a[1:0]), .b(b[1:0]), .aeqb(p5)); //compare the two least significant bits of each input, outputting agtb (a equal to b)
	
	
   // a and b are equal if individual bits are equal
   
	assign p6 = p3 & p4 & p5; // all three sets of 2 bits are equal
	assign p7 = p2 & p3 & p4; // the two least significant bits of a are greater and the remaining bits are equal
	assign p8 = p1 & p3;      // the two middle bits of a are greater than b and the two most signifcant bits are equal
	assign p9 = p0 | p6 | p7 | p8; // if any of the three previous cases or the two most significant bits of a are greater than b
   assign minus_check = a[5]^b[5]; // if the MSB's are different minus_check = 1
	
	always@*
	case(minus_check)
	1'b1: p10 = ~p9;  // if minus_check equals 1 invert p9
	1'b0: p10 = p9;
	endcase
	
   assign aeqb = p10;

endmodule