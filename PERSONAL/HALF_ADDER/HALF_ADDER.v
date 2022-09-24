module HALF_ADDER
(
input A,B, // defining inputs of gate
output Sum,C_out // defining outputs of gate
);

assign Sum = A^B;
assign C_out = A & B;
endmodule 
// this is dataflow model for designing half adder. Happy coding.