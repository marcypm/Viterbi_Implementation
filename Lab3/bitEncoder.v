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




always begin
case(messageBit)
	0 : dataStruct = 10010000;
	1 : dataStruct = 00010000;
endcase

noiseTemp[7:0] = noise[31:24];
//Shift noiseTemp Here
//noiseTemp = {6'b000000,noiseTemp[7:6]}; //shift by 6 >>
 noiseTemp = 8'b00000000;
r_out <= dataStruct + noiseTemp;

end
	
	
endmodule
