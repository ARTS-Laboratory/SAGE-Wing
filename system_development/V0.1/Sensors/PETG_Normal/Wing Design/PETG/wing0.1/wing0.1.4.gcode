; HEADER_BLOCK_START
; BambuStudio 02.06.00.51
; model printing time: 14m 25s; total estimated time: 20m 45s
; total layer number: 5
; total filament length [mm] : 1124.05
; total filament volume [cm^3] : 2703.66
; total filament weight [g] : 3.46
; model label id: 104,115,126,161
; object max height: 1.00,1.00,1.00,1.00
; filament_density: 1.28
; filament_diameter: 1.75
; max_z_height: 1.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 0
; additional_fan_full_speed_layer = 0
; apply_scarf_seam_on_circles = 1
; auxiliary_fan = 1
; avoid_crossing_wall_includes_support = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_density = 100%
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 25
; brim_object_gap = 0.1
; brim_type = outer_only
; brim_width = 3
; chamber_temperatures = 0
; change_filament_gcode = ;=P1S 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 3
; close_fan_the_first_x_layers = 3
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 0
; cool_plate_temp_initial_layer = 0
; cooling_filter_enabled = 0
; cooling_perimeter_transition_distance = 10
; cooling_slowdown_logic = uniform_cooling
; counter_coef_1 = 0
; counter_coef_2 = 0.008
; counter_coef_3 = -0.041
; counter_limit_max = 0.033
; counter_limit_min = -0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 5000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL P1S 0.4 nozzle"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50
; different_settings_to_system = bridge_speed;brim_type;brim_width;default_acceleration;enable_support;gap_infill_speed;initial_layer_acceleration;initial_layer_infill_speed;initial_layer_speed;initial_layer_travel_acceleration;inner_wall_speed;internal_solid_infill_speed;outer_wall_acceleration;outer_wall_speed;overhang_2_4_speed;overhang_3_4_speed;overhang_4_4_speed;overhang_totally_speed;skeleton_infill_density;skin_infill_density;sparse_infill_density;sparse_infill_pattern;sparse_infill_speed;support_interface_speed;support_speed;top_surface_acceleration;top_surface_speed;travel_acceleration;travel_speed;nozzle_temperature_initial_layer;nozzle_temperature_range_low;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; embedding_wall_into_infill = 0
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_filament_dynamic_map = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_mixed_color_sublayer = 0
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 1
; enable_support_ironing = 0
; enable_tower_interface_features = 0
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 70
; eng_plate_temp_initial_layer = 70
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_max_nozzle_count = 1
; extruder_nozzle_stats = Standard#1
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard,Direct Drive High Flow"
; fan_cooling_layer_time = 20
; fan_direction = left
; fan_max_speed = 40
; fan_min_speed = 20
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 300
; filament_bridge_speed = 25
; filament_change_length = 12
; filament_change_length_nc = 10
; filament_colour = #000000
; filament_colour_type = 1
; filament_cooling_before_tower = 0
; filament_cost = 24.99
; filament_density = 1.28
; filament_dev_ams_drying_ams_limitations = 1;0
; filament_dev_ams_drying_heat_distortion_temperature = 75
; filament_dev_ams_drying_temperature = 65,65,55,55
; filament_dev_ams_drying_time = 12,12,12,12
; filament_dev_chamber_drying_bed_temperature = 80
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 55
; filament_dev_drying_softening_temperature = 60
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.95
; filament_flush_temp = 0
; filament_flush_volumetric_speed = 0
; filament_ids = GFG02
; filament_is_mixed = 0
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21
; filament_metal_stickiness = High
; filament_minimal_purge_on_wipe_tower = 15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_multi_colour = #000000
; filament_notes = 
; filament_nozzle_map = 0
; filament_overhang_1_4_speed = 0
; filament_overhang_2_4_speed = 50
; filament_overhang_3_4_speed = 30
; filament_overhang_4_4_speed = 10
; filament_overhang_totally_speed = 10
; filament_pre_cooling_temperature = 0
; filament_pre_cooling_temperature_nc = 0
; filament_prime_volume = 30
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_retraction_distances_when_cut = 18
; filament_scarf_gap = 0%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "PETG HF wing2"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if (bed_temperature[current_extruder] >80)||(bed_temperature_initial_layer[current_extruder] >80)}M106 P3 S255\n{elsif (bed_temperature[current_extruder] >60)||(bed_temperature_initial_layer[current_extruder] >60)}M106 P3 S180\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PETG
; filament_velocity_adaptation_factor = 1
; filament_vendor = "Bambu Lab"
; filament_volume_map = 0
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; fill_multiline = 1
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; first_x_layer_fan_speed = 0
; first_x_layer_part_fan_speed = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.3
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.2
; gap_infill_speed = 125
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; group_algo_with_time = 0
; has_filament_switcher = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0
; hole_coef_2 = -0.008
; hole_coef_3 = 0.23415
; hole_limit_max = 0.22
; hole_limit_min = 0.088
; host_type = octoprint
; hot_plate_temp = 70
; hot_plate_temp_initial_layer = 70
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10.6
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = "0.20mm Standard @BBL X1C";"Bambu PETG HF @BBL P1S 0.4 nozzle";
; initial_layer_acceleration = 250
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 50
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 25
; initial_layer_travel_acceleration = 3000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 150
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
; internal_solid_infill_speed = 80
; ironing_direction = 45
; ironing_fan_speed = -1
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,500
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,500
; machine_max_speed_y = 500,500
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: P1S-0.4 ========================\n;===== date: 20251031 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action:54\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; monotonic_travel_into_wall = 0%
; no_slow_down_for_cooling_on_outwalls = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 245
; nozzle_temperature_initial_layer = 250
; nozzle_temperature_range_high = 270
; nozzle_temperature_range_low = 245
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 2500
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 100
; overhang_1_4_speed = 0
; overhang_2_4_speed = 25
; overhang_3_4_speed = 15
; overhang_4_4_speed = 5
; overhang_fan_speed = 100
; overhang_fan_threshold = 10%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 5
; override_filament_scarf_seam_setting = 0
; override_process_overhang_speed = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; prime_volume_mode = Default
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_in_clockwise = 0
; print_sequence = by layer
; print_settings_id = wing
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
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
; reduce_fan_stop_start_freq = 1
; reduce_infill_retraction_mode = Auto
; required_nozzle_HRC = 3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
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
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 10
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 100%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = zig-zag
; sparse_infill_speed = 130
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 70
; supertack_plate_temp_initial_layer = 70
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_cooling_filter = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 40
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
; support_speed = 75
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = tree(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 70
; template_custom_gcode = 
; textured_plate_temp = 70
; textured_plate_temp_initial_layer = 70
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 1000
; top_surface_density = 100%
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 100
; top_z_overrides_xy_distance = 0
; travel_acceleration = 5000
; travel_jerk = 9
; travel_short_distance_acceleration = 250
; travel_speed = 250
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; volumetric_speed_coefficients = "0 0 0 0 0 0"
; wall_distribution_count = 1
; wall_filament = 0
; wall_generator = classic
; wall_loops = 2
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 220.697
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R20
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S-0.4 ========================
;===== date: 20251031 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action:54
M140 S70 ;set bed temp
M190 S70 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S250 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S250
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F523.843 T270


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P2 R20
G1 E50 F200
M400
M104 S250
G92 E0
M73 P23 R15
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S230 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P24 R15
G1 E-0.5 F300

M73 P26 R15
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S230
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
M73 P27 R15
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X28.9776 Y47.534 I201.82 J162.228
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S250 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S250
G1 Z0.2
G0 E2 F300
G0 X240 E15 F3016.64
G0 Y11 E0.700 F754.159
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F3016.64
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S180


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/5
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S3000
G1 Z.4 F15000
; object ids of layer 1 start: 104,115,126,161
M624 DwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer1 end: 104,115,126,161
M625
; OBJECT_ID: 161
; start printing object, unique label id: 161
M624 CAAAAAAAAAA=
G1 X139.459 Y48.205
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
M73 P27 R14
G1 X139.589 Y47.931 E.01096
M73 P28 R14
G1 X139.91 Y47.448 E.02093
G1 X140.25 Y47.112 E.01724
G1 X140.648 Y46.847 E.01726
G1 X141.14 Y46.647 E.01917
G1 X141.907 Y46.532 E.02802
G1 X227.879 Y46.532 E3.10411
G1 X228.367 Y46.578 E.0177
G1 X228.829 Y46.715 E.01739
G1 X229.186 Y46.891 E.01439
G1 X229.586 Y47.165 E.0175
G1 X229.923 Y47.506 E.0173
G1 X230.188 Y47.903 E.01726
G1 X230.388 Y48.395 E.01917
G1 X230.504 Y49.163 E.02802
G1 X230.504 Y105.135 E2.02092
G1 X230.457 Y105.623 E.0177
M73 P29 R14
G1 X230.32 Y106.086 E.01745
G1 X230.19 Y106.36 E.01096
G1 X229.869 Y106.843 E.02093
G1 X229.53 Y107.179 E.01724
G1 X229.132 Y107.444 E.01726
G1 X228.64 Y107.644 E.01917
G1 X227.873 Y107.759 E.02802
G1 X141.901 Y107.759 E3.1041
G1 X141.413 Y107.713 E.0177
G1 X140.949 Y107.576 E.01745
G1 X140.675 Y107.446 E.01096
G1 X140.192 Y107.125 E.02093
G1 X139.857 Y106.785 E.01724
G1 X139.591 Y106.388 E.01726
G1 X139.391 Y105.896 E.01917
G1 X139.276 Y105.128 E.02802
G1 X139.276 Y49.156 E2.02093
G1 X139.323 Y48.668 E.0177
G1 X139.442 Y48.262 E.01528
M204 S3000
G1 X139.883 Y48.391 F15000
G1 F1500
M204 S250
G1 X139.892 Y48.359 E.00122
G1 X139.994 Y48.148 E.00844
M73 P30 R14
G1 X140.257 Y47.752 E.01718
G1 X140.551 Y47.461 E.01492
G1 X140.876 Y47.248 E.01403
G1 X141.246 Y47.097 E.01444
G1 X141.951 Y46.989 E.02576
G1 X227.864 Y46.989 E3.10195
G1 X228.292 Y47.033 E.01556
G1 X228.673 Y47.147 E.01434
G1 X228.963 Y47.292 E.01172
G1 X229.281 Y47.509 E.01391
G1 X229.558 Y47.786 E.01413
G1 X229.774 Y48.107 E.01398
G1 X229.938 Y48.502 E.01544
G1 X230.047 Y49.207 E.02576
G1 X230.047 Y105.106 E2.01829
G1 X230.007 Y105.522 E.01509
G1 X229.887 Y105.932 E.01542
G1 X229.786 Y106.143 E.00844
G1 X229.523 Y106.539 E.01718
G1 X229.229 Y106.83 E.01492
G1 X228.904 Y107.043 E.01403
G1 X228.533 Y107.194 E.01444
G1 X227.828 Y107.302 E.02576
G1 X141.929 Y107.302 E3.10147
G1 X141.513 Y107.263 E.01509
G1 X141.103 Y107.143 E.01542
G1 X140.892 Y107.042 E.00844
G1 X140.496 Y106.778 E.01718
M73 P31 R14
G1 X140.205 Y106.485 E.01492
G1 X139.992 Y106.16 E.01403
G1 X139.841 Y105.789 E.01444
G1 X139.733 Y105.084 E.02576
G1 X139.733 Y49.185 E2.0183
G1 X139.772 Y48.769 E.01509
G1 X139.866 Y48.449 E.01203
M204 S3000
G1 X140.305 Y48.58 F15000
G1 F1500
M204 S250
G1 X140.325 Y48.513 E.00252
G1 X140.397 Y48.367 E.00588
G1 X140.604 Y48.055 E.01351
G1 X140.851 Y47.811 E.01256
G1 X141.101 Y47.649 E.01075
G1 X141.354 Y47.547 E.00983
G1 X141.997 Y47.446 E.0235
G1 X227.833 Y47.446 E3.09922
G1 X228.19 Y47.482 E.01292
G1 X228.514 Y47.579 E.01224
G1 X228.739 Y47.692 E.00908
G1 X228.977 Y47.855 E.01042
G1 X229.194 Y48.069 E.011
G1 X229.362 Y48.313 E.0107
G1 X229.488 Y48.611 E.01167
G1 X229.589 Y49.253 E.02346
G1 X229.589 Y105.078 E2.01564
G1 X229.553 Y105.449 E.01344
G1 X229.454 Y105.778 E.01241
G1 X229.383 Y105.924 E.00588
G1 X229.176 Y106.236 E.01351
G1 X228.928 Y106.48 E.01256
G1 X228.678 Y106.642 E.01075
G1 X228.426 Y106.744 E.00983
G1 X227.783 Y106.845 E.0235
G1 X141.957 Y106.845 E3.09882
G1 X141.587 Y106.808 E.01344
G1 X141.257 Y106.71 E.01241
G1 X141.111 Y106.638 E.00588
G1 X140.8 Y106.431 E.01351
G1 X140.555 Y106.184 E.01256
G1 X140.394 Y105.934 E.01075
G1 X140.291 Y105.681 E.00983
G1 X140.19 Y105.039 E.0235
G1 X140.19 Y49.213 E2.01565
G1 X140.227 Y48.842 E.01343
G1 X140.288 Y48.638 E.00772
M204 S3000
M73 P32 R14
G1 X140.718 Y48.786 F15000
G1 F1500
M204 S250
G1 X140.768 Y48.643 E.00546
G1 X140.834 Y48.525 E.00489
G1 X141.086 Y48.221 E.01425
G1 X141.293 Y48.075 E.00914
G1 X141.49 Y47.982 E.00786
G1 X141.631 Y47.939 E.00535
G1 X141.909 Y47.903 E.01012
G1 X227.867 Y47.903 E3.10359
G1 X228.183 Y47.951 E.01156
G1 X228.301 Y47.989 E.00446
G1 X228.603 Y48.149 E.01232
G1 X228.812 Y48.339 E.01024
G1 X228.96 Y48.549 E.00926
G1 X229.053 Y48.745 E.00785
G1 X229.096 Y48.887 E.00535
G1 X229.132 Y49.165 E.01012
G1 X229.132 Y105.123 E2.0204
G1 X229.084 Y105.439 E.01156
G1 X229.047 Y105.557 E.00446
M73 P32 R13
G1 X228.887 Y105.858 E.01232
G1 X228.696 Y106.068 E.01024
G1 X228.487 Y106.216 E.00926
G1 X228.29 Y106.309 E.00785
G1 X228.148 Y106.352 E.00535
G1 X227.87 Y106.388 E.01012
G1 X141.913 Y106.388 E3.10359
G1 X141.596 Y106.34 E.01156
G1 X141.478 Y106.302 E.00446
G1 X141.177 Y106.142 E.01232
G1 X140.967 Y105.952 E.01023
G1 X140.819 Y105.742 E.00926
G1 X140.727 Y105.545 E.00786
G1 X140.683 Y105.404 E.00535
G1 X140.647 Y105.126 E.01012
G1 X140.647 Y49.168 E2.02041
G1 X140.696 Y48.851 E.01161
G1 X140.699 Y48.842 E.00031
M204 S3000
M73 P33 R13
G1 X141.147 Y48.924 F15000
G1 F1500
M204 S250
G1 X141.194 Y48.806 E.0046
G1 X141.362 Y48.584 E.01005
G1 X141.476 Y48.494 E.00525
G1 X141.693 Y48.392 E.00865
G1 X141.9 Y48.36 E.00758
G1 X227.877 Y48.36 E3.10429
G1 X228.107 Y48.402 E.00845
G1 X228.299 Y48.489 E.00759
G1 X228.451 Y48.618 E.0072
G1 X228.542 Y48.732 E.00525
G1 X228.643 Y48.949 E.00865
G1 X228.675 Y49.156 E.00758
G1 X228.675 Y105.133 E2.02111
G1 X228.633 Y105.363 E.00845
G1 X228.546 Y105.554 E.00759
G1 X228.417 Y105.707 E.0072
G1 X228.303 Y105.797 E.00525
G1 X228.087 Y105.899 E.00865
G1 X227.879 Y105.931 E.00758
G1 X141.902 Y105.931 E3.10429
G1 X141.672 Y105.889 E.00845
G1 X141.481 Y105.802 E.00759
G1 X141.329 Y105.673 E.0072
G1 X141.238 Y105.559 E.00525
G1 X141.136 Y105.342 E.00865
G1 X141.104 Y105.135 E.00758
G1 X141.104 Y49.158 E2.02111
G1 X141.136 Y48.983 E.00641
M204 S3000
G1 X141.574 Y49.096 F15000
G1 F1500
M204 S250
G1 X141.59 Y49.035 E.0023
G1 X141.637 Y48.95 E.0035
G1 X141.773 Y48.841 E.00632
G1 X141.89 Y48.817 E.00429
G1 X227.89 Y48.817 E3.10512
G1 X228 Y48.846 E.00413
G1 X228.085 Y48.892 E.0035
M73 P34 R13
G1 X228.194 Y49.029 E.00632
G1 X228.218 Y49.146 E.00429
G1 X228.218 Y105.146 E2.02194
G1 X228.19 Y105.256 E.00413
G1 X228.143 Y105.341 E.0035
G1 X228.006 Y105.45 E.00632
G1 X227.89 Y105.474 E.00429
G1 X141.89 Y105.474 E3.10512
G1 X141.779 Y105.445 E.00413
G1 X141.694 Y105.399 E.0035
G1 X141.585 Y105.262 E.00632
G1 X141.561 Y105.146 E.00429
G1 X141.561 Y49.155 E2.0216
; WIPE_START
G1 X141.59 Y49.035 E-.04687
G1 X141.637 Y48.95 E-.03679
G1 X141.773 Y48.841 E-.06647
G1 X141.89 Y48.817 E-.04514
G1 X143.376 Y48.817 E-.56474
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X149.732 Y53.043 Z.6 F15000
G1 X227.49 Y104.746 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X142.29 Y104.746 E3.07623
G1 X142.29 Y49.546 E1.99305
G1 X227.49 Y49.546 E3.07623
G1 X227.49 Y104.686 E1.99089
M204 S3000
G1 X227.033 Y104.288 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X142.747 Y104.288 E3.04323
G1 X142.747 Y50.003 E1.96005
G1 X227.033 Y50.003 E3.04323
M73 P35 R13
G1 X227.033 Y104.228 E1.95788
; WIPE_START
G1 X225.033 Y104.23 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X226.29 Y103.546 Z.6 F15000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X143.49 Y103.546 E2.98958
G1 X143.49 Y50.746 E1.9064
G1 X226.29 Y50.746 E2.98958
G1 X226.29 Y103.486 E1.90423
M204 S3000
G1 X226.747 Y103.546 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X226.747 Y104.003 E.0165
G1 X143.033 Y104.003 E3.02258
G1 X143.033 Y50.288 E1.9394
G1 X226.747 Y50.288 E3.02258
G1 X226.747 Y103.486 E1.92073
; OBJECT_ID: 115
; WIPE_START
G1 X226.747 Y104.003 E-.19649
G1 X225.264 Y104.003 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 161
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
M204 S3000
G1 X225.531 Y111.63 Z.6 F15000
G1 X226.747 Y146.306 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
M73 P36 R13
G1 F1500
M204 S250
G1 X227.944 Y146.306 E.04324
G1 X228.432 Y146.353 E.0177
G1 X228.894 Y146.489 E.01739
G1 X229.252 Y146.665 E.01439
G1 X229.652 Y146.939 E.0175
G1 X229.988 Y147.28 E.0173
G1 X230.254 Y147.678 E.01726
G1 X230.454 Y148.17 E.01917
G1 X230.569 Y148.937 E.02802
G1 X230.569 Y204.909 E2.02092
G1 X230.522 Y205.397 E.0177
G1 X230.386 Y205.861 E.01745
G1 X230.255 Y206.135 E.01096
G1 X229.935 Y206.618 E.02093
G1 X229.595 Y206.953 E.01724
G1 X229.197 Y207.218 E.01726
G1 X228.705 Y207.418 E.01917
G1 X227.938 Y207.534 E.02802
M73 P37 R13
G1 X141.966 Y207.534 E3.1041
G1 X141.478 Y207.487 E.0177
G1 X141.015 Y207.351 E.01745
G1 X140.74 Y207.22 E.01096
M73 P37 R12
G1 X140.257 Y206.9 E.02093
G1 X139.922 Y206.56 E.01724
G1 X139.657 Y206.162 E.01726
M73 P38 R12
G1 X139.457 Y205.67 E.01917
G1 X139.341 Y204.903 E.02802
G1 X139.341 Y148.931 E2.02093
G1 X139.388 Y148.443 E.0177
G1 X139.525 Y147.979 E.01745
G1 X139.655 Y147.705 E.01096
G1 X139.975 Y147.222 E.02093
G1 X140.315 Y146.887 E.01724
G1 X140.713 Y146.622 E.01726
G1 X141.205 Y146.422 E.01917
G1 X141.972 Y146.306 E.02802
G1 X226.687 Y146.306 E3.0587
M204 S3000
G1 X226.687 Y146.764 F15000
G1 F1500
M204 S250
M73 P39 R12
G1 X227.929 Y146.764 E.04485
G1 X228.358 Y146.807 E.01556
G1 X228.738 Y146.922 E.01434
G1 X229.029 Y147.066 E.01172
G1 X229.346 Y147.284 E.01391
G1 X229.623 Y147.561 E.01413
G1 X229.84 Y147.882 E.01398
G1 X230.004 Y148.277 E.01544
G1 X230.112 Y148.982 E.02576
G1 X230.112 Y204.881 E2.01829
G1 X230.073 Y205.297 E.01509
G1 X229.953 Y205.707 E.01542
G1 X229.851 Y205.917 E.00844
G1 X229.588 Y206.314 E.01718
G1 X229.294 Y206.605 E.01492
G1 X228.969 Y206.818 E.01403
G1 X228.599 Y206.968 E.01444
G1 X227.894 Y207.077 E.02576
G1 X141.995 Y207.077 E3.10147
G1 X141.578 Y207.038 E.01509
G1 X141.168 Y206.918 E.01542
M73 P40 R12
G1 X140.958 Y206.816 E.00844
G1 X140.561 Y206.553 E.01718
G1 X140.271 Y206.259 E.01492
G1 X140.058 Y205.934 E.01403
G1 X139.907 Y205.564 E.01444
G1 X139.798 Y204.858 E.02576
G1 X139.798 Y148.959 E2.0183
G1 X139.838 Y148.543 E.01509
G1 X139.958 Y148.133 E.01542
G1 X140.059 Y147.923 E.00844
G1 X140.322 Y147.526 E.01718
G1 X140.616 Y147.236 E.01492
G1 X140.941 Y147.022 E.01403
G1 X141.312 Y146.872 E.01444
G1 X142.017 Y146.763 E.02576
G1 X226.627 Y146.764 E3.05493
M204 S3000
G1 X226.627 Y147.221 F15000
G1 F1500
M204 S250
G1 X227.899 Y147.221 E.04593
G1 X228.255 Y147.256 E.01292
G1 X228.58 Y147.353 E.01224
G1 X228.804 Y147.467 E.00908
G1 X229.043 Y147.63 E.01042
G1 X229.26 Y147.844 E.011
G1 X229.428 Y148.088 E.0107
G1 X229.554 Y148.385 E.01167
G1 X229.655 Y149.027 E.02346
G1 X229.655 Y204.853 E2.01564
G1 X229.618 Y205.223 E.01344
G1 X229.52 Y205.552 E.01241
G1 X229.448 Y205.698 E.00588
G1 X229.241 Y206.01 E.01351
G1 X228.994 Y206.255 E.01256
G1 X228.743 Y206.416 E.01075
G1 X228.491 Y206.519 E.00983
G1 X227.848 Y206.62 E.0235
G1 X142.022 Y206.62 E3.09882
G1 X141.652 Y206.583 E.01344
G1 X141.323 Y206.485 E.01241
M73 P41 R12
G1 X141.177 Y206.413 E.00588
G1 X140.865 Y206.206 E.01351
G1 X140.62 Y205.959 E.01256
G1 X140.459 Y205.708 E.01075
G1 X140.356 Y205.456 E.00983
G1 X140.255 Y204.813 E.0235
G1 X140.255 Y148.987 E2.01565
G1 X140.292 Y148.617 E.01343
G1 X140.39 Y148.288 E.01241
G1 X140.462 Y148.142 E.00588
G1 X140.669 Y147.83 E.01351
G1 X140.917 Y147.585 E.01256
G1 X141.167 Y147.424 E.01075
G1 X141.419 Y147.321 E.00983
G1 X142.062 Y147.22 E.0235
G1 X226.567 Y147.221 E3.05112
M204 S3000
G1 X226.567 Y147.677 F15000
G1 F1500
M204 S250
G1 X227.932 Y147.677 E.0493
G1 X228.249 Y147.726 E.01156
G1 X228.367 Y147.763 E.00446
G1 X228.668 Y147.923 E.01232
G1 X228.878 Y148.114 E.01024
G1 X229.026 Y148.323 E.00926
G1 X229.118 Y148.52 E.00785
G1 X229.161 Y148.662 E.00535
G1 X229.198 Y148.94 E.01012
G1 X229.198 Y204.897 E2.0204
G1 X229.149 Y205.214 E.01156
G1 X229.112 Y205.332 E.00446
G1 X228.952 Y205.633 E.01232
G1 X228.761 Y205.843 E.01024
G1 X228.552 Y205.991 E.00926
G1 X228.355 Y206.083 E.00785
G1 X228.214 Y206.126 E.00535
G1 X227.936 Y206.163 E.01012
G1 X141.978 Y206.163 E3.10359
G1 X141.662 Y206.114 E.01156
G1 X141.544 Y206.077 E.00446
M73 P42 R12
G1 X141.242 Y205.917 E.01232
G1 X141.033 Y205.726 E.01023
G1 X140.884 Y205.517 E.00926
G1 X140.792 Y205.32 E.00786
G1 X140.749 Y205.178 E.00535
G1 X140.712 Y204.901 E.01012
G1 X140.712 Y148.943 E2.02041
G1 X140.761 Y148.625 E.01161
G1 X140.833 Y148.417 E.00794
M73 P42 R11
G1 X140.9 Y148.299 E.00489
G1 X141.152 Y147.996 E.01425
G1 X141.358 Y147.849 E.00914
G1 X141.555 Y147.757 E.00786
G1 X141.697 Y147.714 E.00535
G1 X141.975 Y147.677 E.01012
G1 X226.507 Y147.677 E3.05212
M204 S3000
G1 X226.507 Y148.134 F15000
G1 F1500
M204 S250
G1 X227.943 Y148.134 E.05185
G1 X228.173 Y148.177 E.00845
G1 X228.364 Y148.264 E.00759
G1 X228.516 Y148.393 E.0072
G1 X228.607 Y148.506 E.00525
G1 X228.709 Y148.723 E.00865
G1 X228.741 Y148.931 E.00758
G1 X228.741 Y204.908 E2.02111
G1 X228.699 Y205.138 E.00845
G1 X228.611 Y205.329 E.00759
G1 X228.483 Y205.481 E.0072
G1 X228.369 Y205.572 E.00525
G1 X228.152 Y205.674 E.00865
G1 X227.945 Y205.706 E.00758
G1 X141.968 Y205.706 E3.10429
G1 X141.737 Y205.664 E.00845
G1 X141.546 Y205.576 E.00759
G1 X141.394 Y205.447 E.0072
G1 X141.303 Y205.334 E.00525
G1 X141.202 Y205.117 E.00865
G1 X141.17 Y204.909 E.00758
M73 P43 R11
G1 X141.17 Y148.932 E2.02111
G1 X141.212 Y148.699 E.00857
G1 X141.259 Y148.581 E.0046
G1 X141.428 Y148.359 E.01005
G1 X141.541 Y148.268 E.00525
G1 X141.758 Y148.166 E.00865
G1 X141.966 Y148.134 E.00758
G1 X226.447 Y148.134 E3.05027
M204 S3000
G1 X226.447 Y148.592 F15000
G1 F1500
M204 S250
G1 X227.955 Y148.592 E.05446
G1 X228.066 Y148.62 E.00413
G1 X228.151 Y148.667 E.0035
G1 X228.26 Y148.804 E.00632
G1 X228.284 Y148.92 E.00429
G1 X228.284 Y204.92 E2.02194
G1 X228.255 Y205.031 E.00413
G1 X228.208 Y205.115 E.0035
G1 X228.071 Y205.224 E.00632
G1 X227.955 Y205.249 E.00429
G1 X141.955 Y205.249 E3.10512
G1 X141.845 Y205.22 E.00413
G1 X141.76 Y205.173 E.0035
G1 X141.651 Y205.036 E.00632
G1 X141.627 Y204.92 E.00429
G1 X141.627 Y148.92 E2.02194
G1 X141.655 Y148.809 E.00413
G1 X141.702 Y148.725 E.0035
G1 X141.839 Y148.616 E.00632
G1 X141.955 Y148.592 E.00429
G1 X226.387 Y148.592 E3.04849
; WIPE_START
G1 X227.955 Y148.592 E-.59599
G1 X228.066 Y148.62 E-.04342
G1 X228.151 Y148.667 E-.03679
G1 X228.26 Y148.804 E-.06647
G1 X228.269 Y148.848 E-.01734
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X228.171 Y156.48 Z.6 F15000
G1 X227.555 Y204.52 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X142.355 Y204.52 E3.07623
G1 X142.355 Y149.32 E1.99305
M73 P44 R11
G1 X227.555 Y149.32 E3.07623
G1 X227.555 Y204.46 E1.99089
M204 S3000
G1 X227.098 Y204.063 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X142.812 Y204.063 E3.04323
G1 X142.812 Y149.777 E1.96005
G1 X227.098 Y149.777 E3.04323
G1 X227.098 Y204.003 E1.95788
; WIPE_START
G1 X225.098 Y204.004 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X226.355 Y203.32 Z.6 F15000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X143.555 Y203.32 E2.98958
G1 X143.555 Y150.52 E1.9064
G1 X226.355 Y150.52 E2.98958
G1 X226.355 Y203.26 E1.90423
M204 S3000
G1 X226.812 Y203.32 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X226.812 Y203.777 E.0165
G1 X143.098 Y203.777 E3.02258
G1 X143.098 Y150.063 E1.9394
G1 X226.812 Y150.063 E3.02258
G1 X226.812 Y203.26 E1.92073
; OBJECT_ID: 104
; WIPE_START
G1 X226.812 Y203.777 E-.19649
G1 X225.329 Y203.777 E-.56351
; WIPE_END
M73 P45 R11
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
M204 S3000
G1 X217.697 Y203.739 Z.6 F15000
G1 X120.63 Y203.26 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F1500
M204 S250
G1 X120.63 Y204.463 E.04345
G1 X120.583 Y204.951 E.0177
G1 X120.447 Y205.415 E.01745
G1 X120.316 Y205.689 E.01096
G1 X119.996 Y206.172 E.02093
G1 X119.656 Y206.508 E.01724
G1 X119.258 Y206.773 E.01726
G1 X118.766 Y206.973 E.01917
G1 X117.999 Y207.088 E.02802
G1 X32.027 Y207.088 E3.1041
G1 X31.539 Y207.041 E.0177
G1 X31.075 Y206.905 E.01745
G1 X30.801 Y206.775 E.01096
G1 X30.318 Y206.454 E.02093
G1 X29.983 Y206.114 E.01724
G1 X29.718 Y205.716 E.01726
G1 X29.518 Y205.225 E.01917
M73 P46 R11
G1 X29.402 Y204.457 E.02802
G1 X29.402 Y148.485 E2.02093
G1 X29.449 Y147.997 E.0177
G1 X29.585 Y147.534 E.01745
G1 X29.716 Y147.26 E.01096
G1 X30.036 Y146.777 E.02093
M73 P47 R11
G1 X30.376 Y146.441 E.01724
M73 P47 R10
G1 X30.774 Y146.176 E.01726
G1 X31.266 Y145.976 E.01917
G1 X32.033 Y145.86 E.02802
G1 X118.005 Y145.86 E3.10411
G1 X118.493 Y145.907 E.0177
G1 X118.955 Y146.043 E.01739
G1 X119.313 Y146.219 E.01439
G1 X119.712 Y146.493 E.0175
G1 X120.049 Y146.834 E.0173
G1 X120.314 Y147.232 E.01726
M73 P48 R10
G1 X120.514 Y147.724 E.01917
G1 X120.63 Y148.491 E.02802
G1 X120.63 Y203.2 E1.97531
M204 S3000
G1 X120.173 Y203.2 F15000
G1 F1500
M204 S250
G1 X120.173 Y204.435 E.04459
G1 X120.134 Y204.851 E.01509
M73 P49 R10
G1 X120.014 Y205.261 E.01542
G1 X119.912 Y205.472 E.00844
G1 X119.649 Y205.868 E.01718
G1 X119.355 Y206.159 E.01492
G1 X119.03 Y206.372 E.01403
G1 X118.659 Y206.523 E.01444
G1 X117.954 Y206.631 E.02576
G1 X32.055 Y206.631 E3.10147
G1 X31.639 Y206.592 E.01509
G1 X31.229 Y206.472 E.01542
G1 X31.019 Y206.37 E.00844
G1 X30.622 Y206.107 E.01718
G1 X30.331 Y205.813 E.01492
G1 X30.118 Y205.488 E.01403
G1 X29.968 Y205.118 E.01444
G1 X29.859 Y204.413 E.02576
G1 X29.859 Y148.514 E2.0183
G1 X29.898 Y148.097 E.01509
G1 X30.018 Y147.688 E.01542
G1 X30.12 Y147.477 E.00844
G1 X30.383 Y147.08 E.01718
G1 X30.677 Y146.79 E.01492
G1 X31.002 Y146.577 E.01403
G1 X31.372 Y146.426 E.01444
G1 X32.078 Y146.317 E.02576
G1 X117.99 Y146.318 E3.10195
G1 X118.418 Y146.362 E.01556
G1 X118.799 Y146.476 E.01434
G1 X119.089 Y146.62 E.01172
G1 X119.407 Y146.838 E.01391
G1 X119.684 Y147.115 E.01413
G1 X119.901 Y147.436 E.01398
G1 X120.064 Y147.831 E.01544
G1 X120.173 Y148.536 E.02576
G1 X120.173 Y203.14 E1.97154
M204 S3000
G1 X119.716 Y203.14 F15000
G1 F1500
M204 S250
M73 P50 R10
G1 X119.716 Y204.407 E.04574
G1 X119.679 Y204.777 E.01344
G1 X119.581 Y205.107 E.01241
G1 X119.509 Y205.253 E.00588
G1 X119.302 Y205.564 E.01351
G1 X119.055 Y205.809 E.01256
G1 X118.804 Y205.97 E.01075
G1 X118.552 Y206.073 E.00983
G1 X117.909 Y206.174 E.0235
G1 X32.083 Y206.174 E3.09882
G1 X31.713 Y206.137 E.01344
G1 X31.384 Y206.039 E.01241
G1 X31.238 Y205.967 E.00588
G1 X30.926 Y205.76 E.01351
G1 X30.681 Y205.513 E.01256
G1 X30.52 Y205.263 E.01075
G1 X30.417 Y205.01 E.00983
G1 X30.316 Y204.367 E.0235
G1 X30.316 Y148.542 E2.01565
G1 X30.353 Y148.171 E.01343
G1 X30.451 Y147.842 E.01241
G1 X30.523 Y147.696 E.00588
G1 X30.73 Y147.384 E.01351
G1 X30.977 Y147.139 E.01256
G1 X31.228 Y146.978 E.01075
G1 X31.48 Y146.876 E.00983
G1 X32.123 Y146.775 E.0235
G1 X117.96 Y146.775 E3.09922
G1 X118.316 Y146.811 E.01292
G1 X118.641 Y146.908 E.01224
G1 X118.865 Y147.021 E.00908
G1 X119.103 Y147.184 E.01042
G1 X119.32 Y147.398 E.011
G1 X119.488 Y147.642 E.0107
G1 X119.615 Y147.939 E.01167
G1 X119.716 Y148.581 E.02346
G1 X119.716 Y203.08 E1.96773
M204 S3000
G1 X119.259 Y203.08 F15000
G1 F1500
M204 S250
M73 P51 R10
G1 X119.259 Y204.451 E.04951
G1 X119.21 Y204.768 E.01156
G1 X119.173 Y204.886 E.00446
G1 X119.013 Y205.187 E.01232
G1 X118.822 Y205.397 E.01024
G1 X118.613 Y205.545 E.00926
G1 X118.416 Y205.637 E.00785
G1 X118.274 Y205.681 E.00535
G1 X117.996 Y205.717 E.01012
G1 X32.039 Y205.717 E3.10359
G1 X31.722 Y205.668 E.01156
G1 X31.604 Y205.631 E.00446
G1 X31.303 Y205.471 E.01232
G1 X31.093 Y205.281 E.01023
G1 X30.945 Y205.071 E.00926
G1 X30.853 Y204.874 E.00786
G1 X30.81 Y204.733 E.00535
G1 X30.773 Y204.455 E.01012
G1 X30.773 Y148.497 E2.02041
G1 X30.822 Y148.179 E.01161
G1 X30.894 Y147.971 E.00794
G1 X30.96 Y147.854 E.00489
G1 X31.212 Y147.55 E.01425
G1 X31.419 Y147.404 E.00914
G1 X31.616 Y147.311 E.00786
G1 X31.758 Y147.268 E.00535
G1 X32.035 Y147.232 E.01012
G1 X117.993 Y147.232 E3.10359
G1 X118.309 Y147.28 E.01156
G1 X118.427 Y147.317 E.00446
G1 X118.729 Y147.477 E.01232
G1 X118.939 Y147.668 E.01024
G1 X119.087 Y147.877 E.00926
G1 X119.179 Y148.074 E.00785
G1 X119.222 Y148.216 E.00535
G1 X119.259 Y148.494 E.01012
G1 X119.259 Y203.02 E1.96873
M204 S3000
G1 X118.802 Y203.02 F15000
G1 F1500
M204 S250
M73 P52 R9
G1 X118.802 Y204.462 E.05206
G1 X118.759 Y204.692 E.00845
G1 X118.672 Y204.883 E.00759
G1 X118.543 Y205.036 E.0072
G1 X118.43 Y205.126 E.00525
G1 X118.213 Y205.228 E.00865
G1 X118.005 Y205.26 E.00758
G1 X32.028 Y205.26 E3.10429
G1 X31.798 Y205.218 E.00845
G1 X31.607 Y205.13 E.00759
G1 X31.455 Y205.002 E.0072
G1 X31.364 Y204.888 E.00525
G1 X31.262 Y204.671 E.00865
G1 X31.23 Y204.464 E.00758
G1 X31.23 Y148.487 E2.02111
G1 X31.273 Y148.253 E.00857
G1 X31.32 Y148.135 E.0046
G1 X31.489 Y147.913 E.01005
G1 X31.602 Y147.823 E.00525
G1 X31.819 Y147.721 E.00865
G1 X32.027 Y147.689 E.00758
G1 X118.004 Y147.689 E3.10429
G1 X118.234 Y147.731 E.00845
G1 X118.425 Y147.818 E.00759
G1 X118.577 Y147.947 E.0072
G1 X118.668 Y148.061 E.00525
G1 X118.77 Y148.277 E.00865
G1 X118.802 Y148.485 E.00758
G1 X118.802 Y202.96 E1.96688
M204 S3000
G1 X118.344 Y202.96 F15000
G1 F1500
M204 S250
G1 X118.344 Y204.474 E.05467
G1 X118.316 Y204.585 E.00413
G1 X118.269 Y204.67 E.0035
G1 X118.132 Y204.779 E.00632
G1 X118.016 Y204.803 E.00429
G1 X32.016 Y204.803 E3.10512
G1 X31.905 Y204.774 E.00413
G1 X31.821 Y204.727 E.0035
M73 P53 R9
G1 X31.712 Y204.591 E.00632
G1 X31.687 Y204.474 E.00429
G1 X31.687 Y148.474 E2.02194
G1 X31.716 Y148.364 E.00413
G1 X31.763 Y148.279 E.0035
G1 X31.9 Y148.17 E.00632
G1 X32.016 Y148.146 E.00429
G1 X118.016 Y148.146 E3.10512
G1 X118.127 Y148.174 E.00413
G1 X118.211 Y148.221 E.0035
G1 X118.32 Y148.358 E.00632
G1 X118.344 Y148.474 E.00429
G1 X118.344 Y202.9 E1.9651
; WIPE_START
G1 X118.344 Y204.474 E-.59822
G1 X118.316 Y204.585 E-.04342
G1 X118.269 Y204.67 E-.03679
G1 X118.132 Y204.779 E-.06647
G1 X118.093 Y204.787 E-.01511
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X117.616 Y204.074 Z.6 F15000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X32.416 Y204.074 E3.07623
G1 X32.416 Y148.874 E1.99305
G1 X117.616 Y148.874 E3.07623
G1 X117.616 Y204.014 E1.99089
M204 S3000
G1 X117.159 Y203.617 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X32.873 Y203.617 E3.04323
G1 X32.873 Y149.331 E1.96005
G1 X117.159 Y149.331 E3.04323
G1 X117.159 Y203.557 E1.95788
; WIPE_START
G1 X115.159 Y203.559 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X116.416 Y202.874 Z.6 F15000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X33.616 Y202.874 E2.98958
M73 P54 R9
G1 X33.616 Y150.074 E1.9064
G1 X116.416 Y150.074 E2.98958
G1 X116.416 Y202.814 E1.90423
M204 S3000
G1 X116.873 Y202.874 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X116.873 Y203.331 E.0165
G1 X33.159 Y203.331 E3.02258
G1 X33.159 Y149.617 E1.9394
G1 X116.873 Y149.617 E3.02258
G1 X116.873 Y202.814 E1.92073
; OBJECT_ID: 126
; WIPE_START
G1 X116.873 Y203.331 E-.19649
G1 X115.39 Y203.331 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
M204 S3000
G1 X115.508 Y195.7 Z.6 F15000
G1 X116.873 Y106.99 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F1500
M204 S250
G1 X31.831 Y106.99 E3.07053
G1 X31.343 Y106.944 E.0177
G1 X30.879 Y106.807 E.01745
G1 X30.605 Y106.677 E.01096
G1 X30.122 Y106.356 E.02093
M73 P55 R9
G1 X29.787 Y106.016 E.01724
G1 X29.522 Y105.618 E.01726
G1 X29.322 Y105.127 E.01917
G1 X29.206 Y104.359 E.02802
G1 X29.206 Y48.387 E2.02093
G1 X29.253 Y47.899 E.0177
G1 X29.389 Y47.436 E.01745
G1 X29.52 Y47.162 E.01096
G1 X29.84 Y46.679 E.02093
G1 X30.18 Y46.343 E.01724
G1 X30.578 Y46.078 E.01726
G1 X31.07 Y45.878 E.01917
G1 X31.837 Y45.763 E.02802
G1 X117.809 Y45.763 E3.10411
G1 X118.297 Y45.809 E.0177
M73 P56 R9
G1 X118.759 Y45.945 E.01739
G1 X119.117 Y46.121 E.01439
G1 X119.517 Y46.395 E.0175
G1 X119.853 Y46.737 E.0173
M73 P56 R8
G1 X120.118 Y47.134 E.01726
G1 X120.318 Y47.626 E.01917
G1 X120.434 Y48.394 E.02802
G1 X120.434 Y104.365 E2.02092
G1 X120.387 Y104.853 E.0177
G1 X120.251 Y105.317 E.01745
G1 X120.12 Y105.591 E.01096
G1 X119.8 Y106.074 E.02093
M73 P57 R8
G1 X119.46 Y106.41 E.01724
G1 X119.062 Y106.675 E.01726
G1 X118.57 Y106.875 E.01917
G1 X117.803 Y106.99 E.02802
G1 X116.933 Y106.99 E.03141
M204 S3000
G1 X116.933 Y106.533 F15000
G1 F1500
M204 S250
M73 P58 R8
G1 X31.859 Y106.533 E3.07167
G1 X31.443 Y106.494 E.01509
G1 X31.033 Y106.374 E.01542
G1 X30.823 Y106.272 E.00844
G1 X30.426 Y106.009 E.01718
G1 X30.136 Y105.715 E.01492
G1 X29.922 Y105.391 E.01403
G1 X29.772 Y105.02 E.01444
G1 X29.663 Y104.315 E.02576
G1 X29.663 Y48.416 E2.0183
G1 X29.702 Y48 E.01509
G1 X29.822 Y47.59 E.01542
M73 P59 R8
G1 X29.924 Y47.379 E.00844
G1 X30.187 Y46.983 E.01718
G1 X30.481 Y46.692 E.01492
G1 X30.806 Y46.479 E.01403
G1 X31.177 Y46.328 E.01444
G1 X31.882 Y46.22 E.02576
G1 X117.794 Y46.22 E3.10195
G1 X118.223 Y46.264 E.01556
G1 X118.603 Y46.378 E.01434
G1 X118.894 Y46.523 E.01172
G1 X119.211 Y46.74 E.01391
G1 X119.488 Y47.017 E.01413
G1 X119.705 Y47.338 E.01398
G1 X119.868 Y47.733 E.01544
G1 X119.977 Y48.438 E.02576
G1 X119.977 Y104.337 E2.01829
G1 X119.938 Y104.753 E.01509
G1 X119.818 Y105.163 E.01542
G1 X119.716 Y105.374 E.00844
G1 X119.453 Y105.77 E.01718
G1 X119.159 Y106.061 E.01492
G1 X118.834 Y106.274 E.01403
G1 X118.464 Y106.425 E.01444
G1 X117.758 Y106.533 E.02576
G1 X116.993 Y106.533 E.02764
M204 S3000
G1 X116.993 Y106.076 F15000
G1 F1500
M204 S250
G1 X31.887 Y106.076 E3.07283
G1 X31.517 Y106.039 E.01344
G1 X31.188 Y105.941 E.01241
G1 X31.042 Y105.869 E.00588
G1 X30.73 Y105.662 E.01351
G1 X30.485 Y105.415 E.01256
G1 X30.324 Y105.165 E.01075
G1 X30.221 Y104.912 E.00983
G1 X30.12 Y104.269 E.0235
G1 X30.12 Y48.444 E2.01565
G1 X30.157 Y48.073 E.01343
G1 X30.255 Y47.744 E.01241
M73 P60 R8
G1 X30.327 Y47.598 E.00588
G1 X30.534 Y47.286 E.01351
G1 X30.781 Y47.041 E.01256
G1 X31.032 Y46.88 E.01075
G1 X31.284 Y46.778 E.00983
G1 X31.927 Y46.677 E.0235
G1 X117.764 Y46.677 E3.09922
G1 X118.12 Y46.713 E.01292
G1 X118.445 Y46.81 E.01224
G1 X118.669 Y46.923 E.00908
G1 X118.907 Y47.086 E.01042
G1 X119.124 Y47.3 E.011
G1 X119.292 Y47.544 E.0107
G1 X119.419 Y47.842 E.01167
G1 X119.52 Y48.483 E.02346
G1 X119.52 Y104.309 E2.01564
G1 X119.483 Y104.679 E.01344
G1 X119.385 Y105.009 E.01241
G1 X119.313 Y105.155 E.00588
G1 X119.106 Y105.467 E.01351
G1 X118.859 Y105.711 E.01256
G1 X118.608 Y105.872 E.01075
G1 X118.356 Y105.975 E.00983
G1 X117.713 Y106.076 E.0235
G1 X117.053 Y106.076 E.02383
M204 S3000
G1 X117.053 Y105.619 F15000
G1 F1500
M204 S250
G1 X31.843 Y105.619 E3.07659
G1 X31.527 Y105.57 E.01156
G1 X31.409 Y105.533 E.00446
G1 X31.107 Y105.373 E.01232
G1 X30.897 Y105.183 E.01023
G1 X30.749 Y104.973 E.00926
G1 X30.657 Y104.776 E.00786
G1 X30.614 Y104.635 E.00535
G1 X30.577 Y104.357 E.01012
G1 X30.577 Y48.399 E2.02041
G1 X30.626 Y48.081 E.01161
G1 X30.698 Y47.874 E.00794
G1 X30.764 Y47.756 E.00489
G1 X31.016 Y47.452 E.01425
G1 X31.223 Y47.306 E.00914
G1 X31.42 Y47.213 E.00786
G1 X31.562 Y47.17 E.00535
G1 X31.839 Y47.134 E.01012
G1 X117.797 Y47.134 E3.10359
G1 X118.114 Y47.182 E.01156
G1 X118.231 Y47.219 E.00446
M73 P61 R8
G1 X118.533 Y47.379 E.01232
G1 X118.743 Y47.57 E.01024
G1 X118.891 Y47.779 E.00926
G1 X118.983 Y47.976 E.00785
G1 X119.026 Y48.118 E.00535
G1 X119.063 Y48.396 E.01012
G1 X119.063 Y104.353 E2.0204
G1 X119.014 Y104.67 E.01156
G1 X118.977 Y104.788 E.00446
G1 X118.817 Y105.089 E.01232
G1 X118.626 Y105.299 E.01024
G1 X118.417 Y105.447 E.00926
G1 X118.22 Y105.54 E.00785
G1 X118.078 Y105.583 E.00535
G1 X117.801 Y105.619 E.01012
G1 X117.113 Y105.619 E.02483
M204 S3000
G1 X117.113 Y105.162 F15000
G1 F1500
M204 S250
M73 P61 R7
G1 X31.832 Y105.162 E3.07914
G1 X31.602 Y105.12 E.00845
G1 X31.411 Y105.033 E.00759
G1 X31.259 Y104.904 E.0072
G1 X31.168 Y104.79 E.00525
G1 X31.066 Y104.573 E.00865
G1 X31.034 Y104.366 E.00758
G1 X31.034 Y48.389 E2.02111
G1 X31.077 Y48.155 E.00857
G1 X31.124 Y48.037 E.0046
G1 X31.293 Y47.815 E.01005
G1 X31.406 Y47.725 E.00525
G1 X31.623 Y47.623 E.00865
G1 X31.831 Y47.591 E.00758
G1 X117.808 Y47.591 E3.10429
G1 X118.038 Y47.633 E.00845
G1 X118.229 Y47.72 E.00759
G1 X118.381 Y47.849 E.0072
G1 X118.472 Y47.963 E.00525
G1 X118.574 Y48.18 E.00865
G1 X118.606 Y48.387 E.00758
M73 P62 R7
G1 X118.606 Y104.364 E2.02111
G1 X118.564 Y104.594 E.00845
G1 X118.476 Y104.785 E.00759
G1 X118.347 Y104.938 E.0072
G1 X118.234 Y105.028 E.00525
G1 X118.017 Y105.13 E.00865
G1 X117.809 Y105.162 E.00758
G1 X117.173 Y105.162 E.02298
M204 S3000
G1 X117.173 Y104.705 F15000
G1 F1500
M204 S250
G1 X31.82 Y104.705 E3.08176
G1 X31.709 Y104.676 E.00413
G1 X31.625 Y104.63 E.0035
G1 X31.516 Y104.493 E.00632
G1 X31.492 Y104.376 E.00429
G1 X31.492 Y48.376 E2.02194
G1 X31.52 Y48.266 E.00413
G1 X31.567 Y48.181 E.0035
G1 X31.704 Y48.072 E.00632
G1 X31.82 Y48.048 E.00429
G1 X117.82 Y48.048 E3.10512
G1 X117.931 Y48.076 E.00413
G1 X118.015 Y48.123 E.0035
G1 X118.124 Y48.26 E.00632
G1 X118.149 Y48.376 E.00429
G1 X118.149 Y104.376 E2.02194
G1 X118.12 Y104.487 E.00413
G1 X118.073 Y104.572 E.0035
G1 X117.936 Y104.681 E.00632
G1 X117.82 Y104.705 E.00429
G1 X117.233 Y104.705 E.0212
M204 S3000
G1 X117.42 Y103.976 F15000
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X32.22 Y103.976 E3.07623
G1 X32.22 Y48.776 E1.99305
G1 X117.42 Y48.776 E3.07623
G1 X117.42 Y103.916 E1.99089
M204 S3000
M73 P63 R7
G1 X116.963 Y103.519 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X32.677 Y103.519 E3.04323
G1 X32.677 Y49.233 E1.96005
G1 X116.963 Y49.233 E3.04323
G1 X116.963 Y103.459 E1.95788
; WIPE_START
G1 X114.963 Y103.461 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X116.22 Y102.776 Z.6 F15000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X33.42 Y102.776 E2.98958
G1 X33.42 Y49.976 E1.9064
G1 X116.22 Y49.976 E2.98958
G1 X116.22 Y102.716 E1.90423
M204 S3000
G1 X116.677 Y102.776 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X116.677 Y103.233 E.0165
G1 X32.963 Y103.233 E3.02258
G1 X32.963 Y49.519 E1.9394
G1 X116.677 Y49.519 E3.02258
G1 X116.677 Y102.716 E1.92073
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1500
G1 X116.677 Y103.233 E-.19649
G1 X115.194 Y103.233 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; layer num/total_layer_count: 2/5
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M104 S245 ; set nozzle temperature
M204 S5000
G17
G3 Z.6 I1.217 J0 P1  F15000
; object ids of layer 2 start: 104,115,126,161
M624 DwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer2 end: 104,115,126,161
M625
; OBJECT_ID: 161
; start printing object, unique label id: 161
M624 CAAAAAAAAAA=
G1 X226.492 Y103.356
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.45
G1 F9000
M73 P64 R7
G1 X226.492 Y103.748 E.01261
G1 X143.288 Y103.748 E2.67554
G1 X143.288 Y50.543 E1.71085
G1 X226.492 Y50.543 E2.67554
G1 X226.492 Y103.296 E1.69631
M204 S250
G1 X226.1 Y103.356 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X143.68 Y103.356 E2.45501
G1 X143.68 Y50.936 E1.56141
G1 X226.1 Y50.936 E2.45501
G1 X226.1 Y103.296 E1.55963
; WIPE_START
M204 S5000
G1 X224.1 Y103.297 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X227.288 Y104.543 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P65 R7
G1 X142.492 Y104.543 E2.72673
G1 X142.492 Y49.748 E1.76204
G1 X227.288 Y49.748 E2.72673
G1 X227.288 Y104.483 E1.76011
M204 S250
G1 X227.68 Y104.936 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
M73 P66 R7
G1 X142.1 Y104.936 E2.54914
G1 X142.1 Y49.356 E1.65554
G1 X227.68 Y49.356 E2.54914
G1 X227.68 Y104.876 E1.65375
; WIPE_START
M204 S5000
G1 X225.68 Y104.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X226.856 Y104.112 Z.8 F15000
G1 Z.4
M73 P66 R6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
M73 P67 R6
G1 X226.776 Y104.129 E.00278
; LINE_WIDTH: 0.448395
G1 X226.695 Y104.146 E.00263
; LINE_WIDTH: 0.43172
G1 X143.084 Y104.146 E2.5679
; LINE_WIDTH: 0.470635
G1 X142.923 Y104.112 E.00556
G1 X142.906 Y104.032 E.00278
; LINE_WIDTH: 0.448395
G1 X142.89 Y103.951 E.00263
; LINE_WIDTH: 0.431746
G1 X142.89 Y50.34 E1.64664
G1 X142.906 Y50.259 E.00253
; LINE_WIDTH: 0.481759
M73 P68 R6
G1 X142.923 Y50.179 E.00285
; LINE_WIDTH: 0.481745
G1 X143.004 Y50.162 E.00285
; LINE_WIDTH: 0.448395
G1 X143.084 Y50.146 E.00263
; LINE_WIDTH: 0.43172
G1 X226.695 Y50.146 E2.5679
; LINE_WIDTH: 0.470635
G1 X226.856 Y50.179 E.00556
G1 X226.873 Y50.259 E.00278
; LINE_WIDTH: 0.448395
G1 X226.89 Y50.34 E.00263
; LINE_WIDTH: 0.43172
G1 X226.89 Y103.951 E1.64653
; LINE_WIDTH: 0.470635
G1 X226.869 Y104.053 E.00353
; OBJECT_ID: 115
; WIPE_START
G1 X226.776 Y104.129 E-.04541
G1 X226.695 Y104.146 E-.03125
G1 X224.897 Y104.146 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 161
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X225.025 Y111.777 Z.8 F15000
G1 X226.557 Y203.13 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X226.557 Y203.522 E.01261
G1 X143.353 Y203.522 E2.67554
G1 X143.353 Y150.318 E1.71085
G1 X226.557 Y150.318 E2.67554
G1 X226.557 Y203.07 E1.69631
M204 S250
G1 X226.165 Y203.13 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X143.745 Y203.13 E2.45501
G1 X143.745 Y150.71 E1.56141
G1 X226.165 Y150.71 E2.45501
G1 X226.165 Y203.07 E1.55963
; WIPE_START
M204 S5000
G1 X224.165 Y203.071 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X227.353 Y204.318 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X142.557 Y204.318 E2.72673
G1 X142.557 Y149.522 E1.76204
G1 X227.353 Y149.522 E2.72673
G1 X227.353 Y204.258 E1.76011
M204 S250
G1 X227.745 Y204.71 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X142.165 Y204.71 E2.54914
G1 X142.165 Y149.13 E1.65554
G1 X227.745 Y149.13 E2.54914
G1 X227.745 Y204.65 E1.65375
; WIPE_START
M204 S5000
M73 P69 R6
G1 X225.745 Y204.651 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X226.922 Y203.887 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X226.841 Y203.903 E.00278
; LINE_WIDTH: 0.448395
G1 X226.761 Y203.92 E.00263
; LINE_WIDTH: 0.43172
G1 X143.15 Y203.92 E2.5679
; LINE_WIDTH: 0.470635
G1 X142.989 Y203.887 E.00556
G1 X142.972 Y203.806 E.00278
; LINE_WIDTH: 0.448395
G1 X142.955 Y203.726 E.00263
; LINE_WIDTH: 0.431746
G1 X142.955 Y150.114 E1.64664
G1 X142.972 Y150.034 E.00253
; LINE_WIDTH: 0.481759
G1 X142.989 Y149.953 E.00285
; LINE_WIDTH: 0.481745
G1 X143.069 Y149.937 E.00285
; LINE_WIDTH: 0.448395
G1 X143.15 Y149.92 E.00263
; LINE_WIDTH: 0.43172
G1 X226.761 Y149.92 E2.5679
; LINE_WIDTH: 0.470635
G1 X226.922 Y149.953 E.00556
G1 X226.938 Y150.034 E.00278
; LINE_WIDTH: 0.448395
G1 X226.955 Y150.114 E.00263
; LINE_WIDTH: 0.43172
G1 X226.955 Y203.726 E1.64653
; LINE_WIDTH: 0.470635
G1 X226.934 Y203.828 E.00353
; OBJECT_ID: 104
; WIPE_START
G1 X226.841 Y203.903 E-.04541
G1 X226.761 Y203.92 E-.03125
G1 X224.963 Y203.92 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
G1 X217.331 Y203.833 Z.8 F15000
G1 X116.618 Y202.684 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X116.618 Y203.076 E.01261
G1 X33.414 Y203.076 E2.67554
G1 X33.414 Y149.872 E1.71085
G1 X116.618 Y149.872 E2.67554
G1 X116.618 Y202.624 E1.69631
M204 S250
G1 X116.226 Y202.684 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X33.806 Y202.684 E2.45501
G1 X33.806 Y150.264 E1.56141
G1 X116.226 Y150.264 E2.45501
G1 X116.226 Y202.624 E1.55963
; WIPE_START
M204 S5000
G1 X114.226 Y202.626 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.414 Y203.872 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X32.618 Y203.872 E2.72673
G1 X32.618 Y149.076 E1.76204
G1 X117.414 Y149.076 E2.72673
G1 X117.414 Y203.812 E1.76011
M204 S250
G1 X117.806 Y204.264 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X32.226 Y204.264 E2.54914
G1 X32.226 Y148.684 E1.65554
G1 X117.806 Y148.684 E2.54914
G1 X117.806 Y204.204 E1.65375
; WIPE_START
M204 S5000
M73 P70 R6
G1 X115.806 Y204.206 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.983 Y203.441 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X116.902 Y203.458 E.00278
; LINE_WIDTH: 0.448395
G1 X116.822 Y203.474 E.00263
; LINE_WIDTH: 0.43172
G1 X33.21 Y203.474 E2.5679
; LINE_WIDTH: 0.470635
G1 X33.049 Y203.441 E.00556
G1 X33.033 Y203.36 E.00278
; LINE_WIDTH: 0.448395
G1 X33.016 Y203.28 E.00263
; LINE_WIDTH: 0.431746
G1 X33.016 Y149.669 E1.64664
G1 X33.033 Y149.588 E.00253
; LINE_WIDTH: 0.481759
G1 X33.049 Y149.508 E.00285
; LINE_WIDTH: 0.481745
G1 X33.13 Y149.491 E.00285
; LINE_WIDTH: 0.448395
G1 X33.21 Y149.474 E.00263
; LINE_WIDTH: 0.43172
G1 X116.822 Y149.474 E2.5679
; LINE_WIDTH: 0.470635
G1 X116.983 Y149.508 E.00556
G1 X116.999 Y149.588 E.00278
; LINE_WIDTH: 0.448395
G1 X117.016 Y149.669 E.00263
; LINE_WIDTH: 0.43172
G1 X117.016 Y203.28 E1.64653
; LINE_WIDTH: 0.470635
G1 X116.995 Y203.382 E.00353
; OBJECT_ID: 126
; WIPE_START
G1 X116.902 Y203.458 E-.04541
G1 X116.822 Y203.474 E-.03125
G1 X115.023 Y203.474 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X115.129 Y195.843 Z.8 F15000
G1 X116.422 Y102.586 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X116.422 Y102.978 E.01261
G1 X33.218 Y102.978 E2.67554
G1 X33.218 Y49.774 E1.71085
G1 X116.422 Y49.774 E2.67554
G1 X116.422 Y102.526 E1.69631
M204 S250
G1 X116.03 Y102.586 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X33.61 Y102.586 E2.45501
G1 X33.61 Y50.166 E1.56141
G1 X116.03 Y50.166 E2.45501
G1 X116.03 Y102.526 E1.55963
; WIPE_START
M204 S5000
G1 X114.03 Y102.528 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.218 Y103.774 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X32.422 Y103.774 E2.72673
M73 P71 R6
G1 X32.422 Y48.978 E1.76204
G1 X117.218 Y48.978 E2.72673
G1 X117.218 Y103.714 E1.76011
M204 S250
G1 X117.61 Y104.166 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X32.03 Y104.166 E2.54914
G1 X32.03 Y48.586 E1.65554
G1 X117.61 Y48.586 E2.54914
G1 X117.61 Y104.106 E1.65375
; WIPE_START
M204 S5000
G1 X115.61 Y104.108 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.787 Y103.343 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X116.706 Y103.36 E.00278
; LINE_WIDTH: 0.448395
G1 X116.626 Y103.376 E.00263
; LINE_WIDTH: 0.43172
G1 X33.014 Y103.376 E2.5679
; LINE_WIDTH: 0.470635
M73 P71 R5
G1 X32.853 Y103.343 E.00556
G1 X32.837 Y103.263 E.00278
; LINE_WIDTH: 0.448395
G1 X32.82 Y103.182 E.00263
; LINE_WIDTH: 0.431746
G1 X32.82 Y49.571 E1.64664
G1 X32.837 Y49.49 E.00253
; LINE_WIDTH: 0.481759
G1 X32.853 Y49.41 E.00285
; LINE_WIDTH: 0.481745
G1 X32.934 Y49.393 E.00285
; LINE_WIDTH: 0.448395
G1 X33.014 Y49.376 E.00263
; LINE_WIDTH: 0.43172
G1 X116.626 Y49.376 E2.5679
; LINE_WIDTH: 0.470635
G1 X116.787 Y49.41 E.00556
G1 X116.803 Y49.49 E.00278
; LINE_WIDTH: 0.448395
G1 X116.82 Y49.571 E.00263
; LINE_WIDTH: 0.43172
G1 X116.82 Y103.182 E1.64653
; LINE_WIDTH: 0.470635
G1 X116.799 Y103.284 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X116.706 Y103.36 E-.04541
G1 X116.626 Y103.376 E-.03125
G1 X114.827 Y103.376 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; layer num/total_layer_count: 3/5
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F15000
; object ids of layer 3 start: 104,115,126,161
M624 DwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer3 end: 104,115,126,161
M625
; OBJECT_ID: 161
; start printing object, unique label id: 161
M624 CAAAAAAAAAA=
G1 X226.492 Y103.356
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X226.492 Y103.748 E.01261
G1 X143.288 Y103.748 E2.67554
G1 X143.288 Y50.543 E1.71085
G1 X226.492 Y50.543 E2.67554
G1 X226.492 Y103.296 E1.69631
M204 S250
G1 X226.1 Y103.356 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X143.68 Y103.356 E2.45501
G1 X143.68 Y50.936 E1.56141
G1 X226.1 Y50.936 E2.45501
G1 X226.1 Y103.296 E1.55963
; WIPE_START
M204 S5000
G1 X224.1 Y103.297 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X227.288 Y104.543 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P72 R5
G1 F9000
G1 X142.492 Y104.543 E2.72673
G1 X142.492 Y49.748 E1.76204
G1 X227.288 Y49.748 E2.72673
G1 X227.288 Y104.483 E1.76011
M204 S250
G1 X227.68 Y104.936 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X142.1 Y104.936 E2.54914
G1 X142.1 Y49.356 E1.65554
G1 X227.68 Y49.356 E2.54914
G1 X227.68 Y104.876 E1.65375
; WIPE_START
M204 S5000
G1 X225.68 Y104.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X226.856 Y104.112 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X226.776 Y104.129 E.00278
; LINE_WIDTH: 0.448395
G1 X226.695 Y104.146 E.00263
; LINE_WIDTH: 0.43172
G1 X143.084 Y104.146 E2.5679
; LINE_WIDTH: 0.470635
G1 X142.923 Y104.112 E.00556
G1 X142.906 Y104.032 E.00278
; LINE_WIDTH: 0.448395
G1 X142.89 Y103.951 E.00263
; LINE_WIDTH: 0.431746
G1 X142.89 Y50.34 E1.64664
G1 X142.906 Y50.259 E.00253
; LINE_WIDTH: 0.481759
G1 X142.923 Y50.179 E.00285
; LINE_WIDTH: 0.481745
G1 X143.004 Y50.162 E.00285
; LINE_WIDTH: 0.448395
G1 X143.084 Y50.146 E.00263
; LINE_WIDTH: 0.43172
G1 X226.695 Y50.146 E2.5679
; LINE_WIDTH: 0.470635
G1 X226.856 Y50.179 E.00556
G1 X226.873 Y50.259 E.00278
; LINE_WIDTH: 0.448395
G1 X226.89 Y50.34 E.00263
; LINE_WIDTH: 0.43172
G1 X226.89 Y103.951 E1.64653
; LINE_WIDTH: 0.470635
G1 X226.869 Y104.053 E.00353
; OBJECT_ID: 115
; WIPE_START
G1 X226.776 Y104.129 E-.04541
G1 X226.695 Y104.146 E-.03125
G1 X224.897 Y104.146 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 161
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X225.025 Y111.777 Z1 F15000
G1 X226.557 Y203.13 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X226.557 Y203.522 E.01261
G1 X143.353 Y203.522 E2.67554
G1 X143.353 Y150.318 E1.71085
G1 X226.557 Y150.318 E2.67554
G1 X226.557 Y203.07 E1.69631
M204 S250
G1 X226.165 Y203.13 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X143.745 Y203.13 E2.45501
G1 X143.745 Y150.71 E1.56141
G1 X226.165 Y150.71 E2.45501
G1 X226.165 Y203.07 E1.55963
; WIPE_START
M204 S5000
G1 X224.165 Y203.071 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X227.353 Y204.318 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P73 R5
G1 X142.557 Y204.318 E2.72673
G1 X142.557 Y149.522 E1.76204
G1 X227.353 Y149.522 E2.72673
G1 X227.353 Y204.258 E1.76011
M204 S250
G1 X227.745 Y204.71 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X142.165 Y204.71 E2.54914
G1 X142.165 Y149.13 E1.65554
G1 X227.745 Y149.13 E2.54914
G1 X227.745 Y204.65 E1.65375
; WIPE_START
M204 S5000
G1 X225.745 Y204.651 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X226.922 Y203.887 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X226.841 Y203.903 E.00278
; LINE_WIDTH: 0.448395
G1 X226.761 Y203.92 E.00263
; LINE_WIDTH: 0.43172
G1 X143.15 Y203.92 E2.5679
; LINE_WIDTH: 0.470635
G1 X142.989 Y203.887 E.00556
G1 X142.972 Y203.806 E.00278
; LINE_WIDTH: 0.448395
G1 X142.955 Y203.726 E.00263
; LINE_WIDTH: 0.431746
G1 X142.955 Y150.114 E1.64664
G1 X142.972 Y150.034 E.00253
; LINE_WIDTH: 0.481759
G1 X142.989 Y149.953 E.00285
; LINE_WIDTH: 0.481745
G1 X143.069 Y149.937 E.00285
; LINE_WIDTH: 0.448395
G1 X143.15 Y149.92 E.00263
; LINE_WIDTH: 0.43172
G1 X226.761 Y149.92 E2.5679
; LINE_WIDTH: 0.470635
G1 X226.922 Y149.953 E.00556
G1 X226.938 Y150.034 E.00278
; LINE_WIDTH: 0.448395
G1 X226.955 Y150.114 E.00263
; LINE_WIDTH: 0.43172
G1 X226.955 Y203.726 E1.64653
; LINE_WIDTH: 0.470635
G1 X226.934 Y203.828 E.00353
; OBJECT_ID: 104
; WIPE_START
G1 X226.841 Y203.903 E-.04541
G1 X226.761 Y203.92 E-.03125
G1 X224.963 Y203.92 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
G1 X217.331 Y203.833 Z1 F15000
G1 X116.618 Y202.684 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X116.618 Y203.076 E.01261
G1 X33.414 Y203.076 E2.67554
G1 X33.414 Y149.872 E1.71085
G1 X116.618 Y149.872 E2.67554
G1 X116.618 Y202.624 E1.69631
M204 S250
G1 X116.226 Y202.684 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X33.806 Y202.684 E2.45501
G1 X33.806 Y150.264 E1.56141
G1 X116.226 Y150.264 E2.45501
G1 X116.226 Y202.624 E1.55963
; WIPE_START
M204 S5000
G1 X114.226 Y202.626 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.414 Y203.872 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P74 R5
G1 F9000
G1 X32.618 Y203.872 E2.72673
G1 X32.618 Y149.076 E1.76204
G1 X117.414 Y149.076 E2.72673
G1 X117.414 Y203.812 E1.76011
M204 S250
G1 X117.806 Y204.264 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X32.226 Y204.264 E2.54914
G1 X32.226 Y148.684 E1.65554
G1 X117.806 Y148.684 E2.54914
G1 X117.806 Y204.204 E1.65375
; WIPE_START
M204 S5000
G1 X115.806 Y204.206 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.983 Y203.441 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X116.902 Y203.458 E.00278
; LINE_WIDTH: 0.448395
G1 X116.822 Y203.474 E.00263
; LINE_WIDTH: 0.43172
G1 X33.21 Y203.474 E2.5679
; LINE_WIDTH: 0.470635
G1 X33.049 Y203.441 E.00556
G1 X33.033 Y203.36 E.00278
; LINE_WIDTH: 0.448395
G1 X33.016 Y203.28 E.00263
; LINE_WIDTH: 0.431746
G1 X33.016 Y149.669 E1.64664
G1 X33.033 Y149.588 E.00253
; LINE_WIDTH: 0.481759
G1 X33.049 Y149.508 E.00285
; LINE_WIDTH: 0.481745
G1 X33.13 Y149.491 E.00285
; LINE_WIDTH: 0.448395
G1 X33.21 Y149.474 E.00263
; LINE_WIDTH: 0.43172
G1 X116.822 Y149.474 E2.5679
; LINE_WIDTH: 0.470635
G1 X116.983 Y149.508 E.00556
G1 X116.999 Y149.588 E.00278
; LINE_WIDTH: 0.448395
G1 X117.016 Y149.669 E.00263
; LINE_WIDTH: 0.43172
G1 X117.016 Y203.28 E1.64653
; LINE_WIDTH: 0.470635
G1 X116.995 Y203.382 E.00353
; OBJECT_ID: 126
; WIPE_START
G1 X116.902 Y203.458 E-.04541
G1 X116.822 Y203.474 E-.03125
G1 X115.023 Y203.474 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X115.129 Y195.843 Z1 F15000
G1 X116.422 Y102.586 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X116.422 Y102.978 E.01261
G1 X33.218 Y102.978 E2.67554
G1 X33.218 Y49.774 E1.71085
G1 X116.422 Y49.774 E2.67554
G1 X116.422 Y102.526 E1.69631
M204 S250
G1 X116.03 Y102.586 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X33.61 Y102.586 E2.45501
G1 X33.61 Y50.166 E1.56141
G1 X116.03 Y50.166 E2.45501
G1 X116.03 Y102.526 E1.55963
; WIPE_START
M204 S5000
G1 X114.03 Y102.528 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.218 Y103.774 Z1 F15000
G1 Z.6
M73 P75 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X32.422 Y103.774 E2.72673
G1 X32.422 Y48.978 E1.76204
G1 X117.218 Y48.978 E2.72673
G1 X117.218 Y103.714 E1.76011
M204 S250
G1 X117.61 Y104.166 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X32.03 Y104.166 E2.54914
G1 X32.03 Y48.586 E1.65554
G1 X117.61 Y48.586 E2.54914
G1 X117.61 Y104.106 E1.65375
; WIPE_START
M204 S5000
G1 X115.61 Y104.108 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.787 Y103.343 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X116.706 Y103.36 E.00278
; LINE_WIDTH: 0.448395
G1 X116.626 Y103.376 E.00263
; LINE_WIDTH: 0.43172
G1 X33.014 Y103.376 E2.5679
; LINE_WIDTH: 0.470635
G1 X32.853 Y103.343 E.00556
G1 X32.837 Y103.263 E.00278
; LINE_WIDTH: 0.448395
G1 X32.82 Y103.182 E.00263
; LINE_WIDTH: 0.431746
G1 X32.82 Y49.571 E1.64664
G1 X32.837 Y49.49 E.00253
; LINE_WIDTH: 0.481759
G1 X32.853 Y49.41 E.00285
; LINE_WIDTH: 0.481745
G1 X32.934 Y49.393 E.00285
; LINE_WIDTH: 0.448395
G1 X33.014 Y49.376 E.00263
; LINE_WIDTH: 0.43172
G1 X116.626 Y49.376 E2.5679
; LINE_WIDTH: 0.470635
G1 X116.787 Y49.41 E.00556
G1 X116.803 Y49.49 E.00278
; LINE_WIDTH: 0.448395
G1 X116.82 Y49.571 E.00263
; LINE_WIDTH: 0.43172
G1 X116.82 Y103.182 E1.64653
; LINE_WIDTH: 0.470635
G1 X116.799 Y103.284 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X116.706 Y103.36 E-.04541
G1 X116.626 Y103.376 E-.03125
G1 X114.827 Y103.376 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; layer num/total_layer_count: 4/5
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S51
G17
G3 Z1 I1.217 J0 P1  F15000
; object ids of layer 4 start: 104,115,126,161
M624 DwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer4 end: 104,115,126,161
M625
; OBJECT_ID: 161
; start printing object, unique label id: 161
M624 CAAAAAAAAAA=
G1 X226.492 Y103.356
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X226.492 Y103.748 E.01261
G1 X143.288 Y103.748 E2.67554
G1 X143.288 Y50.543 E1.71085
G1 X226.492 Y50.543 E2.67554
G1 X226.492 Y103.296 E1.69631
M204 S250
G1 X226.1 Y103.356 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X143.68 Y103.356 E2.45501
G1 X143.68 Y50.936 E1.56141
G1 X226.1 Y50.936 E2.45501
G1 X226.1 Y103.296 E1.55963
; WIPE_START
M204 S5000
M73 P75 R4
G1 X224.1 Y103.297 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X227.288 Y104.543 Z1.2 F15000
M73 P76 R4
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X142.492 Y104.543 E2.72673
G1 X142.492 Y49.748 E1.76204
G1 X227.288 Y49.748 E2.72673
G1 X227.288 Y104.483 E1.76011
M204 S250
G1 X227.68 Y104.936 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X142.1 Y104.936 E2.54914
G1 X142.1 Y49.356 E1.65554
G1 X227.68 Y49.356 E2.54914
G1 X227.68 Y104.876 E1.65375
; WIPE_START
M204 S5000
G1 X225.68 Y104.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X226.856 Y104.112 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X226.776 Y104.129 E.00278
; LINE_WIDTH: 0.448395
G1 X226.695 Y104.146 E.00263
; LINE_WIDTH: 0.43172
G1 X143.084 Y104.146 E2.5679
; LINE_WIDTH: 0.470635
G1 X142.923 Y104.112 E.00556
G1 X142.906 Y104.032 E.00278
; LINE_WIDTH: 0.448395
G1 X142.89 Y103.951 E.00263
; LINE_WIDTH: 0.431746
G1 X142.89 Y50.34 E1.64664
G1 X142.906 Y50.259 E.00253
; LINE_WIDTH: 0.481759
G1 X142.923 Y50.179 E.00285
; LINE_WIDTH: 0.481745
G1 X143.004 Y50.162 E.00285
; LINE_WIDTH: 0.448395
G1 X143.084 Y50.146 E.00263
; LINE_WIDTH: 0.43172
G1 X226.695 Y50.146 E2.5679
; LINE_WIDTH: 0.470635
G1 X226.856 Y50.179 E.00556
G1 X226.873 Y50.259 E.00278
; LINE_WIDTH: 0.448395
G1 X226.89 Y50.34 E.00263
; LINE_WIDTH: 0.43172
G1 X226.89 Y103.951 E1.64653
; LINE_WIDTH: 0.470635
G1 X226.869 Y104.053 E.00353
; OBJECT_ID: 115
; WIPE_START
G1 X226.776 Y104.129 E-.04541
G1 X226.695 Y104.146 E-.03125
G1 X224.897 Y104.146 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 161
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X225.025 Y111.777 Z1.2 F15000
G1 X226.557 Y203.13 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X226.557 Y203.522 E.01261
G1 X143.353 Y203.522 E2.67554
G1 X143.353 Y150.318 E1.71085
G1 X226.557 Y150.318 E2.67554
G1 X226.557 Y203.07 E1.69631
M204 S250
G1 X226.165 Y203.13 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X143.745 Y203.13 E2.45501
G1 X143.745 Y150.71 E1.56141
G1 X226.165 Y150.71 E2.45501
G1 X226.165 Y203.07 E1.55963
; WIPE_START
M204 S5000
G1 X224.165 Y203.071 E-.76
; WIPE_END
M73 P77 R4
G1 E-.04 F1800
G1 X227.353 Y204.318 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X142.557 Y204.318 E2.72673
G1 X142.557 Y149.522 E1.76204
G1 X227.353 Y149.522 E2.72673
G1 X227.353 Y204.258 E1.76011
M204 S250
G1 X227.745 Y204.71 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X142.165 Y204.71 E2.54914
G1 X142.165 Y149.13 E1.65554
G1 X227.745 Y149.13 E2.54914
G1 X227.745 Y204.65 E1.65375
; WIPE_START
M204 S5000
G1 X225.745 Y204.651 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X226.922 Y203.887 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X226.841 Y203.903 E.00278
; LINE_WIDTH: 0.448395
G1 X226.761 Y203.92 E.00263
; LINE_WIDTH: 0.43172
G1 X143.15 Y203.92 E2.5679
; LINE_WIDTH: 0.470635
G1 X142.989 Y203.887 E.00556
G1 X142.972 Y203.806 E.00278
; LINE_WIDTH: 0.448395
G1 X142.955 Y203.726 E.00263
; LINE_WIDTH: 0.431746
G1 X142.955 Y150.114 E1.64664
G1 X142.972 Y150.034 E.00253
; LINE_WIDTH: 0.481759
G1 X142.989 Y149.953 E.00285
; LINE_WIDTH: 0.481745
G1 X143.069 Y149.937 E.00285
; LINE_WIDTH: 0.448395
G1 X143.15 Y149.92 E.00263
; LINE_WIDTH: 0.43172
G1 X226.761 Y149.92 E2.5679
; LINE_WIDTH: 0.470635
G1 X226.922 Y149.953 E.00556
G1 X226.938 Y150.034 E.00278
; LINE_WIDTH: 0.448395
G1 X226.955 Y150.114 E.00263
; LINE_WIDTH: 0.43172
G1 X226.955 Y203.726 E1.64653
; LINE_WIDTH: 0.470635
G1 X226.934 Y203.828 E.00353
; OBJECT_ID: 104
; WIPE_START
G1 X226.841 Y203.903 E-.04541
G1 X226.761 Y203.92 E-.03125
G1 X224.963 Y203.92 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
G1 X217.331 Y203.833 Z1.2 F15000
G1 X116.618 Y202.684 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X116.618 Y203.076 E.01261
G1 X33.414 Y203.076 E2.67554
G1 X33.414 Y149.872 E1.71085
G1 X116.618 Y149.872 E2.67554
G1 X116.618 Y202.624 E1.69631
M204 S250
G1 X116.226 Y202.684 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X33.806 Y202.684 E2.45501
G1 X33.806 Y150.264 E1.56141
G1 X116.226 Y150.264 E2.45501
G1 X116.226 Y202.624 E1.55963
; WIPE_START
M204 S5000
M73 P78 R4
G1 X114.226 Y202.626 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.414 Y203.872 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X32.618 Y203.872 E2.72673
G1 X32.618 Y149.076 E1.76204
G1 X117.414 Y149.076 E2.72673
G1 X117.414 Y203.812 E1.76011
M204 S250
G1 X117.806 Y204.264 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X32.226 Y204.264 E2.54914
G1 X32.226 Y148.684 E1.65554
G1 X117.806 Y148.684 E2.54914
G1 X117.806 Y204.204 E1.65375
; WIPE_START
M204 S5000
G1 X115.806 Y204.206 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.983 Y203.441 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X116.902 Y203.458 E.00278
; LINE_WIDTH: 0.448395
G1 X116.822 Y203.474 E.00263
; LINE_WIDTH: 0.43172
G1 X33.21 Y203.474 E2.5679
; LINE_WIDTH: 0.470635
G1 X33.049 Y203.441 E.00556
G1 X33.033 Y203.36 E.00278
; LINE_WIDTH: 0.448395
G1 X33.016 Y203.28 E.00263
; LINE_WIDTH: 0.431746
G1 X33.016 Y149.669 E1.64664
G1 X33.033 Y149.588 E.00253
; LINE_WIDTH: 0.481759
G1 X33.049 Y149.508 E.00285
; LINE_WIDTH: 0.481745
G1 X33.13 Y149.491 E.00285
; LINE_WIDTH: 0.448395
G1 X33.21 Y149.474 E.00263
; LINE_WIDTH: 0.43172
G1 X116.822 Y149.474 E2.5679
; LINE_WIDTH: 0.470635
G1 X116.983 Y149.508 E.00556
G1 X116.999 Y149.588 E.00278
; LINE_WIDTH: 0.448395
G1 X117.016 Y149.669 E.00263
; LINE_WIDTH: 0.43172
G1 X117.016 Y203.28 E1.64653
; LINE_WIDTH: 0.470635
G1 X116.995 Y203.382 E.00353
; OBJECT_ID: 126
; WIPE_START
G1 X116.902 Y203.458 E-.04541
G1 X116.822 Y203.474 E-.03125
G1 X115.023 Y203.474 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X115.129 Y195.843 Z1.2 F15000
G1 X116.422 Y102.586 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X116.422 Y102.978 E.01261
G1 X33.218 Y102.978 E2.67554
G1 X33.218 Y49.774 E1.71085
G1 X116.422 Y49.774 E2.67554
G1 X116.422 Y102.526 E1.69631
M204 S250
G1 X116.03 Y102.586 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X33.61 Y102.586 E2.45501
G1 X33.61 Y50.166 E1.56141
G1 X116.03 Y50.166 E2.45501
M73 P79 R4
G1 X116.03 Y102.526 E1.55963
; WIPE_START
M204 S5000
G1 X114.03 Y102.528 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.218 Y103.774 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X32.422 Y103.774 E2.72673
G1 X32.422 Y48.978 E1.76204
G1 X117.218 Y48.978 E2.72673
G1 X117.218 Y103.714 E1.76011
M204 S250
G1 X117.61 Y104.166 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X32.03 Y104.166 E2.54914
G1 X32.03 Y48.586 E1.65554
G1 X117.61 Y48.586 E2.54914
G1 X117.61 Y104.106 E1.65375
; WIPE_START
M204 S5000
G1 X115.61 Y104.108 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.787 Y103.343 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X116.706 Y103.36 E.00278
; LINE_WIDTH: 0.448395
G1 X116.626 Y103.376 E.00263
; LINE_WIDTH: 0.43172
G1 X33.014 Y103.376 E2.5679
; LINE_WIDTH: 0.470635
G1 X32.853 Y103.343 E.00556
G1 X32.837 Y103.263 E.00278
; LINE_WIDTH: 0.448395
G1 X32.82 Y103.182 E.00263
; LINE_WIDTH: 0.431746
G1 X32.82 Y49.571 E1.64664
G1 X32.837 Y49.49 E.00253
; LINE_WIDTH: 0.481759
G1 X32.853 Y49.41 E.00285
; LINE_WIDTH: 0.481745
G1 X32.934 Y49.393 E.00285
; LINE_WIDTH: 0.448395
G1 X33.014 Y49.376 E.00263
; LINE_WIDTH: 0.43172
G1 X116.626 Y49.376 E2.5679
; LINE_WIDTH: 0.470635
G1 X116.787 Y49.41 E.00556
G1 X116.803 Y49.49 E.00278
; LINE_WIDTH: 0.448395
G1 X116.82 Y49.571 E.00263
; LINE_WIDTH: 0.43172
G1 X116.82 Y103.182 E1.64653
; LINE_WIDTH: 0.470635
G1 X116.799 Y103.284 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X116.706 Y103.36 E-.04541
G1 X116.626 Y103.376 E-.03125
G1 X114.827 Y103.376 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 126
M625
; layer num/total_layer_count: 5/5
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F15000
; object ids of layer 5 start: 104,115,126,161
M624 DwAAAAAAAAA=
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; object ids of this layer5 end: 104,115,126,161
M625
; OBJECT_ID: 161
; start printing object, unique label id: 161
M624 CAAAAAAAAAA=
G1 X226.1 Y103.356
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X143.68 Y103.356 E2.45501
G1 X143.68 Y50.936 E1.56141
G1 X226.1 Y50.936 E2.45501
G1 X226.1 Y103.296 E1.55963
; WIPE_START
M204 S5000
G1 X224.1 Y103.297 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X227.68 Y104.936 Z1.4 F15000
G1 Z1
M73 P80 R4
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X142.1 Y104.936 E2.54914
G1 X142.1 Y49.356 E1.65554
G1 X227.68 Y49.356 E2.54914
G1 X227.68 Y104.876 E1.65375
; WIPE_START
M204 S5000
G1 X225.68 Y104.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X225.93 Y97.249 Z1.4 F15000
G1 X227.472 Y50.138 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X226.897 Y49.563 E.02423
G1 X226.364 Y49.563
G1 X227.472 Y50.671 E.04669
G1 X227.472 Y51.205
G1 X225.831 Y49.563 E.06916
G1 X225.297 Y49.563
G1 X227.472 Y51.738 E.09162
G1 X227.472 Y52.271
G1 X226.307 Y51.106 E.04909
G1 X226.307 Y51.639
G1 X227.472 Y52.804 E.04909
G1 X227.472 Y53.338
G1 X226.307 Y52.172 E.04909
G1 X226.307 Y52.706
G1 X227.472 Y53.871 E.04909
G1 X227.472 Y54.404
G1 X226.307 Y53.239 E.04909
G1 X226.307 Y53.772
G1 X227.472 Y54.937 E.04909
G1 X227.472 Y55.471
G1 X226.307 Y54.305 E.04909
G1 X226.307 Y54.839
G1 X227.472 Y56.004 E.04909
G1 X227.472 Y56.537
G1 X226.307 Y55.372 E.04909
G1 X226.307 Y55.905
G1 X227.472 Y57.07 E.04909
G1 X227.472 Y57.604
G1 X226.307 Y56.438 E.04909
G1 X226.307 Y56.972
G1 X227.472 Y58.137 E.04909
G1 X227.472 Y58.67
M73 P80 R3
G1 X226.307 Y57.505 E.04909
G1 X226.307 Y58.038
G1 X227.472 Y59.203 E.04909
G1 X227.472 Y59.737
G1 X226.307 Y58.571 E.04909
G1 X226.307 Y59.105
G1 X227.472 Y60.27 E.04909
G1 X227.472 Y60.803
G1 X226.307 Y59.638 E.04909
G1 X226.307 Y60.171
M73 P81 R3
G1 X227.472 Y61.337 E.04909
G1 X227.472 Y61.87
G1 X226.307 Y60.705 E.04909
G1 X226.307 Y61.238
G1 X227.472 Y62.403 E.04909
G1 X227.472 Y62.936
G1 X226.307 Y61.771 E.04909
G1 X226.307 Y62.304
G1 X227.472 Y63.47 E.04909
G1 X227.472 Y64.003
G1 X226.307 Y62.838 E.04909
G1 X226.307 Y63.371
G1 X227.472 Y64.536 E.04909
G1 X227.472 Y65.069
G1 X226.307 Y63.904 E.04909
G1 X226.307 Y64.437
G1 X227.472 Y65.603 E.04909
G1 X227.472 Y66.136
G1 X226.307 Y64.971 E.04909
G1 X226.307 Y65.504
G1 X227.472 Y66.669 E.04909
G1 X227.472 Y67.202
G1 X226.307 Y66.037 E.04909
G1 X226.307 Y66.57
G1 X227.472 Y67.736 E.04909
G1 X227.472 Y68.269
G1 X226.307 Y67.104 E.04909
G1 X226.307 Y67.637
G1 X227.472 Y68.802 E.04909
G1 X227.472 Y69.335
G1 X226.307 Y68.17 E.04909
G1 X226.307 Y68.703
G1 X227.472 Y69.869 E.04909
G1 X227.472 Y70.402
G1 X226.307 Y69.237 E.04909
G1 X226.307 Y69.77
G1 X227.472 Y70.935 E.04909
G1 X227.472 Y71.468
G1 X226.307 Y70.303 E.04909
G1 X226.307 Y70.836
G1 X227.472 Y72.002 E.04909
G1 X227.472 Y72.535
G1 X226.307 Y71.37 E.04909
G1 X226.307 Y71.903
G1 X227.472 Y73.068 E.04909
G1 X227.472 Y73.601
G1 X226.307 Y72.436 E.04909
G1 X226.307 Y72.969
G1 X227.472 Y74.135 E.04909
G1 X227.472 Y74.668
G1 X226.307 Y73.503 E.04909
G1 X226.307 Y74.036
G1 X227.472 Y75.201 E.04909
G1 X227.472 Y75.734
G1 X226.307 Y74.569 E.04909
G1 X226.307 Y75.102
G1 X227.472 Y76.268 E.04909
G1 X227.472 Y76.801
G1 X226.307 Y75.636 E.04909
G1 X226.307 Y76.169
G1 X227.472 Y77.334 E.04909
G1 X227.472 Y77.867
G1 X226.307 Y76.702 E.04909
G1 X226.307 Y77.236
G1 X227.472 Y78.401 E.04909
G1 X227.472 Y78.934
G1 X226.307 Y77.769 E.04909
G1 X226.307 Y78.302
G1 X227.472 Y79.467 E.04909
G1 X227.472 Y80.001
G1 X226.307 Y78.835 E.04909
G1 X226.307 Y79.369
G1 X227.472 Y80.534 E.04909
G1 X227.472 Y81.067
G1 X226.307 Y79.902 E.04909
G1 X226.307 Y80.435
G1 X227.472 Y81.6 E.04909
G1 X227.472 Y82.134
G1 X226.307 Y80.968 E.04909
G1 X226.307 Y81.502
G1 X227.472 Y82.667 E.04909
G1 X227.472 Y83.2
G1 X226.307 Y82.035 E.04909
G1 X226.307 Y82.568
G1 X227.472 Y83.733 E.04909
G1 X227.472 Y84.267
G1 X226.307 Y83.101 E.04909
G1 X226.307 Y83.635
G1 X227.472 Y84.8 E.04909
G1 X227.472 Y85.333
G1 X226.307 Y84.168 E.04909
G1 X226.307 Y84.701
G1 X227.472 Y85.866 E.04909
G1 X227.472 Y86.4
G1 X226.307 Y85.234 E.04909
G1 X226.307 Y85.768
G1 X227.472 Y86.933 E.04909
G1 X227.472 Y87.466
G1 X226.307 Y86.301 E.04909
G1 X226.307 Y86.834
G1 X227.472 Y87.999 E.04909
G1 X227.472 Y88.533
G1 X226.307 Y87.367 E.04909
G1 X226.307 Y87.901
G1 X227.472 Y89.066 E.04909
G1 X227.472 Y89.599
G1 X226.307 Y88.434 E.04909
G1 X226.307 Y88.967
G1 X227.472 Y90.132 E.04909
G1 X227.472 Y90.666
G1 X226.307 Y89.5 E.04909
G1 X226.307 Y90.034
G1 X227.472 Y91.199 E.04909
G1 X227.472 Y91.732
G1 X226.307 Y90.567 E.04909
G1 X226.307 Y91.1
G1 X227.472 Y92.265 E.04909
G1 X227.472 Y92.799
G1 X226.307 Y91.633 E.04909
G1 X226.307 Y92.167
G1 X227.472 Y93.332 E.04909
G1 X227.472 Y93.865
G1 X226.307 Y92.7 E.04909
G1 X226.307 Y93.233
G1 X227.472 Y94.398 E.04909
G1 X227.472 Y94.932
G1 X226.307 Y93.766 E.04909
G1 X226.307 Y94.3
G1 X227.472 Y95.465 E.04909
G1 X227.472 Y95.998
G1 X226.307 Y94.833 E.04909
G1 X226.307 Y95.366
G1 X227.472 Y96.532 E.04909
G1 X227.472 Y97.065
G1 X226.307 Y95.9 E.04909
G1 X226.307 Y96.433
G1 X227.472 Y97.598 E.04909
G1 X227.472 Y98.131
G1 X226.307 Y96.966 E.04909
G1 X226.307 Y97.499
G1 X227.472 Y98.665 E.04909
G1 X227.472 Y99.198
G1 X226.307 Y98.033 E.04909
G1 X226.307 Y98.566
G1 X227.472 Y99.731 E.04909
G1 X227.472 Y100.264
G1 X226.307 Y99.099 E.04909
G1 X226.307 Y99.632
G1 X227.472 Y100.798 E.04909
G1 X227.472 Y101.331
G1 X226.307 Y100.166 E.04909
G1 X226.307 Y100.699
G1 X227.472 Y101.864 E.04909
G1 X227.472 Y102.397
G1 X226.307 Y101.232 E.04909
G1 X226.307 Y101.765
G1 X227.472 Y102.931 E.04909
G1 X227.472 Y103.464
G1 X226.307 Y102.299 E.04909
G1 X226.307 Y102.832
G1 X227.472 Y103.997 E.04909
G1 X227.472 Y104.53
G1 X226.307 Y103.365 E.04909
G1 X225.972 Y103.563
G1 X227.137 Y104.728 E.04909
G1 X226.604 Y104.728
G1 X225.438 Y103.563 E.04909
G1 X224.905 Y103.563
G1 X226.07 Y104.728 E.04909
G1 X225.537 Y104.728
G1 X224.372 Y103.563 E.04909
G1 X223.839 Y103.563
G1 X225.004 Y104.728 E.04909
G1 X224.471 Y104.728
G1 X223.305 Y103.563 E.04909
G1 X222.772 Y103.563
G1 X223.937 Y104.728 E.04909
G1 X223.404 Y104.728
G1 X222.239 Y103.563 E.04909
G1 X221.706 Y103.563
G1 X222.871 Y104.728 E.04909
G1 X222.338 Y104.728
G1 X221.172 Y103.563 E.04909
G1 X220.639 Y103.563
G1 X221.804 Y104.728 E.04909
G1 X221.271 Y104.728
G1 X220.106 Y103.563 E.04909
G1 X219.573 Y103.563
G1 X220.738 Y104.728 E.04909
G1 X220.205 Y104.728
G1 X219.039 Y103.563 E.04909
G1 X218.506 Y103.563
G1 X219.671 Y104.728 E.04909
G1 X219.138 Y104.728
G1 X217.973 Y103.563 E.04909
G1 X217.44 Y103.563
G1 X218.605 Y104.728 E.04909
G1 X218.072 Y104.728
G1 X216.906 Y103.563 E.04909
G1 X216.373 Y103.563
G1 X217.538 Y104.728 E.04909
G1 X217.005 Y104.728
G1 X215.84 Y103.563 E.04909
G1 X215.306 Y103.563
G1 X216.472 Y104.728 E.04909
G1 X215.938 Y104.728
G1 X214.773 Y103.563 E.04909
G1 X214.24 Y103.563
G1 X215.405 Y104.728 E.04909
G1 X214.872 Y104.728
G1 X213.707 Y103.563 E.04909
G1 X213.173 Y103.563
G1 X214.339 Y104.728 E.04909
G1 X213.805 Y104.728
G1 X212.64 Y103.563 E.04909
G1 X212.107 Y103.563
G1 X213.272 Y104.728 E.04909
G1 X212.739 Y104.728
G1 X211.574 Y103.563 E.04909
G1 X211.04 Y103.563
G1 X212.206 Y104.728 E.04909
G1 X211.672 Y104.728
G1 X210.507 Y103.563 E.04909
G1 X209.974 Y103.563
G1 X211.139 Y104.728 E.04909
G1 X210.606 Y104.728
G1 X209.441 Y103.563 E.04909
G1 X208.907 Y103.563
G1 X210.073 Y104.728 E.04909
G1 X209.539 Y104.728
G1 X208.374 Y103.563 E.04909
G1 X207.841 Y103.563
G1 X209.006 Y104.728 E.04909
G1 X208.473 Y104.728
G1 X207.308 Y103.563 E.04909
G1 X206.774 Y103.563
G1 X207.94 Y104.728 E.04909
G1 X207.406 Y104.728
G1 X206.241 Y103.563 E.04909
G1 X205.708 Y103.563
G1 X206.873 Y104.728 E.04909
G1 X206.34 Y104.728
G1 X205.175 Y103.563 E.04909
G1 X204.641 Y103.563
G1 X205.807 Y104.728 E.04909
M73 P82 R3
G1 X205.273 Y104.728
G1 X204.108 Y103.563 E.04909
G1 X203.575 Y103.563
G1 X204.74 Y104.728 E.04909
G1 X204.207 Y104.728
G1 X203.042 Y103.563 E.04909
G1 X202.508 Y103.563
G1 X203.674 Y104.728 E.04909
G1 X203.14 Y104.728
G1 X201.975 Y103.563 E.04909
G1 X201.442 Y103.563
G1 X202.607 Y104.728 E.04909
G1 X202.074 Y104.728
G1 X200.909 Y103.563 E.04909
G1 X200.375 Y103.563
G1 X201.541 Y104.728 E.04909
G1 X201.007 Y104.728
G1 X199.842 Y103.563 E.04909
G1 X199.309 Y103.563
G1 X200.474 Y104.728 E.04909
G1 X199.941 Y104.728
G1 X198.776 Y103.563 E.04909
G1 X198.242 Y103.563
G1 X199.408 Y104.728 E.04909
G1 X198.874 Y104.728
G1 X197.709 Y103.563 E.04909
G1 X197.176 Y103.563
G1 X198.341 Y104.728 E.04909
G1 X197.808 Y104.728
G1 X196.642 Y103.563 E.04909
G1 X196.109 Y103.563
G1 X197.274 Y104.728 E.04909
G1 X196.741 Y104.728
G1 X195.576 Y103.563 E.04909
G1 X195.043 Y103.563
G1 X196.208 Y104.728 E.04909
G1 X195.675 Y104.728
G1 X194.509 Y103.563 E.04909
G1 X193.976 Y103.563
G1 X195.141 Y104.728 E.04909
G1 X194.608 Y104.728
G1 X193.443 Y103.563 E.04909
G1 X192.91 Y103.563
G1 X194.075 Y104.728 E.04909
G1 X193.542 Y104.728
G1 X192.376 Y103.563 E.04909
G1 X191.843 Y103.563
G1 X193.008 Y104.728 E.04909
G1 X192.475 Y104.728
G1 X191.31 Y103.563 E.04909
G1 X190.777 Y103.563
G1 X191.942 Y104.728 E.04909
G1 X191.409 Y104.728
G1 X190.243 Y103.563 E.04909
G1 X189.71 Y103.563
G1 X190.875 Y104.728 E.04909
G1 X190.342 Y104.728
G1 X189.177 Y103.563 E.04909
G1 X188.644 Y103.563
G1 X189.809 Y104.728 E.04909
G1 X189.276 Y104.728
G1 X188.11 Y103.563 E.04909
G1 X187.577 Y103.563
G1 X188.742 Y104.728 E.04909
G1 X188.209 Y104.728
G1 X187.044 Y103.563 E.04909
G1 X186.511 Y103.563
G1 X187.676 Y104.728 E.04909
G1 X187.143 Y104.728
G1 X185.977 Y103.563 E.04909
G1 X185.444 Y103.563
G1 X186.609 Y104.728 E.04909
G1 X186.076 Y104.728
G1 X184.911 Y103.563 E.04909
G1 X184.378 Y103.563
G1 X185.543 Y104.728 E.04909
G1 X185.01 Y104.728
G1 X183.844 Y103.563 E.04909
G1 X183.311 Y103.563
G1 X184.476 Y104.728 E.04909
G1 X183.943 Y104.728
G1 X182.778 Y103.563 E.04909
G1 X182.245 Y103.563
G1 X183.41 Y104.728 E.04909
G1 X182.877 Y104.728
G1 X181.711 Y103.563 E.04909
G1 X181.178 Y103.563
G1 X182.343 Y104.728 E.04909
G1 X181.81 Y104.728
G1 X180.645 Y103.563 E.04909
G1 X180.111 Y103.563
G1 X181.277 Y104.728 E.04909
G1 X180.743 Y104.728
G1 X179.578 Y103.563 E.04909
G1 X179.045 Y103.563
G1 X180.21 Y104.728 E.04909
G1 X179.677 Y104.728
G1 X178.512 Y103.563 E.04909
G1 X177.978 Y103.563
G1 X179.144 Y104.728 E.04909
G1 X178.61 Y104.728
G1 X177.445 Y103.563 E.04909
G1 X176.912 Y103.563
G1 X178.077 Y104.728 E.04909
G1 X177.544 Y104.728
G1 X176.379 Y103.563 E.04909
G1 X175.845 Y103.563
G1 X177.011 Y104.728 E.04909
G1 X176.477 Y104.728
G1 X175.312 Y103.563 E.04909
G1 X174.779 Y103.563
G1 X175.944 Y104.728 E.04909
G1 X175.411 Y104.728
G1 X174.246 Y103.563 E.04909
G1 X173.712 Y103.563
G1 X174.878 Y104.728 E.04909
G1 X174.344 Y104.728
G1 X173.179 Y103.563 E.04909
G1 X172.646 Y103.563
G1 X173.811 Y104.728 E.04909
G1 X173.278 Y104.728
G1 X172.113 Y103.563 E.04909
G1 X171.579 Y103.563
G1 X172.745 Y104.728 E.04909
G1 X172.211 Y104.728
G1 X171.046 Y103.563 E.04909
G1 X170.513 Y103.563
G1 X171.678 Y104.728 E.04909
G1 X171.145 Y104.728
G1 X169.98 Y103.563 E.04909
G1 X169.446 Y103.563
G1 X170.612 Y104.728 E.04909
G1 X170.078 Y104.728
G1 X168.913 Y103.563 E.04909
G1 X168.38 Y103.563
G1 X169.545 Y104.728 E.04909
G1 X169.012 Y104.728
G1 X167.847 Y103.563 E.04909
G1 X167.313 Y103.563
G1 X168.479 Y104.728 E.04909
G1 X167.945 Y104.728
G1 X166.78 Y103.563 E.04909
G1 X166.247 Y103.563
G1 X167.412 Y104.728 E.04909
G1 X166.879 Y104.728
G1 X165.714 Y103.563 E.04909
G1 X165.18 Y103.563
G1 X166.346 Y104.728 E.04909
G1 X165.812 Y104.728
G1 X164.647 Y103.563 E.04909
G1 X164.114 Y103.563
G1 X165.279 Y104.728 E.04909
G1 X164.746 Y104.728
G1 X163.581 Y103.563 E.04909
G1 X163.047 Y103.563
G1 X164.213 Y104.728 E.04909
G1 X163.679 Y104.728
G1 X162.514 Y103.563 E.04909
G1 X161.981 Y103.563
G1 X163.146 Y104.728 E.04909
G1 X162.613 Y104.728
G1 X161.447 Y103.563 E.04909
G1 X160.914 Y103.563
G1 X162.079 Y104.728 E.04909
G1 X161.546 Y104.728
G1 X160.381 Y103.563 E.04909
G1 X159.848 Y103.563
G1 X161.013 Y104.728 E.04909
G1 X160.48 Y104.728
G1 X159.314 Y103.563 E.04909
G1 X158.781 Y103.563
G1 X159.946 Y104.728 E.04909
G1 X159.413 Y104.728
G1 X158.248 Y103.563 E.04909
G1 X157.715 Y103.563
G1 X158.88 Y104.728 E.04909
G1 X158.347 Y104.728
G1 X157.181 Y103.563 E.04909
G1 X156.648 Y103.563
G1 X157.813 Y104.728 E.04909
G1 X157.28 Y104.728
G1 X156.115 Y103.563 E.04909
G1 X155.582 Y103.563
G1 X156.747 Y104.728 E.04909
G1 X156.214 Y104.728
G1 X155.048 Y103.563 E.04909
G1 X154.515 Y103.563
G1 X155.68 Y104.728 E.04909
G1 X155.147 Y104.728
G1 X153.982 Y103.563 E.04909
G1 X153.449 Y103.563
G1 X154.614 Y104.728 E.04909
G1 X154.081 Y104.728
G1 X152.915 Y103.563 E.04909
G1 X152.382 Y103.563
G1 X153.547 Y104.728 E.04909
G1 X153.014 Y104.728
G1 X151.849 Y103.563 E.04909
G1 X151.316 Y103.563
G1 X152.481 Y104.728 E.04909
G1 X151.948 Y104.728
G1 X150.782 Y103.563 E.04909
G1 X150.249 Y103.563
G1 X151.414 Y104.728 E.04909
G1 X150.881 Y104.728
G1 X149.716 Y103.563 E.04909
G1 X149.183 Y103.563
G1 X150.348 Y104.728 E.04909
G1 X149.815 Y104.728
G1 X148.649 Y103.563 E.04909
G1 X148.116 Y103.563
G1 X149.281 Y104.728 E.04909
G1 X148.748 Y104.728
G1 X147.583 Y103.563 E.04909
G1 X147.05 Y103.563
G1 X148.215 Y104.728 E.04909
G1 X147.682 Y104.728
G1 X146.516 Y103.563 E.04909
G1 X145.983 Y103.563
G1 X147.148 Y104.728 E.04909
G1 X146.615 Y104.728
G1 X145.45 Y103.563 E.04909
G1 X144.917 Y103.563
G1 X146.082 Y104.728 E.04909
G1 X145.548 Y104.728
G1 X144.383 Y103.563 E.04909
G1 X143.85 Y103.563
G1 X145.015 Y104.728 E.04909
; WIPE_START
M204 S5000
G1 X143.85 Y103.563 E-.62621
G1 X144.202 Y103.563 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X150.542 Y99.313 Z1.4 F15000
G1 X224.764 Y49.563 Z1.4
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X225.929 Y50.728 E.04909
G1 X225.396 Y50.728
G1 X224.231 Y49.563 E.04909
G1 X223.698 Y49.563
G1 X224.863 Y50.728 E.04909
G1 X224.33 Y50.728
G1 X223.164 Y49.563 E.04909
G1 X222.631 Y49.563
G1 X223.796 Y50.728 E.04909
G1 X223.263 Y50.728
G1 X222.098 Y49.563 E.04909
G1 X221.565 Y49.563
G1 X222.73 Y50.728 E.04909
G1 X222.197 Y50.728
G1 X221.031 Y49.563 E.04909
G1 X220.498 Y49.563
G1 X221.663 Y50.728 E.04909
G1 X221.13 Y50.728
G1 X219.965 Y49.563 E.04909
G1 X219.432 Y49.563
G1 X220.597 Y50.728 E.04909
G1 X220.064 Y50.728
G1 X218.898 Y49.563 E.04909
G1 X218.365 Y49.563
G1 X219.53 Y50.728 E.04909
G1 X218.997 Y50.728
G1 X217.832 Y49.563 E.04909
G1 X217.299 Y49.563
G1 X218.464 Y50.728 E.04909
G1 X217.931 Y50.728
G1 X216.765 Y49.563 E.04909
G1 X216.232 Y49.563
G1 X217.397 Y50.728 E.04909
G1 X216.864 Y50.728
G1 X215.699 Y49.563 E.04909
G1 X215.165 Y49.563
M73 P83 R3
G1 X216.331 Y50.728 E.04909
G1 X215.797 Y50.728
G1 X214.632 Y49.563 E.04909
G1 X214.099 Y49.563
G1 X215.264 Y50.728 E.04909
G1 X214.731 Y50.728
G1 X213.566 Y49.563 E.04909
G1 X213.032 Y49.563
G1 X214.198 Y50.728 E.04909
G1 X213.664 Y50.728
G1 X212.499 Y49.563 E.04909
G1 X211.966 Y49.563
G1 X213.131 Y50.728 E.04909
G1 X212.598 Y50.728
G1 X211.433 Y49.563 E.04909
G1 X210.899 Y49.563
G1 X212.065 Y50.728 E.04909
G1 X211.531 Y50.728
G1 X210.366 Y49.563 E.04909
G1 X209.833 Y49.563
G1 X210.998 Y50.728 E.04909
G1 X210.465 Y50.728
G1 X209.3 Y49.563 E.04909
G1 X208.766 Y49.563
G1 X209.932 Y50.728 E.04909
G1 X209.398 Y50.728
G1 X208.233 Y49.563 E.04909
G1 X207.7 Y49.563
G1 X208.865 Y50.728 E.04909
G1 X208.332 Y50.728
G1 X207.167 Y49.563 E.04909
G1 X206.633 Y49.563
G1 X207.799 Y50.728 E.04909
G1 X207.265 Y50.728
G1 X206.1 Y49.563 E.04909
G1 X205.567 Y49.563
G1 X206.732 Y50.728 E.04909
G1 X206.199 Y50.728
G1 X205.034 Y49.563 E.04909
G1 X204.5 Y49.563
G1 X205.666 Y50.728 E.04909
G1 X205.132 Y50.728
G1 X203.967 Y49.563 E.04909
G1 X203.434 Y49.563
G1 X204.599 Y50.728 E.04909
G1 X204.066 Y50.728
G1 X202.901 Y49.563 E.04909
G1 X202.367 Y49.563
G1 X203.533 Y50.728 E.04909
G1 X202.999 Y50.728
G1 X201.834 Y49.563 E.04909
G1 X201.301 Y49.563
G1 X202.466 Y50.728 E.04909
G1 X201.933 Y50.728
G1 X200.768 Y49.563 E.04909
G1 X200.234 Y49.563
G1 X201.4 Y50.728 E.04909
G1 X200.866 Y50.728
G1 X199.701 Y49.563 E.04909
G1 X199.168 Y49.563
G1 X200.333 Y50.728 E.04909
G1 X199.8 Y50.728
G1 X198.635 Y49.563 E.04909
G1 X198.101 Y49.563
G1 X199.266 Y50.728 E.04909
G1 X198.733 Y50.728
G1 X197.568 Y49.563 E.04909
G1 X197.035 Y49.563
G1 X198.2 Y50.728 E.04909
G1 X197.667 Y50.728
G1 X196.501 Y49.563 E.04909
G1 X195.968 Y49.563
G1 X197.133 Y50.728 E.04909
G1 X196.6 Y50.728
G1 X195.435 Y49.563 E.04909
G1 X194.902 Y49.563
G1 X196.067 Y50.728 E.04909
G1 X195.534 Y50.728
G1 X194.368 Y49.563 E.04909
G1 X193.835 Y49.563
G1 X195 Y50.728 E.04909
G1 X194.467 Y50.728
G1 X193.302 Y49.563 E.04909
G1 X192.769 Y49.563
G1 X193.934 Y50.728 E.04909
G1 X193.401 Y50.728
G1 X192.235 Y49.563 E.04909
G1 X191.702 Y49.563
G1 X192.867 Y50.728 E.04909
G1 X192.334 Y50.728
G1 X191.169 Y49.563 E.04909
G1 X190.636 Y49.563
G1 X191.801 Y50.728 E.04909
G1 X191.268 Y50.728
G1 X190.102 Y49.563 E.04909
G1 X189.569 Y49.563
G1 X190.734 Y50.728 E.04909
G1 X190.201 Y50.728
G1 X189.036 Y49.563 E.04909
G1 X188.503 Y49.563
G1 X189.668 Y50.728 E.04909
G1 X189.135 Y50.728
G1 X187.969 Y49.563 E.04909
G1 X187.436 Y49.563
G1 X188.601 Y50.728 E.04909
G1 X188.068 Y50.728
G1 X186.903 Y49.563 E.04909
G1 X186.37 Y49.563
G1 X187.535 Y50.728 E.04909
G1 X187.002 Y50.728
G1 X185.836 Y49.563 E.04909
G1 X185.303 Y49.563
G1 X186.468 Y50.728 E.04909
G1 X185.935 Y50.728
G1 X184.77 Y49.563 E.04909
G1 X184.237 Y49.563
G1 X185.402 Y50.728 E.04909
G1 X184.869 Y50.728
G1 X183.703 Y49.563 E.04909
G1 X183.17 Y49.563
G1 X184.335 Y50.728 E.04909
G1 X183.802 Y50.728
G1 X182.637 Y49.563 E.04909
G1 X182.104 Y49.563
G1 X183.269 Y50.728 E.04909
G1 X182.736 Y50.728
G1 X181.57 Y49.563 E.04909
G1 X181.037 Y49.563
G1 X182.202 Y50.728 E.04909
G1 X181.669 Y50.728
G1 X180.504 Y49.563 E.04909
G1 X179.97 Y49.563
G1 X181.136 Y50.728 E.04909
G1 X180.602 Y50.728
G1 X179.437 Y49.563 E.04909
G1 X178.904 Y49.563
G1 X180.069 Y50.728 E.04909
G1 X179.536 Y50.728
G1 X178.371 Y49.563 E.04909
G1 X177.837 Y49.563
G1 X179.003 Y50.728 E.04909
G1 X178.469 Y50.728
G1 X177.304 Y49.563 E.04909
G1 X176.771 Y49.563
G1 X177.936 Y50.728 E.04909
G1 X177.403 Y50.728
G1 X176.238 Y49.563 E.04909
G1 X175.704 Y49.563
G1 X176.87 Y50.728 E.04909
G1 X176.336 Y50.728
G1 X175.171 Y49.563 E.04909
G1 X174.638 Y49.563
G1 X175.803 Y50.728 E.04909
G1 X175.27 Y50.728
G1 X174.105 Y49.563 E.04909
G1 X173.571 Y49.563
G1 X174.737 Y50.728 E.04909
G1 X174.203 Y50.728
G1 X173.038 Y49.563 E.04909
G1 X172.505 Y49.563
G1 X173.67 Y50.728 E.04909
G1 X173.137 Y50.728
G1 X171.972 Y49.563 E.04909
G1 X171.438 Y49.563
G1 X172.604 Y50.728 E.04909
G1 X172.07 Y50.728
G1 X170.905 Y49.563 E.04909
G1 X170.372 Y49.563
G1 X171.537 Y50.728 E.04909
G1 X171.004 Y50.728
G1 X169.839 Y49.563 E.04909
G1 X169.305 Y49.563
G1 X170.471 Y50.728 E.04909
G1 X169.937 Y50.728
G1 X168.772 Y49.563 E.04909
G1 X168.239 Y49.563
G1 X169.404 Y50.728 E.04909
G1 X168.871 Y50.728
G1 X167.706 Y49.563 E.04909
G1 X167.172 Y49.563
G1 X168.338 Y50.728 E.04909
G1 X167.804 Y50.728
G1 X166.639 Y49.563 E.04909
G1 X166.106 Y49.563
G1 X167.271 Y50.728 E.04909
G1 X166.738 Y50.728
G1 X165.573 Y49.563 E.04909
G1 X165.039 Y49.563
G1 X166.205 Y50.728 E.04909
G1 X165.671 Y50.728
G1 X164.506 Y49.563 E.04909
G1 X163.973 Y49.563
G1 X165.138 Y50.728 E.04909
G1 X164.605 Y50.728
G1 X163.44 Y49.563 E.04909
G1 X162.906 Y49.563
G1 X164.072 Y50.728 E.04909
G1 X163.538 Y50.728
G1 X162.373 Y49.563 E.04909
G1 X161.84 Y49.563
G1 X163.005 Y50.728 E.04909
G1 X162.472 Y50.728
G1 X161.306 Y49.563 E.04909
G1 X160.773 Y49.563
G1 X161.938 Y50.728 E.04909
G1 X161.405 Y50.728
G1 X160.24 Y49.563 E.04909
G1 X159.707 Y49.563
G1 X160.872 Y50.728 E.04909
G1 X160.339 Y50.728
G1 X159.173 Y49.563 E.04909
G1 X158.64 Y49.563
G1 X159.805 Y50.728 E.04909
G1 X159.272 Y50.728
G1 X158.107 Y49.563 E.04909
G1 X157.574 Y49.563
G1 X158.739 Y50.728 E.04909
G1 X158.206 Y50.728
G1 X157.04 Y49.563 E.04909
G1 X156.507 Y49.563
G1 X157.672 Y50.728 E.04909
G1 X157.139 Y50.728
G1 X155.974 Y49.563 E.04909
G1 X155.441 Y49.563
G1 X156.606 Y50.728 E.04909
G1 X156.073 Y50.728
G1 X154.907 Y49.563 E.04909
G1 X154.374 Y49.563
G1 X155.539 Y50.728 E.04909
G1 X155.006 Y50.728
G1 X153.841 Y49.563 E.04909
G1 X153.308 Y49.563
G1 X154.473 Y50.728 E.04909
G1 X153.94 Y50.728
G1 X152.774 Y49.563 E.04909
G1 X152.241 Y49.563
G1 X153.406 Y50.728 E.04909
G1 X152.873 Y50.728
G1 X151.708 Y49.563 E.04909
G1 X151.175 Y49.563
G1 X152.34 Y50.728 E.04909
G1 X151.807 Y50.728
G1 X150.641 Y49.563 E.04909
G1 X150.108 Y49.563
G1 X151.273 Y50.728 E.04909
G1 X150.74 Y50.728
G1 X149.575 Y49.563 E.04909
G1 X149.042 Y49.563
G1 X150.207 Y50.728 E.04909
G1 X149.674 Y50.728
G1 X148.508 Y49.563 E.04909
G1 X147.975 Y49.563
G1 X149.14 Y50.728 E.04909
G1 X148.607 Y50.728
G1 X147.442 Y49.563 E.04909
G1 X146.909 Y49.563
G1 X148.074 Y50.728 E.04909
G1 X147.541 Y50.728
G1 X146.375 Y49.563 E.04909
G1 X145.842 Y49.563
G1 X147.007 Y50.728 E.04909
G1 X146.474 Y50.728
G1 X145.309 Y49.563 E.04909
G1 X144.775 Y49.563
G1 X145.941 Y50.728 E.04909
G1 X145.407 Y50.728
G1 X144.242 Y49.563 E.04909
M73 P84 R3
G1 X143.709 Y49.563
G1 X144.874 Y50.728 E.04909
G1 X144.341 Y50.728
G1 X143.176 Y49.563 E.04909
G1 X142.642 Y49.563
G1 X143.808 Y50.728 E.04909
G1 X143.472 Y50.926
G1 X142.307 Y49.761 E.04909
G1 X142.307 Y50.294
G1 X143.472 Y51.459 E.04909
G1 X143.472 Y51.993
G1 X142.307 Y50.827 E.04909
G1 X142.307 Y51.361
G1 X143.472 Y52.526 E.04909
G1 X143.472 Y53.059
G1 X142.307 Y51.894 E.04909
G1 X142.307 Y52.427
G1 X143.472 Y53.592 E.04909
G1 X143.472 Y54.126
G1 X142.307 Y52.96 E.04909
G1 X142.307 Y53.494
G1 X143.472 Y54.659 E.04909
G1 X143.472 Y55.192
G1 X142.307 Y54.027 E.04909
G1 X142.307 Y54.56
G1 X143.472 Y55.725 E.04909
G1 X143.472 Y56.259
G1 X142.307 Y55.093 E.04909
G1 X142.307 Y55.627
G1 X143.472 Y56.792 E.04909
G1 X143.472 Y57.325
G1 X142.307 Y56.16 E.04909
G1 X142.307 Y56.693
G1 X143.472 Y57.858 E.04909
G1 X143.472 Y58.392
G1 X142.307 Y57.226 E.04909
G1 X142.307 Y57.76
G1 X143.472 Y58.925 E.04909
G1 X143.472 Y59.458
G1 X142.307 Y58.293 E.04909
G1 X142.307 Y58.826
G1 X143.472 Y59.991 E.04909
G1 X143.472 Y60.525
G1 X142.307 Y59.359 E.04909
G1 X142.307 Y59.893
G1 X143.472 Y61.058 E.04909
G1 X143.472 Y61.591
G1 X142.307 Y60.426 E.04909
G1 X142.307 Y60.959
G1 X143.472 Y62.124 E.04909
G1 X143.472 Y62.658
G1 X142.307 Y61.492 E.04909
G1 X142.307 Y62.026
G1 X143.472 Y63.191 E.04909
G1 X143.472 Y63.724
G1 X142.307 Y62.559 E.04909
G1 X142.307 Y63.092
G1 X143.472 Y64.257 E.04909
G1 X143.472 Y64.791
G1 X142.307 Y63.625 E.04909
G1 X142.307 Y64.159
G1 X143.472 Y65.324 E.04909
G1 X143.472 Y65.857
G1 X142.307 Y64.692 E.04909
G1 X142.307 Y65.225
G1 X143.472 Y66.391 E.04909
G1 X143.472 Y66.924
G1 X142.307 Y65.759 E.04909
G1 X142.307 Y66.292
G1 X143.472 Y67.457 E.04909
G1 X143.472 Y67.99
G1 X142.307 Y66.825 E.04909
G1 X142.307 Y67.358
G1 X143.472 Y68.524 E.04909
G1 X143.472 Y69.057
G1 X142.307 Y67.892 E.04909
G1 X142.307 Y68.425
G1 X143.472 Y69.59 E.04909
G1 X143.472 Y70.123
G1 X142.307 Y68.958 E.04909
G1 X142.307 Y69.491
G1 X143.472 Y70.657 E.04909
G1 X143.472 Y71.19
G1 X142.307 Y70.025 E.04909
G1 X142.307 Y70.558
G1 X143.472 Y71.723 E.04909
G1 X143.472 Y72.256
G1 X142.307 Y71.091 E.04909
G1 X142.307 Y71.624
G1 X143.472 Y72.79 E.04909
G1 X143.472 Y73.323
G1 X142.307 Y72.158 E.04909
G1 X142.307 Y72.691
G1 X143.472 Y73.856 E.04909
G1 X143.472 Y74.389
G1 X142.307 Y73.224 E.04909
G1 X142.307 Y73.757
G1 X143.472 Y74.923 E.04909
G1 X143.472 Y75.456
G1 X142.307 Y74.291 E.04909
G1 X142.307 Y74.824
G1 X143.472 Y75.989 E.04909
G1 X143.472 Y76.522
G1 X142.307 Y75.357 E.04909
G1 X142.307 Y75.89
G1 X143.472 Y77.056 E.04909
G1 X143.472 Y77.589
G1 X142.307 Y76.424 E.04909
G1 X142.307 Y76.957
G1 X143.472 Y78.122 E.04909
G1 X143.472 Y78.655
G1 X142.307 Y77.49 E.04909
G1 X142.307 Y78.023
G1 X143.472 Y79.189 E.04909
G1 X143.472 Y79.722
G1 X142.307 Y78.557 E.04909
G1 X142.307 Y79.09
G1 X143.472 Y80.255 E.04909
G1 X143.472 Y80.788
G1 X142.307 Y79.623 E.04909
G1 X142.307 Y80.156
G1 X143.472 Y81.322 E.04909
G1 X143.472 Y81.855
G1 X142.307 Y80.69 E.04909
G1 X142.307 Y81.223
G1 X143.472 Y82.388 E.04909
G1 X143.472 Y82.921
G1 X142.307 Y81.756 E.04909
G1 X142.307 Y82.289
G1 X143.472 Y83.455 E.04909
G1 X143.472 Y83.988
G1 X142.307 Y82.823 E.04909
G1 X142.307 Y83.356
G1 X143.472 Y84.521 E.04909
G1 X143.472 Y85.055
G1 X142.307 Y83.889 E.04909
G1 X142.307 Y84.423
G1 X143.472 Y85.588 E.04909
G1 X143.472 Y86.121
G1 X142.307 Y84.956 E.04909
G1 X142.307 Y85.489
G1 X143.472 Y86.654 E.04909
G1 X143.472 Y87.188
G1 X142.307 Y86.022 E.04909
G1 X142.307 Y86.556
G1 X143.472 Y87.721 E.04909
G1 X143.472 Y88.254
G1 X142.307 Y87.089 E.04909
G1 X142.307 Y87.622
G1 X143.472 Y88.787 E.04909
G1 X143.472 Y89.321
G1 X142.307 Y88.155 E.04909
G1 X142.307 Y88.689
G1 X143.472 Y89.854 E.04909
G1 X143.472 Y90.387
G1 X142.307 Y89.222 E.04909
G1 X142.307 Y89.755
G1 X143.472 Y90.92 E.04909
G1 X143.472 Y91.454
G1 X142.307 Y90.288 E.04909
G1 X142.307 Y90.822
G1 X143.472 Y91.987 E.04909
G1 X143.472 Y92.52
G1 X142.307 Y91.355 E.04909
G1 X142.307 Y91.888
G1 X143.472 Y93.053 E.04909
G1 X143.472 Y93.587
G1 X142.307 Y92.421 E.04909
G1 X142.307 Y92.955
G1 X143.472 Y94.12 E.04909
G1 X143.472 Y94.653
G1 X142.307 Y93.488 E.04909
G1 X142.307 Y94.021
G1 X143.472 Y95.186 E.04909
G1 X143.472 Y95.72
G1 X142.307 Y94.554 E.04909
G1 X142.307 Y95.088
G1 X143.472 Y96.253 E.04909
G1 X143.472 Y96.786
G1 X142.307 Y95.621 E.04909
G1 X142.307 Y96.154
G1 X143.472 Y97.319 E.04909
G1 X143.472 Y97.853
G1 X142.307 Y96.687 E.04909
G1 X142.307 Y97.221
G1 X143.472 Y98.386 E.04909
G1 X143.472 Y98.919
G1 X142.307 Y97.754 E.04909
G1 X142.307 Y98.287
G1 X143.472 Y99.452 E.04909
G1 X143.472 Y99.986
G1 X142.307 Y98.82 E.04909
G1 X142.307 Y99.354
G1 X143.472 Y100.519 E.04909
G1 X143.472 Y101.052
G1 X142.307 Y99.887 E.04909
G1 X142.307 Y100.42
G1 X143.472 Y101.586 E.04909
G1 X143.472 Y102.119
G1 X142.307 Y100.954 E.04909
G1 X142.307 Y101.487
G1 X143.472 Y102.652 E.04909
G1 X143.472 Y103.185
G1 X142.307 Y102.02 E.04909
G1 X142.307 Y102.553
G1 X144.482 Y104.728 E.09162
G1 X143.949 Y104.728
G1 X142.307 Y103.087 E.06915
G1 X142.307 Y103.62
G1 X143.415 Y104.728 E.04669
G1 X142.882 Y104.728
G1 X142.307 Y104.153 E.02423
; WIPE_START
M204 S5000
G1 X142.882 Y104.728 E-.30905
G1 X143.415 Y104.728 E-.20264
G1 X142.953 Y104.266 E-.24831
; WIPE_END
G1 E-.04 F1800
G1 X142.9 Y96.634 Z1.4 F15000
G1 X142.572 Y49.633 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145685
G1 F7500
G2 X142.288 Y49.593 I-.191 J.323 E.00239
; WIPE_START
G1 X142.475 Y49.593 E-.48617
G1 X142.572 Y49.633 E-.27383
; WIPE_END
G1 E-.04 F1800
G1 X148.976 Y53.786 Z1.4 F15000
G1 X227.491 Y104.698 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.145578
G1 F7500
G3 X227.207 Y104.658 I-.093 J-.363 E.00239
; OBJECT_ID: 115
; WIPE_START
G1 X227.305 Y104.698 E-.27421
G1 X227.491 Y104.698 E-.48579
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 161
M625
; start printing object, unique label id: 115
M624 AgAAAAAAAAA=
G1 X227.388 Y112.33 Z1.4 F15000
G1 X226.165 Y203.13 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X143.745 Y203.13 E2.45501
G1 X143.745 Y150.71 E1.56141
G1 X226.165 Y150.71 E2.45501
G1 X226.165 Y203.07 E1.55963
; WIPE_START
M204 S5000
G1 X224.165 Y203.071 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X227.745 Y204.71 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X142.165 Y204.71 E2.54914
G1 X142.165 Y149.13 E1.65554
G1 X227.745 Y149.13 E2.54914
G1 X227.745 Y204.65 E1.65375
; WIPE_START
M204 S5000
G1 X225.745 Y204.651 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X225.995 Y197.023 Z1.4 F15000
G1 X227.538 Y149.913 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X226.963 Y149.337 E.02423
G1 X226.429 Y149.337
G1 X227.538 Y150.446 E.04669
G1 X227.538 Y150.979
G1 X225.896 Y149.337 E.06916
G1 X225.363 Y149.337
G1 X227.538 Y151.512 E.09162
G1 X227.538 Y152.046
G1 X226.373 Y150.88 E.04909
M73 P85 R3
G1 X226.373 Y151.414
G1 X227.538 Y152.579 E.04909
G1 X227.538 Y153.112
G1 X226.373 Y151.947 E.04909
G1 X226.373 Y152.48
G1 X227.538 Y153.645 E.04909
G1 X227.538 Y154.179
G1 X226.373 Y153.013 E.04909
G1 X226.373 Y153.547
G1 X227.538 Y154.712 E.04909
G1 X227.538 Y155.245
G1 X226.373 Y154.08 E.04909
G1 X226.373 Y154.613
G1 X227.538 Y155.778 E.04909
G1 X227.538 Y156.312
G1 X226.373 Y155.146 E.04909
G1 X226.373 Y155.68
G1 X227.538 Y156.845 E.04909
G1 X227.538 Y157.378
G1 X226.373 Y156.213 E.04909
G1 X226.373 Y156.746
G1 X227.538 Y157.911 E.04909
G1 X227.538 Y158.445
G1 X226.373 Y157.28 E.04909
G1 X226.373 Y157.813
G1 X227.538 Y158.978 E.04909
G1 X227.538 Y159.511
G1 X226.373 Y158.346 E.04909
G1 X226.373 Y158.879
G1 X227.538 Y160.045 E.04909
G1 X227.538 Y160.578
G1 X226.373 Y159.413 E.04909
G1 X226.373 Y159.946
G1 X227.538 Y161.111 E.04909
G1 X227.538 Y161.644
G1 X226.373 Y160.479 E.04909
G1 X226.373 Y161.012
G1 X227.538 Y162.178 E.04909
M73 P85 R2
G1 X227.538 Y162.711
G1 X226.373 Y161.546 E.04909
G1 X226.373 Y162.079
G1 X227.538 Y163.244 E.04909
G1 X227.538 Y163.777
G1 X226.373 Y162.612 E.04909
G1 X226.373 Y163.145
G1 X227.538 Y164.311 E.04909
G1 X227.538 Y164.844
G1 X226.373 Y163.679 E.04909
G1 X226.373 Y164.212
G1 X227.538 Y165.377 E.04909
G1 X227.538 Y165.91
G1 X226.373 Y164.745 E.04909
G1 X226.373 Y165.278
G1 X227.538 Y166.444 E.04909
G1 X227.538 Y166.977
G1 X226.373 Y165.812 E.04909
G1 X226.373 Y166.345
G1 X227.538 Y167.51 E.04909
G1 X227.538 Y168.043
G1 X226.373 Y166.878 E.04909
G1 X226.373 Y167.411
G1 X227.538 Y168.577 E.04909
G1 X227.538 Y169.11
G1 X226.373 Y167.945 E.04909
G1 X226.373 Y168.478
G1 X227.538 Y169.643 E.04909
G1 X227.538 Y170.176
G1 X226.373 Y169.011 E.04909
G1 X226.373 Y169.544
G1 X227.538 Y170.71 E.04909
G1 X227.538 Y171.243
G1 X226.373 Y170.078 E.04909
G1 X226.373 Y170.611
G1 X227.538 Y171.776 E.04909
G1 X227.538 Y172.309
G1 X226.373 Y171.144 E.04909
G1 X226.373 Y171.677
G1 X227.538 Y172.843 E.04909
G1 X227.538 Y173.376
G1 X226.373 Y172.211 E.04909
G1 X226.373 Y172.744
G1 X227.538 Y173.909 E.04909
G1 X227.538 Y174.442
G1 X226.373 Y173.277 E.04909
G1 X226.373 Y173.81
G1 X227.538 Y174.976 E.04909
G1 X227.538 Y175.509
G1 X226.373 Y174.344 E.04909
G1 X226.373 Y174.877
G1 X227.538 Y176.042 E.04909
G1 X227.538 Y176.576
G1 X226.373 Y175.41 E.04909
G1 X226.373 Y175.944
G1 X227.538 Y177.109 E.04909
G1 X227.538 Y177.642
G1 X226.373 Y176.477 E.04909
G1 X226.373 Y177.01
G1 X227.538 Y178.175 E.04909
G1 X227.538 Y178.709
G1 X226.373 Y177.543 E.04909
G1 X226.373 Y178.077
G1 X227.538 Y179.242 E.04909
G1 X227.538 Y179.775
G1 X226.373 Y178.61 E.04909
G1 X226.373 Y179.143
G1 X227.538 Y180.308 E.04909
G1 X227.538 Y180.842
G1 X226.373 Y179.676 E.04909
G1 X226.373 Y180.21
G1 X227.538 Y181.375 E.04909
G1 X227.538 Y181.908
G1 X226.373 Y180.743 E.04909
G1 X226.373 Y181.276
G1 X227.538 Y182.441 E.04909
G1 X227.538 Y182.975
G1 X226.373 Y181.809 E.04909
G1 X226.373 Y182.343
G1 X227.538 Y183.508 E.04909
G1 X227.538 Y184.041
G1 X226.373 Y182.876 E.04909
G1 X226.373 Y183.409
G1 X227.538 Y184.574 E.04909
G1 X227.538 Y185.108
G1 X226.373 Y183.942 E.04909
G1 X226.373 Y184.476
G1 X227.538 Y185.641 E.04909
G1 X227.538 Y186.174
G1 X226.373 Y185.009 E.04909
G1 X226.373 Y185.542
G1 X227.538 Y186.707 E.04909
G1 X227.538 Y187.241
G1 X226.373 Y186.075 E.04909
G1 X226.373 Y186.609
G1 X227.538 Y187.774 E.04909
G1 X227.538 Y188.307
G1 X226.373 Y187.142 E.04909
G1 X226.373 Y187.675
G1 X227.538 Y188.84 E.04909
G1 X227.538 Y189.374
G1 X226.373 Y188.208 E.04909
G1 X226.373 Y188.742
G1 X227.538 Y189.907 E.04909
G1 X227.538 Y190.44
G1 X226.373 Y189.275 E.04909
G1 X226.373 Y189.808
G1 X227.538 Y190.973 E.04909
G1 X227.538 Y191.507
G1 X226.373 Y190.341 E.04909
G1 X226.373 Y190.875
M73 P86 R2
G1 X227.538 Y192.04 E.04909
G1 X227.538 Y192.573
G1 X226.373 Y191.408 E.04909
G1 X226.373 Y191.941
G1 X227.538 Y193.106 E.04909
G1 X227.538 Y193.64
G1 X226.373 Y192.474 E.04909
G1 X226.373 Y193.008
G1 X227.538 Y194.173 E.04909
G1 X227.538 Y194.706
G1 X226.373 Y193.541 E.04909
G1 X226.373 Y194.074
G1 X227.538 Y195.24 E.04909
G1 X227.538 Y195.773
G1 X226.373 Y194.608 E.04909
G1 X226.373 Y195.141
G1 X227.538 Y196.306 E.04909
G1 X227.538 Y196.839
G1 X226.373 Y195.674 E.04909
G1 X226.373 Y196.207
G1 X227.538 Y197.373 E.04909
G1 X227.538 Y197.906
G1 X226.373 Y196.741 E.04909
G1 X226.373 Y197.274
G1 X227.538 Y198.439 E.04909
G1 X227.538 Y198.972
G1 X226.373 Y197.807 E.04909
G1 X226.373 Y198.34
G1 X227.538 Y199.506 E.04909
G1 X227.538 Y200.039
G1 X226.373 Y198.874 E.04909
G1 X226.373 Y199.407
G1 X227.538 Y200.572 E.04909
G1 X227.538 Y201.105
G1 X226.373 Y199.94 E.04909
G1 X226.373 Y200.473
G1 X227.538 Y201.639 E.04909
G1 X227.538 Y202.172
G1 X226.373 Y201.007 E.04909
G1 X226.373 Y201.54
G1 X227.538 Y202.705 E.04909
G1 X227.538 Y203.238
G1 X226.373 Y202.073 E.04909
G1 X226.373 Y202.606
G1 X227.538 Y203.772 E.04909
G1 X227.538 Y204.305
G1 X226.373 Y203.14 E.04909
G1 X226.037 Y203.337
G1 X227.202 Y204.503 E.04909
G1 X226.669 Y204.503
G1 X225.504 Y203.337 E.04909
G1 X224.971 Y203.337
G1 X226.136 Y204.503 E.04909
G1 X225.603 Y204.503
G1 X224.437 Y203.337 E.04909
G1 X223.904 Y203.337
G1 X225.069 Y204.503 E.04909
G1 X224.536 Y204.503
G1 X223.371 Y203.337 E.04909
G1 X222.838 Y203.337
G1 X224.003 Y204.503 E.04909
G1 X223.47 Y204.503
G1 X222.304 Y203.337 E.04909
G1 X221.771 Y203.337
G1 X222.936 Y204.503 E.04909
G1 X222.403 Y204.503
G1 X221.238 Y203.337 E.04909
G1 X220.704 Y203.337
G1 X221.87 Y204.503 E.04909
G1 X221.336 Y204.503
G1 X220.171 Y203.337 E.04909
G1 X219.638 Y203.337
G1 X220.803 Y204.503 E.04909
G1 X220.27 Y204.503
G1 X219.105 Y203.337 E.04909
G1 X218.571 Y203.337
G1 X219.737 Y204.503 E.04909
G1 X219.203 Y204.503
G1 X218.038 Y203.337 E.04909
G1 X217.505 Y203.337
G1 X218.67 Y204.503 E.04909
G1 X218.137 Y204.503
G1 X216.972 Y203.337 E.04909
G1 X216.438 Y203.337
G1 X217.604 Y204.503 E.04909
G1 X217.07 Y204.503
G1 X215.905 Y203.337 E.04909
G1 X215.372 Y203.337
G1 X216.537 Y204.503 E.04909
G1 X216.004 Y204.503
G1 X214.839 Y203.337 E.04909
G1 X214.305 Y203.337
G1 X215.471 Y204.503 E.04909
G1 X214.937 Y204.503
G1 X213.772 Y203.337 E.04909
G1 X213.239 Y203.337
G1 X214.404 Y204.503 E.04909
G1 X213.871 Y204.503
G1 X212.706 Y203.337 E.04909
G1 X212.172 Y203.337
G1 X213.338 Y204.503 E.04909
G1 X212.804 Y204.503
G1 X211.639 Y203.337 E.04909
G1 X211.106 Y203.337
G1 X212.271 Y204.503 E.04909
G1 X211.738 Y204.503
G1 X210.573 Y203.337 E.04909
G1 X210.039 Y203.337
G1 X211.205 Y204.503 E.04909
G1 X210.671 Y204.503
G1 X209.506 Y203.337 E.04909
G1 X208.973 Y203.337
G1 X210.138 Y204.503 E.04909
G1 X209.605 Y204.503
G1 X208.44 Y203.337 E.04909
G1 X207.906 Y203.337
G1 X209.072 Y204.503 E.04909
G1 X208.538 Y204.503
G1 X207.373 Y203.337 E.04909
G1 X206.84 Y203.337
G1 X208.005 Y204.503 E.04909
G1 X207.472 Y204.503
G1 X206.307 Y203.337 E.04909
G1 X205.773 Y203.337
G1 X206.939 Y204.503 E.04909
G1 X206.405 Y204.503
G1 X205.24 Y203.337 E.04909
G1 X204.707 Y203.337
G1 X205.872 Y204.503 E.04909
G1 X205.339 Y204.503
G1 X204.174 Y203.337 E.04909
G1 X203.64 Y203.337
G1 X204.805 Y204.503 E.04909
G1 X204.272 Y204.503
G1 X203.107 Y203.337 E.04909
G1 X202.574 Y203.337
G1 X203.739 Y204.503 E.04909
G1 X203.206 Y204.503
G1 X202.04 Y203.337 E.04909
G1 X201.507 Y203.337
G1 X202.672 Y204.503 E.04909
G1 X202.139 Y204.503
G1 X200.974 Y203.337 E.04909
G1 X200.441 Y203.337
G1 X201.606 Y204.503 E.04909
G1 X201.073 Y204.503
G1 X199.907 Y203.337 E.04909
G1 X199.374 Y203.337
G1 X200.539 Y204.503 E.04909
G1 X200.006 Y204.503
G1 X198.841 Y203.337 E.04909
G1 X198.308 Y203.337
G1 X199.473 Y204.503 E.04909
G1 X198.94 Y204.503
G1 X197.774 Y203.337 E.04909
G1 X197.241 Y203.337
G1 X198.406 Y204.503 E.04909
G1 X197.873 Y204.503
G1 X196.708 Y203.337 E.04909
G1 X196.175 Y203.337
G1 X197.34 Y204.503 E.04909
G1 X196.807 Y204.503
G1 X195.641 Y203.337 E.04909
G1 X195.108 Y203.337
G1 X196.273 Y204.503 E.04909
G1 X195.74 Y204.503
G1 X194.575 Y203.337 E.04909
G1 X194.042 Y203.337
G1 X195.207 Y204.503 E.04909
G1 X194.674 Y204.503
G1 X193.508 Y203.337 E.04909
G1 X192.975 Y203.337
G1 X194.14 Y204.503 E.04909
G1 X193.607 Y204.503
G1 X192.442 Y203.337 E.04909
G1 X191.909 Y203.337
G1 X193.074 Y204.503 E.04909
G1 X192.541 Y204.503
G1 X191.375 Y203.337 E.04909
G1 X190.842 Y203.337
G1 X192.007 Y204.503 E.04909
G1 X191.474 Y204.503
G1 X190.309 Y203.337 E.04909
G1 X189.776 Y203.337
G1 X190.941 Y204.503 E.04909
G1 X190.408 Y204.503
G1 X189.242 Y203.337 E.04909
G1 X188.709 Y203.337
G1 X189.874 Y204.503 E.04909
G1 X189.341 Y204.503
G1 X188.176 Y203.337 E.04909
G1 X187.643 Y203.337
G1 X188.808 Y204.503 E.04909
G1 X188.275 Y204.503
G1 X187.109 Y203.337 E.04909
G1 X186.576 Y203.337
G1 X187.741 Y204.503 E.04909
G1 X187.208 Y204.503
G1 X186.043 Y203.337 E.04909
G1 X185.509 Y203.337
G1 X186.675 Y204.503 E.04909
G1 X186.141 Y204.503
G1 X184.976 Y203.337 E.04909
G1 X184.443 Y203.337
G1 X185.608 Y204.503 E.04909
G1 X185.075 Y204.503
G1 X183.91 Y203.337 E.04909
G1 X183.376 Y203.337
G1 X184.542 Y204.503 E.04909
G1 X184.008 Y204.503
G1 X182.843 Y203.337 E.04909
G1 X182.31 Y203.337
G1 X183.475 Y204.503 E.04909
G1 X182.942 Y204.503
G1 X181.777 Y203.337 E.04909
G1 X181.243 Y203.337
G1 X182.409 Y204.503 E.04909
G1 X181.875 Y204.503
G1 X180.71 Y203.337 E.04909
G1 X180.177 Y203.337
G1 X181.342 Y204.503 E.04909
G1 X180.809 Y204.503
G1 X179.644 Y203.337 E.04909
G1 X179.11 Y203.337
G1 X180.276 Y204.503 E.04909
G1 X179.742 Y204.503
G1 X178.577 Y203.337 E.04909
G1 X178.044 Y203.337
G1 X179.209 Y204.503 E.04909
G1 X178.676 Y204.503
G1 X177.511 Y203.337 E.04909
G1 X176.977 Y203.337
G1 X178.143 Y204.503 E.04909
G1 X177.609 Y204.503
G1 X176.444 Y203.337 E.04909
G1 X175.911 Y203.337
G1 X177.076 Y204.503 E.04909
G1 X176.543 Y204.503
G1 X175.378 Y203.337 E.04909
G1 X174.844 Y203.337
G1 X176.01 Y204.503 E.04909
G1 X175.476 Y204.503
G1 X174.311 Y203.337 E.04909
G1 X173.778 Y203.337
G1 X174.943 Y204.503 E.04909
G1 X174.41 Y204.503
G1 X173.245 Y203.337 E.04909
G1 X172.711 Y203.337
G1 X173.877 Y204.503 E.04909
G1 X173.343 Y204.503
G1 X172.178 Y203.337 E.04909
G1 X171.645 Y203.337
G1 X172.81 Y204.503 E.04909
G1 X172.277 Y204.503
G1 X171.112 Y203.337 E.04909
G1 X170.578 Y203.337
G1 X171.744 Y204.503 E.04909
G1 X171.21 Y204.503
G1 X170.045 Y203.337 E.04909
G1 X169.512 Y203.337
G1 X170.677 Y204.503 E.04909
G1 X170.144 Y204.503
G1 X168.979 Y203.337 E.04909
G1 X168.445 Y203.337
G1 X169.611 Y204.503 E.04909
G1 X169.077 Y204.503
G1 X167.912 Y203.337 E.04909
G1 X167.379 Y203.337
G1 X168.544 Y204.503 E.04909
G1 X168.011 Y204.503
G1 X166.845 Y203.337 E.04909
M73 P87 R2
G1 X166.312 Y203.337
G1 X167.477 Y204.503 E.04909
G1 X166.944 Y204.503
G1 X165.779 Y203.337 E.04909
G1 X165.246 Y203.337
G1 X166.411 Y204.503 E.04909
G1 X165.878 Y204.503
G1 X164.712 Y203.337 E.04909
G1 X164.179 Y203.337
G1 X165.344 Y204.503 E.04909
G1 X164.811 Y204.503
G1 X163.646 Y203.337 E.04909
G1 X163.113 Y203.337
G1 X164.278 Y204.503 E.04909
G1 X163.745 Y204.503
G1 X162.579 Y203.337 E.04909
G1 X162.046 Y203.337
G1 X163.211 Y204.503 E.04909
G1 X162.678 Y204.503
G1 X161.513 Y203.337 E.04909
G1 X160.98 Y203.337
G1 X162.145 Y204.503 E.04909
G1 X161.612 Y204.503
G1 X160.446 Y203.337 E.04909
G1 X159.913 Y203.337
G1 X161.078 Y204.503 E.04909
G1 X160.545 Y204.503
G1 X159.38 Y203.337 E.04909
G1 X158.847 Y203.337
G1 X160.012 Y204.503 E.04909
G1 X159.479 Y204.503
G1 X158.313 Y203.337 E.04909
G1 X157.78 Y203.337
G1 X158.945 Y204.503 E.04909
G1 X158.412 Y204.503
G1 X157.247 Y203.337 E.04909
G1 X156.714 Y203.337
G1 X157.879 Y204.503 E.04909
G1 X157.346 Y204.503
G1 X156.18 Y203.337 E.04909
G1 X155.647 Y203.337
G1 X156.812 Y204.503 E.04909
G1 X156.279 Y204.503
G1 X155.114 Y203.337 E.04909
G1 X154.581 Y203.337
G1 X155.746 Y204.503 E.04909
G1 X155.213 Y204.503
G1 X154.047 Y203.337 E.04909
G1 X153.514 Y203.337
G1 X154.679 Y204.503 E.04909
G1 X154.146 Y204.503
G1 X152.981 Y203.337 E.04909
G1 X152.448 Y203.337
G1 X153.613 Y204.503 E.04909
G1 X153.08 Y204.503
G1 X151.914 Y203.337 E.04909
G1 X151.381 Y203.337
G1 X152.546 Y204.503 E.04909
G1 X152.013 Y204.503
G1 X150.848 Y203.337 E.04909
G1 X150.314 Y203.337
G1 X151.48 Y204.503 E.04909
G1 X150.946 Y204.503
G1 X149.781 Y203.337 E.04909
G1 X149.248 Y203.337
G1 X150.413 Y204.503 E.04909
G1 X149.88 Y204.503
G1 X148.715 Y203.337 E.04909
G1 X148.181 Y203.337
G1 X149.347 Y204.503 E.04909
G1 X148.813 Y204.503
G1 X147.648 Y203.337 E.04909
G1 X147.115 Y203.337
G1 X148.28 Y204.503 E.04909
G1 X147.747 Y204.503
G1 X146.582 Y203.337 E.04909
G1 X146.048 Y203.337
G1 X147.214 Y204.503 E.04909
G1 X146.68 Y204.503
G1 X145.515 Y203.337 E.04909
G1 X144.982 Y203.337
G1 X146.147 Y204.503 E.04909
G1 X145.614 Y204.503
G1 X144.449 Y203.337 E.04909
G1 X143.915 Y203.337
G1 X145.081 Y204.503 E.04909
; WIPE_START
M204 S5000
G1 X143.915 Y203.337 E-.62621
G1 X144.267 Y203.337 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X150.607 Y199.088 Z1.4 F15000
G1 X224.83 Y149.337 Z1.4
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X225.995 Y150.503 E.04909
G1 X225.462 Y150.503
G1 X224.296 Y149.337 E.04909
G1 X223.763 Y149.337
G1 X224.928 Y150.503 E.04909
G1 X224.395 Y150.503
G1 X223.23 Y149.337 E.04909
G1 X222.697 Y149.337
G1 X223.862 Y150.503 E.04909
G1 X223.329 Y150.503
G1 X222.163 Y149.337 E.04909
G1 X221.63 Y149.337
G1 X222.795 Y150.503 E.04909
G1 X222.262 Y150.503
G1 X221.097 Y149.337 E.04909
G1 X220.563 Y149.337
G1 X221.729 Y150.503 E.04909
G1 X221.195 Y150.503
G1 X220.03 Y149.337 E.04909
G1 X219.497 Y149.337
G1 X220.662 Y150.503 E.04909
G1 X220.129 Y150.503
G1 X218.964 Y149.337 E.04909
G1 X218.43 Y149.337
G1 X219.596 Y150.503 E.04909
G1 X219.062 Y150.503
G1 X217.897 Y149.337 E.04909
G1 X217.364 Y149.337
G1 X218.529 Y150.503 E.04909
G1 X217.996 Y150.503
G1 X216.831 Y149.337 E.04909
G1 X216.297 Y149.337
G1 X217.463 Y150.503 E.04909
G1 X216.929 Y150.503
G1 X215.764 Y149.337 E.04909
G1 X215.231 Y149.337
G1 X216.396 Y150.503 E.04909
G1 X215.863 Y150.503
G1 X214.698 Y149.337 E.04909
G1 X214.164 Y149.337
G1 X215.33 Y150.503 E.04909
G1 X214.796 Y150.503
G1 X213.631 Y149.337 E.04909
G1 X213.098 Y149.337
G1 X214.263 Y150.503 E.04909
G1 X213.73 Y150.503
G1 X212.565 Y149.337 E.04909
G1 X212.031 Y149.337
G1 X213.197 Y150.503 E.04909
G1 X212.663 Y150.503
G1 X211.498 Y149.337 E.04909
G1 X210.965 Y149.337
G1 X212.13 Y150.503 E.04909
G1 X211.597 Y150.503
G1 X210.432 Y149.337 E.04909
G1 X209.898 Y149.337
G1 X211.064 Y150.503 E.04909
G1 X210.53 Y150.503
G1 X209.365 Y149.337 E.04909
G1 X208.832 Y149.337
G1 X209.997 Y150.503 E.04909
G1 X209.464 Y150.503
G1 X208.299 Y149.337 E.04909
G1 X207.765 Y149.337
G1 X208.931 Y150.503 E.04909
G1 X208.397 Y150.503
G1 X207.232 Y149.337 E.04909
G1 X206.699 Y149.337
G1 X207.864 Y150.503 E.04909
G1 X207.331 Y150.503
G1 X206.166 Y149.337 E.04909
G1 X205.632 Y149.337
G1 X206.798 Y150.503 E.04909
G1 X206.264 Y150.503
G1 X205.099 Y149.337 E.04909
G1 X204.566 Y149.337
G1 X205.731 Y150.503 E.04909
G1 X205.198 Y150.503
G1 X204.033 Y149.337 E.04909
G1 X203.499 Y149.337
G1 X204.664 Y150.503 E.04909
G1 X204.131 Y150.503
G1 X202.966 Y149.337 E.04909
G1 X202.433 Y149.337
G1 X203.598 Y150.503 E.04909
G1 X203.065 Y150.503
G1 X201.899 Y149.337 E.04909
G1 X201.366 Y149.337
G1 X202.531 Y150.503 E.04909
G1 X201.998 Y150.503
G1 X200.833 Y149.337 E.04909
G1 X200.3 Y149.337
G1 X201.465 Y150.503 E.04909
G1 X200.932 Y150.503
G1 X199.766 Y149.337 E.04909
G1 X199.233 Y149.337
G1 X200.398 Y150.503 E.04909
G1 X199.865 Y150.503
G1 X198.7 Y149.337 E.04909
G1 X198.167 Y149.337
G1 X199.332 Y150.503 E.04909
G1 X198.799 Y150.503
G1 X197.633 Y149.337 E.04909
G1 X197.1 Y149.337
G1 X198.265 Y150.503 E.04909
G1 X197.732 Y150.503
G1 X196.567 Y149.337 E.04909
G1 X196.034 Y149.337
G1 X197.199 Y150.503 E.04909
G1 X196.666 Y150.503
G1 X195.5 Y149.337 E.04909
G1 X194.967 Y149.337
G1 X196.132 Y150.503 E.04909
G1 X195.599 Y150.503
G1 X194.434 Y149.337 E.04909
G1 X193.901 Y149.337
G1 X195.066 Y150.503 E.04909
G1 X194.533 Y150.503
G1 X193.367 Y149.337 E.04909
G1 X192.834 Y149.337
G1 X193.999 Y150.503 E.04909
G1 X193.466 Y150.503
G1 X192.301 Y149.337 E.04909
G1 X191.768 Y149.337
G1 X192.933 Y150.503 E.04909
G1 X192.4 Y150.503
G1 X191.234 Y149.337 E.04909
G1 X190.701 Y149.337
G1 X191.866 Y150.503 E.04909
G1 X191.333 Y150.503
G1 X190.168 Y149.337 E.04909
G1 X189.635 Y149.337
G1 X190.8 Y150.503 E.04909
G1 X190.267 Y150.503
G1 X189.101 Y149.337 E.04909
G1 X188.568 Y149.337
G1 X189.733 Y150.503 E.04909
G1 X189.2 Y150.503
G1 X188.035 Y149.337 E.04909
G1 X187.502 Y149.337
G1 X188.667 Y150.503 E.04909
G1 X188.134 Y150.503
G1 X186.968 Y149.337 E.04909
G1 X186.435 Y149.337
G1 X187.6 Y150.503 E.04909
G1 X187.067 Y150.503
G1 X185.902 Y149.337 E.04909
G1 X185.368 Y149.337
G1 X186.534 Y150.503 E.04909
G1 X186 Y150.503
G1 X184.835 Y149.337 E.04909
G1 X184.302 Y149.337
G1 X185.467 Y150.503 E.04909
G1 X184.934 Y150.503
G1 X183.769 Y149.337 E.04909
G1 X183.235 Y149.337
G1 X184.401 Y150.503 E.04909
G1 X183.867 Y150.503
G1 X182.702 Y149.337 E.04909
G1 X182.169 Y149.337
G1 X183.334 Y150.503 E.04909
G1 X182.801 Y150.503
G1 X181.636 Y149.337 E.04909
G1 X181.102 Y149.337
G1 X182.268 Y150.503 E.04909
G1 X181.734 Y150.503
G1 X180.569 Y149.337 E.04909
G1 X180.036 Y149.337
G1 X181.201 Y150.503 E.04909
G1 X180.668 Y150.503
G1 X179.503 Y149.337 E.04909
G1 X178.969 Y149.337
M73 P88 R2
G1 X180.135 Y150.503 E.04909
G1 X179.601 Y150.503
G1 X178.436 Y149.337 E.04909
G1 X177.903 Y149.337
G1 X179.068 Y150.503 E.04909
G1 X178.535 Y150.503
G1 X177.37 Y149.337 E.04909
G1 X176.836 Y149.337
G1 X178.002 Y150.503 E.04909
G1 X177.468 Y150.503
G1 X176.303 Y149.337 E.04909
G1 X175.77 Y149.337
G1 X176.935 Y150.503 E.04909
G1 X176.402 Y150.503
G1 X175.237 Y149.337 E.04909
G1 X174.703 Y149.337
G1 X175.869 Y150.503 E.04909
G1 X175.335 Y150.503
G1 X174.17 Y149.337 E.04909
G1 X173.637 Y149.337
G1 X174.802 Y150.503 E.04909
G1 X174.269 Y150.503
G1 X173.104 Y149.337 E.04909
G1 X172.57 Y149.337
G1 X173.736 Y150.503 E.04909
G1 X173.202 Y150.503
G1 X172.037 Y149.337 E.04909
G1 X171.504 Y149.337
G1 X172.669 Y150.503 E.04909
G1 X172.136 Y150.503
G1 X170.971 Y149.337 E.04909
G1 X170.437 Y149.337
G1 X171.603 Y150.503 E.04909
G1 X171.069 Y150.503
G1 X169.904 Y149.337 E.04909
G1 X169.371 Y149.337
G1 X170.536 Y150.503 E.04909
G1 X170.003 Y150.503
G1 X168.838 Y149.337 E.04909
G1 X168.304 Y149.337
G1 X169.469 Y150.503 E.04909
G1 X168.936 Y150.503
G1 X167.771 Y149.337 E.04909
G1 X167.238 Y149.337
G1 X168.403 Y150.503 E.04909
G1 X167.87 Y150.503
G1 X166.704 Y149.337 E.04909
G1 X166.171 Y149.337
G1 X167.336 Y150.503 E.04909
G1 X166.803 Y150.503
G1 X165.638 Y149.337 E.04909
G1 X165.105 Y149.337
G1 X166.27 Y150.503 E.04909
G1 X165.737 Y150.503
G1 X164.571 Y149.337 E.04909
G1 X164.038 Y149.337
G1 X165.203 Y150.503 E.04909
G1 X164.67 Y150.503
G1 X163.505 Y149.337 E.04909
G1 X162.972 Y149.337
G1 X164.137 Y150.503 E.04909
G1 X163.604 Y150.503
G1 X162.438 Y149.337 E.04909
G1 X161.905 Y149.337
G1 X163.07 Y150.503 E.04909
G1 X162.537 Y150.503
G1 X161.372 Y149.337 E.04909
G1 X160.839 Y149.337
G1 X162.004 Y150.503 E.04909
G1 X161.471 Y150.503
G1 X160.305 Y149.337 E.04909
G1 X159.772 Y149.337
G1 X160.937 Y150.503 E.04909
G1 X160.404 Y150.503
G1 X159.239 Y149.337 E.04909
G1 X158.706 Y149.337
G1 X159.871 Y150.503 E.04909
G1 X159.338 Y150.503
G1 X158.172 Y149.337 E.04909
G1 X157.639 Y149.337
G1 X158.804 Y150.503 E.04909
G1 X158.271 Y150.503
G1 X157.106 Y149.337 E.04909
G1 X156.573 Y149.337
G1 X157.738 Y150.503 E.04909
G1 X157.205 Y150.503
G1 X156.039 Y149.337 E.04909
G1 X155.506 Y149.337
G1 X156.671 Y150.503 E.04909
G1 X156.138 Y150.503
G1 X154.973 Y149.337 E.04909
G1 X154.44 Y149.337
G1 X155.605 Y150.503 E.04909
G1 X155.072 Y150.503
G1 X153.906 Y149.337 E.04909
G1 X153.373 Y149.337
G1 X154.538 Y150.503 E.04909
G1 X154.005 Y150.503
G1 X152.84 Y149.337 E.04909
G1 X152.307 Y149.337
G1 X153.472 Y150.503 E.04909
G1 X152.939 Y150.503
G1 X151.773 Y149.337 E.04909
G1 X151.24 Y149.337
G1 X152.405 Y150.503 E.04909
G1 X151.872 Y150.503
G1 X150.707 Y149.337 E.04909
G1 X150.173 Y149.337
G1 X151.339 Y150.503 E.04909
G1 X150.805 Y150.503
G1 X149.64 Y149.337 E.04909
G1 X149.107 Y149.337
G1 X150.272 Y150.503 E.04909
G1 X149.739 Y150.503
G1 X148.574 Y149.337 E.04909
G1 X148.04 Y149.337
G1 X149.206 Y150.503 E.04909
G1 X148.672 Y150.503
G1 X147.507 Y149.337 E.04909
G1 X146.974 Y149.337
G1 X148.139 Y150.503 E.04909
G1 X147.606 Y150.503
G1 X146.441 Y149.337 E.04909
G1 X145.907 Y149.337
G1 X147.073 Y150.503 E.04909
G1 X146.539 Y150.503
G1 X145.374 Y149.337 E.04909
G1 X144.841 Y149.337
G1 X146.006 Y150.503 E.04909
G1 X145.473 Y150.503
G1 X144.308 Y149.337 E.04909
G1 X143.774 Y149.337
G1 X144.94 Y150.503 E.04909
G1 X144.406 Y150.503
G1 X143.241 Y149.337 E.04909
G1 X142.708 Y149.337
G1 X143.873 Y150.503 E.04909
G1 X143.538 Y150.701
G1 X142.373 Y149.535 E.04909
G1 X142.373 Y150.069
G1 X143.538 Y151.234 E.04909
G1 X143.538 Y151.767
G1 X142.373 Y150.602 E.04909
G1 X142.373 Y151.135
G1 X143.538 Y152.3 E.04909
G1 X143.538 Y152.834
G1 X142.373 Y151.668 E.04909
G1 X142.373 Y152.202
G1 X143.538 Y153.367 E.04909
G1 X143.538 Y153.9
G1 X142.373 Y152.735 E.04909
G1 X142.373 Y153.268
G1 X143.538 Y154.433 E.04909
G1 X143.538 Y154.967
G1 X142.373 Y153.801 E.04909
G1 X142.373 Y154.335
G1 X143.538 Y155.5 E.04909
G1 X143.538 Y156.033
G1 X142.373 Y154.868 E.04909
G1 X142.373 Y155.401
G1 X143.538 Y156.566 E.04909
G1 X143.538 Y157.1
G1 X142.373 Y155.934 E.04909
G1 X142.373 Y156.468
G1 X143.538 Y157.633 E.04909
G1 X143.538 Y158.166
G1 X142.373 Y157.001 E.04909
G1 X142.373 Y157.534
G1 X143.538 Y158.699 E.04909
G1 X143.538 Y159.233
G1 X142.373 Y158.067 E.04909
G1 X142.373 Y158.601
G1 X143.538 Y159.766 E.04909
G1 X143.538 Y160.299
G1 X142.373 Y159.134 E.04909
G1 X142.373 Y159.667
G1 X143.538 Y160.832 E.04909
G1 X143.538 Y161.366
G1 X142.373 Y160.2 E.04909
G1 X142.373 Y160.734
G1 X143.538 Y161.899 E.04909
G1 X143.538 Y162.432
G1 X142.373 Y161.267 E.04909
G1 X142.373 Y161.8
G1 X143.538 Y162.965 E.04909
G1 X143.538 Y163.499
G1 X142.373 Y162.333 E.04909
G1 X142.373 Y162.867
G1 X143.538 Y164.032 E.04909
G1 X143.538 Y164.565
G1 X142.373 Y163.4 E.04909
G1 X142.373 Y163.933
G1 X143.538 Y165.099 E.04909
G1 X143.538 Y165.632
G1 X142.373 Y164.467 E.04909
G1 X142.373 Y165
G1 X143.538 Y166.165 E.04909
G1 X143.538 Y166.698
G1 X142.373 Y165.533 E.04909
G1 X142.373 Y166.066
G1 X143.538 Y167.232 E.04909
G1 X143.538 Y167.765
G1 X142.373 Y166.6 E.04909
G1 X142.373 Y167.133
G1 X143.538 Y168.298 E.04909
G1 X143.538 Y168.831
G1 X142.373 Y167.666 E.04909
G1 X142.373 Y168.199
G1 X143.538 Y169.365 E.04909
G1 X143.538 Y169.898
G1 X142.373 Y168.733 E.04909
G1 X142.373 Y169.266
G1 X143.538 Y170.431 E.04909
G1 X143.538 Y170.964
G1 X142.373 Y169.799 E.04909
G1 X142.373 Y170.332
G1 X143.538 Y171.498 E.04909
G1 X143.538 Y172.031
G1 X142.373 Y170.866 E.04909
G1 X142.373 Y171.399
G1 X143.538 Y172.564 E.04909
G1 X143.538 Y173.097
G1 X142.373 Y171.932 E.04909
G1 X142.373 Y172.465
G1 X143.538 Y173.631 E.04909
G1 X143.538 Y174.164
G1 X142.373 Y172.999 E.04909
G1 X142.373 Y173.532
G1 X143.538 Y174.697 E.04909
G1 X143.538 Y175.23
G1 X142.373 Y174.065 E.04909
G1 X142.373 Y174.598
G1 X143.538 Y175.764 E.04909
G1 X143.538 Y176.297
G1 X142.373 Y175.132 E.04909
G1 X142.373 Y175.665
G1 X143.538 Y176.83 E.04909
G1 X143.538 Y177.363
G1 X142.373 Y176.198 E.04909
G1 X142.373 Y176.731
G1 X143.538 Y177.897 E.04909
G1 X143.538 Y178.43
G1 X142.373 Y177.265 E.04909
G1 X142.373 Y177.798
G1 X143.538 Y178.963 E.04909
G1 X143.538 Y179.496
G1 X142.373 Y178.331 E.04909
G1 X142.373 Y178.864
G1 X143.538 Y180.03 E.04909
G1 X143.538 Y180.563
G1 X142.373 Y179.398 E.04909
G1 X142.373 Y179.931
G1 X143.538 Y181.096 E.04909
G1 X143.538 Y181.63
G1 X142.373 Y180.464 E.04909
G1 X142.373 Y180.998
G1 X143.538 Y182.163 E.04909
G1 X143.538 Y182.696
G1 X142.373 Y181.531 E.04909
G1 X142.373 Y182.064
G1 X143.538 Y183.229 E.04909
G1 X143.538 Y183.763
G1 X142.373 Y182.597 E.04909
G1 X142.373 Y183.131
G1 X143.538 Y184.296 E.04909
G1 X143.538 Y184.829
G1 X142.373 Y183.664 E.04909
G1 X142.373 Y184.197
G1 X143.538 Y185.362 E.04909
G1 X143.538 Y185.896
G1 X142.373 Y184.73 E.04909
M73 P89 R2
G1 X142.373 Y185.264
G1 X143.538 Y186.429 E.04909
G1 X143.538 Y186.962
G1 X142.373 Y185.797 E.04909
G1 X142.373 Y186.33
G1 X143.538 Y187.495 E.04909
G1 X143.538 Y188.029
G1 X142.373 Y186.863 E.04909
G1 X142.373 Y187.397
G1 X143.538 Y188.562 E.04909
G1 X143.538 Y189.095
G1 X142.373 Y187.93 E.04909
G1 X142.373 Y188.463
G1 X143.538 Y189.628 E.04909
G1 X143.538 Y190.162
G1 X142.373 Y188.996 E.04909
G1 X142.373 Y189.53
G1 X143.538 Y190.695 E.04909
G1 X143.538 Y191.228
G1 X142.373 Y190.063 E.04909
G1 X142.373 Y190.596
G1 X143.538 Y191.761 E.04909
G1 X143.538 Y192.295
G1 X142.373 Y191.129 E.04909
G1 X142.373 Y191.663
G1 X143.538 Y192.828 E.04909
G1 X143.538 Y193.361
G1 X142.373 Y192.196 E.04909
G1 X142.373 Y192.729
G1 X143.538 Y193.894 E.04909
G1 X143.538 Y194.428
G1 X142.373 Y193.262 E.04909
G1 X142.373 Y193.796
G1 X143.538 Y194.961 E.04909
G1 X143.538 Y195.494
G1 X142.373 Y194.329 E.04909
G1 X142.373 Y194.862
G1 X143.538 Y196.027 E.04909
G1 X143.538 Y196.561
G1 X142.373 Y195.395 E.04909
G1 X142.373 Y195.929
G1 X143.538 Y197.094 E.04909
G1 X143.538 Y197.627
G1 X142.373 Y196.462 E.04909
G1 X142.373 Y196.995
G1 X143.538 Y198.16 E.04909
G1 X143.538 Y198.694
G1 X142.373 Y197.528 E.04909
G1 X142.373 Y198.062
G1 X143.538 Y199.227 E.04909
G1 X143.538 Y199.76
G1 X142.373 Y198.595 E.04909
G1 X142.373 Y199.128
G1 X143.538 Y200.294 E.04909
G1 X143.538 Y200.827
G1 X142.373 Y199.662 E.04909
G1 X142.373 Y200.195
G1 X143.538 Y201.36 E.04909
G1 X143.538 Y201.893
G1 X142.373 Y200.728 E.04909
G1 X142.373 Y201.261
G1 X143.538 Y202.427 E.04909
G1 X143.538 Y202.96
G1 X142.373 Y201.795 E.04909
G1 X142.373 Y202.328
G1 X144.547 Y204.503 E.09162
G1 X144.014 Y204.503
G1 X142.373 Y202.861 E.06915
G1 X142.373 Y203.394
G1 X143.481 Y204.503 E.04669
G1 X142.948 Y204.503
G1 X142.373 Y203.928 E.02423
; WIPE_START
M204 S5000
G1 X142.948 Y204.503 E-.30905
G1 X143.481 Y204.503 E-.20264
G1 X143.019 Y204.041 E-.24831
; WIPE_END
G1 E-.04 F1800
G1 X142.966 Y196.408 Z1.4 F15000
G1 X142.638 Y149.408 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145685
G1 F7500
G2 X142.354 Y149.367 I-.191 J.323 E.00239
; WIPE_START
G1 X142.54 Y149.367 E-.48617
G1 X142.638 Y149.408 E-.27383
; WIPE_END
G1 E-.04 F1800
G1 X149.042 Y153.56 Z1.4 F15000
G1 X227.557 Y204.473 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.145578
G1 F7500
G3 X227.273 Y204.432 I-.093 J-.363 E.00239
; OBJECT_ID: 104
; WIPE_START
G1 X227.37 Y204.473 E-.27421
G1 X227.557 Y204.473 E-.48579
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 115
M625
; start printing object, unique label id: 104
M624 AQAAAAAAAAA=
G1 X219.925 Y204.35 Z1.4 F15000
G1 X116.226 Y202.684 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X33.806 Y202.684 E2.45501
G1 X33.806 Y150.264 E1.56141
G1 X116.226 Y150.264 E2.45501
G1 X116.226 Y202.624 E1.55963
; WIPE_START
M204 S5000
G1 X114.226 Y202.626 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.806 Y204.264 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X32.226 Y204.264 E2.54914
G1 X32.226 Y148.684 E1.65554
G1 X117.806 Y148.684 E2.54914
G1 X117.806 Y204.204 E1.65375
; WIPE_START
M204 S5000
G1 X115.806 Y204.206 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X116.056 Y196.577 Z1.4 F15000
G1 X117.599 Y149.467 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X117.023 Y148.892 E.02423
G1 X116.49 Y148.892
G1 X117.599 Y150 E.04669
G1 X117.599 Y150.533
G1 X115.957 Y148.892 E.06916
G1 X115.424 Y148.892
G1 X117.599 Y151.067 E.09162
G1 X117.599 Y151.6
G1 X116.433 Y150.435 E.04909
G1 X116.433 Y150.968
G1 X117.599 Y152.133 E.04909
G1 X117.599 Y152.666
G1 X116.433 Y151.501 E.04909
G1 X116.433 Y152.034
G1 X117.599 Y153.2 E.04909
G1 X117.599 Y153.733
G1 X116.433 Y152.568 E.04909
G1 X116.433 Y153.101
G1 X117.599 Y154.266 E.04909
G1 X117.599 Y154.799
G1 X116.433 Y153.634 E.04909
G1 X116.433 Y154.167
G1 X117.599 Y155.333 E.04909
G1 X117.599 Y155.866
G1 X116.433 Y154.701 E.04909
G1 X116.433 Y155.234
G1 X117.599 Y156.399 E.04909
G1 X117.599 Y156.932
G1 X116.433 Y155.767 E.04909
G1 X116.433 Y156.3
G1 X117.599 Y157.466 E.04909
G1 X117.599 Y157.999
G1 X116.433 Y156.834 E.04909
G1 X116.433 Y157.367
G1 X117.599 Y158.532 E.04909
G1 X117.599 Y159.066
G1 X116.433 Y157.9 E.04909
G1 X116.433 Y158.434
G1 X117.599 Y159.599 E.04909
G1 X117.599 Y160.132
G1 X116.433 Y158.967 E.04909
G1 X116.433 Y159.5
M73 P90 R2
G1 X117.599 Y160.665 E.04909
G1 X117.599 Y161.199
G1 X116.433 Y160.033 E.04909
G1 X116.433 Y160.567
G1 X117.599 Y161.732 E.04909
G1 X117.599 Y162.265
G1 X116.433 Y161.1 E.04909
G1 X116.433 Y161.633
G1 X117.599 Y162.798 E.04909
G1 X117.599 Y163.332
G1 X116.433 Y162.166 E.04909
G1 X116.433 Y162.7
G1 X117.599 Y163.865 E.04909
G1 X117.599 Y164.398
G1 X116.433 Y163.233 E.04909
G1 X116.433 Y163.766
G1 X117.599 Y164.931 E.04909
G1 X117.599 Y165.465
G1 X116.433 Y164.299 E.04909
G1 X116.433 Y164.833
G1 X117.599 Y165.998 E.04909
G1 X117.599 Y166.531
G1 X116.433 Y165.366 E.04909
G1 X116.433 Y165.899
G1 X117.599 Y167.064 E.04909
G1 X117.599 Y167.598
G1 X116.433 Y166.432 E.04909
G1 X116.433 Y166.966
G1 X117.599 Y168.131 E.04909
G1 X117.599 Y168.664
G1 X116.433 Y167.499 E.04909
G1 X116.433 Y168.032
G1 X117.599 Y169.197 E.04909
G1 X117.599 Y169.731
G1 X116.433 Y168.565 E.04909
G1 X116.433 Y169.099
G1 X117.599 Y170.264 E.04909
G1 X117.599 Y170.797
G1 X116.433 Y169.632 E.04909
G1 X116.433 Y170.165
G1 X117.599 Y171.33 E.04909
G1 X117.599 Y171.864
G1 X116.433 Y170.698 E.04909
G1 X116.433 Y171.232
G1 X117.599 Y172.397 E.04909
G1 X117.599 Y172.93
G1 X116.433 Y171.765 E.04909
G1 X116.433 Y172.298
G1 X117.599 Y173.463 E.04909
G1 X117.599 Y173.997
G1 X116.433 Y172.831 E.04909
G1 X116.433 Y173.365
G1 X117.599 Y174.53 E.04909
G1 X117.599 Y175.063
G1 X116.433 Y173.898 E.04909
G1 X116.433 Y174.431
G1 X117.599 Y175.596 E.04909
G1 X117.599 Y176.13
G1 X116.433 Y174.965 E.04909
G1 X116.433 Y175.498
G1 X117.599 Y176.663 E.04909
G1 X117.599 Y177.196
G1 X116.433 Y176.031 E.04909
G1 X116.433 Y176.564
G1 X117.599 Y177.73 E.04909
G1 X117.599 Y178.263
G1 X116.433 Y177.098 E.04909
G1 X116.433 Y177.631
G1 X117.599 Y178.796 E.04909
G1 X117.599 Y179.329
G1 X116.433 Y178.164 E.04909
G1 X116.433 Y178.697
G1 X117.599 Y179.863 E.04909
G1 X117.599 Y180.396
G1 X116.433 Y179.231 E.04909
G1 X116.433 Y179.764
G1 X117.599 Y180.929 E.04909
G1 X117.599 Y181.462
G1 X116.433 Y180.297 E.04909
G1 X116.433 Y180.83
G1 X117.599 Y181.996 E.04909
G1 X117.599 Y182.529
G1 X116.433 Y181.364 E.04909
G1 X116.433 Y181.897
G1 X117.599 Y183.062 E.04909
G1 X117.599 Y183.595
G1 X116.433 Y182.43 E.04909
G1 X116.433 Y182.963
G1 X117.599 Y184.129 E.04909
G1 X117.599 Y184.662
G1 X116.433 Y183.497 E.04909
G1 X116.433 Y184.03
G1 X117.599 Y185.195 E.04909
G1 X117.599 Y185.728
M73 P90 R1
G1 X116.433 Y184.563 E.04909
G1 X116.433 Y185.096
G1 X117.599 Y186.262 E.04909
G1 X117.599 Y186.795
G1 X116.433 Y185.63 E.04909
G1 X116.433 Y186.163
G1 X117.599 Y187.328 E.04909
G1 X117.599 Y187.861
G1 X116.433 Y186.696 E.04909
G1 X116.433 Y187.229
G1 X117.599 Y188.395 E.04909
G1 X117.599 Y188.928
G1 X116.433 Y187.763 E.04909
G1 X116.433 Y188.296
G1 X117.599 Y189.461 E.04909
G1 X117.599 Y189.994
G1 X116.433 Y188.829 E.04909
G1 X116.433 Y189.362
G1 X117.599 Y190.528 E.04909
G1 X117.599 Y191.061
G1 X116.433 Y189.896 E.04909
G1 X116.433 Y190.429
G1 X117.599 Y191.594 E.04909
G1 X117.599 Y192.127
G1 X116.433 Y190.962 E.04909
G1 X116.433 Y191.495
G1 X117.599 Y192.661 E.04909
G1 X117.599 Y193.194
G1 X116.433 Y192.029 E.04909
G1 X116.433 Y192.562
G1 X117.599 Y193.727 E.04909
G1 X117.599 Y194.261
G1 X116.433 Y193.095 E.04909
G1 X116.433 Y193.629
G1 X117.599 Y194.794 E.04909
G1 X117.599 Y195.327
G1 X116.433 Y194.162 E.04909
G1 X116.433 Y194.695
G1 X117.599 Y195.86 E.04909
G1 X117.599 Y196.394
G1 X116.433 Y195.228 E.04909
G1 X116.433 Y195.762
G1 X117.599 Y196.927 E.04909
G1 X117.599 Y197.46
G1 X116.433 Y196.295 E.04909
G1 X116.433 Y196.828
G1 X117.599 Y197.993 E.04909
G1 X117.599 Y198.527
G1 X116.433 Y197.361 E.04909
G1 X116.433 Y197.895
G1 X117.599 Y199.06 E.04909
G1 X117.599 Y199.593
G1 X116.433 Y198.428 E.04909
G1 X116.433 Y198.961
G1 X117.599 Y200.126 E.04909
G1 X117.599 Y200.66
G1 X116.433 Y199.494 E.04909
G1 X116.433 Y200.028
G1 X117.599 Y201.193 E.04909
G1 X117.599 Y201.726
G1 X116.433 Y200.561 E.04909
G1 X116.433 Y201.094
G1 X117.599 Y202.259 E.04909
G1 X117.599 Y202.793
G1 X116.433 Y201.627 E.04909
G1 X116.433 Y202.161
G1 X117.599 Y203.326 E.04909
G1 X117.599 Y203.859
G1 X116.433 Y202.694 E.04909
G1 X116.098 Y202.892
G1 X117.263 Y204.057 E.04909
G1 X116.73 Y204.057
G1 X115.565 Y202.892 E.04909
G1 X115.031 Y202.892
G1 X116.197 Y204.057 E.04909
G1 X115.663 Y204.057
G1 X114.498 Y202.892 E.04909
G1 X113.965 Y202.892
G1 X115.13 Y204.057 E.04909
G1 X114.597 Y204.057
G1 X113.432 Y202.892 E.04909
G1 X112.898 Y202.892
G1 X114.064 Y204.057 E.04909
G1 X113.53 Y204.057
G1 X112.365 Y202.892 E.04909
G1 X111.832 Y202.892
G1 X112.997 Y204.057 E.04909
G1 X112.464 Y204.057
G1 X111.299 Y202.892 E.04909
G1 X110.765 Y202.892
G1 X111.931 Y204.057 E.04909
G1 X111.397 Y204.057
G1 X110.232 Y202.892 E.04909
G1 X109.699 Y202.892
G1 X110.864 Y204.057 E.04909
G1 X110.331 Y204.057
G1 X109.166 Y202.892 E.04909
G1 X108.632 Y202.892
G1 X109.797 Y204.057 E.04909
G1 X109.264 Y204.057
G1 X108.099 Y202.892 E.04909
G1 X107.566 Y202.892
G1 X108.731 Y204.057 E.04909
G1 X108.198 Y204.057
G1 X107.032 Y202.892 E.04909
G1 X106.499 Y202.892
G1 X107.664 Y204.057 E.04909
G1 X107.131 Y204.057
G1 X105.966 Y202.892 E.04909
G1 X105.433 Y202.892
G1 X106.598 Y204.057 E.04909
G1 X106.065 Y204.057
G1 X104.899 Y202.892 E.04909
G1 X104.366 Y202.892
G1 X105.531 Y204.057 E.04909
G1 X104.998 Y204.057
G1 X103.833 Y202.892 E.04909
G1 X103.3 Y202.892
G1 X104.465 Y204.057 E.04909
G1 X103.932 Y204.057
G1 X102.766 Y202.892 E.04909
G1 X102.233 Y202.892
G1 X103.398 Y204.057 E.04909
G1 X102.865 Y204.057
G1 X101.7 Y202.892 E.04909
G1 X101.167 Y202.892
G1 X102.332 Y204.057 E.04909
G1 X101.799 Y204.057
G1 X100.633 Y202.892 E.04909
G1 X100.1 Y202.892
G1 X101.265 Y204.057 E.04909
G1 X100.732 Y204.057
G1 X99.567 Y202.892 E.04909
G1 X99.034 Y202.892
G1 X100.199 Y204.057 E.04909
G1 X99.666 Y204.057
G1 X98.5 Y202.892 E.04909
G1 X97.967 Y202.892
G1 X99.132 Y204.057 E.04909
G1 X98.599 Y204.057
G1 X97.434 Y202.892 E.04909
G1 X96.901 Y202.892
G1 X98.066 Y204.057 E.04909
G1 X97.533 Y204.057
G1 X96.367 Y202.892 E.04909
G1 X95.834 Y202.892
G1 X96.999 Y204.057 E.04909
G1 X96.466 Y204.057
G1 X95.301 Y202.892 E.04909
G1 X94.768 Y202.892
G1 X95.933 Y204.057 E.04909
G1 X95.4 Y204.057
G1 X94.234 Y202.892 E.04909
G1 X93.701 Y202.892
G1 X94.866 Y204.057 E.04909
G1 X94.333 Y204.057
G1 X93.168 Y202.892 E.04909
G1 X92.635 Y202.892
G1 X93.8 Y204.057 E.04909
G1 X93.267 Y204.057
G1 X92.101 Y202.892 E.04909
M73 P91 R1
G1 X91.568 Y202.892
G1 X92.733 Y204.057 E.04909
G1 X92.2 Y204.057
G1 X91.035 Y202.892 E.04909
G1 X90.501 Y202.892
G1 X91.667 Y204.057 E.04909
G1 X91.133 Y204.057
G1 X89.968 Y202.892 E.04909
G1 X89.435 Y202.892
G1 X90.6 Y204.057 E.04909
G1 X90.067 Y204.057
G1 X88.902 Y202.892 E.04909
G1 X88.368 Y202.892
G1 X89.534 Y204.057 E.04909
G1 X89 Y204.057
G1 X87.835 Y202.892 E.04909
G1 X87.302 Y202.892
G1 X88.467 Y204.057 E.04909
G1 X87.934 Y204.057
G1 X86.769 Y202.892 E.04909
G1 X86.235 Y202.892
G1 X87.401 Y204.057 E.04909
G1 X86.867 Y204.057
G1 X85.702 Y202.892 E.04909
G1 X85.169 Y202.892
G1 X86.334 Y204.057 E.04909
G1 X85.801 Y204.057
G1 X84.636 Y202.892 E.04909
G1 X84.102 Y202.892
G1 X85.268 Y204.057 E.04909
G1 X84.734 Y204.057
G1 X83.569 Y202.892 E.04909
G1 X83.036 Y202.892
G1 X84.201 Y204.057 E.04909
G1 X83.668 Y204.057
G1 X82.503 Y202.892 E.04909
G1 X81.969 Y202.892
G1 X83.135 Y204.057 E.04909
G1 X82.601 Y204.057
G1 X81.436 Y202.892 E.04909
G1 X80.903 Y202.892
G1 X82.068 Y204.057 E.04909
G1 X81.535 Y204.057
G1 X80.37 Y202.892 E.04909
G1 X79.836 Y202.892
G1 X81.002 Y204.057 E.04909
G1 X80.468 Y204.057
G1 X79.303 Y202.892 E.04909
G1 X78.77 Y202.892
G1 X79.935 Y204.057 E.04909
G1 X79.402 Y204.057
G1 X78.237 Y202.892 E.04909
G1 X77.703 Y202.892
G1 X78.869 Y204.057 E.04909
G1 X78.335 Y204.057
G1 X77.17 Y202.892 E.04909
G1 X76.637 Y202.892
G1 X77.802 Y204.057 E.04909
G1 X77.269 Y204.057
G1 X76.104 Y202.892 E.04909
G1 X75.57 Y202.892
G1 X76.736 Y204.057 E.04909
G1 X76.202 Y204.057
G1 X75.037 Y202.892 E.04909
G1 X74.504 Y202.892
G1 X75.669 Y204.057 E.04909
G1 X75.136 Y204.057
G1 X73.971 Y202.892 E.04909
G1 X73.437 Y202.892
G1 X74.603 Y204.057 E.04909
G1 X74.069 Y204.057
G1 X72.904 Y202.892 E.04909
G1 X72.371 Y202.892
G1 X73.536 Y204.057 E.04909
G1 X73.003 Y204.057
G1 X71.837 Y202.892 E.04909
G1 X71.304 Y202.892
G1 X72.469 Y204.057 E.04909
G1 X71.936 Y204.057
G1 X70.771 Y202.892 E.04909
G1 X70.238 Y202.892
G1 X71.403 Y204.057 E.04909
G1 X70.87 Y204.057
G1 X69.704 Y202.892 E.04909
G1 X69.171 Y202.892
G1 X70.336 Y204.057 E.04909
G1 X69.803 Y204.057
G1 X68.638 Y202.892 E.04909
G1 X68.105 Y202.892
G1 X69.27 Y204.057 E.04909
G1 X68.737 Y204.057
G1 X67.571 Y202.892 E.04909
G1 X67.038 Y202.892
G1 X68.203 Y204.057 E.04909
G1 X67.67 Y204.057
G1 X66.505 Y202.892 E.04909
G1 X65.972 Y202.892
G1 X67.137 Y204.057 E.04909
G1 X66.604 Y204.057
G1 X65.438 Y202.892 E.04909
G1 X64.905 Y202.892
G1 X66.07 Y204.057 E.04909
G1 X65.537 Y204.057
G1 X64.372 Y202.892 E.04909
G1 X63.839 Y202.892
G1 X65.004 Y204.057 E.04909
G1 X64.471 Y204.057
G1 X63.305 Y202.892 E.04909
G1 X62.772 Y202.892
G1 X63.937 Y204.057 E.04909
G1 X63.404 Y204.057
G1 X62.239 Y202.892 E.04909
G1 X61.706 Y202.892
G1 X62.871 Y204.057 E.04909
G1 X62.338 Y204.057
G1 X61.172 Y202.892 E.04909
G1 X60.639 Y202.892
G1 X61.804 Y204.057 E.04909
G1 X61.271 Y204.057
G1 X60.106 Y202.892 E.04909
G1 X59.573 Y202.892
G1 X60.738 Y204.057 E.04909
G1 X60.205 Y204.057
G1 X59.039 Y202.892 E.04909
G1 X58.506 Y202.892
G1 X59.671 Y204.057 E.04909
G1 X59.138 Y204.057
G1 X57.973 Y202.892 E.04909
G1 X57.44 Y202.892
G1 X58.605 Y204.057 E.04909
G1 X58.072 Y204.057
G1 X56.906 Y202.892 E.04909
G1 X56.373 Y202.892
G1 X57.538 Y204.057 E.04909
G1 X57.005 Y204.057
G1 X55.84 Y202.892 E.04909
G1 X55.306 Y202.892
G1 X56.472 Y204.057 E.04909
G1 X55.938 Y204.057
G1 X54.773 Y202.892 E.04909
G1 X54.24 Y202.892
G1 X55.405 Y204.057 E.04909
G1 X54.872 Y204.057
G1 X53.707 Y202.892 E.04909
G1 X53.173 Y202.892
G1 X54.339 Y204.057 E.04909
G1 X53.805 Y204.057
G1 X52.64 Y202.892 E.04909
G1 X52.107 Y202.892
G1 X53.272 Y204.057 E.04909
G1 X52.739 Y204.057
G1 X51.574 Y202.892 E.04909
G1 X51.04 Y202.892
G1 X52.206 Y204.057 E.04909
G1 X51.672 Y204.057
G1 X50.507 Y202.892 E.04909
G1 X49.974 Y202.892
G1 X51.139 Y204.057 E.04909
G1 X50.606 Y204.057
G1 X49.441 Y202.892 E.04909
G1 X48.907 Y202.892
G1 X50.073 Y204.057 E.04909
G1 X49.539 Y204.057
G1 X48.374 Y202.892 E.04909
G1 X47.841 Y202.892
G1 X49.006 Y204.057 E.04909
G1 X48.473 Y204.057
G1 X47.308 Y202.892 E.04909
G1 X46.774 Y202.892
G1 X47.94 Y204.057 E.04909
G1 X47.406 Y204.057
G1 X46.241 Y202.892 E.04909
G1 X45.708 Y202.892
G1 X46.873 Y204.057 E.04909
G1 X46.34 Y204.057
G1 X45.175 Y202.892 E.04909
G1 X44.641 Y202.892
G1 X45.807 Y204.057 E.04909
G1 X45.273 Y204.057
G1 X44.108 Y202.892 E.04909
G1 X43.575 Y202.892
G1 X44.74 Y204.057 E.04909
G1 X44.207 Y204.057
G1 X43.042 Y202.892 E.04909
G1 X42.508 Y202.892
G1 X43.674 Y204.057 E.04909
G1 X43.14 Y204.057
G1 X41.975 Y202.892 E.04909
G1 X41.442 Y202.892
G1 X42.607 Y204.057 E.04909
G1 X42.074 Y204.057
G1 X40.909 Y202.892 E.04909
G1 X40.375 Y202.892
G1 X41.541 Y204.057 E.04909
G1 X41.007 Y204.057
G1 X39.842 Y202.892 E.04909
G1 X39.309 Y202.892
G1 X40.474 Y204.057 E.04909
G1 X39.941 Y204.057
G1 X38.776 Y202.892 E.04909
G1 X38.242 Y202.892
G1 X39.408 Y204.057 E.04909
G1 X38.874 Y204.057
G1 X37.709 Y202.892 E.04909
G1 X37.176 Y202.892
G1 X38.341 Y204.057 E.04909
G1 X37.808 Y204.057
G1 X36.642 Y202.892 E.04909
G1 X36.109 Y202.892
G1 X37.274 Y204.057 E.04909
G1 X36.741 Y204.057
G1 X35.576 Y202.892 E.04909
G1 X35.043 Y202.892
G1 X36.208 Y204.057 E.04909
G1 X35.675 Y204.057
G1 X34.509 Y202.892 E.04909
G1 X33.976 Y202.892
G1 X35.141 Y204.057 E.04909
; WIPE_START
M204 S5000
G1 X33.976 Y202.892 E-.62621
G1 X34.328 Y202.892 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X40.668 Y198.642 Z1.4 F15000
G1 X114.89 Y148.892 Z1.4
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X116.056 Y150.057 E.04909
G1 X115.522 Y150.057
G1 X114.357 Y148.892 E.04909
G1 X113.824 Y148.892
G1 X114.989 Y150.057 E.04909
G1 X114.456 Y150.057
G1 X113.291 Y148.892 E.04909
G1 X112.757 Y148.892
G1 X113.923 Y150.057 E.04909
G1 X113.389 Y150.057
G1 X112.224 Y148.892 E.04909
G1 X111.691 Y148.892
G1 X112.856 Y150.057 E.04909
G1 X112.323 Y150.057
G1 X111.158 Y148.892 E.04909
G1 X110.624 Y148.892
G1 X111.79 Y150.057 E.04909
G1 X111.256 Y150.057
G1 X110.091 Y148.892 E.04909
G1 X109.558 Y148.892
G1 X110.723 Y150.057 E.04909
G1 X110.19 Y150.057
G1 X109.025 Y148.892 E.04909
G1 X108.491 Y148.892
G1 X109.656 Y150.057 E.04909
G1 X109.123 Y150.057
G1 X107.958 Y148.892 E.04909
G1 X107.425 Y148.892
G1 X108.59 Y150.057 E.04909
G1 X108.057 Y150.057
G1 X106.891 Y148.892 E.04909
G1 X106.358 Y148.892
G1 X107.523 Y150.057 E.04909
G1 X106.99 Y150.057
G1 X105.825 Y148.892 E.04909
G1 X105.292 Y148.892
G1 X106.457 Y150.057 E.04909
G1 X105.924 Y150.057
G1 X104.758 Y148.892 E.04909
G1 X104.225 Y148.892
G1 X105.39 Y150.057 E.04909
G1 X104.857 Y150.057
G1 X103.692 Y148.892 E.04909
G1 X103.159 Y148.892
G1 X104.324 Y150.057 E.04909
G1 X103.791 Y150.057
G1 X102.625 Y148.892 E.04909
M73 P92 R1
G1 X102.092 Y148.892
G1 X103.257 Y150.057 E.04909
G1 X102.724 Y150.057
G1 X101.559 Y148.892 E.04909
G1 X101.026 Y148.892
G1 X102.191 Y150.057 E.04909
G1 X101.658 Y150.057
G1 X100.492 Y148.892 E.04909
G1 X99.959 Y148.892
G1 X101.124 Y150.057 E.04909
G1 X100.591 Y150.057
G1 X99.426 Y148.892 E.04909
G1 X98.893 Y148.892
G1 X100.058 Y150.057 E.04909
G1 X99.525 Y150.057
G1 X98.359 Y148.892 E.04909
G1 X97.826 Y148.892
G1 X98.991 Y150.057 E.04909
G1 X98.458 Y150.057
G1 X97.293 Y148.892 E.04909
G1 X96.76 Y148.892
G1 X97.925 Y150.057 E.04909
G1 X97.392 Y150.057
G1 X96.226 Y148.892 E.04909
G1 X95.693 Y148.892
G1 X96.858 Y150.057 E.04909
G1 X96.325 Y150.057
G1 X95.16 Y148.892 E.04909
G1 X94.627 Y148.892
G1 X95.792 Y150.057 E.04909
G1 X95.259 Y150.057
G1 X94.093 Y148.892 E.04909
G1 X93.56 Y148.892
G1 X94.725 Y150.057 E.04909
G1 X94.192 Y150.057
G1 X93.027 Y148.892 E.04909
G1 X92.494 Y148.892
G1 X93.659 Y150.057 E.04909
G1 X93.126 Y150.057
G1 X91.96 Y148.892 E.04909
G1 X91.427 Y148.892
G1 X92.592 Y150.057 E.04909
G1 X92.059 Y150.057
G1 X90.894 Y148.892 E.04909
G1 X90.36 Y148.892
G1 X91.526 Y150.057 E.04909
G1 X90.992 Y150.057
G1 X89.827 Y148.892 E.04909
G1 X89.294 Y148.892
G1 X90.459 Y150.057 E.04909
G1 X89.926 Y150.057
G1 X88.761 Y148.892 E.04909
G1 X88.227 Y148.892
G1 X89.393 Y150.057 E.04909
G1 X88.859 Y150.057
G1 X87.694 Y148.892 E.04909
G1 X87.161 Y148.892
G1 X88.326 Y150.057 E.04909
G1 X87.793 Y150.057
G1 X86.628 Y148.892 E.04909
G1 X86.094 Y148.892
G1 X87.26 Y150.057 E.04909
G1 X86.726 Y150.057
G1 X85.561 Y148.892 E.04909
G1 X85.028 Y148.892
G1 X86.193 Y150.057 E.04909
G1 X85.66 Y150.057
G1 X84.495 Y148.892 E.04909
G1 X83.961 Y148.892
G1 X85.127 Y150.057 E.04909
G1 X84.593 Y150.057
G1 X83.428 Y148.892 E.04909
G1 X82.895 Y148.892
G1 X84.06 Y150.057 E.04909
G1 X83.527 Y150.057
G1 X82.362 Y148.892 E.04909
G1 X81.828 Y148.892
G1 X82.994 Y150.057 E.04909
G1 X82.46 Y150.057
G1 X81.295 Y148.892 E.04909
G1 X80.762 Y148.892
G1 X81.927 Y150.057 E.04909
G1 X81.394 Y150.057
G1 X80.229 Y148.892 E.04909
G1 X79.695 Y148.892
G1 X80.861 Y150.057 E.04909
G1 X80.327 Y150.057
G1 X79.162 Y148.892 E.04909
G1 X78.629 Y148.892
G1 X79.794 Y150.057 E.04909
G1 X79.261 Y150.057
G1 X78.096 Y148.892 E.04909
G1 X77.562 Y148.892
G1 X78.728 Y150.057 E.04909
G1 X78.194 Y150.057
G1 X77.029 Y148.892 E.04909
G1 X76.496 Y148.892
G1 X77.661 Y150.057 E.04909
G1 X77.128 Y150.057
G1 X75.963 Y148.892 E.04909
G1 X75.429 Y148.892
G1 X76.595 Y150.057 E.04909
G1 X76.061 Y150.057
G1 X74.896 Y148.892 E.04909
G1 X74.363 Y148.892
G1 X75.528 Y150.057 E.04909
G1 X74.995 Y150.057
G1 X73.83 Y148.892 E.04909
G1 X73.296 Y148.892
G1 X74.461 Y150.057 E.04909
G1 X73.928 Y150.057
G1 X72.763 Y148.892 E.04909
G1 X72.23 Y148.892
G1 X73.395 Y150.057 E.04909
G1 X72.862 Y150.057
G1 X71.696 Y148.892 E.04909
G1 X71.163 Y148.892
G1 X72.328 Y150.057 E.04909
G1 X71.795 Y150.057
G1 X70.63 Y148.892 E.04909
G1 X70.097 Y148.892
G1 X71.262 Y150.057 E.04909
G1 X70.729 Y150.057
G1 X69.563 Y148.892 E.04909
G1 X69.03 Y148.892
G1 X70.195 Y150.057 E.04909
G1 X69.662 Y150.057
G1 X68.497 Y148.892 E.04909
G1 X67.964 Y148.892
G1 X69.129 Y150.057 E.04909
G1 X68.596 Y150.057
G1 X67.43 Y148.892 E.04909
G1 X66.897 Y148.892
G1 X68.062 Y150.057 E.04909
G1 X67.529 Y150.057
G1 X66.364 Y148.892 E.04909
G1 X65.831 Y148.892
G1 X66.996 Y150.057 E.04909
G1 X66.463 Y150.057
G1 X65.297 Y148.892 E.04909
G1 X64.764 Y148.892
G1 X65.929 Y150.057 E.04909
G1 X65.396 Y150.057
G1 X64.231 Y148.892 E.04909
G1 X63.698 Y148.892
G1 X64.863 Y150.057 E.04909
G1 X64.33 Y150.057
G1 X63.164 Y148.892 E.04909
G1 X62.631 Y148.892
G1 X63.796 Y150.057 E.04909
G1 X63.263 Y150.057
G1 X62.098 Y148.892 E.04909
G1 X61.565 Y148.892
G1 X62.73 Y150.057 E.04909
G1 X62.197 Y150.057
G1 X61.031 Y148.892 E.04909
G1 X60.498 Y148.892
G1 X61.663 Y150.057 E.04909
G1 X61.13 Y150.057
G1 X59.965 Y148.892 E.04909
G1 X59.432 Y148.892
G1 X60.597 Y150.057 E.04909
G1 X60.064 Y150.057
G1 X58.898 Y148.892 E.04909
G1 X58.365 Y148.892
G1 X59.53 Y150.057 E.04909
G1 X58.997 Y150.057
G1 X57.832 Y148.892 E.04909
G1 X57.299 Y148.892
G1 X58.464 Y150.057 E.04909
G1 X57.931 Y150.057
G1 X56.765 Y148.892 E.04909
G1 X56.232 Y148.892
G1 X57.397 Y150.057 E.04909
G1 X56.864 Y150.057
G1 X55.699 Y148.892 E.04909
G1 X55.165 Y148.892
G1 X56.331 Y150.057 E.04909
G1 X55.797 Y150.057
G1 X54.632 Y148.892 E.04909
G1 X54.099 Y148.892
G1 X55.264 Y150.057 E.04909
G1 X54.731 Y150.057
G1 X53.566 Y148.892 E.04909
G1 X53.032 Y148.892
G1 X54.198 Y150.057 E.04909
G1 X53.664 Y150.057
G1 X52.499 Y148.892 E.04909
G1 X51.966 Y148.892
G1 X53.131 Y150.057 E.04909
G1 X52.598 Y150.057
G1 X51.433 Y148.892 E.04909
G1 X50.899 Y148.892
G1 X52.065 Y150.057 E.04909
G1 X51.531 Y150.057
G1 X50.366 Y148.892 E.04909
G1 X49.833 Y148.892
G1 X50.998 Y150.057 E.04909
G1 X50.465 Y150.057
G1 X49.3 Y148.892 E.04909
G1 X48.766 Y148.892
G1 X49.932 Y150.057 E.04909
G1 X49.398 Y150.057
G1 X48.233 Y148.892 E.04909
G1 X47.7 Y148.892
G1 X48.865 Y150.057 E.04909
G1 X48.332 Y150.057
G1 X47.167 Y148.892 E.04909
G1 X46.633 Y148.892
G1 X47.799 Y150.057 E.04909
G1 X47.265 Y150.057
G1 X46.1 Y148.892 E.04909
G1 X45.567 Y148.892
G1 X46.732 Y150.057 E.04909
G1 X46.199 Y150.057
G1 X45.034 Y148.892 E.04909
G1 X44.5 Y148.892
G1 X45.666 Y150.057 E.04909
G1 X45.132 Y150.057
G1 X43.967 Y148.892 E.04909
G1 X43.434 Y148.892
G1 X44.599 Y150.057 E.04909
G1 X44.066 Y150.057
G1 X42.901 Y148.892 E.04909
G1 X42.367 Y148.892
G1 X43.533 Y150.057 E.04909
G1 X42.999 Y150.057
G1 X41.834 Y148.892 E.04909
G1 X41.301 Y148.892
G1 X42.466 Y150.057 E.04909
G1 X41.933 Y150.057
G1 X40.768 Y148.892 E.04909
G1 X40.234 Y148.892
G1 X41.4 Y150.057 E.04909
G1 X40.866 Y150.057
G1 X39.701 Y148.892 E.04909
G1 X39.168 Y148.892
G1 X40.333 Y150.057 E.04909
G1 X39.8 Y150.057
G1 X38.635 Y148.892 E.04909
G1 X38.101 Y148.892
G1 X39.267 Y150.057 E.04909
G1 X38.733 Y150.057
G1 X37.568 Y148.892 E.04909
G1 X37.035 Y148.892
G1 X38.2 Y150.057 E.04909
G1 X37.667 Y150.057
G1 X36.501 Y148.892 E.04909
G1 X35.968 Y148.892
G1 X37.133 Y150.057 E.04909
G1 X36.6 Y150.057
G1 X35.435 Y148.892 E.04909
G1 X34.902 Y148.892
G1 X36.067 Y150.057 E.04909
G1 X35.534 Y150.057
G1 X34.368 Y148.892 E.04909
G1 X33.835 Y148.892
G1 X35 Y150.057 E.04909
G1 X34.467 Y150.057
G1 X33.302 Y148.892 E.04909
G1 X32.769 Y148.892
G1 X33.934 Y150.057 E.04909
G1 X33.599 Y150.255
G1 X32.433 Y149.09 E.04909
G1 X32.433 Y149.623
M73 P93 R1
G1 X33.599 Y150.788 E.04909
G1 X33.599 Y151.321
G1 X32.433 Y150.156 E.04909
G1 X32.433 Y150.689
G1 X33.599 Y151.855 E.04909
G1 X33.599 Y152.388
G1 X32.433 Y151.223 E.04909
G1 X32.433 Y151.756
G1 X33.599 Y152.921 E.04909
G1 X33.599 Y153.454
G1 X32.433 Y152.289 E.04909
G1 X32.433 Y152.822
G1 X33.599 Y153.988 E.04909
G1 X33.599 Y154.521
G1 X32.433 Y153.356 E.04909
G1 X32.433 Y153.889
G1 X33.599 Y155.054 E.04909
G1 X33.599 Y155.587
G1 X32.433 Y154.422 E.04909
G1 X32.433 Y154.955
G1 X33.599 Y156.121 E.04909
G1 X33.599 Y156.654
G1 X32.433 Y155.489 E.04909
G1 X32.433 Y156.022
G1 X33.599 Y157.187 E.04909
G1 X33.599 Y157.72
G1 X32.433 Y156.555 E.04909
G1 X32.433 Y157.088
G1 X33.599 Y158.254 E.04909
G1 X33.599 Y158.787
G1 X32.433 Y157.622 E.04909
G1 X32.433 Y158.155
G1 X33.599 Y159.32 E.04909
G1 X33.599 Y159.853
G1 X32.433 Y158.688 E.04909
G1 X32.433 Y159.221
G1 X33.599 Y160.387 E.04909
G1 X33.599 Y160.92
G1 X32.433 Y159.755 E.04909
G1 X32.433 Y160.288
G1 X33.599 Y161.453 E.04909
G1 X33.599 Y161.986
G1 X32.433 Y160.821 E.04909
G1 X32.433 Y161.354
G1 X33.599 Y162.52 E.04909
G1 X33.599 Y163.053
G1 X32.433 Y161.888 E.04909
G1 X32.433 Y162.421
G1 X33.599 Y163.586 E.04909
G1 X33.599 Y164.12
G1 X32.433 Y162.954 E.04909
G1 X32.433 Y163.488
G1 X33.599 Y164.653 E.04909
G1 X33.599 Y165.186
G1 X32.433 Y164.021 E.04909
G1 X32.433 Y164.554
G1 X33.599 Y165.719 E.04909
G1 X33.599 Y166.253
G1 X32.433 Y165.087 E.04909
G1 X32.433 Y165.621
G1 X33.599 Y166.786 E.04909
G1 X33.599 Y167.319
G1 X32.433 Y166.154 E.04909
G1 X32.433 Y166.687
G1 X33.599 Y167.852 E.04909
G1 X33.599 Y168.386
G1 X32.433 Y167.22 E.04909
G1 X32.433 Y167.754
G1 X33.599 Y168.919 E.04909
G1 X33.599 Y169.452
G1 X32.433 Y168.287 E.04909
G1 X32.433 Y168.82
G1 X33.599 Y169.985 E.04909
G1 X33.599 Y170.519
G1 X32.433 Y169.353 E.04909
G1 X32.433 Y169.887
G1 X33.599 Y171.052 E.04909
G1 X33.599 Y171.585
G1 X32.433 Y170.42 E.04909
G1 X32.433 Y170.953
G1 X33.599 Y172.118 E.04909
G1 X33.599 Y172.652
G1 X32.433 Y171.486 E.04909
G1 X32.433 Y172.02
G1 X33.599 Y173.185 E.04909
G1 X33.599 Y173.718
G1 X32.433 Y172.553 E.04909
G1 X32.433 Y173.086
G1 X33.599 Y174.251 E.04909
G1 X33.599 Y174.785
G1 X32.433 Y173.619 E.04909
G1 X32.433 Y174.153
G1 X33.599 Y175.318 E.04909
G1 X33.599 Y175.851
G1 X32.433 Y174.686 E.04909
G1 X32.433 Y175.219
G1 X33.599 Y176.384 E.04909
G1 X33.599 Y176.918
G1 X32.433 Y175.752 E.04909
G1 X32.433 Y176.286
G1 X33.599 Y177.451 E.04909
G1 X33.599 Y177.984
G1 X32.433 Y176.819 E.04909
G1 X32.433 Y177.352
G1 X33.599 Y178.517 E.04909
G1 X33.599 Y179.051
G1 X32.433 Y177.885 E.04909
G1 X32.433 Y178.419
G1 X33.599 Y179.584 E.04909
G1 X33.599 Y180.117
G1 X32.433 Y178.952 E.04909
G1 X32.433 Y179.485
G1 X33.599 Y180.65 E.04909
G1 X33.599 Y181.184
G1 X32.433 Y180.019 E.04909
G1 X32.433 Y180.552
G1 X33.599 Y181.717 E.04909
G1 X33.599 Y182.25
G1 X32.433 Y181.085 E.04909
G1 X32.433 Y181.618
G1 X33.599 Y182.784 E.04909
G1 X33.599 Y183.317
G1 X32.433 Y182.152 E.04909
G1 X32.433 Y182.685
G1 X33.599 Y183.85 E.04909
G1 X33.599 Y184.383
G1 X32.433 Y183.218 E.04909
G1 X32.433 Y183.751
G1 X33.599 Y184.917 E.04909
G1 X33.599 Y185.45
G1 X32.433 Y184.285 E.04909
G1 X32.433 Y184.818
G1 X33.599 Y185.983 E.04909
G1 X33.599 Y186.516
G1 X32.433 Y185.351 E.04909
G1 X32.433 Y185.884
G1 X33.599 Y187.05 E.04909
G1 X33.599 Y187.583
G1 X32.433 Y186.418 E.04909
G1 X32.433 Y186.951
G1 X33.599 Y188.116 E.04909
G1 X33.599 Y188.649
G1 X32.433 Y187.484 E.04909
G1 X32.433 Y188.017
G1 X33.599 Y189.183 E.04909
G1 X33.599 Y189.716
G1 X32.433 Y188.551 E.04909
G1 X32.433 Y189.084
G1 X33.599 Y190.249 E.04909
G1 X33.599 Y190.782
G1 X32.433 Y189.617 E.04909
G1 X32.433 Y190.15
G1 X33.599 Y191.316 E.04909
G1 X33.599 Y191.849
G1 X32.433 Y190.684 E.04909
G1 X32.433 Y191.217
G1 X33.599 Y192.382 E.04909
G1 X33.599 Y192.915
G1 X32.433 Y191.75 E.04909
G1 X32.433 Y192.283
G1 X33.599 Y193.449 E.04909
G1 X33.599 Y193.982
G1 X32.433 Y192.817 E.04909
G1 X32.433 Y193.35
G1 X33.599 Y194.515 E.04909
G1 X33.599 Y195.048
G1 X32.433 Y193.883 E.04909
G1 X32.433 Y194.416
G1 X33.599 Y195.582 E.04909
G1 X33.599 Y196.115
G1 X32.433 Y194.95 E.04909
G1 X32.433 Y195.483
G1 X33.599 Y196.648 E.04909
G1 X33.599 Y197.181
G1 X32.433 Y196.016 E.04909
G1 X32.433 Y196.549
G1 X33.599 Y197.715 E.04909
G1 X33.599 Y198.248
G1 X32.433 Y197.083 E.04909
G1 X32.433 Y197.616
G1 X33.599 Y198.781 E.04909
G1 X33.599 Y199.315
G1 X32.433 Y198.149 E.04909
G1 X32.433 Y198.683
G1 X33.599 Y199.848 E.04909
G1 X33.599 Y200.381
G1 X32.433 Y199.216 E.04909
G1 X32.433 Y199.749
G1 X33.599 Y200.914 E.04909
G1 X33.599 Y201.448
G1 X32.433 Y200.282 E.04909
G1 X32.433 Y200.816
G1 X33.599 Y201.981 E.04909
G1 X33.599 Y202.514
G1 X32.433 Y201.349 E.04909
G1 X32.433 Y201.882
G1 X34.608 Y204.057 E.09162
G1 X34.075 Y204.057
G1 X32.433 Y202.415 E.06915
G1 X32.433 Y202.949
G1 X33.542 Y204.057 E.04669
G1 X33.008 Y204.057
G1 X32.433 Y203.482 E.02423
; WIPE_START
M204 S5000
G1 X33.008 Y204.057 E-.30905
G1 X33.542 Y204.057 E-.20264
G1 X33.08 Y203.595 E-.24831
; WIPE_END
G1 E-.04 F1800
G1 X33.026 Y195.963 Z1.4 F15000
G1 X32.698 Y148.962 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145685
G1 F7500
G2 X32.414 Y148.922 I-.191 J.323 E.00239
; WIPE_START
G1 X32.601 Y148.922 E-.48617
G1 X32.698 Y148.962 E-.27383
; WIPE_END
G1 E-.04 F1800
G1 X39.102 Y153.114 Z1.4 F15000
G1 X117.617 Y204.027 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.145578
G1 F7500
G3 X117.333 Y203.987 I-.093 J-.363 E.00239
; OBJECT_ID: 126
; WIPE_START
G1 X117.431 Y204.027 E-.27421
G1 X117.617 Y204.027 E-.48579
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 104
M625
; start printing object, unique label id: 126
M624 BAAAAAAAAAA=
G1 X117.498 Y196.395 Z1.4 F15000
G1 X116.03 Y102.586 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X33.61 Y102.586 E2.45501
G1 X33.61 Y50.166 E1.56141
G1 X116.03 Y50.166 E2.45501
G1 X116.03 Y102.526 E1.55963
; WIPE_START
M204 S5000
G1 X114.03 Y102.528 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.61 Y104.166 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X32.03 Y104.166 E2.54914
G1 X32.03 Y48.586 E1.65554
G1 X117.61 Y48.586 E2.54914
G1 X117.61 Y104.106 E1.65375
; WIPE_START
M204 S5000
G1 X115.61 Y104.108 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.86 Y96.479 Z1.4 F15000
G1 X117.403 Y49.369 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X116.827 Y48.794 E.02423
G1 X116.294 Y48.794
G1 X117.403 Y49.902 E.04669
G1 X117.403 Y50.436
G1 X115.761 Y48.794 E.06916
G1 X115.228 Y48.794
G1 X117.403 Y50.969 E.09162
G1 X117.403 Y51.502
G1 X116.237 Y50.337 E.04909
G1 X116.237 Y50.87
G1 X117.403 Y52.035 E.04909
G1 X117.403 Y52.569
G1 X116.237 Y51.403 E.04909
G1 X116.237 Y51.937
G1 X117.403 Y53.102 E.04909
G1 X117.403 Y53.635
G1 X116.237 Y52.47 E.04909
M73 P94 R1
G1 X116.237 Y53.003
G1 X117.403 Y54.168 E.04909
G1 X117.403 Y54.702
G1 X116.237 Y53.536 E.04909
G1 X116.237 Y54.07
G1 X117.403 Y55.235 E.04909
G1 X117.403 Y55.768
G1 X116.237 Y54.603 E.04909
G1 X116.237 Y55.136
G1 X117.403 Y56.301 E.04909
G1 X117.403 Y56.835
G1 X116.237 Y55.669 E.04909
G1 X116.237 Y56.203
G1 X117.403 Y57.368 E.04909
G1 X117.403 Y57.901
G1 X116.237 Y56.736 E.04909
G1 X116.237 Y57.269
G1 X117.403 Y58.434 E.04909
G1 X117.403 Y58.968
G1 X116.237 Y57.802 E.04909
G1 X116.237 Y58.336
G1 X117.403 Y59.501 E.04909
G1 X117.403 Y60.034
G1 X116.237 Y58.869 E.04909
G1 X116.237 Y59.402
G1 X117.403 Y60.567 E.04909
G1 X117.403 Y61.101
G1 X116.237 Y59.935 E.04909
G1 X116.237 Y60.469
G1 X117.403 Y61.634 E.04909
G1 X117.403 Y62.167
G1 X116.237 Y61.002 E.04909
G1 X116.237 Y61.535
G1 X117.403 Y62.7 E.04909
G1 X117.403 Y63.234
G1 X116.237 Y62.068 E.04909
G1 X116.237 Y62.602
G1 X117.403 Y63.767 E.04909
G1 X117.403 Y64.3
G1 X116.237 Y63.135 E.04909
G1 X116.237 Y63.668
G1 X117.403 Y64.833 E.04909
G1 X117.403 Y65.367
G1 X116.237 Y64.201 E.04909
G1 X116.237 Y64.735
G1 X117.403 Y65.9 E.04909
G1 X117.403 Y66.433
G1 X116.237 Y65.268 E.04909
G1 X116.237 Y65.801
G1 X117.403 Y66.966 E.04909
G1 X117.403 Y67.5
G1 X116.237 Y66.335 E.04909
G1 X116.237 Y66.868
G1 X117.403 Y68.033 E.04909
G1 X117.403 Y68.566
G1 X116.237 Y67.401 E.04909
G1 X116.237 Y67.934
G1 X117.403 Y69.1 E.04909
G1 X117.403 Y69.633
G1 X116.237 Y68.468 E.04909
G1 X116.237 Y69.001
G1 X117.403 Y70.166 E.04909
G1 X117.403 Y70.699
G1 X116.237 Y69.534 E.04909
G1 X116.237 Y70.067
G1 X117.403 Y71.233 E.04909
G1 X117.403 Y71.766
G1 X116.237 Y70.601 E.04909
G1 X116.237 Y71.134
G1 X117.403 Y72.299 E.04909
G1 X117.403 Y72.832
G1 X116.237 Y71.667 E.04909
G1 X116.237 Y72.2
G1 X117.403 Y73.366 E.04909
G1 X117.403 Y73.899
G1 X116.237 Y72.734 E.04909
G1 X116.237 Y73.267
G1 X117.403 Y74.432 E.04909
G1 X117.403 Y74.965
G1 X116.237 Y73.8 E.04909
G1 X116.237 Y74.333
G1 X117.403 Y75.499 E.04909
G1 X117.403 Y76.032
G1 X116.237 Y74.867 E.04909
G1 X116.237 Y75.4
G1 X117.403 Y76.565 E.04909
G1 X117.403 Y77.098
G1 X116.237 Y75.933 E.04909
G1 X116.237 Y76.466
G1 X117.403 Y77.632 E.04909
G1 X117.403 Y78.165
G1 X116.237 Y77 E.04909
G1 X116.237 Y77.533
G1 X117.403 Y78.698 E.04909
G1 X117.403 Y79.231
G1 X116.237 Y78.066 E.04909
G1 X116.237 Y78.599
G1 X117.403 Y79.765 E.04909
G1 X117.403 Y80.298
G1 X116.237 Y79.133 E.04909
G1 X116.237 Y79.666
G1 X117.403 Y80.831 E.04909
G1 X117.403 Y81.364
G1 X116.237 Y80.199 E.04909
G1 X116.237 Y80.732
G1 X117.403 Y81.898 E.04909
G1 X117.403 Y82.431
G1 X116.237 Y81.266 E.04909
G1 X116.237 Y81.799
G1 X117.403 Y82.964 E.04909
G1 X117.403 Y83.497
G1 X116.237 Y82.332 E.04909
G1 X116.237 Y82.865
G1 X117.403 Y84.031 E.04909
G1 X117.403 Y84.564
G1 X116.237 Y83.399 E.04909
G1 X116.237 Y83.932
G1 X117.403 Y85.097 E.04909
G1 X117.403 Y85.631
G1 X116.237 Y84.465 E.04909
G1 X116.237 Y84.999
G1 X117.403 Y86.164 E.04909
G1 X117.403 Y86.697
G1 X116.237 Y85.532 E.04909
G1 X116.237 Y86.065
G1 X117.403 Y87.23 E.04909
G1 X117.403 Y87.764
G1 X116.237 Y86.598 E.04909
G1 X116.237 Y87.132
G1 X117.403 Y88.297 E.04909
G1 X117.403 Y88.83
G1 X116.237 Y87.665 E.04909
G1 X116.237 Y88.198
G1 X117.403 Y89.363 E.04909
G1 X117.403 Y89.897
G1 X116.237 Y88.731 E.04909
G1 X116.237 Y89.265
G1 X117.403 Y90.43 E.04909
G1 X117.403 Y90.963
G1 X116.237 Y89.798 E.04909
G1 X116.237 Y90.331
G1 X117.403 Y91.496 E.04909
G1 X117.403 Y92.03
G1 X116.237 Y90.864 E.04909
G1 X116.237 Y91.398
G1 X117.403 Y92.563 E.04909
G1 X117.403 Y93.096
G1 X116.237 Y91.931 E.04909
G1 X116.237 Y92.464
G1 X117.403 Y93.629 E.04909
M73 P95 R1
G1 X117.403 Y94.163
G1 X116.237 Y92.997 E.04909
G1 X116.237 Y93.531
G1 X117.403 Y94.696 E.04909
G1 X117.403 Y95.229
G1 X116.237 Y94.064 E.04909
G1 X116.237 Y94.597
G1 X117.403 Y95.762 E.04909
G1 X117.403 Y96.296
G1 X116.237 Y95.13 E.04909
G1 X116.237 Y95.664
G1 X117.403 Y96.829 E.04909
G1 X117.403 Y97.362
G1 X116.237 Y96.197 E.04909
G1 X116.237 Y96.73
G1 X117.403 Y97.895 E.04909
G1 X117.403 Y98.429
G1 X116.237 Y97.263 E.04909
G1 X116.237 Y97.797
G1 X117.403 Y98.962 E.04909
G1 X117.403 Y99.495
G1 X116.237 Y98.33 E.04909
G1 X116.237 Y98.863
G1 X117.403 Y100.028 E.04909
G1 X117.403 Y100.562
G1 X116.237 Y99.396 E.04909
G1 X116.237 Y99.93
G1 X117.403 Y101.095 E.04909
G1 X117.403 Y101.628
G1 X116.237 Y100.463 E.04909
G1 X116.237 Y100.996
G1 X117.403 Y102.161 E.04909
G1 X117.403 Y102.695
G1 X116.237 Y101.53 E.04909
G1 X116.237 Y102.063
G1 X117.403 Y103.228 E.04909
G1 X117.403 Y103.761
G1 X116.237 Y102.596 E.04909
G1 X115.902 Y102.794
G1 X117.067 Y103.959 E.04909
G1 X116.534 Y103.959
G1 X115.369 Y102.794 E.04909
G1 X114.835 Y102.794
G1 X116.001 Y103.959 E.04909
G1 X115.467 Y103.959
G1 X114.302 Y102.794 E.04909
G1 X113.769 Y102.794
G1 X114.934 Y103.959 E.04909
G1 X114.401 Y103.959
G1 X113.236 Y102.794 E.04909
G1 X112.702 Y102.794
G1 X113.868 Y103.959 E.04909
G1 X113.334 Y103.959
G1 X112.169 Y102.794 E.04909
G1 X111.636 Y102.794
G1 X112.801 Y103.959 E.04909
G1 X112.268 Y103.959
G1 X111.103 Y102.794 E.04909
G1 X110.569 Y102.794
G1 X111.735 Y103.959 E.04909
M73 P95 R0
G1 X111.201 Y103.959
G1 X110.036 Y102.794 E.04909
G1 X109.503 Y102.794
G1 X110.668 Y103.959 E.04909
G1 X110.135 Y103.959
G1 X108.97 Y102.794 E.04909
G1 X108.436 Y102.794
G1 X109.602 Y103.959 E.04909
G1 X109.068 Y103.959
G1 X107.903 Y102.794 E.04909
G1 X107.37 Y102.794
G1 X108.535 Y103.959 E.04909
G1 X108.002 Y103.959
G1 X106.837 Y102.794 E.04909
G1 X106.303 Y102.794
G1 X107.469 Y103.959 E.04909
G1 X106.935 Y103.959
G1 X105.77 Y102.794 E.04909
G1 X105.237 Y102.794
G1 X106.402 Y103.959 E.04909
G1 X105.869 Y103.959
G1 X104.704 Y102.794 E.04909
G1 X104.17 Y102.794
G1 X105.336 Y103.959 E.04909
G1 X104.802 Y103.959
G1 X103.637 Y102.794 E.04909
G1 X103.104 Y102.794
G1 X104.269 Y103.959 E.04909
G1 X103.736 Y103.959
G1 X102.571 Y102.794 E.04909
G1 X102.037 Y102.794
G1 X103.202 Y103.959 E.04909
G1 X102.669 Y103.959
G1 X101.504 Y102.794 E.04909
G1 X100.971 Y102.794
G1 X102.136 Y103.959 E.04909
G1 X101.603 Y103.959
G1 X100.437 Y102.794 E.04909
G1 X99.904 Y102.794
G1 X101.069 Y103.959 E.04909
G1 X100.536 Y103.959
G1 X99.371 Y102.794 E.04909
G1 X98.838 Y102.794
G1 X100.003 Y103.959 E.04909
G1 X99.47 Y103.959
G1 X98.304 Y102.794 E.04909
G1 X97.771 Y102.794
G1 X98.936 Y103.959 E.04909
G1 X98.403 Y103.959
G1 X97.238 Y102.794 E.04909
G1 X96.705 Y102.794
G1 X97.87 Y103.959 E.04909
G1 X97.337 Y103.959
G1 X96.171 Y102.794 E.04909
G1 X95.638 Y102.794
G1 X96.803 Y103.959 E.04909
G1 X96.27 Y103.959
G1 X95.105 Y102.794 E.04909
G1 X94.572 Y102.794
G1 X95.737 Y103.959 E.04909
G1 X95.204 Y103.959
G1 X94.038 Y102.794 E.04909
G1 X93.505 Y102.794
G1 X94.67 Y103.959 E.04909
G1 X94.137 Y103.959
G1 X92.972 Y102.794 E.04909
G1 X92.439 Y102.794
G1 X93.604 Y103.959 E.04909
G1 X93.071 Y103.959
G1 X91.905 Y102.794 E.04909
G1 X91.372 Y102.794
G1 X92.537 Y103.959 E.04909
G1 X92.004 Y103.959
G1 X90.839 Y102.794 E.04909
G1 X90.306 Y102.794
G1 X91.471 Y103.959 E.04909
G1 X90.938 Y103.959
G1 X89.772 Y102.794 E.04909
G1 X89.239 Y102.794
G1 X90.404 Y103.959 E.04909
G1 X89.871 Y103.959
G1 X88.706 Y102.794 E.04909
G1 X88.173 Y102.794
G1 X89.338 Y103.959 E.04909
G1 X88.805 Y103.959
G1 X87.639 Y102.794 E.04909
G1 X87.106 Y102.794
G1 X88.271 Y103.959 E.04909
G1 X87.738 Y103.959
G1 X86.573 Y102.794 E.04909
G1 X86.04 Y102.794
G1 X87.205 Y103.959 E.04909
G1 X86.672 Y103.959
G1 X85.506 Y102.794 E.04909
G1 X84.973 Y102.794
G1 X86.138 Y103.959 E.04909
G1 X85.605 Y103.959
G1 X84.44 Y102.794 E.04909
G1 X83.906 Y102.794
G1 X85.072 Y103.959 E.04909
G1 X84.538 Y103.959
G1 X83.373 Y102.794 E.04909
G1 X82.84 Y102.794
G1 X84.005 Y103.959 E.04909
G1 X83.472 Y103.959
G1 X82.307 Y102.794 E.04909
G1 X81.773 Y102.794
G1 X82.939 Y103.959 E.04909
G1 X82.405 Y103.959
G1 X81.24 Y102.794 E.04909
G1 X80.707 Y102.794
G1 X81.872 Y103.959 E.04909
G1 X81.339 Y103.959
G1 X80.174 Y102.794 E.04909
G1 X79.64 Y102.794
G1 X80.806 Y103.959 E.04909
G1 X80.272 Y103.959
G1 X79.107 Y102.794 E.04909
G1 X78.574 Y102.794
G1 X79.739 Y103.959 E.04909
G1 X79.206 Y103.959
G1 X78.041 Y102.794 E.04909
G1 X77.507 Y102.794
G1 X78.673 Y103.959 E.04909
G1 X78.139 Y103.959
G1 X76.974 Y102.794 E.04909
G1 X76.441 Y102.794
G1 X77.606 Y103.959 E.04909
G1 X77.073 Y103.959
G1 X75.908 Y102.794 E.04909
G1 X75.374 Y102.794
G1 X76.54 Y103.959 E.04909
G1 X76.006 Y103.959
G1 X74.841 Y102.794 E.04909
G1 X74.308 Y102.794
G1 X75.473 Y103.959 E.04909
G1 X74.94 Y103.959
G1 X73.775 Y102.794 E.04909
G1 X73.241 Y102.794
G1 X74.407 Y103.959 E.04909
G1 X73.873 Y103.959
G1 X72.708 Y102.794 E.04909
G1 X72.175 Y102.794
G1 X73.34 Y103.959 E.04909
G1 X72.807 Y103.959
G1 X71.642 Y102.794 E.04909
G1 X71.108 Y102.794
G1 X72.274 Y103.959 E.04909
G1 X71.74 Y103.959
G1 X70.575 Y102.794 E.04909
G1 X70.042 Y102.794
G1 X71.207 Y103.959 E.04909
G1 X70.674 Y103.959
G1 X69.509 Y102.794 E.04909
G1 X68.975 Y102.794
G1 X70.141 Y103.959 E.04909
G1 X69.607 Y103.959
G1 X68.442 Y102.794 E.04909
G1 X67.909 Y102.794
G1 X69.074 Y103.959 E.04909
G1 X68.541 Y103.959
G1 X67.376 Y102.794 E.04909
G1 X66.842 Y102.794
G1 X68.008 Y103.959 E.04909
G1 X67.474 Y103.959
G1 X66.309 Y102.794 E.04909
G1 X65.776 Y102.794
G1 X66.941 Y103.959 E.04909
G1 X66.408 Y103.959
G1 X65.242 Y102.794 E.04909
G1 X64.709 Y102.794
G1 X65.874 Y103.959 E.04909
G1 X65.341 Y103.959
G1 X64.176 Y102.794 E.04909
G1 X63.643 Y102.794
G1 X64.808 Y103.959 E.04909
G1 X64.275 Y103.959
G1 X63.109 Y102.794 E.04909
G1 X62.576 Y102.794
G1 X63.741 Y103.959 E.04909
G1 X63.208 Y103.959
G1 X62.043 Y102.794 E.04909
G1 X61.51 Y102.794
G1 X62.675 Y103.959 E.04909
G1 X62.142 Y103.959
G1 X60.976 Y102.794 E.04909
G1 X60.443 Y102.794
G1 X61.608 Y103.959 E.04909
G1 X61.075 Y103.959
G1 X59.91 Y102.794 E.04909
G1 X59.377 Y102.794
G1 X60.542 Y103.959 E.04909
G1 X60.009 Y103.959
G1 X58.843 Y102.794 E.04909
G1 X58.31 Y102.794
G1 X59.475 Y103.959 E.04909
G1 X58.942 Y103.959
G1 X57.777 Y102.794 E.04909
G1 X57.244 Y102.794
G1 X58.409 Y103.959 E.04909
G1 X57.876 Y103.959
G1 X56.71 Y102.794 E.04909
G1 X56.177 Y102.794
G1 X57.342 Y103.959 E.04909
G1 X56.809 Y103.959
G1 X55.644 Y102.794 E.04909
G1 X55.111 Y102.794
G1 X56.276 Y103.959 E.04909
G1 X55.743 Y103.959
G1 X54.577 Y102.794 E.04909
G1 X54.044 Y102.794
M73 P96 R0
G1 X55.209 Y103.959 E.04909
G1 X54.676 Y103.959
G1 X53.511 Y102.794 E.04909
G1 X52.978 Y102.794
G1 X54.143 Y103.959 E.04909
G1 X53.61 Y103.959
G1 X52.444 Y102.794 E.04909
G1 X51.911 Y102.794
G1 X53.076 Y103.959 E.04909
G1 X52.543 Y103.959
G1 X51.378 Y102.794 E.04909
G1 X50.845 Y102.794
G1 X52.01 Y103.959 E.04909
G1 X51.477 Y103.959
G1 X50.311 Y102.794 E.04909
G1 X49.778 Y102.794
G1 X50.943 Y103.959 E.04909
G1 X50.41 Y103.959
G1 X49.245 Y102.794 E.04909
G1 X48.711 Y102.794
G1 X49.877 Y103.959 E.04909
G1 X49.343 Y103.959
G1 X48.178 Y102.794 E.04909
G1 X47.645 Y102.794
G1 X48.81 Y103.959 E.04909
G1 X48.277 Y103.959
G1 X47.112 Y102.794 E.04909
G1 X46.578 Y102.794
G1 X47.744 Y103.959 E.04909
G1 X47.21 Y103.959
G1 X46.045 Y102.794 E.04909
G1 X45.512 Y102.794
G1 X46.677 Y103.959 E.04909
G1 X46.144 Y103.959
G1 X44.979 Y102.794 E.04909
G1 X44.445 Y102.794
G1 X45.611 Y103.959 E.04909
G1 X45.077 Y103.959
G1 X43.912 Y102.794 E.04909
G1 X43.379 Y102.794
G1 X44.544 Y103.959 E.04909
G1 X44.011 Y103.959
G1 X42.846 Y102.794 E.04909
G1 X42.312 Y102.794
G1 X43.478 Y103.959 E.04909
G1 X42.944 Y103.959
G1 X41.779 Y102.794 E.04909
G1 X41.246 Y102.794
G1 X42.411 Y103.959 E.04909
G1 X41.878 Y103.959
G1 X40.713 Y102.794 E.04909
G1 X40.179 Y102.794
G1 X41.345 Y103.959 E.04909
G1 X40.811 Y103.959
G1 X39.646 Y102.794 E.04909
G1 X39.113 Y102.794
G1 X40.278 Y103.959 E.04909
G1 X39.745 Y103.959
G1 X38.58 Y102.794 E.04909
G1 X38.046 Y102.794
G1 X39.212 Y103.959 E.04909
G1 X38.678 Y103.959
G1 X37.513 Y102.794 E.04909
G1 X36.98 Y102.794
G1 X38.145 Y103.959 E.04909
G1 X37.612 Y103.959
G1 X36.447 Y102.794 E.04909
G1 X35.913 Y102.794
G1 X37.079 Y103.959 E.04909
G1 X36.545 Y103.959
G1 X35.38 Y102.794 E.04909
G1 X34.847 Y102.794
G1 X36.012 Y103.959 E.04909
G1 X35.479 Y103.959
G1 X34.314 Y102.794 E.04909
G1 X33.78 Y102.794
G1 X34.946 Y103.959 E.04909
; WIPE_START
M204 S5000
G1 X33.78 Y102.794 E-.62621
G1 X34.132 Y102.794 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X40.472 Y98.544 Z1.4 F15000
G1 X114.694 Y48.794 Z1.4
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X115.86 Y49.959 E.04909
G1 X115.326 Y49.959
G1 X114.161 Y48.794 E.04909
G1 X113.628 Y48.794
G1 X114.793 Y49.959 E.04909
G1 X114.26 Y49.959
G1 X113.095 Y48.794 E.04909
G1 X112.561 Y48.794
G1 X113.727 Y49.959 E.04909
G1 X113.193 Y49.959
G1 X112.028 Y48.794 E.04909
G1 X111.495 Y48.794
G1 X112.66 Y49.959 E.04909
G1 X112.127 Y49.959
G1 X110.962 Y48.794 E.04909
G1 X110.428 Y48.794
G1 X111.594 Y49.959 E.04909
G1 X111.06 Y49.959
G1 X109.895 Y48.794 E.04909
G1 X109.362 Y48.794
G1 X110.527 Y49.959 E.04909
G1 X109.994 Y49.959
G1 X108.829 Y48.794 E.04909
G1 X108.295 Y48.794
G1 X109.461 Y49.959 E.04909
G1 X108.927 Y49.959
G1 X107.762 Y48.794 E.04909
G1 X107.229 Y48.794
G1 X108.394 Y49.959 E.04909
G1 X107.861 Y49.959
G1 X106.696 Y48.794 E.04909
G1 X106.162 Y48.794
G1 X107.328 Y49.959 E.04909
G1 X106.794 Y49.959
G1 X105.629 Y48.794 E.04909
G1 X105.096 Y48.794
G1 X106.261 Y49.959 E.04909
G1 X105.728 Y49.959
G1 X104.563 Y48.794 E.04909
G1 X104.029 Y48.794
G1 X105.195 Y49.959 E.04909
G1 X104.661 Y49.959
G1 X103.496 Y48.794 E.04909
G1 X102.963 Y48.794
G1 X104.128 Y49.959 E.04909
G1 X103.595 Y49.959
G1 X102.43 Y48.794 E.04909
G1 X101.896 Y48.794
G1 X103.061 Y49.959 E.04909
G1 X102.528 Y49.959
G1 X101.363 Y48.794 E.04909
G1 X100.83 Y48.794
G1 X101.995 Y49.959 E.04909
G1 X101.462 Y49.959
G1 X100.296 Y48.794 E.04909
G1 X99.763 Y48.794
G1 X100.928 Y49.959 E.04909
G1 X100.395 Y49.959
G1 X99.23 Y48.794 E.04909
G1 X98.697 Y48.794
G1 X99.862 Y49.959 E.04909
G1 X99.329 Y49.959
G1 X98.163 Y48.794 E.04909
G1 X97.63 Y48.794
G1 X98.795 Y49.959 E.04909
G1 X98.262 Y49.959
G1 X97.097 Y48.794 E.04909
G1 X96.564 Y48.794
G1 X97.729 Y49.959 E.04909
G1 X97.196 Y49.959
G1 X96.03 Y48.794 E.04909
G1 X95.497 Y48.794
G1 X96.662 Y49.959 E.04909
G1 X96.129 Y49.959
G1 X94.964 Y48.794 E.04909
G1 X94.431 Y48.794
G1 X95.596 Y49.959 E.04909
G1 X95.063 Y49.959
G1 X93.897 Y48.794 E.04909
G1 X93.364 Y48.794
G1 X94.529 Y49.959 E.04909
G1 X93.996 Y49.959
G1 X92.831 Y48.794 E.04909
G1 X92.298 Y48.794
G1 X93.463 Y49.959 E.04909
G1 X92.93 Y49.959
G1 X91.764 Y48.794 E.04909
G1 X91.231 Y48.794
G1 X92.396 Y49.959 E.04909
G1 X91.863 Y49.959
G1 X90.698 Y48.794 E.04909
G1 X90.165 Y48.794
G1 X91.33 Y49.959 E.04909
G1 X90.797 Y49.959
G1 X89.631 Y48.794 E.04909
G1 X89.098 Y48.794
G1 X90.263 Y49.959 E.04909
G1 X89.73 Y49.959
G1 X88.565 Y48.794 E.04909
G1 X88.032 Y48.794
G1 X89.197 Y49.959 E.04909
G1 X88.664 Y49.959
G1 X87.498 Y48.794 E.04909
G1 X86.965 Y48.794
G1 X88.13 Y49.959 E.04909
G1 X87.597 Y49.959
G1 X86.432 Y48.794 E.04909
G1 X85.899 Y48.794
G1 X87.064 Y49.959 E.04909
G1 X86.531 Y49.959
G1 X85.365 Y48.794 E.04909
G1 X84.832 Y48.794
G1 X85.997 Y49.959 E.04909
G1 X85.464 Y49.959
G1 X84.299 Y48.794 E.04909
G1 X83.765 Y48.794
G1 X84.931 Y49.959 E.04909
G1 X84.397 Y49.959
G1 X83.232 Y48.794 E.04909
G1 X82.699 Y48.794
G1 X83.864 Y49.959 E.04909
G1 X83.331 Y49.959
G1 X82.166 Y48.794 E.04909
G1 X81.632 Y48.794
G1 X82.798 Y49.959 E.04909
G1 X82.264 Y49.959
G1 X81.099 Y48.794 E.04909
G1 X80.566 Y48.794
G1 X81.731 Y49.959 E.04909
G1 X81.198 Y49.959
G1 X80.033 Y48.794 E.04909
G1 X79.499 Y48.794
G1 X80.665 Y49.959 E.04909
G1 X80.131 Y49.959
G1 X78.966 Y48.794 E.04909
G1 X78.433 Y48.794
G1 X79.598 Y49.959 E.04909
G1 X79.065 Y49.959
G1 X77.9 Y48.794 E.04909
G1 X77.366 Y48.794
G1 X78.532 Y49.959 E.04909
G1 X77.998 Y49.959
G1 X76.833 Y48.794 E.04909
G1 X76.3 Y48.794
G1 X77.465 Y49.959 E.04909
G1 X76.932 Y49.959
G1 X75.767 Y48.794 E.04909
G1 X75.233 Y48.794
G1 X76.399 Y49.959 E.04909
G1 X75.865 Y49.959
G1 X74.7 Y48.794 E.04909
G1 X74.167 Y48.794
G1 X75.332 Y49.959 E.04909
G1 X74.799 Y49.959
G1 X73.634 Y48.794 E.04909
G1 X73.1 Y48.794
G1 X74.266 Y49.959 E.04909
G1 X73.732 Y49.959
G1 X72.567 Y48.794 E.04909
G1 X72.034 Y48.794
G1 X73.199 Y49.959 E.04909
G1 X72.666 Y49.959
G1 X71.501 Y48.794 E.04909
G1 X70.967 Y48.794
G1 X72.133 Y49.959 E.04909
G1 X71.599 Y49.959
G1 X70.434 Y48.794 E.04909
G1 X69.901 Y48.794
G1 X71.066 Y49.959 E.04909
G1 X70.533 Y49.959
G1 X69.368 Y48.794 E.04909
G1 X68.834 Y48.794
G1 X70 Y49.959 E.04909
G1 X69.466 Y49.959
G1 X68.301 Y48.794 E.04909
G1 X67.768 Y48.794
G1 X68.933 Y49.959 E.04909
G1 X68.4 Y49.959
G1 X67.235 Y48.794 E.04909
G1 X66.701 Y48.794
G1 X67.866 Y49.959 E.04909
G1 X67.333 Y49.959
M73 P97 R0
G1 X66.168 Y48.794 E.04909
G1 X65.635 Y48.794
G1 X66.8 Y49.959 E.04909
G1 X66.267 Y49.959
G1 X65.101 Y48.794 E.04909
G1 X64.568 Y48.794
G1 X65.733 Y49.959 E.04909
G1 X65.2 Y49.959
G1 X64.035 Y48.794 E.04909
G1 X63.502 Y48.794
G1 X64.667 Y49.959 E.04909
G1 X64.134 Y49.959
G1 X62.968 Y48.794 E.04909
G1 X62.435 Y48.794
G1 X63.6 Y49.959 E.04909
G1 X63.067 Y49.959
G1 X61.902 Y48.794 E.04909
G1 X61.369 Y48.794
G1 X62.534 Y49.959 E.04909
G1 X62.001 Y49.959
G1 X60.835 Y48.794 E.04909
G1 X60.302 Y48.794
G1 X61.467 Y49.959 E.04909
G1 X60.934 Y49.959
G1 X59.769 Y48.794 E.04909
G1 X59.236 Y48.794
G1 X60.401 Y49.959 E.04909
G1 X59.868 Y49.959
G1 X58.702 Y48.794 E.04909
G1 X58.169 Y48.794
G1 X59.334 Y49.959 E.04909
G1 X58.801 Y49.959
G1 X57.636 Y48.794 E.04909
G1 X57.103 Y48.794
G1 X58.268 Y49.959 E.04909
G1 X57.735 Y49.959
G1 X56.569 Y48.794 E.04909
G1 X56.036 Y48.794
G1 X57.201 Y49.959 E.04909
G1 X56.668 Y49.959
G1 X55.503 Y48.794 E.04909
G1 X54.97 Y48.794
G1 X56.135 Y49.959 E.04909
G1 X55.602 Y49.959
G1 X54.436 Y48.794 E.04909
G1 X53.903 Y48.794
G1 X55.068 Y49.959 E.04909
G1 X54.535 Y49.959
G1 X53.37 Y48.794 E.04909
G1 X52.837 Y48.794
G1 X54.002 Y49.959 E.04909
G1 X53.469 Y49.959
G1 X52.303 Y48.794 E.04909
G1 X51.77 Y48.794
G1 X52.935 Y49.959 E.04909
G1 X52.402 Y49.959
G1 X51.237 Y48.794 E.04909
G1 X50.704 Y48.794
G1 X51.869 Y49.959 E.04909
G1 X51.336 Y49.959
G1 X50.17 Y48.794 E.04909
G1 X49.637 Y48.794
G1 X50.802 Y49.959 E.04909
G1 X50.269 Y49.959
G1 X49.104 Y48.794 E.04909
G1 X48.57 Y48.794
G1 X49.736 Y49.959 E.04909
G1 X49.202 Y49.959
G1 X48.037 Y48.794 E.04909
G1 X47.504 Y48.794
G1 X48.669 Y49.959 E.04909
G1 X48.136 Y49.959
G1 X46.971 Y48.794 E.04909
G1 X46.437 Y48.794
G1 X47.603 Y49.959 E.04909
G1 X47.069 Y49.959
G1 X45.904 Y48.794 E.04909
G1 X45.371 Y48.794
G1 X46.536 Y49.959 E.04909
G1 X46.003 Y49.959
G1 X44.838 Y48.794 E.04909
G1 X44.304 Y48.794
G1 X45.47 Y49.959 E.04909
G1 X44.936 Y49.959
G1 X43.771 Y48.794 E.04909
G1 X43.238 Y48.794
G1 X44.403 Y49.959 E.04909
G1 X43.87 Y49.959
G1 X42.705 Y48.794 E.04909
G1 X42.171 Y48.794
G1 X43.337 Y49.959 E.04909
G1 X42.803 Y49.959
G1 X41.638 Y48.794 E.04909
G1 X41.105 Y48.794
G1 X42.27 Y49.959 E.04909
G1 X41.737 Y49.959
G1 X40.572 Y48.794 E.04909
G1 X40.038 Y48.794
G1 X41.204 Y49.959 E.04909
G1 X40.67 Y49.959
G1 X39.505 Y48.794 E.04909
G1 X38.972 Y48.794
G1 X40.137 Y49.959 E.04909
G1 X39.604 Y49.959
G1 X38.439 Y48.794 E.04909
G1 X37.905 Y48.794
G1 X39.071 Y49.959 E.04909
G1 X38.537 Y49.959
G1 X37.372 Y48.794 E.04909
G1 X36.839 Y48.794
G1 X38.004 Y49.959 E.04909
G1 X37.471 Y49.959
G1 X36.306 Y48.794 E.04909
G1 X35.772 Y48.794
G1 X36.938 Y49.959 E.04909
G1 X36.404 Y49.959
G1 X35.239 Y48.794 E.04909
G1 X34.706 Y48.794
G1 X35.871 Y49.959 E.04909
G1 X35.338 Y49.959
G1 X34.173 Y48.794 E.04909
G1 X33.639 Y48.794
G1 X34.805 Y49.959 E.04909
G1 X34.271 Y49.959
G1 X33.106 Y48.794 E.04909
G1 X32.573 Y48.794
G1 X33.738 Y49.959 E.04909
G1 X33.403 Y50.157
G1 X32.237 Y48.992 E.04909
G1 X32.237 Y49.525
G1 X33.403 Y50.69 E.04909
G1 X33.403 Y51.223
G1 X32.237 Y50.058 E.04909
G1 X32.237 Y50.591
G1 X33.403 Y51.757 E.04909
G1 X33.403 Y52.29
G1 X32.237 Y51.125 E.04909
G1 X32.237 Y51.658
G1 X33.403 Y52.823 E.04909
G1 X33.403 Y53.356
G1 X32.237 Y52.191 E.04909
G1 X32.237 Y52.724
G1 X33.403 Y53.89 E.04909
G1 X33.403 Y54.423
G1 X32.237 Y53.258 E.04909
G1 X32.237 Y53.791
G1 X33.403 Y54.956 E.04909
G1 X33.403 Y55.49
G1 X32.237 Y54.324 E.04909
G1 X32.237 Y54.858
G1 X33.403 Y56.023 E.04909
G1 X33.403 Y56.556
G1 X32.237 Y55.391 E.04909
G1 X32.237 Y55.924
G1 X33.403 Y57.089 E.04909
G1 X33.403 Y57.623
G1 X32.237 Y56.457 E.04909
G1 X32.237 Y56.991
G1 X33.403 Y58.156 E.04909
G1 X33.403 Y58.689
G1 X32.237 Y57.524 E.04909
G1 X32.237 Y58.057
G1 X33.403 Y59.222 E.04909
G1 X33.403 Y59.756
G1 X32.237 Y58.59 E.04909
G1 X32.237 Y59.124
G1 X33.403 Y60.289 E.04909
G1 X33.403 Y60.822
G1 X32.237 Y59.657 E.04909
G1 X32.237 Y60.19
G1 X33.403 Y61.355 E.04909
G1 X33.403 Y61.889
G1 X32.237 Y60.723 E.04909
G1 X32.237 Y61.257
G1 X33.403 Y62.422 E.04909
G1 X33.403 Y62.955
G1 X32.237 Y61.79 E.04909
G1 X32.237 Y62.323
G1 X33.403 Y63.488 E.04909
G1 X33.403 Y64.022
G1 X32.237 Y62.856 E.04909
G1 X32.237 Y63.39
G1 X33.403 Y64.555 E.04909
G1 X33.403 Y65.088
G1 X32.237 Y63.923 E.04909
G1 X32.237 Y64.456
G1 X33.403 Y65.621 E.04909
G1 X33.403 Y66.155
G1 X32.237 Y64.989 E.04909
G1 X32.237 Y65.523
G1 X33.403 Y66.688 E.04909
G1 X33.403 Y67.221
G1 X32.237 Y66.056 E.04909
G1 X32.237 Y66.589
G1 X33.403 Y67.754 E.04909
G1 X33.403 Y68.288
G1 X32.237 Y67.122 E.04909
G1 X32.237 Y67.656
G1 X33.403 Y68.821 E.04909
G1 X33.403 Y69.354
G1 X32.237 Y68.189 E.04909
G1 X32.237 Y68.722
G1 X33.403 Y69.887 E.04909
G1 X33.403 Y70.421
G1 X32.237 Y69.255 E.04909
G1 X32.237 Y69.789
G1 X33.403 Y70.954 E.04909
G1 X33.403 Y71.487
G1 X32.237 Y70.322 E.04909
G1 X32.237 Y70.855
G1 X33.403 Y72.02 E.04909
G1 X33.403 Y72.554
G1 X32.237 Y71.389 E.04909
G1 X32.237 Y71.922
G1 X33.403 Y73.087 E.04909
G1 X33.403 Y73.62
G1 X32.237 Y72.455 E.04909
G1 X32.237 Y72.988
G1 X33.403 Y74.154 E.04909
G1 X33.403 Y74.687
G1 X32.237 Y73.522 E.04909
G1 X32.237 Y74.055
G1 X33.403 Y75.22 E.04909
G1 X33.403 Y75.753
G1 X32.237 Y74.588 E.04909
G1 X32.237 Y75.121
G1 X33.403 Y76.287 E.04909
G1 X33.403 Y76.82
G1 X32.237 Y75.655 E.04909
G1 X32.237 Y76.188
G1 X33.403 Y77.353 E.04909
G1 X33.403 Y77.886
G1 X32.237 Y76.721 E.04909
G1 X32.237 Y77.254
G1 X33.403 Y78.42 E.04909
G1 X33.403 Y78.953
G1 X32.237 Y77.788 E.04909
G1 X32.237 Y78.321
G1 X33.403 Y79.486 E.04909
G1 X33.403 Y80.019
G1 X32.237 Y78.854 E.04909
G1 X32.237 Y79.387
G1 X33.403 Y80.553 E.04909
G1 X33.403 Y81.086
G1 X32.237 Y79.921 E.04909
G1 X32.237 Y80.454
G1 X33.403 Y81.619 E.04909
G1 X33.403 Y82.152
G1 X32.237 Y80.987 E.04909
G1 X32.237 Y81.52
G1 X33.403 Y82.686 E.04909
M73 P98 R0
G1 X33.403 Y83.219
G1 X32.237 Y82.054 E.04909
G1 X32.237 Y82.587
G1 X33.403 Y83.752 E.04909
G1 X33.403 Y84.285
G1 X32.237 Y83.12 E.04909
G1 X32.237 Y83.653
G1 X33.403 Y84.819 E.04909
G1 X33.403 Y85.352
G1 X32.237 Y84.187 E.04909
G1 X32.237 Y84.72
G1 X33.403 Y85.885 E.04909
G1 X33.403 Y86.418
G1 X32.237 Y85.253 E.04909
G1 X32.237 Y85.786
G1 X33.403 Y86.952 E.04909
G1 X33.403 Y87.485
G1 X32.237 Y86.32 E.04909
G1 X32.237 Y86.853
G1 X33.403 Y88.018 E.04909
G1 X33.403 Y88.551
G1 X32.237 Y87.386 E.04909
G1 X32.237 Y87.919
G1 X33.403 Y89.085 E.04909
G1 X33.403 Y89.618
G1 X32.237 Y88.453 E.04909
G1 X32.237 Y88.986
G1 X33.403 Y90.151 E.04909
G1 X33.403 Y90.685
G1 X32.237 Y89.519 E.04909
G1 X32.237 Y90.053
G1 X33.403 Y91.218 E.04909
G1 X33.403 Y91.751
G1 X32.237 Y90.586 E.04909
G1 X32.237 Y91.119
G1 X33.403 Y92.284 E.04909
G1 X33.403 Y92.818
G1 X32.237 Y91.652 E.04909
G1 X32.237 Y92.186
G1 X33.403 Y93.351 E.04909
G1 X33.403 Y93.884
G1 X32.237 Y92.719 E.04909
G1 X32.237 Y93.252
G1 X33.403 Y94.417 E.04909
G1 X33.403 Y94.951
G1 X32.237 Y93.785 E.04909
G1 X32.237 Y94.319
G1 X33.403 Y95.484 E.04909
G1 X33.403 Y96.017
G1 X32.237 Y94.852 E.04909
G1 X32.237 Y95.385
G1 X33.403 Y96.55 E.04909
G1 X33.403 Y97.084
G1 X32.237 Y95.918 E.04909
G1 X32.237 Y96.452
G1 X33.403 Y97.617 E.04909
G1 X33.403 Y98.15
G1 X32.237 Y96.985 E.04909
G1 X32.237 Y97.518
G1 X33.403 Y98.683 E.04909
G1 X33.403 Y99.217
G1 X32.237 Y98.051 E.04909
G1 X32.237 Y98.585
G1 X33.403 Y99.75 E.04909
G1 X33.403 Y100.283
G1 X32.237 Y99.118 E.04909
G1 X32.237 Y99.651
G1 X33.403 Y100.816 E.04909
G1 X33.403 Y101.35
G1 X32.237 Y100.184 E.04909
G1 X32.237 Y100.718
G1 X33.403 Y101.883 E.04909
G1 X33.403 Y102.416
G1 X32.237 Y101.251 E.04909
G1 X32.237 Y101.784
G1 X34.412 Y103.959 E.09162
G1 X33.879 Y103.959
G1 X32.237 Y102.317 E.06915
G1 X32.237 Y102.851
G1 X33.346 Y103.959 E.04669
G1 X32.813 Y103.959
G1 X32.237 Y103.384 E.02423
; WIPE_START
M204 S5000
G1 X32.813 Y103.959 E-.30905
G1 X33.346 Y103.959 E-.20264
G1 X32.884 Y103.497 E-.24831
; WIPE_END
G1 E-.04 F1800
G1 X32.83 Y95.865 Z1.4 F15000
G1 X32.503 Y48.864 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145685
G1 F7500
G2 X32.219 Y48.824 I-.191 J.323 E.00239
; WIPE_START
G1 X32.405 Y48.824 E-.48617
G1 X32.503 Y48.864 E-.27383
; WIPE_END
G1 E-.04 F1800
G1 X38.906 Y53.017 Z1.4 F15000
G1 X117.422 Y103.929 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.145578
G1 F7500
G3 X117.137 Y103.889 I-.093 J-.363 E.00239
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F7500
G1 X117.235 Y103.929 E-.27421
G1 X117.422 Y103.929 E-.48579
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.217 J0 P1  F15000
; stop printing object, unique label id: 126
M625
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z1.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

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

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

