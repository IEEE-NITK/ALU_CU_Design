//design
module decoder2to1 (input In, output [1:0] F);
  	assign F[0] = ~In;
  	assign F[1] = In;
endmodule


//testbench
module decoder2to1_test;
  reg In;
  wire [1:0] F;
  integer i; 
  
  decoder2to1 M(In, F);
  
  initial
    begin
      $dumpfile("dump.vcd"); $dumpvars; 
      $monitor("In	F[1] 	F[0]");
      for (i = 0; i < 2; i = i + 1)
      	begin
          #5 In = i;
          $monitor(" %d    |	 %d       %d", In, F[1], F[0]);
      	end
  	end
endmodule
