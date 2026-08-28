; HEADER_BLOCK_START
; BambuStudio 02.07.01.57
; model printing time: 35m 48s; total estimated time: 42m 8s
; total layer number: 20
; total filament length [mm] : 4641.47
; total filament volume [cm^3] : 11164.04
; total filament weight [g] : 14.29
; model label id: 138,178
; object max height: 2.10,4.10
; filament_density: 1.28
; filament_diameter: 1.75
; max_z_height: 4.10
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 0
; additional_fan_full_speed_layer = 0
; alternate_extra_wall = 0
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
; change_filament_gcode = ;=P1S 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == \"PETG\"}\nM109 S260\n{elsif filament_type[next_extruder] == \"PVA\"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
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
; different_settings_to_system = bridge_speed;brim_type;brim_width;default_acceleration;enable_support;gap_infill_speed;initial_layer_acceleration;initial_layer_infill_speed;initial_layer_print_height;initial_layer_speed;initial_layer_travel_acceleration;inner_wall_speed;internal_solid_infill_speed;outer_wall_acceleration;outer_wall_speed;overhang_2_4_speed;overhang_3_4_speed;overhang_4_4_speed;overhang_totally_speed;skeleton_infill_density;skin_infill_density;sparse_infill_density;sparse_infill_pattern;sparse_infill_speed;support_interface_speed;support_speed;top_surface_acceleration;top_surface_speed;travel_acceleration;travel_speed;nozzle_temperature_initial_layer;nozzle_temperature_range_low;textured_plate_temp;textured_plate_temp_initial_layer;
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
; enable_order_independent_overlap_carving = 0
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
; filament_flush_temp_fast = 0
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
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
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
; filament_preheat_temperature_delta = 10
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
; filament_settings_id = "PETG Cool Plate"
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
; flush_multiplier_fast = 1.2
; flush_volumes_matrix = 0
; flush_volumes_vector = 140,140
; full_fan_speed_layer = 0
; fuzzy_skin = none
; fuzzy_skin_first_layer = 0
; fuzzy_skin_mode = displacement
; fuzzy_skin_noise_type = classic
; fuzzy_skin_octaves = 4
; fuzzy_skin_persistence = 0.5
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_scale = 1
; fuzzy_skin_thickness = 0.3
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
; initial_layer_print_height = 0.3
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
; machine_bed_mass_Y = 0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of \"timelapse_record_flag\"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_hotend_change_time = 0
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,500
; machine_max_force_Y = 0
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_printed_mass = 0
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,500
; machine_max_speed_y = 500,500
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0
; machine_min_travel_rate = 0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: P1S-0.4 ========================\n;===== date: 20251031 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action:54\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]==\"PLA\"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{flush_volumetric_speeds[initial_no_support_extruder]/2.4053*60} T{flush_temperatures[initial_no_support_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]==\"PLA\"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type==\"Textured PEI Plate\"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
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
; skirt_per_object = 1
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
; support_fast_purge_mode = 0
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
; textured_plate_temp = 30
; textured_plate_temp_initial_layer = 30
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
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle";"Bambu Lab H2S 0.4 nozzle";"Bambu Lab P2S 0.4 nozzle";"Bambu Lab H2C 0.4 nozzle";"Bambu Lab X2D 0.4 nozzle";"Bambu Lab A2L 0.4 nozzle"
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
M73 P0 R42
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
M140 S30 ;set bed temp
M190 S30 ;wait for bed temp



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
M73 P1 R41
G1 E50 F200
M400
M104 S250
G92 E0
M73 P11 R37
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S230 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P12 R36
G1 E-0.5 F300

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
M73 P13 R36
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
    G29 A X83.9748 Y51.002 I127.132 J135.427
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


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.3
; LAYER_HEIGHT: 0.3
G1 E-.8 F1800
; layer num/total_layer_count: 1/20
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S3000
G1 Z.4 F15000
; object ids of layer 1 start: 138,178
M624 AwAAAAAAAAA=
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
; object ids of this layer1 end: 138,178
M625
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X152.08 Y63.941
G1 Z.3
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
G1 X152.241 Y63.619 E.01861
G1 X152.51 Y63.228 E.02446
G1 X152.845 Y62.902 E.02415
G1 X153.238 Y62.647 E.02414
G1 X153.675 Y62.473 E.02431
G1 X154.41 Y62.362 E.03834
G1 X208.383 Y62.362 E2.78589
G1 X208.859 Y62.409 E.0247
G1 X209.31 Y62.545 E.0243
G1 X209.632 Y62.706 E.01861
M73 P14 R36
G1 X210.023 Y62.974 E.02446
G1 X210.349 Y63.31 E.02415
G1 X210.604 Y63.702 E.02414
G1 X210.778 Y64.14 E.02431
G1 X210.889 Y64.874 E.03834
G1 X210.889 Y177.847 E5.83124
G1 X210.842 Y178.323 E.0247
G1 X210.706 Y178.774 E.0243
G1 X210.545 Y179.097 E.01861
G1 X210.277 Y179.487 E.02446
G1 X209.941 Y179.813 E.02415
G1 X209.549 Y180.068 E.02414
G1 X209.112 Y180.243 E.02431
G1 X208.377 Y180.354 E.03834
G1 X154.404 Y180.354 E2.78588
G1 X153.928 Y180.307 E.0247
G1 X153.477 Y180.171 E.0243
G1 X153.154 Y180.01 E.01861
G1 X152.764 Y179.741 E.02446
G1 X152.438 Y179.406 E.02415
G1 X152.183 Y179.014 E.02414
G1 X152.008 Y178.576 E.02431
G1 X151.898 Y177.841 E.03834
G1 X151.898 Y64.868 E5.83125
G1 X151.944 Y64.392 E.0247
G1 X152.063 Y63.999 E.02121
M204 S3000
G1 X152.482 Y64.125 F15000
G1 F1500
M204 S250
M73 P14 R35
G1 X152.492 Y64.093 E.00172
G1 X152.623 Y63.833 E.01503
G1 X152.837 Y63.521 E.01953
G1 X153.129 Y63.237 E.02104
G1 X153.428 Y63.043 E.01838
G1 X153.776 Y62.902 E.01938
M73 P15 R35
G1 X154.452 Y62.797 E.03532
G1 X208.368 Y62.798 E2.78292
G1 X208.761 Y62.837 E.0204
G1 X209.138 Y62.948 E.02027
G1 X209.418 Y63.087 E.01616
G1 X209.749 Y63.318 E.02084
G1 X210.014 Y63.594 E.01973
G1 X210.22 Y63.915 E.01971
G1 X210.357 Y64.269 E.01959
G1 X210.454 Y64.917 E.03379
G1 X210.454 Y177.819 E5.82761
G1 X210.414 Y178.225 E.02106
G1 X210.295 Y178.623 E.02141
G1 X210.164 Y178.883 E.01503
G1 X209.949 Y179.194 E.01953
G1 X209.657 Y179.478 E.02104
G1 X209.359 Y179.673 E.01838
G1 X209.011 Y179.814 E.01938
G1 X208.334 Y179.918 E.03533
G1 X154.432 Y179.918 E2.78225
G1 X154.026 Y179.879 E.02106
G1 X153.628 Y179.759 E.02141
G1 X153.368 Y179.628 E.01503
G1 X153.057 Y179.414 E.01953
G1 X152.773 Y179.122 E.02104
G1 X152.579 Y178.823 E.01838
G1 X152.437 Y178.475 E.01938
G1 X152.333 Y177.799 E.03532
G1 X152.333 Y64.896 E5.82762
G1 X152.372 Y64.49 E.02105
G1 X152.465 Y64.182 E.01659
M204 S3000
G1 X152.883 Y64.311 F15000
G1 F1500
M204 S250
G1 X152.903 Y64.245 E.00357
G1 X153.003 Y64.048 E.01139
G1 X153.181 Y63.795 E.01597
G1 X153.393 Y63.588 E.0153
G1 X153.62 Y63.438 E.01404
G1 X153.908 Y63.322 E.01599
G1 X154.496 Y63.233 E.03069
G1 X208.34 Y63.234 E2.77925
G1 X208.665 Y63.265 E.01684
G1 X208.967 Y63.352 E.01623
G1 X209.204 Y63.468 E.0136
G1 X209.474 Y63.66 E.0171
G1 X209.677 Y63.876 E.0153
G1 X209.834 Y64.126 E.01525
G1 X209.936 Y64.396 E.01489
G1 X210.018 Y64.959 E.02936
G1 X210.018 Y177.792 E5.82404
G1 X209.981 Y178.153 E.01875
G1 X209.884 Y178.471 E.01715
G1 X209.783 Y178.667 E.01139
G1 X209.606 Y178.921 E.01597
G1 X209.393 Y179.128 E.0153
G1 X209.167 Y179.278 E.01404
G1 X208.879 Y179.393 E.01599
G1 X208.291 Y179.482 E.03069
G1 X154.459 Y179.482 E2.77861
G1 X154.098 Y179.446 E.01875
G1 X153.78 Y179.348 E.01715
G1 X153.584 Y179.248 E.01139
G1 X153.33 Y179.07 E.01597
G1 X153.124 Y178.858 E.0153
G1 X152.973 Y178.631 E.01404
G1 X152.858 Y178.343 E.01599
G1 X152.769 Y177.756 E.03069
G1 X152.769 Y64.923 E5.82397
G1 X152.806 Y64.562 E.01874
G1 X152.865 Y64.368 E.01049
M204 S3000
G1 X153.274 Y64.509 F15000
G1 F1500
M204 S250
G1 X153.319 Y64.378 E.00712
G1 X153.382 Y64.267 E.00659
G1 X153.625 Y63.973 E.01972
G1 X153.822 Y63.833 E.01243
G1 X154.009 Y63.745 E.01066
G1 X154.143 Y63.704 E.00726
G1 X154.412 Y63.669 E.01401
M73 P16 R35
G1 X208.371 Y63.669 E2.78518
G1 X208.668 Y63.714 E.01549
G1 X208.959 Y63.83 E.01614
G1 X209.208 Y64.017 E.01609
G1 X209.416 Y64.282 E.01741
G1 X209.547 Y64.607 E.01808
G1 X209.582 Y64.876 E.01401
G1 X209.582 Y177.836 E5.83053
G1 X209.537 Y178.133 E.0155
G1 X209.421 Y178.423 E.01614
G1 X209.235 Y178.673 E.01608
G1 X208.969 Y178.88 E.01741
G1 X208.644 Y179.011 E.01808
G1 X208.375 Y179.047 E.01401
G1 X154.415 Y179.047 E2.78518
G1 X154.119 Y179.001 E.0155
G1 X153.828 Y178.885 E.01614
G1 X153.578 Y178.699 E.01608
G1 X153.371 Y178.433 E.01741
G1 X153.24 Y178.108 E.01808
G1 X153.204 Y177.839 E.01401
G1 X153.204 Y64.88 E5.83053
G1 X153.251 Y64.577 E.01583
G1 X153.255 Y64.566 E.0006
M204 S3000
G1 X153.681 Y64.647 F15000
G1 F1500
M204 S250
G1 X153.726 Y64.534 E.00627
G1 X153.888 Y64.319 E.01393
G1 X153.997 Y64.233 E.00715
G1 X154.202 Y64.136 E.01174
G1 X154.403 Y64.104 E.0105
G1 X208.381 Y64.104 E2.78614
G1 X208.601 Y64.144 E.01151
G1 X208.787 Y64.23 E.01057
G1 X208.932 Y64.353 E.00982
G1 X209.019 Y64.461 E.00715
G1 X209.115 Y64.667 E.01174
G1 X209.147 Y64.868 E.0105
G1 X209.147 Y177.846 E5.8315
G1 X209.107 Y178.065 E.01151
G1 X209.021 Y178.251 E.01057
G1 X208.898 Y178.397 E.00982
G1 X208.79 Y178.483 E.00715
G1 X208.584 Y178.58 E.01174
G1 X208.383 Y178.611 E.0105
G1 X154.405 Y178.611 E2.78614
G1 X154.186 Y178.571 E.01151
G1 X154 Y178.486 E.01057
G1 X153.854 Y178.363 E.00982
G1 X153.768 Y178.254 E.00715
G1 X153.671 Y178.049 E.01174
G1 X153.64 Y177.848 E.0105
G1 X153.64 Y64.87 E5.8315
G1 X153.67 Y64.706 E.00858
M204 S3000
G1 X154.087 Y64.814 F15000
G1 F1500
M204 S250
G1 X154.103 Y64.752 E.00327
G1 X154.15 Y64.668 E.005
M73 P16 R34
G1 X154.28 Y64.564 E.0086
G1 X154.393 Y64.54 E.00598
G1 X208.393 Y64.54 E2.78728
G1 X208.499 Y64.567 E.00562
G1 X208.584 Y64.614 E.005
G1 X208.687 Y64.744 E.0086
G1 X208.711 Y64.858 E.00598
M73 P17 R34
G1 X208.711 Y177.858 E5.83263
G1 X208.684 Y177.963 E.00562
G1 X208.637 Y178.048 E.005
G1 X208.507 Y178.152 E.0086
G1 X208.393 Y178.176 E.00598
G1 X154.393 Y178.176 E2.78728
G1 X154.288 Y178.148 E.00562
G1 X154.203 Y178.101 E.005
G1 X154.099 Y177.971 E.0086
G1 X154.076 Y177.858 E.00598
G1 X154.076 Y64.872 E5.83188
; WIPE_START
G1 X154.103 Y64.752 E-.04675
G1 X154.15 Y64.668 E-.03679
G1 X154.28 Y64.564 E-.06334
G1 X154.393 Y64.54 E-.044
G1 X155.891 Y64.54 E-.56912
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X159.089 Y71.47 Z.7 F15000
G1 X207.993 Y177.458 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X154.793 Y177.458 E2.74598
G1 X154.793 Y65.258 E5.79134
G1 X207.993 Y65.258 E2.74598
G1 X207.993 Y177.398 E5.78824
M204 S3000
G1 X207.558 Y177.022 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X155.229 Y177.022 E2.70101
G1 X155.229 Y65.693 E5.74637
G1 X207.558 Y65.693 E2.70101
G1 X207.558 Y176.962 E5.74327
; WIPE_START
G1 X205.558 Y176.964 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X205.16 Y169.342 Z.7 F15000
G1 X199.793 Y66.458 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X199.793 Y91.458 E1.29041
G1 X200.993 Y91.458 E.06194
G1 X200.993 Y66.458 E1.29041
G1 X206.793 Y66.458 E.29937
G1 X206.793 Y172.258 E5.461
G1 X155.993 Y172.258 E2.6221
G1 X155.993 Y66.458 E5.461
G1 X161.793 Y66.458 E.29937
G1 X161.793 Y91.458 E1.29041
G1 X162.993 Y91.458 E.06194
G1 X162.993 Y66.458 E1.29041
G1 X199.733 Y66.458 E1.89638
M204 S3000
M73 P18 R34
G1 X199.793 Y66.022 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X200.229 Y66.022 E.02249
G1 X200.229 Y91.022 E1.29041
G1 X200.558 Y91.022 E.01697
G1 X200.558 Y66.022 E1.29041
G1 X207.229 Y66.022 E.34434
G1 X207.229 Y172.693 E5.50596
G1 X155.558 Y172.693 E2.66707
G1 X155.558 Y66.022 E5.50596
G1 X162.229 Y66.022 E.34434
G1 X162.229 Y91.022 E1.29041
G1 X162.558 Y91.022 E.01697
G1 X162.558 Y66.022 E1.29041
G1 X199.733 Y66.022 E1.91886
; WIPE_START
G1 X200.229 Y66.022 E-.18834
G1 X200.229 Y67.527 E-.57166
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X200.682 Y75.145 Z.7 F15000
G1 X206.493 Y172.868 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.504731
G1 F3000
M204 S250
G1 X207.187 Y173.562 E.05125
G1 X207.187 Y174.185 E.03249
G1 X206.066 Y173.064 E.08274
G1 X205.443 Y173.064 E.03249
G1 X207.187 Y174.808 E.12869
G1 X207.187 Y175.43 E.03249
M73 P19 R34
G1 X204.821 Y173.064 E.17465
G1 X204.198 Y173.064 E.03249
M73 P19 R33
G1 X207.187 Y176.053 E.2206
G1 X207.187 Y176.652 E.03124
G1 X207.163 Y176.652 E.00126
G1 X203.575 Y173.064 E.26478
G1 X202.952 Y173.064 E.03249
G1 X206.541 Y176.652 E.26478
G1 X205.918 Y176.652 E.03249
G1 X202.33 Y173.064 E.26478
G1 X201.707 Y173.064 E.03249
G1 X205.295 Y176.652 E.26478
G1 X204.672 Y176.652 E.03249
G1 X201.084 Y173.064 E.26478
G1 X200.461 Y173.064 E.03249
G1 X204.05 Y176.652 E.26478
G1 X203.427 Y176.652 E.03249
G1 X199.839 Y173.064 E.26478
M73 P20 R33
G1 X199.216 Y173.064 E.03249
G1 X202.804 Y176.652 E.26478
G1 X202.181 Y176.652 E.03249
G1 X198.593 Y173.064 E.26478
G1 X197.97 Y173.064 E.03249
G1 X201.559 Y176.652 E.26478
G1 X200.936 Y176.652 E.03249
G1 X197.348 Y173.064 E.26478
G1 X196.725 Y173.064 E.03249
G1 X200.313 Y176.652 E.26478
G1 X199.69 Y176.652 E.03249
G1 X196.102 Y173.064 E.26478
G1 X195.479 Y173.064 E.03249
G1 X199.068 Y176.652 E.26478
G1 X198.445 Y176.652 E.03249
G1 X194.857 Y173.064 E.26478
G1 X194.234 Y173.064 E.03249
G1 X197.822 Y176.652 E.26478
G1 X197.199 Y176.652 E.03249
G1 X193.611 Y173.064 E.26478
G1 X192.988 Y173.064 E.03249
G1 X196.577 Y176.652 E.26478
G1 X195.954 Y176.652 E.03249
G1 X192.366 Y173.064 E.26478
G1 X191.743 Y173.064 E.03249
G1 X195.331 Y176.652 E.26478
G1 X194.708 Y176.652 E.03249
G1 X191.12 Y173.064 E.26478
G1 X190.497 Y173.064 E.03249
G1 X194.086 Y176.652 E.26478
G1 X193.463 Y176.652 E.03249
G1 X189.875 Y173.064 E.26478
G1 X189.252 Y173.064 E.03249
G1 X192.84 Y176.652 E.26478
G1 X192.217 Y176.652 E.03249
G1 X188.629 Y173.064 E.26478
G1 X188.006 Y173.064 E.03249
G1 X191.595 Y176.652 E.26478
G1 X190.972 Y176.652 E.03249
G1 X187.384 Y173.064 E.26478
G1 X186.761 Y173.064 E.03249
G1 X190.349 Y176.652 E.26478
G1 X189.726 Y176.652 E.03249
G1 X186.138 Y173.064 E.26478
G1 X185.515 Y173.064 E.03249
G1 X189.104 Y176.652 E.26478
G1 X188.481 Y176.652 E.03249
G1 X184.893 Y173.064 E.26478
G1 X184.27 Y173.064 E.03249
G1 X187.858 Y176.652 E.26478
G1 X187.235 Y176.652 E.03249
G1 X183.647 Y173.064 E.26478
G1 X183.024 Y173.064 E.03249
G1 X186.613 Y176.652 E.26478
G1 X185.99 Y176.652 E.03249
G1 X182.402 Y173.064 E.26478
G1 X181.779 Y173.064 E.03249
G1 X185.367 Y176.652 E.26478
G1 X184.744 Y176.652 E.03249
G1 X181.156 Y173.064 E.26478
G1 X180.533 Y173.064 E.03249
G1 X184.122 Y176.652 E.26478
G1 X183.499 Y176.652 E.03249
G1 X179.911 Y173.064 E.26478
G1 X179.288 Y173.064 E.03249
G1 X182.876 Y176.652 E.26478
G1 X182.253 Y176.652 E.03249
G1 X178.665 Y173.064 E.26478
M73 P21 R33
G1 X178.042 Y173.064 E.03249
G1 X181.631 Y176.652 E.26478
G1 X181.008 Y176.652 E.03249
G1 X177.42 Y173.064 E.26478
G1 X176.797 Y173.064 E.03249
G1 X180.385 Y176.652 E.26478
G1 X179.762 Y176.652 E.03249
G1 X176.174 Y173.064 E.26478
G1 X175.551 Y173.064 E.03249
G1 X179.14 Y176.652 E.26478
G1 X178.517 Y176.652 E.03249
G1 X174.929 Y173.064 E.26478
G1 X174.306 Y173.064 E.03249
G1 X177.894 Y176.652 E.26478
G1 X177.271 Y176.652 E.03249
G1 X173.683 Y173.064 E.26478
G1 X173.06 Y173.064 E.03249
G1 X176.649 Y176.652 E.26478
G1 X176.026 Y176.652 E.03249
G1 X172.438 Y173.064 E.26477
G1 X171.815 Y173.064 E.03249
G1 X175.403 Y176.652 E.26478
G1 X174.78 Y176.652 E.03249
G1 X171.192 Y173.064 E.26478
G1 X170.569 Y173.064 E.03249
G1 X174.158 Y176.652 E.26478
G1 X173.535 Y176.652 E.03249
G1 X169.947 Y173.064 E.26478
G1 X169.324 Y173.064 E.03249
G1 X172.912 Y176.652 E.26478
G1 X172.289 Y176.652 E.03249
G1 X168.701 Y173.064 E.26478
G1 X168.078 Y173.064 E.03249
G1 X171.667 Y176.652 E.26478
G1 X171.044 Y176.652 E.03249
G1 X167.456 Y173.064 E.26478
G1 X166.833 Y173.064 E.03249
G1 X170.421 Y176.652 E.26478
G1 X169.799 Y176.652 E.03249
G1 X166.21 Y173.064 E.26478
G1 X165.587 Y173.064 E.03249
G1 X169.176 Y176.652 E.26478
G1 X168.553 Y176.652 E.03249
G1 X164.965 Y173.064 E.26478
G1 X164.342 Y173.064 E.03249
G1 X167.93 Y176.652 E.26478
G1 X167.308 Y176.652 E.03249
G1 X163.719 Y173.064 E.26478
G1 X163.096 Y173.064 E.03249
G1 X166.685 Y176.652 E.26478
G1 X166.062 Y176.652 E.03249
G1 X162.474 Y173.064 E.26478
G1 X161.851 Y173.064 E.03249
G1 X165.439 Y176.652 E.26478
G1 X164.817 Y176.652 E.03249
G1 X161.228 Y173.064 E.26478
G1 X160.605 Y173.064 E.03249
G1 X164.194 Y176.652 E.26478
G1 X163.571 Y176.652 E.03249
G1 X159.983 Y173.064 E.26478
G1 X159.36 Y173.064 E.03249
G1 X162.948 Y176.652 E.26478
G1 X162.326 Y176.652 E.03249
G1 X158.737 Y173.064 E.26478
G1 X158.114 Y173.064 E.03249
G1 X161.703 Y176.652 E.26478
G1 X161.08 Y176.652 E.03249
G1 X157.492 Y173.064 E.26478
G1 X156.869 Y173.064 E.03249
G1 X160.457 Y176.652 E.26478
G1 X159.835 Y176.652 E.03249
G1 X156.246 Y173.064 E.26478
G1 X155.623 Y173.064 E.03249
G1 X159.212 Y176.652 E.26478
G1 X158.589 Y176.652 E.03249
G1 X155.599 Y173.662 E.22061
G1 X155.599 Y174.285 E.03249
G1 X157.966 Y176.652 E.17466
G1 X157.344 Y176.652 E.03249
G1 X155.599 Y174.908 E.12871
G1 X155.599 Y175.53 E.03249
G1 X156.721 Y176.652 E.08276
G1 X156.098 Y176.652 E.03249
G1 X155.403 Y175.957 E.05127
; OBJECT_ID: 178
; WIPE_START
G1 X156.098 Y176.652 E-.3734
G1 X156.721 Y176.652 E-.23665
G1 X156.442 Y176.373 E-.14996
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
M204 S3000
G1 X148.81 Y176.306 Z.7 F15000
G1 X109.184 Y175.957 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
G1 X109.184 Y181.705 E.29669
G1 X109.138 Y182.181 E.0247
G1 X109.001 Y182.632 E.0243
G1 X108.841 Y182.955 E.01861
G1 X108.572 Y183.345 E.02446
G1 X108.236 Y183.671 E.02415
G1 X107.844 Y183.926 E.02414
G1 X107.407 Y184.101 E.02431
G1 X106.672 Y184.212 E.03834
G1 X86.699 Y184.212 E1.03093
G1 X86.223 Y184.165 E.0247
G1 X85.772 Y184.029 E.0243
G1 X85.449 Y183.868 E.01861
G1 X85.059 Y183.599 E.02446
G1 X84.733 Y183.264 E.02415
G1 X84.478 Y182.871 E.02414
G1 X84.304 Y182.434 E.02431
G1 X84.193 Y181.699 E.03834
G1 X84.193 Y51.726 E6.70872
G1 X84.239 Y51.25 E.0247
G1 X84.376 Y50.799 E.0243
G1 X84.536 Y50.477 E.01861
G1 X84.805 Y50.086 E.02446
G1 X85.141 Y49.76 E.02415
G1 X85.533 Y49.505 E.02414
G1 X85.97 Y49.331 E.02431
G1 X86.705 Y49.22 E.03834
G1 X106.678 Y49.22 E1.03094
G1 X107.154 Y49.267 E.0247
G1 X107.605 Y49.403 E.0243
G1 X107.928 Y49.564 E.01861
G1 X108.318 Y49.832 E.02446
G1 X108.644 Y50.168 E.02415
G1 X108.899 Y50.56 E.02414
G1 X109.073 Y50.997 E.02431
G1 X109.184 Y51.732 E.03834
G1 X109.184 Y175.897 E6.40893
M204 S3000
G1 X108.749 Y175.897 F15000
G1 F1500
M204 S250
G1 X108.749 Y181.677 E.29835
G1 X108.709 Y182.083 E.02106
G1 X108.598 Y182.46 E.02027
G1 X108.459 Y182.741 E.01616
G1 X108.245 Y183.052 E.01953
G1 X107.972 Y183.32 E.01973
G1 X107.654 Y183.53 E.0197
G1 X107.306 Y183.672 E.01938
G1 X106.63 Y183.776 E.03533
G1 X86.727 Y183.776 E1.0273
G1 X86.321 Y183.737 E.02106
G1 X85.944 Y183.625 E.02027
G1 X85.664 Y183.486 E.01616
G1 X85.352 Y183.272 E.01953
G1 X85.084 Y183 E.01973
G1 X84.874 Y182.681 E.0197
G1 X84.732 Y182.333 E.01938
G1 X84.628 Y181.657 E.03532
G1 X84.628 Y51.754 E6.70509
G1 X84.667 Y51.348 E.02105
M73 P21 R32
G1 X84.779 Y50.971 E.02027
G1 X84.918 Y50.691 E.01616
G1 X85.132 Y50.379 E.01953
G1 X85.405 Y50.111 E.01973
G1 X85.723 Y49.901 E.0197
G1 X86.071 Y49.76 E.01938
G1 X86.728 Y49.657 E.03432
G1 X106.663 Y49.656 E1.02898
G1 X107.056 Y49.695 E.0204
G1 X107.433 Y49.806 E.02027
G1 X107.713 Y49.945 E.01616
G1 X108.044 Y50.176 E.02084
G1 X108.309 Y50.452 E.01973
G1 X108.515 Y50.773 E.01971
G1 X108.652 Y51.127 E.01959
G1 X108.749 Y51.775 E.03379
G1 X108.749 Y175.837 E6.40363
M204 S3000
G1 X108.313 Y175.837 F15000
G1 F1500
M204 S250
G1 X108.313 Y181.65 E.30004
G1 X108.281 Y181.988 E.0175
G1 X108.194 Y182.29 E.01622
G1 X108.077 Y182.527 E.01365
G1 X107.9 Y182.78 E.01593
G1 X107.686 Y182.987 E.0154
G1 X107.461 Y183.136 E.01394
G1 X107.204 Y183.243 E.01439
G1 X106.586 Y183.34 E.03225
M73 P22 R32
G1 X86.754 Y183.34 E1.02365
G1 X86.417 Y183.308 E.0175
G1 X86.115 Y183.222 E.01622
G1 X85.877 Y183.105 E.01365
G1 X85.624 Y182.928 E.01593
G1 X85.417 Y182.713 E.0154
G1 X85.268 Y182.488 E.01394
G1 X85.161 Y182.231 E.01439
G1 X85.064 Y181.614 E.03225
G1 X85.064 Y51.781 E6.70145
G1 X85.096 Y51.444 E.0175
G1 X85.183 Y51.142 E.01622
G1 X85.3 Y50.905 E.01365
G1 X85.477 Y50.652 E.01593
G1 X85.691 Y50.444 E.0154
G1 X85.916 Y50.295 E.01394
G1 X86.174 Y50.188 E.01442
G1 X86.772 Y50.093 E.03124
G1 X106.648 Y50.092 E1.02594
G1 X106.96 Y50.123 E.01619
G1 X107.262 Y50.21 E.01623
G1 X107.499 Y50.326 E.0136
G1 X107.769 Y50.518 E.0171
G1 X107.972 Y50.733 E.0153
G1 X108.129 Y50.984 E.01525
G1 X108.231 Y51.254 E.01489
G1 X108.313 Y51.816 E.02936
G1 X108.313 Y175.777 E6.39838
M204 S3000
G1 X107.877 Y175.777 F15000
G1 F1500
M204 S250
G1 X107.878 Y181.694 E.3054
G1 X107.831 Y181.995 E.01575
G1 X107.795 Y182.109 E.00613
G1 X107.64 Y182.401 E.0171
G1 X107.533 Y182.528 E.00858
G1 X107.364 Y182.675 E.01153
G1 X107.058 Y182.834 E.0178
G1 X106.921 Y182.875 E.00741
G1 X106.732 Y182.896 E.00977
G1 X86.711 Y182.905 E1.03345
G1 X86.409 Y182.858 E.01576
G1 X86.296 Y182.823 E.00613
G1 X86.003 Y182.667 E.0171
G1 X85.876 Y182.56 E.00858
G1 X85.729 Y182.391 E.01153
G1 X85.57 Y182.085 E.01779
G1 X85.529 Y181.948 E.00742
G1 X85.508 Y181.759 E.00978
G1 X85.499 Y51.738 E6.71123
G1 X85.546 Y51.435 E.01583
G1 X85.614 Y51.236 E.01082
G1 X85.677 Y51.125 E.00659
G1 X85.92 Y50.831 E.01972
G1 X86.117 Y50.691 E.01243
G1 X86.304 Y50.603 E.01066
G1 X86.438 Y50.562 E.00726
G1 X86.707 Y50.527 E.01401
G1 X106.667 Y50.527 E1.03022
G1 X106.968 Y50.573 E.01574
G1 X107.081 Y50.609 E.00612
G1 X107.374 Y50.764 E.01711
G1 X107.501 Y50.871 E.00858
G1 X107.648 Y51.04 E.01153
G1 X107.807 Y51.346 E.01779
G1 X107.848 Y51.484 E.00742
G1 X107.869 Y51.672 E.00978
G1 X107.877 Y175.717 E6.40274
M204 S3000
G1 X107.441 Y175.717 F15000
G1 F1500
M204 S250
G1 X107.442 Y181.704 E.30901
G1 X107.402 Y181.923 E.01151
G1 X107.316 Y182.109 E.01057
G1 X107.194 Y182.255 E.00982
G1 X107.085 Y182.341 E.00714
G1 X106.868 Y182.443 E.01241
G1 X106.74 Y182.461 E.00667
G1 X86.701 Y182.469 E1.03435
G1 X86.481 Y182.429 E.01152
M73 P23 R32
G1 X86.295 Y182.344 E.01057
G1 X86.15 Y182.221 E.00982
G1 X86.063 Y182.113 E.00714
G1 X85.962 Y181.895 E.01241
G1 X85.944 Y181.767 E.00667
G1 X85.935 Y51.728 E6.71213
G1 X85.976 Y51.505 E.01168
G1 X86.021 Y51.392 E.00627
G1 X86.183 Y51.177 E.01393
G1 X86.292 Y51.09 E.00715
G1 X86.498 Y50.994 E.01174
G1 X86.699 Y50.962 E.0105
G1 X106.677 Y50.962 E1.03119
G1 X106.896 Y51.002 E.01151
G1 X107.082 Y51.088 E.01057
G1 X107.227 Y51.211 E.00982
G1 X107.314 Y51.319 E.00714
G1 X107.415 Y51.537 E.01241
G1 X107.433 Y51.665 E.00667
G1 X107.441 Y175.657 E6.40002
M204 S3000
G1 X107.006 Y175.657 F15000
G1 F1500
M204 S250
G1 X107.006 Y181.716 E.31272
G1 X106.979 Y181.821 E.00562
G1 X106.932 Y181.906 E.005
G1 X106.802 Y182.01 E.0086
G1 X106.749 Y182.025 E.00285
G1 X86.688 Y182.033 E1.03543
G1 X86.583 Y182.006 E.00562
G1 X86.498 Y181.959 E.005
G1 X86.394 Y181.829 E.0086
G1 X86.379 Y181.776 E.00285
G1 X86.371 Y51.716 E6.71322
G1 X86.398 Y51.61 E.00562
G1 X86.445 Y51.526 E.005
G1 X86.575 Y51.422 E.0086
G1 X86.688 Y51.398 E.00598
G1 X106.688 Y51.398 E1.03233
G1 X106.794 Y51.425 E.00562
G1 X106.879 Y51.472 E.005
G1 X106.983 Y51.602 E.0086
G1 X106.998 Y51.655 E.00285
G1 X107.006 Y175.597 E6.3974
; WIPE_START
G1 X107.006 Y177.597 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X106.288 Y181.316 Z.7 F15000
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X87.088 Y181.316 E.99103
G1 X87.088 Y52.116 E6.66882
G1 X106.288 Y52.116 E.99103
G1 X106.288 Y181.256 E6.66572
M204 S3000
G1 X105.853 Y180.88 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X87.524 Y180.88 E.94606
G1 X87.524 Y52.551 E6.62385
G1 X105.853 Y52.551 E.94606
G1 X105.853 Y180.82 E6.62075
; WIPE_START
G1 X103.853 Y180.827 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X101.567 Y173.545 Z.7 F15000
G1 X98.713 Y164.451 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X98.692 Y164.474 E.00157
G1 X97.397 Y165.05 E.07317
G1 X95.98 Y165.05 E.07317
G1 X94.685 Y164.474 E.07317
M73 P24 R31
G1 X93.736 Y163.42 E.07317
G1 X93.298 Y162.072 E.07317
G1 X93.446 Y160.662 E.07317
G1 X94.155 Y159.435 E.07317
G1 X95.302 Y158.601 E.07317
G1 X96.56 Y158.334 E.06636
G1 X96.688 Y158.307 E.0068
G1 X98.075 Y158.601 E.07317
G1 X99.222 Y159.435 E.07317
G1 X99.931 Y160.662 E.07317
G1 X100.079 Y162.072 E.07317
G1 X99.641 Y163.42 E.07317
G1 X98.753 Y164.406 E.0685
M204 S3000
G1 X99.036 Y164.742 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X98.954 Y164.834 E.00635
G1 X97.49 Y165.486 E.08272
G1 X95.887 Y165.486 E.08273
G1 X94.423 Y164.834 E.08273
G1 X93.351 Y163.643 E.08273
G1 X92.855 Y162.119 E.08272
G1 X93.023 Y160.525 E.08272
G1 X93.824 Y159.137 E.08273
G1 X95.121 Y158.195 E.08272
G1 X96.469 Y157.908 E.07114
G1 X96.689 Y157.861 E.01158
G1 X98.256 Y158.195 E.08272
G1 X99.553 Y159.137 E.08272
G1 X100.354 Y160.525 E.08273
G1 X100.522 Y162.119 E.08272
G1 X100.026 Y163.643 E.08272
G1 X99.076 Y164.698 E.07328
; WIPE_START
G1 X98.954 Y164.834 E-.06953
M73 P25 R31
G1 X97.49 Y165.486 E-.60901
G1 X97.275 Y165.486 E-.08146
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X97.288 Y157.853 Z.7 F15000
G1 X97.425 Y75.038 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X97.397 Y75.05 E.00157
G1 X95.98 Y75.05 E.07317
G1 X94.685 Y74.474 E.07317
G1 X93.736 Y73.42 E.07317
G1 X93.298 Y72.072 E.07317
G1 X93.446 Y70.662 E.07317
G1 X94.155 Y69.435 E.07317
G1 X95.302 Y68.601 E.07316
G1 X96.56 Y68.334 E.06636
G1 X96.688 Y68.307 E.0068
G1 X98.075 Y68.601 E.07317
G1 X99.222 Y69.435 E.07316
G1 X99.931 Y70.662 E.07317
G1 X100.079 Y72.072 E.07317
G1 X99.641 Y73.42 E.07317
G1 X98.692 Y74.474 E.07317
G1 X97.48 Y75.013 E.0685
M204 S3000
G1 X97.602 Y75.436 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X97.49 Y75.486 E.00635
G1 X95.887 Y75.486 E.08273
G1 X94.423 Y74.834 E.08272
G1 X93.351 Y73.643 E.08273
G1 X92.855 Y72.119 E.08272
G1 X93.023 Y70.525 E.08272
G1 X93.824 Y69.137 E.08273
G1 X95.121 Y68.195 E.08272
G1 X96.469 Y67.908 E.07114
G1 X96.689 Y67.861 E.01158
G1 X98.256 Y68.195 E.08272
G1 X99.553 Y69.137 E.08272
G1 X100.354 Y70.525 E.08273
G1 X100.522 Y72.119 E.08272
G1 X100.026 Y73.643 E.08272
G1 X98.954 Y74.834 E.08273
G1 X97.657 Y75.411 E.07328
; WIPE_START
G1 X97.49 Y75.486 E-.06952
G1 X95.887 Y75.486 E-.60904
G1 X95.691 Y75.399 E-.08144
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X96.381 Y83 Z.7 F15000
G1 X99.237 Y114.461 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X99.931 Y115.662 E.0716
G1 X100.079 Y117.072 E.07317
G1 X99.641 Y118.42 E.07317
G1 X98.692 Y119.474 E.07317
G1 X97.397 Y120.05 E.07317
G1 X95.98 Y120.05 E.07317
G1 X94.685 Y119.474 E.07317
G1 X93.736 Y118.42 E.07317
G1 X93.298 Y117.072 E.07317
G1 X93.446 Y115.662 E.07317
G1 X94.155 Y114.435 E.07317
G1 X95.302 Y113.601 E.07316
G1 X96.56 Y113.334 E.06636
G1 X96.688 Y113.307 E.0068
G1 X98.075 Y113.601 E.07317
G1 X99.198 Y114.417 E.07164
M204 S3000
G1 X99.614 Y114.243 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X100.354 Y115.525 E.07638
G1 X100.522 Y117.119 E.08273
G1 X100.026 Y118.643 E.08272
G1 X98.954 Y119.834 E.08273
G1 X97.49 Y120.486 E.08272
G1 X95.887 Y120.486 E.08273
G1 X94.423 Y119.834 E.08273
G1 X93.351 Y118.643 E.08272
G1 X92.855 Y117.119 E.08273
G1 X93.023 Y115.525 E.08272
G1 X93.824 Y114.137 E.08273
G1 X95.121 Y113.195 E.08272
G1 X96.469 Y112.908 E.07114
G1 X96.689 Y112.861 E.01158
G1 X98.256 Y113.195 E.08272
G1 X99.553 Y114.137 E.08272
G1 X99.584 Y114.191 E.00325
; WIPE_START
G1 X100.354 Y115.525 E-.58511
G1 X100.402 Y115.982 E-.1749
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X101.046 Y108.377 Z.7 F15000
G1 X105.679 Y53.606 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500121
G1 F3000
M204 S250
G1 X104.994 Y52.922 E.05
G1 X104.378 Y52.922 E.03182
G1 X105.483 Y54.027 E.08069
G1 X105.483 Y54.643 E.03182
G1 X103.761 Y52.922 E.12568
G1 X103.145 Y52.922 E.03182
G1 X105.483 Y55.259 E.17068
G1 X105.483 Y55.875 E.03182
G1 X102.529 Y52.922 E.21567
G1 X101.913 Y52.922 E.03182
G1 X105.483 Y56.492 E.26067
G1 X105.483 Y57.108 E.03182
G1 X101.296 Y52.922 E.30566
G1 X100.68 Y52.922 E.03182
G1 X105.483 Y57.724 E.35066
G1 X105.483 Y58.34 E.03182
G1 X100.064 Y52.922 E.39565
G1 X99.448 Y52.922 E.03182
G1 X105.483 Y58.956 E.44065
G1 X105.483 Y59.573 E.03182
G1 X98.832 Y52.922 E.48564
G1 X98.215 Y52.922 E.03182
G1 X105.483 Y60.189 E.53064
G1 X105.483 Y60.805 E.03182
G1 X97.599 Y52.922 E.57563
G1 X96.983 Y52.922 E.03182
G1 X105.483 Y61.421 E.62063
G1 X105.483 Y62.038 E.03182
G1 X96.367 Y52.922 E.66562
G1 X95.75 Y52.922 E.03182
G1 X105.483 Y62.654 E.71062
G1 X105.483 Y63.27 E.03182
G1 X95.134 Y52.922 E.75561
G1 X94.518 Y52.922 E.03182
G1 X105.483 Y63.886 E.8006
G1 X105.483 Y64.502 E.03182
G1 X93.902 Y52.922 E.8456
G1 X93.285 Y52.922 E.03182
G1 X105.483 Y65.119 E.89059
G1 X105.483 Y65.735 E.03182
G1 X92.669 Y52.922 E.93559
G1 X92.053 Y52.922 E.03182
G1 X105.483 Y66.351 E.98058
G1 X105.483 Y66.967 E.03182
G1 X91.437 Y52.922 E1.02558
G1 X90.821 Y52.922 E.03182
G1 X105.483 Y67.584 E1.07057
G1 X105.483 Y68.2 E.03182
G1 X90.204 Y52.922 E1.11557
G1 X89.588 Y52.922 E.03182
G1 X105.483 Y68.816 E1.16056
G1 X105.483 Y69.432 E.03182
G1 X88.972 Y52.922 E1.20556
G1 X88.356 Y52.922 E.03182
G1 X105.483 Y70.049 E1.25055
G1 X105.483 Y70.665 E.03182
G1 X87.894 Y53.077 E1.28424
G1 X87.894 Y53.693 E.03182
G1 X105.483 Y71.281 E1.28424
G1 X105.483 Y71.897 E.03182
G1 X87.894 Y54.309 E1.28424
G1 X87.894 Y54.925 E.03182
G1 X105.483 Y72.513 E1.28424
G1 X105.483 Y73.13 E.03182
G1 X87.894 Y55.541 E1.28424
G1 X87.894 Y56.158 E.03182
G1 X105.483 Y73.746 E1.28424
G1 X105.483 Y74.362 E.03182
G1 X87.894 Y56.774 E1.28424
M73 P26 R31
G1 X87.894 Y57.39 E.03182
G1 X98.338 Y67.833 E.76253
G1 X98.41 Y67.849 E.00383
G1 X99.834 Y68.883 E.09087
G1 X100.444 Y69.94 E.06298
G1 X105.483 Y74.978 E.36791
G1 X105.483 Y75.595 E.03182
G1 X100.763 Y70.875 E.34459
G1 X100.836 Y71.564 E.03575
G1 X105.483 Y76.211 E.33931
G1 X105.483 Y76.827 E.03182
G1 X100.877 Y72.222 E.33626
G1 X100.726 Y72.687 E.02525
G1 X105.483 Y77.443 E.34729
G1 X105.483 Y78.06 E.03182
G1 X100.575 Y73.152 E.35833
G1 X100.424 Y73.617 E.02525
G1 X105.483 Y78.676 E.36936
G1 X105.483 Y79.292 E.03182
G1 X100.197 Y74.007 E.38593
G1 X99.905 Y74.331 E.02253
G1 X105.483 Y79.908 E.40725
G1 X105.483 Y80.524 E.03182
G1 X99.613 Y74.655 E.42856
G1 X99.321 Y74.979 E.02253
G1 X105.483 Y81.141 E.44988
G1 X105.483 Y81.757 E.03182
G1 X98.962 Y75.236 E.47615
G1 X98.535 Y75.426 E.0241
G1 X105.483 Y82.373 E.50728
G1 X105.483 Y82.989 E.03182
G1 X98.109 Y75.615 E.53842
G1 X97.682 Y75.805 E.0241
G1 X105.483 Y83.606 E.56955
G1 X105.483 Y84.222 E.03182
G1 X97.117 Y75.856 E.61084
G1 X96.501 Y75.856 E.03182
G1 X105.483 Y84.838 E.65584
G1 X105.483 Y85.454 E.03182
G1 X95.558 Y75.53 E.72463
; WIPE_START
G1 X96.973 Y76.944 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X97.678 Y69.345 Z.7 F15000
G1 X97.81 Y67.922 Z.7
M73 P26 R30
G1 Z.3
G1 E.8 F1800
G1 F3000
M204 S250
G1 X87.894 Y58.006 E.72398
G1 X87.894 Y58.623 E.03182
G1 X96.773 Y67.501 E.64825
G1 X96.689 Y67.483 E.00443
G1 X96.235 Y67.579 E.02395
G1 X87.894 Y59.239 E.60899
G1 X87.894 Y59.855 E.03182
G1 X95.727 Y67.687 E.57189
G1 X95.218 Y67.795 E.02682
G1 X87.894 Y60.471 E.53478
G1 X87.894 Y61.087 E.03182
G1 X94.787 Y67.98 E.50325
G1 X94.43 Y68.239 E.02278
G1 X87.894 Y61.704 E.47719
G1 X87.894 Y62.32 E.03182
G1 X94.073 Y68.498 E.45113
G1 X93.716 Y68.758 E.02278
G1 X87.894 Y62.936 E.42507
G1 X87.894 Y63.552 E.03182
G1 X93.427 Y69.085 E.40395
G1 X93.201 Y69.475 E.02329
G1 X87.894 Y64.169 E.38748
G1 X87.894 Y64.785 E.03182
G1 X92.976 Y69.866 E.37101
G1 X92.75 Y70.257 E.02329
G1 X87.894 Y65.401 E.35454
G1 X87.894 Y66.017 E.03182
G1 X92.627 Y70.75 E.34555
G1 X92.568 Y71.307 E.02895
G1 X87.894 Y66.634 E.34127
G1 X87.894 Y67.25 E.03182
G1 X92.51 Y71.865 E.33699
G1 X92.479 Y72.158 E.01521
G1 X92.62 Y72.591 E.02351
G1 X87.894 Y67.866 E.34502
G1 X87.894 Y68.482 E.03182
G1 X92.916 Y73.504 E.36668
G1 X93.023 Y73.832 E.01781
G1 X94.2 Y75.14 E.09088
G1 X94.834 Y75.422 E.03583
G1 X105.483 Y86.071 E.77749
G1 X105.483 Y86.687 E.03182
G1 X87.894 Y69.098 E1.28424
G1 X87.894 Y69.715 E.03182
G1 X105.483 Y87.303 E1.28424
G1 X105.483 Y87.919 E.03182
G1 X87.894 Y70.331 E1.28424
G1 X87.894 Y70.947 E.03182
G1 X105.483 Y88.535 E1.28424
G1 X105.483 Y89.152 E.03182
G1 X87.894 Y71.563 E1.28424
G1 X87.894 Y72.18 E.03182
G1 X105.483 Y89.768 E1.28424
G1 X105.483 Y90.384 E.03182
G1 X87.894 Y72.796 E1.28424
G1 X87.894 Y73.412 E.03182
G1 X105.483 Y91 E1.28424
G1 X105.483 Y91.617 E.03182
G1 X87.894 Y74.028 E1.28424
G1 X87.894 Y74.645 E.03182
G1 X105.483 Y92.233 E1.28424
G1 X105.483 Y92.849 E.03182
G1 X87.894 Y75.261 E1.28424
G1 X87.894 Y75.877 E.03182
G1 X105.483 Y93.465 E1.28424
G1 X105.483 Y94.082 E.03182
G1 X87.894 Y76.493 E1.28424
G1 X87.894 Y77.109 E.03182
G1 X105.483 Y94.698 E1.28424
G1 X105.483 Y95.314 E.03182
G1 X87.894 Y77.726 E1.28424
G1 X87.894 Y78.342 E.03182
G1 X105.483 Y95.93 E1.28424
G1 X105.483 Y96.546 E.03182
G1 X87.894 Y78.958 E1.28424
G1 X87.894 Y79.574 E.03182
M73 P27 R30
G1 X105.483 Y97.163 E1.28424
G1 X105.483 Y97.779 E.03182
G1 X87.894 Y80.191 E1.28424
G1 X87.894 Y80.807 E.03182
G1 X105.483 Y98.395 E1.28424
G1 X105.483 Y99.011 E.03182
G1 X87.894 Y81.423 E1.28424
G1 X87.894 Y82.039 E.03182
G1 X105.483 Y99.628 E1.28424
G1 X105.483 Y100.244 E.03182
G1 X87.894 Y82.656 E1.28424
G1 X87.894 Y83.272 E.03182
G1 X105.483 Y100.86 E1.28424
G1 X105.483 Y101.476 E.03182
G1 X87.894 Y83.888 E1.28424
G1 X87.894 Y84.504 E.03182
G1 X105.483 Y102.092 E1.28424
G1 X105.483 Y102.709 E.03182
G1 X87.894 Y85.12 E1.28424
G1 X87.894 Y85.737 E.03182
G1 X105.483 Y103.325 E1.28424
G1 X105.483 Y103.941 E.03182
G1 X87.894 Y86.353 E1.28424
G1 X87.894 Y86.969 E.03182
G1 X105.483 Y104.557 E1.28424
G1 X105.483 Y105.174 E.03182
G1 X87.894 Y87.585 E1.28424
G1 X87.894 Y88.202 E.03182
G1 X105.483 Y105.79 E1.28424
G1 X105.483 Y106.406 E.03182
G1 X87.894 Y88.818 E1.28424
G1 X87.894 Y89.434 E.03182
G1 X105.483 Y107.022 E1.28424
G1 X105.483 Y107.639 E.03182
G1 X87.894 Y90.05 E1.28424
G1 X87.894 Y90.667 E.03182
G1 X105.483 Y108.255 E1.28424
G1 X105.483 Y108.871 E.03182
G1 X87.894 Y91.283 E1.28424
G1 X87.894 Y91.899 E.03182
G1 X105.483 Y109.487 E1.28424
G1 X105.483 Y110.103 E.03182
G1 X87.894 Y92.515 E1.28424
G1 X87.894 Y93.131 E.03182
G1 X105.483 Y110.72 E1.28424
G1 X105.483 Y111.336 E.03182
G1 X87.894 Y93.748 E1.28424
G1 X87.894 Y94.364 E.03182
G1 X105.483 Y111.952 E1.28424
G1 X105.483 Y112.568 E.03182
G1 X87.894 Y94.98 E1.28424
G1 X87.894 Y95.596 E.03182
G1 X105.483 Y113.185 E1.28424
G1 X105.483 Y113.801 E.03182
G1 X87.894 Y96.213 E1.28424
G1 X87.894 Y96.829 E.03182
G1 X105.483 Y114.417 E1.28424
G1 X105.483 Y115.033 E.03182
G1 X87.894 Y97.445 E1.28424
G1 X87.894 Y98.061 E.03182
G1 X105.483 Y115.65 E1.28424
G1 X105.483 Y116.266 E.03182
G1 X87.894 Y98.677 E1.28424
G1 X87.894 Y99.294 E.03182
G1 X105.483 Y116.882 E1.28424
G1 X105.483 Y117.498 E.03182
G1 X87.894 Y99.91 E1.28424
G1 X87.894 Y100.526 E.03182
G1 X105.483 Y118.114 E1.28424
G1 X105.483 Y118.731 E.03182
G1 X87.894 Y101.142 E1.28424
G1 X87.894 Y101.759 E.03182
G1 X105.483 Y119.347 E1.28424
G1 X105.483 Y119.963 E.03182
G1 X100.423 Y114.904 E.36943
G1 X99.834 Y113.883 E.06083
G1 X98.41 Y112.849 E.09088
G1 X98.357 Y112.838 E.0028
G1 X87.894 Y102.375 E.76395
G1 X87.894 Y102.991 E.03182
G1 X97.574 Y112.671 E.70681
G1 X96.792 Y112.505 E.04131
G1 X87.894 Y103.607 E.64967
G1 X87.894 Y104.224 E.03182
G1 X96.247 Y112.577 E.60991
M73 P28 R30
G1 X95.739 Y112.685 E.02683
G1 X87.894 Y104.84 E.57281
G1 X87.894 Y105.456 E.03182
G1 X95.231 Y112.793 E.5357
G1 X94.967 Y112.849 E.01394
G1 X94.795 Y112.973 E.01094
G1 X87.894 Y106.072 E.5039
G1 X87.894 Y106.688 E.03182
G1 X94.439 Y113.233 E.47783
G1 X94.082 Y113.492 E.02278
G1 X87.894 Y107.305 E.45177
G1 X87.894 Y107.921 E.03182
G1 X93.725 Y113.751 E.42571
G2 X93.432 Y114.075 I.217 J.49 E.0232
G1 X87.894 Y108.537 E.40436
G1 X87.894 Y109.153 E.03182
G1 X93.207 Y114.466 E.38789
G1 X92.981 Y114.856 E.02329
G1 X87.894 Y109.77 E.37142
G1 X87.894 Y110.386 E.03182
G1 X92.756 Y115.247 E.35495
G1 X92.663 Y115.408 E.00958
G1 X92.628 Y115.736 E.01705
G1 X87.894 Y111.002 E.34566
G1 X87.894 Y111.618 E.03182
G1 X92.57 Y116.294 E.34138
G1 X92.511 Y116.851 E.02895
G1 X87.894 Y112.235 E.3371
G1 X87.894 Y112.851 E.03182
G1 X92.918 Y117.874 E.36678
; WIPE_START
G1 X91.503 Y116.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X99.104 Y115.769 Z.7 F15000
G1 X100.541 Y115.638 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3000
M204 S250
G1 X105.483 Y120.579 E.3608
G1 X105.483 Y121.196 E.03182
G1 X100.834 Y116.547 E.33944
G1 X100.898 Y117.158 E.03174
G1 X100.881 Y117.21 E.00283
G1 X105.483 Y121.812 E.33598
G1 X105.483 Y122.428 E.03182
G1 X100.73 Y117.675 E.34702
G1 X100.579 Y118.141 E.02525
G1 X105.483 Y123.044 E.35805
G1 X105.483 Y123.661 E.03182
G1 X100.428 Y118.606 E.36909
G1 X100.354 Y118.832 E.01229
G1 X100.204 Y118.998 E.01156
G1 X105.483 Y124.277 E.3854
G1 X105.483 Y124.893 E.03182
G1 X99.912 Y119.323 E.40672
G1 X99.62 Y119.647 E.02253
G1 X105.483 Y125.509 E.42804
G1 X105.483 Y126.125 E.03182
G1 X99.328 Y119.971 E.44936
G1 X99.176 Y120.14 E.01173
G1 X98.972 Y120.231 E.01155
G1 X105.483 Y126.742 E.47538
G1 X105.483 Y127.358 E.03182
G1 X98.546 Y120.421 E.50651
G1 X98.119 Y120.611 E.0241
G1 X105.483 Y127.974 E.53764
G1 X105.483 Y128.59 E.03182
G1 X97.693 Y120.801 E.56878
G1 X97.569 Y120.856 E.00703
G1 X97.132 Y120.856 E.02254
G1 X105.483 Y129.207 E.60973
G1 X105.483 Y129.823 E.03182
G1 X96.516 Y120.856 E.65473
G1 X95.9 Y120.856 E.03182
G1 X105.483 Y130.439 E.69972
G1 X105.483 Y131.055 E.03182
G1 X94.862 Y120.435 E.77548
G1 X94.2 Y120.14 E.03739
G1 X93.023 Y118.832 E.09087
G1 X92.909 Y118.481 E.01903
G1 X87.894 Y113.467 E.36614
G1 X87.894 Y114.083 E.03182
G1 X105.483 Y131.671 E1.28424
G1 X105.483 Y132.288 E.03182
G1 X87.894 Y114.699 E1.28424
G1 X87.894 Y115.316 E.03182
G1 X105.483 Y132.904 E1.28424
G1 X105.483 Y133.52 E.03182
G1 X87.894 Y115.932 E1.28424
G1 X87.894 Y116.548 E.03182
G1 X105.483 Y134.136 E1.28424
G1 X105.483 Y134.753 E.03182
G1 X87.894 Y117.164 E1.28424
G1 X87.894 Y117.781 E.03182
G1 X105.483 Y135.369 E1.28424
G1 X105.483 Y135.985 E.03182
M73 P28 R29
G1 X87.894 Y118.397 E1.28424
G1 X87.894 Y119.013 E.03182
G1 X105.483 Y136.601 E1.28424
G1 X105.483 Y137.218 E.03182
G1 X87.894 Y119.629 E1.28424
G1 X87.894 Y120.246 E.03182
G1 X105.483 Y137.834 E1.28424
G1 X105.483 Y138.45 E.03182
G1 X87.894 Y120.862 E1.28424
G1 X87.894 Y121.478 E.03182
G1 X105.483 Y139.066 E1.28424
G1 X105.483 Y139.682 E.03182
G1 X87.894 Y122.094 E1.28424
G1 X87.894 Y122.71 E.03182
G1 X105.483 Y140.299 E1.28424
G1 X105.483 Y140.915 E.03182
G1 X87.894 Y123.327 E1.28424
G1 X87.894 Y123.943 E.03182
G1 X105.483 Y141.531 E1.28424
G1 X105.483 Y142.147 E.03182
G1 X87.894 Y124.559 E1.28424
G1 X87.894 Y125.175 E.03182
G1 X105.483 Y142.764 E1.28424
G1 X105.483 Y143.38 E.03182
G1 X87.894 Y125.792 E1.28424
G1 X87.894 Y126.408 E.03182
G1 X105.483 Y143.996 E1.28424
G1 X105.483 Y144.612 E.03182
G1 X87.894 Y127.024 E1.28424
M73 P29 R29
G1 X87.894 Y127.64 E.03182
G1 X105.483 Y145.229 E1.28424
G1 X105.483 Y145.845 E.03182
G1 X87.894 Y128.256 E1.28424
G1 X87.894 Y128.873 E.03182
G1 X105.483 Y146.461 E1.28424
G1 X105.483 Y147.077 E.03182
G1 X87.894 Y129.489 E1.28424
G1 X87.894 Y130.105 E.03182
G1 X105.483 Y147.693 E1.28424
G1 X105.483 Y148.31 E.03182
G1 X87.894 Y130.721 E1.28424
G1 X87.894 Y131.338 E.03182
G1 X105.483 Y148.926 E1.28424
G1 X105.483 Y149.542 E.03182
G1 X87.894 Y131.954 E1.28424
G1 X87.894 Y132.57 E.03182
G1 X105.483 Y150.158 E1.28424
G1 X105.483 Y150.775 E.03182
G1 X87.894 Y133.186 E1.28424
G1 X87.894 Y133.803 E.03182
G1 X105.483 Y151.391 E1.28424
G1 X105.483 Y152.007 E.03182
G1 X87.894 Y134.419 E1.28424
G1 X87.894 Y135.035 E.03182
G1 X105.483 Y152.623 E1.28424
G1 X105.483 Y153.24 E.03182
G1 X87.894 Y135.651 E1.28424
G1 X87.894 Y136.267 E.03182
G1 X105.483 Y153.856 E1.28424
G1 X105.483 Y154.472 E.03182
G1 X87.894 Y136.884 E1.28424
G1 X87.894 Y137.5 E.03182
G1 X105.483 Y155.088 E1.28424
G1 X105.483 Y155.704 E.03182
G1 X87.894 Y138.116 E1.28424
G1 X87.894 Y138.732 E.03182
G1 X105.483 Y156.321 E1.28424
G1 X105.483 Y156.937 E.03182
G1 X87.894 Y139.349 E1.28424
G1 X87.894 Y139.965 E.03182
G1 X105.483 Y157.553 E1.28424
G1 X105.483 Y158.169 E.03182
G1 X87.894 Y140.581 E1.28424
G1 X87.894 Y141.197 E.03182
G1 X105.483 Y158.786 E1.28424
G1 X105.483 Y159.402 E.03182
G1 X87.894 Y141.814 E1.28424
G1 X87.894 Y142.43 E.03182
G1 X105.483 Y160.018 E1.28424
G1 X105.483 Y160.634 E.03182
G1 X87.894 Y143.046 E1.28424
G1 X87.894 Y143.662 E.03182
G1 X105.483 Y161.251 E1.28424
G1 X105.483 Y161.867 E.03182
G1 X87.894 Y144.278 E1.28424
G1 X87.894 Y144.895 E.03182
G1 X105.483 Y162.483 E1.28424
G1 X105.483 Y163.099 E.03182
G1 X87.894 Y145.511 E1.28424
G1 X87.894 Y146.127 E.03182
G1 X105.483 Y163.715 E1.28424
G1 X105.483 Y164.332 E.03182
G1 X87.894 Y146.743 E1.28424
G1 X87.894 Y147.36 E.03182
G1 X98.376 Y157.842 E.76536
G1 X98.41 Y157.849 E.00178
G1 X99.834 Y158.883 E.09087
G1 X100.402 Y159.868 E.05867
G1 X105.483 Y164.948 E.37095
G1 X105.483 Y165.564 E.03182
G1 X100.76 Y160.841 E.34485
G1 X100.832 Y161.53 E.03575
G1 X105.483 Y166.18 E.33957
G1 X105.483 Y166.797 E.03182
G1 X100.885 Y162.199 E.33571
G1 X100.734 Y162.664 E.02525
G1 X105.483 Y167.413 E.34674
G1 X105.483 Y168.029 E.03182
G1 X100.583 Y163.129 E.35778
M73 P30 R29
G1 X100.432 Y163.594 E.02525
G1 X105.483 Y168.645 E.36881
G1 X105.483 Y169.261 E.03182
G1 X100.212 Y163.99 E.38487
G1 X99.92 Y164.315 E.02253
G1 X105.483 Y169.878 E.40619
G1 X105.483 Y170.494 E.03182
G1 X99.628 Y164.639 E.42751
G1 X99.336 Y164.963 E.02253
G1 X105.483 Y171.11 E.44883
G1 X105.483 Y171.726 E.03182
G1 X98.983 Y165.226 E.47461
G1 X98.556 Y165.416 E.0241
G1 X105.483 Y172.343 E.50574
G1 X105.483 Y172.959 E.03182
G1 X98.13 Y165.606 E.53687
G1 X97.703 Y165.796 E.0241
G1 X105.483 Y173.575 E.56801
G1 X105.483 Y174.191 E.03182
G1 X97.147 Y165.856 E.60862
G1 X96.531 Y165.856 E.03182
G1 X105.483 Y174.808 E.65361
G1 X105.483 Y175.424 E.03182
G1 X95.613 Y165.555 E.72061
; WIPE_START
G1 X97.028 Y166.969 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X97.718 Y159.368 Z.7 F15000
G1 X97.848 Y157.93 Z.7
G1 Z.3
G1 E.8 F1800
G1 F3000
M204 S250
G1 X87.894 Y147.976 E.7268
G1 X87.894 Y148.592 E.03182
G1 X96.811 Y157.509 E.65108
G1 X96.689 Y157.483 E.00648
G1 X96.26 Y157.574 E.02262
G1 X87.894 Y149.208 E.61083
G1 X87.894 Y149.825 E.03182
G1 X95.752 Y157.682 E.57372
G1 X95.244 Y157.79 E.02683
G1 X87.894 Y150.441 E.53662
G1 X87.894 Y151.057 E.03182
G1 X94.804 Y157.967 E.50454
G1 X94.447 Y158.226 E.02278
G1 X87.894 Y151.673 E.47848
G1 X87.894 Y152.289 E.03182
G1 X94.09 Y158.486 E.45242
G1 X93.734 Y158.745 E.02278
G1 X87.894 Y152.906 E.42636
G1 X87.894 Y153.522 E.03182
G1 X93.438 Y159.065 E.40477
G1 X93.212 Y159.456 E.02329
G1 X87.894 Y154.138 E.3883
G1 X87.894 Y154.754 E.03182
G1 X92.987 Y159.847 E.37183
G1 X92.761 Y160.237 E.02329
G1 X87.894 Y155.371 E.35536
G1 X87.894 Y155.987 E.03182
G1 X92.63 Y160.722 E.34576
G1 X92.571 Y161.28 E.02895
G1 X87.894 Y156.603 E.34149
G1 X87.894 Y157.219 E.03182
G1 X92.513 Y161.837 E.33721
G1 X92.479 Y162.158 E.01665
G1 X92.605 Y162.546 E.02106
G1 X87.894 Y157.836 E.34395
G1 X87.894 Y158.452 E.03182
G1 X92.901 Y163.459 E.3656
G1 X93.023 Y163.832 E.02026
G1 X94.2 Y165.14 E.09088
G1 X94.889 Y165.447 E.03894
G1 X105.483 Y176.04 E.77348
G1 X105.483 Y176.656 E.03182
G1 X87.894 Y159.068 E1.28424
G1 X87.894 Y159.684 E.03182
G1 X105.483 Y177.272 E1.28424
G1 X105.483 Y177.889 E.03182
G1 X87.894 Y160.3 E1.28424
G1 X87.894 Y160.917 E.03182
G1 X105.483 Y178.505 E1.28424
G1 X105.483 Y179.121 E.03182
G1 X87.894 Y161.533 E1.28424
G1 X87.894 Y162.149 E.03182
G1 X105.483 Y179.737 E1.28424
G1 X105.483 Y180.354 E.03182
G1 X87.894 Y162.765 E1.28424
G1 X87.894 Y163.382 E.03182
G1 X105.023 Y180.51 E1.25065
G1 X104.406 Y180.51 E.03182
G1 X87.894 Y163.998 E1.20565
G1 X87.894 Y164.614 E.03182
G1 X103.79 Y180.51 E1.16066
G1 X103.174 Y180.51 E.03182
G1 X87.894 Y165.23 E1.11566
G1 X87.894 Y165.846 E.03182
G1 X102.558 Y180.51 E1.07067
G1 X101.941 Y180.51 E.03182
G1 X87.894 Y166.463 E1.02567
G1 X87.894 Y167.079 E.03182
G1 X101.325 Y180.51 E.98068
G1 X100.709 Y180.51 E.03182
G1 X87.894 Y167.695 E.93568
G1 X87.894 Y168.311 E.03182
G1 X100.093 Y180.51 E.89069
G1 X99.477 Y180.51 E.03182
G1 X87.894 Y168.928 E.84569
G1 X87.894 Y169.544 E.03182
G1 X98.86 Y180.51 E.8007
G1 X98.244 Y180.51 E.03182
G1 X87.894 Y170.16 E.7557
G1 X87.894 Y170.776 E.03182
G1 X97.628 Y180.51 E.71071
G1 X97.012 Y180.51 E.03182
G1 X87.894 Y171.393 E.66571
G1 X87.894 Y172.009 E.03182
G1 X96.395 Y180.51 E.62072
G1 X95.779 Y180.51 E.03182
G1 X87.894 Y172.625 E.57572
G1 X87.894 Y173.241 E.03182
G1 X95.163 Y180.51 E.53073
G1 X94.547 Y180.51 E.03182
G1 X87.894 Y173.857 E.48573
M73 P31 R29
G1 X87.894 Y174.474 E.03182
G1 X93.93 Y180.51 E.44074
G1 X93.314 Y180.51 E.03182
G1 X87.894 Y175.09 E.39574
G1 X87.894 Y175.706 E.03182
G1 X92.698 Y180.51 E.35075
G1 X92.082 Y180.51 E.03182
G1 X87.894 Y176.322 E.30575
G1 X87.894 Y176.939 E.03182
G1 X91.466 Y180.51 E.26076
G1 X90.849 Y180.51 E.03182
G1 X87.894 Y177.555 E.21576
G1 X87.894 Y178.171 E.03182
G1 X90.233 Y180.51 E.17077
G1 X89.617 Y180.51 E.03182
G1 X87.894 Y178.787 E.12577
M73 P31 R28
G1 X87.894 Y179.404 E.03182
G1 X89.001 Y180.51 E.08078
G1 X88.384 Y180.51 E.03182
G1 X87.698 Y179.824 E.05009
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X88.384 Y180.51 E-.36869
G1 X89.001 Y180.51 E-.23417
G1 X88.708 Y180.217 E-.15714
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 2/20
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M104 S245 ; set nozzle temperature
M204 S5000
G17
G3 Z.7 I1.217 J0 P1  F15000
; object ids of layer 2 start: 138,178
M624 AwAAAAAAAAA=
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
; object ids of this layer2 end: 138,178
M625
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X199.603 Y66.256
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X199.995 Y66.256 E.01261
G1 X199.995 Y91.256 E.80391
G1 X200.791 Y91.256 E.02559
G1 X200.791 Y66.256 E.80391
G1 X206.995 Y66.256 E.1995
G1 X206.995 Y172.46 E3.41514
G1 X155.791 Y172.46 E1.64654
G1 X155.791 Y66.256 E3.41514
G1 X161.995 Y66.256 E.1995
G1 X161.995 Y91.256 E.80391
G1 X162.791 Y91.256 E.02559
G1 X162.791 Y66.256 E.80391
G1 X199.543 Y66.256 E1.18181
M204 S250
G1 X199.603 Y66.648 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X199.603 Y91.648 E.74466
G1 X201.183 Y91.648 E.04706
G1 X201.183 Y66.648 E.74466
G1 X206.603 Y66.648 E.16144
G1 X206.603 Y172.068 E3.1401
G1 X156.183 Y172.068 E1.50184
G1 X156.183 Y66.648 E3.1401
G1 X161.603 Y66.648 E.16144
G1 X161.603 Y91.648 E.74466
G1 X163.183 Y91.648 E.04706
G1 X163.183 Y66.648 E.74466
G1 X199.543 Y66.648 E1.08304
; WIPE_START
M204 S5000
G1 X199.548 Y68.648 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X199.603 Y65.46 Z.9 F15000
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X207.791 Y65.46 E.26329
G1 X207.791 Y172.769 E3.45068
G1 X154.995 Y172.769 E1.69772
G1 X154.995 Y65.46 E3.45068
G1 X199.543 Y65.46 E1.4325
; WIPE_START
G1 X201.543 Y65.46 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X201.969 Y73.08 Z.9 F15000
G1 X207.791 Y177.256 Z.9
G1 Z.5
G1 E.8 F1800
G1 F9000
G1 X154.995 Y177.256 E1.69772
G1 X154.995 Y176.925 E.01064
G1 X207.791 Y176.925 E1.69772
G1 X207.791 Y177.196 E.00871
M204 S250
G1 X208.183 Y177.648 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X154.603 Y177.648 E1.59597
G1 X154.603 Y65.068 E3.35337
G1 X208.183 Y65.068 E1.59597
G1 X208.183 Y177.588 E3.35159
; WIPE_START
M204 S5000
G1 X206.183 Y177.59 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.976 Y176.097 Z.9 F15000
G1 Z.5
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X207.37 Y176.702 E.02551
G1 X206.837 Y176.702
G1 X207.976 Y175.564 E.04797
G1 X207.976 Y175.03
G1 X206.304 Y176.702 E.07044
G1 X205.771 Y176.702
G1 X207.976 Y174.497 E.0929
G1 X207.976 Y173.964
G1 X205.237 Y176.702 E.11536
G1 X204.704 Y176.702
G1 X207.976 Y173.431 E.13783
G1 X207.882 Y172.992
G1 X204.171 Y176.702 E.15631
G1 X203.638 Y176.702
G1 X207.348 Y172.992 E.15631
G1 X206.815 Y172.992
G1 X203.104 Y176.702 E.15631
G1 X202.571 Y176.702
G1 X206.282 Y172.992 E.15631
G1 X205.749 Y172.992
G1 X202.038 Y176.702 E.15631
G1 X201.505 Y176.702
G1 X205.215 Y172.992 E.15631
G1 X204.682 Y172.992
M73 P32 R28
G1 X200.971 Y176.702 E.15631
G1 X200.438 Y176.702
G1 X204.149 Y172.992 E.15631
G1 X203.615 Y172.992
G1 X199.905 Y176.702 E.15631
G1 X199.372 Y176.702
G1 X203.082 Y172.992 E.15631
G1 X202.549 Y172.992
G1 X198.838 Y176.702 E.15631
G1 X198.305 Y176.702
G1 X202.016 Y172.992 E.15631
G1 X201.482 Y172.992
G1 X197.772 Y176.702 E.15631
G1 X197.239 Y176.702
G1 X200.949 Y172.992 E.15631
G1 X200.416 Y172.992
G1 X196.705 Y176.702 E.15631
G1 X196.172 Y176.702
G1 X199.883 Y172.992 E.15631
G1 X199.349 Y172.992
G1 X195.639 Y176.702 E.15631
G1 X195.105 Y176.702
G1 X198.816 Y172.992 E.15631
G1 X198.283 Y172.992
G1 X194.572 Y176.702 E.15631
G1 X194.039 Y176.702
G1 X197.75 Y172.992 E.15631
G1 X197.216 Y172.992
G1 X193.506 Y176.702 E.15631
G1 X192.972 Y176.702
G1 X196.683 Y172.992 E.15631
G1 X196.15 Y172.992
G1 X192.439 Y176.702 E.15631
G1 X191.906 Y176.702
G1 X195.617 Y172.992 E.15631
G1 X195.083 Y172.992
G1 X191.373 Y176.702 E.15631
G1 X190.839 Y176.702
G1 X194.55 Y172.992 E.15631
G1 X194.017 Y172.992
G1 X190.306 Y176.702 E.15631
G1 X189.773 Y176.702
G1 X193.484 Y172.992 E.15631
G1 X192.95 Y172.992
G1 X189.24 Y176.702 E.15631
G1 X188.706 Y176.702
G1 X192.417 Y172.992 E.15631
G1 X191.884 Y172.992
G1 X188.173 Y176.702 E.15631
G1 X187.64 Y176.702
G1 X191.351 Y172.992 E.15631
G1 X190.817 Y172.992
G1 X187.107 Y176.702 E.15631
G1 X186.573 Y176.702
G1 X190.284 Y172.992 E.15631
G1 X189.751 Y172.992
G1 X186.04 Y176.702 E.15631
G1 X185.507 Y176.702
G1 X189.218 Y172.992 E.15631
G1 X188.684 Y172.992
G1 X184.974 Y176.702 E.15631
G1 X184.44 Y176.702
G1 X188.151 Y172.992 E.15631
G1 X187.618 Y172.992
G1 X183.907 Y176.702 E.15631
G1 X183.374 Y176.702
G1 X187.085 Y172.992 E.15631
G1 X186.551 Y172.992
G1 X182.841 Y176.702 E.15631
G1 X182.307 Y176.702
G1 X186.018 Y172.992 E.15631
G1 X185.485 Y172.992
G1 X181.774 Y176.702 E.15631
G1 X181.241 Y176.702
G1 X184.951 Y172.992 E.15631
G1 X184.418 Y172.992
G1 X180.708 Y176.702 E.15631
G1 X180.174 Y176.702
G1 X183.885 Y172.992 E.15631
G1 X183.352 Y172.992
G1 X179.641 Y176.702 E.15631
G1 X179.108 Y176.702
G1 X182.818 Y172.992 E.15631
G1 X182.285 Y172.992
G1 X178.574 Y176.702 E.15631
G1 X178.041 Y176.702
G1 X181.752 Y172.992 E.15631
G1 X181.219 Y172.992
G1 X177.508 Y176.702 E.15631
G1 X176.975 Y176.702
G1 X180.685 Y172.992 E.15631
G1 X180.152 Y172.992
G1 X176.441 Y176.702 E.15631
G1 X175.908 Y176.702
G1 X179.619 Y172.992 E.15631
G1 X179.086 Y172.992
G1 X175.375 Y176.702 E.15631
G1 X174.842 Y176.702
G1 X178.552 Y172.992 E.15631
G1 X178.019 Y172.992
G1 X174.308 Y176.702 E.15631
G1 X173.775 Y176.702
G1 X177.486 Y172.992 E.15631
G1 X176.953 Y172.992
G1 X173.242 Y176.702 E.15631
G1 X172.709 Y176.702
G1 X176.419 Y172.992 E.15631
G1 X175.886 Y172.992
G1 X172.175 Y176.702 E.15631
G1 X171.642 Y176.702
G1 X175.353 Y172.992 E.15631
G1 X174.82 Y172.992
G1 X171.109 Y176.702 E.15631
G1 X170.576 Y176.702
G1 X174.286 Y172.992 E.15631
G1 X173.753 Y172.992
G1 X170.042 Y176.702 E.15631
G1 X169.509 Y176.702
G1 X173.22 Y172.992 E.15631
G1 X172.687 Y172.992
G1 X168.976 Y176.702 E.15631
G1 X168.443 Y176.702
G1 X172.153 Y172.992 E.15631
G1 X171.62 Y172.992
G1 X167.909 Y176.702 E.15631
G1 X167.376 Y176.702
G1 X171.087 Y172.992 E.15631
G1 X170.554 Y172.992
G1 X166.843 Y176.702 E.15631
G1 X166.31 Y176.702
G1 X170.02 Y172.992 E.15631
G1 X169.487 Y172.992
G1 X165.776 Y176.702 E.15631
G1 X165.243 Y176.702
G1 X168.954 Y172.992 E.15631
G1 X168.42 Y172.992
G1 X164.71 Y176.702 E.15631
G1 X164.177 Y176.702
G1 X167.887 Y172.992 E.15631
G1 X167.354 Y172.992
G1 X163.643 Y176.702 E.15631
G1 X163.11 Y176.702
G1 X166.821 Y172.992 E.15631
G1 X166.287 Y172.992
G1 X162.577 Y176.702 E.15631
G1 X162.044 Y176.702
G1 X165.754 Y172.992 E.15631
G1 X165.221 Y172.992
G1 X161.51 Y176.702 E.15631
G1 X160.977 Y176.702
G1 X164.688 Y172.992 E.15631
G1 X164.154 Y172.992
G1 X160.444 Y176.702 E.15631
G1 X159.91 Y176.702
G1 X163.621 Y172.992 E.15631
G1 X163.088 Y172.992
G1 X159.377 Y176.702 E.15631
G1 X158.844 Y176.702
G1 X162.555 Y172.992 E.15631
G1 X162.021 Y172.992
G1 X158.311 Y176.702 E.15631
G1 X157.777 Y176.702
G1 X161.488 Y172.992 E.15631
G1 X160.955 Y172.992
G1 X157.244 Y176.702 E.15631
G1 X156.711 Y176.702
G1 X160.422 Y172.992 E.15631
G1 X159.888 Y172.992
G1 X156.178 Y176.702 E.15631
G1 X155.644 Y176.702
G1 X159.355 Y172.992 E.15631
G1 X158.822 Y172.992
G1 X155.111 Y176.702 E.15631
G1 X154.811 Y176.47
G1 X158.289 Y172.992 E.1465
G1 X157.755 Y172.992
G1 X154.811 Y175.936 E.12404
G1 X154.811 Y175.403
G1 X157.222 Y172.992 E.10158
G1 X156.689 Y172.992
G1 X154.811 Y174.87 E.07911
G1 X154.811 Y174.337
G1 X156.156 Y172.992 E.05665
G1 X155.622 Y172.992
G1 X154.811 Y173.803 E.03419
; WIPE_START
M204 S5000
G1 X155.622 Y172.992 E-.43614
G1 X156.156 Y172.992 E-.20264
G1 X155.93 Y173.217 E-.12122
; WIPE_END
G1 E-.04 F1800
G1 X155.393 Y172.566 Z.9 F15000
G1 Z.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.393 Y66.052 E3.27129
; LINE_WIDTH: 0.470635
G1 X155.427 Y65.891 E.00556
G1 X155.507 Y65.874 E.00278
; LINE_WIDTH: 0.448395
G1 X155.588 Y65.858 E.00263
; LINE_WIDTH: 0.432083
G1 X162.199 Y65.858 E.20324
G1 X162.296 Y65.882 E.00308
; LINE_WIDTH: 0.50462
G1 X162.393 Y65.906 E.00365
; WIPE_START
G1 X162.296 Y65.882 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X162.326 Y73.514 Z.9 F15000
G1 X162.393 Y91.052 Z.9
G1 Z.5
G1 E.8 F1800
; LINE_WIDTH: 0.43172
G1 F7500
G1 X162.393 Y66.052 E.76781
; LINE_WIDTH: 0.490218
G1 X162.393 Y65.906 E.00515
G1 X162.491 Y65.882 E.00354
; LINE_WIDTH: 0.45602
G1 X162.588 Y65.858 E.00327
; LINE_WIDTH: 0.431785
G1 X200.199 Y65.858 E1.15532
G1 X200.296 Y65.882 E.00308
; LINE_WIDTH: 0.50462
G1 X200.393 Y65.906 E.00365
; WIPE_START
G1 X200.296 Y65.882 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.326 Y73.514 Z.9 F15000
G1 X200.393 Y91.052 Z.9
G1 Z.5
G1 E.8 F1800
; LINE_WIDTH: 0.43172
G1 F7500
G1 X200.393 Y66.052 E.76781
; LINE_WIDTH: 0.490218
G1 X200.393 Y65.906 E.00515
G1 X200.491 Y65.882 E.00354
; LINE_WIDTH: 0.45602
G1 X200.588 Y65.858 E.00327
; LINE_WIDTH: 0.43172
G1 X207.199 Y65.858 E.20305
; LINE_WIDTH: 0.470635
G1 X207.36 Y65.891 E.00556
G1 X207.377 Y65.972 E.00278
; LINE_WIDTH: 0.448395
G1 X207.393 Y66.052 E.00263
; LINE_WIDTH: 0.43172
G1 X207.393 Y172.566 E3.27129
; OBJECT_ID: 178
; WIPE_START
G1 X207.393 Y170.566 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X200.623 Y167.042 Z.9 F15000
G1 X99.414 Y114.363 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X100.127 Y115.598 E.04586
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X96.441 Y113.153 E.04022
G1 X96.688 Y113.1 E.00813
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.384 Y114.311 E.00055
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X96.523 Y113.536 E.03477
G1 X96.688 Y113.501 E.00505
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52888
G1 X99.809 Y116.327 E-.23112
; WIPE_END
G1 E-.04 F1800
G1 X99.356 Y108.708 Z.9 F15000
G1 X97.363 Y75.252 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P33 R28
G1 X95.937 Y75.252 E.04586
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X96.441 Y68.153 E.04022
G1 X96.688 Y68.1 E.00813
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04835
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.423 Y75.252 E.00055
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X96.523 Y68.536 E.03477
G1 X96.688 Y68.501 E.00505
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X95.753 Y82.24 Z.9 F15000
G1 X98.865 Y164.583 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.814 Y164.641 E.00248
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04834
G1 X96.441 Y158.153 E.04022
G1 X96.688 Y158.1 E.00813
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04834
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.905 Y164.539 E.04393
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X96.523 Y158.536 E.03477
G1 X96.688 Y158.501 E.00505
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X100.551 Y171.478 Z.9 F15000
G1 X106.086 Y181.114 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y52.318 E4.14161
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y181.054 E4.13968
M204 S250
G1 X106.478 Y181.506 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y51.926 E3.85975
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y181.446 E3.85796
; WIPE_START
M204 S5000
G1 X104.478 Y181.452 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.159 Y180.95 Z.9 F15000
G1 Z.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42093
G1 F4800
G1 X105.753 Y180.355 E.02511
G1 X105.753 Y179.821 E.01596
G1 X104.794 Y180.78 E.04052
G1 X104.259 Y180.78 E.01596
G1 X105.753 Y179.286 E.06309
G1 X105.753 Y178.752 E.01596
G1 X103.725 Y180.78 E.08567
G1 X103.19 Y180.78 E.01596
G1 X105.753 Y178.217 E.10824
G1 X105.753 Y177.683 E.01596
G1 X102.655 Y180.78 E.13082
G1 X102.121 Y180.78 E.01596
G1 X105.753 Y177.148 E.15339
G1 X105.753 Y176.613 E.01596
G1 X101.586 Y180.78 E.17597
G1 X101.052 Y180.78 E.01596
G1 X105.753 Y176.079 E.19854
G1 X105.753 Y175.544 E.01596
G1 X100.517 Y180.78 E.22112
G1 X99.982 Y180.78 E.01596
G1 X105.753 Y175.01 E.24369
G1 X105.753 Y174.475 E.01596
G1 X99.448 Y180.78 E.26627
G1 X98.913 Y180.78 E.01596
G1 X105.753 Y173.94 E.28884
G1 X105.753 Y173.406 E.01596
G1 X98.379 Y180.78 E.31141
G1 X97.844 Y180.78 E.01596
G1 X105.753 Y172.871 E.33399
G1 X105.753 Y172.337 E.01596
G1 X97.309 Y180.78 E.35656
G1 X96.775 Y180.78 E.01596
G1 X105.753 Y171.802 E.37914
G1 X105.753 Y171.267 E.01596
G1 X96.24 Y180.78 E.40171
G1 X95.706 Y180.78 E.01596
G1 X105.753 Y170.733 E.42429
G1 X105.753 Y170.198 E.01596
G1 X95.171 Y180.78 E.44686
G1 X94.637 Y180.78 E.01596
G1 X105.753 Y169.664 E.46944
G1 X105.753 Y169.129 E.01596
G1 X94.102 Y180.78 E.49201
G1 X93.567 Y180.78 E.01596
G1 X105.753 Y168.595 E.51459
G1 X105.753 Y168.06 E.01596
G1 X93.033 Y180.78 E.53716
G1 X92.498 Y180.78 E.01596
G1 X105.753 Y167.525 E.55974
G1 X105.753 Y166.991 E.01596
G1 X91.964 Y180.78 E.58231
G1 X91.429 Y180.78 E.01596
G1 X105.753 Y166.456 E.60489
G1 X105.753 Y165.922 E.01596
G1 X90.894 Y180.78 E.62746
G1 X90.36 Y180.78 E.01596
G1 X105.753 Y165.387 E.65004
G1 X105.753 Y164.852 E.01596
G1 X89.825 Y180.78 E.67261
G1 X89.291 Y180.78 E.01596
G1 X105.753 Y164.318 E.69519
G1 X105.753 Y163.783 E.01596
G1 X88.756 Y180.78 E.71776
G1 X88.221 Y180.78 E.01596
G1 X105.753 Y163.249 E.74034
G1 X105.753 Y162.714 E.01596
G1 X87.687 Y180.78 E.76291
G1 X87.624 Y180.78 E.00188
G1 X87.624 Y180.309 E.01408
G1 X105.753 Y162.18 E.76558
G1 X105.753 Y161.645 E.01596
G1 X87.624 Y179.774 E.76558
G1 X87.624 Y179.24 E.01596
G1 X105.753 Y161.11 E.76558
G1 X105.753 Y160.576 E.01596
G1 X87.624 Y178.705 E.76558
G1 X87.624 Y178.171 E.01596
G1 X105.753 Y160.041 E.76558
G1 X105.753 Y159.507 E.01596
G1 X87.624 Y177.636 E.76558
G1 X87.624 Y177.101 E.01596
G1 X105.753 Y158.972 E.76558
G1 X105.753 Y158.437 E.01596
G1 X87.624 Y176.567 E.76558
G1 X87.624 Y176.032 E.01596
G1 X98.52 Y165.136 E.46011
G1 X97.556 Y165.566 E.0315
G1 X87.624 Y175.498 E.41942
G1 X87.624 Y174.963 E.01596
G1 X97.001 Y165.585 E.396
G1 X96.467 Y165.585 E.01596
G1 X87.624 Y174.428 E.37342
G1 X87.624 Y173.894 E.01596
G1 X95.932 Y165.585 E.35085
G1 X95.866 Y165.585 E.00198
G1 X95.542 Y165.441 E.01059
G1 X87.624 Y173.359 E.33437
G1 X87.624 Y172.825 E.01596
G1 X95.172 Y165.276 E.31875
G1 X94.802 Y165.112 E.01209
G1 X87.624 Y172.29 E.30313
M73 P33 R27
G1 X87.624 Y171.755 E.01596
G1 X94.432 Y164.947 E.28751
G1 X94.363 Y164.916 E.00226
G1 X94.157 Y164.688 E.00919
G1 X87.624 Y171.221 E.27589
G1 X87.624 Y170.686 E.01596
G1 X93.904 Y164.406 E.2652
G1 X93.651 Y164.125 E.0113
G1 X87.624 Y170.152 E.2545
G1 X87.624 Y169.617 E.01596
G1 X93.397 Y163.844 E.24381
G3 X93.201 Y163.505 I.282 J-.39 E.01203
G1 X87.624 Y169.083 E.23552
G1 X87.624 Y168.548 E.01596
G1 X93.07 Y163.102 E.22998
G1 X92.939 Y162.698 E.01267
G1 X87.624 Y168.013 E.22445
G1 X87.624 Y167.479 E.01596
G1 X92.808 Y162.295 E.21891
G1 X92.754 Y162.129 E.0052
G1 X92.791 Y161.777 E.01057
G1 X87.624 Y166.944 E.2182
G1 X87.624 Y166.41 E.01596
G1 X92.854 Y161.18 E.22085
G1 X92.917 Y160.582 E.01794
G1 X87.624 Y165.875 E.2235
G1 X87.624 Y165.34 E.01596
G1 X105.753 Y147.211 E.76558
G1 X105.753 Y147.746 E.01596
G1 X95.483 Y158.016 E.43369
G1 X96.162 Y157.871 E.02072
G1 X105.753 Y148.28 E.40502
G1 X105.753 Y148.815 E.01596
G1 X96.787 Y157.781 E.37861
G1 X97.228 Y157.874 E.01346
G1 X105.753 Y149.349 E.35999
G1 X105.753 Y149.884 E.01596
G1 X97.669 Y157.968 E.34137
G1 X98.11 Y158.062 E.01346
G1 X105.753 Y150.419 E.32275
G1 X105.753 Y150.953 E.01596
G1 X98.476 Y158.231 E.30732
G1 X98.785 Y158.456 E.01143
G1 X105.753 Y151.488 E.29425
G1 X105.753 Y152.022 E.01596
G1 X99.095 Y158.681 E.28117
G1 X99.404 Y158.906 E.01143
G1 X105.753 Y152.557 E.2681
G1 X105.753 Y153.092 E.01596
G1 X99.683 Y159.162 E.25635
G1 X99.878 Y159.501 E.01169
G1 X105.753 Y153.626 E.24809
G1 X105.753 Y154.161 E.01596
G1 X100.074 Y159.84 E.23983
G1 X100.27 Y160.179 E.01169
G1 X105.753 Y154.695 E.23156
G1 X105.753 Y155.23 E.01596
G1 X100.455 Y160.528 E.22374
G1 X100.506 Y161.012 E.01452
G1 X105.753 Y155.764 E.2216
G1 X105.753 Y156.299 E.01596
G1 X100.556 Y161.496 E.21945
G1 X100.607 Y161.98 E.01452
G1 X105.753 Y156.834 E.2173
G1 X105.753 Y157.368 E.01596
G1 X100.445 Y162.676 E.22414
G1 X100.188 Y163.468 E.02486
G1 X105.923 Y157.733 E.24217
; WIPE_START
G1 X104.509 Y159.147 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.286 Y161.616 Z.9 F15000
G1 X87.454 Y164.976 Z.9
G1 Z.5
G1 E.8 F1800
G1 F4800
G1 X105.753 Y146.677 E.77274
G1 X105.753 Y146.142 E.01596
G1 X87.624 Y164.271 E.76558
G1 X87.624 Y163.737 E.01596
G1 X105.753 Y145.607 E.76558
G1 X105.753 Y145.073 E.01596
G1 X87.624 Y163.202 E.76558
G1 X87.624 Y162.668 E.01596
G1 X105.753 Y144.538 E.76558
G1 X105.753 Y144.004 E.01596
G1 X87.624 Y162.133 E.76558
G1 X87.624 Y161.598 E.01596
G1 X105.753 Y143.469 E.76558
G1 X105.753 Y142.934 E.01596
G1 X87.624 Y161.064 E.76558
G1 X87.624 Y160.529 E.01596
G1 X105.753 Y142.4 E.76558
G1 X105.753 Y141.865 E.01596
G1 X87.624 Y159.995 E.76558
G1 X87.624 Y159.46 E.01596
G1 X105.753 Y141.331 E.76558
G1 X105.753 Y140.796 E.01596
G1 X87.624 Y158.925 E.76558
G1 X87.624 Y158.391 E.01596
G1 X105.753 Y140.261 E.76558
G1 X105.753 Y139.727 E.01596
G1 X87.624 Y157.856 E.76558
M73 P34 R27
G1 X87.624 Y157.322 E.01596
G1 X105.753 Y139.192 E.76558
G1 X105.753 Y138.658 E.01596
G1 X87.624 Y156.787 E.76558
G1 X87.624 Y156.252 E.01596
G1 X105.753 Y138.123 E.76558
G1 X105.753 Y137.589 E.01596
G1 X87.624 Y155.718 E.76558
G1 X87.624 Y155.183 E.01596
G1 X105.753 Y137.054 E.76558
G1 X105.753 Y136.519 E.01596
G1 X87.624 Y154.649 E.76558
G1 X87.624 Y154.114 E.01596
G1 X105.753 Y135.985 E.76558
G1 X105.753 Y135.45 E.01596
G1 X87.624 Y153.58 E.76558
G1 X87.624 Y153.045 E.01596
G1 X105.753 Y134.916 E.76558
G1 X105.753 Y134.381 E.01596
G1 X87.624 Y152.51 E.76558
G1 X87.624 Y151.976 E.01596
G1 X105.753 Y133.846 E.76558
G1 X105.753 Y133.312 E.01596
G1 X87.624 Y151.441 E.76558
G1 X87.624 Y150.907 E.01596
G1 X105.753 Y132.777 E.76558
G1 X105.753 Y132.243 E.01596
G1 X87.624 Y150.372 E.76558
G1 X87.624 Y149.837 E.01596
G1 X105.753 Y131.708 E.76558
G1 X105.753 Y131.173 E.01596
G1 X87.624 Y149.303 E.76558
G1 X87.624 Y148.768 E.01596
G1 X105.753 Y130.639 E.76558
G1 X105.753 Y130.104 E.01596
G1 X87.624 Y148.234 E.76558
G1 X87.624 Y147.699 E.01596
G1 X105.753 Y129.57 E.76558
G1 X105.753 Y129.035 E.01596
G1 X87.624 Y147.165 E.76558
G1 X87.624 Y146.63 E.01596
G1 X105.753 Y128.501 E.76558
G1 X105.753 Y127.966 E.01596
G1 X87.624 Y146.095 E.76558
G1 X87.624 Y145.561 E.01596
G1 X105.753 Y127.431 E.76558
G1 X105.753 Y126.897 E.01596
G1 X87.624 Y145.026 E.76558
G1 X87.624 Y144.492 E.01596
G1 X105.753 Y126.362 E.76558
G1 X105.753 Y125.828 E.01596
G1 X87.624 Y143.957 E.76558
G1 X87.624 Y143.422 E.01596
G1 X105.753 Y125.293 E.76558
G1 X105.753 Y124.758 E.01596
G1 X87.624 Y142.888 E.76558
G1 X87.624 Y142.353 E.01596
G1 X105.753 Y124.224 E.76558
G1 X105.753 Y123.689 E.01596
G1 X87.624 Y141.819 E.76558
G1 X87.624 Y141.284 E.01596
G1 X105.753 Y123.155 E.76558
G1 X105.753 Y122.62 E.01596
G1 X87.624 Y140.749 E.76558
G1 X87.624 Y140.215 E.01596
G1 X105.753 Y122.086 E.76558
G1 X105.753 Y121.551 E.01596
G1 X87.624 Y139.68 E.76558
G1 X87.624 Y139.146 E.01596
G1 X105.753 Y121.016 E.76558
G1 X105.753 Y120.482 E.01596
G1 X87.624 Y138.611 E.76558
G1 X87.624 Y138.077 E.01596
G1 X105.753 Y119.947 E.76558
G1 X105.753 Y119.413 E.01596
G1 X87.624 Y137.542 E.76558
G1 X87.624 Y137.007 E.01596
G1 X105.753 Y118.878 E.76558
G1 X105.753 Y118.343 E.01596
G1 X87.624 Y136.473 E.76558
G1 X87.624 Y135.938 E.01596
G1 X105.753 Y117.809 E.76558
G1 X105.753 Y117.274 E.01596
G1 X87.624 Y135.404 E.76558
G1 X87.624 Y134.869 E.01596
G1 X105.753 Y116.74 E.76558
G1 X105.753 Y116.205 E.01596
G1 X87.624 Y134.334 E.76558
G1 X87.624 Y133.8 E.01596
G1 X105.753 Y115.67 E.76558
G1 X105.753 Y115.136 E.01596
G1 X87.624 Y133.265 E.76558
G1 X87.624 Y132.731 E.01596
G1 X105.753 Y114.601 E.76558
G1 X105.753 Y114.067 E.01596
G1 X87.624 Y132.196 E.76558
G1 X87.624 Y131.661 E.01596
G1 X105.753 Y113.532 E.76558
G1 X105.753 Y112.998 E.01596
G1 X87.624 Y131.127 E.76558
G1 X87.624 Y130.592 E.01596
G1 X97.727 Y120.489 E.42663
G1 X97.511 Y120.585 E.00705
G1 X97.096 Y120.585 E.01239
G1 X87.624 Y130.058 E.4
G1 X87.624 Y129.523 E.01596
G1 X96.561 Y120.585 E.37742
G1 X96.027 Y120.585 E.01596
G1 X87.624 Y128.989 E.35485
G1 X87.624 Y128.454 E.01596
G1 X95.607 Y120.47 E.33714
G1 X95.237 Y120.306 E.01209
G1 X87.624 Y127.919 E.32152
G1 X87.624 Y127.385 E.01596
G1 X94.868 Y120.141 E.3059
G1 X94.498 Y119.976 E.01209
G1 X87.624 Y126.85 E.29028
G1 X87.624 Y126.316 E.01596
G1 X94.202 Y119.737 E.27779
G1 X93.949 Y119.456 E.0113
G1 X87.624 Y125.781 E.26709
G1 X87.624 Y125.246 E.01596
G1 X93.695 Y119.175 E.2564
G1 X93.442 Y118.894 E.0113
G1 X87.624 Y124.712 E.2457
G1 X87.624 Y124.177 E.01596
G1 X93.224 Y118.577 E.2365
G1 X93.093 Y118.173 E.01267
G1 X87.624 Y123.643 E.23096
G1 X87.624 Y123.108 E.01596
G1 X92.962 Y117.77 E.22543
G1 X92.831 Y117.366 E.01267
G1 X87.624 Y122.574 E.21989
G1 X87.624 Y122.039 E.01596
G1 X92.78 Y116.883 E.21773
G1 X92.843 Y116.286 E.01794
G1 X87.624 Y121.504 E.22038
G1 X87.624 Y120.97 E.01596
G1 X93.151 Y115.442 E.23341
; WIPE_START
G1 X91.737 Y116.857 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.29 Y117.957 Z.9 F15000
G1 X100.136 Y118.081 Z.9
G1 Z.5
G1 E.8 F1800
G1 F4800
G1 X105.753 Y112.463 E.23722
G1 X105.753 Y111.928 E.01596
G1 X100.616 Y117.065 E.21692
G1 X100.565 Y116.581 E.01452
G1 X105.753 Y111.394 E.21907
G1 X105.753 Y110.859 E.01596
G1 X100.515 Y116.098 E.22122
G1 X100.464 Y115.614 E.01452
G1 X105.753 Y110.325 E.22336
G1 X105.753 Y109.79 E.01596
G1 X100.304 Y115.239 E.2301
G1 X100.109 Y114.9 E.01169
G1 X105.753 Y109.255 E.23836
G1 X105.753 Y108.721 E.01596
G1 X99.913 Y114.561 E.24662
G1 X99.717 Y114.222 E.01169
G1 X105.753 Y108.186 E.25489
G1 X105.753 Y107.652 E.01596
G1 X99.459 Y113.946 E.26578
G1 X99.15 Y113.721 E.01143
G1 X105.753 Y107.117 E.27886
G1 X105.753 Y106.582 E.01596
G1 X98.84 Y113.496 E.29193
G1 X98.53 Y113.271 E.01143
G1 X105.753 Y106.048 E.30501
M73 P35 R27
G1 X105.753 Y105.513 E.01596
G1 X98.188 Y113.078 E.31946
G1 X97.747 Y112.985 E.01346
G1 X105.753 Y104.979 E.33807
G1 X105.753 Y104.444 E.01596
G1 X97.306 Y112.891 E.35669
G1 X96.866 Y112.797 E.01346
G1 X105.753 Y103.91 E.37531
G1 X105.753 Y103.375 E.01596
G1 X96.282 Y112.846 E.39994
G1 X95.603 Y112.99 E.02072
G1 X105.753 Y102.84 E.42861
G1 X105.753 Y102.306 E.01596
G1 X87.624 Y120.435 E.76558
G1 X87.624 Y119.901 E.01596
G1 X105.753 Y101.771 E.76558
G1 X105.753 Y101.237 E.01596
G1 X87.624 Y119.366 E.76558
G1 X87.624 Y118.831 E.01596
G1 X105.753 Y100.702 E.76558
G1 X105.753 Y100.167 E.01596
G1 X87.624 Y118.297 E.76558
G1 X87.624 Y117.762 E.01596
G1 X105.753 Y99.633 E.76558
G1 X105.753 Y99.098 E.01596
G1 X87.624 Y117.228 E.76558
G1 X87.624 Y116.693 E.01596
G1 X105.753 Y98.564 E.76558
G1 X105.753 Y98.029 E.01596
G1 X87.624 Y116.158 E.76558
G1 X87.624 Y115.624 E.01596
G1 X105.753 Y97.495 E.76558
G1 X105.753 Y96.96 E.01596
G1 X87.624 Y115.089 E.76558
G1 X87.624 Y114.555 E.01596
G1 X105.753 Y96.425 E.76558
G1 X105.753 Y95.891 E.01596
G1 X87.624 Y114.02 E.76558
G1 X87.624 Y113.486 E.01596
G1 X105.753 Y95.356 E.76558
G1 X105.753 Y94.822 E.01596
G1 X87.624 Y112.951 E.76558
G1 X87.624 Y112.416 E.01596
G1 X105.753 Y94.287 E.76558
G1 X105.753 Y93.752 E.01596
G1 X87.624 Y111.882 E.76558
G1 X87.624 Y111.347 E.01596
G1 X105.753 Y93.218 E.76558
G1 X105.753 Y92.683 E.01596
G1 X87.624 Y110.813 E.76558
G1 X87.624 Y110.278 E.01596
G1 X105.753 Y92.149 E.76558
G1 X105.753 Y91.614 E.01596
G1 X87.624 Y109.743 E.76558
G1 X87.624 Y109.209 E.01596
G1 X105.753 Y91.079 E.76558
G1 X105.753 Y90.545 E.01596
G1 X87.624 Y108.674 E.76558
G1 X87.624 Y108.14 E.01596
G1 X105.753 Y90.01 E.76558
G1 X105.753 Y89.476 E.01596
G1 X87.624 Y107.605 E.76558
G1 X87.624 Y107.07 E.01596
G1 X105.753 Y88.941 E.76558
G1 X105.753 Y88.407 E.01596
G1 X87.624 Y106.536 E.76558
G1 X87.624 Y106.001 E.01596
G1 X105.753 Y87.872 E.76558
G1 X105.753 Y87.337 E.01596
G1 X87.624 Y105.467 E.76558
G1 X87.624 Y104.932 E.01596
G1 X105.753 Y86.803 E.76558
G1 X105.753 Y86.268 E.01596
G1 X87.624 Y104.398 E.76558
G1 X87.624 Y103.863 E.01596
G1 X105.753 Y85.734 E.76558
G1 X105.753 Y85.199 E.01596
G1 X87.624 Y103.328 E.76558
G1 X87.624 Y102.794 E.01596
G1 X105.753 Y84.664 E.76558
G1 X105.753 Y84.13 E.01596
G1 X87.624 Y102.259 E.76558
G1 X87.624 Y101.725 E.01596
G1 X105.753 Y83.595 E.76558
G1 X105.753 Y83.061 E.01596
G1 X87.624 Y101.19 E.76558
G1 X87.624 Y100.655 E.01596
G1 X105.753 Y82.526 E.76558
G1 X105.753 Y81.992 E.01596
G1 X87.624 Y100.121 E.76558
G1 X87.624 Y99.586 E.01596
G1 X105.753 Y81.457 E.76558
G1 X105.753 Y80.922 E.01596
G1 X87.624 Y99.052 E.76558
G1 X87.624 Y98.517 E.01596
G1 X105.753 Y80.388 E.76558
G1 X105.753 Y79.853 E.01596
G1 X87.624 Y97.983 E.76558
G1 X87.624 Y97.448 E.01596
G1 X105.753 Y79.319 E.76558
G1 X105.753 Y78.784 E.01596
G1 X87.624 Y96.913 E.76558
G1 X87.624 Y96.379 E.01596
G1 X105.753 Y78.249 E.76558
G1 X105.753 Y77.715 E.01596
G1 X87.624 Y95.844 E.76558
G1 X87.624 Y95.31 E.01596
G1 X105.753 Y77.18 E.76558
G1 X105.753 Y76.646 E.01596
G1 X87.624 Y94.775 E.76558
G1 X87.624 Y94.24 E.01596
G1 X105.753 Y76.111 E.76558
G1 X105.753 Y75.576 E.01596
G1 X87.624 Y93.706 E.76558
G1 X87.624 Y93.171 E.01596
G1 X105.753 Y75.042 E.76558
G1 X105.753 Y74.507 E.01596
G1 X87.624 Y92.637 E.76558
G1 X87.624 Y92.102 E.01596
G1 X105.753 Y73.973 E.76558
G1 X105.753 Y73.438 E.01596
G1 X87.624 Y91.567 E.76558
G1 X87.624 Y91.033 E.01596
G1 X105.753 Y72.904 E.76558
G1 X105.753 Y72.369 E.01596
G1 X87.624 Y90.498 E.76558
G1 X87.624 Y89.964 E.01596
G1 X105.753 Y71.834 E.76558
G1 X105.753 Y71.3 E.01596
G1 X87.624 Y89.429 E.76558
G1 X87.624 Y88.895 E.01596
G1 X105.753 Y70.765 E.76558
G1 X105.753 Y70.231 E.01596
G1 X87.624 Y88.36 E.76558
G1 X87.624 Y87.825 E.01596
G1 X105.753 Y69.696 E.76558
G1 X105.753 Y69.161 E.01596
G1 X87.624 Y87.291 E.76558
G1 X87.624 Y86.756 E.01596
G1 X105.753 Y68.627 E.76558
G1 X105.753 Y68.092 E.01596
G1 X87.624 Y86.222 E.76558
G1 X87.624 Y85.687 E.01596
G1 X97.897 Y75.413 E.43384
G1 X97.511 Y75.585 E.01263
G1 X97.191 Y75.585 E.00956
G1 X87.624 Y85.152 E.404
G1 X87.624 Y84.618 E.01596
G1 X96.656 Y75.585 E.38142
G1 X96.122 Y75.585 E.01596
G1 X87.624 Y84.083 E.35885
G1 X87.624 Y83.549 E.01596
G1 X95.673 Y75.5 E.3399
G1 X95.303 Y75.335 E.01209
G1 X87.624 Y83.014 E.32428
G1 X87.624 Y82.479 E.01596
G1 X94.933 Y75.17 E.30866
G1 X94.563 Y75.005 E.01209
G1 X87.624 Y81.945 E.29304
G1 X87.624 Y81.41 E.01596
G1 X94.247 Y74.787 E.27968
G1 X93.994 Y74.506 E.0113
G1 X87.624 Y80.876 E.26899
G1 X87.624 Y80.341 E.01596
G1 X93.74 Y74.225 E.25829
G1 X93.487 Y73.943 E.0113
G1 X87.624 Y79.807 E.24759
G1 X87.624 Y79.272 E.01596
G1 X93.247 Y73.648 E.23748
G1 X93.116 Y73.245 E.01267
G1 X87.624 Y78.737 E.23194
G1 X87.624 Y78.203 E.01596
G1 X92.985 Y72.841 E.22641
G1 X92.854 Y72.438 E.01267
G1 X87.624 Y77.668 E.22087
G1 X87.624 Y77.134 E.01596
M73 P35 R26
G1 X92.769 Y71.989 E.21726
G1 X92.831 Y71.391 E.01794
G1 X87.624 Y76.599 E.21991
G1 X87.624 Y76.064 E.01596
G1 X92.894 Y70.794 E.22256
G1 X92.926 Y70.493 E.00903
G1 X93.288 Y69.865 E.02165
G1 X87.624 Y75.53 E.23921
M73 P36 R26
G1 X87.624 Y74.995 E.01596
G1 X105.753 Y56.866 E.76558
G1 X105.753 Y57.401 E.01596
G1 X94.98 Y68.174 E.45493
G1 X95.079 Y68.102 E.00367
G1 X95.724 Y67.965 E.01967
G1 X105.753 Y57.935 E.42353
G1 X105.753 Y58.47 E.01596
G1 X96.403 Y67.82 E.39486
G1 X96.688 Y67.759 E.00873
G1 X96.944 Y67.814 E.00779
G1 X105.753 Y59.004 E.37201
G1 X105.753 Y59.539 E.01596
G1 X97.385 Y67.907 E.35339
G1 X97.825 Y68.001 E.01346
G1 X105.753 Y60.073 E.33478
G1 X105.753 Y60.608 E.01596
G1 X98.266 Y68.095 E.31616
G1 X98.298 Y68.102 E.00096
G1 X98.585 Y68.31 E.01062
G1 X105.753 Y61.143 E.30269
G1 X105.753 Y61.677 E.01596
G1 X98.895 Y68.535 E.28961
G1 X99.205 Y68.76 E.01143
G1 X105.753 Y62.212 E.27654
G1 X105.753 Y62.746 E.01596
G1 X99.514 Y68.985 E.26346
G1 X99.629 Y69.068 E.00422
G1 X99.752 Y69.282 E.00737
G1 X105.753 Y63.281 E.25342
G1 X105.753 Y63.816 E.01596
G1 X99.948 Y69.621 E.24516
G1 X100.143 Y69.96 E.01169
G1 X105.753 Y64.35 E.2369
G1 X105.753 Y64.885 E.01596
G1 X100.339 Y70.299 E.22863
G1 X100.451 Y70.493 E.0067
G1 X100.473 Y70.7 E.0062
G1 X105.753 Y65.419 E.22298
G1 X105.753 Y65.954 E.01596
G1 X100.524 Y71.183 E.22084
G1 X100.574 Y71.667 E.01452
G1 X105.753 Y66.488 E.21869
G1 X105.753 Y67.023 E.01596
G1 X100.612 Y72.165 E.21712
G1 X100.354 Y72.957 E.02486
G1 X105.923 Y67.388 E.23516
; WIPE_START
G1 X104.509 Y68.802 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.286 Y71.27 Z.9 F15000
G1 X87.454 Y74.63 Z.9
G1 Z.5
G1 E.8 F1800
G1 F4800
G1 X105.753 Y56.331 E.77274
G1 X105.753 Y55.797 E.01596
G1 X87.624 Y73.926 E.76558
G1 X87.624 Y73.392 E.01596
G1 X105.753 Y55.262 E.76558
G1 X105.753 Y54.728 E.01596
G1 X87.624 Y72.857 E.76558
G1 X87.624 Y72.322 E.01596
G1 X105.753 Y54.193 E.76558
G1 X105.753 Y53.658 E.01596
G1 X87.624 Y71.788 E.76558
G1 X87.624 Y71.253 E.01596
G1 X105.753 Y53.124 E.76558
G1 X105.753 Y52.651 E.01412
G1 X105.691 Y52.651 E.00184
G1 X87.624 Y70.719 E.76297
G1 X87.624 Y70.184 E.01596
G1 X105.157 Y52.651 E.74039
G1 X104.622 Y52.651 E.01596
G1 X87.624 Y69.649 E.71782
G1 X87.624 Y69.115 E.01596
G1 X104.088 Y52.651 E.69524
G1 X103.553 Y52.651 E.01596
G1 X87.624 Y68.58 E.67267
G1 X87.624 Y68.046 E.01596
G1 X103.018 Y52.651 E.65009
G1 X102.484 Y52.651 E.01596
G1 X87.624 Y67.511 E.62752
G1 X87.624 Y66.976 E.01596
G1 X101.949 Y52.651 E.60494
G1 X101.415 Y52.651 E.01596
G1 X87.624 Y66.442 E.58237
G1 X87.624 Y65.907 E.01596
G1 X100.88 Y52.651 E.55979
G1 X100.346 Y52.651 E.01596
G1 X87.624 Y65.373 E.53722
G1 X87.624 Y64.838 E.01596
G1 X99.811 Y52.651 E.51464
G1 X99.276 Y52.651 E.01596
G1 X87.624 Y64.304 E.49207
G1 X87.624 Y63.769 E.01596
G1 X98.742 Y52.651 E.4695
G1 X98.207 Y52.651 E.01596
G1 X87.624 Y63.234 E.44692
G1 X87.624 Y62.7 E.01596
G1 X97.673 Y52.651 E.42435
G1 X97.138 Y52.651 E.01596
G1 X87.624 Y62.165 E.40177
G1 X87.624 Y61.631 E.01596
G1 X96.603 Y52.651 E.3792
G1 X96.069 Y52.651 E.01596
G1 X87.624 Y61.096 E.35662
G1 X87.624 Y60.561 E.01596
G1 X95.534 Y52.651 E.33405
G1 X95 Y52.651 E.01596
G1 X87.624 Y60.027 E.31147
G1 X87.624 Y59.492 E.01596
G1 X94.465 Y52.651 E.2889
G1 X93.93 Y52.651 E.01596
G1 X87.624 Y58.958 E.26632
G1 X87.624 Y58.423 E.01596
G1 X93.396 Y52.651 E.24375
G1 X92.861 Y52.651 E.01596
G1 X87.624 Y57.889 E.22117
G1 X87.624 Y57.354 E.01596
G1 X92.327 Y52.651 E.1986
G1 X91.792 Y52.651 E.01596
G1 X87.624 Y56.819 E.17602
G1 X87.624 Y56.285 E.01596
G1 X91.258 Y52.651 E.15345
G1 X90.723 Y52.651 E.01596
G1 X87.624 Y55.75 E.13087
G1 X87.624 Y55.216 E.01596
G1 X90.188 Y52.651 E.1083
G1 X89.654 Y52.651 E.01596
G1 X87.624 Y54.681 E.08572
G1 X87.624 Y54.146 E.01596
G1 X89.119 Y52.651 E.06315
G1 X88.585 Y52.651 E.01596
G1 X87.624 Y53.612 E.04057
G1 X87.624 Y53.077 E.01596
G1 X88.22 Y52.481 E.02516
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4800
G1 X87.624 Y53.077 E-.32023
G1 X87.624 Y53.612 E-.20314
G1 X88.064 Y53.172 E-.23663
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 3/20
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.9 I1.217 J0 P1  F15000
; object ids of layer 3 start: 138,178
M624 AwAAAAAAAAA=
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
; object ids of this layer3 end: 138,178
M625
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X207.791 Y176.449
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X207.791 Y177.256 E.02593
G1 X154.995 Y177.256 E1.69772
G1 X154.995 Y176.449 E.02593
G1 X207.731 Y176.449 E1.69579
M204 S250
G1 X208.183 Y176.057 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X208.183 Y177.648 E.04738
G1 X154.603 Y177.648 E1.59597
G1 X154.603 Y176.057 E.04738
G1 X208.123 Y176.057 E1.59418
M204 S5000
G1 X207.588 Y176.852 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.44235
G1 F7500
G1 X155.199 Y176.852 E1.65298
; WIPE_START
G1 X157.199 Y176.852 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.931 Y169.726 Z1.1 F15000
G1 X199.603 Y66.256 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X199.995 Y66.256 E.01261
G1 X199.995 Y91.256 E.80391
G1 X200.791 Y91.256 E.02559
G1 X200.791 Y66.256 E.80391
G1 X206.995 Y66.256 E.1995
G1 X206.995 Y172.46 E3.41514
G1 X155.791 Y172.46 E1.64654
G1 X155.791 Y66.256 E3.41514
G1 X161.995 Y66.256 E.1995
G1 X161.995 Y91.256 E.80391
G1 X162.791 Y91.256 E.02559
G1 X162.791 Y66.256 E.80391
G1 X199.543 Y66.256 E1.18181
M204 S250
G1 X199.603 Y66.648 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X199.603 Y91.648 E.74466
G1 X201.183 Y91.648 E.04706
G1 X201.183 Y66.648 E.74466
G1 X206.603 Y66.648 E.16144
G1 X206.603 Y172.068 E3.1401
G1 X156.183 Y172.068 E1.50184
G1 X156.183 Y66.648 E3.1401
G1 X161.603 Y66.648 E.16144
G1 X161.603 Y91.648 E.74466
G1 X163.183 Y91.648 E.04706
G1 X163.183 Y66.648 E.74466
G1 X199.543 Y66.648 E1.08304
; WIPE_START
M204 S5000
G1 X199.548 Y68.648 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.148 Y76.257 Z1.1 F15000
G1 X207.791 Y173.245 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X154.995 Y173.245 E1.69772
G1 X154.995 Y65.46 E3.46598
G1 X207.791 Y65.46 E1.69772
G1 X207.791 Y173.185 E3.46405
M204 S250
G1 X208.183 Y173.637 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X154.603 Y173.637 E1.59597
G1 X154.603 Y65.068 E3.23391
G1 X208.183 Y65.068 E1.59597
G1 X208.183 Y173.577 E3.23212
; WIPE_START
M204 S5000
G1 X206.183 Y173.579 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.281 Y172.835 Z1.1 F15000
G1 Z.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.466319
G1 F7500
G1 X207.363 Y172.817 E.00281
G1 X207.393 Y172.663 E.00523
; LINE_WIDTH: 0.43172
G1 X207.393 Y66.052 E3.27429
; LINE_WIDTH: 0.448395
G1 X207.377 Y65.972 E.00263
; LINE_WIDTH: 0.470635
G1 X207.36 Y65.891 E.00278
G1 X207.199 Y65.858 E.00556
; LINE_WIDTH: 0.43172
G1 X200.588 Y65.858 E.20305
; LINE_WIDTH: 0.45602
G1 X200.491 Y65.882 E.00327
; LINE_WIDTH: 0.50462
G1 X200.393 Y65.906 E.00365
; WIPE_START
G1 X200.491 Y65.882 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.461 Y73.514 Z1.1 F15000
G1 X200.393 Y90.858 Z1.1
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.43172
G1 F7500
G1 X200.393 Y66.052 E.76184
; LINE_WIDTH: 0.45602
G1 X200.393 Y65.979 E.00238
; LINE_WIDTH: 0.486803
G1 X200.393 Y65.906 E.00256
G1 X200.199 Y65.858 E.00703
; LINE_WIDTH: 0.43172
M73 P37 R26
G1 X162.588 Y65.858 E1.15513
; LINE_WIDTH: 0.45602
G1 X162.491 Y65.882 E.00327
; LINE_WIDTH: 0.490218
G1 X162.393 Y65.906 E.00354
G1 X162.393 Y66.052 E.00515
; LINE_WIDTH: 0.43172
G1 X162.393 Y90.858 E.76184
; WIPE_START
G1 X162.393 Y88.858 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X162.393 Y81.225 Z1.1 F15000
G1 X162.393 Y65.906 Z1.1
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.50462
G1 F7500
G1 X162.296 Y65.882 E.00365
; LINE_WIDTH: 0.432083
G1 X162.199 Y65.858 E.00308
G1 X155.588 Y65.858 E.20324
; LINE_WIDTH: 0.448395
G1 X155.507 Y65.874 E.00263
; LINE_WIDTH: 0.470635
G1 X155.427 Y65.891 E.00278
G1 X155.393 Y66.052 E.00556
; LINE_WIDTH: 0.43172
G1 X155.393 Y172.663 E3.27429
; LINE_WIDTH: 0.446845
G1 X155.408 Y172.74 E.00249
; LINE_WIDTH: 0.463107
G1 X155.424 Y172.817 E.00259
G1 X155.588 Y172.852 E.00558
; LINE_WIDTH: 0.42095
G1 X207.199 Y172.852 E1.5412
; LINE_WIDTH: 0.43876
G1 X207.281 Y172.835 E.00263
; OBJECT_ID: 178
; WIPE_START
G1 X207.199 Y172.852 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X200.491 Y169.212 Z1.1 F15000
G1 X99.414 Y114.364 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X100.127 Y115.598 E.04585
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X96.38 Y113.166 E.03821
G1 X96.688 Y113.1 E.01013
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.384 Y114.312 E.00057
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X96.462 Y113.549 E.03291
G1 X96.688 Y113.501 E.0069
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52888
G1 X99.809 Y116.327 E-.23112
; WIPE_END
G1 E-.04 F1800
G1 X99.383 Y108.707 Z1.1 F15000
G1 X97.511 Y75.221 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X97.44 Y75.252 E.00249
G1 X95.937 Y75.252 E.04835
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X96.38 Y68.166 E.03821
G1 X96.688 Y68.1 E.01013
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04835
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.566 Y75.196 E.04392
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X96.462 Y68.549 E.03291
G1 X96.688 Y68.501 E.0069
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X95.753 Y82.24 Z1.1 F15000
G1 X98.866 Y164.583 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.814 Y164.641 E.0025
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04834
G1 X96.38 Y158.166 E.03821
G1 X96.688 Y158.1 E.01013
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04834
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.906 Y164.538 E.04392
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X96.462 Y158.549 E.03291
G1 X96.688 Y158.501 E.0069
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X100.551 Y171.478 Z1.1 F15000
G1 X106.086 Y181.114 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y52.318 E4.14161
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y181.054 E4.13968
M204 S250
G1 X106.478 Y181.506 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y51.926 E3.85975
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y181.446 E3.85796
; WIPE_START
M204 S5000
G1 X104.478 Y181.452 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.923 Y177.27 Z1.1 F15000
G1 Z.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42093
G1 F4800
G1 X87.624 Y158.971 E.77274
G1 X87.624 Y159.505 E.01596
G1 X105.753 Y177.635 E.76558
G1 X105.753 Y178.169 E.01596
G1 X87.624 Y160.04 E.76558
G1 X87.624 Y160.574 E.01596
G1 X105.753 Y178.704 E.76558
G1 X105.753 Y179.238 E.01596
G1 X87.624 Y161.109 E.76558
G1 X87.624 Y161.644 E.01596
G1 X105.753 Y179.773 E.76558
G1 X105.753 Y180.308 E.01596
G1 X87.624 Y162.178 E.76558
G1 X87.624 Y162.713 E.01596
G1 X105.691 Y180.78 E.76297
G1 X105.157 Y180.78 E.01596
G1 X87.624 Y163.247 E.74039
G1 X87.624 Y163.782 E.01596
G1 X104.622 Y180.78 E.71782
G1 X104.088 Y180.78 E.01596
G1 X87.624 Y164.317 E.69524
G1 X87.624 Y164.851 E.01596
G1 X103.553 Y180.78 E.67267
G1 X103.018 Y180.78 E.01596
G1 X87.624 Y165.386 E.65009
G1 X87.624 Y165.92 E.01596
G1 X102.484 Y180.78 E.62752
G1 X101.949 Y180.78 E.01596
G1 X87.624 Y166.455 E.60494
G1 X87.624 Y166.989 E.01596
G1 X101.415 Y180.78 E.58237
G1 X100.88 Y180.78 E.01596
G1 X87.624 Y167.524 E.55979
G1 X87.624 Y168.059 E.01596
G1 X100.346 Y180.78 E.53722
G1 X99.811 Y180.78 E.01596
G1 X87.624 Y168.593 E.51464
G1 X87.624 Y169.128 E.01596
G1 X99.276 Y180.78 E.49207
G1 X98.742 Y180.78 E.01596
G1 X87.624 Y169.662 E.46949
G1 X87.624 Y170.197 E.01596
G1 X98.207 Y180.78 E.44692
G1 X97.673 Y180.78 E.01596
G1 X87.624 Y170.732 E.42434
G1 X87.624 Y171.266 E.01596
G1 X97.138 Y180.78 E.40177
G1 X96.603 Y180.78 E.01596
G1 X87.624 Y171.801 E.3792
G1 X87.624 Y172.335 E.01596
G1 X96.069 Y180.78 E.35662
G1 X95.534 Y180.78 E.01596
G1 X87.624 Y172.87 E.33405
G1 X87.624 Y173.405 E.01596
G1 X95 Y180.78 E.31147
G1 X94.465 Y180.78 E.01596
G1 X87.624 Y173.939 E.2889
G1 X87.624 Y174.474 E.01596
G1 X93.93 Y180.78 E.26632
G1 X93.396 Y180.78 E.01596
G1 X87.624 Y175.008 E.24375
M73 P38 R26
G1 X87.624 Y175.543 E.01596
G1 X92.861 Y180.78 E.22117
G1 X92.327 Y180.78 E.01596
G1 X87.624 Y176.077 E.1986
G1 X87.624 Y176.612 E.01596
G1 X91.792 Y180.78 E.17602
G1 X91.258 Y180.78 E.01596
G1 X87.624 Y177.147 E.15345
G1 X87.624 Y177.681 E.01596
G1 X90.723 Y180.78 E.13087
G1 X90.188 Y180.78 E.01596
G1 X87.624 Y178.216 E.1083
G1 X87.624 Y178.75 E.01596
G1 X89.654 Y180.78 E.08572
G1 X89.119 Y180.78 E.01596
G1 X87.624 Y179.285 E.06315
G1 X87.624 Y179.82 E.01596
G1 X88.585 Y180.78 E.04057
G1 X88.05 Y180.78 E.01596
G1 X87.454 Y180.184 E.02516
; WIPE_START
G1 X88.05 Y180.78 E-.32023
G1 X88.585 Y180.78 E-.20314
G1 X88.144 Y180.34 E-.23662
; WIPE_END
G1 E-.04 F1800
G1 X87.984 Y172.709 Z1.1 F15000
G1 X87.454 Y147.575 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F4800
G1 X97.895 Y158.016 E.44092
G1 X97.217 Y157.872 E.02072
G1 X87.624 Y148.279 E.40509
G1 X87.624 Y148.814 E.01596
G1 X96.591 Y157.78 E.37865
G1 X96.15 Y157.874 E.01346
G1 X87.624 Y149.348 E.36003
G1 X87.624 Y149.883 E.01596
G1 X95.709 Y157.968 E.34142
G1 X95.268 Y158.061 E.01346
G1 X87.624 Y150.417 E.3228
G1 X87.624 Y150.952 E.01596
G1 X94.902 Y158.23 E.30735
G1 X94.593 Y158.455 E.01143
G1 X87.624 Y151.486 E.29428
G1 X87.624 Y152.021 E.01596
G1 X94.283 Y158.68 E.2812
G1 X93.973 Y158.905 E.01143
G1 X87.624 Y152.556 E.26813
G1 X87.624 Y153.09 E.01596
G1 X93.695 Y159.161 E.25637
G1 X93.499 Y159.5 E.01169
G1 X87.624 Y153.625 E.24811
G1 X87.624 Y154.159 E.01596
G1 X93.304 Y159.839 E.23985
G1 X93.108 Y160.178 E.01169
G1 X87.624 Y154.694 E.23158
G1 X87.624 Y155.229 E.01596
G1 X92.922 Y160.527 E.22375
G1 X92.871 Y161.011 E.01452
G1 X87.624 Y155.763 E.2216
G1 X87.624 Y156.298 E.01596
G1 X92.821 Y161.495 E.21945
G1 X92.77 Y161.978 E.01452
G1 X87.624 Y156.832 E.21731
G1 X87.624 Y157.367 E.01596
G1 X92.931 Y162.674 E.22411
G1 X93.188 Y163.466 E.02486
G1 X87.624 Y157.902 E.23498
G1 X87.624 Y158.436 E.01596
G1 X105.753 Y176.565 E.76558
G1 X105.753 Y176.031 E.01596
G1 X94.86 Y165.138 E.46001
G1 X95.823 Y165.567 E.0315
G1 X105.753 Y175.496 E.41932
G1 X105.753 Y174.962 E.01596
G1 X96.377 Y165.585 E.39594
G1 X96.912 Y165.585 E.01596
G1 X105.753 Y174.427 E.37337
G1 X105.753 Y173.893 E.01596
G1 X97.446 Y165.585 E.35079
G1 X97.511 Y165.585 E.00194
G1 X97.836 Y165.441 E.01062
G1 X105.753 Y173.358 E.33433
G1 X105.753 Y172.823 E.01596
G1 X98.206 Y165.276 E.31871
G1 X98.576 Y165.111 E.01209
M73 P38 R25
G1 X105.753 Y172.289 E.30309
G1 X105.753 Y171.754 E.01596
G1 X98.946 Y164.947 E.28747
G1 X99.014 Y164.916 E.00223
G1 X99.22 Y164.687 E.00922
G1 X105.753 Y171.22 E.27587
G1 X105.753 Y170.685 E.01596
G1 X99.474 Y164.406 E.26517
G1 X99.727 Y164.124 E.0113
G1 X105.753 Y170.15 E.25447
G1 X105.753 Y169.616 E.01596
G1 X99.98 Y163.843 E.24378
G2 X100.176 Y163.504 I-.282 J-.389 E.01203
G1 X105.753 Y169.081 E.23551
G1 X105.753 Y168.547 E.01596
G1 X100.307 Y163.101 E.22997
G1 X100.438 Y162.697 E.01267
G1 X105.753 Y168.012 E.22443
G1 X105.753 Y167.477 E.01596
G1 X100.57 Y162.294 E.2189
G1 X100.623 Y162.129 E.00517
G1 X100.586 Y161.776 E.01062
G1 X105.753 Y166.943 E.21821
G1 X105.753 Y166.408 E.01596
G1 X100.523 Y161.178 E.22086
G1 X100.46 Y160.581 E.01794
G1 X105.753 Y165.874 E.22351
G1 X105.753 Y165.339 E.01596
G1 X87.624 Y147.21 E.76558
G1 X87.624 Y146.675 E.01596
G1 X105.753 Y164.805 E.76558
G1 X105.753 Y164.27 E.01596
G1 X87.624 Y146.141 E.76558
G1 X87.624 Y145.606 E.01596
G1 X105.753 Y163.735 E.76558
G1 X105.753 Y163.201 E.01596
G1 X87.624 Y145.071 E.76558
G1 X87.624 Y144.537 E.01596
G1 X105.753 Y162.666 E.76558
G1 X105.753 Y162.132 E.01596
G1 X87.624 Y144.002 E.76558
G1 X87.624 Y143.468 E.01596
G1 X105.753 Y161.597 E.76558
G1 X105.753 Y161.062 E.01596
G1 X87.624 Y142.933 E.76558
G1 X87.624 Y142.398 E.01596
G1 X105.753 Y160.528 E.76558
G1 X105.753 Y159.993 E.01596
G1 X87.624 Y141.864 E.76558
G1 X87.624 Y141.329 E.01596
G1 X105.753 Y159.459 E.76558
G1 X105.753 Y158.924 E.01596
G1 X87.624 Y140.795 E.76558
G1 X87.624 Y140.26 E.01596
G1 X105.753 Y158.39 E.76558
G1 X105.753 Y157.855 E.01596
G1 X87.624 Y139.726 E.76558
G1 X87.624 Y139.191 E.01596
G1 X105.753 Y157.32 E.76558
G1 X105.753 Y156.786 E.01596
G1 X87.624 Y138.656 E.76558
G1 X87.624 Y138.122 E.01596
G1 X105.753 Y156.251 E.76558
G1 X105.753 Y155.717 E.01596
G1 X87.624 Y137.587 E.76558
G1 X87.624 Y137.053 E.01596
G1 X105.753 Y155.182 E.76558
G1 X105.753 Y154.647 E.01596
G1 X87.624 Y136.518 E.76558
G1 X87.624 Y135.983 E.01596
G1 X105.753 Y154.113 E.76558
G1 X105.753 Y153.578 E.01596
G1 X87.624 Y135.449 E.76558
G1 X87.624 Y134.914 E.01596
G1 X105.753 Y153.044 E.76558
G1 X105.753 Y152.509 E.01596
G1 X87.624 Y134.38 E.76558
G1 X87.624 Y133.845 E.01596
G1 X105.753 Y151.974 E.76558
G1 X105.753 Y151.44 E.01596
G1 X87.624 Y133.311 E.76558
G1 X87.624 Y132.776 E.01596
G1 X105.753 Y150.905 E.76558
G1 X105.753 Y150.371 E.01596
G1 X87.624 Y132.241 E.76558
G1 X87.624 Y131.707 E.01596
G1 X105.753 Y149.836 E.76558
G1 X105.753 Y149.302 E.01596
G1 X87.624 Y131.172 E.76558
G1 X87.624 Y130.638 E.01596
G1 X105.753 Y148.767 E.76558
G1 X105.753 Y148.232 E.01596
G1 X87.624 Y130.103 E.76558
G1 X87.624 Y129.568 E.01596
G1 X105.753 Y147.698 E.76558
G1 X105.753 Y147.163 E.01596
G1 X87.624 Y129.034 E.76558
G1 X87.624 Y128.499 E.01596
G1 X105.753 Y146.629 E.76558
G1 X105.753 Y146.094 E.01596
G1 X87.624 Y127.965 E.76558
G1 X87.624 Y127.43 E.01596
G1 X105.753 Y145.559 E.76558
G1 X105.753 Y145.025 E.01596
G1 X87.624 Y126.895 E.76558
G1 X87.624 Y126.361 E.01596
G1 X105.753 Y144.49 E.76558
G1 X105.753 Y143.956 E.01596
G1 X87.624 Y125.826 E.76558
G1 X87.624 Y125.292 E.01596
G1 X105.753 Y143.421 E.76558
G1 X105.753 Y142.886 E.01596
G1 X87.624 Y124.757 E.76558
G1 X87.624 Y124.223 E.01596
G1 X105.753 Y142.352 E.76558
G1 X105.753 Y141.817 E.01596
G1 X87.624 Y123.688 E.76558
G1 X87.624 Y123.153 E.01596
G1 X105.753 Y141.283 E.76558
G1 X105.753 Y140.748 E.01596
G1 X87.624 Y122.619 E.76558
G1 X87.624 Y122.084 E.01596
G1 X105.753 Y140.214 E.76558
G1 X105.753 Y139.679 E.01596
G1 X87.624 Y121.55 E.76558
G1 X87.624 Y121.015 E.01596
G1 X105.753 Y139.144 E.76558
G1 X105.753 Y138.61 E.01596
G1 X87.624 Y120.48 E.76558
G1 X87.624 Y119.946 E.01596
G1 X105.753 Y138.075 E.76558
G1 X105.753 Y137.541 E.01596
G1 X87.624 Y119.411 E.76558
G1 X87.624 Y118.877 E.01596
G1 X105.753 Y137.006 E.76558
G1 X105.753 Y136.471 E.01596
G1 X87.624 Y118.342 E.76558
G1 X87.624 Y117.807 E.01596
G1 X105.753 Y135.937 E.76558
G1 X105.753 Y135.402 E.01596
G1 X87.624 Y117.273 E.76558
G1 X87.624 Y116.738 E.01596
G1 X105.753 Y134.868 E.76558
M73 P39 R25
G1 X105.753 Y134.333 E.01596
G1 X87.624 Y116.204 E.76558
G1 X87.624 Y115.669 E.01596
G1 X105.753 Y133.799 E.76558
G1 X105.753 Y133.264 E.01596
G1 X87.624 Y115.135 E.76558
G1 X87.624 Y114.6 E.01596
G1 X105.753 Y132.729 E.76558
G1 X105.753 Y132.195 E.01596
G1 X87.624 Y114.065 E.76558
G1 X87.624 Y113.531 E.01596
G1 X105.753 Y131.66 E.76558
G1 X105.753 Y131.126 E.01596
G1 X87.624 Y112.996 E.76558
G1 X87.624 Y112.462 E.01596
G1 X92.977 Y117.814 E.22604
G1 X92.754 Y117.129 E.02151
G1 X92.761 Y117.064 E.00196
G1 X87.624 Y111.927 E.21693
G1 X87.624 Y111.392 E.01596
G1 X92.812 Y116.58 E.21907
G1 X92.862 Y116.097 E.01452
G1 X87.624 Y110.858 E.22122
G1 X87.624 Y110.323 E.01596
G1 X92.913 Y115.613 E.22337
G1 X92.926 Y115.493 E.00359
G1 X93.073 Y115.238 E.0088
G1 X87.624 Y109.789 E.23012
G1 X87.624 Y109.254 E.01596
G1 X93.269 Y114.899 E.23838
G1 X93.465 Y114.56 E.01169
G1 X87.624 Y108.72 E.24665
G1 X87.624 Y108.185 E.01596
G1 X93.66 Y114.221 E.25491
G1 X93.748 Y114.068 E.00527
G1 X93.918 Y113.945 E.00627
G1 X87.624 Y107.65 E.26581
G1 X87.624 Y107.116 E.01596
G1 X94.228 Y113.72 E.27889
G1 X94.538 Y113.495 E.01143
G1 X87.624 Y106.581 E.29196
G1 X87.624 Y106.047 E.01596
G1 X94.847 Y113.27 E.30504
G1 X95.079 Y113.102 E.00856
G1 X95.19 Y113.078 E.00337
G1 X87.624 Y105.512 E.3195
G1 X87.624 Y104.977 E.01596
G1 X95.631 Y112.984 E.33812
G1 X96.072 Y112.891 E.01346
G1 X87.624 Y104.443 E.35674
G1 X87.624 Y103.908 E.01596
G1 X96.512 Y112.797 E.37536
G1 X96.689 Y112.759 E.00537
G1 X97.096 Y112.846 E.01245
G1 X87.624 Y103.374 E.40001
G1 X87.624 Y102.839 E.01596
G1 X97.995 Y113.211 E.43798
; WIPE_START
G1 X96.581 Y111.797 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.441 Y119.343 Z1.1 F15000
G1 X95.318 Y120.156 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F4800
G1 X105.753 Y130.591 E.44067
G1 X105.753 Y130.056 E.01596
G1 X96.282 Y120.585 E.39994
G1 X96.817 Y120.585 E.01596
G1 X105.753 Y129.522 E.37737
G1 X105.753 Y128.987 E.01596
G1 X97.351 Y120.585 E.35479
G1 X97.511 Y120.585 E.00477
G1 X97.77 Y120.47 E.00848
G1 X105.753 Y128.453 E.3371
G1 X105.753 Y127.918 E.01596
G1 X98.14 Y120.305 E.32148
G1 X98.51 Y120.141 E.01209
G1 X105.753 Y127.383 E.30586
G1 X105.753 Y126.849 E.01596
G1 X98.88 Y119.976 E.29024
G1 X99.014 Y119.916 E.00437
G1 X99.176 Y119.737 E.00722
G1 X105.753 Y126.314 E.27776
G1 X105.753 Y125.78 E.01596
G1 X99.429 Y119.455 E.26706
G1 X99.682 Y119.174 E.0113
G1 X105.753 Y125.245 E.25637
G1 X105.753 Y124.711 E.01596
G1 X99.935 Y118.893 E.24567
G1 X100.115 Y118.694 E.008
G1 X100.153 Y118.576 E.0037
G1 X105.753 Y124.176 E.23649
G1 X105.753 Y123.641 E.01596
G1 X100.284 Y118.172 E.23095
G1 X100.415 Y117.769 E.01267
G1 X105.753 Y123.107 E.22541
G1 X105.753 Y122.572 E.01596
G1 X100.546 Y117.365 E.21988
G1 X100.623 Y117.129 E.00741
G1 X100.597 Y116.881 E.00744
G1 X105.753 Y122.038 E.21774
G1 X105.753 Y121.503 E.01596
G1 X100.534 Y116.284 E.22039
G1 X100.471 Y115.687 E.01794
G1 X105.753 Y120.968 E.22304
G1 X105.753 Y120.434 E.01596
G1 X87.624 Y102.304 E.76558
G1 X87.624 Y101.77 E.01596
G1 X105.753 Y119.899 E.76558
G1 X105.753 Y119.365 E.01596
G1 X87.624 Y101.235 E.76558
G1 X87.624 Y100.701 E.01596
G1 X105.753 Y118.83 E.76558
G1 X105.753 Y118.295 E.01596
G1 X87.624 Y100.166 E.76558
G1 X87.624 Y99.632 E.01596
G1 X105.753 Y117.761 E.76558
G1 X105.753 Y117.226 E.01596
G1 X87.624 Y99.097 E.76558
G1 X87.624 Y98.562 E.01596
G1 X105.753 Y116.692 E.76558
G1 X105.753 Y116.157 E.01596
G1 X87.624 Y98.028 E.76558
G1 X87.624 Y97.493 E.01596
G1 X105.753 Y115.623 E.76558
G1 X105.753 Y115.088 E.01596
G1 X87.624 Y96.959 E.76558
G1 X87.624 Y96.424 E.01596
G1 X105.753 Y114.553 E.76558
G1 X105.753 Y114.019 E.01596
G1 X87.624 Y95.889 E.76558
G1 X87.624 Y95.355 E.01596
G1 X105.753 Y113.484 E.76558
G1 X105.753 Y112.95 E.01596
G1 X87.624 Y94.82 E.76558
G1 X87.624 Y94.286 E.01596
G1 X105.753 Y112.415 E.76558
G1 X105.753 Y111.88 E.01596
G1 X87.624 Y93.751 E.76558
G1 X87.624 Y93.216 E.01596
G1 X105.753 Y111.346 E.76558
G1 X105.753 Y110.811 E.01596
G1 X87.624 Y92.682 E.76558
G1 X87.624 Y92.147 E.01596
G1 X105.753 Y110.277 E.76558
G1 X105.753 Y109.742 E.01596
G1 X87.624 Y91.613 E.76558
G1 X87.624 Y91.078 E.01596
G1 X105.753 Y109.208 E.76558
G1 X105.753 Y108.673 E.01596
G1 X87.624 Y90.544 E.76558
G1 X87.624 Y90.009 E.01596
G1 X105.753 Y108.138 E.76558
G1 X105.753 Y107.604 E.01596
G1 X87.624 Y89.474 E.76558
G1 X87.624 Y88.94 E.01596
G1 X105.753 Y107.069 E.76558
G1 X105.753 Y106.535 E.01596
G1 X87.624 Y88.405 E.76558
G1 X87.624 Y87.871 E.01596
G1 X105.753 Y106 E.76558
G1 X105.753 Y105.465 E.01596
G1 X87.624 Y87.336 E.76558
G1 X87.624 Y86.801 E.01596
G1 X105.753 Y104.931 E.76558
G1 X105.753 Y104.396 E.01596
G1 X87.624 Y86.267 E.76558
G1 X87.624 Y85.732 E.01596
G1 X105.753 Y103.862 E.76558
G1 X105.753 Y103.327 E.01596
G1 X87.624 Y85.198 E.76558
G1 X87.624 Y84.663 E.01596
G1 X105.753 Y102.792 E.76558
G1 X105.753 Y102.258 E.01596
G1 X87.624 Y84.129 E.76558
G1 X87.624 Y83.594 E.01596
G1 X105.753 Y101.723 E.76558
G1 X105.753 Y101.189 E.01596
G1 X87.624 Y83.059 E.76558
G1 X87.624 Y82.525 E.01596
G1 X105.753 Y100.654 E.76558
G1 X105.753 Y100.12 E.01596
G1 X87.624 Y81.99 E.76558
G1 X87.624 Y81.456 E.01596
G1 X105.753 Y99.585 E.76558
G1 X105.753 Y99.05 E.01596
G1 X87.624 Y80.921 E.76558
G1 X87.624 Y80.386 E.01596
G1 X105.753 Y98.516 E.76558
G1 X105.753 Y97.981 E.01596
G1 X87.624 Y79.852 E.76558
G1 X87.624 Y79.317 E.01596
G1 X105.753 Y97.447 E.76558
G1 X105.753 Y96.912 E.01596
G1 X87.624 Y78.783 E.76558
G1 X87.624 Y78.248 E.01596
G1 X105.753 Y96.377 E.76558
G1 X105.753 Y95.843 E.01596
G1 X87.624 Y77.713 E.76558
G1 X87.624 Y77.179 E.01596
G1 X105.753 Y95.308 E.76558
G1 X105.753 Y94.774 E.01596
G1 X87.624 Y76.644 E.76558
M73 P40 R25
G1 X87.624 Y76.11 E.01596
G1 X105.753 Y94.239 E.76558
G1 X105.753 Y93.704 E.01596
G1 X87.624 Y75.575 E.76558
G1 X87.624 Y75.041 E.01596
G1 X105.753 Y93.17 E.76558
G1 X105.753 Y92.635 E.01596
G1 X87.624 Y74.506 E.76558
G1 X87.624 Y73.971 E.01596
G1 X105.753 Y92.101 E.76558
G1 X105.753 Y91.566 E.01596
G1 X87.624 Y73.437 E.76558
G1 X87.624 Y72.902 E.01596
G1 X105.753 Y91.032 E.76558
G1 X105.753 Y90.497 E.01596
G1 X87.624 Y72.368 E.76558
G1 X87.624 Y71.833 E.01596
G1 X105.753 Y89.962 E.76558
G1 X105.753 Y89.428 E.01596
G1 X87.624 Y71.298 E.76558
G1 X87.624 Y70.764 E.01596
G1 X105.753 Y88.893 E.76558
G1 X105.753 Y88.359 E.01596
G1 X87.624 Y70.229 E.76558
G1 X87.624 Y69.695 E.01596
G1 X105.753 Y87.824 E.76558
G1 X105.753 Y87.289 E.01596
G1 X87.624 Y69.16 E.76558
G1 X87.624 Y68.625 E.01596
G1 X105.923 Y86.925 E.77274
; WIPE_START
G1 X104.509 Y85.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.843 Y77.885 Z1.1 F15000
G1 X105.923 Y53.246 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F4800
G1 X105.328 Y52.651 E.02511
G1 X104.794 Y52.651 E.01596
G1 X105.753 Y53.61 E.04052
G1 X105.753 Y54.145 E.01596
G1 X104.259 Y52.651 E.06309
G1 X103.725 Y52.651 E.01596
G1 X105.753 Y54.68 E.08567
G1 X105.753 Y55.214 E.01596
G1 X103.19 Y52.651 E.10824
G1 X102.655 Y52.651 E.01596
G1 X105.753 Y55.749 E.13082
G1 X105.753 Y56.283 E.01596
G1 X102.121 Y52.651 E.15339
G1 X101.586 Y52.651 E.01596
G1 X105.753 Y56.818 E.17597
G1 X105.753 Y57.353 E.01596
G1 X101.052 Y52.651 E.19854
G1 X100.517 Y52.651 E.01596
G1 X105.753 Y57.887 E.22112
G1 X105.753 Y58.422 E.01596
G1 X99.982 Y52.651 E.24369
G1 X99.448 Y52.651 E.01596
G1 X105.753 Y58.956 E.26627
G1 X105.753 Y59.491 E.01596
G1 X98.913 Y52.651 E.28884
G1 X98.379 Y52.651 E.01596
G1 X105.753 Y60.026 E.31142
G1 X105.753 Y60.56 E.01596
G1 X97.844 Y52.651 E.33399
G1 X97.309 Y52.651 E.01596
G1 X105.753 Y61.095 E.35656
G1 X105.753 Y61.629 E.01596
G1 X96.775 Y52.651 E.37914
G1 X96.24 Y52.651 E.01596
G1 X105.753 Y62.164 E.40171
G1 X105.753 Y62.698 E.01596
G1 X95.706 Y52.651 E.42429
G1 X95.171 Y52.651 E.01596
G1 X105.753 Y63.233 E.44686
G1 X105.753 Y63.768 E.01596
G1 X94.637 Y52.651 E.46944
G1 X94.102 Y52.651 E.01596
G1 X105.753 Y64.302 E.49201
G1 X105.753 Y64.837 E.01596
G1 X93.567 Y52.651 E.51459
G1 X93.033 Y52.651 E.01596
G1 X105.753 Y65.371 E.53716
G1 X105.753 Y65.906 E.01596
G1 X92.498 Y52.651 E.55974
G1 X91.964 Y52.651 E.01596
G1 X105.753 Y66.441 E.58231
G1 X105.753 Y66.975 E.01596
G1 X91.429 Y52.651 E.60489
G1 X90.894 Y52.651 E.01596
G1 X105.753 Y67.51 E.62746
G1 X105.753 Y68.044 E.01596
G1 X90.36 Y52.651 E.65004
G1 X89.825 Y52.651 E.01596
G1 X105.753 Y68.579 E.67261
G1 X105.753 Y69.113 E.01596
G1 X89.291 Y52.651 E.69519
G1 X88.756 Y52.651 E.01596
G1 X105.753 Y69.648 E.71776
G1 X105.753 Y70.183 E.01596
G1 X88.221 Y52.651 E.74034
G1 X87.687 Y52.651 E.01596
G1 X105.753 Y70.717 E.76291
G1 X105.753 Y71.252 E.01596
G1 X87.624 Y53.122 E.76558
G1 X87.624 Y53.657 E.01596
G1 X105.753 Y71.786 E.76558
G1 X105.753 Y72.321 E.01596
G1 X87.624 Y54.192 E.76558
G1 X87.624 Y54.726 E.01596
G1 X105.753 Y72.856 E.76558
G1 X105.753 Y73.39 E.01596
G1 X87.624 Y55.261 E.76558
G1 X87.624 Y55.795 E.01596
G1 X105.753 Y73.925 E.76558
G1 X105.753 Y74.459 E.01596
G1 X87.624 Y56.33 E.76558
G1 X87.624 Y56.865 E.01596
G1 X105.753 Y74.994 E.76558
G1 X105.753 Y75.529 E.01596
G1 X100.087 Y69.862 E.23929
G1 X100.451 Y70.493 E.02176
G1 X100.483 Y70.792 E.00899
G1 X105.753 Y76.063 E.22257
G1 X105.753 Y76.598 E.01596
G1 X100.545 Y71.39 E.21992
G1 X100.608 Y71.987 E.01794
G1 X105.753 Y77.132 E.21727
G1 X105.753 Y77.667 E.01596
G1 X100.523 Y72.437 E.22086
G1 X100.392 Y72.84 E.01267
M73 P40 R24
G1 X105.753 Y78.201 E.22639
G1 X105.753 Y78.736 E.01596
G1 X100.261 Y73.244 E.23193
G1 X100.13 Y73.647 E.01267
G1 X105.753 Y79.271 E.23747
G1 X105.753 Y79.805 E.01596
G1 X99.891 Y73.943 E.24757
G1 X99.637 Y74.224 E.0113
G1 X105.753 Y80.34 E.25826
G1 X105.753 Y80.874 E.01596
G1 X99.384 Y74.505 E.26896
G1 X99.131 Y74.787 E.0113
G1 X105.753 Y81.409 E.27966
G1 X105.753 Y81.944 E.01596
G1 X98.815 Y75.005 E.293
G1 X98.445 Y75.17 E.01209
G1 X105.753 Y82.478 E.30862
G1 X105.753 Y83.013 E.01596
G1 X98.075 Y75.334 E.32424
G1 X97.705 Y75.499 E.01209
G1 X105.753 Y83.547 E.33986
G1 X105.753 Y84.082 E.01596
G1 X97.257 Y75.585 E.35879
G1 X96.722 Y75.585 E.01596
G1 X105.753 Y84.617 E.38137
G1 X105.753 Y85.151 E.01596
G1 X96.188 Y75.585 E.40394
G1 X95.866 Y75.585 E.0096
G1 X95.482 Y75.415 E.01255
G1 X105.753 Y85.686 E.43374
G1 X105.753 Y86.22 E.01596
G1 X87.624 Y68.091 E.76558
G1 X87.624 Y67.556 E.01596
G1 X93.022 Y72.955 E.22796
G1 X92.765 Y72.163 E.02486
G1 X87.624 Y67.022 E.2171
G1 X87.624 Y66.487 E.01596
G1 X92.803 Y71.666 E.21869
G1 X92.853 Y71.182 E.01452
G1 X87.624 Y65.953 E.22084
G1 X87.624 Y65.418 E.01596
G1 X92.904 Y70.698 E.22299
G1 X92.926 Y70.493 E.00616
G1 X93.039 Y70.298 E.00673
G1 X87.624 Y64.883 E.22866
G1 X87.624 Y64.349 E.01596
G1 X93.234 Y69.959 E.23692
G1 X93.43 Y69.62 E.01169
G1 X87.624 Y63.814 E.24518
G1 X87.624 Y63.28 E.01596
G1 X93.626 Y69.281 E.25344
G1 X93.748 Y69.068 E.00734
G1 X93.864 Y68.985 E.00425
G1 X87.624 Y62.745 E.2635
G1 X87.624 Y62.21 E.01596
G1 X94.173 Y68.76 E.27657
G1 X94.483 Y68.535 E.01143
G1 X87.624 Y61.676 E.28965
G1 X87.624 Y61.141 E.01596
G1 X94.792 Y68.31 E.30272
G1 X95.079 Y68.102 E.01059
G1 X95.112 Y68.095 E.00099
G1 X87.624 Y60.607 E.3162
G1 X87.624 Y60.072 E.01596
M73 P41 R24
G1 X95.553 Y68.001 E.33482
G1 X95.993 Y67.907 E.01346
G1 X87.624 Y59.538 E.35344
G1 X87.624 Y59.003 E.01596
G1 X96.434 Y67.813 E.37206
G1 X96.689 Y67.759 E.00776
G1 X96.976 Y67.821 E.00878
G1 X87.624 Y58.468 E.39493
G1 X87.624 Y57.934 E.01596
G1 X97.655 Y67.965 E.4236
G1 X98.298 Y68.101 E.01962
G1 X98.402 Y68.177 E.00385
G1 X87.454 Y57.229 E.46231
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4800
G1 X88.868 Y58.644 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 4/20
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S51
G17
G3 Z1.1 I1.217 J0 P1  F15000
; object ids of layer 4 start: 138,178
M624 AwAAAAAAAAA=
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
; object ids of this layer4 end: 138,178
M625
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X207.791 Y176.452
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X207.791 Y177.256 E.02586
G1 X154.995 Y177.256 E1.69772
G1 X154.995 Y176.452 E.02586
G1 X207.731 Y176.452 E1.69579
M204 S250
G1 X208.183 Y176.059 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X208.183 Y177.648 E.04731
G1 X154.603 Y177.648 E1.59597
G1 X154.603 Y176.059 E.04731
G1 X208.123 Y176.059 E1.59418
M204 S5000
G1 X207.588 Y176.854 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.44001
G1 F7500
G1 X155.199 Y176.854 E1.64329
; WIPE_START
G1 X157.199 Y176.854 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.931 Y169.727 Z1.3 F15000
G1 X199.603 Y66.256 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X199.995 Y66.256 E.01261
G1 X199.995 Y91.256 E.80391
G1 X200.791 Y91.256 E.02559
G1 X200.791 Y66.256 E.80391
G1 X206.995 Y66.256 E.1995
G1 X206.995 Y172.46 E3.41514
G1 X155.791 Y172.46 E1.64654
G1 X155.791 Y66.256 E3.41514
G1 X161.995 Y66.256 E.1995
G1 X161.995 Y91.256 E.80391
G1 X162.791 Y91.256 E.02559
G1 X162.791 Y66.256 E.80391
G1 X199.543 Y66.256 E1.18181
M204 S250
G1 X199.603 Y66.648 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X199.603 Y91.648 E.74466
G1 X201.183 Y91.648 E.04706
G1 X201.183 Y66.648 E.74466
G1 X206.603 Y66.648 E.16144
G1 X206.603 Y172.068 E3.1401
G1 X156.183 Y172.068 E1.50184
G1 X156.183 Y66.648 E3.1401
G1 X161.603 Y66.648 E.16144
G1 X161.603 Y91.648 E.74466
G1 X163.183 Y91.648 E.04706
G1 X163.183 Y66.648 E.74466
G1 X199.543 Y66.648 E1.08304
; WIPE_START
M204 S5000
G1 X199.548 Y68.648 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.148 Y76.257 Z1.3 F15000
G1 X207.791 Y173.247 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X154.995 Y173.247 E1.69772
G1 X154.995 Y65.46 E3.46605
G1 X207.791 Y65.46 E1.69772
G1 X207.791 Y173.187 E3.46412
M204 S250
G1 X208.183 Y173.639 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X154.603 Y173.639 E1.59597
G1 X154.603 Y65.068 E3.23398
G1 X208.183 Y65.068 E1.59597
G1 X208.183 Y173.579 E3.23219
; WIPE_START
M204 S5000
G1 X206.183 Y173.582 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.281 Y172.836 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.467256
G1 F7500
G1 X207.362 Y172.818 E.0028
G1 X207.393 Y172.663 E.0053
; LINE_WIDTH: 0.43172
G1 X207.393 Y66.052 E3.27429
; LINE_WIDTH: 0.448395
G1 X207.377 Y65.972 E.00263
; LINE_WIDTH: 0.470635
G1 X207.36 Y65.891 E.00278
G1 X207.199 Y65.858 E.00556
; LINE_WIDTH: 0.43172
G1 X200.588 Y65.858 E.20305
; LINE_WIDTH: 0.45602
G1 X200.491 Y65.882 E.00327
; LINE_WIDTH: 0.50462
G1 X200.393 Y65.906 E.00365
; WIPE_START
G1 X200.491 Y65.882 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.461 Y73.514 Z1.3 F15000
G1 X200.393 Y90.858 Z1.3
G1 Z.9
G1 E.8 F1800
; LINE_WIDTH: 0.43172
G1 F7500
G1 X200.393 Y66.052 E.76184
; LINE_WIDTH: 0.45602
G1 X200.393 Y65.979 E.00238
; LINE_WIDTH: 0.486803
G1 X200.393 Y65.906 E.00256
G1 X200.199 Y65.858 E.00703
; LINE_WIDTH: 0.43172
G1 X162.588 Y65.858 E1.15513
; LINE_WIDTH: 0.45602
G1 X162.491 Y65.882 E.00327
; LINE_WIDTH: 0.490218
G1 X162.393 Y65.906 E.00354
G1 X162.393 Y66.052 E.00515
; LINE_WIDTH: 0.43172
G1 X162.393 Y90.858 E.76184
; WIPE_START
G1 X162.393 Y88.858 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X162.393 Y81.225 Z1.3 F15000
G1 X162.393 Y65.906 Z1.3
G1 Z.9
G1 E.8 F1800
; LINE_WIDTH: 0.50462
G1 F7500
G1 X162.296 Y65.882 E.00365
; LINE_WIDTH: 0.432083
G1 X162.199 Y65.858 E.00308
G1 X155.588 Y65.858 E.20324
; LINE_WIDTH: 0.448395
G1 X155.507 Y65.874 E.00263
; LINE_WIDTH: 0.470635
G1 X155.427 Y65.891 E.00278
G1 X155.393 Y66.052 E.00556
; LINE_WIDTH: 0.43172
G1 X155.393 Y172.663 E3.27429
; LINE_WIDTH: 0.44718
G1 X155.409 Y172.741 E.00252
; LINE_WIDTH: 0.464734
G1 X155.424 Y172.818 E.00263
G1 X155.588 Y172.854 E.00557
; LINE_WIDTH: 0.42329
G1 X207.199 Y172.854 E1.55074
; LINE_WIDTH: 0.440865
G1 X207.281 Y172.836 E.00263
; OBJECT_ID: 178
; WIPE_START
G1 X207.199 Y172.854 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X200.491 Y169.213 Z1.3 F15000
G1 X99.414 Y114.364 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X100.127 Y115.598 E.04583
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X96.319 Y113.179 E.03621
G1 X96.688 Y113.1 E.01214
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.384 Y114.312 E.00058
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X96.401 Y113.562 E.03106
G1 X96.688 Y113.501 E.00876
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52888
G1 X99.809 Y116.327 E-.23112
; WIPE_END
G1 E-.04 F1800
M73 P42 R24
G1 X99.355 Y108.708 Z1.3 F15000
G1 X97.362 Y75.252 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X95.937 Y75.252 E.04584
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X96.319 Y68.179 E.03621
G1 X96.688 Y68.1 E.01214
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04835
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.422 Y75.252 E.00058
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X96.401 Y68.562 E.03106
G1 X96.688 Y68.501 E.00876
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X95.753 Y82.24 Z1.3 F15000
G1 X98.866 Y164.583 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.814 Y164.641 E.00251
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04834
G1 X96.319 Y158.179 E.03621
G1 X96.688 Y158.1 E.01214
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04834
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.906 Y164.538 E.04391
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X96.401 Y158.562 E.03106
G1 X96.688 Y158.501 E.00876
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X100.551 Y171.478 Z1.3 F15000
G1 X106.086 Y181.114 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y52.318 E4.14161
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y181.054 E4.13968
M204 S250
G1 X106.478 Y181.506 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y51.926 E3.85975
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y181.446 E3.85796
; WIPE_START
M204 S5000
G1 X104.478 Y181.452 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.094 Y180.949 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y180.304 E.0293
G1 X105.738 Y179.726 E.01861
G1 X104.698 Y180.765 E.04729
G1 X104.12 Y180.765 E.01861
G1 X105.738 Y179.147 E.0736
G1 X105.738 Y178.568 E.01861
G1 X103.541 Y180.765 E.09992
G1 X102.962 Y180.765 E.01861
G1 X105.738 Y177.989 E.12624
G1 X105.738 Y177.411 E.01861
G1 X102.383 Y180.765 E.15256
G1 X101.805 Y180.765 E.01861
G1 X105.738 Y176.832 E.17888
G1 X105.738 Y176.253 E.01861
G1 X101.226 Y180.765 E.2052
G1 X100.647 Y180.765 E.01861
G1 X105.738 Y175.674 E.23151
G1 X105.738 Y175.096 E.01861
G1 X100.069 Y180.765 E.25783
G1 X99.49 Y180.765 E.01861
G1 X105.738 Y174.517 E.28415
G1 X105.738 Y173.938 E.01861
G1 X98.911 Y180.765 E.31047
G1 X98.332 Y180.765 E.01861
G1 X105.738 Y173.36 E.33679
G1 X105.738 Y172.781 E.01861
G1 X97.754 Y180.765 E.3631
G1 X97.175 Y180.765 E.01861
G1 X105.738 Y172.202 E.38942
G1 X105.738 Y171.623 E.01861
G1 X96.596 Y180.765 E.41574
G1 X96.017 Y180.765 E.01861
G1 X105.738 Y171.045 E.44206
G1 X105.738 Y170.466 E.01861
G1 X95.439 Y180.765 E.46838
G1 X94.86 Y180.765 E.01861
G1 X105.738 Y169.887 E.49469
G1 X105.738 Y169.308 E.01861
G1 X94.281 Y180.765 E.52101
G1 X93.703 Y180.765 E.01861
G1 X105.738 Y168.73 E.54733
G1 X105.738 Y168.151 E.01861
G1 X93.124 Y180.765 E.57365
G1 X92.545 Y180.765 E.01861
G1 X105.738 Y167.572 E.59997
G1 X105.738 Y166.994 E.01861
G1 X91.966 Y180.765 E.62628
G1 X91.388 Y180.765 E.01861
G1 X105.738 Y166.415 E.6526
G1 X105.738 Y165.836 E.01861
G1 X90.809 Y180.765 E.67892
G1 X90.23 Y180.765 E.01861
G1 X105.738 Y165.257 E.70524
G1 X105.738 Y164.679 E.01861
G1 X89.651 Y180.765 E.73156
G1 X89.073 Y180.765 E.01861
G1 X105.738 Y164.1 E.75787
G1 X105.738 Y163.521 E.01861
G1 X88.494 Y180.765 E.78419
G1 X87.915 Y180.765 E.01861
G1 X105.738 Y162.943 E.81051
G1 X105.738 Y162.364 E.01861
G1 X87.639 Y180.463 E.82309
G1 X87.639 Y179.884 E.01861
G1 X105.738 Y161.785 E.82309
G1 X105.738 Y161.206 E.01861
G1 X87.639 Y179.306 E.82309
G1 X87.639 Y178.727 E.01861
G1 X105.738 Y160.628 E.82309
G1 X105.738 Y160.049 E.01861
G1 X87.639 Y178.148 E.82309
G1 X87.639 Y177.57 E.01861
G1 X105.738 Y159.47 E.82309
G1 X105.738 Y158.891 E.01861
G1 X87.639 Y176.991 E.82309
G1 X87.639 Y176.412 E.01861
G1 X105.738 Y158.313 E.82309
G1 X105.738 Y157.734 E.01861
G1 X100.3 Y163.172 E.24731
G1 X100.578 Y162.315 E.02899
G1 X105.738 Y157.155 E.23464
G1 X105.738 Y156.577 E.01861
G1 X100.595 Y161.72 E.23389
G1 X100.54 Y161.196 E.01693
G1 X105.738 Y155.998 E.23639
G1 X105.738 Y155.419 E.01861
G1 X100.485 Y160.672 E.23889
G2 X100.328 Y160.25 I-.552 J-.035 E.01491
G1 X105.738 Y154.84 E.24602
G1 X105.738 Y154.262 E.01861
G1 X100.116 Y159.883 E.25566
G1 X99.905 Y159.517 E.01362
G1 X105.738 Y153.683 E.26529
G1 X105.738 Y153.104 E.01861
G1 X99.693 Y159.15 E.27492
G2 X99.388 Y158.875 I-.46 J.205 E.01357
G1 X105.738 Y152.525 E.28877
G1 X105.738 Y151.947 E.01861
G1 X99.053 Y158.632 E.30401
G1 X98.718 Y158.388 E.01332
G1 X105.738 Y151.368 E.31925
G1 X105.738 Y150.789 E.01861
G1 X98.383 Y158.145 E.3345
G2 X97.939 Y158.01 I-.373 J.431 E.01536
G1 X105.738 Y150.211 E.35468
G1 X105.738 Y149.632 E.01861
G1 X97.462 Y157.908 E.37639
G1 X96.984 Y157.807 E.01569
G1 X105.738 Y149.053 E.39809
G1 X105.738 Y148.474 E.01861
G1 X96.409 Y157.804 E.42425
G1 X95.674 Y157.96 E.02416
G1 X105.738 Y147.896 E.45767
G1 X105.738 Y147.317 E.01861
G1 X87.639 Y165.416 E.82309
G1 X87.639 Y165.995 E.01861
G1 X92.884 Y160.75 E.23852
G1 X92.816 Y161.397 E.02091
G1 X87.639 Y166.574 E.23543
G1 X87.639 Y167.152 E.01861
G1 X92.748 Y162.043 E.23234
G2 X92.861 Y162.509 I.579 J.105 E.01586
G1 X87.639 Y167.731 E.2375
G1 X87.639 Y168.31 E.01861
G1 X93.003 Y162.945 E.24396
G1 X93.145 Y163.382 E.01477
G1 X87.639 Y168.889 E.25041
G1 X87.639 Y169.467 E.01861
G1 X93.323 Y163.783 E.25849
G1 X93.597 Y164.088 E.01318
G1 X87.639 Y170.046 E.27095
G1 X87.639 Y170.625 E.01861
G1 X93.871 Y164.392 E.28342
G1 X94.145 Y164.697 E.01318
G1 X87.639 Y171.204 E.29589
G1 X87.639 Y171.782 E.01861
G1 X94.45 Y164.971 E.30973
G1 X94.85 Y165.15 E.0141
G1 X87.639 Y172.361 E.32794
G1 X87.639 Y172.94 E.01861
G1 X95.251 Y165.328 E.34615
G1 X95.651 Y165.506 E.0141
G1 X87.639 Y173.518 E.36436
G1 X87.639 Y174.097 E.01861
G1 X96.136 Y165.6 E.3864
G1 X96.714 Y165.6 E.01861
G1 X87.639 Y174.676 E.41271
G1 X87.639 Y175.255 E.01861
G1 X97.293 Y165.6 E.43903
G1 X97.514 Y165.6 E.00712
G1 X98.159 Y165.314 E.02268
G1 X87.456 Y176.017 E.48673
; WIPE_START
G1 X88.87 Y174.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.755 Y167.052 Z1.3 F15000
G1 X87.456 Y165.021 Z1.3
G1 Z.9
G1 E.8 F1800
G1 F7800
G1 X105.738 Y146.738 E.83142
G1 X105.738 Y146.16 E.01861
G1 X87.639 Y164.259 E.82309
G1 X87.639 Y163.68 E.01861
G1 X105.738 Y145.581 E.82309
G1 X105.738 Y145.321 E.00835
G1 X105.419 Y145.321 E.01026
G1 X87.639 Y163.101 E.80858
G1 X87.639 Y162.523 E.01861
G1 X104.841 Y145.321 E.78226
G1 X104.262 Y145.321 E.01861
G1 X87.639 Y161.944 E.75595
G1 X87.639 Y161.365 E.01861
G1 X103.683 Y145.321 E.72963
G1 X103.104 Y145.321 E.01861
G1 X87.639 Y160.787 E.70331
G1 X87.639 Y160.208 E.01861
G1 X102.526 Y145.321 E.67699
G1 X101.947 Y145.321 E.01861
G1 X87.639 Y159.629 E.65067
G1 X87.639 Y159.05 E.01861
G1 X101.368 Y145.321 E.62436
G1 X100.789 Y145.321 E.01861
G1 X87.639 Y158.472 E.59804
G1 X87.639 Y157.893 E.01861
G1 X100.211 Y145.321 E.57172
G1 X99.632 Y145.321 E.01861
G1 X87.639 Y157.314 E.5454
G1 X87.639 Y156.735 E.01861
G1 X99.053 Y145.321 E.51908
G1 X98.475 Y145.321 E.01861
G1 X87.639 Y156.157 E.49277
G1 X87.639 Y155.578 E.01861
G1 X97.896 Y145.321 E.46645
G1 X97.317 Y145.321 E.01861
G1 X87.639 Y154.999 E.44013
G1 X87.639 Y154.421 E.01861
G1 X96.738 Y145.321 E.41381
G1 X96.16 Y145.321 E.01861
G1 X87.639 Y153.842 E.38749
G1 X87.639 Y153.263 E.01861
G1 X95.581 Y145.321 E.36118
G1 X95.002 Y145.321 E.01861
G1 X87.639 Y152.684 E.33486
G1 X87.639 Y152.106 E.01861
G1 X94.423 Y145.321 E.30854
G1 X93.845 Y145.321 E.01861
G1 X87.639 Y151.527 E.28222
G1 X87.639 Y150.948 E.01861
G1 X93.266 Y145.321 E.2559
G1 X92.687 Y145.321 E.01861
G1 X87.639 Y150.369 E.22958
G1 X87.639 Y149.791 E.01861
G1 X92.109 Y145.321 E.20327
G1 X91.53 Y145.321 E.01861
G1 X87.639 Y149.212 E.17695
G1 X87.639 Y148.633 E.01861
G1 X90.951 Y145.321 E.15063
G1 X90.372 Y145.321 E.01861
G1 X87.639 Y148.055 E.12431
G1 X87.639 Y147.476 E.01861
G1 X89.794 Y145.321 E.09799
G1 X89.215 Y145.321 E.01861
G1 X87.639 Y146.897 E.07168
G1 X87.639 Y146.318 E.01861
G1 X88.636 Y145.321 E.04536
G1 X88.057 Y145.321 E.01861
G1 X87.456 Y145.923 E.02737
; WIPE_START
G1 X88.057 Y145.321 E-.32345
G1 X88.636 Y145.321 E-.21992
G1 X88.233 Y145.724 E-.21663
; WIPE_END
G1 E-.04 F1800
G1 X89.638 Y142.457 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55945
G1 F4800
G1 X89.638 Y142.974 E.02108
G1 X103.739 Y142.974 E.57538
G1 X103.739 Y142.457 E.02108
G1 X89.698 Y142.457 E.57293
G1 X89.191 Y142.011 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X89.191 Y143.421 E.042
G1 X104.186 Y143.421 E.44664
G1 X104.186 Y142.011 E.042
G1 X89.251 Y142.011 E.44486
M73 P43 R24
G1 X88.814 Y141.634 F15000
G1 F4800
G1 X88.814 Y143.798 E.06446
G1 X104.563 Y143.798 E.46911
G1 X104.563 Y141.634 E.06446
G1 X88.874 Y141.634 E.46732
G1 X88.437 Y141.256 F15000
G1 F4800
G1 X88.437 Y144.175 E.08693
G1 X104.94 Y144.175 E.49157
G1 X104.94 Y141.256 E.08693
G1 X88.497 Y141.256 E.48978
G1 X88.06 Y140.879 F15000
G1 F4800
G1 X88.06 Y144.552 E.10939
G1 X105.317 Y144.552 E.51403
G1 X105.317 Y140.879 E.10939
G1 X88.12 Y140.879 E.51225
G1 X87.683 Y140.502 F15000
G1 F4800
G1 X87.683 Y144.929 E.13185
G1 X105.694 Y144.929 E.5365
G1 X105.694 Y140.502 E.13185
G1 X87.743 Y140.502 E.53471
; WIPE_START
G1 X89.743 Y140.502 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.456 Y138.921 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X88.055 Y138.321 E.02728
G1 X88.633 Y138.321 E.01857
G1 X87.639 Y139.315 E.04521
G1 X87.639 Y139.893 E.01857
G1 X89.21 Y138.321 E.07147
G1 X89.788 Y138.321 E.01857
G1 X87.998 Y140.11 E.08137
G1 X88.576 Y140.11 E.01857
G1 X90.365 Y138.321 E.08137
G1 X90.943 Y138.321 E.01857
G1 X89.153 Y140.11 E.08137
G1 X89.731 Y140.11 E.01857
M73 P43 R23
G1 X91.52 Y138.321 E.08137
G1 X92.098 Y138.321 E.01857
G1 X90.308 Y140.11 E.08137
G1 X90.886 Y140.11 E.01857
G1 X92.675 Y138.321 E.08137
G1 X93.252 Y138.321 E.01857
G1 X91.463 Y140.11 E.08137
G1 X92.04 Y140.11 E.01857
G1 X93.83 Y138.321 E.08137
G1 X94.407 Y138.321 E.01857
G1 X92.618 Y140.11 E.08137
G1 X93.195 Y140.11 E.01857
G1 X94.985 Y138.321 E.08137
G1 X95.562 Y138.321 E.01857
G1 X93.773 Y140.11 E.08137
G1 X94.35 Y140.11 E.01857
G1 X96.14 Y138.321 E.08137
G1 X96.717 Y138.321 E.01857
G1 X94.928 Y140.11 E.08137
G1 X95.505 Y140.11 E.01857
G1 X97.294 Y138.321 E.08137
G1 X97.872 Y138.321 E.01857
G1 X96.083 Y140.11 E.08137
G1 X96.66 Y140.11 E.01857
G1 X98.449 Y138.321 E.08137
G1 X99.027 Y138.321 E.01857
G1 X97.237 Y140.11 E.08137
G1 X97.815 Y140.11 E.01857
G1 X99.604 Y138.321 E.08137
G1 X100.182 Y138.321 E.01857
G1 X98.392 Y140.11 E.08137
G1 X98.97 Y140.11 E.01857
G1 X100.759 Y138.321 E.08137
G1 X101.337 Y138.321 E.01857
G1 X99.547 Y140.11 E.08137
G1 X100.125 Y140.11 E.01857
G1 X101.914 Y138.321 E.08137
G1 X102.491 Y138.321 E.01857
G1 X100.702 Y140.11 E.08137
G1 X101.279 Y140.11 E.01857
G1 X103.069 Y138.321 E.08137
G1 X103.646 Y138.321 E.01857
G1 X101.857 Y140.11 E.08137
G1 X102.434 Y140.11 E.01857
G1 X104.224 Y138.321 E.08137
G1 X104.801 Y138.321 E.01857
G1 X103.012 Y140.11 E.08137
G1 X103.589 Y140.11 E.01857
G1 X105.379 Y138.321 E.08137
G1 X105.738 Y138.321 E.01156
G1 X105.738 Y138.539 E.00701
G1 X104.167 Y140.11 E.07147
G1 X104.744 Y140.11 E.01857
G1 X105.738 Y139.116 E.04521
G1 X105.738 Y139.694 E.01857
G1 X105.138 Y140.294 E.02728
; WIPE_START
G1 X105.738 Y139.694 E-.32234
G1 X105.738 Y139.116 E-.21943
G1 X105.332 Y139.522 E-.21824
; WIPE_END
G1 E-.04 F1800
G1 X103.739 Y135.457 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.559455
G1 F4800
G1 X89.638 Y135.457 E.57538
G1 X89.638 Y135.974 E.02108
G1 X103.739 Y135.974 E.57538
G1 X103.739 Y135.517 E.01863
G1 X104.186 Y135.011 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X89.191 Y135.011 E.44664
G1 X89.191 Y136.421 E.042
G1 X104.186 Y136.421 E.44664
G1 X104.186 Y135.071 E.04022
G1 X104.563 Y134.634 F15000
G1 F4800
G1 X88.814 Y134.634 E.46911
G1 X88.814 Y136.798 E.06446
G1 X104.563 Y136.798 E.46911
G1 X104.563 Y134.694 E.06268
G1 X104.94 Y134.256 F15000
G1 F4800
G1 X88.437 Y134.256 E.49157
G1 X88.437 Y137.175 E.08693
G1 X104.94 Y137.175 E.49157
G1 X104.94 Y134.316 E.08514
G1 X105.317 Y133.879 F15000
G1 F4800
G1 X88.06 Y133.879 E.51403
G1 X88.06 Y137.552 E.10939
G1 X105.317 Y137.552 E.51403
G1 X105.317 Y133.939 E.1076
G1 X105.694 Y133.502 F15000
G1 F4800
G1 X87.683 Y133.502 E.53649
G1 X87.683 Y137.929 E.13185
G1 X105.694 Y137.929 E.53649
G1 X105.694 Y133.562 E.13007
G1 X105.132 Y133.294 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y132.687 E.02758
G1 X105.738 Y132.105 E.01871
G1 X104.733 Y133.11 E.04571
G1 X104.151 Y133.11 E.01871
G1 X105.738 Y131.523 E.07217
G1 X105.738 Y130.941 E.01871
G1 X103.569 Y133.11 E.09863
G1 X102.987 Y133.11 E.01871
G1 X105.738 Y130.36 E.12509
G1 X105.738 Y129.778 E.01871
G1 X102.405 Y133.11 E.15156
G1 X101.824 Y133.11 E.01871
G1 X105.738 Y129.196 E.17802
G1 X105.738 Y128.614 E.01871
G1 X101.242 Y133.11 E.20448
G1 X100.66 Y133.11 E.01871
G1 X105.738 Y128.032 E.23094
G1 X105.738 Y127.45 E.01871
G1 X100.078 Y133.11 E.2574
G1 X99.496 Y133.11 E.01871
G1 X105.738 Y126.868 E.28386
G1 X105.738 Y126.286 E.01871
G1 X98.914 Y133.11 E.31032
G1 X98.332 Y133.11 E.01871
G1 X105.738 Y125.705 E.33679
G1 X105.738 Y125.123 E.01871
G1 X97.75 Y133.11 E.36325
G1 X97.169 Y133.11 E.01871
G1 X105.738 Y124.541 E.38971
G1 X105.738 Y123.959 E.01871
G1 X96.587 Y133.11 E.41617
G1 X96.005 Y133.11 E.01871
G1 X105.738 Y123.377 E.44263
G1 X105.738 Y122.795 E.01871
G1 X95.423 Y133.11 E.46909
G1 X94.841 Y133.11 E.01871
G1 X105.738 Y122.213 E.49556
G1 X105.738 Y121.631 E.01871
G1 X94.259 Y133.11 E.52202
G1 X93.677 Y133.11 E.01871
G1 X105.738 Y121.05 E.54848
G1 X105.738 Y120.468 E.01871
G1 X93.095 Y133.11 E.57494
G1 X92.514 Y133.11 E.01871
G1 X105.738 Y119.886 E.6014
G1 X105.738 Y119.304 E.01871
G1 X91.932 Y133.11 E.62786
G1 X91.35 Y133.11 E.01871
G1 X105.738 Y118.722 E.65432
G1 X105.738 Y118.14 E.01871
G1 X90.768 Y133.11 E.68079
G1 X90.186 Y133.11 E.01871
G1 X105.738 Y117.558 E.70725
G1 X105.738 Y116.976 E.01871
G1 X89.604 Y133.11 E.73371
G1 X89.022 Y133.11 E.01871
G1 X105.738 Y116.395 E.76017
G1 X105.738 Y115.813 E.01871
G1 X88.44 Y133.11 E.78663
G1 X87.859 Y133.11 E.01871
G1 X105.738 Y115.231 E.81309
G1 X105.738 Y114.649 E.01871
G1 X87.639 Y132.748 E.82309
G1 X87.639 Y132.166 E.01871
G1 X105.738 Y114.067 E.82309
G1 X105.738 Y113.485 E.01871
G1 X87.639 Y131.584 E.82309
G1 X87.639 Y131.003 E.01871
G1 X98.464 Y120.178 E.49227
G1 X97.459 Y120.6 E.03505
G1 X87.639 Y130.421 E.44659
G1 X87.639 Y129.839 E.01871
G1 X96.877 Y120.6 E.42012
G1 X96.295 Y120.6 E.01871
G1 X87.639 Y129.257 E.39366
G1 X87.639 Y128.675 E.01871
G1 X95.759 Y120.554 E.36929
G1 X95.357 Y120.375 E.01417
G1 X87.639 Y128.093 E.35098
G1 X87.639 Y127.511 E.01871
G1 X94.954 Y120.196 E.33267
G1 X94.552 Y120.017 E.01417
G1 X87.639 Y126.929 E.31436
G1 X87.639 Y126.348 E.01871
G1 X94.214 Y119.773 E.299
G1 X93.938 Y119.467 E.01325
G1 X87.639 Y125.766 E.28646
G1 X87.639 Y125.184 E.01871
G1 X93.662 Y119.16 E.27392
G1 X93.387 Y118.854 E.01325
G1 X87.639 Y124.602 E.26138
G1 X87.639 Y124.02 E.01871
G1 X93.177 Y118.481 E.25188
G1 X93.035 Y118.042 E.01485
G1 X87.639 Y123.438 E.24539
G1 X87.639 Y122.856 E.01871
G1 X92.892 Y117.603 E.2389
G1 X92.749 Y117.164 E.01485
G1 X87.639 Y122.274 E.23241
G1 X87.639 Y121.693 E.01871
G1 X92.802 Y116.529 E.2348
G1 X92.87 Y115.879 E.02102
G1 X87.639 Y121.111 E.2379
G1 X87.639 Y120.529 E.01871
G1 X93.228 Y114.939 E.25419
G1 X93.737 Y114.058 E.03271
G1 X95.082 Y113.086 E.05337
G1 X105.738 Y102.429 E.4846
G1 X105.738 Y103.011 E.01871
G1 X95.821 Y112.929 E.451
G1 X96.56 Y112.771 E.02429
G1 X105.738 Y103.593 E.41739
G1 X105.738 Y104.175 E.01871
G1 X97.085 Y112.828 E.39352
G1 X97.565 Y112.93 E.01578
G1 X105.738 Y104.757 E.3717
G1 X105.738 Y105.339 E.01871
G1 X98.045 Y113.032 E.34987
G3 X98.459 Y113.2 I.019 J.549 E.0148
G1 X105.738 Y105.921 E.33104
G1 X105.738 Y106.503 E.01871
G1 X98.796 Y113.445 E.31571
G1 X99.133 Y113.69 E.0134
G1 X105.738 Y107.084 E.30038
G1 X105.738 Y107.666 E.01871
G1 X99.47 Y113.935 E.28506
G3 X99.745 Y114.241 I-.206 J.463 E.01364
G1 X105.738 Y108.248 E.27253
G1 X105.738 Y108.83 E.01871
G1 X99.958 Y114.61 E.26284
G1 X100.171 Y114.979 E.0137
G1 X105.738 Y109.412 E.25315
G1 X105.738 Y109.994 E.01871
G1 X100.384 Y115.348 E.24347
G3 X100.5 Y115.814 I-.466 J.363 E.01591
G1 X105.738 Y110.576 E.23822
G1 X105.738 Y111.158 E.01871
G1 X100.555 Y116.341 E.2357
G1 X100.611 Y116.867 E.01702
G1 X105.738 Y111.739 E.23318
G1 X105.738 Y112.321 E.01871
G1 X100.499 Y117.561 E.23828
G1 X100.218 Y118.423 E.02914
G1 X105.921 Y112.72 E.25934
; WIPE_START
G1 X104.507 Y114.134 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.145 Y106.51 Z1.3 F15000
G1 X103.739 Y97.974 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55945
G1 F4800
G1 X103.739 Y97.457 E.02108
G1 X89.638 Y97.457 E.57538
G1 X89.638 Y97.974 E.02108
G1 X103.679 Y97.974 E.57293
G1 X104.186 Y98.421 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X104.186 Y97.011 E.042
G1 X89.191 Y97.011 E.44664
G1 X89.191 Y98.421 E.042
G1 X104.126 Y98.421 E.44486
G1 X104.563 Y98.798 F15000
G1 F4800
G1 X104.563 Y96.634 E.06446
G1 X88.814 Y96.634 E.46911
G1 X88.814 Y98.798 E.06446
G1 X104.503 Y98.798 E.46732
G1 X104.94 Y99.175 F15000
G1 F4800
G1 X104.94 Y96.256 E.08693
G1 X88.437 Y96.256 E.49157
G1 X88.437 Y99.175 E.08693
G1 X104.88 Y99.175 E.48978
G1 X105.317 Y99.552 F15000
G1 F4800
G1 X105.317 Y95.879 E.10939
G1 X88.06 Y95.879 E.51403
G1 X88.06 Y99.552 E.10939
G1 X105.257 Y99.552 E.51225
G1 X105.694 Y99.929 F15000
G1 F4800
G1 X105.694 Y95.502 E.13185
G1 X87.683 Y95.502 E.5365
G1 X87.683 Y99.929 E.13185
G1 X105.634 Y99.929 E.53471
; WIPE_START
G1 X103.634 Y99.929 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.138 Y95.294 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y94.694 E.02728
G1 X105.738 Y94.116 E.01857
G1 X104.744 Y95.11 E.04521
G1 X104.167 Y95.11 E.01857
G1 X105.738 Y93.539 E.07147
G1 X105.738 Y93.321 E.00701
G1 X105.379 Y93.321 E.01156
G1 X103.589 Y95.11 E.08137
G1 X103.012 Y95.11 E.01857
G1 X104.801 Y93.321 E.08137
G1 X104.224 Y93.321 E.01857
G1 X102.434 Y95.11 E.08137
G1 X101.857 Y95.11 E.01857
G1 X103.646 Y93.321 E.08137
G1 X103.069 Y93.321 E.01857
G1 X101.279 Y95.11 E.08137
G1 X100.702 Y95.11 E.01857
G1 X102.491 Y93.321 E.08137
G1 X101.914 Y93.321 E.01857
G1 X100.125 Y95.11 E.08137
G1 X99.547 Y95.11 E.01857
G1 X101.337 Y93.321 E.08137
G1 X100.759 Y93.321 E.01857
G1 X98.97 Y95.11 E.08137
G1 X98.392 Y95.11 E.01857
G1 X100.182 Y93.321 E.08137
G1 X99.604 Y93.321 E.01857
G1 X97.815 Y95.11 E.08137
G1 X97.237 Y95.11 E.01857
G1 X99.027 Y93.321 E.08137
G1 X98.449 Y93.321 E.01857
G1 X96.66 Y95.11 E.08137
G1 X96.083 Y95.11 E.01857
G1 X97.872 Y93.321 E.08137
G1 X97.294 Y93.321 E.01857
G1 X95.505 Y95.11 E.08137
G1 X94.928 Y95.11 E.01857
G1 X96.717 Y93.321 E.08137
G1 X96.14 Y93.321 E.01857
G1 X94.35 Y95.11 E.08137
G1 X93.773 Y95.11 E.01857
G1 X95.562 Y93.321 E.08137
G1 X94.985 Y93.321 E.01857
G1 X93.195 Y95.11 E.08137
G1 X92.618 Y95.11 E.01857
G1 X94.407 Y93.321 E.08137
G1 X93.83 Y93.321 E.01857
G1 X92.04 Y95.11 E.08137
G1 X91.463 Y95.11 E.01857
G1 X93.252 Y93.321 E.08137
G1 X92.675 Y93.321 E.01857
G1 X90.886 Y95.11 E.08137
G1 X90.308 Y95.11 E.01857
G1 X92.098 Y93.321 E.08137
G1 X91.52 Y93.321 E.01857
G1 X89.731 Y95.11 E.08137
G1 X89.153 Y95.11 E.01857
G1 X90.943 Y93.321 E.08137
G1 X90.365 Y93.321 E.01857
G1 X88.576 Y95.11 E.08137
G1 X87.998 Y95.11 E.01857
G1 X89.788 Y93.321 E.08137
G1 X89.21 Y93.321 E.01857
G1 X87.639 Y94.893 E.07147
G1 X87.639 Y94.315 E.01857
G1 X88.633 Y93.321 E.04521
G1 X88.055 Y93.321 E.01857
G1 X87.456 Y93.921 E.02728
; WIPE_START
G1 X88.055 Y93.321 E-.32235
G1 X88.633 Y93.321 E-.21943
G1 X88.227 Y93.727 E-.21822
; WIPE_END
G1 E-.04 F1800
G1 X87.456 Y100.928 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
G1 F7800
G1 X88.063 Y100.321 E.02761
G1 X88.645 Y100.321 E.01871
G1 X87.639 Y101.327 E.04574
G1 X87.639 Y101.909 E.01871
G1 X89.226 Y100.321 E.0722
G1 X89.808 Y100.321 E.01871
G1 X87.639 Y102.491 E.09866
G1 X87.639 Y103.072 E.01871
G1 X90.39 Y100.321 E.12512
G1 X90.972 Y100.321 E.01871
G1 X87.639 Y103.654 E.15159
G1 X87.639 Y104.236 E.01871
G1 X91.554 Y100.321 E.17805
G1 X92.136 Y100.321 E.01871
G1 X87.639 Y104.818 E.20451
G1 X87.639 Y105.4 E.01871
G1 X92.718 Y100.321 E.23097
G1 X93.3 Y100.321 E.01871
G1 X87.639 Y105.982 E.25743
G1 X87.639 Y106.564 E.01871
G1 X93.882 Y100.321 E.28389
G1 X94.463 Y100.321 E.01871
G1 X87.639 Y107.146 E.31035
G1 X87.639 Y107.727 E.01871
G1 X95.045 Y100.321 E.33682
G1 X95.627 Y100.321 E.01871
G1 X87.639 Y108.309 E.36328
G1 X87.639 Y108.891 E.01871
G1 X96.209 Y100.321 E.38974
G1 X96.791 Y100.321 E.01871
G1 X87.639 Y109.473 E.4162
G1 X87.639 Y110.055 E.01871
G1 X97.373 Y100.321 E.44266
G1 X97.955 Y100.321 E.01871
G1 X87.639 Y110.637 E.46912
G1 X87.639 Y111.219 E.01871
G1 X98.537 Y100.321 E.49558
G1 X99.118 Y100.321 E.01871
G1 X87.639 Y111.801 E.52205
G1 X87.639 Y112.382 E.01871
G1 X99.7 Y100.321 E.54851
G1 X100.282 Y100.321 E.01871
G1 X87.639 Y112.964 E.57497
G1 X87.639 Y113.546 E.01871
G1 X100.864 Y100.321 E.60143
G1 X101.446 Y100.321 E.01871
G1 X87.639 Y114.128 E.62789
G1 X87.639 Y114.71 E.01871
G1 X102.028 Y100.321 E.65435
G1 X102.61 Y100.321 E.01871
G1 X87.639 Y115.292 E.68082
G1 X87.639 Y115.874 E.01871
M73 P44 R23
G1 X103.192 Y100.321 E.70728
G1 X103.773 Y100.321 E.01871
G1 X87.639 Y116.456 E.73374
G1 X87.639 Y117.038 E.01871
G1 X104.355 Y100.321 E.7602
G1 X104.937 Y100.321 E.01871
G1 X87.639 Y117.619 E.78666
G1 X87.639 Y118.201 E.01871
G1 X105.519 Y100.321 E.81312
G1 X105.738 Y100.321 E.00704
G1 X105.738 Y100.684 E.01167
G1 X87.639 Y118.783 E.82309
G1 X87.639 Y119.365 E.01871
G1 X105.738 Y101.266 E.82309
G1 X105.738 Y101.848 E.01871
G1 X87.456 Y120.13 E.83142
; WIPE_START
G1 X88.87 Y118.716 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.475 Y111.989 Z1.3 F15000
G1 X103.739 Y90.974 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55945
G1 F4800
G1 X103.739 Y90.457 E.02108
G1 X89.638 Y90.457 E.57538
G1 X89.638 Y90.974 E.02108
G1 X103.679 Y90.974 E.57293
G1 X104.186 Y91.421 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X104.186 Y90.011 E.042
G1 X89.191 Y90.011 E.44664
G1 X89.191 Y91.421 E.042
G1 X104.126 Y91.421 E.44486
G1 X104.563 Y91.798 F15000
G1 F4800
G1 X104.563 Y89.634 E.06446
G1 X88.814 Y89.634 E.46911
G1 X88.814 Y91.798 E.06446
G1 X104.503 Y91.798 E.46732
G1 X104.94 Y92.175 F15000
G1 F4800
G1 X104.94 Y89.256 E.08693
G1 X88.437 Y89.256 E.49157
G1 X88.437 Y92.175 E.08693
G1 X104.88 Y92.175 E.48978
G1 X105.317 Y92.552 F15000
G1 F4800
G1 X105.317 Y88.879 E.10939
G1 X88.06 Y88.879 E.51403
G1 X88.06 Y92.552 E.10939
G1 X105.257 Y92.552 E.51225
G1 X105.694 Y92.929 F15000
G1 F4800
G1 X105.694 Y88.502 E.13185
G1 X87.683 Y88.502 E.5365
G1 X87.683 Y92.929 E.13185
G1 X105.634 Y92.929 E.53471
; WIPE_START
G1 X103.634 Y92.929 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.136 Y88.294 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y87.692 E.02736
G1 X105.738 Y87.113 E.01861
G1 X104.741 Y88.11 E.04535
G1 X104.162 Y88.11 E.01861
G1 X105.738 Y86.534 E.07167
G1 X105.738 Y85.956 E.01861
G1 X103.583 Y88.11 E.09799
G1 X103.005 Y88.11 E.01861
G1 X105.738 Y85.377 E.12431
G1 X105.738 Y84.798 E.01861
G1 X102.426 Y88.11 E.15062
G1 X101.847 Y88.11 E.01861
G1 X105.738 Y84.219 E.17694
G1 X105.738 Y83.641 E.01861
G1 X101.269 Y88.11 E.20326
G1 X100.69 Y88.11 E.01861
G1 X105.738 Y83.062 E.22958
G1 X105.738 Y82.483 E.01861
G1 X100.111 Y88.11 E.2559
G1 X99.532 Y88.11 E.01861
G1 X105.738 Y81.905 E.28221
G1 X105.738 Y81.326 E.01861
G1 X98.954 Y88.11 E.30853
G1 X98.375 Y88.11 E.01861
G1 X105.738 Y80.747 E.33485
G1 X105.738 Y80.168 E.01861
G1 X97.796 Y88.11 E.36117
G1 X97.217 Y88.11 E.01861
G1 X105.738 Y79.59 E.38749
G1 X105.738 Y79.011 E.01861
G1 X96.639 Y88.11 E.4138
G1 X96.06 Y88.11 E.01861
G1 X105.738 Y78.432 E.44012
G1 X105.738 Y77.854 E.01861
G1 X95.481 Y88.11 E.46644
G1 X94.903 Y88.11 E.01861
G1 X105.738 Y77.275 E.49276
G1 X105.738 Y76.696 E.01861
G1 X94.324 Y88.11 E.51908
G1 X93.745 Y88.11 E.01861
G1 X105.738 Y76.117 E.5454
G1 X105.738 Y75.539 E.01861
G1 X93.166 Y88.11 E.57171
G1 X92.588 Y88.11 E.01861
G1 X105.738 Y74.96 E.59803
G1 X105.738 Y74.381 E.01861
G1 X92.009 Y88.11 E.62435
G1 X91.43 Y88.11 E.01861
G1 X105.738 Y73.802 E.65067
G1 X105.738 Y73.224 E.01861
G1 X90.851 Y88.11 E.67699
G1 X90.273 Y88.11 E.01861
G1 X105.738 Y72.645 E.7033
G1 X105.738 Y72.066 E.01861
G1 X89.694 Y88.11 E.72962
G1 X89.115 Y88.11 E.01861
G1 X105.738 Y71.488 E.75594
G1 X105.738 Y70.909 E.01861
G1 X88.537 Y88.11 E.78226
G1 X87.958 Y88.11 E.01861
G1 X105.738 Y70.33 E.80858
G1 X105.738 Y69.751 E.01861
G1 X87.639 Y87.851 E.82309
G1 X87.639 Y87.272 E.01861
G1 X105.738 Y69.173 E.82309
G1 X105.738 Y68.594 E.01861
G1 X87.639 Y86.693 E.82309
G1 X87.639 Y86.115 E.01861
G1 X105.738 Y68.015 E.82309
G1 X105.738 Y67.436 E.01861
G1 X100.443 Y72.731 E.2408
G1 X100.638 Y72.131 E.02031
G1 X100.622 Y71.974 E.00507
G1 X105.738 Y66.858 E.23267
G1 X105.738 Y66.279 E.01861
G1 X100.567 Y71.45 E.23517
G1 X100.512 Y70.927 E.01693
G1 X105.738 Y65.7 E.23768
G1 X105.738 Y65.122 E.01861
G1 X100.431 Y70.429 E.24134
G1 X100.219 Y70.062 E.01362
G1 X105.738 Y64.543 E.25098
G1 X105.738 Y63.964 E.01861
G1 X100.007 Y69.695 E.26061
G1 X99.796 Y69.328 E.01362
G1 X105.738 Y63.385 E.27024
G1 X105.738 Y62.807 E.01861
G1 X99.551 Y68.994 E.28136
G1 X99.216 Y68.75 E.01332
G1 X105.738 Y62.228 E.2966
G1 X105.738 Y61.649 E.01861
G1 X98.881 Y68.507 E.31185
G1 X98.546 Y68.263 E.01332
G1 X105.738 Y61.07 E.32709
G1 X105.738 Y60.492 E.01861
G1 X98.171 Y68.059 E.34414
G1 X97.693 Y67.958 E.01569
G1 X105.738 Y59.913 E.36584
G1 X105.738 Y59.334 E.01861
G1 X97.216 Y67.856 E.38755
G1 X96.739 Y67.755 E.01569
G1 X105.738 Y58.756 E.40925
G1 X105.738 Y58.177 E.01861
G1 X96.031 Y67.884 E.44143
G1 X95.296 Y68.04 E.02416
G1 X105.738 Y57.598 E.47486
G1 X105.738 Y57.019 E.01861
G1 X87.639 Y75.119 E.82309
G1 X87.639 Y75.697 E.01861
G1 X92.998 Y70.338 E.24371
G1 X92.911 Y70.488 E.00557
G1 X92.851 Y71.064 E.01862
G1 X87.639 Y76.276 E.23702
G1 X87.639 Y76.855 E.01861
G1 X92.783 Y71.711 E.23393
G2 X92.788 Y72.284 I.646 J.28 E.01898
G1 X87.639 Y77.434 E.23418
G1 X87.639 Y78.012 E.01861
G1 X92.93 Y72.721 E.24064
G1 X93.072 Y73.158 E.01477
G1 X87.639 Y78.591 E.24709
G1 X87.639 Y79.17 E.01861
G1 X93.214 Y73.594 E.25355
G2 X93.456 Y73.931 I.499 J-.103 E.01373
G1 X87.639 Y79.749 E.26454
G1 X87.639 Y80.327 E.01861
G1 X93.73 Y74.236 E.27701
G1 X94.004 Y74.54 E.01318
G1 X87.639 Y80.906 E.28948
G1 X87.639 Y81.485 E.01861
G1 X94.279 Y74.845 E.30195
G2 X94.644 Y75.058 I.422 J-.304 E.01402
G1 X87.639 Y82.063 E.31858
G1 X87.639 Y82.642 E.01861
G1 X95.045 Y75.236 E.33679
G1 X95.445 Y75.415 E.0141
G1 X87.639 Y83.221 E.355
G1 X87.639 Y83.8 E.01861
G1 X95.846 Y75.593 E.37321
G1 X96.417 Y75.6 E.01837
G1 X87.639 Y84.378 E.39918
G1 X87.639 Y84.957 E.01861
G1 X96.995 Y75.6 E.4255
G1 X97.622 Y75.552 E.02022
G1 X87.456 Y85.719 E.46234
; WIPE_START
G1 X88.87 Y84.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.755 Y76.754 Z1.3 F15000
G1 X87.456 Y74.723 Z1.3
G1 Z.9
G1 E.8 F1800
G1 F7800
G1 X105.738 Y56.441 E.83142
G1 X105.738 Y55.862 E.01861
G1 X87.639 Y73.961 E.82309
G1 X87.639 Y73.383 E.01861
G1 X105.738 Y55.283 E.82309
G1 X105.738 Y54.705 E.01861
G1 X87.639 Y72.804 E.82309
G1 X87.639 Y72.225 E.01861
G1 X105.738 Y54.126 E.82309
G1 X105.738 Y53.547 E.01861
G1 X87.639 Y71.646 E.82309
G1 X87.639 Y71.068 E.01861
G1 X105.738 Y52.968 E.82309
G1 X105.738 Y52.666 E.00972
G1 X105.462 Y52.666 E.00889
G1 X87.639 Y70.489 E.81052
G1 X87.639 Y69.91 E.01861
G1 X104.883 Y52.666 E.7842
G1 X104.304 Y52.666 E.01861
G1 X87.639 Y69.332 E.75788
G1 X87.639 Y68.753 E.01861
G1 X103.726 Y52.666 E.73156
G1 X103.147 Y52.666 E.01861
G1 X87.639 Y68.174 E.70524
G1 X87.639 Y67.595 E.01861
G1 X102.568 Y52.666 E.67893
G1 X101.989 Y52.666 E.01861
G1 X87.639 Y67.017 E.65261
G1 X87.639 Y66.438 E.01861
G1 X101.411 Y52.666 E.62629
G1 X100.832 Y52.666 E.01861
G1 X87.639 Y65.859 E.59997
G1 X87.639 Y65.28 E.01861
G1 X100.253 Y52.666 E.57365
G1 X99.675 Y52.666 E.01861
G1 X87.639 Y64.702 E.54734
G1 X87.639 Y64.123 E.01861
G1 X99.096 Y52.666 E.52102
G1 X98.517 Y52.666 E.01861
G1 X87.639 Y63.544 E.4947
G1 X87.639 Y62.966 E.01861
G1 X97.938 Y52.666 E.46838
G1 X97.36 Y52.666 E.01861
G1 X87.639 Y62.387 E.44206
G1 X87.639 Y61.808 E.01861
G1 X96.781 Y52.666 E.41575
G1 X96.202 Y52.666 E.01861
G1 X87.639 Y61.229 E.38943
G1 X87.639 Y60.651 E.01861
G1 X95.623 Y52.666 E.36311
G1 X95.045 Y52.666 E.01861
G1 X87.639 Y60.072 E.33679
G1 X87.639 Y59.493 E.01861
G1 X94.466 Y52.666 E.31047
G1 X93.887 Y52.666 E.01861
G1 X87.639 Y58.914 E.28416
G1 X87.639 Y58.336 E.01861
G1 X93.309 Y52.666 E.25784
G1 X92.73 Y52.666 E.01861
G1 X87.639 Y57.757 E.23152
G1 X87.639 Y57.178 E.01861
G1 X92.151 Y52.666 E.2052
G1 X91.572 Y52.666 E.01861
G1 X87.639 Y56.6 E.17888
G1 X87.639 Y56.021 E.01861
G1 X90.994 Y52.666 E.15257
G1 X90.415 Y52.666 E.01861
G1 X87.639 Y55.442 E.12625
G1 X87.639 Y54.863 E.01861
G1 X89.836 Y52.666 E.09993
G1 X89.257 Y52.666 E.01861
G1 X87.639 Y54.285 E.07361
G1 X87.639 Y53.706 E.01861
G1 X88.679 Y52.666 E.04729
G1 X88.1 Y52.666 E.01861
G1 X87.456 Y53.31 E.02931
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X88.1 Y52.666 E-.34631
G1 X88.679 Y52.666 E-.21991
G1 X88.318 Y53.027 E-.19378
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 5/20
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.3 I1.217 J0 P1  F15000
; object ids of layer 5 start: 138,178
M624 AwAAAAAAAAA=
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
; object ids of this layer5 end: 138,178
M625
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X208.183 Y176.062
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X208.183 Y177.16 E.03271
G1 X154.603 Y177.16 E1.59597
G1 X154.603 Y176.062 E.03271
G1 X208.123 Y176.062 E1.59418
M204 S5000
G1 X207.242 Y176.269 F15000
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X207.926 Y176.953 E.02879
G1 X207.392 Y176.953
G1 X206.709 Y176.269 E.02879
G1 X206.176 Y176.269
G1 X206.859 Y176.953 E.02879
G1 X206.326 Y176.953
G1 X205.642 Y176.269 E.02879
G1 X205.109 Y176.269
G1 X205.793 Y176.953 E.02879
G1 X205.259 Y176.953
G1 X204.576 Y176.269 E.02879
G1 X204.043 Y176.269
G1 X204.726 Y176.953 E.02879
G1 X204.193 Y176.953
G1 X203.509 Y176.269 E.02879
G1 X202.976 Y176.269
G1 X203.66 Y176.953 E.02879
G1 X203.126 Y176.953
G1 X202.443 Y176.269 E.02879
G1 X201.91 Y176.269
G1 X202.593 Y176.953 E.02879
G1 X202.06 Y176.953
G1 X201.376 Y176.269 E.02879
G1 X200.843 Y176.269
G1 X201.526 Y176.953 E.02879
G1 X200.993 Y176.953
G1 X200.31 Y176.269 E.02879
G1 X199.777 Y176.269
G1 X200.46 Y176.953 E.02879
G1 X199.927 Y176.953
G1 X199.243 Y176.269 E.02879
G1 X198.71 Y176.269
G1 X199.393 Y176.953 E.02879
G1 X198.86 Y176.953
G1 X198.177 Y176.269 E.02879
G1 X197.644 Y176.269
G1 X198.327 Y176.953 E.02879
G1 X197.794 Y176.953
G1 X197.11 Y176.269 E.02879
G1 X196.577 Y176.269
G1 X197.26 Y176.953 E.02879
G1 X196.727 Y176.953
G1 X196.044 Y176.269 E.02879
G1 X195.511 Y176.269
G1 X196.194 Y176.953 E.02879
G1 X195.661 Y176.953
M73 P45 R23
G1 X194.977 Y176.269 E.02879
G1 X194.444 Y176.269
G1 X195.127 Y176.953 E.02879
G1 X194.594 Y176.953
G1 X193.911 Y176.269 E.02879
G1 X193.377 Y176.269
G1 X194.061 Y176.953 E.02879
G1 X193.528 Y176.953
G1 X192.844 Y176.269 E.02879
G1 X192.311 Y176.269
G1 X192.994 Y176.953 E.02879
G1 X192.461 Y176.953
G1 X191.778 Y176.269 E.02879
G1 X191.244 Y176.269
G1 X191.928 Y176.953 E.02879
G1 X191.395 Y176.953
G1 X190.711 Y176.269 E.02879
G1 X190.178 Y176.269
G1 X190.861 Y176.953 E.02879
G1 X190.328 Y176.953
G1 X189.645 Y176.269 E.02879
G1 X189.111 Y176.269
G1 X189.795 Y176.953 E.02879
G1 X189.262 Y176.953
G1 X188.578 Y176.269 E.02879
G1 X188.045 Y176.269
G1 X188.728 Y176.953 E.02879
G1 X188.195 Y176.953
G1 X187.512 Y176.269 E.02879
G1 X186.978 Y176.269
G1 X187.662 Y176.953 E.02879
G1 X187.129 Y176.953
G1 X186.445 Y176.269 E.02879
G1 X185.912 Y176.269
G1 X186.595 Y176.953 E.02879
G1 X186.062 Y176.953
G1 X185.379 Y176.269 E.02879
G1 X184.845 Y176.269
G1 X185.529 Y176.953 E.02879
G1 X184.995 Y176.953
G1 X184.312 Y176.269 E.02879
G1 X183.779 Y176.269
G1 X184.462 Y176.953 E.02879
G1 X183.929 Y176.953
G1 X183.246 Y176.269 E.02879
G1 X182.712 Y176.269
G1 X183.396 Y176.953 E.02879
G1 X182.862 Y176.953
G1 X182.179 Y176.269 E.02879
G1 X181.646 Y176.269
G1 X182.329 Y176.953 E.02879
G1 X181.796 Y176.953
G1 X181.113 Y176.269 E.02879
G1 X180.579 Y176.269
G1 X181.263 Y176.953 E.02879
G1 X180.729 Y176.953
G1 X180.046 Y176.269 E.02879
G1 X179.513 Y176.269
G1 X180.196 Y176.953 E.02879
G1 X179.663 Y176.953
G1 X178.98 Y176.269 E.02879
G1 X178.446 Y176.269
G1 X179.13 Y176.953 E.02879
G1 X178.596 Y176.953
G1 X177.913 Y176.269 E.02879
G1 X177.38 Y176.269
G1 X178.063 Y176.953 E.02879
G1 X177.53 Y176.953
G1 X176.847 Y176.269 E.02879
G1 X176.313 Y176.269
G1 X176.997 Y176.953 E.02879
G1 X176.463 Y176.953
G1 X175.78 Y176.269 E.02879
G1 X175.247 Y176.269
G1 X175.93 Y176.953 E.02879
G1 X175.397 Y176.953
G1 X174.713 Y176.269 E.02879
G1 X174.18 Y176.269
G1 X174.864 Y176.953 E.02879
G1 X174.33 Y176.953
G1 X173.647 Y176.269 E.02879
G1 X173.114 Y176.269
G1 X173.797 Y176.953 E.02879
G1 X173.264 Y176.953
G1 X172.58 Y176.269 E.02879
G1 X172.047 Y176.269
G1 X172.731 Y176.953 E.02879
G1 X172.197 Y176.953
G1 X171.514 Y176.269 E.02879
G1 X170.981 Y176.269
G1 X171.664 Y176.953 E.02879
G1 X171.131 Y176.953
G1 X170.447 Y176.269 E.02879
G1 X169.914 Y176.269
G1 X170.598 Y176.953 E.02879
G1 X170.064 Y176.953
G1 X169.381 Y176.269 E.02879
G1 X168.848 Y176.269
G1 X169.531 Y176.953 E.02879
G1 X168.998 Y176.953
G1 X168.314 Y176.269 E.02879
G1 X167.781 Y176.269
G1 X168.465 Y176.953 E.02879
G1 X167.931 Y176.953
G1 X167.248 Y176.269 E.02879
G1 X166.715 Y176.269
G1 X167.398 Y176.953 E.02879
G1 X166.865 Y176.953
G1 X166.181 Y176.269 E.02879
G1 X165.648 Y176.269
G1 X166.331 Y176.953 E.02879
G1 X165.798 Y176.953
G1 X165.115 Y176.269 E.02879
G1 X164.582 Y176.269
G1 X165.265 Y176.953 E.02879
G1 X164.732 Y176.953
G1 X164.048 Y176.269 E.02879
G1 X163.515 Y176.269
G1 X164.198 Y176.953 E.02879
G1 X163.665 Y176.953
G1 X162.982 Y176.269 E.02879
G1 X162.449 Y176.269
G1 X163.132 Y176.953 E.02879
G1 X162.599 Y176.953
G1 X161.915 Y176.269 E.02879
G1 X161.382 Y176.269
G1 X162.065 Y176.953 E.02879
G1 X161.532 Y176.953
G1 X160.849 Y176.269 E.02879
G1 X160.316 Y176.269
G1 X160.999 Y176.953 E.02879
G1 X160.466 Y176.953
G1 X159.782 Y176.269 E.02879
G1 X159.249 Y176.269
G1 X159.932 Y176.953 E.02879
G1 X159.399 Y176.953
G1 X158.716 Y176.269 E.02879
G1 X158.183 Y176.269
G1 X158.866 Y176.953 E.02879
G1 X158.333 Y176.953
G1 X157.649 Y176.269 E.02879
G1 X157.116 Y176.269
G1 X157.799 Y176.953 E.02879
G1 X157.266 Y176.953
G1 X156.583 Y176.269 E.02879
G1 X156.049 Y176.269
G1 X156.733 Y176.953 E.02879
G1 X156.2 Y176.953
G1 X155.516 Y176.269 E.02879
G1 X154.983 Y176.269
G1 X155.666 Y176.953 E.02879
; WIPE_START
M204 S5000
G1 X154.983 Y176.269 E-.36725
G1 X155.516 Y176.269 E-.20264
G1 X155.87 Y176.623 E-.19011
; WIPE_END
G1 E-.04 F1800
G1 X154.826 Y176.25 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11052
G1 F7500
G1 X154.826 Y176.971 E.00385
; WIPE_START
G1 X154.826 Y176.25 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.734 Y169.194 Z1.5 F15000
G1 X199.995 Y66.648 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X199.995 Y66.256 E.01261
G1 X162.791 Y66.256 E1.19635
G1 X162.791 Y91.256 E.80391
G1 X161.995 Y91.256 E.02559
G1 X161.995 Y66.256 E.80391
G1 X155.791 Y66.256 E.1995
G1 X155.791 Y159.19 E2.98842
G1 X154.995 Y159.19 E.02559
G1 X154.995 Y65.46 E3.01401
G1 X207.791 Y65.46 E1.69772
G1 X207.791 Y159.19 E3.01401
G1 X206.995 Y159.19 E.02559
G1 X206.995 Y66.256 E2.98842
G1 X200.791 Y66.256 E.1995
G1 X200.791 Y91.256 E.80391
G1 X199.995 Y91.256 E.02559
G1 X199.995 Y66.708 E.78937
M204 S250
G1 X199.603 Y66.648 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X199.603 Y91.648 E.74466
G1 X201.183 Y91.648 E.04706
G1 X201.183 Y66.648 E.74466
G1 X206.603 Y66.648 E.16144
G1 X206.603 Y172.068 E3.1401
G1 X156.183 Y172.068 E1.50184
G1 X156.183 Y66.648 E3.1401
G1 X161.603 Y66.648 E.16144
G1 X161.603 Y91.648 E.74466
G1 X163.183 Y91.648 E.04706
G1 X163.183 Y66.648 E.74466
G1 X199.543 Y66.648 E1.08304
; WIPE_START
M204 S5000
G1 X199.548 Y68.648 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.174 Y76.255 Z1.5 F15000
G1 X208.183 Y173.642 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X154.603 Y173.642 E1.59597
G1 X154.603 Y65.068 E3.23405
G1 X208.183 Y65.068 E1.59597
G1 X208.183 Y173.582 E3.23226
; WIPE_START
M204 S5000
G1 X206.183 Y173.584 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.178 Y166.016 Z1.5 F15000
G1 X207.976 Y159.939 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X207.449 Y159.412 E.02218
G1 X206.916 Y159.412
G1 X207.976 Y160.472 E.04464
G1 X207.976 Y161.005
G1 X206.811 Y159.84 E.04908
G1 X206.811 Y160.373
G1 X207.976 Y161.538 E.04908
G1 X207.976 Y162.072
G1 X206.811 Y160.907 E.04908
G1 X206.811 Y161.44
M73 P45 R22
G1 X207.976 Y162.605 E.04908
G1 X207.976 Y163.138
G1 X206.811 Y161.973 E.04908
G1 X206.811 Y162.506
G1 X207.976 Y163.672 E.04908
G1 X207.976 Y164.205
G1 X206.811 Y163.04 E.04908
G1 X206.811 Y163.573
G1 X207.976 Y164.738 E.04908
G1 X207.976 Y165.271
G1 X206.811 Y164.106 E.04908
G1 X206.811 Y164.639
G1 X207.976 Y165.805 E.04908
G1 X207.976 Y166.338
G1 X206.811 Y165.173 E.04908
G1 X206.811 Y165.706
G1 X207.976 Y166.871 E.04908
G1 X207.976 Y167.404
G1 X206.811 Y166.239 E.04908
G1 X206.811 Y166.772
G1 X207.976 Y167.938 E.04908
G1 X207.976 Y168.471
G1 X206.811 Y167.306 E.04908
G1 X206.811 Y167.839
G1 X207.976 Y169.004 E.04908
G1 X207.976 Y169.537
G1 X206.811 Y168.372 E.04908
G1 X206.811 Y168.905
G1 X207.976 Y170.071 E.04908
G1 X207.976 Y170.604
G1 X206.811 Y169.439 E.04908
G1 X206.811 Y169.972
G1 X207.976 Y171.137 E.04908
G1 X207.976 Y171.67
G1 X206.811 Y170.505 E.04908
G1 X206.811 Y171.038
G1 X207.976 Y172.204 E.04908
G1 X207.976 Y172.737
G1 X206.811 Y171.572 E.04908
G1 X206.811 Y172.105
G1 X207.976 Y173.27 E.04908
G1 X207.607 Y173.434
G1 X206.448 Y172.275 E.04883
G1 X205.914 Y172.275
G1 X207.074 Y173.434 E.04883
G1 X206.54 Y173.434
G1 X205.381 Y172.275 E.04883
G1 X204.848 Y172.275
G1 X206.007 Y173.434 E.04883
G1 X205.474 Y173.434
G1 X204.315 Y172.275 E.04883
G1 X203.781 Y172.275
G1 X204.941 Y173.434 E.04883
G1 X204.407 Y173.434
G1 X203.248 Y172.275 E.04883
G1 X202.715 Y172.275
G1 X203.874 Y173.434 E.04883
G1 X203.341 Y173.434
G1 X202.182 Y172.275 E.04883
G1 X201.648 Y172.275
G1 X202.808 Y173.434 E.04883
G1 X202.274 Y173.434
G1 X201.115 Y172.275 E.04883
G1 X200.582 Y172.275
G1 X201.741 Y173.434 E.04883
G1 X201.208 Y173.434
G1 X200.049 Y172.275 E.04883
G1 X199.515 Y172.275
G1 X200.674 Y173.434 E.04883
G1 X200.141 Y173.434
G1 X198.982 Y172.275 E.04883
G1 X198.449 Y172.275
G1 X199.608 Y173.434 E.04883
G1 X199.075 Y173.434
G1 X197.916 Y172.275 E.04883
G1 X197.382 Y172.275
G1 X198.541 Y173.434 E.04883
G1 X198.008 Y173.434
G1 X196.849 Y172.275 E.04883
G1 X196.316 Y172.275
G1 X197.475 Y173.434 E.04883
G1 X196.942 Y173.434
G1 X195.783 Y172.275 E.04883
G1 X195.249 Y172.275
G1 X196.408 Y173.434 E.04883
G1 X195.875 Y173.434
G1 X194.716 Y172.275 E.04883
G1 X194.183 Y172.275
G1 X195.342 Y173.434 E.04883
G1 X194.809 Y173.434
G1 X193.65 Y172.275 E.04883
G1 X193.116 Y172.275
G1 X194.275 Y173.434 E.04883
G1 X193.742 Y173.434
G1 X192.583 Y172.275 E.04883
G1 X192.05 Y172.275
G1 X193.209 Y173.434 E.04883
G1 X192.676 Y173.434
G1 X191.516 Y172.275 E.04883
G1 X190.983 Y172.275
G1 X192.142 Y173.434 E.04883
G1 X191.609 Y173.434
G1 X190.45 Y172.275 E.04883
G1 X189.917 Y172.275
G1 X191.076 Y173.434 E.04883
G1 X190.543 Y173.434
G1 X189.383 Y172.275 E.04883
M73 P46 R22
G1 X188.85 Y172.275
G1 X190.009 Y173.434 E.04883
G1 X189.476 Y173.434
G1 X188.317 Y172.275 E.04883
G1 X187.784 Y172.275
G1 X188.943 Y173.434 E.04883
G1 X188.41 Y173.434
G1 X187.25 Y172.275 E.04883
G1 X186.717 Y172.275
G1 X187.876 Y173.434 E.04883
G1 X187.343 Y173.434
G1 X186.184 Y172.275 E.04883
G1 X185.651 Y172.275
G1 X186.81 Y173.434 E.04883
G1 X186.277 Y173.434
G1 X185.117 Y172.275 E.04883
G1 X184.584 Y172.275
G1 X185.743 Y173.434 E.04883
G1 X185.21 Y173.434
G1 X184.051 Y172.275 E.04883
G1 X183.518 Y172.275
G1 X184.677 Y173.434 E.04883
G1 X184.144 Y173.434
G1 X182.984 Y172.275 E.04883
G1 X182.451 Y172.275
G1 X183.61 Y173.434 E.04883
G1 X183.077 Y173.434
G1 X181.918 Y172.275 E.04883
G1 X181.385 Y172.275
G1 X182.544 Y173.434 E.04883
G1 X182.01 Y173.434
G1 X180.851 Y172.275 E.04883
G1 X180.318 Y172.275
G1 X181.477 Y173.434 E.04883
G1 X180.944 Y173.434
G1 X179.785 Y172.275 E.04883
G1 X179.252 Y172.275
G1 X180.411 Y173.434 E.04883
G1 X179.877 Y173.434
G1 X178.718 Y172.275 E.04883
G1 X178.185 Y172.275
G1 X179.344 Y173.434 E.04883
G1 X178.811 Y173.434
G1 X177.652 Y172.275 E.04883
G1 X177.119 Y172.275
G1 X178.278 Y173.434 E.04883
G1 X177.744 Y173.434
G1 X176.585 Y172.275 E.04883
G1 X176.052 Y172.275
G1 X177.211 Y173.434 E.04883
G1 X176.678 Y173.434
G1 X175.519 Y172.275 E.04883
G1 X174.985 Y172.275
G1 X176.145 Y173.434 E.04883
G1 X175.611 Y173.434
G1 X174.452 Y172.275 E.04883
G1 X173.919 Y172.275
G1 X175.078 Y173.434 E.04883
G1 X174.545 Y173.434
G1 X173.386 Y172.275 E.04883
G1 X172.852 Y172.275
G1 X174.012 Y173.434 E.04883
G1 X173.478 Y173.434
G1 X172.319 Y172.275 E.04883
G1 X171.786 Y172.275
G1 X172.945 Y173.434 E.04883
G1 X172.412 Y173.434
G1 X171.253 Y172.275 E.04883
G1 X170.719 Y172.275
G1 X171.879 Y173.434 E.04883
G1 X171.345 Y173.434
G1 X170.186 Y172.275 E.04883
G1 X169.653 Y172.275
G1 X170.812 Y173.434 E.04883
G1 X170.279 Y173.434
G1 X169.12 Y172.275 E.04883
G1 X168.586 Y172.275
G1 X169.746 Y173.434 E.04883
G1 X169.212 Y173.434
G1 X168.053 Y172.275 E.04883
G1 X167.52 Y172.275
G1 X168.679 Y173.434 E.04883
G1 X168.146 Y173.434
G1 X166.987 Y172.275 E.04883
G1 X166.453 Y172.275
G1 X167.613 Y173.434 E.04883
G1 X167.079 Y173.434
G1 X165.92 Y172.275 E.04883
G1 X165.387 Y172.275
G1 X166.546 Y173.434 E.04883
G1 X166.013 Y173.434
G1 X164.854 Y172.275 E.04883
G1 X164.32 Y172.275
G1 X165.479 Y173.434 E.04883
G1 X164.946 Y173.434
G1 X163.787 Y172.275 E.04883
G1 X163.254 Y172.275
G1 X164.413 Y173.434 E.04883
G1 X163.88 Y173.434
G1 X162.721 Y172.275 E.04883
G1 X162.187 Y172.275
G1 X163.346 Y173.434 E.04883
G1 X162.813 Y173.434
G1 X161.654 Y172.275 E.04883
G1 X161.121 Y172.275
G1 X162.28 Y173.434 E.04883
G1 X161.747 Y173.434
G1 X160.588 Y172.275 E.04883
G1 X160.054 Y172.275
G1 X161.213 Y173.434 E.04883
G1 X160.68 Y173.434
G1 X159.521 Y172.275 E.04883
G1 X158.988 Y172.275
G1 X160.147 Y173.434 E.04883
G1 X159.614 Y173.434
G1 X158.455 Y172.275 E.04883
G1 X157.921 Y172.275
G1 X159.08 Y173.434 E.04883
G1 X158.547 Y173.434
G1 X157.388 Y172.275 E.04883
G1 X156.855 Y172.275
G1 X158.014 Y173.434 E.04883
G1 X157.481 Y173.434
G1 X156.321 Y172.275 E.04883
; WIPE_START
M204 S5000
G1 X157.481 Y173.434 E-.62292
G1 X157.841 Y173.434 E-.13708
; WIPE_END
G1 E-.04 F1800
G1 X156.776 Y165.876 Z1.5 F15000
G1 X155.976 Y160.198 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X155.19 Y159.412 E.0331
G1 X154.811 Y159.566
G1 X155.976 Y160.731 E.04909
G1 X155.976 Y161.264
G1 X154.811 Y160.099 E.04909
G1 X154.811 Y160.632
G1 X155.976 Y161.798 E.04909
G1 X155.976 Y162.331
G1 X154.811 Y161.166 E.04909
G1 X154.811 Y161.699
G1 X155.976 Y162.864 E.04909
G1 X155.976 Y163.397
G1 X154.811 Y162.232 E.04909
G1 X154.811 Y162.766
G1 X155.976 Y163.931 E.04909
G1 X155.976 Y164.464
G1 X154.811 Y163.299 E.04909
G1 X154.811 Y163.832
G1 X155.976 Y164.997 E.04909
G1 X155.976 Y165.531
G1 X154.811 Y164.365 E.04909
G1 X154.811 Y164.899
G1 X155.976 Y166.064 E.04908
G1 X155.976 Y166.597
G1 X154.811 Y165.432 E.04908
G1 X154.811 Y165.965
G1 X155.976 Y167.13 E.04908
G1 X155.976 Y167.664
G1 X154.811 Y166.498 E.04908
G1 X154.811 Y167.032
G1 X155.976 Y168.197 E.04908
G1 X155.976 Y168.73
G1 X154.811 Y167.565 E.04908
G1 X154.811 Y168.098
G1 X155.976 Y169.263 E.04908
G1 X155.976 Y169.797
G1 X154.811 Y168.631 E.04908
G1 X154.811 Y169.165
G1 X155.976 Y170.33 E.04908
G1 X155.976 Y170.863
G1 X154.811 Y169.698 E.04908
G1 X154.811 Y170.231
G1 X155.976 Y171.396 E.04908
G1 X155.976 Y171.93
G1 X154.811 Y170.764 E.04908
G1 X154.811 Y171.298
G1 X156.947 Y173.434 E.09
G1 X156.414 Y173.434
G1 X154.811 Y171.831 E.06754
G1 X154.811 Y172.364
G1 X155.881 Y173.434 E.04508
G1 X155.348 Y173.434
G1 X154.811 Y172.897 E.02262
; WIPE_START
M204 S5000
G1 X155.348 Y173.434 E-.28851
G1 X155.881 Y173.434 E-.20264
G1 X155.381 Y172.934 E-.26885
; WIPE_END
G1 E-.04 F1800
G1 X155.388 Y165.302 Z1.5 F15000
G1 X155.393 Y158.986 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.393 Y66.052 E2.85423
; LINE_WIDTH: 0.470635
G1 X155.427 Y65.891 E.00556
G1 X155.507 Y65.874 E.00278
; LINE_WIDTH: 0.448395
G1 X155.588 Y65.858 E.00263
; LINE_WIDTH: 0.432083
G1 X162.199 Y65.858 E.20324
G1 X162.296 Y65.882 E.00308
; LINE_WIDTH: 0.50462
G1 X162.393 Y65.906 E.00365
; WIPE_START
G1 X162.296 Y65.882 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X162.326 Y73.514 Z1.5 F15000
G1 X162.393 Y91.052 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.43172
G1 F7500
G1 X162.393 Y66.052 E.76781
; LINE_WIDTH: 0.490218
G1 X162.393 Y65.906 E.00515
G1 X162.491 Y65.882 E.00354
; LINE_WIDTH: 0.45602
G1 X162.588 Y65.858 E.00327
; LINE_WIDTH: 0.431785
G1 X200.199 Y65.858 E1.15532
G1 X200.296 Y65.882 E.00308
; LINE_WIDTH: 0.50462
G1 X200.393 Y65.906 E.00365
; WIPE_START
G1 X200.296 Y65.882 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.326 Y73.514 Z1.5 F15000
G1 X200.393 Y91.052 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.43172
G1 F7500
G1 X200.393 Y66.052 E.76781
; LINE_WIDTH: 0.490218
G1 X200.393 Y65.906 E.00515
G1 X200.491 Y65.882 E.00354
; LINE_WIDTH: 0.45602
G1 X200.588 Y65.858 E.00327
; LINE_WIDTH: 0.43172
G1 X207.199 Y65.858 E.20305
; LINE_WIDTH: 0.470635
G1 X207.36 Y65.891 E.00556
G1 X207.377 Y65.972 E.00278
; LINE_WIDTH: 0.448395
G1 X207.393 Y66.052 E.00263
; LINE_WIDTH: 0.43172
G1 X207.393 Y158.986 E2.85423
; OBJECT_ID: 178
; WIPE_START
G1 X207.393 Y156.986 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X200.296 Y154.18 Z1.5 F15000
G1 X99.312 Y114.25 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X99.375 Y114.296 E.00253
G1 X100.127 Y115.598 E.04834
G1 X100.284 Y117.094 E.04835
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X96.258 Y113.192 E.0342
G1 X96.688 Y113.1 E.01414
G1 X98.159 Y113.413 E.04834
G1 X99.263 Y114.215 E.04389
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X96.34 Y113.575 E.0292
G1 X96.688 Y113.501 E.01062
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52886
G1 X99.809 Y116.327 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X106.086 Y114.549 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y133.538 E.61061
G1 X87.291 Y133.538 E.60441
G1 X87.291 Y99.893 E1.08188
G1 X106.086 Y99.893 E.60441
G1 X106.086 Y114.489 E.46935
; WIPE_START
G1 X106.086 Y116.489 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.815 Y123.776 Z1.5 F15000
G1 X98.592 Y140.538 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F9000
G1 X87.291 Y140.538 E.3634
G1 X87.291 Y137.893 E.08504
G1 X106.086 Y137.893 E.60441
G1 X106.086 Y140.538 E.08504
G1 X98.652 Y140.538 E.23908
; WIPE_START
G1 X96.652 Y140.538 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.352 Y148.138 Z1.5 F15000
G1 X98.866 Y164.582 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F9000
G1 X98.814 Y164.641 E.00253
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04834
G1 X96.258 Y158.192 E.0342
G1 X96.688 Y158.1 E.01414
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04835
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.906 Y164.538 E.04389
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X96.34 Y158.575 E.0292
G1 X96.688 Y158.501 E.01062
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X100.551 Y171.478 Z1.5 F15000
G1 X106.086 Y181.114 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.893 E1.16471
G1 X106.086 Y144.893 E.60441
G1 X106.086 Y181.054 E1.16278
; WIPE_START
G1 X104.086 Y181.06 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.642 Y173.441 Z1.5 F15000
G1 X99.095 Y95.538 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F9000
G1 X87.291 Y95.538 E.37957
G1 X87.291 Y92.893 E.08504
G1 X106.086 Y92.893 E.60441
G1 X106.086 Y95.538 E.08504
G1 X99.155 Y95.538 E.2229
; WIPE_START
G1 X97.155 Y95.538 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.232 Y87.906 Z1.5 F15000
G1 X97.362 Y75.252 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F9000
G1 X95.937 Y75.252 E.04582
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X96.258 Y68.192 E.0342
G1 X96.688 Y68.1 E.01414
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04834
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.422 Y75.252 E.0006
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X96.34 Y68.575 E.0292
G1 X96.688 Y68.501 E.01062
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X103.094 Y74.807 Z1.5 F15000
G1 X106.086 Y74.883 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y88.538 E.4391
G1 X87.291 Y88.538 E.60441
G1 X87.291 Y52.318 E1.16471
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y74.823 E.72368
; WIPE_START
G1 X106.086 Y76.823 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.115 Y84.455 Z1.5 F15000
G1 X106.478 Y181.506 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y51.926 E3.85975
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y181.446 E3.85796
; WIPE_START
M204 S5000
G1 X104.478 Y181.452 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.921 Y177.158 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y158.876 E.83142
G1 X87.639 Y159.455 E.01862
G1 X105.738 Y177.554 E.82309
G1 X105.738 Y178.133 E.01862
G1 X87.639 Y160.034 E.82309
G1 X87.639 Y160.613 E.01862
G1 X105.738 Y178.712 E.82309
G1 X105.738 Y179.292 E.01862
G1 X87.639 Y161.192 E.82309
G1 X87.639 Y161.771 E.01862
G1 X105.738 Y179.871 E.82309
G1 X105.738 Y180.45 E.01862
G1 X87.639 Y162.35 E.82309
G1 X87.639 Y162.929 E.01862
G1 X105.475 Y180.765 E.8111
G1 X104.896 Y180.765 E.01862
G1 X87.639 Y163.509 E.78477
G1 X87.639 Y164.088 E.01862
G1 X104.316 Y180.765 E.75843
G1 X103.737 Y180.765 E.01862
G1 X87.639 Y164.667 E.7321
G1 X87.639 Y165.246 E.01862
G1 X103.158 Y180.765 E.70576
G1 X102.579 Y180.765 E.01862
G1 X87.639 Y165.825 E.67943
G1 X87.639 Y166.404 E.01862
G1 X102 Y180.765 E.65309
G1 X101.421 Y180.765 E.01862
G1 X87.639 Y166.983 E.62676
G1 X87.639 Y167.562 E.01862
G1 X100.842 Y180.765 E.60042
G1 X100.263 Y180.765 E.01862
G1 X87.639 Y168.141 E.57408
G1 X87.639 Y168.721 E.01862
G1 X99.684 Y180.765 E.54775
G1 X99.104 Y180.765 E.01862
G1 X87.639 Y169.3 E.52141
G1 X87.639 Y169.879 E.01862
G1 X98.525 Y180.765 E.49508
G1 X97.946 Y180.765 E.01862
G1 X87.639 Y170.458 E.46874
G1 X87.639 Y171.037 E.01862
G1 X97.367 Y180.765 E.44241
G1 X96.788 Y180.765 E.01862
M73 P47 R22
G1 X87.639 Y171.616 E.41607
G1 X87.639 Y172.195 E.01862
G1 X96.209 Y180.765 E.38974
G1 X95.63 Y180.765 E.01862
G1 X87.639 Y172.774 E.3634
G1 X87.639 Y173.353 E.01862
G1 X95.051 Y180.765 E.33707
G1 X94.472 Y180.765 E.01862
G1 X87.639 Y173.933 E.31073
G1 X87.639 Y174.512 E.01862
G1 X93.893 Y180.765 E.28439
G1 X93.313 Y180.765 E.01862
G1 X87.639 Y175.091 E.25806
G1 X87.639 Y175.67 E.01862
G1 X92.734 Y180.765 E.23172
G1 X92.155 Y180.765 E.01862
G1 X87.639 Y176.249 E.20539
G1 X87.639 Y176.828 E.01862
G1 X91.576 Y180.765 E.17905
G1 X90.997 Y180.765 E.01862
G1 X87.639 Y177.407 E.15272
G1 X87.639 Y177.986 E.01862
G1 X90.418 Y180.765 E.12638
G1 X89.839 Y180.765 E.01862
G1 X87.639 Y178.565 E.10005
G1 X87.639 Y179.144 E.01862
G1 X89.26 Y180.765 E.07371
G1 X88.681 Y180.765 E.01862
G1 X87.639 Y179.724 E.04738
G1 X87.639 Y180.303 E.01862
G1 X88.285 Y180.949 E.02937
; WIPE_START
G1 X87.639 Y180.303 E-.34709
G1 X87.639 Y179.724 E-.22006
G1 X87.998 Y180.082 E-.19285
; WIPE_END
G1 E-.04 F1800
G1 X94.025 Y175.399 Z1.5 F15000
G1 X105.921 Y166.155 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F7800
G1 X100.49 Y160.724 E.24697
G1 X100.558 Y161.372 E.02092
G1 X105.738 Y166.551 E.23555
G1 X105.738 Y167.13 E.01862
G1 X100.626 Y162.019 E.23246
G3 X100.521 Y162.492 I-.585 J.118 E.01607
G1 X105.738 Y167.709 E.23726
G1 X105.738 Y168.289 E.01862
G1 X100.379 Y162.929 E.24372
G1 X100.237 Y163.366 E.01478
G1 X105.738 Y168.868 E.25018
G1 X105.738 Y169.447 E.01862
G1 X100.064 Y163.773 E.25804
G1 X99.79 Y164.077 E.01319
G1 X105.738 Y170.026 E.27052
G1 X105.738 Y170.605 E.01862
G1 X99.515 Y164.382 E.283
G1 X99.241 Y164.687 E.01319
G1 X105.738 Y171.184 E.29547
G1 X105.738 Y171.763 E.01862
G1 X98.94 Y164.965 E.30913
G1 X98.54 Y165.144 E.0141
G1 X105.738 Y172.342 E.32735
G1 X105.738 Y172.921 E.01862
G1 X98.139 Y165.322 E.34558
G1 X97.738 Y165.501 E.0141
G1 X105.738 Y173.5 E.3638
G1 X105.738 Y174.08 E.01862
G1 X97.259 Y165.6 E.3856
G1 X96.68 Y165.6 E.01862
G1 X105.738 Y174.659 E.41193
G1 X105.738 Y175.238 E.01862
G1 X96.101 Y165.6 E.43827
G1 X95.863 Y165.6 E.00766
G1 X95.248 Y165.327 E.02164
G1 X105.738 Y175.817 E.47705
G1 X105.738 Y176.396 E.01862
G1 X87.639 Y158.297 E.82309
G1 X87.639 Y157.718 E.01862
G1 X93.069 Y163.148 E.24695
G1 X92.79 Y162.29 E.02901
G1 X87.639 Y157.138 E.23427
G1 X87.639 Y156.559 E.01862
G1 X92.784 Y161.704 E.23396
G1 X92.839 Y161.18 E.01694
G1 X87.639 Y155.98 E.23647
G1 X87.639 Y155.401 E.01862
G1 X92.894 Y160.656 E.23897
G3 X93.055 Y160.239 I.549 J-.027 E.01482
G1 X87.639 Y154.822 E.24633
G1 X87.639 Y154.243 E.01862
G1 X93.267 Y159.872 E.25597
G1 X93.479 Y159.504 E.01363
G1 X87.639 Y153.664 E.26561
G1 X87.639 Y153.085 E.01862
G1 X93.691 Y159.137 E.27525
G3 X94 Y158.867 I.458 J.212 E.01359
G1 X87.639 Y152.506 E.28929
G1 X87.639 Y151.926 E.01862
G1 X94.336 Y158.623 E.30454
G1 X94.671 Y158.38 E.01333
G1 X87.639 Y151.347 E.3198
G1 X87.639 Y150.768 E.01862
G1 X95.006 Y158.136 E.33505
G3 X95.456 Y158.006 I.37 J.44 E.01549
G1 X87.639 Y150.189 E.35549
G1 X87.639 Y149.61 E.01862
G1 X95.933 Y157.905 E.3772
G1 X96.411 Y157.803 E.0157
G1 X87.639 Y149.031 E.39892
G1 X87.639 Y148.452 E.01862
G1 X96.997 Y157.81 E.42555
G1 X97.732 Y157.966 E.02418
G1 X87.639 Y147.873 E.459
G1 X87.639 Y147.294 E.01862
G1 X105.738 Y165.393 E.82309
G1 X105.738 Y164.814 E.01862
G1 X87.639 Y146.715 E.82309
G1 X87.639 Y146.135 E.01862
G1 X105.738 Y164.235 E.82309
G1 X105.738 Y163.656 E.01862
G1 X87.639 Y145.556 E.82309
G1 X87.639 Y145.242 E.01012
G1 X87.903 Y145.242 E.00851
G1 X105.738 Y163.077 E.81106
G1 X105.738 Y162.497 E.01862
G1 X88.482 Y145.242 E.78472
G1 X89.062 Y145.242 E.01862
G1 X105.738 Y161.918 E.75839
G1 X105.738 Y161.339 E.01862
G1 X89.641 Y145.242 E.73205
G1 X90.22 Y145.242 E.01862
G1 X105.738 Y160.76 E.70572
G1 X105.738 Y160.181 E.01862
G1 X90.799 Y145.242 E.67938
G1 X91.378 Y145.242 E.01862
G1 X105.738 Y159.602 E.65304
G1 X105.738 Y159.023 E.01862
G1 X91.957 Y145.242 E.62671
G1 X92.536 Y145.242 E.01862
G1 X105.738 Y158.444 E.60037
G1 X105.738 Y157.865 E.01862
G1 X93.115 Y145.242 E.57404
G1 X93.694 Y145.242 E.01862
G1 X105.738 Y157.285 E.5477
G1 X105.738 Y156.706 E.01862
G1 X94.273 Y145.242 E.52137
G1 X94.853 Y145.242 E.01862
G1 X105.738 Y156.127 E.49503
G1 X105.738 Y155.548 E.01862
G1 X95.432 Y145.242 E.4687
G1 X96.011 Y145.242 E.01862
G1 X105.738 Y154.969 E.44236
G1 X105.738 Y154.39 E.01862
G1 X96.59 Y145.242 E.41603
G1 X97.169 Y145.242 E.01862
G1 X105.738 Y153.811 E.38969
G1 X105.738 Y153.232 E.01862
G1 X97.748 Y145.242 E.36335
G1 X98.327 Y145.242 E.01862
G1 X105.738 Y152.653 E.33702
G1 X105.738 Y152.074 E.01862
G1 X98.906 Y145.242 E.31068
G1 X99.485 Y145.242 E.01862
G1 X105.738 Y151.494 E.28435
G1 X105.738 Y150.915 E.01862
G1 X100.065 Y145.242 E.25801
G1 X100.644 Y145.242 E.01862
G1 X105.738 Y150.336 E.23168
G1 X105.738 Y149.757 E.01862
G1 X101.223 Y145.242 E.20534
G1 X101.802 Y145.242 E.01862
G1 X105.738 Y149.178 E.17901
G1 X105.738 Y148.599 E.01862
G1 X102.381 Y145.242 E.15267
G1 X102.96 Y145.242 E.01862
G1 X105.738 Y148.02 E.12634
G1 X105.738 Y147.441 E.01862
G1 X103.539 Y145.242 E.1
G1 X104.118 Y145.242 E.01862
G1 X105.738 Y146.862 E.07367
G1 X105.738 Y146.282 E.01862
G1 X104.697 Y145.242 E.04733
G1 X105.276 Y145.242 E.01862
G1 X105.921 Y145.887 E.02932
; WIPE_START
G1 X105.276 Y145.242 E-.34654
G1 X104.697 Y145.242 E-.22006
G1 X105.057 Y145.602 E-.1934
; WIPE_END
G1 E-.04 F1800
G1 X106.271 Y141.496 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X105.583 Y140.809 E.02897
G1 X105.05 Y140.809
G1 X106.271 Y142.029 E.05143
G1 X106.271 Y142.563
G1 X104.517 Y140.809 E.07389
G1 X103.984 Y140.809
G1 X106.271 Y143.096 E.09636
G1 X106.271 Y143.629
G1 X103.45 Y140.809 E.11882
G1 X102.917 Y140.809
G1 X106.271 Y144.162 E.14128
G1 X106.246 Y144.671
G1 X102.384 Y140.809 E.1627
G1 X101.851 Y140.809
G1 X105.665 Y144.623 E.16067
G1 X105.132 Y144.623
G1 X101.317 Y140.809 E.16067
G1 X100.784 Y140.809
G1 X104.598 Y144.623 E.16067
G1 X104.065 Y144.623
G1 X100.251 Y140.809 E.16067
G1 X99.718 Y140.809
G1 X103.532 Y144.623 E.16067
G1 X102.999 Y144.623
G1 X99.184 Y140.809 E.16067
G1 X98.651 Y140.809
G1 X102.465 Y144.623 E.16067
G1 X101.932 Y144.623
G1 X98.118 Y140.809 E.16067
G1 X97.585 Y140.809
G1 X101.399 Y144.623 E.16067
G1 X100.866 Y144.623
G1 X97.051 Y140.809 E.16067
G1 X96.518 Y140.809
G1 X100.332 Y144.623 E.16067
G1 X99.799 Y144.623
G1 X95.985 Y140.809 E.16067
G1 X95.452 Y140.809
G1 X99.266 Y144.623 E.16067
G1 X98.733 Y144.623
G1 X94.918 Y140.809 E.16067
G1 X94.385 Y140.809
G1 X98.199 Y144.623 E.16067
G1 X97.666 Y144.623
G1 X93.852 Y140.809 E.16067
G1 X93.319 Y140.809
G1 X97.133 Y144.623 E.16067
G1 X96.6 Y144.623
G1 X92.785 Y140.809 E.16067
G1 X92.252 Y140.809
G1 X96.066 Y144.623 E.16067
G1 X95.533 Y144.623
G1 X91.719 Y140.809 E.16067
G1 X91.186 Y140.809
G1 X95 Y144.623 E.16067
G1 X94.466 Y144.623
G1 X90.652 Y140.809 E.16067
G1 X90.119 Y140.809
G1 X93.933 Y144.623 E.16067
G1 X93.4 Y144.623
G1 X89.586 Y140.809 E.16067
G1 X89.052 Y140.809
G1 X92.867 Y144.623 E.16067
G1 X92.333 Y144.623
G1 X88.519 Y140.809 E.16067
G1 X87.986 Y140.809
G1 X91.8 Y144.623 E.16067
G1 X91.267 Y144.623
G1 X87.405 Y140.76 E.1627
G1 X87.106 Y140.995
G1 X90.734 Y144.623 E.15282
G1 X90.2 Y144.623
G1 X87.106 Y141.528 E.13036
G1 X87.106 Y142.061
G1 X89.667 Y144.623 E.10789
G1 X89.134 Y144.623
G1 X87.106 Y142.595 E.08543
G1 X87.106 Y143.128
G1 X88.601 Y144.623 E.06297
G1 X88.067 Y144.623
G1 X87.106 Y143.661 E.0405
G1 X87.106 Y144.195
G1 X87.556 Y144.645 E.01897
; WIPE_START
M204 S5000
G1 X87.106 Y144.195 E-.24198
G1 X87.106 Y143.661 E-.20264
G1 X87.693 Y144.248 E-.31539
; WIPE_END
G1 E-.04 F1800
G1 X88.284 Y140.373 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y139.727 E.02936
G1 X87.639 Y139.148 E.01863
G1 X88.681 Y140.19 E.04738
G1 X89.26 Y140.19 E.01863
G1 X87.639 Y138.568 E.07373
G1 X87.639 Y138.242 E.0105
G1 X87.892 Y138.242 E.00813
G1 X89.84 Y140.19 E.08858
M73 P47 R21
G1 X90.419 Y140.19 E.01863
G1 X88.471 Y138.242 E.08858
G1 X89.051 Y138.242 E.01863
G1 X90.999 Y140.19 E.08858
G1 X91.578 Y140.19 E.01863
G1 X89.63 Y138.242 E.08858
G1 X90.21 Y138.242 E.01863
G1 X92.158 Y140.19 E.08858
G1 X92.737 Y140.19 E.01863
G1 X90.789 Y138.242 E.08858
G1 X91.369 Y138.242 E.01863
G1 X93.316 Y140.19 E.08858
G1 X93.896 Y140.19 E.01863
G1 X91.948 Y138.242 E.08858
G1 X92.528 Y138.242 E.01863
G1 X94.475 Y140.19 E.08858
G1 X95.055 Y140.19 E.01863
G1 X93.107 Y138.242 E.08858
G1 X93.686 Y138.242 E.01863
G1 X95.634 Y140.19 E.08858
G1 X96.214 Y140.19 E.01863
G1 X94.266 Y138.242 E.08858
G1 X94.845 Y138.242 E.01863
G1 X96.793 Y140.19 E.08858
G1 X97.373 Y140.19 E.01863
G1 X95.425 Y138.242 E.08858
G1 X96.004 Y138.242 E.01863
G1 X97.952 Y140.19 E.08858
G1 X98.532 Y140.19 E.01863
G1 X96.584 Y138.242 E.08858
G1 X97.163 Y138.242 E.01863
G1 X99.111 Y140.19 E.08858
G1 X99.691 Y140.19 E.01863
G1 X97.743 Y138.242 E.08858
G1 X98.322 Y138.242 E.01863
G1 X100.27 Y140.19 E.08858
G1 X100.85 Y140.19 E.01863
G1 X98.902 Y138.242 E.08858
G1 X99.481 Y138.242 E.01863
G1 X101.429 Y140.19 E.08858
G1 X102.009 Y140.19 E.01863
G1 X100.061 Y138.242 E.08858
G1 X100.64 Y138.242 E.01863
G1 X102.588 Y140.19 E.08858
G1 X103.168 Y140.19 E.01863
G1 X101.22 Y138.242 E.08858
G1 X101.799 Y138.242 E.01863
G1 X103.747 Y140.19 E.08858
G1 X104.327 Y140.19 E.01863
G1 X102.379 Y138.242 E.08858
G1 X102.958 Y138.242 E.01863
G1 X104.906 Y140.19 E.08858
G1 X105.485 Y140.19 E.01863
G1 X103.538 Y138.242 E.08858
G1 X104.117 Y138.242 E.01863
G1 X105.738 Y139.863 E.07372
G1 X105.738 Y139.283 E.01863
G1 X104.696 Y138.242 E.04737
G1 X105.276 Y138.242 E.01863
G1 X105.921 Y138.887 E.02935
; WIPE_START
G1 X105.276 Y138.242 E-.34683
G1 X104.696 Y138.242 E-.2202
G1 X105.056 Y138.601 E-.19297
; WIPE_END
G1 E-.04 F1800
G1 X106.271 Y134.564 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X105.516 Y133.809 E.03182
G1 X104.983 Y133.809
G1 X106.271 Y135.097 E.05428
G1 X106.271 Y135.63
G1 X104.449 Y133.809 E.07674
G1 X103.916 Y133.809
G1 X106.271 Y136.164 E.09921
G1 X106.271 Y136.697
G1 X103.383 Y133.809 E.12167
G1 X102.85 Y133.809
G1 X106.271 Y137.23 E.14413
G1 X106.179 Y137.671
G1 X102.316 Y133.809 E.1627
G1 X101.783 Y133.809
G1 X105.597 Y137.623 E.16067
G1 X105.064 Y137.623
G1 X101.25 Y133.809 E.16067
G1 X100.716 Y133.809
G1 X104.531 Y137.623 E.16067
G1 X103.997 Y137.623
G1 X100.183 Y133.809 E.16067
G1 X99.65 Y133.809
G1 X103.464 Y137.623 E.16067
G1 X102.931 Y137.623
G1 X99.117 Y133.809 E.16067
G1 X98.583 Y133.809
G1 X102.398 Y137.623 E.16067
G1 X101.864 Y137.623
G1 X98.05 Y133.809 E.16067
G1 X97.517 Y133.809
G1 X101.331 Y137.623 E.16067
G1 X100.798 Y137.623
G1 X96.984 Y133.809 E.16067
G1 X96.45 Y133.809
G1 X100.265 Y137.623 E.16067
G1 X99.731 Y137.623
G1 X95.917 Y133.809 E.16067
G1 X95.384 Y133.809
G1 X99.198 Y137.623 E.16067
G1 X98.665 Y137.623
G1 X94.851 Y133.809 E.16067
G1 X94.317 Y133.809
G1 X98.132 Y137.623 E.16067
G1 X97.598 Y137.623
G1 X93.784 Y133.809 E.16067
G1 X93.251 Y133.809
G1 X97.065 Y137.623 E.16067
G1 X96.532 Y137.623
G1 X92.718 Y133.809 E.16067
G1 X92.184 Y133.809
G1 X95.999 Y137.623 E.16067
M73 P48 R21
G1 X95.465 Y137.623
G1 X91.651 Y133.809 E.16067
G1 X91.118 Y133.809
G1 X94.932 Y137.623 E.16067
G1 X94.399 Y137.623
G1 X90.585 Y133.809 E.16067
G1 X90.051 Y133.809
G1 X93.866 Y137.623 E.16067
G1 X93.332 Y137.623
G1 X89.518 Y133.809 E.16067
G1 X88.985 Y133.809
G1 X92.799 Y137.623 E.16067
G1 X92.266 Y137.623
G1 X88.452 Y133.809 E.16067
G1 X87.918 Y133.809
G1 X91.733 Y137.623 E.16067
G1 X91.199 Y137.623
G1 X87.337 Y133.76 E.1627
G1 X87.106 Y134.063
G1 X90.666 Y137.623 E.14997
G1 X90.133 Y137.623
G1 X87.106 Y134.596 E.12751
G1 X87.106 Y135.129
G1 X89.6 Y137.623 E.10505
G1 X89.066 Y137.623
G1 X87.106 Y135.662 E.08258
G1 X87.106 Y136.196
G1 X88.533 Y137.623 E.06012
G1 X88 Y137.623
G1 X87.106 Y136.729 E.03766
G1 X87.106 Y137.262
G1 X87.515 Y137.671 E.01722
; WIPE_START
M204 S5000
G1 X87.106 Y137.262 E-.21969
G1 X87.106 Y136.729 E-.20264
G1 X87.734 Y137.357 E-.33767
; WIPE_END
G1 E-.04 F1800
G1 X95.231 Y135.923 Z1.5 F15000
G1 X106.29 Y133.807 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.162612
G1 F7500
G3 X105.773 Y133.799 I-.21 J-2.9 E.0049
; WIPE_START
G1 X106.29 Y133.807 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.912 Y137.671 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.143058
G1 F7500
G2 X105.668 Y137.553 I-.743 J1.221 E.00215
G1 X105.889 Y137.69 F15000
; LINE_WIDTH: 0.103521
G1 F7500
G2 X105.696 Y137.524 I-.93 J.885 E.00122
; WIPE_START
G1 X105.889 Y137.69 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.921 Y131.999 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y113.716 E.83142
G1 X87.639 Y114.293 E.01853
G1 X105.738 Y132.392 E.82309
G1 X105.738 Y132.968 E.01853
G1 X87.639 Y114.869 E.82309
G1 X87.639 Y115.445 E.01853
G1 X105.383 Y133.19 E.80695
G1 X104.807 Y133.19 E.01853
G1 X87.639 Y116.021 E.78074
G1 X87.639 Y116.598 E.01853
G1 X104.231 Y133.19 E.75454
G1 X103.655 Y133.19 E.01853
G1 X87.639 Y117.174 E.72833
G1 X87.639 Y117.75 E.01853
G1 X103.078 Y133.19 E.70213
G1 X102.502 Y133.19 E.01853
G1 X87.639 Y118.326 E.67592
G1 X87.639 Y118.903 E.01853
G1 X101.926 Y133.19 E.64972
G1 X101.35 Y133.19 E.01853
G1 X87.639 Y119.479 E.62351
G1 X87.639 Y120.055 E.01853
G1 X100.773 Y133.19 E.59731
G1 X100.197 Y133.19 E.01853
G1 X87.639 Y120.631 E.5711
G1 X87.639 Y121.208 E.01853
G1 X99.621 Y133.19 E.5449
G1 X99.045 Y133.19 E.01853
G1 X87.639 Y121.784 E.5187
G1 X87.639 Y122.36 E.01853
G1 X98.468 Y133.19 E.49249
G1 X97.892 Y133.19 E.01853
G1 X87.639 Y122.936 E.46629
G1 X87.639 Y123.512 E.01853
G1 X97.316 Y133.19 E.44008
G1 X96.74 Y133.19 E.01853
G1 X87.639 Y124.089 E.41388
G1 X87.639 Y124.665 E.01853
G1 X96.164 Y133.19 E.38767
G1 X95.587 Y133.19 E.01853
G1 X87.639 Y125.241 E.36147
G1 X87.639 Y125.817 E.01853
G1 X95.011 Y133.19 E.33526
G1 X94.435 Y133.19 E.01853
G1 X87.639 Y126.394 E.30906
G1 X87.639 Y126.97 E.01853
G1 X93.859 Y133.19 E.28285
G1 X93.282 Y133.19 E.01853
G1 X87.639 Y127.546 E.25665
G1 X87.639 Y128.122 E.01853
G1 X92.706 Y133.19 E.23044
G1 X92.13 Y133.19 E.01853
G1 X87.639 Y128.699 E.20424
G1 X87.639 Y129.275 E.01853
G1 X91.554 Y133.19 E.17803
G1 X90.977 Y133.19 E.01853
G1 X87.639 Y129.851 E.15183
G1 X87.639 Y130.427 E.01853
G1 X90.401 Y133.19 E.12562
G1 X89.825 Y133.19 E.01853
G1 X87.639 Y131.004 E.09942
G1 X87.639 Y131.58 E.01853
G1 X89.249 Y133.19 E.07321
G1 X88.672 Y133.19 E.01853
G1 X87.639 Y132.156 E.04701
G1 X87.639 Y132.732 E.01853
G1 X88.279 Y133.373 E.02913
; WIPE_START
G1 X87.639 Y132.732 E-.34427
G1 X87.639 Y132.156 E-.21897
G1 X88.005 Y132.522 E-.19676
; WIPE_END
G1 E-.04 F1800
G1 X94.433 Y128.406 Z1.5 F15000
G1 X105.921 Y121.05 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F7800
G1 X100.478 Y115.607 E.24753
G1 X100.546 Y116.251 E.02082
G1 X105.738 Y121.444 E.23613
G1 X105.738 Y122.02 E.01853
G1 X100.614 Y116.895 E.23305
G3 X100.549 Y117.407 I-.607 J.183 E.01707
G1 X105.738 Y122.596 E.236
G1 X105.738 Y123.172 E.01853
G1 X100.407 Y117.841 E.24242
G1 X100.266 Y118.276 E.01471
G1 X105.738 Y123.748 E.24885
G1 X105.738 Y124.325 E.01853
G1 X100.122 Y118.708 E.25541
G1 X99.849 Y119.012 E.01312
G1 X105.738 Y124.901 E.26783
G1 X105.738 Y125.477 E.01853
G1 X99.576 Y119.315 E.28024
G1 X99.303 Y119.618 E.01312
G1 X105.738 Y126.053 E.29266
G1 X105.738 Y126.63 E.01853
G1 X99.03 Y119.921 E.30507
G1 X98.634 Y120.102 E.01398
G1 X105.738 Y127.206 E.32306
G1 X105.738 Y127.782 E.01853
G1 X98.235 Y120.279 E.34119
G1 X97.837 Y120.457 E.01403
G1 X105.738 Y128.358 E.35933
G1 X105.738 Y128.935 E.01853
G1 X97.404 Y120.6 E.379
G1 X96.828 Y120.6 E.01853
G1 X105.738 Y129.511 E.40521
G1 X105.738 Y130.087 E.01853
G1 X96.252 Y120.6 E.43141
G3 X95.525 Y120.45 I-.194 J-.891 E.02457
G1 X105.738 Y130.663 E.46446
G1 X105.738 Y131.24 E.01853
G1 X87.639 Y113.14 E.82309
G1 X87.639 Y112.564 E.01853
G1 X92.995 Y117.92 E.24359
G1 X92.743 Y117.092 E.02786
G1 X87.639 Y111.988 E.23211
G1 X87.639 Y111.412 E.01853
G1 X92.798 Y116.57 E.2346
G1 X92.852 Y116.049 E.01686
G1 X87.639 Y110.835 E.23709
G1 X87.639 Y110.259 E.01853
G1 X92.907 Y115.527 E.23959
G3 X93.106 Y115.15 I.523 J.035 E.01412
G1 X87.639 Y109.683 E.24865
G1 X87.639 Y109.107 E.01853
G1 X93.317 Y114.785 E.25824
G1 X93.528 Y114.42 E.01356
G1 X87.639 Y108.53 E.26783
G1 X87.639 Y107.954 E.01853
G1 X93.74 Y114.056 E.27748
G1 X94.074 Y113.813 E.01327
G1 X87.639 Y107.378 E.29266
G1 X87.639 Y106.802 E.01853
G1 X94.408 Y113.571 E.30783
G1 X94.742 Y113.328 E.01327
G1 X87.639 Y106.225 E.32301
G1 X87.639 Y105.649 E.01853
G1 X95.076 Y113.087 E.33823
G1 X95.552 Y112.986 E.01562
G1 X87.639 Y105.073 E.35985
G1 X87.639 Y104.497 E.01853
G1 X96.027 Y112.885 E.38146
G1 X96.502 Y112.784 E.01562
G1 X87.639 Y103.92 E.40307
G1 X87.639 Y103.344 E.01853
G1 X97.133 Y112.839 E.43177
G1 X97.865 Y112.994 E.02406
G1 X87.639 Y102.768 E.46505
G1 X87.639 Y102.192 E.01853
G1 X105.738 Y120.291 E.82309
G1 X105.738 Y119.715 E.01853
G1 X87.639 Y101.615 E.82309
G1 X87.639 Y101.039 E.01853
G1 X105.738 Y119.139 E.82309
G1 X105.738 Y118.562 E.01853
G1 X87.639 Y100.463 E.82309
G1 X87.639 Y100.242 E.00712
G1 X87.994 Y100.242 E.01141
G1 X105.738 Y117.986 E.80694
G1 X105.738 Y117.41 E.01853
G1 X88.57 Y100.242 E.78074
G1 X89.146 Y100.242 E.01853
G1 X105.738 Y116.834 E.75454
G1 X105.738 Y116.257 E.01853
G1 X89.722 Y100.242 E.72833
G1 X90.299 Y100.242 E.01853
G1 X105.738 Y115.681 E.70213
G1 X105.738 Y115.105 E.01853
G1 X90.875 Y100.242 E.67592
G1 X91.451 Y100.242 E.01853
G1 X105.738 Y114.529 E.64972
G1 X105.738 Y113.952 E.01853
G1 X92.027 Y100.242 E.62351
G1 X92.604 Y100.242 E.01853
G1 X105.738 Y113.376 E.59731
G1 X105.738 Y112.8 E.01853
G1 X93.18 Y100.242 E.5711
G1 X93.756 Y100.242 E.01853
G1 X105.738 Y112.224 E.5449
G1 X105.738 Y111.648 E.01853
G1 X94.332 Y100.242 E.51869
G1 X94.909 Y100.242 E.01853
G1 X105.738 Y111.071 E.49249
G1 X105.738 Y110.495 E.01853
G1 X95.485 Y100.242 E.46628
G1 X96.061 Y100.242 E.01853
G1 X105.738 Y109.919 E.44008
G1 X105.738 Y109.343 E.01853
G1 X96.637 Y100.242 E.41387
G1 X97.213 Y100.242 E.01853
G1 X105.738 Y108.766 E.38767
G1 X105.738 Y108.19 E.01853
G1 X97.79 Y100.242 E.36146
G1 X98.366 Y100.242 E.01853
G1 X105.738 Y107.614 E.33526
G1 X105.738 Y107.038 E.01853
G1 X98.942 Y100.242 E.30905
G1 X99.518 Y100.242 E.01853
G1 X105.738 Y106.461 E.28285
G1 X105.738 Y105.885 E.01853
G1 X100.095 Y100.242 E.25664
G1 X100.671 Y100.242 E.01853
G1 X105.738 Y105.309 E.23044
G1 X105.738 Y104.733 E.01853
G1 X101.247 Y100.242 E.20423
G1 X101.823 Y100.242 E.01853
G1 X105.738 Y104.156 E.17803
G1 X105.738 Y103.58 E.01853
G1 X102.4 Y100.242 E.15182
G1 X102.976 Y100.242 E.01853
G1 X105.738 Y103.004 E.12562
G1 X105.738 Y102.428 E.01853
G1 X103.552 Y100.242 E.09941
G1 X104.128 Y100.242 E.01853
G1 X105.738 Y101.852 E.07321
G1 X105.738 Y101.275 E.01853
G1 X104.705 Y100.242 E.047
G1 X105.281 Y100.242 E.01853
G1 X105.921 Y100.882 E.02913
; WIPE_START
G1 X105.281 Y100.242 E-.34423
G1 X104.705 Y100.242 E-.21897
G1 X105.071 Y100.608 E-.1968
; WIPE_END
G1 E-.04 F1800
G1 X105.862 Y95.76 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X106.271 Y96.169 E.01722
G1 X106.271 Y96.703
G1 X105.377 Y95.809 E.03766
G1 X104.844 Y95.809
G1 X106.271 Y97.236 E.06012
G1 X106.271 Y97.769
G1 X104.311 Y95.809 E.08259
G1 X103.777 Y95.809
G1 X106.271 Y98.302 E.10505
G1 X106.271 Y98.836
G1 X103.244 Y95.809 E.12751
G1 X102.711 Y95.809
G1 X106.271 Y99.369 E.14998
G1 X106.04 Y99.671
G1 X102.178 Y95.809 E.1627
G1 X101.644 Y95.809
G1 X105.459 Y99.623 E.16067
G1 X104.925 Y99.623
G1 X101.111 Y95.809 E.16067
G1 X100.578 Y95.809
G1 X104.392 Y99.623 E.16067
G1 X103.859 Y99.623
G1 X100.045 Y95.809 E.16067
G1 X99.511 Y95.809
G1 X103.325 Y99.623 E.16067
G1 X102.792 Y99.623
G1 X98.978 Y95.809 E.16067
G1 X98.445 Y95.809
G1 X102.259 Y99.623 E.16067
G1 X101.726 Y99.623
G1 X97.911 Y95.809 E.16067
G1 X97.378 Y95.809
G1 X101.192 Y99.623 E.16067
G1 X100.659 Y99.623
G1 X96.845 Y95.809 E.16067
G1 X96.312 Y95.809
G1 X100.126 Y99.623 E.16067
G1 X99.593 Y99.623
G1 X95.778 Y95.809 E.16067
G1 X95.245 Y95.809
G1 X99.059 Y99.623 E.16067
G1 X98.526 Y99.623
G1 X94.712 Y95.809 E.16067
G1 X94.179 Y95.809
G1 X97.993 Y99.623 E.16067
G1 X97.46 Y99.623
G1 X93.645 Y95.809 E.16067
G1 X93.112 Y95.809
G1 X96.926 Y99.623 E.16067
G1 X96.393 Y99.623
G1 X92.579 Y95.809 E.16067
G1 X92.046 Y95.809
G1 X95.86 Y99.623 E.16067
G1 X95.327 Y99.623
G1 X91.512 Y95.809 E.16067
G1 X90.979 Y95.809
G1 X94.793 Y99.623 E.16067
G1 X94.26 Y99.623
G1 X90.446 Y95.809 E.16067
G1 X89.913 Y95.809
G1 X93.727 Y99.623 E.16067
G1 X93.194 Y99.623
G1 X89.379 Y95.809 E.16067
G1 X88.846 Y95.809
G1 X92.66 Y99.623 E.16067
G1 X92.127 Y99.623
G1 X88.313 Y95.809 E.16067
G1 X87.78 Y95.809
G1 X91.594 Y99.623 E.16067
G1 X91.061 Y99.623
G1 X87.198 Y95.76 E.1627
G1 X87.106 Y96.201
G1 X90.527 Y99.623 E.14413
G1 X89.994 Y99.623
G1 X87.106 Y96.735 E.12166
G1 X87.106 Y97.268
G1 X89.461 Y99.623 E.0992
G1 X88.928 Y99.623
G1 X87.106 Y97.801 E.07674
G1 X87.106 Y98.334
G1 X88.394 Y99.623 E.05427
G1 X87.861 Y99.623
G1 X87.106 Y98.868 E.03181
; WIPE_START
M204 S5000
G1 X87.861 Y99.623 E-.40582
G1 X88.394 Y99.623 E-.20264
G1 X88.112 Y99.341 E-.15154
; WIPE_END
G1 E-.04 F1800
G1 X87.681 Y95.907 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103616
G1 F7500
G3 X87.488 Y95.742 I.733 J-1.046 E.00122
G1 X87.709 Y95.879 F15000
; LINE_WIDTH: 0.143136
G1 F7500
G3 X87.465 Y95.76 I.498 J-1.339 E.00216
; WIPE_START
G1 X87.709 Y95.879 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.604 Y99.633 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.162448
G1 F7500
G2 X87.087 Y99.624 I-.307 J2.886 E.00489
; WIPE_START
G1 X87.604 Y99.633 E-.76
; WIPE_END
M73 P49 R21
G1 E-.04 F1800
G1 X88.284 Y95.373 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y94.727 E.02936
G1 X87.639 Y94.148 E.01863
G1 X88.681 Y95.19 E.04738
G1 X89.26 Y95.19 E.01863
G1 X87.639 Y93.568 E.07373
G1 X87.639 Y93.242 E.0105
G1 X87.892 Y93.242 E.00813
G1 X89.84 Y95.19 E.08858
G1 X90.419 Y95.19 E.01863
G1 X88.471 Y93.242 E.08858
G1 X89.051 Y93.242 E.01863
G1 X90.999 Y95.19 E.08858
G1 X91.578 Y95.19 E.01863
G1 X89.63 Y93.242 E.08858
G1 X90.21 Y93.242 E.01863
G1 X92.158 Y95.19 E.08858
G1 X92.737 Y95.19 E.01863
G1 X90.789 Y93.242 E.08858
G1 X91.369 Y93.242 E.01863
G1 X93.317 Y95.19 E.08858
G1 X93.896 Y95.19 E.01863
G1 X91.948 Y93.242 E.08858
G1 X92.528 Y93.242 E.01863
G1 X94.475 Y95.19 E.08858
G1 X95.055 Y95.19 E.01863
G1 X93.107 Y93.242 E.08858
G1 X93.686 Y93.242 E.01863
G1 X95.634 Y95.19 E.08858
G1 X96.214 Y95.19 E.01863
G1 X94.266 Y93.242 E.08858
G1 X94.845 Y93.242 E.01863
G1 X96.793 Y95.19 E.08858
G1 X97.373 Y95.19 E.01863
G1 X95.425 Y93.242 E.08858
G1 X96.004 Y93.242 E.01863
G1 X97.952 Y95.19 E.08858
G1 X98.532 Y95.19 E.01863
G1 X96.584 Y93.242 E.08858
G1 X97.163 Y93.242 E.01863
G1 X99.111 Y95.19 E.08858
G1 X99.691 Y95.19 E.01863
G1 X97.743 Y93.242 E.08858
G1 X98.322 Y93.242 E.01863
G1 X100.27 Y95.19 E.08858
G1 X100.85 Y95.19 E.01863
G1 X98.902 Y93.242 E.08858
G1 X99.481 Y93.242 E.01863
G1 X101.429 Y95.19 E.08858
G1 X102.009 Y95.19 E.01863
G1 X100.061 Y93.242 E.08858
G1 X100.64 Y93.242 E.01863
G1 X102.588 Y95.19 E.08858
G1 X103.168 Y95.19 E.01863
G1 X101.22 Y93.242 E.08858
G1 X101.799 Y93.242 E.01863
G1 X103.747 Y95.19 E.08858
G1 X104.327 Y95.19 E.01863
G1 X102.379 Y93.242 E.08858
G1 X102.958 Y93.242 E.01863
G1 X104.906 Y95.19 E.08858
G1 X105.485 Y95.19 E.01863
G1 X103.538 Y93.242 E.08858
G1 X104.117 Y93.242 E.01863
G1 X105.738 Y94.863 E.07372
G1 X105.738 Y94.283 E.01863
G1 X104.696 Y93.242 E.04737
G1 X105.276 Y93.242 E.01863
G1 X105.921 Y93.887 E.02935
; WIPE_START
G1 X105.276 Y93.242 E-.34684
G1 X104.696 Y93.242 E-.2202
G1 X105.056 Y93.601 E-.19296
; WIPE_END
G1 E-.04 F1800
G1 X105.821 Y88.787 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X106.271 Y89.237 E.01897
G1 X106.271 Y89.77
G1 X105.309 Y88.809 E.04051
G1 X104.776 Y88.809
G1 X106.271 Y90.303 E.06297
G1 X106.271 Y90.837
G1 X104.243 Y88.809 E.08544
G1 X103.71 Y88.809
G1 X106.271 Y91.37 E.1079
G1 X106.271 Y91.903
G1 X103.176 Y88.809 E.13036
G1 X102.643 Y88.809
G1 X106.271 Y92.437 E.15283
G1 X105.972 Y92.671
G1 X102.11 Y88.809 E.1627
G1 X101.577 Y88.809
G1 X105.391 Y92.623 E.16067
G1 X104.858 Y92.623
G1 X101.043 Y88.809 E.16067
G1 X100.51 Y88.809
G1 X104.324 Y92.623 E.16067
G1 X103.791 Y92.623
G1 X99.977 Y88.809 E.16067
G1 X99.444 Y88.809
G1 X103.258 Y92.623 E.16067
G1 X102.725 Y92.623
G1 X98.91 Y88.809 E.16067
G1 X98.377 Y88.809
G1 X102.191 Y92.623 E.16067
G1 X101.658 Y92.623
G1 X97.844 Y88.809 E.16067
G1 X97.311 Y88.809
G1 X101.125 Y92.623 E.16067
G1 X100.592 Y92.623
G1 X96.777 Y88.809 E.16067
G1 X96.244 Y88.809
G1 X100.058 Y92.623 E.16067
G1 X99.525 Y92.623
G1 X95.711 Y88.809 E.16067
G1 X95.178 Y88.809
G1 X98.992 Y92.623 E.16067
G1 X98.459 Y92.623
G1 X94.644 Y88.809 E.16067
G1 X94.111 Y88.809
G1 X97.925 Y92.623 E.16067
G1 X97.392 Y92.623
G1 X93.578 Y88.809 E.16067
G1 X93.044 Y88.809
G1 X96.859 Y92.623 E.16067
G1 X96.325 Y92.623
G1 X92.511 Y88.809 E.16067
G1 X91.978 Y88.809
G1 X95.792 Y92.623 E.16067
G1 X95.259 Y92.623
G1 X91.445 Y88.809 E.16067
G1 X90.911 Y88.809
G1 X94.726 Y92.623 E.16067
G1 X94.192 Y92.623
G1 X90.378 Y88.809 E.16067
G1 X89.845 Y88.809
G1 X93.659 Y92.623 E.16067
G1 X93.126 Y92.623
G1 X89.312 Y88.809 E.16067
G1 X88.778 Y88.809
G1 X92.593 Y92.623 E.16067
G1 X92.059 Y92.623
G1 X88.245 Y88.809 E.16067
G1 X87.712 Y88.809
G1 X91.526 Y92.623 E.16067
G1 X90.993 Y92.623
G1 X87.131 Y88.76 E.1627
G1 X87.106 Y89.269
G1 X90.46 Y92.623 E.14128
G1 X89.926 Y92.623
G1 X87.106 Y89.802 E.11881
G1 X87.106 Y90.336
G1 X89.393 Y92.623 E.09635
G1 X88.86 Y92.623
G1 X87.106 Y90.869 E.07389
G1 X87.106 Y91.402
G1 X88.327 Y92.623 E.05142
G1 X87.793 Y92.623
G1 X87.106 Y91.935 E.02896
; WIPE_START
M204 S5000
G1 X87.793 Y92.623 E-.36947
G1 X88.327 Y92.623 E-.20264
G1 X87.977 Y92.273 E-.18789
; WIPE_END
G1 E-.04 F1800
G1 X88.285 Y88.373 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y87.727 E.02937
G1 X87.639 Y87.148 E.01862
G1 X88.681 Y88.19 E.04738
G1 X89.26 Y88.19 E.01862
G1 X87.639 Y86.569 E.07371
G1 X87.639 Y85.99 E.01862
G1 X89.839 Y88.19 E.10005
G1 X90.418 Y88.19 E.01862
G1 X87.639 Y85.411 E.12638
G1 X87.639 Y84.831 E.01862
G1 X90.997 Y88.19 E.15272
G1 X91.576 Y88.19 E.01862
G1 X87.639 Y84.252 E.17905
G1 X87.639 Y83.673 E.01862
G1 X92.155 Y88.19 E.20539
G1 X92.734 Y88.19 E.01862
G1 X87.639 Y83.094 E.23172
G1 X87.639 Y82.515 E.01862
G1 X93.313 Y88.19 E.25806
G1 X93.893 Y88.19 E.01862
G1 X87.639 Y81.936 E.28439
G1 X87.639 Y81.357 E.01862
G1 X94.472 Y88.19 E.31073
G1 X95.051 Y88.19 E.01862
G1 X87.639 Y80.778 E.33707
G1 X87.639 Y80.199 E.01862
G1 X95.63 Y88.19 E.3634
G1 X96.209 Y88.19 E.01862
G1 X87.639 Y79.619 E.38974
G1 X87.639 Y79.04 E.01862
G1 X96.788 Y88.19 E.41607
G1 X97.367 Y88.19 E.01862
G1 X87.639 Y78.461 E.44241
G1 X87.639 Y77.882 E.01862
G1 X97.946 Y88.19 E.46874
G1 X98.525 Y88.19 E.01862
G1 X87.639 Y77.303 E.49508
G1 X87.639 Y76.724 E.01862
G1 X99.104 Y88.19 E.52141
G1 X99.684 Y88.19 E.01862
G1 X87.639 Y76.145 E.54775
G1 X87.639 Y75.566 E.01862
G1 X100.263 Y88.19 E.57408
G1 X100.842 Y88.19 E.01862
G1 X87.639 Y74.987 E.60042
G1 X87.639 Y74.408 E.01862
G1 X101.421 Y88.19 E.62676
G1 X102 Y88.19 E.01862
G1 X87.639 Y73.828 E.65309
G1 X87.639 Y73.249 E.01862
G1 X102.579 Y88.19 E.67943
G1 X103.158 Y88.19 E.01862
G1 X87.639 Y72.67 E.70576
G1 X87.639 Y72.091 E.01862
G1 X103.737 Y88.19 E.7321
G1 X104.316 Y88.19 E.01862
G1 X87.639 Y71.512 E.75843
G1 X87.639 Y70.933 E.01862
G1 X104.896 Y88.19 E.78477
G1 X105.475 Y88.19 E.01862
G1 X87.639 Y70.354 E.8111
G1 X87.639 Y69.775 E.01862
G1 X105.738 Y87.874 E.82309
G1 X105.738 Y87.295 E.01862
G1 X87.639 Y69.196 E.82309
G1 X87.639 Y68.616 E.01862
G1 X105.921 Y86.899 E.83142
; WIPE_START
G1 X104.507 Y85.485 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.621 Y77.934 Z1.5 F15000
G1 X105.921 Y75.896 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F7800
G1 X100.4 Y70.375 E.25109
G1 X100.466 Y70.488 E.00423
G1 X100.528 Y71.082 E.01919
G1 X105.738 Y76.292 E.23694
G1 X105.738 Y76.871 E.01862
G1 X100.596 Y71.729 E.23384
G3 X100.584 Y72.296 I-.643 J.271 E.0188
G1 X105.738 Y77.45 E.23437
G1 X105.738 Y78.029 E.01862
G1 X100.442 Y72.734 E.24083
G1 X100.3 Y73.171 E.01478
G1 X105.738 Y78.608 E.24729
G1 X105.738 Y79.187 E.01862
G1 X100.158 Y73.608 E.25374
G3 X99.912 Y73.941 I-.497 J-.11 E.01371
G1 X105.738 Y79.767 E.26493
G1 X105.738 Y80.346 E.01862
G1 X99.638 Y74.246 E.27741
G1 X99.364 Y74.55 E.01319
G1 X105.738 Y80.925 E.28989
G1 X105.738 Y81.504 E.01862
G1 X99.089 Y74.855 E.30236
G3 X98.719 Y75.064 I-.42 J-.311 E.01408
G1 X105.738 Y82.083 E.3192
G1 X105.738 Y82.662 E.01862
G1 X98.318 Y75.242 E.33742
G1 X97.918 Y75.421 E.0141
G1 X105.738 Y83.241 E.35564
G1 X105.738 Y83.82 E.01862
G1 X97.517 Y75.599 E.37386
G1 X96.939 Y75.6 E.01858
G1 X105.738 Y84.399 E.40014
G1 X105.738 Y84.979 E.01862
G1 X96.36 Y75.6 E.42648
G3 X95.715 Y75.535 I-.249 J-.757 E.02146
G1 X105.738 Y85.558 E.45579
G1 X105.738 Y86.137 E.01862
G1 X87.639 Y68.037 E.82309
G1 X87.639 Y67.458 E.01862
G1 X92.944 Y72.764 E.24127
G1 X92.739 Y72.131 E.0214
G1 X92.753 Y71.993 E.00444
G1 X87.639 Y66.879 E.23258
G1 X87.639 Y66.3 E.01862
G1 X92.808 Y71.469 E.23508
G1 X92.863 Y70.945 E.01694
G1 X87.639 Y65.721 E.23759
G1 X87.639 Y65.142 E.01862
G1 X92.938 Y70.441 E.24101
G1 X93.15 Y70.074 E.01363
G1 X87.639 Y64.563 E.25064
G1 X87.639 Y63.984 E.01862
G1 X93.362 Y69.707 E.26028
G1 X93.574 Y69.34 E.01363
G1 X87.639 Y63.405 E.26992
G1 X87.639 Y62.825 E.01862
G1 X93.815 Y69.002 E.28087
G1 X94.15 Y68.758 E.01333
G1 X87.639 Y62.246 E.29612
G1 X87.639 Y61.667 E.01862
G1 X94.486 Y68.514 E.31137
G1 X94.821 Y68.271 E.01333
G1 X87.639 Y61.088 E.32663
G1 X87.639 Y60.509 E.01862
G1 X95.192 Y68.062 E.34349
G1 X95.67 Y67.961 E.0157
G1 X87.639 Y59.93 E.36521
G1 X87.639 Y59.351 E.01862
G1 X96.147 Y67.859 E.38693
G1 X96.625 Y67.758 E.0157
G1 X87.639 Y58.772 E.40865
G1 X87.639 Y58.193 E.01862
G1 X97.326 Y67.88 E.44053
G1 X98.061 Y68.036 E.02418
G1 X87.639 Y57.613 E.47397
G1 X87.639 Y57.034 E.01862
G1 X105.738 Y75.134 E.82309
G1 X105.738 Y74.555 E.01862
G1 X87.639 Y56.455 E.82309
G1 X87.639 Y55.876 E.01862
G1 X105.738 Y73.975 E.82309
G1 X105.738 Y73.396 E.01862
G1 X87.639 Y55.297 E.82309
G1 X87.639 Y54.718 E.01862
G1 X105.738 Y72.817 E.82309
G1 X105.738 Y72.238 E.01862
G1 X87.639 Y54.139 E.82309
G1 X87.639 Y53.56 E.01862
G1 X105.738 Y71.659 E.82309
G1 X105.738 Y71.08 E.01862
G1 X87.639 Y52.981 E.82309
G1 X87.639 Y52.666 E.01012
G1 X87.903 Y52.666 E.00851
G1 X105.738 Y70.501 E.81106
G1 X105.738 Y69.922 E.01862
G1 X88.482 Y52.666 E.78472
G1 X89.062 Y52.666 E.01862
G1 X105.738 Y69.343 E.75839
G1 X105.738 Y68.764 E.01862
G1 X89.641 Y52.666 E.73205
G1 X90.22 Y52.666 E.01862
G1 X105.738 Y68.184 E.70572
G1 X105.738 Y67.605 E.01862
G1 X90.799 Y52.666 E.67938
G1 X91.378 Y52.666 E.01862
G1 X105.738 Y67.026 E.65304
G1 X105.738 Y66.447 E.01862
G1 X91.957 Y52.666 E.62671
G1 X92.536 Y52.666 E.01862
G1 X105.738 Y65.868 E.60037
G1 X105.738 Y65.289 E.01862
G1 X93.115 Y52.666 E.57404
G1 X93.694 Y52.666 E.01862
G1 X105.738 Y64.71 E.5477
G1 X105.738 Y64.131 E.01862
G1 X94.273 Y52.666 E.52137
G1 X94.853 Y52.666 E.01862
G1 X105.738 Y63.552 E.49503
G1 X105.738 Y62.972 E.01862
G1 X95.432 Y52.666 E.4687
G1 X96.011 Y52.666 E.01862
G1 X105.738 Y62.393 E.44236
G1 X105.738 Y61.814 E.01862
G1 X96.59 Y52.666 E.41603
G1 X97.169 Y52.666 E.01862
G1 X105.738 Y61.235 E.38969
G1 X105.738 Y60.656 E.01862
G1 X97.748 Y52.666 E.36335
G1 X98.327 Y52.666 E.01862
G1 X105.738 Y60.077 E.33702
G1 X105.738 Y59.498 E.01862
G1 X98.906 Y52.666 E.31068
G1 X99.485 Y52.666 E.01862
G1 X105.738 Y58.919 E.28435
G1 X105.738 Y58.34 E.01862
G1 X100.065 Y52.666 E.25801
G1 X100.644 Y52.666 E.01862
G1 X105.738 Y57.761 E.23168
G1 X105.738 Y57.181 E.01862
G1 X101.223 Y52.666 E.20534
G1 X101.802 Y52.666 E.01862
G1 X105.738 Y56.602 E.17901
G1 X105.738 Y56.023 E.01862
G1 X102.381 Y52.666 E.15267
G1 X102.96 Y52.666 E.01862
G1 X105.738 Y55.444 E.12634
G1 X105.738 Y54.865 E.01862
G1 X103.539 Y52.666 E.1
G1 X104.118 Y52.666 E.01862
G1 X105.738 Y54.286 E.07367
G1 X105.738 Y53.707 E.01862
G1 X104.697 Y52.666 E.04733
G1 X105.276 Y52.666 E.01862
G1 X105.921 Y53.311 E.02932
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X105.276 Y52.666 E-.34654
G1 X104.697 Y52.666 E-.22006
G1 X105.057 Y53.026 E-.1934
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 6/20
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.5 I1.217 J0 P1  F15000
; object ids of layer 6 start: 138,178
M624 AwAAAAAAAAA=
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
; object ids of this layer6 end: 138,178
M625
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X199.995 Y66.256
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X162.791 Y66.256 E1.19635
G1 X162.791 Y91.256 E.80391
G1 X161.995 Y91.256 E.02559
G1 X161.995 Y66.256 E.80391
G1 X155.791 Y66.256 E.1995
G1 X155.791 Y142.087 E2.43847
G1 X154.995 Y142.087 E.02559
G1 X154.995 Y65.46 E2.46406
G1 X207.791 Y65.46 E1.69772
G1 X207.791 Y142.087 E2.46406
M73 P50 R21
G1 X206.995 Y142.087 E.02559
G1 X206.995 Y66.256 E2.43847
G1 X200.791 Y66.256 E.1995
G1 X200.791 Y91.256 E.80391
G1 X199.995 Y91.256 E.02559
G1 X199.995 Y66.316 E.80198
M204 S250
G1 X199.603 Y66.648 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X163.183 Y66.648 E1.08483
G1 X163.183 Y91.648 E.74466
G1 X161.603 Y91.648 E.04706
G1 X161.603 Y66.648 E.74466
G1 X156.183 Y66.648 E.16144
G1 X156.183 Y160.057 E2.78236
G1 X154.603 Y160.057 E.04706
G1 X154.603 Y65.068 E2.82942
G1 X208.183 Y65.068 E1.59597
G1 X208.183 Y160.057 E2.82942
G1 X206.603 Y160.057 E.04706
G1 X206.603 Y66.648 E2.78236
G1 X201.183 Y66.648 E.16144
G1 X201.183 Y91.648 E.74466
G1 X199.603 Y91.648 E.04706
G1 X199.603 Y66.708 E.74288
; WIPE_START
M204 S5000
G1 X197.603 Y66.704 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.393 Y66.052 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.490218
G1 F7500
G1 X200.393 Y65.906 E.00515
G1 X200.491 Y65.882 E.00354
; LINE_WIDTH: 0.45602
G1 X200.588 Y65.858 E.00327
; LINE_WIDTH: 0.43172
G1 X207.199 Y65.858 E.20305
; LINE_WIDTH: 0.470635
G1 X207.36 Y65.891 E.00556
G1 X207.377 Y65.972 E.00278
; LINE_WIDTH: 0.448395
G1 X207.393 Y66.052 E.00263
; LINE_WIDTH: 0.43172
G1 X207.393 Y141.884 E2.32897
; WIPE_START
G1 X207.393 Y139.884 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.625 Y147.513 Z1.7 F15000
G1 X207.976 Y159.033 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X207.158 Y159.85 E.03444
G1 X206.811 Y159.665
G1 X207.976 Y158.499 E.04908
G1 X207.976 Y157.966
G1 X206.811 Y159.131 E.04908
M73 P50 R20
G1 X206.811 Y158.598
G1 X207.976 Y157.433 E.04908
G1 X207.976 Y156.9
G1 X206.811 Y158.065 E.04908
G1 X206.811 Y157.532
G1 X207.976 Y156.366 E.04908
G1 X207.976 Y155.833
G1 X206.811 Y156.998 E.04908
G1 X206.811 Y156.465
G1 X207.976 Y155.3 E.04908
G1 X207.976 Y154.767
G1 X206.811 Y155.932 E.04908
G1 X206.811 Y155.398
G1 X207.976 Y154.233 E.04908
G1 X207.976 Y153.7
G1 X206.811 Y154.865 E.04908
G1 X206.811 Y154.332
G1 X207.976 Y153.167 E.04908
G1 X207.976 Y152.633
G1 X206.811 Y153.799 E.04908
G1 X206.811 Y153.265
G1 X207.976 Y152.1 E.04908
G1 X207.976 Y151.567
G1 X206.811 Y152.732 E.04908
G1 X206.811 Y152.199
G1 X207.976 Y151.034 E.04908
G1 X207.976 Y150.5
G1 X206.811 Y151.666 E.04908
G1 X206.811 Y151.132
G1 X207.976 Y149.967 E.04908
G1 X207.976 Y149.434
G1 X206.811 Y150.599 E.04908
G1 X206.811 Y150.066
G1 X207.976 Y148.901 E.04908
G1 X207.976 Y148.367
G1 X206.811 Y149.533 E.04908
G1 X206.811 Y148.999
G1 X207.976 Y147.834 E.04908
G1 X207.976 Y147.301
G1 X206.811 Y148.466 E.04908
G1 X206.811 Y147.933
G1 X207.976 Y146.768 E.04908
G1 X207.976 Y146.234
G1 X206.811 Y147.4 E.04908
G1 X206.811 Y146.866
G1 X207.976 Y145.701 E.04908
G1 X207.976 Y145.168
G1 X206.811 Y146.333 E.04908
G1 X206.811 Y145.8
G1 X207.976 Y144.635 E.04908
G1 X207.976 Y144.101
G1 X206.811 Y145.267 E.04908
G1 X206.811 Y144.733
G1 X207.976 Y143.568 E.04908
G1 X207.976 Y143.035
G1 X206.811 Y144.2 E.04908
G1 X206.811 Y143.667
G1 X207.976 Y142.502 E.04908
G1 X207.635 Y142.31
G1 X206.811 Y143.134 E.0347
; WIPE_START
M204 S5000
G1 X207.635 Y142.31 E-.44271
G1 X207.976 Y142.502 E-.14882
G1 X207.662 Y142.815 E-.16847
; WIPE_END
G1 E-.04 F1800
G1 X200.031 Y142.679 Z1.7 F15000
G1 X155.393 Y141.884 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.393 Y66.052 E2.32897
; LINE_WIDTH: 0.470635
G1 X155.427 Y65.891 E.00556
G1 X155.507 Y65.874 E.00278
; LINE_WIDTH: 0.448395
G1 X155.588 Y65.858 E.00263
; LINE_WIDTH: 0.432083
G1 X162.199 Y65.858 E.20324
G1 X162.296 Y65.882 E.00308
; LINE_WIDTH: 0.50462
G1 X162.393 Y65.906 E.00365
G1 X162.491 Y65.882 F15000
; LINE_WIDTH: 0.490218
G1 F7500
G1 X162.393 Y65.906 E.00354
G1 X162.393 Y66.052 E.00515
; LINE_WIDTH: 0.43172
G1 X162.393 Y91.052 E.76781
; WIPE_START
G1 X162.393 Y89.052 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X162.425 Y81.42 Z1.7 F15000
G1 X162.491 Y65.882 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.45602
G1 F7500
G1 X162.588 Y65.858 E.00327
; LINE_WIDTH: 0.431785
G1 X200.199 Y65.858 E1.15532
G1 X200.296 Y65.882 E.00308
; LINE_WIDTH: 0.50462
G1 X200.393 Y65.906 E.00365
G1 X200.393 Y66.052 F15000
; LINE_WIDTH: 0.43172
G1 F7500
G1 X200.393 Y91.052 E.76781
; WIPE_START
G1 X200.393 Y89.052 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X196.302 Y95.495 Z1.7 F15000
G1 X155.432 Y159.85 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X155.976 Y159.307 E.02289
G1 X155.976 Y158.773
G1 X154.899 Y159.85 E.04536
G1 X154.811 Y159.405
G1 X155.976 Y158.24 E.04908
G1 X155.976 Y157.707
G1 X154.811 Y158.872 E.04908
G1 X154.811 Y158.339
G1 X155.976 Y157.174 E.04908
G1 X155.976 Y156.64
G1 X154.811 Y157.806 E.04908
G1 X154.811 Y157.272
G1 X155.976 Y156.107 E.04908
G1 X155.976 Y155.574
G1 X154.811 Y156.739 E.04908
G1 X154.811 Y156.206
G1 X155.976 Y155.041 E.04908
G1 X155.976 Y154.507
G1 X154.811 Y155.673 E.04908
G1 X154.811 Y155.139
G1 X155.976 Y153.974 E.04908
G1 X155.976 Y153.441
G1 X154.811 Y154.606 E.04908
G1 X154.811 Y154.073
G1 X155.976 Y152.908 E.04908
G1 X155.976 Y152.374
G1 X154.811 Y153.539 E.04908
G1 X154.811 Y153.006
G1 X155.976 Y151.841 E.04908
G1 X155.976 Y151.308
G1 X154.811 Y152.473 E.04908
G1 X154.811 Y151.94
G1 X155.976 Y150.774 E.04908
G1 X155.976 Y150.241
G1 X154.811 Y151.406 E.04908
G1 X154.811 Y150.873
G1 X155.976 Y149.708 E.04908
G1 X155.976 Y149.175
G1 X154.811 Y150.34 E.04908
G1 X154.811 Y149.807
G1 X155.976 Y148.641 E.04908
G1 X155.976 Y148.108
G1 X154.811 Y149.273 E.04908
G1 X154.811 Y148.74
G1 X155.976 Y147.575 E.04908
G1 X155.976 Y147.042
G1 X154.811 Y148.207 E.04908
G1 X154.811 Y147.674
G1 X155.976 Y146.508 E.04908
G1 X155.976 Y145.975
G1 X154.811 Y147.14 E.04908
G1 X154.811 Y146.607
G1 X155.976 Y145.442 E.04908
G1 X155.976 Y144.909
G1 X154.811 Y146.074 E.04908
G1 X154.811 Y145.541
G1 X155.976 Y144.375 E.04908
G1 X155.976 Y143.842
G1 X154.811 Y145.007 E.04908
G1 X154.811 Y144.474
G1 X155.976 Y143.309 E.04908
G1 X155.976 Y142.776
G1 X154.811 Y143.941 E.04908
G1 X154.811 Y143.408
G1 X155.909 Y142.31 E.04625
G1 X155.375 Y142.31
G1 X154.811 Y142.874 E.02378
; OBJECT_ID: 178
; WIPE_START
M204 S5000
G1 X155.375 Y142.31 E-.3034
G1 X155.909 Y142.31 E-.20264
G1 X155.436 Y142.782 E-.25397
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X148.314 Y145.527 Z1.7 F15000
G1 X98.867 Y164.582 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.814 Y164.641 E.00254
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04835
G1 X96.197 Y158.205 E.0322
G1 X96.688 Y158.1 E.01615
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04835
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.907 Y164.537 E.04387
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.299 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X96.279 Y158.588 E.02734
G1 X96.688 Y158.501 E.01248
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X93.544 Y157.933 Z1.7 F15000
G1 X87.291 Y144.418 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.742 Y144.869 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F3840
G1 X105.575 Y144.869 E.69908
; WIPE_START
G1 X103.575 Y144.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.959 Y145.367 Z1.7 F15000
G1 X87.456 Y145.923 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X88.057 Y145.321 E.02737
G1 X88.636 Y145.321 E.01861
G1 X87.639 Y146.318 E.04536
G1 X87.639 Y146.897 E.01861
G1 X89.215 Y145.321 E.07168
G1 X89.794 Y145.321 E.01861
G1 X87.639 Y147.476 E.09799
G1 X87.639 Y148.055 E.01861
G1 X90.372 Y145.321 E.12431
G1 X90.951 Y145.321 E.01861
G1 X87.639 Y148.633 E.15063
G1 X87.639 Y149.212 E.01861
G1 X91.53 Y145.321 E.17695
G1 X92.109 Y145.321 E.01861
G1 X87.639 Y149.791 E.20327
G1 X87.639 Y150.369 E.01861
G1 X92.687 Y145.321 E.22958
G1 X93.266 Y145.321 E.01861
G1 X87.639 Y150.948 E.2559
G1 X87.639 Y151.527 E.01861
G1 X93.845 Y145.321 E.28222
G1 X94.423 Y145.321 E.01861
G1 X87.639 Y152.106 E.30854
G1 X87.639 Y152.684 E.01861
G1 X95.002 Y145.321 E.33486
G1 X95.581 Y145.321 E.01861
G1 X87.639 Y153.263 E.36118
G1 X87.639 Y153.842 E.01861
G1 X96.16 Y145.321 E.38749
G1 X96.738 Y145.321 E.01861
G1 X87.639 Y154.421 E.41381
G1 X87.639 Y154.999 E.01861
G1 X97.317 Y145.321 E.44013
G1 X97.896 Y145.321 E.01861
G1 X87.639 Y155.578 E.46645
M73 P51 R20
G1 X87.639 Y156.157 E.01861
G1 X98.475 Y145.321 E.49277
G1 X99.053 Y145.321 E.01861
G1 X87.639 Y156.735 E.51908
G1 X87.639 Y157.314 E.01861
G1 X99.632 Y145.321 E.5454
G1 X100.211 Y145.321 E.01861
G1 X87.639 Y157.893 E.57172
G1 X87.639 Y158.472 E.01861
G1 X100.789 Y145.321 E.59804
G1 X101.368 Y145.321 E.01861
G1 X87.639 Y159.05 E.62436
G1 X87.639 Y159.629 E.01861
G1 X101.947 Y145.321 E.65067
G1 X102.526 Y145.321 E.01861
G1 X87.639 Y160.208 E.67699
G1 X87.639 Y160.787 E.01861
G1 X103.104 Y145.321 E.70331
G1 X103.683 Y145.321 E.01861
G1 X87.639 Y161.365 E.72963
G1 X87.639 Y161.944 E.01861
G1 X104.262 Y145.321 E.75595
G1 X104.841 Y145.321 E.01861
G1 X87.639 Y162.523 E.78226
G1 X87.639 Y163.101 E.01861
G1 X105.419 Y145.321 E.80858
G1 X105.738 Y145.321 E.01026
G1 X105.738 Y145.581 E.00835
G1 X87.639 Y163.68 E.82309
G1 X87.639 Y164.259 E.01861
G1 X105.738 Y146.16 E.82309
G1 X105.738 Y146.738 E.01861
G1 X87.456 Y165.021 E.83142
; WIPE_START
G1 X88.87 Y163.607 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.006 Y171.19 Z1.7 F15000
G1 X87.456 Y176.017 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F7800
G1 X98.159 Y165.314 E.48673
G1 X97.514 Y165.6 E.02268
G1 X97.293 Y165.6 E.00712
G1 X87.639 Y175.255 E.43903
G1 X87.639 Y174.676 E.01861
G1 X96.714 Y165.6 E.41271
G1 X96.136 Y165.6 E.01861
G1 X87.639 Y174.097 E.3864
G1 X87.639 Y173.518 E.01861
G1 X95.651 Y165.506 E.36436
G1 X95.251 Y165.328 E.0141
G1 X87.639 Y172.94 E.34615
G1 X87.639 Y172.361 E.01861
G1 X94.85 Y165.15 E.32794
G1 X94.45 Y164.971 E.0141
G1 X87.639 Y171.782 E.30973
G1 X87.639 Y171.204 E.01861
G1 X94.145 Y164.697 E.29589
G1 X93.871 Y164.392 E.01318
G1 X87.639 Y170.625 E.28342
G1 X87.639 Y170.046 E.01861
G1 X93.597 Y164.088 E.27095
G1 X93.323 Y163.783 E.01318
G1 X87.639 Y169.467 E.25849
G1 X87.639 Y168.889 E.01861
G1 X93.145 Y163.382 E.25041
G1 X93.003 Y162.945 E.01477
G1 X87.639 Y168.31 E.24396
G1 X87.639 Y167.731 E.01861
G1 X92.861 Y162.509 E.2375
G3 X92.748 Y162.043 I.466 J-.36 E.01586
G1 X87.639 Y167.152 E.23234
G1 X87.639 Y166.574 E.01861
G1 X92.816 Y161.397 E.23543
G1 X92.884 Y160.75 E.02091
G1 X87.639 Y165.995 E.23852
G1 X87.639 Y165.416 E.01861
G1 X105.738 Y147.317 E.82309
G1 X105.738 Y147.896 E.01861
G1 X95.674 Y157.96 E.45767
G1 X96.409 Y157.804 E.02416
G1 X105.738 Y148.474 E.42425
G1 X105.738 Y149.053 E.01861
G1 X96.984 Y157.807 E.39809
G1 X97.462 Y157.908 E.01569
G1 X105.738 Y149.632 E.37639
G1 X105.738 Y150.211 E.01861
G1 X97.939 Y158.01 E.35468
G3 X98.383 Y158.145 I.07 J.566 E.01536
G1 X105.738 Y150.789 E.3345
G1 X105.738 Y151.368 E.01861
G1 X98.718 Y158.388 E.31925
G1 X99.053 Y158.632 E.01332
G1 X105.738 Y151.947 E.30401
G1 X105.738 Y152.525 E.01861
G1 X99.388 Y158.875 E.28877
G3 X99.693 Y159.15 I-.156 J.479 E.01357
G1 X105.738 Y153.104 E.27492
G1 X105.738 Y153.683 E.01861
G1 X99.905 Y159.517 E.26529
G1 X100.116 Y159.883 E.01362
G1 X105.738 Y154.262 E.25566
G1 X105.738 Y154.84 E.01861
G1 X100.328 Y160.25 E.24602
G3 X100.485 Y160.672 I-.396 J.387 E.01491
G1 X105.738 Y155.419 E.23889
G1 X105.738 Y155.998 E.01861
G1 X100.54 Y161.196 E.23639
G1 X100.595 Y161.72 E.01693
G1 X105.738 Y156.577 E.23389
G1 X105.738 Y157.155 E.01861
G1 X100.578 Y162.315 E.23464
G1 X100.3 Y163.172 E.02899
G1 X105.738 Y157.734 E.24731
G1 X105.738 Y158.313 E.01861
G1 X87.639 Y176.412 E.82309
G1 X87.639 Y176.991 E.01861
G1 X105.738 Y158.891 E.82309
G1 X105.738 Y159.47 E.01861
G1 X87.639 Y177.57 E.82309
G1 X87.639 Y178.148 E.01861
G1 X105.738 Y160.049 E.82309
G1 X105.738 Y160.628 E.01861
G1 X87.639 Y178.727 E.82309
G1 X87.639 Y179.306 E.01861
G1 X105.738 Y161.206 E.82309
G1 X105.738 Y161.785 E.01861
G1 X87.639 Y179.884 E.82309
G1 X87.639 Y180.463 E.01861
G1 X105.738 Y162.364 E.82309
G1 X105.738 Y162.943 E.01861
G1 X87.915 Y180.765 E.81051
G1 X88.494 Y180.765 E.01861
G1 X105.738 Y163.521 E.78419
G1 X105.738 Y164.1 E.01861
G1 X89.073 Y180.765 E.75787
G1 X89.651 Y180.765 E.01861
G1 X105.738 Y164.679 E.73156
G1 X105.738 Y165.257 E.01861
G1 X90.23 Y180.765 E.70524
G1 X90.809 Y180.765 E.01861
G1 X105.738 Y165.836 E.67892
G1 X105.738 Y166.415 E.01861
G1 X91.388 Y180.765 E.6526
G1 X91.966 Y180.765 E.01861
G1 X105.738 Y166.994 E.62628
G1 X105.738 Y167.572 E.01861
G1 X92.545 Y180.765 E.59997
G1 X93.124 Y180.765 E.01861
G1 X105.738 Y168.151 E.57365
G1 X105.738 Y168.73 E.01861
G1 X93.703 Y180.765 E.54733
G1 X94.281 Y180.765 E.01861
G1 X105.738 Y169.308 E.52101
G1 X105.738 Y169.887 E.01861
G1 X94.86 Y180.765 E.49469
G1 X95.439 Y180.765 E.01861
G1 X105.738 Y170.466 E.46838
G1 X105.738 Y171.045 E.01861
G1 X96.017 Y180.765 E.44206
G1 X96.596 Y180.765 E.01861
G1 X105.738 Y171.623 E.41574
G1 X105.738 Y172.202 E.01861
G1 X97.175 Y180.765 E.38942
G1 X97.754 Y180.765 E.01861
G1 X105.738 Y172.781 E.3631
G1 X105.738 Y173.36 E.01861
G1 X98.332 Y180.765 E.33679
G1 X98.911 Y180.765 E.01861
G1 X105.738 Y173.938 E.31047
G1 X105.738 Y174.517 E.01861
G1 X99.49 Y180.765 E.28415
G1 X100.069 Y180.765 E.01861
G1 X105.738 Y175.096 E.25783
G1 X105.738 Y175.674 E.01861
G1 X100.647 Y180.765 E.23151
G1 X101.226 Y180.765 E.01861
G1 X105.738 Y176.253 E.2052
G1 X105.738 Y176.832 E.01861
G1 X101.805 Y180.765 E.17888
G1 X102.383 Y180.765 E.01861
G1 X105.738 Y177.411 E.15256
G1 X105.738 Y177.989 E.01861
G1 X102.962 Y180.765 E.12624
G1 X103.541 Y180.765 E.01861
G1 X105.738 Y178.568 E.09992
G1 X105.738 Y179.147 E.01861
G1 X104.12 Y180.765 E.0736
G1 X104.698 Y180.765 E.01861
G1 X105.738 Y179.726 E.04729
G1 X105.738 Y180.304 E.01861
G1 X105.094 Y180.949 E.0293
; WIPE_START
G1 X105.738 Y180.304 E-.34623
G1 X105.738 Y179.726 E-.21991
G1 X105.377 Y180.086 E-.19385
; WIPE_END
G1 E-.04 F1800
G1 X105.516 Y172.455 Z1.7 F15000
G1 X106.086 Y141.014 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.138 Y140.294 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y139.694 E.02728
G1 X105.738 Y139.116 E.01857
G1 X104.744 Y140.11 E.04521
G1 X104.167 Y140.11 E.01857
G1 X105.738 Y138.539 E.07147
G1 X105.738 Y138.321 E.00701
G1 X105.379 Y138.321 E.01156
G1 X103.589 Y140.11 E.08137
G1 X103.012 Y140.11 E.01857
G1 X104.801 Y138.321 E.08137
G1 X104.224 Y138.321 E.01857
G1 X102.434 Y140.11 E.08137
G1 X101.857 Y140.11 E.01857
G1 X103.646 Y138.321 E.08137
G1 X103.069 Y138.321 E.01857
G1 X101.279 Y140.11 E.08137
G1 X100.702 Y140.11 E.01857
G1 X102.491 Y138.321 E.08137
G1 X101.914 Y138.321 E.01857
G1 X100.125 Y140.11 E.08137
G1 X99.547 Y140.11 E.01857
G1 X101.337 Y138.321 E.08137
G1 X100.759 Y138.321 E.01857
G1 X98.97 Y140.11 E.08137
G1 X98.392 Y140.11 E.01857
G1 X100.182 Y138.321 E.08137
G1 X99.604 Y138.321 E.01857
G1 X97.815 Y140.11 E.08137
G1 X97.237 Y140.11 E.01857
G1 X99.027 Y138.321 E.08137
G1 X98.449 Y138.321 E.01857
G1 X96.66 Y140.11 E.08137
G1 X96.083 Y140.11 E.01857
G1 X97.872 Y138.321 E.08137
G1 X97.294 Y138.321 E.01857
G1 X95.505 Y140.11 E.08137
G1 X94.928 Y140.11 E.01857
G1 X96.717 Y138.321 E.08137
G1 X96.14 Y138.321 E.01857
G1 X94.35 Y140.11 E.08137
G1 X93.773 Y140.11 E.01857
G1 X95.562 Y138.321 E.08137
G1 X94.985 Y138.321 E.01857
G1 X93.195 Y140.11 E.08137
G1 X92.618 Y140.11 E.01857
G1 X94.407 Y138.321 E.08137
G1 X93.83 Y138.321 E.01857
G1 X92.04 Y140.11 E.08137
G1 X91.463 Y140.11 E.01857
G1 X93.252 Y138.321 E.08137
G1 X92.675 Y138.321 E.01857
G1 X90.886 Y140.11 E.08137
G1 X90.308 Y140.11 E.01857
G1 X92.098 Y138.321 E.08137
G1 X91.52 Y138.321 E.01857
G1 X89.731 Y140.11 E.08137
G1 X89.153 Y140.11 E.01857
G1 X90.943 Y138.321 E.08137
G1 X90.365 Y138.321 E.01857
G1 X88.576 Y140.11 E.08137
G1 X87.998 Y140.11 E.01857
G1 X89.788 Y138.321 E.08137
G1 X89.21 Y138.321 E.01857
G1 X87.639 Y139.893 E.07147
G1 X87.639 Y139.315 E.01857
G1 X88.633 Y138.321 E.04521
G1 X88.055 Y138.321 E.01857
G1 X87.456 Y138.921 E.02728
; WIPE_START
G1 X88.055 Y138.321 E-.32235
G1 X88.633 Y138.321 E-.21942
G1 X88.227 Y138.727 E-.21823
; WIPE_END
G1 E-.04 F1800
G1 X87.742 Y137.869 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F3840
G1 X105.575 Y137.869 E.69908
; WIPE_START
G1 X103.575 Y137.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.05 Y139.149 Z1.7 F15000
G1 X87.742 Y140.562 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.53922
G1 F3840
G1 X105.575 Y140.562 E.69911
; WIPE_START
G1 X103.575 Y140.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.354 Y133.028 Z1.7 F15000
G1 X99.311 Y114.25 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X99.375 Y114.296 E.00254
G1 X100.127 Y115.598 E.04834
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04835
G1 X94.002 Y114.296 E.04834
G1 X95.218 Y113.413 E.04834
G1 X96.197 Y113.205 E.0322
G1 X96.688 Y113.1 E.01615
G1 X98.159 Y113.413 E.04834
G1 X99.263 Y114.215 E.04387
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.299 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X96.279 Y113.588 E.02734
G1 X96.688 Y113.501 E.01248
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52886
G1 X99.809 Y116.327 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X95.268 Y110.193 Z1.7 F15000
G1 X87.291 Y99.418 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.742 Y99.869 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53921
G1 F3840
G1 X105.575 Y99.869 E.69909
; WIPE_START
G1 X103.575 Y99.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.946 Y107.378 Z1.7 F15000
G1 X105.921 Y112.72 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X100.218 Y118.423 E.25934
G1 X100.499 Y117.561 E.02914
G1 X105.738 Y112.321 E.23828
G1 X105.738 Y111.739 E.01871
G1 X100.611 Y116.867 E.23318
G1 X100.555 Y116.341 E.01702
G1 X105.738 Y111.158 E.2357
G1 X105.738 Y110.576 E.01871
G1 X100.5 Y115.814 E.23822
G2 X100.384 Y115.348 I-.582 J-.103 E.01591
G1 X105.738 Y109.994 E.24347
G1 X105.738 Y109.412 E.01871
G1 X100.171 Y114.979 E.25315
G1 X99.958 Y114.61 E.0137
G1 X105.738 Y108.83 E.26284
G1 X105.738 Y108.248 E.01871
G1 X99.745 Y114.241 E.27252
G2 X99.47 Y113.935 I-.482 J.156 E.01364
G1 X105.738 Y107.666 E.28506
G1 X105.738 Y107.084 E.01871
G1 X99.133 Y113.69 E.30038
G1 X98.796 Y113.445 E.0134
G1 X105.738 Y106.503 E.31571
G1 X105.738 Y105.921 E.01871
G1 X98.459 Y113.2 E.33104
G2 X98.045 Y113.032 I-.395 J.381 E.0148
G1 X105.738 Y105.339 E.34987
G1 X105.738 Y104.757 E.01871
G1 X97.565 Y112.93 E.3717
G1 X97.085 Y112.828 E.01578
G1 X105.738 Y104.175 E.39352
G1 X105.738 Y103.593 E.01871
G1 X96.56 Y112.771 E.41739
G1 X95.821 Y112.929 E.02429
G1 X105.738 Y103.011 E.451
G1 X105.738 Y102.429 E.01871
G1 X95.082 Y113.086 E.4846
G1 X93.737 Y114.058 E.05337
G1 X93.228 Y114.939 E.03271
G1 X87.639 Y120.529 E.25419
G1 X87.639 Y121.111 E.01871
G1 X92.87 Y115.879 E.2379
G1 X92.802 Y116.529 E.02102
G1 X87.639 Y121.693 E.2348
M73 P52 R20
G1 X87.639 Y122.274 E.01871
G1 X92.749 Y117.164 E.23241
G1 X92.892 Y117.603 E.01485
G1 X87.639 Y122.856 E.2389
G1 X87.639 Y123.438 E.01871
G1 X93.035 Y118.042 E.24539
G1 X93.177 Y118.481 E.01485
G1 X87.639 Y124.02 E.25188
G1 X87.639 Y124.602 E.01871
G1 X93.387 Y118.854 E.26138
G1 X93.662 Y119.16 E.01325
G1 X87.639 Y125.184 E.27392
G1 X87.639 Y125.766 E.01871
G1 X93.938 Y119.467 E.28646
G1 X94.214 Y119.773 E.01325
G1 X87.639 Y126.348 E.299
G1 X87.639 Y126.929 E.01871
G1 X94.552 Y120.017 E.31436
G1 X94.954 Y120.196 E.01417
G1 X87.639 Y127.511 E.33267
G1 X87.639 Y128.093 E.01871
G1 X95.357 Y120.375 E.35098
G1 X95.759 Y120.554 E.01417
G1 X87.639 Y128.675 E.36929
G1 X87.639 Y129.257 E.01871
G1 X96.295 Y120.6 E.39366
G1 X96.877 Y120.6 E.01871
G1 X87.639 Y129.839 E.42012
G1 X87.639 Y130.421 E.01871
G1 X97.459 Y120.6 E.44659
G1 X98.464 Y120.178 E.03505
G1 X87.639 Y131.003 E.49227
G1 X87.639 Y131.584 E.01871
G1 X105.738 Y113.485 E.82309
G1 X105.738 Y114.067 E.01871
G1 X87.639 Y132.166 E.82309
G1 X87.639 Y132.748 E.01871
G1 X105.738 Y114.649 E.82309
G1 X105.738 Y115.231 E.01871
G1 X87.859 Y133.11 E.81309
G1 X88.44 Y133.11 E.01871
G1 X105.738 Y115.813 E.78663
G1 X105.738 Y116.395 E.01871
G1 X89.022 Y133.11 E.76017
G1 X89.604 Y133.11 E.01871
G1 X105.738 Y116.976 E.73371
G1 X105.738 Y117.558 E.01871
G1 X90.186 Y133.11 E.70725
G1 X90.768 Y133.11 E.01871
G1 X105.738 Y118.14 E.68079
G1 X105.738 Y118.722 E.01871
G1 X91.35 Y133.11 E.65432
G1 X91.932 Y133.11 E.01871
G1 X105.738 Y119.304 E.62786
G1 X105.738 Y119.886 E.01871
G1 X92.514 Y133.11 E.6014
G1 X93.095 Y133.11 E.01871
G1 X105.738 Y120.468 E.57494
G1 X105.738 Y121.05 E.01871
G1 X93.677 Y133.11 E.54848
G1 X94.259 Y133.11 E.01871
G1 X105.738 Y121.631 E.52202
G1 X105.738 Y122.213 E.01871
G1 X94.841 Y133.11 E.49556
G1 X95.423 Y133.11 E.01871
G1 X105.738 Y122.795 E.46909
G1 X105.738 Y123.377 E.01871
G1 X96.005 Y133.11 E.44263
G1 X96.587 Y133.11 E.01871
G1 X105.738 Y123.959 E.41617
G1 X105.738 Y124.541 E.01871
G1 X97.169 Y133.11 E.38971
G1 X97.75 Y133.11 E.01871
G1 X105.738 Y125.123 E.36325
G1 X105.738 Y125.705 E.01871
G1 X98.332 Y133.11 E.33679
G1 X98.914 Y133.11 E.01871
G1 X105.738 Y126.286 E.31032
G1 X105.738 Y126.868 E.01871
G1 X99.496 Y133.11 E.28386
G1 X100.078 Y133.11 E.01871
G1 X105.738 Y127.45 E.2574
G1 X105.738 Y128.032 E.01871
G1 X100.66 Y133.11 E.23094
G1 X101.242 Y133.11 E.01871
G1 X105.738 Y128.614 E.20448
G1 X105.738 Y129.196 E.01871
G1 X101.824 Y133.11 E.17802
G1 X102.405 Y133.11 E.01871
G1 X105.738 Y129.778 E.15156
G1 X105.738 Y130.36 E.01871
G1 X102.987 Y133.11 E.12509
G1 X103.569 Y133.11 E.01871
G1 X105.738 Y130.941 E.09863
G1 X105.738 Y131.523 E.01871
G1 X104.151 Y133.11 E.07217
G1 X104.733 Y133.11 E.01871
G1 X105.738 Y132.105 E.04571
G1 X105.738 Y132.687 E.01871
G1 X105.132 Y133.294 E.02758
; WIPE_START
G1 X105.738 Y132.687 E-.32591
G1 X105.738 Y132.105 E-.22111
G1 X105.342 Y132.502 E-.21298
; WIPE_END
G1 E-.04 F1800
G1 X97.723 Y132.961 Z1.7 F15000
G1 X87.742 Y133.562 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53922
G1 F3840
G1 X105.575 Y133.562 E.69911
; WIPE_START
G1 X103.575 Y133.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.711 Y128.676 Z1.7 F15000
G1 X87.456 Y120.13 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y101.848 E.83142
G1 X105.738 Y101.266 E.01871
G1 X87.639 Y119.365 E.82309
G1 X87.639 Y118.783 E.01871
G1 X105.738 Y100.684 E.82309
G1 X105.738 Y100.321 E.01167
G1 X105.519 Y100.321 E.00704
G1 X87.639 Y118.201 E.81312
G1 X87.639 Y117.619 E.01871
G1 X104.937 Y100.321 E.78666
G1 X104.355 Y100.321 E.01871
G1 X87.639 Y117.038 E.7602
G1 X87.639 Y116.456 E.01871
G1 X103.773 Y100.321 E.73374
G1 X103.192 Y100.321 E.01871
G1 X87.639 Y115.874 E.70728
G1 X87.639 Y115.292 E.01871
G1 X102.61 Y100.321 E.68082
G1 X102.028 Y100.321 E.01871
G1 X87.639 Y114.71 E.65435
G1 X87.639 Y114.128 E.01871
G1 X101.446 Y100.321 E.62789
G1 X100.864 Y100.321 E.01871
G1 X87.639 Y113.546 E.60143
G1 X87.639 Y112.964 E.01871
G1 X100.282 Y100.321 E.57497
G1 X99.7 Y100.321 E.01871
G1 X87.639 Y112.382 E.54851
G1 X87.639 Y111.801 E.01871
G1 X99.118 Y100.321 E.52205
G1 X98.537 Y100.321 E.01871
G1 X87.639 Y111.219 E.49558
G1 X87.639 Y110.637 E.01871
G1 X97.955 Y100.321 E.46912
G1 X97.373 Y100.321 E.01871
G1 X87.639 Y110.055 E.44266
G1 X87.639 Y109.473 E.01871
G1 X96.791 Y100.321 E.4162
G1 X96.209 Y100.321 E.01871
G1 X87.639 Y108.891 E.38974
G1 X87.639 Y108.309 E.01871
G1 X95.627 Y100.321 E.36328
G1 X95.045 Y100.321 E.01871
G1 X87.639 Y107.727 E.33682
G1 X87.639 Y107.146 E.01871
G1 X94.463 Y100.321 E.31035
G1 X93.882 Y100.321 E.01871
G1 X87.639 Y106.564 E.28389
G1 X87.639 Y105.982 E.01871
G1 X93.3 Y100.321 E.25743
G1 X92.718 Y100.321 E.01871
G1 X87.639 Y105.4 E.23097
G1 X87.639 Y104.818 E.01871
G1 X92.136 Y100.321 E.20451
G1 X91.554 Y100.321 E.01871
G1 X87.639 Y104.236 E.17805
G1 X87.639 Y103.654 E.01871
G1 X90.972 Y100.321 E.15159
G1 X90.39 Y100.321 E.01871
G1 X87.639 Y103.072 E.12512
G1 X87.639 Y102.491 E.01871
G1 X89.808 Y100.321 E.09866
G1 X89.226 Y100.321 E.01871
G1 X87.639 Y101.909 E.0722
G1 X87.639 Y101.327 E.01871
G1 X88.645 Y100.321 E.04574
G1 X88.063 Y100.321 E.01871
G1 X87.456 Y100.928 E.02761
; WIPE_START
G1 X88.063 Y100.321 E-.32626
G1 X88.645 Y100.321 E-.22111
G1 X88.249 Y100.717 E-.21262
; WIPE_END
G1 E-.04 F1800
G1 X87.291 Y96.014 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.742 Y95.562 Z1.7 F15000
G1 Z1.3
M73 P52 R19
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F3840
G1 X105.575 Y95.562 E.69908
G1 X105.138 Y95.294 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y94.694 E.02728
G1 X105.738 Y94.116 E.01857
G1 X104.744 Y95.11 E.04521
G1 X104.167 Y95.11 E.01857
G1 X105.738 Y93.539 E.07147
G1 X105.738 Y93.321 E.00701
G1 X105.379 Y93.321 E.01156
G1 X103.589 Y95.11 E.08137
G1 X103.012 Y95.11 E.01857
G1 X104.801 Y93.321 E.08137
G1 X104.224 Y93.321 E.01857
G1 X102.434 Y95.11 E.08137
G1 X101.857 Y95.11 E.01857
G1 X103.646 Y93.321 E.08137
G1 X103.069 Y93.321 E.01857
G1 X101.279 Y95.11 E.08137
G1 X100.702 Y95.11 E.01857
G1 X102.491 Y93.321 E.08137
G1 X101.914 Y93.321 E.01857
G1 X100.125 Y95.11 E.08137
G1 X99.547 Y95.11 E.01857
G1 X101.337 Y93.321 E.08137
G1 X100.759 Y93.321 E.01857
G1 X98.97 Y95.11 E.08137
G1 X98.392 Y95.11 E.01857
G1 X100.182 Y93.321 E.08137
G1 X99.604 Y93.321 E.01857
G1 X97.815 Y95.11 E.08137
G1 X97.237 Y95.11 E.01857
G1 X99.027 Y93.321 E.08137
G1 X98.449 Y93.321 E.01857
G1 X96.66 Y95.11 E.08137
G1 X96.083 Y95.11 E.01857
G1 X97.872 Y93.321 E.08137
G1 X97.294 Y93.321 E.01857
G1 X95.505 Y95.11 E.08137
G1 X94.928 Y95.11 E.01857
G1 X96.717 Y93.321 E.08137
G1 X96.14 Y93.321 E.01857
G1 X94.35 Y95.11 E.08137
G1 X93.773 Y95.11 E.01857
G1 X95.562 Y93.321 E.08137
G1 X94.985 Y93.321 E.01857
G1 X93.195 Y95.11 E.08137
G1 X92.618 Y95.11 E.01857
G1 X94.407 Y93.321 E.08137
G1 X93.83 Y93.321 E.01857
G1 X92.04 Y95.11 E.08137
G1 X91.463 Y95.11 E.01857
G1 X93.252 Y93.321 E.08137
G1 X92.675 Y93.321 E.01857
G1 X90.886 Y95.11 E.08137
G1 X90.308 Y95.11 E.01857
G1 X92.098 Y93.321 E.08137
G1 X91.52 Y93.321 E.01857
G1 X89.731 Y95.11 E.08137
G1 X89.153 Y95.11 E.01857
G1 X90.943 Y93.321 E.08137
G1 X90.365 Y93.321 E.01857
G1 X88.576 Y95.11 E.08137
G1 X87.998 Y95.11 E.01857
G1 X89.788 Y93.321 E.08137
G1 X89.21 Y93.321 E.01857
G1 X87.639 Y94.893 E.07147
G1 X87.639 Y94.315 E.01857
G1 X88.633 Y93.321 E.04521
G1 X88.055 Y93.321 E.01857
G1 X87.456 Y93.921 E.02728
; WIPE_START
G1 X88.055 Y93.321 E-.32235
G1 X88.633 Y93.321 E-.21943
G1 X88.227 Y93.727 E-.21822
; WIPE_END
G1 E-.04 F1800
G1 X87.742 Y92.869 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53921
G1 F3840
G1 X105.575 Y92.869 E.69909
; WIPE_START
G1 X103.575 Y92.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.036 Y85.672 Z1.7 F15000
G1 X97.361 Y75.252 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X95.937 Y75.252 E.0458
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X96.197 Y68.205 E.0322
G1 X96.688 Y68.1 E.01615
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04835
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.421 Y75.252 E.00061
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X96.279 Y68.588 E.02734
G1 X96.688 Y68.501 E.01248
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X91.697 Y81.25 Z1.7 F15000
G1 X87.291 Y89.014 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.742 Y88.562 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F3840
G1 X105.575 Y88.562 E.69908
G1 X105.136 Y88.294 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y87.692 E.02736
G1 X105.738 Y87.113 E.01861
G1 X104.741 Y88.11 E.04535
G1 X104.162 Y88.11 E.01861
G1 X105.738 Y86.534 E.07167
G1 X105.738 Y85.956 E.01861
G1 X103.583 Y88.11 E.09799
G1 X103.005 Y88.11 E.01861
G1 X105.738 Y85.377 E.12431
G1 X105.738 Y84.798 E.01861
G1 X102.426 Y88.11 E.15062
G1 X101.847 Y88.11 E.01861
G1 X105.738 Y84.219 E.17694
G1 X105.738 Y83.641 E.01861
G1 X101.269 Y88.11 E.20326
G1 X100.69 Y88.11 E.01861
G1 X105.738 Y83.062 E.22958
G1 X105.738 Y82.483 E.01861
G1 X100.111 Y88.11 E.2559
G1 X99.532 Y88.11 E.01861
G1 X105.738 Y81.905 E.28221
G1 X105.738 Y81.326 E.01861
G1 X98.954 Y88.11 E.30853
G1 X98.375 Y88.11 E.01861
G1 X105.738 Y80.747 E.33485
G1 X105.738 Y80.168 E.01861
G1 X97.796 Y88.11 E.36117
G1 X97.217 Y88.11 E.01861
G1 X105.738 Y79.59 E.38749
G1 X105.738 Y79.011 E.01861
G1 X96.639 Y88.11 E.4138
G1 X96.06 Y88.11 E.01861
G1 X105.738 Y78.432 E.44012
G1 X105.738 Y77.854 E.01861
G1 X95.481 Y88.11 E.46644
G1 X94.903 Y88.11 E.01861
G1 X105.738 Y77.275 E.49276
G1 X105.738 Y76.696 E.01861
G1 X94.324 Y88.11 E.51908
G1 X93.745 Y88.11 E.01861
G1 X105.738 Y76.117 E.5454
G1 X105.738 Y75.539 E.01861
G1 X93.166 Y88.11 E.57171
G1 X92.588 Y88.11 E.01861
G1 X105.738 Y74.96 E.59803
G1 X105.738 Y74.381 E.01861
G1 X92.009 Y88.11 E.62435
G1 X91.43 Y88.11 E.01861
G1 X105.738 Y73.802 E.65067
G1 X105.738 Y73.224 E.01861
G1 X90.851 Y88.11 E.67699
G1 X90.273 Y88.11 E.01861
G1 X105.738 Y72.645 E.7033
G1 X105.738 Y72.066 E.01861
G1 X89.694 Y88.11 E.72962
G1 X89.115 Y88.11 E.01861
G1 X105.738 Y71.488 E.75594
G1 X105.738 Y70.909 E.01861
G1 X88.537 Y88.11 E.78226
G1 X87.958 Y88.11 E.01861
G1 X105.738 Y70.33 E.80858
G1 X105.738 Y69.751 E.01861
G1 X87.639 Y87.851 E.82309
G1 X87.639 Y87.272 E.01861
G1 X105.738 Y69.173 E.82309
G1 X105.738 Y68.594 E.01861
G1 X87.639 Y86.693 E.82309
G1 X87.639 Y86.115 E.01861
G1 X105.738 Y68.015 E.82309
G1 X105.738 Y67.436 E.01861
G1 X100.443 Y72.731 E.2408
G1 X100.638 Y72.131 E.02031
G1 X100.622 Y71.974 E.00507
G1 X105.738 Y66.858 E.23267
G1 X105.738 Y66.279 E.01861
G1 X100.567 Y71.45 E.23517
G1 X100.512 Y70.927 E.01693
G1 X105.738 Y65.7 E.23768
G1 X105.738 Y65.122 E.01861
G1 X100.431 Y70.429 E.24134
G1 X100.219 Y70.062 E.01362
G1 X105.738 Y64.543 E.25098
G1 X105.738 Y63.964 E.01861
G1 X100.007 Y69.695 E.26061
G1 X99.796 Y69.328 E.01362
G1 X105.738 Y63.385 E.27024
G1 X105.738 Y62.807 E.01861
M73 P53 R19
G1 X99.551 Y68.994 E.28136
G1 X99.216 Y68.75 E.01332
G1 X105.738 Y62.228 E.2966
G1 X105.738 Y61.649 E.01861
G1 X98.881 Y68.507 E.31185
G1 X98.546 Y68.263 E.01332
G1 X105.738 Y61.07 E.32709
G1 X105.738 Y60.492 E.01861
G1 X98.171 Y68.059 E.34414
G1 X97.693 Y67.958 E.01569
G1 X105.738 Y59.913 E.36584
G1 X105.738 Y59.334 E.01861
G1 X97.216 Y67.856 E.38755
G1 X96.739 Y67.755 E.01569
G1 X105.738 Y58.756 E.40925
G1 X105.738 Y58.177 E.01861
G1 X96.031 Y67.884 E.44143
G1 X95.296 Y68.04 E.02416
G1 X105.738 Y57.598 E.47486
G1 X105.738 Y57.019 E.01861
G1 X87.639 Y75.119 E.82309
G1 X87.639 Y75.697 E.01861
G1 X92.998 Y70.338 E.24371
G1 X92.911 Y70.488 E.00557
G1 X92.851 Y71.064 E.01862
G1 X87.639 Y76.276 E.23702
G1 X87.639 Y76.855 E.01861
G1 X92.783 Y71.711 E.23393
G2 X92.788 Y72.284 I.646 J.28 E.01898
G1 X87.639 Y77.434 E.23418
G1 X87.639 Y78.012 E.01861
G1 X92.93 Y72.721 E.24064
G1 X93.072 Y73.158 E.01477
G1 X87.639 Y78.591 E.24709
G1 X87.639 Y79.17 E.01861
G1 X93.214 Y73.594 E.25355
G2 X93.456 Y73.931 I.499 J-.103 E.01373
G1 X87.639 Y79.749 E.26454
G1 X87.639 Y80.327 E.01861
G1 X93.73 Y74.236 E.27701
G1 X94.004 Y74.54 E.01318
G1 X87.639 Y80.906 E.28948
G1 X87.639 Y81.485 E.01861
G1 X94.279 Y74.845 E.30195
G2 X94.644 Y75.058 I.422 J-.304 E.01402
G1 X87.639 Y82.063 E.31858
G1 X87.639 Y82.642 E.01861
G1 X95.045 Y75.236 E.33679
G1 X95.445 Y75.415 E.0141
G1 X87.639 Y83.221 E.355
G1 X87.639 Y83.8 E.01861
G1 X95.846 Y75.593 E.37321
G1 X96.417 Y75.6 E.01837
G1 X87.639 Y84.378 E.39918
G1 X87.639 Y84.957 E.01861
G1 X96.995 Y75.6 E.4255
G1 X97.622 Y75.552 E.02022
G1 X87.456 Y85.719 E.46234
; WIPE_START
G1 X88.87 Y84.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.755 Y76.754 Z1.7 F15000
G1 X87.456 Y74.723 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F7800
G1 X105.738 Y56.441 E.83142
G1 X105.738 Y55.862 E.01861
G1 X87.639 Y73.961 E.82309
G1 X87.639 Y73.383 E.01861
G1 X105.738 Y55.283 E.82309
G1 X105.738 Y54.705 E.01861
G1 X87.639 Y72.804 E.82309
G1 X87.639 Y72.225 E.01861
G1 X105.738 Y54.126 E.82309
G1 X105.738 Y53.547 E.01861
G1 X87.639 Y71.646 E.82309
G1 X87.639 Y71.068 E.01861
G1 X105.738 Y52.968 E.82309
G1 X105.738 Y52.666 E.00972
G1 X105.462 Y52.666 E.00889
G1 X87.639 Y70.489 E.81052
G1 X87.639 Y69.91 E.01861
G1 X104.883 Y52.666 E.7842
G1 X104.304 Y52.666 E.01861
G1 X87.639 Y69.332 E.75788
G1 X87.639 Y68.753 E.01861
G1 X103.726 Y52.666 E.73156
G1 X103.147 Y52.666 E.01861
G1 X87.639 Y68.174 E.70524
G1 X87.639 Y67.595 E.01861
G1 X102.568 Y52.666 E.67893
G1 X101.989 Y52.666 E.01861
G1 X87.639 Y67.017 E.65261
G1 X87.639 Y66.438 E.01861
G1 X101.411 Y52.666 E.62629
G1 X100.832 Y52.666 E.01861
G1 X87.639 Y65.859 E.59997
G1 X87.639 Y65.28 E.01861
G1 X100.253 Y52.666 E.57365
G1 X99.675 Y52.666 E.01861
G1 X87.639 Y64.702 E.54734
G1 X87.639 Y64.123 E.01861
G1 X99.096 Y52.666 E.52102
G1 X98.517 Y52.666 E.01861
G1 X87.639 Y63.544 E.4947
G1 X87.639 Y62.966 E.01861
G1 X97.938 Y52.666 E.46838
G1 X97.36 Y52.666 E.01861
G1 X87.639 Y62.387 E.44206
G1 X87.639 Y61.808 E.01861
G1 X96.781 Y52.666 E.41575
G1 X96.202 Y52.666 E.01861
G1 X87.639 Y61.229 E.38943
G1 X87.639 Y60.651 E.01861
G1 X95.623 Y52.666 E.36311
G1 X95.045 Y52.666 E.01861
G1 X87.639 Y60.072 E.33679
G1 X87.639 Y59.493 E.01861
G1 X94.466 Y52.666 E.31047
G1 X93.887 Y52.666 E.01861
G1 X87.639 Y58.914 E.28416
G1 X87.639 Y58.336 E.01861
G1 X93.309 Y52.666 E.25784
G1 X92.73 Y52.666 E.01861
G1 X87.639 Y57.757 E.23152
G1 X87.639 Y57.178 E.01861
G1 X92.151 Y52.666 E.2052
G1 X91.572 Y52.666 E.01861
G1 X87.639 Y56.6 E.17888
G1 X87.639 Y56.021 E.01861
G1 X90.994 Y52.666 E.15257
G1 X90.415 Y52.666 E.01861
G1 X87.639 Y55.442 E.12625
G1 X87.639 Y54.863 E.01861
G1 X89.836 Y52.666 E.09993
G1 X89.257 Y52.666 E.01861
G1 X87.639 Y54.285 E.07361
G1 X87.639 Y53.706 E.01861
G1 X88.679 Y52.666 E.04729
G1 X88.1 Y52.666 E.01861
G1 X87.456 Y53.31 E.02931
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X88.1 Y52.666 E-.34631
G1 X88.679 Y52.666 E-.21991
G1 X88.318 Y53.027 E-.19378
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 7/20
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.7 I1.217 J0 P1  F15000
; object ids of layer 7 start: 138,178
M624 AwAAAAAAAAA=
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
; object ids of this layer7 end: 138,178
M625
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X199.995 Y66.256
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X162.791 Y66.256 E1.19635
G1 X162.791 Y91.256 E.80391
G1 X161.995 Y91.256 E.02559
G1 X161.995 Y66.256 E.80391
G1 X155.791 Y66.256 E.1995
G1 X155.791 Y124.985 E1.88852
G1 X154.995 Y124.985 E.02559
G1 X154.995 Y65.46 E1.91411
G1 X207.791 Y65.46 E1.69772
G1 X207.791 Y124.985 E1.91411
G1 X206.995 Y124.985 E.02559
G1 X206.995 Y66.256 E1.88852
G1 X200.791 Y66.256 E.1995
G1 X200.791 Y91.256 E.80391
G1 X199.995 Y91.256 E.02559
G1 X199.995 Y66.316 E.80198
M204 S250
G1 X199.603 Y66.648 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X163.183 Y66.648 E1.08483
G1 X163.183 Y91.648 E.74466
G1 X161.603 Y91.648 E.04706
G1 X161.603 Y66.648 E.74466
G1 X156.183 Y66.648 E.16144
G1 X156.183 Y142.955 E2.27293
G1 X154.603 Y142.955 E.04706
G1 X154.603 Y65.068 E2.32
G1 X208.183 Y65.068 E1.59597
G1 X208.183 Y142.955 E2.32
G1 X206.603 Y142.955 E.04706
G1 X206.603 Y66.648 E2.27293
G1 X201.183 Y66.648 E.16144
G1 X201.183 Y91.648 E.74466
G1 X199.603 Y91.648 E.04706
G1 X199.603 Y66.708 E.74288
; WIPE_START
M204 S5000
G1 X197.603 Y66.704 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.393 Y66.052 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.490218
G1 F7500
G1 X200.393 Y65.906 E.00515
G1 X200.491 Y65.882 E.00354
; LINE_WIDTH: 0.45602
G1 X200.588 Y65.858 E.00327
; LINE_WIDTH: 0.43172
G1 X207.199 Y65.858 E.20305
; LINE_WIDTH: 0.470635
G1 X207.36 Y65.891 E.00556
G1 X207.377 Y65.972 E.00278
; LINE_WIDTH: 0.448395
G1 X207.393 Y66.052 E.00263
; LINE_WIDTH: 0.43172
G1 X207.393 Y124.781 E1.80371
; WIPE_START
G1 X207.393 Y122.781 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.976 Y125.81 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X207.373 Y125.207 E.0254
G1 X206.84 Y125.207
G1 X207.976 Y126.343 E.04786
G1 X207.976 Y126.877
G1 X206.811 Y125.712 E.04908
G1 X206.811 Y126.245
G1 X207.976 Y127.41 E.04908
G1 X207.976 Y127.943
G1 X206.811 Y126.778 E.04908
G1 X206.811 Y127.311
G1 X207.976 Y128.477 E.04908
G1 X207.976 Y129.01
G1 X206.811 Y127.845 E.04908
G1 X206.811 Y128.378
G1 X207.976 Y129.543 E.04908
G1 X207.976 Y130.076
G1 X206.811 Y128.911 E.04908
G1 X206.811 Y129.444
G1 X207.976 Y130.61 E.04908
G1 X207.976 Y131.143
G1 X206.811 Y129.978 E.04908
G1 X206.811 Y130.511
G1 X207.976 Y131.676 E.04908
G1 X207.976 Y132.209
G1 X206.811 Y131.044 E.04908
G1 X206.811 Y131.577
G1 X207.976 Y132.743 E.04908
G1 X207.976 Y133.276
G1 X206.811 Y132.111 E.04908
G1 X206.811 Y132.644
G1 X207.976 Y133.809 E.04908
G1 X207.976 Y134.342
G1 X206.811 Y133.177 E.04908
G1 X206.811 Y133.71
G1 X207.976 Y134.876 E.04908
G1 X207.976 Y135.409
G1 X206.811 Y134.244 E.04908
G1 X206.811 Y134.777
G1 X207.976 Y135.942 E.04908
G1 X207.976 Y136.475
G1 X206.811 Y135.31 E.04908
G1 X206.811 Y135.843
G1 X207.976 Y137.009 E.04908
G1 X207.976 Y137.542
G1 X206.811 Y136.377 E.04908
G1 X206.811 Y136.91
G1 X207.976 Y138.075 E.04908
G1 X207.976 Y138.608
G1 X206.811 Y137.443 E.04908
G1 X206.811 Y137.976
G1 X207.976 Y139.142 E.04908
G1 X207.976 Y139.675
G1 X206.811 Y138.51 E.04908
G1 X206.811 Y139.043
G1 X207.976 Y140.208 E.04908
G1 X207.976 Y140.741
G1 X206.811 Y139.576 E.04908
G1 X206.811 Y140.109
G1 X207.976 Y141.275 E.04908
G1 X207.976 Y141.808
G1 X206.811 Y140.643 E.04908
G1 X206.811 Y141.176
G1 X207.976 Y142.341 E.04908
G1 X207.849 Y142.748
G1 X206.811 Y141.709 E.04374
G1 X206.811 Y142.243
G1 X207.316 Y142.748 E.02128
; WIPE_START
M204 S5000
G1 X206.811 Y142.243 E-.27148
G1 X206.811 Y141.709 E-.20264
M73 P54 R19
G1 X207.343 Y142.241 E-.28588
; WIPE_END
G1 E-.04 F1800
G1 X206.316 Y134.678 Z1.9 F15000
G1 X200.393 Y91.052 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X200.393 Y66.052 E.76781
G1 X200.393 Y65.906 F15000
; LINE_WIDTH: 0.50462
G1 F7500
G1 X200.296 Y65.882 E.00365
; LINE_WIDTH: 0.431785
G1 X200.199 Y65.858 E.00308
G1 X162.588 Y65.858 E1.15532
; LINE_WIDTH: 0.45602
G1 X162.491 Y65.882 E.00327
; LINE_WIDTH: 0.490218
G1 X162.393 Y65.906 E.00354
G1 X162.393 Y66.052 E.00515
; LINE_WIDTH: 0.43172
G1 X162.393 Y91.052 E.76781
; WIPE_START
G1 X162.393 Y89.052 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X162.393 Y81.42 Z1.9 F15000
G1 X162.393 Y65.906 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.50462
G1 F7500
G1 X162.296 Y65.882 E.00365
; LINE_WIDTH: 0.432083
G1 X162.199 Y65.858 E.00308
G1 X155.588 Y65.858 E.20324
; LINE_WIDTH: 0.448395
G1 X155.507 Y65.874 E.00263
; LINE_WIDTH: 0.470635
G1 X155.427 Y65.891 E.00278
G1 X155.393 Y66.052 E.00556
; LINE_WIDTH: 0.43172
G1 X155.393 Y124.781 E1.80371
; WIPE_START
G1 X155.393 Y122.781 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.976 Y126.069 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X155.114 Y125.207 E.03632
G1 X154.811 Y125.437
G1 X155.976 Y126.603 E.04908
G1 X155.976 Y127.136
G1 X154.811 Y125.971 E.04908
G1 X154.811 Y126.504
G1 X155.976 Y127.669 E.04908
G1 X155.976 Y128.202
G1 X154.811 Y127.037 E.04908
G1 X154.811 Y127.571
G1 X155.976 Y128.736 E.04908
G1 X155.976 Y129.269
G1 X154.811 Y128.104 E.04908
G1 X154.811 Y128.637
G1 X155.976 Y129.802 E.04908
G1 X155.976 Y130.336
G1 X154.811 Y129.17 E.04908
G1 X154.811 Y129.704
G1 X155.976 Y130.869 E.04908
G1 X155.976 Y131.402
G1 X154.811 Y130.237 E.04908
G1 X154.811 Y130.77
G1 X155.976 Y131.935 E.04908
G1 X155.976 Y132.469
G1 X154.811 Y131.303 E.04908
G1 X154.811 Y131.837
G1 X155.976 Y133.002 E.04908
G1 X155.976 Y133.535
G1 X154.811 Y132.37 E.04908
G1 X154.811 Y132.903
G1 X155.976 Y134.068 E.04908
G1 X155.976 Y134.602
G1 X154.811 Y133.436 E.04908
G1 X154.811 Y133.97
G1 X155.976 Y135.135 E.04908
G1 X155.976 Y135.668
G1 X154.811 Y134.503 E.04908
G1 X154.811 Y135.036
G1 X155.976 Y136.201 E.04908
G1 X155.976 Y136.735
G1 X154.811 Y135.569 E.04908
G1 X154.811 Y136.103
G1 X155.976 Y137.268 E.04908
G1 X155.976 Y137.801
G1 X154.811 Y136.636 E.04908
G1 X154.811 Y137.169
G1 X155.976 Y138.334 E.04908
G1 X155.976 Y138.868
G1 X154.811 Y137.702 E.04908
G1 X154.811 Y138.236
G1 X155.976 Y139.401 E.04908
G1 X155.976 Y139.934
G1 X154.811 Y138.769 E.04908
G1 X154.811 Y139.302
G1 X155.976 Y140.467 E.04908
G1 X155.976 Y141.001
G1 X154.811 Y139.835 E.04908
G1 X154.811 Y140.369
G1 X155.976 Y141.534 E.04908
G1 X155.976 Y142.067
G1 X154.811 Y140.902 E.04908
G1 X154.811 Y141.435
G1 X155.976 Y142.6 E.04908
G1 X155.59 Y142.748
G1 X154.811 Y141.968 E.03282
; OBJECT_ID: 178
; WIPE_START
M204 S5000
G1 X155.59 Y142.748 E-.41874
G1 X155.976 Y142.6 E-.157
G1 X155.633 Y142.258 E-.18426
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X148.53 Y145.051 Z1.9 F15000
G1 X98.867 Y164.582 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.814 Y164.641 E.00256
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04834
G1 X96.136 Y158.218 E.03019
G1 X96.688 Y158.1 E.01815
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04834
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.907 Y164.537 E.04386
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X96.218 Y158.601 E.02548
G1 X96.688 Y158.501 E.01433
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X93.544 Y157.933 Z1.9 F15000
G1 X87.291 Y144.418 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.742 Y144.869 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F3840
G1 X105.575 Y144.869 E.69908
; WIPE_START
G1 X103.575 Y144.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.921 Y145.923 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.32 Y145.321 E.02736
G1 X104.741 Y145.321 E.01861
G1 X105.738 Y146.318 E.04535
G1 X105.738 Y146.897 E.01861
G1 X104.162 Y145.321 E.07167
G1 X103.583 Y145.321 E.01861
G1 X105.738 Y147.476 E.09799
G1 X105.738 Y148.054 E.01861
G1 X103.005 Y145.321 E.12431
G1 X102.426 Y145.321 E.01861
G1 X105.738 Y148.633 E.15062
G1 X105.738 Y149.212 E.01861
G1 X101.847 Y145.321 E.17694
G1 X101.269 Y145.321 E.01861
G1 X105.738 Y149.791 E.20326
G1 X105.738 Y150.369 E.01861
G1 X100.69 Y145.321 E.22958
G1 X100.111 Y145.321 E.01861
G1 X105.738 Y150.948 E.2559
G1 X105.738 Y151.527 E.01861
G1 X99.532 Y145.321 E.28221
G1 X98.954 Y145.321 E.01861
G1 X105.738 Y152.106 E.30853
G1 X105.738 Y152.684 E.01861
G1 X98.375 Y145.321 E.33485
G1 X97.796 Y145.321 E.01861
G1 X105.738 Y153.263 E.36117
G1 X105.738 Y153.842 E.01861
G1 X97.217 Y145.321 E.38749
G1 X96.639 Y145.321 E.01861
G1 X105.738 Y154.42 E.4138
G1 X105.738 Y154.999 E.01861
G1 X96.06 Y145.321 E.44012
G1 X95.481 Y145.321 E.01861
G1 X105.738 Y155.578 E.46644
G1 X105.738 Y156.157 E.01861
G1 X94.903 Y145.321 E.49276
G1 X94.324 Y145.321 E.01861
G1 X105.738 Y156.735 E.51908
G1 X105.738 Y157.314 E.01861
G1 X93.745 Y145.321 E.5454
G1 X93.166 Y145.321 E.01861
G1 X105.738 Y157.893 E.57171
G1 X105.738 Y158.472 E.01861
G1 X92.588 Y145.321 E.59803
G1 X92.009 Y145.321 E.01861
G1 X105.738 Y159.05 E.62435
G1 X105.738 Y159.629 E.01861
G1 X91.43 Y145.321 E.65067
G1 X90.851 Y145.321 E.01861
G1 X105.738 Y160.208 E.67699
G1 X105.738 Y160.786 E.01861
G1 X90.273 Y145.321 E.7033
G1 X89.694 Y145.321 E.01861
G1 X105.738 Y161.365 E.72962
G1 X105.738 Y161.944 E.01861
G1 X89.115 Y145.321 E.75594
G1 X88.537 Y145.321 E.01861
G1 X105.738 Y162.523 E.78226
G1 X105.738 Y163.101 E.01861
G1 X87.958 Y145.321 E.80858
G1 X87.639 Y145.321 E.01026
G1 X87.639 Y145.581 E.00835
G1 X105.738 Y163.68 E.82309
G1 X105.738 Y164.259 E.01861
G1 X87.639 Y146.159 E.82309
G1 X87.639 Y146.738 E.01861
G1 X105.738 Y164.837 E.82309
G1 X105.738 Y165.416 E.01861
G1 X87.639 Y147.317 E.82309
G1 X87.639 Y147.896 E.01861
G1 X97.703 Y157.96 E.45768
G1 X96.968 Y157.804 E.02416
G1 X87.639 Y148.474 E.42426
G1 X87.639 Y149.053 E.01861
G1 X96.393 Y157.807 E.3981
G1 X95.915 Y157.908 E.01569
G1 X87.639 Y149.632 E.37639
G1 X87.639 Y150.21 E.01861
G1 X95.438 Y158.01 E.35469
G2 X94.994 Y158.145 I-.07 J.566 E.01536
G1 X87.639 Y150.789 E.3345
G1 X87.639 Y151.368 E.01861
G1 X94.659 Y158.388 E.31926
G1 X94.324 Y158.632 E.01332
G1 X87.639 Y151.947 E.30401
G1 X87.639 Y152.525 E.01861
G1 X93.989 Y158.875 E.28877
G2 X93.684 Y159.15 I.156 J.479 E.01357
G1 X87.639 Y153.104 E.27492
G1 X87.639 Y153.683 E.01861
G1 X93.472 Y159.516 E.26529
G1 X93.261 Y159.883 E.01362
G1 X87.639 Y154.262 E.25566
G1 X87.639 Y154.84 E.01861
G1 X93.049 Y160.25 E.24603
G2 X92.892 Y160.672 I.395 J.387 E.01491
G1 X87.639 Y155.419 E.23889
G1 X87.639 Y155.998 E.01861
G1 X92.837 Y161.196 E.23639
G1 X92.782 Y161.72 E.01693
G1 X87.639 Y156.576 E.23389
G1 X87.639 Y157.155 E.01861
G1 X92.798 Y162.315 E.23464
G1 X93.077 Y163.172 E.02899
G1 X87.639 Y157.734 E.24731
G1 X87.639 Y158.313 E.01861
G1 X105.738 Y176.412 E.82309
G1 X105.738 Y175.833 E.01861
G1 X95.219 Y165.314 E.47839
G1 X95.863 Y165.6 E.02267
G1 X96.084 Y165.6 E.00712
G1 X105.738 Y175.255 E.43903
G1 X105.738 Y174.676 E.01861
G1 X96.663 Y165.6 E.41271
G1 X97.242 Y165.6 E.01861
G1 X105.738 Y174.097 E.38639
G1 X105.738 Y173.518 E.01861
G1 X97.726 Y165.506 E.36436
G1 X98.126 Y165.328 E.0141
G1 X105.738 Y172.94 E.34615
G1 X105.738 Y172.361 E.01861
G1 X98.527 Y165.15 E.32794
G1 X98.927 Y164.971 E.0141
G1 X105.738 Y171.782 E.30973
G1 X105.738 Y171.203 E.01861
G1 X99.232 Y164.697 E.29589
G1 X99.506 Y164.392 E.01318
G1 X105.738 Y170.625 E.28342
G1 X105.738 Y170.046 E.01861
G1 X99.78 Y164.088 E.27095
G1 X100.054 Y163.783 E.01318
G1 X105.738 Y169.467 E.25848
G1 X105.738 Y168.889 E.01861
G1 X100.232 Y163.382 E.25041
G1 X100.374 Y162.945 E.01477
G1 X105.738 Y168.31 E.24396
G1 X105.738 Y167.731 E.01861
G1 X100.516 Y162.509 E.2375
G2 X100.629 Y162.043 I-.466 J-.36 E.01586
G1 X105.738 Y167.152 E.23234
G1 X105.738 Y166.574 E.01861
G1 X100.561 Y161.397 E.23543
G1 X100.493 Y160.75 E.02091
G1 X105.921 Y166.178 E.24685
; WIPE_START
G1 X104.507 Y164.764 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.371 Y172.347 Z1.9 F15000
G1 X105.921 Y177.174 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F7800
G1 X87.639 Y158.891 E.83142
G1 X87.639 Y159.47 E.01861
G1 X105.738 Y177.569 E.82309
G1 X105.738 Y178.148 E.01861
G1 X87.639 Y160.049 E.82309
G1 X87.639 Y160.627 E.01861
G1 X105.738 Y178.727 E.82309
G1 X105.738 Y179.306 E.01861
G1 X87.639 Y161.206 E.82309
G1 X87.639 Y161.785 E.01861
G1 X105.738 Y179.884 E.82309
G1 X105.738 Y180.463 E.01861
G1 X87.639 Y162.364 E.82309
G1 X87.639 Y162.942 E.01861
G1 X105.462 Y180.765 E.81052
G1 X104.883 Y180.765 E.01861
G1 X87.639 Y163.521 E.7842
G1 X87.639 Y164.1 E.01861
G1 X104.304 Y180.765 E.75788
G1 X103.726 Y180.765 E.01861
G1 X87.639 Y164.679 E.73156
G1 X87.639 Y165.257 E.01861
G1 X103.147 Y180.765 E.70524
G1 X102.568 Y180.765 E.01861
G1 X87.639 Y165.836 E.67893
G1 X87.639 Y166.415 E.01861
G1 X101.989 Y180.765 E.65261
G1 X101.411 Y180.765 E.01861
G1 X87.639 Y166.993 E.62629
G1 X87.639 Y167.572 E.01861
G1 X100.832 Y180.765 E.59997
G1 X100.253 Y180.765 E.01861
G1 X87.639 Y168.151 E.57365
G1 X87.639 Y168.73 E.01861
G1 X99.675 Y180.765 E.54734
G1 X99.096 Y180.765 E.01861
G1 X87.639 Y169.308 E.52102
G1 X87.639 Y169.887 E.01861
G1 X98.517 Y180.765 E.4947
G1 X97.938 Y180.765 E.01861
G1 X87.639 Y170.466 E.46838
G1 X87.639 Y171.045 E.01861
G1 X97.36 Y180.765 E.44206
G1 X96.781 Y180.765 E.01861
G1 X87.639 Y171.623 E.41575
G1 X87.639 Y172.202 E.01861
G1 X96.202 Y180.765 E.38943
G1 X95.623 Y180.765 E.01861
G1 X87.639 Y172.781 E.36311
G1 X87.639 Y173.359 E.01861
G1 X95.045 Y180.765 E.33679
G1 X94.466 Y180.765 E.01861
G1 X87.639 Y173.938 E.31047
G1 X87.639 Y174.517 E.01861
G1 X93.887 Y180.765 E.28416
G1 X93.309 Y180.765 E.01861
G1 X87.639 Y175.096 E.25784
G1 X87.639 Y175.674 E.01861
G1 X92.73 Y180.765 E.23152
G1 X92.151 Y180.765 E.01861
G1 X87.639 Y176.253 E.2052
G1 X87.639 Y176.832 E.01861
G1 X91.572 Y180.765 E.17888
G1 X90.994 Y180.765 E.01861
G1 X87.639 Y177.411 E.15257
G1 X87.639 Y177.989 E.01861
G1 X90.415 Y180.765 E.12625
G1 X89.836 Y180.765 E.01861
M73 P54 R18
G1 X87.639 Y178.568 E.09993
G1 X87.639 Y179.147 E.01861
G1 X89.257 Y180.765 E.07361
G1 X88.679 Y180.765 E.01861
G1 X87.639 Y179.725 E.04729
G1 X87.639 Y180.304 E.01861
G1 X88.283 Y180.949 E.02931
; WIPE_START
G1 X87.639 Y180.304 E-.34631
G1 X87.639 Y179.725 E-.21991
G1 X87.999 Y180.086 E-.19378
; WIPE_END
G1 E-.04 F1800
G1 X91.206 Y173.16 Z1.9 F15000
G1 X106.086 Y141.014 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y141.014 E.60441
M73 P55 R18
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.921 Y138.921 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.322 Y138.321 E.02728
G1 X104.744 Y138.321 E.01857
G1 X105.738 Y139.315 E.04521
G1 X105.738 Y139.893 E.01857
G1 X104.167 Y138.321 E.07147
G1 X103.589 Y138.321 E.01857
G1 X105.379 Y140.11 E.08137
G1 X104.801 Y140.11 E.01857
G1 X103.012 Y138.321 E.08137
G1 X102.434 Y138.321 E.01857
G1 X104.224 Y140.11 E.08137
G1 X103.646 Y140.11 E.01857
G1 X101.857 Y138.321 E.08137
G1 X101.279 Y138.321 E.01857
G1 X103.069 Y140.11 E.08137
G1 X102.491 Y140.11 E.01857
G1 X100.702 Y138.321 E.08137
G1 X100.125 Y138.321 E.01857
G1 X101.914 Y140.11 E.08137
G1 X101.337 Y140.11 E.01857
G1 X99.547 Y138.321 E.08137
G1 X98.97 Y138.321 E.01857
G1 X100.759 Y140.11 E.08137
G1 X100.182 Y140.11 E.01857
G1 X98.392 Y138.321 E.08137
G1 X97.815 Y138.321 E.01857
G1 X99.604 Y140.11 E.08137
G1 X99.027 Y140.11 E.01857
G1 X97.237 Y138.321 E.08137
G1 X96.66 Y138.321 E.01857
G1 X98.449 Y140.11 E.08137
G1 X97.872 Y140.11 E.01857
G1 X96.083 Y138.321 E.08137
G1 X95.505 Y138.321 E.01857
G1 X97.294 Y140.11 E.08137
G1 X96.717 Y140.11 E.01857
G1 X94.928 Y138.321 E.08137
G1 X94.35 Y138.321 E.01857
G1 X96.14 Y140.11 E.08137
G1 X95.562 Y140.11 E.01857
G1 X93.773 Y138.321 E.08137
G1 X93.195 Y138.321 E.01857
G1 X94.985 Y140.11 E.08137
G1 X94.407 Y140.11 E.01857
G1 X92.618 Y138.321 E.08137
G1 X92.04 Y138.321 E.01857
G1 X93.83 Y140.11 E.08137
G1 X93.252 Y140.11 E.01857
G1 X91.463 Y138.321 E.08137
G1 X90.886 Y138.321 E.01857
G1 X92.675 Y140.11 E.08137
G1 X92.098 Y140.11 E.01857
G1 X90.308 Y138.321 E.08137
G1 X89.731 Y138.321 E.01857
G1 X91.52 Y140.11 E.08137
G1 X90.943 Y140.11 E.01857
G1 X89.153 Y138.321 E.08137
G1 X88.576 Y138.321 E.01857
G1 X90.365 Y140.11 E.08137
G1 X89.788 Y140.11 E.01857
G1 X87.998 Y138.321 E.08137
G1 X87.639 Y138.321 E.01156
G1 X87.639 Y138.539 E.007
G1 X89.21 Y140.11 E.07147
G1 X88.633 Y140.11 E.01857
G1 X87.639 Y139.116 E.04521
G1 X87.639 Y139.694 E.01857
G1 X88.239 Y140.294 E.02728
G1 X87.742 Y140.562 F15000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53922
G1 F3840
G1 X105.575 Y140.562 E.69911
; WIPE_START
G1 X103.575 Y140.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.05 Y139.282 Z1.9 F15000
G1 X87.742 Y137.869 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.5392
G1 F3840
G1 X105.575 Y137.869 E.69908
; WIPE_START
G1 X103.575 Y137.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.245 Y130.354 Z1.9 F15000
G1 X99.415 Y114.365 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X100.127 Y115.598 E.04579
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X96.136 Y113.218 E.03019
G1 X96.688 Y113.1 E.01815
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.385 Y114.313 E.00063
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X96.218 Y113.601 E.02548
G1 X96.688 Y113.501 E.01433
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52888
G1 X99.809 Y116.327 E-.23112
; WIPE_END
G1 E-.04 F1800
G1 X95.268 Y110.193 Z1.9 F15000
G1 X87.291 Y99.418 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.742 Y99.869 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53921
G1 F3840
G1 X105.575 Y99.869 E.69909
; WIPE_START
G1 X103.575 Y99.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.921 Y100.927 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.315 Y100.321 E.02758
G1 X104.733 Y100.321 E.01871
G1 X105.738 Y101.326 E.04571
G1 X105.738 Y101.908 E.01871
G1 X104.151 Y100.321 E.07217
G1 X103.569 Y100.321 E.01871
G1 X105.738 Y102.49 E.09863
G1 X105.738 Y103.072 E.01871
G1 X102.987 Y100.321 E.1251
G1 X102.405 Y100.321 E.01871
G1 X105.738 Y103.654 E.15156
G1 X105.738 Y104.236 E.01871
G1 X101.824 Y100.321 E.17802
G1 X101.242 Y100.321 E.01871
G1 X105.738 Y104.817 E.20448
G1 X105.738 Y105.399 E.01871
G1 X100.66 Y100.321 E.23094
G1 X100.078 Y100.321 E.01871
G1 X105.738 Y105.981 E.2574
G1 X105.738 Y106.563 E.01871
G1 X99.496 Y100.321 E.28386
G1 X98.914 Y100.321 E.01871
G1 X105.738 Y107.145 E.31033
G1 X105.738 Y107.727 E.01871
G1 X98.332 Y100.321 E.33679
G1 X97.75 Y100.321 E.01871
G1 X105.738 Y108.309 E.36325
G1 X105.738 Y108.891 E.01871
G1 X97.169 Y100.321 E.38971
G1 X96.587 Y100.321 E.01871
G1 X105.738 Y109.472 E.41617
G1 X105.738 Y110.054 E.01871
G1 X96.005 Y100.321 E.44263
G1 X95.423 Y100.321 E.01871
G1 X105.738 Y110.636 E.46909
G1 X105.738 Y111.218 E.01871
G1 X94.841 Y100.321 E.49556
G1 X94.259 Y100.321 E.01871
G1 X105.738 Y111.8 E.52202
G1 X105.738 Y112.382 E.01871
G1 X93.677 Y100.321 E.54848
G1 X93.095 Y100.321 E.01871
G1 X105.738 Y112.964 E.57494
G1 X105.738 Y113.546 E.01871
G1 X92.514 Y100.321 E.6014
G1 X91.932 Y100.321 E.01871
G1 X105.738 Y114.127 E.62786
G1 X105.738 Y114.709 E.01871
G1 X91.35 Y100.321 E.65432
G1 X90.768 Y100.321 E.01871
G1 X105.738 Y115.291 E.68079
G1 X105.738 Y115.873 E.01871
G1 X90.186 Y100.321 E.70725
G1 X89.604 Y100.321 E.01871
G1 X105.738 Y116.455 E.73371
G1 X105.738 Y117.037 E.01871
G1 X89.022 Y100.321 E.76017
G1 X88.44 Y100.321 E.01871
G1 X105.738 Y117.619 E.78663
G1 X105.738 Y118.201 E.01871
G1 X87.859 Y100.321 E.81309
G1 X87.639 Y100.321 E.00707
G1 X87.639 Y100.683 E.01165
G1 X105.738 Y118.783 E.82309
G1 X105.738 Y119.364 E.01871
G1 X87.639 Y101.265 E.82309
G1 X87.639 Y101.847 E.01871
G1 X105.738 Y119.946 E.82309
G1 X105.738 Y120.528 E.01871
G1 X100.148 Y114.938 E.25423
G1 X100.466 Y115.488 E.02045
G1 X100.507 Y115.879 E.01261
G1 X105.738 Y121.11 E.23791
G1 X105.738 Y121.692 E.01871
G1 X100.575 Y116.529 E.2348
G1 X100.628 Y117.163 E.02048
G1 X105.738 Y122.274 E.2324
G1 X105.738 Y122.856 E.01871
G1 X100.485 Y117.603 E.23889
G1 X100.342 Y118.042 E.01485
G1 X105.738 Y123.438 E.24538
G1 X105.738 Y124.019 E.01871
G1 X100.2 Y118.481 E.25187
G3 X99.991 Y118.854 I-.523 J-.048 E.01416
G1 X105.738 Y124.601 E.26137
G1 X105.738 Y125.183 E.01871
G1 X99.715 Y119.16 E.27391
G1 X99.439 Y119.466 E.01325
G1 X105.738 Y125.765 E.28644
G1 X105.738 Y126.347 E.01871
G1 X99.164 Y119.772 E.29898
G3 X98.826 Y120.016 I-.443 J-.257 E.0138
G1 X105.738 Y126.929 E.31434
G1 X105.738 Y127.511 E.01871
G1 X98.423 Y120.196 E.33265
G1 X98.021 Y120.375 E.01417
G1 X105.738 Y128.093 E.35096
G1 X105.738 Y128.674 E.01871
G1 X97.618 Y120.554 E.36927
G3 X97.082 Y120.6 I-.32 J-.579 E.01781
G1 X105.738 Y129.256 E.39363
G1 X105.738 Y129.838 E.01871
G1 X96.5 Y120.6 E.42009
G1 X95.919 Y120.6 E.01871
G1 X105.738 Y130.42 E.44656
G1 X105.738 Y131.002 E.01871
G1 X94.914 Y120.178 E.49222
G1 X94.354 Y119.929 E.01973
G1 X93.249 Y118.701 E.05311
G1 X93.158 Y118.422 E.00945
G1 X87.639 Y112.903 E.251
G1 X87.639 Y112.321 E.01871
G1 X92.878 Y117.56 E.23826
G3 X92.766 Y116.866 I.723 J-.472 E.02326
G1 X87.639 Y111.739 E.23318
G1 X87.639 Y111.157 E.01871
G1 X92.822 Y116.34 E.2357
G1 X92.877 Y115.813 E.01702
G1 X87.639 Y110.575 E.23822
G1 X87.639 Y109.993 E.01871
G1 X92.993 Y115.347 E.24348
G1 X93.206 Y114.978 E.0137
G1 X87.639 Y109.411 E.25316
G1 X87.639 Y108.829 E.01871
G1 X93.419 Y114.609 E.26285
G1 X93.632 Y114.241 E.0137
G1 X87.639 Y108.248 E.27254
G1 X87.639 Y107.666 E.01871
G1 X93.907 Y113.934 E.28507
G1 X94.244 Y113.69 E.0134
G1 X87.639 Y107.084 E.3004
G1 X87.639 Y106.502 E.01871
G1 X94.582 Y113.445 E.31573
G1 X94.919 Y113.2 E.0134
G1 X87.639 Y105.92 E.33105
G1 X87.639 Y105.338 E.01871
G1 X95.333 Y113.032 E.3499
G1 X95.813 Y112.93 E.01578
G1 X87.639 Y104.756 E.37172
G1 X87.639 Y104.174 E.01871
G1 X96.293 Y112.828 E.39354
G3 X96.818 Y112.772 I.326 J.562 E.0175
G1 X87.639 Y103.593 E.41743
G1 X87.639 Y103.011 E.01871
G1 X97.557 Y112.929 E.45103
G1 X98.296 Y113.086 E.02429
G1 X87.456 Y102.246 E.49297
; WIPE_START
G1 X88.87 Y103.66 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.829 Y110.185 Z1.9 F15000
G1 X105.921 Y131.767 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F7800
G1 X87.639 Y113.484 E.83142
G1 X87.639 Y114.066 E.01871
G1 X105.738 Y132.166 E.82309
G1 X105.738 Y132.748 E.01871
G1 X87.639 Y114.648 E.82309
G1 X87.639 Y115.23 E.01871
G1 X105.519 Y133.11 E.81312
G1 X104.937 Y133.11 E.01871
G1 X87.639 Y115.812 E.78666
G1 X87.639 Y116.394 E.01871
G1 X104.355 Y133.11 E.7602
G1 X103.773 Y133.11 E.01871
G1 X87.639 Y116.976 E.73374
G1 X87.639 Y117.558 E.01871
G1 X103.192 Y133.11 E.70728
G1 X102.61 Y133.11 E.01871
G1 X87.639 Y118.14 E.68081
G1 X87.639 Y118.721 E.01871
G1 X102.028 Y133.11 E.65435
G1 X101.446 Y133.11 E.01871
G1 X87.639 Y119.303 E.62789
G1 X87.639 Y119.885 E.01871
G1 X100.864 Y133.11 E.60143
G1 X100.282 Y133.11 E.01871
G1 X87.639 Y120.467 E.57497
G1 X87.639 Y121.049 E.01871
G1 X99.7 Y133.11 E.54851
G1 X99.118 Y133.11 E.01871
G1 X87.639 Y121.631 E.52205
G1 X87.639 Y122.213 E.01871
G1 X98.537 Y133.11 E.49558
G1 X97.955 Y133.11 E.01871
G1 X87.639 Y122.795 E.46912
G1 X87.639 Y123.376 E.01871
G1 X97.373 Y133.11 E.44266
G1 X96.791 Y133.11 E.01871
G1 X87.639 Y123.958 E.4162
G1 X87.639 Y124.54 E.01871
G1 X96.209 Y133.11 E.38974
G1 X95.627 Y133.11 E.01871
G1 X87.639 Y125.122 E.36328
G1 X87.639 Y125.704 E.01871
G1 X95.045 Y133.11 E.33682
G1 X94.463 Y133.11 E.01871
G1 X87.639 Y126.286 E.31035
G1 X87.639 Y126.868 E.01871
G1 X93.881 Y133.11 E.28389
G1 X93.3 Y133.11 E.01871
G1 X87.639 Y127.45 E.25743
G1 X87.639 Y128.031 E.01871
G1 X92.718 Y133.11 E.23097
G1 X92.136 Y133.11 E.01871
G1 X87.639 Y128.613 E.20451
G1 X87.639 Y129.195 E.01871
G1 X91.554 Y133.11 E.17805
G1 X90.972 Y133.11 E.01871
G1 X87.639 Y129.777 E.15159
G1 X87.639 Y130.359 E.01871
G1 X90.39 Y133.11 E.12512
G1 X89.808 Y133.11 E.01871
G1 X87.639 Y130.941 E.09866
G1 X87.639 Y131.523 E.01871
G1 X89.226 Y133.11 E.0722
G1 X88.645 Y133.11 E.01871
G1 X87.639 Y132.105 E.04574
G1 X87.639 Y132.686 E.01871
G1 X88.246 Y133.294 E.02761
G1 X87.742 Y133.562 F15000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53922
G1 F3840
G1 X105.575 Y133.562 E.69911
; WIPE_START
G1 X103.575 Y133.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.538 Y126.56 Z1.9 F15000
G1 X87.291 Y96.014 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.742 Y95.562 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F3840
G1 X105.575 Y95.562 E.69908
; WIPE_START
G1 X103.575 Y95.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.921 Y93.921 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.322 Y93.321 E.02728
G1 X104.744 Y93.321 E.01857
G1 X105.738 Y94.315 E.04521
G1 X105.738 Y94.892 E.01857
G1 X104.167 Y93.321 E.07147
G1 X103.589 Y93.321 E.01857
G1 X105.379 Y95.11 E.08137
G1 X104.801 Y95.11 E.01857
G1 X103.012 Y93.321 E.08137
G1 X102.434 Y93.321 E.01857
G1 X104.224 Y95.11 E.08137
G1 X103.646 Y95.11 E.01857
G1 X101.857 Y93.321 E.08137
G1 X101.279 Y93.321 E.01857
G1 X103.069 Y95.11 E.08137
G1 X102.491 Y95.11 E.01857
G1 X100.702 Y93.321 E.08137
G1 X100.125 Y93.321 E.01857
G1 X101.914 Y95.11 E.08137
G1 X101.337 Y95.11 E.01857
M73 P56 R18
G1 X99.547 Y93.321 E.08137
G1 X98.97 Y93.321 E.01857
G1 X100.759 Y95.11 E.08137
G1 X100.182 Y95.11 E.01857
G1 X98.392 Y93.321 E.08137
G1 X97.815 Y93.321 E.01857
G1 X99.604 Y95.11 E.08137
G1 X99.027 Y95.11 E.01857
G1 X97.237 Y93.321 E.08137
G1 X96.66 Y93.321 E.01857
G1 X98.449 Y95.11 E.08137
G1 X97.872 Y95.11 E.01857
G1 X96.083 Y93.321 E.08137
G1 X95.505 Y93.321 E.01857
G1 X97.294 Y95.11 E.08137
G1 X96.717 Y95.11 E.01857
G1 X94.928 Y93.321 E.08137
G1 X94.35 Y93.321 E.01857
G1 X96.14 Y95.11 E.08137
G1 X95.562 Y95.11 E.01857
G1 X93.773 Y93.321 E.08137
G1 X93.195 Y93.321 E.01857
G1 X94.985 Y95.11 E.08137
G1 X94.407 Y95.11 E.01857
G1 X92.618 Y93.321 E.08137
G1 X92.04 Y93.321 E.01857
G1 X93.83 Y95.11 E.08137
G1 X93.252 Y95.11 E.01857
G1 X91.463 Y93.321 E.08137
G1 X90.886 Y93.321 E.01857
G1 X92.675 Y95.11 E.08137
G1 X92.098 Y95.11 E.01857
G1 X90.308 Y93.321 E.08137
G1 X89.731 Y93.321 E.01857
G1 X91.52 Y95.11 E.08137
G1 X90.943 Y95.11 E.01857
G1 X89.153 Y93.321 E.08137
G1 X88.576 Y93.321 E.01857
G1 X90.365 Y95.11 E.08137
G1 X89.788 Y95.11 E.01857
G1 X87.998 Y93.321 E.08137
G1 X87.639 Y93.321 E.01156
G1 X87.639 Y93.539 E.007
G1 X89.21 Y95.11 E.07147
G1 X88.633 Y95.11 E.01857
G1 X87.639 Y94.116 E.04521
G1 X87.639 Y94.694 E.01857
G1 X88.239 Y95.294 E.02728
; WIPE_START
G1 X87.639 Y94.694 E-.32235
G1 X87.639 Y94.116 E-.21943
G1 X88.045 Y94.522 E-.21822
; WIPE_END
G1 E-.04 F1800
G1 X87.742 Y92.869 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.53921
G1 F3840
G1 X105.575 Y92.869 E.69909
; WIPE_START
G1 X103.575 Y92.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.036 Y85.672 Z1.9 F15000
G1 X97.361 Y75.252 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X95.937 Y75.252 E.04579
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X96.136 Y68.218 E.03019
G1 X96.688 Y68.1 E.01815
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04835
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.421 Y75.252 E.00063
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X96.218 Y68.601 E.02548
G1 X96.688 Y68.501 E.01433
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X91.697 Y81.25 Z1.9 F15000
G1 X87.291 Y89.014 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.742 Y88.562 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.5392
G1 F3840
G1 X105.575 Y88.562 E.69908
; WIPE_START
G1 X103.575 Y88.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.921 Y86.876 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y68.594 E.83142
G1 X87.639 Y69.172 E.01861
G1 X105.738 Y87.272 E.82309
G1 X105.738 Y87.851 E.01861
G1 X87.639 Y69.751 E.82309
G1 X87.639 Y70.33 E.01861
G1 X105.419 Y88.11 E.80858
G1 X104.84 Y88.11 E.01861
G1 X87.639 Y70.909 E.78226
G1 X87.639 Y71.487 E.01861
G1 X104.262 Y88.11 E.75595
G1 X103.683 Y88.11 E.01861
G1 X87.639 Y72.066 E.72963
G1 X87.639 Y72.645 E.01861
G1 X103.104 Y88.11 E.70331
G1 X102.526 Y88.11 E.01861
G1 X87.639 Y73.224 E.67699
G1 X87.639 Y73.802 E.01861
G1 X101.947 Y88.11 E.65067
G1 X101.368 Y88.11 E.01861
G1 X87.639 Y74.381 E.62436
G1 X87.639 Y74.96 E.01861
G1 X100.789 Y88.11 E.59804
G1 X100.211 Y88.11 E.01861
G1 X87.639 Y75.538 E.57172
G1 X87.639 Y76.117 E.01861
G1 X99.632 Y88.11 E.5454
G1 X99.053 Y88.11 E.01861
G1 X87.639 Y76.696 E.51908
G1 X87.639 Y77.275 E.01861
G1 X98.475 Y88.11 E.49277
G1 X97.896 Y88.11 E.01861
G1 X87.639 Y77.853 E.46645
G1 X87.639 Y78.432 E.01861
G1 X97.317 Y88.11 E.44013
G1 X96.738 Y88.11 E.01861
G1 X87.639 Y79.011 E.41381
G1 X87.639 Y79.59 E.01861
G1 X96.16 Y88.11 E.38749
G1 X95.581 Y88.11 E.01861
G1 X87.639 Y80.168 E.36118
G1 X87.639 Y80.747 E.01861
G1 X95.002 Y88.11 E.33486
G1 X94.423 Y88.11 E.01861
G1 X87.639 Y81.326 E.30854
G1 X87.639 Y81.904 E.01861
G1 X93.845 Y88.11 E.28222
G1 X93.266 Y88.11 E.01861
G1 X87.639 Y82.483 E.2559
G1 X87.639 Y83.062 E.01861
G1 X92.687 Y88.11 E.22958
G1 X92.109 Y88.11 E.01861
G1 X87.639 Y83.641 E.20327
G1 X87.639 Y84.219 E.01861
G1 X91.53 Y88.11 E.17695
G1 X90.951 Y88.11 E.01861
G1 X87.639 Y84.798 E.15063
G1 X87.639 Y85.377 E.01861
G1 X90.372 Y88.11 E.12431
G1 X89.794 Y88.11 E.01861
G1 X87.639 Y85.955 E.09799
G1 X87.639 Y86.534 E.01861
G1 X89.215 Y88.11 E.07168
G1 X88.636 Y88.11 E.01861
G1 X87.639 Y87.113 E.04536
G1 X87.639 Y87.692 E.01861
G1 X88.241 Y88.294 E.02737
; WIPE_START
G1 X87.639 Y87.692 E-.32345
G1 X87.639 Y87.113 E-.21991
G1 X88.042 Y87.516 E-.21664
; WIPE_END
G1 E-.04 F1800
G1 X94.439 Y83.353 Z1.9 F15000
G1 X105.921 Y75.881 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F7800
G1 X100.379 Y70.338 E.25205
G1 X100.466 Y70.488 E.00558
G1 X100.526 Y71.064 E.01861
G1 X105.738 Y76.276 E.23702
G1 X105.738 Y76.855 E.01861
G1 X100.594 Y71.711 E.23393
G3 X100.589 Y72.284 I-.647 J.28 E.01898
G1 X105.738 Y77.434 E.23418
G1 X105.738 Y78.012 E.01861
G1 X100.447 Y72.721 E.24064
G1 X100.305 Y73.158 E.01477
G1 X105.738 Y78.591 E.24709
G1 X105.738 Y79.17 E.01861
G1 X100.163 Y73.594 E.25355
G3 X99.921 Y73.931 I-.499 J-.103 E.01373
G1 X105.738 Y79.748 E.26454
G1 X105.738 Y80.327 E.01861
G1 X99.647 Y74.236 E.27701
G1 X99.373 Y74.54 E.01318
G1 X105.738 Y80.906 E.28948
G1 X105.738 Y81.485 E.01861
G1 X99.098 Y74.845 E.30195
G3 X98.733 Y75.058 I-.422 J-.304 E.01402
G1 X105.738 Y82.063 E.31858
G1 X105.738 Y82.642 E.01861
G1 X98.332 Y75.236 E.33679
G1 X97.932 Y75.415 E.0141
G1 X105.738 Y83.221 E.355
G1 X105.738 Y83.799 E.01861
G1 X97.531 Y75.593 E.37321
G1 X96.96 Y75.6 E.01837
G1 X105.738 Y84.378 E.39918
G1 X105.738 Y84.957 E.01861
G1 X96.382 Y75.6 E.4255
G1 X95.755 Y75.552 E.02021
G1 X105.738 Y85.536 E.45399
G1 X105.738 Y86.114 E.01861
G1 X87.639 Y68.015 E.82309
G1 X87.639 Y67.436 E.01861
G1 X92.934 Y72.731 E.24079
G1 X92.739 Y72.131 E.0203
G1 X92.755 Y71.974 E.00507
G1 X87.639 Y66.858 E.23267
G1 X87.639 Y66.279 E.01861
G1 X92.81 Y71.45 E.23517
G1 X92.865 Y70.927 E.01693
G1 X87.639 Y65.7 E.23768
G1 X87.639 Y65.121 E.01861
G1 X92.946 Y70.429 E.24135
G1 X93.158 Y70.062 E.01362
G1 X87.639 Y64.543 E.25098
G1 X87.639 Y63.964 E.01861
G1 X93.37 Y69.695 E.26061
G1 X93.581 Y69.328 E.01362
G1 X87.639 Y63.385 E.27024
G1 X87.639 Y62.807 E.01861
G1 X93.826 Y68.994 E.28136
G1 X94.161 Y68.75 E.01332
G1 X87.639 Y62.228 E.29661
G1 X87.639 Y61.649 E.01861
G1 X94.496 Y68.507 E.31185
G1 X94.831 Y68.263 E.01332
G1 X87.639 Y61.07 E.32709
G1 X87.639 Y60.492 E.01861
G1 X95.206 Y68.059 E.34414
G1 X95.684 Y67.958 E.01569
G1 X87.639 Y59.913 E.36585
G1 X87.639 Y59.334 E.01861
G1 X96.161 Y67.856 E.38755
G1 X96.638 Y67.755 E.01569
G1 X87.639 Y58.755 E.40926
G1 X87.639 Y58.177 E.01861
G1 X97.346 Y67.884 E.44144
G1 X98.081 Y68.04 E.02416
G1 X87.639 Y57.598 E.47487
G1 X87.639 Y57.019 E.01861
G1 X105.738 Y75.119 E.82309
G1 X105.738 Y74.54 E.01861
G1 X87.639 Y56.441 E.82309
G1 X87.639 Y55.862 E.01861
G1 X105.738 Y73.961 E.82309
G1 X105.738 Y73.382 E.01861
G1 X87.639 Y55.283 E.82309
G1 X87.639 Y54.704 E.01861
G1 X105.738 Y72.804 E.82309
G1 X105.738 Y72.225 E.01861
G1 X87.639 Y54.126 E.82309
G1 X87.639 Y53.547 E.01861
G1 X105.738 Y71.646 E.82309
G1 X105.738 Y71.068 E.01861
G1 X87.639 Y52.968 E.82309
G1 X87.639 Y52.666 E.00972
G1 X87.915 Y52.666 E.00889
G1 X105.738 Y70.489 E.81051
G1 X105.738 Y69.91 E.01861
G1 X88.494 Y52.666 E.78419
G1 X89.073 Y52.666 E.01861
G1 X105.738 Y69.331 E.75787
G1 X105.738 Y68.753 E.01861
G1 X89.652 Y52.666 E.73156
G1 X90.23 Y52.666 E.01861
G1 X105.738 Y68.174 E.70524
G1 X105.738 Y67.595 E.01861
G1 X90.809 Y52.666 E.67892
G1 X91.388 Y52.666 E.01861
G1 X105.738 Y67.016 E.6526
G1 X105.738 Y66.438 E.01861
G1 X91.966 Y52.666 E.62628
G1 X92.545 Y52.666 E.01861
G1 X105.738 Y65.859 E.59997
G1 X105.738 Y65.28 E.01861
G1 X93.124 Y52.666 E.57365
G1 X93.703 Y52.666 E.01861
G1 X105.738 Y64.702 E.54733
G1 X105.738 Y64.123 E.01861
G1 X94.281 Y52.666 E.52101
G1 X94.86 Y52.666 E.01861
G1 X105.738 Y63.544 E.49469
G1 X105.738 Y62.965 E.01861
G1 X95.439 Y52.666 E.46838
G1 X96.017 Y52.666 E.01861
G1 X105.738 Y62.387 E.44206
G1 X105.738 Y61.808 E.01861
G1 X96.596 Y52.666 E.41574
G1 X97.175 Y52.666 E.01861
G1 X105.738 Y61.229 E.38942
G1 X105.738 Y60.651 E.01861
G1 X97.754 Y52.666 E.3631
G1 X98.332 Y52.666 E.01861
G1 X105.738 Y60.072 E.33679
G1 X105.738 Y59.493 E.01861
G1 X98.911 Y52.666 E.31047
G1 X99.49 Y52.666 E.01861
G1 X105.738 Y58.914 E.28415
G1 X105.738 Y58.336 E.01861
G1 X100.069 Y52.666 E.25783
G1 X100.647 Y52.666 E.01861
G1 X105.738 Y57.757 E.23151
G1 X105.738 Y57.178 E.01861
G1 X101.226 Y52.666 E.2052
G1 X101.805 Y52.666 E.01861
G1 X105.738 Y56.599 E.17888
G1 X105.738 Y56.021 E.01861
G1 X102.383 Y52.666 E.15256
G1 X102.962 Y52.666 E.01861
G1 X105.738 Y55.442 E.12624
G1 X105.738 Y54.863 E.01861
G1 X103.541 Y52.666 E.09992
G1 X104.12 Y52.666 E.01861
G1 X105.738 Y54.285 E.0736
G1 X105.738 Y53.706 E.01861
G1 X104.698 Y52.666 E.04729
G1 X105.277 Y52.666 E.01861
G1 X105.921 Y53.31 E.0293
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X105.277 Y52.666 E-.34623
G1 X104.698 Y52.666 E-.21991
G1 X105.059 Y53.027 E-.19385
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 8/20
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.9 I1.217 J0 P1  F15000
; object ids of layer 8 start: 138,178
M624 AwAAAAAAAAA=
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
; object ids of this layer8 end: 138,178
M625
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X199.995 Y66.256
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X162.791 Y66.256 E1.19635
G1 X162.791 Y91.256 E.80391
G1 X161.995 Y91.256 E.02559
G1 X161.995 Y66.256 E.80391
G1 X155.791 Y66.256 E.1995
G1 X155.791 Y107.882 E1.33856
G1 X154.995 Y107.882 E.02559
G1 X154.995 Y65.46 E1.36416
G1 X207.791 Y65.46 E1.69772
G1 X207.791 Y107.882 E1.36416
G1 X206.995 Y107.882 E.02559
G1 X206.995 Y66.256 E1.33856
G1 X200.791 Y66.256 E.1995
G1 X200.791 Y91.256 E.80391
G1 X199.995 Y91.256 E.02559
G1 X199.995 Y66.316 E.80198
M204 S250
G1 X199.603 Y66.648 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X163.183 Y66.648 E1.08483
G1 X163.183 Y91.648 E.74466
G1 X161.603 Y91.648 E.04706
G1 X161.603 Y66.648 E.74466
G1 X156.183 Y66.648 E.16144
G1 X156.183 Y125.853 E1.76351
G1 X154.603 Y125.853 E.04706
G1 X154.603 Y65.068 E1.81057
G1 X208.183 Y65.068 E1.59597
G1 X208.183 Y125.853 E1.81057
G1 X206.603 Y125.853 E.04706
G1 X206.603 Y66.648 E1.76351
G1 X201.183 Y66.648 E.16144
G1 X201.183 Y91.648 E.74466
G1 X199.603 Y91.648 E.04706
G1 X199.603 Y66.708 E.74288
; WIPE_START
M204 S5000
G1 X197.603 Y66.704 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.393 Y66.052 Z2.1 F15000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.490218
G1 F7500
G1 X200.393 Y65.906 E.00515
G1 X200.491 Y65.882 E.00354
; LINE_WIDTH: 0.45602
G1 X200.588 Y65.858 E.00327
; LINE_WIDTH: 0.43172
G1 X207.199 Y65.858 E.20305
; LINE_WIDTH: 0.470635
G1 X207.36 Y65.891 E.00556
G1 X207.377 Y65.972 E.00278
; LINE_WIDTH: 0.448395
G1 X207.393 Y66.052 E.00263
; LINE_WIDTH: 0.43172
G1 X207.393 Y107.679 E1.27846
; WIPE_START
G1 X207.393 Y105.679 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.625 Y113.308 Z2.1 F15000
M73 P57 R18
G1 X207.976 Y124.904 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X207.235 Y125.645 E.03122
G1 X206.811 Y125.536
G1 X207.976 Y124.371 E.04908
G1 X207.976 Y123.838
G1 X206.811 Y125.003 E.04908
G1 X206.811 Y124.47
G1 X207.976 Y123.304 E.04908
G1 X207.976 Y122.771
G1 X206.811 Y123.936 E.04908
G1 X206.811 Y123.403
G1 X207.976 Y122.238 E.04908
G1 X207.976 Y121.705
G1 X206.811 Y122.87 E.04908
G1 X206.811 Y122.337
G1 X207.976 Y121.171 E.04908
G1 X207.976 Y120.638
G1 X206.811 Y121.803 E.04908
G1 X206.811 Y121.27
G1 X207.976 Y120.105 E.04908
G1 X207.976 Y119.572
G1 X206.811 Y120.737 E.04908
G1 X206.811 Y120.204
G1 X207.976 Y119.038 E.04908
G1 X207.976 Y118.505
G1 X206.811 Y119.67 E.04908
G1 X206.811 Y119.137
G1 X207.976 Y117.972 E.04908
G1 X207.976 Y117.439
G1 X206.811 Y118.604 E.04908
M73 P57 R17
G1 X206.811 Y118.07
G1 X207.976 Y116.905 E.04908
G1 X207.976 Y116.372
G1 X206.811 Y117.537 E.04908
G1 X206.811 Y117.004
G1 X207.976 Y115.839 E.04908
G1 X207.976 Y115.305
G1 X206.811 Y116.471 E.04908
G1 X206.811 Y115.937
G1 X207.976 Y114.772 E.04908
G1 X207.976 Y114.239
G1 X206.811 Y115.404 E.04908
G1 X206.811 Y114.871
G1 X207.976 Y113.706 E.04908
G1 X207.976 Y113.172
G1 X206.811 Y114.338 E.04908
G1 X206.811 Y113.804
G1 X207.976 Y112.639 E.04908
G1 X207.976 Y112.106
G1 X206.811 Y113.271 E.04908
G1 X206.811 Y112.738
G1 X207.976 Y111.573 E.04908
G1 X207.976 Y111.039
G1 X206.811 Y112.205 E.04908
G1 X206.811 Y111.671
G1 X207.976 Y110.506 E.04908
G1 X207.976 Y109.973
G1 X206.811 Y111.138 E.04908
G1 X206.811 Y110.605
G1 X207.976 Y109.44 E.04908
G1 X207.976 Y108.906
G1 X206.811 Y110.072 E.04908
G1 X206.811 Y109.538
G1 X207.976 Y108.373 E.04908
G1 X207.711 Y108.105
G1 X206.811 Y109.005 E.03792
G1 X206.811 Y108.472
G1 X207.178 Y108.105 E.01546
; WIPE_START
M204 S5000
G1 X206.811 Y108.472 E-.1972
G1 X206.811 Y109.005 E-.20264
G1 X207.481 Y108.335 E-.36016
; WIPE_END
G1 E-.04 F1800
G1 X204.585 Y101.273 Z2.1 F15000
G1 X200.393 Y91.052 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X200.393 Y66.052 E.76781
G1 X200.393 Y65.906 F15000
; LINE_WIDTH: 0.50462
G1 F7500
G1 X200.296 Y65.882 E.00365
; LINE_WIDTH: 0.431785
G1 X200.199 Y65.858 E.00308
G1 X162.588 Y65.858 E1.15532
; LINE_WIDTH: 0.45602
G1 X162.491 Y65.882 E.00327
; LINE_WIDTH: 0.490218
G1 X162.393 Y65.906 E.00354
G1 X162.393 Y66.052 E.00515
; LINE_WIDTH: 0.43172
G1 X162.393 Y91.052 E.76781
; WIPE_START
G1 X162.393 Y89.052 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.708 Y96.197 Z2.1 F15000
G1 X155.393 Y107.679 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F7500
G1 X155.393 Y66.052 E1.27846
; LINE_WIDTH: 0.470635
G1 X155.427 Y65.891 E.00556
G1 X155.507 Y65.874 E.00278
; LINE_WIDTH: 0.448395
G1 X155.588 Y65.858 E.00263
; LINE_WIDTH: 0.432083
G1 X162.199 Y65.858 E.20324
G1 X162.296 Y65.882 E.00308
; LINE_WIDTH: 0.50462
G1 X162.393 Y65.906 E.00365
; WIPE_START
G1 X162.296 Y65.882 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.435 Y73.466 Z2.1 F15000
G1 X155.509 Y125.645 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X155.976 Y125.178 E.01968
G1 X155.976 Y124.645
G1 X154.976 Y125.645 E.04214
G1 X154.811 Y125.277
G1 X155.976 Y124.112 E.04908
G1 X155.976 Y123.578
G1 X154.811 Y124.744 E.04908
G1 X154.811 Y124.21
G1 X155.976 Y123.045 E.04908
G1 X155.976 Y122.512
G1 X154.811 Y123.677 E.04908
G1 X154.811 Y123.144
G1 X155.976 Y121.979 E.04908
G1 X155.976 Y121.445
G1 X154.811 Y122.611 E.04908
G1 X154.811 Y122.077
G1 X155.976 Y120.912 E.04908
G1 X155.976 Y120.379
G1 X154.811 Y121.544 E.04908
G1 X154.811 Y121.011
G1 X155.976 Y119.846 E.04908
G1 X155.976 Y119.312
G1 X154.811 Y120.478 E.04908
G1 X154.811 Y119.944
G1 X155.976 Y118.779 E.04908
G1 X155.976 Y118.246
G1 X154.811 Y119.411 E.04908
G1 X154.811 Y118.878
G1 X155.976 Y117.713 E.04908
G1 X155.976 Y117.179
G1 X154.811 Y118.344 E.04908
G1 X154.811 Y117.811
G1 X155.976 Y116.646 E.04908
G1 X155.976 Y116.113
G1 X154.811 Y117.278 E.04908
G1 X154.811 Y116.745
G1 X155.976 Y115.579 E.04908
G1 X155.976 Y115.046
G1 X154.811 Y116.211 E.04908
G1 X154.811 Y115.678
G1 X155.976 Y114.513 E.04908
G1 X155.976 Y113.98
G1 X154.811 Y115.145 E.04908
G1 X154.811 Y114.612
G1 X155.976 Y113.446 E.04908
G1 X155.976 Y112.913
G1 X154.811 Y114.078 E.04908
G1 X154.811 Y113.545
G1 X155.976 Y112.38 E.04908
G1 X155.976 Y111.847
G1 X154.811 Y113.012 E.04908
G1 X154.811 Y112.479
G1 X155.976 Y111.313 E.04908
G1 X155.976 Y110.78
G1 X154.811 Y111.945 E.04908
G1 X154.811 Y111.412
G1 X155.976 Y110.247 E.04908
G1 X155.976 Y109.714
G1 X154.811 Y110.879 E.04908
G1 X154.811 Y110.346
G1 X155.976 Y109.18 E.04908
G1 X155.976 Y108.647
G1 X154.811 Y109.812 E.04908
G1 X154.811 Y109.279
G1 X155.976 Y108.114 E.04908
G1 X155.452 Y108.105
G1 X154.811 Y108.746 E.027
; OBJECT_ID: 178
; WIPE_START
M204 S5000
G1 X155.452 Y108.105 E-.34446
G1 X155.976 Y108.114 E-.19925
G1 X155.573 Y108.516 E-.2163
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X150.146 Y113.883 Z2.1 F15000
G1 X98.867 Y164.581 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.814 Y164.641 E.00258
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04834
G1 X96.075 Y158.231 E.02818
G1 X96.688 Y158.1 E.02016
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04835
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.907 Y164.537 E.04384
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X96.157 Y158.614 E.02362
G1 X96.688 Y158.501 E.01619
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X93.544 Y157.933 Z2.1 F15000
G1 X87.291 Y144.418 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.282 Y144.583 Z2.1 F15000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y145.226 E.02926
G1 X87.639 Y145.804 E.01859
G1 X88.677 Y144.766 E.04721
G1 X89.255 Y144.766 E.01859
G1 X87.639 Y146.382 E.0735
G1 X87.639 Y146.96 E.01859
G1 X89.833 Y144.766 E.09979
G1 X90.411 Y144.766 E.01859
G1 X87.639 Y147.538 E.12607
G1 X87.639 Y148.116 E.01859
G1 X90.989 Y144.766 E.15236
G1 X91.567 Y144.766 E.01859
G1 X87.639 Y148.694 E.17865
G1 X87.639 Y149.272 E.01859
G1 X92.145 Y144.766 E.20493
G1 X92.723 Y144.766 E.01859
G1 X87.639 Y149.85 E.23122
G1 X87.639 Y150.428 E.01859
G1 X93.301 Y144.766 E.2575
G1 X93.879 Y144.766 E.01859
G1 X87.639 Y151.006 E.28379
G1 X87.639 Y151.584 E.01859
G1 X94.457 Y144.766 E.31008
G1 X95.035 Y144.766 E.01859
G1 X87.639 Y152.162 E.33636
G1 X87.639 Y152.74 E.01859
G1 X95.613 Y144.766 E.36265
G1 X96.191 Y144.766 E.01859
G1 X87.639 Y153.319 E.38894
G1 X87.639 Y153.897 E.01859
G1 X96.769 Y144.766 E.41522
G1 X97.347 Y144.766 E.01859
G1 X87.639 Y154.475 E.44151
G1 X87.639 Y155.053 E.01859
G1 X97.925 Y144.766 E.4678
G1 X98.503 Y144.766 E.01859
G1 X87.639 Y155.631 E.49408
G1 X87.639 Y156.209 E.01859
G1 X99.081 Y144.766 E.52037
G1 X99.659 Y144.766 E.01859
G1 X87.639 Y156.787 E.54666
G1 X87.639 Y157.365 E.01859
G1 X100.238 Y144.766 E.57294
G1 X100.816 Y144.766 E.01859
G1 X87.639 Y157.943 E.59923
G1 X87.639 Y158.521 E.01859
G1 X101.394 Y144.766 E.62552
G1 X101.972 Y144.766 E.01859
G1 X87.639 Y159.099 E.6518
G1 X87.639 Y159.677 E.01859
G1 X102.55 Y144.766 E.67809
G1 X103.128 Y144.766 E.01859
G1 X87.639 Y160.255 E.70438
G1 X87.639 Y160.833 E.01859
G1 X103.706 Y144.766 E.73066
G1 X104.284 Y144.766 E.01859
G1 X87.639 Y161.411 E.75695
G1 X87.639 Y161.989 E.01859
G1 X104.862 Y144.766 E.78324
G1 X105.44 Y144.766 E.01859
G1 X87.639 Y162.567 E.80952
G1 X87.639 Y163.145 E.01859
G1 X105.738 Y145.046 E.82309
G1 X105.738 Y145.624 E.01859
G1 X87.639 Y163.723 E.82309
G1 X87.639 Y164.301 E.01859
G1 X105.738 Y146.202 E.82309
G1 X105.738 Y146.78 E.01859
G1 X87.456 Y165.062 E.83142
; WIPE_START
G1 X88.87 Y163.648 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.005 Y171.231 Z2.1 F15000
G1 X87.456 Y176.045 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F7800
G1 X98.21 Y165.291 E.48906
G1 X97.514 Y165.6 E.02448
G1 X97.322 Y165.6 E.00618
G1 X87.639 Y175.284 E.44036
G1 X87.639 Y174.706 E.01859
G1 X96.744 Y165.6 E.41407
G1 X96.166 Y165.6 E.01859
G1 X87.639 Y174.128 E.38779
G1 X87.639 Y173.55 E.01859
G1 X95.673 Y165.516 E.36535
G1 X95.273 Y165.338 E.01408
G1 X87.639 Y172.972 E.34716
G1 X87.639 Y172.394 E.01859
G1 X94.873 Y165.16 E.32897
G1 X94.473 Y164.981 E.01408
G1 X87.639 Y171.816 E.31078
G1 X87.639 Y171.237 E.01859
G1 X94.161 Y164.715 E.29663
G1 X93.888 Y164.411 E.01316
G1 X87.639 Y170.659 E.28417
G1 X87.639 Y170.081 E.01859
G1 X93.614 Y164.106 E.27172
G1 X93.34 Y163.802 E.01316
G1 X87.639 Y169.503 E.25927
G1 X87.639 Y168.925 E.01859
G1 X93.154 Y163.41 E.25083
G1 X93.013 Y162.973 E.01475
G1 X87.639 Y168.347 E.24438
G1 X87.639 Y167.769 E.01859
G1 X92.871 Y162.537 E.23793
G1 X92.743 Y162.087 E.01506
G1 X87.639 Y167.191 E.23214
G1 X87.639 Y166.613 E.01859
G1 X92.811 Y161.441 E.23523
G1 X92.879 Y160.795 E.02089
G1 X87.639 Y166.035 E.23832
G1 X87.639 Y165.457 E.01859
G1 X93.327 Y159.769 E.25866
G1 X93.737 Y159.058 E.0264
M73 P58 R17
G1 X94.836 Y158.26 E.04368
G1 X105.738 Y147.358 E.49579
G1 X105.738 Y147.936 E.01859
G1 X95.725 Y157.949 E.45537
G1 X96.459 Y157.793 E.02413
G1 X105.738 Y148.514 E.42199
G1 X105.738 Y149.092 E.01859
G1 X97.016 Y157.814 E.39665
G1 X97.493 Y157.915 E.01567
G1 X105.738 Y149.67 E.37497
G1 X105.738 Y150.248 E.01859
G1 X97.97 Y158.017 E.35329
G3 X98.404 Y158.16 I.056 J.56 E.01515
G1 X105.738 Y150.826 E.33354
G1 X105.738 Y151.404 E.01859
G1 X98.739 Y158.403 E.31832
G1 X99.073 Y158.647 E.01331
G1 X105.738 Y151.982 E.30309
G1 X105.738 Y152.56 E.01859
G1 X99.408 Y158.89 E.28787
G3 X99.705 Y159.171 I-.167 J.474 E.01354
G1 X105.738 Y153.138 E.27437
G1 X105.738 Y153.716 E.01859
G1 X99.917 Y159.538 E.26474
G1 X100.128 Y159.904 E.01361
G1 X105.738 Y154.294 E.25512
G1 X105.738 Y154.872 E.01859
G1 X100.34 Y160.271 E.2455
G3 X100.488 Y160.7 I-.409 J.381 E.01506
G1 X105.738 Y155.45 E.23877
G1 X105.738 Y156.028 E.01859
G1 X100.543 Y161.224 E.23627
G1 X100.598 Y161.747 E.01691
G1 X105.738 Y156.606 E.23377
G1 X105.738 Y157.184 E.01859
G1 X100.564 Y162.358 E.23529
G1 X100.286 Y163.214 E.02895
G1 X105.738 Y157.762 E.24794
G1 X105.738 Y158.34 E.01859
G1 X87.639 Y176.44 E.82309
G1 X87.639 Y177.018 E.01859
G1 X105.738 Y158.918 E.82309
G1 X105.738 Y159.496 E.01859
G1 X87.639 Y177.596 E.82309
G1 X87.639 Y178.174 E.01859
G1 X105.738 Y160.074 E.82309
G1 X105.738 Y160.652 E.01859
G1 X87.639 Y178.752 E.82309
G1 X87.639 Y179.33 E.01859
G1 X105.738 Y161.23 E.82309
G1 X105.738 Y161.808 E.01859
G1 X87.639 Y179.908 E.82309
G1 X87.639 Y180.486 E.01859
G1 X105.738 Y162.386 E.82309
G1 X105.738 Y162.964 E.01859
G1 X87.937 Y180.765 E.80952
G1 X88.515 Y180.765 E.01859
G1 X105.738 Y163.543 E.78323
G1 X105.738 Y164.121 E.01859
G1 X89.093 Y180.765 E.75694
G1 X89.671 Y180.765 E.01859
G1 X105.738 Y164.699 E.73066
G1 X105.738 Y165.277 E.01859
G1 X90.249 Y180.765 E.70437
G1 X90.827 Y180.765 E.01859
G1 X105.738 Y165.855 E.67808
G1 X105.738 Y166.433 E.01859
G1 X91.405 Y180.765 E.6518
G1 X91.983 Y180.765 E.01859
G1 X105.738 Y167.011 E.62551
G1 X105.738 Y167.589 E.01859
G1 X92.562 Y180.765 E.59922
G1 X93.14 Y180.765 E.01859
G1 X105.738 Y168.167 E.57294
G1 X105.738 Y168.745 E.01859
G1 X93.718 Y180.765 E.54665
G1 X94.296 Y180.765 E.01859
G1 X105.738 Y169.323 E.52036
G1 X105.738 Y169.901 E.01859
G1 X94.874 Y180.765 E.49408
G1 X95.452 Y180.765 E.01859
G1 X105.738 Y170.479 E.46779
G1 X105.738 Y171.057 E.01859
G1 X96.03 Y180.765 E.44151
G1 X96.608 Y180.765 E.01859
G1 X105.738 Y171.635 E.41522
G1 X105.738 Y172.213 E.01859
G1 X97.186 Y180.765 E.38893
G1 X97.764 Y180.765 E.01859
G1 X105.738 Y172.791 E.36265
G1 X105.738 Y173.369 E.01859
G1 X98.342 Y180.765 E.33636
G1 X98.92 Y180.765 E.01859
G1 X105.738 Y173.947 E.31007
G1 X105.738 Y174.525 E.01859
G1 X99.498 Y180.765 E.28379
G1 X100.076 Y180.765 E.01859
G1 X105.738 Y175.103 E.2575
G1 X105.738 Y175.681 E.01859
G1 X100.654 Y180.765 E.23121
G1 X101.232 Y180.765 E.01859
G1 X105.738 Y176.259 E.20493
G1 X105.738 Y176.837 E.01859
G1 X101.81 Y180.765 E.17864
G1 X102.388 Y180.765 E.01859
G1 X105.738 Y177.415 E.15235
G1 X105.738 Y177.993 E.01859
G1 X102.966 Y180.765 E.12607
G1 X103.544 Y180.765 E.01859
G1 X105.738 Y178.571 E.09978
G1 X105.738 Y179.149 E.01859
G1 X104.122 Y180.765 E.07349
G1 X104.7 Y180.765 E.01859
G1 X105.738 Y179.727 E.04721
G1 X105.738 Y180.305 E.01859
G1 X105.095 Y180.949 E.02925
; WIPE_START
G1 X105.738 Y180.305 E-.34567
G1 X105.738 Y179.727 E-.21965
G1 X105.376 Y180.09 E-.19468
; WIPE_END
G1 E-.04 F1800
G1 X105.515 Y172.458 Z2.1 F15000
G1 X106.086 Y141.014 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.078 Y140.849 Z2.1 F15000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y140.188 E.03004
G1 X105.738 Y139.599 E.01896
G1 X104.671 Y140.665 E.04852
G1 X104.082 Y140.665 E.01896
G1 X105.738 Y139.009 E.07533
G1 X105.738 Y138.42 E.01896
G1 X103.492 Y140.665 E.10214
G1 X102.903 Y140.665 E.01896
G1 X105.738 Y137.83 E.12895
G1 X105.738 Y137.766 E.00206
G1 X105.213 Y137.766 E.0169
G1 X102.313 Y140.665 E.13186
G1 X101.724 Y140.665 E.01896
G1 X104.623 Y137.766 E.13186
G1 X104.034 Y137.766 E.01896
G1 X101.134 Y140.665 E.13186
G1 X100.545 Y140.665 E.01896
G1 X103.444 Y137.766 E.13186
G1 X102.855 Y137.766 E.01896
G1 X99.955 Y140.665 E.13186
G1 X99.366 Y140.665 E.01896
G1 X102.265 Y137.766 E.13186
G1 X101.675 Y137.766 E.01896
G1 X98.776 Y140.665 E.13186
G1 X98.186 Y140.665 E.01896
G1 X101.086 Y137.766 E.13186
G1 X100.496 Y137.766 E.01896
G1 X97.597 Y140.665 E.13186
G1 X97.007 Y140.665 E.01896
G1 X99.907 Y137.766 E.13186
G1 X99.317 Y137.766 E.01896
G1 X96.418 Y140.665 E.13186
G1 X95.828 Y140.665 E.01896
G1 X98.728 Y137.766 E.13186
G1 X98.138 Y137.766 E.01896
G1 X95.239 Y140.665 E.13186
G1 X94.649 Y140.665 E.01896
G1 X97.549 Y137.766 E.13186
G1 X96.959 Y137.766 E.01896
G1 X94.06 Y140.665 E.13186
G1 X93.47 Y140.665 E.01896
G1 X96.37 Y137.766 E.13186
G1 X95.78 Y137.766 E.01896
G1 X92.881 Y140.665 E.13186
G1 X92.291 Y140.665 E.01896
G1 X95.191 Y137.766 E.13186
G1 X94.601 Y137.766 E.01896
G1 X91.701 Y140.665 E.13186
G1 X91.112 Y140.665 E.01896
G1 X94.011 Y137.766 E.13186
G1 X93.422 Y137.766 E.01896
G1 X90.522 Y140.665 E.13186
G1 X89.933 Y140.665 E.01896
G1 X92.832 Y137.766 E.13186
G1 X92.243 Y137.766 E.01896
G1 X89.343 Y140.665 E.13186
G1 X88.754 Y140.665 E.01896
G1 X91.653 Y137.766 E.13186
G1 X91.064 Y137.766 E.01896
G1 X88.164 Y140.665 E.13186
G1 X87.639 Y140.665 E.0169
G1 X87.639 Y140.601 E.00206
G1 X90.474 Y137.766 E.12895
G1 X89.885 Y137.766 E.01896
G1 X87.639 Y140.012 E.10214
G1 X87.639 Y139.422 E.01896
G1 X89.295 Y137.766 E.07533
G1 X88.706 Y137.766 E.01896
G1 X87.639 Y138.833 E.04852
G1 X87.639 Y138.243 E.01896
G1 X88.299 Y137.583 E.03004
; WIPE_START
G1 X87.639 Y138.243 E-.35494
G1 X87.639 Y138.833 E-.22403
G1 X87.976 Y138.496 E-.18103
; WIPE_END
G1 E-.04 F1800
G1 X91.245 Y131.599 Z2.1 F15000
G1 X99.415 Y114.366 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X100.127 Y115.598 E.04577
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X96.075 Y113.231 E.02818
G1 X96.688 Y113.1 E.02016
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.385 Y114.314 E.00065
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X96.157 Y113.614 E.02362
G1 X96.688 Y113.501 E.01619
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52886
G1 X99.809 Y116.327 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X95.268 Y110.193 Z2.1 F15000
G1 X87.291 Y99.418 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.285 Y99.583 Z2.1 F15000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y100.229 E.02941
G1 X87.639 Y100.81 E.01866
G1 X88.683 Y99.766 E.04747
G1 X89.263 Y99.766 E.01866
G1 X87.639 Y101.39 E.07386
G1 X87.639 Y101.97 E.01866
G1 X89.843 Y99.766 E.10025
G1 X90.424 Y99.766 E.01866
G1 X87.639 Y102.551 E.12665
G1 X87.639 Y103.131 E.01866
G1 X91.004 Y99.766 E.15304
G1 X91.584 Y99.766 E.01866
G1 X87.639 Y103.712 E.17943
G1 X87.639 Y104.292 E.01866
G1 X92.165 Y99.766 E.20582
G1 X92.745 Y99.766 E.01866
G1 X87.639 Y104.872 E.23222
G1 X87.639 Y105.453 E.01866
G1 X93.325 Y99.766 E.25861
G1 X93.906 Y99.766 E.01866
G1 X87.639 Y106.033 E.285
G1 X87.639 Y106.613 E.01866
G1 X94.486 Y99.766 E.31139
G1 X95.067 Y99.766 E.01866
G1 X87.639 Y107.194 E.33779
G1 X87.639 Y107.774 E.01866
G1 X95.647 Y99.766 E.36418
G1 X96.227 Y99.766 E.01866
G1 X87.639 Y108.354 E.39057
G1 X87.639 Y108.935 E.01866
G1 X96.808 Y99.766 E.41697
G1 X97.388 Y99.766 E.01866
G1 X87.639 Y109.515 E.44336
G1 X87.639 Y110.096 E.01866
G1 X97.968 Y99.766 E.46975
G1 X98.549 Y99.766 E.01866
G1 X87.639 Y110.676 E.49614
G1 X87.639 Y111.256 E.01866
G1 X99.129 Y99.766 E.52254
G1 X99.709 Y99.766 E.01866
G1 X87.639 Y111.837 E.54893
G1 X87.639 Y112.417 E.01866
G1 X100.29 Y99.766 E.57532
G1 X100.87 Y99.766 E.01866
G1 X87.639 Y112.997 E.60171
G1 X87.639 Y113.578 E.01866
G1 X101.451 Y99.766 E.62811
G1 X102.031 Y99.766 E.01866
G1 X87.639 Y114.158 E.6545
G1 X87.639 Y114.738 E.01866
G1 X102.611 Y99.766 E.68089
G1 X103.192 Y99.766 E.01866
G1 X87.639 Y115.319 E.70728
G1 X87.639 Y115.899 E.01866
G1 X103.772 Y99.766 E.73368
G1 X104.352 Y99.766 E.01866
G1 X87.639 Y116.48 E.76007
G1 X87.639 Y117.06 E.01866
G1 X104.933 Y99.766 E.78646
G1 X105.513 Y99.766 E.01866
G1 X87.639 Y117.64 E.81286
G1 X87.639 Y118.221 E.01866
G1 X105.738 Y100.121 E.82309
G1 X105.738 Y100.701 E.01866
G1 X87.639 Y118.801 E.82309
G1 X87.639 Y119.381 E.01866
G1 X105.738 Y101.282 E.82309
G1 X105.738 Y101.862 E.01866
G1 X87.456 Y120.145 E.83142
; WIPE_START
G1 X88.87 Y118.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.008 Y126.314 Z2.1 F15000
G1 X87.456 Y131.172 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F7800
G1 X98.439 Y120.189 E.49947
G1 X97.447 Y120.6 E.03453
G1 X87.639 Y130.408 E.44603
G1 X87.639 Y129.828 E.01866
G1 X96.866 Y120.6 E.41963
G1 X96.286 Y120.6 E.01866
G1 X87.639 Y129.248 E.39324
G1 X87.639 Y128.667 E.01866
G1 X95.754 Y120.552 E.36905
G1 X95.352 Y120.373 E.01414
G1 X87.639 Y128.087 E.35079
G1 X87.639 Y127.506 E.01866
G1 X94.951 Y120.194 E.33253
G1 X94.549 Y120.016 E.01414
G1 X87.639 Y126.926 E.31426
G1 X87.639 Y126.346 E.01866
G1 X94.213 Y119.772 E.29896
G1 X93.938 Y119.466 E.01321
G1 X87.639 Y125.765 E.28646
G1 X87.639 Y125.185 E.01866
G1 X93.663 Y119.161 E.27395
G1 X93.388 Y118.856 E.01321
G1 X87.639 Y124.605 E.26145
G1 X87.639 Y124.024 E.01866
G1 X93.179 Y118.484 E.25193
G1 X93.036 Y118.046 E.01481
G1 X87.639 Y123.444 E.24546
G1 X87.639 Y122.864 E.01866
G1 X92.894 Y117.608 E.23899
G1 X92.752 Y117.17 E.01481
G1 X87.639 Y122.283 E.23251
G1 X87.639 Y121.703 E.01866
G1 X92.801 Y116.541 E.23475
G1 X92.869 Y115.892 E.02097
G1 X87.639 Y121.122 E.23785
G1 X87.639 Y120.542 E.01866
G1 X93.211 Y114.97 E.25339
G1 X93.737 Y114.058 E.03386
G1 X95.099 Y113.082 E.05387
G1 X105.738 Y102.443 E.48385
G1 X105.738 Y103.023 E.01866
G1 X95.836 Y112.926 E.45033
G1 X96.573 Y112.769 E.02423
G1 X105.738 Y103.603 E.41681
G1 X105.738 Y104.184 E.01866
G1 X97.092 Y112.83 E.3932
G1 X97.571 Y112.932 E.01573
G1 X105.738 Y104.764 E.37143
G1 X105.738 Y105.344 E.01866
G1 X98.049 Y113.033 E.34967
G3 X98.461 Y113.202 I.017 J.547 E.01474
G1 X105.738 Y105.925 E.33093
G1 X105.738 Y106.505 E.01866
G1 X98.797 Y113.446 E.31565
G1 X99.133 Y113.69 E.01336
G1 X105.738 Y107.085 E.30036
G1 X105.738 Y107.666 E.01866
G1 X99.47 Y113.935 E.28507
G3 X99.745 Y114.24 I-.205 J.462 E.01361
G1 X105.738 Y108.246 E.27256
G1 X105.738 Y108.827 E.01866
G1 X99.957 Y114.608 E.2629
M73 P59 R17
G1 X100.17 Y114.976 E.01366
G1 X105.738 Y109.407 E.25324
G1 X105.738 Y109.987 E.01866
G1 X100.382 Y115.344 E.24358
G3 X100.499 Y115.807 I-.462 J.363 E.01582
G1 X105.738 Y110.568 E.23826
G1 X105.738 Y111.148 E.01866
G1 X100.554 Y116.332 E.23575
G1 X100.609 Y116.857 E.01698
G1 X105.738 Y111.728 E.23324
G1 X105.738 Y112.309 E.01866
G1 X100.504 Y117.543 E.23802
G1 X100.225 Y118.402 E.02907
G1 X105.738 Y112.889 E.25072
G1 X105.738 Y113.47 E.01866
G1 X87.639 Y131.569 E.82309
G1 X87.639 Y132.149 E.01866
G1 X105.738 Y114.05 E.82309
G1 X105.738 Y114.63 E.01866
G1 X87.639 Y132.73 E.82309
G1 X87.639 Y133.31 E.01866
G1 X105.738 Y115.211 E.82309
G1 X105.738 Y115.791 E.01866
G1 X87.864 Y133.665 E.81286
G1 X88.444 Y133.665 E.01866
G1 X105.738 Y116.371 E.78647
G1 X105.738 Y116.952 E.01866
G1 X89.024 Y133.665 E.76008
G1 X89.605 Y133.665 E.01866
G1 X105.738 Y117.532 E.73368
G1 X105.738 Y118.112 E.01866
G1 X90.185 Y133.665 E.70729
G1 X90.766 Y133.665 E.01866
G1 X105.738 Y118.693 E.6809
G1 X105.738 Y119.273 E.01866
G1 X91.346 Y133.665 E.6545
G1 X91.926 Y133.665 E.01866
G1 X105.738 Y119.854 E.62811
G1 X105.738 Y120.434 E.01866
G1 X92.507 Y133.665 E.60172
G1 X93.087 Y133.665 E.01866
G1 X105.738 Y121.014 E.57533
G1 X105.738 Y121.595 E.01866
G1 X93.667 Y133.665 E.54893
G1 X94.248 Y133.665 E.01866
G1 X105.738 Y122.175 E.52254
G1 X105.738 Y122.755 E.01866
G1 X94.828 Y133.665 E.49615
G1 X95.408 Y133.665 E.01866
G1 X105.738 Y123.336 E.46976
G1 X105.738 Y123.916 E.01866
G1 X95.989 Y133.665 E.44336
G1 X96.569 Y133.665 E.01866
G1 X105.738 Y124.496 E.41697
G1 X105.738 Y125.077 E.01866
G1 X97.15 Y133.665 E.39058
G1 X97.73 Y133.665 E.01866
G1 X105.738 Y125.657 E.36419
G1 X105.738 Y126.238 E.01866
G1 X98.31 Y133.665 E.33779
G1 X98.891 Y133.665 E.01866
G1 X105.738 Y126.818 E.3114
G1 X105.738 Y127.398 E.01866
G1 X99.471 Y133.665 E.28501
G1 X100.051 Y133.665 E.01866
G1 X105.738 Y127.979 E.25861
G1 X105.738 Y128.559 E.01866
G1 X100.632 Y133.665 E.23222
G1 X101.212 Y133.665 E.01866
G1 X105.738 Y129.139 E.20583
G1 X105.738 Y129.72 E.01866
G1 X101.793 Y133.665 E.17944
G1 X102.373 Y133.665 E.01866
G1 X105.738 Y130.3 E.15304
G1 X105.738 Y130.88 E.01866
G1 X102.953 Y133.665 E.12665
G1 X103.534 Y133.665 E.01866
G1 X105.738 Y131.461 E.10026
G1 X105.738 Y132.041 E.01866
G1 X104.114 Y133.665 E.07387
G1 X104.694 Y133.665 E.01866
G1 X105.738 Y132.622 E.04747
G1 X105.738 Y133.202 E.01866
G1 X105.092 Y133.849 E.02941
; WIPE_START
G1 X105.738 Y133.202 E-.34756
G1 X105.738 Y132.622 E-.22054
G1 X105.381 Y132.979 E-.1919
; WIPE_END
G1 E-.04 F1800
G1 X102.026 Y126.123 Z2.1 F15000
G1 X87.291 Y96.014 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.299 Y92.583 Z2.1 F15000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y93.243 E.03004
G1 X87.639 Y93.833 E.01896
G1 X88.706 Y92.766 E.04852
G1 X89.295 Y92.766 E.01896
G1 X87.639 Y94.422 E.07533
G1 X87.639 Y95.012 E.01896
G1 X89.885 Y92.766 E.10214
G1 X90.474 Y92.766 E.01896
G1 X87.639 Y95.601 E.12895
G1 X87.639 Y95.665 E.00206
G1 X88.164 Y95.665 E.0169
G1 X91.064 Y92.766 E.13186
G1 X91.653 Y92.766 E.01896
G1 X88.754 Y95.665 E.13186
G1 X89.343 Y95.665 E.01896
G1 X92.243 Y92.766 E.13186
G1 X92.832 Y92.766 E.01896
G1 X89.933 Y95.665 E.13186
G1 X90.522 Y95.665 E.01896
G1 X93.422 Y92.766 E.13186
G1 X94.011 Y92.766 E.01896
G1 X91.112 Y95.665 E.13186
G1 X91.701 Y95.665 E.01896
G1 X94.601 Y92.766 E.13186
G1 X95.191 Y92.766 E.01896
G1 X92.291 Y95.665 E.13186
G1 X92.881 Y95.665 E.01896
G1 X95.78 Y92.766 E.13186
G1 X96.37 Y92.766 E.01896
G1 X93.47 Y95.665 E.13186
G1 X94.06 Y95.665 E.01896
G1 X96.959 Y92.766 E.13186
G1 X97.549 Y92.766 E.01896
G1 X94.649 Y95.665 E.13186
G1 X95.239 Y95.665 E.01896
G1 X98.138 Y92.766 E.13186
G1 X98.728 Y92.766 E.01896
G1 X95.828 Y95.665 E.13186
G1 X96.418 Y95.665 E.01896
G1 X99.317 Y92.766 E.13186
G1 X99.907 Y92.766 E.01896
G1 X97.007 Y95.665 E.13186
G1 X97.597 Y95.665 E.01896
G1 X100.496 Y92.766 E.13186
G1 X101.086 Y92.766 E.01896
G1 X98.186 Y95.665 E.13186
G1 X98.776 Y95.665 E.01896
G1 X101.676 Y92.766 E.13186
G1 X102.265 Y92.766 E.01896
G1 X99.366 Y95.665 E.13186
G1 X99.955 Y95.665 E.01896
G1 X102.855 Y92.766 E.13186
G1 X103.444 Y92.766 E.01896
G1 X100.545 Y95.665 E.13186
G1 X101.134 Y95.665 E.01896
G1 X104.034 Y92.766 E.13186
G1 X104.623 Y92.766 E.01896
G1 X101.724 Y95.665 E.13186
G1 X102.313 Y95.665 E.01896
G1 X105.213 Y92.766 E.13186
G1 X105.738 Y92.766 E.0169
G1 X105.738 Y92.83 E.00206
G1 X102.903 Y95.665 E.12895
G1 X103.492 Y95.665 E.01896
G1 X105.738 Y93.42 E.10214
G1 X105.738 Y94.009 E.01896
G1 X104.082 Y95.665 E.07533
G1 X104.671 Y95.665 E.01896
G1 X105.738 Y94.599 E.04852
G1 X105.738 Y95.188 E.01896
G1 X105.078 Y95.849 E.03004
; WIPE_START
G1 X105.738 Y95.188 E-.35495
G1 X105.738 Y94.599 E-.22403
G1 X105.401 Y94.935 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X102.515 Y87.87 Z2.1 F15000
G1 X97.36 Y75.252 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X95.937 Y75.252 E.04577
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X96.075 Y68.231 E.02818
G1 X96.688 Y68.1 E.02016
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04834
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.42 Y75.252 E.00065
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X96.157 Y68.614 E.02362
G1 X96.688 Y68.501 E.01619
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X91.697 Y81.25 Z2.1 F15000
G1 X87.291 Y89.014 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.255 Y79.779 Z2.1 F15000
G1 X87.456 Y74.696 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y56.414 E.83142
G1 X105.738 Y55.836 E.01859
G1 X87.639 Y73.935 E.82309
G1 X87.639 Y73.357 E.01859
G1 X105.738 Y55.258 E.82309
G1 X105.738 Y54.68 E.01859
G1 X87.639 Y72.779 E.82309
G1 X87.639 Y72.201 E.01859
G1 X105.738 Y54.102 E.82309
G1 X105.738 Y53.524 E.01859
G1 X87.639 Y71.623 E.82309
G1 X87.639 Y71.045 E.01859
G1 X105.738 Y52.945 E.82309
G1 X105.738 Y52.666 E.00899
G1 X105.44 Y52.666 E.0096
G1 X87.639 Y70.467 E.80952
G1 X87.639 Y69.889 E.01859
G1 X104.862 Y52.666 E.78324
G1 X104.284 Y52.666 E.01859
G1 X87.639 Y69.311 E.75695
G1 X87.639 Y68.733 E.01859
G1 X103.706 Y52.666 E.73066
G1 X103.128 Y52.666 E.01859
G1 X87.639 Y68.155 E.70438
G1 X87.639 Y67.577 E.01859
G1 X102.55 Y52.666 E.67809
G1 X101.972 Y52.666 E.01859
G1 X87.639 Y66.999 E.6518
G1 X87.639 Y66.421 E.01859
G1 X101.394 Y52.666 E.62552
G1 X100.816 Y52.666 E.01859
G1 X87.639 Y65.843 E.59923
G1 X87.639 Y65.265 E.01859
G1 X100.238 Y52.666 E.57294
G1 X99.659 Y52.666 E.01859
G1 X87.639 Y64.687 E.54666
G1 X87.639 Y64.109 E.01859
G1 X99.081 Y52.666 E.52037
G1 X98.503 Y52.666 E.01859
G1 X87.639 Y63.531 E.49408
G1 X87.639 Y62.953 E.01859
G1 X97.925 Y52.666 E.4678
G1 X97.347 Y52.666 E.01859
G1 X87.639 Y62.375 E.44151
G1 X87.639 Y61.797 E.01859
G1 X96.769 Y52.666 E.41522
G1 X96.191 Y52.666 E.01859
G1 X87.639 Y61.219 E.38894
G1 X87.639 Y60.64 E.01859
G1 X95.613 Y52.666 E.36265
G1 X95.035 Y52.666 E.01859
G1 X87.639 Y60.062 E.33636
G1 X87.639 Y59.484 E.01859
G1 X94.457 Y52.666 E.31008
G1 X93.879 Y52.666 E.01859
M73 P59 R16
G1 X87.639 Y58.906 E.28379
G1 X87.639 Y58.328 E.01859
G1 X93.301 Y52.666 E.2575
G1 X92.723 Y52.666 E.01859
G1 X87.639 Y57.75 E.23122
G1 X87.639 Y57.172 E.01859
G1 X92.145 Y52.666 E.20493
G1 X91.567 Y52.666 E.01859
G1 X87.639 Y56.594 E.17865
G1 X87.639 Y56.016 E.01859
G1 X90.989 Y52.666 E.15236
G1 X90.411 Y52.666 E.01859
G1 X87.639 Y55.438 E.12607
G1 X87.639 Y54.86 E.01859
G1 X89.833 Y52.666 E.09979
G1 X89.255 Y52.666 E.01859
G1 X87.639 Y54.282 E.0735
G1 X87.639 Y53.704 E.01859
G1 X88.677 Y52.666 E.04721
G1 X88.099 Y52.666 E.01859
G1 X87.456 Y53.309 E.02926
; WIPE_START
G1 X88.099 Y52.666 E-.34573
G1 X88.677 Y52.666 E-.21966
G1 X88.315 Y53.028 E-.19461
; WIPE_END
G1 E-.04 F1800
G1 X94.258 Y57.816 Z2.1 F15000
G1 X105.921 Y67.213 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F7800
G1 X100.462 Y72.672 E.24826
G1 X100.638 Y72.131 E.01831
G1 X100.618 Y71.939 E.00622
G1 X105.738 Y66.818 E.23285
G1 X105.738 Y66.24 E.01859
G1 X100.563 Y71.415 E.23535
G1 X100.508 Y70.892 E.01691
G1 X105.738 Y65.662 E.23785
G1 X105.738 Y65.084 E.01859
G1 X100.417 Y70.405 E.24197
G1 X100.206 Y70.039 E.01361
G1 X105.738 Y64.506 E.25159
G1 X105.738 Y63.928 E.01859
G1 X99.994 Y69.672 E.26121
G1 X99.783 Y69.306 E.01361
G1 X105.738 Y63.35 E.27084
G1 X105.738 Y62.772 E.01859
G1 X99.531 Y68.979 E.28228
G1 X99.196 Y68.736 E.01331
G1 X105.738 Y62.194 E.2975
G1 X105.738 Y61.616 E.01859
G1 X98.861 Y68.493 E.31273
G1 X98.527 Y68.25 E.01331
G1 X105.738 Y61.038 E.32795
G1 X105.738 Y60.46 E.01859
G1 X98.144 Y68.054 E.34534
G1 X97.668 Y67.952 E.01567
G1 X105.738 Y59.882 E.36701
G1 X105.738 Y59.304 E.01859
G1 X97.191 Y67.851 E.38869
G1 X96.714 Y67.75 E.01567
G1 X105.738 Y58.726 E.41037
G1 X105.738 Y58.148 E.01859
G1 X95.994 Y67.892 E.44312
G1 X95.26 Y68.048 E.02413
G1 X105.738 Y57.57 E.4765
G1 X105.738 Y56.992 E.01859
G1 X87.639 Y75.091 E.82309
G1 X87.639 Y75.669 E.01859
G1 X93.037 Y70.271 E.24549
G2 X92.854 Y71.032 I.763 J.585 E.0259
G1 X87.639 Y76.247 E.23718
G1 X87.639 Y76.825 E.01859
G1 X92.786 Y71.678 E.2341
G2 X92.781 Y72.261 I.653 J.298 E.01932
G1 X87.639 Y77.403 E.23385
G1 X87.639 Y77.981 E.01859
G1 X92.923 Y72.697 E.2403
G1 X93.065 Y73.134 E.01475
G1 X87.639 Y78.559 E.24675
G1 X87.639 Y79.137 E.01859
G1 X93.206 Y73.57 E.25319
G2 X93.44 Y73.914 I.503 J-.091 E.01378
G1 X87.639 Y79.716 E.26384
G1 X87.639 Y80.294 E.01859
G1 X93.714 Y74.218 E.27629
G1 X93.988 Y74.522 E.01316
G1 X87.639 Y80.872 E.28874
G1 X87.639 Y81.45 E.01859
G1 X94.262 Y74.826 E.3012
G2 X94.62 Y75.047 I.426 J-.291 E.01391
G1 X87.639 Y82.028 E.31746
G1 X87.639 Y82.606 E.01859
G1 X95.019 Y75.225 E.33565
G1 X95.419 Y75.403 E.01408
G1 X87.639 Y83.184 E.35384
G1 X87.639 Y83.762 E.01859
G1 X95.819 Y75.581 E.37202
G1 X96.378 Y75.6 E.01798
G1 X87.639 Y84.34 E.39743
G1 X87.639 Y84.918 E.01859
G1 X96.956 Y75.6 E.42372
G1 X97.55 Y75.584 E.01911
G1 X87.639 Y85.496 E.45073
G1 X87.639 Y86.074 E.01859
G1 X105.738 Y67.974 E.82309
G1 X105.738 Y68.552 E.01859
G1 X87.639 Y86.652 E.82309
G1 X87.639 Y87.23 E.01859
G1 X105.738 Y69.13 E.82309
G1 X105.738 Y69.708 E.01859
G1 X87.639 Y87.808 E.82309
G1 X87.639 Y88.386 E.01859
G1 X105.738 Y70.286 E.82309
G1 X105.738 Y70.864 E.01859
G1 X87.937 Y88.665 E.80952
G1 X88.515 Y88.665 E.01859
G1 X105.738 Y71.442 E.78323
G1 X105.738 Y72.021 E.01859
G1 X89.093 Y88.665 E.75694
G1 X89.671 Y88.665 E.01859
G1 X105.738 Y72.599 E.73066
G1 X105.738 Y73.177 E.01859
G1 X90.249 Y88.665 E.70437
G1 X90.827 Y88.665 E.01859
G1 X105.738 Y73.755 E.67808
M73 P60 R16
G1 X105.738 Y74.333 E.01859
G1 X91.405 Y88.665 E.6518
G1 X91.983 Y88.665 E.01859
G1 X105.738 Y74.911 E.62551
G1 X105.738 Y75.489 E.01859
G1 X92.562 Y88.665 E.59923
G1 X93.14 Y88.665 E.01859
G1 X105.738 Y76.067 E.57294
G1 X105.738 Y76.645 E.01859
G1 X93.718 Y88.665 E.54665
G1 X94.296 Y88.665 E.01859
G1 X105.738 Y77.223 E.52037
G1 X105.738 Y77.801 E.01859
G1 X94.874 Y88.665 E.49408
G1 X95.452 Y88.665 E.01859
G1 X105.738 Y78.379 E.46779
G1 X105.738 Y78.957 E.01859
G1 X96.03 Y88.665 E.44151
G1 X96.608 Y88.665 E.01859
G1 X105.738 Y79.535 E.41522
G1 X105.738 Y80.113 E.01859
G1 X97.186 Y88.665 E.38893
G1 X97.764 Y88.665 E.01859
G1 X105.738 Y80.691 E.36265
G1 X105.738 Y81.269 E.01859
G1 X98.342 Y88.665 E.33636
G1 X98.92 Y88.665 E.01859
G1 X105.738 Y81.847 E.31007
G1 X105.738 Y82.425 E.01859
G1 X99.498 Y88.665 E.28379
G1 X100.076 Y88.665 E.01859
G1 X105.738 Y83.003 E.2575
G1 X105.738 Y83.581 E.01859
G1 X100.654 Y88.665 E.23121
G1 X101.232 Y88.665 E.01859
G1 X105.738 Y84.159 E.20493
G1 X105.738 Y84.737 E.01859
G1 X101.81 Y88.665 E.17864
G1 X102.388 Y88.665 E.01859
G1 X105.738 Y85.315 E.15235
G1 X105.738 Y85.893 E.01859
G1 X102.966 Y88.665 E.12607
G1 X103.544 Y88.665 E.01859
G1 X105.738 Y86.471 E.09978
G1 X105.738 Y87.049 E.01859
G1 X104.122 Y88.665 E.07349
G1 X104.7 Y88.665 E.01859
G1 X105.738 Y87.627 E.04721
G1 X105.738 Y88.205 E.01859
G1 X105.095 Y88.849 E.02925
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X105.738 Y88.205 E-.34567
G1 X105.738 Y87.627 E-.21965
G1 X105.376 Y87.99 E-.19468
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 9/20
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2.1 I1.217 J0 P1  F15000
; object ids of layer 9 start: 138,178
M624 AwAAAAAAAAA=
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
; object ids of this layer9 end: 138,178
M625
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X199.995 Y66.256
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X162.791 Y66.256 E1.19635
G1 X162.791 Y91.256 E.80391
G1 X161.995 Y91.256 E.02559
G1 X161.995 Y66.256 E.80391
G1 X155.791 Y66.256 E.1995
G1 X155.791 Y90.78 E.78861
G1 X154.995 Y90.78 E.02559
G1 X154.995 Y65.46 E.8142
G1 X207.791 Y65.46 E1.69772
G1 X207.791 Y90.78 E.8142
G1 X206.995 Y90.78 E.02559
G1 X206.995 Y66.256 E.78861
G1 X200.791 Y66.256 E.1995
G1 X200.791 Y91.256 E.80391
G1 X199.995 Y91.256 E.02559
G1 X199.995 Y66.316 E.80198
M204 S250
G1 X199.603 Y66.648 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X163.183 Y66.648 E1.08483
G1 X163.183 Y91.648 E.74466
G1 X161.603 Y91.648 E.04706
G1 X161.603 Y66.648 E.74466
G1 X156.183 Y66.648 E.16144
G1 X156.183 Y108.75 E1.25409
G1 X154.603 Y108.75 E.04706
G1 X154.603 Y65.068 E1.30115
G1 X208.183 Y65.068 E1.59597
G1 X208.183 Y108.75 E1.30115
G1 X206.603 Y108.75 E.04706
G1 X206.603 Y66.648 E1.25409
G1 X201.183 Y66.648 E.16144
G1 X201.183 Y91.648 E.74466
G1 X199.603 Y91.648 E.04706
G1 X199.603 Y66.708 E.74288
; WIPE_START
M204 S5000
G1 X197.603 Y66.704 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.393 Y66.052 Z2.3 F15000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.490218
G1 F7500
G1 X200.393 Y65.906 E.00515
G1 X200.491 Y65.882 E.00354
; LINE_WIDTH: 0.45602
G1 X200.588 Y65.858 E.00327
; LINE_WIDTH: 0.43172
G1 X207.199 Y65.858 E.20305
; LINE_WIDTH: 0.470635
G1 X207.36 Y65.891 E.00556
G1 X207.377 Y65.972 E.00278
; LINE_WIDTH: 0.448395
G1 X207.393 Y66.052 E.00263
; LINE_WIDTH: 0.43172
G1 X207.393 Y90.576 E.7532
; WIPE_START
G1 X207.393 Y88.576 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.976 Y91.682 Z2.3 F15000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X207.297 Y91.002 E.02861
G1 X206.811 Y91.05
G1 X207.976 Y92.215 E.04908
G1 X207.976 Y92.748
G1 X206.811 Y91.583 E.04908
G1 X206.811 Y92.116
G1 X207.976 Y93.282 E.04908
G1 X207.976 Y93.815
G1 X206.811 Y92.65 E.04908
G1 X206.811 Y93.183
G1 X207.976 Y94.348 E.04908
G1 X207.976 Y94.881
G1 X206.811 Y93.716 E.04908
G1 X206.811 Y94.249
G1 X207.976 Y95.415 E.04908
G1 X207.976 Y95.948
G1 X206.811 Y94.783 E.04908
G1 X206.811 Y95.316
G1 X207.976 Y96.481 E.04908
G1 X207.976 Y97.014
G1 X206.811 Y95.849 E.04908
G1 X206.811 Y96.382
G1 X207.976 Y97.548 E.04908
G1 X207.976 Y98.081
G1 X206.811 Y96.916 E.04908
G1 X206.811 Y97.449
G1 X207.976 Y98.614 E.04908
G1 X207.976 Y99.147
G1 X206.811 Y97.982 E.04908
G1 X206.811 Y98.515
G1 X207.976 Y99.681 E.04908
G1 X207.976 Y100.214
G1 X206.811 Y99.049 E.04908
G1 X206.811 Y99.582
G1 X207.976 Y100.747 E.04908
G1 X207.976 Y101.28
G1 X206.811 Y100.115 E.04908
G1 X206.811 Y100.648
G1 X207.976 Y101.814 E.04908
G1 X207.976 Y102.347
G1 X206.811 Y101.182 E.04908
G1 X206.811 Y101.715
G1 X207.976 Y102.88 E.04908
G1 X207.976 Y103.413
G1 X206.811 Y102.248 E.04908
G1 X206.811 Y102.781
G1 X207.976 Y103.947 E.04908
G1 X207.976 Y104.48
G1 X206.811 Y103.315 E.04908
G1 X206.811 Y103.848
G1 X207.976 Y105.013 E.04908
G1 X207.976 Y105.546
G1 X206.811 Y104.381 E.04908
G1 X206.811 Y104.914
G1 X207.976 Y106.08 E.04908
G1 X207.976 Y106.613
G1 X206.811 Y105.448 E.04908
G1 X206.811 Y105.981
G1 X207.976 Y107.146 E.04908
G1 X207.976 Y107.679
G1 X206.811 Y106.514 E.04908
G1 X206.811 Y107.048
G1 X207.976 Y108.213 E.04908
G1 X207.773 Y108.543
G1 X206.811 Y107.581 E.04052
G1 X206.811 Y108.114
G1 X207.24 Y108.543 E.01806
; WIPE_START
M204 S5000
G1 X206.811 Y108.114 E-.23042
G1 X206.811 Y107.581 E-.20264
G1 X207.419 Y108.189 E-.32695
; WIPE_END
G1 E-.04 F1800
G1 X204.524 Y101.127 Z2.3 F15000
G1 X200.393 Y91.052 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X200.393 Y66.052 E.76781
G1 X200.393 Y65.906 F15000
; LINE_WIDTH: 0.50462
G1 F7500
G1 X200.296 Y65.882 E.00365
; LINE_WIDTH: 0.431785
G1 X200.199 Y65.858 E.00308
G1 X162.588 Y65.858 E1.15532
; LINE_WIDTH: 0.45602
G1 X162.491 Y65.882 E.00327
; LINE_WIDTH: 0.490218
G1 X162.393 Y65.906 E.00354
G1 X162.393 Y66.052 E.00515
; LINE_WIDTH: 0.43172
G1 X162.393 Y91.052 E.76781
; WIPE_START
G1 X162.393 Y89.052 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.571 Y91.002 Z2.3 F15000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X155.976 Y91.408 E.01707
G1 X155.976 Y91.941
G1 X155.037 Y91.002 E.03953
G1 X154.811 Y91.309
G1 X155.976 Y92.474 E.04908
G1 X155.976 Y93.007
G1 X154.811 Y91.842 E.04908
G1 X154.811 Y92.376
G1 X155.976 Y93.541 E.04908
G1 X155.976 Y94.074
G1 X154.811 Y92.909 E.04908
G1 X154.811 Y93.442
G1 X155.976 Y94.607 E.04908
G1 X155.976 Y95.141
G1 X154.811 Y93.975 E.04908
G1 X154.811 Y94.509
G1 X155.976 Y95.674 E.04908
G1 X155.976 Y96.207
G1 X154.811 Y95.042 E.04908
G1 X154.811 Y95.575
G1 X155.976 Y96.74 E.04908
G1 X155.976 Y97.274
G1 X154.811 Y96.108 E.04908
G1 X154.811 Y96.642
G1 X155.976 Y97.807 E.04908
G1 X155.976 Y98.34
G1 X154.811 Y97.175 E.04908
G1 X154.811 Y97.708
G1 X155.976 Y98.873 E.04908
G1 X155.976 Y99.407
G1 X154.811 Y98.241 E.04908
G1 X154.811 Y98.775
G1 X155.976 Y99.94 E.04908
G1 X155.976 Y100.473
G1 X154.811 Y99.308 E.04908
G1 X154.811 Y99.841
G1 X155.976 Y101.006 E.04908
G1 X155.976 Y101.54
G1 X154.811 Y100.374 E.04908
G1 X154.811 Y100.908
G1 X155.976 Y102.073 E.04908
G1 X155.976 Y102.606
G1 X154.811 Y101.441 E.04908
G1 X154.811 Y101.974
G1 X155.976 Y103.139 E.04908
G1 X155.976 Y103.673
G1 X154.811 Y102.507 E.04908
G1 X154.811 Y103.041
G1 X155.976 Y104.206 E.04908
G1 X155.976 Y104.739
G1 X154.811 Y103.574 E.04908
G1 X154.811 Y104.107
G1 X155.976 Y105.272 E.04908
G1 X155.976 Y105.806
G1 X154.811 Y104.64 E.04908
G1 X154.811 Y105.174
G1 X155.976 Y106.339 E.04908
G1 X155.976 Y106.872
G1 X154.811 Y105.707 E.04908
G1 X154.811 Y106.24
G1 X155.976 Y107.405 E.04908
G1 X155.976 Y107.939
G1 X154.811 Y106.773 E.04908
G1 X154.811 Y107.307
G1 X155.976 Y108.472 E.04908
G1 X155.514 Y108.543
G1 X154.811 Y107.84 E.0296
; WIPE_START
M204 S5000
G1 X155.514 Y108.543 E-.37768
G1 X155.976 Y108.472 E-.17778
G1 X155.595 Y108.091 E-.20454
; WIPE_END
G1 E-.04 F1800
G1 X155.507 Y100.459 Z2.3 F15000
G1 X155.393 Y90.576 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.393 Y66.052 E.7532
; LINE_WIDTH: 0.470635
G1 X155.427 Y65.891 E.00556
G1 X155.507 Y65.874 E.00278
; LINE_WIDTH: 0.448395
G1 X155.588 Y65.858 E.00263
; LINE_WIDTH: 0.432083
G1 X162.199 Y65.858 E.20324
G1 X162.296 Y65.882 E.00308
; LINE_WIDTH: 0.50462
G1 X162.393 Y65.906 E.00365
; OBJECT_ID: 178
; WIPE_START
G1 X162.296 Y65.882 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X158.17 Y72.303 Z2.3 F15000
G1 X98.868 Y164.581 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.814 Y164.641 E.00259
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04835
G1 X96.014 Y158.243 E.02618
G1 X96.688 Y158.1 E.02217
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04835
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.908 Y164.536 E.04382
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.299 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X96.096 Y158.627 E.02177
G1 X96.688 Y158.501 E.01805
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X93.544 Y157.933 Z2.3 F15000
G1 X87.291 Y144.418 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.508 Y144.674 Z2.3 F15000
G1 X105.921 Y145.409 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.278 Y144.766 E.02925
G1 X104.7 Y144.766 E.01859
G1 X105.738 Y145.804 E.04721
G1 X105.738 Y146.382 E.01859
G1 X104.122 Y144.766 E.07349
G1 X103.544 Y144.766 E.01859
G1 X105.738 Y146.96 E.09978
G1 X105.738 Y147.538 E.01859
G1 X102.966 Y144.766 E.12607
G1 X102.388 Y144.766 E.01859
G1 X105.738 Y148.116 E.15235
G1 X105.738 Y148.694 E.01859
G1 X101.81 Y144.766 E.17864
G1 X101.232 Y144.766 E.01859
G1 X105.738 Y149.272 E.20493
G1 X105.738 Y149.85 E.01859
G1 X100.654 Y144.766 E.23121
G1 X100.076 Y144.766 E.01859
G1 X105.738 Y150.428 E.2575
G1 X105.738 Y151.006 E.01859
G1 X99.498 Y144.766 E.28379
G1 X98.92 Y144.766 E.01859
G1 X105.738 Y151.584 E.31007
G1 X105.738 Y152.162 E.01859
G1 X98.342 Y144.766 E.33636
G1 X97.764 Y144.766 E.01859
G1 X105.738 Y152.74 E.36265
G1 X105.738 Y153.318 E.01859
G1 X97.186 Y144.766 E.38893
G1 X96.608 Y144.766 E.01859
G1 X105.738 Y153.896 E.41522
G1 X105.738 Y154.474 E.01859
G1 X96.03 Y144.766 E.44151
G1 X95.452 Y144.766 E.01859
G1 X105.738 Y155.052 E.46779
G1 X105.738 Y155.631 E.01859
M73 P61 R16
G1 X94.874 Y144.766 E.49408
G1 X94.296 Y144.766 E.01859
G1 X105.738 Y156.209 E.52037
G1 X105.738 Y156.787 E.01859
G1 X93.718 Y144.766 E.54665
G1 X93.14 Y144.766 E.01859
G1 X105.738 Y157.365 E.57294
G1 X105.738 Y157.943 E.01859
G1 X92.562 Y144.766 E.59923
G1 X91.983 Y144.766 E.01859
G1 X105.738 Y158.521 E.62551
G1 X105.738 Y159.099 E.01859
G1 X91.405 Y144.766 E.6518
G1 X90.827 Y144.766 E.01859
G1 X105.738 Y159.677 E.67808
G1 X105.738 Y160.255 E.01859
G1 X90.249 Y144.766 E.70437
G1 X89.671 Y144.766 E.01859
G1 X105.738 Y160.833 E.73066
G1 X105.738 Y161.411 E.01859
G1 X89.093 Y144.766 E.75694
G1 X88.515 Y144.766 E.01859
G1 X105.738 Y161.989 E.78323
G1 X105.738 Y162.567 E.01859
G1 X87.937 Y144.766 E.80952
G1 X87.639 Y144.766 E.0096
G1 X87.639 Y145.045 E.00899
G1 X105.738 Y163.145 E.82309
G1 X105.738 Y163.723 E.01859
G1 X87.639 Y145.623 E.8231
G1 X87.639 Y146.201 E.01859
G1 X105.738 Y164.301 E.8231
G1 X105.738 Y164.879 E.01859
G1 X87.639 Y146.779 E.8231
G1 X87.639 Y147.358 E.01859
G1 X98.541 Y158.26 E.49581
G1 X98.304 Y158.088 E.00945
G1 X97.652 Y157.949 E.02142
G1 X87.639 Y147.936 E.45538
G1 X87.639 Y148.514 E.01859
G1 X96.918 Y157.793 E.42199
G2 X96.361 Y157.814 I-.255 J.636 E.01847
G1 X87.639 Y149.092 E.39665
G1 X87.639 Y149.67 E.01859
G1 X95.884 Y157.915 E.37497
G1 X95.408 Y158.017 E.01567
G1 X87.639 Y150.248 E.3533
G1 X87.639 Y150.826 E.01859
G1 X94.973 Y158.16 E.33354
G1 X94.638 Y158.403 E.01331
G1 X87.639 Y151.404 E.31832
G1 X87.639 Y151.982 E.01859
G1 X94.304 Y158.647 E.30309
G1 X93.969 Y158.89 E.01331
G1 X87.639 Y152.56 E.28787
G1 X87.639 Y153.138 E.01859
G1 X93.672 Y159.171 E.27437
G1 X93.46 Y159.538 E.01361
G1 X87.639 Y153.716 E.26475
G1 X87.639 Y154.294 E.01859
G1 X93.249 Y159.904 E.25513
G1 X93.037 Y160.27 E.01361
G1 X87.639 Y154.872 E.2455
G1 X87.639 Y155.45 E.01859
G1 X92.889 Y160.7 E.23877
G1 X92.834 Y161.223 E.01691
G1 X87.639 Y156.028 E.23627
G1 X87.639 Y156.606 E.01859
G1 X92.779 Y161.746 E.23377
G2 X92.813 Y162.358 I.703 J.268 E.02028
G1 X87.639 Y157.184 E.23529
G1 X87.639 Y157.762 E.01859
G1 X93.091 Y163.214 E.24794
G1 X93.249 Y163.701 E.01647
G1 X94.354 Y164.929 E.0531
G1 X95.167 Y165.291 E.02863
G1 X105.738 Y175.862 E.48072
G1 X105.738 Y175.284 E.01859
G1 X96.055 Y165.6 E.44035
G1 X96.633 Y165.6 E.01859
G1 X105.738 Y174.706 E.41407
G1 X105.738 Y174.128 E.01859
G1 X97.211 Y165.6 E.38778
G2 X97.704 Y165.516 I.152 J-.596 E.01658
G1 X105.738 Y173.55 E.36535
G1 X105.738 Y172.971 E.01859
G1 X98.104 Y165.338 E.34716
G1 X98.504 Y165.16 E.01408
G1 X105.738 Y172.393 E.32897
G1 X105.738 Y171.815 E.01859
G1 X98.904 Y164.981 E.31078
G2 X99.216 Y164.715 I-.144 J-.483 E.01358
G1 X105.738 Y171.237 E.29663
G1 X105.738 Y170.659 E.01859
G1 X99.489 Y164.41 E.28417
G1 X99.763 Y164.106 E.01316
G1 X105.738 Y170.081 E.27172
G1 X105.738 Y169.503 E.01859
G1 X100.037 Y163.802 E.25926
G2 X100.223 Y163.41 I-.348 J-.405 E.01438
G1 X105.738 Y168.925 E.25083
G1 X105.738 Y168.347 E.01859
G1 X100.364 Y162.973 E.24438
G1 X100.506 Y162.537 E.01475
G1 X105.738 Y167.769 E.23793
G1 X105.738 Y167.191 E.01859
G1 X100.634 Y162.086 E.23214
G1 X100.566 Y161.441 E.02088
G1 X105.738 Y166.613 E.23523
G1 X105.738 Y166.035 E.01859
G1 X100.498 Y160.795 E.23832
G1 X100.466 Y160.488 E.0099
G1 X100.05 Y159.769 E.02671
G1 X105.921 Y165.64 E.267
; WIPE_START
G1 X104.507 Y164.226 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.372 Y171.809 Z2.3 F15000
G1 X105.921 Y176.623 Z2.3
G1 Z1.9
G1 E.8 F1800
G1 F7800
G1 X87.639 Y158.34 E.83143
G1 X87.639 Y158.918 E.01859
G1 X105.738 Y177.018 E.8231
G1 X105.738 Y177.596 E.01859
G1 X87.639 Y159.496 E.8231
G1 X87.639 Y160.074 E.01859
G1 X105.738 Y178.174 E.8231
G1 X105.738 Y178.752 E.01859
G1 X87.639 Y160.652 E.82309
G1 X87.639 Y161.23 E.01859
G1 X105.738 Y179.33 E.8231
G1 X105.738 Y179.908 E.01859
G1 X87.639 Y161.808 E.8231
G1 X87.639 Y162.386 E.01859
G1 X105.738 Y180.486 E.8231
G1 X105.738 Y180.765 E.00899
G1 X105.44 Y180.765 E.0096
G1 X87.639 Y162.964 E.80952
G1 X87.639 Y163.542 E.01859
G1 X104.862 Y180.765 E.78324
G1 X104.284 Y180.765 E.01859
G1 X87.639 Y164.12 E.75695
G1 X87.639 Y164.698 E.01859
G1 X103.706 Y180.765 E.73066
G1 X103.128 Y180.765 E.01859
G1 X87.639 Y165.276 E.70438
G1 X87.639 Y165.855 E.01859
G1 X102.55 Y180.765 E.67809
G1 X101.972 Y180.765 E.01859
G1 X87.639 Y166.433 E.6518
G1 X87.639 Y167.011 E.01859
G1 X101.394 Y180.765 E.62552
G1 X100.816 Y180.765 E.01859
G1 X87.639 Y167.589 E.59923
G1 X87.639 Y168.167 E.01859
G1 X100.238 Y180.765 E.57294
G1 X99.659 Y180.765 E.01859
G1 X87.639 Y168.745 E.54666
G1 X87.639 Y169.323 E.01859
G1 X99.081 Y180.765 E.52037
G1 X98.503 Y180.765 E.01859
G1 X87.639 Y169.901 E.49408
G1 X87.639 Y170.479 E.01859
G1 X97.925 Y180.765 E.4678
G1 X97.347 Y180.765 E.01859
G1 X87.639 Y171.057 E.44151
G1 X87.639 Y171.635 E.01859
G1 X96.769 Y180.765 E.41522
G1 X96.191 Y180.765 E.01859
G1 X87.639 Y172.213 E.38894
G1 X87.639 Y172.791 E.01859
G1 X95.613 Y180.765 E.36265
G1 X95.035 Y180.765 E.01859
G1 X87.639 Y173.369 E.33636
G1 X87.639 Y173.947 E.01859
G1 X94.457 Y180.765 E.31008
G1 X93.879 Y180.765 E.01859
G1 X87.639 Y174.525 E.28379
G1 X87.639 Y175.103 E.01859
G1 X93.301 Y180.765 E.2575
G1 X92.723 Y180.765 E.01859
G1 X87.639 Y175.681 E.23122
G1 X87.639 Y176.259 E.01859
G1 X92.145 Y180.765 E.20493
G1 X91.567 Y180.765 E.01859
G1 X87.639 Y176.837 E.17865
G1 X87.639 Y177.415 E.01859
G1 X90.989 Y180.765 E.15236
G1 X90.411 Y180.765 E.01859
G1 X87.639 Y177.993 E.12607
G1 X87.639 Y178.571 E.01859
G1 X89.833 Y180.765 E.09979
G1 X89.255 Y180.765 E.01859
G1 X87.639 Y179.149 E.0735
G1 X87.639 Y179.727 E.01859
G1 X88.677 Y180.765 E.04721
G1 X88.099 Y180.765 E.01859
G1 X87.456 Y180.122 E.02926
; WIPE_START
G1 X88.099 Y180.765 E-.34573
G1 X88.677 Y180.765 E-.21965
G1 X88.315 Y180.403 E-.19462
; WIPE_END
G1 E-.04 F1800
G1 X91.454 Y173.446 Z2.3 F15000
G1 X106.086 Y141.014 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.921 Y138.426 Z2.3 F15000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.261 Y137.766 E.03004
G1 X104.671 Y137.766 E.01896
G1 X105.738 Y138.833 E.04852
G1 X105.738 Y139.422 E.01896
G1 X104.082 Y137.766 E.07533
G1 X103.492 Y137.766 E.01896
G1 X105.738 Y140.012 E.10214
G1 X105.738 Y140.601 E.01896
G1 X102.903 Y137.766 E.12895
G1 X102.313 Y137.766 E.01896
G1 X105.213 Y140.665 E.13186
G1 X104.623 Y140.665 E.01896
G1 X101.724 Y137.766 E.13186
G1 X101.134 Y137.766 E.01896
G1 X104.034 Y140.665 E.13186
G1 X103.444 Y140.665 E.01896
G1 X100.545 Y137.766 E.13186
G1 X99.955 Y137.766 E.01896
G1 X102.855 Y140.665 E.13186
G1 X102.265 Y140.665 E.01896
G1 X99.366 Y137.766 E.13186
G1 X98.776 Y137.766 E.01896
G1 X101.676 Y140.665 E.13186
G1 X101.086 Y140.665 E.01896
G1 X98.186 Y137.766 E.13186
G1 X97.597 Y137.766 E.01896
G1 X100.496 Y140.665 E.13186
G1 X99.907 Y140.665 E.01896
G1 X97.007 Y137.766 E.13186
G1 X96.418 Y137.766 E.01896
G1 X99.317 Y140.665 E.13186
G1 X98.728 Y140.665 E.01896
G1 X95.828 Y137.766 E.13186
G1 X95.239 Y137.766 E.01896
G1 X98.138 Y140.665 E.13186
G1 X97.549 Y140.665 E.01896
G1 X94.649 Y137.766 E.13186
G1 X94.06 Y137.766 E.01896
G1 X96.959 Y140.665 E.13186
G1 X96.37 Y140.665 E.01896
G1 X93.47 Y137.766 E.13186
G1 X92.881 Y137.766 E.01896
G1 X95.78 Y140.665 E.13186
G1 X95.191 Y140.665 E.01896
G1 X92.291 Y137.766 E.13186
G1 X91.701 Y137.766 E.01896
G1 X94.601 Y140.665 E.13186
G1 X94.011 Y140.665 E.01896
G1 X91.112 Y137.766 E.13186
G1 X90.522 Y137.766 E.01896
G1 X93.422 Y140.665 E.13186
G1 X92.832 Y140.665 E.01896
G1 X89.933 Y137.766 E.13186
G1 X89.343 Y137.766 E.01896
G1 X92.243 Y140.665 E.13186
G1 X91.653 Y140.665 E.01896
G1 X88.754 Y137.766 E.13186
G1 X88.164 Y137.766 E.01896
G1 X91.064 Y140.665 E.13186
G1 X90.474 Y140.665 E.01896
G1 X87.639 Y137.83 E.12895
G1 X87.639 Y138.42 E.01896
G1 X89.885 Y140.665 E.10214
G1 X89.295 Y140.665 E.01896
G1 X87.639 Y139.009 E.07533
G1 X87.639 Y139.599 E.01896
G1 X88.706 Y140.665 E.04852
G1 X88.116 Y140.665 E.01896
G1 X87.456 Y140.005 E.03004
; WIPE_START
G1 X88.116 Y140.665 E-.35495
G1 X88.706 Y140.665 E-.22403
G1 X88.369 Y140.329 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X91.321 Y133.29 Z2.3 F15000
G1 X99.31 Y114.249 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X99.375 Y114.296 E.00259
G1 X100.127 Y115.598 E.04834
G1 X100.284 Y117.094 E.04835
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04835
G1 X94.002 Y114.296 E.04834
G1 X95.218 Y113.413 E.04834
G1 X96.014 Y113.243 E.02618
G1 X96.688 Y113.1 E.02217
G1 X98.159 Y113.413 E.04834
G1 X99.261 Y114.214 E.04382
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.299 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X96.096 Y113.627 E.02177
G1 X96.688 Y113.501 E.01805
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52886
G1 X99.809 Y116.327 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X95.268 Y110.193 Z2.3 F15000
G1 X87.291 Y99.418 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.508 Y99.675 Z2.3 F15000
G1 X105.921 Y100.413 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.275 Y99.766 E.02941
G1 X104.694 Y99.766 E.01866
G1 X105.738 Y100.81 E.04747
G1 X105.738 Y101.39 E.01866
G1 X104.114 Y99.766 E.07387
G1 X103.534 Y99.766 E.01866
G1 X105.738 Y101.971 E.10026
G1 X105.738 Y102.551 E.01866
G1 X102.953 Y99.766 E.12665
G1 X102.373 Y99.766 E.01866
G1 X105.738 Y103.131 E.15304
G1 X105.738 Y103.712 E.01866
G1 X101.793 Y99.766 E.17944
G1 X101.212 Y99.766 E.01866
G1 X105.738 Y104.292 E.20583
G1 X105.738 Y104.872 E.01866
G1 X100.632 Y99.766 E.23222
G1 X100.051 Y99.766 E.01866
G1 X105.738 Y105.453 E.25861
G1 X105.738 Y106.033 E.01866
G1 X99.471 Y99.766 E.28501
G1 X98.891 Y99.766 E.01866
G1 X105.738 Y106.613 E.3114
G1 X105.738 Y107.194 E.01866
G1 X98.31 Y99.766 E.33779
G1 X97.73 Y99.766 E.01866
G1 X105.738 Y107.774 E.36419
G1 X105.738 Y108.355 E.01866
G1 X97.15 Y99.766 E.39058
G1 X96.569 Y99.766 E.01866
G1 X105.738 Y108.935 E.41697
G1 X105.738 Y109.515 E.01866
G1 X95.989 Y99.766 E.44336
G1 X95.408 Y99.766 E.01866
G1 X105.738 Y110.096 E.46976
G1 X105.738 Y110.676 E.01866
G1 X94.828 Y99.766 E.49615
G1 X94.248 Y99.766 E.01866
G1 X105.738 Y111.256 E.52254
G1 X105.738 Y111.837 E.01866
G1 X93.667 Y99.766 E.54893
G1 X93.087 Y99.766 E.01866
G1 X105.738 Y112.417 E.57533
M73 P62 R16
G1 X105.738 Y112.997 E.01866
G1 X92.507 Y99.766 E.60172
G1 X91.926 Y99.766 E.01866
G1 X105.738 Y113.578 E.62811
G1 X105.738 Y114.158 E.01866
G1 X91.346 Y99.766 E.6545
G1 X90.766 Y99.766 E.01866
G1 X105.738 Y114.739 E.6809
G1 X105.738 Y115.319 E.01866
G1 X90.185 Y99.766 E.70729
G1 X89.605 Y99.766 E.01866
G1 X105.738 Y115.899 E.73368
G1 X105.738 Y116.48 E.01866
G1 X89.024 Y99.766 E.76007
G1 X88.444 Y99.766 E.01866
G1 X105.738 Y117.06 E.78647
G1 X105.738 Y117.64 E.01866
G1 X87.864 Y99.766 E.81286
G1 X87.639 Y99.766 E.00724
G1 X87.639 Y100.121 E.01143
G1 X105.738 Y118.221 E.8231
G1 X105.738 Y118.801 E.01866
G1 X87.639 Y100.702 E.8231
G1 X87.639 Y101.282 E.01866
G1 X105.738 Y119.382 E.8231
G1 X105.738 Y119.962 E.01866
G1 X87.639 Y101.862 E.8231
G1 X87.639 Y102.443 E.01866
G1 X98.278 Y113.082 E.48384
G1 X97.541 Y112.925 E.02423
G1 X87.639 Y103.023 E.45032
G1 X87.639 Y103.603 E.01866
M73 P62 R15
G1 X96.804 Y112.769 E.41681
G2 X96.285 Y112.83 I-.191 J.614 E.01731
G1 X87.639 Y104.184 E.3932
G1 X87.639 Y104.764 E.01866
G1 X95.806 Y112.932 E.37143
G1 X95.328 Y113.033 E.01573
G1 X87.639 Y105.345 E.34966
G1 X87.639 Y105.925 E.01866
G1 X94.916 Y113.202 E.33093
G1 X94.58 Y113.446 E.01336
G1 X87.639 Y106.505 E.31565
G1 X87.639 Y107.086 E.01866
G1 X94.243 Y113.69 E.30036
G1 X93.907 Y113.935 E.01336
G1 X87.639 Y107.666 E.28507
G1 X87.639 Y108.246 E.01866
G1 X93.632 Y114.24 E.27256
G1 X93.42 Y114.608 E.01366
G1 X87.639 Y108.827 E.2629
G1 X87.639 Y109.407 E.01866
G1 X93.207 Y114.976 E.25324
G1 X92.995 Y115.344 E.01366
G1 X87.639 Y109.987 E.24358
G1 X87.639 Y110.568 E.01866
G1 X92.878 Y115.807 E.23826
G1 X92.823 Y116.332 E.01698
G1 X87.639 Y111.148 E.23575
G1 X87.639 Y111.729 E.01866
G1 X92.768 Y116.857 E.23324
G2 X92.873 Y117.543 I.822 J.225 E.02297
G1 X87.639 Y112.309 E.23802
G1 X87.639 Y112.889 E.01866
G1 X93.152 Y118.403 E.25072
G1 X93.249 Y118.701 E.0101
G1 X94.354 Y119.929 E.0531
G1 X94.938 Y120.189 E.02056
G1 X105.738 Y130.989 E.49114
G1 X105.738 Y130.408 E.01866
G1 X95.93 Y120.6 E.44603
G1 X96.511 Y120.6 E.01866
G1 X105.738 Y129.828 E.41964
G1 X105.738 Y129.248 E.01866
G1 X97.091 Y120.6 E.39325
G2 X97.623 Y120.552 I.212 J-.622 E.01769
G1 X105.738 Y128.667 E.36905
G1 X105.738 Y128.087 E.01866
G1 X98.024 Y120.373 E.35079
G1 X98.426 Y120.194 E.01414
G1 X105.738 Y127.507 E.33253
G1 X105.738 Y126.926 E.01866
G1 X98.828 Y120.016 E.31427
G2 X99.164 Y119.772 I-.106 J-.5 E.01376
G1 X105.738 Y126.346 E.29896
G1 X105.738 Y125.766 E.01866
G1 X99.439 Y119.466 E.28646
G1 X99.714 Y119.161 E.01321
G1 X105.738 Y125.185 E.27396
G1 X105.738 Y124.605 E.01866
G1 X99.989 Y118.856 E.26145
G2 X100.198 Y118.485 I-.312 J-.421 E.01411
G1 X105.738 Y124.024 E.25193
G1 X105.738 Y123.444 E.01866
G1 X100.341 Y118.046 E.24546
G1 X100.483 Y117.608 E.01481
G1 X105.738 Y122.864 E.23899
G1 X105.738 Y122.283 E.01866
G1 X100.625 Y117.17 E.23252
G1 X100.576 Y116.541 E.0203
G1 X105.738 Y121.703 E.23475
G1 X105.738 Y121.123 E.01866
G1 X100.508 Y115.892 E.23785
G2 X100.167 Y114.97 I-1.206 J-.077 E.03256
G1 X105.921 Y120.725 E.26171
; WIPE_START
G1 X104.507 Y119.311 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.369 Y126.895 Z2.3 F15000
G1 X105.921 Y131.752 Z2.3
G1 Z1.9
G1 E.8 F1800
G1 F7800
G1 X87.639 Y113.47 E.83143
G1 X87.639 Y114.05 E.01866
G1 X105.738 Y132.15 E.8231
G1 X105.738 Y132.73 E.01866
G1 X87.639 Y114.63 E.8231
G1 X87.639 Y115.211 E.01866
G1 X105.738 Y133.31 E.8231
G1 X105.738 Y133.665 E.01142
G1 X105.513 Y133.665 E.00724
G1 X87.639 Y115.791 E.81286
G1 X87.639 Y116.371 E.01866
G1 X104.933 Y133.665 E.78646
G1 X104.352 Y133.665 E.01866
G1 X87.639 Y116.952 E.76007
G1 X87.639 Y117.532 E.01866
G1 X103.772 Y133.665 E.73368
G1 X103.192 Y133.665 E.01866
G1 X87.639 Y118.113 E.70728
G1 X87.639 Y118.693 E.01866
G1 X102.611 Y133.665 E.68089
G1 X102.031 Y133.665 E.01866
G1 X87.639 Y119.273 E.6545
G1 X87.639 Y119.854 E.01866
G1 X101.451 Y133.665 E.62811
G1 X100.87 Y133.665 E.01866
G1 X87.639 Y120.434 E.60171
G1 X87.639 Y121.014 E.01866
G1 X100.29 Y133.665 E.57532
G1 X99.709 Y133.665 E.01866
G1 X87.639 Y121.595 E.54893
G1 X87.639 Y122.175 E.01866
G1 X99.129 Y133.665 E.52254
G1 X98.549 Y133.665 E.01866
G1 X87.639 Y122.755 E.49614
G1 X87.639 Y123.336 E.01866
G1 X97.968 Y133.665 E.46975
G1 X97.388 Y133.665 E.01866
G1 X87.639 Y123.916 E.44336
G1 X87.639 Y124.497 E.01866
G1 X96.808 Y133.665 E.41697
G1 X96.227 Y133.665 E.01866
G1 X87.639 Y125.077 E.39057
G1 X87.639 Y125.657 E.01866
G1 X95.647 Y133.665 E.36418
G1 X95.067 Y133.665 E.01866
G1 X87.639 Y126.238 E.33779
G1 X87.639 Y126.818 E.01866
G1 X94.486 Y133.665 E.31139
G1 X93.906 Y133.665 E.01866
G1 X87.639 Y127.398 E.285
G1 X87.639 Y127.979 E.01866
G1 X93.325 Y133.665 E.25861
G1 X92.745 Y133.665 E.01866
G1 X87.639 Y128.559 E.23222
G1 X87.639 Y129.139 E.01866
G1 X92.165 Y133.665 E.20582
G1 X91.584 Y133.665 E.01866
G1 X87.639 Y129.72 E.17943
G1 X87.639 Y130.3 E.01866
G1 X91.004 Y133.665 E.15304
G1 X90.424 Y133.665 E.01866
G1 X87.639 Y130.881 E.12665
G1 X87.639 Y131.461 E.01866
G1 X89.843 Y133.665 E.10025
G1 X89.263 Y133.665 E.01866
G1 X87.639 Y132.041 E.07386
G1 X87.639 Y132.622 E.01866
G1 X88.682 Y133.665 E.04747
G1 X88.102 Y133.665 E.01866
G1 X87.456 Y133.019 E.02941
; WIPE_START
G1 X88.102 Y133.665 E-.34749
G1 X88.682 Y133.665 E-.22054
G1 X88.325 Y133.308 E-.19197
; WIPE_END
G1 E-.04 F1800
G1 X88.114 Y125.679 Z2.3 F15000
G1 X87.291 Y96.014 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.456 Y95.005 Z2.3 F15000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X88.116 Y95.665 E.03004
G1 X88.706 Y95.665 E.01896
G1 X87.639 Y94.599 E.04852
G1 X87.639 Y94.009 E.01896
G1 X89.295 Y95.665 E.07533
G1 X89.885 Y95.665 E.01896
G1 X87.639 Y93.42 E.10214
G1 X87.639 Y92.83 E.01896
G1 X90.474 Y95.665 E.12895
G1 X91.064 Y95.665 E.01896
G1 X88.164 Y92.766 E.13186
G1 X88.754 Y92.766 E.01896
G1 X91.653 Y95.665 E.13186
G1 X92.243 Y95.665 E.01896
G1 X89.343 Y92.766 E.13186
G1 X89.933 Y92.766 E.01896
G1 X92.832 Y95.665 E.13186
G1 X93.422 Y95.665 E.01896
G1 X90.522 Y92.766 E.13186
G1 X91.112 Y92.766 E.01896
G1 X94.011 Y95.665 E.13186
G1 X94.601 Y95.665 E.01896
G1 X91.701 Y92.766 E.13186
G1 X92.291 Y92.766 E.01896
G1 X95.191 Y95.665 E.13186
G1 X95.78 Y95.665 E.01896
G1 X92.881 Y92.766 E.13186
G1 X93.47 Y92.766 E.01896
G1 X96.37 Y95.665 E.13186
G1 X96.959 Y95.665 E.01896
G1 X94.06 Y92.766 E.13186
G1 X94.649 Y92.766 E.01896
G1 X97.549 Y95.665 E.13186
G1 X98.138 Y95.665 E.01896
G1 X95.239 Y92.766 E.13186
G1 X95.828 Y92.766 E.01896
G1 X98.728 Y95.665 E.13186
G1 X99.317 Y95.665 E.01896
G1 X96.418 Y92.766 E.13186
G1 X97.007 Y92.766 E.01896
G1 X99.907 Y95.665 E.13186
G1 X100.496 Y95.665 E.01896
G1 X97.597 Y92.766 E.13186
G1 X98.186 Y92.766 E.01896
G1 X101.086 Y95.665 E.13186
G1 X101.676 Y95.665 E.01896
G1 X98.776 Y92.766 E.13186
G1 X99.366 Y92.766 E.01896
G1 X102.265 Y95.665 E.13186
G1 X102.855 Y95.665 E.01896
G1 X99.955 Y92.766 E.13186
G1 X100.545 Y92.766 E.01896
G1 X103.444 Y95.665 E.13186
G1 X104.034 Y95.665 E.01896
G1 X101.134 Y92.766 E.13186
G1 X101.724 Y92.766 E.01896
G1 X104.623 Y95.665 E.13186
G1 X105.213 Y95.665 E.01896
G1 X102.313 Y92.766 E.13186
G1 X102.903 Y92.766 E.01896
G1 X105.738 Y95.601 E.12895
G1 X105.738 Y95.012 E.01896
G1 X103.492 Y92.766 E.10214
G1 X104.082 Y92.766 E.01896
G1 X105.738 Y94.422 E.07533
G1 X105.738 Y93.833 E.01896
G1 X104.671 Y92.766 E.04852
G1 X105.261 Y92.766 E.01896
G1 X105.921 Y93.426 E.03004
; WIPE_START
G1 X105.261 Y92.766 E-.35495
G1 X104.671 Y92.766 E-.22403
G1 X105.008 Y93.103 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X102.002 Y86.087 Z2.3 F15000
G1 X97.36 Y75.252 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X95.937 Y75.252 E.04575
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X96.014 Y68.243 E.02618
G1 X96.688 Y68.1 E.02217
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04834
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.42 Y75.252 E.00066
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X96.096 Y68.627 E.02177
G1 X96.688 Y68.501 E.01805
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X91.697 Y81.25 Z2.3 F15000
G1 X87.291 Y89.014 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.456 Y88.022 Z2.3 F15000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X88.099 Y88.665 E.02926
G1 X88.677 Y88.665 E.01859
G1 X87.639 Y87.627 E.04721
G1 X87.639 Y87.049 E.01859
G1 X89.255 Y88.665 E.0735
G1 X89.833 Y88.665 E.01859
G1 X87.639 Y86.471 E.09979
G1 X87.639 Y85.893 E.01859
G1 X90.411 Y88.665 E.12607
G1 X90.989 Y88.665 E.01859
G1 X87.639 Y85.315 E.15236
G1 X87.639 Y84.737 E.01859
G1 X91.567 Y88.665 E.17865
G1 X92.145 Y88.665 E.01859
G1 X87.639 Y84.159 E.20493
G1 X87.639 Y83.581 E.01859
G1 X92.723 Y88.665 E.23122
G1 X93.301 Y88.665 E.01859
G1 X87.639 Y83.003 E.2575
G1 X87.639 Y82.425 E.01859
G1 X93.879 Y88.665 E.28379
G1 X94.457 Y88.665 E.01859
G1 X87.639 Y81.847 E.31008
G1 X87.639 Y81.269 E.01859
G1 X95.035 Y88.665 E.33636
G1 X95.613 Y88.665 E.01859
G1 X87.639 Y80.691 E.36265
G1 X87.639 Y80.113 E.01859
G1 X96.191 Y88.665 E.38894
G1 X96.769 Y88.665 E.01859
G1 X87.639 Y79.535 E.41522
G1 X87.639 Y78.957 E.01859
G1 X97.347 Y88.665 E.44151
G1 X97.925 Y88.665 E.01859
G1 X87.639 Y78.379 E.4678
G1 X87.639 Y77.801 E.01859
G1 X98.503 Y88.665 E.49408
G1 X99.081 Y88.665 E.01859
G1 X87.639 Y77.223 E.52037
G1 X87.639 Y76.645 E.01859
G1 X99.659 Y88.665 E.54666
G1 X100.238 Y88.665 E.01859
G1 X87.639 Y76.067 E.57294
G1 X87.639 Y75.489 E.01859
G1 X100.816 Y88.665 E.59923
G1 X101.394 Y88.665 E.01859
G1 X87.639 Y74.911 E.62552
G1 X87.639 Y74.333 E.01859
G1 X101.972 Y88.665 E.6518
G1 X102.55 Y88.665 E.01859
G1 X87.639 Y73.755 E.67809
G1 X87.639 Y73.176 E.01859
G1 X103.128 Y88.665 E.70438
G1 X103.706 Y88.665 E.01859
G1 X87.639 Y72.598 E.73066
G1 X87.639 Y72.02 E.01859
G1 X104.284 Y88.665 E.75695
G1 X104.862 Y88.665 E.01859
G1 X87.639 Y71.442 E.78324
G1 X87.639 Y70.864 E.01859
G1 X105.44 Y88.665 E.80952
G1 X105.738 Y88.665 E.0096
G1 X105.738 Y88.386 E.00899
G1 X87.639 Y70.286 E.8231
G1 X87.639 Y69.708 E.01859
G1 X105.738 Y87.808 E.8231
G1 X105.738 Y87.23 E.01859
G1 X87.639 Y69.13 E.8231
G1 X87.639 Y68.552 E.01859
G1 X105.921 Y86.835 E.83143
; WIPE_START
G1 X104.507 Y85.421 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.623 Y77.87 Z2.3 F15000
G1 X105.921 Y75.852 Z2.3
G1 Z1.9
G1 E.8 F1800
G1 F7800
G1 X100.34 Y70.271 E.25382
G3 X100.523 Y71.032 I-.763 J.586 E.02591
G1 X105.738 Y76.247 E.23718
G1 X105.738 Y76.825 E.01859
G1 X100.591 Y71.678 E.2341
G3 X100.596 Y72.261 I-.653 J.298 E.01932
G1 X105.738 Y77.403 E.23385
G1 X105.738 Y77.981 E.01859
G1 X100.454 Y72.697 E.2403
G1 X100.312 Y73.133 E.01475
G1 X105.738 Y78.559 E.24675
G1 X105.738 Y79.137 E.01859
G1 X100.171 Y73.57 E.25319
G3 X99.937 Y73.914 I-.503 J-.091 E.01378
G1 X105.738 Y79.715 E.26383
G1 X105.738 Y80.293 E.01859
M73 P63 R15
G1 X99.663 Y74.218 E.27629
G1 X99.389 Y74.522 E.01316
G1 X105.738 Y80.871 E.28874
G1 X105.738 Y81.449 E.01859
G1 X99.115 Y74.826 E.3012
G3 X98.758 Y75.047 I-.426 J-.291 E.01391
G1 X105.738 Y82.028 E.31746
G1 X105.738 Y82.606 E.01859
G1 X98.358 Y75.225 E.33564
G1 X97.958 Y75.403 E.01408
G1 X105.738 Y83.184 E.35383
G1 X105.738 Y83.762 E.01859
G1 X97.558 Y75.581 E.37202
G1 X96.999 Y75.6 E.01798
G1 X105.738 Y84.34 E.39743
G1 X105.738 Y84.918 E.01859
G1 X96.421 Y75.6 E.42371
G1 X95.827 Y75.584 E.01911
G1 X105.738 Y85.496 E.45073
G1 X105.738 Y86.074 E.01859
G1 X87.639 Y67.974 E.8231
G1 X87.639 Y67.396 E.01859
G1 X92.915 Y72.672 E.23993
G1 X92.739 Y72.131 E.0183
G1 X92.759 Y71.938 E.00622
G1 X87.639 Y66.818 E.23285
G1 X87.639 Y66.24 E.01859
G1 X92.814 Y71.415 E.23535
G1 X92.869 Y70.892 E.01691
G1 X87.639 Y65.662 E.23785
G1 X87.639 Y65.084 E.01859
G1 X92.96 Y70.405 E.24197
G1 X93.171 Y70.038 E.01361
G1 X87.639 Y64.506 E.2516
G1 X87.639 Y63.928 E.01859
G1 X93.383 Y69.672 E.26122
G1 X93.594 Y69.306 E.01361
G1 X87.639 Y63.35 E.27084
G1 X87.639 Y62.772 E.01859
G1 X93.846 Y68.979 E.28228
G1 X94.181 Y68.736 E.01331
G1 X87.639 Y62.194 E.29751
G1 X87.639 Y61.616 E.01859
G1 X94.516 Y68.493 E.31273
G1 X94.85 Y68.249 E.01331
G1 X87.639 Y61.038 E.32796
G1 X87.639 Y60.46 E.01859
G1 X95.233 Y68.054 E.34534
G1 X95.709 Y67.952 E.01567
G1 X87.639 Y59.882 E.36702
G1 X87.639 Y59.304 E.01859
G1 X96.186 Y67.851 E.3887
G1 X96.663 Y67.75 E.01567
G1 X87.639 Y58.726 E.41038
G1 X87.639 Y58.148 E.01859
G1 X97.383 Y67.892 E.44313
G1 X98.117 Y68.048 E.02413
G1 X87.639 Y57.57 E.47651
G1 X87.639 Y56.992 E.01859
G1 X105.738 Y75.091 E.8231
G1 X105.738 Y74.513 E.01859
G1 X87.639 Y56.414 E.82309
G1 X87.639 Y55.836 E.01859
G1 X105.738 Y73.935 E.82309
G1 X105.738 Y73.357 E.01859
G1 X87.639 Y55.257 E.8231
G1 X87.639 Y54.679 E.01859
G1 X105.738 Y72.779 E.8231
G1 X105.738 Y72.201 E.01859
G1 X87.639 Y54.101 E.8231
G1 X87.639 Y53.523 E.01859
G1 X105.738 Y71.623 E.8231
G1 X105.738 Y71.045 E.01859
G1 X87.639 Y52.945 E.8231
G1 X87.639 Y52.666 E.00899
G1 X87.937 Y52.666 E.0096
G1 X105.738 Y70.467 E.80952
G1 X105.738 Y69.889 E.01859
G1 X88.515 Y52.666 E.78323
G1 X89.093 Y52.666 E.01859
G1 X105.738 Y69.311 E.75694
G1 X105.738 Y68.733 E.01859
G1 X89.671 Y52.666 E.73066
G1 X90.249 Y52.666 E.01859
G1 X105.738 Y68.155 E.70437
G1 X105.738 Y67.577 E.01859
G1 X90.827 Y52.666 E.67808
G1 X91.405 Y52.666 E.01859
G1 X105.738 Y66.999 E.6518
G1 X105.738 Y66.421 E.01859
G1 X91.983 Y52.666 E.62551
G1 X92.562 Y52.666 E.01859
G1 X105.738 Y65.843 E.59922
G1 X105.738 Y65.265 E.01859
G1 X93.14 Y52.666 E.57294
G1 X93.718 Y52.666 E.01859
G1 X105.738 Y64.687 E.54665
G1 X105.738 Y64.109 E.01859
G1 X94.296 Y52.666 E.52037
G1 X94.874 Y52.666 E.01859
G1 X105.738 Y63.531 E.49408
G1 X105.738 Y62.952 E.01859
G1 X95.452 Y52.666 E.46779
G1 X96.03 Y52.666 E.01859
G1 X105.738 Y62.374 E.44151
G1 X105.738 Y61.796 E.01859
G1 X96.608 Y52.666 E.41522
G1 X97.186 Y52.666 E.01859
G1 X105.738 Y61.218 E.38893
G1 X105.738 Y60.64 E.01859
G1 X97.764 Y52.666 E.36265
G1 X98.342 Y52.666 E.01859
G1 X105.738 Y60.062 E.33636
G1 X105.738 Y59.484 E.01859
G1 X98.92 Y52.666 E.31007
G1 X99.498 Y52.666 E.01859
G1 X105.738 Y58.906 E.28379
G1 X105.738 Y58.328 E.01859
G1 X100.076 Y52.666 E.2575
G1 X100.654 Y52.666 E.01859
G1 X105.738 Y57.75 E.23121
G1 X105.738 Y57.172 E.01859
G1 X101.232 Y52.666 E.20493
G1 X101.81 Y52.666 E.01859
G1 X105.738 Y56.594 E.17864
G1 X105.738 Y56.016 E.01859
G1 X102.388 Y52.666 E.15235
G1 X102.966 Y52.666 E.01859
G1 X105.738 Y55.438 E.12607
G1 X105.738 Y54.86 E.01859
G1 X103.544 Y52.666 E.09978
G1 X104.122 Y52.666 E.01859
G1 X105.738 Y54.282 E.07349
G1 X105.738 Y53.704 E.01859
G1 X104.7 Y52.666 E.04721
G1 X105.278 Y52.666 E.01859
G1 X105.921 Y53.309 E.02925
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X105.278 Y52.666 E-.34567
G1 X104.7 Y52.666 E-.21966
G1 X105.062 Y53.028 E-.19468
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 10/20
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.3 I1.217 J0 P1  F15000
; object ids of layer 10 start: 138,178
M624 AwAAAAAAAAA=
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
; object ids of this layer10 end: 138,178
M625
; OBJECT_ID: 138
; start printing object, unique label id: 138
M624 AQAAAAAAAAA=
G1 X199.603 Y66.648
G1 Z2.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X163.183 Y66.648 E1.08483
G1 X163.183 Y91.648 E.74466
G1 X161.603 Y91.648 E.04706
G1 X161.603 Y66.648 E.74466
G1 X156.183 Y66.648 E.16144
G1 X156.183 Y91.648 E.74466
G1 X154.603 Y91.648 E.04706
G1 X154.603 Y65.068 E.79173
G1 X208.183 Y65.068 E1.59597
G1 X208.183 Y91.648 E.79173
G1 X206.603 Y91.648 E.04706
G1 X206.603 Y66.648 E.74466
G1 X201.183 Y66.648 E.16144
G1 X201.183 Y91.648 E.74466
G1 X199.603 Y91.648 E.04706
G1 X199.603 Y66.708 E.74288
; WIPE_START
M204 S5000
G1 X197.603 Y66.704 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.624 Y73.714 Z2.5 F15000
G1 X207.976 Y90.776 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X207.311 Y91.44 E.028
G1 X206.811 Y91.408
G1 X207.976 Y90.242 E.04909
G1 X207.976 Y89.709
G1 X206.811 Y90.874 E.04909
G1 X206.811 Y90.341
G1 X207.976 Y89.176 E.04909
G1 X207.976 Y88.643
G1 X206.811 Y89.808 E.04909
G1 X206.811 Y89.275
G1 X207.976 Y88.109 E.04909
G1 X207.976 Y87.576
G1 X206.811 Y88.741 E.04909
G1 X206.811 Y88.208
G1 X207.976 Y87.043 E.04909
G1 X207.976 Y86.51
G1 X206.811 Y87.675 E.04909
G1 X206.811 Y87.142
G1 X207.976 Y85.976 E.04909
G1 X207.976 Y85.443
G1 X206.811 Y86.608 E.04909
G1 X206.811 Y86.075
G1 X207.976 Y84.91 E.04909
G1 X207.976 Y84.377
G1 X206.811 Y85.542 E.04909
G1 X206.811 Y85.009
G1 X207.976 Y83.843 E.04909
G1 X207.976 Y83.31
G1 X206.811 Y84.475 E.04909
G1 X206.811 Y83.942
G1 X207.976 Y82.777 E.04909
G1 X207.976 Y82.243
G1 X206.811 Y83.409 E.04909
G1 X206.811 Y82.875
G1 X207.976 Y81.71 E.04909
G1 X207.976 Y81.177
G1 X206.811 Y82.342 E.04909
G1 X206.811 Y81.809
G1 X207.976 Y80.644 E.04909
G1 X207.976 Y80.11
G1 X206.811 Y81.276 E.04909
G1 X206.811 Y80.742
G1 X207.976 Y79.577 E.04909
G1 X207.976 Y79.044
G1 X206.811 Y80.209 E.04909
G1 X206.811 Y79.676
G1 X207.976 Y78.511 E.04909
G1 X207.976 Y77.977
G1 X206.811 Y79.143 E.04909
G1 X206.811 Y78.609
G1 X207.976 Y77.444 E.04909
G1 X207.976 Y76.911
G1 X206.811 Y78.076 E.04909
G1 X206.811 Y77.543
G1 X207.976 Y76.378 E.04909
G1 X207.976 Y75.844
G1 X206.811 Y77.01 E.04909
G1 X206.811 Y76.476
G1 X207.976 Y75.311 E.04909
G1 X207.976 Y74.778
G1 X206.811 Y75.943 E.04909
G1 X206.811 Y75.41
G1 X207.976 Y74.245 E.04909
G1 X207.976 Y73.711
G1 X206.811 Y74.877 E.04909
G1 X206.811 Y74.343
G1 X207.976 Y73.178 E.04909
G1 X207.976 Y72.645
G1 X206.811 Y73.81 E.04909
G1 X206.811 Y73.277
G1 X207.976 Y72.112 E.04909
G1 X207.976 Y71.578
G1 X206.811 Y72.744 E.04909
G1 X206.811 Y72.21
G1 X207.976 Y71.045 E.04909
G1 X207.976 Y70.512
G1 X206.811 Y71.677 E.04909
G1 X206.811 Y71.144
G1 X207.976 Y69.979 E.04909
G1 X207.976 Y69.445
G1 X206.811 Y70.611 E.04909
G1 X206.811 Y70.077
G1 X207.976 Y68.912 E.04909
G1 X207.976 Y68.379
G1 X206.811 Y69.544 E.04909
G1 X206.811 Y69.011
G1 X207.976 Y67.846 E.04909
G1 X207.976 Y67.312
G1 X206.811 Y68.478 E.04909
G1 X206.811 Y67.944
G1 X207.976 Y66.779 E.04909
G1 X207.976 Y66.246
G1 X206.811 Y67.411 E.04909
G1 X206.811 Y66.878
G1 X207.976 Y65.713 E.04909
G1 X207.88 Y65.275
G1 X206.715 Y66.44 E.04909
G1 X206.182 Y66.44
G1 X207.347 Y65.275 E.04909
G1 X206.814 Y65.275
G1 X205.648 Y66.44 E.04909
G1 X205.115 Y66.44
G1 X206.28 Y65.275 E.04909
G1 X205.747 Y65.275
G1 X204.582 Y66.44 E.04909
G1 X204.049 Y66.44
G1 X205.214 Y65.275 E.04909
G1 X204.681 Y65.275
G1 X203.515 Y66.44 E.04909
G1 X202.982 Y66.44
G1 X204.147 Y65.275 E.04909
G1 X203.614 Y65.275
G1 X202.449 Y66.44 E.04909
G1 X201.916 Y66.44
G1 X203.081 Y65.275 E.04909
G1 X202.548 Y65.275
G1 X201.382 Y66.44 E.04909
; WIPE_START
M204 S5000
G1 X202.548 Y65.275 E-.62621
G1 X202.9 Y65.275 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X202.327 Y72.886 Z2.5 F15000
G1 X200.976 Y90.843 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X200.379 Y91.44 E.02515
G1 X199.846 Y91.44
G1 X200.976 Y90.31 E.04762
G1 X200.976 Y89.777
G1 X199.811 Y90.942 E.04909
G1 X199.811 Y90.409
G1 X200.976 Y89.244 E.04909
G1 X200.976 Y88.71
G1 X199.811 Y89.875 E.04909
G1 X199.811 Y89.342
G1 X200.976 Y88.177 E.04909
G1 X200.976 Y87.644
G1 X199.811 Y88.809 E.04909
G1 X199.811 Y88.276
G1 X200.976 Y87.11 E.04909
G1 X200.976 Y86.577
G1 X199.811 Y87.742 E.04909
G1 X199.811 Y87.209
G1 X200.976 Y86.044 E.04909
G1 X200.976 Y85.511
G1 X199.811 Y86.676 E.04909
G1 X199.811 Y86.143
G1 X200.976 Y84.977 E.04909
G1 X200.976 Y84.444
G1 X199.811 Y85.609 E.04909
G1 X199.811 Y85.076
G1 X200.976 Y83.911 E.04909
G1 X200.976 Y83.378
G1 X199.811 Y84.543 E.04909
G1 X199.811 Y84.01
G1 X200.976 Y82.844 E.04909
G1 X200.976 Y82.311
G1 X199.811 Y83.476 E.04909
G1 X199.811 Y82.943
G1 X200.976 Y81.778 E.04909
G1 X200.976 Y81.245
G1 X199.811 Y82.41 E.04909
G1 X199.811 Y81.877
G1 X200.976 Y80.711 E.04909
G1 X200.976 Y80.178
G1 X199.811 Y81.343 E.04909
G1 X199.811 Y80.81
G1 X200.976 Y79.645 E.04909
G1 X200.976 Y79.112
G1 X199.811 Y80.277 E.04909
G1 X199.811 Y79.744
G1 X200.976 Y78.578 E.04909
G1 X200.976 Y78.045
G1 X199.811 Y79.21 E.04909
G1 X199.811 Y78.677
G1 X200.976 Y77.512 E.04909
G1 X200.976 Y76.979
G1 X199.811 Y78.144 E.04909
G1 X199.811 Y77.611
G1 X200.976 Y76.445 E.04909
G1 X200.976 Y75.912
G1 X199.811 Y77.077 E.04909
G1 X199.811 Y76.544
G1 X200.976 Y75.379 E.04909
G1 X200.976 Y74.846
G1 X199.811 Y76.011 E.04909
G1 X199.811 Y75.478
G1 X200.976 Y74.312 E.04909
G1 X200.976 Y73.779
G1 X199.811 Y74.944 E.04909
G1 X199.811 Y74.411
G1 X200.976 Y73.246 E.04909
G1 X200.976 Y72.713
G1 X199.811 Y73.878 E.04909
G1 X199.811 Y73.345
G1 X200.976 Y72.179 E.04909
G1 X200.976 Y71.646
G1 X199.811 Y72.811 E.04909
G1 X199.811 Y72.278
G1 X200.976 Y71.113 E.04909
G1 X200.976 Y70.579
G1 X199.811 Y71.745 E.04909
G1 X199.811 Y71.211
G1 X200.976 Y70.046 E.04909
G1 X200.976 Y69.513
G1 X199.811 Y70.678 E.04909
G1 X199.811 Y70.145
G1 X200.976 Y68.98 E.04909
M73 P64 R15
G1 X200.976 Y68.446
G1 X199.811 Y69.612 E.04909
G1 X199.811 Y69.078
G1 X200.976 Y67.913 E.04909
G1 X200.976 Y67.38
G1 X199.811 Y68.545 E.04909
G1 X199.811 Y68.012
G1 X200.976 Y66.847 E.04909
; WIPE_START
M204 S5000
G1 X199.811 Y68.012 E-.62621
G1 X199.811 Y68.364 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X199.811 Y67.479 Z2.5 F15000
G1 Z2.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X202.014 Y65.275 E.09282
G1 X201.481 Y65.275
G1 X199.811 Y66.945 E.07036
G1 X199.783 Y66.44
G1 X200.948 Y65.275 E.04909
G1 X200.415 Y65.275
G1 X199.249 Y66.44 E.04909
G1 X198.716 Y66.44
G1 X199.881 Y65.275 E.04909
G1 X199.348 Y65.275
G1 X198.183 Y66.44 E.04909
G1 X197.65 Y66.44
G1 X198.815 Y65.275 E.04909
G1 X198.282 Y65.275
G1 X197.116 Y66.44 E.04909
G1 X196.583 Y66.44
G1 X197.748 Y65.275 E.04909
G1 X197.215 Y65.275
G1 X196.05 Y66.44 E.04909
G1 X195.516 Y66.44
G1 X196.682 Y65.275 E.04909
G1 X196.148 Y65.275
G1 X194.983 Y66.44 E.04909
G1 X194.45 Y66.44
G1 X195.615 Y65.275 E.04909
G1 X195.082 Y65.275
G1 X193.917 Y66.44 E.04909
G1 X193.383 Y66.44
G1 X194.549 Y65.275 E.04909
G1 X194.015 Y65.275
G1 X192.85 Y66.44 E.04909
G1 X192.317 Y66.44
G1 X193.482 Y65.275 E.04909
G1 X192.949 Y65.275
G1 X191.784 Y66.44 E.04909
G1 X191.25 Y66.44
G1 X192.416 Y65.275 E.04909
G1 X191.882 Y65.275
G1 X190.717 Y66.44 E.04909
G1 X190.184 Y66.44
G1 X191.349 Y65.275 E.04909
G1 X190.816 Y65.275
G1 X189.651 Y66.44 E.04909
G1 X189.117 Y66.44
G1 X190.283 Y65.275 E.04909
G1 X189.749 Y65.275
G1 X188.584 Y66.44 E.04909
G1 X188.051 Y66.44
G1 X189.216 Y65.275 E.04909
G1 X188.683 Y65.275
G1 X187.518 Y66.44 E.04909
G1 X186.984 Y66.44
G1 X188.15 Y65.275 E.04909
G1 X187.616 Y65.275
G1 X186.451 Y66.44 E.04909
G1 X185.918 Y66.44
G1 X187.083 Y65.275 E.04909
G1 X186.55 Y65.275
G1 X185.385 Y66.44 E.04909
G1 X184.851 Y66.44
G1 X186.017 Y65.275 E.04909
G1 X185.483 Y65.275
G1 X184.318 Y66.44 E.04909
G1 X183.785 Y66.44
G1 X184.95 Y65.275 E.04909
G1 X184.417 Y65.275
G1 X183.252 Y66.44 E.04909
G1 X182.718 Y66.44
G1 X183.884 Y65.275 E.04909
G1 X183.35 Y65.275
G1 X182.185 Y66.44 E.04909
G1 X181.652 Y66.44
G1 X182.817 Y65.275 E.04909
G1 X182.284 Y65.275
G1 X181.119 Y66.44 E.04909
G1 X180.585 Y66.44
G1 X181.751 Y65.275 E.04909
G1 X181.217 Y65.275
G1 X180.052 Y66.44 E.04909
G1 X179.519 Y66.44
G1 X180.684 Y65.275 E.04909
G1 X180.151 Y65.275
G1 X178.985 Y66.44 E.04909
G1 X178.452 Y66.44
G1 X179.617 Y65.275 E.04909
G1 X179.084 Y65.275
G1 X177.919 Y66.44 E.04909
G1 X177.386 Y66.44
G1 X178.551 Y65.275 E.04909
G1 X178.018 Y65.275
G1 X176.852 Y66.44 E.04909
G1 X176.319 Y66.44
G1 X177.484 Y65.275 E.04909
G1 X176.951 Y65.275
G1 X175.786 Y66.44 E.04909
G1 X175.253 Y66.44
G1 X176.418 Y65.275 E.04909
G1 X175.885 Y65.275
G1 X174.719 Y66.44 E.04909
G1 X174.186 Y66.44
G1 X175.351 Y65.275 E.04909
G1 X174.818 Y65.275
G1 X173.653 Y66.44 E.04909
G1 X173.12 Y66.44
G1 X174.285 Y65.275 E.04909
G1 X173.752 Y65.275
G1 X172.586 Y66.44 E.04909
G1 X172.053 Y66.44
G1 X173.218 Y65.275 E.04909
G1 X172.685 Y65.275
G1 X171.52 Y66.44 E.04909
G1 X170.987 Y66.44
G1 X172.152 Y65.275 E.04909
G1 X171.619 Y65.275
G1 X170.453 Y66.44 E.04909
G1 X169.92 Y66.44
G1 X171.085 Y65.275 E.04909
G1 X170.552 Y65.275
G1 X169.387 Y66.44 E.04909
G1 X168.854 Y66.44
G1 X170.019 Y65.275 E.04909
G1 X169.486 Y65.275
G1 X168.32 Y66.44 E.04909
G1 X167.787 Y66.44
G1 X168.952 Y65.275 E.04909
G1 X168.419 Y65.275
G1 X167.254 Y66.44 E.04909
G1 X166.721 Y66.44
G1 X167.886 Y65.275 E.04909
G1 X167.353 Y65.275
G1 X166.187 Y66.44 E.04909
G1 X165.654 Y66.44
G1 X166.819 Y65.275 E.04909
G1 X166.286 Y65.275
G1 X165.121 Y66.44 E.04909
G1 X164.588 Y66.44
G1 X165.753 Y65.275 E.04909
G1 X165.22 Y65.275
G1 X164.054 Y66.44 E.04909
G1 X163.521 Y66.44
G1 X164.686 Y65.275 E.04909
G1 X164.153 Y65.275
G1 X162.988 Y66.44 E.04909
; WIPE_START
M204 S5000
G1 X164.153 Y65.275 E-.6262
G1 X164.505 Y65.275 E-.1338
; WIPE_END
G1 E-.04 F1800
G1 X164.052 Y72.894 Z2.5 F15000
G1 X162.976 Y90.982 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X162.518 Y91.44 E.01931
G1 X161.984 Y91.44
G1 X162.976 Y90.449 E.04177
G1 X162.976 Y89.915
G1 X161.811 Y91.081 E.04909
G1 X161.811 Y90.547
G1 X162.976 Y89.382 E.04909
G1 X162.976 Y88.849
G1 X161.811 Y90.014 E.04909
G1 X161.811 Y89.481
G1 X162.976 Y88.316 E.04909
G1 X162.976 Y87.782
G1 X161.811 Y88.948 E.04909
G1 X161.811 Y88.414
G1 X162.976 Y87.249 E.04909
G1 X162.976 Y86.716
G1 X161.811 Y87.881 E.04909
G1 X161.811 Y87.348
G1 X162.976 Y86.183 E.04909
G1 X162.976 Y85.649
G1 X161.811 Y86.815 E.04909
G1 X161.811 Y86.281
G1 X162.976 Y85.116 E.04909
G1 X162.976 Y84.583
G1 X161.811 Y85.748 E.04909
G1 X161.811 Y85.215
G1 X162.976 Y84.05 E.04909
G1 X162.976 Y83.516
G1 X161.811 Y84.682 E.04909
G1 X161.811 Y84.148
G1 X162.976 Y82.983 E.04909
G1 X162.976 Y82.45
G1 X161.811 Y83.615 E.04909
G1 X161.811 Y83.082
G1 X162.976 Y81.917 E.04909
G1 X162.976 Y81.383
G1 X161.811 Y82.549 E.04909
G1 X161.811 Y82.015
G1 X162.976 Y80.85 E.04909
G1 X162.976 Y80.317
G1 X161.811 Y81.482 E.04909
G1 X161.811 Y80.949
G1 X162.976 Y79.784 E.04909
G1 X162.976 Y79.25
G1 X161.811 Y80.416 E.04909
G1 X161.811 Y79.882
G1 X162.976 Y78.717 E.04909
G1 X162.976 Y78.184
G1 X161.811 Y79.349 E.04909
G1 X161.811 Y78.816
G1 X162.976 Y77.651 E.04909
G1 X162.976 Y77.117
G1 X161.811 Y78.283 E.04909
G1 X161.811 Y77.749
G1 X162.976 Y76.584 E.04909
G1 X162.976 Y76.051
G1 X161.811 Y77.216 E.04909
G1 X161.811 Y76.683
G1 X162.976 Y75.518 E.04909
G1 X162.976 Y74.984
G1 X161.811 Y76.15 E.04909
G1 X161.811 Y75.616
G1 X162.976 Y74.451 E.04909
G1 X162.976 Y73.918
G1 X161.811 Y75.083 E.04909
G1 X161.811 Y74.55
G1 X162.976 Y73.384 E.04909
G1 X162.976 Y72.851
G1 X161.811 Y74.016 E.04909
G1 X161.811 Y73.483
G1 X162.976 Y72.318 E.04909
M73 P64 R14
G1 X162.976 Y71.785
G1 X161.811 Y72.95 E.04909
G1 X161.811 Y72.417
G1 X162.976 Y71.251 E.04909
G1 X162.976 Y70.718
G1 X161.811 Y71.883 E.04909
G1 X161.811 Y71.35
G1 X162.976 Y70.185 E.04909
G1 X162.976 Y69.652
G1 X161.811 Y70.817 E.04909
G1 X161.811 Y70.284
G1 X162.976 Y69.118 E.04909
G1 X162.976 Y68.585
G1 X161.811 Y69.75 E.04909
G1 X161.811 Y69.217
G1 X162.976 Y68.052 E.04909
G1 X162.976 Y67.519
G1 X161.811 Y68.684 E.04909
G1 X161.811 Y68.151
G1 X162.976 Y66.985 E.04909
G1 X162.976 Y66.452
G1 X161.811 Y67.617 E.04909
G1 X161.811 Y67.084
G1 X163.62 Y65.275 E.07621
G1 X163.087 Y65.275
G1 X161.811 Y66.551 E.05374
G1 X161.388 Y66.44
G1 X162.553 Y65.275 E.04909
G1 X162.02 Y65.275
G1 X160.855 Y66.44 E.04909
G1 X160.321 Y66.44
G1 X161.487 Y65.275 E.04909
G1 X160.953 Y65.275
G1 X159.788 Y66.44 E.04909
G1 X159.255 Y66.44
G1 X160.42 Y65.275 E.04909
G1 X159.887 Y65.275
G1 X158.722 Y66.44 E.04909
G1 X158.188 Y66.44
G1 X159.354 Y65.275 E.04909
G1 X158.82 Y65.275
G1 X157.655 Y66.44 E.04909
G1 X157.122 Y66.44
G1 X158.287 Y65.275 E.04909
G1 X157.754 Y65.275
G1 X156.589 Y66.44 E.04909
G1 X156.055 Y66.44
G1 X157.221 Y65.275 E.04909
; WIPE_START
M204 S5000
G1 X156.055 Y66.44 E-.62621
G1 X156.408 Y66.44 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X156.274 Y74.072 Z2.5 F15000
G1 X155.976 Y91.05 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X155.585 Y91.44 E.01646
G1 X155.052 Y91.44
G1 X155.976 Y90.516 E.03892
G1 X155.976 Y89.983
G1 X154.811 Y91.148 E.04909
G1 X154.811 Y90.615
G1 X155.976 Y89.45 E.04909
G1 X155.976 Y88.917
G1 X154.811 Y90.082 E.04909
G1 X154.811 Y89.549
G1 X155.976 Y88.383 E.04909
G1 X155.976 Y87.85
G1 X154.811 Y89.015 E.04909
G1 X154.811 Y88.482
G1 X155.976 Y87.317 E.04909
G1 X155.976 Y86.784
G1 X154.811 Y87.949 E.04909
G1 X154.811 Y87.416
G1 X155.976 Y86.25 E.04909
G1 X155.976 Y85.717
G1 X154.811 Y86.882 E.04909
G1 X154.811 Y86.349
G1 X155.976 Y85.184 E.04909
G1 X155.976 Y84.651
G1 X154.811 Y85.816 E.04909
G1 X154.811 Y85.283
G1 X155.976 Y84.117 E.04909
G1 X155.976 Y83.584
G1 X154.811 Y84.749 E.04909
G1 X154.811 Y84.216
G1 X155.976 Y83.051 E.04909
G1 X155.976 Y82.518
G1 X154.811 Y83.683 E.04909
G1 X154.811 Y83.15
G1 X155.976 Y81.984 E.04909
G1 X155.976 Y81.451
G1 X154.811 Y82.616 E.04909
G1 X154.811 Y82.083
G1 X155.976 Y80.918 E.04909
G1 X155.976 Y80.384
G1 X154.811 Y81.55 E.04909
G1 X154.811 Y81.016
G1 X155.976 Y79.851 E.04909
G1 X155.976 Y79.318
G1 X154.811 Y80.483 E.04909
G1 X154.811 Y79.95
G1 X155.976 Y78.785 E.04909
G1 X155.976 Y78.251
G1 X154.811 Y79.417 E.04909
G1 X154.811 Y78.883
G1 X155.976 Y77.718 E.04909
G1 X155.976 Y77.185
G1 X154.811 Y78.35 E.04909
G1 X154.811 Y77.817
G1 X155.976 Y76.652 E.04909
G1 X155.976 Y76.118
G1 X154.811 Y77.284 E.04909
G1 X154.811 Y76.75
G1 X155.976 Y75.585 E.04909
G1 X155.976 Y75.052
G1 X154.811 Y76.217 E.04909
G1 X154.811 Y75.684
G1 X155.976 Y74.519 E.04909
G1 X155.976 Y73.985
G1 X154.811 Y75.151 E.04909
G1 X154.811 Y74.617
G1 X155.976 Y73.452 E.04909
G1 X155.976 Y72.919
G1 X154.811 Y74.084 E.04909
G1 X154.811 Y73.551
G1 X155.976 Y72.386 E.04909
G1 X155.976 Y71.852
G1 X154.811 Y73.018 E.04909
G1 X154.811 Y72.484
G1 X155.976 Y71.319 E.04909
G1 X155.976 Y70.786
G1 X154.811 Y71.951 E.04909
G1 X154.811 Y71.418
G1 X155.976 Y70.253 E.04909
G1 X155.976 Y69.719
G1 X154.811 Y70.885 E.04909
G1 X154.811 Y70.351
G1 X155.976 Y69.186 E.04909
G1 X155.976 Y68.653
G1 X154.811 Y69.818 E.04909
G1 X154.811 Y69.285
G1 X155.976 Y68.12 E.04909
G1 X155.976 Y67.586
G1 X154.811 Y68.752 E.04909
G1 X154.811 Y68.218
G1 X155.976 Y67.053 E.04909
G1 X155.976 Y66.52
G1 X154.811 Y67.685 E.04909
G1 X154.811 Y67.152
G1 X156.687 Y65.275 E.07905
G1 X156.154 Y65.275
G1 X154.811 Y66.619 E.05659
G1 X154.811 Y66.085
G1 X155.621 Y65.275 E.03413
; WIPE_START
M204 S5000
G1 X154.811 Y66.085 E-.43539
G1 X154.811 Y66.619 E-.20264
G1 X155.038 Y66.392 E-.12198
; WIPE_END
G1 E-.04 F1800
G1 X162.67 Y66.384 Z2.5 F15000
G1 X199.691 Y66.349 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110189
G1 F7500
G1 X199.573 Y66.428 E.00076
; LINE_WIDTH: 0.0821829
G1 X199.591 Y66.459 E.00011
; WIPE_START
G1 X199.573 Y66.428 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X193.184 Y70.603 Z2.5 F15000
G1 X161.826 Y91.096 Z2.5
G1 Z2.1
G1 E.8 F1800
; LINE_WIDTH: 0.11215
G1 F7500
G1 X161.826 Y91.459 E.00198
; OBJECT_ID: 178
; WIPE_START
G1 X161.826 Y91.096 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 138
M625
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X156.861 Y96.893 Z2.5 F15000
G1 X98.868 Y164.58 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.814 Y164.641 E.00261
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04834
G1 X95.953 Y158.256 E.02417
G1 X96.688 Y158.1 E.02417
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04835
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.908 Y164.536 E.0438
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X96.035 Y158.64 E.01991
G1 X96.688 Y158.501 E.01991
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X93.544 Y157.933 Z2.5 F15000
G1 X87.291 Y144.418 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.282 Y144.583 Z2.5 F15000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y145.226 E.02926
G1 X87.639 Y145.804 E.01859
G1 X88.677 Y144.766 E.04721
G1 X89.255 Y144.766 E.01859
G1 X87.639 Y146.382 E.0735
G1 X87.639 Y146.96 E.01859
G1 X89.833 Y144.766 E.09979
G1 X90.411 Y144.766 E.01859
G1 X87.639 Y147.538 E.12607
G1 X87.639 Y148.116 E.01859
G1 X90.989 Y144.766 E.15236
G1 X91.567 Y144.766 E.01859
G1 X87.639 Y148.694 E.17865
G1 X87.639 Y149.272 E.01859
G1 X92.145 Y144.766 E.20493
G1 X92.723 Y144.766 E.01859
G1 X87.639 Y149.85 E.23122
G1 X87.639 Y150.428 E.01859
G1 X93.301 Y144.766 E.2575
G1 X93.879 Y144.766 E.01859
G1 X87.639 Y151.006 E.28379
G1 X87.639 Y151.584 E.01859
G1 X94.457 Y144.766 E.31008
G1 X95.035 Y144.766 E.01859
G1 X87.639 Y152.162 E.33636
G1 X87.639 Y152.74 E.01859
G1 X95.613 Y144.766 E.36265
G1 X96.191 Y144.766 E.01859
G1 X87.639 Y153.319 E.38894
G1 X87.639 Y153.897 E.01859
G1 X96.769 Y144.766 E.41522
G1 X97.347 Y144.766 E.01859
G1 X87.639 Y154.475 E.44151
G1 X87.639 Y155.053 E.01859
G1 X97.925 Y144.766 E.4678
G1 X98.503 Y144.766 E.01859
G1 X87.639 Y155.631 E.49408
G1 X87.639 Y156.209 E.01859
G1 X99.081 Y144.766 E.52037
G1 X99.659 Y144.766 E.01859
G1 X87.639 Y156.787 E.54666
G1 X87.639 Y157.365 E.01859
G1 X100.238 Y144.766 E.57294
G1 X100.816 Y144.766 E.01859
G1 X87.639 Y157.943 E.59923
G1 X87.639 Y158.521 E.01859
G1 X101.394 Y144.766 E.62552
G1 X101.972 Y144.766 E.01859
G1 X87.639 Y159.099 E.6518
G1 X87.639 Y159.677 E.01859
G1 X102.55 Y144.766 E.67809
G1 X103.128 Y144.766 E.01859
G1 X87.639 Y160.255 E.70438
G1 X87.639 Y160.833 E.01859
G1 X103.706 Y144.766 E.73066
G1 X104.284 Y144.766 E.01859
G1 X87.639 Y161.411 E.75695
G1 X87.639 Y161.989 E.01859
G1 X104.862 Y144.766 E.78324
G1 X105.44 Y144.766 E.01859
G1 X87.639 Y162.567 E.80952
G1 X87.639 Y163.145 E.01859
G1 X105.738 Y145.046 E.82309
G1 X105.738 Y145.624 E.01859
G1 X87.639 Y163.723 E.82309
M73 P65 R14
G1 X87.639 Y164.301 E.01859
G1 X105.738 Y146.202 E.82309
G1 X105.738 Y146.78 E.01859
G1 X87.456 Y165.062 E.83142
; WIPE_START
G1 X88.87 Y163.648 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.005 Y171.231 Z2.5 F15000
G1 X87.456 Y176.045 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F7800
G1 X98.21 Y165.291 E.48906
G1 X97.514 Y165.6 E.02448
G1 X97.322 Y165.6 E.00618
G1 X87.639 Y175.284 E.44036
G1 X87.639 Y174.706 E.01859
G1 X96.744 Y165.6 E.41407
G1 X96.166 Y165.6 E.01859
G1 X87.639 Y174.128 E.38779
G1 X87.639 Y173.55 E.01859
G1 X95.673 Y165.516 E.36535
G1 X95.273 Y165.338 E.01408
G1 X87.639 Y172.972 E.34716
G1 X87.639 Y172.394 E.01859
G1 X94.873 Y165.16 E.32897
G1 X94.473 Y164.981 E.01408
G1 X87.639 Y171.816 E.31078
G1 X87.639 Y171.237 E.01859
G1 X94.161 Y164.715 E.29663
G1 X93.888 Y164.411 E.01316
G1 X87.639 Y170.659 E.28417
G1 X87.639 Y170.081 E.01859
G1 X93.614 Y164.106 E.27172
G1 X93.34 Y163.802 E.01316
G1 X87.639 Y169.503 E.25927
G1 X87.639 Y168.925 E.01859
G1 X93.154 Y163.41 E.25083
G1 X93.013 Y162.973 E.01475
G1 X87.639 Y168.347 E.24438
G1 X87.639 Y167.769 E.01859
G1 X92.871 Y162.537 E.23793
G1 X92.743 Y162.087 E.01506
G1 X87.639 Y167.191 E.23214
G1 X87.639 Y166.613 E.01859
G1 X92.811 Y161.441 E.23523
G1 X92.879 Y160.795 E.02089
G1 X87.639 Y166.035 E.23832
G1 X87.639 Y165.457 E.01859
G1 X93.327 Y159.769 E.25866
G1 X93.737 Y159.058 E.0264
G1 X94.836 Y158.26 E.04368
G1 X105.738 Y147.358 E.49579
G1 X105.738 Y147.936 E.01859
G1 X95.725 Y157.949 E.45537
G1 X96.459 Y157.793 E.02413
G1 X105.738 Y148.514 E.42199
G1 X105.738 Y149.092 E.01859
G1 X97.016 Y157.814 E.39665
G1 X97.493 Y157.915 E.01567
G1 X105.738 Y149.67 E.37497
G1 X105.738 Y150.248 E.01859
G1 X97.97 Y158.017 E.35329
G3 X98.404 Y158.16 I.056 J.56 E.01515
G1 X105.738 Y150.826 E.33354
G1 X105.738 Y151.404 E.01859
G1 X98.739 Y158.403 E.31832
G1 X99.073 Y158.647 E.01331
G1 X105.738 Y151.982 E.30309
G1 X105.738 Y152.56 E.01859
G1 X99.408 Y158.89 E.28787
G3 X99.705 Y159.171 I-.167 J.474 E.01354
G1 X105.738 Y153.138 E.27437
G1 X105.738 Y153.716 E.01859
G1 X99.917 Y159.538 E.26474
G1 X100.128 Y159.904 E.01361
G1 X105.738 Y154.294 E.25512
G1 X105.738 Y154.872 E.01859
G1 X100.34 Y160.271 E.2455
G3 X100.488 Y160.7 I-.409 J.381 E.01506
G1 X105.738 Y155.45 E.23877
G1 X105.738 Y156.028 E.01859
G1 X100.543 Y161.224 E.23627
G1 X100.598 Y161.747 E.01691
G1 X105.738 Y156.606 E.23377
G1 X105.738 Y157.184 E.01859
G1 X100.564 Y162.358 E.23529
G1 X100.286 Y163.214 E.02895
G1 X105.738 Y157.762 E.24794
G1 X105.738 Y158.34 E.01859
G1 X87.639 Y176.44 E.82309
G1 X87.639 Y177.018 E.01859
G1 X105.738 Y158.918 E.82309
G1 X105.738 Y159.496 E.01859
G1 X87.639 Y177.596 E.82309
G1 X87.639 Y178.174 E.01859
G1 X105.738 Y160.074 E.82309
G1 X105.738 Y160.652 E.01859
G1 X87.639 Y178.752 E.82309
G1 X87.639 Y179.33 E.01859
G1 X105.738 Y161.23 E.82309
G1 X105.738 Y161.808 E.01859
G1 X87.639 Y179.908 E.82309
G1 X87.639 Y180.486 E.01859
G1 X105.738 Y162.386 E.82309
G1 X105.738 Y162.964 E.01859
G1 X87.937 Y180.765 E.80952
G1 X88.515 Y180.765 E.01859
G1 X105.738 Y163.543 E.78323
G1 X105.738 Y164.121 E.01859
G1 X89.093 Y180.765 E.75694
G1 X89.671 Y180.765 E.01859
G1 X105.738 Y164.699 E.73066
G1 X105.738 Y165.277 E.01859
G1 X90.249 Y180.765 E.70437
G1 X90.827 Y180.765 E.01859
G1 X105.738 Y165.855 E.67808
G1 X105.738 Y166.433 E.01859
G1 X91.405 Y180.765 E.6518
G1 X91.983 Y180.765 E.01859
G1 X105.738 Y167.011 E.62551
G1 X105.738 Y167.589 E.01859
G1 X92.562 Y180.765 E.59922
G1 X93.14 Y180.765 E.01859
G1 X105.738 Y168.167 E.57294
G1 X105.738 Y168.745 E.01859
G1 X93.718 Y180.765 E.54665
G1 X94.296 Y180.765 E.01859
G1 X105.738 Y169.323 E.52036
G1 X105.738 Y169.901 E.01859
G1 X94.874 Y180.765 E.49408
G1 X95.452 Y180.765 E.01859
G1 X105.738 Y170.479 E.46779
G1 X105.738 Y171.057 E.01859
G1 X96.03 Y180.765 E.44151
G1 X96.608 Y180.765 E.01859
G1 X105.738 Y171.635 E.41522
G1 X105.738 Y172.213 E.01859
G1 X97.186 Y180.765 E.38893
G1 X97.764 Y180.765 E.01859
G1 X105.738 Y172.791 E.36265
G1 X105.738 Y173.369 E.01859
G1 X98.342 Y180.765 E.33636
G1 X98.92 Y180.765 E.01859
G1 X105.738 Y173.947 E.31007
G1 X105.738 Y174.525 E.01859
G1 X99.498 Y180.765 E.28379
G1 X100.076 Y180.765 E.01859
G1 X105.738 Y175.103 E.2575
G1 X105.738 Y175.681 E.01859
G1 X100.654 Y180.765 E.23121
G1 X101.232 Y180.765 E.01859
G1 X105.738 Y176.259 E.20493
G1 X105.738 Y176.837 E.01859
G1 X101.81 Y180.765 E.17864
G1 X102.388 Y180.765 E.01859
G1 X105.738 Y177.415 E.15235
G1 X105.738 Y177.993 E.01859
G1 X102.966 Y180.765 E.12607
G1 X103.544 Y180.765 E.01859
G1 X105.738 Y178.571 E.09978
G1 X105.738 Y179.149 E.01859
G1 X104.122 Y180.765 E.07349
G1 X104.7 Y180.765 E.01859
G1 X105.738 Y179.727 E.04721
G1 X105.738 Y180.305 E.01859
G1 X105.095 Y180.949 E.02925
; WIPE_START
G1 X105.738 Y180.305 E-.34567
G1 X105.738 Y179.727 E-.21965
G1 X105.376 Y180.09 E-.19468
; WIPE_END
G1 E-.04 F1800
G1 X105.515 Y172.458 Z2.5 F15000
G1 X106.086 Y141.014 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.078 Y140.849 Z2.5 F15000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y140.188 E.03004
G1 X105.738 Y139.599 E.01896
G1 X104.671 Y140.665 E.04852
G1 X104.082 Y140.665 E.01896
G1 X105.738 Y139.009 E.07533
G1 X105.738 Y138.42 E.01896
G1 X103.492 Y140.665 E.10214
G1 X102.903 Y140.665 E.01896
G1 X105.738 Y137.83 E.12895
G1 X105.738 Y137.766 E.00206
G1 X105.213 Y137.766 E.0169
G1 X102.313 Y140.665 E.13186
G1 X101.724 Y140.665 E.01896
G1 X104.623 Y137.766 E.13186
G1 X104.034 Y137.766 E.01896
G1 X101.134 Y140.665 E.13186
G1 X100.545 Y140.665 E.01896
G1 X103.444 Y137.766 E.13186
G1 X102.855 Y137.766 E.01896
G1 X99.955 Y140.665 E.13186
G1 X99.366 Y140.665 E.01896
G1 X102.265 Y137.766 E.13186
G1 X101.675 Y137.766 E.01896
G1 X98.776 Y140.665 E.13186
G1 X98.186 Y140.665 E.01896
G1 X101.086 Y137.766 E.13186
G1 X100.496 Y137.766 E.01896
G1 X97.597 Y140.665 E.13186
G1 X97.007 Y140.665 E.01896
G1 X99.907 Y137.766 E.13186
G1 X99.317 Y137.766 E.01896
G1 X96.418 Y140.665 E.13186
G1 X95.828 Y140.665 E.01896
G1 X98.728 Y137.766 E.13186
G1 X98.138 Y137.766 E.01896
G1 X95.239 Y140.665 E.13186
G1 X94.649 Y140.665 E.01896
G1 X97.549 Y137.766 E.13186
G1 X96.959 Y137.766 E.01896
G1 X94.06 Y140.665 E.13186
G1 X93.47 Y140.665 E.01896
G1 X96.37 Y137.766 E.13186
G1 X95.78 Y137.766 E.01896
G1 X92.881 Y140.665 E.13186
G1 X92.291 Y140.665 E.01896
G1 X95.191 Y137.766 E.13186
G1 X94.601 Y137.766 E.01896
G1 X91.701 Y140.665 E.13186
G1 X91.112 Y140.665 E.01896
G1 X94.011 Y137.766 E.13186
G1 X93.422 Y137.766 E.01896
G1 X90.522 Y140.665 E.13186
G1 X89.933 Y140.665 E.01896
G1 X92.832 Y137.766 E.13186
G1 X92.243 Y137.766 E.01896
G1 X89.343 Y140.665 E.13186
G1 X88.754 Y140.665 E.01896
G1 X91.653 Y137.766 E.13186
G1 X91.064 Y137.766 E.01896
G1 X88.164 Y140.665 E.13186
G1 X87.639 Y140.665 E.0169
G1 X87.639 Y140.601 E.00206
G1 X90.474 Y137.766 E.12895
G1 X89.885 Y137.766 E.01896
G1 X87.639 Y140.012 E.10214
G1 X87.639 Y139.422 E.01896
G1 X89.295 Y137.766 E.07533
G1 X88.706 Y137.766 E.01896
G1 X87.639 Y138.833 E.04852
G1 X87.639 Y138.243 E.01896
G1 X88.299 Y137.583 E.03004
; WIPE_START
G1 X87.639 Y138.243 E-.35494
G1 X87.639 Y138.833 E-.22403
G1 X87.976 Y138.496 E-.18103
; WIPE_END
G1 E-.04 F1800
G1 X91.245 Y131.599 Z2.5 F15000
G1 X99.416 Y114.367 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X100.127 Y115.598 E.04573
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04834
G1 X95.218 Y113.413 E.04834
G1 X95.953 Y113.256 E.02417
G1 X96.688 Y113.1 E.02417
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.386 Y114.315 E.00068
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.299 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X96.035 Y113.64 E.01991
G1 X96.688 Y113.501 E.01991
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52888
G1 X99.809 Y116.327 E-.23112
; WIPE_END
G1 E-.04 F1800
G1 X95.268 Y110.193 Z2.5 F15000
G1 X87.291 Y99.418 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.285 Y99.583 Z2.5 F15000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y100.229 E.02941
G1 X87.639 Y100.81 E.01866
G1 X88.683 Y99.766 E.04747
G1 X89.263 Y99.766 E.01866
G1 X87.639 Y101.39 E.07386
G1 X87.639 Y101.97 E.01866
G1 X89.843 Y99.766 E.10025
G1 X90.424 Y99.766 E.01866
G1 X87.639 Y102.551 E.12665
G1 X87.639 Y103.131 E.01866
G1 X91.004 Y99.766 E.15304
G1 X91.584 Y99.766 E.01866
G1 X87.639 Y103.712 E.17943
G1 X87.639 Y104.292 E.01866
G1 X92.165 Y99.766 E.20582
G1 X92.745 Y99.766 E.01866
G1 X87.639 Y104.872 E.23222
G1 X87.639 Y105.453 E.01866
G1 X93.325 Y99.766 E.25861
G1 X93.906 Y99.766 E.01866
G1 X87.639 Y106.033 E.285
G1 X87.639 Y106.613 E.01866
G1 X94.486 Y99.766 E.31139
G1 X95.067 Y99.766 E.01866
G1 X87.639 Y107.194 E.33779
G1 X87.639 Y107.774 E.01866
G1 X95.647 Y99.766 E.36418
G1 X96.227 Y99.766 E.01866
G1 X87.639 Y108.354 E.39057
G1 X87.639 Y108.935 E.01866
G1 X96.808 Y99.766 E.41697
G1 X97.388 Y99.766 E.01866
G1 X87.639 Y109.515 E.44336
G1 X87.639 Y110.096 E.01866
G1 X97.968 Y99.766 E.46975
G1 X98.549 Y99.766 E.01866
G1 X87.639 Y110.676 E.49614
G1 X87.639 Y111.256 E.01866
G1 X99.129 Y99.766 E.52254
G1 X99.709 Y99.766 E.01866
G1 X87.639 Y111.837 E.54893
G1 X87.639 Y112.417 E.01866
G1 X100.29 Y99.766 E.57532
G1 X100.87 Y99.766 E.01866
G1 X87.639 Y112.997 E.60171
G1 X87.639 Y113.578 E.01866
G1 X101.451 Y99.766 E.62811
G1 X102.031 Y99.766 E.01866
G1 X87.639 Y114.158 E.6545
G1 X87.639 Y114.738 E.01866
G1 X102.611 Y99.766 E.68089
G1 X103.192 Y99.766 E.01866
G1 X87.639 Y115.319 E.70728
G1 X87.639 Y115.899 E.01866
G1 X103.772 Y99.766 E.73368
G1 X104.352 Y99.766 E.01866
G1 X87.639 Y116.48 E.76007
G1 X87.639 Y117.06 E.01866
G1 X104.933 Y99.766 E.78646
G1 X105.513 Y99.766 E.01866
G1 X87.639 Y117.64 E.81286
G1 X87.639 Y118.221 E.01866
G1 X105.738 Y100.121 E.82309
G1 X105.738 Y100.701 E.01866
G1 X87.639 Y118.801 E.82309
G1 X87.639 Y119.381 E.01866
G1 X105.738 Y101.282 E.82309
G1 X105.738 Y101.862 E.01866
G1 X87.456 Y120.145 E.83142
; WIPE_START
G1 X88.87 Y118.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.008 Y126.314 Z2.5 F15000
G1 X87.456 Y131.172 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F7800
G1 X98.439 Y120.189 E.49947
G1 X97.447 Y120.6 E.03453
G1 X87.639 Y130.408 E.44603
G1 X87.639 Y129.828 E.01866
G1 X96.866 Y120.6 E.41963
G1 X96.286 Y120.6 E.01866
G1 X87.639 Y129.248 E.39324
G1 X87.639 Y128.667 E.01866
G1 X95.754 Y120.552 E.36905
G1 X95.352 Y120.373 E.01414
G1 X87.639 Y128.087 E.35079
G1 X87.639 Y127.506 E.01866
G1 X94.951 Y120.194 E.33253
G1 X94.549 Y120.016 E.01414
G1 X87.639 Y126.926 E.31426
M73 P66 R14
G1 X87.639 Y126.346 E.01866
G1 X94.213 Y119.772 E.29896
G1 X93.938 Y119.466 E.01321
G1 X87.639 Y125.765 E.28646
G1 X87.639 Y125.185 E.01866
G1 X93.663 Y119.161 E.27395
G1 X93.388 Y118.856 E.01321
G1 X87.639 Y124.605 E.26145
G1 X87.639 Y124.024 E.01866
G1 X93.179 Y118.484 E.25193
G1 X93.036 Y118.046 E.01481
G1 X87.639 Y123.444 E.24546
G1 X87.639 Y122.864 E.01866
G1 X92.894 Y117.608 E.23899
G1 X92.752 Y117.17 E.01481
G1 X87.639 Y122.283 E.23251
G1 X87.639 Y121.703 E.01866
G1 X92.801 Y116.541 E.23475
G1 X92.869 Y115.892 E.02097
G1 X87.639 Y121.122 E.23785
G1 X87.639 Y120.542 E.01866
G1 X93.211 Y114.97 E.25339
G1 X93.737 Y114.058 E.03386
G1 X95.099 Y113.082 E.05387
G1 X105.738 Y102.443 E.48385
G1 X105.738 Y103.023 E.01866
G1 X95.836 Y112.926 E.45033
G1 X96.573 Y112.769 E.02423
G1 X105.738 Y103.603 E.41681
G1 X105.738 Y104.184 E.01866
G1 X97.092 Y112.83 E.3932
G1 X97.571 Y112.932 E.01573
G1 X105.738 Y104.764 E.37143
G1 X105.738 Y105.344 E.01866
G1 X98.049 Y113.033 E.34967
G3 X98.461 Y113.202 I.017 J.547 E.01474
G1 X105.738 Y105.925 E.33093
G1 X105.738 Y106.505 E.01866
G1 X98.797 Y113.446 E.31565
G1 X99.133 Y113.69 E.01336
G1 X105.738 Y107.085 E.30036
G1 X105.738 Y107.666 E.01866
G1 X99.47 Y113.935 E.28507
G3 X99.745 Y114.24 I-.205 J.462 E.01361
G1 X105.738 Y108.246 E.27256
G1 X105.738 Y108.827 E.01866
G1 X99.957 Y114.608 E.2629
G1 X100.17 Y114.976 E.01366
G1 X105.738 Y109.407 E.25324
G1 X105.738 Y109.987 E.01866
G1 X100.382 Y115.344 E.24358
G3 X100.499 Y115.807 I-.462 J.363 E.01582
G1 X105.738 Y110.568 E.23826
G1 X105.738 Y111.148 E.01866
G1 X100.554 Y116.332 E.23575
G1 X100.609 Y116.857 E.01698
G1 X105.738 Y111.728 E.23324
G1 X105.738 Y112.309 E.01866
G1 X100.504 Y117.543 E.23802
G1 X100.225 Y118.402 E.02907
G1 X105.738 Y112.889 E.25072
G1 X105.738 Y113.47 E.01866
G1 X87.639 Y131.569 E.82309
G1 X87.639 Y132.149 E.01866
G1 X105.738 Y114.05 E.82309
G1 X105.738 Y114.63 E.01866
G1 X87.639 Y132.73 E.82309
G1 X87.639 Y133.31 E.01866
G1 X105.738 Y115.211 E.82309
G1 X105.738 Y115.791 E.01866
G1 X87.864 Y133.665 E.81286
G1 X88.444 Y133.665 E.01866
G1 X105.738 Y116.371 E.78647
G1 X105.738 Y116.952 E.01866
G1 X89.024 Y133.665 E.76008
G1 X89.605 Y133.665 E.01866
G1 X105.738 Y117.532 E.73368
G1 X105.738 Y118.112 E.01866
G1 X90.185 Y133.665 E.70729
G1 X90.766 Y133.665 E.01866
G1 X105.738 Y118.693 E.6809
G1 X105.738 Y119.273 E.01866
G1 X91.346 Y133.665 E.6545
G1 X91.926 Y133.665 E.01866
G1 X105.738 Y119.854 E.62811
G1 X105.738 Y120.434 E.01866
G1 X92.507 Y133.665 E.60172
G1 X93.087 Y133.665 E.01866
G1 X105.738 Y121.014 E.57533
G1 X105.738 Y121.595 E.01866
G1 X93.667 Y133.665 E.54893
G1 X94.248 Y133.665 E.01866
G1 X105.738 Y122.175 E.52254
G1 X105.738 Y122.755 E.01866
G1 X94.828 Y133.665 E.49615
G1 X95.408 Y133.665 E.01866
G1 X105.738 Y123.336 E.46976
G1 X105.738 Y123.916 E.01866
G1 X95.989 Y133.665 E.44336
G1 X96.569 Y133.665 E.01866
G1 X105.738 Y124.496 E.41697
G1 X105.738 Y125.077 E.01866
G1 X97.15 Y133.665 E.39058
G1 X97.73 Y133.665 E.01866
G1 X105.738 Y125.657 E.36419
G1 X105.738 Y126.238 E.01866
G1 X98.31 Y133.665 E.33779
G1 X98.891 Y133.665 E.01866
G1 X105.738 Y126.818 E.3114
G1 X105.738 Y127.398 E.01866
G1 X99.471 Y133.665 E.28501
G1 X100.051 Y133.665 E.01866
G1 X105.738 Y127.979 E.25861
G1 X105.738 Y128.559 E.01866
G1 X100.632 Y133.665 E.23222
G1 X101.212 Y133.665 E.01866
G1 X105.738 Y129.139 E.20583
G1 X105.738 Y129.72 E.01866
G1 X101.793 Y133.665 E.17944
G1 X102.373 Y133.665 E.01866
G1 X105.738 Y130.3 E.15304
G1 X105.738 Y130.88 E.01866
G1 X102.953 Y133.665 E.12665
G1 X103.534 Y133.665 E.01866
G1 X105.738 Y131.461 E.10026
G1 X105.738 Y132.041 E.01866
G1 X104.114 Y133.665 E.07387
G1 X104.694 Y133.665 E.01866
G1 X105.738 Y132.622 E.04747
G1 X105.738 Y133.202 E.01866
G1 X105.092 Y133.849 E.02941
; WIPE_START
G1 X105.738 Y133.202 E-.34756
G1 X105.738 Y132.622 E-.22054
G1 X105.381 Y132.979 E-.1919
; WIPE_END
G1 E-.04 F1800
G1 X102.026 Y126.123 Z2.5 F15000
G1 X87.291 Y96.014 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.299 Y92.583 Z2.5 F15000
G1 Z2.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y93.243 E.03004
G1 X87.639 Y93.833 E.01896
G1 X88.706 Y92.766 E.04852
G1 X89.295 Y92.766 E.01896
G1 X87.639 Y94.422 E.07533
G1 X87.639 Y95.012 E.01896
G1 X89.885 Y92.766 E.10214
G1 X90.474 Y92.766 E.01896
G1 X87.639 Y95.601 E.12895
G1 X87.639 Y95.665 E.00206
G1 X88.164 Y95.665 E.0169
G1 X91.064 Y92.766 E.13186
G1 X91.653 Y92.766 E.01896
G1 X88.754 Y95.665 E.13186
G1 X89.343 Y95.665 E.01896
G1 X92.243 Y92.766 E.13186
G1 X92.832 Y92.766 E.01896
G1 X89.933 Y95.665 E.13186
G1 X90.522 Y95.665 E.01896
G1 X93.422 Y92.766 E.13186
G1 X94.011 Y92.766 E.01896
G1 X91.112 Y95.665 E.13186
G1 X91.701 Y95.665 E.01896
G1 X94.601 Y92.766 E.13186
G1 X95.191 Y92.766 E.01896
G1 X92.291 Y95.665 E.13186
G1 X92.881 Y95.665 E.01896
G1 X95.78 Y92.766 E.13186
G1 X96.37 Y92.766 E.01896
G1 X93.47 Y95.665 E.13186
G1 X94.06 Y95.665 E.01896
G1 X96.959 Y92.766 E.13186
G1 X97.549 Y92.766 E.01896
G1 X94.649 Y95.665 E.13186
G1 X95.239 Y95.665 E.01896
G1 X98.138 Y92.766 E.13186
G1 X98.728 Y92.766 E.01896
G1 X95.828 Y95.665 E.13186
G1 X96.418 Y95.665 E.01896
G1 X99.317 Y92.766 E.13186
G1 X99.907 Y92.766 E.01896
G1 X97.007 Y95.665 E.13186
G1 X97.597 Y95.665 E.01896
G1 X100.496 Y92.766 E.13186
G1 X101.086 Y92.766 E.01896
G1 X98.186 Y95.665 E.13186
G1 X98.776 Y95.665 E.01896
G1 X101.676 Y92.766 E.13186
G1 X102.265 Y92.766 E.01896
G1 X99.366 Y95.665 E.13186
G1 X99.955 Y95.665 E.01896
G1 X102.855 Y92.766 E.13186
G1 X103.444 Y92.766 E.01896
G1 X100.545 Y95.665 E.13186
G1 X101.134 Y95.665 E.01896
G1 X104.034 Y92.766 E.13186
G1 X104.623 Y92.766 E.01896
G1 X101.724 Y95.665 E.13186
G1 X102.313 Y95.665 E.01896
G1 X105.213 Y92.766 E.13186
G1 X105.738 Y92.766 E.0169
G1 X105.738 Y92.83 E.00206
G1 X102.903 Y95.665 E.12895
G1 X103.492 Y95.665 E.01896
G1 X105.738 Y93.42 E.10214
G1 X105.738 Y94.009 E.01896
G1 X104.082 Y95.665 E.07533
G1 X104.671 Y95.665 E.01896
G1 X105.738 Y94.599 E.04852
G1 X105.738 Y95.188 E.01896
G1 X105.078 Y95.849 E.03004
; WIPE_START
G1 X105.738 Y95.188 E-.35495
G1 X105.738 Y94.599 E-.22403
G1 X105.401 Y94.935 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X102.515 Y87.87 Z2.5 F15000
G1 X97.359 Y75.252 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X95.937 Y75.252 E.04573
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X95.953 Y68.256 E.02417
G1 X96.688 Y68.1 E.02417
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04835
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.419 Y75.252 E.00068
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X96.035 Y68.64 E.01991
G1 X96.688 Y68.501 E.01991
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X91.697 Y81.25 Z2.5 F15000
G1 X87.291 Y89.014 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.255 Y79.779 Z2.5 F15000
G1 X87.456 Y74.696 Z2.5
G1 Z2.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y56.414 E.83142
G1 X105.738 Y55.836 E.01859
G1 X87.639 Y73.935 E.82309
G1 X87.639 Y73.357 E.01859
G1 X105.738 Y55.258 E.82309
G1 X105.738 Y54.68 E.01859
G1 X87.639 Y72.779 E.82309
G1 X87.639 Y72.201 E.01859
G1 X105.738 Y54.102 E.82309
G1 X105.738 Y53.524 E.01859
G1 X87.639 Y71.623 E.82309
G1 X87.639 Y71.045 E.01859
G1 X105.738 Y52.945 E.82309
G1 X105.738 Y52.666 E.00899
G1 X105.44 Y52.666 E.0096
G1 X87.639 Y70.467 E.80952
G1 X87.639 Y69.889 E.01859
G1 X104.862 Y52.666 E.78324
G1 X104.284 Y52.666 E.01859
G1 X87.639 Y69.311 E.75695
G1 X87.639 Y68.733 E.01859
G1 X103.706 Y52.666 E.73066
G1 X103.128 Y52.666 E.01859
G1 X87.639 Y68.155 E.70438
G1 X87.639 Y67.577 E.01859
G1 X102.55 Y52.666 E.67809
G1 X101.972 Y52.666 E.01859
G1 X87.639 Y66.999 E.6518
G1 X87.639 Y66.421 E.01859
G1 X101.394 Y52.666 E.62552
G1 X100.816 Y52.666 E.01859
G1 X87.639 Y65.843 E.59923
G1 X87.639 Y65.265 E.01859
G1 X100.238 Y52.666 E.57294
G1 X99.659 Y52.666 E.01859
G1 X87.639 Y64.687 E.54666
G1 X87.639 Y64.109 E.01859
G1 X99.081 Y52.666 E.52037
G1 X98.503 Y52.666 E.01859
G1 X87.639 Y63.531 E.49408
G1 X87.639 Y62.953 E.01859
G1 X97.925 Y52.666 E.4678
G1 X97.347 Y52.666 E.01859
M73 P66 R13
G1 X87.639 Y62.375 E.44151
G1 X87.639 Y61.797 E.01859
G1 X96.769 Y52.666 E.41522
G1 X96.191 Y52.666 E.01859
G1 X87.639 Y61.219 E.38894
G1 X87.639 Y60.64 E.01859
G1 X95.613 Y52.666 E.36265
G1 X95.035 Y52.666 E.01859
G1 X87.639 Y60.062 E.33636
G1 X87.639 Y59.484 E.01859
G1 X94.457 Y52.666 E.31008
G1 X93.879 Y52.666 E.01859
G1 X87.639 Y58.906 E.28379
G1 X87.639 Y58.328 E.01859
G1 X93.301 Y52.666 E.2575
G1 X92.723 Y52.666 E.01859
G1 X87.639 Y57.75 E.23122
G1 X87.639 Y57.172 E.01859
G1 X92.145 Y52.666 E.20493
G1 X91.567 Y52.666 E.01859
G1 X87.639 Y56.594 E.17865
G1 X87.639 Y56.016 E.01859
G1 X90.989 Y52.666 E.15236
G1 X90.411 Y52.666 E.01859
G1 X87.639 Y55.438 E.12607
G1 X87.639 Y54.86 E.01859
G1 X89.833 Y52.666 E.09979
G1 X89.255 Y52.666 E.01859
G1 X87.639 Y54.282 E.0735
G1 X87.639 Y53.704 E.01859
G1 X88.677 Y52.666 E.04721
G1 X88.099 Y52.666 E.01859
G1 X87.456 Y53.309 E.02926
; WIPE_START
G1 X88.099 Y52.666 E-.34573
G1 X88.677 Y52.666 E-.21966
G1 X88.315 Y53.028 E-.19461
; WIPE_END
G1 E-.04 F1800
G1 X94.258 Y57.816 Z2.5 F15000
G1 X105.921 Y67.213 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F7800
G1 X100.462 Y72.672 E.24826
G1 X100.638 Y72.131 E.01831
G1 X100.618 Y71.939 E.00622
G1 X105.738 Y66.818 E.23285
G1 X105.738 Y66.24 E.01859
G1 X100.563 Y71.415 E.23535
G1 X100.508 Y70.892 E.01691
G1 X105.738 Y65.662 E.23785
G1 X105.738 Y65.084 E.01859
G1 X100.417 Y70.405 E.24197
G1 X100.206 Y70.039 E.01361
G1 X105.738 Y64.506 E.25159
G1 X105.738 Y63.928 E.01859
G1 X99.994 Y69.672 E.26121
G1 X99.783 Y69.306 E.01361
M73 P67 R13
G1 X105.738 Y63.35 E.27084
G1 X105.738 Y62.772 E.01859
G1 X99.531 Y68.979 E.28228
G1 X99.196 Y68.736 E.01331
G1 X105.738 Y62.194 E.2975
G1 X105.738 Y61.616 E.01859
G1 X98.861 Y68.493 E.31273
G1 X98.527 Y68.25 E.01331
G1 X105.738 Y61.038 E.32795
G1 X105.738 Y60.46 E.01859
G1 X98.144 Y68.054 E.34534
G1 X97.668 Y67.952 E.01567
G1 X105.738 Y59.882 E.36701
G1 X105.738 Y59.304 E.01859
G1 X97.191 Y67.851 E.38869
G1 X96.714 Y67.75 E.01567
G1 X105.738 Y58.726 E.41037
G1 X105.738 Y58.148 E.01859
G1 X95.994 Y67.892 E.44312
G1 X95.26 Y68.048 E.02413
G1 X105.738 Y57.57 E.4765
G1 X105.738 Y56.992 E.01859
G1 X87.639 Y75.091 E.82309
G1 X87.639 Y75.669 E.01859
G1 X93.037 Y70.271 E.24549
G2 X92.854 Y71.032 I.763 J.585 E.02591
G1 X87.639 Y76.247 E.23718
G1 X87.639 Y76.825 E.01859
G1 X92.786 Y71.678 E.2341
G2 X92.781 Y72.261 I.652 J.298 E.01932
G1 X87.639 Y77.403 E.23385
G1 X87.639 Y77.981 E.01859
G1 X92.923 Y72.697 E.2403
G1 X93.065 Y73.134 E.01475
G1 X87.639 Y78.559 E.24675
G1 X87.639 Y79.137 E.01859
G1 X93.206 Y73.57 E.25319
G2 X93.44 Y73.914 I.503 J-.091 E.01378
G1 X87.639 Y79.716 E.26384
G1 X87.639 Y80.294 E.01859
G1 X93.714 Y74.218 E.27629
G1 X93.988 Y74.522 E.01316
G1 X87.639 Y80.872 E.28875
G1 X87.639 Y81.45 E.01859
G1 X94.262 Y74.826 E.3012
G2 X94.62 Y75.047 I.426 J-.291 E.01391
G1 X87.639 Y82.028 E.31746
G1 X87.639 Y82.606 E.01859
G1 X95.019 Y75.225 E.33565
G1 X95.419 Y75.403 E.01408
G1 X87.639 Y83.184 E.35384
G1 X87.639 Y83.762 E.01859
G1 X95.819 Y75.581 E.37202
G1 X96.378 Y75.6 E.01798
G1 X87.639 Y84.34 E.39743
G1 X87.639 Y84.918 E.01859
G1 X96.956 Y75.6 E.42372
G1 X97.55 Y75.584 E.01911
G1 X87.639 Y85.496 E.45073
G1 X87.639 Y86.074 E.01859
G1 X105.738 Y67.974 E.82309
G1 X105.738 Y68.552 E.01859
G1 X87.639 Y86.652 E.82309
G1 X87.639 Y87.23 E.01859
G1 X105.738 Y69.13 E.82309
G1 X105.738 Y69.708 E.01859
G1 X87.639 Y87.808 E.82309
G1 X87.639 Y88.386 E.01859
G1 X105.738 Y70.286 E.82309
G1 X105.738 Y70.864 E.01859
G1 X87.937 Y88.665 E.80952
G1 X88.515 Y88.665 E.01859
G1 X105.738 Y71.442 E.78323
G1 X105.738 Y72.021 E.01859
G1 X89.093 Y88.665 E.75694
G1 X89.671 Y88.665 E.01859
G1 X105.738 Y72.599 E.73066
G1 X105.738 Y73.177 E.01859
G1 X90.249 Y88.665 E.70437
G1 X90.827 Y88.665 E.01859
G1 X105.738 Y73.755 E.67808
G1 X105.738 Y74.333 E.01859
G1 X91.405 Y88.665 E.6518
G1 X91.983 Y88.665 E.01859
G1 X105.738 Y74.911 E.62551
G1 X105.738 Y75.489 E.01859
G1 X92.562 Y88.665 E.59923
G1 X93.14 Y88.665 E.01859
G1 X105.738 Y76.067 E.57294
G1 X105.738 Y76.645 E.01859
G1 X93.718 Y88.665 E.54665
G1 X94.296 Y88.665 E.01859
G1 X105.738 Y77.223 E.52037
G1 X105.738 Y77.801 E.01859
G1 X94.874 Y88.665 E.49408
G1 X95.452 Y88.665 E.01859
G1 X105.738 Y78.379 E.46779
G1 X105.738 Y78.957 E.01859
G1 X96.03 Y88.665 E.44151
G1 X96.608 Y88.665 E.01859
G1 X105.738 Y79.535 E.41522
G1 X105.738 Y80.113 E.01859
G1 X97.186 Y88.665 E.38893
G1 X97.764 Y88.665 E.01859
G1 X105.738 Y80.691 E.36265
G1 X105.738 Y81.269 E.01859
G1 X98.342 Y88.665 E.33636
G1 X98.92 Y88.665 E.01859
G1 X105.738 Y81.847 E.31007
G1 X105.738 Y82.425 E.01859
G1 X99.498 Y88.665 E.28379
G1 X100.076 Y88.665 E.01859
G1 X105.738 Y83.003 E.2575
G1 X105.738 Y83.581 E.01859
G1 X100.654 Y88.665 E.23121
G1 X101.232 Y88.665 E.01859
G1 X105.738 Y84.159 E.20493
G1 X105.738 Y84.737 E.01859
G1 X101.81 Y88.665 E.17864
G1 X102.388 Y88.665 E.01859
G1 X105.738 Y85.315 E.15235
G1 X105.738 Y85.893 E.01859
G1 X102.966 Y88.665 E.12607
G1 X103.544 Y88.665 E.01859
G1 X105.738 Y86.471 E.09978
G1 X105.738 Y87.049 E.01859
G1 X104.122 Y88.665 E.07349
G1 X104.7 Y88.665 E.01859
G1 X105.738 Y87.627 E.04721
G1 X105.738 Y88.205 E.01859
G1 X105.095 Y88.849 E.02925
; CHANGE_LAYER
; Z_HEIGHT: 2.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X105.738 Y88.205 E-.34567
G1 X105.738 Y87.627 E-.21965
G1 X105.376 Y87.99 E-.19468
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 11/20
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z2.5 I1.217 J0 P1  F15000
; object ids of layer 11 start: 178
M624 AgAAAAAAAAA=
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
; object ids of this layer11 end: 178
M625
; OBJECT_ID: 178
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X98.868 Y164.58
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X98.814 Y164.641 E.00263
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04834
G1 X95.892 Y158.269 E.02217
G1 X96.688 Y158.1 E.02618
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04834
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.908 Y164.535 E.04379
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X95.974 Y158.653 E.01805
G1 X96.688 Y158.501 E.02177
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X93.544 Y157.933 Z2.7 F15000
G1 X87.291 Y144.418 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.508 Y144.674 Z2.7 F15000
G1 X105.921 Y145.409 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.278 Y144.766 E.02925
G1 X104.7 Y144.766 E.01859
G1 X105.738 Y145.804 E.04721
G1 X105.738 Y146.382 E.01859
G1 X104.122 Y144.766 E.07349
G1 X103.544 Y144.766 E.01859
G1 X105.738 Y146.96 E.09978
G1 X105.738 Y147.538 E.01859
G1 X102.966 Y144.766 E.12607
G1 X102.388 Y144.766 E.01859
G1 X105.738 Y148.116 E.15235
G1 X105.738 Y148.694 E.01859
G1 X101.81 Y144.766 E.17864
G1 X101.232 Y144.766 E.01859
G1 X105.738 Y149.272 E.20493
G1 X105.738 Y149.85 E.01859
G1 X100.654 Y144.766 E.23121
G1 X100.076 Y144.766 E.01859
G1 X105.738 Y150.428 E.2575
G1 X105.738 Y151.006 E.01859
G1 X99.498 Y144.766 E.28379
G1 X98.92 Y144.766 E.01859
G1 X105.738 Y151.584 E.31007
G1 X105.738 Y152.162 E.01859
G1 X98.342 Y144.766 E.33636
G1 X97.764 Y144.766 E.01859
G1 X105.738 Y152.74 E.36265
G1 X105.738 Y153.318 E.01859
G1 X97.186 Y144.766 E.38893
G1 X96.608 Y144.766 E.01859
G1 X105.738 Y153.896 E.41522
G1 X105.738 Y154.474 E.01859
G1 X96.03 Y144.766 E.44151
G1 X95.452 Y144.766 E.01859
G1 X105.738 Y155.052 E.46779
G1 X105.738 Y155.631 E.01859
G1 X94.874 Y144.766 E.49408
G1 X94.296 Y144.766 E.01859
G1 X105.738 Y156.209 E.52037
G1 X105.738 Y156.787 E.01859
G1 X93.718 Y144.766 E.54665
G1 X93.14 Y144.766 E.01859
G1 X105.738 Y157.365 E.57294
G1 X105.738 Y157.943 E.01859
G1 X92.562 Y144.766 E.59923
G1 X91.983 Y144.766 E.01859
G1 X105.738 Y158.521 E.62551
G1 X105.738 Y159.099 E.01859
G1 X91.405 Y144.766 E.6518
G1 X90.827 Y144.766 E.01859
G1 X105.738 Y159.677 E.67808
G1 X105.738 Y160.255 E.01859
G1 X90.249 Y144.766 E.70437
G1 X89.671 Y144.766 E.01859
G1 X105.738 Y160.833 E.73066
G1 X105.738 Y161.411 E.01859
G1 X89.093 Y144.766 E.75694
G1 X88.515 Y144.766 E.01859
G1 X105.738 Y161.989 E.78323
G1 X105.738 Y162.567 E.01859
G1 X87.937 Y144.766 E.80952
G1 X87.639 Y144.766 E.0096
G1 X87.639 Y145.045 E.00899
G1 X105.738 Y163.145 E.82309
G1 X105.738 Y163.723 E.01859
G1 X87.639 Y145.623 E.8231
G1 X87.639 Y146.201 E.01859
G1 X105.738 Y164.301 E.8231
G1 X105.738 Y164.879 E.01859
G1 X87.639 Y146.779 E.8231
G1 X87.639 Y147.358 E.01859
G1 X98.541 Y158.26 E.49581
G1 X98.304 Y158.088 E.00945
G1 X97.652 Y157.949 E.02142
G1 X87.639 Y147.936 E.45538
G1 X87.639 Y148.514 E.01859
G1 X96.918 Y157.793 E.42199
G2 X96.361 Y157.814 I-.255 J.636 E.01847
G1 X87.639 Y149.092 E.39665
G1 X87.639 Y149.67 E.01859
G1 X95.884 Y157.915 E.37497
G1 X95.408 Y158.017 E.01567
G1 X87.639 Y150.248 E.3533
G1 X87.639 Y150.826 E.01859
G1 X94.973 Y158.16 E.33354
G1 X94.638 Y158.403 E.01331
G1 X87.639 Y151.404 E.31832
G1 X87.639 Y151.982 E.01859
G1 X94.304 Y158.647 E.30309
G1 X93.969 Y158.89 E.01331
G1 X87.639 Y152.56 E.28787
G1 X87.639 Y153.138 E.01859
G1 X93.672 Y159.171 E.27437
G1 X93.46 Y159.538 E.01361
G1 X87.639 Y153.716 E.26475
G1 X87.639 Y154.294 E.01859
G1 X93.249 Y159.904 E.25513
G1 X93.037 Y160.27 E.01361
G1 X87.639 Y154.872 E.2455
G1 X87.639 Y155.45 E.01859
G1 X92.889 Y160.7 E.23877
G1 X92.834 Y161.223 E.01691
G1 X87.639 Y156.028 E.23627
G1 X87.639 Y156.606 E.01859
G1 X92.779 Y161.746 E.23377
G2 X92.813 Y162.358 I.703 J.268 E.02028
G1 X87.639 Y157.184 E.23529
G1 X87.639 Y157.762 E.01859
G1 X93.091 Y163.214 E.24794
G1 X93.249 Y163.701 E.01647
G1 X94.354 Y164.929 E.0531
G1 X95.167 Y165.291 E.02863
G1 X105.738 Y175.862 E.48072
G1 X105.738 Y175.284 E.01859
G1 X96.055 Y165.6 E.44035
G1 X96.633 Y165.6 E.01859
G1 X105.738 Y174.706 E.41407
G1 X105.738 Y174.128 E.01859
G1 X97.211 Y165.6 E.38778
G2 X97.704 Y165.516 I.152 J-.596 E.01658
G1 X105.738 Y173.55 E.36535
G1 X105.738 Y172.971 E.01859
G1 X98.104 Y165.338 E.34716
G1 X98.504 Y165.16 E.01408
G1 X105.738 Y172.393 E.32897
G1 X105.738 Y171.815 E.01859
G1 X98.904 Y164.981 E.31078
G2 X99.216 Y164.715 I-.144 J-.483 E.01358
G1 X105.738 Y171.237 E.29663
G1 X105.738 Y170.659 E.01859
G1 X99.489 Y164.41 E.28417
G1 X99.763 Y164.106 E.01316
G1 X105.738 Y170.081 E.27172
G1 X105.738 Y169.503 E.01859
G1 X100.037 Y163.802 E.25926
G2 X100.223 Y163.41 I-.348 J-.405 E.01438
G1 X105.738 Y168.925 E.25083
G1 X105.738 Y168.347 E.01859
G1 X100.364 Y162.973 E.24438
G1 X100.506 Y162.537 E.01475
G1 X105.738 Y167.769 E.23793
G1 X105.738 Y167.191 E.01859
G1 X100.634 Y162.086 E.23214
G1 X100.566 Y161.441 E.02088
G1 X105.738 Y166.613 E.23523
G1 X105.738 Y166.035 E.01859
G1 X100.498 Y160.795 E.23832
G1 X100.466 Y160.488 E.0099
G1 X100.05 Y159.769 E.02671
G1 X105.921 Y165.64 E.267
; WIPE_START
G1 X104.507 Y164.226 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.372 Y171.809 Z2.7 F15000
G1 X105.921 Y176.623 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F7800
G1 X87.639 Y158.34 E.83143
G1 X87.639 Y158.918 E.01859
G1 X105.738 Y177.018 E.8231
G1 X105.738 Y177.596 E.01859
G1 X87.639 Y159.496 E.8231
G1 X87.639 Y160.074 E.01859
G1 X105.738 Y178.174 E.8231
G1 X105.738 Y178.752 E.01859
G1 X87.639 Y160.652 E.82309
G1 X87.639 Y161.23 E.01859
G1 X105.738 Y179.33 E.8231
G1 X105.738 Y179.908 E.01859
G1 X87.639 Y161.808 E.8231
G1 X87.639 Y162.386 E.01859
G1 X105.738 Y180.486 E.8231
G1 X105.738 Y180.765 E.00899
G1 X105.44 Y180.765 E.0096
G1 X87.639 Y162.964 E.80952
G1 X87.639 Y163.542 E.01859
G1 X104.862 Y180.765 E.78324
G1 X104.284 Y180.765 E.01859
G1 X87.639 Y164.12 E.75695
G1 X87.639 Y164.698 E.01859
G1 X103.706 Y180.765 E.73066
G1 X103.128 Y180.765 E.01859
G1 X87.639 Y165.276 E.70438
G1 X87.639 Y165.855 E.01859
G1 X102.55 Y180.765 E.67809
G1 X101.972 Y180.765 E.01859
G1 X87.639 Y166.433 E.6518
G1 X87.639 Y167.011 E.01859
G1 X101.394 Y180.765 E.62552
G1 X100.816 Y180.765 E.01859
G1 X87.639 Y167.589 E.59923
G1 X87.639 Y168.167 E.01859
G1 X100.238 Y180.765 E.57294
G1 X99.659 Y180.765 E.01859
G1 X87.639 Y168.745 E.54666
G1 X87.639 Y169.323 E.01859
G1 X99.081 Y180.765 E.52037
G1 X98.503 Y180.765 E.01859
G1 X87.639 Y169.901 E.49408
G1 X87.639 Y170.479 E.01859
G1 X97.925 Y180.765 E.4678
G1 X97.347 Y180.765 E.01859
G1 X87.639 Y171.057 E.44151
G1 X87.639 Y171.635 E.01859
G1 X96.769 Y180.765 E.41522
G1 X96.191 Y180.765 E.01859
G1 X87.639 Y172.213 E.38894
G1 X87.639 Y172.791 E.01859
M73 P68 R13
G1 X95.613 Y180.765 E.36265
G1 X95.035 Y180.765 E.01859
G1 X87.639 Y173.369 E.33636
G1 X87.639 Y173.947 E.01859
G1 X94.457 Y180.765 E.31008
G1 X93.879 Y180.765 E.01859
G1 X87.639 Y174.525 E.28379
G1 X87.639 Y175.103 E.01859
G1 X93.301 Y180.765 E.2575
G1 X92.723 Y180.765 E.01859
G1 X87.639 Y175.681 E.23122
G1 X87.639 Y176.259 E.01859
G1 X92.145 Y180.765 E.20493
G1 X91.567 Y180.765 E.01859
G1 X87.639 Y176.837 E.17865
G1 X87.639 Y177.415 E.01859
G1 X90.989 Y180.765 E.15236
G1 X90.411 Y180.765 E.01859
G1 X87.639 Y177.993 E.12607
G1 X87.639 Y178.571 E.01859
G1 X89.833 Y180.765 E.09979
G1 X89.255 Y180.765 E.01859
G1 X87.639 Y179.149 E.0735
G1 X87.639 Y179.727 E.01859
G1 X88.677 Y180.765 E.04721
G1 X88.099 Y180.765 E.01859
G1 X87.456 Y180.122 E.02926
; WIPE_START
G1 X88.099 Y180.765 E-.34573
G1 X88.677 Y180.765 E-.21965
G1 X88.315 Y180.403 E-.19462
; WIPE_END
G1 E-.04 F1800
G1 X91.454 Y173.446 Z2.7 F15000
G1 X106.086 Y141.014 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.921 Y138.426 Z2.7 F15000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.261 Y137.766 E.03004
G1 X104.671 Y137.766 E.01896
G1 X105.738 Y138.833 E.04852
G1 X105.738 Y139.422 E.01896
G1 X104.082 Y137.766 E.07533
G1 X103.492 Y137.766 E.01896
G1 X105.738 Y140.012 E.10214
G1 X105.738 Y140.601 E.01896
G1 X102.903 Y137.766 E.12895
G1 X102.313 Y137.766 E.01896
G1 X105.213 Y140.665 E.13186
G1 X104.623 Y140.665 E.01896
G1 X101.724 Y137.766 E.13186
G1 X101.134 Y137.766 E.01896
G1 X104.034 Y140.665 E.13186
G1 X103.444 Y140.665 E.01896
G1 X100.545 Y137.766 E.13186
G1 X99.955 Y137.766 E.01896
G1 X102.855 Y140.665 E.13186
G1 X102.265 Y140.665 E.01896
G1 X99.366 Y137.766 E.13186
G1 X98.776 Y137.766 E.01896
G1 X101.676 Y140.665 E.13186
G1 X101.086 Y140.665 E.01896
G1 X98.186 Y137.766 E.13186
G1 X97.597 Y137.766 E.01896
G1 X100.496 Y140.665 E.13186
G1 X99.907 Y140.665 E.01896
G1 X97.007 Y137.766 E.13186
G1 X96.418 Y137.766 E.01896
G1 X99.317 Y140.665 E.13186
G1 X98.728 Y140.665 E.01896
G1 X95.828 Y137.766 E.13186
G1 X95.239 Y137.766 E.01896
G1 X98.138 Y140.665 E.13186
G1 X97.549 Y140.665 E.01896
G1 X94.649 Y137.766 E.13186
G1 X94.06 Y137.766 E.01896
G1 X96.959 Y140.665 E.13186
G1 X96.37 Y140.665 E.01896
G1 X93.47 Y137.766 E.13186
G1 X92.881 Y137.766 E.01896
G1 X95.78 Y140.665 E.13186
G1 X95.191 Y140.665 E.01896
G1 X92.291 Y137.766 E.13186
G1 X91.701 Y137.766 E.01896
G1 X94.601 Y140.665 E.13186
G1 X94.011 Y140.665 E.01896
G1 X91.112 Y137.766 E.13186
G1 X90.522 Y137.766 E.01896
G1 X93.422 Y140.665 E.13186
G1 X92.832 Y140.665 E.01896
G1 X89.933 Y137.766 E.13186
G1 X89.343 Y137.766 E.01896
G1 X92.243 Y140.665 E.13186
G1 X91.653 Y140.665 E.01896
G1 X88.754 Y137.766 E.13186
G1 X88.164 Y137.766 E.01896
G1 X91.064 Y140.665 E.13186
G1 X90.474 Y140.665 E.01896
G1 X87.639 Y137.83 E.12895
G1 X87.639 Y138.42 E.01896
G1 X89.885 Y140.665 E.10214
G1 X89.295 Y140.665 E.01896
G1 X87.639 Y139.009 E.07533
G1 X87.639 Y139.599 E.01896
G1 X88.706 Y140.665 E.04852
G1 X88.116 Y140.665 E.01896
G1 X87.456 Y140.005 E.03004
; WIPE_START
G1 X88.116 Y140.665 E-.35495
G1 X88.706 Y140.665 E-.22403
G1 X88.369 Y140.329 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X91.357 Y133.306 Z2.7 F15000
G1 X99.416 Y114.367 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X100.127 Y115.598 E.04572
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X95.892 Y113.269 E.02217
G1 X96.688 Y113.1 E.02618
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.386 Y114.315 E.0007
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X95.974 Y113.653 E.01805
G1 X96.688 Y113.501 E.02177
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52888
G1 X99.809 Y116.327 E-.23112
; WIPE_END
G1 E-.04 F1800
G1 X95.268 Y110.193 Z2.7 F15000
G1 X87.291 Y99.418 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.508 Y99.675 Z2.7 F15000
G1 X105.921 Y100.413 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.275 Y99.766 E.02941
G1 X104.694 Y99.766 E.01866
G1 X105.738 Y100.81 E.04747
G1 X105.738 Y101.39 E.01866
G1 X104.114 Y99.766 E.07387
G1 X103.534 Y99.766 E.01866
G1 X105.738 Y101.971 E.10026
G1 X105.738 Y102.551 E.01866
G1 X102.953 Y99.766 E.12665
G1 X102.373 Y99.766 E.01866
G1 X105.738 Y103.131 E.15304
G1 X105.738 Y103.712 E.01866
G1 X101.793 Y99.766 E.17944
G1 X101.212 Y99.766 E.01866
G1 X105.738 Y104.292 E.20583
G1 X105.738 Y104.872 E.01866
G1 X100.632 Y99.766 E.23222
G1 X100.051 Y99.766 E.01866
G1 X105.738 Y105.453 E.25861
G1 X105.738 Y106.033 E.01866
G1 X99.471 Y99.766 E.28501
G1 X98.891 Y99.766 E.01866
G1 X105.738 Y106.613 E.3114
G1 X105.738 Y107.194 E.01866
G1 X98.31 Y99.766 E.33779
G1 X97.73 Y99.766 E.01866
G1 X105.738 Y107.774 E.36419
G1 X105.738 Y108.355 E.01866
G1 X97.15 Y99.766 E.39058
G1 X96.569 Y99.766 E.01866
G1 X105.738 Y108.935 E.41697
G1 X105.738 Y109.515 E.01866
G1 X95.989 Y99.766 E.44336
G1 X95.408 Y99.766 E.01866
G1 X105.738 Y110.096 E.46976
G1 X105.738 Y110.676 E.01866
G1 X94.828 Y99.766 E.49615
G1 X94.248 Y99.766 E.01866
G1 X105.738 Y111.256 E.52254
G1 X105.738 Y111.837 E.01866
G1 X93.667 Y99.766 E.54893
G1 X93.087 Y99.766 E.01866
G1 X105.738 Y112.417 E.57533
G1 X105.738 Y112.997 E.01866
G1 X92.507 Y99.766 E.60172
G1 X91.926 Y99.766 E.01866
G1 X105.738 Y113.578 E.62811
G1 X105.738 Y114.158 E.01866
G1 X91.346 Y99.766 E.6545
G1 X90.766 Y99.766 E.01866
G1 X105.738 Y114.739 E.6809
G1 X105.738 Y115.319 E.01866
G1 X90.185 Y99.766 E.70729
G1 X89.605 Y99.766 E.01866
G1 X105.738 Y115.899 E.73368
G1 X105.738 Y116.48 E.01866
G1 X89.024 Y99.766 E.76007
G1 X88.444 Y99.766 E.01866
G1 X105.738 Y117.06 E.78647
G1 X105.738 Y117.64 E.01866
G1 X87.864 Y99.766 E.81286
G1 X87.639 Y99.766 E.00724
G1 X87.639 Y100.121 E.01143
G1 X105.738 Y118.221 E.8231
G1 X105.738 Y118.801 E.01866
G1 X87.639 Y100.702 E.8231
G1 X87.639 Y101.282 E.01866
G1 X105.738 Y119.382 E.8231
G1 X105.738 Y119.962 E.01866
G1 X87.639 Y101.862 E.8231
G1 X87.639 Y102.443 E.01866
G1 X98.278 Y113.082 E.48384
G1 X97.541 Y112.925 E.02423
G1 X87.639 Y103.023 E.45032
G1 X87.639 Y103.603 E.01866
G1 X96.804 Y112.769 E.41681
G2 X96.285 Y112.83 I-.191 J.614 E.01731
G1 X87.639 Y104.184 E.3932
G1 X87.639 Y104.764 E.01866
G1 X95.806 Y112.932 E.37143
G1 X95.328 Y113.033 E.01573
G1 X87.639 Y105.345 E.34966
G1 X87.639 Y105.925 E.01866
G1 X94.916 Y113.202 E.33093
G1 X94.58 Y113.446 E.01336
G1 X87.639 Y106.505 E.31565
G1 X87.639 Y107.086 E.01866
G1 X94.243 Y113.69 E.30036
G1 X93.907 Y113.935 E.01336
G1 X87.639 Y107.666 E.28507
G1 X87.639 Y108.246 E.01866
G1 X93.632 Y114.24 E.27256
G1 X93.42 Y114.608 E.01366
G1 X87.639 Y108.827 E.2629
G1 X87.639 Y109.407 E.01866
G1 X93.207 Y114.976 E.25324
G1 X92.995 Y115.344 E.01366
G1 X87.639 Y109.987 E.24358
G1 X87.639 Y110.568 E.01866
G1 X92.878 Y115.807 E.23826
G1 X92.823 Y116.332 E.01698
G1 X87.639 Y111.148 E.23575
G1 X87.639 Y111.729 E.01866
G1 X92.768 Y116.857 E.23324
G2 X92.873 Y117.543 I.822 J.225 E.02297
G1 X87.639 Y112.309 E.23802
G1 X87.639 Y112.889 E.01866
G1 X93.152 Y118.403 E.25072
G1 X93.249 Y118.701 E.0101
G1 X94.354 Y119.929 E.0531
G1 X94.938 Y120.189 E.02056
G1 X105.738 Y130.989 E.49114
G1 X105.738 Y130.408 E.01866
G1 X95.93 Y120.6 E.44603
G1 X96.511 Y120.6 E.01866
G1 X105.738 Y129.828 E.41964
G1 X105.738 Y129.248 E.01866
G1 X97.091 Y120.6 E.39325
G2 X97.623 Y120.552 I.212 J-.622 E.01769
G1 X105.738 Y128.667 E.36905
G1 X105.738 Y128.087 E.01866
G1 X98.024 Y120.373 E.35079
G1 X98.426 Y120.194 E.01414
G1 X105.738 Y127.507 E.33253
G1 X105.738 Y126.926 E.01866
G1 X98.828 Y120.016 E.31427
G2 X99.164 Y119.772 I-.106 J-.5 E.01376
G1 X105.738 Y126.346 E.29896
G1 X105.738 Y125.766 E.01866
G1 X99.439 Y119.466 E.28646
G1 X99.714 Y119.161 E.01321
G1 X105.738 Y125.185 E.27396
G1 X105.738 Y124.605 E.01866
G1 X99.989 Y118.856 E.26145
G2 X100.198 Y118.485 I-.312 J-.421 E.01411
G1 X105.738 Y124.024 E.25193
G1 X105.738 Y123.444 E.01866
G1 X100.341 Y118.046 E.24546
G1 X100.483 Y117.608 E.01481
G1 X105.738 Y122.864 E.23899
G1 X105.738 Y122.283 E.01866
G1 X100.625 Y117.17 E.23252
G1 X100.576 Y116.541 E.0203
G1 X105.738 Y121.703 E.23475
G1 X105.738 Y121.123 E.01866
G1 X100.508 Y115.892 E.23785
G2 X100.166 Y114.97 I-1.206 J-.077 E.03256
G1 X105.921 Y120.725 E.26171
; WIPE_START
G1 X104.507 Y119.311 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.369 Y126.895 Z2.7 F15000
G1 X105.921 Y131.752 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F7800
G1 X87.639 Y113.47 E.83143
G1 X87.639 Y114.05 E.01866
G1 X105.738 Y132.15 E.8231
G1 X105.738 Y132.73 E.01866
G1 X87.639 Y114.63 E.8231
G1 X87.639 Y115.211 E.01866
G1 X105.738 Y133.31 E.8231
G1 X105.738 Y133.665 E.01142
G1 X105.513 Y133.665 E.00724
G1 X87.639 Y115.791 E.81286
G1 X87.639 Y116.371 E.01866
G1 X104.933 Y133.665 E.78646
G1 X104.352 Y133.665 E.01866
G1 X87.639 Y116.952 E.76007
G1 X87.639 Y117.532 E.01866
G1 X103.772 Y133.665 E.73368
G1 X103.192 Y133.665 E.01866
G1 X87.639 Y118.113 E.70728
G1 X87.639 Y118.693 E.01866
G1 X102.611 Y133.665 E.68089
G1 X102.031 Y133.665 E.01866
G1 X87.639 Y119.273 E.6545
G1 X87.639 Y119.854 E.01866
G1 X101.451 Y133.665 E.62811
G1 X100.87 Y133.665 E.01866
G1 X87.639 Y120.434 E.60171
G1 X87.639 Y121.014 E.01866
G1 X100.29 Y133.665 E.57532
G1 X99.709 Y133.665 E.01866
G1 X87.639 Y121.595 E.54893
G1 X87.639 Y122.175 E.01866
G1 X99.129 Y133.665 E.52254
G1 X98.549 Y133.665 E.01866
G1 X87.639 Y122.755 E.49614
G1 X87.639 Y123.336 E.01866
G1 X97.968 Y133.665 E.46975
G1 X97.388 Y133.665 E.01866
G1 X87.639 Y123.916 E.44336
G1 X87.639 Y124.497 E.01866
G1 X96.808 Y133.665 E.41697
G1 X96.227 Y133.665 E.01866
G1 X87.639 Y125.077 E.39057
G1 X87.639 Y125.657 E.01866
G1 X95.647 Y133.665 E.36418
G1 X95.067 Y133.665 E.01866
G1 X87.639 Y126.238 E.33779
G1 X87.639 Y126.818 E.01866
G1 X94.486 Y133.665 E.31139
G1 X93.906 Y133.665 E.01866
G1 X87.639 Y127.398 E.285
G1 X87.639 Y127.979 E.01866
G1 X93.325 Y133.665 E.25861
G1 X92.745 Y133.665 E.01866
G1 X87.639 Y128.559 E.23222
G1 X87.639 Y129.139 E.01866
G1 X92.165 Y133.665 E.20582
G1 X91.584 Y133.665 E.01866
G1 X87.639 Y129.72 E.17943
G1 X87.639 Y130.3 E.01866
G1 X91.004 Y133.665 E.15304
G1 X90.424 Y133.665 E.01866
G1 X87.639 Y130.881 E.12665
G1 X87.639 Y131.461 E.01866
G1 X89.843 Y133.665 E.10025
G1 X89.263 Y133.665 E.01866
G1 X87.639 Y132.041 E.07386
M73 P69 R13
G1 X87.639 Y132.622 E.01866
G1 X88.682 Y133.665 E.04747
G1 X88.102 Y133.665 E.01866
G1 X87.456 Y133.019 E.02941
; WIPE_START
G1 X88.102 Y133.665 E-.34749
G1 X88.682 Y133.665 E-.22054
G1 X88.325 Y133.308 E-.19197
; WIPE_END
G1 E-.04 F1800
G1 X88.114 Y125.679 Z2.7 F15000
G1 X87.291 Y96.014 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.456 Y95.005 Z2.7 F15000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X88.116 Y95.665 E.03004
G1 X88.706 Y95.665 E.01896
G1 X87.639 Y94.599 E.04852
G1 X87.639 Y94.009 E.01896
G1 X89.295 Y95.665 E.07533
G1 X89.885 Y95.665 E.01896
G1 X87.639 Y93.42 E.10214
G1 X87.639 Y92.83 E.01896
G1 X90.474 Y95.665 E.12895
G1 X91.064 Y95.665 E.01896
G1 X88.164 Y92.766 E.13186
G1 X88.754 Y92.766 E.01896
G1 X91.653 Y95.665 E.13186
G1 X92.243 Y95.665 E.01896
G1 X89.343 Y92.766 E.13186
G1 X89.933 Y92.766 E.01896
G1 X92.832 Y95.665 E.13186
G1 X93.422 Y95.665 E.01896
G1 X90.522 Y92.766 E.13186
G1 X91.112 Y92.766 E.01896
G1 X94.011 Y95.665 E.13186
G1 X94.601 Y95.665 E.01896
G1 X91.701 Y92.766 E.13186
G1 X92.291 Y92.766 E.01896
G1 X95.191 Y95.665 E.13186
G1 X95.78 Y95.665 E.01896
G1 X92.881 Y92.766 E.13186
G1 X93.47 Y92.766 E.01896
G1 X96.37 Y95.665 E.13186
G1 X96.959 Y95.665 E.01896
G1 X94.06 Y92.766 E.13186
G1 X94.649 Y92.766 E.01896
G1 X97.549 Y95.665 E.13186
G1 X98.138 Y95.665 E.01896
G1 X95.239 Y92.766 E.13186
G1 X95.828 Y92.766 E.01896
G1 X98.728 Y95.665 E.13186
G1 X99.317 Y95.665 E.01896
M73 P69 R12
G1 X96.418 Y92.766 E.13186
G1 X97.007 Y92.766 E.01896
G1 X99.907 Y95.665 E.13186
G1 X100.496 Y95.665 E.01896
G1 X97.597 Y92.766 E.13186
G1 X98.186 Y92.766 E.01896
G1 X101.086 Y95.665 E.13186
G1 X101.676 Y95.665 E.01896
G1 X98.776 Y92.766 E.13186
G1 X99.366 Y92.766 E.01896
G1 X102.265 Y95.665 E.13186
G1 X102.855 Y95.665 E.01896
G1 X99.955 Y92.766 E.13186
G1 X100.545 Y92.766 E.01896
G1 X103.444 Y95.665 E.13186
G1 X104.034 Y95.665 E.01896
G1 X101.134 Y92.766 E.13186
G1 X101.724 Y92.766 E.01896
G1 X104.623 Y95.665 E.13186
G1 X105.213 Y95.665 E.01896
G1 X102.313 Y92.766 E.13186
G1 X102.903 Y92.766 E.01896
G1 X105.738 Y95.601 E.12895
G1 X105.738 Y95.012 E.01896
G1 X103.492 Y92.766 E.10214
G1 X104.082 Y92.766 E.01896
G1 X105.738 Y94.422 E.07533
G1 X105.738 Y93.833 E.01896
G1 X104.671 Y92.766 E.04852
G1 X105.261 Y92.766 E.01896
G1 X105.921 Y93.426 E.03004
; WIPE_START
G1 X105.261 Y92.766 E-.35495
G1 X104.671 Y92.766 E-.22403
G1 X105.008 Y93.103 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X102.002 Y86.087 Z2.7 F15000
G1 X97.358 Y75.252 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X95.937 Y75.252 E.04572
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X95.892 Y68.269 E.02217
G1 X96.688 Y68.1 E.02618
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04835
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.418 Y75.252 E.0007
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X95.974 Y68.653 E.01805
G1 X96.688 Y68.501 E.02177
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X91.697 Y81.25 Z2.7 F15000
G1 X87.291 Y89.014 Z2.7
G1 Z2.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.456 Y88.022 Z2.7 F15000
G1 Z2.3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X88.099 Y88.665 E.02926
G1 X88.677 Y88.665 E.01859
G1 X87.639 Y87.627 E.04721
G1 X87.639 Y87.049 E.01859
G1 X89.255 Y88.665 E.0735
G1 X89.833 Y88.665 E.01859
G1 X87.639 Y86.471 E.09979
G1 X87.639 Y85.893 E.01859
G1 X90.411 Y88.665 E.12607
G1 X90.989 Y88.665 E.01859
G1 X87.639 Y85.315 E.15236
G1 X87.639 Y84.737 E.01859
G1 X91.567 Y88.665 E.17865
G1 X92.145 Y88.665 E.01859
G1 X87.639 Y84.159 E.20493
G1 X87.639 Y83.581 E.01859
G1 X92.723 Y88.665 E.23122
G1 X93.301 Y88.665 E.01859
G1 X87.639 Y83.003 E.2575
G1 X87.639 Y82.425 E.01859
G1 X93.879 Y88.665 E.28379
G1 X94.457 Y88.665 E.01859
G1 X87.639 Y81.847 E.31008
G1 X87.639 Y81.269 E.01859
G1 X95.035 Y88.665 E.33636
G1 X95.613 Y88.665 E.01859
G1 X87.639 Y80.691 E.36265
G1 X87.639 Y80.113 E.01859
G1 X96.191 Y88.665 E.38894
G1 X96.769 Y88.665 E.01859
G1 X87.639 Y79.535 E.41522
G1 X87.639 Y78.957 E.01859
G1 X97.347 Y88.665 E.44151
G1 X97.925 Y88.665 E.01859
G1 X87.639 Y78.379 E.4678
G1 X87.639 Y77.801 E.01859
G1 X98.503 Y88.665 E.49408
G1 X99.081 Y88.665 E.01859
G1 X87.639 Y77.223 E.52037
G1 X87.639 Y76.645 E.01859
G1 X99.659 Y88.665 E.54666
G1 X100.238 Y88.665 E.01859
G1 X87.639 Y76.067 E.57294
G1 X87.639 Y75.489 E.01859
G1 X100.816 Y88.665 E.59923
G1 X101.394 Y88.665 E.01859
G1 X87.639 Y74.911 E.62552
G1 X87.639 Y74.333 E.01859
G1 X101.972 Y88.665 E.6518
G1 X102.55 Y88.665 E.01859
G1 X87.639 Y73.755 E.67809
G1 X87.639 Y73.176 E.01859
G1 X103.128 Y88.665 E.70438
G1 X103.706 Y88.665 E.01859
G1 X87.639 Y72.598 E.73066
G1 X87.639 Y72.02 E.01859
G1 X104.284 Y88.665 E.75695
G1 X104.862 Y88.665 E.01859
G1 X87.639 Y71.442 E.78324
G1 X87.639 Y70.864 E.01859
G1 X105.44 Y88.665 E.80952
G1 X105.738 Y88.665 E.0096
G1 X105.738 Y88.386 E.00899
G1 X87.639 Y70.286 E.8231
G1 X87.639 Y69.708 E.01859
G1 X105.738 Y87.808 E.8231
G1 X105.738 Y87.23 E.01859
G1 X87.639 Y69.13 E.8231
G1 X87.639 Y68.552 E.01859
G1 X105.921 Y86.835 E.83143
; WIPE_START
G1 X104.507 Y85.421 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.623 Y77.87 Z2.7 F15000
G1 X105.921 Y75.852 Z2.7
G1 Z2.3
G1 E.8 F1800
G1 F7800
G1 X100.34 Y70.271 E.25383
G3 X100.523 Y71.032 I-.763 J.586 E.02591
G1 X105.738 Y76.247 E.23718
G1 X105.738 Y76.825 E.01859
G1 X100.591 Y71.678 E.2341
G3 X100.596 Y72.261 I-.653 J.298 E.01932
G1 X105.738 Y77.403 E.23385
G1 X105.738 Y77.981 E.01859
G1 X100.454 Y72.697 E.2403
G1 X100.312 Y73.133 E.01475
G1 X105.738 Y78.559 E.24675
G1 X105.738 Y79.137 E.01859
G1 X100.171 Y73.57 E.25319
G3 X99.937 Y73.914 I-.503 J-.091 E.01378
G1 X105.738 Y79.715 E.26383
G1 X105.738 Y80.293 E.01859
G1 X99.663 Y74.218 E.27629
G1 X99.389 Y74.522 E.01316
G1 X105.738 Y80.871 E.28874
G1 X105.738 Y81.449 E.01859
G1 X99.115 Y74.826 E.3012
G3 X98.758 Y75.047 I-.426 J-.291 E.01391
G1 X105.738 Y82.028 E.31746
G1 X105.738 Y82.606 E.01859
G1 X98.358 Y75.225 E.33564
G1 X97.958 Y75.403 E.01408
G1 X105.738 Y83.184 E.35383
G1 X105.738 Y83.762 E.01859
G1 X97.558 Y75.581 E.37202
G1 X96.999 Y75.6 E.01798
G1 X105.738 Y84.34 E.39743
G1 X105.738 Y84.918 E.01859
G1 X96.421 Y75.6 E.42371
G1 X95.827 Y75.584 E.01911
G1 X105.738 Y85.496 E.45073
G1 X105.738 Y86.074 E.01859
G1 X87.639 Y67.974 E.8231
G1 X87.639 Y67.396 E.01859
G1 X92.915 Y72.672 E.23993
G1 X92.739 Y72.131 E.0183
G1 X92.759 Y71.938 E.00622
G1 X87.639 Y66.818 E.23285
G1 X87.639 Y66.24 E.01859
G1 X92.814 Y71.415 E.23535
G1 X92.869 Y70.892 E.01691
G1 X87.639 Y65.662 E.23785
G1 X87.639 Y65.084 E.01859
G1 X92.96 Y70.405 E.24197
G1 X93.171 Y70.038 E.01361
G1 X87.639 Y64.506 E.2516
G1 X87.639 Y63.928 E.01859
G1 X93.383 Y69.672 E.26122
G1 X93.594 Y69.306 E.01361
G1 X87.639 Y63.35 E.27084
G1 X87.639 Y62.772 E.01859
G1 X93.846 Y68.979 E.28228
G1 X94.181 Y68.736 E.01331
G1 X87.639 Y62.194 E.29751
G1 X87.639 Y61.616 E.01859
G1 X94.516 Y68.493 E.31273
G1 X94.85 Y68.249 E.01331
G1 X87.639 Y61.038 E.32796
G1 X87.639 Y60.46 E.01859
G1 X95.233 Y68.054 E.34534
G1 X95.709 Y67.952 E.01567
G1 X87.639 Y59.882 E.36702
G1 X87.639 Y59.304 E.01859
G1 X96.186 Y67.851 E.3887
G1 X96.663 Y67.75 E.01567
G1 X87.639 Y58.726 E.41038
G1 X87.639 Y58.148 E.01859
G1 X97.383 Y67.892 E.44313
G1 X98.117 Y68.048 E.02413
G1 X87.639 Y57.57 E.47651
G1 X87.639 Y56.992 E.01859
G1 X105.738 Y75.091 E.8231
G1 X105.738 Y74.513 E.01859
G1 X87.639 Y56.414 E.82309
G1 X87.639 Y55.836 E.01859
G1 X105.738 Y73.935 E.82309
G1 X105.738 Y73.357 E.01859
G1 X87.639 Y55.257 E.8231
G1 X87.639 Y54.679 E.01859
G1 X105.738 Y72.779 E.8231
G1 X105.738 Y72.201 E.01859
G1 X87.639 Y54.101 E.8231
G1 X87.639 Y53.523 E.01859
G1 X105.738 Y71.623 E.8231
G1 X105.738 Y71.045 E.01859
G1 X87.639 Y52.945 E.8231
G1 X87.639 Y52.666 E.00899
G1 X87.937 Y52.666 E.0096
G1 X105.738 Y70.467 E.80952
G1 X105.738 Y69.889 E.01859
G1 X88.515 Y52.666 E.78323
G1 X89.093 Y52.666 E.01859
G1 X105.738 Y69.311 E.75694
G1 X105.738 Y68.733 E.01859
G1 X89.671 Y52.666 E.73066
G1 X90.249 Y52.666 E.01859
G1 X105.738 Y68.155 E.70437
G1 X105.738 Y67.577 E.01859
G1 X90.827 Y52.666 E.67808
G1 X91.405 Y52.666 E.01859
G1 X105.738 Y66.999 E.6518
G1 X105.738 Y66.421 E.01859
G1 X91.983 Y52.666 E.62551
G1 X92.562 Y52.666 E.01859
G1 X105.738 Y65.843 E.59922
G1 X105.738 Y65.265 E.01859
G1 X93.14 Y52.666 E.57294
G1 X93.718 Y52.666 E.01859
G1 X105.738 Y64.687 E.54665
G1 X105.738 Y64.109 E.01859
G1 X94.296 Y52.666 E.52037
G1 X94.874 Y52.666 E.01859
G1 X105.738 Y63.531 E.49408
G1 X105.738 Y62.952 E.01859
G1 X95.452 Y52.666 E.46779
G1 X96.03 Y52.666 E.01859
G1 X105.738 Y62.374 E.44151
G1 X105.738 Y61.796 E.01859
G1 X96.608 Y52.666 E.41522
G1 X97.186 Y52.666 E.01859
G1 X105.738 Y61.218 E.38893
G1 X105.738 Y60.64 E.01859
G1 X97.764 Y52.666 E.36265
G1 X98.342 Y52.666 E.01859
G1 X105.738 Y60.062 E.33636
G1 X105.738 Y59.484 E.01859
G1 X98.92 Y52.666 E.31007
G1 X99.498 Y52.666 E.01859
G1 X105.738 Y58.906 E.28379
G1 X105.738 Y58.328 E.01859
G1 X100.076 Y52.666 E.2575
G1 X100.654 Y52.666 E.01859
G1 X105.738 Y57.75 E.23121
G1 X105.738 Y57.172 E.01859
G1 X101.232 Y52.666 E.20493
G1 X101.81 Y52.666 E.01859
G1 X105.738 Y56.594 E.17864
G1 X105.738 Y56.016 E.01859
G1 X102.388 Y52.666 E.15235
G1 X102.966 Y52.666 E.01859
G1 X105.738 Y55.438 E.12607
G1 X105.738 Y54.86 E.01859
G1 X103.544 Y52.666 E.09978
G1 X104.122 Y52.666 E.01859
G1 X105.738 Y54.282 E.07349
G1 X105.738 Y53.704 E.01859
G1 X104.7 Y52.666 E.04721
G1 X105.278 Y52.666 E.01859
G1 X105.921 Y53.309 E.02925
; CHANGE_LAYER
; Z_HEIGHT: 2.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X105.278 Y52.666 E-.34567
G1 X104.7 Y52.666 E-.21966
G1 X105.062 Y53.028 E-.19468
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 12/20
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z2.7 I1.217 J0 P1  F15000
; object ids of layer 12 start: 178
M624 AgAAAAAAAAA=
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
; object ids of this layer12 end: 178
M625
; OBJECT_ID: 178
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X98.869 Y164.58
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X98.814 Y164.641 E.00265
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
M73 P70 R12
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04834
G1 X95.831 Y158.282 E.02016
G1 X96.688 Y158.1 E.02818
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04834
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.909 Y164.535 E.04377
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X95.913 Y158.666 E.01619
G1 X96.688 Y158.501 E.02362
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X93.544 Y157.933 Z2.9 F15000
G1 X87.291 Y144.418 Z2.9
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.282 Y144.583 Z2.9 F15000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y145.226 E.02926
G1 X87.639 Y145.804 E.01859
G1 X88.677 Y144.766 E.04721
G1 X89.255 Y144.766 E.01859
G1 X87.639 Y146.382 E.0735
G1 X87.639 Y146.96 E.01859
G1 X89.833 Y144.766 E.09979
G1 X90.411 Y144.766 E.01859
G1 X87.639 Y147.538 E.12607
G1 X87.639 Y148.116 E.01859
G1 X90.989 Y144.766 E.15236
G1 X91.567 Y144.766 E.01859
G1 X87.639 Y148.694 E.17865
G1 X87.639 Y149.272 E.01859
G1 X92.145 Y144.766 E.20493
G1 X92.723 Y144.766 E.01859
G1 X87.639 Y149.85 E.23122
G1 X87.639 Y150.428 E.01859
G1 X93.301 Y144.766 E.2575
G1 X93.879 Y144.766 E.01859
G1 X87.639 Y151.006 E.28379
G1 X87.639 Y151.584 E.01859
G1 X94.457 Y144.766 E.31008
G1 X95.035 Y144.766 E.01859
G1 X87.639 Y152.162 E.33636
G1 X87.639 Y152.74 E.01859
G1 X95.613 Y144.766 E.36265
G1 X96.191 Y144.766 E.01859
G1 X87.639 Y153.319 E.38894
G1 X87.639 Y153.897 E.01859
G1 X96.769 Y144.766 E.41522
G1 X97.347 Y144.766 E.01859
G1 X87.639 Y154.475 E.44151
G1 X87.639 Y155.053 E.01859
G1 X97.925 Y144.766 E.4678
G1 X98.503 Y144.766 E.01859
G1 X87.639 Y155.631 E.49408
G1 X87.639 Y156.209 E.01859
G1 X99.081 Y144.766 E.52037
G1 X99.659 Y144.766 E.01859
G1 X87.639 Y156.787 E.54666
G1 X87.639 Y157.365 E.01859
G1 X100.238 Y144.766 E.57294
G1 X100.816 Y144.766 E.01859
G1 X87.639 Y157.943 E.59923
G1 X87.639 Y158.521 E.01859
G1 X101.394 Y144.766 E.62552
G1 X101.972 Y144.766 E.01859
G1 X87.639 Y159.099 E.6518
G1 X87.639 Y159.677 E.01859
G1 X102.55 Y144.766 E.67809
G1 X103.128 Y144.766 E.01859
G1 X87.639 Y160.255 E.70438
G1 X87.639 Y160.833 E.01859
G1 X103.706 Y144.766 E.73066
G1 X104.284 Y144.766 E.01859
G1 X87.639 Y161.411 E.75695
G1 X87.639 Y161.989 E.01859
G1 X104.862 Y144.766 E.78324
G1 X105.44 Y144.766 E.01859
G1 X87.639 Y162.567 E.80952
G1 X87.639 Y163.145 E.01859
G1 X105.738 Y145.046 E.82309
G1 X105.738 Y145.624 E.01859
G1 X87.639 Y163.723 E.82309
G1 X87.639 Y164.301 E.01859
G1 X105.738 Y146.202 E.82309
G1 X105.738 Y146.78 E.01859
G1 X87.456 Y165.062 E.83142
; WIPE_START
G1 X88.87 Y163.648 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.005 Y171.231 Z2.9 F15000
G1 X87.456 Y176.045 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F7800
G1 X98.21 Y165.291 E.48906
G1 X97.514 Y165.6 E.02448
G1 X97.322 Y165.6 E.00618
G1 X87.639 Y175.284 E.44036
G1 X87.639 Y174.706 E.01859
G1 X96.744 Y165.6 E.41407
G1 X96.166 Y165.6 E.01859
G1 X87.639 Y174.128 E.38779
G1 X87.639 Y173.55 E.01859
G1 X95.673 Y165.516 E.36535
G1 X95.273 Y165.338 E.01408
G1 X87.639 Y172.972 E.34716
G1 X87.639 Y172.394 E.01859
G1 X94.873 Y165.16 E.32897
G1 X94.473 Y164.981 E.01408
G1 X87.639 Y171.816 E.31078
G1 X87.639 Y171.237 E.01859
G1 X94.161 Y164.715 E.29663
G1 X93.888 Y164.411 E.01316
G1 X87.639 Y170.659 E.28417
G1 X87.639 Y170.081 E.01859
G1 X93.614 Y164.106 E.27172
G1 X93.34 Y163.802 E.01316
G1 X87.639 Y169.503 E.25927
G1 X87.639 Y168.925 E.01859
G1 X93.154 Y163.41 E.25083
G1 X93.013 Y162.973 E.01475
G1 X87.639 Y168.347 E.24438
G1 X87.639 Y167.769 E.01859
G1 X92.871 Y162.537 E.23793
G1 X92.743 Y162.087 E.01506
G1 X87.639 Y167.191 E.23214
G1 X87.639 Y166.613 E.01859
G1 X92.811 Y161.441 E.23523
G1 X92.879 Y160.795 E.02089
G1 X87.639 Y166.035 E.23832
G1 X87.639 Y165.457 E.01859
G1 X93.327 Y159.769 E.25866
G1 X93.737 Y159.058 E.0264
G1 X94.836 Y158.26 E.04368
G1 X105.738 Y147.358 E.49579
G1 X105.738 Y147.936 E.01859
G1 X95.725 Y157.949 E.45537
G1 X96.459 Y157.793 E.02413
G1 X105.738 Y148.514 E.42199
G1 X105.738 Y149.092 E.01859
G1 X97.016 Y157.814 E.39665
G1 X97.493 Y157.915 E.01567
G1 X105.738 Y149.67 E.37497
G1 X105.738 Y150.248 E.01859
G1 X97.97 Y158.017 E.35329
G3 X98.404 Y158.16 I.056 J.56 E.01515
G1 X105.738 Y150.826 E.33354
G1 X105.738 Y151.404 E.01859
G1 X98.739 Y158.403 E.31832
G1 X99.073 Y158.647 E.01331
G1 X105.738 Y151.982 E.30309
G1 X105.738 Y152.56 E.01859
G1 X99.408 Y158.89 E.28787
G3 X99.705 Y159.171 I-.167 J.474 E.01354
G1 X105.738 Y153.138 E.27437
G1 X105.738 Y153.716 E.01859
G1 X99.917 Y159.538 E.26474
G1 X100.128 Y159.904 E.01361
G1 X105.738 Y154.294 E.25512
G1 X105.738 Y154.872 E.01859
G1 X100.34 Y160.271 E.2455
G3 X100.488 Y160.7 I-.409 J.381 E.01506
G1 X105.738 Y155.45 E.23877
G1 X105.738 Y156.028 E.01859
G1 X100.543 Y161.224 E.23627
G1 X100.598 Y161.747 E.01691
G1 X105.738 Y156.606 E.23377
G1 X105.738 Y157.184 E.01859
G1 X100.564 Y162.358 E.23529
G1 X100.286 Y163.214 E.02895
G1 X105.738 Y157.762 E.24794
G1 X105.738 Y158.34 E.01859
G1 X87.639 Y176.44 E.82309
G1 X87.639 Y177.018 E.01859
G1 X105.738 Y158.918 E.82309
G1 X105.738 Y159.496 E.01859
G1 X87.639 Y177.596 E.82309
G1 X87.639 Y178.174 E.01859
G1 X105.738 Y160.074 E.82309
G1 X105.738 Y160.652 E.01859
G1 X87.639 Y178.752 E.82309
G1 X87.639 Y179.33 E.01859
G1 X105.738 Y161.23 E.82309
G1 X105.738 Y161.808 E.01859
G1 X87.639 Y179.908 E.82309
G1 X87.639 Y180.486 E.01859
G1 X105.738 Y162.386 E.82309
G1 X105.738 Y162.964 E.01859
G1 X87.937 Y180.765 E.80952
G1 X88.515 Y180.765 E.01859
G1 X105.738 Y163.543 E.78323
G1 X105.738 Y164.121 E.01859
G1 X89.093 Y180.765 E.75694
G1 X89.671 Y180.765 E.01859
G1 X105.738 Y164.699 E.73066
G1 X105.738 Y165.277 E.01859
G1 X90.249 Y180.765 E.70437
G1 X90.827 Y180.765 E.01859
G1 X105.738 Y165.855 E.67808
G1 X105.738 Y166.433 E.01859
G1 X91.405 Y180.765 E.6518
G1 X91.983 Y180.765 E.01859
G1 X105.738 Y167.011 E.62551
G1 X105.738 Y167.589 E.01859
G1 X92.562 Y180.765 E.59922
G1 X93.14 Y180.765 E.01859
G1 X105.738 Y168.167 E.57294
G1 X105.738 Y168.745 E.01859
G1 X93.718 Y180.765 E.54665
G1 X94.296 Y180.765 E.01859
G1 X105.738 Y169.323 E.52036
G1 X105.738 Y169.901 E.01859
G1 X94.874 Y180.765 E.49408
G1 X95.452 Y180.765 E.01859
G1 X105.738 Y170.479 E.46779
G1 X105.738 Y171.057 E.01859
G1 X96.03 Y180.765 E.44151
G1 X96.608 Y180.765 E.01859
G1 X105.738 Y171.635 E.41522
G1 X105.738 Y172.213 E.01859
G1 X97.186 Y180.765 E.38893
G1 X97.764 Y180.765 E.01859
G1 X105.738 Y172.791 E.36265
G1 X105.738 Y173.369 E.01859
G1 X98.342 Y180.765 E.33636
G1 X98.92 Y180.765 E.01859
G1 X105.738 Y173.947 E.31007
G1 X105.738 Y174.525 E.01859
G1 X99.498 Y180.765 E.28379
G1 X100.076 Y180.765 E.01859
G1 X105.738 Y175.103 E.2575
G1 X105.738 Y175.681 E.01859
G1 X100.654 Y180.765 E.23121
G1 X101.232 Y180.765 E.01859
G1 X105.738 Y176.259 E.20493
G1 X105.738 Y176.837 E.01859
G1 X101.81 Y180.765 E.17864
G1 X102.388 Y180.765 E.01859
G1 X105.738 Y177.415 E.15235
G1 X105.738 Y177.993 E.01859
G1 X102.966 Y180.765 E.12607
G1 X103.544 Y180.765 E.01859
G1 X105.738 Y178.571 E.09978
G1 X105.738 Y179.149 E.01859
G1 X104.122 Y180.765 E.07349
G1 X104.7 Y180.765 E.01859
G1 X105.738 Y179.727 E.04721
G1 X105.738 Y180.305 E.01859
G1 X105.095 Y180.949 E.02925
; WIPE_START
G1 X105.738 Y180.305 E-.34567
G1 X105.738 Y179.727 E-.21965
G1 X105.376 Y180.09 E-.19468
; WIPE_END
G1 E-.04 F1800
G1 X105.515 Y172.458 Z2.9 F15000
G1 X106.086 Y141.014 Z2.9
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.078 Y140.849 Z2.9 F15000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y140.188 E.03004
G1 X105.738 Y139.599 E.01896
G1 X104.671 Y140.665 E.04852
G1 X104.082 Y140.665 E.01896
G1 X105.738 Y139.009 E.07533
G1 X105.738 Y138.42 E.01896
G1 X103.492 Y140.665 E.10214
G1 X102.903 Y140.665 E.01896
G1 X105.738 Y137.83 E.12895
G1 X105.738 Y137.766 E.00206
G1 X105.213 Y137.766 E.0169
G1 X102.313 Y140.665 E.13186
G1 X101.724 Y140.665 E.01896
G1 X104.623 Y137.766 E.13186
G1 X104.034 Y137.766 E.01896
G1 X101.134 Y140.665 E.13186
G1 X100.545 Y140.665 E.01896
G1 X103.444 Y137.766 E.13186
G1 X102.855 Y137.766 E.01896
G1 X99.955 Y140.665 E.13186
G1 X99.366 Y140.665 E.01896
G1 X102.265 Y137.766 E.13186
G1 X101.675 Y137.766 E.01896
G1 X98.776 Y140.665 E.13186
G1 X98.186 Y140.665 E.01896
G1 X101.086 Y137.766 E.13186
G1 X100.496 Y137.766 E.01896
G1 X97.597 Y140.665 E.13186
G1 X97.007 Y140.665 E.01896
G1 X99.907 Y137.766 E.13186
G1 X99.317 Y137.766 E.01896
G1 X96.418 Y140.665 E.13186
G1 X95.828 Y140.665 E.01896
G1 X98.728 Y137.766 E.13186
G1 X98.138 Y137.766 E.01896
G1 X95.239 Y140.665 E.13186
G1 X94.649 Y140.665 E.01896
G1 X97.549 Y137.766 E.13186
G1 X96.959 Y137.766 E.01896
G1 X94.06 Y140.665 E.13186
G1 X93.47 Y140.665 E.01896
G1 X96.37 Y137.766 E.13186
G1 X95.78 Y137.766 E.01896
G1 X92.881 Y140.665 E.13186
G1 X92.291 Y140.665 E.01896
G1 X95.191 Y137.766 E.13186
G1 X94.601 Y137.766 E.01896
G1 X91.701 Y140.665 E.13186
G1 X91.112 Y140.665 E.01896
G1 X94.011 Y137.766 E.13186
G1 X93.422 Y137.766 E.01896
G1 X90.522 Y140.665 E.13186
G1 X89.933 Y140.665 E.01896
G1 X92.832 Y137.766 E.13186
G1 X92.243 Y137.766 E.01896
G1 X89.343 Y140.665 E.13186
G1 X88.754 Y140.665 E.01896
G1 X91.653 Y137.766 E.13186
G1 X91.064 Y137.766 E.01896
G1 X88.164 Y140.665 E.13186
G1 X87.639 Y140.665 E.0169
G1 X87.639 Y140.601 E.00206
G1 X90.474 Y137.766 E.12895
G1 X89.885 Y137.766 E.01896
G1 X87.639 Y140.012 E.10214
G1 X87.639 Y139.422 E.01896
G1 X89.295 Y137.766 E.07533
G1 X88.706 Y137.766 E.01896
G1 X87.639 Y138.833 E.04852
G1 X87.639 Y138.243 E.01896
G1 X88.299 Y137.583 E.03004
; WIPE_START
G1 X87.639 Y138.243 E-.35494
G1 X87.639 Y138.833 E-.22403
G1 X87.976 Y138.496 E-.18103
; WIPE_END
G1 E-.04 F1800
G1 X91.246 Y131.599 Z2.9 F15000
G1 X99.416 Y114.368 Z2.9
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X100.127 Y115.598 E.0457
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X95.831 Y113.282 E.02016
G1 X96.688 Y113.1 E.02818
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.386 Y114.316 E.00072
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
M73 P71 R12
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X95.913 Y113.666 E.01619
G1 X96.688 Y113.501 E.02362
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52886
G1 X99.809 Y116.327 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X95.268 Y110.193 Z2.9 F15000
G1 X87.291 Y99.418 Z2.9
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.285 Y99.583 Z2.9 F15000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y100.229 E.02941
G1 X87.639 Y100.81 E.01866
G1 X88.683 Y99.766 E.04747
G1 X89.263 Y99.766 E.01866
G1 X87.639 Y101.39 E.07386
G1 X87.639 Y101.97 E.01866
G1 X89.843 Y99.766 E.10025
G1 X90.424 Y99.766 E.01866
G1 X87.639 Y102.551 E.12665
G1 X87.639 Y103.131 E.01866
G1 X91.004 Y99.766 E.15304
G1 X91.584 Y99.766 E.01866
G1 X87.639 Y103.712 E.17943
G1 X87.639 Y104.292 E.01866
G1 X92.165 Y99.766 E.20582
G1 X92.745 Y99.766 E.01866
G1 X87.639 Y104.872 E.23222
G1 X87.639 Y105.453 E.01866
G1 X93.325 Y99.766 E.25861
G1 X93.906 Y99.766 E.01866
G1 X87.639 Y106.033 E.285
G1 X87.639 Y106.613 E.01866
G1 X94.486 Y99.766 E.31139
G1 X95.067 Y99.766 E.01866
G1 X87.639 Y107.194 E.33779
G1 X87.639 Y107.774 E.01866
G1 X95.647 Y99.766 E.36418
G1 X96.227 Y99.766 E.01866
G1 X87.639 Y108.354 E.39057
G1 X87.639 Y108.935 E.01866
G1 X96.808 Y99.766 E.41697
G1 X97.388 Y99.766 E.01866
G1 X87.639 Y109.515 E.44336
G1 X87.639 Y110.096 E.01866
G1 X97.968 Y99.766 E.46975
G1 X98.549 Y99.766 E.01866
G1 X87.639 Y110.676 E.49614
G1 X87.639 Y111.256 E.01866
G1 X99.129 Y99.766 E.52254
G1 X99.709 Y99.766 E.01866
G1 X87.639 Y111.837 E.54893
G1 X87.639 Y112.417 E.01866
G1 X100.29 Y99.766 E.57532
G1 X100.87 Y99.766 E.01866
G1 X87.639 Y112.997 E.60171
G1 X87.639 Y113.578 E.01866
G1 X101.451 Y99.766 E.62811
G1 X102.031 Y99.766 E.01866
G1 X87.639 Y114.158 E.6545
G1 X87.639 Y114.738 E.01866
G1 X102.611 Y99.766 E.68089
G1 X103.192 Y99.766 E.01866
G1 X87.639 Y115.319 E.70728
G1 X87.639 Y115.899 E.01866
G1 X103.772 Y99.766 E.73368
G1 X104.352 Y99.766 E.01866
G1 X87.639 Y116.48 E.76007
G1 X87.639 Y117.06 E.01866
G1 X104.933 Y99.766 E.78646
G1 X105.513 Y99.766 E.01866
G1 X87.639 Y117.64 E.81286
G1 X87.639 Y118.221 E.01866
G1 X105.738 Y100.121 E.82309
G1 X105.738 Y100.701 E.01866
G1 X87.639 Y118.801 E.82309
G1 X87.639 Y119.381 E.01866
G1 X105.738 Y101.282 E.82309
G1 X105.738 Y101.862 E.01866
G1 X87.456 Y120.145 E.83142
; WIPE_START
G1 X88.87 Y118.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.008 Y126.314 Z2.9 F15000
G1 X87.456 Y131.172 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F7800
G1 X98.439 Y120.189 E.49947
G1 X97.447 Y120.6 E.03453
G1 X87.639 Y130.408 E.44603
G1 X87.639 Y129.828 E.01866
G1 X96.866 Y120.6 E.41963
G1 X96.286 Y120.6 E.01866
G1 X87.639 Y129.248 E.39324
G1 X87.639 Y128.667 E.01866
G1 X95.754 Y120.552 E.36905
G1 X95.352 Y120.373 E.01414
G1 X87.639 Y128.087 E.35079
G1 X87.639 Y127.506 E.01866
G1 X94.951 Y120.194 E.33253
G1 X94.549 Y120.016 E.01414
G1 X87.639 Y126.926 E.31426
G1 X87.639 Y126.346 E.01866
G1 X94.213 Y119.772 E.29896
G1 X93.938 Y119.466 E.01321
G1 X87.639 Y125.765 E.28646
G1 X87.639 Y125.185 E.01866
G1 X93.663 Y119.161 E.27395
G1 X93.388 Y118.856 E.01321
G1 X87.639 Y124.605 E.26145
G1 X87.639 Y124.024 E.01866
G1 X93.179 Y118.484 E.25193
G1 X93.036 Y118.046 E.01481
G1 X87.639 Y123.444 E.24546
G1 X87.639 Y122.864 E.01866
G1 X92.894 Y117.608 E.23899
G1 X92.752 Y117.17 E.01481
G1 X87.639 Y122.283 E.23251
G1 X87.639 Y121.703 E.01866
G1 X92.801 Y116.541 E.23475
G1 X92.869 Y115.892 E.02097
G1 X87.639 Y121.122 E.23785
G1 X87.639 Y120.542 E.01866
G1 X93.211 Y114.97 E.25339
G1 X93.737 Y114.058 E.03386
G1 X95.099 Y113.082 E.05387
G1 X105.738 Y102.443 E.48385
G1 X105.738 Y103.023 E.01866
G1 X95.836 Y112.926 E.45033
G1 X96.573 Y112.769 E.02423
G1 X105.738 Y103.603 E.41681
G1 X105.738 Y104.184 E.01866
G1 X97.092 Y112.83 E.3932
G1 X97.571 Y112.932 E.01573
G1 X105.738 Y104.764 E.37143
G1 X105.738 Y105.344 E.01866
G1 X98.049 Y113.033 E.34967
G3 X98.461 Y113.202 I.017 J.547 E.01474
G1 X105.738 Y105.925 E.33093
G1 X105.738 Y106.505 E.01866
G1 X98.797 Y113.446 E.31565
G1 X99.133 Y113.69 E.01336
G1 X105.738 Y107.085 E.30036
G1 X105.738 Y107.666 E.01866
G1 X99.47 Y113.935 E.28507
G3 X99.745 Y114.24 I-.205 J.462 E.01361
G1 X105.738 Y108.246 E.27256
G1 X105.738 Y108.827 E.01866
G1 X99.957 Y114.608 E.2629
G1 X100.17 Y114.976 E.01366
G1 X105.738 Y109.407 E.25324
G1 X105.738 Y109.987 E.01866
G1 X100.382 Y115.344 E.24358
G3 X100.499 Y115.807 I-.462 J.363 E.01582
G1 X105.738 Y110.568 E.23826
G1 X105.738 Y111.148 E.01866
G1 X100.554 Y116.332 E.23575
G1 X100.609 Y116.857 E.01698
G1 X105.738 Y111.728 E.23324
G1 X105.738 Y112.309 E.01866
G1 X100.504 Y117.543 E.23802
G1 X100.225 Y118.402 E.02907
G1 X105.738 Y112.889 E.25072
G1 X105.738 Y113.47 E.01866
G1 X87.639 Y131.569 E.82309
G1 X87.639 Y132.149 E.01866
G1 X105.738 Y114.05 E.82309
G1 X105.738 Y114.63 E.01866
G1 X87.639 Y132.73 E.82309
G1 X87.639 Y133.31 E.01866
G1 X105.738 Y115.211 E.82309
G1 X105.738 Y115.791 E.01866
G1 X87.864 Y133.665 E.81286
G1 X88.444 Y133.665 E.01866
G1 X105.738 Y116.371 E.78647
G1 X105.738 Y116.952 E.01866
G1 X89.024 Y133.665 E.76008
G1 X89.605 Y133.665 E.01866
G1 X105.738 Y117.532 E.73368
G1 X105.738 Y118.112 E.01866
G1 X90.185 Y133.665 E.70729
G1 X90.766 Y133.665 E.01866
G1 X105.738 Y118.693 E.6809
G1 X105.738 Y119.273 E.01866
G1 X91.346 Y133.665 E.6545
G1 X91.926 Y133.665 E.01866
G1 X105.738 Y119.854 E.62811
G1 X105.738 Y120.434 E.01866
G1 X92.507 Y133.665 E.60172
G1 X93.087 Y133.665 E.01866
G1 X105.738 Y121.014 E.57533
G1 X105.738 Y121.595 E.01866
G1 X93.667 Y133.665 E.54893
G1 X94.248 Y133.665 E.01866
G1 X105.738 Y122.175 E.52254
G1 X105.738 Y122.755 E.01866
G1 X94.828 Y133.665 E.49615
G1 X95.408 Y133.665 E.01866
G1 X105.738 Y123.336 E.46976
G1 X105.738 Y123.916 E.01866
G1 X95.989 Y133.665 E.44336
G1 X96.569 Y133.665 E.01866
G1 X105.738 Y124.496 E.41697
G1 X105.738 Y125.077 E.01866
G1 X97.15 Y133.665 E.39058
G1 X97.73 Y133.665 E.01866
G1 X105.738 Y125.657 E.36419
G1 X105.738 Y126.238 E.01866
M73 P71 R11
G1 X98.31 Y133.665 E.33779
G1 X98.891 Y133.665 E.01866
G1 X105.738 Y126.818 E.3114
G1 X105.738 Y127.398 E.01866
G1 X99.471 Y133.665 E.28501
G1 X100.051 Y133.665 E.01866
G1 X105.738 Y127.979 E.25861
G1 X105.738 Y128.559 E.01866
G1 X100.632 Y133.665 E.23222
G1 X101.212 Y133.665 E.01866
G1 X105.738 Y129.139 E.20583
G1 X105.738 Y129.72 E.01866
G1 X101.793 Y133.665 E.17944
G1 X102.373 Y133.665 E.01866
G1 X105.738 Y130.3 E.15304
G1 X105.738 Y130.88 E.01866
G1 X102.953 Y133.665 E.12665
G1 X103.534 Y133.665 E.01866
G1 X105.738 Y131.461 E.10026
G1 X105.738 Y132.041 E.01866
G1 X104.114 Y133.665 E.07387
G1 X104.694 Y133.665 E.01866
G1 X105.738 Y132.622 E.04747
G1 X105.738 Y133.202 E.01866
G1 X105.092 Y133.849 E.02941
; WIPE_START
G1 X105.738 Y133.202 E-.34756
G1 X105.738 Y132.622 E-.22054
G1 X105.381 Y132.979 E-.1919
; WIPE_END
G1 E-.04 F1800
G1 X102.026 Y126.123 Z2.9 F15000
G1 X87.291 Y96.014 Z2.9
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.299 Y92.583 Z2.9 F15000
G1 Z2.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y93.243 E.03004
G1 X87.639 Y93.833 E.01896
G1 X88.706 Y92.766 E.04852
G1 X89.295 Y92.766 E.01896
G1 X87.639 Y94.422 E.07533
G1 X87.639 Y95.012 E.01896
G1 X89.885 Y92.766 E.10214
G1 X90.474 Y92.766 E.01896
G1 X87.639 Y95.601 E.12895
G1 X87.639 Y95.665 E.00206
G1 X88.164 Y95.665 E.0169
G1 X91.064 Y92.766 E.13186
G1 X91.653 Y92.766 E.01896
G1 X88.754 Y95.665 E.13186
G1 X89.343 Y95.665 E.01896
G1 X92.243 Y92.766 E.13186
G1 X92.832 Y92.766 E.01896
G1 X89.933 Y95.665 E.13186
G1 X90.522 Y95.665 E.01896
G1 X93.422 Y92.766 E.13186
G1 X94.011 Y92.766 E.01896
G1 X91.112 Y95.665 E.13186
G1 X91.701 Y95.665 E.01896
G1 X94.601 Y92.766 E.13186
G1 X95.191 Y92.766 E.01896
G1 X92.291 Y95.665 E.13186
G1 X92.881 Y95.665 E.01896
G1 X95.78 Y92.766 E.13186
G1 X96.37 Y92.766 E.01896
G1 X93.47 Y95.665 E.13186
G1 X94.06 Y95.665 E.01896
G1 X96.959 Y92.766 E.13186
G1 X97.549 Y92.766 E.01896
G1 X94.649 Y95.665 E.13186
G1 X95.239 Y95.665 E.01896
G1 X98.138 Y92.766 E.13186
G1 X98.728 Y92.766 E.01896
G1 X95.828 Y95.665 E.13186
G1 X96.418 Y95.665 E.01896
G1 X99.317 Y92.766 E.13186
G1 X99.907 Y92.766 E.01896
G1 X97.007 Y95.665 E.13186
G1 X97.597 Y95.665 E.01896
G1 X100.496 Y92.766 E.13186
G1 X101.086 Y92.766 E.01896
G1 X98.186 Y95.665 E.13186
G1 X98.776 Y95.665 E.01896
G1 X101.676 Y92.766 E.13186
G1 X102.265 Y92.766 E.01896
G1 X99.366 Y95.665 E.13186
G1 X99.955 Y95.665 E.01896
G1 X102.855 Y92.766 E.13186
G1 X103.444 Y92.766 E.01896
G1 X100.545 Y95.665 E.13186
G1 X101.134 Y95.665 E.01896
G1 X104.034 Y92.766 E.13186
G1 X104.623 Y92.766 E.01896
G1 X101.724 Y95.665 E.13186
G1 X102.313 Y95.665 E.01896
G1 X105.213 Y92.766 E.13186
G1 X105.738 Y92.766 E.0169
G1 X105.738 Y92.83 E.00206
G1 X102.903 Y95.665 E.12895
G1 X103.492 Y95.665 E.01896
G1 X105.738 Y93.42 E.10214
G1 X105.738 Y94.009 E.01896
G1 X104.082 Y95.665 E.07533
G1 X104.671 Y95.665 E.01896
G1 X105.738 Y94.599 E.04852
G1 X105.738 Y95.188 E.01896
G1 X105.078 Y95.849 E.03004
; WIPE_START
G1 X105.738 Y95.188 E-.35495
G1 X105.738 Y94.599 E-.22403
G1 X105.401 Y94.935 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X102.514 Y87.87 Z2.9 F15000
G1 X97.358 Y75.252 Z2.9
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X95.937 Y75.252 E.0457
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X95.831 Y68.282 E.02016
G1 X96.688 Y68.1 E.02818
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04834
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.418 Y75.252 E.00072
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X95.913 Y68.666 E.01619
G1 X96.688 Y68.501 E.02362
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X91.697 Y81.25 Z2.9 F15000
G1 X87.291 Y89.014 Z2.9
G1 Z2.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.255 Y79.779 Z2.9 F15000
G1 X87.456 Y74.696 Z2.9
G1 Z2.5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y56.414 E.83142
G1 X105.738 Y55.836 E.01859
G1 X87.639 Y73.935 E.82309
G1 X87.639 Y73.357 E.01859
G1 X105.738 Y55.258 E.82309
G1 X105.738 Y54.68 E.01859
G1 X87.639 Y72.779 E.82309
G1 X87.639 Y72.201 E.01859
G1 X105.738 Y54.102 E.82309
G1 X105.738 Y53.524 E.01859
G1 X87.639 Y71.623 E.82309
G1 X87.639 Y71.045 E.01859
G1 X105.738 Y52.945 E.82309
G1 X105.738 Y52.666 E.00899
G1 X105.44 Y52.666 E.0096
G1 X87.639 Y70.467 E.80952
G1 X87.639 Y69.889 E.01859
G1 X104.862 Y52.666 E.78324
G1 X104.284 Y52.666 E.01859
G1 X87.639 Y69.311 E.75695
G1 X87.639 Y68.733 E.01859
G1 X103.706 Y52.666 E.73066
G1 X103.128 Y52.666 E.01859
G1 X87.639 Y68.155 E.70438
G1 X87.639 Y67.577 E.01859
G1 X102.55 Y52.666 E.67809
G1 X101.972 Y52.666 E.01859
G1 X87.639 Y66.999 E.6518
G1 X87.639 Y66.421 E.01859
G1 X101.394 Y52.666 E.62552
G1 X100.816 Y52.666 E.01859
G1 X87.639 Y65.843 E.59923
G1 X87.639 Y65.265 E.01859
G1 X100.238 Y52.666 E.57294
G1 X99.659 Y52.666 E.01859
G1 X87.639 Y64.687 E.54666
M73 P72 R11
G1 X87.639 Y64.109 E.01859
G1 X99.081 Y52.666 E.52037
G1 X98.503 Y52.666 E.01859
G1 X87.639 Y63.531 E.49408
G1 X87.639 Y62.953 E.01859
G1 X97.925 Y52.666 E.4678
G1 X97.347 Y52.666 E.01859
G1 X87.639 Y62.375 E.44151
G1 X87.639 Y61.797 E.01859
G1 X96.769 Y52.666 E.41522
G1 X96.191 Y52.666 E.01859
G1 X87.639 Y61.219 E.38894
G1 X87.639 Y60.64 E.01859
G1 X95.613 Y52.666 E.36265
G1 X95.035 Y52.666 E.01859
G1 X87.639 Y60.062 E.33636
G1 X87.639 Y59.484 E.01859
G1 X94.457 Y52.666 E.31008
G1 X93.879 Y52.666 E.01859
G1 X87.639 Y58.906 E.28379
G1 X87.639 Y58.328 E.01859
G1 X93.301 Y52.666 E.2575
G1 X92.723 Y52.666 E.01859
G1 X87.639 Y57.75 E.23122
G1 X87.639 Y57.172 E.01859
G1 X92.145 Y52.666 E.20493
G1 X91.567 Y52.666 E.01859
G1 X87.639 Y56.594 E.17865
G1 X87.639 Y56.016 E.01859
G1 X90.989 Y52.666 E.15236
G1 X90.411 Y52.666 E.01859
G1 X87.639 Y55.438 E.12607
G1 X87.639 Y54.86 E.01859
G1 X89.833 Y52.666 E.09979
G1 X89.255 Y52.666 E.01859
G1 X87.639 Y54.282 E.0735
G1 X87.639 Y53.704 E.01859
G1 X88.677 Y52.666 E.04721
G1 X88.099 Y52.666 E.01859
G1 X87.456 Y53.309 E.02926
; WIPE_START
G1 X88.099 Y52.666 E-.34573
G1 X88.677 Y52.666 E-.21966
G1 X88.315 Y53.028 E-.19461
; WIPE_END
G1 E-.04 F1800
G1 X94.258 Y57.816 Z2.9 F15000
G1 X105.921 Y67.213 Z2.9
G1 Z2.5
G1 E.8 F1800
G1 F7800
G1 X100.462 Y72.672 E.24826
G1 X100.638 Y72.131 E.01831
G1 X100.618 Y71.939 E.00622
G1 X105.738 Y66.818 E.23285
G1 X105.738 Y66.24 E.01859
G1 X100.563 Y71.415 E.23535
G1 X100.508 Y70.892 E.01691
G1 X105.738 Y65.662 E.23785
G1 X105.738 Y65.084 E.01859
G1 X100.417 Y70.405 E.24197
G1 X100.206 Y70.039 E.01361
G1 X105.738 Y64.506 E.25159
G1 X105.738 Y63.928 E.01859
G1 X99.994 Y69.672 E.26121
G1 X99.783 Y69.306 E.01361
G1 X105.738 Y63.35 E.27084
G1 X105.738 Y62.772 E.01859
G1 X99.531 Y68.979 E.28228
G1 X99.196 Y68.736 E.01331
G1 X105.738 Y62.194 E.2975
G1 X105.738 Y61.616 E.01859
G1 X98.861 Y68.493 E.31273
G1 X98.527 Y68.25 E.01331
G1 X105.738 Y61.038 E.32795
G1 X105.738 Y60.46 E.01859
G1 X98.144 Y68.054 E.34534
G1 X97.668 Y67.952 E.01567
G1 X105.738 Y59.882 E.36701
G1 X105.738 Y59.304 E.01859
G1 X97.191 Y67.851 E.38869
G1 X96.714 Y67.75 E.01567
G1 X105.738 Y58.726 E.41037
G1 X105.738 Y58.148 E.01859
G1 X95.994 Y67.892 E.44312
G1 X95.26 Y68.048 E.02413
G1 X105.738 Y57.57 E.4765
G1 X105.738 Y56.992 E.01859
G1 X87.639 Y75.091 E.82309
G1 X87.639 Y75.669 E.01859
G1 X93.037 Y70.271 E.24549
G2 X92.854 Y71.032 I.763 J.585 E.02591
G1 X87.639 Y76.247 E.23718
G1 X87.639 Y76.825 E.01859
G1 X92.786 Y71.678 E.2341
G2 X92.781 Y72.261 I.653 J.298 E.01932
G1 X87.639 Y77.403 E.23385
G1 X87.639 Y77.981 E.01859
G1 X92.923 Y72.697 E.2403
G1 X93.065 Y73.134 E.01475
G1 X87.639 Y78.559 E.24675
G1 X87.639 Y79.137 E.01859
G1 X93.206 Y73.57 E.25319
G2 X93.44 Y73.914 I.503 J-.091 E.01378
G1 X87.639 Y79.716 E.26384
G1 X87.639 Y80.294 E.01859
G1 X93.714 Y74.218 E.27629
G1 X93.988 Y74.522 E.01316
G1 X87.639 Y80.872 E.28874
G1 X87.639 Y81.45 E.01859
G1 X94.262 Y74.826 E.3012
G2 X94.62 Y75.047 I.426 J-.291 E.01391
G1 X87.639 Y82.028 E.31746
G1 X87.639 Y82.606 E.01859
G1 X95.019 Y75.225 E.33565
G1 X95.419 Y75.403 E.01408
G1 X87.639 Y83.184 E.35384
G1 X87.639 Y83.762 E.01859
G1 X95.819 Y75.581 E.37202
G1 X96.378 Y75.6 E.01798
G1 X87.639 Y84.34 E.39743
G1 X87.639 Y84.918 E.01859
G1 X96.956 Y75.6 E.42372
G1 X97.55 Y75.584 E.01911
G1 X87.639 Y85.496 E.45073
G1 X87.639 Y86.074 E.01859
G1 X105.738 Y67.974 E.82309
G1 X105.738 Y68.552 E.01859
G1 X87.639 Y86.652 E.82309
G1 X87.639 Y87.23 E.01859
G1 X105.738 Y69.13 E.82309
G1 X105.738 Y69.708 E.01859
G1 X87.639 Y87.808 E.82309
G1 X87.639 Y88.386 E.01859
G1 X105.738 Y70.286 E.82309
G1 X105.738 Y70.864 E.01859
G1 X87.937 Y88.665 E.80952
G1 X88.515 Y88.665 E.01859
G1 X105.738 Y71.442 E.78323
G1 X105.738 Y72.021 E.01859
G1 X89.093 Y88.665 E.75694
G1 X89.671 Y88.665 E.01859
G1 X105.738 Y72.599 E.73066
G1 X105.738 Y73.177 E.01859
G1 X90.249 Y88.665 E.70437
G1 X90.827 Y88.665 E.01859
G1 X105.738 Y73.755 E.67808
G1 X105.738 Y74.333 E.01859
G1 X91.405 Y88.665 E.6518
G1 X91.983 Y88.665 E.01859
G1 X105.738 Y74.911 E.62551
G1 X105.738 Y75.489 E.01859
G1 X92.562 Y88.665 E.59923
G1 X93.14 Y88.665 E.01859
G1 X105.738 Y76.067 E.57294
G1 X105.738 Y76.645 E.01859
G1 X93.718 Y88.665 E.54665
G1 X94.296 Y88.665 E.01859
G1 X105.738 Y77.223 E.52037
G1 X105.738 Y77.801 E.01859
G1 X94.874 Y88.665 E.49408
G1 X95.452 Y88.665 E.01859
G1 X105.738 Y78.379 E.46779
G1 X105.738 Y78.957 E.01859
G1 X96.03 Y88.665 E.44151
G1 X96.608 Y88.665 E.01859
G1 X105.738 Y79.535 E.41522
G1 X105.738 Y80.113 E.01859
G1 X97.186 Y88.665 E.38893
G1 X97.764 Y88.665 E.01859
G1 X105.738 Y80.691 E.36265
G1 X105.738 Y81.269 E.01859
G1 X98.342 Y88.665 E.33636
G1 X98.92 Y88.665 E.01859
G1 X105.738 Y81.847 E.31007
G1 X105.738 Y82.425 E.01859
G1 X99.498 Y88.665 E.28379
G1 X100.076 Y88.665 E.01859
G1 X105.738 Y83.003 E.2575
G1 X105.738 Y83.581 E.01859
G1 X100.654 Y88.665 E.23121
G1 X101.232 Y88.665 E.01859
G1 X105.738 Y84.159 E.20493
G1 X105.738 Y84.737 E.01859
G1 X101.81 Y88.665 E.17864
G1 X102.388 Y88.665 E.01859
G1 X105.738 Y85.315 E.15235
G1 X105.738 Y85.893 E.01859
G1 X102.966 Y88.665 E.12607
G1 X103.544 Y88.665 E.01859
G1 X105.738 Y86.471 E.09978
G1 X105.738 Y87.049 E.01859
G1 X104.122 Y88.665 E.07349
G1 X104.7 Y88.665 E.01859
G1 X105.738 Y87.627 E.04721
G1 X105.738 Y88.205 E.01859
G1 X105.095 Y88.849 E.02925
; CHANGE_LAYER
; Z_HEIGHT: 2.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X105.738 Y88.205 E-.34567
G1 X105.738 Y87.627 E-.21965
G1 X105.376 Y87.99 E-.19468
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 13/20
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z2.9 I1.217 J0 P1  F15000
; object ids of layer 13 start: 178
M624 AgAAAAAAAAA=
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
; object ids of this layer13 end: 178
M625
; OBJECT_ID: 178
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X98.869 Y164.579
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X98.814 Y164.641 E.00267
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04834
G1 X95.77 Y158.295 E.01815
G1 X96.688 Y158.1 E.03019
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04835
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.909 Y164.535 E.04375
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X95.852 Y158.679 E.01433
G1 X96.688 Y158.501 E.02548
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X93.544 Y157.933 Z3.1 F15000
G1 X87.291 Y144.418 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.508 Y144.674 Z3.1 F15000
G1 X105.921 Y145.409 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.278 Y144.766 E.02925
G1 X104.7 Y144.766 E.01859
G1 X105.738 Y145.804 E.04721
G1 X105.738 Y146.382 E.01859
G1 X104.122 Y144.766 E.07349
G1 X103.544 Y144.766 E.01859
G1 X105.738 Y146.96 E.09978
G1 X105.738 Y147.538 E.01859
G1 X102.966 Y144.766 E.12607
G1 X102.388 Y144.766 E.01859
G1 X105.738 Y148.116 E.15235
G1 X105.738 Y148.694 E.01859
G1 X101.81 Y144.766 E.17864
G1 X101.232 Y144.766 E.01859
G1 X105.738 Y149.272 E.20493
G1 X105.738 Y149.85 E.01859
G1 X100.654 Y144.766 E.23121
G1 X100.076 Y144.766 E.01859
G1 X105.738 Y150.428 E.2575
G1 X105.738 Y151.006 E.01859
G1 X99.498 Y144.766 E.28379
G1 X98.92 Y144.766 E.01859
G1 X105.738 Y151.584 E.31007
G1 X105.738 Y152.162 E.01859
G1 X98.342 Y144.766 E.33636
G1 X97.764 Y144.766 E.01859
G1 X105.738 Y152.74 E.36265
G1 X105.738 Y153.318 E.01859
G1 X97.186 Y144.766 E.38893
G1 X96.608 Y144.766 E.01859
G1 X105.738 Y153.896 E.41522
G1 X105.738 Y154.474 E.01859
G1 X96.03 Y144.766 E.44151
G1 X95.452 Y144.766 E.01859
G1 X105.738 Y155.052 E.46779
G1 X105.738 Y155.631 E.01859
G1 X94.874 Y144.766 E.49408
G1 X94.296 Y144.766 E.01859
G1 X105.738 Y156.209 E.52037
G1 X105.738 Y156.787 E.01859
G1 X93.718 Y144.766 E.54665
G1 X93.14 Y144.766 E.01859
G1 X105.738 Y157.365 E.57294
G1 X105.738 Y157.943 E.01859
G1 X92.562 Y144.766 E.59923
G1 X91.983 Y144.766 E.01859
G1 X105.738 Y158.521 E.62551
G1 X105.738 Y159.099 E.01859
G1 X91.405 Y144.766 E.6518
G1 X90.827 Y144.766 E.01859
G1 X105.738 Y159.677 E.67808
G1 X105.738 Y160.255 E.01859
G1 X90.249 Y144.766 E.70437
G1 X89.671 Y144.766 E.01859
G1 X105.738 Y160.833 E.73066
G1 X105.738 Y161.411 E.01859
G1 X89.093 Y144.766 E.75694
G1 X88.515 Y144.766 E.01859
G1 X105.738 Y161.989 E.78323
G1 X105.738 Y162.567 E.01859
G1 X87.937 Y144.766 E.80952
G1 X87.639 Y144.766 E.0096
G1 X87.639 Y145.045 E.00899
G1 X105.738 Y163.145 E.82309
G1 X105.738 Y163.723 E.01859
G1 X87.639 Y145.623 E.8231
G1 X87.639 Y146.201 E.01859
G1 X105.738 Y164.301 E.8231
G1 X105.738 Y164.879 E.01859
G1 X87.639 Y146.779 E.8231
G1 X87.639 Y147.358 E.01859
G1 X98.541 Y158.26 E.49581
G1 X98.304 Y158.088 E.00945
G1 X97.652 Y157.949 E.02142
G1 X87.639 Y147.936 E.45538
G1 X87.639 Y148.514 E.01859
G1 X96.918 Y157.793 E.42199
G2 X96.361 Y157.814 I-.255 J.636 E.01847
G1 X87.639 Y149.092 E.39665
G1 X87.639 Y149.67 E.01859
G1 X95.884 Y157.915 E.37497
G1 X95.408 Y158.017 E.01567
G1 X87.639 Y150.248 E.3533
G1 X87.639 Y150.826 E.01859
G1 X94.973 Y158.16 E.33354
G1 X94.638 Y158.403 E.01331
G1 X87.639 Y151.404 E.31832
G1 X87.639 Y151.982 E.01859
G1 X94.304 Y158.647 E.30309
G1 X93.969 Y158.89 E.01331
G1 X87.639 Y152.56 E.28787
G1 X87.639 Y153.138 E.01859
G1 X93.672 Y159.171 E.27437
G1 X93.46 Y159.538 E.01361
G1 X87.639 Y153.716 E.26475
G1 X87.639 Y154.294 E.01859
G1 X93.249 Y159.904 E.25513
G1 X93.037 Y160.27 E.01361
G1 X87.639 Y154.872 E.2455
G1 X87.639 Y155.45 E.01859
G1 X92.889 Y160.7 E.23877
G1 X92.834 Y161.223 E.01691
G1 X87.639 Y156.028 E.23627
G1 X87.639 Y156.606 E.01859
G1 X92.779 Y161.746 E.23377
M73 P73 R11
G2 X92.813 Y162.358 I.703 J.268 E.02028
G1 X87.639 Y157.184 E.23529
G1 X87.639 Y157.762 E.01859
G1 X93.091 Y163.214 E.24794
G1 X93.249 Y163.701 E.01647
G1 X94.354 Y164.929 E.0531
G1 X95.167 Y165.291 E.02863
G1 X105.738 Y175.862 E.48072
G1 X105.738 Y175.284 E.01859
G1 X96.055 Y165.6 E.44035
G1 X96.633 Y165.6 E.01859
G1 X105.738 Y174.706 E.41407
G1 X105.738 Y174.128 E.01859
G1 X97.211 Y165.6 E.38778
G2 X97.704 Y165.516 I.152 J-.596 E.01658
G1 X105.738 Y173.55 E.36535
G1 X105.738 Y172.971 E.01859
G1 X98.104 Y165.338 E.34716
G1 X98.504 Y165.16 E.01408
G1 X105.738 Y172.393 E.32897
G1 X105.738 Y171.815 E.01859
G1 X98.904 Y164.981 E.31078
G2 X99.216 Y164.715 I-.144 J-.483 E.01358
G1 X105.738 Y171.237 E.29663
G1 X105.738 Y170.659 E.01859
G1 X99.489 Y164.41 E.28417
G1 X99.763 Y164.106 E.01316
G1 X105.738 Y170.081 E.27172
G1 X105.738 Y169.503 E.01859
G1 X100.037 Y163.802 E.25926
G2 X100.223 Y163.41 I-.348 J-.405 E.01438
G1 X105.738 Y168.925 E.25083
G1 X105.738 Y168.347 E.01859
G1 X100.364 Y162.973 E.24438
G1 X100.506 Y162.537 E.01475
G1 X105.738 Y167.769 E.23793
G1 X105.738 Y167.191 E.01859
G1 X100.634 Y162.086 E.23214
G1 X100.566 Y161.441 E.02088
G1 X105.738 Y166.613 E.23523
G1 X105.738 Y166.035 E.01859
G1 X100.498 Y160.795 E.23832
G1 X100.466 Y160.488 E.0099
G1 X100.05 Y159.769 E.02671
G1 X105.921 Y165.64 E.267
; WIPE_START
G1 X104.507 Y164.226 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.372 Y171.809 Z3.1 F15000
G1 X105.921 Y176.623 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F7800
G1 X87.639 Y158.34 E.83143
G1 X87.639 Y158.918 E.01859
G1 X105.738 Y177.018 E.8231
G1 X105.738 Y177.596 E.01859
G1 X87.639 Y159.496 E.8231
G1 X87.639 Y160.074 E.01859
G1 X105.738 Y178.174 E.8231
G1 X105.738 Y178.752 E.01859
G1 X87.639 Y160.652 E.82309
G1 X87.639 Y161.23 E.01859
G1 X105.738 Y179.33 E.8231
G1 X105.738 Y179.908 E.01859
G1 X87.639 Y161.808 E.8231
G1 X87.639 Y162.386 E.01859
G1 X105.738 Y180.486 E.8231
G1 X105.738 Y180.765 E.00899
G1 X105.44 Y180.765 E.0096
G1 X87.639 Y162.964 E.80952
G1 X87.639 Y163.542 E.01859
G1 X104.862 Y180.765 E.78324
G1 X104.284 Y180.765 E.01859
G1 X87.639 Y164.12 E.75695
G1 X87.639 Y164.698 E.01859
G1 X103.706 Y180.765 E.73066
G1 X103.128 Y180.765 E.01859
G1 X87.639 Y165.276 E.70438
G1 X87.639 Y165.855 E.01859
G1 X102.55 Y180.765 E.67809
G1 X101.972 Y180.765 E.01859
G1 X87.639 Y166.433 E.6518
G1 X87.639 Y167.011 E.01859
G1 X101.394 Y180.765 E.62552
G1 X100.816 Y180.765 E.01859
G1 X87.639 Y167.589 E.59923
G1 X87.639 Y168.167 E.01859
G1 X100.238 Y180.765 E.57294
G1 X99.659 Y180.765 E.01859
G1 X87.639 Y168.745 E.54666
G1 X87.639 Y169.323 E.01859
G1 X99.081 Y180.765 E.52037
G1 X98.503 Y180.765 E.01859
G1 X87.639 Y169.901 E.49408
G1 X87.639 Y170.479 E.01859
G1 X97.925 Y180.765 E.4678
G1 X97.347 Y180.765 E.01859
G1 X87.639 Y171.057 E.44151
G1 X87.639 Y171.635 E.01859
G1 X96.769 Y180.765 E.41522
G1 X96.191 Y180.765 E.01859
G1 X87.639 Y172.213 E.38894
G1 X87.639 Y172.791 E.01859
G1 X95.613 Y180.765 E.36265
G1 X95.035 Y180.765 E.01859
G1 X87.639 Y173.369 E.33636
G1 X87.639 Y173.947 E.01859
G1 X94.457 Y180.765 E.31008
G1 X93.879 Y180.765 E.01859
G1 X87.639 Y174.525 E.28379
G1 X87.639 Y175.103 E.01859
G1 X93.301 Y180.765 E.2575
G1 X92.723 Y180.765 E.01859
G1 X87.639 Y175.681 E.23122
G1 X87.639 Y176.259 E.01859
G1 X92.145 Y180.765 E.20493
G1 X91.567 Y180.765 E.01859
G1 X87.639 Y176.837 E.17865
G1 X87.639 Y177.415 E.01859
G1 X90.989 Y180.765 E.15236
G1 X90.411 Y180.765 E.01859
G1 X87.639 Y177.993 E.12607
G1 X87.639 Y178.571 E.01859
G1 X89.833 Y180.765 E.09979
G1 X89.255 Y180.765 E.01859
G1 X87.639 Y179.149 E.0735
G1 X87.639 Y179.727 E.01859
G1 X88.677 Y180.765 E.04721
G1 X88.099 Y180.765 E.01859
G1 X87.456 Y180.122 E.02926
; WIPE_START
G1 X88.099 Y180.765 E-.34573
G1 X88.677 Y180.765 E-.21965
G1 X88.315 Y180.403 E-.19462
; WIPE_END
G1 E-.04 F1800
G1 X91.454 Y173.446 Z3.1 F15000
G1 X106.086 Y141.014 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.921 Y138.426 Z3.1 F15000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.261 Y137.766 E.03004
G1 X104.671 Y137.766 E.01896
G1 X105.738 Y138.833 E.04852
G1 X105.738 Y139.422 E.01896
G1 X104.082 Y137.766 E.07533
G1 X103.492 Y137.766 E.01896
G1 X105.738 Y140.012 E.10214
G1 X105.738 Y140.601 E.01896
G1 X102.903 Y137.766 E.12895
G1 X102.313 Y137.766 E.01896
G1 X105.213 Y140.665 E.13186
G1 X104.623 Y140.665 E.01896
G1 X101.724 Y137.766 E.13186
G1 X101.134 Y137.766 E.01896
G1 X104.034 Y140.665 E.13186
G1 X103.444 Y140.665 E.01896
G1 X100.545 Y137.766 E.13186
G1 X99.955 Y137.766 E.01896
G1 X102.855 Y140.665 E.13186
G1 X102.265 Y140.665 E.01896
G1 X99.366 Y137.766 E.13186
G1 X98.776 Y137.766 E.01896
G1 X101.676 Y140.665 E.13186
G1 X101.086 Y140.665 E.01896
G1 X98.186 Y137.766 E.13186
G1 X97.597 Y137.766 E.01896
G1 X100.496 Y140.665 E.13186
G1 X99.907 Y140.665 E.01896
G1 X97.007 Y137.766 E.13186
G1 X96.418 Y137.766 E.01896
G1 X99.317 Y140.665 E.13186
G1 X98.728 Y140.665 E.01896
G1 X95.828 Y137.766 E.13186
G1 X95.239 Y137.766 E.01896
G1 X98.138 Y140.665 E.13186
G1 X97.549 Y140.665 E.01896
G1 X94.649 Y137.766 E.13186
G1 X94.06 Y137.766 E.01896
G1 X96.959 Y140.665 E.13186
G1 X96.37 Y140.665 E.01896
G1 X93.47 Y137.766 E.13186
G1 X92.881 Y137.766 E.01896
G1 X95.78 Y140.665 E.13186
G1 X95.191 Y140.665 E.01896
G1 X92.291 Y137.766 E.13186
G1 X91.701 Y137.766 E.01896
G1 X94.601 Y140.665 E.13186
G1 X94.011 Y140.665 E.01896
G1 X91.112 Y137.766 E.13186
G1 X90.522 Y137.766 E.01896
G1 X93.422 Y140.665 E.13186
G1 X92.832 Y140.665 E.01896
G1 X89.933 Y137.766 E.13186
G1 X89.343 Y137.766 E.01896
G1 X92.243 Y140.665 E.13186
G1 X91.653 Y140.665 E.01896
G1 X88.754 Y137.766 E.13186
G1 X88.164 Y137.766 E.01896
G1 X91.064 Y140.665 E.13186
G1 X90.474 Y140.665 E.01896
G1 X87.639 Y137.83 E.12895
G1 X87.639 Y138.42 E.01896
G1 X89.885 Y140.665 E.10214
G1 X89.295 Y140.665 E.01896
G1 X87.639 Y139.009 E.07533
G1 X87.639 Y139.599 E.01896
G1 X88.706 Y140.665 E.04852
G1 X88.116 Y140.665 E.01896
G1 X87.456 Y140.005 E.03004
; WIPE_START
G1 X88.116 Y140.665 E-.35495
G1 X88.706 Y140.665 E-.22403
G1 X88.369 Y140.329 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X91.357 Y133.306 Z3.1 F15000
G1 X99.417 Y114.368 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X100.127 Y115.598 E.04568
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04835
G1 X94.002 Y114.296 E.04834
G1 X95.218 Y113.413 E.04834
G1 X95.77 Y113.295 E.01816
G1 X96.688 Y113.1 E.03019
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.387 Y114.316 E.00074
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.299 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X95.852 Y113.679 E.01433
G1 X96.688 Y113.501 E.02548
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52888
G1 X99.809 Y116.327 E-.23112
; WIPE_END
G1 E-.04 F1800
G1 X95.268 Y110.193 Z3.1 F15000
G1 X87.291 Y99.418 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.508 Y99.675 Z3.1 F15000
G1 X105.921 Y100.413 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.275 Y99.766 E.02941
G1 X104.694 Y99.766 E.01866
G1 X105.738 Y100.81 E.04747
G1 X105.738 Y101.39 E.01866
G1 X104.114 Y99.766 E.07387
G1 X103.534 Y99.766 E.01866
G1 X105.738 Y101.971 E.10026
G1 X105.738 Y102.551 E.01866
G1 X102.953 Y99.766 E.12665
G1 X102.373 Y99.766 E.01866
G1 X105.738 Y103.131 E.15304
G1 X105.738 Y103.712 E.01866
G1 X101.793 Y99.766 E.17944
G1 X101.212 Y99.766 E.01866
G1 X105.738 Y104.292 E.20583
G1 X105.738 Y104.872 E.01866
G1 X100.632 Y99.766 E.23222
G1 X100.051 Y99.766 E.01866
G1 X105.738 Y105.453 E.25861
G1 X105.738 Y106.033 E.01866
G1 X99.471 Y99.766 E.28501
G1 X98.891 Y99.766 E.01866
G1 X105.738 Y106.613 E.3114
G1 X105.738 Y107.194 E.01866
G1 X98.31 Y99.766 E.33779
G1 X97.73 Y99.766 E.01866
G1 X105.738 Y107.774 E.36419
G1 X105.738 Y108.355 E.01866
G1 X97.15 Y99.766 E.39058
G1 X96.569 Y99.766 E.01866
G1 X105.738 Y108.935 E.41697
G1 X105.738 Y109.515 E.01866
G1 X95.989 Y99.766 E.44336
G1 X95.408 Y99.766 E.01866
G1 X105.738 Y110.096 E.46976
G1 X105.738 Y110.676 E.01866
G1 X94.828 Y99.766 E.49615
G1 X94.248 Y99.766 E.01866
G1 X105.738 Y111.256 E.52254
G1 X105.738 Y111.837 E.01866
G1 X93.667 Y99.766 E.54893
G1 X93.087 Y99.766 E.01866
G1 X105.738 Y112.417 E.57533
G1 X105.738 Y112.997 E.01866
G1 X92.507 Y99.766 E.60172
G1 X91.926 Y99.766 E.01866
G1 X105.738 Y113.578 E.62811
G1 X105.738 Y114.158 E.01866
G1 X91.346 Y99.766 E.6545
G1 X90.766 Y99.766 E.01866
G1 X105.738 Y114.739 E.6809
G1 X105.738 Y115.319 E.01866
G1 X90.185 Y99.766 E.70729
G1 X89.605 Y99.766 E.01866
G1 X105.738 Y115.899 E.73368
G1 X105.738 Y116.48 E.01866
G1 X89.024 Y99.766 E.76007
G1 X88.444 Y99.766 E.01866
G1 X105.738 Y117.06 E.78647
G1 X105.738 Y117.64 E.01866
G1 X87.864 Y99.766 E.81286
G1 X87.639 Y99.766 E.00724
G1 X87.639 Y100.121 E.01143
G1 X105.738 Y118.221 E.8231
G1 X105.738 Y118.801 E.01866
G1 X87.639 Y100.702 E.8231
G1 X87.639 Y101.282 E.01866
G1 X105.738 Y119.382 E.8231
G1 X105.738 Y119.962 E.01866
G1 X87.639 Y101.862 E.8231
G1 X87.639 Y102.443 E.01866
G1 X98.278 Y113.082 E.48384
G1 X97.541 Y112.925 E.02423
G1 X87.639 Y103.023 E.45032
G1 X87.639 Y103.603 E.01866
G1 X96.804 Y112.769 E.41681
G2 X96.285 Y112.83 I-.191 J.614 E.01731
G1 X87.639 Y104.184 E.3932
G1 X87.639 Y104.764 E.01866
G1 X95.806 Y112.932 E.37143
G1 X95.328 Y113.033 E.01573
G1 X87.639 Y105.345 E.34966
G1 X87.639 Y105.925 E.01866
G1 X94.916 Y113.202 E.33093
G1 X94.58 Y113.446 E.01336
G1 X87.639 Y106.505 E.31565
G1 X87.639 Y107.086 E.01866
G1 X94.243 Y113.69 E.30036
G1 X93.907 Y113.935 E.01336
G1 X87.639 Y107.666 E.28507
G1 X87.639 Y108.246 E.01866
G1 X93.632 Y114.24 E.27256
G1 X93.42 Y114.608 E.01366
G1 X87.639 Y108.827 E.2629
G1 X87.639 Y109.407 E.01866
G1 X93.207 Y114.976 E.25324
G1 X92.995 Y115.344 E.01366
G1 X87.639 Y109.987 E.24358
G1 X87.639 Y110.568 E.01866
M73 P73 R10
G1 X92.878 Y115.807 E.23826
G1 X92.823 Y116.332 E.01698
G1 X87.639 Y111.148 E.23575
G1 X87.639 Y111.729 E.01866
G1 X92.768 Y116.857 E.23324
G2 X92.873 Y117.543 I.822 J.225 E.02297
G1 X87.639 Y112.309 E.23802
G1 X87.639 Y112.889 E.01866
G1 X93.152 Y118.403 E.25072
G1 X93.249 Y118.701 E.0101
G1 X94.354 Y119.929 E.05311
G1 X94.938 Y120.189 E.02056
G1 X105.738 Y130.989 E.49114
G1 X105.738 Y130.408 E.01866
G1 X95.93 Y120.6 E.44603
G1 X96.511 Y120.6 E.01866
G1 X105.738 Y129.828 E.41964
G1 X105.738 Y129.248 E.01866
G1 X97.091 Y120.6 E.39325
G2 X97.623 Y120.552 I.212 J-.622 E.01769
G1 X105.738 Y128.667 E.36905
M73 P74 R10
G1 X105.738 Y128.087 E.01866
G1 X98.024 Y120.373 E.35079
G1 X98.426 Y120.194 E.01414
G1 X105.738 Y127.507 E.33253
G1 X105.738 Y126.926 E.01866
G1 X98.828 Y120.016 E.31427
G2 X99.164 Y119.772 I-.106 J-.5 E.01376
G1 X105.738 Y126.346 E.29896
G1 X105.738 Y125.766 E.01866
G1 X99.439 Y119.466 E.28646
G1 X99.714 Y119.161 E.01321
G1 X105.738 Y125.185 E.27396
G1 X105.738 Y124.605 E.01866
G1 X99.989 Y118.856 E.26145
G2 X100.198 Y118.485 I-.312 J-.421 E.01411
G1 X105.738 Y124.024 E.25193
G1 X105.738 Y123.444 E.01866
G1 X100.341 Y118.046 E.24546
G1 X100.483 Y117.608 E.01481
G1 X105.738 Y122.864 E.23899
G1 X105.738 Y122.283 E.01866
G1 X100.625 Y117.17 E.23252
G1 X100.576 Y116.541 E.0203
G1 X105.738 Y121.703 E.23475
G1 X105.738 Y121.123 E.01866
G1 X100.508 Y115.892 E.23785
G2 X100.167 Y114.97 I-1.206 J-.077 E.03256
G1 X105.921 Y120.725 E.26171
; WIPE_START
G1 X104.507 Y119.311 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.369 Y126.895 Z3.1 F15000
G1 X105.921 Y131.752 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F7800
G1 X87.639 Y113.47 E.83143
G1 X87.639 Y114.05 E.01866
G1 X105.738 Y132.15 E.8231
G1 X105.738 Y132.73 E.01866
G1 X87.639 Y114.63 E.8231
G1 X87.639 Y115.211 E.01866
G1 X105.738 Y133.31 E.8231
G1 X105.738 Y133.665 E.01142
G1 X105.513 Y133.665 E.00724
G1 X87.639 Y115.791 E.81286
G1 X87.639 Y116.371 E.01866
G1 X104.933 Y133.665 E.78646
G1 X104.352 Y133.665 E.01866
G1 X87.639 Y116.952 E.76007
G1 X87.639 Y117.532 E.01866
G1 X103.772 Y133.665 E.73368
G1 X103.192 Y133.665 E.01866
G1 X87.639 Y118.113 E.70728
G1 X87.639 Y118.693 E.01866
G1 X102.611 Y133.665 E.68089
G1 X102.031 Y133.665 E.01866
G1 X87.639 Y119.273 E.6545
G1 X87.639 Y119.854 E.01866
G1 X101.451 Y133.665 E.62811
G1 X100.87 Y133.665 E.01866
G1 X87.639 Y120.434 E.60171
G1 X87.639 Y121.014 E.01866
G1 X100.29 Y133.665 E.57532
G1 X99.709 Y133.665 E.01866
G1 X87.639 Y121.595 E.54893
G1 X87.639 Y122.175 E.01866
G1 X99.129 Y133.665 E.52254
G1 X98.549 Y133.665 E.01866
G1 X87.639 Y122.755 E.49614
G1 X87.639 Y123.336 E.01866
G1 X97.968 Y133.665 E.46975
G1 X97.388 Y133.665 E.01866
G1 X87.639 Y123.916 E.44336
G1 X87.639 Y124.497 E.01866
G1 X96.808 Y133.665 E.41697
G1 X96.227 Y133.665 E.01866
G1 X87.639 Y125.077 E.39057
G1 X87.639 Y125.657 E.01866
G1 X95.647 Y133.665 E.36418
G1 X95.067 Y133.665 E.01866
G1 X87.639 Y126.238 E.33779
G1 X87.639 Y126.818 E.01866
G1 X94.486 Y133.665 E.31139
G1 X93.906 Y133.665 E.01866
G1 X87.639 Y127.398 E.285
G1 X87.639 Y127.979 E.01866
G1 X93.325 Y133.665 E.25861
G1 X92.745 Y133.665 E.01866
G1 X87.639 Y128.559 E.23222
G1 X87.639 Y129.139 E.01866
G1 X92.165 Y133.665 E.20582
G1 X91.584 Y133.665 E.01866
G1 X87.639 Y129.72 E.17943
G1 X87.639 Y130.3 E.01866
G1 X91.004 Y133.665 E.15304
G1 X90.424 Y133.665 E.01866
G1 X87.639 Y130.881 E.12665
G1 X87.639 Y131.461 E.01866
G1 X89.843 Y133.665 E.10025
G1 X89.263 Y133.665 E.01866
G1 X87.639 Y132.041 E.07386
G1 X87.639 Y132.622 E.01866
G1 X88.682 Y133.665 E.04747
G1 X88.102 Y133.665 E.01866
G1 X87.456 Y133.019 E.02941
; WIPE_START
G1 X88.102 Y133.665 E-.34749
G1 X88.682 Y133.665 E-.22054
G1 X88.325 Y133.308 E-.19197
; WIPE_END
G1 E-.04 F1800
G1 X88.114 Y125.679 Z3.1 F15000
G1 X87.291 Y96.014 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.456 Y95.005 Z3.1 F15000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X88.116 Y95.665 E.03004
G1 X88.706 Y95.665 E.01896
G1 X87.639 Y94.599 E.04852
G1 X87.639 Y94.009 E.01896
G1 X89.295 Y95.665 E.07533
G1 X89.885 Y95.665 E.01896
G1 X87.639 Y93.42 E.10214
G1 X87.639 Y92.83 E.01896
G1 X90.474 Y95.665 E.12895
G1 X91.064 Y95.665 E.01896
G1 X88.164 Y92.766 E.13186
G1 X88.754 Y92.766 E.01896
G1 X91.653 Y95.665 E.13186
G1 X92.243 Y95.665 E.01896
G1 X89.343 Y92.766 E.13186
G1 X89.933 Y92.766 E.01896
G1 X92.832 Y95.665 E.13186
G1 X93.422 Y95.665 E.01896
G1 X90.522 Y92.766 E.13186
G1 X91.112 Y92.766 E.01896
G1 X94.011 Y95.665 E.13186
G1 X94.601 Y95.665 E.01896
G1 X91.701 Y92.766 E.13186
G1 X92.291 Y92.766 E.01896
G1 X95.191 Y95.665 E.13186
G1 X95.78 Y95.665 E.01896
G1 X92.881 Y92.766 E.13186
G1 X93.47 Y92.766 E.01896
G1 X96.37 Y95.665 E.13186
G1 X96.959 Y95.665 E.01896
G1 X94.06 Y92.766 E.13186
G1 X94.649 Y92.766 E.01896
G1 X97.549 Y95.665 E.13186
G1 X98.138 Y95.665 E.01896
G1 X95.239 Y92.766 E.13186
G1 X95.828 Y92.766 E.01896
G1 X98.728 Y95.665 E.13186
G1 X99.317 Y95.665 E.01896
G1 X96.418 Y92.766 E.13186
G1 X97.007 Y92.766 E.01896
G1 X99.907 Y95.665 E.13186
G1 X100.496 Y95.665 E.01896
G1 X97.597 Y92.766 E.13186
G1 X98.186 Y92.766 E.01896
G1 X101.086 Y95.665 E.13186
G1 X101.676 Y95.665 E.01896
G1 X98.776 Y92.766 E.13186
G1 X99.366 Y92.766 E.01896
G1 X102.265 Y95.665 E.13186
G1 X102.855 Y95.665 E.01896
G1 X99.955 Y92.766 E.13186
G1 X100.545 Y92.766 E.01896
G1 X103.444 Y95.665 E.13186
G1 X104.034 Y95.665 E.01896
G1 X101.134 Y92.766 E.13186
G1 X101.724 Y92.766 E.01896
G1 X104.623 Y95.665 E.13186
G1 X105.213 Y95.665 E.01896
G1 X102.313 Y92.766 E.13186
G1 X102.903 Y92.766 E.01896
G1 X105.738 Y95.601 E.12895
G1 X105.738 Y95.012 E.01896
G1 X103.492 Y92.766 E.10214
G1 X104.082 Y92.766 E.01896
G1 X105.738 Y94.422 E.07533
G1 X105.738 Y93.833 E.01896
G1 X104.671 Y92.766 E.04852
G1 X105.261 Y92.766 E.01896
G1 X105.921 Y93.426 E.03004
; WIPE_START
G1 X105.261 Y92.766 E-.35495
G1 X104.671 Y92.766 E-.22403
G1 X105.008 Y93.103 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X102.001 Y86.088 Z3.1 F15000
G1 X97.357 Y75.252 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X95.937 Y75.252 E.04568
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X95.77 Y68.295 E.01816
G1 X96.688 Y68.1 E.03019
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04835
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.417 Y75.252 E.00074
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X95.852 Y68.679 E.01433
G1 X96.688 Y68.501 E.02548
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X91.697 Y81.25 Z3.1 F15000
G1 X87.291 Y89.014 Z3.1
G1 Z2.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.456 Y88.022 Z3.1 F15000
G1 Z2.7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X88.099 Y88.665 E.02926
G1 X88.677 Y88.665 E.01859
G1 X87.639 Y87.627 E.04721
G1 X87.639 Y87.049 E.01859
G1 X89.255 Y88.665 E.0735
G1 X89.833 Y88.665 E.01859
G1 X87.639 Y86.471 E.09979
G1 X87.639 Y85.893 E.01859
G1 X90.411 Y88.665 E.12607
G1 X90.989 Y88.665 E.01859
G1 X87.639 Y85.315 E.15236
G1 X87.639 Y84.737 E.01859
G1 X91.567 Y88.665 E.17865
G1 X92.145 Y88.665 E.01859
G1 X87.639 Y84.159 E.20493
G1 X87.639 Y83.581 E.01859
G1 X92.723 Y88.665 E.23122
G1 X93.301 Y88.665 E.01859
G1 X87.639 Y83.003 E.2575
G1 X87.639 Y82.425 E.01859
G1 X93.879 Y88.665 E.28379
G1 X94.457 Y88.665 E.01859
G1 X87.639 Y81.847 E.31008
G1 X87.639 Y81.269 E.01859
G1 X95.035 Y88.665 E.33636
G1 X95.613 Y88.665 E.01859
G1 X87.639 Y80.691 E.36265
G1 X87.639 Y80.113 E.01859
G1 X96.191 Y88.665 E.38894
G1 X96.769 Y88.665 E.01859
G1 X87.639 Y79.535 E.41522
G1 X87.639 Y78.957 E.01859
G1 X97.347 Y88.665 E.44151
G1 X97.925 Y88.665 E.01859
G1 X87.639 Y78.379 E.4678
G1 X87.639 Y77.801 E.01859
G1 X98.503 Y88.665 E.49408
G1 X99.081 Y88.665 E.01859
G1 X87.639 Y77.223 E.52037
G1 X87.639 Y76.645 E.01859
G1 X99.659 Y88.665 E.54666
G1 X100.238 Y88.665 E.01859
G1 X87.639 Y76.067 E.57294
G1 X87.639 Y75.489 E.01859
G1 X100.816 Y88.665 E.59923
G1 X101.394 Y88.665 E.01859
G1 X87.639 Y74.911 E.62552
G1 X87.639 Y74.333 E.01859
G1 X101.972 Y88.665 E.6518
G1 X102.55 Y88.665 E.01859
G1 X87.639 Y73.755 E.67809
G1 X87.639 Y73.176 E.01859
G1 X103.128 Y88.665 E.70438
G1 X103.706 Y88.665 E.01859
G1 X87.639 Y72.598 E.73066
G1 X87.639 Y72.02 E.01859
G1 X104.284 Y88.665 E.75695
G1 X104.862 Y88.665 E.01859
G1 X87.639 Y71.442 E.78324
G1 X87.639 Y70.864 E.01859
G1 X105.44 Y88.665 E.80952
G1 X105.738 Y88.665 E.0096
G1 X105.738 Y88.386 E.00899
G1 X87.639 Y70.286 E.8231
G1 X87.639 Y69.708 E.01859
G1 X105.738 Y87.808 E.8231
G1 X105.738 Y87.23 E.01859
G1 X87.639 Y69.13 E.8231
G1 X87.639 Y68.552 E.01859
G1 X105.921 Y86.835 E.83143
; WIPE_START
G1 X104.507 Y85.421 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.623 Y77.87 Z3.1 F15000
G1 X105.921 Y75.852 Z3.1
G1 Z2.7
G1 E.8 F1800
G1 F7800
G1 X100.34 Y70.271 E.25383
G3 X100.523 Y71.032 I-.763 J.586 E.02591
G1 X105.738 Y76.247 E.23718
G1 X105.738 Y76.825 E.01859
G1 X100.591 Y71.678 E.2341
G3 X100.596 Y72.261 I-.653 J.298 E.01932
G1 X105.738 Y77.403 E.23385
G1 X105.738 Y77.981 E.01859
G1 X100.454 Y72.697 E.2403
G1 X100.312 Y73.133 E.01475
G1 X105.738 Y78.559 E.24675
G1 X105.738 Y79.137 E.01859
G1 X100.171 Y73.57 E.25319
G3 X99.937 Y73.914 I-.503 J-.091 E.01378
G1 X105.738 Y79.715 E.26383
G1 X105.738 Y80.293 E.01859
G1 X99.663 Y74.218 E.27629
G1 X99.389 Y74.522 E.01316
G1 X105.738 Y80.871 E.28874
G1 X105.738 Y81.449 E.01859
G1 X99.115 Y74.826 E.3012
G3 X98.758 Y75.047 I-.426 J-.291 E.01391
G1 X105.738 Y82.028 E.31746
G1 X105.738 Y82.606 E.01859
G1 X98.358 Y75.225 E.33564
G1 X97.958 Y75.403 E.01408
G1 X105.738 Y83.184 E.35383
G1 X105.738 Y83.762 E.01859
G1 X97.558 Y75.581 E.37202
G1 X96.999 Y75.6 E.01798
G1 X105.738 Y84.34 E.39743
G1 X105.738 Y84.918 E.01859
G1 X96.421 Y75.6 E.42371
G1 X95.827 Y75.584 E.01911
G1 X105.738 Y85.496 E.45073
G1 X105.738 Y86.074 E.01859
G1 X87.639 Y67.974 E.8231
G1 X87.639 Y67.396 E.01859
G1 X92.915 Y72.672 E.23993
G1 X92.739 Y72.131 E.0183
G1 X92.759 Y71.938 E.00622
G1 X87.639 Y66.818 E.23285
G1 X87.639 Y66.24 E.01859
G1 X92.814 Y71.415 E.23535
G1 X92.869 Y70.892 E.01691
G1 X87.639 Y65.662 E.23785
G1 X87.639 Y65.084 E.01859
G1 X92.96 Y70.405 E.24197
G1 X93.171 Y70.038 E.01361
G1 X87.639 Y64.506 E.2516
G1 X87.639 Y63.928 E.01859
G1 X93.383 Y69.672 E.26122
G1 X93.594 Y69.306 E.01361
G1 X87.639 Y63.35 E.27084
G1 X87.639 Y62.772 E.01859
G1 X93.846 Y68.979 E.28228
G1 X94.181 Y68.736 E.01331
G1 X87.639 Y62.194 E.29751
G1 X87.639 Y61.616 E.01859
G1 X94.516 Y68.493 E.31273
G1 X94.85 Y68.249 E.01331
G1 X87.639 Y61.038 E.32796
G1 X87.639 Y60.46 E.01859
G1 X95.233 Y68.054 E.34534
G1 X95.709 Y67.952 E.01567
G1 X87.639 Y59.882 E.36702
G1 X87.639 Y59.304 E.01859
G1 X96.186 Y67.851 E.3887
G1 X96.663 Y67.75 E.01567
G1 X87.639 Y58.726 E.41038
G1 X87.639 Y58.148 E.01859
G1 X97.383 Y67.892 E.44313
G1 X98.117 Y68.048 E.02413
G1 X87.639 Y57.57 E.47651
G1 X87.639 Y56.992 E.01859
G1 X105.738 Y75.091 E.8231
G1 X105.738 Y74.513 E.01859
G1 X87.639 Y56.414 E.82309
G1 X87.639 Y55.836 E.01859
G1 X105.738 Y73.935 E.82309
G1 X105.738 Y73.357 E.01859
G1 X87.639 Y55.257 E.8231
G1 X87.639 Y54.679 E.01859
G1 X105.738 Y72.779 E.8231
G1 X105.738 Y72.201 E.01859
G1 X87.639 Y54.101 E.8231
G1 X87.639 Y53.523 E.01859
M73 P75 R10
G1 X105.738 Y71.623 E.8231
G1 X105.738 Y71.045 E.01859
G1 X87.639 Y52.945 E.8231
G1 X87.639 Y52.666 E.00899
G1 X87.937 Y52.666 E.0096
G1 X105.738 Y70.467 E.80952
G1 X105.738 Y69.889 E.01859
G1 X88.515 Y52.666 E.78323
G1 X89.093 Y52.666 E.01859
G1 X105.738 Y69.311 E.75694
G1 X105.738 Y68.733 E.01859
G1 X89.671 Y52.666 E.73066
G1 X90.249 Y52.666 E.01859
G1 X105.738 Y68.155 E.70437
G1 X105.738 Y67.577 E.01859
G1 X90.827 Y52.666 E.67808
G1 X91.405 Y52.666 E.01859
G1 X105.738 Y66.999 E.6518
G1 X105.738 Y66.421 E.01859
G1 X91.983 Y52.666 E.62551
G1 X92.562 Y52.666 E.01859
G1 X105.738 Y65.843 E.59922
G1 X105.738 Y65.265 E.01859
G1 X93.14 Y52.666 E.57294
G1 X93.718 Y52.666 E.01859
G1 X105.738 Y64.687 E.54665
G1 X105.738 Y64.109 E.01859
G1 X94.296 Y52.666 E.52037
G1 X94.874 Y52.666 E.01859
G1 X105.738 Y63.531 E.49408
G1 X105.738 Y62.952 E.01859
G1 X95.452 Y52.666 E.46779
G1 X96.03 Y52.666 E.01859
G1 X105.738 Y62.374 E.44151
G1 X105.738 Y61.796 E.01859
G1 X96.608 Y52.666 E.41522
G1 X97.186 Y52.666 E.01859
G1 X105.738 Y61.218 E.38893
G1 X105.738 Y60.64 E.01859
G1 X97.764 Y52.666 E.36265
G1 X98.342 Y52.666 E.01859
G1 X105.738 Y60.062 E.33636
G1 X105.738 Y59.484 E.01859
G1 X98.92 Y52.666 E.31007
G1 X99.498 Y52.666 E.01859
G1 X105.738 Y58.906 E.28379
G1 X105.738 Y58.328 E.01859
G1 X100.076 Y52.666 E.2575
G1 X100.654 Y52.666 E.01859
G1 X105.738 Y57.75 E.23121
G1 X105.738 Y57.172 E.01859
G1 X101.232 Y52.666 E.20493
G1 X101.81 Y52.666 E.01859
G1 X105.738 Y56.594 E.17864
G1 X105.738 Y56.016 E.01859
G1 X102.388 Y52.666 E.15235
G1 X102.966 Y52.666 E.01859
G1 X105.738 Y55.438 E.12607
G1 X105.738 Y54.86 E.01859
G1 X103.544 Y52.666 E.09978
G1 X104.122 Y52.666 E.01859
G1 X105.738 Y54.282 E.07349
G1 X105.738 Y53.704 E.01859
G1 X104.7 Y52.666 E.04721
G1 X105.278 Y52.666 E.01859
G1 X105.921 Y53.309 E.02925
; CHANGE_LAYER
; Z_HEIGHT: 2.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X105.278 Y52.666 E-.34567
G1 X104.7 Y52.666 E-.21966
G1 X105.062 Y53.028 E-.19468
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 14/20
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z3.1 I1.217 J0 P1  F15000
; object ids of layer 14 start: 178
M624 AgAAAAAAAAA=
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
; object ids of this layer14 end: 178
M625
; OBJECT_ID: 178
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X98.869 Y164.579
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X98.814 Y164.641 E.00268
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04835
G1 X95.218 Y158.413 E.04834
G1 X95.709 Y158.308 E.01615
G1 X96.688 Y158.1 E.0322
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04834
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.91 Y164.534 E.04373
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X95.791 Y158.692 E.01248
G1 X96.688 Y158.501 E.02734
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.618 Y164.272 E.03803
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52886
G1 X96.749 Y164.86 E-.23114
; WIPE_END
G1 E-.04 F1800
G1 X93.544 Y157.933 Z3.3 F15000
G1 X87.291 Y144.418 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.282 Y144.583 Z3.3 F15000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y145.226 E.02926
G1 X87.639 Y145.804 E.01859
G1 X88.677 Y144.766 E.04721
G1 X89.255 Y144.766 E.01859
G1 X87.639 Y146.382 E.0735
G1 X87.639 Y146.96 E.01859
G1 X89.833 Y144.766 E.09979
G1 X90.411 Y144.766 E.01859
G1 X87.639 Y147.538 E.12607
G1 X87.639 Y148.116 E.01859
G1 X90.989 Y144.766 E.15236
G1 X91.567 Y144.766 E.01859
G1 X87.639 Y148.694 E.17865
G1 X87.639 Y149.272 E.01859
G1 X92.145 Y144.766 E.20493
G1 X92.723 Y144.766 E.01859
G1 X87.639 Y149.85 E.23122
G1 X87.639 Y150.428 E.01859
G1 X93.301 Y144.766 E.2575
G1 X93.879 Y144.766 E.01859
G1 X87.639 Y151.006 E.28379
G1 X87.639 Y151.584 E.01859
G1 X94.457 Y144.766 E.31008
G1 X95.035 Y144.766 E.01859
G1 X87.639 Y152.162 E.33636
G1 X87.639 Y152.74 E.01859
G1 X95.613 Y144.766 E.36265
G1 X96.191 Y144.766 E.01859
G1 X87.639 Y153.319 E.38894
G1 X87.639 Y153.897 E.01859
G1 X96.769 Y144.766 E.41522
G1 X97.347 Y144.766 E.01859
G1 X87.639 Y154.475 E.44151
G1 X87.639 Y155.053 E.01859
G1 X97.925 Y144.766 E.4678
G1 X98.503 Y144.766 E.01859
G1 X87.639 Y155.631 E.49408
G1 X87.639 Y156.209 E.01859
G1 X99.081 Y144.766 E.52037
G1 X99.659 Y144.766 E.01859
G1 X87.639 Y156.787 E.54666
G1 X87.639 Y157.365 E.01859
G1 X100.238 Y144.766 E.57294
G1 X100.816 Y144.766 E.01859
G1 X87.639 Y157.943 E.59923
G1 X87.639 Y158.521 E.01859
G1 X101.394 Y144.766 E.62552
G1 X101.972 Y144.766 E.01859
G1 X87.639 Y159.099 E.6518
G1 X87.639 Y159.677 E.01859
G1 X102.55 Y144.766 E.67809
G1 X103.128 Y144.766 E.01859
G1 X87.639 Y160.255 E.70438
G1 X87.639 Y160.833 E.01859
G1 X103.706 Y144.766 E.73066
G1 X104.284 Y144.766 E.01859
G1 X87.639 Y161.411 E.75695
G1 X87.639 Y161.989 E.01859
G1 X104.862 Y144.766 E.78324
G1 X105.44 Y144.766 E.01859
G1 X87.639 Y162.567 E.80952
G1 X87.639 Y163.145 E.01859
G1 X105.738 Y145.046 E.82309
G1 X105.738 Y145.624 E.01859
G1 X87.639 Y163.723 E.82309
G1 X87.639 Y164.301 E.01859
G1 X105.738 Y146.202 E.82309
G1 X105.738 Y146.78 E.01859
G1 X87.456 Y165.062 E.83142
; WIPE_START
G1 X88.87 Y163.648 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.005 Y171.231 Z3.3 F15000
G1 X87.456 Y176.045 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F7800
G1 X98.21 Y165.291 E.48906
G1 X97.514 Y165.6 E.02448
G1 X97.322 Y165.6 E.00618
G1 X87.639 Y175.284 E.44036
G1 X87.639 Y174.706 E.01859
G1 X96.744 Y165.6 E.41407
G1 X96.166 Y165.6 E.01859
G1 X87.639 Y174.128 E.38779
G1 X87.639 Y173.55 E.01859
G1 X95.673 Y165.516 E.36535
G1 X95.273 Y165.338 E.01408
G1 X87.639 Y172.972 E.34716
G1 X87.639 Y172.394 E.01859
G1 X94.873 Y165.16 E.32897
G1 X94.473 Y164.981 E.01408
G1 X87.639 Y171.816 E.31078
G1 X87.639 Y171.237 E.01859
G1 X94.161 Y164.715 E.29663
G1 X93.888 Y164.411 E.01316
G1 X87.639 Y170.659 E.28417
G1 X87.639 Y170.081 E.01859
G1 X93.614 Y164.106 E.27172
G1 X93.34 Y163.802 E.01316
G1 X87.639 Y169.503 E.25927
G1 X87.639 Y168.925 E.01859
G1 X93.154 Y163.41 E.25083
G1 X93.013 Y162.973 E.01475
G1 X87.639 Y168.347 E.24438
G1 X87.639 Y167.769 E.01859
G1 X92.871 Y162.537 E.23793
G1 X92.743 Y162.087 E.01506
G1 X87.639 Y167.191 E.23214
G1 X87.639 Y166.613 E.01859
G1 X92.811 Y161.441 E.23523
G1 X92.879 Y160.795 E.02089
G1 X87.639 Y166.035 E.23832
G1 X87.639 Y165.457 E.01859
G1 X93.327 Y159.769 E.25866
G1 X93.737 Y159.058 E.0264
G1 X94.836 Y158.26 E.04368
G1 X105.738 Y147.358 E.49579
G1 X105.738 Y147.936 E.01859
G1 X95.725 Y157.949 E.45537
G1 X96.459 Y157.793 E.02413
G1 X105.738 Y148.514 E.42199
G1 X105.738 Y149.092 E.01859
G1 X97.016 Y157.814 E.39665
G1 X97.493 Y157.915 E.01567
G1 X105.738 Y149.67 E.37497
G1 X105.738 Y150.248 E.01859
G1 X97.97 Y158.017 E.35329
G3 X98.404 Y158.16 I.056 J.56 E.01515
G1 X105.738 Y150.826 E.33354
G1 X105.738 Y151.404 E.01859
G1 X98.739 Y158.403 E.31832
G1 X99.073 Y158.647 E.01331
G1 X105.738 Y151.982 E.30309
G1 X105.738 Y152.56 E.01859
G1 X99.408 Y158.89 E.28787
G3 X99.705 Y159.171 I-.167 J.474 E.01354
G1 X105.738 Y153.138 E.27437
G1 X105.738 Y153.716 E.01859
G1 X99.917 Y159.538 E.26475
G1 X100.128 Y159.904 E.01361
G1 X105.738 Y154.294 E.25512
G1 X105.738 Y154.872 E.01859
G1 X100.34 Y160.271 E.2455
G3 X100.488 Y160.7 I-.409 J.381 E.01506
G1 X105.738 Y155.45 E.23877
G1 X105.738 Y156.028 E.01859
G1 X100.543 Y161.224 E.23627
G1 X100.598 Y161.747 E.01691
G1 X105.738 Y156.606 E.23377
G1 X105.738 Y157.184 E.01859
G1 X100.564 Y162.358 E.23529
G1 X100.286 Y163.214 E.02895
G1 X105.738 Y157.762 E.24794
G1 X105.738 Y158.34 E.01859
G1 X87.639 Y176.44 E.82309
G1 X87.639 Y177.018 E.01859
G1 X105.738 Y158.918 E.82309
G1 X105.738 Y159.496 E.01859
G1 X87.639 Y177.596 E.82309
G1 X87.639 Y178.174 E.01859
G1 X105.738 Y160.074 E.82309
G1 X105.738 Y160.652 E.01859
G1 X87.639 Y178.752 E.82309
G1 X87.639 Y179.33 E.01859
G1 X105.738 Y161.23 E.82309
G1 X105.738 Y161.808 E.01859
G1 X87.639 Y179.908 E.82309
G1 X87.639 Y180.486 E.01859
G1 X105.738 Y162.386 E.82309
G1 X105.738 Y162.964 E.01859
G1 X87.937 Y180.765 E.80952
G1 X88.515 Y180.765 E.01859
G1 X105.738 Y163.543 E.78323
G1 X105.738 Y164.121 E.01859
G1 X89.093 Y180.765 E.75694
G1 X89.671 Y180.765 E.01859
G1 X105.738 Y164.699 E.73066
G1 X105.738 Y165.277 E.01859
G1 X90.249 Y180.765 E.70437
G1 X90.827 Y180.765 E.01859
G1 X105.738 Y165.855 E.67808
G1 X105.738 Y166.433 E.01859
G1 X91.405 Y180.765 E.6518
G1 X91.983 Y180.765 E.01859
G1 X105.738 Y167.011 E.62551
G1 X105.738 Y167.589 E.01859
G1 X92.562 Y180.765 E.59922
G1 X93.14 Y180.765 E.01859
G1 X105.738 Y168.167 E.57294
G1 X105.738 Y168.745 E.01859
G1 X93.718 Y180.765 E.54665
G1 X94.296 Y180.765 E.01859
G1 X105.738 Y169.323 E.52036
G1 X105.738 Y169.901 E.01859
G1 X94.874 Y180.765 E.49408
G1 X95.452 Y180.765 E.01859
G1 X105.738 Y170.479 E.46779
G1 X105.738 Y171.057 E.01859
G1 X96.03 Y180.765 E.44151
G1 X96.608 Y180.765 E.01859
G1 X105.738 Y171.635 E.41522
G1 X105.738 Y172.213 E.01859
G1 X97.186 Y180.765 E.38893
G1 X97.764 Y180.765 E.01859
G1 X105.738 Y172.791 E.36265
G1 X105.738 Y173.369 E.01859
G1 X98.342 Y180.765 E.33636
G1 X98.92 Y180.765 E.01859
G1 X105.738 Y173.947 E.31007
G1 X105.738 Y174.525 E.01859
G1 X99.498 Y180.765 E.28379
G1 X100.076 Y180.765 E.01859
G1 X105.738 Y175.103 E.2575
G1 X105.738 Y175.681 E.01859
G1 X100.654 Y180.765 E.23121
G1 X101.232 Y180.765 E.01859
G1 X105.738 Y176.259 E.20493
G1 X105.738 Y176.837 E.01859
G1 X101.81 Y180.765 E.17864
G1 X102.388 Y180.765 E.01859
G1 X105.738 Y177.415 E.15235
G1 X105.738 Y177.993 E.01859
G1 X102.966 Y180.765 E.12607
G1 X103.544 Y180.765 E.01859
G1 X105.738 Y178.571 E.09978
G1 X105.738 Y179.149 E.01859
G1 X104.122 Y180.765 E.07349
G1 X104.7 Y180.765 E.01859
G1 X105.738 Y179.727 E.04721
G1 X105.738 Y180.305 E.01859
G1 X105.095 Y180.949 E.02925
; WIPE_START
M73 P76 R10
G1 X105.738 Y180.305 E-.34567
G1 X105.738 Y179.727 E-.21965
G1 X105.376 Y180.09 E-.19468
; WIPE_END
G1 E-.04 F1800
G1 X105.515 Y172.458 Z3.3 F15000
G1 X106.086 Y141.014 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.078 Y140.849 Z3.3 F15000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y140.188 E.03004
G1 X105.738 Y139.599 E.01896
G1 X104.671 Y140.665 E.04852
G1 X104.082 Y140.665 E.01896
G1 X105.738 Y139.009 E.07533
G1 X105.738 Y138.42 E.01896
G1 X103.492 Y140.665 E.10214
G1 X102.903 Y140.665 E.01896
G1 X105.738 Y137.83 E.12895
G1 X105.738 Y137.766 E.00206
G1 X105.213 Y137.766 E.0169
G1 X102.313 Y140.665 E.13186
G1 X101.724 Y140.665 E.01896
G1 X104.623 Y137.766 E.13186
G1 X104.034 Y137.766 E.01896
G1 X101.134 Y140.665 E.13186
G1 X100.545 Y140.665 E.01896
G1 X103.444 Y137.766 E.13186
G1 X102.855 Y137.766 E.01896
G1 X99.955 Y140.665 E.13186
G1 X99.366 Y140.665 E.01896
G1 X102.265 Y137.766 E.13186
G1 X101.675 Y137.766 E.01896
G1 X98.776 Y140.665 E.13186
G1 X98.186 Y140.665 E.01896
G1 X101.086 Y137.766 E.13186
G1 X100.496 Y137.766 E.01896
G1 X97.597 Y140.665 E.13186
G1 X97.007 Y140.665 E.01896
G1 X99.907 Y137.766 E.13186
G1 X99.317 Y137.766 E.01896
G1 X96.418 Y140.665 E.13186
G1 X95.828 Y140.665 E.01896
G1 X98.728 Y137.766 E.13186
G1 X98.138 Y137.766 E.01896
G1 X95.239 Y140.665 E.13186
G1 X94.649 Y140.665 E.01896
G1 X97.549 Y137.766 E.13186
G1 X96.959 Y137.766 E.01896
G1 X94.06 Y140.665 E.13186
G1 X93.47 Y140.665 E.01896
G1 X96.37 Y137.766 E.13186
G1 X95.78 Y137.766 E.01896
G1 X92.881 Y140.665 E.13186
G1 X92.291 Y140.665 E.01896
G1 X95.191 Y137.766 E.13186
G1 X94.601 Y137.766 E.01896
G1 X91.701 Y140.665 E.13186
G1 X91.112 Y140.665 E.01896
G1 X94.011 Y137.766 E.13186
G1 X93.422 Y137.766 E.01896
G1 X90.522 Y140.665 E.13186
G1 X89.933 Y140.665 E.01896
G1 X92.832 Y137.766 E.13186
G1 X92.243 Y137.766 E.01896
G1 X89.343 Y140.665 E.13186
G1 X88.754 Y140.665 E.01896
G1 X91.653 Y137.766 E.13186
G1 X91.064 Y137.766 E.01896
G1 X88.164 Y140.665 E.13186
G1 X87.639 Y140.665 E.0169
G1 X87.639 Y140.601 E.00206
G1 X90.474 Y137.766 E.12895
G1 X89.885 Y137.766 E.01896
G1 X87.639 Y140.012 E.10214
G1 X87.639 Y139.422 E.01896
G1 X89.295 Y137.766 E.07533
G1 X88.706 Y137.766 E.01896
G1 X87.639 Y138.833 E.04852
G1 X87.639 Y138.243 E.01896
G1 X88.299 Y137.583 E.03004
; WIPE_START
G1 X87.639 Y138.243 E-.35494
G1 X87.639 Y138.833 E-.22403
G1 X87.976 Y138.496 E-.18103
; WIPE_END
G1 E-.04 F1800
G1 X91.246 Y131.6 Z3.3 F15000
G1 X99.417 Y114.369 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X100.127 Y115.598 E.04566
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X95.709 Y113.308 E.01615
G1 X96.688 Y113.1 E.0322
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.387 Y114.317 E.00075
M204 S250
G1 X99.077 Y114.565 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X95.791 Y113.692 E.01248
G1 X96.688 Y113.501 E.02734
G1 X97.996 Y113.779 E.03982
G1 X99.029 Y114.529 E.03803
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52888
G1 X99.809 Y116.327 E-.23112
; WIPE_END
G1 E-.04 F1800
G1 X95.268 Y110.193 Z3.3 F15000
G1 X87.291 Y99.418 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
M73 P76 R9
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.285 Y99.583 Z3.3 F15000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y100.229 E.02941
G1 X87.639 Y100.81 E.01866
G1 X88.683 Y99.766 E.04747
G1 X89.263 Y99.766 E.01866
G1 X87.639 Y101.39 E.07386
G1 X87.639 Y101.97 E.01866
G1 X89.843 Y99.766 E.10025
G1 X90.424 Y99.766 E.01866
G1 X87.639 Y102.551 E.12665
G1 X87.639 Y103.131 E.01866
G1 X91.004 Y99.766 E.15304
G1 X91.584 Y99.766 E.01866
G1 X87.639 Y103.712 E.17943
G1 X87.639 Y104.292 E.01866
G1 X92.165 Y99.766 E.20582
G1 X92.745 Y99.766 E.01866
G1 X87.639 Y104.872 E.23222
G1 X87.639 Y105.453 E.01866
G1 X93.325 Y99.766 E.25861
G1 X93.906 Y99.766 E.01866
G1 X87.639 Y106.033 E.285
G1 X87.639 Y106.613 E.01866
G1 X94.486 Y99.766 E.31139
G1 X95.067 Y99.766 E.01866
G1 X87.639 Y107.194 E.33779
G1 X87.639 Y107.774 E.01866
G1 X95.647 Y99.766 E.36418
G1 X96.227 Y99.766 E.01866
G1 X87.639 Y108.354 E.39057
G1 X87.639 Y108.935 E.01866
G1 X96.808 Y99.766 E.41697
G1 X97.388 Y99.766 E.01866
G1 X87.639 Y109.515 E.44336
G1 X87.639 Y110.096 E.01866
G1 X97.968 Y99.766 E.46975
G1 X98.549 Y99.766 E.01866
G1 X87.639 Y110.676 E.49614
G1 X87.639 Y111.256 E.01866
G1 X99.129 Y99.766 E.52254
G1 X99.709 Y99.766 E.01866
G1 X87.639 Y111.837 E.54893
G1 X87.639 Y112.417 E.01866
G1 X100.29 Y99.766 E.57532
G1 X100.87 Y99.766 E.01866
G1 X87.639 Y112.997 E.60171
G1 X87.639 Y113.578 E.01866
G1 X101.451 Y99.766 E.62811
G1 X102.031 Y99.766 E.01866
G1 X87.639 Y114.158 E.6545
G1 X87.639 Y114.738 E.01866
G1 X102.611 Y99.766 E.68089
G1 X103.192 Y99.766 E.01866
G1 X87.639 Y115.319 E.70728
G1 X87.639 Y115.899 E.01866
G1 X103.772 Y99.766 E.73368
G1 X104.352 Y99.766 E.01866
G1 X87.639 Y116.48 E.76007
G1 X87.639 Y117.06 E.01866
G1 X104.933 Y99.766 E.78646
G1 X105.513 Y99.766 E.01866
G1 X87.639 Y117.64 E.81286
G1 X87.639 Y118.221 E.01866
G1 X105.738 Y100.121 E.82309
G1 X105.738 Y100.701 E.01866
G1 X87.639 Y118.801 E.82309
G1 X87.639 Y119.381 E.01866
G1 X105.738 Y101.282 E.82309
G1 X105.738 Y101.862 E.01866
G1 X87.456 Y120.145 E.83142
; WIPE_START
G1 X88.87 Y118.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.008 Y126.314 Z3.3 F15000
G1 X87.456 Y131.172 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F7800
G1 X98.439 Y120.189 E.49947
G1 X97.447 Y120.6 E.03453
G1 X87.639 Y130.408 E.44603
G1 X87.639 Y129.828 E.01866
G1 X96.866 Y120.6 E.41963
G1 X96.286 Y120.6 E.01866
G1 X87.639 Y129.248 E.39324
G1 X87.639 Y128.667 E.01866
G1 X95.754 Y120.552 E.36905
G1 X95.352 Y120.373 E.01414
G1 X87.639 Y128.087 E.35079
G1 X87.639 Y127.506 E.01866
G1 X94.951 Y120.194 E.33253
G1 X94.549 Y120.016 E.01414
G1 X87.639 Y126.926 E.31426
G1 X87.639 Y126.346 E.01866
G1 X94.213 Y119.772 E.29896
G1 X93.938 Y119.466 E.01321
G1 X87.639 Y125.765 E.28646
G1 X87.639 Y125.185 E.01866
G1 X93.663 Y119.161 E.27395
G1 X93.388 Y118.856 E.01321
G1 X87.639 Y124.605 E.26145
G1 X87.639 Y124.024 E.01866
G1 X93.179 Y118.484 E.25193
G1 X93.036 Y118.046 E.01481
G1 X87.639 Y123.444 E.24546
G1 X87.639 Y122.864 E.01866
G1 X92.894 Y117.608 E.23899
G1 X92.752 Y117.17 E.01481
G1 X87.639 Y122.283 E.23251
G1 X87.639 Y121.703 E.01866
G1 X92.801 Y116.541 E.23475
G1 X92.869 Y115.892 E.02097
G1 X87.639 Y121.122 E.23785
G1 X87.639 Y120.542 E.01866
G1 X93.211 Y114.97 E.25339
G1 X93.737 Y114.058 E.03386
G1 X95.099 Y113.082 E.05387
G1 X105.738 Y102.443 E.48385
G1 X105.738 Y103.023 E.01866
G1 X95.836 Y112.926 E.45033
G1 X96.573 Y112.769 E.02423
G1 X105.738 Y103.603 E.41681
G1 X105.738 Y104.184 E.01866
G1 X97.092 Y112.83 E.3932
G1 X97.571 Y112.932 E.01573
G1 X105.738 Y104.764 E.37143
G1 X105.738 Y105.344 E.01866
G1 X98.049 Y113.033 E.34967
G3 X98.461 Y113.202 I.017 J.547 E.01474
G1 X105.738 Y105.925 E.33093
G1 X105.738 Y106.505 E.01866
G1 X98.797 Y113.446 E.31565
G1 X99.133 Y113.69 E.01336
G1 X105.738 Y107.085 E.30036
G1 X105.738 Y107.666 E.01866
G1 X99.47 Y113.935 E.28507
G3 X99.745 Y114.24 I-.205 J.462 E.01361
G1 X105.738 Y108.246 E.27256
G1 X105.738 Y108.827 E.01866
G1 X99.957 Y114.608 E.2629
G1 X100.17 Y114.976 E.01366
G1 X105.738 Y109.407 E.25324
G1 X105.738 Y109.987 E.01866
G1 X100.382 Y115.344 E.24358
G3 X100.499 Y115.807 I-.462 J.363 E.01582
G1 X105.738 Y110.568 E.23826
G1 X105.738 Y111.148 E.01866
G1 X100.554 Y116.332 E.23575
G1 X100.609 Y116.857 E.01698
G1 X105.738 Y111.728 E.23324
G1 X105.738 Y112.309 E.01866
G1 X100.504 Y117.543 E.23802
G1 X100.225 Y118.402 E.02907
G1 X105.738 Y112.889 E.25072
G1 X105.738 Y113.47 E.01866
G1 X87.639 Y131.569 E.82309
G1 X87.639 Y132.149 E.01866
G1 X105.738 Y114.05 E.82309
G1 X105.738 Y114.63 E.01866
G1 X87.639 Y132.73 E.82309
G1 X87.639 Y133.31 E.01866
G1 X105.738 Y115.211 E.82309
G1 X105.738 Y115.791 E.01866
G1 X87.864 Y133.665 E.81286
G1 X88.444 Y133.665 E.01866
G1 X105.738 Y116.371 E.78647
G1 X105.738 Y116.952 E.01866
G1 X89.024 Y133.665 E.76008
G1 X89.605 Y133.665 E.01866
G1 X105.738 Y117.532 E.73368
G1 X105.738 Y118.112 E.01866
G1 X90.185 Y133.665 E.70729
G1 X90.766 Y133.665 E.01866
G1 X105.738 Y118.693 E.6809
G1 X105.738 Y119.273 E.01866
G1 X91.346 Y133.665 E.6545
G1 X91.926 Y133.665 E.01866
G1 X105.738 Y119.854 E.62811
G1 X105.738 Y120.434 E.01866
G1 X92.507 Y133.665 E.60172
G1 X93.087 Y133.665 E.01866
G1 X105.738 Y121.014 E.57533
G1 X105.738 Y121.595 E.01866
G1 X93.667 Y133.665 E.54893
G1 X94.248 Y133.665 E.01866
G1 X105.738 Y122.175 E.52254
G1 X105.738 Y122.755 E.01866
G1 X94.828 Y133.665 E.49615
G1 X95.408 Y133.665 E.01866
G1 X105.738 Y123.336 E.46976
G1 X105.738 Y123.916 E.01866
G1 X95.989 Y133.665 E.44336
G1 X96.569 Y133.665 E.01866
G1 X105.738 Y124.496 E.41697
G1 X105.738 Y125.077 E.01866
G1 X97.15 Y133.665 E.39058
G1 X97.73 Y133.665 E.01866
G1 X105.738 Y125.657 E.36419
G1 X105.738 Y126.238 E.01866
G1 X98.31 Y133.665 E.33779
G1 X98.891 Y133.665 E.01866
G1 X105.738 Y126.818 E.3114
G1 X105.738 Y127.398 E.01866
G1 X99.471 Y133.665 E.28501
G1 X100.051 Y133.665 E.01866
G1 X105.738 Y127.979 E.25861
G1 X105.738 Y128.559 E.01866
G1 X100.632 Y133.665 E.23222
G1 X101.212 Y133.665 E.01866
G1 X105.738 Y129.139 E.20583
G1 X105.738 Y129.72 E.01866
G1 X101.793 Y133.665 E.17944
G1 X102.373 Y133.665 E.01866
G1 X105.738 Y130.3 E.15304
G1 X105.738 Y130.88 E.01866
G1 X102.953 Y133.665 E.12665
G1 X103.534 Y133.665 E.01866
G1 X105.738 Y131.461 E.10026
G1 X105.738 Y132.041 E.01866
G1 X104.114 Y133.665 E.07387
G1 X104.694 Y133.665 E.01866
G1 X105.738 Y132.622 E.04747
G1 X105.738 Y133.202 E.01866
G1 X105.092 Y133.849 E.02941
; WIPE_START
G1 X105.738 Y133.202 E-.34756
G1 X105.738 Y132.622 E-.22054
G1 X105.381 Y132.979 E-.1919
; WIPE_END
G1 E-.04 F1800
G1 X102.026 Y126.123 Z3.3 F15000
G1 X87.291 Y96.014 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.299 Y92.583 Z3.3 F15000
G1 Z2.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X87.639 Y93.243 E.03004
G1 X87.639 Y93.833 E.01896
G1 X88.706 Y92.766 E.04852
G1 X89.295 Y92.766 E.01896
G1 X87.639 Y94.422 E.07533
G1 X87.639 Y95.012 E.01896
G1 X89.885 Y92.766 E.10214
G1 X90.474 Y92.766 E.01896
G1 X87.639 Y95.601 E.12895
G1 X87.639 Y95.665 E.00206
G1 X88.164 Y95.665 E.0169
M73 P77 R9
G1 X91.064 Y92.766 E.13186
G1 X91.653 Y92.766 E.01896
G1 X88.754 Y95.665 E.13186
G1 X89.343 Y95.665 E.01896
G1 X92.243 Y92.766 E.13186
G1 X92.832 Y92.766 E.01896
G1 X89.933 Y95.665 E.13186
G1 X90.522 Y95.665 E.01896
G1 X93.422 Y92.766 E.13186
G1 X94.011 Y92.766 E.01896
G1 X91.112 Y95.665 E.13186
G1 X91.701 Y95.665 E.01896
G1 X94.601 Y92.766 E.13186
G1 X95.191 Y92.766 E.01896
G1 X92.291 Y95.665 E.13186
G1 X92.881 Y95.665 E.01896
G1 X95.78 Y92.766 E.13186
G1 X96.37 Y92.766 E.01896
G1 X93.47 Y95.665 E.13186
G1 X94.06 Y95.665 E.01896
G1 X96.959 Y92.766 E.13186
G1 X97.549 Y92.766 E.01896
G1 X94.649 Y95.665 E.13186
G1 X95.239 Y95.665 E.01896
G1 X98.138 Y92.766 E.13186
G1 X98.728 Y92.766 E.01896
G1 X95.828 Y95.665 E.13186
G1 X96.418 Y95.665 E.01896
G1 X99.317 Y92.766 E.13186
G1 X99.907 Y92.766 E.01896
G1 X97.007 Y95.665 E.13186
G1 X97.597 Y95.665 E.01896
G1 X100.496 Y92.766 E.13186
G1 X101.086 Y92.766 E.01896
G1 X98.186 Y95.665 E.13186
G1 X98.776 Y95.665 E.01896
G1 X101.676 Y92.766 E.13186
G1 X102.265 Y92.766 E.01896
G1 X99.366 Y95.665 E.13186
G1 X99.955 Y95.665 E.01896
G1 X102.855 Y92.766 E.13186
G1 X103.444 Y92.766 E.01896
G1 X100.545 Y95.665 E.13186
G1 X101.134 Y95.665 E.01896
G1 X104.034 Y92.766 E.13186
G1 X104.623 Y92.766 E.01896
G1 X101.724 Y95.665 E.13186
G1 X102.313 Y95.665 E.01896
G1 X105.213 Y92.766 E.13186
G1 X105.738 Y92.766 E.0169
G1 X105.738 Y92.83 E.00206
G1 X102.903 Y95.665 E.12895
G1 X103.492 Y95.665 E.01896
G1 X105.738 Y93.42 E.10214
G1 X105.738 Y94.009 E.01896
G1 X104.082 Y95.665 E.07533
G1 X104.671 Y95.665 E.01896
G1 X105.738 Y94.599 E.04852
G1 X105.738 Y95.188 E.01896
G1 X105.078 Y95.849 E.03004
; WIPE_START
G1 X105.738 Y95.188 E-.35495
G1 X105.738 Y94.599 E-.22403
G1 X105.401 Y94.935 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X102.514 Y87.87 Z3.3 F15000
G1 X97.357 Y75.252 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X95.937 Y75.252 E.04566
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X95.709 Y68.308 E.01615
G1 X96.688 Y68.1 E.0322
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04835
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.417 Y75.252 E.00075
M204 S250
G1 X97.357 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X95.791 Y68.692 E.01248
G1 X96.688 Y68.501 E.02734
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.412 Y74.836 E.03803
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52889
G1 X95.464 Y74.613 E-.23111
; WIPE_END
G1 E-.04 F1800
G1 X91.697 Y81.25 Z3.3 F15000
G1 X87.291 Y89.014 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.255 Y79.779 Z3.3 F15000
G1 X87.456 Y74.696 Z3.3
G1 Z2.9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.738 Y56.414 E.83142
G1 X105.738 Y55.836 E.01859
G1 X87.639 Y73.935 E.82309
G1 X87.639 Y73.357 E.01859
G1 X105.738 Y55.258 E.82309
G1 X105.738 Y54.68 E.01859
G1 X87.639 Y72.779 E.82309
G1 X87.639 Y72.201 E.01859
G1 X105.738 Y54.102 E.82309
G1 X105.738 Y53.524 E.01859
G1 X87.639 Y71.623 E.82309
G1 X87.639 Y71.045 E.01859
G1 X105.738 Y52.945 E.82309
G1 X105.738 Y52.666 E.00899
G1 X105.44 Y52.666 E.0096
G1 X87.639 Y70.467 E.80952
G1 X87.639 Y69.889 E.01859
G1 X104.862 Y52.666 E.78324
G1 X104.284 Y52.666 E.01859
G1 X87.639 Y69.311 E.75695
G1 X87.639 Y68.733 E.01859
G1 X103.706 Y52.666 E.73066
G1 X103.128 Y52.666 E.01859
G1 X87.639 Y68.155 E.70438
G1 X87.639 Y67.577 E.01859
G1 X102.55 Y52.666 E.67809
G1 X101.972 Y52.666 E.01859
G1 X87.639 Y66.999 E.6518
G1 X87.639 Y66.421 E.01859
G1 X101.394 Y52.666 E.62552
G1 X100.816 Y52.666 E.01859
G1 X87.639 Y65.843 E.59923
G1 X87.639 Y65.265 E.01859
G1 X100.238 Y52.666 E.57294
G1 X99.659 Y52.666 E.01859
G1 X87.639 Y64.687 E.54666
G1 X87.639 Y64.109 E.01859
G1 X99.081 Y52.666 E.52037
G1 X98.503 Y52.666 E.01859
G1 X87.639 Y63.531 E.49408
G1 X87.639 Y62.953 E.01859
G1 X97.925 Y52.666 E.4678
G1 X97.347 Y52.666 E.01859
G1 X87.639 Y62.375 E.44151
G1 X87.639 Y61.797 E.01859
G1 X96.769 Y52.666 E.41522
G1 X96.191 Y52.666 E.01859
G1 X87.639 Y61.219 E.38894
G1 X87.639 Y60.64 E.01859
G1 X95.613 Y52.666 E.36265
G1 X95.035 Y52.666 E.01859
G1 X87.639 Y60.062 E.33636
G1 X87.639 Y59.484 E.01859
G1 X94.457 Y52.666 E.31008
G1 X93.879 Y52.666 E.01859
G1 X87.639 Y58.906 E.28379
G1 X87.639 Y58.328 E.01859
G1 X93.301 Y52.666 E.2575
G1 X92.723 Y52.666 E.01859
G1 X87.639 Y57.75 E.23122
G1 X87.639 Y57.172 E.01859
G1 X92.145 Y52.666 E.20493
G1 X91.567 Y52.666 E.01859
G1 X87.639 Y56.594 E.17865
G1 X87.639 Y56.016 E.01859
G1 X90.989 Y52.666 E.15236
G1 X90.411 Y52.666 E.01859
G1 X87.639 Y55.438 E.12607
G1 X87.639 Y54.86 E.01859
G1 X89.833 Y52.666 E.09979
G1 X89.255 Y52.666 E.01859
G1 X87.639 Y54.282 E.0735
G1 X87.639 Y53.704 E.01859
G1 X88.677 Y52.666 E.04721
G1 X88.099 Y52.666 E.01859
G1 X87.456 Y53.309 E.02926
; WIPE_START
G1 X88.099 Y52.666 E-.34573
G1 X88.677 Y52.666 E-.21966
G1 X88.315 Y53.028 E-.19461
; WIPE_END
G1 E-.04 F1800
G1 X94.258 Y57.816 Z3.3 F15000
G1 X105.921 Y67.213 Z3.3
G1 Z2.9
G1 E.8 F1800
G1 F7800
G1 X100.462 Y72.672 E.24826
G1 X100.638 Y72.131 E.01831
G1 X100.618 Y71.939 E.00622
G1 X105.738 Y66.818 E.23285
G1 X105.738 Y66.24 E.01859
G1 X100.563 Y71.415 E.23535
G1 X100.508 Y70.892 E.01691
G1 X105.738 Y65.662 E.23785
G1 X105.738 Y65.084 E.01859
G1 X100.417 Y70.405 E.24197
G1 X100.206 Y70.039 E.01361
G1 X105.738 Y64.506 E.25159
G1 X105.738 Y63.928 E.01859
G1 X99.994 Y69.672 E.26121
G1 X99.783 Y69.306 E.01361
G1 X105.738 Y63.35 E.27084
G1 X105.738 Y62.772 E.01859
G1 X99.531 Y68.979 E.28228
G1 X99.196 Y68.736 E.01331
G1 X105.738 Y62.194 E.2975
G1 X105.738 Y61.616 E.01859
G1 X98.861 Y68.493 E.31273
G1 X98.527 Y68.25 E.01331
G1 X105.738 Y61.038 E.32795
G1 X105.738 Y60.46 E.01859
G1 X98.144 Y68.054 E.34534
G1 X97.668 Y67.952 E.01567
G1 X105.738 Y59.882 E.36701
G1 X105.738 Y59.304 E.01859
G1 X97.191 Y67.851 E.38869
G1 X96.714 Y67.75 E.01567
G1 X105.738 Y58.726 E.41037
G1 X105.738 Y58.148 E.01859
G1 X95.994 Y67.892 E.44312
G1 X95.26 Y68.048 E.02413
G1 X105.738 Y57.57 E.4765
G1 X105.738 Y56.992 E.01859
G1 X87.639 Y75.091 E.82309
G1 X87.639 Y75.669 E.01859
G1 X93.037 Y70.271 E.24549
G2 X92.854 Y71.032 I.763 J.585 E.02591
G1 X87.639 Y76.247 E.23718
G1 X87.639 Y76.825 E.01859
G1 X92.786 Y71.678 E.2341
G2 X92.781 Y72.261 I.652 J.298 E.01932
G1 X87.639 Y77.403 E.23385
G1 X87.639 Y77.981 E.01859
G1 X92.923 Y72.697 E.2403
G1 X93.065 Y73.134 E.01475
G1 X87.639 Y78.559 E.24675
G1 X87.639 Y79.137 E.01859
G1 X93.206 Y73.57 E.25319
G2 X93.44 Y73.914 I.503 J-.091 E.01378
G1 X87.639 Y79.716 E.26384
G1 X87.639 Y80.294 E.01859
G1 X93.714 Y74.218 E.27629
G1 X93.988 Y74.522 E.01316
G1 X87.639 Y80.872 E.28874
G1 X87.639 Y81.45 E.01859
G1 X94.262 Y74.826 E.3012
G2 X94.62 Y75.047 I.426 J-.291 E.01391
G1 X87.639 Y82.028 E.31746
G1 X87.639 Y82.606 E.01859
G1 X95.019 Y75.225 E.33565
G1 X95.419 Y75.403 E.01408
G1 X87.639 Y83.184 E.35384
G1 X87.639 Y83.762 E.01859
G1 X95.819 Y75.581 E.37202
G1 X96.378 Y75.6 E.01798
G1 X87.639 Y84.34 E.39743
G1 X87.639 Y84.918 E.01859
G1 X96.956 Y75.6 E.42372
G1 X97.55 Y75.584 E.01911
G1 X87.639 Y85.496 E.45073
G1 X87.639 Y86.074 E.01859
G1 X105.738 Y67.974 E.82309
G1 X105.738 Y68.552 E.01859
G1 X87.639 Y86.652 E.82309
G1 X87.639 Y87.23 E.01859
G1 X105.738 Y69.13 E.82309
G1 X105.738 Y69.708 E.01859
G1 X87.639 Y87.808 E.82309
G1 X87.639 Y88.386 E.01859
G1 X105.738 Y70.286 E.82309
G1 X105.738 Y70.864 E.01859
G1 X87.937 Y88.665 E.80952
G1 X88.515 Y88.665 E.01859
G1 X105.738 Y71.442 E.78323
G1 X105.738 Y72.021 E.01859
G1 X89.093 Y88.665 E.75694
G1 X89.671 Y88.665 E.01859
G1 X105.738 Y72.599 E.73066
G1 X105.738 Y73.177 E.01859
G1 X90.249 Y88.665 E.70437
G1 X90.827 Y88.665 E.01859
G1 X105.738 Y73.755 E.67808
G1 X105.738 Y74.333 E.01859
G1 X91.405 Y88.665 E.6518
G1 X91.983 Y88.665 E.01859
G1 X105.738 Y74.911 E.62551
G1 X105.738 Y75.489 E.01859
G1 X92.562 Y88.665 E.59923
G1 X93.14 Y88.665 E.01859
G1 X105.738 Y76.067 E.57294
G1 X105.738 Y76.645 E.01859
G1 X93.718 Y88.665 E.54665
G1 X94.296 Y88.665 E.01859
G1 X105.738 Y77.223 E.52037
G1 X105.738 Y77.801 E.01859
G1 X94.874 Y88.665 E.49408
G1 X95.452 Y88.665 E.01859
G1 X105.738 Y78.379 E.46779
G1 X105.738 Y78.957 E.01859
G1 X96.03 Y88.665 E.44151
G1 X96.608 Y88.665 E.01859
G1 X105.738 Y79.535 E.41522
G1 X105.738 Y80.113 E.01859
G1 X97.186 Y88.665 E.38893
G1 X97.764 Y88.665 E.01859
G1 X105.738 Y80.691 E.36265
G1 X105.738 Y81.269 E.01859
G1 X98.342 Y88.665 E.33636
G1 X98.92 Y88.665 E.01859
G1 X105.738 Y81.847 E.31007
G1 X105.738 Y82.425 E.01859
G1 X99.498 Y88.665 E.28379
G1 X100.076 Y88.665 E.01859
G1 X105.738 Y83.003 E.2575
G1 X105.738 Y83.581 E.01859
G1 X100.654 Y88.665 E.23121
G1 X101.232 Y88.665 E.01859
G1 X105.738 Y84.159 E.20493
G1 X105.738 Y84.737 E.01859
G1 X101.81 Y88.665 E.17864
G1 X102.388 Y88.665 E.01859
G1 X105.738 Y85.315 E.15235
G1 X105.738 Y85.893 E.01859
G1 X102.966 Y88.665 E.12607
G1 X103.544 Y88.665 E.01859
G1 X105.738 Y86.471 E.09978
G1 X105.738 Y87.049 E.01859
G1 X104.122 Y88.665 E.07349
G1 X104.7 Y88.665 E.01859
G1 X105.738 Y87.627 E.04721
G1 X105.738 Y88.205 E.01859
G1 X105.095 Y88.849 E.02925
; CHANGE_LAYER
; Z_HEIGHT: 3.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X105.738 Y88.205 E-.34567
G1 X105.738 Y87.627 E-.21965
G1 X105.376 Y87.99 E-.19468
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 15/20
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z3.3 I1.217 J0 P1  F15000
; object ids of layer 15 start: 178
M624 AgAAAAAAAAA=
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
; object ids of this layer15 end: 178
M625
; OBJECT_ID: 178
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X98.87 Y164.578
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X98.814 Y164.641 E.0027
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04835
G1 X95.218 Y158.413 E.04834
G1 X95.648 Y158.321 E.01414
G1 X96.688 Y158.1 E.0342
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04834
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.91 Y164.534 E.04372
M204 S250
G1 X98.578 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X98.578 Y164.316 E.00002
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X95.73 Y158.705 E.01062
G1 X96.688 Y158.501 E.0292
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.619 Y164.271 E.03801
; WIPE_START
M204 S5000
G1 X98.578 Y164.316 E-.02303
G1 X97.357 Y164.86 E-.50796
G1 X96.754 Y164.86 E-.22902
; WIPE_END
G1 E-.04 F1800
G1 X93.548 Y157.934 Z3.5 F15000
G1 X87.291 Y144.418 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.508 Y144.674 Z3.5 F15000
G1 X105.921 Y145.409 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.278 Y144.766 E.02925
G1 X104.7 Y144.766 E.01859
G1 X105.738 Y145.804 E.04721
G1 X105.738 Y146.382 E.01859
G1 X104.122 Y144.766 E.07349
G1 X103.544 Y144.766 E.01859
G1 X105.738 Y146.96 E.09978
G1 X105.738 Y147.538 E.01859
G1 X102.966 Y144.766 E.12607
G1 X102.388 Y144.766 E.01859
G1 X105.738 Y148.116 E.15235
G1 X105.738 Y148.694 E.01859
M73 P78 R9
G1 X101.81 Y144.766 E.17864
G1 X101.232 Y144.766 E.01859
G1 X105.738 Y149.272 E.20493
G1 X105.738 Y149.85 E.01859
G1 X100.654 Y144.766 E.23121
G1 X100.076 Y144.766 E.01859
G1 X105.738 Y150.428 E.2575
G1 X105.738 Y151.006 E.01859
G1 X99.498 Y144.766 E.28379
G1 X98.92 Y144.766 E.01859
G1 X105.738 Y151.584 E.31007
G1 X105.738 Y152.162 E.01859
G1 X98.342 Y144.766 E.33636
G1 X97.764 Y144.766 E.01859
G1 X105.738 Y152.74 E.36265
G1 X105.738 Y153.318 E.01859
G1 X97.186 Y144.766 E.38893
G1 X96.608 Y144.766 E.01859
G1 X105.738 Y153.896 E.41522
G1 X105.738 Y154.474 E.01859
G1 X96.03 Y144.766 E.44151
G1 X95.452 Y144.766 E.01859
G1 X105.738 Y155.052 E.46779
G1 X105.738 Y155.631 E.01859
G1 X94.874 Y144.766 E.49408
G1 X94.296 Y144.766 E.01859
G1 X105.738 Y156.209 E.52037
G1 X105.738 Y156.787 E.01859
G1 X93.718 Y144.766 E.54665
G1 X93.14 Y144.766 E.01859
G1 X105.738 Y157.365 E.57294
G1 X105.738 Y157.943 E.01859
G1 X92.562 Y144.766 E.59923
G1 X91.983 Y144.766 E.01859
G1 X105.738 Y158.521 E.62551
G1 X105.738 Y159.099 E.01859
G1 X91.405 Y144.766 E.6518
G1 X90.827 Y144.766 E.01859
G1 X105.738 Y159.677 E.67808
G1 X105.738 Y160.255 E.01859
G1 X90.249 Y144.766 E.70437
G1 X89.671 Y144.766 E.01859
G1 X105.738 Y160.833 E.73066
G1 X105.738 Y161.411 E.01859
G1 X89.093 Y144.766 E.75694
G1 X88.515 Y144.766 E.01859
G1 X105.738 Y161.989 E.78323
G1 X105.738 Y162.567 E.01859
G1 X87.937 Y144.766 E.80952
G1 X87.639 Y144.766 E.0096
G1 X87.639 Y145.045 E.00899
G1 X105.738 Y163.145 E.82309
G1 X105.738 Y163.723 E.01859
G1 X87.639 Y145.623 E.8231
G1 X87.639 Y146.201 E.01859
G1 X105.738 Y164.301 E.8231
G1 X105.738 Y164.879 E.01859
G1 X87.639 Y146.779 E.8231
G1 X87.639 Y147.358 E.01859
G1 X98.541 Y158.26 E.49581
G1 X98.304 Y158.088 E.00944
G1 X97.652 Y157.949 E.02142
G1 X87.639 Y147.936 E.45538
G1 X87.639 Y148.514 E.01859
G1 X96.918 Y157.793 E.42199
G2 X96.361 Y157.814 I-.255 J.636 E.01847
G1 X87.639 Y149.092 E.39665
G1 X87.639 Y149.67 E.01859
G1 X95.884 Y157.915 E.37497
G1 X95.408 Y158.017 E.01567
G1 X87.639 Y150.248 E.3533
G1 X87.639 Y150.826 E.01859
G1 X94.973 Y158.16 E.33354
G1 X94.638 Y158.403 E.01331
G1 X87.639 Y151.404 E.31832
G1 X87.639 Y151.982 E.01859
G1 X94.304 Y158.647 E.30309
G1 X93.969 Y158.89 E.01331
G1 X87.639 Y152.56 E.28787
G1 X87.639 Y153.138 E.01859
G1 X93.672 Y159.171 E.27437
G1 X93.46 Y159.538 E.01361
G1 X87.639 Y153.716 E.26475
G1 X87.639 Y154.294 E.01859
G1 X93.249 Y159.904 E.25513
G1 X93.037 Y160.27 E.01361
G1 X87.639 Y154.872 E.2455
G1 X87.639 Y155.45 E.01859
G1 X92.889 Y160.7 E.23877
G1 X92.834 Y161.223 E.01691
G1 X87.639 Y156.028 E.23627
G1 X87.639 Y156.606 E.01859
G1 X92.779 Y161.746 E.23377
G2 X92.813 Y162.358 I.703 J.268 E.02028
G1 X87.639 Y157.184 E.23529
G1 X87.639 Y157.762 E.01859
G1 X93.091 Y163.214 E.24794
G1 X93.249 Y163.701 E.01647
G1 X94.354 Y164.929 E.0531
G1 X95.167 Y165.291 E.02863
G1 X105.738 Y175.862 E.48072
G1 X105.738 Y175.284 E.01859
G1 X96.055 Y165.6 E.44035
G1 X96.633 Y165.6 E.01859
G1 X105.738 Y174.706 E.41407
G1 X105.738 Y174.128 E.01859
G1 X97.211 Y165.6 E.38778
G2 X97.704 Y165.516 I.152 J-.596 E.01658
G1 X105.738 Y173.55 E.36535
G1 X105.738 Y172.971 E.01859
G1 X98.104 Y165.338 E.34716
G1 X98.504 Y165.16 E.01408
G1 X105.738 Y172.393 E.32897
G1 X105.738 Y171.815 E.01859
G1 X98.904 Y164.981 E.31078
G2 X99.216 Y164.715 I-.144 J-.483 E.01358
G1 X105.738 Y171.237 E.29663
G1 X105.738 Y170.659 E.01859
G1 X99.489 Y164.41 E.28417
G1 X99.763 Y164.106 E.01316
G1 X105.738 Y170.081 E.27172
G1 X105.738 Y169.503 E.01859
G1 X100.037 Y163.802 E.25926
G2 X100.223 Y163.41 I-.348 J-.405 E.01438
G1 X105.738 Y168.925 E.25083
G1 X105.738 Y168.347 E.01859
G1 X100.364 Y162.973 E.24438
G1 X100.506 Y162.537 E.01475
G1 X105.738 Y167.769 E.23793
G1 X105.738 Y167.191 E.01859
G1 X100.634 Y162.086 E.23214
G1 X100.566 Y161.441 E.02088
G1 X105.738 Y166.613 E.23523
G1 X105.738 Y166.035 E.01859
G1 X100.498 Y160.795 E.23832
G1 X100.466 Y160.488 E.0099
G1 X100.05 Y159.769 E.02671
G1 X105.921 Y165.64 E.267
; WIPE_START
G1 X104.507 Y164.226 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.372 Y171.809 Z3.5 F15000
G1 X105.921 Y176.623 Z3.5
G1 Z3.1
G1 E.8 F1800
G1 F7800
G1 X87.639 Y158.34 E.83143
G1 X87.639 Y158.918 E.01859
G1 X105.738 Y177.018 E.8231
G1 X105.738 Y177.596 E.01859
G1 X87.639 Y159.496 E.8231
G1 X87.639 Y160.074 E.01859
G1 X105.738 Y178.174 E.8231
G1 X105.738 Y178.752 E.01859
G1 X87.639 Y160.652 E.82309
G1 X87.639 Y161.23 E.01859
G1 X105.738 Y179.33 E.8231
G1 X105.738 Y179.908 E.01859
G1 X87.639 Y161.808 E.8231
G1 X87.639 Y162.386 E.01859
G1 X105.738 Y180.486 E.8231
G1 X105.738 Y180.765 E.00899
G1 X105.44 Y180.765 E.0096
G1 X87.639 Y162.964 E.80952
G1 X87.639 Y163.542 E.01859
G1 X104.862 Y180.765 E.78324
G1 X104.284 Y180.765 E.01859
G1 X87.639 Y164.12 E.75695
G1 X87.639 Y164.698 E.01859
G1 X103.706 Y180.765 E.73066
G1 X103.128 Y180.765 E.01859
G1 X87.639 Y165.276 E.70438
G1 X87.639 Y165.855 E.01859
G1 X102.55 Y180.765 E.67809
G1 X101.972 Y180.765 E.01859
G1 X87.639 Y166.433 E.6518
G1 X87.639 Y167.011 E.01859
G1 X101.394 Y180.765 E.62552
G1 X100.816 Y180.765 E.01859
G1 X87.639 Y167.589 E.59923
G1 X87.639 Y168.167 E.01859
G1 X100.238 Y180.765 E.57294
G1 X99.659 Y180.765 E.01859
G1 X87.639 Y168.745 E.54666
G1 X87.639 Y169.323 E.01859
G1 X99.081 Y180.765 E.52037
G1 X98.503 Y180.765 E.01859
G1 X87.639 Y169.901 E.49408
G1 X87.639 Y170.479 E.01859
G1 X97.925 Y180.765 E.4678
G1 X97.347 Y180.765 E.01859
G1 X87.639 Y171.057 E.44151
G1 X87.639 Y171.635 E.01859
G1 X96.769 Y180.765 E.41522
G1 X96.191 Y180.765 E.01859
G1 X87.639 Y172.213 E.38894
G1 X87.639 Y172.791 E.01859
G1 X95.613 Y180.765 E.36265
G1 X95.035 Y180.765 E.01859
G1 X87.639 Y173.369 E.33636
G1 X87.639 Y173.947 E.01859
G1 X94.457 Y180.765 E.31008
G1 X93.879 Y180.765 E.01859
G1 X87.639 Y174.525 E.28379
G1 X87.639 Y175.103 E.01859
G1 X93.301 Y180.765 E.2575
G1 X92.723 Y180.765 E.01859
G1 X87.639 Y175.681 E.23122
G1 X87.639 Y176.259 E.01859
G1 X92.145 Y180.765 E.20493
G1 X91.567 Y180.765 E.01859
G1 X87.639 Y176.837 E.17865
G1 X87.639 Y177.415 E.01859
G1 X90.989 Y180.765 E.15236
G1 X90.411 Y180.765 E.01859
G1 X87.639 Y177.993 E.12607
G1 X87.639 Y178.571 E.01859
G1 X89.833 Y180.765 E.09979
G1 X89.255 Y180.765 E.01859
G1 X87.639 Y179.149 E.0735
G1 X87.639 Y179.727 E.01859
G1 X88.677 Y180.765 E.04721
G1 X88.099 Y180.765 E.01859
G1 X87.456 Y180.122 E.02926
; WIPE_START
G1 X88.099 Y180.765 E-.34573
G1 X88.677 Y180.765 E-.21965
G1 X88.315 Y180.403 E-.19462
; WIPE_END
G1 E-.04 F1800
G1 X91.454 Y173.446 Z3.5 F15000
G1 X106.086 Y141.014 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
M73 P78 R8
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.921 Y138.426 Z3.5 F15000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.261 Y137.766 E.03004
G1 X104.671 Y137.766 E.01896
G1 X105.738 Y138.833 E.04852
G1 X105.738 Y139.422 E.01896
G1 X104.082 Y137.766 E.07533
G1 X103.492 Y137.766 E.01896
G1 X105.738 Y140.012 E.10214
G1 X105.738 Y140.601 E.01896
G1 X102.903 Y137.766 E.12895
G1 X102.313 Y137.766 E.01896
G1 X105.213 Y140.665 E.13186
G1 X104.623 Y140.665 E.01896
G1 X101.724 Y137.766 E.13186
G1 X101.134 Y137.766 E.01896
G1 X104.034 Y140.665 E.13186
G1 X103.444 Y140.665 E.01896
G1 X100.545 Y137.766 E.13186
G1 X99.955 Y137.766 E.01896
G1 X102.855 Y140.665 E.13186
G1 X102.265 Y140.665 E.01896
G1 X99.366 Y137.766 E.13186
G1 X98.776 Y137.766 E.01896
G1 X101.676 Y140.665 E.13186
G1 X101.086 Y140.665 E.01896
G1 X98.186 Y137.766 E.13186
G1 X97.597 Y137.766 E.01896
G1 X100.496 Y140.665 E.13186
G1 X99.907 Y140.665 E.01896
G1 X97.007 Y137.766 E.13186
G1 X96.418 Y137.766 E.01896
G1 X99.317 Y140.665 E.13186
G1 X98.728 Y140.665 E.01896
G1 X95.828 Y137.766 E.13186
G1 X95.239 Y137.766 E.01896
G1 X98.138 Y140.665 E.13186
G1 X97.549 Y140.665 E.01896
G1 X94.649 Y137.766 E.13186
G1 X94.06 Y137.766 E.01896
G1 X96.959 Y140.665 E.13186
G1 X96.37 Y140.665 E.01896
G1 X93.47 Y137.766 E.13186
G1 X92.881 Y137.766 E.01896
G1 X95.78 Y140.665 E.13186
G1 X95.191 Y140.665 E.01896
G1 X92.291 Y137.766 E.13186
G1 X91.701 Y137.766 E.01896
G1 X94.601 Y140.665 E.13186
G1 X94.011 Y140.665 E.01896
G1 X91.112 Y137.766 E.13186
G1 X90.522 Y137.766 E.01896
G1 X93.422 Y140.665 E.13186
G1 X92.832 Y140.665 E.01896
G1 X89.933 Y137.766 E.13186
G1 X89.343 Y137.766 E.01896
G1 X92.243 Y140.665 E.13186
G1 X91.653 Y140.665 E.01896
G1 X88.754 Y137.766 E.13186
G1 X88.164 Y137.766 E.01896
G1 X91.064 Y140.665 E.13186
G1 X90.474 Y140.665 E.01896
G1 X87.639 Y137.83 E.12895
G1 X87.639 Y138.42 E.01896
G1 X89.885 Y140.665 E.10214
G1 X89.295 Y140.665 E.01896
G1 X87.639 Y139.009 E.07533
G1 X87.639 Y139.599 E.01896
G1 X88.706 Y140.665 E.04852
G1 X88.116 Y140.665 E.01896
G1 X87.456 Y140.005 E.03004
; WIPE_START
G1 X88.116 Y140.665 E-.35495
G1 X88.706 Y140.665 E-.22403
G1 X88.369 Y140.329 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X91.321 Y133.29 Z3.5 F15000
G1 X99.307 Y114.247 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X99.375 Y114.296 E.0027
G1 X100.127 Y115.598 E.04834
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X95.648 Y113.321 E.01414
G1 X96.688 Y113.1 E.0342
G1 X98.159 Y113.413 E.04834
G1 X99.259 Y114.212 E.04372
M204 S250
G1 X99.077 Y114.564 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.077 Y114.565 E.00002
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X95.73 Y113.705 E.01062
G1 X96.688 Y113.501 E.0292
G1 X97.996 Y113.779 E.03982
G1 X99.028 Y114.529 E.03801
; WIPE_START
M204 S5000
G1 X99.077 Y114.565 E-.02303
G1 X99.746 Y115.722 E-.50795
G1 X99.809 Y116.322 E-.22901
; WIPE_END
G1 E-.04 F1800
G1 X95.266 Y110.188 Z3.5 F15000
G1 X87.291 Y99.418 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.508 Y99.675 Z3.5 F15000
G1 X105.921 Y100.413 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X105.275 Y99.766 E.02941
G1 X104.694 Y99.766 E.01866
G1 X105.738 Y100.81 E.04747
G1 X105.738 Y101.39 E.01866
G1 X104.114 Y99.766 E.07387
G1 X103.534 Y99.766 E.01866
G1 X105.738 Y101.971 E.10026
G1 X105.738 Y102.551 E.01866
G1 X102.953 Y99.766 E.12665
G1 X102.373 Y99.766 E.01866
G1 X105.738 Y103.131 E.15304
G1 X105.738 Y103.712 E.01866
G1 X101.793 Y99.766 E.17944
G1 X101.212 Y99.766 E.01866
G1 X105.738 Y104.292 E.20583
G1 X105.738 Y104.872 E.01866
G1 X100.632 Y99.766 E.23222
G1 X100.051 Y99.766 E.01866
G1 X105.738 Y105.453 E.25861
G1 X105.738 Y106.033 E.01866
G1 X99.471 Y99.766 E.28501
G1 X98.891 Y99.766 E.01866
G1 X105.738 Y106.613 E.3114
G1 X105.738 Y107.194 E.01866
G1 X98.31 Y99.766 E.33779
G1 X97.73 Y99.766 E.01866
G1 X105.738 Y107.774 E.36419
G1 X105.738 Y108.355 E.01866
G1 X97.15 Y99.766 E.39058
G1 X96.569 Y99.766 E.01866
G1 X105.738 Y108.935 E.41697
G1 X105.738 Y109.515 E.01866
G1 X95.989 Y99.766 E.44336
G1 X95.408 Y99.766 E.01866
G1 X105.738 Y110.096 E.46976
G1 X105.738 Y110.676 E.01866
G1 X94.828 Y99.766 E.49615
G1 X94.248 Y99.766 E.01866
G1 X105.738 Y111.256 E.52254
G1 X105.738 Y111.837 E.01866
M73 P79 R8
G1 X93.667 Y99.766 E.54893
G1 X93.087 Y99.766 E.01866
G1 X105.738 Y112.417 E.57533
G1 X105.738 Y112.997 E.01866
G1 X92.507 Y99.766 E.60172
G1 X91.926 Y99.766 E.01866
G1 X105.738 Y113.578 E.62811
G1 X105.738 Y114.158 E.01866
G1 X91.346 Y99.766 E.6545
G1 X90.766 Y99.766 E.01866
G1 X105.738 Y114.739 E.6809
G1 X105.738 Y115.319 E.01866
G1 X90.185 Y99.766 E.70729
G1 X89.605 Y99.766 E.01866
G1 X105.738 Y115.899 E.73368
G1 X105.738 Y116.48 E.01866
G1 X89.024 Y99.766 E.76007
G1 X88.444 Y99.766 E.01866
G1 X105.738 Y117.06 E.78647
G1 X105.738 Y117.64 E.01866
G1 X87.864 Y99.766 E.81286
G1 X87.639 Y99.766 E.00724
G1 X87.639 Y100.121 E.01143
G1 X105.738 Y118.221 E.8231
G1 X105.738 Y118.801 E.01866
G1 X87.639 Y100.702 E.8231
G1 X87.639 Y101.282 E.01866
G1 X105.738 Y119.382 E.8231
G1 X105.738 Y119.962 E.01866
G1 X87.639 Y101.862 E.8231
G1 X87.639 Y102.443 E.01866
G1 X98.278 Y113.082 E.48384
G1 X97.541 Y112.925 E.02423
G1 X87.639 Y103.023 E.45032
G1 X87.639 Y103.603 E.01866
G1 X96.804 Y112.769 E.41681
G2 X96.285 Y112.83 I-.191 J.614 E.01731
G1 X87.639 Y104.184 E.3932
G1 X87.639 Y104.764 E.01866
G1 X95.806 Y112.932 E.37143
G1 X95.328 Y113.033 E.01573
G1 X87.639 Y105.345 E.34966
G1 X87.639 Y105.925 E.01866
G1 X94.916 Y113.202 E.33093
G1 X94.58 Y113.446 E.01336
G1 X87.639 Y106.505 E.31565
G1 X87.639 Y107.086 E.01866
G1 X94.243 Y113.69 E.30036
G1 X93.907 Y113.935 E.01336
G1 X87.639 Y107.666 E.28507
G1 X87.639 Y108.246 E.01866
G1 X93.632 Y114.24 E.27256
G1 X93.42 Y114.608 E.01366
G1 X87.639 Y108.827 E.2629
G1 X87.639 Y109.407 E.01866
G1 X93.207 Y114.976 E.25324
G1 X92.995 Y115.344 E.01366
G1 X87.639 Y109.987 E.24358
G1 X87.639 Y110.568 E.01866
G1 X92.878 Y115.807 E.23826
G1 X92.823 Y116.332 E.01698
G1 X87.639 Y111.148 E.23575
G1 X87.639 Y111.729 E.01866
G1 X92.768 Y116.857 E.23324
G2 X92.873 Y117.543 I.822 J.225 E.02297
G1 X87.639 Y112.309 E.23802
G1 X87.639 Y112.889 E.01866
G1 X93.152 Y118.403 E.25072
G1 X93.249 Y118.701 E.01011
G1 X94.354 Y119.929 E.0531
G1 X94.938 Y120.189 E.02056
G1 X105.738 Y130.989 E.49114
G1 X105.738 Y130.408 E.01866
G1 X95.93 Y120.6 E.44603
G1 X96.511 Y120.6 E.01866
G1 X105.738 Y129.828 E.41964
G1 X105.738 Y129.248 E.01866
G1 X97.091 Y120.6 E.39325
G2 X97.623 Y120.552 I.212 J-.622 E.01769
G1 X105.738 Y128.667 E.36905
G1 X105.738 Y128.087 E.01866
G1 X98.024 Y120.373 E.35079
G1 X98.426 Y120.194 E.01414
G1 X105.738 Y127.507 E.33253
G1 X105.738 Y126.926 E.01866
G1 X98.828 Y120.016 E.31427
G2 X99.164 Y119.772 I-.106 J-.5 E.01376
G1 X105.738 Y126.346 E.29896
G1 X105.738 Y125.766 E.01866
G1 X99.439 Y119.466 E.28646
G1 X99.714 Y119.161 E.01321
G1 X105.738 Y125.185 E.27396
G1 X105.738 Y124.605 E.01866
G1 X99.989 Y118.856 E.26145
G2 X100.198 Y118.485 I-.312 J-.421 E.01411
G1 X105.738 Y124.024 E.25193
G1 X105.738 Y123.444 E.01866
G1 X100.341 Y118.046 E.24546
G1 X100.483 Y117.608 E.01481
G1 X105.738 Y122.864 E.23899
G1 X105.738 Y122.283 E.01866
G1 X100.625 Y117.17 E.23252
G1 X100.576 Y116.541 E.0203
G1 X105.738 Y121.703 E.23475
G1 X105.738 Y121.123 E.01866
G1 X100.508 Y115.892 E.23785
G2 X100.167 Y114.971 I-1.206 J-.077 E.03256
G1 X105.921 Y120.725 E.26171
; WIPE_START
G1 X104.507 Y119.311 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.369 Y126.895 Z3.5 F15000
G1 X105.921 Y131.752 Z3.5
G1 Z3.1
G1 E.8 F1800
G1 F7800
G1 X87.639 Y113.47 E.83143
G1 X87.639 Y114.05 E.01866
G1 X105.738 Y132.15 E.8231
G1 X105.738 Y132.73 E.01866
G1 X87.639 Y114.63 E.8231
G1 X87.639 Y115.211 E.01866
G1 X105.738 Y133.31 E.8231
G1 X105.738 Y133.665 E.01142
G1 X105.513 Y133.665 E.00724
G1 X87.639 Y115.791 E.81286
G1 X87.639 Y116.371 E.01866
G1 X104.933 Y133.665 E.78646
G1 X104.352 Y133.665 E.01866
G1 X87.639 Y116.952 E.76007
G1 X87.639 Y117.532 E.01866
G1 X103.772 Y133.665 E.73368
G1 X103.192 Y133.665 E.01866
G1 X87.639 Y118.113 E.70728
G1 X87.639 Y118.693 E.01866
G1 X102.611 Y133.665 E.68089
G1 X102.031 Y133.665 E.01866
G1 X87.639 Y119.273 E.6545
G1 X87.639 Y119.854 E.01866
G1 X101.451 Y133.665 E.62811
G1 X100.87 Y133.665 E.01866
G1 X87.639 Y120.434 E.60171
G1 X87.639 Y121.014 E.01866
G1 X100.29 Y133.665 E.57532
G1 X99.709 Y133.665 E.01866
G1 X87.639 Y121.595 E.54893
G1 X87.639 Y122.175 E.01866
G1 X99.129 Y133.665 E.52254
G1 X98.549 Y133.665 E.01866
G1 X87.639 Y122.755 E.49614
G1 X87.639 Y123.336 E.01866
G1 X97.968 Y133.665 E.46975
G1 X97.388 Y133.665 E.01866
G1 X87.639 Y123.916 E.44336
G1 X87.639 Y124.497 E.01866
G1 X96.808 Y133.665 E.41697
G1 X96.227 Y133.665 E.01866
G1 X87.639 Y125.077 E.39057
G1 X87.639 Y125.657 E.01866
G1 X95.647 Y133.665 E.36418
G1 X95.067 Y133.665 E.01866
G1 X87.639 Y126.238 E.33779
G1 X87.639 Y126.818 E.01866
G1 X94.486 Y133.665 E.31139
G1 X93.906 Y133.665 E.01866
G1 X87.639 Y127.398 E.285
G1 X87.639 Y127.979 E.01866
G1 X93.325 Y133.665 E.25861
G1 X92.745 Y133.665 E.01866
G1 X87.639 Y128.559 E.23222
G1 X87.639 Y129.139 E.01866
G1 X92.165 Y133.665 E.20582
G1 X91.584 Y133.665 E.01866
G1 X87.639 Y129.72 E.17943
G1 X87.639 Y130.3 E.01866
G1 X91.004 Y133.665 E.15304
G1 X90.424 Y133.665 E.01866
G1 X87.639 Y130.881 E.12665
G1 X87.639 Y131.461 E.01866
G1 X89.843 Y133.665 E.10025
G1 X89.263 Y133.665 E.01866
G1 X87.639 Y132.041 E.07386
G1 X87.639 Y132.622 E.01866
G1 X88.682 Y133.665 E.04747
G1 X88.102 Y133.665 E.01866
G1 X87.456 Y133.019 E.02941
; WIPE_START
G1 X88.102 Y133.665 E-.34749
G1 X88.682 Y133.665 E-.22054
G1 X88.325 Y133.308 E-.19197
; WIPE_END
G1 E-.04 F1800
G1 X88.114 Y125.679 Z3.5 F15000
G1 X87.291 Y96.014 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.456 Y95.005 Z3.5 F15000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X88.116 Y95.665 E.03004
G1 X88.706 Y95.665 E.01896
G1 X87.639 Y94.599 E.04852
G1 X87.639 Y94.009 E.01896
G1 X89.295 Y95.665 E.07533
G1 X89.885 Y95.665 E.01896
G1 X87.639 Y93.42 E.10214
G1 X87.639 Y92.83 E.01896
G1 X90.474 Y95.665 E.12895
G1 X91.064 Y95.665 E.01896
G1 X88.164 Y92.766 E.13186
G1 X88.754 Y92.766 E.01896
G1 X91.653 Y95.665 E.13186
G1 X92.243 Y95.665 E.01896
G1 X89.343 Y92.766 E.13186
G1 X89.933 Y92.766 E.01896
G1 X92.832 Y95.665 E.13186
G1 X93.422 Y95.665 E.01896
G1 X90.522 Y92.766 E.13186
G1 X91.112 Y92.766 E.01896
G1 X94.011 Y95.665 E.13186
G1 X94.601 Y95.665 E.01896
G1 X91.701 Y92.766 E.13186
G1 X92.291 Y92.766 E.01896
G1 X95.191 Y95.665 E.13186
G1 X95.78 Y95.665 E.01896
G1 X92.881 Y92.766 E.13186
G1 X93.47 Y92.766 E.01896
G1 X96.37 Y95.665 E.13186
G1 X96.959 Y95.665 E.01896
G1 X94.06 Y92.766 E.13186
G1 X94.649 Y92.766 E.01896
G1 X97.549 Y95.665 E.13186
G1 X98.138 Y95.665 E.01896
G1 X95.239 Y92.766 E.13186
G1 X95.828 Y92.766 E.01896
G1 X98.728 Y95.665 E.13186
G1 X99.317 Y95.665 E.01896
G1 X96.418 Y92.766 E.13186
G1 X97.007 Y92.766 E.01896
G1 X99.907 Y95.665 E.13186
G1 X100.496 Y95.665 E.01896
G1 X97.597 Y92.766 E.13186
G1 X98.186 Y92.766 E.01896
G1 X101.086 Y95.665 E.13186
G1 X101.676 Y95.665 E.01896
G1 X98.776 Y92.766 E.13186
G1 X99.366 Y92.766 E.01896
G1 X102.265 Y95.665 E.13186
G1 X102.855 Y95.665 E.01896
G1 X99.955 Y92.766 E.13186
G1 X100.545 Y92.766 E.01896
G1 X103.444 Y95.665 E.13186
G1 X104.034 Y95.665 E.01896
G1 X101.134 Y92.766 E.13186
G1 X101.724 Y92.766 E.01896
G1 X104.623 Y95.665 E.13186
G1 X105.213 Y95.665 E.01896
G1 X102.313 Y92.766 E.13186
G1 X102.903 Y92.766 E.01896
G1 X105.738 Y95.601 E.12895
G1 X105.738 Y95.012 E.01896
G1 X103.492 Y92.766 E.10214
G1 X104.082 Y92.766 E.01896
G1 X105.738 Y94.422 E.07533
G1 X105.738 Y93.833 E.01896
G1 X104.671 Y92.766 E.04852
G1 X105.261 Y92.766 E.01896
G1 X105.921 Y93.426 E.03004
; WIPE_START
G1 X105.261 Y92.766 E-.35495
G1 X104.671 Y92.766 E-.22403
G1 X105.008 Y93.103 E-.18102
; WIPE_END
G1 E-.04 F1800
G1 X102.001 Y86.088 Z3.5 F15000
G1 X97.356 Y75.252 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X95.937 Y75.252 E.04565
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X95.648 Y68.321 E.01414
G1 X96.688 Y68.1 E.0342
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04834
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.416 Y75.252 E.00077
M204 S250
G1 X97.356 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.0398
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X95.73 Y68.705 E.01062
G1 X96.688 Y68.501 E.0292
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.411 Y74.836 E.03805
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52867
G1 X95.464 Y74.613 E-.23133
; WIPE_END
G1 E-.04 F1800
G1 X91.697 Y81.25 Z3.5 F15000
G1 X87.291 Y89.014 Z3.5
G1 Z3.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.456 Y88.022 Z3.5 F15000
G1 Z3.1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X88.099 Y88.665 E.02926
G1 X88.677 Y88.665 E.01859
G1 X87.639 Y87.627 E.04721
G1 X87.639 Y87.049 E.01859
G1 X89.255 Y88.665 E.0735
G1 X89.833 Y88.665 E.01859
G1 X87.639 Y86.471 E.09979
G1 X87.639 Y85.893 E.01859
G1 X90.411 Y88.665 E.12607
G1 X90.989 Y88.665 E.01859
G1 X87.639 Y85.315 E.15236
G1 X87.639 Y84.737 E.01859
G1 X91.567 Y88.665 E.17865
G1 X92.145 Y88.665 E.01859
G1 X87.639 Y84.159 E.20493
G1 X87.639 Y83.581 E.01859
G1 X92.723 Y88.665 E.23122
G1 X93.301 Y88.665 E.01859
G1 X87.639 Y83.003 E.2575
G1 X87.639 Y82.425 E.01859
G1 X93.879 Y88.665 E.28379
G1 X94.457 Y88.665 E.01859
G1 X87.639 Y81.847 E.31008
G1 X87.639 Y81.269 E.01859
G1 X95.035 Y88.665 E.33636
G1 X95.613 Y88.665 E.01859
G1 X87.639 Y80.691 E.36265
G1 X87.639 Y80.113 E.01859
G1 X96.191 Y88.665 E.38894
G1 X96.769 Y88.665 E.01859
G1 X87.639 Y79.535 E.41522
G1 X87.639 Y78.957 E.01859
G1 X97.347 Y88.665 E.44151
G1 X97.925 Y88.665 E.01859
G1 X87.639 Y78.379 E.4678
G1 X87.639 Y77.801 E.01859
G1 X98.503 Y88.665 E.49408
G1 X99.081 Y88.665 E.01859
G1 X87.639 Y77.223 E.52037
G1 X87.639 Y76.645 E.01859
G1 X99.659 Y88.665 E.54666
G1 X100.238 Y88.665 E.01859
G1 X87.639 Y76.067 E.57294
G1 X87.639 Y75.489 E.01859
G1 X100.816 Y88.665 E.59923
G1 X101.394 Y88.665 E.01859
G1 X87.639 Y74.911 E.62552
G1 X87.639 Y74.333 E.01859
G1 X101.972 Y88.665 E.6518
G1 X102.55 Y88.665 E.01859
G1 X87.639 Y73.755 E.67809
G1 X87.639 Y73.176 E.01859
G1 X103.128 Y88.665 E.70438
G1 X103.706 Y88.665 E.01859
G1 X87.639 Y72.598 E.73066
G1 X87.639 Y72.02 E.01859
G1 X104.284 Y88.665 E.75695
G1 X104.862 Y88.665 E.01859
G1 X87.639 Y71.442 E.78324
G1 X87.639 Y70.864 E.01859
G1 X105.44 Y88.665 E.80952
G1 X105.738 Y88.665 E.0096
G1 X105.738 Y88.386 E.00899
G1 X87.639 Y70.286 E.8231
G1 X87.639 Y69.708 E.01859
G1 X105.738 Y87.808 E.8231
G1 X105.738 Y87.23 E.01859
G1 X87.639 Y69.13 E.8231
G1 X87.639 Y68.552 E.01859
G1 X105.921 Y86.835 E.83143
; WIPE_START
G1 X104.507 Y85.421 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.623 Y77.87 Z3.5 F15000
G1 X105.921 Y75.852 Z3.5
G1 Z3.1
G1 E.8 F1800
G1 F7800
G1 X100.34 Y70.271 E.25382
M73 P80 R8
G3 X100.523 Y71.032 I-.763 J.586 E.02591
G1 X105.738 Y76.247 E.23718
G1 X105.738 Y76.825 E.01859
G1 X100.591 Y71.678 E.2341
G3 X100.596 Y72.261 I-.653 J.298 E.01932
G1 X105.738 Y77.403 E.23385
G1 X105.738 Y77.981 E.01859
G1 X100.454 Y72.697 E.2403
G1 X100.312 Y73.133 E.01475
G1 X105.738 Y78.559 E.24675
G1 X105.738 Y79.137 E.01859
G1 X100.171 Y73.57 E.25319
G3 X99.937 Y73.914 I-.503 J-.091 E.01378
G1 X105.738 Y79.715 E.26383
G1 X105.738 Y80.293 E.01859
G1 X99.663 Y74.218 E.27629
G1 X99.389 Y74.522 E.01316
G1 X105.738 Y80.871 E.28874
G1 X105.738 Y81.449 E.01859
G1 X99.115 Y74.826 E.3012
G3 X98.758 Y75.047 I-.426 J-.291 E.01391
G1 X105.738 Y82.028 E.31746
G1 X105.738 Y82.606 E.01859
G1 X98.358 Y75.225 E.33564
G1 X97.958 Y75.403 E.01408
G1 X105.738 Y83.184 E.35383
G1 X105.738 Y83.762 E.01859
G1 X97.558 Y75.581 E.37202
G1 X96.999 Y75.6 E.01798
G1 X105.738 Y84.34 E.39743
G1 X105.738 Y84.918 E.01859
G1 X96.421 Y75.6 E.42371
G1 X95.827 Y75.584 E.01911
G1 X105.738 Y85.496 E.45073
G1 X105.738 Y86.074 E.01859
G1 X87.639 Y67.974 E.8231
G1 X87.639 Y67.396 E.01859
G1 X92.915 Y72.672 E.23993
G1 X92.739 Y72.131 E.0183
G1 X92.759 Y71.938 E.00622
G1 X87.639 Y66.818 E.23285
G1 X87.639 Y66.24 E.01859
G1 X92.814 Y71.415 E.23535
G1 X92.869 Y70.892 E.01691
G1 X87.639 Y65.662 E.23785
G1 X87.639 Y65.084 E.01859
G1 X92.96 Y70.405 E.24197
G1 X93.171 Y70.038 E.01361
G1 X87.639 Y64.506 E.2516
G1 X87.639 Y63.928 E.01859
G1 X93.383 Y69.672 E.26122
G1 X93.594 Y69.306 E.01361
G1 X87.639 Y63.35 E.27084
G1 X87.639 Y62.772 E.01859
G1 X93.846 Y68.979 E.28228
G1 X94.181 Y68.736 E.01331
G1 X87.639 Y62.194 E.29751
G1 X87.639 Y61.616 E.01859
G1 X94.516 Y68.493 E.31273
G1 X94.85 Y68.249 E.01331
G1 X87.639 Y61.038 E.32796
G1 X87.639 Y60.46 E.01859
G1 X95.233 Y68.054 E.34534
G1 X95.709 Y67.952 E.01567
G1 X87.639 Y59.882 E.36702
G1 X87.639 Y59.304 E.01859
G1 X96.186 Y67.851 E.3887
G1 X96.663 Y67.75 E.01567
G1 X87.639 Y58.726 E.41038
G1 X87.639 Y58.148 E.01859
G1 X97.383 Y67.892 E.44313
G1 X98.117 Y68.048 E.02413
G1 X87.639 Y57.57 E.47651
G1 X87.639 Y56.992 E.01859
G1 X105.738 Y75.091 E.8231
G1 X105.738 Y74.513 E.01859
G1 X87.639 Y56.414 E.82309
G1 X87.639 Y55.836 E.01859
G1 X105.738 Y73.935 E.82309
G1 X105.738 Y73.357 E.01859
G1 X87.639 Y55.257 E.8231
G1 X87.639 Y54.679 E.01859
G1 X105.738 Y72.779 E.8231
G1 X105.738 Y72.201 E.01859
G1 X87.639 Y54.101 E.8231
G1 X87.639 Y53.523 E.01859
G1 X105.738 Y71.623 E.8231
G1 X105.738 Y71.045 E.01859
G1 X87.639 Y52.945 E.8231
G1 X87.639 Y52.666 E.00899
G1 X87.937 Y52.666 E.0096
G1 X105.738 Y70.467 E.80952
G1 X105.738 Y69.889 E.01859
G1 X88.515 Y52.666 E.78323
G1 X89.093 Y52.666 E.01859
G1 X105.738 Y69.311 E.75694
G1 X105.738 Y68.733 E.01859
G1 X89.671 Y52.666 E.73066
G1 X90.249 Y52.666 E.01859
G1 X105.738 Y68.155 E.70437
G1 X105.738 Y67.577 E.01859
G1 X90.827 Y52.666 E.67808
G1 X91.405 Y52.666 E.01859
G1 X105.738 Y66.999 E.6518
G1 X105.738 Y66.421 E.01859
G1 X91.983 Y52.666 E.62551
G1 X92.562 Y52.666 E.01859
G1 X105.738 Y65.843 E.59922
G1 X105.738 Y65.265 E.01859
G1 X93.14 Y52.666 E.57294
G1 X93.718 Y52.666 E.01859
G1 X105.738 Y64.687 E.54665
G1 X105.738 Y64.109 E.01859
G1 X94.296 Y52.666 E.52037
G1 X94.874 Y52.666 E.01859
G1 X105.738 Y63.531 E.49408
G1 X105.738 Y62.952 E.01859
G1 X95.452 Y52.666 E.46779
G1 X96.03 Y52.666 E.01859
G1 X105.738 Y62.374 E.44151
G1 X105.738 Y61.796 E.01859
G1 X96.608 Y52.666 E.41522
G1 X97.186 Y52.666 E.01859
G1 X105.738 Y61.218 E.38893
G1 X105.738 Y60.64 E.01859
G1 X97.764 Y52.666 E.36265
G1 X98.342 Y52.666 E.01859
G1 X105.738 Y60.062 E.33636
G1 X105.738 Y59.484 E.01859
G1 X98.92 Y52.666 E.31007
G1 X99.498 Y52.666 E.01859
G1 X105.738 Y58.906 E.28379
G1 X105.738 Y58.328 E.01859
G1 X100.076 Y52.666 E.2575
G1 X100.654 Y52.666 E.01859
G1 X105.738 Y57.75 E.23121
G1 X105.738 Y57.172 E.01859
G1 X101.232 Y52.666 E.20493
G1 X101.81 Y52.666 E.01859
G1 X105.738 Y56.594 E.17864
G1 X105.738 Y56.016 E.01859
G1 X102.388 Y52.666 E.15235
G1 X102.966 Y52.666 E.01859
G1 X105.738 Y55.438 E.12607
G1 X105.738 Y54.86 E.01859
G1 X103.544 Y52.666 E.09978
G1 X104.122 Y52.666 E.01859
G1 X105.738 Y54.282 E.07349
G1 X105.738 Y53.704 E.01859
G1 X104.7 Y52.666 E.04721
G1 X105.278 Y52.666 E.01859
G1 X105.921 Y53.309 E.02925
; CHANGE_LAYER
; Z_HEIGHT: 3.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X105.278 Y52.666 E-.34567
G1 X104.7 Y52.666 E-.21966
G1 X105.062 Y53.028 E-.19468
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 16/20
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
G17
G3 Z3.5 I1.217 J0 P1  F15000
; object ids of layer 16 start: 178
M624 AgAAAAAAAAA=
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
; object ids of this layer16 end: 178
M625
; OBJECT_ID: 178
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X98.87 Y164.578
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X98.814 Y164.641 E.00272
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04835
G1 X95.218 Y158.413 E.04834
G1 X95.587 Y158.334 E.01214
G1 X96.688 Y158.1 E.03621
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04834
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.91 Y164.533 E.0437
M204 S250
G1 X98.579 Y164.316 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X98.578 Y164.316 E.00003
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X95.669 Y158.718 E.00876
G1 X96.688 Y158.501 E.03106
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.619 Y164.271 E.038
; WIPE_START
M204 S5000
G1 X98.578 Y164.316 E-.02322
G1 X97.357 Y164.86 E-.50796
G1 X96.755 Y164.86 E-.22882
; WIPE_END
G1 E-.04 F1800
G1 X93.548 Y157.934 Z3.7 F15000
G1 X87.291 Y144.418 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.224 Y144.581 Z3.7 F15000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4236
G1 F4800
G1 X87.624 Y145.182 E.02553
G1 X87.624 Y145.72 E.01619
G1 X88.593 Y144.751 E.04121
G1 X89.131 Y144.751 E.01619
G1 X87.624 Y146.258 E.0641
G1 X87.624 Y146.797 E.01619
G1 X89.669 Y144.751 E.087
G1 X90.208 Y144.751 E.01619
G1 X87.624 Y147.335 E.10989
G1 X87.624 Y147.873 E.01619
G1 X90.746 Y144.751 E.13279
G1 X91.285 Y144.751 E.01619
G1 X87.624 Y148.412 E.15568
G1 X87.624 Y148.95 E.01619
G1 X91.823 Y144.751 E.17858
G1 X92.361 Y144.751 E.01619
G1 X87.624 Y149.488 E.20147
G1 X87.624 Y150.027 E.01619
G1 X92.9 Y144.751 E.22437
G1 X93.438 Y144.751 E.01619
G1 X87.624 Y150.565 E.24726
G1 X87.624 Y151.104 E.01619
G1 X93.976 Y144.751 E.27016
G1 X94.515 Y144.751 E.01619
G1 X87.624 Y151.642 E.29305
G1 X87.624 Y152.18 E.01619
G1 X95.053 Y144.751 E.31595
G1 X95.591 Y144.751 E.01619
G1 X87.624 Y152.719 E.33884
G1 X87.624 Y153.257 E.01619
G1 X96.13 Y144.751 E.36174
G1 X96.668 Y144.751 E.01619
G1 X87.624 Y153.795 E.38463
G1 X87.624 Y154.334 E.01619
G1 X97.207 Y144.751 E.40753
G1 X97.745 Y144.751 E.01619
G1 X87.624 Y154.872 E.43042
G1 X87.624 Y155.41 E.01619
G1 X98.283 Y144.751 E.45332
G1 X98.822 Y144.751 E.01619
G1 X87.624 Y155.949 E.47621
G1 X87.624 Y156.487 E.01619
G1 X99.36 Y144.751 E.49911
G1 X99.898 Y144.751 E.01619
G1 X87.624 Y157.026 E.522
G1 X87.624 Y157.564 E.01619
G1 X100.437 Y144.751 E.5449
G1 X100.975 Y144.751 E.01619
G1 X87.624 Y158.102 E.56779
G1 X87.624 Y158.641 E.01619
G1 X101.513 Y144.751 E.59069
G1 X102.052 Y144.751 E.01619
G1 X87.624 Y159.179 E.61358
G1 X87.624 Y159.717 E.01619
G1 X102.59 Y144.751 E.63647
G1 X103.129 Y144.751 E.01619
G1 X87.624 Y160.256 E.65937
G1 X87.624 Y160.794 E.01619
G1 X103.667 Y144.751 E.68226
G1 X104.205 Y144.751 E.01619
G1 X87.624 Y161.332 E.70516
G1 X87.624 Y161.871 E.01619
G1 X104.744 Y144.751 E.72805
G1 X105.282 Y144.751 E.01619
G1 X87.624 Y162.409 E.75095
G1 X87.624 Y162.948 E.01619
G1 X105.753 Y144.818 E.77099
G1 X105.753 Y145.356 E.01619
G1 X87.624 Y163.486 E.77099
G1 X87.624 Y164.024 E.01619
G1 X105.753 Y145.895 E.77099
G1 X105.753 Y146.433 E.01619
G1 X87.454 Y164.732 E.77821
; WIPE_START
G1 X88.868 Y163.318 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.101 Y160.88 Z3.7 F15000
G1 X105.923 Y157.569 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F4800
G1 X100.267 Y163.225 E.24054
G1 X100.526 Y162.428 E.02522
G1 X105.753 Y157.2 E.2223
G1 X105.753 Y156.662 E.01619
G1 X100.591 Y161.824 E.21954
G1 X100.54 Y161.337 E.01473
G1 X105.753 Y156.124 E.22172
G1 X105.753 Y155.585 E.01619
G1 X100.488 Y160.85 E.22389
G1 X100.451 Y160.493 E.01079
G1 X100.398 Y160.402 E.00317
G1 X105.753 Y155.047 E.22773
G1 X105.753 Y154.509 E.01619
G1 X100.201 Y160.061 E.23611
G1 X100.004 Y159.719 E.01185
G1 X105.753 Y153.97 E.24449
G1 X105.753 Y153.432 E.01619
G1 X99.807 Y159.378 E.25287
G1 X99.628 Y159.069 E.01074
G1 X99.599 Y159.047 E.00108
G1 X105.753 Y152.893 E.26171
G1 X105.753 Y152.355 E.01619
G1 X99.287 Y158.821 E.27497
G1 X98.976 Y158.594 E.01159
G1 X105.753 Y151.817 E.28823
G1 X105.753 Y151.278 E.01619
G1 X98.664 Y158.368 E.30149
G1 X98.352 Y158.141 E.01159
G1 X105.753 Y150.74 E.31475
G1 X105.753 Y150.202 E.01619
G1 X97.931 Y158.024 E.33265
G1 X97.487 Y157.929 E.01365
G1 X105.753 Y149.663 E.35153
G1 X105.753 Y149.125 E.01619
G1 X97.043 Y157.835 E.37041
G1 X96.688 Y157.76 E.0109
G1 X96.551 Y157.789 E.00423
M73 P81 R8
G1 X105.753 Y148.587 E.39134
G1 X105.753 Y148.048 E.01619
G1 X95.867 Y157.934 E.42042
G1 X95.184 Y158.079 E.02102
G1 X105.753 Y147.51 E.44949
M73 P81 R7
G1 X105.753 Y146.971 E.01619
G1 X87.624 Y165.101 E.77099
G1 X87.624 Y165.639 E.01619
G1 X93.139 Y160.124 E.23456
G1 X92.926 Y160.493 E.01283
G1 X92.881 Y160.92 E.01291
G1 X87.624 Y166.178 E.22358
G1 X87.624 Y166.716 E.01619
G1 X92.818 Y161.522 E.22089
G1 X92.755 Y162.124 E.01819
G1 X87.624 Y167.254 E.2182
G1 X87.624 Y167.793 E.01619
G1 X92.885 Y162.532 E.22374
G1 X93.017 Y162.938 E.01285
G1 X87.624 Y168.331 E.22935
G1 X87.624 Y168.87 E.01619
G1 X93.149 Y163.344 E.23497
G1 X93.262 Y163.694 E.01105
G1 X93.298 Y163.733 E.00161
G1 X87.624 Y169.408 E.24132
G1 X87.624 Y169.946 E.01619
G1 X93.553 Y164.017 E.25216
G1 X93.808 Y164.3 E.01146
G1 X87.624 Y170.485 E.26301
G1 X87.624 Y171.023 E.01619
G1 X94.063 Y164.583 E.27386
G1 X94.318 Y164.867 E.01146
G1 X87.624 Y171.561 E.28471
G1 X87.624 Y172.1 E.01619
G1 X94.67 Y165.053 E.29967
G1 X95.043 Y165.219 E.01226
G1 X87.624 Y172.638 E.31551
G1 X87.624 Y173.176 E.01619
G1 X95.415 Y165.385 E.33135
G1 X95.788 Y165.551 E.01226
G1 X87.624 Y173.715 E.3472
G1 X87.624 Y174.253 E.01619
G1 X96.291 Y165.585 E.36861
G1 X96.83 Y165.585 E.01619
G1 X87.624 Y174.792 E.39151
G1 X87.624 Y175.33 E.01619
G1 X97.368 Y165.585 E.4144
G1 X97.511 Y165.585 E.00429
G1 X98.224 Y165.268 E.02347
G1 X87.624 Y175.868 E.4508
G1 X87.624 Y176.407 E.01619
G1 X105.753 Y158.277 E.77099
G1 X105.753 Y158.815 E.01619
G1 X87.624 Y176.945 E.77099
G1 X87.624 Y177.483 E.01619
G1 X105.753 Y159.354 E.77099
G1 X105.753 Y159.892 E.01619
G1 X87.624 Y178.022 E.77099
G1 X87.624 Y178.56 E.01619
G1 X105.753 Y160.43 E.77099
G1 X105.753 Y160.969 E.01619
G1 X87.624 Y179.098 E.77099
G1 X87.624 Y179.637 E.01619
G1 X105.753 Y161.507 E.77099
G1 X105.753 Y162.046 E.01619
G1 X87.624 Y180.175 E.77099
G1 X87.624 Y180.713 E.01619
G1 X105.753 Y162.584 E.77099
G1 X105.753 Y163.122 E.01619
G1 X88.095 Y180.78 E.75095
G1 X88.633 Y180.78 E.01619
G1 X105.753 Y163.661 E.72805
G1 X105.753 Y164.199 E.01619
G1 X89.172 Y180.78 E.70516
G1 X89.71 Y180.78 E.01619
G1 X105.753 Y164.737 E.68226
G1 X105.753 Y165.276 E.01619
G1 X90.249 Y180.78 E.65937
G1 X90.787 Y180.78 E.01619
G1 X105.753 Y165.814 E.63647
G1 X105.753 Y166.352 E.01619
G1 X91.325 Y180.78 E.61358
G1 X91.864 Y180.78 E.01619
G1 X105.753 Y166.891 E.59068
G1 X105.753 Y167.429 E.01619
G1 X92.402 Y180.78 E.56779
G1 X92.94 Y180.78 E.01619
G1 X105.753 Y167.968 E.54489
G1 X105.753 Y168.506 E.01619
G1 X93.479 Y180.78 E.522
G1 X94.017 Y180.78 E.01619
G1 X105.753 Y169.044 E.4991
G1 X105.753 Y169.583 E.01619
G1 X94.555 Y180.78 E.47621
G1 X95.094 Y180.78 E.01619
G1 X105.753 Y170.121 E.45331
G1 X105.753 Y170.659 E.01619
G1 X95.632 Y180.78 E.43042
G1 X96.171 Y180.78 E.01619
G1 X105.753 Y171.198 E.40752
G1 X105.753 Y171.736 E.01619
G1 X96.709 Y180.78 E.38463
G1 X97.247 Y180.78 E.01619
G1 X105.753 Y172.274 E.36173
G1 X105.753 Y172.813 E.01619
G1 X97.786 Y180.78 E.33884
G1 X98.324 Y180.78 E.01619
G1 X105.753 Y173.351 E.31594
G1 X105.753 Y173.89 E.01619
G1 X98.862 Y180.78 E.29305
G1 X99.401 Y180.78 E.01619
G1 X105.753 Y174.428 E.27015
G1 X105.753 Y174.966 E.01619
G1 X99.939 Y180.78 E.24726
G1 X100.477 Y180.78 E.01619
G1 X105.753 Y175.505 E.22436
G1 X105.753 Y176.043 E.01619
G1 X101.016 Y180.78 E.20147
G1 X101.554 Y180.78 E.01619
G1 X105.753 Y176.581 E.17857
G1 X105.753 Y177.12 E.01619
G1 X102.093 Y180.78 E.15568
G1 X102.631 Y180.78 E.01619
G1 X105.753 Y177.658 E.13278
G1 X105.753 Y178.196 E.01619
G1 X103.169 Y180.78 E.10989
G1 X103.708 Y180.78 E.01619
G1 X105.753 Y178.735 E.08699
G1 X105.753 Y179.273 E.01619
G1 X104.246 Y180.78 E.0641
G1 X104.784 Y180.78 E.01619
G1 X105.753 Y179.812 E.04121
G1 X105.753 Y180.35 E.01619
G1 X105.153 Y180.95 E.02553
; WIPE_START
G1 X105.753 Y180.35 E-.32257
G1 X105.753 Y179.812 E-.20458
G1 X105.32 Y180.245 E-.23285
; WIPE_END
G1 E-.04 F1800
G1 X105.469 Y172.614 Z3.7 F15000
G1 X106.086 Y141.014 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.694 Y140.622 Z3.7 F15000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3840
G1 X105.694 Y137.81 E.08375
G1 X87.683 Y137.81 E.5365
G1 X87.683 Y140.622 E.08375
G1 X105.634 Y140.622 E.53471
; WIPE_START
G1 X103.634 Y140.622 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.317 Y139.216 Z3.7 F15000
G1 Z3.3
G1 E.8 F1800
G1 F3840
G1 X105.317 Y138.187 E.03064
G1 X88.06 Y138.187 E.51403
G1 X88.06 Y140.244 E.06129
G1 X105.317 Y140.244 E.51403
G1 X105.317 Y139.276 E.02886
G1 X104.94 Y139.216 F15000
G1 F3840
G1 X104.94 Y138.564 E.01941
G1 X88.437 Y138.564 E.49157
G1 X88.437 Y139.867 E.03882
G1 X104.94 Y139.867 E.49157
G1 X104.94 Y139.276 E.01763
G1 X104.52 Y139.216 F15000
; LINE_WIDTH: 0.50611
G1 F3840
G1 X104.52 Y138.984 E.00847
G1 X88.857 Y138.984 E.5731
G1 X88.857 Y139.447 E.01695
G1 X104.52 Y139.447 E.5731
G1 X104.52 Y139.276 E.00628
; WIPE_START
G1 X104.52 Y139.447 E-.06521
G1 X102.692 Y139.447 E-.69479
; WIPE_END
G1 E-.04 F1800
G1 X101.704 Y131.879 Z3.7 F15000
G1 X99.418 Y114.37 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X100.127 Y115.598 E.04563
G1 X100.284 Y117.094 E.04835
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04835
G1 X94.002 Y114.296 E.04834
G1 X95.218 Y113.413 E.04834
G1 X95.587 Y113.334 E.01214
G1 X96.688 Y113.1 E.03621
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.388 Y114.318 E.00079
M204 S250
G1 X99.077 Y114.564 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.077 Y114.565 E.00003
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.299 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X95.669 Y113.718 E.00876
G1 X96.688 Y113.501 E.03106
G1 X97.996 Y113.779 E.03982
G1 X99.028 Y114.529 E.038
; WIPE_START
M204 S5000
G1 X99.077 Y114.565 E-.02323
G1 X99.746 Y115.722 E-.50795
G1 X99.809 Y116.321 E-.22882
; WIPE_END
G1 E-.04 F1800
G1 X95.266 Y110.188 Z3.7 F15000
G1 X87.291 Y99.418 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.218 Y99.581 Z3.7 F15000
G1 Z3.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42013
G1 F4800
G1 X87.624 Y100.175 E.02503
G1 X87.624 Y100.709 E.0159
G1 X88.581 Y99.751 E.04035
G1 X89.115 Y99.751 E.0159
G1 X87.624 Y101.242 E.06283
G1 X87.624 Y101.775 E.0159
G1 X89.648 Y99.751 E.08531
G1 X90.182 Y99.751 E.0159
G1 X87.624 Y102.309 E.10779
G1 X87.624 Y102.842 E.0159
G1 X90.715 Y99.751 E.13027
G1 X91.249 Y99.751 E.0159
G1 X87.624 Y103.376 E.15275
G1 X87.624 Y103.909 E.0159
G1 X91.782 Y99.751 E.17523
G1 X92.316 Y99.751 E.0159
G1 X87.624 Y104.443 E.19771
G1 X87.624 Y104.976 E.0159
G1 X92.849 Y99.751 E.22019
G1 X93.382 Y99.751 E.0159
G1 X87.624 Y105.51 E.24267
G1 X87.624 Y106.043 E.0159
G1 X93.916 Y99.751 E.26515
G1 X94.449 Y99.751 E.0159
G1 X87.624 Y106.577 E.28763
G1 X87.624 Y107.11 E.0159
G1 X94.983 Y99.751 E.31011
G1 X95.516 Y99.751 E.0159
G1 X87.624 Y107.643 E.33259
G1 X87.624 Y108.177 E.0159
G1 X96.05 Y99.751 E.35507
G1 X96.583 Y99.751 E.0159
G1 X87.624 Y108.71 E.37755
G1 X87.624 Y109.244 E.0159
G1 X97.117 Y99.751 E.40003
G1 X97.65 Y99.751 E.0159
G1 X87.624 Y109.777 E.4225
G1 X87.624 Y110.311 E.0159
G1 X98.184 Y99.751 E.44498
G1 X98.717 Y99.751 E.0159
G1 X87.624 Y110.844 E.46746
G1 X87.624 Y111.378 E.0159
G1 X99.25 Y99.751 E.48994
G1 X99.784 Y99.751 E.0159
G1 X87.624 Y111.911 E.51242
G1 X87.624 Y112.445 E.0159
G1 X100.317 Y99.751 E.5349
G1 X100.851 Y99.751 E.0159
G1 X87.624 Y112.978 E.55738
G1 X87.624 Y113.511 E.0159
G1 X101.384 Y99.751 E.57986
G1 X101.918 Y99.751 E.0159
G1 X87.624 Y114.045 E.60234
G1 X87.624 Y114.578 E.0159
G1 X102.451 Y99.751 E.62482
G1 X102.985 Y99.751 E.0159
G1 X87.624 Y115.112 E.6473
M73 P82 R7
G1 X87.624 Y115.645 E.0159
G1 X103.518 Y99.751 E.66978
G1 X104.052 Y99.751 E.0159
G1 X87.624 Y116.179 E.69226
G1 X87.624 Y116.712 E.0159
G1 X104.585 Y99.751 E.71474
G1 X105.118 Y99.751 E.0159
G1 X87.624 Y117.246 E.73722
G1 X87.624 Y117.779 E.0159
G1 X105.652 Y99.751 E.75969
G1 X105.753 Y99.751 E.00302
G1 X105.753 Y100.183 E.01288
G1 X87.624 Y118.313 E.76396
G1 X87.624 Y118.846 E.0159
G1 X105.753 Y100.716 E.76396
G1 X105.753 Y101.25 E.0159
G1 X87.454 Y119.549 E.77111
; WIPE_START
G1 X88.868 Y118.135 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.018 Y125.72 Z3.7 F15000
G1 X87.454 Y130.752 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F4800
G1 X97.708 Y120.498 E.4321
G1 X97.511 Y120.585 E.00643
G1 X97.087 Y120.585 E.01264
G1 X87.624 Y130.049 E.39877
G1 X87.624 Y129.515 E.0159
G1 X96.553 Y120.585 E.37629
G1 X96.02 Y120.585 E.0159
G1 X87.624 Y128.982 E.35381
G1 X87.624 Y128.448 E.0159
G1 X95.603 Y120.468 E.33626
G1 X95.234 Y120.304 E.01204
G1 X87.624 Y127.915 E.32071
G1 X87.624 Y127.381 E.0159
G1 X94.865 Y120.14 E.30515
G1 X94.496 Y119.975 E.01204
G1 X87.624 Y126.848 E.2896
G1 X87.624 Y126.314 E.0159
G1 X94.201 Y119.737 E.27718
G1 X93.949 Y119.456 E.01126
G1 X87.624 Y125.781 E.26653
G1 X87.624 Y125.248 E.0159
G1 X93.696 Y119.175 E.25588
G1 X93.443 Y118.895 E.01126
G1 X87.624 Y124.714 E.24523
G1 X87.624 Y124.181 E.0159
G1 X93.225 Y118.579 E.23604
G1 X93.094 Y118.177 E.01261
G1 X87.624 Y123.647 E.23053
G1 X87.624 Y123.114 E.0159
G1 X92.963 Y117.774 E.22501
G1 X92.833 Y117.371 E.01261
G1 X87.624 Y122.58 E.2195
G1 X87.624 Y122.047 E.0159
G1 X92.779 Y116.891 E.21724
G1 X92.842 Y116.295 E.01786
G1 X87.624 Y121.513 E.21988
G1 X87.624 Y120.98 E.0159
G1 X92.904 Y115.699 E.22252
G1 X92.926 Y115.493 E.00617
G1 X93.403 Y114.667 E.02842
G1 X87.624 Y120.446 E.24353
G1 X87.624 Y119.913 E.0159
G1 X105.753 Y101.783 E.76396
G1 X105.753 Y102.317 E.0159
G1 X94.674 Y113.396 E.46687
G1 X95.079 Y113.102 E.01493
G1 X95.616 Y112.988 E.01635
G1 X105.753 Y102.85 E.42717
G1 X105.753 Y103.384 E.0159
G1 X96.293 Y112.844 E.39863
G1 X96.688 Y112.76 E.01203
G1 X96.872 Y112.799 E.00559
G1 X105.753 Y103.917 E.37425
G1 X105.753 Y104.451 E.0159
G1 X97.312 Y112.892 E.35571
G1 X97.752 Y112.986 E.0134
G1 X105.753 Y104.984 E.33717
G1 X105.753 Y105.518 E.0159
G1 X98.192 Y113.079 E.31864
G1 X98.298 Y113.102 E.00322
G1 X98.532 Y113.272 E.00864
G1 X105.753 Y106.051 E.30429
G1 X105.753 Y106.585 E.0159
G1 X98.841 Y113.497 E.29127
G1 X99.15 Y113.721 E.01138
G1 X105.753 Y107.118 E.27825
G1 X105.753 Y107.651 E.0159
G1 X99.459 Y113.946 E.26523
G3 X99.717 Y114.221 I-.181 J.427 E.01158
G1 X105.753 Y108.185 E.25438
G1 X105.753 Y108.718 E.0159
G1 X99.912 Y114.56 E.24615
G1 X100.107 Y114.898 E.01164
G1 X105.753 Y109.252 E.23792
G1 X105.753 Y109.785 E.0159
G1 X100.302 Y115.236 E.22969
G1 X100.451 Y115.493 E.00885
G1 X100.463 Y115.609 E.00347
G1 X105.753 Y110.319 E.22292
G1 X105.753 Y110.852 E.0159
G1 X100.514 Y116.092 E.22078
G1 X100.565 Y116.574 E.01446
G1 X105.753 Y111.386 E.21865
G1 X105.753 Y111.919 E.0159
G1 X100.615 Y117.057 E.21651
G1 X100.623 Y117.129 E.00216
G1 X100.405 Y117.801 E.02105
G1 X105.753 Y112.453 E.22539
G1 X105.753 Y112.986 E.0159
G1 X87.624 Y131.116 E.76396
G1 X87.624 Y131.649 E.0159
G1 X105.753 Y113.519 E.76396
G1 X105.753 Y114.053 E.0159
G1 X87.624 Y132.182 E.76396
G1 X87.624 Y132.716 E.0159
G1 X105.753 Y114.586 E.76396
G1 X105.753 Y115.12 E.0159
G1 X87.624 Y133.249 E.76396
G1 X87.624 Y133.68 E.01285
G1 X87.726 Y133.68 E.00305
G1 X105.753 Y115.653 E.75965
G1 X105.753 Y116.187 E.0159
G1 X88.259 Y133.68 E.73717
G1 X88.793 Y133.68 E.0159
G1 X105.753 Y116.72 E.71469
G1 X105.753 Y117.254 E.0159
G1 X89.326 Y133.68 E.69221
G1 X89.86 Y133.68 E.0159
G1 X105.753 Y117.787 E.66973
G1 X105.753 Y118.321 E.0159
G1 X90.393 Y133.68 E.64726
G1 X90.927 Y133.68 E.0159
G1 X105.753 Y118.854 E.62478
G1 X105.753 Y119.387 E.0159
G1 X91.46 Y133.68 E.6023
G1 X91.994 Y133.68 E.0159
G1 X105.753 Y119.921 E.57982
G1 X105.753 Y120.454 E.0159
G1 X92.527 Y133.68 E.55734
G1 X93.061 Y133.68 E.0159
G1 X105.753 Y120.988 E.53486
G1 X105.753 Y121.521 E.0159
G1 X93.594 Y133.68 E.51238
G1 X94.127 Y133.68 E.0159
G1 X105.753 Y122.055 E.4899
G1 X105.753 Y122.588 E.0159
G1 X94.661 Y133.68 E.46742
G1 X95.194 Y133.68 E.0159
G1 X105.753 Y123.122 E.44494
G1 X105.753 Y123.655 E.0159
G1 X95.728 Y133.68 E.42246
G1 X96.261 Y133.68 E.0159
G1 X105.753 Y124.189 E.39998
G1 X105.753 Y124.722 E.0159
G1 X96.795 Y133.68 E.3775
G1 X97.328 Y133.68 E.0159
G1 X105.753 Y125.255 E.35502
G1 X105.753 Y125.789 E.0159
G1 X97.862 Y133.68 E.33254
G1 X98.395 Y133.68 E.0159
G1 X105.753 Y126.322 E.31006
G1 X105.753 Y126.856 E.0159
G1 X98.929 Y133.68 E.28759
G1 X99.462 Y133.68 E.0159
G1 X105.753 Y127.389 E.26511
G1 X105.753 Y127.923 E.0159
G1 X99.996 Y133.68 E.24263
G1 X100.529 Y133.68 E.0159
G1 X105.753 Y128.456 E.22015
G1 X105.753 Y128.99 E.0159
G1 X101.062 Y133.68 E.19767
G1 X101.596 Y133.68 E.0159
G1 X105.753 Y129.523 E.17519
G1 X105.753 Y130.057 E.0159
G1 X102.129 Y133.68 E.15271
G1 X102.663 Y133.68 E.0159
G1 X105.753 Y130.59 E.13023
G1 X105.753 Y131.123 E.0159
G1 X103.196 Y133.68 E.10775
G1 X103.73 Y133.68 E.0159
G1 X105.753 Y131.657 E.08527
G1 X105.753 Y132.19 E.0159
G1 X104.263 Y133.68 E.06279
G1 X104.797 Y133.68 E.0159
G1 X105.753 Y132.724 E.04031
G1 X105.753 Y133.257 E.0159
G1 X105.16 Y133.85 E.02498
; WIPE_START
G1 X105.753 Y133.257 E-.31861
G1 X105.753 Y132.724 E-.20271
G1 X105.309 Y133.168 E-.23868
; WIPE_END
G1 E-.04 F1800
G1 X101.979 Y126.3 Z3.7 F15000
G1 X87.291 Y96.014 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.548 Y94.899 Z3.7 F15000
G1 X105.694 Y95.622 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3840
G1 X105.694 Y92.81 E.08375
G1 X87.683 Y92.81 E.5365
G1 X87.683 Y95.622 E.08375
G1 X105.634 Y95.622 E.53471
; WIPE_START
G1 X103.634 Y95.622 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.317 Y94.216 Z3.7 F15000
G1 Z3.3
G1 E.8 F1800
G1 F3840
G1 X105.317 Y93.187 E.03064
G1 X88.06 Y93.187 E.51403
G1 X88.06 Y95.244 E.06129
G1 X105.317 Y95.244 E.51403
G1 X105.317 Y94.276 E.02886
G1 X104.94 Y94.216 F15000
G1 F3840
G1 X104.94 Y93.564 E.01941
G1 X88.437 Y93.564 E.49157
G1 X88.437 Y94.867 E.03882
G1 X104.94 Y94.867 E.49157
G1 X104.94 Y94.276 E.01763
G1 X104.52 Y94.216 F15000
; LINE_WIDTH: 0.506115
G1 F3840
G1 X104.52 Y93.984 E.00847
G1 X88.857 Y93.984 E.5731
G1 X88.857 Y94.447 E.01695
G1 X104.52 Y94.447 E.5731
G1 X104.52 Y94.276 E.00628
; WIPE_START
G1 X104.52 Y94.447 E-.06521
G1 X102.692 Y94.447 E-.69479
; WIPE_END
G1 E-.04 F1800
G1 X100.647 Y87.094 Z3.7 F15000
G1 X97.356 Y75.252 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X95.937 Y75.252 E.04563
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X95.587 Y68.334 E.01214
G1 X96.688 Y68.1 E.03621
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04834
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.416 Y75.252 E.00079
M204 S250
G1 X97.356 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03979
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X95.669 Y68.718 E.00876
M73 P83 R7
G1 X96.688 Y68.501 E.03106
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.411 Y74.836 E.03806
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.5285
G1 X95.464 Y74.612 E-.2315
; WIPE_END
G1 E-.04 F1800
G1 X91.696 Y81.25 Z3.7 F15000
G1 X87.291 Y89.014 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.257 Y79.779 Z3.7 F15000
G1 X87.454 Y74.786 Z3.7
G1 Z3.3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4236
G1 F4800
G1 X105.753 Y56.486 E.77821
G1 X105.753 Y55.948 E.01619
G1 X87.624 Y74.078 E.77099
G1 X87.624 Y73.539 E.01619
G1 X105.753 Y55.41 E.77099
G1 X105.753 Y54.871 E.01619
G1 X87.624 Y73.001 E.77099
G1 X87.624 Y72.463 E.01619
G1 X105.753 Y54.333 E.77099
G1 X105.753 Y53.795 E.01619
G1 X87.624 Y71.924 E.77099
G1 X87.624 Y71.386 E.01619
G1 X105.753 Y53.256 E.77099
G1 X105.753 Y52.718 E.01619
G1 X87.624 Y70.848 E.77099
G1 X87.624 Y70.309 E.01619
G1 X105.282 Y52.651 E.75095
G1 X104.744 Y52.651 E.01619
G1 X87.624 Y69.771 E.72805
G1 X87.624 Y69.232 E.01619
G1 X104.205 Y52.651 E.70516
G1 X103.667 Y52.651 E.01619
G1 X87.624 Y68.694 E.68226
G1 X87.624 Y68.156 E.01619
G1 X103.128 Y52.651 E.65937
G1 X102.59 Y52.651 E.01619
G1 X87.624 Y67.617 E.63647
G1 X87.624 Y67.079 E.01619
G1 X102.052 Y52.651 E.61358
G1 X101.513 Y52.651 E.01619
G1 X87.624 Y66.541 E.59068
G1 X87.624 Y66.002 E.01619
G1 X100.975 Y52.651 E.56779
G1 X100.437 Y52.651 E.01619
G1 X87.624 Y65.464 E.5449
G1 X87.624 Y64.926 E.01619
G1 X99.898 Y52.651 E.522
G1 X99.36 Y52.651 E.01619
G1 X87.624 Y64.387 E.49911
G1 X87.624 Y63.849 E.01619
G1 X98.822 Y52.651 E.47621
G1 X98.283 Y52.651 E.01619
G1 X87.624 Y63.31 E.45332
G1 X87.624 Y62.772 E.01619
G1 X97.745 Y52.651 E.43042
G1 X97.206 Y52.651 E.01619
G1 X87.624 Y62.234 E.40753
G1 X87.624 Y61.695 E.01619
G1 X96.668 Y52.651 E.38463
G1 X96.13 Y52.651 E.01619
G1 X87.624 Y61.157 E.36174
G1 X87.624 Y60.619 E.01619
G1 X95.591 Y52.651 E.33884
G1 X95.053 Y52.651 E.01619
G1 X87.624 Y60.08 E.31595
G1 X87.624 Y59.542 E.01619
G1 X94.515 Y52.651 E.29305
G1 X93.976 Y52.651 E.01619
G1 X87.624 Y59.004 E.27016
G1 X87.624 Y58.465 E.01619
G1 X93.438 Y52.651 E.24726
G1 X92.9 Y52.651 E.01619
G1 X87.624 Y57.927 E.22437
G1 X87.624 Y57.388 E.01619
G1 X92.361 Y52.651 E.20147
G1 X91.823 Y52.651 E.01619
G1 X87.624 Y56.85 E.17858
G1 X87.624 Y56.312 E.01619
G1 X91.285 Y52.651 E.15568
G1 X90.746 Y52.651 E.01619
G1 X87.624 Y55.773 E.13279
G1 X87.624 Y55.235 E.01619
G1 X90.208 Y52.651 E.10989
G1 X89.669 Y52.651 E.01619
G1 X87.624 Y54.697 E.087
G1 X87.624 Y54.158 E.01619
G1 X89.131 Y52.651 E.0641
G1 X88.593 Y52.651 E.01619
G1 X87.624 Y53.62 E.04121
G1 X87.624 Y53.082 E.01619
G1 X88.224 Y52.481 E.02553
; WIPE_START
G1 X87.624 Y53.082 E-.32261
M73 P83 R6
G1 X87.624 Y53.62 E-.20458
G1 X88.057 Y53.187 E-.23281
; WIPE_END
G1 E-.04 F1800
G1 X93.994 Y57.984 Z3.7 F15000
G1 X105.923 Y67.622 Z3.7
G1 Z3.3
G1 E.8 F1800
G1 F4800
G1 X100.241 Y73.304 E.24163
G1 X100.5 Y72.507 E.02522
G1 X105.753 Y67.254 E.22339
G1 X105.753 Y66.715 E.01619
G1 X100.596 Y71.873 E.21932
G1 X100.545 Y71.386 E.01473
G1 X105.753 Y66.177 E.2215
G1 X105.753 Y65.639 E.01619
G1 X100.494 Y70.898 E.22368
G1 X100.451 Y70.493 E.01225
G1 X100.418 Y70.436 E.00199
G1 X105.753 Y65.1 E.2269
G1 X105.753 Y64.562 E.01619
G1 X100.221 Y70.094 E.23528
G1 X100.024 Y69.753 E.01185
G1 X105.753 Y64.024 E.24366
G1 X105.753 Y63.485 E.01619
G1 X99.827 Y69.412 E.25204
G1 X99.63 Y69.071 E.01185
G1 X105.753 Y62.947 E.26042
G1 X105.753 Y62.408 E.01619
G1 X99.318 Y68.843 E.27365
G1 X99.007 Y68.617 E.01159
G1 X105.753 Y61.87 E.28691
G1 X105.753 Y61.332 E.01619
G1 X98.695 Y68.39 E.30017
G1 X98.383 Y68.164 E.01159
G1 X105.753 Y60.793 E.31343
G1 X105.753 Y60.255 E.01619
G1 X97.975 Y68.033 E.33078
G1 X97.531 Y67.939 E.01365
G1 X105.753 Y59.717 E.34966
G1 X105.753 Y59.178 E.01619
G1 X97.087 Y67.844 E.36854
G1 X96.688 Y67.76 E.01226
G1 X96.619 Y67.774 E.00214
G1 X105.753 Y58.64 E.38846
G1 X105.753 Y58.102 E.01619
G1 X95.935 Y67.92 E.41753
G1 X95.251 Y68.065 E.02102
G1 X105.753 Y57.563 E.44661
G1 X105.753 Y57.025 E.01619
G1 X87.624 Y75.154 E.77099
G1 X87.624 Y75.693 E.01619
G1 X93.066 Y70.25 E.23146
G1 X92.926 Y70.493 E.00844
G1 X92.875 Y70.98 E.01472
G1 X87.624 Y76.231 E.22331
G1 X87.624 Y76.77 E.01619
G1 X92.812 Y71.582 E.22062
G1 X92.754 Y72.129 E.01656
G1 X92.766 Y72.166 E.00115
G1 X87.624 Y77.308 E.21868
G1 X87.624 Y77.846 E.01619
G1 X92.898 Y72.572 E.22429
G1 X93.03 Y72.978 E.01285
G1 X87.624 Y78.385 E.22991
G1 X87.624 Y78.923 E.01619
G1 X93.162 Y73.385 E.23552
G1 X93.262 Y73.694 E.00977
G1 X93.323 Y73.762 E.00274
G1 X87.624 Y79.461 E.24239
G1 X87.624 Y80 E.01619
G1 X93.579 Y74.045 E.25324
G1 X93.834 Y74.328 E.01146
G1 X87.624 Y80.538 E.26409
G1 X87.624 Y81.076 E.01619
G1 X94.089 Y74.611 E.27493
G1 X94.344 Y74.895 E.01146
G1 X87.624 Y81.615 E.28578
G1 X87.624 Y82.153 E.01619
G1 X94.707 Y75.07 E.30124
G1 X95.08 Y75.235 E.01226
G1 X87.624 Y82.691 E.31709
G1 X87.624 Y83.23 E.01619
G1 X95.452 Y75.401 E.33293
G1 X95.825 Y75.567 E.01226
G1 X87.624 Y83.768 E.34877
G1 X87.624 Y84.307 E.01619
G1 X96.345 Y75.585 E.37089
G1 X96.883 Y75.585 E.01619
G1 X87.624 Y84.845 E.39378
G1 X87.624 Y85.383 E.01619
G1 X97.422 Y75.585 E.41668
G1 X97.511 Y75.585 E.00269
G1 X98.32 Y75.225 E.02664
G1 X87.624 Y85.922 E.45489
G1 X87.624 Y86.46 E.01619
G1 X105.753 Y68.33 E.77099
G1 X105.753 Y68.869 E.01619
G1 X87.624 Y86.998 E.77099
G1 X87.624 Y87.537 E.01619
G1 X105.753 Y69.407 E.77099
G1 X105.753 Y69.946 E.01619
G1 X87.624 Y88.075 E.77099
G1 X87.624 Y88.613 E.01619
G1 X105.753 Y70.484 E.77099
G1 X105.753 Y71.022 E.01619
G1 X88.095 Y88.68 E.75095
G1 X88.633 Y88.68 E.01619
G1 X105.753 Y71.561 E.72805
G1 X105.753 Y72.099 E.01619
G1 X89.172 Y88.68 E.70516
G1 X89.71 Y88.68 E.01619
G1 X105.753 Y72.637 E.68226
G1 X105.753 Y73.176 E.01619
G1 X90.249 Y88.68 E.65937
G1 X90.787 Y88.68 E.01619
G1 X105.753 Y73.714 E.63647
G1 X105.753 Y74.252 E.01619
G1 X91.325 Y88.68 E.61358
G1 X91.864 Y88.68 E.01619
G1 X105.753 Y74.791 E.59068
G1 X105.753 Y75.329 E.01619
G1 X92.402 Y88.68 E.56779
G1 X92.94 Y88.68 E.01619
G1 X105.753 Y75.868 E.54489
G1 X105.753 Y76.406 E.01619
G1 X93.479 Y88.68 E.522
G1 X94.017 Y88.68 E.01619
G1 X105.753 Y76.944 E.4991
G1 X105.753 Y77.483 E.01619
G1 X94.555 Y88.68 E.47621
G1 X95.094 Y88.68 E.01619
G1 X105.753 Y78.021 E.45331
G1 X105.753 Y78.559 E.01619
G1 X95.632 Y88.68 E.43042
G1 X96.171 Y88.68 E.01619
G1 X105.753 Y79.098 E.40752
G1 X105.753 Y79.636 E.01619
G1 X96.709 Y88.68 E.38463
G1 X97.247 Y88.68 E.01619
G1 X105.753 Y80.174 E.36173
G1 X105.753 Y80.713 E.01619
G1 X97.786 Y88.68 E.33884
G1 X98.324 Y88.68 E.01619
G1 X105.753 Y81.251 E.31594
G1 X105.753 Y81.79 E.01619
G1 X98.862 Y88.68 E.29305
G1 X99.401 Y88.68 E.01619
G1 X105.753 Y82.328 E.27015
G1 X105.753 Y82.866 E.01619
G1 X99.939 Y88.68 E.24726
G1 X100.477 Y88.68 E.01619
G1 X105.753 Y83.405 E.22436
G1 X105.753 Y83.943 E.01619
G1 X101.016 Y88.68 E.20147
G1 X101.554 Y88.68 E.01619
G1 X105.753 Y84.481 E.17857
G1 X105.753 Y85.02 E.01619
G1 X102.093 Y88.68 E.15568
G1 X102.631 Y88.68 E.01619
G1 X105.753 Y85.558 E.13278
G1 X105.753 Y86.096 E.01619
G1 X103.169 Y88.68 E.10989
G1 X103.708 Y88.68 E.01619
G1 X105.753 Y86.635 E.08699
G1 X105.753 Y87.173 E.01619
G1 X104.246 Y88.68 E.0641
G1 X104.784 Y88.68 E.01619
G1 X105.753 Y87.712 E.04121
G1 X105.753 Y88.25 E.01619
G1 X105.153 Y88.85 E.02553
; CHANGE_LAYER
; Z_HEIGHT: 3.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4800
G1 X105.753 Y88.25 E-.32256
G1 X105.753 Y87.712 E-.20458
G1 X105.32 Y88.145 E-.23286
; WIPE_END
M73 P84 R6
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 17/20
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
G17
G3 Z3.7 I1.217 J0 P1  F15000
; object ids of layer 17 start: 178
M624 AgAAAAAAAAA=
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
; object ids of this layer17 end: 178
M625
; OBJECT_ID: 178
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X98.87 Y164.578
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.814 Y164.641 E.00273
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04835
G1 X95.218 Y158.413 E.04834
G1 X95.526 Y158.347 E.01013
G1 X96.688 Y158.1 E.03821
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04834
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.911 Y164.533 E.04369
M204 S250
G1 X98.579 Y164.315 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X98.578 Y164.316 E.00005
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X95.608 Y158.731 E.0069
G1 X96.688 Y158.501 E.03291
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.619 Y164.271 E.03798
; WIPE_START
M204 S5000
G1 X98.578 Y164.316 E-.0234
G1 X97.357 Y164.86 E-.50796
G1 X96.755 Y164.86 E-.22864
; WIPE_END
G1 E-.04 F1800
G1 X93.548 Y157.934 Z3.9 F15000
G1 X87.291 Y144.418 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.454 Y147.34 Z3.9 F15000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4236
G1 F4800
G1 X98.193 Y158.079 E.45671
G1 X97.51 Y157.934 E.02102
G1 X87.624 Y148.048 E.42042
G1 X87.624 Y148.586 E.01619
G1 X96.826 Y157.789 E.39135
G1 X96.688 Y157.76 E.00423
G1 X96.334 Y157.835 E.0109
G1 X87.624 Y149.125 E.37042
G1 X87.624 Y149.663 E.01619
G1 X95.89 Y157.929 E.35153
G1 X95.446 Y158.024 E.01365
G1 X87.624 Y150.202 E.33265
G1 X87.624 Y150.74 E.01619
G1 X95.025 Y158.141 E.31475
G1 X94.713 Y158.368 E.01159
G1 X87.624 Y151.278 E.30149
G1 X87.624 Y151.817 E.01619
G1 X94.401 Y158.594 E.28823
G1 X94.09 Y158.821 E.01159
G1 X87.624 Y152.355 E.27497
G1 X87.624 Y152.893 E.01619
G1 X93.778 Y159.047 E.26171
G1 X93.749 Y159.069 E.00108
G1 X93.57 Y159.378 E.01074
G1 X87.624 Y153.432 E.25287
G1 X87.624 Y153.97 E.01619
G1 X93.373 Y159.719 E.24449
G1 X93.176 Y160.061 E.01185
G1 X87.624 Y154.508 E.23611
G1 X87.624 Y155.047 E.01619
G1 X92.979 Y160.402 E.22773
G1 X92.926 Y160.493 E.00317
G1 X92.888 Y160.85 E.01079
G1 X87.624 Y155.585 E.22389
G1 X87.624 Y156.123 E.01619
G1 X92.837 Y161.337 E.22172
G1 X92.786 Y161.824 E.01473
G1 X87.624 Y156.662 E.21954
G1 X87.624 Y157.2 E.01619
G1 X92.851 Y162.427 E.2223
G1 X93.11 Y163.225 E.02522
G1 X87.624 Y157.739 E.23332
G1 X87.624 Y158.277 E.01619
G1 X105.753 Y176.407 E.77099
G1 X105.753 Y175.868 E.01619
G1 X95.153 Y165.268 E.45079
G1 X95.866 Y165.585 E.02346
G1 X96.009 Y165.585 E.0043
G1 X105.753 Y175.33 E.4144
G1 X105.753 Y174.791 E.01619
G1 X96.547 Y165.585 E.3915
G1 X97.086 Y165.585 E.01619
G1 X105.753 Y174.253 E.36861
G1 X105.753 Y173.715 E.01619
G1 X97.589 Y165.551 E.34719
G1 X97.962 Y165.385 E.01226
G1 X105.753 Y173.176 E.33135
G1 X105.753 Y172.638 E.01619
G1 X98.334 Y165.219 E.31551
G1 X98.707 Y165.053 E.01226
G1 X105.753 Y172.1 E.29967
G1 X105.753 Y171.561 E.01619
G1 X99.059 Y164.867 E.2847
G1 X99.314 Y164.583 E.01146
G1 X105.753 Y171.023 E.27386
G1 X105.753 Y170.485 E.01619
G1 X99.569 Y164.3 E.26301
G1 X99.824 Y164.017 E.01146
G1 X105.753 Y169.946 E.25216
G1 X105.753 Y169.408 E.01619
G1 X100.079 Y163.733 E.24131
G1 X100.115 Y163.694 E.00161
G1 X100.228 Y163.344 E.01105
G1 X105.753 Y168.869 E.23497
G1 X105.753 Y168.331 E.01619
G1 X100.36 Y162.938 E.22935
G1 X100.492 Y162.532 E.01285
G1 X105.753 Y167.793 E.22374
G1 X105.753 Y167.254 E.01619
G1 X100.622 Y162.123 E.2182
G1 X100.559 Y161.522 E.01819
G1 X105.753 Y166.716 E.22089
G1 X105.753 Y166.178 E.01619
G1 X100.496 Y160.92 E.22358
G1 X100.451 Y160.493 E.01291
G1 X100.238 Y160.124 E.01284
G1 X105.753 Y165.639 E.23457
G1 X105.753 Y165.101 E.01619
G1 X87.624 Y146.971 E.77099
G1 X87.624 Y146.433 E.01619
G1 X105.753 Y164.563 E.77099
G1 X105.753 Y164.024 E.01619
G1 X87.624 Y145.895 E.77099
G1 X87.624 Y145.356 E.01619
G1 X105.753 Y163.486 E.77099
G1 X105.753 Y162.947 E.01619
G1 X87.624 Y144.818 E.77099
G1 X87.624 Y144.751 E.00201
G1 X88.095 Y144.751 E.01418
G1 X105.753 Y162.409 E.75095
G1 X105.753 Y161.871 E.01619
G1 X88.633 Y144.751 E.72805
G1 X89.172 Y144.751 E.01619
G1 X105.753 Y161.332 E.70516
G1 X105.753 Y160.794 E.01619
G1 X89.71 Y144.751 E.68226
G1 X90.249 Y144.751 E.01619
G1 X105.753 Y160.256 E.65937
G1 X105.753 Y159.717 E.01619
G1 X90.787 Y144.751 E.63647
G1 X91.325 Y144.751 E.01619
G1 X105.753 Y159.179 E.61358
G1 X105.753 Y158.641 E.01619
G1 X91.864 Y144.751 E.59068
G1 X92.402 Y144.751 E.01619
G1 X105.753 Y158.102 E.56779
G1 X105.753 Y157.564 E.01619
G1 X92.94 Y144.751 E.54489
G1 X93.479 Y144.751 E.01619
G1 X105.753 Y157.025 E.522
G1 X105.753 Y156.487 E.01619
G1 X94.017 Y144.751 E.4991
G1 X94.555 Y144.751 E.01619
G1 X105.753 Y155.949 E.47621
G1 X105.753 Y155.41 E.01619
G1 X95.094 Y144.751 E.45331
G1 X95.632 Y144.751 E.01619
G1 X105.753 Y154.872 E.43042
G1 X105.753 Y154.334 E.01619
G1 X96.171 Y144.751 E.40752
G1 X96.709 Y144.751 E.01619
G1 X105.753 Y153.795 E.38463
G1 X105.753 Y153.257 E.01619
G1 X97.247 Y144.751 E.36173
G1 X97.786 Y144.751 E.01619
G1 X105.753 Y152.719 E.33884
G1 X105.753 Y152.18 E.01619
G1 X98.324 Y144.751 E.31594
G1 X98.862 Y144.751 E.01619
G1 X105.753 Y151.642 E.29305
G1 X105.753 Y151.103 E.01619
G1 X99.401 Y144.751 E.27015
G1 X99.939 Y144.751 E.01619
G1 X105.753 Y150.565 E.24726
G1 X105.753 Y150.027 E.01619
G1 X100.477 Y144.751 E.22436
G1 X101.016 Y144.751 E.01619
G1 X105.753 Y149.488 E.20147
G1 X105.753 Y148.95 E.01619
G1 X101.554 Y144.751 E.17857
G1 X102.093 Y144.751 E.01619
G1 X105.753 Y148.412 E.15568
G1 X105.753 Y147.873 E.01619
G1 X102.631 Y144.751 E.13278
G1 X103.169 Y144.751 E.01619
G1 X105.753 Y147.335 E.10989
G1 X105.753 Y146.797 E.01619
G1 X103.708 Y144.751 E.08699
G1 X104.246 Y144.751 E.01619
G1 X105.753 Y146.258 E.0641
G1 X105.753 Y145.72 E.01619
G1 X104.784 Y144.751 E.04121
G1 X105.323 Y144.751 E.01619
G1 X105.923 Y145.351 E.02553
; WIPE_START
G1 X105.323 Y144.751 E-.32257
G1 X104.784 Y144.751 E-.20458
G1 X105.218 Y145.184 E-.23285
; WIPE_END
G1 E-.04 F1800
G1 X105.386 Y152.815 Z3.9 F15000
G1 X105.923 Y177.115 Z3.9
G1 Z3.5
G1 E.8 F1800
G1 F4800
G1 X87.624 Y158.815 E.77821
G1 X87.624 Y159.354 E.01619
G1 X105.753 Y177.483 E.77099
G1 X105.753 Y178.022 E.01619
G1 X87.624 Y159.892 E.77099
G1 X87.624 Y160.43 E.01619
G1 X105.753 Y178.56 E.77099
G1 X105.753 Y179.098 E.01619
G1 X87.624 Y160.969 E.77099
G1 X87.624 Y161.507 E.01619
G1 X105.753 Y179.637 E.77099
G1 X105.753 Y180.175 E.01619
G1 X87.624 Y162.045 E.77099
G1 X87.624 Y162.584 E.01619
G1 X105.753 Y180.713 E.77099
G1 X105.753 Y180.78 E.00202
G1 X105.282 Y180.78 E.01417
G1 X87.624 Y163.122 E.75095
G1 X87.624 Y163.661 E.01619
G1 X104.744 Y180.78 E.72805
G1 X104.205 Y180.78 E.01619
G1 X87.624 Y164.199 E.70516
G1 X87.624 Y164.737 E.01619
G1 X103.667 Y180.78 E.68226
G1 X103.128 Y180.78 E.01619
G1 X87.624 Y165.276 E.65937
G1 X87.624 Y165.814 E.01619
G1 X102.59 Y180.78 E.63647
G1 X102.052 Y180.78 E.01619
G1 X87.624 Y166.352 E.61358
G1 X87.624 Y166.891 E.01619
G1 X101.513 Y180.78 E.59068
G1 X100.975 Y180.78 E.01619
G1 X87.624 Y167.429 E.56779
G1 X87.624 Y167.967 E.01619
G1 X100.437 Y180.78 E.5449
G1 X99.898 Y180.78 E.01619
G1 X87.624 Y168.506 E.522
G1 X87.624 Y169.044 E.01619
G1 X99.36 Y180.78 E.49911
G1 X98.822 Y180.78 E.01619
G1 X87.624 Y169.583 E.47621
G1 X87.624 Y170.121 E.01619
G1 X98.283 Y180.78 E.45332
G1 X97.745 Y180.78 E.01619
G1 X87.624 Y170.659 E.43042
G1 X87.624 Y171.198 E.01619
G1 X97.207 Y180.78 E.40753
G1 X96.668 Y180.78 E.01619
G1 X87.624 Y171.736 E.38463
G1 X87.624 Y172.274 E.01619
G1 X96.13 Y180.78 E.36174
G1 X95.591 Y180.78 E.01619
G1 X87.624 Y172.813 E.33884
G1 X87.624 Y173.351 E.01619
G1 X95.053 Y180.78 E.31595
G1 X94.515 Y180.78 E.01619
G1 X87.624 Y173.889 E.29305
G1 X87.624 Y174.428 E.01619
G1 X93.976 Y180.78 E.27016
G1 X93.438 Y180.78 E.01619
G1 X87.624 Y174.966 E.24726
G1 X87.624 Y175.505 E.01619
G1 X92.9 Y180.78 E.22437
G1 X92.361 Y180.78 E.01619
G1 X87.624 Y176.043 E.20147
G1 X87.624 Y176.581 E.01619
G1 X91.823 Y180.78 E.17858
G1 X91.285 Y180.78 E.01619
G1 X87.624 Y177.12 E.15568
M73 P85 R6
G1 X87.624 Y177.658 E.01619
G1 X90.746 Y180.78 E.13279
G1 X90.208 Y180.78 E.01619
G1 X87.624 Y178.196 E.10989
G1 X87.624 Y178.735 E.01619
G1 X89.669 Y180.78 E.087
G1 X89.131 Y180.78 E.01619
G1 X87.624 Y179.273 E.0641
G1 X87.624 Y179.811 E.01619
G1 X88.593 Y180.78 E.04121
G1 X88.054 Y180.78 E.01619
G1 X87.454 Y180.18 E.02553
; WIPE_START
G1 X88.054 Y180.78 E-.32261
G1 X88.593 Y180.78 E-.20458
G1 X88.159 Y180.347 E-.23281
; WIPE_END
G1 E-.04 F1800
G1 X91.325 Y173.402 Z3.9 F15000
G1 X106.086 Y141.014 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.932 Y140.208 Z3.9 F15000
G1 X88.857 Y138.984 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50611
G1 F4800
G1 X88.857 Y139.447 E.01695
G1 X104.52 Y139.447 E.5731
G1 X104.52 Y138.984 E.01695
G1 X88.917 Y138.984 E.5709
G1 X88.437 Y138.564 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X88.437 Y139.867 E.03882
G1 X104.94 Y139.867 E.49157
G1 X104.94 Y138.564 E.03882
G1 X88.497 Y138.564 E.48978
G1 X88.06 Y138.187 F15000
G1 F4800
G1 X88.06 Y140.244 E.06129
G1 X105.317 Y140.244 E.51403
G1 X105.317 Y138.187 E.06129
G1 X88.12 Y138.187 E.51225
G1 X87.683 Y137.81 F15000
G1 F4800
G1 X87.683 Y140.622 E.08375
G1 X105.694 Y140.622 E.5365
G1 X105.694 Y137.81 E.08375
G1 X87.743 Y137.81 E.53471
; WIPE_START
G1 X89.743 Y137.81 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.655 Y130.755 Z3.9 F15000
G1 X99.418 Y114.37 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X100.127 Y115.598 E.04561
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X95.526 Y113.347 E.01013
G1 X96.688 Y113.1 E.03821
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.388 Y114.318 E.0008
M204 S250
G1 X99.078 Y114.566 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03977
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X95.608 Y113.731 E.0069
G1 X96.688 Y113.501 E.03291
G1 X97.996 Y113.779 E.03982
G1 X99.03 Y114.53 E.03808
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52832
G1 X99.81 Y116.329 E-.23168
; WIPE_END
G1 E-.04 F1800
G1 X95.268 Y110.194 Z3.9 F15000
G1 X87.291 Y99.418 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.454 Y102.146 Z3.9 F15000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42013
G1 F4800
G1 X98.707 Y113.399 E.47418
G1 X98.298 Y113.102 E.01507
G1 X97.762 Y112.988 E.01631
G1 X87.624 Y102.849 E.42723
G1 X87.624 Y103.383 E.0159
G1 X97.085 Y112.844 E.39868
G1 X96.688 Y112.76 E.01207
G1 X96.506 Y112.798 E.00556
G1 X87.624 Y103.916 E.37429
G1 X87.624 Y104.45 E.0159
G1 X96.066 Y112.892 E.35575
G1 X95.626 Y112.985 E.0134
G1 X87.624 Y104.983 E.33721
G1 X87.624 Y105.517 E.0159
G1 X95.186 Y113.079 E.31867
G1 X95.079 Y113.102 E.00325
G1 X94.845 Y113.272 E.00862
G1 X87.624 Y106.05 E.30431
G1 X87.624 Y106.583 E.0159
G1 X94.536 Y113.496 E.29129
G1 X94.227 Y113.721 E.01138
G1 X87.624 Y107.117 E.27827
G1 X87.624 Y107.65 E.0159
G1 X93.918 Y113.945 E.26525
G1 X93.749 Y114.069 E.00626
G1 X93.661 Y114.221 E.00524
G1 X87.624 Y108.184 E.25439
G1 X87.624 Y108.717 E.0159
G1 X93.465 Y114.559 E.24616
G1 X93.27 Y114.897 E.01164
G1 X87.624 Y109.251 E.23794
G1 X87.624 Y109.784 E.0159
G1 X93.075 Y115.235 E.22971
G1 X92.926 Y115.493 E.00887
G1 X92.914 Y115.608 E.00344
G1 X87.624 Y110.318 E.22293
G1 X87.624 Y110.851 E.0159
G1 X92.863 Y116.091 E.22079
G1 X92.812 Y116.573 E.01446
G1 X87.624 Y111.385 E.21865
G1 X87.624 Y111.918 E.0159
G1 X92.762 Y117.056 E.21651
G1 X92.754 Y117.129 E.00219
G1 X92.972 Y117.8 E.02101
G1 X87.624 Y112.451 E.22537
G1 X87.624 Y112.985 E.0159
G1 X105.753 Y131.115 E.76396
G1 X105.753 Y130.581 E.0159
G1 X95.671 Y120.498 E.42487
G1 X95.866 Y120.585 E.00637
G1 X96.291 Y120.585 E.01267
G1 X105.753 Y130.048 E.39873
G1 X105.753 Y129.514 E.0159
G1 X96.824 Y120.585 E.37625
G1 X97.358 Y120.585 E.0159
G1 X105.753 Y128.981 E.35377
G1 X105.753 Y128.447 E.0159
G1 X97.774 Y120.468 E.33623
G1 X98.143 Y120.304 E.01204
G1 X105.753 Y127.914 E.32068
G1 X105.753 Y127.38 E.0159
G1 X98.512 Y120.14 E.30512
G1 X98.882 Y119.975 E.01204
G1 X105.753 Y126.847 E.28957
G1 X105.753 Y126.313 E.0159
G1 X99.176 Y119.736 E.27716
G1 X99.429 Y119.455 E.01125
G1 X105.753 Y125.78 E.26651
G1 X105.753 Y125.247 E.0159
G1 X99.681 Y119.175 E.25586
G1 X99.934 Y118.894 E.01126
G1 X105.753 Y124.713 E.24521
G1 X105.753 Y124.18 E.0159
G1 X100.152 Y118.578 E.23603
G1 X100.283 Y118.176 E.01261
G1 X105.753 Y123.646 E.23052
G1 X105.753 Y123.113 E.0159
G1 X100.414 Y117.773 E.225
G1 X100.545 Y117.371 E.01261
G1 X105.753 Y122.579 E.21949
G1 X105.753 Y122.046 E.0159
G1 X100.598 Y116.89 E.21725
G1 X100.535 Y116.294 E.01786
G1 X105.753 Y121.512 E.21989
G1 X105.753 Y120.979 E.0159
G1 X100.473 Y115.698 E.22253
G1 X100.451 Y115.493 E.00614
G1 X99.973 Y114.665 E.0285
G1 X105.753 Y120.445 E.24359
G1 X105.753 Y119.912 E.0159
G1 X87.624 Y101.782 E.76396
G1 X87.624 Y101.249 E.0159
G1 X105.753 Y119.378 E.76396
G1 X105.753 Y118.845 E.0159
G1 X87.624 Y100.715 E.76396
G1 X87.624 Y100.182 E.0159
G1 X105.753 Y118.312 E.76396
G1 X105.753 Y117.778 E.0159
G1 X87.726 Y99.751 E.75965
G1 X88.259 Y99.751 E.0159
G1 X105.753 Y117.245 E.73717
G1 X105.753 Y116.711 E.0159
G1 X88.793 Y99.751 E.71469
G1 X89.326 Y99.751 E.0159
G1 X105.753 Y116.178 E.69221
G1 X105.753 Y115.644 E.0159
G1 X89.86 Y99.751 E.66973
G1 X90.393 Y99.751 E.0159
G1 X105.753 Y115.111 E.64725
G1 X105.753 Y114.577 E.0159
G1 X90.927 Y99.751 E.62478
G1 X91.46 Y99.751 E.0159
G1 X105.753 Y114.044 E.6023
G1 X105.753 Y113.51 E.0159
G1 X91.994 Y99.751 E.57982
G1 X92.527 Y99.751 E.0159
G1 X105.753 Y112.977 E.55734
G1 X105.753 Y112.444 E.0159
G1 X93.061 Y99.751 E.53486
G1 X93.594 Y99.751 E.0159
G1 X105.753 Y111.91 E.51238
G1 X105.753 Y111.377 E.0159
G1 X94.128 Y99.751 E.4899
G1 X94.661 Y99.751 E.0159
G1 X105.753 Y110.843 E.46742
G1 X105.753 Y110.31 E.0159
G1 X95.194 Y99.751 E.44494
G1 X95.728 Y99.751 E.0159
G1 X105.753 Y109.776 E.42246
G1 X105.753 Y109.243 E.0159
G1 X96.261 Y99.751 E.39998
G1 X96.795 Y99.751 E.0159
G1 X105.753 Y108.709 E.3775
G1 X105.753 Y108.176 E.0159
G1 X97.328 Y99.751 E.35502
G1 X97.862 Y99.751 E.0159
G1 X105.753 Y107.642 E.33254
G1 X105.753 Y107.109 E.0159
G1 X98.395 Y99.751 E.31006
G1 X98.929 Y99.751 E.0159
G1 X105.753 Y106.576 E.28759
M73 P85 R5
G1 X105.753 Y106.042 E.0159
G1 X99.462 Y99.751 E.26511
G1 X99.996 Y99.751 E.0159
G1 X105.753 Y105.509 E.24263
G1 X105.753 Y104.975 E.0159
G1 X100.529 Y99.751 E.22015
G1 X101.062 Y99.751 E.0159
G1 X105.753 Y104.442 E.19767
G1 X105.753 Y103.908 E.0159
G1 X101.596 Y99.751 E.17519
G1 X102.129 Y99.751 E.0159
G1 X105.753 Y103.375 E.15271
G1 X105.753 Y102.841 E.0159
G1 X102.663 Y99.751 E.13023
G1 X103.196 Y99.751 E.0159
G1 X105.753 Y102.308 E.10775
G1 X105.753 Y101.774 E.0159
G1 X103.73 Y99.751 E.08527
G1 X104.263 Y99.751 E.0159
G1 X105.753 Y101.241 E.06279
G1 X105.753 Y100.708 E.0159
G1 X104.797 Y99.751 E.04031
G1 X105.33 Y99.751 E.0159
G1 X105.923 Y100.344 E.02498
; WIPE_START
G1 X105.33 Y99.751 E-.31861
G1 X104.797 Y99.751 E-.20271
G1 X105.241 Y100.195 E-.23868
; WIPE_END
G1 E-.04 F1800
G1 X105.405 Y107.826 Z3.9 F15000
G1 X105.923 Y131.818 Z3.9
G1 Z3.5
G1 E.8 F1800
G1 F4800
G1 X87.624 Y113.518 E.77111
G1 X87.624 Y114.052 E.0159
G1 X105.753 Y132.181 E.76396
G1 X105.753 Y132.715 E.0159
G1 X87.624 Y114.585 E.76396
M73 P86 R5
G1 X87.624 Y115.119 E.0159
G1 X105.753 Y133.248 E.76396
G1 X105.753 Y133.68 E.01288
G1 X105.652 Y133.68 E.00302
G1 X87.624 Y115.652 E.75969
G1 X87.624 Y116.186 E.0159
G1 X105.118 Y133.68 E.73722
G1 X104.585 Y133.68 E.0159
G1 X87.624 Y116.719 E.71474
G1 X87.624 Y117.253 E.0159
G1 X104.052 Y133.68 E.69226
G1 X103.518 Y133.68 E.0159
G1 X87.624 Y117.786 E.66978
G1 X87.624 Y118.32 E.0159
G1 X102.985 Y133.68 E.6473
G1 X102.451 Y133.68 E.0159
G1 X87.624 Y118.853 E.62482
G1 X87.624 Y119.386 E.0159
G1 X101.918 Y133.68 E.60234
G1 X101.384 Y133.68 E.0159
G1 X87.624 Y119.92 E.57986
G1 X87.624 Y120.453 E.0159
G1 X100.851 Y133.68 E.55738
G1 X100.317 Y133.68 E.0159
G1 X87.624 Y120.987 E.5349
G1 X87.624 Y121.52 E.0159
G1 X99.784 Y133.68 E.51242
G1 X99.25 Y133.68 E.0159
G1 X87.624 Y122.054 E.48994
G1 X87.624 Y122.587 E.0159
G1 X98.717 Y133.68 E.46746
G1 X98.184 Y133.68 E.0159
G1 X87.624 Y123.121 E.44498
G1 X87.624 Y123.654 E.0159
G1 X97.65 Y133.68 E.4225
G1 X97.117 Y133.68 E.0159
G1 X87.624 Y124.188 E.40002
G1 X87.624 Y124.721 E.0159
G1 X96.583 Y133.68 E.37755
G1 X96.05 Y133.68 E.0159
G1 X87.624 Y125.254 E.35507
G1 X87.624 Y125.788 E.0159
G1 X95.516 Y133.68 E.33259
G1 X94.983 Y133.68 E.0159
G1 X87.624 Y126.321 E.31011
G1 X87.624 Y126.855 E.0159
G1 X94.449 Y133.68 E.28763
G1 X93.916 Y133.68 E.0159
G1 X87.624 Y127.388 E.26515
G1 X87.624 Y127.922 E.0159
G1 X93.382 Y133.68 E.24267
G1 X92.849 Y133.68 E.0159
G1 X87.624 Y128.455 E.22019
G1 X87.624 Y128.989 E.0159
G1 X92.316 Y133.68 E.19771
G1 X91.782 Y133.68 E.0159
G1 X87.624 Y129.522 E.17523
G1 X87.624 Y130.056 E.0159
G1 X91.249 Y133.68 E.15275
G1 X90.715 Y133.68 E.0159
G1 X87.624 Y130.589 E.13027
G1 X87.624 Y131.122 E.0159
G1 X90.182 Y133.68 E.10779
G1 X89.648 Y133.68 E.0159
G1 X87.624 Y131.656 E.08531
G1 X87.624 Y132.189 E.0159
G1 X89.115 Y133.68 E.06283
G1 X88.581 Y133.68 E.0159
G1 X87.624 Y132.723 E.04035
G1 X87.624 Y133.256 E.0159
G1 X88.218 Y133.85 E.02503
; WIPE_START
G1 X87.624 Y133.256 E-.31915
G1 X87.624 Y132.723 E-.20271
G1 X88.067 Y133.166 E-.23814
; WIPE_END
G1 E-.04 F1800
G1 X87.907 Y125.535 Z3.9 F15000
G1 X87.291 Y96.014 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.857 Y94.447 Z3.9 F15000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.506115
G1 F4800
G1 X104.52 Y94.447 E.5731
G1 X104.52 Y93.984 E.01695
G1 X88.857 Y93.984 E.5731
G1 X88.857 Y94.387 E.01475
G1 X88.437 Y94.867 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X104.94 Y94.867 E.49157
G1 X104.94 Y93.564 E.03882
G1 X88.437 Y93.564 E.49157
G1 X88.437 Y94.807 E.03704
G1 X88.06 Y95.244 F15000
G1 F4800
G1 X105.317 Y95.244 E.51403
G1 X105.317 Y93.187 E.06129
G1 X88.06 Y93.187 E.51403
G1 X88.06 Y95.184 E.0595
G1 X87.683 Y95.622 F15000
G1 F4800
G1 X105.694 Y95.622 E.5365
G1 X105.694 Y92.81 E.08375
G1 X87.683 Y92.81 E.5365
G1 X87.683 Y95.562 E.08196
; WIPE_START
G1 X87.683 Y93.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.289 Y86.835 Z3.9 F15000
G1 X97.518 Y75.218 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X97.44 Y75.252 E.00273
G1 X95.937 Y75.252 E.04835
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X95.526 Y68.347 E.01013
G1 X96.688 Y68.1 E.03821
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04835
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.573 Y75.193 E.04368
M204 S250
G1 X97.355 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03977
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X95.608 Y68.731 E.0069
G1 X96.688 Y68.501 E.03291
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.41 Y74.836 E.03808
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52833
G1 X95.463 Y74.612 E-.23167
; WIPE_END
G1 E-.04 F1800
G1 X91.696 Y81.25 Z3.9 F15000
G1 X87.291 Y89.014 Z3.9
G1 Z3.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.454 Y88.08 Z3.9 F15000
G1 Z3.5
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4236
G1 F4800
G1 X88.054 Y88.68 E.02553
G1 X88.593 Y88.68 E.01619
G1 X87.624 Y87.711 E.04121
G1 X87.624 Y87.173 E.01619
G1 X89.131 Y88.68 E.0641
G1 X89.669 Y88.68 E.01619
G1 X87.624 Y86.635 E.087
G1 X87.624 Y86.096 E.01619
G1 X90.208 Y88.68 E.10989
G1 X90.746 Y88.68 E.01619
G1 X87.624 Y85.558 E.13279
G1 X87.624 Y85.02 E.01619
G1 X91.285 Y88.68 E.15568
G1 X91.823 Y88.68 E.01619
G1 X87.624 Y84.481 E.17858
G1 X87.624 Y83.943 E.01619
G1 X92.361 Y88.68 E.20147
G1 X92.9 Y88.68 E.01619
G1 X87.624 Y83.405 E.22437
G1 X87.624 Y82.866 E.01619
G1 X93.438 Y88.68 E.24726
G1 X93.976 Y88.68 E.01619
G1 X87.624 Y82.328 E.27016
G1 X87.624 Y81.789 E.01619
G1 X94.515 Y88.68 E.29305
G1 X95.053 Y88.68 E.01619
G1 X87.624 Y81.251 E.31595
G1 X87.624 Y80.713 E.01619
G1 X95.591 Y88.68 E.33884
G1 X96.13 Y88.68 E.01619
G1 X87.624 Y80.174 E.36174
G1 X87.624 Y79.636 E.01619
G1 X96.668 Y88.68 E.38463
G1 X97.207 Y88.68 E.01619
G1 X87.624 Y79.098 E.40753
G1 X87.624 Y78.559 E.01619
G1 X97.745 Y88.68 E.43042
G1 X98.283 Y88.68 E.01619
G1 X87.624 Y78.021 E.45332
G1 X87.624 Y77.483 E.01619
G1 X98.822 Y88.68 E.47621
G1 X99.36 Y88.68 E.01619
G1 X87.624 Y76.944 E.49911
G1 X87.624 Y76.406 E.01619
G1 X99.898 Y88.68 E.522
G1 X100.437 Y88.68 E.01619
G1 X87.624 Y75.867 E.5449
G1 X87.624 Y75.329 E.01619
G1 X100.975 Y88.68 E.56779
G1 X101.513 Y88.68 E.01619
G1 X87.624 Y74.791 E.59068
G1 X87.624 Y74.252 E.01619
G1 X102.052 Y88.68 E.61358
G1 X102.59 Y88.68 E.01619
G1 X87.624 Y73.714 E.63647
G1 X87.624 Y73.176 E.01619
G1 X103.128 Y88.68 E.65937
G1 X103.667 Y88.68 E.01619
G1 X87.624 Y72.637 E.68226
G1 X87.624 Y72.099 E.01619
G1 X104.205 Y88.68 E.70516
G1 X104.744 Y88.68 E.01619
G1 X87.624 Y71.561 E.72805
G1 X87.624 Y71.022 E.01619
G1 X105.282 Y88.68 E.75095
G1 X105.753 Y88.68 E.01417
G1 X105.753 Y88.613 E.00202
G1 X87.624 Y70.484 E.77099
G1 X87.624 Y69.945 E.01619
G1 X105.753 Y88.075 E.77099
G1 X105.753 Y87.537 E.01619
G1 X87.624 Y69.407 E.77099
G1 X87.624 Y68.869 E.01619
G1 X105.923 Y87.168 E.77821
; WIPE_START
G1 X104.509 Y85.754 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.84 Y78.129 Z3.9 F15000
G1 X105.923 Y53.251 Z3.9
G1 Z3.5
G1 E.8 F1800
G1 F4800
G1 X105.323 Y52.651 E.02553
G1 X104.784 Y52.651 E.01619
G1 X105.753 Y53.62 E.04121
G1 X105.753 Y54.158 E.01619
G1 X104.246 Y52.651 E.0641
G1 X103.708 Y52.651 E.01619
G1 X105.753 Y54.697 E.08699
G1 X105.753 Y55.235 E.01619
G1 X103.169 Y52.651 E.10989
G1 X102.631 Y52.651 E.01619
G1 X105.753 Y55.773 E.13278
G1 X105.753 Y56.312 E.01619
G1 X102.093 Y52.651 E.15568
G1 X101.554 Y52.651 E.01619
G1 X105.753 Y56.85 E.17857
G1 X105.753 Y57.388 E.01619
G1 X101.016 Y52.651 E.20147
G1 X100.477 Y52.651 E.01619
G1 X105.753 Y57.927 E.22436
G1 X105.753 Y58.465 E.01619
G1 X99.939 Y52.651 E.24726
G1 X99.401 Y52.651 E.01619
G1 X105.753 Y59.003 E.27015
G1 X105.753 Y59.542 E.01619
G1 X98.862 Y52.651 E.29305
G1 X98.324 Y52.651 E.01619
G1 X105.753 Y60.08 E.31594
G1 X105.753 Y60.619 E.01619
G1 X97.786 Y52.651 E.33884
G1 X97.247 Y52.651 E.01619
G1 X105.753 Y61.157 E.36173
G1 X105.753 Y61.695 E.01619
G1 X96.709 Y52.651 E.38463
G1 X96.171 Y52.651 E.01619
G1 X105.753 Y62.234 E.40752
G1 X105.753 Y62.772 E.01619
G1 X95.632 Y52.651 E.43042
G1 X95.094 Y52.651 E.01619
G1 X105.753 Y63.31 E.45331
G1 X105.753 Y63.849 E.01619
G1 X94.555 Y52.651 E.47621
G1 X94.017 Y52.651 E.01619
G1 X105.753 Y64.387 E.4991
M73 P87 R5
G1 X105.753 Y64.925 E.01619
G1 X93.479 Y52.651 E.522
G1 X92.94 Y52.651 E.01619
G1 X105.753 Y65.464 E.54489
G1 X105.753 Y66.002 E.01619
G1 X92.402 Y52.651 E.56779
G1 X91.864 Y52.651 E.01619
G1 X105.753 Y66.541 E.59068
G1 X105.753 Y67.079 E.01619
G1 X91.325 Y52.651 E.61358
G1 X90.787 Y52.651 E.01619
G1 X105.753 Y67.617 E.63647
G1 X105.753 Y68.156 E.01619
G1 X90.249 Y52.651 E.65937
G1 X89.71 Y52.651 E.01619
G1 X105.753 Y68.694 E.68226
G1 X105.753 Y69.232 E.01619
G1 X89.172 Y52.651 E.70516
G1 X88.633 Y52.651 E.01619
G1 X105.753 Y69.771 E.72805
G1 X105.753 Y70.309 E.01619
G1 X88.095 Y52.651 E.75095
G1 X87.624 Y52.651 E.01418
G1 X87.624 Y52.718 E.00201
G1 X105.753 Y70.847 E.77099
G1 X105.753 Y71.386 E.01619
G1 X87.624 Y53.256 E.77099
G1 X87.624 Y53.795 E.01619
G1 X105.753 Y71.924 E.77099
G1 X105.753 Y72.463 E.01619
G1 X87.624 Y54.333 E.77099
G1 X87.624 Y54.871 E.01619
G1 X105.753 Y73.001 E.77099
G1 X105.753 Y73.539 E.01619
G1 X87.624 Y55.41 E.77099
G1 X87.624 Y55.948 E.01619
G1 X105.753 Y74.078 E.77099
G1 X105.753 Y74.616 E.01619
G1 X87.624 Y56.486 E.77099
G1 X87.624 Y57.025 E.01619
G1 X105.753 Y75.154 E.77099
G1 X105.753 Y75.693 E.01619
G1 X100.311 Y70.25 E.23146
G1 X100.451 Y70.493 E.00845
G1 X100.502 Y70.98 E.01472
G1 X105.753 Y76.231 E.22331
G1 X105.753 Y76.769 E.01619
G1 X100.565 Y71.582 E.22062
G1 X100.623 Y72.129 E.01656
G1 X100.611 Y72.166 E.00115
G1 X105.753 Y77.308 E.21868
G1 X105.753 Y77.846 E.01619
G1 X100.479 Y72.572 E.22429
G1 X100.347 Y72.978 E.01285
G1 X105.753 Y78.385 E.22991
G1 X105.753 Y78.923 E.01619
G1 X100.215 Y73.385 E.23552
G1 X100.115 Y73.694 E.00977
G1 X100.054 Y73.762 E.00274
G1 X105.753 Y79.461 E.24239
G1 X105.753 Y80 E.01619
G1 X99.798 Y74.045 E.25324
G1 X99.543 Y74.328 E.01146
G1 X105.753 Y80.538 E.26409
G1 X105.753 Y81.076 E.01619
G1 X99.288 Y74.611 E.27493
G1 X99.033 Y74.895 E.01146
G1 X105.753 Y81.615 E.28578
G1 X105.753 Y82.153 E.01619
G1 X98.67 Y75.069 E.30124
G1 X98.297 Y75.235 E.01226
G1 X105.753 Y82.691 E.31708
G1 X105.753 Y83.23 E.01619
G1 X97.925 Y75.401 E.33293
G1 X97.552 Y75.567 E.01226
G1 X105.753 Y83.768 E.34877
G1 X105.753 Y84.307 E.01619
G1 X97.032 Y75.585 E.37088
G1 X96.494 Y75.585 E.01619
G1 X105.753 Y84.845 E.39378
G1 X105.753 Y85.383 E.01619
G1 X95.955 Y75.585 E.41667
G1 X95.866 Y75.585 E.00269
G1 X95.057 Y75.225 E.02664
G1 X105.753 Y85.922 E.45489
G1 X105.753 Y86.46 E.01619
G1 X87.624 Y68.33 E.77099
G1 X87.624 Y67.792 E.01619
G1 X93.136 Y73.304 E.23441
G1 X92.877 Y72.507 E.02522
G1 X87.624 Y67.254 E.22339
G1 X87.624 Y66.715 E.01619
G1 X92.781 Y71.873 E.21932
G1 X92.832 Y71.385 E.01473
G1 X87.624 Y66.177 E.2215
G1 X87.624 Y65.639 E.01619
G1 X92.883 Y70.898 E.22368
G1 X92.926 Y70.493 E.01225
G1 X92.959 Y70.436 E.002
G1 X87.624 Y65.1 E.2269
G1 X87.624 Y64.562 E.01619
G1 X93.156 Y70.094 E.23528
G1 X93.353 Y69.753 E.01185
G1 X87.624 Y64.023 E.24366
G1 X87.624 Y63.485 E.01619
G1 X93.55 Y69.412 E.25204
G1 X93.747 Y69.07 E.01185
G1 X87.624 Y62.947 E.26042
G1 X87.624 Y62.408 E.01619
G1 X94.059 Y68.843 E.27365
G1 X94.37 Y68.617 E.01159
G1 X87.624 Y61.87 E.28692
G1 X87.624 Y61.332 E.01619
G1 X94.682 Y68.39 E.30018
G1 X94.994 Y68.164 E.01159
G1 X87.624 Y60.793 E.31344
G1 X87.624 Y60.255 E.01619
G1 X95.402 Y68.033 E.33078
G1 X95.846 Y67.939 E.01365
G1 X87.624 Y59.717 E.34966
G1 X87.624 Y59.178 E.01619
G1 X96.29 Y67.844 E.36854
G1 X96.688 Y67.76 E.01226
G1 X96.758 Y67.774 E.00214
G1 X87.624 Y58.64 E.38846
G1 X87.624 Y58.101 E.01619
G1 X97.442 Y67.92 E.41754
G1 X98.126 Y68.065 E.02102
G1 X87.454 Y57.393 E.45383
; CHANGE_LAYER
; Z_HEIGHT: 3.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4800
G1 X88.868 Y58.808 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 18/20
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
G17
G3 Z3.9 I1.217 J0 P1  F15000
; object ids of layer 18 start: 178
M624 AgAAAAAAAAA=
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
; object ids of this layer18 end: 178
M625
; OBJECT_ID: 178
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X98.736 Y164.675
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X97.44 Y165.252 E.0456
G1 X95.937 Y165.252 E.04834
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04834
G1 X95.465 Y158.36 E.00813
G1 X96.688 Y158.1 E.04022
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04835
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.814 Y164.641 E.04835
G1 X98.79 Y164.651 E.00082
M204 S250
G1 X98.576 Y164.317 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03976
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X95.547 Y158.744 E.00505
G1 X96.688 Y158.501 E.03477
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.617 Y164.273 E.03809
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52817
G1 X96.747 Y164.86 E-.23184
; WIPE_END
G1 E-.04 F1800
G1 X93.542 Y157.933 Z4.1 F15000
G1 X87.291 Y144.418 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.224 Y144.581 Z4.1 F15000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4236
G1 F4800
G1 X87.624 Y145.182 E.02553
G1 X87.624 Y145.72 E.01619
G1 X88.593 Y144.751 E.04121
G1 X89.131 Y144.751 E.01619
G1 X87.624 Y146.258 E.0641
G1 X87.624 Y146.797 E.01619
G1 X89.669 Y144.751 E.087
G1 X90.208 Y144.751 E.01619
G1 X87.624 Y147.335 E.10989
G1 X87.624 Y147.873 E.01619
G1 X90.746 Y144.751 E.13279
G1 X91.285 Y144.751 E.01619
G1 X87.624 Y148.412 E.15568
G1 X87.624 Y148.95 E.01619
G1 X91.823 Y144.751 E.17858
G1 X92.361 Y144.751 E.01619
G1 X87.624 Y149.488 E.20147
G1 X87.624 Y150.027 E.01619
G1 X92.9 Y144.751 E.22437
G1 X93.438 Y144.751 E.01619
G1 X87.624 Y150.565 E.24726
G1 X87.624 Y151.104 E.01619
G1 X93.976 Y144.751 E.27016
G1 X94.515 Y144.751 E.01619
G1 X87.624 Y151.642 E.29305
G1 X87.624 Y152.18 E.01619
G1 X95.053 Y144.751 E.31595
G1 X95.591 Y144.751 E.01619
G1 X87.624 Y152.719 E.33884
G1 X87.624 Y153.257 E.01619
G1 X96.13 Y144.751 E.36174
G1 X96.668 Y144.751 E.01619
G1 X87.624 Y153.795 E.38463
G1 X87.624 Y154.334 E.01619
G1 X97.207 Y144.751 E.40753
G1 X97.745 Y144.751 E.01619
G1 X87.624 Y154.872 E.43042
G1 X87.624 Y155.41 E.01619
G1 X98.283 Y144.751 E.45332
G1 X98.822 Y144.751 E.01619
G1 X87.624 Y155.949 E.47621
G1 X87.624 Y156.487 E.01619
G1 X99.36 Y144.751 E.49911
G1 X99.898 Y144.751 E.01619
G1 X87.624 Y157.026 E.522
G1 X87.624 Y157.564 E.01619
G1 X100.437 Y144.751 E.5449
G1 X100.975 Y144.751 E.01619
G1 X87.624 Y158.102 E.56779
G1 X87.624 Y158.641 E.01619
G1 X101.513 Y144.751 E.59069
G1 X102.052 Y144.751 E.01619
G1 X87.624 Y159.179 E.61358
G1 X87.624 Y159.717 E.01619
G1 X102.59 Y144.751 E.63647
G1 X103.129 Y144.751 E.01619
G1 X87.624 Y160.256 E.65937
G1 X87.624 Y160.794 E.01619
G1 X103.667 Y144.751 E.68226
G1 X104.205 Y144.751 E.01619
G1 X87.624 Y161.332 E.70516
G1 X87.624 Y161.871 E.01619
G1 X104.744 Y144.751 E.72805
G1 X105.282 Y144.751 E.01619
G1 X87.624 Y162.409 E.75095
G1 X87.624 Y162.948 E.01619
G1 X105.753 Y144.818 E.77099
G1 X105.753 Y145.356 E.01619
G1 X87.624 Y163.486 E.77099
G1 X87.624 Y164.024 E.01619
G1 X105.753 Y145.895 E.77099
G1 X105.753 Y146.433 E.01619
G1 X87.454 Y164.732 E.77821
; WIPE_START
G1 X88.868 Y163.318 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.101 Y160.88 Z4.1 F15000
G1 X105.923 Y157.569 Z4.1
G1 Z3.7
G1 E.8 F1800
G1 F4800
G1 X100.267 Y163.225 E.24053
G1 X100.526 Y162.428 E.02522
G1 X105.753 Y157.2 E.2223
G1 X105.753 Y156.662 E.01619
G1 X100.591 Y161.824 E.21954
G1 X100.54 Y161.337 E.01473
G1 X105.753 Y156.124 E.22172
G1 X105.753 Y155.585 E.01619
G1 X100.488 Y160.85 E.22389
G1 X100.451 Y160.493 E.01079
G1 X100.398 Y160.402 E.00317
G1 X105.753 Y155.047 E.22773
G1 X105.753 Y154.509 E.01619
G1 X100.201 Y160.061 E.23611
G1 X100.004 Y159.719 E.01185
G1 X105.753 Y153.97 E.24449
G1 X105.753 Y153.432 E.01619
G1 X99.807 Y159.378 E.25287
G1 X99.628 Y159.069 E.01074
G1 X99.599 Y159.047 E.00108
G1 X105.753 Y152.893 E.26171
G1 X105.753 Y152.355 E.01619
G1 X99.287 Y158.821 E.27497
G1 X98.976 Y158.594 E.01159
G1 X105.753 Y151.817 E.28823
G1 X105.753 Y151.278 E.01619
G1 X98.664 Y158.368 E.30149
G1 X98.352 Y158.141 E.01159
G1 X105.753 Y150.74 E.31475
M73 P88 R5
G1 X105.753 Y150.202 E.01619
G1 X97.931 Y158.024 E.33265
G1 X97.487 Y157.929 E.01365
G1 X105.753 Y149.663 E.35153
G1 X105.753 Y149.125 E.01619
G1 X97.043 Y157.835 E.37041
G1 X96.688 Y157.76 E.0109
G1 X96.551 Y157.789 E.00423
G1 X105.753 Y148.587 E.39134
G1 X105.753 Y148.048 E.01619
G1 X95.867 Y157.934 E.42042
G1 X95.184 Y158.079 E.02102
G1 X105.753 Y147.51 E.44949
G1 X105.753 Y146.971 E.01619
G1 X87.624 Y165.101 E.77099
G1 X87.624 Y165.639 E.01619
G1 X93.139 Y160.124 E.23456
G1 X92.926 Y160.493 E.01283
G1 X92.881 Y160.92 E.01291
G1 X87.624 Y166.178 E.22358
G1 X87.624 Y166.716 E.01619
G1 X92.818 Y161.522 E.22089
G1 X92.755 Y162.124 E.01819
G1 X87.624 Y167.254 E.2182
G1 X87.624 Y167.793 E.01619
G1 X92.885 Y162.532 E.22374
G1 X93.017 Y162.938 E.01285
G1 X87.624 Y168.331 E.22935
G1 X87.624 Y168.87 E.01619
G1 X93.149 Y163.344 E.23497
G1 X93.262 Y163.694 E.01105
G1 X93.298 Y163.733 E.00161
G1 X87.624 Y169.408 E.24132
G1 X87.624 Y169.946 E.01619
G1 X93.553 Y164.017 E.25216
G1 X93.808 Y164.3 E.01146
G1 X87.624 Y170.485 E.26301
G1 X87.624 Y171.023 E.01619
M73 P88 R4
G1 X94.063 Y164.583 E.27386
G1 X94.318 Y164.867 E.01146
G1 X87.624 Y171.561 E.28471
G1 X87.624 Y172.1 E.01619
G1 X94.67 Y165.053 E.29967
G1 X95.043 Y165.219 E.01226
G1 X87.624 Y172.638 E.31551
G1 X87.624 Y173.176 E.01619
G1 X95.415 Y165.385 E.33135
G1 X95.788 Y165.551 E.01226
G1 X87.624 Y173.715 E.3472
G1 X87.624 Y174.253 E.01619
G1 X96.291 Y165.585 E.36861
G1 X96.83 Y165.585 E.01619
G1 X87.624 Y174.792 E.39151
G1 X87.624 Y175.33 E.01619
G1 X97.368 Y165.585 E.4144
G1 X97.511 Y165.585 E.00429
G1 X98.224 Y165.268 E.02347
G1 X87.624 Y175.868 E.4508
G1 X87.624 Y176.407 E.01619
G1 X105.753 Y158.277 E.77099
G1 X105.753 Y158.815 E.01619
G1 X87.624 Y176.945 E.77099
G1 X87.624 Y177.483 E.01619
G1 X105.753 Y159.354 E.77099
G1 X105.753 Y159.892 E.01619
G1 X87.624 Y178.022 E.77099
G1 X87.624 Y178.56 E.01619
G1 X105.753 Y160.43 E.77099
G1 X105.753 Y160.969 E.01619
G1 X87.624 Y179.098 E.77099
G1 X87.624 Y179.637 E.01619
G1 X105.753 Y161.507 E.77099
G1 X105.753 Y162.046 E.01619
G1 X87.624 Y180.175 E.77099
G1 X87.624 Y180.713 E.01619
G1 X105.753 Y162.584 E.77099
G1 X105.753 Y163.122 E.01619
G1 X88.095 Y180.78 E.75095
G1 X88.633 Y180.78 E.01619
G1 X105.753 Y163.661 E.72805
G1 X105.753 Y164.199 E.01619
G1 X89.172 Y180.78 E.70516
G1 X89.71 Y180.78 E.01619
G1 X105.753 Y164.737 E.68226
G1 X105.753 Y165.276 E.01619
G1 X90.249 Y180.78 E.65937
G1 X90.787 Y180.78 E.01619
G1 X105.753 Y165.814 E.63647
G1 X105.753 Y166.352 E.01619
G1 X91.325 Y180.78 E.61358
G1 X91.864 Y180.78 E.01619
G1 X105.753 Y166.891 E.59068
G1 X105.753 Y167.429 E.01619
G1 X92.402 Y180.78 E.56779
G1 X92.94 Y180.78 E.01619
G1 X105.753 Y167.968 E.54489
G1 X105.753 Y168.506 E.01619
G1 X93.479 Y180.78 E.522
G1 X94.017 Y180.78 E.01619
G1 X105.753 Y169.044 E.4991
G1 X105.753 Y169.583 E.01619
G1 X94.555 Y180.78 E.47621
G1 X95.094 Y180.78 E.01619
G1 X105.753 Y170.121 E.45331
G1 X105.753 Y170.659 E.01619
G1 X95.632 Y180.78 E.43042
G1 X96.171 Y180.78 E.01619
G1 X105.753 Y171.198 E.40752
G1 X105.753 Y171.736 E.01619
G1 X96.709 Y180.78 E.38463
G1 X97.247 Y180.78 E.01619
G1 X105.753 Y172.274 E.36173
G1 X105.753 Y172.813 E.01619
G1 X97.786 Y180.78 E.33884
G1 X98.324 Y180.78 E.01619
G1 X105.753 Y173.351 E.31594
G1 X105.753 Y173.89 E.01619
G1 X98.862 Y180.78 E.29305
G1 X99.401 Y180.78 E.01619
G1 X105.753 Y174.428 E.27015
G1 X105.753 Y174.966 E.01619
G1 X99.939 Y180.78 E.24726
G1 X100.477 Y180.78 E.01619
G1 X105.753 Y175.505 E.22436
G1 X105.753 Y176.043 E.01619
G1 X101.016 Y180.78 E.20147
G1 X101.554 Y180.78 E.01619
G1 X105.753 Y176.581 E.17857
G1 X105.753 Y177.12 E.01619
G1 X102.093 Y180.78 E.15568
G1 X102.631 Y180.78 E.01619
G1 X105.753 Y177.658 E.13278
G1 X105.753 Y178.196 E.01619
G1 X103.169 Y180.78 E.10989
G1 X103.708 Y180.78 E.01619
G1 X105.753 Y178.735 E.08699
G1 X105.753 Y179.273 E.01619
G1 X104.246 Y180.78 E.0641
G1 X104.784 Y180.78 E.01619
G1 X105.753 Y179.812 E.04121
G1 X105.753 Y180.35 E.01619
G1 X105.153 Y180.95 E.02553
; WIPE_START
G1 X105.753 Y180.35 E-.32257
G1 X105.753 Y179.812 E-.20458
G1 X105.32 Y180.245 E-.23285
; WIPE_END
G1 E-.04 F1800
G1 X105.469 Y172.614 Z4.1 F15000
G1 X106.086 Y141.014 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.932 Y140.208 Z4.1 F15000
G1 X88.857 Y138.984 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50611
G1 F4800
G1 X88.857 Y139.447 E.01695
G1 X104.52 Y139.447 E.5731
G1 X104.52 Y138.984 E.01695
G1 X88.917 Y138.984 E.5709
G1 X88.437 Y138.564 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X88.437 Y139.867 E.03882
G1 X104.94 Y139.867 E.49157
G1 X104.94 Y138.564 E.03882
G1 X88.497 Y138.564 E.48978
G1 X88.06 Y138.187 F15000
G1 F4800
G1 X88.06 Y140.244 E.06129
G1 X105.317 Y140.244 E.51403
G1 X105.317 Y138.187 E.06129
G1 X88.12 Y138.187 E.51225
G1 X87.683 Y137.81 F15000
G1 F4800
G1 X87.683 Y140.622 E.08375
G1 X105.694 Y140.622 E.5365
G1 X105.694 Y137.81 E.08375
G1 X87.743 Y137.81 E.53471
; WIPE_START
G1 X89.743 Y137.81 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.613 Y130.738 Z4.1 F15000
G1 X99.306 Y114.246 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X99.375 Y114.296 E.00275
G1 X100.127 Y115.598 E.04834
G1 X100.284 Y117.094 E.04835
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04835
G1 X95.218 Y113.413 E.04834
G1 X95.465 Y113.36 E.00813
G1 X96.688 Y113.1 E.04022
G1 X98.159 Y113.413 E.04834
G1 X99.258 Y114.211 E.04367
M204 S250
G1 X99.076 Y114.563 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.077 Y114.565 E.00006
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X95.547 Y113.744 E.00505
G1 X96.688 Y113.501 E.03477
G1 X97.996 Y113.779 E.03982
G1 X99.027 Y114.528 E.03797
; WIPE_START
M204 S5000
G1 X99.077 Y114.565 E-.02358
G1 X99.746 Y115.722 E-.50795
G1 X99.809 Y116.32 E-.22847
; WIPE_END
G1 E-.04 F1800
G1 X95.266 Y110.187 Z4.1 F15000
G1 X87.291 Y99.418 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.218 Y99.581 Z4.1 F15000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42013
G1 F4800
G1 X87.624 Y100.175 E.02503
G1 X87.624 Y100.709 E.0159
G1 X88.581 Y99.751 E.04035
G1 X89.115 Y99.751 E.0159
G1 X87.624 Y101.242 E.06283
G1 X87.624 Y101.775 E.0159
G1 X89.648 Y99.751 E.08531
G1 X90.182 Y99.751 E.0159
G1 X87.624 Y102.309 E.10779
G1 X87.624 Y102.842 E.0159
G1 X90.715 Y99.751 E.13027
G1 X91.249 Y99.751 E.0159
G1 X87.624 Y103.376 E.15275
G1 X87.624 Y103.909 E.0159
G1 X91.782 Y99.751 E.17523
G1 X92.316 Y99.751 E.0159
G1 X87.624 Y104.443 E.19771
G1 X87.624 Y104.976 E.0159
G1 X92.849 Y99.751 E.22019
G1 X93.382 Y99.751 E.0159
G1 X87.624 Y105.51 E.24267
G1 X87.624 Y106.043 E.0159
G1 X93.916 Y99.751 E.26515
G1 X94.449 Y99.751 E.0159
G1 X87.624 Y106.577 E.28763
G1 X87.624 Y107.11 E.0159
G1 X94.983 Y99.751 E.31011
G1 X95.516 Y99.751 E.0159
G1 X87.624 Y107.643 E.33259
G1 X87.624 Y108.177 E.0159
G1 X96.05 Y99.751 E.35507
G1 X96.583 Y99.751 E.0159
G1 X87.624 Y108.71 E.37755
G1 X87.624 Y109.244 E.0159
G1 X97.117 Y99.751 E.40003
G1 X97.65 Y99.751 E.0159
G1 X87.624 Y109.777 E.4225
G1 X87.624 Y110.311 E.0159
G1 X98.184 Y99.751 E.44498
G1 X98.717 Y99.751 E.0159
G1 X87.624 Y110.844 E.46746
G1 X87.624 Y111.378 E.0159
G1 X99.25 Y99.751 E.48994
M73 P89 R4
G1 X99.784 Y99.751 E.0159
G1 X87.624 Y111.911 E.51242
G1 X87.624 Y112.445 E.0159
G1 X100.317 Y99.751 E.5349
G1 X100.851 Y99.751 E.0159
G1 X87.624 Y112.978 E.55738
G1 X87.624 Y113.511 E.0159
G1 X101.384 Y99.751 E.57986
G1 X101.918 Y99.751 E.0159
G1 X87.624 Y114.045 E.60234
G1 X87.624 Y114.578 E.0159
G1 X102.451 Y99.751 E.62482
G1 X102.985 Y99.751 E.0159
G1 X87.624 Y115.112 E.6473
G1 X87.624 Y115.645 E.0159
G1 X103.518 Y99.751 E.66978
G1 X104.052 Y99.751 E.0159
G1 X87.624 Y116.179 E.69226
G1 X87.624 Y116.712 E.0159
G1 X104.585 Y99.751 E.71474
G1 X105.118 Y99.751 E.0159
G1 X87.624 Y117.246 E.73722
G1 X87.624 Y117.779 E.0159
G1 X105.652 Y99.751 E.75969
G1 X105.753 Y99.751 E.00302
G1 X105.753 Y100.183 E.01288
G1 X87.624 Y118.313 E.76396
G1 X87.624 Y118.846 E.0159
G1 X105.753 Y100.716 E.76396
G1 X105.753 Y101.25 E.0159
G1 X87.454 Y119.549 E.77111
; WIPE_START
G1 X88.868 Y118.135 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.018 Y125.72 Z4.1 F15000
G1 X87.454 Y130.752 Z4.1
G1 Z3.7
G1 E.8 F1800
G1 F4800
G1 X97.708 Y120.498 E.4321
G1 X97.511 Y120.585 E.00643
G1 X97.087 Y120.585 E.01264
G1 X87.624 Y130.049 E.39877
G1 X87.624 Y129.515 E.0159
G1 X96.553 Y120.585 E.37629
G1 X96.02 Y120.585 E.0159
G1 X87.624 Y128.982 E.35381
G1 X87.624 Y128.448 E.0159
G1 X95.603 Y120.468 E.33626
G1 X95.234 Y120.304 E.01204
G1 X87.624 Y127.915 E.32071
G1 X87.624 Y127.381 E.0159
G1 X94.865 Y120.14 E.30515
G1 X94.496 Y119.975 E.01204
G1 X87.624 Y126.848 E.2896
G1 X87.624 Y126.314 E.0159
G1 X94.201 Y119.737 E.27718
G1 X93.949 Y119.456 E.01126
G1 X87.624 Y125.781 E.26653
G1 X87.624 Y125.248 E.0159
G1 X93.696 Y119.175 E.25588
G1 X93.443 Y118.895 E.01126
G1 X87.624 Y124.714 E.24523
G1 X87.624 Y124.181 E.0159
G1 X93.225 Y118.579 E.23604
G1 X93.094 Y118.177 E.01261
G1 X87.624 Y123.647 E.23053
G1 X87.624 Y123.114 E.0159
G1 X92.963 Y117.774 E.22501
G1 X92.833 Y117.371 E.01261
G1 X87.624 Y122.58 E.2195
G1 X87.624 Y122.047 E.0159
G1 X92.779 Y116.891 E.21724
G1 X92.842 Y116.295 E.01786
G1 X87.624 Y121.513 E.21988
G1 X87.624 Y120.98 E.0159
G1 X92.904 Y115.699 E.22252
G1 X92.926 Y115.493 E.00617
G1 X93.403 Y114.667 E.02842
G1 X87.624 Y120.446 E.24353
G1 X87.624 Y119.913 E.0159
G1 X105.753 Y101.783 E.76396
G1 X105.753 Y102.317 E.0159
G1 X94.674 Y113.396 E.46687
G1 X95.079 Y113.102 E.01493
G1 X95.616 Y112.988 E.01635
G1 X105.753 Y102.85 E.42717
G1 X105.753 Y103.384 E.0159
G1 X96.293 Y112.844 E.39863
G1 X96.688 Y112.76 E.01203
G1 X96.872 Y112.799 E.00559
G1 X105.753 Y103.917 E.37425
G1 X105.753 Y104.451 E.0159
G1 X97.312 Y112.892 E.35571
G1 X97.752 Y112.986 E.0134
G1 X105.753 Y104.984 E.33717
G1 X105.753 Y105.518 E.0159
G1 X98.192 Y113.079 E.31864
G1 X98.298 Y113.102 E.00322
G1 X98.532 Y113.272 E.00864
G1 X105.753 Y106.051 E.30429
G1 X105.753 Y106.585 E.0159
G1 X98.841 Y113.497 E.29127
G1 X99.15 Y113.721 E.01138
G1 X105.753 Y107.118 E.27825
G1 X105.753 Y107.651 E.0159
G1 X99.459 Y113.946 E.26523
G3 X99.717 Y114.221 I-.181 J.427 E.01158
G1 X105.753 Y108.185 E.25438
G1 X105.753 Y108.718 E.0159
G1 X99.912 Y114.56 E.24615
G1 X100.107 Y114.898 E.01164
G1 X105.753 Y109.252 E.23792
G1 X105.753 Y109.785 E.0159
G1 X100.302 Y115.236 E.22969
G1 X100.451 Y115.493 E.00885
G1 X100.463 Y115.609 E.00347
G1 X105.753 Y110.319 E.22292
G1 X105.753 Y110.852 E.0159
G1 X100.514 Y116.092 E.22078
G1 X100.565 Y116.574 E.01446
G1 X105.753 Y111.386 E.21865
G1 X105.753 Y111.919 E.0159
G1 X100.615 Y117.057 E.21651
G1 X100.623 Y117.129 E.00216
G1 X100.405 Y117.801 E.02105
G1 X105.753 Y112.453 E.22539
G1 X105.753 Y112.986 E.0159
G1 X87.624 Y131.116 E.76396
G1 X87.624 Y131.649 E.0159
G1 X105.753 Y113.519 E.76396
G1 X105.753 Y114.053 E.0159
G1 X87.624 Y132.182 E.76396
G1 X87.624 Y132.716 E.0159
G1 X105.753 Y114.586 E.76396
G1 X105.753 Y115.12 E.0159
G1 X87.624 Y133.249 E.76396
G1 X87.624 Y133.68 E.01285
G1 X87.726 Y133.68 E.00305
G1 X105.753 Y115.653 E.75965
G1 X105.753 Y116.187 E.0159
G1 X88.259 Y133.68 E.73717
G1 X88.793 Y133.68 E.0159
G1 X105.753 Y116.72 E.71469
G1 X105.753 Y117.254 E.0159
G1 X89.326 Y133.68 E.69221
G1 X89.86 Y133.68 E.0159
G1 X105.753 Y117.787 E.66973
G1 X105.753 Y118.321 E.0159
G1 X90.393 Y133.68 E.64726
G1 X90.927 Y133.68 E.0159
G1 X105.753 Y118.854 E.62478
G1 X105.753 Y119.387 E.0159
G1 X91.46 Y133.68 E.6023
G1 X91.994 Y133.68 E.0159
G1 X105.753 Y119.921 E.57982
G1 X105.753 Y120.454 E.0159
G1 X92.527 Y133.68 E.55734
G1 X93.061 Y133.68 E.0159
G1 X105.753 Y120.988 E.53486
G1 X105.753 Y121.521 E.0159
G1 X93.594 Y133.68 E.51238
G1 X94.127 Y133.68 E.0159
G1 X105.753 Y122.055 E.4899
G1 X105.753 Y122.588 E.0159
G1 X94.661 Y133.68 E.46742
G1 X95.194 Y133.68 E.0159
G1 X105.753 Y123.122 E.44494
G1 X105.753 Y123.655 E.0159
G1 X95.728 Y133.68 E.42246
G1 X96.261 Y133.68 E.0159
G1 X105.753 Y124.189 E.39998
G1 X105.753 Y124.722 E.0159
G1 X96.795 Y133.68 E.3775
G1 X97.328 Y133.68 E.0159
G1 X105.753 Y125.255 E.35502
G1 X105.753 Y125.789 E.0159
G1 X97.862 Y133.68 E.33254
G1 X98.395 Y133.68 E.0159
G1 X105.753 Y126.322 E.31006
G1 X105.753 Y126.856 E.0159
G1 X98.929 Y133.68 E.28759
G1 X99.462 Y133.68 E.0159
G1 X105.753 Y127.389 E.26511
G1 X105.753 Y127.923 E.0159
G1 X99.996 Y133.68 E.24263
G1 X100.529 Y133.68 E.0159
G1 X105.753 Y128.456 E.22015
G1 X105.753 Y128.99 E.0159
G1 X101.062 Y133.68 E.19767
G1 X101.596 Y133.68 E.0159
G1 X105.753 Y129.523 E.17519
G1 X105.753 Y130.057 E.0159
G1 X102.129 Y133.68 E.15271
G1 X102.663 Y133.68 E.0159
G1 X105.753 Y130.59 E.13023
G1 X105.753 Y131.123 E.0159
G1 X103.196 Y133.68 E.10775
G1 X103.73 Y133.68 E.0159
G1 X105.753 Y131.657 E.08527
G1 X105.753 Y132.19 E.0159
G1 X104.263 Y133.68 E.06279
G1 X104.797 Y133.68 E.0159
G1 X105.753 Y132.724 E.04031
G1 X105.753 Y133.257 E.0159
G1 X105.16 Y133.85 E.02498
; WIPE_START
G1 X105.753 Y133.257 E-.31861
G1 X105.753 Y132.724 E-.20271
G1 X105.309 Y133.168 E-.23868
; WIPE_END
G1 E-.04 F1800
G1 X101.979 Y126.3 Z4.1 F15000
G1 X87.291 Y96.014 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.857 Y94.447 Z4.1 F15000
G1 Z3.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.506115
G1 F4800
G1 X104.52 Y94.447 E.5731
G1 X104.52 Y93.984 E.01695
G1 X88.857 Y93.984 E.5731
G1 X88.857 Y94.387 E.01475
G1 X88.437 Y94.867 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X104.94 Y94.867 E.49157
G1 X104.94 Y93.564 E.03882
G1 X88.437 Y93.564 E.49157
G1 X88.437 Y94.807 E.03704
G1 X88.06 Y95.244 F15000
G1 F4800
G1 X105.317 Y95.244 E.51403
G1 X105.317 Y93.187 E.06129
G1 X88.06 Y93.187 E.51403
G1 X88.06 Y95.184 E.0595
G1 X87.683 Y95.622 F15000
G1 F4800
G1 X105.694 Y95.622 E.5365
G1 X105.694 Y92.81 E.08375
G1 X87.683 Y92.81 E.5365
G1 X87.683 Y95.562 E.08196
; WIPE_START
G1 X87.683 Y93.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.248 Y86.813 Z4.1 F15000
G1 X97.355 Y75.252 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X95.937 Y75.252 E.0456
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04835
G1 X95.218 Y68.413 E.04834
G1 X95.465 Y68.36 E.00813
G1 X96.688 Y68.1 E.04022
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04834
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04835
G1 X97.44 Y75.252 E.04834
G1 X97.415 Y75.252 E.00082
M204 S250
G1 X97.355 Y74.86 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03976
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X95.547 Y68.744 E.00505
G1 X96.688 Y68.501 E.03477
M73 P90 R4
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.41 Y74.837 E.03809
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52817
G1 X95.463 Y74.612 E-.23183
; WIPE_END
G1 E-.04 F1800
G1 X91.696 Y81.25 Z4.1 F15000
G1 X87.291 Y89.014 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.257 Y79.779 Z4.1 F15000
G1 X87.454 Y74.786 Z4.1
G1 Z3.7
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4236
G1 F4800
G1 X105.753 Y56.486 E.77821
G1 X105.753 Y55.948 E.01619
G1 X87.624 Y74.078 E.77099
G1 X87.624 Y73.539 E.01619
G1 X105.753 Y55.41 E.77099
G1 X105.753 Y54.871 E.01619
G1 X87.624 Y73.001 E.77099
G1 X87.624 Y72.463 E.01619
G1 X105.753 Y54.333 E.77099
G1 X105.753 Y53.795 E.01619
G1 X87.624 Y71.924 E.77099
G1 X87.624 Y71.386 E.01619
G1 X105.753 Y53.256 E.77099
G1 X105.753 Y52.718 E.01619
G1 X87.624 Y70.848 E.77099
G1 X87.624 Y70.309 E.01619
G1 X105.282 Y52.651 E.75095
G1 X104.744 Y52.651 E.01619
G1 X87.624 Y69.771 E.72805
G1 X87.624 Y69.232 E.01619
G1 X104.205 Y52.651 E.70516
G1 X103.667 Y52.651 E.01619
G1 X87.624 Y68.694 E.68226
G1 X87.624 Y68.156 E.01619
G1 X103.128 Y52.651 E.65937
G1 X102.59 Y52.651 E.01619
G1 X87.624 Y67.617 E.63647
G1 X87.624 Y67.079 E.01619
G1 X102.052 Y52.651 E.61358
G1 X101.513 Y52.651 E.01619
G1 X87.624 Y66.541 E.59068
G1 X87.624 Y66.002 E.01619
G1 X100.975 Y52.651 E.56779
G1 X100.437 Y52.651 E.01619
G1 X87.624 Y65.464 E.5449
G1 X87.624 Y64.926 E.01619
G1 X99.898 Y52.651 E.522
G1 X99.36 Y52.651 E.01619
G1 X87.624 Y64.387 E.49911
G1 X87.624 Y63.849 E.01619
G1 X98.822 Y52.651 E.47621
G1 X98.283 Y52.651 E.01619
G1 X87.624 Y63.31 E.45332
G1 X87.624 Y62.772 E.01619
G1 X97.745 Y52.651 E.43042
G1 X97.206 Y52.651 E.01619
G1 X87.624 Y62.234 E.40753
G1 X87.624 Y61.695 E.01619
G1 X96.668 Y52.651 E.38463
G1 X96.13 Y52.651 E.01619
G1 X87.624 Y61.157 E.36174
G1 X87.624 Y60.619 E.01619
G1 X95.591 Y52.651 E.33884
G1 X95.053 Y52.651 E.01619
G1 X87.624 Y60.08 E.31595
G1 X87.624 Y59.542 E.01619
G1 X94.515 Y52.651 E.29305
G1 X93.976 Y52.651 E.01619
G1 X87.624 Y59.004 E.27016
G1 X87.624 Y58.465 E.01619
G1 X93.438 Y52.651 E.24726
G1 X92.9 Y52.651 E.01619
G1 X87.624 Y57.927 E.22437
G1 X87.624 Y57.388 E.01619
G1 X92.361 Y52.651 E.20147
G1 X91.823 Y52.651 E.01619
G1 X87.624 Y56.85 E.17858
G1 X87.624 Y56.312 E.01619
G1 X91.285 Y52.651 E.15568
G1 X90.746 Y52.651 E.01619
G1 X87.624 Y55.773 E.13279
G1 X87.624 Y55.235 E.01619
G1 X90.208 Y52.651 E.10989
G1 X89.669 Y52.651 E.01619
G1 X87.624 Y54.697 E.087
G1 X87.624 Y54.158 E.01619
G1 X89.131 Y52.651 E.0641
G1 X88.593 Y52.651 E.01619
G1 X87.624 Y53.62 E.04121
G1 X87.624 Y53.082 E.01619
G1 X88.224 Y52.481 E.02553
; WIPE_START
G1 X87.624 Y53.082 E-.32261
G1 X87.624 Y53.62 E-.20458
G1 X88.057 Y53.187 E-.23281
; WIPE_END
G1 E-.04 F1800
G1 X93.994 Y57.984 Z4.1 F15000
G1 X105.923 Y67.622 Z4.1
G1 Z3.7
G1 E.8 F1800
G1 F4800
G1 X100.241 Y73.304 E.24163
G1 X100.5 Y72.507 E.02522
G1 X105.753 Y67.254 E.22339
G1 X105.753 Y66.715 E.01619
G1 X100.596 Y71.873 E.21932
G1 X100.545 Y71.386 E.01473
G1 X105.753 Y66.177 E.2215
G1 X105.753 Y65.639 E.01619
G1 X100.494 Y70.898 E.22368
G1 X100.451 Y70.493 E.01225
G1 X100.418 Y70.436 E.00199
G1 X105.753 Y65.1 E.2269
G1 X105.753 Y64.562 E.01619
G1 X100.221 Y70.094 E.23528
G1 X100.024 Y69.753 E.01185
G1 X105.753 Y64.024 E.24366
G1 X105.753 Y63.485 E.01619
G1 X99.827 Y69.412 E.25204
G1 X99.63 Y69.071 E.01185
M73 P90 R3
G1 X105.753 Y62.947 E.26042
G1 X105.753 Y62.408 E.01619
G1 X99.318 Y68.843 E.27365
G1 X99.007 Y68.617 E.01159
G1 X105.753 Y61.87 E.28691
G1 X105.753 Y61.332 E.01619
G1 X98.695 Y68.39 E.30017
G1 X98.383 Y68.164 E.01159
G1 X105.753 Y60.793 E.31343
G1 X105.753 Y60.255 E.01619
G1 X97.975 Y68.033 E.33078
G1 X97.531 Y67.939 E.01365
G1 X105.753 Y59.717 E.34966
G1 X105.753 Y59.178 E.01619
G1 X97.087 Y67.844 E.36854
G1 X96.688 Y67.76 E.01226
G1 X96.619 Y67.774 E.00214
G1 X105.753 Y58.64 E.38846
G1 X105.753 Y58.102 E.01619
G1 X95.935 Y67.92 E.41753
G1 X95.251 Y68.065 E.02102
G1 X105.753 Y57.563 E.44661
G1 X105.753 Y57.025 E.01619
G1 X87.624 Y75.154 E.77099
G1 X87.624 Y75.693 E.01619
G1 X93.066 Y70.25 E.23146
G1 X92.926 Y70.493 E.00844
G1 X92.875 Y70.98 E.01472
G1 X87.624 Y76.231 E.22331
G1 X87.624 Y76.77 E.01619
G1 X92.812 Y71.582 E.22062
G1 X92.754 Y72.129 E.01656
G1 X92.766 Y72.166 E.00115
G1 X87.624 Y77.308 E.21868
G1 X87.624 Y77.846 E.01619
G1 X92.898 Y72.572 E.22429
G1 X93.03 Y72.978 E.01285
G1 X87.624 Y78.385 E.22991
G1 X87.624 Y78.923 E.01619
G1 X93.162 Y73.385 E.23552
G1 X93.262 Y73.694 E.00977
G1 X93.323 Y73.762 E.00274
G1 X87.624 Y79.461 E.24239
G1 X87.624 Y80 E.01619
G1 X93.579 Y74.045 E.25324
G1 X93.834 Y74.328 E.01146
G1 X87.624 Y80.538 E.26409
G1 X87.624 Y81.076 E.01619
G1 X94.089 Y74.611 E.27493
G1 X94.344 Y74.895 E.01146
G1 X87.624 Y81.615 E.28578
G1 X87.624 Y82.153 E.01619
G1 X94.707 Y75.07 E.30124
G1 X95.08 Y75.235 E.01226
G1 X87.624 Y82.691 E.31709
G1 X87.624 Y83.23 E.01619
G1 X95.452 Y75.401 E.33293
G1 X95.825 Y75.567 E.01226
G1 X87.624 Y83.768 E.34877
G1 X87.624 Y84.307 E.01619
G1 X96.345 Y75.585 E.37089
G1 X96.883 Y75.585 E.01619
G1 X87.624 Y84.845 E.39378
G1 X87.624 Y85.383 E.01619
G1 X97.422 Y75.585 E.41668
G1 X97.511 Y75.585 E.00269
G1 X98.32 Y75.225 E.02664
G1 X87.624 Y85.922 E.45489
G1 X87.624 Y86.46 E.01619
G1 X105.753 Y68.33 E.77099
G1 X105.753 Y68.869 E.01619
G1 X87.624 Y86.998 E.77099
G1 X87.624 Y87.537 E.01619
G1 X105.753 Y69.407 E.77099
G1 X105.753 Y69.946 E.01619
G1 X87.624 Y88.075 E.77099
G1 X87.624 Y88.613 E.01619
G1 X105.753 Y70.484 E.77099
G1 X105.753 Y71.022 E.01619
G1 X88.095 Y88.68 E.75095
G1 X88.633 Y88.68 E.01619
G1 X105.753 Y71.561 E.72805
G1 X105.753 Y72.099 E.01619
G1 X89.172 Y88.68 E.70516
G1 X89.71 Y88.68 E.01619
G1 X105.753 Y72.637 E.68226
G1 X105.753 Y73.176 E.01619
G1 X90.249 Y88.68 E.65937
G1 X90.787 Y88.68 E.01619
G1 X105.753 Y73.714 E.63647
G1 X105.753 Y74.252 E.01619
G1 X91.325 Y88.68 E.61358
G1 X91.864 Y88.68 E.01619
G1 X105.753 Y74.791 E.59068
G1 X105.753 Y75.329 E.01619
G1 X92.402 Y88.68 E.56779
G1 X92.94 Y88.68 E.01619
G1 X105.753 Y75.868 E.54489
G1 X105.753 Y76.406 E.01619
G1 X93.479 Y88.68 E.522
G1 X94.017 Y88.68 E.01619
G1 X105.753 Y76.944 E.4991
G1 X105.753 Y77.483 E.01619
G1 X94.555 Y88.68 E.47621
G1 X95.094 Y88.68 E.01619
G1 X105.753 Y78.021 E.45331
G1 X105.753 Y78.559 E.01619
G1 X95.632 Y88.68 E.43042
G1 X96.171 Y88.68 E.01619
G1 X105.753 Y79.098 E.40752
G1 X105.753 Y79.636 E.01619
G1 X96.709 Y88.68 E.38463
G1 X97.247 Y88.68 E.01619
G1 X105.753 Y80.174 E.36173
G1 X105.753 Y80.713 E.01619
G1 X97.786 Y88.68 E.33884
G1 X98.324 Y88.68 E.01619
G1 X105.753 Y81.251 E.31594
G1 X105.753 Y81.79 E.01619
G1 X98.862 Y88.68 E.29305
G1 X99.401 Y88.68 E.01619
G1 X105.753 Y82.328 E.27015
G1 X105.753 Y82.866 E.01619
G1 X99.939 Y88.68 E.24726
G1 X100.477 Y88.68 E.01619
G1 X105.753 Y83.405 E.22436
G1 X105.753 Y83.943 E.01619
G1 X101.016 Y88.68 E.20147
G1 X101.554 Y88.68 E.01619
G1 X105.753 Y84.481 E.17857
G1 X105.753 Y85.02 E.01619
G1 X102.093 Y88.68 E.15568
G1 X102.631 Y88.68 E.01619
G1 X105.753 Y85.558 E.13278
G1 X105.753 Y86.096 E.01619
G1 X103.169 Y88.68 E.10989
G1 X103.708 Y88.68 E.01619
G1 X105.753 Y86.635 E.08699
G1 X105.753 Y87.173 E.01619
G1 X104.246 Y88.68 E.0641
G1 X104.784 Y88.68 E.01619
G1 X105.753 Y87.712 E.04121
G1 X105.753 Y88.25 E.01619
G1 X105.153 Y88.85 E.02553
; CHANGE_LAYER
; Z_HEIGHT: 3.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4800
G1 X105.753 Y88.25 E-.32256
M73 P91 R3
G1 X105.753 Y87.712 E-.20458
G1 X105.32 Y88.145 E-.23286
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 19/20
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
G17
G3 Z4.1 I1.217 J0 P1  F15000
; object ids of layer 19 start: 178
M624 AgAAAAAAAAA=
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
; object ids of this layer19 end: 178
M625
; OBJECT_ID: 178
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X98.871 Y164.577
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.814 Y164.641 E.00276
G1 X97.44 Y165.252 E.04834
G1 X95.937 Y165.252 E.04835
G1 X94.563 Y164.641 E.04834
G1 X93.557 Y163.523 E.04835
G1 X93.093 Y162.094 E.04834
G1 X93.25 Y160.598 E.04834
G1 X94.002 Y159.296 E.04834
G1 X95.218 Y158.413 E.04835
G1 X95.404 Y158.373 E.00612
G1 X96.688 Y158.1 E.04222
G1 X98.159 Y158.413 E.04834
G1 X99.375 Y159.296 E.04835
G1 X100.127 Y160.598 E.04834
G1 X100.284 Y162.094 E.04834
G1 X99.82 Y163.523 E.04834
G1 X98.911 Y164.532 E.04366
M204 S250
G1 X98.576 Y164.317 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y164.86 E.03974
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.299 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X95.486 Y158.757 E.00319
G1 X96.688 Y158.501 E.03663
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.617 Y164.274 E.0381
; WIPE_START
M204 S5000
G1 X97.357 Y164.86 E-.52801
G1 X96.746 Y164.86 E-.23199
; WIPE_END
G1 E-.04 F1800
G1 X93.542 Y157.933 Z4.3 F15000
G1 X87.291 Y144.418 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y144.418 E.60441
G1 X106.086 Y181.114 E1.18001
G1 X87.291 Y181.114 E.60441
G1 X87.291 Y144.478 E1.17808
M204 S250
G1 X86.898 Y144.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.454 Y147.34 Z4.3 F15000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4236
G1 F4800
G1 X98.193 Y158.079 E.45671
G1 X97.51 Y157.934 E.02102
G1 X87.624 Y148.048 E.42042
G1 X87.624 Y148.586 E.01619
G1 X96.826 Y157.789 E.39135
G1 X96.688 Y157.76 E.00423
G1 X96.334 Y157.835 E.0109
G1 X87.624 Y149.125 E.37042
G1 X87.624 Y149.663 E.01619
G1 X95.89 Y157.929 E.35153
G1 X95.446 Y158.024 E.01365
G1 X87.624 Y150.202 E.33265
G1 X87.624 Y150.74 E.01619
G1 X95.025 Y158.141 E.31475
G1 X94.713 Y158.368 E.01159
G1 X87.624 Y151.278 E.30149
G1 X87.624 Y151.817 E.01619
G1 X94.401 Y158.594 E.28823
G1 X94.09 Y158.821 E.01159
G1 X87.624 Y152.355 E.27497
G1 X87.624 Y152.893 E.01619
G1 X93.778 Y159.047 E.26171
G1 X93.749 Y159.069 E.00109
G1 X93.57 Y159.378 E.01074
G1 X87.624 Y153.432 E.25287
G1 X87.624 Y153.97 E.01619
G1 X93.373 Y159.719 E.24449
G1 X93.176 Y160.061 E.01185
G1 X87.624 Y154.508 E.23611
G1 X87.624 Y155.047 E.01619
G1 X92.979 Y160.402 E.22773
G1 X92.926 Y160.493 E.00317
G1 X92.888 Y160.85 E.01079
G1 X87.624 Y155.585 E.22389
G1 X87.624 Y156.123 E.01619
G1 X92.837 Y161.337 E.22172
G1 X92.786 Y161.824 E.01473
G1 X87.624 Y156.662 E.21954
G1 X87.624 Y157.2 E.01619
G1 X92.851 Y162.427 E.2223
G1 X93.11 Y163.225 E.02522
G1 X87.624 Y157.739 E.23332
G1 X87.624 Y158.277 E.01619
G1 X105.753 Y176.407 E.77099
G1 X105.753 Y175.868 E.01619
G1 X95.153 Y165.268 E.45079
G1 X95.866 Y165.585 E.02346
G1 X96.009 Y165.585 E.0043
G1 X105.753 Y175.33 E.4144
G1 X105.753 Y174.791 E.01619
G1 X96.547 Y165.585 E.3915
G1 X97.086 Y165.585 E.01619
G1 X105.753 Y174.253 E.36861
G1 X105.753 Y173.715 E.01619
G1 X97.589 Y165.551 E.34719
G1 X97.962 Y165.385 E.01226
G1 X105.753 Y173.176 E.33135
G1 X105.753 Y172.638 E.01619
G1 X98.334 Y165.219 E.31551
G1 X98.707 Y165.053 E.01226
G1 X105.753 Y172.1 E.29967
G1 X105.753 Y171.561 E.01619
G1 X99.059 Y164.867 E.2847
G1 X99.314 Y164.583 E.01146
G1 X105.753 Y171.023 E.27386
G1 X105.753 Y170.485 E.01619
G1 X99.569 Y164.3 E.26301
G1 X99.824 Y164.017 E.01146
G1 X105.753 Y169.946 E.25216
G1 X105.753 Y169.408 E.01619
G1 X100.079 Y163.733 E.24131
G1 X100.115 Y163.694 E.0016
G1 X100.228 Y163.344 E.01105
G1 X105.753 Y168.869 E.23497
G1 X105.753 Y168.331 E.01619
G1 X100.36 Y162.938 E.22935
G1 X100.492 Y162.532 E.01285
G1 X105.753 Y167.793 E.22374
G1 X105.753 Y167.254 E.01619
G1 X100.622 Y162.123 E.2182
G1 X100.559 Y161.522 E.01819
G1 X105.753 Y166.716 E.22089
G1 X105.753 Y166.178 E.01619
G1 X100.496 Y160.92 E.22358
G1 X100.451 Y160.493 E.01291
G1 X100.238 Y160.124 E.01284
G1 X105.753 Y165.639 E.23457
G1 X105.753 Y165.101 E.01619
G1 X87.624 Y146.971 E.77099
G1 X87.624 Y146.433 E.01619
G1 X105.753 Y164.563 E.77099
G1 X105.753 Y164.024 E.01619
G1 X87.624 Y145.895 E.77099
G1 X87.624 Y145.356 E.01619
G1 X105.753 Y163.486 E.77099
G1 X105.753 Y162.947 E.01619
G1 X87.624 Y144.818 E.77099
G1 X87.624 Y144.751 E.00201
G1 X88.095 Y144.751 E.01418
G1 X105.753 Y162.409 E.75095
G1 X105.753 Y161.871 E.01619
G1 X88.633 Y144.751 E.72805
G1 X89.172 Y144.751 E.01619
G1 X105.753 Y161.332 E.70516
G1 X105.753 Y160.794 E.01619
G1 X89.71 Y144.751 E.68226
G1 X90.249 Y144.751 E.01619
G1 X105.753 Y160.256 E.65937
G1 X105.753 Y159.717 E.01619
G1 X90.787 Y144.751 E.63647
G1 X91.325 Y144.751 E.01619
G1 X105.753 Y159.179 E.61358
G1 X105.753 Y158.641 E.01619
G1 X91.864 Y144.751 E.59068
G1 X92.402 Y144.751 E.01619
G1 X105.753 Y158.102 E.56779
G1 X105.753 Y157.564 E.01619
G1 X92.94 Y144.751 E.54489
G1 X93.479 Y144.751 E.01619
G1 X105.753 Y157.025 E.522
G1 X105.753 Y156.487 E.01619
G1 X94.017 Y144.751 E.4991
G1 X94.555 Y144.751 E.01619
G1 X105.753 Y155.949 E.47621
G1 X105.753 Y155.41 E.01619
G1 X95.094 Y144.751 E.45331
G1 X95.632 Y144.751 E.01619
G1 X105.753 Y154.872 E.43042
G1 X105.753 Y154.334 E.01619
G1 X96.171 Y144.751 E.40752
G1 X96.709 Y144.751 E.01619
G1 X105.753 Y153.795 E.38463
G1 X105.753 Y153.257 E.01619
G1 X97.247 Y144.751 E.36173
G1 X97.786 Y144.751 E.01619
G1 X105.753 Y152.719 E.33884
G1 X105.753 Y152.18 E.01619
G1 X98.324 Y144.751 E.31594
G1 X98.862 Y144.751 E.01619
G1 X105.753 Y151.642 E.29305
G1 X105.753 Y151.103 E.01619
G1 X99.401 Y144.751 E.27015
G1 X99.939 Y144.751 E.01619
G1 X105.753 Y150.565 E.24726
G1 X105.753 Y150.027 E.01619
G1 X100.477 Y144.751 E.22436
G1 X101.016 Y144.751 E.01619
G1 X105.753 Y149.488 E.20147
G1 X105.753 Y148.95 E.01619
G1 X101.554 Y144.751 E.17857
G1 X102.093 Y144.751 E.01619
G1 X105.753 Y148.412 E.15568
G1 X105.753 Y147.873 E.01619
G1 X102.631 Y144.751 E.13278
G1 X103.169 Y144.751 E.01619
G1 X105.753 Y147.335 E.10989
G1 X105.753 Y146.797 E.01619
G1 X103.708 Y144.751 E.08699
G1 X104.246 Y144.751 E.01619
G1 X105.753 Y146.258 E.0641
G1 X105.753 Y145.72 E.01619
G1 X104.784 Y144.751 E.04121
G1 X105.323 Y144.751 E.01619
G1 X105.923 Y145.351 E.02553
; WIPE_START
G1 X105.323 Y144.751 E-.32257
G1 X104.784 Y144.751 E-.20458
G1 X105.218 Y145.184 E-.23285
; WIPE_END
G1 E-.04 F1800
G1 X105.386 Y152.815 Z4.3 F15000
G1 X105.923 Y177.115 Z4.3
G1 Z3.9
G1 E.8 F1800
G1 F4800
G1 X87.624 Y158.815 E.77821
G1 X87.624 Y159.354 E.01619
G1 X105.753 Y177.483 E.77099
G1 X105.753 Y178.022 E.01619
G1 X87.624 Y159.892 E.77099
G1 X87.624 Y160.43 E.01619
G1 X105.753 Y178.56 E.77099
G1 X105.753 Y179.098 E.01619
G1 X87.624 Y160.969 E.77099
G1 X87.624 Y161.507 E.01619
G1 X105.753 Y179.637 E.77099
G1 X105.753 Y180.175 E.01619
G1 X87.624 Y162.045 E.77099
G1 X87.624 Y162.584 E.01619
G1 X105.753 Y180.713 E.77099
G1 X105.753 Y180.78 E.00202
G1 X105.282 Y180.78 E.01417
G1 X87.624 Y163.122 E.75095
G1 X87.624 Y163.661 E.01619
G1 X104.744 Y180.78 E.72805
G1 X104.205 Y180.78 E.01619
G1 X87.624 Y164.199 E.70516
G1 X87.624 Y164.737 E.01619
G1 X103.667 Y180.78 E.68226
G1 X103.128 Y180.78 E.01619
G1 X87.624 Y165.276 E.65937
G1 X87.624 Y165.814 E.01619
G1 X102.59 Y180.78 E.63647
G1 X102.052 Y180.78 E.01619
G1 X87.624 Y166.352 E.61358
G1 X87.624 Y166.891 E.01619
G1 X101.513 Y180.78 E.59068
G1 X100.975 Y180.78 E.01619
G1 X87.624 Y167.429 E.56779
G1 X87.624 Y167.967 E.01619
G1 X100.437 Y180.78 E.5449
G1 X99.898 Y180.78 E.01619
G1 X87.624 Y168.506 E.522
G1 X87.624 Y169.044 E.01619
G1 X99.36 Y180.78 E.49911
G1 X98.822 Y180.78 E.01619
G1 X87.624 Y169.583 E.47621
G1 X87.624 Y170.121 E.01619
G1 X98.283 Y180.78 E.45332
G1 X97.745 Y180.78 E.01619
G1 X87.624 Y170.659 E.43042
G1 X87.624 Y171.198 E.01619
G1 X97.207 Y180.78 E.40753
G1 X96.668 Y180.78 E.01619
G1 X87.624 Y171.736 E.38463
G1 X87.624 Y172.274 E.01619
G1 X96.13 Y180.78 E.36174
G1 X95.591 Y180.78 E.01619
G1 X87.624 Y172.813 E.33884
G1 X87.624 Y173.351 E.01619
G1 X95.053 Y180.78 E.31595
G1 X94.515 Y180.78 E.01619
G1 X87.624 Y173.889 E.29305
G1 X87.624 Y174.428 E.01619
G1 X93.976 Y180.78 E.27016
G1 X93.438 Y180.78 E.01619
G1 X87.624 Y174.966 E.24726
G1 X87.624 Y175.505 E.01619
G1 X92.9 Y180.78 E.22437
G1 X92.361 Y180.78 E.01619
G1 X87.624 Y176.043 E.20147
G1 X87.624 Y176.581 E.01619
G1 X91.823 Y180.78 E.17858
M73 P92 R3
G1 X91.285 Y180.78 E.01619
G1 X87.624 Y177.12 E.15568
G1 X87.624 Y177.658 E.01619
G1 X90.746 Y180.78 E.13279
G1 X90.208 Y180.78 E.01619
G1 X87.624 Y178.196 E.10989
G1 X87.624 Y178.735 E.01619
G1 X89.669 Y180.78 E.087
G1 X89.131 Y180.78 E.01619
G1 X87.624 Y179.273 E.0641
G1 X87.624 Y179.811 E.01619
G1 X88.593 Y180.78 E.04121
G1 X88.054 Y180.78 E.01619
G1 X87.454 Y180.18 E.02553
; WIPE_START
G1 X88.054 Y180.78 E-.32261
G1 X88.593 Y180.78 E-.20458
G1 X88.159 Y180.347 E-.23281
; WIPE_END
G1 E-.04 F1800
G1 X91.325 Y173.402 Z4.3 F15000
G1 X106.086 Y141.014 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y141.014 E.60441
G1 X87.291 Y137.418 E.11563
G1 X106.086 Y137.418 E.60441
G1 X106.086 Y140.954 E.1137
M204 S250
G1 X106.478 Y141.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
; WIPE_START
M204 S5000
G1 X104.478 Y141.352 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.932 Y140.208 Z4.3 F15000
G1 X88.857 Y138.984 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50611
G1 F4800
G1 X88.857 Y139.447 E.01695
G1 X104.52 Y139.447 E.5731
G1 X104.52 Y138.984 E.01695
G1 X88.917 Y138.984 E.5709
G1 X88.437 Y138.564 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X88.437 Y139.867 E.03882
G1 X104.94 Y139.867 E.49157
G1 X104.94 Y138.564 E.03882
G1 X88.497 Y138.564 E.48978
G1 X88.06 Y138.187 F15000
G1 F4800
G1 X88.06 Y140.244 E.06129
G1 X105.317 Y140.244 E.51403
G1 X105.317 Y138.187 E.06129
G1 X88.12 Y138.187 E.51225
G1 X87.683 Y137.81 F15000
G1 F4800
G1 X87.683 Y140.622 E.08375
G1 X105.694 Y140.622 E.5365
G1 X105.694 Y137.81 E.08375
G1 X87.743 Y137.81 E.53471
; WIPE_START
G1 X89.743 Y137.81 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.655 Y130.755 Z4.3 F15000
G1 X99.418 Y114.371 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X100.127 Y115.598 E.04559
G1 X100.284 Y117.094 E.04834
G1 X99.82 Y118.523 E.04834
G1 X98.814 Y119.641 E.04835
G1 X97.44 Y120.252 E.04834
G1 X95.937 Y120.252 E.04835
G1 X94.563 Y119.641 E.04834
G1 X93.557 Y118.523 E.04835
G1 X93.093 Y117.094 E.04834
G1 X93.25 Y115.598 E.04834
G1 X94.002 Y114.296 E.04834
G1 X95.218 Y113.413 E.04834
G1 X95.404 Y113.373 E.00612
G1 X96.688 Y113.1 E.04222
G1 X98.159 Y113.413 E.04834
G1 X99.375 Y114.296 E.04834
G1 X99.388 Y114.319 E.00083
M204 S250
G1 X99.075 Y114.563 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X99.077 Y114.565 E.00007
G1 X99.746 Y115.722 E.03982
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.299 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X95.486 Y113.757 E.00319
G1 X96.688 Y113.501 E.03663
G1 X97.996 Y113.779 E.03982
G1 X99.027 Y114.528 E.03796
; WIPE_START
M204 S5000
G1 X99.077 Y114.565 E-.02374
G1 X99.746 Y115.722 E-.50796
G1 X99.809 Y116.32 E-.22831
; WIPE_END
G1 E-.04 F1800
G1 X95.266 Y110.186 Z4.3 F15000
G1 X87.291 Y99.418 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X106.086 Y99.418 E.60441
G1 X106.086 Y134.014 E1.11248
G1 X87.291 Y134.014 E.60441
G1 X87.291 Y99.478 E1.11055
M204 S250
G1 X86.898 Y99.026 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.454 Y102.146 Z4.3 F15000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42013
G1 F4800
G1 X98.707 Y113.399 E.47418
G1 X98.298 Y113.102 E.01507
G1 X97.762 Y112.988 E.01631
G1 X87.624 Y102.849 E.42723
G1 X87.624 Y103.383 E.0159
G1 X97.085 Y112.844 E.39868
G1 X96.688 Y112.76 E.01207
G1 X96.506 Y112.798 E.00556
G1 X87.624 Y103.916 E.37429
G1 X87.624 Y104.45 E.0159
G1 X96.066 Y112.892 E.35575
G1 X95.626 Y112.985 E.0134
G1 X87.624 Y104.983 E.33721
G1 X87.624 Y105.517 E.0159
G1 X95.186 Y113.079 E.31867
G1 X95.079 Y113.102 E.00325
G1 X94.845 Y113.272 E.00862
G1 X87.624 Y106.05 E.30431
G1 X87.624 Y106.583 E.0159
G1 X94.536 Y113.496 E.29129
G1 X94.227 Y113.721 E.01138
G1 X87.624 Y107.117 E.27827
G1 X87.624 Y107.65 E.0159
G1 X93.918 Y113.945 E.26525
G1 X93.749 Y114.069 E.00626
G1 X93.661 Y114.221 E.00524
G1 X87.624 Y108.184 E.25439
G1 X87.624 Y108.717 E.0159
G1 X93.465 Y114.559 E.24616
G1 X93.27 Y114.897 E.01164
G1 X87.624 Y109.251 E.23793
G1 X87.624 Y109.784 E.0159
G1 X93.075 Y115.235 E.22971
G1 X92.926 Y115.493 E.00887
G1 X92.914 Y115.608 E.00344
G1 X87.624 Y110.318 E.22293
G1 X87.624 Y110.851 E.0159
G1 X92.863 Y116.091 E.22079
G1 X92.812 Y116.573 E.01446
G1 X87.624 Y111.385 E.21865
G1 X87.624 Y111.918 E.0159
G1 X92.762 Y117.056 E.21651
G1 X92.754 Y117.129 E.00219
G1 X92.972 Y117.8 E.02101
G1 X87.624 Y112.451 E.22537
G1 X87.624 Y112.985 E.0159
G1 X105.753 Y131.115 E.76396
G1 X105.753 Y130.581 E.0159
G1 X95.671 Y120.498 E.42487
G1 X95.866 Y120.585 E.00637
G1 X96.291 Y120.585 E.01267
G1 X105.753 Y130.048 E.39873
G1 X105.753 Y129.514 E.0159
G1 X96.824 Y120.585 E.37625
G1 X97.358 Y120.585 E.0159
G1 X105.753 Y128.981 E.35377
G1 X105.753 Y128.447 E.0159
G1 X97.774 Y120.468 E.33623
G1 X98.143 Y120.304 E.01204
G1 X105.753 Y127.914 E.32068
G1 X105.753 Y127.38 E.0159
G1 X98.512 Y120.14 E.30512
G1 X98.882 Y119.975 E.01204
G1 X105.753 Y126.847 E.28957
G1 X105.753 Y126.313 E.0159
G1 X99.176 Y119.736 E.27716
G1 X99.429 Y119.455 E.01125
G1 X105.753 Y125.78 E.26651
G1 X105.753 Y125.247 E.0159
G1 X99.681 Y119.175 E.25586
G1 X99.934 Y118.894 E.01126
G1 X105.753 Y124.713 E.24521
G1 X105.753 Y124.18 E.0159
G1 X100.152 Y118.578 E.23603
G1 X100.283 Y118.176 E.01261
G1 X105.753 Y123.646 E.23052
G1 X105.753 Y123.113 E.0159
G1 X100.414 Y117.773 E.225
G1 X100.545 Y117.371 E.01261
G1 X105.753 Y122.579 E.21949
G1 X105.753 Y122.046 E.0159
G1 X100.598 Y116.89 E.21725
G1 X100.535 Y116.294 E.01786
G1 X105.753 Y121.512 E.21989
G1 X105.753 Y120.979 E.0159
G1 X100.473 Y115.698 E.22253
G1 X100.451 Y115.493 E.00614
G1 X99.973 Y114.665 E.0285
G1 X105.753 Y120.445 E.24359
G1 X105.753 Y119.912 E.0159
G1 X87.624 Y101.782 E.76396
G1 X87.624 Y101.249 E.0159
G1 X105.753 Y119.378 E.76396
G1 X105.753 Y118.845 E.0159
G1 X87.624 Y100.715 E.76396
G1 X87.624 Y100.182 E.0159
G1 X105.753 Y118.312 E.76396
G1 X105.753 Y117.778 E.0159
G1 X87.726 Y99.751 E.75965
G1 X88.259 Y99.751 E.0159
G1 X105.753 Y117.245 E.73717
G1 X105.753 Y116.711 E.0159
G1 X88.793 Y99.751 E.71469
G1 X89.326 Y99.751 E.0159
G1 X105.753 Y116.178 E.69221
G1 X105.753 Y115.644 E.0159
G1 X89.86 Y99.751 E.66973
G1 X90.393 Y99.751 E.0159
G1 X105.753 Y115.111 E.64725
G1 X105.753 Y114.577 E.0159
G1 X90.927 Y99.751 E.62478
G1 X91.46 Y99.751 E.0159
G1 X105.753 Y114.044 E.6023
G1 X105.753 Y113.51 E.0159
G1 X91.994 Y99.751 E.57982
G1 X92.527 Y99.751 E.0159
G1 X105.753 Y112.977 E.55734
G1 X105.753 Y112.444 E.0159
G1 X93.061 Y99.751 E.53486
G1 X93.594 Y99.751 E.0159
G1 X105.753 Y111.91 E.51238
G1 X105.753 Y111.377 E.0159
G1 X94.128 Y99.751 E.4899
G1 X94.661 Y99.751 E.0159
G1 X105.753 Y110.843 E.46742
G1 X105.753 Y110.31 E.0159
G1 X95.194 Y99.751 E.44494
G1 X95.728 Y99.751 E.0159
G1 X105.753 Y109.776 E.42246
G1 X105.753 Y109.243 E.0159
G1 X96.261 Y99.751 E.39998
G1 X96.795 Y99.751 E.0159
G1 X105.753 Y108.709 E.3775
G1 X105.753 Y108.176 E.0159
G1 X97.328 Y99.751 E.35502
G1 X97.862 Y99.751 E.0159
G1 X105.753 Y107.642 E.33254
G1 X105.753 Y107.109 E.0159
G1 X98.395 Y99.751 E.31006
G1 X98.929 Y99.751 E.0159
G1 X105.753 Y106.576 E.28759
G1 X105.753 Y106.042 E.0159
G1 X99.462 Y99.751 E.26511
G1 X99.996 Y99.751 E.0159
G1 X105.753 Y105.509 E.24263
G1 X105.753 Y104.975 E.0159
G1 X100.529 Y99.751 E.22015
G1 X101.062 Y99.751 E.0159
G1 X105.753 Y104.442 E.19767
G1 X105.753 Y103.908 E.0159
G1 X101.596 Y99.751 E.17519
G1 X102.129 Y99.751 E.0159
G1 X105.753 Y103.375 E.15271
G1 X105.753 Y102.841 E.0159
G1 X102.663 Y99.751 E.13023
G1 X103.196 Y99.751 E.0159
G1 X105.753 Y102.308 E.10775
M73 P92 R2
G1 X105.753 Y101.774 E.0159
G1 X103.73 Y99.751 E.08527
G1 X104.263 Y99.751 E.0159
G1 X105.753 Y101.241 E.06279
G1 X105.753 Y100.708 E.0159
G1 X104.797 Y99.751 E.04031
G1 X105.33 Y99.751 E.0159
G1 X105.923 Y100.344 E.02498
; WIPE_START
G1 X105.33 Y99.751 E-.31861
G1 X104.797 Y99.751 E-.20271
G1 X105.241 Y100.195 E-.23868
; WIPE_END
G1 E-.04 F1800
G1 X105.405 Y107.826 Z4.3 F15000
G1 X105.923 Y131.818 Z4.3
G1 Z3.9
G1 E.8 F1800
G1 F4800
G1 X87.624 Y113.518 E.77111
G1 X87.624 Y114.052 E.0159
M73 P93 R2
G1 X105.753 Y132.181 E.76396
G1 X105.753 Y132.715 E.0159
G1 X87.624 Y114.585 E.76396
G1 X87.624 Y115.119 E.0159
G1 X105.753 Y133.248 E.76396
G1 X105.753 Y133.68 E.01288
G1 X105.652 Y133.68 E.00302
G1 X87.624 Y115.652 E.75969
G1 X87.624 Y116.186 E.0159
G1 X105.118 Y133.68 E.73722
G1 X104.585 Y133.68 E.0159
G1 X87.624 Y116.719 E.71474
G1 X87.624 Y117.253 E.0159
G1 X104.052 Y133.68 E.69226
G1 X103.518 Y133.68 E.0159
G1 X87.624 Y117.786 E.66978
G1 X87.624 Y118.32 E.0159
G1 X102.985 Y133.68 E.6473
G1 X102.451 Y133.68 E.0159
G1 X87.624 Y118.853 E.62482
G1 X87.624 Y119.386 E.0159
G1 X101.918 Y133.68 E.60234
G1 X101.384 Y133.68 E.0159
G1 X87.624 Y119.92 E.57986
G1 X87.624 Y120.453 E.0159
G1 X100.851 Y133.68 E.55738
G1 X100.317 Y133.68 E.0159
G1 X87.624 Y120.987 E.5349
G1 X87.624 Y121.52 E.0159
G1 X99.784 Y133.68 E.51242
G1 X99.25 Y133.68 E.0159
G1 X87.624 Y122.054 E.48994
G1 X87.624 Y122.587 E.0159
G1 X98.717 Y133.68 E.46746
G1 X98.184 Y133.68 E.0159
G1 X87.624 Y123.121 E.44498
G1 X87.624 Y123.654 E.0159
G1 X97.65 Y133.68 E.4225
G1 X97.117 Y133.68 E.0159
G1 X87.624 Y124.188 E.40002
G1 X87.624 Y124.721 E.0159
G1 X96.583 Y133.68 E.37755
G1 X96.05 Y133.68 E.0159
G1 X87.624 Y125.254 E.35507
G1 X87.624 Y125.788 E.0159
G1 X95.516 Y133.68 E.33259
G1 X94.983 Y133.68 E.0159
G1 X87.624 Y126.321 E.31011
G1 X87.624 Y126.855 E.0159
G1 X94.449 Y133.68 E.28763
G1 X93.916 Y133.68 E.0159
G1 X87.624 Y127.388 E.26515
G1 X87.624 Y127.922 E.0159
G1 X93.382 Y133.68 E.24267
G1 X92.849 Y133.68 E.0159
G1 X87.624 Y128.455 E.22019
G1 X87.624 Y128.989 E.0159
G1 X92.316 Y133.68 E.19771
G1 X91.782 Y133.68 E.0159
G1 X87.624 Y129.522 E.17523
G1 X87.624 Y130.056 E.0159
G1 X91.249 Y133.68 E.15275
G1 X90.715 Y133.68 E.0159
G1 X87.624 Y130.589 E.13027
G1 X87.624 Y131.122 E.0159
G1 X90.182 Y133.68 E.10779
G1 X89.648 Y133.68 E.0159
G1 X87.624 Y131.656 E.08531
G1 X87.624 Y132.189 E.0159
G1 X89.115 Y133.68 E.06283
G1 X88.581 Y133.68 E.0159
G1 X87.624 Y132.723 E.04035
G1 X87.624 Y133.256 E.0159
G1 X88.218 Y133.85 E.02503
; WIPE_START
G1 X87.624 Y133.256 E-.31915
G1 X87.624 Y132.723 E-.20271
G1 X88.067 Y133.166 E-.23814
; WIPE_END
G1 E-.04 F1800
G1 X87.907 Y125.535 Z4.3 F15000
G1 X87.291 Y96.014 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y92.418 E.11563
G1 X106.086 Y92.418 E.60441
G1 X106.086 Y96.014 E.11563
G1 X87.351 Y96.014 E.60248
M204 S250
G1 X86.898 Y96.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.857 Y94.447 Z4.3 F15000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.506115
G1 F4800
G1 X104.52 Y94.447 E.5731
G1 X104.52 Y93.984 E.01695
G1 X88.857 Y93.984 E.5731
G1 X88.857 Y94.387 E.01475
G1 X88.437 Y94.867 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X104.94 Y94.867 E.49157
G1 X104.94 Y93.564 E.03882
G1 X88.437 Y93.564 E.49157
G1 X88.437 Y94.807 E.03704
G1 X88.06 Y95.244 F15000
G1 F4800
G1 X105.317 Y95.244 E.51403
G1 X105.317 Y93.187 E.06129
G1 X88.06 Y93.187 E.51403
G1 X88.06 Y95.184 E.0595
G1 X87.683 Y95.622 F15000
G1 F4800
G1 X105.694 Y95.622 E.5365
G1 X105.694 Y92.81 E.08375
G1 X87.683 Y92.81 E.5365
G1 X87.683 Y95.562 E.08196
; WIPE_START
G1 X87.683 Y93.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.248 Y86.813 Z4.3 F15000
G1 X97.354 Y75.252 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X95.937 Y75.252 E.04559
G1 X94.563 Y74.641 E.04834
G1 X93.557 Y73.523 E.04835
G1 X93.093 Y72.094 E.04834
G1 X93.25 Y70.598 E.04834
G1 X94.002 Y69.296 E.04834
G1 X95.218 Y68.413 E.04834
G1 X95.404 Y68.373 E.00612
G1 X96.688 Y68.1 E.04222
G1 X98.159 Y68.413 E.04834
G1 X99.375 Y69.296 E.04834
G1 X100.127 Y70.598 E.04834
G1 X100.284 Y72.094 E.04834
G1 X99.82 Y73.523 E.04834
G1 X98.814 Y74.641 E.04834
G1 X97.44 Y75.252 E.04834
G1 X97.414 Y75.252 E.00083
M204 S250
G1 X97.359 Y74.859 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.357 Y74.86 E.00007
G1 X96.02 Y74.86 E.03982
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.299 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X95.486 Y68.757 E.00319
G1 X96.688 Y68.501 E.03663
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.414 Y74.835 E.03796
; WIPE_START
M204 S5000
G1 X97.357 Y74.86 E-.02373
G1 X96.02 Y74.86 E-.50797
G1 X95.471 Y74.616 E-.2283
; WIPE_END
G1 E-.04 F1800
G1 X91.701 Y81.252 Z4.3 F15000
G1 X87.291 Y89.014 Z4.3
G1 Z3.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.291 Y52.318 E1.18001
G1 X106.086 Y52.318 E.60441
G1 X106.086 Y89.014 E1.18001
G1 X87.351 Y89.014 E.60248
M204 S250
G1 X86.898 Y89.406 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.454 Y88.08 Z4.3 F15000
G1 Z3.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4236
G1 F4800
G1 X88.054 Y88.68 E.02553
G1 X88.593 Y88.68 E.01619
G1 X87.624 Y87.711 E.04121
G1 X87.624 Y87.173 E.01619
G1 X89.131 Y88.68 E.0641
G1 X89.669 Y88.68 E.01619
G1 X87.624 Y86.635 E.087
G1 X87.624 Y86.096 E.01619
G1 X90.208 Y88.68 E.10989
G1 X90.746 Y88.68 E.01619
G1 X87.624 Y85.558 E.13279
G1 X87.624 Y85.02 E.01619
G1 X91.285 Y88.68 E.15568
G1 X91.823 Y88.68 E.01619
G1 X87.624 Y84.481 E.17858
G1 X87.624 Y83.943 E.01619
G1 X92.361 Y88.68 E.20147
G1 X92.9 Y88.68 E.01619
G1 X87.624 Y83.405 E.22437
G1 X87.624 Y82.866 E.01619
G1 X93.438 Y88.68 E.24726
G1 X93.976 Y88.68 E.01619
G1 X87.624 Y82.328 E.27016
G1 X87.624 Y81.789 E.01619
G1 X94.515 Y88.68 E.29305
G1 X95.053 Y88.68 E.01619
G1 X87.624 Y81.251 E.31595
G1 X87.624 Y80.713 E.01619
G1 X95.591 Y88.68 E.33884
G1 X96.13 Y88.68 E.01619
G1 X87.624 Y80.174 E.36174
G1 X87.624 Y79.636 E.01619
G1 X96.668 Y88.68 E.38463
G1 X97.207 Y88.68 E.01619
G1 X87.624 Y79.098 E.40753
G1 X87.624 Y78.559 E.01619
G1 X97.745 Y88.68 E.43042
G1 X98.283 Y88.68 E.01619
G1 X87.624 Y78.021 E.45332
G1 X87.624 Y77.483 E.01619
G1 X98.822 Y88.68 E.47621
G1 X99.36 Y88.68 E.01619
G1 X87.624 Y76.944 E.49911
G1 X87.624 Y76.406 E.01619
G1 X99.898 Y88.68 E.522
G1 X100.437 Y88.68 E.01619
G1 X87.624 Y75.867 E.5449
G1 X87.624 Y75.329 E.01619
G1 X100.975 Y88.68 E.56779
G1 X101.513 Y88.68 E.01619
G1 X87.624 Y74.791 E.59068
G1 X87.624 Y74.252 E.01619
G1 X102.052 Y88.68 E.61358
G1 X102.59 Y88.68 E.01619
G1 X87.624 Y73.714 E.63647
G1 X87.624 Y73.176 E.01619
G1 X103.128 Y88.68 E.65937
G1 X103.667 Y88.68 E.01619
G1 X87.624 Y72.637 E.68226
G1 X87.624 Y72.099 E.01619
G1 X104.205 Y88.68 E.70516
G1 X104.744 Y88.68 E.01619
G1 X87.624 Y71.561 E.72805
G1 X87.624 Y71.022 E.01619
G1 X105.282 Y88.68 E.75095
G1 X105.753 Y88.68 E.01417
G1 X105.753 Y88.613 E.00202
G1 X87.624 Y70.484 E.77099
G1 X87.624 Y69.945 E.01619
G1 X105.753 Y88.075 E.77099
G1 X105.753 Y87.537 E.01619
G1 X87.624 Y69.407 E.77099
G1 X87.624 Y68.869 E.01619
G1 X105.923 Y87.168 E.77821
; WIPE_START
G1 X104.509 Y85.754 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.84 Y78.129 Z4.3 F15000
G1 X105.923 Y53.251 Z4.3
G1 Z3.9
G1 E.8 F1800
G1 F4800
G1 X105.323 Y52.651 E.02553
G1 X104.784 Y52.651 E.01619
G1 X105.753 Y53.62 E.04121
G1 X105.753 Y54.158 E.01619
G1 X104.246 Y52.651 E.0641
G1 X103.708 Y52.651 E.01619
G1 X105.753 Y54.697 E.08699
G1 X105.753 Y55.235 E.01619
G1 X103.169 Y52.651 E.10989
G1 X102.631 Y52.651 E.01619
G1 X105.753 Y55.773 E.13278
G1 X105.753 Y56.312 E.01619
G1 X102.093 Y52.651 E.15568
G1 X101.554 Y52.651 E.01619
G1 X105.753 Y56.85 E.17857
G1 X105.753 Y57.388 E.01619
G1 X101.016 Y52.651 E.20147
G1 X100.477 Y52.651 E.01619
G1 X105.753 Y57.927 E.22436
G1 X105.753 Y58.465 E.01619
G1 X99.939 Y52.651 E.24726
G1 X99.401 Y52.651 E.01619
G1 X105.753 Y59.003 E.27015
G1 X105.753 Y59.542 E.01619
G1 X98.862 Y52.651 E.29305
G1 X98.324 Y52.651 E.01619
G1 X105.753 Y60.08 E.31594
G1 X105.753 Y60.619 E.01619
G1 X97.786 Y52.651 E.33884
G1 X97.247 Y52.651 E.01619
G1 X105.753 Y61.157 E.36173
G1 X105.753 Y61.695 E.01619
G1 X96.709 Y52.651 E.38463
G1 X96.171 Y52.651 E.01619
G1 X105.753 Y62.234 E.40752
G1 X105.753 Y62.772 E.01619
G1 X95.632 Y52.651 E.43042
G1 X95.094 Y52.651 E.01619
G1 X105.753 Y63.31 E.45331
G1 X105.753 Y63.849 E.01619
G1 X94.555 Y52.651 E.47621
M73 P94 R2
G1 X94.017 Y52.651 E.01619
G1 X105.753 Y64.387 E.4991
G1 X105.753 Y64.925 E.01619
G1 X93.479 Y52.651 E.522
G1 X92.94 Y52.651 E.01619
G1 X105.753 Y65.464 E.54489
G1 X105.753 Y66.002 E.01619
G1 X92.402 Y52.651 E.56779
G1 X91.864 Y52.651 E.01619
G1 X105.753 Y66.541 E.59068
G1 X105.753 Y67.079 E.01619
G1 X91.325 Y52.651 E.61358
G1 X90.787 Y52.651 E.01619
G1 X105.753 Y67.617 E.63647
G1 X105.753 Y68.156 E.01619
G1 X90.249 Y52.651 E.65937
G1 X89.71 Y52.651 E.01619
G1 X105.753 Y68.694 E.68226
G1 X105.753 Y69.232 E.01619
G1 X89.172 Y52.651 E.70516
G1 X88.633 Y52.651 E.01619
G1 X105.753 Y69.771 E.72805
G1 X105.753 Y70.309 E.01619
G1 X88.095 Y52.651 E.75095
G1 X87.624 Y52.651 E.01418
G1 X87.624 Y52.718 E.00201
G1 X105.753 Y70.847 E.77099
G1 X105.753 Y71.386 E.01619
G1 X87.624 Y53.256 E.77099
G1 X87.624 Y53.795 E.01619
G1 X105.753 Y71.924 E.77099
G1 X105.753 Y72.463 E.01619
G1 X87.624 Y54.333 E.77099
G1 X87.624 Y54.871 E.01619
G1 X105.753 Y73.001 E.77099
G1 X105.753 Y73.539 E.01619
G1 X87.624 Y55.41 E.77099
G1 X87.624 Y55.948 E.01619
G1 X105.753 Y74.078 E.77099
G1 X105.753 Y74.616 E.01619
G1 X87.624 Y56.486 E.77099
G1 X87.624 Y57.025 E.01619
G1 X105.753 Y75.154 E.77099
G1 X105.753 Y75.693 E.01619
G1 X100.311 Y70.25 E.23146
G1 X100.451 Y70.493 E.00844
G1 X100.502 Y70.98 E.01472
G1 X105.753 Y76.231 E.22331
G1 X105.753 Y76.769 E.01619
G1 X100.565 Y71.582 E.22062
G1 X100.623 Y72.129 E.01656
G1 X100.611 Y72.166 E.00115
G1 X105.753 Y77.308 E.21868
G1 X105.753 Y77.846 E.01619
G1 X100.479 Y72.572 E.22429
G1 X100.347 Y72.978 E.01285
G1 X105.753 Y78.385 E.22991
G1 X105.753 Y78.923 E.01619
G1 X100.215 Y73.385 E.23552
G1 X100.115 Y73.694 E.00977
G1 X100.054 Y73.762 E.00274
G1 X105.753 Y79.461 E.24239
G1 X105.753 Y80 E.01619
G1 X99.798 Y74.045 E.25324
G1 X99.543 Y74.328 E.01146
G1 X105.753 Y80.538 E.26409
G1 X105.753 Y81.076 E.01619
G1 X99.288 Y74.611 E.27493
G1 X99.033 Y74.895 E.01146
G1 X105.753 Y81.615 E.28578
G1 X105.753 Y82.153 E.01619
G1 X98.67 Y75.069 E.30124
G1 X98.297 Y75.235 E.01226
G1 X105.753 Y82.691 E.31708
G1 X105.753 Y83.23 E.01619
G1 X97.925 Y75.401 E.33293
G1 X97.552 Y75.567 E.01226
G1 X105.753 Y83.768 E.34877
G1 X105.753 Y84.307 E.01619
G1 X97.032 Y75.585 E.37088
G1 X96.494 Y75.585 E.01619
G1 X105.753 Y84.845 E.39378
G1 X105.753 Y85.383 E.01619
G1 X95.955 Y75.585 E.41667
G1 X95.866 Y75.585 E.00269
G1 X95.057 Y75.225 E.02664
G1 X105.753 Y85.922 E.45489
G1 X105.753 Y86.46 E.01619
G1 X87.624 Y68.33 E.77099
G1 X87.624 Y67.792 E.01619
G1 X93.136 Y73.304 E.23441
G1 X92.877 Y72.507 E.02522
G1 X87.624 Y67.254 E.22339
G1 X87.624 Y66.715 E.01619
G1 X92.781 Y71.873 E.21932
G1 X92.832 Y71.385 E.01473
G1 X87.624 Y66.177 E.2215
G1 X87.624 Y65.639 E.01619
G1 X92.883 Y70.898 E.22368
G1 X92.926 Y70.493 E.01225
G1 X92.959 Y70.436 E.002
G1 X87.624 Y65.1 E.2269
G1 X87.624 Y64.562 E.01619
G1 X93.156 Y70.094 E.23528
G1 X93.353 Y69.753 E.01185
G1 X87.624 Y64.023 E.24366
G1 X87.624 Y63.485 E.01619
G1 X93.55 Y69.412 E.25204
G1 X93.747 Y69.07 E.01185
G1 X87.624 Y62.947 E.26042
G1 X87.624 Y62.408 E.01619
G1 X94.059 Y68.843 E.27365
G1 X94.37 Y68.617 E.01159
G1 X87.624 Y61.87 E.28692
G1 X87.624 Y61.332 E.01619
G1 X94.682 Y68.39 E.30018
G1 X94.994 Y68.164 E.01159
G1 X87.624 Y60.793 E.31344
G1 X87.624 Y60.255 E.01619
G1 X95.402 Y68.033 E.33078
G1 X95.846 Y67.939 E.01365
G1 X87.624 Y59.717 E.34966
G1 X87.624 Y59.178 E.01619
G1 X96.29 Y67.844 E.36854
G1 X96.688 Y67.76 E.01226
G1 X96.758 Y67.774 E.00214
G1 X87.624 Y58.64 E.38846
G1 X87.624 Y58.101 E.01619
G1 X97.442 Y67.92 E.41754
G1 X98.126 Y68.065 E.02102
G1 X87.454 Y57.393 E.45383
; CHANGE_LAYER
; Z_HEIGHT: 4.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4800
G1 X88.868 Y58.808 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 178
M625
; layer num/total_layer_count: 20/20
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
G17
G3 Z4.3 I1.217 J0 P1  F15000
; object ids of layer 20 start: 178
M624 AgAAAAAAAAA=
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
; object ids of this layer20 end: 178
M625
; OBJECT_ID: 178
; start printing object, unique label id: 178
M624 AgAAAAAAAAA=
G1 X98.58 Y164.314
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X98.578 Y164.316 E.00009
G1 X97.357 Y164.86 E.03982
G1 X96.02 Y164.86 E.03982
G1 X94.799 Y164.316 E.03982
G1 X93.904 Y163.323 E.03982
G1 X93.491 Y162.052 E.03982
G1 X93.631 Y160.722 E.03982
G1 X94.3 Y159.565 E.03982
G1 X95.381 Y158.779 E.03982
G1 X96.688 Y158.501 E.03982
G1 X97.996 Y158.779 E.03982
G1 X99.077 Y159.565 E.03982
G1 X99.746 Y160.722 E.03982
G1 X99.886 Y162.052 E.03982
G1 X99.472 Y163.323 E.03982
G1 X98.62 Y164.27 E.03795
; WIPE_START
M204 S5000
G1 X98.578 Y164.316 E-.02388
G1 X97.357 Y164.86 E-.50795
G1 X96.756 Y164.86 E-.22816
; WIPE_END
G1 E-.04 F1800
G1 X93.492 Y157.961 Z4.5 F15000
G1 X86.898 Y144.026 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X106.478 Y144.026 E.58322
G1 X106.478 Y181.506 E1.1164
G1 X86.898 Y181.506 E.58322
G1 X86.898 Y144.086 E1.11461
; WIPE_START
M204 S5000
G1 X88.898 Y144.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.188 Y150.967 Z4.5 F15000
G1 X106.271 Y180.456 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X105.429 Y181.298 E.03549
G1 X104.895 Y181.298
G1 X106.271 Y179.923 E.05795
G1 X106.271 Y179.389
G1 X104.362 Y181.298 E.08041
G1 X103.829 Y181.298
G1 X106.271 Y178.856 E.10288
G1 X106.271 Y178.323
G1 X103.296 Y181.298 E.12534
G1 X102.762 Y181.298
G1 X106.271 Y177.79 E.1478
G1 X106.271 Y177.256
G1 X102.229 Y181.298 E.17027
G1 X101.696 Y181.298
G1 X106.271 Y176.723 E.19273
G1 X106.271 Y176.19
G1 X101.163 Y181.298 E.21519
G1 X100.629 Y181.298
G1 X106.271 Y175.657 E.23766
G1 X106.271 Y175.123
G1 X100.096 Y181.298 E.26012
G1 X99.563 Y181.298
G1 X106.271 Y174.59 E.28258
G1 X106.271 Y174.057
G1 X99.03 Y181.298 E.30505
G1 X98.496 Y181.298
G1 X106.271 Y173.524 E.32751
G1 X106.271 Y172.99
G1 X97.963 Y181.298 E.34997
G1 X97.43 Y181.298
G1 X106.271 Y172.457 E.37244
G1 X106.271 Y171.924
G1 X96.897 Y181.298 E.3949
G1 X96.363 Y181.298
G1 X106.271 Y171.391 E.41736
G1 X106.271 Y170.857
G1 X95.83 Y181.298 E.43983
G1 X95.297 Y181.298
G1 X106.271 Y170.324 E.46229
G1 X106.271 Y169.791
G1 X94.764 Y181.298 E.48475
G1 X94.23 Y181.298
G1 X106.271 Y169.257 E.50722
G1 X106.271 Y168.724
G1 X93.697 Y181.298 E.52968
G1 X93.164 Y181.298
G1 X106.271 Y168.191 E.55214
G1 X106.271 Y167.658
G1 X92.63 Y181.298 E.57461
G1 X92.097 Y181.298
G1 X106.271 Y167.124 E.59707
G1 X106.271 Y166.591
G1 X91.564 Y181.298 E.61953
G1 X91.031 Y181.298
G1 X106.271 Y166.058 E.64199
G1 X106.271 Y165.525
G1 X90.497 Y181.298 E.66446
G1 X89.964 Y181.298
G1 X106.271 Y164.991 E.68692
G1 X106.271 Y164.458
G1 X89.431 Y181.298 E.70938
G1 X88.898 Y181.298
G1 X106.271 Y163.925 E.73185
G1 X106.271 Y163.392
G1 X88.364 Y181.298 E.75431
G1 X87.831 Y181.298
G1 X106.271 Y162.858 E.77677
G1 X106.271 Y162.325
G1 X87.298 Y181.298 E.79924
G1 X87.106 Y180.957
G1 X106.271 Y161.792 E.80733
G1 X106.271 Y161.259
G1 X87.106 Y180.424 E.80733
G1 X87.106 Y179.891
G1 X106.271 Y160.725 E.80733
G1 X106.271 Y160.192
G1 X87.106 Y179.357 E.80733
G1 X87.106 Y178.824
G1 X106.271 Y159.659 E.80733
G1 X106.271 Y159.126
G1 X87.106 Y178.291 E.80733
G1 X87.106 Y177.758
G1 X106.271 Y158.592 E.80733
G1 X106.271 Y158.059
G1 X87.106 Y177.224 E.80733
G1 X87.106 Y176.691
G1 X106.271 Y157.526 E.80733
G1 X106.271 Y156.993
G1 X87.106 Y176.158 E.80733
G1 X87.106 Y175.625
G1 X97.873 Y164.857 E.45357
G1 X97.13 Y165.068
G1 X87.106 Y175.091 E.42225
G1 X87.106 Y174.558
G1 X96.596 Y165.068 E.39978
G1 X96.063 Y165.068
G1 X87.106 Y174.025 E.37732
G1 X87.106 Y173.492
G1 X95.667 Y164.93 E.36065
G1 X95.298 Y164.766
G1 X87.106 Y172.958 E.34511
G1 X87.106 Y172.425
G1 X94.929 Y164.601 E.32956
G1 X94.596 Y164.401
G1 X87.106 Y171.892 E.31553
M73 P95 R2
G1 X87.106 Y171.358
G1 X94.344 Y164.121 E.30489
G1 X94.091 Y163.84
G1 X87.106 Y170.825 E.29425
G1 X87.106 Y170.292
G1 X93.838 Y163.559 E.2836
G1 X93.651 Y163.214
G1 X87.106 Y169.759 E.27571
G1 X87.106 Y169.225
G1 X93.52 Y162.811 E.2702
G1 X93.389 Y162.409
G1 X87.106 Y168.692 E.26469
G1 X87.106 Y168.159
G1 X93.291 Y161.974 E.26055
G1 X93.354 Y161.378
G1 X87.106 Y167.626 E.26319
G1 X87.106 Y167.092
G1 X93.416 Y160.782 E.26583
; WIPE_START
M204 S5000
G1 X92.002 Y162.196 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.005 Y159.66 Z4.5 F15000
G1 Z4.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X87.106 Y166.559 E.29062
; WIPE_START
M204 S5000
G1 X88.52 Y165.145 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.376 Y161.79 Z4.5 F15000
G1 X106.271 Y156.459 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X99.827 Y162.904 E.27146
G1 X100.083 Y162.114
G1 X106.271 Y155.926 E.26065
G1 X106.271 Y155.393
G1 X100.048 Y161.616 E.26214
G1 X99.998 Y161.133
M73 P95 R1
G1 X106.271 Y154.86 E.26427
G1 X106.271 Y154.326
G1 X99.945 Y160.652 E.26649
G1 X99.75 Y160.314
G1 X106.271 Y153.793 E.27471
G1 X106.271 Y153.26
G1 X99.555 Y159.976 E.28293
G1 X99.359 Y159.638
G1 X106.271 Y152.727 E.29115
G1 X106.271 Y152.193
G1 X99.123 Y159.341 E.30111
G1 X98.814 Y159.117
G1 X106.271 Y151.66 E.31412
G1 X106.271 Y151.127
G1 X98.505 Y158.893 E.32713
G1 X98.196 Y158.668
G1 X106.271 Y150.593 E.34014
G1 X106.271 Y150.06
G1 X97.805 Y158.526 E.35663
G1 X97.365 Y158.433
G1 X106.271 Y149.527 E.37516
G1 X106.271 Y148.994
G1 X96.925 Y158.339 E.39368
G1 X96.376 Y158.355
G1 X106.271 Y148.46 E.41682
G1 X106.271 Y147.927
G1 X95.699 Y158.499 E.44535
; WIPE_START
M204 S5000
G1 X97.113 Y157.085 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.509 Y159.156 Z4.5 F15000
G1 Z4.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X106.271 Y147.394 E.49549
G1 X106.271 Y146.861
G1 X87.106 Y166.026 E.80733
G1 X87.106 Y165.493
G1 X106.271 Y146.327 E.80733
G1 X106.271 Y145.794
G1 X87.106 Y164.959 E.80733
G1 X87.106 Y164.426
G1 X106.271 Y145.261 E.80733
G1 X106.271 Y144.728
G1 X87.106 Y163.893 E.80733
G1 X87.106 Y163.36
G1 X106.232 Y144.233 E.8057
G1 X105.699 Y144.233
G1 X87.106 Y162.826 E.78324
G1 X87.106 Y162.293
G1 X105.166 Y144.233 E.76077
G1 X104.633 Y144.233
G1 X87.106 Y161.76 E.73831
G1 X87.106 Y161.227
G1 X104.099 Y144.233 E.71585
G1 X103.566 Y144.233
G1 X87.106 Y160.693 E.69338
G1 X87.106 Y160.16
G1 X103.033 Y144.233 E.67092
G1 X102.5 Y144.233
G1 X87.106 Y159.627 E.64846
G1 X87.106 Y159.094
G1 X101.966 Y144.233 E.62599
G1 X101.433 Y144.233
G1 X87.106 Y158.56 E.60353
G1 X87.106 Y158.027
G1 X100.9 Y144.233 E.58107
G1 X100.367 Y144.233
G1 X87.106 Y157.494 E.5586
G1 X87.106 Y156.961
G1 X99.833 Y144.233 E.53614
G1 X99.3 Y144.233
G1 X87.106 Y156.427 E.51368
G1 X87.106 Y155.894
G1 X98.767 Y144.233 E.49121
G1 X98.234 Y144.233
G1 X87.106 Y155.361 E.46875
G1 X87.106 Y154.828
G1 X97.7 Y144.233 E.44629
G1 X97.167 Y144.233
G1 X87.106 Y154.294 E.42382
G1 X87.106 Y153.761
G1 X96.634 Y144.233 E.40136
G1 X96.101 Y144.233
G1 X87.106 Y153.228 E.3789
G1 X87.106 Y152.694
G1 X95.567 Y144.233 E.35643
G1 X95.034 Y144.233
G1 X87.106 Y152.161 E.33397
G1 X87.106 Y151.628
G1 X94.501 Y144.233 E.31151
G1 X93.968 Y144.233
G1 X87.106 Y151.095 E.28904
G1 X87.106 Y150.561
G1 X93.434 Y144.233 E.26658
G1 X92.901 Y144.233
G1 X87.106 Y150.028 E.24412
G1 X87.106 Y149.495
G1 X92.368 Y144.233 E.22165
G1 X91.834 Y144.233
G1 X87.106 Y148.962 E.19919
G1 X87.106 Y148.428
G1 X91.301 Y144.233 E.17673
G1 X90.768 Y144.233
G1 X87.106 Y147.895 E.15427
G1 X87.106 Y147.362
G1 X90.235 Y144.233 E.1318
G1 X89.701 Y144.233
G1 X87.106 Y146.829 E.10934
G1 X87.106 Y146.295
G1 X89.168 Y144.233 E.08688
G1 X88.635 Y144.233
G1 X87.106 Y145.762 E.06441
G1 X87.106 Y145.229
G1 X88.102 Y144.233 E.04195
G1 X87.568 Y144.233
G1 X87.106 Y144.696 E.01949
; WIPE_START
M204 S5000
G1 X87.568 Y144.233 E-.24859
G1 X88.102 Y144.233 E-.20264
G1 X87.527 Y144.808 E-.30877
; WIPE_END
G1 E-.04 F1800
G1 X91.169 Y151.515 Z4.5 F15000
G1 X98.307 Y164.664 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.108946
G1 F7500
G1 X98.183 Y164.749 E.00078
; LINE_WIDTH: 0.150515
G1 X98.059 Y164.834 E.00128
; LINE_WIDTH: 0.192085
G1 X97.935 Y164.919 E.00177
; WIPE_START
G1 X98.059 Y164.834 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X93.6 Y160.359 Z4.5 F15000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.108994
G1 F7500
G1 X93.496 Y160.495 E.00089
; LINE_WIDTH: 0.150656
G1 X93.392 Y160.631 E.00145
; LINE_WIDTH: 0.177005
G1 X93.38 Y160.649 E.00023
G1 X93.427 Y160.793 E.00161
; WIPE_START
G1 X93.38 Y160.649 E-.66538
G1 X93.392 Y160.631 E-.09462
; WIPE_END
G1 E-.04 F1800
G1 X94.448 Y159.096 Z4.5 F15000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.220703
G1 F7500
G1 X94.282 Y159.238 E.00307
; LINE_WIDTH: 0.197625
G2 X93.944 Y159.599 I.734 J1.026 E.00609
; WIPE_START
G1 X94.096 Y159.401 E-.3819
G1 X94.282 Y159.238 E-.3781
; WIPE_END
G1 E-.04 F1800
G1 X98.591 Y152.938 Z4.5 F15000
G1 X106.478 Y141.406 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y141.406 E.58322
G1 X86.898 Y137.026 E.13047
G1 X106.478 Y137.026 E.58322
G1 X106.478 Y141.346 E.12868
M204 S5000
G1 X106.271 Y140.462 F15000
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X105.534 Y141.198 E.03103
M73 P96 R1
G1 X105.001 Y141.198
G1 X106.271 Y139.928 E.0535
G1 X106.271 Y139.395
G1 X104.468 Y141.198 E.07596
G1 X103.935 Y141.198
G1 X106.271 Y138.862 E.09842
G1 X106.271 Y138.329
G1 X103.401 Y141.198 E.12089
G1 X102.868 Y141.198
G1 X106.271 Y137.795 E.14335
G1 X106.271 Y137.262
G1 X102.335 Y141.198 E.16581
G1 X101.802 Y141.198
G1 X105.767 Y137.233 E.16703
G1 X105.234 Y137.233
G1 X101.268 Y141.198 E.16703
G1 X100.735 Y141.198
G1 X104.7 Y137.233 E.16703
G1 X104.167 Y137.233
G1 X100.202 Y141.198 E.16703
G1 X99.669 Y141.198
G1 X103.634 Y137.233 E.16703
G1 X103.101 Y137.233
G1 X99.135 Y141.198 E.16703
G1 X98.602 Y141.198
G1 X102.567 Y137.233 E.16703
G1 X102.034 Y137.233
G1 X98.069 Y141.198 E.16703
G1 X97.536 Y141.198
G1 X101.501 Y137.233 E.16703
G1 X100.968 Y137.233
G1 X97.002 Y141.198 E.16703
G1 X96.469 Y141.198
G1 X100.434 Y137.233 E.16703
G1 X99.901 Y137.233
G1 X95.936 Y141.198 E.16703
G1 X95.402 Y141.198
G1 X99.368 Y137.233 E.16703
G1 X98.834 Y137.233
G1 X94.869 Y141.198 E.16703
G1 X94.336 Y141.198
G1 X98.301 Y137.233 E.16703
G1 X97.768 Y137.233
G1 X93.803 Y141.198 E.16703
G1 X93.269 Y141.198
G1 X97.235 Y137.233 E.16703
G1 X96.701 Y137.233
G1 X92.736 Y141.198 E.16703
G1 X92.203 Y141.198
G1 X96.168 Y137.233 E.16703
G1 X95.635 Y137.233
G1 X91.67 Y141.198 E.16703
G1 X91.136 Y141.198
G1 X95.102 Y137.233 E.16703
G1 X94.568 Y137.233
G1 X90.603 Y141.198 E.16703
G1 X90.07 Y141.198
G1 X94.035 Y137.233 E.16703
G1 X93.502 Y137.233
G1 X89.537 Y141.198 E.16703
G1 X89.003 Y141.198
G1 X92.969 Y137.233 E.16703
G1 X92.435 Y137.233
G1 X88.47 Y141.198 E.16703
G1 X87.937 Y141.198
G1 X91.902 Y137.233 E.16703
G1 X91.369 Y137.233
G1 X87.404 Y141.198 E.16703
G1 X87.106 Y140.963
G1 X90.836 Y137.233 E.15711
G1 X90.302 Y137.233
G1 X87.106 Y140.43 E.13465
G1 X87.106 Y139.896
G1 X89.769 Y137.233 E.11219
G1 X89.236 Y137.233
G1 X87.106 Y139.363 E.08972
G1 X87.106 Y138.83
G1 X88.703 Y137.233 E.06726
G1 X88.169 Y137.233
G1 X87.106 Y138.297 E.0448
G1 X87.106 Y137.763
G1 X87.636 Y137.233 E.02234
; WIPE_START
M204 S5000
G1 X87.106 Y137.763 E-.28494
G1 X87.106 Y138.297 E-.20264
G1 X87.613 Y137.79 E-.27242
; WIPE_END
G1 E-.04 F1800
G1 X90.992 Y130.946 Z4.5 F15000
G1 X99.079 Y114.567 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6000
M204 S2500
G1 X99.746 Y115.722 E.03973
G1 X99.886 Y117.052 E.03982
G1 X99.472 Y118.323 E.03982
G1 X98.578 Y119.316 E.03982
G1 X97.357 Y119.86 E.03982
G1 X96.02 Y119.86 E.03982
G1 X94.799 Y119.316 E.03982
G1 X93.904 Y118.323 E.03982
G1 X93.491 Y117.052 E.03982
G1 X93.631 Y115.722 E.03982
G1 X94.3 Y114.565 E.03982
G1 X95.381 Y113.779 E.03982
G1 X96.688 Y113.501 E.03982
G1 X97.996 Y113.779 E.03982
G1 X99.031 Y114.531 E.03811
; WIPE_START
M204 S5000
G1 X99.746 Y115.722 E-.52787
G1 X99.81 Y116.33 E-.23213
; WIPE_END
G1 E-.04 F1800
G1 X95.245 Y110.213 Z4.5 F15000
G1 X86.898 Y99.026 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X106.478 Y99.026 E.58322
G1 X106.478 Y134.406 E1.05385
G1 X86.898 Y134.406 E.58322
G1 X86.898 Y99.086 E1.05206
; WIPE_START
M204 S5000
G1 X88.898 Y99.08 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X92.335 Y105.894 Z4.5 F15000
G1 X106.271 Y133.529 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X105.602 Y134.198 E.02818
G1 X105.069 Y134.198
G1 X106.271 Y132.996 E.05065
G1 X106.271 Y132.463
G1 X104.536 Y134.198 E.07311
G1 X104.002 Y134.198
G1 X106.271 Y131.929 E.09557
G1 X106.271 Y131.396
G1 X103.469 Y134.198 E.11804
G1 X102.936 Y134.198
G1 X106.271 Y130.863 E.1405
G1 X106.271 Y130.33
G1 X102.402 Y134.198 E.16296
G1 X101.869 Y134.198
G1 X106.271 Y129.796 E.18543
G1 X106.271 Y129.263
G1 X101.336 Y134.198 E.20789
G1 X100.803 Y134.198
G1 X106.271 Y128.73 E.23035
G1 X106.271 Y128.197
G1 X100.269 Y134.198 E.25282
G1 X99.736 Y134.198
G1 X106.271 Y127.663 E.27528
G1 X106.271 Y127.13
G1 X99.203 Y134.198 E.29774
G1 X98.67 Y134.198
G1 X106.271 Y126.597 E.32021
G1 X106.271 Y126.064
G1 X98.136 Y134.198 E.34267
G1 X97.603 Y134.198
G1 X106.271 Y125.53 E.36513
G1 X106.271 Y124.997
G1 X97.07 Y134.198 E.3876
G1 X96.537 Y134.198
G1 X106.271 Y124.464 E.41006
G1 X106.271 Y123.931
G1 X96.003 Y134.198 E.43252
G1 X95.47 Y134.198
G1 X106.271 Y123.397 E.45499
G1 X106.271 Y122.864
G1 X94.937 Y134.198 E.47745
G1 X94.404 Y134.198
G1 X106.271 Y122.331 E.49991
G1 X106.271 Y121.798
G1 X93.87 Y134.198 E.52238
G1 X93.337 Y134.198
G1 X106.271 Y121.264 E.54484
G1 X106.271 Y120.731
G1 X92.804 Y134.198 E.5673
G1 X92.271 Y134.198
G1 X106.271 Y120.198 E.58977
G1 X106.271 Y119.665
G1 X91.737 Y134.198 E.61223
G1 X91.204 Y134.198
G1 X106.271 Y119.131 E.63469
G1 X106.271 Y118.598
G1 X90.671 Y134.198 E.65716
G1 X90.138 Y134.198
G1 X106.271 Y118.065 E.67962
G1 X106.271 Y117.532
G1 X89.604 Y134.198 E.70208
G1 X89.071 Y134.198
G1 X106.271 Y116.998 E.72455
G1 X106.271 Y116.465
G1 X88.538 Y134.198 E.74701
G1 X88.005 Y134.198
G1 X106.271 Y115.932 E.76947
G1 X106.271 Y115.398
G1 X87.471 Y134.198 E.79194
G1 X87.106 Y134.03
G1 X106.271 Y114.865 E.80733
G1 X106.271 Y114.332
G1 X87.106 Y133.497 E.80733
G1 X87.106 Y132.964
G1 X106.271 Y113.799 E.80733
G1 X106.271 Y113.265
G1 X87.106 Y132.431 E.80733
G1 X87.106 Y131.897
G1 X106.271 Y112.732 E.80733
G1 X106.271 Y112.199
G1 X87.106 Y131.364 E.80733
G1 X87.106 Y130.831
G1 X98.245 Y119.692 E.46924
G1 X97.336 Y120.068
G1 X87.106 Y130.298 E.43094
G1 X87.106 Y129.764
G1 X96.803 Y120.068 E.40848
G1 X96.269 Y120.068
G1 X87.106 Y129.231 E.38601
G1 X87.106 Y128.698
G1 X95.81 Y119.994 E.36666
G1 X95.441 Y119.829
G1 X87.106 Y128.165 E.35112
G1 X87.106 Y127.631
G1 X95.072 Y119.665 E.33558
G1 X94.703 Y119.501
G1 X87.106 Y127.098 E.32004
G1 X87.106 Y126.565
G1 X94.441 Y119.229 E.30901
G1 X94.189 Y118.949
G1 X87.106 Y126.032 E.29837
G1 X87.106 Y125.498
G1 X93.936 Y118.668 E.28772
G1 X93.702 Y118.369
G1 X87.106 Y124.965 E.27784
G1 X87.106 Y124.432
G1 X93.571 Y117.967 E.27233
G1 X93.44 Y117.564
G1 X87.106 Y123.899 E.26682
G1 X87.106 Y123.365
G1 X93.309 Y117.162 E.26131
G1 X93.329 Y116.608
G1 X87.106 Y122.832 E.26217
G1 X87.106 Y122.299
G1 X93.392 Y116.013 E.26481
G1 X93.723 Y115.148
G1 X87.106 Y121.766 E.27875
; WIPE_START
M204 S5000
G1 X88.52 Y120.351 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.376 Y116.997 Z4.5 F15000
G1 X106.271 Y111.666 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X99.727 Y118.209 E.27565
G1 X99.984 Y117.419
G1 X106.271 Y111.132 E.26484
G1 X106.271 Y110.599
G1 X100.068 Y116.802 E.26131
G1 X100.017 Y116.32
G1 X106.271 Y110.066 E.26345
G1 X106.271 Y109.533
G1 X99.966 Y115.837 E.26558
G1 X99.825 Y115.445
G1 X106.271 Y108.999 E.27153
G1 X106.271 Y108.466
G1 X99.63 Y115.107 E.27975
G1 X99.435 Y114.769
G1 X106.271 Y107.933 E.28797
G1 X106.271 Y107.4
G1 X99.24 Y114.431 E.29619
G1 X98.934 Y114.204
G1 X106.271 Y106.866 E.30909
G1 X106.271 Y106.333
G1 X98.625 Y113.979 E.3221
G1 X98.316 Y113.755
G1 X106.271 Y105.8 E.33511
G1 X106.271 Y105.267
G1 X97.975 Y113.562 E.34946
G1 X97.535 Y113.469
G1 X106.271 Y104.733 E.36799
G1 X106.271 Y104.2
G1 X97.096 Y113.376 E.38651
G1 X96.638 Y113.3
G1 X106.271 Y103.667 E.40578
G1 X106.271 Y103.134
G1 X95.961 Y113.444 E.43431
G1 X95.263 Y113.608
G1 X106.271 Y102.6 E.4637
G1 X106.271 Y102.067
G1 X87.106 Y121.232 E.80733
G1 X87.106 Y120.699
G1 X106.271 Y101.534 E.80733
G1 X106.271 Y101.001
G1 X87.106 Y120.166 E.80733
G1 X87.106 Y119.633
G1 X106.271 Y100.467 E.80733
G1 X106.271 Y99.934
G1 X87.106 Y119.099 E.80733
G1 X87.106 Y118.566
G1 X106.271 Y99.401 E.80733
G1 X105.906 Y99.233
G1 X87.106 Y118.033 E.79193
G1 X87.106 Y117.499
G1 X105.372 Y99.233 E.76947
M73 P97 R1
G1 X104.839 Y99.233
G1 X87.106 Y116.966 E.747
G1 X87.106 Y116.433
G1 X104.306 Y99.233 E.72454
G1 X103.773 Y99.233
G1 X87.106 Y115.9 E.70208
G1 X87.106 Y115.366
G1 X103.239 Y99.233 E.67961
G1 X102.706 Y99.233
G1 X87.106 Y114.833 E.65715
G1 X87.106 Y114.3
G1 X102.173 Y99.233 E.63469
G1 X101.639 Y99.233
G1 X87.106 Y113.767 E.61222
G1 X87.106 Y113.233
G1 X101.106 Y99.233 E.58976
G1 X100.573 Y99.233
G1 X87.106 Y112.7 E.5673
G1 X87.106 Y112.167
G1 X100.04 Y99.233 E.54483
G1 X99.506 Y99.233
G1 X87.106 Y111.634 E.52237
G1 X87.106 Y111.1
G1 X98.973 Y99.233 E.49991
G1 X98.44 Y99.233
G1 X87.106 Y110.567 E.47744
G1 X87.106 Y110.034
G1 X97.907 Y99.233 E.45498
G1 X97.373 Y99.233
G1 X87.106 Y109.501 E.43252
G1 X87.106 Y108.967
G1 X96.84 Y99.233 E.41006
G1 X96.307 Y99.233
G1 X87.106 Y108.434 E.38759
G1 X87.106 Y107.901
G1 X95.774 Y99.233 E.36513
G1 X95.24 Y99.233
G1 X87.106 Y107.368 E.34267
G1 X87.106 Y106.834
G1 X94.707 Y99.233 E.3202
G1 X94.174 Y99.233
G1 X87.106 Y106.301 E.29774
G1 X87.106 Y105.768
G1 X93.641 Y99.233 E.27527
G1 X93.107 Y99.233
G1 X87.106 Y105.235 E.25281
G1 X87.106 Y104.701
G1 X92.574 Y99.233 E.23035
G1 X92.041 Y99.233
G1 X87.106 Y104.168 E.20789
G1 X87.106 Y103.635
G1 X91.508 Y99.233 E.18542
G1 X90.974 Y99.233
G1 X87.106 Y103.102 E.16296
G1 X87.106 Y102.568
G1 X90.441 Y99.233 E.1405
G1 X89.908 Y99.233
G1 X87.106 Y102.035 E.11803
G1 X87.106 Y101.502
G1 X89.375 Y99.233 E.09557
G1 X88.841 Y99.233
G1 X87.106 Y100.969 E.07311
G1 X87.106 Y100.435
G1 X88.308 Y99.233 E.05064
G1 X87.775 Y99.233
G1 X87.106 Y99.902 E.02818
; WIPE_START
M204 S5000
G1 X87.775 Y99.233 E-.35949
G1 X88.308 Y99.233 E-.20264
G1 X87.94 Y99.601 E-.19787
; WIPE_END
G1 E-.04 F1800
G1 X91.465 Y106.371 Z4.5 F15000
G1 X95.203 Y113.548 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.20978
G1 F7500
G1 X94.937 Y113.775 E.00461
; LINE_WIDTH: 0.161138
G1 X94.672 Y114.002 E.00326
; LINE_WIDTH: 0.112496
G1 X94.406 Y114.229 E.00192
G1 X94.047 Y114.586 F15000
; LINE_WIDTH: 0.110717
G1 F7500
G1 X93.919 Y114.753 E.00113
; LINE_WIDTH: 0.155825
G1 X93.79 Y114.92 E.00188
; LINE_WIDTH: 0.200933
G1 X93.662 Y115.087 E.00263
; WIPE_START
G1 X93.79 Y114.92 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X93.431 Y117.53 Z4.5 F15000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.094115
G1 F7500
G1 X93.346 Y117.392 E.00066
; WIPE_START
G1 X93.431 Y117.53 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.679 Y119.498 Z4.5 F15000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.108946
G1 F7500
G1 X98.555 Y119.583 E.00078
; LINE_WIDTH: 0.150515
G1 X98.431 Y119.668 E.00128
; LINE_WIDTH: 0.192085
G1 X98.307 Y119.754 E.00177
; WIPE_START
G1 X98.431 Y119.668 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.805 Y118.287 Z4.5 F15000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.148073
G1 F7500
G1 X99.677 Y118.454 E.00174
; LINE_WIDTH: 0.130908
G1 X99.295 Y118.857 E.00386
; LINE_WIDTH: 0.102415
G1 X98.913 Y119.26 E.00261
; WIPE_START
G1 X99.295 Y118.857 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.606 Y112.175 Z4.5 F15000
G1 X86.898 Y96.406 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.898 Y92.026 E.13047
G1 X106.478 Y92.026 E.58322
G1 X106.478 Y96.406 E.13047
G1 X86.958 Y96.406 E.58143
; WIPE_START
M204 S5000
G1 X86.931 Y94.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.529 Y95.13 Z4.5 F15000
G1 X105.741 Y96.198 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X106.271 Y95.668 E.02234
G1 X106.271 Y95.135
G1 X105.208 Y96.198 E.0448
G1 X104.674 Y96.198
G1 X106.271 Y94.601 E.06727
G1 X106.271 Y94.068
G1 X104.141 Y96.198 E.08973
G1 X103.608 Y96.198
G1 X106.271 Y93.535 E.11219
G1 X106.271 Y93.002
G1 X103.074 Y96.198 E.13466
G1 X102.541 Y96.198
G1 X106.271 Y92.468 E.15712
G1 X105.973 Y92.233
G1 X102.008 Y96.198 E.16703
G1 X101.475 Y96.198
G1 X105.44 Y92.233 E.16703
G1 X104.907 Y92.233
G1 X100.941 Y96.198 E.16703
G1 X100.408 Y96.198
G1 X104.373 Y92.233 E.16703
G1 X103.84 Y92.233
G1 X99.875 Y96.198 E.16703
G1 X99.342 Y96.198
G1 X103.307 Y92.233 E.16703
G1 X102.774 Y92.233
G1 X98.808 Y96.198 E.16703
G1 X98.275 Y96.198
G1 X102.24 Y92.233 E.16703
G1 X101.707 Y92.233
G1 X97.742 Y96.198 E.16703
G1 X97.209 Y96.198
G1 X101.174 Y92.233 E.16703
G1 X100.641 Y92.233
G1 X96.675 Y96.198 E.16703
G1 X96.142 Y96.198
G1 X100.107 Y92.233 E.16703
G1 X99.574 Y92.233
G1 X95.609 Y96.198 E.16703
G1 X95.076 Y96.198
G1 X99.041 Y92.233 E.16703
G1 X98.508 Y92.233
G1 X94.542 Y96.198 E.16703
G1 X94.009 Y96.198
G1 X97.974 Y92.233 E.16703
G1 X97.441 Y92.233
G1 X93.476 Y96.198 E.16703
M73 P97 R0
G1 X92.943 Y96.198
G1 X96.908 Y92.233 E.16703
G1 X96.375 Y92.233
G1 X92.409 Y96.198 E.16703
G1 X91.876 Y96.198
G1 X95.841 Y92.233 E.16703
G1 X95.308 Y92.233
G1 X91.343 Y96.198 E.16703
G1 X90.81 Y96.198
G1 X94.775 Y92.233 E.16703
G1 X94.242 Y92.233
G1 X90.276 Y96.198 E.16703
G1 X89.743 Y96.198
G1 X93.708 Y92.233 E.16703
G1 X93.175 Y92.233
G1 X89.21 Y96.198 E.16703
G1 X88.677 Y96.198
G1 X92.642 Y92.233 E.16703
G1 X92.108 Y92.233
G1 X88.143 Y96.198 E.16703
G1 X87.61 Y96.198
G1 X91.575 Y92.233 E.16703
G1 X91.042 Y92.233
G1 X87.106 Y96.169 E.16581
G1 X87.106 Y95.636
G1 X90.509 Y92.233 E.14334
G1 X89.975 Y92.233
G1 X87.106 Y95.103 E.12088
G1 X87.106 Y94.569
G1 X89.442 Y92.233 E.09842
G1 X88.909 Y92.233
G1 X87.106 Y94.036 E.07596
G1 X87.106 Y93.503
G1 X88.376 Y92.233 E.05349
G1 X87.842 Y92.233
G1 X87.106 Y92.97 E.03103
; WIPE_START
M204 S5000
G1 X87.842 Y92.233 E-.39584
G1 X88.376 Y92.233 E-.20264
G1 X88.075 Y92.534 E-.16152
; WIPE_END
G1 E-.04 F1800
G1 X91.623 Y85.776 Z4.5 F15000
G1 X97.354 Y74.86 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6000
M204 S2500
G1 X96.02 Y74.86 E.03973
G1 X94.799 Y74.316 E.03982
G1 X93.904 Y73.323 E.03982
G1 X93.491 Y72.052 E.03982
G1 X93.631 Y70.722 E.03982
G1 X94.3 Y69.565 E.03982
G1 X95.381 Y68.779 E.03982
G1 X96.688 Y68.501 E.03982
G1 X97.996 Y68.779 E.03982
G1 X99.077 Y69.565 E.03982
G1 X99.746 Y70.722 E.03982
G1 X99.886 Y72.052 E.03982
G1 X99.472 Y73.323 E.03982
G1 X98.578 Y74.316 E.03982
G1 X97.409 Y74.837 E.03811
; WIPE_START
M204 S5000
G1 X96.02 Y74.86 E-.52788
G1 X95.462 Y74.612 E-.23212
; WIPE_END
G1 E-.04 F1800
G1 X91.638 Y81.217 Z4.5 F15000
G1 X86.898 Y89.406 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X86.898 Y51.926 E1.1164
G1 X106.478 Y51.926 E.58322
G1 X106.478 Y89.406 E1.1164
G1 X86.958 Y89.406 E.58143
; WIPE_START
M204 S5000
G1 X86.955 Y87.406 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.57 Y87.93 Z4.5 F15000
G1 X106.271 Y88.736 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X105.808 Y89.198 E.01949
G1 X105.275 Y89.198
G1 X106.271 Y88.202 E.04195
G1 X106.271 Y87.669
G1 X104.742 Y89.198 E.06442
G1 X104.209 Y89.198
G1 X106.271 Y87.136 E.08688
G1 X106.271 Y86.603
G1 X103.675 Y89.198 E.10934
G1 X103.142 Y89.198
G1 X106.271 Y86.069 E.13181
G1 X106.271 Y85.536
G1 X102.609 Y89.198 E.15427
G1 X102.076 Y89.198
G1 X106.271 Y85.003 E.17673
G1 X106.271 Y84.47
G1 X101.542 Y89.198 E.1992
G1 X101.009 Y89.198
G1 X106.271 Y83.936 E.22166
G1 X106.271 Y83.403
G1 X100.476 Y89.198 E.24412
G1 X99.943 Y89.198
G1 X106.271 Y82.87 E.26659
G1 X106.271 Y82.337
G1 X99.409 Y89.198 E.28905
G1 X98.876 Y89.198
G1 X106.271 Y81.803 E.31151
G1 X106.271 Y81.27
G1 X98.343 Y89.198 E.33398
G1 X97.81 Y89.198
G1 X106.271 Y80.737 E.35644
G1 X106.271 Y80.203
G1 X97.276 Y89.198 E.3789
G1 X96.743 Y89.198
G1 X106.271 Y79.67 E.40137
G1 X106.271 Y79.137
G1 X96.21 Y89.198 E.42383
G1 X95.677 Y89.198
G1 X106.271 Y78.604 E.44629
G1 X106.271 Y78.07
G1 X95.143 Y89.198 E.46876
G1 X94.61 Y89.198
G1 X106.271 Y77.537 E.49122
G1 X106.271 Y77.004
G1 X94.077 Y89.198 E.51368
G1 X93.543 Y89.198
G1 X106.271 Y76.471 E.53615
G1 X106.271 Y75.937
G1 X93.01 Y89.198 E.55861
G1 X92.477 Y89.198
G1 X106.271 Y75.404 E.58107
G1 X106.271 Y74.871
G1 X91.944 Y89.198 E.60354
G1 X91.41 Y89.198
G1 X106.271 Y74.338 E.626
M73 P98 R0
G1 X106.271 Y73.804
G1 X90.877 Y89.198 E.64846
G1 X90.344 Y89.198
G1 X106.271 Y73.271 E.67093
G1 X106.271 Y72.738
G1 X89.811 Y89.198 E.69339
G1 X89.277 Y89.198
G1 X106.271 Y72.205 E.71585
G1 X106.271 Y71.671
G1 X88.744 Y89.198 E.73832
G1 X88.211 Y89.198
G1 X106.271 Y71.138 E.76078
G1 X106.271 Y70.605
G1 X87.678 Y89.198 E.78324
G1 X87.144 Y89.198
G1 X106.271 Y70.072 E.80571
G1 X106.271 Y69.538
G1 X87.106 Y88.704 E.80733
G1 X87.106 Y88.17
G1 X106.271 Y69.005 E.80733
G1 X106.271 Y68.472
G1 X87.106 Y87.637 E.80733
G1 X87.106 Y87.104
G1 X106.271 Y67.939 E.80733
G1 X106.271 Y67.405
G1 X87.106 Y86.571 E.80733
G1 X87.106 Y86.037
G1 X98.617 Y74.526 E.48491
G1 X97.656 Y74.954
G1 X87.106 Y85.504 E.44442
G1 X87.106 Y84.971
G1 X97.009 Y75.068 E.41717
G1 X96.476 Y75.068
G1 X87.106 Y84.438 E.39471
G1 X87.106 Y83.904
G1 X95.953 Y75.057 E.37268
G1 X95.584 Y74.893
G1 X87.106 Y83.371 E.35714
G1 X87.106 Y82.838
G1 X95.215 Y74.729 E.34159
G1 X94.846 Y74.564
G1 X87.106 Y82.305 E.32605
G1 X87.106 Y81.771
G1 X94.539 Y74.338 E.31313
G1 X94.287 Y74.057
G1 X87.106 Y81.238 E.30248
G1 X87.106 Y80.705
G1 X94.034 Y73.777 E.29184
G1 X93.781 Y73.496
G1 X87.106 Y80.171 E.2812
G1 X87.106 Y79.638
G1 X93.621 Y73.123 E.27446
G1 X93.491 Y72.72
G1 X87.106 Y79.105 E.26895
G1 X87.106 Y78.572
G1 X93.36 Y72.318 E.26345
G1 X93.305 Y71.839
G1 X87.106 Y78.038 E.26115
G1 X87.106 Y77.505
G1 X93.368 Y71.243 E.26379
G1 X93.441 Y70.637
G1 X87.106 Y76.972 E.26687
; WIPE_START
M204 S5000
G1 X88.52 Y75.558 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.376 Y72.203 Z4.5 F15000
G1 X106.271 Y66.872 Z4.5
G1 Z4.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X99.131 Y74.012 E.30077
; WIPE_START
M204 S5000
G1 X100.545 Y72.598 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.885 Y72.725 Z4.5 F15000
G1 Z4.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X106.271 Y66.339 E.26902
G1 X106.271 Y65.806
G1 X100.087 Y71.989 E.26048
G1 X100.037 Y71.507
G1 X106.271 Y65.272 E.26262
G1 X106.271 Y64.739
G1 X99.986 Y71.024 E.26475
G1 X99.901 Y70.576
G1 X106.271 Y64.206 E.26835
G1 X106.271 Y63.673
G1 X99.706 Y70.238 E.27657
G1 X99.51 Y69.9
G1 X106.271 Y63.139 E.28479
G1 X106.271 Y62.606
G1 X99.315 Y69.562 E.29301
G1 X99.053 Y69.291
G1 X106.271 Y62.073 E.30405
G1 X106.271 Y61.539
G1 X98.744 Y69.066 E.31706
G1 X98.435 Y68.842
G1 X106.271 Y61.006 E.33007
G1 X106.271 Y60.473
G1 X98.127 Y68.617 E.34308
G1 X97.706 Y68.505
G1 X106.271 Y59.94 E.36082
G1 X106.271 Y59.406
G1 X97.266 Y68.412 E.37934
G1 X96.826 Y68.318
G1 X106.271 Y58.873 E.39787
G1 X106.271 Y58.34
G1 X96.223 Y68.388 E.42327
G1 X95.546 Y68.532
G1 X106.271 Y57.807 E.45179
G1 X106.271 Y57.273
G1 X87.106 Y76.439 E.80733
G1 X87.106 Y75.905
G1 X106.271 Y56.74 E.80733
G1 X106.271 Y56.207
G1 X87.106 Y75.372 E.80733
G1 X87.106 Y74.839
G1 X106.271 Y55.674 E.80733
G1 X106.271 Y55.14
G1 X87.106 Y74.306 E.80733
G1 X87.106 Y73.772
G1 X106.271 Y54.607 E.80733
G1 X106.271 Y54.074
G1 X87.106 Y73.239 E.80733
G1 X87.106 Y72.706
G1 X106.271 Y53.541 E.80733
G1 X106.271 Y53.007
G1 X87.106 Y72.173 E.80733
G1 X87.106 Y71.639
G1 X106.271 Y52.474 E.80733
G1 X106.079 Y52.133
G1 X87.106 Y71.106 E.79923
G1 X87.106 Y70.573
G1 X105.546 Y52.133 E.77677
G1 X105.012 Y52.133
G1 X87.106 Y70.04 E.75431
G1 X87.106 Y69.506
G1 X104.479 Y52.133 E.73184
G1 X103.946 Y52.133
G1 X87.106 Y68.973 E.70938
G1 X87.106 Y68.44
G1 X103.413 Y52.133 E.68692
G1 X102.879 Y52.133
G1 X87.106 Y67.907 E.66445
G1 X87.106 Y67.373
G1 X102.346 Y52.133 E.64199
G1 X101.813 Y52.133
G1 X87.106 Y66.84 E.61953
G1 X87.106 Y66.307
G1 X101.28 Y52.133 E.59706
G1 X100.746 Y52.133
G1 X87.106 Y65.774 E.5746
G1 X87.106 Y65.24
G1 X100.213 Y52.133 E.55214
G1 X99.68 Y52.133
G1 X87.106 Y64.707 E.52967
G1 X87.106 Y64.174
G1 X99.147 Y52.133 E.50721
G1 X98.613 Y52.133
G1 X87.106 Y63.641 E.48475
G1 X87.106 Y63.107
G1 X98.08 Y52.133 E.46228
G1 X97.547 Y52.133
G1 X87.106 Y62.574 E.43982
G1 X87.106 Y62.041
G1 X97.014 Y52.133 E.41736
G1 X96.48 Y52.133
G1 X87.106 Y61.507 E.39489
G1 X87.106 Y60.974
G1 X95.947 Y52.133 E.37243
G1 X95.414 Y52.133
G1 X87.106 Y60.441 E.34997
G1 X87.106 Y59.908
G1 X94.88 Y52.133 E.3275
G1 X94.347 Y52.133
G1 X87.106 Y59.374 E.30504
G1 X87.106 Y58.841
G1 X93.814 Y52.133 E.28258
G1 X93.281 Y52.133
G1 X87.106 Y58.308 E.26011
M73 P99 R0
G1 X87.106 Y57.775
G1 X92.747 Y52.133 E.23765
G1 X92.214 Y52.133
G1 X87.106 Y57.241 E.21519
G1 X87.106 Y56.708
G1 X91.681 Y52.133 E.19272
G1 X91.148 Y52.133
G1 X87.106 Y56.175 E.17026
G1 X87.106 Y55.642
G1 X90.614 Y52.133 E.1478
G1 X90.081 Y52.133
G1 X87.106 Y55.108 E.12533
G1 X87.106 Y54.575
G1 X89.548 Y52.133 E.10287
G1 X89.015 Y52.133
G1 X87.106 Y54.042 E.08041
G1 X87.106 Y53.509
G1 X88.481 Y52.133 E.05794
G1 X87.948 Y52.133
G1 X87.106 Y52.975 E.03548
; WIPE_START
M204 S5000
G1 X87.948 Y52.133 E-.45265
G1 X88.481 Y52.133 E-.20264
G1 X88.287 Y52.328 E-.10472
; WIPE_END
G1 E-.04 F1800
G1 X90.538 Y59.621 Z4.5 F15000
G1 X93.765 Y70.074 Z4.5
G1 Z4.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11072
G1 F7500
G1 X93.637 Y70.241 E.00113
; LINE_WIDTH: 0.155833
G1 X93.508 Y70.409 E.00188
; LINE_WIDTH: 0.200945
G1 X93.38 Y70.576 E.00263
; WIPE_START
G1 X93.508 Y70.409 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.465 Y68.451 Z4.5 F15000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.106872
G1 F7500
G2 X95.161 Y68.68 I.916 J1.535 E.00193
; WIPE_START
G1 X95.465 Y68.451 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.802 Y68.312 Z4.5 F15000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.14148
G1 F7500
G1 X96.693 Y68.257 E.00095
G1 X96.584 Y68.306 E.00093
; WIPE_START
G1 X96.693 Y68.257 E-.37544
G1 X96.802 Y68.312 E-.38456
; WIPE_END
G1 E-.04 F1800
G1 X99.191 Y74.072 Z4.5 F15000
G1 Z4.1
G1 E.8 F1800
; LINE_WIDTH: 0.230698
G1 F7500
G3 X98.75 Y74.536 I-10.474 J-9.503 E.0095
; LINE_WIDTH: 0.196422
G1 X98.614 Y74.523 E.00166
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F7500
G1 X98.75 Y74.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.5 I1.217 J0 P1  F15000
; stop printing object, unique label id: 178
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
G1 Z4.6 F900 ; lower z a little
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

    G1 Z104.1 F600
    G1 Z102.1

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

