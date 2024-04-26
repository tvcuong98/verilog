library verilog;
use verilog.vl_types.all;
entity year_counter is
    port(
        clk             : in     vl_logic;
        rst_p           : in     vl_logic;
        pulse_0_5s      : in     vl_logic;
        month_tick      : in     vl_logic;
        switch_year     : in     vl_logic;
        year_count      : out    vl_logic_vector(11 downto 0);
        year_fw         : out    vl_logic
    );
end year_counter;
