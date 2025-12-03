module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );


    wire [99:0] carry;  // Intermediate carries between the digits

    genvar i;
    generate
        for (i = 0; i < 100; i++) begin : bcd_adders
            if (i == 0) begin
                bcd_fadd u_bcd_fadd (
                    .a   (a[i*4 +: 4]),
                    .b   (b[i*4 +: 4]),
                    .cin (cin),
                    .sum (sum[i*4 +: 4]),
                    .cout(carry[i])
                );
            end
            else begin
                bcd_fadd u_bcd_fadd (
                    .a   (a[i*4 +: 4]),
                    .b   (b[i*4 +: 4]),
                    .cin (carry[i-1]),
                    .sum (sum[i*4 +: 4]),
                    .cout(carry[i])
                );
            end
        end
    endgenerate

    assign cout = carry[99];

endmodule

