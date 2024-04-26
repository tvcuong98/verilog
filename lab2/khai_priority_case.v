module priority_encoder(input [3:0] ip, output reg [2:0] op
);

always @(ip) begin
case(ip)
	4'b0000: op = 3'b000;
	4'b0001: op = 3'b001;
	4'b0010: op = 3'b011;
	4'b0011: op = 3'b011;
	4'b0100: op = 3'b101;
	4'b0101: op = 3'b101;
	4'b0110: op = 3'b101;
	4'b0111: op = 3'b101;
	4'b1000: op = 3'b111;
	4'b1001: op = 3'b111;
	4'b1010: op = 3'b111;
	4'b1011: op = 3'b111;
	4'b1100: op = 3'b111;
	4'b1101: op = 3'b111;
	4'b1110: op = 3'b111;
	4'b1111: op = 3'b111;
	endcase
end
endmodule

`timescale 1ns/1ps
module test_bench_priority_encoder();

reg [3:0] inp;
wire [2:0] outp;

priority_encoder test_bench(
	.op(outp),
	.ip(inp)
);
initial begin
	inp = 4'b1111;
	#2
	inp = 4'b0111;
	#2
	inp = 4'b0010;
	#2
	inp = 4'b0001;
	#2
	inp = 4'b0000;
end
endmodule 




		