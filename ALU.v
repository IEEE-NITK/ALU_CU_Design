//Design
`timescale 1ns / 1ps

// Code your design here
module ALU(
  input[31:0] a, b,
  input[5:0] opCode,
  output reg[31:0] ans1,
  output reg ans2, Z, N
);
       reg [32:0] t;
  reg c;
  
  always @ (ans2)
    begin
      c <= ans2;
    end
  
  always @(* )
    begin
      case(opCode)
        
        6'b010000:begin
     
          t = a + b + c;
          ans2 = t[32];
          ans1 = t[31:0];
        end
        
        6'b010001:begin
        
          t = a - b - c;
          ans1 = t[31:0];
          if (b > a || c > (a - b))
            ans2 = 1'b1;
          else
            ans2 = 1'b0;
        end
        
        6'b100000:begin
          ans1 = (a == b) ? 1 : 0;
        end
        
        6'b100001:begin
          ans1 = (a != b) ? 1 : 0;
        end
        
        6'b100010:begin
          ans1 = (a <= b) ? 1 : 0;
        end
        
        6'b100011:begin
          ans1 = (a > b) ? 1 : 0;
        end
        
        6'b110000:begin
          ans1 = a<<b;
        end
        
        6'b110001:begin
          ans1 = a>>b;
        end
        
        6'b110010:begin
          ans1 = a>>>b;
        end
        
      endcase
      
      /*----------setting N and Z flags-----------*/
      if (ans1 == 32'h00000000)
        begin
          Z = 1;
          N = 0;
        end
      else
        begin
          Z = 0;
          if (ans1[31] == 1'b0)
            N = 0;
          else
            N = 1;
        end
      /*------------------------------------------*/
      
    end
endmodule






//Test Benvch//
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2021 22:14:21
// Design Name: 
// Module Name: ALU_TEST
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module ALU_TEST();
  reg [31:0] a, b;
  reg [5:0] opCode;
  
  wire [31:0] ans1;
  wire ans2, Z, N;
  
  ALU Alu(a, b, opCode, ans1, ans2, Z, N);
  
  initial
    begin
      
    
      $monitor("\n\n=========Full Subtractor==========");
      $monitor("opCode   a         b    ans1     ans2      Z     N");
      #5 opCode = 6'b010001 ; a=32'h00000011 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b010001 ; a=-32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b010001 ; a=32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      
    
      $monitor("\n\n=========Full Adder==========");
      $monitor("opCode   a         b    ans1     ans2      Z     N");
      #5 opCode = 6'b010000 ; a=32'h00000011 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b010000 ; a=-32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b010000 ; a=32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      
      
      $monitor("\n\n=========Equality==========");
      $monitor("opCode   a         b    ans1     ans2      Z     N");
      #5 opCode = 6'b100000 ; a=32'h00000001 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b100000 ; a=-32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b100000 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      
      $monitor("\n\n=========InEquality==========");
      $monitor("opCode   a         b    ans1     ans2      Z     N");
      #5 opCode = 6'b100001 ; a=32'h00000001 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b100001 ; a=-32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b100001 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Less Than or Equal to==========");
      $monitor("opCode   a         b    ans1     ans2      Z     N");
      #5 opCode = 6'b100010 ; a=32'h00000001 ; b=32'h00000002;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b100010 ; a=-32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b100010 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Greater Than==========");
      $monitor("opCode   a         b    ans1     ans2      Z     N");
      #5 opCode = 6'b100011 ; a=32'h00000001 ; b=32'h00000002;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b100011 ; a=-32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b100011 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Logical Left Shift==========");
      $monitor("opCode   a         b    ans1     ans2      Z     N");
      #5 opCode = 6'b110000 ; a=32'h00010000 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b110000 ; a=32'hffffffff ; b=-32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b110000 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Logical Right Shift==========");
      $monitor("opCode   a         b    ans1     ans2      Z     N");
      #5 opCode = 6'b110001 ; a=32'h00000001 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b110001 ; a=32'hffffffff ; b=-32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b110001 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Arithmetic Right Shift==========");
      $monitor("opCode   a         b    ans1     ans2      Z     N");
      #5 opCode = 6'b110010 ; a=32'h00000001 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b110010 ; a=32'hffffffff ; b=-32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      #5 opCode = 6'b110010 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, a, b, ans1, ans2, Z, N);
      

    end
endmodule
