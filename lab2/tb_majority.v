module tb_majority;
    // Parameters
    parameter n = 8;
    // Inputs
    reg [n-1:0] x;
    // Outputs
    wire y;
    // Instantiate the majority module
    majority #(.n(n)) uut (
        .x(x),
        .y(y)
    );
    // Clock
    reg clk = 0;
    always #5 clk = ~clk;
    // Stimulus
    initial begin
        // Test with majority of 1s
        $display("Testing majority of 1s");
        x = 8'b11110000; // 4 ones and 4 zeros
        #10;
        // Test with majority of 0s
        $display("Testing majority of 0s");
        x = 8'b00001111; // 4 zeros and 4 ones
        #10;
        // Test with equal number of 1s and 0s
        $display("Testing equal number of 1s and 0s");
        x = 8'b10101010; // Equal number of ones and zeros
        #10;
        // Test with all 1s
        $display("Testing all 1s");
        x = 8'b11111111; // All ones
        #10;
        // Test with all 0s
        $display("Testing all 0s");
        x = 8'b00000000; // All zeros
        #10;
        // Add more test cases as needed
        // End simulation
        $finish;
    end

endmodule
