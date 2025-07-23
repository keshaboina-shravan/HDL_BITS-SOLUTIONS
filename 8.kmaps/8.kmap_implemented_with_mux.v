module top_module (
    input c,
    input d,
    output [3:0] mux_in
    ); 
    assign mux_in[0] = c | d ;  // ad(00) = 0,1,1,1 (or gate of c and d)
    assign mux_in[1] = 0 ;  // ad(01) = 0,0,0,0 (output is 0)
    assign mux_in[2] = ~(d );  // ad(00) = 1,0,1,0 (xnor gate of c and d)
    assign mux_in[3] = c & d ;  // ad(00) = ,0,0,0,1 (and gate of c and d)
 /*   assign mux_in[0] = c ? 1 : d;          // 1 mux:   c|d
	assign mux_in[1] = 0;                  // No muxes:  0
	assign mux_in[2] = d ? 0 : 1;          // 1 mux:    ~d
	assign mux_in[3] = c ? d : 0;          // 1 mux:   c&d
	*/
    
    
endmodule