
module stage1_2 (
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
reg [7:0] TWOR3;
reg [7:0] TWOR4;



always @(R1_in,R2_in)
begin
	
	TWOR1 = R1_in << 1;
	TWOR1 = {R1_in[7],TWOR1[6:0]};
	TWOR2 = R2_in << 1;
	TWOR2 = {R2_in[7],TWOR2[6:0]};

	//Calculations: d1 = -(2R1 + 2R2)

	//both numbers positive: 
	//			d1 = -(2R1 + 2R2)
	//			d2 = +2R1 + 2R2
	//			d3 = +2R1 - 2R2
	//			d4 = +2R2 - 2R1
	if(TWOR1[7] == 0 && TWOR2[7] == 0) begin
		d1_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d1_out[7] <= 1;

		d2_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d2_out[7] <= 0;

		if(TWOR1[6:0] >= TWOR2[6:0]) begin
			d3_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d3_out[7] <= 0;
		end else begin
			d3_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d3_out[7] <= 1;
			//if(d3_out[6:0] == 7'b0000000) begin
				//d3_out <= 8'b00000000;
			//end
		end
		
		if(TWOR2[6:0] >= TWOR1[6:0]) begin
			d4_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d4_out[7] <= 0;
		end else begin
			d4_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d4_out[7] <= 1;
			//if(d4_out[6:0] == 7'b0000000) begin
				//d4_out <= 8'b00000000;
			//end
		end
	end

	//R1 negative, R2 positive: 
	//			d1 = +2R1 - 2R2
	//			d2 = +2R2 - 2R1
	//			d3 = -(2R1 + 2R2)
	//			d4 = +2R1 + 2R2 
	if (TWOR1[7] == 1 && TWOR2[7] == 0) begin

		if(TWOR1[6:0] >= TWOR2[6:0]) begin
			d1_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d1_out[7] <= 0;
		end else begin
			d1_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d1_out[7] <= 1;
			//if(d1_out[6:0] == 7'b0000000) begin
				//d1_out <= 8'b00000000;
			//end
		end

		if(TWOR2[6:0] >= TWOR1[6:0]) begin
			d2_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d2_out[7] <= 0;
		end else begin
			d2_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d2_out[7] <= 1;
			//if(d2_out[6:0] == 7'b0000000) begin
				//d2_out <= 8'b00000000;
			//end
		end

		d3_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d3_out[7] <= 1;

		d4_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d4_out[7] <= 0;

	end



	////R2 negative, R1 positive: 
	//			d1 = +2R2 - 2R1
	//			d2 = +2R1 - 2R2
	//			d3 = +2R1 + 2R2
	//			d4 = -(2R1 + 2R2)
	if (TWOR1[7] == 0 && TWOR2[7] == 1) begin 

		if(TWOR2[6:0] >= TWOR1[6:0]) begin
			d1_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d1_out[7] <= 0;
		end else begin
			d1_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d1_out[7] <= 1;
			//if(d1_out[6:0] == 7'b0000000) begin
				//d1_out <= 8'b00000000;
			//end
		end

		if(TWOR1[6:0] >= TWOR2[6:0]) begin
			d2_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d2_out[7] <= 0;
		end else begin
			d2_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d2_out[7] <= 1;
			//if(d2_out[6:0] == 7'b0000000) begin
				//d2_out <= 8'b00000000;
			//end
		end

		d3_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d3_out[7] <= 0;

		d4_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d4_out[7] <= 1;

	end

	//both numbers negative 
	//			d1 = +2R1 + 2R2
	//			d2 = -(2R1 + 2R2)
	//			d3 = +2R2 - 2R1
	//			d4 = +2R1 - 2R2
	if(TWOR1[7] == 1 && TWOR2[7] == 1) begin 

		d1_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d1_out[7] <= 0;

		d2_out[6:0] <= TWOR1[6:0] + TWOR2[6:0];
		d2_out[7] <= 1;

		if(TWOR2[6:0] >= TWOR1[6:0]) begin
			d3_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			d3_out[7] <= 0;
		end else begin
			d3_out[6:0] <= (~(TWOR2[6:0] - TWOR1[6:0])+7'b0000001); 
			d3_out[7] <= 1;
			//if(d3_out[6:0] == 7'b0000000) begin
				//d3_out <= 8'b00000000;
			//end
		end

		if(TWOR1[6:0] >= TWOR2[6:0]) begin
			d4_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			d4_out[7] <= 0;
		end else begin
			d4_out[6:0] <= (~(TWOR1[6:0] - TWOR2[6:0])+7'b0000001);
			d4_out[7] <= 1;
			//if(d4_out[6:0] == 7'b0000000) begin
				//d4_out <= 8'b00000000;
			//end
		end

	end

end


endmodule
