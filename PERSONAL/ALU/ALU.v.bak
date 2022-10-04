// Verilog Design for a 8 -bit ALU .
/* This design will Perform Arithmetic and Logical operations
based on the select input */
// Define module .
module ALU (
input [ 7 : 0 ]a,b,
input [ 3 : 0 ]s, // Define Inputs a,b and select line input s
input en ,clk , // Define clock and enable signal
output reg [ 15 : 0 ] y, // Define 16 bit ALU output
output reg carry , zero // Define Flag output
);
reg [ 7 : 0 ] a_in ; // Local registers for input 'a '.
reg [ 7 : 0 ] b_in ; // Local registers for input 'b '.
reg [ 1 : 0 ] flags ;
/* Local register to store carry bit in flags [0] &
zero flag bit in flags [1] */
reg [ 15 : 0 ] out_y ; // Local register to store 16 bit output 'y '.

always @( posedge clk , negedge en)
begin
if(en ==1) // if en =1 , reset all outputs
begin
a_in <= 0;
b_in <= 0;
y <= 0;
carry <= 0;
zero <= 0;
end
else
begin
a_in <= a; // if en =1 , latch all output flit flops
b_in <= b;
y <= out_y ;
carry <= flags [ 0 ] ;
zero <= flags [ 1 ] ;
end
end

always @ (a_in ,b_in ,s)
begin
flags = 2' b00; // set flags to zero
case (s)
4'd0:
begin
out_y =( a_in + b_in ); // addition
flags [ 0 ] = out_y [ 8 ] ; // carry is set if generated .
end
4'd1:
begin
out_y =( a_in - b_in ); // Subtraction
flags [ 0 ] = out_y [ 8 ] ; // carry is set if Borrow is taken .
end
4'd2:
begin
out_y =( a_in + 1'b1 ); // Increment
flags [ 0 ] = out_y [ 8 ] ; // carry is set if generated .
end
4'd3: begin
out_y =( a_in - 1'b1 ); // Decrement
flags [ 0 ] = out_y [ 8 ] ; // carry is set if Borrow is taken .
end
4'd4: out_y =( a_in * b_in ); // Multiplication .
4'd5: out_y =( a_in / b_in ); // Division
4'd6: out_y ={8 'd0 ,( a_in & b_in )}; // Bitwise AND
4'd7: out_y ={8 'd0 ,( a_in | b_in )}; // Bitwise OR
4'd8: out_y ={8 'd0 ,( a_in ^ b_in )}; // Bitwise XOR
4'd9: out_y ={8 'd0 ,~( a_in & b_in )}; // Bitwise NAND
4' d10: out_y ={8 'd0 ,~( a_in | b_in )}; // Bitwise NOR
4' d11: out_y ={8 'd0 ,~( a_in ^ b_in )}; // Bitwise XNOR
4' d12:
begin
flags [ 0 ] = a_in [ 7 ] ; // Update carry flag
out_y ={8 'd0 ,( a_in < <1)}; // Shift Left
end
4' d13: begin
flags [ 0 ] = a_in [ 0 ] ; // Update carry flag
out_y ={8 'd0 ,( a_in > >1)}; // Shift Right
end
4' d14: out_y ={8 'd0 , a_in [ 0 ] ,a_in [ 7 : 1 ] }; // right rotate
4' d15: out_y ={8 'd0 , a_in [ 6 : 0 ] ,a_in [ 7 ] }; // left rotate
default : out_y =16 ' d0;
endcase
if( out_y == 0)
flags [ 1 ] = 1; // set zero flag if output is zero
end // End of case structure .
endmodule