library verilog;
use verilog.vl_types.all;
entity day_counter is
    port(
        clk             : in     vl_logic;
        rst_p           : in     vl_logic;
        pulse_0_5s      : in     vl_logic;
        hour_tick       : in     vl_logic;
        switch_day      : in     vl_logic;
        month_fw        : in     vl_logic_vector(1 downto 0);
        year_fw         : in     vl_logic;
        day_tick        : out    vl_logic;
        day_count       : out    vl_logic_vector(4 downto 0)
    );
end day_counter;
