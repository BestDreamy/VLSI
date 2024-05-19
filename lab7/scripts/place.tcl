set_attribute [all_macro_cells ] is_fixed true
set_attribute [all_macro_cells ] is_placed true

check_tlu_plus_files

set clock_nets [get_net -of [all_fanout -flat -clock_tree] -top_net_of_hierarchical_group]
set_ideal_network -no_propagate $clock_nets

group_path -name INPUTS -from [all_inputs]
group_path -name OUTPUTS -to [all_outputs]
group_path -name REG2REG -from [all_registers] -to [all_registers]
group_path -name REG2MEM -from [all_registers] -to [all_macro_cells]
group_path -name MEM2REG -from [all_macro_cells] -to [all_registers]

remove_clock_uncertainty [all_clocks]
set_clock_uncertainty -setup  0.3 [all_clocks]
set_clock_uncertainty -hold  0.05 [all_clocks]

create_placement_blockage -coordinate {{ 15.42 392.6} {139.46 483.6}} -name placement_blockage_1 -type soft
create_placement_blockage -coordinate {{360.44 291.8} {484.48 483.6}} -name placement_blockage_2 -type soft
create_placement_blockage -coordinate {{360.44    15} {484.48 206.8}} -name placement_blockage_3 -type soft
create_placement_blockage -coordinate {{ 15.42    15} {139.46   106}} -name placement_blockage_4 -type soft

set_ignored_layer \
	-rc_congestion_ignored_layers "M6 T4M2 RDL" \
	-min_routing_layer M2 \
	-max_routing_layer M5

create_placement
legalize_placement

place_opt -skip_initial_placement -power -effort high -congestion

set step placement
report_design -physical > ${report_dir}/${step}_phys.rpt
report_timing -nosplit -delay max -max_path 2 -nworst 2 -input -net -trans -cap > ${report_dir}/${step}_timing.rpt
report_constraints -nosplit -all -max_delay > ${report_dir}/${step}_constrain.rpt
report_qor > ${report_dir}/${step}_qor.rpt
report_qor -summary >> ${report_dir}/${step}_qor.rpt
 
save_mw_cel -as placement
