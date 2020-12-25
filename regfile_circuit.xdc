# regfile_circuit.xdc
# XDC file for regfile.vhd

set_property  IOSTANDARD LVCMOS33  [ get_ports { din }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { reset }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { clk }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { write }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { read_a }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { read_b }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { write_address }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { out_a }  ] ;
set_property  IOSTANDARD LVCMOS33  [ get_ports { out_b }  ] ;
