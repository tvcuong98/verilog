module minute_counter_tb;

    // Parameters
    parameter CLK_PERIOD = 2; // Clock period in ns

    // Inputs
    reg clk;
    reg rst_p;
    reg sec_tick;
    reg switch_minute;

    // Outputs
    wire min_tick;
    wire [5:0] min_count;

    // Instantiate the Unit Under Test (UUT)
    minute_counter uut (
        .clk(clk),
        .rst_p(rst_p),
        .sec_tick(sec_tick),
        .switch_minute(switch_minute),
        .min_tick(min_tick),
        .min_count(min_count)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Initial stimulus
    initial begin
        clk = 0;
        rst_p = 1;
        sec_tick = 1;
        switch_minute = 0;
        #2; // wait for some time
        // Deassert reset
        rst_p = 0;
        #20; // wait for some time

        // Apply stimuli
        switch_minute = 1;
        #20; // wait for some time
        switch_minute = 0;
        #20; // wait for some time
        switch_minute = 1;
        #20; // wait for some time
        switch_minute = 0;
        #20; // wait for some time
        
        // Finish simulation
        #2;
        //$finish;
    end

endmodule