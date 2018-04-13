module addCompareStore (
S1_W1,
S1_W2, 
S1_W3, 
S1_W4,
S2_W1,
S2_W2, 
S2_W3, 
S2_W4,
S2_W5,
S2_W6, 
S2_W7, 
S2_W8,
S3_W1,
S3_W2, 
S3_W3, 
S3_W4,
S3_W5,
S3_W6, 
S3_W7, 
S3_W8,
S4_W1,
S4_W2, 
S4_W3, 
S4_W4,
code_out			
);

input wire [12:0] S1_W1;
input wire [12:0] S1_W2;
input wire [12:0] S1_W3;
input wire [12:0] S1_W4;
input wire [12:0] S2_W1;
input wire [12:0] S2_W2;
input wire [12:0] S2_W3;
input wire [12:0] S2_W4;
input wire [12:0] S2_W5;
input wire [12:0] S2_W6;
input wire [12:0] S2_W7;
input wire [12:0] S2_W8;
input wire [12:0] S3_W1;
input wire [12:0] S3_W2;
input wire [12:0] S3_W3;
input wire [12:0] S3_W4;
input wire [12:0] S3_W5;
input wire [12:0] S3_W6;
input wire [12:0] S3_W7;
input wire [12:0] S3_W8;
input wire [12:0] S4_W1;
input wire [12:0] S4_W2;
input wire [12:0] S4_W3;
input wire [12:0] S4_W4;


output reg [9:0] code_out;

reg [9:0] S2_N1;
reg [9:0] S2_N2;
reg [9:0] S2_N3;
reg [9:0] S2_N4;
reg [9:0] S3_N1;
reg [9:0] S3_N2;
reg [9:0] S3_N3;
reg [9:0] S3_N4;
reg [9:0] S4_N1;
reg [9:0] S4_N2;
reg [9:0] S4_N3;
reg [9:0] S4_N4;
reg [9:0] stage_end;


reg [3:0] Short_S2_N1;
reg [3:0] Short_S2_N2;
reg [3:0] Short_S2_N3;
reg [3:0] Short_S2_N4;

reg [5:0] Short_S3_N1;
reg [5:0] Short_S3_N2;
reg [5:0] Short_S3_N3;
reg [5:0] Short_S3_N4;

integer int_S1_W1;
/* integer int_S1_W2 = S1_W2[11:0];
integer int_S1_W3 = S1_W3[11:0];
integer int_S1_W4 = S1_W4[11:0];
integer int_S2_W1 = S2_W1[11:0];
integer int_S2_W2 = S2_W2[11:0];
integer int_S2_W3 = S2_W3[11:0];
integer int_S2_W4 = S2_W4[11:0];
integer int_S2_W5 = S2_W5[11:0];
integer int_S2_W6 = S2_W6[11:0];
integer int_S2_W7 = S2_W7[11:0];
integer int_S2_W8 = S2_W8[11:0];
integer int_S3_W1 = S3_W1[11:0];
integer int_S3_W2 = S3_W2[11:0];
integer int_S3_W3 = S3_W3[11:0];
integer int_S3_W4 = S3_W4[11:0];
integer int_S3_W5 = S3_W5[11:0];
integer int_S3_W6 = S3_W6[11:0];
integer int_S3_W7 = S3_W7[11:0];
integer int_S3_W8 = S3_W8[11:0];
integer int_S4_W1 = S4_W1[11:0];
integer int_S4_W2 = S4_W2[11:0];
integer int_S4_W3 = S4_W3[11:0];
integer int_S4_W4 = S4_W4[11:0]; */

always begin

int_S1_W1 = S1_W1[11:0];
int_S1_W2 = S1_W2[11:0];
int_S1_W3 = S1_W3[11:0];
int_S1_W4 = S1_W4[11:0];
int_S2_W1 = S2_W1[11:0];
int_S2_W2 = S2_W2[11:0];
int_S2_W3 = S2_W3[11:0];
int_S2_W4 = S2_W4[11:0];
int_S2_W5 = S2_W5[11:0];
int_S2_W6 = S2_W6[11:0];
int_S2_W7 = S2_W7[11:0];
int_S2_W8 = S2_W8[11:0];
int_S3_W1 = S3_W1[11:0];
int_S3_W2 = S3_W2[11:0];
int_S3_W3 = S3_W3[11:0];
int_S3_W4 = S3_W4[11:0];
int_S3_W5 = S3_W5[11:0];
int_S3_W6 = S3_W6[11:0];
int_S3_W7 = S3_W7[11:0];
int_S3_W8 = S3_W8[11:0];
int_S4_W1 = S4_W1[11:0];
int_S4_W2 = S4_W2[11:0];
int_S4_W3 = S4_W3[11:0];
int_S4_W4 = S4_W4[11:0];

if(S1_W1[12] == 1) begin
	int_S1_W1 = -int_S1_W1;
end
if(S1_W2[12] == 1) begin
	int_S1_W2 = -int_S1_W2;
end
if(S1_W3[12] == 1) begin
	int_S1_W3 = -int_S1_W3;
end
if(S1_W4[12] == 1) begin
	int_S1_W4 = -int_S1_W4;
end


if(S2_W1[12] == 1) begin
	int_S2_W1 = -int_S2_W1;
end
if(S2_W2[12] == 1) begin
	int_S2_W2 = -int_S2_W2;
end
if(S2_W3[12] == 1) begin
	int_S2_W3 = -int_S2_W3;
end
if(S2_W4[12] == 1) begin
	int_S2_W4 = -int_S2_W4;
