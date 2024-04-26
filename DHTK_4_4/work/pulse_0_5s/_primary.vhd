library verilog;
use verilog.vl_types.all;
entity pulse_0_5s is
    port(
        clk             : in     vl_logic;
        rst_p           : in     vl_logic;
        pulse_0_5s      : out    vl_logic
    );
end pulse_0_5s;
