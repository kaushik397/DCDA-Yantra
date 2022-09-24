module tb_ORGATE;
reg s1;reg s2; //define input
wire z; //define output
ORGATE uut(.s1(s1),.s2(s2),.z(z)); //Map testbench ports with

//DUT ports

initial begin
s1 = 0; s2 = 0;#100; //different combinations of input
s1 = 0; s2 = 1;#100;
s1 = 1; s2 = 0;#100;
s1 = 1; s2 = 1;#100;
#100;
end
endmodule