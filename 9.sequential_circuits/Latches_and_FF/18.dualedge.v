module top_module (
    input clk,
    input d,
    output q
);
    reg q1,q2;
    always@(posedge clk)begin
        q1 <= q2^d;
    end
    always@(negedge clk)begin
        q2 <= q1^d;
    end
     // Why does this work? 
    // After posedge clk, q1 changes to d^q1. Thus q = (q1^q2) = (d^q2^q2) = d.
    // After negedge clk, q2 changes to d^q2. Thus q = (q1^q2) = (d^q1^q1) = d.
    // At each (positive or negative) clock edge, p and n FFs alternately
    // load a value that will cancel out the other and cause the new value of d to remain.
    assign q = q1^q2; 
endmodule