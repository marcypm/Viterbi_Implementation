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

input wire [7:0] R3_in;
input wire [7:0] R5_in;


output reg [7:0] d1_out;
output reg [7:0] d2_out;
output reg [7:0] d3_out;
output reg [7:0] d4_out;
output reg [7:0] d5_out;
output reg [7:0] d6_out;
output reg [7:0] d7_out;
output reg [7:0] d8_out;

reg [7:0] TWOR1;
reg [7:0] TWOR2;




always begin


TWOR1 = R3_in << 1;
TWOR1 = {R3_in[7],TWOR1[6:0]};
TWOR2 = R5_in << 1;
TWOR2 = {R5_in[7],TWOR2[6:0]};


	//both numbers positive: 
	//			d1 = -(2R1 + 2R2)
	//			d2 = +2R1 + 2R2
	//			d3 = +2R1 + 2R2
	//			d4 = -(2R1 + 2R2)
	//			d5 = +2R2 - 2R1
	//			d6 = +2R1 - 2R2
	//			d7 = +2R1 - 2R2
	//			d8 = +2R2 - 2R1
	if(TWOR1[7] == 0 && TWOR2[7] == 0) begin
		d1_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d1_out[7] <= 1;
		
		d4_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d4_out[7] <= 1;

		d2_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d2_out[7] <= 0;
		
		d3_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d3_out[7] <= 0;

		if(TWOR1[6:0] >= TWOR2[6:0]) begin
			d6_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d6_out[7] <= 0;
			d7_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d7_out[7] <= 0;
		end else begin
			d6_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d6_out[7] <= 1;
			d7_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d7_out[7] <= 1;
			//if(d3_out[6:0] == 7'b0000000) begin
				//d3_out <= 8'b00000000;
			//end
		end
		
		if(TWOR2[6:0] >= TWOR1[6:0]) begin
			d5_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d5_out[7] <= 0;
			d8_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d8_out[7] <= 0;
		end else begin
			d5_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d5_out[7] <= 1;
			d8_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d8_out[7] <= 1;
			//if(d4_out[6:0] == 7'b0000000) begin
				//d4_out <= 8'b00000000;
			//end
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
	if(TWOR1[7] == 0 && TWOR2[7] == 0) begin
		d6_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d6_out[7] <= 1;
		
		d7_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d7_out[7] <= 1;

		d5_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d5_out[7] <= 0;
		
		d8_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d8_out[7] <= 0;

		if(TWOR1[6:0] >= TWOR2[6:0]) begin
			d1_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d1_out[7] <= 0;
			d4_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d4_out[7] <= 0;
		end else begin
			d1_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d1_out[7] <= 1;
			d4_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d4_out[7] <= 1;
			//if(d3_out[6:0] == 7'b0000000) begin
				//d3_out <= 8'b00000000;
			//end
		end
		
		if(TWOR2[6:0] >= TWOR1[6:0]) begin
			d2_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d2_out[7] <= 0;
			d3_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d3_out[7] <= 0;
		end else begin
			d2_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d2_out[7] <= 1;
			d3_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d3_out[7] <= 1;
			//if(d4_out[6:0] == 7'b0000000) begin
				//d4_out <= 8'b00000000;
			//end
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
	if(TWOR1[7] == 0 && TWOR2[7] == 0) begin
		d5_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d5_out[7] <= 1;
		
		d8_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d8_out[7] <= 1;

		d6_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d6_out[7] <= 0;
		
		d7_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d7_out[7] <= 0;

		if(TWOR1[6:0] >= TWOR2[6:0]) begin
			d2_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d2_out[7] <= 0;
			d3_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d3_out[7] <= 0;
		end else begin
			d2_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d2_out[7] <= 1;
			d3_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d3_out[7] <= 1;
			//if(d3_out[6:0] == 7'b0000000) begin
				//d3_out <= 8'b00000000;
			//end
		end
		
		if(TWOR2[6:0] >= TWOR1[6:0]) begin
			d1_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d1_out[7] <= 0;
			d4_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d4_out[7] <= 0;
		end else begin
			d1_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d1_out[7] <= 1;
			d4_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d4_out[7] <= 1;
			//if(d4_out[6:0] == 7'b0000000) begin
				//d4_out <= 8'b00000000;
			//end
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
	if(TWOR1[7] == 0 && TWOR2[7] == 0) begin
		d2_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d2_out[7] <= 1;
		
		d3_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d3_out[7] <= 1;

		d1_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d1_out[7] <= 0;
		
		d4_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d4_out[7] <= 0;

		if(TWOR1[6:0] >= TWOR2[6:0]) begin
			d5_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d5_out[7] <= 0;
			d8_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d8_out[7] <= 0;
		end else begin
			d5_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d5_out[7] <= 1;
			d8_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d8_out[7] <= 1;
			//if(d3_out[6:0] == 7'b0000000) begin
				//d3_out <= 8'b00000000;
			//end
		end
		
		if(TWOR2[6:0] >= TWOR1[6:0]) begin
			d6_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d6_out[7] <= 0;
			d7_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d7_out[7] <= 0;
		end else begin
			d6_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d6_out[7] <= 1;
			d7_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d7_out[7] <= 1;
			//if(d4_out[6:0] == 7'b0000000) begin
				//d4_out <= 8'b00000000;
			//end
		end
	end

//d1_out <= TWOR1 + TWOR2; //d1 = -2R1 - 2R2 = -(2R1+2R2)

//d1_out[7] = d1_out[7]^1;

//d2_out <= TWOR1 + TWOR2; //d2 = +2R1 + 2R2

//d3_out <= TWOR1 + TWOR2; //d3 = +2R1 + 2R2

//d4_out <= TWOR1 + TWOR2; //d1 = -2R1 - 2R2 = -(2R1+2R2)

//d4_out[7] = d1_out[7]^1;


//d5_out <= TWOR2 - TWOR1; //d4 = -2R1 + 2R2

//d6_out <= TWOR1 - TWOR2; //d3 = +2R1 - 2R2

//d7_out <= TWOR1 - TWOR2; //d3 = +2R1 - 2R2

//d8_out <= TWOR2 - TWOR1; //d4 = -2R1 + 2R2


end
	
	
endmodule
