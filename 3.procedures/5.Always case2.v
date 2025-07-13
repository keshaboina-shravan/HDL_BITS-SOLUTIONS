module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always@(*) begin
        if(in[0]==1'b1)
            pos = 0 ;
        else if(in[1]==1'b1)
            pos = 1;
        else if (in[2]==1'b1)
            pos = 2;
        else if(in[3]== 1'b1)
            pos = 3;
        else
            pos = 0;
    end
//-----------------------------or-----------------------------------------------------//
 /*   always @(*) begin			// Combinational always block
		case (in)
			4'h0: pos = 2'h0;	// I like hexadecimal because it saves typing. 0000
            4'h1: pos = 2'h0;   // 000[1]
            4'h2: pos = 2'h1;     // 00[1]0
            4'h3: pos = 2'h0;       // 001[1] same as parity 1 
            4'h4: pos = 2'h2;         // 0[1]00  
            4'h5: pos = 2'h0;           // 010[1]
            4'h6: pos = 2'h1;             // 01[1]0 
            4'h7: pos = 2'h0;               // 011[1]
            4'h8: pos = 2'h3;                 //[1]000
            4'h9: pos = 2'h0;                   //100[1]
			4'ha: pos = 2'h1;                     // 10[1]0
			4'hb: pos = 2'h0;                       //  101[1]
			4'hc: pos = 2'h2;                         // 1[1]00
			4'hd: pos = 2'h0;                           // 110[1]
			4'he: pos = 2'h1;                            // 11[1]0
            4'hf: pos = 2'h0;                             // 111[1]   
			default: pos = 2'b0;	// Default case is not strictly necessary because all 16 combinations are covered.
		endcase
	end
	
	// There is an easier way to code this. See the next problem (always_casez).
	
*/
endmodule
