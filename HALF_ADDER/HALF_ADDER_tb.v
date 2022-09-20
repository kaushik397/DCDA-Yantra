module HALF_ADDER_tb;
reg A1;reg B1;
wire c_out1;
wire sum1;
// Defining unit under test i.e AND_GATE
HALF_ADDDER  HALF_ADDDER_tb(.A(A1) ,.B(B1), .Sum(Sum1), .C_out(C_out1));
// Assigning all possible states for input A and B
initial begin

	A1 = 1'b0;
	B1 = 1'b0;
	#100
	A1 = 1'b1; 
	B1 = 1'b0;
	#100
	A1 = 1'b0; 
	B1 = 1'b1;
	#100
	A1 = 1'b1; 
	B1 = 1'b1;
end
endmodule
// this code is for testing my half adder code and viewing the results
// ONLY FOR TESTING POURPUS 