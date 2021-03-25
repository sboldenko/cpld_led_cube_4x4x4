module top_cpld_xc2c64a
(
    input  clk,
    input  mode_selector_in,
    input  light_selector_in,
    output resetn_cube,
    output mode_selector_out,
    output light_selector_out
);
	
    wire reset;
    wire clk_low;
    wire mode_selector_pulse;	
    wire light_selector_pulse;	
    wire mode_selector_pulse_delayed;	
    wire light_selector_pulse_delayed;	
    
    low_frequency_clk_generator low_frequency_clk_generator_inst 
    (
        .reset(reset),
        .clk_high(clk), 
        .clk_low(clk_low)
    );
    
    reset_module reset_module_inst 
    (
        .clk(clk), 
        .reset(reset)
    );
    
    debouncer debouncer_mode_selector_inst 
    (
        .clk_high(clk), 
        .clk_low(clk_low), 
        .in_pulse(mode_selector_in), 
        .out_pulse(mode_selector_pulse)
    );
    
    debouncer debouncer_light_selector_inst 
    (
        .clk_high(clk), 
        .clk_low(clk_low), 
        .in_pulse(light_selector_in), 
        .out_pulse(light_selector_pulse)
    );
    
    pulse_delayer pulse_delayer_mode_selector_inst  
    (
        .clk(clk),
        .reset(reset),		
        .pulse_in(mode_selector_pulse), 
        .pulse_out(mode_selector_pulse_delayed)
    );
     
    pulse_delayer pulse_delayer_light_selector_inst  
    (
        .clk(clk),
        .reset(reset),		
        .pulse_in(light_selector_pulse), 
        .pulse_out(light_selector_pulse_delayed)
    );
    
    assign mode_selector_out = ~mode_selector_pulse_delayed;
    assign light_selector_out = ~light_selector_pulse_delayed;
    assign resetn_cube = ~reset;
	
endmodule 