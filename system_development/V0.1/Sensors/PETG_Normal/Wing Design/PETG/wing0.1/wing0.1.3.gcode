; HEADER_BLOCK_START
; BambuStudio 02.06.00.51
; model printing time: 10m 55s; total estimated time: 17m 15s
; total layer number: 5
; total filament length [mm] : 850.89
; total filament volume [cm^3] : 2046.63
; total filament weight [g] : 2.62
; model label id: 98,109,120
; object max height: 1.00,1.00,1.00
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
; extruder_ams_count = 1#0|4#0;
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
M73 P0 R17
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
M73 P3 R16
G1 E50 F200
M400
M104 S250
G92 E0
M73 P28 R12
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S230 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P30 R12
G1 E-0.5 F300

M73 P31 R11
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
M73 P32 R11
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
    G29 A X73.8545 Y45.0825 I141.933 J165.769
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
M73 P33 R11
G1 Z.4 F15000
; object ids of layer 1 start: 98,109,120
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
; object ids of this layer1 end: 98,109,120
M625
; OBJECT_ID: 109
; start printing object, unique label id: 109
M624 AgAAAAAAAAA=
G1 X154.964 Y118.1
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
G1 X155.305 Y117.763 E.0173
G1 X155.702 Y117.499 E.01722
G1 X156.246 Y117.283 E.02112
G1 X156.961 Y117.182 E.02608
G1 X212.934 Y117.182 E2.02097
G1 X213.422 Y117.229 E.0177
M73 P34 R11
G1 X213.884 Y117.365 E.01739
G1 X214.241 Y117.541 E.01439
G1 X214.641 Y117.815 E.0175
G1 X214.978 Y118.156 E.0173
G1 X215.243 Y118.554 E.01726
G1 X215.443 Y119.046 E.01917
G1 X215.559 Y119.813 E.02802
G1 X215.559 Y205.785 E3.1041
G1 X215.512 Y206.273 E.0177
G1 X215.376 Y206.735 E.01739
G1 X215.2 Y207.093 E.01439
G1 X214.926 Y207.493 E.0175
G1 X214.585 Y207.83 E.0173
M73 P35 R11
G1 X214.188 Y208.094 E.01722
G1 X213.644 Y208.309 E.02112
G1 X212.929 Y208.41 E.02608
G1 X156.956 Y208.41 E2.02096
G1 X156.468 Y208.363 E.0177
G1 X156.006 Y208.227 E.01739
G1 X155.648 Y208.051 E.01439
G1 X155.248 Y207.777 E.0175
G1 X154.912 Y207.436 E.0173
G1 X154.647 Y207.039 E.01722
G1 X154.432 Y206.495 E.02112
G1 X154.331 Y205.78 E.02608
G1 X154.331 Y119.807 E3.10415
G1 X154.378 Y119.319 E.0177
G1 X154.514 Y118.857 E.01739
G1 X154.69 Y118.5 E.01439
G1 X154.93 Y118.149 E.01534
M204 S3000
G1 X155.307 Y118.411 F15000
G1 F1500
M204 S250
G1 X155.325 Y118.385 E.00115
M73 P36 R11
G1 X155.585 Y118.128 E.01319
G1 X155.903 Y117.914 E.01384
G1 X156.379 Y117.726 E.01849
G1 X157.002 Y117.639 E.02271
G1 X212.919 Y117.64 E2.01891
M73 P36 R10
G1 X213.347 Y117.684 E.01556
G1 X213.728 Y117.798 E.01434
G1 X214.018 Y117.942 E.01172
G1 X214.336 Y118.16 E.01391
G1 X214.613 Y118.437 E.01413
G1 X214.829 Y118.758 E.01398
G1 X214.993 Y119.153 E.01544
G1 X215.102 Y119.858 E.02576
G1 X215.102 Y205.757 E3.10147
G1 X215.057 Y206.199 E.01603
G1 X214.952 Y206.557 E.0135
G1 X214.799 Y206.87 E.01256
G1 X214.564 Y207.208 E.01485
G1 X214.304 Y207.464 E.01319
G1 X213.986 Y207.679 E.01384
G1 X213.51 Y207.867 E.01849
G1 X212.887 Y207.953 E.02271
G1 X156.984 Y207.953 E2.01843
G1 X156.542 Y207.909 E.01603
G1 X156.184 Y207.803 E.0135
M73 P37 R10
G1 X155.871 Y207.65 E.01256
G1 X155.533 Y207.416 E.01485
G1 X155.277 Y207.156 E.01319
G1 X155.062 Y206.838 E.01384
G1 X154.874 Y206.362 E.01849
G1 X154.788 Y205.739 E.02271
G1 X154.788 Y119.836 E3.10162
G1 X154.832 Y119.394 E.01603
G1 X154.938 Y119.035 E.0135
G1 X155.091 Y118.723 E.01256
G1 X155.273 Y118.461 E.01153
M204 S3000
G1 X155.648 Y118.725 F15000
G1 F1500
M204 S250
G1 X155.686 Y118.672 E.00236
G1 X155.887 Y118.476 E.01012
G1 X156.105 Y118.329 E.0095
G1 X156.512 Y118.169 E.01581
G1 X157.043 Y118.097 E.01935
G1 X212.888 Y118.097 E2.01634
G1 X213.245 Y118.133 E.01292
G1 X213.569 Y118.23 E.01224
G1 X213.794 Y118.343 E.00908
G1 X214.032 Y118.506 E.01042
G1 X214.249 Y118.72 E.011
G1 X214.417 Y118.964 E.0107
G1 X214.543 Y119.261 E.01167
G1 X214.644 Y119.903 E.02346
G1 X214.644 Y205.727 E3.09876
G1 X214.603 Y206.123 E.01436
G1 X214.519 Y206.402 E.01051
M73 P38 R10
G1 X214.397 Y206.646 E.00986
G1 X214.204 Y206.921 E.01214
G1 X214.003 Y207.116 E.01012
G1 X213.785 Y207.264 E.0095
G1 X213.377 Y207.424 E.01581
G1 X212.846 Y207.496 E.01935
G1 X157.014 Y207.496 E2.01588
G1 X156.618 Y207.455 E.01436
G1 X156.339 Y207.371 E.01051
G1 X156.095 Y207.249 E.00986
G1 X155.82 Y207.055 E.01214
G1 X155.625 Y206.854 E.01012
G1 X155.477 Y206.636 E.0095
G1 X155.317 Y206.229 E.01581
G1 X155.245 Y205.698 E.01935
G1 X155.245 Y119.865 E3.09906
G1 X155.286 Y119.47 E.01436
G1 X155.37 Y119.191 E.01051
G1 X155.492 Y118.947 E.00986
G1 X155.614 Y118.774 E.00762
M204 S3000
G1 X155.974 Y119.073 F15000
G1 F1500
M204 S250
G1 X156.141 Y118.872 E.00944
G1 X156.348 Y118.726 E.00914
G1 X156.545 Y118.633 E.00786
G1 X156.686 Y118.59 E.00535
G1 X156.964 Y118.554 E.01012
M73 P39 R10
G1 X212.922 Y118.554 E2.02041
G1 X213.233 Y118.601 E.01138
G1 X213.533 Y118.72 E.01165
G1 X213.796 Y118.916 E.01183
G1 X213.947 Y119.09 E.00833
G1 X214.109 Y119.399 E.01259
G1 X214.151 Y119.538 E.00524
G1 X214.187 Y119.816 E.01012
G1 X214.187 Y205.773 E3.10359
G1 X214.14 Y206.085 E.01138
G1 X214.021 Y206.385 E.01165
G1 X213.825 Y206.647 E.01183
G1 X213.651 Y206.799 E.00833
G1 X213.342 Y206.96 E.01259
G1 X213.203 Y207.003 E.00524
G1 X212.925 Y207.039 E.01012
G1 X156.968 Y207.039 E2.0204
G1 X156.656 Y206.991 E.01138
G1 X156.356 Y206.872 E.01165
G1 X156.094 Y206.676 E.01183
G1 X155.942 Y206.502 E.00833
G1 X155.781 Y206.193 E.01259
G1 X155.738 Y206.055 E.00524
G1 X155.702 Y205.777 E.01012
G1 X155.702 Y119.819 E3.10359
G1 X155.751 Y119.501 E.01161
G1 X155.823 Y119.293 E.00794
G1 X155.889 Y119.176 E.00489
G1 X155.936 Y119.119 E.00264
M204 S3000
G1 X156.297 Y119.393 F15000
G1 F1500
M204 S250
G1 X156.417 Y119.235 E.00718
G1 X156.531 Y119.145 E.00525
G1 X156.748 Y119.043 E.00865
G1 X156.955 Y119.011 E.00758
G1 X212.932 Y119.011 E2.02111
G1 X213.162 Y119.053 E.00845
G1 X213.354 Y119.14 E.00759
G1 X213.506 Y119.269 E.0072
M73 P40 R10
G1 X213.597 Y119.383 E.00525
G1 X213.698 Y119.599 E.00865
G1 X213.73 Y119.807 E.00758
G1 X213.73 Y205.784 E3.10429
G1 X213.688 Y206.014 E.00845
G1 X213.601 Y206.205 E.00759
G1 X213.472 Y206.358 E.0072
G1 X213.358 Y206.448 E.00525
G1 X213.142 Y206.55 E.00865
G1 X212.934 Y206.582 E.00758
G1 X156.957 Y206.582 E2.02111
G1 X156.727 Y206.54 E.00845
G1 X156.536 Y206.452 E.00759
G1 X156.383 Y206.324 E.0072
G1 X156.293 Y206.21 E.00525
G1 X156.191 Y205.993 E.00865
G1 X156.159 Y205.786 E.00758
G1 X156.159 Y119.809 E3.10429
G1 X156.202 Y119.575 E.00857
G1 X156.249 Y119.457 E.0046
G1 X156.261 Y119.441 E.0007
M204 S3000
G1 X156.658 Y119.661 F15000
G1 F1500
M204 S250
G1 X156.692 Y119.601 E.00249
G1 X156.828 Y119.492 E.00632
G1 X156.945 Y119.468 E.00429
G1 X212.945 Y119.468 E2.02194
G1 X213.055 Y119.496 E.00413
G1 X213.14 Y119.543 E.0035
G1 X213.249 Y119.68 E.00632
G1 X213.273 Y119.796 E.00429
G1 X213.273 Y205.796 E3.10512
G1 X213.245 Y205.907 E.00413
G1 X213.198 Y205.992 E.0035
G1 X213.061 Y206.101 E.00632
G1 X212.945 Y206.125 E.00429
M73 P41 R10
G1 X156.945 Y206.125 E2.02194
G1 X156.834 Y206.096 E.00413
G1 X156.749 Y206.049 E.0035
G1 X156.64 Y205.913 E.00632
G1 X156.616 Y205.796 E.00429
G1 X156.616 Y119.796 E3.10512
G1 X156.637 Y119.717 E.00297
; WIPE_START
G1 X156.692 Y119.601 E-.04866
G1 X156.828 Y119.492 E-.06647
G1 X156.945 Y119.468 E-.04514
G1 X158.523 Y119.468 E-.59973
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X162.585 Y125.929 Z.6 F15000
G1 X212.545 Y205.396 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X157.345 Y205.396 E1.99305
G1 X157.345 Y120.196 E3.07623
G1 X212.545 Y120.196 E1.99305
G1 X212.545 Y205.336 E3.07407
M204 S3000
G1 X212.088 Y204.939 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X157.802 Y204.939 E1.96005
G1 X157.802 Y120.653 E3.04323
M73 P42 R10
G1 X212.088 Y120.653 E1.96005
G1 X212.088 Y204.879 E3.04106
; WIPE_START
G1 X210.088 Y204.881 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
M73 P42 R9
G1 X210.203 Y197.25 Z.6 F15000
G1 X211.345 Y121.396 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X211.345 Y204.196 E2.98958
G1 X158.545 Y204.196 E1.9064
G1 X158.545 Y121.396 E2.98958
G1 X211.285 Y121.396 E1.90423
M204 S3000
G1 X211.345 Y120.939 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X211.802 Y120.939 E.0165
G1 X211.802 Y204.653 E3.02258
G1 X158.088 Y204.653 E1.9394
G1 X158.088 Y120.939 E3.02258
G1 X211.285 Y120.939 E1.92073
; OBJECT_ID: 98
; WIPE_START
G1 X211.802 Y120.939 E-.19649
M73 P43 R9
G1 X211.802 Y122.422 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; start printing object, unique label id: 98
M624 AQAAAAAAAAA=
M204 S3000
G1 X204.171 Y122.274 Z.6 F15000
G1 X135.311 Y120.939 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F1500
M204 S250
G1 X135.311 Y205.998 E3.07113
G1 X135.264 Y206.486 E.0177
G1 X135.128 Y206.948 E.01739
G1 X134.952 Y207.306 E.01439
G1 X134.678 Y207.705 E.0175
G1 X134.337 Y208.042 E.0173
G1 X133.94 Y208.307 E.01722
G1 X133.396 Y208.522 E.02112
G1 X132.681 Y208.623 E.02608
G1 X76.708 Y208.623 E2.02096
G1 X76.22 Y208.576 E.0177
G1 X75.758 Y208.44 E.01739
G1 X75.4 Y208.264 E.01439
G1 X75 Y207.99 E.0175
G1 X74.664 Y207.649 E.0173
G1 X74.399 Y207.252 E.01722
M73 P44 R9
G1 X74.184 Y206.708 E.02112
G1 X74.083 Y205.993 E.02608
G1 X74.083 Y120.02 E3.10415
G1 X74.13 Y119.532 E.0177
G1 X74.266 Y119.07 E.01739
G1 X74.442 Y118.712 E.01439
M73 P45 R9
G1 X74.716 Y118.312 E.0175
G1 X75.057 Y117.976 E.0173
G1 X75.454 Y117.711 E.01722
G1 X75.998 Y117.496 E.02112
G1 X76.713 Y117.395 E.02608
G1 X132.686 Y117.395 E2.02097
G1 X133.174 Y117.442 E.0177
G1 X133.636 Y117.578 E.01739
G1 X133.994 Y117.754 E.01439
G1 X134.393 Y118.028 E.0175
M73 P46 R9
G1 X134.73 Y118.369 E.0173
G1 X134.995 Y118.767 E.01726
G1 X135.195 Y119.259 E.01917
G1 X135.311 Y120.026 E.02802
G1 X135.311 Y120.879 E.03081
M204 S3000
G1 X134.854 Y120.879 F15000
G1 F1500
M204 S250
M73 P47 R9
G1 X134.854 Y205.97 E3.07227
G1 X134.81 Y206.411 E.01603
G1 X134.704 Y206.77 E.0135
M73 P48 R8
G1 X134.551 Y207.082 E.01256
G1 X134.316 Y207.42 E.01485
G1 X134.056 Y207.677 E.01319
G1 X133.739 Y207.891 E.01384
G1 X133.262 Y208.079 E.01849
G1 X132.639 Y208.166 E.02271
G1 X76.736 Y208.166 E2.01843
G1 X76.294 Y208.121 E.01603
G1 X75.936 Y208.016 E.0135
G1 X75.623 Y207.863 E.01256
G1 X75.286 Y207.628 E.01485
G1 X75.029 Y207.368 E.01319
G1 X74.814 Y207.051 E.01384
G1 X74.627 Y206.574 E.01849
G1 X74.54 Y205.951 E.02271
G1 X74.54 Y120.048 E3.10162
G1 X74.584 Y119.606 E.01603
G1 X74.69 Y119.248 E.0135
G1 X74.843 Y118.935 E.01256
G1 X75.078 Y118.598 E.01485
G1 X75.338 Y118.341 E.01319
G1 X75.655 Y118.126 E.01384
G1 X76.132 Y117.939 E.01849
G1 X76.755 Y117.852 E.02271
G1 X132.671 Y117.853 E2.01891
G1 X133.099 Y117.896 E.01556
G1 X133.48 Y118.01 E.01434
M73 P49 R8
G1 X133.77 Y118.155 E.01172
G1 X134.088 Y118.373 E.01391
G1 X134.365 Y118.65 E.01413
G1 X134.582 Y118.97 E.01398
G1 X134.745 Y119.365 E.01544
G1 X134.854 Y120.07 E.02576
G1 X134.854 Y120.819 E.02703
M204 S3000
G1 X134.397 Y120.819 F15000
G1 F1500
M204 S250
G1 X134.397 Y205.94 E3.07337
G1 X134.355 Y206.336 E.01436
G1 X134.271 Y206.614 E.01051
G1 X134.15 Y206.859 E.00986
G1 X133.956 Y207.134 E.01214
G1 X133.755 Y207.329 E.01012
G1 X133.537 Y207.476 E.0095
G1 X133.129 Y207.636 E.01581
G1 X132.598 Y207.709 E.01935
G1 X76.766 Y207.709 E2.01588
G1 X76.37 Y207.667 E.01436
G1 X76.092 Y207.583 E.01051
G1 X75.847 Y207.462 E.00986
G1 X75.572 Y207.268 E.01214
G1 X75.377 Y207.067 E.01012
G1 X75.23 Y206.849 E.0095
G1 X75.07 Y206.441 E.01581
G1 X74.997 Y205.91 E.01935
G1 X74.997 Y120.078 E3.09906
G1 X75.038 Y119.682 E.01436
G1 X75.123 Y119.404 E.01051
G1 X75.244 Y119.159 E.00986
G1 X75.438 Y118.884 E.01214
G1 X75.639 Y118.689 E.01012
G1 X75.857 Y118.542 E.0095
G1 X76.265 Y118.381 E.01581
G1 X76.796 Y118.309 E.01935
G1 X132.641 Y118.31 E2.01634
G1 X132.997 Y118.345 E.01292
G1 X133.322 Y118.442 E.01224
M73 P50 R8
G1 X133.546 Y118.555 E.00908
G1 X133.784 Y118.719 E.01042
G1 X134.001 Y118.932 E.011
G1 X134.169 Y119.176 E.0107
G1 X134.296 Y119.474 E.01167
G1 X134.397 Y120.116 E.02346
G1 X134.397 Y120.759 E.02323
M204 S3000
G1 X133.94 Y120.759 F15000
G1 F1500
M204 S250
G1 X133.94 Y205.986 E3.07719
G1 X133.892 Y206.297 E.01138
G1 X133.773 Y206.597 E.01165
G1 X133.577 Y206.86 E.01183
G1 X133.403 Y207.011 E.00833
G1 X133.094 Y207.173 E.01259
G1 X132.955 Y207.215 E.00524
G1 X132.677 Y207.252 E.01012
G1 X76.72 Y207.252 E2.0204
G1 X76.408 Y207.204 E.01138
G1 X76.109 Y207.085 E.01165
G1 X75.846 Y206.889 E.01183
G1 X75.694 Y206.715 E.00833
G1 X75.533 Y206.406 E.01259
G1 X75.491 Y206.267 E.00524
G1 X75.454 Y205.989 E.01012
G1 X75.454 Y120.032 E3.10359
G1 X75.503 Y119.714 E.01161
G1 X75.575 Y119.506 E.00794
G1 X75.641 Y119.388 E.00489
G1 X75.893 Y119.084 E.01425
G1 X76.1 Y118.938 E.00914
G1 X76.297 Y118.846 E.00786
G1 X76.439 Y118.803 E.00535
G1 X76.716 Y118.766 E.01012
G1 X132.674 Y118.766 E2.02041
G1 X132.985 Y118.814 E.01138
G1 X133.285 Y118.933 E.01165
G1 X133.548 Y119.129 E.01183
G1 X133.699 Y119.303 E.00833
M73 P51 R8
G1 X133.861 Y119.612 E.01259
G1 X133.903 Y119.75 E.00524
G1 X133.94 Y120.028 E.01012
G1 X133.94 Y120.699 E.02422
M204 S3000
G1 X133.483 Y120.699 F15000
G1 F1500
M204 S250
G1 X133.483 Y205.996 E3.07974
G1 X133.44 Y206.227 E.00845
G1 X133.353 Y206.418 E.00759
G1 X133.224 Y206.57 E.0072
G1 X133.111 Y206.661 E.00525
G1 X132.894 Y206.762 E.00865
G1 X132.686 Y206.794 E.00758
G1 X76.709 Y206.794 E2.02111
G1 X76.479 Y206.752 E.00845
G1 X76.288 Y206.665 E.00759
G1 X76.136 Y206.536 E.0072
G1 X76.045 Y206.423 E.00525
G1 X75.943 Y206.206 E.00865
G1 X75.911 Y205.998 E.00758
G1 X75.911 Y120.021 E3.10429
G1 X75.954 Y119.788 E.00857
G1 X76.001 Y119.669 E.0046
G1 X76.17 Y119.448 E.01005
G1 X76.283 Y119.357 E.00525
G1 X76.5 Y119.255 E.00865
G1 X76.707 Y119.223 E.00758
G1 X132.684 Y119.223 E2.02111
G1 X132.915 Y119.265 E.00845
M73 P52 R8
G1 X133.106 Y119.353 E.00759
G1 X133.258 Y119.481 E.0072
G1 X133.349 Y119.595 E.00525
G1 X133.451 Y119.812 E.00865
G1 X133.483 Y120.019 E.00758
G1 X133.483 Y120.639 E.02238
M204 S3000
G1 X133.025 Y120.639 F15000
G1 F1500
M204 S250
G1 X133.025 Y206.009 E3.08236
G1 X132.997 Y206.119 E.00413
G1 X132.95 Y206.204 E.0035
G1 X132.813 Y206.313 E.00632
G1 X132.697 Y206.337 E.00429
G1 X76.697 Y206.337 E2.02194
G1 X76.586 Y206.309 E.00413
G1 X76.502 Y206.262 E.0035
G1 X76.393 Y206.125 E.00632
G1 X76.368 Y206.009 E.00429
G1 X76.368 Y120.009 E3.10512
G1 X76.397 Y119.898 E.00413
G1 X76.444 Y119.814 E.0035
G1 X76.581 Y119.705 E.00632
G1 X76.697 Y119.68 E.00429
G1 X132.697 Y119.68 E2.02194
G1 X132.808 Y119.709 E.00413
G1 X132.892 Y119.756 E.0035
G1 X133.001 Y119.893 E.00632
G1 X133.025 Y120.009 E.00429
M73 P53 R8
G1 X133.025 Y120.579 E.02059
; WIPE_START
G1 X133.025 Y122.579 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X132.958 Y130.211 Z.6 F15000
G1 X132.297 Y205.609 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X77.097 Y205.609 E1.99305
G1 X77.097 Y120.409 E3.07623
G1 X132.297 Y120.409 E1.99305
G1 X132.297 Y205.549 E3.07407
M204 S3000
G1 X131.84 Y205.152 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X77.554 Y205.152 E1.96005
G1 X77.554 Y120.866 E3.04323
G1 X131.84 Y120.866 E1.96005
G1 X131.84 Y205.092 E3.04106
; WIPE_START
G1 X129.84 Y205.094 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X129.955 Y197.462 Z.6 F15000
M73 P53 R7
G1 X131.097 Y121.609 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X131.097 Y204.409 E2.98958
G1 X78.297 Y204.409 E1.9064
G1 X78.297 Y121.609 E2.98958
G1 X131.037 Y121.609 E1.90423
M204 S3000
G1 X131.097 Y121.152 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
M73 P54 R7
G1 X131.554 Y121.152 E.0165
G1 X131.554 Y204.866 E3.02258
G1 X77.84 Y204.866 E1.9394
G1 X77.84 Y121.152 E3.02258
G1 X131.037 Y121.152 E1.92073
; OBJECT_ID: 120
; WIPE_START
G1 X131.554 Y121.152 E-.19649
G1 X131.554 Y122.635 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 98
M625
; start printing object, unique label id: 120
M624 BAAAAAAAAAA=
M204 S3000
G1 X131.336 Y115.005 Z.6 F15000
G1 X131.037 Y104.539 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F1500
M204 S250
G1 X101.251 Y104.539 E1.07545
G1 X100.763 Y104.492 E.0177
G1 X100.3 Y104.355 E.01745
G1 X100.025 Y104.225 E.01096
G1 X99.542 Y103.905 E.02093
G1 X99.207 Y103.565 E.01724
G1 X98.942 Y103.167 E.01726
G1 X98.742 Y102.675 E.01917
G1 X98.626 Y101.908 E.02802
G1 X98.626 Y45.936 E2.02093
G1 X98.673 Y45.448 E.0177
M73 P55 R7
G1 X98.81 Y44.984 E.01745
G1 X98.94 Y44.71 E.01096
G1 X99.26 Y44.227 E.02093
G1 X99.6 Y43.892 E.01724
G1 X99.998 Y43.627 E.01726
G1 X100.49 Y43.427 E.01917
G1 X101.257 Y43.311 E.02802
M73 P56 R7
G1 X187.229 Y43.311 E3.10411
G1 X187.717 Y43.358 E.0177
G1 X188.179 Y43.494 E.01739
G1 X188.537 Y43.67 E.01439
G1 X188.937 Y43.944 E.0175
G1 X189.273 Y44.285 E.0173
M73 P57 R7
G1 X189.539 Y44.683 E.01726
G1 X189.739 Y45.175 E.01917
G1 X189.854 Y45.942 E.02802
G1 X189.854 Y101.914 E2.02092
G1 X189.807 Y102.402 E.0177
G1 X189.671 Y102.866 E.01745
G1 X189.54 Y103.14 E.01096
G1 X189.22 Y103.623 E.02093
G1 X188.88 Y103.958 E.01724
G1 X188.482 Y104.223 E.01726
M73 P58 R7
G1 X187.99 Y104.423 E.01917
G1 X187.223 Y104.539 E.02802
G1 X131.097 Y104.539 E2.02649
M204 S3000
G1 X131.097 Y104.082 F15000
G1 F1500
M204 S250
G1 X101.279 Y104.082 E1.07659
G1 X100.863 Y104.042 E.01509
M73 P59 R7
G1 X100.453 Y103.923 E.01542
G1 X100.243 Y103.821 E.00844
G1 X99.846 Y103.558 E.01718
G1 X99.556 Y103.264 E.01492
G1 X99.343 Y102.939 E.01403
G1 X99.192 Y102.568 E.01444
G1 X99.083 Y101.863 E.02576
G1 X99.083 Y45.964 E2.0183
G1 X99.123 Y45.548 E.01509
G1 X99.242 Y45.138 E.01542
M73 P59 R6
G1 X99.344 Y44.928 E.00844
G1 X99.607 Y44.531 E.01718
G1 X99.901 Y44.24 E.01492
G1 X100.226 Y44.027 E.01403
G1 X100.597 Y43.877 E.01444
G1 X101.302 Y43.768 E.02576
G1 X187.214 Y43.769 E3.10195
G1 X187.643 Y43.812 E.01556
G1 X188.023 Y43.926 E.01434
G1 X188.314 Y44.071 E.01172
G1 X188.631 Y44.289 E.01391
G1 X188.908 Y44.566 E.01413
G1 X189.125 Y44.886 E.01398
G1 X189.288 Y45.281 E.01544
G1 X189.397 Y45.987 E.02576
G1 X189.397 Y101.886 E2.01829
G1 X189.358 Y102.302 E.01509
G1 X189.238 Y102.712 E.01542
M73 P60 R6
G1 X189.136 Y102.922 E.00844
G1 X188.873 Y103.319 E.01718
G1 X188.579 Y103.609 E.01492
G1 X188.254 Y103.823 E.01403
G1 X187.884 Y103.973 E.01444
G1 X187.179 Y104.082 E.02576
G1 X131.157 Y104.082 E2.02272
M204 S3000
G1 X131.157 Y103.625 F15000
G1 F1500
M204 S250
G1 X101.307 Y103.625 E1.07774
G1 X100.937 Y103.588 E.01344
G1 X100.608 Y103.49 E.01241
G1 X100.462 Y103.418 E.00588
G1 X100.15 Y103.211 E.01351
G1 X99.905 Y102.963 E.01256
G1 X99.744 Y102.713 E.01075
G1 X99.641 Y102.461 E.00983
G1 X99.54 Y101.818 E.0235
G1 X99.54 Y45.992 E2.01565
G1 X99.577 Y45.622 E.01343
G1 X99.675 Y45.293 E.01241
G1 X99.747 Y45.147 E.00588
G1 X99.954 Y44.835 E.01351
G1 X100.202 Y44.59 E.01256
G1 X100.452 Y44.429 E.01075
G1 X100.704 Y44.326 E.00983
G1 X101.347 Y44.225 E.0235
G1 X187.184 Y44.226 E3.09922
G1 X187.54 Y44.261 E.01292
G1 X187.865 Y44.358 E.01224
G1 X188.089 Y44.471 E.00908
G1 X188.328 Y44.635 E.01042
G1 X188.545 Y44.848 E.011
G1 X188.713 Y45.093 E.0107
G1 X188.839 Y45.39 E.01167
G1 X188.94 Y46.032 E.02346
G1 X188.94 Y101.858 E2.01564
G1 X188.903 Y102.228 E.01344
G1 X188.805 Y102.557 E.01241
M73 P61 R6
G1 X188.733 Y102.703 E.00588
G1 X188.526 Y103.015 E.01351
G1 X188.279 Y103.26 E.01256
G1 X188.028 Y103.421 E.01075
G1 X187.776 Y103.524 E.00983
G1 X187.133 Y103.625 E.0235
G1 X131.217 Y103.625 E2.01891
M204 S3000
G1 X131.217 Y103.168 F15000
G1 F1500
M204 S250
G1 X101.263 Y103.168 E1.08151
G1 X100.947 Y103.119 E.01156
G1 X100.829 Y103.082 E.00446
G1 X100.527 Y102.922 E.01232
G1 X100.318 Y102.731 E.01023
G1 X100.169 Y102.522 E.00926
G1 X100.077 Y102.325 E.00786
G1 X100.034 Y102.183 E.00535
G1 X99.997 Y101.905 E.01012
G1 X99.997 Y45.948 E2.02041
G1 X100.046 Y45.63 E.01161
G1 X100.118 Y45.422 E.00794
G1 X100.185 Y45.304 E.00489
G1 X100.436 Y45 E.01425
G1 X100.643 Y44.854 E.00914
G1 X100.84 Y44.762 E.00786
G1 X100.982 Y44.719 E.00535
G1 X101.26 Y44.682 E.01012
G1 X187.217 Y44.682 E3.10359
G1 X187.534 Y44.731 E.01156
G1 X187.652 Y44.768 E.00446
M73 P62 R6
G1 X187.953 Y44.928 E.01232
G1 X188.163 Y45.119 E.01024
G1 X188.311 Y45.328 E.00926
G1 X188.403 Y45.525 E.00785
G1 X188.446 Y45.666 E.00535
G1 X188.483 Y45.944 E.01012
G1 X188.483 Y101.902 E2.0204
G1 X188.434 Y102.218 E.01156
G1 X188.397 Y102.336 E.00446
G1 X188.237 Y102.638 E.01232
G1 X188.046 Y102.848 E.01024
G1 X187.837 Y102.996 E.00926
G1 X187.64 Y103.088 E.00785
G1 X187.499 Y103.131 E.00535
G1 X187.221 Y103.168 E.01012
G1 X131.277 Y103.168 E2.01991
M204 S3000
G1 X131.277 Y102.71 F15000
G1 F1500
M204 S250
G1 X101.253 Y102.71 E1.08406
G1 X101.022 Y102.668 E.00845
G1 X100.831 Y102.581 E.00759
G1 X100.679 Y102.452 E.0072
G1 X100.588 Y102.339 E.00525
G1 X100.487 Y102.122 E.00865
G1 X100.455 Y101.914 E.00758
G1 X100.455 Y45.937 E2.02111
G1 X100.497 Y45.704 E.00857
G1 X100.544 Y45.585 E.0046
G1 X100.713 Y45.364 E.01005
G1 X100.826 Y45.273 E.00525
M73 P63 R6
G1 X101.043 Y45.171 E.00865
G1 X101.251 Y45.139 E.00758
G1 X187.228 Y45.139 E3.10429
G1 X187.458 Y45.181 E.00845
G1 X187.649 Y45.269 E.00759
G1 X187.801 Y45.398 E.0072
G1 X187.892 Y45.511 E.00525
G1 X187.994 Y45.728 E.00865
G1 X188.026 Y45.935 E.00758
G1 X188.026 Y101.912 E2.02111
G1 X187.984 Y102.143 E.00845
G1 X187.896 Y102.334 E.00759
G1 X187.768 Y102.486 E.0072
G1 X187.654 Y102.577 E.00525
G1 X187.437 Y102.678 E.00865
G1 X187.23 Y102.71 E.00758
G1 X131.337 Y102.71 E2.01806
M204 S3000
G1 X131.337 Y102.253 F15000
G1 F1500
M204 S250
G1 X101.24 Y102.253 E1.08667
G1 X101.13 Y102.225 E.00413
G1 X101.045 Y102.178 E.0035
G1 X100.936 Y102.041 E.00632
G1 X100.912 Y101.925 E.00429
G1 X100.912 Y45.925 E2.02194
G1 X100.94 Y45.814 E.00413
G1 X100.987 Y45.73 E.0035
G1 X101.124 Y45.621 E.00632
G1 X101.24 Y45.596 E.00429
G1 X187.24 Y45.596 E3.10512
G1 X187.351 Y45.625 E.00413
G1 X187.435 Y45.672 E.0035
G1 X187.544 Y45.809 E.00632
G1 X187.569 Y45.925 E.00429
G1 X187.569 Y101.925 E2.02194
G1 X187.54 Y102.036 E.00413
M73 P64 R6
G1 X187.493 Y102.12 E.0035
G1 X187.356 Y102.229 E.00632
G1 X187.24 Y102.253 E.00429
G1 X131.397 Y102.253 E2.01628
; WIPE_START
G1 X129.397 Y102.253 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X137.029 Y102.157 Z.6 F15000
G1 X186.84 Y101.525 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X101.64 Y101.525 E3.07623
G1 X101.64 Y46.325 E1.99305
G1 X186.84 Y46.325 E3.07623
G1 X186.84 Y101.465 E1.99089
M204 S3000
G1 X186.383 Y101.068 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X102.097 Y101.068 E3.04323
G1 X102.097 Y46.782 E1.96005
G1 X186.383 Y46.782 E3.04323
G1 X186.383 Y101.008 E1.95788
; WIPE_START
G1 X184.383 Y101.009 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X185.64 Y100.325 Z.6 F15000
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X102.84 Y100.325 E2.98958
G1 X102.84 Y47.525 E1.9064
G1 X185.64 Y47.525 E2.98958
G1 X185.64 Y100.265 E1.90423
M204 S3000
M73 P65 R6
G1 X186.097 Y100.325 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X186.097 Y100.782 E.0165
M73 P65 R5
G1 X102.383 Y100.782 E3.02258
G1 X102.383 Y47.068 E1.9394
G1 X186.097 Y47.068 E3.02258
G1 X186.097 Y100.265 E1.92073
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1500
G1 X186.097 Y100.782 E-.19649
G1 X184.614 Y100.782 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 120
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
; object ids of layer 2 start: 98,109,120
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
; object ids of this layer2 end: 98,109,120
M625
; OBJECT_ID: 109
; start printing object, unique label id: 109
M624 AgAAAAAAAAA=
G1 X211.547 Y204.006
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.45
G1 F9000
G1 X211.547 Y204.398 E.01261
G1 X158.343 Y204.398 E1.71085
M73 P66 R5
G1 X158.343 Y121.194 E2.67554
G1 X211.547 Y121.194 E1.71085
G1 X211.547 Y203.946 E2.66101
M204 S250
G1 X211.155 Y204.006 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X158.735 Y204.006 E1.56141
G1 X158.735 Y121.586 E2.45501
G1 X211.155 Y121.586 E1.56141
G1 X211.155 Y203.946 E2.45322
; WIPE_START
M204 S5000
G1 X209.155 Y203.949 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X212.343 Y205.194 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P67 R5
G1 X157.547 Y205.194 E1.76204
G1 X157.547 Y120.398 E2.72673
G1 X212.343 Y120.398 E1.76204
G1 X212.343 Y205.134 E2.7248
M204 S250
G1 X212.735 Y205.586 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
M73 P68 R5
G1 X157.155 Y205.586 E1.65554
G1 X157.155 Y120.006 E2.54914
G1 X212.735 Y120.006 E1.65554
G1 X212.735 Y205.526 E2.54735
; WIPE_START
M204 S5000
G1 X210.735 Y205.528 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.911 Y204.763 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
M73 P69 R5
G1 F7500
G1 X211.831 Y204.78 E.00278
; LINE_WIDTH: 0.448395
G1 X211.75 Y204.796 E.00263
; LINE_WIDTH: 0.43172
G1 X158.139 Y204.796 E1.64653
; LINE_WIDTH: 0.470635
G1 X157.978 Y204.763 E.00556
G1 X157.961 Y204.682 E.00278
; LINE_WIDTH: 0.448395
G1 X157.945 Y204.602 E.00263
; LINE_WIDTH: 0.431737
M73 P70 R5
G1 X157.945 Y120.991 E2.56801
G1 X157.961 Y120.91 E.00253
; LINE_WIDTH: 0.481759
G1 X157.978 Y120.83 E.00285
; LINE_WIDTH: 0.481745
G1 X158.059 Y120.813 E.00285
; LINE_WIDTH: 0.448395
G1 X158.139 Y120.796 E.00263
; LINE_WIDTH: 0.43172
G1 X211.75 Y120.796 E1.64653
; LINE_WIDTH: 0.470635
G1 X211.911 Y120.83 E.00556
G1 X211.928 Y120.91 E.00278
; LINE_WIDTH: 0.448395
G1 X211.945 Y120.991 E.00263
; LINE_WIDTH: 0.43172
G1 X211.945 Y204.602 E2.5679
; LINE_WIDTH: 0.470635
G1 X211.924 Y204.704 E.00353
; OBJECT_ID: 98
; WIPE_START
G1 X211.831 Y204.78 E-.04541
G1 X211.75 Y204.796 E-.03125
G1 X209.952 Y204.796 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; start printing object, unique label id: 98
M624 AQAAAAAAAAA=
G1 X202.32 Y204.74 Z.8 F15000
G1 X131.299 Y204.219 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P71 R5
G1 F9000
M73 P71 R4
G1 X131.299 Y204.611 E.01261
G1 X78.095 Y204.611 E1.71085
G1 X78.095 Y121.407 E2.67554
G1 X131.299 Y121.407 E1.71085
G1 X131.299 Y204.159 E2.66101
M204 S250
G1 X130.907 Y204.219 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X78.487 Y204.219 E1.56141
G1 X78.487 Y121.799 E2.45501
G1 X130.907 Y121.799 E1.56141
G1 X130.907 Y204.159 E2.45322
; WIPE_START
M204 S5000
G1 X128.907 Y204.161 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.095 Y205.407 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X77.299 Y205.407 E1.76204
G1 X77.299 Y120.611 E2.72673
G1 X132.095 Y120.611 E1.76204
G1 X132.095 Y205.347 E2.7248
M204 S250
G1 X132.487 Y205.799 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X76.907 Y205.799 E1.65554
G1 X76.907 Y120.219 E2.54914
G1 X132.487 Y120.219 E1.65554
G1 X132.487 Y205.739 E2.54735
; WIPE_START
M204 S5000
G1 X130.487 Y205.741 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.664 Y204.976 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X131.583 Y204.992 E.00278
; LINE_WIDTH: 0.448395
G1 X131.503 Y205.009 E.00263
; LINE_WIDTH: 0.43172
G1 X77.891 Y205.009 E1.64653
; LINE_WIDTH: 0.470635
G1 X77.73 Y204.976 E.00556
G1 X77.714 Y204.895 E.00278
; LINE_WIDTH: 0.448395
G1 X77.697 Y204.814 E.00263
; LINE_WIDTH: 0.431737
G1 X77.697 Y121.203 E2.56801
G1 X77.714 Y121.123 E.00253
; LINE_WIDTH: 0.481759
G1 X77.73 Y121.042 E.00285
; LINE_WIDTH: 0.481745
G1 X77.811 Y121.026 E.00285
; LINE_WIDTH: 0.448395
G1 X77.891 Y121.009 E.00263
; LINE_WIDTH: 0.43172
G1 X131.503 Y121.009 E1.64653
; LINE_WIDTH: 0.470635
G1 X131.664 Y121.042 E.00556
G1 X131.68 Y121.123 E.00278
; LINE_WIDTH: 0.448395
M73 P72 R4
G1 X131.697 Y121.203 E.00263
; LINE_WIDTH: 0.43172
G1 X131.697 Y204.814 E2.5679
; LINE_WIDTH: 0.470635
G1 X131.676 Y204.917 E.00353
; OBJECT_ID: 120
; WIPE_START
G1 X131.583 Y204.992 E-.04541
G1 X131.503 Y205.009 E-.03125
G1 X129.704 Y205.009 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 98
M625
; start printing object, unique label id: 120
M624 BAAAAAAAAAA=
G1 X133.306 Y198.28 Z.8 F15000
G1 X185.842 Y100.135 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X185.842 Y100.527 E.01261
G1 X102.638 Y100.527 E2.67554
G1 X102.638 Y47.323 E1.71085
G1 X185.842 Y47.323 E2.67554
G1 X185.842 Y100.075 E1.69631
M204 S250
G1 X185.45 Y100.135 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X103.03 Y100.135 E2.45501
G1 X103.03 Y47.715 E1.56141
G1 X185.45 Y47.715 E2.45501
G1 X185.45 Y100.075 E1.55963
; WIPE_START
M204 S5000
G1 X183.45 Y100.076 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X186.638 Y101.323 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X101.842 Y101.323 E2.72673
G1 X101.842 Y46.527 E1.76204
G1 X186.638 Y46.527 E2.72673
G1 X186.638 Y101.263 E1.76011
M204 S250
G1 X187.03 Y101.715 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X101.45 Y101.715 E2.54914
G1 X101.45 Y46.135 E1.65554
G1 X187.03 Y46.135 E2.54914
G1 X187.03 Y101.655 E1.65375
; WIPE_START
M204 S5000
M73 P73 R4
G1 X185.03 Y101.656 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X186.207 Y100.892 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X186.126 Y100.908 E.00278
; LINE_WIDTH: 0.448395
G1 X186.046 Y100.925 E.00263
; LINE_WIDTH: 0.43172
G1 X102.435 Y100.925 E2.5679
; LINE_WIDTH: 0.470635
G1 X102.273 Y100.892 E.00556
G1 X102.257 Y100.811 E.00278
; LINE_WIDTH: 0.448395
G1 X102.24 Y100.73 E.00263
; LINE_WIDTH: 0.431746
G1 X102.24 Y47.119 E1.64664
G1 X102.257 Y47.039 E.00253
; LINE_WIDTH: 0.481759
G1 X102.273 Y46.958 E.00285
; LINE_WIDTH: 0.481745
G1 X102.354 Y46.942 E.00285
; LINE_WIDTH: 0.448395
G1 X102.435 Y46.925 E.00263
; LINE_WIDTH: 0.43172
G1 X186.046 Y46.925 E2.5679
; LINE_WIDTH: 0.470635
G1 X186.207 Y46.958 E.00556
G1 X186.223 Y47.039 E.00278
; LINE_WIDTH: 0.448395
G1 X186.24 Y47.119 E.00263
; LINE_WIDTH: 0.43172
G1 X186.24 Y100.73 E1.64653
; LINE_WIDTH: 0.470635
G1 X186.219 Y100.833 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X186.126 Y100.908 E-.04541
G1 X186.046 Y100.925 E-.03125
G1 X184.247 Y100.925 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 120
M625
; layer num/total_layer_count: 3/5
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F15000
; object ids of layer 3 start: 98,109,120
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
; object ids of this layer3 end: 98,109,120
M625
; OBJECT_ID: 109
; start printing object, unique label id: 109
M624 AgAAAAAAAAA=
G1 X211.547 Y204.006
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X211.547 Y204.398 E.01261
G1 X158.343 Y204.398 E1.71085
G1 X158.343 Y121.194 E2.67554
G1 X211.547 Y121.194 E1.71085
G1 X211.547 Y203.946 E2.66101
M204 S250
G1 X211.155 Y204.006 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X158.735 Y204.006 E1.56141
G1 X158.735 Y121.586 E2.45501
G1 X211.155 Y121.586 E1.56141
G1 X211.155 Y203.946 E2.45322
; WIPE_START
M204 S5000
G1 X209.155 Y203.949 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X212.343 Y205.194 Z1 F15000
M73 P74 R4
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X157.547 Y205.194 E1.76204
G1 X157.547 Y120.398 E2.72673
G1 X212.343 Y120.398 E1.76204
G1 X212.343 Y205.134 E2.7248
M204 S250
G1 X212.735 Y205.586 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X157.155 Y205.586 E1.65554
G1 X157.155 Y120.006 E2.54914
G1 X212.735 Y120.006 E1.65554
G1 X212.735 Y205.526 E2.54735
; WIPE_START
M204 S5000
G1 X210.735 Y205.528 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.911 Y204.763 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X211.831 Y204.78 E.00278
; LINE_WIDTH: 0.448395
G1 X211.75 Y204.796 E.00263
; LINE_WIDTH: 0.43172
G1 X158.139 Y204.796 E1.64653
; LINE_WIDTH: 0.470635
G1 X157.978 Y204.763 E.00556
G1 X157.961 Y204.682 E.00278
; LINE_WIDTH: 0.448395
G1 X157.945 Y204.602 E.00263
; LINE_WIDTH: 0.431737
G1 X157.945 Y120.991 E2.56801
G1 X157.961 Y120.91 E.00253
; LINE_WIDTH: 0.481759
G1 X157.978 Y120.83 E.00285
; LINE_WIDTH: 0.481745
G1 X158.059 Y120.813 E.00285
; LINE_WIDTH: 0.448395
G1 X158.139 Y120.796 E.00263
; LINE_WIDTH: 0.43172
G1 X211.75 Y120.796 E1.64653
; LINE_WIDTH: 0.470635
G1 X211.911 Y120.83 E.00556
G1 X211.928 Y120.91 E.00278
; LINE_WIDTH: 0.448395
G1 X211.945 Y120.991 E.00263
; LINE_WIDTH: 0.43172
G1 X211.945 Y204.602 E2.5679
; LINE_WIDTH: 0.470635
G1 X211.924 Y204.704 E.00353
; OBJECT_ID: 98
; WIPE_START
G1 X211.831 Y204.78 E-.04541
G1 X211.75 Y204.796 E-.03125
G1 X209.952 Y204.796 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; start printing object, unique label id: 98
M624 AQAAAAAAAAA=
G1 X202.32 Y204.74 Z1 F15000
G1 X131.299 Y204.219 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X131.299 Y204.611 E.01261
G1 X78.095 Y204.611 E1.71085
G1 X78.095 Y121.407 E2.67554
G1 X131.299 Y121.407 E1.71085
G1 X131.299 Y204.159 E2.66101
M204 S250
G1 X130.907 Y204.219 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
M73 P75 R4
G1 X78.487 Y204.219 E1.56141
G1 X78.487 Y121.799 E2.45501
G1 X130.907 Y121.799 E1.56141
G1 X130.907 Y204.159 E2.45322
; WIPE_START
M204 S5000
G1 X128.907 Y204.161 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.095 Y205.407 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X77.299 Y205.407 E1.76204
G1 X77.299 Y120.611 E2.72673
G1 X132.095 Y120.611 E1.76204
G1 X132.095 Y205.347 E2.7248
M204 S250
G1 X132.487 Y205.799 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X76.907 Y205.799 E1.65554
G1 X76.907 Y120.219 E2.54914
G1 X132.487 Y120.219 E1.65554
G1 X132.487 Y205.739 E2.54735
; WIPE_START
M204 S5000
G1 X130.487 Y205.741 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.664 Y204.976 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X131.583 Y204.992 E.00278
; LINE_WIDTH: 0.448395
G1 X131.503 Y205.009 E.00263
; LINE_WIDTH: 0.43172
G1 X77.891 Y205.009 E1.64653
; LINE_WIDTH: 0.470635
G1 X77.73 Y204.976 E.00556
G1 X77.714 Y204.895 E.00278
; LINE_WIDTH: 0.448395
G1 X77.697 Y204.814 E.00263
; LINE_WIDTH: 0.431737
G1 X77.697 Y121.203 E2.56801
G1 X77.714 Y121.123 E.00253
; LINE_WIDTH: 0.481759
G1 X77.73 Y121.042 E.00285
; LINE_WIDTH: 0.481745
G1 X77.811 Y121.026 E.00285
; LINE_WIDTH: 0.448395
G1 X77.891 Y121.009 E.00263
; LINE_WIDTH: 0.43172
G1 X131.503 Y121.009 E1.64653
; LINE_WIDTH: 0.470635
G1 X131.664 Y121.042 E.00556
G1 X131.68 Y121.123 E.00278
; LINE_WIDTH: 0.448395
G1 X131.697 Y121.203 E.00263
; LINE_WIDTH: 0.43172
G1 X131.697 Y204.814 E2.5679
; LINE_WIDTH: 0.470635
G1 X131.676 Y204.917 E.00353
; OBJECT_ID: 120
; WIPE_START
G1 X131.583 Y204.992 E-.04541
G1 X131.503 Y205.009 E-.03125
G1 X129.704 Y205.009 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 98
M625
; start printing object, unique label id: 120
M624 BAAAAAAAAAA=
G1 X133.306 Y198.28 Z1 F15000
G1 X185.842 Y100.135 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P76 R4
G1 F9000
G1 X185.842 Y100.527 E.01261
G1 X102.638 Y100.527 E2.67554
G1 X102.638 Y47.323 E1.71085
G1 X185.842 Y47.323 E2.67554
G1 X185.842 Y100.075 E1.69631
M204 S250
G1 X185.45 Y100.135 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X103.03 Y100.135 E2.45501
G1 X103.03 Y47.715 E1.56141
G1 X185.45 Y47.715 E2.45501
G1 X185.45 Y100.075 E1.55963
; WIPE_START
M204 S5000
G1 X183.45 Y100.076 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X186.638 Y101.323 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X101.842 Y101.323 E2.72673
G1 X101.842 Y46.527 E1.76204
G1 X186.638 Y46.527 E2.72673
G1 X186.638 Y101.263 E1.76011
M204 S250
G1 X187.03 Y101.715 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X101.45 Y101.715 E2.54914
G1 X101.45 Y46.135 E1.65554
G1 X187.03 Y46.135 E2.54914
G1 X187.03 Y101.655 E1.65375
; WIPE_START
M204 S5000
G1 X185.03 Y101.656 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X186.207 Y100.892 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X186.126 Y100.908 E.00278
; LINE_WIDTH: 0.448395
G1 X186.046 Y100.925 E.00263
; LINE_WIDTH: 0.43172
G1 X102.435 Y100.925 E2.5679
; LINE_WIDTH: 0.470635
M73 P76 R3
G1 X102.273 Y100.892 E.00556
G1 X102.257 Y100.811 E.00278
; LINE_WIDTH: 0.448395
G1 X102.24 Y100.73 E.00263
; LINE_WIDTH: 0.431746
G1 X102.24 Y47.119 E1.64664
G1 X102.257 Y47.039 E.00253
; LINE_WIDTH: 0.481759
G1 X102.273 Y46.958 E.00285
; LINE_WIDTH: 0.481745
G1 X102.354 Y46.942 E.00285
; LINE_WIDTH: 0.448395
G1 X102.435 Y46.925 E.00263
; LINE_WIDTH: 0.43172
G1 X186.046 Y46.925 E2.5679
; LINE_WIDTH: 0.470635
G1 X186.207 Y46.958 E.00556
G1 X186.223 Y47.039 E.00278
; LINE_WIDTH: 0.448395
M73 P77 R3
G1 X186.24 Y47.119 E.00263
; LINE_WIDTH: 0.43172
G1 X186.24 Y100.73 E1.64653
; LINE_WIDTH: 0.470635
G1 X186.219 Y100.833 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X186.126 Y100.908 E-.04541
G1 X186.046 Y100.925 E-.03125
G1 X184.247 Y100.925 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 120
M625
; layer num/total_layer_count: 4/5
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S51
G17
G3 Z1 I1.217 J0 P1  F15000
; object ids of layer 4 start: 98,109,120
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
; object ids of this layer4 end: 98,109,120
M625
; OBJECT_ID: 109
; start printing object, unique label id: 109
M624 AgAAAAAAAAA=
G1 X211.547 Y204.006
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X211.547 Y204.398 E.01261
G1 X158.343 Y204.398 E1.71085
G1 X158.343 Y121.194 E2.67554
G1 X211.547 Y121.194 E1.71085
G1 X211.547 Y203.946 E2.66101
M204 S250
G1 X211.155 Y204.006 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X158.735 Y204.006 E1.56141
G1 X158.735 Y121.586 E2.45501
G1 X211.155 Y121.586 E1.56141
G1 X211.155 Y203.946 E2.45322
; WIPE_START
M204 S5000
G1 X209.155 Y203.949 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X212.343 Y205.194 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X157.547 Y205.194 E1.76204
G1 X157.547 Y120.398 E2.72673
G1 X212.343 Y120.398 E1.76204
G1 X212.343 Y205.134 E2.7248
M204 S250
G1 X212.735 Y205.586 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X157.155 Y205.586 E1.65554
G1 X157.155 Y120.006 E2.54914
G1 X212.735 Y120.006 E1.65554
M73 P78 R3
G1 X212.735 Y205.526 E2.54735
; WIPE_START
M204 S5000
G1 X210.735 Y205.528 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.911 Y204.763 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X211.831 Y204.78 E.00278
; LINE_WIDTH: 0.448395
G1 X211.75 Y204.796 E.00263
; LINE_WIDTH: 0.43172
G1 X158.139 Y204.796 E1.64653
; LINE_WIDTH: 0.470635
G1 X157.978 Y204.763 E.00556
G1 X157.961 Y204.682 E.00278
; LINE_WIDTH: 0.448395
G1 X157.945 Y204.602 E.00263
; LINE_WIDTH: 0.431737
G1 X157.945 Y120.991 E2.56801
G1 X157.961 Y120.91 E.00253
; LINE_WIDTH: 0.481759
G1 X157.978 Y120.83 E.00285
; LINE_WIDTH: 0.481745
G1 X158.059 Y120.813 E.00285
; LINE_WIDTH: 0.448395
G1 X158.139 Y120.796 E.00263
; LINE_WIDTH: 0.43172
G1 X211.75 Y120.796 E1.64653
; LINE_WIDTH: 0.470635
G1 X211.911 Y120.83 E.00556
G1 X211.928 Y120.91 E.00278
; LINE_WIDTH: 0.448395
G1 X211.945 Y120.991 E.00263
; LINE_WIDTH: 0.43172
G1 X211.945 Y204.602 E2.5679
; LINE_WIDTH: 0.470635
G1 X211.924 Y204.704 E.00353
; OBJECT_ID: 98
; WIPE_START
G1 X211.831 Y204.78 E-.04541
G1 X211.75 Y204.796 E-.03125
G1 X209.952 Y204.796 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; start printing object, unique label id: 98
M624 AQAAAAAAAAA=
G1 X202.32 Y204.74 Z1.2 F15000
G1 X131.299 Y204.219 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X131.299 Y204.611 E.01261
G1 X78.095 Y204.611 E1.71085
G1 X78.095 Y121.407 E2.67554
G1 X131.299 Y121.407 E1.71085
G1 X131.299 Y204.159 E2.66101
M204 S250
G1 X130.907 Y204.219 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X78.487 Y204.219 E1.56141
G1 X78.487 Y121.799 E2.45501
G1 X130.907 Y121.799 E1.56141
G1 X130.907 Y204.159 E2.45322
; WIPE_START
M204 S5000
G1 X128.907 Y204.161 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.095 Y205.407 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P79 R3
G1 F9000
G1 X77.299 Y205.407 E1.76204
G1 X77.299 Y120.611 E2.72673
G1 X132.095 Y120.611 E1.76204
G1 X132.095 Y205.347 E2.7248
M204 S250
G1 X132.487 Y205.799 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X76.907 Y205.799 E1.65554
G1 X76.907 Y120.219 E2.54914
G1 X132.487 Y120.219 E1.65554
G1 X132.487 Y205.739 E2.54735
; WIPE_START
M204 S5000
G1 X130.487 Y205.741 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.664 Y204.976 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X131.583 Y204.992 E.00278
; LINE_WIDTH: 0.448395
G1 X131.503 Y205.009 E.00263
; LINE_WIDTH: 0.43172
G1 X77.891 Y205.009 E1.64653
; LINE_WIDTH: 0.470635
G1 X77.73 Y204.976 E.00556
G1 X77.714 Y204.895 E.00278
; LINE_WIDTH: 0.448395
G1 X77.697 Y204.814 E.00263
; LINE_WIDTH: 0.431737
G1 X77.697 Y121.203 E2.56801
G1 X77.714 Y121.123 E.00253
; LINE_WIDTH: 0.481759
G1 X77.73 Y121.042 E.00285
; LINE_WIDTH: 0.481745
G1 X77.811 Y121.026 E.00285
; LINE_WIDTH: 0.448395
G1 X77.891 Y121.009 E.00263
; LINE_WIDTH: 0.43172
G1 X131.503 Y121.009 E1.64653
; LINE_WIDTH: 0.470635
G1 X131.664 Y121.042 E.00556
G1 X131.68 Y121.123 E.00278
; LINE_WIDTH: 0.448395
G1 X131.697 Y121.203 E.00263
; LINE_WIDTH: 0.43172
G1 X131.697 Y204.814 E2.5679
; LINE_WIDTH: 0.470635
G1 X131.676 Y204.917 E.00353
; OBJECT_ID: 120
; WIPE_START
G1 X131.583 Y204.992 E-.04541
G1 X131.503 Y205.009 E-.03125
G1 X129.704 Y205.009 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 98
M625
; start printing object, unique label id: 120
M624 BAAAAAAAAAA=
G1 X133.306 Y198.28 Z1.2 F15000
G1 X185.842 Y100.135 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X185.842 Y100.527 E.01261
G1 X102.638 Y100.527 E2.67554
G1 X102.638 Y47.323 E1.71085
G1 X185.842 Y47.323 E2.67554
G1 X185.842 Y100.075 E1.69631
M204 S250
G1 X185.45 Y100.135 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X103.03 Y100.135 E2.45501
G1 X103.03 Y47.715 E1.56141
M73 P80 R3
G1 X185.45 Y47.715 E2.45501
G1 X185.45 Y100.075 E1.55963
; WIPE_START
M204 S5000
G1 X183.45 Y100.076 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X186.638 Y101.323 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X101.842 Y101.323 E2.72673
G1 X101.842 Y46.527 E1.76204
G1 X186.638 Y46.527 E2.72673
G1 X186.638 Y101.263 E1.76011
M204 S250
G1 X187.03 Y101.715 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X101.45 Y101.715 E2.54914
G1 X101.45 Y46.135 E1.65554
G1 X187.03 Y46.135 E2.54914
G1 X187.03 Y101.655 E1.65375
; WIPE_START
M204 S5000
G1 X185.03 Y101.656 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X186.207 Y100.892 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X186.126 Y100.908 E.00278
; LINE_WIDTH: 0.448395
G1 X186.046 Y100.925 E.00263
; LINE_WIDTH: 0.43172
G1 X102.435 Y100.925 E2.5679
; LINE_WIDTH: 0.470635
G1 X102.273 Y100.892 E.00556
G1 X102.257 Y100.811 E.00278
; LINE_WIDTH: 0.448395
G1 X102.24 Y100.73 E.00263
; LINE_WIDTH: 0.431746
G1 X102.24 Y47.119 E1.64664
G1 X102.257 Y47.039 E.00253
; LINE_WIDTH: 0.481759
G1 X102.273 Y46.958 E.00285
; LINE_WIDTH: 0.481745
G1 X102.354 Y46.942 E.00285
; LINE_WIDTH: 0.448395
G1 X102.435 Y46.925 E.00263
; LINE_WIDTH: 0.43172
G1 X186.046 Y46.925 E2.5679
; LINE_WIDTH: 0.470635
G1 X186.207 Y46.958 E.00556
G1 X186.223 Y47.039 E.00278
; LINE_WIDTH: 0.448395
G1 X186.24 Y47.119 E.00263
; LINE_WIDTH: 0.43172
G1 X186.24 Y100.73 E1.64653
; LINE_WIDTH: 0.470635
G1 X186.219 Y100.833 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X186.126 Y100.908 E-.04541
G1 X186.046 Y100.925 E-.03125
G1 X184.247 Y100.925 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 120
M625
; layer num/total_layer_count: 5/5
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F15000
; object ids of layer 5 start: 98,109,120
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
; object ids of this layer5 end: 98,109,120
M625
; OBJECT_ID: 109
; start printing object, unique label id: 109
M624 AgAAAAAAAAA=
G1 X211.155 Y204.006
G1 Z1
M73 P81 R3
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X158.735 Y204.006 E1.56141
G1 X158.735 Y121.586 E2.45501
G1 X211.155 Y121.586 E1.56141
G1 X211.155 Y203.946 E2.45322
; WIPE_START
M204 S5000
G1 X209.155 Y203.949 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X212.735 Y205.586 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X157.155 Y205.586 E1.65554
G1 X157.155 Y120.006 E2.54914
G1 X212.735 Y120.006 E1.65554
G1 X212.735 Y205.526 E2.54735
; WIPE_START
M204 S5000
G1 X210.735 Y205.528 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X210.844 Y197.897 Z1.4 F15000
G1 X211.952 Y120.214 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X212.527 Y120.789 E.02423
G1 X212.527 Y121.322
G1 X211.419 Y120.214 E.04669
G1 X210.886 Y120.214
G1 X212.527 Y121.855 E.06916
G1 X212.527 Y122.389
G1 X210.352 Y120.214 E.09162
G1 X209.819 Y120.214
G1 X210.984 Y121.379 E.04909
G1 X210.451 Y121.379
G1 X209.286 Y120.214 E.04909
G1 X208.753 Y120.214
G1 X209.918 Y121.379 E.04909
G1 X209.385 Y121.379
G1 X208.219 Y120.214 E.04909
G1 X207.686 Y120.214
G1 X208.851 Y121.379 E.04909
G1 X208.318 Y121.379
G1 X207.153 Y120.214 E.04909
G1 X206.62 Y120.214
G1 X207.785 Y121.379 E.04909
G1 X207.252 Y121.379
G1 X206.086 Y120.214 E.04909
G1 X205.553 Y120.214
G1 X206.718 Y121.379 E.04909
G1 X206.185 Y121.379
M73 P82 R3
G1 X205.02 Y120.214 E.04909
G1 X204.487 Y120.214
G1 X205.652 Y121.379 E.04909
G1 X205.119 Y121.379
G1 X203.953 Y120.214 E.04909
G1 X203.42 Y120.214
G1 X204.585 Y121.379 E.04909
G1 X204.052 Y121.379
G1 X202.887 Y120.214 E.04909
G1 X202.353 Y120.214
G1 X203.519 Y121.379 E.04909
G1 X202.985 Y121.379
G1 X201.82 Y120.214 E.04909
G1 X201.287 Y120.214
G1 X202.452 Y121.379 E.04909
G1 X201.919 Y121.379
G1 X200.754 Y120.214 E.04909
G1 X200.22 Y120.214
G1 X201.386 Y121.379 E.04909
G1 X200.852 Y121.379
G1 X199.687 Y120.214 E.04909
G1 X199.154 Y120.214
G1 X200.319 Y121.379 E.04909
G1 X199.786 Y121.379
G1 X198.621 Y120.214 E.04909
G1 X198.087 Y120.214
G1 X199.253 Y121.379 E.04909
G1 X198.719 Y121.379
G1 X197.554 Y120.214 E.04909
G1 X197.021 Y120.214
G1 X198.186 Y121.379 E.04909
M73 P82 R2
G1 X197.653 Y121.379
G1 X196.488 Y120.214 E.04909
G1 X195.954 Y120.214
G1 X197.12 Y121.379 E.04909
G1 X196.586 Y121.379
G1 X195.421 Y120.214 E.04909
G1 X194.888 Y120.214
G1 X196.053 Y121.379 E.04909
G1 X195.52 Y121.379
G1 X194.355 Y120.214 E.04909
G1 X193.821 Y120.214
G1 X194.987 Y121.379 E.04909
G1 X194.453 Y121.379
G1 X193.288 Y120.214 E.04909
G1 X192.755 Y120.214
G1 X193.92 Y121.379 E.04909
G1 X193.387 Y121.379
G1 X192.222 Y120.214 E.04909
G1 X191.688 Y120.214
G1 X192.854 Y121.379 E.04909
G1 X192.32 Y121.379
G1 X191.155 Y120.214 E.04909
G1 X190.622 Y120.214
G1 X191.787 Y121.379 E.04909
G1 X191.254 Y121.379
G1 X190.089 Y120.214 E.04909
G1 X189.555 Y120.214
G1 X190.721 Y121.379 E.04909
G1 X190.187 Y121.379
G1 X189.022 Y120.214 E.04909
G1 X188.489 Y120.214
G1 X189.654 Y121.379 E.04909
G1 X189.121 Y121.379
G1 X187.956 Y120.214 E.04909
G1 X187.422 Y120.214
G1 X188.588 Y121.379 E.04909
G1 X188.054 Y121.379
G1 X186.889 Y120.214 E.04909
G1 X186.356 Y120.214
G1 X187.521 Y121.379 E.04909
G1 X186.988 Y121.379
G1 X185.823 Y120.214 E.04909
G1 X185.289 Y120.214
G1 X186.455 Y121.379 E.04909
G1 X185.921 Y121.379
G1 X184.756 Y120.214 E.04909
G1 X184.223 Y120.214
G1 X185.388 Y121.379 E.04909
G1 X184.855 Y121.379
G1 X183.689 Y120.214 E.04909
G1 X183.156 Y120.214
G1 X184.321 Y121.379 E.04909
G1 X183.788 Y121.379
G1 X182.623 Y120.214 E.04909
G1 X182.09 Y120.214
G1 X183.255 Y121.379 E.04909
G1 X182.722 Y121.379
G1 X181.556 Y120.214 E.04909
G1 X181.023 Y120.214
G1 X182.188 Y121.379 E.04909
G1 X181.655 Y121.379
G1 X180.49 Y120.214 E.04909
G1 X179.957 Y120.214
G1 X181.122 Y121.379 E.04909
G1 X180.589 Y121.379
G1 X179.423 Y120.214 E.04909
G1 X178.89 Y120.214
G1 X180.055 Y121.379 E.04909
G1 X179.522 Y121.379
G1 X178.357 Y120.214 E.04909
G1 X177.824 Y120.214
G1 X178.989 Y121.379 E.04909
G1 X178.456 Y121.379
G1 X177.29 Y120.214 E.04909
M73 P83 R2
G1 X176.757 Y120.214
G1 X177.922 Y121.379 E.04909
G1 X177.389 Y121.379
G1 X176.224 Y120.214 E.04909
G1 X175.691 Y120.214
G1 X176.856 Y121.379 E.04909
G1 X176.323 Y121.379
G1 X175.157 Y120.214 E.04909
G1 X174.624 Y120.214
G1 X175.789 Y121.379 E.04909
G1 X175.256 Y121.379
G1 X174.091 Y120.214 E.04909
G1 X173.558 Y120.214
G1 X174.723 Y121.379 E.04909
G1 X174.19 Y121.379
G1 X173.024 Y120.214 E.04909
G1 X172.491 Y120.214
G1 X173.656 Y121.379 E.04909
G1 X173.123 Y121.379
G1 X171.958 Y120.214 E.04909
G1 X171.425 Y120.214
G1 X172.59 Y121.379 E.04909
G1 X172.057 Y121.379
G1 X170.891 Y120.214 E.04909
G1 X170.358 Y120.214
G1 X171.523 Y121.379 E.04909
G1 X170.99 Y121.379
G1 X169.825 Y120.214 E.04909
G1 X169.292 Y120.214
G1 X170.457 Y121.379 E.04909
G1 X169.924 Y121.379
G1 X168.758 Y120.214 E.04909
G1 X168.225 Y120.214
G1 X169.39 Y121.379 E.04909
G1 X168.857 Y121.379
G1 X167.692 Y120.214 E.04909
G1 X167.158 Y120.214
G1 X168.324 Y121.379 E.04909
G1 X167.79 Y121.379
G1 X166.625 Y120.214 E.04909
G1 X166.092 Y120.214
G1 X167.257 Y121.379 E.04909
G1 X166.724 Y121.379
G1 X165.559 Y120.214 E.04909
G1 X165.025 Y120.214
G1 X166.191 Y121.379 E.04909
G1 X165.657 Y121.379
G1 X164.492 Y120.214 E.04909
G1 X163.959 Y120.214
G1 X165.124 Y121.379 E.04909
G1 X164.591 Y121.379
G1 X163.426 Y120.214 E.04909
G1 X162.892 Y120.214
G1 X164.058 Y121.379 E.04909
G1 X163.524 Y121.379
G1 X162.359 Y120.214 E.04909
G1 X161.826 Y120.214
G1 X162.991 Y121.379 E.04909
G1 X162.458 Y121.379
G1 X161.293 Y120.214 E.04909
G1 X160.759 Y120.214
G1 X161.925 Y121.379 E.04909
G1 X161.391 Y121.379
G1 X160.226 Y120.214 E.04909
G1 X159.693 Y120.214
G1 X160.858 Y121.379 E.04909
G1 X160.325 Y121.379
G1 X159.16 Y120.214 E.04909
G1 X158.626 Y120.214
G1 X159.792 Y121.379 E.04909
G1 X159.258 Y121.379
G1 X158.093 Y120.214 E.04909
G1 X157.56 Y120.214
G1 X158.725 Y121.379 E.04909
G1 X158.527 Y121.714
G1 X157.362 Y120.549 E.04909
G1 X157.362 Y121.082
G1 X158.527 Y122.248 E.04909
G1 X158.527 Y122.781
G1 X157.362 Y121.616 E.04909
G1 X157.362 Y122.149
G1 X158.527 Y123.314 E.04909
G1 X158.527 Y123.847
G1 X157.362 Y122.682 E.04909
G1 X157.362 Y123.215
G1 X158.527 Y124.381 E.04909
G1 X158.527 Y124.914
G1 X157.362 Y123.749 E.04909
G1 X157.362 Y124.282
G1 X158.527 Y125.447 E.04909
G1 X158.527 Y125.98
G1 X157.362 Y124.815 E.04909
G1 X157.362 Y125.348
G1 X158.527 Y126.514 E.04909
G1 X158.527 Y127.047
G1 X157.362 Y125.882 E.04909
G1 X157.362 Y126.415
G1 X158.527 Y127.58 E.04909
G1 X158.527 Y128.113
G1 X157.362 Y126.948 E.04909
G1 X157.362 Y127.481
G1 X158.527 Y128.647 E.04909
G1 X158.527 Y129.18
G1 X157.362 Y128.015 E.04909
G1 X157.362 Y128.548
G1 X158.527 Y129.713 E.04909
G1 X158.527 Y130.247
G1 X157.362 Y129.081 E.04909
G1 X157.362 Y129.615
G1 X158.527 Y130.78 E.04909
G1 X158.527 Y131.313
G1 X157.362 Y130.148 E.04909
G1 X157.362 Y130.681
G1 X158.527 Y131.846 E.04909
G1 X158.527 Y132.38
G1 X157.362 Y131.214 E.04909
G1 X157.362 Y131.748
G1 X158.527 Y132.913 E.04909
G1 X158.527 Y133.446
G1 X157.362 Y132.281 E.04909
G1 X157.362 Y132.814
G1 X158.527 Y133.979 E.04909
G1 X158.527 Y134.513
G1 X157.362 Y133.347 E.04909
G1 X157.362 Y133.881
G1 X158.527 Y135.046 E.04909
G1 X158.527 Y135.579
G1 X157.362 Y134.414 E.04909
G1 X157.362 Y134.947
G1 X158.527 Y136.112 E.04909
G1 X158.527 Y136.646
G1 X157.362 Y135.48 E.04909
G1 X157.362 Y136.014
G1 X158.527 Y137.179 E.04909
G1 X158.527 Y137.712
G1 X157.362 Y136.547 E.04909
G1 X157.362 Y137.08
G1 X158.527 Y138.245 E.04909
G1 X158.527 Y138.779
G1 X157.362 Y137.613 E.04909
G1 X157.362 Y138.147
G1 X158.527 Y139.312 E.04909
G1 X158.527 Y139.845
G1 X157.362 Y138.68 E.04909
G1 X157.362 Y139.213
G1 X158.527 Y140.378 E.04909
G1 X158.527 Y140.912
G1 X157.362 Y139.746 E.04909
G1 X157.362 Y140.28
G1 X158.527 Y141.445 E.04909
G1 X158.527 Y141.978
G1 X157.362 Y140.813 E.04909
G1 X157.362 Y141.346
G1 X158.527 Y142.511 E.04909
G1 X158.527 Y143.045
G1 X157.362 Y141.879 E.04909
G1 X157.362 Y142.413
G1 X158.527 Y143.578 E.04909
G1 X158.527 Y144.111
G1 X157.362 Y142.946 E.04909
G1 X157.362 Y143.479
G1 X158.527 Y144.644 E.04909
G1 X158.527 Y145.178
G1 X157.362 Y144.012 E.04909
G1 X157.362 Y144.546
G1 X158.527 Y145.711 E.04909
G1 X158.527 Y146.244
G1 X157.362 Y145.079 E.04909
G1 X157.362 Y145.612
G1 X158.527 Y146.778 E.04909
G1 X158.527 Y147.311
G1 X157.362 Y146.146 E.04909
G1 X157.362 Y146.679
G1 X158.527 Y147.844 E.04909
G1 X158.527 Y148.377
G1 X157.362 Y147.212 E.04909
G1 X157.362 Y147.745
G1 X158.527 Y148.911 E.04909
G1 X158.527 Y149.444
G1 X157.362 Y148.279 E.04909
G1 X157.362 Y148.812
G1 X158.527 Y149.977 E.04909
G1 X158.527 Y150.51
G1 X157.362 Y149.345 E.04909
G1 X157.362 Y149.878
G1 X158.527 Y151.044 E.04909
G1 X158.527 Y151.577
G1 X157.362 Y150.412 E.04909
G1 X157.362 Y150.945
G1 X158.527 Y152.11 E.04909
G1 X158.527 Y152.643
G1 X157.362 Y151.478 E.04909
G1 X157.362 Y152.011
G1 X158.527 Y153.177 E.04909
G1 X158.527 Y153.71
G1 X157.362 Y152.545 E.04909
G1 X157.362 Y153.078
G1 X158.527 Y154.243 E.04909
G1 X158.527 Y154.776
G1 X157.362 Y153.611 E.04909
G1 X157.362 Y154.144
G1 X158.527 Y155.31 E.04909
G1 X158.527 Y155.843
G1 X157.362 Y154.678 E.04909
G1 X157.362 Y155.211
G1 X158.527 Y156.376 E.04909
G1 X158.527 Y156.909
G1 X157.362 Y155.744 E.04909
G1 X157.362 Y156.277
G1 X158.527 Y157.443 E.04909
G1 X158.527 Y157.976
G1 X157.362 Y156.811 E.04909
G1 X157.362 Y157.344
G1 X158.527 Y158.509 E.04909
G1 X158.527 Y159.042
G1 X157.362 Y157.877 E.04909
G1 X157.362 Y158.41
G1 X158.527 Y159.576 E.04909
G1 X158.527 Y160.109
G1 X157.362 Y158.944 E.04909
G1 X157.362 Y159.477
G1 X158.527 Y160.642 E.04909
G1 X158.527 Y161.175
G1 X157.362 Y160.01 E.04909
G1 X157.362 Y160.543
G1 X158.527 Y161.709 E.04909
M73 P84 R2
G1 X158.527 Y162.242
G1 X157.362 Y161.077 E.04909
G1 X157.362 Y161.61
G1 X158.527 Y162.775 E.04909
G1 X158.527 Y163.308
G1 X157.362 Y162.143 E.04909
G1 X157.362 Y162.676
G1 X158.527 Y163.842 E.04909
G1 X158.527 Y164.375
G1 X157.362 Y163.21 E.04909
G1 X157.362 Y163.743
G1 X158.527 Y164.908 E.04909
G1 X158.527 Y165.442
G1 X157.362 Y164.276 E.04909
G1 X157.362 Y164.81
G1 X158.527 Y165.975 E.04909
G1 X158.527 Y166.508
G1 X157.362 Y165.343 E.04909
G1 X157.362 Y165.876
G1 X158.527 Y167.041 E.04909
G1 X158.527 Y167.575
G1 X157.362 Y166.409 E.04909
G1 X157.362 Y166.943
G1 X158.527 Y168.108 E.04909
G1 X158.527 Y168.641
G1 X157.362 Y167.476 E.04909
G1 X157.362 Y168.009
G1 X158.527 Y169.174 E.04909
G1 X158.527 Y169.708
G1 X157.362 Y168.542 E.04909
G1 X157.362 Y169.076
G1 X158.527 Y170.241 E.04909
G1 X158.527 Y170.774
G1 X157.362 Y169.609 E.04909
G1 X157.362 Y170.142
G1 X158.527 Y171.307 E.04909
G1 X158.527 Y171.841
G1 X157.362 Y170.675 E.04909
G1 X157.362 Y171.209
G1 X158.527 Y172.374 E.04909
G1 X158.527 Y172.907
G1 X157.362 Y171.742 E.04909
G1 X157.362 Y172.275
G1 X158.527 Y173.44 E.04909
G1 X158.527 Y173.974
G1 X157.362 Y172.808 E.04909
G1 X157.362 Y173.342
G1 X158.527 Y174.507 E.04909
G1 X158.527 Y175.04
G1 X157.362 Y173.875 E.04909
G1 X157.362 Y174.408
G1 X158.527 Y175.573 E.04909
G1 X158.527 Y176.107
G1 X157.362 Y174.941 E.04909
G1 X157.362 Y175.475
G1 X158.527 Y176.64 E.04909
G1 X158.527 Y177.173
G1 X157.362 Y176.008 E.04909
G1 X157.362 Y176.541
G1 X158.527 Y177.706 E.04909
G1 X158.527 Y178.24
G1 X157.362 Y177.074 E.04909
G1 X157.362 Y177.608
G1 X158.527 Y178.773 E.04909
G1 X158.527 Y179.306
G1 X157.362 Y178.141 E.04909
G1 X157.362 Y178.674
G1 X158.527 Y179.839 E.04909
G1 X158.527 Y180.373
G1 X157.362 Y179.207 E.04909
G1 X157.362 Y179.741
G1 X158.527 Y180.906 E.04909
G1 X158.527 Y181.439
G1 X157.362 Y180.274 E.04909
G1 X157.362 Y180.807
G1 X158.527 Y181.973 E.04909
G1 X158.527 Y182.506
G1 X157.362 Y181.341 E.04909
G1 X157.362 Y181.874
G1 X158.527 Y183.039 E.04909
G1 X158.527 Y183.572
G1 X157.362 Y182.407 E.04909
G1 X157.362 Y182.94
G1 X158.527 Y184.106 E.04909
G1 X158.527 Y184.639
G1 X157.362 Y183.474 E.04909
G1 X157.362 Y184.007
G1 X158.527 Y185.172 E.04909
G1 X158.527 Y185.705
G1 X157.362 Y184.54 E.04909
G1 X157.362 Y185.073
G1 X158.527 Y186.239 E.04909
G1 X158.527 Y186.772
G1 X157.362 Y185.607 E.04909
G1 X157.362 Y186.14
G1 X158.527 Y187.305 E.04909
G1 X158.527 Y187.838
G1 X157.362 Y186.673 E.04909
G1 X157.362 Y187.206
G1 X158.527 Y188.372 E.04909
G1 X158.527 Y188.905
G1 X157.362 Y187.74 E.04909
G1 X157.362 Y188.273
G1 X158.527 Y189.438 E.04909
G1 X158.527 Y189.971
G1 X157.362 Y188.806 E.04909
G1 X157.362 Y189.339
G1 X158.527 Y190.505 E.04909
G1 X158.527 Y191.038
G1 X157.362 Y189.873 E.04909
G1 X157.362 Y190.406
G1 X158.527 Y191.571 E.04909
G1 X158.527 Y192.104
G1 X157.362 Y190.939 E.04909
G1 X157.362 Y191.472
G1 X158.527 Y192.638 E.04909
G1 X158.527 Y193.171
G1 X157.362 Y192.006 E.04909
G1 X157.362 Y192.539
G1 X158.527 Y193.704 E.04909
G1 X158.527 Y194.237
G1 X157.362 Y193.072 E.04909
G1 X157.362 Y193.605
G1 X158.527 Y194.771 E.04909
G1 X158.527 Y195.304
G1 X157.362 Y194.139 E.04909
G1 X157.362 Y194.672
G1 X158.527 Y195.837 E.04909
G1 X158.527 Y196.37
G1 X157.362 Y195.205 E.04909
G1 X157.362 Y195.738
G1 X158.527 Y196.904 E.04909
G1 X158.527 Y197.437
G1 X157.362 Y196.272 E.04909
G1 X157.362 Y196.805
G1 X158.527 Y197.97 E.04909
G1 X158.527 Y198.503
G1 X157.362 Y197.338 E.04909
G1 X157.362 Y197.871
G1 X158.527 Y199.037 E.04909
G1 X158.527 Y199.57
G1 X157.362 Y198.405 E.04909
G1 X157.362 Y198.938
G1 X158.527 Y200.103 E.04909
G1 X158.527 Y200.637
G1 X157.362 Y199.471 E.04909
G1 X157.362 Y200.005
G1 X158.527 Y201.17 E.04909
G1 X158.527 Y201.703
G1 X157.362 Y200.538 E.04909
G1 X157.362 Y201.071
G1 X158.527 Y202.236 E.04909
G1 X158.527 Y202.77
G1 X157.362 Y201.604 E.04909
G1 X157.362 Y202.138
G1 X158.527 Y203.303 E.04909
G1 X158.527 Y203.836
G1 X157.362 Y202.671 E.04909
; WIPE_START
M204 S5000
G1 X158.527 Y203.836 E-.62621
G1 X158.527 Y203.484 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X162.777 Y197.144 Z1.4 F15000
G1 X212.527 Y122.922 Z1.4
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X211.362 Y121.757 E.04909
G1 X211.362 Y122.29
G1 X212.527 Y123.455 E.04909
G1 X212.527 Y123.988
G1 X211.362 Y122.823 E.04909
G1 X211.362 Y123.356
G1 X212.527 Y124.522 E.04909
G1 X212.527 Y125.055
G1 X211.362 Y123.89 E.04909
G1 X211.362 Y124.423
G1 X212.527 Y125.588 E.04909
G1 X212.527 Y126.121
G1 X211.362 Y124.956 E.04909
G1 X211.362 Y125.489
G1 X212.527 Y126.655 E.04909
G1 X212.527 Y127.188
G1 X211.362 Y126.023 E.04909
G1 X211.362 Y126.556
G1 X212.527 Y127.721 E.04909
G1 X212.527 Y128.254
G1 X211.362 Y127.089 E.04909
G1 X211.362 Y127.623
G1 X212.527 Y128.788 E.04909
G1 X212.527 Y129.321
G1 X211.362 Y128.156 E.04909
G1 X211.362 Y128.689
G1 X212.527 Y129.854 E.04909
G1 X212.527 Y130.388
G1 X211.362 Y129.222 E.04909
G1 X211.362 Y129.756
G1 X212.527 Y130.921 E.04909
G1 X212.527 Y131.454
G1 X211.362 Y130.289 E.04909
G1 X211.362 Y130.822
G1 X212.527 Y131.987 E.04909
G1 X212.527 Y132.521
G1 X211.362 Y131.355 E.04909
G1 X211.362 Y131.889
G1 X212.527 Y133.054 E.04909
G1 X212.527 Y133.587
G1 X211.362 Y132.422 E.04909
G1 X211.362 Y132.955
G1 X212.527 Y134.12 E.04909
G1 X212.527 Y134.654
G1 X211.362 Y133.488 E.04909
G1 X211.362 Y134.022
G1 X212.527 Y135.187 E.04909
G1 X212.527 Y135.72
G1 X211.362 Y134.555 E.04909
G1 X211.362 Y135.088
G1 X212.527 Y136.253 E.04909
G1 X212.527 Y136.787
G1 X211.362 Y135.621 E.04909
G1 X211.362 Y136.155
G1 X212.527 Y137.32 E.04909
M73 P85 R2
G1 X212.527 Y137.853
G1 X211.362 Y136.688 E.04909
G1 X211.362 Y137.221
G1 X212.527 Y138.386 E.04909
G1 X212.527 Y138.92
G1 X211.362 Y137.754 E.04909
G1 X211.362 Y138.288
G1 X212.527 Y139.453 E.04909
G1 X212.527 Y139.986
G1 X211.362 Y138.821 E.04909
G1 X211.362 Y139.354
G1 X212.527 Y140.519 E.04909
G1 X212.527 Y141.053
G1 X211.362 Y139.887 E.04909
G1 X211.362 Y140.421
G1 X212.527 Y141.586 E.04909
G1 X212.527 Y142.119
G1 X211.362 Y140.954 E.04909
G1 X211.362 Y141.487
G1 X212.527 Y142.652 E.04909
G1 X212.527 Y143.186
G1 X211.362 Y142.02 E.04909
G1 X211.362 Y142.554
G1 X212.527 Y143.719 E.04909
G1 X212.527 Y144.252
G1 X211.362 Y143.087 E.04909
G1 X211.362 Y143.62
G1 X212.527 Y144.785 E.04909
G1 X212.527 Y145.319
G1 X211.362 Y144.153 E.04909
G1 X211.362 Y144.687
G1 X212.527 Y145.852 E.04909
G1 X212.527 Y146.385
G1 X211.362 Y145.22 E.04909
G1 X211.362 Y145.753
G1 X212.527 Y146.919 E.04909
G1 X212.527 Y147.452
G1 X211.362 Y146.287 E.04909
G1 X211.362 Y146.82
G1 X212.527 Y147.985 E.04909
G1 X212.527 Y148.518
G1 X211.362 Y147.353 E.04909
G1 X211.362 Y147.886
G1 X212.527 Y149.052 E.04909
G1 X212.527 Y149.585
G1 X211.362 Y148.42 E.04909
G1 X211.362 Y148.953
G1 X212.527 Y150.118 E.04909
G1 X212.527 Y150.651
G1 X211.362 Y149.486 E.04909
G1 X211.362 Y150.019
G1 X212.527 Y151.185 E.04909
G1 X212.527 Y151.718
G1 X211.362 Y150.553 E.04909
G1 X211.362 Y151.086
G1 X212.527 Y152.251 E.04909
G1 X212.527 Y152.784
G1 X211.362 Y151.619 E.04909
G1 X211.362 Y152.152
G1 X212.527 Y153.318 E.04909
G1 X212.527 Y153.851
G1 X211.362 Y152.686 E.04909
G1 X211.362 Y153.219
G1 X212.527 Y154.384 E.04909
G1 X212.527 Y154.917
G1 X211.362 Y153.752 E.04909
G1 X211.362 Y154.285
G1 X212.527 Y155.451 E.04909
G1 X212.527 Y155.984
G1 X211.362 Y154.819 E.04909
G1 X211.362 Y155.352
G1 X212.527 Y156.517 E.04909
G1 X212.527 Y157.05
G1 X211.362 Y155.885 E.04909
G1 X211.362 Y156.418
G1 X212.527 Y157.584 E.04909
G1 X212.527 Y158.117
G1 X211.362 Y156.952 E.04909
G1 X211.362 Y157.485
G1 X212.527 Y158.65 E.04909
G1 X212.527 Y159.183
G1 X211.362 Y158.018 E.04909
G1 X211.362 Y158.551
G1 X212.527 Y159.717 E.04909
G1 X212.527 Y160.25
G1 X211.362 Y159.085 E.04909
G1 X211.362 Y159.618
G1 X212.527 Y160.783 E.04909
G1 X212.527 Y161.316
G1 X211.362 Y160.151 E.04909
G1 X211.362 Y160.684
G1 X212.527 Y161.85 E.04909
G1 X212.527 Y162.383
G1 X211.362 Y161.218 E.04909
G1 X211.362 Y161.751
G1 X212.527 Y162.916 E.04909
G1 X212.527 Y163.449
G1 X211.362 Y162.284 E.04909
G1 X211.362 Y162.818
G1 X212.527 Y163.983 E.04909
G1 X212.527 Y164.516
G1 X211.362 Y163.351 E.04909
G1 X211.362 Y163.884
G1 X212.527 Y165.049 E.04909
G1 X212.527 Y165.583
G1 X211.362 Y164.417 E.04909
G1 X211.362 Y164.951
G1 X212.527 Y166.116 E.04909
G1 X212.527 Y166.649
G1 X211.362 Y165.484 E.04909
G1 X211.362 Y166.017
G1 X212.527 Y167.182 E.04909
G1 X212.527 Y167.716
G1 X211.362 Y166.55 E.04909
G1 X211.362 Y167.084
G1 X212.527 Y168.249 E.04909
G1 X212.527 Y168.782
G1 X211.362 Y167.617 E.04909
G1 X211.362 Y168.15
G1 X212.527 Y169.315 E.04909
G1 X212.527 Y169.849
G1 X211.362 Y168.683 E.04909
G1 X211.362 Y169.217
G1 X212.527 Y170.382 E.04909
G1 X212.527 Y170.915
G1 X211.362 Y169.75 E.04909
G1 X211.362 Y170.283
G1 X212.527 Y171.448 E.04909
G1 X212.527 Y171.982
G1 X211.362 Y170.816 E.04909
G1 X211.362 Y171.35
G1 X212.527 Y172.515 E.04909
G1 X212.527 Y173.048
G1 X211.362 Y171.883 E.04909
G1 X211.362 Y172.416
G1 X212.527 Y173.581 E.04909
G1 X212.527 Y174.115
G1 X211.362 Y172.949 E.04909
G1 X211.362 Y173.483
G1 X212.527 Y174.648 E.04909
G1 X212.527 Y175.181
G1 X211.362 Y174.016 E.04909
G1 X211.362 Y174.549
G1 X212.527 Y175.714 E.04909
G1 X212.527 Y176.248
G1 X211.362 Y175.082 E.04909
G1 X211.362 Y175.616
G1 X212.527 Y176.781 E.04909
G1 X212.527 Y177.314
G1 X211.362 Y176.149 E.04909
G1 X211.362 Y176.682
G1 X212.527 Y177.847 E.04909
G1 X212.527 Y178.381
G1 X211.362 Y177.215 E.04909
G1 X211.362 Y177.749
G1 X212.527 Y178.914 E.04909
G1 X212.527 Y179.447
G1 X211.362 Y178.282 E.04909
G1 X211.362 Y178.815
G1 X212.527 Y179.98 E.04909
G1 X212.527 Y180.514
G1 X211.362 Y179.348 E.04909
G1 X211.362 Y179.882
G1 X212.527 Y181.047 E.04909
G1 X212.527 Y181.58
G1 X211.362 Y180.415 E.04909
G1 X211.362 Y180.948
G1 X212.527 Y182.114 E.04909
G1 X212.527 Y182.647
G1 X211.362 Y181.482 E.04909
G1 X211.362 Y182.015
G1 X212.527 Y183.18 E.04909
G1 X212.527 Y183.713
G1 X211.362 Y182.548 E.04909
G1 X211.362 Y183.081
G1 X212.527 Y184.247 E.04909
G1 X212.527 Y184.78
G1 X211.362 Y183.615 E.04909
G1 X211.362 Y184.148
G1 X212.527 Y185.313 E.04909
G1 X212.527 Y185.846
G1 X211.362 Y184.681 E.04909
G1 X211.362 Y185.214
G1 X212.527 Y186.38 E.04909
G1 X212.527 Y186.913
G1 X211.362 Y185.748 E.04909
G1 X211.362 Y186.281
G1 X212.527 Y187.446 E.04909
G1 X212.527 Y187.979
G1 X211.362 Y186.814 E.04909
G1 X211.362 Y187.347
G1 X212.527 Y188.513 E.04909
G1 X212.527 Y189.046
G1 X211.362 Y187.881 E.04909
G1 X211.362 Y188.414
G1 X212.527 Y189.579 E.04909
G1 X212.527 Y190.112
G1 X211.362 Y188.947 E.04909
G1 X211.362 Y189.48
G1 X212.527 Y190.646 E.04909
G1 X212.527 Y191.179
G1 X211.362 Y190.014 E.04909
G1 X211.362 Y190.547
G1 X212.527 Y191.712 E.04909
G1 X212.527 Y192.245
G1 X211.362 Y191.08 E.04909
G1 X211.362 Y191.613
G1 X212.527 Y192.779 E.04909
G1 X212.527 Y193.312
G1 X211.362 Y192.147 E.04909
G1 X211.362 Y192.68
G1 X212.527 Y193.845 E.04909
G1 X212.527 Y194.378
G1 X211.362 Y193.213 E.04909
G1 X211.362 Y193.746
G1 X212.527 Y194.912 E.04909
G1 X212.527 Y195.445
G1 X211.362 Y194.28 E.04909
G1 X211.362 Y194.813
G1 X212.527 Y195.978 E.04909
G1 X212.527 Y196.511
G1 X211.362 Y195.346 E.04909
G1 X211.362 Y195.879
G1 X212.527 Y197.045 E.04909
G1 X212.527 Y197.578
G1 X211.362 Y196.413 E.04909
M73 P86 R2
G1 X211.362 Y196.946
G1 X212.527 Y198.111 E.04909
G1 X212.527 Y198.644
G1 X211.362 Y197.479 E.04909
G1 X211.362 Y198.012
G1 X212.527 Y199.178 E.04909
G1 X212.527 Y199.711
G1 X211.362 Y198.546 E.04909
G1 X211.362 Y199.079
G1 X212.527 Y200.244 E.04909
G1 X212.527 Y200.778
G1 X211.362 Y199.612 E.04909
G1 X211.362 Y200.146
G1 X212.527 Y201.311 E.04909
G1 X212.527 Y201.844
G1 X211.362 Y200.679 E.04909
G1 X211.362 Y201.212
G1 X212.527 Y202.377 E.04909
G1 X212.527 Y202.911
G1 X211.362 Y201.745 E.04909
G1 X211.362 Y202.279
G1 X212.527 Y203.444 E.04909
G1 X212.527 Y203.977
G1 X211.362 Y202.812 E.04909
G1 X211.362 Y203.345
G1 X212.527 Y204.51 E.04909
G1 X212.527 Y205.044
G1 X211.362 Y203.878 E.04909
G1 X211.164 Y204.214
G1 X212.329 Y205.379 E.04909
G1 X211.796 Y205.379
G1 X210.631 Y204.214 E.04909
G1 X210.098 Y204.214
G1 X211.263 Y205.379 E.04909
G1 X210.73 Y205.379
G1 X209.564 Y204.214 E.04909
G1 X209.031 Y204.214
G1 X210.196 Y205.379 E.04909
G1 X209.663 Y205.379
G1 X208.498 Y204.214 E.04909
G1 X207.965 Y204.214
G1 X209.13 Y205.379 E.04909
G1 X208.597 Y205.379
G1 X207.431 Y204.214 E.04909
G1 X206.898 Y204.214
G1 X208.063 Y205.379 E.04909
G1 X207.53 Y205.379
G1 X206.365 Y204.214 E.04909
G1 X205.832 Y204.214
G1 X206.997 Y205.379 E.04909
G1 X206.464 Y205.379
G1 X205.298 Y204.214 E.04909
G1 X204.765 Y204.214
G1 X205.93 Y205.379 E.04909
G1 X205.397 Y205.379
G1 X204.232 Y204.214 E.04909
G1 X203.699 Y204.214
G1 X204.864 Y205.379 E.04909
G1 X204.331 Y205.379
G1 X203.165 Y204.214 E.04909
G1 X202.632 Y204.214
G1 X203.797 Y205.379 E.04909
G1 X203.264 Y205.379
G1 X202.099 Y204.214 E.04909
G1 X201.566 Y204.214
G1 X202.731 Y205.379 E.04909
G1 X202.198 Y205.379
G1 X201.032 Y204.214 E.04909
G1 X200.499 Y204.214
G1 X201.664 Y205.379 E.04909
G1 X201.131 Y205.379
G1 X199.966 Y204.214 E.04909
G1 X199.433 Y204.214
G1 X200.598 Y205.379 E.04909
G1 X200.065 Y205.379
G1 X198.899 Y204.214 E.04909
G1 X198.366 Y204.214
G1 X199.531 Y205.379 E.04909
G1 X198.998 Y205.379
G1 X197.833 Y204.214 E.04909
G1 X197.299 Y204.214
G1 X198.465 Y205.379 E.04909
G1 X197.931 Y205.379
G1 X196.766 Y204.214 E.04909
G1 X196.233 Y204.214
G1 X197.398 Y205.379 E.04909
G1 X196.865 Y205.379
G1 X195.7 Y204.214 E.04909
G1 X195.166 Y204.214
G1 X196.332 Y205.379 E.04909
G1 X195.798 Y205.379
G1 X194.633 Y204.214 E.04909
G1 X194.1 Y204.214
G1 X195.265 Y205.379 E.04909
G1 X194.732 Y205.379
G1 X193.567 Y204.214 E.04909
G1 X193.033 Y204.214
G1 X194.199 Y205.379 E.04909
G1 X193.665 Y205.379
G1 X192.5 Y204.214 E.04909
G1 X191.967 Y204.214
G1 X193.132 Y205.379 E.04909
G1 X192.599 Y205.379
G1 X191.434 Y204.214 E.04909
G1 X190.9 Y204.214
G1 X192.066 Y205.379 E.04909
G1 X191.532 Y205.379
G1 X190.367 Y204.214 E.04909
G1 X189.834 Y204.214
G1 X190.999 Y205.379 E.04909
G1 X190.466 Y205.379
G1 X189.301 Y204.214 E.04909
G1 X188.767 Y204.214
G1 X189.933 Y205.379 E.04909
G1 X189.399 Y205.379
G1 X188.234 Y204.214 E.04909
G1 X187.701 Y204.214
G1 X188.866 Y205.379 E.04909
G1 X188.333 Y205.379
G1 X187.168 Y204.214 E.04909
G1 X186.634 Y204.214
G1 X187.8 Y205.379 E.04909
G1 X187.266 Y205.379
G1 X186.101 Y204.214 E.04909
G1 X185.568 Y204.214
G1 X186.733 Y205.379 E.04909
G1 X186.2 Y205.379
G1 X185.035 Y204.214 E.04909
G1 X184.501 Y204.214
G1 X185.667 Y205.379 E.04909
G1 X185.133 Y205.379
G1 X183.968 Y204.214 E.04909
G1 X183.435 Y204.214
G1 X184.6 Y205.379 E.04909
G1 X184.067 Y205.379
G1 X182.902 Y204.214 E.04909
G1 X182.368 Y204.214
G1 X183.534 Y205.379 E.04909
G1 X183 Y205.379
G1 X181.835 Y204.214 E.04909
G1 X181.302 Y204.214
G1 X182.467 Y205.379 E.04909
G1 X181.934 Y205.379
G1 X180.769 Y204.214 E.04909
G1 X180.235 Y204.214
G1 X181.401 Y205.379 E.04909
G1 X180.867 Y205.379
G1 X179.702 Y204.214 E.04909
G1 X179.169 Y204.214
G1 X180.334 Y205.379 E.04909
G1 X179.801 Y205.379
G1 X178.635 Y204.214 E.04909
G1 X178.102 Y204.214
G1 X179.267 Y205.379 E.04909
G1 X178.734 Y205.379
G1 X177.569 Y204.214 E.04909
G1 X177.036 Y204.214
G1 X178.201 Y205.379 E.04909
G1 X177.668 Y205.379
G1 X176.502 Y204.214 E.04909
G1 X175.969 Y204.214
G1 X177.134 Y205.379 E.04909
G1 X176.601 Y205.379
G1 X175.436 Y204.214 E.04909
G1 X174.903 Y204.214
G1 X176.068 Y205.379 E.04909
G1 X175.535 Y205.379
G1 X174.369 Y204.214 E.04909
G1 X173.836 Y204.214
G1 X175.001 Y205.379 E.04909
G1 X174.468 Y205.379
G1 X173.303 Y204.214 E.04909
G1 X172.77 Y204.214
G1 X173.935 Y205.379 E.04909
G1 X173.402 Y205.379
G1 X172.236 Y204.214 E.04909
G1 X171.703 Y204.214
G1 X172.868 Y205.379 E.04909
G1 X172.335 Y205.379
G1 X171.17 Y204.214 E.04909
G1 X170.637 Y204.214
G1 X171.802 Y205.379 E.04909
G1 X171.269 Y205.379
G1 X170.103 Y204.214 E.04909
G1 X169.57 Y204.214
G1 X170.735 Y205.379 E.04909
G1 X170.202 Y205.379
G1 X169.037 Y204.214 E.04909
G1 X168.504 Y204.214
G1 X169.669 Y205.379 E.04909
G1 X169.136 Y205.379
G1 X167.97 Y204.214 E.04909
G1 X167.437 Y204.214
G1 X168.602 Y205.379 E.04909
G1 X168.069 Y205.379
G1 X166.904 Y204.214 E.04909
G1 X166.371 Y204.214
G1 X167.536 Y205.379 E.04909
G1 X167.003 Y205.379
G1 X165.837 Y204.214 E.04909
G1 X165.304 Y204.214
G1 X166.469 Y205.379 E.04909
G1 X165.936 Y205.379
G1 X164.771 Y204.214 E.04909
G1 X164.238 Y204.214
G1 X165.403 Y205.379 E.04909
G1 X164.87 Y205.379
G1 X163.704 Y204.214 E.04909
G1 X163.171 Y204.214
G1 X164.336 Y205.379 E.04909
G1 X163.803 Y205.379
G1 X162.638 Y204.214 E.04909
G1 X162.105 Y204.214
G1 X163.27 Y205.379 E.04909
G1 X162.736 Y205.379
G1 X161.571 Y204.214 E.04909
G1 X161.038 Y204.214
G1 X162.203 Y205.379 E.04909
G1 X161.67 Y205.379
G1 X160.505 Y204.214 E.04909
G1 X159.971 Y204.214
G1 X161.137 Y205.379 E.04909
G1 X160.603 Y205.379
G1 X159.438 Y204.214 E.04909
G1 X158.905 Y204.214
M73 P87 R2
G1 X160.07 Y205.379 E.04909
G1 X159.537 Y205.379
G1 X157.362 Y203.204 E.09162
G1 X157.362 Y203.737
G1 X159.004 Y205.379 E.06915
G1 X158.47 Y205.379
G1 X157.362 Y204.271 E.04669
G1 X157.362 Y204.804
G1 X157.937 Y205.379 E.02423
; WIPE_START
M204 S5000
G1 X157.362 Y204.804 E-.30905
G1 X157.362 Y204.271 E-.20264
G1 X157.824 Y204.733 E-.24831
; WIPE_END
G1 E-.04 F1800
G1 X157.785 Y197.1 Z1.4 F15000
G1 X157.392 Y120.195 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.14558
G1 F7500
G2 X157.432 Y120.479 I.363 J.093 E.00239
; WIPE_START
G1 X157.392 Y120.382 E-.27421
G1 X157.392 Y120.195 E-.48579
; WIPE_END
G1 E-.04 F1800
G1 X161.537 Y126.604 Z1.4 F15000
G1 X212.497 Y205.398 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.145685
G1 F7500
G2 X212.457 Y205.114 I-.363 J-.093 E.00239
; OBJECT_ID: 98
; WIPE_START
G1 X212.497 Y205.211 E-.27383
G1 X212.497 Y205.398 E-.48617
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 109
M625
; start printing object, unique label id: 98
M624 AQAAAAAAAAA=
G1 X204.866 Y205.288 Z1.4 F15000
G1 X130.907 Y204.219 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X78.487 Y204.219 E1.56141
G1 X78.487 Y121.799 E2.45501
G1 X130.907 Y121.799 E1.56141
G1 X130.907 Y204.159 E2.45322
; WIPE_START
M204 S5000
G1 X128.907 Y204.161 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.487 Y205.799 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X76.907 Y205.799 E1.65554
G1 X76.907 Y120.219 E2.54914
G1 X132.487 Y120.219 E1.65554
G1 X132.487 Y205.739 E2.54735
; WIPE_START
M204 S5000
G1 X130.487 Y205.741 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.596 Y198.109 Z1.4 F15000
G1 X131.704 Y120.426 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X132.28 Y121.001 E.02423
G1 X132.28 Y121.535
G1 X131.171 Y120.426 E.04669
G1 X130.638 Y120.426
G1 X132.28 Y122.068 E.06916
G1 X132.28 Y122.601
G1 X130.105 Y120.426 E.09162
G1 X129.571 Y120.426
G1 X130.737 Y121.591 E.04909
G1 X130.203 Y121.591
G1 X129.038 Y120.426 E.04909
G1 X128.505 Y120.426
G1 X129.67 Y121.591 E.04909
G1 X129.137 Y121.591
G1 X127.972 Y120.426 E.04909
G1 X127.438 Y120.426
G1 X128.604 Y121.591 E.04909
G1 X128.07 Y121.591
G1 X126.905 Y120.426 E.04909
G1 X126.372 Y120.426
G1 X127.537 Y121.591 E.04909
G1 X127.004 Y121.591
G1 X125.839 Y120.426 E.04909
G1 X125.305 Y120.426
G1 X126.47 Y121.591 E.04909
G1 X125.937 Y121.591
G1 X124.772 Y120.426 E.04909
G1 X124.239 Y120.426
G1 X125.404 Y121.591 E.04909
G1 X124.871 Y121.591
G1 X123.705 Y120.426 E.04909
G1 X123.172 Y120.426
G1 X124.337 Y121.591 E.04909
G1 X123.804 Y121.591
G1 X122.639 Y120.426 E.04909
G1 X122.106 Y120.426
G1 X123.271 Y121.591 E.04909
G1 X122.738 Y121.591
G1 X121.572 Y120.426 E.04909
G1 X121.039 Y120.426
G1 X122.204 Y121.591 E.04909
G1 X121.671 Y121.591
G1 X120.506 Y120.426 E.04909
G1 X119.973 Y120.426
G1 X121.138 Y121.591 E.04909
G1 X120.605 Y121.591
M73 P88 R2
G1 X119.439 Y120.426 E.04909
G1 X118.906 Y120.426
G1 X120.071 Y121.591 E.04909
G1 X119.538 Y121.591
G1 X118.373 Y120.426 E.04909
G1 X117.84 Y120.426
G1 X119.005 Y121.591 E.04909
G1 X118.472 Y121.591
G1 X117.306 Y120.426 E.04909
G1 X116.773 Y120.426
G1 X117.938 Y121.591 E.04909
G1 X117.405 Y121.591
G1 X116.24 Y120.426 E.04909
G1 X115.707 Y120.426
G1 X116.872 Y121.591 E.04909
G1 X116.339 Y121.591
G1 X115.173 Y120.426 E.04909
G1 X114.64 Y120.426
G1 X115.805 Y121.591 E.04909
G1 X115.272 Y121.591
G1 X114.107 Y120.426 E.04909
G1 X113.574 Y120.426
G1 X114.739 Y121.591 E.04909
G1 X114.206 Y121.591
G1 X113.04 Y120.426 E.04909
G1 X112.507 Y120.426
G1 X113.672 Y121.591 E.04909
G1 X113.139 Y121.591
G1 X111.974 Y120.426 E.04909
G1 X111.441 Y120.426
G1 X112.606 Y121.591 E.04909
G1 X112.073 Y121.591
G1 X110.907 Y120.426 E.04909
G1 X110.374 Y120.426
G1 X111.539 Y121.591 E.04909
G1 X111.006 Y121.591
G1 X109.841 Y120.426 E.04909
G1 X109.308 Y120.426
G1 X110.473 Y121.591 E.04909
G1 X109.94 Y121.591
G1 X108.774 Y120.426 E.04909
G1 X108.241 Y120.426
G1 X109.406 Y121.591 E.04909
G1 X108.873 Y121.591
G1 X107.708 Y120.426 E.04909
G1 X107.174 Y120.426
G1 X108.34 Y121.591 E.04909
G1 X107.806 Y121.591
G1 X106.641 Y120.426 E.04909
G1 X106.108 Y120.426
G1 X107.273 Y121.591 E.04909
G1 X106.74 Y121.591
G1 X105.575 Y120.426 E.04909
G1 X105.041 Y120.426
G1 X106.207 Y121.591 E.04909
G1 X105.673 Y121.591
G1 X104.508 Y120.426 E.04909
G1 X103.975 Y120.426
G1 X105.14 Y121.591 E.04909
G1 X104.607 Y121.591
G1 X103.442 Y120.426 E.04909
G1 X102.908 Y120.426
G1 X104.074 Y121.591 E.04909
G1 X103.54 Y121.591
G1 X102.375 Y120.426 E.04909
G1 X101.842 Y120.426
G1 X103.007 Y121.591 E.04909
G1 X102.474 Y121.591
G1 X101.309 Y120.426 E.04909
G1 X100.775 Y120.426
G1 X101.941 Y121.591 E.04909
G1 X101.407 Y121.591
G1 X100.242 Y120.426 E.04909
G1 X99.709 Y120.426
G1 X100.874 Y121.591 E.04909
G1 X100.341 Y121.591
G1 X99.176 Y120.426 E.04909
G1 X98.642 Y120.426
G1 X99.808 Y121.591 E.04909
G1 X99.274 Y121.591
G1 X98.109 Y120.426 E.04909
G1 X97.576 Y120.426
G1 X98.741 Y121.591 E.04909
G1 X98.208 Y121.591
G1 X97.043 Y120.426 E.04909
G1 X96.509 Y120.426
G1 X97.675 Y121.591 E.04909
G1 X97.141 Y121.591
G1 X95.976 Y120.426 E.04909
G1 X95.443 Y120.426
G1 X96.608 Y121.591 E.04909
G1 X96.075 Y121.591
G1 X94.91 Y120.426 E.04909
G1 X94.376 Y120.426
G1 X95.542 Y121.591 E.04909
G1 X95.008 Y121.591
G1 X93.843 Y120.426 E.04909
G1 X93.31 Y120.426
G1 X94.475 Y121.591 E.04909
M73 P88 R1
G1 X93.942 Y121.591
G1 X92.777 Y120.426 E.04909
G1 X92.243 Y120.426
G1 X93.409 Y121.591 E.04909
G1 X92.875 Y121.591
G1 X91.71 Y120.426 E.04909
G1 X91.177 Y120.426
G1 X92.342 Y121.591 E.04909
G1 X91.809 Y121.591
G1 X90.644 Y120.426 E.04909
G1 X90.11 Y120.426
G1 X91.276 Y121.591 E.04909
G1 X90.742 Y121.591
G1 X89.577 Y120.426 E.04909
G1 X89.044 Y120.426
G1 X90.209 Y121.591 E.04909
G1 X89.676 Y121.591
G1 X88.51 Y120.426 E.04909
G1 X87.977 Y120.426
G1 X89.142 Y121.591 E.04909
G1 X88.609 Y121.591
G1 X87.444 Y120.426 E.04909
G1 X86.911 Y120.426
G1 X88.076 Y121.591 E.04909
G1 X87.543 Y121.591
G1 X86.377 Y120.426 E.04909
G1 X85.844 Y120.426
G1 X87.009 Y121.591 E.04909
G1 X86.476 Y121.591
G1 X85.311 Y120.426 E.04909
G1 X84.778 Y120.426
G1 X85.943 Y121.591 E.04909
G1 X85.41 Y121.591
G1 X84.244 Y120.426 E.04909
G1 X83.711 Y120.426
G1 X84.876 Y121.591 E.04909
G1 X84.343 Y121.591
G1 X83.178 Y120.426 E.04909
G1 X82.645 Y120.426
G1 X83.81 Y121.591 E.04909
G1 X83.277 Y121.591
G1 X82.111 Y120.426 E.04909
G1 X81.578 Y120.426
G1 X82.743 Y121.591 E.04909
G1 X82.21 Y121.591
G1 X81.045 Y120.426 E.04909
G1 X80.512 Y120.426
G1 X81.677 Y121.591 E.04909
G1 X81.144 Y121.591
G1 X79.978 Y120.426 E.04909
G1 X79.445 Y120.426
G1 X80.61 Y121.591 E.04909
G1 X80.077 Y121.591
G1 X78.912 Y120.426 E.04909
G1 X78.379 Y120.426
G1 X79.544 Y121.591 E.04909
G1 X79.011 Y121.591
G1 X77.845 Y120.426 E.04909
G1 X77.312 Y120.426
G1 X78.477 Y121.591 E.04909
G1 X78.28 Y121.927
G1 X77.114 Y120.762 E.04909
G1 X77.114 Y121.295
G1 X78.28 Y122.46 E.04909
G1 X78.28 Y122.993
G1 X77.114 Y121.828 E.04909
G1 X77.114 Y122.361
G1 X78.28 Y123.527 E.04909
G1 X78.28 Y124.06
G1 X77.114 Y122.895 E.04909
G1 X77.114 Y123.428
G1 X78.28 Y124.593 E.04909
G1 X78.28 Y125.127
G1 X77.114 Y123.961 E.04909
G1 X77.114 Y124.495
G1 X78.28 Y125.66 E.04909
G1 X78.28 Y126.193
G1 X77.114 Y125.028 E.04909
G1 X77.114 Y125.561
G1 X78.28 Y126.726 E.04909
G1 X78.28 Y127.26
G1 X77.114 Y126.094 E.04909
G1 X77.114 Y126.628
G1 X78.28 Y127.793 E.04909
G1 X78.28 Y128.326
G1 X77.114 Y127.161 E.04909
G1 X77.114 Y127.694
G1 X78.28 Y128.859 E.04909
G1 X78.28 Y129.393
G1 X77.114 Y128.227 E.04909
G1 X77.114 Y128.761
G1 X78.28 Y129.926 E.04909
G1 X78.28 Y130.459
G1 X77.114 Y129.294 E.04909
G1 X77.114 Y129.827
G1 X78.28 Y130.992 E.04909
G1 X78.28 Y131.526
G1 X77.114 Y130.36 E.04909
G1 X77.114 Y130.894
G1 X78.28 Y132.059 E.04909
G1 X78.28 Y132.592
G1 X77.114 Y131.427 E.04909
G1 X77.114 Y131.96
G1 X78.28 Y133.125 E.04909
G1 X78.28 Y133.659
G1 X77.114 Y132.493 E.04909
G1 X77.114 Y133.027
G1 X78.28 Y134.192 E.04909
G1 X78.28 Y134.725
G1 X77.114 Y133.56 E.04909
G1 X77.114 Y134.093
G1 X78.28 Y135.258 E.04909
G1 X78.28 Y135.792
G1 X77.114 Y134.626 E.04909
G1 X77.114 Y135.16
G1 X78.28 Y136.325 E.04909
G1 X78.28 Y136.858
G1 X77.114 Y135.693 E.04909
G1 X77.114 Y136.226
G1 X78.28 Y137.391 E.04909
G1 X78.28 Y137.925
M73 P89 R1
G1 X77.114 Y136.759 E.04909
G1 X77.114 Y137.293
G1 X78.28 Y138.458 E.04909
G1 X78.28 Y138.991
G1 X77.114 Y137.826 E.04909
G1 X77.114 Y138.359
G1 X78.28 Y139.524 E.04909
G1 X78.28 Y140.058
G1 X77.114 Y138.892 E.04909
G1 X77.114 Y139.426
G1 X78.28 Y140.591 E.04909
G1 X78.28 Y141.124
G1 X77.114 Y139.959 E.04909
G1 X77.114 Y140.492
G1 X78.28 Y141.657 E.04909
G1 X78.28 Y142.191
G1 X77.114 Y141.026 E.04909
G1 X77.114 Y141.559
G1 X78.28 Y142.724 E.04909
G1 X78.28 Y143.257
G1 X77.114 Y142.092 E.04909
G1 X77.114 Y142.625
G1 X78.28 Y143.791 E.04909
G1 X78.28 Y144.324
G1 X77.114 Y143.159 E.04909
G1 X77.114 Y143.692
G1 X78.28 Y144.857 E.04909
G1 X78.28 Y145.39
G1 X77.114 Y144.225 E.04909
G1 X77.114 Y144.758
G1 X78.28 Y145.924 E.04909
G1 X78.28 Y146.457
G1 X77.114 Y145.292 E.04909
G1 X77.114 Y145.825
G1 X78.28 Y146.99 E.04909
G1 X78.28 Y147.523
G1 X77.114 Y146.358 E.04909
G1 X77.114 Y146.891
G1 X78.28 Y148.057 E.04909
G1 X78.28 Y148.59
G1 X77.114 Y147.425 E.04909
G1 X77.114 Y147.958
G1 X78.28 Y149.123 E.04909
G1 X78.28 Y149.656
G1 X77.114 Y148.491 E.04909
G1 X77.114 Y149.024
G1 X78.28 Y150.19 E.04909
G1 X78.28 Y150.723
G1 X77.114 Y149.558 E.04909
G1 X77.114 Y150.091
G1 X78.28 Y151.256 E.04909
G1 X78.28 Y151.789
G1 X77.114 Y150.624 E.04909
G1 X77.114 Y151.157
G1 X78.28 Y152.323 E.04909
G1 X78.28 Y152.856
G1 X77.114 Y151.691 E.04909
G1 X77.114 Y152.224
G1 X78.28 Y153.389 E.04909
G1 X78.28 Y153.922
G1 X77.114 Y152.757 E.04909
G1 X77.114 Y153.29
G1 X78.28 Y154.456 E.04909
G1 X78.28 Y154.989
G1 X77.114 Y153.824 E.04909
G1 X77.114 Y154.357
G1 X78.28 Y155.522 E.04909
G1 X78.28 Y156.055
G1 X77.114 Y154.89 E.04909
G1 X77.114 Y155.423
G1 X78.28 Y156.589 E.04909
G1 X78.28 Y157.122
G1 X77.114 Y155.957 E.04909
G1 X77.114 Y156.49
G1 X78.28 Y157.655 E.04909
G1 X78.28 Y158.188
G1 X77.114 Y157.023 E.04909
G1 X77.114 Y157.556
G1 X78.28 Y158.722 E.04909
G1 X78.28 Y159.255
G1 X77.114 Y158.09 E.04909
G1 X77.114 Y158.623
G1 X78.28 Y159.788 E.04909
G1 X78.28 Y160.322
G1 X77.114 Y159.156 E.04909
G1 X77.114 Y159.69
G1 X78.28 Y160.855 E.04909
G1 X78.28 Y161.388
G1 X77.114 Y160.223 E.04909
G1 X77.114 Y160.756
G1 X78.28 Y161.921 E.04909
G1 X78.28 Y162.455
G1 X77.114 Y161.289 E.04909
G1 X77.114 Y161.823
G1 X78.28 Y162.988 E.04909
G1 X78.28 Y163.521
G1 X77.114 Y162.356 E.04909
G1 X77.114 Y162.889
G1 X78.28 Y164.054 E.04909
G1 X78.28 Y164.588
G1 X77.114 Y163.422 E.04909
G1 X77.114 Y163.956
G1 X78.28 Y165.121 E.04909
G1 X78.28 Y165.654
G1 X77.114 Y164.489 E.04909
G1 X77.114 Y165.022
G1 X78.28 Y166.187 E.04909
G1 X78.28 Y166.721
G1 X77.114 Y165.555 E.04909
G1 X77.114 Y166.089
G1 X78.28 Y167.254 E.04909
G1 X78.28 Y167.787
G1 X77.114 Y166.622 E.04909
G1 X77.114 Y167.155
G1 X78.28 Y168.32 E.04909
G1 X78.28 Y168.854
G1 X77.114 Y167.688 E.04909
G1 X77.114 Y168.222
G1 X78.28 Y169.387 E.04909
G1 X78.28 Y169.92
G1 X77.114 Y168.755 E.04909
G1 X77.114 Y169.288
G1 X78.28 Y170.453 E.04909
G1 X78.28 Y170.987
G1 X77.114 Y169.821 E.04909
G1 X77.114 Y170.355
G1 X78.28 Y171.52 E.04909
G1 X78.28 Y172.053
G1 X77.114 Y170.888 E.04909
G1 X77.114 Y171.421
G1 X78.28 Y172.586 E.04909
G1 X78.28 Y173.12
G1 X77.114 Y171.954 E.04909
G1 X77.114 Y172.488
G1 X78.28 Y173.653 E.04909
G1 X78.28 Y174.186
G1 X77.114 Y173.021 E.04909
G1 X77.114 Y173.554
G1 X78.28 Y174.719 E.04909
G1 X78.28 Y175.253
G1 X77.114 Y174.087 E.04909
G1 X77.114 Y174.621
G1 X78.28 Y175.786 E.04909
G1 X78.28 Y176.319
G1 X77.114 Y175.154 E.04909
G1 X77.114 Y175.687
G1 X78.28 Y176.852 E.04909
G1 X78.28 Y177.386
G1 X77.114 Y176.22 E.04909
G1 X77.114 Y176.754
G1 X78.28 Y177.919 E.04909
G1 X78.28 Y178.452
G1 X77.114 Y177.287 E.04909
G1 X77.114 Y177.82
G1 X78.28 Y178.986 E.04909
G1 X78.28 Y179.519
G1 X77.114 Y178.354 E.04909
G1 X77.114 Y178.887
G1 X78.28 Y180.052 E.04909
G1 X78.28 Y180.585
G1 X77.114 Y179.42 E.04909
G1 X77.114 Y179.953
G1 X78.28 Y181.119 E.04909
G1 X78.28 Y181.652
G1 X77.114 Y180.487 E.04909
G1 X77.114 Y181.02
G1 X78.28 Y182.185 E.04909
G1 X78.28 Y182.718
G1 X77.114 Y181.553 E.04909
G1 X77.114 Y182.086
G1 X78.28 Y183.252 E.04909
G1 X78.28 Y183.785
G1 X77.114 Y182.62 E.04909
G1 X77.114 Y183.153
G1 X78.28 Y184.318 E.04909
G1 X78.28 Y184.851
G1 X77.114 Y183.686 E.04909
G1 X77.114 Y184.219
G1 X78.28 Y185.385 E.04909
G1 X78.28 Y185.918
G1 X77.114 Y184.753 E.04909
G1 X77.114 Y185.286
G1 X78.28 Y186.451 E.04909
G1 X78.28 Y186.984
G1 X77.114 Y185.819 E.04909
G1 X77.114 Y186.352
G1 X78.28 Y187.518 E.04909
G1 X78.28 Y188.051
G1 X77.114 Y186.886 E.04909
G1 X77.114 Y187.419
G1 X78.28 Y188.584 E.04909
G1 X78.28 Y189.117
G1 X77.114 Y187.952 E.04909
G1 X77.114 Y188.485
G1 X78.28 Y189.651 E.04909
G1 X78.28 Y190.184
G1 X77.114 Y189.019 E.04909
G1 X77.114 Y189.552
G1 X78.28 Y190.717 E.04909
G1 X78.28 Y191.25
G1 X77.114 Y190.085 E.04909
G1 X77.114 Y190.618
G1 X78.28 Y191.784 E.04909
G1 X78.28 Y192.317
G1 X77.114 Y191.152 E.04909
G1 X77.114 Y191.685
G1 X78.28 Y192.85 E.04909
G1 X78.28 Y193.383
G1 X77.114 Y192.218 E.04909
G1 X77.114 Y192.751
G1 X78.28 Y193.917 E.04909
G1 X78.28 Y194.45
G1 X77.114 Y193.285 E.04909
G1 X77.114 Y193.818
G1 X78.28 Y194.983 E.04909
G1 X78.28 Y195.517
G1 X77.114 Y194.351 E.04909
G1 X77.114 Y194.885
G1 X78.28 Y196.05 E.04909
G1 X78.28 Y196.583
G1 X77.114 Y195.418 E.04909
G1 X77.114 Y195.951
G1 X78.28 Y197.116 E.04909
G1 X78.28 Y197.65
G1 X77.114 Y196.484 E.04909
M73 P90 R1
G1 X77.114 Y197.018
G1 X78.28 Y198.183 E.04909
G1 X78.28 Y198.716
G1 X77.114 Y197.551 E.04909
G1 X77.114 Y198.084
G1 X78.28 Y199.249 E.04909
G1 X78.28 Y199.783
G1 X77.114 Y198.617 E.04909
G1 X77.114 Y199.151
G1 X78.28 Y200.316 E.04909
G1 X78.28 Y200.849
G1 X77.114 Y199.684 E.04909
G1 X77.114 Y200.217
G1 X78.28 Y201.382 E.04909
G1 X78.28 Y201.916
G1 X77.114 Y200.75 E.04909
G1 X77.114 Y201.284
G1 X78.28 Y202.449 E.04909
G1 X78.28 Y202.982
G1 X77.114 Y201.817 E.04909
G1 X77.114 Y202.35
G1 X78.28 Y203.515 E.04909
G1 X78.28 Y204.049
G1 X77.114 Y202.883 E.04909
; WIPE_START
M204 S5000
G1 X78.28 Y204.049 E-.62621
G1 X78.28 Y203.697 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X82.529 Y197.357 Z1.4 F15000
G1 X132.28 Y123.134 Z1.4
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X131.114 Y121.969 E.04909
G1 X131.114 Y122.502
G1 X132.28 Y123.668 E.04909
G1 X132.28 Y124.201
G1 X131.114 Y123.036 E.04909
G1 X131.114 Y123.569
G1 X132.28 Y124.734 E.04909
G1 X132.28 Y125.268
G1 X131.114 Y124.102 E.04909
G1 X131.114 Y124.636
G1 X132.28 Y125.801 E.04909
G1 X132.28 Y126.334
G1 X131.114 Y125.169 E.04909
G1 X131.114 Y125.702
G1 X132.28 Y126.867 E.04909
G1 X132.28 Y127.401
G1 X131.114 Y126.235 E.04909
G1 X131.114 Y126.769
G1 X132.28 Y127.934 E.04909
G1 X132.28 Y128.467
G1 X131.114 Y127.302 E.04909
G1 X131.114 Y127.835
G1 X132.28 Y129 E.04909
G1 X132.28 Y129.534
G1 X131.114 Y128.368 E.04909
G1 X131.114 Y128.902
G1 X132.28 Y130.067 E.04909
G1 X132.28 Y130.6
G1 X131.114 Y129.435 E.04909
G1 X131.114 Y129.968
G1 X132.28 Y131.133 E.04909
G1 X132.28 Y131.667
G1 X131.114 Y130.501 E.04909
G1 X131.114 Y131.035
G1 X132.28 Y132.2 E.04909
G1 X132.28 Y132.733
G1 X131.114 Y131.568 E.04909
G1 X131.114 Y132.101
G1 X132.28 Y133.266 E.04909
G1 X132.28 Y133.8
G1 X131.114 Y132.634 E.04909
G1 X131.114 Y133.168
G1 X132.28 Y134.333 E.04909
G1 X132.28 Y134.866
G1 X131.114 Y133.701 E.04909
G1 X131.114 Y134.234
G1 X132.28 Y135.399 E.04909
G1 X132.28 Y135.933
G1 X131.114 Y134.767 E.04909
G1 X131.114 Y135.301
G1 X132.28 Y136.466 E.04909
G1 X132.28 Y136.999
G1 X131.114 Y135.834 E.04909
G1 X131.114 Y136.367
G1 X132.28 Y137.532 E.04909
G1 X132.28 Y138.066
G1 X131.114 Y136.9 E.04909
G1 X131.114 Y137.434
G1 X132.28 Y138.599 E.04909
G1 X132.28 Y139.132
G1 X131.114 Y137.967 E.04909
G1 X131.114 Y138.5
G1 X132.28 Y139.665 E.04909
G1 X132.28 Y140.199
G1 X131.114 Y139.033 E.04909
G1 X131.114 Y139.567
G1 X132.28 Y140.732 E.04909
G1 X132.28 Y141.265
G1 X131.114 Y140.1 E.04909
G1 X131.114 Y140.633
G1 X132.28 Y141.798 E.04909
G1 X132.28 Y142.332
G1 X131.114 Y141.167 E.04909
G1 X131.114 Y141.7
G1 X132.28 Y142.865 E.04909
G1 X132.28 Y143.398
G1 X131.114 Y142.233 E.04909
G1 X131.114 Y142.766
G1 X132.28 Y143.932 E.04909
G1 X132.28 Y144.465
G1 X131.114 Y143.3 E.04909
G1 X131.114 Y143.833
G1 X132.28 Y144.998 E.04909
G1 X132.28 Y145.531
G1 X131.114 Y144.366 E.04909
G1 X131.114 Y144.899
G1 X132.28 Y146.065 E.04909
G1 X132.28 Y146.598
G1 X131.114 Y145.433 E.04909
G1 X131.114 Y145.966
G1 X132.28 Y147.131 E.04909
G1 X132.28 Y147.664
G1 X131.114 Y146.499 E.04909
G1 X131.114 Y147.032
G1 X132.28 Y148.198 E.04909
G1 X132.28 Y148.731
G1 X131.114 Y147.566 E.04909
G1 X131.114 Y148.099
G1 X132.28 Y149.264 E.04909
G1 X132.28 Y149.797
G1 X131.114 Y148.632 E.04909
G1 X131.114 Y149.165
G1 X132.28 Y150.331 E.04909
G1 X132.28 Y150.864
G1 X131.114 Y149.699 E.04909
G1 X131.114 Y150.232
G1 X132.28 Y151.397 E.04909
G1 X132.28 Y151.93
G1 X131.114 Y150.765 E.04909
G1 X131.114 Y151.298
G1 X132.28 Y152.464 E.04909
G1 X132.28 Y152.997
G1 X131.114 Y151.832 E.04909
G1 X131.114 Y152.365
G1 X132.28 Y153.53 E.04909
G1 X132.28 Y154.063
G1 X131.114 Y152.898 E.04909
G1 X131.114 Y153.431
G1 X132.28 Y154.597 E.04909
G1 X132.28 Y155.13
G1 X131.114 Y153.965 E.04909
G1 X131.114 Y154.498
G1 X132.28 Y155.663 E.04909
G1 X132.28 Y156.196
G1 X131.114 Y155.031 E.04909
G1 X131.114 Y155.564
G1 X132.28 Y156.73 E.04909
G1 X132.28 Y157.263
G1 X131.114 Y156.098 E.04909
G1 X131.114 Y156.631
G1 X132.28 Y157.796 E.04909
G1 X132.28 Y158.329
G1 X131.114 Y157.164 E.04909
G1 X131.114 Y157.697
G1 X132.28 Y158.863 E.04909
G1 X132.28 Y159.396
G1 X131.114 Y158.231 E.04909
G1 X131.114 Y158.764
G1 X132.28 Y159.929 E.04909
G1 X132.28 Y160.463
G1 X131.114 Y159.297 E.04909
G1 X131.114 Y159.831
G1 X132.28 Y160.996 E.04909
G1 X132.28 Y161.529
G1 X131.114 Y160.364 E.04909
G1 X131.114 Y160.897
G1 X132.28 Y162.062 E.04909
G1 X132.28 Y162.596
G1 X131.114 Y161.43 E.04909
G1 X131.114 Y161.964
G1 X132.28 Y163.129 E.04909
G1 X132.28 Y163.662
G1 X131.114 Y162.497 E.04909
G1 X131.114 Y163.03
G1 X132.28 Y164.195 E.04909
G1 X132.28 Y164.729
G1 X131.114 Y163.563 E.04909
G1 X131.114 Y164.097
G1 X132.28 Y165.262 E.04909
G1 X132.28 Y165.795
G1 X131.114 Y164.63 E.04909
G1 X131.114 Y165.163
G1 X132.28 Y166.328 E.04909
G1 X132.28 Y166.862
G1 X131.114 Y165.696 E.04909
G1 X131.114 Y166.23
G1 X132.28 Y167.395 E.04909
G1 X132.28 Y167.928
G1 X131.114 Y166.763 E.04909
G1 X131.114 Y167.296
G1 X132.28 Y168.461 E.04909
G1 X132.28 Y168.995
G1 X131.114 Y167.829 E.04909
G1 X131.114 Y168.363
G1 X132.28 Y169.528 E.04909
G1 X132.28 Y170.061
G1 X131.114 Y168.896 E.04909
G1 X131.114 Y169.429
G1 X132.28 Y170.594 E.04909
G1 X132.28 Y171.128
G1 X131.114 Y169.962 E.04909
G1 X131.114 Y170.496
G1 X132.28 Y171.661 E.04909
G1 X132.28 Y172.194
G1 X131.114 Y171.029 E.04909
G1 X131.114 Y171.562
G1 X132.28 Y172.727 E.04909
G1 X132.28 Y173.261
G1 X131.114 Y172.095 E.04909
M73 P91 R1
G1 X131.114 Y172.629
G1 X132.28 Y173.794 E.04909
G1 X132.28 Y174.327
G1 X131.114 Y173.162 E.04909
G1 X131.114 Y173.695
G1 X132.28 Y174.86 E.04909
G1 X132.28 Y175.394
G1 X131.114 Y174.228 E.04909
G1 X131.114 Y174.762
G1 X132.28 Y175.927 E.04909
G1 X132.28 Y176.46
G1 X131.114 Y175.295 E.04909
G1 X131.114 Y175.828
G1 X132.28 Y176.993 E.04909
G1 X132.28 Y177.527
G1 X131.114 Y176.362 E.04909
G1 X131.114 Y176.895
G1 X132.28 Y178.06 E.04909
G1 X132.28 Y178.593
G1 X131.114 Y177.428 E.04909
G1 X131.114 Y177.961
G1 X132.28 Y179.127 E.04909
G1 X132.28 Y179.66
G1 X131.114 Y178.495 E.04909
G1 X131.114 Y179.028
G1 X132.28 Y180.193 E.04909
G1 X132.28 Y180.726
G1 X131.114 Y179.561 E.04909
G1 X131.114 Y180.094
G1 X132.28 Y181.26 E.04909
G1 X132.28 Y181.793
G1 X131.114 Y180.628 E.04909
G1 X131.114 Y181.161
G1 X132.28 Y182.326 E.04909
G1 X132.28 Y182.859
G1 X131.114 Y181.694 E.04909
G1 X131.114 Y182.227
G1 X132.28 Y183.393 E.04909
G1 X132.28 Y183.926
G1 X131.114 Y182.761 E.04909
G1 X131.114 Y183.294
G1 X132.28 Y184.459 E.04909
G1 X132.28 Y184.992
G1 X131.114 Y183.827 E.04909
G1 X131.114 Y184.36
G1 X132.28 Y185.526 E.04909
G1 X132.28 Y186.059
G1 X131.114 Y184.894 E.04909
G1 X131.114 Y185.427
G1 X132.28 Y186.592 E.04909
G1 X132.28 Y187.125
G1 X131.114 Y185.96 E.04909
G1 X131.114 Y186.493
G1 X132.28 Y187.659 E.04909
G1 X132.28 Y188.192
G1 X131.114 Y187.027 E.04909
G1 X131.114 Y187.56
G1 X132.28 Y188.725 E.04909
G1 X132.28 Y189.258
G1 X131.114 Y188.093 E.04909
G1 X131.114 Y188.626
G1 X132.28 Y189.792 E.04909
G1 X132.28 Y190.325
G1 X131.114 Y189.16 E.04909
G1 X131.114 Y189.693
G1 X132.28 Y190.858 E.04909
G1 X132.28 Y191.391
G1 X131.114 Y190.226 E.04909
G1 X131.114 Y190.759
G1 X132.28 Y191.925 E.04909
G1 X132.28 Y192.458
G1 X131.114 Y191.293 E.04909
G1 X131.114 Y191.826
G1 X132.28 Y192.991 E.04909
G1 X132.28 Y193.524
G1 X131.114 Y192.359 E.04909
G1 X131.114 Y192.892
G1 X132.28 Y194.058 E.04909
G1 X132.28 Y194.591
G1 X131.114 Y193.426 E.04909
G1 X131.114 Y193.959
G1 X132.28 Y195.124 E.04909
G1 X132.28 Y195.658
G1 X131.114 Y194.492 E.04909
G1 X131.114 Y195.026
G1 X132.28 Y196.191 E.04909
G1 X132.28 Y196.724
G1 X131.114 Y195.559 E.04909
G1 X131.114 Y196.092
G1 X132.28 Y197.257 E.04909
G1 X132.28 Y197.791
G1 X131.114 Y196.625 E.04909
G1 X131.114 Y197.159
G1 X132.28 Y198.324 E.04909
G1 X132.28 Y198.857
G1 X131.114 Y197.692 E.04909
G1 X131.114 Y198.225
G1 X132.28 Y199.39 E.04909
G1 X132.28 Y199.924
G1 X131.114 Y198.758 E.04909
G1 X131.114 Y199.292
G1 X132.28 Y200.457 E.04909
G1 X132.28 Y200.99
G1 X131.114 Y199.825 E.04909
G1 X131.114 Y200.358
G1 X132.28 Y201.523 E.04909
G1 X132.28 Y202.057
G1 X131.114 Y200.891 E.04909
G1 X131.114 Y201.425
G1 X132.28 Y202.59 E.04909
G1 X132.28 Y203.123
G1 X131.114 Y201.958 E.04909
G1 X131.114 Y202.491
G1 X132.28 Y203.656 E.04909
G1 X132.28 Y204.19
G1 X131.114 Y203.024 E.04909
G1 X131.114 Y203.558
G1 X132.28 Y204.723 E.04909
G1 X132.28 Y205.256
G1 X131.114 Y204.091 E.04909
G1 X130.916 Y204.426
G1 X132.082 Y205.591 E.04909
G1 X131.548 Y205.591
G1 X130.383 Y204.426 E.04909
G1 X129.85 Y204.426
G1 X131.015 Y205.591 E.04909
G1 X130.482 Y205.591
G1 X129.317 Y204.426 E.04909
G1 X128.783 Y204.426
G1 X129.949 Y205.591 E.04909
G1 X129.415 Y205.591
G1 X128.25 Y204.426 E.04909
G1 X127.717 Y204.426
G1 X128.882 Y205.591 E.04909
G1 X128.349 Y205.591
G1 X127.184 Y204.426 E.04909
G1 X126.65 Y204.426
G1 X127.816 Y205.591 E.04909
G1 X127.282 Y205.591
G1 X126.117 Y204.426 E.04909
G1 X125.584 Y204.426
G1 X126.749 Y205.591 E.04909
G1 X126.216 Y205.591
G1 X125.051 Y204.426 E.04909
G1 X124.517 Y204.426
G1 X125.683 Y205.591 E.04909
G1 X125.149 Y205.591
G1 X123.984 Y204.426 E.04909
G1 X123.451 Y204.426
G1 X124.616 Y205.591 E.04909
G1 X124.083 Y205.591
G1 X122.918 Y204.426 E.04909
G1 X122.384 Y204.426
G1 X123.55 Y205.591 E.04909
G1 X123.016 Y205.591
G1 X121.851 Y204.426 E.04909
G1 X121.318 Y204.426
G1 X122.483 Y205.591 E.04909
G1 X121.95 Y205.591
G1 X120.785 Y204.426 E.04909
G1 X120.251 Y204.426
G1 X121.416 Y205.591 E.04909
G1 X120.883 Y205.591
G1 X119.718 Y204.426 E.04909
G1 X119.185 Y204.426
G1 X120.35 Y205.591 E.04909
G1 X119.817 Y205.591
G1 X118.651 Y204.426 E.04909
G1 X118.118 Y204.426
G1 X119.283 Y205.591 E.04909
G1 X118.75 Y205.591
G1 X117.585 Y204.426 E.04909
G1 X117.052 Y204.426
G1 X118.217 Y205.591 E.04909
G1 X117.684 Y205.591
G1 X116.518 Y204.426 E.04909
G1 X115.985 Y204.426
G1 X117.15 Y205.591 E.04909
G1 X116.617 Y205.591
G1 X115.452 Y204.426 E.04909
G1 X114.919 Y204.426
G1 X116.084 Y205.591 E.04909
G1 X115.551 Y205.591
G1 X114.385 Y204.426 E.04909
G1 X113.852 Y204.426
G1 X115.017 Y205.591 E.04909
G1 X114.484 Y205.591
G1 X113.319 Y204.426 E.04909
G1 X112.786 Y204.426
G1 X113.951 Y205.591 E.04909
G1 X113.418 Y205.591
G1 X112.252 Y204.426 E.04909
G1 X111.719 Y204.426
G1 X112.884 Y205.591 E.04909
G1 X112.351 Y205.591
G1 X111.186 Y204.426 E.04909
G1 X110.653 Y204.426
G1 X111.818 Y205.591 E.04909
G1 X111.285 Y205.591
G1 X110.119 Y204.426 E.04909
G1 X109.586 Y204.426
G1 X110.751 Y205.591 E.04909
G1 X110.218 Y205.591
G1 X109.053 Y204.426 E.04909
G1 X108.52 Y204.426
G1 X109.685 Y205.591 E.04909
G1 X109.152 Y205.591
G1 X107.986 Y204.426 E.04909
G1 X107.453 Y204.426
G1 X108.618 Y205.591 E.04909
G1 X108.085 Y205.591
G1 X106.92 Y204.426 E.04909
G1 X106.387 Y204.426
G1 X107.552 Y205.591 E.04909
G1 X107.019 Y205.591
G1 X105.853 Y204.426 E.04909
G1 X105.32 Y204.426
G1 X106.485 Y205.591 E.04909
G1 X105.952 Y205.591
G1 X104.787 Y204.426 E.04909
G1 X104.254 Y204.426
G1 X105.419 Y205.591 E.04909
G1 X104.886 Y205.591
G1 X103.72 Y204.426 E.04909
G1 X103.187 Y204.426
G1 X104.352 Y205.591 E.04909
M73 P92 R1
G1 X103.819 Y205.591
G1 X102.654 Y204.426 E.04909
G1 X102.12 Y204.426
G1 X103.286 Y205.591 E.04909
G1 X102.752 Y205.591
G1 X101.587 Y204.426 E.04909
G1 X101.054 Y204.426
G1 X102.219 Y205.591 E.04909
G1 X101.686 Y205.591
G1 X100.521 Y204.426 E.04909
G1 X99.987 Y204.426
G1 X101.153 Y205.591 E.04909
G1 X100.619 Y205.591
G1 X99.454 Y204.426 E.04909
G1 X98.921 Y204.426
G1 X100.086 Y205.591 E.04909
G1 X99.553 Y205.591
G1 X98.388 Y204.426 E.04909
G1 X97.854 Y204.426
G1 X99.02 Y205.591 E.04909
G1 X98.486 Y205.591
G1 X97.321 Y204.426 E.04909
G1 X96.788 Y204.426
G1 X97.953 Y205.591 E.04909
G1 X97.42 Y205.591
G1 X96.255 Y204.426 E.04909
G1 X95.721 Y204.426
G1 X96.887 Y205.591 E.04909
G1 X96.353 Y205.591
G1 X95.188 Y204.426 E.04909
G1 X94.655 Y204.426
G1 X95.82 Y205.591 E.04909
G1 X95.287 Y205.591
G1 X94.122 Y204.426 E.04909
G1 X93.588 Y204.426
G1 X94.754 Y205.591 E.04909
G1 X94.22 Y205.591
G1 X93.055 Y204.426 E.04909
G1 X92.522 Y204.426
G1 X93.687 Y205.591 E.04909
G1 X93.154 Y205.591
G1 X91.989 Y204.426 E.04909
G1 X91.455 Y204.426
G1 X92.621 Y205.591 E.04909
G1 X92.087 Y205.591
G1 X90.922 Y204.426 E.04909
G1 X90.389 Y204.426
G1 X91.554 Y205.591 E.04909
G1 X91.021 Y205.591
G1 X89.856 Y204.426 E.04909
G1 X89.322 Y204.426
G1 X90.488 Y205.591 E.04909
G1 X89.954 Y205.591
G1 X88.789 Y204.426 E.04909
G1 X88.256 Y204.426
G1 X89.421 Y205.591 E.04909
G1 X88.888 Y205.591
G1 X87.723 Y204.426 E.04909
G1 X87.189 Y204.426
G1 X88.355 Y205.591 E.04909
G1 X87.821 Y205.591
G1 X86.656 Y204.426 E.04909
G1 X86.123 Y204.426
G1 X87.288 Y205.591 E.04909
G1 X86.755 Y205.591
G1 X85.59 Y204.426 E.04909
G1 X85.056 Y204.426
G1 X86.222 Y205.591 E.04909
G1 X85.688 Y205.591
G1 X84.523 Y204.426 E.04909
G1 X83.99 Y204.426
G1 X85.155 Y205.591 E.04909
G1 X84.622 Y205.591
G1 X83.456 Y204.426 E.04909
G1 X82.923 Y204.426
G1 X84.088 Y205.591 E.04909
G1 X83.555 Y205.591
G1 X82.39 Y204.426 E.04909
G1 X81.857 Y204.426
G1 X83.022 Y205.591 E.04909
G1 X82.489 Y205.591
G1 X81.323 Y204.426 E.04909
G1 X80.79 Y204.426
G1 X81.955 Y205.591 E.04909
G1 X81.422 Y205.591
G1 X80.257 Y204.426 E.04909
G1 X79.724 Y204.426
G1 X80.889 Y205.591 E.04909
G1 X80.356 Y205.591
G1 X79.19 Y204.426 E.04909
G1 X78.657 Y204.426
G1 X79.822 Y205.591 E.04909
G1 X79.289 Y205.591
G1 X77.114 Y203.417 E.09162
G1 X77.114 Y203.95
G1 X78.756 Y205.591 E.06915
G1 X78.223 Y205.591
G1 X77.114 Y204.483 E.04669
G1 X77.114 Y205.016
G1 X77.689 Y205.591 E.02423
; WIPE_START
M204 S5000
G1 X77.114 Y205.016 E-.30905
G1 X77.114 Y204.483 E-.20264
G1 X77.576 Y204.945 E-.24831
; WIPE_END
G1 E-.04 F1800
G1 X77.537 Y197.313 Z1.4 F15000
G1 X77.144 Y120.407 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.14558
G1 F7500
G2 X77.185 Y120.691 I.363 J.093 E.00239
; WIPE_START
G1 X77.144 Y120.594 E-.27421
G1 X77.144 Y120.407 E-.48579
; WIPE_END
G1 E-.04 F1800
G1 X81.289 Y126.816 Z1.4 F15000
G1 X132.25 Y205.61 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.145685
G1 F7500
G2 X132.209 Y205.326 I-.363 J-.093 E.00239
; OBJECT_ID: 120
; WIPE_START
G1 X132.25 Y205.424 E-.27383
G1 X132.25 Y205.61 E-.48617
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 98
M625
; start printing object, unique label id: 120
M624 BAAAAAAAAAA=
G1 X135.687 Y198.796 Z1.4 F15000
G1 X185.45 Y100.135 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X103.03 Y100.135 E2.45501
G1 X103.03 Y47.715 E1.56141
G1 X185.45 Y47.715 E2.45501
G1 X185.45 Y100.075 E1.55963
; WIPE_START
M204 S5000
G1 X183.45 Y100.076 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X187.03 Y101.715 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X101.45 Y101.715 E2.54914
G1 X101.45 Y46.135 E1.65554
G1 X187.03 Y46.135 E2.54914
G1 X187.03 Y101.655 E1.65375
; WIPE_START
M204 S5000
G1 X185.03 Y101.656 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X185.28 Y94.028 Z1.4 F15000
G1 X186.823 Y46.917 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X186.248 Y46.342 E.02423
G1 X185.714 Y46.342
G1 X186.823 Y47.451 E.04669
G1 X186.823 Y47.984
G1 X185.181 Y46.342 E.06916
G1 X184.648 Y46.342
G1 X186.823 Y48.517 E.09162
G1 X186.823 Y49.051
G1 X185.658 Y47.885 E.04909
G1 X185.658 Y48.419
G1 X186.823 Y49.584 E.04909
G1 X186.823 Y50.117
G1 X185.658 Y48.952 E.04909
G1 X185.658 Y49.485
G1 X186.823 Y50.65 E.04909
G1 X186.823 Y51.184
G1 X185.658 Y50.018 E.04909
G1 X185.658 Y50.552
G1 X186.823 Y51.717 E.04909
G1 X186.823 Y52.25
G1 X185.658 Y51.085 E.04909
G1 X185.658 Y51.618
G1 X186.823 Y52.783 E.04909
G1 X186.823 Y53.317
G1 X185.658 Y52.151 E.04909
G1 X185.658 Y52.685
G1 X186.823 Y53.85 E.04909
G1 X186.823 Y54.383
G1 X185.658 Y53.218 E.04909
G1 X185.658 Y53.751
G1 X186.823 Y54.916 E.04909
G1 X186.823 Y55.45
M73 P93 R1
G1 X185.658 Y54.284 E.04909
G1 X185.658 Y54.818
G1 X186.823 Y55.983 E.04909
G1 X186.823 Y56.516
G1 X185.658 Y55.351 E.04909
G1 X185.658 Y55.884
G1 X186.823 Y57.049 E.04909
G1 X186.823 Y57.583
G1 X185.658 Y56.417 E.04909
G1 X185.658 Y56.951
G1 X186.823 Y58.116 E.04909
G1 X186.823 Y58.649
G1 X185.658 Y57.484 E.04909
G1 X185.658 Y58.017
G1 X186.823 Y59.182 E.04909
G1 X186.823 Y59.716
G1 X185.658 Y58.55 E.04909
G1 X185.658 Y59.084
G1 X186.823 Y60.249 E.04909
G1 X186.823 Y60.782
G1 X185.658 Y59.617 E.04909
G1 X185.658 Y60.15
G1 X186.823 Y61.315 E.04909
G1 X186.823 Y61.849
G1 X185.658 Y60.683 E.04909
G1 X185.658 Y61.217
G1 X186.823 Y62.382 E.04909
G1 X186.823 Y62.915
G1 X185.658 Y61.75 E.04909
G1 X185.658 Y62.283
G1 X186.823 Y63.448 E.04909
G1 X186.823 Y63.982
G1 X185.658 Y62.816 E.04909
G1 X185.658 Y63.35
G1 X186.823 Y64.515 E.04909
G1 X186.823 Y65.048
G1 X185.658 Y63.883 E.04909
G1 X185.658 Y64.416
G1 X186.823 Y65.581 E.04909
G1 X186.823 Y66.115
G1 X185.658 Y64.949 E.04909
G1 X185.658 Y65.483
G1 X186.823 Y66.648 E.04909
G1 X186.823 Y67.181
G1 X185.658 Y66.016 E.04909
G1 X185.658 Y66.549
G1 X186.823 Y67.715 E.04909
G1 X186.823 Y68.248
G1 X185.658 Y67.083 E.04909
G1 X185.658 Y67.616
G1 X186.823 Y68.781 E.04909
G1 X186.823 Y69.314
G1 X185.658 Y68.149 E.04909
G1 X185.658 Y68.682
G1 X186.823 Y69.848 E.04909
G1 X186.823 Y70.381
G1 X185.658 Y69.216 E.04909
G1 X185.658 Y69.749
G1 X186.823 Y70.914 E.04909
G1 X186.823 Y71.447
G1 X185.658 Y70.282 E.04909
G1 X185.658 Y70.815
G1 X186.823 Y71.981 E.04909
G1 X186.823 Y72.514
G1 X185.658 Y71.349 E.04909
G1 X185.658 Y71.882
G1 X186.823 Y73.047 E.04909
G1 X186.823 Y73.58
G1 X185.658 Y72.415 E.04909
G1 X185.658 Y72.948
G1 X186.823 Y74.114 E.04909
G1 X186.823 Y74.647
G1 X185.658 Y73.482 E.04909
G1 X185.658 Y74.015
G1 X186.823 Y75.18 E.04909
G1 X186.823 Y75.713
G1 X185.658 Y74.548 E.04909
G1 X185.658 Y75.081
G1 X186.823 Y76.247 E.04909
G1 X186.823 Y76.78
G1 X185.658 Y75.615 E.04909
G1 X185.658 Y76.148
G1 X186.823 Y77.313 E.04909
G1 X186.823 Y77.846
G1 X185.658 Y76.681 E.04909
G1 X185.658 Y77.214
G1 X186.823 Y78.38 E.04909
G1 X186.823 Y78.913
G1 X185.658 Y77.748 E.04909
G1 X185.658 Y78.281
G1 X186.823 Y79.446 E.04909
G1 X186.823 Y79.979
G1 X185.658 Y78.814 E.04909
G1 X185.658 Y79.347
G1 X186.823 Y80.513 E.04909
G1 X186.823 Y81.046
G1 X185.658 Y79.881 E.04909
G1 X185.658 Y80.414
G1 X186.823 Y81.579 E.04909
G1 X186.823 Y82.112
G1 X185.658 Y80.947 E.04909
G1 X185.658 Y81.48
G1 X186.823 Y82.646 E.04909
G1 X186.823 Y83.179
G1 X185.658 Y82.014 E.04909
G1 X185.658 Y82.547
G1 X186.823 Y83.712 E.04909
G1 X186.823 Y84.245
G1 X185.658 Y83.08 E.04909
G1 X185.658 Y83.614
G1 X186.823 Y84.779 E.04909
G1 X186.823 Y85.312
G1 X185.658 Y84.147 E.04909
G1 X185.658 Y84.68
G1 X186.823 Y85.845 E.04909
G1 X186.823 Y86.379
G1 X185.658 Y85.213 E.04909
G1 X185.658 Y85.747
G1 X186.823 Y86.912 E.04909
G1 X186.823 Y87.445
G1 X185.658 Y86.28 E.04909
G1 X185.658 Y86.813
G1 X186.823 Y87.978 E.04909
G1 X186.823 Y88.512
G1 X185.658 Y87.346 E.04909
G1 X185.658 Y87.88
G1 X186.823 Y89.045 E.04909
G1 X186.823 Y89.578
G1 X185.658 Y88.413 E.04909
G1 X185.658 Y88.946
G1 X186.823 Y90.111 E.04909
G1 X186.823 Y90.645
G1 X185.658 Y89.479 E.04909
G1 X185.658 Y90.013
G1 X186.823 Y91.178 E.04909
G1 X186.823 Y91.711
G1 X185.658 Y90.546 E.04909
G1 X185.658 Y91.079
G1 X186.823 Y92.244 E.04909
G1 X186.823 Y92.778
G1 X185.658 Y91.612 E.04909
G1 X185.658 Y92.146
M73 P94 R1
G1 X186.823 Y93.311 E.04909
G1 X186.823 Y93.844
G1 X185.658 Y92.679 E.04909
G1 X185.658 Y93.212
G1 X186.823 Y94.377 E.04909
G1 X186.823 Y94.911
G1 X185.658 Y93.745 E.04909
G1 X185.658 Y94.279
G1 X186.823 Y95.444 E.04909
G1 X186.823 Y95.977
G1 X185.658 Y94.812 E.04909
G1 X185.658 Y95.345
G1 X186.823 Y96.51 E.04909
G1 X186.823 Y97.044
G1 X185.658 Y95.878 E.04909
G1 X185.658 Y96.412
G1 X186.823 Y97.577 E.04909
G1 X186.823 Y98.11
G1 X185.658 Y96.945 E.04909
G1 X185.658 Y97.478
G1 X186.823 Y98.643 E.04909
G1 X186.823 Y99.177
G1 X185.658 Y98.011 E.04909
G1 X185.658 Y98.545
G1 X186.823 Y99.71 E.04909
G1 X186.823 Y100.243
G1 X185.658 Y99.078 E.04909
G1 X185.658 Y99.611
G1 X186.823 Y100.776 E.04909
G1 X186.823 Y101.31
G1 X185.658 Y100.144 E.04909
G1 X185.322 Y100.342
G1 X186.487 Y101.508 E.04909
G1 X185.954 Y101.508
G1 X184.789 Y100.342 E.04909
G1 X184.256 Y100.342
G1 X185.421 Y101.508 E.04909
G1 X184.888 Y101.508
G1 X183.722 Y100.342 E.04909
G1 X183.189 Y100.342
G1 X184.354 Y101.508 E.04909
G1 X183.821 Y101.508
G1 X182.656 Y100.342 E.04909
G1 X182.122 Y100.342
G1 X183.288 Y101.508 E.04909
G1 X182.754 Y101.508
G1 X181.589 Y100.342 E.04909
G1 X181.056 Y100.342
G1 X182.221 Y101.508 E.04909
G1 X181.688 Y101.508
G1 X180.523 Y100.342 E.04909
G1 X179.989 Y100.342
G1 X181.155 Y101.508 E.04909
G1 X180.621 Y101.508
G1 X179.456 Y100.342 E.04909
G1 X178.923 Y100.342
G1 X180.088 Y101.508 E.04909
M73 P94 R0
G1 X179.555 Y101.508
G1 X178.39 Y100.342 E.04909
G1 X177.856 Y100.342
G1 X179.022 Y101.508 E.04909
G1 X178.488 Y101.508
G1 X177.323 Y100.342 E.04909
G1 X176.79 Y100.342
G1 X177.955 Y101.508 E.04909
G1 X177.422 Y101.508
G1 X176.257 Y100.342 E.04909
G1 X175.723 Y100.342
G1 X176.889 Y101.508 E.04909
G1 X176.355 Y101.508
G1 X175.19 Y100.342 E.04909
G1 X174.657 Y100.342
G1 X175.822 Y101.508 E.04909
G1 X175.289 Y101.508
G1 X174.124 Y100.342 E.04909
G1 X173.59 Y100.342
G1 X174.756 Y101.508 E.04909
G1 X174.222 Y101.508
G1 X173.057 Y100.342 E.04909
G1 X172.524 Y100.342
G1 X173.689 Y101.508 E.04909
G1 X173.156 Y101.508
G1 X171.991 Y100.342 E.04909
G1 X171.457 Y100.342
G1 X172.623 Y101.508 E.04909
G1 X172.089 Y101.508
G1 X170.924 Y100.342 E.04909
G1 X170.391 Y100.342
G1 X171.556 Y101.508 E.04909
G1 X171.023 Y101.508
G1 X169.858 Y100.342 E.04909
G1 X169.324 Y100.342
G1 X170.49 Y101.508 E.04909
G1 X169.956 Y101.508
G1 X168.791 Y100.342 E.04909
G1 X168.258 Y100.342
G1 X169.423 Y101.508 E.04909
G1 X168.89 Y101.508
G1 X167.725 Y100.342 E.04909
G1 X167.191 Y100.342
G1 X168.357 Y101.508 E.04909
G1 X167.823 Y101.508
G1 X166.658 Y100.342 E.04909
G1 X166.125 Y100.342
G1 X167.29 Y101.508 E.04909
G1 X166.757 Y101.508
G1 X165.592 Y100.342 E.04909
G1 X165.058 Y100.342
G1 X166.224 Y101.508 E.04909
G1 X165.69 Y101.508
G1 X164.525 Y100.342 E.04909
G1 X163.992 Y100.342
G1 X165.157 Y101.508 E.04909
G1 X164.624 Y101.508
G1 X163.458 Y100.342 E.04909
G1 X162.925 Y100.342
G1 X164.09 Y101.508 E.04909
G1 X163.557 Y101.508
G1 X162.392 Y100.342 E.04909
G1 X161.859 Y100.342
G1 X163.024 Y101.508 E.04909
G1 X162.491 Y101.508
G1 X161.325 Y100.342 E.04909
G1 X160.792 Y100.342
G1 X161.957 Y101.508 E.04909
G1 X161.424 Y101.508
G1 X160.259 Y100.342 E.04909
G1 X159.726 Y100.342
G1 X160.891 Y101.508 E.04909
G1 X160.358 Y101.508
G1 X159.192 Y100.342 E.04909
G1 X158.659 Y100.342
G1 X159.824 Y101.508 E.04909
G1 X159.291 Y101.508
G1 X158.126 Y100.342 E.04909
G1 X157.593 Y100.342
G1 X158.758 Y101.508 E.04909
G1 X158.225 Y101.508
G1 X157.059 Y100.342 E.04909
G1 X156.526 Y100.342
G1 X157.691 Y101.508 E.04909
G1 X157.158 Y101.508
G1 X155.993 Y100.342 E.04909
G1 X155.46 Y100.342
G1 X156.625 Y101.508 E.04909
G1 X156.092 Y101.508
G1 X154.926 Y100.342 E.04909
G1 X154.393 Y100.342
G1 X155.558 Y101.508 E.04909
G1 X155.025 Y101.508
G1 X153.86 Y100.342 E.04909
G1 X153.327 Y100.342
G1 X154.492 Y101.508 E.04909
G1 X153.959 Y101.508
G1 X152.793 Y100.342 E.04909
G1 X152.26 Y100.342
G1 X153.425 Y101.508 E.04909
G1 X152.892 Y101.508
G1 X151.727 Y100.342 E.04909
G1 X151.194 Y100.342
G1 X152.359 Y101.508 E.04909
G1 X151.826 Y101.508
G1 X150.66 Y100.342 E.04909
G1 X150.127 Y100.342
G1 X151.292 Y101.508 E.04909
G1 X150.759 Y101.508
G1 X149.594 Y100.342 E.04909
G1 X149.061 Y100.342
G1 X150.226 Y101.508 E.04909
G1 X149.693 Y101.508
G1 X148.527 Y100.342 E.04909
G1 X147.994 Y100.342
G1 X149.159 Y101.508 E.04909
G1 X148.626 Y101.508
G1 X147.461 Y100.342 E.04909
G1 X146.928 Y100.342
G1 X148.093 Y101.508 E.04909
G1 X147.559 Y101.508
G1 X146.394 Y100.342 E.04909
G1 X145.861 Y100.342
G1 X147.026 Y101.508 E.04909
G1 X146.493 Y101.508
G1 X145.328 Y100.342 E.04909
G1 X144.794 Y100.342
G1 X145.96 Y101.508 E.04909
G1 X145.426 Y101.508
G1 X144.261 Y100.342 E.04909
G1 X143.728 Y100.342
G1 X144.893 Y101.508 E.04909
G1 X144.36 Y101.508
G1 X143.195 Y100.342 E.04909
G1 X142.661 Y100.342
G1 X143.827 Y101.508 E.04909
G1 X143.293 Y101.508
G1 X142.128 Y100.342 E.04909
G1 X141.595 Y100.342
G1 X142.76 Y101.508 E.04909
G1 X142.227 Y101.508
G1 X141.062 Y100.342 E.04909
G1 X140.528 Y100.342
G1 X141.694 Y101.508 E.04909
G1 X141.16 Y101.508
G1 X139.995 Y100.342 E.04909
G1 X139.462 Y100.342
G1 X140.627 Y101.508 E.04909
G1 X140.094 Y101.508
G1 X138.929 Y100.342 E.04909
G1 X138.395 Y100.342
G1 X139.561 Y101.508 E.04909
G1 X139.027 Y101.508
G1 X137.862 Y100.342 E.04909
G1 X137.329 Y100.342
G1 X138.494 Y101.508 E.04909
G1 X137.961 Y101.508
G1 X136.796 Y100.342 E.04909
G1 X136.262 Y100.342
G1 X137.428 Y101.508 E.04909
G1 X136.894 Y101.508
G1 X135.729 Y100.342 E.04909
G1 X135.196 Y100.342
G1 X136.361 Y101.508 E.04909
G1 X135.828 Y101.508
G1 X134.663 Y100.342 E.04909
G1 X134.129 Y100.342
G1 X135.295 Y101.508 E.04909
M73 P95 R0
G1 X134.761 Y101.508
G1 X133.596 Y100.342 E.04909
G1 X133.063 Y100.342
G1 X134.228 Y101.508 E.04909
G1 X133.695 Y101.508
G1 X132.53 Y100.342 E.04909
G1 X131.996 Y100.342
G1 X133.162 Y101.508 E.04909
G1 X132.628 Y101.508
G1 X131.463 Y100.342 E.04909
G1 X130.93 Y100.342
G1 X132.095 Y101.508 E.04909
G1 X131.562 Y101.508
G1 X130.397 Y100.342 E.04909
G1 X129.863 Y100.342
G1 X131.029 Y101.508 E.04909
G1 X130.495 Y101.508
G1 X129.33 Y100.342 E.04909
G1 X128.797 Y100.342
G1 X129.962 Y101.508 E.04909
G1 X129.429 Y101.508
G1 X128.263 Y100.342 E.04909
G1 X127.73 Y100.342
G1 X128.895 Y101.508 E.04909
G1 X128.362 Y101.508
G1 X127.197 Y100.342 E.04909
G1 X126.664 Y100.342
G1 X127.829 Y101.508 E.04909
G1 X127.296 Y101.508
G1 X126.13 Y100.342 E.04909
G1 X125.597 Y100.342
G1 X126.762 Y101.508 E.04909
G1 X126.229 Y101.508
G1 X125.064 Y100.342 E.04909
G1 X124.531 Y100.342
G1 X125.696 Y101.508 E.04909
G1 X125.163 Y101.508
G1 X123.997 Y100.342 E.04909
G1 X123.464 Y100.342
G1 X124.629 Y101.508 E.04909
G1 X124.096 Y101.508
G1 X122.931 Y100.342 E.04909
G1 X122.398 Y100.342
G1 X123.563 Y101.508 E.04909
G1 X123.03 Y101.508
G1 X121.864 Y100.342 E.04909
G1 X121.331 Y100.342
G1 X122.496 Y101.508 E.04909
G1 X121.963 Y101.508
G1 X120.798 Y100.342 E.04909
G1 X120.265 Y100.342
G1 X121.43 Y101.508 E.04909
G1 X120.897 Y101.508
G1 X119.731 Y100.342 E.04909
G1 X119.198 Y100.342
G1 X120.363 Y101.508 E.04909
G1 X119.83 Y101.508
G1 X118.665 Y100.342 E.04909
G1 X118.132 Y100.342
G1 X119.297 Y101.508 E.04909
G1 X118.764 Y101.508
G1 X117.598 Y100.342 E.04909
G1 X117.065 Y100.342
G1 X118.23 Y101.508 E.04909
G1 X117.697 Y101.508
G1 X116.532 Y100.342 E.04909
G1 X115.999 Y100.342
G1 X117.164 Y101.508 E.04909
G1 X116.631 Y101.508
G1 X115.465 Y100.342 E.04909
G1 X114.932 Y100.342
G1 X116.097 Y101.508 E.04909
G1 X115.564 Y101.508
G1 X114.399 Y100.342 E.04909
G1 X113.866 Y100.342
G1 X115.031 Y101.508 E.04909
G1 X114.498 Y101.508
G1 X113.332 Y100.342 E.04909
G1 X112.799 Y100.342
G1 X113.964 Y101.508 E.04909
G1 X113.431 Y101.508
G1 X112.266 Y100.342 E.04909
G1 X111.733 Y100.342
G1 X112.898 Y101.508 E.04909
G1 X112.364 Y101.508
G1 X111.199 Y100.342 E.04909
G1 X110.666 Y100.342
G1 X111.831 Y101.508 E.04909
G1 X111.298 Y101.508
G1 X110.133 Y100.342 E.04909
G1 X109.599 Y100.342
G1 X110.765 Y101.508 E.04909
G1 X110.231 Y101.508
G1 X109.066 Y100.342 E.04909
G1 X108.533 Y100.342
G1 X109.698 Y101.508 E.04909
G1 X109.165 Y101.508
G1 X108 Y100.342 E.04909
G1 X107.466 Y100.342
G1 X108.632 Y101.508 E.04909
G1 X108.098 Y101.508
G1 X106.933 Y100.342 E.04909
G1 X106.4 Y100.342
G1 X107.565 Y101.508 E.04909
G1 X107.032 Y101.508
G1 X105.867 Y100.342 E.04909
G1 X105.333 Y100.342
G1 X106.499 Y101.508 E.04909
G1 X105.965 Y101.508
G1 X104.8 Y100.342 E.04909
G1 X104.267 Y100.342
G1 X105.432 Y101.508 E.04909
G1 X104.899 Y101.508
G1 X103.734 Y100.342 E.04909
G1 X103.2 Y100.342
G1 X104.366 Y101.508 E.04909
; WIPE_START
M204 S5000
G1 X103.2 Y100.342 E-.62621
G1 X103.552 Y100.342 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X109.892 Y96.093 Z1.4 F15000
G1 X184.115 Y46.342 Z1.4
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X185.28 Y47.508 E.04909
G1 X184.747 Y47.508
G1 X183.581 Y46.342 E.04909
G1 X183.048 Y46.342
G1 X184.213 Y47.508 E.04909
G1 X183.68 Y47.508
G1 X182.515 Y46.342 E.04909
G1 X181.981 Y46.342
G1 X183.147 Y47.508 E.04909
G1 X182.613 Y47.508
G1 X181.448 Y46.342 E.04909
G1 X180.915 Y46.342
G1 X182.08 Y47.508 E.04909
G1 X181.547 Y47.508
G1 X180.382 Y46.342 E.04909
G1 X179.848 Y46.342
G1 X181.014 Y47.508 E.04909
G1 X180.48 Y47.508
G1 X179.315 Y46.342 E.04909
G1 X178.782 Y46.342
G1 X179.947 Y47.508 E.04909
G1 X179.414 Y47.508
G1 X178.249 Y46.342 E.04909
G1 X177.715 Y46.342
G1 X178.881 Y47.508 E.04909
G1 X178.347 Y47.508
G1 X177.182 Y46.342 E.04909
G1 X176.649 Y46.342
G1 X177.814 Y47.508 E.04909
G1 X177.281 Y47.508
G1 X176.116 Y46.342 E.04909
G1 X175.582 Y46.342
G1 X176.748 Y47.508 E.04909
G1 X176.214 Y47.508
G1 X175.049 Y46.342 E.04909
G1 X174.516 Y46.342
G1 X175.681 Y47.508 E.04909
G1 X175.148 Y47.508
G1 X173.983 Y46.342 E.04909
G1 X173.449 Y46.342
G1 X174.615 Y47.508 E.04909
G1 X174.081 Y47.508
G1 X172.916 Y46.342 E.04909
G1 X172.383 Y46.342
G1 X173.548 Y47.508 E.04909
G1 X173.015 Y47.508
G1 X171.85 Y46.342 E.04909
G1 X171.316 Y46.342
G1 X172.482 Y47.508 E.04909
G1 X171.948 Y47.508
G1 X170.783 Y46.342 E.04909
G1 X170.25 Y46.342
G1 X171.415 Y47.508 E.04909
G1 X170.882 Y47.508
G1 X169.717 Y46.342 E.04909
G1 X169.183 Y46.342
G1 X170.349 Y47.508 E.04909
G1 X169.815 Y47.508
G1 X168.65 Y46.342 E.04909
G1 X168.117 Y46.342
G1 X169.282 Y47.508 E.04909
G1 X168.749 Y47.508
G1 X167.584 Y46.342 E.04909
G1 X167.05 Y46.342
G1 X168.216 Y47.508 E.04909
G1 X167.682 Y47.508
G1 X166.517 Y46.342 E.04909
G1 X165.984 Y46.342
G1 X167.149 Y47.508 E.04909
G1 X166.616 Y47.508
G1 X165.451 Y46.342 E.04909
G1 X164.917 Y46.342
G1 X166.083 Y47.508 E.04909
G1 X165.549 Y47.508
G1 X164.384 Y46.342 E.04909
G1 X163.851 Y46.342
G1 X165.016 Y47.508 E.04909
G1 X164.483 Y47.508
G1 X163.317 Y46.342 E.04909
G1 X162.784 Y46.342
G1 X163.949 Y47.508 E.04909
G1 X163.416 Y47.508
G1 X162.251 Y46.342 E.04909
G1 X161.718 Y46.342
G1 X162.883 Y47.508 E.04909
G1 X162.35 Y47.508
G1 X161.184 Y46.342 E.04909
G1 X160.651 Y46.342
G1 X161.816 Y47.508 E.04909
G1 X161.283 Y47.508
G1 X160.118 Y46.342 E.04909
G1 X159.585 Y46.342
G1 X160.75 Y47.508 E.04909
G1 X160.217 Y47.508
G1 X159.051 Y46.342 E.04909
G1 X158.518 Y46.342
G1 X159.683 Y47.508 E.04909
M73 P96 R0
G1 X159.15 Y47.508
G1 X157.985 Y46.342 E.04909
G1 X157.452 Y46.342
G1 X158.617 Y47.508 E.04909
G1 X158.084 Y47.508
G1 X156.918 Y46.342 E.04909
G1 X156.385 Y46.342
G1 X157.55 Y47.508 E.04909
G1 X157.017 Y47.508
G1 X155.852 Y46.342 E.04909
G1 X155.319 Y46.342
G1 X156.484 Y47.508 E.04909
G1 X155.951 Y47.508
G1 X154.785 Y46.342 E.04909
G1 X154.252 Y46.342
G1 X155.417 Y47.508 E.04909
G1 X154.884 Y47.508
G1 X153.719 Y46.342 E.04909
G1 X153.186 Y46.342
G1 X154.351 Y47.508 E.04909
G1 X153.818 Y47.508
G1 X152.652 Y46.342 E.04909
G1 X152.119 Y46.342
G1 X153.284 Y47.508 E.04909
G1 X152.751 Y47.508
G1 X151.586 Y46.342 E.04909
G1 X151.053 Y46.342
G1 X152.218 Y47.508 E.04909
G1 X151.685 Y47.508
G1 X150.519 Y46.342 E.04909
G1 X149.986 Y46.342
G1 X151.151 Y47.508 E.04909
G1 X150.618 Y47.508
G1 X149.453 Y46.342 E.04909
G1 X148.92 Y46.342
G1 X150.085 Y47.508 E.04909
G1 X149.552 Y47.508
G1 X148.386 Y46.342 E.04909
G1 X147.853 Y46.342
G1 X149.018 Y47.508 E.04909
G1 X148.485 Y47.508
G1 X147.32 Y46.342 E.04909
G1 X146.787 Y46.342
G1 X147.952 Y47.508 E.04909
G1 X147.418 Y47.508
G1 X146.253 Y46.342 E.04909
G1 X145.72 Y46.342
G1 X146.885 Y47.508 E.04909
G1 X146.352 Y47.508
G1 X145.187 Y46.342 E.04909
G1 X144.653 Y46.342
G1 X145.819 Y47.508 E.04909
G1 X145.285 Y47.508
G1 X144.12 Y46.342 E.04909
G1 X143.587 Y46.342
G1 X144.752 Y47.508 E.04909
G1 X144.219 Y47.508
G1 X143.054 Y46.342 E.04909
G1 X142.52 Y46.342
G1 X143.686 Y47.508 E.04909
G1 X143.152 Y47.508
G1 X141.987 Y46.342 E.04909
G1 X141.454 Y46.342
G1 X142.619 Y47.508 E.04909
G1 X142.086 Y47.508
G1 X140.921 Y46.342 E.04909
G1 X140.387 Y46.342
G1 X141.553 Y47.508 E.04909
G1 X141.019 Y47.508
G1 X139.854 Y46.342 E.04909
G1 X139.321 Y46.342
G1 X140.486 Y47.508 E.04909
G1 X139.953 Y47.508
G1 X138.788 Y46.342 E.04909
G1 X138.254 Y46.342
G1 X139.42 Y47.508 E.04909
G1 X138.886 Y47.508
G1 X137.721 Y46.342 E.04909
G1 X137.188 Y46.342
G1 X138.353 Y47.508 E.04909
G1 X137.82 Y47.508
G1 X136.655 Y46.342 E.04909
G1 X136.121 Y46.342
G1 X137.287 Y47.508 E.04909
G1 X136.753 Y47.508
G1 X135.588 Y46.342 E.04909
G1 X135.055 Y46.342
G1 X136.22 Y47.508 E.04909
G1 X135.687 Y47.508
G1 X134.522 Y46.342 E.04909
G1 X133.988 Y46.342
G1 X135.154 Y47.508 E.04909
G1 X134.62 Y47.508
G1 X133.455 Y46.342 E.04909
G1 X132.922 Y46.342
G1 X134.087 Y47.508 E.04909
G1 X133.554 Y47.508
G1 X132.389 Y46.342 E.04909
G1 X131.855 Y46.342
G1 X133.021 Y47.508 E.04909
G1 X132.487 Y47.508
G1 X131.322 Y46.342 E.04909
G1 X130.789 Y46.342
G1 X131.954 Y47.508 E.04909
G1 X131.421 Y47.508
G1 X130.256 Y46.342 E.04909
G1 X129.722 Y46.342
G1 X130.888 Y47.508 E.04909
G1 X130.354 Y47.508
G1 X129.189 Y46.342 E.04909
G1 X128.656 Y46.342
G1 X129.821 Y47.508 E.04909
G1 X129.288 Y47.508
G1 X128.122 Y46.342 E.04909
G1 X127.589 Y46.342
G1 X128.754 Y47.508 E.04909
G1 X128.221 Y47.508
G1 X127.056 Y46.342 E.04909
G1 X126.523 Y46.342
G1 X127.688 Y47.508 E.04909
G1 X127.155 Y47.508
G1 X125.989 Y46.342 E.04909
G1 X125.456 Y46.342
G1 X126.621 Y47.508 E.04909
G1 X126.088 Y47.508
G1 X124.923 Y46.342 E.04909
G1 X124.39 Y46.342
G1 X125.555 Y47.508 E.04909
G1 X125.022 Y47.508
G1 X123.856 Y46.342 E.04909
G1 X123.323 Y46.342
G1 X124.488 Y47.508 E.04909
G1 X123.955 Y47.508
G1 X122.79 Y46.342 E.04909
G1 X122.257 Y46.342
G1 X123.422 Y47.508 E.04909
G1 X122.889 Y47.508
G1 X121.723 Y46.342 E.04909
G1 X121.19 Y46.342
G1 X122.355 Y47.508 E.04909
G1 X121.822 Y47.508
G1 X120.657 Y46.342 E.04909
G1 X120.124 Y46.342
G1 X121.289 Y47.508 E.04909
G1 X120.756 Y47.508
G1 X119.59 Y46.342 E.04909
G1 X119.057 Y46.342
G1 X120.222 Y47.508 E.04909
G1 X119.689 Y47.508
G1 X118.524 Y46.342 E.04909
G1 X117.991 Y46.342
G1 X119.156 Y47.508 E.04909
G1 X118.623 Y47.508
G1 X117.457 Y46.342 E.04909
G1 X116.924 Y46.342
G1 X118.089 Y47.508 E.04909
G1 X117.556 Y47.508
G1 X116.391 Y46.342 E.04909
G1 X115.858 Y46.342
G1 X117.023 Y47.508 E.04909
G1 X116.49 Y47.508
G1 X115.324 Y46.342 E.04909
G1 X114.791 Y46.342
G1 X115.956 Y47.508 E.04909
G1 X115.423 Y47.508
G1 X114.258 Y46.342 E.04909
G1 X113.725 Y46.342
G1 X114.89 Y47.508 E.04909
G1 X114.357 Y47.508
G1 X113.191 Y46.342 E.04909
G1 X112.658 Y46.342
G1 X113.823 Y47.508 E.04909
G1 X113.29 Y47.508
G1 X112.125 Y46.342 E.04909
G1 X111.592 Y46.342
G1 X112.757 Y47.508 E.04909
G1 X112.223 Y47.508
G1 X111.058 Y46.342 E.04909
G1 X110.525 Y46.342
G1 X111.69 Y47.508 E.04909
G1 X111.157 Y47.508
G1 X109.992 Y46.342 E.04909
G1 X109.458 Y46.342
G1 X110.624 Y47.508 E.04909
G1 X110.09 Y47.508
G1 X108.925 Y46.342 E.04909
G1 X108.392 Y46.342
G1 X109.557 Y47.508 E.04909
G1 X109.024 Y47.508
G1 X107.859 Y46.342 E.04909
G1 X107.325 Y46.342
G1 X108.491 Y47.508 E.04909
G1 X107.957 Y47.508
G1 X106.792 Y46.342 E.04909
G1 X106.259 Y46.342
G1 X107.424 Y47.508 E.04909
G1 X106.891 Y47.508
G1 X105.726 Y46.342 E.04909
G1 X105.192 Y46.342
G1 X106.358 Y47.508 E.04909
G1 X105.824 Y47.508
G1 X104.659 Y46.342 E.04909
G1 X104.126 Y46.342
G1 X105.291 Y47.508 E.04909
G1 X104.758 Y47.508
G1 X103.593 Y46.342 E.04909
G1 X103.059 Y46.342
G1 X104.225 Y47.508 E.04909
G1 X103.691 Y47.508
G1 X102.526 Y46.342 E.04909
G1 X101.993 Y46.342
G1 X103.158 Y47.508 E.04909
G1 X102.823 Y47.705
G1 X101.658 Y46.54 E.04909
G1 X101.658 Y47.073
G1 X102.823 Y48.239 E.04909
G1 X102.823 Y48.772
G1 X101.658 Y47.607 E.04909
G1 X101.658 Y48.14
G1 X102.823 Y49.305 E.04909
G1 X102.823 Y49.838
G1 X101.658 Y48.673 E.04909
G1 X101.658 Y49.206
G1 X102.823 Y50.372 E.04909
G1 X102.823 Y50.905
G1 X101.658 Y49.74 E.04909
M73 P97 R0
G1 X101.658 Y50.273
G1 X102.823 Y51.438 E.04909
G1 X102.823 Y51.971
G1 X101.658 Y50.806 E.04909
G1 X101.658 Y51.339
G1 X102.823 Y52.505 E.04909
G1 X102.823 Y53.038
G1 X101.658 Y51.873 E.04909
G1 X101.658 Y52.406
G1 X102.823 Y53.571 E.04909
G1 X102.823 Y54.104
G1 X101.658 Y52.939 E.04909
G1 X101.658 Y53.473
G1 X102.823 Y54.638 E.04909
G1 X102.823 Y55.171
G1 X101.658 Y54.006 E.04909
G1 X101.658 Y54.539
G1 X102.823 Y55.704 E.04909
G1 X102.823 Y56.238
G1 X101.658 Y55.072 E.04909
G1 X101.658 Y55.606
G1 X102.823 Y56.771 E.04909
G1 X102.823 Y57.304
G1 X101.658 Y56.139 E.04909
G1 X101.658 Y56.672
G1 X102.823 Y57.837 E.04909
G1 X102.823 Y58.371
G1 X101.658 Y57.205 E.04909
G1 X101.658 Y57.739
G1 X102.823 Y58.904 E.04909
G1 X102.823 Y59.437
G1 X101.658 Y58.272 E.04909
G1 X101.658 Y58.805
G1 X102.823 Y59.97 E.04909
G1 X102.823 Y60.504
G1 X101.658 Y59.338 E.04909
G1 X101.658 Y59.872
G1 X102.823 Y61.037 E.04909
G1 X102.823 Y61.57
G1 X101.658 Y60.405 E.04909
G1 X101.658 Y60.938
G1 X102.823 Y62.103 E.04909
G1 X102.823 Y62.637
G1 X101.658 Y61.471 E.04909
G1 X101.658 Y62.005
G1 X102.823 Y63.17 E.04909
G1 X102.823 Y63.703
G1 X101.658 Y62.538 E.04909
G1 X101.658 Y63.071
G1 X102.823 Y64.236 E.04909
G1 X102.823 Y64.77
G1 X101.658 Y63.604 E.04909
G1 X101.658 Y64.138
G1 X102.823 Y65.303 E.04909
G1 X102.823 Y65.836
G1 X101.658 Y64.671 E.04909
G1 X101.658 Y65.204
G1 X102.823 Y66.369 E.04909
G1 X102.823 Y66.903
G1 X101.658 Y65.737 E.04909
G1 X101.658 Y66.271
G1 X102.823 Y67.436 E.04909
G1 X102.823 Y67.969
G1 X101.658 Y66.804 E.04909
G1 X101.658 Y67.337
G1 X102.823 Y68.502 E.04909
G1 X102.823 Y69.036
G1 X101.658 Y67.87 E.04909
G1 X101.658 Y68.404
G1 X102.823 Y69.569 E.04909
G1 X102.823 Y70.102
G1 X101.658 Y68.937 E.04909
G1 X101.658 Y69.47
G1 X102.823 Y70.635 E.04909
G1 X102.823 Y71.169
G1 X101.658 Y70.003 E.04909
G1 X101.658 Y70.537
G1 X102.823 Y71.702 E.04909
G1 X102.823 Y72.235
G1 X101.658 Y71.07 E.04909
G1 X101.658 Y71.603
G1 X102.823 Y72.769 E.04909
G1 X102.823 Y73.302
G1 X101.658 Y72.137 E.04909
G1 X101.658 Y72.67
G1 X102.823 Y73.835 E.04909
G1 X102.823 Y74.368
G1 X101.658 Y73.203 E.04909
G1 X101.658 Y73.736
G1 X102.823 Y74.902 E.04909
G1 X102.823 Y75.435
G1 X101.658 Y74.27 E.04909
G1 X101.658 Y74.803
G1 X102.823 Y75.968 E.04909
G1 X102.823 Y76.501
G1 X101.658 Y75.336 E.04909
G1 X101.658 Y75.869
G1 X102.823 Y77.035 E.04909
G1 X102.823 Y77.568
G1 X101.658 Y76.403 E.04909
G1 X101.658 Y76.936
G1 X102.823 Y78.101 E.04909
G1 X102.823 Y78.634
G1 X101.658 Y77.469 E.04909
G1 X101.658 Y78.002
G1 X102.823 Y79.168 E.04909
G1 X102.823 Y79.701
G1 X101.658 Y78.536 E.04909
G1 X101.658 Y79.069
G1 X102.823 Y80.234 E.04909
G1 X102.823 Y80.767
G1 X101.658 Y79.602 E.04909
G1 X101.658 Y80.135
G1 X102.823 Y81.301 E.04909
G1 X102.823 Y81.834
G1 X101.658 Y80.669 E.04909
G1 X101.658 Y81.202
G1 X102.823 Y82.367 E.04909
G1 X102.823 Y82.9
G1 X101.658 Y81.735 E.04909
G1 X101.658 Y82.268
G1 X102.823 Y83.434 E.04909
G1 X102.823 Y83.967
G1 X101.658 Y82.802 E.04909
G1 X101.658 Y83.335
G1 X102.823 Y84.5 E.04909
G1 X102.823 Y85.033
G1 X101.658 Y83.868 E.04909
G1 X101.658 Y84.401
G1 X102.823 Y85.567 E.04909
G1 X102.823 Y86.1
G1 X101.658 Y84.935 E.04909
G1 X101.658 Y85.468
G1 X102.823 Y86.633 E.04909
G1 X102.823 Y87.166
G1 X101.658 Y86.001 E.04909
G1 X101.658 Y86.534
G1 X102.823 Y87.7 E.04909
G1 X102.823 Y88.233
G1 X101.658 Y87.068 E.04909
G1 X101.658 Y87.601
G1 X102.823 Y88.766 E.04909
G1 X102.823 Y89.299
G1 X101.658 Y88.134 E.04909
G1 X101.658 Y88.668
G1 X102.823 Y89.833 E.04909
G1 X102.823 Y90.366
G1 X101.658 Y89.201 E.04909
G1 X101.658 Y89.734
G1 X102.823 Y90.899 E.04909
G1 X102.823 Y91.433
G1 X101.658 Y90.267 E.04909
G1 X101.658 Y90.801
G1 X102.823 Y91.966 E.04909
G1 X102.823 Y92.499
G1 X101.658 Y91.334 E.04909
G1 X101.658 Y91.867
G1 X102.823 Y93.032 E.04909
G1 X102.823 Y93.566
G1 X101.658 Y92.4 E.04909
M73 P98 R0
G1 X101.658 Y92.934
G1 X102.823 Y94.099 E.04909
G1 X102.823 Y94.632
G1 X101.658 Y93.467 E.04909
G1 X101.658 Y94
G1 X102.823 Y95.165 E.04909
G1 X102.823 Y95.699
G1 X101.658 Y94.533 E.04909
G1 X101.658 Y95.067
G1 X102.823 Y96.232 E.04909
G1 X102.823 Y96.765
G1 X101.658 Y95.6 E.04909
G1 X101.658 Y96.133
G1 X102.823 Y97.298 E.04909
G1 X102.823 Y97.832
G1 X101.658 Y96.666 E.04909
G1 X101.658 Y97.2
G1 X102.823 Y98.365 E.04909
G1 X102.823 Y98.898
G1 X101.658 Y97.733 E.04909
G1 X101.658 Y98.266
G1 X102.823 Y99.431 E.04909
G1 X102.823 Y99.965
G1 X101.658 Y98.799 E.04909
G1 X101.658 Y99.333
G1 X103.832 Y101.508 E.09162
G1 X103.299 Y101.508
G1 X101.658 Y99.866 E.06915
G1 X101.658 Y100.399
G1 X102.766 Y101.508 E.04669
G1 X102.233 Y101.508
G1 X101.658 Y100.932 E.02423
; WIPE_START
M204 S5000
G1 X102.233 Y101.508 E-.30905
G1 X102.766 Y101.508 E-.20264
G1 X102.304 Y101.045 E-.24831
; WIPE_END
G1 E-.04 F1800
G1 X102.251 Y93.413 Z1.4 F15000
G1 X101.923 Y46.412 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145685
G1 F7500
G2 X101.639 Y46.372 I-.191 J.323 E.00239
; WIPE_START
G1 X101.825 Y46.372 E-.48617
G1 X101.923 Y46.412 E-.27383
; WIPE_END
G1 E-.04 F1800
G1 X108.327 Y50.565 Z1.4 F15000
G1 X186.842 Y101.478 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.145578
G1 F7500
G3 X186.558 Y101.437 I-.093 J-.363 E.00239
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F7500
G1 X186.655 Y101.478 E-.27421
G1 X186.842 Y101.478 E-.48579
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.217 J0 P1  F15000
; stop printing object, unique label id: 120
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

