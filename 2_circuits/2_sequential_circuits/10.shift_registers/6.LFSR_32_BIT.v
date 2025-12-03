module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    wire f1,f2,f3;
    assign f1 = q[22]^q[0];
    assign f2 = q[2]^q[0];
    assign f3 = q[1]^q[0];
    always@(posedge clk) begin     
        if(reset)
            q <= 32'h1;
        else 
            q <= {q[0],q[31:23],f1,q[21:3],f2,f3};
    end

endmodule
