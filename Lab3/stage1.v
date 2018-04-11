module stage1 (
R1_in	,
R2_in	,
d1_out,
d2_out, 
d3_out, 
d4_out			
);

input wire signed [7:0] R1_in;
input wire signed[7:0] R2_in;


output reg signed[7:0] d1_out;
output reg signed[7:0] d2_out;
output reg signed[7:0] d3_out;
output reg signed[7:0] d4_out;

reg signed [7:0] TWOR1;
reg signed [7:0] TWOR2;
reg signed [7:0] TWOR3;
reg signed [7:0] TWOR4;




always begin

TWOR1 = R1_in << 1;
TWOR1 = {R1_in[7],TWOR1[6:0]};
TWOR2 = R2_in << 1;
TWOR2 = {R2_in[7],TWOR2[6:0]};


d1_out <= TWOR1 + TWOR2; //d1 = -2R1 - 2R2 = -(2R1+2R2)
d1_out[7] = d1_out[7]^1;

d2_out <= TWOR1 + TWOR2;//TWOR1 + TWOR2; //d2 = +2R1 + 2R2

d3_out <= TWOR2 + {~TWOR1[7],TWOR1[6:0]};
//d3_out <= TWOR1 - TWOR2; //d3 = +2R1 - 2R2

d4_out <= TWOR1 + {~TWOR2[7],TWOR2[6:0]};

end
	
	
endmodule
