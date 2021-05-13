module rel_less_equal_to (input[31:0] a,b, output reg less_than_equal_to , z ,n);
   always @ (a,b)
    begin
    
      less_than_equal_to=(a<=b)?1:0;
        
      n = 0;
      z = !less_than_equal_to;
     
     
    end
 
endmodule

// test bench

module rel_less_equal_to_test;
  reg [31:0]a, b;
  wire less_than_equal_to, z, n;
  
  rel_less_equal_to myrel_less_equal_to(a, b, less_than_equal_to, z, n);
  
  initial
    begin
      $monitor("    a         b     | less_than_equal_to  z  n");
      #5 a = 32'd00000001; b= 32'd00000001;											//2 positive equal
      $monitor("%d  %d  |   %d    %d  %d", a, b, less_than_equal_to, z, n);
      #5 a= 32'd00000010; b = 32'd00000001;											//2 positive a > b
      $monitor("%d  %d  |   %d    %d  %d", a, b, less_than_equal_to, z, n);
      #5 a= 32'd00000001; b = 32'd00000010;											//2 positive a < b
      $monitor("%d  %d  |   %d    %d  %d", a, b, less_than_equal_to, z, n);
      #5 a= -32'd00000001;b = -32'd00000001;										//2 negative equal
      $monitor("%d  %d  |   %d    %d  %d",a, b, less_than_equal_to, z, n);
      #5 a =-32'd00000001; b = -32'd00000010;										//2 negative a > b
      $monitor("%d  %d  |   %d    %d  %d",a, b, less_than_equal_to, z, n);
      #5 a =-32'd000000010;b = -32'd00000001;										//2 negative a < b
      $monitor("%d  %d  |   %d    %d  %d", a, b, less_than_equal_to, z, n);
    end
endmodule
