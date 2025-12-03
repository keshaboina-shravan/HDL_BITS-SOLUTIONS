module top_module (input x, input y, output z);
    wire z1,z2,z3,z4;
    A IA1(x,y,z1);
    A IA2(x,y,z3);
    B IB1(x,y,z2);
    B IB2(x,y,z4);
    wire t1,t2;
    assign t1=z1|z2;
    assign t2=z3&z4;
    assign z=~(t1^t2);

endmodule
module A(input x,y, output z);
    assign z=x^y;
endmodule
module B(input x,y, output z);
    assign z=x&(~y);
endmodule

