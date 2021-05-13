// rel_greater_than design
module rel_greater_than (input[31:0] a,b,output reg greater_than,n,z);
 always @(a,b)
   begin
    greater_than=(a>b)?1:0;
    n=0;
    z=!greater_than;
    
   end
endmodule
 //test bench
module rel_greater_than_test;
reg[31:0] a,b;
wire greater_than,n,z;
rel_greater_than myrel_greater_than(a,b,greater_than,n,z);
initial
 begin
  $monitor(" a                                 b                               | greater_than  n  z \n **************************************************************************************************************************");
  #10 a= 32'b00001 ;  b =32'b00010;                                                     // 2 positive number where a<b
  $monitor(" %b %b | %d            %d    %d",a,b,greater_than,n,z);                            
  #10 a= 32'b00001; b = 32'b00001;                                                      // 2 positive number where a=b 
  $monitor(" %b %b | %d            %d    %d",a,b,greater_than,n,z);                                   
  #10 a= 32'b00010; b = 32'b00001;                                                     // 2 positive number where a>b
  $monitor(" %b %b | %d            %d    %d",a,b,greater_than,n,z);
  #10 a= -32'b00001; b = 32'b00001;                                                     // positive and negative number each where a<b
  $monitor(" %b %b | %d            %d    %d",a,b,greater_than,n,z);
  #10 a= 32'b00001; b = -32'b00001;                                                     //  positive and negative number each where a>b
  $monitor(" %b %b | %d            %d    %d",a,b,greater_than,n,z);
 end
endmodule
