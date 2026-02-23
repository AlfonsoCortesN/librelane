
# ===========================================================================
# Constraints
# Alfonso Cortés - Inria AIO
# 
# ===========================================================================

current_design test
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA

# Timing Constraints
create_clock [get_ports clock] -name clk_core -period 25.0 -waveform {0 10}

set clk_core_input_ports [get_ports {
    reset
    start
    ready
    index[0]
    index[1]
    index[2]
    index[3]
    index[4]
    index[5]
    param[0]
    param[1]
    param[2]
    param[3]
    param[4]
    param[5]
    param[6]
    param[7]
    param[8]
    param[9]
    param[10]
    param[11]
    param[12]
    param[13]
    param[14]
    param[15]
    param[16]
    param[17]
    param[18]
    param[19]
    param[20]
    param[21]
    param[22]
    param[23]
    param[24]
    param[25]
    param[26]
    param[27]
    param[28]
    param[29]
    param[30]
    param[31]
}]

set_input_delay 5.0000 -clock clk_core -add_delay $clk_core_input_ports

# Environment
set_driving_cell [all_inputs] -lib_cell sg13g2_buf_4 -pin {X}


