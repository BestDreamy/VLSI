create_die_area -boundary {{0 0} {500 500}}
set_pin_physical_constraints [remove_from_collection [get_ports *] [get_ports * -filter "direction==out"]] -layers {M2 M3 M4 M5}
set_pin_physical_constraints [remove_from_collection [get_ports *] [get_ports * -filter "direction==in"]] -layers {M2 M3 M4 M5}
create_pin_guide -bbox {{-3 225} {3.6 275}} [remove_from_collection [get_ports *] [get_ports * -filter "direction==out"]]
create_pin_guide -bbox {{496.4 225} {503 275}} [remove_from_collection [get_ports *] [get_ports * -filter "direction==in"]]
create_floorplan -control_type boundary -left_io2core 3.6 -bottom_io2core 3.6 -right_io2core 3.6 -top_io2core 3.6
