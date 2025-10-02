current_design ChipTop
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA

create_clock [get_ports clock_uncore] -name clk_core -period 25.0 -waveform {0 10}
set_clock_uncertainty 0.15 [get_clocks clk_core]
set_clock_transition 0.25 [get_clocks clk_core]

set clk_core_input_ports [get_ports {
    uart_0_rxd
    custom_boot
    jtag_TCK
    jtag_TMS
    jtag_TDI
    reset_io
    serial_tl_0_in_valid
    serial_tl_0_in_bits_phit[0]
    serial_tl_0_in_bits_phit[1]
    serial_tl_0_in_bits_phit[2]
    serial_tl_0_in_bits_phit[3]
    serial_tl_0_in_bits_phit[4]
    serial_tl_0_in_bits_phit[5]
    serial_tl_0_in_bits_phit[6]
    serial_tl_0_in_bits_phit[7]
    serial_tl_0_in_bits_phit[8]
    serial_tl_0_in_bits_phit[9]
    serial_tl_0_in_bits_phit[10]
    serial_tl_0_in_bits_phit[11]
    serial_tl_0_in_bits_phit[12]
    serial_tl_0_in_bits_phit[13]
    serial_tl_0_in_bits_phit[14]
    serial_tl_0_in_bits_phit[15]
    serial_tl_0_in_bits_phit[16]
    serial_tl_0_in_bits_phit[17]
    serial_tl_0_in_bits_phit[18]
    serial_tl_0_in_bits_phit[19]
    serial_tl_0_in_bits_phit[20]
    serial_tl_0_in_bits_phit[21]
    serial_tl_0_in_bits_phit[22]
    serial_tl_0_in_bits_phit[23]
    serial_tl_0_in_bits_phit[24]
    serial_tl_0_in_bits_phit[25]
    serial_tl_0_in_bits_phit[26]
    serial_tl_0_in_bits_phit[27]
    serial_tl_0_in_bits_phit[28]
    serial_tl_0_in_bits_phit[29]
    serial_tl_0_in_bits_phit[30]
    serial_tl_0_in_bits_phit[31]
    serial_tl_0_out_ready
    serial_tl_0_clock_in
}]

set_input_delay 5.0000 -clock clk_core -add_delay $clk_core_input_ports

# Environment
set_driving_cell [all_inputs] -lib_cell sg13g2_buf_4 -pin {X}