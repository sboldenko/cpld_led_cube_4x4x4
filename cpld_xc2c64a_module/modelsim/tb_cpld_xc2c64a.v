`timescale 1ns / 100ps

module tb_cpld_xc2c64a();
	
    integer i;
	
    reg  clk;
    wire resetn_cube;
    reg  mode_selector_in;
    reg  light_selector_in;
    wire mode_selector_out;
    wire light_selector_out;

    top_cpld_xc2c64a top_cpld_xc2c64a_inst 
    (
        .clk_system(clk),
        .resetn_cube(resetn_cube),	
        .mode_selector_in(mode_selector_in), 
        .light_selector_in(light_selector_in),
        .mode_selector_out(mode_selector_out), 
        .light_selector_out(light_selector_out)
    );
	
    always 
        #20.8 clk = !clk;
	
    initial begin
        clk = 0;
        mode_selector_in = 1;
        light_selector_in = 1;
        $display("!Running testbench.");
    end
	
    initial begin
        for(i=0; i<10; i=i+1) begin
            #10000000 mode_selector_in = 1;
        end
		
        #1000000 mode_selector_in = 0;
        #1000000 mode_selector_in = 0;
        #100 mode_selector_in = 1;
        #100 mode_selector_in = 0;
        #1000 mode_selector_in = 1;
        #100 mode_selector_in = 0;
        #100000000 mode_selector_in = 1;
        #100 mode_selector_in = 0;
        #100 mode_selector_in = 1;
        #100 mode_selector_in = 0;
        #100 mode_selector_in = 1;
        $display("!1 Push mode_selector_in is done.");
		
        for(i=0; i<20; i=i+1) begin
            #10000000 mode_selector_in = 1;
        end
		
        #1000000 mode_selector_in = 0;
        #1000000 mode_selector_in = 0;
        #100 mode_selector_in = 1;
        #100 mode_selector_in = 0;
        #1000 mode_selector_in = 1;
        #100 mode_selector_in = 0;
        #100000000 mode_selector_in = 1;
        #100 mode_selector_in = 0;
        #100 mode_selector_in = 1;
        #100 mode_selector_in = 0;
        #100 mode_selector_in = 1;
        $display("!2 Push mode_selector_in is done.");
    end 
	
    initial begin
        for(i=0; i<15; i=i+1)
        begin
            #10000000 light_selector_in = 1;
        end
        
        #10000000 light_selector_in = 0;
        #100 light_selector_in = 1;
        #100 light_selector_in = 0;
        #1000 light_selector_in = 1;
        #100 light_selector_in = 0;
        #100000000 mode_selector_in = 1;
        #100 light_selector_in = 0;
        #100 light_selector_in = 1;
        #100 light_selector_in = 0;
        #100 light_selector_in = 1;
        $display("!1 Push light_selector_in is done.");
        
        for(i=0; i<35; i=i+1) begin
            #10000000 light_selector_in = 1;
        end
        
        #10000000 light_selector_in = 0;
        #100 light_selector_in = 1;
        #100 light_selector_in = 0;
        #1000 light_selector_in = 1;
        #100 light_selector_in = 0;
        #100000000 mode_selector_in = 1;
        #100 light_selector_in = 0;
        #100 light_selector_in = 1;
        #100 light_selector_in = 0;
        #100 light_selector_in = 1;
        $display("!2 Push light_selector_in is done.");
    end 
	
endmodule  
