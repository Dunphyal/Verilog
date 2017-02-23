// Listing 1.7
// The `timescale directive specifies that
// the simulation time unit is 1 ns  and
// the simulation timestep is 10 ps
`timescale 1 ns/10 ps

module gt_eq_2_testbench;
   // signal declaration
   reg  [5:0] test_in0, test_in1;
   wire  test_out;

   // instantiate the circuit under test
   eq3 uut
      (.a(test_in0), .b(test_in1), .aeqb(test_out));

   //  test vector generator
   initial
   begin
      // test vector 1
      test_in0 = 6'b111111;
      test_in1 = 6'b100000;
      # 200;
      // test vector 2
      test_in0 = 6'b101010;
      test_in1 = 6'b010101;
      # 200;
      // test vector 3
      test_in0 = 6'b000111;
      test_in1 = 6'b111000;
      # 200;
      // test vector 4
      test_in0 = 6'b111110;
      test_in1 = 6'b011110;
      # 200;
      // test vector 5
      test_in0 = 6'b100001;
      test_in1 = 6'b001000;
      # 200;
      // test vector 6
      test_in0 = 6'b111111;
      test_in1 = 6'b111111;
      # 200;
      // test vector 7
      test_in0 = 6'b000000;
      test_in1 = 6'b000000;
      # 200;
      // stop simulation
      $stop;
   end
   
	initial
	begin
		$monitor($stime,, test_in0,, test_in1,,, test_out); 
	end

endmodule

