module CNOT(A,Out);
input [1:0] A;
output [1:0] Out;
reg [1:0] out;
reg [3:0] p_s;
always @ (A)
begin 
    if (A==2'b00)
           p_s=4'b1000;
    if (A==2'b00)
           p_s=4'b0100;
    if (A==2'b00)
           p_s=4'b0010;
    if (A==2'b00)
           p_s=4'b0001;
end

reg [15:0] c_not_mat;

{c_not_mat[0],c_not_mat[1],c_not_mat[2],c_not_mat[3]}=4'b1000;
{c_not_mat[4],c_not_mat[5],c_not_mat[6],c_not_mat[7]}=4'b0100;
{c_not_mat[8],c_not_mat[9],c_not_mat[10],c_not_mat[11]}=4'b0001;
{c_not_mat[12],c_not_mat[13],c_not_mat[14],c_not_mat[15]}=4'b0010;

mat_mult m1(p_s,c_not_mat,out);

module mat_mult(A,B,Out);
input [3:0] A;
input [15:0] B;
Output [1:0]Res;
reg [3:0] Res1;
reg [3:0] A1;
reg [3:0] B1;
integer i,j,k,l;

always @(A or B)
  begin
//Declarations
{A1[0],A1[1],A1[2],A1[3]}=A;
{B1[0][0],B1[0][1],B1[0][2],B1[0][3],B1[1][0],B1[1][1],B1[1][2],B1[1][2],B1[1][3],B1[2][0],B1[2][1],B1[2][2],B1[2][2],B1[2][3]
,B1[3][0],B1[3][1],B1[3][2],B1[3][2],B1[3][3]}=B;

{Res1[0],Res1[1],Res1[2],Res1[3]}=4'b0000;

i=0;
j=0;
k=0;
l=0;

//Mat Mul code
for (i=0;i<4;i++)
     Res1[0]=Res1[0]+A[i]*B[0][i];
for (j=0;j<4;j++)
     Res1[1]=Res1[1]+A[i]*B[1][i];
for (k=0;k<4;k++)
     Res1[2]=Res1[2]+A[i]*B[2][i];
for (l=0;l<4;l++)
     Res1[3]=Res1[3]+A[i]*B[3][i];
  end
//Back Conversion of value into product state

always @(Res1)
  begin
   if(Res1==4'b1000)
          Res=2'b00;
   if(Res1==4'b0100)
          Res=2'b01;
   if(Res1==4'b0010)
          Res=2'b10;
   if(Res1==4'b0001)
          Res=2'b11;
  end
end module