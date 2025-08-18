module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk) begin
        if(reset || q == 4'b1001) // if q = 9 or reset is high then count will be zero  
            q <= 0 ;
        else                       // else count will increse this counts the values from 0 to 9 
            q <= q + 1'b1;
    end
endmodule