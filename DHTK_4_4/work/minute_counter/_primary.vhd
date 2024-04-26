library verilog;
use verilog.vl_types.all;
entity minute_counter is
    port(
        clk             : in     vl_logic;
        rst_p           : in     vl_logic;
        pulse_0_5s      : in     vl_logic;
        sec_tick        : in     vl_logic;
        switch_minute   : in     vl_logic;
        min_tick        : out    vl_logic;
        min_count       : out    vl_logic_vector(5 downto 0)
    );
end minute_counter;
