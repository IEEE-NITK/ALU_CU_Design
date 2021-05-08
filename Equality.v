//design
module FA_32bit (input [31:0] A, B, 
                 output reg Equal, Z, N);
  
  always @ (A or B)
    begin
      Equal = (A == B) ? 1 : 0;
      
      N = 0;
      Z = !Equal;
    end
endmodule


//testbench
module FA_32bit_test;
  reg [31:0] A, B;
  wire Equal, Z, N;
  
  FA_32bit FA(A, B, Equal, Z, N);
  
  initial
    begin
      $monitor("    A         B     | Equal  Z  N");
      #5 A = 32'h00000001; B = 32'h00000001;											//2 positive equal
      $monitor("%h  %h  |   %d    %d  %d", A, B, Equal, Z, N);
      #5 A = 32'h00000002; B = 32'h00000001;											//2 positive A > B
      $monitor("%h  %h  |   %d    %d  %d", A, B, Equal, Z, N);
      #5 A = 32'h00000001; B = 32'h00000002;											//2 positive A < B
      $monitor("%h  %h  |   %d    %d  %d", A, B, Equal, Z, N);
      #5 A = -32'h00000001; B = -32'h00000001;										//2 negative equal
      $monitor("%h  %h  |   %d    %d  %d", A, B, Equal, Z, N);
      #5 A = -32'h00000001; B = -32'h00000002;										//2 negative A > B
      $monitor("%h  %h  |   %d    %d  %d", A, B, Equal, Z, N);
      #5 A = -32'h00000002; B = -32'h00000001;										//2 negative A < B
      $monitor("%h  %h  |   %d    %d  %d", A, B, Equal, Z, N);
    end
endmodule
