; HEADER_BLOCK_START
; BambuStudio 02.07.01.57
; model printing time: 11m 52s; total estimated time: 18m 13s
; total layer number: 10
; total filament length [mm] : 1211.51
; total filament volume [cm^3] : 2914.02
; total filament weight [g] : 3.61
; model label id: 81,118,140
; object max height: 2.00,2.00,2.00
; filament_density: 1.24
; filament_diameter: 1.75
; max_z_height: 2.00
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
; brim_type = no_brim
; brim_width = 1.5
; chamber_temperatures = 0
; change_filament_gcode = ;=P1S 20251031=\nM620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F{flush_volumetric_speeds[previous_extruder]/2.4053*60} T{flush_temperatures[previous_extruder]}\nT[next_extruder]\nM620.1 E F{flush_volumetric_speeds[next_extruder]/2.4053*60} T{flush_temperatures[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == \"PETG\"}\nM109 S260\n{elsif filament_type[next_extruder] == \"PVA\"}\nM109 S210\n{else}\nM109 S{flush_temperatures[next_extruder]}\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{flush_volumetric_speeds[previous_extruder]/2.4053*60} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\n{else}\nG1 E{flush_length_1} F{flush_volumetric_speeds[previous_extruder]/2.4053*60}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{flush_volumetric_speeds[next_extruder]/2.4053*60}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{flush_volumetric_speeds[next_extruder]/2.4053*60} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200
; close_additional_fan_first_x_layers = 1
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
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
; different_settings_to_system = bridge_speed;brim_type;brim_width;default_acceleration;enable_support;gap_infill_speed;initial_layer_acceleration;initial_layer_infill_speed;initial_layer_speed;initial_layer_travel_acceleration;inner_wall_speed;internal_solid_infill_speed;outer_wall_acceleration;outer_wall_speed;overhang_2_4_speed;overhang_3_4_speed;overhang_4_4_speed;overhang_totally_speed;skeleton_infill_density;skin_infill_density;sparse_infill_density;sparse_infill_pattern;sparse_infill_speed;support_interface_speed;support_speed;top_surface_acceleration;top_surface_speed;travel_acceleration;travel_speed;;
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
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
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
; fan_cooling_layer_time = 100
; fan_direction = left
; fan_max_speed = 100
; fan_min_speed = 100
; filament_adaptive_volumetric_speed = 0
; filament_adhesiveness_category = 100
; filament_bridge_speed = 25
; filament_change_length = 10
; filament_change_length_nc = 10
; filament_colour = #000000
; filament_colour_type = 1
; filament_cooling_before_tower = 0
; filament_cost = 20
; filament_density = 1.24
; filament_dev_ams_drying_ams_limitations = 1;0
; filament_dev_ams_drying_heat_distortion_temperature = 45
; filament_dev_ams_drying_temperature = 45,45,45,45
; filament_dev_ams_drying_time = 12,12,12,12
; filament_dev_chamber_drying_bed_temperature = 70
; filament_dev_chamber_drying_time = 12
; filament_dev_drying_cooling_temperature = 45
; filament_dev_drying_softening_temperature = 50
; filament_diameter = 1.75
; filament_enable_overhang_speed = 1
; filament_end_gcode = "; filament end gcode \n\n"
; filament_extruder_compatibility = 0
; filament_extruder_variant = "Direct Drive Standard"
; filament_flow_ratio = 0.98
; filament_flush_temp = 0
; filament_flush_temp_fast = 0
; filament_flush_volumetric_speed = 0
; filament_ids = ""
; filament_is_mixed = 0
; filament_is_support = 0
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 12
; filament_metal_stickiness = None
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
; filament_preheat_temperature_delta = 0
; filament_prime_volume = 45
; filament_prime_volume_nc = 60
; filament_printable = 3
; filament_ramming_travel_time = 0
; filament_ramming_travel_time_nc = 0
; filament_ramming_volumetric_speed = -1
; filament_ramming_volumetric_speed_nc = -1
; filament_retract_length_nc = 14
; filament_scarf_gap = 15%
; filament_scarf_height = 10%
; filament_scarf_length = 10
; filament_scarf_seam_type = none
; filament_self_index = 1
; filament_settings_id = "Protopasta PLA Conductive"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_tower_interface_pre_extrusion_dist = 10
; filament_tower_interface_pre_extrusion_length = 0
; filament_tower_interface_print_temp = -1
; filament_tower_interface_purge_volume = 20
; filament_tower_ironing_area = 4
; filament_type = PLA
; filament_velocity_adaptation_factor = 1
; filament_vendor = Protopasta
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
; hot_plate_temp = 55
; hot_plate_temp_initial_layer = 55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 10
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_instead_top_bottom_surfaces = 0
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; inherits_group = "0.20mm Standard @BBL X1C";;
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
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 200
; nozzle_temperature_range_low = 200
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
; overhang_fan_threshold = 50%
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
; slow_down_layer_time = 8
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
; supertack_plate_temp = 45
; supertack_plate_temp_initial_layer = 45
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
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 55
; textured_plate_temp_initial_layer = 55
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
; wipe_tower_y = 216.972
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
M73 P0 R18
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
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
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
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F299.339 T200


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P3 R17
G1 E50 F200
M400
M104 S220
G92 E0
M73 P26 R13
G1 E50 F200
M400
M106 P1 S255
G92 E0
M73 P27 R13
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P28 R13
G1 E-0.5 F300

M73 P29 R12
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
M109 S200
M73 P30 R12
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
    G29 A X71.7436 Y42.1714 I136.439 J170.192
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

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

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
M73 P31 R12
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
M109 S220
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
M106 P3 S150


;VT0 H-1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/10
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S3000
G1 Z.4 F15000
; object ids of layer 1 start: 81,118,140
M624 BwAAAAAAAAA=
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
; object ids of this layer1 end: 81,118,140
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X96.571 Y209.22
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
G1 X178.286 Y209.22 E3.04354
G1 X178.286 Y157.506 E1.92616
G1 X96.571 Y157.506 E3.04354
G1 X96.571 Y181.006 E.87529
G1 X94.286 Y181.006 E.08514
M73 P32 R12
G1 X94.286 Y157.22 E.88593
G1 X178.571 Y157.22 E3.13933
G1 X178.571 Y209.506 E1.94745
G1 X94.286 Y209.506 E3.13933
G1 X94.286 Y185.72 E.88593
G1 X96.571 Y185.72 E.08514
G1 X96.571 Y209.16 E.87305
M204 S3000
G1 X97.029 Y208.763 F15000
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X177.829 Y208.763 E3.00949
G1 X177.829 Y157.963 E1.89211
G1 X97.029 Y157.963 E3.00949
M73 P33 R12
G1 X97.029 Y181.463 E.87529
G1 X93.829 Y181.463 E.11919
G1 X93.829 Y156.763 E.91998
G1 X179.029 Y156.763 E3.17338
G1 X179.029 Y209.963 E1.9815
G1 X93.829 Y209.963 E3.17338
G1 X93.829 Y185.263 E.91998
G1 X97.029 Y185.263 E.11919
G1 X97.029 Y208.703 E.87305
; WIPE_START
G1 X99.029 Y208.705 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X97.847 Y201.164 Z.6 F15000
G1 X95.456 Y185.903 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50402
G1 F3000
M204 S250
G1 X96.183 Y186.63 E.03862
G1 X96.183 Y187.282 E.0245
G1 X95.01 Y186.109 E.06234
G1 X94.674 Y186.109 E.01262
G1 X94.674 Y186.425 E.01188
G1 X96.183 Y187.934 E.08019
M73 P34 R12
G1 X96.183 Y188.586 E.0245
M73 P34 R11
G1 X94.674 Y187.077 E.08019
G1 X94.674 Y187.729 E.0245
G1 X96.183 Y189.238 E.08019
G1 X96.183 Y189.89 E.0245
G1 X94.674 Y188.381 E.08019
G1 X94.674 Y189.033 E.0245
G1 X96.183 Y190.542 E.08019
G1 X96.183 Y191.194 E.0245
G1 X94.674 Y189.685 E.08019
G1 X94.674 Y190.337 E.0245
G1 X96.183 Y191.846 E.08019
M73 P35 R11
G1 X96.183 Y192.499 E.0245
G1 X94.674 Y190.989 E.08019
G1 X94.674 Y191.642 E.0245
G1 X96.183 Y193.151 E.08019
G1 X96.183 Y193.803 E.0245
G1 X94.674 Y192.294 E.08019
M73 P36 R11
G1 X94.674 Y192.946 E.0245
G1 X96.183 Y194.455 E.08019
G1 X96.183 Y195.107 E.0245
G1 X94.674 Y193.598 E.08019
G1 X94.674 Y194.25 E.0245
G1 X96.183 Y195.759 E.08019
G1 X96.183 Y196.411 E.0245
G1 X94.674 Y194.902 E.08019
M73 P37 R11
G1 X94.674 Y195.554 E.0245
G1 X96.183 Y197.063 E.08019
G1 X96.183 Y197.715 E.0245
G1 X94.674 Y196.206 E.08019
G1 X94.674 Y196.858 E.0245
G1 X96.183 Y198.367 E.08019
M73 P38 R11
G1 X96.183 Y199.019 E.0245
G1 X94.674 Y197.51 E.08019
G1 X94.674 Y198.163 E.0245
G1 X96.183 Y199.672 E.08019
G1 X96.183 Y200.324 E.0245
G1 X94.674 Y198.815 E.08019
G1 X94.674 Y199.467 E.0245
G1 X96.183 Y200.976 E.08019
G1 X96.183 Y201.628 E.0245
G1 X94.674 Y200.119 E.08019
G1 X94.674 Y200.771 E.0245
G1 X96.183 Y202.28 E.08019
G1 X96.183 Y202.932 E.0245
G1 X94.674 Y201.423 E.08019
G1 X94.674 Y202.075 E.0245
G1 X96.183 Y203.584 E.08019
G1 X96.183 Y204.236 E.0245
G1 X94.674 Y202.727 E.08019
G1 X94.674 Y203.379 E.0245
G1 X96.183 Y204.888 E.08019
G1 X96.183 Y205.54 E.0245
G1 X94.674 Y204.031 E.08019
G1 X94.674 Y204.683 E.0245
G1 X96.183 Y206.192 E.08019
G1 X96.183 Y206.845 E.0245
G1 X94.674 Y205.336 E.08019
G1 X94.674 Y205.988 E.0245
G1 X96.183 Y207.497 E.08019
G1 X96.183 Y208.149 E.0245
G1 X94.674 Y206.64 E.08019
G1 X94.674 Y207.292 E.0245
G1 X96.183 Y208.801 E.08019
M73 P39 R11
G1 X96.183 Y209.118 E.0119
G1 X95.848 Y209.118 E.0126
G1 X94.674 Y207.944 E.06236
G1 X94.674 Y208.596 E.0245
G1 X95.401 Y209.323 E.03864
; WIPE_START
G1 X94.674 Y208.596 E-.39081
G1 X94.674 Y207.944 E-.24779
G1 X94.9 Y208.17 E-.12139
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X94.984 Y200.538 Z.6 F15000
G1 X95.456 Y157.403 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S250
G1 X96.183 Y158.13 E.03862
G1 X96.183 Y158.782 E.0245
G1 X95.01 Y157.609 E.06234
G1 X94.674 Y157.609 E.01262
G1 X94.674 Y157.925 E.01188
G1 X96.183 Y159.434 E.08019
G1 X96.183 Y160.086 E.0245
G1 X94.674 Y158.577 E.08019
G1 X94.674 Y159.229 E.0245
G1 X96.183 Y160.738 E.08019
G1 X96.183 Y161.39 E.0245
G1 X94.674 Y159.881 E.08019
G1 X94.674 Y160.533 E.0245
G1 X96.183 Y162.042 E.08019
G1 X96.183 Y162.694 E.0245
G1 X94.674 Y161.185 E.08019
G1 X94.674 Y161.837 E.0245
G1 X96.183 Y163.346 E.08019
G1 X96.183 Y163.999 E.0245
G1 X94.674 Y162.489 E.08019
G1 X94.674 Y163.142 E.0245
G1 X96.183 Y164.651 E.08019
G1 X96.183 Y165.303 E.0245
G1 X94.674 Y163.794 E.08019
G1 X94.674 Y164.446 E.0245
G1 X96.183 Y165.955 E.08019
G1 X96.183 Y166.607 E.0245
G1 X94.674 Y165.098 E.08019
G1 X94.674 Y165.75 E.0245
G1 X96.183 Y167.259 E.08019
G1 X96.183 Y167.911 E.0245
G1 X94.674 Y166.402 E.08019
G1 X94.674 Y167.054 E.0245
G1 X96.183 Y168.563 E.08019
G1 X96.183 Y169.215 E.0245
G1 X94.674 Y167.706 E.08019
G1 X94.674 Y168.358 E.0245
G1 X96.183 Y169.867 E.08019
G1 X96.183 Y170.519 E.0245
G1 X94.674 Y169.01 E.08019
G1 X94.674 Y169.663 E.0245
G1 X96.183 Y171.172 E.08019
G1 X96.183 Y171.824 E.0245
G1 X94.674 Y170.315 E.08019
G1 X94.674 Y170.967 E.0245
G1 X96.183 Y172.476 E.08019
G1 X96.183 Y173.128 E.0245
G1 X94.674 Y171.619 E.08019
G1 X94.674 Y172.271 E.0245
G1 X96.183 Y173.78 E.08019
G1 X96.183 Y174.432 E.0245
G1 X94.674 Y172.923 E.08019
G1 X94.674 Y173.575 E.0245
G1 X96.183 Y175.084 E.08019
G1 X96.183 Y175.736 E.0245
G1 X94.674 Y174.227 E.08019
G1 X94.674 Y174.879 E.0245
G1 X96.183 Y176.388 E.08019
G1 X96.183 Y177.04 E.0245
G1 X94.674 Y175.531 E.08019
G1 X94.674 Y176.183 E.0245
G1 X96.183 Y177.692 E.08019
G1 X96.183 Y178.345 E.0245
G1 X94.674 Y176.836 E.08019
G1 X94.674 Y177.488 E.0245
G1 X96.183 Y178.997 E.08019
G1 X96.183 Y179.649 E.0245
G1 X94.674 Y178.14 E.08019
G1 X94.674 Y178.792 E.0245
G1 X96.183 Y180.301 E.08019
G1 X96.183 Y180.618 E.0119
G1 X95.848 Y180.618 E.0126
G1 X94.674 Y179.444 E.06236
G1 X94.674 Y180.096 E.0245
G1 X95.401 Y180.823 E.03864
; OBJECT_ID: 118
; WIPE_START
G1 X94.674 Y180.096 E-.39081
G1 X94.674 Y179.444 E-.24779
G1 X94.9 Y179.67 E-.12139
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 118
M624 AgAAAAAAAAA=
M204 S3000
G1 X99.751 Y173.777 Z.6 F15000
M73 P39 R10
G1 X207.039 Y43.438 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
G1 X183.539 Y43.438 E.87529
G1 X183.539 Y41.152 E.08514
G1 X207.325 Y41.152 E.88593
G1 X207.325 Y125.438 E3.13933
G1 X155.039 Y125.438 E1.94745
G1 X155.039 Y41.152 E3.13933
G1 X178.825 Y41.152 E.88593
G1 X178.825 Y43.438 E.08514
G1 X155.325 Y43.438 E.87529
G1 X155.325 Y125.152 E3.04354
G1 X207.039 Y125.152 E1.92616
G1 X207.039 Y43.498 E3.04131
M204 S3000
G1 X206.582 Y43.895 F15000
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X183.082 Y43.895 E.87529
G1 X183.082 Y40.695 E.11919
G1 X207.782 Y40.695 E.91998
G1 X207.782 Y125.895 E3.17338
G1 X154.582 Y125.895 E1.9815
G1 X154.582 Y40.695 E3.17338
G1 X179.282 Y40.695 E.91998
G1 X179.282 Y43.895 E.11919
G1 X155.782 Y43.895 E.87529
G1 X155.782 Y124.695 E3.00949
G1 X206.582 Y124.695 E1.89211
G1 X206.582 Y43.955 E3.00726
; WIPE_START
G1 X204.582 Y43.95 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X206.21 Y41.335 Z.6 F15000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50402
G1 F3000
M204 S250
G1 X206.937 Y42.062 E.03862
G1 X206.937 Y42.714 E.0245
G1 X205.764 Y41.541 E.06234
G1 X205.112 Y41.541 E.0245
G1 X206.621 Y43.05 E.08019
G1 X205.969 Y43.05 E.0245
G1 X204.459 Y41.541 E.08019
G1 X203.807 Y41.541 E.0245
G1 X205.316 Y43.05 E.08019
M73 P40 R10
G1 X204.664 Y43.05 E.0245
G1 X203.155 Y41.541 E.08019
G1 X202.503 Y41.541 E.0245
G1 X204.012 Y43.05 E.08019
G1 X203.36 Y43.05 E.0245
G1 X201.851 Y41.541 E.08019
G1 X201.199 Y41.541 E.0245
G1 X202.708 Y43.05 E.08019
G1 X202.056 Y43.05 E.0245
G1 X200.547 Y41.541 E.08019
G1 X199.895 Y41.541 E.0245
G1 X201.404 Y43.05 E.08019
G1 X200.752 Y43.05 E.0245
G1 X199.243 Y41.541 E.08019
G1 X198.591 Y41.541 E.0245
M73 P41 R10
G1 X200.1 Y43.05 E.08019
G1 X199.448 Y43.05 E.0245
G1 X197.939 Y41.541 E.08019
G1 X197.286 Y41.541 E.0245
G1 X198.795 Y43.05 E.08019
G1 X198.143 Y43.05 E.0245
M73 P42 R10
G1 X196.634 Y41.541 E.08019
G1 X195.982 Y41.541 E.0245
G1 X197.491 Y43.05 E.08019
G1 X196.839 Y43.05 E.0245
G1 X195.33 Y41.541 E.08019
G1 X194.678 Y41.541 E.0245
G1 X196.187 Y43.05 E.08019
G1 X195.535 Y43.05 E.0245
M73 P43 R10
G1 X194.026 Y41.541 E.08019
G1 X193.374 Y41.541 E.0245
G1 X194.883 Y43.05 E.08019
G1 X194.231 Y43.05 E.0245
G1 X192.722 Y41.541 E.08019
G1 X192.07 Y41.541 E.0245
M73 P44 R10
G1 X193.579 Y43.05 E.08019
G1 X192.927 Y43.05 E.0245
G1 X191.418 Y41.541 E.08019
G1 X190.765 Y41.541 E.0245
G1 X192.275 Y43.05 E.08019
G1 X191.622 Y43.05 E.0245
G1 X190.113 Y41.541 E.08019
G1 X189.461 Y41.541 E.0245
G1 X190.97 Y43.05 E.08019
G1 X190.318 Y43.05 E.0245
G1 X188.809 Y41.541 E.08019
G1 X188.157 Y41.541 E.0245
G1 X189.666 Y43.05 E.08019
G1 X189.014 Y43.05 E.0245
G1 X187.505 Y41.541 E.08019
G1 X186.853 Y41.541 E.0245
G1 X188.362 Y43.05 E.08019
G1 X187.71 Y43.05 E.0245
G1 X186.201 Y41.541 E.08019
G1 X185.549 Y41.541 E.0245
G1 X187.058 Y43.05 E.08019
G1 X186.406 Y43.05 E.0245
G1 X184.897 Y41.541 E.08019
G1 X184.245 Y41.541 E.0245
G1 X185.754 Y43.05 E.08019
G1 X185.101 Y43.05 E.0245
G1 X183.928 Y41.876 E.06236
G1 X183.928 Y42.528 E.0245
G1 X184.655 Y43.256 E.03864
; WIPE_START
G1 X183.928 Y42.528 E-.39081
G1 X183.928 Y41.876 E-.2478
G1 X184.154 Y42.102 E-.12139
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X177.71 Y41.335 Z.6 F15000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S250
G1 X178.437 Y42.062 E.03862
G1 X178.437 Y42.714 E.0245
G1 X177.264 Y41.541 E.06234
G1 X176.612 Y41.541 E.0245
G1 X178.121 Y43.05 E.08019
G1 X177.468 Y43.05 E.0245
G1 X175.959 Y41.541 E.08019
G1 X175.307 Y41.541 E.0245
G1 X176.816 Y43.05 E.08019
G1 X176.164 Y43.05 E.0245
G1 X174.655 Y41.541 E.08019
G1 X174.003 Y41.541 E.0245
G1 X175.512 Y43.05 E.08019
G1 X174.86 Y43.05 E.0245
G1 X173.351 Y41.541 E.08019
G1 X172.699 Y41.541 E.0245
G1 X174.208 Y43.05 E.08019
G1 X173.556 Y43.05 E.0245
G1 X172.047 Y41.541 E.08019
G1 X171.395 Y41.541 E.0245
G1 X172.904 Y43.05 E.08019
G1 X172.252 Y43.05 E.0245
G1 X170.743 Y41.541 E.08019
G1 X170.091 Y41.541 E.0245
G1 X171.6 Y43.05 E.08019
G1 X170.948 Y43.05 E.0245
G1 X169.439 Y41.541 E.08019
G1 X168.786 Y41.541 E.0245
G1 X170.295 Y43.05 E.08019
G1 X169.643 Y43.05 E.0245
G1 X168.134 Y41.541 E.08019
G1 X167.482 Y41.541 E.0245
G1 X168.991 Y43.05 E.08019
G1 X168.339 Y43.05 E.0245
G1 X166.83 Y41.541 E.08019
G1 X166.178 Y41.541 E.0245
G1 X167.687 Y43.05 E.08019
G1 X167.035 Y43.05 E.0245
G1 X165.526 Y41.541 E.08019
G1 X164.874 Y41.541 E.0245
G1 X166.383 Y43.05 E.08019
G1 X165.731 Y43.05 E.0245
G1 X164.222 Y41.541 E.08019
G1 X163.57 Y41.541 E.0245
G1 X165.079 Y43.05 E.08019
G1 X164.427 Y43.05 E.0245
G1 X162.918 Y41.541 E.08019
G1 X162.265 Y41.541 E.0245
G1 X163.775 Y43.05 E.08019
G1 X163.122 Y43.05 E.0245
G1 X161.613 Y41.541 E.08019
G1 X160.961 Y41.541 E.0245
G1 X162.47 Y43.05 E.08019
G1 X161.818 Y43.05 E.0245
G1 X160.309 Y41.541 E.08019
G1 X159.657 Y41.541 E.0245
G1 X161.166 Y43.05 E.08019
G1 X160.514 Y43.05 E.0245
G1 X159.005 Y41.541 E.08019
G1 X158.353 Y41.541 E.0245
G1 X159.862 Y43.05 E.08019
G1 X159.21 Y43.05 E.0245
G1 X157.701 Y41.541 E.08019
G1 X157.049 Y41.541 E.0245
G1 X158.558 Y43.05 E.08019
G1 X157.906 Y43.05 E.0245
G1 X156.397 Y41.541 E.08019
G1 X155.745 Y41.541 E.0245
G1 X157.254 Y43.05 E.08019
G1 X156.601 Y43.05 E.0245
G1 X155.428 Y41.876 E.06236
G1 X155.428 Y42.528 E.0245
G1 X156.155 Y43.256 E.03864
; OBJECT_ID: 140
; WIPE_START
G1 X155.428 Y42.528 E-.39081
G1 X155.428 Y41.876 E-.2478
G1 X155.654 Y42.102 E-.12139
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 118
M625
; start printing object, unique label id: 140
M624 BAAAAAAAAAA=
M204 S3000
G1 X148.027 Y42.4 Z.6 F15000
G1 X124.601 Y43.314 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
G1 X101.101 Y43.314 E.87529
G1 X101.101 Y41.028 E.08514
G1 X124.887 Y41.028 E.88593
G1 X124.887 Y125.314 E3.13933
G1 X72.601 Y125.314 E1.94745
G1 X72.601 Y41.028 E3.13933
G1 X96.387 Y41.028 E.88593
G1 X96.387 Y43.314 E.08514
M73 P45 R10
G1 X72.887 Y43.314 E.87529
G1 X72.887 Y125.028 E3.04354
G1 X124.601 Y125.028 E1.92616
G1 X124.601 Y43.374 E3.04131
M204 S3000
G1 X124.144 Y43.771 F15000
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X100.644 Y43.771 E.87529
G1 X100.644 Y40.571 E.11919
G1 X125.344 Y40.571 E.91998
G1 X125.344 Y125.771 E3.17338
G1 X72.144 Y125.771 E1.9815
G1 X72.144 Y40.571 E3.17338
G1 X96.844 Y40.571 E.91998
G1 X96.844 Y43.771 E.11919
G1 X73.344 Y43.771 E.87529
G1 X73.344 Y124.571 E3.00949
G1 X124.144 Y124.571 E1.89211
G1 X124.144 Y43.831 E3.00726
; WIPE_START
G1 X122.144 Y43.826 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X123.771 Y41.211 Z.6 F15000
M73 P45 R9
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50402
G1 F3000
M204 S250
G1 X124.498 Y41.938 E.03862
G1 X124.498 Y42.59 E.0245
G1 X123.325 Y41.417 E.06234
G1 X122.673 Y41.417 E.0245
G1 X124.182 Y42.926 E.08019
G1 X123.53 Y42.926 E.0245
G1 X122.021 Y41.417 E.08019
G1 X121.369 Y41.417 E.0245
G1 X122.878 Y42.926 E.08019
G1 X122.226 Y42.926 E.0245
G1 X120.717 Y41.417 E.08019
G1 X120.064 Y41.417 E.0245
G1 X121.573 Y42.926 E.08019
G1 X120.921 Y42.926 E.0245
G1 X119.412 Y41.417 E.08019
G1 X118.76 Y41.417 E.0245
G1 X120.269 Y42.926 E.08019
G1 X119.617 Y42.926 E.0245
G1 X118.108 Y41.417 E.08019
G1 X117.456 Y41.417 E.0245
G1 X118.965 Y42.926 E.08019
G1 X118.313 Y42.926 E.0245
G1 X116.804 Y41.417 E.08019
G1 X116.152 Y41.417 E.0245
M73 P46 R9
G1 X117.661 Y42.926 E.08019
G1 X117.009 Y42.926 E.0245
G1 X115.5 Y41.417 E.08019
G1 X114.848 Y41.417 E.0245
G1 X116.357 Y42.926 E.08019
G1 X115.705 Y42.926 E.0245
M73 P47 R9
G1 X114.196 Y41.417 E.08019
G1 X113.544 Y41.417 E.0245
G1 X115.053 Y42.926 E.08019
G1 X114.4 Y42.926 E.0245
G1 X112.891 Y41.417 E.08019
G1 X112.239 Y41.417 E.0245
G1 X113.748 Y42.926 E.08019
M73 P48 R9
G1 X113.096 Y42.926 E.0245
G1 X111.587 Y41.417 E.08019
G1 X110.935 Y41.417 E.0245
G1 X112.444 Y42.926 E.08019
G1 X111.792 Y42.926 E.0245
G1 X110.283 Y41.417 E.08019
M73 P49 R9
G1 X109.631 Y41.417 E.0245
G1 X111.14 Y42.926 E.08019
G1 X110.488 Y42.926 E.0245
G1 X108.979 Y41.417 E.08019
G1 X108.327 Y41.417 E.0245
G1 X109.836 Y42.926 E.08019
G1 X109.184 Y42.926 E.0245
G1 X107.675 Y41.417 E.08019
G1 X107.023 Y41.417 E.0245
G1 X108.532 Y42.926 E.08019
G1 X107.88 Y42.926 E.0245
G1 X106.37 Y41.417 E.08019
G1 X105.718 Y41.417 E.0245
G1 X107.227 Y42.926 E.08019
G1 X106.575 Y42.926 E.0245
G1 X105.066 Y41.417 E.08019
G1 X104.414 Y41.417 E.0245
G1 X105.923 Y42.926 E.08019
G1 X105.271 Y42.926 E.0245
G1 X103.762 Y41.417 E.08019
G1 X103.11 Y41.417 E.0245
G1 X104.619 Y42.926 E.08019
G1 X103.967 Y42.926 E.0245
G1 X102.458 Y41.417 E.08019
G1 X101.806 Y41.417 E.0245
G1 X103.315 Y42.926 E.08019
G1 X102.663 Y42.926 E.0245
G1 X101.489 Y41.752 E.06236
G1 X101.489 Y42.404 E.0245
G1 X102.216 Y43.132 E.03864
; WIPE_START
G1 X101.489 Y42.404 E-.39081
G1 X101.489 Y41.752 E-.2478
G1 X101.715 Y41.978 E-.12139
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X95.271 Y41.211 Z.6 F15000
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S250
G1 X95.998 Y41.938 E.03862
G1 X95.998 Y42.59 E.0245
G1 X94.825 Y41.417 E.06234
G1 X94.173 Y41.417 E.0245
G1 X95.682 Y42.926 E.08019
G1 X95.03 Y42.926 E.0245
G1 X93.521 Y41.417 E.08019
G1 X92.869 Y41.417 E.0245
G1 X94.378 Y42.926 E.08019
G1 X93.726 Y42.926 E.0245
G1 X92.217 Y41.417 E.08019
G1 X91.564 Y41.417 E.0245
G1 X93.073 Y42.926 E.08019
G1 X92.421 Y42.926 E.0245
G1 X90.912 Y41.417 E.08019
G1 X90.26 Y41.417 E.0245
G1 X91.769 Y42.926 E.08019
G1 X91.117 Y42.926 E.0245
G1 X89.608 Y41.417 E.08019
G1 X88.956 Y41.417 E.0245
G1 X90.465 Y42.926 E.08019
G1 X89.813 Y42.926 E.0245
G1 X88.304 Y41.417 E.08019
G1 X87.652 Y41.417 E.0245
G1 X89.161 Y42.926 E.08019
G1 X88.509 Y42.926 E.0245
G1 X87 Y41.417 E.08019
G1 X86.348 Y41.417 E.0245
G1 X87.857 Y42.926 E.08019
G1 X87.205 Y42.926 E.0245
G1 X85.696 Y41.417 E.08019
G1 X85.044 Y41.417 E.0245
G1 X86.553 Y42.926 E.08019
G1 X85.9 Y42.926 E.0245
G1 X84.391 Y41.417 E.08019
G1 X83.739 Y41.417 E.0245
G1 X85.248 Y42.926 E.08019
G1 X84.596 Y42.926 E.0245
G1 X83.087 Y41.417 E.08019
G1 X82.435 Y41.417 E.0245
G1 X83.944 Y42.926 E.08019
G1 X83.292 Y42.926 E.0245
G1 X81.783 Y41.417 E.08019
G1 X81.131 Y41.417 E.0245
G1 X82.64 Y42.926 E.08019
G1 X81.988 Y42.926 E.0245
G1 X80.479 Y41.417 E.08019
G1 X79.827 Y41.417 E.0245
G1 X81.336 Y42.926 E.08019
G1 X80.684 Y42.926 E.0245
G1 X79.175 Y41.417 E.08019
G1 X78.523 Y41.417 E.0245
G1 X80.032 Y42.926 E.08019
G1 X79.38 Y42.926 E.0245
G1 X77.87 Y41.417 E.08019
G1 X77.218 Y41.417 E.0245
G1 X78.727 Y42.926 E.08019
G1 X78.075 Y42.926 E.0245
G1 X76.566 Y41.417 E.08019
G1 X75.914 Y41.417 E.0245
G1 X77.423 Y42.926 E.08019
G1 X76.771 Y42.926 E.0245
G1 X75.262 Y41.417 E.08019
M73 P50 R9
G1 X74.61 Y41.417 E.0245
G1 X76.119 Y42.926 E.08019
G1 X75.467 Y42.926 E.0245
G1 X73.958 Y41.417 E.08019
G1 X73.306 Y41.417 E.0245
G1 X74.815 Y42.926 E.08019
G1 X74.163 Y42.926 E.0245
G1 X72.989 Y41.752 E.06236
G1 X72.989 Y42.404 E.0245
G1 X73.716 Y43.132 E.03864
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X72.989 Y42.404 E-.39081
G1 X72.989 Y41.752 E-.2478
G1 X73.215 Y41.978 E-.12139
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
; layer num/total_layer_count: 2/10
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
; open powerlost recovery
M1003 S1
M204 S5000
G17
G3 Z.6 I1.217 J0 P1  F15000
; object ids of layer 2 start: 81,118,140
M624 BwAAAAAAAAA=
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
; object ids of this layer2 end: 81,118,140
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X96.826 Y208.965
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X178.031 Y208.965 E2.69369
G1 X178.031 Y157.761 E1.69854
G1 X96.826 Y157.761 E2.69369
G1 X96.826 Y181.261 E.77954
G1 X94.031 Y181.261 E.09274
G1 X94.031 Y156.965 E.80594
G1 X178.826 Y156.965 E2.81283
G1 X178.826 Y209.761 E1.75134
G1 X94.031 Y209.761 E2.81283
G1 X94.031 Y185.465 E.80594
G1 X96.826 Y185.465 E.09274
G1 X96.826 Y208.905 E.77755
M204 S250
G1 X97.219 Y208.573 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X177.639 Y208.573 E2.47108
G1 X177.639 Y158.153 E1.54927
G1 X97.219 Y158.153 E2.47108
G1 X97.219 Y181.653 E.72209
G1 X93.639 Y181.653 E.11
G1 X93.639 Y156.573 E.77064
G1 X179.219 Y156.573 E2.62964
G1 X179.219 Y210.153 E1.64636
G1 X93.639 Y210.153 E2.62964
G1 X93.639 Y185.073 E.77064
G1 X97.219 Y185.073 E.11
G1 X97.219 Y208.513 E.72025
; WIPE_START
M204 S5000
G1 X99.219 Y208.515 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y209.363 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X178.234 Y209.363 E2.58563
; LINE_WIDTH: 0.448395
G1 X178.315 Y209.346 E.00272
; LINE_WIDTH: 0.470635
G1 X178.395 Y209.33 E.00287
G1 X178.429 Y209.169 E.00573
; LINE_WIDTH: 0.43172
G1 X178.429 Y157.557 E1.63516
; LINE_WIDTH: 0.448395
G1 X178.412 Y157.477 E.00272
; LINE_WIDTH: 0.470635
G1 X178.395 Y157.396 E.00287
G1 X178.234 Y157.363 E.00573
; LINE_WIDTH: 0.43172
G1 X96.623 Y157.363 E2.58563
G1 X95.649 Y180.083 F15000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X95.649 Y158.346 E.77983
G3 X95.535 Y158.143 I.151 J-.217 E.00865
G1 X95.208 Y158.143 E.01173
G1 X95.208 Y180.083 E.78713
G1 X95.589 Y180.083 E.01364
G1 X96.057 Y180.492 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X96.057 Y158.155 E.68632
G1 X95.921 Y158.049 E.00532
G1 X95.854 Y157.734 E.00989
M73 P50 R8
G1 X94.8 Y157.734 E.03239
G1 X94.8 Y180.492 E.69926
G1 X95.997 Y180.492 E.0368
G1 X96.434 Y180.869 F15000
G1 F4800
G1 X96.434 Y157.986 E.70311
G1 X96.253 Y157.871 E.00659
G1 X96.231 Y157.357 E.01582
G1 X94.423 Y157.357 E.05556
G1 X94.423 Y180.869 E.72243
G1 X96.374 Y180.869 E.05997
; WIPE_START
G1 X94.423 Y180.869 E-.74166
G1 X94.423 Y180.821 E-.01834
; WIPE_END
M73 P51 R8
G1 E-.04 F1800
G1 X95.649 Y186.643 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.483185
G1 F4800
G1 X95.208 Y186.643 E.0158
G1 X95.208 Y208.583 E.78713
G1 X95.535 Y208.583 E.01173
G1 X95.611 Y208.4 E.00712
G1 X95.649 Y208.38 E.00152
G1 X95.649 Y186.703 E.77768
G1 X96.057 Y186.234 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X94.8 Y186.234 E.03864
G1 X94.8 Y208.992 E.69926
G1 X95.854 Y208.992 E.03239
G1 X95.95 Y208.628 E.01157
G1 X96.057 Y208.571 E.00373
G1 X96.057 Y186.294 E.68448
G1 X96.434 Y185.857 F15000
G1 F4800
G1 X94.423 Y185.857 E.06181
G1 X94.423 Y209.369 E.72243
G1 X96.231 Y209.369 E.05556
G1 X96.253 Y208.855 E.01582
G1 X96.434 Y208.74 E.00659
G1 X96.434 Y185.917 E.70127
; OBJECT_ID: 118
; WIPE_START
G1 X96.434 Y187.917 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 118
M624 AgAAAAAAAAA=
G1 X101.072 Y181.856 Z.8 F15000
G1 X206.784 Y43.693 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X183.284 Y43.693 E.77954
G1 X183.284 Y40.897 E.09274
G1 X207.58 Y40.897 E.80594
G1 X207.58 Y125.693 E2.81283
G1 X154.784 Y125.693 E1.75134
G1 X154.784 Y40.897 E2.81283
G1 X179.08 Y40.897 E.80594
G1 X179.08 Y43.693 E.09274
G1 X155.58 Y43.693 E.77954
G1 X155.58 Y124.897 E2.69369
G1 X206.784 Y124.897 E1.69854
G1 X206.784 Y43.753 E2.6917
M204 S250
G1 X206.392 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X182.892 Y44.085 E.72209
G1 X182.892 Y40.505 E.11
G1 X207.972 Y40.505 E.77064
G1 X207.972 Y126.085 E2.62964
G1 X154.392 Y126.085 E1.64636
G1 X154.392 Y40.505 E2.62964
G1 X179.472 Y40.505 E.77064
G1 X179.472 Y44.085 E.11
G1 X155.972 Y44.085 E.72209
G1 X155.972 Y124.505 E2.47108
G1 X206.392 Y124.505 E1.54927
G1 X206.392 Y44.145 E2.46924
; WIPE_START
M204 S5000
G1 X204.392 Y44.14 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.182 Y43.49 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X207.182 Y125.101 E2.58563
; LINE_WIDTH: 0.4484
G1 X207.166 Y125.182 E.00272
; LINE_WIDTH: 0.470633
G1 X207.149 Y125.262 E.00287
G1 X206.988 Y125.295 E.00573
; LINE_WIDTH: 0.43172
G1 X155.377 Y125.295 E1.63516
; LINE_WIDTH: 0.4484
G1 X155.296 Y125.279 E.00272
; LINE_WIDTH: 0.470633
G1 X155.216 Y125.262 E.00287
G1 X155.182 Y125.101 E.00573
; LINE_WIDTH: 0.43172
G1 X155.182 Y43.49 E2.58563
G1 X177.902 Y42.516 F15000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48319
G1 F4800
M73 P52 R8
G1 X177.902 Y42.075 E.0158
G1 X155.962 Y42.075 E.78714
G1 X155.962 Y42.402 E.01173
G1 X156.146 Y42.478 E.00712
G1 X156.166 Y42.516 E.00152
G1 X177.842 Y42.516 E.77769
G1 X178.311 Y42.924 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X178.311 Y41.667 E.03864
G1 X155.554 Y41.667 E.69926
G1 X155.554 Y42.721 E.03239
G1 X155.918 Y42.817 E.01157
G1 X155.975 Y42.924 E.00373
G1 X178.251 Y42.924 E.68448
G1 X178.688 Y43.301 F15000
G1 F4800
G1 X178.688 Y41.289 E.06181
G1 X155.176 Y41.29 E.72243
G1 X155.176 Y43.098 E.05556
G1 X155.691 Y43.12 E.01582
G1 X155.805 Y43.301 E.00659
G1 X178.628 Y43.301 E.70127
; WIPE_START
G1 X176.628 Y43.301 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X184.223 Y42.54 Z.8 F15000
G1 X184.462 Y42.516 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.483185
G1 F4800
G1 X206.199 Y42.516 E.77983
G3 X206.403 Y42.402 I.217 J.151 E.00865
G1 X206.403 Y42.075 E.01173
G1 X184.462 Y42.075 E.78713
G1 X184.462 Y42.456 E.01364
G1 X184.054 Y42.924 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X206.39 Y42.924 E.68632
M73 P53 R8
G1 X206.496 Y42.788 E.00532
G1 X206.811 Y42.721 E.00989
G1 X206.811 Y41.667 E.03239
G1 X184.054 Y41.667 E.69926
G1 X184.054 Y42.864 E.0368
G1 X183.677 Y43.301 F15000
G1 F4800
G1 X206.574 Y43.301 E.70357
G1 X206.674 Y43.12 E.00635
G1 X207.188 Y43.098 E.01582
G1 X207.188 Y41.289 E.05556
G1 X183.677 Y41.29 E.72243
G1 X183.677 Y43.241 E.05997
; OBJECT_ID: 140
; WIPE_START
G1 X183.677 Y41.29 E-.74166
G1 X183.725 Y41.29 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 118
M625
; start printing object, unique label id: 140
M624 BAAAAAAAAAA=
G1 X176.098 Y41.582 Z.8 F15000
G1 X124.346 Y43.569 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X100.846 Y43.569 E.77954
G1 X100.846 Y40.773 E.09274
G1 X125.142 Y40.773 E.80594
G1 X125.142 Y125.569 E2.81283
G1 X72.346 Y125.569 E1.75134
G1 X72.346 Y40.773 E2.81283
G1 X96.642 Y40.773 E.80594
G1 X96.642 Y43.569 E.09274
G1 X73.142 Y43.569 E.77954
G1 X73.142 Y124.773 E2.69369
G1 X124.346 Y124.773 E1.69854
G1 X124.346 Y43.629 E2.6917
M204 S250
G1 X123.954 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X100.454 Y43.961 E.72209
G1 X100.454 Y40.381 E.11
G1 X125.534 Y40.381 E.77064
G1 X125.534 Y125.961 E2.62964
G1 X71.954 Y125.961 E1.64636
G1 X71.954 Y40.381 E2.62964
G1 X97.034 Y40.381 E.77064
G1 X97.034 Y43.961 E.11
G1 X73.534 Y43.961 E.72209
G1 X73.534 Y124.381 E2.47108
G1 X123.954 Y124.381 E1.54927
G1 X123.954 Y44.021 E2.46924
; WIPE_START
M204 S5000
G1 X121.954 Y44.016 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.744 Y43.366 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X124.744 Y124.977 E2.58563
; LINE_WIDTH: 0.4484
G1 X124.727 Y125.057 E.00272
; LINE_WIDTH: 0.470633
G1 X124.71 Y125.138 E.00287
G1 X124.549 Y125.171 E.00573
; LINE_WIDTH: 0.43172
G1 X72.938 Y125.171 E1.63516
; LINE_WIDTH: 0.4484
G1 X72.858 Y125.155 E.00272
; LINE_WIDTH: 0.470633
G1 X72.777 Y125.138 E.00287
G1 X72.744 Y124.977 E.00573
; LINE_WIDTH: 0.43172
G1 X72.744 Y43.366 E2.58563
G1 X95.464 Y42.391 F15000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48319
G1 F4800
G1 X95.464 Y41.951 E.0158
G1 X73.524 Y41.951 E.78714
G1 X73.524 Y42.278 E.01173
G1 X73.707 Y42.354 E.00712
G1 X73.727 Y42.391 E.00152
G1 X95.404 Y42.391 E.77769
G1 X95.872 Y42.8 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X95.872 Y41.543 E.03864
G1 X73.115 Y41.543 E.69926
G1 X73.115 Y42.597 E.03239
G1 X73.479 Y42.693 E.01157
G1 X73.536 Y42.8 E.00373
G1 X95.812 Y42.8 E.68448
G1 X96.25 Y43.177 F15000
G1 F4800
G1 X96.25 Y41.165 E.06181
G1 X72.738 Y41.165 E.72243
G1 X72.738 Y42.974 E.05556
G1 X73.252 Y42.996 E.01582
G1 X73.367 Y43.177 E.00659
G1 X96.19 Y43.177 E.70127
; WIPE_START
G1 X94.19 Y43.177 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P54 R8
G1 X101.784 Y42.416 Z.8 F15000
G1 X102.024 Y42.391 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.483185
G1 F4800
G1 X123.76 Y42.391 E.77983
G3 X123.964 Y42.278 I.217 J.151 E.00865
G1 X123.964 Y41.951 E.01173
G1 X102.024 Y41.951 E.78713
G1 X102.024 Y42.331 E.01364
G1 X101.615 Y42.8 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X123.951 Y42.8 E.68632
G1 X124.058 Y42.663 E.00532
G1 X124.372 Y42.597 E.00989
G1 X124.372 Y41.543 E.03239
G1 X101.615 Y41.543 E.69926
G1 X101.615 Y42.74 E.0368
G1 X101.238 Y43.177 F15000
G1 F4800
G1 X124.136 Y43.177 E.70357
G1 X124.235 Y42.996 E.00635
G1 X124.75 Y42.974 E.01582
G1 X124.75 Y41.165 E.05556
G1 X101.238 Y41.165 E.72243
G1 X101.238 Y43.117 E.05997
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4800
G1 X101.238 Y41.165 E-.74166
G1 X101.286 Y41.165 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
; layer num/total_layer_count: 3/10
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F15000
; object ids of layer 3 start: 81,118,140
M624 BwAAAAAAAAA=
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
; object ids of this layer3 end: 81,118,140
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X96.826 Y208.965
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X178.031 Y208.965 E2.69369
G1 X178.031 Y157.761 E1.69854
G1 X96.826 Y157.761 E2.69369
G1 X96.826 Y181.261 E.77954
G1 X94.031 Y181.261 E.09274
G1 X94.031 Y156.965 E.80594
G1 X178.826 Y156.965 E2.81283
G1 X178.826 Y209.761 E1.75134
G1 X94.031 Y209.761 E2.81283
G1 X94.031 Y185.465 E.80594
G1 X96.826 Y185.465 E.09274
G1 X96.826 Y208.905 E.77755
M204 S250
G1 X97.219 Y208.573 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X177.639 Y208.573 E2.47108
G1 X177.639 Y158.153 E1.54927
G1 X97.219 Y158.153 E2.47108
G1 X97.219 Y181.653 E.72209
G1 X93.639 Y181.653 E.11
G1 X93.639 Y156.573 E.77064
G1 X179.219 Y156.573 E2.62964
G1 X179.219 Y210.153 E1.64636
G1 X93.639 Y210.153 E2.62964
G1 X93.639 Y185.073 E.77064
G1 X97.219 Y185.073 E.11
G1 X97.219 Y208.513 E.72025
; WIPE_START
M204 S5000
G1 X99.219 Y208.515 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y209.363 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
M73 P55 R8
G1 X178.234 Y209.363 E2.58563
; LINE_WIDTH: 0.448395
G1 X178.315 Y209.346 E.00272
; LINE_WIDTH: 0.470635
G1 X178.395 Y209.33 E.00287
G1 X178.429 Y209.169 E.00573
; LINE_WIDTH: 0.43172
G1 X178.429 Y157.557 E1.63516
; LINE_WIDTH: 0.448395
G1 X178.412 Y157.477 E.00272
; LINE_WIDTH: 0.470635
G1 X178.395 Y157.396 E.00287
G1 X178.234 Y157.363 E.00573
; LINE_WIDTH: 0.43172
G1 X96.623 Y157.363 E2.58563
G1 X95.649 Y180.083 F15000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X95.649 Y158.346 E.77983
G3 X95.535 Y158.143 I.151 J-.217 E.00865
G1 X95.208 Y158.143 E.01173
G1 X95.208 Y180.083 E.78713
G1 X95.589 Y180.083 E.01364
G1 X96.057 Y180.492 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X96.057 Y158.155 E.68632
G1 X95.921 Y158.049 E.00532
G1 X95.854 Y157.734 E.00989
G1 X94.8 Y157.734 E.03239
G1 X94.8 Y180.492 E.69926
G1 X95.997 Y180.492 E.0368
G1 X96.434 Y180.869 F15000
G1 F4800
G1 X96.434 Y157.986 E.70311
G1 X96.253 Y157.871 E.00659
G1 X96.231 Y157.357 E.01582
G1 X94.423 Y157.357 E.05556
G1 X94.423 Y180.869 E.72243
G1 X96.374 Y180.869 E.05997
; WIPE_START
G1 X94.423 Y180.869 E-.74166
G1 X94.423 Y180.821 E-.01834
; WIPE_END
G1 E-.04 F1800
G1 X95.649 Y186.643 Z1 F15000
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.483185
G1 F4800
G1 X95.208 Y186.643 E.0158
G1 X95.208 Y208.583 E.78713
G1 X95.535 Y208.583 E.01173
M73 P56 R8
G1 X95.611 Y208.4 E.00712
G1 X95.649 Y208.38 E.00152
G1 X95.649 Y186.703 E.77768
G1 X96.057 Y186.234 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X94.8 Y186.234 E.03864
G1 X94.8 Y208.992 E.69926
G1 X95.854 Y208.992 E.03239
G1 X95.95 Y208.628 E.01157
G1 X96.057 Y208.571 E.00373
G1 X96.057 Y186.294 E.68448
G1 X96.434 Y185.857 F15000
G1 F4800
M73 P56 R7
G1 X94.423 Y185.857 E.06181
G1 X94.423 Y209.369 E.72243
G1 X96.231 Y209.369 E.05556
G1 X96.253 Y208.855 E.01582
G1 X96.434 Y208.74 E.00659
G1 X96.434 Y185.917 E.70127
; OBJECT_ID: 118
; WIPE_START
G1 X96.434 Y187.917 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 118
M624 AgAAAAAAAAA=
G1 X101.072 Y181.856 Z1 F15000
G1 X206.784 Y43.693 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X183.284 Y43.693 E.77954
G1 X183.284 Y40.897 E.09274
G1 X207.58 Y40.897 E.80594
G1 X207.58 Y125.693 E2.81283
G1 X154.784 Y125.693 E1.75134
G1 X154.784 Y40.897 E2.81283
G1 X179.08 Y40.897 E.80594
G1 X179.08 Y43.693 E.09274
G1 X155.58 Y43.693 E.77954
G1 X155.58 Y124.897 E2.69369
G1 X206.784 Y124.897 E1.69854
G1 X206.784 Y43.753 E2.6917
M204 S250
G1 X206.392 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X182.892 Y44.085 E.72209
G1 X182.892 Y40.505 E.11
G1 X207.972 Y40.505 E.77064
G1 X207.972 Y126.085 E2.62964
G1 X154.392 Y126.085 E1.64636
G1 X154.392 Y40.505 E2.62964
G1 X179.472 Y40.505 E.77064
G1 X179.472 Y44.085 E.11
G1 X155.972 Y44.085 E.72209
G1 X155.972 Y124.505 E2.47108
G1 X206.392 Y124.505 E1.54927
G1 X206.392 Y44.145 E2.46924
; WIPE_START
M204 S5000
G1 X204.392 Y44.14 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.182 Y43.49 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X207.182 Y125.101 E2.58563
; LINE_WIDTH: 0.4484
G1 X207.166 Y125.182 E.00272
; LINE_WIDTH: 0.470633
G1 X207.149 Y125.262 E.00287
G1 X206.988 Y125.295 E.00573
; LINE_WIDTH: 0.43172
G1 X155.377 Y125.295 E1.63516
; LINE_WIDTH: 0.4484
G1 X155.296 Y125.279 E.00272
; LINE_WIDTH: 0.470633
G1 X155.216 Y125.262 E.00287
G1 X155.182 Y125.101 E.00573
; LINE_WIDTH: 0.43172
G1 X155.182 Y43.49 E2.58563
G1 X177.902 Y42.516 F15000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48319
G1 F4800
G1 X177.902 Y42.075 E.0158
G1 X155.962 Y42.075 E.78714
G1 X155.962 Y42.402 E.01173
G1 X156.146 Y42.478 E.00712
G1 X156.166 Y42.516 E.00152
G1 X177.842 Y42.516 E.77769
G1 X178.311 Y42.924 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X178.311 Y41.667 E.03864
G1 X155.554 Y41.667 E.69926
G1 X155.554 Y42.721 E.03239
G1 X155.918 Y42.817 E.01157
G1 X155.975 Y42.924 E.00373
G1 X178.251 Y42.924 E.68448
G1 X178.688 Y43.301 F15000
G1 F4800
G1 X178.688 Y41.289 E.06181
G1 X155.176 Y41.29 E.72243
M73 P57 R7
G1 X155.176 Y43.098 E.05556
G1 X155.691 Y43.12 E.01582
G1 X155.805 Y43.301 E.00659
G1 X178.628 Y43.301 E.70127
; WIPE_START
G1 X176.628 Y43.301 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X184.223 Y42.54 Z1 F15000
G1 X184.462 Y42.516 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.483185
G1 F4800
G1 X206.199 Y42.516 E.77983
G3 X206.403 Y42.402 I.217 J.151 E.00865
G1 X206.403 Y42.075 E.01173
G1 X184.462 Y42.075 E.78713
G1 X184.462 Y42.456 E.01364
G1 X184.054 Y42.924 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X206.39 Y42.924 E.68632
G1 X206.496 Y42.788 E.00532
G1 X206.811 Y42.721 E.00989
G1 X206.811 Y41.667 E.03239
G1 X184.054 Y41.667 E.69926
G1 X184.054 Y42.864 E.0368
G1 X183.677 Y43.301 F15000
G1 F4800
G1 X206.574 Y43.301 E.70357
G1 X206.674 Y43.12 E.00635
G1 X207.188 Y43.098 E.01582
G1 X207.188 Y41.289 E.05556
G1 X183.677 Y41.29 E.72243
G1 X183.677 Y43.241 E.05997
; OBJECT_ID: 140
; WIPE_START
G1 X183.677 Y41.29 E-.74166
G1 X183.725 Y41.29 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 118
M625
; start printing object, unique label id: 140
M624 BAAAAAAAAAA=
G1 X176.098 Y41.582 Z1 F15000
G1 X124.346 Y43.569 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X100.846 Y43.569 E.77954
G1 X100.846 Y40.773 E.09274
G1 X125.142 Y40.773 E.80594
G1 X125.142 Y125.569 E2.81283
G1 X72.346 Y125.569 E1.75134
G1 X72.346 Y40.773 E2.81283
G1 X96.642 Y40.773 E.80594
G1 X96.642 Y43.569 E.09274
G1 X73.142 Y43.569 E.77954
G1 X73.142 Y124.773 E2.69369
G1 X124.346 Y124.773 E1.69854
G1 X124.346 Y43.629 E2.6917
M204 S250
G1 X123.954 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X100.454 Y43.961 E.72209
G1 X100.454 Y40.381 E.11
G1 X125.534 Y40.381 E.77064
G1 X125.534 Y125.961 E2.62964
G1 X71.954 Y125.961 E1.64636
G1 X71.954 Y40.381 E2.62964
G1 X97.034 Y40.381 E.77064
G1 X97.034 Y43.961 E.11
M73 P58 R7
G1 X73.534 Y43.961 E.72209
G1 X73.534 Y124.381 E2.47108
G1 X123.954 Y124.381 E1.54927
G1 X123.954 Y44.021 E2.46924
; WIPE_START
M204 S5000
G1 X121.954 Y44.016 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.744 Y43.366 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X124.744 Y124.977 E2.58563
; LINE_WIDTH: 0.4484
G1 X124.727 Y125.057 E.00272
; LINE_WIDTH: 0.470633
G1 X124.71 Y125.138 E.00287
G1 X124.549 Y125.171 E.00573
; LINE_WIDTH: 0.43172
G1 X72.938 Y125.171 E1.63516
; LINE_WIDTH: 0.4484
G1 X72.858 Y125.155 E.00272
; LINE_WIDTH: 0.470633
G1 X72.777 Y125.138 E.00287
G1 X72.744 Y124.977 E.00573
; LINE_WIDTH: 0.43172
G1 X72.744 Y43.366 E2.58563
G1 X95.464 Y42.391 F15000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48319
G1 F4800
G1 X95.464 Y41.951 E.0158
G1 X73.524 Y41.951 E.78714
G1 X73.524 Y42.278 E.01173
G1 X73.707 Y42.354 E.00712
G1 X73.727 Y42.391 E.00152
G1 X95.404 Y42.391 E.77769
G1 X95.872 Y42.8 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X95.872 Y41.543 E.03864
G1 X73.115 Y41.543 E.69926
G1 X73.115 Y42.597 E.03239
G1 X73.479 Y42.693 E.01157
G1 X73.536 Y42.8 E.00373
G1 X95.812 Y42.8 E.68448
G1 X96.25 Y43.177 F15000
G1 F4800
G1 X96.25 Y41.165 E.06181
G1 X72.738 Y41.165 E.72243
G1 X72.738 Y42.974 E.05556
G1 X73.252 Y42.996 E.01582
G1 X73.367 Y43.177 E.00659
G1 X96.19 Y43.177 E.70127
; WIPE_START
G1 X94.19 Y43.177 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.784 Y42.416 Z1 F15000
G1 X102.024 Y42.391 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.483185
G1 F4800
G1 X123.76 Y42.391 E.77983
G3 X123.964 Y42.278 I.217 J.151 E.00865
G1 X123.964 Y41.951 E.01173
M73 P59 R7
G1 X102.024 Y41.951 E.78713
G1 X102.024 Y42.331 E.01364
G1 X101.615 Y42.8 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X123.951 Y42.8 E.68632
G1 X124.058 Y42.663 E.00532
G1 X124.372 Y42.597 E.00989
G1 X124.372 Y41.543 E.03239
G1 X101.615 Y41.543 E.69926
G1 X101.615 Y42.74 E.0368
G1 X101.238 Y43.177 F15000
G1 F4800
G1 X124.136 Y43.177 E.70357
G1 X124.235 Y42.996 E.00635
G1 X124.75 Y42.974 E.01582
G1 X124.75 Y41.165 E.05556
G1 X101.238 Y41.165 E.72243
G1 X101.238 Y43.117 E.05997
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4800
G1 X101.238 Y41.165 E-.74166
G1 X101.286 Y41.165 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
; layer num/total_layer_count: 4/10
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z1 I1.217 J0 P1  F15000
; object ids of layer 4 start: 81,118,140
M624 BwAAAAAAAAA=
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
; object ids of this layer4 end: 81,118,140
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X96.826 Y208.965
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X178.031 Y208.965 E2.69369
G1 X178.031 Y157.761 E1.69854
G1 X96.826 Y157.761 E2.69369
G1 X96.826 Y181.261 E.77954
G1 X94.031 Y181.261 E.09274
G1 X94.031 Y156.965 E.80594
G1 X178.826 Y156.965 E2.81283
G1 X178.826 Y209.761 E1.75134
G1 X94.031 Y209.761 E2.81283
G1 X94.031 Y185.465 E.80594
G1 X96.826 Y185.465 E.09274
G1 X96.826 Y208.905 E.77755
M204 S250
G1 X97.219 Y208.573 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X177.639 Y208.573 E2.47108
G1 X177.639 Y158.153 E1.54927
G1 X97.219 Y158.153 E2.47108
G1 X97.219 Y181.653 E.72209
G1 X93.639 Y181.653 E.11
G1 X93.639 Y156.573 E.77064
G1 X179.219 Y156.573 E2.62964
G1 X179.219 Y210.153 E1.64636
G1 X93.639 Y210.153 E2.62964
G1 X93.639 Y185.073 E.77064
G1 X97.219 Y185.073 E.11
G1 X97.219 Y208.513 E.72025
; WIPE_START
M204 S5000
G1 X99.219 Y208.515 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y209.363 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X178.234 Y209.363 E2.58563
; LINE_WIDTH: 0.448395
G1 X178.315 Y209.346 E.00272
; LINE_WIDTH: 0.470635
G1 X178.395 Y209.33 E.00287
G1 X178.429 Y209.169 E.00573
; LINE_WIDTH: 0.43172
G1 X178.429 Y157.557 E1.63516
; LINE_WIDTH: 0.448395
G1 X178.412 Y157.477 E.00272
; LINE_WIDTH: 0.470635
G1 X178.395 Y157.396 E.00287
G1 X178.234 Y157.363 E.00573
; LINE_WIDTH: 0.43172
G1 X96.623 Y157.363 E2.58563
G1 X94.196 Y157.954 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X94.837 Y157.313 E.03008
G1 X95.413 Y157.313 E.01912
G1 X94.379 Y158.348 E.04852
G1 X94.379 Y158.924 E.01912
G1 X95.989 Y157.313 E.07556
G1 X96.275 Y157.313 E.00947
G1 X96.275 Y157.604 E.00965
G1 X94.379 Y159.5 E.08895
G1 X94.379 Y160.077 E.01912
G1 X96.478 Y157.977 E.09849
G1 X96.478 Y158.553 E.01912
G1 X94.379 Y160.653 E.09849
G1 X94.379 Y161.229 E.01912
G1 X96.478 Y159.13 E.09849
G1 X96.478 Y159.706 E.01912
M73 P60 R7
G1 X94.379 Y161.806 E.09849
G1 X94.379 Y162.382 E.01912
G1 X96.478 Y160.283 E.09849
G1 X96.478 Y160.859 E.01912
G1 X94.379 Y162.958 E.09849
G1 X94.379 Y163.535 E.01912
G1 X96.478 Y161.435 E.09849
G1 X96.478 Y162.012 E.01912
G1 X94.379 Y164.111 E.09849
G1 X94.379 Y164.688 E.01912
G1 X96.478 Y162.588 E.09849
G1 X96.478 Y163.164 E.01912
G1 X94.379 Y165.264 E.09849
G1 X94.379 Y165.84 E.01912
G1 X96.478 Y163.741 E.09849
G1 X96.478 Y164.317 E.01912
G1 X94.379 Y166.417 E.09849
G1 X94.379 Y166.993 E.01912
G1 X96.478 Y164.893 E.09849
G1 X96.478 Y165.47 E.01912
G1 X94.379 Y167.569 E.09849
G1 X94.379 Y168.146 E.01912
G1 X96.478 Y166.046 E.09849
G1 X96.478 Y166.623 E.01912
G1 X94.379 Y168.722 E.09849
G1 X94.379 Y169.298 E.01912
G1 X96.478 Y167.199 E.09849
G1 X96.478 Y167.775 E.01912
G1 X94.379 Y169.875 E.09849
G1 X94.379 Y170.451 E.01912
G1 X96.478 Y168.352 E.09849
G1 X96.478 Y168.928 E.01912
G1 X94.379 Y171.028 E.09849
G1 X94.379 Y171.604 E.01912
G1 X96.478 Y169.504 E.09849
G1 X96.478 Y170.081 E.01912
G1 X94.379 Y172.18 E.09849
G1 X94.379 Y172.757 E.01912
G1 X96.478 Y170.657 E.09849
G1 X96.478 Y171.233 E.01912
G1 X94.379 Y173.333 E.09849
G1 X94.379 Y173.909 E.01912
G1 X96.478 Y171.81 E.09849
G1 X96.478 Y172.386 E.01912
G1 X94.379 Y174.486 E.09849
G1 X94.379 Y175.062 E.01912
G1 X96.478 Y172.963 E.09849
G1 X96.478 Y173.539 E.01912
G1 X94.379 Y175.638 E.09849
G1 X94.379 Y176.215 E.01912
G1 X96.478 Y174.115 E.09849
G1 X96.478 Y174.692 E.01912
G1 X94.379 Y176.791 E.09849
G1 X94.379 Y177.368 E.01912
G1 X96.478 Y175.268 E.09849
G1 X96.478 Y175.844 E.01912
G1 X94.379 Y177.944 E.09849
G1 X94.379 Y178.52 E.01912
G1 X96.478 Y176.421 E.09849
G1 X96.478 Y176.997 E.01912
G1 X94.379 Y179.097 E.09849
G1 X94.379 Y179.673 E.01912
G1 X96.478 Y177.573 E.09849
G1 X96.478 Y178.15 E.01912
G1 X94.379 Y180.249 E.09849
G1 X94.379 Y180.826 E.01912
G1 X96.478 Y178.726 E.09849
G1 X96.478 Y179.303 E.01912
G1 X94.868 Y180.913 E.07554
G1 X95.444 Y180.913 E.01912
G1 X96.478 Y179.879 E.0485
G1 X96.478 Y180.455 E.01912
G1 X95.838 Y181.096 E.03006
; WIPE_START
G1 X96.478 Y180.455 E-.34433
G1 X96.478 Y179.879 E-.21902
G1 X96.112 Y180.245 E-.19666
; WIPE_END
G1 E-.04 F1800
G1 X95.032 Y185.63 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
G1 F7800
G1 X94.379 Y186.284 E.03066
G1 X94.379 Y186.868 E.01939
G1 X95.434 Y185.813 E.04949
G1 X96.018 Y185.813 E.01939
G1 X94.379 Y187.453 E.07692
G1 X94.379 Y188.038 E.01939
G1 X96.478 Y185.938 E.09849
G1 X96.478 Y186.523 E.01939
G1 X94.379 Y188.622 E.09849
G1 X94.379 Y189.207 E.01939
G1 X96.478 Y187.107 E.09849
G1 X96.478 Y187.692 E.01939
M73 P61 R7
G1 X94.379 Y189.792 E.09849
G1 X94.379 Y190.376 E.01939
G1 X96.478 Y188.277 E.09849
G1 X96.478 Y188.861 E.01939
G1 X94.379 Y190.961 E.09849
G1 X94.379 Y191.546 E.01939
G1 X96.478 Y189.446 E.09849
G1 X96.478 Y190.031 E.01939
G1 X94.379 Y192.13 E.09849
G1 X94.379 Y192.715 E.01939
G1 X96.478 Y190.615 E.09849
G1 X96.478 Y191.2 E.01939
G1 X94.379 Y193.299 E.09849
G1 X94.379 Y193.884 E.01939
G1 X96.478 Y191.785 E.09849
G1 X96.478 Y192.369 E.01939
G1 X94.379 Y194.469 E.09849
G1 X94.379 Y195.053 E.01939
G1 X96.478 Y192.954 E.09849
G1 X96.478 Y193.539 E.01939
G1 X94.379 Y195.638 E.09849
G1 X94.379 Y196.223 E.01939
G1 X96.478 Y194.123 E.09849
G1 X96.478 Y194.708 E.01939
G1 X94.379 Y196.807 E.09849
G1 X94.379 Y197.392 E.01939
G1 X96.478 Y195.292 E.09849
G1 X96.478 Y195.877 E.01939
G1 X94.379 Y197.977 E.09849
G1 X94.379 Y198.561 E.01939
G1 X96.478 Y196.462 E.09849
G1 X96.478 Y197.046 E.01939
G1 X94.379 Y199.146 E.09849
G1 X94.379 Y199.731 E.01939
G1 X96.478 Y197.631 E.09849
G1 X96.478 Y198.216 E.01939
G1 X94.379 Y200.315 E.09849
G1 X94.379 Y200.9 E.01939
G1 X96.478 Y198.8 E.09849
G1 X96.478 Y199.385 E.01939
G1 X94.379 Y201.485 E.09849
G1 X94.379 Y202.069 E.01939
G1 X96.478 Y199.97 E.09849
G1 X96.478 Y200.554 E.01939
G1 X94.379 Y202.654 E.09849
G1 X94.379 Y203.239 E.01939
G1 X96.478 Y201.139 E.09849
G1 X96.478 Y201.724 E.01939
G1 X94.379 Y203.823 E.09849
G1 X94.379 Y204.408 E.01939
G1 X96.478 Y202.308 E.09849
G1 X96.478 Y202.893 E.01939
G1 X94.379 Y204.992 E.09849
G1 X94.379 Y205.577 E.01939
G1 X96.478 Y203.478 E.09849
G1 X96.478 Y204.062 E.01939
G1 X94.379 Y206.162 E.09849
G1 X94.379 Y206.746 E.01939
G1 X96.478 Y204.647 E.09849
G1 X96.478 Y205.232 E.01939
G1 X94.379 Y207.331 E.09849
G1 X94.379 Y207.916 E.01939
G1 X96.478 Y205.816 E.09849
G1 X96.478 Y206.401 E.01939
G1 X94.379 Y208.5 E.09849
G1 X94.379 Y209.085 E.01939
G1 X96.478 Y206.985 E.09849
G1 X96.478 Y207.57 E.01939
G1 X94.636 Y209.413 E.08645
G1 X95.22 Y209.413 E.01939
G1 X96.478 Y208.155 E.05902
G1 X96.478 Y208.739 E.01939
G1 X95.622 Y209.596 E.04018
; OBJECT_ID: 118
; WIPE_START
G1 X96.478 Y208.739 E-.46033
G1 X96.478 Y208.155 E-.22217
G1 X96.334 Y208.299 E-.0775
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 118
M624 AgAAAAAAAAA=
G1 X100.587 Y201.961 Z1.2 F15000
G1 X206.784 Y43.693 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X183.284 Y43.693 E.77954
G1 X183.284 Y40.897 E.09274
G1 X207.58 Y40.897 E.80594
G1 X207.58 Y125.693 E2.81283
G1 X154.784 Y125.693 E1.75134
G1 X154.784 Y40.897 E2.81283
G1 X179.08 Y40.897 E.80594
G1 X179.08 Y43.693 E.09274
G1 X155.58 Y43.693 E.77954
G1 X155.58 Y124.897 E2.69369
G1 X206.784 Y124.897 E1.69854
G1 X206.784 Y43.753 E2.6917
M204 S250
G1 X206.392 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X182.892 Y44.085 E.72209
G1 X182.892 Y40.505 E.11
G1 X207.972 Y40.505 E.77064
G1 X207.972 Y126.085 E2.62964
G1 X154.392 Y126.085 E1.64636
G1 X154.392 Y40.505 E2.62964
G1 X179.472 Y40.505 E.77064
G1 X179.472 Y44.085 E.11
G1 X155.972 Y44.085 E.72209
G1 X155.972 Y124.505 E2.47108
G1 X206.392 Y124.505 E1.54927
G1 X206.392 Y44.145 E2.46924
M204 S5000
G1 X206.376 Y43.528 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X207.232 Y42.672 E.04018
G1 X207.232 Y42.087 E.01939
G1 X205.974 Y43.345 E.05902
G1 X205.389 Y43.345 E.01939
G1 X207.232 Y41.502 E.08645
G1 X207.232 Y41.246 E.00852
G1 X206.904 Y41.246 E.01087
G1 X204.805 Y43.345 E.09849
G1 X204.22 Y43.345 E.01939
G1 X206.32 Y41.246 E.09849
G1 X205.735 Y41.246 E.01939
G1 X203.635 Y43.345 E.09849
G1 X203.051 Y43.345 E.01939
G1 X205.15 Y41.246 E.09849
G1 X204.566 Y41.246 E.01939
G1 X202.466 Y43.345 E.09849
G1 X201.882 Y43.345 E.01939
G1 X203.981 Y41.246 E.09849
G1 X203.396 Y41.246 E.01939
G1 X201.297 Y43.345 E.09849
G1 X200.712 Y43.345 E.01939
G1 X202.812 Y41.246 E.09849
G1 X202.227 Y41.246 E.01939
G1 X200.128 Y43.345 E.09849
G1 X199.543 Y43.345 E.01939
G1 X201.642 Y41.246 E.09849
G1 X201.058 Y41.246 E.01939
G1 X198.958 Y43.345 E.09849
G1 X198.374 Y43.345 E.01939
M73 P61 R6
G1 X200.473 Y41.246 E.09849
G1 X199.889 Y41.246 E.01939
G1 X197.789 Y43.345 E.09849
G1 X197.204 Y43.345 E.01939
G1 X199.304 Y41.246 E.09849
G1 X198.719 Y41.246 E.01939
G1 X196.62 Y43.345 E.09849
G1 X196.035 Y43.345 E.01939
G1 X198.135 Y41.246 E.09849
G1 X197.55 Y41.246 E.01939
G1 X195.45 Y43.345 E.09849
G1 X194.866 Y43.345 E.01939
G1 X196.965 Y41.246 E.09849
M73 P62 R6
G1 X196.381 Y41.246 E.01939
G1 X194.281 Y43.345 E.09849
G1 X193.696 Y43.345 E.01939
G1 X195.796 Y41.246 E.09849
G1 X195.211 Y41.246 E.01939
G1 X193.112 Y43.345 E.09849
G1 X192.527 Y43.345 E.01939
G1 X194.627 Y41.246 E.09849
G1 X194.042 Y41.246 E.01939
G1 X191.942 Y43.345 E.09849
G1 X191.358 Y43.345 E.01939
G1 X193.457 Y41.246 E.09849
G1 X192.873 Y41.246 E.01939
G1 X190.773 Y43.345 E.09849
G1 X190.189 Y43.345 E.01939
G1 X192.288 Y41.246 E.09849
G1 X191.703 Y41.246 E.01939
G1 X189.604 Y43.345 E.09849
G1 X189.019 Y43.345 E.01939
G1 X191.119 Y41.246 E.09849
G1 X190.534 Y41.246 E.01939
G1 X188.435 Y43.345 E.09849
G1 X187.85 Y43.345 E.01939
G1 X189.949 Y41.246 E.09849
G1 X189.365 Y41.246 E.01939
G1 X187.265 Y43.345 E.09849
G1 X186.681 Y43.345 E.01939
G1 X188.78 Y41.246 E.09849
G1 X188.196 Y41.246 E.01939
G1 X186.096 Y43.345 E.09849
G1 X185.511 Y43.345 E.01939
G1 X187.611 Y41.246 E.09849
G1 X187.026 Y41.246 E.01939
G1 X184.927 Y43.345 E.09849
G1 X184.342 Y43.345 E.01939
G1 X186.442 Y41.246 E.09849
G1 X185.857 Y41.246 E.01939
G1 X183.757 Y43.345 E.09849
G1 X183.633 Y43.345 E.00414
G1 X183.633 Y42.885 E.01526
G1 X185.272 Y41.246 E.07692
G1 X184.688 Y41.246 E.01939
G1 X183.633 Y42.301 E.04949
G1 X183.633 Y41.716 E.01939
G1 X184.286 Y41.062 E.03066
; WIPE_START
G1 X183.633 Y41.716 E-.35122
G1 X183.633 Y42.301 E-.22217
G1 X183.98 Y41.953 E-.18661
; WIPE_END
G1 E-.04 F1800
G1 X178.091 Y43.528 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
G1 F7800
G1 X178.732 Y42.888 E.03006
G1 X178.732 Y42.311 E.01912
G1 X177.698 Y43.345 E.0485
G1 X177.122 Y43.345 E.01912
G1 X178.732 Y41.735 E.07554
G1 X178.732 Y41.246 E.01623
G1 X178.645 Y41.246 E.00289
G1 X176.546 Y43.345 E.09849
G1 X175.969 Y43.345 E.01912
G1 X178.069 Y41.246 E.09849
G1 X177.492 Y41.246 E.01912
G1 X175.393 Y43.345 E.09849
G1 X174.816 Y43.345 E.01912
G1 X176.916 Y41.246 E.09849
G1 X176.34 Y41.246 E.01912
G1 X174.24 Y43.345 E.09849
G1 X173.664 Y43.345 E.01912
G1 X175.763 Y41.246 E.09849
G1 X175.187 Y41.246 E.01912
G1 X173.087 Y43.345 E.09849
G1 X172.511 Y43.345 E.01912
G1 X174.611 Y41.246 E.09849
G1 X174.034 Y41.246 E.01912
G1 X171.935 Y43.345 E.09849
G1 X171.358 Y43.345 E.01912
G1 X173.458 Y41.246 E.09849
G1 X172.881 Y41.246 E.01912
G1 X170.782 Y43.345 E.09849
G1 X170.206 Y43.345 E.01912
G1 X172.305 Y41.246 E.09849
G1 X171.729 Y41.246 E.01912
G1 X169.629 Y43.345 E.09849
G1 X169.053 Y43.345 E.01912
G1 X171.152 Y41.246 E.09849
G1 X170.576 Y41.246 E.01912
G1 X168.476 Y43.345 E.09849
G1 X167.9 Y43.345 E.01912
G1 X170 Y41.246 E.09849
G1 X169.423 Y41.246 E.01912
G1 X167.324 Y43.345 E.09849
G1 X166.747 Y43.345 E.01912
G1 X168.847 Y41.246 E.09849
G1 X168.271 Y41.246 E.01912
G1 X166.171 Y43.345 E.09849
G1 X165.595 Y43.345 E.01912
G1 X167.694 Y41.246 E.09849
G1 X167.118 Y41.246 E.01912
G1 X165.018 Y43.345 E.09849
G1 X164.442 Y43.345 E.01912
G1 X166.541 Y41.246 E.09849
G1 X165.965 Y41.246 E.01912
G1 X163.866 Y43.345 E.09849
G1 X163.289 Y43.345 E.01912
G1 X165.389 Y41.246 E.09849
G1 X164.812 Y41.246 E.01912
G1 X162.713 Y43.345 E.09849
G1 X162.136 Y43.345 E.01912
G1 X164.236 Y41.246 E.09849
G1 X163.66 Y41.246 E.01912
G1 X161.56 Y43.345 E.09849
G1 X160.984 Y43.345 E.01912
G1 X163.083 Y41.246 E.09849
G1 X162.507 Y41.246 E.01912
G1 X160.407 Y43.345 E.09849
G1 X159.831 Y43.345 E.01912
G1 X161.931 Y41.246 E.09849
G1 X161.354 Y41.246 E.01912
G1 X159.255 Y43.345 E.09849
G1 X158.678 Y43.345 E.01912
G1 X160.778 Y41.246 E.09849
G1 X160.201 Y41.246 E.01912
G1 X158.102 Y43.345 E.09849
G1 X157.526 Y43.345 E.01912
G1 X159.625 Y41.246 E.09849
G1 X159.049 Y41.246 E.01912
G1 X156.949 Y43.345 E.09849
G1 X156.373 Y43.345 E.01912
G1 X158.472 Y41.246 E.09849
G1 X157.896 Y41.246 E.01912
G1 X155.796 Y43.345 E.09849
G1 X155.746 Y43.345 E.00166
G1 X155.746 Y43.142 E.00675
G1 X155.424 Y43.142 E.01071
G1 X157.32 Y41.246 E.08895
G1 X156.743 Y41.246 E.01912
G1 X155.133 Y42.856 E.07556
G1 X155.133 Y42.28 E.01912
G1 X156.167 Y41.246 E.04852
G1 X155.591 Y41.246 E.01912
G1 X154.949 Y41.887 E.03008
G1 X155.182 Y43.49 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.182 Y125.101 E2.58563
; LINE_WIDTH: 0.470633
G1 X155.216 Y125.262 E.00573
G1 X155.296 Y125.279 E.00287
; LINE_WIDTH: 0.4484
G1 X155.377 Y125.295 E.00272
; LINE_WIDTH: 0.43172
G1 X206.988 Y125.295 E1.63516
; LINE_WIDTH: 0.470633
G1 X207.149 Y125.262 E.00573
G1 X207.166 Y125.182 E.00287
; LINE_WIDTH: 0.4484
G1 X207.182 Y125.101 E.00272
; LINE_WIDTH: 0.43172
G1 X207.182 Y43.49 E2.58563
; OBJECT_ID: 140
; WIPE_START
G1 X207.182 Y45.49 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 118
M625
; start printing object, unique label id: 140
M624 BAAAAAAAAAA=
G1 X199.552 Y45.313 Z1.2 F15000
G1 X124.346 Y43.569 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X100.846 Y43.569 E.77954
G1 X100.846 Y40.773 E.09274
G1 X125.142 Y40.773 E.80594
G1 X125.142 Y125.569 E2.81283
G1 X72.346 Y125.569 E1.75134
G1 X72.346 Y40.773 E2.81283
G1 X96.642 Y40.773 E.80594
G1 X96.642 Y43.569 E.09274
G1 X73.142 Y43.569 E.77954
G1 X73.142 Y124.773 E2.69369
G1 X124.346 Y124.773 E1.69854
G1 X124.346 Y43.629 E2.6917
M204 S250
G1 X123.954 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X100.454 Y43.961 E.72209
G1 X100.454 Y40.381 E.11
G1 X125.534 Y40.381 E.77064
G1 X125.534 Y125.961 E2.62964
G1 X71.954 Y125.961 E1.64636
G1 X71.954 Y40.381 E2.62964
G1 X97.034 Y40.381 E.77064
G1 X97.034 Y43.961 E.11
G1 X73.534 Y43.961 E.72209
G1 X73.534 Y124.381 E2.47108
G1 X123.954 Y124.381 E1.54927
G1 X123.954 Y44.021 E2.46924
M204 S5000
G1 X123.937 Y43.404 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X124.793 Y42.548 E.04018
G1 X124.793 Y41.963 E.01939
G1 X123.535 Y43.221 E.05902
G1 X122.951 Y43.221 E.01939
G1 X124.793 Y41.378 E.08645
G1 X124.793 Y41.122 E.00852
G1 X124.466 Y41.122 E.01087
G1 X122.366 Y43.221 E.09849
G1 X121.781 Y43.221 E.01939
G1 X123.881 Y41.122 E.09849
G1 X123.296 Y41.122 E.01939
G1 X121.197 Y43.221 E.09849
G1 X120.612 Y43.221 E.01939
G1 X122.712 Y41.122 E.09849
G1 X122.127 Y41.122 E.01939
G1 X120.027 Y43.221 E.09849
G1 X119.443 Y43.221 E.01939
G1 X121.542 Y41.122 E.09849
G1 X120.958 Y41.122 E.01939
M73 P63 R6
G1 X118.858 Y43.221 E.09849
G1 X118.273 Y43.221 E.01939
G1 X120.373 Y41.122 E.09849
G1 X119.788 Y41.122 E.01939
G1 X117.689 Y43.221 E.09849
G1 X117.104 Y43.221 E.01939
G1 X119.204 Y41.122 E.09849
G1 X118.619 Y41.122 E.01939
G1 X116.52 Y43.221 E.09849
G1 X115.935 Y43.221 E.01939
G1 X118.034 Y41.122 E.09849
G1 X117.45 Y41.122 E.01939
G1 X115.35 Y43.221 E.09849
G1 X114.766 Y43.221 E.01939
G1 X116.865 Y41.122 E.09849
G1 X116.28 Y41.122 E.01939
G1 X114.181 Y43.221 E.09849
G1 X113.596 Y43.221 E.01939
G1 X115.696 Y41.122 E.09849
G1 X115.111 Y41.122 E.01939
G1 X113.012 Y43.221 E.09849
G1 X112.427 Y43.221 E.01939
G1 X114.527 Y41.122 E.09849
G1 X113.942 Y41.122 E.01939
G1 X111.842 Y43.221 E.09849
G1 X111.258 Y43.221 E.01939
G1 X113.357 Y41.122 E.09849
G1 X112.773 Y41.122 E.01939
G1 X110.673 Y43.221 E.09849
G1 X110.088 Y43.221 E.01939
G1 X112.188 Y41.122 E.09849
G1 X111.603 Y41.122 E.01939
G1 X109.504 Y43.221 E.09849
G1 X108.919 Y43.221 E.01939
G1 X111.019 Y41.122 E.09849
G1 X110.434 Y41.122 E.01939
G1 X108.334 Y43.221 E.09849
G1 X107.75 Y43.221 E.01939
G1 X109.849 Y41.122 E.09849
G1 X109.265 Y41.122 E.01939
G1 X107.165 Y43.221 E.09849
G1 X106.58 Y43.221 E.01939
G1 X108.68 Y41.122 E.09849
G1 X108.095 Y41.122 E.01939
G1 X105.996 Y43.221 E.09849
G1 X105.411 Y43.221 E.01939
G1 X107.511 Y41.122 E.09849
G1 X106.926 Y41.122 E.01939
G1 X104.827 Y43.221 E.09849
G1 X104.242 Y43.221 E.01939
G1 X106.341 Y41.122 E.09849
G1 X105.757 Y41.122 E.01939
G1 X103.657 Y43.221 E.09849
G1 X103.073 Y43.221 E.01939
G1 X105.172 Y41.122 E.09849
G1 X104.587 Y41.122 E.01939
G1 X102.488 Y43.221 E.09849
G1 X101.903 Y43.221 E.01939
G1 X104.003 Y41.122 E.09849
M73 P64 R6
G1 X103.418 Y41.122 E.01939
G1 X101.319 Y43.221 E.09849
G1 X101.194 Y43.221 E.00414
G1 X101.194 Y42.761 E.01526
G1 X102.834 Y41.122 E.07692
G1 X102.249 Y41.122 E.01939
G1 X101.194 Y42.177 E.04949
G1 X101.194 Y41.592 E.01939
G1 X101.847 Y40.938 E.03066
; WIPE_START
G1 X101.194 Y41.592 E-.35122
G1 X101.194 Y42.177 E-.22217
G1 X101.541 Y41.829 E-.18661
; WIPE_END
G1 E-.04 F1800
G1 X95.653 Y43.404 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
G1 F7800
G1 X96.293 Y42.764 E.03006
G1 X96.293 Y42.187 E.01912
G1 X95.26 Y43.221 E.0485
G1 X94.683 Y43.221 E.01912
G1 X96.293 Y41.611 E.07554
G1 X96.293 Y41.122 E.01623
G1 X96.206 Y41.122 E.00289
G1 X94.107 Y43.221 E.09849
G1 X93.53 Y43.221 E.01912
G1 X95.63 Y41.122 E.09849
G1 X95.054 Y41.122 E.01912
G1 X92.954 Y43.221 E.09849
G1 X92.378 Y43.221 E.01912
G1 X94.477 Y41.122 E.09849
G1 X93.901 Y41.122 E.01912
G1 X91.801 Y43.221 E.09849
G1 X91.225 Y43.221 E.01912
G1 X93.325 Y41.122 E.09849
G1 X92.748 Y41.122 E.01912
G1 X90.649 Y43.221 E.09849
G1 X90.072 Y43.221 E.01912
G1 X92.172 Y41.122 E.09849
G1 X91.595 Y41.122 E.01912
G1 X89.496 Y43.221 E.09849
G1 X88.92 Y43.221 E.01912
G1 X91.019 Y41.122 E.09849
G1 X90.443 Y41.122 E.01912
G1 X88.343 Y43.221 E.09849
G1 X87.767 Y43.221 E.01912
G1 X89.866 Y41.122 E.09849
G1 X89.29 Y41.122 E.01912
G1 X87.19 Y43.221 E.09849
G1 X86.614 Y43.221 E.01912
G1 X88.714 Y41.122 E.09849
G1 X88.137 Y41.122 E.01912
G1 X86.038 Y43.221 E.09849
G1 X85.461 Y43.221 E.01912
G1 X87.561 Y41.122 E.09849
G1 X86.985 Y41.122 E.01912
G1 X84.885 Y43.221 E.09849
G1 X84.309 Y43.221 E.01912
G1 X86.408 Y41.122 E.09849
G1 X85.832 Y41.122 E.01912
G1 X83.732 Y43.221 E.09849
G1 X83.156 Y43.221 E.01912
G1 X85.255 Y41.122 E.09849
G1 X84.679 Y41.122 E.01912
G1 X82.58 Y43.221 E.09849
G1 X82.003 Y43.221 E.01912
G1 X84.103 Y41.122 E.09849
G1 X83.526 Y41.122 E.01912
G1 X81.427 Y43.221 E.09849
G1 X80.85 Y43.221 E.01912
G1 X82.95 Y41.122 E.09849
G1 X82.374 Y41.122 E.01912
G1 X80.274 Y43.221 E.09849
G1 X79.698 Y43.221 E.01912
G1 X81.797 Y41.122 E.09849
G1 X81.221 Y41.122 E.01912
G1 X79.121 Y43.221 E.09849
G1 X78.545 Y43.221 E.01912
G1 X80.645 Y41.122 E.09849
G1 X80.068 Y41.122 E.01912
G1 X77.969 Y43.221 E.09849
G1 X77.392 Y43.221 E.01912
G1 X79.492 Y41.122 E.09849
G1 X78.915 Y41.122 E.01912
G1 X76.816 Y43.221 E.09849
G1 X76.24 Y43.221 E.01912
G1 X78.339 Y41.122 E.09849
G1 X77.763 Y41.122 E.01912
G1 X75.663 Y43.221 E.09849
G1 X75.087 Y43.221 E.01912
G1 X77.186 Y41.122 E.09849
G1 X76.61 Y41.122 E.01912
G1 X74.51 Y43.221 E.09849
G1 X73.934 Y43.221 E.01912
G1 X76.034 Y41.122 E.09849
G1 X75.457 Y41.122 E.01912
G1 X73.358 Y43.221 E.09849
G1 X73.308 Y43.221 E.00166
G1 X73.308 Y43.018 E.00675
G1 X72.985 Y43.018 E.01071
G1 X74.881 Y41.122 E.08895
G1 X74.305 Y41.122 E.01912
G1 X72.694 Y42.732 E.07556
G1 X72.694 Y42.156 E.01912
G1 X73.728 Y41.122 E.04852
G1 X73.152 Y41.122 E.01912
G1 X72.511 Y41.763 E.03008
G1 X72.744 Y43.366 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X72.744 Y124.977 E2.58563
; LINE_WIDTH: 0.470633
G1 X72.777 Y125.138 E.00573
G1 X72.858 Y125.155 E.00287
; LINE_WIDTH: 0.4484
G1 X72.938 Y125.171 E.00272
; LINE_WIDTH: 0.43172
G1 X124.549 Y125.171 E1.63516
; LINE_WIDTH: 0.470633
G1 X124.71 Y125.138 E.00573
G1 X124.727 Y125.057 E.00287
; LINE_WIDTH: 0.4484
G1 X124.744 Y124.977 E.00272
; LINE_WIDTH: 0.43172
G1 X124.744 Y43.366 E2.58563
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X124.744 Y45.366 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
; layer num/total_layer_count: 5/10
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F15000
; object ids of layer 5 start: 81,118,140
M624 BwAAAAAAAAA=
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
; object ids of this layer5 end: 81,118,140
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X94.031 Y181.261
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X94.031 Y156.965 E.80594
G1 X169.658 Y156.965 E2.5087
G1 X169.658 Y157.761 E.0264
G1 X96.826 Y157.761 E2.41595
G1 X96.826 Y181.261 E.77954
G1 X94.091 Y181.261 E.09075
; WIPE_START
G1 X94.086 Y179.261 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.787 Y186.861 Z1.4 F15000
G1 X96.826 Y208.965 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8843.478
G1 X169.658 Y208.965 E2.41595
G1 X169.658 Y209.761 E.0264
G1 X94.031 Y209.761 E2.5087
G1 X94.031 Y185.465 E.80594
G1 X96.826 Y185.465 E.09274
G1 X96.826 Y208.905 E.77755
M204 S250
G1 X97.219 Y208.573 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X177.639 Y208.573 E2.47108
G1 X177.639 Y158.153 E1.54927
G1 X97.219 Y158.153 E2.47108
G1 X97.219 Y181.653 E.72209
G1 X93.639 Y181.653 E.11
G1 X93.639 Y156.573 E.77064
G1 X179.219 Y156.573 E2.62964
G1 X179.219 Y210.153 E1.64636
G1 X93.639 Y210.153 E2.62964
G1 X93.639 Y185.073 E.77064
G1 X97.219 Y185.073 E.11
G1 X97.219 Y208.513 E.72025
; WIPE_START
M204 S5000
G1 X99.219 Y208.515 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y209.363 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X169.454 Y209.363 E2.30746
; WIPE_START
G1 X167.454 Y209.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X167.748 Y201.736 Z1.4 F15000
G1 X169.454 Y157.363 Z1.4
G1 Z1
G1 E.8 F1800
G1 F7500
G1 X96.623 Y157.363 E2.30746
G1 X96.661 Y158.17 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X95.805 Y157.313 E.04018
G1 X95.22 Y157.313 E.01939
G1 X96.478 Y158.571 E.05902
G1 X96.478 Y159.156 E.01939
G1 X94.636 Y157.313 E.08645
G1 X94.379 Y157.313 E.00852
G1 X94.379 Y157.641 E.01087
G1 X96.478 Y159.741 E.09849
G1 X96.478 Y160.325 E.01939
G1 X94.379 Y158.226 E.09849
G1 X94.379 Y158.81 E.01939
G1 X96.478 Y160.91 E.09849
G1 X96.478 Y161.495 E.01939
G1 X94.379 Y159.395 E.09849
G1 X94.379 Y159.98 E.01939
G1 X96.478 Y162.079 E.09849
G1 X96.478 Y162.664 E.01939
G1 X94.379 Y160.564 E.09849
G1 X94.379 Y161.149 E.01939
G1 X96.478 Y163.249 E.09849
G1 X96.478 Y163.833 E.01939
G1 X94.379 Y161.734 E.09849
M73 P65 R6
G1 X94.379 Y162.318 E.01939
G1 X96.478 Y164.418 E.09849
G1 X96.478 Y165.002 E.01939
G1 X94.379 Y162.903 E.09849
G1 X94.379 Y163.488 E.01939
G1 X96.478 Y165.587 E.09849
G1 X96.478 Y166.172 E.01939
G1 X94.379 Y164.072 E.09849
G1 X94.379 Y164.657 E.01939
G1 X96.478 Y166.756 E.09849
G1 X96.478 Y167.341 E.01939
G1 X94.379 Y165.242 E.09849
G1 X94.379 Y165.826 E.01939
G1 X96.478 Y167.926 E.09849
G1 X96.478 Y168.51 E.01939
G1 X94.379 Y166.411 E.09849
G1 X94.379 Y166.995 E.01939
G1 X96.478 Y169.095 E.09849
G1 X96.478 Y169.68 E.01939
G1 X94.379 Y167.58 E.09849
G1 X94.379 Y168.165 E.01939
G1 X96.478 Y170.264 E.09849
G1 X96.478 Y170.849 E.01939
G1 X94.379 Y168.749 E.09849
G1 X94.379 Y169.334 E.01939
G1 X96.478 Y171.434 E.09849
G1 X96.478 Y172.018 E.01939
G1 X94.379 Y169.919 E.09849
G1 X94.379 Y170.503 E.01939
G1 X96.478 Y172.603 E.09849
G1 X96.478 Y173.188 E.01939
G1 X94.379 Y171.088 E.09849
G1 X94.379 Y171.673 E.01939
G1 X96.478 Y173.772 E.09849
G1 X96.478 Y174.357 E.01939
G1 X94.379 Y172.257 E.09849
G1 X94.379 Y172.842 E.01939
G1 X96.478 Y174.942 E.09849
G1 X96.478 Y175.526 E.01939
G1 X94.379 Y173.427 E.09849
G1 X94.379 Y174.011 E.01939
G1 X96.478 Y176.111 E.09849
G1 X96.478 Y176.695 E.01939
G1 X94.379 Y174.596 E.09849
G1 X94.379 Y175.181 E.01939
G1 X96.478 Y177.28 E.09849
G1 X96.478 Y177.865 E.01939
G1 X94.379 Y175.765 E.09849
G1 X94.379 Y176.35 E.01939
G1 X96.478 Y178.449 E.09849
G1 X96.478 Y179.034 E.01939
G1 X94.379 Y176.935 E.09849
G1 X94.379 Y177.519 E.01939
G1 X96.478 Y179.619 E.09849
G1 X96.478 Y180.203 E.01939
G1 X94.379 Y178.104 E.09849
G1 X94.379 Y178.688 E.01939
G1 X96.478 Y180.788 E.09849
G1 X96.478 Y180.913 E.00414
G1 X96.018 Y180.913 E.01526
G1 X94.379 Y179.273 E.07692
G1 X94.379 Y179.858 E.01939
G1 X95.434 Y180.913 E.04949
G1 X94.849 Y180.913 E.01939
G1 X94.196 Y180.259 E.03066
; WIPE_START
G1 X94.849 Y180.913 E-.35123
G1 X95.434 Y180.913 E-.22216
G1 X95.087 Y180.566 E-.18661
; WIPE_END
G1 E-.04 F1800
G1 X96.661 Y186.454 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F7800
G1 X96.021 Y185.813 E.03006
G1 X95.444 Y185.813 E.01912
G1 X96.478 Y186.847 E.0485
G1 X96.478 Y187.424 E.01912
G1 X94.868 Y185.813 E.07554
G1 X94.379 Y185.813 E.01623
G1 X94.379 Y185.9 E.00289
G1 X96.478 Y188 E.09849
G1 X96.478 Y188.576 E.01912
G1 X94.379 Y186.477 E.09849
G1 X94.379 Y187.053 E.01912
G1 X96.478 Y189.153 E.09849
G1 X96.478 Y189.729 E.01912
G1 X94.379 Y187.629 E.09849
G1 X94.379 Y188.206 E.01912
G1 X96.478 Y190.305 E.09849
G1 X96.478 Y190.882 E.01912
G1 X94.379 Y188.782 E.09849
G1 X94.379 Y189.359 E.01912
G1 X96.478 Y191.458 E.09849
G1 X96.478 Y192.034 E.01912
G1 X94.379 Y189.935 E.09849
G1 X94.379 Y190.511 E.01912
G1 X96.478 Y192.611 E.09849
G1 X96.478 Y193.187 E.01912
G1 X94.379 Y191.088 E.09849
G1 X94.379 Y191.664 E.01912
G1 X96.478 Y193.764 E.09849
G1 X96.478 Y194.34 E.01912
G1 X94.379 Y192.24 E.09849
G1 X94.379 Y192.817 E.01912
G1 X96.478 Y194.916 E.09849
G1 X96.478 Y195.493 E.01912
G1 X94.379 Y193.393 E.09849
G1 X94.379 Y193.969 E.01912
G1 X96.478 Y196.069 E.09849
G1 X96.478 Y196.645 E.01912
G1 X94.379 Y194.546 E.09849
G1 X94.379 Y195.122 E.01912
G1 X96.478 Y197.222 E.09849
G1 X96.478 Y197.798 E.01912
G1 X94.379 Y195.699 E.09849
G1 X94.379 Y196.275 E.01912
G1 X96.478 Y198.374 E.09849
G1 X96.478 Y198.951 E.01912
G1 X94.379 Y196.851 E.09849
G1 X94.379 Y197.428 E.01912
G1 X96.478 Y199.527 E.09849
G1 X96.478 Y200.104 E.01912
G1 X94.379 Y198.004 E.09849
G1 X94.379 Y198.58 E.01912
G1 X96.478 Y200.68 E.09849
G1 X96.478 Y201.256 E.01912
G1 X94.379 Y199.157 E.09849
G1 X94.379 Y199.733 E.01912
G1 X96.478 Y201.833 E.09849
G1 X96.478 Y202.409 E.01912
G1 X94.379 Y200.309 E.09849
G1 X94.379 Y200.886 E.01912
G1 X96.478 Y202.985 E.09849
G1 X96.478 Y203.562 E.01912
G1 X94.379 Y201.462 E.09849
G1 X94.379 Y202.039 E.01912
G1 X96.478 Y204.138 E.09849
G1 X96.478 Y204.714 E.01912
G1 X94.379 Y202.615 E.09849
G1 X94.379 Y203.191 E.01912
G1 X96.478 Y205.291 E.09849
G1 X96.478 Y205.867 E.01912
G1 X94.379 Y203.768 E.09849
G1 X94.379 Y204.344 E.01912
G1 X96.478 Y206.444 E.09849
G1 X96.478 Y207.02 E.01912
G1 X94.379 Y204.92 E.09849
G1 X94.379 Y205.497 E.01912
G1 X96.478 Y207.596 E.09849
G1 X96.478 Y208.173 E.01912
G1 X94.379 Y206.073 E.09849
G1 X94.379 Y206.649 E.01912
G1 X96.478 Y208.749 E.09849
G1 X96.478 Y208.799 E.00166
G1 X96.275 Y208.799 E.00675
G1 X96.275 Y209.122 E.01071
G1 X94.379 Y207.226 E.08895
M73 P66 R6
G1 X94.379 Y207.802 E.01912
G1 X95.989 Y209.413 E.07556
G1 X95.413 Y209.413 E.01912
G1 X94.379 Y208.379 E.04852
G1 X94.379 Y208.955 E.01912
G1 X95.02 Y209.596 E.03008
; WIPE_START
G1 X94.379 Y208.955 E-.34454
G1 X94.379 Y208.379 E-.21902
G1 X94.744 Y208.744 E-.19644
; WIPE_END
G1 E-.04 F1800
G1 X101.227 Y204.716 Z1.4 F15000
G1 X178.369 Y156.78 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X179.011 Y157.422 E.02789
G1 X179.011 Y157.955
G1 X177.836 Y156.78 E.05106
G1 X177.303 Y156.78
G1 X179.011 Y158.489 E.07423
G1 X179.011 Y159.022
G1 X176.77 Y156.78 E.0974
G1 X176.236 Y156.78
G1 X177.402 Y157.946 E.05063
G1 X176.868 Y157.946
G1 X175.703 Y156.78 E.05063
G1 X175.17 Y156.78
G1 X176.335 Y157.946 E.05063
G1 X175.802 Y157.946
G1 X174.637 Y156.78 E.05063
G1 X174.103 Y156.78
G1 X175.269 Y157.946 E.05063
G1 X174.735 Y157.946
G1 X173.57 Y156.78 E.05063
G1 X173.037 Y156.78
G1 X174.202 Y157.946 E.05063
G1 X173.669 Y157.946
G1 X172.504 Y156.78 E.05063
G1 X171.97 Y156.78
G1 X173.136 Y157.946 E.05063
G1 X172.602 Y157.946
G1 X171.437 Y156.78 E.05063
G1 X170.904 Y156.78
G1 X172.069 Y157.946 E.05063
G1 X171.536 Y157.946
G1 X170.371 Y156.78 E.05063
G1 X169.88 Y156.824
G1 X171.003 Y157.946 E.04876
G1 X170.469 Y157.946
G1 X169.88 Y157.357 E.02559
; WIPE_START
M204 S5000
G1 X170.469 Y157.946 E-.31646
G1 X171.003 Y157.946 E-.20264
G1 X170.554 Y157.497 E-.2409
; WIPE_END
G1 E-.04 F1800
G1 X177.846 Y158.39 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X179.011 Y159.555 E.05063
G1 X179.011 Y160.088
G1 X177.846 Y158.923 E.05063
G1 X177.846 Y159.456
G1 X179.011 Y160.622 E.05063
G1 X179.011 Y161.155
G1 X177.846 Y159.99 E.05063
G1 X177.846 Y160.523
G1 X179.011 Y161.688 E.05063
G1 X179.011 Y162.221
G1 X177.846 Y161.056 E.05063
G1 X177.846 Y161.589
G1 X179.011 Y162.755 E.05063
G1 X179.011 Y163.288
G1 X177.846 Y162.123 E.05063
G1 X177.846 Y162.656
G1 X179.011 Y163.821 E.05063
G1 X179.011 Y164.354
G1 X177.846 Y163.189 E.05063
G1 X177.846 Y163.723
G1 X179.011 Y164.888 E.05063
G1 X179.011 Y165.421
G1 X177.846 Y164.256 E.05063
G1 X177.846 Y164.789
G1 X179.011 Y165.954 E.05063
G1 X179.011 Y166.488
G1 X177.846 Y165.322 E.05063
G1 X177.846 Y165.856
G1 X179.011 Y167.021 E.05063
G1 X179.011 Y167.554
G1 X177.846 Y166.389 E.05063
G1 X177.846 Y166.922
G1 X179.011 Y168.087 E.05063
G1 X179.011 Y168.621
G1 X177.846 Y167.455 E.05063
G1 X177.846 Y167.989
G1 X179.011 Y169.154 E.05063
G1 X179.011 Y169.687
G1 X177.846 Y168.522 E.05063
G1 X177.846 Y169.055
G1 X179.011 Y170.22 E.05063
G1 X179.011 Y170.754
G1 X177.846 Y169.588 E.05063
G1 X177.846 Y170.122
G1 X179.011 Y171.287 E.05063
G1 X179.011 Y171.82
G1 X177.846 Y170.655 E.05063
G1 X177.846 Y171.188
G1 X179.011 Y172.353 E.05063
G1 X179.011 Y172.887
G1 X177.846 Y171.721 E.05063
G1 X177.846 Y172.255
G1 X179.011 Y173.42 E.05063
G1 X179.011 Y173.953
G1 X177.846 Y172.788 E.05063
G1 X177.846 Y173.321
G1 X179.011 Y174.486 E.05063
G1 X179.011 Y175.02
G1 X177.846 Y173.854 E.05063
G1 X177.846 Y174.388
G1 X179.011 Y175.553 E.05063
G1 X179.011 Y176.086
G1 X177.846 Y174.921 E.05063
G1 X177.846 Y175.454
G1 X179.011 Y176.619 E.05063
G1 X179.011 Y177.153
G1 X177.846 Y175.987 E.05063
G1 X177.846 Y176.521
G1 X179.011 Y177.686 E.05063
G1 X179.011 Y178.219
G1 X177.846 Y177.054 E.05063
G1 X177.846 Y177.587
G1 X179.011 Y178.752 E.05063
G1 X179.011 Y179.286
G1 X177.846 Y178.12 E.05063
G1 X177.846 Y178.654
G1 X179.011 Y179.819 E.05063
G1 X179.011 Y180.352
G1 X177.846 Y179.187 E.05063
G1 X177.846 Y179.72
G1 X179.011 Y180.885 E.05063
G1 X179.011 Y181.419
G1 X177.846 Y180.254 E.05063
G1 X177.846 Y180.787
G1 X179.011 Y181.952 E.05063
G1 X179.011 Y182.485
G1 X177.846 Y181.32 E.05063
G1 X177.846 Y181.853
G1 X179.011 Y183.019 E.05063
G1 X179.011 Y183.552
G1 X177.846 Y182.387 E.05063
G1 X177.846 Y182.92
G1 X179.011 Y184.085 E.05063
G1 X179.011 Y184.618
G1 X177.846 Y183.453 E.05063
G1 X177.846 Y183.986
G1 X179.011 Y185.152 E.05063
G1 X179.011 Y185.685
G1 X177.846 Y184.52 E.05063
G1 X177.846 Y185.053
G1 X179.011 Y186.218 E.05063
G1 X179.011 Y186.751
G1 X177.846 Y185.586 E.05063
G1 X177.846 Y186.119
G1 X179.011 Y187.285 E.05063
G1 X179.011 Y187.818
G1 X177.846 Y186.653 E.05063
G1 X177.846 Y187.186
G1 X179.011 Y188.351 E.05063
G1 X179.011 Y188.884
G1 X177.846 Y187.719 E.05063
G1 X177.846 Y188.252
G1 X179.011 Y189.418 E.05063
G1 X179.011 Y189.951
G1 X177.846 Y188.786 E.05063
G1 X177.846 Y189.319
G1 X179.011 Y190.484 E.05063
G1 X179.011 Y191.017
G1 X177.846 Y189.852 E.05063
G1 X177.846 Y190.385
G1 X179.011 Y191.551 E.05063
G1 X179.011 Y192.084
G1 X177.846 Y190.919 E.05063
G1 X177.846 Y191.452
G1 X179.011 Y192.617 E.05063
G1 X179.011 Y193.15
G1 X177.846 Y191.985 E.05063
G1 X177.846 Y192.518
G1 X179.011 Y193.684 E.05063
G1 X179.011 Y194.217
G1 X177.846 Y193.052 E.05063
G1 X177.846 Y193.585
G1 X179.011 Y194.75 E.05063
G1 X179.011 Y195.283
G1 X177.846 Y194.118 E.05063
G1 X177.846 Y194.651
G1 X179.011 Y195.817 E.05063
G1 X179.011 Y196.35
G1 X177.846 Y195.185 E.05063
G1 X177.846 Y195.718
G1 X179.011 Y196.883 E.05063
G1 X179.011 Y197.416
G1 X177.846 Y196.251 E.05063
G1 X177.846 Y196.784
G1 X179.011 Y197.95 E.05063
G1 X179.011 Y198.483
G1 X177.846 Y197.318 E.05063
G1 X177.846 Y197.851
G1 X179.011 Y199.016 E.05063
G1 X179.011 Y199.549
G1 X177.846 Y198.384 E.05063
G1 X177.846 Y198.918
G1 X179.011 Y200.083 E.05063
G1 X179.011 Y200.616
G1 X177.846 Y199.451 E.05063
G1 X177.846 Y199.984
G1 X179.011 Y201.149 E.05063
G1 X179.011 Y201.683
G1 X177.846 Y200.517 E.05063
G1 X177.846 Y201.051
G1 X179.011 Y202.216 E.05063
G1 X179.011 Y202.749
G1 X177.846 Y201.584 E.05063
G1 X177.846 Y202.117
G1 X179.011 Y203.282 E.05063
G1 X179.011 Y203.816
G1 X177.846 Y202.65 E.05063
G1 X177.846 Y203.184
G1 X179.011 Y204.349 E.05063
G1 X179.011 Y204.882
G1 X177.846 Y203.717 E.05063
G1 X177.846 Y204.25
G1 X179.011 Y205.415 E.05063
G1 X179.011 Y205.949
G1 X177.846 Y204.783 E.05063
G1 X177.846 Y205.317
G1 X179.011 Y206.482 E.05063
G1 X179.011 Y207.015
G1 X177.846 Y205.85 E.05063
G1 X177.846 Y206.383
G1 X179.011 Y207.548 E.05063
G1 X179.011 Y208.082
G1 X177.846 Y206.916 E.05063
G1 X177.846 Y207.45
G1 X179.011 Y208.615 E.05063
G1 X179.011 Y209.148
G1 X177.846 Y207.983 E.05063
G1 X177.846 Y208.516
G1 X179.011 Y209.681 E.05063
G1 X178.742 Y209.946
G1 X177.577 Y208.78 E.05063
G1 X177.044 Y208.78
G1 X178.209 Y209.946 E.05063
G1 X177.676 Y209.946
G1 X176.51 Y208.78 E.05063
G1 X175.977 Y208.78
G1 X177.142 Y209.946 E.05063
G1 X176.609 Y209.946
G1 X175.444 Y208.78 E.05063
M73 P67 R6
G1 X174.911 Y208.78
G1 X176.076 Y209.946 E.05063
G1 X175.543 Y209.946
G1 X174.377 Y208.78 E.05063
G1 X173.844 Y208.78
G1 X175.009 Y209.946 E.05063
G1 X174.476 Y209.946
G1 X173.311 Y208.78 E.05063
G1 X172.778 Y208.78
G1 X173.943 Y209.946 E.05063
G1 X173.41 Y209.946
G1 X172.244 Y208.78 E.05063
G1 X171.711 Y208.78
G1 X172.876 Y209.946 E.05063
G1 X172.343 Y209.946
G1 X171.178 Y208.78 E.05063
G1 X170.645 Y208.78
G1 X171.81 Y209.946 E.05063
G1 X171.277 Y209.946
G1 X170.111 Y208.78 E.05063
G1 X169.88 Y209.083
G1 X170.743 Y209.946 E.0375
; OBJECT_ID: 118
; WIPE_START
M204 S5000
G1 X169.88 Y209.083 E-.46372
G1 X170.111 Y208.78 E-.14457
G1 X170.394 Y209.063 E-.15171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 118
M624 AgAAAAAAAAA=
G1 X170.787 Y201.44 Z1.4 F15000
G1 X179.08 Y40.897 Z1.4
M73 P67 R5
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X179.08 Y43.693 E.09274
G1 X155.58 Y43.693 E.77954
G1 X155.58 Y116.525 E2.41595
G1 X154.784 Y116.525 E.0264
G1 X154.784 Y40.897 E2.5087
G1 X179.02 Y40.897 E.80395
; WIPE_START
G1 X179.063 Y42.897 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X186.693 Y43.116 Z1.4 F15000
G1 X206.784 Y43.693 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8843.478
G1 X183.284 Y43.693 E.77954
G1 X183.284 Y40.897 E.09274
G1 X207.58 Y40.897 E.80594
G1 X207.58 Y116.525 E2.5087
G1 X206.784 Y116.525 E.0264
G1 X206.784 Y43.753 E2.41396
M204 S250
G1 X206.392 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X182.892 Y44.085 E.72209
G1 X182.892 Y40.505 E.11
G1 X207.972 Y40.505 E.77064
G1 X207.972 Y126.085 E2.62964
G1 X154.392 Y126.085 E1.64636
G1 X154.392 Y40.505 E2.62964
G1 X179.472 Y40.505 E.77064
G1 X179.472 Y44.085 E.11
G1 X155.972 Y44.085 E.72209
G1 X155.972 Y124.505 E2.47108
G1 X206.392 Y124.505 E1.54927
G1 X206.392 Y44.145 E2.46924
; WIPE_START
M204 S5000
G1 X204.392 Y44.14 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.182 Y43.49 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X207.182 Y116.321 E2.30746
; WIPE_START
G1 X207.182 Y114.321 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.765 Y117.61 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X206.902 Y116.747 E.0375
G1 X206.6 Y116.978
G1 X207.765 Y118.144 E.05063
G1 X207.765 Y118.677
G1 X206.6 Y117.512 E.05063
G1 X206.6 Y118.045
G1 X207.765 Y119.21 E.05063
G1 X207.765 Y119.743
G1 X206.6 Y118.578 E.05063
G1 X206.6 Y119.111
G1 X207.765 Y120.277 E.05063
G1 X207.765 Y120.81
G1 X206.6 Y119.645 E.05063
G1 X206.6 Y120.178
G1 X207.765 Y121.343 E.05063
G1 X207.765 Y121.876
G1 X206.6 Y120.711 E.05063
G1 X206.6 Y121.244
G1 X207.765 Y122.41 E.05063
G1 X207.765 Y122.943
G1 X206.6 Y121.778 E.05063
G1 X206.6 Y122.311
G1 X207.765 Y123.476 E.05063
G1 X207.765 Y124.009
G1 X206.6 Y122.844 E.05063
G1 X206.6 Y123.377
G1 X207.765 Y124.543 E.05063
G1 X207.765 Y125.076
G1 X206.6 Y123.911 E.05063
G1 X206.6 Y124.444
G1 X207.765 Y125.609 E.05063
G1 X207.501 Y125.878
G1 X206.335 Y124.713 E.05063
G1 X205.802 Y124.713
M73 P68 R5
G1 X206.967 Y125.878 E.05063
G1 X206.434 Y125.878
G1 X205.269 Y124.713 E.05063
G1 X204.736 Y124.713
G1 X205.901 Y125.878 E.05063
G1 X205.368 Y125.878
G1 X204.202 Y124.713 E.05063
G1 X203.669 Y124.713
G1 X204.834 Y125.878 E.05063
G1 X204.301 Y125.878
G1 X203.136 Y124.713 E.05063
G1 X202.603 Y124.713
G1 X203.768 Y125.878 E.05063
G1 X203.235 Y125.878
G1 X202.069 Y124.713 E.05063
G1 X201.536 Y124.713
G1 X202.701 Y125.878 E.05063
G1 X202.168 Y125.878
G1 X201.003 Y124.713 E.05063
G1 X200.47 Y124.713
G1 X201.635 Y125.878 E.05063
G1 X201.101 Y125.878
G1 X199.936 Y124.713 E.05063
G1 X199.403 Y124.713
G1 X200.568 Y125.878 E.05063
G1 X200.035 Y125.878
G1 X198.87 Y124.713 E.05063
G1 X198.336 Y124.713
G1 X199.502 Y125.878 E.05063
G1 X198.968 Y125.878
G1 X197.803 Y124.713 E.05063
G1 X197.27 Y124.713
G1 X198.435 Y125.878 E.05063
G1 X197.902 Y125.878
G1 X196.737 Y124.713 E.05063
G1 X196.203 Y124.713
G1 X197.369 Y125.878 E.05063
G1 X196.835 Y125.878
G1 X195.67 Y124.713 E.05063
G1 X195.137 Y124.713
G1 X196.302 Y125.878 E.05063
G1 X195.769 Y125.878
G1 X194.604 Y124.713 E.05063
G1 X194.07 Y124.713
G1 X195.236 Y125.878 E.05063
G1 X194.702 Y125.878
G1 X193.537 Y124.713 E.05063
G1 X193.004 Y124.713
G1 X194.169 Y125.878 E.05063
G1 X193.636 Y125.878
G1 X192.471 Y124.713 E.05063
G1 X191.937 Y124.713
G1 X193.103 Y125.878 E.05063
G1 X192.569 Y125.878
G1 X191.404 Y124.713 E.05063
G1 X190.871 Y124.713
G1 X192.036 Y125.878 E.05063
G1 X191.503 Y125.878
G1 X190.338 Y124.713 E.05063
G1 X189.804 Y124.713
G1 X190.97 Y125.878 E.05063
G1 X190.436 Y125.878
G1 X189.271 Y124.713 E.05063
G1 X188.738 Y124.713
G1 X189.903 Y125.878 E.05063
G1 X189.37 Y125.878
G1 X188.205 Y124.713 E.05063
G1 X187.671 Y124.713
G1 X188.837 Y125.878 E.05063
G1 X188.303 Y125.878
G1 X187.138 Y124.713 E.05063
G1 X186.605 Y124.713
G1 X187.77 Y125.878 E.05063
G1 X187.237 Y125.878
G1 X186.072 Y124.713 E.05063
G1 X185.538 Y124.713
G1 X186.704 Y125.878 E.05063
G1 X186.17 Y125.878
G1 X185.005 Y124.713 E.05063
G1 X184.472 Y124.713
G1 X185.637 Y125.878 E.05063
G1 X185.104 Y125.878
G1 X183.939 Y124.713 E.05063
G1 X183.405 Y124.713
G1 X184.57 Y125.878 E.05063
G1 X184.037 Y125.878
G1 X182.872 Y124.713 E.05063
G1 X182.339 Y124.713
G1 X183.504 Y125.878 E.05063
G1 X182.971 Y125.878
G1 X181.805 Y124.713 E.05063
G1 X181.272 Y124.713
G1 X182.437 Y125.878 E.05063
G1 X181.904 Y125.878
G1 X180.739 Y124.713 E.05063
G1 X180.206 Y124.713
G1 X181.371 Y125.878 E.05063
G1 X180.838 Y125.878
G1 X179.672 Y124.713 E.05063
G1 X179.139 Y124.713
G1 X180.304 Y125.878 E.05063
G1 X179.771 Y125.878
G1 X178.606 Y124.713 E.05063
G1 X178.073 Y124.713
G1 X179.238 Y125.878 E.05063
G1 X178.705 Y125.878
G1 X177.539 Y124.713 E.05063
G1 X177.006 Y124.713
G1 X178.171 Y125.878 E.05063
G1 X177.638 Y125.878
G1 X176.473 Y124.713 E.05063
G1 X175.94 Y124.713
G1 X177.105 Y125.878 E.05063
G1 X176.572 Y125.878
G1 X175.406 Y124.713 E.05063
G1 X174.873 Y124.713
G1 X176.038 Y125.878 E.05063
G1 X175.505 Y125.878
G1 X174.34 Y124.713 E.05063
G1 X173.807 Y124.713
G1 X174.972 Y125.878 E.05063
G1 X174.439 Y125.878
G1 X173.273 Y124.713 E.05063
G1 X172.74 Y124.713
G1 X173.905 Y125.878 E.05063
G1 X173.372 Y125.878
G1 X172.207 Y124.713 E.05063
G1 X171.674 Y124.713
G1 X172.839 Y125.878 E.05063
G1 X172.306 Y125.878
G1 X171.14 Y124.713 E.05063
G1 X170.607 Y124.713
G1 X171.772 Y125.878 E.05063
G1 X171.239 Y125.878
G1 X170.074 Y124.713 E.05063
G1 X169.541 Y124.713
G1 X170.706 Y125.878 E.05063
G1 X170.173 Y125.878
G1 X169.007 Y124.713 E.05063
G1 X168.474 Y124.713
G1 X169.639 Y125.878 E.05063
G1 X169.106 Y125.878
G1 X167.941 Y124.713 E.05063
G1 X167.408 Y124.713
G1 X168.573 Y125.878 E.05063
G1 X168.04 Y125.878
G1 X166.874 Y124.713 E.05063
G1 X166.341 Y124.713
G1 X167.506 Y125.878 E.05063
G1 X166.973 Y125.878
G1 X165.808 Y124.713 E.05063
G1 X165.275 Y124.713
G1 X166.44 Y125.878 E.05063
G1 X165.906 Y125.878
G1 X164.741 Y124.713 E.05063
G1 X164.208 Y124.713
G1 X165.373 Y125.878 E.05063
G1 X164.84 Y125.878
G1 X163.675 Y124.713 E.05063
G1 X163.141 Y124.713
G1 X164.307 Y125.878 E.05063
G1 X163.773 Y125.878
G1 X162.608 Y124.713 E.05063
G1 X162.075 Y124.713
G1 X163.24 Y125.878 E.05063
G1 X162.707 Y125.878
G1 X161.542 Y124.713 E.05063
G1 X161.008 Y124.713
G1 X162.174 Y125.878 E.05063
G1 X161.64 Y125.878
G1 X160.475 Y124.713 E.05063
G1 X159.942 Y124.713
G1 X161.107 Y125.878 E.05063
G1 X160.574 Y125.878
G1 X159.409 Y124.713 E.05063
G1 X158.875 Y124.713
G1 X160.041 Y125.878 E.05063
G1 X159.507 Y125.878
G1 X158.342 Y124.713 E.05063
G1 X157.809 Y124.713
G1 X158.974 Y125.878 E.05063
G1 X158.441 Y125.878
G1 X157.276 Y124.713 E.05063
M73 P69 R5
G1 X156.742 Y124.713
G1 X157.908 Y125.878 E.05063
G1 X157.374 Y125.878
G1 X156.209 Y124.713 E.05063
; WIPE_START
M204 S5000
G1 X157.374 Y125.878 E-.6262
G1 X157.726 Y125.878 E-.13381
; WIPE_END
G1 E-.04 F1800
G1 X156.018 Y118.439 Z1.4 F15000
G1 X155.765 Y117.336 Z1.4
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X155.176 Y116.747 E.0256
G1 X154.643 Y116.747
G1 X155.765 Y117.87 E.04877
G1 X155.765 Y118.403
G1 X154.6 Y117.238 E.05063
G1 X154.6 Y117.771
G1 X155.765 Y118.936 E.05063
G1 X155.765 Y119.469
G1 X154.6 Y118.304 E.05063
G1 X154.6 Y118.837
G1 X155.765 Y120.003 E.05063
G1 X155.765 Y120.536
G1 X154.6 Y119.371 E.05063
G1 X154.6 Y119.904
G1 X155.765 Y121.069 E.05063
G1 X155.765 Y121.602
G1 X154.6 Y120.437 E.05063
G1 X154.6 Y120.97
G1 X155.765 Y122.136 E.05063
G1 X155.765 Y122.669
G1 X154.6 Y121.504 E.05063
G1 X154.6 Y122.037
G1 X155.765 Y123.202 E.05063
G1 X155.765 Y123.735
G1 X154.6 Y122.57 E.05063
G1 X154.6 Y123.103
G1 X155.765 Y124.269 E.05063
; WIPE_START
M204 S5000
G1 X154.6 Y123.103 E-.6262
G1 X154.6 Y122.751 E-.13381
; WIPE_END
G1 E-.04 F1800
G1 X154.6 Y123.637 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X156.841 Y125.878 E.0974
G1 X156.308 Y125.878
G1 X154.6 Y124.17 E.07423
G1 X154.6 Y124.703
G1 X155.775 Y125.878 E.05105
G1 X155.241 Y125.878
G1 X154.6 Y125.236 E.02788
; WIPE_START
M204 S5000
G1 X155.241 Y125.878 E-.34479
G1 X155.775 Y125.878 E-.20264
G1 X155.379 Y125.482 E-.21257
; WIPE_END
G1 E-.04 F1800
G1 X155.215 Y117.852 Z1.4 F15000
G1 X155.182 Y116.321 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.182 Y43.49 E2.30746
G1 X154.949 Y42.488 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X155.806 Y43.345 E.0402
G1 X156.391 Y43.345 E.01939
G1 X155.133 Y42.087 E.05904
G1 X155.133 Y41.502 E.01939
G1 X156.976 Y43.345 E.08647
G1 X157.56 Y43.345 E.01939
G1 X155.461 Y41.246 E.09849
G1 X156.045 Y41.246 E.01939
G1 X158.145 Y43.345 E.09849
G1 X158.73 Y43.345 E.01939
G1 X156.63 Y41.246 E.09849
G1 X157.215 Y41.246 E.01939
G1 X159.314 Y43.345 E.09849
G1 X159.899 Y43.345 E.01939
G1 X157.799 Y41.246 E.09849
G1 X158.384 Y41.246 E.01939
G1 X160.484 Y43.345 E.09849
G1 X161.068 Y43.345 E.01939
G1 X158.969 Y41.246 E.09849
G1 X159.553 Y41.246 E.01939
G1 X161.653 Y43.345 E.09849
G1 X162.238 Y43.345 E.01939
G1 X160.138 Y41.246 E.09849
G1 X160.723 Y41.246 E.01939
G1 X162.822 Y43.345 E.09849
G1 X163.407 Y43.345 E.01939
G1 X161.307 Y41.246 E.09849
G1 X161.892 Y41.246 E.01939
G1 X163.992 Y43.345 E.09849
G1 X164.576 Y43.345 E.01939
G1 X162.477 Y41.246 E.09849
G1 X163.061 Y41.246 E.01939
G1 X165.161 Y43.345 E.09849
G1 X165.745 Y43.345 E.01939
G1 X163.646 Y41.246 E.09849
G1 X164.231 Y41.246 E.01939
G1 X166.33 Y43.345 E.09849
G1 X166.915 Y43.345 E.01939
G1 X164.815 Y41.246 E.09849
G1 X165.4 Y41.246 E.01939
G1 X167.499 Y43.345 E.09849
G1 X168.084 Y43.345 E.01939
G1 X165.985 Y41.246 E.09849
G1 X166.569 Y41.246 E.01939
G1 X168.669 Y43.345 E.09849
G1 X169.253 Y43.345 E.01939
G1 X167.154 Y41.246 E.09849
G1 X167.738 Y41.246 E.01939
G1 X169.838 Y43.345 E.09849
G1 X170.423 Y43.345 E.01939
G1 X168.323 Y41.246 E.09849
G1 X168.908 Y41.246 E.01939
G1 X171.007 Y43.345 E.09849
G1 X171.592 Y43.345 E.01939
G1 X169.492 Y41.246 E.09849
G1 X170.077 Y41.246 E.01939
G1 X172.177 Y43.345 E.09849
G1 X172.761 Y43.345 E.01939
G1 X170.662 Y41.246 E.09849
G1 X171.246 Y41.246 E.01939
G1 X173.346 Y43.345 E.09849
G1 X173.931 Y43.345 E.01939
G1 X171.831 Y41.246 E.09849
G1 X172.416 Y41.246 E.01939
G1 X174.515 Y43.345 E.09849
G1 X175.1 Y43.345 E.01939
G1 X173 Y41.246 E.09849
G1 X173.585 Y41.246 E.01939
G1 X175.685 Y43.345 E.09849
G1 X176.269 Y43.345 E.01939
G1 X174.17 Y41.246 E.09849
G1 X174.754 Y41.246 E.01939
G1 X176.854 Y43.345 E.09849
G1 X177.438 Y43.345 E.01939
G1 X175.339 Y41.246 E.09849
G1 X175.924 Y41.246 E.01939
G1 X178.023 Y43.345 E.09849
G1 X178.608 Y43.345 E.01939
G1 X176.508 Y41.246 E.09849
G1 X177.093 Y41.246 E.01939
G1 X178.732 Y42.885 E.0769
G1 X178.732 Y42.3 E.01939
G1 X177.678 Y41.246 E.04947
G1 X178.262 Y41.246 E.01939
G1 X178.915 Y41.899 E.03064
; WIPE_START
G1 X178.262 Y41.246 E-.351
G1 X177.678 Y41.246 E-.22217
G1 X178.025 Y41.593 E-.18683
; WIPE_END
G1 E-.04 F1800
G1 X184.274 Y43.528 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F7800
G1 X183.633 Y42.887 E.03008
G1 X183.633 Y42.311 E.01912
G1 X184.667 Y43.345 E.04852
G1 X185.243 Y43.345 E.01912
G1 X183.633 Y41.734 E.07556
G1 X183.633 Y41.246 E.01622
G1 X183.72 Y41.246 E.0029
G1 X185.82 Y43.345 E.09849
G1 X186.396 Y43.345 E.01912
G1 X184.296 Y41.246 E.09849
G1 X184.873 Y41.246 E.01912
G1 X186.972 Y43.345 E.09849
G1 X187.549 Y43.345 E.01912
G1 X185.449 Y41.246 E.09849
G1 X186.026 Y41.246 E.01912
G1 X188.125 Y43.345 E.09849
G1 X188.701 Y43.345 E.01912
G1 X186.602 Y41.246 E.09849
G1 X187.178 Y41.246 E.01912
G1 X189.278 Y43.345 E.09849
G1 X189.854 Y43.345 E.01912
G1 X187.755 Y41.246 E.09849
G1 X188.331 Y41.246 E.01912
G1 X190.431 Y43.345 E.09849
G1 X191.007 Y43.345 E.01912
G1 X188.907 Y41.246 E.09849
G1 X189.484 Y41.246 E.01912
G1 X191.583 Y43.345 E.09849
G1 X192.16 Y43.345 E.01912
G1 X190.06 Y41.246 E.09849
G1 X190.636 Y41.246 E.01912
G1 X192.736 Y43.345 E.09849
G1 X193.312 Y43.345 E.01912
G1 X191.213 Y41.246 E.09849
G1 X191.789 Y41.246 E.01912
G1 X193.889 Y43.345 E.09849
G1 X194.465 Y43.345 E.01912
G1 X192.366 Y41.246 E.09849
G1 X192.942 Y41.246 E.01912
G1 X195.041 Y43.345 E.09849
G1 X195.618 Y43.345 E.01912
G1 X193.518 Y41.246 E.09849
G1 X194.095 Y41.246 E.01912
G1 X196.194 Y43.345 E.09849
G1 X196.771 Y43.345 E.01912
G1 X194.671 Y41.246 E.09849
G1 X195.247 Y41.246 E.01912
G1 X197.347 Y43.345 E.09849
G1 X197.923 Y43.345 E.01912
G1 X195.824 Y41.246 E.09849
G1 X196.4 Y41.246 E.01912
G1 X198.5 Y43.345 E.09849
G1 X199.076 Y43.345 E.01912
G1 X196.976 Y41.246 E.09849
G1 X197.553 Y41.246 E.01912
G1 X199.652 Y43.345 E.09849
G1 X200.229 Y43.345 E.01912
G1 X198.129 Y41.246 E.09849
G1 X198.706 Y41.246 E.01912
G1 X200.805 Y43.345 E.09849
G1 X201.381 Y43.345 E.01912
G1 X199.282 Y41.246 E.09849
G1 X199.858 Y41.246 E.01912
G1 X201.958 Y43.345 E.09849
G1 X202.534 Y43.345 E.01912
G1 X200.435 Y41.246 E.09849
G1 X201.011 Y41.246 E.01912
G1 X203.111 Y43.345 E.09849
G1 X203.687 Y43.345 E.01912
G1 X201.587 Y41.246 E.09849
G1 X202.164 Y41.246 E.01912
G1 X204.263 Y43.345 E.09849
G1 X204.84 Y43.345 E.01912
G1 X202.74 Y41.246 E.09849
G1 X203.316 Y41.246 E.01912
G1 X205.416 Y43.345 E.09849
G1 X205.992 Y43.345 E.01912
G1 X203.893 Y41.246 E.09849
G1 X204.469 Y41.246 E.01912
G1 X206.569 Y43.345 E.09849
G1 X206.618 Y43.345 E.00164
G1 X206.618 Y43.142 E.00675
G1 X206.942 Y43.142 E.01073
G1 X205.046 Y41.246 E.08895
G1 X205.622 Y41.246 E.01912
G1 X207.232 Y42.856 E.07554
G1 X207.232 Y42.279 E.01912
G1 X206.198 Y41.246 E.0485
G1 X206.775 Y41.246 E.01912
G1 X207.415 Y41.886 E.03006
; OBJECT_ID: 140
; WIPE_START
G1 X206.775 Y41.246 E-.34432
G1 X206.198 Y41.246 E-.21902
G1 X206.564 Y41.612 E-.19666
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 118
M625
; start printing object, unique label id: 140
M624 BAAAAAAAAAA=
G1 X198.932 Y41.553 Z1.4 F15000
G1 X96.642 Y40.773 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X96.642 Y43.569 E.09274
G1 X73.142 Y43.569 E.77954
G1 X73.142 Y116.401 E2.41595
G1 X72.346 Y116.401 E.0264
G1 X72.346 Y40.773 E2.5087
G1 X96.582 Y40.773 E.80395
; WIPE_START
G1 X96.624 Y42.773 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.254 Y42.992 Z1.4 F15000
G1 X124.346 Y43.569 Z1.4
G1 Z1
G1 E.8 F1800
G1 F8843.478
G1 X100.846 Y43.569 E.77954
G1 X100.846 Y40.773 E.09274
G1 X125.142 Y40.773 E.80594
G1 X125.142 Y116.401 E2.5087
G1 X124.346 Y116.401 E.0264
G1 X124.346 Y43.629 E2.41396
M204 S250
G1 X123.954 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X100.454 Y43.961 E.72209
G1 X100.454 Y40.381 E.11
G1 X125.534 Y40.381 E.77064
G1 X125.534 Y125.961 E2.62964
G1 X71.954 Y125.961 E1.64636
G1 X71.954 Y40.381 E2.62964
G1 X97.034 Y40.381 E.77064
G1 X97.034 Y43.961 E.11
G1 X73.534 Y43.961 E.72209
G1 X73.534 Y124.381 E2.47108
G1 X123.954 Y124.381 E1.54927
G1 X123.954 Y44.021 E2.46924
; WIPE_START
M204 S5000
G1 X121.954 Y44.016 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.744 Y43.366 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X124.744 Y116.197 E2.30746
; WIPE_START
G1 X124.744 Y114.197 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.326 Y117.486 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X124.463 Y116.623 E.0375
M73 P70 R5
G1 X124.161 Y116.854
G1 X125.326 Y118.02 E.05063
G1 X125.326 Y118.553
G1 X124.161 Y117.388 E.05063
G1 X124.161 Y117.921
G1 X125.326 Y119.086 E.05063
G1 X125.326 Y119.619
G1 X124.161 Y118.454 E.05063
G1 X124.161 Y118.987
G1 X125.326 Y120.153 E.05063
G1 X125.326 Y120.686
G1 X124.161 Y119.521 E.05063
G1 X124.161 Y120.054
G1 X125.326 Y121.219 E.05063
G1 X125.326 Y121.752
G1 X124.161 Y120.587 E.05063
G1 X124.161 Y121.12
G1 X125.326 Y122.286 E.05063
G1 X125.326 Y122.819
G1 X124.161 Y121.654 E.05063
G1 X124.161 Y122.187
G1 X125.326 Y123.352 E.05063
G1 X125.326 Y123.885
G1 X124.161 Y122.72 E.05063
G1 X124.161 Y123.253
G1 X125.326 Y124.419 E.05063
G1 X125.326 Y124.952
G1 X124.161 Y123.787 E.05063
G1 X124.161 Y124.32
G1 X125.326 Y125.485 E.05063
G1 X125.062 Y125.754
G1 X123.897 Y124.589 E.05063
G1 X123.363 Y124.589
G1 X124.529 Y125.754 E.05063
G1 X123.995 Y125.754
G1 X122.83 Y124.589 E.05063
G1 X122.297 Y124.589
G1 X123.462 Y125.754 E.05063
G1 X122.929 Y125.754
G1 X121.764 Y124.589 E.05063
G1 X121.23 Y124.589
G1 X122.396 Y125.754 E.05063
G1 X121.862 Y125.754
G1 X120.697 Y124.589 E.05063
G1 X120.164 Y124.589
G1 X121.329 Y125.754 E.05063
G1 X120.796 Y125.754
G1 X119.631 Y124.589 E.05063
G1 X119.097 Y124.589
G1 X120.263 Y125.754 E.05063
G1 X119.729 Y125.754
G1 X118.564 Y124.589 E.05063
G1 X118.031 Y124.589
G1 X119.196 Y125.754 E.05063
G1 X118.663 Y125.754
G1 X117.498 Y124.589 E.05063
G1 X116.964 Y124.589
G1 X118.129 Y125.754 E.05063
G1 X117.596 Y125.754
G1 X116.431 Y124.589 E.05063
M73 P71 R5
G1 X115.898 Y124.589
G1 X117.063 Y125.754 E.05063
G1 X116.53 Y125.754
G1 X115.364 Y124.589 E.05063
G1 X114.831 Y124.589
G1 X115.996 Y125.754 E.05063
G1 X115.463 Y125.754
G1 X114.298 Y124.589 E.05063
G1 X113.765 Y124.589
G1 X114.93 Y125.754 E.05063
G1 X114.397 Y125.754
G1 X113.231 Y124.589 E.05063
G1 X112.698 Y124.589
G1 X113.863 Y125.754 E.05063
G1 X113.33 Y125.754
G1 X112.165 Y124.589 E.05063
G1 X111.632 Y124.589
G1 X112.797 Y125.754 E.05063
G1 X112.264 Y125.754
G1 X111.098 Y124.589 E.05063
G1 X110.565 Y124.589
G1 X111.73 Y125.754 E.05063
G1 X111.197 Y125.754
G1 X110.032 Y124.589 E.05063
G1 X109.499 Y124.589
G1 X110.664 Y125.754 E.05063
G1 X110.131 Y125.754
G1 X108.965 Y124.589 E.05063
G1 X108.432 Y124.589
G1 X109.597 Y125.754 E.05063
G1 X109.064 Y125.754
G1 X107.899 Y124.589 E.05063
G1 X107.366 Y124.589
G1 X108.531 Y125.754 E.05063
G1 X107.998 Y125.754
G1 X106.832 Y124.589 E.05063
G1 X106.299 Y124.589
G1 X107.464 Y125.754 E.05063
G1 X106.931 Y125.754
G1 X105.766 Y124.589 E.05063
G1 X105.233 Y124.589
G1 X106.398 Y125.754 E.05063
G1 X105.865 Y125.754
G1 X104.699 Y124.589 E.05063
G1 X104.166 Y124.589
G1 X105.331 Y125.754 E.05063
G1 X104.798 Y125.754
G1 X103.633 Y124.589 E.05063
G1 X103.1 Y124.589
G1 X104.265 Y125.754 E.05063
G1 X103.732 Y125.754
G1 X102.566 Y124.589 E.05063
G1 X102.033 Y124.589
G1 X103.198 Y125.754 E.05063
G1 X102.665 Y125.754
G1 X101.5 Y124.589 E.05063
G1 X100.967 Y124.589
G1 X102.132 Y125.754 E.05063
G1 X101.599 Y125.754
G1 X100.433 Y124.589 E.05063
G1 X99.9 Y124.589
G1 X101.065 Y125.754 E.05063
G1 X100.532 Y125.754
G1 X99.367 Y124.589 E.05063
G1 X98.834 Y124.589
G1 X99.999 Y125.754 E.05063
G1 X99.465 Y125.754
G1 X98.3 Y124.589 E.05063
G1 X97.767 Y124.589
G1 X98.932 Y125.754 E.05063
G1 X98.399 Y125.754
G1 X97.234 Y124.589 E.05063
G1 X96.7 Y124.589
G1 X97.866 Y125.754 E.05063
G1 X97.332 Y125.754
G1 X96.167 Y124.589 E.05063
G1 X95.634 Y124.589
G1 X96.799 Y125.754 E.05063
G1 X96.266 Y125.754
G1 X95.101 Y124.589 E.05063
G1 X94.567 Y124.589
G1 X95.733 Y125.754 E.05063
G1 X95.199 Y125.754
G1 X94.034 Y124.589 E.05063
G1 X93.501 Y124.589
G1 X94.666 Y125.754 E.05063
G1 X94.133 Y125.754
G1 X92.968 Y124.589 E.05063
G1 X92.434 Y124.589
G1 X93.6 Y125.754 E.05063
G1 X93.066 Y125.754
G1 X91.901 Y124.589 E.05063
G1 X91.368 Y124.589
G1 X92.533 Y125.754 E.05063
G1 X92 Y125.754
G1 X90.835 Y124.589 E.05063
G1 X90.301 Y124.589
G1 X91.467 Y125.754 E.05063
G1 X90.933 Y125.754
G1 X89.768 Y124.589 E.05063
G1 X89.235 Y124.589
G1 X90.4 Y125.754 E.05063
G1 X89.867 Y125.754
G1 X88.702 Y124.589 E.05063
G1 X88.168 Y124.589
G1 X89.334 Y125.754 E.05063
G1 X88.8 Y125.754
G1 X87.635 Y124.589 E.05063
G1 X87.102 Y124.589
G1 X88.267 Y125.754 E.05063
G1 X87.734 Y125.754
G1 X86.569 Y124.589 E.05063
G1 X86.035 Y124.589
G1 X87.201 Y125.754 E.05063
G1 X86.667 Y125.754
G1 X85.502 Y124.589 E.05063
G1 X84.969 Y124.589
G1 X86.134 Y125.754 E.05063
G1 X85.601 Y125.754
G1 X84.436 Y124.589 E.05063
G1 X83.902 Y124.589
G1 X85.068 Y125.754 E.05063
G1 X84.534 Y125.754
G1 X83.369 Y124.589 E.05063
G1 X82.836 Y124.589
G1 X84.001 Y125.754 E.05063
G1 X83.468 Y125.754
G1 X82.303 Y124.589 E.05063
G1 X81.769 Y124.589
G1 X82.934 Y125.754 E.05063
G1 X82.401 Y125.754
G1 X81.236 Y124.589 E.05063
G1 X80.703 Y124.589
G1 X81.868 Y125.754 E.05063
G1 X81.335 Y125.754
G1 X80.169 Y124.589 E.05063
G1 X79.636 Y124.589
G1 X80.801 Y125.754 E.05063
G1 X80.268 Y125.754
G1 X79.103 Y124.589 E.05063
G1 X78.57 Y124.589
G1 X79.735 Y125.754 E.05063
G1 X79.202 Y125.754
G1 X78.036 Y124.589 E.05063
G1 X77.503 Y124.589
G1 X78.668 Y125.754 E.05063
G1 X78.135 Y125.754
G1 X76.97 Y124.589 E.05063
G1 X76.437 Y124.589
G1 X77.602 Y125.754 E.05063
G1 X77.069 Y125.754
G1 X75.903 Y124.589 E.05063
G1 X75.37 Y124.589
G1 X76.535 Y125.754 E.05063
G1 X76.002 Y125.754
G1 X74.837 Y124.589 E.05063
G1 X74.304 Y124.589
G1 X75.469 Y125.754 E.05063
G1 X74.936 Y125.754
G1 X73.77 Y124.589 E.05063
; WIPE_START
M204 S5000
G1 X74.936 Y125.754 E-.6262
G1 X75.288 Y125.754 E-.13381
; WIPE_END
G1 E-.04 F1800
G1 X73.58 Y118.315 Z1.4 F15000
G1 X73.326 Y117.212 Z1.4
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X72.737 Y116.623 E.0256
G1 X72.204 Y116.623
G1 X73.326 Y117.745 E.04877
G1 X73.326 Y118.279
G1 X72.161 Y117.114 E.05063
G1 X72.161 Y117.647
G1 X73.326 Y118.812 E.05063
G1 X73.326 Y119.345
G1 X72.161 Y118.18 E.05063
G1 X72.161 Y118.713
G1 X73.326 Y119.879 E.05063
G1 X73.326 Y120.412
G1 X72.161 Y119.247 E.05063
G1 X72.161 Y119.78
G1 X73.326 Y120.945 E.05063
G1 X73.326 Y121.478
G1 X72.161 Y120.313 E.05063
G1 X72.161 Y120.846
G1 X73.326 Y122.012 E.05063
G1 X73.326 Y122.545
G1 X72.161 Y121.38 E.05063
G1 X72.161 Y121.913
G1 X73.326 Y123.078 E.05063
G1 X73.326 Y123.611
G1 X72.161 Y122.446 E.05063
G1 X72.161 Y122.979
G1 X73.326 Y124.145 E.05063
; WIPE_START
M204 S5000
G1 X72.161 Y122.979 E-.6262
G1 X72.161 Y122.627 E-.13381
; WIPE_END
G1 E-.04 F1800
G1 X72.161 Y123.513 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X74.402 Y125.754 E.0974
G1 X73.869 Y125.754
G1 X72.161 Y124.046 E.07423
G1 X72.161 Y124.579
G1 X73.336 Y125.754 E.05105
G1 X72.803 Y125.754
G1 X72.161 Y125.112 E.02788
; WIPE_START
M204 S5000
G1 X72.803 Y125.754 E-.34479
G1 X73.336 Y125.754 E-.20264
G1 X72.94 Y125.358 E-.21257
; WIPE_END
G1 E-.04 F1800
G1 X72.776 Y117.728 Z1.4 F15000
G1 X72.744 Y116.197 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X72.744 Y43.366 E2.30746
G1 X72.511 Y42.364 F15000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7800
G1 X73.368 Y43.221 E.0402
G1 X73.952 Y43.221 E.01939
G1 X72.694 Y41.963 E.05904
G1 X72.694 Y41.378 E.01939
G1 X74.537 Y43.221 E.08647
G1 X75.122 Y43.221 E.01939
G1 X73.022 Y41.122 E.09849
G1 X73.607 Y41.122 E.01939
G1 X75.706 Y43.221 E.09849
G1 X76.291 Y43.221 E.01939
G1 X74.191 Y41.122 E.09849
G1 X74.776 Y41.122 E.01939
G1 X76.876 Y43.221 E.09849
G1 X77.46 Y43.221 E.01939
G1 X75.361 Y41.122 E.09849
G1 X75.945 Y41.122 E.01939
G1 X78.045 Y43.221 E.09849
G1 X78.63 Y43.221 E.01939
G1 X76.53 Y41.122 E.09849
G1 X77.115 Y41.122 E.01939
G1 X79.214 Y43.221 E.09849
G1 X79.799 Y43.221 E.01939
M73 P72 R5
G1 X77.699 Y41.122 E.09849
G1 X78.284 Y41.122 E.01939
G1 X80.383 Y43.221 E.09849
G1 X80.968 Y43.221 E.01939
G1 X78.869 Y41.122 E.09849
G1 X79.453 Y41.122 E.01939
G1 X81.553 Y43.221 E.09849
G1 X82.137 Y43.221 E.01939
G1 X80.038 Y41.122 E.09849
G1 X80.623 Y41.122 E.01939
G1 X82.722 Y43.221 E.09849
G1 X83.307 Y43.221 E.01939
G1 X81.207 Y41.122 E.09849
G1 X81.792 Y41.122 E.01939
G1 X83.891 Y43.221 E.09849
G1 X84.476 Y43.221 E.01939
G1 X82.376 Y41.122 E.09849
G1 X82.961 Y41.122 E.01939
G1 X85.061 Y43.221 E.09849
G1 X85.645 Y43.221 E.01939
G1 X83.546 Y41.122 E.09849
G1 X84.13 Y41.122 E.01939
G1 X86.23 Y43.221 E.09849
G1 X86.815 Y43.221 E.01939
G1 X84.715 Y41.122 E.09849
G1 X85.3 Y41.122 E.01939
G1 X87.399 Y43.221 E.09849
G1 X87.984 Y43.221 E.01939
G1 X85.884 Y41.122 E.09849
G1 X86.469 Y41.122 E.01939
G1 X88.569 Y43.221 E.09849
G1 X89.153 Y43.221 E.01939
G1 X87.054 Y41.122 E.09849
G1 X87.638 Y41.122 E.01939
G1 X89.738 Y43.221 E.09849
G1 X90.323 Y43.221 E.01939
G1 X88.223 Y41.122 E.09849
G1 X88.808 Y41.122 E.01939
G1 X90.907 Y43.221 E.09849
G1 X91.492 Y43.221 E.01939
G1 X89.392 Y41.122 E.09849
G1 X89.977 Y41.122 E.01939
G1 X92.076 Y43.221 E.09849
G1 X92.661 Y43.221 E.01939
G1 X90.562 Y41.122 E.09849
G1 X91.146 Y41.122 E.01939
G1 X93.246 Y43.221 E.09849
G1 X93.83 Y43.221 E.01939
G1 X91.731 Y41.122 E.09849
G1 X92.316 Y41.122 E.01939
G1 X94.415 Y43.221 E.09849
G1 X95 Y43.221 E.01939
G1 X92.9 Y41.122 E.09849
G1 X93.485 Y41.122 E.01939
G1 X95.584 Y43.221 E.09849
G1 X96.169 Y43.221 E.01939
G1 X94.069 Y41.122 E.09849
G1 X94.654 Y41.122 E.01939
G1 X96.293 Y42.761 E.0769
G1 X96.293 Y42.176 E.01939
G1 X95.239 Y41.122 E.04947
G1 X95.823 Y41.122 E.01939
G1 X96.477 Y41.775 E.03064
; WIPE_START
G1 X95.823 Y41.122 E-.351
G1 X95.239 Y41.122 E-.22217
G1 X95.586 Y41.469 E-.18683
; WIPE_END
G1 E-.04 F1800
G1 X101.835 Y43.404 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F7800
G1 X101.194 Y42.763 E.03008
G1 X101.194 Y42.187 E.01912
G1 X102.228 Y43.221 E.04852
G1 X102.805 Y43.221 E.01912
G1 X101.194 Y41.61 E.07556
G1 X101.194 Y41.122 E.01622
G1 X101.281 Y41.122 E.0029
G1 X103.381 Y43.221 E.09849
G1 X103.957 Y43.221 E.01912
G1 X101.858 Y41.122 E.09849
G1 X102.434 Y41.122 E.01912
G1 X104.534 Y43.221 E.09849
G1 X105.11 Y43.221 E.01912
G1 X103.01 Y41.122 E.09849
G1 X103.587 Y41.122 E.01912
G1 X105.686 Y43.221 E.09849
G1 X106.263 Y43.221 E.01912
G1 X104.163 Y41.122 E.09849
G1 X104.74 Y41.122 E.01912
G1 X106.839 Y43.221 E.09849
G1 X107.415 Y43.221 E.01912
G1 X105.316 Y41.122 E.09849
G1 X105.892 Y41.122 E.01912
G1 X107.992 Y43.221 E.09849
G1 X108.568 Y43.221 E.01912
G1 X106.469 Y41.122 E.09849
G1 X107.045 Y41.122 E.01912
G1 X109.145 Y43.221 E.09849
G1 X109.721 Y43.221 E.01912
G1 X107.621 Y41.122 E.09849
G1 X108.198 Y41.122 E.01912
G1 X110.297 Y43.221 E.09849
G1 X110.874 Y43.221 E.01912
G1 X108.774 Y41.122 E.09849
G1 X109.35 Y41.122 E.01912
G1 X111.45 Y43.221 E.09849
G1 X112.026 Y43.221 E.01912
G1 X109.927 Y41.122 E.09849
G1 X110.503 Y41.122 E.01912
G1 X112.603 Y43.221 E.09849
G1 X113.179 Y43.221 E.01912
G1 X111.08 Y41.122 E.09849
G1 X111.656 Y41.122 E.01912
G1 X113.755 Y43.221 E.09849
G1 X114.332 Y43.221 E.01912
G1 X112.232 Y41.122 E.09849
G1 X112.809 Y41.122 E.01912
G1 X114.908 Y43.221 E.09849
G1 X115.485 Y43.221 E.01912
G1 X113.385 Y41.122 E.09849
G1 X113.961 Y41.122 E.01912
G1 X116.061 Y43.221 E.09849
G1 X116.637 Y43.221 E.01912
G1 X114.538 Y41.122 E.09849
G1 X115.114 Y41.122 E.01912
G1 X117.214 Y43.221 E.09849
G1 X117.79 Y43.221 E.01912
G1 X115.69 Y41.122 E.09849
G1 X116.267 Y41.122 E.01912
G1 X118.366 Y43.221 E.09849
G1 X118.943 Y43.221 E.01912
G1 X116.843 Y41.122 E.09849
G1 X117.42 Y41.122 E.01912
G1 X119.519 Y43.221 E.09849
G1 X120.095 Y43.221 E.01912
G1 X117.996 Y41.122 E.09849
G1 X118.572 Y41.122 E.01912
G1 X120.672 Y43.221 E.09849
G1 X121.248 Y43.221 E.01912
G1 X119.149 Y41.122 E.09849
G1 X119.725 Y41.122 E.01912
G1 X121.825 Y43.221 E.09849
G1 X122.401 Y43.221 E.01912
G1 X120.301 Y41.122 E.09849
G1 X120.878 Y41.122 E.01912
G1 X122.977 Y43.221 E.09849
G1 X123.554 Y43.221 E.01912
G1 X121.454 Y41.122 E.09849
G1 X122.03 Y41.122 E.01912
G1 X124.13 Y43.221 E.09849
G1 X124.18 Y43.221 E.00164
G1 X124.18 Y43.018 E.00675
G1 X124.503 Y43.018 E.01073
G1 X122.607 Y41.122 E.08895
G1 X123.183 Y41.122 E.01912
G1 X124.793 Y42.732 E.07554
G1 X124.793 Y42.155 E.01912
G1 X123.76 Y41.122 E.0485
G1 X124.336 Y41.122 E.01912
G1 X124.977 Y41.762 E.03006
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7800
G1 X124.336 Y41.122 E-.34432
G1 X123.76 Y41.122 E-.21902
G1 X124.125 Y41.488 E-.19666
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
; layer num/total_layer_count: 6/10
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I1.217 J0 P1  F15000
; object ids of layer 6 start: 81,118,140
M624 BwAAAAAAAAA=
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
; object ids of this layer6 end: 81,118,140
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X97.219 Y208.965
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8843.478
G1 X152.479 Y208.965 E1.83308
G1 X152.479 Y209.761 E.0264
G1 X94.031 Y209.761 E1.93883
G1 X94.031 Y185.465 E.80594
G1 X96.826 Y185.465 E.09274
G1 X96.826 Y208.965 E.77954
G1 X97.159 Y208.965 E.01102
M204 S250
G1 X97.219 Y208.573 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.526 Y208.573 E2.25252
G1 X170.526 Y210.153 E.04855
G1 X93.639 Y210.153 E2.36253
G1 X93.639 Y185.073 E.77064
G1 X97.219 Y185.073 E.11
G1 X97.219 Y208.513 E.72025
; WIPE_START
M204 S5000
G1 X99.219 Y208.515 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y209.363 Z1.6 F15000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X152.275 Y209.363 E1.76318
; WIPE_START
G1 X150.275 Y209.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.907 Y209.402 Z1.6 F15000
G1 X170.318 Y209.465 Z1.6
M73 P72 R4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X169.837 Y209.946 E.0209
G1 X169.304 Y209.946
G1 X170.318 Y208.931 E.04407
G1 X169.936 Y208.78
G1 X168.771 Y209.946 E.05063
G1 X168.238 Y209.946
G1 X169.403 Y208.78 E.05063
G1 X168.87 Y208.78
G1 X167.704 Y209.946 E.05063
G1 X167.171 Y209.946
G1 X168.336 Y208.78 E.05063
G1 X167.803 Y208.78
G1 X166.638 Y209.946 E.05063
G1 X166.105 Y209.946
G1 X167.27 Y208.78 E.05063
G1 X166.736 Y208.78
G1 X165.571 Y209.946 E.05063
G1 X165.038 Y209.946
G1 X166.203 Y208.78 E.05063
G1 X165.67 Y208.78
G1 X164.505 Y209.946 E.05063
G1 X163.971 Y209.946
G1 X165.137 Y208.78 E.05063
G1 X164.603 Y208.78
G1 X163.438 Y209.946 E.05063
G1 X162.905 Y209.946
G1 X164.07 Y208.78 E.05063
G1 X163.537 Y208.78
G1 X162.372 Y209.946 E.05063
G1 X161.838 Y209.946
G1 X163.004 Y208.78 E.05063
G1 X162.47 Y208.78
G1 X161.305 Y209.946 E.05063
G1 X160.772 Y209.946
M73 P73 R4
G1 X161.937 Y208.78 E.05063
G1 X161.404 Y208.78
G1 X160.239 Y209.946 E.05063
G1 X159.705 Y209.946
G1 X160.871 Y208.78 E.05063
G1 X160.337 Y208.78
G1 X159.172 Y209.946 E.05063
G1 X158.639 Y209.946
G1 X159.804 Y208.78 E.05063
G1 X159.271 Y208.78
G1 X158.106 Y209.946 E.05063
G1 X157.572 Y209.946
G1 X158.738 Y208.78 E.05063
G1 X158.204 Y208.78
G1 X157.039 Y209.946 E.05063
G1 X156.506 Y209.946
G1 X157.671 Y208.78 E.05063
G1 X157.138 Y208.78
G1 X155.973 Y209.946 E.05063
G1 X155.439 Y209.946
G1 X156.605 Y208.78 E.05063
G1 X156.071 Y208.78
G1 X154.906 Y209.946 E.05063
G1 X154.373 Y209.946
G1 X155.538 Y208.78 E.05063
G1 X155.005 Y208.78
G1 X153.84 Y209.946 E.05063
G1 X153.306 Y209.946
G1 X154.472 Y208.78 E.05063
G1 X153.938 Y208.78
G1 X152.773 Y209.946 E.05063
G1 X152.701 Y209.484
G1 X153.405 Y208.78 E.03059
; WIPE_START
M204 S5000
G1 X152.701 Y209.484 E-.37833
G1 X152.773 Y209.946 E-.17739
G1 X153.153 Y209.566 E-.20428
; WIPE_END
G1 E-.04 F1800
G1 X145.521 Y209.539 Z1.6 F15000
G1 X96.231 Y209.369 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3840
G1 X96.253 Y208.855 E.01582
G1 X96.434 Y208.74 E.00659
G1 X96.434 Y185.857 E.70311
G1 X94.423 Y185.857 E.06181
G1 X94.423 Y209.369 E.72243
G1 X96.171 Y209.369 E.05372
G1 X96.057 Y186.863 F15000
G1 F3840
G1 X96.057 Y186.234 E.01932
G1 X94.8 Y186.234 E.03864
G1 X94.8 Y208.992 E.69926
G1 X95.854 Y208.992 E.03239
G1 X95.95 Y208.628 E.01157
G1 X96.057 Y208.571 E.00373
G1 X96.057 Y186.923 E.66516
G1 X95.649 Y186.863 F15000
; LINE_WIDTH: 0.483185
G1 F3840
G1 X95.649 Y186.643 E.0079
G1 X95.208 Y186.643 E.0158
G1 X95.208 Y208.583 E.78713
G1 X95.535 Y208.583 E.01173
G1 X95.611 Y208.4 E.00712
G1 X95.649 Y208.38 E.00152
G1 X95.649 Y186.923 E.76978
; WIPE_START
G1 X95.649 Y188.923 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.937 Y181.296 Z1.6 F15000
G1 X96.826 Y157.761 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X96.826 Y181.261 E.77954
G1 X94.031 Y181.261 E.09274
G1 X94.031 Y156.965 E.80594
G1 X152.479 Y156.965 E1.93883
G1 X152.479 Y157.761 E.0264
G1 X96.886 Y157.761 E1.84409
M204 S250
G1 X97.219 Y158.153 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.219 Y181.653 E.72209
G1 X93.639 Y181.653 E.11
G1 X93.639 Y156.573 E.77064
G1 X170.526 Y156.575 E2.36253
G1 X170.526 Y158.153 E.04849
G1 X97.279 Y158.153 E2.25068
; WIPE_START
M204 S5000
G1 X97.273 Y160.153 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y157.363 Z1.6 F15000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X152.275 Y157.363 E1.76318
; WIPE_START
G1 X150.275 Y157.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X157.904 Y157.593 Z1.6 F15000
G1 X169.578 Y157.946 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X170.318 Y157.205 E.03217
G1 X170.21 Y156.78
G1 X169.045 Y157.946 E.05063
G1 X168.512 Y157.946
G1 X169.677 Y156.78 E.05064
G1 X169.144 Y156.78
G1 X167.978 Y157.946 E.05064
G1 X167.445 Y157.946
G1 X168.61 Y156.78 E.05063
G1 X168.077 Y156.78
G1 X166.912 Y157.946 E.05063
G1 X166.379 Y157.946
G1 X167.544 Y156.78 E.05064
G1 X167.011 Y156.78
G1 X165.845 Y157.946 E.05064
G1 X165.312 Y157.946
G1 X166.477 Y156.78 E.05063
G1 X165.944 Y156.78
G1 X164.779 Y157.946 E.05063
G1 X164.246 Y157.946
G1 X165.411 Y156.78 E.05064
G1 X164.878 Y156.78
G1 X163.712 Y157.946 E.05064
G1 X163.179 Y157.946
G1 X164.344 Y156.78 E.05063
G1 X163.811 Y156.78
G1 X162.646 Y157.946 E.05063
G1 X162.112 Y157.946
G1 X163.278 Y156.78 E.05064
G1 X162.744 Y156.78
G1 X161.579 Y157.946 E.05064
G1 X161.046 Y157.946
G1 X162.211 Y156.78 E.05063
G1 X161.678 Y156.78
G1 X160.513 Y157.946 E.05063
G1 X159.979 Y157.946
M73 P74 R4
G1 X161.145 Y156.78 E.05063
G1 X160.611 Y156.78
G1 X159.446 Y157.946 E.05063
G1 X158.913 Y157.946
G1 X160.078 Y156.78 E.05063
G1 X159.545 Y156.78
G1 X158.38 Y157.946 E.05063
G1 X157.846 Y157.946
G1 X159.012 Y156.78 E.05063
G1 X158.478 Y156.78
G1 X157.313 Y157.946 E.05063
G1 X156.78 Y157.946
G1 X157.945 Y156.78 E.05063
G1 X157.412 Y156.78
G1 X156.247 Y157.946 E.05063
G1 X155.713 Y157.946
G1 X156.879 Y156.78 E.05063
G1 X156.345 Y156.78
G1 X155.18 Y157.946 E.05063
G1 X154.647 Y157.946
G1 X155.812 Y156.78 E.05063
G1 X155.279 Y156.78
G1 X154.114 Y157.946 E.05063
G1 X153.58 Y157.946
G1 X154.746 Y156.78 E.05063
G1 X154.212 Y156.78
G1 X153.047 Y157.946 E.05063
G1 X152.701 Y157.758
G1 X153.679 Y156.78 E.0425
G1 X153.146 Y156.78
G1 X152.701 Y157.225 E.01933
; WIPE_START
M204 S5000
G1 X153.146 Y156.78 E-.23903
G1 X153.679 Y156.78 E-.20264
G1 X153.087 Y157.373 E-.31834
; WIPE_END
G1 E-.04 F1800
G1 X146.037 Y160.297 Z1.6 F15000
G1 X96.434 Y180.869 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3840
G1 X96.434 Y157.986 E.70311
G1 X96.253 Y157.871 E.00659
G1 X96.231 Y157.357 E.01582
G1 X94.423 Y157.357 E.05556
G1 X94.423 Y180.869 E.72243
G1 X96.374 Y180.869 E.05997
G1 X96.057 Y158.155 F15000
G1 F3840
G1 X95.921 Y158.049 E.00532
G1 X95.854 Y157.734 E.00989
G1 X94.8 Y157.734 E.03239
G1 X94.8 Y180.492 E.69926
G1 X96.057 Y180.492 E.03864
G1 X96.057 Y158.215 E.68448
G1 X95.649 Y158.346 F15000
; LINE_WIDTH: 0.483185
G1 F3840
G3 X95.535 Y158.143 I.151 J-.217 E.00865
G1 X95.208 Y158.143 E.01173
G1 X95.208 Y180.083 E.78713
G1 X95.649 Y180.083 E.0158
G1 X95.649 Y158.406 E.77768
; OBJECT_ID: 118
; WIPE_START
G1 X95.649 Y160.406 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 118
M624 AgAAAAAAAAA=
G1 X99.135 Y153.617 Z1.6 F15000
G1 X155.58 Y43.693 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X155.58 Y99.345 E1.84608
G1 X154.784 Y99.345 E.0264
G1 X154.784 Y40.897 E1.93883
G1 X179.08 Y40.897 E.80594
G1 X179.08 Y43.693 E.09274
G1 X155.64 Y43.693 E.77755
M204 S250
G1 X155.972 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X155.972 Y117.393 E2.25252
G1 X154.392 Y117.393 E.04855
G1 X154.392 Y40.505 E2.36253
G1 X179.472 Y40.505 E.77064
G1 X179.472 Y44.085 E.11
G1 X156.032 Y44.085 E.72025
; WIPE_START
M204 S5000
G1 X156.031 Y46.085 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.691 Y43.12 Z1.6 F15000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3840
G1 X155.805 Y43.301 E.00659
G1 X178.688 Y43.301 E.70311
G1 X178.688 Y41.289 E.06181
G1 X155.176 Y41.29 E.72243
G1 X155.176 Y43.098 E.05556
G1 X155.631 Y43.117 E.01397
G1 X178.311 Y42.295 F15000
G1 F3840
G1 X178.311 Y41.667 E.01932
G1 X155.554 Y41.667 E.69926
G1 X155.554 Y42.721 E.03239
G1 X155.918 Y42.817 E.01157
G1 X155.975 Y42.924 E.00373
G1 X178.311 Y42.924 E.68632
G1 X178.311 Y42.355 E.01748
G1 X177.902 Y42.295 F15000
; LINE_WIDTH: 0.48319
G1 F3840
G1 X177.902 Y42.075 E.0079
G1 X155.962 Y42.075 E.78714
G1 X155.962 Y42.402 E.01173
G1 X156.146 Y42.478 E.00712
G1 X156.166 Y42.516 E.00152
G1 X177.902 Y42.516 E.77984
G1 X177.902 Y42.355 E.00574
G1 X155.182 Y43.49 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.182 Y99.142 E1.76318
; WIPE_START
G1 X155.182 Y97.142 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.413 Y104.771 Z1.6 F15000
G1 X155.765 Y116.445 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X155.025 Y117.185 E.03217
G1 X154.6 Y117.077
G1 X155.765 Y115.912 E.05063
G1 X155.765 Y115.378
G1 X154.6 Y116.544 E.05063
G1 X154.6 Y116.01
G1 X155.765 Y114.845 E.05063
G1 X155.765 Y114.312
M73 P75 R4
G1 X154.6 Y115.477 E.05063
G1 X154.6 Y114.944
G1 X155.765 Y113.779 E.05063
G1 X155.765 Y113.245
G1 X154.6 Y114.411 E.05063
G1 X154.6 Y113.877
G1 X155.765 Y112.712 E.05063
G1 X155.765 Y112.179
G1 X154.6 Y113.344 E.05063
G1 X154.6 Y112.811
G1 X155.765 Y111.646 E.05063
G1 X155.765 Y111.112
G1 X154.6 Y112.278 E.05063
G1 X154.6 Y111.744
G1 X155.765 Y110.579 E.05063
G1 X155.765 Y110.046
G1 X154.6 Y111.211 E.05063
G1 X154.6 Y110.678
G1 X155.765 Y109.513 E.05063
G1 X155.765 Y108.979
G1 X154.6 Y110.145 E.05063
G1 X154.6 Y109.611
G1 X155.765 Y108.446 E.05063
G1 X155.765 Y107.913
G1 X154.6 Y109.078 E.05063
G1 X154.6 Y108.545
G1 X155.765 Y107.38 E.05063
G1 X155.765 Y106.846
G1 X154.6 Y108.012 E.05063
G1 X154.6 Y107.478
G1 X155.765 Y106.313 E.05063
G1 X155.765 Y105.78
G1 X154.6 Y106.945 E.05063
G1 X154.6 Y106.412
G1 X155.765 Y105.247 E.05063
G1 X155.765 Y104.713
G1 X154.6 Y105.878 E.05063
G1 X154.6 Y105.345
G1 X155.765 Y104.18 E.05063
G1 X155.765 Y103.647
G1 X154.6 Y104.812 E.05063
G1 X154.6 Y104.279
G1 X155.765 Y103.113 E.05063
G1 X155.765 Y102.58
G1 X154.6 Y103.745 E.05063
G1 X154.6 Y103.212
G1 X155.765 Y102.047 E.05063
G1 X155.765 Y101.514
G1 X154.6 Y102.679 E.05063
G1 X154.6 Y102.146
G1 X155.765 Y100.98 E.05063
G1 X155.765 Y100.447
G1 X154.6 Y101.612 E.05063
G1 X154.6 Y101.079
G1 X155.765 Y99.914 E.05063
G1 X155.578 Y99.568
G1 X154.6 Y100.546 E.0425
G1 X154.6 Y100.013
G1 X155.045 Y99.568 E.01933
; WIPE_START
M204 S5000
G1 X154.6 Y100.013 E-.23901
G1 X154.6 Y100.546 E-.20264
G1 X155.192 Y99.954 E-.31835
; WIPE_END
G1 E-.04 F1800
G1 X160.351 Y94.328 Z1.6 F15000
G1 X206.784 Y43.693 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X183.284 Y43.693 E.77954
G1 X183.284 Y40.897 E.09274
G1 X207.58 Y40.897 E.80594
G1 X207.58 Y99.345 E1.93883
G1 X206.784 Y99.345 E.0264
G1 X206.784 Y43.753 E1.84409
M204 S250
G1 X206.392 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X182.892 Y44.085 E.72209
G1 X182.892 Y40.505 E.11
G1 X207.972 Y40.505 E.77064
G1 X207.972 Y117.393 E2.36253
G1 X206.392 Y117.393 E.04855
G1 X206.392 Y44.145 E2.25068
M204 S5000
G1 X206.574 Y43.301 F15000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3840
G1 X206.674 Y43.12 E.00635
G1 X207.188 Y43.098 E.01582
G1 X207.188 Y41.289 E.05556
G1 X183.677 Y41.29 E.72243
G1 X183.677 Y43.301 E.06181
G1 X206.514 Y43.301 E.70173
G1 X206.811 Y42.262 F15000
G1 F3840
G1 X206.811 Y41.667 E.0183
G1 X184.054 Y41.667 E.69926
G1 X184.054 Y42.924 E.03864
G1 X206.39 Y42.924 E.68632
G1 X206.496 Y42.788 E.00532
G1 X206.811 Y42.721 E.00989
G1 X206.811 Y42.322 E.01225
G1 X206.403 Y42.262 F15000
; LINE_WIDTH: 0.483185
G1 F3840
G1 X206.403 Y42.075 E.00671
G1 X184.462 Y42.075 E.78713
G1 X184.462 Y42.516 E.0158
G1 X206.199 Y42.516 E.77983
G3 X206.403 Y42.402 I.217 J.151 E.00865
G1 X206.403 Y42.322 E.00287
G1 X207.182 Y43.49 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X207.182 Y99.142 E1.76318
; WIPE_START
G1 X207.182 Y97.142 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.221 Y104.774 Z1.6 F15000
G1 X207.284 Y117.185 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X207.765 Y116.704 E.0209
G1 X207.765 Y116.171
G1 X206.751 Y117.185 E.04407
G1 X206.6 Y116.803
G1 X207.765 Y115.638 E.05063
G1 X207.765 Y115.104
G1 X206.6 Y116.27 E.05064
G1 X206.6 Y115.736
G1 X207.765 Y114.571 E.05064
G1 X207.765 Y114.038
G1 X206.6 Y115.203 E.05063
G1 X206.6 Y114.67
G1 X207.765 Y113.505 E.05063
G1 X207.765 Y112.971
G1 X206.6 Y114.137 E.05064
M73 P76 R4
G1 X206.6 Y113.603
G1 X207.765 Y112.438 E.05064
G1 X207.765 Y111.905
G1 X206.6 Y113.07 E.05063
G1 X206.6 Y112.537
G1 X207.765 Y111.372 E.05063
G1 X207.765 Y110.838
G1 X206.6 Y112.004 E.05064
G1 X206.6 Y111.47
G1 X207.765 Y110.305 E.05064
G1 X207.765 Y109.772
G1 X206.6 Y110.937 E.05063
G1 X206.6 Y110.404
G1 X207.765 Y109.239 E.05063
G1 X207.765 Y108.705
G1 X206.6 Y109.871 E.05064
G1 X206.6 Y109.337
G1 X207.765 Y108.172 E.05063
G1 X207.765 Y107.639
G1 X206.6 Y108.804 E.05063
G1 X206.6 Y108.271
G1 X207.765 Y107.106 E.05063
G1 X207.765 Y106.572
G1 X206.6 Y107.738 E.05063
G1 X206.6 Y107.204
G1 X207.765 Y106.039 E.05063
G1 X207.765 Y105.506
G1 X206.6 Y106.671 E.05063
G1 X206.6 Y106.138
G1 X207.765 Y104.973 E.05063
G1 X207.765 Y104.439
G1 X206.6 Y105.604 E.05063
G1 X206.6 Y105.071
G1 X207.765 Y103.906 E.05063
G1 X207.765 Y103.373
G1 X206.6 Y104.538 E.05063
G1 X206.6 Y104.005
G1 X207.765 Y102.839 E.05063
G1 X207.765 Y102.306
G1 X206.6 Y103.471 E.05063
G1 X206.6 Y102.938
G1 X207.765 Y101.773 E.05063
G1 X207.765 Y101.24
G1 X206.6 Y102.405 E.05063
G1 X206.6 Y101.872
G1 X207.765 Y100.706 E.05063
G1 X207.765 Y100.173
G1 X206.6 Y101.338 E.05063
G1 X206.6 Y100.805
G1 X207.765 Y99.64 E.05063
G1 X207.304 Y99.568
G1 X206.6 Y100.272 E.03059
; OBJECT_ID: 140
; WIPE_START
M204 S5000
G1 X207.304 Y99.568 E-.37833
G1 X207.765 Y99.64 E-.17739
G1 X207.385 Y100.02 E-.20428
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 118
M625
; start printing object, unique label id: 140
M624 BAAAAAAAAAA=
G1 X200.349 Y97.061 Z1.6 F15000
G1 X73.142 Y43.569 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X73.142 Y99.221 E1.84608
G1 X72.346 Y99.221 E.0264
G1 X72.346 Y40.773 E1.93883
G1 X96.642 Y40.773 E.80594
G1 X96.642 Y43.569 E.09274
G1 X73.202 Y43.569 E.77755
M204 S250
G1 X73.534 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X73.534 Y117.269 E2.25252
G1 X71.954 Y117.269 E.04855
G1 X71.954 Y40.381 E2.36253
G1 X97.034 Y40.381 E.77064
G1 X97.034 Y43.961 E.11
G1 X73.594 Y43.961 E.72025
; WIPE_START
M204 S5000
G1 X73.592 Y45.961 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X73.252 Y42.996 Z1.6 F15000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3840
G1 X73.367 Y43.177 E.00659
G1 X96.25 Y43.177 E.70311
G1 X96.25 Y41.165 E.06181
G1 X72.738 Y41.165 E.72243
G1 X72.738 Y42.974 E.05556
G1 X73.192 Y42.993 E.01397
G1 X95.872 Y42.171 F15000
G1 F3840
G1 X95.872 Y41.543 E.01932
G1 X73.115 Y41.543 E.69926
G1 X73.115 Y42.597 E.03239
G1 X73.479 Y42.693 E.01157
G1 X73.536 Y42.8 E.00373
G1 X95.872 Y42.8 E.68632
G1 X95.872 Y42.231 E.01748
G1 X95.464 Y42.171 F15000
; LINE_WIDTH: 0.48319
G1 F3840
G1 X95.464 Y41.951 E.0079
G1 X73.524 Y41.951 E.78714
G1 X73.524 Y42.278 E.01173
G1 X73.707 Y42.354 E.00712
G1 X73.727 Y42.391 E.00152
G1 X95.464 Y42.391 E.77984
G1 X95.464 Y42.231 E.00574
G1 X72.744 Y43.366 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X72.744 Y99.018 E1.76318
; WIPE_START
G1 X72.744 Y97.018 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X72.974 Y104.647 Z1.6 F15000
G1 X73.326 Y116.321 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X72.586 Y117.061 E.03217
G1 X72.161 Y116.953
G1 X73.326 Y115.788 E.05063
G1 X73.326 Y115.254
G1 X72.161 Y116.42 E.05063
G1 X72.161 Y115.886
G1 X73.326 Y114.721 E.05063
G1 X73.326 Y114.188
G1 X72.161 Y115.353 E.05063
G1 X72.161 Y114.82
G1 X73.326 Y113.655 E.05063
G1 X73.326 Y113.121
G1 X72.161 Y114.287 E.05063
G1 X72.161 Y113.753
G1 X73.326 Y112.588 E.05063
G1 X73.326 Y112.055
G1 X72.161 Y113.22 E.05063
G1 X72.161 Y112.687
M73 P77 R4
G1 X73.326 Y111.522 E.05063
G1 X73.326 Y110.988
G1 X72.161 Y112.154 E.05063
G1 X72.161 Y111.62
G1 X73.326 Y110.455 E.05063
G1 X73.326 Y109.922
G1 X72.161 Y111.087 E.05063
G1 X72.161 Y110.554
G1 X73.326 Y109.389 E.05063
G1 X73.326 Y108.855
G1 X72.161 Y110.021 E.05063
G1 X72.161 Y109.487
G1 X73.326 Y108.322 E.05063
G1 X73.326 Y107.789
G1 X72.161 Y108.954 E.05063
G1 X72.161 Y108.421
G1 X73.326 Y107.256 E.05063
G1 X73.326 Y106.722
G1 X72.161 Y107.887 E.05063
G1 X72.161 Y107.354
G1 X73.326 Y106.189 E.05063
G1 X73.326 Y105.656
G1 X72.161 Y106.821 E.05063
G1 X72.161 Y106.288
G1 X73.326 Y105.122 E.05063
G1 X73.326 Y104.589
G1 X72.161 Y105.754 E.05063
G1 X72.161 Y105.221
G1 X73.326 Y104.056 E.05063
G1 X73.326 Y103.523
G1 X72.161 Y104.688 E.05063
G1 X72.161 Y104.155
G1 X73.326 Y102.989 E.05063
G1 X73.326 Y102.456
G1 X72.161 Y103.621 E.05063
G1 X72.161 Y103.088
G1 X73.326 Y101.923 E.05063
G1 X73.326 Y101.39
G1 X72.161 Y102.555 E.05063
G1 X72.161 Y102.022
G1 X73.326 Y100.856 E.05063
G1 X73.326 Y100.323
G1 X72.161 Y101.488 E.05063
G1 X72.161 Y100.955
G1 X73.326 Y99.79 E.05063
G1 X73.139 Y99.444
G1 X72.161 Y100.422 E.0425
G1 X72.161 Y99.889
G1 X72.606 Y99.444 E.01933
; WIPE_START
M204 S5000
G1 X72.161 Y99.889 E-.23901
G1 X72.161 Y100.422 E-.20264
G1 X72.753 Y99.83 E-.31835
; WIPE_END
G1 E-.04 F1800
G1 X77.912 Y94.204 Z1.6 F15000
G1 X124.346 Y43.569 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X100.846 Y43.569 E.77954
G1 X100.846 Y40.773 E.09274
G1 X125.142 Y40.773 E.80594
G1 X125.142 Y99.221 E1.93883
G1 X124.346 Y99.221 E.0264
G1 X124.346 Y43.629 E1.84409
M204 S250
G1 X123.954 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X100.454 Y43.961 E.72209
G1 X100.454 Y40.381 E.11
G1 X125.534 Y40.381 E.77064
G1 X125.534 Y117.269 E2.36253
G1 X123.954 Y117.269 E.04855
G1 X123.954 Y44.021 E2.25068
M204 S5000
G1 X124.136 Y43.177 F15000
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.41999
G1 F3840
G1 X124.235 Y42.996 E.00635
G1 X124.75 Y42.974 E.01582
G1 X124.75 Y41.165 E.05556
G1 X101.238 Y41.165 E.72243
G1 X101.238 Y43.177 E.06181
G1 X124.076 Y43.177 E.70173
G1 X124.372 Y42.138 F15000
G1 F3840
G1 X124.372 Y41.543 E.0183
G1 X101.615 Y41.543 E.69926
G1 X101.615 Y42.8 E.03864
G1 X123.951 Y42.8 E.68632
G1 X124.058 Y42.663 E.00532
G1 X124.372 Y42.597 E.00989
G1 X124.372 Y42.198 E.01225
G1 X123.964 Y42.138 F15000
; LINE_WIDTH: 0.483185
G1 F3840
G1 X123.964 Y41.951 E.00671
G1 X102.024 Y41.951 E.78713
G1 X102.024 Y42.391 E.0158
G1 X123.76 Y42.391 E.77983
G3 X123.964 Y42.278 I.217 J.151 E.00865
G1 X123.964 Y42.198 E.00287
G1 X124.744 Y43.366 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X124.744 Y99.018 E1.76318
; WIPE_START
G1 X124.744 Y97.018 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.782 Y104.65 Z1.6 F15000
G1 X124.845 Y117.061 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X125.326 Y116.58 E.0209
G1 X125.326 Y116.047
G1 X124.312 Y117.061 E.04407
G1 X124.161 Y116.679
G1 X125.326 Y115.514 E.05063
G1 X125.326 Y114.98
G1 X124.161 Y116.146 E.05064
G1 X124.161 Y115.612
G1 X125.326 Y114.447 E.05064
G1 X125.326 Y113.914
G1 X124.161 Y115.079 E.05063
G1 X124.161 Y114.546
G1 X125.326 Y113.381 E.05063
G1 X125.326 Y112.847
G1 X124.161 Y114.013 E.05064
G1 X124.161 Y113.479
G1 X125.326 Y112.314 E.05064
G1 X125.326 Y111.781
G1 X124.161 Y112.946 E.05063
G1 X124.161 Y112.413
G1 X125.326 Y111.248 E.05063
G1 X125.326 Y110.714
G1 X124.161 Y111.88 E.05064
M73 P78 R4
G1 X124.161 Y111.346
G1 X125.326 Y110.181 E.05064
G1 X125.326 Y109.648
G1 X124.161 Y110.813 E.05063
G1 X124.161 Y110.28
G1 X125.326 Y109.115 E.05063
M73 P78 R3
G1 X125.326 Y108.581
G1 X124.161 Y109.747 E.05064
G1 X124.161 Y109.213
G1 X125.326 Y108.048 E.05063
G1 X125.326 Y107.515
G1 X124.161 Y108.68 E.05063
G1 X124.161 Y108.147
G1 X125.326 Y106.982 E.05063
G1 X125.326 Y106.448
G1 X124.161 Y107.613 E.05063
G1 X124.161 Y107.08
G1 X125.326 Y105.915 E.05063
G1 X125.326 Y105.382
G1 X124.161 Y106.547 E.05063
G1 X124.161 Y106.014
G1 X125.326 Y104.848 E.05063
G1 X125.326 Y104.315
G1 X124.161 Y105.48 E.05063
G1 X124.161 Y104.947
G1 X125.326 Y103.782 E.05063
G1 X125.326 Y103.249
G1 X124.161 Y104.414 E.05063
G1 X124.161 Y103.881
G1 X125.326 Y102.715 E.05063
G1 X125.326 Y102.182
G1 X124.161 Y103.347 E.05063
G1 X124.161 Y102.814
G1 X125.326 Y101.649 E.05063
G1 X125.326 Y101.116
G1 X124.161 Y102.281 E.05063
G1 X124.161 Y101.748
G1 X125.326 Y100.582 E.05063
G1 X125.326 Y100.049
G1 X124.161 Y101.214 E.05063
G1 X124.161 Y100.681
G1 X125.326 Y99.516 E.05063
G1 X124.865 Y99.444
G1 X124.161 Y100.148 E.03059
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X124.865 Y99.444 E-.37833
G1 X125.326 Y99.516 E-.17739
G1 X124.946 Y99.896 E-.20428
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
; layer num/total_layer_count: 7/10
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F15000
; object ids of layer 7 start: 81,118,140
M624 BwAAAAAAAAA=
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
; object ids of this layer7 end: 81,118,140
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X97.219 Y208.965
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X135.299 Y208.965 E1.2632
G1 X135.299 Y209.761 E.0264
G1 X94.031 Y209.761 E1.36895
G1 X94.031 Y185.465 E.80594
G1 X96.826 Y185.465 E.09274
G1 X96.826 Y208.965 E.77954
G1 X97.159 Y208.965 E.01102
M204 S250
G1 X97.219 Y208.573 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X153.346 Y208.573 E1.72465
G1 X153.346 Y210.153 E.04855
G1 X93.639 Y210.153 E1.83465
G1 X93.639 Y185.073 E.77064
G1 X97.219 Y185.073 E.11
G1 X97.219 Y208.513 E.72025
; WIPE_START
M204 S5000
G1 X99.219 Y208.515 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y209.363 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X135.096 Y209.363 E1.2189
; WIPE_START
G1 X133.096 Y209.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.725 Y209.134 Z1.8 F15000
G1 X152.514 Y208.78 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X153.139 Y209.406 E.02716
G1 X153.139 Y209.939
G1 X151.981 Y208.78 E.05034
G1 X151.447 Y208.78
G1 X152.613 Y209.946 E.05063
G1 X152.079 Y209.946
G1 X150.914 Y208.78 E.05063
G1 X150.381 Y208.78
G1 X151.546 Y209.946 E.05063
G1 X151.013 Y209.946
G1 X149.848 Y208.78 E.05063
G1 X149.314 Y208.78
G1 X150.48 Y209.946 E.05063
G1 X149.946 Y209.946
G1 X148.781 Y208.78 E.05063
G1 X148.248 Y208.78
G1 X149.413 Y209.946 E.05063
G1 X148.88 Y209.946
G1 X147.715 Y208.78 E.05063
G1 X147.181 Y208.78
G1 X148.347 Y209.946 E.05063
G1 X147.813 Y209.946
G1 X146.648 Y208.78 E.05063
G1 X146.115 Y208.78
G1 X147.28 Y209.946 E.05063
G1 X146.747 Y209.946
G1 X145.582 Y208.78 E.05063
G1 X145.048 Y208.78
G1 X146.213 Y209.946 E.05063
G1 X145.68 Y209.946
G1 X144.515 Y208.78 E.05063
G1 X143.982 Y208.78
G1 X145.147 Y209.946 E.05063
G1 X144.614 Y209.946
G1 X143.448 Y208.78 E.05063
G1 X142.915 Y208.78
G1 X144.08 Y209.946 E.05063
G1 X143.547 Y209.946
G1 X142.382 Y208.78 E.05063
G1 X141.849 Y208.78
G1 X143.014 Y209.946 E.05063
G1 X142.481 Y209.946
G1 X141.315 Y208.78 E.05063
G1 X140.782 Y208.78
G1 X141.947 Y209.946 E.05063
G1 X141.414 Y209.946
G1 X140.249 Y208.78 E.05063
G1 X139.716 Y208.78
G1 X140.881 Y209.946 E.05063
G1 X140.348 Y209.946
G1 X139.182 Y208.78 E.05063
G1 X138.649 Y208.78
G1 X139.814 Y209.946 E.05063
G1 X139.281 Y209.946
G1 X138.116 Y208.78 E.05063
G1 X137.583 Y208.78
G1 X138.748 Y209.946 E.05063
G1 X138.215 Y209.946
G1 X137.049 Y208.78 E.05063
G1 X136.516 Y208.78
G1 X137.681 Y209.946 E.05063
G1 X137.148 Y209.946
G1 X135.983 Y208.78 E.05063
G1 X135.522 Y208.852
G1 X136.615 Y209.946 E.0475
G1 X136.082 Y209.946
G1 X135.522 Y209.386 E.02433
; WIPE_START
M204 S5000
G1 X136.082 Y209.946 E-.3009
G1 X136.615 Y209.946 E-.20264
G1 X136.138 Y209.468 E-.25646
; WIPE_END
M73 P79 R3
G1 E-.04 F1800
G1 X129.489 Y205.72 Z1.8 F15000
G1 X95.649 Y186.643 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X95.208 Y186.643 E.0158
G1 X95.208 Y208.583 E.78713
G1 X95.535 Y208.583 E.01173
G1 X95.611 Y208.4 E.00712
G1 X95.649 Y208.38 E.00152
G1 X95.649 Y186.703 E.77768
G1 X96.057 Y186.234 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X94.8 Y186.234 E.03864
G1 X94.8 Y208.992 E.69926
G1 X95.854 Y208.992 E.03239
G1 X95.95 Y208.628 E.01157
G1 X96.057 Y208.571 E.00373
G1 X96.057 Y186.294 E.68448
G1 X96.434 Y185.857 F15000
G1 F4800
G1 X94.423 Y185.857 E.06181
G1 X94.423 Y209.369 E.72243
G1 X96.231 Y209.369 E.05556
G1 X96.253 Y208.855 E.01582
G1 X96.434 Y208.74 E.00659
G1 X96.434 Y185.917 E.70127
; WIPE_START
G1 X96.434 Y187.917 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.534 Y180.285 Z1.8 F15000
G1 X96.826 Y157.761 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X96.826 Y181.261 E.77954
G1 X94.031 Y181.261 E.09274
G1 X94.031 Y156.965 E.80594
G1 X135.299 Y156.965 E1.36895
G1 X135.299 Y157.761 E.0264
G1 X96.886 Y157.761 E1.27422
M204 S250
G1 X97.219 Y158.153 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.219 Y181.653 E.72209
G1 X93.639 Y181.653 E.11
G1 X93.639 Y156.573 E.77064
G1 X153.346 Y156.573 E1.83465
G1 X153.346 Y156.994 E.01294
G1 X153.346 Y158.153 E.03561
G1 X97.279 Y158.153 E1.72281
; WIPE_START
M204 S5000
G1 X97.273 Y160.153 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y157.363 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X135.096 Y157.363 E1.2189
; WIPE_START
G1 X133.096 Y157.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.728 Y157.281 Z1.8 F15000
G1 X153.139 Y157.146 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X152.773 Y156.78 E.0159
G1 X152.24 Y156.78
G1 X153.139 Y157.68 E.03907
G1 X152.872 Y157.946
G1 X151.707 Y156.78 E.05063
G1 X151.173 Y156.78
G1 X152.339 Y157.946 E.05063
G1 X151.805 Y157.946
G1 X150.64 Y156.78 E.05063
G1 X150.107 Y156.78
G1 X151.272 Y157.946 E.05063
G1 X150.739 Y157.946
G1 X149.574 Y156.78 E.05063
G1 X149.04 Y156.78
G1 X150.206 Y157.946 E.05063
G1 X149.672 Y157.946
G1 X148.507 Y156.78 E.05063
G1 X147.974 Y156.78
G1 X149.139 Y157.946 E.05063
G1 X148.606 Y157.946
G1 X147.441 Y156.78 E.05063
G1 X146.907 Y156.78
G1 X148.072 Y157.946 E.05063
G1 X147.539 Y157.946
G1 X146.374 Y156.78 E.05063
G1 X145.841 Y156.78
G1 X147.006 Y157.946 E.05063
G1 X146.473 Y157.946
G1 X145.307 Y156.78 E.05063
G1 X144.774 Y156.78
G1 X145.939 Y157.946 E.05063
G1 X145.406 Y157.946
G1 X144.241 Y156.78 E.05063
G1 X143.708 Y156.78
G1 X144.873 Y157.946 E.05063
G1 X144.34 Y157.946
G1 X143.174 Y156.78 E.05063
G1 X142.641 Y156.78
G1 X143.806 Y157.946 E.05063
G1 X143.273 Y157.946
G1 X142.108 Y156.78 E.05063
G1 X141.575 Y156.78
G1 X142.74 Y157.946 E.05063
G1 X142.207 Y157.946
G1 X141.041 Y156.78 E.05063
G1 X140.508 Y156.78
G1 X141.673 Y157.946 E.05063
G1 X141.14 Y157.946
G1 X139.975 Y156.78 E.05063
G1 X139.442 Y156.78
G1 X140.607 Y157.946 E.05063
G1 X140.074 Y157.946
G1 X138.908 Y156.78 E.05063
G1 X138.375 Y156.78
G1 X139.54 Y157.946 E.05063
G1 X139.007 Y157.946
G1 X137.842 Y156.78 E.05063
G1 X137.309 Y156.78
G1 X138.474 Y157.946 E.05063
G1 X137.941 Y157.946
G1 X136.775 Y156.78 E.05063
G1 X136.242 Y156.78
G1 X137.407 Y157.946 E.05063
G1 X136.874 Y157.946
G1 X135.709 Y156.78 E.05063
G1 X135.522 Y157.127
G1 X136.341 Y157.946 E.0356
; WIPE_START
M204 S5000
G1 X135.522 Y157.127 E-.44021
G1 X135.709 Y156.78 E-.14951
G1 X136.026 Y157.097 E-.17028
; WIPE_END
G1 E-.04 F1800
G1 X129.393 Y160.873 Z1.8 F15000
G1 X95.649 Y180.083 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X95.649 Y158.346 E.77983
G3 X95.535 Y158.143 I.151 J-.217 E.00865
G1 X95.208 Y158.143 E.01173
G1 X95.208 Y180.083 E.78713
G1 X95.589 Y180.083 E.01364
G1 X96.057 Y180.492 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X96.057 Y158.155 E.68632
G1 X95.921 Y158.049 E.00532
G1 X95.854 Y157.734 E.00989
G1 X94.8 Y157.734 E.03239
G1 X94.8 Y180.492 E.69926
G1 X95.997 Y180.492 E.0368
G1 X96.434 Y180.869 F15000
G1 F4800
G1 X96.434 Y157.986 E.70311
G1 X96.253 Y157.871 E.00659
G1 X96.231 Y157.357 E.01582
G1 X94.423 Y157.357 E.05556
G1 X94.423 Y180.869 E.72243
G1 X96.374 Y180.869 E.05997
; OBJECT_ID: 118
; WIPE_START
G1 X94.423 Y180.869 E-.74166
G1 X94.423 Y180.821 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 118
M624 AgAAAAAAAAA=
G1 X97.531 Y173.85 Z1.8 F15000
G1 X155.58 Y43.693 Z1.8
G1 Z1.4
M73 P80 R3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X155.58 Y82.166 E1.27621
G1 X154.784 Y82.166 E.0264
G1 X154.784 Y40.897 E1.36895
G1 X179.08 Y40.897 E.80594
G1 X179.08 Y43.693 E.09274
G1 X155.64 Y43.693 E.77755
M204 S250
G1 X155.972 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X155.972 Y100.213 E1.72465
G1 X154.392 Y100.213 E.04855
G1 X154.392 Y40.505 E1.83465
G1 X179.472 Y40.505 E.77064
G1 X179.472 Y44.085 E.11
G1 X156.032 Y44.085 E.72025
; WIPE_START
M204 S5000
G1 X156.03 Y46.085 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.182 Y43.49 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.182 Y81.962 E1.2189
; WIPE_START
G1 X155.182 Y79.962 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.765 Y83.208 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X154.946 Y82.389 E.0356
G1 X154.6 Y82.576
G1 X155.765 Y83.741 E.05063
G1 X155.765 Y84.274
G1 X154.6 Y83.109 E.05063
G1 X154.6 Y83.642
G1 X155.765 Y84.808 E.05063
G1 X155.765 Y85.341
G1 X154.6 Y84.176 E.05063
G1 X154.6 Y84.709
G1 X155.765 Y85.874 E.05063
G1 X155.765 Y86.407
G1 X154.6 Y85.242 E.05063
G1 X154.6 Y85.775
G1 X155.765 Y86.941 E.05063
G1 X155.765 Y87.474
G1 X154.6 Y86.309 E.05063
G1 X154.6 Y86.842
G1 X155.765 Y88.007 E.05063
G1 X155.765 Y88.54
G1 X154.6 Y87.375 E.05063
G1 X154.6 Y87.908
G1 X155.765 Y89.074 E.05063
G1 X155.765 Y89.607
G1 X154.6 Y88.442 E.05063
G1 X154.6 Y88.975
G1 X155.765 Y90.14 E.05063
G1 X155.765 Y90.673
G1 X154.6 Y89.508 E.05063
G1 X154.6 Y90.041
G1 X155.765 Y91.207 E.05063
G1 X155.765 Y91.74
G1 X154.6 Y90.575 E.05063
G1 X154.6 Y91.108
G1 X155.765 Y92.273 E.05063
G1 X155.765 Y92.806
G1 X154.6 Y91.641 E.05063
G1 X154.6 Y92.174
G1 X155.765 Y93.34 E.05063
G1 X155.765 Y93.873
G1 X154.6 Y92.708 E.05063
G1 X154.6 Y93.241
G1 X155.765 Y94.406 E.05063
G1 X155.765 Y94.939
G1 X154.6 Y93.774 E.05063
G1 X154.6 Y94.307
G1 X155.765 Y95.473 E.05063
G1 X155.765 Y96.006
G1 X154.6 Y94.841 E.05063
G1 X154.6 Y95.374
G1 X155.765 Y96.539 E.05063
G1 X155.765 Y97.072
G1 X154.6 Y95.907 E.05063
G1 X154.6 Y96.441
G1 X155.765 Y97.606 E.05063
G1 X155.765 Y98.139
G1 X154.6 Y96.974 E.05063
G1 X154.6 Y97.507
G1 X155.765 Y98.672 E.05063
G1 X155.765 Y99.206
G1 X154.6 Y98.04 E.05063
G1 X154.6 Y98.574
G1 X155.765 Y99.739 E.05063
G1 X155.499 Y100.006
G1 X154.6 Y99.107 E.03907
G1 X154.6 Y99.64
G1 X154.965 Y100.006 E.01589
; WIPE_START
M204 S5000
G1 X154.6 Y99.64 E-.19655
G1 X154.6 Y99.107 E-.20264
G1 X155.271 Y99.778 E-.36081
; WIPE_END
G1 E-.04 F1800
G1 X158.076 Y92.68 Z1.8 F15000
G1 X177.902 Y42.516 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48319
G1 F4800
G1 X177.902 Y42.075 E.0158
G1 X155.962 Y42.075 E.78714
G1 X155.962 Y42.402 E.01173
G1 X156.146 Y42.478 E.00712
G1 X156.166 Y42.516 E.00152
G1 X177.842 Y42.516 E.77769
G1 X178.311 Y42.924 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X178.311 Y41.667 E.03864
G1 X155.554 Y41.667 E.69926
G1 X155.554 Y42.721 E.03239
G1 X155.918 Y42.817 E.01157
G1 X155.975 Y42.924 E.00373
G1 X178.251 Y42.924 E.68448
G1 X178.688 Y43.301 F15000
G1 F4800
G1 X178.688 Y41.289 E.06181
G1 X155.176 Y41.29 E.72243
G1 X155.176 Y43.098 E.05556
G1 X155.691 Y43.12 E.01582
G1 X155.805 Y43.301 E.00659
G1 X178.628 Y43.301 E.70127
; WIPE_START
G1 X176.628 Y43.301 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X184.26 Y43.4 Z1.8 F15000
G1 X206.784 Y43.693 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X183.284 Y43.693 E.77954
G1 X183.284 Y40.897 E.09274
G1 X207.58 Y40.897 E.80594
G1 X207.58 Y82.166 E1.36895
G1 X206.784 Y82.166 E.0264
G1 X206.784 Y43.753 E1.27422
M204 S250
G1 X206.392 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X182.892 Y44.085 E.72209
G1 X182.892 Y40.505 E.11
G1 X207.972 Y40.505 E.77064
G1 X207.972 Y100.213 E1.83465
G1 X206.392 Y100.213 E.04855
G1 X206.392 Y44.145 E1.72281
; WIPE_START
M204 S5000
G1 X204.392 Y44.14 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.182 Y43.49 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X207.182 Y81.962 E1.2189
G1 X207.205 Y82.389 F15000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
M73 P81 R3
G1 X207.765 Y82.949 E.02434
G1 X207.765 Y83.482
G1 X206.672 Y82.389 E.04751
G1 X206.6 Y82.85
G1 X207.765 Y84.015 E.05063
G1 X207.765 Y84.548
G1 X206.6 Y83.383 E.05063
G1 X206.6 Y83.916
G1 X207.765 Y85.082 E.05063
G1 X207.765 Y85.615
G1 X206.6 Y84.45 E.05063
G1 X206.6 Y84.983
G1 X207.765 Y86.148 E.05063
G1 X207.765 Y86.681
G1 X206.6 Y85.516 E.05063
G1 X206.6 Y86.049
G1 X207.765 Y87.215 E.05063
G1 X207.765 Y87.748
G1 X206.6 Y86.583 E.05063
G1 X206.6 Y87.116
G1 X207.765 Y88.281 E.05063
G1 X207.765 Y88.814
G1 X206.6 Y87.649 E.05063
G1 X206.6 Y88.182
G1 X207.765 Y89.348 E.05063
G1 X207.765 Y89.881
G1 X206.6 Y88.716 E.05063
G1 X206.6 Y89.249
G1 X207.765 Y90.414 E.05063
G1 X207.765 Y90.947
G1 X206.6 Y89.782 E.05063
G1 X206.6 Y90.315
G1 X207.765 Y91.481 E.05063
G1 X207.765 Y92.014
G1 X206.6 Y90.849 E.05063
G1 X206.6 Y91.382
G1 X207.765 Y92.547 E.05063
G1 X207.765 Y93.08
G1 X206.6 Y91.915 E.05063
G1 X206.6 Y92.448
G1 X207.765 Y93.614 E.05063
G1 X207.765 Y94.147
G1 X206.6 Y92.982 E.05063
G1 X206.6 Y93.515
G1 X207.765 Y94.68 E.05063
G1 X207.765 Y95.213
G1 X206.6 Y94.048 E.05063
G1 X206.6 Y94.582
G1 X207.765 Y95.747 E.05063
G1 X207.765 Y96.28
G1 X206.6 Y95.115 E.05063
G1 X206.6 Y95.648
G1 X207.765 Y96.813 E.05063
G1 X207.765 Y97.347
G1 X206.6 Y96.181 E.05063
G1 X206.6 Y96.715
G1 X207.765 Y97.88 E.05063
G1 X207.765 Y98.413
G1 X206.6 Y97.248 E.05063
G1 X206.6 Y97.781
G1 X207.765 Y98.946 E.05063
G1 X207.765 Y99.48
G1 X206.6 Y98.314 E.05063
G1 X206.6 Y98.848
G1 X207.758 Y100.006 E.05033
G1 X207.225 Y100.006
G1 X206.6 Y99.381 E.02716
; WIPE_START
M204 S5000
G1 X207.225 Y100.006 E-.33585
G1 X207.758 Y100.006 E-.20264
G1 X207.346 Y99.594 E-.22151
; WIPE_END
G1 E-.04 F1800
G1 X204.506 Y92.509 Z1.8 F15000
G1 X184.462 Y42.516 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X206.199 Y42.516 E.77983
G3 X206.403 Y42.402 I.217 J.151 E.00865
G1 X206.403 Y42.075 E.01173
G1 X184.462 Y42.075 E.78713
G1 X184.462 Y42.456 E.01364
G1 X184.054 Y42.924 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X206.39 Y42.924 E.68632
G1 X206.496 Y42.788 E.00532
G1 X206.811 Y42.721 E.00989
G1 X206.811 Y41.667 E.03239
G1 X184.054 Y41.667 E.69926
G1 X184.054 Y42.864 E.0368
G1 X183.677 Y43.301 F15000
G1 F4800
G1 X206.574 Y43.301 E.70357
G1 X206.674 Y43.12 E.00635
G1 X207.188 Y43.098 E.01582
G1 X207.188 Y41.289 E.05556
G1 X183.677 Y41.29 E.72243
G1 X183.677 Y43.241 E.05997
; OBJECT_ID: 140
; WIPE_START
G1 X183.677 Y41.29 E-.74166
G1 X183.725 Y41.29 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 118
M625
; start printing object, unique label id: 140
M624 BAAAAAAAAAA=
G1 X176.094 Y41.447 Z1.8 F15000
G1 X73.142 Y43.569 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X73.142 Y82.042 E1.27621
G1 X72.346 Y82.042 E.0264
G1 X72.346 Y40.773 E1.36895
G1 X96.642 Y40.773 E.80594
G1 X96.642 Y43.569 E.09274
G1 X73.202 Y43.569 E.77755
M204 S250
G1 X73.534 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X73.534 Y100.089 E1.72465
G1 X71.954 Y100.089 E.04855
G1 X71.954 Y40.381 E1.83465
G1 X97.034 Y40.381 E.77064
G1 X97.034 Y43.961 E.11
G1 X73.594 Y43.961 E.72025
; WIPE_START
M204 S5000
G1 X73.592 Y45.961 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X72.744 Y43.366 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X72.744 Y81.838 E1.2189
; WIPE_START
G1 X72.744 Y79.838 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X73.326 Y83.084 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X72.507 Y82.264 E.0356
G1 X72.161 Y82.452
G1 X73.326 Y83.617 E.05063
G1 X73.326 Y84.15
G1 X72.161 Y82.985 E.05063
G1 X72.161 Y83.518
G1 X73.326 Y84.684 E.05063
G1 X73.326 Y85.217
G1 X72.161 Y84.052 E.05063
G1 X72.161 Y84.585
G1 X73.326 Y85.75 E.05063
G1 X73.326 Y86.283
G1 X72.161 Y85.118 E.05063
G1 X72.161 Y85.651
M73 P82 R3
G1 X73.326 Y86.817 E.05063
G1 X73.326 Y87.35
G1 X72.161 Y86.185 E.05063
G1 X72.161 Y86.718
G1 X73.326 Y87.883 E.05063
G1 X73.326 Y88.416
G1 X72.161 Y87.251 E.05063
G1 X72.161 Y87.784
G1 X73.326 Y88.95 E.05063
G1 X73.326 Y89.483
G1 X72.161 Y88.318 E.05063
G1 X72.161 Y88.851
G1 X73.326 Y90.016 E.05063
G1 X73.326 Y90.549
G1 X72.161 Y89.384 E.05063
G1 X72.161 Y89.917
G1 X73.326 Y91.083 E.05063
G1 X73.326 Y91.616
G1 X72.161 Y90.451 E.05063
G1 X72.161 Y90.984
G1 X73.326 Y92.149 E.05063
G1 X73.326 Y92.682
G1 X72.161 Y91.517 E.05063
G1 X72.161 Y92.05
G1 X73.326 Y93.216 E.05063
G1 X73.326 Y93.749
G1 X72.161 Y92.584 E.05063
G1 X72.161 Y93.117
G1 X73.326 Y94.282 E.05063
G1 X73.326 Y94.815
G1 X72.161 Y93.65 E.05063
G1 X72.161 Y94.183
G1 X73.326 Y95.349 E.05063
G1 X73.326 Y95.882
G1 X72.161 Y94.717 E.05063
G1 X72.161 Y95.25
G1 X73.326 Y96.415 E.05063
G1 X73.326 Y96.948
G1 X72.161 Y95.783 E.05063
G1 X72.161 Y96.316
G1 X73.326 Y97.482 E.05063
G1 X73.326 Y98.015
G1 X72.161 Y96.85 E.05063
G1 X72.161 Y97.383
G1 X73.326 Y98.548 E.05063
G1 X73.326 Y99.081
G1 X72.161 Y97.916 E.05063
G1 X72.161 Y98.45
G1 X73.326 Y99.615 E.05063
G1 X73.06 Y99.882
G1 X72.161 Y98.983 E.03907
G1 X72.161 Y99.516
G1 X72.527 Y99.882 E.01589
; WIPE_START
M204 S5000
G1 X72.161 Y99.516 E-.19655
G1 X72.161 Y98.983 E-.20264
G1 X72.832 Y99.654 E-.36081
; WIPE_END
G1 E-.04 F1800
G1 X75.638 Y92.556 Z1.8 F15000
G1 X95.464 Y42.391 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48319
G1 F4800
G1 X95.464 Y41.951 E.0158
G1 X73.524 Y41.951 E.78714
G1 X73.524 Y42.278 E.01173
G1 X73.707 Y42.354 E.00712
G1 X73.727 Y42.391 E.00152
G1 X95.404 Y42.391 E.77769
G1 X95.872 Y42.8 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X95.872 Y41.543 E.03864
G1 X73.115 Y41.543 E.69926
G1 X73.115 Y42.597 E.03239
G1 X73.479 Y42.693 E.01157
G1 X73.536 Y42.8 E.00373
G1 X95.812 Y42.8 E.68448
G1 X96.25 Y43.177 F15000
G1 F4800
G1 X96.25 Y41.165 E.06181
G1 X72.738 Y41.165 E.72243
G1 X72.738 Y42.974 E.05556
G1 X73.252 Y42.996 E.01582
G1 X73.367 Y43.177 E.00659
G1 X96.19 Y43.177 E.70127
; WIPE_START
G1 X94.19 Y43.177 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.821 Y43.276 Z1.8 F15000
G1 X124.346 Y43.569 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X100.846 Y43.569 E.77954
G1 X100.846 Y40.773 E.09274
G1 X125.142 Y40.773 E.80594
G1 X125.142 Y82.042 E1.36895
G1 X124.346 Y82.042 E.0264
G1 X124.346 Y43.629 E1.27422
M204 S250
G1 X123.954 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X100.454 Y43.961 E.72209
G1 X100.454 Y40.381 E.11
G1 X125.534 Y40.381 E.77064
G1 X125.534 Y100.089 E1.83465
G1 X123.954 Y100.089 E.04855
G1 X123.954 Y44.021 E1.72281
; WIPE_START
M204 S5000
G1 X121.954 Y44.016 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.744 Y43.366 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X124.744 Y81.838 E1.2189
G1 X124.766 Y82.264 F15000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X125.326 Y82.825 E.02434
G1 X125.326 Y83.358
G1 X124.233 Y82.264 E.04751
G1 X124.161 Y82.726
G1 X125.326 Y83.891 E.05063
G1 X125.326 Y84.424
G1 X124.161 Y83.259 E.05063
G1 X124.161 Y83.792
G1 X125.326 Y84.958 E.05063
G1 X125.326 Y85.491
G1 X124.161 Y84.326 E.05063
G1 X124.161 Y84.859
G1 X125.326 Y86.024 E.05063
G1 X125.326 Y86.557
G1 X124.161 Y85.392 E.05063
G1 X124.161 Y85.925
G1 X125.326 Y87.091 E.05063
G1 X125.326 Y87.624
G1 X124.161 Y86.459 E.05063
G1 X124.161 Y86.992
G1 X125.326 Y88.157 E.05063
G1 X125.326 Y88.69
G1 X124.161 Y87.525 E.05063
G1 X124.161 Y88.058
G1 X125.326 Y89.224 E.05063
G1 X125.326 Y89.757
G1 X124.161 Y88.592 E.05063
G1 X124.161 Y89.125
G1 X125.326 Y90.29 E.05063
G1 X125.326 Y90.823
G1 X124.161 Y89.658 E.05063
M73 P83 R3
G1 X124.161 Y90.191
G1 X125.326 Y91.357 E.05063
G1 X125.326 Y91.89
G1 X124.161 Y90.725 E.05063
G1 X124.161 Y91.258
G1 X125.326 Y92.423 E.05063
G1 X125.326 Y92.956
G1 X124.161 Y91.791 E.05063
G1 X124.161 Y92.324
G1 X125.326 Y93.49 E.05063
G1 X125.326 Y94.023
G1 X124.161 Y92.858 E.05063
G1 X124.161 Y93.391
G1 X125.326 Y94.556 E.05063
G1 X125.326 Y95.089
G1 X124.161 Y93.924 E.05063
G1 X124.161 Y94.457
G1 X125.326 Y95.623 E.05063
G1 X125.326 Y96.156
G1 X124.161 Y94.991 E.05063
G1 X124.161 Y95.524
G1 X125.326 Y96.689 E.05063
G1 X125.326 Y97.222
G1 X124.161 Y96.057 E.05063
G1 X124.161 Y96.591
G1 X125.326 Y97.756 E.05063
G1 X125.326 Y98.289
G1 X124.161 Y97.124 E.05063
G1 X124.161 Y97.657
G1 X125.326 Y98.822 E.05063
G1 X125.326 Y99.356
G1 X124.161 Y98.19 E.05063
G1 X124.161 Y98.724
G1 X125.319 Y99.882 E.05033
G1 X124.786 Y99.882
G1 X124.161 Y99.257 E.02716
; WIPE_START
M204 S5000
G1 X124.786 Y99.882 E-.33585
G1 X125.319 Y99.882 E-.20264
G1 X124.907 Y99.47 E-.22151
; WIPE_END
G1 E-.04 F1800
G1 X122.067 Y92.385 Z1.8 F15000
G1 X102.024 Y42.391 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X123.76 Y42.391 E.77983
G3 X123.964 Y42.278 I.217 J.151 E.00865
G1 X123.964 Y41.951 E.01173
G1 X102.024 Y41.951 E.78713
G1 X102.024 Y42.331 E.01364
G1 X101.615 Y42.8 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X123.951 Y42.8 E.68632
G1 X124.058 Y42.663 E.00532
G1 X124.372 Y42.597 E.00989
G1 X124.372 Y41.543 E.03239
G1 X101.615 Y41.543 E.69926
G1 X101.615 Y42.74 E.0368
G1 X101.238 Y43.177 F15000
G1 F4800
G1 X124.136 Y43.177 E.70357
G1 X124.235 Y42.996 E.00635
G1 X124.75 Y42.974 E.01582
G1 X124.75 Y41.165 E.05556
G1 X101.238 Y41.165 E.72243
G1 X101.238 Y43.117 E.05997
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4800
G1 X101.238 Y41.165 E-.74166
G1 X101.286 Y41.165 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
; layer num/total_layer_count: 8/10
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I1.217 J0 P1  F15000
; object ids of layer 8 start: 81,118,140
M624 BwAAAAAAAAA=
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
; object ids of this layer8 end: 81,118,140
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X97.219 Y208.965
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X118.12 Y208.965 E.69333
G1 X118.12 Y209.761 E.0264
G1 X94.031 Y209.761 E.79908
G1 X94.031 Y185.465 E.80594
G1 X96.826 Y185.465 E.09274
G1 X96.826 Y208.965 E.77954
G1 X97.159 Y208.965 E.01102
M204 S250
G1 X97.219 Y208.573 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X136.167 Y208.573 E1.19678
G1 X136.167 Y210.153 E.04855
G1 X93.639 Y210.153 E1.30678
G1 X93.639 Y185.073 E.77064
G1 X97.219 Y185.073 E.11
G1 X97.219 Y208.513 E.72025
; WIPE_START
M204 S5000
G1 X99.219 Y208.516 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y209.363 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
M73 P83 R2
G1 X117.916 Y209.363 E.67462
; WIPE_START
G1 X115.916 Y209.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.545 Y209.594 Z2 F15000
G1 X135.176 Y209.946 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X135.96 Y209.162 E.03407
G1 X135.808 Y208.78
G1 X134.642 Y209.946 E.05063
G1 X134.109 Y209.946
G1 X135.274 Y208.78 E.05063
G1 X134.741 Y208.78
G1 X133.576 Y209.946 E.05063
G1 X133.043 Y209.946
G1 X134.208 Y208.78 E.05063
G1 X133.675 Y208.78
G1 X132.509 Y209.946 E.05063
G1 X131.976 Y209.946
G1 X133.141 Y208.78 E.05063
G1 X132.608 Y208.78
G1 X131.443 Y209.946 E.05063
G1 X130.91 Y209.946
G1 X132.075 Y208.78 E.05063
G1 X131.541 Y208.78
G1 X130.376 Y209.946 E.05063
G1 X129.843 Y209.946
G1 X131.008 Y208.78 E.05063
G1 X130.475 Y208.78
G1 X129.31 Y209.946 E.05063
G1 X128.776 Y209.946
G1 X129.942 Y208.78 E.05063
G1 X129.408 Y208.78
G1 X128.243 Y209.946 E.05063
G1 X127.71 Y209.946
G1 X128.875 Y208.78 E.05063
G1 X128.342 Y208.78
G1 X127.177 Y209.946 E.05063
G1 X126.643 Y209.946
G1 X127.809 Y208.78 E.05063
M73 P84 R2
G1 X127.275 Y208.78
G1 X126.11 Y209.946 E.05063
G1 X125.577 Y209.946
G1 X126.742 Y208.78 E.05063
G1 X126.209 Y208.78
G1 X125.044 Y209.946 E.05063
G1 X124.51 Y209.946
G1 X125.676 Y208.78 E.05063
G1 X125.142 Y208.78
G1 X123.977 Y209.946 E.05063
G1 X123.444 Y209.946
G1 X124.609 Y208.78 E.05063
G1 X124.076 Y208.78
G1 X122.911 Y209.946 E.05063
G1 X122.377 Y209.946
G1 X123.543 Y208.78 E.05063
G1 X123.009 Y208.78
G1 X121.844 Y209.946 E.05063
G1 X121.311 Y209.946
G1 X122.476 Y208.78 E.05063
G1 X121.943 Y208.78
G1 X120.778 Y209.946 E.05063
G1 X120.244 Y209.946
G1 X121.41 Y208.78 E.05063
G1 X120.876 Y208.78
G1 X119.711 Y209.946 E.05063
G1 X119.178 Y209.946
G1 X120.343 Y208.78 E.05063
G1 X119.81 Y208.78
G1 X118.645 Y209.946 E.05063
G1 X118.342 Y209.715
G1 X119.277 Y208.78 E.0406
G1 X118.743 Y208.78
G1 X118.342 Y209.181 E.01743
; WIPE_START
M204 S5000
G1 X118.743 Y208.78 E-.2155
G1 X119.277 Y208.78 E-.20264
G1 X118.64 Y209.417 E-.34186
; WIPE_END
G1 E-.04 F1800
G1 X113.218 Y204.045 Z2 F15000
G1 X95.649 Y186.643 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X95.208 Y186.643 E.0158
G1 X95.208 Y208.583 E.78713
G1 X95.535 Y208.583 E.01173
G1 X95.611 Y208.4 E.00712
G1 X95.649 Y208.38 E.00152
G1 X95.649 Y186.703 E.77768
G1 X96.057 Y186.234 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X94.8 Y186.234 E.03864
G1 X94.8 Y208.992 E.69926
G1 X95.854 Y208.992 E.03239
G1 X95.95 Y208.628 E.01157
G1 X96.057 Y208.571 E.00373
G1 X96.057 Y186.294 E.68448
G1 X96.434 Y185.857 F15000
G1 F4800
G1 X94.423 Y185.857 E.06181
G1 X94.423 Y209.369 E.72243
G1 X96.231 Y209.369 E.05556
G1 X96.253 Y208.855 E.01582
G1 X96.434 Y208.74 E.00659
G1 X96.434 Y185.917 E.70127
; WIPE_START
G1 X96.434 Y187.917 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.534 Y180.285 Z2 F15000
G1 X96.826 Y157.761 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X96.826 Y181.261 E.77954
G1 X94.031 Y181.261 E.09274
G1 X94.031 Y156.965 E.80594
G1 X118.12 Y156.965 E.79908
G1 X118.12 Y157.761 E.0264
G1 X96.886 Y157.761 E.70435
M204 S250
G1 X97.219 Y158.153 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.219 Y181.653 E.72209
G1 X93.639 Y181.653 E.11
G1 X93.639 Y156.573 E.77064
G1 X136.167 Y156.573 E1.30678
G1 X136.167 Y158.153 E.04855
G1 X97.279 Y158.153 E1.19493
; WIPE_START
M204 S5000
G1 X97.273 Y160.153 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y157.363 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X117.916 Y157.363 E.67462
; WIPE_START
G1 X115.916 Y157.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.549 Y157.391 Z2 F15000
G1 X135.96 Y157.436 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X135.45 Y157.946 E.02216
G1 X134.916 Y157.946
G1 X135.96 Y156.902 E.04533
G1 X135.548 Y156.78
G1 X134.383 Y157.946 E.05063
G1 X133.85 Y157.946
G1 X135.015 Y156.78 E.05063
G1 X134.482 Y156.78
G1 X133.317 Y157.946 E.05063
G1 X132.783 Y157.946
G1 X133.949 Y156.78 E.05063
G1 X133.415 Y156.78
G1 X132.25 Y157.946 E.05063
G1 X131.717 Y157.946
G1 X132.882 Y156.78 E.05063
G1 X132.349 Y156.78
G1 X131.184 Y157.946 E.05063
G1 X130.65 Y157.946
G1 X131.816 Y156.78 E.05063
G1 X131.282 Y156.78
G1 X130.117 Y157.946 E.05063
G1 X129.584 Y157.946
G1 X130.749 Y156.78 E.05063
G1 X130.216 Y156.78
G1 X129.051 Y157.946 E.05063
G1 X128.517 Y157.946
G1 X129.683 Y156.78 E.05063
G1 X129.149 Y156.78
G1 X127.984 Y157.946 E.05063
G1 X127.451 Y157.946
G1 X128.616 Y156.78 E.05063
G1 X128.083 Y156.78
G1 X126.918 Y157.946 E.05063
G1 X126.384 Y157.946
G1 X127.549 Y156.78 E.05063
G1 X127.016 Y156.78
G1 X125.851 Y157.946 E.05063
G1 X125.318 Y157.946
G1 X126.483 Y156.78 E.05063
G1 X125.95 Y156.78
G1 X124.784 Y157.946 E.05063
G1 X124.251 Y157.946
G1 X125.416 Y156.78 E.05063
G1 X124.883 Y156.78
G1 X123.718 Y157.946 E.05063
G1 X123.185 Y157.946
G1 X124.35 Y156.78 E.05063
G1 X123.817 Y156.78
G1 X122.651 Y157.946 E.05063
G1 X122.118 Y157.946
G1 X123.283 Y156.78 E.05063
G1 X122.75 Y156.78
G1 X121.585 Y157.946 E.05063
G1 X121.052 Y157.946
G1 X122.217 Y156.78 E.05063
G1 X121.684 Y156.78
G1 X120.518 Y157.946 E.05063
G1 X119.985 Y157.946
G1 X121.15 Y156.78 E.05063
G1 X120.617 Y156.78
G1 X119.452 Y157.946 E.05063
G1 X118.919 Y157.946
G1 X120.084 Y156.78 E.05063
G1 X119.551 Y156.78
G1 X118.385 Y157.946 E.05063
G1 X118.342 Y157.455
G1 X119.017 Y156.78 E.02933
; WIPE_START
M204 S5000
G1 X118.342 Y157.455 E-.36277
G1 X118.385 Y157.946 E-.18699
G1 X118.777 Y157.554 E-.21024
; WIPE_END
G1 E-.04 F1800
G1 X113.309 Y162.88 Z2 F15000
G1 X95.649 Y180.083 Z2
G1 Z1.6
M73 P85 R2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X95.649 Y158.346 E.77983
G3 X95.535 Y158.143 I.151 J-.217 E.00865
G1 X95.208 Y158.143 E.01173
G1 X95.208 Y180.083 E.78713
G1 X95.589 Y180.083 E.01364
G1 X96.057 Y180.492 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X96.057 Y158.155 E.68632
G1 X95.921 Y158.049 E.00532
G1 X95.854 Y157.734 E.00989
G1 X94.8 Y157.734 E.03239
G1 X94.8 Y180.492 E.69926
G1 X95.997 Y180.492 E.0368
G1 X96.434 Y180.869 F15000
G1 F4800
G1 X96.434 Y157.986 E.70311
G1 X96.253 Y157.871 E.00659
G1 X96.231 Y157.357 E.01582
G1 X94.423 Y157.357 E.05556
G1 X94.423 Y180.869 E.72243
G1 X96.374 Y180.869 E.05997
; OBJECT_ID: 118
; WIPE_START
G1 X94.423 Y180.869 E-.74166
G1 X94.423 Y180.821 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 118
M624 AgAAAAAAAAA=
G1 X97.531 Y173.85 Z2 F15000
G1 X155.58 Y43.693 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X155.58 Y64.987 E.70634
G1 X154.784 Y64.987 E.0264
G1 X154.784 Y40.897 E.79908
G1 X179.08 Y40.897 E.80594
G1 X179.08 Y43.693 E.09274
G1 X155.64 Y43.693 E.77755
M204 S250
G1 X155.972 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X155.972 Y83.034 E1.19678
G1 X154.392 Y83.034 E.04855
G1 X154.392 Y40.505 E1.30678
G1 X179.472 Y40.505 E.77064
G1 X179.472 Y44.085 E.11
G1 X156.032 Y44.085 E.72025
; WIPE_START
M204 S5000
G1 X156.029 Y46.085 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.182 Y43.49 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.182 Y64.783 E.67462
; WIPE_START
G1 X155.182 Y62.783 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.21 Y70.416 Z2 F15000
G1 X155.255 Y82.826 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X155.765 Y82.316 E.02216
G1 X155.765 Y81.783
G1 X154.722 Y82.826 E.04533
G1 X154.6 Y82.415
G1 X155.765 Y81.25 E.05063
G1 X155.765 Y80.717
G1 X154.6 Y81.882 E.05063
G1 X154.6 Y81.349
G1 X155.765 Y80.183 E.05063
G1 X155.765 Y79.65
G1 X154.6 Y80.815 E.05063
G1 X154.6 Y80.282
G1 X155.765 Y79.117 E.05063
G1 X155.765 Y78.584
G1 X154.6 Y79.749 E.05063
G1 X154.6 Y79.216
G1 X155.765 Y78.05 E.05063
G1 X155.765 Y77.517
G1 X154.6 Y78.682 E.05063
G1 X154.6 Y78.149
G1 X155.765 Y76.984 E.05063
G1 X155.765 Y76.451
G1 X154.6 Y77.616 E.05063
G1 X154.6 Y77.083
G1 X155.765 Y75.917 E.05063
G1 X155.765 Y75.384
G1 X154.6 Y76.549 E.05063
G1 X154.6 Y76.016
G1 X155.765 Y74.851 E.05063
G1 X155.765 Y74.318
G1 X154.6 Y75.483 E.05063
G1 X154.6 Y74.95
G1 X155.765 Y73.784 E.05063
G1 X155.765 Y73.251
G1 X154.6 Y74.416 E.05063
G1 X154.6 Y73.883
G1 X155.765 Y72.718 E.05063
G1 X155.765 Y72.185
G1 X154.6 Y73.35 E.05063
G1 X154.6 Y72.817
G1 X155.765 Y71.651 E.05063
G1 X155.765 Y71.118
G1 X154.6 Y72.283 E.05063
G1 X154.6 Y71.75
G1 X155.765 Y70.585 E.05063
G1 X155.765 Y70.052
G1 X154.6 Y71.217 E.05063
G1 X154.6 Y70.683
G1 X155.765 Y69.518 E.05063
G1 X155.765 Y68.985
G1 X154.6 Y70.15 E.05063
G1 X154.6 Y69.617
G1 X155.765 Y68.452 E.05063
G1 X155.765 Y67.918
G1 X154.6 Y69.084 E.05063
G1 X154.6 Y68.55
G1 X155.765 Y67.385 E.05063
G1 X155.765 Y66.852
G1 X154.6 Y68.017 E.05063
G1 X154.6 Y67.484
G1 X155.765 Y66.319 E.05063
G1 X155.765 Y65.785
G1 X154.6 Y66.951 E.05063
G1 X154.6 Y66.417
G1 X155.765 Y65.252 E.05063
G1 X155.275 Y65.209
G1 X154.6 Y65.884 E.02933
; WIPE_START
M204 S5000
G1 X155.275 Y65.209 E-.36277
G1 X155.765 Y65.252 E-.18699
G1 X155.374 Y65.643 E-.21024
; WIPE_END
G1 E-.04 F1800
G1 X160.699 Y60.176 Z2 F15000
G1 X177.902 Y42.516 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48319
G1 F4800
G1 X177.902 Y42.075 E.0158
G1 X155.962 Y42.075 E.78714
G1 X155.962 Y42.402 E.01173
G1 X156.146 Y42.478 E.00712
G1 X156.166 Y42.516 E.00152
G1 X177.842 Y42.516 E.77769
G1 X178.311 Y42.924 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X178.311 Y41.667 E.03864
G1 X155.554 Y41.667 E.69926
G1 X155.554 Y42.721 E.03239
G1 X155.918 Y42.817 E.01157
G1 X155.975 Y42.924 E.00373
G1 X178.251 Y42.924 E.68448
G1 X178.688 Y43.301 F15000
G1 F4800
G1 X178.688 Y41.289 E.06181
G1 X155.176 Y41.29 E.72243
G1 X155.176 Y43.098 E.05556
G1 X155.691 Y43.12 E.01582
G1 X155.805 Y43.301 E.00659
G1 X178.628 Y43.301 E.70127
; WIPE_START
G1 X176.628 Y43.301 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X184.26 Y43.4 Z2 F15000
G1 X206.784 Y43.693 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X183.284 Y43.693 E.77954
G1 X183.284 Y40.897 E.09274
G1 X207.58 Y40.897 E.80594
G1 X207.58 Y64.987 E.79908
G1 X206.784 Y64.987 E.0264
G1 X206.784 Y43.753 E.70435
M204 S250
G1 X206.392 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
M73 P86 R2
G1 X182.892 Y44.085 E.72209
G1 X182.892 Y40.505 E.11
G1 X207.972 Y40.505 E.77064
G1 X207.972 Y83.034 E1.30678
G1 X206.392 Y83.034 E.04855
G1 X206.392 Y44.145 E1.19493
; WIPE_START
M204 S5000
G1 X204.392 Y44.14 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.182 Y43.49 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X207.182 Y64.783 E.67462
; WIPE_START
G1 X207.182 Y62.783 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.413 Y70.412 Z2 F15000
G1 X207.765 Y82.042 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X206.981 Y82.826 E.03407
G1 X206.6 Y82.674
G1 X207.765 Y81.509 E.05063
G1 X207.765 Y80.976
G1 X206.6 Y82.141 E.05063
G1 X206.6 Y81.608
G1 X207.765 Y80.443 E.05063
G1 X207.765 Y79.909
G1 X206.6 Y81.075 E.05063
G1 X206.6 Y80.541
G1 X207.765 Y79.376 E.05063
G1 X207.765 Y78.843
G1 X206.6 Y80.008 E.05063
G1 X206.6 Y79.475
G1 X207.765 Y78.31 E.05063
G1 X207.765 Y77.776
G1 X206.6 Y78.942 E.05063
G1 X206.6 Y78.408
G1 X207.765 Y77.243 E.05063
G1 X207.765 Y76.71
G1 X206.6 Y77.875 E.05063
G1 X206.6 Y77.342
G1 X207.765 Y76.177 E.05063
G1 X207.765 Y75.643
G1 X206.6 Y76.809 E.05063
G1 X206.6 Y76.275
G1 X207.765 Y75.11 E.05063
G1 X207.765 Y74.577
G1 X206.6 Y75.742 E.05063
G1 X206.6 Y75.209
G1 X207.765 Y74.044 E.05063
G1 X207.765 Y73.51
G1 X206.6 Y74.676 E.05063
G1 X206.6 Y74.142
G1 X207.765 Y72.977 E.05063
G1 X207.765 Y72.444
G1 X206.6 Y73.609 E.05063
G1 X206.6 Y73.076
G1 X207.765 Y71.911 E.05063
G1 X207.765 Y71.377
G1 X206.6 Y72.543 E.05063
G1 X206.6 Y72.009
G1 X207.765 Y70.844 E.05063
G1 X207.765 Y70.311
G1 X206.6 Y71.476 E.05063
G1 X206.6 Y70.943
G1 X207.765 Y69.778 E.05063
G1 X207.765 Y69.244
G1 X206.6 Y70.409 E.05063
G1 X206.6 Y69.876
G1 X207.765 Y68.711 E.05063
G1 X207.765 Y68.178
G1 X206.6 Y69.343 E.05063
G1 X206.6 Y68.81
G1 X207.765 Y67.644 E.05063
G1 X207.765 Y67.111
G1 X206.6 Y68.276 E.05063
G1 X206.6 Y67.743
G1 X207.765 Y66.578 E.05063
G1 X207.765 Y66.045
G1 X206.6 Y67.21 E.05063
G1 X206.6 Y66.677
G1 X207.765 Y65.511 E.05063
G1 X207.534 Y65.209
G1 X206.6 Y66.143 E.0406
G1 X206.6 Y65.61
G1 X207.001 Y65.209 E.01743
; WIPE_START
M204 S5000
G1 X206.6 Y65.61 E-.21551
G1 X206.6 Y66.143 E-.20264
G1 X207.236 Y65.507 E-.34185
; WIPE_END
G1 E-.04 F1800
G1 X201.865 Y60.085 Z2 F15000
G1 X184.462 Y42.516 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X206.199 Y42.516 E.77983
G3 X206.403 Y42.402 I.217 J.151 E.00865
G1 X206.403 Y42.075 E.01173
G1 X184.462 Y42.075 E.78713
G1 X184.462 Y42.456 E.01364
G1 X184.054 Y42.924 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X206.39 Y42.924 E.68632
G1 X206.496 Y42.788 E.00532
G1 X206.811 Y42.721 E.00989
G1 X206.811 Y41.667 E.03239
G1 X184.054 Y41.667 E.69926
G1 X184.054 Y42.864 E.0368
G1 X183.677 Y43.301 F15000
G1 F4800
G1 X206.574 Y43.301 E.70357
G1 X206.674 Y43.12 E.00635
G1 X207.188 Y43.098 E.01582
G1 X207.188 Y41.289 E.05556
G1 X183.677 Y41.29 E.72243
G1 X183.677 Y43.241 E.05997
; OBJECT_ID: 140
; WIPE_START
G1 X183.677 Y41.29 E-.74166
G1 X183.725 Y41.29 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 118
M625
; start printing object, unique label id: 140
M624 BAAAAAAAAAA=
G1 X176.094 Y41.447 Z2 F15000
G1 X73.142 Y43.569 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X73.142 Y64.863 E.70634
G1 X72.346 Y64.863 E.0264
G1 X72.346 Y40.773 E.79908
G1 X96.642 Y40.773 E.80594
G1 X96.642 Y43.569 E.09274
G1 X73.202 Y43.569 E.77755
M204 S250
G1 X73.534 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X73.534 Y82.91 E1.19678
G1 X71.954 Y82.91 E.04855
G1 X71.954 Y40.381 E1.30678
G1 X97.034 Y40.381 E.77064
G1 X97.034 Y43.961 E.11
G1 X73.594 Y43.961 E.72025
; WIPE_START
M204 S5000
G1 X73.591 Y45.961 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X72.744 Y43.366 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X72.744 Y64.659 E.67462
; WIPE_START
G1 X72.744 Y62.659 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X72.771 Y70.291 Z2 F15000
G1 X72.816 Y82.702 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X73.326 Y82.192 E.02216
G1 X73.326 Y81.659
G1 X72.283 Y82.702 E.04533
G1 X72.161 Y82.291
G1 X73.326 Y81.126 E.05063
G1 X73.326 Y80.593
G1 X72.161 Y81.758 E.05063
G1 X72.161 Y81.225
G1 X73.326 Y80.059 E.05063
G1 X73.326 Y79.526
G1 X72.161 Y80.691 E.05063
G1 X72.161 Y80.158
G1 X73.326 Y78.993 E.05063
M73 P87 R2
G1 X73.326 Y78.46
G1 X72.161 Y79.625 E.05063
G1 X72.161 Y79.092
G1 X73.326 Y77.926 E.05063
G1 X73.326 Y77.393
G1 X72.161 Y78.558 E.05063
G1 X72.161 Y78.025
G1 X73.326 Y76.86 E.05063
G1 X73.326 Y76.327
G1 X72.161 Y77.492 E.05063
G1 X72.161 Y76.959
G1 X73.326 Y75.793 E.05063
G1 X73.326 Y75.26
G1 X72.161 Y76.425 E.05063
G1 X72.161 Y75.892
G1 X73.326 Y74.727 E.05063
G1 X73.326 Y74.194
G1 X72.161 Y75.359 E.05063
G1 X72.161 Y74.826
G1 X73.326 Y73.66 E.05063
G1 X73.326 Y73.127
G1 X72.161 Y74.292 E.05063
G1 X72.161 Y73.759
G1 X73.326 Y72.594 E.05063
G1 X73.326 Y72.061
G1 X72.161 Y73.226 E.05063
G1 X72.161 Y72.693
G1 X73.326 Y71.527 E.05063
G1 X73.326 Y70.994
G1 X72.161 Y72.159 E.05063
G1 X72.161 Y71.626
G1 X73.326 Y70.461 E.05063
G1 X73.326 Y69.928
G1 X72.161 Y71.093 E.05063
G1 X72.161 Y70.559
G1 X73.326 Y69.394 E.05063
G1 X73.326 Y68.861
G1 X72.161 Y70.026 E.05063
G1 X72.161 Y69.493
G1 X73.326 Y68.328 E.05063
G1 X73.326 Y67.794
G1 X72.161 Y68.96 E.05063
G1 X72.161 Y68.426
G1 X73.326 Y67.261 E.05063
G1 X73.326 Y66.728
G1 X72.161 Y67.893 E.05063
G1 X72.161 Y67.36
G1 X73.326 Y66.195 E.05063
G1 X73.326 Y65.661
G1 X72.161 Y66.827 E.05063
G1 X72.161 Y66.293
G1 X73.326 Y65.128 E.05063
G1 X72.836 Y65.085
G1 X72.161 Y65.76 E.02933
; WIPE_START
M204 S5000
G1 X72.836 Y65.085 E-.36277
G1 X73.326 Y65.128 E-.18699
G1 X72.935 Y65.519 E-.21024
; WIPE_END
G1 E-.04 F1800
G1 X78.261 Y60.052 Z2 F15000
G1 X95.464 Y42.391 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48319
G1 F4800
G1 X95.464 Y41.951 E.0158
G1 X73.524 Y41.951 E.78714
G1 X73.524 Y42.278 E.01173
G1 X73.707 Y42.354 E.00712
G1 X73.727 Y42.391 E.00152
G1 X95.404 Y42.391 E.77769
G1 X95.872 Y42.8 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X95.872 Y41.543 E.03864
G1 X73.115 Y41.543 E.69926
G1 X73.115 Y42.597 E.03239
G1 X73.479 Y42.693 E.01157
G1 X73.536 Y42.8 E.00373
G1 X95.812 Y42.8 E.68448
G1 X96.25 Y43.177 F15000
G1 F4800
G1 X96.25 Y41.165 E.06181
G1 X72.738 Y41.165 E.72243
G1 X72.738 Y42.974 E.05556
G1 X73.252 Y42.996 E.01582
G1 X73.367 Y43.177 E.00659
G1 X96.19 Y43.177 E.70127
; WIPE_START
G1 X94.19 Y43.177 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.821 Y43.276 Z2 F15000
G1 X124.346 Y43.569 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X100.846 Y43.569 E.77954
G1 X100.846 Y40.773 E.09274
G1 X125.142 Y40.773 E.80594
G1 X125.142 Y64.863 E.79908
G1 X124.346 Y64.863 E.0264
G1 X124.346 Y43.629 E.70435
M204 S250
G1 X123.954 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X100.454 Y43.961 E.72209
G1 X100.454 Y40.381 E.11
G1 X125.534 Y40.381 E.77064
G1 X125.534 Y82.91 E1.30678
G1 X123.954 Y82.91 E.04855
G1 X123.954 Y44.021 E1.19493
; WIPE_START
M204 S5000
G1 X121.954 Y44.016 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.744 Y43.366 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X124.744 Y64.659 E.67462
; WIPE_START
G1 X124.744 Y62.659 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.974 Y70.288 Z2 F15000
G1 X125.326 Y81.918 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X124.542 Y82.702 E.03407
G1 X124.161 Y82.55
G1 X125.326 Y81.385 E.05063
G1 X125.326 Y80.852
G1 X124.161 Y82.017 E.05063
G1 X124.161 Y81.484
G1 X125.326 Y80.319 E.05063
G1 X125.326 Y79.785
G1 X124.161 Y80.951 E.05063
G1 X124.161 Y80.417
G1 X125.326 Y79.252 E.05063
G1 X125.326 Y78.719
G1 X124.161 Y79.884 E.05063
G1 X124.161 Y79.351
G1 X125.326 Y78.186 E.05063
G1 X125.326 Y77.652
G1 X124.161 Y78.818 E.05063
G1 X124.161 Y78.284
G1 X125.326 Y77.119 E.05063
G1 X125.326 Y76.586
G1 X124.161 Y77.751 E.05063
G1 X124.161 Y77.218
G1 X125.326 Y76.053 E.05063
G1 X125.326 Y75.519
G1 X124.161 Y76.685 E.05063
G1 X124.161 Y76.151
G1 X125.326 Y74.986 E.05063
G1 X125.326 Y74.453
G1 X124.161 Y75.618 E.05063
G1 X124.161 Y75.085
G1 X125.326 Y73.92 E.05063
G1 X125.326 Y73.386
G1 X124.161 Y74.552 E.05063
M73 P88 R2
G1 X124.161 Y74.018
G1 X125.326 Y72.853 E.05063
G1 X125.326 Y72.32
G1 X124.161 Y73.485 E.05063
G1 X124.161 Y72.952
G1 X125.326 Y71.787 E.05063
G1 X125.326 Y71.253
G1 X124.161 Y72.418 E.05063
G1 X124.161 Y71.885
G1 X125.326 Y70.72 E.05063
G1 X125.326 Y70.187
G1 X124.161 Y71.352 E.05063
G1 X124.161 Y70.819
G1 X125.326 Y69.653 E.05063
G1 X125.326 Y69.12
G1 X124.161 Y70.285 E.05063
G1 X124.161 Y69.752
G1 X125.326 Y68.587 E.05063
G1 X125.326 Y68.054
G1 X124.161 Y69.219 E.05063
G1 X124.161 Y68.686
G1 X125.326 Y67.52 E.05063
G1 X125.326 Y66.987
G1 X124.161 Y68.152 E.05063
G1 X124.161 Y67.619
G1 X125.326 Y66.454 E.05063
G1 X125.326 Y65.921
G1 X124.161 Y67.086 E.05063
G1 X124.161 Y66.553
G1 X125.326 Y65.387 E.05063
G1 X125.095 Y65.085
G1 X124.161 Y66.019 E.0406
G1 X124.161 Y65.486
G1 X124.562 Y65.085 E.01743
; WIPE_START
M204 S5000
G1 X124.161 Y65.486 E-.21551
G1 X124.161 Y66.019 E-.20264
G1 X124.797 Y65.383 E-.34185
; WIPE_END
G1 E-.04 F1800
G1 X119.426 Y59.961 Z2 F15000
G1 X102.024 Y42.391 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X123.76 Y42.391 E.77983
G3 X123.964 Y42.278 I.217 J.151 E.00865
G1 X123.964 Y41.951 E.01173
G1 X102.024 Y41.951 E.78713
G1 X102.024 Y42.331 E.01364
G1 X101.615 Y42.8 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X123.951 Y42.8 E.68632
G1 X124.058 Y42.663 E.00532
G1 X124.372 Y42.597 E.00989
G1 X124.372 Y41.543 E.03239
G1 X101.615 Y41.543 E.69926
G1 X101.615 Y42.74 E.0368
G1 X101.238 Y43.177 F15000
G1 F4800
G1 X124.136 Y43.177 E.70357
G1 X124.235 Y42.996 E.00635
G1 X124.75 Y42.974 E.01582
G1 X124.75 Y41.165 E.05556
G1 X101.238 Y41.165 E.72243
G1 X101.238 Y43.117 E.05997
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4800
G1 X101.238 Y41.165 E-.74166
G1 X101.286 Y41.165 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
; layer num/total_layer_count: 9/10
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F15000
; object ids of layer 9 start: 81,118,140
M624 BwAAAAAAAAA=
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
; object ids of this layer9 end: 81,118,140
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X97.219 Y208.965
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X100.94 Y208.965 E.12346
G1 X100.94 Y209.761 E.0264
G1 X94.031 Y209.761 E.22921
G1 X94.031 Y185.465 E.80594
G1 X96.826 Y185.465 E.09274
G1 X96.826 Y208.965 E.77954
G1 X97.159 Y208.965 E.01102
M204 S250
G1 X97.219 Y208.573 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X118.988 Y208.573 E.6689
G1 X118.988 Y210.153 E.04855
G1 X93.639 Y210.153 E.77891
G1 X93.639 Y185.073 E.77064
G1 X97.219 Y185.073 E.11
G1 X97.219 Y208.513 E.72025
; WIPE_START
M204 S5000
G1 X99.219 Y208.519 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y209.363 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X100.737 Y209.363 E.13034
; WIPE_START
G1 X98.737 Y209.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.369 Y209.292 Z2.2 F15000
G1 X118.78 Y209.175 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X118.385 Y208.78 E.01716
G1 X117.852 Y208.78
G1 X118.78 Y209.709 E.04033
G1 X118.484 Y209.946
G1 X117.319 Y208.78 E.05063
G1 X116.786 Y208.78
G1 X117.951 Y209.946 E.05063
G1 X117.418 Y209.946
G1 X116.252 Y208.78 E.05063
G1 X115.719 Y208.78
G1 X116.884 Y209.946 E.05063
G1 X116.351 Y209.946
G1 X115.186 Y208.78 E.05063
G1 X114.653 Y208.78
G1 X115.818 Y209.946 E.05063
G1 X115.285 Y209.946
G1 X114.119 Y208.78 E.05063
G1 X113.586 Y208.78
G1 X114.751 Y209.946 E.05063
G1 X114.218 Y209.946
G1 X113.053 Y208.78 E.05063
G1 X112.52 Y208.78
G1 X113.685 Y209.946 E.05063
G1 X113.152 Y209.946
G1 X111.986 Y208.78 E.05063
G1 X111.453 Y208.78
G1 X112.618 Y209.946 E.05063
G1 X112.085 Y209.946
G1 X110.92 Y208.78 E.05063
G1 X110.387 Y208.78
G1 X111.552 Y209.946 E.05063
G1 X111.018 Y209.946
G1 X109.853 Y208.78 E.05063
G1 X109.32 Y208.78
G1 X110.485 Y209.946 E.05063
G1 X109.952 Y209.946
G1 X108.787 Y208.78 E.05063
G1 X108.253 Y208.78
G1 X109.419 Y209.946 E.05063
G1 X108.885 Y209.946
G1 X107.72 Y208.78 E.05063
G1 X107.187 Y208.78
G1 X108.352 Y209.946 E.05063
G1 X107.819 Y209.946
G1 X106.654 Y208.78 E.05063
G1 X106.12 Y208.78
G1 X107.286 Y209.946 E.05063
G1 X106.752 Y209.946
G1 X105.587 Y208.78 E.05063
G1 X105.054 Y208.78
G1 X106.219 Y209.946 E.05063
G1 X105.686 Y209.946
G1 X104.521 Y208.78 E.05063
G1 X103.987 Y208.78
G1 X105.153 Y209.946 E.05063
G1 X104.619 Y209.946
G1 X103.454 Y208.78 E.05063
G1 X102.921 Y208.78
G1 X104.086 Y209.946 E.05063
G1 X103.553 Y209.946
G1 X102.388 Y208.78 E.05063
G1 X101.854 Y208.78
G1 X103.02 Y209.946 E.05063
G1 X102.486 Y209.946
G1 X101.321 Y208.78 E.05063
G1 X101.163 Y209.156
G1 X101.953 Y209.946 E.03434
; WIPE_START
M204 S5000
G1 X101.163 Y209.156 E-.42463
G1 X101.321 Y208.78 E-.15468
M73 P89 R2
G1 X101.657 Y209.117 E-.18068
; WIPE_END
G1 E-.04 F1800
G1 X99.686 Y201.743 Z2.2 F15000
G1 X95.649 Y186.643 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X95.208 Y186.643 E.0158
G1 X95.208 Y208.583 E.78713
G1 X95.535 Y208.583 E.01173
G1 X95.611 Y208.4 E.00712
G1 X95.649 Y208.38 E.00152
G1 X95.649 Y186.703 E.77768
G1 X96.057 Y186.234 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X94.8 Y186.234 E.03864
M73 P89 R1
G1 X94.8 Y208.992 E.69926
G1 X95.854 Y208.992 E.03239
G1 X95.95 Y208.628 E.01157
G1 X96.057 Y208.571 E.00373
G1 X96.057 Y186.294 E.68448
G1 X96.434 Y185.857 F15000
G1 F4800
G1 X94.423 Y185.857 E.06181
G1 X94.423 Y209.369 E.72243
G1 X96.231 Y209.369 E.05556
G1 X96.253 Y208.855 E.01582
G1 X96.434 Y208.74 E.00659
G1 X96.434 Y185.917 E.70127
; WIPE_START
G1 X96.434 Y187.917 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.534 Y180.285 Z2.2 F15000
G1 X96.826 Y157.761 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X96.826 Y181.261 E.77954
G1 X94.031 Y181.261 E.09274
G1 X94.031 Y156.965 E.80594
G1 X100.94 Y156.965 E.22921
G1 X100.94 Y157.761 E.0264
G1 X96.886 Y157.761 E.13448
M204 S250
G1 X97.219 Y158.153 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X97.219 Y181.653 E.72209
G1 X93.639 Y181.653 E.11
G1 X93.639 Y156.573 E.77064
G1 X118.988 Y156.573 E.77891
G1 X118.988 Y158.153 E.04855
G1 X97.279 Y158.153 E.66706
; WIPE_START
M204 S5000
G1 X97.273 Y160.153 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.623 Y157.363 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X100.737 Y157.363 E.13034
; WIPE_START
G1 X98.737 Y157.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X106.366 Y157.134 Z2.2 F15000
G1 X118.111 Y156.78 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X118.78 Y157.449 E.02906
G1 X118.743 Y157.946
G1 X117.578 Y156.78 E.05063
G1 X117.045 Y156.78
G1 X118.21 Y157.946 E.05063
G1 X117.677 Y157.946
G1 X116.512 Y156.78 E.05063
G1 X115.978 Y156.78
G1 X117.144 Y157.946 E.05063
G1 X116.61 Y157.946
G1 X115.445 Y156.78 E.05063
G1 X114.912 Y156.78
G1 X116.077 Y157.946 E.05063
G1 X115.544 Y157.946
G1 X114.379 Y156.78 E.05063
G1 X113.845 Y156.78
G1 X115.011 Y157.946 E.05063
G1 X114.477 Y157.946
G1 X113.312 Y156.78 E.05063
G1 X112.779 Y156.78
G1 X113.944 Y157.946 E.05063
G1 X113.411 Y157.946
G1 X112.246 Y156.78 E.05063
G1 X111.712 Y156.78
G1 X112.877 Y157.946 E.05063
G1 X112.344 Y157.946
G1 X111.179 Y156.78 E.05063
G1 X110.646 Y156.78
G1 X111.811 Y157.946 E.05063
G1 X111.278 Y157.946
G1 X110.112 Y156.78 E.05063
G1 X109.579 Y156.78
G1 X110.744 Y157.946 E.05063
G1 X110.211 Y157.946
G1 X109.046 Y156.78 E.05063
G1 X108.513 Y156.78
G1 X109.678 Y157.946 E.05063
G1 X109.145 Y157.946
G1 X107.979 Y156.78 E.05063
G1 X107.446 Y156.78
G1 X108.611 Y157.946 E.05063
G1 X108.078 Y157.946
G1 X106.913 Y156.78 E.05063
G1 X106.38 Y156.78
G1 X107.545 Y157.946 E.05063
G1 X107.012 Y157.946
G1 X105.846 Y156.78 E.05063
G1 X105.313 Y156.78
G1 X106.478 Y157.946 E.05063
G1 X105.945 Y157.946
G1 X104.78 Y156.78 E.05063
G1 X104.247 Y156.78
G1 X105.412 Y157.946 E.05063
G1 X104.879 Y157.946
G1 X103.713 Y156.78 E.05063
G1 X103.18 Y156.78
G1 X104.345 Y157.946 E.05063
G1 X103.812 Y157.946
G1 X102.647 Y156.78 E.05063
G1 X102.114 Y156.78
G1 X103.279 Y157.946 E.05063
G1 X102.746 Y157.946
G1 X101.58 Y156.78 E.05063
G1 X101.163 Y156.896
G1 X102.212 Y157.946 E.0456
G1 X101.679 Y157.946
G1 X101.163 Y157.43 E.02243
; WIPE_START
M204 S5000
G1 X101.679 Y157.946 E-.27737
G1 X102.212 Y157.946 E-.20264
G1 X101.691 Y157.425 E-.27999
; WIPE_END
G1 E-.04 F1800
G1 X99.725 Y164.799 Z2.2 F15000
G1 X95.649 Y180.083 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X95.649 Y158.346 E.77983
G3 X95.535 Y158.143 I.151 J-.217 E.00865
G1 X95.208 Y158.143 E.01173
G1 X95.208 Y180.083 E.78713
G1 X95.589 Y180.083 E.01364
G1 X96.057 Y180.492 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X96.057 Y158.155 E.68632
G1 X95.921 Y158.049 E.00532
G1 X95.854 Y157.734 E.00989
G1 X94.8 Y157.734 E.03239
G1 X94.8 Y180.492 E.69926
G1 X95.997 Y180.492 E.0368
G1 X96.434 Y180.869 F15000
G1 F4800
G1 X96.434 Y157.986 E.70311
G1 X96.253 Y157.871 E.00659
G1 X96.231 Y157.357 E.01582
G1 X94.423 Y157.357 E.05556
G1 X94.423 Y180.869 E.72243
G1 X96.374 Y180.869 E.05997
; OBJECT_ID: 118
; WIPE_START
G1 X94.423 Y180.869 E-.74166
G1 X94.423 Y180.821 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 118
M624 AgAAAAAAAAA=
G1 X97.531 Y173.85 Z2.2 F15000
G1 X155.58 Y43.693 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X155.58 Y47.807 E.13647
G1 X154.784 Y47.807 E.0264
G1 X154.784 Y40.897 E.22921
G1 X179.08 Y40.897 E.80594
G1 X179.08 Y43.693 E.09274
G1 X155.64 Y43.693 E.77755
M204 S250
G1 X155.972 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X155.972 Y65.854 E.6689
G1 X154.392 Y65.854 E.04855
G1 X154.392 Y40.505 E.77891
G1 X179.472 Y40.505 E.77064
G1 X179.472 Y44.085 E.11
G1 X156.032 Y44.085 E.72025
; WIPE_START
M204 S5000
G1 X156.027 Y46.085 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.182 Y43.49 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.182 Y47.604 E.13034
G1 X155.249 Y48.03 F15000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X155.765 Y48.546 E.02243
G1 X155.765 Y49.079
M73 P90 R1
G1 X154.715 Y48.03 E.04561
G1 X154.6 Y48.447
G1 X155.765 Y49.613 E.05063
G1 X155.765 Y50.146
G1 X154.6 Y48.981 E.05063
G1 X154.6 Y49.514
G1 X155.765 Y50.679 E.05063
G1 X155.765 Y51.212
G1 X154.6 Y50.047 E.05063
G1 X154.6 Y50.58
G1 X155.765 Y51.746 E.05063
G1 X155.765 Y52.279
G1 X154.6 Y51.114 E.05063
G1 X154.6 Y51.647
G1 X155.765 Y52.812 E.05063
G1 X155.765 Y53.345
G1 X154.6 Y52.18 E.05063
G1 X154.6 Y52.713
G1 X155.765 Y53.879 E.05063
G1 X155.765 Y54.412
G1 X154.6 Y53.247 E.05063
G1 X154.6 Y53.78
G1 X155.765 Y54.945 E.05063
G1 X155.765 Y55.478
G1 X154.6 Y54.313 E.05063
G1 X154.6 Y54.846
G1 X155.765 Y56.012 E.05063
G1 X155.765 Y56.545
G1 X154.6 Y55.38 E.05063
G1 X154.6 Y55.913
G1 X155.765 Y57.078 E.05063
G1 X155.765 Y57.611
G1 X154.6 Y56.446 E.05063
G1 X154.6 Y56.979
G1 X155.765 Y58.145 E.05063
G1 X155.765 Y58.678
G1 X154.6 Y57.513 E.05063
G1 X154.6 Y58.046
G1 X155.765 Y59.211 E.05063
G1 X155.765 Y59.744
G1 X154.6 Y58.579 E.05063
G1 X154.6 Y59.112
G1 X155.765 Y60.278 E.05063
G1 X155.765 Y60.811
G1 X154.6 Y59.646 E.05063
G1 X154.6 Y60.179
G1 X155.765 Y61.344 E.05063
G1 X155.765 Y61.877
G1 X154.6 Y60.712 E.05063
G1 X154.6 Y61.246
G1 X155.765 Y62.411 E.05063
G1 X155.765 Y62.944
G1 X154.6 Y61.779 E.05063
G1 X154.6 Y62.312
G1 X155.765 Y63.477 E.05063
G1 X155.765 Y64.011
G1 X154.6 Y62.845 E.05063
G1 X154.6 Y63.379
G1 X155.765 Y64.544 E.05063
G1 X155.765 Y65.077
G1 X154.6 Y63.912 E.05063
G1 X154.6 Y64.445
G1 X155.765 Y65.61 E.05063
G1 X155.268 Y65.647
G1 X154.6 Y64.978 E.02906
; WIPE_START
M204 S5000
G1 X155.268 Y65.647 E-.35938
G1 X155.765 Y65.61 E-.18919
G1 X155.372 Y65.217 E-.21144
; WIPE_END
G1 E-.04 F1800
G1 X160.748 Y59.8 Z2.2 F15000
G1 X177.902 Y42.516 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48319
G1 F4800
G1 X177.902 Y42.075 E.0158
G1 X155.962 Y42.075 E.78714
G1 X155.962 Y42.402 E.01173
G1 X156.146 Y42.478 E.00712
G1 X156.166 Y42.516 E.00152
G1 X177.842 Y42.516 E.77769
G1 X178.311 Y42.924 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X178.311 Y41.667 E.03864
G1 X155.554 Y41.667 E.69926
G1 X155.554 Y42.721 E.03239
G1 X155.918 Y42.817 E.01157
G1 X155.975 Y42.924 E.00373
G1 X178.251 Y42.924 E.68448
G1 X178.688 Y43.301 F15000
G1 F4800
G1 X178.688 Y41.289 E.06181
G1 X155.176 Y41.29 E.72243
G1 X155.176 Y43.098 E.05556
G1 X155.691 Y43.12 E.01582
G1 X155.805 Y43.301 E.00659
G1 X178.628 Y43.301 E.70127
; WIPE_START
G1 X176.628 Y43.301 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X184.26 Y43.4 Z2.2 F15000
G1 X206.784 Y43.693 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X183.284 Y43.693 E.77954
G1 X183.284 Y40.897 E.09274
G1 X207.58 Y40.897 E.80594
G1 X207.58 Y47.807 E.22921
G1 X206.784 Y47.807 E.0264
G1 X206.784 Y43.753 E.13448
M204 S250
G1 X206.392 Y44.085 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X182.892 Y44.085 E.72209
G1 X182.892 Y40.505 E.11
G1 X207.972 Y40.505 E.77064
G1 X207.972 Y65.854 E.77891
G1 X206.392 Y65.854 E.04855
G1 X206.392 Y44.145 E.66706
; WIPE_START
M204 S5000
G1 X204.392 Y44.14 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.182 Y43.49 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X207.182 Y47.604 E.13034
; WIPE_START
G1 X207.182 Y45.604 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.765 Y48.82 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X206.975 Y48.03 E.03434
G1 X206.6 Y48.188
G1 X207.765 Y49.353 E.05063
G1 X207.765 Y49.887
G1 X206.6 Y48.721 E.05063
G1 X206.6 Y49.255
G1 X207.765 Y50.42 E.05063
G1 X207.765 Y50.953
G1 X206.6 Y49.788 E.05063
G1 X206.6 Y50.321
G1 X207.765 Y51.486 E.05063
G1 X207.765 Y52.02
G1 X206.6 Y50.854 E.05063
G1 X206.6 Y51.388
G1 X207.765 Y52.553 E.05063
G1 X207.765 Y53.086
G1 X206.6 Y51.921 E.05063
G1 X206.6 Y52.454
G1 X207.765 Y53.619 E.05063
G1 X207.765 Y54.153
G1 X206.6 Y52.987 E.05063
G1 X206.6 Y53.521
G1 X207.765 Y54.686 E.05063
G1 X207.765 Y55.219
G1 X206.6 Y54.054 E.05063
G1 X206.6 Y54.587
G1 X207.765 Y55.752 E.05063
G1 X207.765 Y56.286
G1 X206.6 Y55.12 E.05063
G1 X206.6 Y55.654
G1 X207.765 Y56.819 E.05063
G1 X207.765 Y57.352
G1 X206.6 Y56.187 E.05063
G1 X206.6 Y56.72
M73 P91 R1
G1 X207.765 Y57.885 E.05063
G1 X207.765 Y58.419
G1 X206.6 Y57.253 E.05063
G1 X206.6 Y57.787
G1 X207.765 Y58.952 E.05063
G1 X207.765 Y59.485
G1 X206.6 Y58.32 E.05063
G1 X206.6 Y58.853
G1 X207.765 Y60.018 E.05063
G1 X207.765 Y60.552
G1 X206.6 Y59.387 E.05063
G1 X206.6 Y59.92
G1 X207.765 Y61.085 E.05063
G1 X207.765 Y61.618
G1 X206.6 Y60.453 E.05063
G1 X206.6 Y60.986
G1 X207.765 Y62.152 E.05063
G1 X207.765 Y62.685
G1 X206.6 Y61.52 E.05063
G1 X206.6 Y62.053
G1 X207.765 Y63.218 E.05063
G1 X207.765 Y63.751
G1 X206.6 Y62.586 E.05063
G1 X206.6 Y63.119
G1 X207.765 Y64.285 E.05063
G1 X207.765 Y64.818
G1 X206.6 Y63.653 E.05063
G1 X206.6 Y64.186
G1 X207.765 Y65.351 E.05063
G1 X207.528 Y65.647
G1 X206.6 Y64.719 E.04032
G1 X206.6 Y65.252
G1 X206.994 Y65.647 E.01715
; WIPE_START
M204 S5000
G1 X206.6 Y65.252 E-.21211
G1 X206.6 Y64.719 E-.20264
G1 X207.242 Y65.362 E-.34526
; WIPE_END
G1 E-.04 F1800
G1 X201.853 Y59.957 Z2.2 F15000
G1 X184.462 Y42.516 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X206.199 Y42.516 E.77983
G3 X206.403 Y42.402 I.217 J.151 E.00865
G1 X206.403 Y42.075 E.01173
G1 X184.462 Y42.075 E.78713
G1 X184.462 Y42.456 E.01364
G1 X184.054 Y42.924 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X206.39 Y42.924 E.68632
G1 X206.496 Y42.788 E.00532
G1 X206.811 Y42.721 E.00989
G1 X206.811 Y41.667 E.03239
G1 X184.054 Y41.667 E.69926
G1 X184.054 Y42.864 E.0368
G1 X183.677 Y43.301 F15000
G1 F4800
G1 X206.574 Y43.301 E.70357
G1 X206.674 Y43.12 E.00635
G1 X207.188 Y43.098 E.01582
G1 X207.188 Y41.289 E.05556
G1 X183.677 Y41.29 E.72243
G1 X183.677 Y43.241 E.05997
; OBJECT_ID: 140
; WIPE_START
G1 X183.677 Y41.29 E-.74166
G1 X183.725 Y41.29 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 118
M625
; start printing object, unique label id: 140
M624 BAAAAAAAAAA=
G1 X176.094 Y41.447 Z2.2 F15000
G1 X73.142 Y43.569 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X73.142 Y47.683 E.13647
G1 X72.346 Y47.683 E.0264
G1 X72.346 Y40.773 E.22921
G1 X96.642 Y40.773 E.80594
G1 X96.642 Y43.569 E.09274
G1 X73.202 Y43.569 E.77755
M204 S250
G1 X73.534 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X73.534 Y65.73 E.6689
G1 X71.954 Y65.73 E.04855
G1 X71.954 Y40.381 E.77891
G1 X97.034 Y40.381 E.77064
G1 X97.034 Y43.961 E.11
G1 X73.594 Y43.961 E.72025
; WIPE_START
M204 S5000
G1 X73.588 Y45.961 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X72.744 Y43.366 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X72.744 Y47.48 E.13034
G1 X72.81 Y47.906 F15000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X73.326 Y48.422 E.02243
G1 X73.326 Y48.955
G1 X72.277 Y47.906 E.04561
G1 X72.161 Y48.323
G1 X73.326 Y49.489 E.05063
G1 X73.326 Y50.022
G1 X72.161 Y48.857 E.05063
G1 X72.161 Y49.39
G1 X73.326 Y50.555 E.05063
G1 X73.326 Y51.088
G1 X72.161 Y49.923 E.05063
G1 X72.161 Y50.456
G1 X73.326 Y51.622 E.05063
G1 X73.326 Y52.155
G1 X72.161 Y50.99 E.05063
G1 X72.161 Y51.523
G1 X73.326 Y52.688 E.05063
G1 X73.326 Y53.221
G1 X72.161 Y52.056 E.05063
G1 X72.161 Y52.589
G1 X73.326 Y53.755 E.05063
G1 X73.326 Y54.288
G1 X72.161 Y53.123 E.05063
G1 X72.161 Y53.656
G1 X73.326 Y54.821 E.05063
G1 X73.326 Y55.354
G1 X72.161 Y54.189 E.05063
G1 X72.161 Y54.722
G1 X73.326 Y55.888 E.05063
G1 X73.326 Y56.421
G1 X72.161 Y55.256 E.05063
G1 X72.161 Y55.789
G1 X73.326 Y56.954 E.05063
G1 X73.326 Y57.487
G1 X72.161 Y56.322 E.05063
G1 X72.161 Y56.855
G1 X73.326 Y58.021 E.05063
G1 X73.326 Y58.554
G1 X72.161 Y57.389 E.05063
G1 X72.161 Y57.922
G1 X73.326 Y59.087 E.05063
G1 X73.326 Y59.62
G1 X72.161 Y58.455 E.05063
G1 X72.161 Y58.988
G1 X73.326 Y60.154 E.05063
G1 X73.326 Y60.687
G1 X72.161 Y59.522 E.05063
G1 X72.161 Y60.055
G1 X73.326 Y61.22 E.05063
G1 X73.326 Y61.753
G1 X72.161 Y60.588 E.05063
G1 X72.161 Y61.121
G1 X73.326 Y62.287 E.05063
G1 X73.326 Y62.82
G1 X72.161 Y61.655 E.05063
G1 X72.161 Y62.188
G1 X73.326 Y63.353 E.05063
G1 X73.326 Y63.886
G1 X72.161 Y62.721 E.05063
G1 X72.161 Y63.255
G1 X73.326 Y64.42 E.05063
G1 X73.326 Y64.953
G1 X72.161 Y63.788 E.05063
G1 X72.161 Y64.321
G1 X73.326 Y65.486 E.05063
G1 X72.83 Y65.523
G1 X72.161 Y64.854 E.02906
; WIPE_START
M204 S5000
G1 X72.83 Y65.523 E-.35938
G1 X73.326 Y65.486 E-.18919
G1 X72.933 Y65.093 E-.21144
; WIPE_END
G1 E-.04 F1800
G1 X78.309 Y59.676 Z2.2 F15000
G1 X95.464 Y42.391 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48319
G1 F4800
G1 X95.464 Y41.951 E.0158
G1 X73.524 Y41.951 E.78714
G1 X73.524 Y42.278 E.01173
G1 X73.707 Y42.354 E.00712
G1 X73.727 Y42.391 E.00152
G1 X95.404 Y42.391 E.77769
G1 X95.872 Y42.8 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X95.872 Y41.543 E.03864
G1 X73.115 Y41.543 E.69926
G1 X73.115 Y42.597 E.03239
G1 X73.479 Y42.693 E.01157
G1 X73.536 Y42.8 E.00373
M73 P92 R1
G1 X95.812 Y42.8 E.68448
G1 X96.25 Y43.177 F15000
G1 F4800
G1 X96.25 Y41.165 E.06181
G1 X72.738 Y41.165 E.72243
G1 X72.738 Y42.974 E.05556
G1 X73.252 Y42.996 E.01582
G1 X73.367 Y43.177 E.00659
G1 X96.19 Y43.177 E.70127
; WIPE_START
G1 X94.19 Y43.177 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.821 Y43.276 Z2.2 F15000
G1 X124.346 Y43.569 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X100.846 Y43.569 E.77954
G1 X100.846 Y40.773 E.09274
G1 X125.142 Y40.773 E.80594
G1 X125.142 Y47.683 E.22921
G1 X124.346 Y47.683 E.0264
G1 X124.346 Y43.629 E.13448
M204 S250
G1 X123.954 Y43.961 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X100.454 Y43.961 E.72209
G1 X100.454 Y40.381 E.11
G1 X125.534 Y40.381 E.77064
G1 X125.534 Y65.73 E.77891
G1 X123.954 Y65.73 E.04855
G1 X123.954 Y44.021 E.66706
; WIPE_START
M204 S5000
G1 X121.954 Y44.016 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.744 Y43.366 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X124.744 Y47.48 E.13034
; WIPE_START
G1 X124.744 Y45.48 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.326 Y48.696 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X124.536 Y47.906 E.03434
G1 X124.161 Y48.064
G1 X125.326 Y49.229 E.05063
G1 X125.326 Y49.763
G1 X124.161 Y48.597 E.05063
G1 X124.161 Y49.131
G1 X125.326 Y50.296 E.05063
G1 X125.326 Y50.829
G1 X124.161 Y49.664 E.05063
G1 X124.161 Y50.197
G1 X125.326 Y51.362 E.05063
G1 X125.326 Y51.896
G1 X124.161 Y50.73 E.05063
G1 X124.161 Y51.264
G1 X125.326 Y52.429 E.05063
G1 X125.326 Y52.962
G1 X124.161 Y51.797 E.05063
G1 X124.161 Y52.33
G1 X125.326 Y53.495 E.05063
G1 X125.326 Y54.029
G1 X124.161 Y52.863 E.05063
G1 X124.161 Y53.397
G1 X125.326 Y54.562 E.05063
G1 X125.326 Y55.095
G1 X124.161 Y53.93 E.05063
G1 X124.161 Y54.463
G1 X125.326 Y55.628 E.05063
G1 X125.326 Y56.162
G1 X124.161 Y54.996 E.05063
G1 X124.161 Y55.53
G1 X125.326 Y56.695 E.05063
G1 X125.326 Y57.228
G1 X124.161 Y56.063 E.05063
G1 X124.161 Y56.596
G1 X125.326 Y57.761 E.05063
G1 X125.326 Y58.295
G1 X124.161 Y57.129 E.05063
G1 X124.161 Y57.663
G1 X125.326 Y58.828 E.05063
G1 X125.326 Y59.361
G1 X124.161 Y58.196 E.05063
G1 X124.161 Y58.729
G1 X125.326 Y59.894 E.05063
G1 X125.326 Y60.428
G1 X124.161 Y59.262 E.05063
G1 X124.161 Y59.796
G1 X125.326 Y60.961 E.05063
G1 X125.326 Y61.494
G1 X124.161 Y60.329 E.05063
G1 X124.161 Y60.862
G1 X125.326 Y62.027 E.05063
G1 X125.326 Y62.561
G1 X124.161 Y61.396 E.05063
G1 X124.161 Y61.929
G1 X125.326 Y63.094 E.05063
G1 X125.326 Y63.627
G1 X124.161 Y62.462 E.05063
G1 X124.161 Y62.995
G1 X125.326 Y64.161 E.05063
G1 X125.326 Y64.694
G1 X124.161 Y63.529 E.05063
G1 X124.161 Y64.062
G1 X125.326 Y65.227 E.05063
G1 X125.089 Y65.523
G1 X124.161 Y64.595 E.04032
G1 X124.161 Y65.128
G1 X124.556 Y65.523 E.01715
; WIPE_START
M204 S5000
G1 X124.161 Y65.128 E-.21211
G1 X124.161 Y64.595 E-.20264
G1 X124.803 Y65.238 E-.34526
; WIPE_END
G1 E-.04 F1800
G1 X119.414 Y59.833 Z2.2 F15000
G1 X102.024 Y42.391 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483185
G1 F4800
G1 X123.76 Y42.391 E.77983
G3 X123.964 Y42.278 I.217 J.151 E.00865
G1 X123.964 Y41.951 E.01173
G1 X102.024 Y41.951 E.78713
G1 X102.024 Y42.331 E.01364
G1 X101.615 Y42.8 F15000
; LINE_WIDTH: 0.41999
G1 F4800
G1 X123.951 Y42.8 E.68632
G1 X124.058 Y42.663 E.00532
G1 X124.372 Y42.597 E.00989
G1 X124.372 Y41.543 E.03239
G1 X101.615 Y41.543 E.69926
G1 X101.615 Y42.74 E.0368
G1 X101.238 Y43.177 F15000
G1 F4800
G1 X124.136 Y43.177 E.70357
G1 X124.235 Y42.996 E.00635
G1 X124.75 Y42.974 E.01582
G1 X124.75 Y41.165 E.05556
G1 X101.238 Y41.165 E.72243
G1 X101.238 Y43.117 E.05997
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F4800
G1 X101.238 Y41.165 E-.74166
G1 X101.286 Y41.165 E-.01834
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
; layer num/total_layer_count: 10/10
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F15000
; object ids of layer 10 start: 81,118,140
M624 BwAAAAAAAAA=
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
; object ids of this layer10 end: 81,118,140
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X97.219 Y208.573
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X101.808 Y208.573 E.14103
G1 X101.808 Y210.153 E.04855
G1 X93.639 Y210.153 E.25103
G1 X93.639 Y185.073 E.77064
G1 X97.219 Y185.073 E.11
G1 X97.219 Y208.513 E.72025
; WIPE_START
M204 S5000
G1 X99.218 Y208.539 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X101.601 Y209.392 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X101.047 Y209.946 E.02406
G1 X100.514 Y209.946
G1 X101.601 Y208.859 E.04724
G1 X101.146 Y208.78
G1 X99.981 Y209.946 E.05064
G1 X99.447 Y209.946
G1 X100.613 Y208.78 E.05064
G1 X100.079 Y208.78
G1 X98.914 Y209.946 E.05064
G1 X98.381 Y209.946
G1 X99.546 Y208.78 E.05064
G1 X99.013 Y208.78
G1 X97.848 Y209.946 E.05064
G1 X97.314 Y209.946
G1 X98.48 Y208.78 E.05064
G1 X97.946 Y208.78
G1 X96.781 Y209.946 E.05064
G1 X96.248 Y209.946
G1 X97.413 Y208.78 E.05064
G1 X97.011 Y208.649
G1 X95.715 Y209.946 E.05635
G1 X95.181 Y209.946
G1 X97.011 Y208.116 E.07952
G1 X97.011 Y207.583
M73 P93 R1
G1 X94.648 Y209.946 E.10269
G1 X94.115 Y209.946
G1 X97.011 Y207.049 E.12586
G1 X97.011 Y206.516
G1 X93.846 Y209.681 E.13755
G1 X93.846 Y209.148
G1 X97.011 Y205.983 E.13755
G1 X97.011 Y205.449
G1 X93.846 Y208.615 E.13755
G1 X93.846 Y208.081
G1 X97.011 Y204.916 E.13755
G1 X97.011 Y204.383
G1 X93.846 Y207.548 E.13755
G1 X93.846 Y207.015
G1 X97.011 Y203.85 E.13754
G1 X97.011 Y203.316
G1 X93.846 Y206.482 E.13754
G1 X93.846 Y205.948
G1 X97.011 Y202.783 E.13754
G1 X97.011 Y202.25
G1 X93.846 Y205.415 E.13755
G1 X93.846 Y204.882
G1 X97.011 Y201.717 E.13754
G1 X97.011 Y201.183
G1 X93.846 Y204.349 E.13754
G1 X93.846 Y203.815
G1 X97.011 Y200.65 E.13754
G1 X97.011 Y200.117
G1 X93.846 Y203.282 E.13755
G1 X93.846 Y202.749
G1 X97.011 Y199.584 E.13754
G1 X97.011 Y199.05
G1 X93.846 Y202.216 E.13754
G1 X93.846 Y201.682
G1 X97.011 Y198.517 E.13754
G1 X97.011 Y197.984
G1 X93.846 Y201.149 E.13755
G1 X93.846 Y200.616
G1 X97.011 Y197.451 E.13754
G1 X97.011 Y196.917
G1 X93.846 Y200.083 E.13754
G1 X93.846 Y199.549
G1 X97.011 Y196.384 E.13754
G1 X97.011 Y195.851
G1 X93.846 Y199.016 E.13754
G1 X93.846 Y198.483
G1 X97.011 Y195.318 E.13754
G1 X97.011 Y194.784
G1 X93.846 Y197.95 E.13754
G1 X93.846 Y197.416
G1 X97.011 Y194.251 E.13754
G1 X97.011 Y193.718
G1 X93.846 Y196.883 E.13754
G1 X93.846 Y196.35
G1 X97.011 Y193.185 E.13755
G1 X97.011 Y192.651
G1 X93.846 Y195.817 E.13754
G1 X93.846 Y195.283
G1 X97.011 Y192.118 E.13754
G1 X97.011 Y191.585
G1 X93.846 Y194.75 E.13754
G1 X93.846 Y194.217
G1 X97.011 Y191.052 E.13755
G1 X97.011 Y190.518
G1 X93.846 Y193.684 E.13754
G1 X93.846 Y193.15
G1 X97.011 Y189.985 E.13754
G1 X97.011 Y189.452
G1 X93.846 Y192.617 E.13754
G1 X93.846 Y192.084
G1 X97.011 Y188.919 E.13755
G1 X97.011 Y188.385
G1 X93.846 Y191.55 E.13754
G1 X93.846 Y191.017
G1 X97.011 Y187.852 E.13754
G1 X97.011 Y187.319
G1 X93.846 Y190.484 E.13754
G1 X93.846 Y189.951
G1 X97.011 Y186.785 E.13755
G1 X97.011 Y186.252
G1 X93.846 Y189.417 E.13754
G1 X93.846 Y188.884
G1 X97.011 Y185.719 E.13754
G1 X96.916 Y185.28
G1 X93.846 Y188.351 E.13343
G1 X93.846 Y187.818
G1 X96.383 Y185.28 E.11026
G1 X95.85 Y185.28
G1 X93.846 Y187.284 E.08708
G1 X93.846 Y186.751
G1 X95.317 Y185.28 E.06391
G1 X94.783 Y185.28
G1 X93.846 Y186.218 E.04074
G1 X93.846 Y185.685
G1 X94.25 Y185.28 E.01757
; WIPE_START
M204 S5000
G1 X93.846 Y185.685 E-.21724
G1 X93.846 Y186.218 E-.20264
G1 X94.479 Y185.585 E-.34013
; WIPE_END
G1 E-.04 F1800
G1 X95.237 Y177.99 Z2.4 F15000
G1 X97.219 Y158.153 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6000
M204 S2500
G1 X97.219 Y181.653 E.72209
G1 X93.639 Y181.653 E.11
G1 X93.639 Y156.573 E.77064
G1 X101.808 Y156.573 E.25103
G1 X101.808 Y158.153 E.04855
G1 X97.279 Y158.153 E.13918
; WIPE_START
M204 S5000
G1 X97.273 Y160.153 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X97.177 Y167.785 Z2.4 F15000
G1 X97.011 Y180.92 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X96.485 Y181.446 E.02286
G1 X95.952 Y181.446
G1 X97.011 Y180.386 E.04603
G1 X97.011 Y179.853
G1 X95.419 Y181.446 E.0692
G1 X94.885 Y181.446
G1 X97.011 Y179.32 E.09238
G1 X97.011 Y178.787
G1 X94.352 Y181.446 E.11555
G1 X93.846 Y181.419
G1 X97.011 Y178.253 E.13755
G1 X97.011 Y177.72
G1 X93.846 Y180.885 E.13755
G1 X93.846 Y180.352
G1 X97.011 Y177.187 E.13755
G1 X97.011 Y176.654
G1 X93.846 Y179.819 E.13755
G1 X93.846 Y179.286
G1 X97.011 Y176.12 E.13755
G1 X97.011 Y175.587
G1 X93.846 Y178.752 E.13755
G1 X93.846 Y178.219
G1 X97.011 Y175.054 E.13755
G1 X97.011 Y174.521
G1 X93.846 Y177.686 E.13755
G1 X93.846 Y177.153
G1 X97.011 Y173.987 E.13755
G1 X97.011 Y173.454
G1 X93.846 Y176.619 E.13755
G1 X93.846 Y176.086
G1 X97.011 Y172.921 E.13755
G1 X97.011 Y172.388
G1 X93.846 Y175.553 E.13755
G1 X93.846 Y175.02
G1 X97.011 Y171.854 E.13755
G1 X97.011 Y171.321
G1 X93.846 Y174.486 E.13755
G1 X93.846 Y173.953
G1 X97.011 Y170.788 E.13755
G1 X97.011 Y170.254
M73 P94 R1
G1 X93.846 Y173.42 E.13755
G1 X93.846 Y172.886
G1 X97.011 Y169.721 E.13755
G1 X97.011 Y169.188
G1 X93.846 Y172.353 E.13755
G1 X93.846 Y171.82
G1 X97.011 Y168.655 E.13755
G1 X97.011 Y168.121
G1 X93.846 Y171.287 E.13755
G1 X93.846 Y170.753
G1 X97.011 Y167.588 E.13755
G1 X97.011 Y167.055
G1 X93.846 Y170.22 E.13755
G1 X93.846 Y169.687
G1 X97.011 Y166.522 E.13755
G1 X97.011 Y165.988
G1 X93.846 Y169.154 E.13755
G1 X93.846 Y168.62
G1 X97.011 Y165.455 E.13755
G1 X97.011 Y164.922
G1 X93.846 Y168.087 E.13755
G1 X93.846 Y167.554
G1 X97.011 Y164.389 E.13755
G1 X97.011 Y163.855
G1 X93.846 Y167.021 E.13755
G1 X93.846 Y166.487
G1 X97.011 Y163.322 E.13755
G1 X97.011 Y162.789
G1 X93.846 Y165.954 E.13755
G1 X93.846 Y165.421
G1 X97.011 Y162.256 E.13755
G1 X97.011 Y161.722
G1 X93.846 Y164.888 E.13755
G1 X93.846 Y164.354
G1 X97.011 Y161.189 E.13755
G1 X97.011 Y160.656
G1 X93.846 Y163.821 E.13755
G1 X93.846 Y163.288
G1 X97.011 Y160.123 E.13755
G1 X97.011 Y159.589
G1 X93.846 Y162.755 E.13755
G1 X93.846 Y162.221
G1 X97.011 Y159.056 E.13755
G1 X97.011 Y158.523
G1 X93.846 Y161.688 E.13755
G1 X93.846 Y161.155
G1 X97.011 Y157.99 E.13755
; WIPE_START
M204 S5000
G1 X95.597 Y159.404 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.788 Y157.946 Z2.4 F15000
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X101.601 Y157.133 E.03533
G1 X101.42 Y156.78
G1 X100.255 Y157.946 E.05064
G1 X99.721 Y157.946
G1 X100.887 Y156.78 E.05064
G1 X100.353 Y156.78
G1 X99.188 Y157.946 E.05064
G1 X98.655 Y157.946
G1 X99.82 Y156.78 E.05064
G1 X99.287 Y156.78
G1 X98.122 Y157.946 E.05064
G1 X97.588 Y157.946
G1 X98.754 Y156.78 E.05064
G1 X98.22 Y156.78
G1 X97.055 Y157.946 E.05064
; WIPE_START
M204 S5000
G1 X98.22 Y156.78 E-.6262
G1 X98.572 Y156.78 E-.1338
; WIPE_END
G1 E-.04 F1800
G1 X97.687 Y156.78 Z2.4 F15000
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X93.846 Y160.622 E.16692
G1 X93.846 Y160.088
G1 X97.154 Y156.78 E.14374
G1 X96.621 Y156.78
G1 X93.846 Y159.555 E.12057
G1 X93.846 Y159.022
G1 X96.087 Y156.78 E.0974
G1 X95.554 Y156.78
G1 X93.846 Y158.489 E.07423
G1 X93.846 Y157.955
G1 X95.021 Y156.78 E.05105
G1 X94.488 Y156.78
G1 X93.846 Y157.422 E.02788
; WIPE_START
M204 S5000
G1 X94.488 Y156.78 E-.3448
M73 P94 R0
G1 X95.021 Y156.78 E-.20264
G1 X94.625 Y157.176 E-.21257
; WIPE_END
G1 E-.04 F1800
G1 X97.008 Y157.943 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10501
G1 F7500
G1 X96.9 Y157.834 E.00077
; OBJECT_ID: 118
; WIPE_START
G1 X97.008 Y157.943 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 118
M624 AgAAAAAAAAA=
G1 X100.518 Y151.165 Z2.4 F15000
G1 X155.972 Y44.085 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X155.972 Y48.675 E.14103
G1 X154.392 Y48.675 E.04855
G1 X154.392 Y40.505 E.25103
G1 X179.472 Y40.505 E.77064
G1 X179.472 Y44.085 E.11
G1 X156.032 Y44.085 E.72025
; WIPE_START
M204 S5000
G1 X156.006 Y46.085 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X163.603 Y45.348 Z2.4 F15000
G1 X178.739 Y43.878 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X179.265 Y43.352 E.02286
G1 X179.265 Y42.819
G1 X178.206 Y43.878 E.04603
G1 X177.672 Y43.878
G1 X179.265 Y42.285 E.0692
G1 X179.265 Y41.752
G1 X177.139 Y43.878 E.09238
G1 X176.606 Y43.878
G1 X179.265 Y41.219 E.11555
G1 X179.238 Y40.713
G1 X176.073 Y43.878 E.13754
G1 X175.539 Y43.878
G1 X178.705 Y40.713 E.13754
G1 X178.171 Y40.713
G1 X175.006 Y43.878 E.13754
G1 X174.473 Y43.878
G1 X177.638 Y40.713 E.13755
G1 X177.105 Y40.713
G1 X173.94 Y43.878 E.13754
G1 X173.406 Y43.878
G1 X176.572 Y40.713 E.13754
G1 X176.038 Y40.713
G1 X172.873 Y43.878 E.13754
G1 X172.34 Y43.878
G1 X175.505 Y40.713 E.13755
G1 X174.972 Y40.713
G1 X171.807 Y43.878 E.13754
G1 X171.273 Y43.878
G1 X174.439 Y40.713 E.13754
G1 X173.905 Y40.713
G1 X170.74 Y43.878 E.13754
G1 X170.207 Y43.878
G1 X173.372 Y40.713 E.13755
G1 X172.839 Y40.713
G1 X169.674 Y43.878 E.13754
G1 X169.14 Y43.878
G1 X172.306 Y40.713 E.13754
G1 X171.772 Y40.713
G1 X168.607 Y43.878 E.13754
G1 X168.074 Y43.878
G1 X171.239 Y40.713 E.13755
G1 X170.706 Y40.713
G1 X167.541 Y43.878 E.13754
G1 X167.007 Y43.878
G1 X170.173 Y40.713 E.13755
G1 X169.639 Y40.713
G1 X166.474 Y43.878 E.13755
G1 X165.941 Y43.878
G1 X169.106 Y40.713 E.13755
G1 X168.573 Y40.713
G1 X165.408 Y43.878 E.13755
G1 X164.874 Y43.878
G1 X168.04 Y40.713 E.13755
G1 X167.506 Y40.713
G1 X164.341 Y43.878 E.13755
G1 X163.808 Y43.878
G1 X166.973 Y40.713 E.13755
G1 X166.44 Y40.713
G1 X163.275 Y43.878 E.13754
M73 P95 R0
G1 X162.741 Y43.878
G1 X165.906 Y40.713 E.13754
G1 X165.373 Y40.713
G1 X162.208 Y43.878 E.13755
G1 X161.675 Y43.878
G1 X164.84 Y40.713 E.13754
G1 X164.307 Y40.713
G1 X161.141 Y43.878 E.13754
G1 X160.608 Y43.878
G1 X163.773 Y40.713 E.13754
G1 X163.24 Y40.713
G1 X160.075 Y43.878 E.13755
G1 X159.542 Y43.878
G1 X162.707 Y40.713 E.13754
G1 X162.174 Y40.713
G1 X159.008 Y43.878 E.13754
G1 X158.475 Y43.878
G1 X161.64 Y40.713 E.13754
G1 X161.107 Y40.713
G1 X157.942 Y43.878 E.13755
G1 X157.409 Y43.878
G1 X160.574 Y40.713 E.13754
G1 X160.041 Y40.713
G1 X156.875 Y43.878 E.13754
G1 X156.342 Y43.878
G1 X159.507 Y40.713 E.13754
G1 X158.974 Y40.713
G1 X155.809 Y43.878 E.13755
; WIPE_START
M204 S5000
G1 X157.223 Y42.464 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.765 Y47.655 Z2.4 F15000
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X154.952 Y48.468 E.03533
G1 X154.6 Y48.287
G1 X155.765 Y47.121 E.05064
G1 X155.765 Y46.588
G1 X154.6 Y47.753 E.05064
G1 X154.6 Y47.22
G1 X155.765 Y46.055 E.05064
G1 X155.765 Y45.522
G1 X154.6 Y46.687 E.05064
G1 X154.6 Y46.154
G1 X155.765 Y44.988 E.05064
G1 X155.765 Y44.455
G1 X154.6 Y45.62 E.05064
G1 X154.6 Y45.087
G1 X155.765 Y43.922 E.05064
; WIPE_START
M204 S5000
G1 X154.6 Y45.087 E-.62621
G1 X154.6 Y45.439 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X154.6 Y44.554 Z2.4 F15000
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X158.441 Y40.713 E.16692
G1 X157.908 Y40.713
G1 X154.6 Y44.021 E.14374
G1 X154.6 Y43.487
G1 X157.374 Y40.713 E.12057
G1 X156.841 Y40.713
G1 X154.6 Y42.954 E.0974
G1 X154.6 Y42.421
G1 X156.308 Y40.713 E.07423
G1 X155.775 Y40.713
G1 X154.6 Y41.888 E.05105
G1 X154.6 Y41.354
G1 X155.241 Y40.713 E.02788
; WIPE_START
M204 S5000
G1 X154.6 Y41.354 E-.3448
G1 X154.6 Y41.888 E-.20264
G1 X154.995 Y41.492 E-.21257
; WIPE_END
G1 E-.04 F1800
G1 X155.762 Y43.875 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105018
G1 F7500
G1 X155.654 Y43.767 E.00077
; WIPE_START
G1 X155.762 Y43.875 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X163.394 Y43.907 Z2.4 F15000
G1 X206.392 Y44.085 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X182.892 Y44.085 E.72209
G1 X182.892 Y40.505 E.11
G1 X207.972 Y40.505 E.77064
G1 X207.972 Y48.675 E.25103
G1 X206.392 Y48.675 E.04855
G1 X206.392 Y44.145 E.13918
; WIPE_START
M204 S5000
G1 X204.392 Y44.14 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X207.211 Y48.468 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X207.765 Y47.914 E.02406
G1 X207.765 Y47.381
G1 X206.678 Y48.468 E.04723
G1 X206.6 Y48.013
G1 X207.765 Y46.847 E.05064
G1 X207.765 Y46.314
G1 X206.6 Y47.479 E.05064
G1 X206.6 Y46.946
G1 X207.765 Y45.781 E.05064
G1 X207.765 Y45.248
G1 X206.6 Y46.413 E.05064
G1 X206.6 Y45.88
G1 X207.765 Y44.714 E.05064
G1 X207.765 Y44.181
G1 X206.6 Y45.346 E.05064
G1 X206.6 Y44.813
G1 X207.765 Y43.648 E.05064
G1 X207.765 Y43.115
G1 X206.6 Y44.28 E.05064
G1 X206.468 Y43.878
G1 X207.765 Y42.581 E.05634
G1 X207.765 Y42.048
G1 X205.935 Y43.878 E.07952
G1 X205.402 Y43.878
G1 X207.765 Y41.515 E.10269
G1 X207.765 Y40.982
G1 X204.869 Y43.878 E.12586
G1 X204.335 Y43.878
G1 X207.501 Y40.713 E.13755
G1 X206.967 Y40.713
G1 X203.802 Y43.878 E.13755
G1 X203.269 Y43.878
G1 X206.434 Y40.713 E.13755
G1 X205.901 Y40.713
G1 X202.736 Y43.878 E.13755
G1 X202.202 Y43.878
G1 X205.368 Y40.713 E.13755
G1 X204.834 Y40.713
G1 X201.669 Y43.878 E.13755
G1 X201.136 Y43.878
G1 X204.301 Y40.713 E.13755
G1 X203.768 Y40.713
G1 X200.603 Y43.878 E.13755
G1 X200.069 Y43.878
G1 X203.235 Y40.713 E.13755
G1 X202.701 Y40.713
G1 X199.536 Y43.878 E.13755
G1 X199.003 Y43.878
G1 X202.168 Y40.713 E.13755
G1 X201.635 Y40.713
G1 X198.47 Y43.878 E.13755
G1 X197.936 Y43.878
G1 X201.101 Y40.713 E.13755
G1 X200.568 Y40.713
G1 X197.403 Y43.878 E.13755
G1 X196.87 Y43.878
G1 X200.035 Y40.713 E.13755
G1 X199.502 Y40.713
G1 X196.336 Y43.878 E.13755
G1 X195.803 Y43.878
G1 X198.968 Y40.713 E.13755
G1 X198.435 Y40.713
G1 X195.27 Y43.878 E.13755
G1 X194.737 Y43.878
G1 X197.902 Y40.713 E.13755
G1 X197.369 Y40.713
G1 X194.203 Y43.878 E.13755
G1 X193.67 Y43.878
G1 X196.835 Y40.713 E.13755
G1 X196.302 Y40.713
G1 X193.137 Y43.878 E.13755
G1 X192.604 Y43.878
G1 X195.769 Y40.713 E.13755
G1 X195.236 Y40.713
G1 X192.07 Y43.878 E.13755
G1 X191.537 Y43.878
G1 X194.702 Y40.713 E.13755
G1 X194.169 Y40.713
G1 X191.004 Y43.878 E.13755
G1 X190.471 Y43.878
G1 X193.636 Y40.713 E.13755
G1 X193.103 Y40.713
G1 X189.937 Y43.878 E.13755
G1 X189.404 Y43.878
G1 X192.569 Y40.713 E.13755
G1 X192.036 Y40.713
M73 P96 R0
G1 X188.871 Y43.878 E.13755
G1 X188.338 Y43.878
G1 X191.503 Y40.713 E.13755
G1 X190.97 Y40.713
G1 X187.804 Y43.878 E.13755
G1 X187.271 Y43.878
G1 X190.436 Y40.713 E.13755
G1 X189.903 Y40.713
G1 X186.738 Y43.878 E.13755
G1 X186.205 Y43.878
G1 X189.37 Y40.713 E.13755
G1 X188.837 Y40.713
G1 X185.671 Y43.878 E.13755
G1 X185.138 Y43.878
G1 X188.303 Y40.713 E.13755
G1 X187.77 Y40.713
G1 X184.605 Y43.878 E.13755
G1 X184.072 Y43.878
G1 X187.237 Y40.713 E.13755
G1 X186.704 Y40.713
G1 X183.538 Y43.878 E.13755
G1 X183.1 Y43.783
G1 X186.17 Y40.713 E.13343
G1 X185.637 Y40.713
G1 X183.1 Y43.25 E.11026
G1 X183.1 Y42.717
G1 X185.104 Y40.713 E.08708
G1 X184.571 Y40.713
G1 X183.1 Y42.184 E.06391
G1 X183.1 Y41.65
G1 X184.037 Y40.713 E.04074
G1 X183.504 Y40.713
G1 X183.1 Y41.117 E.01757
; OBJECT_ID: 140
; WIPE_START
M204 S5000
G1 X183.504 Y40.713 E-.21725
G1 X184.037 Y40.713 E-.20264
G1 X183.404 Y41.346 E-.34012
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 118
M625
; start printing object, unique label id: 140
M624 BAAAAAAAAAA=
G1 X175.774 Y41.527 Z2.4 F15000
G1 X73.534 Y43.961 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6000
M204 S2500
G1 X73.534 Y48.551 E.14103
G1 X71.954 Y48.551 E.04855
G1 X71.954 Y40.381 E.25103
G1 X97.034 Y40.381 E.77064
G1 X97.034 Y43.961 E.11
G1 X73.594 Y43.961 E.72025
; WIPE_START
M204 S5000
G1 X73.567 Y45.961 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X81.164 Y45.224 Z2.4 F15000
G1 X96.3 Y43.754 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X96.826 Y43.228 E.02286
G1 X96.826 Y42.695
G1 X95.767 Y43.754 E.04603
G1 X95.234 Y43.754
G1 X96.826 Y42.161 E.0692
G1 X96.826 Y41.628
G1 X94.7 Y43.754 E.09238
G1 X94.167 Y43.754
G1 X96.826 Y41.095 E.11555
G1 X96.799 Y40.589
G1 X93.634 Y43.754 E.13754
G1 X93.101 Y43.754
G1 X96.266 Y40.589 E.13754
G1 X95.733 Y40.589
G1 X92.567 Y43.754 E.13754
G1 X92.034 Y43.754
G1 X95.199 Y40.589 E.13755
G1 X94.666 Y40.589
G1 X91.501 Y43.754 E.13754
G1 X90.968 Y43.754
G1 X94.133 Y40.589 E.13754
G1 X93.6 Y40.589
G1 X90.434 Y43.754 E.13754
G1 X89.901 Y43.754
G1 X93.066 Y40.589 E.13755
G1 X92.533 Y40.589
G1 X89.368 Y43.754 E.13754
G1 X88.835 Y43.754
G1 X92 Y40.589 E.13754
G1 X91.467 Y40.589
G1 X88.301 Y43.754 E.13754
G1 X87.768 Y43.754
G1 X90.933 Y40.589 E.13755
G1 X90.4 Y40.589
G1 X87.235 Y43.754 E.13754
G1 X86.702 Y43.754
G1 X89.867 Y40.589 E.13754
G1 X89.334 Y40.589
G1 X86.168 Y43.754 E.13754
G1 X85.635 Y43.754
G1 X88.8 Y40.589 E.13755
G1 X88.267 Y40.589
G1 X85.102 Y43.754 E.13754
G1 X84.569 Y43.754
G1 X87.734 Y40.589 E.13755
G1 X87.201 Y40.589
G1 X84.035 Y43.754 E.13755
G1 X83.502 Y43.754
G1 X86.667 Y40.589 E.13755
G1 X86.134 Y40.589
G1 X82.969 Y43.754 E.13755
G1 X82.436 Y43.754
G1 X85.601 Y40.589 E.13755
G1 X85.068 Y40.589
G1 X81.902 Y43.754 E.13755
G1 X81.369 Y43.754
G1 X84.534 Y40.589 E.13755
G1 X84.001 Y40.589
G1 X80.836 Y43.754 E.13754
G1 X80.303 Y43.754
G1 X83.468 Y40.589 E.13754
G1 X82.935 Y40.589
G1 X79.769 Y43.754 E.13755
G1 X79.236 Y43.754
G1 X82.401 Y40.589 E.13754
G1 X81.868 Y40.589
G1 X78.703 Y43.754 E.13754
G1 X78.169 Y43.754
G1 X81.335 Y40.589 E.13754
G1 X80.801 Y40.589
G1 X77.636 Y43.754 E.13755
G1 X77.103 Y43.754
G1 X80.268 Y40.589 E.13754
G1 X79.735 Y40.589
G1 X76.57 Y43.754 E.13754
G1 X76.036 Y43.754
G1 X79.202 Y40.589 E.13754
G1 X78.668 Y40.589
G1 X75.503 Y43.754 E.13755
G1 X74.97 Y43.754
G1 X78.135 Y40.589 E.13754
G1 X77.602 Y40.589
G1 X74.437 Y43.754 E.13754
G1 X73.903 Y43.754
G1 X77.069 Y40.589 E.13754
G1 X76.535 Y40.589
G1 X73.37 Y43.754 E.13755
; WIPE_START
M204 S5000
G1 X74.784 Y42.34 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X73.326 Y47.531 Z2.4 F15000
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X72.513 Y48.344 E.03533
G1 X72.161 Y48.163
G1 X73.326 Y46.997 E.05064
G1 X73.326 Y46.464
G1 X72.161 Y47.629 E.05064
G1 X72.161 Y47.096
G1 X73.326 Y45.931 E.05064
G1 X73.326 Y45.398
M73 P97 R0
G1 X72.161 Y46.563 E.05064
G1 X72.161 Y46.03
G1 X73.326 Y44.864 E.05064
G1 X73.326 Y44.331
G1 X72.161 Y45.496 E.05064
G1 X72.161 Y44.963
G1 X73.326 Y43.798 E.05064
; WIPE_START
M204 S5000
G1 X72.161 Y44.963 E-.62621
G1 X72.161 Y45.315 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X72.161 Y44.43 Z2.4 F15000
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X76.002 Y40.589 E.16692
G1 X75.469 Y40.589
G1 X72.161 Y43.897 E.14374
G1 X72.161 Y43.363
G1 X74.936 Y40.589 E.12057
G1 X74.402 Y40.589
G1 X72.161 Y42.83 E.0974
G1 X72.161 Y42.297
G1 X73.869 Y40.589 E.07423
G1 X73.336 Y40.589
G1 X72.161 Y41.764 E.05105
G1 X72.161 Y41.23
G1 X72.803 Y40.589 E.02788
; WIPE_START
M204 S5000
G1 X72.161 Y41.23 E-.3448
G1 X72.161 Y41.764 E-.20264
G1 X72.557 Y41.368 E-.21257
; WIPE_END
G1 E-.04 F1800
G1 X73.323 Y43.751 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.105018
G1 F7500
G1 X73.215 Y43.643 E.00077
; WIPE_START
G1 X73.323 Y43.751 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X80.956 Y43.783 Z2.4 F15000
G1 X123.954 Y43.961 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X100.454 Y43.961 E.72209
G1 X100.454 Y40.381 E.11
G1 X125.534 Y40.381 E.77064
G1 X125.534 Y48.551 E.25103
G1 X123.954 Y48.551 E.04855
G1 X123.954 Y44.021 E.13918
; WIPE_START
M204 S5000
G1 X121.954 Y44.016 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.773 Y48.344 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X125.326 Y47.79 E.02406
G1 X125.326 Y47.257
G1 X124.239 Y48.344 E.04723
G1 X124.161 Y47.889
G1 X125.326 Y46.723 E.05064
G1 X125.326 Y46.19
G1 X124.161 Y47.355 E.05064
G1 X124.161 Y46.822
G1 X125.326 Y45.657 E.05064
G1 X125.326 Y45.124
G1 X124.161 Y46.289 E.05064
G1 X124.161 Y45.756
G1 X125.326 Y44.59 E.05064
G1 X125.326 Y44.057
G1 X124.161 Y45.222 E.05064
G1 X124.161 Y44.689
G1 X125.326 Y43.524 E.05064
G1 X125.326 Y42.991
G1 X124.161 Y44.156 E.05064
G1 X124.03 Y43.754
G1 X125.326 Y42.457 E.05634
G1 X125.326 Y41.924
G1 X123.496 Y43.754 E.07952
G1 X122.963 Y43.754
G1 X125.326 Y41.391 E.10269
G1 X125.326 Y40.858
G1 X122.43 Y43.754 E.12586
G1 X121.897 Y43.754
G1 X125.062 Y40.589 E.13755
G1 X124.529 Y40.589
G1 X121.363 Y43.754 E.13755
G1 X120.83 Y43.754
G1 X123.995 Y40.589 E.13755
G1 X123.462 Y40.589
G1 X120.297 Y43.754 E.13755
G1 X119.764 Y43.754
G1 X122.929 Y40.589 E.13755
G1 X122.396 Y40.589
G1 X119.23 Y43.754 E.13755
G1 X118.697 Y43.754
G1 X121.862 Y40.589 E.13755
G1 X121.329 Y40.589
G1 X118.164 Y43.754 E.13755
G1 X117.631 Y43.754
G1 X120.796 Y40.589 E.13755
G1 X120.263 Y40.589
G1 X117.097 Y43.754 E.13755
G1 X116.564 Y43.754
G1 X119.729 Y40.589 E.13755
G1 X119.196 Y40.589
G1 X116.031 Y43.754 E.13755
G1 X115.498 Y43.754
G1 X118.663 Y40.589 E.13755
G1 X118.13 Y40.589
G1 X114.964 Y43.754 E.13755
G1 X114.431 Y43.754
G1 X117.596 Y40.589 E.13755
G1 X117.063 Y40.589
G1 X113.898 Y43.754 E.13755
G1 X113.364 Y43.754
G1 X116.53 Y40.589 E.13755
G1 X115.996 Y40.589
G1 X112.831 Y43.754 E.13755
G1 X112.298 Y43.754
G1 X115.463 Y40.589 E.13755
G1 X114.93 Y40.589
G1 X111.765 Y43.754 E.13755
G1 X111.231 Y43.754
G1 X114.397 Y40.589 E.13755
G1 X113.863 Y40.589
G1 X110.698 Y43.754 E.13755
G1 X110.165 Y43.754
G1 X113.33 Y40.589 E.13755
G1 X112.797 Y40.589
G1 X109.632 Y43.754 E.13755
G1 X109.098 Y43.754
G1 X112.264 Y40.589 E.13755
G1 X111.73 Y40.589
G1 X108.565 Y43.754 E.13755
G1 X108.032 Y43.754
G1 X111.197 Y40.589 E.13755
G1 X110.664 Y40.589
G1 X107.499 Y43.754 E.13755
G1 X106.965 Y43.754
G1 X110.131 Y40.589 E.13755
G1 X109.597 Y40.589
G1 X106.432 Y43.754 E.13755
G1 X105.899 Y43.754
G1 X109.064 Y40.589 E.13755
G1 X108.531 Y40.589
G1 X105.366 Y43.754 E.13755
G1 X104.832 Y43.754
G1 X107.998 Y40.589 E.13755
G1 X107.464 Y40.589
G1 X104.299 Y43.754 E.13755
G1 X103.766 Y43.754
G1 X106.931 Y40.589 E.13755
G1 X106.398 Y40.589
G1 X103.233 Y43.754 E.13755
G1 X102.699 Y43.754
G1 X105.865 Y40.589 E.13755
G1 X105.331 Y40.589
G1 X102.166 Y43.754 E.13755
G1 X101.633 Y43.754
G1 X104.798 Y40.589 E.13755
G1 X104.265 Y40.589
G1 X101.1 Y43.754 E.13755
G1 X100.661 Y43.659
G1 X103.732 Y40.589 E.13343
G1 X103.198 Y40.589
G1 X100.661 Y43.126 E.11026
G1 X100.661 Y42.593
M73 P98 R0
G1 X102.665 Y40.589 E.08708
G1 X102.132 Y40.589
G1 X100.661 Y42.059 E.06391
G1 X100.661 Y41.526
G1 X101.599 Y40.589 E.04074
G1 X101.065 Y40.589
G1 X100.661 Y40.993 E.01757
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F6000
M204 S5000
G1 X101.065 Y40.589 E-.21725
G1 X101.599 Y40.589 E-.20264
G1 X100.966 Y41.222 E-.34012
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.217 J0 P1  F15000
; stop printing object, unique label id: 140
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
G1 Z2.5 F900 ; lower z a little
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

    G1 Z102 F600
    G1 Z100

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

