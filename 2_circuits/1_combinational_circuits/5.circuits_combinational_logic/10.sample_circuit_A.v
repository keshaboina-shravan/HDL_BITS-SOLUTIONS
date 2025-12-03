module top_module (input x, input y, output z);
    assign z=x &(~y); // solved (x^y)&x like (x'y+xy')x = x.x'.y +x.x.y' (x.x'=0) => then z =x.y';

endmodule
