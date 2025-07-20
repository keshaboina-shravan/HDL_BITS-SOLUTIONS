module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    // Heater is on when it's too cold and mode is "heating".
    assign heater = (mode && too_cold && (~aircon)); 
    // Aircon is on when it's too hot and mode is not "heating"
    assign aircon = (~(mode) && too_hot && (~heater));
    // Fan should be on when either heater or aircon is on, and also when requested to do so (fan_on = 1).
    assign fan = heater || aircon || fan_on;
    

endmodule
