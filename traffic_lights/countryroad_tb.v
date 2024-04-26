`timescale 1ps/1ps //Adjust to suit

module countryroad_tb;

reg        enable_countryroad    ;
reg        timeout               ;
reg        clk                   ;
reg        rst_n                 ;
wire [2:0] countryroad_led       ;
countryroad uut (
    .enable_countryroad    (    enable_countryroad    ),
    .timeout               (    timeout               ),
    .clk                   (    clk                   ),
    .rst_n                 (    rst_n                 ),
    .countryroad_led       (    countryroad_led       )
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
    enable_countryroad = 0;
    timeout = 0; #(PERIOD*10);
    enable_countryroad = 1;
    timeout = 1; #(PERIOD*10);
end
endmodule