end
if(S2_W5[12] == 1) begin
	int_S2_W5 = -int_S2_W5;
end
if(S2_W6[12] == 1) begin
	int_S2_W6 = -int_S2_W6;
end
if(S2_W7[12] == 1) begin
	int_S2_W7 = -int_S2_W7;
end
if(S2_W8[12] == 1) begin
	int_S2_W8 = -int_S2_W8;
end
	

if(S3_W1[12] == 1) begin
	int_S3_W1 = -int_S3_W1;
end
if(S3_W2[12] == 1) begin
	int_S3_W2 = -int_S3_W2;
end
if(S3_W3[12] == 1) begin
	int_S3_W3 = -int_S3_W3;
end
if(S3_W4[12] == 1) begin
	int_S3_W4 = -int_S3_W4;
end
if(S3_W5[12] == 1) begin
	int_S3_W5 = -int_S3_W5;
end
if(S3_W6[12] == 1) begin
	int_S3_W6 = -int_S3_W6;
end
if(S3_W7[12] == 1) begin
	int_S3_W7 = -int_S3_W7;
end
if(S3_W8[12] == 1) begin
	int_S3_W8 = -int_S3_W8;
end	
	
	
if(S4_W1[12] == 1) begin
	int_S4_W1 = -int_S4_W1;
end
if(S4_W2[12] == 1) begin
	int_S4_W2 = -int_S4_W2;
end
if(S4_W3[12] == 1) begin
	int_S4_W3 = -int_S4_W3;
end
if(S4_W4[12] == 1) begin
	int_S4_W4 = -int_S4_W4;
end

//stage 2
	//node1 Need to do the addition and then compare...
	
	if((S1_W1 + S2_W1) < (S1_W2 + S2_W3)) begin
		S2_N1 = S1_W1;
		Short_S2_N1 = 4'b0000;
	end else begin
		S2_N1 = (S1_W2 + S2_W3);
		Short_S2_N1 = 4'b1111;
	end
	
	//node2
	if((S1_W1 + S2_W2) < (S1_W2+S2_W4)) begin
		S2_N2 = (S1_W1 + S2_W2);
		Short_S2_N2 = 4'b0011;
	end else begin 
		S2_N2 = (S1_W2 + S2_W4);
		Short_S2_N2 = 4'b1100;
	end
	
	//node3
	if((S1_W3 + S2_W5) < (S1_W4 + S2_W7) ) begin
		S2_N3 =S1_W3 + S2_W5;
		Short_S2_N3 = 4'b1001;
	end else begin 
		S2_N3 = S1_W4 + S2_W7;
		Short_S2_N3 = 4'b0110;
	end
	
	//node4
	if( (S1_W4 + S2_W8) < (S1_W3 + S2_W6) ) begin
		S2_N4 = S1_W4 + S2_W8;
		Short_S2_N4 = 4'b0101;
	end else begin 
		S2_N4 = S1_W3 + S2_W6;
		Short_S2_N4 = 4'b1010;
	end

	
	
	
	
	
//stage 3
	//node1
	if( (S2_N1 + S3_W1) < (S2_N2 + S3_W3)  ) begin
		S3_N1 = S2_N1 + S3_W1;
		Short_S3_N1 = {Short_S2_N1,2'b00};
	end else begin 
		S3_N1 = S2_N2 + S3_W3;
		Short_S3_N1 = {Short_S2_N2,2'b11};
	end
	//node2
	if( (S2_N2 + S3_W4) < (S2_N1 + S3_W2) ) begin
		S3_N2 =S2_N2 + S3_W4;
		Short_S3_N2 = {Short_S2_N2,2'b00};
	end else begin 
		S3_N2 = S2_N1 + S3_W2;
		Short_S3_N2 = {Short_S2_N1,2'b11};
	end
	//node3
	if( (S2_N3 + S3_W5) < (S2_N4 + S3_W7) ) begin
		S3_N3 = S2_N3 + S3_W5;
		Short_S3_N3 = {Short_S2_N3,2'b01};
	end else begin 
		S3_N3 = S2_N4 + S3_W7;
		Short_S3_N3 = {Short_S2_N4,2'b10};
	end
	//node4
	if( (S2_N4 + S3_W8) < (S2_N3 + S3_W6) ) begin
		S3_N4 = S2_N4 + S3_W8;
		Short_S3_N4 = {Short_S2_N4,2'b01};
	end else begin 
		S3_N4 = S2_N3 + S3_W6;
		Short_S3_N4 = {Short_S2_N3,2'b10};
	end
	
	
	
	
	
	
	//stage 4
	//node1
	S4_N1 = S3_N1 + S4_W1;
	S4_N2 = S3_N2 + S4_W2;
	S4_N3 = S3_N3 + S4_W3;
	S4_N4 = S3_N4 + S4_W4;
	
	if (S4_N1 < S4_N2 && S4_N1 < S4_N3 && S4_N1 < S4_N4) begin
	stage_end = S4_N1;
	code_out = {Short_S3_N1,2'b00};
	end else if ( S4_N2 < S4_N1 && S4_N2 < S4_N3  && S4_N2 < S4_N4) begin
	stage_end = S4_N2;
	code_out = {Short_S3_N2,2'b11};
	end else if ( S4_N3 < S4_N1 && S4_N3 < S4_N2  && S4_N3 < S4_N4) begin
	stage_end = S4_N3;
	code_out = {Short_S3_N3,2'b10};
	end else begin
	stage_end = S4_N4;
	code_out = {Short_S3_N4,2'b01};
	end
	
	

end
	
	
endmodule
