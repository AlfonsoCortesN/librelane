current_design test_top
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA

set_ideal_network [get_pins sg13g2_IOPad_clock/p2c]
create_clock [get_pins sg13g2_IOPad_clock/p2c] -name clk_core -period 20.0 -waveform {0 10}
set_clock_uncertainty 0.15 [get_clocks clk_core]
set_clock_transition 0.25 [get_clocks clk_core]

set clock_ports [get_ports {clk_pad}]
set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $clock_ports

set clk_core_input_ports [get_ports { 
    rst_pad
    start_pad
    data_in_A_pad[0]
    data_in_A_pad[1]
    data_in_A_pad[2]
    data_in_A_pad[3]
    data_in_B_pad[0]
    data_in_B_pad[1]
    data_in_B_pad[2]
    data_in_B_pad[3]
}] 
set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $clk_core_input_ports
set_input_delay 8 -clock clk_core $clk_core_input_ports

set clk_core_output_30mA_ports [get_ports { 
    data_out_pad[0]
    data_out_pad[1]
    data_out_pad[2]
    data_out_pad[3]
    data_out_pad[4]
    data_out_pad[5]
    data_out_pad[6]
    data_out_pad[7]
}] 
set_driving_cell -lib_cell sg13g2_IOPadOut30mA -pin pad $clk_core_output_30mA_ports
set_output_delay 8 -clock clk_core $clk_core_output_30mA_ports
