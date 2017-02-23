// Listing 1.4
module eq3
   (
    input  wire[5:0] a, b,
    output wire aeqb
   );

   // internal signal declaration
   wire p0, p1, p2 ,p3, p4, p5, p6 ,p7, p8, p9;

   // body
   // instantiate two 1-bit comparators
   gt_2 eq_bit0_unit (.a(a[5:4]), .b(b[5:4]), .agtb(p0));
   gt_2 eq_bit1_unit (.a(a[3:2]), .b(b[3:2]), .agtb(p1));
	gt_2 eq_bit2_unit (.a(a[1:0]), .b(b[1:0]), .agtb(p2));
	
	eq_2 eq_bit3_unit (.a(a[5:4]), .b(b[5:4]), .aeqb(p3));
	eq_2 eq_bit4_unit (.a(a[3:2]), .b(b[3:2]), .aeqb(p4));
	eq_2 eq_bit5_unit (.a(a[1:0]), .b(b[1:0]), .aeqb(p5));
	
   // a and b are equal if individual bits are equal
   
	assign p6 = p3 & p4 & p5;
	assign p7 = p2 & p3 & p4;
	assign p8 = p1 & p3;
	assign p9 = p0 | p6 | p7 | p8;
   
   assign aeqb = p9;

endmodule