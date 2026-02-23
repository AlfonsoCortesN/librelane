
# ===========================================================================
# Constraints
# Alfonso Cortés - Inria AIO
# 
# ===========================================================================

current_design security_peripheral
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA

# Timing Constraints
create_clock [get_ports clock] -name clk_core -period 25.0 -waveform {0 10}

set clk_core_input_ports [get_ports {
    reset
    start
    sram_rdy
    key_size[0]
    key_size[1]
    key_size[2]
    key_size[3]
    key_size[4]
    key_size[5]
    key_size[6]
    key_size[7]
    cycles[0]
    cycles[1]
    cycles[2]
    cycles[3]
    cycles[4]
    cycles[5]
    cycles[6]
    cycles[7]
    start_address[0]
    start_address[1]
    start_address[2]
    start_address[3]
    start_address[4]
    start_address[5]
    start_address[6]
    start_address[7]
}]

set_input_delay 5.0000 -clock clk_core -add_delay $clk_core_input_ports

# Environment
set_driving_cell [all_inputs] -lib_cell sg13g2_buf_4 -pin {X}


