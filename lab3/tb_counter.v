`timescale 1ps / 1ps

module tb_counter;

    // Parameters
    parameter CLK_PERIOD = 2; // Clock period in ns

    // Signals
    reg cnt;
    reg clk;
    reg rst_n;
    wire [3:0] y;

    // Instantiate the module under test
    fsm dut (
        .cnt(cnt),
        .clk(clk),
        .rst_n(rst_n),
        .y(y)
    );

    // Clock generation
    always #((CLK_PERIOD/2)) clk = ~clk;

    // Initial stimulus
    initial begin
        // Initialize inputs
        cnt = 0;
        rst_n = 1;
        clk = 0;

        // Reset FSM
        #1 rst_n = 0; // dau ra dang la 0001

        // Test case 1: x = 0
        #1 cnt = 0; // dau ra phai van giu nguyen la 0001
        #1;
        // Test case 2: x = 1
        #1 cnt = 1; // dau ra phai tang len 0010
        #1;
        // Test case 3: x = 0 
        #1 cnt = 0; // dau ra van giu nguyen la 0010
        #1;
        // Test case 4: x = 1
        #1 cnt = 1; // dau ra tang len 0100
        #1;
        // Test case 5: x = 0
        #1 cnt = 0; // dau ra van giu nguyen la 0100
        #1;
        // Test case 6: x = 1
        #1 cnt = 1; // dau ra tang len 1000
        #1;

        // Test case 7 : x=1
        #1 cnt = 1; // dau ra quay tro lai ve 0001
        #1;

        // test case 8 : x=1
        #1 cnt =1; // cho dau ra tang len thanh 0010
        #1;
        // test case 9 : reset 
        #1 rst_n = 0; // bay h dau ra reset lai ve 0001
        #1 rst_n = 1;
        #1;
        // End simulation
        // $finish;
        $stop;
    end

endmodule