
# ===========================================================================
# Constraints
# Alfonso Cortés - Inria AIO
# 
# ===========================================================================

current_design test
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA

# Timing Constraints
create_clock [get_ports clk] -name clk_core -period 25.0 -waveform {0 10}

set clk_core_input_ports [get_ports {
    rst
    enable
    write
    data_in[0]
    data_in[1]
    data_in[2]
    data_in[3]
    data_in[4]
    data_in[5]
    data_in[6]
    data_in[7]
    data_in[8]
    data_in[9]
    data_in[10]
    data_in[11]
    data_in[12]
    data_in[13]
    data_in[14]
    data_in[15]
}]

set_input_delay 5.0000 -clock clk_core -add_delay $clk_core_input_ports

# Environment
set_driving_cell [all_inputs] -lib_cell sg13g2_buf_4 -pin {X}


