module counter(
    input cnt,clk, rst_n,
    output reg [3:0] y
);
    // Định nghĩa các state , có 4 state tương ứng với 1,2,3,4
    localparam s1=2'b00;
    localparam s2=2'b01;
    localparam s3=2'b10;
    localparam s4=2'b11;
    // Định nghĩa các state và nextstate, để lưu các state trong lúc chuyển
    reg [1:0] state, nextstate;
    always @(cnt, state)
    begin
        case (state)
            s1: begin
                if (cnt) nextstate = s2;
                else nextstate=s1;
                y <= 4'b0001;
            end
            s2: begin
                if (cnt) nextstate = s3;
                else nextstate = s2;
                y = 4'b0010;
            end
            s3: begin
                if (cnt) nextstate = s4;
                else nextstate = s3;
                y = 4'b0100;
            end
            s4: begin
                if (cnt) nextstate = s1;
                else nextstate = s4;
                y = 4'b1000;
            end
        endcase
    end
    always @(posedge clk or negedge rst_n)
        // mô tả flip-flop lưu trạng thái
    begin
        if (!rst_n)
            state <= s1;
        else
            state <= nextstate;
    end
endmodule