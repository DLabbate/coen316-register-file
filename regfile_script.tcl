# regfile_script.tcl
# TCL script for running vivado in batch mode to synthesize regfile.vhd
# Domenic Labbate
# November 13th, 2020

# To run the script first source the Vivado env file:
# source /CMC/tools/xilinx/Vivado_2018.2/Vivado/2018.2/settings64_CMC_central_license.csh
#
#Then issue the following command from the Linux prompt:
# vivado -log regfile_log.log -mode batch -source regfile_script.tcl

# read in the VHDL source code files and the xdc constraints file

# to allow for unconstrained ports
# we must set this property, this will
# generated only Warnings about unconstrained ports, but no errors
# and bitgen will generate the .bit file
# we intentionally did not specify any pin constraints in the
# .xdc file since we are not programming the board

set_property SEVERITY {Warning} [get_drc_checks UCIO-1]

read_vhdl  { ./regfile.vhd }
read_xdc  regfile_circuit.xdc

# the -top refers to the top level VHDL entity name
# the -part specfies the target Xilinx FPGA

synth_design -top regfile -part xc7a100tcsg324-1
opt_design
place_design
route_design

# generate the bitsteam file
write_bitstream -force regfilecircuit.bit