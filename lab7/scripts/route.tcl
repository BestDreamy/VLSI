derive_pg_connection -power_net VCCK -ground_net GNDK

verify_pg_nets

route_zrt_group -all_clock_nets -max_detail_route_iterations 10

route_opt -skip_initial_route -power

verify_zrt_route

route_zrt_detail -incremental true -initial_drc_from_input true

route_zrt_detail -incremental true -max_number_iterations 15

insert_zrt_redundant_vias

report_design_physical -route

insert_stdcell_filler -cell_with_metal "FILLERC16CR9 FILLERC8CR9" -connect_to_power VCCK -connect_to_ground GNDK -between_std_cells_only

insert_stdcell_filler -cell_without_metal "FILLER16AR9 FILLER8AR9 FILLER4AR9 FILLER3AR9  FILLER2AR9 FILLER1AR9" -connect_to_power VCCK -connect_to_ground GNDK -between_std_cells_only

insert_metal_filler -routing_space 2.0 -from_metal 2  -to_metal 5

write_stream -format gds example1SRAM.gds

set step finish
report_design -physical > ${report_dir}/${step}_phys.rpt
report_timing -nosplit -delay max -max_path 2 -nworst 2 -input -net -trans -cap > ${report_dir}/${step}_timing_setup.rpt
report_timing -nosplit -delay min -max_path 2 -nworst 2 -input -net -trans -cap > ${report_dir}/${step}_timing_hold.rpt
report_constraints -nosplit -all -max_delay > ${report_dir}/${step}_constrain.rpt
report_qor > ${report_dir}/${step}_qor.rpt
report_qor -summary >> ${report_dir}/${step}_qor.rpt
