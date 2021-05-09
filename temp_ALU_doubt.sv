module ALU(
  input[31:0] a, b,
  input[5:0] opCode,
  input cOptional,
  output reg[31:0] ans,
  output reg ansOptional, z, n
)
  
  always @(a or b or opCode)
    begin
      case(opCode)
        
        6'b01xxxx:
          begin
            case(opCode)
              
              6'b010000:
                begin
                  FA_32bit myFA(
                  	.A(a),
                  	.B(b),
                  	.Cin(cOptional),
                  	.Sum(ans),
                  	.Cout(ansOptional),
                  	.Z(z),
                  	.N(n)
                  )
                end
              
              6'b010001:
                begin
                  FS_32bit myFS(
                    .A(a),
                    .B(b),
                    .Bin(cOptional),
                    .Diff(ans),
                    .Bout(ansOptional),
                    .Z(z),
                    .N(n)
                  )
                end
              
              //for anymore future arithmetic operations
            endcase
          end
        
        6'b10xxxx:
          begin
            case(opCode)
              
              6'b100000:
                begin
                  Equality myEquality(
                  	.A(a),
                  	.B(b),
                  	.Cin(cOptional),
                  	.Sum(ans),
                  	.Cout(ansOptional),
                  	.Z(z),
                  	.N(n)
                  )
                end
              
              //rishee's remaining 3 relational operations
              
              //for anymore future relational operations
            endcase
          end
        
        6'b11xxxx:
          begin
            case(opCode)
              
              //harsh's shift operations
              
              //for anymore future shift operations
            endcase
          end
      endcase
    end
  end
endmodule
