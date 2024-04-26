library verilog;
use verilog.vl_types.all;
entity display is
    port(
        clk             : in     vl_logic;
        rst_p           : in     vl_logic;
        sec             : in     vl_logic_vector(5 downto 0);
        min             : in     vl_logic_vector(5 downto 0);
        hour            : in     vl_logic_vector(4 downto 0);
        day             : in     vl_logic_vector(4 downto 0);
        month           : in     vl_logic_vector(3 downto 0);
        year            : in     vl_logic_vector(11 downto 0);
        switch          : in     vl_logic;
        display_reg     : out    vl_logic_vector(55 downto 0)
    );
end display;
