// Listing 1.4
module gt_2
   (
    input  wire[1:0] a, b,
    output wire agtb
   );

   // internal signal declaration
   wire p0, p1, p2;

   // body
   // instantiate two 1-bit comparators
   //eq1 eq_bit0_unit (.i0(a[0]), .i1(b[0]), .eq(e0));
   //eq1 eq_bit1_unit (.eq(e1), .i0(a[1]), .i1(b[1]));
	assign p0 = a[0] & ~b[1] & ~b[0];
	assign p1 = a[1] & ~b[1];
	assign p2 = a[1] & a[0] & ~b[0];
	


   // a and b are equal if individual bits are equal
   assign agtb = p0 | p1 | p2;
   
   

endmodule