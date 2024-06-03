remove_buffer_tree -all

set M2W [expr [get_layer_attribute -layer M2 defaultWidth]*2.0]
set M3W [expr [get_layer_attribute -layer M3 defaultWidth]*2.0]
set M4W [expr [get_layer_attribute -layer M4 defaultWidth]*2.0]
set M5W [expr [get_layer_attribute -layer M5 defaultWidth]*2.0]

set M2S [expr (([get_layer_attribute -layer M2 pitch]*4.0)-$M2W-[get_layer_attribute -layer M2 defaultWidth])/2]
set M3S [expr (([get_layer_attribute -layer M3 pitch]*4.0)-$M3W-[get_layer_attribute -layer M3 defaultWidth])/2]
set M4S [expr (([get_layer_attribute -layer M4 pitch]*4.0)-$M4W-[get_layer_attribute -layer M4 defaultWidth])/2]
set M5S [expr (([get_layer_attribute -layer M5 pitch]*4.0)-$M5W-[get_layer_attribute -layer M5 defaultWidth])/2]

define_routing_rule clk_space_rule \
	-spacings "M2 $M2S M3 $M3S M4 $M4S M5 $M5S" \
	-widths   "M2 $M2W M3 $M3W M4 $M4W M5 $M5W" \


set_clock_tree_options -routing_rule clk_space_rule \
       -max_transition .08 \
       -max_fanout 32 \
       -buffer_sizing true \
       -buffer_relocation true \
       -gate_sizing true \
       -gate_relocation true \
       -use_default_routing_for_sinks 1 \
       -layer_list {M3 M4 M5} \
       -ocv_clustering true

remove_ideal_network -all
reset_clock_tree_references

set_clock_tree_references -references { \
       CLKINVX12AR9  \
}

set_clock_tree_references -references { \
	CLKINVX12AR9  CLKINVX16AR9  CLKINVX2AR9  CLKINVX3AR9  CLKINVX4AR9  CLKINVX6AR9  CLKINVX8AR9 \
        CLKBUFX12AR9  CLKBUFX16AR9  CLKBUFX2AR9  CLKBUFX3AR9  CLKBUFX4AR9  CLKBUFX6AR9  CLKBUFX8AR9 \
} -sizing_only
set_clock_tree_references -references { \
        CLKINVX12AR9  CLKINVX16AR9  CLKINVX2AR9  CLKINVX3AR9  CLKINVX4AR9  CLKINVX6AR9  CLKINVX8AR9 \
        CLKBUFX12AR9  CLKBUFX16AR9  CLKBUFX2AR9  CLKBUFX3AR9  CLKBUFX4AR9  CLKBUFX6AR9  CLKBUFX8AR9 \

} -delay_in

report_clock_tree > ${report_dir}/rct_postSetting.rpt

set root_clock_source [get_ports {clk}]

compile_clock_tree -clock_trees $root_clock_source
optimize_clock_tree -clock_trees $root_clock_source -operating_condition max



propagate_all_clocks
update_clock_latency

report_clock_tree > ${report_dir}/rct_postCTS_func.rpt 

set step clock
report_design -physical > ${report_dir}/${step}_phys.rpt
report_timing -nosplit -delay max -max_path 2 -nworst 2 -input -net -trans -cap > ${report_dir}/${step}_timing.rpt
report_constraints -nosplit -all -max_delay > ${report_dir}/${step}_constrain.rpt
report_qor > ${report_dir}/${step}_qor.rpt
report_qor -summary >> ${report_dir}/${step}_qor.rpt

save_mw_cel -as pro2clock
