//design
module mux2to1 (input [1:0] In, input Sel, output F);
  assign F = In[Sel];
endmodule


//testbench
module mux2to1_test;
  reg [1:0] In;
  reg Sel;
  wire F;
  integer i; 
  
  mux2to1 M(In, Sel, F);
  
  initial
    begin
      $dumpfile("dump.vcd"); $dumpvars;
      $monitor("Sel In[1] In[0]		F");
      for (i = 0; i < 8; i = i + 1)
      	begin
          #5 {Sel, In[1], In[0]} = i;
          $monitor(" %d    %d     %d      |	%d", Sel, In[1], In[0], F);
      	end
  	end
endmodule
