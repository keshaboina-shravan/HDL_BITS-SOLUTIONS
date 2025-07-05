module top_module ( input clk, input d, output q );
    // ******************** by name ********************** //
    wire w1,w2;
    my_dff a1(.clk(clk),.d(d),.q(w1));
    my_dff a2(.clk(clk),.d(w1),.q(w2));
    my_dff a3(.clk(clk),.d(w2),.q(q));
    // ***************** by position ******************  //
/*
	wire a, b;	// Create two wires. I called them a and b.

	// Create three instances of my_dff, with three different instance names (d1, d2, and d3).
	// Connect ports by position: ( input clk, input d, output q)
	my_dff d1 ( clk, d, a );
	my_dff d2 ( clk, a, b );
	my_dff d3 ( clk, b, q );
    
 */

endmodule
