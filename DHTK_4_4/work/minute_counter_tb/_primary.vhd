library verilog;
use verilog.vl_types.all;
entity minute_counter_tb is
    generic(
        CLK_PERIOD      : integer := 2
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_PERIOD : constant is 1;
end minute_counter_tb;
