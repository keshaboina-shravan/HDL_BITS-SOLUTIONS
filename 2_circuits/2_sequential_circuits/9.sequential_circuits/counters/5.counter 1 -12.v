module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

  
 
    wire at_12 = (Q == 4'd12);
    assign c_load   = reset | (at_12 & enable); // Load when reset or counting from 12 to 1
    assign c_enable = enable;                   // Enable for normal counting
    assign c_d      = 4'd1;                     // Load value is always 1 when loading

    // Instantiate provided counter
    count4 the_counter (
        .clk    (clk),
        .enable (c_enable),
        .load   (c_load),
        .d      (c_d),
        .Q      (Q) );
    

endmodule