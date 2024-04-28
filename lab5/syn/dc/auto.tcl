set root_path "/home/user001/vlsi/"
set lib_path "$root_path/IH55LP_HS_RVT_V2p5b/"
set lab_path "$root_path/lab5/"
set rtl_path "$lab_path/rtl/"
# set tcl_path "$lab_path/tcl/"
set report_path "$lab_path/report/"

set search_path "$lib_path/symbol/ $lib_path/synopsys/ $rtl_path"
set link_library "ih55lp_hs_rvt_tt_1p20_25c_basic.db" 
set target_library "ih55lp_hs_rvt_tt_1p20_25c_basic.db" 
set synthetic_library "ih55lp_hs_rvt_tt_1p20_25c_basic.db" 
set symbol_library "IH55LP_HS_RVT.sdb"

read_verilog {multiplier_tb.v multiplier.v half_adder.v full_adder.v}

# change_selection [get_s clk]
create_clock -name "clk" -period 2 -waveform {0 1} {clk}

# change_selection [get_s { {data[2]} {data[1]} {data[0]} {data[3]} {4_pins(data[], ...)} }] 
# change_selection -add [get_s a_en]
# change_selection -add [get_s b_en]
set input "data[0] data[1] data[2] data[3] a_en b_en"
set_input_delay -clock clk -max -rise 1   $input 
set_input_delay -clock clk -max -fall 1   $input
set_input_delay -clock clk -min -rise 0.2 $input
set_input_delay -clock clk -min -fall 0.2 $input

# change_selection [get_s { {z[7]} {z[6]} {z[5]} {z[4]} {z[3]} {z[2]} {z[1]} {z[0]} {8_pins(z[], ...)} }] 
set output "{z[7]} {z[6]} {z[5]} {z[4]} {z[3]} {z[2]} {z[1]} {z[0]}"
set_output_delay -clock clk -max -rise 1 "{z[7]} {z[6]} {z[5]} {z[4]} {z[3]} {z[2]} {z[1]} {z[0]}" 
set_output_delay -clock clk -max -fall 1 "{z[7]} {z[6]} {z[5]} {z[4]} {z[3]} {z[2]} {z[1]} {z[0]}"

# change_selection [get_s clk]
# change_selection -add [get_s rst]
set_dont_touch_network {rst clk}

set_clock_latency -max 0.2 [get_clocks clk]
set_clock_transition -max 0.05 [get_clocks clk]
set_clock_uncertainty -setup 0.3 [get_clocks clk]

set_max_area 0
set_max_fanout 300 multiplier_tb
uplevel #0 check_design
compile_ultra

write -format verilog -hierarchy -output ./multiplier_netlist.v
write_sdf ./multiplier.sdf
