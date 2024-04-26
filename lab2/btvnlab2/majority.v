module majority #(parameter n=8) (
    input [n-1:0] x,
    output reg y
);

    reg [($clog2(n)-1):0] cnt;
    integer i;
    always @ (x) begin
        cnt = 0;
        for (i = 0; i < n; i = i + 1) begin
            if (x[i]) cnt = cnt + 1;
        end
        y = (cnt >= n/2) ? 1 : 0;
    end

endmodule