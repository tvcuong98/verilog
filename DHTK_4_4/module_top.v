module module_top(input clk, input rst_p,input pause,input switch_second,input switch_minute,input switch_hour,input switch_day,input switch_month,input switch_year, input switch, output [55:0] disp_reg);

    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hour;
    wire [4:0] day;
    wire [3:0] month;
    wire [11:0] year;

    main_control DHTK(.clk(clk), .rst_p(rst_p),.pause(pause),.switch_second(switch_second),.switch_minute(switch_minute),.switch_hour(switch_hour),.switch_day(switch_day),.switch_month(switch_month),.switch_year(switch_year), .sec(sec), .min(min), .hour(hour), .day(day), .month(month), .year(year));
    display disp(.clk(clk), .rst_p(rst_p), .sec(sec), .min(min), .hour(hour), .day(day), .month(month), .year(year), .switch(switch), .display_reg(disp_reg));
endmodule



