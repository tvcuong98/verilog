`timescale 1ps/1ps
module DHTK_Testbench();
    parameter CLK_PERIOD = 2; // Clock period in ns

    reg clk;
    reg rst_p;
    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hour;
    wire [4:0] day;
    wire [3:0] month;
    wire [11:0] year;

    main_control DHTK(
        .clk (clk),
        .rst_p(rst_p),
        .sec (sec),
        .min (min),
        .hour (hour),
        .day (day),
        .month (month),
        .year (year)
    );
    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Initial stimulus
    initial begin
        // Initialize inputs
        rst_p = 0;
        clk = 0;

        // Reset FSM
        #1 rst_p = 1;
	    #1 rst_p = 0;
    end
endmodule


    