module stage4 (
R1_in	,
R2_in	,
d1_out,
d2_out, 
d3_out, 
d4_out			
);

input wire [7:0] R1_in;
input wire [7:0] R2_in;


output reg [7:0] d1_out;
output reg [7:0] d2_out;
output reg [7:0] d3_out;
output reg [7:0] d4_out;

reg [7:0] TWOR1;
reg [7:0] TWOR2;




always begin

TWOR1 = R1_in << 1;
TWOR2 = R2_in << 1;

d1_out <= TWOR1 + TWOR2; //d1 = -2R1 - 2R2 = -(2R1+2R2)
d1_out[7] = d1_out[7]^1;

d2_out <= TWOR1 + TWOR2; //d2 = +2R1 + 2R2

d3_out <= TWOR1 - TWOR2; //d3 = +2R1 - 2R2

d4_out <= TWOR2 - TWOR1; //d4 = -2R1 + 2R2
end
	
	
endmodule
