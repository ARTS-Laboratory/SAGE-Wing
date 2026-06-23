; HEADER_BLOCK_START
; BambuStudio 02.06.00.51
; model printing time: 12m 51s; total estimated time: 19m 11s
; total layer number: 25
; total filament length [mm] : 1482.01
; total filament volume [cm^3] : 3564.65
; total filament weight [g] : 4.56
; model label id: 81,121
; object max height: 5.00,5.00
; filament_density: 1.28
; filament_diameter: 1.75
; max_z_height: 5.00
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
M73 P0 R19
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
M73 P2 R18
G1 E50 F200
M400
M104 S250
G92 E0
M73 P25 R14
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S230 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P26 R14
G1 E-0.5 F300

M73 P28 R13
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
M73 P29 R13
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
    G29 A X85.4993 Y57.76 I90.0443 J146.027
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
; layer num/total_layer_count: 1/25
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S3000
G1 Z.4 F15000
; object ids of layer 1 start: 81,121
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
; object ids of this layer1 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X87.1 Y142.646
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
M73 P30 R13
G1 X87.591 Y142.446 E.01917
G1 X88.359 Y142.33 E.02802
G1 X172.331 Y142.33 E3.0319
G1 X172.819 Y142.377 E.0177
G1 X173.281 Y142.513 E.01739
G1 X173.638 Y142.689 E.01439
G1 X174.038 Y142.963 E.0175
G1 X174.375 Y143.304 E.0173
G1 X174.64 Y143.702 E.01726
G1 X174.84 Y144.194 E.01917
G1 X174.956 Y144.961 E.02802
G1 X174.956 Y198.933 E1.94871
G1 X174.909 Y199.421 E.0177
G1 X174.772 Y199.885 E.01745
G1 X174.642 Y200.159 E.01096
M73 P31 R13
G1 X174.321 Y200.642 E.02093
G1 X173.982 Y200.978 E.01724
G1 X173.584 Y201.243 E.01726
G1 X173.092 Y201.443 E.01917
G1 X172.325 Y201.558 E.02802
G1 X88.353 Y201.558 E3.03189
G1 X87.865 Y201.511 E.0177
G1 X87.401 Y201.375 E.01745
G1 X87.127 Y201.245 E.01096
G1 X86.644 Y200.924 E.02093
G1 X86.309 Y200.584 E.01724
G1 X86.043 Y200.186 E.01726
G1 X85.843 Y199.695 E.01917
G1 X85.728 Y198.927 E.02802
G1 X85.728 Y144.955 E1.94872
G1 X85.775 Y144.467 E.0177
G1 X85.911 Y144.004 E.01745
G1 X86.041 Y143.73 E.01096
G1 X86.362 Y143.247 E.02093
G1 X86.702 Y142.911 E.01724
G1 X87.05 Y142.679 E.0151
M204 S3000
M73 P32 R13
G1 X87.302 Y143.064 F15000
G1 F1500
M204 S250
G1 X87.328 Y143.047 E.00111
M73 P32 R12
G1 X87.698 Y142.896 E.01444
G1 X88.403 Y142.788 E.02576
G1 X172.316 Y142.788 E3.02974
G1 X172.744 Y142.832 E.01556
G1 X173.125 Y142.946 E.01434
G1 X173.415 Y143.09 E.01172
G1 X173.733 Y143.308 E.01391
G1 X174.01 Y143.585 E.01413
M73 P33 R12
G1 X174.226 Y143.906 E.01398
G1 X174.39 Y144.301 E.01544
G1 X174.499 Y145.006 E.02576
G1 X174.499 Y198.905 E1.94608
G1 X174.459 Y199.321 E.01509
G1 X174.339 Y199.731 E.01542
G1 X174.238 Y199.942 E.00844
G1 X173.975 Y200.338 E.01718
G1 X173.681 Y200.629 E.01492
G1 X173.356 Y200.842 E.01403
G1 X172.985 Y200.993 E.01444
G1 X172.28 Y201.101 E.02576
G1 X88.381 Y201.101 E3.02926
G1 X87.965 Y201.062 E.01509
G1 X87.555 Y200.942 E.01542
G1 X87.344 Y200.84 E.00844
G1 X86.948 Y200.577 E.01718
G1 X86.657 Y200.283 E.01492
G1 X86.444 Y199.958 E.01403
G1 X86.293 Y199.588 E.01444
G1 X86.185 Y198.883 E.02576
G1 X86.185 Y144.984 E1.94609
G1 X86.224 Y144.568 E.01509
G1 X86.344 Y144.158 E.01542
G1 X86.446 Y143.947 E.00844
G1 X86.709 Y143.551 E.01718
G1 X87.003 Y143.26 E.01492
G1 X87.252 Y143.096 E.01076
M204 S3000
G1 X87.5 Y143.482 F15000
G1 F1500
M204 S250
G1 X87.553 Y143.448 E.00228
G1 X87.806 Y143.346 E.00983
G1 X88.449 Y143.245 E.0235
M73 P34 R12
G1 X172.285 Y143.245 E3.02701
G1 X172.642 Y143.281 E.01292
G1 X172.966 Y143.378 E.01224
G1 X173.191 Y143.491 E.00908
G1 X173.429 Y143.654 E.01042
G1 X173.646 Y143.868 E.011
G1 X173.814 Y144.112 E.0107
G1 X173.94 Y144.41 E.01167
G1 X174.041 Y145.051 E.02346
G1 X174.041 Y198.877 E1.94343
G1 X174.005 Y199.247 E.01344
G1 X173.906 Y199.577 E.01241
G1 X173.834 Y199.723 E.00588
G1 X173.628 Y200.034 E.01351
G1 X173.38 Y200.279 E.01256
G1 X173.13 Y200.44 E.01075
G1 X172.878 Y200.543 E.00983
G1 X172.235 Y200.644 E.0235
G1 X88.409 Y200.644 E3.02661
G1 X88.039 Y200.607 E.01344
G1 X87.709 Y200.509 E.01241
G1 X87.563 Y200.437 E.00588
G1 X87.252 Y200.23 E.01351
G1 X87.007 Y199.983 E.01256
G1 X86.846 Y199.733 E.01075
G1 X86.743 Y199.48 E.00983
G1 X86.642 Y198.837 E.0235
G1 X86.642 Y145.012 E1.94343
G1 X86.679 Y144.641 E.01343
G1 X86.777 Y144.312 E.01241
G1 X86.849 Y144.166 E.00588
G1 X87.056 Y143.854 E.01351
G1 X87.303 Y143.609 E.01256
G1 X87.45 Y143.515 E.0063
M204 S3000
G1 X87.717 Y143.893 F15000
G1 F1500
M204 S250
G1 X87.745 Y143.874 E.00121
G1 X87.942 Y143.781 E.00786
G1 X88.083 Y143.738 E.00535
M73 P35 R12
G1 X88.361 Y143.702 E.01012
G1 X172.319 Y143.702 E3.03137
G1 X172.635 Y143.75 E.01156
G1 X172.753 Y143.787 E.00446
G1 X173.055 Y143.947 E.01232
G1 X173.264 Y144.138 E.01024
G1 X173.412 Y144.347 E.00926
G1 X173.505 Y144.544 E.00785
G1 X173.548 Y144.686 E.00535
G1 X173.584 Y144.964 E.01012
G1 X173.584 Y198.921 E1.94819
G1 X173.536 Y199.238 E.01156
G1 X173.499 Y199.356 E.00446
G1 X173.339 Y199.657 E.01232
G1 X173.148 Y199.867 E.01024
G1 X172.939 Y200.015 E.00926
G1 X172.742 Y200.107 E.00785
G1 X172.6 Y200.151 E.00535
G1 X172.322 Y200.187 E.01012
G1 X88.365 Y200.187 E3.03137
G1 X88.048 Y200.138 E.01156
G1 X87.93 Y200.101 E.00446
G1 X87.629 Y199.941 E.01232
G1 X87.419 Y199.751 E.01023
G1 X87.271 Y199.541 E.00926
G1 X87.179 Y199.344 E.00786
G1 X87.135 Y199.203 E.00535
G1 X87.099 Y198.925 E.01012
G1 X87.099 Y144.967 E1.94819
G1 X87.148 Y144.649 E.01161
G1 X87.22 Y144.442 E.00794
G1 X87.286 Y144.324 E.00489
G1 X87.538 Y144.02 E.01425
G1 X87.668 Y143.928 E.00576
M204 S3000
G1 X87.928 Y144.293 F15000
G1 F1500
M204 S250
G1 X88.145 Y144.191 E.00865
G1 X88.352 Y144.159 E.00758
G1 X172.329 Y144.159 E3.03207
M73 P36 R12
G1 X172.559 Y144.201 E.00845
G1 X172.751 Y144.288 E.00759
G1 X172.903 Y144.417 E.0072
G1 X172.994 Y144.531 E.00525
G1 X173.095 Y144.747 E.00865
G1 X173.127 Y144.955 E.00758
G1 X173.127 Y198.932 E1.94889
G1 X173.085 Y199.162 E.00845
G1 X172.998 Y199.353 E.00759
G1 X172.869 Y199.506 E.0072
G1 X172.755 Y199.596 E.00525
G1 X172.539 Y199.698 E.00865
G1 X172.331 Y199.73 E.00758
G1 X88.354 Y199.73 E3.03207
G1 X88.124 Y199.688 E.00845
G1 X87.933 Y199.6 E.00759
G1 X87.78 Y199.472 E.0072
G1 X87.69 Y199.358 E.00525
G1 X87.588 Y199.141 E.00865
G1 X87.556 Y198.934 E.00758
G1 X87.556 Y144.957 E1.94889
G1 X87.599 Y144.723 E.00857
G1 X87.646 Y144.605 E.0046
G1 X87.814 Y144.383 E.01005
G1 X87.881 Y144.33 E.00308
M204 S3000
G1 X88.166 Y144.687 F15000
G1 F1500
M204 S250
G1 X88.225 Y144.64 E.00275
G1 X88.342 Y144.616 E.00429
G1 X172.342 Y144.616 E3.0329
G1 X172.452 Y144.644 E.00413
G1 X172.537 Y144.691 E.0035
G1 X172.646 Y144.828 E.00632
G1 X172.67 Y144.944 E.00429
G1 X172.67 Y198.944 E1.94972
G1 X172.642 Y199.055 E.00413
G1 X172.595 Y199.14 E.0035
G1 X172.458 Y199.249 E.00632
G1 X172.342 Y199.273 E.00429
G1 X88.342 Y199.273 E3.0329
M73 P37 R12
G1 X88.231 Y199.244 E.00413
G1 X88.146 Y199.197 E.0035
G1 X88.037 Y199.061 E.00632
G1 X88.013 Y198.944 E.00429
G1 X88.013 Y144.944 E1.94972
G1 X88.042 Y144.834 E.00413
G1 X88.089 Y144.749 E.0035
G1 X88.119 Y144.725 E.0014
; WIPE_START
G1 X88.225 Y144.64 E-.05173
G1 X88.342 Y144.616 E-.04514
G1 X90.087 Y144.616 E-.66313
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X96.46 Y148.815 Z.6 F15000
G1 X171.942 Y198.544 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
M73 P37 R11
G1 X88.742 Y198.544 E3.00402
G1 X88.742 Y145.344 E1.92084
G1 X171.942 Y145.344 E3.00402
G1 X171.942 Y198.484 E1.91867
M204 S3000
G1 X171.485 Y198.087 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X89.199 Y198.087 E2.97101
G1 X89.199 Y145.801 E1.88783
G1 X171.485 Y145.801 E2.97101
G1 X171.485 Y198.027 E1.88567
; WIPE_START
G1 X169.485 Y198.029 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X163.077 Y193.882 Z.6 F15000
G1 X89.942 Y146.544 Z.6
M73 P38 R11
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X170.742 Y146.544 E2.91737
G1 X170.742 Y197.344 E1.83419
G1 X89.942 Y197.344 E2.91737
G1 X89.942 Y146.604 E1.83202
M204 S3000
G1 X89.485 Y146.544 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X89.485 Y146.087 E.0165
G1 X171.199 Y146.087 E2.95037
G1 X171.199 Y197.801 E1.86719
G1 X89.485 Y197.801 E2.95037
G1 X89.485 Y146.604 E1.84852
; OBJECT_ID: 121
; WIPE_START
G1 X89.485 Y146.087 E-.19649
G1 X90.968 Y146.087 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
M204 S3000
G1 X90.601 Y138.464 Z.6 F15000
G1 X89.485 Y115.216 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F1500
M204 S250
G1 X88.712 Y115.216 E.02789
G1 X88.224 Y115.17 E.0177
M73 P39 R11
G1 X87.761 Y115.033 E.01745
G1 X87.486 Y114.903 E.01096
G1 X87.003 Y114.582 E.02093
G1 X86.668 Y114.242 E.01724
G1 X86.403 Y113.844 E.01726
G1 X86.203 Y113.353 E.01917
G1 X86.087 Y112.585 E.02802
G1 X86.087 Y58.613 E1.94872
G1 X86.134 Y58.125 E.0177
G1 X86.271 Y57.662 E.01745
G1 X86.401 Y57.388 E.01096
G1 X86.721 Y56.905 E.02093
G1 X87.061 Y56.569 E.01724
G1 X87.459 Y56.304 E.01726
G1 X87.951 Y56.104 E.01917
G1 X88.718 Y55.988 E.02802
M73 P40 R11
G1 X172.69 Y55.988 E3.0319
G1 X173.178 Y56.035 E.0177
G1 X173.64 Y56.171 E.01739
G1 X173.998 Y56.347 E.01439
G1 X174.398 Y56.621 E.0175
G1 X174.734 Y56.963 E.0173
G1 X175 Y57.36 E.01726
G1 X175.2 Y57.852 E.01917
G1 X175.315 Y58.62 E.02802
M73 P41 R11
G1 X175.315 Y112.591 E1.94871
G1 X175.268 Y113.079 E.0177
G1 X175.132 Y113.543 E.01745
G1 X175.001 Y113.817 E.01096
G1 X174.681 Y114.3 E.02093
G1 X174.341 Y114.636 E.01724
G1 X173.943 Y114.901 E.01726
G1 X173.451 Y115.101 E.01917
G1 X172.684 Y115.216 E.02802
G1 X89.545 Y115.216 E3.00183
M204 S3000
G1 X89.545 Y114.759 F15000
G1 F1500
M204 S250
M73 P42 R11
G1 X88.74 Y114.759 E.02904
G1 X88.324 Y114.72 E.01509
M73 P42 R10
G1 X87.914 Y114.6 E.01542
G1 X87.704 Y114.498 E.00844
G1 X87.307 Y114.235 E.01718
G1 X87.017 Y113.941 E.01492
G1 X86.803 Y113.617 E.01403
G1 X86.653 Y113.246 E.01444
G1 X86.544 Y112.541 E.02576
G1 X86.544 Y58.642 E1.94609
G1 X86.584 Y58.226 E.01509
G1 X86.703 Y57.816 E.01542
G1 X86.805 Y57.605 E.00844
G1 X87.068 Y57.209 E.01718
G1 X87.362 Y56.918 E.01492
G1 X87.687 Y56.705 E.01403
G1 X88.058 Y56.554 E.01444
G1 X88.763 Y56.446 E.02576
G1 X172.675 Y56.446 E3.02974
G1 X173.104 Y56.49 E.01556
G1 X173.484 Y56.604 E.01434
M73 P43 R10
G1 X173.775 Y56.749 E.01172
G1 X174.092 Y56.966 E.01391
G1 X174.369 Y57.243 E.01413
G1 X174.586 Y57.564 E.01398
G1 X174.749 Y57.959 E.01544
G1 X174.858 Y58.664 E.02576
G1 X174.858 Y112.563 E1.94608
G1 X174.819 Y112.979 E.01509
G1 X174.699 Y113.389 E.01542
G1 X174.597 Y113.6 E.00844
G1 X174.334 Y113.996 E.01718
G1 X174.04 Y114.287 E.01492
G1 X173.715 Y114.5 E.01403
G1 X173.345 Y114.651 E.01444
G1 X172.64 Y114.759 E.02576
G1 X89.605 Y114.759 E2.99806
M204 S3000
G1 X89.605 Y114.302 F15000
G1 F1500
M204 S250
G1 X88.768 Y114.302 E.03019
G1 X88.398 Y114.265 E.01344
G1 X88.069 Y114.167 E.01241
G1 X87.923 Y114.095 E.00588
G1 X87.611 Y113.888 E.01351
G1 X87.366 Y113.641 E.01256
G1 X87.205 Y113.391 E.01075
G1 X87.102 Y113.138 E.00983
G1 X87.001 Y112.495 E.0235
G1 X87.001 Y58.67 E1.94343
G1 X87.038 Y58.299 E.01343
G1 X87.136 Y57.97 E.01241
G1 X87.208 Y57.824 E.00588
G1 X87.415 Y57.512 E.01351
G1 X87.663 Y57.267 E.01256
G1 X87.913 Y57.106 E.01075
G1 X88.165 Y57.004 E.00983
G1 X88.808 Y56.903 E.0235
G1 X172.645 Y56.903 E3.02701
G1 X173.001 Y56.939 E.01292
G1 X173.326 Y57.036 E.01224
M73 P44 R10
G1 X173.55 Y57.149 E.00908
G1 X173.789 Y57.312 E.01042
G1 X174.006 Y57.526 E.011
G1 X174.174 Y57.77 E.0107
G1 X174.3 Y58.068 E.01167
G1 X174.401 Y58.709 E.02346
G1 X174.401 Y112.535 E1.94343
G1 X174.364 Y112.905 E.01344
G1 X174.266 Y113.235 E.01241
G1 X174.194 Y113.381 E.00588
G1 X173.987 Y113.693 E.01351
G1 X173.74 Y113.937 E.01256
G1 X173.489 Y114.098 E.01075
G1 X173.237 Y114.201 E.00983
G1 X172.594 Y114.302 E.0235
G1 X89.665 Y114.302 E2.99425
M204 S3000
G1 X89.665 Y113.845 F15000
G1 F1500
M204 S250
G1 X88.724 Y113.845 E.03396
G1 X88.408 Y113.796 E.01156
G1 X88.29 Y113.759 E.00446
G1 X87.988 Y113.599 E.01232
G1 X87.778 Y113.409 E.01023
G1 X87.63 Y113.199 E.00926
G1 X87.538 Y113.002 E.00786
G1 X87.495 Y112.861 E.00535
G1 X87.458 Y112.583 E.01012
G1 X87.458 Y58.625 E1.94819
G1 X87.507 Y58.307 E.01161
G1 X87.579 Y58.1 E.00794
G1 X87.646 Y57.982 E.00489
G1 X87.897 Y57.678 E.01425
G1 X88.104 Y57.532 E.00914
G1 X88.301 Y57.439 E.00786
G1 X88.443 Y57.396 E.00535
M73 P45 R10
G1 X88.721 Y57.36 E.01012
G1 X172.678 Y57.36 E3.03137
G1 X172.995 Y57.408 E.01156
G1 X173.113 Y57.445 E.00446
G1 X173.414 Y57.605 E.01232
G1 X173.624 Y57.796 E.01024
G1 X173.772 Y58.005 E.00926
G1 X173.864 Y58.202 E.00785
G1 X173.907 Y58.344 E.00535
G1 X173.944 Y58.622 E.01012
G1 X173.944 Y112.579 E1.94819
G1 X173.895 Y112.896 E.01156
G1 X173.858 Y113.014 E.00446
G1 X173.698 Y113.315 E.01232
G1 X173.507 Y113.525 E.01024
G1 X173.298 Y113.673 E.00926
G1 X173.101 Y113.766 E.00785
G1 X172.96 Y113.809 E.00535
G1 X172.682 Y113.845 E.01012
G1 X89.725 Y113.845 E2.99525
M204 S3000
G1 X89.725 Y113.388 F15000
G1 F1500
M204 S250
G1 X88.714 Y113.388 E.03651
G1 X88.483 Y113.346 E.00845
G1 X88.292 Y113.259 E.00759
G1 X88.14 Y113.13 E.0072
G1 X88.049 Y113.016 E.00525
G1 X87.948 Y112.799 E.00865
G1 X87.916 Y112.592 E.00758
G1 X87.916 Y58.615 E1.94889
G1 X87.958 Y58.381 E.00857
G1 X88.005 Y58.263 E.0046
G1 X88.174 Y58.041 E.01005
G1 X88.287 Y57.951 E.00525
M73 P46 R10
G1 X88.504 Y57.849 E.00865
G1 X88.712 Y57.817 E.00758
G1 X172.689 Y57.817 E3.03207
G1 X172.919 Y57.859 E.00845
G1 X173.11 Y57.946 E.00759
G1 X173.262 Y58.075 E.0072
G1 X173.353 Y58.189 E.00525
G1 X173.455 Y58.405 E.00865
G1 X173.487 Y58.613 E.00758
G1 X173.487 Y112.59 E1.94889
G1 X173.445 Y112.82 E.00845
G1 X173.357 Y113.011 E.00759
G1 X173.229 Y113.164 E.0072
G1 X173.115 Y113.254 E.00525
G1 X172.898 Y113.356 E.00865
G1 X172.691 Y113.388 E.00758
G1 X89.785 Y113.388 E2.9934
M204 S3000
G1 X89.785 Y112.931 F15000
G1 F1500
M204 S250
G1 X88.701 Y112.931 E.03912
G1 X88.591 Y112.902 E.00413
G1 X88.506 Y112.855 E.0035
G1 X88.397 Y112.719 E.00632
G1 X88.373 Y112.602 E.00429
G1 X88.373 Y58.602 E1.94972
G1 X88.401 Y58.492 E.00413
G1 X88.448 Y58.407 E.0035
G1 X88.585 Y58.298 E.00632
G1 X88.701 Y58.274 E.00429
G1 X172.701 Y58.274 E3.0329
G1 X172.812 Y58.302 E.00413
G1 X172.896 Y58.349 E.0035
G1 X173.005 Y58.486 E.00632
G1 X173.03 Y58.602 E.00429
G1 X173.03 Y112.602 E1.94972
G1 X173.001 Y112.713 E.00413
G1 X172.954 Y112.798 E.0035
G1 X172.817 Y112.907 E.00632
G1 X172.701 Y112.931 E.00429
M73 P47 R10
G1 X89.845 Y112.931 E2.99162
; WIPE_START
G1 X88.701 Y112.931 E-.43453
G1 X88.591 Y112.902 E-.04342
G1 X88.506 Y112.855 E-.03679
G1 X88.397 Y112.719 E-.06647
G1 X88.373 Y112.602 E-.04514
G1 X88.373 Y112.251 E-.13365
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X96.005 Y112.246 Z.6 F15000
G1 X172.301 Y112.202 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X89.101 Y112.202 E3.00402
G1 X89.101 Y59.002 E1.92084
G1 X172.301 Y59.002 E3.00402
G1 X172.301 Y112.142 E1.91867
M204 S3000
G1 X171.844 Y111.745 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X89.558 Y111.745 E2.97101
G1 X89.558 Y59.459 E1.88783
G1 X171.844 Y59.459 E2.97101
G1 X171.844 Y111.685 E1.88567
; WIPE_START
G1 X169.844 Y111.687 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X163.437 Y107.54 Z.6 F15000
G1 X90.301 Y60.202 Z.6
G1 Z.2
M73 P47 R9
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X171.101 Y60.202 E2.91737
G1 X171.101 Y111.002 E1.83419
G1 X90.301 Y111.002 E2.91737
G1 X90.301 Y60.262 E1.83202
M204 S3000
G1 X89.844 Y60.202 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
M73 P48 R9
G1 X89.844 Y59.745 E.0165
G1 X171.558 Y59.745 E2.95037
G1 X171.558 Y111.459 E1.86719
G1 X89.844 Y111.459 E2.95037
G1 X89.844 Y60.262 E1.84852
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1500
G1 X89.844 Y59.745 E-.19649
G1 X91.327 Y59.745 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 2/25
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M104 S245 ; set nozzle temperature
M204 S5000
G17
G3 Z.6 I1.217 J0 P1  F15000
; object ids of layer 2 start: 81,121
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
; object ids of this layer2 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X90.132 Y146.342
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.45
G1 F9000
G1 X170.944 Y146.342 E2.59862
G1 X170.944 Y197.546 E1.64654
G1 X89.74 Y197.546 E2.61123
G1 X89.74 Y146.342 E1.64654
G1 X90.072 Y146.342 E.01068
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.552 Y146.734 E2.39544
G1 X170.552 Y197.154 E1.50184
G1 X90.132 Y197.154 E2.39544
M73 P49 R9
G1 X90.132 Y146.794 E1.50005
; WIPE_START
M204 S5000
G1 X92.132 Y146.793 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.538 Y150.941 Z.8 F15000
G1 X171.74 Y198.342 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X88.944 Y198.342 E2.66241
G1 X88.944 Y145.546 E1.69772
M73 P50 R9
G1 X171.74 Y145.546 E2.66241
G1 X171.74 Y198.282 E1.69579
M204 S250
G1 X172.132 Y198.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X88.552 Y198.734 E2.48956
G1 X88.552 Y145.154 E1.59597
G1 X172.132 Y145.154 E2.48956
G1 X172.132 Y198.674 E1.59418
; WIPE_START
M204 S5000
G1 X170.132 Y198.676 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.308 Y197.911 Z.8 F15000
M73 P51 R9
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X171.228 Y197.928 E.00278
; LINE_WIDTH: 0.448395
G1 X171.147 Y197.944 E.00263
; LINE_WIDTH: 0.43172
G1 X89.536 Y197.944 E2.50648
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00556
M73 P52 R9
G1 X89.358 Y197.83 E.00278
; LINE_WIDTH: 0.448395
G1 X89.342 Y197.75 E.00263
; LINE_WIDTH: 0.431747
G1 X89.342 Y146.139 E1.58521
G1 X89.358 Y146.058 E.00253
; LINE_WIDTH: 0.481759
G1 X89.375 Y145.978 E.00285
; LINE_WIDTH: 0.481745
G1 X89.456 Y145.961 E.00285
; LINE_WIDTH: 0.448395
G1 X89.536 Y145.944 E.00263
; LINE_WIDTH: 0.43172
G1 X171.147 Y145.944 E2.50648
; LINE_WIDTH: 0.470635
G1 X171.308 Y145.978 E.00556
G1 X171.325 Y146.058 E.00278
; LINE_WIDTH: 0.448395
G1 X171.342 Y146.139 E.00263
; LINE_WIDTH: 0.43172
G1 X171.342 Y197.75 E1.5851
; LINE_WIDTH: 0.470635
G1 X171.321 Y197.852 E.00353
; OBJECT_ID: 121
; WIPE_START
G1 X171.228 Y197.928 E-.04541
M73 P53 R9
G1 X171.147 Y197.944 E-.03125
G1 X169.349 Y197.944 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X165.561 Y191.318 Z.8 F15000
G1 X90.491 Y60 Z.8
G1 Z.4
M73 P53 R8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X171.303 Y60 E2.59862
G1 X171.303 Y111.204 E1.64654
G1 X90.099 Y111.204 E2.61123
G1 X90.099 Y60 E1.64654
G1 X90.431 Y60 E.01068
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.911 Y60.392 E2.39544
G1 X170.911 Y110.812 E1.50184
G1 X90.491 Y110.812 E2.39544
G1 X90.491 Y60.452 E1.50005
; WIPE_START
M204 S5000
G1 X92.491 Y60.451 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.898 Y64.599 Z.8 F15000
G1 X172.099 Y112 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.303 Y112 E2.66241
G1 X89.303 Y59.204 E1.69772
G1 X172.099 Y59.204 E2.66241
G1 X172.099 Y111.94 E1.69579
M204 S250
G1 X172.491 Y112.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X88.911 Y112.392 E2.48956
G1 X88.911 Y58.812 E1.59597
G1 X172.491 Y58.812 E2.48956
G1 X172.491 Y112.332 E1.59418
; WIPE_START
M204 S5000
G1 X170.491 Y112.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.668 Y111.569 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X171.587 Y111.586 E.00278
; LINE_WIDTH: 0.448395
G1 X171.507 Y111.602 E.00263
; LINE_WIDTH: 0.43172
G1 X89.896 Y111.602 E2.50648
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00556
G1 X89.718 Y111.489 E.00278
; LINE_WIDTH: 0.448395
G1 X89.701 Y111.408 E.00263
; LINE_WIDTH: 0.431747
G1 X89.701 Y59.797 E1.58521
G1 X89.718 Y59.716 E.00253
; LINE_WIDTH: 0.481759
G1 X89.734 Y59.636 E.00285
; LINE_WIDTH: 0.481745
G1 X89.815 Y59.619 E.00285
; LINE_WIDTH: 0.448395
M73 P54 R8
G1 X89.896 Y59.602 E.00263
; LINE_WIDTH: 0.43172
G1 X171.507 Y59.602 E2.50648
; LINE_WIDTH: 0.470635
G1 X171.668 Y59.636 E.00556
G1 X171.684 Y59.716 E.00278
; LINE_WIDTH: 0.448395
G1 X171.701 Y59.797 E.00263
; LINE_WIDTH: 0.43172
G1 X171.701 Y111.408 E1.5851
; LINE_WIDTH: 0.470635
G1 X171.68 Y111.51 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X171.587 Y111.586 E-.04541
G1 X171.507 Y111.602 E-.03125
G1 X169.708 Y111.602 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 3/25
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F15000
; object ids of layer 3 start: 81,121
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
; object ids of this layer3 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X90.132 Y146.342
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X170.944 Y146.342 E2.59862
G1 X170.944 Y197.546 E1.64654
G1 X89.74 Y197.546 E2.61123
G1 X89.74 Y146.342 E1.64654
G1 X90.072 Y146.342 E.01068
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.552 Y146.734 E2.39544
G1 X170.552 Y197.154 E1.50184
G1 X90.132 Y197.154 E2.39544
G1 X90.132 Y146.794 E1.50005
; WIPE_START
M204 S5000
G1 X92.132 Y146.793 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.538 Y150.941 Z1 F15000
G1 X171.74 Y198.342 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X88.944 Y198.342 E2.66241
G1 X88.944 Y145.546 E1.69772
G1 X171.74 Y145.546 E2.66241
G1 X171.74 Y198.282 E1.69579
M204 S250
G1 X172.132 Y198.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X88.552 Y198.734 E2.48956
G1 X88.552 Y145.154 E1.59597
M73 P55 R8
G1 X172.132 Y145.154 E2.48956
G1 X172.132 Y198.674 E1.59418
; WIPE_START
M204 S5000
G1 X170.132 Y198.676 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.308 Y197.911 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X171.228 Y197.928 E.00278
; LINE_WIDTH: 0.448395
G1 X171.147 Y197.944 E.00263
; LINE_WIDTH: 0.43172
G1 X89.536 Y197.944 E2.50648
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00556
G1 X89.358 Y197.83 E.00278
; LINE_WIDTH: 0.448395
G1 X89.342 Y197.75 E.00263
; LINE_WIDTH: 0.431747
G1 X89.342 Y146.139 E1.58521
G1 X89.358 Y146.058 E.00253
; LINE_WIDTH: 0.481759
G1 X89.375 Y145.978 E.00285
; LINE_WIDTH: 0.481745
G1 X89.456 Y145.961 E.00285
; LINE_WIDTH: 0.448395
G1 X89.536 Y145.944 E.00263
; LINE_WIDTH: 0.43172
G1 X171.147 Y145.944 E2.50648
; LINE_WIDTH: 0.470635
G1 X171.308 Y145.978 E.00556
G1 X171.325 Y146.058 E.00278
; LINE_WIDTH: 0.448395
G1 X171.342 Y146.139 E.00263
; LINE_WIDTH: 0.43172
G1 X171.342 Y197.75 E1.5851
; LINE_WIDTH: 0.470635
G1 X171.321 Y197.852 E.00353
; OBJECT_ID: 121
; WIPE_START
G1 X171.228 Y197.928 E-.04541
G1 X171.147 Y197.944 E-.03125
G1 X169.349 Y197.944 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X165.561 Y191.318 Z1 F15000
G1 X90.491 Y60 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X171.303 Y60 E2.59862
G1 X171.303 Y111.204 E1.64654
G1 X90.099 Y111.204 E2.61123
G1 X90.099 Y60 E1.64654
G1 X90.431 Y60 E.01068
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.911 Y60.392 E2.39544
G1 X170.911 Y110.812 E1.50184
G1 X90.491 Y110.812 E2.39544
G1 X90.491 Y60.452 E1.50005
; WIPE_START
M204 S5000
G1 X92.491 Y60.451 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.898 Y64.599 Z1 F15000
G1 X172.099 Y112 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P56 R8
G1 F9000
G1 X89.303 Y112 E2.66241
G1 X89.303 Y59.204 E1.69772
G1 X172.099 Y59.204 E2.66241
G1 X172.099 Y111.94 E1.69579
M204 S250
G1 X172.491 Y112.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X88.911 Y112.392 E2.48956
G1 X88.911 Y58.812 E1.59597
G1 X172.491 Y58.812 E2.48956
G1 X172.491 Y112.332 E1.59418
; WIPE_START
M204 S5000
G1 X170.491 Y112.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.668 Y111.569 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X171.587 Y111.586 E.00278
; LINE_WIDTH: 0.448395
G1 X171.507 Y111.602 E.00263
; LINE_WIDTH: 0.43172
G1 X89.896 Y111.602 E2.50648
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00556
G1 X89.718 Y111.489 E.00278
; LINE_WIDTH: 0.448395
G1 X89.701 Y111.408 E.00263
; LINE_WIDTH: 0.431747
G1 X89.701 Y59.797 E1.58521
G1 X89.718 Y59.716 E.00253
; LINE_WIDTH: 0.481759
G1 X89.734 Y59.636 E.00285
; LINE_WIDTH: 0.481745
G1 X89.815 Y59.619 E.00285
; LINE_WIDTH: 0.448395
G1 X89.896 Y59.602 E.00263
; LINE_WIDTH: 0.43172
G1 X171.507 Y59.602 E2.50648
; LINE_WIDTH: 0.470635
G1 X171.668 Y59.636 E.00556
G1 X171.684 Y59.716 E.00278
; LINE_WIDTH: 0.448395
G1 X171.701 Y59.797 E.00263
; LINE_WIDTH: 0.43172
G1 X171.701 Y111.408 E1.5851
; LINE_WIDTH: 0.470635
G1 X171.68 Y111.51 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X171.587 Y111.586 E-.04541
G1 X171.507 Y111.602 E-.03125
G1 X169.708 Y111.602 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 4/25
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S51
G17
G3 Z1 I1.217 J0 P1  F15000
; object ids of layer 4 start: 81,121
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
; object ids of this layer4 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X90.132 Y146.342
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X170.944 Y146.342 E2.59862
G1 X170.944 Y197.546 E1.64654
G1 X89.74 Y197.546 E2.61123
G1 X89.74 Y146.342 E1.64654
G1 X90.072 Y146.342 E.01068
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.552 Y146.734 E2.39544
G1 X170.552 Y197.154 E1.50184
G1 X90.132 Y197.154 E2.39544
G1 X90.132 Y146.794 E1.50005
; WIPE_START
M204 S5000
G1 X92.132 Y146.793 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.538 Y150.941 Z1.2 F15000
M73 P57 R8
G1 X171.74 Y198.342 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X88.944 Y198.342 E2.66241
G1 X88.944 Y145.546 E1.69772
G1 X171.74 Y145.546 E2.66241
G1 X171.74 Y198.282 E1.69579
M204 S250
G1 X172.132 Y198.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X88.552 Y198.734 E2.48956
G1 X88.552 Y145.154 E1.59597
G1 X172.132 Y145.154 E2.48956
G1 X172.132 Y198.674 E1.59418
; WIPE_START
M204 S5000
G1 X170.132 Y198.676 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.308 Y197.911 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X171.228 Y197.928 E.00278
; LINE_WIDTH: 0.448395
G1 X171.147 Y197.944 E.00263
; LINE_WIDTH: 0.43172
G1 X89.536 Y197.944 E2.50648
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00556
G1 X89.358 Y197.83 E.00278
; LINE_WIDTH: 0.448395
G1 X89.342 Y197.75 E.00263
; LINE_WIDTH: 0.431747
G1 X89.342 Y146.139 E1.58521
G1 X89.358 Y146.058 E.00253
; LINE_WIDTH: 0.481759
G1 X89.375 Y145.978 E.00285
; LINE_WIDTH: 0.481745
G1 X89.456 Y145.961 E.00285
; LINE_WIDTH: 0.448395
G1 X89.536 Y145.944 E.00263
; LINE_WIDTH: 0.43172
G1 X171.147 Y145.944 E2.50648
; LINE_WIDTH: 0.470635
G1 X171.308 Y145.978 E.00556
G1 X171.325 Y146.058 E.00278
; LINE_WIDTH: 0.448395
G1 X171.342 Y146.139 E.00263
; LINE_WIDTH: 0.43172
G1 X171.342 Y197.75 E1.5851
; LINE_WIDTH: 0.470635
G1 X171.321 Y197.852 E.00353
; OBJECT_ID: 121
; WIPE_START
G1 X171.228 Y197.928 E-.04541
G1 X171.147 Y197.944 E-.03125
G1 X169.349 Y197.944 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X165.561 Y191.318 Z1.2 F15000
G1 X90.491 Y60 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X171.303 Y60 E2.59862
G1 X171.303 Y111.204 E1.64654
G1 X90.099 Y111.204 E2.61123
G1 X90.099 Y60 E1.64654
G1 X90.431 Y60 E.01068
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.911 Y60.392 E2.39544
G1 X170.911 Y110.812 E1.50184
G1 X90.491 Y110.812 E2.39544
M73 P58 R8
G1 X90.491 Y60.452 E1.50005
; WIPE_START
M204 S5000
G1 X92.491 Y60.451 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.898 Y64.599 Z1.2 F15000
G1 X172.099 Y112 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.303 Y112 E2.66241
G1 X89.303 Y59.204 E1.69772
G1 X172.099 Y59.204 E2.66241
G1 X172.099 Y111.94 E1.69579
M204 S250
G1 X172.491 Y112.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P58 R7
G1 F6000
M204 S2500
G1 X88.911 Y112.392 E2.48956
G1 X88.911 Y58.812 E1.59597
G1 X172.491 Y58.812 E2.48956
G1 X172.491 Y112.332 E1.59418
; WIPE_START
M204 S5000
G1 X170.491 Y112.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.668 Y111.569 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X171.587 Y111.586 E.00278
; LINE_WIDTH: 0.448395
G1 X171.507 Y111.602 E.00263
; LINE_WIDTH: 0.43172
G1 X89.896 Y111.602 E2.50648
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00556
G1 X89.718 Y111.489 E.00278
; LINE_WIDTH: 0.448395
G1 X89.701 Y111.408 E.00263
; LINE_WIDTH: 0.431747
G1 X89.701 Y59.797 E1.58521
G1 X89.718 Y59.716 E.00253
; LINE_WIDTH: 0.481759
G1 X89.734 Y59.636 E.00285
; LINE_WIDTH: 0.481745
G1 X89.815 Y59.619 E.00285
; LINE_WIDTH: 0.448395
G1 X89.896 Y59.602 E.00263
; LINE_WIDTH: 0.43172
G1 X171.507 Y59.602 E2.50648
; LINE_WIDTH: 0.470635
G1 X171.668 Y59.636 E.00556
G1 X171.684 Y59.716 E.00278
; LINE_WIDTH: 0.448395
G1 X171.701 Y59.797 E.00263
; LINE_WIDTH: 0.43172
G1 X171.701 Y111.408 E1.5851
; LINE_WIDTH: 0.470635
G1 X171.68 Y111.51 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X171.587 Y111.586 E-.04541
G1 X171.507 Y111.602 E-.03125
G1 X169.708 Y111.602 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 5/25
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F15000
; object ids of layer 5 start: 81,121
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
; object ids of this layer5 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X90.132 Y146.342
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P59 R7
G1 X170.944 Y146.342 E2.59862
G1 X170.944 Y197.546 E1.64654
G1 X89.74 Y197.546 E2.61123
G1 X89.74 Y146.342 E1.64654
G1 X90.072 Y146.342 E.01068
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.552 Y146.734 E2.39544
G1 X170.552 Y197.154 E1.50184
G1 X90.132 Y197.154 E2.39544
G1 X90.132 Y146.794 E1.50005
; WIPE_START
M204 S5000
G1 X92.132 Y146.793 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.538 Y150.941 Z1.4 F15000
G1 X171.74 Y198.342 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X88.944 Y198.342 E2.66241
G1 X88.944 Y145.546 E1.69772
G1 X171.74 Y145.546 E2.66241
G1 X171.74 Y198.282 E1.69579
M204 S250
G1 X172.132 Y198.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X88.552 Y198.734 E2.48956
G1 X88.552 Y145.154 E1.59597
G1 X172.132 Y145.154 E2.48956
G1 X172.132 Y198.674 E1.59418
; WIPE_START
M204 S5000
G1 X170.132 Y198.676 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.308 Y197.911 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X171.228 Y197.928 E.00278
; LINE_WIDTH: 0.448395
G1 X171.147 Y197.944 E.00263
; LINE_WIDTH: 0.43172
G1 X89.536 Y197.944 E2.50648
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00556
G1 X89.358 Y197.83 E.00278
; LINE_WIDTH: 0.448395
G1 X89.342 Y197.75 E.00263
; LINE_WIDTH: 0.431747
G1 X89.342 Y146.139 E1.58521
G1 X89.358 Y146.058 E.00253
; LINE_WIDTH: 0.481759
G1 X89.375 Y145.978 E.00285
; LINE_WIDTH: 0.481745
G1 X89.456 Y145.961 E.00285
; LINE_WIDTH: 0.448395
G1 X89.536 Y145.944 E.00263
; LINE_WIDTH: 0.43172
G1 X171.147 Y145.944 E2.50648
; LINE_WIDTH: 0.470635
G1 X171.308 Y145.978 E.00556
G1 X171.325 Y146.058 E.00278
; LINE_WIDTH: 0.448395
G1 X171.342 Y146.139 E.00263
; LINE_WIDTH: 0.43172
G1 X171.342 Y197.75 E1.5851
; LINE_WIDTH: 0.470635
G1 X171.321 Y197.852 E.00353
; OBJECT_ID: 121
; WIPE_START
G1 X171.228 Y197.928 E-.04541
G1 X171.147 Y197.944 E-.03125
G1 X169.349 Y197.944 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X165.561 Y191.318 Z1.4 F15000
G1 X90.491 Y60 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P60 R7
G1 F9000
G1 X171.303 Y60 E2.59862
G1 X171.303 Y111.204 E1.64654
G1 X90.099 Y111.204 E2.61123
G1 X90.099 Y60 E1.64654
G1 X90.431 Y60 E.01068
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.911 Y60.392 E2.39544
G1 X170.911 Y110.812 E1.50184
G1 X90.491 Y110.812 E2.39544
G1 X90.491 Y60.452 E1.50005
; WIPE_START
M204 S5000
G1 X92.491 Y60.451 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.898 Y64.599 Z1.4 F15000
G1 X172.099 Y112 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.303 Y112 E2.66241
G1 X89.303 Y59.204 E1.69772
G1 X172.099 Y59.204 E2.66241
G1 X172.099 Y111.94 E1.69579
M204 S250
G1 X172.491 Y112.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X88.911 Y112.392 E2.48956
G1 X88.911 Y58.812 E1.59597
G1 X172.491 Y58.812 E2.48956
G1 X172.491 Y112.332 E1.59418
; WIPE_START
M204 S5000
G1 X170.491 Y112.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.668 Y111.569 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X171.587 Y111.586 E.00278
; LINE_WIDTH: 0.448395
G1 X171.507 Y111.602 E.00263
; LINE_WIDTH: 0.43172
G1 X89.896 Y111.602 E2.50648
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00556
G1 X89.718 Y111.489 E.00278
; LINE_WIDTH: 0.448395
G1 X89.701 Y111.408 E.00263
; LINE_WIDTH: 0.431747
G1 X89.701 Y59.797 E1.58521
G1 X89.718 Y59.716 E.00253
; LINE_WIDTH: 0.481759
G1 X89.734 Y59.636 E.00285
; LINE_WIDTH: 0.481745
G1 X89.815 Y59.619 E.00285
; LINE_WIDTH: 0.448395
G1 X89.896 Y59.602 E.00263
; LINE_WIDTH: 0.43172
G1 X171.507 Y59.602 E2.50648
; LINE_WIDTH: 0.470635
G1 X171.668 Y59.636 E.00556
G1 X171.684 Y59.716 E.00278
; LINE_WIDTH: 0.448395
G1 X171.701 Y59.797 E.00263
; LINE_WIDTH: 0.43172
G1 X171.701 Y111.408 E1.5851
; LINE_WIDTH: 0.470635
G1 X171.68 Y111.51 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X171.587 Y111.586 E-.04541
M73 P61 R7
G1 X171.507 Y111.602 E-.03125
G1 X169.708 Y111.602 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 6/25
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I1.217 J0 P1  F15000
; object ids of layer 6 start: 81,121
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
; object ids of this layer6 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X90.132 Y146.342
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X170.944 Y146.342 E2.59862
G1 X170.944 Y197.546 E1.64654
G1 X89.74 Y197.546 E2.61123
G1 X89.74 Y146.342 E1.64654
G1 X90.072 Y146.342 E.01068
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.552 Y146.734 E2.39544
G1 X170.552 Y197.154 E1.50184
G1 X90.132 Y197.154 E2.39544
G1 X90.132 Y146.794 E1.50005
; WIPE_START
M204 S5000
G1 X92.132 Y146.793 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.538 Y150.941 Z1.6 F15000
G1 X171.74 Y198.342 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X88.944 Y198.342 E2.66241
G1 X88.944 Y145.546 E1.69772
G1 X171.74 Y145.546 E2.66241
G1 X171.74 Y198.282 E1.69579
M204 S250
G1 X172.132 Y198.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X88.552 Y198.734 E2.48956
G1 X88.552 Y145.154 E1.59597
G1 X172.132 Y145.154 E2.48956
G1 X172.132 Y198.674 E1.59418
; WIPE_START
M204 S5000
G1 X170.132 Y198.676 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.308 Y197.911 Z1.6 F15000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X171.228 Y197.928 E.00278
; LINE_WIDTH: 0.448395
G1 X171.147 Y197.944 E.00263
; LINE_WIDTH: 0.43172
G1 X89.536 Y197.944 E2.50648
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00556
G1 X89.358 Y197.83 E.00278
; LINE_WIDTH: 0.448395
G1 X89.342 Y197.75 E.00263
; LINE_WIDTH: 0.431747
G1 X89.342 Y146.139 E1.58521
G1 X89.358 Y146.058 E.00253
; LINE_WIDTH: 0.481759
G1 X89.375 Y145.978 E.00285
; LINE_WIDTH: 0.481745
G1 X89.456 Y145.961 E.00285
; LINE_WIDTH: 0.448395
G1 X89.536 Y145.944 E.00263
; LINE_WIDTH: 0.43172
G1 X171.147 Y145.944 E2.50648
; LINE_WIDTH: 0.470635
G1 X171.308 Y145.978 E.00556
M73 P62 R7
G1 X171.325 Y146.058 E.00278
; LINE_WIDTH: 0.448395
G1 X171.342 Y146.139 E.00263
; LINE_WIDTH: 0.43172
G1 X171.342 Y197.75 E1.5851
; LINE_WIDTH: 0.470635
G1 X171.321 Y197.852 E.00353
; OBJECT_ID: 121
; WIPE_START
G1 X171.228 Y197.928 E-.04541
G1 X171.147 Y197.944 E-.03125
G1 X169.349 Y197.944 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X165.561 Y191.318 Z1.6 F15000
G1 X90.491 Y60 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X171.303 Y60 E2.59862
G1 X171.303 Y111.204 E1.64654
G1 X90.099 Y111.204 E2.61123
G1 X90.099 Y60 E1.64654
G1 X90.431 Y60 E.01068
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.911 Y60.392 E2.39544
G1 X170.911 Y110.812 E1.50184
G1 X90.491 Y110.812 E2.39544
G1 X90.491 Y60.452 E1.50005
; WIPE_START
M204 S5000
G1 X92.491 Y60.451 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.898 Y64.599 Z1.6 F15000
G1 X172.099 Y112 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.303 Y112 E2.66241
G1 X89.303 Y59.204 E1.69772
G1 X172.099 Y59.204 E2.66241
G1 X172.099 Y111.94 E1.69579
M204 S250
G1 X172.491 Y112.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X88.911 Y112.392 E2.48956
G1 X88.911 Y58.812 E1.59597
G1 X172.491 Y58.812 E2.48956
G1 X172.491 Y112.332 E1.59418
; WIPE_START
M204 S5000
G1 X170.491 Y112.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.668 Y111.569 Z1.6 F15000
M73 P63 R7
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X171.587 Y111.586 E.00278
; LINE_WIDTH: 0.448395
G1 X171.507 Y111.602 E.00263
; LINE_WIDTH: 0.43172
G1 X89.896 Y111.602 E2.50648
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00556
G1 X89.718 Y111.489 E.00278
; LINE_WIDTH: 0.448395
G1 X89.701 Y111.408 E.00263
; LINE_WIDTH: 0.431747
G1 X89.701 Y59.797 E1.58521
G1 X89.718 Y59.716 E.00253
; LINE_WIDTH: 0.481759
G1 X89.734 Y59.636 E.00285
; LINE_WIDTH: 0.481745
G1 X89.815 Y59.619 E.00285
; LINE_WIDTH: 0.448395
G1 X89.896 Y59.602 E.00263
; LINE_WIDTH: 0.43172
G1 X171.507 Y59.602 E2.50648
; LINE_WIDTH: 0.470635
G1 X171.668 Y59.636 E.00556
G1 X171.684 Y59.716 E.00278
; LINE_WIDTH: 0.448395
G1 X171.701 Y59.797 E.00263
; LINE_WIDTH: 0.43172
G1 X171.701 Y111.408 E1.5851
; LINE_WIDTH: 0.470635
G1 X171.68 Y111.51 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X171.587 Y111.586 E-.04541
G1 X171.507 Y111.602 E-.03125
G1 X169.708 Y111.602 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 7/25
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F15000
; object ids of layer 7 start: 81,121
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
; object ids of this layer7 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X90.132 Y146.342
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P63 R6
G1 X89.74 Y146.342 E.01261
G1 X89.74 Y197.546 E1.64654
G1 X169.739 Y197.546 E2.5725
G1 X169.739 Y198.342 E.02559
G1 X88.944 Y198.342 E2.59809
G1 X88.944 Y145.546 E1.69772
G1 X169.739 Y145.546 E2.59809
G1 X169.739 Y146.342 E.02559
G1 X90.192 Y146.342 E2.55796
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.552 Y146.734 E2.39544
G1 X170.552 Y197.154 E1.50184
G1 X90.132 Y197.154 E2.39544
G1 X90.132 Y146.794 E1.50005
; WIPE_START
M204 S5000
G1 X92.132 Y146.793 E-.76
; WIPE_END
M73 P64 R6
G1 E-.04 F1800
G1 X98.533 Y150.949 Z1.8 F15000
G1 X172.132 Y198.734 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X88.552 Y198.734 E2.48956
G1 X88.552 Y145.154 E1.59597
G1 X172.132 Y145.154 E2.48956
G1 X172.132 Y198.674 E1.59418
; WIPE_START
M204 S5000
G1 X170.132 Y198.676 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X169.536 Y197.944 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.536 Y197.944 E2.45698
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00556
G1 X89.358 Y197.83 E.00278
; LINE_WIDTH: 0.448395
G1 X89.342 Y197.75 E.00263
; LINE_WIDTH: 0.43172
G1 X89.342 Y146.139 E1.5851
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00556
G1 X89.456 Y145.961 E.00278
; LINE_WIDTH: 0.448395
G1 X89.536 Y145.944 E.00263
; LINE_WIDTH: 0.43172
G1 X169.536 Y145.944 E2.45698
; WIPE_START
G1 X167.536 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.924 Y146.07 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X171.216 Y145.362 E.02983
G1 X170.683 Y145.362
G1 X171.924 Y146.603 E.0523
G1 X171.924 Y147.136
G1 X170.15 Y145.362 E.07476
G1 X169.962 Y145.707
G1 X171.924 Y147.67 E.08267
G1 X171.924 Y148.203
G1 X170.836 Y147.114 E.04586
G1 X170.836 Y147.648
G1 X171.924 Y148.736 E.04586
G1 X171.924 Y149.269
G1 X170.836 Y148.181 E.04586
G1 X170.836 Y148.714
G1 X171.924 Y149.803 E.04586
G1 X171.924 Y150.336
G1 X170.836 Y149.247 E.04586
G1 X170.836 Y149.781
G1 X171.924 Y150.869 E.04586
G1 X171.924 Y151.403
G1 X170.836 Y150.314 E.04586
G1 X170.836 Y150.847
G1 X171.924 Y151.936 E.04586
G1 X171.924 Y152.469
G1 X170.836 Y151.38 E.04586
G1 X170.836 Y151.914
G1 X171.924 Y153.002 E.04586
G1 X171.924 Y153.536
M73 P65 R6
G1 X170.836 Y152.447 E.04586
G1 X170.836 Y152.98
G1 X171.924 Y154.069 E.04586
G1 X171.924 Y154.602
G1 X170.836 Y153.513 E.04586
G1 X170.836 Y154.047
G1 X171.924 Y155.135 E.04586
G1 X171.924 Y155.669
G1 X170.836 Y154.58 E.04586
G1 X170.836 Y155.113
G1 X171.924 Y156.202 E.04586
G1 X171.924 Y156.735
G1 X170.836 Y155.647 E.04586
G1 X170.836 Y156.18
G1 X171.924 Y157.268 E.04586
G1 X171.924 Y157.802
G1 X170.836 Y156.713 E.04586
G1 X170.836 Y157.246
G1 X171.924 Y158.335 E.04586
G1 X171.924 Y158.868
G1 X170.836 Y157.78 E.04586
G1 X170.836 Y158.313
G1 X171.924 Y159.401 E.04586
G1 X171.924 Y159.935
G1 X170.836 Y158.846 E.04586
G1 X170.836 Y159.379
G1 X171.924 Y160.468 E.04586
G1 X171.924 Y161.001
G1 X170.836 Y159.913 E.04586
G1 X170.836 Y160.446
G1 X171.924 Y161.534 E.04586
G1 X171.924 Y162.068
G1 X170.836 Y160.979 E.04586
G1 X170.836 Y161.512
G1 X171.924 Y162.601 E.04586
G1 X171.924 Y163.134
G1 X170.836 Y162.046 E.04586
G1 X170.836 Y162.579
G1 X171.924 Y163.667 E.04586
G1 X171.924 Y164.201
G1 X170.836 Y163.112 E.04586
G1 X170.836 Y163.645
G1 X171.924 Y164.734 E.04586
G1 X171.924 Y165.267
G1 X170.836 Y164.179 E.04586
G1 X170.836 Y164.712
G1 X171.924 Y165.8 E.04586
G1 X171.924 Y166.334
G1 X170.836 Y165.245 E.04586
G1 X170.836 Y165.778
G1 X171.924 Y166.867 E.04586
G1 X171.924 Y167.4
G1 X170.836 Y166.312 E.04586
G1 X170.836 Y166.845
G1 X171.924 Y167.933 E.04586
G1 X171.924 Y168.467
G1 X170.836 Y167.378 E.04586
G1 X170.836 Y167.911
G1 X171.924 Y169 E.04586
G1 X171.924 Y169.533
G1 X170.836 Y168.445 E.04586
G1 X170.836 Y168.978
G1 X171.924 Y170.067 E.04586
G1 X171.924 Y170.6
G1 X170.836 Y169.511 E.04586
G1 X170.836 Y170.044
G1 X171.924 Y171.133 E.04586
G1 X171.924 Y171.666
G1 X170.836 Y170.578 E.04586
G1 X170.836 Y171.111
G1 X171.924 Y172.2 E.04586
G1 X171.924 Y172.733
G1 X170.836 Y171.644 E.04586
G1 X170.836 Y172.178
G1 X171.924 Y173.266 E.04586
G1 X171.924 Y173.799
G1 X170.836 Y172.711 E.04586
G1 X170.836 Y173.244
G1 X171.924 Y174.333 E.04586
G1 X171.924 Y174.866
G1 X170.836 Y173.777 E.04586
G1 X170.836 Y174.311
G1 X171.924 Y175.399 E.04586
G1 X171.924 Y175.932
G1 X170.836 Y174.844 E.04586
G1 X170.836 Y175.377
G1 X171.924 Y176.466 E.04586
G1 X171.924 Y176.999
G1 X170.836 Y175.91 E.04586
G1 X170.836 Y176.444
G1 X171.924 Y177.532 E.04586
G1 X171.924 Y178.065
G1 X170.836 Y176.977 E.04586
G1 X170.836 Y177.51
G1 X171.924 Y178.599 E.04586
G1 X171.924 Y179.132
G1 X170.836 Y178.043 E.04586
G1 X170.836 Y178.577
G1 X171.924 Y179.665 E.04586
G1 X171.924 Y180.198
G1 X170.836 Y179.11 E.04586
G1 X170.836 Y179.643
G1 X171.924 Y180.732 E.04586
G1 X171.924 Y181.265
G1 X170.836 Y180.176 E.04586
G1 X170.836 Y180.71
G1 X171.924 Y181.798 E.04586
G1 X171.924 Y182.331
G1 X170.836 Y181.243 E.04586
G1 X170.836 Y181.776
G1 X171.924 Y182.865 E.04586
G1 X171.924 Y183.398
G1 X170.836 Y182.309 E.04586
G1 X170.836 Y182.843
G1 X171.924 Y183.931 E.04586
G1 X171.924 Y184.464
G1 X170.836 Y183.376 E.04586
G1 X170.836 Y183.909
G1 X171.924 Y184.998 E.04586
G1 X171.924 Y185.531
G1 X170.836 Y184.442 E.04586
G1 X170.836 Y184.976
G1 X171.924 Y186.064 E.04586
G1 X171.924 Y186.598
G1 X170.836 Y185.509 E.04586
G1 X170.836 Y186.042
G1 X171.924 Y187.131 E.04586
G1 X171.924 Y187.664
G1 X170.836 Y186.575 E.04586
G1 X170.836 Y187.109
G1 X171.924 Y188.197 E.04586
G1 X171.924 Y188.731
G1 X170.836 Y187.642 E.04586
G1 X170.836 Y188.175
G1 X171.924 Y189.264 E.04586
G1 X171.924 Y189.797
G1 X170.836 Y188.708 E.04586
G1 X170.836 Y189.242
G1 X171.924 Y190.33 E.04586
G1 X171.924 Y190.864
G1 X170.836 Y189.775 E.04586
G1 X170.836 Y190.308
G1 X171.924 Y191.397 E.04586
G1 X171.924 Y191.93
G1 X170.836 Y190.842 E.04586
G1 X170.836 Y191.375
G1 X171.924 Y192.463 E.04586
G1 X171.924 Y192.997
G1 X170.836 Y191.908 E.04586
G1 X170.836 Y192.441
G1 X171.924 Y193.53 E.04586
G1 X171.924 Y194.063
G1 X170.836 Y192.975 E.04586
G1 X170.836 Y193.508
G1 X171.924 Y194.596 E.04586
G1 X171.924 Y195.13
G1 X170.836 Y194.041 E.04586
G1 X170.836 Y194.574
G1 X171.924 Y195.663 E.04586
G1 X171.924 Y196.196
G1 X170.836 Y195.108 E.04586
G1 X170.836 Y195.641
G1 X171.924 Y196.729 E.04586
G1 X171.924 Y197.263
G1 X170.836 Y196.174 E.04586
G1 X170.836 Y196.707
G1 X171.924 Y197.796 E.04586
G1 X171.924 Y198.329
G1 X170.819 Y197.223 E.04658
G1 X170.424 Y197.362
G1 X171.589 Y198.527 E.04908
G1 X171.056 Y198.527
G1 X169.962 Y197.433 E.04608
G1 X169.962 Y197.966
G1 X170.522 Y198.527 E.02361
; WIPE_START
M204 S5000
G1 X169.962 Y197.966 E-.30127
G1 X169.962 Y197.433 E-.20264
G1 X170.438 Y197.91 E-.2561
; WIPE_END
G1 E-.04 F1800
G1 X171.943 Y198.497 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145578
G1 F7500
G3 X171.659 Y198.457 I-.093 J-.363 E.00239
; OBJECT_ID: 121
; WIPE_START
G1 X171.756 Y198.497 E-.27421
G1 X171.943 Y198.497 E-.48579
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X168.074 Y191.918 Z1.8 F15000
G1 X90.491 Y60 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y60 E.01261
G1 X90.099 Y111.204 E1.64654
G1 X170.099 Y111.204 E2.5725
G1 X170.099 Y112 E.02559
G1 X89.303 Y112 E2.59809
G1 X89.303 Y59.204 E1.69772
G1 X170.099 Y59.204 E2.59809
G1 X170.099 Y60 E.02559
G1 X90.551 Y60 E2.55796
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.911 Y60.392 E2.39544
M73 P66 R6
G1 X170.911 Y110.812 E1.50184
G1 X90.491 Y110.812 E2.39544
G1 X90.491 Y60.452 E1.50005
; WIPE_START
M204 S5000
G1 X92.491 Y60.451 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.893 Y64.607 Z1.8 F15000
G1 X172.491 Y112.392 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X88.911 Y112.392 E2.48956
G1 X88.911 Y58.812 E1.59597
G1 X172.491 Y58.812 E2.48956
G1 X172.491 Y112.332 E1.59418
; WIPE_START
M204 S5000
G1 X170.491 Y112.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X169.895 Y111.602 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.896 Y111.602 E2.45698
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00556
G1 X89.718 Y111.489 E.00278
; LINE_WIDTH: 0.448395
G1 X89.701 Y111.408 E.00263
; LINE_WIDTH: 0.43172
G1 X89.701 Y59.797 E1.5851
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00556
G1 X89.815 Y59.619 E.00278
; LINE_WIDTH: 0.448395
G1 X89.896 Y59.602 E.00263
; LINE_WIDTH: 0.43172
G1 X169.895 Y59.602 E2.45698
; WIPE_START
G1 X167.895 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X172.284 Y59.728 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X171.576 Y59.02 E.02983
G1 X171.042 Y59.02
G1 X172.284 Y60.261 E.0523
G1 X172.284 Y60.794
G1 X170.509 Y59.02 E.07476
G1 X170.321 Y59.365
G1 X172.284 Y61.328 E.08267
G1 X172.284 Y61.861
G1 X171.195 Y60.772 E.04586
G1 X171.195 Y61.306
G1 X172.284 Y62.394 E.04586
G1 X172.284 Y62.928
G1 X171.195 Y61.839 E.04586
G1 X171.195 Y62.372
G1 X172.284 Y63.461 E.04586
G1 X172.284 Y63.994
G1 X171.195 Y62.905 E.04586
G1 X171.195 Y63.439
G1 X172.284 Y64.527 E.04586
G1 X172.284 Y65.061
G1 X171.195 Y63.972 E.04586
G1 X171.195 Y64.505
G1 X172.284 Y65.594 E.04586
G1 X172.284 Y66.127
G1 X171.195 Y65.039 E.04586
G1 X171.195 Y65.572
G1 X172.284 Y66.66 E.04586
G1 X172.284 Y67.194
G1 X171.195 Y66.105 E.04586
G1 X171.195 Y66.638
G1 X172.284 Y67.727 E.04586
G1 X172.284 Y68.26
G1 X171.195 Y67.172 E.04586
G1 X171.195 Y67.705
G1 X172.284 Y68.793 E.04586
G1 X172.284 Y69.327
M73 P67 R6
G1 X171.195 Y68.238 E.04586
G1 X171.195 Y68.771
G1 X172.284 Y69.86 E.04586
G1 X172.284 Y70.393
G1 X171.195 Y69.305 E.04586
G1 X171.195 Y69.838
G1 X172.284 Y70.926 E.04586
G1 X172.284 Y71.46
G1 X171.195 Y70.371 E.04586
G1 X171.195 Y70.904
G1 X172.284 Y71.993 E.04586
G1 X172.284 Y72.526
G1 X171.195 Y71.438 E.04586
G1 X171.195 Y71.971
G1 X172.284 Y73.059 E.04586
G1 X172.284 Y73.593
G1 X171.195 Y72.504 E.04586
G1 X171.195 Y73.037
G1 X172.284 Y74.126 E.04586
G1 X172.284 Y74.659
G1 X171.195 Y73.571 E.04586
G1 X171.195 Y74.104
G1 X172.284 Y75.192 E.04586
G1 X172.284 Y75.726
G1 X171.195 Y74.637 E.04586
G1 X171.195 Y75.17
G1 X172.284 Y76.259 E.04586
G1 X172.284 Y76.792
G1 X171.195 Y75.704 E.04586
G1 X171.195 Y76.237
G1 X172.284 Y77.325 E.04586
G1 X172.284 Y77.859
G1 X171.195 Y76.77 E.04586
G1 X171.195 Y77.303
G1 X172.284 Y78.392 E.04586
G1 X172.284 Y78.925
G1 X171.195 Y77.837 E.04586
G1 X171.195 Y78.37
G1 X172.284 Y79.459 E.04586
G1 X172.284 Y79.992
G1 X171.195 Y78.903 E.04586
G1 X171.195 Y79.436
G1 X172.284 Y80.525 E.04586
G1 X172.284 Y81.058
G1 X171.195 Y79.97 E.04586
G1 X171.195 Y80.503
G1 X172.284 Y81.592 E.04586
G1 X172.284 Y82.125
G1 X171.195 Y81.036 E.04586
G1 X171.195 Y81.569
G1 X172.284 Y82.658 E.04586
G1 X172.284 Y83.191
G1 X171.195 Y82.103 E.04586
G1 X171.195 Y82.636
G1 X172.284 Y83.725 E.04586
G1 X172.284 Y84.258
G1 X171.195 Y83.169 E.04586
G1 X171.195 Y83.703
G1 X172.284 Y84.791 E.04586
G1 X172.284 Y85.324
G1 X171.195 Y84.236 E.04586
G1 X171.195 Y84.769
G1 X172.284 Y85.858 E.04586
G1 X172.284 Y86.391
G1 X171.195 Y85.302 E.04586
G1 X171.195 Y85.836
G1 X172.284 Y86.924 E.04586
G1 X172.284 Y87.457
G1 X171.195 Y86.369 E.04586
G1 X171.195 Y86.902
G1 X172.284 Y87.991 E.04586
G1 X172.284 Y88.524
G1 X171.195 Y87.435 E.04586
G1 X171.195 Y87.969
G1 X172.284 Y89.057 E.04586
G1 X172.284 Y89.59
G1 X171.195 Y88.502 E.04586
G1 X171.195 Y89.035
G1 X172.284 Y90.124 E.04586
G1 X172.284 Y90.657
G1 X171.195 Y89.568 E.04586
G1 X171.195 Y90.102
G1 X172.284 Y91.19 E.04586
G1 X172.284 Y91.723
G1 X171.195 Y90.635 E.04586
G1 X171.195 Y91.168
G1 X172.284 Y92.257 E.04586
G1 X172.284 Y92.79
G1 X171.195 Y91.701 E.04586
G1 X171.195 Y92.235
G1 X172.284 Y93.323 E.04586
G1 X172.284 Y93.856
G1 X171.195 Y92.768 E.04586
G1 X171.195 Y93.301
G1 X172.284 Y94.39 E.04586
G1 X172.284 Y94.923
G1 X171.195 Y93.834 E.04586
G1 X171.195 Y94.368
G1 X172.284 Y95.456 E.04586
G1 X172.284 Y95.989
G1 X171.195 Y94.901 E.04586
G1 X171.195 Y95.434
G1 X172.284 Y96.523 E.04586
G1 X172.284 Y97.056
G1 X171.195 Y95.967 E.04586
G1 X171.195 Y96.501
G1 X172.284 Y97.589 E.04586
G1 X172.284 Y98.123
G1 X171.195 Y97.034 E.04586
G1 X171.195 Y97.567
G1 X172.284 Y98.656 E.04586
G1 X172.284 Y99.189
G1 X171.195 Y98.1 E.04586
G1 X171.195 Y98.634
G1 X172.284 Y99.722 E.04586
G1 X172.284 Y100.256
G1 X171.195 Y99.167 E.04586
G1 X171.195 Y99.7
G1 X172.284 Y100.789 E.04586
G1 X172.284 Y101.322
G1 X171.195 Y100.234 E.04586
G1 X171.195 Y100.767
G1 X172.284 Y101.855 E.04586
G1 X172.284 Y102.389
G1 X171.195 Y101.3 E.04586
G1 X171.195 Y101.833
G1 X172.284 Y102.922 E.04586
G1 X172.284 Y103.455
G1 X171.195 Y102.367 E.04586
G1 X171.195 Y102.9
G1 X172.284 Y103.988 E.04586
G1 X172.284 Y104.522
G1 X171.195 Y103.433 E.04586
G1 X171.195 Y103.966
G1 X172.284 Y105.055 E.04586
G1 X172.284 Y105.588
G1 X171.195 Y104.5 E.04586
G1 X171.195 Y105.033
G1 X172.284 Y106.121 E.04586
G1 X172.284 Y106.655
G1 X171.195 Y105.566 E.04586
G1 X171.195 Y106.099
G1 X172.284 Y107.188 E.04586
G1 X172.284 Y107.721
G1 X171.195 Y106.633 E.04586
G1 X171.195 Y107.166
G1 X172.284 Y108.254 E.04586
G1 X172.284 Y108.788
G1 X171.195 Y107.699 E.04586
G1 X171.195 Y108.232
G1 X172.284 Y109.321 E.04586
G1 X172.284 Y109.854
G1 X171.195 Y108.766 E.04586
G1 X171.195 Y109.299
G1 X172.284 Y110.387 E.04586
G1 X172.284 Y110.921
G1 X171.195 Y109.832 E.04586
G1 X171.195 Y110.365
G1 X172.284 Y111.454 E.04586
G1 X172.284 Y111.987
G1 X171.178 Y110.881 E.04658
G1 X170.783 Y111.02
G1 X171.948 Y112.185 E.04908
G1 X171.415 Y112.185
G1 X170.321 Y111.091 E.04608
G1 X170.321 Y111.624
G1 X170.882 Y112.185 E.02361
; WIPE_START
M204 S5000
G1 X170.321 Y111.624 E-.30127
G1 X170.321 Y111.091 E-.20264
G1 X170.798 Y111.568 E-.2561
; WIPE_END
G1 E-.04 F1800
G1 X172.303 Y112.155 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145578
G1 F7500
G3 X172.019 Y112.115 I-.093 J-.363 E.00239
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X172.116 Y112.155 E-.27421
G1 X172.303 Y112.155 E-.48579
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 8/25
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I1.217 J0 P1  F15000
; object ids of layer 8 start: 81,121
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
; object ids of this layer8 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X90.132 Y146.342
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y146.342 E.01261
G1 X89.74 Y197.546 E1.64654
G1 X165.026 Y197.546 E2.42095
G1 X165.026 Y198.342 E.02559
G1 X88.944 Y198.342 E2.44654
G1 X88.944 Y145.546 E1.69772
G1 X165.026 Y145.546 E2.44654
G1 X165.026 Y146.342 E.02559
G1 X90.192 Y146.342 E2.40641
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.552 Y146.734 E2.39544
G1 X170.552 Y197.154 E1.50184
G1 X90.132 Y197.154 E2.39544
G1 X90.132 Y146.794 E1.50005
; WIPE_START
M204 S5000
G1 X92.132 Y146.793 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.496 Y151.005 Z2 F15000
G1 X170.607 Y198.734 Z2
G1 Z1.6
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X88.552 Y198.734 E2.44415
G1 X88.552 Y145.154 E1.59597
G1 X170.607 Y145.154 E2.44415
G1 X170.607 Y198.674 E1.59418
; WIPE_START
M204 S5000
G1 X168.607 Y198.676 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X169.616 Y198.527 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X170.4 Y197.744 E.033
G1 X170.248 Y197.362
G1 X169.083 Y198.527 E.04908
G1 X168.55 Y198.527
G1 X169.715 Y197.362 E.04908
G1 X169.182 Y197.362
G1 X168.017 Y198.527 E.04908
G1 X167.483 Y198.527
G1 X168.649 Y197.362 E.04909
G1 X168.115 Y197.362
G1 X166.95 Y198.527 E.04908
G1 X166.417 Y198.527
G1 X167.582 Y197.362 E.04908
G1 X167.049 Y197.362
G1 X165.884 Y198.527 E.04908
M73 P68 R6
G1 X165.35 Y198.527
G1 X166.515 Y197.362 E.04908
G1 X165.982 Y197.362
G1 X165.249 Y198.095 E.03089
M204 S5000
G1 X164.823 Y197.944 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.536 Y197.944 E2.31224
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00556
G1 X89.358 Y197.83 E.00278
; LINE_WIDTH: 0.448395
G1 X89.342 Y197.75 E.00263
; LINE_WIDTH: 0.43172
G1 X89.342 Y146.139 E1.5851
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00556
G1 X89.456 Y145.961 E.00278
; LINE_WIDTH: 0.448395
G1 X89.536 Y145.944 E.00263
; LINE_WIDTH: 0.43172
G1 X164.823 Y145.944 E2.31224
; WIPE_START
G1 X162.823 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X170.4 Y146.018 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X169.89 Y146.527 E.02145
G1 X169.357 Y146.527
G1 X170.4 Y145.484 E.04392
G1 X169.989 Y145.362
G1 X168.824 Y146.527 E.04908
G1 X168.291 Y146.527
G1 X169.456 Y145.362 E.04908
G1 X168.923 Y145.362
M73 P68 R5
G1 X167.757 Y146.527 E.04908
G1 X167.224 Y146.527
G1 X168.389 Y145.362 E.04908
G1 X167.856 Y145.362
G1 X166.691 Y146.527 E.04908
G1 X166.158 Y146.527
G1 X167.323 Y145.362 E.04908
G1 X166.79 Y145.362
G1 X165.624 Y146.527 E.04908
G1 X165.249 Y146.369
G1 X166.256 Y145.362 E.04244
G1 X165.723 Y145.362
G1 X165.249 Y145.836 E.01997
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X165.723 Y145.362 E-.25482
G1 X166.256 Y145.362 E-.20264
G1 X165.693 Y145.925 E-.30254
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X160.667 Y140.181 Z2 F15000
G1 X90.491 Y60 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y60 E.01261
G1 X90.099 Y111.204 E1.64654
G1 X165.386 Y111.204 E2.42095
G1 X165.386 Y112 E.02559
G1 X89.303 Y112 E2.44654
G1 X89.303 Y59.204 E1.69772
G1 X165.386 Y59.204 E2.44654
G1 X165.386 Y60 E.02559
G1 X90.551 Y60 E2.40641
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X170.911 Y60.392 E2.39544
G1 X170.911 Y110.812 E1.50184
G1 X90.491 Y110.812 E2.39544
M73 P69 R5
G1 X90.491 Y60.452 E1.50005
; WIPE_START
M204 S5000
G1 X92.491 Y60.451 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.856 Y64.664 Z2 F15000
G1 X170.966 Y112.392 Z2
G1 Z1.6
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X88.911 Y112.392 E2.44415
G1 X88.911 Y58.812 E1.59597
G1 X170.966 Y58.812 E2.44415
G1 X170.966 Y112.332 E1.59418
; WIPE_START
M204 S5000
G1 X168.966 Y112.334 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X169.976 Y112.185 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X170.759 Y111.402 E.033
G1 X170.608 Y111.02
G1 X169.442 Y112.185 E.04908
G1 X168.909 Y112.185
G1 X170.074 Y111.02 E.04908
G1 X169.541 Y111.02
G1 X168.376 Y112.185 E.04908
G1 X167.843 Y112.185
G1 X169.008 Y111.02 E.04909
G1 X168.475 Y111.02
G1 X167.309 Y112.185 E.04908
G1 X166.776 Y112.185
G1 X167.941 Y111.02 E.04908
G1 X167.408 Y111.02
G1 X166.243 Y112.185 E.04908
G1 X165.71 Y112.185
G1 X166.875 Y111.02 E.04908
G1 X166.342 Y111.02
G1 X165.608 Y111.753 E.03089
M204 S5000
G1 X165.182 Y111.602 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.896 Y111.602 E2.31224
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00556
G1 X89.718 Y111.489 E.00278
; LINE_WIDTH: 0.448395
G1 X89.701 Y111.408 E.00263
; LINE_WIDTH: 0.43172
G1 X89.701 Y59.797 E1.5851
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00556
G1 X89.815 Y59.619 E.00278
; LINE_WIDTH: 0.448395
G1 X89.896 Y59.602 E.00263
; LINE_WIDTH: 0.43172
G1 X165.182 Y59.602 E2.31224
; WIPE_START
G1 X163.182 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X170.759 Y59.676 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X170.25 Y60.185 E.02145
G1 X169.717 Y60.185
G1 X170.759 Y59.142 E.04392
G1 X170.349 Y59.02
G1 X169.183 Y60.185 E.04908
G1 X168.65 Y60.185
G1 X169.815 Y59.02 E.04908
G1 X169.282 Y59.02
G1 X168.117 Y60.185 E.04908
G1 X167.584 Y60.185
G1 X168.749 Y59.02 E.04908
G1 X168.215 Y59.02
G1 X167.05 Y60.185 E.04908
G1 X166.517 Y60.185
G1 X167.682 Y59.02 E.04908
G1 X167.149 Y59.02
G1 X165.984 Y60.185 E.04908
G1 X165.608 Y60.027
M73 P70 R5
G1 X166.616 Y59.02 E.04244
G1 X166.082 Y59.02
G1 X165.608 Y59.494 E.01997
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X166.082 Y59.02 E-.25482
G1 X166.616 Y59.02 E-.20264
G1 X166.053 Y59.583 E-.30255
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 9/25
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F15000
; object ids of layer 9 start: 81,121
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
; object ids of this layer9 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X160.313 Y197.546 E2.2694
G1 X160.313 Y198.342 E.02559
G1 X88.944 Y198.342 E2.29499
G1 X88.944 Y145.546 E1.69772
G1 X160.313 Y145.546 E2.29499
G1 X160.313 Y146.342 E.02559
G1 X89.8 Y146.342 E2.26747
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X165.894 Y197.154 E2.2567
G1 X165.894 Y198.734 E.04706
G1 X88.552 Y198.734 E2.30377
G1 X88.552 Y145.154 E1.59597
G1 X165.894 Y145.154 E2.30377
G1 X165.894 Y146.734 E.04706
G1 X90.192 Y146.734 E2.25492
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.456 Y145.961 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00278
G1 X89.342 Y146.139 E.00556
; LINE_WIDTH: 0.43172
G1 X89.342 Y197.75 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.358 Y197.83 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00278
G1 X89.536 Y197.944 E.00556
; LINE_WIDTH: 0.43172
G1 X160.11 Y197.944 E2.16749
; WIPE_START
G1 X158.11 Y197.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X165.687 Y197.957 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X165.091 Y197.362 E.02509
G1 X164.558 Y197.362
G1 X165.687 Y198.491 E.04756
G1 X165.19 Y198.527
G1 X164.025 Y197.362 E.04908
G1 X163.491 Y197.362
G1 X164.657 Y198.527 E.04908
G1 X164.123 Y198.527
G1 X162.958 Y197.362 E.04908
G1 X162.425 Y197.362
G1 X163.59 Y198.527 E.04908
G1 X163.057 Y198.527
G1 X161.892 Y197.362 E.04908
G1 X161.358 Y197.362
G1 X162.523 Y198.527 E.04908
G1 X161.99 Y198.527
G1 X160.825 Y197.362 E.04908
G1 X160.536 Y197.606
G1 X161.457 Y198.527 E.0388
G1 X160.924 Y198.527
G1 X160.536 Y198.139 E.01633
; WIPE_START
M204 S5000
G1 X160.924 Y198.527 E-.20836
G1 X161.457 Y198.527 E-.20264
G1 X160.808 Y197.878 E-.34901
; WIPE_END
G1 E-.04 F1800
G1 X160.705 Y190.246 Z2.2 F15000
G1 X160.11 Y145.944 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.536 Y145.944 E2.16749
; WIPE_START
G1 X91.536 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P71 R5
G1 X99.168 Y145.884 Z2.2 F15000
G1 X164.817 Y145.362 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X165.687 Y146.231 E.03664
G1 X165.449 Y146.527
G1 X164.284 Y145.362 E.04908
G1 X163.751 Y145.362
G1 X164.916 Y146.527 E.04908
G1 X164.382 Y146.527
G1 X163.217 Y145.362 E.04908
G1 X162.684 Y145.362
G1 X163.849 Y146.527 E.04908
G1 X163.316 Y146.527
G1 X162.151 Y145.362 E.04908
G1 X161.617 Y145.362
G1 X162.783 Y146.527 E.04908
G1 X162.249 Y146.527
G1 X161.084 Y145.362 E.04908
G1 X160.551 Y145.362
G1 X161.716 Y146.527 E.04908
G1 X161.183 Y146.527
G1 X160.536 Y145.88 E.02725
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X161.183 Y146.527 E-.34767
G1 X161.716 Y146.527 E-.20264
G1 X161.326 Y146.137 E-.20969
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X156.462 Y140.255 Z2.2 F15000
G1 X90.099 Y60 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X160.673 Y111.204 E2.2694
G1 X160.673 Y112 E.02559
G1 X89.303 Y112 E2.29499
G1 X89.303 Y59.204 E1.69772
G1 X160.673 Y59.204 E2.29499
G1 X160.673 Y60 E.02559
G1 X90.159 Y60 E2.26747
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X166.254 Y110.812 E2.2567
G1 X166.254 Y112.392 E.04706
G1 X88.911 Y112.392 E2.30377
G1 X88.911 Y58.812 E1.59597
G1 X166.254 Y58.812 E2.30377
G1 X166.254 Y60.392 E.04706
G1 X90.551 Y60.392 E2.25492
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.815 Y59.619 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00278
G1 X89.701 Y59.797 E.00556
; LINE_WIDTH: 0.43172
G1 X89.701 Y111.408 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.718 Y111.489 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00278
G1 X89.896 Y111.602 E.00556
; LINE_WIDTH: 0.43172
G1 X160.469 Y111.602 E2.16749
; WIPE_START
G1 X158.469 Y111.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X166.046 Y111.615 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X165.45 Y111.02 E.02509
G1 X164.917 Y111.02
G1 X166.046 Y112.149 E.04756
G1 X165.549 Y112.185
G1 X164.384 Y111.02 E.04908
G1 X163.851 Y111.02
G1 X165.016 Y112.185 E.04908
G1 X164.483 Y112.185
G1 X163.317 Y111.02 E.04908
G1 X162.784 Y111.02
G1 X163.949 Y112.185 E.04908
G1 X163.416 Y112.185
G1 X162.251 Y111.02 E.04908
G1 X161.718 Y111.02
G1 X162.883 Y112.185 E.04908
G1 X162.35 Y112.185
G1 X161.184 Y111.02 E.04908
G1 X160.895 Y111.264
G1 X161.816 Y112.185 E.0388
G1 X161.283 Y112.185
G1 X160.895 Y111.797 E.01633
; WIPE_START
M204 S5000
G1 X161.283 Y112.185 E-.20836
G1 X161.816 Y112.185 E-.20264
G1 X161.167 Y111.536 E-.34901
; WIPE_END
G1 E-.04 F1800
G1 X161.064 Y103.904 Z2.2 F15000
G1 X160.469 Y59.602 Z2.2
G1 Z1.8
M73 P72 R5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.896 Y59.602 E2.16749
; WIPE_START
G1 X91.896 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.528 Y59.542 Z2.2 F15000
G1 X165.176 Y59.02 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X166.046 Y59.889 E.03664
G1 X165.808 Y60.185
G1 X164.643 Y59.02 E.04908
G1 X164.11 Y59.02
G1 X165.275 Y60.185 E.04908
G1 X164.742 Y60.185
G1 X163.577 Y59.02 E.04908
G1 X163.043 Y59.02
G1 X164.209 Y60.185 E.04908
G1 X163.675 Y60.185
G1 X162.51 Y59.02 E.04908
G1 X161.977 Y59.02
G1 X163.142 Y60.185 E.04908
G1 X162.609 Y60.185
G1 X161.444 Y59.02 E.04908
G1 X160.91 Y59.02
G1 X162.076 Y60.185 E.04908
G1 X161.542 Y60.185
G1 X160.895 Y59.538 E.02725
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X161.542 Y60.185 E-.34767
G1 X162.076 Y60.185 E-.20264
G1 X161.685 Y59.795 E-.20969
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 10/25
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F15000
; object ids of layer 10 start: 81,121
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
; object ids of this layer10 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X155.601 Y197.546 E2.11785
G1 X155.601 Y198.342 E.02559
G1 X88.944 Y198.342 E2.14344
G1 X88.944 Y145.546 E1.69772
G1 X155.601 Y145.546 E2.14344
G1 X155.601 Y146.342 E.02559
G1 X89.8 Y146.342 E2.11592
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X161.181 Y197.154 E2.11632
G1 X161.181 Y198.734 E.04706
G1 X88.552 Y198.734 E2.16339
G1 X88.552 Y145.154 E1.59597
G1 X161.181 Y145.154 E2.16339
G1 X161.181 Y146.734 E.04706
G1 X90.192 Y146.734 E2.11454
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.397 Y145.944 E2.02275
; WIPE_START
G1 X153.397 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X160.974 Y145.845 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X160.292 Y146.527 E.02874
G1 X159.758 Y146.527
G1 X160.924 Y145.362 E.04908
G1 X160.39 Y145.362
G1 X159.225 Y146.527 E.04908
G1 X158.692 Y146.527
G1 X159.857 Y145.362 E.04908
G1 X159.324 Y145.362
G1 X158.159 Y146.527 E.04908
G1 X157.625 Y146.527
G1 X158.791 Y145.362 E.04908
G1 X158.257 Y145.362
G1 X157.092 Y146.527 E.04908
G1 X156.559 Y146.527
G1 X157.724 Y145.362 E.04908
G1 X157.191 Y145.362
G1 X156.026 Y146.527 E.04908
G1 X155.823 Y146.196
G1 X156.658 Y145.362 E.03515
; WIPE_START
M204 S5000
G1 X155.823 Y146.196 E-.44848
G1 X156.026 Y146.527 E-.14737
G1 X156.331 Y146.221 E-.16416
; WIPE_END
G1 E-.04 F1800
G1 X156.193 Y153.853 Z2.4 F15000
G1 X155.397 Y197.944 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.536 Y197.944 E2.02275
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00556
G1 X89.358 Y197.83 E.00278
; LINE_WIDTH: 0.448395
G1 X89.342 Y197.75 E.00263
; LINE_WIDTH: 0.43172
G1 X89.342 Y146.139 E1.5851
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00556
G1 X89.456 Y145.961 E.00278
; LINE_WIDTH: 0.448395
M73 P73 R5
G1 X89.536 Y145.944 E.00263
; WIPE_START
G1 X89.456 Y145.961 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.623 Y150.458 Z2.4 F15000
G1 X160.974 Y198.104 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X160.551 Y198.527 E.01782
G1 X160.018 Y198.527
G1 X160.974 Y197.571 E.04028
G1 X160.65 Y197.362
G1 X159.484 Y198.527 E.04908
G1 X158.951 Y198.527
G1 X160.116 Y197.362 E.04908
G1 X159.583 Y197.362
G1 X158.418 Y198.527 E.04908
G1 X157.885 Y198.527
G1 X159.05 Y197.362 E.04908
G1 X158.517 Y197.362
G1 X157.351 Y198.527 E.04908
G1 X156.818 Y198.527
G1 X157.983 Y197.362 E.04908
G1 X157.45 Y197.362
G1 X156.285 Y198.527 E.04908
G1 X155.823 Y198.455
G1 X156.917 Y197.362 E.04607
G1 X156.384 Y197.362
G1 X155.823 Y197.922 E.02361
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X156.384 Y197.362 E-.30121
G1 X156.917 Y197.362 E-.20264
G1 X156.44 Y197.838 E-.25615
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X153.13 Y190.961 Z2.4 F15000
G1 X90.099 Y60 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X155.96 Y111.204 E2.11785
G1 X155.96 Y112 E.02559
G1 X89.303 Y112 E2.14344
G1 X89.303 Y59.204 E1.69772
G1 X155.96 Y59.204 E2.14344
G1 X155.96 Y60 E.02559
G1 X90.159 Y60 E2.11592
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X161.541 Y110.812 E2.11632
G1 X161.541 Y112.392 E.04706
G1 X88.911 Y112.392 E2.16339
G1 X88.911 Y58.812 E1.59597
G1 X161.541 Y58.812 E2.16339
G1 X161.541 Y60.392 E.04706
G1 X90.551 Y60.392 E2.11454
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X155.757 Y59.602 E2.02275
; WIPE_START
G1 X153.757 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X161.333 Y59.503 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X160.651 Y60.185 E.02874
G1 X160.118 Y60.185
G1 X161.283 Y59.02 E.04908
G1 X160.75 Y59.02
G1 X159.585 Y60.185 E.04908
G1 X159.051 Y60.185
G1 X160.217 Y59.02 E.04908
G1 X159.683 Y59.02
G1 X158.518 Y60.185 E.04908
G1 X157.985 Y60.185
G1 X159.15 Y59.02 E.04908
G1 X158.617 Y59.02
G1 X157.452 Y60.185 E.04908
G1 X156.918 Y60.185
G1 X158.084 Y59.02 E.04908
G1 X157.55 Y59.02
G1 X156.385 Y60.185 E.04908
G1 X156.183 Y59.854
G1 X157.017 Y59.02 E.03515
; WIPE_START
M204 S5000
G1 X156.183 Y59.854 E-.44848
G1 X156.385 Y60.185 E-.14737
G1 X156.691 Y59.88 E-.16416
; WIPE_END
G1 E-.04 F1800
G1 X156.553 Y67.511 Z2.4 F15000
G1 X155.757 Y111.602 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.896 Y111.602 E2.02275
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00556
G1 X89.718 Y111.489 E.00278
; LINE_WIDTH: 0.448395
G1 X89.701 Y111.408 E.00263
; LINE_WIDTH: 0.43172
G1 X89.701 Y59.797 E1.5851
; LINE_WIDTH: 0.470635
M73 P74 R4
G1 X89.734 Y59.636 E.00556
G1 X89.815 Y59.619 E.00278
; LINE_WIDTH: 0.448395
G1 X89.896 Y59.602 E.00263
; WIPE_START
G1 X89.815 Y59.619 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.982 Y64.116 Z2.4 F15000
G1 X161.333 Y111.762 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X160.91 Y112.185 E.01782
G1 X160.377 Y112.185
G1 X161.333 Y111.229 E.04028
G1 X161.009 Y111.02
G1 X159.844 Y112.185 E.04908
G1 X159.311 Y112.185
G1 X160.476 Y111.02 E.04908
G1 X159.943 Y111.02
G1 X158.777 Y112.185 E.04908
G1 X158.244 Y112.185
G1 X159.409 Y111.02 E.04908
G1 X158.876 Y111.02
G1 X157.711 Y112.185 E.04908
G1 X157.178 Y112.185
G1 X158.343 Y111.02 E.04908
G1 X157.81 Y111.02
G1 X156.644 Y112.185 E.04908
G1 X156.183 Y112.114
G1 X157.276 Y111.02 E.04607
G1 X156.743 Y111.02
G1 X156.183 Y111.58 E.02361
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X156.743 Y111.02 E-.30121
G1 X157.276 Y111.02 E-.20264
G1 X156.8 Y111.496 E-.25615
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 11/25
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
M106 S61.2
G17
G3 Z2.4 I1.217 J0 P1  F15000
; object ids of layer 11 start: 81,121
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
; object ids of this layer11 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X150.888 Y197.546 E1.9663
G1 X150.888 Y198.342 E.02559
G1 X88.944 Y198.342 E1.99189
G1 X88.944 Y145.546 E1.69772
G1 X150.888 Y145.546 E1.99189
G1 X150.888 Y146.342 E.02559
G1 X89.8 Y146.342 E1.96437
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X156.468 Y197.154 E1.97594
G1 X156.468 Y198.734 E.04706
G1 X88.552 Y198.734 E2.02301
G1 X88.552 Y145.154 E1.59597
G1 X156.468 Y145.154 E2.02301
G1 X156.468 Y146.734 E.04706
G1 X90.192 Y146.734 E1.97416
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z2.6 F15000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X150.684 Y145.944 E1.87801
; WIPE_START
G1 X148.684 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.261 Y145.871 Z2.6 F15000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X155.752 Y145.362 E.02146
G1 X155.218 Y145.362
G1 X156.261 Y146.404 E.04392
G1 X155.85 Y146.527
G1 X154.685 Y145.362 E.04908
G1 X154.152 Y145.362
G1 X155.317 Y146.527 E.04908
G1 X154.784 Y146.527
G1 X153.619 Y145.362 E.04908
G1 X153.085 Y145.362
G1 X154.251 Y146.527 E.04908
G1 X153.717 Y146.527
G1 X152.552 Y145.362 E.04908
G1 X152.019 Y145.362
G1 X153.184 Y146.527 E.04908
G1 X152.651 Y146.527
G1 X151.486 Y145.362 E.04908
G1 X151.11 Y145.52
G1 X152.118 Y146.527 E.04243
G1 X151.584 Y146.527
G1 X151.11 Y146.053 E.01997
; WIPE_START
M204 S5000
G1 X151.584 Y146.527 E-.25476
G1 X152.118 Y146.527 E-.20264
G1 X151.554 Y145.964 E-.30261
; WIPE_END
G1 E-.04 F1800
G1 X152.138 Y153.574 Z2.6 F15000
G1 X155.492 Y197.362 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X156.261 Y198.13 E.03238
G1 X156.124 Y198.527
G1 X154.959 Y197.362 E.04908
M73 P75 R4
G1 X154.426 Y197.362
G1 X155.591 Y198.527 E.04908
G1 X155.058 Y198.527
G1 X153.893 Y197.362 E.04908
G1 X153.359 Y197.362
G1 X154.525 Y198.527 E.04908
G1 X153.991 Y198.527
G1 X152.826 Y197.362 E.04908
G1 X152.293 Y197.362
G1 X153.458 Y198.527 E.04908
G1 X152.925 Y198.527
G1 X151.76 Y197.362 E.04908
G1 X151.226 Y197.362
G1 X152.392 Y198.527 E.04908
G1 X151.858 Y198.527
G1 X151.11 Y197.779 E.03151
M204 S5000
G1 X150.684 Y197.944 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.536 Y197.944 E1.87801
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00556
G1 X89.358 Y197.83 E.00278
; LINE_WIDTH: 0.448395
G1 X89.342 Y197.75 E.00263
; LINE_WIDTH: 0.43172
G1 X89.342 Y146.139 E1.5851
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00556
G1 X89.456 Y145.961 E.00278
; LINE_WIDTH: 0.448395
G1 X89.536 Y145.944 E.00263
; OBJECT_ID: 121
; WIPE_START
G1 X89.456 Y145.961 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X89.513 Y138.329 Z2.6 F15000
G1 X90.099 Y60 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X151.247 Y111.204 E1.9663
G1 X151.247 Y112 E.02559
G1 X89.303 Y112 E1.99189
G1 X89.303 Y59.204 E1.69772
G1 X151.247 Y59.204 E1.99189
G1 X151.247 Y60 E.02559
G1 X90.159 Y60 E1.96437
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X156.828 Y110.812 E1.97594
G1 X156.828 Y112.392 E.04706
G1 X88.911 Y112.392 E2.02301
G1 X88.911 Y58.812 E1.59597
G1 X156.828 Y58.812 E2.02301
G1 X156.828 Y60.392 E.04706
G1 X90.551 Y60.392 E1.97416
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z2.6 F15000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X151.044 Y59.602 E1.87801
; WIPE_START
G1 X149.044 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X156.62 Y59.529 Z2.6 F15000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X156.111 Y59.02 E.02146
G1 X155.578 Y59.02
G1 X156.62 Y60.062 E.04392
G1 X156.21 Y60.185
G1 X155.045 Y59.02 E.04908
G1 X154.511 Y59.02
G1 X155.677 Y60.185 E.04908
G1 X155.143 Y60.185
G1 X153.978 Y59.02 E.04908
G1 X153.445 Y59.02
G1 X154.61 Y60.185 E.04908
G1 X154.077 Y60.185
G1 X152.912 Y59.02 E.04908
G1 X152.378 Y59.02
G1 X153.543 Y60.185 E.04908
G1 X153.01 Y60.185
G1 X151.845 Y59.02 E.04908
G1 X151.47 Y59.178
G1 X152.477 Y60.185 E.04243
G1 X151.944 Y60.185
G1 X151.47 Y59.711 E.01997
; WIPE_START
M204 S5000
G1 X151.944 Y60.185 E-.25476
G1 X152.477 Y60.185 E-.20264
G1 X151.914 Y59.622 E-.30261
; WIPE_END
G1 E-.04 F1800
G1 X152.497 Y67.232 Z2.6 F15000
G1 X155.852 Y111.02 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X156.62 Y111.788 E.03238
G1 X156.484 Y112.185
G1 X155.319 Y111.02 E.04908
G1 X154.785 Y111.02
M73 P76 R4
G1 X155.951 Y112.185 E.04908
G1 X155.417 Y112.185
G1 X154.252 Y111.02 E.04908
G1 X153.719 Y111.02
G1 X154.884 Y112.185 E.04908
G1 X154.351 Y112.185
G1 X153.186 Y111.02 E.04908
G1 X152.652 Y111.02
G1 X153.818 Y112.185 E.04908
G1 X153.284 Y112.185
G1 X152.119 Y111.02 E.04908
G1 X151.586 Y111.02
G1 X152.751 Y112.185 E.04908
G1 X152.218 Y112.185
G1 X151.47 Y111.437 E.03151
M204 S5000
G1 X151.044 Y111.602 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.896 Y111.602 E1.87801
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00556
G1 X89.718 Y111.489 E.00278
; LINE_WIDTH: 0.448395
G1 X89.701 Y111.408 E.00263
; LINE_WIDTH: 0.43172
G1 X89.701 Y59.797 E1.5851
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00556
G1 X89.815 Y59.619 E.00278
; LINE_WIDTH: 0.448395
G1 X89.896 Y59.602 E.00263
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X89.815 Y59.619 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 12/25
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z2.6 I1.217 J0 P1  F15000
; object ids of layer 12 start: 81,121
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
; object ids of this layer12 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X146.175 Y197.546 E1.81475
G1 X146.175 Y198.342 E.02559
G1 X88.944 Y198.342 E1.84034
G1 X88.944 Y145.546 E1.69772
G1 X146.175 Y145.546 E1.84034
G1 X146.175 Y146.342 E.02559
G1 X89.8 Y146.342 E1.81282
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X151.756 Y197.154 E1.83556
G1 X151.756 Y198.734 E.04706
G1 X88.552 Y198.734 E1.88263
G1 X88.552 Y145.154 E1.59597
G1 X151.756 Y145.154 E1.88263
G1 X151.756 Y146.734 E.04706
G1 X90.192 Y146.734 E1.83378
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z2.8 F15000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X145.971 Y145.944 E1.73326
; WIPE_START
G1 X143.971 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.693 Y146.527 Z2.8 F15000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X151.548 Y145.672 E.03602
G1 X151.325 Y145.362
G1 X150.16 Y146.527 E.04908
G1 X149.627 Y146.527
G1 X150.792 Y145.362 E.04908
G1 X150.259 Y145.362
G1 X149.093 Y146.527 E.04908
G1 X148.56 Y146.527
G1 X149.725 Y145.362 E.04908
G1 X149.192 Y145.362
G1 X148.027 Y146.527 E.04908
G1 X147.494 Y146.527
G1 X148.659 Y145.362 E.04908
G1 X148.126 Y145.362
G1 X146.96 Y146.527 E.04908
G1 X146.427 Y146.527
G1 X147.592 Y145.362 E.04908
G1 X147.059 Y145.362
G1 X146.397 Y146.023 E.02787
; WIPE_START
M204 S5000
G1 X147.059 Y145.362 E-.35557
G1 X147.592 Y145.362 E-.20264
G1 X147.217 Y145.737 E-.2018
; WIPE_END
G1 E-.04 F1800
G1 X147.035 Y153.368 Z2.8 F15000
G1 X145.971 Y197.944 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.536 Y197.944 E1.73326
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00556
G1 X89.358 Y197.83 E.00278
; LINE_WIDTH: 0.448395
G1 X89.342 Y197.75 E.00263
; LINE_WIDTH: 0.43172
G1 X89.342 Y146.139 E1.5851
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00556
G1 X89.456 Y145.961 E.00278
; LINE_WIDTH: 0.448395
M73 P77 R4
G1 X89.536 Y145.944 E.00263
; WIPE_START
G1 X89.456 Y145.961 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.308 Y150.86 Z2.8 F15000
G1 X151.548 Y197.931 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X150.952 Y198.527 E.0251
G1 X150.419 Y198.527
G1 X151.548 Y197.398 E.04756
G1 X151.051 Y197.362
G1 X149.886 Y198.527 E.04908
G1 X149.353 Y198.527
G1 X150.518 Y197.362 E.04908
G1 X149.985 Y197.362
G1 X148.819 Y198.527 E.04908
G1 X148.286 Y198.527
G1 X149.451 Y197.362 E.04908
G1 X148.918 Y197.362
G1 X147.753 Y198.527 E.04908
G1 X147.22 Y198.527
G1 X148.385 Y197.362 E.04908
G1 X147.851 Y197.362
G1 X146.686 Y198.527 E.04908
G1 X146.397 Y198.283
G1 X147.318 Y197.362 E.03879
G1 X146.785 Y197.362
G1 X146.397 Y197.749 E.01633
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X146.785 Y197.362 E-.2083
G1 X147.318 Y197.362 E-.20264
G1 X146.669 Y198.011 E-.34906
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X143.774 Y190.949 Z2.8 F15000
G1 X90.099 Y60 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X146.534 Y111.204 E1.81475
G1 X146.534 Y112 E.02559
G1 X89.303 Y112 E1.84034
G1 X89.303 Y59.204 E1.69772
G1 X146.534 Y59.204 E1.84034
G1 X146.534 Y60 E.02559
G1 X90.159 Y60 E1.81282
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X152.115 Y110.812 E1.83556
G1 X152.115 Y112.392 E.04706
G1 X88.911 Y112.392 E1.88263
G1 X88.911 Y58.812 E1.59597
G1 X152.115 Y58.812 E1.88263
G1 X152.115 Y60.392 E.04706
G1 X90.551 Y60.392 E1.83378
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z2.8 F15000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X146.331 Y59.602 E1.73326
; WIPE_START
G1 X144.331 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X151.053 Y60.185 Z2.8 F15000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X151.908 Y59.33 E.03602
G1 X151.684 Y59.02
G1 X150.519 Y60.185 E.04908
G1 X149.986 Y60.185
G1 X151.151 Y59.02 E.04908
G1 X150.618 Y59.02
G1 X149.453 Y60.185 E.04908
G1 X148.919 Y60.185
G1 X150.085 Y59.02 E.04908
G1 X149.551 Y59.02
G1 X148.386 Y60.185 E.04908
G1 X147.853 Y60.185
G1 X149.018 Y59.02 E.04908
G1 X148.485 Y59.02
G1 X147.32 Y60.185 E.04908
G1 X146.786 Y60.185
G1 X147.952 Y59.02 E.04908
G1 X147.418 Y59.02
G1 X146.757 Y59.681 E.02787
; WIPE_START
M204 S5000
G1 X147.418 Y59.02 E-.35557
G1 X147.952 Y59.02 E-.20264
G1 X147.576 Y59.395 E-.2018
; WIPE_END
G1 E-.04 F1800
G1 X147.394 Y67.026 Z2.8 F15000
G1 X146.331 Y111.602 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.896 Y111.602 E1.73326
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00556
G1 X89.718 Y111.489 E.00278
; LINE_WIDTH: 0.448395
G1 X89.701 Y111.408 E.00263
; LINE_WIDTH: 0.43172
G1 X89.701 Y59.797 E1.5851
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00556
G1 X89.815 Y59.619 E.00278
; LINE_WIDTH: 0.448395
M73 P78 R4
G1 X89.896 Y59.602 E.00263
; WIPE_START
G1 X89.815 Y59.619 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.668 Y64.518 Z2.8 F15000
G1 X151.908 Y111.589 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X151.312 Y112.185 E.0251
G1 X150.778 Y112.185
G1 X151.908 Y111.056 E.04756
G1 X151.41 Y111.02
G1 X150.245 Y112.185 E.04908
G1 X149.712 Y112.185
G1 X150.877 Y111.02 E.04908
G1 X150.344 Y111.02
G1 X149.179 Y112.185 E.04908
G1 X148.645 Y112.185
G1 X149.811 Y111.02 E.04908
G1 X149.277 Y111.02
G1 X148.112 Y112.185 E.04908
G1 X147.579 Y112.185
G1 X148.744 Y111.02 E.04908
G1 X148.211 Y111.02
G1 X147.046 Y112.185 E.04908
G1 X146.757 Y111.941
G1 X147.678 Y111.02 E.03879
G1 X147.144 Y111.02
G1 X146.757 Y111.407 E.01633
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X147.144 Y111.02 E-.2083
G1 X147.678 Y111.02 E-.20264
G1 X147.028 Y111.669 E-.34906
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 13/25
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
M106 S68.85
G17
G3 Z2.8 I1.217 J0 P1  F15000
; object ids of layer 13 start: 81,121
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
; object ids of this layer13 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X141.462 Y197.546 E1.6632
G1 X141.462 Y198.342 E.02559
G1 X88.944 Y198.342 E1.6888
G1 X88.944 Y145.546 E1.69772
G1 X141.462 Y145.546 E1.6888
G1 X141.462 Y146.342 E.02559
G1 X89.8 Y146.342 E1.66127
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X147.043 Y197.154 E1.69518
G1 X147.043 Y198.734 E.04706
G1 X88.552 Y198.734 E1.74225
G1 X88.552 Y145.154 E1.59597
G1 X147.043 Y145.154 E1.74225
G1 X147.043 Y146.734 E.04706
G1 X90.192 Y146.734 E1.6934
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z3 F15000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X141.258 Y145.944 E1.58852
; WIPE_START
G1 X139.258 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.835 Y146.044 Z3 F15000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X146.153 Y145.362 E.02874
G1 X145.62 Y145.362
G1 X146.785 Y146.527 E.04908
G1 X146.252 Y146.527
G1 X145.086 Y145.362 E.04908
G1 X144.553 Y145.362
G1 X145.718 Y146.527 E.04908
G1 X145.185 Y146.527
G1 X144.02 Y145.362 E.04908
G1 X143.487 Y145.362
G1 X144.652 Y146.527 E.04908
G1 X144.119 Y146.527
G1 X142.953 Y145.362 E.04908
G1 X142.42 Y145.362
G1 X143.585 Y146.527 E.04908
G1 X143.052 Y146.527
G1 X141.887 Y145.362 E.04908
G1 X141.684 Y145.693
G1 X142.519 Y146.527 E.03515
; WIPE_START
M204 S5000
G1 X141.684 Y145.693 E-.44842
G1 X141.887 Y145.362 E-.14738
G1 X142.192 Y145.667 E-.1642
; WIPE_END
G1 E-.04 F1800
G1 X142.87 Y153.27 Z3 F15000
G1 X146.835 Y197.77 Z3
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X146.427 Y197.362 E.0172
G1 X145.894 Y197.362
G1 X146.835 Y198.303 E.03966
G1 X146.526 Y198.527
G1 X145.361 Y197.362 E.04908
G1 X144.827 Y197.362
G1 X145.992 Y198.527 E.04908
G1 X145.459 Y198.527
G1 X144.294 Y197.362 E.04908
M73 P79 R4
G1 X143.761 Y197.362
G1 X144.926 Y198.527 E.04908
G1 X144.393 Y198.527
G1 X143.227 Y197.362 E.04908
G1 X142.694 Y197.362
G1 X143.859 Y198.527 E.04908
G1 X143.326 Y198.527
G1 X142.161 Y197.362 E.04908
G1 X141.684 Y197.418
G1 X142.793 Y198.527 E.04669
G1 X142.26 Y198.527
G1 X141.684 Y197.952 E.02423
M204 S5000
G1 X141.258 Y197.944 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.536 Y197.944 E1.58852
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00556
G1 X89.358 Y197.83 E.00278
; LINE_WIDTH: 0.448395
G1 X89.342 Y197.75 E.00263
; LINE_WIDTH: 0.43172
G1 X89.342 Y146.139 E1.5851
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00556
G1 X89.456 Y145.961 E.00278
; LINE_WIDTH: 0.448395
G1 X89.536 Y145.944 E.00263
; OBJECT_ID: 121
; WIPE_START
G1 X89.456 Y145.961 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X89.513 Y138.329 Z3 F15000
G1 X90.099 Y60 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X141.821 Y111.204 E1.6632
G1 X141.821 Y112 E.02559
G1 X89.303 Y112 E1.6888
G1 X89.303 Y59.204 E1.69772
G1 X141.821 Y59.204 E1.6888
G1 X141.821 Y60 E.02559
G1 X90.159 Y60 E1.66127
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P79 R3
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X147.402 Y110.812 E1.69518
G1 X147.402 Y112.392 E.04706
G1 X88.911 Y112.392 E1.74225
G1 X88.911 Y58.812 E1.59597
G1 X147.402 Y58.812 E1.74225
G1 X147.402 Y60.392 E.04706
G1 X90.551 Y60.392 E1.6934
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z3 F15000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X141.618 Y59.602 E1.58852
; WIPE_START
G1 X139.618 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.195 Y59.702 Z3 F15000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X146.512 Y59.02 E.02874
G1 X145.979 Y59.02
G1 X147.144 Y60.185 E.04908
G1 X146.611 Y60.185
G1 X145.446 Y59.02 E.04908
G1 X144.913 Y59.02
G1 X146.078 Y60.185 E.04908
G1 X145.545 Y60.185
G1 X144.379 Y59.02 E.04908
G1 X143.846 Y59.02
G1 X145.011 Y60.185 E.04908
G1 X144.478 Y60.185
G1 X143.313 Y59.02 E.04908
G1 X142.78 Y59.02
G1 X143.945 Y60.185 E.04908
G1 X143.412 Y60.185
G1 X142.246 Y59.02 E.04908
G1 X142.044 Y59.351
G1 X142.878 Y60.185 E.03515
; WIPE_START
M204 S5000
G1 X142.044 Y59.351 E-.44842
G1 X142.246 Y59.02 E-.14738
G1 X142.552 Y59.325 E-.1642
; WIPE_END
G1 E-.04 F1800
G1 X143.229 Y66.928 Z3 F15000
G1 X147.195 Y111.428 Z3
G1 Z2.6
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X146.786 Y111.02 E.0172
G1 X146.253 Y111.02
G1 X147.195 Y111.961 E.03966
G1 X146.885 Y112.185
G1 X145.72 Y111.02 E.04908
G1 X145.187 Y111.02
G1 X146.352 Y112.185 E.04908
G1 X145.819 Y112.185
G1 X144.653 Y111.02 E.04908
G1 X144.12 Y111.02
G1 X145.285 Y112.185 E.04908
G1 X144.752 Y112.185
G1 X143.587 Y111.02 E.04908
G1 X143.054 Y111.02
G1 X144.219 Y112.185 E.04908
G1 X143.686 Y112.185
G1 X142.52 Y111.02 E.04908
G1 X142.044 Y111.077
G1 X143.152 Y112.185 E.04669
G1 X142.619 Y112.185
M73 P80 R3
G1 X142.044 Y111.61 E.02423
M204 S5000
G1 X141.618 Y111.602 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.896 Y111.602 E1.58852
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00556
G1 X89.718 Y111.489 E.00278
; LINE_WIDTH: 0.448395
G1 X89.701 Y111.408 E.00263
; LINE_WIDTH: 0.43172
G1 X89.701 Y59.797 E1.5851
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00556
G1 X89.815 Y59.619 E.00278
; LINE_WIDTH: 0.448395
G1 X89.896 Y59.602 E.00263
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X89.815 Y59.619 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 14/25
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
M106 S71.4
G17
G3 Z3 I1.217 J0 P1  F15000
; object ids of layer 14 start: 81,121
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
; object ids of this layer14 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X136.749 Y197.546 E1.51165
G1 X136.749 Y198.342 E.02559
G1 X88.944 Y198.342 E1.53725
G1 X88.944 Y145.546 E1.69772
G1 X136.749 Y145.546 E1.53725
G1 X136.749 Y146.342 E.02559
G1 X89.8 Y146.342 E1.50972
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X142.33 Y197.154 E1.5548
G1 X142.33 Y198.734 E.04706
G1 X88.552 Y198.734 E1.60186
G1 X88.552 Y145.154 E1.59597
G1 X142.33 Y145.154 E1.60186
G1 X142.33 Y146.734 E.04706
G1 X90.192 Y146.734 E1.55301
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z3.2 F15000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X136.546 Y145.944 E1.44377
; WIPE_START
G1 X134.546 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.122 Y146.032 Z3.2 F15000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X141.628 Y146.527 E.02084
G1 X141.094 Y146.527
G1 X142.122 Y145.499 E.0433
G1 X141.726 Y145.362
G1 X140.561 Y146.527 E.04908
G1 X140.028 Y146.527
G1 X141.193 Y145.362 E.04908
G1 X140.66 Y145.362
G1 X139.495 Y146.527 E.04908
G1 X138.961 Y146.527
G1 X140.127 Y145.362 E.04908
G1 X139.593 Y145.362
G1 X138.428 Y146.527 E.04908
G1 X137.895 Y146.527
G1 X139.06 Y145.362 E.04908
G1 X138.527 Y145.362
G1 X137.362 Y146.527 E.04908
G1 X136.972 Y146.384
G1 X137.994 Y145.362 E.04305
G1 X137.46 Y145.362
G1 X136.972 Y145.85 E.02059
; WIPE_START
M204 S5000
G1 X137.46 Y145.362 E-.26266
G1 X137.994 Y145.362 E-.20264
G1 X137.445 Y145.91 E-.2947
; WIPE_END
G1 E-.04 F1800
G1 X129.813 Y145.916 Z3.2 F15000
G1 X89.536 Y145.944 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.456 Y145.961 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00278
G1 X89.342 Y146.139 E.00556
; LINE_WIDTH: 0.43172
G1 X89.342 Y197.75 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.358 Y197.83 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00278
G1 X89.536 Y197.944 E.00556
; LINE_WIDTH: 0.43172
G1 X136.546 Y197.944 E1.44377
; WIPE_START
G1 X134.546 Y197.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.354 Y198.527 Z3.2 F15000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X142.122 Y197.758 E.03238
G1 X141.986 Y197.362
G1 X140.82 Y198.527 E.04908
G1 X140.287 Y198.527
G1 X141.452 Y197.362 E.04908
G1 X140.919 Y197.362
G1 X139.754 Y198.527 E.04908
G1 X139.221 Y198.527
G1 X140.386 Y197.362 E.04908
G1 X139.853 Y197.362
G1 X138.687 Y198.527 E.04908
G1 X138.154 Y198.527
G1 X139.319 Y197.362 E.04908
G1 X138.786 Y197.362
G1 X137.621 Y198.527 E.04908
G1 X137.088 Y198.527
G1 X138.253 Y197.362 E.04908
G1 X137.72 Y197.362
G1 X136.972 Y198.11 E.03151
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X137.72 Y197.362 E-.40197
G1 X138.253 Y197.362 E-.20264
G1 X137.964 Y197.651 E-.1554
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X135.457 Y190.442 Z3.2 F15000
G1 X90.099 Y60 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X137.109 Y111.204 E1.51165
G1 X137.109 Y112 E.02559
G1 X89.303 Y112 E1.53725
G1 X89.303 Y59.204 E1.69772
G1 X137.109 Y59.204 E1.53725
G1 X137.109 Y60 E.02559
G1 X90.159 Y60 E1.50972
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X142.689 Y110.812 E1.5548
M73 P81 R3
G1 X142.689 Y112.392 E.04706
G1 X88.911 Y112.392 E1.60186
G1 X88.911 Y58.812 E1.59597
G1 X142.689 Y58.812 E1.60186
G1 X142.689 Y60.392 E.04706
G1 X90.551 Y60.392 E1.55301
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z3.2 F15000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X136.905 Y59.602 E1.44377
; WIPE_START
G1 X134.905 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X142.482 Y59.69 Z3.2 F15000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X141.987 Y60.185 E.02084
G1 X141.454 Y60.185
G1 X142.482 Y59.157 E.0433
G1 X142.086 Y59.02
G1 X140.921 Y60.185 E.04908
G1 X140.387 Y60.185
G1 X141.553 Y59.02 E.04908
G1 X141.019 Y59.02
G1 X139.854 Y60.185 E.04908
G1 X139.321 Y60.185
G1 X140.486 Y59.02 E.04908
G1 X139.953 Y59.02
G1 X138.788 Y60.185 E.04908
G1 X138.254 Y60.185
G1 X139.42 Y59.02 E.04908
G1 X138.886 Y59.02
G1 X137.721 Y60.185 E.04908
G1 X137.331 Y60.042
G1 X138.353 Y59.02 E.04305
G1 X137.82 Y59.02
G1 X137.331 Y59.509 E.02059
; WIPE_START
M204 S5000
G1 X137.82 Y59.02 E-.26266
G1 X138.353 Y59.02 E-.20264
G1 X137.805 Y59.568 E-.2947
; WIPE_END
G1 E-.04 F1800
G1 X130.172 Y59.574 Z3.2 F15000
G1 X89.896 Y59.602 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.815 Y59.619 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00278
G1 X89.701 Y59.797 E.00556
; LINE_WIDTH: 0.43172
G1 X89.701 Y111.408 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.718 Y111.489 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00278
G1 X89.896 Y111.602 E.00556
; LINE_WIDTH: 0.43172
G1 X136.905 Y111.602 E1.44377
; WIPE_START
G1 X134.905 Y111.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.713 Y112.185 Z3.2 F15000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X142.482 Y111.416 E.03238
G1 X142.345 Y111.02
G1 X141.18 Y112.185 E.04908
G1 X140.647 Y112.185
G1 X141.812 Y111.02 E.04908
G1 X141.279 Y111.02
G1 X140.113 Y112.185 E.04908
G1 X139.58 Y112.185
G1 X140.745 Y111.02 E.04908
G1 X140.212 Y111.02
G1 X139.047 Y112.185 E.04908
G1 X138.514 Y112.185
G1 X139.679 Y111.02 E.04908
G1 X139.146 Y111.02
G1 X137.98 Y112.185 E.04908
G1 X137.447 Y112.185
G1 X138.612 Y111.02 E.04908
G1 X138.079 Y111.02
G1 X137.331 Y111.768 E.03151
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X138.079 Y111.02 E-.40197
G1 X138.612 Y111.02 E-.20264
G1 X138.323 Y111.309 E-.1554
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 15/25
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
M106 S76.5
G17
G3 Z3.2 I1.217 J0 P1  F15000
; object ids of layer 15 start: 81,121
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
; object ids of this layer15 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X132.036 Y197.546 E1.36011
G1 X132.036 Y198.342 E.02559
G1 X88.944 Y198.342 E1.3857
G1 X88.944 Y145.546 E1.69772
G1 X132.036 Y145.546 E1.3857
G1 X132.036 Y146.342 E.02559
G1 X89.8 Y146.342 E1.35818
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X137.617 Y197.154 E1.41442
G1 X137.617 Y198.734 E.04706
G1 X88.552 Y198.734 E1.46148
G1 X88.552 Y145.154 E1.59597
G1 X137.617 Y145.154 E1.46148
G1 X137.617 Y146.734 E.04706
G1 X90.192 Y146.734 E1.41263
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z3.4 F15000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.456 Y145.961 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00278
G1 X89.342 Y146.139 E.00556
; LINE_WIDTH: 0.43172
G1 X89.342 Y197.75 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.358 Y197.83 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00278
M73 P82 R3
G1 X89.536 Y197.944 E.00556
; LINE_WIDTH: 0.43172
G1 X131.833 Y197.944 E1.29903
; WIPE_START
G1 X129.833 Y197.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.41 Y197.943 Z3.4 F15000
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X136.828 Y197.362 E.02448
G1 X136.295 Y197.362
G1 X137.41 Y198.476 E.04694
G1 X136.927 Y198.527
G1 X135.762 Y197.362 E.04908
G1 X135.229 Y197.362
G1 X136.394 Y198.527 E.04908
G1 X135.861 Y198.527
G1 X134.695 Y197.362 E.04908
G1 X134.162 Y197.362
G1 X135.327 Y198.527 E.04908
G1 X134.794 Y198.527
G1 X133.629 Y197.362 E.04908
G1 X133.096 Y197.362
G1 X134.261 Y198.527 E.04908
G1 X133.728 Y198.527
G1 X132.562 Y197.362 E.04908
G1 X132.259 Y197.591
G1 X133.194 Y198.527 E.03941
G1 X132.661 Y198.527
G1 X132.259 Y198.125 E.01695
; WIPE_START
M204 S5000
G1 X132.661 Y198.527 E-.2162
G1 X133.194 Y198.527 E-.20264
G1 X132.559 Y197.892 E-.34117
; WIPE_END
G1 E-.04 F1800
G1 X132.453 Y190.26 Z3.4 F15000
G1 X131.833 Y145.944 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.536 Y145.944 E1.29903
; WIPE_START
G1 X91.536 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.168 Y145.846 Z3.4 F15000
G1 X136.554 Y145.362 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X137.41 Y146.217 E.03602
G1 X137.186 Y146.527
G1 X136.021 Y145.362 E.04908
G1 X135.488 Y145.362
G1 X136.653 Y146.527 E.04908
G1 X136.12 Y146.527
G1 X134.955 Y145.362 E.04908
G1 X134.421 Y145.362
G1 X135.587 Y146.527 E.04908
G1 X135.053 Y146.527
G1 X133.888 Y145.362 E.04908
G1 X133.355 Y145.362
G1 X134.52 Y146.527 E.04908
G1 X133.987 Y146.527
G1 X132.822 Y145.362 E.04908
G1 X132.288 Y145.362
G1 X133.454 Y146.527 E.04908
G1 X132.92 Y146.527
G1 X132.259 Y145.865 E.02787
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X132.92 Y146.527 E-.3555
G1 X133.454 Y146.527 E-.20264
G1 X133.078 Y146.151 E-.20186
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X129.671 Y139.322 Z3.4 F15000
G1 X90.099 Y60 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X132.396 Y111.204 E1.36011
G1 X132.396 Y112 E.02559
G1 X89.303 Y112 E1.3857
G1 X89.303 Y59.204 E1.69772
G1 X132.396 Y59.204 E1.3857
G1 X132.396 Y60 E.02559
G1 X90.159 Y60 E1.35818
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X137.976 Y110.812 E1.41442
G1 X137.976 Y112.392 E.04706
G1 X88.911 Y112.392 E1.46148
G1 X88.911 Y58.812 E1.59597
G1 X137.976 Y58.812 E1.46148
G1 X137.976 Y60.392 E.04706
G1 X90.551 Y60.392 E1.41263
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z3.4 F15000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.815 Y59.619 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00278
G1 X89.701 Y59.797 E.00556
; LINE_WIDTH: 0.43172
G1 X89.701 Y111.408 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.718 Y111.489 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00278
G1 X89.896 Y111.602 E.00556
; LINE_WIDTH: 0.43172
G1 X132.192 Y111.602 E1.29903
; WIPE_START
G1 X130.192 Y111.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.769 Y111.601 Z3.4 F15000
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X137.188 Y111.02 E.02448
G1 X136.655 Y111.02
G1 X137.769 Y112.134 E.04694
G1 X137.287 Y112.185
G1 X136.121 Y111.02 E.04908
G1 X135.588 Y111.02
G1 X136.753 Y112.185 E.04908
G1 X136.22 Y112.185
G1 X135.055 Y111.02 E.04908
G1 X134.522 Y111.02
G1 X135.687 Y112.185 E.04908
G1 X135.154 Y112.185
G1 X133.988 Y111.02 E.04908
G1 X133.455 Y111.02
M73 P83 R3
G1 X134.62 Y112.185 E.04908
G1 X134.087 Y112.185
G1 X132.922 Y111.02 E.04908
G1 X132.618 Y111.249
G1 X133.554 Y112.185 E.03941
G1 X133.02 Y112.185
G1 X132.618 Y111.783 E.01695
; WIPE_START
M204 S5000
G1 X133.02 Y112.185 E-.2162
G1 X133.554 Y112.185 E-.20264
G1 X132.919 Y111.55 E-.34117
; WIPE_END
G1 E-.04 F1800
G1 X132.812 Y103.918 Z3.4 F15000
G1 X132.192 Y59.602 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.896 Y59.602 E1.29903
; WIPE_START
G1 X91.896 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.527 Y59.504 Z3.4 F15000
G1 X136.914 Y59.02 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X137.769 Y59.875 E.03602
G1 X137.546 Y60.185
G1 X136.381 Y59.02 E.04908
G1 X135.847 Y59.02
G1 X137.013 Y60.185 E.04908
G1 X136.479 Y60.185
G1 X135.314 Y59.02 E.04908
G1 X134.781 Y59.02
G1 X135.946 Y60.185 E.04908
G1 X135.413 Y60.185
G1 X134.248 Y59.02 E.04908
G1 X133.714 Y59.02
G1 X134.879 Y60.185 E.04908
G1 X134.346 Y60.185
G1 X133.181 Y59.02 E.04908
G1 X132.648 Y59.02
G1 X133.813 Y60.185 E.04908
G1 X133.28 Y60.185
G1 X132.618 Y59.523 E.02787
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X133.28 Y60.185 E-.3555
G1 X133.813 Y60.185 E-.20264
G1 X133.437 Y59.809 E-.20186
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 16/25
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
M106 S79.05
G17
G3 Z3.4 I1.217 J0 P1  F15000
; object ids of layer 16 start: 81,121
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
; object ids of this layer16 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X127.323 Y197.546 E1.20856
G1 X127.323 Y198.342 E.02559
G1 X88.944 Y198.342 E1.23415
G1 X88.944 Y145.546 E1.69772
G1 X127.323 Y145.546 E1.23415
G1 X127.323 Y146.342 E.02559
G1 X89.8 Y146.342 E1.20663
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X132.904 Y197.154 E1.27404
G1 X132.904 Y198.734 E.04706
G1 X88.552 Y198.734 E1.3211
G1 X88.552 Y145.154 E1.59597
G1 X132.904 Y145.154 E1.3211
G1 X132.904 Y146.734 E.04706
G1 X90.192 Y146.734 E1.27225
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z3.6 F15000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X127.12 Y145.944 E1.15429
; WIPE_START
G1 X125.12 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.697 Y145.859 Z3.6 F15000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X132.029 Y146.527 E.02812
G1 X131.496 Y146.527
G1 X132.661 Y145.362 E.04908
G1 X132.128 Y145.362
G1 X130.963 Y146.527 E.04908
G1 X130.429 Y146.527
G1 X131.595 Y145.362 E.04908
G1 X131.061 Y145.362
G1 X129.896 Y146.527 E.04908
G1 X129.363 Y146.527
G1 X130.528 Y145.362 E.04908
G1 X129.995 Y145.362
G1 X128.83 Y146.527 E.04908
G1 X128.296 Y146.527
G1 X129.462 Y145.362 E.04908
G1 X128.928 Y145.362
G1 X127.763 Y146.527 E.04908
G1 X127.546 Y146.211
G1 X128.395 Y145.362 E.03577
; WIPE_START
M204 S5000
G1 X127.546 Y146.211 E-.45633
G1 X127.763 Y146.527 E-.14573
G1 X128.057 Y146.233 E-.15794
; WIPE_END
G1 E-.04 F1800
G1 X120.425 Y146.176 Z3.6 F15000
G1 X89.536 Y145.944 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.456 Y145.961 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00278
M73 P84 R3
G1 X89.342 Y146.139 E.00556
; LINE_WIDTH: 0.43172
G1 X89.342 Y197.75 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.358 Y197.83 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00278
G1 X89.536 Y197.944 E.00556
; LINE_WIDTH: 0.43172
G1 X127.12 Y197.944 E1.15429
; WIPE_START
G1 X125.12 Y197.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.697 Y198.119 Z3.6 F15000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X132.288 Y198.527 E.0172
G1 X131.755 Y198.527
G1 X132.697 Y197.585 E.03966
G1 X132.387 Y197.362
G1 X131.222 Y198.527 E.04908
G1 X130.689 Y198.527
G1 X131.854 Y197.362 E.04908
G1 X131.321 Y197.362
G1 X130.155 Y198.527 E.04908
G1 X129.622 Y198.527
G1 X130.787 Y197.362 E.04908
G1 X130.254 Y197.362
G1 X129.089 Y198.527 E.04908
G1 X128.556 Y198.527
G1 X129.721 Y197.362 E.04908
G1 X129.187 Y197.362
G1 X128.022 Y198.527 E.04908
G1 X127.546 Y198.47
G1 X128.654 Y197.362 E.04669
G1 X128.121 Y197.362
G1 X127.546 Y197.937 E.02423
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X128.121 Y197.362 E-.30905
G1 X128.654 Y197.362 E-.20264
G1 X128.192 Y197.824 E-.24831
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X126.159 Y190.467 Z3.6 F15000
G1 X90.099 Y60 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X127.683 Y111.204 E1.20856
G1 X127.683 Y112 E.02559
G1 X89.303 Y112 E1.23415
G1 X89.303 Y59.204 E1.69772
M73 P84 R2
G1 X127.683 Y59.204 E1.23415
G1 X127.683 Y60 E.02559
G1 X90.159 Y60 E1.20663
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X133.263 Y110.812 E1.27404
G1 X133.263 Y112.392 E.04706
G1 X88.911 Y112.392 E1.3211
G1 X88.911 Y58.812 E1.59597
G1 X133.263 Y58.812 E1.3211
G1 X133.263 Y60.392 E.04706
G1 X90.551 Y60.392 E1.27225
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z3.6 F15000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X127.479 Y59.602 E1.15429
; WIPE_START
G1 X125.479 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.056 Y59.517 Z3.6 F15000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X132.389 Y60.185 E.02812
G1 X131.855 Y60.185
G1 X133.02 Y59.02 E.04908
G1 X132.487 Y59.02
G1 X131.322 Y60.185 E.04908
G1 X130.789 Y60.185
G1 X131.954 Y59.02 E.04908
G1 X131.421 Y59.02
G1 X130.255 Y60.185 E.04908
G1 X129.722 Y60.185
G1 X130.887 Y59.02 E.04908
G1 X130.354 Y59.02
G1 X129.189 Y60.185 E.04908
G1 X128.656 Y60.185
G1 X129.821 Y59.02 E.04908
G1 X129.288 Y59.02
G1 X128.122 Y60.185 E.04908
G1 X127.905 Y59.869
G1 X128.754 Y59.02 E.03577
; WIPE_START
M204 S5000
G1 X127.905 Y59.869 E-.45633
G1 X128.122 Y60.185 E-.14573
G1 X128.416 Y59.891 E-.15794
; WIPE_END
G1 E-.04 F1800
G1 X120.784 Y59.834 Z3.6 F15000
G1 X89.896 Y59.602 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.815 Y59.619 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00278
G1 X89.701 Y59.797 E.00556
; LINE_WIDTH: 0.43172
G1 X89.701 Y111.408 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.718 Y111.489 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00278
G1 X89.896 Y111.602 E.00556
; LINE_WIDTH: 0.43172
M73 P85 R2
G1 X127.479 Y111.602 E1.15429
; WIPE_START
G1 X125.479 Y111.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.056 Y111.777 Z3.6 F15000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X132.648 Y112.185 E.0172
G1 X132.114 Y112.185
G1 X133.056 Y111.243 E.03966
G1 X132.746 Y111.02
G1 X131.581 Y112.185 E.04908
G1 X131.048 Y112.185
G1 X132.213 Y111.02 E.04908
G1 X131.68 Y111.02
G1 X130.515 Y112.185 E.04908
G1 X129.981 Y112.185
G1 X131.147 Y111.02 E.04908
G1 X130.613 Y111.02
G1 X129.448 Y112.185 E.04908
G1 X128.915 Y112.185
G1 X130.08 Y111.02 E.04908
G1 X129.547 Y111.02
G1 X128.382 Y112.185 E.04908
G1 X127.905 Y112.128
G1 X129.014 Y111.02 E.04669
G1 X128.48 Y111.02
G1 X127.905 Y111.595 E.02423
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X128.48 Y111.02 E-.30905
G1 X129.014 Y111.02 E-.20264
G1 X128.552 Y111.482 E-.24831
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 17/25
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
M106 S84.15
G17
G3 Z3.6 I1.217 J0 P1  F15000
; object ids of layer 17 start: 81,121
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
; object ids of this layer17 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X122.611 Y197.546 E1.05701
G1 X122.611 Y198.342 E.02559
G1 X88.944 Y198.342 E1.0826
G1 X88.944 Y145.546 E1.69772
G1 X122.611 Y145.546 E1.0826
G1 X122.611 Y146.342 E.02559
G1 X89.8 Y146.342 E1.05508
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X128.191 Y197.154 E1.13366
G1 X128.191 Y198.734 E.04706
G1 X88.552 Y198.734 E1.18072
G1 X88.552 Y145.154 E1.59597
G1 X128.191 Y145.154 E1.18072
G1 X128.191 Y146.734 E.04706
G1 X90.192 Y146.734 E1.13187
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z3.8 F15000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X122.407 Y145.944 E1.00954
; WIPE_START
G1 X120.407 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.984 Y145.856 Z3.8 F15000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X127.489 Y145.362 E.02084
G1 X126.956 Y145.362
G1 X127.984 Y146.39 E.0433
G1 X127.588 Y146.527
G1 X126.422 Y145.362 E.04908
G1 X125.889 Y145.362
G1 X127.054 Y146.527 E.04908
G1 X126.521 Y146.527
G1 X125.356 Y145.362 E.04908
G1 X124.823 Y145.362
G1 X125.988 Y146.527 E.04908
G1 X125.455 Y146.527
G1 X124.289 Y145.362 E.04908
G1 X123.756 Y145.362
G1 X124.921 Y146.527 E.04908
G1 X124.388 Y146.527
G1 X123.223 Y145.362 E.04908
G1 X122.833 Y145.505
G1 X123.855 Y146.527 E.04305
G1 X123.322 Y146.527
G1 X122.833 Y146.038 E.02058
; WIPE_START
M204 S5000
G1 X123.322 Y146.527 E-.2626
G1 X123.855 Y146.527 E-.20264
G1 X123.306 Y145.978 E-.29476
; WIPE_END
G1 E-.04 F1800
G1 X115.674 Y145.971 Z3.8 F15000
G1 X89.536 Y145.944 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.456 Y145.961 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00278
G1 X89.342 Y146.139 E.00556
; LINE_WIDTH: 0.43172
G1 X89.342 Y197.75 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.358 Y197.83 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00278
G1 X89.536 Y197.944 E.00556
; LINE_WIDTH: 0.43172
G1 X122.407 Y197.944 E1.00954
; WIPE_START
G1 X120.407 Y197.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.984 Y198.116 Z3.8 F15000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X127.23 Y197.362 E.03176
G1 X126.697 Y197.362
G1 X127.862 Y198.527 E.04908
G1 X127.328 Y198.527
G1 X126.163 Y197.362 E.04908
G1 X125.63 Y197.362
G1 X126.795 Y198.527 E.04908
G1 X126.262 Y198.527
G1 X125.097 Y197.362 E.04908
G1 X124.563 Y197.362
G1 X125.729 Y198.527 E.04908
G1 X125.195 Y198.527
G1 X124.03 Y197.362 E.04908
G1 X123.497 Y197.362
G1 X124.662 Y198.527 E.04908
G1 X124.129 Y198.527
G1 X122.964 Y197.362 E.04908
G1 X122.833 Y197.764
G1 X123.596 Y198.527 E.03213
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X122.833 Y197.764 E-.40987
G1 X122.964 Y197.362 E-.16083
G1 X123.316 Y197.714 E-.1893
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X121.526 Y190.294 Z3.8 F15000
G1 X90.099 Y60 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X122.97 Y111.204 E1.05701
G1 X122.97 Y112 E.02559
G1 X89.303 Y112 E1.0826
G1 X89.303 Y59.204 E1.69772
M73 P86 R2
G1 X122.97 Y59.204 E1.0826
G1 X122.97 Y60 E.02559
G1 X90.159 Y60 E1.05508
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X128.551 Y110.812 E1.13366
G1 X128.551 Y112.392 E.04706
G1 X88.911 Y112.392 E1.18072
G1 X88.911 Y58.812 E1.59597
G1 X128.551 Y58.812 E1.18072
G1 X128.551 Y60.392 E.04706
G1 X90.551 Y60.392 E1.13187
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z3.8 F15000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X122.766 Y59.602 E1.00954
; WIPE_START
G1 X120.766 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.343 Y59.515 Z3.8 F15000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X127.848 Y59.02 E.02084
G1 X127.315 Y59.02
G1 X128.343 Y60.048 E.0433
G1 X127.947 Y60.185
G1 X126.782 Y59.02 E.04908
G1 X126.249 Y59.02
G1 X127.414 Y60.185 E.04908
G1 X126.881 Y60.185
G1 X125.715 Y59.02 E.04908
G1 X125.182 Y59.02
G1 X126.347 Y60.185 E.04908
G1 X125.814 Y60.185
G1 X124.649 Y59.02 E.04908
G1 X124.116 Y59.02
G1 X125.281 Y60.185 E.04908
G1 X124.748 Y60.185
G1 X123.582 Y59.02 E.04908
G1 X123.192 Y59.163
G1 X124.214 Y60.185 E.04305
G1 X123.681 Y60.185
G1 X123.192 Y59.696 E.02058
; WIPE_START
M204 S5000
G1 X123.681 Y60.185 E-.2626
G1 X124.214 Y60.185 E-.20264
G1 X123.666 Y59.636 E-.29476
; WIPE_END
G1 E-.04 F1800
G1 X116.033 Y59.629 Z3.8 F15000
G1 X89.896 Y59.602 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.815 Y59.619 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00278
G1 X89.701 Y59.797 E.00556
; LINE_WIDTH: 0.43172
G1 X89.701 Y111.408 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.718 Y111.489 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00278
G1 X89.896 Y111.602 E.00556
; LINE_WIDTH: 0.43172
G1 X122.766 Y111.602 E1.00954
; WIPE_START
G1 X120.766 Y111.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.343 Y111.774 Z3.8 F15000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X127.589 Y111.02 E.03176
G1 X127.056 Y111.02
G1 X128.221 Y112.185 E.04908
G1 X127.688 Y112.185
G1 X126.523 Y111.02 E.04908
G1 X125.989 Y111.02
G1 X127.155 Y112.185 E.04908
G1 X126.621 Y112.185
G1 X125.456 Y111.02 E.04908
G1 X124.923 Y111.02
G1 X126.088 Y112.185 E.04908
G1 X125.555 Y112.185
G1 X124.39 Y111.02 E.04908
G1 X123.856 Y111.02
G1 X125.022 Y112.185 E.04908
G1 X124.488 Y112.185
G1 X123.323 Y111.02 E.04908
G1 X123.192 Y111.422
G1 X123.955 Y112.185 E.03213
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X123.192 Y111.422 E-.40987
G1 X123.323 Y111.02 E-.16083
G1 X123.675 Y111.372 E-.1893
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 18/25
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
M106 S89.25
G17
G3 Z3.8 I1.217 J0 P1  F15000
; object ids of layer 18 start: 81,121
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
; object ids of this layer18 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X117.898 Y197.546 E.90546
G1 X117.898 Y198.342 E.02559
G1 X88.944 Y198.342 E.93105
G1 X88.944 Y145.546 E1.69772
G1 X117.898 Y145.546 E.93105
G1 X117.898 Y146.342 E.02559
G1 X89.8 Y146.342 E.90353
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X123.478 Y197.154 E.99328
G1 X123.478 Y198.734 E.04706
G1 X88.552 Y198.734 E1.04034
G1 X88.552 Y145.154 E1.59597
G1 X123.478 Y145.154 E1.04034
G1 X123.478 Y146.734 E.04706
G1 X90.192 Y146.734 E.99149
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z4 F15000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X117.694 Y145.944 E.8648
; WIPE_START
G1 X115.694 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.43 Y146.527 Z4 F15000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X123.271 Y145.687 E.0354
G1 X123.062 Y145.362
G1 X121.897 Y146.527 E.04909
G1 X121.364 Y146.527
G1 X122.529 Y145.362 E.04908
G1 X121.996 Y145.362
G1 X120.831 Y146.527 E.04908
G1 X120.297 Y146.527
G1 X121.463 Y145.362 E.04908
G1 X120.929 Y145.362
G1 X119.764 Y146.527 E.04908
G1 X119.231 Y146.527
G1 X120.396 Y145.362 E.04908
G1 X119.863 Y145.362
G1 X118.698 Y146.527 E.04908
G1 X118.164 Y146.527
G1 X119.33 Y145.362 E.04908
G1 X118.796 Y145.362
G1 X118.12 Y146.038 E.02849
; WIPE_START
M204 S5000
G1 X118.796 Y145.362 E-.36342
M73 P87 R2
G1 X119.33 Y145.362 E-.20264
G1 X118.969 Y145.723 E-.19395
; WIPE_END
G1 E-.04 F1800
G1 X111.336 Y145.78 Z4 F15000
G1 X89.536 Y145.944 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.456 Y145.961 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00278
G1 X89.342 Y146.139 E.00556
; LINE_WIDTH: 0.43172
G1 X89.342 Y197.75 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.358 Y197.83 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00278
G1 X89.536 Y197.944 E.00556
; LINE_WIDTH: 0.43172
G1 X117.694 Y197.944 E.8648
; WIPE_START
G1 X115.694 Y197.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.271 Y197.946 Z4 F15000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X122.69 Y198.527 E.02448
G1 X122.156 Y198.527
G1 X123.271 Y197.412 E.04695
G1 X122.788 Y197.362
G1 X121.623 Y198.527 E.04908
G1 X121.09 Y198.527
G1 X122.255 Y197.362 E.04908
G1 X121.722 Y197.362
G1 X120.557 Y198.527 E.04908
G1 X120.023 Y198.527
G1 X121.189 Y197.362 E.04908
G1 X120.655 Y197.362
G1 X119.49 Y198.527 E.04908
G1 X118.957 Y198.527
G1 X120.122 Y197.362 E.04908
G1 X119.589 Y197.362
G1 X118.424 Y198.527 E.04908
G1 X118.12 Y198.297
G1 X119.056 Y197.362 E.03941
G1 X118.522 Y197.362
G1 X118.12 Y197.764 E.01694
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X118.522 Y197.362 E-.21615
G1 X119.056 Y197.362 E-.20264
G1 X118.421 Y197.997 E-.34122
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X116.886 Y190.52 Z4 F15000
G1 X90.099 Y60 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X118.257 Y111.204 E.90546
G1 X118.257 Y112 E.02559
G1 X89.303 Y112 E.93105
G1 X89.303 Y59.204 E1.69772
G1 X118.257 Y59.204 E.93105
G1 X118.257 Y60 E.02559
G1 X90.159 Y60 E.90353
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X123.838 Y110.812 E.99328
G1 X123.838 Y112.392 E.04706
G1 X88.911 Y112.392 E1.04034
G1 X88.911 Y58.812 E1.59597
G1 X123.838 Y58.812 E1.04034
G1 X123.838 Y60.392 E.04706
G1 X90.551 Y60.392 E.99149
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z4 F15000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X118.054 Y59.602 E.8648
; WIPE_START
G1 X116.054 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.79 Y60.185 Z4 F15000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X123.63 Y59.345 E.0354
G1 X123.422 Y59.02
G1 X122.257 Y60.185 E.04909
G1 X121.723 Y60.185
G1 X122.889 Y59.02 E.04908
G1 X122.355 Y59.02
G1 X121.19 Y60.185 E.04908
G1 X120.657 Y60.185
G1 X121.822 Y59.02 E.04908
G1 X121.289 Y59.02
G1 X120.124 Y60.185 E.04908
G1 X119.59 Y60.185
G1 X120.756 Y59.02 E.04908
G1 X120.222 Y59.02
G1 X119.057 Y60.185 E.04908
G1 X118.524 Y60.185
G1 X119.689 Y59.02 E.04908
G1 X119.156 Y59.02
G1 X118.48 Y59.696 E.02849
; WIPE_START
M204 S5000
G1 X119.156 Y59.02 E-.36342
G1 X119.689 Y59.02 E-.20264
G1 X119.328 Y59.381 E-.19395
; WIPE_END
G1 E-.04 F1800
G1 X111.696 Y59.438 Z4 F15000
G1 X89.896 Y59.602 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.815 Y59.619 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00278
G1 X89.701 Y59.797 E.00556
; LINE_WIDTH: 0.43172
G1 X89.701 Y111.408 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.718 Y111.489 E.00263
; LINE_WIDTH: 0.470635
M73 P88 R2
G1 X89.734 Y111.569 E.00278
G1 X89.896 Y111.602 E.00556
; LINE_WIDTH: 0.43172
G1 X118.054 Y111.602 E.8648
; WIPE_START
G1 X116.054 Y111.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.63 Y111.604 Z4 F15000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X123.049 Y112.185 E.02448
G1 X122.516 Y112.185
G1 X123.63 Y111.071 E.04695
G1 X123.148 Y111.02
G1 X121.983 Y112.185 E.04908
G1 X121.449 Y112.185
G1 X122.615 Y111.02 E.04908
G1 X122.081 Y111.02
G1 X120.916 Y112.185 E.04908
G1 X120.383 Y112.185
G1 X121.548 Y111.02 E.04908
G1 X121.015 Y111.02
G1 X119.85 Y112.185 E.04908
G1 X119.316 Y112.185
G1 X120.482 Y111.02 E.04908
G1 X119.948 Y111.02
G1 X118.783 Y112.185 E.04908
G1 X118.48 Y111.955
G1 X119.415 Y111.02 E.03941
G1 X118.882 Y111.02
G1 X118.48 Y111.422 E.01694
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X118.882 Y111.02 E-.21615
G1 X119.415 Y111.02 E-.20264
G1 X118.78 Y111.655 E-.34122
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 19/25
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
M106 S94.35
G17
G3 Z4 I1.217 J0 P1  F15000
; object ids of layer 19 start: 81,121
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
; object ids of this layer19 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X113.185 Y197.546 E.75391
G1 X113.185 Y198.342 E.02559
G1 X88.944 Y198.342 E.7795
G1 X88.944 Y145.546 E1.69772
G1 X113.185 Y145.546 E.7795
G1 X113.185 Y146.342 E.02559
G1 X89.8 Y146.342 E.75198
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X118.765 Y197.154 E.8529
G1 X118.765 Y198.734 E.04706
G1 X88.552 Y198.734 E.89996
G1 X88.552 Y145.154 E1.59597
G1 X118.765 Y145.154 E.89996
G1 X118.765 Y146.734 E.04706
G1 X90.192 Y146.734 E.85111
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z4.2 F15000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X112.981 Y145.944 E.72006
; WIPE_START
G1 X110.981 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.558 Y146.029 Z4.2 F15000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X117.89 Y145.362 E.02812
G1 X117.357 Y145.362
G1 X118.522 Y146.527 E.04908
G1 X117.989 Y146.527
G1 X116.824 Y145.362 E.04908
G1 X116.291 Y145.362
G1 X117.456 Y146.527 E.04908
G1 X116.923 Y146.527
G1 X115.757 Y145.362 E.04908
G1 X115.224 Y145.362
G1 X116.389 Y146.527 E.04908
G1 X115.856 Y146.527
G1 X114.691 Y145.362 E.04908
G1 X114.158 Y145.362
G1 X115.323 Y146.527 E.04908
G1 X114.79 Y146.527
G1 X113.624 Y145.362 E.04908
G1 X113.407 Y145.678
G1 X114.256 Y146.527 E.03576
; WIPE_START
M204 S5000
G1 X113.407 Y145.678 E-.45626
G1 X113.624 Y145.362 E-.14574
G1 X113.918 Y145.656 E-.158
; WIPE_END
G1 E-.04 F1800
G1 X106.286 Y145.746 Z4.2 F15000
G1 X89.536 Y145.944 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.456 Y145.961 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00278
G1 X89.342 Y146.139 E.00556
; LINE_WIDTH: 0.43172
G1 X89.342 Y197.75 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.358 Y197.83 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00278
G1 X89.536 Y197.944 E.00556
; LINE_WIDTH: 0.43172
G1 X112.981 Y197.944 E.72006
; WIPE_START
G1 X110.981 Y197.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.558 Y197.755 Z4.2 F15000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X118.164 Y197.362 E.01658
G1 X117.631 Y197.362
G1 X118.558 Y198.289 E.03904
G1 X118.263 Y198.527
G1 X117.098 Y197.362 E.04908
G1 X116.565 Y197.362
G1 X117.73 Y198.527 E.04908
G1 X117.197 Y198.527
G1 X116.031 Y197.362 E.04908
G1 X115.498 Y197.362
G1 X116.663 Y198.527 E.04908
G1 X116.13 Y198.527
G1 X114.965 Y197.362 E.04908
G1 X114.432 Y197.362
G1 X115.597 Y198.527 E.04908
G1 X115.064 Y198.527
G1 X113.898 Y197.362 E.04908
G1 X113.407 Y197.404
G1 X114.53 Y198.527 E.04731
G1 X113.997 Y198.527
G1 X113.407 Y197.937 E.02485
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X113.997 Y198.527 E-.31696
G1 X114.53 Y198.527 E-.20264
G1 X114.083 Y198.08 E-.24041
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X112.777 Y190.56 Z4.2 F15000
G1 X90.099 Y60 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X113.544 Y111.204 E.75391
G1 X113.544 Y112 E.02559
G1 X89.303 Y112 E.7795
G1 X89.303 Y59.204 E1.69772
G1 X113.544 Y59.204 E.7795
G1 X113.544 Y60 E.02559
G1 X90.159 Y60 E.75198
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
M73 P89 R2
G1 X90.491 Y110.812 E1.50184
G1 X119.125 Y110.812 E.8529
G1 X119.125 Y112.392 E.04706
G1 X88.911 Y112.392 E.89996
G1 X88.911 Y58.812 E1.59597
G1 X119.125 Y58.812 E.89996
G1 X119.125 Y60.392 E.04706
G1 X90.551 Y60.392 E.85111
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z4.2 F15000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X113.341 Y59.602 E.72006
; WIPE_START
G1 X111.341 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.917 Y59.687 Z4.2 F15000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X118.25 Y59.02 E.02812
G1 X117.717 Y59.02
G1 X118.882 Y60.185 E.04908
G1 X118.348 Y60.185
G1 X117.183 Y59.02 E.04908
G1 X116.65 Y59.02
G1 X117.815 Y60.185 E.04908
G1 X117.282 Y60.185
G1 X116.117 Y59.02 E.04908
G1 X115.583 Y59.02
G1 X116.749 Y60.185 E.04908
G1 X116.215 Y60.185
G1 X115.05 Y59.02 E.04908
G1 X114.517 Y59.02
G1 X115.682 Y60.185 E.04908
G1 X115.149 Y60.185
G1 X113.984 Y59.02 E.04908
G1 X113.767 Y59.336
G1 X114.616 Y60.185 E.03576
; WIPE_START
M204 S5000
G1 X113.767 Y59.336 E-.45626
G1 X113.984 Y59.02 E-.14574
G1 X114.278 Y59.314 E-.158
; WIPE_END
G1 E-.04 F1800
G1 X106.646 Y59.404 Z4.2 F15000
G1 X89.896 Y59.602 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.815 Y59.619 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00278
G1 X89.701 Y59.797 E.00556
; LINE_WIDTH: 0.43172
G1 X89.701 Y111.408 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.718 Y111.489 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00278
G1 X89.896 Y111.602 E.00556
; LINE_WIDTH: 0.43172
G1 X113.341 Y111.602 E.72006
; WIPE_START
G1 X111.341 Y111.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.917 Y111.413 Z4.2 F15000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X118.524 Y111.02 E.01658
G1 X117.991 Y111.02
G1 X118.917 Y111.947 E.03904
G1 X118.623 Y112.185
G1 X117.457 Y111.02 E.04908
G1 X116.924 Y111.02
G1 X118.089 Y112.185 E.04908
G1 X117.556 Y112.185
G1 X116.391 Y111.02 E.04908
G1 X115.858 Y111.02
G1 X117.023 Y112.185 E.04908
G1 X116.489 Y112.185
G1 X115.324 Y111.02 E.04908
G1 X114.791 Y111.02
G1 X115.956 Y112.185 E.04908
G1 X115.423 Y112.185
G1 X114.258 Y111.02 E.04908
G1 X113.767 Y111.062
M73 P89 R1
G1 X114.89 Y112.185 E.04731
G1 X114.356 Y112.185
G1 X113.767 Y111.595 E.02485
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X114.356 Y112.185 E-.31696
G1 X114.89 Y112.185 E-.20264
G1 X114.442 Y111.738 E-.24041
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 20/25
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
M106 S96.9
G17
G3 Z4.2 I1.217 J0 P1  F15000
; object ids of layer 20 start: 81,121
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
; object ids of this layer20 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X108.472 Y197.546 E.60236
G1 X108.472 Y198.342 E.02559
G1 X88.944 Y198.342 E.62795
G1 X88.944 Y145.546 E1.69772
G1 X108.472 Y145.546 E.62795
G1 X108.472 Y146.342 E.02559
G1 X89.8 Y146.342 E.60043
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X114.053 Y197.154 E.71252
G1 X114.053 Y198.734 E.04706
G1 X88.552 Y198.734 E.75958
G1 X88.552 Y145.154 E1.59597
G1 X114.053 Y145.154 E.75958
G1 X114.053 Y146.734 E.04706
G1 X90.192 Y146.734 E.71073
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z4.4 F15000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.456 Y145.961 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00278
G1 X89.342 Y146.139 E.00556
; LINE_WIDTH: 0.43172
G1 X89.342 Y197.75 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.358 Y197.83 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00278
G1 X89.536 Y197.944 E.00556
; LINE_WIDTH: 0.43172
G1 X108.268 Y197.944 E.57531
; WIPE_START
G1 X106.268 Y197.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.845 Y197.773 Z4.4 F15000
G1 Z4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X113.091 Y198.527 E.03177
G1 X112.558 Y198.527
G1 X113.723 Y197.362 E.04908
G1 X113.19 Y197.362
G1 X112.025 Y198.527 E.04908
G1 X111.491 Y198.527
G1 X112.656 Y197.362 E.04908
G1 X112.123 Y197.362
G1 X110.958 Y198.527 E.04909
G1 X110.425 Y198.527
G1 X111.59 Y197.362 E.04909
G1 X111.057 Y197.362
G1 X109.891 Y198.527 E.04908
G1 X109.358 Y198.527
G1 X110.523 Y197.362 E.04908
G1 X109.99 Y197.362
G1 X108.825 Y198.527 E.04908
G1 X108.694 Y198.124
G1 X109.457 Y197.362 E.03212
; WIPE_START
M204 S5000
G1 X108.694 Y198.124 E-.4098
G1 X108.825 Y198.527 E-.16086
M73 P90 R1
G1 X109.177 Y198.175 E-.18935
; WIPE_END
G1 E-.04 F1800
G1 X109.044 Y190.543 Z4.4 F15000
G1 X108.268 Y145.944 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.536 Y145.944 E.57531
; WIPE_START
G1 X91.536 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.168 Y145.979 Z4.4 F15000
G1 X113.845 Y146.047 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X113.365 Y146.527 E.02022
G1 X112.832 Y146.527
G1 X113.845 Y145.514 E.04269
G1 X113.464 Y145.362
G1 X112.299 Y146.527 E.04908
G1 X111.765 Y146.527
G1 X112.931 Y145.362 E.04908
G1 X112.397 Y145.362
G1 X111.232 Y146.527 E.04909
G1 X110.699 Y146.527
G1 X111.864 Y145.362 E.04908
G1 X111.331 Y145.362
G1 X110.166 Y146.527 E.04908
G1 X109.632 Y146.527
G1 X110.797 Y145.362 E.04908
G1 X110.264 Y145.362
G1 X109.099 Y146.527 E.04908
G1 X108.694 Y146.398
G1 X109.731 Y145.362 E.04367
G1 X109.198 Y145.362
G1 X108.694 Y145.865 E.0212
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X109.198 Y145.362 E-.2705
G1 X109.731 Y145.362 E-.20264
G1 X109.197 Y145.896 E-.28686
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X107.541 Y138.445 Z4.4 F15000
G1 X90.099 Y60 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X108.831 Y111.204 E.60236
G1 X108.831 Y112 E.02559
G1 X89.303 Y112 E.62795
G1 X89.303 Y59.204 E1.69772
G1 X108.831 Y59.204 E.62795
G1 X108.831 Y60 E.02559
G1 X90.159 Y60 E.60043
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X114.412 Y110.812 E.71252
G1 X114.412 Y112.392 E.04706
G1 X88.911 Y112.392 E.75958
G1 X88.911 Y58.812 E1.59597
G1 X114.412 Y58.812 E.75958
G1 X114.412 Y60.392 E.04706
G1 X90.551 Y60.392 E.71073
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z4.4 F15000
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.815 Y59.619 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00278
G1 X89.701 Y59.797 E.00556
; LINE_WIDTH: 0.43172
G1 X89.701 Y111.408 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.718 Y111.489 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00278
G1 X89.896 Y111.602 E.00556
; LINE_WIDTH: 0.43172
G1 X108.628 Y111.602 E.57531
; WIPE_START
G1 X106.628 Y111.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.205 Y111.431 Z4.4 F15000
G1 Z4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X113.45 Y112.185 E.03177
G1 X112.917 Y112.185
G1 X114.082 Y111.02 E.04908
G1 X113.549 Y111.02
G1 X112.384 Y112.185 E.04908
G1 X111.851 Y112.185
G1 X113.016 Y111.02 E.04908
G1 X112.483 Y111.02
G1 X111.317 Y112.185 E.04909
G1 X110.784 Y112.185
G1 X111.949 Y111.02 E.04909
G1 X111.416 Y111.02
G1 X110.251 Y112.185 E.04908
G1 X109.718 Y112.185
G1 X110.883 Y111.02 E.04908
G1 X110.35 Y111.02
G1 X109.184 Y112.185 E.04908
G1 X109.054 Y111.782
G1 X109.816 Y111.02 E.03212
; WIPE_START
M204 S5000
G1 X109.054 Y111.782 E-.4098
G1 X109.184 Y112.185 E-.16086
G1 X109.537 Y111.833 E-.18935
; WIPE_END
G1 E-.04 F1800
G1 X109.404 Y104.201 Z4.4 F15000
G1 X108.628 Y59.602 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.896 Y59.602 E.57531
; WIPE_START
G1 X91.896 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.528 Y59.637 Z4.4 F15000
G1 X114.205 Y59.705 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X113.724 Y60.185 E.02022
G1 X113.191 Y60.185
G1 X114.205 Y59.172 E.04269
G1 X113.823 Y59.02
G1 X112.658 Y60.185 E.04908
G1 X112.125 Y60.185
G1 X113.29 Y59.02 E.04908
G1 X112.757 Y59.02
G1 X111.591 Y60.185 E.04909
G1 X111.058 Y60.185
G1 X112.223 Y59.02 E.04908
G1 X111.69 Y59.02
G1 X110.525 Y60.185 E.04908
G1 X109.992 Y60.185
G1 X111.157 Y59.02 E.04908
G1 X110.624 Y59.02
G1 X109.458 Y60.185 E.04908
G1 X109.054 Y60.056
G1 X110.09 Y59.02 E.04367
G1 X109.557 Y59.02
G1 X109.054 Y59.523 E.0212
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X109.557 Y59.02 E-.2705
M73 P91 R1
G1 X110.09 Y59.02 E-.20264
G1 X109.557 Y59.554 E-.28686
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 21/25
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
M106 S99.45
G17
G3 Z4.4 I1.217 J0 P1  F15000
; object ids of layer 21 start: 81,121
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
; object ids of this layer21 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X89.74 Y197.546 E1.64654
G1 X103.759 Y197.546 E.45081
G1 X103.759 Y198.342 E.02559
G1 X88.944 Y198.342 E.4764
G1 X88.944 Y145.546 E1.69772
G1 X103.759 Y145.546 E.4764
G1 X103.759 Y146.342 E.02559
G1 X89.8 Y146.342 E.44888
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X109.34 Y197.154 E.57214
G1 X109.34 Y198.734 E.04706
G1 X88.552 Y198.734 E.6192
G1 X88.552 Y145.154 E1.59597
G1 X109.34 Y145.154 E.6192
G1 X109.34 Y146.734 E.04706
G1 X90.192 Y146.734 E.57035
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z4.6 F15000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.456 Y145.961 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00278
G1 X89.342 Y146.139 E.00556
; LINE_WIDTH: 0.43172
G1 X89.342 Y197.75 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.358 Y197.83 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00278
G1 X89.536 Y197.944 E.00556
; LINE_WIDTH: 0.43172
G1 X103.555 Y197.944 E.43057
; WIPE_START
G1 X101.555 Y197.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.132 Y197.928 Z4.6 F15000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X108.566 Y197.362 E.02386
G1 X108.032 Y197.362
G1 X109.132 Y198.461 E.04633
G1 X108.664 Y198.527
G1 X107.499 Y197.362 E.04908
G1 X106.966 Y197.362
G1 X108.131 Y198.527 E.04908
G1 X107.598 Y198.527
G1 X106.433 Y197.362 E.04908
G1 X105.899 Y197.362
G1 X107.065 Y198.527 E.04908
G1 X106.531 Y198.527
G1 X105.366 Y197.362 E.04908
G1 X104.833 Y197.362
G1 X105.998 Y198.527 E.04908
G1 X105.465 Y198.527
G1 X104.3 Y197.362 E.04908
G1 X103.981 Y197.577
G1 X104.932 Y198.527 E.04003
G1 X104.398 Y198.527
G1 X103.981 Y198.11 E.01756
; WIPE_START
M204 S5000
G1 X104.398 Y198.527 E-.22405
G1 X104.932 Y198.527 E-.20264
G1 X104.311 Y197.907 E-.33332
; WIPE_END
G1 E-.04 F1800
G1 X104.2 Y190.275 Z4.6 F15000
G1 X103.555 Y145.944 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.536 Y145.944 E.43057
; WIPE_START
G1 X91.536 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.164 Y145.679 Z4.6 F15000
G1 X108.292 Y145.362 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X109.132 Y146.202 E.03541
G1 X108.924 Y146.527
G1 X107.758 Y145.362 E.04908
G1 X107.225 Y145.362
G1 X108.39 Y146.527 E.04908
G1 X107.857 Y146.527
G1 X106.692 Y145.362 E.04908
G1 X106.159 Y145.362
G1 X107.324 Y146.527 E.04908
G1 X106.791 Y146.527
G1 X105.625 Y145.362 E.04908
G1 X105.092 Y145.362
G1 X106.257 Y146.527 E.04908
G1 X105.724 Y146.527
G1 X104.559 Y145.362 E.04908
G1 X104.026 Y145.362
G1 X105.191 Y146.527 E.04908
G1 X104.658 Y146.527
G1 X103.981 Y145.851 E.02848
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X104.658 Y146.527 E-.36336
G1 X105.191 Y146.527 E-.20264
G1 X104.83 Y146.166 E-.19401
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X103.544 Y138.643 Z4.6 F15000
G1 X90.099 Y60 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X90.099 Y111.204 E1.64654
G1 X104.118 Y111.204 E.45081
G1 X104.118 Y112 E.02559
G1 X89.303 Y112 E.4764
G1 X89.303 Y59.204 E1.69772
G1 X104.118 Y59.204 E.4764
G1 X104.118 Y60 E.02559
G1 X90.159 Y60 E.44888
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X109.699 Y110.812 E.57214
G1 X109.699 Y112.392 E.04706
G1 X88.911 Y112.392 E.6192
G1 X88.911 Y58.812 E1.59597
G1 X109.699 Y58.812 E.6192
G1 X109.699 Y60.392 E.04706
G1 X90.551 Y60.392 E.57035
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z4.6 F15000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X89.815 Y59.619 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00278
G1 X89.701 Y59.797 E.00556
; LINE_WIDTH: 0.43172
G1 X89.701 Y111.408 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.718 Y111.489 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00278
G1 X89.896 Y111.602 E.00556
; LINE_WIDTH: 0.43172
G1 X103.915 Y111.602 E.43057
; WIPE_START
G1 X101.915 Y111.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X109.492 Y111.586 Z4.6 F15000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X108.925 Y111.02 E.02386
G1 X108.392 Y111.02
G1 X109.492 Y112.12 E.04633
G1 X109.024 Y112.185
G1 X107.859 Y111.02 E.04908
G1 X107.325 Y111.02
G1 X108.491 Y112.185 E.04908
G1 X107.957 Y112.185
G1 X106.792 Y111.02 E.04908
G1 X106.259 Y111.02
G1 X107.424 Y112.185 E.04908
G1 X106.891 Y112.185
G1 X105.726 Y111.02 E.04908
G1 X105.192 Y111.02
G1 X106.358 Y112.185 E.04908
G1 X105.824 Y112.185
G1 X104.659 Y111.02 E.04908
G1 X104.341 Y111.235
G1 X105.291 Y112.185 E.04003
G1 X104.758 Y112.185
M73 P92 R1
G1 X104.341 Y111.768 E.01756
; WIPE_START
M204 S5000
G1 X104.758 Y112.185 E-.22405
G1 X105.291 Y112.185 E-.20264
G1 X104.671 Y111.565 E-.33332
; WIPE_END
G1 E-.04 F1800
G1 X104.56 Y103.933 Z4.6 F15000
G1 X103.915 Y59.602 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X89.896 Y59.602 E.43057
; WIPE_START
G1 X91.896 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.523 Y59.337 Z4.6 F15000
G1 X108.651 Y59.02 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X109.492 Y59.86 E.03541
G1 X109.283 Y60.185
G1 X108.118 Y59.02 E.04908
G1 X107.585 Y59.02
G1 X108.75 Y60.185 E.04908
G1 X108.217 Y60.185
G1 X107.051 Y59.02 E.04908
G1 X106.518 Y59.02
G1 X107.683 Y60.185 E.04908
G1 X107.15 Y60.185
G1 X105.985 Y59.02 E.04908
G1 X105.452 Y59.02
G1 X106.617 Y60.185 E.04908
G1 X106.084 Y60.185
G1 X104.918 Y59.02 E.04908
G1 X104.385 Y59.02
G1 X105.55 Y60.185 E.04908
G1 X105.017 Y60.185
G1 X104.341 Y59.509 E.02848
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X105.017 Y60.185 E-.36336
G1 X105.55 Y60.185 E-.20264
G1 X105.189 Y59.824 E-.19401
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 22/25
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
G17
G3 Z4.6 I1.217 J0 P1  F15000
; object ids of layer 22 start: 81,121
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
; object ids of this layer22 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6711
G1 X89.74 Y197.546 E1.64654
G1 X99.046 Y197.546 E.29926
G1 X99.046 Y198.342 E.02559
G1 X88.944 Y198.342 E.32486
G1 X88.944 Y145.546 E1.69772
G1 X99.046 Y145.546 E.32486
G1 X99.046 Y146.342 E.02559
G1 X89.8 Y146.342 E.29733
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X104.627 Y197.154 E.43176
G1 X104.627 Y198.734 E.04706
G1 X88.552 Y198.734 E.47882
G1 X88.552 Y145.154 E1.59597
G1 X104.627 Y145.154 E.47882
G1 X104.627 Y146.734 E.04706
G1 X90.192 Y146.734 E.42997
; WIPE_START
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z4.8 F15000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F6711
G1 X89.456 Y145.961 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00278
G1 X89.342 Y146.139 E.00556
; LINE_WIDTH: 0.43172
G1 X89.342 Y197.75 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.358 Y197.83 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00278
G1 X89.536 Y197.944 E.00556
; LINE_WIDTH: 0.43172
G1 X98.843 Y197.944 E.28582
; WIPE_START
G1 F7500
G1 X96.843 Y197.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.419 Y198.133 Z4.8 F15000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X104.026 Y198.527 E.01659
G1 X103.492 Y198.527
G1 X104.419 Y197.6 E.03905
G1 X104.124 Y197.362
G1 X102.959 Y198.527 E.04908
G1 X102.426 Y198.527
G1 X103.591 Y197.362 E.04908
G1 X103.058 Y197.362
G1 X101.893 Y198.527 E.04908
G1 X101.359 Y198.527
G1 X102.525 Y197.362 E.04908
G1 X101.991 Y197.362
G1 X100.826 Y198.527 E.04908
G1 X100.293 Y198.527
G1 X101.458 Y197.362 E.04909
G1 X100.925 Y197.362
G1 X99.76 Y198.527 E.04909
G1 X99.269 Y198.485
G1 X100.392 Y197.362 E.0473
G1 X99.858 Y197.362
G1 X99.269 Y197.951 E.02484
; WIPE_START
M204 S5000
G1 X99.858 Y197.362 E-.31689
G1 X100.392 Y197.362 E-.20264
G1 X99.944 Y197.809 E-.24047
; WIPE_END
G1 E-.04 F1800
G1 X99.782 Y190.178 Z4.8 F15000
G1 X98.843 Y145.944 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F6711
G1 X89.536 Y145.944 E.28582
; WIPE_START
G1 F7500
G1 X91.536 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.168 Y145.903 Z4.8 F15000
G1 X104.419 Y145.874 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X103.766 Y146.527 E.0275
G1 X103.233 Y146.527
G1 X104.398 Y145.362 E.04908
G1 X103.865 Y145.362
G1 X102.7 Y146.527 E.04908
G1 X102.167 Y146.527
G1 X103.332 Y145.362 E.04908
G1 X102.799 Y145.362
G1 X101.633 Y146.527 E.04908
G1 X101.1 Y146.527
G1 X102.265 Y145.362 E.04909
G1 X101.732 Y145.362
G1 X100.567 Y146.527 E.04908
G1 X100.034 Y146.527
G1 X101.199 Y145.362 E.04908
G1 X100.666 Y145.362
G1 X99.5 Y146.527 E.04908
G1 X99.269 Y146.225
G1 X100.132 Y145.362 E.03638
; OBJECT_ID: 121
; WIPE_START
M204 S5000
G1 X99.269 Y146.225 E-.46416
G1 X99.5 Y146.527 E-.14451
G1 X99.782 Y146.245 E-.15133
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X98.93 Y138.661 Z4.8 F15000
G1 X90.099 Y60 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6711
G1 X90.099 Y111.204 E1.64654
G1 X99.406 Y111.204 E.29926
G1 X99.406 Y112 E.02559
G1 X89.303 Y112 E.32486
M73 P93 R1
G1 X89.303 Y59.204 E1.69772
G1 X99.406 Y59.204 E.32486
G1 X99.406 Y60 E.02559
G1 X90.159 Y60 E.29733
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X104.986 Y110.812 E.43176
G1 X104.986 Y112.392 E.04706
G1 X88.911 Y112.392 E.47882
G1 X88.911 Y58.812 E1.59597
G1 X104.986 Y58.812 E.47882
G1 X104.986 Y60.392 E.04706
G1 X90.551 Y60.392 E.42997
; WIPE_START
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z4.8 F15000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F6711
G1 X89.815 Y59.619 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00278
G1 X89.701 Y59.797 E.00556
; LINE_WIDTH: 0.43172
G1 X89.701 Y111.408 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.718 Y111.489 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00278
G1 X89.896 Y111.602 E.00556
; LINE_WIDTH: 0.43172
G1 X99.202 Y111.602 E.28582
; WIPE_START
G1 F7500
G1 X97.202 Y111.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X104.779 Y111.791 Z4.8 F15000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X104.385 Y112.185 E.01659
G1 X103.852 Y112.185
G1 X104.779 Y111.258 E.03905
G1 X104.484 Y111.02
G1 X103.319 Y112.185 E.04908
G1 X102.785 Y112.185
G1 X103.951 Y111.02 E.04908
G1 X103.417 Y111.02
G1 X102.252 Y112.185 E.04908
G1 X101.719 Y112.185
G1 X102.884 Y111.02 E.04908
G1 X102.351 Y111.02
G1 X101.186 Y112.185 E.04908
G1 X100.652 Y112.185
G1 X101.818 Y111.02 E.04909
G1 X101.284 Y111.02
G1 X100.119 Y112.185 E.04909
G1 X99.628 Y112.143
G1 X100.751 Y111.02 E.0473
G1 X100.218 Y111.02
G1 X99.628 Y111.609 E.02484
; WIPE_START
M204 S5000
G1 X100.218 Y111.02 E-.31689
G1 X100.751 Y111.02 E-.20264
G1 X100.304 Y111.467 E-.24047
; WIPE_END
G1 E-.04 F1800
G1 X100.141 Y103.836 Z4.8 F15000
G1 X99.202 Y59.602 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F6711
G1 X89.896 Y59.602 E.28582
; WIPE_START
G1 F7500
G1 X91.896 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.528 Y59.561 Z4.8 F15000
G1 X104.779 Y59.532 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X104.126 Y60.185 E.0275
G1 X103.593 Y60.185
G1 X104.758 Y59.02 E.04908
G1 X104.225 Y59.02
G1 X103.059 Y60.185 E.04908
G1 X102.526 Y60.185
G1 X103.691 Y59.02 E.04908
G1 X103.158 Y59.02
G1 X101.993 Y60.185 E.04908
G1 X101.46 Y60.185
G1 X102.625 Y59.02 E.04909
G1 X102.092 Y59.02
G1 X100.926 Y60.185 E.04908
G1 X100.393 Y60.185
G1 X101.558 Y59.02 E.04908
G1 X101.025 Y59.02
G1 X99.86 Y60.185 E.04908
G1 X99.628 Y59.883
G1 X100.492 Y59.02 E.03638
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X99.628 Y59.883 E-.46416
G1 X99.86 Y60.185 E-.14451
G1 X100.141 Y59.903 E-.15133
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 23/25
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
G17
G3 Z4.8 I1.217 J0 P1  F15000
; object ids of layer 23 start: 81,121
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
; object ids of this layer23 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.74 Y146.342
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5583
G1 X89.74 Y197.546 E1.64654
G1 X94.333 Y197.546 E.14771
G1 X94.333 Y198.342 E.02559
G1 X88.944 Y198.342 E.17331
G1 X88.944 Y145.546 E1.69772
G1 X94.333 Y145.546 E.17331
G1 X94.333 Y146.342 E.02559
G1 X89.8 Y146.342 E.14578
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5583
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X99.914 Y197.154 E.29138
G1 X99.914 Y198.734 E.04706
G1 X88.552 Y198.734 E.33844
G1 X88.552 Y145.154 E1.59597
G1 X99.914 Y145.154 E.33844
G1 X99.914 Y146.734 E.04706
G1 X90.192 Y146.734 E.28959
; WIPE_START
G1 F6000
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z5 F15000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F5583
G1 X94.13 Y145.944 E.14108
; WIPE_START
G1 F7500
G1 X92.13 Y145.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.536 Y145.944 Z5 F15000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.448395
G1 F5583
G1 X89.456 Y145.961 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y145.978 E.00278
G1 X89.342 Y146.139 E.00556
; LINE_WIDTH: 0.43172
G1 X89.342 Y197.75 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.358 Y197.83 E.00263
; LINE_WIDTH: 0.470635
G1 X89.375 Y197.911 E.00278
G1 X89.536 Y197.944 E.00556
; LINE_WIDTH: 0.43172
G1 X94.13 Y197.944 E.14108
; WIPE_START
G1 F7500
G1 X92.13 Y197.944 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X99.707 Y198.101 Z5 F15000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5583
M204 S1000
G1 X98.967 Y197.362 E.03115
G1 X98.434 Y197.362
G1 X99.599 Y198.527 E.04908
G1 X99.066 Y198.527
G1 X97.901 Y197.362 E.04908
G1 X97.367 Y197.362
G1 X98.533 Y198.527 E.04908
G1 X97.999 Y198.527
G1 X96.834 Y197.362 E.04908
G1 X96.301 Y197.362
G1 X97.466 Y198.527 E.04908
G1 X96.933 Y198.527
G1 X95.768 Y197.362 E.04908
M73 P94 R1
G1 X95.234 Y197.362
G1 X96.4 Y198.527 E.04908
G1 X95.866 Y198.527
G1 X94.701 Y197.362 E.04908
G1 X94.556 Y197.75
G1 X95.333 Y198.527 E.03274
; WIPE_START
G1 F6000
M204 S5000
G1 X94.556 Y197.75 E-.4177
G1 X94.701 Y197.362 E-.15742
G1 X95.045 Y197.706 E-.18487
; WIPE_END
G1 E-.04 F1800
G1 X95.728 Y190.104 Z5 F15000
G1 X99.707 Y145.842 Z5
G1 Z4.6
G1 E.8 F1800
G1 F5583
M204 S1000
G1 X99.226 Y145.362 E.02023
G1 X98.693 Y145.362
G1 X99.707 Y146.375 E.04269
G1 X99.325 Y146.527
G1 X98.16 Y145.362 E.04908
G1 X97.627 Y145.362
G1 X98.792 Y146.527 E.04908
G1 X98.259 Y146.527
G1 X97.093 Y145.362 E.04908
G1 X96.56 Y145.362
G1 X97.725 Y146.527 E.04908
G1 X97.192 Y146.527
G1 X96.027 Y145.362 E.04908
G1 X95.494 Y145.362
G1 X96.659 Y146.527 E.04908
G1 X96.126 Y146.527
G1 X94.96 Y145.362 E.04908
G1 X94.556 Y145.49
G1 X95.592 Y146.527 E.04366
G1 X95.059 Y146.527
G1 X94.556 Y146.024 E.0212
; OBJECT_ID: 121
; WIPE_START
G1 F6000
M204 S5000
G1 X95.059 Y146.527 E-.27044
G1 X95.592 Y146.527 E-.20264
G1 X95.058 Y145.993 E-.28692
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X94.619 Y138.373 Z5 F15000
G1 X90.099 Y60 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5583
G1 X90.099 Y111.204 E1.64654
G1 X94.693 Y111.204 E.14771
G1 X94.693 Y112 E.02559
G1 X89.303 Y112 E.17331
G1 X89.303 Y59.204 E1.69772
G1 X94.693 Y59.204 E.17331
G1 X94.693 Y60 E.02559
G1 X90.159 Y60 E.14578
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5583
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X100.273 Y110.812 E.29138
G1 X100.273 Y112.392 E.04706
G1 X88.911 Y112.392 E.33844
G1 X88.911 Y58.812 E1.59597
G1 X100.273 Y58.812 E.33844
G1 X100.273 Y60.392 E.04706
G1 X90.551 Y60.392 E.28959
; WIPE_START
G1 F6000
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z5 F15000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F5583
G1 X94.489 Y59.602 E.14108
; WIPE_START
G1 F7500
G1 X92.489 Y59.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.896 Y59.602 Z5 F15000
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.448395
G1 F5583
G1 X89.815 Y59.619 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y59.636 E.00278
G1 X89.701 Y59.797 E.00556
; LINE_WIDTH: 0.43172
G1 X89.701 Y111.408 E1.5851
; LINE_WIDTH: 0.448395
G1 X89.718 Y111.489 E.00263
; LINE_WIDTH: 0.470635
G1 X89.734 Y111.569 E.00278
G1 X89.896 Y111.602 E.00556
; LINE_WIDTH: 0.43172
G1 X94.489 Y111.602 E.14108
; WIPE_START
G1 F7500
G1 X92.489 Y111.602 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X100.066 Y111.759 Z5 F15000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5583
M204 S1000
G1 X99.327 Y111.02 E.03115
G1 X98.793 Y111.02
G1 X99.959 Y112.185 E.04908
G1 X99.425 Y112.185
G1 X98.26 Y111.02 E.04908
G1 X97.727 Y111.02
G1 X98.892 Y112.185 E.04908
G1 X98.359 Y112.185
G1 X97.194 Y111.02 E.04908
G1 X96.66 Y111.02
G1 X97.825 Y112.185 E.04908
G1 X97.292 Y112.185
G1 X96.127 Y111.02 E.04908
G1 X95.594 Y111.02
G1 X96.759 Y112.185 E.04908
G1 X96.226 Y112.185
G1 X95.06 Y111.02 E.04908
G1 X94.915 Y111.408
G1 X95.692 Y112.185 E.03274
; WIPE_START
G1 F6000
M204 S5000
G1 X94.915 Y111.408 E-.4177
G1 X95.06 Y111.02 E-.15742
G1 X95.404 Y111.364 E-.18487
; WIPE_END
G1 E-.04 F1800
G1 X96.088 Y103.762 Z5 F15000
G1 X100.066 Y59.5 Z5
G1 Z4.6
G1 E.8 F1800
G1 F5583
M204 S1000
G1 X99.586 Y59.02 E.02023
G1 X99.053 Y59.02
G1 X100.066 Y60.033 E.04269
G1 X99.684 Y60.185
G1 X98.519 Y59.02 E.04908
G1 X97.986 Y59.02
G1 X99.151 Y60.185 E.04908
G1 X98.618 Y60.185
G1 X97.453 Y59.02 E.04908
G1 X96.919 Y59.02
M73 P94 R0
G1 X98.085 Y60.185 E.04908
G1 X97.551 Y60.185
G1 X96.386 Y59.02 E.04908
G1 X95.853 Y59.02
G1 X97.018 Y60.185 E.04908
G1 X96.485 Y60.185
G1 X95.32 Y59.02 E.04908
G1 X94.915 Y59.148
G1 X95.952 Y60.185 E.04366
G1 X95.418 Y60.185
G1 X94.915 Y59.682 E.0212
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X95.418 Y60.185 E-.27044
G1 X95.952 Y60.185 E-.20264
G1 X95.418 Y59.651 E-.28692
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 24/25
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
G17
G3 Z5 I1.217 J0 P1  F15000
; object ids of layer 24 start: 81,121
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
; object ids of this layer24 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X89.62 Y146.223
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4918
G1 X89.62 Y148.262 E.06557
G1 X89.74 Y148.262 E.00383
G1 X89.74 Y195.626 E1.52306
G1 X89.62 Y195.626 E.00383
G1 X89.62 Y198.342 E.08733
G1 X88.944 Y198.342 E.02176
G1 X88.944 Y145.546 E1.69772
G1 X89.62 Y145.546 E.02176
G1 X89.62 Y146.163 E.01983
M204 S250
G1 X90.132 Y146.734 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4918
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X95.201 Y197.154 E.151
G1 X95.201 Y198.734 E.04706
G1 X88.552 Y198.734 E.19806
G1 X88.552 Y145.154 E1.59597
G1 X95.201 Y145.154 E.19806
G1 X95.201 Y146.734 E.04706
G1 X90.192 Y146.734 E.14921
; WIPE_START
G1 F6000
M204 S5000
G1 X90.189 Y148.734 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.282 Y145.75 Z5.2 F15000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.312922
G1 F4918
G1 X89.282 Y148.466 E.05792
G1 X89.302 Y148.525 E.00134
; LINE_WIDTH: 0.3721
G1 X89.322 Y148.585 E.00164
; LINE_WIDTH: 0.411847
M73 P95 R0
G1 X89.342 Y148.645 E.00184
; LINE_WIDTH: 0.431695
G1 X89.342 Y195.244 E1.43107
G1 X89.39 Y195.282 E.00191
; LINE_WIDTH: 0.37535
G1 X89.439 Y195.321 E.00163
; LINE_WIDTH: 0.33777
G1 X89.488 Y195.36 E.00145
; LINE_WIDTH: 0.30019
G1 X89.536 Y195.399 E.00126
G1 X89.322 Y195.303 F15000
; LINE_WIDTH: 0.372098
G1 F4918
G1 X89.302 Y195.363 E.00164
; LINE_WIDTH: 0.312921
G1 X89.282 Y195.423 E.00134
G1 X89.282 Y198.139 E.05792
; WIPE_START
G1 F7500
G1 X89.282 Y196.139 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.322 Y195.303 Z5.2 F15000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.411843
G1 F4918
G1 X89.342 Y195.244 E.00184
; WIPE_START
G1 F7500
G1 X89.322 Y195.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.994 Y197.96 Z5.2 F15000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4918
M204 S1000
G1 X94.427 Y198.527 E.02387
G1 X93.894 Y198.527
G1 X94.994 Y197.427 E.04633
G1 X94.526 Y197.362
G1 X93.36 Y198.527 E.04908
G1 X92.827 Y198.527
G1 X93.992 Y197.362 E.04908
G1 X93.459 Y197.362
G1 X92.294 Y198.527 E.04908
G1 X91.761 Y198.527
G1 X92.926 Y197.362 E.04908
G1 X92.393 Y197.362
G1 X91.227 Y198.527 E.04908
G1 X90.694 Y198.527
G1 X91.859 Y197.362 E.04908
G1 X91.326 Y197.362
G1 X90.161 Y198.527 E.04908
G1 X89.843 Y198.312
G1 X90.793 Y197.362 E.04002
G1 X90.26 Y197.362
G1 X89.843 Y197.779 E.01756
; WIPE_START
G1 F6000
M204 S5000
G1 X90.26 Y197.362 E-.22399
G1 X90.793 Y197.362 E-.20264
G1 X90.173 Y197.982 E-.33337
; WIPE_END
G1 E-.04 F1800
G1 X90.044 Y190.351 Z5.2 F15000
G1 X89.342 Y148.645 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.412926
G1 F4918
G1 X89.39 Y148.606 E.00182
; LINE_WIDTH: 0.375347
G1 X89.439 Y148.567 E.00163
; LINE_WIDTH: 0.337768
G1 X89.488 Y148.529 E.00145
; LINE_WIDTH: 0.30019
G1 X89.536 Y148.49 E.00126
; WIPE_START
G1 F7500
G1 X89.488 Y148.529 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.168 Y146.527 Z5.2 F15000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4918
M204 S1000
G1 X94.994 Y145.701 E.03479
G1 X94.8 Y145.362
G1 X93.635 Y146.527 E.04908
G1 X93.101 Y146.527
G1 X94.267 Y145.362 E.04908
G1 X93.733 Y145.362
G1 X92.568 Y146.527 E.04908
G1 X92.035 Y146.527
G1 X93.2 Y145.362 E.04908
G1 X92.667 Y145.362
G1 X91.502 Y146.527 E.04908
G1 X90.968 Y146.527
G1 X92.133 Y145.362 E.04908
G1 X91.6 Y145.362
G1 X90.435 Y146.527 E.04908
G1 X89.902 Y146.527
G1 X91.067 Y145.362 E.04908
G1 X90.534 Y145.362
G1 X89.843 Y146.053 E.0291
; OBJECT_ID: 121
; WIPE_START
G1 F6000
M204 S5000
G1 X90.534 Y145.362 E-.37126
G1 X91.067 Y145.362 E-.20264
G1 X90.721 Y145.708 E-.1861
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X90.655 Y138.076 Z5.2 F15000
G1 X89.98 Y59.881 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4918
G1 X89.98 Y61.92 E.06557
G1 X90.099 Y61.92 E.00383
G1 X90.099 Y109.285 E1.52306
G1 X89.98 Y109.285 E.00383
G1 X89.98 Y112 E.08733
G1 X89.303 Y112 E.02176
G1 X89.303 Y59.204 E1.69772
G1 X89.98 Y59.204 E.02176
G1 X89.98 Y59.821 E.01983
M204 S250
G1 X90.491 Y60.392 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4918
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X95.56 Y110.812 E.151
G1 X95.56 Y112.392 E.04706
G1 X88.911 Y112.392 E.19806
G1 X88.911 Y58.812 E1.59597
G1 X95.56 Y58.812 E.19806
G1 X95.56 Y60.392 E.04706
G1 X90.551 Y60.392 E.14921
; WIPE_START
G1 F6000
M204 S5000
G1 X90.549 Y62.392 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.642 Y59.408 Z5.2 F15000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.312922
G1 F4918
G1 X89.642 Y62.124 E.05792
G1 X89.661 Y62.184 E.00134
; LINE_WIDTH: 0.3721
G1 X89.681 Y62.243 E.00164
; LINE_WIDTH: 0.411847
G1 X89.701 Y62.303 E.00184
; LINE_WIDTH: 0.431695
G1 X89.701 Y108.902 E1.43107
G1 X89.75 Y108.941 E.00191
; LINE_WIDTH: 0.37535
G1 X89.798 Y108.979 E.00163
; LINE_WIDTH: 0.33777
G1 X89.847 Y109.018 E.00145
; LINE_WIDTH: 0.30019
G1 X89.896 Y109.057 E.00126
G1 X89.681 Y108.961 F15000
; LINE_WIDTH: 0.372098
G1 F4918
G1 X89.661 Y109.021 E.00164
; LINE_WIDTH: 0.312921
G1 X89.642 Y109.081 E.00134
G1 X89.642 Y111.797 E.05792
; WIPE_START
G1 F7500
G1 X89.642 Y109.797 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X89.681 Y108.961 Z5.2 F15000
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.411843
G1 F4918
G1 X89.701 Y108.902 E.00184
; WIPE_START
G1 F7500
G1 X89.681 Y108.961 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X95.353 Y111.618 Z5.2 F15000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4918
M204 S1000
G1 X94.786 Y112.185 E.02387
G1 X94.253 Y112.185
G1 X95.353 Y111.085 E.04633
G1 X94.885 Y111.02
G1 X93.72 Y112.185 E.04908
G1 X93.187 Y112.185
G1 X94.352 Y111.02 E.04908
G1 X93.819 Y111.02
G1 X92.653 Y112.185 E.04908
G1 X92.12 Y112.185
G1 X93.285 Y111.02 E.04908
G1 X92.752 Y111.02
G1 X91.587 Y112.185 E.04908
M73 P96 R0
G1 X91.054 Y112.185
G1 X92.219 Y111.02 E.04908
G1 X91.686 Y111.02
G1 X90.52 Y112.185 E.04908
G1 X90.202 Y111.97
G1 X91.152 Y111.02 E.04002
G1 X90.619 Y111.02
G1 X90.202 Y111.437 E.01756
; WIPE_START
G1 F6000
M204 S5000
G1 X90.619 Y111.02 E-.22399
G1 X91.152 Y111.02 E-.20264
G1 X90.532 Y111.64 E-.33337
; WIPE_END
G1 E-.04 F1800
G1 X90.403 Y104.009 Z5.2 F15000
G1 X89.701 Y62.303 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.412926
G1 F4918
G1 X89.75 Y62.264 E.00182
; LINE_WIDTH: 0.375347
G1 X89.798 Y62.225 E.00163
; LINE_WIDTH: 0.337768
G1 X89.847 Y62.187 E.00145
; LINE_WIDTH: 0.30019
G1 X89.896 Y62.148 E.00126
; WIPE_START
G1 F7500
G1 X89.847 Y62.187 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X94.527 Y60.185 Z5.2 F15000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4918
M204 S1000
G1 X95.353 Y59.359 E.03479
G1 X95.159 Y59.02
G1 X93.994 Y60.185 E.04908
G1 X93.461 Y60.185
G1 X94.626 Y59.02 E.04908
G1 X94.093 Y59.02
G1 X92.927 Y60.185 E.04908
G1 X92.394 Y60.185
G1 X93.559 Y59.02 E.04908
G1 X93.026 Y59.02
G1 X91.861 Y60.185 E.04908
G1 X91.328 Y60.185
G1 X92.493 Y59.02 E.04908
G1 X91.96 Y59.02
G1 X90.794 Y60.185 E.04908
G1 X90.261 Y60.185
G1 X91.426 Y59.02 E.04908
G1 X90.893 Y59.02
G1 X90.202 Y59.711 E.0291
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X90.893 Y59.02 E-.37126
G1 X91.426 Y59.02 E-.20264
G1 X91.08 Y59.366 E-.1861
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 121
M625
; layer num/total_layer_count: 25/25
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
G17
G3 Z5.2 I1.217 J0 P1  F15000
; object ids of layer 25 start: 81,121
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
; object ids of this layer25 end: 81,121
M625
; OBJECT_ID: 81
; start printing object, unique label id: 81
M624 AQAAAAAAAAA=
G1 X90.132 Y146.734
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
G1 F4738
M204 S2500
G1 X90.132 Y197.154 E1.50184
G1 X90.488 Y197.154 E.01062
G1 X90.488 Y198.734 E.04706
G1 X88.552 Y198.734 E.05768
G1 X88.552 Y145.154 E1.59597
G1 X90.488 Y145.154 E.05768
G1 X90.488 Y146.734 E.04706
G1 X90.192 Y146.734 E.00883
M204 S5000
G1 X90.281 Y146.015 F15000
; FEATURE: Top surface
G1 F4738
M204 S1000
G1 X89.628 Y145.362 E.02751
G1 X89.094 Y145.362
G1 X90.26 Y146.527 E.04909
G1 X89.924 Y146.725
G1 X88.759 Y145.56 E.04909
G1 X88.759 Y146.093
G1 X89.924 Y147.258 E.04909
G1 X89.924 Y147.791
G1 X88.759 Y146.626 E.04909
G1 X88.759 Y147.159
G1 X89.924 Y148.325 E.04909
G1 X89.924 Y148.858
G1 X88.759 Y147.693 E.04909
G1 X88.759 Y148.226
G1 X89.924 Y149.391 E.04909
G1 X89.924 Y149.924
G1 X88.759 Y148.759 E.04909
G1 X88.759 Y149.292
G1 X89.924 Y150.458 E.04909
G1 X89.924 Y150.991
G1 X88.759 Y149.826 E.04909
G1 X88.759 Y150.359
G1 X89.924 Y151.524 E.04909
G1 X89.924 Y152.057
G1 X88.759 Y150.892 E.04909
G1 X88.759 Y151.425
G1 X89.924 Y152.591 E.04909
G1 X89.924 Y153.124
G1 X88.759 Y151.959 E.04909
G1 X88.759 Y152.492
G1 X89.924 Y153.657 E.04909
G1 X89.924 Y154.19
G1 X88.759 Y153.025 E.04909
G1 X88.759 Y153.558
G1 X89.924 Y154.724 E.04909
G1 X89.924 Y155.257
G1 X88.759 Y154.092 E.04909
G1 X88.759 Y154.625
G1 X89.924 Y155.79 E.04909
G1 X89.924 Y156.323
G1 X88.759 Y155.158 E.04909
G1 X88.759 Y155.691
G1 X89.924 Y156.857 E.04909
G1 X89.924 Y157.39
G1 X88.759 Y156.225 E.04909
G1 X88.759 Y156.758
G1 X89.924 Y157.923 E.04909
G1 X89.924 Y158.457
G1 X88.759 Y157.291 E.04909
G1 X88.759 Y157.825
G1 X89.924 Y158.99 E.04909
G1 X89.924 Y159.523
G1 X88.759 Y158.358 E.04909
G1 X88.759 Y158.891
G1 X89.924 Y160.056 E.04909
G1 X89.924 Y160.59
G1 X88.759 Y159.424 E.04909
G1 X88.759 Y159.958
G1 X89.924 Y161.123 E.04909
G1 X89.924 Y161.656
G1 X88.759 Y160.491 E.04909
G1 X88.759 Y161.024
G1 X89.924 Y162.189 E.04909
G1 X89.924 Y162.723
G1 X88.759 Y161.557 E.04909
G1 X88.759 Y162.091
G1 X89.924 Y163.256 E.04909
G1 X89.924 Y163.789
G1 X88.759 Y162.624 E.04909
G1 X88.759 Y163.157
G1 X89.924 Y164.322 E.04909
G1 X89.924 Y164.856
G1 X88.759 Y163.69 E.04909
G1 X88.759 Y164.224
G1 X89.924 Y165.389 E.04909
G1 X89.924 Y165.922
G1 X88.759 Y164.757 E.04909
G1 X88.759 Y165.29
G1 X89.924 Y166.455 E.04909
G1 X89.924 Y166.989
G1 X88.759 Y165.823 E.04909
G1 X88.759 Y166.357
G1 X89.924 Y167.522 E.04909
G1 X89.924 Y168.055
G1 X88.759 Y166.89 E.04909
G1 X88.759 Y167.423
G1 X89.924 Y168.588 E.04909
G1 X89.924 Y169.122
G1 X88.759 Y167.956 E.04909
G1 X88.759 Y168.49
G1 X89.924 Y169.655 E.04909
G1 X89.924 Y170.188
G1 X88.759 Y169.023 E.04909
G1 X88.759 Y169.556
G1 X89.924 Y170.721 E.04909
G1 X89.924 Y171.255
G1 X88.759 Y170.089 E.04909
G1 X88.759 Y170.623
G1 X89.924 Y171.788 E.04909
G1 X89.924 Y172.321
G1 X88.759 Y171.156 E.04909
G1 X88.759 Y171.689
G1 X89.924 Y172.854 E.04909
G1 X89.924 Y173.388
G1 X88.759 Y172.222 E.04909
G1 X88.759 Y172.756
G1 X89.924 Y173.921 E.04909
G1 X89.924 Y174.454
G1 X88.759 Y173.289 E.04909
G1 X88.759 Y173.822
G1 X89.924 Y174.988 E.04909
G1 X89.924 Y175.521
G1 X88.759 Y174.356 E.04909
G1 X88.759 Y174.889
G1 X89.924 Y176.054 E.04909
G1 X89.924 Y176.587
G1 X88.759 Y175.422 E.04909
G1 X88.759 Y175.955
G1 X89.924 Y177.121 E.04909
G1 X89.924 Y177.654
G1 X88.759 Y176.489 E.04909
G1 X88.759 Y177.022
G1 X89.924 Y178.187 E.04909
G1 X89.924 Y178.72
G1 X88.759 Y177.555 E.04909
G1 X88.759 Y178.088
G1 X89.924 Y179.254 E.04909
G1 X89.924 Y179.787
G1 X88.759 Y178.622 E.04909
G1 X88.759 Y179.155
G1 X89.924 Y180.32 E.04909
G1 X89.924 Y180.853
G1 X88.759 Y179.688 E.04909
G1 X88.759 Y180.221
G1 X89.924 Y181.387 E.04909
G1 X89.924 Y181.92
G1 X88.759 Y180.755 E.04909
G1 X88.759 Y181.288
G1 X89.924 Y182.453 E.04909
G1 X89.924 Y182.986
G1 X88.759 Y181.821 E.04909
G1 X88.759 Y182.354
G1 X89.924 Y183.52 E.04909
G1 X89.924 Y184.053
G1 X88.759 Y182.888 E.04909
G1 X88.759 Y183.421
G1 X89.924 Y184.586 E.04909
G1 X89.924 Y185.119
G1 X88.759 Y183.954 E.04909
G1 X88.759 Y184.487
G1 X89.924 Y185.653 E.04909
G1 X89.924 Y186.186
G1 X88.759 Y185.021 E.04909
G1 X88.759 Y185.554
G1 X89.924 Y186.719 E.04909
G1 X89.924 Y187.252
G1 X88.759 Y186.087 E.04909
G1 X88.759 Y186.62
G1 X89.924 Y187.786 E.04909
G1 X89.924 Y188.319
G1 X88.759 Y187.154 E.04909
G1 X88.759 Y187.687
G1 X89.924 Y188.852 E.04909
G1 X89.924 Y189.385
G1 X88.759 Y188.22 E.04909
G1 X88.759 Y188.753
G1 X89.924 Y189.919 E.04909
G1 X89.924 Y190.452
G1 X88.759 Y189.287 E.04909
G1 X88.759 Y189.82
G1 X89.924 Y190.985 E.04909
G1 X89.924 Y191.518
G1 X88.759 Y190.353 E.04909
G1 X88.759 Y190.886
G1 X89.924 Y192.052 E.04909
G1 X89.924 Y192.585
M73 P97 R0
G1 X88.759 Y191.42 E.04909
G1 X88.759 Y191.953
G1 X89.924 Y193.118 E.04909
G1 X89.924 Y193.652
G1 X88.759 Y192.486 E.04909
G1 X88.759 Y193.02
G1 X89.924 Y194.185 E.04909
G1 X89.924 Y194.718
G1 X88.759 Y193.553 E.04909
G1 X88.759 Y194.086
G1 X89.924 Y195.251 E.04909
G1 X89.924 Y195.785
G1 X88.759 Y194.619 E.04909
G1 X88.759 Y195.153
G1 X89.924 Y196.318 E.04909
G1 X89.924 Y196.851
G1 X88.759 Y195.686 E.04909
G1 X88.759 Y196.219
G1 X90.281 Y197.741 E.0641
G1 X90.281 Y198.274
G1 X88.759 Y196.752 E.0641
G1 X88.759 Y197.286
G1 X90 Y198.527 E.05229
G1 X89.467 Y198.527
G1 X88.759 Y197.819 E.02983
; WIPE_START
G1 F6000
M204 S5000
G1 X89.467 Y198.527 E-.38054
G1 X90 Y198.527 E-.20264
G1 X89.671 Y198.198 E-.17682
; WIPE_END
G1 E-.04 F1800
G1 X89.578 Y190.566 Z5.4 F15000
G1 X89.024 Y145.432 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145685
G1 F4738
G2 X88.74 Y145.392 I-.191 J.323 E.00239
; OBJECT_ID: 121
; WIPE_START
G1 F7500
G1 X88.927 Y145.392 E-.48617
G1 X89.024 Y145.432 E-.27383
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 81
M625
; start printing object, unique label id: 121
M624 AgAAAAAAAAA=
G1 X89.156 Y137.801 Z5.4 F15000
G1 X90.491 Y60.392 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4738
M204 S2500
G1 X90.491 Y110.812 E1.50184
G1 X90.848 Y110.812 E.01062
G1 X90.848 Y112.392 E.04706
G1 X88.911 Y112.392 E.05768
G1 X88.911 Y58.812 E1.59597
G1 X90.848 Y58.812 E.05768
G1 X90.848 Y60.392 E.04706
G1 X90.551 Y60.392 E.00883
M204 S5000
G1 X90.64 Y59.673 F15000
; FEATURE: Top surface
G1 F4738
M204 S1000
G1 X89.987 Y59.02 E.02751
G1 X89.454 Y59.02
G1 X90.619 Y60.185 E.04909
G1 X90.284 Y60.383
G1 X89.119 Y59.218 E.04909
G1 X89.119 Y59.751
G1 X90.284 Y60.916 E.04909
G1 X90.284 Y61.449
G1 X89.119 Y60.284 E.04909
G1 X89.119 Y60.817
G1 X90.284 Y61.983 E.04909
G1 X90.284 Y62.516
G1 X89.119 Y61.351 E.04909
G1 X89.119 Y61.884
G1 X90.284 Y63.049 E.04909
G1 X90.284 Y63.582
G1 X89.119 Y62.417 E.04909
G1 X89.119 Y62.95
G1 X90.284 Y64.116 E.04909
G1 X90.284 Y64.649
G1 X89.119 Y63.484 E.04909
G1 X89.119 Y64.017
G1 X90.284 Y65.182 E.04909
G1 X90.284 Y65.715
G1 X89.119 Y64.55 E.04909
G1 X89.119 Y65.083
G1 X90.284 Y66.249 E.04909
G1 X90.284 Y66.782
G1 X89.119 Y65.617 E.04909
G1 X89.119 Y66.15
G1 X90.284 Y67.315 E.04909
G1 X90.284 Y67.849
G1 X89.119 Y66.683 E.04909
G1 X89.119 Y67.217
G1 X90.284 Y68.382 E.04909
G1 X90.284 Y68.915
G1 X89.119 Y67.75 E.04909
G1 X89.119 Y68.283
G1 X90.284 Y69.448 E.04909
G1 X90.284 Y69.982
G1 X89.119 Y68.816 E.04909
G1 X89.119 Y69.35
G1 X90.284 Y70.515 E.04909
G1 X90.284 Y71.048
G1 X89.119 Y69.883 E.04909
G1 X89.119 Y70.416
G1 X90.284 Y71.581 E.04909
G1 X90.284 Y72.115
G1 X89.119 Y70.949 E.04909
G1 X89.119 Y71.483
G1 X90.284 Y72.648 E.04909
G1 X90.284 Y73.181
G1 X89.119 Y72.016 E.04909
G1 X89.119 Y72.549
G1 X90.284 Y73.714 E.04909
G1 X90.284 Y74.248
G1 X89.119 Y73.082 E.04909
G1 X89.119 Y73.616
G1 X90.284 Y74.781 E.04909
G1 X90.284 Y75.314
G1 X89.119 Y74.149 E.04909
G1 X89.119 Y74.682
G1 X90.284 Y75.847 E.04909
G1 X90.284 Y76.381
G1 X89.119 Y75.215 E.04909
G1 X89.119 Y75.749
G1 X90.284 Y76.914 E.04909
G1 X90.284 Y77.447
G1 X89.119 Y76.282 E.04909
G1 X89.119 Y76.815
G1 X90.284 Y77.98 E.04909
G1 X90.284 Y78.514
G1 X89.119 Y77.348 E.04909
G1 X89.119 Y77.882
G1 X90.284 Y79.047 E.04909
G1 X90.284 Y79.58
G1 X89.119 Y78.415 E.04909
G1 X89.119 Y78.948
G1 X90.284 Y80.113 E.04909
G1 X90.284 Y80.647
G1 X89.119 Y79.481 E.04909
G1 X89.119 Y80.015
G1 X90.284 Y81.18 E.04909
G1 X90.284 Y81.713
G1 X89.119 Y80.548 E.04909
G1 X89.119 Y81.081
G1 X90.284 Y82.246 E.04909
G1 X90.284 Y82.78
G1 X89.119 Y81.614 E.04909
G1 X89.119 Y82.148
G1 X90.284 Y83.313 E.04909
G1 X90.284 Y83.846
G1 X89.119 Y82.681 E.04909
G1 X89.119 Y83.214
G1 X90.284 Y84.379 E.04909
G1 X90.284 Y84.913
G1 X89.119 Y83.747 E.04909
G1 X89.119 Y84.281
G1 X90.284 Y85.446 E.04909
G1 X90.284 Y85.979
G1 X89.119 Y84.814 E.04909
G1 X89.119 Y85.347
G1 X90.284 Y86.513 E.04909
G1 X90.284 Y87.046
G1 X89.119 Y85.881 E.04909
G1 X89.119 Y86.414
G1 X90.284 Y87.579 E.04909
G1 X90.284 Y88.112
G1 X89.119 Y86.947 E.04909
G1 X89.119 Y87.48
G1 X90.284 Y88.646 E.04909
G1 X90.284 Y89.179
G1 X89.119 Y88.014 E.04909
G1 X89.119 Y88.547
G1 X90.284 Y89.712 E.04909
G1 X90.284 Y90.245
G1 X89.119 Y89.08 E.04909
G1 X89.119 Y89.613
G1 X90.284 Y90.779 E.04909
G1 X90.284 Y91.312
G1 X89.119 Y90.147 E.04909
G1 X89.119 Y90.68
G1 X90.284 Y91.845 E.04909
G1 X90.284 Y92.378
G1 X89.119 Y91.213 E.04909
G1 X89.119 Y91.746
G1 X90.284 Y92.912 E.04909
G1 X90.284 Y93.445
G1 X89.119 Y92.28 E.04909
G1 X89.119 Y92.813
G1 X90.284 Y93.978 E.04909
G1 X90.284 Y94.511
G1 X89.119 Y93.346 E.04909
G1 X89.119 Y93.879
G1 X90.284 Y95.045 E.04909
G1 X90.284 Y95.578
G1 X89.119 Y94.413 E.04909
G1 X89.119 Y94.946
G1 X90.284 Y96.111 E.04909
G1 X90.284 Y96.644
G1 X89.119 Y95.479 E.04909
G1 X89.119 Y96.012
G1 X90.284 Y97.178 E.04909
G1 X90.284 Y97.711
M73 P98 R0
G1 X89.119 Y96.546 E.04909
G1 X89.119 Y97.079
G1 X90.284 Y98.244 E.04909
G1 X90.284 Y98.777
G1 X89.119 Y97.612 E.04909
G1 X89.119 Y98.145
G1 X90.284 Y99.311 E.04909
G1 X90.284 Y99.844
G1 X89.119 Y98.679 E.04909
G1 X89.119 Y99.212
G1 X90.284 Y100.377 E.04909
G1 X90.284 Y100.91
G1 X89.119 Y99.745 E.04909
G1 X89.119 Y100.278
G1 X90.284 Y101.444 E.04909
G1 X90.284 Y101.977
G1 X89.119 Y100.812 E.04909
G1 X89.119 Y101.345
G1 X90.284 Y102.51 E.04909
G1 X90.284 Y103.043
G1 X89.119 Y101.878 E.04909
G1 X89.119 Y102.412
G1 X90.284 Y103.577 E.04909
G1 X90.284 Y104.11
G1 X89.119 Y102.945 E.04909
G1 X89.119 Y103.478
G1 X90.284 Y104.643 E.04909
G1 X90.284 Y105.177
G1 X89.119 Y104.011 E.04909
G1 X89.119 Y104.545
G1 X90.284 Y105.71 E.04909
G1 X90.284 Y106.243
G1 X89.119 Y105.078 E.04909
G1 X89.119 Y105.611
G1 X90.284 Y106.776 E.04909
G1 X90.284 Y107.31
G1 X89.119 Y106.144 E.04909
G1 X89.119 Y106.678
G1 X90.284 Y107.843 E.04909
G1 X90.284 Y108.376
G1 X89.119 Y107.211 E.04909
G1 X89.119 Y107.744
G1 X90.284 Y108.909 E.04909
G1 X90.284 Y109.443
G1 X89.119 Y108.277 E.04909
G1 X89.119 Y108.811
G1 X90.284 Y109.976 E.04909
G1 X90.284 Y110.509
G1 X89.119 Y109.344 E.04909
G1 X89.119 Y109.877
G1 X90.64 Y111.399 E.0641
G1 X90.64 Y111.932
G1 X89.119 Y110.41 E.0641
G1 X89.119 Y110.944
G1 X90.36 Y112.185 E.05229
G1 X89.827 Y112.185
G1 X89.119 Y111.477 E.02983
; WIPE_START
G1 F6000
M204 S5000
G1 X89.827 Y112.185 E-.38054
G1 X90.36 Y112.185 E-.20264
G1 X90.031 Y111.856 E-.17682
; WIPE_END
G1 E-.04 F1800
G1 X89.937 Y104.224 Z5.4 F15000
G1 X89.384 Y59.09 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.145685
G1 F4738
G2 X89.1 Y59.05 I-.191 J.323 E.00239
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F7500
G1 X89.286 Y59.05 E-.48617
G1 X89.384 Y59.09 E-.27383
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.217 J0 P1  F15000
; stop printing object, unique label id: 121
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
G1 Z5.5 F900 ; lower z a little
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

    G1 Z105 F600
    G1 Z103

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

