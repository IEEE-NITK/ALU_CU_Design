//design
module FS_32bit (input [31:0] A, B, input Bin, 
                 output reg [31:0] Diff, output reg Bout, Z, N);
  reg [32:0] t;
  
  always @ (A or B or Bin)
    begin
      t = A - B - Bin;
      Diff = t[31:0];
      if (B > A || Bin > (A - B))
      	Bout = 1'b1;
      else
        Bout = 1'b0;
      if (Diff == 32'h00000000)
        begin
          Z = 1;
          N = 0;
        end
      else
        begin
          Z = 0;
          if (Diff[31] == 1'b0)
            N = 0;
          else
            N = 1;
        end
    end
endmodule


//testbench
module FA_32bit_test;
  reg [31:0] A, B;
  reg Bin;
  wire [31:0] Diff;
  wire Bout, Z, N;
  
  FS_32bit FA(A, B, Bin, Diff[31:0], Bout, Z, N);
  
  initial
    begin
      $monitor("    A         B    Bin |    Diff   Bout  Z  N");
      #5 A = 32'h00000002; B = 32'h00000001; Bin = 0;	//2 positive w/out Borrow
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Bin, Diff[31:0], Bout, Z, N);
      #5 A = 32'h00000002; B = 32'h00000003; Bin = 1;	//2 positive w/ Borrow
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Bin, Diff[31:0], Bout, Z, N);
      #5 A = 32'h00000003; B = -32'hfffffffd; Bin = 0;	//1 positive 1 negative w/out carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Bin, Diff[31:0], Bout, Z, N);
      #5 A = 32'h00000002; B = -32'h00000001; Bin = 1;	//1 positive 1 negative w/ carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Bin, Diff[31:0], Bout, Z, N);
      #5 A = -32'h00000003; B = -32'hfffffffe; Bin = 0;	//2 negative w/out carry 
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Bin, Diff[31:0], Bout, Z, N);
      #5 A = -32'h00000003; B = -32'hfffffffe; Bin = 1;	//2 negative w/ carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Bin, Diff[31:0], Bout, Z, N);
      #5 A = 32'h00000002; B = 32'h00000002; Bin = 1;	//negative sum
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Bin, Diff[31:0], Bout, Z, N);
      #5 A = 32'h00000000; B = 32'h00000000; Bin = 0;	//zero sum
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Bin, Diff[31:0], Bout, Z, N);
    end
endmodule
