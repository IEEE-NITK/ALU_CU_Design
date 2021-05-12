// design
module rel_not_equal (input[31:0] a,b, output reg not_equal , z ,n);
   always @ (a,b)
    begin
       not_equal=(a!=b)?1:0;
       
       n = 0;
       z = !not_equal;
    end
endmodule

// test bench

module Inequality_test;
  reg [31:0]a, b;
  wire not_equal, z, n;
  
  rel_not_equal myrel_not_equal(a, b, not_equal, z, n);
  
  initial
    begin
      $monitor("    a         b     | not_equal  z  n");
      #5 a = 32'h00000001; b= 32'h00000001;											//2 positive equal
      $monitor("%h  %h  |   %d    %d  %d", a, b, not_equal, z, n);
      #5 a= 32'h00000002; b = 32'h00000001;											//2 positive a > b
      $monitor("%h  %h  |   %d    %d  %d", a, b, not_equal, z, n);
      #5a= 32'h00000001; b = 32'h00000002;											//2 positive a < b
      $monitor("%h  %h  |   %d    %d  %d", a, b, not_equal, z, n);
      #5a= -32'h00000001;b = -32'h00000001;										//2 negative equal
      $monitor("%h  %h  |   %d    %d  %d",a, b, not_equal, z, n);
      #5a = -32'h00000001; b = -32'h00000002;										//2 negative a > b
      $monitor("%h  %h  |   %d    %d  %d",a, b, not_equal, z, n);
      #5a = -32'h00000002;b = -32'h00000001;										//2 negative a < b
      $monitor("%h  %h  |   %d    %d  %d", a, b, not_equal, z, n);
    end
endmodule
