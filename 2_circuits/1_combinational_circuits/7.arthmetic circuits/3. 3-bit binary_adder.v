module top_module( 
    input  [2:0] a, b,
    input        cin,
    output [2:0] cout,
    output [2:0] sum
);
    wire [3:0] carry;
    assign carry[0] = cin;

    genvar i;
    generate
        for(i = 0; i < 3; i = i + 1) begin: adder_block
            fa u (
                .a (a[i]),
                .b (b[i]),
                .c (carry[i]),
                .s (sum[i]),
                .co(carry[i+1])
            );
            assign cout[i] = carry[i+1];
        end
    endgenerate      
endmodule

module fa(input a, b, c, output s, co);
    assign s  = a ^ b ^ c;
    assign co = (a & b) | (b & c) | (a & c);
endmodule
