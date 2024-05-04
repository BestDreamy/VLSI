#=====================================
#   
#	Clean-up
#
#=====================================
reset_design
#=====================================
# 
#	CLOCK
#
#=====================================
set INT_CLK_PERIOD 3

# ----------------Internel clock----------------------

create_clock -period $INT_CLK_PERIOD -name Int_clk [get_ports clk]

set_clock_uncertainty -setup 0.5 [get_clocks Int_clk]

set_clock_latency -source -max 0.3 [get_clocks Int_clk]

set_clock_latency -max 0.25 [get_clocks Int_clk]

set_clock_transition 0.08 [get_clocks Int_clk]

# --------------Set dont touch-------------------------
set_dont_touch_network [get_ports clk]

set_dont_touch_network [get_ports resetn]

#======================================
#
#	Input path
#   
#======================================
set All_input [remove_from_collection [all_inputs] [get_ports {clk resetn}]]

# input from internal cntl
set_input_delay -max [expr {0.3 * $INT_CLK_PERIOD}] -clock Int_clk $All_input
set_input_delay -min [expr {0.06 * $INT_CLK_PERIOD}] -clock Int_clk $All_input

#======================================
#
#	Output path
#
#======================================
set_output_delay -max [expr {0.6 * $INT_CLK_PERIOD}] -clock Int_clk [all_outputs]

#======================================
#
#	AREA
#
#======================================
set_max_area 0

#======================================
#
#   Environment attributes
#
#======================================
set_load 0.03 [all_outputs]

#======================================
#
#   Fanout
#
#======================================
set_max_fanout 300 [current_design]
