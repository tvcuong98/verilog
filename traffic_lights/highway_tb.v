`timescale 1ps/1ps //Adjust to suit

module highway_tb;

reg              sensor                ;
reg              timeout               ;
reg              clk                   ;
reg              rst_n                 ;
wire             enable_countryroad    ;
wire    [2:0]    highway_led           ;

highway uut (
    .sensor                (    sensor                ),
    .timeout               (    timeout               ),
    .clk                   (    clk                   ),
    .rst_n                 (    rst_n                 ),
    .enable_countryroad    (    enable_countryroad    ),
    .highway_led           (    highway_led           )
);

parameter PERIOD = 2; //adjust for your timescale

initial begin
    // $dumpfile("tb_output.vcd");
    // $dumpvars(2, tb_highway);
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
    timeout = 0; #(PERIOD*10);
    sensor = 1;
    timeout = 1; #(PERIOD*10);
end


// `include "user.tb_highway.v"
endmodule
