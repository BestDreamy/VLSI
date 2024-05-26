remove_clock_uncertainty [all_clocks]
set_clock_uncertainty -setup  0.25 [all_clocks]
set_clock_uncertainty -hold  0.05 [all_clocks]

set holdDels [get_lib_cell {
        M31GPSC900HL055PR_125CSS1P08_cworst_ccs/DEL0N1X1CR9
        M31GPSC900HL055PR_125CSS1P08_cworst_ccs/DEL0N2X1CR9
        M31GPSC900HL055PR_125CSS1P08_cworst_ccs/DEL0N3X1CR9
        M31GPSC900HL055PR_125CSS1P08_cworst_ccs/DEL0N5X1CR9
        M31GPSC900HL055PR_125CSS1P08_cworst_ccs/BUFX2AR9
}]

set_prefer -min $holdDels

set_fix_hold [all_clocks]
set_fix_hold_options -prioritize_tns -preferred_buffer

psynopt -power
