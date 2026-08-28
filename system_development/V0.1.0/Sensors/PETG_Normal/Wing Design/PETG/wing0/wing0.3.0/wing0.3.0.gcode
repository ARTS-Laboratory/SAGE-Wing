; HEADER_BLOCK_START
; BambuStudio 02.07.01.57
; model printing time: 6m 54s; total estimated time: 13m 14s
; total layer number: 9
; total filament length [mm] : 683.77
; total filament volume [cm^3] : 1644.66
; total filament weight [g] : 2.11
; filament_density: 1.28
; filament_diameter: 1.75
; max_z_height: 1.90
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
M73 P0 R13
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
M73 P4 R12
G1 E50 F200
M400
M104 S250
G92 E0
M73 P37 R8
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S230 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P39 R8
G1 E-0.5 F300

M73 P41 R7
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
M73 P42 R7
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
    G29 A X83.2863 Y98.2863 I89.4273 J59.4273
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
; layer num/total_layer_count: 1/9
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S3000
M73 P43 R7
G1 Z.4 F15000
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
; OBJECT_ID: 92
G1 X84.452 Y97.044
G1 Z.3
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
G1 X84.844 Y96.789 E.02414
G1 X85.282 Y96.615 E.02431
G1 X86.016 Y96.504 E.03834
G1 X169.989 Y96.504 E4.33438
G1 X170.466 Y96.551 E.0247
M73 P44 R7
G1 X170.916 Y96.687 E.0243
G1 X171.239 Y96.848 E.01861
G1 X171.629 Y97.117 E.02446
G1 X171.956 Y97.452 E.02415
G1 X172.211 Y97.844 E.02414
G1 X172.385 Y98.282 E.02431
G1 X172.496 Y99.016 E.03834
G1 X172.496 Y152.989 E2.78588
G1 X172.449 Y153.466 E.0247
G1 X172.312 Y153.918 E.02438
M73 P45 R7
G1 X172.197 Y154.157 E.01371
G1 X171.882 Y154.631 E.02936
G1 X171.548 Y154.956 E.02406
G1 X171.156 Y155.211 E.02414
G1 X170.718 Y155.385 E.02431
G1 X169.984 Y155.496 E.03834
G1 X86.011 Y155.496 E4.33437
G1 X85.534 Y155.449 E.0247
G1 X85.082 Y155.312 E.02438
G1 X84.843 Y155.197 E.01371
G1 X84.369 Y154.882 E.02936
G1 X84.044 Y154.548 E.02406
G1 X83.789 Y154.156 E.02414
G1 X83.615 Y153.718 E.02431
M73 P46 R7
G1 X83.504 Y152.984 E.03834
G1 X83.504 Y99.011 E2.78589
G1 X83.551 Y98.534 E.0247
G1 X83.688 Y98.082 E.02438
G1 X83.803 Y97.843 E.01371
G1 X84.118 Y97.369 E.02936
G1 X84.409 Y97.086 E.02096
M204 S3000
G1 X84.715 Y97.4 F15000
G1 F1500
M204 S250
G1 X84.736 Y97.379 E.00152
M73 P47 R7
G1 X85.035 Y97.185 E.01838
G1 X85.382 Y97.044 E.01938
G1 X86.059 Y96.94 E.03532
G1 X169.974 Y96.94 E4.33141
M73 P47 R6
G1 X170.368 Y96.979 E.0204
G1 X170.744 Y97.09 E.02027
G1 X171.025 Y97.229 E.01616
G1 X171.356 Y97.46 E.02084
G1 X171.621 Y97.736 E.01973
G1 X171.827 Y98.057 E.01971
G1 X171.964 Y98.411 E.01959
G1 X172.06 Y99.059 E.03379
G1 X172.06 Y152.962 E2.78225
G1 X172.021 Y153.368 E.02106
G1 X171.901 Y153.769 E.0216
M73 P48 R6
G1 X171.813 Y153.949 E.01034
G1 X171.553 Y154.339 E.02422
G1 X171.264 Y154.621 E.02082
G1 X170.965 Y154.815 E.01838
G1 X170.618 Y154.956 E.01938
G1 X169.941 Y155.06 E.03533
G1 X86.038 Y155.06 E4.33074
G1 X85.632 Y155.021 E.02106
G1 X85.231 Y154.901 E.0216
G1 X85.051 Y154.813 E.01034
G1 X84.661 Y154.553 E.02422
G1 X84.379 Y154.264 E.02082
G1 X84.185 Y153.965 E.01838
G1 X84.044 Y153.618 E.01938
G1 X83.94 Y152.941 E.03532
G1 X83.94 Y99.038 E2.78226
G1 X83.979 Y98.632 E.02105
G1 X84.099 Y98.231 E.0216
M73 P49 R6
G1 X84.187 Y98.051 E.01034
G1 X84.447 Y97.661 E.02422
G1 X84.672 Y97.442 E.01621
M204 S3000
G1 X84.979 Y97.754 F15000
G1 F1500
M204 S250
G1 X85.02 Y97.714 E.00296
G1 X85.249 Y97.568 E.01399
G1 X85.485 Y97.472 E.01316
G1 X86.102 Y97.375 E.03225
G1 X169.947 Y97.376 E4.32774
G1 X170.272 Y97.407 E.01684
G1 X170.574 Y97.494 E.01623
G1 X170.81 Y97.611 E.0136
G1 X171.08 Y97.802 E.0171
G1 X171.284 Y98.018 E.0153
G1 X171.441 Y98.268 E.01525
G1 X171.542 Y98.538 E.01489
G1 X171.625 Y99.101 E.02936
G1 X171.625 Y152.934 E2.77868
G1 X171.588 Y153.296 E.01875
G1 X171.483 Y153.63 E.01811
G1 X171.226 Y154.044 E.02516
G1 X170.98 Y154.286 E.01778
G1 X170.751 Y154.432 E.01399
G1 X170.515 Y154.528 E.01316
G1 X169.898 Y154.625 E.03225
G1 X86.066 Y154.625 E4.32709
G1 X85.704 Y154.588 E.01875
G1 X85.37 Y154.483 E.01811
G1 X84.956 Y154.226 E.02516
M73 P50 R6
G1 X84.714 Y153.98 E.01778
G1 X84.568 Y153.751 E.01399
G1 X84.472 Y153.515 E.01316
G1 X84.375 Y152.898 E.03225
G1 X84.375 Y99.066 E2.77861
G1 X84.412 Y98.704 E.01875
G1 X84.517 Y98.37 E.01811
G1 X84.774 Y97.956 E.02516
G1 X84.936 Y97.796 E.01172
M204 S3000
G1 X85.232 Y98.115 F15000
G1 F1500
M204 S250
G1 X85.428 Y97.976 E.01243
G1 X85.615 Y97.888 E.01066
G1 X85.75 Y97.847 E.00726
G1 X86.019 Y97.811 E.01401
G1 X169.978 Y97.811 E4.33366
G1 X170.28 Y97.857 E.01574
G1 X170.393 Y97.893 E.00612
G1 X170.683 Y98.047 E.01698
G1 X170.883 Y98.229 E.01395
G1 X171.024 Y98.428 E.01259
G1 X171.153 Y98.75 E.01788
G1 X171.189 Y99.019 E.01401
G1 X171.189 Y152.978 E2.78518
G1 X171.143 Y153.28 E.01575
G1 X171.107 Y153.393 E.00613
G1 X170.953 Y153.683 E.01698
G1 X170.771 Y153.883 E.01395
G1 X170.572 Y154.024 E.01259
G1 X170.25 Y154.153 E.01788
M73 P51 R6
G1 X169.981 Y154.189 E.01401
G1 X86.022 Y154.189 E4.33366
G1 X85.72 Y154.143 E.01575
G1 X85.607 Y154.107 E.00613
G1 X85.317 Y153.953 E.01698
G1 X85.117 Y153.771 E.01395
G1 X84.976 Y153.572 E.01259
G1 X84.847 Y153.25 E.01788
G1 X84.811 Y152.981 E.01401
G1 X84.811 Y99.022 E2.78518
G1 X84.858 Y98.719 E.01583
G1 X84.926 Y98.521 E.01082
G1 X84.989 Y98.409 E.00659
G1 X85.194 Y98.161 E.01662
M204 S3000
G1 X85.495 Y98.461 F15000
G1 F1500
M204 S250
G1 X85.603 Y98.375 E.00715
G1 X85.809 Y98.278 E.01174
G1 X86.01 Y98.247 E.0105
G1 X169.988 Y98.247 E4.33463
G1 X170.207 Y98.287 E.01151
G1 X170.394 Y98.372 E.01057
G1 X170.539 Y98.495 E.00982
G1 X170.625 Y98.603 E.00715
G1 X170.722 Y98.809 E.01174
M73 P52 R6
G1 X170.753 Y99.01 E.0105
G1 X170.753 Y152.988 E2.78614
G1 X170.713 Y153.207 E.01151
G1 X170.628 Y153.394 E.01057
G1 X170.505 Y153.539 E.00982
G1 X170.397 Y153.625 E.00715
G1 X170.191 Y153.722 E.01174
G1 X169.99 Y153.753 E.0105
G1 X86.012 Y153.753 E4.33463
G1 X85.793 Y153.713 E.01151
G1 X85.606 Y153.628 E.01057
G1 X85.461 Y153.505 E.00982
G1 X85.375 Y153.397 E.00715
G1 X85.278 Y153.191 E.01174
G1 X85.247 Y152.99 E.0105
G1 X85.247 Y99.012 E2.78614
G1 X85.287 Y98.789 E.01168
G1 X85.332 Y98.676 E.00627
G1 X85.459 Y98.509 E.01083
M204 S3000
G1 X85.756 Y98.81 F15000
G1 F1500
M204 S250
G1 X85.887 Y98.706 E.0086
G1 X86 Y98.682 E.00598
G1 X170 Y98.682 E4.33576
G1 X170.105 Y98.709 E.00562
G1 X170.19 Y98.756 E.005
G1 X170.294 Y98.887 E.0086
M73 P53 R6
G1 X170.318 Y99 E.00598
G1 X170.318 Y153 E2.78728
G1 X170.291 Y153.105 E.00562
G1 X170.244 Y153.19 E.005
G1 X170.113 Y153.294 E.0086
G1 X170 Y153.318 E.00598
G1 X86 Y153.318 E4.33576
G1 X85.895 Y153.291 E.00562
G1 X85.81 Y153.244 E.005
G1 X85.706 Y153.113 E.0086
G1 X85.682 Y153 E.00598
G1 X85.682 Y99 E2.78728
G1 X85.709 Y98.895 E.00562
G1 X85.727 Y98.862 E.0019
; WIPE_START
G1 X85.887 Y98.706 E-.08485
G1 X86 Y98.682 E-.044
G1 X87.661 Y98.682 E-.63115
; WIPE_END
G1 E-.04 F1800
M204 S3000
M73 P54 R6
G1 X94.037 Y102.878 Z.7 F15000
G1 X169.6 Y152.6 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X86.4 Y152.6 E4.29447
G1 X86.4 Y99.4 E2.74598
G1 X169.6 Y99.4 E4.29447
G1 X169.6 Y152.54 E2.74289
M204 S3000
G1 X169.164 Y152.164 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X86.836 Y152.164 E4.2495
G1 X86.836 Y99.836 E2.70101
G1 X169.164 Y99.836 E4.2495
M73 P54 R5
G1 X169.164 Y152.104 E2.69792
; WIPE_START
G1 X167.164 Y152.106 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X159.532 Y152.038 Z.7 F15000
G1 X87.6 Y151.4 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
M73 P55 R5
G1 F1500
M204 S250
G1 X87.6 Y100.6 E2.6221
G1 X97.4 Y100.6 E.50584
G1 X97.4 Y151.4 E2.6221
G1 X87.66 Y151.4 E.50274
M204 S3000
G1 X87.164 Y151.4 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X87.164 Y100.164 E2.64459
G1 X97.836 Y100.164 E.55081
G1 X97.836 Y151.836 E2.66707
G1 X87.164 Y151.836 E.55081
G1 X87.164 Y151.46 E.01939
; WIPE_START
G1 X87.164 Y149.46 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X94.689 Y150.737 Z.7 F15000
G1 X98.6 Y151.4 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
M73 P56 R5
G1 F1500
M204 S250
G1 X98.6 Y100.6 E2.6221
G1 X107.4 Y100.6 E.45422
G1 X107.4 Y151.4 E2.6221
G1 X98.66 Y151.4 E.45113
M204 S3000
G1 X98.6 Y151.836 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X98.164 Y151.836 E.02249
G1 X98.164 Y100.164 E2.66707
G1 X107.836 Y100.164 E.49919
G1 X107.836 Y151.836 E2.66707
G1 X98.66 Y151.836 E.47361
; WIPE_START
G1 X98.164 Y151.836 E-.18834
G1 X98.164 Y150.331 E-.57166
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X105.785 Y150.755 Z.7 F15000
G1 X117.4 Y151.4 Z.7
M73 P57 R5
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
M73 P58 R5
G1 X108.6 Y151.4 E.45422
G1 X108.6 Y100.6 E2.6221
G1 X117.4 Y100.6 E.45422
G1 X117.4 Y151.34 E2.61901
M204 S3000
G1 X117.836 Y151.4 F15000
; FEATURE: Inner wall
M73 P59 R5
G1 F1500
M204 S250
G1 X117.836 Y151.836 E.02249
G1 X108.164 Y151.836 E.49919
G1 X108.164 Y100.164 E2.66707
G1 X117.836 Y100.164 E.49919
G1 X117.836 Y151.34 E2.64149
; WIPE_START
G1 X117.836 Y151.836 E-.18834
G1 X116.331 Y151.836 E-.57166
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X123.958 Y151.535 Z.7 F15000
G1 X127.4 Y151.4 Z.7
M73 P60 R5
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X118.6 Y151.4 E.45422
G1 X118.6 Y100.6 E2.6221
G1 X127.4 Y100.6 E.45422
G1 X127.4 Y151.34 E2.61901
M204 S3000
G1 X127.836 Y151.4 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X127.836 Y151.836 E.02249
G1 X118.164 Y151.836 E.49919
G1 X118.164 Y100.164 E2.66707
G1 X127.836 Y100.164 E.49919
G1 X127.836 Y151.34 E2.64149
; WIPE_START
G1 X127.836 Y151.836 E-.18834
G1 X126.331 Y151.836 E-.57166
; WIPE_END
M73 P61 R5
G1 E-.04 F1800
M204 S3000
G1 X133.963 Y151.757 Z.7 F15000
G1 X168.4 Y151.4 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X138.6 Y151.4 E1.53816
G1 X138.6 Y100.6 E2.6221
G1 X168.4 Y100.6 E1.53816
G1 X168.4 Y151.34 E2.61901
M204 S3000
M73 P62 R5
G1 X168.836 Y151.4 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X168.836 Y151.836 E.02249
G1 X138.164 Y151.836 E1.58313
G1 X138.164 Y100.164 E2.66707
G1 X168.836 Y100.164 E1.58313
G1 X168.836 Y151.34 E2.64149
; WIPE_START
G1 X168.836 Y151.836 E-.18834
G1 X167.331 Y151.836 E-.57166
; WIPE_END
G1 E-.04 F1800
M204 S3000
M73 P62 R4
G1 X159.7 Y151.725 Z.7 F15000
G1 X137.4 Y151.4 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X128.6 Y151.4 E.45422
G1 X128.6 Y100.6 E2.6221
M73 P63 R4
G1 X137.4 Y100.6 E.45422
G1 X137.4 Y151.34 E2.61901
M204 S3000
G1 X137.836 Y151.4 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X137.836 Y151.836 E.02249
G1 X128.164 Y151.836 E.49919
G1 X128.164 Y100.164 E2.66707
G1 X137.836 Y100.164 E.49919
G1 X137.836 Y151.34 E2.64149
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1500
G1 X137.836 Y151.836 E-.18834
G1 X136.331 Y151.836 E-.57166
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/9
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M104 S245 ; set nozzle temperature
M204 S5000
G17
G3 Z.7 I1.217 J0 P1  F15000
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
; OBJECT_ID: 92
M73 P64 R4
G1 X137.602 Y151.21
G1 Z.5
G1 E.8 F1800
; LINE_WIDTH: 0.45
G1 F9000
G1 X137.602 Y151.602 E.01261
G1 X128.398 Y151.602 E.29597
G1 X128.398 Y100.398 E1.64654
G1 X137.602 Y100.398 E.29597
G1 X137.602 Y151.15 E1.632
M204 S250
G1 X137.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X128.79 Y151.21 E.2508
G1 X128.79 Y100.79 E1.50184
G1 X137.21 Y100.79 E.2508
G1 X137.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X135.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P65 R4
G1 X142.842 Y151.175 Z.9 F15000
G1 X168.602 Y151.21 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X168.602 Y151.602 E.01261
G1 X138.398 Y151.602 E.97126
G1 X138.398 Y100.398 E1.64654
M73 P66 R4
G1 X168.602 Y100.398 E.97126
G1 X168.602 Y151.15 E1.632
M204 S250
G1 X168.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.79 Y151.21 E.87632
G1 X138.79 Y100.79 E1.50184
G1 X168.21 Y100.79 E.87632
G1 X168.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X166.21 Y151.154 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X158.578 Y151.165 Z.9 F15000
G1 X127.602 Y151.21 Z.9
G1 Z.5
M73 P67 R4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X127.602 Y151.602 E.01261
G1 X118.398 Y151.602 E.29597
G1 X118.398 Y100.398 E1.64654
G1 X127.602 Y100.398 E.29597
G1 X127.602 Y151.15 E1.632
M204 S250
G1 X127.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X118.79 Y151.21 E.2508
G1 X118.79 Y100.79 E1.50184
G1 X127.21 Y100.79 E.2508
G1 X127.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X125.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.602 Y151.21 Z.9 F15000
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X117.602 Y151.602 E.01261
G1 X108.398 Y151.602 E.29597
G1 X108.398 Y100.398 E1.64654
G1 X117.602 Y100.398 E.29597
G1 X117.602 Y151.15 E1.632
M204 S250
G1 X117.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X108.79 Y151.21 E.2508
M73 P68 R4
G1 X108.79 Y100.79 E1.50184
G1 X117.21 Y100.79 E.2508
G1 X117.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X115.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.58 Y151.368 Z.9 F15000
G1 X98.79 Y151.602 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.398 Y151.602 E.01261
G1 X98.398 Y100.398 E1.64654
G1 X107.602 Y100.398 E.29597
G1 X107.602 Y151.602 E1.64654
G1 X98.85 Y151.602 E.28143
M204 S250
G1 X98.79 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X98.79 Y100.79 E1.50184
G1 X107.21 Y100.79 E.2508
G1 X107.21 Y151.21 E1.50184
G1 X98.85 Y151.21 E.24902
; WIPE_START
M204 S5000
G1 X98.848 Y149.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.602 Y151.21 Z.9 F15000
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X97.602 Y151.602 E.01261
G1 X87.398 Y151.602 E.32813
G1 X87.398 Y100.398 E1.64654
G1 X97.602 Y100.398 E.32813
G1 X97.602 Y151.15 E1.632
M204 S250
G1 X97.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X87.79 Y151.21 E.28059
G1 X87.79 Y100.79 E1.50184
G1 X97.21 Y100.79 E.28059
G1 X97.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X95.21 Y151.163 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.841 Y151.29 Z.9 F15000
G1 X169.398 Y152.398 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X86.602 Y152.398 E2.66241
G1 X86.602 Y99.602 E1.69772
G1 X169.398 Y99.602 E2.66241
G1 X169.398 Y152.338 E1.69579
M204 S250
G1 X169.79 Y152.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.21 Y152.79 E2.48956
G1 X86.21 Y99.21 E1.59597
M73 P69 R4
G1 X169.79 Y99.21 E2.48956
G1 X169.79 Y152.73 E1.59418
; WIPE_START
M204 S5000
G1 X167.79 Y152.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X160.16 Y152.532 Z.9 F15000
G1 X138 Y151.951 Z.9
G1 Z.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.50462
G1 F7500
G1 X137.903 Y151.976 E.00365
; LINE_WIDTH: 0.45602
G1 X137.806 Y152 E.00327
; LINE_WIDTH: 0.43172
G1 X128.194 Y152 E.29518
; LINE_WIDTH: 0.486806
G1 X128 Y151.951 E.00703
G1 X128 Y151.878 E.00256
; LINE_WIDTH: 0.456036
G1 X128 Y151.806 E.00238
; LINE_WIDTH: 0.43174
G1 X128 Y100.194 E1.58519
; LINE_WIDTH: 0.490231
G1 X128 Y100.049 E.00515
G1 X128.097 Y100.024 E.00354
; LINE_WIDTH: 0.456025
G1 X128.194 Y100 E.00327
; LINE_WIDTH: 0.431971
G1 X137.806 Y100 E.29537
G1 X137.903 Y100.024 E.00308
; LINE_WIDTH: 0.50462
G1 X138 Y100.049 E.00365
G1 X138.097 Y100.024 E.00365
; LINE_WIDTH: 0.45602
G1 X138.194 Y100 E.00327
; LINE_WIDTH: 0.43172
G1 X168.806 Y100 E.94014
; LINE_WIDTH: 0.470635
G1 X168.967 Y100.033 E.00556
G1 X168.983 Y100.114 E.00278
; LINE_WIDTH: 0.448395
G1 X169 Y100.194 E.00263
; LINE_WIDTH: 0.43172
G1 X169 Y151.806 E1.5851
; LINE_WIDTH: 0.470635
G1 X168.967 Y151.967 E.00556
G1 X168.886 Y151.983 E.00278
; LINE_WIDTH: 0.448395
G1 X168.806 Y152 E.00263
; LINE_WIDTH: 0.43172
G1 X138.194 Y152 E.94014
; LINE_WIDTH: 0.486803
G1 X138 Y151.951 E.00703
G1 X138 Y151.879 E.00256
; LINE_WIDTH: 0.45602
G1 X138 Y151.806 E.00238
; LINE_WIDTH: 0.431755
G1 X138 Y100.121 E1.58748
; LINE_WIDTH: 0.50462
G1 X138 Y100.109 E.00047
; WIPE_START
G1 X138.097 Y100.024 E-.04889
G1 X138.194 Y100 E-.03807
G1 X139.966 Y100 E-.67303
; WIPE_END
G1 E-.04 F1800
G1 X132.333 Y100.031 Z.9 F15000
G1 X128 Y100.049 Z.9
M73 P69 R3
G1 Z.5
G1 E.8 F1800
; LINE_WIDTH: 0.504623
G1 F7500
G1 X127.903 Y100.024 E.00365
; LINE_WIDTH: 0.431971
G1 X127.806 Y100 E.00308
M73 P70 R3
G1 X118.194 Y100 E.29537
; LINE_WIDTH: 0.45602
G1 X118.097 Y100.024 E.00327
; LINE_WIDTH: 0.490218
G1 X118 Y100.049 E.00354
G1 X118 Y100.194 E.00515
; LINE_WIDTH: 0.43172
G1 X118 Y151.806 E1.5851
; LINE_WIDTH: 0.45602
G1 X118 Y151.879 E.00238
; LINE_WIDTH: 0.486803
G1 X118 Y151.951 E.00256
G1 X118.194 Y152 E.00703
; LINE_WIDTH: 0.43172
G1 X127.806 Y152 E.29518
; LINE_WIDTH: 0.456025
G1 X127.903 Y151.976 E.00327
; LINE_WIDTH: 0.504635
G1 X128 Y151.951 E.00365
; WIPE_START
G1 X127.903 Y151.976 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.27 Y151.957 Z.9 F15000
G1 X118 Y151.951 Z.9
G1 Z.5
G1 E.8 F1800
; LINE_WIDTH: 0.50462
G1 F7500
G1 X117.903 Y151.976 E.00365
; LINE_WIDTH: 0.45602
G1 X117.806 Y152 E.00327
; LINE_WIDTH: 0.43172
G1 X108.194 Y152 E.29518
; LINE_WIDTH: 0.486803
G1 X108 Y151.951 E.00703
G1 X108 Y151.879 E.00256
; LINE_WIDTH: 0.45602
G1 X108 Y151.806 E.00238
; LINE_WIDTH: 0.43172
G1 X108 Y100.194 E1.5851
; LINE_WIDTH: 0.490218
G1 X108 Y100.049 E.00515
G1 X108.097 Y100.024 E.00354
; LINE_WIDTH: 0.45602
G1 X108.194 Y100 E.00327
; LINE_WIDTH: 0.431971
G1 X117.806 Y100 E.29537
G1 X117.903 Y100.024 E.00308
; LINE_WIDTH: 0.50462
G1 X118 Y100.049 E.00365
; WIPE_START
G1 X117.903 Y100.024 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.27 Y100.043 Z.9 F15000
G1 X108 Y100.049 Z.9
G1 Z.5
G1 E.8 F1800
G1 F7500
G1 X107.903 Y100.024 E.00365
; LINE_WIDTH: 0.431971
G1 X107.806 Y100 E.00308
G1 X98.194 Y100 E.29537
; LINE_WIDTH: 0.45602
G1 X98.097 Y100.024 E.00327
; LINE_WIDTH: 0.490218
G1 X98 Y100.049 E.00354
G1 X98 Y100.194 E.00515
; LINE_WIDTH: 0.43172
G1 X98 Y151.806 E1.5851
; LINE_WIDTH: 0.45602
G1 X98 Y151.879 E.00238
; LINE_WIDTH: 0.486803
G1 X98 Y151.951 E.00256
G1 X98.194 Y152 E.00703
; LINE_WIDTH: 0.43172
G1 X107.806 Y152 E.29518
; LINE_WIDTH: 0.45602
G1 X107.903 Y151.976 E.00327
; LINE_WIDTH: 0.50462
G1 X108 Y151.951 E.00365
; WIPE_START
G1 X107.903 Y151.976 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.27 Y151.957 Z.9 F15000
G1 X98 Y151.951 Z.9
G1 Z.5
G1 E.8 F1800
G1 F7500
G1 X97.903 Y151.976 E.00365
; LINE_WIDTH: 0.45602
G1 X97.806 Y152 E.00327
; LINE_WIDTH: 0.43172
G1 X87.194 Y152 E.3259
; LINE_WIDTH: 0.470635
G1 X87.033 Y151.967 E.00556
G1 X87.017 Y151.886 E.00278
; LINE_WIDTH: 0.448395
G1 X87 Y151.806 E.00263
; LINE_WIDTH: 0.43172
G1 X87 Y100.194 E1.5851
; LINE_WIDTH: 0.470635
G1 X87.033 Y100.033 E.00556
G1 X87.114 Y100.017 E.00278
; LINE_WIDTH: 0.448395
G1 X87.194 Y100 E.00263
; LINE_WIDTH: 0.431948
G1 X97.806 Y100 E.32609
G1 X97.903 Y100.024 E.00308
; LINE_WIDTH: 0.50462
G1 X98 Y100.049 E.00365
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X97.903 Y100.024 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/9
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.9 I1.217 J0 P1  F15000
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
; OBJECT_ID: 92
G1 X137.602 Y151.21
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X137.602 Y151.602 E.01261
G1 X128.398 Y151.602 E.29597
G1 X128.398 Y100.398 E1.64654
G1 X137.602 Y100.398 E.29597
G1 X137.602 Y151.15 E1.632
M204 S250
G1 X137.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X128.79 Y151.21 E.2508
G1 X128.79 Y100.79 E1.50184
G1 X137.21 Y100.79 E.2508
G1 X137.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X135.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.842 Y151.175 Z1.1 F15000
G1 X168.602 Y151.21 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X168.602 Y151.602 E.01261
G1 X138.398 Y151.602 E.97126
G1 X138.398 Y100.398 E1.64654
G1 X168.602 Y100.398 E.97126
G1 X168.602 Y151.15 E1.632
M204 S250
G1 X168.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.79 Y151.21 E.87632
G1 X138.79 Y100.79 E1.50184
G1 X168.21 Y100.79 E.87632
G1 X168.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X166.21 Y151.154 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X158.578 Y151.165 Z1.1 F15000
G1 X127.602 Y151.21 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P71 R3
G1 X127.602 Y151.602 E.01261
G1 X118.398 Y151.602 E.29597
G1 X118.398 Y100.398 E1.64654
G1 X127.602 Y100.398 E.29597
G1 X127.602 Y151.15 E1.632
M204 S250
G1 X127.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X118.79 Y151.21 E.2508
G1 X118.79 Y100.79 E1.50184
G1 X127.21 Y100.79 E.2508
G1 X127.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X125.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.602 Y151.21 Z1.1 F15000
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X117.602 Y151.602 E.01261
G1 X108.398 Y151.602 E.29597
G1 X108.398 Y100.398 E1.64654
G1 X117.602 Y100.398 E.29597
G1 X117.602 Y151.15 E1.632
M204 S250
G1 X117.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X108.79 Y151.21 E.2508
G1 X108.79 Y100.79 E1.50184
G1 X117.21 Y100.79 E.2508
G1 X117.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X115.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.58 Y151.368 Z1.1 F15000
G1 X98.79 Y151.602 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.398 Y151.602 E.01261
G1 X98.398 Y100.398 E1.64654
G1 X107.602 Y100.398 E.29597
G1 X107.602 Y151.602 E1.64654
G1 X98.85 Y151.602 E.28143
M204 S250
G1 X98.79 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X98.79 Y100.79 E1.50184
G1 X107.21 Y100.79 E.2508
G1 X107.21 Y151.21 E1.50184
G1 X98.85 Y151.21 E.24902
; WIPE_START
M204 S5000
G1 X98.848 Y149.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.602 Y151.21 Z1.1 F15000
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X97.602 Y151.602 E.01261
G1 X87.398 Y151.602 E.32813
G1 X87.398 Y100.398 E1.64654
G1 X97.602 Y100.398 E.32813
G1 X97.602 Y151.15 E1.632
M204 S250
G1 X97.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
M73 P72 R3
G1 X87.79 Y151.21 E.28059
G1 X87.79 Y100.79 E1.50184
G1 X97.21 Y100.79 E.28059
G1 X97.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X95.21 Y151.163 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.841 Y151.29 Z1.1 F15000
G1 X169.398 Y152.398 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X86.602 Y152.398 E2.66241
G1 X86.602 Y99.602 E1.69772
G1 X169.398 Y99.602 E2.66241
G1 X169.398 Y152.338 E1.69579
M204 S250
G1 X169.79 Y152.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.21 Y152.79 E2.48956
G1 X86.21 Y99.21 E1.59597
G1 X169.79 Y99.21 E2.48956
G1 X169.79 Y152.73 E1.59418
; WIPE_START
M204 S5000
G1 X167.79 Y152.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X160.16 Y152.532 Z1.1 F15000
G1 X138 Y151.951 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.50462
G1 F7500
G1 X137.903 Y151.976 E.00365
; LINE_WIDTH: 0.45602
G1 X137.806 Y152 E.00327
; LINE_WIDTH: 0.43172
G1 X128.194 Y152 E.29518
; LINE_WIDTH: 0.486806
G1 X128 Y151.951 E.00703
G1 X128 Y151.878 E.00256
; LINE_WIDTH: 0.456036
G1 X128 Y151.806 E.00238
; LINE_WIDTH: 0.43174
G1 X128 Y100.194 E1.58519
; LINE_WIDTH: 0.490231
G1 X128 Y100.049 E.00515
G1 X128.097 Y100.024 E.00354
; LINE_WIDTH: 0.456025
G1 X128.194 Y100 E.00327
; LINE_WIDTH: 0.431971
G1 X137.806 Y100 E.29537
G1 X137.903 Y100.024 E.00308
; LINE_WIDTH: 0.50462
G1 X138 Y100.049 E.00365
G1 X138.097 Y100.024 E.00365
; LINE_WIDTH: 0.45602
G1 X138.194 Y100 E.00327
; LINE_WIDTH: 0.43172
G1 X168.806 Y100 E.94014
; LINE_WIDTH: 0.470635
G1 X168.967 Y100.033 E.00556
G1 X168.983 Y100.114 E.00278
; LINE_WIDTH: 0.448395
G1 X169 Y100.194 E.00263
; LINE_WIDTH: 0.43172
G1 X169 Y151.806 E1.5851
; LINE_WIDTH: 0.470635
G1 X168.967 Y151.967 E.00556
G1 X168.886 Y151.983 E.00278
; LINE_WIDTH: 0.448395
G1 X168.806 Y152 E.00263
; LINE_WIDTH: 0.43172
G1 X138.194 Y152 E.94014
; LINE_WIDTH: 0.486803
G1 X138 Y151.951 E.00703
G1 X138 Y151.879 E.00256
; LINE_WIDTH: 0.45602
M73 P73 R3
G1 X138 Y151.806 E.00238
; LINE_WIDTH: 0.431755
G1 X138 Y100.121 E1.58748
; LINE_WIDTH: 0.50462
G1 X138 Y100.109 E.00047
; WIPE_START
G1 X138.097 Y100.024 E-.04889
G1 X138.194 Y100 E-.03807
G1 X139.966 Y100 E-.67303
; WIPE_END
G1 E-.04 F1800
G1 X132.333 Y100.031 Z1.1 F15000
G1 X128 Y100.049 Z1.1
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.504623
G1 F7500
G1 X127.903 Y100.024 E.00365
; LINE_WIDTH: 0.431971
G1 X127.806 Y100 E.00308
G1 X118.194 Y100 E.29537
; LINE_WIDTH: 0.45602
G1 X118.097 Y100.024 E.00327
; LINE_WIDTH: 0.490218
G1 X118 Y100.049 E.00354
G1 X118 Y100.194 E.00515
; LINE_WIDTH: 0.43172
G1 X118 Y151.806 E1.5851
; LINE_WIDTH: 0.45602
G1 X118 Y151.879 E.00238
; LINE_WIDTH: 0.486803
G1 X118 Y151.951 E.00256
G1 X118.194 Y152 E.00703
; LINE_WIDTH: 0.43172
G1 X127.806 Y152 E.29518
; LINE_WIDTH: 0.456025
G1 X127.903 Y151.976 E.00327
; LINE_WIDTH: 0.504635
G1 X128 Y151.951 E.00365
; WIPE_START
G1 X127.903 Y151.976 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.27 Y151.957 Z1.1 F15000
G1 X118 Y151.951 Z1.1
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.50462
G1 F7500
G1 X117.903 Y151.976 E.00365
; LINE_WIDTH: 0.45602
G1 X117.806 Y152 E.00327
; LINE_WIDTH: 0.43172
G1 X108.194 Y152 E.29518
; LINE_WIDTH: 0.486803
G1 X108 Y151.951 E.00703
G1 X108 Y151.879 E.00256
; LINE_WIDTH: 0.45602
G1 X108 Y151.806 E.00238
; LINE_WIDTH: 0.43172
G1 X108 Y100.194 E1.5851
; LINE_WIDTH: 0.490218
G1 X108 Y100.049 E.00515
G1 X108.097 Y100.024 E.00354
; LINE_WIDTH: 0.45602
G1 X108.194 Y100 E.00327
; LINE_WIDTH: 0.431971
G1 X117.806 Y100 E.29537
G1 X117.903 Y100.024 E.00308
; LINE_WIDTH: 0.50462
G1 X118 Y100.049 E.00365
; WIPE_START
G1 X117.903 Y100.024 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.27 Y100.043 Z1.1 F15000
G1 X108 Y100.049 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F7500
M73 P74 R3
G1 X107.903 Y100.024 E.00365
; LINE_WIDTH: 0.431971
G1 X107.806 Y100 E.00308
G1 X98.194 Y100 E.29537
; LINE_WIDTH: 0.45602
G1 X98.097 Y100.024 E.00327
; LINE_WIDTH: 0.490218
G1 X98 Y100.049 E.00354
G1 X98 Y100.194 E.00515
; LINE_WIDTH: 0.43172
G1 X98 Y151.806 E1.5851
; LINE_WIDTH: 0.45602
G1 X98 Y151.879 E.00238
; LINE_WIDTH: 0.486803
G1 X98 Y151.951 E.00256
G1 X98.194 Y152 E.00703
; LINE_WIDTH: 0.43172
G1 X107.806 Y152 E.29518
; LINE_WIDTH: 0.45602
G1 X107.903 Y151.976 E.00327
; LINE_WIDTH: 0.50462
G1 X108 Y151.951 E.00365
; WIPE_START
G1 X107.903 Y151.976 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.27 Y151.957 Z1.1 F15000
G1 X98 Y151.951 Z1.1
G1 Z.7
G1 E.8 F1800
G1 F7500
G1 X97.903 Y151.976 E.00365
; LINE_WIDTH: 0.45602
G1 X97.806 Y152 E.00327
; LINE_WIDTH: 0.43172
G1 X87.194 Y152 E.3259
; LINE_WIDTH: 0.470635
G1 X87.033 Y151.967 E.00556
G1 X87.017 Y151.886 E.00278
; LINE_WIDTH: 0.448395
G1 X87 Y151.806 E.00263
; LINE_WIDTH: 0.43172
G1 X87 Y100.194 E1.5851
; LINE_WIDTH: 0.470635
G1 X87.033 Y100.033 E.00556
G1 X87.114 Y100.017 E.00278
; LINE_WIDTH: 0.448395
G1 X87.194 Y100 E.00263
; LINE_WIDTH: 0.431948
G1 X97.806 Y100 E.32609
G1 X97.903 Y100.024 E.00308
; LINE_WIDTH: 0.50462
G1 X98 Y100.049 E.00365
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X97.903 Y100.024 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/9
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S51
G17
G3 Z1.1 I1.217 J0 P1  F15000
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
; OBJECT_ID: 92
G1 X137.602 Y151.21
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X137.602 Y151.602 E.01261
G1 X128.398 Y151.602 E.29597
G1 X128.398 Y100.398 E1.64654
G1 X137.602 Y100.398 E.29597
G1 X137.602 Y151.15 E1.632
M204 S250
G1 X137.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X128.79 Y151.21 E.2508
G1 X128.79 Y100.79 E1.50184
G1 X137.21 Y100.79 E.2508
G1 X137.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X135.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.842 Y151.175 Z1.3 F15000
G1 X168.602 Y151.21 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X168.602 Y151.602 E.01261
G1 X138.398 Y151.602 E.97126
G1 X138.398 Y100.398 E1.64654
G1 X168.602 Y100.398 E.97126
G1 X168.602 Y151.15 E1.632
M204 S250
G1 X168.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.79 Y151.21 E.87632
G1 X138.79 Y100.79 E1.50184
G1 X168.21 Y100.79 E.87632
G1 X168.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X166.21 Y151.154 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X158.578 Y151.165 Z1.3 F15000
G1 X127.602 Y151.21 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X127.602 Y151.602 E.01261
G1 X118.398 Y151.602 E.29597
G1 X118.398 Y100.398 E1.64654
G1 X127.602 Y100.398 E.29597
G1 X127.602 Y151.15 E1.632
M204 S250
G1 X127.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X118.79 Y151.21 E.2508
G1 X118.79 Y100.79 E1.50184
G1 X127.21 Y100.79 E.2508
G1 X127.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X125.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.602 Y151.21 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X117.602 Y151.602 E.01261
G1 X108.398 Y151.602 E.29597
G1 X108.398 Y100.398 E1.64654
G1 X117.602 Y100.398 E.29597
G1 X117.602 Y151.15 E1.632
M204 S250
G1 X117.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X108.79 Y151.21 E.2508
G1 X108.79 Y100.79 E1.50184
G1 X117.21 Y100.79 E.2508
G1 X117.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X115.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X107.58 Y151.368 Z1.3 F15000
G1 X98.79 Y151.602 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X98.398 Y151.602 E.01261
G1 X98.398 Y100.398 E1.64654
G1 X107.602 Y100.398 E.29597
G1 X107.602 Y151.602 E1.64654
G1 X98.85 Y151.602 E.28143
M204 S250
M73 P75 R3
G1 X98.79 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X98.79 Y100.79 E1.50184
G1 X107.21 Y100.79 E.2508
G1 X107.21 Y151.21 E1.50184
G1 X98.85 Y151.21 E.24902
; WIPE_START
M204 S5000
G1 X98.848 Y149.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.602 Y151.21 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X97.602 Y151.602 E.01261
G1 X87.398 Y151.602 E.32813
G1 X87.398 Y100.398 E1.64654
G1 X97.602 Y100.398 E.32813
G1 X97.602 Y151.15 E1.632
M204 S250
G1 X97.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X87.79 Y151.21 E.28059
G1 X87.79 Y100.79 E1.50184
G1 X97.21 Y100.79 E.28059
G1 X97.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X95.21 Y151.163 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.841 Y151.29 Z1.3 F15000
G1 X169.398 Y152.398 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X86.602 Y152.398 E2.66241
G1 X86.602 Y99.602 E1.69772
G1 X169.398 Y99.602 E2.66241
G1 X169.398 Y152.338 E1.69579
M204 S250
G1 X169.79 Y152.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.21 Y152.79 E2.48956
G1 X86.21 Y99.21 E1.59597
G1 X169.79 Y99.21 E2.48956
G1 X169.79 Y152.73 E1.59418
; WIPE_START
M204 S5000
G1 X167.79 Y152.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X160.16 Y152.532 Z1.3 F15000
G1 X138 Y151.951 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.50462
G1 F7500
G1 X137.903 Y151.976 E.00365
; LINE_WIDTH: 0.45602
G1 X137.806 Y152 E.00327
; LINE_WIDTH: 0.43172
G1 X128.194 Y152 E.29518
; LINE_WIDTH: 0.486806
G1 X128 Y151.951 E.00703
G1 X128 Y151.878 E.00256
; LINE_WIDTH: 0.456036
G1 X128 Y151.806 E.00238
; LINE_WIDTH: 0.43174
M73 P76 R3
G1 X128 Y100.194 E1.58519
; LINE_WIDTH: 0.490231
G1 X128 Y100.049 E.00515
G1 X128.097 Y100.024 E.00354
; LINE_WIDTH: 0.456025
G1 X128.194 Y100 E.00327
; LINE_WIDTH: 0.431971
G1 X137.806 Y100 E.29537
G1 X137.903 Y100.024 E.00308
; LINE_WIDTH: 0.50462
G1 X138 Y100.049 E.00365
G1 X138.097 Y100.024 E.00365
; LINE_WIDTH: 0.45602
G1 X138.194 Y100 E.00327
; LINE_WIDTH: 0.43172
G1 X168.806 Y100 E.94014
; LINE_WIDTH: 0.470635
G1 X168.967 Y100.033 E.00556
G1 X168.983 Y100.114 E.00278
; LINE_WIDTH: 0.448395
G1 X169 Y100.194 E.00263
; LINE_WIDTH: 0.43172
G1 X169 Y151.806 E1.5851
; LINE_WIDTH: 0.470635
G1 X168.967 Y151.967 E.00556
G1 X168.886 Y151.983 E.00278
; LINE_WIDTH: 0.448395
G1 X168.806 Y152 E.00263
; LINE_WIDTH: 0.43172
G1 X138.194 Y152 E.94014
; LINE_WIDTH: 0.486803
G1 X138 Y151.951 E.00703
G1 X138 Y151.879 E.00256
; LINE_WIDTH: 0.45602
G1 X138 Y151.806 E.00238
; LINE_WIDTH: 0.431755
G1 X138 Y100.121 E1.58748
; LINE_WIDTH: 0.50462
G1 X138 Y100.109 E.00047
; WIPE_START
G1 X138.097 Y100.024 E-.04889
G1 X138.194 Y100 E-.03807
G1 X139.966 Y100 E-.67303
; WIPE_END
G1 E-.04 F1800
G1 X132.333 Y100.031 Z1.3 F15000
G1 X128 Y100.049 Z1.3
G1 Z.9
G1 E.8 F1800
; LINE_WIDTH: 0.504623
G1 F7500
G1 X127.903 Y100.024 E.00365
; LINE_WIDTH: 0.431971
G1 X127.806 Y100 E.00308
G1 X118.194 Y100 E.29537
; LINE_WIDTH: 0.45602
G1 X118.097 Y100.024 E.00327
; LINE_WIDTH: 0.490218
M73 P77 R3
G1 X118 Y100.049 E.00354
G1 X118 Y100.194 E.00515
; LINE_WIDTH: 0.43172
G1 X118 Y151.806 E1.5851
; LINE_WIDTH: 0.45602
G1 X118 Y151.879 E.00238
; LINE_WIDTH: 0.486803
G1 X118 Y151.951 E.00256
G1 X118.194 Y152 E.00703
; LINE_WIDTH: 0.43172
G1 X127.806 Y152 E.29518
; LINE_WIDTH: 0.456025
G1 X127.903 Y151.976 E.00327
; LINE_WIDTH: 0.504635
G1 X128 Y151.951 E.00365
; WIPE_START
G1 X127.903 Y151.976 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.27 Y151.957 Z1.3 F15000
G1 X118 Y151.951 Z1.3
G1 Z.9
G1 E.8 F1800
; LINE_WIDTH: 0.50462
G1 F7500
G1 X117.903 Y151.976 E.00365
; LINE_WIDTH: 0.45602
G1 X117.806 Y152 E.00327
; LINE_WIDTH: 0.43172
G1 X108.194 Y152 E.29518
; LINE_WIDTH: 0.486803
G1 X108 Y151.951 E.00703
G1 X108 Y151.879 E.00256
; LINE_WIDTH: 0.45602
G1 X108 Y151.806 E.00238
; LINE_WIDTH: 0.43172
G1 X108 Y100.194 E1.5851
; LINE_WIDTH: 0.490218
G1 X108 Y100.049 E.00515
G1 X108.097 Y100.024 E.00354
; LINE_WIDTH: 0.45602
G1 X108.194 Y100 E.00327
; LINE_WIDTH: 0.431971
G1 X117.806 Y100 E.29537
G1 X117.903 Y100.024 E.00308
; LINE_WIDTH: 0.50462
G1 X118 Y100.049 E.00365
; WIPE_START
G1 X117.903 Y100.024 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.27 Y100.043 Z1.3 F15000
G1 X108 Y100.049 Z1.3
G1 Z.9
G1 E.8 F1800
G1 F7500
G1 X107.903 Y100.024 E.00365
; LINE_WIDTH: 0.431971
G1 X107.806 Y100 E.00308
G1 X98.194 Y100 E.29537
; LINE_WIDTH: 0.45602
G1 X98.097 Y100.024 E.00327
; LINE_WIDTH: 0.490218
G1 X98 Y100.049 E.00354
G1 X98 Y100.194 E.00515
; LINE_WIDTH: 0.43172
M73 P77 R2
G1 X98 Y151.806 E1.5851
; LINE_WIDTH: 0.45602
G1 X98 Y151.879 E.00238
; LINE_WIDTH: 0.486803
G1 X98 Y151.951 E.00256
G1 X98.194 Y152 E.00703
; LINE_WIDTH: 0.43172
G1 X107.806 Y152 E.29518
; LINE_WIDTH: 0.45602
G1 X107.903 Y151.976 E.00327
; LINE_WIDTH: 0.50462
G1 X108 Y151.951 E.00365
; WIPE_START
G1 X107.903 Y151.976 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.27 Y151.957 Z1.3 F15000
G1 X98 Y151.951 Z1.3
G1 Z.9
G1 E.8 F1800
G1 F7500
G1 X97.903 Y151.976 E.00365
; LINE_WIDTH: 0.45602
G1 X97.806 Y152 E.00327
; LINE_WIDTH: 0.43172
G1 X87.194 Y152 E.3259
; LINE_WIDTH: 0.470635
G1 X87.033 Y151.967 E.00556
G1 X87.017 Y151.886 E.00278
; LINE_WIDTH: 0.448395
G1 X87 Y151.806 E.00263
; LINE_WIDTH: 0.43172
G1 X87 Y100.194 E1.5851
; LINE_WIDTH: 0.470635
G1 X87.033 Y100.033 E.00556
G1 X87.114 Y100.017 E.00278
; LINE_WIDTH: 0.448395
G1 X87.194 Y100 E.00263
; LINE_WIDTH: 0.431948
G1 X97.806 Y100 E.32609
G1 X97.903 Y100.024 E.00308
; LINE_WIDTH: 0.50462
G1 X98 Y100.049 E.00365
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X97.903 Y100.024 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/9
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.3 I1.217 J0 P1  F15000
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
; OBJECT_ID: 92
G1 X98.79 Y151.21
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X98.79 Y100.79 E1.50184
G1 X107.21 Y100.79 E.2508
G1 X107.21 Y151.21 E1.50184
G1 X98.85 Y151.21 E.24902
; WIPE_START
M204 S5000
G1 X98.848 Y149.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.21 Y151.21 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X87.79 Y151.21 E.28059
G1 X87.79 Y100.79 E1.50184
G1 X97.21 Y100.79 E.28059
G1 X97.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X95.21 Y151.163 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.842 Y151.171 Z1.5 F15000
G1 X137.602 Y151.21 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X137.602 Y151.602 E.01261
G1 X128.398 Y151.602 E.29597
G1 X128.398 Y100.398 E1.64654
G1 X137.602 Y100.398 E.29597
G1 X137.602 Y151.15 E1.632
M204 S250
G1 X137.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X128.79 Y151.21 E.2508
G1 X128.79 Y100.79 E1.50184
G1 X137.21 Y100.79 E.2508
G1 X137.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X135.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.842 Y151.175 Z1.5 F15000
G1 X168.602 Y151.21 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X168.602 Y151.602 E.01261
G1 X138.398 Y151.602 E.97126
G1 X138.398 Y100.398 E1.64654
G1 X168.602 Y100.398 E.97126
G1 X168.602 Y151.15 E1.632
M204 S250
G1 X168.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.79 Y151.21 E.87632
G1 X138.79 Y100.79 E1.50184
G1 X168.21 Y100.79 E.87632
G1 X168.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X166.21 Y151.154 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X158.578 Y151.165 Z1.5 F15000
M73 P78 R2
G1 X127.602 Y151.21 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X127.602 Y151.602 E.01261
G1 X118.398 Y151.602 E.29597
G1 X118.398 Y100.398 E1.64654
G1 X127.602 Y100.398 E.29597
G1 X127.602 Y151.15 E1.632
M204 S250
G1 X127.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X118.79 Y151.21 E.2508
G1 X118.79 Y100.79 E1.50184
G1 X127.21 Y100.79 E.2508
G1 X127.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X125.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.602 Y151.21 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X117.602 Y151.602 E.01261
G1 X108.398 Y151.602 E.29597
G1 X108.398 Y100.398 E1.64654
G1 X117.602 Y100.398 E.29597
G1 X117.602 Y151.15 E1.632
M204 S250
G1 X117.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X108.79 Y151.21 E.2508
G1 X108.79 Y100.79 E1.50184
G1 X117.21 Y100.79 E.2508
G1 X117.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X115.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.841 Y151.338 Z1.5 F15000
G1 X169.398 Y152.398 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X102.668 Y152.398 E2.14579
G1 X102.668 Y151.602 E.02559
G1 X107.602 Y151.602 E.15866
G1 X107.602 Y100.398 E1.64654
G1 X102.668 Y100.398 E.15866
G1 X102.668 Y99.602 E.02559
G1 X169.398 Y99.602 E2.14579
G1 X169.398 Y152.338 E1.69579
M204 S250
G1 X169.79 Y152.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.21 Y152.79 E2.48956
G1 X86.21 Y99.21 E1.59597
G1 X169.79 Y99.21 E2.48956
G1 X169.79 Y152.73 E1.59418
; WIPE_START
M204 S5000
G1 X167.79 Y152.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X160.16 Y152.532 Z1.5 F15000
M73 P79 R2
G1 X138 Y151.951 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.50462
G1 F7500
G1 X137.903 Y151.976 E.00365
; LINE_WIDTH: 0.45602
G1 X137.806 Y152 E.00327
; LINE_WIDTH: 0.43172
G1 X128.194 Y152 E.29518
; LINE_WIDTH: 0.486806
G1 X128 Y151.951 E.00703
G1 X128 Y151.878 E.00256
; LINE_WIDTH: 0.456036
G1 X128 Y151.806 E.00238
; LINE_WIDTH: 0.43174
G1 X128 Y100.194 E1.58519
; LINE_WIDTH: 0.490231
G1 X128 Y100.049 E.00515
G1 X128.097 Y100.024 E.00354
; LINE_WIDTH: 0.456025
G1 X128.194 Y100 E.00327
; LINE_WIDTH: 0.431971
G1 X137.806 Y100 E.29537
G1 X137.903 Y100.024 E.00308
; LINE_WIDTH: 0.50462
G1 X138 Y100.049 E.00365
G1 X138.097 Y100.024 E.00365
; LINE_WIDTH: 0.45602
G1 X138.194 Y100 E.00327
; LINE_WIDTH: 0.43172
G1 X168.806 Y100 E.94014
; LINE_WIDTH: 0.470635
G1 X168.967 Y100.033 E.00556
G1 X168.983 Y100.114 E.00278
; LINE_WIDTH: 0.448395
G1 X169 Y100.194 E.00263
; LINE_WIDTH: 0.43172
G1 X169 Y151.806 E1.5851
; LINE_WIDTH: 0.470635
G1 X168.967 Y151.967 E.00556
G1 X168.886 Y151.983 E.00278
; LINE_WIDTH: 0.448395
G1 X168.806 Y152 E.00263
; LINE_WIDTH: 0.43172
G1 X138.194 Y152 E.94014
; LINE_WIDTH: 0.486803
G1 X138 Y151.951 E.00703
G1 X138 Y151.879 E.00256
; LINE_WIDTH: 0.45602
G1 X138 Y151.806 E.00238
; LINE_WIDTH: 0.431755
G1 X138 Y100.121 E1.58748
; LINE_WIDTH: 0.50462
G1 X138 Y100.109 E.00047
; WIPE_START
G1 X138.097 Y100.024 E-.04889
G1 X138.194 Y100 E-.03807
G1 X139.966 Y100 E-.67303
; WIPE_END
G1 E-.04 F1800
G1 X132.333 Y100.031 Z1.5 F15000
G1 X128 Y100.049 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.504623
G1 F7500
G1 X127.903 Y100.024 E.00365
; LINE_WIDTH: 0.431971
G1 X127.806 Y100 E.00308
G1 X118.194 Y100 E.29537
; LINE_WIDTH: 0.45602
M73 P80 R2
G1 X118.097 Y100.024 E.00327
; LINE_WIDTH: 0.490218
G1 X118 Y100.049 E.00354
G1 X118 Y100.194 E.00515
; LINE_WIDTH: 0.43172
G1 X118 Y151.806 E1.5851
; LINE_WIDTH: 0.45602
G1 X118 Y151.879 E.00238
; LINE_WIDTH: 0.486803
G1 X118 Y151.951 E.00256
G1 X118.194 Y152 E.00703
; LINE_WIDTH: 0.43172
G1 X127.806 Y152 E.29518
; LINE_WIDTH: 0.456025
G1 X127.903 Y151.976 E.00327
; LINE_WIDTH: 0.504635
G1 X128 Y151.951 E.00365
; WIPE_START
G1 X127.903 Y151.976 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.27 Y151.983 Z1.5 F15000
G1 X102.872 Y152 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.432204
G1 F7500
G1 X107.806 Y152 E.15172
G1 X107.903 Y151.976 E.00308
; LINE_WIDTH: 0.50462
G1 X108 Y151.951 E.00365
; WIPE_START
G1 X107.903 Y151.976 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.535 Y151.957 Z1.5 F15000
G1 X118 Y151.951 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F7500
G1 X117.903 Y151.976 E.00365
; LINE_WIDTH: 0.45602
G1 X117.806 Y152 E.00327
; LINE_WIDTH: 0.43172
G1 X108.194 Y152 E.29518
; LINE_WIDTH: 0.486803
G1 X108 Y151.951 E.00703
G1 X108 Y151.879 E.00256
; LINE_WIDTH: 0.45602
G1 X108 Y151.806 E.00238
; LINE_WIDTH: 0.43172
G1 X108 Y100.194 E1.5851
; LINE_WIDTH: 0.490218
G1 X108 Y100.049 E.00515
G1 X108.097 Y100.024 E.00354
; LINE_WIDTH: 0.45602
G1 X108.194 Y100 E.00327
; LINE_WIDTH: 0.431971
G1 X117.806 Y100 E.29537
G1 X117.903 Y100.024 E.00308
; LINE_WIDTH: 0.50462
G1 X118 Y100.049 E.00365
; WIPE_START
G1 X117.903 Y100.024 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.27 Y100.043 Z1.5 F15000
G1 X108 Y100.049 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F7500
G1 X107.903 Y100.024 E.00365
; LINE_WIDTH: 0.432204
G1 X107.806 Y100 E.00308
G1 X102.872 Y100 E.15172
G1 X102.446 Y100.179 F15000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X101.684 Y99.417 E.03208
G1 X101.151 Y99.417
G1 X102.316 Y100.583 E.04908
G1 X101.783 Y100.583
G1 X100.617 Y99.417 E.04908
G1 X100.084 Y99.417
G1 X101.249 Y100.583 E.04908
G1 X100.716 Y100.583
G1 X99.551 Y99.417 E.04908
G1 X99.018 Y99.417
G1 X100.183 Y100.583 E.04908
G1 X99.65 Y100.583
G1 X98.484 Y99.417 E.04908
G1 X97.951 Y99.417
G1 X99.116 Y100.583 E.04908
G1 X98.583 Y100.583
G1 X97.418 Y99.417 E.04908
G1 X96.885 Y99.417
G1 X98.583 Y101.115 E.07153
G1 X98.583 Y101.649
G1 X96.351 Y99.417 E.09399
G1 X95.818 Y99.417
G1 X96.983 Y100.583 E.04908
G1 X96.45 Y100.583
G1 X95.285 Y99.417 E.04908
G1 X94.752 Y99.417
G1 X95.917 Y100.583 E.04908
G1 X95.384 Y100.583
G1 X94.218 Y99.417 E.04908
G1 X93.685 Y99.417
G1 X94.85 Y100.583 E.04908
G1 X94.317 Y100.583
G1 X93.152 Y99.417 E.04908
G1 X92.619 Y99.417
G1 X93.784 Y100.583 E.04908
G1 X93.251 Y100.583
G1 X92.085 Y99.417 E.04908
G1 X91.552 Y99.417
G1 X92.717 Y100.583 E.04908
G1 X92.184 Y100.583
G1 X91.019 Y99.417 E.04908
G1 X90.486 Y99.417
G1 X91.651 Y100.583 E.04908
G1 X91.118 Y100.583
G1 X89.952 Y99.417 E.04908
G1 X89.419 Y99.417
G1 X90.584 Y100.583 E.04908
G1 X90.051 Y100.583
G1 X88.886 Y99.417 E.04908
G1 X88.353 Y99.417
G1 X89.518 Y100.583 E.04908
G1 X88.984 Y100.583
G1 X87.819 Y99.417 E.04908
G1 X87.286 Y99.417
G1 X88.451 Y100.583 E.04908
G1 X87.918 Y100.583
G1 X86.753 Y99.417 E.04908
G1 X86.417 Y99.615
G1 X87.583 Y100.781 E.04908
G1 X87.583 Y101.314
G1 X86.417 Y100.149 E.04908
G1 X86.417 Y100.682
G1 X87.583 Y101.847 E.04908
G1 X87.583 Y102.38
G1 X86.417 Y101.215 E.04908
G1 X86.417 Y101.748
G1 X87.583 Y102.914 E.04908
G1 X87.583 Y103.447
G1 X86.417 Y102.282 E.04908
G1 X86.417 Y102.815
G1 X87.583 Y103.98 E.04908
G1 X87.583 Y104.513
G1 X86.417 Y103.348 E.04908
G1 X86.417 Y103.881
G1 X87.583 Y105.047 E.04908
G1 X87.583 Y105.58
G1 X86.417 Y104.415 E.04908
G1 X86.417 Y104.948
G1 X87.583 Y106.113 E.04908
G1 X87.583 Y106.646
G1 X86.417 Y105.481 E.04908
G1 X86.417 Y106.014
G1 X87.583 Y107.18 E.04908
M73 P81 R2
G1 X87.583 Y107.713
G1 X86.417 Y106.548 E.04908
G1 X86.417 Y107.081
G1 X87.583 Y108.246 E.04908
G1 X87.583 Y108.779
G1 X86.417 Y107.614 E.04908
G1 X86.417 Y108.147
G1 X87.583 Y109.313 E.04908
G1 X87.583 Y109.846
G1 X86.417 Y108.681 E.04908
G1 X86.417 Y109.214
G1 X87.583 Y110.379 E.04908
G1 X87.583 Y110.912
G1 X86.417 Y109.747 E.04908
G1 X86.417 Y110.28
G1 X87.583 Y111.446 E.04908
G1 X87.583 Y111.979
G1 X86.417 Y110.814 E.04908
G1 X86.417 Y111.347
G1 X87.583 Y112.512 E.04908
G1 X87.583 Y113.045
G1 X86.417 Y111.88 E.04908
G1 X86.417 Y112.413
G1 X87.583 Y113.579 E.04908
G1 X87.583 Y114.112
G1 X86.417 Y112.947 E.04908
G1 X86.417 Y113.48
G1 X87.583 Y114.645 E.04908
G1 X87.583 Y115.178
G1 X86.417 Y114.013 E.04908
G1 X86.417 Y114.546
G1 X87.583 Y115.712 E.04908
G1 X87.583 Y116.245
G1 X86.417 Y115.08 E.04908
G1 X86.417 Y115.613
G1 X87.583 Y116.778 E.04908
G1 X87.583 Y117.311
G1 X86.417 Y116.146 E.04908
G1 X86.417 Y116.68
G1 X87.583 Y117.845 E.04908
G1 X87.583 Y118.378
G1 X86.417 Y117.213 E.04908
G1 X86.417 Y117.746
G1 X87.583 Y118.911 E.04908
G1 X87.583 Y119.445
G1 X86.417 Y118.279 E.04908
G1 X86.417 Y118.813
G1 X87.583 Y119.978 E.04908
G1 X87.583 Y120.511
G1 X86.417 Y119.346 E.04908
G1 X86.417 Y119.879
G1 X87.583 Y121.044 E.04908
G1 X87.583 Y121.578
G1 X86.417 Y120.412 E.04908
G1 X86.417 Y120.946
G1 X87.583 Y122.111 E.04908
G1 X87.583 Y122.644
G1 X86.417 Y121.479 E.04908
G1 X86.417 Y122.012
G1 X87.583 Y123.177 E.04908
G1 X87.583 Y123.711
G1 X86.417 Y122.545 E.04908
G1 X86.417 Y123.079
G1 X87.583 Y124.244 E.04908
G1 X87.583 Y124.777
G1 X86.417 Y123.612 E.04908
G1 X86.417 Y124.145
G1 X87.583 Y125.31 E.04908
G1 X87.583 Y125.844
G1 X86.417 Y124.678 E.04908
G1 X86.417 Y125.212
G1 X87.583 Y126.377 E.04908
G1 X87.583 Y126.91
G1 X86.417 Y125.745 E.04908
G1 X86.417 Y126.278
G1 X87.583 Y127.443 E.04908
G1 X87.583 Y127.977
G1 X86.417 Y126.811 E.04908
G1 X86.417 Y127.345
G1 X87.583 Y128.51 E.04908
G1 X87.583 Y129.043
G1 X86.417 Y127.878 E.04908
G1 X86.417 Y128.411
G1 X87.583 Y129.576 E.04908
G1 X87.583 Y130.11
G1 X86.417 Y128.944 E.04908
G1 X86.417 Y129.478
G1 X87.583 Y130.643 E.04908
G1 X87.583 Y131.176
G1 X86.417 Y130.011 E.04908
G1 X86.417 Y130.544
G1 X87.583 Y131.709 E.04908
G1 X87.583 Y132.243
G1 X86.417 Y131.077 E.04908
G1 X86.417 Y131.611
G1 X87.583 Y132.776 E.04908
G1 X87.583 Y133.309
G1 X86.417 Y132.144 E.04908
G1 X86.417 Y132.677
G1 X87.583 Y133.842 E.04908
G1 X87.583 Y134.376
G1 X86.417 Y133.211 E.04908
G1 X86.417 Y133.744
G1 X87.583 Y134.909 E.04908
G1 X87.583 Y135.442
G1 X86.417 Y134.277 E.04908
G1 X86.417 Y134.81
G1 X87.583 Y135.976 E.04908
G1 X87.583 Y136.509
G1 X86.417 Y135.344 E.04908
G1 X86.417 Y135.877
G1 X87.583 Y137.042 E.04908
G1 X87.583 Y137.575
G1 X86.417 Y136.41 E.04908
G1 X86.417 Y136.943
G1 X87.583 Y138.109 E.04908
G1 X87.583 Y138.642
G1 X86.417 Y137.477 E.04908
G1 X86.417 Y138.01
G1 X87.583 Y139.175 E.04908
G1 X87.583 Y139.708
G1 X86.417 Y138.543 E.04908
G1 X86.417 Y139.076
G1 X87.583 Y140.242 E.04908
G1 X87.583 Y140.775
G1 X86.417 Y139.61 E.04908
G1 X86.417 Y140.143
G1 X87.583 Y141.308 E.04908
G1 X87.583 Y141.841
G1 X86.417 Y140.676 E.04908
G1 X86.417 Y141.209
G1 X87.583 Y142.375 E.04908
G1 X87.583 Y142.908
G1 X86.417 Y141.743 E.04908
G1 X86.417 Y142.276
G1 X87.583 Y143.441 E.04908
G1 X87.583 Y143.974
G1 X86.417 Y142.809 E.04908
G1 X86.417 Y143.342
G1 X87.583 Y144.508 E.04908
G1 X87.583 Y145.041
G1 X86.417 Y143.876 E.04908
G1 X86.417 Y144.409
G1 X87.583 Y145.574 E.04908
G1 X87.583 Y146.107
G1 X86.417 Y144.942 E.04908
G1 X86.417 Y145.475
G1 X87.583 Y146.641 E.04908
G1 X87.583 Y147.174
G1 X86.417 Y146.009 E.04908
G1 X86.417 Y146.542
G1 X87.583 Y147.707 E.04908
G1 X87.583 Y148.24
G1 X86.417 Y147.075 E.04908
G1 X86.417 Y147.608
G1 X87.583 Y148.774 E.04908
G1 X87.583 Y149.307
G1 X86.417 Y148.142 E.04908
G1 X86.417 Y148.675
G1 X87.583 Y149.84 E.04908
G1 X87.583 Y150.373
G1 X86.417 Y149.208 E.04908
G1 X86.417 Y149.741
G1 X87.583 Y150.907 E.04908
; WIPE_START
M204 S5000
G1 X86.417 Y149.741 E-.6262
G1 X86.417 Y149.389 E-.13381
; WIPE_END
G1 E-.04 F1800
G1 X88.322 Y141.998 Z1.5 F15000
G1 X98.583 Y102.182 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X97.417 Y101.017 E.04908
M73 P82 R2
G1 X97.417 Y101.55
G1 X98.583 Y102.715 E.04908
G1 X98.583 Y103.248
G1 X97.417 Y102.083 E.04908
G1 X97.417 Y102.616
G1 X98.583 Y103.782 E.04908
G1 X98.583 Y104.315
G1 X97.417 Y103.15 E.04908
G1 X97.417 Y103.683
G1 X98.583 Y104.848 E.04908
G1 X98.583 Y105.381
G1 X97.417 Y104.216 E.04908
G1 X97.417 Y104.749
G1 X98.583 Y105.915 E.04908
G1 X98.583 Y106.448
G1 X97.417 Y105.283 E.04908
G1 X97.417 Y105.816
G1 X98.583 Y106.981 E.04908
G1 X98.583 Y107.514
G1 X97.417 Y106.349 E.04908
G1 X97.417 Y106.882
G1 X98.583 Y108.048 E.04908
G1 X98.583 Y108.581
G1 X97.417 Y107.416 E.04908
G1 X97.417 Y107.949
G1 X98.583 Y109.114 E.04908
G1 X98.583 Y109.647
G1 X97.417 Y108.482 E.04908
G1 X97.417 Y109.016
G1 X98.583 Y110.181 E.04908
G1 X98.583 Y110.714
G1 X97.417 Y109.549 E.04908
G1 X97.417 Y110.082
G1 X98.583 Y111.247 E.04908
G1 X98.583 Y111.781
G1 X97.417 Y110.615 E.04908
G1 X97.417 Y111.149
G1 X98.583 Y112.314 E.04908
G1 X98.583 Y112.847
G1 X97.417 Y111.682 E.04908
G1 X97.417 Y112.215
G1 X98.583 Y113.38 E.04908
G1 X98.583 Y113.914
G1 X97.417 Y112.748 E.04908
G1 X97.417 Y113.282
G1 X98.583 Y114.447 E.04908
G1 X98.583 Y114.98
G1 X97.417 Y113.815 E.04908
G1 X97.417 Y114.348
G1 X98.583 Y115.513 E.04908
G1 X98.583 Y116.047
G1 X97.417 Y114.881 E.04908
G1 X97.417 Y115.415
G1 X98.583 Y116.58 E.04908
G1 X98.583 Y117.113
G1 X97.417 Y115.948 E.04908
G1 X97.417 Y116.481
G1 X98.583 Y117.646 E.04908
G1 X98.583 Y118.18
G1 X97.417 Y117.014 E.04908
G1 X97.417 Y117.548
G1 X98.583 Y118.713 E.04908
G1 X98.583 Y119.246
G1 X97.417 Y118.081 E.04908
G1 X97.417 Y118.614
G1 X98.583 Y119.779 E.04908
G1 X98.583 Y120.313
G1 X97.417 Y119.147 E.04908
G1 X97.417 Y119.681
G1 X98.583 Y120.846 E.04908
G1 X98.583 Y121.379
G1 X97.417 Y120.214 E.04908
G1 X97.417 Y120.747
G1 X98.583 Y121.912 E.04908
G1 X98.583 Y122.446
G1 X97.417 Y121.28 E.04908
G1 X97.417 Y121.814
G1 X98.583 Y122.979 E.04908
G1 X98.583 Y123.512
G1 X97.417 Y122.347 E.04908
G1 X97.417 Y122.88
G1 X98.583 Y124.045 E.04908
G1 X98.583 Y124.579
G1 X97.417 Y123.413 E.04908
G1 X97.417 Y123.947
G1 X98.583 Y125.112 E.04908
G1 X98.583 Y125.645
G1 X97.417 Y124.48 E.04908
G1 X97.417 Y125.013
G1 X98.583 Y126.178 E.04908
G1 X98.583 Y126.712
G1 X97.417 Y125.546 E.04908
G1 X97.417 Y126.08
G1 X98.583 Y127.245 E.04908
G1 X98.583 Y127.778
G1 X97.417 Y126.613 E.04908
G1 X97.417 Y127.146
G1 X98.583 Y128.311 E.04908
G1 X98.583 Y128.845
G1 X97.417 Y127.68 E.04908
G1 X97.417 Y128.213
G1 X98.583 Y129.378 E.04908
G1 X98.583 Y129.911
G1 X97.417 Y128.746 E.04908
G1 X97.417 Y129.279
G1 X98.583 Y130.445 E.04908
G1 X98.583 Y130.978
G1 X97.417 Y129.813 E.04908
G1 X97.417 Y130.346
G1 X98.583 Y131.511 E.04908
G1 X98.583 Y132.044
G1 X97.417 Y130.879 E.04908
G1 X97.417 Y131.412
G1 X98.583 Y132.578 E.04908
G1 X98.583 Y133.111
G1 X97.417 Y131.946 E.04908
G1 X97.417 Y132.479
G1 X98.583 Y133.644 E.04908
G1 X98.583 Y134.177
G1 X97.417 Y133.012 E.04908
G1 X97.417 Y133.545
G1 X98.583 Y134.711 E.04908
G1 X98.583 Y135.244
G1 X97.417 Y134.079 E.04908
G1 X97.417 Y134.612
G1 X98.583 Y135.777 E.04908
G1 X98.583 Y136.31
G1 X97.417 Y135.145 E.04908
G1 X97.417 Y135.678
G1 X98.583 Y136.844 E.04908
G1 X98.583 Y137.377
G1 X97.417 Y136.212 E.04908
G1 X97.417 Y136.745
G1 X98.583 Y137.91 E.04908
G1 X98.583 Y138.443
G1 X97.417 Y137.278 E.04908
G1 X97.417 Y137.811
G1 X98.583 Y138.977 E.04908
G1 X98.583 Y139.51
G1 X97.417 Y138.345 E.04908
G1 X97.417 Y138.878
G1 X98.583 Y140.043 E.04908
G1 X98.583 Y140.576
G1 X97.417 Y139.411 E.04908
G1 X97.417 Y139.944
G1 X98.583 Y141.11 E.04908
G1 X98.583 Y141.643
G1 X97.417 Y140.478 E.04908
G1 X97.417 Y141.011
G1 X98.583 Y142.176 E.04908
G1 X98.583 Y142.709
G1 X97.417 Y141.544 E.04908
G1 X97.417 Y142.077
G1 X98.583 Y143.243 E.04908
G1 X98.583 Y143.776
G1 X97.417 Y142.611 E.04908
G1 X97.417 Y143.144
G1 X98.583 Y144.309 E.04908
G1 X98.583 Y144.842
G1 X97.417 Y143.677 E.04908
G1 X97.417 Y144.21
G1 X98.583 Y145.376 E.04908
G1 X98.583 Y145.909
G1 X97.417 Y144.744 E.04908
G1 X97.417 Y145.277
G1 X98.583 Y146.442 E.04908
G1 X98.583 Y146.975
G1 X97.417 Y145.81 E.04908
G1 X97.417 Y146.344
G1 X98.583 Y147.509 E.04908
G1 X98.583 Y148.042
G1 X97.417 Y146.877 E.04908
M73 P83 R2
G1 X97.417 Y147.41
G1 X98.583 Y148.575 E.04908
G1 X98.583 Y149.109
G1 X97.417 Y147.943 E.04908
G1 X97.417 Y148.477
G1 X98.583 Y149.642 E.04908
G1 X98.583 Y150.175
G1 X97.417 Y149.01 E.04908
G1 X97.417 Y149.543
G1 X98.583 Y150.708 E.04908
G1 X98.583 Y151.242
G1 X97.417 Y150.076 E.04908
; WIPE_START
M204 S5000
G1 X98.583 Y151.242 E-.62619
G1 X98.583 Y150.889 E-.13381
; WIPE_END
G1 E-.04 F1800
G1 X101.958 Y151.417 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X102.446 Y151.905 E.02054
G1 X102.446 Y152.438
G1 X101.425 Y151.417 E.043
G1 X100.891 Y151.417
G1 X102.057 Y152.583 E.04908
G1 X101.523 Y152.583
G1 X100.358 Y151.417 E.04908
G1 X99.825 Y151.417
G1 X100.99 Y152.583 E.04908
G1 X100.457 Y152.583
G1 X99.292 Y151.417 E.04908
G1 X98.758 Y151.417
G1 X99.924 Y152.583 E.04908
G1 X99.39 Y152.583
G1 X97.417 Y150.61 E.08311
G1 X97.417 Y151.143
G1 X98.857 Y152.583 E.06065
G1 X98.324 Y152.583
G1 X97.159 Y151.417 E.04908
G1 X96.625 Y151.417
G1 X97.791 Y152.583 E.04908
G1 X97.257 Y152.583
G1 X96.092 Y151.417 E.04908
G1 X95.559 Y151.417
G1 X96.724 Y152.583 E.04908
G1 X96.191 Y152.583
G1 X95.026 Y151.417 E.04908
G1 X94.492 Y151.417
G1 X95.658 Y152.583 E.04908
G1 X95.124 Y152.583
G1 X93.959 Y151.417 E.04908
G1 X93.426 Y151.417
G1 X94.591 Y152.583 E.04908
G1 X94.058 Y152.583
G1 X92.893 Y151.417 E.04908
G1 X92.359 Y151.417
G1 X93.525 Y152.583 E.04908
G1 X92.991 Y152.583
G1 X91.826 Y151.417 E.04908
G1 X91.293 Y151.417
G1 X92.458 Y152.583 E.04908
G1 X91.925 Y152.583
G1 X90.76 Y151.417 E.04908
G1 X90.226 Y151.417
G1 X91.392 Y152.583 E.04908
G1 X90.858 Y152.583
G1 X89.693 Y151.417 E.04908
G1 X89.16 Y151.417
G1 X90.325 Y152.583 E.04908
G1 X89.792 Y152.583
G1 X88.627 Y151.417 E.04908
G1 X88.093 Y151.417
G1 X89.259 Y152.583 E.04908
G1 X88.725 Y152.583
G1 X86.417 Y150.275 E.09722
G1 X86.417 Y150.808
G1 X88.192 Y152.583 E.07475
G1 X87.659 Y152.583
G1 X86.417 Y151.341 E.05229
G1 X86.417 Y151.875
G1 X87.125 Y152.583 E.02983
; WIPE_START
M204 S5000
G1 X86.417 Y151.875 E-.38053
G1 X86.417 Y151.341 E-.20264
G1 X86.746 Y151.67 E-.17683
; WIPE_END
G1 E-.04 F1800
G1 X94.378 Y151.554 Z1.5 F15000
G1 X98.688 Y151.488 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.156276
G1 F7500
G3 X98.512 Y151.312 I.051 J-.227 E.00235
; WIPE_START
G1 X98.548 Y151.399 E-.27138
G1 X98.601 Y151.452 E-.21732
G1 X98.688 Y151.488 E-.27131
; WIPE_END
G1 E-.04 F1800
G1 X98.675 Y143.855 Z1.5 F15000
G1 X98.601 Y100.775 Z1.5
G1 Z1.1
G1 E.8 F1800
; LINE_WIDTH: 0.101104
G1 F7500
G1 X98.573 Y100.798 E.00017
G1 X98.481 Y100.685 E.00067
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X98.573 Y100.798 E-.60598
G1 X98.601 Y100.775 E-.15402
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/9
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.5 I1.217 J0 P1  F15000
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
; OBJECT_ID: 92
G1 X127.21 Y151.21
G1 Z1.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X118.79 Y151.21 E.2508
G1 X118.79 Y100.79 E1.50184
G1 X127.21 Y100.79 E.2508
G1 X127.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X125.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.578 Y151.208 Z1.7 F15000
G1 X117.21 Y151.21 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X108.79 Y151.21 E.2508
G1 X108.79 Y100.79 E1.50184
G1 X117.21 Y100.79 E.2508
G1 X117.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X115.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.842 Y151.18 Z1.7 F15000
G1 X137.602 Y151.21 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X137.602 Y151.602 E.01261
G1 X128.398 Y151.602 E.29597
G1 X128.398 Y100.398 E1.64654
G1 X137.602 Y100.398 E.29597
G1 X137.602 Y151.15 E1.632
M204 S250
G1 X137.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X128.79 Y151.21 E.2508
G1 X128.79 Y100.79 E1.50184
G1 X137.21 Y100.79 E.2508
G1 X137.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X135.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.842 Y151.175 Z1.7 F15000
G1 X168.602 Y151.21 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X168.602 Y151.602 E.01261
G1 X138.398 Y151.602 E.97126
G1 X138.398 Y100.398 E1.64654
G1 X168.602 Y100.398 E.97126
G1 X168.602 Y151.15 E1.632
M204 S250
G1 X168.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.79 Y151.21 E.87632
G1 X138.79 Y100.79 E1.50184
G1 X168.21 Y100.79 E.87632
G1 X168.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X166.21 Y151.154 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.102 Y145.483 Z1.7 F15000
M73 P84 R2
G1 X119.776 Y99.602 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X169.398 Y99.602 E1.59565
G1 X169.398 Y152.398 E1.69772
G1 X119.77 Y152.398 E1.59584
G1 X119.77 Y151.602 E.02559
G1 X127.602 Y151.602 E.25184
G1 X127.602 Y100.398 E1.64654
G1 X119.77 Y100.398 E.25184
G1 X119.77 Y99.656 E.02386
; WIPE_START
G1 X121.77 Y99.654 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.161 Y100.248 Z1.7 F15000
G1 X107.21 Y100.79 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X101.8 Y100.79 E.16114
G1 X101.8 Y99.21 E.04706
G1 X169.79 Y99.21 E2.02518
G1 X169.79 Y152.79 E1.59597
G1 X101.8 Y152.79 E2.02518
G1 X101.8 Y151.21 E.04706
G1 X107.21 Y151.21 E.16114
G1 X107.21 Y100.85 E1.50005
; WIPE_START
M204 S5000
G1 X105.21 Y100.828 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X112.831 Y100.401 Z1.7 F15000
G1 X119.974 Y100 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.432027
G1 F7500
G1 X127.806 Y100 E.24072
G1 X127.903 Y100.024 E.00308
; LINE_WIDTH: 0.504623
G1 X128 Y100.049 E.00365
; WIPE_START
G1 X127.903 Y100.024 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.535 Y100.043 Z1.7 F15000
G1 X138 Y100.049 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.50462
G1 F7500
G1 X138.097 Y100.024 E.00365
; LINE_WIDTH: 0.45602
G1 X138.194 Y100 E.00327
; LINE_WIDTH: 0.43172
G1 X168.806 Y100 E.94014
; LINE_WIDTH: 0.470635
G1 X168.967 Y100.033 E.00556
G1 X168.983 Y100.114 E.00278
; LINE_WIDTH: 0.448395
G1 X169 Y100.194 E.00263
; LINE_WIDTH: 0.43172
M73 P84 R1
G1 X169 Y151.806 E1.5851
; LINE_WIDTH: 0.470635
M73 P85 R1
G1 X168.967 Y151.967 E.00556
G1 X168.886 Y151.983 E.00278
; LINE_WIDTH: 0.448395
G1 X168.806 Y152 E.00263
; LINE_WIDTH: 0.43172
G1 X138.194 Y152 E.94014
; LINE_WIDTH: 0.486803
G1 X138 Y151.951 E.00703
G1 X138 Y151.879 E.00256
; LINE_WIDTH: 0.45602
G1 X138 Y151.806 E.00238
; LINE_WIDTH: 0.431755
G1 X138 Y100.121 E1.58748
; LINE_WIDTH: 0.50462
G1 X138 Y100.109 E.00047
G1 X138 Y100.049 F15000
G1 F7500
G1 X137.903 Y100.024 E.00365
; LINE_WIDTH: 0.431971
G1 X137.806 Y100 E.00308
G1 X128.194 Y100 E.29537
; LINE_WIDTH: 0.456025
G1 X128.097 Y100.024 E.00327
; LINE_WIDTH: 0.490231
G1 X128 Y100.049 E.00354
G1 X128 Y100.194 E.00515
; LINE_WIDTH: 0.43174
G1 X128 Y151.806 E1.58519
; LINE_WIDTH: 0.456036
G1 X128 Y151.878 E.00238
; LINE_WIDTH: 0.486806
G1 X128 Y151.951 E.00256
G1 X128.194 Y152 E.00703
; LINE_WIDTH: 0.43172
G1 X137.806 Y152 E.29518
; LINE_WIDTH: 0.45602
G1 X137.903 Y151.976 E.00327
; LINE_WIDTH: 0.50462
G1 X138 Y151.951 E.00365
; WIPE_START
G1 X137.903 Y151.976 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.27 Y151.957 Z1.7 F15000
G1 X128 Y151.951 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.504635
G1 F7500
G1 X127.903 Y151.976 E.00365
; LINE_WIDTH: 0.432027
G1 X127.806 Y152 E.00308
G1 X119.974 Y152 E.24072
; WIPE_START
G1 X121.974 Y152 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.748 Y152.583 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X119.548 Y151.783 E.03369
G1 X119.38 Y151.417
G1 X118.215 Y152.583 E.04908
G1 X117.682 Y152.583
G1 X118.847 Y151.417 E.04908
G1 X118.583 Y151.148
G1 X117.148 Y152.583 E.06042
G1 X116.615 Y152.583
G1 X118.583 Y150.615 E.08288
; WIPE_START
M204 S5000
G1 X117.168 Y152.029 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.417 Y151.247 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X118.583 Y150.082 E.04908
G1 X118.583 Y149.549
G1 X117.417 Y150.714 E.04908
G1 X117.417 Y150.181
G1 X118.583 Y149.015 E.04908
G1 X118.583 Y148.482
G1 X117.417 Y149.647 E.04908
G1 X117.417 Y149.114
G1 X118.583 Y147.949 E.04908
G1 X118.583 Y147.416
G1 X117.417 Y148.581 E.04908
G1 X117.417 Y148.048
G1 X118.583 Y146.882 E.04908
G1 X118.583 Y146.349
G1 X117.417 Y147.514 E.04908
G1 X117.417 Y146.981
G1 X118.583 Y145.816 E.04908
G1 X118.583 Y145.283
G1 X117.417 Y146.448 E.04908
G1 X117.417 Y145.915
G1 X118.583 Y144.749 E.04908
G1 X118.583 Y144.216
G1 X117.417 Y145.381 E.04908
G1 X117.417 Y144.848
G1 X118.583 Y143.683 E.04908
G1 X118.583 Y143.15
G1 X117.417 Y144.315 E.04908
G1 X117.417 Y143.782
G1 X118.583 Y142.616 E.04908
G1 X118.583 Y142.083
G1 X117.417 Y143.248 E.04908
G1 X117.417 Y142.715
G1 X118.583 Y141.55 E.04908
G1 X118.583 Y141.017
G1 X117.417 Y142.182 E.04908
G1 X117.417 Y141.648
G1 X118.583 Y140.483 E.04908
G1 X118.583 Y139.95
G1 X117.417 Y141.115 E.04908
G1 X117.417 Y140.582
G1 X118.583 Y139.417 E.04908
M73 P86 R1
G1 X118.583 Y138.883
G1 X117.417 Y140.049 E.04908
G1 X117.417 Y139.515
G1 X118.583 Y138.35 E.04908
G1 X118.583 Y137.817
G1 X117.417 Y138.982 E.04908
G1 X117.417 Y138.449
G1 X118.583 Y137.284 E.04908
G1 X118.583 Y136.75
G1 X117.417 Y137.916 E.04908
G1 X117.417 Y137.382
G1 X118.583 Y136.217 E.04908
G1 X118.583 Y135.684
G1 X117.417 Y136.849 E.04908
G1 X117.417 Y136.316
G1 X118.583 Y135.151 E.04908
G1 X118.583 Y134.617
G1 X117.417 Y135.783 E.04908
G1 X117.417 Y135.249
G1 X118.583 Y134.084 E.04908
G1 X118.583 Y133.551
G1 X117.417 Y134.716 E.04908
G1 X117.417 Y134.183
G1 X118.583 Y133.018 E.04908
G1 X118.583 Y132.484
G1 X117.417 Y133.65 E.04908
G1 X117.417 Y133.116
G1 X118.583 Y131.951 E.04908
G1 X118.583 Y131.418
G1 X117.417 Y132.583 E.04908
G1 X117.417 Y132.05
G1 X118.583 Y130.885 E.04908
G1 X118.583 Y130.351
G1 X117.417 Y131.517 E.04908
G1 X117.417 Y130.983
G1 X118.583 Y129.818 E.04908
G1 X118.583 Y129.285
G1 X117.417 Y130.45 E.04908
G1 X117.417 Y129.917
G1 X118.583 Y128.752 E.04908
G1 X118.583 Y128.218
G1 X117.417 Y129.384 E.04908
G1 X117.417 Y128.85
G1 X118.583 Y127.685 E.04908
G1 X118.583 Y127.152
G1 X117.417 Y128.317 E.04908
G1 X117.417 Y127.784
G1 X118.583 Y126.619 E.04908
G1 X118.583 Y126.085
G1 X117.417 Y127.251 E.04908
G1 X117.417 Y126.717
G1 X118.583 Y125.552 E.04908
G1 X118.583 Y125.019
G1 X117.417 Y126.184 E.04908
G1 X117.417 Y125.651
G1 X118.583 Y124.486 E.04908
G1 X118.583 Y123.952
G1 X117.417 Y125.118 E.04908
G1 X117.417 Y124.584
G1 X118.583 Y123.419 E.04908
G1 X118.583 Y122.886
G1 X117.417 Y124.051 E.04908
G1 X117.417 Y123.518
G1 X118.583 Y122.353 E.04908
G1 X118.583 Y121.819
G1 X117.417 Y122.984 E.04908
G1 X117.417 Y122.451
G1 X118.583 Y121.286 E.04908
G1 X118.583 Y120.753
G1 X117.417 Y121.918 E.04908
G1 X117.417 Y121.385
G1 X118.583 Y120.219 E.04908
G1 X118.583 Y119.686
G1 X117.417 Y120.851 E.04908
G1 X117.417 Y120.318
G1 X118.583 Y119.153 E.04908
G1 X118.583 Y118.62
G1 X117.417 Y119.785 E.04908
G1 X117.417 Y119.252
G1 X118.583 Y118.086 E.04908
G1 X118.583 Y117.553
G1 X117.417 Y118.718 E.04908
G1 X117.417 Y118.185
G1 X118.583 Y117.02 E.04908
G1 X118.583 Y116.487
G1 X117.417 Y117.652 E.04908
G1 X117.417 Y117.119
G1 X118.583 Y115.953 E.04908
G1 X118.583 Y115.42
G1 X117.417 Y116.585 E.04908
G1 X117.417 Y116.052
G1 X118.583 Y114.887 E.04908
G1 X118.583 Y114.354
G1 X117.417 Y115.519 E.04908
G1 X117.417 Y114.986
G1 X118.583 Y113.82 E.04908
G1 X118.583 Y113.287
G1 X117.417 Y114.452 E.04908
G1 X117.417 Y113.919
G1 X118.583 Y112.754 E.04908
G1 X118.583 Y112.221
G1 X117.417 Y113.386 E.04908
G1 X117.417 Y112.853
G1 X118.583 Y111.687 E.04908
G1 X118.583 Y111.154
G1 X117.417 Y112.319 E.04908
G1 X117.417 Y111.786
G1 X118.583 Y110.621 E.04908
G1 X118.583 Y110.088
G1 X117.417 Y111.253 E.04908
G1 X117.417 Y110.72
G1 X118.583 Y109.554 E.04908
G1 X118.583 Y109.021
G1 X117.417 Y110.186 E.04908
G1 X117.417 Y109.653
G1 X118.583 Y108.488 E.04908
G1 X118.583 Y107.955
G1 X117.417 Y109.12 E.04908
G1 X117.417 Y108.587
G1 X118.583 Y107.421 E.04908
G1 X118.583 Y106.888
G1 X117.417 Y108.053 E.04908
G1 X117.417 Y107.52
G1 X118.583 Y106.355 E.04908
G1 X118.583 Y105.822
G1 X117.417 Y106.987 E.04908
G1 X117.417 Y106.454
G1 X118.583 Y105.288 E.04908
G1 X118.583 Y104.755
G1 X117.417 Y105.92 E.04908
G1 X117.417 Y105.387
G1 X118.583 Y104.222 E.04908
G1 X118.583 Y103.689
G1 X117.417 Y104.854 E.04908
G1 X117.417 Y104.32
G1 X118.583 Y103.155 E.04908
G1 X118.583 Y102.622
G1 X117.417 Y103.787 E.04908
G1 X117.417 Y103.254
G1 X118.583 Y102.089 E.04908
G1 X118.583 Y101.555
G1 X117.417 Y102.721 E.04908
G1 X117.417 Y102.187
G1 X118.583 Y101.022 E.04908
G1 X119.022 Y100.583
G1 X119.548 Y100.057 E.02215
G1 X119.548 Y99.524
G1 X117.417 Y101.654 E.08975
G1 X117.417 Y101.121
G1 X119.121 Y99.417 E.07176
G1 X118.588 Y99.417
G1 X117.417 Y100.588 E.0493
G1 X116.889 Y100.583
G1 X118.054 Y99.417 E.04908
G1 X117.521 Y99.417
G1 X116.356 Y100.583 E.04908
G1 X115.823 Y100.583
G1 X116.988 Y99.417 E.04909
G1 X116.455 Y99.417
G1 X115.289 Y100.583 E.04909
G1 X114.756 Y100.583
G1 X115.921 Y99.417 E.04908
G1 X115.388 Y99.417
G1 X114.223 Y100.583 E.04908
G1 X113.69 Y100.583
G1 X114.855 Y99.417 E.04909
G1 X114.322 Y99.417
G1 X113.156 Y100.583 E.04909
G1 X112.623 Y100.583
G1 X113.788 Y99.417 E.04908
G1 X113.255 Y99.417
G1 X112.09 Y100.583 E.04908
G1 X111.557 Y100.583
G1 X112.722 Y99.417 E.04908
G1 X112.189 Y99.417
M73 P87 R1
G1 X111.023 Y100.583 E.04908
G1 X110.49 Y100.583
G1 X111.655 Y99.417 E.04908
G1 X111.122 Y99.417
G1 X109.957 Y100.583 E.04908
G1 X109.424 Y100.583
G1 X110.589 Y99.417 E.04908
G1 X110.056 Y99.417
G1 X108.89 Y100.583 E.04908
; WIPE_START
M204 S5000
G1 X110.056 Y99.417 E-.62619
G1 X110.408 Y99.417 E-.13381
; WIPE_END
G1 E-.04 F1800
G1 X111.403 Y106.985 Z1.7 F15000
G1 X117.247 Y151.417 Z1.7
G1 Z1.3
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X116.082 Y152.583 E.04908
G1 X115.549 Y152.583
G1 X116.714 Y151.417 E.04908
G1 X116.181 Y151.417
G1 X115.015 Y152.583 E.04909
G1 X114.482 Y152.583
G1 X115.647 Y151.417 E.04909
G1 X115.114 Y151.417
G1 X113.949 Y152.583 E.04908
G1 X113.416 Y152.583
G1 X114.581 Y151.417 E.04908
G1 X114.048 Y151.417
G1 X112.882 Y152.583 E.04909
G1 X112.349 Y152.583
G1 X113.514 Y151.417 E.04909
G1 X112.981 Y151.417
G1 X111.816 Y152.583 E.04908
G1 X111.283 Y152.583
G1 X112.448 Y151.417 E.04908
G1 X111.915 Y151.417
G1 X110.749 Y152.583 E.04908
G1 X110.216 Y152.583
G1 X111.381 Y151.417 E.04908
G1 X110.848 Y151.417
G1 X109.683 Y152.583 E.04908
G1 X109.15 Y152.583
G1 X110.315 Y151.417 E.04908
G1 X109.782 Y151.417
G1 X108.616 Y152.583 E.04908
G1 X108.083 Y152.583
G1 X109.248 Y151.417 E.04908
G1 X108.715 Y151.417
G1 X107.55 Y152.583 E.04908
G1 X107.017 Y152.583
G1 X108.583 Y151.017 E.06597
G1 X108.583 Y150.483
G1 X106.483 Y152.583 E.08843
G1 X105.95 Y152.583
G1 X107.115 Y151.417 E.04908
G1 X106.582 Y151.417
G1 X105.417 Y152.583 E.04908
G1 X104.883 Y152.583
G1 X106.049 Y151.417 E.04908
G1 X105.515 Y151.417
G1 X104.35 Y152.583 E.04908
G1 X103.817 Y152.583
G1 X104.982 Y151.417 E.04908
G1 X104.449 Y151.417
G1 X103.284 Y152.583 E.04908
G1 X102.75 Y152.583
G1 X103.916 Y151.417 E.04908
G1 X103.382 Y151.417
G1 X102.217 Y152.583 E.04908
G1 X102.008 Y152.259
G1 X102.849 Y151.417 E.03545
; WIPE_START
M204 S5000
G1 X102.008 Y152.259 E-.45224
G1 X102.217 Y152.583 E-.14653
G1 X102.517 Y152.283 E-.16124
; WIPE_END
G1 E-.04 F1800
G1 X107.417 Y151.115 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X108.583 Y149.95 E.04908
G1 X108.583 Y149.417
G1 X107.417 Y150.582 E.04908
G1 X107.417 Y150.049
G1 X108.583 Y148.883 E.04908
G1 X108.583 Y148.35
G1 X107.417 Y149.515 E.04908
G1 X107.417 Y148.982
G1 X108.583 Y147.817 E.04908
G1 X108.583 Y147.284
G1 X107.417 Y148.449 E.04908
G1 X107.417 Y147.916
G1 X108.583 Y146.75 E.04908
G1 X108.583 Y146.217
G1 X107.417 Y147.382 E.04908
G1 X107.417 Y146.849
G1 X108.583 Y145.684 E.04908
G1 X108.583 Y145.151
G1 X107.417 Y146.316 E.04908
G1 X107.417 Y145.783
G1 X108.583 Y144.617 E.04908
G1 X108.583 Y144.084
G1 X107.417 Y145.249 E.04908
G1 X107.417 Y144.716
G1 X108.583 Y143.551 E.04908
G1 X108.583 Y143.018
G1 X107.417 Y144.183 E.04908
G1 X107.417 Y143.65
G1 X108.583 Y142.484 E.04908
G1 X108.583 Y141.951
G1 X107.417 Y143.116 E.04908
G1 X107.417 Y142.583
G1 X108.583 Y141.418 E.04908
G1 X108.583 Y140.885
G1 X107.417 Y142.05 E.04908
G1 X107.417 Y141.517
G1 X108.583 Y140.351 E.04908
G1 X108.583 Y139.818
G1 X107.417 Y140.983 E.04908
G1 X107.417 Y140.45
G1 X108.583 Y139.285 E.04908
G1 X108.583 Y138.752
G1 X107.417 Y139.917 E.04908
G1 X107.417 Y139.384
G1 X108.583 Y138.218 E.04908
G1 X108.583 Y137.685
G1 X107.417 Y138.85 E.04908
G1 X107.417 Y138.317
G1 X108.583 Y137.152 E.04908
G1 X108.583 Y136.619
G1 X107.417 Y137.784 E.04908
G1 X107.417 Y137.251
G1 X108.583 Y136.085 E.04908
G1 X108.583 Y135.552
G1 X107.417 Y136.717 E.04908
G1 X107.417 Y136.184
G1 X108.583 Y135.019 E.04908
G1 X108.583 Y134.486
G1 X107.417 Y135.651 E.04908
G1 X107.417 Y135.118
G1 X108.583 Y133.952 E.04908
G1 X108.583 Y133.419
G1 X107.417 Y134.584 E.04908
G1 X107.417 Y134.051
G1 X108.583 Y132.886 E.04908
G1 X108.583 Y132.353
G1 X107.417 Y133.518 E.04908
G1 X107.417 Y132.984
G1 X108.583 Y131.819 E.04908
G1 X108.583 Y131.286
G1 X107.417 Y132.451 E.04908
G1 X107.417 Y131.918
G1 X108.583 Y130.753 E.04908
G1 X108.583 Y130.219
G1 X107.417 Y131.385 E.04908
G1 X107.417 Y130.851
G1 X108.583 Y129.686 E.04908
G1 X108.583 Y129.153
G1 X107.417 Y130.318 E.04908
G1 X107.417 Y129.785
G1 X108.583 Y128.62 E.04908
G1 X108.583 Y128.086
G1 X107.417 Y129.252 E.04908
G1 X107.417 Y128.718
G1 X108.583 Y127.553 E.04908
G1 X108.583 Y127.02
G1 X107.417 Y128.185 E.04908
G1 X107.417 Y127.652
G1 X108.583 Y126.487 E.04908
G1 X108.583 Y125.953
G1 X107.417 Y127.119 E.04908
G1 X107.417 Y126.585
G1 X108.583 Y125.42 E.04908
G1 X108.583 Y124.887
G1 X107.417 Y126.052 E.04908
M73 P88 R1
G1 X107.417 Y125.519
G1 X108.583 Y124.354 E.04908
G1 X108.583 Y123.82
G1 X107.417 Y124.986 E.04908
G1 X107.417 Y124.452
G1 X108.583 Y123.287 E.04908
G1 X108.583 Y122.754
G1 X107.417 Y123.919 E.04908
G1 X107.417 Y123.386
G1 X108.583 Y122.221 E.04908
G1 X108.583 Y121.687
G1 X107.417 Y122.853 E.04908
G1 X107.417 Y122.319
G1 X108.583 Y121.154 E.04908
G1 X108.583 Y120.621
G1 X107.417 Y121.786 E.04908
G1 X107.417 Y121.253
G1 X108.583 Y120.088 E.04908
G1 X108.583 Y119.554
G1 X107.417 Y120.72 E.04908
G1 X107.417 Y120.186
G1 X108.583 Y119.021 E.04908
G1 X108.583 Y118.488
G1 X107.417 Y119.653 E.04908
G1 X107.417 Y119.12
G1 X108.583 Y117.955 E.04908
G1 X108.583 Y117.421
G1 X107.417 Y118.587 E.04908
G1 X107.417 Y118.053
G1 X108.583 Y116.888 E.04908
G1 X108.583 Y116.355
G1 X107.417 Y117.52 E.04908
G1 X107.417 Y116.987
G1 X108.583 Y115.822 E.04908
G1 X108.583 Y115.288
G1 X107.417 Y116.453 E.04908
G1 X107.417 Y115.92
G1 X108.583 Y114.755 E.04908
G1 X108.583 Y114.222
G1 X107.417 Y115.387 E.04908
G1 X107.417 Y114.854
G1 X108.583 Y113.688 E.04908
G1 X108.583 Y113.155
G1 X107.417 Y114.32 E.04908
G1 X107.417 Y113.787
G1 X108.583 Y112.622 E.04908
G1 X108.583 Y112.089
G1 X107.417 Y113.254 E.04908
G1 X107.417 Y112.721
G1 X108.583 Y111.555 E.04908
G1 X108.583 Y111.022
G1 X107.417 Y112.187 E.04908
G1 X107.417 Y111.654
G1 X108.583 Y110.489 E.04908
G1 X108.583 Y109.956
G1 X107.417 Y111.121 E.04908
G1 X107.417 Y110.588
G1 X108.583 Y109.422 E.04908
G1 X108.583 Y108.889
G1 X107.417 Y110.054 E.04908
G1 X107.417 Y109.521
G1 X108.583 Y108.356 E.04908
G1 X108.583 Y107.823
G1 X107.417 Y108.988 E.04908
G1 X107.417 Y108.455
G1 X108.583 Y107.289 E.04908
G1 X108.583 Y106.756
G1 X107.417 Y107.921 E.04908
G1 X107.417 Y107.388
G1 X108.583 Y106.223 E.04908
G1 X108.583 Y105.69
G1 X107.417 Y106.855 E.04908
G1 X107.417 Y106.322
G1 X108.583 Y105.156 E.04908
G1 X108.583 Y104.623
G1 X107.417 Y105.788 E.04908
G1 X107.417 Y105.255
G1 X108.583 Y104.09 E.04908
G1 X108.583 Y103.557
G1 X107.417 Y104.722 E.04908
G1 X107.417 Y104.189
G1 X108.583 Y103.023 E.04908
G1 X108.583 Y102.49
G1 X107.417 Y103.655 E.04908
G1 X107.417 Y103.122
G1 X108.583 Y101.957 E.04908
G1 X108.583 Y101.424
G1 X107.417 Y102.589 E.04908
G1 X107.417 Y102.056
G1 X108.583 Y100.89 E.04908
; WIPE_START
M204 S5000
G1 X107.417 Y102.056 E-.6262
G1 X107.417 Y102.408 E-.13381
; WIPE_END
G1 E-.04 F1800
G1 X107.417 Y101.522 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X109.522 Y99.417 E.08867
G1 X108.989 Y99.417
G1 X107.417 Y100.989 E.06621
G1 X107.291 Y100.583
G1 X108.456 Y99.417 E.04908
G1 X107.923 Y99.417
G1 X106.757 Y100.583 E.04908
G1 X106.224 Y100.583
G1 X107.389 Y99.417 E.04908
G1 X106.856 Y99.417
G1 X105.691 Y100.583 E.04908
G1 X105.158 Y100.583
G1 X106.323 Y99.417 E.04908
G1 X105.789 Y99.417
G1 X104.624 Y100.583 E.04908
G1 X104.091 Y100.583
G1 X105.256 Y99.417 E.04908
G1 X104.723 Y99.417
G1 X103.558 Y100.583 E.04908
G1 X103.024 Y100.583
G1 X104.19 Y99.417 E.04908
G1 X103.656 Y99.417
G1 X102.491 Y100.583 E.04908
G1 X102.008 Y100.533
G1 X103.123 Y99.417 E.04699
G1 X102.59 Y99.417
G1 X102.008 Y100 E.02453
; WIPE_START
M204 S5000
G1 X102.59 Y99.417 E-.31293
G1 X103.123 Y99.417 E-.20264
G1 X102.668 Y99.872 E-.24443
; WIPE_END
G1 E-.04 F1800
G1 X110.289 Y100.291 Z1.7 F15000
G1 X117.518 Y100.689 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101642
G1 F7500
G1 X117.428 Y100.803 E.00068
G1 X117.399 Y100.78 E.00017
; WIPE_START
G1 X117.428 Y100.803 E-.15382
G1 X117.518 Y100.689 E-.60618
; WIPE_END
G1 E-.04 F1800
G1 X117.514 Y108.321 Z1.7 F15000
G1 X117.488 Y151.317 Z1.7
G1 Z1.3
G1 E.8 F1800
; LINE_WIDTH: 0.159065
G1 F7500
G3 X117.317 Y151.488 I-.226 J-.056 E.00232
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X117.399 Y151.454 E-.2627
G1 X117.454 Y151.399 E-.2346
G1 X117.488 Y151.317 E-.2627
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/9
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S81.6
G17
G3 Z1.7 I1.217 J0 P1  F15000
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
; OBJECT_ID: 92
G1 X137.21 Y151.21
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X128.79 Y151.21 E.2508
G1 X128.79 Y100.79 E1.50184
G1 X137.21 Y100.79 E.2508
G1 X137.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X135.21 Y151.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.842 Y151.175 Z1.9 F15000
G1 X168.602 Y151.21 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X168.602 Y151.602 E.01261
G1 X138.398 Y151.602 E.97126
G1 X138.398 Y100.398 E1.64654
G1 X168.602 Y100.398 E.97126
G1 X168.602 Y151.15 E1.632
M204 S250
G1 X168.21 Y151.21 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.79 Y151.21 E.87632
G1 X138.79 Y100.79 E1.50184
G1 X168.21 Y100.79 E.87632
G1 X168.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X166.21 Y151.154 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X158.584 Y151.477 Z1.9 F15000
M73 P89 R1
G1 X136.881 Y152.398 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X136.873 Y152.398 E.00025
G1 X136.873 Y151.602 E.02559
G1 X137.602 Y151.602 E.02345
G1 X137.602 Y100.398 E1.64654
G1 X136.873 Y100.398 E.02345
G1 X136.873 Y99.602 E.02559
G1 X169.398 Y99.602 E1.04589
G1 X169.398 Y152.398 E1.69772
G1 X136.941 Y152.398 E1.04371
; WIPE_START
G1 X136.873 Y152.398 E-.02578
G1 X136.873 Y151.602 E-.30243
G1 X137.602 Y151.602 E-.27708
G1 X137.602 Y151.195 E-.15471
; WIPE_END
G1 E-.04 F1800
G1 X129.97 Y151.206 Z1.9 F15000
G1 X127.21 Y151.21 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X127.21 Y100.79 E1.50184
G1 X118.903 Y100.79 E.24745
G1 X118.903 Y99.21 E.04706
G1 X169.79 Y99.21 E1.51576
G1 X169.79 Y152.79 E1.59597
G1 X118.903 Y152.79 E1.51576
G1 X118.903 Y151.21 E.04706
G1 X127.15 Y151.21 E.24566
; WIPE_START
M204 S5000
G1 X127.152 Y149.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.658 Y150.594 Z1.9 F15000
G1 X138 Y151.21 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431755
G1 F7500
G1 X138 Y100.121 E1.56919
; LINE_WIDTH: 0.50462
G1 X138 Y100.049 E.00266
G1 X138.097 Y100.024 E.00365
; LINE_WIDTH: 0.45602
G1 X138.194 Y100 E.00327
; LINE_WIDTH: 0.43172
G1 X168.806 Y100 E.94014
; LINE_WIDTH: 0.470635
G1 X168.967 Y100.033 E.00556
G1 X168.983 Y100.114 E.00278
; LINE_WIDTH: 0.448395
G1 X169 Y100.194 E.00263
; LINE_WIDTH: 0.43172
G1 X169 Y151.806 E1.5851
; LINE_WIDTH: 0.470635
G1 X168.967 Y151.967 E.00556
G1 X168.886 Y151.983 E.00278
; LINE_WIDTH: 0.448395
G1 X168.806 Y152 E.00263
; LINE_WIDTH: 0.43172
G1 X138.194 Y152 E.94014
; LINE_WIDTH: 0.486803
G1 X138 Y151.951 E.00703
G1 X138 Y151.879 E.00256
; LINE_WIDTH: 0.45602
G1 X138 Y151.806 E.00238
; LINE_WIDTH: 0.431755
G1 X138 Y151.27 E.01645
; WIPE_START
G1 X138 Y149.27 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.665 Y141.645 Z1.9 F15000
G1 X135.812 Y99.417 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X136.65 Y100.255 E.0353
G1 X136.444 Y100.583
G1 X135.279 Y99.417 E.04908
G1 X134.746 Y99.417
G1 X135.911 Y100.583 E.04908
G1 X135.378 Y100.583
G1 X134.213 Y99.417 E.04908
G1 X133.679 Y99.417
G1 X134.845 Y100.583 E.04908
G1 X134.311 Y100.583
G1 X133.146 Y99.417 E.04908
G1 X132.613 Y99.417
G1 X133.778 Y100.583 E.04908
G1 X133.245 Y100.583
M73 P90 R1
G1 X132.08 Y99.417 E.04908
G1 X131.546 Y99.417
G1 X132.712 Y100.583 E.04908
G1 X132.178 Y100.583
G1 X131.013 Y99.417 E.04908
G1 X130.48 Y99.417
G1 X131.645 Y100.583 E.04908
G1 X131.112 Y100.583
G1 X129.947 Y99.417 E.04908
G1 X129.413 Y99.417
G1 X130.579 Y100.583 E.04908
G1 X130.045 Y100.583
G1 X128.88 Y99.417 E.04908
G1 X128.347 Y99.417
G1 X129.512 Y100.583 E.04908
G1 X128.979 Y100.583
G1 X127.814 Y99.417 E.04908
G1 X127.28 Y99.417
G1 X128.583 Y100.72 E.05486
G1 X128.583 Y101.253
G1 X126.747 Y99.417 E.07732
G1 X126.214 Y99.417
G1 X127.379 Y100.583 E.04908
G1 X126.846 Y100.583
G1 X125.681 Y99.417 E.04908
G1 X125.147 Y99.417
G1 X126.312 Y100.583 E.04908
G1 X125.779 Y100.583
G1 X124.614 Y99.417 E.04908
G1 X124.081 Y99.417
G1 X125.246 Y100.583 E.04908
G1 X124.713 Y100.583
G1 X123.547 Y99.417 E.04908
G1 X123.014 Y99.417
G1 X124.179 Y100.583 E.04908
G1 X123.646 Y100.583
G1 X122.481 Y99.417 E.04908
G1 X121.948 Y99.417
G1 X123.113 Y100.583 E.04908
G1 X122.58 Y100.583
G1 X121.414 Y99.417 E.04908
G1 X120.881 Y99.417
G1 X122.046 Y100.583 E.04908
G1 X121.513 Y100.583
G1 X120.348 Y99.417 E.04908
G1 X119.815 Y99.417
G1 X120.98 Y100.583 E.04908
G1 X120.447 Y100.583
G1 X119.281 Y99.417 E.04908
G1 X119.11 Y99.779
G1 X119.913 Y100.583 E.03384
; WIPE_START
M204 S5000
G1 X119.11 Y99.779 E-.43172
G1 X119.281 Y99.417 E-.15215
G1 X119.609 Y99.745 E-.17613
; WIPE_END
G1 E-.04 F1800
G1 X127.194 Y100.596 Z1.9 F15000
G1 X127.417 Y100.621 Z1.9
G1 Z1.5
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X128.583 Y101.786 E.04908
G1 X128.583 Y102.319
G1 X127.417 Y101.154 E.04908
G1 X127.417 Y101.687
G1 X128.583 Y102.853 E.04908
G1 X128.583 Y103.386
G1 X127.417 Y102.221 E.04908
G1 X127.417 Y102.754
G1 X128.583 Y103.919 E.04908
G1 X128.583 Y104.452
G1 X127.417 Y103.287 E.04908
G1 X127.417 Y103.821
G1 X128.583 Y104.986 E.04908
G1 X128.583 Y105.519
G1 X127.417 Y104.354 E.04908
G1 X127.417 Y104.887
G1 X128.583 Y106.052 E.04908
G1 X128.583 Y106.586
G1 X127.417 Y105.42 E.04908
G1 X127.417 Y105.954
G1 X128.583 Y107.119 E.04908
G1 X128.583 Y107.652
G1 X127.417 Y106.487 E.04908
G1 X127.417 Y107.02
G1 X128.583 Y108.185 E.04908
G1 X128.583 Y108.719
G1 X127.417 Y107.553 E.04908
G1 X127.417 Y108.087
G1 X128.583 Y109.252 E.04908
G1 X128.583 Y109.785
G1 X127.417 Y108.62 E.04908
G1 X127.417 Y109.153
G1 X128.583 Y110.318 E.04908
G1 X128.583 Y110.852
G1 X127.417 Y109.686 E.04908
G1 X127.417 Y110.22
G1 X128.583 Y111.385 E.04908
G1 X128.583 Y111.918
G1 X127.417 Y110.753 E.04908
G1 X127.417 Y111.286
G1 X128.583 Y112.451 E.04908
G1 X128.583 Y112.985
G1 X127.417 Y111.819 E.04908
G1 X127.417 Y112.353
G1 X128.583 Y113.518 E.04908
G1 X128.583 Y114.051
G1 X127.417 Y112.886 E.04908
G1 X127.417 Y113.419
G1 X128.583 Y114.584 E.04908
G1 X128.583 Y115.118
G1 X127.417 Y113.952 E.04908
G1 X127.417 Y114.486
G1 X128.583 Y115.651 E.04908
G1 X128.583 Y116.184
G1 X127.417 Y115.019 E.04908
G1 X127.417 Y115.552
G1 X128.583 Y116.717 E.04908
G1 X128.583 Y117.251
G1 X127.417 Y116.085 E.04908
G1 X127.417 Y116.619
G1 X128.583 Y117.784 E.04908
G1 X128.583 Y118.317
G1 X127.417 Y117.152 E.04908
G1 X127.417 Y117.685
G1 X128.583 Y118.85 E.04908
G1 X128.583 Y119.384
G1 X127.417 Y118.218 E.04908
G1 X127.417 Y118.752
G1 X128.583 Y119.917 E.04908
G1 X128.583 Y120.45
G1 X127.417 Y119.285 E.04908
M73 P91 R1
G1 X127.417 Y119.818
G1 X128.583 Y120.983 E.04908
G1 X128.583 Y121.517
G1 X127.417 Y120.351 E.04908
G1 X127.417 Y120.885
G1 X128.583 Y122.05 E.04908
G1 X128.583 Y122.583
G1 X127.417 Y121.418 E.04908
G1 X127.417 Y121.951
G1 X128.583 Y123.116 E.04908
G1 X128.583 Y123.65
G1 X127.417 Y122.485 E.04908
G1 X127.417 Y123.018
G1 X128.583 Y124.183 E.04908
G1 X128.583 Y124.716
G1 X127.417 Y123.551 E.04908
G1 X127.417 Y124.084
G1 X128.583 Y125.25 E.04908
G1 X128.583 Y125.783
G1 X127.417 Y124.618 E.04908
G1 X127.417 Y125.151
G1 X128.583 Y126.316 E.04908
G1 X128.583 Y126.849
G1 X127.417 Y125.684 E.04908
G1 X127.417 Y126.217
G1 X128.583 Y127.383 E.04908
G1 X128.583 Y127.916
G1 X127.417 Y126.751 E.04908
G1 X127.417 Y127.284
G1 X128.583 Y128.449 E.04908
G1 X128.583 Y128.982
G1 X127.417 Y127.817 E.04908
G1 X127.417 Y128.35
G1 X128.583 Y129.516 E.04908
G1 X128.583 Y130.049
G1 X127.417 Y128.884 E.04908
G1 X127.417 Y129.417
G1 X128.583 Y130.582 E.04908
G1 X128.583 Y131.115
G1 X127.417 Y129.95 E.04908
G1 X127.417 Y130.483
G1 X128.583 Y131.649 E.04908
G1 X128.583 Y132.182
G1 X127.417 Y131.017 E.04908
G1 X127.417 Y131.55
G1 X128.583 Y132.715 E.04908
G1 X128.583 Y133.248
G1 X127.417 Y132.083 E.04908
G1 X127.417 Y132.616
G1 X128.583 Y133.782 E.04908
G1 X128.583 Y134.315
G1 X127.417 Y133.15 E.04908
G1 X127.417 Y133.683
G1 X128.583 Y134.848 E.04908
G1 X128.583 Y135.381
G1 X127.417 Y134.216 E.04908
G1 X127.417 Y134.749
G1 X128.583 Y135.915 E.04908
G1 X128.583 Y136.448
G1 X127.417 Y135.283 E.04908
G1 X127.417 Y135.816
G1 X128.583 Y136.981 E.04908
G1 X128.583 Y137.514
G1 X127.417 Y136.349 E.04908
G1 X127.417 Y136.882
G1 X128.583 Y138.048 E.04908
G1 X128.583 Y138.581
G1 X127.417 Y137.416 E.04908
G1 X127.417 Y137.949
G1 X128.583 Y139.114 E.04908
G1 X128.583 Y139.647
G1 X127.417 Y138.482 E.04908
G1 X127.417 Y139.016
G1 X128.583 Y140.181 E.04908
G1 X128.583 Y140.714
G1 X127.417 Y139.549 E.04908
G1 X127.417 Y140.082
G1 X128.583 Y141.247 E.04908
G1 X128.583 Y141.781
G1 X127.417 Y140.615 E.04908
G1 X127.417 Y141.149
G1 X128.583 Y142.314 E.04908
G1 X128.583 Y142.847
G1 X127.417 Y141.682 E.04908
G1 X127.417 Y142.215
G1 X128.583 Y143.38 E.04908
G1 X128.583 Y143.914
G1 X127.417 Y142.748 E.04908
G1 X127.417 Y143.282
G1 X128.583 Y144.447 E.04908
G1 X128.583 Y144.98
G1 X127.417 Y143.815 E.04908
G1 X127.417 Y144.348
G1 X128.583 Y145.513 E.04908
G1 X128.583 Y146.047
G1 X127.417 Y144.881 E.04908
G1 X127.417 Y145.415
G1 X128.583 Y146.58 E.04908
G1 X128.583 Y147.113
G1 X127.417 Y145.948 E.04908
G1 X127.417 Y146.481
G1 X128.583 Y147.646 E.04908
G1 X128.583 Y148.18
G1 X127.417 Y147.014 E.04908
G1 X127.417 Y147.548
G1 X128.583 Y148.713 E.04908
G1 X128.583 Y149.246
G1 X127.417 Y148.081 E.04908
G1 X127.417 Y148.614
G1 X128.583 Y149.779 E.04908
G1 X128.583 Y150.313
G1 X127.417 Y149.147 E.04908
G1 X127.417 Y149.681
G1 X128.583 Y150.846 E.04908
G1 X128.583 Y151.379
G1 X127.417 Y150.214 E.04908
; WIPE_START
M204 S5000
G1 X128.583 Y151.379 E-.62619
G1 X128.583 Y151.027 E-.13381
; WIPE_END
G1 E-.04 F1800
G1 X136.086 Y151.417 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X136.65 Y151.981 E.02376
G1 X136.65 Y152.515
G1 X135.553 Y151.417 E.04622
G1 X135.02 Y151.417
G1 X136.185 Y152.583 E.04908
G1 X135.652 Y152.583
G1 X134.487 Y151.417 E.04908
G1 X133.953 Y151.417
G1 X135.119 Y152.583 E.04908
G1 X134.585 Y152.583
G1 X133.42 Y151.417 E.04908
G1 X132.887 Y151.417
G1 X134.052 Y152.583 E.04908
G1 X133.519 Y152.583
G1 X132.354 Y151.417 E.04908
G1 X131.82 Y151.417
G1 X132.986 Y152.583 E.04908
G1 X132.452 Y152.583
G1 X131.287 Y151.417 E.04908
G1 X130.754 Y151.417
G1 X131.919 Y152.583 E.04908
G1 X131.386 Y152.583
G1 X130.221 Y151.417 E.04908
G1 X129.687 Y151.417
G1 X130.853 Y152.583 E.04908
G1 X130.319 Y152.583
G1 X129.154 Y151.417 E.04908
G1 X128.621 Y151.417
G1 X129.786 Y152.583 E.04908
G1 X129.253 Y152.583
G1 X127.417 Y150.747 E.07732
G1 X127.417 Y151.28
G1 X128.72 Y152.583 E.05485
G1 X128.186 Y152.583
G1 X127.021 Y151.417 E.04908
G1 X126.488 Y151.417
G1 X127.653 Y152.583 E.04908
G1 X127.12 Y152.583
G1 X125.955 Y151.417 E.04908
G1 X125.421 Y151.417
G1 X126.587 Y152.583 E.04908
G1 X126.053 Y152.583
G1 X124.888 Y151.417 E.04908
G1 X124.355 Y151.417
G1 X125.52 Y152.583 E.04908
G1 X124.987 Y152.583
G1 X123.822 Y151.417 E.04908
G1 X123.288 Y151.417
G1 X124.454 Y152.583 E.04908
G1 X123.92 Y152.583
G1 X122.755 Y151.417 E.04908
G1 X122.222 Y151.417
G1 X123.387 Y152.583 E.04908
M73 P92 R1
G1 X122.854 Y152.583
G1 X121.689 Y151.417 E.04908
G1 X121.155 Y151.417
G1 X122.32 Y152.583 E.04908
G1 X121.787 Y152.583
G1 X120.622 Y151.417 E.04908
G1 X120.089 Y151.417
G1 X121.254 Y152.583 E.04908
G1 X120.721 Y152.583
G1 X119.555 Y151.417 E.04908
G1 X119.11 Y151.505
G1 X120.187 Y152.583 E.04538
G1 X119.654 Y152.583
G1 X119.11 Y152.038 E.02292
; WIPE_START
M204 S5000
G1 X119.654 Y152.583 E-.29241
G1 X120.187 Y152.583 E-.20264
G1 X119.694 Y152.09 E-.26495
; WIPE_END
G1 E-.04 F1800
G1 X127.305 Y151.514 Z1.9 F15000
G1 X128.582 Y151.418 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0970114
G1 F7500
G1 X128.468 Y151.531 E.00069
; WIPE_START
G1 X128.582 Y151.418 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.425 Y143.787 Z1.9 F15000
G1 X127.531 Y100.469 Z1.9
G1 Z1.5
G1 E.8 F1800
; LINE_WIDTH: 0.0946439
G1 F7500
G1 X127.418 Y100.582 E.00066
G1 X127.41 Y100.629 E.00019
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X127.418 Y100.582 E-.17186
G1 X127.531 Y100.469 E-.58814
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/9
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S99.45
G17
G3 Z1.9 I1.217 J0 P1  F15000
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
; OBJECT_ID: 92
G1 X168.21 Y151.21
G1 Z1.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.79 Y151.21 E.87632
G1 X138.79 Y100.79 E1.50184
G1 X168.21 Y100.79 E.87632
G1 X168.21 Y151.15 E1.50005
; WIPE_START
M204 S5000
G1 X166.21 Y151.154 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X158.617 Y151.926 Z2.1 F15000
G1 X153.98 Y152.398 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X153.975 Y152.398 E.00014
G1 X153.975 Y151.602 E.02559
G1 X168.602 Y151.602 E.47034
G1 X168.602 Y100.398 E1.64654
G1 X153.975 Y100.398 E.47034
G1 X153.975 Y99.602 E.02559
G1 X169.398 Y99.602 E.49594
G1 X169.398 Y152.398 E1.69772
G1 X154.04 Y152.398 E.49386
; WIPE_START
G1 X153.975 Y152.398 E-.02448
G1 X153.975 Y151.602 E-.30243
G1 X155.115 Y151.602 E-.43309
; WIPE_END
G1 E-.04 F1800
G1 X147.484 Y151.435 Z2.1 F15000
G1 X137.21 Y151.21 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X137.21 Y100.79 E1.50184
G1 X136.005 Y100.79 E.03589
G1 X136.005 Y99.21 E.04706
G1 X169.79 Y99.21 E1.00634
G1 X169.79 Y152.79 E1.59597
G1 X136.005 Y152.79 E1.00634
G1 X136.005 Y151.21 E.04706
G1 X137.15 Y151.21 E.0341
; WIPE_START
M204 S5000
G1 X137.152 Y149.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X144.661 Y150.58 Z2.1 F15000
G1 X153.753 Y152.24 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X153.41 Y152.583 E.01445
G1 X152.877 Y152.583
G1 X153.753 Y151.706 E.03691
G1 X153.509 Y151.417
G1 X152.343 Y152.583 E.04908
G1 X151.81 Y152.583
G1 X152.975 Y151.417 E.04908
M73 P92 R0
G1 X152.442 Y151.417
G1 X151.277 Y152.583 E.04908
G1 X150.744 Y152.583
G1 X151.909 Y151.417 E.04908
G1 X151.376 Y151.417
G1 X150.21 Y152.583 E.04908
G1 X149.677 Y152.583
G1 X150.842 Y151.417 E.04908
G1 X150.309 Y151.417
G1 X149.144 Y152.583 E.04908
G1 X148.611 Y152.583
G1 X149.776 Y151.417 E.04908
G1 X149.243 Y151.417
G1 X148.077 Y152.583 E.04908
G1 X147.544 Y152.583
G1 X148.709 Y151.417 E.04908
G1 X148.176 Y151.417
G1 X147.011 Y152.583 E.04908
G1 X146.478 Y152.583
G1 X147.643 Y151.417 E.04908
G1 X147.11 Y151.417
G1 X145.944 Y152.583 E.04908
G1 X145.411 Y152.583
G1 X146.576 Y151.417 E.04908
G1 X146.043 Y151.417
G1 X144.878 Y152.583 E.04908
G1 X144.345 Y152.583
G1 X145.51 Y151.417 E.04909
G1 X144.977 Y151.417
M73 P93 R0
G1 X143.811 Y152.583 E.04909
G1 X143.278 Y152.583
G1 X144.443 Y151.417 E.04908
G1 X143.91 Y151.417
G1 X142.745 Y152.583 E.04908
G1 X142.212 Y152.583
G1 X143.377 Y151.417 E.04909
G1 X142.843 Y151.417
G1 X141.678 Y152.583 E.04909
G1 X141.145 Y152.583
G1 X142.31 Y151.417 E.04908
G1 X141.777 Y151.417
G1 X140.612 Y152.583 E.04908
G1 X140.078 Y152.583
G1 X141.244 Y151.417 E.04909
G1 X140.71 Y151.417
G1 X139.545 Y152.583 E.04909
G1 X139.012 Y152.583
G1 X140.177 Y151.417 E.04908
G1 X139.644 Y151.417
G1 X138.479 Y152.583 E.04908
G1 X137.945 Y152.583
G1 X139.111 Y151.417 E.04909
G1 X138.583 Y151.412
G1 X137.412 Y152.583 E.0493
G1 X136.879 Y152.583
G1 X138.583 Y150.879 E.07177
G1 X138.583 Y150.346
G1 X136.346 Y152.583 E.09423
G1 X136.213 Y152.183
G1 X136.978 Y151.417 E.03223
G1 X137.417 Y150.978
G1 X138.583 Y149.812 E.04908
G1 X138.583 Y149.279
G1 X137.417 Y150.444 E.04908
G1 X137.417 Y149.911
G1 X138.583 Y148.746 E.04908
G1 X138.583 Y148.213
G1 X137.417 Y149.378 E.04908
G1 X137.417 Y148.845
G1 X138.583 Y147.679 E.04908
G1 X138.583 Y147.146
G1 X137.417 Y148.311 E.04908
G1 X137.417 Y147.778
G1 X138.583 Y146.613 E.04908
G1 X138.583 Y146.08
G1 X137.417 Y147.245 E.04908
G1 X137.417 Y146.712
G1 X138.583 Y145.546 E.04908
G1 X138.583 Y145.013
G1 X137.417 Y146.178 E.04908
G1 X137.417 Y145.645
G1 X138.583 Y144.48 E.04908
G1 X138.583 Y143.947
G1 X137.417 Y145.112 E.04908
G1 X137.417 Y144.579
G1 X138.583 Y143.413 E.04908
G1 X138.583 Y142.88
G1 X137.417 Y144.045 E.04908
G1 X137.417 Y143.512
G1 X138.583 Y142.347 E.04908
G1 X138.583 Y141.814
G1 X137.417 Y142.979 E.04908
G1 X137.417 Y142.446
G1 X138.583 Y141.28 E.04908
G1 X138.583 Y140.747
G1 X137.417 Y141.912 E.04908
G1 X137.417 Y141.379
G1 X138.583 Y140.214 E.04908
G1 X138.583 Y139.681
G1 X137.417 Y140.846 E.04908
G1 X137.417 Y140.312
G1 X138.583 Y139.147 E.04908
G1 X138.583 Y138.614
G1 X137.417 Y139.779 E.04908
G1 X137.417 Y139.246
G1 X138.583 Y138.081 E.04908
G1 X138.583 Y137.547
G1 X137.417 Y138.713 E.04908
G1 X137.417 Y138.179
G1 X138.583 Y137.014 E.04908
G1 X138.583 Y136.481
G1 X137.417 Y137.646 E.04908
G1 X137.417 Y137.113
G1 X138.583 Y135.948 E.04908
G1 X138.583 Y135.414
G1 X137.417 Y136.58 E.04908
G1 X137.417 Y136.046
G1 X138.583 Y134.881 E.04908
G1 X138.583 Y134.348
G1 X137.417 Y135.513 E.04908
G1 X137.417 Y134.98
G1 X138.583 Y133.815 E.04908
G1 X138.583 Y133.281
G1 X137.417 Y134.447 E.04908
G1 X137.417 Y133.913
G1 X138.583 Y132.748 E.04908
G1 X138.583 Y132.215
G1 X137.417 Y133.38 E.04908
G1 X137.417 Y132.847
G1 X138.583 Y131.682 E.04908
G1 X138.583 Y131.148
G1 X137.417 Y132.314 E.04908
G1 X137.417 Y131.78
G1 X138.583 Y130.615 E.04908
G1 X138.583 Y130.082
G1 X137.417 Y131.247 E.04908
G1 X137.417 Y130.714
G1 X138.583 Y129.549 E.04908
G1 X138.583 Y129.015
G1 X137.417 Y130.181 E.04908
G1 X137.417 Y129.647
G1 X138.583 Y128.482 E.04908
G1 X138.583 Y127.949
G1 X137.417 Y129.114 E.04908
G1 X137.417 Y128.581
G1 X138.583 Y127.416 E.04908
G1 X138.583 Y126.882
G1 X137.417 Y128.048 E.04908
G1 X137.417 Y127.514
G1 X138.583 Y126.349 E.04908
G1 X138.583 Y125.816
G1 X137.417 Y126.981 E.04908
G1 X137.417 Y126.448
G1 X138.583 Y125.283 E.04908
G1 X138.583 Y124.749
G1 X137.417 Y125.915 E.04908
G1 X137.417 Y125.381
G1 X138.583 Y124.216 E.04908
G1 X138.583 Y123.683
G1 X137.417 Y124.848 E.04908
G1 X137.417 Y124.315
G1 X138.583 Y123.15 E.04908
G1 X138.583 Y122.616
G1 X137.417 Y123.782 E.04908
G1 X137.417 Y123.248
G1 X138.583 Y122.083 E.04908
G1 X138.583 Y121.55
G1 X137.417 Y122.715 E.04908
G1 X137.417 Y122.182
G1 X138.583 Y121.017 E.04908
G1 X138.583 Y120.483
G1 X137.417 Y121.648 E.04908
G1 X137.417 Y121.115
G1 X138.583 Y119.95 E.04908
G1 X138.583 Y119.417
G1 X137.417 Y120.582 E.04908
G1 X137.417 Y120.049
G1 X138.583 Y118.883 E.04908
M73 P94 R0
G1 X138.583 Y118.35
G1 X137.417 Y119.515 E.04908
G1 X137.417 Y118.982
G1 X138.583 Y117.817 E.04908
G1 X138.583 Y117.284
G1 X137.417 Y118.449 E.04908
G1 X137.417 Y117.916
G1 X138.583 Y116.75 E.04908
G1 X138.583 Y116.217
G1 X137.417 Y117.382 E.04908
G1 X137.417 Y116.849
G1 X138.583 Y115.684 E.04908
G1 X138.583 Y115.151
G1 X137.417 Y116.316 E.04908
G1 X137.417 Y115.783
G1 X138.583 Y114.617 E.04908
G1 X138.583 Y114.084
G1 X137.417 Y115.249 E.04908
G1 X137.417 Y114.716
G1 X138.583 Y113.551 E.04908
G1 X138.583 Y113.018
G1 X137.417 Y114.183 E.04908
G1 X137.417 Y113.65
G1 X138.583 Y112.484 E.04908
G1 X138.583 Y111.951
G1 X137.417 Y113.116 E.04908
G1 X137.417 Y112.583
G1 X138.583 Y111.418 E.04908
G1 X138.583 Y110.885
G1 X137.417 Y112.05 E.04908
G1 X137.417 Y111.517
G1 X138.583 Y110.351 E.04908
G1 X138.583 Y109.818
G1 X137.417 Y110.983 E.04908
G1 X137.417 Y110.45
G1 X138.583 Y109.285 E.04908
G1 X138.583 Y108.752
G1 X137.417 Y109.917 E.04908
G1 X137.417 Y109.384
G1 X138.583 Y108.218 E.04908
G1 X138.583 Y107.685
G1 X137.417 Y108.85 E.04908
G1 X137.417 Y108.317
G1 X138.583 Y107.152 E.04908
G1 X138.583 Y106.619
G1 X137.417 Y107.784 E.04908
G1 X137.417 Y107.251
G1 X138.583 Y106.085 E.04908
G1 X138.583 Y105.552
G1 X137.417 Y106.717 E.04908
G1 X137.417 Y106.184
G1 X138.583 Y105.019 E.04908
G1 X138.583 Y104.486
G1 X137.417 Y105.651 E.04908
G1 X137.417 Y105.118
G1 X138.583 Y103.952 E.04908
G1 X138.583 Y103.419
G1 X137.417 Y104.584 E.04908
G1 X137.417 Y104.051
G1 X138.583 Y102.886 E.04908
G1 X138.583 Y102.353
G1 X137.417 Y103.518 E.04908
G1 X137.417 Y102.984
G1 X138.583 Y101.819 E.04908
G1 X138.583 Y101.286
G1 X137.417 Y102.451 E.04908
G1 X137.417 Y101.918
G1 X138.583 Y100.753 E.04908
; WIPE_START
M204 S5000
G1 X137.417 Y101.918 E-.6262
G1 X137.417 Y102.27 E-.13381
; WIPE_END
G1 E-.04 F1800
G1 X145.006 Y101.456 Z2.1 F15000
G1 X153.151 Y100.583 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X153.753 Y99.98 E.02536
G1 X153.753 Y99.447
G1 X152.617 Y100.583 E.04783
G1 X152.084 Y100.583
G1 X153.249 Y99.417 E.04908
G1 X152.716 Y99.417
G1 X151.551 Y100.583 E.04908
G1 X151.018 Y100.583
G1 X152.183 Y99.417 E.04908
G1 X151.65 Y99.417
G1 X150.484 Y100.583 E.04908
G1 X149.951 Y100.583
G1 X151.116 Y99.417 E.04908
G1 X150.583 Y99.417
G1 X149.418 Y100.583 E.04908
G1 X148.885 Y100.583
G1 X150.05 Y99.417 E.04908
G1 X149.517 Y99.417
G1 X148.351 Y100.583 E.04908
G1 X147.818 Y100.583
G1 X148.983 Y99.417 E.04908
G1 X148.45 Y99.417
G1 X147.285 Y100.583 E.04908
G1 X146.752 Y100.583
G1 X147.917 Y99.417 E.04908
G1 X147.384 Y99.417
G1 X146.218 Y100.583 E.04908
G1 X145.685 Y100.583
G1 X146.85 Y99.417 E.04908
G1 X146.317 Y99.417
G1 X145.152 Y100.583 E.04909
G1 X144.619 Y100.583
G1 X145.784 Y99.417 E.04909
G1 X145.251 Y99.417
G1 X144.085 Y100.583 E.04908
G1 X143.552 Y100.583
G1 X144.717 Y99.417 E.04908
G1 X144.184 Y99.417
G1 X143.019 Y100.583 E.04908
G1 X142.486 Y100.583
G1 X143.651 Y99.417 E.04908
G1 X143.118 Y99.417
G1 X141.952 Y100.583 E.04908
G1 X141.419 Y100.583
G1 X142.584 Y99.417 E.04908
G1 X142.051 Y99.417
G1 X140.886 Y100.583 E.04908
G1 X140.353 Y100.583
G1 X141.518 Y99.417 E.04908
G1 X140.984 Y99.417
G1 X139.819 Y100.583 E.04908
G1 X139.286 Y100.583
G1 X140.451 Y99.417 E.04908
G1 X139.918 Y99.417
G1 X138.753 Y100.583 E.04908
; WIPE_START
M204 S5000
G1 X139.918 Y99.417 E-.6262
G1 X140.27 Y99.417 E-.1338
; WIPE_END
G1 E-.04 F1800
G1 X139.385 Y99.417 Z2.1 F15000
G1 Z1.7
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X137.417 Y101.385 E.08287
G1 X137.417 Y100.851
G1 X138.851 Y99.417 E.06041
G1 X138.318 Y99.417
G1 X137.153 Y100.583 E.04908
G1 X136.62 Y100.583
G1 X137.785 Y99.417 E.04908
G1 X137.252 Y99.417
G1 X136.213 Y100.457 E.04377
G1 X136.213 Y99.923
G1 X136.718 Y99.417 E.02131
; WIPE_START
M204 S5000
G1 X136.213 Y99.923 E-.27188
G1 X136.213 Y100.457 E-.20264
G1 X136.744 Y99.925 E-.28548
; WIPE_END
G1 E-.04 F1800
G1 X138.683 Y100.512 Z2.1 F15000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.159134
G1 F7500
G2 X138.512 Y100.683 I.055 J.226 E.00232
; WIPE_START
G1 X138.546 Y100.601 E-.26252
G1 X138.601 Y100.546 E-.23501
G1 X138.683 Y100.512 E-.26248
; WIPE_END
G1 E-.04 F1800
G1 X138.67 Y108.145 Z2.1 F15000
G1 X138.601 Y151.22 Z2.1
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.101644
G1 F7500
G1 X138.572 Y151.197 E.00017
G1 X138.482 Y151.311 E.00068
; WIPE_START
G1 X138.572 Y151.197 E-.6062
G1 X138.601 Y151.22 E-.1538
; WIPE_END
G1 E-.04 F1800
G1 X146.224 Y151.602 Z2.1 F15000
G1 X154.179 Y152 Z2.1
G1 Z1.7
M73 P95 R0
G1 E.8 F1800
; LINE_WIDTH: 0.43172
G1 F7500
G1 X168.806 Y152 E.44922
; LINE_WIDTH: 0.448395
G1 X168.886 Y151.983 E.00263
; LINE_WIDTH: 0.470635
G1 X168.967 Y151.967 E.00278
G1 X169 Y151.806 E.00556
; LINE_WIDTH: 0.43172
G1 X169 Y100.194 E1.5851
; LINE_WIDTH: 0.448395
G1 X168.983 Y100.114 E.00263
; LINE_WIDTH: 0.470635
G1 X168.967 Y100.033 E.00278
G1 X168.806 Y100 E.00556
; LINE_WIDTH: 0.43172
G1 X154.179 Y100 E.44922
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X156.179 Y100 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/9
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2.1 I1.217 J0 P1  F15000
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
; OBJECT_ID: 92
G1 X168.21 Y151.21
G1 Z1.9
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3408
M204 S2500
G1 X168.21 Y100.79 E1.50184
G1 X153.108 Y100.79 E.44985
G1 X153.108 Y99.21 E.04706
G1 X169.79 Y99.21 E.49691
G1 X169.79 Y152.79 E1.59597
G1 X153.108 Y152.79 E.49691
G1 X153.108 Y151.21 E.04706
G1 X168.15 Y151.21 E.44806
; WIPE_START
G1 F6000
M204 S5000
G1 X168.152 Y149.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.263 Y141.578 Z2.3 F15000
G1 X168.874 Y99.417 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Top surface
G1 F3408
M204 S1000
G1 X169.583 Y100.126 E.02983
G1 X169.583 Y100.659
G1 X168.341 Y99.417 E.0523
G1 X167.808 Y99.417
G1 X169.583 Y101.192 E.07476
G1 X169.583 Y101.725
G1 X167.275 Y99.417 E.09722
G1 X166.741 Y99.417
G1 X167.907 Y100.583 E.04909
G1 X167.373 Y100.583
G1 X166.208 Y99.417 E.04909
G1 X165.675 Y99.417
G1 X166.84 Y100.583 E.04909
G1 X166.307 Y100.583
G1 X165.142 Y99.417 E.04909
G1 X164.608 Y99.417
G1 X165.774 Y100.583 E.04909
G1 X165.24 Y100.583
G1 X164.075 Y99.417 E.04909
G1 X163.542 Y99.417
G1 X164.707 Y100.583 E.04909
G1 X164.174 Y100.583
G1 X163.009 Y99.417 E.04909
G1 X162.475 Y99.417
G1 X163.641 Y100.583 E.04909
G1 X163.107 Y100.583
G1 X161.942 Y99.417 E.04909
G1 X161.409 Y99.417
G1 X162.574 Y100.583 E.04909
G1 X162.041 Y100.583
G1 X160.876 Y99.417 E.04909
G1 X160.342 Y99.417
G1 X161.508 Y100.583 E.04909
G1 X160.974 Y100.583
G1 X159.809 Y99.417 E.04909
G1 X159.276 Y99.417
G1 X160.441 Y100.583 E.04909
G1 X159.908 Y100.583
G1 X158.742 Y99.417 E.04909
G1 X158.209 Y99.417
G1 X159.374 Y100.583 E.04909
G1 X158.841 Y100.583
G1 X157.676 Y99.417 E.04909
G1 X157.143 Y99.417
G1 X158.308 Y100.583 E.04909
G1 X157.775 Y100.583
G1 X156.609 Y99.417 E.04909
G1 X156.076 Y99.417
G1 X157.241 Y100.583 E.04909
G1 X156.708 Y100.583
G1 X155.543 Y99.417 E.04909
G1 X155.01 Y99.417
G1 X156.175 Y100.583 E.04909
G1 X155.642 Y100.583
G1 X154.476 Y99.417 E.04909
G1 X153.943 Y99.417
G1 X155.108 Y100.583 E.04909
G1 X154.575 Y100.583
G1 X153.41 Y99.417 E.04909
G1 X153.315 Y99.856
G1 X154.042 Y100.583 E.03062
; WIPE_START
G1 F6000
M204 S5000
G1 X153.315 Y99.856 E-.39067
G1 X153.41 Y99.417 E-.17041
G1 X153.78 Y99.788 E-.19892
; WIPE_END
G1 E-.04 F1800
G1 X161.382 Y100.466 Z2.3 F15000
G1 X168.417 Y101.093 Z2.3
G1 Z1.9
G1 E.8 F1800
G1 F3408
M204 S1000
G1 X169.583 Y102.259 E.04909
G1 X169.583 Y102.792
G1 X168.417 Y101.627 E.04909
G1 X168.417 Y102.16
G1 X169.583 Y103.325 E.04909
G1 X169.583 Y103.858
G1 X168.417 Y102.693 E.04909
G1 X168.417 Y103.226
G1 X169.583 Y104.392 E.04909
G1 X169.583 Y104.925
G1 X168.417 Y103.76 E.04909
G1 X168.417 Y104.293
M73 P96 R0
G1 X169.583 Y105.458 E.04909
G1 X169.583 Y105.991
G1 X168.417 Y104.826 E.04909
G1 X168.417 Y105.359
G1 X169.583 Y106.525 E.04909
G1 X169.583 Y107.058
G1 X168.417 Y105.893 E.04909
G1 X168.417 Y106.426
G1 X169.583 Y107.591 E.04909
G1 X169.583 Y108.124
G1 X168.417 Y106.959 E.04909
G1 X168.417 Y107.492
G1 X169.583 Y108.658 E.04909
G1 X169.583 Y109.191
G1 X168.417 Y108.026 E.04909
G1 X168.417 Y108.559
G1 X169.583 Y109.724 E.04909
G1 X169.583 Y110.258
G1 X168.417 Y109.092 E.04909
G1 X168.417 Y109.626
G1 X169.583 Y110.791 E.04909
G1 X169.583 Y111.324
G1 X168.417 Y110.159 E.04909
G1 X168.417 Y110.692
G1 X169.583 Y111.857 E.04909
G1 X169.583 Y112.391
G1 X168.417 Y111.225 E.04909
G1 X168.417 Y111.759
G1 X169.583 Y112.924 E.04909
G1 X169.583 Y113.457
G1 X168.417 Y112.292 E.04909
G1 X168.417 Y112.825
G1 X169.583 Y113.99 E.04909
G1 X169.583 Y114.524
G1 X168.417 Y113.358 E.04909
G1 X168.417 Y113.892
G1 X169.583 Y115.057 E.04909
G1 X169.583 Y115.59
G1 X168.417 Y114.425 E.04909
G1 X168.417 Y114.958
G1 X169.583 Y116.123 E.04909
G1 X169.583 Y116.657
G1 X168.417 Y115.491 E.04909
G1 X168.417 Y116.025
G1 X169.583 Y117.19 E.04909
G1 X169.583 Y117.723
G1 X168.417 Y116.558 E.04909
G1 X168.417 Y117.091
G1 X169.583 Y118.256 E.04909
G1 X169.583 Y118.79
G1 X168.417 Y117.624 E.04909
G1 X168.417 Y118.158
G1 X169.583 Y119.323 E.04909
G1 X169.583 Y119.856
G1 X168.417 Y118.691 E.04909
G1 X168.417 Y119.224
G1 X169.583 Y120.389 E.04909
G1 X169.583 Y120.923
G1 X168.417 Y119.757 E.04909
G1 X168.417 Y120.291
G1 X169.583 Y121.456 E.04909
G1 X169.583 Y121.989
G1 X168.417 Y120.824 E.04909
G1 X168.417 Y121.357
G1 X169.583 Y122.522 E.04909
G1 X169.583 Y123.056
G1 X168.417 Y121.89 E.04909
G1 X168.417 Y122.424
G1 X169.583 Y123.589 E.04909
G1 X169.583 Y124.122
G1 X168.417 Y122.957 E.04909
G1 X168.417 Y123.49
G1 X169.583 Y124.655 E.04909
G1 X169.583 Y125.189
G1 X168.417 Y124.023 E.04909
G1 X168.417 Y124.557
G1 X169.583 Y125.722 E.04909
G1 X169.583 Y126.255
G1 X168.417 Y125.09 E.04909
G1 X168.417 Y125.623
G1 X169.583 Y126.788 E.04909
G1 X169.583 Y127.322
G1 X168.417 Y126.156 E.04909
G1 X168.417 Y126.69
G1 X169.583 Y127.855 E.04909
G1 X169.583 Y128.388
G1 X168.417 Y127.223 E.04909
G1 X168.417 Y127.756
G1 X169.583 Y128.922 E.04909
G1 X169.583 Y129.455
G1 X168.417 Y128.29 E.04909
G1 X168.417 Y128.823
G1 X169.583 Y129.988 E.04909
G1 X169.583 Y130.521
G1 X168.417 Y129.356 E.04909
G1 X168.417 Y129.889
G1 X169.583 Y131.055 E.04909
G1 X169.583 Y131.588
G1 X168.417 Y130.423 E.04909
G1 X168.417 Y130.956
G1 X169.583 Y132.121 E.04909
G1 X169.583 Y132.654
G1 X168.417 Y131.489 E.04909
G1 X168.417 Y132.022
G1 X169.583 Y133.188 E.04909
G1 X169.583 Y133.721
G1 X168.417 Y132.556 E.04909
G1 X168.417 Y133.089
G1 X169.583 Y134.254 E.04909
G1 X169.583 Y134.787
G1 X168.417 Y133.622 E.04909
G1 X168.417 Y134.155
G1 X169.583 Y135.321 E.04909
G1 X169.583 Y135.854
G1 X168.417 Y134.689 E.04909
G1 X168.417 Y135.222
G1 X169.583 Y136.387 E.04909
G1 X169.583 Y136.92
G1 X168.417 Y135.755 E.04909
G1 X168.417 Y136.288
G1 X169.583 Y137.454 E.04909
G1 X169.583 Y137.987
G1 X168.417 Y136.822 E.04909
G1 X168.417 Y137.355
G1 X169.583 Y138.52 E.04909
G1 X169.583 Y139.053
G1 X168.417 Y137.888 E.04909
G1 X168.417 Y138.421
G1 X169.583 Y139.587 E.04909
G1 X169.583 Y140.12
G1 X168.417 Y138.955 E.04909
G1 X168.417 Y139.488
G1 X169.583 Y140.653 E.04909
G1 X169.583 Y141.186
G1 X168.417 Y140.021 E.04909
G1 X168.417 Y140.554
G1 X169.583 Y141.72 E.04909
G1 X169.583 Y142.253
G1 X168.417 Y141.088 E.04909
G1 X168.417 Y141.621
G1 X169.583 Y142.786 E.04909
G1 X169.583 Y143.319
G1 X168.417 Y142.154 E.04909
G1 X168.417 Y142.687
G1 X169.583 Y143.853 E.04909
G1 X169.583 Y144.386
G1 X168.417 Y143.221 E.04909
G1 X168.417 Y143.754
G1 X169.583 Y144.919 E.04909
G1 X169.583 Y145.453
G1 X168.417 Y144.287 E.04909
G1 X168.417 Y144.821
G1 X169.583 Y145.986 E.04909
G1 X169.583 Y146.519
G1 X168.417 Y145.354 E.04909
G1 X168.417 Y145.887
G1 X169.583 Y147.052 E.04909
G1 X169.583 Y147.586
G1 X168.417 Y146.42 E.04909
G1 X168.417 Y146.954
G1 X169.583 Y148.119 E.04909
G1 X169.583 Y148.652
G1 X168.417 Y147.487 E.04909
G1 X168.417 Y148.02
G1 X169.583 Y149.185 E.04909
G1 X169.583 Y149.719
G1 X168.417 Y148.553 E.04909
G1 X168.417 Y149.087
G1 X169.583 Y150.252 E.04909
G1 X169.583 Y150.785
G1 X168.417 Y149.62 E.04909
G1 X168.417 Y150.153
G1 X169.583 Y151.318 E.04909
G1 X169.583 Y151.852
M73 P97 R0
G1 X168.417 Y150.686 E.04909
G1 X168.417 Y151.22
G1 X169.583 Y152.385 E.04909
G1 X169.247 Y152.583
G1 X168.082 Y151.417 E.04909
G1 X167.549 Y151.417
G1 X168.714 Y152.583 E.04909
G1 X168.181 Y152.583
G1 X167.015 Y151.417 E.04909
G1 X166.482 Y151.417
G1 X167.647 Y152.583 E.04909
G1 X167.114 Y152.583
G1 X165.949 Y151.417 E.04909
G1 X165.416 Y151.417
G1 X166.581 Y152.583 E.04909
G1 X166.048 Y152.583
G1 X164.882 Y151.417 E.04909
G1 X164.349 Y151.417
G1 X165.514 Y152.583 E.04909
G1 X164.981 Y152.583
G1 X163.816 Y151.417 E.04909
G1 X163.283 Y151.417
G1 X164.448 Y152.583 E.04909
G1 X163.915 Y152.583
G1 X162.749 Y151.417 E.04909
G1 X162.216 Y151.417
G1 X163.381 Y152.583 E.04909
G1 X162.848 Y152.583
G1 X161.683 Y151.417 E.04909
G1 X161.15 Y151.417
G1 X162.315 Y152.583 E.04909
G1 X161.782 Y152.583
G1 X160.616 Y151.417 E.04909
G1 X160.083 Y151.417
G1 X161.248 Y152.583 E.04909
G1 X160.715 Y152.583
G1 X159.55 Y151.417 E.04909
G1 X159.017 Y151.417
G1 X160.182 Y152.583 E.04909
G1 X159.649 Y152.583
G1 X158.483 Y151.417 E.04909
G1 X157.95 Y151.417
G1 X159.115 Y152.583 E.04909
G1 X158.582 Y152.583
G1 X157.417 Y151.417 E.04909
G1 X156.883 Y151.417
G1 X158.049 Y152.583 E.04909
G1 X157.515 Y152.583
G1 X156.35 Y151.417 E.04909
G1 X155.817 Y151.417
G1 X156.982 Y152.583 E.04909
G1 X156.449 Y152.583
G1 X155.284 Y151.417 E.04909
G1 X154.75 Y151.417
G1 X155.916 Y152.583 E.04909
G1 X155.382 Y152.583
G1 X154.217 Y151.417 E.04909
G1 X153.684 Y151.417
G1 X154.849 Y152.583 E.04909
G1 X154.316 Y152.583
G1 X153.315 Y151.582 E.04217
G1 X153.315 Y152.115
G1 X153.783 Y152.583 E.0197
; WIPE_START
G1 F6000
M204 S5000
G1 X153.315 Y152.115 E-.25137
G1 X153.315 Y151.582 E-.20264
G1 X153.884 Y152.151 E-.306
; WIPE_END
G1 E-.04 F1800
G1 X153.674 Y151.428 Z2.3 F15000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101183
G1 F3408
G1 X153.296 Y151.428 E.00174
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F7500
G1 X153.674 Y151.428 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.3 I1.217 J0 P1  F15000
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
G1 Z2.4 F900 ; lower z a little
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

    G1 Z101.9 F600
    G1 Z99.9

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

