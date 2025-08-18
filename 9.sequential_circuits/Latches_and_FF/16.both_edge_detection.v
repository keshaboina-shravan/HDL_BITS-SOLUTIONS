module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0]d;
    always@(posedge clk)begin
        d <= in ;
    anyedge <= d ^ in ; // as xor is 1 for 01,10 inputs 
    end

endmodule