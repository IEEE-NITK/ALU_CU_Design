`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.05.2021 15:16:14
// Design Name: 
// Module Name: Left_Shift
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


module Left_Shift(input [31:0] A,C, output reg [31:0] B , output reg  Z ,N );

always@(A or C)
begin
 B = A<<C;
    if (B == 32'h00000000)
        begin
          Z = 1;
          N = 0;
        end
      else
        begin
          Z = 0;
          if (B[31] == 1'b0)
            N = 0;
          else
            N = 1;
        end
end
endmodule
