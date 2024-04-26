module priority_encoder(input [3:0] ip, output reg [2:0] op
);

always @(ip) begin
casex(ip)
	4'b0000: op = 3'b000;
	4'b0001: op = 3'b001;
	4'b001x: op = 3'b011;
	4'b01xx: op = 3'b101;
	4'b1xxz: op = 3'b111;
	default: op = 0;
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
	inp = 4'b1101;
	#2
	inp = 4'b0110;
	#2
	inp = 4'b01xx;
	#2
	inp = 4'b0010;
	#2
	inp = 4'b0001;
	#2
	inp = 4'b0000;
end
endmodule 




		