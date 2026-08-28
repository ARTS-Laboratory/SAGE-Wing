; HEADER_BLOCK_START
; BambuStudio 02.07.01.62
; model printing time: 6m 45s; total estimated time: 13m 5s
; total layer number: 10
; total filament length [mm] : 677.79
; total filament volume [cm^3] : 1630.29
; total filament weight [g] : 2.09
; filament_density: 1.28
; filament_diameter: 1.75
; max_z_height: 2.10
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
M73 P39 R7
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
M73 P42 R7
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
    G29 A X98.2863 Y68.7863 I59.4273 J118.427
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
M73 P43 R7
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
; layer num/total_layer_count: 1/10
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S3000
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
; OBJECT_ID: 113
G1 X99.117 Y67.871
G1 Z.3
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
M73 P44 R7
G1 X99.452 Y67.544 E.02415
G1 X99.844 Y67.289 E.02414
G1 X100.282 Y67.115 E.02431
G1 X101.016 Y67.004 E.03834
G1 X154.989 Y67.004 E2.78589
G1 X155.466 Y67.051 E.0247
G1 X155.916 Y67.187 E.0243
G1 X156.239 Y67.348 E.01861
G1 X156.629 Y67.617 E.02446
G1 X156.956 Y67.952 E.02415
M73 P45 R7
G1 X157.211 Y68.344 E.02414
G1 X157.385 Y68.782 E.02431
G1 X157.496 Y69.516 E.03834
G1 X157.496 Y182.489 E5.83124
G1 X157.449 Y182.966 E.0247
G1 X157.313 Y183.416 E.0243
G1 X157.152 Y183.739 E.01861
M73 P46 R7
G1 X156.883 Y184.129 E.02446
G1 X156.548 Y184.456 E.02415
G1 X156.156 Y184.711 E.02414
G1 X155.718 Y184.885 E.02431
G1 X154.984 Y184.996 E.03834
G1 X101.011 Y184.996 E2.78588
G1 X100.534 Y184.949 E.0247
G1 X100.084 Y184.813 E.0243
G1 X99.761 Y184.652 E.01861
G1 X99.371 Y184.383 E.02446
G1 X99.044 Y184.048 E.02415
G1 X98.789 Y183.656 E.02414
G1 X98.615 Y183.218 E.02431
M73 P46 R6
G1 X98.504 Y182.484 E.03834
G1 X98.504 Y69.511 E5.83125
G1 X98.551 Y69.034 E.0247
G1 X98.687 Y68.584 E.0243
G1 X98.848 Y68.261 E.01861
G1 X99.083 Y67.92 E.02136
M204 S3000
G1 X99.441 Y68.167 F15000
G1 F1500
M204 S250
G1 X99.444 Y68.164 E.00023
M73 P47 R6
G1 X99.736 Y67.879 E.02104
G1 X100.035 Y67.685 E.01838
G1 X100.382 Y67.544 E.01938
G1 X101.059 Y67.44 E.03532
G1 X154.974 Y67.44 E2.78292
M73 P48 R6
G1 X155.368 Y67.479 E.0204
G1 X155.744 Y67.59 E.02027
G1 X156.025 Y67.729 E.01616
G1 X156.356 Y67.96 E.02084
G1 X156.621 Y68.236 E.01973
G1 X156.827 Y68.557 E.01971
G1 X156.964 Y68.911 E.01959
G1 X157.06 Y69.559 E.03379
G1 X157.06 Y182.462 E5.82761
G1 X157.021 Y182.868 E.02106
G1 X156.902 Y183.265 E.02141
G1 X156.771 Y183.525 E.01503
G1 X156.556 Y183.836 E.01953
G1 X156.264 Y184.121 E.02104
G1 X155.965 Y184.315 E.01838
G1 X155.618 Y184.456 E.01938
G1 X154.941 Y184.56 E.03533
G1 X101.038 Y184.56 E2.78225
G1 X100.632 Y184.521 E.02106
G1 X100.235 Y184.402 E.02141
M73 P49 R6
G1 X99.975 Y184.271 E.01503
G1 X99.664 Y184.056 E.01953
G1 X99.379 Y183.764 E.02104
G1 X99.185 Y183.465 E.01838
G1 X99.044 Y183.118 E.01938
G1 X98.94 Y182.441 E.03532
G1 X98.94 Y69.538 E5.82762
G1 X98.979 Y69.132 E.02105
G1 X99.098 Y68.735 E.02141
G1 X99.229 Y68.475 E.01503
G1 X99.407 Y68.217 E.0162
M204 S3000
G1 X99.766 Y68.468 F15000
G1 F1500
M204 S250
G1 X99.788 Y68.437 E.00195
G1 X100 Y68.23 E.0153
G1 X100.227 Y68.08 E.01404
G1 X100.514 Y67.964 E.01599
G1 X101.102 Y67.875 E.03069
M73 P50 R6
G1 X154.947 Y67.876 E2.77925
G1 X155.272 Y67.907 E.01684
G1 X155.574 Y67.994 E.01623
G1 X155.81 Y68.111 E.0136
G1 X156.08 Y68.302 E.0171
G1 X156.284 Y68.518 E.0153
G1 X156.441 Y68.768 E.01525
G1 X156.542 Y69.038 E.01489
G1 X156.625 Y69.601 E.02936
G1 X156.625 Y182.434 E5.82404
G1 X156.588 Y182.796 E.01875
G1 X156.49 Y183.113 E.01715
G1 X156.39 Y183.31 E.01139
G1 X156.212 Y183.563 E.01597
G1 X156 Y183.77 E.0153
G1 X155.773 Y183.92 E.01404
G1 X155.486 Y184.036 E.01599
G1 X154.898 Y184.125 E.03069
G1 X101.066 Y184.125 E2.77861
G1 X100.704 Y184.088 E.01875
G1 X100.387 Y183.99 E.01715
M73 P51 R6
G1 X100.19 Y183.89 E.01139
G1 X99.937 Y183.712 E.01597
G1 X99.73 Y183.5 E.0153
G1 X99.58 Y183.273 E.01404
G1 X99.464 Y182.986 E.01599
G1 X99.375 Y182.398 E.03069
G1 X99.375 Y69.566 E5.82397
G1 X99.412 Y69.204 E.01874
G1 X99.51 Y68.887 E.01715
G1 X99.61 Y68.69 E.01139
G1 X99.732 Y68.517 E.01093
M204 S3000
G1 X100.077 Y68.802 F15000
G1 F1500
M204 S250
G1 X100.232 Y68.615 E.01254
G1 X100.428 Y68.476 E.01243
G1 X100.615 Y68.388 E.01066
G1 X100.75 Y68.347 E.00726
G1 X101.019 Y68.311 E.01401
G1 X154.978 Y68.311 E2.78518
G1 X155.275 Y68.357 E.01549
G1 X155.565 Y68.472 E.01614
G1 X155.815 Y68.659 E.01609
G1 X156.023 Y68.925 E.01741
G1 X156.153 Y69.25 E.01808
G1 X156.189 Y69.519 E.01401
G1 X156.189 Y182.478 E5.83053
G1 X156.143 Y182.775 E.0155
G1 X156.028 Y183.065 E.01614
G1 X155.841 Y183.315 E.01608
G1 X155.575 Y183.523 E.01741
M73 P52 R6
G1 X155.25 Y183.653 E.01808
G1 X154.981 Y183.689 E.01401
G1 X101.022 Y183.689 E2.78518
G1 X100.725 Y183.643 E.0155
G1 X100.435 Y183.528 E.01614
G1 X100.185 Y183.341 E.01608
G1 X99.977 Y183.075 E.01741
G1 X99.847 Y182.75 E.01808
G1 X99.811 Y182.481 E.01401
G1 X99.811 Y69.522 E5.83053
G1 X99.858 Y69.219 E.01583
G1 X99.926 Y69.021 E.01082
G1 X99.989 Y68.909 E.00659
G1 X100.039 Y68.848 E.00408
M204 S3000
G1 X100.383 Y69.109 F15000
G1 F1500
M204 S250
G1 X100.495 Y68.961 E.00955
G1 X100.603 Y68.875 E.00715
M73 P53 R6
G1 X100.809 Y68.778 E.01174
G1 X101.01 Y68.747 E.0105
G1 X154.988 Y68.747 E2.78614
G1 X155.207 Y68.787 E.01151
G1 X155.394 Y68.872 E.01057
G1 X155.539 Y68.995 E.00982
G1 X155.625 Y69.103 E.00715
G1 X155.722 Y69.309 E.01174
G1 X155.753 Y69.51 E.0105
G1 X155.753 Y182.488 E5.8315
G1 X155.713 Y182.707 E.01151
G1 X155.628 Y182.894 E.01057
G1 X155.505 Y183.039 E.00982
G1 X155.397 Y183.125 E.00715
G1 X155.191 Y183.222 E.01174
G1 X154.99 Y183.253 E.0105
G1 X101.012 Y183.253 E2.78614
G1 X100.793 Y183.213 E.01151
G1 X100.606 Y183.128 E.01057
G1 X100.461 Y183.005 E.00982
G1 X100.375 Y182.897 E.00715
M73 P54 R6
G1 X100.278 Y182.691 E.01174
G1 X100.247 Y182.49 E.0105
G1 X100.247 Y69.512 E5.8315
G1 X100.287 Y69.289 E.01168
G1 X100.332 Y69.176 E.00627
G1 X100.347 Y69.157 E.00128
M204 S3000
G1 X100.725 Y69.366 F15000
M73 P54 R5
G1 F1500
M204 S250
G1 X100.756 Y69.31 E.0033
G1 X100.887 Y69.206 E.0086
G1 X101 Y69.182 E.00598
G1 X155 Y69.182 E2.78728
G1 X155.105 Y69.209 E.00562
G1 X155.19 Y69.256 E.005
G1 X155.294 Y69.387 E.0086
G1 X155.318 Y69.5 E.00598
G1 X155.318 Y182.5 E5.83263
G1 X155.291 Y182.605 E.00562
G1 X155.244 Y182.69 E.005
G1 X155.113 Y182.794 E.0086
G1 X155 Y182.818 E.00598
M73 P55 R5
G1 X101 Y182.818 E2.78728
G1 X100.895 Y182.791 E.00562
G1 X100.81 Y182.744 E.005
G1 X100.706 Y182.613 E.0086
G1 X100.682 Y182.5 E.00598
G1 X100.682 Y69.5 E5.83263
G1 X100.703 Y69.421 E.00422
; WIPE_START
G1 X100.756 Y69.31 E-.04686
G1 X100.887 Y69.206 E-.06334
G1 X101 Y69.182 E-.044
G1 X102.594 Y69.182 E-.6058
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X105.787 Y76.115 Z.7 F15000
G1 X154.6 Y182.1 Z.7
G1 Z.3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X101.4 Y182.1 E2.74598
M73 P56 R5
G1 X101.4 Y69.9 E5.79134
G1 X154.6 Y69.9 E2.74598
G1 X154.6 Y182.04 E5.78824
M204 S3000
G1 X154.164 Y181.664 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X101.836 Y181.664 E2.70101
G1 X101.836 Y70.336 E5.74637
G1 X154.164 Y70.336 E2.70101
G1 X154.164 Y181.604 E5.74327
; WIPE_START
G1 X152.164 Y181.607 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X152.273 Y173.975 Z.7 F15000
G1 X153.4 Y94.9 Z.7
G1 Z.3
M73 P57 R5
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X102.6 Y94.9 E2.6221
G1 X102.6 Y71.1 E1.22847
G1 X153.4 Y71.1 E2.6221
G1 X153.4 Y94.84 E1.22537
M204 S3000
G1 X153.4 Y95.336 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X102.164 Y95.336 E2.64459
G1 X102.164 Y70.664 E1.27343
G1 X153.836 Y70.664 E2.66707
G1 X153.836 Y95.336 E1.27343
G1 X153.46 Y95.336 E.01939
M204 S3000
G1 X153.4 Y96.1 F15000
; FEATURE: Outer wall
M73 P58 R5
G1 F1500
M204 S250
G1 X153.4 Y176.9 E4.17059
G1 X102.6 Y176.9 E2.6221
G1 X102.6 Y96.1 E4.17059
G1 X153.34 Y96.1 E2.61901
M204 S3000
G1 X153.4 Y95.664 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X153.836 Y95.664 E.02249
G1 X153.836 Y177.336 E4.21556
G1 X102.164 Y177.336 E2.66707
G1 X102.164 Y95.664 E4.21556
G1 X153.34 Y95.664 E2.64149
; WIPE_START
G1 X153.836 Y95.664 E-.18834
G1 X153.836 Y97.169 E-.57166
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X153.766 Y104.801 Z.7 F15000
G1 X153.1 Y177.51 Z.7
G1 Z.3
M73 P59 R5
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.504731
G1 F3000
M204 S250
G1 X153.794 Y178.204 E.05125
G1 X153.794 Y178.827 E.03249
G1 X152.673 Y177.706 E.08274
G1 X152.05 Y177.706 E.03249
M73 P60 R5
G1 X153.794 Y179.45 E.12869
G1 X153.794 Y180.073 E.03249
G1 X151.427 Y177.706 E.17465
G1 X150.805 Y177.706 E.03249
M73 P61 R5
G1 X153.794 Y180.695 E.2206
G1 X153.794 Y181.294 E.03124
M73 P61 R4
G1 X153.77 Y181.294 E.00126
M73 P62 R4
G1 X150.182 Y177.706 E.26478
G1 X149.559 Y177.706 E.03249
G1 X153.147 Y181.294 E.26478
G1 X152.525 Y181.294 E.03249
G1 X148.936 Y177.706 E.26478
G1 X148.314 Y177.706 E.03249
G1 X151.902 Y181.294 E.26478
G1 X151.279 Y181.294 E.03249
G1 X147.691 Y177.706 E.26478
G1 X147.068 Y177.706 E.03249
M73 P63 R4
G1 X150.656 Y181.294 E.26478
G1 X150.034 Y181.294 E.03249
G1 X146.445 Y177.706 E.26478
G1 X145.823 Y177.706 E.03249
G1 X149.411 Y181.294 E.26478
G1 X148.788 Y181.294 E.03249
G1 X145.2 Y177.706 E.26478
M73 P64 R4
G1 X144.577 Y177.706 E.03249
G1 X148.165 Y181.294 E.26478
G1 X147.543 Y181.294 E.03249
G1 X143.954 Y177.706 E.26478
G1 X143.332 Y177.706 E.03249
G1 X146.92 Y181.294 E.26478
M73 P65 R4
G1 X146.297 Y181.294 E.03249
G1 X142.709 Y177.706 E.26478
G1 X142.086 Y177.706 E.03249
G1 X145.674 Y181.294 E.26478
G1 X145.052 Y181.294 E.03249
G1 X141.463 Y177.706 E.26478
M73 P66 R4
G1 X140.841 Y177.706 E.03249
G1 X144.429 Y181.294 E.26478
G1 X143.806 Y181.294 E.03249
G1 X140.218 Y177.706 E.26478
G1 X139.595 Y177.706 E.03249
G1 X143.183 Y181.294 E.26478
G1 X142.561 Y181.294 E.03249
G1 X138.972 Y177.706 E.26478
G1 X138.35 Y177.706 E.03249
G1 X141.938 Y181.294 E.26478
G1 X141.315 Y181.294 E.03249
G1 X137.727 Y177.706 E.26478
G1 X137.104 Y177.706 E.03249
G1 X140.692 Y181.294 E.26478
G1 X140.07 Y181.294 E.03249
G1 X136.481 Y177.706 E.26478
G1 X135.859 Y177.706 E.03249
M73 P67 R4
G1 X139.447 Y181.294 E.26478
G1 X138.824 Y181.294 E.03249
G1 X135.236 Y177.706 E.26478
G1 X134.613 Y177.706 E.03249
G1 X138.201 Y181.294 E.26478
G1 X137.579 Y181.294 E.03249
G1 X133.99 Y177.706 E.26478
G1 X133.368 Y177.706 E.03249
G1 X136.956 Y181.294 E.26478
G1 X136.333 Y181.294 E.03249
G1 X132.745 Y177.706 E.26478
G1 X132.122 Y177.706 E.03249
G1 X135.71 Y181.294 E.26478
G1 X135.088 Y181.294 E.03249
G1 X131.499 Y177.706 E.26478
G1 X130.877 Y177.706 E.03249
G1 X134.465 Y181.294 E.26478
G1 X133.842 Y181.294 E.03249
G1 X130.254 Y177.706 E.26478
G1 X129.631 Y177.706 E.03249
G1 X133.219 Y181.294 E.26478
G1 X132.597 Y181.294 E.03249
G1 X129.008 Y177.706 E.26478
G1 X128.386 Y177.706 E.03249
G1 X131.974 Y181.294 E.26478
G1 X131.351 Y181.294 E.03249
G1 X127.763 Y177.706 E.26478
G1 X127.14 Y177.706 E.03249
G1 X130.728 Y181.294 E.26478
G1 X130.106 Y181.294 E.03249
G1 X126.517 Y177.706 E.26478
G1 X125.895 Y177.706 E.03249
G1 X129.483 Y181.294 E.26478
G1 X128.86 Y181.294 E.03249
G1 X125.272 Y177.706 E.26478
G1 X124.649 Y177.706 E.03249
G1 X128.237 Y181.294 E.26478
G1 X127.615 Y181.294 E.03249
G1 X124.026 Y177.706 E.26478
G1 X123.404 Y177.706 E.03249
G1 X126.992 Y181.294 E.26478
G1 X126.369 Y181.294 E.03249
G1 X122.781 Y177.706 E.26478
G1 X122.158 Y177.706 E.03249
G1 X125.746 Y181.294 E.26478
G1 X125.124 Y181.294 E.03249
G1 X121.535 Y177.706 E.26478
G1 X120.913 Y177.706 E.03249
G1 X124.501 Y181.294 E.26478
G1 X123.878 Y181.294 E.03249
G1 X120.29 Y177.706 E.26478
G1 X119.667 Y177.706 E.03249
G1 X123.255 Y181.294 E.26478
G1 X122.633 Y181.294 E.03249
G1 X119.044 Y177.706 E.26477
G1 X118.422 Y177.706 E.03249
G1 X122.01 Y181.294 E.26478
G1 X121.387 Y181.294 E.03249
G1 X117.799 Y177.706 E.26478
G1 X117.176 Y177.706 E.03249
G1 X120.764 Y181.294 E.26478
G1 X120.142 Y181.294 E.03249
G1 X116.553 Y177.706 E.26478
M73 P68 R4
G1 X115.931 Y177.706 E.03249
G1 X119.519 Y181.294 E.26478
G1 X118.896 Y181.294 E.03249
G1 X115.308 Y177.706 E.26478
G1 X114.685 Y177.706 E.03249
G1 X118.273 Y181.294 E.26478
G1 X117.651 Y181.294 E.03249
G1 X114.062 Y177.706 E.26478
G1 X113.44 Y177.706 E.03249
G1 X117.028 Y181.294 E.26478
G1 X116.405 Y181.294 E.03249
G1 X112.817 Y177.706 E.26478
G1 X112.194 Y177.706 E.03249
G1 X115.782 Y181.294 E.26478
G1 X115.16 Y181.294 E.03249
G1 X111.571 Y177.706 E.26478
G1 X110.949 Y177.706 E.03249
G1 X114.537 Y181.294 E.26478
G1 X113.914 Y181.294 E.03249
G1 X110.326 Y177.706 E.26478
G1 X109.703 Y177.706 E.03249
G1 X113.291 Y181.294 E.26478
G1 X112.669 Y181.294 E.03249
G1 X109.08 Y177.706 E.26478
G1 X108.458 Y177.706 E.03249
G1 X112.046 Y181.294 E.26478
G1 X111.423 Y181.294 E.03249
G1 X107.835 Y177.706 E.26478
G1 X107.212 Y177.706 E.03249
G1 X110.8 Y181.294 E.26478
G1 X110.178 Y181.294 E.03249
G1 X106.589 Y177.706 E.26478
G1 X105.967 Y177.706 E.03249
G1 X109.555 Y181.294 E.26478
G1 X108.932 Y181.294 E.03249
G1 X105.344 Y177.706 E.26478
G1 X104.721 Y177.706 E.03249
G1 X108.309 Y181.294 E.26478
G1 X107.687 Y181.294 E.03249
G1 X104.098 Y177.706 E.26478
G1 X103.476 Y177.706 E.03249
G1 X107.064 Y181.294 E.26478
G1 X106.441 Y181.294 E.03249
G1 X102.853 Y177.706 E.26478
G1 X102.23 Y177.706 E.03249
G1 X105.818 Y181.294 E.26478
G1 X105.196 Y181.294 E.03249
G1 X102.206 Y178.304 E.22061
G1 X102.206 Y178.927 E.03249
G1 X104.573 Y181.294 E.17466
G1 X103.95 Y181.294 E.03249
G1 X102.206 Y179.55 E.12871
G1 X102.206 Y180.173 E.03249
G1 X103.327 Y181.294 E.08276
G1 X102.705 Y181.294 E.03249
G1 X102.01 Y180.599 E.05127
; CHANGE_LAYER
; Z_HEIGHT: 0.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X102.705 Y181.294 E-.3734
G1 X103.327 Y181.294 E-.23665
G1 X103.048 Y181.015 E-.14995
; WIPE_END
M73 P69 R4
G1 E-.04 F1800
; layer num/total_layer_count: 2/10
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
; OBJECT_ID: 113
G1 X153.21 Y95.898
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X153.602 Y95.898 E.01261
G1 X153.602 Y177.102 E2.61123
G1 X102.398 Y177.102 E1.64654
G1 X102.398 Y95.898 E2.61123
G1 X153.15 Y95.898 E1.632
M204 S250
G1 X153.21 Y96.29 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X153.21 Y176.71 E2.39544
G1 X102.79 Y176.71 E1.50184
G1 X102.79 Y96.29 E2.39544
G1 X153.15 Y96.29 E1.50005
; WIPE_START
M204 S5000
G1 X153.151 Y98.29 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.21 Y95.102 Z.9 F15000
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X102.398 Y95.102 E1.63393
G1 X102.398 Y70.898 E.77832
G1 X153.602 Y70.898 E1.64654
G1 X153.602 Y95.102 E.77832
G1 X153.27 Y95.102 E.01068
M204 S250
G1 X153.21 Y94.71 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y94.71 E1.50184
M73 P69 R3
G1 X102.79 Y71.29 E.6976
G1 X153.21 Y71.29 E1.50184
G1 X153.21 Y94.65 E.69581
; WIPE_START
M204 S5000
G1 X151.21 Y94.652 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.398 Y96.29 Z.9 F15000
G1 Z.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X154.398 Y177.411 E2.60857
G1 X101.602 Y177.411 E1.69772
G1 X101.602 Y70.102 E3.45068
G1 X154.398 Y70.102 E1.69772
G1 X154.398 Y96.23 E.84018
; WIPE_START
G1 X154.398 Y98.23 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.398 Y105.862 Z.9 F15000
G1 X154.398 Y181.898 Z.9
G1 Z.5
G1 E.8 F1800
G1 F9000
G1 X101.602 Y181.898 E1.69772
G1 X101.602 Y181.567 E.01064
G1 X154.398 Y181.567 E1.69772
G1 X154.398 Y181.838 E.00871
M204 S250
G1 X154.79 Y182.29 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X101.21 Y182.29 E1.59597
G1 X101.21 Y69.71 E3.35337
G1 X154.79 Y69.71 E1.59597
M73 P70 R3
G1 X154.79 Y182.23 E3.35159
; WIPE_START
M204 S5000
G1 X152.79 Y182.232 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.583 Y180.739 Z.9 F15000
G1 Z.5
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X153.977 Y181.345 E.02551
G1 X153.444 Y181.345
G1 X154.583 Y180.206 E.04797
G1 X154.583 Y179.673
G1 X152.911 Y181.345 E.07044
G1 X152.377 Y181.345
G1 X154.583 Y179.139 E.0929
G1 X154.583 Y178.606
G1 X151.844 Y181.345 E.11536
G1 X151.311 Y181.345
G1 X154.583 Y178.073 E.13783
G1 X154.488 Y177.634
G1 X150.778 Y181.345 E.15631
G1 X150.244 Y181.345
G1 X153.955 Y177.634 E.15631
G1 X153.422 Y177.634
G1 X149.711 Y181.345 E.15631
G1 X149.178 Y181.345
G1 X152.888 Y177.634 E.15631
G1 X152.355 Y177.634
G1 X148.644 Y181.345 E.15631
G1 X148.111 Y181.345
G1 X151.822 Y177.634 E.15631
G1 X151.289 Y177.634
G1 X147.578 Y181.345 E.15631
G1 X147.045 Y181.345
M73 P71 R3
G1 X150.755 Y177.634 E.15631
G1 X150.222 Y177.634
G1 X146.511 Y181.345 E.15631
G1 X145.978 Y181.345
G1 X149.689 Y177.634 E.15631
G1 X149.156 Y177.634
G1 X145.445 Y181.345 E.15631
G1 X144.912 Y181.345
G1 X148.622 Y177.634 E.15631
G1 X148.089 Y177.634
G1 X144.378 Y181.345 E.15631
G1 X143.845 Y181.345
G1 X147.556 Y177.634 E.15631
G1 X147.023 Y177.634
G1 X143.312 Y181.345 E.15631
G1 X142.779 Y181.345
G1 X146.489 Y177.634 E.15631
G1 X145.956 Y177.634
G1 X142.245 Y181.345 E.15631
G1 X141.712 Y181.345
G1 X145.423 Y177.634 E.15631
G1 X144.89 Y177.634
G1 X141.179 Y181.345 E.15631
G1 X140.646 Y181.345
G1 X144.356 Y177.634 E.15631
G1 X143.823 Y177.634
G1 X140.112 Y181.345 E.15631
G1 X139.579 Y181.345
G1 X143.29 Y177.634 E.15631
G1 X142.757 Y177.634
G1 X139.046 Y181.345 E.15631
G1 X138.513 Y181.345
G1 X142.223 Y177.634 E.15631
G1 X141.69 Y177.634
G1 X137.979 Y181.345 E.15631
G1 X137.446 Y181.345
G1 X141.157 Y177.634 E.15631
G1 X140.624 Y177.634
G1 X136.913 Y181.345 E.15631
G1 X136.38 Y181.345
G1 X140.09 Y177.634 E.15631
G1 X139.557 Y177.634
G1 X135.846 Y181.345 E.15631
G1 X135.313 Y181.345
G1 X139.024 Y177.634 E.15631
G1 X138.49 Y177.634
G1 X134.78 Y181.345 E.15631
G1 X134.247 Y181.345
G1 X137.957 Y177.634 E.15631
G1 X137.424 Y177.634
G1 X133.713 Y181.345 E.15631
G1 X133.18 Y181.345
G1 X136.891 Y177.634 E.15631
G1 X136.357 Y177.634
G1 X132.647 Y181.345 E.15631
G1 X132.113 Y181.345
G1 X135.824 Y177.634 E.15631
G1 X135.291 Y177.634
M73 P72 R3
G1 X131.58 Y181.345 E.15631
G1 X131.047 Y181.345
G1 X134.758 Y177.634 E.15631
G1 X134.224 Y177.634
G1 X130.514 Y181.345 E.15631
G1 X129.98 Y181.345
G1 X133.691 Y177.634 E.15631
G1 X133.158 Y177.634
G1 X129.447 Y181.345 E.15631
G1 X128.914 Y181.345
G1 X132.625 Y177.634 E.15631
G1 X132.091 Y177.634
G1 X128.381 Y181.345 E.15631
G1 X127.847 Y181.345
G1 X131.558 Y177.634 E.15631
G1 X131.025 Y177.634
G1 X127.314 Y181.345 E.15631
G1 X126.781 Y181.345
G1 X130.492 Y177.634 E.15631
G1 X129.958 Y177.634
G1 X126.248 Y181.345 E.15631
G1 X125.714 Y181.345
G1 X129.425 Y177.634 E.15631
G1 X128.892 Y177.634
G1 X125.181 Y181.345 E.15631
G1 X124.648 Y181.345
G1 X128.359 Y177.634 E.15631
G1 X127.825 Y177.634
G1 X124.115 Y181.345 E.15631
G1 X123.581 Y181.345
G1 X127.292 Y177.634 E.15631
G1 X126.759 Y177.634
G1 X123.048 Y181.345 E.15631
G1 X122.515 Y181.345
G1 X126.226 Y177.634 E.15631
G1 X125.692 Y177.634
G1 X121.982 Y181.345 E.15631
G1 X121.448 Y181.345
G1 X125.159 Y177.634 E.15631
G1 X124.626 Y177.634
G1 X120.915 Y181.345 E.15631
G1 X120.382 Y181.345
G1 X124.093 Y177.634 E.15631
G1 X123.559 Y177.634
G1 X119.849 Y181.345 E.15631
G1 X119.315 Y181.345
G1 X123.026 Y177.634 E.15631
G1 X122.493 Y177.634
G1 X118.782 Y181.345 E.15631
G1 X118.249 Y181.345
G1 X121.959 Y177.634 E.15631
G1 X121.426 Y177.634
G1 X117.716 Y181.345 E.15631
G1 X117.182 Y181.345
G1 X120.893 Y177.634 E.15631
G1 X120.36 Y177.634
G1 X116.649 Y181.345 E.15631
G1 X116.116 Y181.345
G1 X119.826 Y177.634 E.15631
G1 X119.293 Y177.634
G1 X115.582 Y181.345 E.15631
G1 X115.049 Y181.345
G1 X118.76 Y177.634 E.15631
G1 X118.227 Y177.634
G1 X114.516 Y181.345 E.15631
G1 X113.983 Y181.345
G1 X117.693 Y177.634 E.15631
G1 X117.16 Y177.634
G1 X113.449 Y181.345 E.15631
G1 X112.916 Y181.345
G1 X116.627 Y177.634 E.15631
G1 X116.094 Y177.634
G1 X112.383 Y181.345 E.15631
G1 X111.85 Y181.345
G1 X115.56 Y177.634 E.15631
G1 X115.027 Y177.634
G1 X111.316 Y181.345 E.15631
G1 X110.783 Y181.345
G1 X114.494 Y177.634 E.15631
G1 X113.961 Y177.634
G1 X110.25 Y181.345 E.15631
G1 X109.717 Y181.345
G1 X113.427 Y177.634 E.15631
G1 X112.894 Y177.634
G1 X109.183 Y181.345 E.15631
G1 X108.65 Y181.345
G1 X112.361 Y177.634 E.15631
G1 X111.828 Y177.634
G1 X108.117 Y181.345 E.15631
G1 X107.584 Y181.345
G1 X111.294 Y177.634 E.15631
G1 X110.761 Y177.634
G1 X107.05 Y181.345 E.15631
G1 X106.517 Y181.345
G1 X110.228 Y177.634 E.15631
G1 X109.695 Y177.634
G1 X105.984 Y181.345 E.15631
G1 X105.451 Y181.345
G1 X109.161 Y177.634 E.15631
G1 X108.628 Y177.634
G1 X104.917 Y181.345 E.15631
G1 X104.384 Y181.345
M73 P73 R3
G1 X108.095 Y177.634 E.15631
G1 X107.562 Y177.634
G1 X103.851 Y181.345 E.15631
G1 X103.318 Y181.345
G1 X107.028 Y177.634 E.15631
G1 X106.495 Y177.634
G1 X102.784 Y181.345 E.15631
G1 X102.251 Y181.345
G1 X105.962 Y177.634 E.15631
G1 X105.429 Y177.634
G1 X101.718 Y181.345 E.15631
G1 X101.417 Y181.112
G1 X104.895 Y177.634 E.1465
G1 X104.362 Y177.634
G1 X101.417 Y180.579 E.12404
G1 X101.417 Y180.045
G1 X103.829 Y177.634 E.10158
G1 X103.295 Y177.634
G1 X101.417 Y179.512 E.07911
G1 X101.417 Y178.979
G1 X102.762 Y177.634 E.05665
G1 X102.229 Y177.634
G1 X101.417 Y178.446 E.03419
; WIPE_START
M204 S5000
G1 X102.229 Y177.634 E-.43614
G1 X102.762 Y177.634 E-.20264
G1 X102.537 Y177.86 E-.12122
; WIPE_END
G1 E-.04 F1800
G1 X102 Y177.208 Z.9 F15000
G1 Z.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X102 Y95.694 E2.50348
; LINE_WIDTH: 0.486803
G1 X102.049 Y95.5 E.00703
G1 X102.121 Y95.5 E.00256
; LINE_WIDTH: 0.45602
G1 X102.194 Y95.5 E.00238
; LINE_WIDTH: 0.43172
G1 X153.806 Y95.5 E1.5851
; LINE_WIDTH: 0.490218
G1 X153.951 Y95.5 E.00515
G1 X153.976 Y95.597 E.00354
; LINE_WIDTH: 0.45602
G1 X154 Y95.694 E.00327
; LINE_WIDTH: 0.43172
G1 X154 Y177.208 E2.50348
; WIPE_START
G1 X154 Y175.208 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.995 Y167.575 Z.9 F15000
G1 X153.951 Y95.5 Z.9
G1 Z.5
G1 E.8 F1800
; LINE_WIDTH: 0.50462
G1 F7500
G1 X153.976 Y95.403 E.00365
; LINE_WIDTH: 0.431819
G1 X154 Y95.306 E.00308
G1 X154 Y70.694 E.75606
; LINE_WIDTH: 0.448395
G1 X153.983 Y70.614 E.00263
; LINE_WIDTH: 0.470635
G1 X153.967 Y70.533 E.00278
G1 X153.806 Y70.5 E.00556
; LINE_WIDTH: 0.43172
G1 X102.194 Y70.5 E1.5851
; LINE_WIDTH: 0.448395
G1 X102.114 Y70.517 E.00263
; LINE_WIDTH: 0.470635
G1 X102.033 Y70.533 E.00278
G1 X102 Y70.694 E.00556
; LINE_WIDTH: 0.43172
G1 X102 Y95.306 E.75587
; LINE_WIDTH: 0.45602
G1 X102.024 Y95.403 E.00327
; LINE_WIDTH: 0.50462
G1 X102.049 Y95.5 E.00365
; CHANGE_LAYER
; Z_HEIGHT: 0.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X102.024 Y95.403 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/10
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
; OBJECT_ID: 113
G1 X101.602 Y181.091
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X154.398 Y181.091 E1.69772
G1 X154.398 Y181.898 E.02593
G1 X101.602 Y181.898 E1.69772
G1 X101.602 Y181.151 E.024
M204 S250
G1 X101.21 Y180.699 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X154.79 Y180.699 E1.59597
G1 X154.79 Y182.29 E.04738
G1 X101.21 Y182.29 E1.59597
G1 X101.21 Y180.759 E.04559
M204 S5000
G1 X101.806 Y181.495 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.44235
G1 F7500
G1 X154.194 Y181.495 E1.65298
; WIPE_START
G1 X152.194 Y181.495 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.285 Y173.863 Z1.1 F15000
G1 X153.21 Y95.898 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X153.602 Y95.898 E.01261
G1 X153.602 Y177.102 E2.61123
G1 X102.398 Y177.102 E1.64654
G1 X102.398 Y95.898 E2.61123
G1 X153.15 Y95.898 E1.632
M204 S250
G1 X153.21 Y96.29 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P74 R3
G1 F6000
M204 S2500
G1 X153.21 Y176.71 E2.39544
G1 X102.79 Y176.71 E1.50184
G1 X102.79 Y96.29 E2.39544
G1 X153.15 Y96.29 E1.50005
; WIPE_START
M204 S5000
G1 X153.151 Y98.29 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.21 Y95.102 Z1.1 F15000
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X102.398 Y95.102 E1.63393
G1 X102.398 Y70.898 E.77832
G1 X153.602 Y70.898 E1.64654
G1 X153.602 Y95.102 E.77832
G1 X153.27 Y95.102 E.01068
M204 S250
G1 X153.21 Y94.71 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y94.71 E1.50184
G1 X102.79 Y71.29 E.6976
G1 X153.21 Y71.29 E1.50184
G1 X153.21 Y94.65 E.69581
; WIPE_START
M204 S5000
G1 X151.21 Y94.652 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.302 Y101.209 Z1.1 F15000
G1 X101.602 Y177.887 Z1.1
G1 Z.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X101.602 Y70.102 E3.46598
G1 X154.398 Y70.102 E1.69772
G1 X154.398 Y177.887 E3.46598
G1 X101.662 Y177.887 E1.69579
M204 S250
G1 X101.21 Y178.279 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X101.21 Y69.71 E3.23391
G1 X154.79 Y69.71 E1.59597
G1 X154.79 Y178.279 E3.23391
G1 X101.27 Y178.279 E1.59418
; WIPE_START
M204 S5000
G1 X101.269 Y176.279 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.03 Y177.459 Z1.1 F15000
G1 Z.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.463107
G1 F7500
G1 X102.015 Y177.382 E.00259
; LINE_WIDTH: 0.446845
G1 X102 Y177.306 E.00249
; LINE_WIDTH: 0.43175
G1 X102 Y95.694 E2.50667
G1 X102.024 Y95.597 E.00308
; LINE_WIDTH: 0.50462
G1 X102.049 Y95.5 E.00365
G1 X102.121 Y95.5 E.00266
; LINE_WIDTH: 0.45602
G1 X102.194 Y95.5 E.00238
; LINE_WIDTH: 0.43172
G1 X153.806 Y95.5 E1.5851
; LINE_WIDTH: 0.490218
G1 X153.951 Y95.5 E.00515
M73 P75 R3
G1 X153.976 Y95.597 E.00354
; LINE_WIDTH: 0.45602
G1 X154 Y95.694 E.00327
; LINE_WIDTH: 0.43172
G1 X154 Y177.306 E2.50648
; LINE_WIDTH: 0.466319
G1 X153.97 Y177.459 E.00523
G1 X153.888 Y177.477 E.00281
; LINE_WIDTH: 0.43876
G1 X153.806 Y177.495 E.00263
; LINE_WIDTH: 0.42095
G1 X102.194 Y177.495 E1.5412
; LINE_WIDTH: 0.463107
G1 X102.089 Y177.472 E.00358
; WIPE_START
G1 X102.015 Y177.382 E-.04405
G1 X102 Y177.306 E-.0297
G1 X102 Y175.5 E-.68625
; WIPE_END
G1 E-.04 F1800
G1 X102.005 Y167.867 Z1.1 F15000
G1 X102.049 Y95.5 Z1.1
G1 Z.7
G1 E.8 F1800
; LINE_WIDTH: 0.50462
G1 F7500
G1 X102.024 Y95.403 E.00365
; LINE_WIDTH: 0.45602
G1 X102 Y95.306 E.00327
; LINE_WIDTH: 0.43172
G1 X102 Y70.694 E.75587
; LINE_WIDTH: 0.470635
G1 X102.033 Y70.533 E.00556
G1 X102.114 Y70.517 E.00278
; LINE_WIDTH: 0.448395
G1 X102.194 Y70.5 E.00263
; LINE_WIDTH: 0.43172
G1 X153.806 Y70.5 E1.5851
; LINE_WIDTH: 0.470635
G1 X153.967 Y70.533 E.00556
G1 X153.983 Y70.614 E.00278
; LINE_WIDTH: 0.448395
G1 X154 Y70.694 E.00263
; LINE_WIDTH: 0.431819
G1 X154 Y95.306 E.75606
G1 X153.976 Y95.403 E.00308
; LINE_WIDTH: 0.50462
G1 X153.951 Y95.5 E.00365
; CHANGE_LAYER
; Z_HEIGHT: 0.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X153.976 Y95.403 E-.76
; WIPE_END
M73 P76 R3
G1 E-.04 F1800
; layer num/total_layer_count: 4/10
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S53.55
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
; OBJECT_ID: 113
G1 X101.602 Y181.094
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X154.398 Y181.094 E1.69772
G1 X154.398 Y181.898 E.02586
G1 X101.602 Y181.898 E1.69772
G1 X101.602 Y181.154 E.02393
M204 S250
G1 X101.21 Y180.702 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X154.79 Y180.702 E1.59597
G1 X154.79 Y182.29 E.04731
G1 X101.21 Y182.29 E1.59597
G1 X101.21 Y180.762 E.04552
M204 S5000
G1 X101.806 Y181.496 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.44001
G1 F7500
G1 X154.194 Y181.496 E1.64329
; WIPE_START
G1 X152.194 Y181.496 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X152.285 Y173.864 Z1.3 F15000
G1 X153.21 Y95.898 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X153.602 Y95.898 E.01261
G1 X153.602 Y177.102 E2.61123
G1 X102.398 Y177.102 E1.64654
G1 X102.398 Y95.898 E2.61123
G1 X153.15 Y95.898 E1.632
M204 S250
G1 X153.21 Y96.29 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X153.21 Y176.71 E2.39544
G1 X102.79 Y176.71 E1.50184
G1 X102.79 Y96.29 E2.39544
G1 X153.15 Y96.29 E1.50005
; WIPE_START
M204 S5000
G1 X153.151 Y98.29 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.21 Y95.102 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X102.398 Y95.102 E1.63393
G1 X102.398 Y70.898 E.77832
G1 X153.602 Y70.898 E1.64654
G1 X153.602 Y95.102 E.77832
G1 X153.27 Y95.102 E.01068
M204 S250
G1 X153.21 Y94.71 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y94.71 E1.50184
G1 X102.79 Y71.29 E.6976
G1 X153.21 Y71.29 E1.50184
G1 X153.21 Y94.65 E.69581
; WIPE_START
M204 S5000
G1 X151.21 Y94.652 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.303 Y101.209 Z1.3 F15000
G1 X101.602 Y177.89 Z1.3
G1 Z.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X101.602 Y70.102 E3.46605
G1 X154.398 Y70.102 E1.69772
M73 P77 R3
G1 X154.398 Y177.89 E3.46605
G1 X101.662 Y177.89 E1.69579
M204 S250
M73 P77 R2
G1 X101.21 Y178.282 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X101.21 Y69.71 E3.23398
G1 X154.79 Y69.71 E1.59597
G1 X154.79 Y178.282 E3.23398
G1 X101.27 Y178.282 E1.59418
; WIPE_START
M204 S5000
G1 X101.269 Y176.282 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.031 Y177.461 Z1.3 F15000
G1 Z.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.464734
G1 F7500
G1 X102.015 Y177.383 E.00263
; LINE_WIDTH: 0.44718
G1 X102 Y177.306 E.00252
; LINE_WIDTH: 0.43175
G1 X102 Y95.694 E2.50667
G1 X102.024 Y95.597 E.00308
; LINE_WIDTH: 0.50462
G1 X102.049 Y95.5 E.00365
G1 X102.121 Y95.5 E.00266
; LINE_WIDTH: 0.45602
G1 X102.194 Y95.5 E.00238
; LINE_WIDTH: 0.43172
G1 X153.806 Y95.5 E1.5851
; LINE_WIDTH: 0.490218
G1 X153.951 Y95.5 E.00515
G1 X153.976 Y95.597 E.00354
; LINE_WIDTH: 0.45602
G1 X154 Y95.694 E.00327
; LINE_WIDTH: 0.43172
G1 X154 Y177.306 E2.50648
; LINE_WIDTH: 0.467256
G1 X153.969 Y177.461 E.0053
G1 X153.887 Y177.478 E.0028
; LINE_WIDTH: 0.440865
G1 X153.806 Y177.496 E.00263
; LINE_WIDTH: 0.42329
G1 X102.194 Y177.496 E1.55074
; LINE_WIDTH: 0.464734
G1 X102.09 Y177.473 E.00357
; WIPE_START
G1 X102.015 Y177.383 E-.04435
G1 X102 Y177.306 E-.03004
M73 P78 R2
G1 X102 Y175.501 E-.68562
; WIPE_END
G1 E-.04 F1800
G1 X102.005 Y167.869 Z1.3 F15000
G1 X102.049 Y95.5 Z1.3
G1 Z.9
G1 E.8 F1800
; LINE_WIDTH: 0.50462
G1 F7500
G1 X102.024 Y95.403 E.00365
; LINE_WIDTH: 0.45602
G1 X102 Y95.306 E.00327
; LINE_WIDTH: 0.43172
G1 X102 Y70.694 E.75587
; LINE_WIDTH: 0.470635
G1 X102.033 Y70.533 E.00556
G1 X102.114 Y70.517 E.00278
; LINE_WIDTH: 0.448395
G1 X102.194 Y70.5 E.00263
; LINE_WIDTH: 0.43172
G1 X153.806 Y70.5 E1.5851
; LINE_WIDTH: 0.470635
G1 X153.967 Y70.533 E.00556
G1 X153.983 Y70.614 E.00278
; LINE_WIDTH: 0.448395
G1 X154 Y70.694 E.00263
; LINE_WIDTH: 0.431819
G1 X154 Y95.306 E.75606
G1 X153.976 Y95.403 E.00308
; LINE_WIDTH: 0.50462
G1 X153.951 Y95.5 E.00365
; CHANGE_LAYER
; Z_HEIGHT: 1.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X153.976 Y95.403 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/10
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S51
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
; OBJECT_ID: 113
G1 X101.21 Y180.704
M73 P79 R2
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X154.79 Y180.704 E1.59597
G1 X154.79 Y181.802 E.03271
G1 X101.21 Y181.802 E1.59597
G1 X101.21 Y180.764 E.03092
; WIPE_START
M204 S5000
G1 X103.21 Y180.762 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X110.842 Y180.784 Z1.5 F15000
G1 X153.849 Y180.911 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X154.532 Y181.595 E.02879
G1 X153.999 Y181.595
G1 X153.316 Y180.911 E.02879
G1 X152.782 Y180.911
G1 X153.466 Y181.595 E.02879
G1 X152.932 Y181.595
G1 X152.249 Y180.911 E.02879
G1 X151.716 Y180.911
G1 X152.399 Y181.595 E.02879
G1 X151.866 Y181.595
G1 X151.183 Y180.911 E.02879
G1 X150.649 Y180.911
G1 X151.333 Y181.595 E.02879
G1 X150.799 Y181.595
G1 X150.116 Y180.911 E.02879
G1 X149.583 Y180.911
G1 X150.266 Y181.595 E.02879
G1 X149.733 Y181.595
G1 X149.05 Y180.911 E.02879
G1 X148.516 Y180.911
G1 X149.2 Y181.595 E.02879
G1 X148.666 Y181.595
G1 X147.983 Y180.911 E.02879
G1 X147.45 Y180.911
G1 X148.133 Y181.595 E.02879
G1 X147.6 Y181.595
G1 X146.916 Y180.911 E.02879
G1 X146.383 Y180.911
G1 X147.067 Y181.595 E.02879
G1 X146.533 Y181.595
G1 X145.85 Y180.911 E.02879
G1 X145.317 Y180.911
G1 X146 Y181.595 E.02879
G1 X145.467 Y181.595
G1 X144.783 Y180.911 E.02879
G1 X144.25 Y180.911
G1 X144.934 Y181.595 E.02879
G1 X144.4 Y181.595
G1 X143.717 Y180.911 E.02879
G1 X143.184 Y180.911
G1 X143.867 Y181.595 E.02879
G1 X143.334 Y181.595
G1 X142.65 Y180.911 E.02879
G1 X142.117 Y180.911
G1 X142.801 Y181.595 E.02879
G1 X142.267 Y181.595
G1 X141.584 Y180.911 E.02879
G1 X141.051 Y180.911
G1 X141.734 Y181.595 E.02879
G1 X141.201 Y181.595
G1 X140.517 Y180.911 E.02879
G1 X139.984 Y180.911
G1 X140.668 Y181.595 E.02879
G1 X140.134 Y181.595
G1 X139.451 Y180.911 E.02879
G1 X138.918 Y180.911
G1 X139.601 Y181.595 E.02879
G1 X139.068 Y181.595
G1 X138.384 Y180.911 E.02879
G1 X137.851 Y180.911
G1 X138.534 Y181.595 E.02879
G1 X138.001 Y181.595
G1 X137.318 Y180.911 E.02879
G1 X136.785 Y180.911
G1 X137.468 Y181.595 E.02879
G1 X136.935 Y181.595
G1 X136.251 Y180.911 E.02879
G1 X135.718 Y180.911
G1 X136.401 Y181.595 E.02879
G1 X135.868 Y181.595
G1 X135.185 Y180.911 E.02879
G1 X134.652 Y180.911
G1 X135.335 Y181.595 E.02879
G1 X134.802 Y181.595
G1 X134.118 Y180.911 E.02879
G1 X133.585 Y180.911
G1 X134.268 Y181.595 E.02879
G1 X133.735 Y181.595
G1 X133.052 Y180.911 E.02879
G1 X132.519 Y180.911
G1 X133.202 Y181.595 E.02879
G1 X132.669 Y181.595
G1 X131.985 Y180.911 E.02879
G1 X131.452 Y180.911
G1 X132.135 Y181.595 E.02879
G1 X131.602 Y181.595
G1 X130.919 Y180.911 E.02879
G1 X130.386 Y180.911
G1 X131.069 Y181.595 E.02879
G1 X130.536 Y181.595
G1 X129.852 Y180.911 E.02879
G1 X129.319 Y180.911
G1 X130.002 Y181.595 E.02879
G1 X129.469 Y181.595
G1 X128.786 Y180.911 E.02879
M73 P80 R2
G1 X128.252 Y180.911
G1 X128.936 Y181.595 E.02879
G1 X128.403 Y181.595
G1 X127.719 Y180.911 E.02879
G1 X127.186 Y180.911
G1 X127.869 Y181.595 E.02879
G1 X127.336 Y181.595
G1 X126.653 Y180.911 E.02879
G1 X126.119 Y180.911
G1 X126.803 Y181.595 E.02879
G1 X126.27 Y181.595
G1 X125.586 Y180.911 E.02879
G1 X125.053 Y180.911
G1 X125.736 Y181.595 E.02879
G1 X125.203 Y181.595
G1 X124.52 Y180.911 E.02879
G1 X123.986 Y180.911
G1 X124.67 Y181.595 E.02879
G1 X124.137 Y181.595
G1 X123.453 Y180.911 E.02879
G1 X122.92 Y180.911
G1 X123.603 Y181.595 E.02879
G1 X123.07 Y181.595
G1 X122.387 Y180.911 E.02879
G1 X121.853 Y180.911
G1 X122.537 Y181.595 E.02879
G1 X122.004 Y181.595
G1 X121.32 Y180.911 E.02879
G1 X120.787 Y180.911
G1 X121.47 Y181.595 E.02879
G1 X120.937 Y181.595
G1 X120.254 Y180.911 E.02879
G1 X119.72 Y180.911
G1 X120.404 Y181.595 E.02879
G1 X119.87 Y181.595
G1 X119.187 Y180.911 E.02879
G1 X118.654 Y180.911
G1 X119.337 Y181.595 E.02879
G1 X118.804 Y181.595
G1 X118.121 Y180.911 E.02879
G1 X117.587 Y180.911
G1 X118.271 Y181.595 E.02879
G1 X117.737 Y181.595
G1 X117.054 Y180.911 E.02879
G1 X116.521 Y180.911
G1 X117.204 Y181.595 E.02879
G1 X116.671 Y181.595
G1 X115.988 Y180.911 E.02879
G1 X115.454 Y180.911
G1 X116.138 Y181.595 E.02879
G1 X115.604 Y181.595
G1 X114.921 Y180.911 E.02879
G1 X114.388 Y180.911
G1 X115.071 Y181.595 E.02879
G1 X114.538 Y181.595
G1 X113.855 Y180.911 E.02879
G1 X113.321 Y180.911
G1 X114.005 Y181.595 E.02879
G1 X113.471 Y181.595
G1 X112.788 Y180.911 E.02879
G1 X112.255 Y180.911
G1 X112.938 Y181.595 E.02879
G1 X112.405 Y181.595
G1 X111.721 Y180.911 E.02879
G1 X111.188 Y180.911
G1 X111.872 Y181.595 E.02879
G1 X111.338 Y181.595
G1 X110.655 Y180.911 E.02879
G1 X110.122 Y180.911
G1 X110.805 Y181.595 E.02879
G1 X110.272 Y181.595
G1 X109.588 Y180.911 E.02879
G1 X109.055 Y180.911
G1 X109.739 Y181.595 E.02879
G1 X109.205 Y181.595
G1 X108.522 Y180.911 E.02879
G1 X107.989 Y180.911
G1 X108.672 Y181.595 E.02879
G1 X108.139 Y181.595
G1 X107.455 Y180.911 E.02879
G1 X106.922 Y180.911
G1 X107.606 Y181.595 E.02879
G1 X107.072 Y181.595
G1 X106.389 Y180.911 E.02879
G1 X105.856 Y180.911
G1 X106.539 Y181.595 E.02879
G1 X106.006 Y181.595
G1 X105.322 Y180.911 E.02879
G1 X104.789 Y180.911
G1 X105.473 Y181.595 E.02879
G1 X104.939 Y181.595
G1 X104.256 Y180.911 E.02879
G1 X103.723 Y180.911
G1 X104.406 Y181.595 E.02879
G1 X103.873 Y181.595
G1 X103.189 Y180.911 E.02879
G1 X102.656 Y180.911
G1 X103.339 Y181.595 E.02879
G1 X102.806 Y181.595
G1 X102.123 Y180.911 E.02879
G1 X101.59 Y180.911
G1 X102.273 Y181.595 E.02879
; WIPE_START
M204 S5000
G1 X101.59 Y180.911 E-.36725
G1 X102.123 Y180.911 E-.20264
G1 X102.477 Y181.265 E-.19011
; WIPE_END
G1 E-.04 F1800
G1 X101.432 Y180.893 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11052
G1 F7500
G1 X101.432 Y181.614 E.00385
; WIPE_START
G1 X101.432 Y180.893 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X105.417 Y174.383 Z1.5 F15000
G1 X153.21 Y96.29 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X153.21 Y176.71 E2.39544
G1 X102.79 Y176.71 E1.50184
G1 X102.79 Y96.29 E2.39544
G1 X153.15 Y96.29 E1.50005
; WIPE_START
M204 S5000
G1 X153.151 Y98.29 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.21 Y95.102 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X102.398 Y95.102 E1.63393
G1 X102.398 Y70.898 E.77832
G1 X153.602 Y70.898 E1.64654
G1 X153.602 Y95.102 E.77832
G1 X153.27 Y95.102 E.01068
M204 S250
G1 X153.21 Y94.71 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y94.71 E1.50184
G1 X102.79 Y71.29 E.6976
G1 X153.21 Y71.29 E1.50184
G1 X153.21 Y94.65 E.69581
; WIPE_START
M204 S5000
G1 X151.21 Y94.652 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.602 Y96.29 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X153.602 Y95.898 E.01261
G1 X102.398 Y95.898 E1.64654
G1 X102.398 Y163.832 E2.18451
G1 X101.602 Y163.832 E.02559
G1 X101.602 Y70.102 E3.01401
G1 X154.398 Y70.102 E1.69772
G1 X154.398 Y163.832 E3.01401
G1 X153.602 Y163.832 E.02559
G1 X153.602 Y96.35 E2.16998
; WIPE_START
G1 X153.602 Y95.898 E-.17179
G1 X152.054 Y95.898 E-.58821
; WIPE_END
G1 E-.04 F1800
G1 X148.046 Y102.393 Z1.5 F15000
G1 X101.21 Y178.284 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X101.21 Y69.71 E3.23405
G1 X154.79 Y69.71 E1.59597
G1 X154.79 Y178.284 E3.23405
G1 X101.27 Y178.284 E1.59418
; WIPE_START
M204 S5000
G1 X101.269 Y176.284 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.709 Y168.664 Z1.5 F15000
G1 X102 Y163.628 Z1.5
G1 Z1.1
M73 P81 R2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X102 Y95.694 E2.08642
; LINE_WIDTH: 0.486803
G1 X102.049 Y95.5 E.00703
G1 X102.121 Y95.5 E.00256
; LINE_WIDTH: 0.45602
G1 X102.194 Y95.5 E.00238
; LINE_WIDTH: 0.43172
G1 X153.806 Y95.5 E1.5851
; LINE_WIDTH: 0.490218
G1 X153.951 Y95.5 E.00515
G1 X153.976 Y95.597 E.00354
; LINE_WIDTH: 0.45602
G1 X154 Y95.694 E.00327
; LINE_WIDTH: 0.43172
G1 X154 Y163.628 E2.08642
; WIPE_START
G1 X154 Y161.628 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.583 Y164.581 Z1.5 F15000
G1 Z1.1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X154.056 Y164.054 E.02218
G1 X153.523 Y164.054
G1 X154.583 Y165.114 E.04464
G1 X154.583 Y165.647
G1 X153.417 Y164.482 E.04908
G1 X153.417 Y165.016
G1 X154.583 Y166.181 E.04908
G1 X154.583 Y166.714
G1 X153.417 Y165.549 E.04908
G1 X153.417 Y166.082
G1 X154.583 Y167.247 E.04908
G1 X154.583 Y167.781
G1 X153.417 Y166.615 E.04908
G1 X153.417 Y167.149
G1 X154.583 Y168.314 E.04908
G1 X154.583 Y168.847
G1 X153.417 Y167.682 E.04908
G1 X153.417 Y168.215
G1 X154.583 Y169.38 E.04908
G1 X154.583 Y169.914
G1 X153.417 Y168.748 E.04908
M73 P82 R2
G1 X153.417 Y169.282
G1 X154.583 Y170.447 E.04908
G1 X154.583 Y170.98
G1 X153.417 Y169.815 E.04908
G1 X153.417 Y170.348
G1 X154.583 Y171.513 E.04908
G1 X154.583 Y172.047
G1 X153.417 Y170.881 E.04908
G1 X153.417 Y171.415
G1 X154.583 Y172.58 E.04908
G1 X154.583 Y173.113
G1 X153.417 Y171.948 E.04908
G1 X153.417 Y172.481
G1 X154.583 Y173.646 E.04908
G1 X154.583 Y174.18
G1 X153.417 Y173.014 E.04908
G1 X153.417 Y173.548
G1 X154.583 Y174.713 E.04908
G1 X154.583 Y175.246
G1 X153.417 Y174.081 E.04908
G1 X153.417 Y174.614
G1 X154.583 Y175.779 E.04908
G1 X154.583 Y176.313
G1 X153.417 Y175.147 E.04908
G1 X153.417 Y175.681
G1 X154.583 Y176.846 E.04908
G1 X154.583 Y177.379
G1 X153.417 Y176.214 E.04908
G1 X153.417 Y176.747
G1 X154.583 Y177.912 E.04908
G1 X154.213 Y178.077
G1 X153.054 Y176.917 E.04883
G1 X152.521 Y176.917
G1 X153.68 Y178.077 E.04883
G1 X153.147 Y178.077
G1 X151.988 Y176.917 E.04883
G1 X151.455 Y176.917
G1 X152.614 Y178.077 E.04883
G1 X152.08 Y178.077
G1 X150.921 Y176.917 E.04883
G1 X150.388 Y176.917
G1 X151.547 Y178.077 E.04883
G1 X151.014 Y178.077
G1 X149.855 Y176.917 E.04883
G1 X149.322 Y176.917
G1 X150.481 Y178.077 E.04883
G1 X149.947 Y178.077
G1 X148.788 Y176.917 E.04883
G1 X148.255 Y176.917
G1 X149.414 Y178.077 E.04883
G1 X148.881 Y178.077
G1 X147.722 Y176.917 E.04883
G1 X147.188 Y176.917
G1 X148.348 Y178.077 E.04883
G1 X147.814 Y178.077
G1 X146.655 Y176.917 E.04883
G1 X146.122 Y176.917
G1 X147.281 Y178.077 E.04883
G1 X146.748 Y178.077
G1 X145.589 Y176.917 E.04883
G1 X145.055 Y176.917
G1 X146.215 Y178.077 E.04883
G1 X145.681 Y178.077
G1 X144.522 Y176.917 E.04883
G1 X143.989 Y176.917
G1 X145.148 Y178.077 E.04883
G1 X144.615 Y178.077
G1 X143.456 Y176.917 E.04883
G1 X142.922 Y176.917
G1 X144.082 Y178.077 E.04883
G1 X143.548 Y178.077
G1 X142.389 Y176.917 E.04883
G1 X141.856 Y176.917
G1 X143.015 Y178.077 E.04883
G1 X142.482 Y178.077
G1 X141.323 Y176.917 E.04883
G1 X140.789 Y176.917
G1 X141.949 Y178.077 E.04883
G1 X141.415 Y178.077
G1 X140.256 Y176.917 E.04883
G1 X139.723 Y176.917
G1 X140.882 Y178.077 E.04883
G1 X140.349 Y178.077
M73 P83 R2
G1 X139.19 Y176.917 E.04883
G1 X138.656 Y176.917
G1 X139.816 Y178.077 E.04883
G1 X139.282 Y178.077
G1 X138.123 Y176.917 E.04883
G1 X137.59 Y176.917
G1 X138.749 Y178.077 E.04883
G1 X138.216 Y178.077
G1 X137.057 Y176.917 E.04883
G1 X136.523 Y176.917
G1 X137.682 Y178.077 E.04883
G1 X137.149 Y178.077
G1 X135.99 Y176.917 E.04883
G1 X135.457 Y176.917
G1 X136.616 Y178.077 E.04883
G1 X136.083 Y178.077
G1 X134.924 Y176.917 E.04883
G1 X134.39 Y176.917
G1 X135.549 Y178.077 E.04883
G1 X135.016 Y178.077
G1 X133.857 Y176.917 E.04883
G1 X133.324 Y176.917
G1 X134.483 Y178.077 E.04883
G1 X133.95 Y178.077
G1 X132.791 Y176.917 E.04883
G1 X132.257 Y176.917
G1 X133.416 Y178.077 E.04883
G1 X132.883 Y178.077
G1 X131.724 Y176.917 E.04883
G1 X131.191 Y176.917
G1 X132.35 Y178.077 E.04883
G1 X131.817 Y178.077
G1 X130.658 Y176.917 E.04883
G1 X130.124 Y176.917
G1 X131.283 Y178.077 E.04883
G1 X130.75 Y178.077
G1 X129.591 Y176.917 E.04883
G1 X129.058 Y176.917
G1 X130.217 Y178.077 E.04883
G1 X129.684 Y178.077
G1 X128.524 Y176.917 E.04883
G1 X127.991 Y176.917
G1 X129.15 Y178.077 E.04883
G1 X128.617 Y178.077
G1 X127.458 Y176.917 E.04883
G1 X126.925 Y176.917
G1 X128.084 Y178.077 E.04883
G1 X127.551 Y178.077
G1 X126.391 Y176.917 E.04883
G1 X125.858 Y176.917
G1 X127.017 Y178.077 E.04883
G1 X126.484 Y178.077
G1 X125.325 Y176.917 E.04883
G1 X124.792 Y176.917
G1 X125.951 Y178.077 E.04883
G1 X125.418 Y178.077
G1 X124.258 Y176.917 E.04883
G1 X123.725 Y176.917
G1 X124.884 Y178.077 E.04883
G1 X124.351 Y178.077
G1 X123.192 Y176.917 E.04883
G1 X122.659 Y176.917
G1 X123.818 Y178.077 E.04883
G1 X123.285 Y178.077
G1 X122.125 Y176.917 E.04883
G1 X121.592 Y176.917
G1 X122.751 Y178.077 E.04883
G1 X122.218 Y178.077
G1 X121.059 Y176.917 E.04883
G1 X120.526 Y176.917
G1 X121.685 Y178.077 E.04883
G1 X121.152 Y178.077
G1 X119.992 Y176.917 E.04883
G1 X119.459 Y176.917
G1 X120.618 Y178.077 E.04883
G1 X120.085 Y178.077
G1 X118.926 Y176.917 E.04883
G1 X118.393 Y176.917
G1 X119.552 Y178.077 E.04883
G1 X119.018 Y178.077
G1 X117.859 Y176.917 E.04883
G1 X117.326 Y176.917
G1 X118.485 Y178.077 E.04883
G1 X117.952 Y178.077
G1 X116.793 Y176.917 E.04883
G1 X116.26 Y176.917
G1 X117.419 Y178.077 E.04883
G1 X116.885 Y178.077
G1 X115.726 Y176.917 E.04883
G1 X115.193 Y176.917
G1 X116.352 Y178.077 E.04883
G1 X115.819 Y178.077
G1 X114.66 Y176.917 E.04883
G1 X114.127 Y176.917
G1 X115.286 Y178.077 E.04883
G1 X114.752 Y178.077
G1 X113.593 Y176.917 E.04883
G1 X113.06 Y176.917
G1 X114.219 Y178.077 E.04883
G1 X113.686 Y178.077
G1 X112.527 Y176.917 E.04883
G1 X111.994 Y176.917
G1 X113.153 Y178.077 E.04883
G1 X112.619 Y178.077
G1 X111.46 Y176.917 E.04883
G1 X110.927 Y176.917
G1 X112.086 Y178.077 E.04883
G1 X111.553 Y178.077
G1 X110.394 Y176.917 E.04883
G1 X109.86 Y176.917
G1 X111.02 Y178.077 E.04883
G1 X110.486 Y178.077
G1 X109.327 Y176.917 E.04883
G1 X108.794 Y176.917
G1 X109.953 Y178.077 E.04883
G1 X109.42 Y178.077
G1 X108.261 Y176.917 E.04883
G1 X107.727 Y176.917
G1 X108.887 Y178.077 E.04883
G1 X108.353 Y178.077
G1 X107.194 Y176.917 E.04883
G1 X106.661 Y176.917
G1 X107.82 Y178.077 E.04883
G1 X107.287 Y178.077
G1 X106.128 Y176.917 E.04883
G1 X105.594 Y176.917
G1 X106.754 Y178.077 E.04883
G1 X106.22 Y178.077
G1 X105.061 Y176.917 E.04883
G1 X104.528 Y176.917
G1 X105.687 Y178.077 E.04883
G1 X105.154 Y178.077
G1 X103.995 Y176.917 E.04883
G1 X103.461 Y176.917
G1 X104.621 Y178.077 E.04883
G1 X104.087 Y178.077
G1 X102.928 Y176.917 E.04883
; WIPE_START
M204 S5000
G1 X104.087 Y178.077 E-.62292
G1 X104.448 Y178.077 E-.13708
; WIPE_END
G1 E-.04 F1800
G1 X103.383 Y170.519 Z1.5 F15000
G1 X102.583 Y164.84 Z1.5
G1 Z1.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X101.797 Y164.054 E.0331
G1 X101.417 Y164.208
G1 X102.583 Y165.373 E.04909
G1 X102.583 Y165.907
G1 X101.417 Y164.741 E.04909
G1 X101.417 Y165.275
G1 X102.583 Y166.44 E.04909
G1 X102.583 Y166.973
G1 X101.417 Y165.808 E.04909
G1 X101.417 Y166.341
G1 X102.583 Y167.506 E.04909
G1 X102.583 Y168.04
G1 X101.417 Y166.875 E.04909
G1 X101.417 Y167.408
G1 X102.583 Y168.573 E.04909
G1 X102.583 Y169.106
G1 X101.417 Y167.941 E.04909
G1 X101.417 Y168.474
G1 X102.583 Y169.64 E.04909
G1 X102.583 Y170.173
G1 X101.417 Y169.008 E.04909
G1 X101.417 Y169.541
G1 X102.583 Y170.706 E.04908
G1 X102.583 Y171.239
G1 X101.417 Y170.074 E.04908
G1 X101.417 Y170.607
M73 P84 R2
G1 X102.583 Y171.773 E.04908
G1 X102.583 Y172.306
G1 X101.417 Y171.141 E.04908
G1 X101.417 Y171.674
G1 X102.583 Y172.839 E.04908
G1 X102.583 Y173.372
G1 X101.417 Y172.207 E.04908
G1 X101.417 Y172.74
G1 X102.583 Y173.906 E.04908
G1 X102.583 Y174.439
G1 X101.417 Y173.274 E.04908
G1 X101.417 Y173.807
G1 X102.583 Y174.972 E.04908
G1 X102.583 Y175.505
G1 X101.417 Y174.34 E.04908
G1 X101.417 Y174.873
G1 X102.583 Y176.039 E.04908
G1 X102.583 Y176.572
G1 X101.417 Y175.407 E.04908
G1 X101.417 Y175.94
G1 X103.554 Y178.077 E.09
G1 X103.021 Y178.077
G1 X101.417 Y176.473 E.06754
G1 X101.417 Y177.006
G1 X102.487 Y178.077 E.04508
G1 X101.954 Y178.077
G1 X101.417 Y177.54 E.02262
; WIPE_START
M204 S5000
G1 X101.954 Y178.077 E-.28851
G1 X102.487 Y178.077 E-.20264
G1 X101.987 Y177.576 E-.26885
; WIPE_END
G1 E-.04 F1800
G1 X101.993 Y169.944 Z1.5 F15000
G1 X102.049 Y95.5 Z1.5
G1 Z1.1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.50462
G1 F7500
G1 X102.024 Y95.403 E.00365
; LINE_WIDTH: 0.45602
G1 X102 Y95.306 E.00327
; LINE_WIDTH: 0.43172
G1 X102 Y70.694 E.75587
; LINE_WIDTH: 0.470635
G1 X102.033 Y70.533 E.00556
G1 X102.114 Y70.517 E.00278
; LINE_WIDTH: 0.448395
G1 X102.194 Y70.5 E.00263
; LINE_WIDTH: 0.43172
G1 X153.806 Y70.5 E1.5851
; LINE_WIDTH: 0.470635
G1 X153.967 Y70.533 E.00556
G1 X153.983 Y70.614 E.00278
; LINE_WIDTH: 0.448395
G1 X154 Y70.694 E.00263
; LINE_WIDTH: 0.431819
G1 X154 Y95.306 E.75606
G1 X153.976 Y95.403 E.00308
; LINE_WIDTH: 0.50462
G1 X153.951 Y95.5 E.00365
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X153.976 Y95.403 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/10
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S81.6
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
; OBJECT_ID: 113
G1 X153.21 Y95.102
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X102.398 Y95.102 E1.63393
G1 X102.398 Y70.898 E.77832
G1 X153.602 Y70.898 E1.64654
G1 X153.602 Y95.102 E.77832
G1 X153.27 Y95.102 E.01068
M204 S250
G1 X153.21 Y94.71 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y94.71 E1.50184
G1 X102.79 Y71.29 E.6976
G1 X153.21 Y71.29 E1.50184
G1 X153.21 Y94.65 E.69581
; WIPE_START
M204 S5000
G1 X151.21 Y94.652 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.602 Y95.898 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X102.398 Y95.898 E1.64654
G1 X102.398 Y146.73 E1.63456
G1 X101.602 Y146.73 E.02559
G1 X101.602 Y70.102 E2.46406
G1 X154.398 Y70.102 E1.69772
G1 X154.398 Y146.73 E2.46406
G1 X153.602 Y146.73 E.02559
G1 X153.602 Y95.958 E1.63263
M204 S250
G1 X153.21 Y96.29 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y96.29 E1.50184
G1 X102.79 Y164.7 E2.03769
G1 X101.21 Y164.7 E.04706
G1 X101.21 Y69.71 E2.82942
G1 X154.79 Y69.71 E1.59597
G1 X154.79 Y164.7 E2.82942
G1 X153.21 Y164.7 E.04706
G1 X153.21 Y96.35 E2.03591
; WIPE_START
M204 S5000
G1 X151.21 Y96.348 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154 Y95.694 Z1.7 F15000
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X154 Y146.526 E1.56116
; WIPE_START
G1 X154 Y144.526 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.232 Y152.155 Z1.7 F15000
G1 X154.583 Y163.675 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X153.765 Y164.492 E.03444
G1 X153.417 Y164.307
G1 X154.583 Y163.142 E.04908
G1 X154.583 Y162.608
G1 X153.417 Y163.774 E.04908
M73 P84 R1
G1 X153.417 Y163.24
G1 X154.583 Y162.075 E.04908
G1 X154.583 Y161.542
G1 X153.417 Y162.707 E.04908
G1 X153.417 Y162.174
G1 X154.583 Y161.009 E.04908
G1 X154.583 Y160.475
G1 X153.417 Y161.641 E.04908
G1 X153.417 Y161.107
G1 X154.583 Y159.942 E.04908
M73 P85 R1
G1 X154.583 Y159.409
G1 X153.417 Y160.574 E.04908
G1 X153.417 Y160.041
G1 X154.583 Y158.876 E.04908
G1 X154.583 Y158.342
G1 X153.417 Y159.507 E.04908
G1 X153.417 Y158.974
G1 X154.583 Y157.809 E.04908
G1 X154.583 Y157.276
G1 X153.417 Y158.441 E.04908
G1 X153.417 Y157.908
G1 X154.583 Y156.742 E.04908
G1 X154.583 Y156.209
G1 X153.417 Y157.374 E.04908
G1 X153.417 Y156.841
G1 X154.583 Y155.676 E.04908
G1 X154.583 Y155.143
G1 X153.417 Y156.308 E.04908
G1 X153.417 Y155.775
G1 X154.583 Y154.609 E.04908
G1 X154.583 Y154.076
G1 X153.417 Y155.241 E.04908
G1 X153.417 Y154.708
G1 X154.583 Y153.543 E.04908
G1 X154.583 Y153.01
G1 X153.417 Y154.175 E.04908
G1 X153.417 Y153.642
G1 X154.583 Y152.476 E.04908
M73 P86 R1
G1 X154.583 Y151.943
G1 X153.417 Y153.108 E.04908
G1 X153.417 Y152.575
G1 X154.583 Y151.41 E.04908
G1 X154.583 Y150.877
G1 X153.417 Y152.042 E.04908
G1 X153.417 Y151.509
G1 X154.583 Y150.343 E.04908
G1 X154.583 Y149.81
G1 X153.417 Y150.975 E.04908
G1 X153.417 Y150.442
G1 X154.583 Y149.277 E.04908
G1 X154.583 Y148.744
G1 X153.417 Y149.909 E.04908
G1 X153.417 Y149.376
G1 X154.583 Y148.21 E.04908
G1 X154.583 Y147.677
G1 X153.417 Y148.842 E.04908
G1 X153.417 Y148.309
G1 X154.583 Y147.144 E.04908
G1 X154.241 Y146.952
G1 X153.417 Y147.776 E.0347
; WIPE_START
M204 S5000
G1 X154.241 Y146.952 E-.44271
G1 X154.583 Y147.144 E-.14882
G1 X154.269 Y147.457 E-.16847
; WIPE_END
G1 E-.04 F1800
G1 X146.638 Y147.321 Z1.7 F15000
G1 X102 Y146.526 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X102 Y95.694 E1.56116
; LINE_WIDTH: 0.486803
G1 X102.049 Y95.5 E.00703
G1 X102.121 Y95.5 E.00256
; LINE_WIDTH: 0.45602
G1 X102.194 Y95.5 E.00238
; LINE_WIDTH: 0.43172
G1 X153.806 Y95.5 E1.5851
; LINE_WIDTH: 0.490218
G1 X153.951 Y95.5 E.00515
G1 X153.976 Y95.597 E.00354
; LINE_WIDTH: 0.45602
G1 X154 Y95.694 E.00327
G1 X153.951 Y95.5 F15000
; LINE_WIDTH: 0.50462
G1 F7500
G1 X153.976 Y95.403 E.00365
; LINE_WIDTH: 0.431819
G1 X154 Y95.306 E.00308
G1 X154 Y70.694 E.75606
; LINE_WIDTH: 0.448395
G1 X153.983 Y70.614 E.00263
; LINE_WIDTH: 0.470635
G1 X153.967 Y70.533 E.00278
G1 X153.806 Y70.5 E.00556
; LINE_WIDTH: 0.43172
G1 X102.194 Y70.5 E1.5851
; LINE_WIDTH: 0.448395
G1 X102.114 Y70.517 E.00263
; LINE_WIDTH: 0.470635
G1 X102.033 Y70.533 E.00278
G1 X102 Y70.694 E.00556
; LINE_WIDTH: 0.43172
G1 X102 Y95.306 E.75587
; LINE_WIDTH: 0.45602
G1 X102.024 Y95.403 E.00327
; LINE_WIDTH: 0.50462
G1 X102.049 Y95.5 E.00365
; WIPE_START
G1 X102.024 Y95.403 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.026 Y103.035 Z1.7 F15000
G1 X102.039 Y164.492 Z1.7
G1 Z1.3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X102.583 Y163.949 E.02289
G1 X102.583 Y163.416
G1 X101.506 Y164.492 E.04536
G1 X101.417 Y164.048
G1 X102.583 Y162.882 E.04908
G1 X102.583 Y162.349
G1 X101.417 Y163.514 E.04908
G1 X101.417 Y162.981
G1 X102.583 Y161.816 E.04908
G1 X102.583 Y161.283
G1 X101.417 Y162.448 E.04908
G1 X101.417 Y161.915
G1 X102.583 Y160.749 E.04908
G1 X102.583 Y160.216
G1 X101.417 Y161.381 E.04908
G1 X101.417 Y160.848
G1 X102.583 Y159.683 E.04908
G1 X102.583 Y159.15
G1 X101.417 Y160.315 E.04908
G1 X101.417 Y159.782
G1 X102.583 Y158.616 E.04908
G1 X102.583 Y158.083
G1 X101.417 Y159.248 E.04908
G1 X101.417 Y158.715
G1 X102.583 Y157.55 E.04908
G1 X102.583 Y157.017
G1 X101.417 Y158.182 E.04908
G1 X101.417 Y157.648
G1 X102.583 Y156.483 E.04908
G1 X102.583 Y155.95
G1 X101.417 Y157.115 E.04908
G1 X101.417 Y156.582
G1 X102.583 Y155.417 E.04908
G1 X102.583 Y154.883
G1 X101.417 Y156.049 E.04908
G1 X101.417 Y155.515
G1 X102.583 Y154.35 E.04908
G1 X102.583 Y153.817
G1 X101.417 Y154.982 E.04908
G1 X101.417 Y154.449
G1 X102.583 Y153.284 E.04908
G1 X102.583 Y152.75
G1 X101.417 Y153.916 E.04908
G1 X101.417 Y153.382
G1 X102.583 Y152.217 E.04908
G1 X102.583 Y151.684
G1 X101.417 Y152.849 E.04908
G1 X101.417 Y152.316
G1 X102.583 Y151.151 E.04908
G1 X102.583 Y150.617
G1 X101.417 Y151.783 E.04908
G1 X101.417 Y151.249
G1 X102.583 Y150.084 E.04908
G1 X102.583 Y149.551
G1 X101.417 Y150.716 E.04908
G1 X101.417 Y150.183
G1 X102.583 Y149.018 E.04908
G1 X102.583 Y148.484
G1 X101.417 Y149.65 E.04908
G1 X101.417 Y149.116
G1 X102.583 Y147.951 E.04908
G1 X102.583 Y147.418
G1 X101.417 Y148.583 E.04908
G1 X101.417 Y148.05
G1 X102.515 Y146.952 E.04625
G1 X101.982 Y146.952
G1 X101.417 Y147.517 E.02378
; CHANGE_LAYER
; Z_HEIGHT: 1.5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X101.982 Y146.952 E-.3034
G1 X102.515 Y146.952 E-.20264
G1 X102.043 Y147.425 E-.25397
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/10
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
M106 S89.25
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
; OBJECT_ID: 113
G1 X153.21 Y95.102
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X102.398 Y95.102 E1.63393
G1 X102.398 Y70.898 E.77832
G1 X153.602 Y70.898 E1.64654
G1 X153.602 Y95.102 E.77832
G1 X153.27 Y95.102 E.01068
M204 S250
G1 X153.21 Y94.71 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y94.71 E1.50184
G1 X102.79 Y71.29 E.6976
G1 X153.21 Y71.29 E1.50184
G1 X153.21 Y94.65 E.69581
; WIPE_START
M204 S5000
G1 X151.21 Y94.652 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.602 Y95.898 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P87 R1
G1 X102.398 Y95.898 E1.64654
G1 X102.398 Y129.627 E1.08461
G1 X101.602 Y129.627 E.02559
G1 X101.602 Y70.102 E1.91411
G1 X154.398 Y70.102 E1.69772
G1 X154.398 Y129.627 E1.91411
G1 X153.602 Y129.627 E.02559
G1 X153.602 Y95.958 E1.08268
M204 S250
G1 X153.21 Y96.29 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y96.29 E1.50184
G1 X102.79 Y147.597 E1.52827
G1 X101.21 Y147.597 E.04706
G1 X101.21 Y69.71 E2.32
G1 X154.79 Y69.71 E1.59597
G1 X154.79 Y147.597 E2.32
G1 X153.21 Y147.597 E.04706
G1 X153.21 Y96.35 E1.52648
; WIPE_START
M204 S5000
G1 X151.21 Y96.348 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154 Y95.694 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45602
G1 F7500
G1 X153.976 Y95.597 E.00327
; LINE_WIDTH: 0.490218
G1 X153.951 Y95.5 E.00354
G1 X153.806 Y95.5 E.00515
; LINE_WIDTH: 0.43172
G1 X102.194 Y95.5 E1.5851
; LINE_WIDTH: 0.45602
G1 X102.121 Y95.5 E.00238
; LINE_WIDTH: 0.486803
G1 X102.049 Y95.5 E.00256
G1 X102 Y95.694 E.00703
; LINE_WIDTH: 0.43172
G1 X102 Y129.424 E1.0359
; WIPE_START
G1 X102 Y127.424 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.583 Y130.712 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X101.72 Y129.85 E.03632
G1 X101.417 Y130.08
G1 X102.583 Y131.245 E.04908
G1 X102.583 Y131.778
G1 X101.417 Y130.613 E.04908
G1 X101.417 Y131.146
G1 X102.583 Y132.311 E.04908
G1 X102.583 Y132.845
G1 X101.417 Y131.68 E.04908
G1 X101.417 Y132.213
G1 X102.583 Y133.378 E.04908
G1 X102.583 Y133.911
G1 X101.417 Y132.746 E.04908
G1 X101.417 Y133.279
G1 X102.583 Y134.445 E.04908
G1 X102.583 Y134.978
G1 X101.417 Y133.813 E.04908
G1 X101.417 Y134.346
G1 X102.583 Y135.511 E.04908
G1 X102.583 Y136.044
G1 X101.417 Y134.879 E.04908
G1 X101.417 Y135.412
G1 X102.583 Y136.578 E.04908
G1 X102.583 Y137.111
G1 X101.417 Y135.946 E.04908
G1 X101.417 Y136.479
M73 P88 R1
G1 X102.583 Y137.644 E.04908
G1 X102.583 Y138.177
G1 X101.417 Y137.012 E.04908
G1 X101.417 Y137.545
G1 X102.583 Y138.711 E.04908
G1 X102.583 Y139.244
G1 X101.417 Y138.079 E.04908
G1 X101.417 Y138.612
G1 X102.583 Y139.777 E.04908
G1 X102.583 Y140.31
G1 X101.417 Y139.145 E.04908
G1 X101.417 Y139.678
G1 X102.583 Y140.844 E.04908
G1 X102.583 Y141.377
G1 X101.417 Y140.212 E.04908
G1 X101.417 Y140.745
G1 X102.583 Y141.91 E.04908
G1 X102.583 Y142.443
G1 X101.417 Y141.278 E.04908
G1 X101.417 Y141.811
G1 X102.583 Y142.977 E.04908
G1 X102.583 Y143.51
G1 X101.417 Y142.345 E.04908
G1 X101.417 Y142.878
G1 X102.583 Y144.043 E.04908
G1 X102.583 Y144.576
G1 X101.417 Y143.411 E.04908
G1 X101.417 Y143.944
G1 X102.583 Y145.11 E.04908
G1 X102.583 Y145.643
G1 X101.417 Y144.478 E.04908
G1 X101.417 Y145.011
G1 X102.583 Y146.176 E.04908
G1 X102.583 Y146.709
G1 X101.417 Y145.544 E.04908
G1 X101.417 Y146.077
G1 X102.583 Y147.243 E.04908
G1 X102.197 Y147.39
G1 X101.417 Y146.611 E.03282
; WIPE_START
M204 S5000
G1 X102.197 Y147.39 E-.41874
G1 X102.583 Y147.243 E-.157
G1 X102.24 Y146.9 E-.18426
; WIPE_END
G1 E-.04 F1800
G1 X102.211 Y139.267 Z1.9 F15000
G1 X102.049 Y95.5 Z1.9
G1 Z1.5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.50462
G1 F7500
G1 X102.024 Y95.403 E.00365
; LINE_WIDTH: 0.45602
G1 X102 Y95.306 E.00327
; LINE_WIDTH: 0.43172
G1 X102 Y70.694 E.75587
; LINE_WIDTH: 0.470635
G1 X102.033 Y70.533 E.00556
G1 X102.114 Y70.517 E.00278
; LINE_WIDTH: 0.448395
G1 X102.194 Y70.5 E.00263
; LINE_WIDTH: 0.43172
G1 X153.806 Y70.5 E1.5851
; LINE_WIDTH: 0.470635
G1 X153.967 Y70.533 E.00556
G1 X153.983 Y70.614 E.00278
; LINE_WIDTH: 0.448395
G1 X154 Y70.694 E.00263
; LINE_WIDTH: 0.431819
G1 X154 Y95.306 E.75606
G1 X153.976 Y95.403 E.00308
; LINE_WIDTH: 0.50462
G1 X153.951 Y95.5 E.00365
G1 X154 Y95.694 F15000
; LINE_WIDTH: 0.43172
G1 F7500
G1 X154 Y129.424 E1.0359
; WIPE_START
G1 X154 Y127.424 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.583 Y130.452 Z1.9 F15000
G1 Z1.5
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X153.98 Y129.85 E.0254
G1 X153.446 Y129.85
G1 X154.583 Y130.986 E.04786
G1 X154.583 Y131.519
G1 X153.417 Y130.354 E.04908
G1 X153.417 Y130.887
G1 X154.583 Y132.052 E.04908
G1 X154.583 Y132.586
G1 X153.417 Y131.42 E.04908
G1 X153.417 Y131.954
G1 X154.583 Y133.119 E.04908
G1 X154.583 Y133.652
G1 X153.417 Y132.487 E.04908
G1 X153.417 Y133.02
G1 X154.583 Y134.185 E.04908
G1 X154.583 Y134.719
G1 X153.417 Y133.553 E.04908
G1 X153.417 Y134.087
G1 X154.583 Y135.252 E.04908
G1 X154.583 Y135.785
G1 X153.417 Y134.62 E.04908
G1 X153.417 Y135.153
G1 X154.583 Y136.318 E.04908
G1 X154.583 Y136.852
G1 X153.417 Y135.686 E.04908
G1 X153.417 Y136.22
G1 X154.583 Y137.385 E.04908
G1 X154.583 Y137.918
G1 X153.417 Y136.753 E.04908
G1 X153.417 Y137.286
G1 X154.583 Y138.451 E.04908
G1 X154.583 Y138.985
G1 X153.417 Y137.819 E.04908
G1 X153.417 Y138.353
G1 X154.583 Y139.518 E.04908
G1 X154.583 Y140.051
G1 X153.417 Y138.886 E.04908
G1 X153.417 Y139.419
G1 X154.583 Y140.584 E.04908
M73 P89 R1
G1 X154.583 Y141.118
G1 X153.417 Y139.952 E.04908
G1 X153.417 Y140.486
G1 X154.583 Y141.651 E.04908
G1 X154.583 Y142.184
G1 X153.417 Y141.019 E.04908
G1 X153.417 Y141.552
G1 X154.583 Y142.717 E.04908
G1 X154.583 Y143.251
G1 X153.417 Y142.085 E.04908
G1 X153.417 Y142.619
G1 X154.583 Y143.784 E.04908
G1 X154.583 Y144.317
G1 X153.417 Y143.152 E.04908
G1 X153.417 Y143.685
G1 X154.583 Y144.85 E.04908
G1 X154.583 Y145.384
G1 X153.417 Y144.218 E.04908
G1 X153.417 Y144.752
G1 X154.583 Y145.917 E.04908
G1 X154.583 Y146.45
G1 X153.417 Y145.285 E.04908
G1 X153.417 Y145.818
G1 X154.583 Y146.983 E.04908
G1 X154.456 Y147.39
G1 X153.417 Y146.352 E.04374
G1 X153.417 Y146.885
G1 X153.923 Y147.39 E.02128
; CHANGE_LAYER
; Z_HEIGHT: 1.7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X153.417 Y146.885 E-.27148
G1 X153.417 Y146.352 E-.20264
G1 X153.949 Y146.883 E-.28588
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/10
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
M106 S96.9
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
; OBJECT_ID: 113
G1 X153.21 Y95.102
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X102.398 Y95.102 E1.63393
G1 X102.398 Y70.898 E.77832
G1 X153.602 Y70.898 E1.64654
G1 X153.602 Y95.102 E.77832
G1 X153.27 Y95.102 E.01068
M204 S250
G1 X153.21 Y94.71 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y94.71 E1.50184
G1 X102.79 Y71.29 E.6976
G1 X153.21 Y71.29 E1.50184
G1 X153.21 Y94.65 E.69581
; WIPE_START
M204 S5000
G1 X151.21 Y94.652 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X153.602 Y95.898 Z2.1 F15000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X102.398 Y95.898 E1.64654
G1 X102.398 Y112.525 E.53466
G1 X101.602 Y112.525 E.02559
G1 X101.602 Y70.102 E1.36416
G1 X154.398 Y70.102 E1.69772
G1 X154.398 Y112.525 E1.36416
G1 X153.602 Y112.525 E.02559
G1 X153.602 Y95.958 E.53273
M204 S250
G1 X153.21 Y96.29 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y96.29 E1.50184
G1 X102.79 Y130.495 E1.01885
G1 X101.21 Y130.495 E.04706
G1 X101.21 Y69.71 E1.81057
G1 X154.79 Y69.71 E1.59597
G1 X154.79 Y130.495 E1.81057
G1 X153.21 Y130.495 E.04706
G1 X153.21 Y96.35 E1.01706
; WIPE_START
M204 S5000
G1 X151.21 Y96.348 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154 Y95.694 Z2.1 F15000
G1 Z1.7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.45602
G1 F7500
G1 X153.976 Y95.597 E.00327
; LINE_WIDTH: 0.490218
G1 X153.951 Y95.5 E.00354
G1 X153.806 Y95.5 E.00515
; LINE_WIDTH: 0.43172
G1 X102.194 Y95.5 E1.5851
; LINE_WIDTH: 0.45602
G1 X102.121 Y95.5 E.00238
; LINE_WIDTH: 0.486803
G1 X102.049 Y95.5 E.00256
G1 X102 Y95.694 E.00703
; LINE_WIDTH: 0.43172
G1 X102 Y112.321 E.51065
; WIPE_START
G1 X102 Y110.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.025 Y102.689 Z2.1 F15000
G1 X102.049 Y95.5 Z2.1
G1 Z1.7
G1 E.8 F1800
; LINE_WIDTH: 0.50462
G1 F7500
G1 X102.024 Y95.403 E.00365
; LINE_WIDTH: 0.45602
G1 X102 Y95.306 E.00327
; LINE_WIDTH: 0.43172
G1 X102 Y70.694 E.75587
; LINE_WIDTH: 0.470635
G1 X102.033 Y70.533 E.00556
G1 X102.114 Y70.517 E.00278
; LINE_WIDTH: 0.448395
G1 X102.194 Y70.5 E.00263
; LINE_WIDTH: 0.43172
G1 X153.806 Y70.5 E1.5851
; LINE_WIDTH: 0.470635
G1 X153.967 Y70.533 E.00556
G1 X153.983 Y70.614 E.00278
; LINE_WIDTH: 0.448395
G1 X154 Y70.694 E.00263
; LINE_WIDTH: 0.431819
G1 X154 Y95.306 E.75606
G1 X153.976 Y95.403 E.00308
; LINE_WIDTH: 0.50462
G1 X153.951 Y95.5 E.00365
G1 X154 Y95.694 F15000
; LINE_WIDTH: 0.43172
G1 F7500
M73 P90 R1
G1 X154 Y112.321 E.51065
; WIPE_START
G1 X154 Y110.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.231 Y117.95 Z2.1 F15000
G1 X154.583 Y129.546 Z2.1
G1 Z1.7
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X153.841 Y130.287 E.03122
G1 X153.417 Y130.178
G1 X154.583 Y129.013 E.04908
G1 X154.583 Y128.48
G1 X153.417 Y129.645 E.04908
G1 X153.417 Y129.112
G1 X154.583 Y127.947 E.04908
G1 X154.583 Y127.413
G1 X153.417 Y128.579 E.04908
G1 X153.417 Y128.045
G1 X154.583 Y126.88 E.04908
G1 X154.583 Y126.347
G1 X153.417 Y127.512 E.04908
G1 X153.417 Y126.979
G1 X154.583 Y125.814 E.04908
G1 X154.583 Y125.28
G1 X153.417 Y126.446 E.04908
G1 X153.417 Y125.912
G1 X154.583 Y124.747 E.04908
G1 X154.583 Y124.214
G1 X153.417 Y125.379 E.04908
G1 X153.417 Y124.846
G1 X154.583 Y123.681 E.04908
G1 X154.583 Y123.147
G1 X153.417 Y124.313 E.04908
G1 X153.417 Y123.779
G1 X154.583 Y122.614 E.04908
G1 X154.583 Y122.081
G1 X153.417 Y123.246 E.04908
G1 X153.417 Y122.713
G1 X154.583 Y121.548 E.04908
G1 X154.583 Y121.014
G1 X153.417 Y122.179 E.04908
G1 X153.417 Y121.646
G1 X154.583 Y120.481 E.04908
G1 X154.583 Y119.948
G1 X153.417 Y121.113 E.04908
G1 X153.417 Y120.58
G1 X154.583 Y119.414 E.04908
G1 X154.583 Y118.881
G1 X153.417 Y120.046 E.04908
G1 X153.417 Y119.513
G1 X154.583 Y118.348 E.04908
G1 X154.583 Y117.815
G1 X153.417 Y118.98 E.04908
G1 X153.417 Y118.447
G1 X154.583 Y117.281 E.04908
G1 X154.583 Y116.748
G1 X153.417 Y117.913 E.04908
G1 X153.417 Y117.38
G1 X154.583 Y116.215 E.04908
G1 X154.583 Y115.682
G1 X153.417 Y116.847 E.04908
G1 X153.417 Y116.314
G1 X154.583 Y115.148 E.04908
G1 X154.583 Y114.615
G1 X153.417 Y115.78 E.04908
G1 X153.417 Y115.247
G1 X154.583 Y114.082 E.04908
G1 X154.583 Y113.549
G1 X153.417 Y114.714 E.04908
G1 X153.417 Y114.181
G1 X154.583 Y113.015 E.04908
G1 X154.318 Y112.747
G1 X153.417 Y113.647 E.03792
G1 X153.417 Y113.114
G1 X153.784 Y112.747 E.01546
; WIPE_START
M204 S5000
G1 X153.417 Y113.114 E-.1972
G1 X153.417 Y113.647 E-.20264
G1 X154.088 Y112.977 E-.36016
; WIPE_END
G1 E-.04 F1800
G1 X146.846 Y115.389 Z2.1 F15000
G1 X102.116 Y130.287 Z2.1
G1 Z1.7
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X102.583 Y129.82 E.01968
G1 X102.583 Y129.287
G1 X101.582 Y130.287 E.04214
G1 X101.417 Y129.919
G1 X102.583 Y128.754 E.04908
G1 X102.583 Y128.221
G1 X101.417 Y129.386 E.04908
M73 P91 R1
G1 X101.417 Y128.853
G1 X102.583 Y127.687 E.04908
G1 X102.583 Y127.154
G1 X101.417 Y128.319 E.04908
G1 X101.417 Y127.786
G1 X102.583 Y126.621 E.04908
G1 X102.583 Y126.088
G1 X101.417 Y127.253 E.04908
G1 X101.417 Y126.72
G1 X102.583 Y125.554 E.04908
G1 X102.583 Y125.021
G1 X101.417 Y126.186 E.04908
G1 X101.417 Y125.653
G1 X102.583 Y124.488 E.04908
G1 X102.583 Y123.955
G1 X101.417 Y125.12 E.04908
G1 X101.417 Y124.587
G1 X102.583 Y123.421 E.04908
G1 X102.583 Y122.888
G1 X101.417 Y124.053 E.04908
G1 X101.417 Y123.52
G1 X102.583 Y122.355 E.04908
G1 X102.583 Y121.822
G1 X101.417 Y122.987 E.04908
G1 X101.417 Y122.453
G1 X102.583 Y121.288 E.04908
G1 X102.583 Y120.755
G1 X101.417 Y121.92 E.04908
G1 X101.417 Y121.387
G1 X102.583 Y120.222 E.04908
G1 X102.583 Y119.688
G1 X101.417 Y120.854 E.04908
G1 X101.417 Y120.32
G1 X102.583 Y119.155 E.04908
G1 X102.583 Y118.622
G1 X101.417 Y119.787 E.04908
G1 X101.417 Y119.254
G1 X102.583 Y118.089 E.04908
G1 X102.583 Y117.555
G1 X101.417 Y118.721 E.04908
G1 X101.417 Y118.187
G1 X102.583 Y117.022 E.04908
G1 X102.583 Y116.489
G1 X101.417 Y117.654 E.04908
G1 X101.417 Y117.121
G1 X102.583 Y115.956 E.04908
G1 X102.583 Y115.422
G1 X101.417 Y116.588 E.04908
G1 X101.417 Y116.054
G1 X102.583 Y114.889 E.04908
G1 X102.583 Y114.356
G1 X101.417 Y115.521 E.04908
G1 X101.417 Y114.988
G1 X102.583 Y113.823 E.04908
G1 X102.583 Y113.289
G1 X101.417 Y114.455 E.04908
G1 X101.417 Y113.921
G1 X102.583 Y112.756 E.04908
G1 X102.058 Y112.747
G1 X101.417 Y113.388 E.027
; CHANGE_LAYER
; Z_HEIGHT: 1.9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X102.058 Y112.747 E-.34446
G1 X102.583 Y112.756 E-.19925
G1 X102.18 Y113.159 E-.2163
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/10
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
M106 S99.45
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
; OBJECT_ID: 113
G1 X153.21 Y95.102
G1 Z1.9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6939
G1 X102.398 Y95.102 E1.63393
G1 X102.398 Y70.898 E.77832
G1 X153.602 Y70.898 E1.64654
G1 X153.602 Y95.102 E.77832
G1 X153.27 Y95.102 E.01068
M204 S250
G1 X153.21 Y94.71 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y94.71 E1.50184
G1 X102.79 Y71.29 E.6976
G1 X153.21 Y71.29 E1.50184
G1 X153.21 Y94.65 E.69581
M204 S5000
G1 X153.21 Y95.422 F15000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6939
G1 X151.682 Y95.422 E.04913
G1 X151.682 Y95.898 E.0153
G1 X104.318 Y95.898 E1.52306
G1 X104.318 Y95.422 E.0153
G1 X101.602 Y95.422 E.08733
G1 X101.602 Y70.102 E.8142
G1 X154.398 Y70.102 E1.69772
G1 X154.398 Y95.422 E.8142
G1 X153.27 Y95.422 E.03627
M204 S250
G1 X153.21 Y96.29 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y96.29 E1.50184
G1 X102.79 Y113.392 E.50942
G1 X101.21 Y113.392 E.04706
G1 X101.21 Y69.71 E1.30115
G1 X154.79 Y69.71 E1.59597
G1 X154.79 Y113.392 E1.30115
G1 X153.21 Y113.392 E.04706
G1 X153.21 Y96.35 E.50764
M204 S5000
G1 X153.903 Y95.645 F15000
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X154.583 Y96.324 E.02861
G1 X154.583 Y96.857
G1 X153.37 Y95.645 E.05108
G1 X153.275 Y96.083
G1 X152.837 Y95.645 E.01845
G1 X152.419 Y95.76
G1 X152.741 Y96.083 E.01359
G1 X153.417 Y96.225
G1 X154.583 Y97.391 E.04908
G1 X154.583 Y97.924
G1 X153.417 Y96.759 E.04908
G1 X153.417 Y97.292
G1 X154.583 Y98.457 E.04908
G1 X154.583 Y98.99
G1 X153.417 Y97.825 E.04908
G1 X153.417 Y98.358
G1 X154.583 Y99.524 E.04908
G1 X154.583 Y100.057
G1 X153.417 Y98.892 E.04908
G1 X153.417 Y99.425
G1 X154.583 Y100.59 E.04908
G1 X154.583 Y101.123
G1 X153.417 Y99.958 E.04908
G1 X153.417 Y100.491
G1 X154.583 Y101.657 E.04908
G1 X154.583 Y102.19
M73 P92 R1
G1 X153.417 Y101.025 E.04908
G1 X153.417 Y101.558
G1 X154.583 Y102.723 E.04908
G1 X154.583 Y103.256
G1 X153.417 Y102.091 E.04908
G1 X153.417 Y102.624
G1 X154.583 Y103.79 E.04908
G1 X154.583 Y104.323
G1 X153.417 Y103.158 E.04908
G1 X153.417 Y103.691
G1 X154.583 Y104.856 E.04908
G1 X154.583 Y105.389
G1 X153.417 Y104.224 E.04908
G1 X153.417 Y104.757
G1 X154.583 Y105.923 E.04908
G1 X154.583 Y106.456
G1 X153.417 Y105.291 E.04908
G1 X153.417 Y105.824
M73 P92 R0
G1 X154.583 Y106.989 E.04908
G1 X154.583 Y107.522
G1 X153.417 Y106.357 E.04908
G1 X153.417 Y106.89
G1 X154.583 Y108.056 E.04908
G1 X154.583 Y108.589
G1 X153.417 Y107.424 E.04908
G1 X153.417 Y107.957
G1 X154.583 Y109.122 E.04908
G1 X154.583 Y109.655
G1 X153.417 Y108.49 E.04908
G1 X153.417 Y109.023
G1 X154.583 Y110.189 E.04908
G1 X154.583 Y110.722
G1 X153.417 Y109.557 E.04908
G1 X153.417 Y110.09
G1 X154.583 Y111.255 E.04908
G1 X154.583 Y111.788
G1 X153.417 Y110.623 E.04908
G1 X153.417 Y111.157
G1 X154.583 Y112.322 E.04908
G1 X154.583 Y112.855
G1 X153.417 Y111.69 E.04908
G1 X153.417 Y112.223
G1 X154.379 Y113.185 E.04052
G1 X153.846 Y113.185
G1 X153.417 Y112.756 E.01806
; WIPE_START
M204 S5000
G1 X153.846 Y113.185 E-.23042
G1 X154.379 Y113.185 E-.20264
G1 X153.771 Y112.577 E-.32695
; WIPE_END
G1 E-.04 F1800
G1 X154.55 Y113.204 Z2.3 F15000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.150558
G1 F6939
G1 X154.55 Y113.015 E.00161
G1 X154.512 Y112.925 E.00083
; WIPE_START
G1 F7500
G1 X154.55 Y113.015 E-.25791
G1 X154.55 Y113.204 E-.50209
; WIPE_END
G1 E-.04 F1800
G1 X153.506 Y105.643 Z2.3 F15000
G1 X152.147 Y95.808 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50814
G1 F4800
G2 X152.146 Y95.909 I-.029 J.05 E.00882
G1 X151.479 Y95.5 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F6939
G1 X104.521 Y95.5 E1.44217
; WIPE_START
G1 F7500
G1 X106.521 Y95.5 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X103.148 Y96.083 Z2.3 F15000
G1 Z1.9
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X102.711 Y95.645 E.01845
G1 X102.177 Y95.645
G1 X102.615 Y96.083 E.01845
G1 X102.583 Y96.583
G1 X101.644 Y95.645 E.03953
G1 X101.417 Y95.951
G1 X102.583 Y97.116 E.04908
G1 X102.583 Y97.65
G1 X101.417 Y96.485 E.04908
G1 X101.417 Y97.018
G1 X102.583 Y98.183 E.04908
G1 X102.583 Y98.716
G1 X101.417 Y97.551 E.04908
G1 X101.417 Y98.084
G1 X102.583 Y99.25 E.04908
G1 X102.583 Y99.783
G1 X101.417 Y98.618 E.04908
M73 P93 R0
G1 X101.417 Y99.151
G1 X102.583 Y100.316 E.04908
G1 X102.583 Y100.849
G1 X101.417 Y99.684 E.04908
G1 X101.417 Y100.217
G1 X102.583 Y101.383 E.04908
G1 X102.583 Y101.916
G1 X101.417 Y100.751 E.04908
G1 X101.417 Y101.284
G1 X102.583 Y102.449 E.04908
G1 X102.583 Y102.982
G1 X101.417 Y101.817 E.04908
G1 X101.417 Y102.35
G1 X102.583 Y103.516 E.04908
G1 X102.583 Y104.049
G1 X101.417 Y102.884 E.04908
G1 X101.417 Y103.417
G1 X102.583 Y104.582 E.04908
G1 X102.583 Y105.115
G1 X101.417 Y103.95 E.04908
G1 X101.417 Y104.483
G1 X102.583 Y105.649 E.04908
G1 X102.583 Y106.182
G1 X101.417 Y105.017 E.04908
G1 X101.417 Y105.55
G1 X102.583 Y106.715 E.04908
G1 X102.583 Y107.248
G1 X101.417 Y106.083 E.04908
G1 X101.417 Y106.616
G1 X102.583 Y107.782 E.04908
G1 X102.583 Y108.315
G1 X101.417 Y107.15 E.04908
G1 X101.417 Y107.683
G1 X102.583 Y108.848 E.04908
G1 X102.583 Y109.381
G1 X101.417 Y108.216 E.04908
G1 X101.417 Y108.749
G1 X102.583 Y109.915 E.04908
G1 X102.583 Y110.448
G1 X101.417 Y109.283 E.04908
G1 X101.417 Y109.816
G1 X102.583 Y110.981 E.04908
G1 X102.583 Y111.514
G1 X101.417 Y110.349 E.04908
G1 X101.417 Y110.882
G1 X102.583 Y112.048 E.04908
G1 X102.583 Y112.581
G1 X101.417 Y111.416 E.04908
G1 X101.417 Y111.949
G1 X102.583 Y113.114 E.04908
G1 X102.12 Y113.185
G1 X101.417 Y112.482 E.0296
; WIPE_START
M204 S5000
G1 X102.12 Y113.185 E-.37768
G1 X102.583 Y113.114 E-.17778
G1 X102.202 Y112.734 E-.20454
; WIPE_END
G1 E-.04 F1800
G1 X102.431 Y105.105 Z2.3 F15000
G1 X102.704 Y95.994 Z2.3
G1 Z1.9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.11161
G1 F6939
G1 X102.823 Y96.069 E.00076
; LINE_WIDTH: 0.0942269
G1 X102.815 Y96.085 E.00007
; LINE_WIDTH: 0.0682399
G1 X102.806 Y96.101 E.00004
; WIPE_START
G1 F7500
G1 X102.815 Y96.085 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102 Y95.219 Z2.3 F15000
G1 Z1.9
G1 E.8 F1800
; LINE_WIDTH: 0.43172
G1 F6939
G1 X102 Y70.694 E.7532
; LINE_WIDTH: 0.470635
G1 X102.033 Y70.533 E.00556
G1 X102.114 Y70.517 E.00278
; LINE_WIDTH: 0.448395
G1 X102.194 Y70.5 E.00263
; LINE_WIDTH: 0.43172
G1 X153.806 Y70.5 E1.5851
; LINE_WIDTH: 0.470635
G1 X153.967 Y70.533 E.00556
G1 X153.983 Y70.614 E.00278
; LINE_WIDTH: 0.448395
G1 X154 Y70.694 E.00263
; LINE_WIDTH: 0.43172
G1 X154 Y95.219 E.7532
; CHANGE_LAYER
; Z_HEIGHT: 2.1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X154 Y93.219 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/10
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.3 I1.217 J0 P1  F15000
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
; OBJECT_ID: 113
G1 X153.21 Y94.71
G1 Z2.1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X102.79 Y94.71 E1.50184
G1 X102.79 Y71.29 E.6976
G1 X153.21 Y71.29 E1.50184
G1 X153.21 Y94.65 E.69581
; WIPE_START
M204 S5000
G1 X151.21 Y94.652 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.79 Y96.29 Z2.5 F15000
G1 Z2.1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X101.21 Y96.29 E1.59597
G1 X101.21 Y69.71 E.79173
G1 X154.79 Y69.71 E1.59597
G1 X154.79 Y96.23 E.78994
M204 S5000
G1 X154.583 Y95.418 F15000
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X153.918 Y96.083 E.028
G1 X153.385 Y96.083
G1 X154.583 Y94.885 E.05046
G1 X154.583 Y94.351
G1 X152.851 Y96.083 E.07293
G1 X152.318 Y96.083
G1 X154.583 Y93.818 E.09539
G1 X154.583 Y93.285
G1 X153.417 Y94.45 E.04909
G1 X153.417 Y93.917
G1 X154.583 Y92.752 E.04909
G1 X154.583 Y92.218
G1 X153.417 Y93.384 E.04909
G1 X153.417 Y92.85
G1 X154.583 Y91.685 E.04909
G1 X154.583 Y91.152
G1 X153.417 Y92.317 E.04909
G1 X153.417 Y91.784
G1 X154.583 Y90.619 E.04909
G1 X154.583 Y90.085
G1 X153.417 Y91.251 E.04909
G1 X153.417 Y90.717
G1 X154.583 Y89.552 E.04909
G1 X154.583 Y89.019
G1 X153.417 Y90.184 E.04909
G1 X153.417 Y89.651
G1 X154.583 Y88.486 E.04909
G1 X154.583 Y87.952
G1 X153.417 Y89.118 E.04909
G1 X153.417 Y88.584
G1 X154.583 Y87.419 E.04909
G1 X154.583 Y86.886
G1 X153.417 Y88.051 E.04909
G1 X153.417 Y87.518
G1 X154.583 Y86.353 E.04909
G1 X154.583 Y85.819
G1 X153.417 Y86.984 E.04909
G1 X153.417 Y86.451
G1 X154.583 Y85.286 E.04909
G1 X154.583 Y84.753
G1 X153.417 Y85.918 E.04909
G1 X153.417 Y85.385
G1 X154.583 Y84.219 E.04909
G1 X154.583 Y83.686
G1 X153.417 Y84.851 E.04909
M73 P94 R0
G1 X153.417 Y84.318
G1 X154.583 Y83.153 E.04909
G1 X154.583 Y82.62
G1 X153.417 Y83.785 E.04909
G1 X153.417 Y83.252
G1 X154.583 Y82.086 E.04909
G1 X154.583 Y81.553
G1 X153.417 Y82.718 E.04909
G1 X153.417 Y82.185
G1 X154.583 Y81.02 E.04909
G1 X154.583 Y80.487
G1 X153.417 Y81.652 E.04909
G1 X153.417 Y81.119
G1 X154.583 Y79.953 E.04909
G1 X154.583 Y79.42
G1 X153.417 Y80.585 E.04909
G1 X153.417 Y80.052
G1 X154.583 Y78.887 E.04909
G1 X154.583 Y78.354
G1 X153.417 Y79.519 E.04909
G1 X153.417 Y78.986
G1 X154.583 Y77.82 E.04909
G1 X154.583 Y77.287
G1 X153.417 Y78.452 E.04909
G1 X153.417 Y77.919
G1 X154.583 Y76.754 E.04909
G1 X154.583 Y76.221
G1 X153.417 Y77.386 E.04909
G1 X153.417 Y76.853
G1 X154.583 Y75.687 E.04909
G1 X154.583 Y75.154
G1 X153.417 Y76.319 E.04909
G1 X153.417 Y75.786
G1 X154.583 Y74.621 E.04909
G1 X154.583 Y74.088
G1 X153.417 Y75.253 E.04909
G1 X153.417 Y74.72
G1 X154.583 Y73.554 E.04909
G1 X154.583 Y73.021
G1 X153.417 Y74.186 E.04909
G1 X153.417 Y73.653
G1 X154.583 Y72.488 E.04909
G1 X154.583 Y71.955
G1 X153.417 Y73.12 E.04909
G1 X153.417 Y72.587
G1 X154.583 Y71.421 E.04909
G1 X154.583 Y70.888
G1 X153.417 Y72.053 E.04909
G1 X153.417 Y71.52
G1 X154.583 Y70.355 E.04909
G1 X154.487 Y69.917
G1 X153.322 Y71.083 E.04909
G1 X152.788 Y71.083
G1 X153.954 Y69.917 E.04909
G1 X153.42 Y69.917
G1 X152.255 Y71.083 E.04909
G1 X151.722 Y71.083
G1 X152.887 Y69.917 E.04909
G1 X152.354 Y69.917
G1 X151.189 Y71.083 E.04909
G1 X150.655 Y71.083
G1 X151.82 Y69.917 E.04909
G1 X151.287 Y69.917
G1 X150.122 Y71.083 E.04909
G1 X149.589 Y71.083
G1 X150.754 Y69.917 E.04909
G1 X150.221 Y69.917
G1 X149.055 Y71.083 E.04909
G1 X148.522 Y71.083
G1 X149.687 Y69.917 E.04909
G1 X149.154 Y69.917
G1 X147.989 Y71.083 E.04909
G1 X147.456 Y71.083
G1 X148.621 Y69.917 E.04909
G1 X148.088 Y69.917
G1 X146.922 Y71.083 E.04909
G1 X146.389 Y71.083
G1 X147.554 Y69.917 E.04909
G1 X147.021 Y69.917
G1 X145.856 Y71.083 E.04909
G1 X145.323 Y71.083
G1 X146.488 Y69.917 E.04909
G1 X145.955 Y69.917
G1 X144.789 Y71.083 E.04909
G1 X144.256 Y71.083
G1 X145.421 Y69.917 E.04909
G1 X144.888 Y69.917
G1 X143.723 Y71.083 E.04909
G1 X143.19 Y71.083
G1 X144.355 Y69.917 E.04909
G1 X143.822 Y69.917
G1 X142.656 Y71.083 E.04909
G1 X142.123 Y71.083
G1 X143.288 Y69.917 E.04909
G1 X142.755 Y69.917
G1 X141.59 Y71.083 E.04909
G1 X141.057 Y71.083
G1 X142.222 Y69.917 E.04909
G1 X141.689 Y69.917
G1 X140.523 Y71.083 E.04909
G1 X139.99 Y71.083
G1 X141.155 Y69.917 E.04909
G1 X140.622 Y69.917
G1 X139.457 Y71.083 E.04909
G1 X138.924 Y71.083
G1 X140.089 Y69.917 E.04909
G1 X139.556 Y69.917
G1 X138.39 Y71.083 E.04909
G1 X137.857 Y71.083
G1 X139.022 Y69.917 E.04909
G1 X138.489 Y69.917
G1 X137.324 Y71.083 E.04909
G1 X136.791 Y71.083
G1 X137.956 Y69.917 E.04909
G1 X137.423 Y69.917
G1 X136.257 Y71.083 E.04909
G1 X135.724 Y71.083
G1 X136.889 Y69.917 E.04909
G1 X136.356 Y69.917
G1 X135.191 Y71.083 E.04909
G1 X134.658 Y71.083
G1 X135.823 Y69.917 E.04909
G1 X135.29 Y69.917
G1 X134.124 Y71.083 E.04909
G1 X133.591 Y71.083
G1 X134.756 Y69.917 E.04909
G1 X134.223 Y69.917
G1 X133.058 Y71.083 E.04909
G1 X132.524 Y71.083
G1 X133.69 Y69.917 E.04909
G1 X133.156 Y69.917
G1 X131.991 Y71.083 E.04909
G1 X131.458 Y71.083
G1 X132.623 Y69.917 E.04909
G1 X132.09 Y69.917
G1 X130.925 Y71.083 E.04909
G1 X130.391 Y71.083
G1 X131.557 Y69.917 E.04909
G1 X131.023 Y69.917
G1 X129.858 Y71.083 E.04909
G1 X129.325 Y71.083
G1 X130.49 Y69.917 E.04909
G1 X129.957 Y69.917
G1 X128.792 Y71.083 E.04909
M73 P95 R0
G1 X128.258 Y71.083
G1 X129.424 Y69.917 E.04909
G1 X128.89 Y69.917
G1 X127.725 Y71.083 E.04909
G1 X127.192 Y71.083
G1 X128.357 Y69.917 E.04909
G1 X127.824 Y69.917
G1 X126.659 Y71.083 E.04909
G1 X126.125 Y71.083
G1 X127.291 Y69.917 E.04909
G1 X126.757 Y69.917
G1 X125.592 Y71.083 E.04909
G1 X125.059 Y71.083
G1 X126.224 Y69.917 E.04909
G1 X125.691 Y69.917
G1 X124.526 Y71.083 E.04909
G1 X123.992 Y71.083
G1 X125.158 Y69.917 E.04909
G1 X124.624 Y69.917
G1 X123.459 Y71.083 E.04909
G1 X122.926 Y71.083
G1 X124.091 Y69.917 E.04909
G1 X123.558 Y69.917
G1 X122.393 Y71.083 E.04909
G1 X121.859 Y71.083
G1 X123.025 Y69.917 E.04909
G1 X122.491 Y69.917
G1 X121.326 Y71.083 E.04909
G1 X120.793 Y71.083
G1 X121.958 Y69.917 E.04909
G1 X121.425 Y69.917
G1 X120.26 Y71.083 E.04909
G1 X119.726 Y71.083
G1 X120.892 Y69.917 E.04909
G1 X120.358 Y69.917
G1 X119.193 Y71.083 E.04909
G1 X118.66 Y71.083
G1 X119.825 Y69.917 E.04909
G1 X119.292 Y69.917
G1 X118.127 Y71.083 E.04909
G1 X117.593 Y71.083
G1 X118.759 Y69.917 E.04909
G1 X118.225 Y69.917
G1 X117.06 Y71.083 E.04909
G1 X116.527 Y71.083
G1 X117.692 Y69.917 E.04909
G1 X117.159 Y69.917
G1 X115.994 Y71.083 E.04909
G1 X115.46 Y71.083
G1 X116.625 Y69.917 E.04909
G1 X116.092 Y69.917
G1 X114.927 Y71.083 E.04909
G1 X114.394 Y71.083
G1 X115.559 Y69.917 E.04909
G1 X115.026 Y69.917
G1 X113.86 Y71.083 E.04909
G1 X113.327 Y71.083
G1 X114.492 Y69.917 E.04909
G1 X113.959 Y69.917
G1 X112.794 Y71.083 E.04909
G1 X112.261 Y71.083
G1 X113.426 Y69.917 E.04909
G1 X112.893 Y69.917
G1 X111.727 Y71.083 E.04909
G1 X111.194 Y71.083
G1 X112.359 Y69.917 E.04909
G1 X111.826 Y69.917
G1 X110.661 Y71.083 E.04909
G1 X110.128 Y71.083
G1 X111.293 Y69.917 E.04909
G1 X110.76 Y69.917
G1 X109.594 Y71.083 E.04909
G1 X109.061 Y71.083
G1 X110.226 Y69.917 E.04909
G1 X109.693 Y69.917
G1 X108.528 Y71.083 E.04909
G1 X107.995 Y71.083
G1 X109.16 Y69.917 E.04909
G1 X108.627 Y69.917
G1 X107.461 Y71.083 E.04909
G1 X106.928 Y71.083
G1 X108.093 Y69.917 E.04909
G1 X107.56 Y69.917
G1 X106.395 Y71.083 E.04909
G1 X105.862 Y71.083
G1 X107.027 Y69.917 E.04909
G1 X106.494 Y69.917
G1 X105.328 Y71.083 E.04909
G1 X104.795 Y71.083
G1 X105.96 Y69.917 E.04909
G1 X105.427 Y69.917
G1 X104.262 Y71.083 E.04909
G1 X103.729 Y71.083
G1 X104.894 Y69.917 E.04909
G1 X104.361 Y69.917
G1 X103.195 Y71.083 E.04909
G1 X102.662 Y71.083
G1 X103.827 Y69.917 E.04909
; WIPE_START
M204 S5000
G1 X102.662 Y71.083 E-.62621
G1 X103.014 Y71.083 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X109.806 Y74.564 Z2.5 F15000
G1 X151.785 Y96.083 Z2.5
G1 Z2.1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X152.95 Y94.917 E.04909
G1 X152.417 Y94.917
G1 X151.252 Y96.083 E.04909
G1 X150.718 Y96.083
G1 X151.884 Y94.917 E.04909
G1 X151.35 Y94.917
G1 X150.185 Y96.083 E.04909
G1 X149.652 Y96.083
G1 X150.817 Y94.917 E.04909
G1 X150.284 Y94.917
G1 X149.119 Y96.083 E.04909
G1 X148.585 Y96.083
G1 X149.751 Y94.917 E.04909
G1 X149.217 Y94.917
G1 X148.052 Y96.083 E.04909
G1 X147.519 Y96.083
G1 X148.684 Y94.917 E.04909
G1 X148.151 Y94.917
G1 X146.986 Y96.083 E.04909
G1 X146.452 Y96.083
G1 X147.618 Y94.917 E.04909
G1 X147.084 Y94.917
G1 X145.919 Y96.083 E.04909
G1 X145.386 Y96.083
G1 X146.551 Y94.917 E.04909
G1 X146.018 Y94.917
G1 X144.853 Y96.083 E.04909
G1 X144.319 Y96.083
G1 X145.485 Y94.917 E.04909
G1 X144.951 Y94.917
G1 X143.786 Y96.083 E.04909
G1 X143.253 Y96.083
G1 X144.418 Y94.917 E.04909
G1 X143.885 Y94.917
G1 X142.719 Y96.083 E.04909
G1 X142.186 Y96.083
G1 X143.351 Y94.917 E.04909
G1 X142.818 Y94.917
G1 X141.653 Y96.083 E.04909
G1 X141.12 Y96.083
G1 X142.285 Y94.917 E.04909
G1 X141.752 Y94.917
G1 X140.586 Y96.083 E.04909
G1 X140.053 Y96.083
G1 X141.218 Y94.917 E.04909
G1 X140.685 Y94.917
G1 X139.52 Y96.083 E.04909
G1 X138.987 Y96.083
G1 X140.152 Y94.917 E.04909
G1 X139.619 Y94.917
G1 X138.453 Y96.083 E.04909
G1 X137.92 Y96.083
G1 X139.085 Y94.917 E.04909
G1 X138.552 Y94.917
G1 X137.387 Y96.083 E.04909
G1 X136.854 Y96.083
G1 X138.019 Y94.917 E.04909
G1 X137.486 Y94.917
G1 X136.32 Y96.083 E.04909
G1 X135.787 Y96.083
G1 X136.952 Y94.917 E.04909
G1 X136.419 Y94.917
G1 X135.254 Y96.083 E.04909
M73 P96 R0
G1 X134.721 Y96.083
G1 X135.886 Y94.917 E.04909
G1 X135.353 Y94.917
G1 X134.187 Y96.083 E.04909
G1 X133.654 Y96.083
G1 X134.819 Y94.917 E.04909
G1 X134.286 Y94.917
G1 X133.121 Y96.083 E.04909
G1 X132.588 Y96.083
G1 X133.753 Y94.917 E.04909
G1 X133.22 Y94.917
G1 X132.054 Y96.083 E.04909
G1 X131.521 Y96.083
G1 X132.686 Y94.917 E.04909
G1 X132.153 Y94.917
G1 X130.988 Y96.083 E.04909
G1 X130.455 Y96.083
G1 X131.62 Y94.917 E.04909
G1 X131.087 Y94.917
G1 X129.921 Y96.083 E.04909
G1 X129.388 Y96.083
G1 X130.553 Y94.917 E.04909
G1 X130.02 Y94.917
G1 X128.855 Y96.083 E.04909
G1 X128.322 Y96.083
G1 X129.487 Y94.917 E.04909
G1 X128.954 Y94.917
G1 X127.788 Y96.083 E.04909
G1 X127.255 Y96.083
G1 X128.42 Y94.917 E.04909
G1 X127.887 Y94.917
G1 X126.722 Y96.083 E.04909
G1 X126.188 Y96.083
G1 X127.354 Y94.917 E.04909
G1 X126.82 Y94.917
G1 X125.655 Y96.083 E.04909
G1 X125.122 Y96.083
G1 X126.287 Y94.917 E.04909
G1 X125.754 Y94.917
G1 X124.589 Y96.083 E.04909
G1 X124.055 Y96.083
G1 X125.221 Y94.917 E.04909
G1 X124.687 Y94.917
G1 X123.522 Y96.083 E.04909
G1 X122.989 Y96.083
G1 X124.154 Y94.917 E.04909
G1 X123.621 Y94.917
G1 X122.456 Y96.083 E.04909
G1 X121.922 Y96.083
G1 X123.088 Y94.917 E.04909
G1 X122.554 Y94.917
G1 X121.389 Y96.083 E.04909
G1 X120.856 Y96.083
G1 X122.021 Y94.917 E.04909
G1 X121.488 Y94.917
G1 X120.323 Y96.083 E.04909
G1 X119.789 Y96.083
G1 X120.955 Y94.917 E.04909
G1 X120.421 Y94.917
G1 X119.256 Y96.083 E.04909
G1 X118.723 Y96.083
G1 X119.888 Y94.917 E.04909
G1 X119.355 Y94.917
G1 X118.19 Y96.083 E.04909
G1 X117.656 Y96.083
G1 X118.822 Y94.917 E.04909
G1 X118.288 Y94.917
G1 X117.123 Y96.083 E.04909
G1 X116.59 Y96.083
G1 X117.755 Y94.917 E.04909
G1 X117.222 Y94.917
G1 X116.057 Y96.083 E.04909
G1 X115.523 Y96.083
G1 X116.689 Y94.917 E.04909
G1 X116.155 Y94.917
G1 X114.99 Y96.083 E.04909
G1 X114.457 Y96.083
G1 X115.622 Y94.917 E.04909
G1 X115.089 Y94.917
G1 X113.924 Y96.083 E.04909
G1 X113.39 Y96.083
G1 X114.556 Y94.917 E.04909
G1 X114.022 Y94.917
G1 X112.857 Y96.083 E.04909
G1 X112.324 Y96.083
G1 X113.489 Y94.917 E.04909
G1 X112.956 Y94.917
G1 X111.791 Y96.083 E.04909
G1 X111.257 Y96.083
G1 X112.423 Y94.917 E.04909
G1 X111.889 Y94.917
G1 X110.724 Y96.083 E.04909
G1 X110.191 Y96.083
G1 X111.356 Y94.917 E.04909
G1 X110.823 Y94.917
G1 X109.658 Y96.083 E.04909
G1 X109.124 Y96.083
G1 X110.289 Y94.917 E.04909
G1 X109.756 Y94.917
G1 X108.591 Y96.083 E.04909
G1 X108.058 Y96.083
G1 X109.223 Y94.917 E.04909
G1 X108.69 Y94.917
G1 X107.524 Y96.083 E.04909
G1 X106.991 Y96.083
G1 X108.156 Y94.917 E.04909
G1 X107.623 Y94.917
G1 X106.458 Y96.083 E.04909
G1 X105.925 Y96.083
G1 X107.09 Y94.917 E.04909
G1 X106.557 Y94.917
G1 X105.391 Y96.083 E.04909
G1 X104.858 Y96.083
M73 P97 R0
G1 X106.023 Y94.917 E.04909
G1 X105.49 Y94.917
G1 X104.325 Y96.083 E.04909
G1 X103.792 Y96.083
G1 X104.957 Y94.917 E.04909
G1 X104.424 Y94.917
G1 X103.258 Y96.083 E.04909
G1 X102.725 Y96.083
G1 X103.89 Y94.917 E.04909
G1 X103.357 Y94.917
G1 X102.192 Y96.083 E.04909
G1 X101.659 Y96.083
G1 X102.824 Y94.917 E.04909
G1 X102.583 Y94.625
G1 X101.417 Y95.791 E.04909
G1 X101.417 Y95.257
G1 X102.583 Y94.092 E.04909
G1 X102.583 Y93.559
G1 X101.417 Y94.724 E.04909
G1 X101.417 Y94.191
G1 X102.583 Y93.026 E.04909
G1 X102.583 Y92.492
G1 X101.417 Y93.658 E.04909
G1 X101.417 Y93.124
G1 X102.583 Y91.959 E.04909
G1 X102.583 Y91.426
G1 X101.417 Y92.591 E.04909
G1 X101.417 Y92.058
G1 X102.583 Y90.893 E.04909
G1 X102.583 Y90.359
G1 X101.417 Y91.525 E.04909
G1 X101.417 Y90.991
G1 X102.583 Y89.826 E.04909
G1 X102.583 Y89.293
G1 X101.417 Y90.458 E.04909
G1 X101.417 Y89.925
G1 X102.583 Y88.76 E.04909
G1 X102.583 Y88.226
G1 X101.417 Y89.392 E.04909
G1 X101.417 Y88.858
G1 X102.583 Y87.693 E.04909
G1 X102.583 Y87.16
G1 X101.417 Y88.325 E.04909
G1 X101.417 Y87.792
G1 X102.583 Y86.627 E.04909
G1 X102.583 Y86.093
G1 X101.417 Y87.259 E.04909
G1 X101.417 Y86.725
G1 X102.583 Y85.56 E.04909
G1 X102.583 Y85.027
G1 X101.417 Y86.192 E.04909
G1 X101.417 Y85.659
G1 X102.583 Y84.493 E.04909
G1 X102.583 Y83.96
G1 X101.417 Y85.125 E.04909
G1 X101.417 Y84.592
G1 X102.583 Y83.427 E.04909
G1 X102.583 Y82.894
G1 X101.417 Y84.059 E.04909
G1 X101.417 Y83.526
G1 X102.583 Y82.36 E.04909
G1 X102.583 Y81.827
G1 X101.417 Y82.992 E.04909
G1 X101.417 Y82.459
G1 X102.583 Y81.294 E.04909
G1 X102.583 Y80.761
G1 X101.417 Y81.926 E.04909
G1 X101.417 Y81.393
G1 X102.583 Y80.227 E.04909
G1 X102.583 Y79.694
G1 X101.417 Y80.859 E.04909
G1 X101.417 Y80.326
G1 X102.583 Y79.161 E.04909
G1 X102.583 Y78.628
G1 X101.417 Y79.793 E.04909
G1 X101.417 Y79.26
G1 X102.583 Y78.094 E.04909
G1 X102.583 Y77.561
G1 X101.417 Y78.726 E.04909
G1 X101.417 Y78.193
G1 X102.583 Y77.028 E.04909
G1 X102.583 Y76.495
G1 X101.417 Y77.66 E.04909
G1 X101.417 Y77.127
G1 X102.583 Y75.961 E.04909
G1 X102.583 Y75.428
G1 X101.417 Y76.593 E.04909
G1 X101.417 Y76.06
G1 X102.583 Y74.895 E.04909
G1 X102.583 Y74.362
G1 X101.417 Y75.527 E.04909
G1 X101.417 Y74.994
G1 X102.583 Y73.828 E.04909
G1 X102.583 Y73.295
G1 X101.417 Y74.46 E.04909
G1 X101.417 Y73.927
G1 X102.583 Y72.762 E.04909
G1 X102.583 Y72.229
G1 X101.417 Y73.394 E.04909
G1 X101.417 Y72.861
G1 X102.583 Y71.695 E.04909
G1 X102.583 Y71.162
G1 X101.417 Y72.327 E.04909
G1 X101.417 Y71.794
G1 X103.294 Y69.917 E.07905
G1 X102.761 Y69.917
G1 X101.417 Y71.261 E.05659
G1 X101.417 Y70.728
G1 X102.228 Y69.917 E.03413
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F6000
M204 S5000
G1 X101.417 Y70.728 E-.43539
G1 X101.417 Y71.261 E-.20264
G1 X101.644 Y71.034 E-.12198
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.5 I1.217 J0 P1  F15000
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
G1 Z2.6 F900 ; lower z a little
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

    G1 Z102.1 F600
    G1 Z100.1

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

