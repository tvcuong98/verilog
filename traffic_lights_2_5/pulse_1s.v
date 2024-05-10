module pulse_1s(input clk, output reg pulse);
    parameter MAX_COUNT = 50_000_000; // Assuming 50MHz clock -> 1 second

    reg [25:0] counter; // 26-bit counter for 50 million cycles

    always @(posedge clk) begin
        if (counter == MAX_COUNT) begin
            counter <= 0;
            pulse <= 1; 
        end else begin
            counter <= counter + 1;
            pulse <= 0;
        end
    end
endmodule