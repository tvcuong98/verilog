module highway(input clk, input sensor, input [3:0] hwy_count, input [3:0] cr_count, output reg [2:0] highway_led);
    parameter T = 10, t = 3; // Example 'T' and 't' 

    always @(posedge clk) begin
        if (hwy_count == T) begin  // Highway green phase ends
            if (sensor == 1) begin 
                highway_led <= 3'b010
            end else begin 
            highway_led <= 3'b100 //no car, stay greed
            end
        end else if (hwy_count > 0 && hwy_count <= t && sensor == 1) begin // Yellow phase
            highway_led <= 3'b010
        end else if (cr_count > 0) begin // Country road green active
            highway_led <= 3'b001
        end else begin  // Highway green 
            highway_led <= 3'b100
        end
    end
endmodule 