module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire c1,c2;
    wire [31:0]b_in;
    assign b_in = sub ? ~(b) : b;
    add16 a1(.a(a[15:0]),.b(b_in[15:0]),.cin(sub),.sum(sum[15:0]),.cout(c1));
    add16 a2(.a(a[31:16]),.b(b_in[31:16]),.cin(c1),.sum(sum[31:16]),.cout(c2));
 // -------------------------------------------------------------------------------------------------------------//                            
// -------------another method ------------------------------------------------//
 /*   wire wire1;
    wire [31:0]b_xor;
    
    assign b_xor = {32{sub}}^b; 
    add16 adder1(a[15:0], b_xor[15:0], sub, result[15:0], wire1);
    add16 adder2(a[31:16], b_xor[31:16], wire1, result[31:16]);
   */ 
endmodule