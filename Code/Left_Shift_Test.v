`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2021 17:51:42
// Design Name: 
// Module Name: Left_Shift_Test
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


module Left_Shift_Test;
reg [31:0] A,C;
wire [31:0] B;
Left_Shift LS(A,C,B,Z,N);
initial
begin
$monitor("     A      C     B     N      Z   ");


assign  A=32'h00010000 ; C=32'h00000001;
#(2)
assign  A=-32'h10010000 ; C=32'h00000001;
#(2)
assign  A=32'h00101010 ; C=-32'h00000001;
end
    
endmodule
