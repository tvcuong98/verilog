library verilog;
use verilog.vl_types.all;
entity alu_non_nested is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        s1              : in     vl_logic;
        s2              : in     vl_logic;
        y               : out    vl_logic_vector(15 downto 0)
    );
end alu_non_nested;
