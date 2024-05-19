set_attribute [all_macro] is_fixed true
set_attribute [all_macro] is_placed true

set_attribute [get_terminals *] is_fixed true

derive_pg_connection -power_net VCCK -ground_net GNDK

add_end_cap -respect_blockage -ignore_soft_blockage -lib_cell TAP01CR9

derive_pg_connection -power_net VCCK -ground_net GNDK

preroute_standard_cells -fill_empty_rows

add_tap_cell_array -master_cell_name TAP01CR9 \
    -distance 50 \
    -pattern stagger_every_other_row \
    -tap_cell_identifier T \
    -tap_cell_separator _ \
    -no_tap_cell_under_layers {M1 M2} \
    -connect_power_name VCCK \
    -connect_ground_name GNDK \
    -fill_boundary_row true \
    -fill_macro_blockage_row true \
    -boundary_row_double_density true \
    -macro_blockage_row_double_density true \
    -ignore_soft_blockage  true \
    -skip_fixed_cells true

create_power_straps -direction vertical -nets VCCK -layer M4 -width 1.0 -start_at 0.00 -step 10 -stop 490.0 -configure step_and_stop
create_power_straps -direction vertical -nets GNDK -layer M4 -width 1.0 -start_at 5.00 -step 10 -stop 500.0 -configure step_and_stop

create_power_straps -direction horizontal  -nets VCCK -layer M5 -width 1.0 -start_at 0.00 -step 10 -stop 490.0 -configure step_and_stop
create_power_straps -direction horizontal  -nets GNDK -layer M5 -width 1.0 -start_at 5.00 -step 10 -stop 500.0 -configure step_and_stop


save_mw_cel -as lab7
