
# Template project with padring

Before starting, it is neccesary to replace the IHP-sg13g2 configuration file with the one provided in `/ihp-sg13g2_config` to declare PDK variables that are not yet in the main branch of the PDK.

Then copy this folder to `librelane/designs/<your_project>` and from there you can run it with `librelane config.yaml -p ihp-sg13g2` 

Replace `test.v` with your source files and update `config.yaml` and `constraint.sdc`. The main variables that you might need to change are:
- DESIGN_NAME:		name of the top module
- VERILOG_FILES:	list of source file paths (including pads)
- DIE_AREA:		total area coordinates
- CORE_AREA:		design area coordinates (where the standard cells will be placed)
- PATH_IO_xxx:		4 lists with pairs `[pad_type, instance_name]`
