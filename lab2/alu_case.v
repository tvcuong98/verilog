module alu_case (
    input [7:0] a,
    input [7:0] b,
    input s1,
    input s2,
    output reg [15:0] y
);
    always @(a or b or s1 or s2) begin
        case({s1,s2})
            2'b0?: y=a+b; // tai sao khi 00 voi 01 deu roi vao truong hop default -> ly do la vi dung case thay vi casex casez, khi dung case thi phai specify dung tung bit ra
            2'b10: y=a-b;
            2'b11: y=a*b;
            default: y = 16'd0;
        endcase
    end

endmodule