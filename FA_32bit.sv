//design
module FA_32bit (input [31:0] A, B, input Cin, output reg [31:0] Sum, output reg Cout, Z, N);
  reg [32:0] t;
  
  always @ (A or B or Cin)
    begin
      t = A + B + Cin;
      Cout = t[32];
      Sum = t[31:0];
      if (Sum == 32'h00000000)
        begin
          Z = 1;
          N = 0;
        end
      else
        begin
          Z = 0;
          if (Sum[31] == 1'b0)
            N = 0;
          else
            N = 1;
        end
    end
endmodule

//testbench
module FA_32bit_test;
  reg [31:0] A, B;
  reg Cin;
  wire [31:0] Sum;
  wire Cout, Z, N;
  integer i, j, k;
  
  FA_32bit FA(A, B, Cin, Sum[31:0], Cout, Z, N);
  
  initial
    begin
      $monitor("    A         B    Cin |     Sum   Cout  Z  N");
      #5 A = 32'hff000f0f; B = 32'h00fff0f0; Cin = 0;	//2 positive w/out carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = 32'h35355353; B = 32'hcacaacac; Cin = 1;	//2 positive w/ carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = 32'h00000003; B = -32'hfffffffe; Cin = 0;	//1 positive 1 negative w/out carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = 32'h00000002; B = -32'h00000001; Cin = 1;	//1 positive 1 negative w/ carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = -32'h00000003; B = -32'hfffffffe; Cin = 0;	//2 negative w/out carry 
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = -32'h00000003; B = -32'hfffffffe; Cin = 1;	//2 negative w/ carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = 32'h00000001; B = -32'h00000003; Cin = 0;	//negative sum
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = 32'h00000000; B = 32'h00000000; Cin = 0;	//zero sum
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
    end
endmodule
