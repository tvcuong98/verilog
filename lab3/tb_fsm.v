`timescale 1ps / 1ps

module fsm_tb;

    // Parameters
    parameter CLK_PERIOD = 2; // Clock period in ns

    // Signals
    reg x;
    reg clk;
    reg rst_n;
    wire y;

    // Instantiate the module under test
    fsm dut (
        .x(x),
        .clk(clk),
        .rst_n(rst_n),
        .y(y)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Initial stimulus
    initial begin
        // Initialize inputs
        x = 0;
        rst_n = 1;
        clk = 0;

        // Reset FSM
        #1 rst_n = 0;
        #1 rst_n = 1;
        // Test case 1: x = 0
        #1 x = 0;
        #1;
        // Test case 2: x = 1
        #1 x = 1;
        #1;
        // Test case 3: x = 0
        #1 x = 0;
        #1;
        // Test case 4: x = 1
        #1 x = 1;
        #1;
        // Test case 5: x = 0
        #1 x = 0;
        #1;
        // Test case 6: Reset
        #1 rst_n = 0;
        #1 rst_n = 1;
        #1;
        // End simulation
        // $finish;
        //$stop;
    end

endmodule