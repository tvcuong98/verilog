module alu_non_nested (
    input [7:0] a,
    input [7:0] b,
    input s1,
    input s2,
    output reg [15:0] y
);
    always @(a or b or s1 or s2) begin
        if (s1 == 0) y = a + b; 
        else y = a - b;
        if (s2==0) y=a*b;
        else y = a;
    end

endmodule