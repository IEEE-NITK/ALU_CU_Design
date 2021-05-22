//design
module FA_1bit (input A, B, Cin, output reg Sum, Cout);					//1 bit Full Adder
  always @ (A or B or Cin)
    begin										//blocking assignment of values
      Sum = A ^ B ^ Cin;
      Cout = (A & B) | (Cin & (A ^ B));
    end
endmodule


module FA_32bit (input [31:0] A, B, input Cin, 
		output wire [31:0] Sum, output wire Cout, output reg Z, N);				//32 bit Full Adder
	
  wire [30:0] t; 
  genvar i;
  
  FA_1bit G1 (A[0], B[0], Cin, Sum[0],t[0]);						//instantiating FA for 1st bit
  generate for (i = 1; i < 31; i = i + 1)
      begin: lbl
	FA_1bit XG (A[i], B[i], t[i-1], Sum[i], t[i]);		                        //instantiating FA for next 30 bits
      end
  endgenerate
 	FA_1bit G2 (A[31], B[31], t[30], Sum[31], Cout);				//instantiating FA for last bit
  
  always @ *										//assigning Z and N flags
    begin																							
      if (Sum == 32'h00000000)
        begin
          Z = 1;
          N = 0;
        end
      else
        begin
          Z = 0;
          if (Sum[31] == 1'b0)
            N = 0;
          else
            N = 1;
        end
    end
endmodule

//testbench
module FA_32bit_test;
  reg [31:0] A, B;
  reg Cin;
  wire [31:0] Sum;
  wire Cout, Z, N;
  
  FA_32bit FA(A, B, Cin, Sum[31:0], Cout, Z, N);
  
  initial
    begin
      $monitor("    A         B    Cin |     Sum   Cout  Z  N");
      #5 A = 32'hff000f0f; B = 32'h00fff0f0; Cin = 0;																	//2 positive w/out carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = 32'h35355353; B = 32'hcacaacac; Cin = 1;																	//2 positive w/ carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = 32'h00000003; B = -32'hfffffffe; Cin = 0;																//1 positive 1 negative w/out carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = 32'h00000002; B = -32'h00000001; Cin = 1;																//1 positive 1 negative w/ carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = -32'h00000003; B = -32'hfffffffe; Cin = 0;																//2 negative w/out carry 
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = -32'h00000003; B = -32'hfffffffe; Cin = 1;																//2 negative w/ carry
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = 32'h00000001; B = -32'h00000003; Cin = 0;																//negative sum
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
      #5 A = 32'h00000000; B = 32'h00000000; Cin = 0;																	//zero sum
      $monitor("%h  %h  %d  |  %h  %d    %d  %d", A, B, Cin, Sum[31:0], Cout, Z, N);
    end
endmodule
