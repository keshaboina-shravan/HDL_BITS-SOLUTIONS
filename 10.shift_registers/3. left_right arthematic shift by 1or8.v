module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg signed [63:0] q); //  the answer is here if we use (>>>) arthematic right operator the variable should be signed variable
    always@(posedge clk) begin 
        if(load)
            q <= data;
        else if (ena) begin
        case (amount)
            2'b00: q <= q << 1;    // shift left by 1
            2'b01: q <= q << 8;    // shift left by 8
            2'b10: q <= q >>> 1;   // shift right arithmetic by 1
            2'b11: q <= q >>> 8;   // shift right arithmetic by 8
        endcase
    end   
   end
endmodule
