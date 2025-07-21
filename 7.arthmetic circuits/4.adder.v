module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [4:0] carry;
    assign carry[0] = 0 ;
    assign sum[0] = x[0] ^ y[0] ^ carry [0] ;
    assign carry[1] = x[0]& y[0] | y[0]&carry[0] | carry[0]& x[0];

    genvar i;
    generate
        for(i = 1; i < 4; i = i + 1) begin: adder_block
            fa u (
                .a (x[i]),
                .b (y[i]),
                .c (carry[i]),
                .s (sum[i]),
                .co(carry[i+1])
            );
            assign sum[4] = carry[4];
        end
    endgenerate      
endmodule

module fa(input a, b, c, output s, co);
    assign s  = a ^ b ^ c;
    assign co = (a & b) | (b & c) | (a & c);
endmodule
// This circuit is a 4-bit ripple-carry adder with carry-out.
	//  assign sum = x+y;	// Verilog addition automatically produces the carry-out bit.

	// Verilog quirk: Even though the value of (x+y) includes the carry-out, (x+y) is still considered to be a 4-bit number (The max width of the two operands).
	// This is correct:
	// assign sum = (x+y);
	// But this is incorrect:
	// assign sum = {x+y};	// Concatenation operator: This discards the carry-out

