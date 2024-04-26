module display(
    input clk,
	input rst_p,
    input [5:0]	sec,
	input [5:0]	min,
	input [4:0]	hour,
	input [4:0]	day,
	input [3:0]	month,
	input [11:0] year,
   input switch,
    output [55:0] display_reg
);

wire [15:0] sec_reg, min_reg, hour_reg, day_reg, month_reg, year_reg; //Bien chua cac day bit BCD duoc convert tu binary -> BCD 
////////////////////////////////////////////////////////////////////////////////
	// Binary -> BCD
	bin2bcd csec(.bin({6'b0, sec}), .bcd(sec_reg));
	bin2bcd	cmin(.bin({6'b0, min}), .bcd(min_reg));
	bin2bcd chour(.bin({7'b0, hour}), .bcd(hour_reg));
	bin2bcd cday(.bin({7'b0, day}), .bcd(day_reg));
	bin2bcd	cmonth(.bin({8'b0, month}), .bcd(month_reg));
	bin2bcd cyear(.bin(year), .bcd(year_reg));
////////////////////////////////////////////////////////////////////////////////
	localparam [3:0] led_off = 4'b1111;
////////////////////////////////////////////////////////////////////////////////

// Chuyen trang thai hien thi
	reg state, nextstate;
	reg switch_prev;
	reg [31:0] input_display;
always @(posedge switch or posedge rst_p)
begin
if (rst_p) begin
	state <= 1'b0;
	switch_prev <= 0;
end
else begin
	state <= nextstate;
	switch_prev <= switch;
end
end
always @(switch, state) begin
case (state)
1'b0 : begin
	input_display[31:28] = hour_reg[7:4];
	input_display[27:24] = hour_reg[3:0];
	input_display[23:20] = min_reg[7:4];
	input_display[19:16] = min_reg[3:0];
	input_display[15:12] = led_off;
	input_display[11:8] = led_off;
	input_display[7:4] = sec_reg[7:4];	
	input_display[3:0] = sec_reg[3:0];
	if (switch == 0 & switch_prev == 1) begin
		nextstate = 1'b1;
	end
	else begin
		nextstate = 1'b0;
	end
end
1'b1 : begin
	input_display[31:28] = day_reg[7:4];
	input_display[27:24] = day_reg[3:0];
	input_display[23:20] = month_reg[7:4];
	input_display[19:16] = month_reg[3:0];
	input_display[15:12] = year_reg[15:12];
	input_display[11:8] = year_reg[11:8];
	input_display[7:4] = year_reg[7:4];	
	input_display[3:0] = year_reg[3:0];
	if (switch == 0 & switch_prev == 1) begin
		nextstate = 1'b0;
	end
	else begin
		nextstate = 1'b1;
	end
end
endcase
end


////////////////////////////////////////////////////////////////////////////////

//Giai ma dau ra cho LED 7 Segment
	Giaima7Thanh LED8(
	    .bin(input_display[31:28]),
	    .seg(display_reg[55:49])
);
	Giaima7Thanh LED7(
	    .bin(input_display[27:24]),
	    .seg(display_reg[48:42])
);
	Giaima7Thanh LED6(
	    .bin(input_display[23:20]),
	    .seg(display_reg[41:35])
);
	Giaima7Thanh LED5(
	    .bin(input_display[19:16]),
	    .seg(display_reg[34:28])
);
	Giaima7Thanh LED4(
	    .bin(input_display[15:12]),
	    .seg(display_reg[27:21])
);
    Giaima7Thanh LED3(
    	.bin(input_display[11:8]),
    	.seg(display_reg[20:14])
);
    Giaima7Thanh LED2(
    	.bin(input_display[7:4]),
    	.seg(display_reg[13:7])
);
    Giaima7Thanh LED1(
    	.bin(input_display[3:0]),
    	.seg(display_reg[6:0])
);
endmodule
