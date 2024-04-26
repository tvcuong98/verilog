module adder(
    input [3:0] a,b,
    output [4:0] s,
    output co
);
    assign {co,s} = a + b;
endmodule

