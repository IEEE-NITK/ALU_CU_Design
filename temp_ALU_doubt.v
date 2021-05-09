//design
module ALU(
  input[31:0] a, b,
  input[5:0] opCode,
  input cOptional,
  output reg[31:0] ans,
  output reg ansOptional, z, n
)
  
  always @(a or b or opCode)
    begin
      casex(opCode)
        6'b01xxxx:          //rest 4 bits are dont cares for arithmetic
          begin
            case(opCode)    //now we check which arithmetic operation they chose
              6'b010000:
                begin
                  FA_32bit myFA(    //instantiating FA_32bit
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
                  FS_32bit myFS(    //instantiating FS_32bit
                    .A(a),
                    .B(b),
                    .Bin(cOptional),
                    .Diff(ans),
                    .Bout(ansOptional),
                    .Z(z),
                    .N(n)
                  )
                end
          end
        6'b10xxxx:            //rest 4 bits are dont cares for relational
          begin
            case(opCode)      //now we check which relational operation they chose
              6'b100000:
                begin
                  Equality myEquality(    //instantiating Equality
                  	.A(a),
                  	.B(b),
                  	.Cin(cOptional),
                  	.Sum(ans),
                  	.Cout(ansOptional),
                  	.Z(z),
                  	.N(n)
                  )
                end
          end
    end
  
endmodule
