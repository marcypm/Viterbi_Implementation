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

	

	if(TWOR1[7] != TWOR2[7]) begin //d1 = -2R1 - 2R2 = -(2R1+2R2)
		if(TWOR1[7] == 1 ) begin //R1 negative
			d1_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			if(TWOR1[6:0] > TWOR2[6:0]) begin
				d1_out[7] <= TWOR1[7];
			end else begin 
				d1_out[7] <= TWOR2[7];
			end
		end else begin //R2 negative
			d1_out <= TWOR1 - TWOR2;
			if(TWOR1[6:0] > TWOR2[6:0]) begin
				d1_out[7] <= TWOR1[7];
			end else begin 
				d1_out[7] <= TWOR2[7];
			end
		end

	end else begin
		d1_out <= TWOR1 + TWOR2;
		d1_out[7] <= R1_in[7];
	end
	
	if(d1_out[6:0] == 7'b0000000) begin
		d1_out[7] <= 0;
		//d1_out[7] <= d1_out[7];
	end else begin
		if (d1_out[7] == 0) begin 
			d1_out[7] <= 1;
		end else begin
			d1_out[7] <= 0;
		end
		
	end



	if(TWOR1[7] != TWOR2[7]) begin //d2 = +2R1 + 2R2
		if(TWOR1[7] == 1 ) begin //R1 negative
			d2_out[6:0] <= TWOR2[6:0] - TWOR1[6:0];
			if(TWOR1[6:0] > TWOR2[6:0]) begin
				d2_out[7] <= TWOR1[7];
			end else begin 
				d2_out[7] <= TWOR2[7];
			end
		end else begin //R2 negative
			d2_out[6:0] <= TWOR1[6:0] - TWOR2[6:0];
			if(TWOR1[6:0] > TWOR2[6:0]) begin
				d2_out[7] <= TWOR1[7];
			end else begin 
				d2_out[7] <= TWOR2[7];
			end
		end
	end else begin
		d2_out <= TWOR1 + TWOR2;
		d2_out[7] <= R1_in[7];
	end


	//d2_out <= TWOR1 + TWOR2;//TWOR1 + TWOR2; //d2 = +2R1 + 2R2
	
	d3_out <= TWOR2 + {~TWOR1[7],TWOR1[6:0]};
	//d3_out <= TWOR1 - TWOR2; //d3 = +2R1 - 2R2

	d4_out <= TWOR1 + {~TWOR2[7],TWOR2[6:0]};

end
	
	
endmodule
