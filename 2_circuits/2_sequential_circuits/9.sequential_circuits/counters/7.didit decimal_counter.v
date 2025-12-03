 module top_module(
    input  logic       clk,
    input  logic       reset,
    output logic [15:0] q,     // 4-digit BCD output
    output logic [3:1] ena     // enable for digits [3:1]
);

    // Each digit: q[3:0] = ones, q[7:4] = tens, q[11:8] = hundreds, q[15:12] = thousands

    // ----- Ones Digit -----
    always_ff @(posedge clk) begin
        if (reset)
            q[3:0] <= 4'd0;
        else if (q[3:0] == 4'd9)
            q[3:0] <= 4'd0;
        else
            q[3:0] <= q[3:0] + 1'b1;
    end

    // Generate carry enable for next digit
    assign ena[1] = (q[3:0] == 4'd9);

    // ----- Tens Digit -----
    always_ff @(posedge clk ) begin
        if (reset)
            q[7:4] <= 4'd0;
        else if (ena[1]) begin
            if (q[7:4] == 4'd9)
                q[7:4] <= 4'd0;
            else
                q[7:4] <= q[7:4] + 1'b1;
        end
    end

    assign ena[2] = ena[1] & (q[7:4] == 4'd9);

    // ----- Hundreds Digit -----
    always_ff @(posedge clk ) begin
        if (reset)
            q[11:8] <= 4'd0;
        else if (ena[2]) begin
            if (q[11:8] == 4'd9)
                q[11:8] <= 4'd0;
            else
                q[11:8] <= q[11:8] + 1'b1;
        end
    end

    assign ena[3] = ena[2] & (q[11:8] == 4'd9);

    // ----- Thousands Digit -----
    always_ff @(posedge clk ) begin
        if (reset)
            q[15:12] <= 4'd0;
        else if (ena[3]) begin
            if (q[15:12] == 4'd9)
                q[15:12] <= 4'd0;
            else
                q[15:12] <= q[15:12] + 1'b1;
        end
    end

endmodule

