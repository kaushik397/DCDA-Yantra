// Verilog code for TestBench of 8 -bit ALU
// Define module
module tb_ALU ;
reg [ 7 : 0 ]a; reg [ 7 : 0 ]b; reg [ 3 : 0 ]s; // Define I/O ports
reg clk; reg en;
wire [ 15 : 0 ]y;
wire carry ;
wire zero ;

// Map all the I/O ports with DUT .
ALU uut (.a(a) ,.b(b) ,.s(s) ,. en(en ) ,. clk(clk ) ,.y(y) ,. carry ( carry ) ,. zero ( zero ));

// Initialise Input pins with 0
initial begin
a = 0;
b = 0;
s = 0;
en =1;
clk = 0;

end
always
begin clk = ~clk ;#5; end // Generate a clock of period 10 units
initial begin
#50;

a = 8' b11101110 ; // Initialise 8bit input value for a & b.
b = 8' b11101110 ;#29;

// Initialise 's' value to perform different operations .

s = 4' b0001 ;#30;
s = 4' b0010 ;#30;
en =0
s = 4' b0001 ;#30;
s = 4' b0010 ;#30;
s = 4' b0011 ;#30;
s = 4' b0100 ;#30;
s = 4' b0101 ;#30;
s = 4' b0110 ;#30;
s = 4' b0111 ;#30;
s = 4' b1000 ;#30;
s = 4' b1001 ;#30;
s = 4' b1010 ;#30;
s = 4' b1011 ;#30;
s = 4' b1100 ;#30;
s = 4' b1101 ;#30;
s = 4' b1110 ;#30;
s = 4' b1111 ;#30;

end // End of initial block
endmodule // End of module .