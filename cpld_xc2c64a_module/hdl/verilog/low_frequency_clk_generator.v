module low_frequency_clk_generator
(
	input  reset,
	input  clk_high,
	output clk_low
);

	reg [18:0] counter = 19'b0;
	reg result_clk = 1'b1;
	
	always @ (posedge clk_high)
	begin
		counter <= counter + 1'b1;
		
		if (reset)
			counter <= 19'd0;
		else if (counter == 19'hFFFFF) 
		begin
			counter <= 19'd0;
			result_clk <= !result_clk;
		end
	end
	
	assign clk_low = result_clk;
	
endmodule 