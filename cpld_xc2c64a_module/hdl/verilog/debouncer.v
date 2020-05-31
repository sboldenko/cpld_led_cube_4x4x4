module debouncer
(
	input  clk_high,
	input  clk_low,
	input  in_pulse, 
	output out_pulse
);
	
	wire invert_pulse;
	wire Q1;
	wire N1;
	wire Q2;
	reg  Q2_delay;
	reg  pulse;
	
	not not_2_inst(invert_pulse, in_pulse); 
	
	d_trigger d_trigger_1_inst 
	(
		.D(invert_pulse), 
		.clk(clk_low), 
		.Q(Q1)
   );	
	
	not not_1_inst(N1, clk_low);
	
	d_trigger d_trigger_2_inst 
	(
		.D(Q1), 
		.clk(N1), 
		.Q(Q2)
   );
	
	always @ (posedge clk_high)
	begin
		Q2_delay <= Q2;
		
		if (Q2 == 1'b0 & Q2_delay == 1'b1)
			pulse <= 1'b1;
		else
			pulse <= 1'b0;
	end
	
	assign out_pulse = pulse;
	
endmodule 