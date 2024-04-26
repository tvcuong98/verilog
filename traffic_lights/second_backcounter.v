module second_backcounter
#(
    parameter T = 6'd10, 
    parameter t = 6'd5
 )
(
    input clk, 
    input rst_n, 
    input mode,
    input pulse, 
    output reg timeout, 
    output reg [5:0] sec_count
);
    reg [5:0] maxtime = 6'd10 ; // this is 10 sec
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
                if (sec_count > 0) begin 
                    sec_count <= sec_count - 1'b1;
                    timeout <= 0;
                end else begin
                    sec_count <= maxtime;
                    timeout<= 1;
                end
            end
        end
    end

endmodule