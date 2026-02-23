# ===========================================================================
# Power grid generation script, executed in the OpenROAD.GeneratePDN step
# Alfonso Cortés - Inria AIO
# Based on https://github.com/mole99/greyhound-ihp
#
# ===========================================================================

#source $::env(SCRIPTS_DIR)/openroad/common/set_global_connections.tcl
#set_global_connections

# stdcell power pins
add_global_connection -net {VDD1} -pin_pattern {^VDD$} -power
#add_global_connection -net {VDD} -pin_pattern {^VDDPE$}
#add_global_connection -net {VDD} -pin_pattern {^VDDCE$}
add_global_connection -net {VSS} -pin_pattern {^VSS$} -ground
#add_global_connection -net {VSS} -pin_pattern {^VSSE$}

# sram power pins (alternative to using variable PDN_MACRO_CONNECTIONS)
#add_global_connection -net {VDD} -inst_pattern {^memory.sram.*} -pin_pattern {VDDARRAY!} -power
#add_global_connection -net {VDD} -inst_pattern {^memory.sram.*} -pin_pattern {VDD!} -power
#add_global_connection -net {VSS} -inst_pattern {^memory.sram.*} -pin_pattern {VSS!} -ground

global_connect


# core voltage domain
set_voltage_domain -name {CORE} -power {VDD1} -ground {VSS}

# stdcell grid
define_pdn_grid -name {grid} -voltage_domains {CORE}
add_pdn_ring -grid {grid} -layers {TopMetal1 TopMetal2} -widths {15.0} -spacings {5.0} -core_offsets {4.5}
#add_pdn_ring -grid {grid} -layers {TopMetal1 TopMetal2} -widths {15.0} -spacings {2.0} -core_offsets {4.5}
add_pdn_stripe -grid {grid} -layer {Metal1} -width {0.44} -pitch {7.56} -offset {0} -followpins -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {TopMetal1} -width {5.000} -pitch {75.6} -offset {13.600} -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {TopMetal2} -width {5.000} -pitch {75.6} -offset {13.600} -extend_to_core_ring
add_pdn_connect -grid {grid} -layers {Metal1 TopMetal1}
add_pdn_connect -grid {grid} -layers {TopMetal1 TopMetal2}

# sram macro grid, hierarchical method
# define_pdn_grid -macro -name {sram_logic} -voltage_domains {CORE} -cells {RM_IHPSG13_1P_256x8_c3_bm_bist}
# #define_pdn_grid -macro -name {sram_grid} -voltage_domains {CORE} -instances {memory.sram_0}  
# add_pdn_stripe -grid {sram_logic} -layer {Metal5} -width {3} -pitch {20} -offset {1.0} -starts_with POWER
# add_pdn_connect -grid {sram_logic} -layers {Metal5 TopMetal1}
# add_pdn_connect -grid {sram_logic} -layers {Metal4 Metal5}

pdngen

# sram array voltage domain
set_voltage_domain -name {PUF} -power {VDD1} -ground {VSS} -secondary_power {VDD2}
define_pdn_grid -macro -name {sram_array} -voltage_domains {CORE} -cells {RM_IHPSG13_1P_256x8_c3_bm_bist}
add_pdn_stripe -grid {sram_array} -layer {Metal5} -width {3} -pitch {12} -offset {0.6} -starts_with POWER
add_pdn_connect -grid {sram_array} -layers {Metal5 TopMetal1}
add_pdn_connect -grid {sram_array} -layers {Metal4 Metal5}
