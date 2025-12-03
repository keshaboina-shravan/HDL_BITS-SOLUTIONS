module top_module ( input a, input b, output out );
    mod_a instance1( .out(out), .in1(a), .in2(b) ); // by name 
  //  mod_a inst2 ( a, b, out ); // by position 
endmodule
