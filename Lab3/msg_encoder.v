module msg_encoder (
msg,
encoded_msg			
);

input wire [3:0] msg;
output reg [7:0] encoded_msg;

reg p1;
reg p2;
reg p3;
reg p4;


always @(msg)
begin

p1 = msg[3] + msg[2] + msg[1];
p2 = msg[3] + msg[2] + msg[0];
p3 = msg[3] + msg[1] + msg[0];
p4 = msg[2] + msg[1] + msg[0];

encoded_msg = {msg[3],msg[2],msg[1],msg[0],p1,p2,p3,p4};

end
endmodule
