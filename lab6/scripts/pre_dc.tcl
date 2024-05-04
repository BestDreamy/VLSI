set DESIGN_NAME        "mmForMLP"
set RTL_SOURCE_FILES   "./${DESIGN_NAME}.v"
set CONSTRAIN_FILE     "./scripts/DefaultConstrain.tcl"
set DES_LIB  "./WORK/"
set OUTPUT_DIR "./dc_output/"


if {![file exists ${DES_LIB}]} {
    echo "Generate dir design lib"
    sh mkdir WORK
}
if {![file exists ${OUTPUT_DIR}]} {
    echo "Generate output directory"
    sh mkdir dc_output
}
define_design_lib MY_LIB -path $DES_LIB

set_svf ${OUTPUT_DIR}${DESIGN_NAME}.svf
saif_map -start
analyze -format verilog ${RTL_SOURCE_FILES} -library MY_LIB
elaborate ${DESIGN_NAME} -library MY_LIB
write -hierarchy -format ddc -output ./${OUTPUT_DIR}${DESIGN_NAME}_pre.ddc
source -echo -verbose ${CONSTRAIN_FILE}
