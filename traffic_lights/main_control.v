module main_control(
    input clk,
    input rst_n,
    input sensor,
    wire pulse,
    wire mode,
    wire timeout,
    wire [5:0] sec_count,
    wire enable_countryroad,
    wire [2:0]highway_led,
    wire [2:0]countryroad_led
);
    pulse_1s pulse_1s_dut (.clk(clk),.rst_n(rst_n),.pulse(pulse));
    second_backcounter second_backcounter_dut(.clk(clk),.rst_n(rst_n),.mode(mode),.pulse(pulse),.timeout(timeout),.sec_count(sec_count));
    highway highway_dut (.clk(clk),.rst_n(rst_n),.sensor(sensor),.timeout(timeout),.enable_countryroad(enable_countryroad),.highway_led(highway_led),.mode(mode));
    countryroad countryroad_dut(.clk(clk),.rst_n(rst_n),.enable_countryroad(enable_countryroad),.timeout(timeout),.countryroad_led(countryroad_led));
endmodule