module main_control(
    input clk,
    input rst_p,
    input pause,
    input switch_second,switch_minute,switch_hour,switch_day,switch_month,switch_year,

    output [5:0] sec,
    output [5:0] min,
    output [4:0] hour, 
    output [4:0] day,
    output [3:0] month, 
    output [11:0] year
);
    wire pul;
    wire pul_0_5s;
    wire sec_tick;
    wire min_tick;
    wire hour_tick;
    wire day_tick;
    wire month_tick;
    wire [1:0] month_fw;
    wire year_fw;

    pulse_1s pulse_1(.clk(clk), .rst_p(rst_p), .pause(pause),.pulse(pul));
    pulse_0_5s pulse_0_5 (.clk(clk), .rst_p(rst_p),.pulse_0_5s(pul_0_5s));
    second_counter sec_counter(.clk(clk), .rst_p(rst_p), .pulse(pul),.pulse_0_5s(pul_0_5s),.switch_second(switch_second), .sec_tick(sec_tick), .sec_count(sec));
    minute_counter min_counter(.clk(clk), .rst_p(rst_p),.pulse_0_5s(pul_0_5s), .sec_tick(sec_tick),.switch_minute(switch_minute), .min_tick(min_tick), .min_count(min));
    hour_counter h_counter(.clk(clk), .rst_p(rst_p),.pulse_0_5s(pul_0_5s), .min_tick(min_tick),.switch_hour(switch_hour), .hour_tick(hour_tick), .hour_count(hour));
    day_counter d_counter(.clk(clk), .rst_p(rst_p),.pulse_0_5s(pul_0_5s), .hour_tick(hour_tick),.switch_day(switch_day), .month_fw(month_fw), .year_fw(year_fw), .day_tick(day_tick), .day_count(day));
    month_counter m_counter(.clk(clk), .rst_p(rst_p),.pulse_0_5s(pul_0_5s), .day_tick(day_tick),.switch_month(switch_month), .month_tick(month_tick), .month_fw(month_fw), .month_count(month));
    year_counter y_counter(.clk(clk), .rst_p(rst_p),.pulse_0_5s(pul_0_5s), .month_tick(month_tick),.switch_year(switch_year), .year_fw(year_fw), .year_count(year));

endmodule
`timescale 1ps/1ps
module main_control_tb();
    parameter CLK_PERIOD = 2;
    reg clk;
    reg rst_p;
    reg pause;
    reg switch_second, switch_minute, switch_hour, switch_day, switch_month, switch_year;
    reg switch;

    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hour;
    wire [4:0] day;
    wire [3:0] month;
    wire [11:0] year; 

    main_control DHTK(
        .clk (clk),
        .rst_p(rst_p),
        .pause(pause),
        .switch_second(switch_second),
        .switch_minute(switch_minute),
        .switch_hour(switch_hour),
        .switch_day(switch_day),
        .switch_month(switch_month),
        .switch_year(switch_year),
        .sec (sec),
        .min (min),
        .hour (hour),
        .day (day),
        .month (month),
        .year (year)
    );
    display disp(.clk(clk), .rst_p(rst_p), .sec(sec), .min(min), .hour(hour), .day(day), .month(month), .year(year), .switch(switch), .display_reg(disp_reg));
    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Initial stimulus
    initial begin
        // Initialize inputs
        rst_p = 0;
        clk = 0;
        pause = 0;
        switch_second = 0;
        switch_minute = 0;
        switch_hour = 0;
        switch_day = 0;
        switch_month = 0;
        switch_year = 0;
        // Reset FSM
        #2 rst_p = 1;
	    #2 rst_p = 0;
        #50;
        switch_second = 1;
        #20;
        switch_second = 0;
        #20;
        switch_year = 1;
        #20;
        switch_year =0;
    end
endmodule