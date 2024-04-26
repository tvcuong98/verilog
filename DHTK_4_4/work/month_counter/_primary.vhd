library verilog;
use verilog.vl_types.all;
entity month_counter is
    port(
        clk             : in     vl_logic;
        rst_p           : in     vl_logic;
        pulse_0_5s      : in     vl_logic;
        day_tick        : in     vl_logic;
        switch_month    : in     vl_logic;
        month_tick      : out    vl_logic;
        month_fw        : out    vl_logic_vector(1 downto 0);
        month_count     : out    vl_logic_vector(3 downto 0)
    );
end month_counter;
