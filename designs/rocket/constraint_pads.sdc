current_design topmodule
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA

set_ideal_network [get_pins sg13g2_IOPad_clock/p2c]
create_clock [get_pins sg13g2_IOPad_clock/p2c] -name clk_core -period 25.0 -waveform {0 10}
set_clock_uncertainty 0.15 [get_clocks clk_core]
set_clock_transition 0.25 [get_clocks clk_core]

set clock_ports [get_ports {clock_pad}]
set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $clock_ports

set clk_core_input_ports [get_ports {
    uart_rx_pad
    boot_pad
    jtag_TCK_pad
    jtag_TMS_pad
    jtag_TDI_pad
    reset_pad
    stl_in_valid_pad
    stl_in_bits_pad[0]
    stl_in_bits_pad[1]
    stl_in_bits_pad[2]
    stl_in_bits_pad[3]
    stl_in_bits_pad[4]
    stl_in_bits_pad[5]
    stl_in_bits_pad[6]
    stl_in_bits_pad[7]
    stl_in_bits_pad[8]
    stl_in_bits_pad[9]
    stl_in_bits_pad[10]
    stl_in_bits_pad[11]
    stl_in_bits_pad[12]
    stl_in_bits_pad[13]
    stl_in_bits_pad[14]
    stl_in_bits_pad[15]
    stl_in_bits_pad[16]
    stl_in_bits_pad[17]
    stl_in_bits_pad[18]
    stl_in_bits_pad[19]
    stl_in_bits_pad[20]
    stl_in_bits_pad[21]
    stl_in_bits_pad[22]
    stl_in_bits_pad[23]
    stl_in_bits_pad[24]
    stl_in_bits_pad[25]
    stl_in_bits_pad[26]
    stl_in_bits_pad[27]
    stl_in_bits_pad[28]
    stl_in_bits_pad[29]
    stl_in_bits_pad[30]
    stl_in_bits_pad[31]
    stl_out_ready_pad
    stl_clock_pad
}]
set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $clk_core_input_ports
set_input_delay 8 -clock clk_core $clk_core_input_ports

set clk_core_output_30mA_ports [get_ports { 
    clock_tap_pad
    uart_tx_pad
    jtag_TDO_pad
    stl_in_ready_pad
    stl_out_valid_pad
    stl_out_bits_pad[0]
    stl_out_bits_pad[1]
    stl_out_bits_pad[2]
    stl_out_bits_pad[3]
    stl_out_bits_pad[4]
    stl_out_bits_pad[5]
    stl_out_bits_pad[6]
    stl_out_bits_pad[7]
    stl_out_bits_pad[8]
    stl_out_bits_pad[9]
    stl_out_bits_pad[10]
    stl_out_bits_pad[11]
    stl_out_bits_pad[12]
    stl_out_bits_pad[13]
    stl_out_bits_pad[14]
    stl_out_bits_pad[15]
    stl_out_bits_pad[16]
    stl_out_bits_pad[17]
    stl_out_bits_pad[18]
    stl_out_bits_pad[19]
    stl_out_bits_pad[20]
    stl_out_bits_pad[21]
    stl_out_bits_pad[22]
    stl_out_bits_pad[23]
    stl_out_bits_pad[24]
    stl_out_bits_pad[25]
    stl_out_bits_pad[26]
    stl_out_bits_pad[27]
    stl_out_bits_pad[28]
    stl_out_bits_pad[29]
    stl_out_bits_pad[30]
    stl_out_bits_pad[31]    
}] 
set_driving_cell -lib_cell sg13g2_IOPadOut30mA -pin pad $clk_core_output_30mA_ports
set_output_delay 8 -clock clk_core $clk_core_output_30mA_ports