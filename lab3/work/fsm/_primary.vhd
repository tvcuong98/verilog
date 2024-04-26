library verilog;
use verilog.vl_types.all;
entity fsm is
    port(
        x               : in     vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        y               : out    vl_logic
    );
end fsm;
