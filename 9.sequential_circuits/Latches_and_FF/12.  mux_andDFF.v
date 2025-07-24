module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always@(posedge clk) begin 
        if(L)
         	Q <= R;
        else begin
            if(E)
                Q <= w ;
            else 
                Q <= Q ;
        end
    end
 ////////////////////////////////////////////////////////////////////////////////////////////////////
    /* 
    wire [1:0] con;
    assign con = {E,L};
	always @ (posedge clk) begin
        case (con)
            2'b00 : Q <= Q;
            2'b01 : Q <= R;
			2'b10 : Q <= w;
            2'b11 : Q <= R;        
        endcase    
    end */
///////////////////////////////////////////////////////////////////////////////////////////////////////
endmodule
