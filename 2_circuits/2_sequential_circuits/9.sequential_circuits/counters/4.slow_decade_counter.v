module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always@(posedge clk) begin
        if(reset) // if q = 9 or reset is high then count will be zero  
            q <= 0 ;
        else if(slowena) begin
            if(q==9)
                q <= 0;
            else 
             q <= q + 1'b1;
        end
    end
endmodule