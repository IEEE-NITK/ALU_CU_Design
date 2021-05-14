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
  FA_32bit FA ( a,b, c,ans1,ans2);
  FS_32bit FS(a,b, c,ans1,ans2);
  E_32bit E(a,b,ans1 );
  NE_32bit NE( a,b,ans1 );
 LE_32bit LE( a,b,ans1  );
 GT_32bit GT( a,b,ans1 );
 LLS_32bit LLS(a,b,ans1);
  LRS_32bit LRS(a,b,ans1);
   ARS_32bit ARS(a,b,ans1);
initial
begin
$monitor(" opCode    a      b     ans1     ans2      Z     N   ");
#(2) assign  opCode=6'b110001 ; a=32'h00010000 ; b=32'h00000001;

end
endmodule
