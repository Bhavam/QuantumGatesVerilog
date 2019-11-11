module feynman_gate(A,B,Out);
input A,B;
Output [1:0] Out;
reg out1;
assign Out[0]=A;
xor x1(A,B,out1)
assign Out[1]=out1;
endmodule

module feynman_gate_tb();
reg A=0;
reg B=0;
wire out;
feynman_gate f1(A,B,out);
initial 
  begin
    #10
    A=1'b0;
    B=1'b1;
   #10
    A=1'b1;
    B=1'b0;
   #10
    A=1'b0;
    B=1'b0;
   #10
    A=1'b1;
    B=1'b1;
  end
endmodule