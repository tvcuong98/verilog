library verilog;
use verilog.vl_types.all;
entity top_module is
    port(
        clk             : in     vl_logic;
        data_in         : in     vl_logic_vector(15 downto 0);
        display_out     : out    vl_logic_vector(27 downto 0)
    );
end top_module;
