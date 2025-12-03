module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
   
    MUXDFF U1(.clk(KEY[0]),.E(KEY[1]),.L(KEY[2]),.w(KEY[3]),.R(SW[3]),.Q(LEDR[3]));
    MUXDFF U2(.clk(KEY[0]),.E(KEY[1]),.L(KEY[2]),.w(LEDR[3]),.R(SW[2]),.Q(LEDR[2]));
    MUXDFF U3(.clk(KEY[0]),.E(KEY[1]),.L(KEY[2]),.w(LEDR[2]),.R(SW[1]),.Q(LEDR[1]));
    MUXDFF U4(.clk(KEY[0]),.E(KEY[1]),.L(KEY[2]),.w(LEDR[1]),.R(SW[0]),.Q(LEDR[0]));
    
endmodule

module MUXDFF (
   input clk,
   input E,
   input L,
   input w,
   input R,
   output Q
);
    always@(posedge clk) begin 
        if(L)
            Q <= R;
       else  begin
           if(E)
            Q <= w;
           else 
              Q <= Q;
        end
      end
endmodule
