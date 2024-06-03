set VERILOG_OUTPUT_FILE "${DESIGN_NAME}_netlist.v"
set DDC_OUTPUT_FILE     "${DESIGN_NAME}_post.ddc"


write -format verilog -hierarchy -output ./dc_output/${DESIGN_NAME}_netlist.v
write -format ddc     -hierarchy -output ./dc_output/${DESIGN_NAME}_post.ddc
write_sdf ./dc_output/${DESIGN_NAME}.sdf
write_sdc ./dc_output/${DESIGN_NAME}.sdc
set_svf -off
rt > ./dc_output/report_timing.rpt
