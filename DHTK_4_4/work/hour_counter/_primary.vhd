library verilog;
use verilog.vl_types.all;
entity hour_counter is
    port(
        clk             : in     vl_logic;
        rst_p           : in     vl_logic;
        pulse_0_5s      : in     vl_logic;
        min_tick        : in     vl_logic;
        switch_hour     : in     vl_logic;
        hour_tick       : out    vl_logic;
        hour_count      : out    vl_logic_vector(4 downto 0)
    );
end hour_counter;
