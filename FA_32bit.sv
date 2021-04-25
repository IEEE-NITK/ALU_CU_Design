//design
module FA_32bit (input [31:0] A, B, input Cin, output reg [31:0] Sum, output reg Cout);
  reg [32:0] t;
  
  always @ (A or B or Cin)
    begin
      t = A + B + Cin;
      Cout = t[32];
      Sum = t[31:0];
    end
endmodule

//testbench
module FA_32bit_test;
  reg [31:0] A, B;
  reg Cin;
  wire [31:0] Sum;
  wire Cout;
  integer i, j, k;
  
  FA_32bit FA(A, B, Cin, Sum[31:0], Cout);
  
  initial
    begin
      $monitor("    A         B    Cin |     Sum   Cout");
      #5 A = 32'hff000f0f; B = 32'h00fff0f0; Cin = 0;	//2 positive w/out carry
      $monitor("%h  %h  %d  |  %h  %d", A, B, Cin, Sum[31:0], Cout);
      #5 A = 32'h35355353; B = 32'hcacaacac; Cin = 1;	//2 positive w/ carry
      $monitor("%h  %h  %d  |  %h  %d", A, B, Cin, Sum[31:0], Cout);
      #5 A = 32'h00000003; B = -32'hfffffffe; Cin = 0;	//1 positive 1 negative w/out carry
      $monitor("%h  %h  %d  |  %h  %d", A, B, Cin, Sum[31:0], Cout);
      #5 A = 32'h00000002; B = -32'h00000001; Cin = 1;	//1 positive 1 negative w/ carry
      $monitor("%h  %h  %d  |  %h  %d", A, B, Cin, Sum[31:0], Cout);
      #5 A = -32'h00000003; B = -32'hfffffffe; Cin = 0;	//2 negative w/out carry 
      $monitor("%h  %h  %d  |  %h  %d", A, B, Cin, Sum[31:0], Cout);
      #5 A = -32'h00000003; B = -32'hfffffffe; Cin = 1;	//2 negative w/ carry
      $monitor("%h  %h  %d  |  %h  %d", A, B, Cin, Sum[31:0], Cout);
    end
endmodule
