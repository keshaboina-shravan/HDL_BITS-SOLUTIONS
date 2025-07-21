module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    wire [100:0]carry;
    assign carry[0] = cin;
     genvar i;
    generate
        for(i = 0; i < 100; i = i + 1) begin: adder_block
            fa u (
                .a (a[i]),
                .b (b[i]),
                .c (carry[i]),
                .s (sum[i]),
                .co(carry[i+1])
            );
            assign cout = carry[100];
        end
    endgenerate      
endmodule

module fa(input a, b, c, output s, co);
    assign s  = a ^ b ^ c;
    assign co = (a & b) | (b & c) | (a & c);
endmodule
/////////////////////simple way to write code //////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The concatenation {cout, sum} is a 101-bit vector.
//	assign {cout, sum} = a+b+cin;
