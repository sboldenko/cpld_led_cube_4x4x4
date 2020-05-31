add wave -noupdate -divider testbench
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {testbench} /tb_cpld_xc2c64a/*

add wave -noupdate -divider top
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {top} /tb_cpld_xc2c64a/top_cpld_xc2c64a_inst/*

add wave -noupdate -divider low_frequency_clk_generator
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {low_frequency_clk_generator} /tb_cpld_xc2c64a/top_cpld_xc2c64a_inst/low_frequency_clk_generator_inst/*

add wave -noupdate -divider reset_module
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {reset_module} /tb_cpld_xc2c64a/top_cpld_xc2c64a_inst/reset_module_inst/*

add wave -noupdate -divider debouncer_mode_selector
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {debouncer_mode_selector} /tb_cpld_xc2c64a/top_cpld_xc2c64a_inst/debouncer_mode_selector_inst/*

add wave -noupdate -divider debouncer_light_selector
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {debouncer_light_selector} /tb_cpld_xc2c64a/top_cpld_xc2c64a_inst/debouncer_light_selector_inst/*

add wave -noupdate -divider pulse_delayer_light_selector
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {pulse_delayer_light_selector} /tb_cpld_xc2c64a/top_cpld_xc2c64a_inst/pulse_delayer_light_selector_inst/*

add wave -noupdate -divider pulse_delayer_mode_selector
add wave -noupdate -format Logic -radix HEXADECIMAL  -group {pulse_delayer_mode_selector} /tb_cpld_xc2c64a/top_cpld_xc2c64a_inst/pulse_delayer_mode_selector_inst/*

configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps 