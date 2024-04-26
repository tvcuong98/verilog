library verilog;
use verilog.vl_types.all;
entity majority is
    generic(
        n               : integer := 8
    );
    port(
        x               : in     vl_logic_vector;
        y               : out    vl_logic
    );
end majority;
