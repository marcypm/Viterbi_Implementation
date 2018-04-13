module stage2 (
R3_in,
R5_in,
d1_out,
d2_out, 
d3_out, 
d4_out,
d5_out,
d6_out, 
d7_out, 
d8_out			
);

input wire [7:0] R3_in;
input wire [7:0] R5_in;

output reg [12:0] d1_out;
output reg [12:0] d2_out;
output reg [12:0] d3_out;
output reg [12:0] d4_out;
output reg [12:0] d5_out;
output reg [12:0] d6_out;
output reg [12:0] d7_out;
output reg [12:0] d8_out;

reg [12:0] TWOR1;
reg [12:0] TWOR2;




always @(R3_in,R5_in)
begin


	TWOR1 = {R3_in[7],5'b00000,R3_in[6:0] << 1};
	TWOR2 = {R5_in[7],5'b00000,R5_in[6:0] << 1};

	//both numbers positive: 
	//			d1 = -(2R1 + 2R2)
	//			d2 = +2R1 + 2R2
	//			d3 = +2R1 + 2R2
	//			d4 = -(2R1 + 2R2)
	//			d5 = +2R2 - 2R1
	//			d6 = +2R1 - 2R2
	//			d7 = +2R1 - 2R2
	//			d8 = +2R2 - 2R1
	if(TWOR1[12] == 0 && TWOR2[12] == 0) begin
		d1_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d1_out[12] <= 1;
		
		d4_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d4_out[12] <= 1;

		d2_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d2_out[12] <= 0;
		
		d3_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d3_out[12] <= 0;

		if(TWOR1[11:0] >= TWOR2[11:0]) begin
			d6_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d6_out[12] <= 0;
			d7_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d7_out[12] <= 0;
		end else begin
			d6_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d6_out[12] <= 1;
			d7_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d7_out[12] <= 1;
		end
		
		if(TWOR2[11:0] >= TWOR1[11:0]) begin
			d5_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d5_out[12] <= 0;
			d8_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d8_out[12] <= 0;
		end else begin
			d5_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d5_out[12] <= 1;
			d8_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d8_out[12] <= 1;
		end
	end


	//R1 negative, R2 positive:
	//			d1 = +2R1 - 2R2
	//			d2 = +2R2 - 2R1
	//			d3 = +2R2 - 2R1
	//			d4 = +2R1 - 2R2
	//			d5 = +2R2 + 2R1
	//			d6 = -(2R1 + 2R2)
	//			d7 = -(2R1 + 2R2)
	//			d8 = +2R2 + 2R1
	if(TWOR1[12] == 1 && TWOR2[12] == 0) begin
		d6_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d6_out[12] <= 1;
		
		d7_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d7_out[12] <= 1;

		d5_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d5_out[12] <= 0;
		
		d8_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d8_out[12] <= 0;

		if(TWOR1[11:0] >= TWOR2[11:0]) begin
			d1_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d1_out[12] <= 0;
			d4_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d4_out[12] <= 0;
		end else begin
			d1_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d1_out[12] <= 1;
			d4_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d4_out[12] <= 1;
		end
		
		if(TWOR2[11:0] >= TWOR1[11:0]) begin
			d2_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d2_out[12] <= 0;
			d3_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d3_out[12] <= 0;
		end else begin
			d2_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d2_out[12] <= 1;
			d3_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d3_out[12] <= 1;
		end
	end
	
	
	
	//R2 negative, R1 positive:  
	//			d1 = -2R1 + 2R2
	//			d2 = +2R1 - 2R2
	//			d3 = +2R1 - 2R2
	//			d4 = -2R1 + 2R2
	//			d5 = -(2R1 + 2R2)
	//			d6 = +2R1 + 2R2
	//			d7 = +2R1 + 2R2
	//			d8 = -(2R1 + 2R2)
	if(TWOR1[12] == 0 && TWOR2[12] == 1) begin
		d5_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d5_out[12] <= 1;
		
		d8_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d8_out[12] <= 1;

		d6_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d6_out[12] <= 0;
		
		d7_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d7_out[12] <= 0;

		if(TWOR1[11:0] >= TWOR2[11:0]) begin
			d2_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d2_out[12] <= 0;
			d3_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d3_out[12] <= 0;
		end else begin
			d2_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d2_out[12] <= 1;
			d3_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d3_out[12] <= 1;
		end
		
		if(TWOR2[11:0] >= TWOR1[11:0]) begin
			d1_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d1_out[12] <= 0;
			d4_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d4_out[12] <= 0;
		end else begin
			d1_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d1_out[12] <= 1;
			d4_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d4_out[12] <= 1;
		end
	end
	
	
	
	//both numbers negative: 
	//			d1 = +2R1 + 2R2
	//			d2 = -(2R1 + 2R2)
	//			d3 = -(2R1 + 2R2)
	//			d4 = +2R1 + 2R2
	//			d5 = 2R1 - 2R2
	//			d6 = 2R2 - 2R1
	//			d7 = 2R2 - 2R1
	//			d8 = 2R1 - 2R2
	if(TWOR1[12] == 1 && TWOR2[12] == 1) begin
		d2_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d2_out[12] <= 1;
		
		d3_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d3_out[12] <= 1;

		d1_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d1_out[12] <= 0;
		
		d4_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d4_out[12] <= 0;

		if(TWOR1[11:0] >= TWOR2[11:0]) begin
			d5_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d5_out[12] <= 0;
			d8_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d8_out[12] <= 0;
		end else begin
			d5_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d5_out[12] <= 1;
			d8_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d8_out[12] <= 1;
		end
		
		if(TWOR2[11:0] >= TWOR1[11:0]) begin
			d6_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d6_out[12] <= 0;
			d7_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d7_out[12] <= 0;
		end else begin
			d6_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d6_out[12] <= 1;
			d7_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d7_out[12] <= 1;
		end
	end

//d1_out <= TWOR1 + TWOR2; //d1 = -2R1 - 2R2 = -(2R1+2R2)

//d1_out[12] = d1_out[12]^1;

//d2_out <= TWOR1 + TWOR2; //d2 = +2R1 + 2R2

//d3_out <= TWOR1 + TWOR2; //d3 = +2R1 + 2R2

//d4_out <= TWOR1 + TWOR2; //d1 = -2R1 - 2R2 = -(2R1+2R2)

//d4_out[12] = d1_out[12]^1;


//d5_out <= TWOR2 - TWOR1; //d4 = -2R1 + 2R2

//d6_out <= TWOR1 - TWOR2; //d3 = +2R1 - 2R2

//d7_out <= TWOR1 - TWOR2; //d3 = +2R1 - 2R2

//d8_out <= TWOR2 - TWOR1; //d4 = -2R1 + 2R2


end
	
	
endmodule
