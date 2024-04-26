module countryroad(
    input enable_countryroad,
    input timeout, 
    input clk,rst_n,
    output reg [2:0] countryroad_led
);
    localparam s0= 2'b00; // den country dang do, trong thoi gian T
    localparam s2= 2'b10; // den country sang xanh, trong thoi gian T
    localparam s3 = 2'b11; // den country dang vang, trong thoi gian t

    reg [1:0] state, nextstate;
    always @(enable_countryroad,timeout,state) begin
        case (state)
            s0: begin
                if ({enable_countryroad,timeout}==2'b11)
                    nextstate = s2;
                else nextstate = s0;
                countryroad_led = 3'b001;
            end
            s2: begin
                if ({enable_countryroad,timeout}==2'b11 || {enable_countryroad,timeout}==2'b01)
                    nextstate = s3;
                else nextstate = s2;
                countryroad_led = 3'b100;
            end
            s3: begin
                if ({enable_countryroad,timeout}==2'b11 || {enable_countryroad,timeout}==2'b01)
                    nextstate = s0;
                else nextstate = s3;
                countryroad_led = 3'b010;
            end
        endcase
    end
    always @(posedge clk or negedge rst_n)
        // mô tả flip-flop lưu trạng thái
    begin
        if (!rst_n)
            state <= s0;
        else
            state <= nextstate;
    end
endmodule