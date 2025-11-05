module top_module (
    input clk,
    input reset,
    input ena,         // Pulse: increment clock, once per second
    output reg pm,     // 0 for AM, 1 for PM
    output reg [7:0] hh, // Hours: [7:4]=tens, [3:0]=ones, BCD 01-12
    output reg [7:0] mm, // Minutes: BCD 00-59
    output reg [7:0] ss  // Seconds: BCD 00-59
);

// Sequential logic: all counters tick ONLY when ena goes high
always @(posedge clk) begin
    if (reset) begin
        // Synchronous reset: set to 12:00:00 AM
        ss <= 8'h00;
        mm <= 8'h00;
        hh <= 8'h12;
        pm <= 0;
 end else if (ena) begin
        // --------- Seconds counter: 0-59 (BCD) ---------
        if (ss == 8'h59) begin         // 59 -> 00, increment minute next
            ss <= 8'h00;   
            // --------- Minutes counter: 0-59 (BCD) ---------
            if (mm == 8'h59) begin     // 59 -> 00, increment hour next
                mm <= 8'h00;
                // --------- Hours counter: 01-12 (BCD) ---------
                if (hh == 8'h12) begin // 12 -> 01, toggle pm
                    hh <= 8'h01;
                   // pm <= ~pm;         // Toggle AM/PM at 12 rollover
                end else if (hh == 8'h11) begin // 11->12, toggle pm next time
                    hh <= 8'h12;
                          pm <= ~pm;
                    // AM/PM stays the same; toggled only when hh==12 goes to 1
                end else if (hh[3:0] == 4'h9) begin // 09->10, handle BCD increment
                    hh[3:0] <= 4'h0;
                    hh[7:4] <= hh[7:4] + 4'h1;
                end else begin
                    hh <= hh + 8'h01; // Normal BCD increment
                end
            end else if (mm[3:0] == 4'h9) begin // 09->10, BCD
                mm[3:0] <= 4'h0;
                mm[7:4] <= mm[7:4] + 4'h1;
            end else begin
                mm <= mm + 8'h01; // Normal increment
            end
        end else if (ss[3:0] == 4'h9) begin // 09->10 in seconds
            ss[3:0] <= 4'h0;
            ss[7:4] <= ss[7:4] + 4'h1;
        end else begin
            ss <= ss + 8'h01; // Normal increment
        end
    end
    // When ena=0, counters hold value
end
endmodule
 
