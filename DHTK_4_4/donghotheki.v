

module pulse_1s (
  input clk,
  input rst_p,
  input pause,
  output reg pulse
);

  reg [31:0] counter;

  always @(posedge clk or posedge rst_p) begin
    if(rst_p) begin
        counter <= 0;
        pulse <= 0;
    end
    // <them doan pause logic>
    else if (pause) begin
        counter <= 0;
        pulse <= 0;
    end
    // </them doan pause logic>
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
module pulse_0_5s (
  input clk,
  input rst_p,
  output reg pulse_0_5s
);

  reg [31:0] counter_0_5s;

  always @(posedge clk or posedge rst_p) begin
    if(rst_p) begin
        counter_0_5s <= 0;
        pulse_0_5s <= 0;
    end
    else begin
        if(counter_0_5s < 3) begin // neu o day ghi 2 thi tuc la cu sau 3 chu ky clock thi tang 1s
            counter_0_5s <= counter_0_5s + 1;
            pulse_0_5s <= 0;
        end
        else begin
            counter_0_5s <= 0;
            pulse_0_5s <= 1;
        end
    end
  end
endmodule
module second_counter(
    input clk, 
    input rst_p, 
    input pulse, 
    input pulse_0_5s,
    input switch_second, 
    output reg sec_tick, 
    output reg [5:0] sec_count
);

    
    always @(posedge clk or posedge rst_p) begin
        if (rst_p) begin
            sec_count <= 0;
            sec_tick <= 0;
        end 
        else begin
            if (switch_second) begin
                if (pulse_0_5s) begin
                    if (sec_count < 6'b111011) begin 
                        sec_count <= sec_count + 1'b1;
                    end else begin
                        sec_count <= 0;
                    end
                end
            end
            
            if (pulse) begin
                if (sec_count < 6'b111011) begin 
                    sec_count <= sec_count + 1'b1;
                    sec_tick <= 0;
                end else begin
                    sec_count <= 0;
                    sec_tick <= 1'b1;
                end
            end
        end
    end

endmodule


module minute_counter(input clk, input rst_p, input pulse_0_5s, input sec_tick, input switch_minute, output reg min_tick, output reg [5:0] min_count);
    reg prev_sec_tick;
    always@(posedge clk or posedge rst_p) begin
        if(rst_p) begin 
            min_count <= 0;
            min_tick <= 0;
            prev_sec_tick <= 0;
        end
        else begin
            // <them logic cho switch_minute>
            if (switch_minute) begin
                if (pulse_0_5s) begin
                    if(min_count < 6'b111011) begin
                        min_count <= min_count + 1'b1;
                    end
                    else begin
                        min_count <= 0;     
                    end
                end
            end
            // </them logic cho switch_minute>
            min_tick <= 0;
            prev_sec_tick <= sec_tick;
            if(sec_tick && !prev_sec_tick) begin
                if(min_count < 6'b111011) begin
                    min_count <= min_count + 1'b1;
                end
                else begin
                    min_count <= 0;
                    min_tick <= 1'b1;        
                end
            end
        end
        end
endmodule


module hour_counter(input clk, input rst_p, input pulse_0_5s, input min_tick, input switch_hour, output reg hour_tick, output reg [4:0] hour_count);
    reg prev_min_tick;
    always@(posedge clk or posedge rst_p) begin
        if(rst_p) begin 
            hour_count <= 0;
            hour_tick <= 0;
            prev_min_tick <= 0;
        end
        else begin
            // <them logic cho switch_hour>
            if (switch_hour) begin
                if (pulse_0_5s) begin
                    if(hour_count < 5'b10111) begin
                        hour_count <= hour_count + 1'b1;
                    end
                    else begin
                        hour_count <= 0;
                        hour_tick <= 1'b1;        
                    end
                end
            end
            // </them logic cho switch_hour>
            hour_tick <= 0;
            prev_min_tick <= min_tick;
            if(min_tick && !prev_min_tick) begin
                if(hour_count < 5'b10111) begin
                    hour_count <= hour_count + 1'b1;
                end
                else begin
                    hour_count <= 0;
                    hour_tick <= 1'b1;        
                end
            end
        end
        end
endmodule


module day_counter(input clk, input rst_p, input pulse_0_5s, input hour_tick, input switch_day, input [1:0] month_fw, input year_fw, output reg day_tick, output reg [4:0] day_count);
    reg prev_hour_tick;
    always@(posedge clk or posedge rst_p) begin
        if(rst_p) begin
            day_count <= 1;
            day_tick <= 0;
            prev_hour_tick <= 0;
        end
        else begin
            // <them logic cho switch_day>
            if (switch_day) begin
                if (pulse_0_5s) begin
                    if(day_count < 5'b11111) begin
                        day_count <= day_count + 1'b1;
                    end 
                    else begin
                        day_count <= 1;
                    end
                end
            end
            // </them logic cho switch_day>
            day_tick <= 0;
            prev_hour_tick <= hour_tick;
            if(hour_tick && !prev_hour_tick) begin
                case(month_fw)
                2'b00 : begin
                    if(day_count < 5'b11111) begin
                        day_count <= day_count + 1'b1;
                        
                    end 
                    else begin
                        day_count <= 1;
                        day_tick <= 1'b1;
                    end
                end
                2'b01 : begin
                    if(year_fw) begin
                        if(day_count < 5'b11101) begin
                        day_count <= day_count + 1'b1;
                    end 
                    else begin
                        day_count <= 1;
                        day_tick <= 1'b1;
                    end
                    end
                    else begin
                        if(day_count < 5'b11100) begin
                        day_count <= day_count + 1'b1;
                    end 
                    else begin
                        day_count <= 1;
                        day_tick <= 1'b1;
                    end
                    end
                end
                default: begin
                    if(day_count < 5'b11110) begin
                        day_count <= day_count + 1'b1;
                    end
                    else begin
                        day_count <= 1;
                        day_tick <= 1;
                    end
                end
            endcase  
            end
        end
    end
endmodule


module month_counter(input clk, input rst_p, input pulse_0_5s,input day_tick, input switch_month, output reg month_tick, output reg [1:0] month_fw, output reg [3:0] month_count);
    
    reg prev_day_tick;
    always@(posedge clk or posedge rst_p) begin
        if(rst_p) begin
            month_count <= 1;
            month_tick <= 0;
            prev_day_tick <= 0;
        end
        else begin
            // <them logic cho switch_month>
            if (switch_month) begin
                if (pulse_0_5s) begin
                    if(month_count < 4'b1100) begin
                        month_count <= month_count + 1'b1;
                    end
                    else begin
                        month_count <= 1;
                    end
                end
            end
            // </them logic cho switch_month>
            month_tick <= 0;
            prev_day_tick <= day_tick;
            if(day_tick && !prev_day_tick) begin
                if(month_count < 4'b1100) begin
                    month_count <= month_count + 1'b1;
                end
                else begin
                    month_count <= 1;
                    month_tick <= 1;
                end
            end
        end
    end
	always @(month_count) begin
        // Set month_fw based on the month value
    case(month_count)
        4'b0001, 4'b0011, 4'b0101, 4'b0111, 4'b1000, 4'b1010, 4'b1100: 
            month_fw <= 2'b00; // Months with 31 days
        4'b0100, 4'b0110, 4'b1001, 4'b1011: 
            month_fw <= 2'b10; // Months with 30 days
        4'b0010: 
            month_fw <= 2'b01; // February
        default: 
            month_fw <= 2'b11; // Default to 31 days if none of the above
    endcase
end
endmodule


module year_counter(input clk, input rst_p, input pulse_0_5s,input month_tick, input switch_year, output reg [11:0] year_count, output reg year_fw);
    reg prev_month_tick;
    // <them 1 so bien phuc vu cho switch_year>
    reg temp_switch;
    reg increase;
    always @(posedge clk or negedge rst_p) begin
        temp_switch <= switch_year;
    end
    always @(posedge clk) begin
        if (temp_switch!=switch_year) increase <=1;
        else increase <= 0;
    end
    // </them 1 so bien phuc vu cho switch_year>
    always@(posedge clk or posedge rst_p) begin
        if(rst_p) begin
            year_count <= 1965; 
            prev_month_tick <= 0;
        end 
        else begin
            // <them logic cho switch_year>
            if (switch_year) begin
                if (pulse_0_5s) begin
                    if(year_count > 4095) begin 
                        year_count <= 1965;
                    end
                    else begin
                        year_count <= year_count + 1'b1;   
                    end
                end 
            end
            // </them logic cho switch_year>
            prev_month_tick <= month_tick;
            if(month_tick && !prev_month_tick) begin
                if(year_count > 4095) begin 
                    year_count <= 1965;
                end
                else begin
                    year_count <= year_count + 1'b1;   
                end 
        end
    end
    end
    always @(year_count) begin
        if(year_count[1:0] == 2'b00) year_fw <= 1;
        else year_fw <= 0;
    end
endmodule




