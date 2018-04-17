module Trellis (
msg,
code_out
);

input wire [3:0] msg;
output wire [7:0] code_out;


wire [7:0] encoded_msg;

msg_encoder encode (.msg(msg), .encoded_msg(encoded_msg));

wire [7:0] encoded_msg_1;
wire [7:0] encoded_msg_2;
wire [7:0] encoded_msg_3;
wire [7:0] encoded_msg_4;
wire [7:0] encoded_msg_5;
wire [7:0] encoded_msg_6;
wire [7:0] encoded_msg_7;
wire [7:0] encoded_msg_8;

bitEncoder bit_1_encoder (.messageBit(encoded_msg[0]),.r_out(encoded_msg_1));
bitEncoder bit_2_encoder (.messageBit(encoded_msg[1]),.r_out(encoded_msg_2));
bitEncoder bit_3_encoder (.messageBit(encoded_msg[2]),.r_out(encoded_msg_3));
bitEncoder bit_4_encoder (.messageBit(encoded_msg[3]),.r_out(encoded_msg_4));
bitEncoder bit_5_encoder (.messageBit(encoded_msg[4]),.r_out(encoded_msg_5));
bitEncoder bit_6_encoder (.messageBit(encoded_msg[5]),.r_out(encoded_msg_6));
bitEncoder bit_7_encoder (.messageBit(encoded_msg[6]),.r_out(encoded_msg_7));
bitEncoder bit_8_encoder (.messageBit(encoded_msg[7]),.r_out(encoded_msg_8));

wire [12:0] S1_W1;
wire [12:0] S1_W2;
wire [12:0] S1_W3;
wire [12:0] S1_W4;
wire [12:0] S2_W1;
wire [12:0] S2_W2;
wire [12:0] S2_W3;
wire [12:0] S2_W4;
wire [12:0] S2_W5;
wire [12:0] S2_W6;
wire [12:0] S2_W7;
wire [12:0] S2_W8;
wire [12:0] S3_W1;
wire [12:0] S3_W2;
wire [12:0] S3_W3;
wire [12:0] S3_W4;
wire [12:0] S3_W5;
wire [12:0] S3_W6;
wire [12:0] S3_W7;
wire [12:0] S3_W8;
wire [12:0] S4_W1;
wire [12:0] S4_W2;
wire [12:0] S4_W3;
wire [12:0] S4_W4;


stage1 R1_R2_stage (.R1_in(encoded_msg_1), .R2_in(encoded_msg_2), .d1_out(S1_W1), .d2_out(S1_W2), .d3_out(S1_W3), .d4_out(S1_W4));
stage1 R7_R8_stage (.R1_in(encoded_msg_7), .R2_in(encoded_msg_8), .d1_out(S4_W1), .d2_out(S4_W2), .d3_out(S4_W3), .d4_out(S4_W4));


stage2 R3_R5_stage (.R3_in(encoded_msg_3), .R5_in(encoded_msg_5), .d1_out(S2_W1), .d2_out(S2_W2), .d3_out(S2_W3), .d4_out(S2_W4), .d5_out(S2_W5), .d6_out(S2_W6), .d7_out(S2_W7), .d8_out(S2_W8));
stage2 R4_R6_stage (.R3_in(encoded_msg_4), .R5_in(encoded_msg_6), .d1_out(S3_W1), .d2_out(S3_W2), .d3_out(S3_W3), .d4_out(S3_W4), .d5_out(S3_W5), .d6_out(S3_W6), .d7_out(S3_W7), .d8_out(S3_W8));


addCompareStore compare_stage (.S1_W1(S1_W1), .S1_W2(S1_W2), .S1_W3(S1_W3), .S1_W4(S1_W4), 
.S2_W1(S2_W1), .S2_W2(S2_W2), .S2_W3(S2_W3), .S2_W4(S2_W4), .S2_W5(S2_W5), .S2_W6(S2_W6), .S2_W7(S2_W7), .S2_W8(S2_W8), 
.S3_W1(S3_W1), .S3_W2(S3_W2), .S3_W3(S3_W3), .S3_W4(S3_W4), .S3_W5(S3_W5), .S3_W6(S3_W6), .S3_W7(S3_W7), .S3_W8(S3_W8), 
.S4_W1(S4_W1), .S4_W2(S4_W2), .S4_W3(S4_W3), .S4_W4(S4_W4),
.code_out(code_out));


endmodule