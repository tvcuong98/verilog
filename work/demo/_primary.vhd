library verilog;
use verilog.vl_types.all;
entity demo is
    port(
        data_in         : in     vl_logic_vector(3 downto 0);
        display_out     : out    vl_logic_vector(6 downto 0)
    );
end demo;
