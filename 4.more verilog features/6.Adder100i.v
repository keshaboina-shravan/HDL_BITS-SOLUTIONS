module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    add a1(.a(a[0]),.b(b[0]),.s(sum[0]),.c(cin),.co(cout[0]));
    generate
        for( i=1 ; i<100 ; i=i+1) 
            begin:full_adder_block
            add fa(.a(a[i]),.b(b[i]),.s(sum[i]),.c(cout[i-1]),.co(cout[i]));
            end
     endgenerate

endmodule
module add(a,b,c,s,co);
                input a,b,c;
                output s,co;
                assign s = a^b^c;
                assign co = a&b|b&c|c&a;
            endmodule
