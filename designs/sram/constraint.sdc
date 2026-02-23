
# ===========================================================================
# Constraints
# Alfonso Cortés - Inria AIO
# 
# ===========================================================================

current_design DCacheDataArray
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA

# Timing Constraints
create_clock [get_ports clock] -name clk_core -period 25.0 -waveform {0 10}

set clk_core_input_ports [get_ports {
    io_req_valid
    io_req_bits_addr[0]
    io_req_bits_addr[1]
    io_req_bits_addr[2]
    io_req_bits_addr[3]
    io_req_bits_addr[4]
    io_req_bits_addr[5]
    io_req_bits_addr[6]
    io_req_bits_addr[7]
    io_req_bits_addr[8]
    io_req_bits_addr[9]
    io_req_bits_addr[10]
    io_req_bits_addr[11]
    io_req_bits_addr[12]
    io_req_bits_addr[13]
    io_req_bits_write
    io_req_bits_wdata[0]
    io_req_bits_wdata[1]
    io_req_bits_wdata[2]
    io_req_bits_wdata[3]
    io_req_bits_wdata[4]
    io_req_bits_wdata[5]
    io_req_bits_wdata[6]
    io_req_bits_wdata[7]
    io_req_bits_wdata[8]
    io_req_bits_wdata[9]
    io_req_bits_wdata[10]
    io_req_bits_wdata[11]
    io_req_bits_wdata[12]
    io_req_bits_wdata[13]
    io_req_bits_wdata[14]
    io_req_bits_wdata[15]
    io_req_bits_wdata[16]
    io_req_bits_wdata[17]
    io_req_bits_wdata[18]
    io_req_bits_wdata[19]
    io_req_bits_wdata[20]
    io_req_bits_wdata[21]
    io_req_bits_wdata[22]
    io_req_bits_wdata[23]
    io_req_bits_wdata[24]
    io_req_bits_wdata[25]
    io_req_bits_wdata[26]
    io_req_bits_wdata[27]
    io_req_bits_wdata[28]
    io_req_bits_wdata[29]
    io_req_bits_wdata[30]
    io_req_bits_wdata[31]
    io_req_bits_wdata[32]
    io_req_bits_wdata[33]
    io_req_bits_wdata[34]
    io_req_bits_wdata[35]
    io_req_bits_wdata[36]
    io_req_bits_wdata[37]
    io_req_bits_wdata[38]
    io_req_bits_wdata[39]
    io_req_bits_wdata[40]
    io_req_bits_wdata[41]
    io_req_bits_wdata[42]
    io_req_bits_wdata[43]
    io_req_bits_wdata[44]
    io_req_bits_wdata[45]
    io_req_bits_wdata[46]
    io_req_bits_wdata[47]
    io_req_bits_wdata[48]
    io_req_bits_wdata[49]
    io_req_bits_wdata[50]
    io_req_bits_wdata[51]
    io_req_bits_wdata[52]
    io_req_bits_wdata[53]
    io_req_bits_wdata[54]
    io_req_bits_wdata[55]
    io_req_bits_wdata[56]
    io_req_bits_wdata[57]
    io_req_bits_wdata[58]
    io_req_bits_wdata[59]
    io_req_bits_wdata[60]
    io_req_bits_wdata[61]
    io_req_bits_wdata[62]
    io_req_bits_wdata[63]
    io_req_bits_wordMask[0]
    io_req_bits_wordMask[1]
    io_req_bits_eccMask[0]
    io_req_bits_eccMask[1]
    io_req_bits_eccMask[2]
    io_req_bits_eccMask[3]
}]

set_input_delay 5.0000 -clock clk_core -add_delay $clk_core_input_ports

# Environment
set_driving_cell [all_inputs] -lib_cell sg13g2_buf_4 -pin {X}


