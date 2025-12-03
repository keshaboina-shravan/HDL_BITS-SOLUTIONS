module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0]q;
   
    always@(posedge clk) begin
        if(~resetn) begin 
            out <= 1'b0;
            q <= 3'b0;
        end
         else begin 
             q[0] <= in;
             q[1] <= q[0];
             q[2] <= q[1];
             out <= q[2];
         end
    end
    /*////////////////// another type somthing similar ///////////
    reg [3:0] sr;
	
	// Create a shift register named sr. It shifts in "in".
	always @(posedge clk) begin
		if (~resetn)		// Synchronous active-low reset
			sr <= 0;
		else 
			sr <= {sr[2:0], in};
	end
	
	assign out = sr[3];		// Output the final bit (sr[3])
*/
endmodule
