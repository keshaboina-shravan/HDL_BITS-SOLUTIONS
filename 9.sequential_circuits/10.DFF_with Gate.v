module top_module (
    input clk,
    input in, 
    output out);
    wire w;
    always@(posedge clk) begin
        out <= in ^ out; 
      
    end
endmodule
