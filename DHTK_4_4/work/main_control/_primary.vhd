library verilog;
use verilog.vl_types.all;
entity main_control is
    port(
        clk             : in     vl_logic;
        rst_p           : in     vl_logic;
        pause           : in     vl_logic;
        switch_second   : in     vl_logic;
        switch_minute   : in     vl_logic;
        switch_hour     : in     vl_logic;
        switch_day      : in     vl_logic;
        switch_month    : in     vl_logic;
        switch_year     : in     vl_logic;
        sec             : out    vl_logic_vector(5 downto 0);
        min             : out    vl_logic_vector(5 downto 0);
        hour            : out    vl_logic_vector(4 downto 0);
        day             : out    vl_logic_vector(4 downto 0);
        month           : out    vl_logic_vector(3 downto 0);
        year            : out    vl_logic_vector(11 downto 0)
    );
end main_control;
