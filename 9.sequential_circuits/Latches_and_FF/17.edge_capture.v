module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]d;
    always@(posedge clk) begin  
        d <= in;
        if(reset)
            out <= 0;
         else
             out <= out | (d & ~in);
        end
endmodule
