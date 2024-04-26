library verilog;
use verilog.vl_types.all;
entity test_module is
    generic(
        CLK_PERIOD      : integer := 1
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_PERIOD : constant is 1;
end test_module;
