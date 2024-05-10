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
    pulse_1s #(.num_clk_cycle(5)) pulse_1s_dut (.clk(clk),.rst_n(rst_n),.pulse(pulse));
    second_backcounter #(.T(6'd5),.t(6'd2)) second_backcounter_dut(.clk(clk),.rst_n(rst_n),.mode(mode),.pulse(pulse),.timeout(timeout),.sec_count(sec_count));
    highway highway_dut (.clk(clk),.rst_n(rst_n),.sensor(sensor),.timeout(timeout),.enable_countryroad(enable_countryroad),.highway_led(highway_led),.mode(mode));
    countryroad countryroad_dut(.clk(clk),.rst_n(rst_n),.enable_countryroad(enable_countryroad),.timeout(timeout),.countryroad_led(countryroad_led));
endmodule

`timescale 1ps/1ps //Adjust to suit

module main_control_tb;

reg         clk           ;
reg         rst_n         ;
reg         sensor        ;
wire         pulse        ;
wire         mode         ;
wire        timeout       ;
wire [5:0] sec_count     ;
wire enable_countryroad   ;    
wire [2:0]highway_led     ;
wire [2:0]countryroad_led ;

main_control uut (
    .clk        (    clk        ),
    .rst_n      (    rst_n      ),
    .sensor       (    sensor       ),
    .pulse      (    pulse      ),
    .mode    (    mode    ),
    .timeout (    timeout ),
    .sec_count (    sec_count ),
    .enable_countryroad(enable_countryroad),
    .highway_led(highway_led),
    .countryroad_led(countryroad_led)
);

parameter PERIOD = 2; //adjust for your timescale

initial begin
    clk = 1'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clk = ~clk;
end

initial begin
    rst_n=1'b1; #(PERIOD*2);
    rst_n=~rst_n; #PERIOD;
    rst_n=~rst_n;
    sensor = 0;
    #(PERIOD*10);
    sensor = 1;
    #(PERIOD*20);

end
endmodule