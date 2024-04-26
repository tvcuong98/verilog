library verilog;
use verilog.vl_types.all;
entity BCD27seg_topmodule is
    port(
        x0              : in     vl_logic_vector(3 downto 0);
        x1              : in     vl_logic_vector(3 downto 0);
        x2              : in     vl_logic_vector(3 downto 0);
        x3              : in     vl_logic_vector(3 downto 0);
        seg0            : out    vl_logic_vector(6 downto 0);
        seg1            : out    vl_logic_vector(6 downto 0);
        seg2            : out    vl_logic_vector(6 downto 0);
        seg3            : out    vl_logic_vector(6 downto 0)
    );
end BCD27seg_topmodule;
