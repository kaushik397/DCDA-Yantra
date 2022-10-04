module mux2x1(out,a,b,s);
input wire a,b,s;
output reg out;
always @(a or b or s)
begin
if(s)
out = b;
else
out = a;
end
endmodule