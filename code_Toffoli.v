module Toffoli(A,B,C,Out);
input A,B,C;
output [2:0] Out;
always @ (A or B or C)
  begin
  if (A==1'b0 && B==1'b0 && C==1'b0)
        Out=3'b000;
  if (A==1'b0 && B==1'b0 && C==1'b1)
        Out=3'b001;
  if (A==1'b0 && B==1'b1 && C==1'b0)
        Out=3'b010;
  if (A==1'b0 && B==1'b1 && C==1'b1)
        Out=3'b011;
  if (A==1'b1 && B==1'b0 && C==1'b0)
        Out=3'b100;
  if (A==1'b1 && B==1'b0 && C==1'b1)
        Out=3'b101;
  if (A==1'b1 && B==1'b1 && C==1'b0)
        Out=3'b111;
  if (A==1'b1 && B==1'b1 && C==1'b1)
       Out=3'b110;  
  end   
end module
module Toffoli_tb ();
reg A;
reg B;
reg C;
wire Out;
 
Toffoli T1(A,B,C,Out);

initial
begin
#10
   A=1'b0;
   B=1'b0;   
   C=1'b1;
#10
   A=1'b1;
   B=1'b0;   
   C=1'b1;
#10
   A=1'b1;
   B=1'b1;   
   C=1'b1;
end
endmodule