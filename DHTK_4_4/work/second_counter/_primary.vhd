library verilog;
use verilog.vl_types.all;
entity second_counter is
    port(
        clk             : in     vl_logic;
        rst_p           : in     vl_logic;
        pulse           : in     vl_logic;
        pulse_0_5s      : in     vl_logic;
        switch_second   : in     vl_logic;
        sec_tick        : out    vl_logic;
        sec_count       : out    vl_logic_vector(5 downto 0)
    );
end second_counter;
