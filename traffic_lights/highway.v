module highway(
    input sensor,
    input timeout,
    input clk,rst_n,
    output reg enable_countryroad,
    output reg [2:0] highway_led,
    output reg mode
);
    localparam s0= 2'b00; // den highway dang xanh, trong thoi gian T
    localparam s1= 2'b01; // den highway dang vang, trong thoi gian t
    localparam s2 = 2'b10; // den highway dang do, trong thoi gian T
    localparam s3 = 2'b11; // den highway van dang do, trong luc cho countryroad vang trong thoi gian t

    reg [1:0] state, nextstate;
    always @(sensor,timeout,state) begin
        case (state)
            s0: begin
                if ({sensor,timeout}==2'b11)
                    nextstate = s1;
                else nextstate = s0;
                highway_led = 3'b100;
                enable_countryroad = 0;
                mode = 0;
            end
            s1: begin
                if ({sensor,timeout}==2'b11 || {sensor,timeout}==2'b01)
                    nextstate = s2;
                else nextstate = s1;
                highway_led = 3'b010;
                enable_countryroad = 0;
                mode = 1;
            end
            s2: begin
                if ({sensor,timeout}==2'b11 || {sensor,timeout}==2'b01)
                    nextstate = s3;
                else nextstate = s2;
                highway_led = 3'b001;
                enable_countryroad = 1;
                mode = 0;
            end
            s3: begin
                if ({sensor,timeout}==2'b11 || {sensor,timeout}==2'b01)
                    nextstate = s0;
                else nextstate = s3;
                highway_led = 3'b001;
                enable_countryroad = 0;
                mode = 1;
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