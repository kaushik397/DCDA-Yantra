module ALU_S
(
input [1:0]a,b,// inputs for A,B
input [1:0]s, // input selector operator
input en,clk, //define clock and enable to establish control
output reg [3:0] y, // define the output as 4 bit output
output reg carry, zero//define other outputs carry and zero
);

reg [1:0] a_in;// store A into local reg
reg [1:0] b_in;// store B into local reg
reg [1:0] flags; // these are status flag registors used to store the status of out output
// flag[0] = carry , flags[1] = zero
reg [3:0] out_y; // local register to sotre the temporary data as 4 bit.
/* TODO DECLARE THE FUNCATIONS */ 
always @(posedge clk, negedge en)
begin
if(en ==1) // if enable =1 system must reset all outputs
begin 
a_in <=0;
b_in <=0;
y<=0;
carry <=0;
zero <=0;
end
else
begin
a_in <=a;
b_in <=b;
y <=out_y;
carry <=flags[0];
zero<=flags[1];
end
end

//declare the functions
always @(a_in,b_in,s)
begin
flags = 2'b00;
case(s)

2'd0:
begin
out_y=(a_in+b_in);
flags[0]=out_y[2];
end
2'd1:
begin
out_y=(a_in-b_in);
end
2'd2:out_y =( a_in / b_in );
2'd3:out_y =( a_in * b_in );
default : out_y =4'd0;
endcase 
if( out_y==0)
flags[1]=1;
end
endmodule
