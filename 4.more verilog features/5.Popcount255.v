module top_module( 
    input [254:0] in,
    output [7:0] out );
    reg [7:0]count;
    always@(in)begin
        count = 0;
        for(int i=0; i<255;i=i+1)begin
            if(in[i]==1)
                count=count+1'b1;
        else
            count=count;
        end
        out = count;
    end
 ///--------------------------without extra   variable -----------------------------------------///
   /*
   always @(*) begin	// Combinational always block
		out = 0;
		for (int i=0;i<255;i++)
			out = out + in[i];
	end
   */ 
endmodule
