# ===========================================================================
# Power grid generation script, executed in the OpenROAD.GeneratePDN step
# Alfonso Cortés - Inria AIO
# Based on https://github.com/mole99/greyhound-ihp
#
# ===========================================================================

# stdcell power pins
add_global_connection -net {VDD} -pin_pattern {^VDD$} -power
#add_global_connection -net {VDD} -pin_pattern {^VDDPE$}
#add_global_connection -net {VDD} -pin_pattern {^VDDCE$}
add_global_connection -net {VSS} -pin_pattern {^VSS$} -ground
#add_global_connection -net {VSS} -pin_pattern {^VSSE$}
# padframe core power pins
add_global_connection -net {VDD} -pin_pattern {^vdd$} -power
add_global_connection -net {VSS} -pin_pattern {^vss$} -ground
# padframe io power pins
add_global_connection -net {IOVDD} -pin_pattern {^iovdd$} -power
add_global_connection -net {IOVSS} -pin_pattern {^iovss$} -ground
# add_global_connection -inst_pattern sg13g2_IOPad_clk -net clk -pin_pattern p2c
global_connect


# core voltage domain
set_voltage_domain -name {CORE} -power {VDD} -ground {VSS}
# stdcell grid
define_pdn_grid -name {grid} -voltage_domains {CORE}

# we should remove the -connect_to_pads option
add_pdn_ring -grid {grid} -layers {TopMetal1 TopMetal2} -widths {15.0} -spacings {5.0} -core_offsets {4.5} -connect_to_pads
#add_pdn_ring -grid {grid} -layers {TopMetal1 TopMetal2} -widths {15.0} -spacings {2.0} -core_offsets {4.5}
add_pdn_stripe -grid {grid} -layer {Metal1} -width {0.44} -pitch {7.56} -offset {0} -followpins -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {TopMetal1} -width {5.000} -pitch {75.6} -offset {13.600} -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {TopMetal2} -width {5.000} -pitch {75.6} -offset {13.600} -extend_to_core_ring
add_pdn_connect -grid {grid} -layers {Metal1 TopMetal1}
add_pdn_connect -grid {grid} -layers {TopMetal1 TopMetal2}

