; SETUP
G21 ;metric values
G90 ;absolute positioning
M82 ;set extruder to absolute mode
M107 ;start with the fan off
G28 X0 Y0 ;move X/Y to min endstops
G28 Z0 ;move Z to min endstops
; BED MESH
M501 ;load bed level mesh
M420 S1 ; apply to extruder 1
; JUNC DEV
M205 J0.050 ; set Junction Deviation
; PRIME NOZZLE
G0 Z0.15 ;lower build plate 0.015mm
G92 E0 ;zero the extruded length
G1 X40 E25 F500 ;extrude 25mm of filament in a 4cm line.
G92 E0 ;zero the extruded length again
G1 E-1 F500 ;retract a little
G1 X80 F4000 ;quickly wipe away from the filament line
; START
M117 Printing...
G5
; Set Linear Advance K-Value
; Requires: https://github.com/fieldOfView/Cura-LinearAdvanceSettingPlugin
M900 K{material_linear_advance_factor}
M900 W{line_width} H{layer_height} D{material_diameter}
; END START GCODE
