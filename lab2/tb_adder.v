`timescale 1ns/1ps

module tb_adder();

    reg [3:0] stim_a, stim_b;
    wire [4:0] monitor_s;
    wire co;

    // Instantiate the adder module
    adder adder_duv (
        .a(stim_a),
        .b(stim_b),
        .s(monitor_s),
        .co(co)
    );

    // Generate stimulus
    initial begin
        stim_a = 0;
        stim_b = 1;
        #5;
        stim_a = 10;
        stim_b = 15;
        #10;
        // End simulation after all test cases are executed
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%t, a=%d, b=%d, s=%d, co=%d\n", $time, stim_a, stim_b, monitor_s, co);
    end

endmodule