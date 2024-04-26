`timescale 1ps/1ps //Adjust to suit

module second_backcounter_tb;

reg         clk        ;
reg         rst_n      ;
reg         mode       ;
reg         pulse      ;
wire        timeout    ;
wire  [5:0] sec_count  ;

second_backcounter #(.T(6'd10),.t(6'd5)) uut (
    .clk        (    clk        ),
    .rst_n      (    rst_n      ),
    .mode       (    mode       ),
    .pulse      (    pulse      ),
    .timeout    (    timeout    ),
    .sec_count  (    sec_count  )
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
    mode = 1;
    pulse = 1;
    #(PERIOD*10);
end
endmodule
