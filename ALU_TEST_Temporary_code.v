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
reg [31:0] a,b;
reg [5:0]opCode;
reg c;
wire [31:0] ans1;
wire ans2,Z,N;
ALU Alu(a, b, opCode,c, ans1, ans2, Z, N);

initial
begin
$monitor(" opCode    a      b     ans1     ans2      Z     N   ");
#(2) assign a=32'b00010100 ; b=32'b00001001 ; c=0; opCode =6'b010000 ;

end
endmodule
