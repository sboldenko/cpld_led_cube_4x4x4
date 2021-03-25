module reset_module
(
    input  clk,
    output reset
);
    parameter [1:0] start_state = 0,
                    reset_state = 1,
                    idle_state  = 2;
							
    reg [1:0] current_state = 2'd0;
    reg [7:0] counter = 8'd0;
    reg reset_flag = 1'b0;
    
    always@(posedge clk)
    begin
        case(current_state)
            start_state: begin
                counter <= counter + 1'b1;
            	
                if (counter == 8'hFF)
            	    current_state <= reset_state;
            end	
			
            reset_state: begin
                counter <= counter + 1'b1;
                reset_flag <= 1'b1;
                
                if (counter == 8'h0F)
                begin
                    current_state <= idle_state;
                end	
            end	
            
            idle_state: begin
                reset_flag <= 1'b0;
                counter <= 8'd0;
            end	
            
            default: current_state <= idle_state; 	
        endcase
    end
    
    assign reset = reset_flag; 
	
endmodule
