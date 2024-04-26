library verilog;
use verilog.vl_types.all;
entity module_top is
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
        switch          : in     vl_logic;
        disp_reg        : out    vl_logic_vector(55 downto 0)
    );
end module_top;
