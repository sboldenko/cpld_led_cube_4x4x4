module pulse_delayer
(
    input  clk,
    input  reset,
    input  pulse_in,
    output pulse_out
);

    reg [8:0] counter;
    reg start_count;
	
    always@(posedge clk)
    begin
        if (reset)
            start_count = 1'b0;		
        else if (pulse_in == 1'b1)
            start_count = 1'b1;
        else if (counter == 9'h1FF)
            start_count = 1'b0;
    end
    
    always@(posedge clk)
    begin
        if (reset)
            counter = 9'd0;
        else if (start_count == 1'b1)
            counter = counter + 1'b1;
        else
            counter = 9'd0;
    end
    
    assign pulse_out = start_count;
	
endmodule
