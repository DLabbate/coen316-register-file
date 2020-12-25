
# Case 0 - Reset '1' to initialize.
force din x"ABCDABCD"
force reset 1
force clk 0
force write 1
force read_a "00000"
force read_b "00001"
force write_address "00000"
run 2
examine -radix hex reg_array(0) -radix hex reg_array(1) -radix hex out_a -radix hex out_b


# Case 1 - Clock is zero, the regfile should not change
force din x"ABCDABCD"
force reset 0
force clk 0
force write 1
force read_a "00000"
force read_b "00001"
force write_address "00000"
run 2
examine -radix hex reg_array(0) -radix hex reg_array(1) -radix hex out_a -radix hex out_b


# Case 2 - Clock now changes to 1 (rising edge)
# The reg_file(0) should change along with out_a, due to the specified write_address
force din x"ABCDABCD"
force reset 0
force clk 1
force write 1
force read_a "00000"
force read_b "00001"
force write_address "00000"
run 2
examine -radix hex reg_array(0) -radix hex reg_array(1) -radix hex out_a -radix hex out_b



# Case 3 - We create a rising edge, but write = '0'
# Regfile should not change
force clk 0
run 2

force din x"FFFFFFFF"
force reset 0
force clk 1
force write 0;
force read_a "00000"
force read_b "00001"
force write_address "00001"
run 2
examine -radix hex reg_array(0) -radix hex reg_array(1) -radix hex out_a -radix hex out_b


# Case 4 - Write = '1', and we have a rising edge. So the value should be written.
# reg_array(1) should change along with out_b, due to the write_address
force clk 0
run 2

force din x"FFFFFFFF"
force reset 0
force clk 1
force write 1;
force read_a "00000"
force read_b "00001"
force write_address "00001"
run 2
examine -radix hex reg_array(0) -radix hex reg_array(1) -radix hex out_a -radix hex out_b


# Case 5 - Reset '1', which should clear everything (even though we don't have a rising edge!)
force din x"EEEEEEEE"
force reset 1
force clk 1
force write 1;
force read_a "00000"
force read_b "00001"
force write_address "00001"
run 2
examine -radix hex reg_array(0) -radix hex reg_array(1) -radix hex out_a -radix hex out_b