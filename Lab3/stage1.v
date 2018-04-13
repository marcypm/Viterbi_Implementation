
module stage1 (
R1_in	,
R2_in	,
d1_out,
d2_out, 
d3_out, 
d4_out			
);

input wire [7:0] R1_in;
input wire [7:0] R2_in;


output reg [12:0] d1_out;
output reg [12:0] d2_out;
output reg [12:0] d3_out;
output reg [12:0] d4_out;

reg [12:0] TWOR1;
reg [12:0] TWOR2;
reg [12:0] TWOR3;
reg [12:0] TWOR4;



always @(R1_in,R2_in)
begin
	
	TWOR1 = {R1_in[7],5'b00000,R1_in[6:0] << 1};
	TWOR2 = {R2_in[7],5'b00000,R2_in[6:0] << 1};

	//both numbers positive: 
	//			d1 = -(2R1 + 2R2)
	//			d2 = +2R1 + 2R2
	//			d3 = +2R1 - 2R2
	//			d4 = +2R2 - 2R1
	if(TWOR1[12] == 0 && TWOR2[12] == 0) begin
		d1_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d1_out[12] <= 1;

		d2_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d2_out[12] <= 0;

		if(TWOR1[11:0] >= TWOR2[11:0]) begin
			d3_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d3_out[12] <= 0;
		end else begin
			d3_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d3_out[12] <= 1;

		end
		
		if(TWOR2[11:0] >= TWOR1[11:0]) begin
			d4_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d4_out[12] <= 0;
		end else begin
			d4_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d4_out[12] <= 1;

		end
	end

	//R1 negative, R2 positive: 
	//			d1 = +2R1 - 2R2
	//			d2 = +2R2 - 2R1
	//			d3 = -(2R1 + 2R2)
	//			d4 = +2R1 + 2R2 
	if (TWOR1[12] == 1 && TWOR2[12] == 0) begin

		if(TWOR1[11:0] >= TWOR2[11:0]) begin
			d1_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d1_out[12] <= 0;
		end else begin
			d1_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d1_out[12] <= 1;
		end

		if(TWOR2[11:0] >= TWOR1[11:0]) begin
			d2_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d2_out[12] <= 0;
		end else begin
			d2_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d2_out[12] <= 1;
		end

		d3_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d3_out[12] <= 1;

		d4_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d4_out[12] <= 0;

	end



	////R2 negative, R1 positive: 
	//			d1 = +2R2 - 2R1
	//			d2 = +2R1 - 2R2
	//			d3 = +2R1 + 2R2
	//			d4 = -(2R1 + 2R2)
	if (TWOR1[12] == 0 && TWOR2[12] == 1) begin 

		if(TWOR2[11:0] >= TWOR1[11:0]) begin
			d1_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d1_out[12] <= 0;
		end else begin
			d1_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d1_out[12] <= 1;
		end

		if(TWOR1[11:0] >= TWOR2[11:0]) begin
			d2_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d2_out[12] <= 0;
		end else begin
			d2_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d2_out[12] <= 1;
		end

		d3_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d3_out[12] <= 0;

		d4_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d4_out[12] <= 1;

	end

	//both numbers negative 
	//			d1 = +2R1 + 2R2
	//			d2 = -(2R1 + 2R2)
	//			d3 = +2R2 - 2R1
	//			d4 = +2R1 - 2R2
	if(TWOR1[12] == 1 && TWOR2[12] == 1) begin 

		d1_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d1_out[12] <= 0;

		d2_out[11:0] <= TWOR1[11:0] + TWOR2[11:0];
		d2_out[12] <= 1;

		if(TWOR2[11:0] >= TWOR1[11:0]) begin
			d3_out[11:0] <= TWOR2[11:0] - TWOR1[11:0];
			d3_out[12] <= 0;
		end else begin
			d3_out[11:0] <= (~(TWOR2[11:0] - TWOR1[11:0])+7'b0000001); 
			d3_out[12] <= 1;
		end

		if(TWOR1[11:0] >= TWOR2[11:0]) begin
			d4_out[11:0] <= TWOR1[11:0] - TWOR2[11:0];
			d4_out[12] <= 0;
		end else begin
			d4_out[11:0] <= (~(TWOR1[11:0] - TWOR2[11:0])+7'b0000001);
			d4_out[12] <= 1;
		end

	end

end


endmodule
