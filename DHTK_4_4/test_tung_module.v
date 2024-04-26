// `timescale 1ps/1ps
// module test_module();
//     // Signals
//     reg clk;
//     reg rst_p;
//     wire min_tick_t;
//     wire [5:0] sec;
//     wire [5:0] min; 
//     // Parameters
//     parameter CLK_PERIOD = 2; // Clock period in ns

//     // Create a wire for sec_tick_t

//     // Instantiate the module under test
//     second_counter sec_counter (
//         .clk(clk),
//         .rst_p(rst_p),
//         .sec_tick(sec_tick), // Kết nối sec_tick_t từ second_counter
//         .sec_count(sec)
//     );
//     minute_counter min_counter (
//         .clk(clk),
//         .rst_p(rst_p),
//         .sec_tick(sec_counter.sec_tick), // Sử dụng sec_tick_t từ second_counter
//         .min_tick(min_tick_t),
//         .min_count(min)
//     );

//     // Clock generation
//     always #((CLK_PERIOD/2)) clk = ~clk;

//     // Initial stimulus
//     initial begin
//         // Initialize inputs
//         rst_p = 0;
//         clk = 0;

//         // Reset FSM
//         #1 rst_p = 1;
// 	    #1 rst_p = 0;
//     end

// endmodule


`timescale 1ps/1ps

module test_module();

  // Signals
  reg clk;
  reg rst_p;
  wire pulse;

  
  // Parameters
  parameter CLK_PERIOD = 1; // Clock period in ns

  // Instantiate the module under test
  pulse_1s pulse_1(.clk(clk), .rst_p(rst_p), .pulse(pulse));

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
