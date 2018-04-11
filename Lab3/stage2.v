module stage2 (
R3_in	,
R5_in	,
d1_out,
d2_out, 
d3_out, 
d4_out,
d5_out,
d6_out, 
d7_out, 
d8_out			
);

input wire signed [7:0] R3_in;
input wire signed [7:0] R5_in;


output reg signed [7:0] d1_out;
output reg signed [7:0] d2_out;
output reg signed [7:0] d3_out;
output reg signed [7:0] d4_out;
output reg signed [7:0] d5_out;
output reg signed [7:0] d6_out;
output reg signed [7:0] d7_out;
output reg signed [7:0] d8_out;

reg signed [7:0] TWOR1;
reg signed [7:0] TWOR2;




always begin


TWOR1 = R3_in << 1;
TWOR1 = {R3_in[7],TWOR1[6:0]};
TWOR2 = R5_in << 1;
TWOR2 = {R5_in[7],TWOR2[6:0]};


d1_out <= TWOR1 + TWOR2; //d1 = -2R1 - 2R2 = -(2R1+2R2)
d1_out[7] = d1_out[7]^1;

d2_out <= TWOR1 + TWOR2; //d2 = +2R1 + 2R2

d3_out <= TWOR1 + TWOR2; //d3 = +2R1 + 2R2

d4_out <= TWOR1 + TWOR2; //d1 = -2R1 - 2R2 = -(2R1+2R2)
d4_out[7] = d1_out[7]^1;


d5_out <= TWOR2 - TWOR1; //d4 = -2R1 + 2R2

d6_out <= TWOR1 - TWOR2; //d3 = +2R1 - 2R2

d7_out <= TWOR1 - TWOR2; //d3 = +2R1 - 2R2

d8_out <= TWOR2 - TWOR1; //d4 = -2R1 + 2R2


end
	
	
endmodule
