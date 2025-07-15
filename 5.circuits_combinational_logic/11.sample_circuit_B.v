module top_module ( input x, input y, output z );
    // given wave form is like 
      // x y z
      // 0 0 1
      // 0 1 0
      // 1 0 0
      // 1 1 1
   // it is truth table of xnor gate
    assign z = ~(x^y);
endmodule