set topLevel		mmForMLP
set work_path   /home/user001/vlsi/lab6
set mw_verilog		${work_path}/dc_output/${topLevel}_netlist.v
set mw_sdc		${work_path}/dc_output/${topLevel}.sdc


set report_dir     ./reports
if {![file exists ${report_dir}]} {
  exec mkdir ${report_dir}
}


set mw_design_lib ${topLevel}.mwlib

set mw_tech_file ${work_path}/lab6_hw_lib/HL055P_7M6X1T4_RDL.tf
set tluplus_max /home/user001/vlsi/lab8/tlup_new/HLMC_cl055lp_1p7m_1tm4x_rcworst.tlup
set tluplus_min /home/user001/vlsi/lab8/tlup_new/HLMC_cl055lp_1p7m_1tm4x_rcbest.tlup
set tech2itf_map ${work_path}/lab6_hw_lib/tech2itf

set mw_phys_refs ""
lappend mw_phys_refs ${work_path}/lab6_hw_lib/mwlib/M31GPSC900HL055PR
lappend mw_phys_refs ${work_path}/lab6_hw_lib/mwlib/mem55lpw128d16sp
lappend mw_phys_refs ${work_path}/lab6_hw_lib/mwlib/mem55lpw256d16sp
lappend mw_phys_refs ${work_path}/lab6_hw_lib/mwlib/mem55lpw1024d16sp

set link_library "*"
 
lappend link_library ${work_path}/lab6_hw_lib/M31_db/M31GPSC900HL055PR_125CSS1P08_cworst_ccs.db 
set_min_library  ${work_path}/lab6_hw_lib/M31_db/M31GPSC900HL055PR_125CSS1P08_cworst_ccs.db -min_version ${work_path}/lab6_hw_lib/M31_db/M31GPSC900HL055PR_N40CFF1P32_cbest_ccs.db

lappend link_library ${work_path}/lab6_hw_lib/SRAM_db/mem55lpw128d16sp_ss1p08v125c.db
set_min_library  ${work_path}/lab6_hw_lib/SRAM_db/mem55lpw128d16sp_ss1p08v125c.db -min_version ${work_path}/lab6_hw_lib/SRAM_db/mem55lpw128d16sp_ff1p32vn40c.db

lappend link_library ${work_path}/lab6_hw_lib/SRAM_db/mem55lpw256d16sp_ss1p08v125c.db
set_min_library  ${work_path}/lab6_hw_lib/SRAM_db/mem55lpw256d16sp_ss1p08v125c.db -min_version ${work_path}/lab6_hw_lib/SRAM_db/mem55lpw256d16sp_ff1p32vn40c.db

lappend link_library ${work_path}/lab6_hw_lib/SRAM_db/mem55lpw1024d16sp_ss1p08v125c.db
set_min_library  ${work_path}/lab6_hw_lib/SRAM_db/mem55lpw1024d16sp_ss1p08v125c.db -min_version ${work_path}/lab6_hw_lib/SRAM_db/mem55lpw1024d16sp_ff1p32vn40c.db


set target_library ""
lappend target_library ${work_path}/lab6_hw_lib/M31_db/M31GPSC900HL055PR_125CSS1P08_cworst_ccs.db 


set_tlu_plus_files \
	    -tech2itf_map $tech2itf_map \
	    -max_tluplus $tluplus_max \
	    -min_tluplus $tluplus_min

create_mw_lib $mw_design_lib -tech $mw_tech_file -mw_reference_library $mw_phys_refs
set_mw_lib_reference -mw_reference_library $mw_phys_refs $mw_design_lib
#
open_mw_lib $mw_design_lib
#
import_designs -format verilog -top $topLevel -cel START $mw_verilog

remove_sdc
source $mw_sdc

report_ideal_network
remove_ideal_network -all

set_max_leakage_power 0 mW
set_max_area 0

set_tlu_plus_files \
	-max_tluplus $tluplus_max \
	-min_tluplus $tluplus_min \
        -tech2itf_map $tech2itf_map

set_timing_derate -late 1.04 -net_delay -cell_delay -data
set_timing_derate -early 0.96 -net_delay -cell_delay -data

set_timing_derate -late 1.045 -net_delay -cell_delay -clock
set_timing_derate -early 0.955 -net_delay -cell_delay -clock

set_max_transition .32    [current_design]
set_max_fanout     32    [current_design]
set_max_net_length 400.0 [current_design]

set_operating_conditions \
	-analysis_type bc_wc \
	-max_library  ${work_path}/lab6_hw_lib/M31_db/M31GPSC900HL055PR_125CSS1P08_cworst_ccs.db:M31GPSC900HL055PR_125CSS1P08_cworst_ccs \
	-max 125CSS1P08 \
	-min_library  ${work_path}/lab6_hw_lib/M31_db/M31GPSC900HL055PR_N40CFF1P32_cbest_ccs.db:M31GPSC900HL055PR_N40CFF1P32_cbest_ccs \
	-min N40CFF1P32


