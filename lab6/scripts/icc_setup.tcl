set link_library "*"

set std_path       "/home/user001/vlsi/lab6/lab6_hw_lib/M31_db"
set sram_path      "/home/user001/vlsi/lab6/lab6_hw_lib/db"
set mw_path        "/home/user001/vlsi/lab6/lab6_hw_lib/mwlib"
set std_max        "M31GPSC900HL055PR_125CSS1P08_cworst_ccs.db"
set std_min        "M31GPSC900HL055PR_N40CFF1P32_cbest_ccs.db"
set sram_min_1024  "mem55lpw1024d16sp_ff1p32vn40c.db"
set sram_max_1024  "mem55lpw1024d16sp_ss1p08v125c.db"
set sram_min_256   "mem55lpw256d16sp_ff1p32vn40c.db"
set sram_max_256   "mem55lpw256d16sp_ss1p08v125c.db"

lappend link_library ${std_path}/${std_max}
set_min_library  ${std_path}/${std_max} -min_version ${std_path}/${std_min}

# lappend link_library ${sram_path}/${sram_min_1024}
lappend link_library ${sram_path}/${sram_max_1024}
set_min_library  ${sram_path}/${sram_max_1024} -min_version ${sram_path}/${sram_min_1024}
# lappend link_library ${sram_path}/${sram_min_256}
lappend link_library ${sram_path}/${sram_max_256}
set_min_library   ${sram_path}/${sram_max_256} -min_version  ${sram_path}/${sram_min_256}

set target_library ""
lappend target_library ${std_path}/${std_max}

set DESIGN_NAME "mmForMLP"
set mw_phys_refs ""
lappend mw_phys_refs ${mw_path}/M31GPSC900HL055PR
lappend mw_phys_refs ${mw_path}/mem55lpw1024d16sp
lappend mw_phys_refs ${mw_path}/mem55lpw256d16sp
set_mw_lib_reference -mw_reference_library $mw_phys_refs ${DESIGN_NAME}.mw
