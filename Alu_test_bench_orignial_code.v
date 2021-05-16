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

// testbench
module ALU_TEST();
  reg [31:0] A, B;
  reg [5:0] opCode;
  
  wire [31:0] ans1;
  wire ans2, Z, N;
  
  ALU Alu(A, B, opCode, ans1, ans2, Z, N);
  
  initial
    begin
      
      $monitor("\n\n=========Full Adder==========");
      $monitor("opCode    A      B     ans1     ans2      Z     N");
      #5 opCode = 6'b010000 ; a=32'h00000001 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b010000 ; a=-32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b010000 ; a=32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Full Subtractor==========");
      $monitor("opCode    A      B     ans1     ans2      Z     N");
      #5 opCode = 6'b010001 ; a=32'h00000001 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b010001 ; a=-32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b010001 ; a=32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Equality==========");
      $monitor("opCode    A      B     ans1     ans2      Z     N");
      #5 opCode = 6'b100000 ; a=32'h00000001 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100000 ; a=-32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100000 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      
      $monitor("\n\n=========InEquality==========");
      $monitor("opCode    A      B     ans1     ans2      Z     N");
      #5 opCode = 6'b100001 ; a=32'h00000001 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100001 ; a=-32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100001 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Less Than or Equal to==========");
      $monitor("opCode    A      B     ans1     ans2      Z     N");
      #5 opCode = 6'b100010 ; a=32'h00000001 ; b=32'h00000002;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100010 ; a=-32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100010 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Greater Than==========");
      $monitor("opCode    A      B     ans1     ans2      Z     N");
      #5 opCode = 6'b100011 ; a=32'h00000001 ; b=32'h00000002;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100011 ; a=-32'hffffffff ; b=32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100011 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Logical Left Shift==========");
      $monitor("opCode    A      B     ans1     ans2      Z     N");
      #5 opCode = 6'b100000 ; a=32'h00010000 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100000 ; a=32'hffffffff ; b=-32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100000 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Logical Right Shift==========");
      $monitor("opCode    A      B     ans1     ans2      Z     N");
      #5 opCode = 6'b100000 ; a=32'h00000001 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100000 ; a=32'hffffffff ; b=-32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100000 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      
      $monitor("\n\n=========Arithmetic Right Shift==========");
      $monitor("opCode    A      B     ans1     ans2      Z     N");
      #5 opCode = 6'b100000 ; a=32'h00000001 ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100000 ; a=32'hffffffff ; b=-32'hfffffffe;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      #5 opCode = 6'b100000 ; a=32'hffffffff ; b=32'h00000001;
      $monitor("%b  %h  %h  |  %h  %d    %d  %d", opCode, A, B, ans1, ans2, Z, N);
      
      
    end
endmodule
