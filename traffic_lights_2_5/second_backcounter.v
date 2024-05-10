module second_backcounter(input clk, input pulse_1s, input rst_n, output reg [3:0] count); 
    parameter T = 10; // Example 'T' value (configure as needed)

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= T;  
        end else if (pulse_1s) begin
            if (count == 0) count <= T; 
            else count <= count - 1; 
        end
    end
endmodule