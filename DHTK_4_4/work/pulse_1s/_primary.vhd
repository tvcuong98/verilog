library verilog;
use verilog.vl_types.all;
entity pulse_1s is
    port(
        clk             : in     vl_logic;
        rst_p           : in     vl_logic;
        pause           : in     vl_logic;
        pulse           : out    vl_logic
    );
end pulse_1s;
