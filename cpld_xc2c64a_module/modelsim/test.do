vlib work
vmap work work

vlog ../hdl/verilog/top_cpld_xc2c64a_module.v
vlog ../hdl/verilog/low_frequency_clk_generator.v
vlog ../hdl/verilog/debouncer.v
vlog ../hdl/verilog/d_trigger.v
vlog ../hdl/verilog/reset_module.v
vlog ../hdl/verilog/pulse_delayer.v

vlog tb_cpld_xc2c64a.v

vsim -t 1ps -novopt -lib work -L cpld_ver -L unimacro_ver -L unisims_ver -L simprims_ver -L xilinxcorelib_ver -L work tb_cpld_xc2c64a

do wave_test.do 
view wave
run 1000 ms