; HEADER_BLOCK_START
; BambuStudio 02.07.01.57
; model printing time: 10m 7s; total estimated time: 15m 27s
; total layer number: 10
; total filament length [mm] : 138.44,551.96
; total filament volume [cm^3] : 332.99,1327.63
; total filament weight [g] : 0.42,1.67
; filament_density: 1.26,1.26
; filament_diameter: 1.75,1.75
; max_z_height: 2.00
; filament: 1,2
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0
; additional_cooling_fan_speed = 0,0
; additional_fan_full_speed_layer = 0,0
; alternate_extra_wall = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 
; bed_temperature_formula = by_highest_temp
; before_layer_change_gcode = 
; best_object_pos = 0.3,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 25,50
; brim_object_gap = 0.1
; brim_type = outer_only
; brim_width = 3
; chamber_temperatures = 0,0
; change_filament_gcode = ;======== H2D ========\n;===== 20260116 =====\nM993 A2 B2 C2 ; nozzle cam detection allow status save.\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\n{if (filament_type[next_extruder] == \"PLA\") ||  (filament_type[next_extruder] == \"PETG\")\n ||  (filament_type[next_extruder] == \"PLA-CF\")  ||  (filament_type[next_extruder] == \"PETG-CF\")}\nM1015.4 S1 K0 ;disable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620 S[next_extruder]A\nM1002 gcode_claim_action : 4\nM204 S9000\n\nG1 Z{max_layer_z + 3.0} F1200\n\nM400\nM106 P1 S0\nM106 P2 S0\n\n{if toolchange_count == 2}\n; get travel path for change filament\n;M620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\n;M620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\n;M620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\n\n{if ((filament_type[current_extruder] == \"PLA\") || (filament_type[current_extruder] == \"PLA-CF\") || (filament_type[current_extruder] == \"PETG\")) && (nozzle_diameter[current_extruder] == 0.2)}\nM620.10 A0 F74.8347 L[flush_length] H{nozzle_diameter[current_extruder]} T{flush_temperatures[current_extruder]} P[old_filament_temp] S1\n{else}\nM620.10 A0 F{flush_volumetric_speeds[current_extruder]/2.4053*60*0.8} L[flush_length] H{nozzle_diameter[current_extruder]} T{flush_temperatures[current_extruder]} P[old_filament_temp] S1\n{endif}\n\n{if ((filament_type[next_extruder] == \"PLA\") || (filament_type[next_extruder] == \"PLA-CF\") || (filament_type[next_extruder] == \"PETG\")) && (nozzle_diameter[next_extruder] == 0.2)}\nM620.10 A1 F74.8347 L[flush_length] H{nozzle_diameter[next_extruder]} T{flush_temperatures[next_extruder]} P[new_filament_temp] S1\n{else}\nM620.10 A1 F{flush_volumetric_speeds[next_extruder]/2.4053*60*0.8} L[flush_length] H{nozzle_diameter[next_extruder]} T{flush_temperatures[next_extruder]} P[new_filament_temp] S1\n{endif}\n\n{if long_retraction_when_cut}\nM620.11 P1 I[current_extruder] E-{retraction_distance_when_cut} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 P0 I[current_extruder] E0\n{endif}\n\n{if long_retraction_when_ec}\nM620.11 K1 I[current_extruder] R{retraction_distance_when_ec} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[current_extruder] R0\n{endif}\n\nM620.15 C{new_filament_temp - filament_cooling_before_tower[next_extruder]}\n\nM628 S1\n{if filament_type[current_extruder] == \"TPU\"}\nM620.11 S0 L0 I[current_extruder] E-{retraction_distances_when_cut[current_extruder]} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\n{if (filament_type[current_extruder] == \"PA\") || (filament_type[current_extruder] == \"PA-GF\")}\nM620.11 S1 L0 I[current_extruder] R4 D2 E-{retraction_distances_when_cut[current_extruder]} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{else}\nM620.11 S1 L0 I[current_extruder] R10 D8 E-{retraction_distances_when_cut[current_extruder]} F{max((flush_volumetric_speeds[current_extruder]/2.4053*60), 200)}\n{endif}\n{endif}\nM629\n\n{if (filament_type[current_extruder] == \"TPU\" || filament_type[next_extruder] == \"TPU\") && (old_extruder_variant != \"Direct Drive TPU High Flow\")}\nM620.11 H2 C331\n{else}\nM620.11 H0\n{endif}\n\n{if  (old_extruder_variant == \"Direct Drive TPU High Flow\") && (filament_map[current_extruder] == 2) && (filament_map[next_extruder] == 1)}\n;debug log pe:{previous_extruder} ce:{current_extruder} ne:{next_extruder} oev: {old_extruder_variant} nev:{new_extruder_variant}\n;debug fm-curr:{filament_map[current_extruder]} fm-next:{filament_map[next_extruder]}\n;sw from R2L&TPU kit, travel run a distance for sketch TPU\nG1 X30 Y30 F5000\nM400\nG1 X300 Y30 F5000\nM400\n{endif}\n\nT[next_extruder]\n\n;deretract\n{if filament_type[next_extruder] == \"TPU\"}\n{else}\n{if (filament_type[next_extruder] == \"PA\") || (filament_type[next_extruder] == \"PA-GF\")}\n;VG1 E1 F{max(new_filament_e_feedrate, 200)}\n;VG1 E1 F{max(new_filament_e_feedrate/2, 100)}\n{else}\n;VG1 E4 F{max(new_filament_e_feedrate, 200)}\n;VG1 E4 F{max(new_filament_e_feedrate/2, 100)}\n{endif}\n{endif}\n\n; VFLUSH_START\n\n{if flush_length>41.5}\n;VG1 E41.5 F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n;VG1 E{flush_length-41.5} F{new_filament_e_feedrate}\n{else}\n;VG1 E{flush_length} F{min(old_filament_e_feedrate,new_filament_e_feedrate)}\n{endif}\n\nSYNC T{ceil(flush_length / 125) * 5}\n\n; VFLUSH_END\n\nM1002 set_filament_type:{filament_type[next_extruder]}\n\nM400\nM83\n{if next_extruder < 255}\n\nM620.10 R{new_extruder_retracted_length}\nM628 S0\n;VM109 S[new_filament_temp]\nM629\nM400\n\n;prime_tower_interface\n{if is_prime_tower_interface && filament_tower_interface_purge_volume !=0}\nG150.1\nM620.13 W0 L{filament_tower_interface_purge_volume} T{filament_tower_interface_print_temp} R0.0\n{endif}\n;prime_tower_interface\n\nM983.3 F{filament_max_volumetric_speed[next_extruder]/2.4} A0.4 R{new_extruder_retracted_length}\n\nM400\n{if wipe_avoid_perimeter}\nG1 Y320 F30000\nG1 X{wipe_avoid_pos_x} F30000\n{endif}\nG1 Y295 F30000\nG1 Y265 F18000\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n\nM993 A3 B3 C3 ; nozzle cam detection allow status restore.\n\n{if (filament_type[next_extruder]  == \"TPU\")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[next_extruder] == \"PLA\") ||  (filament_type[next_extruder] == \"PETG\")\n ||  (filament_type[next_extruder] == \"PLA-CF\")  ||  (filament_type[next_extruder] == \"PETG-CF\")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 ; disable E air printing detect\n{endif}\n\nM620.6 I[next_extruder] W1 ;enable ams air printing detect\nM1002 gcode_claim_action : 0
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200
; close_additional_fan_first_x_layers = 1,1
; close_fan_the_first_x_layers = 1,1
; complete_print_exhaust_fan_speed = 70,70
; cool_plate_temp = 35,35
; cool_plate_temp_initial_layer = 35,35
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10,10
; cooling_slowdown_logic = uniform_cooling,uniform_cooling
; counter_coef_1 = 0,0
; counter_coef_2 = 0.003,0.003
; counter_coef_3 = 0.01,0.01
; counter_limit_max = 0.088,0.088
; counter_limit_min = -0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 5000,8000
; default_filament_colour = ;
; default_filament_profile = "Bambu PLA Basic @BBL H2D"
; default_jerk = 0
; default_nozzle_volume_type = Standard,Standard
; default_print_profile = 0.20mm Standard @BBL H2D
; deretraction_speed = 30,30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50
; different_settings_to_system = bridge_speed;brim_type;brim_width;default_acceleration;gap_infill_speed;initial_layer_acceleration;initial_layer_infill_speed;initial_layer_speed;initial_layer_travel_acceleration;inner_wall_speed;internal_solid_infill_speed;outer_wall_acceleration;outer_wall_speed;overhang_2_4_speed;overhang_3_4_speed;overhang_4_4_speed;overhang_totally_speed;skeleton_infill_density;skin_infill_density;sparse_infill_acceleration;sparse_infill_density;sparse_infill_pattern;sparse_infill_speed;support_interface_speed;support_speed;top_surface_acceleration;top_surface_speed;travel_acceleration;travel_speed;vertical_shell_speed;additional_cooling_fan_speed;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0,0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_order_independent_overlap_carving = 0
; enable_overhang_bridge_fan = 1,1
; enable_overhang_speed = 1,1
; enable_pre_heating = 1
; enable_pressure_advance = 0,0
; enable_prime_tower = 1
; enable_support = 0
; enable_support_ironing = 0
; enable_tower_interface_features = 1
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 55,55
; eng_plate_temp_initial_layer = 55,55
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 50
; extruder_clearance_height_to_lid = 201
; extruder_clearance_height_to_rod = 47.4
; extruder_clearance_max_radius = 96
; extruder_colour = #018001;#018001
; extruder_max_nozzle_count = 1,1
; extruder_nozzle_stats = Standard#1;Standard#1
; extruder_offset = 0x0,0x0
; extruder_printable_area = 0x0,325x0,325x320,0x320#25x0,350x0,350x320,25x320
; extruder_printable_height = 320,325
; extruder_type = Direct Drive,Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow";"Direct Drive Standard,Direct Drive High Flow,Direct Drive TPU High Flow"
; fan_cooling_layer_time = 100,100
; fan_direction = left
; fan_max_speed = 80,80
; fan_min_speed = 60,60
; filament_adaptive_volumetric_speed = 0,0
; filament_adhesiveness_category = 100,100
; filament_bridge_speed = 25,25
; filament_change_length = 4,4
; filament_change_length_nc = 10,10
; filament_colour = #00AE42;#FFFF00
; filament_colour_type = 1;1
; filament_cooling_before_tower = 10,10
; filament_cost = 24.99,24.99
; filament_density = 1.26,1.26
; filament_dev_ams_drying_ams_limitations = 1;0;1;0
; filament_dev_ams_drying_heat_distortion_temperature = 45,45
; filament_dev_ams_drying_temperature = 45,45,45,45,45,45,45,45
; filament_dev_ams_drying_time = 12,12,12,12,12,12,12,12
; filament_dev_chamber_drying_bed_temperature = 70,70
; filament_dev_chamber_drying_time = 12,12
; filament_dev_drying_cooling_temperature = 45,45
; filament_dev_drying_softening_temperature = 50,50
; filament_diameter = 1.75,1.75
; filament_enable_overhang_speed = 1,1
; filament_end_gcode = "; filament end gcode \n";"; filament end gcode \n"
; filament_extruder_compatibility = 0,0
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.98
; filament_flush_temp = 0,0
; filament_flush_temp_fast = 0,0
; filament_flush_volumetric_speed = 0,0
; filament_ids = GFA00;P0188981
; filament_is_mixed = 0,0
; filament_is_support = 0,0
; filament_map = 2,1
; filament_map_2 = 1,0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 25,25
; filament_metal_stickiness = None,None
; filament_minimal_purge_on_wipe_tower = 15,15
; filament_mixed_components = ;
; filament_mixed_gradient = 0,0
; filament_mixed_gradient_curve = ;
; filament_mixed_gradient_per_part = 0,0
; filament_mixed_gradient_range = ;
; filament_mixed_sublayer_ratios = ;
; filament_multi_colour = #00AE42;#FFFF00
; filament_notes = 
; filament_nozzle_map = 1,0
; filament_overhang_1_4_speed = 0,0
; filament_overhang_2_4_speed = 50,50
; filament_overhang_3_4_speed = 30,30
; filament_overhang_4_4_speed = 10,10
; filament_overhang_totally_speed = 10,10
; filament_pre_cooling_temperature = 0,0
; filament_pre_cooling_temperature_nc = 0,0
; filament_preheat_temperature_delta = 10,10
; filament_prime_volume = 30,30
; filament_prime_volume_nc = 60,60
; filament_printable = 3,3
; filament_ramming_travel_time = 0,0
; filament_ramming_travel_time_nc = 0,0
; filament_ramming_volumetric_speed = -1,-1
; filament_ramming_volumetric_speed_nc = -1,-1
; filament_retract_length_nc = 14,14
; filament_retraction_length = 0.4,0.4
; filament_scarf_gap = 0%,0%
; filament_scarf_height = 10%,10%
; filament_scarf_length = 10,10
; filament_scarf_seam_type = none,none
; filament_self_index = 1,2
; filament_settings_id = "Bambu PLA Wing";"Protopasta PLA Conductive @Bambu Lab H2D 0.4 nozzle"
; filament_shrink = 100%,100%
; filament_soluble = 0,0
; filament_start_gcode = "; filament start gcode\n";"; filament start gcode\n"
; filament_tower_interface_pre_extrusion_dist = 10,10
; filament_tower_interface_pre_extrusion_length = 0,0
; filament_tower_interface_print_temp = -1,-1
; filament_tower_interface_purge_volume = 20,20
; filament_tower_ironing_area = 4,4
; filament_type = PLA;PLA
; filament_velocity_adaptation_factor = 1,1
; filament_vendor = "Bambu Lab";Protopasta
; filament_volume_map = 0,0
; filament_wipe = 1,1
; filament_wipe_distance = 1,1
; filament_z_hop_types = Spiral Lift,Spiral Lift
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0,0
; first_x_layer_part_fan_speed = 0,0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1,1
; flush_multiplier_fast = 1.2,1.2
; flush_volumes_matrix = 0,270,120,0,0,270,120,0
; flush_volumes_vector = 140,140,140,140
; full_fan_speed_layer = 0,0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 125,250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0,0
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0,0
; hole_coef_2 = -0.008,-0.008
; hole_coef_3 = 0.18,0.18
; hole_limit_max = 0.22,0.22
; hole_limit_min = 0.088,0.088
; host_type = octoprint
; hot_plate_temp = 55,55
; hot_plate_temp_initial_layer = 55,55
; hotend_cooling_rate = 2,2
; hotend_heating_rate = 3.6,3.6
; impact_strength_z = 13.8,13.8
; independent_support_layer_height = 0
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = "0.20mm Standard @BBL H2D";"Bambu PLA Basic @BBL H2D";;
; initial_layer_acceleration = 250,500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 50,105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 25,50
; initial_layer_travel_acceleration = 3000,6000
; inner_wall_acceleration = 0,0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 150,300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 100,250
; ironing_direction = 45
; ironing_fan_speed = -1,-1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ;======== H2D 20250710 layer_change ========\n; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change\n
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0,0
; long_retractions_when_ec = 1,1
; machine_bed_mass_Y = 0
; machine_end_gcode = ;========== H2D end ==========\n;===== date: 2025/12/26 =====\n\nG392 S0 ;turn off nozzle clog detect\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nM400\nM211 Z1\nG1 Z{max_layer_z + 0.4} F900 ; lower z a little\n\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    G150.3\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S5 ;wait for last picture to be taken\nM623  ;end of \"timelapse_record_flag\"\n\nG90\nG1 Z{max_layer_z + 10} F900 ; lower z a little\n\nG90\nM141 S0 ; turn off chamber heating\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\nM106 P9 S0 ; turn off ext toodhead cooling fan\n; pull back filament to AMS\nM620 S65535\nT65535\nG150.2\nM621 S65535\n\nM620 S65279\nT65279\nG150.2\nM621 S65279\n\nG150.3\n\nM104 S0 T0; turn off hotend\nM104 S0 T1; turn off hotend\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (100.0 - max_layer_z/2) > 0}\n    {if (max_layer_z + 100.0 - max_layer_z/2) < 320}\n        G1 Z{max_layer_z + 100.0 - max_layer_z/2} F600\n        G1 Z{max_layer_z + 98.0 - max_layer_z/2}\n    {else}\n        G1 Z320 F600\n        G1 Z320\n    {endif}\n{else}\n    {if (max_layer_z + 4.0) < 320}\n        G1 Z{max_layer_z + 4.0} F600\n        G1 Z{max_layer_z + 2.0}\n    {else}\n        G1 Z320 F600\n        G1 Z320\n    {endif}\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM1015.4 S0 K0 ;disable air printing detect\n\n;=====printer finish air purification=========\nM622.1 S0\nM1002 judge_flag print_finish_air_filt_flag\n\nM622 J1\nM1002 gcode_claim_action : 66\nM145 P1\nM106 P6 S255\nM400 S180\nM106 P6 S0\nM623\n\nM622 J2\nM1002 gcode_claim_action : 66\nM145 P0\nM106 P3 S127\nM400 S180\nM106 P3 S0\nM623\n;=====printer finish air purification=========\n\n\n;=====printer finish  sound=========\nM17\nM400 S1\nM1006 S1\nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 \nM1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 \nM1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 \nM1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 \nM1006 W\n;=====printer finish  sound=========\nM400\nM18\n\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 30
; machine_max_acceleration_e = 5000,5000,5000,5000
; machine_max_acceleration_extruding = 20000,20000,20000,20000
; machine_max_acceleration_retracting = 5000,5000,5000,5000
; machine_max_acceleration_travel = 9000,9000,9000,9000
; machine_max_acceleration_x = 20000,20000,20000,20000
; machine_max_acceleration_y = 20000,20000,20000,20000
; machine_max_acceleration_z = 500,500,500,500
; machine_max_force_Y = 0
; machine_max_jerk_e = 2.5,2.5,2.5,2.5
; machine_max_jerk_x = 9,9,9,9
; machine_max_jerk_y = 9,9,9,9
; machine_max_jerk_z = 3,3,3,3
; machine_max_printed_mass = 0
; machine_max_speed_e = 50,50,50,50
; machine_max_speed_x = 1000,1000,1000,1000
; machine_max_speed_y = 1000,1000,1000,1000
; machine_max_speed_z = 30,30,30,30
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: H2D =========================\n;===== date: 20260116 =====================\n\n;M1002 set_flag extrude_cali_flag=1\n;M1002 set_flag g29_before_print_flag=1\n;M1002 set_flag auto_cali_toolhead_offset_flag=1\n;M1002 set_flag build_plate_detect_flag=1\n\nM993 A0 B0 C0 ; nozzle cam detection not allowed.\n\nM400\n;M73 P99\n\nM960 S10 P1 ; ext fan led\n\n;=====printer start sound ===================\nM17\nM400 S1\nM1006 S1\nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 \nM1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 \nM1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 \nM1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 \nM1006 W\n;=====printer start sound ===================\n\n;===== reset machine status =================\nM204 S10000\nM630 S0 P0\n\nG90\nM17 D ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM1002 set_gcode_claim_speed_level 5 ;Reset speed level\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nG29.1 Z{+0.0} ; clear z-trim value first\nM983.1 M1 \nM901 D4\nM481 S0 ; turn off cutter pos comp\nG28.140 D0; reset pre-extrude z pos\n;===== reset machine status =================\n\nM620 M ;enable remap\n\n;===== avoid end stop =================\nG91\nG380 S2 Z42 F1200\nG380 S2 Z-12 F1200\nG90\n;===== avoid end stop =================\n\n;==== set airduct mode ==== \n\n{if (overall_chamber_temperature >= 40)}\n\n    M145 P1 ; set airduct mode to heating mode for heating\n    M106 P2 S0 ; turn off auxiliary fan\n    M106 P3 S0 ; turn off chamber fan\n\n{else}\n    M145 P0 ; set airduct mode to cooling mode for cooling\n    M106 P2 S178 ; turn on auxiliary fan for cooling\n    M106 P3 S127 ; turn on chamber fan for cooling\n    M140 S0 ; stop heatbed from heating\n\n    M1002 gcode_claim_action : 29\n    M191 S0 ; wait for chamber temp\n    M106 P2 S0 ; turn off auxiliary fan\n    {if (min_vitrification_temperature <= 50)}\n        {if (nozzle_diameter == 0.2)}\n            M142 P1 R30 S35 T40 U0.3 V0.5 W0.8 O40 ; set PLA/TPU ND0.2 chamber autocooling\n        {else}\n            M142 P1 R30 S40 T45 U0.3 V0.5 W0.8 O45; set PLA/TPU ND0.4 chamber autocooling\n        {endif}\n    {else}\n        {if (!is_all_bbl_filament)}\n            M142 P1 R35 S40 T45 U0.3 V0.5 W0.8 O45 L1 ; set third-party PETG chamber autocooling\n        {else}\n            {if (nozzle_diameter == 0.2)}\n                M142 P1 R35 S45 T50 U0.3 V0.5 W0.8 O50 L1 ; set PETG ND0.2 chamber autocooling\n            {else}\n                M142 P1 R35 S50 T55 U0.3 V0.5 W0.8 O55 L1 ; set PETG ND0.4 chamber autocooling\n            {endif}\n        {endif}\n    {endif}\n    {if(cooling_filter_enabled)}\n        M145.2 P0 F0\n    {else}\n        M145.2 P0 F1\n    {endif}\n{endif}\n;==== set airduct mode ==== \n\n;===== start to heat heatbed & hotend==========\n\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n\n    M104 S140 A\n    M140 S[bed_temperature_initial_layer_single]\n\n    ;===== set chamber temperature ==========\n    {if (overall_chamber_temperature >= 40)}\n        M145 P1 ; set airduct mode to heating mode\n        M141 S[overall_chamber_temperature] ; Let Chamber begin to heat\n    {endif}\n    ;===== set chamber temperature ==========\n\n;===== start to heat heatbead & hotend==========\n\n;====== cog noise reduction=================\nM982.2 S1 ; turn on cog noise reduction\n\n;===== first homing start =====\nM1002 gcode_claim_action : 13\n\nG28 X T300\n\nG150.1 F18000 ; wipe mouth to avoid filament stick to heatbed\nG150.3 F18000\nM400 P200\nM972 S24 P0 T2000\n\nM1002 gcode_claim_action : 74 ; Heatbed surface foreign object detection\n{if curr_bed_type==\"Textured PEI Plate\"}\nM972 S26 P0 C0\n{else}\nM972 S36 P0 C0 X1\n{endif}\nM972 S35 P0 C0\n\nM972 S41 P0 T5000 ; trash can anti-collision\n\nM1009 Q1 L1\nG91\nG380 S2 Z30 F1200 ; lower heatbed to move toolhead\nG90\nG1 X175 Y160 F30000\nG28 Z P0 T250\nM1009 Q1 L0\n\n;===== first homing end =====\n\nM400\n;M73 P99\n\n;===== detection start =====\n    \nM1002 judge_flag build_plate_detect_flag\nM622 S1\n    ;M1002 gcode_claim_action : 11 ; Indentifying build plate type\n    M972 S19 P0 C0    ; heatbed presence detection\n    M972 S31 P0 T5000 ; toolhead camera dirty detection\n    ;M1002 gcode_claim_action : 73 ; Build plate alignment detection\n    M972 S34 P0 T5000 ; heatbed plate offset detection\nM623\n\nM1002 gcode_claim_action : 72 ; Hotend Type Detection\nT1001\nM972 S14 P0 T5000 ; nozzle type detection\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} T{filament_map[initial_no_support_extruder] % 2} ; rise temp in advance\n\nG151 P{filament_map[initial_no_support_extruder] % 2} M ; plug the heat nozzle\n\n{if max_print_z >= 145}\nM1002 gcode_claim_action : 75 ; Heatbed underside foreign object detection\nG3811 Z{max_print_z}  ; Detect obstacles at the bottom of the heated bed\n{endif}\n\n;===== detection end =====\n\nM400\n;M73 P99\n\n;===== prepare print temperature and material ==========\nM400\nM211 X0 Y0 Z0 ;turn off soft endstop\nM975 S1 ; turn on input shaping\n\nG29.2 S0 ; avoid invalid abl data\n\n{if ((filament_type[initial_no_support_extruder] == \"PLA\") || (filament_type[initial_no_support_extruder] == \"PLA-CF\") || (filament_type[initial_no_support_extruder] == \"PETG\")) && (nozzle_diameter[initial_no_support_extruder] == 0.2)}\nM620.10 A0 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F74.8347 H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{else}\nM620.10 A0 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60*0.8} H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\nM620.10 A1 F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60*0.8} H{nozzle_diameter[initial_no_support_extruder]} T{flush_temperatures[initial_no_support_extruder]} P{nozzle_temperature_initial_layer[initial_no_support_extruder]} S1\n{endif}\n\nM620.11 P0 I[initial_no_support_extruder] E0\n\n{if long_retraction_when_ec }\nM620.11 K1 I[initial_no_support_extruder] R{retraction_distance_when_ec} F{max((flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60), 200)}\n{else}\nM620.11 K0 I[initial_no_support_extruder] R0\n{endif}\n\nM628 S1\n{if filament_type[initial_no_support_extruder] == \"TPU\"}\n    M620.11 S0 L0 I[initial_no_support_extruder] E-{retraction_distances_when_cut[initial_no_support_extruder]} F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n{else}\n{if (filament_type[initial_no_support_extruder] == \"PA\") ||  (filament_type[initial_no_support_extruder] == \"PA-GF\")}\n    M620.11 S1 L0 I[initial_no_support_extruder] R4 D2 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n{else}\n    M620.11 S1 L0 I[initial_no_support_extruder] R10 D8 E-{retraction_distances_when_cut[initial_no_support_extruder]} F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60}\n{endif}\n{endif}\nM629\n\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\nM1002 gcode_claim_action : 4\nM1002 set_filament_type:UNKNOWN\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM621 S[initial_no_support_extruder]A\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nM400\nM106 P1 S0\n\nG29.2 S1\n;===== prepare print temperature and material ==========\n\nM400\n;M73 P99\n\n;===== auto extrude cali start =========================\nM975 S1\nM1002 judge_flag extrude_cali_flag\n\nM622 J0\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\nM623\n\nM622 J1\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\nM622 J2\n    M1002 set_filament_type:{filament_type[initial_no_support_extruder]}\n    M1002 gcode_claim_action : 8\n\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n\n    G90\n    M83\n    M983.3 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4} A0.4 ; cali dynamic extrusion compensation\n\n    M400\n    M106 P1 S255\n    M400 S5\n    M106 P1 S0\n    G150.3\nM623\n\n;===== auto extrude cali end =========================\n\n{if filament_type[initial_no_support_extruder] == \"TPU\"}\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n    G150.2\n    G150.1\n{else}\n    M106 P1 S0\n    M400 S2\n    M109 S{nozzle_temperature[initial_no_support_extruder]} ; wait tmpr to extrude\n    M83\n    {if(nozzle_diameter == 0.8)}\n        G1 E60 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    {else}\n        G1 E45 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    {endif}\n    G1 E-3 F1800\n    M400 P500\n    G150.2\n    G150.1\n{endif}\n\nG91\nG1 Y-16 F12000 ; move away from the trash bin\nG90\n\nM400\n;M73 P99\n\n;===== wipe right nozzle start =====\n\nM1002 gcode_claim_action : 14\n    G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n    {if (overall_chamber_temperature >= 40)}\n        G150 T{nozzle_temperature_initial_layer[initial_no_support_extruder] - 80}\n    {endif}\nM106 S255 ; turn on fan to cool the nozzle\n\n;===== wipe left nozzle end =====\n\nM400\n;M73 P99\n\n{if (overall_chamber_temperature >= 40)}\n    M1002 gcode_claim_action : 49\n    M191 S[overall_chamber_temperature] ; wait for chamber temp\n{endif}\n\nM400\n;M73 P99\n\n;===== bed leveling ==================================\n\nM1002 judge_flag g29_before_print_flag\n\nM190 S[bed_temperature_initial_layer_single]; ensure bed temp\nM109 S140 A\nM106 S0 ; turn off fan , too noisy\n\nG91\nG1 Z5 F1200\nG90\nG1 X175 Y160 F30000\n\nM622 J1\n    M1002 gcode_claim_action : 1\n    G29.20 A3\n    G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]} R \n    M400\n    M500 ; save cali data\nM623\n    \nM622 J2\n    M1002 gcode_claim_action : 1\n    {if has_tpu_in_first_layer}\n        G29.20 A3\n        G29 A1 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]} R\n    {else}\n        G29.20 A4\n        G29 A2 O X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]} R\n    {endif}\n    M400\n    M500 ; save cali data\nM623\n\nM622 J0\n    G28 R\nM623\n\n;===== bed leveling end ================================\n\n;===== z ofst cali start =====\n\n    M190 S[bed_temperature_initial_layer_single]; ensure bed temp\n\n    G383 O0 M2 T140\n    M500\n\n;===== z ofst cali end =====\n\nG39.1 ; cali nozzle wrapped detection pos\nM500\n\nG90\nG1 Z5 F1200\nG1 X270 Y-0.5 F60000\nG28.140 S0 ; cali pre-extrude z pos\n\nM141 S[overall_chamber_temperature]\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} A\n\n;===== mech mode sweep start =====\n    M1002 gcode_claim_action : 3\n\n    G90\n    G1 Z5 F1200\n    G1 X187 Y160 F20000\n    T1000\n    M400 P200\n\n    M970.3 Q1 A5 K0 O1\n    M974 Q1 S2 P0\n\n    M970.3 Q0 A5 K0 O1\n    M974 Q0 S2 P0\n\n    M970.2 Q2 K0 W38 Z0.01\n    M974 Q2 S2 P0\n    M500\n\n    M975 S1\n;===== mech mode sweep end =====\n\nM400\n;M73 P99\n\nG150.3 ; move to garbage can to wait for temp\nM1026\nG29.9\n\n;===== xy ofst cali start =====\n\nM1002 judge_flag auto_cali_toolhead_offset_flag\n\nM622 J0\n    M1012.5 N1 R1\n    M500\nM623\n\nM622 J1\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383 O1 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n\nM622 J2\n    M1002 gcode_claim_action : 39\n    M141 S0\n    M620.17 T0 S{nozzle_temperature_initial_layer[(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])]} L{(first_non_support_filaments[0] != -1 ? first_non_support_filaments[0] : first_filaments[0])}\n    M620.17 T1 S{nozzle_temperature_initial_layer[(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])]} L{(first_non_support_filaments[1] != -1 ? first_non_support_filaments[1] : first_filaments[1])}\n    G383.3 T{nozzle_temperature_initial_layer[initial_no_support_extruder]} L{initial_no_support_extruder}\n    M500\n    M141 S[overall_chamber_temperature]\nM623\n;===== xy ofst cali end =====\n\nM400\n;M73 P99\n\nM1002 gcode_claim_action : 0\nM400\n\n;============switch again==================\n\nM211 X0 Y0 Z0 ;turn off soft endstop\nG91\nG1 Z6 F1200\nG90\nM1002 set_filament_type:{filament_type[initial_no_support_extruder]}\nM620 S[initial_no_support_extruder]A\nM400\nT[initial_no_support_extruder]\nM400\nM628 S0\nM629\nM400\nM621 S[initial_no_support_extruder]A\n\n;============switch again==================\n\nM400\n;M73 P99\n\n;===== wait temperature reaching the reference value =======\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; rise to print tmpr\n\nM140 S[bed_temperature_initial_layer_single] \nM190 S[bed_temperature_initial_layer_single] \n\n    ;========turn off light and fans =============\n    M960 S1 P0 ; turn off laser\n    M960 S2 P0 ; turn off laser\n    M106 S0 ; turn off fan\n    M106 P2 S0 ; turn off big fan\n    ;==== set ext toodhead cooling fan ==== \n    {if (min_vitrification_temperature <= 50)}\n    M106 P9 S255\n    {endif}\n    ;============set motor current==================\n    M400 S1\n\n;===== wait temperature reaching the reference value =======\n\nM400\n;M73 P99\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n    {if curr_bed_type==\"Textured PEI Plate\"}\n        {if nozzle_diameter[initial_no_support_extruder] == 0.2}\n            G29.1 Z{-0.01} ; for Textured PEI Plate\n        {else}\n            G29.1 Z{-0.02} ; for Textured PEI Plate\n        {endif}\n    {else}\n        {if nozzle_diameter[initial_no_support_extruder] == 0.2}\n            G29.1 Z{0.01} ; for Textured PEI Plate\n        {endif}\n    {endif}\n    \nG150.1\n\nM975 S1 ; turn on mech mode supression\nM983.4 S1 ; turn on deformation compensation \nG29.2 S1 ; turn on pos comp\nG29.7 S1\n\nG90\nG1 Z5 F1200\nG1 Y295 F30000\nG1 Y265 F18000\n\n;===== nozzle load line ===============================\n    G29.2 S1 ; ensure z comp turn on\n    G90\n    M83\n    G1 Z5 F1200\n    G1 X270 Y-0.5 F60000\n    G28.14 R0\n    G29.2 S0\n    G91\n    G1 Z0.8 F1200\n    G90\n    G1 X250 F60000\n    M109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\n    M83\n{if (filament_type[initial_no_support_extruder] == \"TPU\")}\n    G1 E5 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n{endif}\n    G1 E5 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    G1 X290 E10 F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60}\n    G91\n    G3 Z0.4 I1.217 J0 P1 F60000\n    G90\n    M83\n    G29.2 S1 ; ensure z comp turn on\n;===== noozle load line end ===========================\n\nM400\n;M73 P99\n\nM993 A1 B1 C1 ; nozzle cam detection allowed.\n\n{if (filament_type[initial_no_support_extruder] == \"TPU\")}\nM1015.3 S1;enable tpu clog detect\n{else}\nM1015.3 S0;disable tpu clog detect\n{endif}\n\n{if (filament_type[initial_no_support_extruder] == \"PLA\") ||  (filament_type[initial_no_support_extruder] == \"PETG\")\n ||  (filament_type[initial_no_support_extruder] == \"PLA-CF\")  ||  (filament_type[initial_no_support_extruder] == \"PETG-CF\")}\nM1015.4 S1 K1 H[nozzle_diameter] ;enable E air printing detect\n{else}\nM1015.4 S0 K0 H[nozzle_diameter] ;disable E air printing detect\n{endif}\n\nM620.6 I[initial_no_support_extruder] W1 ;enable ams air printing detect\n\nM211 Z1\nG29.99\n\n\n
; machine_switch_extruder_time = 5.6
; machine_unload_filament_time = 30
; master_extruder_id = 2
; max_bridge_length = 0
; max_layer_height = 0.28,0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08,0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 45%
; no_slow_down_for_cooling_on_outwalls = 0,0
; nozzle_diameter = 0.4,0.4
; nozzle_flush_dataset = 1,1
; nozzle_height = 4
; nozzle_temperature = 220,220
; nozzle_temperature_initial_layer = 220,220
; nozzle_temperature_range_high = 240,220
; nozzle_temperature_range_low = 190,190
; nozzle_type = hardened_steel,hardened_steel
; nozzle_volume = 130,145
; nozzle_volume_type = Standard,Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 2500,5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 100,200
; overhang_1_4_speed = 0,0
; overhang_2_4_speed = 25,50
; overhang_3_4_speed = 15,30
; overhang_4_4_speed = 5,10
; overhang_fan_speed = 100,100
; overhang_fan_threshold = 50%,50%
; overhang_threshold_participating_cooling = 95%,95%
; overhang_totally_speed = 5,10
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0,0
; physical_extruder_map = 1,0
; post_process = 
; pre_start_fan_time = 2,2
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02
; prime_tower_brim_width = -1
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 1
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 60
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab H2D 0.4 nozzle"
; print_extruder_id = 1,2
; print_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = wing
; printable_area = 0x0,350x0,350x320,0x320
; printable_height = 325
; printer_extruder_id = 1,2
; printer_extruder_variant = "Direct Drive Standard";"Direct Drive Standard"
; printer_model = Bambu Lab H2D
; printer_notes = 
; printer_settings_id = Bambu Lab H2D 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3,3
; resolution = 0.012
; retract_before_wipe = 0%,0%
; retract_length_toolchange = 2,2
; retract_lift_above = 0,0
; retract_lift_below = 319,319
; retract_restart_extra = 0,0
; retract_restart_extra_toolchange = 0,0
; retract_when_changing_layer = 1,1
; retraction_distances_when_cut = 10,10
; retraction_distances_when_ec = 10,10
; retraction_length = 0.8,0.8
; retraction_minimum_travel = 1,1
; retraction_speed = 30,30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 100%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 100%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1
; slow_down_layer_time = 4,4
; slow_down_min_speed = 20,20
; slowdown_end_acc = 100000,100000
; slowdown_end_height = 400,400
; slowdown_end_speed = 1000,1000
; slowdown_start_acc = 100000,100000
; slowdown_start_height = 0,0
; slowdown_start_speed = 1000,1000
; small_perimeter_speed = 50%,50%
; small_perimeter_threshold = 0,0
; smooth_coefficient = 4
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 50,100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 100%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = zig-zag
; sparse_infill_speed = 130,350
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 40,45
; supertack_plate_temp_initial_layer = 40,45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 1
; support_cooling_filter = 1
; support_critical_regions_only = 0
; support_expansion = 0
; support_fast_purge_mode = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 40,80
; support_interface_top_layers = 2
; support_ironing_direction = 0
; support_ironing_flow = 10%
; support_ironing_inset = 0
; support_ironing_pattern = zig-zag
; support_ironing_spacing = 0.15
; support_ironing_speed = 30
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_skip_flush = 0
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 75,150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45,45
; template_custom_gcode = 
; textured_plate_temp = 55,55
; textured_plate_temp_initial_layer = 55,55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;======== H2D 20251104========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\n\nM1002 judge_flag timelapse_record_flag\n\n    M622 J1\n    M993 A2 B2 C2\n    M993 A0 B0 C0\n    \n    M622.1 S0 ; for prev firmware, default turn off\n    M1002 set_flag smooth_safe_pos_suppoprt_flag=1\n    M1002 judge_flag smooth_safe_pos_suppoprt_flag\n    \n    M622 J0\n        {if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0) }\n            {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n                M83\n                G1 Z{max_layer_z + 0.4} F1200\n                M400\n            {endif}\n        {endif}\n\n        {if has_timelapse_safe_pos && timelapse_type == 0 && !spiral_mode}\n            M9711 M{timelapse_type} E{most_used_physical_extruder_id} X{timelapse_pos_x} Y{timelapse_pos_y} Z{layer_z + 0.4} S11 C10 O0 T3000\n        {else}\n            {if spiral_mode}\n                M971 S11 C10 O0\n                M1004 S5 P1  ; external shutter\n            {else}\n                M9711 M{timelapse_type} E{most_used_physical_extruder_id} Z{layer_z + 0.4} S11 C10 O0 T3000\n            {endif}\n        {endif}\n\n        {if !spiral_mode && !(has_timelapse_safe_pos && timelapse_type == 0) }\n            {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n                G90\n                G1 Z{max_layer_z + 3.0} F1200\n                G1 Y295 F30000\n                G1 Y265 F18000\n                M83\n            {endif}\n        {endif}\n    M623\n\n    M622 J1\n        {if !spiral_mode && !(has_timelapse_safe_pos) }\n            {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n                M83\n                G1 Z{max_layer_z + 0.4} F1200\n                M400\n            {endif}\n        {endif}\n\n        {if has_timelapse_safe_pos && !spiral_mode}\n            M9711 M{timelapse_type} E{most_used_physical_extruder_id} U{timelapse_pos_x} V{timelapse_pos_y} Z{layer_z + 0.4} S11 C10 O0 T3000\n        {else}\n            {if spiral_mode}\n                M971 S11 C10 O0\n                M1004 S5 P1  ; external shutter\n            {else}\n                M9711 M{timelapse_type} E{most_used_physical_extruder_id} Z{layer_z + 0.4} S11 C10 O0 T3000\n            {endif}\n        {endif}\n\n        {if !spiral_mode && !(has_timelapse_safe_pos) }\n            {if most_used_physical_extruder_id!= curr_physical_extruder_id || timelapse_type == 1}\n                G90\n                G1 Z{max_layer_z + 3.0} F1200\n                G1 Y295 F30000\n                G1 Y265 F18000\n                M83\n            {endif}\n        {endif}\n    M623\n\n    M993 A3 B3 C3\n\nM623\n; SKIPPABLE_END\n
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1,1
; top_surface_acceleration = 1000,2000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 100,200
; top_z_overrides_xy_distance = 0
; travel_acceleration = 5000,10000
; travel_jerk = 9
; travel_short_distance_acceleration = 250,250
; travel_speed = 250,1000
; travel_speed_z = 0,0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab H2D Pro 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 40%,80%
; volumetric_speed_coefficients = "0 0 0 0 0 0";"0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1,1
; wipe_distance = 2,2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 220.697
; wrapping_detection_gcode = ;======== H2D 20250729 clumping ========\n{if !spiral_mode}\n    M622.1 S0 ; for previous firmware, default turn off\n    M1002 set_flag g39_forced_detection_flag=1\n    M1002 judge_flag g39_forced_detection_flag\n    M622 J1\n        {if layer_num == 3 || layer_num == 10 || layer_num == 19}\n            M993 A2 B2 C2 ; nozzle cam detection allow status save.\n            M993 A0 B0 C0 ; nozzle cam detection not allowed.\n\n            M400 P100\n\n            G39\n\n            G90\n            G1 Y295 F30000\n            G1 Y265 F18000\n            \n            M993 A3 B3 C3 ; nozzle cam detection allow status restore.\n        {endif}\n    M623\n{endif}\n
; wrapping_detection_layers = 20
; wrapping_exclude_area = 145x310,256x310,256x326,145x326
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 1
; z_hop = 0.4,0.4
; z_hop_types = Auto Lift,Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R15
M201 X20000 Y20000 Z500 E5000
M203 X1000 Y1000 Z30 E50
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: H2D =========================
;===== date: 20260116 =====================

;M1002 set_flag extrude_cali_flag=1
;M1002 set_flag g29_before_print_flag=1
;M1002 set_flag auto_cali_toolhead_offset_flag=1
;M1002 set_flag build_plate_detect_flag=1

M993 A0 B0 C0 ; nozzle cam detection not allowed.

M400
;M73 P99

M960 S10 P1 ; ext fan led

;=====printer start sound ===================
M17
M400 S1
M1006 S1
M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
M1006 A61 B9 L99 C61 D9 M99 E61 F9 N99 
M1006 A53 B9 L99 C53 D9 M99 E53 F9 N99 
M1006 A56 B9 L99 C56 D9 M99 E56 F9 N99 
M1006 A61 B18 L99 C61 D18 M99 E61 F18 N99 
M1006 W
;=====printer start sound ===================

;===== reset machine status =================
M204 S10000
M630 S0 P0

G90
M17 D ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M1002 set_gcode_claim_speed_level 5 ;Reset speed level
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
G29.1 Z0 ; clear z-trim value first
M983.1 M1 
M901 D4
M481 S0 ; turn off cutter pos comp
G28.140 D0; reset pre-extrude z pos
;===== reset machine status =================

M620 M ;enable remap

;===== avoid end stop =================
G91
G380 S2 Z42 F1200
G380 S2 Z-12 F1200
G90
;===== avoid end stop =================

;==== set airduct mode ==== 


    M145 P0 ; set airduct mode to cooling mode for cooling
    M106 P2 S178 ; turn on auxiliary fan for cooling
    M106 P3 S127 ; turn on chamber fan for cooling
    M140 S0 ; stop heatbed from heating

    M1002 gcode_claim_action : 29
    M191 S0 ; wait for chamber temp
    M106 P2 S0 ; turn off auxiliary fan
    
        
            M142 P1 R30 S40 T45 U0.3 V0.5 W0.8 O45; set PLA/TPU ND0.4 chamber autocooling
        
    
    
        M145.2 P0 F1
    

;==== set airduct mode ==== 

;===== start to heat heatbed & hotend==========

    M1002 set_filament_type:PLA

    M104 S140 A
    M140 S55

    ;===== set chamber temperature ==========
    
    ;===== set chamber temperature ==========

;===== start to heat heatbead & hotend==========

;====== cog noise reduction=================
M982.2 S1 ; turn on cog noise reduction

;===== first homing start =====
M1002 gcode_claim_action : 13

G28 X T300

G150.1 F18000 ; wipe mouth to avoid filament stick to heatbed
G150.3 F18000
M400 P200
M972 S24 P0 T2000

M1002 gcode_claim_action : 74 ; Heatbed surface foreign object detection

M972 S26 P0 C0

M972 S35 P0 C0

M972 S41 P0 T5000 ; trash can anti-collision

M1009 Q1 L1
G91
G380 S2 Z30 F1200 ; lower heatbed to move toolhead
G90
G1 X175 Y160 F30000
G28 Z P0 T250
M1009 Q1 L0

;===== first homing end =====

M400
;M73 P99

;===== detection start =====
    
M1002 judge_flag build_plate_detect_flag
M622 S1
    ;M1002 gcode_claim_action : 11 ; Indentifying build plate type
    M972 S19 P0 C0    ; heatbed presence detection
    M972 S31 P0 T5000 ; toolhead camera dirty detection
    ;M1002 gcode_claim_action : 73 ; Build plate alignment detection
    M972 S34 P0 T5000 ; heatbed plate offset detection
M623

M1002 gcode_claim_action : 72 ; Hotend Type Detection
T1001
M972 S14 P0 T5000 ; nozzle type detection

M104 S220 T1 ; rise temp in advance

G151 P1 M ; plug the heat nozzle



;===== detection end =====

M400
;M73 P99

;===== prepare print temperature and material ==========
M400
M211 X0 Y0 Z0 ;turn off soft endstop
M975 S1 ; turn on input shaping

G29.2 S0 ; avoid invalid abl data


M620.10 A0 F498.898 H0.4 T220 P220 S1
M620.10 A1 F498.898 H0.4 T220 P220 S1


M620.11 P0 I1 E0


M620.11 K1 I1 R10 F623.623


M628 S1


    M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629

M620 S1A   ; switch material if AMS exist
M1002 gcode_claim_action : 4
M1002 set_filament_type:UNKNOWN
M400
T1
M400
M628 S0
M629
M400
M1002 set_filament_type:PLA
M621 S1A

M104 S220
M400
M106 P1 S0

G29.2 S1
;===== prepare print temperature and material ==========

M400
;M73 P99

;===== auto extrude cali start =========================
M975 S1
M1002 judge_flag extrude_cali_flag

M622 J0
    M983.3 F10.4167 A0.4 ; cali dynamic extrusion compensation
M623

M622 J1
    M1002 set_filament_type:PLA
    M1002 gcode_claim_action : 8

    M109 S220

    G90
    M83
    M983.3 F10.4167 A0.4 ; cali dynamic extrusion compensation

    M400
    M106 P1 S255
    M400 S5
    M106 P1 S0
    G150.3
M623

M622 J2
    M1002 set_filament_type:PLA
    M1002 gcode_claim_action : 8

    M109 S220

    G90
    M83
    M983.3 F10.4167 A0.4 ; cali dynamic extrusion compensation

    M400
    M106 P1 S255
    M400 S5
    M106 P1 S0
    G150.3
M623

;===== auto extrude cali end =========================


    M106 P1 S0
    M400 S2
    M109 S220 ; wait tmpr to extrude
    M83
    
        G1 E45 F623.623
    
    G1 E-3 F1800
    M400 P500
    G150.2
    G150.1


G91
M73 P3 R14
G1 Y-16 F12000 ; move away from the trash bin
G90

M400
;M73 P99

;===== wipe right nozzle start =====

M1002 gcode_claim_action : 14
    G150 T220
    
M106 S255 ; turn on fan to cool the nozzle

;===== wipe left nozzle end =====

M400
;M73 P99



M400
;M73 P99

;===== bed leveling ==================================

M1002 judge_flag g29_before_print_flag

M190 S55; ensure bed temp
M109 S140 A
M106 S0 ; turn off fan , too noisy

G91
M73 P5 R14
G1 Z5 F1200
G90
G1 X175 Y160 F30000

M622 J1
    M1002 gcode_claim_action : 1
    G29.20 A3
    G29 A1 O X129.158 Y130.158 I91.6848 J112.518 R 
    M400
    M500 ; save cali data
M623
    
M622 J2
    M1002 gcode_claim_action : 1
    
        G29.20 A4
        G29 A2 O X129.158 Y130.158 I91.6848 J112.518 R
    
    M400
    M500 ; save cali data
M623

M622 J0
    G28 R
M623

;===== bed leveling end ================================

;===== z ofst cali start =====

    M190 S55; ensure bed temp

    G383 O0 M2 T140
    M500

;===== z ofst cali end =====

G39.1 ; cali nozzle wrapped detection pos
M500

G90
M73 P33 R10
G1 Z5 F1200
G1 X270 Y-0.5 F60000
G28.140 S0 ; cali pre-extrude z pos

M141 S0
M104 S220 A

;===== mech mode sweep start =====
    M1002 gcode_claim_action : 3

    G90
    G1 Z5 F1200
    G1 X187 Y160 F20000
    T1000
    M400 P200

    M970.3 Q1 A5 K0 O1
    M974 Q1 S2 P0

    M970.3 Q0 A5 K0 O1
    M974 Q0 S2 P0

    M970.2 Q2 K0 W38 Z0.01
    M974 Q2 S2 P0
    M500

    M975 S1
;===== mech mode sweep end =====

M400
;M73 P99

G150.3 ; move to garbage can to wait for temp
M1026
G29.9

;===== xy ofst cali start =====

M1002 judge_flag auto_cali_toolhead_offset_flag

M622 J0
    M1012.5 N1 R1
    M500
M623

M622 J1
    M1002 gcode_claim_action : 39
    M141 S0
    M620.17 T0 S220 L0
    M620.17 T1 S220 L1
    G383 O1 T220 L1
    M500
    M141 S0
M623

M622 J2
    M1002 gcode_claim_action : 39
    M141 S0
    M620.17 T0 S220 L0
    M620.17 T1 S220 L1
    G383.3 T220 L1
    M500
    M141 S0
M623
;===== xy ofst cali end =====

M400
;M73 P99

M1002 gcode_claim_action : 0
M400

;============switch again==================

M211 X0 Y0 Z0 ;turn off soft endstop
G91
G1 Z6 F1200
G90
M1002 set_filament_type:PLA
M620 S1A
M400
T1
M400
M628 S0
M629
M400
M621 S1A

;============switch again==================

M400
;M73 P99

;===== wait temperature reaching the reference value =======

M104 S220 ; rise to print tmpr

M140 S55 
M190 S55 

    ;========turn off light and fans =============
    M960 S1 P0 ; turn off laser
    M960 S2 P0 ; turn off laser
    M106 S0 ; turn off fan
    M106 P2 S0 ; turn off big fan
    ;==== set ext toodhead cooling fan ==== 
    
    M106 P9 S255
    
    ;============set motor current==================
    M400 S1

;===== wait temperature reaching the reference value =======

M400
;M73 P99

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
    
        
            G29.1 Z-0.02 ; for Textured PEI Plate
        
    
    
G150.1

M975 S1 ; turn on mech mode supression
M983.4 S1 ; turn on deformation compensation 
G29.2 S1 ; turn on pos comp
G29.7 S1

G90
G1 Z5 F1200
G1 Y295 F30000
G1 Y265 F18000

;===== nozzle load line ===============================
    G29.2 S1 ; ensure z comp turn on
    G90
    M83
    G1 Z5 F1200
    G1 X270 Y-0.5 F60000
    G28.14 R0
    G29.2 S0
    G91
    G1 Z0.8 F1200
    G90
    G1 X250 F60000
    M109 S220
    M83

    G1 E5 F623.623
    G1 X290 E10 F623.623
    G91
    G3 Z0.4 I1.217 J0 P1 F60000
    G90
    M83
    G29.2 S1 ; ensure z comp turn on
;===== noozle load line end ===========================

M400
;M73 P99

M993 A1 B1 C1 ; nozzle cam detection allowed.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect

M211 Z1
G29.99


; MACHINE_START_GCODE_END
M400
M104 T0 S25 N0 ;Multi extruder pre cooling
; filament start gcode
;VT1 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
M204 S5000
G1 Z.6 F15000
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.4 F1800
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 1/10
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change

M106 S0
M106 P2 S0
; OBJECT_ID: 199
M73 P34 R10
G1 X130.019 Y131.303 F15000
M204 S3000
G1 Z1
G1 Z.2
G1 E.4 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F1500
M204 S250
G1 X130.36 Y130.967 E.01785
G1 X130.757 Y130.702 E.01777
G1 X131.301 Y130.487 E.02178
G1 X132.016 Y130.386 E.0269
G1 X217.989 Y130.386 E3.20217
G1 X218.477 Y130.433 E.01826
G1 X218.939 Y130.569 E.01794
G1 X219.297 Y130.745 E.01484
G1 X219.697 Y131.019 E.01806
G1 X220.033 Y131.36 E.01785
G1 X220.298 Y131.758 E.01781
G1 X220.498 Y132.25 E.01977
G1 X220.614 Y133.017 E.0289
G1 X220.614 Y186.989 E2.01025
G1 X220.567 Y187.477 E.01826
G1 X220.431 Y187.939 E.01794
G1 X220.255 Y188.297 E.01484
M73 P35 R10
G1 X219.981 Y188.697 E.01806
G1 X219.64 Y189.033 E.01785
G1 X219.243 Y189.298 E.01777
G1 X218.699 Y189.513 E.02178
G1 X217.984 Y189.614 E.0269
G1 X132.011 Y189.614 E3.20217
G1 X131.523 Y189.567 E.01826
G1 X131.061 Y189.431 E.01794
G1 X130.703 Y189.255 E.01484
M73 P35 R9
G1 X130.303 Y188.981 E.01806
G1 X129.967 Y188.64 E.01785
G1 X129.702 Y188.243 E.01777
G1 X129.487 Y187.699 E.02178
G1 X129.386 Y186.984 E.0269
G1 X129.386 Y133.011 E2.0103
G1 X129.433 Y132.523 E.01826
G1 X129.569 Y132.061 E.01794
G1 X129.745 Y131.703 E.01484
G1 X129.985 Y131.353 E.01582
M204 S3000
G1 X130.363 Y131.614 F15000
G1 F1500
M204 S250
G1 X130.381 Y131.589 E.00113
G1 X130.641 Y131.332 E.01361
G1 X130.958 Y131.117 E.01428
G1 X131.435 Y130.93 E.01907
G1 X132.058 Y130.843 E.02343
G1 X217.974 Y130.844 E3.20005
G1 X218.402 Y130.887 E.01605
G1 X218.783 Y131.002 E.01479
G1 X219.073 Y131.146 E.01209
M73 P36 R9
G1 X219.391 Y131.364 E.01435
G1 X219.668 Y131.641 E.01458
G1 X219.885 Y131.961 E.01442
G1 X220.048 Y132.356 E.01592
G1 X220.157 Y133.062 E.02657
G1 X220.157 Y186.961 E2.00753
G1 X220.113 Y187.402 E.01654
G1 X220.007 Y187.761 E.01393
G1 X219.864 Y188.057 E.01223
G1 X219.619 Y188.411 E.01605
G1 X219.359 Y188.668 E.01361
G1 X219.042 Y188.883 E.01428
G1 X218.565 Y189.07 E.01907
G1 X217.942 Y189.157 E.02343
G1 X132.039 Y189.157 E3.19956
G1 X131.598 Y189.113 E.01654
G1 X131.239 Y189.007 E.01393
G1 X130.943 Y188.864 E.01223
G1 X130.589 Y188.619 E.01605
G1 X130.332 Y188.359 E.01361
G1 X130.117 Y188.042 E.01428
G1 X129.93 Y187.565 E.01907
G1 X129.843 Y186.942 E.02343
G1 X129.843 Y133.039 E2.00768
G1 X129.887 Y132.598 E.01653
G1 X129.993 Y132.239 E.01393
G1 X130.136 Y131.943 E.01223
G1 X130.329 Y131.663 E.01268
M204 S3000
G1 X130.707 Y131.925 F15000
G1 F1500
M204 S250
G1 X130.742 Y131.875 E.00227
M73 P37 R9
G1 X130.942 Y131.68 E.01041
G1 X131.16 Y131.533 E.0098
G1 X131.568 Y131.373 E.01631
G1 X132.099 Y131.3 E.01996
G1 X217.944 Y131.301 E3.1974
G1 X218.3 Y131.336 E.01333
G1 X218.625 Y131.433 E.01263
G1 X218.849 Y131.547 E.00937
G1 X219.087 Y131.71 E.01075
G1 X219.304 Y131.924 E.01135
G1 X219.472 Y132.168 E.01103
G1 X219.599 Y132.465 E.01204
G1 X219.7 Y133.107 E.0242
G1 X219.7 Y186.931 E2.00474
G1 X219.658 Y187.327 E.01482
G1 X219.582 Y187.585 E.01003
G1 X219.472 Y187.816 E.00955
G1 X219.258 Y188.125 E.014
G1 X219.058 Y188.32 E.01041
G1 X218.84 Y188.467 E.0098
G1 X218.432 Y188.627 E.01631
G1 X217.901 Y188.7 E.01996
G1 X132.069 Y188.7 E3.19692
G1 X131.673 Y188.658 E.01482
G1 X131.415 Y188.582 E.01003
G1 X131.184 Y188.472 E.00955
M73 P38 R9
G1 X130.875 Y188.258 E.014
G1 X130.68 Y188.058 E.01041
G1 X130.533 Y187.84 E.0098
G1 X130.373 Y187.432 E.01631
G1 X130.3 Y186.901 E.01996
G1 X130.3 Y133.069 E2.00505
G1 X130.342 Y132.673 E.01481
G1 X130.418 Y132.415 E.01003
G1 X130.528 Y132.184 E.00955
G1 X130.673 Y131.974 E.0095
M204 S3000
G1 X131.033 Y132.273 F15000
G1 F1500
M204 S250
G1 X131.196 Y132.076 E.00953
G1 X131.403 Y131.929 E.00943
G1 X131.6 Y131.837 E.0081
G1 X131.742 Y131.794 E.00552
G1 X132.019 Y131.757 E.01043
G1 X217.977 Y131.757 E3.20159
G1 X218.293 Y131.806 E.01192
G1 X218.411 Y131.843 E.00461
G1 X218.713 Y132.003 E.01271
G1 X218.923 Y132.194 E.01056
G1 X219.071 Y132.403 E.00955
G1 X219.163 Y132.6 E.0081
G1 X219.206 Y132.742 E.00552
G1 X219.243 Y133.019 E.01044
G1 X219.243 Y186.977 E2.00971
G1 X219.194 Y187.294 E.01193
G1 X219.157 Y187.411 E.0046
G1 X218.997 Y187.713 E.01271
G1 X218.806 Y187.923 E.01056
G1 X218.597 Y188.071 E.00955
G1 X218.4 Y188.163 E.0081
G1 X218.258 Y188.206 E.00552
G1 X217.981 Y188.243 E.01044
G1 X132.023 Y188.243 E3.20159
G1 X131.706 Y188.194 E.01193
G1 X131.589 Y188.157 E.0046
G1 X131.287 Y187.997 E.01271
M73 P39 R9
G1 X131.077 Y187.806 E.01056
G1 X130.929 Y187.597 E.00955
G1 X130.837 Y187.4 E.0081
G1 X130.794 Y187.258 E.00552
G1 X130.757 Y186.981 E.01043
G1 X130.757 Y133.023 E2.00972
G1 X130.806 Y132.705 E.01198
G1 X130.878 Y132.497 E.00819
G1 X130.944 Y132.379 E.00504
G1 X130.995 Y132.319 E.00293
M204 S3000
G1 X131.356 Y132.593 F15000
G1 F1500
M204 S250
G1 X131.473 Y132.439 E.0072
G1 X131.586 Y132.348 E.00541
G1 X131.803 Y132.246 E.00893
G1 X132.011 Y132.214 E.00782
G1 X217.988 Y132.214 E3.20232
G1 X218.218 Y132.257 E.00871
G1 X218.409 Y132.344 E.00783
G1 X218.561 Y132.473 E.00743
G1 X218.652 Y132.586 E.00541
G1 X218.754 Y132.803 E.00892
G1 X218.786 Y133.011 E.00782
G1 X218.786 Y186.988 E2.01044
G1 X218.743 Y187.218 E.00872
G1 X218.656 Y187.409 E.00783
G1 X218.527 Y187.561 E.00743
M73 P40 R9
G1 X218.414 Y187.652 E.00541
G1 X218.197 Y187.754 E.00892
G1 X217.989 Y187.786 E.00782
G1 X132.012 Y187.786 E3.20232
G1 X131.782 Y187.743 E.00872
G1 X131.591 Y187.656 E.00783
G1 X131.439 Y187.527 E.00743
G1 X131.348 Y187.414 E.00541
G1 X131.246 Y187.197 E.00893
G1 X131.214 Y186.989 E.00782
G1 X131.214 Y133.012 E2.01044
G1 X131.257 Y132.779 E.00884
G1 X131.304 Y132.661 E.00475
G1 X131.319 Y132.641 E.00093
M204 S3000
G1 X131.716 Y132.86 F15000
G1 F1500
M204 S250
G1 X131.747 Y132.805 E.00236
G1 X131.884 Y132.696 E.00651
G1 X132 Y132.671 E.00442
G1 X218 Y132.671 E3.20317
G1 X218.111 Y132.7 E.00426
G1 X218.195 Y132.747 E.00361
G1 X218.304 Y132.884 E.00651
M73 P41 R9
G1 X218.329 Y133 E.00442
G1 X218.329 Y187 E2.01129
G1 X218.3 Y187.111 E.00426
G1 X218.253 Y187.195 E.00361
G1 X218.116 Y187.304 E.00651
G1 X218 Y187.329 E.00442
G1 X132 Y187.329 E3.20317
G1 X131.889 Y187.3 E.00426
G1 X131.805 Y187.253 E.00361
G1 X131.696 Y187.116 E.00651
G1 X131.671 Y187 E.00442
G1 X131.671 Y133 E2.01129
G1 X131.693 Y132.915 E.00327
; WIPE_START
G1 X131.747 Y132.805 E-.04663
G1 X131.884 Y132.696 E-.06647
M73 P42 R8
G1 X132 Y132.671 E-.04514
G1 X132.584 Y132.671 E-.22177
; WIPE_END
G1 E-.02 F1800
M204 S3000
G17
G3 Z.6 I-.35 J1.165 P1  F15000
G1 X216 Y157.75 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X214.4 Y157.75 E.05959
G1 X214.4 Y134.6 E.86225
M632 S0 W
M400
M104 T0 S220 N0 ;Multi extruder pre heating
M633
G1 X133.6 Y134.6 E3.00949
G1 X133.6 Y185.4 E1.89211
G1 X214.4 Y185.4 E3.00949
G1 X214.4 Y162.25 E.86225
G1 X217.6 Y162.25 E.11919
G1 X217.6 Y186.6 E.90695
M73 P43 R8
G1 X132.4 Y186.6 E3.17338
G1 X132.4 Y133.4 E1.9815
G1 X217.6 Y133.4 E3.17338
G1 X217.6 Y157.75 E.90695
G1 X216.06 Y157.75 E.05736
M204 S3000
G1 X216 Y157.293 F15000
; FEATURE: Inner wall
M73 P44 R8
G1 F1500
M204 S250
G1 X214.857 Y157.293 E.04257
G1 X214.857 Y134.143 E.86225
G1 X133.143 Y134.143 E3.04354
G1 X133.143 Y185.857 E1.92616
G1 X214.857 Y185.857 E3.04354
G1 X214.857 Y162.707 E.86225
G1 X217.143 Y162.707 E.08514
M73 P45 R8
G1 X217.143 Y186.143 E.8729
G1 X132.857 Y186.143 E3.13933
G1 X132.857 Y133.857 E1.94745
G1 X217.143 Y133.857 E3.13933
G1 X217.143 Y157.293 E.8729
M73 P46 R8
G1 X216.06 Y157.293 E.04034
; WIPE_START
G1 X215.06 Y157.293 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S3000
G17
G3 Z.6 I-1.2 J.205 P1  F15000
G1 X216.016 Y162.89 Z.6
G1 Z.2
G1 E.4 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50964
G1 F3000
M204 S250
G1 X216.754 Y163.629 E.03973
G1 X216.754 Y164.289 E.0251
G1 X215.561 Y163.096 E.06417
G1 X215.246 Y163.096 E.01201
G1 X215.246 Y163.44 E.01309
G1 X216.754 Y164.949 E.08115
G1 X216.754 Y165.609 E.0251
G1 X215.246 Y164.1 E.08115
G1 X215.246 Y164.76 E.0251
G1 X216.754 Y166.269 E.08115
G1 X216.754 Y166.929 E.0251
G1 X215.246 Y165.42 E.08115
G1 X215.246 Y166.08 E.0251
G1 X216.754 Y167.589 E.08115
G1 X216.754 Y168.249 E.0251
G1 X215.246 Y166.74 E.08115
G1 X215.246 Y167.4 E.0251
G1 X216.754 Y168.909 E.08115
G1 X216.754 Y169.569 E.0251
G1 X215.246 Y168.06 E.08115
G1 X215.246 Y168.72 E.0251
G1 X216.754 Y170.229 E.08115
G1 X216.754 Y170.889 E.0251
M73 P47 R8
G1 X215.246 Y169.38 E.08115
G1 X215.246 Y170.04 E.0251
G1 X216.754 Y171.549 E.08115
G1 X216.754 Y172.209 E.0251
G1 X215.246 Y170.7 E.08115
G1 X215.246 Y171.36 E.0251
G1 X216.754 Y172.869 E.08115
G1 X216.754 Y173.529 E.0251
G1 X215.246 Y172.02 E.08115
G1 X215.246 Y172.68 E.0251
G1 X216.754 Y174.189 E.08115
G1 X216.754 Y174.849 E.0251
G1 X215.246 Y173.341 E.08115
G1 X215.246 Y174.001 E.0251
G1 X216.754 Y175.509 E.08115
G1 X216.754 Y176.169 E.0251
G1 X215.246 Y174.661 E.08115
G1 X215.246 Y175.321 E.0251
G1 X216.754 Y176.829 E.08115
G1 X216.754 Y177.49 E.0251
G1 X215.246 Y175.981 E.08115
G1 X215.246 Y176.641 E.0251
G1 X216.754 Y178.15 E.08115
G1 X216.754 Y178.81 E.0251
G1 X215.246 Y177.301 E.08115
G1 X215.246 Y177.961 E.0251
G1 X216.754 Y179.47 E.08115
G1 X216.754 Y180.13 E.0251
G1 X215.246 Y178.621 E.08115
G1 X215.246 Y179.281 E.0251
G1 X216.754 Y180.79 E.08115
G1 X216.754 Y181.45 E.0251
G1 X215.246 Y179.941 E.08115
G1 X215.246 Y180.601 E.0251
G1 X216.754 Y182.11 E.08115
G1 X216.754 Y182.77 E.0251
G1 X215.246 Y181.261 E.08115
G1 X215.246 Y181.921 E.0251
G1 X216.754 Y183.43 E.08115
G1 X216.754 Y184.09 E.0251
G1 X215.246 Y182.581 E.08115
G1 X215.246 Y183.241 E.0251
G1 X216.754 Y184.75 E.08115
G1 X216.754 Y185.41 E.0251
G1 X215.246 Y183.901 E.08115
G1 X215.246 Y184.561 E.0251
G1 X216.439 Y185.754 E.06418
G1 X215.779 Y185.754 E.0251
G1 X215.04 Y185.016 E.03974
; WIPE_START
G1 X215.747 Y185.723 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S3000
G17
G3 Z.6 I1.217 J.006 P1  F15000
G1 X216.016 Y134.04 Z.6
G1 Z.2
G1 E.4 F1800
G1 F3000
M204 S250
G1 X216.754 Y134.779 E.03973
G1 X216.754 Y135.439 E.0251
G1 X215.561 Y134.246 E.06417
G1 X215.246 Y134.246 E.01201
G1 X215.246 Y134.59 E.01309
G1 X216.754 Y136.099 E.08115
G1 X216.754 Y136.759 E.0251
G1 X215.246 Y135.25 E.08115
G1 X215.246 Y135.91 E.0251
G1 X216.754 Y137.419 E.08115
G1 X216.754 Y138.079 E.0251
G1 X215.246 Y136.57 E.08115
G1 X215.246 Y137.23 E.0251
G1 X216.754 Y138.739 E.08115
G1 X216.754 Y139.399 E.0251
G1 X215.246 Y137.89 E.08115
G1 X215.246 Y138.55 E.0251
G1 X216.754 Y140.059 E.08115
G1 X216.754 Y140.719 E.0251
G1 X215.246 Y139.21 E.08115
G1 X215.246 Y139.87 E.0251
G1 X216.754 Y141.379 E.08115
G1 X216.754 Y142.039 E.0251
G1 X215.246 Y140.53 E.08115
G1 X215.246 Y141.19 E.0251
G1 X216.754 Y142.699 E.08115
G1 X216.754 Y143.359 E.0251
G1 X215.246 Y141.85 E.08115
G1 X215.246 Y142.51 E.0251
G1 X216.754 Y144.019 E.08115
G1 X216.754 Y144.679 E.0251
G1 X215.246 Y143.17 E.08115
G1 X215.246 Y143.83 E.0251
G1 X216.754 Y145.339 E.08115
G1 X216.754 Y145.999 E.0251
G1 X215.246 Y144.491 E.08115
G1 X215.246 Y145.151 E.0251
G1 X216.754 Y146.659 E.08115
G1 X216.754 Y147.319 E.0251
G1 X215.246 Y145.811 E.08115
G1 X215.246 Y146.471 E.0251
G1 X216.754 Y147.979 E.08115
G1 X216.754 Y148.64 E.0251
G1 X215.246 Y147.131 E.08115
G1 X215.246 Y147.791 E.0251
G1 X216.754 Y149.3 E.08115
G1 X216.754 Y149.96 E.0251
G1 X215.246 Y148.451 E.08115
G1 X215.246 Y149.111 E.0251
G1 X216.754 Y150.62 E.08115
G1 X216.754 Y151.28 E.0251
G1 X215.246 Y149.771 E.08115
G1 X215.246 Y150.431 E.0251
G1 X216.754 Y151.94 E.08115
G1 X216.754 Y152.6 E.0251
G1 X215.246 Y151.091 E.08115
G1 X215.246 Y151.751 E.0251
G1 X216.754 Y153.26 E.08115
M73 P48 R8
G1 X216.754 Y153.92 E.0251
G1 X215.246 Y152.411 E.08115
G1 X215.246 Y153.071 E.0251
G1 X216.754 Y154.58 E.08115
G1 X216.754 Y155.24 E.0251
G1 X215.246 Y153.731 E.08115
G1 X215.246 Y154.391 E.0251
G1 X216.754 Y155.9 E.08115
G1 X216.754 Y156.56 E.0251
G1 X215.246 Y155.051 E.08115
G1 X215.246 Y155.711 E.0251
G1 X216.439 Y156.904 E.06418
G1 X215.779 Y156.904 E.0251
G1 X215.04 Y156.166 E.03974
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #1
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
; WIPE_START
M204 S250
G1 X215.747 Y156.873 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S3000
G17
G3 Z.6 I1.217 J0 P1  F15000
G1 X167.713 Y223.544
G1 Z.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0 ON0 NN1
M204 S250
G1  X185.713 Y223.544  E1.4325 F7836
G1  Y224.544  E0.0796
G1  X167.713  E1.4325
G1  Y225.544  E0.0796
M73 P48 R7
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0 ON0 NN1
M400
M104 T1 S118 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S250
G1 X184.713 Y225.544 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S3000
G17
G3 Z.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T220 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C220

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E9

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R0
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R0

M400

M73 P52 R7
G1 Y320 F30000
G1 X191.44

G1 Y295
G1 Y265 F18000
G1 Z3.2 F3000

M204 S250


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S0
M106 P2 S0
G1 E-.4 F1800
G1 X176.204 Y244.676 F60000
M204 S6000
G1 Z.2
G17
G3 Z.6 I0 J-1.217 P1
G1 X162.987 Y244.676 Z.6
G1 X162.987 Y227.044

; filament start gcode
G1 X167.463 Y227.044
G1 Z.2
G1 E.4 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL1
; LINE_WIDTH: 0.500000
; LINE_WIDTH: 0.500000
M204 S500
G1  X170.463 Y227.044  E0.1140 F495
G1 E-0.4000 F1800
M204 S6000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y227.544 
G1  X166.963 
G1  Y226.544 
G1  X168.463 
G1  Y228.044 
G1  X166.463 
G1  Y226.044 
G1  X170.463 Y227.044   F495
G1 E0.4000 F1800
M204 S500
G1  X185.963  E0.5891 F495
G1  Y227.544  E0.0190
G1  X167.463  E0.7031 F563
G1  Y228.044  E0.0190
M73 P53 R7
G1  X185.963  E0.7031 F687
G1  Y228.544  E0.0190
G1  X167.463  E0.7031 F1313
G1  Y229.044  E0.0190
G1  X185.963  E0.7031 F1363
G1  Y229.544  E0.0190
G1  X167.463  E0.7031
G1  Y230.044  E0.0190
G1  X185.963  E0.7031
G1  Y230.544  E0.0190
M632 S1 W
M400
M104 T1 S210 N0 ;Multi extruder pre heating
M633
G1  X167.463  E0.7031
G1  Y231.044  E0.0190
G1  X185.963  E0.7031
G1  Y231.544  E0.0190
G1  X167.463  E0.7031
G1  Y232.044  E0.0190
M73 P54 R7
G1  X185.963  E0.7031
G1  Y232.544  E0.0190
G1  X167.463  E0.7031
G1  Y233.044  E0.0190
G1  X185.963  E0.7031
G1  Y233.544  E0.0190
G1  X167.463  E0.7031
G1  Y234.044  E0.0190
G1  X185.963  E0.7031
G1  Y234.544  E0.0190
G1  X167.463  E0.7031
G1  Y235.044  E0.0190
G1  X185.963  E0.7031
G1  Y235.544  E0.0190
G1  X167.463  E0.7031
G1  Y236.044  E0.0190
M73 P54 R6
G1  X185.963  E0.7031
G1  Y236.544  E0.0190
G1  X167.463  E0.7031
G1  Y237.044  E0.0190
G1  X185.963  E0.7031
G1  Y237.544  E0.0190
M73 P55 R6
G1  X167.463  E0.7031
G1  Y238.044  E0.0190
G1  X185.963  E0.7031
G1  Y238.544  E0.0190
G1  X167.463  E0.7031
G1  Y239.044  E0.0190
G1  X185.963  E0.7031
G1  Y239.544  E0.0190
G1  X167.463  E0.7031
G1  Y240.044  E0.0190
G1  X185.963  E0.7031
; LINE_WIDTH: 0.500000
; WIPE_TOWER_END
M220 R
G1 F15000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y239.544   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S6000
G1  X186.463 Y240.544  
M204 S500
G3  X184.043 Y242.635   I-4.428 J-2.678 E0.1236 F1500
G3  X181.399 Y241.420   I-0.104 J-3.256 E0.1146
G2  X178.521 Y240.544   I-2.903 J4.371 E0.1160
G2  X173.401 Y240.768   I-1.808 J17.316 E0.1955
G2  X170.466 Y242.558   I5.648 J12.556 E0.1310
G3  X168.309 Y242.023   I-0.676 J-1.891 E0.0895
G1  X166.963 Y240.544   E0.0760
G3  X165.047 Y238.159   I4.010 J-5.182 E0.1174
G3  X166.223 Y235.694   I2.797 J-0.179 E0.1084
G2  X166.963 Y233.401   I-3.200 J-2.298 E0.0931
G2  X166.798 Y228.810   I-15.731 J-1.732 E0.1752
G2  X166.462 Y228.020   I-4.298 J1.359 E0.0327
G1 E-0.4000 F1800
M204 S6000
G1  X165.028 Y226.012   F600
G1 E0.4000 F1800
M204 S500
G3  X165.438 Y224.470   I1.700 J-0.374 E0.0630 F1500
G3  X168.538 Y221.100   I20.025 J15.314 E0.1743
G3  X171.870 Y221.809   I1.296 J2.093 E0.1430
G2  X176.713 Y222.794   I3.707 J-5.829 E0.1921
G1  X177.963  E0.0475
G2  X182.814 Y220.839   I0.127 J-6.681 E0.2043
G3  X185.117 Y221.315   I0.817 J1.855 E0.0953
G1  X186.463 Y222.794   E0.0760
G3  X188.379 Y225.179   I-4.010 J5.182 E0.1173
M73 P56 R6
G3  X187.203 Y227.644   I-2.797 J0.179 E0.1084
G2  X186.463 Y229.936   I3.199 J2.298 E0.0930
G2  X186.628 Y234.528   I15.729 J1.733 E0.1753
G2  X188.328 Y237.088   I11.313 J-5.667 E0.1171
G3  X187.988 Y238.868   I-1.658 J0.606 E0.0723
G1  X186.463 Y240.544   E0.0861
; WIPE_TOWER_END

; WIPE_START
G1 F5400
M204 S500
G1 X186.463 Y240.544 E-.00001
G1 X186.463 Y240.544 E-.00001
G1 X187.137 Y239.804 E-.37998
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F60000
; OBJECT_ID: 199
M204 S6000
G1 X216 Y158.25
G1 Z.2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
M204 S500
G1 X217.6 Y158.25 E.05959
G1 X217.6 Y161.75 E.13036
G1 X214.4 Y161.75 E.11919
G1 X214.4 Y158.25 E.13036
G1 X215.94 Y158.25 E.05736
M204 S6000
G1 X216 Y158.707 F60000
; FEATURE: Inner wall
G1 F3000
M204 S500
G1 X217.143 Y158.707 E.04257
G1 X217.143 Y161.293 E.09631
G1 X214.857 Y161.293 E.08514
G1 X214.857 Y158.707 E.09631
G1 X215.94 Y158.707 E.04033
M204 S6000
G1 X215.948 Y158.89 F60000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.54164
G1 F6300
M204 S500
G1 X216.754 Y159.697 E.04636
G1 X216.754 Y160.402 E.02866
G1 X215.448 Y159.096 E.07507
G1 X215.246 Y159.096 E.00823
G1 X215.246 Y159.598 E.02043
G1 X216.552 Y160.904 E.07507
G1 X215.846 Y160.904 E.02866
G1 X215.04 Y160.098 E.04635
; WIPE_START
G1 X215.747 Y160.805 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S6000
G17
G3 Z.6 I1.217 J0 P1  F60000
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X286 Y160 Z0.6 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U286 V160 Z0.6 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 2/10
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change

M106 S191.25
; open powerlost recovery
M1003 S1
; OBJECT_ID: 199
M204 S10000
G1 X216 Y158.602 F60000
G1 Z.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X217.398 Y158.602 E.04637
G1 X217.398 Y161.398 E.09274
G1 X214.602 Y161.398 E.09274
G1 X214.602 Y158.602 E.09274
G1 X215.94 Y158.602 E.04438
M204 S250
G1 X216 Y158.21 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X217.79 Y158.21 E.055
G1 X217.79 Y161.79 E.11
G1 X214.21 Y161.79 E.11
G1 X214.21 Y158.21 E.11
G1 X215.94 Y158.21 E.05316
; WIPE_START
M204 S8000
G1 X216.94 Y158.21 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I-1.054 J-.608 P1  F60000
G1 X215.78 Y160.22 Z.8
G1 Z.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48318
G1 F15000
M204 S8000
G1 X216.22 Y160.22 E.0158
G1 X216.22 Y159.78 E.0158
G1 X215.78 Y159.78 E.0158
G1 X215.78 Y160.16 E.01364
M204 S10000
G1 X215.371 Y160.629 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X216.629 Y160.629 E.03864
G1 X216.629 Y159.371 E.03864
G1 X215.371 Y159.371 E.03864
G1 X215.371 Y160.569 E.0368
M204 S10000
G1 X214.994 Y161.006 F60000
G1 F15000
M204 S8000
G1 X217.006 Y161.006 E.06181
G1 X217.006 Y158.994 E.06181
G1 X214.994 Y158.994 E.06181
G1 X214.994 Y160.946 E.05997
; WIPE_START
G1 X214.994 Y159.946 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F60000
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X286 Y160 Z0.8 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U286 V160 Z0.8 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

M204 S10000
G1 X185.963 Y239.544
G1 Z.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.304 Y240.718  
M204 S8000
G3  X183.574 Y242.676   I-3.488 J-1.982 E0.1317 F5400
G3  X181.239 Y241.317   I1.125 J-4.619 E0.1041
G2  X178.521 Y240.544   I-2.725 J4.418 E0.1088
G2  X173.401 Y240.768   I-1.808 J17.316 E0.1955
G2  X170.466 Y242.558   I5.648 J12.556 E0.1310
G3  X168.309 Y242.023   I-0.676 J-1.891 E0.0895
G1  X166.963 Y240.544   E0.0760
G3  X165.047 Y238.159   I4.010 J-5.182 E0.1174
G3  X166.223 Y235.694   I2.797 J-0.179 E0.1084
G2  X166.963 Y233.401   I-3.200 J-2.298 E0.0931
G2  X166.798 Y228.810   I-15.731 J-1.732 E0.1752
G2  X165.098 Y226.250   I-11.313 J5.667 E0.1171
G3  X165.438 Y224.470   I1.658 J-0.606 E0.0723
G3  X168.538 Y221.100   I20.025 J15.314 E0.1743
G3  X171.870 Y221.809   I1.296 J2.093 E0.1430
G2  X176.713 Y222.794   I3.707 J-5.829 E0.1921
G1  X177.963  E0.0475
G2  X182.814 Y220.839   I0.127 J-6.681 E0.2043
G3  X185.117 Y221.315   I0.817 J1.855 E0.0953
G1  X186.463 Y222.794   E0.0760
G3  X188.379 Y225.179   I-4.010 J5.182 E0.1173
G3  X187.203 Y227.644   I-2.797 J0.179 E0.1084
G2  X186.463 Y229.936   I3.199 J2.298 E0.0930
G2  X186.628 Y234.528   I15.729 J1.733 E0.1753
G2  X188.328 Y237.088   I11.313 J-5.667 E0.1171
G3  X187.988 Y238.868   I-1.658 J0.606 E0.0723
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #2
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z.8 I1.217 J0 P1  F60000
G1 X167.713 Y223.544
G1 Z.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1 ON1 NN0
M204 S8000
G1  X185.713 Y223.544  E1.4325 F7836
G1  Y224.794  E0.0995
G1  X167.713  E1.4325
G1  Y226.044  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1 ON1 NN0
M400
M104 T0 S154 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y226.044 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z.8 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.4 F1200

M400
M106 P1 S0
M106 P2 S0


; get travel path for change filament
;M620.1 X54 Y0 F21000 P0
;M620.1 X54 Y0 F21000 P1
;M620.1 X54 Y245 F21000 P2



M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T220 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E8

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P57 R6
G1 Y320 F30000
G1 X191.44

G1 Y295
G1 Y265 F18000
G1 Z3.4 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S191.25
M106 P2 S0
G1 X190.44 Y239.794 F15000
M204 S5000
G1 Z.4

; filament start gcode
G17
G3 Z.8 I0 J-1.217 P1
G1 X185.963 Y239.794 Z.8
G1 Z.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
; LINE_WIDTH: 0.500000
M204 S5000
G1  X182.963 Y239.794  E0.1140 F1782
G1 E-0.4000 F1800
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y240.294 
G1  X185.463 
G1  Y239.294 
G1  X186.963 
G1  Y240.794 
G1  X184.963 
G1  Y238.794 
G1  X182.963 Y239.794   F1782
G1 E0.4000 F1800
M400
M104 T1 S220 N0
G1  X167.463  E0.5891 F1782
G1  Y239.044  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y238.294  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y237.544  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y236.794  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y236.044  E0.0285
G1  X185.963  E0.7031
G1  Y235.294  E0.0285
M73 P58 R6
G1  X167.463  E0.7031
G1  Y234.544  E0.0285
G1  X185.963  E0.7031
G1  Y233.794  E0.0285
G1  X167.463  E0.7031
G1  Y233.044  E0.0285
G1  X185.963  E0.7031
G1  Y232.294  E0.0285
G1  X167.463  E0.7031
G1  Y231.544  E0.0285
G1  X185.963  E0.7031
G1  Y230.794  E0.0285
G1  X167.463  E0.7031
G1  Y230.044  E0.0285
G1  X185.963  E0.7031
G1  Y229.294  E0.0285
G1  X167.463  E0.7031
G1  Y228.544  E0.0285
G1  X185.963  E0.7031
G1  Y227.794  E0.0285
G1  X167.463  E0.7031
G1  Y227.044  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F15000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
G1 X184.963 Y227.044 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z.8 I1.217 J0 P1  F15000
; OBJECT_ID: 199
M204 S5000
G1 X216 Y157.398
G1 Z.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9000
G1 X214.602 Y157.398 E.04637
G1 X214.602 Y134.398 E.76295
G1 X133.398 Y134.398 E2.69369
G1 X133.398 Y185.602 E1.69854
G1 X214.602 Y185.602 E2.69369
G1 X214.602 Y162.602 E.76295
G1 X217.398 Y162.602 E.09274
G1 X217.398 Y186.398 E.78935
G1 X132.602 Y186.398 E2.81283
G1 X132.602 Y133.602 E1.75134
G1 X217.398 Y133.602 E2.81283
G1 X217.398 Y157.398 E.78935
G1 X216.06 Y157.398 E.04438
M204 S250
G1 X216 Y157.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X214.21 Y157.79 E.055
G1 X214.21 Y134.79 E.70673
G1 X133.79 Y134.79 E2.47108
G1 X133.79 Y185.21 E1.54927
G1 X214.21 Y185.21 E2.47108
G1 X214.21 Y162.21 E.70673
G1 X217.79 Y162.21 E.11
M73 P59 R6
G1 X217.79 Y186.79 E.75528
G1 X132.21 Y186.79 E2.62964
G1 X132.21 Y133.21 E1.64636
G1 X217.79 Y133.21 E2.62964
G1 X217.79 Y157.79 E.75528
G1 X216.06 Y157.79 E.05316
; WIPE_START
M204 S5000
G1 X215.06 Y157.79 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z.8 I1.106 J.507 P1  F15000
G1 X215.78 Y156.22 Z.8
G1 Z.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F6000
G1 X216.22 Y156.22 E.0158
G1 X216.22 Y134.78 E.76919
G1 X215.893 Y134.78 E.01174
G1 X215.817 Y134.963 E.00712
G1 X215.78 Y134.983 E.00152
G1 X215.78 Y156.16 E.75974
G1 X215.371 Y156.629 F15000
; LINE_WIDTH: 0.41999
G1 F6000
G1 X216.629 Y156.629 E.03864
G1 X216.629 Y134.371 E.6839
G1 X215.575 Y134.371 E.03239
G1 X215.478 Y134.735 E.01157
G1 X215.371 Y134.792 E.00373
G1 X215.371 Y156.569 E.66912
G1 X214.994 Y157.006 F15000
G1 F6000
G1 X217.006 Y157.006 E.06181
G1 X217.006 Y133.994 E.70707
G1 X215.198 Y133.994 E.05556
G1 X215.175 Y134.508 E.01582
G1 X214.994 Y134.623 E.00659
G1 X214.994 Y156.946 E.6859
; WIPE_START
G1 X214.994 Y155.946 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z.8 I-1.211 J.121 P1  F15000
G1 X215.78 Y163.78 Z.8
G1 Z.4
G1 E.4 F1800
; LINE_WIDTH: 0.483185
G1 F6000
G1 X215.78 Y185.017 E.76189
G3 X215.893 Y185.22 I-.151 J.217 E.00865
G1 X216.22 Y185.22 E.01174
G1 X216.22 Y163.78 E.76919
G1 X215.84 Y163.78 E.01364
G1 X215.371 Y163.371 F15000
; LINE_WIDTH: 0.41999
G1 F6000
G1 X215.371 Y185.208 E.67096
G1 X215.508 Y185.314 E.00532
G1 X215.575 Y185.629 E.00989
G1 X216.629 Y185.629 E.03239
G1 X216.629 Y163.371 E.6839
G1 X215.431 Y163.371 E.0368
G1 X214.994 Y162.994 F15000
G1 F6000
G1 X214.994 Y185.392 E.68821
G1 X215.175 Y185.492 E.00635
G1 X215.198 Y186.006 E.01582
G1 X217.006 Y186.006 E.05556
G1 X217.006 Y162.994 E.70707
G1 X215.054 Y162.994 E.05997
G1 X214.806 Y186 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X133.194 Y186 E2.58563
; LINE_WIDTH: 0.470635
G1 X133.033 Y185.967 E.00573
G1 X133.017 Y185.886 E.00287
; LINE_WIDTH: 0.448395
G1 X133 Y185.806 E.00272
; LINE_WIDTH: 0.43172
G1 X133 Y134.194 E1.63516
; LINE_WIDTH: 0.470635
G1 X133.033 Y134.033 E.00573
G1 X133.114 Y134.017 E.00287
; LINE_WIDTH: 0.448395
G1 X133.194 Y134 E.00272
; LINE_WIDTH: 0.43172
M73 P60 R6
G1 X214.806 Y134 E2.58563
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X213.806 Y134 E-.38
; WIPE_END
G1 E-.02 F1800
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 3/10
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change

; OBJECT_ID: 199
; COOLING_NODE: 1
G17
G3 Z.8 I-1.212 J.114 P1  F15000
G1 X216 Y157.398 Z.8
G1 Z.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9000
G1 X214.602 Y157.398 E.04637
G1 X214.602 Y134.398 E.76295
G1 X133.398 Y134.398 E2.69369
G1 X133.398 Y185.602 E1.69854
M632 S0 W
M400
M104 T0 S210 N0 ;Multi extruder pre heating
M633
G1 X214.602 Y185.602 E2.69369
G1 X214.602 Y162.602 E.76295
G1 X217.398 Y162.602 E.09274
G1 X217.398 Y186.398 E.78935
G1 X132.602 Y186.398 E2.81283
G1 X132.602 Y133.602 E1.75134
G1 X217.398 Y133.602 E2.81283
G1 X217.398 Y157.398 E.78935
G1 X216.06 Y157.398 E.04438
; COOLING_NODE: 1
M204 S250
G1 X216 Y157.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X214.21 Y157.79 E.055
G1 X214.21 Y134.79 E.70673
G1 X133.79 Y134.79 E2.47108
G1 X133.79 Y185.21 E1.54927
G1 X214.21 Y185.21 E2.47108
G1 X214.21 Y162.21 E.70673
G1 X217.79 Y162.21 E.11
G1 X217.79 Y186.79 E.75528
G1 X132.21 Y186.79 E2.62964
G1 X132.21 Y133.21 E1.64636
G1 X217.79 Y133.21 E2.62964
G1 X217.79 Y157.79 E.75528
G1 X216.06 Y157.79 E.05316
; WIPE_START
M204 S5000
M73 P61 R6
G1 X215.06 Y157.79 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1 I1.106 J.507 P1  F15000
G1 X215.78 Y156.22 Z1
G1 Z.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F6000
G1 X216.22 Y156.22 E.0158
G1 X216.22 Y134.78 E.76919
G1 X215.893 Y134.78 E.01174
G1 X215.817 Y134.963 E.00712
G1 X215.78 Y134.983 E.00152
M73 P61 R5
G1 X215.78 Y156.16 E.75974
G1 X215.371 Y156.629 F15000
; LINE_WIDTH: 0.41999
G1 F6000
G1 X216.629 Y156.629 E.03864
G1 X216.629 Y134.371 E.6839
G1 X215.575 Y134.371 E.03239
G1 X215.478 Y134.735 E.01157
G1 X215.371 Y134.792 E.00373
G1 X215.371 Y156.569 E.66912
G1 X214.994 Y157.006 F15000
G1 F6000
G1 X217.006 Y157.006 E.06181
G1 X217.006 Y133.994 E.70707
G1 X215.198 Y133.994 E.05556
G1 X215.175 Y134.508 E.01582
G1 X214.994 Y134.623 E.00659
G1 X214.994 Y156.946 E.6859
; WIPE_START
G1 X214.994 Y155.946 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1 I-1.211 J.121 P1  F15000
G1 X215.78 Y163.78 Z1
G1 Z.6
G1 E.4 F1800
; LINE_WIDTH: 0.483185
G1 F6000
G1 X215.78 Y185.017 E.76189
G3 X215.893 Y185.22 I-.151 J.217 E.00865
G1 X216.22 Y185.22 E.01174
G1 X216.22 Y163.78 E.76919
G1 X215.84 Y163.78 E.01364
G1 X215.371 Y163.371 F15000
; LINE_WIDTH: 0.41999
G1 F6000
G1 X215.371 Y185.208 E.67096
G1 X215.508 Y185.314 E.00532
G1 X215.575 Y185.629 E.00989
G1 X216.629 Y185.629 E.03239
G1 X216.629 Y163.371 E.6839
G1 X215.431 Y163.371 E.0368
G1 X214.994 Y162.994 F15000
G1 F6000
G1 X214.994 Y185.392 E.68821
G1 X215.175 Y185.492 E.00635
G1 X215.198 Y186.006 E.01582
G1 X217.006 Y186.006 E.05556
G1 X217.006 Y162.994 E.70707
G1 X215.054 Y162.994 E.05997
G1 X214.806 Y186 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X133.194 Y186 E2.58563
; LINE_WIDTH: 0.470635
G1 X133.033 Y185.967 E.00573
G1 X133.017 Y185.886 E.00287
; LINE_WIDTH: 0.448395
G1 X133 Y185.806 E.00272
; LINE_WIDTH: 0.43172
G1 X133 Y134.194 E1.63516
; LINE_WIDTH: 0.470635
G1 X133.033 Y134.033 E.00573
G1 X133.114 Y134.017 E.00287
; LINE_WIDTH: 0.448395
G1 X133.194 Y134 E.00272
; LINE_WIDTH: 0.43172
G1 X214.806 Y134 E2.58563
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #3
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
; WIPE_START
M204 S5000
G1 X213.806 Y134 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1 I1.217 J0 P1  F15000
G1 X167.713 Y223.544
G1 Z.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0 ON0 NN1
M204 S5000
G1  X185.713 Y223.544  E1.4325 F7836
G1  Y224.794  E0.0995
G1  X167.713  E1.4325
G1  Y226.044  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0 ON0 NN1
M400
M104 T1 S190 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
G1 X184.713 Y226.044 E-1.9
; WIPE_END
G1 E-.1 F1800
G17
G3 Z1 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T220 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E7

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P62 R5
G1 Y320 F30000
G1 X191.44

G1 Y295
G1 Y265 F18000
G1 Z3.6 F3000

M204 S5000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S191.25
M106 P2 S0
G1 X190.44 Y227.044 F60000
M204 S10000
G1 Z.6

; filament start gcode
G17
G3 Z1 I0 J-1.217 P1
G1 X185.963 Y227.044 Z1
G1 Z.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y227.044  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y227.544 
G1  X185.463 
G1  Y226.544 
G1  X186.963 
G1  Y228.044 
G1  X184.963 
G1  Y226.044 
G1  X182.963 Y227.044   F1782
G1 E0.4000 F1800
M400
M104 T0 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
M73 P63 R5
G1  Y227.794  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y228.544  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y229.294  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y230.044  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y230.794  E0.0285
G1  X185.963  E0.7031
G1  Y231.544  E0.0285
G1  X167.463  E0.7031
G1  Y232.294  E0.0285
G1  X185.963  E0.7031
G1  Y233.044  E0.0285
G1  X167.463  E0.7031
G1  Y233.794  E0.0285
G1  X185.963  E0.7031
G1  Y234.544  E0.0285
G1  X167.463  E0.7031
G1  Y235.294  E0.0285
G1  X185.963  E0.7031
G1  Y236.044  E0.0285
G1  X167.463  E0.7031
G1  Y236.794  E0.0285
G1  X185.963  E0.7031
G1  Y237.544  E0.0285
G1  X167.463  E0.7031
G1  Y238.294  E0.0285
G1  X185.963  E0.7031
G1  Y239.044  E0.0285
G1  X167.463  E0.7031
G1  Y239.794  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F15000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y239.544   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.463 Y240.544  
M204 S8000
G3  X184.043 Y242.635   I-4.428 J-2.678 E0.1236
G3  X181.399 Y241.420   I-0.104 J-3.256 E0.1146
G2  X178.521 Y240.544   I-2.903 J4.371 E0.1160
G2  X173.401 Y240.768   I-1.808 J17.316 E0.1955
G2  X170.466 Y242.558   I5.648 J12.556 E0.1310
G3  X168.309 Y242.023   I-0.676 J-1.891 E0.0895
G1  X166.963 Y240.544   E0.0760
G3  X165.047 Y238.159   I4.010 J-5.182 E0.1174
M632 S1 W
M400
M104 T1 S210 N0 ;Multi extruder pre heating
M633
G3  X166.223 Y235.694   I2.797 J-0.179 E0.1084
G2  X166.963 Y233.401   I-3.200 J-2.298 E0.0931
G2  X166.798 Y228.810   I-15.731 J-1.732 E0.1752
G2  X165.098 Y226.250   I-11.313 J5.667 E0.1171
G3  X165.438 Y224.470   I1.658 J-0.606 E0.0723
G3  X168.538 Y221.100   I20.025 J15.314 E0.1743
G3  X171.870 Y221.809   I1.296 J2.093 E0.1430
G2  X176.713 Y222.794   I3.707 J-5.829 E0.1921
G1  X177.963  E0.0475
G2  X182.814 Y220.839   I0.127 J-6.681 E0.2043
G3  X185.117 Y221.315   I0.817 J1.855 E0.0953
G1  X186.463 Y222.794   E0.0760
G3  X188.379 Y225.179   I-4.010 J5.182 E0.1173
G3  X188.398 Y226.012   I-1.704 J0.457 E0.0320
G1 E-0.4000 F1800
M204 S10000
G1  X186.964 Y228.020   F600
G1 E0.4000 F1800
M204 S8000
G2  X186.463 Y229.936   I3.436 J1.922 E0.0761 F5400
G2  X186.628 Y234.528   I15.729 J1.733 E0.1753
G2  X188.328 Y237.088   I11.313 J-5.667 E0.1171
G3  X187.988 Y238.868   I-1.658 J0.606 E0.0723
G1  X186.463 Y240.544   E0.0861
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X186.463 Y240.544 E-.00001
G1 X186.463 Y240.544 E-.00001
G1 X187.137 Y239.804 E-.37998
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F60000
; OBJECT_ID: 199
; COOLING_NODE: 0
M204 S10000
G1 X216 Y158.602
G1 Z.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X217.398 Y158.602 E.04637
G1 X217.398 Y161.398 E.09274
G1 X214.602 Y161.398 E.09274
G1 X214.602 Y158.602 E.09274
G1 X215.94 Y158.602 E.04438
; COOLING_NODE: 0
M204 S250
G1 X216 Y158.21 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X217.79 Y158.21 E.055
G1 X217.79 Y161.79 E.11
G1 X214.21 Y161.79 E.11
G1 X214.21 Y158.21 E.11
G1 X215.94 Y158.21 E.05316
; WIPE_START
M204 S8000
G1 X216.94 Y158.21 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I-1.054 J-.608 P1  F60000
G1 X215.78 Y160.22 Z1
G1 Z.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48318
G1 F15000
M204 S8000
G1 X216.22 Y160.22 E.0158
G1 X216.22 Y159.78 E.0158
G1 X215.78 Y159.78 E.0158
G1 X215.78 Y160.16 E.01364
M204 S10000
G1 X215.371 Y160.629 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X216.629 Y160.629 E.03864
G1 X216.629 Y159.371 E.03864
G1 X215.371 Y159.371 E.03864
G1 X215.371 Y160.569 E.0368
M204 S10000
G1 X214.994 Y161.006 F60000
G1 F15000
M204 S8000
G1 X217.006 Y161.006 E.06181
G1 X217.006 Y158.994 E.06181
G1 X214.994 Y158.994 E.06181
G1 X214.994 Y160.946 E.05997
; WIPE_START
G1 X214.994 Y159.946 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1 I1.217 J0 P1  F60000
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X286 Y160 Z1 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U286 V160 Z1 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 4/10
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change

; OBJECT_ID: 199
; COOLING_NODE: 0
G1 X216 Y158.602 F60000
G1 Z.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X217.398 Y158.602 E.04637
G1 X217.398 Y161.398 E.09274
G1 X214.602 Y161.398 E.09274
G1 X214.602 Y158.602 E.09274
G1 X215.94 Y158.602 E.04438
; COOLING_NODE: 0
M204 S250
G1 X216 Y158.21 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X217.79 Y158.21 E.055
G1 X217.79 Y161.79 E.11
G1 X214.21 Y161.79 E.11
G1 X214.21 Y158.21 E.11
G1 X215.94 Y158.21 E.05316
; WIPE_START
M204 S8000
G1 X216.94 Y158.21 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I-1.054 J-.608 P1  F60000
G1 X215.78 Y160.22 Z1.2
G1 Z.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48318
G1 F15000
M204 S8000
G1 X216.22 Y160.22 E.0158
G1 X216.22 Y159.78 E.0158
G1 X215.78 Y159.78 E.0158
G1 X215.78 Y160.16 E.01364
M204 S10000
G1 X215.371 Y160.629 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X216.629 Y160.629 E.03864
G1 X216.629 Y159.371 E.03864
G1 X215.371 Y159.371 E.03864
G1 X215.371 Y160.569 E.0368
M204 S10000
G1 X214.994 Y161.006 F60000
G1 F15000
M204 S8000
G1 X217.006 Y161.006 E.06181
G1 X217.006 Y158.994 E.06181
G1 X214.994 Y158.994 E.06181
G1 X214.994 Y160.946 E.05997
; WIPE_START
G1 X214.994 Y159.946 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F60000
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X286 Y160 Z1.2 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U286 V160 Z1.2 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

M204 S10000
G1 X185.963 Y239.544
G1 Z.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
M73 P64 R5
G1  X186.463 Y240.544  
M204 S8000
G3  X184.043 Y242.635   I-4.428 J-2.678 E0.1236 F5400
G3  X181.399 Y241.420   I-0.104 J-3.256 E0.1146
G2  X178.521 Y240.544   I-2.903 J4.371 E0.1160
G2  X173.401 Y240.768   I-1.808 J17.316 E0.1955
G2  X170.466 Y242.558   I5.648 J12.556 E0.1310
G3  X168.309 Y242.023   I-0.676 J-1.891 E0.0895
G1  X167.122 Y240.718   E0.0670
G1 E-0.4000 F1800
M204 S10000
G1  X165.438 Y238.868   F600
G1 E0.4000 F1800
M204 S8000
G3  X166.125 Y235.824   I1.763 J-1.201 E0.1330 F5400
G2  X166.963 Y233.401   I-3.144 J-2.444 E0.0992
G2  X166.798 Y228.810   I-15.731 J-1.732 E0.1752
G2  X165.098 Y226.250   I-11.313 J5.667 E0.1171
G3  X165.438 Y224.470   I1.658 J-0.606 E0.0723
G3  X168.538 Y221.100   I20.025 J15.314 E0.1743
G3  X171.870 Y221.809   I1.296 J2.093 E0.1430
G2  X176.713 Y222.794   I3.707 J-5.829 E0.1921
G1  X177.963  E0.0475
G2  X182.814 Y220.839   I0.127 J-6.681 E0.2043
G3  X185.117 Y221.315   I0.817 J1.855 E0.0953
G1  X186.463 Y222.794   E0.0760
G3  X188.379 Y225.179   I-4.010 J5.182 E0.1173
G3  X187.203 Y227.644   I-2.797 J0.179 E0.1084
G2  X186.463 Y229.936   I3.199 J2.298 E0.0930
G2  X186.628 Y234.528   I15.729 J1.733 E0.1753
G2  X188.328 Y237.088   I11.313 J-5.667 E0.1171
G3  X187.988 Y238.868   I-1.658 J0.606 E0.0723
G1  X186.463 Y240.544   E0.0861
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #4
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z1.2 I1.217 J0 P1  F60000
G1 X167.713 Y223.544
G1 Z.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1 ON1 NN0
M204 S8000
G1  X185.713 Y223.544  E1.4325 F7836
G1  Y224.794  E0.0995
G1  X167.713  E1.4325
G1  Y226.044  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1 ON1 NN0
M400
M104 T0 S76 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y226.044 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z1.2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z3.8 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T220 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E6

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.44

M73 P65 R5
G1 Y295
G1 Y265 F18000
G1 Z3.8 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S191.25
M106 P2 S0
G1 X168.498 Y244.676 F15000
M204 S5000
G1 Z.8
G17
G3 Z1.2 I0 J-1.217 P1
G1 X162.987 Y244.676 Z1.2
G1 X162.987 Y239.794

; filament start gcode
G1 X167.463 Y239.794
G1 Z.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
; LINE_WIDTH: 0.500000
M204 S5000
G1  X170.463 Y239.794  E0.1140 F1782
G1 E-0.4000 F1800
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y240.294 
G1  X166.963 
G1  Y239.294 
G1  X168.463 
G1  Y240.794 
G1  X166.463 
G1  Y238.794 
G1  X170.463 Y239.794   F1782
G1 E0.4000 F1800
M400
M104 T1 S220 N0
G1  X185.963  E0.5891 F1782
G1  Y239.044  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y238.294  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y237.544  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y236.794  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y236.044  E0.0285
G1  X167.463  E0.7031
G1  Y235.294  E0.0285
G1  X185.963  E0.7031
G1  Y234.544  E0.0285
G1  X167.463  E0.7031
G1  Y233.794  E0.0285
G1  X185.963  E0.7031
G1  Y233.044  E0.0285
G1  X167.463  E0.7031
G1  Y232.294  E0.0285
G1  X185.963  E0.7031
G1  Y231.544  E0.0285
G1  X167.463  E0.7031
G1  Y230.794  E0.0285
G1  X185.963  E0.7031
G1  Y230.044  E0.0285
G1  X167.463  E0.7031
G1  Y229.294  E0.0285
G1  X185.963  E0.7031
G1  Y228.544  E0.0285
G1  X167.463  E0.7031
G1  Y227.794  E0.0285
G1  X185.963  E0.7031
G1  Y227.044  E0.0285
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F15000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
G1 X168.463 Y227.044 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.2 I1.217 J0 P1  F15000
; OBJECT_ID: 199
; COOLING_NODE: 1
M204 S5000
G1 X216 Y157.398
G1 Z.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9000
M73 P66 R5
G1 X214.602 Y157.398 E.04637
G1 X214.602 Y134.398 E.76295
G1 X133.398 Y134.398 E2.69369
G1 X133.398 Y185.602 E1.69854
G1 X214.602 Y185.602 E2.69369
G1 X214.602 Y162.602 E.76295
G1 X217.398 Y162.602 E.09274
G1 X217.398 Y186.398 E.78935
G1 X132.602 Y186.398 E2.81283
G1 X132.602 Y133.602 E1.75134
G1 X217.398 Y133.602 E2.81283
G1 X217.398 Y157.398 E.78935
G1 X216.06 Y157.398 E.04438
; COOLING_NODE: 1
M204 S250
G1 X216 Y157.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X214.21 Y157.79 E.055
G1 X214.21 Y134.79 E.70673
G1 X133.79 Y134.79 E2.47108
G1 X133.79 Y185.21 E1.54927
G1 X214.21 Y185.21 E2.47108
G1 X214.21 Y162.21 E.70673
G1 X217.79 Y162.21 E.11
G1 X217.79 Y186.79 E.75528
G1 X132.21 Y186.79 E2.62964
G1 X132.21 Y133.21 E1.64636
G1 X217.79 Y133.21 E2.62964
G1 X217.79 Y157.79 E.75528
G1 X216.06 Y157.79 E.05316
M204 S5000
G1 X216.394 Y157.233 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P67 R5
G1 F7800
M204 S50
G1 X217.05 Y156.577 E.03078
G1 X217.05 Y155.99 E.01946
G1 X215.99 Y157.05 E.0497
G1 X215.404 Y157.05 E.01946
G1 X217.05 Y155.404 E.07722
G1 X217.05 Y154.817 E.01946
G1 X214.95 Y156.916 E.09848
G1 X214.95 Y156.33 E.01946
G1 X217.05 Y154.231 E.09848
G1 X217.05 Y153.644 E.01946
G1 X214.95 Y155.743 E.09848
G1 X214.95 Y155.157 E.01946
G1 X217.05 Y153.057 E.09848
G1 X217.05 Y152.471 E.01946
G1 X214.95 Y154.57 E.09848
G1 X214.95 Y153.984 E.01946
G1 X217.05 Y151.884 E.09848
G1 X217.05 Y151.298 E.01946
G1 X214.95 Y153.397 E.09848
G1 X214.95 Y152.81 E.01946
G1 X217.05 Y150.711 E.09848
G1 X217.05 Y150.124 E.01946
G1 X214.95 Y152.224 E.09848
G1 X214.95 Y151.637 E.01946
G1 X217.05 Y149.538 E.09848
G1 X217.05 Y148.951 E.01946
G1 X214.95 Y151.051 E.09848
G1 X214.95 Y150.464 E.01946
G1 X217.05 Y148.365 E.09848
G1 X217.05 Y147.778 E.01946
G1 X214.95 Y149.878 E.09848
G1 X214.95 Y149.291 E.01946
G1 X217.05 Y147.192 E.09848
G1 X217.05 Y146.605 E.01946
G1 X214.95 Y148.704 E.09848
G1 X214.95 Y148.118 E.01946
G1 X217.05 Y146.018 E.09848
M73 P67 R4
G1 X217.05 Y145.432 E.01946
G1 X214.95 Y147.531 E.09848
G1 X214.95 Y146.945 E.01946
G1 X217.05 Y144.845 E.09848
G1 X217.05 Y144.259 E.01946
G1 X214.95 Y146.358 E.09848
G1 X214.95 Y145.772 E.01946
G1 X217.05 Y143.672 E.09848
G1 X217.05 Y143.086 E.01946
G1 X214.95 Y145.185 E.09848
G1 X214.95 Y144.598 E.01946
G1 X217.05 Y142.499 E.09848
G1 X217.05 Y141.912 E.01946
G1 X214.95 Y144.012 E.09848
G1 X214.95 Y143.425 E.01946
G1 X217.05 Y141.326 E.09848
G1 X217.05 Y140.739 E.01946
M73 P68 R4
G1 X214.95 Y142.839 E.09848
G1 X214.95 Y142.252 E.01946
G1 X217.05 Y140.153 E.09848
G1 X217.05 Y139.566 E.01946
G1 X214.95 Y141.666 E.09848
G1 X214.95 Y141.079 E.01946
G1 X217.05 Y138.98 E.09848
G1 X217.05 Y138.393 E.01946
G1 X214.95 Y140.492 E.09848
G1 X214.95 Y139.906 E.01946
G1 X217.05 Y137.806 E.09848
G1 X217.05 Y137.22 E.01946
G1 X214.95 Y139.319 E.09848
G1 X214.95 Y138.733 E.01946
G1 X217.05 Y136.633 E.09848
G1 X217.05 Y136.047 E.01946
G1 X214.95 Y138.146 E.09848
G1 X214.95 Y137.56 E.01946
G1 X217.05 Y135.46 E.09848
G1 X217.05 Y134.874 E.01946
G1 X214.95 Y136.973 E.09848
G1 X214.95 Y136.386 E.01946
G1 X217.05 Y134.287 E.09848
G1 X217.05 Y133.95 E.01117
G1 X216.8 Y133.95 E.00829
G1 X214.95 Y135.8 E.08676
G1 X214.95 Y135.213 E.01946
G1 X216.213 Y133.95 E.05925
G1 X215.627 Y133.95 E.01946
G1 X214.767 Y134.81 E.04032
M204 S5000
G1 X214.806 Y134 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X133.194 Y134 E2.58563
; LINE_WIDTH: 0.448395
G1 X133.114 Y134.017 E.00272
; LINE_WIDTH: 0.470635
G1 X133.033 Y134.033 E.00287
G1 X133 Y134.194 E.00573
; LINE_WIDTH: 0.43172
G1 X133 Y185.806 E1.63516
; LINE_WIDTH: 0.448395
G1 X133.017 Y185.886 E.00272
; LINE_WIDTH: 0.470635
G1 X133.033 Y185.967 E.00287
G1 X133.194 Y186 E.00573
; LINE_WIDTH: 0.43172
G1 X214.806 Y186 E2.58563
G1 X216.406 Y186.233 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
M204 S50
G1 X217.05 Y185.59 E.03018
G1 X217.05 Y185.012 E.01918
G1 X216.012 Y186.05 E.0487
G1 X215.433 Y186.05 E.01918
G1 X217.05 Y184.433 E.07582
G1 X217.05 Y183.855 E.01918
G1 X215.154 Y185.751 E.08894
G1 X215.154 Y185.436 E.01047
G1 X214.95 Y185.436 E.00675
G1 X214.95 Y185.377 E.00196
G1 X217.05 Y183.277 E.09848
G1 X217.05 Y182.699 E.01918
G1 X214.95 Y184.799 E.09848
G1 X214.95 Y184.221 E.01918
G1 X217.05 Y182.121 E.09848
G1 X217.05 Y181.543 E.01918
G1 X214.95 Y183.643 E.09848
G1 X214.95 Y183.064 E.01918
M73 P69 R4
G1 X217.05 Y180.965 E.09848
G1 X217.05 Y180.387 E.01918
G1 X214.95 Y182.486 E.09848
G1 X214.95 Y181.908 E.01918
G1 X217.05 Y179.809 E.09848
G1 X217.05 Y179.231 E.01918
G1 X214.95 Y181.33 E.09848
G1 X214.95 Y180.752 E.01918
G1 X217.05 Y178.653 E.09848
G1 X217.05 Y178.075 E.01918
G1 X214.95 Y180.174 E.09848
G1 X214.95 Y179.596 E.01918
G1 X217.05 Y177.497 E.09848
G1 X217.05 Y176.919 E.01918
G1 X214.95 Y179.018 E.09848
G1 X214.95 Y178.44 E.01918
G1 X217.05 Y176.341 E.09848
G1 X217.05 Y175.763 E.01918
G1 X214.95 Y177.862 E.09848
G1 X214.95 Y177.284 E.01918
G1 X217.05 Y175.185 E.09848
G1 X217.05 Y174.606 E.01918
G1 X214.95 Y176.706 E.09848
G1 X214.95 Y176.128 E.01918
G1 X217.05 Y174.028 E.09848
G1 X217.05 Y173.45 E.01918
G1 X214.95 Y175.55 E.09848
G1 X214.95 Y174.972 E.01918
G1 X217.05 Y172.872 E.09848
G1 X217.05 Y172.294 E.01918
G1 X214.95 Y174.394 E.09848
G1 X214.95 Y173.815 E.01918
G1 X217.05 Y171.716 E.09848
G1 X217.05 Y171.138 E.01918
G1 X214.95 Y173.237 E.09848
G1 X214.95 Y172.659 E.01918
G1 X217.05 Y170.56 E.09848
G1 X217.05 Y169.982 E.01918
G1 X214.95 Y172.081 E.09848
G1 X214.95 Y171.503 E.01918
G1 X217.05 Y169.404 E.09848
G1 X217.05 Y168.826 E.01918
G1 X214.95 Y170.925 E.09848
G1 X214.95 Y170.347 E.01918
G1 X217.05 Y168.248 E.09848
G1 X217.05 Y167.67 E.01918
G1 X214.95 Y169.769 E.09848
G1 X214.95 Y169.191 E.01918
G1 X217.05 Y167.092 E.09848
G1 X217.05 Y166.514 E.01918
G1 X214.95 Y168.613 E.09848
G1 X214.95 Y168.035 E.01918
G1 X217.05 Y165.936 E.09848
M73 P70 R4
G1 X217.05 Y165.357 E.01918
G1 X214.95 Y167.457 E.09848
G1 X214.95 Y166.879 E.01918
G1 X217.05 Y164.779 E.09848
G1 X217.05 Y164.201 E.01918
G1 X214.95 Y166.301 E.09848
G1 X214.95 Y165.723 E.01918
G1 X217.05 Y163.623 E.09848
G1 X217.05 Y163.045 E.01918
G1 X214.95 Y165.145 E.09848
G1 X214.95 Y164.567 E.01918
G1 X216.567 Y162.95 E.07582
G1 X215.988 Y162.95 E.01918
G1 X214.95 Y163.988 E.0487
G1 X214.95 Y163.41 E.01918
G1 X215.594 Y162.767 E.03018
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
M204 S5000
G1 X214.95 Y163.41 E-.3457
G1 X214.95 Y163.501 E-.0343
; WIPE_END
G1 E-.02 F1800
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 5/10
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change

; OBJECT_ID: 199
; COOLING_NODE: 1
G17
G3 Z1.2 I1.199 J.206 P1  F15000
G1 X216 Y157.398 Z1.2
G1 Z1
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9000
G1 X214.602 Y157.398 E.04637
G1 X214.602 Y134.398 E.76295
G1 X142.913 Y134.398 E2.37807
G1 X142.913 Y133.602 E.0264
G1 X217.398 Y133.602 E2.47082
G1 X217.398 Y157.398 E.78935
G1 X216.06 Y157.398 E.04438
; COOLING_NODE: 1
; WIPE_START
G1 X215.06 Y157.398 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.4 I-1.198 J.216 P1  F15000
G1 X216 Y162.602 Z1.4
G1 Z1
G1 E.4 F1800
G1 F9000
G1 X217.398 Y162.602 E.04637
G1 X217.398 Y186.398 E.78935
G1 X142.913 Y186.398 E2.47082
G1 X142.913 Y185.602 E.0264
G1 X214.602 Y185.602 E2.37807
G1 X214.602 Y162.602 E.76295
G1 X215.94 Y162.602 E.04438
; COOLING_NODE: 1
; WIPE_START
G1 X216.94 Y162.602 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.4 I1.194 J-.233 P1  F15000
G1 X216 Y157.79 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X214.21 Y157.79 E.055
G1 X214.21 Y134.79 E.70673
G1 X133.79 Y134.79 E2.47108
G1 X133.79 Y185.21 E1.54927
G1 X214.21 Y185.21 E2.47108
G1 X214.21 Y162.21 E.70673
G1 X217.79 Y162.21 E.11
G1 X217.79 Y186.79 E.75528
M73 P71 R4
G1 X132.21 Y186.79 E2.62964
G1 X132.21 Y133.21 E1.64636
G1 X217.79 Y133.21 E2.62964
G1 X217.79 Y157.79 E.75528
G1 X216.06 Y157.79 E.05316
; WIPE_START
M204 S5000
G1 X215.06 Y157.79 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.4 I1.191 J-.252 P1  F15000
G1 X214.767 Y156.406 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
M204 S50
G1 X215.41 Y157.05 E.03018
G1 X215.988 Y157.05 E.01918
G1 X214.95 Y156.012 E.0487
G1 X214.95 Y155.433 E.01918
G1 X216.567 Y157.05 E.07582
G1 X217.05 Y157.05 E.01603
G1 X217.05 Y156.955 E.00315
G1 X214.95 Y154.855 E.09848
G1 X214.95 Y154.277 E.01918
G1 X217.05 Y156.377 E.09848
G1 X217.05 Y155.799 E.01918
G1 X214.95 Y153.699 E.09848
G1 X214.95 Y153.121 E.01918
G1 X217.05 Y155.221 E.09848
G1 X217.05 Y154.643 E.01918
G1 X214.95 Y152.543 E.09848
G1 X214.95 Y151.965 E.01918
G1 X217.05 Y154.064 E.09848
G1 X217.05 Y153.486 E.01918
G1 X214.95 Y151.387 E.09848
G1 X214.95 Y150.809 E.01918
G1 X217.05 Y152.908 E.09848
G1 X217.05 Y152.33 E.01918
G1 X214.95 Y150.231 E.09848
G1 X214.95 Y149.653 E.01918
G1 X217.05 Y151.752 E.09848
G1 X217.05 Y151.174 E.01918
G1 X214.95 Y149.075 E.09848
G1 X214.95 Y148.497 E.01918
G1 X217.05 Y150.596 E.09848
G1 X217.05 Y150.018 E.01918
G1 X214.95 Y147.919 E.09848
G1 X214.95 Y147.341 E.01917
G1 X217.05 Y149.44 E.09848
G1 X217.05 Y148.862 E.01918
G1 X214.95 Y146.763 E.09848
G1 X214.95 Y146.185 E.01918
G1 X217.05 Y148.284 E.09848
M632 S0 W
M400
M104 T0 S210 N0 ;Multi extruder pre heating
M633
G1 X217.05 Y147.706 E.01918
M73 P72 R4
G1 X214.95 Y145.606 E.09848
G1 X214.95 Y145.028 E.01918
G1 X217.05 Y147.128 E.09848
G1 X217.05 Y146.55 E.01918
G1 X214.95 Y144.45 E.09848
G1 X214.95 Y143.872 E.01918
G1 X217.05 Y145.972 E.09848
G1 X217.05 Y145.394 E.01918
G1 X214.95 Y143.294 E.09848
G1 X214.95 Y142.716 E.01918
G1 X217.05 Y144.815 E.09848
G1 X217.05 Y144.237 E.01918
G1 X214.95 Y142.138 E.09848
G1 X214.95 Y141.56 E.01918
G1 X217.05 Y143.659 E.09848
G1 X217.05 Y143.081 E.01918
G1 X214.95 Y140.982 E.09848
G1 X214.95 Y140.404 E.01918
G1 X217.05 Y142.503 E.09848
G1 X217.05 Y141.925 E.01918
G1 X214.95 Y139.826 E.09848
G1 X214.95 Y139.248 E.01918
G1 X217.05 Y141.347 E.09848
G1 X217.05 Y140.769 E.01918
G1 X214.95 Y138.67 E.09848
G1 X214.95 Y138.092 E.01918
G1 X217.05 Y140.191 E.09848
G1 X217.05 Y139.613 E.01918
G1 X214.95 Y137.514 E.09848
G1 X214.95 Y136.936 E.01918
G1 X217.05 Y139.035 E.09848
G1 X217.05 Y138.457 E.01918
G1 X214.95 Y136.357 E.09848
G1 X214.95 Y135.779 E.01918
G1 X217.05 Y137.879 E.09848
G1 X217.05 Y137.301 E.01918
G1 X214.95 Y135.201 E.09848
G1 X214.95 Y134.623 E.01918
G1 X217.05 Y136.723 E.09848
G1 X217.05 Y136.145 E.01918
G1 X215.154 Y134.249 E.08894
G1 X215.154 Y133.95 E.0099
G1 X215.433 Y133.95 E.00928
G1 X217.05 Y135.567 E.07582
G1 X217.05 Y134.988 E.01918
G1 X216.012 Y133.95 E.0487
G1 X216.59 Y133.95 E.01918
G1 X217.233 Y134.594 E.03018
M204 S5000
G1 X214.806 Y134 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X143.116 Y134 E2.27128
G1 X142.69 Y133.823 F15000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X142.285 Y133.417 E.01761
G1 X142.151 Y133.284
G1 X141.618 Y133.284
G1 X141.752 Y133.417
G1 X142.69 Y134.356 E.04078
G1 X142.824 Y134.489
G1 X142.517 Y134.716
G1 X142.384 Y134.583
G1 X141.218 Y133.417 E.05063
G1 X141.085 Y133.284
G1 X140.551 Y133.284
M73 P73 R4
G1 X140.685 Y133.417
G1 X141.85 Y134.583 E.05063
G1 X141.984 Y134.716
G1 X141.451 Y134.716
G1 X141.317 Y134.583
G1 X140.152 Y133.417 E.05063
G1 X140.018 Y133.284
G1 X139.485 Y133.284
G1 X139.619 Y133.417
G1 X140.784 Y134.583 E.05063
G1 X140.917 Y134.716
G1 X140.384 Y134.716
G1 X140.251 Y134.583
G1 X139.085 Y133.417 E.05063
G1 X138.952 Y133.284
G1 X138.418 Y133.284
G1 X138.552 Y133.417
G1 X139.717 Y134.583 E.05063
G1 X139.851 Y134.716
G1 X139.318 Y134.716
G1 X139.184 Y134.583
G1 X138.019 Y133.417 E.05063
G1 X137.885 Y133.284
G1 X137.352 Y133.284
G1 X137.486 Y133.417
G1 X138.651 Y134.583 E.05063
G1 X138.784 Y134.716
G1 X138.251 Y134.716
G1 X138.118 Y134.583
G1 X136.952 Y133.417 E.05063
G1 X136.819 Y133.284
G1 X136.285 Y133.284
G1 X136.419 Y133.417
G1 X137.584 Y134.583 E.05063
G1 X137.718 Y134.716
G1 X137.185 Y134.716
G1 X137.051 Y134.583
G1 X135.886 Y133.417 E.05063
G1 X135.752 Y133.284
G1 X135.219 Y133.284
G1 X135.353 Y133.417
G1 X136.518 Y134.583 E.05063
G1 X136.651 Y134.716
G1 X136.118 Y134.716
G1 X135.984 Y134.583
G1 X134.819 Y133.417 E.05063
G1 X134.686 Y133.284
G1 X134.152 Y133.284
G1 X134.286 Y133.417
G1 X135.451 Y134.583 E.05063
G1 X135.585 Y134.716
G1 X135.052 Y134.716
G1 X134.918 Y134.583
G1 X133.753 Y133.417 E.05063
G1 X133.619 Y133.284
G1 X133.086 Y133.284
G1 X133.219 Y133.417
G1 X134.385 Y134.583 E.05063
G1 X134.518 Y134.716
G1 X133.985 Y134.716
G1 X133.851 Y134.583
G1 X132.686 Y133.417 E.05063
G1 X132.553 Y133.284
G1 X132.284 Y133.548
G1 X132.417 Y133.682
G1 X133.583 Y134.847 E.05063
G1 X133.716 Y134.981
G1 X133.716 Y135.514
G1 X133.583 Y135.38
G1 X132.417 Y134.215 E.05063
G1 X132.284 Y134.081
G1 X132.284 Y134.615
G1 X132.417 Y134.748
G1 X133.583 Y135.914 E.05063
G1 X133.716 Y136.047
G1 X133.716 Y136.58
G1 X133.583 Y136.447
G1 X132.417 Y135.282 E.05063
G1 X132.284 Y135.148
G1 X132.284 Y135.681
G1 X132.417 Y135.815
G1 X133.583 Y136.98 E.05063
G1 X133.716 Y137.114
G1 X133.716 Y137.647
G1 X133.583 Y137.513
G1 X132.417 Y136.348 E.05063
G1 X132.284 Y136.214
G1 X132.284 Y136.748
G1 X132.417 Y136.881
G1 X133.583 Y138.047 E.05063
G1 X133.716 Y138.18
G1 X133.716 Y138.713
G1 X133.583 Y138.58
G1 X132.417 Y137.415 E.05063
G1 X132.284 Y137.281
G1 X132.284 Y137.814
G1 X132.417 Y137.948
G1 X133.583 Y139.113 E.05063
G1 X133.716 Y139.247
G1 X133.716 Y139.78
G1 X133.583 Y139.646
G1 X132.417 Y138.481 E.05063
G1 X132.284 Y138.347
G1 X132.284 Y138.881
G1 X132.417 Y139.014
G1 X133.583 Y140.18 E.05063
G1 X133.716 Y140.313
G1 X133.716 Y140.846
G1 X133.583 Y140.713
G1 X132.417 Y139.548 E.05063
G1 X132.284 Y139.414
G1 X132.284 Y139.947
G1 X132.417 Y140.081
G1 X133.583 Y141.246 E.05063
G1 X133.716 Y141.38
G1 X133.716 Y141.913
G1 X133.583 Y141.779
G1 X132.417 Y140.614 E.05063
G1 X132.284 Y140.48
G1 X132.284 Y141.014
G1 X132.417 Y141.147
G1 X133.583 Y142.313 E.05063
G1 X133.716 Y142.446
G1 X133.716 Y142.98
G1 X133.583 Y142.846
G1 X132.417 Y141.681 E.05063
G1 X132.284 Y141.547
G1 X132.284 Y142.08
G1 X132.417 Y142.214
G1 X133.583 Y143.379 E.05063
G1 X133.716 Y143.513
G1 X133.716 Y144.046
G1 X133.583 Y143.912
G1 X132.417 Y142.747 E.05063
G1 X132.284 Y142.614
G1 X132.284 Y143.147
G1 X132.417 Y143.28
G1 X133.583 Y144.446 E.05063
G1 X133.716 Y144.579
G1 X133.716 Y145.113
G1 X133.583 Y144.979
G1 X132.417 Y143.814 E.05063
G1 X132.284 Y143.68
G1 X132.284 Y144.213
G1 X132.417 Y144.347
G1 X133.583 Y145.512 E.05063
G1 X133.716 Y145.646
G1 X133.716 Y146.179
G1 X133.583 Y146.045
G1 X132.417 Y144.88 E.05063
G1 X132.284 Y144.747
G1 X132.284 Y145.28
G1 X132.417 Y145.413
G1 X133.583 Y146.579 E.05063
G1 X133.716 Y146.712
G1 X133.716 Y147.246
G1 X133.583 Y147.112
G1 X132.417 Y145.947 E.05063
G1 X132.284 Y145.813
G1 X132.284 Y146.346
G1 X132.417 Y146.48
G1 X133.583 Y147.645 E.05063
G1 X133.716 Y147.779
G1 X133.716 Y148.312
G1 X133.583 Y148.178
G1 X132.417 Y147.013 E.05063
G1 X132.284 Y146.88
G1 X132.284 Y147.413
G1 X132.417 Y147.546
G1 X133.583 Y148.712 E.05063
G1 X133.716 Y148.845
G1 X133.716 Y149.379
G1 X133.583 Y149.245
G1 X132.417 Y148.08 E.05063
G1 X132.284 Y147.946
G1 X132.284 Y148.479
G1 X132.417 Y148.613
G1 X133.583 Y149.778 E.05063
G1 X133.716 Y149.912
G1 X133.716 Y150.445
G1 X133.583 Y150.311
G1 X132.417 Y149.146 E.05063
G1 X132.284 Y149.013
G1 X132.284 Y149.546
G1 X132.417 Y149.68
G1 X133.583 Y150.845 E.05063
G1 X133.716 Y150.978
G1 X133.716 Y151.512
G1 X133.583 Y151.378
G1 X132.417 Y150.213 E.05063
G1 X132.284 Y150.079
G1 X132.284 Y150.612
G1 X132.417 Y150.746
G1 X133.583 Y151.911 E.05063
G1 X133.716 Y152.045
G1 X133.716 Y152.578
G1 X133.583 Y152.445
G1 X132.417 Y151.279 E.05063
G1 X132.284 Y151.146
G1 X132.284 Y151.679
G1 X132.417 Y151.813
G1 X133.583 Y152.978 E.05063
G1 X133.716 Y153.111
G1 X133.716 Y153.645
G1 X133.583 Y153.511
G1 X132.417 Y152.346 E.05063
G1 X132.284 Y152.212
G1 X132.284 Y152.745
G1 X132.417 Y152.879
G1 X133.583 Y154.044 E.05063
G1 X133.716 Y154.178
G1 X133.716 Y154.711
G1 X133.583 Y154.578
G1 X132.417 Y153.412 E.05063
G1 X132.284 Y153.279
G1 X132.284 Y153.812
G1 X132.417 Y153.946
G1 X133.583 Y155.111 E.05063
G1 X133.716 Y155.244
G1 X133.716 Y155.778
G1 X133.583 Y155.644
G1 X132.417 Y154.479 E.05063
G1 X132.284 Y154.345
G1 X132.284 Y154.878
G1 X132.417 Y155.012
G1 X133.583 Y156.177 E.05063
G1 X133.716 Y156.311
G1 X133.716 Y156.844
G1 X133.583 Y156.711
G1 X132.417 Y155.545 E.05063
G1 X132.284 Y155.412
G1 X132.284 Y155.945
G1 X132.417 Y156.079
G1 X133.583 Y157.244 E.05063
G1 X133.716 Y157.377
G1 X133.716 Y157.911
G1 X133.583 Y157.777
G1 X132.417 Y156.612 E.05063
G1 X132.284 Y156.478
G1 X132.284 Y157.011
G1 X132.417 Y157.145
G1 X133.583 Y158.31 E.05063
G1 X133.716 Y158.444
G1 X133.716 Y158.977
G1 X133.583 Y158.844
G1 X132.417 Y157.678 E.05063
G1 X132.284 Y157.545
G1 X132.284 Y158.078
G1 X132.417 Y158.212
G1 X133.583 Y159.377 E.05063
G1 X133.716 Y159.511
G1 X133.716 Y160.044
G1 X133.583 Y159.91
G1 X132.417 Y158.745 E.05063
G1 X132.284 Y158.611
G1 X132.284 Y159.145
G1 X132.417 Y159.278
G1 X133.583 Y160.443 E.05063
G1 X133.716 Y160.577
G1 X133.716 Y161.11
G1 X133.583 Y160.977
G1 X132.417 Y159.811 E.05063
G1 X132.284 Y159.678
G1 X132.284 Y160.211
G1 X132.417 Y160.345
G1 X133.583 Y161.51 E.05063
G1 X133.716 Y161.644
G1 X133.716 Y162.177
G1 X133.583 Y162.043
G1 X132.417 Y160.878 E.05063
G1 X132.284 Y160.744
G1 X132.284 Y161.278
G1 X132.417 Y161.411
G1 X133.583 Y162.576 E.05063
G1 X133.716 Y162.71
G1 X133.716 Y163.243
G1 X133.583 Y163.11
G1 X132.417 Y161.944 E.05063
G1 X132.284 Y161.811
G1 X132.284 Y162.344
G1 X132.417 Y162.478
G1 X133.583 Y163.643 E.05063
G1 X133.716 Y163.777
G1 X133.716 Y164.31
G1 X133.583 Y164.176
G1 X132.417 Y163.011 E.05063
G1 X132.284 Y162.877
G1 X132.284 Y163.411
G1 X132.417 Y163.544
G1 X133.583 Y164.709 E.05063
G1 X133.716 Y164.843
G1 X133.716 Y165.376
G1 X133.583 Y165.243
G1 X132.417 Y164.077 E.05063
G1 X132.284 Y163.944
G1 X132.284 Y164.477
G1 X132.417 Y164.611
G1 X133.583 Y165.776 E.05063
G1 X133.716 Y165.91
G1 X133.716 Y166.443
G1 X133.583 Y166.309
G1 X132.417 Y165.144 E.05063
G1 X132.284 Y165.01
G1 X132.284 Y165.544
G1 X132.417 Y165.677
G1 X133.583 Y166.842 E.05063
G1 X133.716 Y166.976
G1 X133.716 Y167.509
G1 X133.583 Y167.376
G1 X132.417 Y166.21 E.05063
G1 X132.284 Y166.077
G1 X132.284 Y166.61
G1 X132.417 Y166.744
G1 X133.583 Y167.909 E.05063
G1 X133.716 Y168.043
G1 X133.716 Y168.576
G1 X133.583 Y168.442
G1 X132.417 Y167.277 E.05063
G1 X132.284 Y167.143
G1 X132.284 Y167.677
G1 X132.417 Y167.81
G1 X133.583 Y168.975 E.05063
G1 X133.716 Y169.109
G1 X133.716 Y169.642
G1 X133.583 Y169.509
G1 X132.417 Y168.344 E.05063
G1 X132.284 Y168.21
G1 X132.284 Y168.743
G1 X132.417 Y168.877
G1 X133.583 Y170.042 E.05063
G1 X133.716 Y170.176
G1 X133.716 Y170.709
G1 X133.583 Y170.575
G1 X132.417 Y169.41 E.05063
G1 X132.284 Y169.276
G1 X132.284 Y169.81
G1 X132.417 Y169.943
G1 X133.583 Y171.109 E.05063
G1 X133.716 Y171.242
G1 X133.716 Y171.775
G1 X133.583 Y171.642
G1 X132.417 Y170.477 E.05063
G1 X132.284 Y170.343
G1 X132.284 Y170.876
G1 X132.417 Y171.01
G1 X133.583 Y172.175 E.05063
G1 X133.716 Y172.309
G1 X133.716 Y172.842
G1 X133.583 Y172.708
G1 X132.417 Y171.543 E.05063
G1 X132.284 Y171.409
G1 X132.284 Y171.943
G1 X132.417 Y172.076
G1 X133.583 Y173.242 E.05063
G1 X133.716 Y173.375
G1 X133.716 Y173.908
G1 X133.583 Y173.775
G1 X132.417 Y172.61 E.05063
G1 X132.284 Y172.476
G1 X132.284 Y173.009
G1 X132.417 Y173.143
G1 X133.583 Y174.308 E.05063
G1 X133.716 Y174.442
G1 X133.716 Y174.975
G1 X133.583 Y174.841
G1 X132.417 Y173.676 E.05063
G1 X132.284 Y173.542
G1 X132.284 Y174.076
G1 X132.417 Y174.209
G1 X133.583 Y175.375 E.05063
G1 X133.716 Y175.508
G1 X133.716 Y176.041
G1 X133.583 Y175.908
G1 X132.417 Y174.743 E.05063
G1 X132.284 Y174.609
G1 X132.284 Y175.142
G1 X132.417 Y175.276
G1 X133.583 Y176.441 E.05063
G1 X133.716 Y176.575
G1 X133.716 Y177.108
G1 X133.583 Y176.974
G1 X132.417 Y175.809 E.05063
G1 X132.284 Y175.675
G1 X132.284 Y176.209
G1 X132.417 Y176.342
G1 X133.583 Y177.508 E.05063
G1 X133.716 Y177.641
G1 X133.716 Y178.175
G1 X133.583 Y178.041
G1 X132.417 Y176.876 E.05063
G1 X132.284 Y176.742
G1 X132.284 Y177.275
G1 X132.417 Y177.409
G1 X133.583 Y178.574 E.05063
G1 X133.716 Y178.708
G1 X133.716 Y179.241
G1 X133.583 Y179.107
G1 X132.417 Y177.942 E.05063
G1 X132.284 Y177.809
G1 X132.284 Y178.342
G1 X132.417 Y178.475
G1 X133.583 Y179.641 E.05063
G1 X133.716 Y179.774
G1 X133.716 Y180.308
G1 X133.583 Y180.174
M73 P74 R4
G1 X132.417 Y179.009 E.05063
G1 X132.284 Y178.875
G1 X132.284 Y179.408
G1 X132.417 Y179.542
G1 X133.583 Y180.707 E.05063
G1 X133.716 Y180.841
G1 X133.716 Y181.374
G1 X133.583 Y181.24
G1 X132.417 Y180.075 E.05063
G1 X132.284 Y179.942
G1 X132.284 Y180.475
G1 X132.417 Y180.608
G1 X133.583 Y181.774 E.05063
G1 X133.716 Y181.907
G1 X133.716 Y182.441
G1 X133.583 Y182.307
G1 X132.417 Y181.142 E.05063
G1 X132.284 Y181.008
G1 X132.284 Y181.541
G1 X132.417 Y181.675
G1 X133.583 Y182.84 E.05063
G1 X133.716 Y182.974
G1 X133.716 Y183.507
G1 X133.583 Y183.373
G1 X132.417 Y182.208 E.05063
G1 X132.284 Y182.075
G1 X132.284 Y182.608
G1 X132.417 Y182.741
G1 X133.583 Y183.907 E.05063
G1 X133.716 Y184.04
G1 X133.716 Y184.574
G1 X133.583 Y184.44
G1 X132.417 Y183.275 E.05063
G1 X132.284 Y183.141
G1 X132.284 Y183.674
G1 X132.417 Y183.808
G1 X133.583 Y184.973 E.05063
; WIPE_START
M204 S5000
G1 X132.876 Y184.266 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.4 I-.152 J1.207 P1  F15000
G1 X142.026 Y185.417 Z1.4
G1 Z1
G1 E.4 F1800
G1 F6000
M204 S1000
G1 X142.69 Y186.082 E.02887
G1 X142.824 Y186.215
G1 X142.791 Y186.716
G1 X142.658 Y186.583
G1 X141.492 Y185.417 E.05063
G1 X141.359 Y185.284
G1 X140.825 Y185.284
G1 X140.959 Y185.417
G1 X142.124 Y186.583 E.05063
G1 X142.258 Y186.716
G1 X141.725 Y186.716
G1 X141.591 Y186.583
G1 X140.426 Y185.417 E.05063
G1 X140.292 Y185.284
G1 X139.759 Y185.284
G1 X139.893 Y185.417
G1 X141.058 Y186.583 E.05063
M73 P74 R3
G1 X141.191 Y186.716
G1 X140.658 Y186.716
G1 X140.525 Y186.583
G1 X139.359 Y185.417 E.05063
G1 X139.226 Y185.284
G1 X138.692 Y185.284
G1 X138.826 Y185.417
G1 X139.991 Y186.583 E.05063
G1 X140.125 Y186.716
G1 X139.592 Y186.716
G1 X139.458 Y186.583
G1 X138.293 Y185.417 E.05063
G1 X138.159 Y185.284
G1 X137.626 Y185.284
G1 X137.76 Y185.417
G1 X138.925 Y186.583 E.05063
G1 X139.058 Y186.716
G1 X138.525 Y186.716
G1 X138.392 Y186.583
G1 X137.226 Y185.417 E.05063
G1 X137.093 Y185.284
G1 X136.559 Y185.284
G1 X136.693 Y185.417
G1 X137.858 Y186.583 E.05063
G1 X137.992 Y186.716
G1 X137.459 Y186.716
G1 X137.325 Y186.583
G1 X136.16 Y185.417 E.05063
G1 X136.026 Y185.284
G1 X135.493 Y185.284
G1 X135.627 Y185.417
G1 X136.792 Y186.583 E.05063
G1 X136.925 Y186.716
G1 X136.392 Y186.716
G1 X136.259 Y186.583
G1 X135.093 Y185.417 E.05063
G1 X134.96 Y185.284
G1 X134.426 Y185.284
G1 X134.56 Y185.417
G1 X135.725 Y186.583 E.05063
G1 X135.859 Y186.716
G1 X135.326 Y186.716
G1 X135.192 Y186.583
G1 X134.027 Y185.417 E.05063
; WIPE_START
M204 S5000
G1 X134.734 Y186.124 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.4 I-1.201 J-.197 P1  F15000
G1 X134.659 Y186.583 Z1.4
G1 Z1
G1 E.4 F1800
G1 F6000
M204 S1000
G1 X132.417 Y184.341 E.0974
G1 X132.284 Y184.208
G1 X132.284 Y184.741
G1 X132.417 Y184.875
G1 X134.125 Y186.583 E.07423
G1 X134.259 Y186.716
G1 X133.726 Y186.716
G1 X133.592 Y186.583
G1 X132.417 Y185.408 E.05105
G1 X132.284 Y185.274
G1 X132.284 Y185.807
G1 X132.417 Y185.941
G1 X133.059 Y186.583 E.02788
; WIPE_START
M204 S5000
G1 X132.417 Y185.941 E-.34479
G1 X132.352 Y185.876 E-.03521
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.4 I-.014 J1.217 P1  F15000
G1 X143.116 Y186 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X214.806 Y186 E2.27128
G1 X215.81 Y186.233 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
M204 S50
G1 X214.95 Y185.373 E.04032
G1 X214.95 Y184.787 E.01946
G1 X216.213 Y186.05 E.05924
G1 X216.8 Y186.05 E.01946
G1 X214.95 Y184.2 E.08676
G1 X214.95 Y183.614 E.01946
G1 X217.05 Y185.713 E.09848
G1 X217.05 Y185.126 E.01946
G1 X214.95 Y183.027 E.09848
G1 X214.95 Y182.44 E.01946
G1 X217.05 Y184.54 E.09848
G1 X217.05 Y183.953 E.01946
G1 X214.95 Y181.854 E.09848
G1 X214.95 Y181.267 E.01946
G1 X217.05 Y183.367 E.09848
G1 X217.05 Y182.78 E.01946
G1 X214.95 Y180.681 E.09848
G1 X214.95 Y180.094 E.01946
G1 X217.05 Y182.194 E.09848
G1 X217.05 Y181.607 E.01946
G1 X214.95 Y179.508 E.09848
G1 X214.95 Y178.921 E.01946
G1 X217.05 Y181.02 E.09848
G1 X217.05 Y180.434 E.01946
G1 X214.95 Y178.334 E.09848
G1 X214.95 Y177.748 E.01946
G1 X217.05 Y179.847 E.09848
G1 X217.05 Y179.261 E.01946
G1 X214.95 Y177.161 E.09848
G1 X214.95 Y176.575 E.01946
G1 X217.05 Y178.674 E.09848
G1 X217.05 Y178.088 E.01946
G1 X214.95 Y175.988 E.09848
G1 X214.95 Y175.402 E.01946
M73 P75 R3
G1 X217.05 Y177.501 E.09848
G1 X217.05 Y176.914 E.01946
G1 X214.95 Y174.815 E.09848
G1 X214.95 Y174.228 E.01946
G1 X217.05 Y176.328 E.09848
G1 X217.05 Y175.741 E.01946
G1 X214.95 Y173.642 E.09848
G1 X214.95 Y173.055 E.01946
G1 X217.05 Y175.155 E.09848
G1 X217.05 Y174.568 E.01946
G1 X214.95 Y172.469 E.09848
G1 X214.95 Y171.882 E.01946
G1 X217.05 Y173.982 E.09848
G1 X217.05 Y173.395 E.01946
G1 X214.95 Y171.296 E.09848
G1 X214.95 Y170.709 E.01946
G1 X217.05 Y172.808 E.09848
G1 X217.05 Y172.222 E.01946
G1 X214.95 Y170.122 E.09848
G1 X214.95 Y169.536 E.01946
G1 X217.05 Y171.635 E.09848
G1 X217.05 Y171.049 E.01946
G1 X214.95 Y168.949 E.09848
G1 X214.95 Y168.363 E.01946
G1 X217.05 Y170.462 E.09848
G1 X217.05 Y169.875 E.01946
G1 X214.95 Y167.776 E.09848
G1 X214.95 Y167.19 E.01946
G1 X217.05 Y169.289 E.09848
G1 X217.05 Y168.702 E.01946
G1 X214.95 Y166.603 E.09848
G1 X214.95 Y166.016 E.01946
G1 X217.05 Y168.116 E.09848
G1 X217.05 Y167.529 E.01946
G1 X214.95 Y165.43 E.09848
G1 X214.95 Y164.843 E.01946
G1 X217.05 Y166.943 E.09848
G1 X217.05 Y166.356 E.01946
G1 X214.95 Y164.257 E.09848
G1 X214.95 Y163.67 E.01946
G1 X217.05 Y165.769 E.09848
G1 X217.05 Y165.183 E.01946
G1 X214.95 Y163.084 E.09848
G1 X214.95 Y162.95 E.00442
G1 X215.404 Y162.95 E.01504
G1 X217.05 Y164.596 E.07722
G1 X217.05 Y164.01 E.01946
G1 X215.99 Y162.95 E.0497
G1 X216.577 Y162.95 E.01946
G1 X217.233 Y163.606 E.03078
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #5
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
; WIPE_START
M204 S5000
G1 X216.577 Y162.95 E-.35256
G1 X216.505 Y162.95 E-.02744
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.4 I1.217 J0 P1  F15000
G1 X167.713 Y223.544
G1 Z1
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0 ON0 NN1
M204 S5000
G1  X185.713 Y223.544  E1.4325 F7836
M73 P76 R3
G1  Y224.794  E0.0995
G1  X167.713  E1.4325
G1  Y226.044  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0 ON0 NN1
M400
M104 T1 S190 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
G1 X184.713 Y226.044 E-1.9
; WIPE_END
G1 E-.1 F1800
G17
G3 Z1.4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T220 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E5

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.44

G1 Y295
G1 Y265 F18000
G1 Z4 F3000

M204 S5000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S191.25
M106 P2 S0
G1 X176.204 Y244.676 F60000
M204 S10000
G1 Z1
G17
G3 Z1.4 I0 J-1.217 P1
G1 X162.987 Y244.676 Z1.4
G1 X162.987 Y227.044

; filament start gcode
G1 X167.463 Y227.044
G1 Z1
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y227.044  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y227.544 
M73 P77 R3
G1  X166.963 
G1  Y226.544 
G1  X168.463 
G1  Y228.044 
G1  X166.463 
G1  Y226.044 
G1  X170.463 Y227.044   F1782
G1 E0.4000 F1800
M400
M104 T0 S220 N0
M204 S8000
G1  X185.963  E0.5891 F1782
G1  Y227.794  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y228.544  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y229.294  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y230.044  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y230.794  E0.0285
G1  X167.463  E0.7031
G1  Y231.544  E0.0285
G1  X185.963  E0.7031
G1  Y232.294  E0.0285
G1  X167.463  E0.7031
G1  Y233.044  E0.0285
G1  X185.963  E0.7031
G1  Y233.794  E0.0285
G1  X167.463  E0.7031
G1  Y234.544  E0.0285
G1  X185.963  E0.7031
G1  Y235.294  E0.0285
G1  X167.463  E0.7031
G1  Y236.044  E0.0285
G1  X185.963  E0.7031
G1  Y236.794  E0.0285
G1  X167.463  E0.7031
G1  Y237.544  E0.0285
G1  X185.963  E0.7031
G1  Y238.294  E0.0285
G1  X167.463  E0.7031
G1  Y239.044  E0.0285
G1  X185.963  E0.7031
G1  Y239.794  E0.0285
M632 S1 W
M400
M104 T1 S210 N0 ;Multi extruder pre heating
M633
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F15000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y239.544   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.963 Y240.544  
M204 S8000
G3  X165.047 Y238.159   I4.010 J-5.182 E0.1174
G3  X166.223 Y235.694   I2.797 J-0.179 E0.1084
G2  X166.963 Y233.401   I-3.200 J-2.298 E0.0931
G2  X166.798 Y228.810   I-15.731 J-1.732 E0.1752
G2  X166.462 Y228.020   I-4.298 J1.359 E0.0327
G1 E-0.4000 F1800
M204 S10000
G1  X165.028 Y226.012   F600
G1 E0.4000 F1800
M204 S8000
G3  X165.438 Y224.470   I1.700 J-0.374 E0.0630 F5400
G3  X168.538 Y221.100   I20.025 J15.314 E0.1743
G3  X171.870 Y221.809   I1.296 J2.093 E0.1430
G2  X176.713 Y222.794   I3.707 J-5.829 E0.1921
G1  X177.963  E0.0475
G2  X182.814 Y220.839   I0.127 J-6.681 E0.2043
G3  X185.117 Y221.315   I0.817 J1.855 E0.0953
G1  X186.463 Y222.794   E0.0760
G3  X188.379 Y225.179   I-4.010 J5.182 E0.1173
G3  X187.203 Y227.644   I-2.797 J0.179 E0.1084
G2  X186.463 Y229.936   I3.199 J2.298 E0.0930
G2  X186.628 Y234.528   I15.729 J1.733 E0.1753
G2  X188.328 Y237.088   I11.313 J-5.667 E0.1171
G3  X187.988 Y238.868   I-1.658 J0.606 E0.0723
G1  X186.463 Y240.544   E0.0861
G3  X184.043 Y242.635   I-4.428 J-2.678 E0.1236
G3  X181.399 Y241.420   I-0.104 J-3.256 E0.1146
G2  X178.521 Y240.544   I-2.903 J4.371 E0.1160
G2  X173.401 Y240.768   I-1.808 J17.316 E0.1955
G2  X170.466 Y242.558   I5.648 J12.556 E0.1310
G3  X168.309 Y242.023   I-0.676 J-1.891 E0.0895
G1  X166.963 Y240.544   E0.0760
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X166.963 Y240.544 E-.00001
G1 X166.963 Y240.544 E-.00001
G1 X167.637 Y241.283 E-.37999
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F60000
; OBJECT_ID: 199
; COOLING_NODE: 0
M204 S10000
G1 X216 Y158.602
G1 Z1
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X217.398 Y158.602 E.04637
G1 X217.398 Y161.398 E.09274
G1 X214.602 Y161.398 E.09274
G1 X214.602 Y158.602 E.09274
G1 X215.94 Y158.602 E.04438
; COOLING_NODE: 0
M204 S250
G1 X216 Y158.21 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X217.79 Y158.21 E.055
G1 X217.79 Y161.79 E.11
G1 X214.21 Y161.79 E.11
G1 X214.21 Y158.21 E.11
G1 X215.94 Y158.21 E.05316
; WIPE_START
M204 S8000
G1 X216.94 Y158.21 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
M73 P78 R3
G3 Z1.4 I-1.054 J-.608 P1  F60000
G1 X215.78 Y160.22 Z1.4
G1 Z1
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48318
G1 F15000
M204 S8000
G1 X216.22 Y160.22 E.0158
G1 X216.22 Y159.78 E.0158
G1 X215.78 Y159.78 E.0158
G1 X215.78 Y160.16 E.01364
M204 S10000
G1 X215.371 Y160.629 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X216.629 Y160.629 E.03864
G1 X216.629 Y159.371 E.03864
G1 X215.371 Y159.371 E.03864
G1 X215.371 Y160.569 E.0368
M204 S10000
G1 X214.994 Y161.006 F60000
G1 F15000
M204 S8000
G1 X217.006 Y161.006 E.06181
G1 X217.006 Y158.994 E.06181
G1 X214.994 Y158.994 E.06181
G1 X214.994 Y160.946 E.05997
; WIPE_START
G1 X214.994 Y159.946 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.4 I1.217 J0 P1  F60000
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X286 Y160 Z1.4 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U286 V160 Z1.4 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 6/10
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change

M106 S188.7
; OBJECT_ID: 199
; COOLING_NODE: 0
G1 X216 Y158.602 F60000
G1 Z1.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X217.398 Y158.602 E.04637
G1 X217.398 Y161.398 E.09274
G1 X214.602 Y161.398 E.09274
G1 X214.602 Y158.602 E.09274
G1 X215.94 Y158.602 E.04438
; COOLING_NODE: 0
M204 S250
G1 X216 Y158.21 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X217.79 Y158.21 E.055
G1 X217.79 Y161.79 E.11
G1 X214.21 Y161.79 E.11
G1 X214.21 Y158.21 E.11
G1 X215.94 Y158.21 E.05316
; WIPE_START
M204 S8000
G1 X216.94 Y158.21 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I-1.054 J-.608 P1  F60000
G1 X215.78 Y160.22 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48318
G1 F15000
M204 S8000
G1 X216.22 Y160.22 E.0158
G1 X216.22 Y159.78 E.0158
G1 X215.78 Y159.78 E.0158
G1 X215.78 Y160.16 E.01364
M204 S10000
G1 X215.371 Y160.629 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X216.629 Y160.629 E.03864
G1 X216.629 Y159.371 E.03864
G1 X215.371 Y159.371 E.03864
G1 X215.371 Y160.569 E.0368
M204 S10000
G1 X214.994 Y161.006 F60000
G1 F15000
M204 S8000
G1 X217.006 Y161.006 E.06181
G1 X217.006 Y158.994 E.06181
G1 X214.994 Y158.994 E.06181
G1 X214.994 Y160.946 E.05997
; WIPE_START
G1 X214.994 Y159.946 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F60000
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X286 Y160 Z1.6 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U286 V160 Z1.6 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

M204 S10000
G1 X167.463 Y239.544
G1 Z1.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.963 Y240.544  
M204 S8000
G3  X165.047 Y238.159   I4.010 J-5.182 E0.1174 F5400
G3  X166.223 Y235.694   I2.797 J-0.179 E0.1084
G2  X166.963 Y233.401   I-3.200 J-2.298 E0.0931
G2  X166.798 Y228.810   I-15.731 J-1.732 E0.1752
G2  X165.098 Y226.250   I-11.313 J5.667 E0.1171
G3  X165.438 Y224.470   I1.658 J-0.606 E0.0723
G3  X168.538 Y221.100   I20.025 J15.314 E0.1743
G3  X171.870 Y221.809   I1.296 J2.093 E0.1430
G2  X176.713 Y222.794   I3.707 J-5.829 E0.1921
G1  X177.963  E0.0475
G2  X182.814 Y220.839   I0.127 J-6.681 E0.2043
G3  X185.117 Y221.315   I0.817 J1.855 E0.0953
G1  X186.463 Y222.794   E0.0760
G3  X188.379 Y225.179   I-4.010 J5.182 E0.1173
G3  X187.203 Y227.644   I-2.797 J0.179 E0.1084
G2  X186.463 Y229.936   I3.199 J2.298 E0.0930
G2  X186.628 Y234.528   I15.729 J1.733 E0.1753
G2  X188.328 Y237.088   I11.313 J-5.667 E0.1171
G3  X187.988 Y238.868   I-1.658 J0.606 E0.0723
G1 E-0.4000 F1800
M204 S10000
G1  X186.304 Y240.718   F600
G1 E0.4000 F1800
M204 S8000
G3  X183.574 Y242.676   I-3.488 J-1.982 E0.1317 F5400
G3  X181.239 Y241.317   I1.125 J-4.619 E0.1041
G2  X178.521 Y240.544   I-2.725 J4.418 E0.1088
G2  X173.401 Y240.768   I-1.808 J17.316 E0.1955
G2  X170.466 Y242.558   I5.648 J12.556 E0.1310
G3  X168.309 Y242.023   I-0.676 J-1.891 E0.0895
G1  X166.963 Y240.544   E0.0760
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #6
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z1.6 I1.217 J0 P1  F60000
G1 X167.713 Y223.544
G1 Z1.2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1 ON1 NN0
M204 S8000
G1  X185.713 Y223.544  E1.4325 F7836
G1  Y224.794  E0.0995
G1  X167.713  E1.4325
G1  Y226.044  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1 ON1 NN0
M400
M104 T0 S142 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y226.044 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z1.6 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.2 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T220 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E4

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P79 R3
G1 Y320 F30000
G1 X191.44

G1 Y295
G1 Y265 F18000
G1 Z4.2 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S188.7
M106 P2 S0
G1 X190.44 Y239.794 F15000
M204 S5000
G1 Z1.2

; filament start gcode
G17
G3 Z1.6 I0 J-1.217 P1
G1 X185.963 Y239.794 Z1.6
G1 Z1.2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
; LINE_WIDTH: 0.500000
M204 S5000
G1  X182.963 Y239.794  E0.1140 F1782
G1 E-0.4000 F1800
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y240.294 
G1  X185.463 
G1  Y239.294 
G1  X186.963 
G1  Y240.794 
G1  X184.963 
G1  Y238.794 
G1  X182.963 Y239.794   F1782
G1 E0.4000 F1800
M400
M104 T1 S220 N0
G1  X167.463  E0.5891 F1782
G1  Y239.044  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y238.294  E0.0285
G1  X167.463  E0.7031 F2473
G1  Y237.544  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y236.794  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y236.044  E0.0285
G1  X185.963  E0.7031
G1  Y235.294  E0.0285
G1  X167.463  E0.7031
G1  Y234.544  E0.0285
G1  X185.963  E0.7031
G1  Y233.794  E0.0285
G1  X167.463  E0.7031
G1  Y233.044  E0.0285
G1  X185.963  E0.7031
G1  Y232.294  E0.0285
G1  X167.463  E0.7031
G1  Y231.544  E0.0285
G1  X185.963  E0.7031
G1  Y230.794  E0.0285
G1  X167.463  E0.7031
G1  Y230.044  E0.0285
G1  X185.963  E0.7031
G1  Y229.294  E0.0285
G1  X167.463  E0.7031
G1  Y228.544  E0.0285
M73 P80 R3
G1  X185.963  E0.7031
G1  Y227.794  E0.0285
G1  X167.463  E0.7031
G1  Y227.044  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F15000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
G1 X184.963 Y227.044 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.6 I1.217 J0 P1  F15000
; OBJECT_ID: 199
; COOLING_NODE: 1
M204 S5000
G1 X216 Y162.602
G1 Z1.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9000
G1 X217.398 Y162.602 E.04637
G1 X217.398 Y186.398 E.78935
G1 X159.838 Y186.398 E1.90937
G1 X159.838 Y185.602 E.0264
G1 X214.602 Y185.602 E1.81662
G1 X214.602 Y162.602 E.76295
G1 X215.94 Y162.602 E.04438
; COOLING_NODE: 1
M204 S250
G1 X216 Y162.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X217.79 Y162.21 E.055
G1 X217.79 Y186.79 E.75528
G1 X142.045 Y186.79 E2.32744
G1 X142.045 Y185.21 E.04855
G1 X214.21 Y185.21 E2.21743
G1 X214.21 Y162.21 E.70673
G1 X215.94 Y162.21 E.05316
; COOLING_NODE: 1
; WIPE_START
M204 S5000
G1 X216.94 Y162.21 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.6 I1.194 J-.233 P1  F15000
G1 X216 Y157.398 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X214.602 Y157.398 E.04637
G1 X214.602 Y134.398 E.76295
G1 X159.838 Y134.398 E1.81662
G1 X159.838 Y133.602 E.0264
G1 X217.398 Y133.602 E1.90937
G1 X217.398 Y157.398 E.78935
M73 P80 R2
G1 X216.06 Y157.398 E.04438
; COOLING_NODE: 1
M204 S250
G1 X216 Y157.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X214.21 Y157.79 E.055
G1 X214.21 Y134.79 E.70673
G1 X142.045 Y134.79 E2.21743
G1 X142.045 Y133.21 E.04855
G1 X217.79 Y133.21 E2.32744
G1 X217.79 Y157.79 E.75528
G1 X216.06 Y157.79 E.05316
; WIPE_START
M204 S5000
G1 X215.06 Y157.79 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.6 I.455 J1.129 P1  F15000
G1 X217.006 Y157.006 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F2400
G1 X217.006 Y133.994 E.70707
G1 X215.198 Y133.994 E.05556
G1 X215.175 Y134.508 E.01582
G1 X214.994 Y134.623 E.00659
M73 P81 R2
G1 X214.994 Y157.006 E.68775
G1 X216.946 Y157.006 E.05997
G1 X216.629 Y134.967 F15000
G1 F2400
G1 X216.629 Y134.371 E.0183
G1 X215.575 Y134.371 E.03239
G1 X215.478 Y134.735 E.01157
G1 X215.371 Y134.792 E.00373
G1 X215.371 Y156.629 E.67096
G1 X216.629 Y156.629 E.03864
G1 X216.629 Y135.027 E.66375
G1 X216.22 Y134.967 F15000
; Slow Down Start
; LINE_WIDTH: 0.483185
G1 F1500;_EXTRUDE_SET_SPEED
G1 X216.22 Y156.22 E.76248
G1 X215.78 Y156.22 E.0158
G1 X215.78 Y134.983 E.76189
G1 X215.817 Y134.963 E.00152
G1 X215.893 Y134.78 E.00712
G1 X216.22 Y134.78 E.01174
G1 X216.22 Y134.907 E.00456
; Slow Down End
G1 X214.806 Y134 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X160.042 Y134 E1.73504
; WIPE_START
G1 X161.042 Y134 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.6 I-.348 J-1.166 P1  F15000
G1 X159.09 Y134.583 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X159.616 Y134.057 E.02285
G1 X159.749 Y133.923
G1 X159.749 Y133.39
G1 X159.616 Y133.524
G1 X158.557 Y134.583 E.04602
G1 X158.423 Y134.716
G1 X157.89 Y134.716
G1 X158.023 Y134.583
G1 X159.189 Y133.417 E.05063
G1 X159.322 Y133.284
G1 X158.789 Y133.284
G1 X158.655 Y133.417
G1 X157.49 Y134.583 E.05063
G1 X157.356 Y134.716
G1 X156.823 Y134.716
G1 X156.957 Y134.583
G1 X158.122 Y133.417 E.05063
G1 X158.256 Y133.284
G1 X157.722 Y133.284
G1 X157.589 Y133.417
G1 X156.424 Y134.583 E.05063
G1 X156.29 Y134.716
G1 X155.757 Y134.716
G1 X155.89 Y134.583
G1 X157.056 Y133.417 E.05063
G1 X157.189 Y133.284
G1 X156.656 Y133.284
G1 X156.522 Y133.417
G1 X155.357 Y134.583 E.05063
G1 X155.223 Y134.716
G1 X154.69 Y134.716
G1 X154.824 Y134.583
G1 X155.989 Y133.417 E.05063
G1 X156.123 Y133.284
G1 X155.589 Y133.284
G1 X155.456 Y133.417
G1 X154.291 Y134.583 E.05063
G1 X154.157 Y134.716
G1 X153.624 Y134.716
G1 X153.757 Y134.583
G1 X154.923 Y133.417 E.05063
G1 X155.056 Y133.284
G1 X154.523 Y133.284
G1 X154.389 Y133.417
G1 X153.224 Y134.583 E.05063
G1 X153.09 Y134.716
G1 X152.557 Y134.716
G1 X152.691 Y134.583
G1 X153.856 Y133.417 E.05063
G1 X153.99 Y133.284
G1 X153.456 Y133.284
G1 X153.323 Y133.417
G1 X152.158 Y134.583 E.05063
G1 X152.024 Y134.716
G1 X151.491 Y134.716
G1 X151.624 Y134.583
G1 X152.789 Y133.417 E.05063
G1 X152.923 Y133.284
G1 X152.39 Y133.284
G1 X152.256 Y133.417
G1 X151.091 Y134.583 E.05063
G1 X150.957 Y134.716
G1 X150.424 Y134.716
G1 X150.558 Y134.583
G1 X151.723 Y133.417 E.05063
G1 X151.857 Y133.284
G1 X151.323 Y133.284
G1 X151.19 Y133.417
G1 X150.024 Y134.583 E.05063
G1 X149.891 Y134.716
G1 X149.358 Y134.716
G1 X149.491 Y134.583
G1 X150.656 Y133.417 E.05063
G1 X150.79 Y133.284
G1 X150.257 Y133.284
G1 X150.123 Y133.417
G1 X148.958 Y134.583 E.05063
G1 X148.824 Y134.716
G1 X148.291 Y134.716
G1 X148.425 Y134.583
G1 X149.59 Y133.417 E.05063
G1 X149.724 Y133.284
G1 X149.19 Y133.284
G1 X149.057 Y133.417
G1 X147.891 Y134.583 E.05063
G1 X147.758 Y134.716
G1 X147.225 Y134.716
G1 X147.358 Y134.583
G1 X148.523 Y133.417 E.05063
G1 X148.657 Y133.284
G1 X148.124 Y133.284
G1 X147.99 Y133.417
G1 X146.825 Y134.583 E.05063
G1 X146.691 Y134.716
G1 X146.158 Y134.716
G1 X146.292 Y134.583
G1 X147.457 Y133.417 E.05063
G1 X147.591 Y133.284
G1 X147.057 Y133.284
G1 X146.924 Y133.417
G1 X145.758 Y134.583 E.05063
G1 X145.625 Y134.716
G1 X145.092 Y134.716
G1 X145.225 Y134.583
G1 X146.39 Y133.417 E.05063
G1 X146.524 Y133.284
G1 X145.991 Y133.284
G1 X145.857 Y133.417
G1 X144.692 Y134.583 E.05063
G1 X144.558 Y134.716
G1 X144.025 Y134.716
G1 X144.159 Y134.583
G1 X145.324 Y133.417 E.05063
G1 X145.458 Y133.284
G1 X144.924 Y133.284
G1 X144.791 Y133.417
G1 X143.625 Y134.583 E.05063
G1 X143.492 Y134.716
G1 X142.959 Y134.716
G1 X143.092 Y134.583
G1 X144.257 Y133.417 E.05063
G1 X144.391 Y133.284
G1 X143.858 Y133.284
G1 X143.724 Y133.417
G1 X142.559 Y134.583 E.05063
G1 X142.425 Y134.716
G1 X142.119 Y134.49
G1 X142.252 Y134.356
G1 X143.191 Y133.417 E.04079
G1 X143.325 Y133.284
G1 X142.791 Y133.284
G1 X142.658 Y133.417
G1 X142.252 Y133.823 E.01761
; WIPE_START
M204 S5000
G1 X142.658 Y133.417 E-.21784
G1 X142.791 Y133.284 E-.07182
G1 X143.029 Y133.284 E-.09034
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.6 I-1.158 J.374 P1  F15000
G1 X160.042 Y186 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X214.806 Y186 E1.73504
G1 X214.994 Y162.994 F15000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F2400
G1 X214.994 Y185.392 E.68821
G1 X215.175 Y185.492 E.00635
G1 X215.198 Y186.006 E.01582
G1 X217.006 Y186.006 E.05556
M73 P82 R2
G1 X217.006 Y162.994 E.70707
G1 X215.054 Y162.994 E.05997
G1 X216.629 Y164 F15000
G1 F2400
G1 X216.629 Y163.371 E.01932
G1 X215.371 Y163.371 E.03864
G1 X215.371 Y185.208 E.67096
G1 X215.508 Y185.314 E.00532
G1 X215.575 Y185.629 E.00989
G1 X216.629 Y185.629 E.03239
G1 X216.629 Y164.06 E.66273
G1 X216.22 Y164 F15000
; Slow Down Start
; LINE_WIDTH: 0.483185
G1 F1500;_EXTRUDE_SET_SPEED
G1 X216.22 Y185.22 E.76129
G1 X215.893 Y185.22 E.01174
G2 X215.78 Y185.017 I-.264 J.014 E.00865
G1 X215.78 Y163.78 E.76189
G1 X216.22 Y163.78 E.0158
G1 X216.22 Y163.94 E.00575
; Slow Down End
; WIPE_START
G1 X216.22 Y163.78 E-.06085
G1 X215.78 Y163.78 E-.1673
G1 X215.78 Y164.179 E-.15184
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.6 I-.445 J-1.133 P1  F15000
G1 X158.816 Y186.583 Z1.6
G1 Z1.2
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X159.616 Y185.783 E.03475
G1 X159.749 Y185.649
G1 X159.581 Y185.284
G1 X159.448 Y185.417
G1 X158.283 Y186.583 E.05063
G1 X158.149 Y186.716
G1 X157.616 Y186.716
G1 X157.749 Y186.583
G1 X158.915 Y185.417 E.05063
G1 X159.048 Y185.284
G1 X158.515 Y185.284
G1 X158.381 Y185.417
G1 X157.216 Y186.583 E.05063
G1 X157.082 Y186.716
G1 X156.549 Y186.716
G1 X156.683 Y186.583
G1 X157.848 Y185.417 E.05063
G1 X157.982 Y185.284
G1 X157.448 Y185.284
G1 X157.315 Y185.417
G1 X156.15 Y186.583 E.05063
G1 X156.016 Y186.716
G1 X155.483 Y186.716
G1 X155.616 Y186.583
G1 X156.782 Y185.417 E.05063
G1 X156.915 Y185.284
G1 X156.382 Y185.284
G1 X156.248 Y185.417
G1 X155.083 Y186.583 E.05063
G1 X154.949 Y186.716
G1 X154.416 Y186.716
G1 X154.55 Y186.583
G1 X155.715 Y185.417 E.05063
G1 X155.849 Y185.284
G1 X155.315 Y185.284
G1 X155.182 Y185.417
G1 X154.017 Y186.583 E.05063
G1 X153.883 Y186.716
G1 X153.35 Y186.716
G1 X153.483 Y186.583
G1 X154.648 Y185.417 E.05063
G1 X154.782 Y185.284
G1 X154.249 Y185.284
G1 X154.115 Y185.417
G1 X152.95 Y186.583 E.05063
G1 X152.816 Y186.716
G1 X152.283 Y186.716
G1 X152.417 Y186.583
G1 X153.582 Y185.417 E.05063
G1 X153.716 Y185.284
G1 X153.182 Y185.284
G1 X153.049 Y185.417
G1 X151.883 Y186.583 E.05063
G1 X151.75 Y186.716
G1 X151.217 Y186.716
G1 X151.35 Y186.583
G1 X152.515 Y185.417 E.05063
G1 X152.649 Y185.284
G1 X152.116 Y185.284
G1 X151.982 Y185.417
G1 X150.817 Y186.583 E.05063
G1 X150.683 Y186.716
G1 X150.15 Y186.716
G1 X150.284 Y186.583
G1 X151.449 Y185.417 E.05063
G1 X151.583 Y185.284
G1 X151.049 Y185.284
G1 X150.916 Y185.417
G1 X149.75 Y186.583 E.05063
G1 X149.617 Y186.716
G1 X149.084 Y186.716
G1 X149.217 Y186.583
G1 X150.382 Y185.417 E.05063
G1 X150.516 Y185.284
G1 X149.983 Y185.284
G1 X149.849 Y185.417
G1 X148.684 Y186.583 E.05063
G1 X148.55 Y186.716
G1 X148.017 Y186.716
G1 X148.151 Y186.583
G1 X149.316 Y185.417 E.05063
G1 X149.45 Y185.284
G1 X148.916 Y185.284
G1 X148.783 Y185.417
G1 X147.617 Y186.583 E.05063
G1 X147.484 Y186.716
G1 X146.951 Y186.716
G1 X147.084 Y186.583
G1 X148.249 Y185.417 E.05063
G1 X148.383 Y185.284
G1 X147.85 Y185.284
G1 X147.716 Y185.417
G1 X146.551 Y186.583 E.05063
G1 X146.417 Y186.716
G1 X145.884 Y186.716
G1 X146.018 Y186.583
G1 X147.183 Y185.417 E.05063
G1 X147.317 Y185.284
G1 X146.783 Y185.284
G1 X146.65 Y185.417
G1 X145.484 Y186.583 E.05063
G1 X145.351 Y186.716
G1 X144.818 Y186.716
G1 X144.951 Y186.583
M632 S0 W
M400
M104 T0 S210 N0 ;Multi extruder pre heating
M633
G1 X146.116 Y185.417 E.05063
G1 X146.25 Y185.284
G1 X145.717 Y185.284
G1 X145.583 Y185.417
G1 X144.418 Y186.583 E.05063
G1 X144.284 Y186.716
G1 X143.751 Y186.716
G1 X143.885 Y186.583
G1 X145.05 Y185.417 E.05063
G1 X145.183 Y185.284
G1 X144.65 Y185.284
G1 X144.517 Y185.417
G1 X143.351 Y186.583 E.05063
G1 X143.218 Y186.716
G1 X142.684 Y186.716
G1 X142.818 Y186.583
G1 X143.983 Y185.417 E.05063
G1 X144.117 Y185.284
G1 X143.584 Y185.284
G1 X143.45 Y185.417
G1 X142.285 Y186.583 E.05063
G1 X142.151 Y186.716
G1 X142.119 Y186.216
G1 X142.252 Y186.082
G1 X142.917 Y185.417 E.02888
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X142.252 Y186.082 E-.35715
G1 X142.21 Y186.124 E-.02285
; WIPE_END
G1 E-.02 F1800
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 7/10
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change

M106 S193.8
; OBJECT_ID: 199
; COOLING_NODE: 1
G17
G3 Z1.6 I.37 J1.159 P1  F15000
G1 X216 Y162.602 Z1.6
G1 Z1.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9000
G1 X217.398 Y162.602 E.04637
G1 X217.398 Y186.398 E.78935
G1 X176.764 Y186.398 E1.34791
G1 X176.764 Y185.602 E.0264
G1 X214.602 Y185.602 E1.25517
G1 X214.602 Y162.602 E.76295
G1 X215.94 Y162.602 E.04438
; COOLING_NODE: 1
M204 S250
G1 X216 Y162.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X217.79 Y162.21 E.055
G1 X217.79 Y186.79 E.75528
G1 X158.97 Y186.79 E1.80736
G1 X158.97 Y185.21 E.04855
G1 X214.21 Y185.21 E1.69736
M73 P83 R2
G1 X214.21 Y162.21 E.70673
G1 X215.94 Y162.21 E.05316
; COOLING_NODE: 1
; WIPE_START
M204 S5000
G1 X216.94 Y162.21 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.8 I1.194 J-.233 P1  F15000
G1 X216 Y157.398 Z1.8
G1 Z1.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X214.602 Y157.398 E.04637
G1 X214.602 Y134.398 E.76295
G1 X176.764 Y134.398 E1.25517
G1 X176.764 Y133.602 E.0264
G1 X217.398 Y133.602 E1.34791
G1 X217.398 Y157.398 E.78935
G1 X216.06 Y157.398 E.04438
; COOLING_NODE: 1
M204 S250
G1 X216 Y157.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X214.21 Y157.79 E.055
G1 X214.21 Y134.79 E.70673
G1 X158.97 Y134.79 E1.69736
G1 X158.97 Y133.21 E.04855
G1 X217.79 Y133.21 E1.80736
G1 X217.79 Y157.79 E.75528
G1 X216.06 Y157.79 E.05316
; WIPE_START
M204 S5000
G1 X215.06 Y157.79 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.8 I1.106 J.507 P1  F15000
G1 X215.78 Y156.22 Z1.8
G1 Z1.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F6000
G1 X216.22 Y156.22 E.0158
G1 X216.22 Y134.78 E.76919
G1 X215.893 Y134.78 E.01174
G1 X215.817 Y134.963 E.00712
G1 X215.78 Y134.983 E.00152
G1 X215.78 Y156.16 E.75974
G1 X215.371 Y156.629 F15000
; LINE_WIDTH: 0.41999
G1 F6000
G1 X216.629 Y156.629 E.03864
G1 X216.629 Y134.371 E.6839
G1 X215.575 Y134.371 E.03239
G1 X215.478 Y134.735 E.01157
G1 X215.371 Y134.792 E.00373
G1 X215.371 Y156.569 E.66912
G1 X214.994 Y157.006 F15000
G1 F6000
G1 X217.006 Y157.006 E.06181
G1 X217.006 Y133.994 E.70707
G1 X215.198 Y133.994 E.05556
G1 X215.175 Y134.508 E.01582
G1 X214.994 Y134.623 E.00659
G1 X214.994 Y156.946 E.6859
; WIPE_START
G1 X214.994 Y155.946 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.8 I-1.211 J.121 P1  F15000
G1 X215.78 Y163.78 Z1.8
G1 Z1.4
G1 E.4 F1800
; LINE_WIDTH: 0.483185
G1 F6000
G1 X215.78 Y185.017 E.76189
G3 X215.893 Y185.22 I-.151 J.217 E.00865
G1 X216.22 Y185.22 E.01174
G1 X216.22 Y163.78 E.76919
G1 X215.84 Y163.78 E.01364
G1 X215.371 Y163.371 F15000
; LINE_WIDTH: 0.41999
G1 F6000
G1 X215.371 Y185.208 E.67096
G1 X215.508 Y185.314 E.00532
G1 X215.575 Y185.629 E.00989
G1 X216.629 Y185.629 E.03239
G1 X216.629 Y163.371 E.6839
G1 X215.431 Y163.371 E.0368
G1 X214.994 Y162.994 F15000
G1 F6000
G1 X214.994 Y185.392 E.68821
G1 X215.175 Y185.492 E.00635
G1 X215.198 Y186.006 E.01582
G1 X217.006 Y186.006 E.05556
G1 X217.006 Y162.994 E.70707
G1 X215.054 Y162.994 E.05997
G1 X214.806 Y186 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X176.967 Y186 E1.1988
G1 X176.541 Y185.804 F15000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X176.154 Y185.417 E.01682
G1 X176.02 Y185.284
G1 X175.487 Y185.284
G1 X175.621 Y185.417
G1 X176.541 Y186.338 E.03999
G1 X176.675 Y186.471
G1 X176.386 Y186.716
G1 X176.253 Y186.583
G1 X175.088 Y185.417 E.05063
G1 X174.954 Y185.284
G1 X174.421 Y185.284
G1 X174.554 Y185.417
G1 X175.72 Y186.583 E.05063
G1 X175.853 Y186.716
G1 X175.32 Y186.716
G1 X175.186 Y186.583
M73 P84 R2
G1 X174.021 Y185.417 E.05063
G1 X173.887 Y185.284
G1 X173.354 Y185.284
G1 X173.488 Y185.417
G1 X174.653 Y186.583 E.05063
G1 X174.787 Y186.716
G1 X174.253 Y186.716
G1 X174.12 Y186.583
G1 X172.955 Y185.417 E.05063
G1 X172.821 Y185.284
G1 X172.288 Y185.284
G1 X172.421 Y185.417
G1 X173.587 Y186.583 E.05063
G1 X173.72 Y186.716
G1 X173.187 Y186.716
G1 X173.053 Y186.583
G1 X171.888 Y185.417 E.05063
G1 X171.754 Y185.284
G1 X171.221 Y185.284
G1 X171.355 Y185.417
G1 X172.52 Y186.583 E.05063
G1 X172.654 Y186.716
G1 X172.12 Y186.716
G1 X171.987 Y186.583
G1 X170.822 Y185.417 E.05063
G1 X170.688 Y185.284
G1 X170.155 Y185.284
G1 X170.288 Y185.417
G1 X171.454 Y186.583 E.05063
G1 X171.587 Y186.716
G1 X171.054 Y186.716
G1 X170.92 Y186.583
G1 X169.755 Y185.417 E.05063
G1 X169.621 Y185.284
G1 X169.088 Y185.284
G1 X169.222 Y185.417
G1 X170.387 Y186.583 E.05063
G1 X170.521 Y186.716
G1 X169.987 Y186.716
G1 X169.854 Y186.583
G1 X168.689 Y185.417 E.05063
G1 X168.555 Y185.284
G1 X168.022 Y185.284
G1 X168.155 Y185.417
G1 X169.32 Y186.583 E.05063
G1 X169.454 Y186.716
G1 X168.921 Y186.716
G1 X168.787 Y186.583
G1 X167.622 Y185.417 E.05063
G1 X167.488 Y185.284
G1 X166.955 Y185.284
G1 X167.089 Y185.417
G1 X168.254 Y186.583 E.05063
G1 X168.388 Y186.716
G1 X167.854 Y186.716
G1 X167.721 Y186.583
G1 X166.555 Y185.417 E.05063
G1 X166.422 Y185.284
G1 X165.889 Y185.284
G1 X166.022 Y185.417
G1 X167.187 Y186.583 E.05063
G1 X167.321 Y186.716
G1 X166.788 Y186.716
G1 X166.654 Y186.583
G1 X165.489 Y185.417 E.05063
G1 X165.355 Y185.284
G1 X164.822 Y185.284
G1 X164.956 Y185.417
G1 X166.121 Y186.583 E.05063
G1 X166.255 Y186.716
G1 X165.721 Y186.716
G1 X165.588 Y186.583
G1 X164.422 Y185.417 E.05063
G1 X164.289 Y185.284
G1 X163.756 Y185.284
G1 X163.889 Y185.417
G1 X165.054 Y186.583 E.05063
G1 X165.188 Y186.716
G1 X164.655 Y186.716
G1 X164.521 Y186.583
G1 X163.356 Y185.417 E.05063
G1 X163.222 Y185.284
G1 X162.689 Y185.284
G1 X162.823 Y185.417
G1 X163.988 Y186.583 E.05063
G1 X164.122 Y186.716
G1 X163.588 Y186.716
G1 X163.455 Y186.583
G1 X162.289 Y185.417 E.05063
G1 X162.156 Y185.284
G1 X161.623 Y185.284
G1 X161.756 Y185.417
G1 X162.921 Y186.583 E.05063
G1 X163.055 Y186.716
G1 X162.522 Y186.716
G1 X162.388 Y186.583
G1 X161.223 Y185.417 E.05063
G1 X161.089 Y185.284
G1 X160.556 Y185.284
G1 X160.69 Y185.417
G1 X161.855 Y186.583 E.05063
G1 X161.989 Y186.716
G1 X161.455 Y186.716
G1 X161.322 Y186.583
G1 X160.156 Y185.417 E.05063
G1 X160.023 Y185.284
G1 X159.489 Y185.284
G1 X159.623 Y185.417
G1 X160.788 Y186.583 E.05063
G1 X160.922 Y186.716
G1 X160.389 Y186.716
G1 X160.255 Y186.583
G1 X159.178 Y185.505 E.04681
G1 X159.044 Y185.372
G1 X159.044 Y185.905
G1 X159.178 Y186.039
G1 X159.722 Y186.583 E.02364
; WIPE_START
M204 S5000
G1 X159.178 Y186.039 E-.29236
G1 X159.044 Y185.905 E-.07182
G1 X159.044 Y185.863 E-.01583
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.8 I1.15 J.397 P1  F15000
G1 X176.967 Y134 Z1.8
G1 Z1.4
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X214.806 Y134 E1.1988
; WIPE_START
G1 X213.806 Y134 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.8 I.019 J-1.217 P1  F15000
G1 X175.88 Y133.417 Z1.8
G1 Z1.4
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X176.541 Y134.079 E.02873
G1 X176.675 Y134.212
G1 X176.646 Y134.716
G1 X176.512 Y134.583
G1 X175.347 Y133.417 E.05063
G1 X175.213 Y133.284
G1 X174.68 Y133.284
G1 X174.814 Y133.417
G1 X175.979 Y134.583 E.05063
G1 X176.112 Y134.716
G1 X175.579 Y134.716
G1 X175.446 Y134.583
G1 X174.28 Y133.417 E.05063
G1 X174.147 Y133.284
G1 X173.613 Y133.284
G1 X173.747 Y133.417
G1 X174.912 Y134.583 E.05063
G1 X175.046 Y134.716
G1 X174.513 Y134.716
G1 X174.379 Y134.583
G1 X173.214 Y133.417 E.05063
G1 X173.08 Y133.284
G1 X172.547 Y133.284
G1 X172.681 Y133.417
G1 X173.846 Y134.583 E.05063
G1 X173.979 Y134.716
G1 X173.446 Y134.716
G1 X173.313 Y134.583
G1 X172.147 Y133.417 E.05063
G1 X172.014 Y133.284
G1 X171.48 Y133.284
G1 X171.614 Y133.417
G1 X172.779 Y134.583 E.05063
G1 X172.913 Y134.716
G1 X172.38 Y134.716
G1 X172.246 Y134.583
G1 X171.081 Y133.417 E.05063
G1 X170.947 Y133.284
G1 X170.414 Y133.284
G1 X170.548 Y133.417
G1 X171.713 Y134.583 E.05063
G1 X171.846 Y134.716
G1 X171.313 Y134.716
G1 X171.179 Y134.583
G1 X170.014 Y133.417 E.05063
G1 X169.881 Y133.284
G1 X169.347 Y133.284
G1 X169.481 Y133.417
G1 X170.646 Y134.583 E.05063
G1 X170.78 Y134.716
G1 X170.247 Y134.716
G1 X170.113 Y134.583
G1 X168.948 Y133.417 E.05063
G1 X168.814 Y133.284
G1 X168.281 Y133.284
G1 X168.414 Y133.417
G1 X169.58 Y134.583 E.05063
G1 X169.713 Y134.716
G1 X169.18 Y134.716
G1 X169.046 Y134.583
G1 X167.881 Y133.417 E.05063
G1 X167.748 Y133.284
G1 X167.214 Y133.284
G1 X167.348 Y133.417
G1 X168.513 Y134.583 E.05063
G1 X168.647 Y134.716
G1 X168.114 Y134.716
G1 X167.98 Y134.583
G1 X166.815 Y133.417 E.05063
G1 X166.681 Y133.284
G1 X166.148 Y133.284
G1 X166.281 Y133.417
G1 X167.447 Y134.583 E.05063
G1 X167.58 Y134.716
G1 X167.047 Y134.716
G1 X166.913 Y134.583
G1 X165.748 Y133.417 E.05063
G1 X165.615 Y133.284
G1 X165.081 Y133.284
G1 X165.215 Y133.417
G1 X166.38 Y134.583 E.05063
G1 X166.514 Y134.716
G1 X165.981 Y134.716
G1 X165.847 Y134.583
G1 X164.682 Y133.417 E.05063
G1 X164.548 Y133.284
G1 X164.015 Y133.284
G1 X164.148 Y133.417
G1 X165.314 Y134.583 E.05063
G1 X165.447 Y134.716
G1 X164.914 Y134.716
G1 X164.78 Y134.583
G1 X163.615 Y133.417 E.05063
G1 X163.482 Y133.284
G1 X162.948 Y133.284
G1 X163.082 Y133.417
G1 X164.247 Y134.583 E.05063
G1 X164.381 Y134.716
G1 X163.848 Y134.716
G1 X163.714 Y134.583
G1 X162.549 Y133.417 E.05063
G1 X162.415 Y133.284
G1 X161.882 Y133.284
G1 X162.015 Y133.417
G1 X163.181 Y134.583 E.05063
G1 X163.314 Y134.716
G1 X162.781 Y134.716
G1 X162.647 Y134.583
G1 X161.482 Y133.417 E.05063
G1 X161.348 Y133.284
G1 X160.815 Y133.284
G1 X160.949 Y133.417
G1 X162.114 Y134.583 E.05063
G1 X162.248 Y134.716
G1 X161.714 Y134.716
G1 X161.581 Y134.583
G1 X160.416 Y133.417 E.05063
G1 X160.282 Y133.284
G1 X159.749 Y133.284
G1 X159.882 Y133.417
G1 X161.048 Y134.583 E.05063
G1 X161.181 Y134.716
G1 X160.648 Y134.716
G1 X160.514 Y134.583
G1 X159.349 Y133.417 E.05063
G1 X159.215 Y133.284
G1 X159.044 Y133.646
G1 X159.178 Y133.779
G1 X159.981 Y134.583 E.03491
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #7
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
; WIPE_START
M204 S5000
G1 X159.274 Y133.876 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z1.8 I1.217 J0 P1  F15000
G1 X167.713 Y223.544
G1 Z1.4
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0 ON0 NN1
M204 S5000
G1  X185.713 Y223.544  E1.4325 F7836
G1  Y224.794  E0.0995
G1  X167.713  E1.4325
G1  Y226.044  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0 ON0 NN1
M400
M104 T1 S190 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
G1 X184.713 Y226.044 E-1.9
; WIPE_END
G1 E-.1 F1800
G17
G3 Z1.8 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.4 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T220 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E3

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P85 R2
G1 Y320 F30000
G1 X191.44

G1 Y295
G1 Y265 F18000
G1 Z4.4 F3000

M204 S5000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S193.8
M106 P2 S0
G1 X190.44 Y227.044 F60000
M204 S10000
G1 Z1.4

; filament start gcode
G17
G3 Z1.8 I0 J-1.217 P1
G1 X185.963 Y227.044 Z1.8
G1 Z1.4
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X182.963 Y227.044  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y227.544 
G1  X185.463 
G1  Y226.544 
G1  X186.963 
G1  Y228.044 
G1  X184.963 
G1  Y226.044 
G1  X182.963 Y227.044   F1782
G1 E0.4000 F1800
M400
M104 T0 S220 N0
M204 S8000
G1  X167.463  E0.5891 F1782
G1  Y227.794  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y228.544  E0.0285
M73 P86 R2
G1  X167.463  E0.7031 F2473
G1  Y229.294  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y230.044  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y230.794  E0.0285
G1  X185.963  E0.7031
G1  Y231.544  E0.0285
G1  X167.463  E0.7031
G1  Y232.294  E0.0285
G1  X185.963  E0.7031
G1  Y233.044  E0.0285
G1  X167.463  E0.7031
G1  Y233.794  E0.0285
G1  X185.963  E0.7031
G1  Y234.544  E0.0285
G1  X167.463  E0.7031
G1  Y235.294  E0.0285
G1  X185.963  E0.7031
G1  Y236.044  E0.0285
G1  X167.463  E0.7031
G1  Y236.794  E0.0285
G1  X185.963  E0.7031
G1  Y237.544  E0.0285
G1  X167.463  E0.7031
G1  Y238.294  E0.0285
G1  X185.963  E0.7031
G1  Y239.044  E0.0285
G1  X167.463  E0.7031
M632 S1 W
M400
M104 T1 S210 N0 ;Multi extruder pre heating
M633
G1  Y239.794  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F15000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y239.544   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.463 Y240.544  
M204 S8000
G3  X184.043 Y242.635   I-4.428 J-2.678 E0.1236
G3  X181.399 Y241.420   I-0.104 J-3.256 E0.1146
G2  X178.521 Y240.544   I-2.903 J4.371 E0.1160
G2  X173.401 Y240.768   I-1.808 J17.316 E0.1955
G2  X170.466 Y242.558   I5.648 J12.556 E0.1310
G3  X168.309 Y242.023   I-0.676 J-1.891 E0.0895
G1  X166.963 Y240.544   E0.0760
G3  X165.047 Y238.159   I4.010 J-5.182 E0.1174
G3  X166.223 Y235.694   I2.797 J-0.179 E0.1084
G2  X166.963 Y233.401   I-3.200 J-2.298 E0.0931
G2  X166.798 Y228.810   I-15.731 J-1.732 E0.1752
G2  X165.098 Y226.250   I-11.313 J5.667 E0.1171
G3  X165.438 Y224.470   I1.658 J-0.606 E0.0723
G3  X168.538 Y221.100   I20.025 J15.314 E0.1743
G3  X171.870 Y221.809   I1.296 J2.093 E0.1430
G2  X176.713 Y222.794   I3.707 J-5.829 E0.1921
G1  X177.963  E0.0475
G2  X182.814 Y220.839   I0.127 J-6.681 E0.2043
G3  X185.117 Y221.315   I0.817 J1.855 E0.0953
G1  X186.463 Y222.794   E0.0760
G3  X188.379 Y225.179   I-4.010 J5.182 E0.1173
G3  X188.398 Y226.012   I-1.704 J0.457 E0.0320
G1 E-0.4000 F1800
M204 S10000
G1  X186.964 Y228.020   F600
G1 E0.4000 F1800
M204 S8000
G2  X186.463 Y229.936   I3.436 J1.922 E0.0761 F5400
G2  X186.628 Y234.528   I15.729 J1.733 E0.1753
G2  X188.328 Y237.088   I11.313 J-5.667 E0.1171
G3  X187.988 Y238.868   I-1.658 J0.606 E0.0723
G1  X186.463 Y240.544   E0.0861
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X186.463 Y240.544 E-.00001
G1 X186.463 Y240.544 E-.00001
G1 X187.137 Y239.804 E-.37998
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F60000
; OBJECT_ID: 199
; COOLING_NODE: 0
M204 S10000
G1 X216 Y158.602
G1 Z1.4
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X217.398 Y158.602 E.04637
G1 X217.398 Y161.398 E.09274
G1 X214.602 Y161.398 E.09274
G1 X214.602 Y158.602 E.09274
G1 X215.94 Y158.602 E.04438
; COOLING_NODE: 0
M204 S250
G1 X216 Y158.21 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X217.79 Y158.21 E.055
G1 X217.79 Y161.79 E.11
G1 X214.21 Y161.79 E.11
G1 X214.21 Y158.21 E.11
G1 X215.94 Y158.21 E.05316
; WIPE_START
M204 S8000
G1 X216.94 Y158.21 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I-1.054 J-.608 P1  F60000
G1 X215.78 Y160.22 Z1.8
G1 Z1.4
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48318
G1 F15000
M204 S8000
G1 X216.22 Y160.22 E.0158
G1 X216.22 Y159.78 E.0158
G1 X215.78 Y159.78 E.0158
G1 X215.78 Y160.16 E.01364
M204 S10000
G1 X215.371 Y160.629 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X216.629 Y160.629 E.03864
G1 X216.629 Y159.371 E.03864
G1 X215.371 Y159.371 E.03864
G1 X215.371 Y160.569 E.0368
M204 S10000
G1 X214.994 Y161.006 F60000
G1 F15000
M204 S8000
G1 X217.006 Y161.006 E.06181
G1 X217.006 Y158.994 E.06181
G1 X214.994 Y158.994 E.06181
G1 X214.994 Y160.946 E.05997
; WIPE_START
G1 X214.994 Y159.946 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z1.8 I1.217 J0 P1  F60000
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X286 Y160 Z1.8 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U286 V160 Z1.8 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 8/10
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change

; OBJECT_ID: 199
; COOLING_NODE: 0
G1 X216 Y158.602 F60000
G1 Z1.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X217.398 Y158.602 E.04637
G1 X217.398 Y161.398 E.09274
G1 X214.602 Y161.398 E.09274
G1 X214.602 Y158.602 E.09274
G1 X215.94 Y158.602 E.04438
; COOLING_NODE: 0
M204 S250
G1 X216 Y158.21 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X217.79 Y158.21 E.055
G1 X217.79 Y161.79 E.11
G1 X214.21 Y161.79 E.11
G1 X214.21 Y158.21 E.11
G1 X215.94 Y158.21 E.05316
; WIPE_START
M204 S8000
G1 X216.94 Y158.21 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I-1.054 J-.608 P1  F60000
G1 X215.78 Y160.22 Z2
G1 Z1.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48318
G1 F15000
M204 S8000
G1 X216.22 Y160.22 E.0158
G1 X216.22 Y159.78 E.0158
G1 X215.78 Y159.78 E.0158
G1 X215.78 Y160.16 E.01364
M204 S10000
G1 X215.371 Y160.629 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X216.629 Y160.629 E.03864
G1 X216.629 Y159.371 E.03864
G1 X215.371 Y159.371 E.03864
G1 X215.371 Y160.569 E.0368
M204 S10000
G1 X214.994 Y161.006 F60000
G1 F15000
M204 S8000
G1 X217.006 Y161.006 E.06181
G1 X217.006 Y158.994 E.06181
G1 X214.994 Y158.994 E.06181
G1 X214.994 Y160.946 E.05997
; WIPE_START
G1 X214.994 Y159.946 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F60000
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X286 Y160 Z2 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U286 V160 Z2 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

M204 S10000
G1 X185.963 Y239.544
G1 Z1.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X186.463 Y240.544  
M204 S8000
G3  X184.043 Y242.635   I-4.428 J-2.678 E0.1236 F5400
G3  X181.399 Y241.420   I-0.104 J-3.256 E0.1146
G2  X178.521 Y240.544   I-2.903 J4.371 E0.1160
G2  X173.401 Y240.768   I-1.808 J17.316 E0.1955
G2  X170.466 Y242.558   I5.648 J12.556 E0.1310
G3  X168.309 Y242.023   I-0.676 J-1.891 E0.0895
G1  X167.122 Y240.718   E0.0670
G1 E-0.4000 F1800
M204 S10000
G1  X165.438 Y238.868   F600
G1 E0.4000 F1800
M204 S8000
G3  X166.125 Y235.824   I1.763 J-1.201 E0.1330 F5400
G2  X166.963 Y233.401   I-3.144 J-2.444 E0.0992
M73 P87 R2
G2  X166.798 Y228.810   I-15.731 J-1.732 E0.1752
G2  X165.098 Y226.250   I-11.313 J5.667 E0.1171
G3  X165.438 Y224.470   I1.658 J-0.606 E0.0723
G3  X168.538 Y221.100   I20.025 J15.314 E0.1743
G3  X171.870 Y221.809   I1.296 J2.093 E0.1430
G2  X176.713 Y222.794   I3.707 J-5.829 E0.1921
G1  X177.963  E0.0475
G2  X182.814 Y220.839   I0.127 J-6.681 E0.2043
G3  X185.117 Y221.315   I0.817 J1.855 E0.0953
G1  X186.463 Y222.794   E0.0760
G3  X188.379 Y225.179   I-4.010 J5.182 E0.1173
G3  X187.203 Y227.644   I-2.797 J0.179 E0.1084
G2  X186.463 Y229.936   I3.199 J2.298 E0.0930
G2  X186.628 Y234.528   I15.729 J1.733 E0.1753
G2  X188.328 Y237.088   I11.313 J-5.667 E0.1171
G3  X187.988 Y238.868   I-1.658 J0.606 E0.0723
G1  X186.463 Y240.544   E0.0861
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #8
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z2 I1.217 J0 P1  F60000
G1 X167.713 Y223.544
G1 Z1.6
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1 ON1 NN0
M204 S8000
M73 P87 R1
G1  X185.713 Y223.544  E1.4325 F7836
G1  Y224.794  E0.0995
G1  X167.713  E1.4325
G1  Y226.044  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1 ON1 NN0
M400
M104 T0 S154 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y226.044 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.6 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T220 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E2

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

G1 Y320 F30000
G1 X191.44

G1 Y295
G1 Y265 F18000
G1 Z4.6 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S193.8
M106 P2 S0
G1 X168.498 Y244.676 F15000
M204 S5000
G1 Z1.6
G17
M73 P88 R1
G3 Z2 I0 J-1.217 P1
G1 X162.987 Y244.676 Z2
G1 X162.987 Y239.794

; filament start gcode
G1 X167.463 Y239.794
G1 Z1.6
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
; LINE_WIDTH: 0.500000
M204 S5000
G1  X170.463 Y239.794  E0.1140 F1782
G1 E-0.4000 F1800
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y240.294 
G1  X166.963 
G1  Y239.294 
G1  X168.463 
G1  Y240.794 
G1  X166.463 
G1  Y238.794 
G1  X170.463 Y239.794   F1782
G1 E0.4000 F1800
M400
M104 T1 S220 N0
G1  X185.963  E0.5891 F1782
G1  Y239.044  E0.0285
G1  X167.463  E0.7031 F2025
G1  Y238.294  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y237.544  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y236.794  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y236.044  E0.0285
G1  X167.463  E0.7031
G1  Y235.294  E0.0285
G1  X185.963  E0.7031
G1  Y234.544  E0.0285
G1  X167.463  E0.7031
G1  Y233.794  E0.0285
G1  X185.963  E0.7031
G1  Y233.044  E0.0285
G1  X167.463  E0.7031
G1  Y232.294  E0.0285
G1  X185.963  E0.7031
G1  Y231.544  E0.0285
G1  X167.463  E0.7031
G1  Y230.794  E0.0285
G1  X185.963  E0.7031
G1  Y230.044  E0.0285
G1  X167.463  E0.7031
G1  Y229.294  E0.0285
G1  X185.963  E0.7031
G1  Y228.544  E0.0285
G1  X167.463  E0.7031
G1  Y227.794  E0.0285
G1  X185.963  E0.7031
G1  Y227.044  E0.0285
G1  X167.463  E0.7031
; WIPE_TOWER_END
M220 R
G1 F15000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
G1 X168.463 Y227.044 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2 I1.217 J0 P1  F15000
; OBJECT_ID: 199
; COOLING_NODE: 1
M204 S5000
G1 X216 Y162.602
G1 Z1.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9000
G1 X217.398 Y162.602 E.04637
G1 X217.398 Y186.398 E.78935
G1 X193.689 Y186.398 E.78646
G1 X193.689 Y185.602 E.0264
G1 X214.602 Y185.602 E.69371
G1 X214.602 Y162.602 E.76295
M73 P89 R1
G1 X215.94 Y162.602 E.04438
; COOLING_NODE: 1
M204 S250
G1 X216 Y162.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X217.79 Y162.21 E.055
G1 X217.79 Y186.79 E.75528
G1 X175.896 Y186.79 E1.28729
G1 X175.896 Y185.21 E.04855
G1 X214.21 Y185.21 E1.17728
G1 X214.21 Y162.21 E.70673
G1 X215.94 Y162.21 E.05316
; COOLING_NODE: 1
; WIPE_START
M204 S5000
G1 X216.94 Y162.21 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2 I1.194 J-.233 P1  F15000
G1 X216 Y157.398 Z2
G1 Z1.6
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X214.602 Y157.398 E.04637
G1 X214.602 Y134.398 E.76295
G1 X193.689 Y134.398 E.69371
G1 X193.689 Y133.602 E.0264
G1 X217.398 Y133.602 E.78646
G1 X217.398 Y157.398 E.78935
G1 X216.06 Y157.398 E.04438
; COOLING_NODE: 1
M204 S250
G1 X216 Y157.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X214.21 Y157.79 E.055
G1 X214.21 Y134.79 E.70673
G1 X175.896 Y134.79 E1.17728
G1 X175.896 Y133.21 E.04855
G1 X217.79 Y133.21 E1.28729
G1 X217.79 Y157.79 E.75528
G1 X216.06 Y157.79 E.05316
; WIPE_START
M204 S5000
G1 X215.06 Y157.79 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2 I1.106 J.507 P1  F15000
G1 X215.78 Y156.22 Z2
G1 Z1.6
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F6000
G1 X216.22 Y156.22 E.0158
G1 X216.22 Y134.78 E.76919
G1 X215.893 Y134.78 E.01174
G1 X215.817 Y134.963 E.00712
G1 X215.78 Y134.983 E.00152
G1 X215.78 Y156.16 E.75974
G1 X215.371 Y156.629 F15000
; LINE_WIDTH: 0.41999
G1 F6000
G1 X216.629 Y156.629 E.03864
G1 X216.629 Y134.371 E.6839
G1 X215.575 Y134.371 E.03239
G1 X215.478 Y134.735 E.01157
G1 X215.371 Y134.792 E.00373
G1 X215.371 Y156.569 E.66912
G1 X214.994 Y157.006 F15000
G1 F6000
G1 X217.006 Y157.006 E.06181
G1 X217.006 Y133.994 E.70707
G1 X215.198 Y133.994 E.05556
G1 X215.175 Y134.508 E.01582
G1 X214.994 Y134.623 E.00659
G1 X214.994 Y156.946 E.6859
; WIPE_START
G1 X214.994 Y155.946 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2 I-1.211 J.121 P1  F15000
G1 X215.78 Y163.78 Z2
G1 Z1.6
G1 E.4 F1800
; LINE_WIDTH: 0.483185
G1 F6000
G1 X215.78 Y185.017 E.76189
G3 X215.893 Y185.22 I-.151 J.217 E.00865
G1 X216.22 Y185.22 E.01174
G1 X216.22 Y163.78 E.76919
G1 X215.84 Y163.78 E.01364
G1 X215.371 Y163.371 F15000
; LINE_WIDTH: 0.41999
G1 F6000
G1 X215.371 Y185.208 E.67096
G1 X215.508 Y185.314 E.00532
G1 X215.575 Y185.629 E.00989
G1 X216.629 Y185.629 E.03239
G1 X216.629 Y163.371 E.6839
G1 X215.431 Y163.371 E.0368
G1 X214.994 Y162.994 F15000
G1 F6000
G1 X214.994 Y185.392 E.68821
G1 X215.175 Y185.492 E.00635
G1 X215.198 Y186.006 E.01582
G1 X217.006 Y186.006 E.05556
G1 X217.006 Y162.994 E.70707
G1 X215.054 Y162.994 E.05997
G1 X214.806 Y186 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X193.893 Y186 E.66256
; WIPE_START
G1 X194.893 Y186 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2 I-.349 J-1.166 P1  F15000
G1 X192.944 Y186.583 Z2
G1 Z1.6
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X193.467 Y186.06 E.0227
G1 X193.6 Y185.926
G1 X193.6 Y185.393
G1 X193.467 Y185.527
G1 X192.411 Y186.583 E.04588
G1 X192.277 Y186.716
G1 X191.744 Y186.716
G1 X191.878 Y186.583
G1 X193.043 Y185.417 E.05063
G1 X193.177 Y185.284
G1 X192.643 Y185.284
G1 X192.51 Y185.417
G1 X191.345 Y186.583 E.05063
G1 X191.211 Y186.716
G1 X190.678 Y186.716
M73 P90 R1
G1 X190.811 Y186.583
G1 X191.977 Y185.417 E.05063
G1 X192.11 Y185.284
G1 X191.577 Y185.284
G1 X191.443 Y185.417
G1 X190.278 Y186.583 E.05063
G1 X190.144 Y186.716
G1 X189.611 Y186.716
G1 X189.745 Y186.583
G1 X190.91 Y185.417 E.05063
G1 X191.044 Y185.284
G1 X190.51 Y185.284
G1 X190.377 Y185.417
G1 X189.212 Y186.583 E.05063
G1 X189.078 Y186.716
G1 X188.545 Y186.716
G1 X188.678 Y186.583
G1 X189.843 Y185.417 E.05063
G1 X189.977 Y185.284
G1 X189.444 Y185.284
G1 X189.31 Y185.417
G1 X188.145 Y186.583 E.05063
G1 X188.011 Y186.716
G1 X187.478 Y186.716
G1 X187.612 Y186.583
G1 X188.777 Y185.417 E.05063
G1 X188.911 Y185.284
G1 X188.377 Y185.284
G1 X188.244 Y185.417
G1 X187.078 Y186.583 E.05063
G1 X186.945 Y186.716
G1 X186.412 Y186.716
G1 X186.545 Y186.583
G1 X187.71 Y185.417 E.05063
G1 X187.844 Y185.284
G1 X187.311 Y185.284
G1 X187.177 Y185.417
G1 X186.012 Y186.583 E.05063
G1 X185.878 Y186.716
G1 X185.345 Y186.716
G1 X185.479 Y186.583
G1 X186.644 Y185.417 E.05063
G1 X186.778 Y185.284
G1 X186.244 Y185.284
G1 X186.111 Y185.417
G1 X184.945 Y186.583 E.05063
G1 X184.812 Y186.716
G1 X184.279 Y186.716
G1 X184.412 Y186.583
G1 X185.577 Y185.417 E.05063
G1 X185.711 Y185.284
G1 X185.178 Y185.284
G1 X185.044 Y185.417
G1 X183.879 Y186.583 E.05063
G1 X183.745 Y186.716
G1 X183.212 Y186.716
G1 X183.346 Y186.583
G1 X184.511 Y185.417 E.05063
G1 X184.645 Y185.284
G1 X184.111 Y185.284
G1 X183.978 Y185.417
G1 X182.812 Y186.583 E.05063
G1 X182.679 Y186.716
G1 X182.146 Y186.716
G1 X182.279 Y186.583
G1 X183.444 Y185.417 E.05063
G1 X183.578 Y185.284
G1 X183.045 Y185.284
G1 X182.911 Y185.417
G1 X181.746 Y186.583 E.05063
G1 X181.612 Y186.716
G1 X181.079 Y186.716
G1 X181.213 Y186.583
G1 X182.378 Y185.417 E.05063
G1 X182.512 Y185.284
G1 X181.978 Y185.284
G1 X181.845 Y185.417
G1 X180.679 Y186.583 E.05063
G1 X180.546 Y186.716
G1 X180.012 Y186.716
G1 X180.146 Y186.583
G1 X181.311 Y185.417 E.05063
G1 X181.445 Y185.284
G1 X180.912 Y185.284
G1 X180.778 Y185.417
G1 X179.613 Y186.583 E.05063
G1 X179.479 Y186.716
G1 X178.946 Y186.716
G1 X179.08 Y186.583
G1 X180.245 Y185.417 E.05063
G1 X180.378 Y185.284
G1 X179.845 Y185.284
G1 X179.712 Y185.417
G1 X178.546 Y186.583 E.05063
G1 X178.413 Y186.716
G1 X177.879 Y186.716
G1 X178.013 Y186.583
G1 X179.178 Y185.417 E.05063
G1 X179.312 Y185.284
G1 X178.779 Y185.284
G1 X178.645 Y185.417
G1 X177.48 Y186.583 E.05063
G1 X177.346 Y186.716
G1 X176.813 Y186.716
G1 X176.947 Y186.583
G1 X178.112 Y185.417 E.05063
G1 X178.245 Y185.284
G1 X177.712 Y185.284
G1 X177.579 Y185.417
G1 X176.413 Y186.583 E.05063
G1 X176.28 Y186.716
G1 X175.97 Y186.493
G1 X176.103 Y186.359
G1 X177.045 Y185.417 E.04093
G1 X177.179 Y185.284
G1 X176.646 Y185.284
G1 X176.512 Y185.417
G1 X176.103 Y185.826 E.01776
; WIPE_START
M204 S5000
G1 X176.512 Y185.417 E-.21959
G1 X176.646 Y185.284 E-.07182
G1 X176.879 Y185.284 E-.08859
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2 I1.162 J.362 P1  F15000
G1 X192.685 Y134.583 Z2
G1 Z1.6
G1 E.4 F1800
G1 F6000
M204 S1000
G1 X193.467 Y133.801 E.03397
G1 X193.6 Y133.667
G1 X193.451 Y133.284
G1 X193.317 Y133.417
G1 X192.152 Y134.583 E.05064
G1 X192.018 Y134.716
G1 X191.485 Y134.716
G1 X191.619 Y134.583
G1 X192.784 Y133.417 E.05064
G1 X192.917 Y133.284
G1 X192.384 Y133.284
G1 X192.251 Y133.417
G1 X191.085 Y134.583 E.05063
G1 X190.952 Y134.716
G1 X190.418 Y134.716
G1 X190.552 Y134.583
G1 X191.717 Y133.417 E.05063
G1 X191.851 Y133.284
G1 X191.318 Y133.284
G1 X191.184 Y133.417
G1 X190.019 Y134.583 E.05064
G1 X189.885 Y134.716
G1 X189.352 Y134.716
G1 X189.486 Y134.583
G1 X190.651 Y133.417 E.05064
G1 X190.784 Y133.284
G1 X190.251 Y133.284
G1 X190.118 Y133.417
G1 X188.952 Y134.583 E.05063
G1 X188.819 Y134.716
G1 X188.285 Y134.716
G1 X188.419 Y134.583
G1 X189.584 Y133.417 E.05063
G1 X189.718 Y133.284
G1 X189.185 Y133.284
G1 X189.051 Y133.417
G1 X187.886 Y134.583 E.05064
G1 X187.752 Y134.716
G1 X187.219 Y134.716
G1 X187.353 Y134.583
G1 X188.518 Y133.417 E.05064
G1 X188.651 Y133.284
G1 X188.118 Y133.284
G1 X187.985 Y133.417
G1 X186.819 Y134.583 E.05063
G1 X186.686 Y134.716
G1 X186.152 Y134.716
G1 X186.286 Y134.583
G1 X187.451 Y133.417 E.05063
G1 X187.585 Y133.284
G1 X187.052 Y133.284
G1 X186.918 Y133.417
G1 X185.753 Y134.583 E.05064
G1 X185.619 Y134.716
G1 X185.086 Y134.716
G1 X185.219 Y134.583
G1 X186.385 Y133.417 E.05064
G1 X186.518 Y133.284
G1 X185.985 Y133.284
G1 X185.851 Y133.417
G1 X184.686 Y134.583 E.05063
G1 X184.553 Y134.716
G1 X184.019 Y134.716
G1 X184.153 Y134.583
G1 X185.318 Y133.417 E.05063
G1 X185.452 Y133.284
G1 X184.919 Y133.284
G1 X184.785 Y133.417
G1 X183.62 Y134.583 E.05063
G1 X183.486 Y134.716
G1 X182.953 Y134.716
G1 X183.086 Y134.583
G1 X184.252 Y133.417 E.05063
G1 X184.385 Y133.284
G1 X183.852 Y133.284
G1 X183.718 Y133.417
G1 X182.553 Y134.583 E.05063
G1 X182.42 Y134.716
G1 X181.886 Y134.716
G1 X182.02 Y134.583
G1 X183.185 Y133.417 E.05063
G1 X183.319 Y133.284
G1 X182.786 Y133.284
G1 X182.652 Y133.417
G1 X181.487 Y134.583 E.05063
G1 X181.353 Y134.716
G1 X180.82 Y134.716
G1 X180.953 Y134.583
G1 X182.119 Y133.417 E.05063
G1 X182.252 Y133.284
G1 X181.719 Y133.284
G1 X181.585 Y133.417
G1 X180.42 Y134.583 E.05063
G1 X180.287 Y134.716
G1 X179.753 Y134.716
G1 X179.887 Y134.583
G1 X181.052 Y133.417 E.05063
G1 X181.186 Y133.284
G1 X180.653 Y133.284
G1 X180.519 Y133.417
G1 X179.354 Y134.583 E.05063
G1 X179.22 Y134.716
G1 X178.687 Y134.716
G1 X178.82 Y134.583
G1 X179.986 Y133.417 E.05063
G1 X180.119 Y133.284
G1 X179.586 Y133.284
G1 X179.452 Y133.417
G1 X178.287 Y134.583 E.05063
G1 X178.154 Y134.716
G1 X177.62 Y134.716
G1 X177.754 Y134.583
G1 X178.919 Y133.417 E.05063
G1 X179.053 Y133.284
G1 X178.52 Y133.284
G1 X178.386 Y133.417
G1 X177.221 Y134.583 E.05063
G1 X177.087 Y134.716
G1 X176.554 Y134.716
G1 X176.687 Y134.583
G1 X177.853 Y133.417 E.05063
G1 X177.986 Y133.284
G1 X177.453 Y133.284
G1 X177.319 Y133.417
G1 X176.154 Y134.583 E.05063
G1 X176.02 Y134.716
G1 X175.97 Y134.234
G1 X176.103 Y134.1
G1 X176.786 Y133.417 E.02967
; WIPE_START
M204 S5000
G1 X176.103 Y134.1 E-.36687
G1 X176.079 Y134.124 E-.01313
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2 I.009 J1.217 P1  F15000
G1 X193.893 Y134 Z2
G1 Z1.6
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X214.806 Y134 E.66256
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X213.806 Y134 E-.38
; WIPE_END
G1 E-.02 F1800
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 9/10
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change

; OBJECT_ID: 199
; COOLING_NODE: 1
G17
G3 Z2 I-1.213 J.093 P1  F15000
G1 X216 Y162.602 Z2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9000
G1 X217.398 Y162.602 E.04637
G1 X217.398 Y186.398 E.78935
G1 X210.615 Y186.398 E.22501
G1 X210.615 Y185.602 E.0264
G1 X214.602 Y185.602 E.13226
G1 X214.602 Y162.602 E.76295
G1 X215.94 Y162.602 E.04438
; COOLING_NODE: 1
M204 S250
G1 X216 Y162.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X217.79 Y162.21 E.055
M632 S0 W
M400
M104 T0 S210 N0 ;Multi extruder pre heating
M633
G1 X217.79 Y186.79 E.75528
G1 X192.822 Y186.79 E.76721
G1 X192.822 Y185.21 E.04855
G1 X214.21 Y185.21 E.65721
G1 X214.21 Y162.21 E.70673
G1 X215.94 Y162.21 E.05316
; COOLING_NODE: 1
; WIPE_START
M204 S5000
G1 X216.94 Y162.21 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.2 I1.194 J-.233 P1  F15000
G1 X216 Y157.398 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X214.602 Y157.398 E.04637
G1 X214.602 Y134.398 E.76295
G1 X210.615 Y134.398 E.13226
G1 X210.615 Y133.602 E.0264
G1 X217.398 Y133.602 E.22501
G1 X217.398 Y157.398 E.78935
G1 X216.06 Y157.398 E.04438
; COOLING_NODE: 1
M204 S250
M73 P91 R1
G1 X216 Y157.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X214.21 Y157.79 E.055
G1 X214.21 Y134.79 E.70673
G1 X192.822 Y134.79 E.65721
G1 X192.822 Y133.21 E.04855
G1 X217.79 Y133.21 E.76721
G1 X217.79 Y157.79 E.75528
G1 X216.06 Y157.79 E.05316
; WIPE_START
M204 S5000
G1 X215.06 Y157.79 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.2 I1.106 J.507 P1  F15000
G1 X215.78 Y156.22 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F6000
G1 X216.22 Y156.22 E.0158
G1 X216.22 Y134.78 E.76919
G1 X215.893 Y134.78 E.01174
G1 X215.817 Y134.963 E.00712
G1 X215.78 Y134.983 E.00152
G1 X215.78 Y156.16 E.75974
G1 X215.371 Y156.629 F15000
; LINE_WIDTH: 0.41999
G1 F6000
G1 X216.629 Y156.629 E.03864
G1 X216.629 Y134.371 E.6839
G1 X215.575 Y134.371 E.03239
G1 X215.478 Y134.735 E.01157
G1 X215.371 Y134.792 E.00373
G1 X215.371 Y156.569 E.66912
G1 X214.994 Y157.006 F15000
G1 F6000
G1 X217.006 Y157.006 E.06181
G1 X217.006 Y133.994 E.70707
G1 X215.198 Y133.994 E.05556
G1 X215.175 Y134.508 E.01582
G1 X214.994 Y134.623 E.00659
G1 X214.994 Y156.946 E.6859
; WIPE_START
G1 X214.994 Y155.946 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.2 I-1.211 J.121 P1  F15000
G1 X215.78 Y163.78 Z2.2
G1 Z1.8
G1 E.4 F1800
; LINE_WIDTH: 0.483185
G1 F6000
G1 X215.78 Y185.017 E.76189
G3 X215.893 Y185.22 I-.151 J.217 E.00865
G1 X216.22 Y185.22 E.01174
G1 X216.22 Y163.78 E.76919
G1 X215.84 Y163.78 E.01364
G1 X215.371 Y163.371 F15000
; LINE_WIDTH: 0.41999
G1 F6000
G1 X215.371 Y185.208 E.67096
G1 X215.508 Y185.314 E.00532
G1 X215.575 Y185.629 E.00989
G1 X216.629 Y185.629 E.03239
G1 X216.629 Y163.371 E.6839
G1 X215.431 Y163.371 E.0368
G1 X214.994 Y162.994 F15000
G1 F6000
G1 X214.994 Y185.392 E.68821
G1 X215.175 Y185.492 E.00635
G1 X215.198 Y186.006 E.01582
G1 X217.006 Y186.006 E.05556
G1 X217.006 Y162.994 E.70707
G1 X215.054 Y162.994 E.05997
G1 X214.806 Y186 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X210.818 Y186 E.12632
; WIPE_START
G1 X211.818 Y186 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.2 I.33 J-1.171 P1  F15000
G1 X209.749 Y185.417 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X210.392 Y186.06 E.02794
G1 X210.526 Y186.194
G1 X210.515 Y186.716
G1 X210.381 Y186.583
G1 X209.216 Y185.417 E.05063
G1 X209.082 Y185.284
G1 X208.549 Y185.284
G1 X208.683 Y185.417
G1 X209.848 Y186.583 E.05063
G1 X209.982 Y186.716
G1 X209.448 Y186.716
G1 X209.315 Y186.583
G1 X208.15 Y185.417 E.05063
G1 X208.016 Y185.284
G1 X207.483 Y185.284
G1 X207.616 Y185.417
G1 X208.782 Y186.583 E.05063
G1 X208.915 Y186.716
G1 X208.382 Y186.716
G1 X208.248 Y186.583
G1 X207.083 Y185.417 E.05063
G1 X206.949 Y185.284
G1 X206.416 Y185.284
G1 X206.55 Y185.417
G1 X207.715 Y186.583 E.05063
G1 X207.849 Y186.716
G1 X207.315 Y186.716
G1 X207.182 Y186.583
G1 X206.017 Y185.417 E.05063
G1 X205.883 Y185.284
G1 X205.35 Y185.284
G1 X205.483 Y185.417
G1 X206.649 Y186.583 E.05063
G1 X206.782 Y186.716
G1 X206.249 Y186.716
G1 X206.115 Y186.583
G1 X204.95 Y185.417 E.05063
G1 X204.816 Y185.284
G1 X204.283 Y185.284
G1 X204.417 Y185.417
G1 X205.582 Y186.583 E.05063
G1 X205.716 Y186.716
G1 X205.182 Y186.716
G1 X205.049 Y186.583
G1 X203.884 Y185.417 E.05063
G1 X203.75 Y185.284
G1 X203.217 Y185.284
G1 X203.35 Y185.417
G1 X204.515 Y186.583 E.05063
G1 X204.649 Y186.716
G1 X204.116 Y186.716
G1 X203.982 Y186.583
G1 X202.817 Y185.417 E.05063
G1 X202.683 Y185.284
G1 X202.15 Y185.284
G1 X202.284 Y185.417
G1 X203.449 Y186.583 E.05063
G1 X203.583 Y186.716
G1 X203.049 Y186.716
G1 X202.916 Y186.583
G1 X201.75 Y185.417 E.05063
G1 X201.617 Y185.284
G1 X201.084 Y185.284
G1 X201.217 Y185.417
G1 X202.382 Y186.583 E.05063
G1 X202.516 Y186.716
G1 X201.983 Y186.716
G1 X201.849 Y186.583
G1 X200.684 Y185.417 E.05063
G1 X200.55 Y185.284
G1 X200.017 Y185.284
G1 X200.151 Y185.417
G1 X201.316 Y186.583 E.05063
G1 X201.45 Y186.716
G1 X200.916 Y186.716
G1 X200.783 Y186.583
G1 X199.617 Y185.417 E.05063
G1 X199.484 Y185.284
G1 X198.951 Y185.284
G1 X199.084 Y185.417
G1 X200.249 Y186.583 E.05063
G1 X200.383 Y186.716
G1 X199.85 Y186.716
G1 X199.716 Y186.583
G1 X198.551 Y185.417 E.05063
G1 X198.417 Y185.284
G1 X197.884 Y185.284
G1 X198.018 Y185.417
G1 X199.183 Y186.583 E.05063
G1 X199.317 Y186.716
G1 X198.783 Y186.716
G1 X198.65 Y186.583
G1 X197.484 Y185.417 E.05063
G1 X197.351 Y185.284
G1 X196.818 Y185.284
G1 X196.951 Y185.417
G1 X198.116 Y186.583 E.05063
G1 X198.25 Y186.716
G1 X197.717 Y186.716
G1 X197.583 Y186.583
G1 X196.418 Y185.417 E.05063
G1 X196.284 Y185.284
G1 X195.751 Y185.284
G1 X195.885 Y185.417
G1 X197.05 Y186.583 E.05063
G1 X197.184 Y186.716
G1 X196.65 Y186.716
G1 X196.517 Y186.583
G1 X195.351 Y185.417 E.05063
G1 X195.218 Y185.284
G1 X194.684 Y185.284
G1 X194.818 Y185.417
G1 X195.983 Y186.583 E.05063
G1 X196.117 Y186.716
G1 X195.584 Y186.716
G1 X195.45 Y186.583
G1 X194.285 Y185.417 E.05063
G1 X194.151 Y185.284
G1 X193.618 Y185.284
G1 X193.752 Y185.417
G1 X194.917 Y186.583 E.05063
G1 X195.05 Y186.716
G1 X194.517 Y186.716
G1 X194.384 Y186.583
G1 X193.218 Y185.417 E.05063
G1 X193.085 Y185.284
G1 X192.895 Y185.628
G1 X193.029 Y185.761
G1 X193.85 Y186.583 E.03569
; WIPE_START
M204 S5000
G1 X193.143 Y185.876 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.2 I1.152 J.392 P1  F15000
G1 X210.818 Y134 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X214.806 Y134 E.12632
; WIPE_START
G1 X213.806 Y134 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.2 I.071 J-1.215 P1  F15000
G1 X210.392 Y133.801 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M73 P92 R1
G1 F6000
M204 S1000
G1 X210.009 Y133.417 E.01668
G1 X209.875 Y133.284
G1 X209.342 Y133.284
G1 X209.475 Y133.417
G1 X210.392 Y134.334 E.03985
G1 X210.526 Y134.468
G1 X210.241 Y134.716
G1 X210.107 Y134.583
G1 X208.942 Y133.417 E.05063
G1 X208.808 Y133.284
G1 X208.275 Y133.284
G1 X208.409 Y133.417
G1 X209.574 Y134.583 E.05063
G1 X209.708 Y134.716
G1 X209.174 Y134.716
G1 X209.041 Y134.583
G1 X207.876 Y133.417 E.05063
G1 X207.742 Y133.284
G1 X207.209 Y133.284
G1 X207.342 Y133.417
G1 X208.508 Y134.583 E.05063
G1 X208.641 Y134.716
G1 X208.108 Y134.716
G1 X207.974 Y134.583
G1 X206.809 Y133.417 E.05063
G1 X206.675 Y133.284
G1 X206.142 Y133.284
G1 X206.276 Y133.417
G1 X207.441 Y134.583 E.05063
G1 X207.575 Y134.716
G1 X207.041 Y134.716
G1 X206.908 Y134.583
G1 X205.743 Y133.417 E.05063
G1 X205.609 Y133.284
G1 X205.076 Y133.284
G1 X205.209 Y133.417
G1 X206.374 Y134.583 E.05063
G1 X206.508 Y134.716
G1 X205.975 Y134.716
G1 X205.841 Y134.583
G1 X204.676 Y133.417 E.05063
G1 X204.542 Y133.284
G1 X204.009 Y133.284
G1 X204.143 Y133.417
G1 X205.308 Y134.583 E.05063
G1 X205.442 Y134.716
G1 X204.908 Y134.716
G1 X204.775 Y134.583
G1 X203.609 Y133.417 E.05063
G1 X203.476 Y133.284
G1 X202.943 Y133.284
G1 X203.076 Y133.417
G1 X204.241 Y134.583 E.05063
G1 X204.375 Y134.716
G1 X203.842 Y134.716
G1 X203.708 Y134.583
G1 X202.543 Y133.417 E.05063
G1 X202.409 Y133.284
G1 X201.876 Y133.284
G1 X202.01 Y133.417
G1 X203.175 Y134.583 E.05063
G1 X203.309 Y134.716
G1 X202.775 Y134.716
G1 X202.642 Y134.583
G1 X201.476 Y133.417 E.05063
G1 X201.343 Y133.284
G1 X200.81 Y133.284
G1 X200.943 Y133.417
G1 X202.108 Y134.583 E.05063
G1 X202.242 Y134.716
G1 X201.709 Y134.716
G1 X201.575 Y134.583
G1 X200.41 Y133.417 E.05063
G1 X200.276 Y133.284
G1 X199.743 Y133.284
G1 X199.877 Y133.417
G1 X201.042 Y134.583 E.05063
G1 X201.176 Y134.716
G1 X200.642 Y134.716
G1 X200.509 Y134.583
G1 X199.343 Y133.417 E.05063
G1 X199.21 Y133.284
G1 X198.677 Y133.284
G1 X198.81 Y133.417
G1 X199.975 Y134.583 E.05063
G1 X200.109 Y134.716
G1 X199.576 Y134.716
G1 X199.442 Y134.583
G1 X198.277 Y133.417 E.05063
G1 X198.143 Y133.284
G1 X197.61 Y133.284
G1 X197.744 Y133.417
G1 X198.909 Y134.583 E.05063
G1 X199.043 Y134.716
G1 X198.509 Y134.716
G1 X198.376 Y134.583
G1 X197.21 Y133.417 E.05063
G1 X197.077 Y133.284
G1 X196.543 Y133.284
G1 X196.677 Y133.417
G1 X197.842 Y134.583 E.05063
G1 X197.976 Y134.716
G1 X197.443 Y134.716
G1 X197.309 Y134.583
G1 X196.144 Y133.417 E.05063
G1 X196.01 Y133.284
G1 X195.477 Y133.284
G1 X195.611 Y133.417
G1 X196.776 Y134.583 E.05063
G1 X196.909 Y134.716
G1 X196.376 Y134.716
G1 X196.243 Y134.583
G1 X195.077 Y133.417 E.05063
G1 X194.944 Y133.284
G1 X194.41 Y133.284
G1 X194.544 Y133.417
G1 X195.709 Y134.583 E.05063
G1 X195.843 Y134.716
G1 X195.31 Y134.716
G1 X195.176 Y134.583
G1 X194.011 Y133.417 E.05063
G1 X193.877 Y133.284
G1 X193.344 Y133.284
G1 X193.478 Y133.417
G1 X194.643 Y134.583 E.05063
G1 X194.776 Y134.716
G1 X194.243 Y134.716
G1 X194.11 Y134.583
G1 X193.029 Y133.502 E.04696
G1 X192.895 Y133.368
G1 X192.895 Y133.902
G1 X193.029 Y134.035
G1 X193.576 Y134.583 E.02378
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #9
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
; WIPE_START
M204 S5000
G1 X193.029 Y134.035 E-.29411
G1 X192.895 Y133.902 E-.07182
G1 X192.895 Y133.865 E-.01407
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.2 I1.217 J0 P1  F15000
G1 X167.713 Y223.544
G1 Z1.8
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF1 NF0 ON0 NN1
M204 S5000
G1  X185.713 Y223.544  E1.4325 F7836
G1  Y224.794  E0.0995
G1  X167.713  E1.4325
G1  Y226.044  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF1 NF0 ON0 NN1
M400
M104 T1 S190 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
G1 X184.713 Y226.044 E-1.9
; WIPE_END
G1 E-.1 F1800
G17
G3 Z2.2 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S0A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z4.8 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T220 P220 S1



M620.10 A1 F498.898 L0 H0.4 T240 P220 S1



M620.11 P0 I1 E0



M620.11 K1 I1 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I1 R10 D8 E-10 F623.623


M629


M620.11 H0




T0
M73 E1

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P93 R1
G1 Y320 F30000
G1 X191.44

G1 Y295
G1 Y265 F18000
G1 Z4.8 F3000

M204 S5000


M621 S0A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I0 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S193.8
M106 P2 S0
G1 X176.204 Y244.676 F60000
M204 S10000
G1 Z1.8
G17
G3 Z2.2 I0 J-1.217 P1
G1 X162.987 Y244.676 Z2.2
G1 X162.987 Y227.044

; filament start gcode
G1 X167.463 Y227.044
G1 Z1.8
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
; LINE_WIDTH: 0.500000
M204 S8000
G1  X170.463 Y227.044  E0.1140 F1782
G1 E-0.4000 F1800
M204 S10000
G1  X165.963  F600
G1  X167.463  F240
G1  X167.963  F600
G1  Y227.544 
G1  X166.963 
G1  Y226.544 
G1  X168.463 
G1  Y228.044 
G1  X166.463 
G1  Y226.044 
G1  X170.463 Y227.044   F1782
G1 E0.4000 F1800
M400
M104 T0 S220 N0
M204 S8000
G1  X185.963  E0.5891 F1782
G1  Y227.794  E0.0285
M73 P93 R0
G1  X167.463  E0.7031 F2025
G1  Y228.544  E0.0285
G1  X185.963  E0.7031 F2473
G1  Y229.294  E0.0285
G1  X167.463  E0.7031 F4725
G1  Y230.044  E0.0285
G1  X185.963  E0.7031 F4775
G1  Y230.794  E0.0285
G1  X167.463  E0.7031
G1  Y231.544  E0.0285
G1  X185.963  E0.7031
G1  Y232.294  E0.0285
G1  X167.463  E0.7031
G1  Y233.044  E0.0285
G1  X185.963  E0.7031
G1  Y233.794  E0.0285
G1  X167.463  E0.7031
G1  Y234.544  E0.0285
G1  X185.963  E0.7031
G1  Y235.294  E0.0285
G1  X167.463  E0.7031
G1  Y236.044  E0.0285
G1  X185.963  E0.7031
G1  Y236.794  E0.0285
M73 P94 R0
G1  X167.463  E0.7031
G1  Y237.544  E0.0285
G1  X185.963  E0.7031
G1  Y238.294  E0.0285
G1  X167.463  E0.7031
G1  Y239.044  E0.0285
G1  X185.963  E0.7031
G1  Y239.794  E0.0285
G1  X167.463  E0.7031
M632 S1 W
M400
M104 T1 S210 N0 ;Multi extruder pre heating
M633
; WIPE_TOWER_END
M220 R
G1 F15000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


G1  Y239.544   F5400.000000
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.963 Y240.544  
M204 S8000
G3  X165.047 Y238.159   I4.010 J-5.182 E0.1174
G3  X166.223 Y235.694   I2.797 J-0.179 E0.1084
G2  X166.963 Y233.401   I-3.200 J-2.298 E0.0931
G2  X166.798 Y228.810   I-15.731 J-1.732 E0.1752
G2  X166.462 Y228.020   I-4.298 J1.359 E0.0327
G1 E-0.4000 F1800
M204 S10000
G1  X165.028 Y226.012   F600
G1 E0.4000 F1800
M204 S8000
G3  X165.438 Y224.470   I1.700 J-0.374 E0.0630 F5400
G3  X168.538 Y221.100   I20.025 J15.314 E0.1743
G3  X171.870 Y221.809   I1.296 J2.093 E0.1430
G2  X176.713 Y222.794   I3.707 J-5.829 E0.1921
G1  X177.963  E0.0475
G2  X182.814 Y220.839   I0.127 J-6.681 E0.2043
G3  X185.117 Y221.315   I0.817 J1.855 E0.0953
G1  X186.463 Y222.794   E0.0760
G3  X188.379 Y225.179   I-4.010 J5.182 E0.1173
G3  X187.203 Y227.644   I-2.797 J0.179 E0.1084
G2  X186.463 Y229.936   I3.199 J2.298 E0.0930
G2  X186.628 Y234.528   I15.729 J1.733 E0.1753
G2  X188.328 Y237.088   I11.313 J-5.667 E0.1171
G3  X187.988 Y238.868   I-1.658 J0.606 E0.0723
G1  X186.463 Y240.544   E0.0861
G3  X184.043 Y242.635   I-4.428 J-2.678 E0.1236
G3  X181.399 Y241.420   I-0.104 J-3.256 E0.1146
G2  X178.521 Y240.544   I-2.903 J4.371 E0.1160
G2  X173.401 Y240.768   I-1.808 J17.316 E0.1955
G2  X170.466 Y242.558   I5.648 J12.556 E0.1310
G3  X168.309 Y242.023   I-0.676 J-1.891 E0.0895
G1  X166.963 Y240.544   E0.0760
; WIPE_TOWER_END

; WIPE_START
M204 S8000
G1 X166.963 Y240.544 E-.00001
G1 X166.963 Y240.544 E-.00001
G1 X167.637 Y241.283 E-.37999
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F60000
; OBJECT_ID: 199
; COOLING_NODE: 0
M204 S10000
G1 X216 Y158.602
G1 Z1.8
G1 E.4 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F18000
M204 S8000
G1 X217.398 Y158.602 E.04637
G1 X217.398 Y161.398 E.09274
G1 X214.602 Y161.398 E.09274
G1 X214.602 Y158.602 E.09274
G1 X215.94 Y158.602 E.04438
; COOLING_NODE: 0
M204 S250
G1 X216 Y158.21 F60000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M204 S5000
G1 X217.79 Y158.21 E.055
G1 X217.79 Y161.79 E.11
G1 X214.21 Y161.79 E.11
G1 X214.21 Y158.21 E.11
G1 X215.94 Y158.21 E.05316
; WIPE_START
M204 S8000
G1 X216.94 Y158.21 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I-1.054 J-.608 P1  F60000
G1 X215.78 Y160.22 Z2.2
G1 Z1.8
G1 E.4 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48318
G1 F15000
M204 S8000
G1 X216.22 Y160.22 E.0158
G1 X216.22 Y159.78 E.0158
G1 X215.78 Y159.78 E.0158
G1 X215.78 Y160.16 E.01364
M204 S10000
G1 X215.371 Y160.629 F60000
; LINE_WIDTH: 0.41999
G1 F15000
M204 S8000
G1 X216.629 Y160.629 E.03864
G1 X216.629 Y159.371 E.03864
G1 X215.371 Y159.371 E.03864
G1 X215.371 Y160.569 E.0368
M204 S10000
G1 X214.994 Y161.006 F60000
G1 F15000
M204 S8000
G1 X217.006 Y161.006 E.06181
G1 X217.006 Y158.994 E.06181
G1 X214.994 Y158.994 E.06181
G1 X214.994 Y160.946 E.05997
; WIPE_START
G1 X214.994 Y159.946 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.2 I1.217 J0 P1  F60000
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X286 Y160 Z2.2 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U286 V160 Z2.2 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
;======== H2D 20250710 layer_change ========
; layer num/total_layer_count: 10/10
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change

M106 S196.35
; OBJECT_ID: 199
; COOLING_NODE: 0
G1 X216 Y158.21 F60000
G1 Z2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F12000
M204 S5000
G1 X217.79 Y158.21 E.055
G1 X217.79 Y161.79 E.11
G1 X214.21 Y161.79 E.11
G1 X214.21 Y158.21 E.11
G1 X215.94 Y158.21 E.05316
; WIPE_START
M204 S8000
G1 X216.94 Y158.21 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I-1.217 J-.022 P1  F60000
G1 X216.878 Y161.583 Z2.4
G1 Z2
G1 E.4 F1800
; FEATURE: Top surface
G1 F12000
M204 S2000
G1 X217.583 Y160.878 E.03063
G1 X217.716 Y160.744
G1 X217.716 Y160.211
G1 X217.583 Y160.345
G1 X216.345 Y161.583 E.0538
G1 X216.211 Y161.716
G1 X215.678 Y161.716
G1 X215.811 Y161.583
G1 X217.583 Y159.811 E.07697
G1 X217.716 Y159.678
G1 X217.716 Y159.144
G1 X217.583 Y159.278
G1 X215.278 Y161.583 E.10015
G1 X215.144 Y161.716
G1 X214.611 Y161.716
G1 X214.745 Y161.583
G1 X217.583 Y158.745 E.12332
G1 X217.716 Y158.611
G1 X217.51 Y158.284
G1 X217.377 Y158.417
G1 X214.417 Y161.377 E.1286
G1 X214.284 Y161.51
G1 X214.284 Y160.977
G1 X214.417 Y160.843
G1 X216.844 Y158.417 E.10543
G1 X216.977 Y158.284
G1 X216.444 Y158.284
G1 X216.31 Y158.417
G1 X214.417 Y160.31 E.08225
G1 X214.284 Y160.444
G1 X214.284 Y159.911
G1 X214.417 Y159.777
G1 X215.777 Y158.417 E.05908
G1 X215.911 Y158.284
G1 X215.377 Y158.284
G1 X215.244 Y158.417
G1 X214.417 Y159.244 E.03591
; WIPE_START
M204 S8000
G1 X215.124 Y158.537 E-.38
; WIPE_END
G1 E-.02 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F60000
;======== H2D 20251104========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on

M1002 judge_flag timelapse_record_flag

    M622 J1
    M993 A2 B2 C2
    M993 A0 B0 C0
    
    M622.1 S0 ; for prev firmware, default turn off
    M1002 set_flag smooth_safe_pos_suppoprt_flag=1
    M1002 judge_flag smooth_safe_pos_suppoprt_flag
    
    M622 J0
        

        
            M9711 M0 E0 X286 Y160 Z2.4 S11 C10 O0 T3000
        

        
    M623

    M622 J1
        

        
            M9711 M0 E0 U286 V160 Z2.4 S11 C10 O0 T3000
        

        
    M623

    M993 A3 B3 C3

M623
; SKIPPABLE_END

M204 S10000
G1 X167.463 Y239.544
G1 Z2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
; WIPE_TOWER_START
M204 S10000
G1  X166.963 Y240.544  
M204 S8000
G3  X165.047 Y238.159   I4.010 J-5.182 E0.1174 F5400
G3  X166.223 Y235.694   I2.797 J-0.179 E0.1084
G2  X166.963 Y233.401   I-3.200 J-2.298 E0.0931
G2  X166.798 Y228.810   I-15.731 J-1.732 E0.1752
G2  X165.098 Y226.250   I-11.313 J5.667 E0.1171
G3  X165.438 Y224.470   I1.658 J-0.606 E0.0723
G3  X168.538 Y221.100   I20.025 J15.314 E0.1743
G3  X171.870 Y221.809   I1.296 J2.093 E0.1430
G2  X176.713 Y222.794   I3.707 J-5.829 E0.1921
G1  X177.963  E0.0475
G2  X182.814 Y220.839   I0.127 J-6.681 E0.2043
G3  X185.117 Y221.315   I0.817 J1.855 E0.0953
G1  X186.463 Y222.794   E0.0760
G3  X188.379 Y225.179   I-4.010 J5.182 E0.1173
G3  X187.203 Y227.644   I-2.797 J0.179 E0.1084
G2  X186.463 Y229.936   I3.199 J2.298 E0.0930
G2  X186.628 Y234.528   I15.729 J1.733 E0.1753
G2  X188.328 Y237.088   I11.313 J-5.667 E0.1171
G3  X187.988 Y238.868   I-1.658 J0.606 E0.0723
G1 E-0.4000 F1800
M204 S10000
G1  X186.304 Y240.718   F600
G1 E0.4000 F1800
M204 S8000
G3  X183.574 Y242.676   I-3.488 J-1.982 E0.1317 F5400
G3  X181.239 Y241.317   I1.125 J-4.619 E0.1041
G2  X178.521 Y240.544   I-2.725 J4.418 E0.1088
G2  X173.401 Y240.768   I-1.808 J17.316 E0.1955
G2  X170.466 Y242.558   I5.648 J12.556 E0.1310
G3  X168.309 Y242.023   I-0.676 J-1.891 E0.0895
G1  X166.963 Y240.544   E0.0760
; WIPE_TOWER_END
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #10
; material : PLA -> PLA
;--------------------
M220 B
M220 S100
; WIPE_TOWER_START
G1 E-.4 F1800
G17
G3 Z2.4 I1.217 J0 P1  F60000
G1 X167.713 Y223.544
G1 Z2
G1 E.4 F1800
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 1.000000
; NOZZLE_CHANGE_START OF0 NF1 ON1 NN0
M204 S8000
G1  X185.713 Y223.544  E1.4325 F7836
G1  Y224.794  E0.0995
G1  X167.713  E1.4325
G1  Y226.044  E0.0995
G1  X185.713  E1.4325
; NOZZLE_CHANGE_END OF0 NF1 ON1 NN0
M400
M104 T0 S25 N0 ;Multi extruder pre cooling

; WIPE_START
G1 F5400
M204 S8000
G1 X184.713 Y226.044 E-1.9
; WIPE_END
G1 E-.1 F1800
M204 S10000
G17
G3 Z2.4 I1.217 J0 P1  F5400
; filament end gcode 

;======== H2D ========
;===== 20260116 =====
M993 A2 B2 C2 ; nozzle cam detection allow status save.
M993 A0 B0 C0 ; nozzle cam detection not allowed.


M1015.4 S1 K0 ;disable E air printing detect


M620 S1A
M1002 gcode_claim_action : 4
M204 S9000

G1 Z5 F1200

M400
M106 P1 S0
M106 P2 S0




M620.10 A0 F498.898 L0 H0.4 T240 P220 S1



M620.10 A1 F498.898 L0 H0.4 T220 P220 S1



M620.11 P0 I0 E0



M620.11 K1 I0 R10 F623.623


M620.15 C210

M628 S1


M620.11 S1 L0 I0 R10 D8 E-10 F623.623


M629


M620.11 H0




T1
M73 E0

;deretract


;VG1 E4 F623
;VG1 E4 F311



; VFLUSH_START


;VG1 E0 F623


SYNC T0

; VFLUSH_END

M1002 set_filament_type:PLA

M400
M83


M620.10 R2
M628 S0
;VM109 S220
M629
M400

;prime_tower_interface

;prime_tower_interface

M983.3 F10.4167 A0.4 R2

M400

M73 P95 R0
G1 Y320 F30000
G1 X191.44

G1 Y295
G1 Y265 F18000
G1 Z5 F3000

M204 S8000


M621 S1A

M993 A3 B3 C3 ; nozzle cam detection allow status restore.


M1015.3 S0;disable tpu clog detect



M1015.4 S1 K1 H0.4 ;enable E air printing detect


M620.6 I1 W1 ;enable ams air printing detect
M1002 gcode_claim_action : 0
M106 S196.35
M106 P2 S0
G1 X190.44 Y239.794 F15000
M204 S5000
G1 Z2

; filament start gcode
G17
G3 Z2.4 I0 J-1.217 P1
G1 X185.963 Y239.794 Z2.4
G1 Z2
G1 E2 F1800

G4 S0
; CP_TOOLCHANGE_WIPE CT0 FL0
; LINE_WIDTH: 0.500000
M204 S5000
G1  X182.963 Y239.794  E0.1140 F1782
G1 E-0.4000 F1800
G1  X187.463  F600
G1  X185.963  F240
G1  X186.463  F600
G1  Y240.294 
G1  X185.463 
G1  Y239.294 
G1  X186.963 
G1  Y240.794 
G1  X184.963 
G1  Y238.794 
G1  X182.963 Y239.794   F1782
G1 E0.4000 F1800
M400
M104 T1 S220 N0
G1  X167.463  E0.5891 F1782
G1  Y239.044  E0.0285
G1  X185.963  E0.7031 F2025
G1  Y238.294  E0.0285
G1  X167.463  E0.7031 F2473
M73 P96 R0
G1  Y237.544  E0.0285
G1  X185.963  E0.7031 F4725
G1  Y236.794  E0.0285
G1  X167.463  E0.7031 F4775
G1  Y236.044  E0.0285
G1  X185.963  E0.7031
G1  Y235.294  E0.0285
G1  X167.463  E0.7031
G1  Y234.544  E0.0285
G1  X185.963  E0.7031
G1  Y233.794  E0.0285
G1  X167.463  E0.7031
G1  Y233.044  E0.0285
G1  X185.963  E0.7031
G1  Y232.294  E0.0285
G1  X167.463  E0.7031
G1  Y231.544  E0.0285
G1  X185.963  E0.7031
G1  Y230.794  E0.0285
G1  X167.463  E0.7031
G1  Y230.044  E0.0285
G1  X185.963  E0.7031
G1  Y229.294  E0.0285
G1  X167.463  E0.7031
G1  Y228.544  E0.0285
G1  X185.963  E0.7031
G1  Y227.794  E0.0285
G1  X167.463  E0.7031
G1  Y227.044  E0.0285
G1  X185.963  E0.7031
; WIPE_TOWER_END
M220 R
G1 F15000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F5400
G1 X184.963 Y227.044 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.4 I1.217 J0 P1  F15000
; OBJECT_ID: 199
; COOLING_NODE: 1
M204 S5000
G1 X216 Y162.21
G1 Z2
G1 E.4 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.2
G1 F6000
M204 S2500
G1 X217.79 Y162.21 E.055
G1 X217.79 Y186.79 E.75528
G1 X209.747 Y186.79 E.24713
G1 X209.747 Y185.21 E.04855
G1 X214.21 Y185.21 E.13713
G1 X214.21 Y162.21 E.70673
G1 X215.94 Y162.21 E.05316
; COOLING_NODE: 1
; WIPE_START
M204 S5000
G1 X216.94 Y162.21 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.4 I1.19 J-.253 P1  F15000
G1 X216 Y157.79 Z2.4
G1 Z2
G1 E.4 F1800
G1 F6000
M204 S2500
G1 X214.21 Y157.79 E.055
G1 X214.21 Y134.79 E.70673
G1 X209.747 Y134.79 E.13713
G1 X209.747 Y133.21 E.04855
G1 X217.79 Y133.21 E.24713
G1 X217.79 Y157.79 E.75528
G1 X216.06 Y157.79 E.05316
; WIPE_START
M204 S5000
G1 X215.06 Y157.79 E-.38
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.4 I.301 J1.179 P1  F15000
G1 X217.583 Y157.145 Z2.4
G1 Z2
G1 E.4 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X217.145 Y157.583 E.01902
G1 X217.011 Y157.716
G1 X216.478 Y157.716
G1 X216.612 Y157.583
G1 X217.583 Y156.612 E.04219
G1 X217.716 Y156.478
G1 X217.716 Y155.945
G1 X217.583 Y156.078
G1 X216.079 Y157.583 E.06536
G1 X215.945 Y157.716
G1 X215.412 Y157.716
G1 X215.545 Y157.583
G1 X217.583 Y155.545 E.08853
G1 X217.716 Y155.412
G1 X217.716 Y154.878
G1 X217.583 Y155.012
G1 X215.012 Y157.583 E.11171
G1 X214.878 Y157.716
G1 X214.345 Y157.716
G1 X214.479 Y157.583
G1 X217.583 Y154.479 E.13488
G1 X217.716 Y154.345
G1 X217.716 Y153.812
G1 X217.583 Y153.945
G1 X214.417 Y157.111 E.13755
G1 X214.284 Y157.244
G1 X214.284 Y156.711
G1 X214.417 Y156.577
G1 X217.583 Y153.412 E.13754
G1 X217.716 Y153.279
G1 X217.716 Y152.745
G1 X217.583 Y152.879
G1 X214.417 Y156.044 E.13754
G1 X214.284 Y156.178
G1 X214.284 Y155.645
G1 X214.417 Y155.511
G1 X217.583 Y152.346 E.13755
G1 X217.716 Y152.212
G1 X217.716 Y151.679
G1 X217.583 Y151.812
G1 X214.417 Y154.978 E.13755
G1 X214.284 Y155.111
G1 X214.284 Y154.578
G1 X214.417 Y154.444
G1 X217.583 Y151.279 E.13754
G1 X217.716 Y151.146
G1 X217.716 Y150.612
G1 X217.583 Y150.746
G1 X214.417 Y153.911 E.13754
G1 X214.284 Y154.045
G1 X214.284 Y153.512
G1 X214.417 Y153.378
G1 X217.583 Y150.213 E.13755
G1 X217.716 Y150.079
G1 X217.716 Y149.546
G1 X217.583 Y149.679
M73 P97 R0
G1 X214.417 Y152.845 E.13755
G1 X214.284 Y152.978
G1 X214.284 Y152.445
G1 X214.417 Y152.311
G1 X217.583 Y149.146 E.13754
G1 X217.716 Y149.012
G1 X217.716 Y148.479
G1 X217.583 Y148.613
G1 X214.417 Y151.778 E.13754
G1 X214.284 Y151.912
G1 X214.284 Y151.379
G1 X214.417 Y151.245
G1 X217.583 Y148.08 E.13755
G1 X217.716 Y147.946
G1 X217.716 Y147.413
G1 X217.583 Y147.546
G1 X214.417 Y150.712 E.13755
G1 X214.284 Y150.845
G1 X214.284 Y150.312
G1 X214.417 Y150.178
G1 X217.583 Y147.013 E.13754
G1 X217.716 Y146.879
G1 X217.716 Y146.346
G1 X217.583 Y146.48
G1 X214.417 Y149.645 E.13754
G1 X214.284 Y149.779
G1 X214.284 Y149.245
G1 X214.417 Y149.112
G1 X217.583 Y145.947 E.13755
G1 X217.716 Y145.813
G1 X217.716 Y145.28
G1 X217.583 Y145.413
G1 X214.417 Y148.579 E.13754
G1 X214.284 Y148.712
G1 X214.284 Y148.179
G1 X214.417 Y148.045
G1 X217.583 Y144.88 E.13754
G1 X217.716 Y144.746
G1 X217.716 Y144.213
G1 X217.583 Y144.347
G1 X214.417 Y147.512 E.13754
G1 X214.284 Y147.646
G1 X214.284 Y147.112
G1 X214.417 Y146.979
G1 X217.583 Y143.814 E.13754
G1 X217.716 Y143.68
G1 X217.716 Y143.147
G1 X217.583 Y143.28
G1 X214.417 Y146.446 E.13754
G1 X214.284 Y146.579
G1 X214.284 Y146.046
G1 X214.417 Y145.912
G1 X217.583 Y142.747 E.13755
G1 X217.716 Y142.613
G1 X217.716 Y142.08
G1 X217.583 Y142.214
G1 X214.417 Y145.379 E.13754
G1 X214.284 Y145.513
G1 X214.284 Y144.979
G1 X214.417 Y144.846
G1 X217.583 Y141.681 E.13754
G1 X217.716 Y141.547
G1 X217.716 Y141.014
G1 X217.583 Y141.147
G1 X214.417 Y144.313 E.13754
G1 X214.284 Y144.446
G1 X214.284 Y143.913
G1 X214.417 Y143.779
G1 X217.583 Y140.614 E.13755
G1 X217.716 Y140.48
G1 X217.716 Y139.947
G1 X217.583 Y140.081
G1 X214.417 Y143.246 E.13754
G1 X214.284 Y143.38
G1 X214.284 Y142.846
G1 X214.417 Y142.713
G1 X217.583 Y139.548 E.13754
G1 X217.716 Y139.414
G1 X217.716 Y138.881
G1 X217.583 Y139.014
G1 X214.417 Y142.179 E.13754
G1 X214.284 Y142.313
G1 X214.284 Y141.78
G1 X214.417 Y141.646
G1 X217.583 Y138.481 E.13755
G1 X217.716 Y138.347
G1 X217.716 Y137.814
G1 X217.583 Y137.948
G1 X214.417 Y141.113 E.13754
G1 X214.284 Y141.247
G1 X214.284 Y140.713
G1 X214.417 Y140.58
G1 X217.583 Y137.414 E.13754
G1 X217.716 Y137.281
G1 X217.716 Y136.748
G1 X217.583 Y136.881
G1 X214.417 Y140.046 E.13754
G1 X214.284 Y140.18
G1 X214.284 Y139.647
G1 X214.417 Y139.513
G1 X217.583 Y136.348 E.13755
G1 X217.716 Y136.214
G1 X217.716 Y135.681
G1 X217.583 Y135.815
G1 X214.417 Y138.98 E.13754
G1 X214.284 Y139.114
G1 X214.284 Y138.58
G1 X214.417 Y138.447
G1 X217.583 Y135.281 E.13755
G1 X217.716 Y135.148
G1 X217.716 Y134.615
G1 X217.583 Y134.748
G1 X214.417 Y137.913 E.13755
G1 X214.284 Y138.047
G1 X214.284 Y137.514
G1 X214.417 Y137.38
G1 X217.583 Y134.215 E.13755
G1 X217.716 Y134.081
G1 X217.716 Y133.548
G1 X217.583 Y133.682
G1 X214.417 Y136.847 E.13755
G1 X214.284 Y136.981
G1 X214.284 Y136.447
G1 X214.417 Y136.314
G1 X217.314 Y133.417 E.12586
G1 X217.447 Y133.284
G1 X216.914 Y133.284
G1 X216.78 Y133.417
G1 X214.417 Y135.78 E.10269
G1 X214.284 Y135.914
G1 X214.284 Y135.381
G1 X214.417 Y135.247
G1 X216.247 Y133.417 E.07951
G1 X216.381 Y133.284
G1 X215.848 Y133.284
G1 X215.714 Y133.417
G1 X214.417 Y134.714 E.05634
G1 X214.284 Y134.848
G1 X213.882 Y134.716
G1 X214.015 Y134.583
G1 X215.181 Y133.417 E.05064
G1 X215.314 Y133.284
G1 X214.781 Y133.284
G1 X214.647 Y133.417
G1 X213.482 Y134.583 E.05064
G1 X213.348 Y134.716
G1 X212.815 Y134.716
G1 X212.949 Y134.583
G1 X214.114 Y133.417 E.05064
G1 X214.248 Y133.284
G1 X213.715 Y133.284
G1 X213.581 Y133.417
G1 X212.416 Y134.583 E.05064
G1 X212.282 Y134.716
G1 X211.749 Y134.716
G1 X211.882 Y134.583
G1 X213.048 Y133.417 E.05064
G1 X213.181 Y133.284
G1 X212.648 Y133.284
G1 X212.514 Y133.417
G1 X211.349 Y134.583 E.05064
G1 X211.215 Y134.716
G1 X210.682 Y134.716
G1 X210.816 Y134.583
G1 X211.981 Y133.417 E.05064
G1 X212.115 Y133.284
G1 X211.581 Y133.284
G1 X211.448 Y133.417
G1 X210.283 Y134.583 E.05064
G1 X210.149 Y134.716
G1 X209.821 Y134.511
G1 X209.955 Y134.377
G1 X210.915 Y133.417 E.04172
G1 X211.048 Y133.284
G1 X210.515 Y133.284
G1 X210.381 Y133.417
G1 X209.955 Y133.844 E.01854
; WIPE_START
M204 S5000
G1 X210.381 Y133.417 E-.22933
G1 X210.515 Y133.284 E-.07182
G1 X210.722 Y133.284 E-.07885
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.4 I-1.207 J.157 P1  F15000
G1 X217.583 Y185.941 Z2.4
G1 Z2
G1 E.4 F1800
G1 F6000
M204 S1000
G1 X216.941 Y186.583 E.02789
G1 X216.807 Y186.716
G1 X216.274 Y186.716
G1 X216.408 Y186.583
G1 X217.583 Y185.408 E.05106
G1 X217.716 Y185.274
G1 X217.716 Y184.741
G1 X217.583 Y184.874
G1 X215.874 Y186.583 E.07423
G1 X215.741 Y186.716
G1 X215.207 Y186.716
G1 X215.341 Y186.583
G1 X217.583 Y184.341 E.0974
G1 X217.716 Y184.207
G1 X217.716 Y183.674
G1 X217.583 Y183.808
G1 X214.808 Y186.583 E.12058
G1 X214.674 Y186.716
G1 X214.141 Y186.716
G1 X214.275 Y186.583
G1 X217.583 Y183.275 E.14375
G1 X217.716 Y183.141
G1 X217.716 Y182.608
G1 X217.583 Y182.741
G1 X213.741 Y186.583 E.16692
G1 X213.608 Y186.716
G1 X213.074 Y186.716
G1 X213.208 Y186.583
G1 X214.373 Y185.417 E.05064
G1 X214.507 Y185.284
G1 X213.974 Y185.284
G1 X213.84 Y185.417
G1 X212.675 Y186.583 E.05064
G1 X212.541 Y186.716
G1 X212.008 Y186.716
G1 X212.142 Y186.583
G1 X213.307 Y185.417 E.05064
G1 X213.44 Y185.284
G1 X212.907 Y185.284
G1 X212.774 Y185.417
G1 X211.608 Y186.583 E.05064
G1 X211.475 Y186.716
G1 X210.941 Y186.716
G1 X211.075 Y186.583
G1 X212.24 Y185.417 E.05064
G1 X212.374 Y185.284
G1 X211.841 Y185.284
G1 X211.707 Y185.417
G1 X210.542 Y186.583 E.05064
G1 X210.408 Y186.716
G1 X209.875 Y186.716
G1 X210.009 Y186.583
G1 X211.174 Y185.417 E.05064
G1 X211.307 Y185.284
G1 X210.774 Y185.284
G1 X210.641 Y185.417
G1 X209.955 Y186.103 E.02981
; WIPE_START
M204 S5000
G1 X210.641 Y185.417 E-.36864
G1 X210.662 Y185.396 E-.01136
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.4 I.007 J1.217 P1  F15000
G1 X214.417 Y185.373 Z2.4
G1 Z2
G1 E.4 F1800
G1 F6000
M204 S1000
G1 X217.583 Y182.208 E.13755
G1 X217.716 Y182.074
G1 X217.716 Y181.541
G1 X217.583 Y181.675
G1 X214.417 Y184.84 E.13755
G1 X214.284 Y184.974
G1 X214.284 Y184.44
G1 X214.417 Y184.307
G1 X217.583 Y181.142 E.13755
G1 X217.716 Y181.008
G1 X217.716 Y180.475
G1 X217.583 Y180.608
G1 X214.417 Y183.774 E.13755
G1 X214.284 Y183.907
G1 X214.284 Y183.374
G1 X214.417 Y183.24
G1 X217.583 Y180.075 E.13755
G1 X217.716 Y179.941
G1 X217.716 Y179.408
G1 X217.583 Y179.542
G1 X214.417 Y182.707 E.13755
G1 X214.284 Y182.841
G1 X214.284 Y182.307
G1 X214.417 Y182.174
G1 X217.583 Y179.009 E.13755
G1 X217.716 Y178.875
G1 X217.716 Y178.342
G1 X217.583 Y178.475
G1 X214.417 Y181.641 E.13755
G1 X214.284 Y181.774
G1 X214.284 Y181.241
G1 X214.417 Y181.107
G1 X217.583 Y177.942 E.13755
G1 X217.716 Y177.808
G1 X217.716 Y177.275
G1 X217.583 Y177.409
G1 X214.417 Y180.574 E.13755
G1 X214.284 Y180.708
G1 X214.284 Y180.174
G1 X214.417 Y180.041
G1 X217.583 Y176.876 E.13755
G1 X217.716 Y176.742
G1 X217.716 Y176.209
G1 X217.583 Y176.342
G1 X214.417 Y179.508 E.13755
G1 X214.284 Y179.641
G1 X214.284 Y179.108
G1 X214.417 Y178.974
G1 X217.583 Y175.809 E.13755
G1 X217.716 Y175.675
G1 X217.716 Y175.142
G1 X217.583 Y175.276
G1 X214.417 Y178.441 E.13755
M73 P98 R0
G1 X214.284 Y178.575
G1 X214.284 Y178.041
G1 X214.417 Y177.908
G1 X217.583 Y174.742 E.13755
G1 X217.716 Y174.609
G1 X217.716 Y174.076
G1 X217.583 Y174.209
G1 X214.417 Y177.374 E.13755
G1 X214.284 Y177.508
G1 X214.284 Y176.975
G1 X214.417 Y176.841
G1 X217.583 Y173.676 E.13755
G1 X217.716 Y173.542
G1 X217.716 Y173.009
G1 X217.583 Y173.143
G1 X214.417 Y176.308 E.13755
G1 X214.284 Y176.442
G1 X214.284 Y175.908
G1 X214.417 Y175.775
G1 X217.583 Y172.609 E.13755
G1 X217.716 Y172.476
G1 X217.716 Y171.943
G1 X217.583 Y172.076
G1 X214.417 Y175.241 E.13755
G1 X214.284 Y175.375
G1 X214.284 Y174.842
G1 X214.417 Y174.708
G1 X217.583 Y171.543 E.13755
G1 X217.716 Y171.409
G1 X217.716 Y170.876
G1 X217.583 Y171.01
G1 X214.417 Y174.175 E.13755
G1 X214.284 Y174.309
G1 X214.284 Y173.775
G1 X214.417 Y173.642
G1 X217.583 Y170.476 E.13755
G1 X217.716 Y170.343
G1 X217.716 Y169.81
G1 X217.583 Y169.943
G1 X214.417 Y173.108 E.13755
G1 X214.284 Y173.242
G1 X214.284 Y172.709
G1 X214.417 Y172.575
G1 X217.583 Y169.41 E.13755
G1 X217.716 Y169.276
G1 X217.716 Y168.743
G1 X217.583 Y168.877
G1 X214.417 Y172.042 E.13755
G1 X214.284 Y172.176
G1 X214.284 Y171.642
G1 X214.417 Y171.509
G1 X217.583 Y168.343 E.13755
G1 X217.716 Y168.21
G1 X217.716 Y167.677
G1 X217.583 Y167.81
G1 X214.417 Y170.975 E.13755
G1 X214.284 Y171.109
G1 X214.284 Y170.576
G1 X214.417 Y170.442
G1 X217.583 Y167.277 E.13755
G1 X217.716 Y167.143
G1 X217.716 Y166.61
G1 X217.583 Y166.744
G1 X214.417 Y169.909 E.13755
G1 X214.284 Y170.043
G1 X214.284 Y169.509
G1 X214.417 Y169.376
G1 X217.583 Y166.21 E.13755
G1 X217.716 Y166.077
G1 X217.716 Y165.543
G1 X217.583 Y165.677
G1 X214.417 Y168.842 E.13755
G1 X214.284 Y168.976
G1 X214.284 Y168.443
G1 X214.417 Y168.309
G1 X217.583 Y165.144 E.13755
G1 X217.716 Y165.01
G1 X217.716 Y164.477
G1 X217.583 Y164.611
G1 X214.417 Y167.776 E.13755
G1 X214.284 Y167.909
G1 X214.284 Y167.376
G1 X214.417 Y167.243
G1 X217.583 Y164.077 E.13755
G1 X217.716 Y163.944
G1 X217.716 Y163.41
G1 X217.583 Y163.544
G1 X214.417 Y166.709 E.13755
G1 X214.284 Y166.843
G1 X214.284 Y166.31
G1 X214.417 Y166.176
G1 X217.583 Y163.011 E.13755
G1 X217.716 Y162.877
G1 X217.716 Y162.344
G1 X217.583 Y162.478
G1 X214.417 Y165.643 E.13755
G1 X214.284 Y165.776
G1 X214.284 Y165.243
G1 X214.417 Y165.11
G1 X217.11 Y162.417 E.11699
G1 X217.243 Y162.284
G1 X216.71 Y162.284
G1 X216.576 Y162.417
G1 X214.417 Y164.576 E.09382
G1 X214.284 Y164.71
G1 X214.284 Y164.177
G1 X214.417 Y164.043
G1 X216.043 Y162.417 E.07064
G1 X216.177 Y162.284
G1 X215.643 Y162.284
G1 X215.51 Y162.417
G1 X214.417 Y163.51 E.04747
G1 X214.284 Y163.643
G1 X214.284 Y163.11
G1 X214.417 Y162.977
G1 X214.977 Y162.417 E.0243
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F6000
M204 S5000
G1 X214.417 Y162.977 E-.30049
G1 X214.284 Y163.11 E-.07182
G1 X214.284 Y163.13 E-.00769
; WIPE_END
G1 E-.02 F1800
G17
G3 Z2.4 I1.217 J0 P1  F15000
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 
;========== H2D end ==========
;===== date: 2025/12/26 =====

G392 S0 ;turn off nozzle clog detect
M993 A0 B0 C0 ; nozzle cam detection not allowed.

M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
M400
M211 Z1
G1 Z2.4 F900 ; lower z a little

M1002 judge_flag timelapse_record_flag
M622 J1
    G150.3
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S5 ;wait for last picture to be taken
M623  ;end of "timelapse_record_flag"

G90
G1 Z12 F900 ; lower z a little

G90
M141 S0 ; turn off chamber heating
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan
M106 P9 S0 ; turn off ext toodhead cooling fan
; pull back filament to AMS
M620 S65535
T65535
G150.2
M621 S65535

M620 S65279
T65279
G150.2
M621 S65279

G150.3

M104 S0 T0; turn off hotend
M104 S0 T1; turn off hotend

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    
        G1 Z101 F600
        G1 Z99
    

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M1015.4 S0 K0 ;disable air printing detect

;=====printer finish air purification=========
M622.1 S0
M1002 judge_flag print_finish_air_filt_flag

M622 J1
M1002 gcode_claim_action : 66
M145 P1
M106 P6 S255
M400 S180
M106 P6 S0
M623

M622 J2
M1002 gcode_claim_action : 66
M145 P0
M106 P3 S127
M400 S180
M106 P3 S0
M623
;=====printer finish air purification=========


;=====printer finish  sound=========
M17
M400 S1
M1006 S1
M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
M1006 A53 B10 L99 C53 D10 M99 E53 F10 N99 
M1006 A57 B10 L99 C57 D10 M99 E57 F10 N99 
M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
M1006 A48 B10 L99 C48 D10 M99 E48 F10 N99 
M1006 A0 B15 L0 C0 D15 M0 E0 F15 N0 
M1006 A60 B10 L99 C60 D10 M99 E60 F10 N99 
M1006 W
;=====printer finish  sound=========
M400
M18

M73 P100 R0
; EXECUTABLE_BLOCK_END

