`timescale 1ps/1ps
module tb_alu_casex();
    reg [7:0] atb;
    reg [7:0] btb;
    reg s1tb;
    reg s2tb;
    wire[15:0] ytb;

    alu_casex duv(
        .a(atb),
        .b(btb),
        .s1(s1tb),
        .s2(s2tb),
        .y(ytb)
    );

    // Generate input randomly
    initial begin
        atb=8'b00001010;
        btb=8'b00000101;
        #1
        s1tb=0;
        s2tb=0;
        #2;
        atb=8'b00001010;
        btb=8'b00000101;
        s1tb=0;
        s2tb=1;
        #2;
        atb=8'b00001010;
        btb=8'b00000101;
        s1tb=1;
        s2tb=0;
        #2;
        atb=8'b00001010;
        btb=8'b00000101;
        s1tb=1;
        s2tb=1;
        #2;
    end

endmodule
