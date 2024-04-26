module pulse_1s (
  input clk,
  input rst_n,
  output reg pulse
);

  reg [31:0] counter;

  always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        counter <= 0;
        pulse <= 0;
    end
    else begin
        if(counter < 9) begin // neu o day ghi 2 thi tuc la cu sau 3 chu ky clock thi tang 1s
            counter <= counter + 1;
            pulse <= 0;
        end
        else begin
            counter <= 0;
            pulse <= 1;
        end
    end
  end
endmodule