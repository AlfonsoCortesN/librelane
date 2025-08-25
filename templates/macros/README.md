
# Template project with macro

Copy this folder to `librelane/designs/<your_project>` and from there you can run it with `librelane config.yaml -p ihp-sg13g2`. 
If LibreLane fails to find the pdk, add options `--manual-pdk --pdk-root <directory>`.

Replace `test.v` with your source files and update `config.yaml` and `constraint.sdc`. The main variables that you might need to change are:
- DESIGN_NAME:		name of the top module
- VERILOG_FILES:	list of source file paths (including pads)
- DIE_AREA:			total area coordinates
- CORE_AREA:		design area coordinates (where the standard cells will be placed)
- FP_OBSTRUCTIONS:	placement obstructions
- MACROS:			macro master and instances declaration (with paths to GDS, LEF and netlist) 
- ROUTING_OBSTRUCTIONS:		blocks routing in specific layers
- PDN_MACRO_CONNECTIONS:	macro power supply port names

TODO: add macro `.lib` files
