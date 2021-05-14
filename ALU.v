//design
//Full Adder
module FA_32bit (input [31:0] A, B, input Cin, 
                 output reg [31:0] Sum, output reg Cout);
  reg [32:0] t;
  
  always @ (A or B or Cin)
    begin
      t = A + B + Cin;
      Cout = t[32];
      Sum = t[31:0];
    end
  
endmodule

//Full Subtractor
module FS_32bit (input [31:0] A, B, input Bin, 
                 output reg [31:0] Diff, output reg Bout);
  reg [32:0] t;
  
  always @ (A or B or Bin)
    begin
      t = A - B - Bin;
      Diff = t[31:0];
      if (B > A || Bin > (A - B))
      	Bout = 1'b1;
      else
        Bout = 1'b0;
    end
  
endmodule

//Relational Equality
module E_32bit (input [31:0] A, B,
                output reg Equal);
  
  always @ (A or B)
    begin
      Equal = (A == B) ? 1 : 0;
    end

endmodule

//Relational Inequality
module NE_32bit (input[31:0] a,b, 
                      output reg not_equal);
  
  always @ (a,b)
   begin
     not_equal = (a != b) ? 1 : 0;
   end

endmodule

//Relational Less than or Equal to
module LE_32 (input[31:0] a,b,
                          output reg less_than_equal_to);
  
  always @ (a,b)
    begin
      less_than_equal_to = (a <= b) ? 1 : 0;
    end
 
endmodule

//Relational Greater than
module GT_32bit (input[31:0] a,b,
                         output reg greater_than);
  
  always @(a,b)
    begin
      greater_than = (a > b) ? 1 : 0;
    end

endmodule

//Logical Left Shift
module LLS_32bit(input [31:0] A, C,
                 output reg [31:0] B);
  
  always@(A or C)
    begin
      B = A<<C;
    end
  
endmodule

//Logical Right Shift
module LRS_32bit(input [31:0] A, C,
                 output reg [31:0] B);
  
  always@(A or C)
    begin
      B = A>>C;
    end
  
endmodule

//Arithmetic Right Shift
module ARS_32bit(input [31:0] A, C,
                 output reg [31:0] B);
  
  always@(A or C)
    begin
      B = A>>>C;
    end
  
endmodule


/*==================================ALU==========================================*/
module ALU(
  input[31:0] a, b,
  input[5:0] opCode,
  output reg[31:0] ans1,
  output reg ans2, z, n
)
  
  reg c;
  
  always @ (ans2)
    begin
      c <= ans2;
    end
  
  always @ (a or b or opCode or c)
    begin
      case(opCode)
        
        6'b010000:begin
          FA_32bit(
            .A(a),
            .B(b),
            .Cin(c),
            .Sum(ans1),
            .Cout(ans2)
          )
        end
        
        6'b010001:begin
          FS_32bit(
            .A(a),
            .B(b),
            .Bin(c),
            .Diff(ans1),
            .Bout(ans2)
          )
        end
        
        6'b100000:begin
          E_32bit(
            .A(a),
            .B(b),
            .Equal(ans1)
          )
        end
        
        6'b100001:begin
          NE_32bit(
            .a(a),
            .b(b),
            .not_equal(ans1)
          )
        end
        
        6'b100010:begin
          LE_32bit(
            .a(a),
            .b(b),
            .less_than_equal_to(ans1)
          )
        end
        
        6'b100011:begin
          GT_32bit(
            .a(a),
            .b(b),
            .greater_than(ans1)
          )
        end
        
        6'b110000:begin
          LLS_32bit(
            .A(a),
            .C(b),
            .B(ans1)
          )
        end
        
        6'b110001:begin
          LLS_32bit(
            .A(a),
            .C(b),
            .B(ans1)
          )
        end
        
        6'b110010:begin
          LLS_32bit(
            .A(a),
            .C(b),
            .B(ans1)
          )
        end
        
      endcase
      
      /*----------setting N and Z flags-----------*/
      if (ans1 == 32'h00000000)
        begin
          z = 1;
          n = 0;
        end
      else
        begin
          z = 0;
          if (ans1[31] == 1'b0)
            n = 0;
          else
            n = 1;
        end
      /*------------------------------------------*/
      
    end
endmodule
