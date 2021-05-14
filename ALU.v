`timescale 1ns / 1ps

module ALU(
  input[31:0] a, b,
  input[5:0] opCode,
  input c,
  output reg[31:0] ans1,
  output reg ans2, Z, N
);
   reg [32:0] t;
  always @(a or b or opCode or c )
 
  begin
      case(opCode)
        
        6'b010000:
        begin
 
  
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
        
        6'b100010:
        begin
         ans1 = (a <= b) ? 1 : 0;
        end
        
        6'b100011:
        begin
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