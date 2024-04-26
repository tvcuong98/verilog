module second_backcounter(
    input clk, 
    input rst_n, 
    input mode,
    input pulse, 
    output reg timeout, 
    output reg [5:0] sec_count
);
    reg [5:0] maxtime = 6'b001010 ; // this is 10 sec
    localparam T = 6'b001010; // this is 10 sec
    localparam t = 6'b000101;// this is 5 sec
    always @(mode) begin
        case(mode)
            0: begin
                maxtime = T;
            end
            1: begin
                maxtime = t;
            end
        endcase
    end
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            sec_count <= 0;
            timeout <=0;
        end 
        else begin
            if (pulse) begin
                if (sec_count < maxtime) begin 
                    sec_count <= sec_count + 1'b1;
                    timeout <= 0;
                end else begin
                    sec_count <= 0;
                    timeout<= 1;
                end
            end
        end
    end

endmodule