module bitEncoder (
noise		,
messageBit	,
r_out			
);

input wire [31:0] noise;
input wire messageBit;

output reg [7:0] r_out;

reg [7:0] dataStruct;
reg [7:0] noiseTemp;




always @(messageBit)
begin
	case(messageBit)
		0 : dataStruct = 10010000;
		1 : dataStruct = 00010000;
	endcase

	noiseTemp[7:0] = noise[31:24];
	//Shift noiseTemp Here
	noiseTemp = {4'b0000,noiseTemp[7:4]}; //shift by 6 >>
 	//noiseTemp = 8'b00000000;
	r_out <= dataStruct + noiseTemp;

end
	
	
endmodule
