library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        cnt             : in     vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        y               : out    vl_logic_vector(3 downto 0)
    );
end counter;
