// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
  /*  always@(*) begin 
    up = 0 ; down =0 ;left =0 ;right = 0;
        case(scancode)
       16'he06b:begin
           left=1 ;up =0;down=0;right=0;
       end
       16'he072:begin
           left= 0;up =0;down=1;right=0;
       end
       16'he074	:begin
            left=0 ;up =0;down=0;right=1;
           end 
       16'he075	:begin
           left=0;up =1;down=0;right=0; 
       end
         default:begin
              left=0 ;up =0;down=0;right=0;
         end
        endcase
    end */
     always@(*) begin 
    up = 0 ; down =0 ;left =0 ;right = 0;
         case(scancode)
16'he06b:left =1;
16'he072:down =1;
16'he074:right =1;
16'he075:up =1;
default:begin
   left=0 ;up =0;down=0;right=0;
    end
             endcase
     end
endmodule
