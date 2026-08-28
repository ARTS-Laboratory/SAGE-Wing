; HEADER_BLOCK_START
; BambuStudio 02.06.00.51
; model printing time: 22m 17s; total estimated time: 28m 38s
; total layer number: 17
; total filament length [mm] : 2525.45
; total filament volume [cm^3] : 6074.41
; total filament weight [g] : 7.78
; model label id: 470,481,503,525
; object max height: 3.40,3.40,3.40,3.40
; filament_density: 1.28
; filament_diameter: 1.75
; max_z_height: 3.40
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
M73 P0 R28
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
M73 P1 R28
G1 E50 F200
M400
M104 S250
G92 E0
M73 P17 R23
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S230 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P18 R23
G1 E-0.5 F300

G1 X70 F9000
M73 P19 R23
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
    G29 A X39.0111 Y33.8123 I187.453 J187.856
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
M73 P19 R22
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
; layer num/total_layer_count: 1/17
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S3000
G1 Z.4 F15000
; object ids of layer 1 start: 470,481,503,525
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
; object ids of this layer1 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
M73 P20 R22
G1 X41.103 Y160.327
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
G1 X41.871 Y160.212 E.02802
G1 X125.843 Y160.212 E3.0319
G1 X126.331 Y160.258 E.0177
G1 X126.793 Y160.395 E.01739
G1 X127.15 Y160.571 E.01439
G1 X127.55 Y160.845 E.0175
G1 X127.887 Y161.186 E.0173
G1 X128.152 Y161.584 E.01726
G1 X128.352 Y162.075 E.01917
G1 X128.467 Y162.843 E.02802
G1 X128.467 Y216.815 E1.94871
G1 X128.421 Y217.303 E.0177
G1 X128.284 Y217.766 E.01745
G1 X128.154 Y218.04 E.01096
G1 X127.833 Y218.523 E.02093
G1 X127.493 Y218.859 E.01724
G1 X127.096 Y219.124 E.01726
M73 P21 R22
G1 X126.604 Y219.324 E.01917
G1 X125.836 Y219.439 E.02802
G1 X41.865 Y219.439 E3.03189
G1 X41.376 Y219.393 E.0177
G1 X40.913 Y219.256 E.01745
G1 X40.639 Y219.126 E.01096
G1 X40.156 Y218.805 E.02093
G1 X39.82 Y218.465 E.01724
G1 X39.555 Y218.068 E.01726
G1 X39.355 Y217.576 E.01917
G1 X39.24 Y216.808 E.02802
G1 X39.24 Y162.836 E1.94872
G1 X39.286 Y162.348 E.0177
G1 X39.423 Y161.885 E.01745
G1 X39.553 Y161.611 E.01096
G1 X39.874 Y161.128 E.02093
G1 X40.214 Y160.792 E.01724
G1 X40.612 Y160.527 E.01726
G1 X41.048 Y160.35 E.017
M204 S3000
G1 X41.21 Y160.777 F15000
G1 F1500
M204 S250
G1 X41.915 Y160.669 E.02576
G1 X125.827 Y160.669 E3.02974
G1 X126.256 Y160.713 E.01556
G1 X126.636 Y160.827 E.01434
G1 X126.927 Y160.972 E.01172
G1 X127.245 Y161.189 E.01391
M73 P22 R22
G1 X127.521 Y161.466 E.01413
G1 X127.738 Y161.787 E.01398
G1 X127.902 Y162.182 E.01544
G1 X128.01 Y162.887 E.02576
G1 X128.01 Y216.786 E1.94608
G1 X127.971 Y217.202 E.01509
G1 X127.851 Y217.612 E.01542
G1 X127.75 Y217.823 E.00844
G1 X127.486 Y218.219 E.01718
G1 X127.193 Y218.51 E.01492
G1 X126.868 Y218.723 E.01403
G1 X126.497 Y218.874 E.01444
G1 X125.792 Y218.982 E.02576
G1 X41.893 Y218.982 E3.02926
G1 X41.477 Y218.943 E.01509
G1 X41.067 Y218.823 E.01542
G1 X40.856 Y218.722 E.00844
G1 X40.46 Y218.458 E.01718
G1 X40.169 Y218.165 E.01492
G1 X39.956 Y217.84 E.01403
G1 X39.805 Y217.469 E.01444
G1 X39.697 Y216.764 E.02576
G1 X39.697 Y162.865 E1.94609
G1 X39.736 Y162.449 E.01509
G1 X39.856 Y162.039 E.01542
G1 X39.958 Y161.828 E.00844
G1 X40.221 Y161.432 E.01718
G1 X40.515 Y161.141 E.01492
G1 X40.839 Y160.928 E.01403
G1 X41.154 Y160.8 E.01228
M204 S3000
G1 X41.318 Y161.227 F15000
G1 F1500
M204 S250
G1 X41.961 Y161.126 E.0235
G1 X125.797 Y161.126 E3.02701
G1 X126.153 Y161.162 E.01292
G1 X126.478 Y161.259 E.01224
G1 X126.703 Y161.372 E.00908
G1 X126.941 Y161.535 E.01042
G1 X127.158 Y161.749 E.011
G1 X127.326 Y161.993 E.0107
G1 X127.452 Y162.291 E.01167
G1 X127.553 Y162.933 E.02346
G1 X127.553 Y216.758 E1.94343
G1 X127.517 Y217.129 E.01344
G1 X127.418 Y217.458 E.01241
G1 X127.346 Y217.604 E.00588
M73 P23 R22
G1 X127.139 Y217.916 E.01351
G1 X126.892 Y218.16 E.01256
G1 X126.642 Y218.322 E.01075
G1 X126.39 Y218.424 E.00983
G1 X125.747 Y218.525 E.0235
G1 X41.921 Y218.525 E3.02661
G1 X41.551 Y218.489 E.01344
G1 X41.221 Y218.39 E.01241
G1 X41.075 Y218.318 E.00588
G1 X40.763 Y218.111 E.01351
G1 X40.519 Y217.864 E.01256
G1 X40.357 Y217.614 E.01075
G1 X40.255 Y217.362 E.00983
G1 X40.154 Y216.719 E.0235
G1 X40.154 Y162.893 E1.94343
G1 X40.191 Y162.523 E.01343
G1 X40.289 Y162.193 E.01241
G1 X40.361 Y162.047 E.00588
M73 P23 R21
G1 X40.568 Y161.735 E.01351
G1 X40.815 Y161.491 E.01256
G1 X41.065 Y161.329 E.01075
G1 X41.262 Y161.249 E.00767
M204 S3000
G1 X41.454 Y161.662 F15000
G1 F1500
M204 S250
G1 X41.595 Y161.619 E.00535
G1 X41.873 Y161.583 E.01012
G1 X125.831 Y161.583 E3.03137
G1 X126.147 Y161.632 E.01156
G1 X126.265 Y161.669 E.00446
G1 X126.566 Y161.829 E.01232
G1 X126.776 Y162.019 E.01024
G1 X126.924 Y162.229 E.00926
G1 X127.017 Y162.425 E.00785
G1 X127.06 Y162.567 E.00535
G1 X127.096 Y162.845 E.01012
G1 X127.096 Y216.803 E1.94819
G1 X127.048 Y217.119 E.01156
G1 X127.01 Y217.237 E.00446
G1 X126.85 Y217.538 E.01232
G1 X126.66 Y217.748 E.01024
G1 X126.451 Y217.896 E.00926
G1 X126.254 Y217.989 E.00785
G1 X126.112 Y218.032 E.00535
G1 X125.834 Y218.068 E.01012
G1 X41.877 Y218.068 E3.03137
G1 X41.56 Y218.02 E.01156
G1 X41.442 Y217.982 E.00446
G1 X41.141 Y217.822 E.01232
G1 X40.931 Y217.632 E.01023
G1 X40.783 Y217.422 E.00926
G1 X40.69 Y217.226 E.00786
G1 X40.647 Y217.084 E.00535
G1 X40.611 Y216.806 E.01012
G1 X40.611 Y162.848 E1.94819
G1 X40.66 Y162.531 E.01161
G1 X40.731 Y162.323 E.00794
M73 P24 R21
G1 X40.798 Y162.205 E.00489
G1 X41.05 Y161.901 E.01425
G1 X41.257 Y161.755 E.00914
G1 X41.399 Y161.688 E.00569
M204 S3000
G1 X41.593 Y162.102 F15000
G1 F1500
M204 S250
G1 X41.657 Y162.072 E.00252
G1 X41.864 Y162.04 E.00758
G1 X125.841 Y162.04 E3.03207
G1 X126.071 Y162.082 E.00845
G1 X126.262 Y162.169 E.00759
G1 X126.415 Y162.298 E.0072
G1 X126.505 Y162.412 E.00525
G1 X126.607 Y162.629 E.00865
G1 X126.639 Y162.836 E.00758
G1 X126.639 Y216.813 E1.94889
G1 X126.597 Y217.043 E.00845
G1 X126.51 Y217.234 E.00759
G1 X126.381 Y217.387 E.0072
G1 X126.267 Y217.477 E.00525
G1 X126.05 Y217.579 E.00865
G1 X125.843 Y217.611 E.00758
G1 X41.866 Y217.611 E3.03207
G1 X41.636 Y217.569 E.00845
G1 X41.445 Y217.482 E.00759
G1 X41.292 Y217.353 E.0072
G1 X41.202 Y217.239 E.00525
G1 X41.1 Y217.022 E.00865
G1 X41.068 Y216.815 E.00758
G1 X41.068 Y162.838 E1.94889
G1 X41.111 Y162.604 E.00857
G1 X41.158 Y162.486 E.0046
G1 X41.326 Y162.264 E.01005
G1 X41.44 Y162.174 E.00525
G1 X41.539 Y162.127 E.00396
M204 S3000
G1 X41.737 Y162.521 F15000
G1 F1500
M204 S250
G1 X41.854 Y162.497 E.00429
G1 X125.854 Y162.497 E3.0329
G1 X125.964 Y162.526 E.00413
G1 X126.049 Y162.572 E.0035
G1 X126.158 Y162.709 E.00632
G1 X126.182 Y162.826 E.00429
G1 X126.182 Y216.826 E1.94972
G1 X126.154 Y216.936 E.00413
G1 X126.107 Y217.021 E.0035
G1 X125.97 Y217.13 E.00632
G1 X125.854 Y217.154 E.00429
G1 X41.854 Y217.154 E3.0329
G1 X41.743 Y217.126 E.00413
G1 X41.658 Y217.079 E.0035
G1 X41.549 Y216.942 E.00632
G1 X41.525 Y216.826 E.00429
G1 X41.525 Y162.826 E1.94972
G1 X41.554 Y162.715 E.00413
G1 X41.6 Y162.63 E.0035
G1 X41.69 Y162.559 E.00415
; WIPE_START
G1 X41.854 Y162.497 E-.06629
G1 X43.679 Y162.497 E-.69371
; WIPE_END
M73 P25 R21
G1 E-.04 F1800
M204 S3000
G1 X50.051 Y166.699 Z.6 F15000
G1 X125.454 Y216.426 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X42.254 Y216.426 E3.00402
G1 X42.254 Y163.226 E1.92084
G1 X125.454 Y163.226 E3.00402
G1 X125.454 Y216.366 E1.91867
M204 S3000
G1 X124.997 Y215.969 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X42.711 Y215.969 E2.97101
G1 X42.711 Y163.683 E1.88783
G1 X124.997 Y163.683 E2.97101
G1 X124.997 Y215.909 E1.88567
; WIPE_START
G1 X122.997 Y215.91 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X116.589 Y211.763 Z.6 F15000
G1 X43.454 Y164.426 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X124.254 Y164.426 E2.91737
G1 X124.254 Y215.226 E1.83419
G1 X43.454 Y215.226 E2.91737
G1 X43.454 Y164.486 E1.83202
M204 S3000
G1 X42.996 Y164.426 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X42.996 Y163.968 E.0165
G1 X124.711 Y163.968 E2.95037
G1 X124.711 Y215.683 E1.86719
G1 X42.996 Y215.683 E2.95037
G1 X42.996 Y164.486 E1.84852
; OBJECT_ID: 503
; WIPE_START
G1 X42.996 Y163.968 E-.19649
G1 X44.479 Y163.968 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
M204 S3000
G1 X52.112 Y164.012 Z.6 F15000
G1 X136.045 Y164.486 Z.6
G1 Z.2
M73 P26 R21
G1 E.8 F1800
; FEATURE: Brim
G1 F1500
M204 S250
G1 X136.045 Y133.623 E1.11431
G1 X136.092 Y133.135 E.0177
G1 X136.228 Y132.672 E.01745
G1 X136.359 Y132.398 E.01096
G1 X136.679 Y131.915 E.02093
G1 X137.019 Y131.579 E.01724
G1 X137.417 Y131.314 E.01726
G1 X137.909 Y131.114 E.01917
G1 X138.676 Y130.999 E.02802
G1 X222.648 Y130.999 E3.0319
G1 X223.136 Y131.045 E.0177
G1 X223.598 Y131.182 E.01739
G1 X223.955 Y131.358 E.01439
G1 X224.355 Y131.632 E.0175
G1 X224.692 Y131.973 E.0173
G1 X224.957 Y132.37 E.01726
G1 X225.157 Y132.862 E.01917
M73 P26 R20
G1 X225.273 Y133.63 E.02802
G1 X225.273 Y187.602 E1.94871
G1 X225.226 Y188.09 E.0177
G1 X225.089 Y188.553 E.01745
M73 P27 R20
G1 X224.959 Y188.827 E.01096
G1 X224.639 Y189.31 E.02093
G1 X224.299 Y189.646 E.01724
G1 X223.901 Y189.911 E.01726
G1 X223.409 Y190.111 E.01917
G1 X222.642 Y190.226 E.02802
G1 X138.67 Y190.226 E3.03189
G1 X138.182 Y190.18 E.0177
G1 X137.718 Y190.043 E.01745
G1 X137.444 Y189.913 E.01096
G1 X136.961 Y189.592 E.02093
G1 X136.626 Y189.252 E.01724
G1 X136.36 Y188.855 E.01726
M73 P28 R20
G1 X136.16 Y188.363 E.01917
G1 X136.045 Y187.595 E.02802
G1 X136.045 Y164.546 E.83224
M204 S3000
G1 X136.502 Y164.546 F15000
G1 F1500
M204 S250
G1 X136.502 Y133.652 E1.11545
G1 X136.541 Y133.236 E.01509
G1 X136.661 Y132.826 E.01542
G1 X136.763 Y132.615 E.00844
G1 X137.026 Y132.219 E.01718
G1 X137.32 Y131.928 E.01492
G1 X137.645 Y131.715 E.01403
G1 X138.015 Y131.564 E.01444
G1 X138.72 Y131.456 E.02576
G1 X222.633 Y131.456 E3.02974
G1 X223.061 Y131.5 E.01556
G1 X223.442 Y131.614 E.01434
G1 X223.732 Y131.759 E.01172
G1 X224.05 Y131.976 E.01391
G1 X224.327 Y132.253 E.01413
G1 X224.544 Y132.574 E.01398
G1 X224.707 Y132.969 E.01544
G1 X224.816 Y133.674 E.02576
G1 X224.816 Y187.573 E1.94608
G1 X224.776 Y187.989 E.01509
G1 X224.656 Y188.399 E.01542
M73 P29 R20
G1 X224.555 Y188.61 E.00844
G1 X224.292 Y189.006 E.01718
G1 X223.998 Y189.297 E.01492
G1 X223.673 Y189.51 E.01403
G1 X223.302 Y189.661 E.01444
G1 X222.597 Y189.769 E.02576
G1 X138.698 Y189.769 E3.02926
G1 X138.282 Y189.73 E.01509
G1 X137.872 Y189.61 E.01542
G1 X137.662 Y189.509 E.00844
G1 X137.265 Y189.245 E.01718
G1 X136.974 Y188.952 E.01492
G1 X136.761 Y188.627 E.01403
G1 X136.61 Y188.256 E.01444
G1 X136.502 Y187.551 E.02576
G1 X136.502 Y164.606 E.82847
M204 S3000
G1 X136.959 Y164.606 F15000
G1 F1500
M204 S250
G1 X136.959 Y133.68 E1.11661
G1 X136.996 Y133.309 E.01343
G1 X137.094 Y132.98 E.01241
G1 X137.166 Y132.834 E.00588
G1 X137.373 Y132.522 E.01351
G1 X137.62 Y132.278 E.01256
G1 X137.871 Y132.116 E.01075
G1 X138.123 Y132.014 E.00983
G1 X138.766 Y131.913 E.0235
G1 X222.603 Y131.913 E3.02701
G1 X222.959 Y131.949 E.01292
G1 X223.284 Y132.046 E.01224
G1 X223.508 Y132.159 E.00908
G1 X223.746 Y132.322 E.01042
G1 X223.963 Y132.536 E.011
G1 X224.131 Y132.78 E.0107
G1 X224.257 Y133.078 E.01167
G1 X224.359 Y133.72 E.02346
G1 X224.359 Y187.545 E1.94343
G1 X224.322 Y187.916 E.01344
G1 X224.223 Y188.245 E.01241
G1 X224.152 Y188.391 E.00588
G1 X223.945 Y188.703 E.01351
G1 X223.697 Y188.947 E.01256
G1 X223.447 Y189.109 E.01075
G1 X223.195 Y189.211 E.00983
G1 X222.552 Y189.312 E.0235
G1 X138.726 Y189.312 E3.02661
G1 X138.356 Y189.275 E.01344
G1 X138.027 Y189.177 E.01241
G1 X137.881 Y189.105 E.00588
G1 X137.569 Y188.898 E.01351
G1 X137.324 Y188.651 E.01256
G1 X137.163 Y188.401 E.01075
G1 X137.06 Y188.148 E.00983
G1 X136.959 Y187.506 E.0235
G1 X136.959 Y164.666 E.82466
M204 S3000
G1 X137.416 Y164.666 F15000
G1 F1500
M204 S250
M73 P30 R20
G1 X137.416 Y133.635 E1.12037
G1 X137.465 Y133.318 E.01161
G1 X137.537 Y133.11 E.00794
G1 X137.603 Y132.992 E.00489
G1 X137.855 Y132.688 E.01425
G1 X138.062 Y132.542 E.00914
G1 X138.259 Y132.449 E.00786
G1 X138.4 Y132.406 E.00535
G1 X138.678 Y132.37 E.01012
G1 X222.636 Y132.37 E3.03137
G1 X222.952 Y132.418 E.01156
G1 X223.07 Y132.456 E.00446
M73 P30 R19
G1 X223.372 Y132.616 E.01232
G1 X223.581 Y132.806 E.01024
G1 X223.73 Y133.016 E.00926
G1 X223.822 Y133.212 E.00785
G1 X223.865 Y133.354 E.00535
G1 X223.902 Y133.632 E.01012
G1 X223.902 Y187.59 E1.94819
G1 X223.853 Y187.906 E.01156
G1 X223.816 Y188.024 E.00446
G1 X223.656 Y188.325 E.01232
G1 X223.465 Y188.535 E.01024
G1 X223.256 Y188.683 E.00926
G1 X223.059 Y188.776 E.00785
G1 X222.917 Y188.819 E.00535
G1 X222.639 Y188.855 E.01012
G1 X138.682 Y188.855 E3.03137
G1 X138.365 Y188.807 E.01156
G1 X138.247 Y188.769 E.00446
G1 X137.946 Y188.609 E.01232
G1 X137.736 Y188.419 E.01023
G1 X137.588 Y188.209 E.00926
G1 X137.496 Y188.012 E.00786
G1 X137.452 Y187.871 E.00535
G1 X137.416 Y187.593 E.01012
G1 X137.416 Y164.726 E.82565
M204 S3000
G1 X137.873 Y164.726 F15000
G1 F1500
M204 S250
G1 X137.873 Y133.625 E1.12292
G1 X137.916 Y133.391 E.00857
G1 X137.963 Y133.273 E.0046
G1 X138.131 Y133.051 E.01005
G1 X138.245 Y132.961 E.00525
G1 X138.462 Y132.859 E.00865
G1 X138.669 Y132.827 E.00758
G1 X222.646 Y132.827 E3.03207
G1 X222.877 Y132.869 E.00845
G1 X223.068 Y132.956 E.00759
G1 X223.22 Y133.085 E.0072
G1 X223.311 Y133.199 E.00525
G1 X223.412 Y133.416 E.00865
G1 X223.444 Y133.623 E.00758
G1 X223.444 Y187.6 E1.94889
G1 X223.402 Y187.83 E.00845
G1 X223.315 Y188.021 E.00759
G1 X223.186 Y188.174 E.0072
G1 X223.073 Y188.264 E.00525
G1 X222.856 Y188.366 E.00865
G1 X222.648 Y188.398 E.00758
M73 P31 R19
G1 X138.671 Y188.398 E3.03207
G1 X138.441 Y188.356 E.00845
G1 X138.25 Y188.269 E.00759
G1 X138.098 Y188.14 E.0072
G1 X138.007 Y188.026 E.00525
G1 X137.905 Y187.809 E.00865
G1 X137.873 Y187.602 E.00758
G1 X137.873 Y164.786 E.82381
M204 S3000
G1 X138.33 Y164.786 F15000
G1 F1500
M204 S250
G1 X138.33 Y133.613 E1.12553
G1 X138.359 Y133.502 E.00413
G1 X138.406 Y133.417 E.0035
G1 X138.543 Y133.308 E.00632
G1 X138.659 Y133.284 E.00429
G1 X222.659 Y133.284 E3.0329
G1 X222.769 Y133.313 E.00413
G1 X222.854 Y133.359 E.0035
G1 X222.963 Y133.496 E.00632
G1 X222.987 Y133.613 E.00429
G1 X222.987 Y187.613 E1.94972
G1 X222.959 Y187.723 E.00413
G1 X222.912 Y187.808 E.0035
G1 X222.775 Y187.917 E.00632
G1 X222.659 Y187.941 E.00429
G1 X138.659 Y187.941 E3.0329
G1 X138.548 Y187.912 E.00413
G1 X138.463 Y187.866 E.0035
G1 X138.354 Y187.729 E.00632
G1 X138.33 Y187.613 E.00429
G1 X138.33 Y164.846 E.82202
; WIPE_START
G1 X138.33 Y162.846 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X145.66 Y164.974 Z.6 F15000
G1 X222.259 Y187.213 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X139.059 Y187.213 E3.00402
G1 X139.059 Y134.013 E1.92084
G1 X222.259 Y134.013 E3.00402
G1 X222.259 Y187.153 E1.91867
M204 S3000
G1 X221.802 Y186.755 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X139.516 Y186.755 E2.97101
G1 X139.516 Y134.47 E1.88783
G1 X221.802 Y134.47 E2.97101
G1 X221.802 Y186.695 E1.88567
; WIPE_START
G1 X219.802 Y186.697 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X213.394 Y182.55 Z.6 F15000
M73 P32 R19
G1 X140.259 Y135.213 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X221.059 Y135.213 E2.91737
G1 X221.059 Y186.013 E1.83419
G1 X140.259 Y186.013 E2.91737
G1 X140.259 Y135.273 E1.83202
M204 S3000
G1 X139.802 Y135.213 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X139.802 Y134.755 E.0165
G1 X221.516 Y134.755 E2.95037
G1 X221.516 Y186.47 E1.86719
G1 X139.802 Y186.47 E2.95037
G1 X139.802 Y135.273 E1.84852
; OBJECT_ID: 470
; WIPE_START
G1 X139.802 Y134.755 E-.19649
G1 X141.285 Y134.755 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
M204 S3000
G1 X141.025 Y127.127 Z.6 F15000
G1 X139.802 Y91.269 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F1500
M204 S250
G1 X139.632 Y91.269 E.00612
G1 X139.144 Y91.222 E.0177
G1 X138.681 Y91.085 E.01745
G1 X138.406 Y90.955 E.01096
G1 X137.924 Y90.634 E.02093
G1 X137.588 Y90.295 E.01724
G1 X137.323 Y89.897 E.01726
G1 X137.123 Y89.405 E.01917
G1 X137.007 Y88.638 E.02802
G1 X137.007 Y34.666 E1.94872
G1 X137.054 Y34.178 E.0177
G1 X137.191 Y33.714 E.01745
G1 X137.321 Y33.44 E.01096
G1 X137.642 Y32.957 E.02093
G1 X137.981 Y32.621 E.01724
M73 P33 R19
G1 X138.379 Y32.356 E.01726
G1 X138.871 Y32.156 E.01917
G1 X139.638 Y32.041 E.02802
G1 X223.61 Y32.041 E3.0319
G1 X224.098 Y32.088 E.0177
G1 X224.56 Y32.224 E.01739
M73 P33 R18
G1 X224.918 Y32.4 E.01439
G1 X225.318 Y32.674 E.0175
M73 P34 R18
G1 X225.654 Y33.015 E.0173
G1 X225.92 Y33.413 E.01726
G1 X226.12 Y33.904 E.01917
G1 X226.235 Y34.672 E.02802
G1 X226.235 Y88.644 E1.94871
G1 X226.188 Y89.132 E.0177
G1 X226.052 Y89.595 E.01745
G1 X225.921 Y89.869 E.01096
G1 X225.601 Y90.352 E.02093
G1 X225.261 Y90.688 E.01724
G1 X224.863 Y90.953 E.01726
G1 X224.371 Y91.153 E.01917
G1 X223.604 Y91.269 E.02802
G1 X139.862 Y91.269 E3.0236
M204 S3000
G1 X139.862 Y90.812 F15000
G1 F1500
M204 S250
M73 P35 R18
G1 X139.661 Y90.812 E.00726
G1 X139.244 Y90.772 E.01509
G1 X138.835 Y90.652 E.01542
G1 X138.624 Y90.551 E.00844
G1 X138.227 Y90.288 E.01718
G1 X137.937 Y89.994 E.01492
G1 X137.724 Y89.669 E.01403
G1 X137.573 Y89.298 E.01444
G1 X137.464 Y88.593 E.02576
G1 X137.464 Y34.694 E1.94609
G1 X137.504 Y34.278 E.01509
G1 X137.624 Y33.868 E.01542
G1 X137.725 Y33.657 E.00844
G1 X137.988 Y33.261 E.01718
G1 X138.282 Y32.97 E.01492
G1 X138.607 Y32.757 E.01403
G1 X138.978 Y32.606 E.01444
G1 X139.683 Y32.498 E.02576
G1 X223.595 Y32.498 E3.02974
G1 X224.024 Y32.542 E.01556
G1 X224.404 Y32.656 E.01434
G1 X224.695 Y32.801 E.01172
G1 X225.012 Y33.019 E.01391
G1 X225.289 Y33.295 E.01413
G1 X225.506 Y33.616 E.01398
G1 X225.67 Y34.011 E.01544
G1 X225.778 Y34.716 E.02576
G1 X225.778 Y88.615 E1.94608
G1 X225.739 Y89.032 E.01509
G1 X225.619 Y89.441 E.01542
G1 X225.517 Y89.652 E.00844
G1 X225.254 Y90.048 E.01718
G1 X224.96 Y90.339 E.01492
G1 X224.635 Y90.552 E.01403
G1 X224.265 Y90.703 E.01444
G1 X223.56 Y90.812 E.02576
G1 X139.922 Y90.812 E3.01983
M204 S3000
G1 X139.922 Y90.354 F15000
G1 F1500
M204 S250
G1 X139.689 Y90.354 E.00842
G1 X139.318 Y90.318 E.01344
G1 X138.989 Y90.219 E.01241
G1 X138.843 Y90.147 E.00588
G1 X138.531 Y89.94 E.01351
G1 X138.286 Y89.693 E.01256
G1 X138.125 Y89.443 E.01075
G1 X138.023 Y89.191 E.00983
G1 X137.922 Y88.548 E.0235
M73 P36 R18
G1 X137.922 Y34.722 E1.94343
G1 X137.958 Y34.352 E.01343
G1 X138.057 Y34.022 E.01241
G1 X138.128 Y33.876 E.00588
G1 X138.335 Y33.565 E.01351
G1 X138.583 Y33.32 E.01256
G1 X138.833 Y33.159 E.01075
G1 X139.085 Y33.056 E.00983
G1 X139.728 Y32.955 E.0235
G1 X223.565 Y32.956 E3.02701
G1 X223.921 Y32.991 E.01292
G1 X224.246 Y33.088 E.01224
G1 X224.47 Y33.201 E.00908
G1 X224.709 Y33.364 E.01042
G1 X224.926 Y33.578 E.011
G1 X225.094 Y33.822 E.0107
G1 X225.22 Y34.12 E.01167
G1 X225.321 Y34.762 E.02346
G1 X225.321 Y88.587 E1.94343
G1 X225.284 Y88.958 E.01344
G1 X225.186 Y89.287 E.01241
G1 X225.114 Y89.433 E.00588
G1 X224.907 Y89.745 E.01351
G1 X224.66 Y89.99 E.01256
G1 X224.41 Y90.151 E.01075
G1 X224.157 Y90.253 E.00983
G1 X223.514 Y90.354 E.0235
G1 X139.982 Y90.354 E3.01602
M204 S3000
G1 X139.982 Y89.897 F15000
G1 F1500
M204 S250
G1 X139.644 Y89.897 E.01219
G1 X139.328 Y89.849 E.01156
G1 X139.21 Y89.812 E.00446
G1 X138.908 Y89.652 E.01232
G1 X138.699 Y89.461 E.01023
G1 X138.551 Y89.252 E.00926
G1 X138.458 Y89.055 E.00786
G1 X138.415 Y88.913 E.00535
G1 X138.379 Y88.635 E.01012
G1 X138.379 Y34.678 E1.94819
G1 X138.428 Y34.36 E.01161
G1 X138.499 Y34.152 E.00794
G1 X138.566 Y34.034 E.00489
G1 X138.818 Y33.73 E.01425
G1 X139.024 Y33.584 E.00914
G1 X139.221 Y33.492 E.00786
G1 X139.363 Y33.448 E.00535
G1 X139.641 Y33.412 E.01012
G1 X223.598 Y33.412 E3.03137
G1 X223.915 Y33.461 E.01156
G1 X224.033 Y33.498 E.00446
G1 X224.334 Y33.658 E.01232
G1 X224.544 Y33.848 E.01024
G1 X224.692 Y34.058 E.00926
G1 X224.784 Y34.255 E.00785
G1 X224.828 Y34.396 E.00535
G1 X224.864 Y34.674 E.01012
G1 X224.864 Y88.632 E1.94819
G1 X224.815 Y88.948 E.01156
G1 X224.778 Y89.066 E.00446
M73 P37 R17
G1 X224.618 Y89.368 E.01232
G1 X224.427 Y89.577 E.01024
G1 X224.218 Y89.725 E.00926
G1 X224.021 Y89.818 E.00785
G1 X223.88 Y89.861 E.00535
G1 X223.602 Y89.897 E.01012
G1 X140.042 Y89.897 E3.01702
M204 S3000
G1 X140.042 Y89.44 F15000
G1 F1500
M204 S250
G1 X139.634 Y89.44 E.01473
G1 X139.404 Y89.398 E.00845
G1 X139.212 Y89.311 E.00759
G1 X139.06 Y89.182 E.0072
G1 X138.969 Y89.068 E.00525
G1 X138.868 Y88.852 E.00865
G1 X138.836 Y88.644 E.00758
G1 X138.836 Y34.667 E1.94889
G1 X138.878 Y34.434 E.00857
G1 X138.926 Y34.315 E.0046
G1 X139.094 Y34.093 E.01005
G1 X139.207 Y34.003 E.00525
G1 X139.424 Y33.901 E.00865
G1 X139.632 Y33.869 E.00758
G1 X223.609 Y33.869 E3.03207
G1 X223.839 Y33.911 E.00845
G1 X224.03 Y33.999 E.00759
G1 X224.182 Y34.127 E.0072
G1 X224.273 Y34.241 E.00525
G1 X224.375 Y34.458 E.00865
G1 X224.407 Y34.665 E.00758
G1 X224.407 Y88.642 E1.94889
G1 X224.365 Y88.872 E.00845
G1 X224.277 Y89.064 E.00759
G1 X224.149 Y89.216 E.0072
G1 X224.035 Y89.306 E.00525
G1 X223.818 Y89.408 E.00865
G1 X223.611 Y89.44 E.00758
G1 X140.102 Y89.44 E3.01517
M204 S3000
G1 X140.102 Y88.983 F15000
G1 F1500
M204 S250
G1 X139.621 Y88.983 E.01735
G1 X139.511 Y88.955 E.00413
G1 X139.426 Y88.908 E.0035
G1 X139.317 Y88.771 E.00632
G1 X139.293 Y88.655 E.00429
G1 X139.293 Y34.655 E1.94972
G1 X139.321 Y34.544 E.00413
G1 X139.368 Y34.459 E.0035
G1 X139.505 Y34.35 E.00632
G1 X139.621 Y34.326 E.00429
G1 X223.621 Y34.326 E3.0329
G1 X223.732 Y34.355 E.00413
G1 X223.817 Y34.402 E.0035
G1 X223.926 Y34.538 E.00632
G1 X223.95 Y34.655 E.00429
G1 X223.95 Y88.655 E1.94972
G1 X223.921 Y88.765 E.00413
M73 P38 R17
G1 X223.874 Y88.85 E.0035
G1 X223.738 Y88.959 E.00632
G1 X223.621 Y88.983 E.00429
G1 X140.162 Y88.983 E3.01339
; WIPE_START
G1 X139.621 Y88.983 E-.20539
G1 X139.511 Y88.955 E-.04342
G1 X139.426 Y88.908 E-.03679
G1 X139.317 Y88.771 E-.06647
G1 X139.293 Y88.655 E-.04514
G1 X139.293 Y87.7 E-.3628
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X146.925 Y87.75 Z.6 F15000
G1 X223.221 Y88.255 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X140.021 Y88.255 E3.00402
G1 X140.021 Y35.055 E1.92084
G1 X223.221 Y35.055 E3.00402
G1 X223.221 Y88.195 E1.91867
M204 S3000
G1 X222.764 Y87.798 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X140.478 Y87.798 E2.97101
G1 X140.478 Y35.512 E1.88783
G1 X222.764 Y35.512 E2.97101
G1 X222.764 Y87.738 E1.88567
; WIPE_START
G1 X220.764 Y87.739 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X214.357 Y83.592 Z.6 F15000
G1 X141.221 Y36.255 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X222.021 Y36.255 E2.91737
G1 X222.021 Y87.055 E1.83419
G1 X141.221 Y87.055 E2.91737
G1 X141.221 Y36.315 E1.83202
M204 S3000
G1 X140.764 Y36.255 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X140.764 Y35.798 E.0165
G1 X222.478 Y35.798 E2.95037
G1 X222.478 Y87.512 E1.86719
G1 X140.764 Y87.512 E2.95037
G1 X140.764 Y36.315 E1.84852
; OBJECT_ID: 481
; WIPE_START
M73 P39 R17
G1 X140.764 Y35.798 E-.19649
G1 X142.247 Y35.798 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
M204 S3000
G1 X136.632 Y40.967 Z.6 F15000
G1 X127.994 Y48.92 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F1500
M204 S250
G1 X128.005 Y48.931 E.00055
G1 X128.27 Y49.329 E.01726
G1 X128.47 Y49.821 E.01917
G1 X128.586 Y50.588 E.02802
G1 X128.586 Y104.56 E1.94871
G1 X128.539 Y105.048 E.0177
G1 X128.403 Y105.512 E.01745
G1 X128.272 Y105.786 E.01096
G1 X127.952 Y106.269 E.02093
G1 X127.612 Y106.604 E.01724
G1 X127.214 Y106.869 E.01726
G1 X126.722 Y107.069 E.01917
G1 X125.955 Y107.185 E.02802
G1 X41.983 Y107.185 E3.03189
G1 X41.495 Y107.138 E.0177
G1 X41.031 Y107.002 E.01745
G1 X40.757 Y106.871 E.01096
M73 P40 R17
G1 X40.274 Y106.551 E.02093
G1 X39.939 Y106.211 E.01724
G1 X39.674 Y105.813 E.01726
G1 X39.474 Y105.321 E.01917
G1 X39.358 Y104.554 E.02802
G1 X39.358 Y50.582 E1.94872
M73 P40 R16
G1 X39.405 Y50.094 E.0177
G1 X39.541 Y49.63 E.01745
G1 X39.672 Y49.356 E.01096
G1 X39.992 Y48.873 E.02093
G1 X40.332 Y48.538 E.01724
G1 X40.73 Y48.273 E.01726
G1 X41.222 Y48.073 E.01917
G1 X41.989 Y47.957 E.02802
G1 X125.961 Y47.957 E3.0319
M73 P41 R16
G1 X126.449 Y48.004 E.0177
G1 X126.911 Y48.14 E.01739
G1 X127.269 Y48.316 E.01439
G1 X127.669 Y48.59 E.0175
G1 X127.952 Y48.878 E.01459
M204 S3000
G1 X127.629 Y49.201 F15000
G1 F1500
M204 S250
G1 X127.64 Y49.212 E.00056
G1 X127.857 Y49.533 E.01398
G1 X128.02 Y49.928 E.01544
M73 P42 R16
G1 X128.129 Y50.633 E.02576
G1 X128.129 Y104.532 E1.94608
G1 X128.09 Y104.948 E.01509
G1 X127.97 Y105.358 E.01542
G1 X127.868 Y105.568 E.00844
G1 X127.605 Y105.965 E.01718
G1 X127.311 Y106.256 E.01492
G1 X126.986 Y106.469 E.01403
G1 X126.616 Y106.619 E.01444
G1 X125.91 Y106.728 E.02576
G1 X42.011 Y106.728 E3.02926
G1 X41.595 Y106.689 E.01509
G1 X41.185 Y106.569 E.01542
G1 X40.975 Y106.467 E.00844
G1 X40.578 Y106.204 E.01718
G1 X40.288 Y105.91 E.01492
G1 X40.074 Y105.585 E.01403
G1 X39.924 Y105.215 E.01444
G1 X39.815 Y104.51 E.02576
G1 X39.815 Y50.61 E1.94609
G1 X39.854 Y50.194 E.01509
G1 X39.974 Y49.784 E.01542
G1 X40.076 Y49.574 E.00844
G1 X40.339 Y49.177 E.01718
G1 X40.633 Y48.887 E.01492
G1 X40.958 Y48.673 E.01403
G1 X41.328 Y48.523 E.01444
G1 X42.034 Y48.414 E.02576
G1 X125.946 Y48.415 E3.02974
G1 X126.374 Y48.458 E.01556
G1 X126.755 Y48.573 E.01434
G1 X127.045 Y48.717 E.01172
G1 X127.363 Y48.935 E.01391
G1 X127.587 Y49.158 E.01141
M204 S3000
G1 X127.266 Y49.484 F15000
G1 F1500
M204 S250
G1 X127.276 Y49.495 E.00054
G1 X127.444 Y49.739 E.0107
G1 X127.571 Y50.036 E.01167
G1 X127.672 Y50.678 E.02346
G1 X127.672 Y104.504 E1.94343
G1 X127.635 Y104.874 E.01344
G1 X127.537 Y105.203 E.01241
G1 X127.465 Y105.349 E.00588
G1 X127.258 Y105.661 E.01351
G1 X127.011 Y105.906 E.01256
G1 X126.76 Y106.067 E.01075
G1 X126.508 Y106.17 E.00983
G1 X125.865 Y106.271 E.0235
G1 X42.039 Y106.271 E3.02661
G1 X41.669 Y106.234 E.01344
G1 X41.34 Y106.136 E.01241
G1 X41.194 Y106.064 E.00588
G1 X40.882 Y105.857 E.01351
G1 X40.637 Y105.61 E.01256
G1 X40.476 Y105.359 E.01075
G1 X40.373 Y105.107 E.00983
G1 X40.272 Y104.464 E.0235
G1 X40.272 Y50.638 E1.94343
G1 X40.309 Y50.268 E.01343
G1 X40.407 Y49.939 E.01241
M73 P43 R16
G1 X40.479 Y49.793 E.00588
G1 X40.686 Y49.481 E.01351
G1 X40.933 Y49.236 E.01256
G1 X41.184 Y49.075 E.01075
G1 X41.436 Y48.972 E.00983
G1 X42.079 Y48.871 E.0235
G1 X125.916 Y48.872 E3.02701
G1 X126.272 Y48.907 E.01292
G1 X126.597 Y49.004 E.01224
G1 X126.821 Y49.118 E.00908
G1 X127.059 Y49.281 E.01042
G1 X127.223 Y49.442 E.00829
M204 S3000
G1 X126.895 Y49.765 F15000
G1 F1500
M204 S250
G1 X127.043 Y49.974 E.00926
G1 X127.135 Y50.171 E.00785
G1 X127.178 Y50.313 E.00535
G1 X127.215 Y50.591 E.01012
G1 X127.215 Y104.548 E1.94819
G1 X127.166 Y104.865 E.01156
G1 X127.129 Y104.983 E.00446
G1 X126.969 Y105.284 E.01232
G1 X126.778 Y105.494 E.01024
G1 X126.569 Y105.642 E.00926
G1 X126.372 Y105.734 E.00785
G1 X126.23 Y105.777 E.00535
G1 X125.953 Y105.814 E.01012
G1 X41.995 Y105.814 E3.03137
G1 X41.678 Y105.765 E.01156
G1 X41.561 Y105.728 E.00446
G1 X41.259 Y105.568 E.01232
G1 X41.049 Y105.377 E.01023
G1 X40.901 Y105.168 E.00926
G1 X40.809 Y104.971 E.00786
G1 X40.766 Y104.829 E.00535
G1 X40.729 Y104.552 E.01012
G1 X40.729 Y50.594 E1.94819
G1 X40.778 Y50.276 E.01161
G1 X40.85 Y50.068 E.00794
G1 X40.916 Y49.95 E.00489
G1 X41.168 Y49.647 E.01425
G1 X41.375 Y49.5 E.00914
G1 X41.572 Y49.408 E.00786
G1 X41.714 Y49.365 E.00535
G1 X41.991 Y49.328 E.01012
G1 X125.949 Y49.328 E3.03137
G1 X126.265 Y49.377 E.01156
G1 X126.383 Y49.414 E.00446
G1 X126.685 Y49.574 E.01232
G1 X126.85 Y49.725 E.00807
M204 S3000
G1 X126.533 Y50.044 F15000
G1 F1500
M204 S250
G1 X126.624 Y50.157 E.00525
G1 X126.726 Y50.374 E.00865
G1 X126.758 Y50.582 E.00758
G1 X126.758 Y104.559 E1.94889
G1 X126.715 Y104.789 E.00845
M73 P44 R15
G1 X126.628 Y104.98 E.00759
G1 X126.499 Y105.132 E.0072
G1 X126.386 Y105.223 E.00525
G1 X126.169 Y105.325 E.00865
G1 X125.961 Y105.357 E.00758
G1 X41.984 Y105.357 E3.03207
G1 X41.754 Y105.315 E.00845
G1 X41.563 Y105.227 E.00759
G1 X41.411 Y105.098 E.0072
G1 X41.32 Y104.985 E.00525
G1 X41.218 Y104.768 E.00865
G1 X41.186 Y104.561 E.00758
G1 X41.186 Y50.584 E1.94889
G1 X41.229 Y50.35 E.00857
G1 X41.276 Y50.232 E.0046
G1 X41.445 Y50.01 E.01005
G1 X41.558 Y49.919 E.00525
G1 X41.775 Y49.818 E.00865
G1 X41.983 Y49.786 E.00758
G1 X125.96 Y49.786 E3.03207
G1 X126.19 Y49.828 E.00845
G1 X126.381 Y49.915 E.00759
G1 X126.487 Y50.005 E.00504
M204 S3000
G1 X126.167 Y50.318 F15000
G1 F1500
M204 S250
G1 X126.276 Y50.455 E.00632
G1 X126.301 Y50.571 E.00429
G1 X126.301 Y104.571 E1.94972
G1 X126.272 Y104.682 E.00413
G1 X126.225 Y104.766 E.0035
G1 X126.088 Y104.875 E.00632
G1 X125.972 Y104.9 E.00429
G1 X41.972 Y104.9 E3.0329
G1 X41.861 Y104.871 E.00413
G1 X41.777 Y104.824 E.0035
G1 X41.668 Y104.687 E.00632
G1 X41.643 Y104.571 E.00429
G1 X41.643 Y50.571 E1.94972
G1 X41.672 Y50.46 E.00413
G1 X41.719 Y50.376 E.0035
G1 X41.856 Y50.267 E.00632
G1 X41.972 Y50.243 E.00429
G1 X125.972 Y50.243 E3.0329
G1 X126.083 Y50.271 E.00413
G1 X126.115 Y50.289 E.00133
; WIPE_START
G1 X126.276 Y50.455 E-.08797
G1 X126.301 Y50.571 E-.04514
G1 X126.301 Y52.221 E-.62689
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X126.193 Y59.853 Z.6 F15000
G1 X125.572 Y104.171 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X42.372 Y104.171 E3.00402
G1 X42.372 Y50.971 E1.92084
M73 P45 R15
G1 X125.572 Y50.971 E3.00402
G1 X125.572 Y104.111 E1.91867
M204 S3000
G1 X125.115 Y103.714 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X42.829 Y103.714 E2.97101
G1 X42.829 Y51.428 E1.88783
G1 X125.115 Y51.428 E2.97101
G1 X125.115 Y103.654 E1.88567
; WIPE_START
G1 X123.115 Y103.655 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X116.708 Y99.508 Z.6 F15000
G1 X43.572 Y52.171 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X124.372 Y52.171 E2.91737
G1 X124.372 Y102.971 E1.83419
G1 X43.572 Y102.971 E2.91737
G1 X43.572 Y52.231 E1.83202
M204 S3000
G1 X43.115 Y52.171 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X43.115 Y51.714 E.0165
G1 X124.829 Y51.714 E2.95037
G1 X124.829 Y103.428 E1.86719
G1 X43.115 Y103.428 E2.95037
G1 X43.115 Y52.231 E1.84852
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1500
G1 X43.115 Y51.714 E-.19649
G1 X44.598 Y51.714 E-.56351
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 2/17
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
; open powerlost recovery
M1003 S1
M104 S245 ; set nozzle temperature
M204 S5000
G17
G3 Z.6 I1.217 J0 P1  F15000
; object ids of layer 2 start: 470,481,503,525
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
; object ids of this layer2 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.644 Y164.223
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.456 Y164.223 E2.59862
G1 X124.456 Y215.428 E1.64654
M73 P46 R15
G1 X43.251 Y215.428 E2.61123
G1 X43.251 Y164.223 E1.64654
G1 X43.584 Y164.223 E.01068
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.064 Y164.616 E2.39544
G1 X124.064 Y215.036 E1.50184
G1 X43.644 Y215.036 E2.39544
G1 X43.644 Y164.676 E1.50005
; WIPE_START
M204 S5000
G1 X45.644 Y164.674 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.05 Y168.823 Z.8 F15000
G1 X125.252 Y216.224 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.456 Y216.224 E2.66241
G1 X42.456 Y163.428 E1.69772
M73 P47 R15
G1 X125.252 Y163.428 E2.66241
G1 X125.252 Y216.164 E1.69579
M204 S250
G1 X125.644 Y216.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.064 Y216.616 E2.48956
G1 X42.064 Y163.036 E1.59597
G1 X125.644 Y163.036 E2.48956
G1 X125.644 Y216.556 E1.59418
; WIPE_START
M204 S5000
G1 X123.644 Y216.557 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.82 Y215.792 Z.8 F15000
M73 P47 R14
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
M73 P48 R14
G1 X124.74 Y215.809 E.00278
; LINE_WIDTH: 0.448395
G1 X124.659 Y215.826 E.00263
; LINE_WIDTH: 0.43172
G1 X43.048 Y215.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00556
G1 X42.87 Y215.712 E.00278
; LINE_WIDTH: 0.448395
G1 X42.854 Y215.631 E.00263
; LINE_WIDTH: 0.431747
G1 X42.854 Y164.02 E1.58521
G1 X42.87 Y163.939 E.00253
; LINE_WIDTH: 0.481759
G1 X42.887 Y163.859 E.00285
; LINE_WIDTH: 0.481745
G1 X42.967 Y163.842 E.00285
; LINE_WIDTH: 0.448395
G1 X43.048 Y163.826 E.00263
; LINE_WIDTH: 0.43172
G1 X124.659 Y163.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.82 Y163.859 E.00556
G1 X124.837 Y163.939 E.00278
; LINE_WIDTH: 0.448395
G1 X124.854 Y164.02 E.00263
; LINE_WIDTH: 0.43172
G1 X124.854 Y215.631 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.832 Y215.733 E.00353
; OBJECT_ID: 503
; WIPE_START
G1 X124.74 Y215.809 E-.04541
G1 X124.659 Y215.826 E-.03125
G1 X122.861 Y215.826 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X124.484 Y208.368 Z.8 F15000
G1 X140.449 Y135.01 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P49 R14
G1 X221.261 Y135.01 E2.59862
G1 X221.261 Y186.215 E1.64654
G1 X140.057 Y186.215 E2.61123
G1 X140.057 Y135.01 E1.64654
G1 X140.389 Y135.01 E.01068
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X220.869 Y135.403 E2.39544
G1 X220.869 Y185.823 E1.50184
G1 X140.449 Y185.823 E2.39544
G1 X140.449 Y135.463 E1.50005
; WIPE_START
M204 S5000
G1 X142.449 Y135.461 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.855 Y139.61 Z.8 F15000
G1 X222.057 Y187.01 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X139.261 Y187.01 E2.66241
G1 X139.261 Y134.215 E1.69772
G1 X222.057 Y134.215 E2.66241
G1 X222.057 Y186.95 E1.69579
M204 S250
G1 X222.449 Y187.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.869 Y187.403 E2.48956
G1 X138.869 Y133.823 E1.59597
G1 X222.449 Y133.823 E2.48956
G1 X222.449 Y187.343 E1.59418
; WIPE_START
M204 S5000
G1 X220.449 Y187.344 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X221.625 Y186.579 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X221.545 Y186.596 E.00278
; LINE_WIDTH: 0.448395
G1 X221.464 Y186.613 E.00263
; LINE_WIDTH: 0.43172
G1 X139.853 Y186.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00556
G1 X139.675 Y186.499 E.00278
; LINE_WIDTH: 0.448395
G1 X139.659 Y186.418 E.00263
; LINE_WIDTH: 0.431747
G1 X139.659 Y134.807 E1.58521
G1 X139.675 Y134.726 E.00253
; LINE_WIDTH: 0.481759
G1 X139.692 Y134.646 E.00285
; LINE_WIDTH: 0.481745
G1 X139.773 Y134.629 E.00285
; LINE_WIDTH: 0.448395
G1 X139.853 Y134.613 E.00263
; LINE_WIDTH: 0.43172
G1 X221.464 Y134.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X221.625 Y134.646 E.00556
G1 X221.642 Y134.726 E.00278
; LINE_WIDTH: 0.448395
G1 X221.659 Y134.807 E.00263
; LINE_WIDTH: 0.43172
G1 X221.659 Y186.418 E1.5851
; LINE_WIDTH: 0.470635
G1 X221.638 Y186.52 E.00353
; OBJECT_ID: 470
; WIPE_START
G1 X221.545 Y186.596 E-.04541
G1 X221.464 Y186.613 E-.03125
G1 X219.666 Y186.613 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X216.146 Y179.84 Z.8 F15000
G1 X141.411 Y36.053 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X222.223 Y36.053 E2.59862
G1 X222.223 Y87.257 E1.64654
G1 X141.019 Y87.257 E2.61123
G1 X141.019 Y36.053 E1.64654
G1 X141.351 Y36.053 E.01068
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X221.831 Y36.445 E2.39544
G1 X221.831 Y86.865 E1.50184
G1 X141.411 Y86.865 E2.39544
G1 X141.411 Y36.505 E1.50005
; WIPE_START
M204 S5000
G1 X143.411 Y36.503 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.818 Y40.652 Z.8 F15000
G1 X223.019 Y88.053 Z.8
M73 P50 R14
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.223 Y88.053 E2.66241
G1 X140.223 Y35.257 E1.69772
G1 X223.019 Y35.257 E2.66241
G1 X223.019 Y87.993 E1.69579
M204 S250
G1 X223.411 Y88.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X139.831 Y88.445 E2.48956
G1 X139.831 Y34.865 E1.59597
G1 X223.411 Y34.865 E2.48956
G1 X223.411 Y88.385 E1.59418
; WIPE_START
M204 S5000
G1 X221.411 Y88.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X222.588 Y87.621 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X222.507 Y87.638 E.00278
; LINE_WIDTH: 0.448395
G1 X222.427 Y87.655 E.00263
; LINE_WIDTH: 0.43172
G1 X140.816 Y87.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00556
G1 X140.638 Y87.541 E.00278
; LINE_WIDTH: 0.448395
G1 X140.621 Y87.46 E.00263
; LINE_WIDTH: 0.431747
G1 X140.621 Y35.849 E1.58521
G1 X140.638 Y35.769 E.00253
; LINE_WIDTH: 0.481759
G1 X140.655 Y35.688 E.00285
; LINE_WIDTH: 0.481745
G1 X140.735 Y35.671 E.00285
; LINE_WIDTH: 0.448395
G1 X140.816 Y35.655 E.00263
; LINE_WIDTH: 0.43172
G1 X222.427 Y35.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X222.588 Y35.688 E.00556
G1 X222.605 Y35.769 E.00278
; LINE_WIDTH: 0.448395
G1 X222.621 Y35.849 E.00263
; LINE_WIDTH: 0.43172
G1 X222.621 Y87.46 E1.5851
; LINE_WIDTH: 0.470635
G1 X222.6 Y87.563 E.00353
; OBJECT_ID: 481
; WIPE_START
G1 X222.507 Y87.638 E-.04541
G1 X222.427 Y87.655 E-.03125
G1 X220.629 Y87.655 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X213.147 Y86.145 Z.8 F15000
G1 X43.762 Y51.969 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.574 Y51.969 E2.59862
G1 X124.574 Y103.173 E1.64654
G1 X43.37 Y103.173 E2.61123
G1 X43.37 Y51.969 E1.64654
G1 X43.702 Y51.969 E.01068
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.182 Y52.361 E2.39544
G1 X124.182 Y102.781 E1.50184
G1 X43.762 Y102.781 E2.39544
G1 X43.762 Y52.421 E1.50005
; WIPE_START
M204 S5000
G1 X45.762 Y52.42 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.169 Y56.568 Z.8 F15000
G1 X125.37 Y103.969 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.574 Y103.969 E2.66241
G1 X42.574 Y51.173 E1.69772
G1 X125.37 Y51.173 E2.66241
G1 X125.37 Y103.909 E1.69579
M204 S250
G1 X125.762 Y104.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.182 Y104.361 E2.48956
G1 X42.182 Y50.781 E1.59597
G1 X125.762 Y50.781 E2.48956
G1 X125.762 Y104.301 E1.59418
; WIPE_START
M204 S5000
G1 X123.762 Y104.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.939 Y103.538 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.858 Y103.554 E.00278
; LINE_WIDTH: 0.448395
G1 X124.778 Y103.571 E.00263
; LINE_WIDTH: 0.43172
M73 P51 R14
G1 X43.166 Y103.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00556
G1 X42.989 Y103.457 E.00278
; LINE_WIDTH: 0.448395
G1 X42.972 Y103.377 E.00263
; LINE_WIDTH: 0.431747
G1 X42.972 Y51.765 E1.58521
G1 X42.989 Y51.685 E.00253
; LINE_WIDTH: 0.481759
G1 X43.005 Y51.604 E.00285
; LINE_WIDTH: 0.481745
G1 X43.086 Y51.588 E.00285
; LINE_WIDTH: 0.448395
G1 X43.166 Y51.571 E.00263
; LINE_WIDTH: 0.43172
G1 X124.778 Y51.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.939 Y51.604 E.00556
G1 X124.955 Y51.685 E.00278
; LINE_WIDTH: 0.448395
G1 X124.972 Y51.765 E.00263
; LINE_WIDTH: 0.43172
G1 X124.972 Y103.377 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.951 Y103.479 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
M73 P51 R13
G1 X124.858 Y103.554 E-.04541
G1 X124.778 Y103.571 E-.03125
G1 X122.979 Y103.571 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 3/17
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F15000
; object ids of layer 3 start: 470,481,503,525
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
; object ids of this layer3 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.644 Y164.223
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.456 Y164.223 E2.59862
G1 X124.456 Y215.428 E1.64654
G1 X43.251 Y215.428 E2.61123
G1 X43.251 Y164.223 E1.64654
G1 X43.584 Y164.223 E.01068
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.064 Y164.616 E2.39544
G1 X124.064 Y215.036 E1.50184
G1 X43.644 Y215.036 E2.39544
G1 X43.644 Y164.676 E1.50005
; WIPE_START
M204 S5000
G1 X45.644 Y164.674 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.05 Y168.823 Z1 F15000
G1 X125.252 Y216.224 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.456 Y216.224 E2.66241
G1 X42.456 Y163.428 E1.69772
G1 X125.252 Y163.428 E2.66241
G1 X125.252 Y216.164 E1.69579
M204 S250
G1 X125.644 Y216.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.064 Y216.616 E2.48956
G1 X42.064 Y163.036 E1.59597
G1 X125.644 Y163.036 E2.48956
G1 X125.644 Y216.556 E1.59418
; WIPE_START
M204 S5000
G1 X123.644 Y216.557 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.82 Y215.792 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.74 Y215.809 E.00278
; LINE_WIDTH: 0.448395
G1 X124.659 Y215.826 E.00263
; LINE_WIDTH: 0.43172
G1 X43.048 Y215.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00556
G1 X42.87 Y215.712 E.00278
; LINE_WIDTH: 0.448395
G1 X42.854 Y215.631 E.00263
; LINE_WIDTH: 0.431747
G1 X42.854 Y164.02 E1.58521
G1 X42.87 Y163.939 E.00253
; LINE_WIDTH: 0.481759
G1 X42.887 Y163.859 E.00285
; LINE_WIDTH: 0.481745
G1 X42.967 Y163.842 E.00285
; LINE_WIDTH: 0.448395
G1 X43.048 Y163.826 E.00263
; LINE_WIDTH: 0.43172
G1 X124.659 Y163.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.82 Y163.859 E.00556
G1 X124.837 Y163.939 E.00278
; LINE_WIDTH: 0.448395
G1 X124.854 Y164.02 E.00263
; LINE_WIDTH: 0.43172
G1 X124.854 Y215.631 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.832 Y215.733 E.00353
; OBJECT_ID: 503
; WIPE_START
G1 X124.74 Y215.809 E-.04541
G1 X124.659 Y215.826 E-.03125
G1 X122.861 Y215.826 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X124.484 Y208.368 Z1 F15000
G1 X140.449 Y135.01 Z1
G1 Z.6
M73 P52 R13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X221.261 Y135.01 E2.59862
G1 X221.261 Y186.215 E1.64654
G1 X140.057 Y186.215 E2.61123
G1 X140.057 Y135.01 E1.64654
G1 X140.389 Y135.01 E.01068
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X220.869 Y135.403 E2.39544
G1 X220.869 Y185.823 E1.50184
G1 X140.449 Y185.823 E2.39544
G1 X140.449 Y135.463 E1.50005
; WIPE_START
M204 S5000
G1 X142.449 Y135.461 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.855 Y139.61 Z1 F15000
G1 X222.057 Y187.01 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X139.261 Y187.01 E2.66241
G1 X139.261 Y134.215 E1.69772
G1 X222.057 Y134.215 E2.66241
G1 X222.057 Y186.95 E1.69579
M204 S250
G1 X222.449 Y187.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.869 Y187.403 E2.48956
G1 X138.869 Y133.823 E1.59597
G1 X222.449 Y133.823 E2.48956
G1 X222.449 Y187.343 E1.59418
; WIPE_START
M204 S5000
G1 X220.449 Y187.344 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X221.625 Y186.579 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X221.545 Y186.596 E.00278
; LINE_WIDTH: 0.448395
G1 X221.464 Y186.613 E.00263
; LINE_WIDTH: 0.43172
G1 X139.853 Y186.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00556
G1 X139.675 Y186.499 E.00278
; LINE_WIDTH: 0.448395
G1 X139.659 Y186.418 E.00263
; LINE_WIDTH: 0.431747
G1 X139.659 Y134.807 E1.58521
G1 X139.675 Y134.726 E.00253
; LINE_WIDTH: 0.481759
G1 X139.692 Y134.646 E.00285
; LINE_WIDTH: 0.481745
G1 X139.773 Y134.629 E.00285
; LINE_WIDTH: 0.448395
G1 X139.853 Y134.613 E.00263
; LINE_WIDTH: 0.43172
G1 X221.464 Y134.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X221.625 Y134.646 E.00556
G1 X221.642 Y134.726 E.00278
; LINE_WIDTH: 0.448395
G1 X221.659 Y134.807 E.00263
; LINE_WIDTH: 0.43172
G1 X221.659 Y186.418 E1.5851
; LINE_WIDTH: 0.470635
G1 X221.638 Y186.52 E.00353
; OBJECT_ID: 470
; WIPE_START
G1 X221.545 Y186.596 E-.04541
G1 X221.464 Y186.613 E-.03125
G1 X219.666 Y186.613 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X216.146 Y179.84 Z1 F15000
G1 X141.411 Y36.053 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X222.223 Y36.053 E2.59862
G1 X222.223 Y87.257 E1.64654
G1 X141.019 Y87.257 E2.61123
G1 X141.019 Y36.053 E1.64654
G1 X141.351 Y36.053 E.01068
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X221.831 Y36.445 E2.39544
G1 X221.831 Y86.865 E1.50184
G1 X141.411 Y86.865 E2.39544
G1 X141.411 Y36.505 E1.50005
; WIPE_START
M204 S5000
M73 P53 R13
G1 X143.411 Y36.503 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.818 Y40.652 Z1 F15000
G1 X223.019 Y88.053 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.223 Y88.053 E2.66241
G1 X140.223 Y35.257 E1.69772
G1 X223.019 Y35.257 E2.66241
G1 X223.019 Y87.993 E1.69579
M204 S250
G1 X223.411 Y88.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X139.831 Y88.445 E2.48956
G1 X139.831 Y34.865 E1.59597
G1 X223.411 Y34.865 E2.48956
G1 X223.411 Y88.385 E1.59418
; WIPE_START
M204 S5000
G1 X221.411 Y88.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X222.588 Y87.621 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X222.507 Y87.638 E.00278
; LINE_WIDTH: 0.448395
G1 X222.427 Y87.655 E.00263
; LINE_WIDTH: 0.43172
G1 X140.816 Y87.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00556
G1 X140.638 Y87.541 E.00278
; LINE_WIDTH: 0.448395
G1 X140.621 Y87.46 E.00263
; LINE_WIDTH: 0.431747
G1 X140.621 Y35.849 E1.58521
G1 X140.638 Y35.769 E.00253
; LINE_WIDTH: 0.481759
G1 X140.655 Y35.688 E.00285
; LINE_WIDTH: 0.481745
G1 X140.735 Y35.671 E.00285
; LINE_WIDTH: 0.448395
G1 X140.816 Y35.655 E.00263
; LINE_WIDTH: 0.43172
G1 X222.427 Y35.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X222.588 Y35.688 E.00556
G1 X222.605 Y35.769 E.00278
; LINE_WIDTH: 0.448395
G1 X222.621 Y35.849 E.00263
; LINE_WIDTH: 0.43172
G1 X222.621 Y87.46 E1.5851
; LINE_WIDTH: 0.470635
G1 X222.6 Y87.563 E.00353
; OBJECT_ID: 481
; WIPE_START
G1 X222.507 Y87.638 E-.04541
G1 X222.427 Y87.655 E-.03125
G1 X220.629 Y87.655 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X213.147 Y86.145 Z1 F15000
G1 X43.762 Y51.969 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.574 Y51.969 E2.59862
G1 X124.574 Y103.173 E1.64654
G1 X43.37 Y103.173 E2.61123
G1 X43.37 Y51.969 E1.64654
G1 X43.702 Y51.969 E.01068
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.182 Y52.361 E2.39544
G1 X124.182 Y102.781 E1.50184
G1 X43.762 Y102.781 E2.39544
G1 X43.762 Y52.421 E1.50005
; WIPE_START
M204 S5000
G1 X45.762 Y52.42 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.169 Y56.568 Z1 F15000
G1 X125.37 Y103.969 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.574 Y103.969 E2.66241
G1 X42.574 Y51.173 E1.69772
G1 X125.37 Y51.173 E2.66241
G1 X125.37 Y103.909 E1.69579
M204 S250
G1 X125.762 Y104.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.182 Y104.361 E2.48956
G1 X42.182 Y50.781 E1.59597
G1 X125.762 Y50.781 E2.48956
M73 P54 R13
G1 X125.762 Y104.301 E1.59418
; WIPE_START
M204 S5000
G1 X123.762 Y104.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.939 Y103.538 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.858 Y103.554 E.00278
; LINE_WIDTH: 0.448395
G1 X124.778 Y103.571 E.00263
; LINE_WIDTH: 0.43172
G1 X43.166 Y103.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00556
G1 X42.989 Y103.457 E.00278
; LINE_WIDTH: 0.448395
G1 X42.972 Y103.377 E.00263
; LINE_WIDTH: 0.431747
G1 X42.972 Y51.765 E1.58521
G1 X42.989 Y51.685 E.00253
; LINE_WIDTH: 0.481759
G1 X43.005 Y51.604 E.00285
; LINE_WIDTH: 0.481745
G1 X43.086 Y51.588 E.00285
; LINE_WIDTH: 0.448395
G1 X43.166 Y51.571 E.00263
; LINE_WIDTH: 0.43172
G1 X124.778 Y51.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.939 Y51.604 E.00556
G1 X124.955 Y51.685 E.00278
; LINE_WIDTH: 0.448395
G1 X124.972 Y51.765 E.00263
; LINE_WIDTH: 0.43172
G1 X124.972 Y103.377 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.951 Y103.479 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X124.858 Y103.554 E-.04541
G1 X124.778 Y103.571 E-.03125
G1 X122.979 Y103.571 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 4/17
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S51
G17
G3 Z1 I1.217 J0 P1  F15000
; object ids of layer 4 start: 470,481,503,525
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
; object ids of this layer4 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.644 Y164.223
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.456 Y164.223 E2.59862
G1 X124.456 Y215.428 E1.64654
G1 X43.251 Y215.428 E2.61123
G1 X43.251 Y164.223 E1.64654
G1 X43.584 Y164.223 E.01068
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.064 Y164.616 E2.39544
G1 X124.064 Y215.036 E1.50184
G1 X43.644 Y215.036 E2.39544
G1 X43.644 Y164.676 E1.50005
; WIPE_START
M204 S5000
G1 X45.644 Y164.674 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.05 Y168.823 Z1.2 F15000
G1 X125.252 Y216.224 Z1.2
M73 P54 R12
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.456 Y216.224 E2.66241
G1 X42.456 Y163.428 E1.69772
G1 X125.252 Y163.428 E2.66241
G1 X125.252 Y216.164 E1.69579
M204 S250
G1 X125.644 Y216.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.064 Y216.616 E2.48956
G1 X42.064 Y163.036 E1.59597
G1 X125.644 Y163.036 E2.48956
G1 X125.644 Y216.556 E1.59418
; WIPE_START
M204 S5000
G1 X123.644 Y216.557 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.82 Y215.792 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.74 Y215.809 E.00278
; LINE_WIDTH: 0.448395
G1 X124.659 Y215.826 E.00263
; LINE_WIDTH: 0.43172
G1 X43.048 Y215.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00556
G1 X42.87 Y215.712 E.00278
; LINE_WIDTH: 0.448395
G1 X42.854 Y215.631 E.00263
; LINE_WIDTH: 0.431747
G1 X42.854 Y164.02 E1.58521
G1 X42.87 Y163.939 E.00253
; LINE_WIDTH: 0.481759
G1 X42.887 Y163.859 E.00285
; LINE_WIDTH: 0.481745
G1 X42.967 Y163.842 E.00285
; LINE_WIDTH: 0.448395
G1 X43.048 Y163.826 E.00263
; LINE_WIDTH: 0.43172
G1 X124.659 Y163.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.82 Y163.859 E.00556
G1 X124.837 Y163.939 E.00278
; LINE_WIDTH: 0.448395
G1 X124.854 Y164.02 E.00263
; LINE_WIDTH: 0.43172
G1 X124.854 Y215.631 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.832 Y215.733 E.00353
; OBJECT_ID: 503
; WIPE_START
G1 X124.74 Y215.809 E-.04541
G1 X124.659 Y215.826 E-.03125
M73 P55 R12
G1 X122.861 Y215.826 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X124.484 Y208.368 Z1.2 F15000
G1 X140.449 Y135.01 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X221.261 Y135.01 E2.59862
G1 X221.261 Y186.215 E1.64654
G1 X140.057 Y186.215 E2.61123
G1 X140.057 Y135.01 E1.64654
G1 X140.389 Y135.01 E.01068
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X220.869 Y135.403 E2.39544
G1 X220.869 Y185.823 E1.50184
G1 X140.449 Y185.823 E2.39544
G1 X140.449 Y135.463 E1.50005
; WIPE_START
M204 S5000
G1 X142.449 Y135.461 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.855 Y139.61 Z1.2 F15000
G1 X222.057 Y187.01 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X139.261 Y187.01 E2.66241
G1 X139.261 Y134.215 E1.69772
G1 X222.057 Y134.215 E2.66241
G1 X222.057 Y186.95 E1.69579
M204 S250
G1 X222.449 Y187.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.869 Y187.403 E2.48956
G1 X138.869 Y133.823 E1.59597
G1 X222.449 Y133.823 E2.48956
G1 X222.449 Y187.343 E1.59418
; WIPE_START
M204 S5000
G1 X220.449 Y187.344 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X221.625 Y186.579 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X221.545 Y186.596 E.00278
; LINE_WIDTH: 0.448395
G1 X221.464 Y186.613 E.00263
; LINE_WIDTH: 0.43172
G1 X139.853 Y186.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00556
G1 X139.675 Y186.499 E.00278
; LINE_WIDTH: 0.448395
G1 X139.659 Y186.418 E.00263
; LINE_WIDTH: 0.431747
G1 X139.659 Y134.807 E1.58521
G1 X139.675 Y134.726 E.00253
; LINE_WIDTH: 0.481759
G1 X139.692 Y134.646 E.00285
; LINE_WIDTH: 0.481745
G1 X139.773 Y134.629 E.00285
; LINE_WIDTH: 0.448395
G1 X139.853 Y134.613 E.00263
; LINE_WIDTH: 0.43172
G1 X221.464 Y134.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X221.625 Y134.646 E.00556
G1 X221.642 Y134.726 E.00278
; LINE_WIDTH: 0.448395
G1 X221.659 Y134.807 E.00263
; LINE_WIDTH: 0.43172
G1 X221.659 Y186.418 E1.5851
; LINE_WIDTH: 0.470635
G1 X221.638 Y186.52 E.00353
; OBJECT_ID: 470
; WIPE_START
G1 X221.545 Y186.596 E-.04541
G1 X221.464 Y186.613 E-.03125
G1 X219.666 Y186.613 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X216.146 Y179.84 Z1.2 F15000
G1 X141.411 Y36.053 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X222.223 Y36.053 E2.59862
G1 X222.223 Y87.257 E1.64654
G1 X141.019 Y87.257 E2.61123
G1 X141.019 Y36.053 E1.64654
G1 X141.351 Y36.053 E.01068
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X221.831 Y36.445 E2.39544
G1 X221.831 Y86.865 E1.50184
M73 P56 R12
G1 X141.411 Y86.865 E2.39544
G1 X141.411 Y36.505 E1.50005
; WIPE_START
M204 S5000
G1 X143.411 Y36.503 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.818 Y40.652 Z1.2 F15000
G1 X223.019 Y88.053 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.223 Y88.053 E2.66241
G1 X140.223 Y35.257 E1.69772
G1 X223.019 Y35.257 E2.66241
G1 X223.019 Y87.993 E1.69579
M204 S250
G1 X223.411 Y88.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X139.831 Y88.445 E2.48956
G1 X139.831 Y34.865 E1.59597
G1 X223.411 Y34.865 E2.48956
G1 X223.411 Y88.385 E1.59418
; WIPE_START
M204 S5000
G1 X221.411 Y88.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X222.588 Y87.621 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X222.507 Y87.638 E.00278
; LINE_WIDTH: 0.448395
G1 X222.427 Y87.655 E.00263
; LINE_WIDTH: 0.43172
G1 X140.816 Y87.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00556
G1 X140.638 Y87.541 E.00278
; LINE_WIDTH: 0.448395
G1 X140.621 Y87.46 E.00263
; LINE_WIDTH: 0.431747
G1 X140.621 Y35.849 E1.58521
G1 X140.638 Y35.769 E.00253
; LINE_WIDTH: 0.481759
G1 X140.655 Y35.688 E.00285
; LINE_WIDTH: 0.481745
G1 X140.735 Y35.671 E.00285
; LINE_WIDTH: 0.448395
G1 X140.816 Y35.655 E.00263
; LINE_WIDTH: 0.43172
G1 X222.427 Y35.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X222.588 Y35.688 E.00556
G1 X222.605 Y35.769 E.00278
; LINE_WIDTH: 0.448395
G1 X222.621 Y35.849 E.00263
; LINE_WIDTH: 0.43172
G1 X222.621 Y87.46 E1.5851
; LINE_WIDTH: 0.470635
G1 X222.6 Y87.563 E.00353
; OBJECT_ID: 481
; WIPE_START
G1 X222.507 Y87.638 E-.04541
G1 X222.427 Y87.655 E-.03125
G1 X220.629 Y87.655 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X213.147 Y86.145 Z1.2 F15000
G1 X43.762 Y51.969 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.574 Y51.969 E2.59862
G1 X124.574 Y103.173 E1.64654
G1 X43.37 Y103.173 E2.61123
G1 X43.37 Y51.969 E1.64654
G1 X43.702 Y51.969 E.01068
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.182 Y52.361 E2.39544
G1 X124.182 Y102.781 E1.50184
G1 X43.762 Y102.781 E2.39544
G1 X43.762 Y52.421 E1.50005
; WIPE_START
M204 S5000
G1 X45.762 Y52.42 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.169 Y56.568 Z1.2 F15000
G1 X125.37 Y103.969 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P57 R12
G1 X42.574 Y103.969 E2.66241
G1 X42.574 Y51.173 E1.69772
G1 X125.37 Y51.173 E2.66241
G1 X125.37 Y103.909 E1.69579
M204 S250
G1 X125.762 Y104.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.182 Y104.361 E2.48956
G1 X42.182 Y50.781 E1.59597
G1 X125.762 Y50.781 E2.48956
G1 X125.762 Y104.301 E1.59418
; WIPE_START
M204 S5000
G1 X123.762 Y104.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.939 Y103.538 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.858 Y103.554 E.00278
; LINE_WIDTH: 0.448395
G1 X124.778 Y103.571 E.00263
; LINE_WIDTH: 0.43172
G1 X43.166 Y103.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00556
G1 X42.989 Y103.457 E.00278
; LINE_WIDTH: 0.448395
G1 X42.972 Y103.377 E.00263
; LINE_WIDTH: 0.431747
G1 X42.972 Y51.765 E1.58521
G1 X42.989 Y51.685 E.00253
; LINE_WIDTH: 0.481759
G1 X43.005 Y51.604 E.00285
; LINE_WIDTH: 0.481745
G1 X43.086 Y51.588 E.00285
; LINE_WIDTH: 0.448395
G1 X43.166 Y51.571 E.00263
; LINE_WIDTH: 0.43172
G1 X124.778 Y51.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.939 Y51.604 E.00556
G1 X124.955 Y51.685 E.00278
; LINE_WIDTH: 0.448395
G1 X124.972 Y51.765 E.00263
; LINE_WIDTH: 0.43172
G1 X124.972 Y103.377 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.951 Y103.479 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X124.858 Y103.554 E-.04541
G1 X124.778 Y103.571 E-.03125
G1 X122.979 Y103.571 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 5/17
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F15000
; object ids of layer 5 start: 470,481,503,525
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
; object ids of this layer5 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.644 Y164.223
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.456 Y164.223 E2.59862
G1 X124.456 Y215.428 E1.64654
G1 X43.251 Y215.428 E2.61123
G1 X43.251 Y164.223 E1.64654
G1 X43.584 Y164.223 E.01068
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.064 Y164.616 E2.39544
G1 X124.064 Y215.036 E1.50184
G1 X43.644 Y215.036 E2.39544
G1 X43.644 Y164.676 E1.50005
; WIPE_START
M204 S5000
G1 X45.644 Y164.674 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.05 Y168.823 Z1.4 F15000
G1 X125.252 Y216.224 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.456 Y216.224 E2.66241
G1 X42.456 Y163.428 E1.69772
G1 X125.252 Y163.428 E2.66241
G1 X125.252 Y216.164 E1.69579
M204 S250
G1 X125.644 Y216.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.064 Y216.616 E2.48956
G1 X42.064 Y163.036 E1.59597
G1 X125.644 Y163.036 E2.48956
G1 X125.644 Y216.556 E1.59418
; WIPE_START
M204 S5000
G1 X123.644 Y216.557 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.82 Y215.792 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.74 Y215.809 E.00278
; LINE_WIDTH: 0.448395
G1 X124.659 Y215.826 E.00263
; LINE_WIDTH: 0.43172
G1 X43.048 Y215.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00556
G1 X42.87 Y215.712 E.00278
; LINE_WIDTH: 0.448395
G1 X42.854 Y215.631 E.00263
; LINE_WIDTH: 0.431747
G1 X42.854 Y164.02 E1.58521
G1 X42.87 Y163.939 E.00253
; LINE_WIDTH: 0.481759
G1 X42.887 Y163.859 E.00285
; LINE_WIDTH: 0.481745
G1 X42.967 Y163.842 E.00285
; LINE_WIDTH: 0.448395
G1 X43.048 Y163.826 E.00263
; LINE_WIDTH: 0.43172
G1 X124.659 Y163.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.82 Y163.859 E.00556
G1 X124.837 Y163.939 E.00278
; LINE_WIDTH: 0.448395
G1 X124.854 Y164.02 E.00263
; LINE_WIDTH: 0.43172
G1 X124.854 Y215.631 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.832 Y215.733 E.00353
; OBJECT_ID: 503
; WIPE_START
M73 P58 R12
G1 X124.74 Y215.809 E-.04541
G1 X124.659 Y215.826 E-.03125
G1 X122.861 Y215.826 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X124.484 Y208.368 Z1.4 F15000
G1 X140.449 Y135.01 Z1.4
G1 Z1
M73 P58 R11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X221.261 Y135.01 E2.59862
G1 X221.261 Y186.215 E1.64654
G1 X140.057 Y186.215 E2.61123
G1 X140.057 Y135.01 E1.64654
G1 X140.389 Y135.01 E.01068
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X220.869 Y135.403 E2.39544
G1 X220.869 Y185.823 E1.50184
G1 X140.449 Y185.823 E2.39544
G1 X140.449 Y135.463 E1.50005
; WIPE_START
M204 S5000
G1 X142.449 Y135.461 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.855 Y139.61 Z1.4 F15000
G1 X222.057 Y187.01 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X139.261 Y187.01 E2.66241
G1 X139.261 Y134.215 E1.69772
G1 X222.057 Y134.215 E2.66241
G1 X222.057 Y186.95 E1.69579
M204 S250
G1 X222.449 Y187.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.869 Y187.403 E2.48956
G1 X138.869 Y133.823 E1.59597
G1 X222.449 Y133.823 E2.48956
G1 X222.449 Y187.343 E1.59418
; WIPE_START
M204 S5000
G1 X220.449 Y187.344 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X221.625 Y186.579 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X221.545 Y186.596 E.00278
; LINE_WIDTH: 0.448395
G1 X221.464 Y186.613 E.00263
; LINE_WIDTH: 0.43172
G1 X139.853 Y186.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00556
G1 X139.675 Y186.499 E.00278
; LINE_WIDTH: 0.448395
G1 X139.659 Y186.418 E.00263
; LINE_WIDTH: 0.431747
G1 X139.659 Y134.807 E1.58521
G1 X139.675 Y134.726 E.00253
; LINE_WIDTH: 0.481759
G1 X139.692 Y134.646 E.00285
; LINE_WIDTH: 0.481745
G1 X139.773 Y134.629 E.00285
; LINE_WIDTH: 0.448395
G1 X139.853 Y134.613 E.00263
; LINE_WIDTH: 0.43172
G1 X221.464 Y134.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X221.625 Y134.646 E.00556
G1 X221.642 Y134.726 E.00278
; LINE_WIDTH: 0.448395
G1 X221.659 Y134.807 E.00263
; LINE_WIDTH: 0.43172
G1 X221.659 Y186.418 E1.5851
; LINE_WIDTH: 0.470635
G1 X221.638 Y186.52 E.00353
; OBJECT_ID: 470
; WIPE_START
G1 X221.545 Y186.596 E-.04541
G1 X221.464 Y186.613 E-.03125
G1 X219.666 Y186.613 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X216.146 Y179.84 Z1.4 F15000
G1 X141.411 Y36.053 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X222.223 Y36.053 E2.59862
G1 X222.223 Y87.257 E1.64654
M73 P59 R11
G1 X141.019 Y87.257 E2.61123
G1 X141.019 Y36.053 E1.64654
G1 X141.351 Y36.053 E.01068
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X221.831 Y36.445 E2.39544
G1 X221.831 Y86.865 E1.50184
G1 X141.411 Y86.865 E2.39544
G1 X141.411 Y36.505 E1.50005
; WIPE_START
M204 S5000
G1 X143.411 Y36.503 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.818 Y40.652 Z1.4 F15000
G1 X223.019 Y88.053 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.223 Y88.053 E2.66241
G1 X140.223 Y35.257 E1.69772
G1 X223.019 Y35.257 E2.66241
G1 X223.019 Y87.993 E1.69579
M204 S250
G1 X223.411 Y88.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X139.831 Y88.445 E2.48956
G1 X139.831 Y34.865 E1.59597
G1 X223.411 Y34.865 E2.48956
G1 X223.411 Y88.385 E1.59418
; WIPE_START
M204 S5000
G1 X221.411 Y88.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X222.588 Y87.621 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X222.507 Y87.638 E.00278
; LINE_WIDTH: 0.448395
G1 X222.427 Y87.655 E.00263
; LINE_WIDTH: 0.43172
G1 X140.816 Y87.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00556
G1 X140.638 Y87.541 E.00278
; LINE_WIDTH: 0.448395
G1 X140.621 Y87.46 E.00263
; LINE_WIDTH: 0.431747
G1 X140.621 Y35.849 E1.58521
G1 X140.638 Y35.769 E.00253
; LINE_WIDTH: 0.481759
G1 X140.655 Y35.688 E.00285
; LINE_WIDTH: 0.481745
G1 X140.735 Y35.671 E.00285
; LINE_WIDTH: 0.448395
G1 X140.816 Y35.655 E.00263
; LINE_WIDTH: 0.43172
G1 X222.427 Y35.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X222.588 Y35.688 E.00556
G1 X222.605 Y35.769 E.00278
; LINE_WIDTH: 0.448395
G1 X222.621 Y35.849 E.00263
; LINE_WIDTH: 0.43172
G1 X222.621 Y87.46 E1.5851
; LINE_WIDTH: 0.470635
G1 X222.6 Y87.563 E.00353
; OBJECT_ID: 481
; WIPE_START
G1 X222.507 Y87.638 E-.04541
G1 X222.427 Y87.655 E-.03125
G1 X220.629 Y87.655 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X213.147 Y86.145 Z1.4 F15000
G1 X43.762 Y51.969 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.574 Y51.969 E2.59862
G1 X124.574 Y103.173 E1.64654
G1 X43.37 Y103.173 E2.61123
G1 X43.37 Y51.969 E1.64654
G1 X43.702 Y51.969 E.01068
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.182 Y52.361 E2.39544
G1 X124.182 Y102.781 E1.50184
G1 X43.762 Y102.781 E2.39544
G1 X43.762 Y52.421 E1.50005
; WIPE_START
M204 S5000
G1 X45.762 Y52.42 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.169 Y56.568 Z1.4 F15000
G1 X125.37 Y103.969 Z1.4
G1 Z1
M73 P60 R11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.574 Y103.969 E2.66241
G1 X42.574 Y51.173 E1.69772
G1 X125.37 Y51.173 E2.66241
G1 X125.37 Y103.909 E1.69579
M204 S250
G1 X125.762 Y104.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.182 Y104.361 E2.48956
G1 X42.182 Y50.781 E1.59597
G1 X125.762 Y50.781 E2.48956
G1 X125.762 Y104.301 E1.59418
; WIPE_START
M204 S5000
G1 X123.762 Y104.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.939 Y103.538 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.858 Y103.554 E.00278
; LINE_WIDTH: 0.448395
G1 X124.778 Y103.571 E.00263
; LINE_WIDTH: 0.43172
G1 X43.166 Y103.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00556
G1 X42.989 Y103.457 E.00278
; LINE_WIDTH: 0.448395
G1 X42.972 Y103.377 E.00263
; LINE_WIDTH: 0.431747
G1 X42.972 Y51.765 E1.58521
G1 X42.989 Y51.685 E.00253
; LINE_WIDTH: 0.481759
G1 X43.005 Y51.604 E.00285
; LINE_WIDTH: 0.481745
G1 X43.086 Y51.588 E.00285
; LINE_WIDTH: 0.448395
G1 X43.166 Y51.571 E.00263
; LINE_WIDTH: 0.43172
G1 X124.778 Y51.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.939 Y51.604 E.00556
G1 X124.955 Y51.685 E.00278
; LINE_WIDTH: 0.448395
G1 X124.972 Y51.765 E.00263
; LINE_WIDTH: 0.43172
G1 X124.972 Y103.377 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.951 Y103.479 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X124.858 Y103.554 E-.04541
G1 X124.778 Y103.571 E-.03125
G1 X122.979 Y103.571 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 6/17
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I1.217 J0 P1  F15000
; object ids of layer 6 start: 470,481,503,525
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
; object ids of this layer6 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.644 Y164.223
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.456 Y164.223 E2.59862
G1 X124.456 Y215.428 E1.64654
G1 X43.251 Y215.428 E2.61123
G1 X43.251 Y164.223 E1.64654
G1 X43.584 Y164.223 E.01068
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.064 Y164.616 E2.39544
G1 X124.064 Y215.036 E1.50184
G1 X43.644 Y215.036 E2.39544
G1 X43.644 Y164.676 E1.50005
; WIPE_START
M204 S5000
G1 X45.644 Y164.674 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.05 Y168.823 Z1.6 F15000
G1 X125.252 Y216.224 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.456 Y216.224 E2.66241
G1 X42.456 Y163.428 E1.69772
G1 X125.252 Y163.428 E2.66241
G1 X125.252 Y216.164 E1.69579
M204 S250
G1 X125.644 Y216.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.064 Y216.616 E2.48956
G1 X42.064 Y163.036 E1.59597
G1 X125.644 Y163.036 E2.48956
G1 X125.644 Y216.556 E1.59418
; WIPE_START
M204 S5000
G1 X123.644 Y216.557 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.82 Y215.792 Z1.6 F15000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.74 Y215.809 E.00278
; LINE_WIDTH: 0.448395
G1 X124.659 Y215.826 E.00263
; LINE_WIDTH: 0.43172
G1 X43.048 Y215.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00556
G1 X42.87 Y215.712 E.00278
; LINE_WIDTH: 0.448395
G1 X42.854 Y215.631 E.00263
; LINE_WIDTH: 0.431747
G1 X42.854 Y164.02 E1.58521
G1 X42.87 Y163.939 E.00253
; LINE_WIDTH: 0.481759
G1 X42.887 Y163.859 E.00285
; LINE_WIDTH: 0.481745
G1 X42.967 Y163.842 E.00285
; LINE_WIDTH: 0.448395
G1 X43.048 Y163.826 E.00263
; LINE_WIDTH: 0.43172
G1 X124.659 Y163.826 E2.50648
; LINE_WIDTH: 0.470635
M73 P61 R11
G1 X124.82 Y163.859 E.00556
G1 X124.837 Y163.939 E.00278
; LINE_WIDTH: 0.448395
G1 X124.854 Y164.02 E.00263
; LINE_WIDTH: 0.43172
G1 X124.854 Y215.631 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.832 Y215.733 E.00353
; OBJECT_ID: 503
; WIPE_START
G1 X124.74 Y215.809 E-.04541
G1 X124.659 Y215.826 E-.03125
G1 X122.861 Y215.826 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X124.484 Y208.368 Z1.6 F15000
G1 X140.449 Y135.01 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X221.261 Y135.01 E2.59862
G1 X221.261 Y186.215 E1.64654
G1 X140.057 Y186.215 E2.61123
G1 X140.057 Y135.01 E1.64654
G1 X140.389 Y135.01 E.01068
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X220.869 Y135.403 E2.39544
G1 X220.869 Y185.823 E1.50184
G1 X140.449 Y185.823 E2.39544
G1 X140.449 Y135.463 E1.50005
; WIPE_START
M204 S5000
G1 X142.449 Y135.461 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.855 Y139.61 Z1.6 F15000
G1 X222.057 Y187.01 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P61 R10
G1 X139.261 Y187.01 E2.66241
G1 X139.261 Y134.215 E1.69772
G1 X222.057 Y134.215 E2.66241
G1 X222.057 Y186.95 E1.69579
M204 S250
G1 X222.449 Y187.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.869 Y187.403 E2.48956
G1 X138.869 Y133.823 E1.59597
G1 X222.449 Y133.823 E2.48956
G1 X222.449 Y187.343 E1.59418
; WIPE_START
M204 S5000
G1 X220.449 Y187.344 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X221.625 Y186.579 Z1.6 F15000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X221.545 Y186.596 E.00278
; LINE_WIDTH: 0.448395
G1 X221.464 Y186.613 E.00263
; LINE_WIDTH: 0.43172
G1 X139.853 Y186.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00556
G1 X139.675 Y186.499 E.00278
; LINE_WIDTH: 0.448395
G1 X139.659 Y186.418 E.00263
; LINE_WIDTH: 0.431747
G1 X139.659 Y134.807 E1.58521
G1 X139.675 Y134.726 E.00253
; LINE_WIDTH: 0.481759
G1 X139.692 Y134.646 E.00285
; LINE_WIDTH: 0.481745
G1 X139.773 Y134.629 E.00285
; LINE_WIDTH: 0.448395
G1 X139.853 Y134.613 E.00263
; LINE_WIDTH: 0.43172
G1 X221.464 Y134.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X221.625 Y134.646 E.00556
G1 X221.642 Y134.726 E.00278
; LINE_WIDTH: 0.448395
G1 X221.659 Y134.807 E.00263
; LINE_WIDTH: 0.43172
G1 X221.659 Y186.418 E1.5851
; LINE_WIDTH: 0.470635
G1 X221.638 Y186.52 E.00353
; OBJECT_ID: 470
; WIPE_START
G1 X221.545 Y186.596 E-.04541
G1 X221.464 Y186.613 E-.03125
G1 X219.666 Y186.613 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X216.146 Y179.84 Z1.6 F15000
G1 X141.411 Y36.053 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
M73 P62 R10
G1 X222.223 Y36.053 E2.59862
G1 X222.223 Y87.257 E1.64654
G1 X141.019 Y87.257 E2.61123
G1 X141.019 Y36.053 E1.64654
G1 X141.351 Y36.053 E.01068
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X221.831 Y36.445 E2.39544
G1 X221.831 Y86.865 E1.50184
G1 X141.411 Y86.865 E2.39544
G1 X141.411 Y36.505 E1.50005
; WIPE_START
M204 S5000
G1 X143.411 Y36.503 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.818 Y40.652 Z1.6 F15000
G1 X223.019 Y88.053 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.223 Y88.053 E2.66241
G1 X140.223 Y35.257 E1.69772
G1 X223.019 Y35.257 E2.66241
G1 X223.019 Y87.993 E1.69579
M204 S250
G1 X223.411 Y88.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X139.831 Y88.445 E2.48956
G1 X139.831 Y34.865 E1.59597
G1 X223.411 Y34.865 E2.48956
G1 X223.411 Y88.385 E1.59418
; WIPE_START
M204 S5000
G1 X221.411 Y88.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X222.588 Y87.621 Z1.6 F15000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X222.507 Y87.638 E.00278
; LINE_WIDTH: 0.448395
G1 X222.427 Y87.655 E.00263
; LINE_WIDTH: 0.43172
G1 X140.816 Y87.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00556
G1 X140.638 Y87.541 E.00278
; LINE_WIDTH: 0.448395
G1 X140.621 Y87.46 E.00263
; LINE_WIDTH: 0.431747
G1 X140.621 Y35.849 E1.58521
G1 X140.638 Y35.769 E.00253
; LINE_WIDTH: 0.481759
G1 X140.655 Y35.688 E.00285
; LINE_WIDTH: 0.481745
G1 X140.735 Y35.671 E.00285
; LINE_WIDTH: 0.448395
G1 X140.816 Y35.655 E.00263
; LINE_WIDTH: 0.43172
G1 X222.427 Y35.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X222.588 Y35.688 E.00556
G1 X222.605 Y35.769 E.00278
; LINE_WIDTH: 0.448395
G1 X222.621 Y35.849 E.00263
; LINE_WIDTH: 0.43172
G1 X222.621 Y87.46 E1.5851
; LINE_WIDTH: 0.470635
G1 X222.6 Y87.563 E.00353
; OBJECT_ID: 481
; WIPE_START
G1 X222.507 Y87.638 E-.04541
G1 X222.427 Y87.655 E-.03125
G1 X220.629 Y87.655 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X213.147 Y86.145 Z1.6 F15000
G1 X43.762 Y51.969 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.574 Y51.969 E2.59862
G1 X124.574 Y103.173 E1.64654
G1 X43.37 Y103.173 E2.61123
G1 X43.37 Y51.969 E1.64654
G1 X43.702 Y51.969 E.01068
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.182 Y52.361 E2.39544
G1 X124.182 Y102.781 E1.50184
G1 X43.762 Y102.781 E2.39544
G1 X43.762 Y52.421 E1.50005
; WIPE_START
M204 S5000
G1 X45.762 Y52.42 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.169 Y56.568 Z1.6 F15000
G1 X125.37 Y103.969 Z1.6
M73 P63 R10
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.574 Y103.969 E2.66241
G1 X42.574 Y51.173 E1.69772
G1 X125.37 Y51.173 E2.66241
G1 X125.37 Y103.909 E1.69579
M204 S250
G1 X125.762 Y104.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.182 Y104.361 E2.48956
G1 X42.182 Y50.781 E1.59597
G1 X125.762 Y50.781 E2.48956
G1 X125.762 Y104.301 E1.59418
; WIPE_START
M204 S5000
G1 X123.762 Y104.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.939 Y103.538 Z1.6 F15000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.858 Y103.554 E.00278
; LINE_WIDTH: 0.448395
G1 X124.778 Y103.571 E.00263
; LINE_WIDTH: 0.43172
G1 X43.166 Y103.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00556
G1 X42.989 Y103.457 E.00278
; LINE_WIDTH: 0.448395
G1 X42.972 Y103.377 E.00263
; LINE_WIDTH: 0.431747
G1 X42.972 Y51.765 E1.58521
G1 X42.989 Y51.685 E.00253
; LINE_WIDTH: 0.481759
G1 X43.005 Y51.604 E.00285
; LINE_WIDTH: 0.481745
G1 X43.086 Y51.588 E.00285
; LINE_WIDTH: 0.448395
G1 X43.166 Y51.571 E.00263
; LINE_WIDTH: 0.43172
G1 X124.778 Y51.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.939 Y51.604 E.00556
G1 X124.955 Y51.685 E.00278
; LINE_WIDTH: 0.448395
G1 X124.972 Y51.765 E.00263
; LINE_WIDTH: 0.43172
G1 X124.972 Y103.377 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.951 Y103.479 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X124.858 Y103.554 E-.04541
G1 X124.778 Y103.571 E-.03125
G1 X122.979 Y103.571 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 7/17
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F15000
; object ids of layer 7 start: 470,481,503,525
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
; object ids of this layer7 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.644 Y164.223
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.456 Y164.223 E2.59862
G1 X124.456 Y215.428 E1.64654
G1 X43.251 Y215.428 E2.61123
G1 X43.251 Y164.223 E1.64654
G1 X43.584 Y164.223 E.01068
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.064 Y164.616 E2.39544
G1 X124.064 Y215.036 E1.50184
G1 X43.644 Y215.036 E2.39544
G1 X43.644 Y164.676 E1.50005
; WIPE_START
M204 S5000
G1 X45.644 Y164.674 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.05 Y168.823 Z1.8 F15000
G1 X125.252 Y216.224 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.456 Y216.224 E2.66241
G1 X42.456 Y163.428 E1.69772
G1 X125.252 Y163.428 E2.66241
G1 X125.252 Y216.164 E1.69579
M204 S250
G1 X125.644 Y216.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.064 Y216.616 E2.48956
G1 X42.064 Y163.036 E1.59597
G1 X125.644 Y163.036 E2.48956
G1 X125.644 Y216.556 E1.59418
; WIPE_START
M204 S5000
G1 X123.644 Y216.557 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.82 Y215.792 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.74 Y215.809 E.00278
; LINE_WIDTH: 0.448395
M73 P64 R10
G1 X124.659 Y215.826 E.00263
; LINE_WIDTH: 0.43172
G1 X43.048 Y215.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00556
G1 X42.87 Y215.712 E.00278
; LINE_WIDTH: 0.448395
G1 X42.854 Y215.631 E.00263
; LINE_WIDTH: 0.431747
G1 X42.854 Y164.02 E1.58521
G1 X42.87 Y163.939 E.00253
; LINE_WIDTH: 0.481759
G1 X42.887 Y163.859 E.00285
; LINE_WIDTH: 0.481745
G1 X42.967 Y163.842 E.00285
; LINE_WIDTH: 0.448395
G1 X43.048 Y163.826 E.00263
; LINE_WIDTH: 0.43172
G1 X124.659 Y163.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.82 Y163.859 E.00556
G1 X124.837 Y163.939 E.00278
; LINE_WIDTH: 0.448395
G1 X124.854 Y164.02 E.00263
; LINE_WIDTH: 0.43172
G1 X124.854 Y215.631 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.832 Y215.733 E.00353
; OBJECT_ID: 503
; WIPE_START
G1 X124.74 Y215.809 E-.04541
G1 X124.659 Y215.826 E-.03125
G1 X122.861 Y215.826 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X124.484 Y208.368 Z1.8 F15000
G1 X140.449 Y135.01 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X221.261 Y135.01 E2.59862
G1 X221.261 Y186.215 E1.64654
G1 X140.057 Y186.215 E2.61123
G1 X140.057 Y135.01 E1.64654
G1 X140.389 Y135.01 E.01068
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X220.869 Y135.403 E2.39544
G1 X220.869 Y185.823 E1.50184
G1 X140.449 Y185.823 E2.39544
G1 X140.449 Y135.463 E1.50005
; WIPE_START
M204 S5000
G1 X142.449 Y135.461 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.855 Y139.61 Z1.8 F15000
G1 X222.057 Y187.01 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X139.261 Y187.01 E2.66241
G1 X139.261 Y134.215 E1.69772
G1 X222.057 Y134.215 E2.66241
G1 X222.057 Y186.95 E1.69579
M204 S250
G1 X222.449 Y187.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.869 Y187.403 E2.48956
G1 X138.869 Y133.823 E1.59597
G1 X222.449 Y133.823 E2.48956
G1 X222.449 Y187.343 E1.59418
; WIPE_START
M204 S5000
G1 X220.449 Y187.344 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X221.625 Y186.579 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X221.545 Y186.596 E.00278
; LINE_WIDTH: 0.448395
G1 X221.464 Y186.613 E.00263
; LINE_WIDTH: 0.43172
G1 X139.853 Y186.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00556
G1 X139.675 Y186.499 E.00278
; LINE_WIDTH: 0.448395
G1 X139.659 Y186.418 E.00263
; LINE_WIDTH: 0.431747
G1 X139.659 Y134.807 E1.58521
G1 X139.675 Y134.726 E.00253
; LINE_WIDTH: 0.481759
G1 X139.692 Y134.646 E.00285
; LINE_WIDTH: 0.481745
G1 X139.773 Y134.629 E.00285
; LINE_WIDTH: 0.448395
G1 X139.853 Y134.613 E.00263
; LINE_WIDTH: 0.43172
G1 X221.464 Y134.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X221.625 Y134.646 E.00556
G1 X221.642 Y134.726 E.00278
; LINE_WIDTH: 0.448395
G1 X221.659 Y134.807 E.00263
; LINE_WIDTH: 0.43172
G1 X221.659 Y186.418 E1.5851
; LINE_WIDTH: 0.470635
G1 X221.638 Y186.52 E.00353
; OBJECT_ID: 470
; WIPE_START
G1 X221.545 Y186.596 E-.04541
G1 X221.464 Y186.613 E-.03125
G1 X219.666 Y186.613 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X216.146 Y179.84 Z1.8 F15000
G1 X141.411 Y36.053 Z1.8
G1 Z1.4
M73 P65 R10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X222.223 Y36.053 E2.59862
M73 P65 R9
G1 X222.223 Y87.257 E1.64654
G1 X141.019 Y87.257 E2.61123
G1 X141.019 Y36.053 E1.64654
G1 X141.351 Y36.053 E.01068
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X221.831 Y36.445 E2.39544
G1 X221.831 Y86.865 E1.50184
G1 X141.411 Y86.865 E2.39544
G1 X141.411 Y36.505 E1.50005
; WIPE_START
M204 S5000
G1 X143.411 Y36.503 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.818 Y40.652 Z1.8 F15000
G1 X223.019 Y88.053 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.223 Y88.053 E2.66241
G1 X140.223 Y35.257 E1.69772
G1 X223.019 Y35.257 E2.66241
G1 X223.019 Y87.993 E1.69579
M204 S250
G1 X223.411 Y88.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X139.831 Y88.445 E2.48956
G1 X139.831 Y34.865 E1.59597
G1 X223.411 Y34.865 E2.48956
G1 X223.411 Y88.385 E1.59418
; WIPE_START
M204 S5000
G1 X221.411 Y88.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X222.588 Y87.621 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X222.507 Y87.638 E.00278
; LINE_WIDTH: 0.448395
G1 X222.427 Y87.655 E.00263
; LINE_WIDTH: 0.43172
G1 X140.816 Y87.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00556
G1 X140.638 Y87.541 E.00278
; LINE_WIDTH: 0.448395
G1 X140.621 Y87.46 E.00263
; LINE_WIDTH: 0.431747
G1 X140.621 Y35.849 E1.58521
G1 X140.638 Y35.769 E.00253
; LINE_WIDTH: 0.481759
G1 X140.655 Y35.688 E.00285
; LINE_WIDTH: 0.481745
G1 X140.735 Y35.671 E.00285
; LINE_WIDTH: 0.448395
G1 X140.816 Y35.655 E.00263
; LINE_WIDTH: 0.43172
G1 X222.427 Y35.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X222.588 Y35.688 E.00556
G1 X222.605 Y35.769 E.00278
; LINE_WIDTH: 0.448395
G1 X222.621 Y35.849 E.00263
; LINE_WIDTH: 0.43172
G1 X222.621 Y87.46 E1.5851
; LINE_WIDTH: 0.470635
G1 X222.6 Y87.563 E.00353
; OBJECT_ID: 481
; WIPE_START
G1 X222.507 Y87.638 E-.04541
G1 X222.427 Y87.655 E-.03125
G1 X220.629 Y87.655 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X213.147 Y86.145 Z1.8 F15000
G1 X43.762 Y51.969 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.574 Y51.969 E2.59862
G1 X124.574 Y103.173 E1.64654
G1 X43.37 Y103.173 E2.61123
G1 X43.37 Y51.969 E1.64654
G1 X43.702 Y51.969 E.01068
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.182 Y52.361 E2.39544
G1 X124.182 Y102.781 E1.50184
G1 X43.762 Y102.781 E2.39544
G1 X43.762 Y52.421 E1.50005
; WIPE_START
M204 S5000
M73 P66 R9
G1 X45.762 Y52.42 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.169 Y56.568 Z1.8 F15000
G1 X125.37 Y103.969 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.574 Y103.969 E2.66241
G1 X42.574 Y51.173 E1.69772
G1 X125.37 Y51.173 E2.66241
G1 X125.37 Y103.909 E1.69579
M204 S250
G1 X125.762 Y104.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.182 Y104.361 E2.48956
G1 X42.182 Y50.781 E1.59597
G1 X125.762 Y50.781 E2.48956
G1 X125.762 Y104.301 E1.59418
; WIPE_START
M204 S5000
G1 X123.762 Y104.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.939 Y103.538 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.858 Y103.554 E.00278
; LINE_WIDTH: 0.448395
G1 X124.778 Y103.571 E.00263
; LINE_WIDTH: 0.43172
G1 X43.166 Y103.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00556
G1 X42.989 Y103.457 E.00278
; LINE_WIDTH: 0.448395
G1 X42.972 Y103.377 E.00263
; LINE_WIDTH: 0.431747
G1 X42.972 Y51.765 E1.58521
G1 X42.989 Y51.685 E.00253
; LINE_WIDTH: 0.481759
G1 X43.005 Y51.604 E.00285
; LINE_WIDTH: 0.481745
G1 X43.086 Y51.588 E.00285
; LINE_WIDTH: 0.448395
G1 X43.166 Y51.571 E.00263
; LINE_WIDTH: 0.43172
G1 X124.778 Y51.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.939 Y51.604 E.00556
G1 X124.955 Y51.685 E.00278
; LINE_WIDTH: 0.448395
G1 X124.972 Y51.765 E.00263
; LINE_WIDTH: 0.43172
G1 X124.972 Y103.377 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.951 Y103.479 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X124.858 Y103.554 E-.04541
G1 X124.778 Y103.571 E-.03125
G1 X122.979 Y103.571 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 8/17
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I1.217 J0 P1  F15000
; object ids of layer 8 start: 470,481,503,525
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
; object ids of this layer8 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.644 Y164.223
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.456 Y164.223 E2.59862
G1 X124.456 Y215.428 E1.64654
G1 X43.251 Y215.428 E2.61123
G1 X43.251 Y164.223 E1.64654
G1 X43.584 Y164.223 E.01068
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.064 Y164.616 E2.39544
G1 X124.064 Y215.036 E1.50184
G1 X43.644 Y215.036 E2.39544
G1 X43.644 Y164.676 E1.50005
; WIPE_START
M204 S5000
G1 X45.644 Y164.674 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.05 Y168.823 Z2 F15000
G1 X125.252 Y216.224 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.456 Y216.224 E2.66241
G1 X42.456 Y163.428 E1.69772
G1 X125.252 Y163.428 E2.66241
G1 X125.252 Y216.164 E1.69579
M204 S250
G1 X125.644 Y216.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.064 Y216.616 E2.48956
G1 X42.064 Y163.036 E1.59597
M73 P67 R9
G1 X125.644 Y163.036 E2.48956
G1 X125.644 Y216.556 E1.59418
; WIPE_START
M204 S5000
G1 X123.644 Y216.557 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.82 Y215.792 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.74 Y215.809 E.00278
; LINE_WIDTH: 0.448395
G1 X124.659 Y215.826 E.00263
; LINE_WIDTH: 0.43172
G1 X43.048 Y215.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00556
G1 X42.87 Y215.712 E.00278
; LINE_WIDTH: 0.448395
G1 X42.854 Y215.631 E.00263
; LINE_WIDTH: 0.431747
G1 X42.854 Y164.02 E1.58521
G1 X42.87 Y163.939 E.00253
; LINE_WIDTH: 0.481759
G1 X42.887 Y163.859 E.00285
; LINE_WIDTH: 0.481745
G1 X42.967 Y163.842 E.00285
; LINE_WIDTH: 0.448395
G1 X43.048 Y163.826 E.00263
; LINE_WIDTH: 0.43172
G1 X124.659 Y163.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.82 Y163.859 E.00556
G1 X124.837 Y163.939 E.00278
; LINE_WIDTH: 0.448395
G1 X124.854 Y164.02 E.00263
; LINE_WIDTH: 0.43172
G1 X124.854 Y215.631 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.832 Y215.733 E.00353
; OBJECT_ID: 503
; WIPE_START
G1 X124.74 Y215.809 E-.04541
G1 X124.659 Y215.826 E-.03125
G1 X122.861 Y215.826 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X124.484 Y208.368 Z2 F15000
G1 X140.449 Y135.01 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X221.261 Y135.01 E2.59862
G1 X221.261 Y186.215 E1.64654
G1 X140.057 Y186.215 E2.61123
G1 X140.057 Y135.01 E1.64654
G1 X140.389 Y135.01 E.01068
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X220.869 Y135.403 E2.39544
G1 X220.869 Y185.823 E1.50184
G1 X140.449 Y185.823 E2.39544
G1 X140.449 Y135.463 E1.50005
; WIPE_START
M204 S5000
G1 X142.449 Y135.461 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.855 Y139.61 Z2 F15000
G1 X222.057 Y187.01 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X139.261 Y187.01 E2.66241
G1 X139.261 Y134.215 E1.69772
G1 X222.057 Y134.215 E2.66241
G1 X222.057 Y186.95 E1.69579
M204 S250
G1 X222.449 Y187.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.869 Y187.403 E2.48956
G1 X138.869 Y133.823 E1.59597
G1 X222.449 Y133.823 E2.48956
G1 X222.449 Y187.343 E1.59418
; WIPE_START
M204 S5000
G1 X220.449 Y187.344 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X221.625 Y186.579 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X221.545 Y186.596 E.00278
; LINE_WIDTH: 0.448395
G1 X221.464 Y186.613 E.00263
; LINE_WIDTH: 0.43172
G1 X139.853 Y186.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00556
G1 X139.675 Y186.499 E.00278
; LINE_WIDTH: 0.448395
G1 X139.659 Y186.418 E.00263
; LINE_WIDTH: 0.431747
G1 X139.659 Y134.807 E1.58521
G1 X139.675 Y134.726 E.00253
; LINE_WIDTH: 0.481759
G1 X139.692 Y134.646 E.00285
; LINE_WIDTH: 0.481745
G1 X139.773 Y134.629 E.00285
; LINE_WIDTH: 0.448395
G1 X139.853 Y134.613 E.00263
; LINE_WIDTH: 0.43172
G1 X221.464 Y134.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X221.625 Y134.646 E.00556
G1 X221.642 Y134.726 E.00278
; LINE_WIDTH: 0.448395
G1 X221.659 Y134.807 E.00263
; LINE_WIDTH: 0.43172
G1 X221.659 Y186.418 E1.5851
; LINE_WIDTH: 0.470635
G1 X221.638 Y186.52 E.00353
; OBJECT_ID: 470
; WIPE_START
G1 X221.545 Y186.596 E-.04541
G1 X221.464 Y186.613 E-.03125
G1 X219.666 Y186.613 E-.68334
; WIPE_END
M73 P68 R9
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X216.146 Y179.84 Z2 F15000
G1 X141.411 Y36.053 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X222.223 Y36.053 E2.59862
G1 X222.223 Y87.257 E1.64654
G1 X141.019 Y87.257 E2.61123
G1 X141.019 Y36.053 E1.64654
G1 X141.351 Y36.053 E.01068
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X221.831 Y36.445 E2.39544
G1 X221.831 Y86.865 E1.50184
G1 X141.411 Y86.865 E2.39544
G1 X141.411 Y36.505 E1.50005
; WIPE_START
M204 S5000
G1 X143.411 Y36.503 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.818 Y40.652 Z2 F15000
G1 X223.019 Y88.053 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.223 Y88.053 E2.66241
G1 X140.223 Y35.257 E1.69772
G1 X223.019 Y35.257 E2.66241
G1 X223.019 Y87.993 E1.69579
M204 S250
G1 X223.411 Y88.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X139.831 Y88.445 E2.48956
G1 X139.831 Y34.865 E1.59597
G1 X223.411 Y34.865 E2.48956
G1 X223.411 Y88.385 E1.59418
; WIPE_START
M204 S5000
G1 X221.411 Y88.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X222.588 Y87.621 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X222.507 Y87.638 E.00278
; LINE_WIDTH: 0.448395
G1 X222.427 Y87.655 E.00263
; LINE_WIDTH: 0.43172
M73 P68 R8
G1 X140.816 Y87.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00556
G1 X140.638 Y87.541 E.00278
; LINE_WIDTH: 0.448395
G1 X140.621 Y87.46 E.00263
; LINE_WIDTH: 0.431747
G1 X140.621 Y35.849 E1.58521
G1 X140.638 Y35.769 E.00253
; LINE_WIDTH: 0.481759
G1 X140.655 Y35.688 E.00285
; LINE_WIDTH: 0.481745
G1 X140.735 Y35.671 E.00285
; LINE_WIDTH: 0.448395
G1 X140.816 Y35.655 E.00263
; LINE_WIDTH: 0.43172
G1 X222.427 Y35.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X222.588 Y35.688 E.00556
G1 X222.605 Y35.769 E.00278
; LINE_WIDTH: 0.448395
G1 X222.621 Y35.849 E.00263
; LINE_WIDTH: 0.43172
G1 X222.621 Y87.46 E1.5851
; LINE_WIDTH: 0.470635
G1 X222.6 Y87.563 E.00353
; OBJECT_ID: 481
; WIPE_START
G1 X222.507 Y87.638 E-.04541
G1 X222.427 Y87.655 E-.03125
G1 X220.629 Y87.655 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X213.147 Y86.145 Z2 F15000
G1 X43.762 Y51.969 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.574 Y51.969 E2.59862
G1 X124.574 Y103.173 E1.64654
G1 X43.37 Y103.173 E2.61123
G1 X43.37 Y51.969 E1.64654
G1 X43.702 Y51.969 E.01068
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.182 Y52.361 E2.39544
G1 X124.182 Y102.781 E1.50184
M73 P69 R8
G1 X43.762 Y102.781 E2.39544
G1 X43.762 Y52.421 E1.50005
; WIPE_START
M204 S5000
G1 X45.762 Y52.42 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.169 Y56.568 Z2 F15000
G1 X125.37 Y103.969 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.574 Y103.969 E2.66241
G1 X42.574 Y51.173 E1.69772
G1 X125.37 Y51.173 E2.66241
G1 X125.37 Y103.909 E1.69579
M204 S250
G1 X125.762 Y104.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.182 Y104.361 E2.48956
G1 X42.182 Y50.781 E1.59597
G1 X125.762 Y50.781 E2.48956
G1 X125.762 Y104.301 E1.59418
; WIPE_START
M204 S5000
G1 X123.762 Y104.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.939 Y103.538 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.858 Y103.554 E.00278
; LINE_WIDTH: 0.448395
G1 X124.778 Y103.571 E.00263
; LINE_WIDTH: 0.43172
G1 X43.166 Y103.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00556
G1 X42.989 Y103.457 E.00278
; LINE_WIDTH: 0.448395
G1 X42.972 Y103.377 E.00263
; LINE_WIDTH: 0.431747
G1 X42.972 Y51.765 E1.58521
G1 X42.989 Y51.685 E.00253
; LINE_WIDTH: 0.481759
G1 X43.005 Y51.604 E.00285
; LINE_WIDTH: 0.481745
G1 X43.086 Y51.588 E.00285
; LINE_WIDTH: 0.448395
G1 X43.166 Y51.571 E.00263
; LINE_WIDTH: 0.43172
G1 X124.778 Y51.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.939 Y51.604 E.00556
G1 X124.955 Y51.685 E.00278
; LINE_WIDTH: 0.448395
G1 X124.972 Y51.765 E.00263
; LINE_WIDTH: 0.43172
G1 X124.972 Y103.377 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.951 Y103.479 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X124.858 Y103.554 E-.04541
G1 X124.778 Y103.571 E-.03125
G1 X122.979 Y103.571 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 9/17
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F15000
; object ids of layer 9 start: 470,481,503,525
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
; object ids of this layer9 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.644 Y164.223
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.456 Y164.223 E2.59862
G1 X124.456 Y215.428 E1.64654
G1 X43.251 Y215.428 E2.61123
G1 X43.251 Y164.223 E1.64654
G1 X43.584 Y164.223 E.01068
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.064 Y164.616 E2.39544
G1 X124.064 Y215.036 E1.50184
G1 X43.644 Y215.036 E2.39544
G1 X43.644 Y164.676 E1.50005
; WIPE_START
M204 S5000
G1 X45.644 Y164.674 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.05 Y168.823 Z2.2 F15000
G1 X125.252 Y216.224 Z2.2
G1 Z1.8
M73 P70 R8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.456 Y216.224 E2.66241
G1 X42.456 Y163.428 E1.69772
G1 X125.252 Y163.428 E2.66241
G1 X125.252 Y216.164 E1.69579
M204 S250
G1 X125.644 Y216.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.064 Y216.616 E2.48956
G1 X42.064 Y163.036 E1.59597
G1 X125.644 Y163.036 E2.48956
G1 X125.644 Y216.556 E1.59418
; WIPE_START
M204 S5000
G1 X123.644 Y216.557 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.82 Y215.792 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.74 Y215.809 E.00278
; LINE_WIDTH: 0.448395
G1 X124.659 Y215.826 E.00263
; LINE_WIDTH: 0.43172
G1 X43.048 Y215.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00556
G1 X42.87 Y215.712 E.00278
; LINE_WIDTH: 0.448395
G1 X42.854 Y215.631 E.00263
; LINE_WIDTH: 0.431747
G1 X42.854 Y164.02 E1.58521
G1 X42.87 Y163.939 E.00253
; LINE_WIDTH: 0.481759
G1 X42.887 Y163.859 E.00285
; LINE_WIDTH: 0.481745
G1 X42.967 Y163.842 E.00285
; LINE_WIDTH: 0.448395
G1 X43.048 Y163.826 E.00263
; LINE_WIDTH: 0.43172
G1 X124.659 Y163.826 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.82 Y163.859 E.00556
G1 X124.837 Y163.939 E.00278
; LINE_WIDTH: 0.448395
G1 X124.854 Y164.02 E.00263
; LINE_WIDTH: 0.43172
G1 X124.854 Y215.631 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.832 Y215.733 E.00353
; OBJECT_ID: 503
; WIPE_START
G1 X124.74 Y215.809 E-.04541
G1 X124.659 Y215.826 E-.03125
G1 X122.861 Y215.826 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X124.484 Y208.368 Z2.2 F15000
G1 X140.449 Y135.01 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X221.261 Y135.01 E2.59862
G1 X221.261 Y186.215 E1.64654
G1 X140.057 Y186.215 E2.61123
G1 X140.057 Y135.01 E1.64654
G1 X140.389 Y135.01 E.01068
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X220.869 Y135.403 E2.39544
G1 X220.869 Y185.823 E1.50184
G1 X140.449 Y185.823 E2.39544
G1 X140.449 Y135.463 E1.50005
; WIPE_START
M204 S5000
G1 X142.449 Y135.461 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.855 Y139.61 Z2.2 F15000
G1 X222.057 Y187.01 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X139.261 Y187.01 E2.66241
G1 X139.261 Y134.215 E1.69772
G1 X222.057 Y134.215 E2.66241
G1 X222.057 Y186.95 E1.69579
M204 S250
G1 X222.449 Y187.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X138.869 Y187.403 E2.48956
G1 X138.869 Y133.823 E1.59597
G1 X222.449 Y133.823 E2.48956
G1 X222.449 Y187.343 E1.59418
; WIPE_START
M204 S5000
G1 X220.449 Y187.344 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X221.625 Y186.579 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X221.545 Y186.596 E.00278
; LINE_WIDTH: 0.448395
G1 X221.464 Y186.613 E.00263
; LINE_WIDTH: 0.43172
G1 X139.853 Y186.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00556
G1 X139.675 Y186.499 E.00278
; LINE_WIDTH: 0.448395
G1 X139.659 Y186.418 E.00263
; LINE_WIDTH: 0.431747
G1 X139.659 Y134.807 E1.58521
G1 X139.675 Y134.726 E.00253
; LINE_WIDTH: 0.481759
G1 X139.692 Y134.646 E.00285
; LINE_WIDTH: 0.481745
G1 X139.773 Y134.629 E.00285
; LINE_WIDTH: 0.448395
G1 X139.853 Y134.613 E.00263
; LINE_WIDTH: 0.43172
G1 X221.464 Y134.613 E2.50648
; LINE_WIDTH: 0.470635
G1 X221.625 Y134.646 E.00556
G1 X221.642 Y134.726 E.00278
; LINE_WIDTH: 0.448395
G1 X221.659 Y134.807 E.00263
; LINE_WIDTH: 0.43172
G1 X221.659 Y186.418 E1.5851
; LINE_WIDTH: 0.470635
G1 X221.638 Y186.52 E.00353
; OBJECT_ID: 470
; WIPE_START
G1 X221.545 Y186.596 E-.04541
M73 P71 R8
G1 X221.464 Y186.613 E-.03125
G1 X219.666 Y186.613 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X216.146 Y179.84 Z2.2 F15000
G1 X141.411 Y36.053 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X222.223 Y36.053 E2.59862
G1 X222.223 Y87.257 E1.64654
G1 X141.019 Y87.257 E2.61123
G1 X141.019 Y36.053 E1.64654
G1 X141.351 Y36.053 E.01068
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X221.831 Y36.445 E2.39544
G1 X221.831 Y86.865 E1.50184
G1 X141.411 Y86.865 E2.39544
G1 X141.411 Y36.505 E1.50005
; WIPE_START
M204 S5000
G1 X143.411 Y36.503 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.818 Y40.652 Z2.2 F15000
G1 X223.019 Y88.053 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.223 Y88.053 E2.66241
G1 X140.223 Y35.257 E1.69772
G1 X223.019 Y35.257 E2.66241
G1 X223.019 Y87.993 E1.69579
M204 S250
G1 X223.411 Y88.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X139.831 Y88.445 E2.48956
G1 X139.831 Y34.865 E1.59597
G1 X223.411 Y34.865 E2.48956
G1 X223.411 Y88.385 E1.59418
; WIPE_START
M204 S5000
G1 X221.411 Y88.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X222.588 Y87.621 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X222.507 Y87.638 E.00278
; LINE_WIDTH: 0.448395
G1 X222.427 Y87.655 E.00263
; LINE_WIDTH: 0.43172
G1 X140.816 Y87.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00556
G1 X140.638 Y87.541 E.00278
; LINE_WIDTH: 0.448395
G1 X140.621 Y87.46 E.00263
; LINE_WIDTH: 0.431747
G1 X140.621 Y35.849 E1.58521
G1 X140.638 Y35.769 E.00253
; LINE_WIDTH: 0.481759
G1 X140.655 Y35.688 E.00285
; LINE_WIDTH: 0.481745
G1 X140.735 Y35.671 E.00285
; LINE_WIDTH: 0.448395
G1 X140.816 Y35.655 E.00263
; LINE_WIDTH: 0.43172
G1 X222.427 Y35.655 E2.50648
; LINE_WIDTH: 0.470635
G1 X222.588 Y35.688 E.00556
G1 X222.605 Y35.769 E.00278
; LINE_WIDTH: 0.448395
G1 X222.621 Y35.849 E.00263
; LINE_WIDTH: 0.43172
G1 X222.621 Y87.46 E1.5851
; LINE_WIDTH: 0.470635
G1 X222.6 Y87.563 E.00353
; OBJECT_ID: 481
; WIPE_START
G1 X222.507 Y87.638 E-.04541
G1 X222.427 Y87.655 E-.03125
G1 X220.629 Y87.655 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X213.147 Y86.145 Z2.2 F15000
G1 X43.762 Y51.969 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X124.574 Y51.969 E2.59862
M73 P72 R8
G1 X124.574 Y103.173 E1.64654
G1 X43.37 Y103.173 E2.61123
G1 X43.37 Y51.969 E1.64654
G1 X43.702 Y51.969 E.01068
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.182 Y52.361 E2.39544
G1 X124.182 Y102.781 E1.50184
G1 X43.762 Y102.781 E2.39544
M73 P72 R7
G1 X43.762 Y52.421 E1.50005
; WIPE_START
M204 S5000
G1 X45.762 Y52.42 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.169 Y56.568 Z2.2 F15000
G1 X125.37 Y103.969 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X42.574 Y103.969 E2.66241
G1 X42.574 Y51.173 E1.69772
G1 X125.37 Y51.173 E2.66241
G1 X125.37 Y103.909 E1.69579
M204 S250
G1 X125.762 Y104.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X42.182 Y104.361 E2.48956
G1 X42.182 Y50.781 E1.59597
G1 X125.762 Y50.781 E2.48956
G1 X125.762 Y104.301 E1.59418
; WIPE_START
M204 S5000
G1 X123.762 Y104.303 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.939 Y103.538 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X124.858 Y103.554 E.00278
; LINE_WIDTH: 0.448395
G1 X124.778 Y103.571 E.00263
; LINE_WIDTH: 0.43172
G1 X43.166 Y103.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00556
G1 X42.989 Y103.457 E.00278
; LINE_WIDTH: 0.448395
G1 X42.972 Y103.377 E.00263
; LINE_WIDTH: 0.431747
G1 X42.972 Y51.765 E1.58521
G1 X42.989 Y51.685 E.00253
; LINE_WIDTH: 0.481759
G1 X43.005 Y51.604 E.00285
; LINE_WIDTH: 0.481745
G1 X43.086 Y51.588 E.00285
; LINE_WIDTH: 0.448395
G1 X43.166 Y51.571 E.00263
; LINE_WIDTH: 0.43172
G1 X124.778 Y51.571 E2.50648
; LINE_WIDTH: 0.470635
G1 X124.939 Y51.604 E.00556
G1 X124.955 Y51.685 E.00278
; LINE_WIDTH: 0.448395
G1 X124.972 Y51.765 E.00263
; LINE_WIDTH: 0.43172
G1 X124.972 Y103.377 E1.5851
; LINE_WIDTH: 0.470635
G1 X124.951 Y103.479 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X124.858 Y103.554 E-.04541
G1 X124.778 Y103.571 E-.03125
G1 X122.979 Y103.571 E-.68334
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 10/17
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F15000
; object ids of layer 10 start: 470,481,503,525
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
; object ids of this layer10 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.644 Y164.223
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.251 Y164.223 E.01261
G1 X43.251 Y215.428 E1.64654
G1 X119.409 Y215.428 E2.44894
G1 X119.409 Y216.224 E.02559
G1 X42.456 Y216.224 E2.47453
G1 X42.456 Y163.428 E1.69772
G1 X119.409 Y163.428 E2.47453
G1 X119.409 Y164.223 E.02559
G1 X43.704 Y164.223 E2.4344
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.064 Y164.616 E2.39544
G1 X124.064 Y215.036 E1.50184
G1 X43.644 Y215.036 E2.39544
G1 X43.644 Y164.676 E1.50005
; WIPE_START
M204 S5000
M73 P73 R7
G1 X45.644 Y164.674 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.045 Y168.83 Z2.4 F15000
G1 X125.644 Y216.616 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X42.064 Y216.616 E2.48956
G1 X42.064 Y163.036 E1.59597
G1 X125.644 Y163.036 E2.48956
G1 X125.644 Y216.556 E1.59418
M204 S5000
G1 X124.728 Y216.408 F15000
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X125.436 Y215.7 E.02983
G1 X125.436 Y215.167
G1 X124.195 Y216.408 E.0523
G1 X123.661 Y216.408
G1 X125.436 Y214.633 E.07476
G1 X125.436 Y214.1
G1 X123.128 Y216.408 E.09722
G1 X122.595 Y216.408
G1 X123.76 Y215.243 E.04908
G1 X123.227 Y215.243
G1 X122.062 Y216.408 E.04908
G1 X121.528 Y216.408
G1 X122.694 Y215.243 E.04908
G1 X122.16 Y215.243
G1 X120.995 Y216.408 E.04908
G1 X120.462 Y216.408
G1 X121.627 Y215.243 E.04908
G1 X121.094 Y215.243
G1 X119.929 Y216.408 E.04908
G1 X119.631 Y216.172
G1 X120.561 Y215.243 E.03915
G1 X120.027 Y215.243
G1 X119.631 Y215.639 E.01669
; WIPE_START
M204 S5000
G1 X120.027 Y215.243 E-.21286
G1 X120.561 Y215.243 E-.20264
G1 X119.92 Y215.884 E-.3445
; WIPE_END
G1 E-.04 F1800
G1 X124.271 Y214.732 Z2.4 F15000
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X125.436 Y213.567 E.04908
G1 X125.436 Y213.034
G1 X124.271 Y214.199 E.04908
G1 X124.271 Y213.666
G1 X125.436 Y212.5 E.04908
G1 X125.436 Y211.967
G1 X124.271 Y213.132 E.04908
G1 X124.271 Y212.599
G1 X125.436 Y211.434 E.04908
G1 X125.436 Y210.901
G1 X124.271 Y212.066 E.04908
G1 X124.271 Y211.533
G1 X125.436 Y210.367 E.04908
G1 X125.436 Y209.834
G1 X124.271 Y210.999 E.04908
G1 X124.271 Y210.466
G1 X125.436 Y209.301 E.04908
G1 X125.436 Y208.768
G1 X124.271 Y209.933 E.04908
G1 X124.271 Y209.4
G1 X125.436 Y208.234 E.04908
G1 X125.436 Y207.701
G1 X124.271 Y208.866 E.04908
G1 X124.271 Y208.333
G1 X125.436 Y207.168 E.04908
G1 X125.436 Y206.635
G1 X124.271 Y207.8 E.04908
G1 X124.271 Y207.267
G1 X125.436 Y206.101 E.04908
G1 X125.436 Y205.568
G1 X124.271 Y206.733 E.04908
G1 X124.271 Y206.2
G1 X125.436 Y205.035 E.04908
G1 X125.436 Y204.502
G1 X124.271 Y205.667 E.04908
G1 X124.271 Y205.134
G1 X125.436 Y203.968 E.04908
G1 X125.436 Y203.435
G1 X124.271 Y204.6 E.04908
G1 X124.271 Y204.067
G1 X125.436 Y202.902 E.04908
G1 X125.436 Y202.369
G1 X124.271 Y203.534 E.04908
G1 X124.271 Y203
G1 X125.436 Y201.835 E.04908
G1 X125.436 Y201.302
G1 X124.271 Y202.467 E.04908
G1 X124.271 Y201.934
G1 X125.436 Y200.769 E.04908
G1 X125.436 Y200.235
G1 X124.271 Y201.401 E.04908
G1 X124.271 Y200.867
G1 X125.436 Y199.702 E.04908
G1 X125.436 Y199.169
G1 X124.271 Y200.334 E.04908
G1 X124.271 Y199.801
G1 X125.436 Y198.636 E.04908
G1 X125.436 Y198.102
G1 X124.271 Y199.268 E.04908
G1 X124.271 Y198.734
G1 X125.436 Y197.569 E.04908
G1 X125.436 Y197.036
G1 X124.271 Y198.201 E.04908
G1 X124.271 Y197.668
G1 X125.436 Y196.503 E.04908
G1 X125.436 Y195.969
G1 X124.271 Y197.135 E.04908
G1 X124.271 Y196.601
G1 X125.436 Y195.436 E.04908
G1 X125.436 Y194.903
G1 X124.271 Y196.068 E.04908
G1 X124.271 Y195.535
G1 X125.436 Y194.37 E.04908
G1 X125.436 Y193.836
G1 X124.271 Y195.002 E.04908
G1 X124.271 Y194.468
G1 X125.436 Y193.303 E.04908
G1 X125.436 Y192.77
G1 X124.271 Y193.935 E.04908
G1 X124.271 Y193.402
G1 X125.436 Y192.237 E.04908
G1 X125.436 Y191.703
G1 X124.271 Y192.869 E.04908
G1 X124.271 Y192.335
G1 X125.436 Y191.17 E.04908
G1 X125.436 Y190.637
G1 X124.271 Y191.802 E.04908
G1 X124.271 Y191.269
G1 X125.436 Y190.104 E.04908
G1 X125.436 Y189.57
G1 X124.271 Y190.736 E.04908
G1 X124.271 Y190.202
G1 X125.436 Y189.037 E.04908
G1 X125.436 Y188.504
G1 X124.271 Y189.669 E.04908
G1 X124.271 Y189.136
M73 P74 R7
G1 X125.436 Y187.971 E.04908
G1 X125.436 Y187.437
G1 X124.271 Y188.603 E.04908
G1 X124.271 Y188.069
G1 X125.436 Y186.904 E.04908
G1 X125.436 Y186.371
G1 X124.271 Y187.536 E.04908
G1 X124.271 Y187.003
G1 X125.436 Y185.838 E.04908
G1 X125.436 Y185.304
G1 X124.271 Y186.47 E.04908
G1 X124.271 Y185.936
G1 X125.436 Y184.771 E.04908
G1 X125.436 Y184.238
G1 X124.271 Y185.403 E.04908
G1 X124.271 Y184.87
G1 X125.436 Y183.705 E.04908
G1 X125.436 Y183.171
G1 X124.271 Y184.336 E.04908
G1 X124.271 Y183.803
G1 X125.436 Y182.638 E.04908
G1 X125.436 Y182.105
G1 X124.271 Y183.27 E.04908
G1 X124.271 Y182.737
G1 X125.436 Y181.571 E.04908
G1 X125.436 Y181.038
G1 X124.271 Y182.203 E.04908
G1 X124.271 Y181.67
G1 X125.436 Y180.505 E.04908
G1 X125.436 Y179.972
G1 X124.271 Y181.137 E.04908
G1 X124.271 Y180.604
G1 X125.436 Y179.438 E.04908
G1 X125.436 Y178.905
G1 X124.271 Y180.07 E.04908
G1 X124.271 Y179.537
G1 X125.436 Y178.372 E.04908
G1 X125.436 Y177.839
G1 X124.271 Y179.004 E.04908
G1 X124.271 Y178.471
G1 X125.436 Y177.305 E.04908
G1 X125.436 Y176.772
G1 X124.271 Y177.937 E.04908
G1 X124.271 Y177.404
G1 X125.436 Y176.239 E.04908
G1 X125.436 Y175.706
G1 X124.271 Y176.871 E.04908
G1 X124.271 Y176.338
G1 X125.436 Y175.172 E.04908
G1 X125.436 Y174.639
G1 X124.271 Y175.804 E.04908
G1 X124.271 Y175.271
G1 X125.436 Y174.106 E.04908
G1 X125.436 Y173.573
G1 X124.271 Y174.738 E.04908
G1 X124.271 Y174.205
G1 X125.436 Y173.039 E.04908
G1 X125.436 Y172.506
G1 X124.271 Y173.671 E.04908
G1 X124.271 Y173.138
G1 X125.436 Y171.973 E.04908
G1 X125.436 Y171.44
G1 X124.271 Y172.605 E.04908
G1 X124.271 Y172.072
G1 X125.436 Y170.906 E.04908
G1 X125.436 Y170.373
G1 X124.271 Y171.538 E.04908
G1 X124.271 Y171.005
G1 X125.436 Y169.84 E.04908
G1 X125.436 Y169.307
G1 X124.271 Y170.472 E.04908
G1 X124.271 Y169.939
G1 X125.436 Y168.773 E.04908
G1 X125.436 Y168.24
G1 X124.271 Y169.405 E.04908
G1 X124.271 Y168.872
G1 X125.436 Y167.707 E.04908
G1 X125.436 Y167.174
G1 X124.271 Y168.339 E.04908
G1 X124.271 Y167.806
G1 X125.436 Y166.64 E.04908
G1 X125.436 Y166.107
G1 X124.271 Y167.272 E.04908
G1 X124.271 Y166.739
G1 X125.436 Y165.574 E.04908
G1 X125.436 Y165.041
G1 X124.271 Y166.206 E.04908
G1 X124.271 Y165.672
G1 X125.436 Y164.507 E.04908
G1 X125.436 Y163.974
G1 X124.271 Y165.139 E.04908
G1 X124.271 Y164.606
G1 X125.436 Y163.441 E.04908
G1 X125.101 Y163.243
G1 X123.935 Y164.408 E.04908
G1 X123.402 Y164.408
G1 X124.567 Y163.243 E.04908
G1 X124.034 Y163.243
G1 X122.869 Y164.408 E.04908
G1 X122.336 Y164.408
G1 X123.501 Y163.243 E.04908
G1 X122.968 Y163.243
G1 X121.802 Y164.408 E.04908
G1 X121.269 Y164.408
G1 X122.434 Y163.243 E.04908
G1 X121.901 Y163.243
G1 X120.736 Y164.408 E.04908
G1 X120.203 Y164.408
G1 X121.368 Y163.243 E.04908
G1 X120.835 Y163.243
G1 X119.669 Y164.408 E.04908
G1 X119.631 Y163.913
G1 X120.301 Y163.243 E.02823
; WIPE_START
M204 S5000
G1 X119.631 Y163.913 E-.36014
G1 X119.669 Y164.408 E-.18869
G1 X120.062 Y164.015 E-.21117
; WIPE_END
G1 E-.04 F1800
G1 X119.205 Y163.826 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X43.048 Y163.826 E2.33897
; LINE_WIDTH: 0.448395
G1 X42.967 Y163.842 E.00263
; LINE_WIDTH: 0.470635
G1 X42.887 Y163.859 E.00278
G1 X42.854 Y164.02 E.00556
; LINE_WIDTH: 0.43172
G1 X42.854 Y215.631 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.87 Y215.712 E.00263
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00278
G1 X43.048 Y215.826 E.00556
; LINE_WIDTH: 0.43172
G1 X119.205 Y215.826 E2.33897
; OBJECT_ID: 503
; WIPE_START
G1 X117.205 Y215.826 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X119.315 Y208.49 Z2.4 F15000
G1 X140.449 Y135.01 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.057 Y135.01 E.01261
G1 X140.057 Y186.215 E1.64654
G1 X216.214 Y186.215 E2.44894
G1 X216.214 Y187.01 E.02559
G1 X139.261 Y187.01 E2.47453
G1 X139.261 Y134.215 E1.69772
G1 X216.214 Y134.215 E2.47453
G1 X216.214 Y135.01 E.02559
G1 X140.509 Y135.01 E2.4344
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X220.869 Y135.403 E2.39544
G1 X220.869 Y185.823 E1.50184
G1 X140.449 Y185.823 E2.39544
G1 X140.449 Y135.463 E1.50005
; WIPE_START
M204 S5000
G1 X142.449 Y135.461 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.85 Y139.617 Z2.4 F15000
G1 X222.449 Y187.403 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X138.869 Y187.403 E2.48956
G1 X138.869 Y133.823 E1.59597
G1 X222.449 Y133.823 E2.48956
G1 X222.449 Y187.343 E1.59418
M204 S5000
G1 X221.533 Y187.195 F15000
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X222.241 Y186.487 E.02983
G1 X222.241 Y185.954
G1 X221 Y187.195 E.0523
G1 X220.467 Y187.195
G1 X222.241 Y185.42 E.07476
G1 X222.241 Y184.887
G1 X219.933 Y187.195 E.09722
G1 X219.4 Y187.195
G1 X220.565 Y186.03 E.04908
G1 X220.032 Y186.03
G1 X218.867 Y187.195 E.04908
G1 X218.334 Y187.195
G1 X219.499 Y186.03 E.04908
G1 X218.966 Y186.03
G1 X217.8 Y187.195 E.04908
G1 X217.267 Y187.195
G1 X218.432 Y186.03 E.04908
G1 X217.899 Y186.03
G1 X216.734 Y187.195 E.04908
G1 X216.437 Y186.959
G1 X217.366 Y186.03 E.03915
G1 X216.833 Y186.03
G1 X216.437 Y186.426 E.01669
; WIPE_START
M204 S5000
G1 X216.833 Y186.03 E-.21286
G1 X217.366 Y186.03 E-.20264
G1 X216.725 Y186.671 E-.3445
; WIPE_END
G1 E-.04 F1800
G1 X221.076 Y185.519 Z2.4 F15000
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X222.241 Y184.354 E.04908
G1 X222.241 Y183.821
G1 X221.076 Y184.986 E.04908
G1 X221.076 Y184.453
G1 X222.241 Y183.287 E.04908
G1 X222.241 Y182.754
G1 X221.076 Y183.919 E.04908
G1 X221.076 Y183.386
G1 X222.241 Y182.221 E.04908
G1 X222.241 Y181.688
G1 X221.076 Y182.853 E.04908
G1 X221.076 Y182.32
G1 X222.241 Y181.154 E.04908
G1 X222.241 Y180.621
G1 X221.076 Y181.786 E.04908
M73 P75 R7
G1 X221.076 Y181.253
G1 X222.241 Y180.088 E.04908
G1 X222.241 Y179.555
G1 X221.076 Y180.72 E.04908
G1 X221.076 Y180.187
G1 X222.241 Y179.021 E.04908
G1 X222.241 Y178.488
G1 X221.076 Y179.653 E.04908
G1 X221.076 Y179.12
G1 X222.241 Y177.955 E.04908
G1 X222.241 Y177.422
G1 X221.076 Y178.587 E.04908
G1 X221.076 Y178.054
G1 X222.241 Y176.888 E.04908
G1 X222.241 Y176.355
G1 X221.076 Y177.52 E.04908
G1 X221.076 Y176.987
G1 X222.241 Y175.822 E.04908
G1 X222.241 Y175.289
G1 X221.076 Y176.454 E.04908
G1 X221.076 Y175.92
G1 X222.241 Y174.755 E.04908
G1 X222.241 Y174.222
G1 X221.076 Y175.387 E.04908
G1 X221.076 Y174.854
G1 X222.241 Y173.689 E.04908
G1 X222.241 Y173.155
G1 X221.076 Y174.321 E.04908
G1 X221.076 Y173.787
G1 X222.241 Y172.622 E.04908
G1 X222.241 Y172.089
G1 X221.076 Y173.254 E.04908
G1 X221.076 Y172.721
G1 X222.241 Y171.556 E.04908
G1 X222.241 Y171.022
G1 X221.076 Y172.188 E.04908
G1 X221.076 Y171.654
G1 X222.241 Y170.489 E.04908
G1 X222.241 Y169.956
G1 X221.076 Y171.121 E.04908
G1 X221.076 Y170.588
G1 X222.241 Y169.423 E.04908
G1 X222.241 Y168.889
G1 X221.076 Y170.055 E.04908
G1 X221.076 Y169.521
G1 X222.241 Y168.356 E.04908
G1 X222.241 Y167.823
G1 X221.076 Y168.988 E.04908
G1 X221.076 Y168.455
G1 X222.241 Y167.29 E.04908
G1 X222.241 Y166.756
G1 X221.076 Y167.922 E.04908
G1 X221.076 Y167.388
G1 X222.241 Y166.223 E.04908
G1 X222.241 Y165.69
G1 X221.076 Y166.855 E.04908
G1 X221.076 Y166.322
G1 X222.241 Y165.157 E.04908
G1 X222.241 Y164.623
G1 X221.076 Y165.789 E.04908
G1 X221.076 Y165.255
G1 X222.241 Y164.09 E.04908
G1 X222.241 Y163.557
G1 X221.076 Y164.722 E.04908
G1 X221.076 Y164.189
G1 X222.241 Y163.024 E.04908
G1 X222.241 Y162.49
G1 X221.076 Y163.656 E.04908
G1 X221.076 Y163.122
G1 X222.241 Y161.957 E.04908
G1 X222.241 Y161.424
G1 X221.076 Y162.589 E.04908
G1 X221.076 Y162.056
G1 X222.241 Y160.891 E.04908
G1 X222.241 Y160.357
G1 X221.076 Y161.523 E.04908
G1 X221.076 Y160.989
G1 X222.241 Y159.824 E.04908
G1 X222.241 Y159.291
G1 X221.076 Y160.456 E.04908
G1 X221.076 Y159.923
G1 X222.241 Y158.758 E.04908
G1 X222.241 Y158.224
G1 X221.076 Y159.389 E.04908
G1 X221.076 Y158.856
G1 X222.241 Y157.691 E.04908
G1 X222.241 Y157.158
G1 X221.076 Y158.323 E.04908
G1 X221.076 Y157.79
G1 X222.241 Y156.624 E.04908
G1 X222.241 Y156.091
G1 X221.076 Y157.256 E.04908
G1 X221.076 Y156.723
G1 X222.241 Y155.558 E.04908
G1 X222.241 Y155.025
G1 X221.076 Y156.19 E.04908
G1 X221.076 Y155.657
G1 X222.241 Y154.491 E.04908
G1 X222.241 Y153.958
G1 X221.076 Y155.123 E.04908
G1 X221.076 Y154.59
G1 X222.241 Y153.425 E.04908
G1 X222.241 Y152.892
G1 X221.076 Y154.057 E.04908
G1 X221.076 Y153.524
G1 X222.241 Y152.358 E.04908
G1 X222.241 Y151.825
G1 X221.076 Y152.99 E.04908
G1 X221.076 Y152.457
G1 X222.241 Y151.292 E.04908
G1 X222.241 Y150.759
G1 X221.076 Y151.924 E.04908
G1 X221.076 Y151.391
G1 X222.241 Y150.225 E.04908
G1 X222.241 Y149.692
G1 X221.076 Y150.857 E.04908
G1 X221.076 Y150.324
G1 X222.241 Y149.159 E.04908
G1 X222.241 Y148.626
G1 X221.076 Y149.791 E.04908
G1 X221.076 Y149.258
G1 X222.241 Y148.092 E.04908
G1 X222.241 Y147.559
G1 X221.076 Y148.724 E.04908
G1 X221.076 Y148.191
G1 X222.241 Y147.026 E.04908
G1 X222.241 Y146.493
G1 X221.076 Y147.658 E.04908
G1 X221.076 Y147.125
G1 X222.241 Y145.959 E.04908
G1 X222.241 Y145.426
G1 X221.076 Y146.591 E.04908
G1 X221.076 Y146.058
G1 X222.241 Y144.893 E.04908
G1 X222.241 Y144.36
G1 X221.076 Y145.525 E.04908
G1 X221.076 Y144.992
G1 X222.241 Y143.826 E.04908
G1 X222.241 Y143.293
G1 X221.076 Y144.458 E.04908
G1 X221.076 Y143.925
G1 X222.241 Y142.76 E.04908
G1 X222.241 Y142.227
G1 X221.076 Y143.392 E.04908
G1 X221.076 Y142.859
G1 X222.241 Y141.693 E.04908
G1 X222.241 Y141.16
G1 X221.076 Y142.325 E.04908
G1 X221.076 Y141.792
G1 X222.241 Y140.627 E.04908
G1 X222.241 Y140.094
G1 X221.076 Y141.259 E.04908
G1 X221.076 Y140.725
G1 X222.241 Y139.56 E.04908
G1 X222.241 Y139.027
G1 X221.076 Y140.192 E.04908
G1 X221.076 Y139.659
G1 X222.241 Y138.494 E.04908
G1 X222.241 Y137.96
G1 X221.076 Y139.126 E.04908
G1 X221.076 Y138.592
G1 X222.241 Y137.427 E.04908
G1 X222.241 Y136.894
G1 X221.076 Y138.059 E.04908
G1 X221.076 Y137.526
G1 X222.241 Y136.361 E.04908
G1 X222.241 Y135.827
G1 X221.076 Y136.993 E.04908
G1 X221.076 Y136.459
G1 X222.241 Y135.294 E.04908
G1 X222.241 Y134.761
G1 X221.076 Y135.926 E.04908
G1 X221.076 Y135.393
G1 X222.241 Y134.228 E.04908
G1 X221.906 Y134.03
G1 X220.741 Y135.195 E.04908
G1 X220.207 Y135.195
G1 X221.373 Y134.03 E.04908
G1 X220.839 Y134.03
G1 X219.674 Y135.195 E.04908
G1 X219.141 Y135.195
G1 X220.306 Y134.03 E.04908
G1 X219.773 Y134.03
G1 X218.608 Y135.195 E.04908
G1 X218.074 Y135.195
G1 X219.24 Y134.03 E.04908
M73 P75 R6
G1 X218.706 Y134.03
G1 X217.541 Y135.195 E.04908
G1 X217.008 Y135.195
G1 X218.173 Y134.03 E.04908
G1 X217.64 Y134.03
G1 X216.475 Y135.195 E.04908
G1 X216.437 Y134.7
G1 X217.107 Y134.03 E.02823
; WIPE_START
M204 S5000
G1 X216.437 Y134.7 E-.36014
G1 X216.475 Y135.195 E-.18869
G1 X216.868 Y134.802 E-.21117
; WIPE_END
G1 E-.04 F1800
G1 X216.01 Y134.613 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X139.853 Y134.613 E2.33897
; LINE_WIDTH: 0.448395
G1 X139.773 Y134.629 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y134.646 E.00278
G1 X139.659 Y134.807 E.00556
; LINE_WIDTH: 0.43172
G1 X139.659 Y186.418 E1.5851
; LINE_WIDTH: 0.448395
G1 X139.675 Y186.499 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00278
G1 X139.853 Y186.613 E.00556
; LINE_WIDTH: 0.43172
G1 X216.01 Y186.613 E2.33897
; OBJECT_ID: 470
; WIPE_START
G1 X214.01 Y186.613 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X210.695 Y179.738 Z2.4 F15000
G1 X141.411 Y36.053 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X141.019 Y36.053 E.01261
G1 X141.019 Y87.257 E1.64654
G1 X217.176 Y87.257 E2.44894
G1 X217.176 Y88.053 E.02559
G1 X140.223 Y88.053 E2.47453
G1 X140.223 Y35.257 E1.69772
G1 X217.176 Y35.257 E2.47453
G1 X217.176 Y36.053 E.02559
G1 X141.471 Y36.053 E2.4344
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X221.831 Y36.445 E2.39544
G1 X221.831 Y86.865 E1.50184
G1 X141.411 Y86.865 E2.39544
G1 X141.411 Y36.505 E1.50005
; WIPE_START
M204 S5000
G1 X143.411 Y36.503 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.813 Y40.659 Z2.4 F15000
G1 X223.411 Y88.445 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X139.831 Y88.445 E2.48956
G1 X139.831 Y34.865 E1.59597
G1 X223.411 Y34.865 E2.48956
G1 X223.411 Y88.385 E1.59418
M204 S5000
G1 X222.496 Y88.237 F15000
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X223.204 Y87.529 E.02983
G1 X223.204 Y86.996
G1 X221.962 Y88.237 E.0523
G1 X221.429 Y88.237
G1 X223.204 Y86.463 E.07476
G1 X223.204 Y85.929
G1 X220.896 Y88.237 E.09722
G1 X220.363 Y88.237
G1 X221.528 Y87.072 E.04908
G1 X220.995 Y87.072
G1 X219.829 Y88.237 E.04908
G1 X219.296 Y88.237
G1 X220.461 Y87.072 E.04908
G1 X219.928 Y87.072
G1 X218.763 Y88.237 E.04908
G1 X218.23 Y88.237
G1 X219.395 Y87.072 E.04908
G1 X218.862 Y87.072
G1 X217.696 Y88.237 E.04908
G1 X217.399 Y88.001
G1 X218.328 Y87.072 E.03915
G1 X217.795 Y87.072
G1 X217.399 Y87.468 E.01669
; WIPE_START
M204 S5000
G1 X217.795 Y87.072 E-.21286
G1 X218.328 Y87.072 E-.20264
G1 X217.687 Y87.713 E-.3445
; WIPE_END
G1 E-.04 F1800
G1 X222.039 Y86.561 Z2.4 F15000
M73 P76 R6
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X223.204 Y85.396 E.04908
G1 X223.204 Y84.863
G1 X222.039 Y86.028 E.04908
G1 X222.039 Y85.495
G1 X223.204 Y84.33 E.04908
G1 X223.204 Y83.796
G1 X222.039 Y84.962 E.04908
G1 X222.039 Y84.428
G1 X223.204 Y83.263 E.04908
G1 X223.204 Y82.73
G1 X222.039 Y83.895 E.04908
G1 X222.039 Y83.362
G1 X223.204 Y82.197 E.04908
G1 X223.204 Y81.663
G1 X222.039 Y82.828 E.04908
G1 X222.039 Y82.295
G1 X223.204 Y81.13 E.04908
G1 X223.204 Y80.597
G1 X222.039 Y81.762 E.04908
G1 X222.039 Y81.229
G1 X223.204 Y80.063 E.04908
G1 X223.204 Y79.53
G1 X222.039 Y80.695 E.04908
G1 X222.039 Y80.162
G1 X223.204 Y78.997 E.04908
G1 X223.204 Y78.464
G1 X222.039 Y79.629 E.04908
G1 X222.039 Y79.096
G1 X223.204 Y77.93 E.04908
G1 X223.204 Y77.397
G1 X222.039 Y78.562 E.04908
G1 X222.039 Y78.029
G1 X223.204 Y76.864 E.04908
G1 X223.204 Y76.331
G1 X222.039 Y77.496 E.04908
G1 X222.039 Y76.963
G1 X223.204 Y75.797 E.04908
G1 X223.204 Y75.264
G1 X222.039 Y76.429 E.04908
G1 X222.039 Y75.896
G1 X223.204 Y74.731 E.04908
G1 X223.204 Y74.198
G1 X222.039 Y75.363 E.04908
G1 X222.039 Y74.83
G1 X223.204 Y73.664 E.04908
G1 X223.204 Y73.131
G1 X222.039 Y74.296 E.04908
G1 X222.039 Y73.763
G1 X223.204 Y72.598 E.04908
G1 X223.204 Y72.065
G1 X222.039 Y73.23 E.04908
G1 X222.039 Y72.697
G1 X223.204 Y71.531 E.04908
G1 X223.204 Y70.998
G1 X222.039 Y72.163 E.04908
G1 X222.039 Y71.63
G1 X223.204 Y70.465 E.04908
G1 X223.204 Y69.932
G1 X222.039 Y71.097 E.04908
G1 X222.039 Y70.564
G1 X223.204 Y69.398 E.04908
G1 X223.204 Y68.865
G1 X222.039 Y70.03 E.04908
G1 X222.039 Y69.497
G1 X223.204 Y68.332 E.04908
G1 X223.204 Y67.799
G1 X222.039 Y68.964 E.04908
G1 X222.039 Y68.431
G1 X223.204 Y67.265 E.04908
G1 X223.204 Y66.732
G1 X222.039 Y67.897 E.04908
G1 X222.039 Y67.364
G1 X223.204 Y66.199 E.04908
G1 X223.204 Y65.666
G1 X222.039 Y66.831 E.04908
G1 X222.039 Y66.297
G1 X223.204 Y65.132 E.04908
G1 X223.204 Y64.599
G1 X222.039 Y65.764 E.04908
G1 X222.039 Y65.231
G1 X223.204 Y64.066 E.04908
G1 X223.204 Y63.532
G1 X222.039 Y64.698 E.04908
G1 X222.039 Y64.164
G1 X223.204 Y62.999 E.04908
G1 X223.204 Y62.466
G1 X222.039 Y63.631 E.04908
G1 X222.039 Y63.098
G1 X223.204 Y61.933 E.04908
G1 X223.204 Y61.399
G1 X222.039 Y62.565 E.04908
G1 X222.039 Y62.031
G1 X223.204 Y60.866 E.04908
G1 X223.204 Y60.333
G1 X222.039 Y61.498 E.04908
G1 X222.039 Y60.965
G1 X223.204 Y59.8 E.04908
G1 X223.204 Y59.266
G1 X222.039 Y60.432 E.04908
G1 X222.039 Y59.898
G1 X223.204 Y58.733 E.04908
G1 X223.204 Y58.2
G1 X222.039 Y59.365 E.04908
G1 X222.039 Y58.832
G1 X223.204 Y57.667 E.04908
G1 X223.204 Y57.133
G1 X222.039 Y58.299 E.04908
G1 X222.039 Y57.765
G1 X223.204 Y56.6 E.04908
G1 X223.204 Y56.067
G1 X222.039 Y57.232 E.04908
G1 X222.039 Y56.699
G1 X223.204 Y55.534 E.04908
G1 X223.204 Y55
G1 X222.039 Y56.166 E.04908
G1 X222.039 Y55.632
G1 X223.204 Y54.467 E.04908
G1 X223.204 Y53.934
G1 X222.039 Y55.099 E.04908
G1 X222.039 Y54.566
G1 X223.204 Y53.401 E.04908
G1 X223.204 Y52.867
G1 X222.039 Y54.033 E.04908
G1 X222.039 Y53.499
G1 X223.204 Y52.334 E.04908
G1 X223.204 Y51.801
G1 X222.039 Y52.966 E.04908
G1 X222.039 Y52.433
G1 X223.204 Y51.268 E.04908
G1 X223.204 Y50.734
G1 X222.039 Y51.9 E.04908
G1 X222.039 Y51.366
G1 X223.204 Y50.201 E.04908
G1 X223.204 Y49.668
G1 X222.039 Y50.833 E.04908
G1 X222.039 Y50.3
G1 X223.204 Y49.135 E.04908
G1 X223.204 Y48.601
G1 X222.039 Y49.767 E.04908
G1 X222.039 Y49.233
G1 X223.204 Y48.068 E.04908
G1 X223.204 Y47.535
G1 X222.039 Y48.7 E.04908
G1 X222.039 Y48.167
G1 X223.204 Y47.002 E.04908
G1 X223.204 Y46.468
G1 X222.039 Y47.633 E.04908
G1 X222.039 Y47.1
G1 X223.204 Y45.935 E.04908
G1 X223.204 Y45.402
G1 X222.039 Y46.567 E.04908
G1 X222.039 Y46.034
G1 X223.204 Y44.868 E.04908
G1 X223.204 Y44.335
G1 X222.039 Y45.5 E.04908
G1 X222.039 Y44.967
G1 X223.204 Y43.802 E.04908
G1 X223.204 Y43.269
G1 X222.039 Y44.434 E.04908
G1 X222.039 Y43.901
G1 X223.204 Y42.735 E.04908
G1 X223.204 Y42.202
G1 X222.039 Y43.367 E.04908
G1 X222.039 Y42.834
G1 X223.204 Y41.669 E.04908
G1 X223.204 Y41.136
G1 X222.039 Y42.301 E.04908
G1 X222.039 Y41.768
G1 X223.204 Y40.602 E.04908
G1 X223.204 Y40.069
G1 X222.039 Y41.234 E.04908
G1 X222.039 Y40.701
G1 X223.204 Y39.536 E.04908
G1 X223.204 Y39.003
G1 X222.039 Y40.168 E.04908
G1 X222.039 Y39.635
G1 X223.204 Y38.469 E.04908
G1 X223.204 Y37.936
G1 X222.039 Y39.101 E.04908
G1 X222.039 Y38.568
G1 X223.204 Y37.403 E.04908
G1 X223.204 Y36.87
G1 X222.039 Y38.035 E.04908
G1 X222.039 Y37.502
G1 X223.204 Y36.336 E.04908
G1 X223.204 Y35.803
G1 X222.039 Y36.968 E.04908
G1 X222.039 Y36.435
G1 X223.204 Y35.27 E.04908
G1 X222.868 Y35.072
G1 X221.703 Y36.237 E.04908
G1 X221.17 Y36.237
G1 X222.335 Y35.072 E.04908
G1 X221.802 Y35.072
G1 X220.637 Y36.237 E.04908
G1 X220.103 Y36.237
G1 X221.269 Y35.072 E.04908
G1 X220.735 Y35.072
G1 X219.57 Y36.237 E.04908
G1 X219.037 Y36.237
G1 X220.202 Y35.072 E.04908
G1 X219.669 Y35.072
G1 X218.504 Y36.237 E.04908
G1 X217.97 Y36.237
G1 X219.136 Y35.072 E.04908
G1 X218.602 Y35.072
G1 X217.437 Y36.237 E.04908
G1 X217.399 Y35.742
G1 X218.069 Y35.072 E.02823
; WIPE_START
M204 S5000
G1 X217.399 Y35.742 E-.36014
G1 X217.437 Y36.237 E-.18869
G1 X217.83 Y35.844 E-.21117
; WIPE_END
G1 E-.04 F1800
G1 X216.973 Y35.655 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X140.816 Y35.655 E2.33897
; LINE_WIDTH: 0.448395
G1 X140.735 Y35.671 E.00263
; LINE_WIDTH: 0.470635
G1 X140.655 Y35.688 E.00278
G1 X140.621 Y35.849 E.00556
; LINE_WIDTH: 0.43172
G1 X140.621 Y87.46 E1.5851
; LINE_WIDTH: 0.448395
G1 X140.638 Y87.541 E.00263
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00278
G1 X140.816 Y87.655 E.00556
; LINE_WIDTH: 0.43172
G1 X216.973 Y87.655 E2.33897
; OBJECT_ID: 481
; WIPE_START
G1 X214.973 Y87.655 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X207.501 Y86.097 Z2.4 F15000
G1 X43.762 Y51.969 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.37 Y51.969 E.01261
G1 X43.37 Y103.173 E1.64654
M73 P77 R6
G1 X119.527 Y103.173 E2.44894
G1 X119.527 Y103.969 E.02559
G1 X42.574 Y103.969 E2.47453
G1 X42.574 Y51.173 E1.69772
G1 X119.527 Y51.173 E2.47453
G1 X119.527 Y51.969 E.02559
G1 X43.822 Y51.969 E2.4344
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X124.182 Y52.361 E2.39544
G1 X124.182 Y102.781 E1.50184
G1 X43.762 Y102.781 E2.39544
G1 X43.762 Y52.421 E1.50005
; WIPE_START
M204 S5000
G1 X45.762 Y52.42 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.164 Y56.576 Z2.4 F15000
G1 X125.762 Y104.361 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S2500
G1 X42.182 Y104.361 E2.48956
G1 X42.182 Y50.781 E1.59597
G1 X125.762 Y50.781 E2.48956
G1 X125.762 Y104.301 E1.59418
M204 S5000
G1 X124.846 Y104.154 F15000
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X125.555 Y103.445 E.02983
G1 X125.555 Y102.912
G1 X124.313 Y104.154 E.0523
G1 X123.78 Y104.154
G1 X125.555 Y102.379 E.07476
G1 X125.555 Y101.846
G1 X123.247 Y104.154 E.09722
G1 X122.713 Y104.154
G1 X123.879 Y102.988 E.04908
G1 X123.345 Y102.988
G1 X122.18 Y104.154 E.04908
G1 X121.647 Y104.154
G1 X122.812 Y102.988 E.04908
G1 X122.279 Y102.988
G1 X121.114 Y104.154 E.04908
G1 X120.58 Y104.154
G1 X121.746 Y102.988 E.04908
G1 X121.212 Y102.988
G1 X120.047 Y104.154 E.04908
G1 X119.75 Y103.918
G1 X120.679 Y102.988 E.03915
G1 X120.146 Y102.988
G1 X119.75 Y103.385 E.01669
; WIPE_START
M204 S5000
G1 X120.146 Y102.988 E-.21286
G1 X120.679 Y102.988 E-.20264
G1 X120.038 Y103.63 E-.3445
; WIPE_END
G1 E-.04 F1800
G1 X124.389 Y102.478 Z2.4 F15000
G1 Z2
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X125.555 Y101.312 E.04908
G1 X125.555 Y100.779
G1 X124.389 Y101.944 E.04908
G1 X124.389 Y101.411
G1 X125.555 Y100.246 E.04908
G1 X125.555 Y99.713
G1 X124.389 Y100.878 E.04908
G1 X124.389 Y100.345
G1 X125.555 Y99.179 E.04908
G1 X125.555 Y98.646
G1 X124.389 Y99.811 E.04908
G1 X124.389 Y99.278
G1 X125.555 Y98.113 E.04908
G1 X125.555 Y97.58
G1 X124.389 Y98.745 E.04908
G1 X124.389 Y98.212
G1 X125.555 Y97.046 E.04908
G1 X125.555 Y96.513
G1 X124.389 Y97.678 E.04908
G1 X124.389 Y97.145
G1 X125.555 Y95.98 E.04908
G1 X125.555 Y95.447
G1 X124.389 Y96.612 E.04908
G1 X124.389 Y96.079
G1 X125.555 Y94.913 E.04908
G1 X125.555 Y94.38
G1 X124.389 Y95.545 E.04908
G1 X124.389 Y95.012
G1 X125.555 Y93.847 E.04908
G1 X125.555 Y93.314
G1 X124.389 Y94.479 E.04908
G1 X124.389 Y93.946
G1 X125.555 Y92.78 E.04908
G1 X125.555 Y92.247
G1 X124.389 Y93.412 E.04908
G1 X124.389 Y92.879
G1 X125.555 Y91.714 E.04908
G1 X125.555 Y91.181
G1 X124.389 Y92.346 E.04908
G1 X124.389 Y91.813
G1 X125.555 Y90.647 E.04908
G1 X125.555 Y90.114
G1 X124.389 Y91.279 E.04908
G1 X124.389 Y90.746
G1 X125.555 Y89.581 E.04908
G1 X125.555 Y89.048
G1 X124.389 Y90.213 E.04908
G1 X124.389 Y89.68
G1 X125.555 Y88.514 E.04908
G1 X125.555 Y87.981
G1 X124.389 Y89.146 E.04908
G1 X124.389 Y88.613
G1 X125.555 Y87.448 E.04908
G1 X125.555 Y86.915
G1 X124.389 Y88.08 E.04908
G1 X124.389 Y87.546
G1 X125.555 Y86.381 E.04908
G1 X125.555 Y85.848
G1 X124.389 Y87.013 E.04908
G1 X124.389 Y86.48
G1 X125.555 Y85.315 E.04908
G1 X125.555 Y84.781
G1 X124.389 Y85.947 E.04908
G1 X124.389 Y85.413
G1 X125.555 Y84.248 E.04908
G1 X125.555 Y83.715
G1 X124.389 Y84.88 E.04908
G1 X124.389 Y84.347
G1 X125.555 Y83.182 E.04908
G1 X125.555 Y82.648
G1 X124.389 Y83.814 E.04908
G1 X124.389 Y83.28
G1 X125.555 Y82.115 E.04908
G1 X125.555 Y81.582
G1 X124.389 Y82.747 E.04908
G1 X124.389 Y82.214
G1 X125.555 Y81.049 E.04908
G1 X125.555 Y80.515
G1 X124.389 Y81.681 E.04908
G1 X124.389 Y81.147
G1 X125.555 Y79.982 E.04908
G1 X125.555 Y79.449
G1 X124.389 Y80.614 E.04908
G1 X124.389 Y80.081
G1 X125.555 Y78.916 E.04908
G1 X125.555 Y78.382
G1 X124.389 Y79.548 E.04908
G1 X124.389 Y79.014
G1 X125.555 Y77.849 E.04908
G1 X125.555 Y77.316
G1 X124.389 Y78.481 E.04908
G1 X124.389 Y77.948
G1 X125.555 Y76.783 E.04908
G1 X125.555 Y76.249
G1 X124.389 Y77.415 E.04908
G1 X124.389 Y76.881
G1 X125.555 Y75.716 E.04908
G1 X125.555 Y75.183
G1 X124.389 Y76.348 E.04908
G1 X124.389 Y75.815
G1 X125.555 Y74.65 E.04908
G1 X125.555 Y74.116
G1 X124.389 Y75.282 E.04908
G1 X124.389 Y74.748
G1 X125.555 Y73.583 E.04908
G1 X125.555 Y73.05
G1 X124.389 Y74.215 E.04908
G1 X124.389 Y73.682
G1 X125.555 Y72.517 E.04908
G1 X125.555 Y71.983
G1 X124.389 Y73.149 E.04908
G1 X124.389 Y72.615
G1 X125.555 Y71.45 E.04908
G1 X125.555 Y70.917
M73 P78 R6
G1 X124.389 Y72.082 E.04908
G1 X124.389 Y71.549
G1 X125.555 Y70.384 E.04908
G1 X125.555 Y69.85
G1 X124.389 Y71.016 E.04908
G1 X124.389 Y70.482
G1 X125.555 Y69.317 E.04908
G1 X125.555 Y68.784
G1 X124.389 Y69.949 E.04908
G1 X124.389 Y69.416
G1 X125.555 Y68.251 E.04908
G1 X125.555 Y67.717
G1 X124.389 Y68.882 E.04908
G1 X124.389 Y68.349
G1 X125.555 Y67.184 E.04908
G1 X125.555 Y66.651
G1 X124.389 Y67.816 E.04908
G1 X124.389 Y67.283
G1 X125.555 Y66.117 E.04908
G1 X125.555 Y65.584
G1 X124.389 Y66.749 E.04908
G1 X124.389 Y66.216
G1 X125.555 Y65.051 E.04908
G1 X125.555 Y64.518
G1 X124.389 Y65.683 E.04908
G1 X124.389 Y65.15
G1 X125.555 Y63.984 E.04908
G1 X125.555 Y63.451
G1 X124.389 Y64.616 E.04908
G1 X124.389 Y64.083
G1 X125.555 Y62.918 E.04908
G1 X125.555 Y62.385
G1 X124.389 Y63.55 E.04908
G1 X124.389 Y63.017
G1 X125.555 Y61.851 E.04908
G1 X125.555 Y61.318
G1 X124.389 Y62.483 E.04908
G1 X124.389 Y61.95
G1 X125.555 Y60.785 E.04908
G1 X125.555 Y60.252
G1 X124.389 Y61.417 E.04908
G1 X124.389 Y60.884
G1 X125.555 Y59.718 E.04908
G1 X125.555 Y59.185
G1 X124.389 Y60.35 E.04908
G1 X124.389 Y59.817
G1 X125.555 Y58.652 E.04908
G1 X125.555 Y58.119
G1 X124.389 Y59.284 E.04908
G1 X124.389 Y58.751
G1 X125.555 Y57.585 E.04908
G1 X125.555 Y57.052
G1 X124.389 Y58.217 E.04908
G1 X124.389 Y57.684
G1 X125.555 Y56.519 E.04908
G1 X125.555 Y55.986
G1 X124.389 Y57.151 E.04908
G1 X124.389 Y56.618
G1 X125.555 Y55.452 E.04908
G1 X125.555 Y54.919
G1 X124.389 Y56.084 E.04908
G1 X124.389 Y55.551
G1 X125.555 Y54.386 E.04908
G1 X125.555 Y53.853
G1 X124.389 Y55.018 E.04908
G1 X124.389 Y54.485
G1 X125.555 Y53.319 E.04908
G1 X125.555 Y52.786
G1 X124.389 Y53.951 E.04908
G1 X124.389 Y53.418
G1 X125.555 Y52.253 E.04908
G1 X125.555 Y51.72
G1 X124.389 Y52.885 E.04908
G1 X124.389 Y52.352
G1 X125.555 Y51.186 E.04908
G1 X125.219 Y50.988
G1 X124.054 Y52.154 E.04908
G1 X123.521 Y52.154
G1 X124.686 Y50.988 E.04908
G1 X124.153 Y50.988
G1 X122.987 Y52.154 E.04908
G1 X122.454 Y52.154
G1 X123.619 Y50.988 E.04908
G1 X123.086 Y50.988
G1 X121.921 Y52.154 E.04908
G1 X121.388 Y52.154
G1 X122.553 Y50.988 E.04908
G1 X122.02 Y50.988
G1 X120.854 Y52.154 E.04908
G1 X120.321 Y52.154
G1 X121.486 Y50.988 E.04908
G1 X120.953 Y50.988
G1 X119.788 Y52.154 E.04908
G1 X119.75 Y51.659
G1 X120.42 Y50.988 E.02823
; WIPE_START
M204 S5000
G1 X119.75 Y51.659 E-.36014
G1 X119.788 Y52.154 E-.18869
G1 X120.181 Y51.761 E-.21117
; WIPE_END
G1 E-.04 F1800
G1 X119.324 Y51.571 Z2.4 F15000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X43.166 Y51.571 E2.33897
; LINE_WIDTH: 0.448395
G1 X43.086 Y51.588 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y51.604 E.00278
G1 X42.972 Y51.765 E.00556
; LINE_WIDTH: 0.43172
G1 X42.972 Y103.377 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.989 Y103.457 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00278
G1 X43.166 Y103.571 E.00556
; LINE_WIDTH: 0.43172
G1 X119.324 Y103.571 E2.33897
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X117.324 Y103.571 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 11/17
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z2.4 I1.217 J0 P1  F15000
; object ids of layer 11 start: 470,481,503,525
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
; object ids of this layer11 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.251 Y164.223
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.251 Y215.428 E1.64654
G1 X108.175 Y215.428 E2.08772
G1 X108.175 Y216.224 E.02559
G1 X42.456 Y216.224 E2.11331
G1 X42.456 Y163.428 E1.69772
G1 X108.175 Y163.428 E2.11331
G1 X108.175 Y164.223 E.02559
G1 X43.311 Y164.223 E2.08579
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.644 Y215.036 E1.50184
G1 X120.277 Y215.036 E2.28263
G1 X120.277 Y216.616 E.04706
G1 X42.064 Y216.616 E2.3297
G1 X42.064 Y163.036 E1.59597
G1 X120.277 Y163.036 E2.3297
G1 X120.277 Y164.616 E.04706
G1 X43.704 Y164.616 E2.28085
; WIPE_START
M204 S5000
G1 X43.701 Y166.616 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.048 Y163.826 Z2.6 F15000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X107.972 Y163.826 E1.99397
; WIPE_START
G1 X105.972 Y163.826 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.604 Y163.875 Z2.6 F15000
G1 X120.069 Y163.917 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X119.395 Y163.243 E.02838
G1 X118.862 Y163.243
G1 X120.027 Y164.408 E.04908
G1 X119.494 Y164.408
G1 X118.329 Y163.243 E.04908
G1 X117.796 Y163.243
G1 X118.961 Y164.408 E.04908
G1 X118.428 Y164.408
G1 X117.262 Y163.243 E.04908
G1 X116.729 Y163.243
G1 X117.894 Y164.408 E.04908
G1 X117.361 Y164.408
G1 X116.196 Y163.243 E.04908
G1 X115.663 Y163.243
G1 X116.828 Y164.408 E.04908
G1 X116.295 Y164.408
G1 X115.129 Y163.243 E.04908
G1 X114.596 Y163.243
G1 X115.761 Y164.408 E.04908
G1 X115.228 Y164.408
G1 X114.063 Y163.243 E.04908
G1 X113.53 Y163.243
G1 X114.695 Y164.408 E.04908
G1 X114.162 Y164.408
G1 X112.996 Y163.243 E.04908
G1 X112.463 Y163.243
G1 X113.628 Y164.408 E.04908
G1 X113.095 Y164.408
G1 X111.93 Y163.243 E.04908
G1 X111.397 Y163.243
G1 X112.562 Y164.408 E.04908
G1 X112.028 Y164.408
G1 X110.863 Y163.243 E.04908
G1 X110.33 Y163.243
G1 X111.495 Y164.408 E.04908
G1 X110.962 Y164.408
G1 X109.797 Y163.243 E.04908
G1 X109.263 Y163.243
G1 X110.429 Y164.408 E.04908
G1 X109.895 Y164.408
G1 X108.73 Y163.243 E.04908
G1 X108.398 Y163.444
G1 X109.362 Y164.408 E.04062
G1 X108.829 Y164.408
G1 X108.398 Y163.977 E.01815
; WIPE_START
M204 S5000
G1 X108.829 Y164.408 E-.23161
G1 X109.362 Y164.408 E-.20264
G1 X108.756 Y163.802 E-.32575
; WIPE_END
G1 E-.04 F1800
M73 P79 R6
G1 X108.641 Y171.434 Z2.6 F15000
G1 X107.972 Y215.826 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X43.048 Y215.826 E1.99397
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00556
G1 X42.87 Y215.712 E.00278
; LINE_WIDTH: 0.448395
G1 X42.854 Y215.631 E.00263
; LINE_WIDTH: 0.43172
G1 X42.854 Y164.02 E1.5851
; LINE_WIDTH: 0.470635
G1 X42.887 Y163.859 E.00556
G1 X42.967 Y163.842 E.00278
; LINE_WIDTH: 0.448395
G1 X43.048 Y163.826 E.00263
; WIPE_START
G1 X42.967 Y163.842 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X49.303 Y168.099 Z2.6 F15000
G1 X120.069 Y215.643 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X119.669 Y215.243 E.01684
G1 X119.136 Y215.243
G1 X120.069 Y216.176 E.0393
G1 X119.768 Y216.408
G1 X118.603 Y215.243 E.04908
G1 X118.07 Y215.243
G1 X119.235 Y216.408 E.04908
G1 X118.702 Y216.408
G1 X117.536 Y215.243 E.04908
G1 X117.003 Y215.243
M73 P79 R5
G1 X118.168 Y216.408 E.04908
G1 X117.635 Y216.408
G1 X116.47 Y215.243 E.04908
G1 X115.937 Y215.243
G1 X117.102 Y216.408 E.04908
G1 X116.569 Y216.408
G1 X115.403 Y215.243 E.04908
G1 X114.87 Y215.243
G1 X116.035 Y216.408 E.04908
G1 X115.502 Y216.408
G1 X114.337 Y215.243 E.04908
G1 X113.804 Y215.243
G1 X114.969 Y216.408 E.04908
G1 X114.436 Y216.408
G1 X113.27 Y215.243 E.04908
G1 X112.737 Y215.243
G1 X113.902 Y216.408 E.04908
G1 X113.369 Y216.408
G1 X112.204 Y215.243 E.04908
G1 X111.671 Y215.243
G1 X112.836 Y216.408 E.04908
G1 X112.303 Y216.408
G1 X111.137 Y215.243 E.04908
G1 X110.604 Y215.243
G1 X111.769 Y216.408 E.04908
G1 X111.236 Y216.408
G1 X110.071 Y215.243 E.04908
G1 X109.538 Y215.243
G1 X110.703 Y216.408 E.04908
G1 X110.169 Y216.408
G1 X109.004 Y215.243 E.04908
G1 X108.471 Y215.243
G1 X109.636 Y216.408 E.04908
G1 X109.103 Y216.408
G1 X108.398 Y215.703 E.0297
; OBJECT_ID: 503
; WIPE_START
M204 S5000
G1 X109.103 Y216.408 E-.37887
G1 X109.636 Y216.408 E-.20264
G1 X109.304 Y216.076 E-.17849
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X112.011 Y208.94 Z2.6 F15000
G1 X140.057 Y135.01 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.057 Y186.215 E1.64654
G1 X204.981 Y186.215 E2.08772
G1 X204.981 Y187.01 E.02559
G1 X139.261 Y187.01 E2.11331
G1 X139.261 Y134.215 E1.69772
G1 X204.981 Y134.215 E2.11331
G1 X204.981 Y135.01 E.02559
G1 X140.117 Y135.01 E2.08579
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X140.449 Y185.823 E1.50184
G1 X217.082 Y185.823 E2.28263
G1 X217.082 Y187.403 E.04706
G1 X138.869 Y187.403 E2.3297
G1 X138.869 Y133.823 E1.59597
G1 X217.082 Y133.823 E2.3297
G1 X217.082 Y135.403 E.04706
G1 X140.509 Y135.403 E2.28085
; WIPE_START
M204 S5000
G1 X140.506 Y137.403 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.853 Y134.613 Z2.6 F15000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X139.773 Y134.629 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y134.646 E.00278
G1 X139.659 Y134.807 E.00556
; LINE_WIDTH: 0.43172
G1 X139.659 Y186.418 E1.5851
; LINE_WIDTH: 0.448395
G1 X139.675 Y186.499 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00278
G1 X139.853 Y186.613 E.00556
; LINE_WIDTH: 0.43172
G1 X204.777 Y186.613 E1.99397
; WIPE_START
G1 X202.777 Y186.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X210.409 Y186.514 Z2.6 F15000
G1 X216.874 Y186.43 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X216.475 Y186.03 E.01684
G1 X215.941 Y186.03
G1 X216.874 Y186.963 E.0393
G1 X216.573 Y187.195
G1 X215.408 Y186.03 E.04908
G1 X214.875 Y186.03
G1 X216.04 Y187.195 E.04908
G1 X215.507 Y187.195
G1 X214.342 Y186.03 E.04908
G1 X213.808 Y186.03
G1 X214.974 Y187.195 E.04908
G1 X214.44 Y187.195
G1 X213.275 Y186.03 E.04908
G1 X212.742 Y186.03
G1 X213.907 Y187.195 E.04908
G1 X213.374 Y187.195
G1 X212.209 Y186.03 E.04908
G1 X211.675 Y186.03
G1 X212.841 Y187.195 E.04908
G1 X212.307 Y187.195
G1 X211.142 Y186.03 E.04908
G1 X210.609 Y186.03
G1 X211.774 Y187.195 E.04908
G1 X211.241 Y187.195
G1 X210.076 Y186.03 E.04908
G1 X209.542 Y186.03
G1 X210.708 Y187.195 E.04908
G1 X210.174 Y187.195
G1 X209.009 Y186.03 E.04908
G1 X208.476 Y186.03
G1 X209.641 Y187.195 E.04908
G1 X209.108 Y187.195
G1 X207.943 Y186.03 E.04908
G1 X207.409 Y186.03
G1 X208.575 Y187.195 E.04908
G1 X208.041 Y187.195
G1 X206.876 Y186.03 E.04908
G1 X206.343 Y186.03
G1 X207.508 Y187.195 E.04908
G1 X206.975 Y187.195
G1 X205.81 Y186.03 E.04908
G1 X205.276 Y186.03
G1 X206.441 Y187.195 E.04908
G1 X205.908 Y187.195
G1 X205.203 Y186.49 E.0297
; WIPE_START
M204 S5000
G1 X205.908 Y187.195 E-.37887
G1 X206.441 Y187.195 E-.20264
G1 X206.109 Y186.863 E-.17849
; WIPE_END
G1 E-.04 F1800
G1 X205.915 Y179.233 Z2.6 F15000
G1 X204.777 Y134.613 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X139.853 Y134.613 E1.99397
; WIPE_START
G1 X141.853 Y134.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.486 Y134.622 Z2.6 F15000
G1 X216.874 Y134.704 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X216.201 Y134.03 E.02838
G1 X215.667 Y134.03
G1 X216.833 Y135.195 E.04908
G1 X216.299 Y135.195
G1 X215.134 Y134.03 E.04908
G1 X214.601 Y134.03
G1 X215.766 Y135.195 E.04908
G1 X215.233 Y135.195
G1 X214.068 Y134.03 E.04908
G1 X213.534 Y134.03
G1 X214.7 Y135.195 E.04908
G1 X214.166 Y135.195
G1 X213.001 Y134.03 E.04908
G1 X212.468 Y134.03
G1 X213.633 Y135.195 E.04908
G1 X213.1 Y135.195
G1 X211.935 Y134.03 E.04908
G1 X211.401 Y134.03
G1 X212.567 Y135.195 E.04908
G1 X212.033 Y135.195
G1 X210.868 Y134.03 E.04908
G1 X210.335 Y134.03
G1 X211.5 Y135.195 E.04908
G1 X210.967 Y135.195
G1 X209.802 Y134.03 E.04908
G1 X209.268 Y134.03
G1 X210.434 Y135.195 E.04908
G1 X209.9 Y135.195
G1 X208.735 Y134.03 E.04908
G1 X208.202 Y134.03
G1 X209.367 Y135.195 E.04908
G1 X208.834 Y135.195
G1 X207.669 Y134.03 E.04908
G1 X207.135 Y134.03
G1 X208.3 Y135.195 E.04908
G1 X207.767 Y135.195
G1 X206.602 Y134.03 E.04908
G1 X206.069 Y134.03
G1 X207.234 Y135.195 E.04908
M73 P80 R5
G1 X206.701 Y135.195
G1 X205.535 Y134.03 E.04908
G1 X205.203 Y134.231
G1 X206.167 Y135.195 E.04062
G1 X205.634 Y135.195
G1 X205.203 Y134.764 E.01815
; OBJECT_ID: 470
; WIPE_START
M204 S5000
G1 X205.634 Y135.195 E-.23161
G1 X206.167 Y135.195 E-.20264
G1 X205.561 Y134.589 E-.32576
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X201.379 Y128.204 Z2.6 F15000
G1 X141.019 Y36.053 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X141.019 Y87.257 E1.64654
G1 X205.943 Y87.257 E2.08772
G1 X205.943 Y88.053 E.02559
G1 X140.223 Y88.053 E2.11331
G1 X140.223 Y35.257 E1.69772
G1 X205.943 Y35.257 E2.11331
G1 X205.943 Y36.053 E.02559
G1 X141.079 Y36.053 E2.08579
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X141.411 Y86.865 E1.50184
G1 X218.044 Y86.865 E2.28263
G1 X218.044 Y88.445 E.04706
G1 X139.831 Y88.445 E2.3297
G1 X139.831 Y34.865 E1.59597
G1 X218.044 Y34.865 E2.3297
G1 X218.044 Y36.445 E.04706
G1 X141.471 Y36.445 E2.28085
; WIPE_START
M204 S5000
G1 X141.469 Y38.445 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.816 Y35.655 Z2.6 F15000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X205.74 Y35.655 E1.99397
; WIPE_START
G1 X203.74 Y35.655 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X211.372 Y35.704 Z2.6 F15000
G1 X217.837 Y35.746 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X217.163 Y35.072 E.02838
G1 X216.63 Y35.072
G1 X217.795 Y36.237 E.04908
G1 X217.262 Y36.237
G1 X216.097 Y35.072 E.04908
G1 X215.563 Y35.072
G1 X216.729 Y36.237 E.04908
G1 X216.195 Y36.237
G1 X215.03 Y35.072 E.04908
G1 X214.497 Y35.072
G1 X215.662 Y36.237 E.04908
G1 X215.129 Y36.237
G1 X213.964 Y35.072 E.04908
G1 X213.43 Y35.072
G1 X214.595 Y36.237 E.04908
G1 X214.062 Y36.237
G1 X212.897 Y35.072 E.04908
G1 X212.364 Y35.072
G1 X213.529 Y36.237 E.04908
G1 X212.996 Y36.237
G1 X211.83 Y35.072 E.04908
G1 X211.297 Y35.072
G1 X212.462 Y36.237 E.04908
G1 X211.929 Y36.237
G1 X210.764 Y35.072 E.04908
G1 X210.231 Y35.072
G1 X211.396 Y36.237 E.04908
G1 X210.863 Y36.237
G1 X209.697 Y35.072 E.04908
G1 X209.164 Y35.072
G1 X210.329 Y36.237 E.04908
G1 X209.796 Y36.237
G1 X208.631 Y35.072 E.04908
G1 X208.098 Y35.072
G1 X209.263 Y36.237 E.04908
G1 X208.73 Y36.237
G1 X207.564 Y35.072 E.04908
G1 X207.031 Y35.072
G1 X208.196 Y36.237 E.04908
G1 X207.663 Y36.237
G1 X206.498 Y35.072 E.04908
G1 X206.166 Y35.273
G1 X207.13 Y36.237 E.04062
G1 X206.597 Y36.237
G1 X206.166 Y35.806 E.01815
; WIPE_START
M204 S5000
G1 X206.597 Y36.237 E-.23161
G1 X207.13 Y36.237 E-.20264
G1 X206.524 Y35.631 E-.32575
; WIPE_END
G1 E-.04 F1800
G1 X206.409 Y43.263 Z2.6 F15000
G1 X205.74 Y87.655 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X140.816 Y87.655 E1.99397
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00556
G1 X140.638 Y87.541 E.00278
; LINE_WIDTH: 0.448395
G1 X140.621 Y87.46 E.00263
; LINE_WIDTH: 0.43172
G1 X140.621 Y35.849 E1.5851
; LINE_WIDTH: 0.470635
G1 X140.655 Y35.688 E.00556
G1 X140.735 Y35.671 E.00278
; LINE_WIDTH: 0.448395
G1 X140.816 Y35.655 E.00263
; WIPE_START
G1 X140.735 Y35.671 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.071 Y39.928 Z2.6 F15000
G1 X217.837 Y87.472 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X217.437 Y87.072 E.01684
G1 X216.904 Y87.072
G1 X217.837 Y88.005 E.0393
G1 X217.536 Y88.237
G1 X216.371 Y87.072 E.04908
G1 X215.837 Y87.072
G1 X217.003 Y88.237 E.04908
G1 X216.469 Y88.237
G1 X215.304 Y87.072 E.04908
G1 X214.771 Y87.072
G1 X215.936 Y88.237 E.04908
G1 X215.403 Y88.237
G1 X214.238 Y87.072 E.04908
G1 X213.704 Y87.072
G1 X214.87 Y88.237 E.04908
G1 X214.336 Y88.237
G1 X213.171 Y87.072 E.04908
G1 X212.638 Y87.072
G1 X213.803 Y88.237 E.04908
G1 X213.27 Y88.237
G1 X212.105 Y87.072 E.04908
G1 X211.571 Y87.072
G1 X212.736 Y88.237 E.04908
G1 X212.203 Y88.237
G1 X211.038 Y87.072 E.04908
G1 X210.505 Y87.072
G1 X211.67 Y88.237 E.04908
G1 X211.137 Y88.237
G1 X209.971 Y87.072 E.04908
G1 X209.438 Y87.072
G1 X210.603 Y88.237 E.04908
G1 X210.07 Y88.237
G1 X208.905 Y87.072 E.04908
G1 X208.372 Y87.072
G1 X209.537 Y88.237 E.04908
G1 X209.004 Y88.237
G1 X207.838 Y87.072 E.04908
G1 X207.305 Y87.072
G1 X208.47 Y88.237 E.04908
G1 X207.937 Y88.237
G1 X206.772 Y87.072 E.04908
G1 X206.239 Y87.072
G1 X207.404 Y88.237 E.04908
G1 X206.871 Y88.237
G1 X206.166 Y87.532 E.0297
; OBJECT_ID: 481
; WIPE_START
M204 S5000
G1 X206.871 Y88.237 E-.37887
G1 X207.404 Y88.237 E-.20264
G1 X207.072 Y87.905 E-.17849
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X199.617 Y86.269 Z2.6 F15000
G1 X43.37 Y51.969 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.37 Y103.173 E1.64654
G1 X108.294 Y103.173 E2.08772
G1 X108.294 Y103.969 E.02559
G1 X42.574 Y103.969 E2.11331
G1 X42.574 Y51.173 E1.69772
G1 X108.294 Y51.173 E2.11331
G1 X108.294 Y51.969 E.02559
G1 X43.43 Y51.969 E2.08579
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.762 Y102.781 E1.50184
G1 X120.395 Y102.781 E2.28263
G1 X120.395 Y104.361 E.04706
G1 X42.182 Y104.361 E2.3297
G1 X42.182 Y50.781 E1.59597
G1 X120.395 Y50.781 E2.3297
G1 X120.395 Y52.361 E.04706
G1 X43.822 Y52.361 E2.28085
; WIPE_START
M204 S5000
G1 X43.82 Y54.361 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.166 Y51.571 Z2.6 F15000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X43.086 Y51.588 E.00263
; LINE_WIDTH: 0.470635
M73 P81 R5
G1 X43.005 Y51.604 E.00278
G1 X42.972 Y51.765 E.00556
; LINE_WIDTH: 0.43172
G1 X42.972 Y103.377 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.989 Y103.457 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00278
G1 X43.166 Y103.571 E.00556
; LINE_WIDTH: 0.43172
G1 X108.09 Y103.571 E1.99397
; WIPE_START
G1 X106.09 Y103.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.722 Y103.472 Z2.6 F15000
G1 X120.188 Y103.388 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X119.788 Y102.988 E.01684
G1 X119.255 Y102.988
G1 X120.188 Y103.921 E.0393
G1 X119.887 Y104.154
G1 X118.721 Y102.988 E.04908
G1 X118.188 Y102.988
G1 X119.353 Y104.154 E.04908
G1 X118.82 Y104.154
G1 X117.655 Y102.988 E.04908
G1 X117.122 Y102.988
G1 X118.287 Y104.154 E.04908
G1 X117.754 Y104.154
G1 X116.588 Y102.988 E.04908
G1 X116.055 Y102.988
G1 X117.22 Y104.154 E.04908
G1 X116.687 Y104.154
G1 X115.522 Y102.988 E.04908
G1 X114.989 Y102.988
G1 X116.154 Y104.154 E.04908
G1 X115.62 Y104.154
G1 X114.455 Y102.988 E.04908
G1 X113.922 Y102.988
G1 X115.087 Y104.154 E.04908
G1 X114.554 Y104.154
G1 X113.389 Y102.988 E.04908
G1 X112.855 Y102.988
G1 X114.021 Y104.154 E.04908
G1 X113.487 Y104.154
G1 X112.322 Y102.988 E.04908
G1 X111.789 Y102.988
G1 X112.954 Y104.154 E.04908
G1 X112.421 Y104.154
G1 X111.256 Y102.988 E.04908
G1 X110.722 Y102.988
G1 X111.888 Y104.154 E.04908
G1 X111.354 Y104.154
G1 X110.189 Y102.988 E.04908
G1 X109.656 Y102.988
G1 X110.821 Y104.154 E.04908
G1 X110.288 Y104.154
G1 X109.123 Y102.988 E.04908
G1 X108.589 Y102.988
G1 X109.755 Y104.154 E.04908
G1 X109.221 Y104.154
G1 X108.516 Y103.449 E.0297
; WIPE_START
M204 S5000
G1 X109.221 Y104.154 E-.37887
G1 X109.755 Y104.154 E-.20264
G1 X109.423 Y103.822 E-.17849
; WIPE_END
G1 E-.04 F1800
G1 X109.228 Y96.192 Z2.6 F15000
G1 X108.09 Y51.571 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X43.166 Y51.571 E1.99397
; WIPE_START
G1 X45.166 Y51.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.799 Y51.58 Z2.6 F15000
G1 X120.188 Y51.662 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X119.514 Y50.988 E.02838
G1 X118.981 Y50.988
G1 X120.146 Y52.154 E.04908
G1 X119.613 Y52.154
G1 X118.447 Y50.988 E.04908
G1 X117.914 Y50.988
G1 X119.079 Y52.154 E.04908
G1 X118.546 Y52.154
G1 X117.381 Y50.988 E.04908
G1 X116.848 Y50.988
G1 X118.013 Y52.154 E.04908
G1 X117.479 Y52.154
G1 X116.314 Y50.988 E.04908
G1 X115.781 Y50.988
G1 X116.946 Y52.154 E.04908
G1 X116.413 Y52.154
G1 X115.248 Y50.988 E.04908
G1 X114.714 Y50.988
G1 X115.88 Y52.154 E.04908
G1 X115.346 Y52.154
G1 X114.181 Y50.988 E.04908
G1 X113.648 Y50.988
G1 X114.813 Y52.154 E.04908
G1 X114.28 Y52.154
G1 X113.115 Y50.988 E.04908
G1 X112.581 Y50.988
G1 X113.747 Y52.154 E.04908
G1 X113.213 Y52.154
G1 X112.048 Y50.988 E.04908
G1 X111.515 Y50.988
G1 X112.68 Y52.154 E.04908
G1 X112.147 Y52.154
G1 X110.982 Y50.988 E.04908
G1 X110.448 Y50.988
G1 X111.614 Y52.154 E.04908
G1 X111.08 Y52.154
G1 X109.915 Y50.988 E.04908
G1 X109.382 Y50.988
G1 X110.547 Y52.154 E.04908
G1 X110.014 Y52.154
G1 X108.849 Y50.988 E.04908
G1 X108.516 Y51.189
G1 X109.481 Y52.154 E.04062
G1 X108.947 Y52.154
G1 X108.516 Y51.723 E.01815
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X108.947 Y52.154 E-.23161
G1 X109.481 Y52.154 E-.20264
G1 X108.874 Y51.548 E-.32575
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 12/17
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z2.6 I1.217 J0 P1  F15000
; object ids of layer 12 start: 470,481,503,525
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
; object ids of this layer12 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.251 Y164.223
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.251 Y215.428 E1.64654
G1 X96.942 Y215.428 E1.7265
G1 X96.942 Y216.224 E.02559
G1 X42.456 Y216.224 E1.75209
G1 X42.456 Y163.428 E1.69772
G1 X96.942 Y163.428 E1.75209
G1 X96.942 Y164.223 E.02559
G1 X43.311 Y164.223 E1.72457
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.644 Y215.036 E1.50184
G1 X109.043 Y215.036 E1.94803
G1 X109.043 Y216.616 E.04706
G1 X42.064 Y216.616 E1.9951
G1 X42.064 Y163.036 E1.59597
G1 X109.043 Y163.036 E1.9951
G1 X109.043 Y164.616 E.04706
G1 X43.704 Y164.616 E1.94625
; WIPE_START
M204 S5000
G1 X43.701 Y166.616 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.048 Y163.826 Z2.8 F15000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X96.739 Y163.826 E1.64897
; WIPE_START
G1 X94.739 Y163.826 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.37 Y163.943 Z2.8 F15000
G1 X108.836 Y164.043 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X108.471 Y164.408 E.01537
G1 X107.938 Y164.408
G1 X108.836 Y163.51 E.03783
G1 X108.57 Y163.243
G1 X107.404 Y164.408 E.04908
G1 X106.871 Y164.408
G1 X108.036 Y163.243 E.04908
G1 X107.503 Y163.243
G1 X106.338 Y164.408 E.04908
G1 X105.805 Y164.408
G1 X106.97 Y163.243 E.04908
G1 X106.437 Y163.243
G1 X105.271 Y164.408 E.04908
G1 X104.738 Y164.408
G1 X105.903 Y163.243 E.04908
G1 X105.37 Y163.243
G1 X104.205 Y164.408 E.04908
G1 X103.672 Y164.408
G1 X104.837 Y163.243 E.04908
G1 X104.304 Y163.243
G1 X103.138 Y164.408 E.04908
G1 X102.605 Y164.408
M73 P82 R5
G1 X103.77 Y163.243 E.04908
G1 X103.237 Y163.243
G1 X102.072 Y164.408 E.04908
G1 X101.539 Y164.408
G1 X102.704 Y163.243 E.04908
G1 X102.171 Y163.243
G1 X101.005 Y164.408 E.04908
G1 X100.472 Y164.408
G1 X101.637 Y163.243 E.04908
G1 X101.104 Y163.243
G1 X99.939 Y164.408 E.04908
G1 X99.406 Y164.408
G1 X100.571 Y163.243 E.04908
G1 X100.038 Y163.243
G1 X98.872 Y164.408 E.04908
G1 X98.339 Y164.408
G1 X99.504 Y163.243 E.04908
G1 X98.971 Y163.243
G1 X97.806 Y164.408 E.04908
G1 X97.273 Y164.408
G1 X98.438 Y163.243 E.04908
G1 X97.905 Y163.243
G1 X97.165 Y163.983 E.03117
; WIPE_START
M204 S5000
G1 X97.905 Y163.243 E-.39762
G1 X98.438 Y163.243 E-.20264
G1 X98.141 Y163.54 E-.15975
; WIPE_END
G1 E-.04 F1800
G1 X97.936 Y171.17 Z2.8 F15000
G1 X96.739 Y215.826 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X43.048 Y215.826 E1.64897
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00556
G1 X42.87 Y215.712 E.00278
; LINE_WIDTH: 0.448395
G1 X42.854 Y215.631 E.00263
; LINE_WIDTH: 0.43172
G1 X42.854 Y164.02 E1.5851
; LINE_WIDTH: 0.470635
G1 X42.887 Y163.859 E.00556
G1 X42.967 Y163.842 E.00278
; LINE_WIDTH: 0.448395
G1 X43.048 Y163.826 E.00263
; WIPE_START
G1 X42.967 Y163.842 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X48.961 Y168.567 Z2.8 F15000
G1 X108.836 Y215.769 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X108.197 Y216.408 E.02691
G1 X107.664 Y216.408
G1 X108.829 Y215.243 E.04908
G1 X108.296 Y215.243
G1 X107.13 Y216.408 E.04908
G1 X106.597 Y216.408
G1 X107.762 Y215.243 E.04908
G1 X107.229 Y215.243
G1 X106.064 Y216.408 E.04908
G1 X105.531 Y216.408
G1 X106.696 Y215.243 E.04908
G1 X106.163 Y215.243
G1 X104.997 Y216.408 E.04908
G1 X104.464 Y216.408
G1 X105.629 Y215.243 E.04908
G1 X105.096 Y215.243
G1 X103.931 Y216.408 E.04908
G1 X103.398 Y216.408
G1 X104.563 Y215.243 E.04908
G1 X104.03 Y215.243
G1 X102.864 Y216.408 E.04908
G1 X102.331 Y216.408
G1 X103.496 Y215.243 E.04909
G1 X102.963 Y215.243
G1 X101.798 Y216.408 E.04908
G1 X101.265 Y216.408
G1 X102.43 Y215.243 E.04908
G1 X101.897 Y215.243
G1 X100.731 Y216.408 E.04908
G1 X100.198 Y216.408
G1 X101.363 Y215.243 E.04908
G1 X100.83 Y215.243
G1 X99.665 Y216.408 E.04908
G1 X99.132 Y216.408
G1 X100.297 Y215.243 E.04908
G1 X99.764 Y215.243
G1 X98.598 Y216.408 E.04908
G1 X98.065 Y216.408
G1 X99.23 Y215.243 E.04908
G1 X98.697 Y215.243
G1 X97.532 Y216.408 E.04908
G1 X97.165 Y216.242
G1 X98.164 Y215.243 E.04209
G1 X97.631 Y215.243
G1 X97.165 Y215.709 E.01962
; OBJECT_ID: 503
; WIPE_START
M204 S5000
G1 X97.631 Y215.243 E-.25035
G1 X98.164 Y215.243 E-.20264
M73 P82 R4
G1 X97.592 Y215.814 E-.30702
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X101.143 Y209.058 Z2.8 F15000
G1 X140.057 Y135.01 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.057 Y186.215 E1.64654
G1 X193.747 Y186.215 E1.7265
G1 X193.747 Y187.01 E.02559
G1 X139.261 Y187.01 E1.75209
G1 X139.261 Y134.215 E1.69772
G1 X193.747 Y134.215 E1.75209
G1 X193.747 Y135.01 E.02559
G1 X140.117 Y135.01 E1.72457
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X140.449 Y185.823 E1.50184
G1 X205.849 Y185.823 E1.94803
G1 X205.849 Y187.403 E.04706
G1 X138.869 Y187.403 E1.9951
G1 X138.869 Y133.823 E1.59597
G1 X205.849 Y133.823 E1.9951
G1 X205.849 Y135.403 E.04706
G1 X140.509 Y135.403 E1.94625
; WIPE_START
M204 S5000
G1 X140.506 Y137.403 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.853 Y134.613 Z2.8 F15000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X139.773 Y134.629 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y134.646 E.00278
G1 X139.659 Y134.807 E.00556
; LINE_WIDTH: 0.43172
G1 X139.659 Y186.418 E1.5851
; LINE_WIDTH: 0.448395
G1 X139.675 Y186.499 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00278
G1 X139.853 Y186.613 E.00556
; LINE_WIDTH: 0.43172
G1 X193.544 Y186.613 E1.64897
; WIPE_START
G1 X191.544 Y186.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X199.176 Y186.582 Z2.8 F15000
G1 X205.641 Y186.556 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X205.002 Y187.195 E.02691
G1 X204.469 Y187.195
G1 X205.634 Y186.03 E.04908
G1 X205.101 Y186.03
G1 X203.936 Y187.195 E.04908
G1 X203.402 Y187.195
G1 X204.568 Y186.03 E.04908
G1 X204.034 Y186.03
G1 X202.869 Y187.195 E.04908
G1 X202.336 Y187.195
G1 X203.501 Y186.03 E.04908
G1 X202.968 Y186.03
G1 X201.803 Y187.195 E.04908
G1 X201.269 Y187.195
G1 X202.435 Y186.03 E.04908
G1 X201.901 Y186.03
G1 X200.736 Y187.195 E.04908
G1 X200.203 Y187.195
G1 X201.368 Y186.03 E.04908
G1 X200.835 Y186.03
G1 X199.67 Y187.195 E.04908
G1 X199.136 Y187.195
G1 X200.302 Y186.03 E.04909
G1 X199.768 Y186.03
G1 X198.603 Y187.195 E.04908
G1 X198.07 Y187.195
M73 P83 R4
G1 X199.235 Y186.03 E.04908
G1 X198.702 Y186.03
G1 X197.537 Y187.195 E.04908
G1 X197.003 Y187.195
G1 X198.169 Y186.03 E.04908
G1 X197.635 Y186.03
G1 X196.47 Y187.195 E.04908
G1 X195.937 Y187.195
G1 X197.102 Y186.03 E.04908
G1 X196.569 Y186.03
G1 X195.404 Y187.195 E.04908
G1 X194.87 Y187.195
G1 X196.036 Y186.03 E.04908
G1 X195.502 Y186.03
G1 X194.337 Y187.195 E.04908
G1 X193.97 Y187.029
G1 X194.969 Y186.03 E.04209
G1 X194.436 Y186.03
G1 X193.97 Y186.496 E.01962
; WIPE_START
M204 S5000
G1 X194.436 Y186.03 E-.25035
G1 X194.969 Y186.03 E-.20264
G1 X194.398 Y186.601 E-.30702
; WIPE_END
G1 E-.04 F1800
G1 X194.272 Y178.97 Z2.8 F15000
G1 X193.544 Y134.613 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X139.853 Y134.613 E1.64897
; WIPE_START
G1 X141.853 Y134.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.486 Y134.639 Z2.8 F15000
G1 X205.641 Y134.83 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X205.276 Y135.195 E.01537
G1 X204.743 Y135.195
G1 X205.641 Y134.297 E.03783
G1 X205.375 Y134.03
G1 X204.21 Y135.195 E.04908
G1 X203.676 Y135.195
G1 X204.842 Y134.03 E.04908
G1 X204.308 Y134.03
G1 X203.143 Y135.195 E.04908
G1 X202.61 Y135.195
G1 X203.775 Y134.03 E.04908
G1 X203.242 Y134.03
G1 X202.077 Y135.195 E.04908
G1 X201.543 Y135.195
G1 X202.709 Y134.03 E.04908
G1 X202.175 Y134.03
G1 X201.01 Y135.195 E.04908
G1 X200.477 Y135.195
G1 X201.642 Y134.03 E.04908
G1 X201.109 Y134.03
G1 X199.944 Y135.195 E.04908
G1 X199.41 Y135.195
G1 X200.576 Y134.03 E.04908
G1 X200.042 Y134.03
G1 X198.877 Y135.195 E.04908
G1 X198.344 Y135.195
G1 X199.509 Y134.03 E.04908
G1 X198.976 Y134.03
G1 X197.811 Y135.195 E.04908
G1 X197.277 Y135.195
G1 X198.443 Y134.03 E.04908
G1 X197.909 Y134.03
G1 X196.744 Y135.195 E.04908
G1 X196.211 Y135.195
G1 X197.376 Y134.03 E.04908
G1 X196.843 Y134.03
G1 X195.678 Y135.195 E.04908
G1 X195.144 Y135.195
G1 X196.31 Y134.03 E.04908
G1 X195.776 Y134.03
G1 X194.611 Y135.195 E.04908
G1 X194.078 Y135.195
G1 X195.243 Y134.03 E.04908
G1 X194.71 Y134.03
G1 X193.97 Y134.77 E.03117
; OBJECT_ID: 470
; WIPE_START
M204 S5000
G1 X194.71 Y134.03 E-.39762
G1 X195.243 Y134.03 E-.20264
G1 X194.946 Y134.327 E-.15975
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X191.274 Y127.636 Z2.8 F15000
G1 X141.019 Y36.053 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X141.019 Y87.257 E1.64654
G1 X194.71 Y87.257 E1.7265
G1 X194.71 Y88.053 E.02559
G1 X140.223 Y88.053 E1.75209
G1 X140.223 Y35.257 E1.69772
G1 X194.71 Y35.257 E1.75209
G1 X194.71 Y36.053 E.02559
G1 X141.079 Y36.053 E1.72457
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X141.411 Y86.865 E1.50184
G1 X206.811 Y86.865 E1.94803
G1 X206.811 Y88.445 E.04706
G1 X139.831 Y88.445 E1.9951
G1 X139.831 Y34.865 E1.59597
G1 X206.811 Y34.865 E1.9951
G1 X206.811 Y36.445 E.04706
G1 X141.471 Y36.445 E1.94625
; WIPE_START
M204 S5000
G1 X141.469 Y38.445 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.816 Y35.655 Z2.8 F15000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X194.506 Y35.655 E1.64897
; WIPE_START
G1 X192.506 Y35.655 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X200.138 Y35.773 Z2.8 F15000
G1 X206.604 Y35.872 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X206.239 Y36.237 E.01537
G1 X205.705 Y36.237
G1 X206.604 Y35.339 E.03783
G1 X206.337 Y35.072
G1 X205.172 Y36.237 E.04908
G1 X204.639 Y36.237
G1 X205.804 Y35.072 E.04908
G1 X205.271 Y35.072
G1 X204.106 Y36.237 E.04908
G1 X203.572 Y36.237
G1 X204.738 Y35.072 E.04908
G1 X204.204 Y35.072
G1 X203.039 Y36.237 E.04908
G1 X202.506 Y36.237
G1 X203.671 Y35.072 E.04908
G1 X203.138 Y35.072
G1 X201.973 Y36.237 E.04908
G1 X201.439 Y36.237
G1 X202.605 Y35.072 E.04908
G1 X202.071 Y35.072
G1 X200.906 Y36.237 E.04908
G1 X200.373 Y36.237
G1 X201.538 Y35.072 E.04908
G1 X201.005 Y35.072
G1 X199.84 Y36.237 E.04908
G1 X199.306 Y36.237
G1 X200.472 Y35.072 E.04908
G1 X199.938 Y35.072
G1 X198.773 Y36.237 E.04908
G1 X198.24 Y36.237
G1 X199.405 Y35.072 E.04908
G1 X198.872 Y35.072
G1 X197.707 Y36.237 E.04908
G1 X197.173 Y36.237
G1 X198.339 Y35.072 E.04908
G1 X197.805 Y35.072
G1 X196.64 Y36.237 E.04908
G1 X196.107 Y36.237
G1 X197.272 Y35.072 E.04908
G1 X196.739 Y35.072
G1 X195.574 Y36.237 E.04908
G1 X195.04 Y36.237
G1 X196.206 Y35.072 E.04908
G1 X195.672 Y35.072
G1 X194.932 Y35.812 E.03117
; WIPE_START
M204 S5000
G1 X195.672 Y35.072 E-.39762
G1 X196.206 Y35.072 E-.20264
G1 X195.908 Y35.369 E-.15975
; WIPE_END
G1 E-.04 F1800
G1 X195.704 Y42.999 Z2.8 F15000
G1 X194.506 Y87.655 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X140.816 Y87.655 E1.64897
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00556
G1 X140.638 Y87.541 E.00278
; LINE_WIDTH: 0.448395
G1 X140.621 Y87.46 E.00263
; LINE_WIDTH: 0.43172
G1 X140.621 Y35.849 E1.5851
; LINE_WIDTH: 0.470635
G1 X140.655 Y35.688 E.00556
G1 X140.735 Y35.671 E.00278
; LINE_WIDTH: 0.448395
G1 X140.816 Y35.655 E.00263
; WIPE_START
G1 X140.735 Y35.671 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X146.729 Y40.397 Z2.8 F15000
G1 X206.604 Y87.598 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X205.965 Y88.237 E.02691
G1 X205.431 Y88.237
M73 P84 R4
G1 X206.597 Y87.072 E.04908
G1 X206.063 Y87.072
G1 X204.898 Y88.237 E.04908
G1 X204.365 Y88.237
G1 X205.53 Y87.072 E.04908
G1 X204.997 Y87.072
G1 X203.832 Y88.237 E.04908
G1 X203.298 Y88.237
G1 X204.464 Y87.072 E.04908
G1 X203.93 Y87.072
G1 X202.765 Y88.237 E.04908
G1 X202.232 Y88.237
G1 X203.397 Y87.072 E.04908
G1 X202.864 Y87.072
G1 X201.699 Y88.237 E.04908
G1 X201.165 Y88.237
G1 X202.331 Y87.072 E.04908
G1 X201.797 Y87.072
G1 X200.632 Y88.237 E.04908
G1 X200.099 Y88.237
G1 X201.264 Y87.072 E.04909
G1 X200.731 Y87.072
G1 X199.566 Y88.237 E.04908
G1 X199.032 Y88.237
G1 X200.198 Y87.072 E.04908
G1 X199.664 Y87.072
G1 X198.499 Y88.237 E.04908
G1 X197.966 Y88.237
G1 X199.131 Y87.072 E.04908
G1 X198.598 Y87.072
G1 X197.433 Y88.237 E.04908
G1 X196.899 Y88.237
G1 X198.064 Y87.072 E.04908
G1 X197.531 Y87.072
G1 X196.366 Y88.237 E.04908
G1 X195.833 Y88.237
G1 X196.998 Y87.072 E.04908
G1 X196.465 Y87.072
G1 X195.299 Y88.237 E.04908
G1 X194.932 Y88.071
G1 X195.931 Y87.072 E.04209
G1 X195.398 Y87.072
G1 X194.932 Y87.538 E.01962
; OBJECT_ID: 481
; WIPE_START
M204 S5000
G1 X195.398 Y87.072 E-.25035
G1 X195.931 Y87.072 E-.20264
G1 X195.36 Y87.643 E-.30702
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X187.93 Y85.899 Z2.8 F15000
G1 X43.37 Y51.969 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.37 Y103.173 E1.64654
G1 X97.061 Y103.173 E1.7265
G1 X97.061 Y103.969 E.02559
G1 X42.574 Y103.969 E1.75209
G1 X42.574 Y51.173 E1.69772
G1 X97.061 Y51.173 E1.75209
G1 X97.061 Y51.969 E.02559
G1 X43.43 Y51.969 E1.72457
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.762 Y102.781 E1.50184
G1 X109.162 Y102.781 E1.94803
G1 X109.162 Y104.361 E.04706
G1 X42.182 Y104.361 E1.9951
G1 X42.182 Y50.781 E1.59597
G1 X109.162 Y50.781 E1.9951
G1 X109.162 Y52.361 E.04706
G1 X43.822 Y52.361 E1.94625
; WIPE_START
M204 S5000
G1 X43.82 Y54.361 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.166 Y51.571 Z2.8 F15000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X43.086 Y51.588 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y51.604 E.00278
G1 X42.972 Y51.765 E.00556
; LINE_WIDTH: 0.43172
G1 X42.972 Y103.377 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.989 Y103.457 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00278
G1 X43.166 Y103.571 E.00556
; LINE_WIDTH: 0.43172
G1 X96.857 Y103.571 E1.64897
; WIPE_START
G1 X94.857 Y103.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X102.489 Y103.541 Z2.8 F15000
G1 X108.954 Y103.515 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X108.315 Y104.154 E.02691
G1 X107.782 Y104.154
G1 X108.947 Y102.988 E.04908
G1 X108.414 Y102.988
G1 X107.249 Y104.154 E.04908
G1 X106.716 Y104.154
G1 X107.881 Y102.988 E.04908
G1 X107.348 Y102.988
G1 X106.182 Y104.154 E.04908
G1 X105.649 Y104.154
G1 X106.814 Y102.988 E.04908
G1 X106.281 Y102.988
G1 X105.116 Y104.154 E.04908
G1 X104.583 Y104.154
G1 X105.748 Y102.988 E.04908
G1 X105.215 Y102.988
G1 X104.049 Y104.154 E.04908
G1 X103.516 Y104.154
G1 X104.681 Y102.988 E.04908
G1 X104.148 Y102.988
G1 X102.983 Y104.154 E.04908
G1 X102.45 Y104.154
G1 X103.615 Y102.988 E.04909
G1 X103.082 Y102.988
G1 X101.916 Y104.154 E.04908
G1 X101.383 Y104.154
G1 X102.548 Y102.988 E.04908
G1 X102.015 Y102.988
G1 X100.85 Y104.154 E.04908
G1 X100.317 Y104.154
G1 X101.482 Y102.988 E.04908
G1 X100.948 Y102.988
G1 X99.783 Y104.154 E.04908
G1 X99.25 Y104.154
G1 X100.415 Y102.988 E.04908
G1 X99.882 Y102.988
G1 X98.717 Y104.154 E.04908
G1 X98.183 Y104.154
G1 X99.349 Y102.988 E.04908
G1 X98.815 Y102.988
G1 X97.65 Y104.154 E.04908
G1 X97.283 Y103.988
G1 X98.282 Y102.988 E.04209
G1 X97.749 Y102.988
G1 X97.283 Y103.454 E.01962
; WIPE_START
M204 S5000
G1 X97.749 Y102.988 E-.25035
G1 X98.282 Y102.988 E-.20264
G1 X97.711 Y103.56 E-.30702
; WIPE_END
G1 E-.04 F1800
G1 X97.586 Y95.928 Z2.8 F15000
G1 X96.857 Y51.571 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X43.166 Y51.571 E1.64897
; WIPE_START
G1 X45.166 Y51.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.799 Y51.597 Z2.8 F15000
G1 X108.954 Y51.789 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X108.589 Y52.154 E.01537
G1 X108.056 Y52.154
G1 X108.954 Y51.256 E.03783
G1 X108.688 Y50.988
G1 X107.523 Y52.154 E.04908
G1 X106.99 Y52.154
G1 X108.155 Y50.988 E.04908
G1 X107.622 Y50.988
G1 X106.456 Y52.154 E.04908
G1 X105.923 Y52.154
G1 X107.088 Y50.988 E.04908
G1 X106.555 Y50.988
G1 X105.39 Y52.154 E.04908
G1 X104.857 Y52.154
G1 X106.022 Y50.988 E.04908
G1 X105.489 Y50.988
G1 X104.323 Y52.154 E.04908
G1 X103.79 Y52.154
G1 X104.955 Y50.988 E.04908
G1 X104.422 Y50.988
G1 X103.257 Y52.154 E.04908
G1 X102.724 Y52.154
G1 X103.889 Y50.988 E.04908
G1 X103.356 Y50.988
G1 X102.19 Y52.154 E.04908
G1 X101.657 Y52.154
G1 X102.822 Y50.988 E.04908
G1 X102.289 Y50.988
G1 X101.124 Y52.154 E.04908
G1 X100.591 Y52.154
G1 X101.756 Y50.988 E.04908
G1 X101.223 Y50.988
G1 X100.057 Y52.154 E.04908
G1 X99.524 Y52.154
G1 X100.689 Y50.988 E.04908
G1 X100.156 Y50.988
G1 X98.991 Y52.154 E.04908
G1 X98.458 Y52.154
G1 X99.623 Y50.988 E.04908
G1 X99.09 Y50.988
G1 X97.924 Y52.154 E.04908
G1 X97.391 Y52.154
G1 X98.556 Y50.988 E.04908
G1 X98.023 Y50.988
G1 X97.283 Y51.728 E.03117
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X98.023 Y50.988 E-.39762
G1 X98.556 Y50.988 E-.20264
G1 X98.259 Y51.286 E-.15975
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 13/17
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z2.8 I1.217 J0 P1  F15000
; object ids of layer 13 start: 470,481,503,525
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
; object ids of this layer13 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.251 Y164.223
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.251 Y215.428 E1.64654
G1 X85.709 Y215.428 E1.36528
G1 X85.709 Y216.224 E.02559
G1 X42.456 Y216.224 E1.39087
G1 X42.456 Y163.428 E1.69772
G1 X85.709 Y163.428 E1.39087
G1 X85.709 Y164.223 E.02559
M73 P85 R4
G1 X43.311 Y164.223 E1.36335
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.644 Y215.036 E1.50184
G1 X97.81 Y215.036 E1.61343
G1 X97.81 Y216.616 E.04706
G1 X42.064 Y216.616 E1.6605
G1 X42.064 Y163.036 E1.59597
G1 X97.81 Y163.036 E1.6605
G1 X97.81 Y164.616 E.04706
G1 X43.704 Y164.616 E1.61165
; WIPE_START
M204 S5000
G1 X43.701 Y166.616 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.048 Y163.826 Z3 F15000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X85.505 Y163.826 E1.30397
; WIPE_START
G1 X83.505 Y163.826 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.138 Y163.837 Z3 F15000
G1 X97.603 Y163.847 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X96.999 Y163.243 E.02544
G1 X96.465 Y163.243
G1 X97.603 Y164.38 E.04791
G1 X97.097 Y164.408
G1 X95.932 Y163.243 E.04908
G1 X95.399 Y163.243
G1 X96.564 Y164.408 E.04908
G1 X96.031 Y164.408
G1 X94.866 Y163.243 E.04908
G1 X94.332 Y163.243
G1 X95.498 Y164.408 E.04908
G1 X94.964 Y164.408
G1 X93.799 Y163.243 E.04908
G1 X93.266 Y163.243
G1 X94.431 Y164.408 E.04908
G1 X93.898 Y164.408
G1 X92.733 Y163.243 E.04908
G1 X92.199 Y163.243
G1 X93.364 Y164.408 E.04908
G1 X92.831 Y164.408
G1 X91.666 Y163.243 E.04908
G1 X91.133 Y163.243
G1 X92.298 Y164.408 E.04908
G1 X91.765 Y164.408
G1 X90.599 Y163.243 E.04908
G1 X90.066 Y163.243
G1 X91.231 Y164.408 E.04908
G1 X90.698 Y164.408
G1 X89.533 Y163.243 E.04908
G1 X89 Y163.243
G1 X90.165 Y164.408 E.04908
G1 X89.632 Y164.408
G1 X88.466 Y163.243 E.04908
G1 X87.933 Y163.243
G1 X89.098 Y164.408 E.04908
G1 X88.565 Y164.408
G1 X87.4 Y163.243 E.04908
G1 X86.867 Y163.243
G1 X88.032 Y164.408 E.04908
G1 X87.499 Y164.408
G1 X86.333 Y163.243 E.04908
G1 X85.931 Y163.374
G1 X86.965 Y164.408 E.04356
G1 X86.432 Y164.408
G1 X85.931 Y163.907 E.02109
; WIPE_START
M204 S5000
G1 X86.432 Y164.408 E-.26909
G1 X86.965 Y164.408 E-.20264
G1 X86.429 Y163.872 E-.28828
; WIPE_END
G1 E-.04 F1800
G1 X78.796 Y163.864 Z3 F15000
G1 X43.048 Y163.826 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X42.967 Y163.842 E.00263
; LINE_WIDTH: 0.470635
G1 X42.887 Y163.859 E.00278
G1 X42.854 Y164.02 E.00556
; LINE_WIDTH: 0.43172
G1 X42.854 Y215.631 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.87 Y215.712 E.00263
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00278
G1 X43.048 Y215.826 E.00556
; LINE_WIDTH: 0.43172
G1 X85.505 Y215.826 E1.30397
; WIPE_START
G1 X83.505 Y215.826 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.13 Y215.49 Z3 F15000
G1 X96.739 Y215.243 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X97.603 Y216.106 E.03636
G1 X97.371 Y216.408
G1 X96.206 Y215.243 E.04908
G1 X95.673 Y215.243
G1 X96.838 Y216.408 E.04908
G1 X96.305 Y216.408
G1 X95.14 Y215.243 E.04908
G1 X94.606 Y215.243
G1 X95.772 Y216.408 E.04908
G1 X95.238 Y216.408
G1 X94.073 Y215.243 E.04908
G1 X93.54 Y215.243
G1 X94.705 Y216.408 E.04908
G1 X94.172 Y216.408
G1 X93.007 Y215.243 E.04908
G1 X92.473 Y215.243
G1 X93.639 Y216.408 E.04908
G1 X93.105 Y216.408
G1 X91.94 Y215.243 E.04908
G1 X91.407 Y215.243
G1 X92.572 Y216.408 E.04908
G1 X92.039 Y216.408
G1 X90.874 Y215.243 E.04908
G1 X90.34 Y215.243
G1 X91.505 Y216.408 E.04908
G1 X90.972 Y216.408
G1 X89.807 Y215.243 E.04908
G1 X89.274 Y215.243
G1 X90.439 Y216.408 E.04908
G1 X89.906 Y216.408
G1 X88.74 Y215.243 E.04908
G1 X88.207 Y215.243
G1 X89.372 Y216.408 E.04908
G1 X88.839 Y216.408
G1 X87.674 Y215.243 E.04908
G1 X87.141 Y215.243
G1 X88.306 Y216.408 E.04908
G1 X87.773 Y216.408
G1 X86.607 Y215.243 E.04908
G1 X86.074 Y215.243
G1 X87.239 Y216.408 E.04908
G1 X86.706 Y216.408
G1 X85.931 Y215.633 E.03264
; OBJECT_ID: 503
; WIPE_START
M204 S5000
G1 X86.706 Y216.408 E-.41635
G1 X87.239 Y216.408 E-.20264
G1 X86.977 Y216.146 E-.14101
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X91.156 Y209.759 Z3 F15000
G1 X140.057 Y135.01 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.057 Y186.215 E1.64654
G1 X182.514 Y186.215 E1.36528
G1 X182.514 Y187.01 E.02559
G1 X139.261 Y187.01 E1.39087
G1 X139.261 Y134.215 E1.69772
G1 X182.514 Y134.215 E1.39087
G1 X182.514 Y135.01 E.02559
G1 X140.117 Y135.01 E1.36335
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X140.449 Y185.823 E1.50184
G1 X194.615 Y185.823 E1.61343
G1 X194.615 Y187.403 E.04706
G1 X138.869 Y187.403 E1.6605
G1 X138.869 Y133.823 E1.59597
G1 X194.615 Y133.823 E1.6605
G1 X194.615 Y135.403 E.04706
G1 X140.509 Y135.403 E1.61165
; WIPE_START
M204 S5000
G1 X140.506 Y137.403 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.853 Y134.613 Z3 F15000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X182.311 Y134.613 E1.30397
; WIPE_START
G1 X180.311 Y134.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X187.943 Y134.624 Z3 F15000
G1 X194.408 Y134.634 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X193.804 Y134.03 E.02544
G1 X193.271 Y134.03
G1 X194.408 Y135.167 E.04791
G1 X193.903 Y135.195
G1 X192.737 Y134.03 E.04908
G1 X192.204 Y134.03
G1 X193.369 Y135.195 E.04908
G1 X192.836 Y135.195
G1 X191.671 Y134.03 E.04908
G1 X191.138 Y134.03
G1 X192.303 Y135.195 E.04908
G1 X191.77 Y135.195
G1 X190.604 Y134.03 E.04908
G1 X190.071 Y134.03
G1 X191.236 Y135.195 E.04908
G1 X190.703 Y135.195
G1 X189.538 Y134.03 E.04908
G1 X189.005 Y134.03
G1 X190.17 Y135.195 E.04908
G1 X189.636 Y135.195
G1 X188.471 Y134.03 E.04908
G1 X187.938 Y134.03
G1 X189.103 Y135.195 E.04908
G1 X188.57 Y135.195
G1 X187.405 Y134.03 E.04908
G1 X186.871 Y134.03
G1 X188.037 Y135.195 E.04908
G1 X187.503 Y135.195
G1 X186.338 Y134.03 E.04908
M73 P86 R4
G1 X185.805 Y134.03
G1 X186.97 Y135.195 E.04908
G1 X186.437 Y135.195
M73 P86 R3
G1 X185.272 Y134.03 E.04908
G1 X184.738 Y134.03
G1 X185.904 Y135.195 E.04908
G1 X185.37 Y135.195
G1 X184.205 Y134.03 E.04908
G1 X183.672 Y134.03
G1 X184.837 Y135.195 E.04908
G1 X184.304 Y135.195
G1 X183.139 Y134.03 E.04908
G1 X182.737 Y134.161
G1 X183.771 Y135.195 E.04356
G1 X183.237 Y135.195
G1 X182.737 Y134.694 E.02109
; WIPE_START
M204 S5000
G1 X183.237 Y135.195 E-.26909
G1 X183.771 Y135.195 E-.20264
G1 X183.234 Y134.659 E-.28828
; WIPE_END
G1 E-.04 F1800
G1 X175.602 Y134.651 Z3 F15000
G1 X139.853 Y134.613 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X139.773 Y134.629 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y134.646 E.00278
G1 X139.659 Y134.807 E.00556
; LINE_WIDTH: 0.43172
G1 X139.659 Y186.418 E1.5851
; LINE_WIDTH: 0.448395
G1 X139.675 Y186.499 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00278
G1 X139.853 Y186.613 E.00556
; LINE_WIDTH: 0.43172
G1 X182.311 Y186.613 E1.30397
; WIPE_START
G1 X180.311 Y186.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X187.936 Y186.277 Z3 F15000
G1 X193.545 Y186.03 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X194.408 Y186.893 E.03636
G1 X194.177 Y187.195
G1 X193.011 Y186.03 E.04908
G1 X192.478 Y186.03
G1 X193.643 Y187.195 E.04908
G1 X193.11 Y187.195
G1 X191.945 Y186.03 E.04908
G1 X191.412 Y186.03
G1 X192.577 Y187.195 E.04908
G1 X192.044 Y187.195
G1 X190.878 Y186.03 E.04908
G1 X190.345 Y186.03
G1 X191.51 Y187.195 E.04908
G1 X190.977 Y187.195
G1 X189.812 Y186.03 E.04908
G1 X189.279 Y186.03
G1 X190.444 Y187.195 E.04908
G1 X189.911 Y187.195
G1 X188.745 Y186.03 E.04908
G1 X188.212 Y186.03
G1 X189.377 Y187.195 E.04908
G1 X188.844 Y187.195
G1 X187.679 Y186.03 E.04908
G1 X187.146 Y186.03
G1 X188.311 Y187.195 E.04908
G1 X187.777 Y187.195
G1 X186.612 Y186.03 E.04908
G1 X186.079 Y186.03
G1 X187.244 Y187.195 E.04908
G1 X186.711 Y187.195
G1 X185.546 Y186.03 E.04908
G1 X185.012 Y186.03
G1 X186.178 Y187.195 E.04908
G1 X185.644 Y187.195
G1 X184.479 Y186.03 E.04908
G1 X183.946 Y186.03
G1 X185.111 Y187.195 E.04908
G1 X184.578 Y187.195
G1 X183.413 Y186.03 E.04908
G1 X182.879 Y186.03
G1 X184.045 Y187.195 E.04908
G1 X183.511 Y187.195
G1 X182.737 Y186.42 E.03264
; OBJECT_ID: 470
; WIPE_START
M204 S5000
G1 X183.511 Y187.195 E-.41635
G1 X184.045 Y187.195 E-.20264
G1 X183.782 Y186.933 E-.14101
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X181.701 Y179.59 Z3 F15000
G1 X141.019 Y36.053 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X141.019 Y87.257 E1.64654
G1 X183.477 Y87.257 E1.36528
G1 X183.477 Y88.053 E.02559
G1 X140.223 Y88.053 E1.39087
G1 X140.223 Y35.257 E1.69772
G1 X183.477 Y35.257 E1.39087
G1 X183.477 Y36.053 E.02559
G1 X141.079 Y36.053 E1.36335
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X141.411 Y86.865 E1.50184
G1 X195.578 Y86.865 E1.61343
G1 X195.578 Y88.445 E.04706
G1 X139.831 Y88.445 E1.6605
G1 X139.831 Y34.865 E1.59597
G1 X195.578 Y34.865 E1.6605
G1 X195.578 Y36.445 E.04706
G1 X141.471 Y36.445 E1.61165
; WIPE_START
M204 S5000
G1 X141.469 Y38.445 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.816 Y35.655 Z3 F15000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X183.273 Y35.655 E1.30397
; WIPE_START
G1 X181.273 Y35.655 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X188.906 Y35.666 Z3 F15000
G1 X195.37 Y35.676 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X194.766 Y35.072 E.02544
G1 X194.233 Y35.072
G1 X195.37 Y36.209 E.04791
G1 X194.865 Y36.237
G1 X193.7 Y35.072 E.04908
G1 X193.166 Y35.072
G1 X194.332 Y36.237 E.04908
G1 X193.798 Y36.237
G1 X192.633 Y35.072 E.04908
G1 X192.1 Y35.072
G1 X193.265 Y36.237 E.04908
G1 X192.732 Y36.237
G1 X191.567 Y35.072 E.04908
G1 X191.033 Y35.072
G1 X192.199 Y36.237 E.04908
G1 X191.665 Y36.237
G1 X190.5 Y35.072 E.04908
G1 X189.967 Y35.072
G1 X191.132 Y36.237 E.04908
G1 X190.599 Y36.237
G1 X189.434 Y35.072 E.04908
G1 X188.9 Y35.072
G1 X190.066 Y36.237 E.04908
G1 X189.532 Y36.237
G1 X188.367 Y35.072 E.04908
G1 X187.834 Y35.072
G1 X188.999 Y36.237 E.04908
G1 X188.466 Y36.237
G1 X187.301 Y35.072 E.04908
G1 X186.767 Y35.072
G1 X187.933 Y36.237 E.04908
G1 X187.399 Y36.237
G1 X186.234 Y35.072 E.04908
G1 X185.701 Y35.072
G1 X186.866 Y36.237 E.04908
G1 X186.333 Y36.237
G1 X185.168 Y35.072 E.04908
G1 X184.634 Y35.072
G1 X185.8 Y36.237 E.04908
G1 X185.266 Y36.237
G1 X184.101 Y35.072 E.04908
G1 X183.699 Y35.203
G1 X184.733 Y36.237 E.04356
G1 X184.2 Y36.237
G1 X183.699 Y35.737 E.02109
; WIPE_START
M204 S5000
G1 X184.2 Y36.237 E-.26909
G1 X184.733 Y36.237 E-.20264
G1 X184.197 Y35.701 E-.28828
; WIPE_END
G1 E-.04 F1800
G1 X176.564 Y35.693 Z3 F15000
G1 X140.816 Y35.655 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X140.735 Y35.671 E.00263
; LINE_WIDTH: 0.470635
G1 X140.655 Y35.688 E.00278
G1 X140.621 Y35.849 E.00556
; LINE_WIDTH: 0.43172
G1 X140.621 Y87.46 E1.5851
; LINE_WIDTH: 0.448395
G1 X140.638 Y87.541 E.00263
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00278
G1 X140.816 Y87.655 E.00556
; LINE_WIDTH: 0.43172
G1 X183.273 Y87.655 E1.30397
; WIPE_START
G1 X181.273 Y87.655 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X188.898 Y87.319 Z3 F15000
G1 X194.507 Y87.072 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
M73 P87 R3
G1 X195.37 Y87.935 E.03636
G1 X195.139 Y88.237
G1 X193.974 Y87.072 E.04908
G1 X193.441 Y87.072
G1 X194.606 Y88.237 E.04908
G1 X194.072 Y88.237
G1 X192.907 Y87.072 E.04908
G1 X192.374 Y87.072
G1 X193.539 Y88.237 E.04908
G1 X193.006 Y88.237
G1 X191.841 Y87.072 E.04908
G1 X191.307 Y87.072
G1 X192.473 Y88.237 E.04908
G1 X191.939 Y88.237
G1 X190.774 Y87.072 E.04908
G1 X190.241 Y87.072
G1 X191.406 Y88.237 E.04908
G1 X190.873 Y88.237
G1 X189.708 Y87.072 E.04908
G1 X189.174 Y87.072
G1 X190.34 Y88.237 E.04908
G1 X189.806 Y88.237
G1 X188.641 Y87.072 E.04908
G1 X188.108 Y87.072
G1 X189.273 Y88.237 E.04908
G1 X188.74 Y88.237
G1 X187.575 Y87.072 E.04908
G1 X187.041 Y87.072
G1 X188.207 Y88.237 E.04908
G1 X187.673 Y88.237
G1 X186.508 Y87.072 E.04908
G1 X185.975 Y87.072
G1 X187.14 Y88.237 E.04908
G1 X186.607 Y88.237
G1 X185.442 Y87.072 E.04908
G1 X184.908 Y87.072
G1 X186.074 Y88.237 E.04908
G1 X185.54 Y88.237
G1 X184.375 Y87.072 E.04908
G1 X183.842 Y87.072
G1 X185.007 Y88.237 E.04908
G1 X184.474 Y88.237
G1 X183.699 Y87.463 E.03264
; OBJECT_ID: 481
; WIPE_START
M204 S5000
G1 X184.474 Y88.237 E-.41635
G1 X185.007 Y88.237 E-.20264
G1 X184.745 Y87.975 E-.14101
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X177.348 Y86.091 Z3 F15000
G1 X43.37 Y51.969 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.37 Y103.173 E1.64654
G1 X85.827 Y103.173 E1.36528
G1 X85.827 Y103.969 E.02559
G1 X42.574 Y103.969 E1.39087
G1 X42.574 Y51.173 E1.69772
G1 X85.827 Y51.173 E1.39087
G1 X85.827 Y51.969 E.02559
G1 X43.43 Y51.969 E1.36335
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.762 Y102.781 E1.50184
G1 X97.928 Y102.781 E1.61343
G1 X97.928 Y104.361 E.04706
G1 X42.182 Y104.361 E1.6605
G1 X42.182 Y50.781 E1.59597
G1 X97.928 Y50.781 E1.6605
G1 X97.928 Y52.361 E.04706
G1 X43.822 Y52.361 E1.61165
; WIPE_START
M204 S5000
G1 X43.82 Y54.361 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.166 Y51.571 Z3 F15000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X85.624 Y51.571 E1.30397
; WIPE_START
G1 X83.624 Y51.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.256 Y51.583 Z3 F15000
G1 X97.721 Y51.592 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X97.117 Y50.988 E.02544
G1 X96.584 Y50.988
G1 X97.721 Y52.126 E.04791
G1 X97.216 Y52.154
G1 X96.05 Y50.988 E.04908
G1 X95.517 Y50.988
G1 X96.682 Y52.154 E.04908
G1 X96.149 Y52.154
G1 X94.984 Y50.988 E.04908
G1 X94.451 Y50.988
G1 X95.616 Y52.154 E.04908
G1 X95.083 Y52.154
G1 X93.917 Y50.988 E.04908
G1 X93.384 Y50.988
G1 X94.549 Y52.154 E.04908
G1 X94.016 Y52.154
G1 X92.851 Y50.988 E.04908
G1 X92.318 Y50.988
G1 X93.483 Y52.154 E.04908
G1 X92.95 Y52.154
G1 X91.784 Y50.988 E.04908
G1 X91.251 Y50.988
G1 X92.416 Y52.154 E.04908
G1 X91.883 Y52.154
G1 X90.718 Y50.988 E.04908
G1 X90.185 Y50.988
G1 X91.35 Y52.154 E.04908
G1 X90.817 Y52.154
G1 X89.651 Y50.988 E.04908
G1 X89.118 Y50.988
G1 X90.283 Y52.154 E.04908
G1 X89.75 Y52.154
G1 X88.585 Y50.988 E.04908
G1 X88.052 Y50.988
G1 X89.217 Y52.154 E.04908
G1 X88.684 Y52.154
G1 X87.518 Y50.988 E.04908
G1 X86.985 Y50.988
G1 X88.15 Y52.154 E.04908
G1 X87.617 Y52.154
G1 X86.452 Y50.988 E.04908
G1 X86.05 Y51.12
G1 X87.084 Y52.154 E.04356
G1 X86.551 Y52.154
G1 X86.05 Y51.653 E.02109
; WIPE_START
M204 S5000
G1 X86.551 Y52.154 E-.26909
G1 X87.084 Y52.154 E-.20264
G1 X86.547 Y51.617 E-.28828
; WIPE_END
G1 E-.04 F1800
G1 X78.915 Y51.609 Z3 F15000
G1 X43.166 Y51.571 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X43.086 Y51.588 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y51.604 E.00278
G1 X42.972 Y51.765 E.00556
; LINE_WIDTH: 0.43172
G1 X42.972 Y103.377 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.989 Y103.457 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00278
G1 X43.166 Y103.571 E.00556
; LINE_WIDTH: 0.43172
G1 X85.624 Y103.571 E1.30397
; WIPE_START
G1 X83.624 Y103.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X91.249 Y103.235 Z3 F15000
G1 X96.858 Y102.988 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X97.721 Y103.852 E.03636
G1 X97.49 Y104.154
G1 X96.325 Y102.988 E.04908
G1 X95.791 Y102.988
G1 X96.956 Y104.154 E.04908
G1 X96.423 Y104.154
G1 X95.258 Y102.988 E.04908
G1 X94.725 Y102.988
G1 X95.89 Y104.154 E.04908
G1 X95.357 Y104.154
G1 X94.191 Y102.988 E.04908
G1 X93.658 Y102.988
G1 X94.823 Y104.154 E.04908
G1 X94.29 Y104.154
G1 X93.125 Y102.988 E.04908
G1 X92.592 Y102.988
G1 X93.757 Y104.154 E.04908
G1 X93.224 Y104.154
G1 X92.058 Y102.988 E.04908
G1 X91.525 Y102.988
G1 X92.69 Y104.154 E.04908
G1 X92.157 Y104.154
G1 X90.992 Y102.988 E.04908
G1 X90.459 Y102.988
G1 X91.624 Y104.154 E.04908
G1 X91.091 Y104.154
G1 X89.925 Y102.988 E.04908
G1 X89.392 Y102.988
G1 X90.557 Y104.154 E.04908
G1 X90.024 Y104.154
G1 X88.859 Y102.988 E.04908
G1 X88.326 Y102.988
G1 X89.491 Y104.154 E.04908
G1 X88.958 Y104.154
G1 X87.792 Y102.988 E.04908
G1 X87.259 Y102.988
G1 X88.424 Y104.154 E.04908
G1 X87.891 Y104.154
G1 X86.726 Y102.988 E.04908
G1 X86.193 Y102.988
G1 X87.358 Y104.154 E.04908
G1 X86.825 Y104.154
G1 X86.05 Y103.379 E.03264
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X86.825 Y104.154 E-.41635
G1 X87.358 Y104.154 E-.20264
G1 X87.095 Y103.891 E-.14101
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 14/17
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z3 I1.217 J0 P1  F15000
; object ids of layer 14 start: 470,481,503,525
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
; object ids of this layer14 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.251 Y164.223
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.251 Y215.428 E1.64654
G1 X74.476 Y215.428 E1.00405
G1 X74.476 Y216.224 E.02559
G1 X42.456 Y216.224 E1.02965
G1 X42.456 Y163.428 E1.69772
G1 X74.476 Y163.428 E1.02965
G1 X74.476 Y164.223 E.02559
G1 X43.311 Y164.223 E1.00213
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.644 Y215.036 E1.50184
G1 X86.577 Y215.036 E1.27883
G1 X86.577 Y216.616 E.04706
G1 X42.064 Y216.616 E1.32589
G1 X42.064 Y163.036 E1.59597
G1 X86.577 Y163.036 E1.32589
G1 X86.577 Y164.616 E.04706
G1 X43.704 Y164.616 E1.27704
; WIPE_START
M204 S5000
G1 X43.701 Y166.616 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.048 Y163.826 Z3.2 F15000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X74.272 Y163.826 E.95897
; WIPE_START
G1 X72.272 Y163.826 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X79.897 Y164.16 Z3.2 F15000
G1 X85.541 Y164.408 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X86.369 Y163.58 E.03489
G1 X86.173 Y163.243
G1 X85.008 Y164.408 E.04908
G1 X84.474 Y164.408
G1 X85.64 Y163.243 E.04908
G1 X85.106 Y163.243
G1 X83.941 Y164.408 E.04908
G1 X83.408 Y164.408
G1 X84.573 Y163.243 E.04908
G1 X84.04 Y163.243
G1 X82.875 Y164.408 E.04908
G1 X82.341 Y164.408
G1 X83.507 Y163.243 E.04908
G1 X82.973 Y163.243
M73 P88 R3
G1 X81.808 Y164.408 E.04908
G1 X81.275 Y164.408
G1 X82.44 Y163.243 E.04908
G1 X81.907 Y163.243
G1 X80.742 Y164.408 E.04908
G1 X80.208 Y164.408
G1 X81.374 Y163.243 E.04908
G1 X80.84 Y163.243
G1 X79.675 Y164.408 E.04908
G1 X79.142 Y164.408
G1 X80.307 Y163.243 E.04908
G1 X79.774 Y163.243
G1 X78.609 Y164.408 E.04908
G1 X78.075 Y164.408
G1 X79.241 Y163.243 E.04908
G1 X78.707 Y163.243
G1 X77.542 Y164.408 E.04908
G1 X77.009 Y164.408
G1 X78.174 Y163.243 E.04908
G1 X77.641 Y163.243
G1 X76.476 Y164.408 E.04908
G1 X75.942 Y164.408
G1 X77.108 Y163.243 E.04908
G1 X76.574 Y163.243
G1 X75.409 Y164.408 E.04908
G1 X74.876 Y164.408
G1 X76.041 Y163.243 E.04908
G1 X75.508 Y163.243
G1 X74.698 Y164.053 E.03411
M204 S5000
G1 X74.716 Y164.071 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116882
G1 F7500
G1 X74.716 Y164.427 E.00208
; WIPE_START
G1 X74.716 Y164.071 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X67.084 Y164.012 Z3.2 F15000
G1 X43.048 Y163.826 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.448395
G1 F7500
G1 X42.967 Y163.842 E.00263
; LINE_WIDTH: 0.470635
G1 X42.887 Y163.859 E.00278
G1 X42.854 Y164.02 E.00556
; LINE_WIDTH: 0.43172
G1 X42.854 Y215.631 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.87 Y215.712 E.00263
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00278
G1 X43.048 Y215.826 E.00556
; LINE_WIDTH: 0.43172
G1 X74.272 Y215.826 E.95897
; WIPE_START
G1 X72.272 Y215.826 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X79.905 Y215.833 Z3.2 F15000
G1 X86.369 Y215.839 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X85.8 Y216.408 E.02398
G1 X85.267 Y216.408
G1 X86.369 Y215.306 E.04644
G1 X85.899 Y215.243
G1 X84.734 Y216.408 E.04908
G1 X84.2 Y216.408
G1 X85.366 Y215.243 E.04908
G1 X84.832 Y215.243
G1 X83.667 Y216.408 E.04908
G1 X83.134 Y216.408
G1 X84.299 Y215.243 E.04908
G1 X83.766 Y215.243
G1 X82.601 Y216.408 E.04908
G1 X82.067 Y216.408
G1 X83.233 Y215.243 E.04908
G1 X82.699 Y215.243
G1 X81.534 Y216.408 E.04908
G1 X81.001 Y216.408
G1 X82.166 Y215.243 E.04908
G1 X81.633 Y215.243
G1 X80.468 Y216.408 E.04908
G1 X79.934 Y216.408
G1 X81.1 Y215.243 E.04908
G1 X80.566 Y215.243
G1 X79.401 Y216.408 E.04908
G1 X78.868 Y216.408
G1 X80.033 Y215.243 E.04908
G1 X79.5 Y215.243
G1 X78.335 Y216.408 E.04908
G1 X77.801 Y216.408
G1 X78.967 Y215.243 E.04908
G1 X78.433 Y215.243
G1 X77.268 Y216.408 E.04908
G1 X76.735 Y216.408
G1 X77.9 Y215.243 E.04908
G1 X77.367 Y215.243
G1 X76.202 Y216.408 E.04908
G1 X75.668 Y216.408
G1 X76.833 Y215.243 E.04908
G1 X76.3 Y215.243
G1 X75.135 Y216.408 E.04908
G1 X74.698 Y216.312
G1 X75.767 Y215.243 E.04503
G1 X75.234 Y215.243
G1 X74.698 Y215.779 E.02256
; OBJECT_ID: 503
; WIPE_START
M204 S5000
G1 X75.234 Y215.243 E-.28784
G1 X75.767 Y215.243 E-.20264
G1 X75.265 Y215.744 E-.26952
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X80.043 Y209.792 Z3.2 F15000
G1 X140.057 Y135.01 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.057 Y186.215 E1.64654
G1 X171.281 Y186.215 E1.00405
G1 X171.281 Y187.01 E.02559
G1 X139.261 Y187.01 E1.02965
G1 X139.261 Y134.215 E1.69772
G1 X171.281 Y134.215 E1.02965
G1 X171.281 Y135.01 E.02559
G1 X140.117 Y135.01 E1.00213
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X140.449 Y185.823 E1.50184
G1 X183.382 Y185.823 E1.27883
G1 X183.382 Y187.403 E.04706
G1 X138.869 Y187.403 E1.32589
G1 X138.869 Y133.823 E1.59597
G1 X183.382 Y133.823 E1.32589
G1 X183.382 Y135.403 E.04706
G1 X140.509 Y135.403 E1.27704
; WIPE_START
M204 S5000
G1 X140.506 Y137.403 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.853 Y134.613 Z3.2 F15000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X171.077 Y134.613 E.95897
; WIPE_START
G1 X169.077 Y134.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.702 Y134.947 Z3.2 F15000
G1 X182.346 Y135.195 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X183.175 Y134.367 E.03489
G1 X182.978 Y134.03
G1 X181.813 Y135.195 E.04908
G1 X181.28 Y135.195
G1 X182.445 Y134.03 E.04908
G1 X181.912 Y134.03
G1 X180.746 Y135.195 E.04908
G1 X180.213 Y135.195
G1 X181.378 Y134.03 E.04908
G1 X180.845 Y134.03
G1 X179.68 Y135.195 E.04908
G1 X179.147 Y135.195
G1 X180.312 Y134.03 E.04908
G1 X179.779 Y134.03
G1 X178.613 Y135.195 E.04908
G1 X178.08 Y135.195
G1 X179.245 Y134.03 E.04908
G1 X178.712 Y134.03
G1 X177.547 Y135.195 E.04908
G1 X177.014 Y135.195
G1 X178.179 Y134.03 E.04908
G1 X177.646 Y134.03
G1 X176.48 Y135.195 E.04908
G1 X175.947 Y135.195
G1 X177.112 Y134.03 E.04908
G1 X176.579 Y134.03
G1 X175.414 Y135.195 E.04908
G1 X174.881 Y135.195
G1 X176.046 Y134.03 E.04908
G1 X175.513 Y134.03
G1 X174.347 Y135.195 E.04908
G1 X173.814 Y135.195
G1 X174.979 Y134.03 E.04908
G1 X174.446 Y134.03
G1 X173.281 Y135.195 E.04908
G1 X172.748 Y135.195
G1 X173.913 Y134.03 E.04908
G1 X173.38 Y134.03
G1 X172.214 Y135.195 E.04908
G1 X171.681 Y135.195
G1 X172.846 Y134.03 E.04908
G1 X172.313 Y134.03
G1 X171.503 Y134.84 E.03411
M204 S5000
G1 X171.522 Y134.858 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116882
G1 F7500
G1 X171.522 Y135.214 E.00208
; WIPE_START
G1 X171.522 Y134.858 E-.76
; WIPE_END
M73 P89 R3
G1 E-.04 F1800
G1 X163.889 Y134.799 Z3.2 F15000
G1 X139.853 Y134.613 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.448395
G1 F7500
G1 X139.773 Y134.629 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y134.646 E.00278
G1 X139.659 Y134.807 E.00556
; LINE_WIDTH: 0.43172
G1 X139.659 Y186.418 E1.5851
; LINE_WIDTH: 0.448395
G1 X139.675 Y186.499 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00278
G1 X139.853 Y186.613 E.00556
; LINE_WIDTH: 0.43172
G1 X171.077 Y186.613 E.95897
; WIPE_START
G1 X169.077 Y186.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.71 Y186.62 Z3.2 F15000
G1 X183.175 Y186.626 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X182.605 Y187.195 E.02398
G1 X182.072 Y187.195
G1 X183.175 Y186.093 E.04644
G1 X182.704 Y186.03
G1 X181.539 Y187.195 E.04908
G1 X181.006 Y187.195
G1 X182.171 Y186.03 E.04908
G1 X181.638 Y186.03
G1 X180.472 Y187.195 E.04908
G1 X179.939 Y187.195
G1 X181.104 Y186.03 E.04908
G1 X180.571 Y186.03
G1 X179.406 Y187.195 E.04908
G1 X178.873 Y187.195
G1 X180.038 Y186.03 E.04908
G1 X179.505 Y186.03
G1 X178.339 Y187.195 E.04908
G1 X177.806 Y187.195
G1 X178.971 Y186.03 E.04908
G1 X178.438 Y186.03
G1 X177.273 Y187.195 E.04908
G1 X176.74 Y187.195
G1 X177.905 Y186.03 E.04908
G1 X177.372 Y186.03
G1 X176.206 Y187.195 E.04908
G1 X175.673 Y187.195
G1 X176.838 Y186.03 E.04908
G1 X176.305 Y186.03
G1 X175.14 Y187.195 E.04908
G1 X174.607 Y187.195
G1 X175.772 Y186.03 E.04908
G1 X175.239 Y186.03
G1 X174.073 Y187.195 E.04908
G1 X173.54 Y187.195
G1 X174.705 Y186.03 E.04908
G1 X174.172 Y186.03
G1 X173.007 Y187.195 E.04908
G1 X172.474 Y187.195
G1 X173.639 Y186.03 E.04908
G1 X173.105 Y186.03
G1 X171.94 Y187.195 E.04908
G1 X171.503 Y187.099
G1 X172.572 Y186.03 E.04503
G1 X172.039 Y186.03
G1 X171.503 Y186.566 E.02256
; OBJECT_ID: 470
; WIPE_START
M204 S5000
G1 X172.039 Y186.03 E-.28784
G1 X172.572 Y186.03 E-.20264
G1 X172.071 Y186.531 E-.26952
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X170.528 Y179.056 Z3.2 F15000
G1 X141.019 Y36.053 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X141.019 Y87.257 E1.64654
G1 X172.243 Y87.257 E1.00405
G1 X172.243 Y88.053 E.02559
G1 X140.223 Y88.053 E1.02965
G1 X140.223 Y35.257 E1.69772
G1 X172.243 Y35.257 E1.02965
G1 X172.243 Y36.053 E.02559
G1 X141.079 Y36.053 E1.00213
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X141.411 Y86.865 E1.50184
G1 X184.344 Y86.865 E1.27883
G1 X184.344 Y88.445 E.04706
G1 X139.831 Y88.445 E1.32589
G1 X139.831 Y34.865 E1.59597
G1 X184.344 Y34.865 E1.32589
G1 X184.344 Y36.445 E.04706
G1 X141.471 Y36.445 E1.27704
; WIPE_START
M204 S5000
G1 X141.469 Y38.445 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.816 Y35.655 Z3.2 F15000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X172.04 Y35.655 E.95897
; WIPE_START
G1 X170.04 Y35.655 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.665 Y35.989 Z3.2 F15000
G1 X183.309 Y36.237 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X184.137 Y35.409 E.03489
G1 X183.941 Y35.072
G1 X182.775 Y36.237 E.04908
G1 X182.242 Y36.237
G1 X183.407 Y35.072 E.04908
G1 X182.874 Y35.072
G1 X181.709 Y36.237 E.04908
G1 X181.176 Y36.237
G1 X182.341 Y35.072 E.04908
G1 X181.808 Y35.072
G1 X180.642 Y36.237 E.04908
G1 X180.109 Y36.237
G1 X181.274 Y35.072 E.04908
G1 X180.741 Y35.072
G1 X179.576 Y36.237 E.04908
G1 X179.043 Y36.237
G1 X180.208 Y35.072 E.04908
G1 X179.675 Y35.072
G1 X178.509 Y36.237 E.04908
G1 X177.976 Y36.237
G1 X179.141 Y35.072 E.04908
G1 X178.608 Y35.072
G1 X177.443 Y36.237 E.04908
G1 X176.91 Y36.237
G1 X178.075 Y35.072 E.04908
G1 X177.541 Y35.072
G1 X176.376 Y36.237 E.04908
G1 X175.843 Y36.237
G1 X177.008 Y35.072 E.04908
G1 X176.475 Y35.072
G1 X175.31 Y36.237 E.04908
G1 X174.776 Y36.237
G1 X175.942 Y35.072 E.04908
M73 P89 R2
G1 X175.408 Y35.072
G1 X174.243 Y36.237 E.04908
G1 X173.71 Y36.237
G1 X174.875 Y35.072 E.04908
G1 X174.342 Y35.072
G1 X173.177 Y36.237 E.04908
G1 X172.643 Y36.237
G1 X173.809 Y35.072 E.04908
G1 X173.275 Y35.072
G1 X172.466 Y35.882 E.03411
M204 S5000
G1 X172.484 Y35.9 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116882
G1 F7500
G1 X172.484 Y36.256 E.00208
; WIPE_START
G1 X172.484 Y35.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X164.852 Y35.841 Z3.2 F15000
G1 X140.816 Y35.655 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.448395
G1 F7500
G1 X140.735 Y35.671 E.00263
; LINE_WIDTH: 0.470635
G1 X140.655 Y35.688 E.00278
G1 X140.621 Y35.849 E.00556
; LINE_WIDTH: 0.43172
G1 X140.621 Y87.46 E1.5851
; LINE_WIDTH: 0.448395
G1 X140.638 Y87.541 E.00263
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00278
G1 X140.816 Y87.655 E.00556
; LINE_WIDTH: 0.43172
G1 X172.04 Y87.655 E.95897
; WIPE_START
G1 X170.04 Y87.655 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.672 Y87.662 Z3.2 F15000
G1 X184.137 Y87.668 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X183.568 Y88.237 E.02398
G1 X183.035 Y88.237
G1 X184.137 Y87.135 E.04644
G1 X183.667 Y87.072
G1 X182.501 Y88.237 E.04908
G1 X181.968 Y88.237
G1 X183.133 Y87.072 E.04908
G1 X182.6 Y87.072
G1 X181.435 Y88.237 E.04908
G1 X180.902 Y88.237
G1 X182.067 Y87.072 E.04908
G1 X181.534 Y87.072
G1 X180.368 Y88.237 E.04908
G1 X179.835 Y88.237
G1 X181 Y87.072 E.04908
G1 X180.467 Y87.072
G1 X179.302 Y88.237 E.04908
G1 X178.769 Y88.237
G1 X179.934 Y87.072 E.04908
G1 X179.4 Y87.072
G1 X178.235 Y88.237 E.04908
G1 X177.702 Y88.237
G1 X178.867 Y87.072 E.04908
G1 X178.334 Y87.072
G1 X177.169 Y88.237 E.04908
G1 X176.635 Y88.237
G1 X177.801 Y87.072 E.04908
G1 X177.267 Y87.072
G1 X176.102 Y88.237 E.04908
G1 X175.569 Y88.237
G1 X176.734 Y87.072 E.04908
G1 X176.201 Y87.072
G1 X175.036 Y88.237 E.04908
G1 X174.502 Y88.237
G1 X175.668 Y87.072 E.04908
G1 X175.134 Y87.072
G1 X173.969 Y88.237 E.04908
G1 X173.436 Y88.237
G1 X174.601 Y87.072 E.04908
G1 X174.068 Y87.072
G1 X172.903 Y88.237 E.04908
G1 X172.466 Y88.141
G1 X173.535 Y87.072 E.04503
G1 X173.001 Y87.072
G1 X172.466 Y87.608 E.02256
; OBJECT_ID: 481
; WIPE_START
M204 S5000
G1 X173.001 Y87.072 E-.28784
G1 X173.535 Y87.072 E-.20264
G1 X173.033 Y87.574 E-.26953
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X165.673 Y85.553 Z3.2 F15000
G1 X43.37 Y51.969 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.37 Y103.173 E1.64654
G1 X74.594 Y103.173 E1.00405
G1 X74.594 Y103.969 E.02559
G1 X42.574 Y103.969 E1.02965
G1 X42.574 Y51.173 E1.69772
G1 X74.594 Y51.173 E1.02965
G1 X74.594 Y51.969 E.02559
G1 X43.43 Y51.969 E1.00213
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.762 Y102.781 E1.50184
G1 X86.695 Y102.781 E1.27883
G1 X86.695 Y104.361 E.04706
G1 X42.182 Y104.361 E1.32589
G1 X42.182 Y50.781 E1.59597
G1 X86.695 Y50.781 E1.32589
G1 X86.695 Y52.361 E.04706
G1 X43.822 Y52.361 E1.27704
; WIPE_START
M204 S5000
G1 X43.82 Y54.361 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.166 Y51.571 Z3.2 F15000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X74.391 Y51.571 E.95897
; WIPE_START
G1 X72.391 Y51.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X80.016 Y51.906 Z3.2 F15000
G1 X85.659 Y52.154 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X86.488 Y51.325 E.03489
G1 X86.291 Y50.988
G1 X85.126 Y52.154 E.04908
G1 X84.593 Y52.154
G1 X85.758 Y50.988 E.04908
G1 X85.225 Y50.988
G1 X84.06 Y52.154 E.04908
G1 X83.526 Y52.154
G1 X84.692 Y50.988 E.04908
G1 X84.158 Y50.988
G1 X82.993 Y52.154 E.04908
G1 X82.46 Y52.154
G1 X83.625 Y50.988 E.04908
G1 X83.092 Y50.988
G1 X81.927 Y52.154 E.04908
M73 P90 R2
G1 X81.393 Y52.154
G1 X82.559 Y50.988 E.04908
G1 X82.025 Y50.988
G1 X80.86 Y52.154 E.04908
G1 X80.327 Y52.154
G1 X81.492 Y50.988 E.04908
G1 X80.959 Y50.988
G1 X79.794 Y52.154 E.04908
G1 X79.26 Y52.154
G1 X80.425 Y50.988 E.04908
G1 X79.892 Y50.988
G1 X78.727 Y52.154 E.04908
G1 X78.194 Y52.154
G1 X79.359 Y50.988 E.04908
G1 X78.826 Y50.988
G1 X77.66 Y52.154 E.04908
G1 X77.127 Y52.154
G1 X78.292 Y50.988 E.04908
G1 X77.759 Y50.988
G1 X76.594 Y52.154 E.04908
G1 X76.061 Y52.154
G1 X77.226 Y50.988 E.04908
G1 X76.693 Y50.988
G1 X75.527 Y52.154 E.04908
G1 X74.994 Y52.154
G1 X76.159 Y50.988 E.04908
G1 X75.626 Y50.988
G1 X74.817 Y51.798 E.03411
M204 S5000
G1 X74.835 Y51.816 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116882
G1 F7500
G1 X74.835 Y52.173 E.00208
; WIPE_START
G1 X74.835 Y51.816 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X67.202 Y51.757 Z3.2 F15000
G1 X43.166 Y51.571 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.448395
G1 F7500
G1 X43.086 Y51.588 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y51.604 E.00278
G1 X42.972 Y51.765 E.00556
; LINE_WIDTH: 0.43172
G1 X42.972 Y103.377 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.989 Y103.457 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00278
G1 X43.166 Y103.571 E.00556
; LINE_WIDTH: 0.43172
G1 X74.391 Y103.571 E.95897
; WIPE_START
G1 X72.391 Y103.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X80.023 Y103.578 Z3.2 F15000
G1 X86.488 Y103.585 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X85.919 Y104.154 E.02398
G1 X85.385 Y104.154
G1 X86.488 Y103.051 E.04644
G1 X86.017 Y102.988
G1 X84.852 Y104.154 E.04908
G1 X84.319 Y104.154
G1 X85.484 Y102.988 E.04908
G1 X84.951 Y102.988
G1 X83.786 Y104.154 E.04908
G1 X83.252 Y104.154
G1 X84.418 Y102.988 E.04908
G1 X83.884 Y102.988
G1 X82.719 Y104.154 E.04908
G1 X82.186 Y104.154
G1 X83.351 Y102.988 E.04908
G1 X82.818 Y102.988
G1 X81.653 Y104.154 E.04908
G1 X81.119 Y104.154
G1 X82.284 Y102.988 E.04908
G1 X81.751 Y102.988
G1 X80.586 Y104.154 E.04908
G1 X80.053 Y104.154
G1 X81.218 Y102.988 E.04908
G1 X80.685 Y102.988
G1 X79.519 Y104.154 E.04908
G1 X78.986 Y104.154
G1 X80.151 Y102.988 E.04908
G1 X79.618 Y102.988
G1 X78.453 Y104.154 E.04908
G1 X77.92 Y104.154
G1 X79.085 Y102.988 E.04908
G1 X78.552 Y102.988
G1 X77.386 Y104.154 E.04908
G1 X76.853 Y104.154
G1 X78.018 Y102.988 E.04908
G1 X77.485 Y102.988
G1 X76.32 Y104.154 E.04908
G1 X75.787 Y104.154
G1 X76.952 Y102.988 E.04908
G1 X76.419 Y102.988
G1 X75.253 Y104.154 E.04908
G1 X74.817 Y104.057
G1 X75.885 Y102.988 E.04503
G1 X75.352 Y102.988
G1 X74.817 Y103.524 E.02256
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X75.352 Y102.988 E-.28784
G1 X75.885 Y102.988 E-.20264
G1 X75.384 Y103.49 E-.26952
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 15/17
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z3.2 I1.217 J0 P1  F15000
; object ids of layer 15 start: 470,481,503,525
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
; object ids of this layer15 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.251 Y164.223
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.251 Y215.428 E1.64654
G1 X63.242 Y215.428 E.64283
G1 X63.242 Y216.224 E.02559
G1 X42.456 Y216.224 E.66843
G1 X42.456 Y163.428 E1.69772
G1 X63.242 Y163.428 E.66843
G1 X63.242 Y164.223 E.02559
G1 X43.311 Y164.223 E.6409
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.644 Y215.036 E1.50184
G1 X75.343 Y215.036 E.94423
G1 X75.343 Y216.616 E.04706
G1 X42.064 Y216.616 E.99129
G1 X42.064 Y163.036 E1.59597
G1 X75.343 Y163.036 E.99129
G1 X75.343 Y164.616 E.04706
G1 X43.704 Y164.616 E.94244
; WIPE_START
M204 S5000
G1 X43.701 Y166.616 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.048 Y163.826 Z3.4 F15000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X63.039 Y163.826 E.61397
; WIPE_START
G1 X61.039 Y163.826 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X68.671 Y163.799 Z3.4 F15000
G1 X75.136 Y163.777 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X74.602 Y163.243 E.0225
G1 X74.068 Y163.243
G1 X75.136 Y164.31 E.04497
G1 X74.7 Y164.408
G1 X73.535 Y163.243 E.04908
G1 X73.002 Y163.243
G1 X74.167 Y164.408 E.04908
G1 X73.634 Y164.408
G1 X72.469 Y163.243 E.04908
G1 X71.935 Y163.243
G1 X73.101 Y164.408 E.04908
G1 X72.567 Y164.408
G1 X71.402 Y163.243 E.04908
G1 X70.869 Y163.243
G1 X72.034 Y164.408 E.04908
G1 X71.501 Y164.408
G1 X70.336 Y163.243 E.04908
G1 X69.802 Y163.243
G1 X70.968 Y164.408 E.04908
G1 X70.434 Y164.408
G1 X69.269 Y163.243 E.04908
G1 X68.736 Y163.243
G1 X69.901 Y164.408 E.04908
G1 X69.368 Y164.408
G1 X68.203 Y163.243 E.04908
G1 X67.669 Y163.243
G1 X68.835 Y164.408 E.04908
G1 X68.301 Y164.408
G1 X67.136 Y163.243 E.04908
G1 X66.603 Y163.243
G1 X67.768 Y164.408 E.04908
G1 X67.235 Y164.408
G1 X66.07 Y163.243 E.04908
G1 X65.536 Y163.243
G1 X66.702 Y164.408 E.04908
G1 X66.168 Y164.408
G1 X65.003 Y163.243 E.04908
G1 X64.47 Y163.243
G1 X65.635 Y164.408 E.04908
G1 X65.102 Y164.408
G1 X63.937 Y163.243 E.04908
G1 X63.465 Y163.304
G1 X64.569 Y164.408 E.04649
G1 X64.035 Y164.408
G1 X63.465 Y163.838 E.02403
; WIPE_START
M204 S5000
G1 X64.035 Y164.408 E-.30657
G1 X64.569 Y164.408 E-.20264
G1 X64.102 Y163.941 E-.25079
; WIPE_END
G1 E-.04 F1800
G1 X56.47 Y163.899 Z3.4 F15000
G1 X43.048 Y163.826 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X42.967 Y163.842 E.00263
; LINE_WIDTH: 0.470635
G1 X42.887 Y163.859 E.00278
G1 X42.854 Y164.02 E.00556
; LINE_WIDTH: 0.43172
G1 X42.854 Y215.631 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.87 Y215.712 E.00263
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00278
G1 X43.048 Y215.826 E.00556
; LINE_WIDTH: 0.43172
G1 X63.039 Y215.826 E.61397
; WIPE_START
G1 X61.039 Y215.826 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X68.67 Y215.94 Z3.4 F15000
G1 X75.136 Y216.036 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
M73 P91 R2
G1 X74.343 Y215.243 E.03342
G1 X73.809 Y215.243
G1 X74.974 Y216.408 E.04908
G1 X74.441 Y216.408
G1 X73.276 Y215.243 E.04908
G1 X72.743 Y215.243
G1 X73.908 Y216.408 E.04908
G1 X73.375 Y216.408
G1 X72.209 Y215.243 E.04908
G1 X71.676 Y215.243
G1 X72.841 Y216.408 E.04908
G1 X72.308 Y216.408
G1 X71.143 Y215.243 E.04908
G1 X70.61 Y215.243
G1 X71.775 Y216.408 E.04908
G1 X71.242 Y216.408
G1 X70.076 Y215.243 E.04908
G1 X69.543 Y215.243
G1 X70.708 Y216.408 E.04908
G1 X70.175 Y216.408
G1 X69.01 Y215.243 E.04908
G1 X68.477 Y215.243
G1 X69.642 Y216.408 E.04908
G1 X69.109 Y216.408
G1 X67.943 Y215.243 E.04908
G1 X67.41 Y215.243
G1 X68.575 Y216.408 E.04908
G1 X68.042 Y216.408
G1 X66.877 Y215.243 E.04908
G1 X66.344 Y215.243
G1 X67.509 Y216.408 E.04908
G1 X66.976 Y216.408
G1 X65.81 Y215.243 E.04908
G1 X65.277 Y215.243
G1 X66.442 Y216.408 E.04908
G1 X65.909 Y216.408
G1 X64.744 Y215.243 E.04908
G1 X64.211 Y215.243
G1 X65.376 Y216.408 E.04908
G1 X64.843 Y216.408
G1 X63.677 Y215.243 E.04908
G1 X63.465 Y215.564
G1 X64.309 Y216.408 E.03557
; WIPE_START
M204 S5000
G1 X63.465 Y215.564 E-.45384
G1 X63.677 Y215.243 E-.14621
G1 X63.975 Y215.541 E-.15996
; WIPE_END
G1 E-.04 F1800
G1 X71.583 Y216.145 Z3.4 F15000
G1 X75.127 Y216.427 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.097951
G1 F7500
G1 X75.127 Y216.045 E.00166
; OBJECT_ID: 503
; WIPE_START
G1 X75.127 Y216.427 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X79.886 Y210.46 Z3.4 F15000
G1 X140.057 Y135.01 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.057 Y186.215 E1.64654
G1 X160.048 Y186.215 E.64283
G1 X160.048 Y187.01 E.02559
G1 X139.261 Y187.01 E.66843
G1 X139.261 Y134.215 E1.69772
G1 X160.048 Y134.215 E.66843
G1 X160.048 Y135.01 E.02559
G1 X140.117 Y135.01 E.6409
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X140.449 Y185.823 E1.50184
G1 X172.149 Y185.823 E.94423
G1 X172.149 Y187.403 E.04706
G1 X138.869 Y187.403 E.99129
G1 X138.869 Y133.823 E1.59597
G1 X172.149 Y133.823 E.99129
G1 X172.149 Y135.403 E.04706
G1 X140.509 Y135.403 E.94244
; WIPE_START
M204 S5000
G1 X140.506 Y137.403 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.853 Y134.613 Z3.4 F15000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X159.844 Y134.613 E.61397
; WIPE_START
G1 X157.844 Y134.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X165.476 Y134.586 Z3.4 F15000
G1 X171.941 Y134.564 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X171.407 Y134.03 E.0225
G1 X170.874 Y134.03
G1 X171.941 Y135.097 E.04497
G1 X171.506 Y135.195
G1 X170.34 Y134.03 E.04908
G1 X169.807 Y134.03
G1 X170.972 Y135.195 E.04908
G1 X170.439 Y135.195
G1 X169.274 Y134.03 E.04908
G1 X168.741 Y134.03
G1 X169.906 Y135.195 E.04908
G1 X169.373 Y135.195
G1 X168.207 Y134.03 E.04908
G1 X167.674 Y134.03
G1 X168.839 Y135.195 E.04908
G1 X168.306 Y135.195
G1 X167.141 Y134.03 E.04908
G1 X166.608 Y134.03
G1 X167.773 Y135.195 E.04908
G1 X167.24 Y135.195
G1 X166.074 Y134.03 E.04908
G1 X165.541 Y134.03
G1 X166.706 Y135.195 E.04908
G1 X166.173 Y135.195
G1 X165.008 Y134.03 E.04908
G1 X164.475 Y134.03
G1 X165.64 Y135.195 E.04908
G1 X165.107 Y135.195
G1 X163.941 Y134.03 E.04908
G1 X163.408 Y134.03
G1 X164.573 Y135.195 E.04908
G1 X164.04 Y135.195
G1 X162.875 Y134.03 E.04908
G1 X162.342 Y134.03
G1 X163.507 Y135.195 E.04908
G1 X162.974 Y135.195
G1 X161.808 Y134.03 E.04908
G1 X161.275 Y134.03
G1 X162.44 Y135.195 E.04908
G1 X161.907 Y135.195
G1 X160.742 Y134.03 E.04908
G1 X160.27 Y134.091
G1 X161.374 Y135.195 E.04649
G1 X160.841 Y135.195
G1 X160.27 Y134.625 E.02403
; WIPE_START
M204 S5000
G1 X160.841 Y135.195 E-.30657
G1 X161.374 Y135.195 E-.20264
G1 X160.907 Y134.728 E-.25079
; WIPE_END
G1 E-.04 F1800
G1 X153.275 Y134.686 Z3.4 F15000
G1 X139.853 Y134.613 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X139.773 Y134.629 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y134.646 E.00278
G1 X139.659 Y134.807 E.00556
; LINE_WIDTH: 0.43172
G1 X139.659 Y186.418 E1.5851
; LINE_WIDTH: 0.448395
G1 X139.675 Y186.499 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00278
G1 X139.853 Y186.613 E.00556
; LINE_WIDTH: 0.43172
G1 X159.844 Y186.613 E.61397
; WIPE_START
G1 X157.844 Y186.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X165.476 Y186.727 Z3.4 F15000
G1 X171.941 Y186.823 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X171.148 Y186.03 E.03342
G1 X170.615 Y186.03
G1 X171.78 Y187.195 E.04908
G1 X171.246 Y187.195
G1 X170.081 Y186.03 E.04908
G1 X169.548 Y186.03
G1 X170.713 Y187.195 E.04908
G1 X170.18 Y187.195
G1 X169.015 Y186.03 E.04908
G1 X168.481 Y186.03
G1 X169.647 Y187.195 E.04908
G1 X169.113 Y187.195
G1 X167.948 Y186.03 E.04908
G1 X167.415 Y186.03
G1 X168.58 Y187.195 E.04908
G1 X168.047 Y187.195
G1 X166.882 Y186.03 E.04908
G1 X166.348 Y186.03
G1 X167.514 Y187.195 E.04908
G1 X166.98 Y187.195
G1 X165.815 Y186.03 E.04908
G1 X165.282 Y186.03
G1 X166.447 Y187.195 E.04908
G1 X165.914 Y187.195
G1 X164.749 Y186.03 E.04908
G1 X164.215 Y186.03
G1 X165.381 Y187.195 E.04908
G1 X164.847 Y187.195
G1 X163.682 Y186.03 E.04908
G1 X163.149 Y186.03
G1 X164.314 Y187.195 E.04908
G1 X163.781 Y187.195
G1 X162.616 Y186.03 E.04908
G1 X162.082 Y186.03
G1 X163.248 Y187.195 E.04908
G1 X162.714 Y187.195
G1 X161.549 Y186.03 E.04908
G1 X161.016 Y186.03
G1 X162.181 Y187.195 E.04908
G1 X161.648 Y187.195
G1 X160.483 Y186.03 E.04908
G1 X160.27 Y186.351
G1 X161.115 Y187.195 E.03557
; WIPE_START
M204 S5000
G1 X160.27 Y186.351 E-.45384
G1 X160.483 Y186.03 E-.14621
G1 X160.78 Y186.328 E-.15996
; WIPE_END
G1 E-.04 F1800
G1 X168.389 Y186.932 Z3.4 F15000
G1 X171.933 Y187.214 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.097951
G1 F7500
G1 X171.933 Y186.832 E.00166
; OBJECT_ID: 470
; WIPE_START
G1 X171.933 Y187.214 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X170.403 Y179.736 Z3.4 F15000
G1 X141.019 Y36.053 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X141.019 Y87.257 E1.64654
G1 X161.01 Y87.257 E.64283
G1 X161.01 Y88.053 E.02559
G1 X140.223 Y88.053 E.66843
G1 X140.223 Y35.257 E1.69772
G1 X161.01 Y35.257 E.66843
G1 X161.01 Y36.053 E.02559
G1 X141.079 Y36.053 E.6409
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X141.411 Y86.865 E1.50184
G1 X173.111 Y86.865 E.94423
G1 X173.111 Y88.445 E.04706
G1 X139.831 Y88.445 E.99129
G1 X139.831 Y34.865 E1.59597
G1 X173.111 Y34.865 E.99129
G1 X173.111 Y36.445 E.04706
G1 X141.471 Y36.445 E.94244
; WIPE_START
M204 S5000
G1 X141.469 Y38.445 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.816 Y35.655 Z3.4 F15000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X160.807 Y35.655 E.61397
; WIPE_START
G1 X158.807 Y35.655 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X166.439 Y35.628 Z3.4 F15000
G1 X172.904 Y35.606 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X172.369 Y35.072 E.0225
G1 X171.836 Y35.072
G1 X172.904 Y36.14 E.04497
G1 X172.468 Y36.237
G1 X171.303 Y35.072 E.04908
G1 X170.77 Y35.072
G1 X171.935 Y36.237 E.04908
G1 X171.402 Y36.237
G1 X170.236 Y35.072 E.04908
G1 X169.703 Y35.072
G1 X170.868 Y36.237 E.04908
G1 X170.335 Y36.237
G1 X169.17 Y35.072 E.04908
G1 X168.637 Y35.072
G1 X169.802 Y36.237 E.04908
G1 X169.269 Y36.237
G1 X168.103 Y35.072 E.04908
G1 X167.57 Y35.072
G1 X168.735 Y36.237 E.04908
G1 X168.202 Y36.237
G1 X167.037 Y35.072 E.04908
G1 X166.504 Y35.072
G1 X167.669 Y36.237 E.04908
G1 X167.136 Y36.237
G1 X165.97 Y35.072 E.04908
G1 X165.437 Y35.072
M73 P92 R2
G1 X166.602 Y36.237 E.04908
G1 X166.069 Y36.237
G1 X164.904 Y35.072 E.04908
G1 X164.371 Y35.072
G1 X165.536 Y36.237 E.04908
G1 X165.003 Y36.237
G1 X163.837 Y35.072 E.04908
G1 X163.304 Y35.072
G1 X164.469 Y36.237 E.04908
G1 X163.936 Y36.237
G1 X162.771 Y35.072 E.04908
G1 X162.238 Y35.072
G1 X163.403 Y36.237 E.04908
G1 X162.87 Y36.237
G1 X161.704 Y35.072 E.04908
G1 X161.233 Y35.134
G1 X162.336 Y36.237 E.04649
G1 X161.803 Y36.237
G1 X161.233 Y35.667 E.02403
; WIPE_START
M204 S5000
G1 X161.803 Y36.237 E-.30657
G1 X162.336 Y36.237 E-.20264
G1 X161.87 Y35.771 E-.25079
; WIPE_END
G1 E-.04 F1800
G1 X154.237 Y35.729 Z3.4 F15000
G1 X140.816 Y35.655 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X140.735 Y35.671 E.00263
; LINE_WIDTH: 0.470635
G1 X140.655 Y35.688 E.00278
G1 X140.621 Y35.849 E.00556
; LINE_WIDTH: 0.43172
G1 X140.621 Y87.46 E1.5851
; LINE_WIDTH: 0.448395
G1 X140.638 Y87.541 E.00263
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00278
G1 X140.816 Y87.655 E.00556
; LINE_WIDTH: 0.43172
G1 X160.806 Y87.655 E.61397
; WIPE_START
G1 X158.806 Y87.655 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X166.438 Y87.769 Z3.4 F15000
G1 X172.904 Y87.866 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X172.11 Y87.072 E.03342
G1 X171.577 Y87.072
G1 X172.742 Y88.237 E.04908
G1 X172.209 Y88.237
G1 X171.044 Y87.072 E.04908
G1 X170.51 Y87.072
G1 X171.676 Y88.237 E.04908
G1 X171.142 Y88.237
G1 X169.977 Y87.072 E.04908
G1 X169.444 Y87.072
G1 X170.609 Y88.237 E.04908
G1 X170.076 Y88.237
G1 X168.911 Y87.072 E.04908
G1 X168.377 Y87.072
G1 X169.543 Y88.237 E.04908
G1 X169.009 Y88.237
G1 X167.844 Y87.072 E.04908
G1 X167.311 Y87.072
G1 X168.476 Y88.237 E.04908
G1 X167.943 Y88.237
G1 X166.778 Y87.072 E.04908
G1 X166.244 Y87.072
G1 X167.41 Y88.237 E.04908
G1 X166.876 Y88.237
G1 X165.711 Y87.072 E.04908
G1 X165.178 Y87.072
G1 X166.343 Y88.237 E.04908
G1 X165.81 Y88.237
G1 X164.645 Y87.072 E.04908
G1 X164.111 Y87.072
G1 X165.277 Y88.237 E.04908
G1 X164.743 Y88.237
G1 X163.578 Y87.072 E.04908
G1 X163.045 Y87.072
G1 X164.21 Y88.237 E.04908
G1 X163.677 Y88.237
G1 X162.512 Y87.072 E.04908
G1 X161.978 Y87.072
G1 X163.144 Y88.237 E.04908
G1 X162.61 Y88.237
G1 X161.445 Y87.072 E.04908
G1 X161.233 Y87.393
G1 X162.077 Y88.237 E.03557
; WIPE_START
M204 S5000
G1 X161.233 Y87.393 E-.45384
G1 X161.445 Y87.072 E-.14621
G1 X161.743 Y87.37 E-.15996
; WIPE_END
G1 E-.04 F1800
G1 X169.351 Y87.974 Z3.4 F15000
G1 X172.895 Y88.256 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.097951
G1 F7500
G1 X172.895 Y87.874 E.00166
; OBJECT_ID: 481
; WIPE_START
G1 X172.895 Y88.256 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X165.546 Y86.197 Z3.4 F15000
G1 X43.37 Y51.969 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.37 Y103.173 E1.64654
G1 X63.361 Y103.173 E.64283
G1 X63.361 Y103.969 E.02559
G1 X42.574 Y103.969 E.66843
G1 X42.574 Y51.173 E1.69772
G1 X63.361 Y51.173 E.66843
G1 X63.361 Y51.969 E.02559
G1 X43.43 Y51.969 E.6409
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.762 Y102.781 E1.50184
G1 X75.462 Y102.781 E.94423
G1 X75.462 Y104.361 E.04706
G1 X42.182 Y104.361 E.99129
G1 X42.182 Y50.781 E1.59597
G1 X75.462 Y50.781 E.99129
G1 X75.462 Y52.361 E.04706
G1 X43.822 Y52.361 E.94244
; WIPE_START
M204 S5000
G1 X43.82 Y54.361 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.166 Y51.571 Z3.4 F15000
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X63.157 Y51.571 E.61397
; WIPE_START
G1 X61.157 Y51.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X68.79 Y51.545 Z3.4 F15000
G1 X75.254 Y51.523 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X74.72 Y50.988 E.0225
G1 X74.187 Y50.988
G1 X75.254 Y52.056 E.04497
G1 X74.819 Y52.154
G1 X73.654 Y50.988 E.04908
G1 X73.12 Y50.988
G1 X74.286 Y52.154 E.04908
G1 X73.752 Y52.154
G1 X72.587 Y50.988 E.04908
G1 X72.054 Y50.988
G1 X73.219 Y52.154 E.04908
G1 X72.686 Y52.154
G1 X71.521 Y50.988 E.04908
G1 X70.987 Y50.988
G1 X72.153 Y52.154 E.04908
G1 X71.619 Y52.154
G1 X70.454 Y50.988 E.04908
G1 X69.921 Y50.988
G1 X71.086 Y52.154 E.04908
G1 X70.553 Y52.154
G1 X69.388 Y50.988 E.04908
G1 X68.854 Y50.988
G1 X70.02 Y52.154 E.04908
G1 X69.486 Y52.154
G1 X68.321 Y50.988 E.04908
G1 X67.788 Y50.988
G1 X68.953 Y52.154 E.04908
G1 X68.42 Y52.154
G1 X67.255 Y50.988 E.04908
G1 X66.721 Y50.988
G1 X67.887 Y52.154 E.04908
G1 X67.353 Y52.154
G1 X66.188 Y50.988 E.04908
G1 X65.655 Y50.988
G1 X66.82 Y52.154 E.04908
G1 X66.287 Y52.154
G1 X65.122 Y50.988 E.04908
G1 X64.588 Y50.988
G1 X65.754 Y52.154 E.04908
G1 X65.22 Y52.154
G1 X64.055 Y50.988 E.04908
G1 X63.583 Y51.05
G1 X64.687 Y52.154 E.04649
G1 X64.154 Y52.154
G1 X63.583 Y51.583 E.02403
; WIPE_START
M204 S5000
G1 X64.154 Y52.154 E-.30657
G1 X64.687 Y52.154 E-.20264
G1 X64.22 Y51.687 E-.25079
; WIPE_END
G1 E-.04 F1800
G1 X56.588 Y51.645 Z3.4 F15000
G1 X43.166 Y51.571 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X43.086 Y51.588 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y51.604 E.00278
G1 X42.972 Y51.765 E.00556
; LINE_WIDTH: 0.43172
G1 X42.972 Y103.377 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.989 Y103.457 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00278
G1 X43.166 Y103.571 E.00556
; LINE_WIDTH: 0.43172
G1 X63.157 Y103.571 E.61397
; WIPE_START
G1 X61.157 Y103.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X68.789 Y103.685 Z3.4 F15000
G1 X75.254 Y103.782 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X74.461 Y102.988 E.03342
G1 X73.928 Y102.988
G1 X75.093 Y104.154 E.04908
G1 X74.56 Y104.154
G1 X73.394 Y102.988 E.04908
G1 X72.861 Y102.988
G1 X74.026 Y104.154 E.04908
G1 X73.493 Y104.154
G1 X72.328 Y102.988 E.04908
G1 X71.795 Y102.988
G1 X72.96 Y104.154 E.04908
G1 X72.427 Y104.154
G1 X71.261 Y102.988 E.04908
G1 X70.728 Y102.988
G1 X71.893 Y104.154 E.04908
G1 X71.36 Y104.154
G1 X70.195 Y102.988 E.04908
G1 X69.662 Y102.988
G1 X70.827 Y104.154 E.04908
G1 X70.294 Y104.154
G1 X69.128 Y102.988 E.04908
G1 X68.595 Y102.988
G1 X69.76 Y104.154 E.04908
G1 X69.227 Y104.154
G1 X68.062 Y102.988 E.04908
G1 X67.529 Y102.988
G1 X68.694 Y104.154 E.04908
G1 X68.161 Y104.154
G1 X66.995 Y102.988 E.04908
G1 X66.462 Y102.988
G1 X67.627 Y104.154 E.04908
G1 X67.094 Y104.154
G1 X65.929 Y102.988 E.04908
G1 X65.396 Y102.988
G1 X66.561 Y104.154 E.04908
G1 X66.028 Y104.154
G1 X64.862 Y102.988 E.04908
G1 X64.329 Y102.988
G1 X65.494 Y104.154 E.04908
G1 X64.961 Y104.154
G1 X63.796 Y102.988 E.04908
G1 X63.583 Y103.309
G1 X64.428 Y104.154 E.03557
; WIPE_START
M204 S5000
G1 X63.583 Y103.309 E-.45384
G1 X63.796 Y102.988 E-.14621
G1 X64.093 Y103.286 E-.15996
; WIPE_END
G1 E-.04 F1800
M73 P93 R2
G1 X71.702 Y103.891 Z3.4 F15000
G1 X75.246 Y104.173 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.097951
G1 F7500
G1 X75.246 Y103.791 E.00166
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X75.246 Y104.173 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 16/17
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
G17
G3 Z3.4 I1.217 J0 P1  F15000
; object ids of layer 16 start: 470,481,503,525
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
; object ids of this layer16 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.251 Y164.223
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.251 Y215.428 E1.64654
G1 X52.009 Y215.428 E.28161
G1 X52.009 Y216.224 E.02559
G1 X42.456 Y216.224 E.3072
G1 X42.456 Y163.428 E1.69772
M73 P93 R1
G1 X52.009 Y163.428 E.3072
G1 X52.009 Y164.223 E.02559
G1 X43.311 Y164.223 E.27968
M204 S250
G1 X43.644 Y164.616 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.644 Y215.036 E1.50184
G1 X64.11 Y215.036 E.60963
G1 X64.11 Y216.616 E.04706
G1 X42.064 Y216.616 E.65669
G1 X42.064 Y163.036 E1.59597
G1 X64.11 Y163.036 E.65669
G1 X64.11 Y163.374 E.01007
G1 X64.11 Y164.616 E.037
G1 X43.704 Y164.616 E.60784
; WIPE_START
M204 S5000
G1 X43.701 Y166.616 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.048 Y163.826 Z3.6 F15000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X42.967 Y163.842 E.00263
; LINE_WIDTH: 0.470635
G1 X42.887 Y163.859 E.00278
G1 X42.854 Y164.02 E.00556
; LINE_WIDTH: 0.43172
G1 X42.854 Y215.631 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.87 Y215.712 E.00263
; LINE_WIDTH: 0.470635
G1 X42.887 Y215.792 E.00278
G1 X43.048 Y215.826 E.00556
; LINE_WIDTH: 0.43172
G1 X51.806 Y215.826 E.26897
; WIPE_START
G1 X49.806 Y215.826 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X57.438 Y215.871 Z3.6 F15000
G1 X63.903 Y215.909 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X63.403 Y216.408 E.02104
G1 X62.87 Y216.408
G1 X63.903 Y215.376 E.0435
G1 X63.502 Y215.243
G1 X62.337 Y216.408 E.04908
G1 X61.804 Y216.408
G1 X62.969 Y215.243 E.04908
G1 X62.436 Y215.243
G1 X61.27 Y216.408 E.04908
G1 X60.737 Y216.408
G1 X61.902 Y215.243 E.04908
G1 X61.369 Y215.243
G1 X60.204 Y216.408 E.04908
G1 X59.671 Y216.408
G1 X60.836 Y215.243 E.04908
G1 X60.302 Y215.243
G1 X59.137 Y216.408 E.04908
G1 X58.604 Y216.408
G1 X59.769 Y215.243 E.04908
G1 X59.236 Y215.243
G1 X58.071 Y216.408 E.04908
G1 X57.537 Y216.408
G1 X58.703 Y215.243 E.04908
G1 X58.169 Y215.243
G1 X57.004 Y216.408 E.04908
G1 X56.471 Y216.408
G1 X57.636 Y215.243 E.04908
G1 X57.103 Y215.243
G1 X55.938 Y216.408 E.04908
G1 X55.404 Y216.408
G1 X56.57 Y215.243 E.04908
G1 X56.036 Y215.243
G1 X54.871 Y216.408 E.04908
G1 X54.338 Y216.408
G1 X55.503 Y215.243 E.04908
G1 X54.97 Y215.243
G1 X53.805 Y216.408 E.04908
G1 X53.271 Y216.408
G1 X54.437 Y215.243 E.04908
G1 X53.903 Y215.243
G1 X52.738 Y216.408 E.04908
G1 X52.232 Y216.382
G1 X53.37 Y215.243 E.04796
G1 X52.837 Y215.243
G1 X52.232 Y215.848 E.0255
; WIPE_START
M204 S5000
G1 X52.837 Y215.243 E-.32531
G1 X53.37 Y215.243 E-.20264
G1 X52.938 Y215.675 E-.23206
; WIPE_END
G1 E-.04 F1800
G1 X52.772 Y208.044 Z3.6 F15000
G1 X51.806 Y163.826 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X43.048 Y163.826 E.26897
; WIPE_START
G1 X45.048 Y163.826 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.68 Y163.754 Z3.6 F15000
G1 X63.903 Y163.65 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X63.144 Y164.408 E.03196
G1 X62.611 Y164.408
G1 X63.776 Y163.243 E.04908
G1 X63.243 Y163.243
G1 X62.078 Y164.408 E.04908
G1 X61.544 Y164.408
G1 X62.71 Y163.243 E.04908
G1 X62.176 Y163.243
G1 X61.011 Y164.408 E.04908
G1 X60.478 Y164.408
G1 X61.643 Y163.243 E.04908
G1 X61.11 Y163.243
G1 X59.945 Y164.408 E.04908
G1 X59.411 Y164.408
G1 X60.577 Y163.243 E.04908
G1 X60.043 Y163.243
G1 X58.878 Y164.408 E.04908
G1 X58.345 Y164.408
G1 X59.51 Y163.243 E.04908
G1 X58.977 Y163.243
G1 X57.812 Y164.408 E.04908
G1 X57.278 Y164.408
G1 X58.444 Y163.243 E.04908
G1 X57.91 Y163.243
G1 X56.745 Y164.408 E.04908
G1 X56.212 Y164.408
G1 X57.377 Y163.243 E.04908
G1 X56.844 Y163.243
G1 X55.679 Y164.408 E.04908
G1 X55.145 Y164.408
G1 X56.31 Y163.243 E.04908
G1 X55.777 Y163.243
G1 X54.612 Y164.408 E.04908
G1 X54.079 Y164.408
G1 X55.244 Y163.243 E.04908
G1 X54.711 Y163.243
G1 X53.545 Y164.408 E.04908
G1 X53.012 Y164.408
G1 X54.177 Y163.243 E.04908
G1 X53.644 Y163.243
G1 X52.479 Y164.408 E.04908
G1 X52.232 Y164.122
G1 X53.111 Y163.243 E.03704
G1 X52.578 Y163.243
G1 X52.232 Y163.589 E.01458
; OBJECT_ID: 503
; WIPE_START
M204 S5000
G1 X52.578 Y163.243 E-.186
G1 X53.111 Y163.243 E-.20264
G1 X52.42 Y163.934 E-.37136
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X59.668 Y161.542 Z3.6 F15000
G1 X140.057 Y135.01 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X140.057 Y186.215 E1.64654
G1 X148.814 Y186.215 E.28161
G1 X148.814 Y187.01 E.02559
G1 X139.261 Y187.01 E.3072
G1 X139.261 Y134.215 E1.69772
G1 X148.814 Y134.215 E.3072
G1 X148.814 Y135.01 E.02559
G1 X140.117 Y135.01 E.27968
M204 S250
G1 X140.449 Y135.403 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X140.449 Y185.823 E1.50184
G1 X160.915 Y185.823 E.60963
G1 X160.915 Y187.403 E.04706
G1 X138.869 Y187.403 E.65669
G1 X138.869 Y133.823 E1.59597
G1 X160.915 Y133.823 E.65669
G1 X160.915 Y134.16 E.01007
G1 X160.915 Y135.403 E.037
G1 X140.509 Y135.403 E.60784
; WIPE_START
M204 S5000
G1 X140.506 Y137.403 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.853 Y134.613 Z3.6 F15000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X139.773 Y134.629 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y134.646 E.00278
G1 X139.659 Y134.807 E.00556
; LINE_WIDTH: 0.43172
G1 X139.659 Y186.418 E1.5851
; LINE_WIDTH: 0.448395
G1 X139.675 Y186.499 E.00263
; LINE_WIDTH: 0.470635
G1 X139.692 Y186.579 E.00278
G1 X139.853 Y186.613 E.00556
; LINE_WIDTH: 0.43172
G1 X148.611 Y186.613 E.26897
; WIPE_START
G1 X146.611 Y186.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X154.243 Y186.658 Z3.6 F15000
G1 X160.708 Y186.696 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X160.209 Y187.195 E.02104
G1 X159.675 Y187.195
G1 X160.708 Y186.162 E.0435
G1 X160.307 Y186.03
G1 X159.142 Y187.195 E.04908
G1 X158.609 Y187.195
G1 X159.774 Y186.03 E.04908
G1 X159.241 Y186.03
G1 X158.076 Y187.195 E.04908
G1 X157.542 Y187.195
G1 X158.708 Y186.03 E.04908
G1 X158.174 Y186.03
G1 X157.009 Y187.195 E.04908
G1 X156.476 Y187.195
G1 X157.641 Y186.03 E.04908
G1 X157.108 Y186.03
G1 X155.943 Y187.195 E.04908
G1 X155.409 Y187.195
G1 X156.575 Y186.03 E.04908
G1 X156.041 Y186.03
G1 X154.876 Y187.195 E.04908
G1 X154.343 Y187.195
G1 X155.508 Y186.03 E.04908
G1 X154.975 Y186.03
G1 X153.81 Y187.195 E.04908
G1 X153.276 Y187.195
G1 X154.441 Y186.03 E.04908
G1 X153.908 Y186.03
G1 X152.743 Y187.195 E.04908
G1 X152.21 Y187.195
G1 X153.375 Y186.03 E.04908
G1 X152.842 Y186.03
G1 X151.676 Y187.195 E.04908
G1 X151.143 Y187.195
G1 X152.308 Y186.03 E.04908
G1 X151.775 Y186.03
G1 X150.61 Y187.195 E.04908
G1 X150.077 Y187.195
G1 X151.242 Y186.03 E.04908
G1 X150.709 Y186.03
G1 X149.543 Y187.195 E.04908
G1 X149.037 Y187.168
G1 X150.175 Y186.03 E.04796
G1 X149.642 Y186.03
G1 X149.037 Y186.635 E.0255
; WIPE_START
M204 S5000
G1 X149.642 Y186.03 E-.32531
G1 X150.175 Y186.03 E-.20264
G1 X149.744 Y186.462 E-.23206
; WIPE_END
G1 E-.04 F1800
G1 X149.577 Y178.831 Z3.6 F15000
G1 X148.611 Y134.613 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X139.853 Y134.613 E.26897
; WIPE_START
G1 X141.853 Y134.613 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.485 Y134.541 Z3.6 F15000
G1 X160.708 Y134.436 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
M73 P94 R1
G1 X159.949 Y135.195 E.03196
G1 X159.416 Y135.195
G1 X160.581 Y134.03 E.04908
G1 X160.048 Y134.03
G1 X158.883 Y135.195 E.04908
G1 X158.35 Y135.195
G1 X159.515 Y134.03 E.04908
G1 X158.982 Y134.03
G1 X157.816 Y135.195 E.04908
G1 X157.283 Y135.195
G1 X158.448 Y134.03 E.04908
G1 X157.915 Y134.03
G1 X156.75 Y135.195 E.04908
G1 X156.217 Y135.195
G1 X157.382 Y134.03 E.04908
G1 X156.849 Y134.03
G1 X155.683 Y135.195 E.04908
G1 X155.15 Y135.195
G1 X156.315 Y134.03 E.04908
G1 X155.782 Y134.03
G1 X154.617 Y135.195 E.04908
G1 X154.084 Y135.195
G1 X155.249 Y134.03 E.04908
G1 X154.716 Y134.03
G1 X153.55 Y135.195 E.04908
G1 X153.017 Y135.195
G1 X154.182 Y134.03 E.04908
G1 X153.649 Y134.03
G1 X152.484 Y135.195 E.04908
G1 X151.951 Y135.195
G1 X153.116 Y134.03 E.04908
G1 X152.582 Y134.03
G1 X151.417 Y135.195 E.04908
G1 X150.884 Y135.195
G1 X152.049 Y134.03 E.04908
G1 X151.516 Y134.03
G1 X150.351 Y135.195 E.04908
G1 X149.817 Y135.195
G1 X150.983 Y134.03 E.04908
G1 X150.449 Y134.03
G1 X149.284 Y135.195 E.04908
G1 X149.037 Y134.909
G1 X149.916 Y134.03 E.03704
G1 X149.383 Y134.03
G1 X149.037 Y134.376 E.01458
; OBJECT_ID: 470
; WIPE_START
M204 S5000
G1 X149.383 Y134.03 E-.186
G1 X149.916 Y134.03 E-.20264
G1 X149.225 Y134.721 E-.37136
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X148.593 Y127.115 Z3.6 F15000
G1 X141.019 Y36.053 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X141.019 Y87.257 E1.64654
G1 X149.777 Y87.257 E.28161
G1 X149.777 Y88.053 E.02559
G1 X140.223 Y88.053 E.3072
G1 X140.223 Y35.257 E1.69772
G1 X149.777 Y35.257 E.3072
G1 X149.777 Y36.053 E.02559
G1 X141.079 Y36.053 E.27968
M204 S250
G1 X141.411 Y36.445 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X141.411 Y86.865 E1.50184
G1 X161.878 Y86.865 E.60963
G1 X161.878 Y88.445 E.04706
G1 X139.831 Y88.445 E.65669
G1 X139.831 Y34.865 E1.59597
G1 X161.878 Y34.865 E.65669
G1 X161.878 Y35.203 E.01007
G1 X161.878 Y36.445 E.037
G1 X141.471 Y36.445 E.60784
; WIPE_START
M204 S5000
G1 X141.469 Y38.445 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.816 Y35.655 Z3.6 F15000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X140.735 Y35.671 E.00263
; LINE_WIDTH: 0.470635
G1 X140.655 Y35.688 E.00278
G1 X140.621 Y35.849 E.00556
; LINE_WIDTH: 0.43172
G1 X140.621 Y87.46 E1.5851
; LINE_WIDTH: 0.448395
G1 X140.638 Y87.541 E.00263
; LINE_WIDTH: 0.470635
G1 X140.655 Y87.621 E.00278
G1 X140.816 Y87.655 E.00556
; LINE_WIDTH: 0.43172
G1 X149.573 Y87.655 E.26897
; WIPE_START
G1 X147.573 Y87.655 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X155.206 Y87.7 Z3.6 F15000
G1 X161.67 Y87.738 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X161.171 Y88.237 E.02104
G1 X160.638 Y88.237
G1 X161.67 Y87.205 E.0435
G1 X161.27 Y87.072
G1 X160.104 Y88.237 E.04908
G1 X159.571 Y88.237
G1 X160.736 Y87.072 E.04908
G1 X160.203 Y87.072
G1 X159.038 Y88.237 E.04908
G1 X158.505 Y88.237
G1 X159.67 Y87.072 E.04908
G1 X159.137 Y87.072
G1 X157.971 Y88.237 E.04908
G1 X157.438 Y88.237
G1 X158.603 Y87.072 E.04908
G1 X158.07 Y87.072
G1 X156.905 Y88.237 E.04908
G1 X156.372 Y88.237
G1 X157.537 Y87.072 E.04908
G1 X157.004 Y87.072
G1 X155.838 Y88.237 E.04908
G1 X155.305 Y88.237
G1 X156.47 Y87.072 E.04908
G1 X155.937 Y87.072
G1 X154.772 Y88.237 E.04908
G1 X154.239 Y88.237
G1 X155.404 Y87.072 E.04908
G1 X154.871 Y87.072
G1 X153.705 Y88.237 E.04908
G1 X153.172 Y88.237
G1 X154.337 Y87.072 E.04908
G1 X153.804 Y87.072
G1 X152.639 Y88.237 E.04908
G1 X152.106 Y88.237
G1 X153.271 Y87.072 E.04908
G1 X152.738 Y87.072
G1 X151.572 Y88.237 E.04908
G1 X151.039 Y88.237
G1 X152.204 Y87.072 E.04908
G1 X151.671 Y87.072
G1 X150.506 Y88.237 E.04908
G1 X149.999 Y88.211
G1 X151.138 Y87.072 E.04796
G1 X150.605 Y87.072
G1 X149.999 Y87.677 E.0255
; WIPE_START
M204 S5000
G1 X150.605 Y87.072 E-.32531
G1 X151.138 Y87.072 E-.20264
G1 X150.706 Y87.504 E-.23206
; WIPE_END
G1 E-.04 F1800
G1 X150.539 Y79.873 Z3.6 F15000
G1 X149.573 Y35.655 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X140.816 Y35.655 E.26897
; WIPE_START
G1 X142.816 Y35.655 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X150.448 Y35.583 Z3.6 F15000
G1 X161.67 Y35.479 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X160.912 Y36.237 E.03196
G1 X160.379 Y36.237
G1 X161.544 Y35.072 E.04908
G1 X161.011 Y35.072
G1 X159.845 Y36.237 E.04908
G1 X159.312 Y36.237
G1 X160.477 Y35.072 E.04908
G1 X159.944 Y35.072
G1 X158.779 Y36.237 E.04908
G1 X158.246 Y36.237
G1 X159.411 Y35.072 E.04908
G1 X158.877 Y35.072
G1 X157.712 Y36.237 E.04908
G1 X157.179 Y36.237
G1 X158.344 Y35.072 E.04908
G1 X157.811 Y35.072
G1 X156.646 Y36.237 E.04908
G1 X156.112 Y36.237
G1 X157.278 Y35.072 E.04908
G1 X156.744 Y35.072
G1 X155.579 Y36.237 E.04908
G1 X155.046 Y36.237
G1 X156.211 Y35.072 E.04908
G1 X155.678 Y35.072
G1 X154.513 Y36.237 E.04908
G1 X153.979 Y36.237
G1 X155.145 Y35.072 E.04908
G1 X154.611 Y35.072
G1 X153.446 Y36.237 E.04908
G1 X152.913 Y36.237
G1 X154.078 Y35.072 E.04908
G1 X153.545 Y35.072
G1 X152.38 Y36.237 E.04908
G1 X151.846 Y36.237
G1 X153.012 Y35.072 E.04908
G1 X152.478 Y35.072
G1 X151.313 Y36.237 E.04908
G1 X150.78 Y36.237
G1 X151.945 Y35.072 E.04908
G1 X151.412 Y35.072
G1 X150.247 Y36.237 E.04908
G1 X149.999 Y35.951
G1 X150.879 Y35.072 E.03704
G1 X150.345 Y35.072
G1 X149.999 Y35.418 E.01458
; OBJECT_ID: 481
; WIPE_START
M204 S5000
G1 X150.345 Y35.072 E-.186
G1 X150.879 Y35.072 E-.20264
G1 X150.188 Y35.763 E-.37136
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X142.641 Y36.908 Z3.6 F15000
G1 X43.37 Y51.969 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X43.37 Y103.173 E1.64654
G1 X52.127 Y103.173 E.28161
G1 X52.127 Y103.969 E.02559
G1 X42.574 Y103.969 E.3072
G1 X42.574 Y51.173 E1.69772
G1 X52.127 Y51.173 E.3072
G1 X52.127 Y51.969 E.02559
G1 X43.43 Y51.969 E.27968
M204 S250
G1 X43.762 Y52.361 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X43.762 Y102.781 E1.50184
G1 X64.229 Y102.781 E.60963
G1 X64.229 Y104.361 E.04706
G1 X42.182 Y104.361 E.65669
G1 X42.182 Y50.781 E1.59597
G1 X64.229 Y50.781 E.65669
G1 X64.229 Y51.119 E.01007
G1 X64.229 Y52.361 E.037
G1 X43.822 Y52.361 E.60784
; WIPE_START
M204 S5000
G1 X43.82 Y54.361 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X43.166 Y51.571 Z3.6 F15000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X43.086 Y51.588 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y51.604 E.00278
G1 X42.972 Y51.765 E.00556
; LINE_WIDTH: 0.43172
G1 X42.972 Y103.377 E1.5851
; LINE_WIDTH: 0.448395
G1 X42.989 Y103.457 E.00263
; LINE_WIDTH: 0.470635
G1 X43.005 Y103.538 E.00278
G1 X43.166 Y103.571 E.00556
; LINE_WIDTH: 0.43172
G1 X51.924 Y103.571 E.26897
; WIPE_START
G1 X49.924 Y103.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X57.556 Y103.616 Z3.6 F15000
G1 X64.021 Y103.654 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X63.522 Y104.154 E.02104
G1 X62.988 Y104.154
G1 X64.021 Y103.121 E.0435
G1 X63.62 Y102.989
G1 X62.455 Y104.154 E.04908
G1 X61.922 Y104.154
G1 X63.087 Y102.989 E.04908
G1 X62.554 Y102.989
G1 X61.389 Y104.154 E.04908
G1 X60.855 Y104.154
G1 X62.021 Y102.989 E.04908
G1 X61.487 Y102.988
G1 X60.322 Y104.154 E.04908
G1 X59.789 Y104.154
G1 X60.954 Y102.988 E.04908
G1 X60.421 Y102.988
G1 X59.256 Y104.154 E.04908
G1 X58.722 Y104.154
G1 X59.888 Y102.988 E.04908
G1 X59.354 Y102.988
G1 X58.189 Y104.154 E.04908
G1 X57.656 Y104.154
G1 X58.821 Y102.988 E.04908
G1 X58.288 Y102.988
G1 X57.123 Y104.154 E.04908
M73 P95 R1
G1 X56.589 Y104.154
G1 X57.755 Y102.988 E.04908
G1 X57.221 Y102.988
G1 X56.056 Y104.154 E.04908
G1 X55.523 Y104.154
G1 X56.688 Y102.988 E.04908
G1 X56.155 Y102.988
G1 X54.99 Y104.154 E.04908
G1 X54.456 Y104.154
G1 X55.622 Y102.988 E.04908
G1 X55.088 Y102.988
G1 X53.923 Y104.154 E.04908
G1 X53.39 Y104.154
G1 X54.555 Y102.988 E.04908
G1 X54.022 Y102.988
G1 X52.857 Y104.154 E.04908
G1 X52.35 Y104.127
G1 X53.489 Y102.988 E.04796
G1 X52.955 Y102.988
G1 X52.35 Y103.594 E.0255
; WIPE_START
M204 S5000
G1 X52.955 Y102.988 E-.32531
G1 X53.489 Y102.988 E-.20264
G1 X53.057 Y103.42 E-.23206
; WIPE_END
G1 E-.04 F1800
G1 X52.89 Y95.79 Z3.6 F15000
G1 X51.924 Y51.571 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X43.166 Y51.571 E.26897
; WIPE_START
G1 X45.166 Y51.571 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X52.798 Y51.5 Z3.6 F15000
G1 X64.021 Y51.395 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X63.263 Y52.154 E.03196
G1 X62.729 Y52.154
G1 X63.895 Y50.988 E.04908
G1 X63.361 Y50.988
G1 X62.196 Y52.154 E.04908
G1 X61.663 Y52.154
G1 X62.828 Y50.988 E.04908
G1 X62.295 Y50.988
G1 X61.13 Y52.154 E.04908
G1 X60.596 Y52.154
G1 X61.761 Y50.988 E.04908
G1 X61.228 Y50.988
G1 X60.063 Y52.154 E.04908
G1 X59.53 Y52.154
G1 X60.695 Y50.988 E.04908
G1 X60.162 Y50.988
G1 X58.996 Y52.154 E.04908
G1 X58.463 Y52.154
G1 X59.628 Y50.988 E.04908
G1 X59.095 Y50.988
G1 X57.93 Y52.154 E.04908
G1 X57.397 Y52.154
G1 X58.562 Y50.988 E.04908
G1 X58.029 Y50.988
G1 X56.863 Y52.154 E.04908
G1 X56.33 Y52.154
G1 X57.495 Y50.988 E.04908
G1 X56.962 Y50.988
G1 X55.797 Y52.154 E.04908
G1 X55.264 Y52.154
G1 X56.429 Y50.988 E.04908
G1 X55.896 Y50.988
G1 X54.73 Y52.154 E.04908
G1 X54.197 Y52.154
G1 X55.362 Y50.988 E.04908
G1 X54.829 Y50.988
G1 X53.664 Y52.154 E.04908
G1 X53.131 Y52.154
G1 X54.296 Y50.988 E.04908
G1 X53.763 Y50.988
G1 X52.597 Y52.154 E.04908
G1 X52.35 Y51.868
G1 X53.229 Y50.988 E.03704
G1 X52.696 Y50.988
G1 X52.35 Y51.335 E.01458
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X52.696 Y50.988 E-.186
G1 X53.229 Y50.988 E-.20264
G1 X52.538 Y51.68 E-.37136
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 481
M625
; layer num/total_layer_count: 17/17
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
G17
G3 Z3.6 I1.217 J0 P1  F15000
; object ids of layer 17 start: 470,481,503,525
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
; object ids of this layer17 end: 470,481,503,525
M625
; OBJECT_ID: 525
; start printing object, unique label id: 525
M624 CAAAAAAAAAA=
G1 X43.644 Y164.616
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6000
M204 S2500
G1 X43.644 Y215.036 E1.50184
G1 X52.877 Y215.036 E.27503
G1 X52.877 Y216.616 E.04706
G1 X42.064 Y216.616 E.32209
G1 X42.064 Y163.036 E1.59597
G1 X52.877 Y163.036 E.32209
G1 X52.877 Y164.616 E.04706
G1 X43.704 Y164.616 E.27324
; WIPE_START
M204 S5000
G1 X43.701 Y166.616 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X50.961 Y164.261 Z3.8 F15000
G1 X52.669 Y163.707 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X52.205 Y163.243 E.01957
G1 X51.672 Y163.243
G1 X52.669 Y164.241 E.04203
G1 X52.304 Y164.408
G1 X51.138 Y163.243 E.04909
G1 X50.605 Y163.243
G1 X51.77 Y164.408 E.04909
G1 X51.237 Y164.408
G1 X50.072 Y163.243 E.04909
G1 X49.539 Y163.243
G1 X50.704 Y164.408 E.04909
G1 X50.171 Y164.408
G1 X49.005 Y163.243 E.04909
G1 X48.472 Y163.243
G1 X49.637 Y164.408 E.04909
G1 X49.104 Y164.408
G1 X47.939 Y163.243 E.04909
G1 X47.406 Y163.243
G1 X48.571 Y164.408 E.04909
G1 X48.038 Y164.408
G1 X46.872 Y163.243 E.04909
G1 X46.339 Y163.243
G1 X47.504 Y164.408 E.04909
G1 X46.971 Y164.408
G1 X45.806 Y163.243 E.04909
G1 X45.273 Y163.243
G1 X46.438 Y164.408 E.04909
G1 X45.905 Y164.408
G1 X44.739 Y163.243 E.04909
G1 X44.206 Y163.243
G1 X45.371 Y164.408 E.04909
G1 X44.838 Y164.408
G1 X43.673 Y163.243 E.04909
G1 X43.14 Y163.243
G1 X44.305 Y164.408 E.04909
G1 X43.772 Y164.408
G1 X42.606 Y163.243 E.04909
G1 X42.271 Y163.441
G1 X43.436 Y164.606 E.04909
G1 X43.436 Y165.139
G1 X42.271 Y163.974 E.04909
G1 X42.271 Y164.507
G1 X43.436 Y165.673 E.04909
G1 X43.436 Y166.206
G1 X42.271 Y165.041 E.04909
G1 X42.271 Y165.574
G1 X43.436 Y166.739 E.04909
G1 X43.436 Y167.272
G1 X42.271 Y166.107 E.04909
G1 X42.271 Y166.64
G1 X43.436 Y167.806 E.04909
G1 X43.436 Y168.339
G1 X42.271 Y167.174 E.04909
G1 X42.271 Y167.707
G1 X43.436 Y168.872 E.04909
G1 X43.436 Y169.405
G1 X42.271 Y168.24 E.04909
G1 X42.271 Y168.773
G1 X43.436 Y169.939 E.04909
G1 X43.436 Y170.472
G1 X42.271 Y169.307 E.04909
G1 X42.271 Y169.84
G1 X43.436 Y171.005 E.04909
G1 X43.436 Y171.538
G1 X42.271 Y170.373 E.04909
G1 X42.271 Y170.906
G1 X43.436 Y172.072 E.04909
G1 X43.436 Y172.605
G1 X42.271 Y171.44 E.04909
G1 X42.271 Y171.973
G1 X43.436 Y173.138 E.04909
G1 X43.436 Y173.671
G1 X42.271 Y172.506 E.04909
G1 X42.271 Y173.039
G1 X43.436 Y174.205 E.04909
G1 X43.436 Y174.738
G1 X42.271 Y173.573 E.04909
G1 X42.271 Y174.106
G1 X43.436 Y175.271 E.04909
G1 X43.436 Y175.804
G1 X42.271 Y174.639 E.04909
G1 X42.271 Y175.173
G1 X43.436 Y176.338 E.04909
G1 X43.436 Y176.871
G1 X42.271 Y175.706 E.04909
G1 X42.271 Y176.239
G1 X43.436 Y177.404 E.04909
G1 X43.436 Y177.938
G1 X42.271 Y176.772 E.04909
G1 X42.271 Y177.306
G1 X43.436 Y178.471 E.04909
G1 X43.436 Y179.004
G1 X42.271 Y177.839 E.04909
G1 X42.271 Y178.372
G1 X43.436 Y179.537 E.04909
G1 X43.436 Y180.071
G1 X42.271 Y178.905 E.04909
G1 X42.271 Y179.439
G1 X43.436 Y180.604 E.04909
G1 X43.436 Y181.137
G1 X42.271 Y179.972 E.04909
G1 X42.271 Y180.505
G1 X43.436 Y181.67 E.04909
G1 X43.436 Y182.204
G1 X42.271 Y181.038 E.04909
G1 X42.271 Y181.572
G1 X43.436 Y182.737 E.04909
G1 X43.436 Y183.27
G1 X42.271 Y182.105 E.04909
G1 X42.271 Y182.638
G1 X43.436 Y183.803 E.04909
G1 X43.436 Y184.337
G1 X42.271 Y183.171 E.04909
G1 X42.271 Y183.705
G1 X43.436 Y184.87 E.04909
G1 X43.436 Y185.403
G1 X42.271 Y184.238 E.04909
G1 X42.271 Y184.771
G1 X43.436 Y185.936 E.04909
G1 X43.436 Y186.47
G1 X42.271 Y185.304 E.04909
G1 X42.271 Y185.838
G1 X43.436 Y187.003 E.04909
G1 X43.436 Y187.536
G1 X42.271 Y186.371 E.04909
G1 X42.271 Y186.904
G1 X43.436 Y188.069 E.04909
G1 X43.436 Y188.603
G1 X42.271 Y187.437 E.04909
G1 X42.271 Y187.971
G1 X43.436 Y189.136 E.04909
G1 X43.436 Y189.669
G1 X42.271 Y188.504 E.04909
G1 X42.271 Y189.037
G1 X43.436 Y190.202 E.04909
G1 X43.436 Y190.736
G1 X42.271 Y189.57 E.04909
G1 X42.271 Y190.104
G1 X43.436 Y191.269 E.04909
G1 X43.436 Y191.802
G1 X42.271 Y190.637 E.04909
G1 X42.271 Y191.17
G1 X43.436 Y192.335 E.04909
G1 X43.436 Y192.869
G1 X42.271 Y191.703 E.04909
G1 X42.271 Y192.237
G1 X43.436 Y193.402 E.04909
G1 X43.436 Y193.935
G1 X42.271 Y192.77 E.04909
G1 X42.271 Y193.303
G1 X43.436 Y194.469 E.04909
G1 X43.436 Y195.002
G1 X42.271 Y193.837 E.04909
G1 X42.271 Y194.37
G1 X43.436 Y195.535 E.04909
G1 X43.436 Y196.068
G1 X42.271 Y194.903 E.04909
G1 X42.271 Y195.436
G1 X43.436 Y196.602 E.04909
G1 X43.436 Y197.135
G1 X42.271 Y195.97 E.04909
G1 X42.271 Y196.503
G1 X43.436 Y197.668 E.04909
G1 X43.436 Y198.201
G1 X42.271 Y197.036 E.04909
G1 X42.271 Y197.569
G1 X43.436 Y198.735 E.04909
G1 X43.436 Y199.268
G1 X42.271 Y198.103 E.04909
G1 X42.271 Y198.636
G1 X43.436 Y199.801 E.04909
G1 X43.436 Y200.334
G1 X42.271 Y199.169 E.04909
G1 X42.271 Y199.702
G1 X43.436 Y200.868 E.04909
G1 X43.436 Y201.401
G1 X42.271 Y200.236 E.04909
G1 X42.271 Y200.769
G1 X43.436 Y201.934 E.04909
G1 X43.436 Y202.467
G1 X42.271 Y201.302 E.04909
G1 X42.271 Y201.835
G1 X43.436 Y203.001 E.04909
G1 X43.436 Y203.534
G1 X42.271 Y202.369 E.04909
G1 X42.271 Y202.902
G1 X43.436 Y204.067 E.04909
G1 X43.436 Y204.6
G1 X42.271 Y203.435 E.04909
G1 X42.271 Y203.968
G1 X43.436 Y205.134 E.04909
G1 X43.436 Y205.667
G1 X42.271 Y204.502 E.04909
G1 X42.271 Y205.035
G1 X43.436 Y206.2 E.04909
G1 X43.436 Y206.733
G1 X42.271 Y205.568 E.04909
G1 X42.271 Y206.101
G1 X43.436 Y207.267 E.04909
G1 X43.436 Y207.8
G1 X42.271 Y206.635 E.04909
G1 X42.271 Y207.168
G1 X43.436 Y208.333 E.04909
G1 X43.436 Y208.866
G1 X42.271 Y207.701 E.04909
G1 X42.271 Y208.234
G1 X43.436 Y209.4 E.04909
G1 X43.436 Y209.933
G1 X42.271 Y208.768 E.04909
G1 X42.271 Y209.301
G1 X43.436 Y210.466 E.04909
G1 X43.436 Y210.999
G1 X42.271 Y209.834 E.04909
G1 X42.271 Y210.367
G1 X43.436 Y211.533 E.04909
G1 X43.436 Y212.066
G1 X42.271 Y210.901 E.04909
G1 X42.271 Y211.434
G1 X43.436 Y212.599 E.04909
G1 X43.436 Y213.133
G1 X42.271 Y211.967 E.04909
G1 X42.271 Y212.501
G1 X43.436 Y213.666 E.04909
G1 X43.436 Y214.199
G1 X42.271 Y213.034 E.04909
G1 X42.271 Y213.567
G1 X43.436 Y214.732 E.04909
; WIPE_START
M204 S5000
M73 P96 R1
G1 X42.271 Y213.567 E-.62621
G1 X42.271 Y213.215 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X49.741 Y214.781 Z3.8 F15000
G1 X51.946 Y215.243 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X52.669 Y215.967 E.03049
G1 X52.578 Y216.408
G1 X51.412 Y215.243 E.04909
G1 X50.879 Y215.243
G1 X52.044 Y216.408 E.04909
G1 X51.511 Y216.408
G1 X50.346 Y215.243 E.04909
G1 X49.813 Y215.243
G1 X50.978 Y216.408 E.04909
G1 X50.445 Y216.408
G1 X49.279 Y215.243 E.04909
G1 X48.746 Y215.243
G1 X49.911 Y216.408 E.04909
G1 X49.378 Y216.408
G1 X48.213 Y215.243 E.04909
G1 X47.68 Y215.243
G1 X48.845 Y216.408 E.04909
G1 X48.312 Y216.408
G1 X47.146 Y215.243 E.04909
G1 X46.613 Y215.243
G1 X47.778 Y216.408 E.04909
G1 X47.245 Y216.408
G1 X46.08 Y215.243 E.04909
G1 X45.547 Y215.243
G1 X46.712 Y216.408 E.04909
G1 X46.179 Y216.408
G1 X45.013 Y215.243 E.04909
G1 X44.48 Y215.243
G1 X45.645 Y216.408 E.04909
G1 X45.112 Y216.408
G1 X43.947 Y215.243 E.04909
; WIPE_START
M204 S5000
G1 X45.112 Y216.408 E-.6262
G1 X45.464 Y216.408 E-.1338
; WIPE_END
G1 E-.04 F1800
G1 X44.579 Y216.408 Z3.8 F15000
G1 Z3.4
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X42.271 Y214.1 E.09722
G1 X42.271 Y214.634
G1 X44.046 Y216.408 E.07476
G1 X43.512 Y216.408
G1 X42.271 Y215.167 E.05229
G1 X42.271 Y215.7
G1 X42.979 Y216.408 E.02983
; OBJECT_ID: 503
; WIPE_START
M204 S5000
G1 X42.271 Y215.7 E-.38054
G1 X42.271 Y215.167 E-.20264
G1 X42.6 Y215.496 E-.17682
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 525
M625
; start printing object, unique label id: 503
M624 BAAAAAAAAAA=
G1 X48.506 Y210.661 Z3.8 F15000
G1 X140.449 Y135.403 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6000
M204 S2500
G1 X140.449 Y185.823 E1.50184
G1 X149.682 Y185.823 E.27503
G1 X149.682 Y187.403 E.04706
G1 X138.869 Y187.403 E.32209
G1 X138.869 Y133.823 E1.59597
G1 X149.682 Y133.823 E.32209
G1 X149.682 Y135.403 E.04706
G1 X140.509 Y135.403 E.27324
; WIPE_START
M204 S5000
G1 X140.506 Y137.403 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X147.767 Y135.048 Z3.8 F15000
G1 X149.475 Y134.494 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X149.01 Y134.03 E.01957
G1 X148.477 Y134.03
G1 X149.475 Y135.028 E.04203
G1 X149.109 Y135.195
G1 X147.944 Y134.03 E.04909
G1 X147.41 Y134.03
G1 X148.576 Y135.195 E.04909
G1 X148.042 Y135.195
G1 X146.877 Y134.03 E.04909
G1 X146.344 Y134.03
G1 X147.509 Y135.195 E.04909
G1 X146.976 Y135.195
G1 X145.811 Y134.03 E.04909
G1 X145.277 Y134.03
G1 X146.443 Y135.195 E.04909
G1 X145.909 Y135.195
G1 X144.744 Y134.03 E.04909
G1 X144.211 Y134.03
G1 X145.376 Y135.195 E.04909
G1 X144.843 Y135.195
G1 X143.678 Y134.03 E.04909
G1 X143.144 Y134.03
G1 X144.31 Y135.195 E.04909
G1 X143.776 Y135.195
G1 X142.611 Y134.03 E.04909
G1 X142.078 Y134.03
G1 X143.243 Y135.195 E.04909
G1 X142.71 Y135.195
G1 X141.545 Y134.03 E.04909
G1 X141.011 Y134.03
G1 X142.177 Y135.195 E.04909
G1 X141.643 Y135.195
G1 X140.478 Y134.03 E.04909
G1 X139.945 Y134.03
G1 X141.11 Y135.195 E.04909
G1 X140.577 Y135.195
G1 X139.412 Y134.03 E.04909
G1 X139.076 Y134.228
G1 X140.241 Y135.393 E.04909
G1 X140.241 Y135.926
G1 X139.076 Y134.761 E.04909
G1 X139.076 Y135.294
G1 X140.241 Y136.46 E.04909
G1 X140.241 Y136.993
G1 X139.076 Y135.828 E.04909
G1 X139.076 Y136.361
G1 X140.241 Y137.526 E.04909
G1 X140.241 Y138.059
G1 X139.076 Y136.894 E.04909
G1 X139.076 Y137.427
G1 X140.241 Y138.593 E.04909
G1 X140.241 Y139.126
G1 X139.076 Y137.961 E.04909
G1 X139.076 Y138.494
G1 X140.241 Y139.659 E.04909
G1 X140.241 Y140.192
G1 X139.076 Y139.027 E.04909
G1 X139.076 Y139.56
G1 X140.241 Y140.726 E.04909
G1 X140.241 Y141.259
G1 X139.076 Y140.094 E.04909
G1 X139.076 Y140.627
G1 X140.241 Y141.792 E.04909
G1 X140.241 Y142.325
G1 X139.076 Y141.16 E.04909
G1 X139.076 Y141.693
G1 X140.241 Y142.859 E.04909
G1 X140.241 Y143.392
G1 X139.076 Y142.227 E.04909
G1 X139.076 Y142.76
G1 X140.241 Y143.925 E.04909
G1 X140.241 Y144.458
G1 X139.076 Y143.293 E.04909
G1 X139.076 Y143.826
G1 X140.241 Y144.992 E.04909
G1 X140.241 Y145.525
G1 X139.076 Y144.36 E.04909
G1 X139.076 Y144.893
G1 X140.241 Y146.058 E.04909
G1 X140.241 Y146.591
G1 X139.076 Y145.426 E.04909
G1 X139.076 Y145.959
G1 X140.241 Y147.125 E.04909
G1 X140.241 Y147.658
G1 X139.076 Y146.493 E.04909
G1 X139.076 Y147.026
G1 X140.241 Y148.191 E.04909
G1 X140.241 Y148.724
G1 X139.076 Y147.559 E.04909
G1 X139.076 Y148.092
G1 X140.241 Y149.258 E.04909
G1 X140.241 Y149.791
G1 X139.076 Y148.626 E.04909
G1 X139.076 Y149.159
G1 X140.241 Y150.324 E.04909
G1 X140.241 Y150.858
G1 X139.076 Y149.692 E.04909
G1 X139.076 Y150.226
M73 P96 R0
G1 X140.241 Y151.391 E.04909
G1 X140.241 Y151.924
G1 X139.076 Y150.759 E.04909
G1 X139.076 Y151.292
G1 X140.241 Y152.457 E.04909
G1 X140.241 Y152.991
G1 X139.076 Y151.825 E.04909
G1 X139.076 Y152.359
G1 X140.241 Y153.524 E.04909
G1 X140.241 Y154.057
G1 X139.076 Y152.892 E.04909
G1 X139.076 Y153.425
G1 X140.241 Y154.59 E.04909
G1 X140.241 Y155.124
G1 X139.076 Y153.958 E.04909
G1 X139.076 Y154.492
G1 X140.241 Y155.657 E.04909
G1 X140.241 Y156.19
G1 X139.076 Y155.025 E.04909
G1 X139.076 Y155.558
G1 X140.241 Y156.723 E.04909
G1 X140.241 Y157.257
G1 X139.076 Y156.091 E.04909
G1 X139.076 Y156.625
G1 X140.241 Y157.79 E.04909
G1 X140.241 Y158.323
G1 X139.076 Y157.158 E.04909
G1 X139.076 Y157.691
G1 X140.241 Y158.856 E.04909
G1 X140.241 Y159.39
G1 X139.076 Y158.224 E.04909
G1 X139.076 Y158.758
G1 X140.241 Y159.923 E.04909
G1 X140.241 Y160.456
G1 X139.076 Y159.291 E.04909
G1 X139.076 Y159.824
G1 X140.241 Y160.989 E.04909
G1 X140.241 Y161.523
G1 X139.076 Y160.357 E.04909
G1 X139.076 Y160.891
G1 X140.241 Y162.056 E.04909
G1 X140.241 Y162.589
G1 X139.076 Y161.424 E.04909
G1 X139.076 Y161.957
G1 X140.241 Y163.122 E.04909
G1 X140.241 Y163.656
G1 X139.076 Y162.49 E.04909
G1 X139.076 Y163.024
G1 X140.241 Y164.189 E.04909
G1 X140.241 Y164.722
G1 X139.076 Y163.557 E.04909
G1 X139.076 Y164.09
G1 X140.241 Y165.255 E.04909
G1 X140.241 Y165.789
G1 X139.076 Y164.623 E.04909
G1 X139.076 Y165.157
G1 X140.241 Y166.322 E.04909
G1 X140.241 Y166.855
G1 X139.076 Y165.69 E.04909
G1 X139.076 Y166.223
G1 X140.241 Y167.388 E.04909
G1 X140.241 Y167.922
G1 X139.076 Y166.756 E.04909
G1 X139.076 Y167.29
G1 X140.241 Y168.455 E.04909
G1 X140.241 Y168.988
G1 X139.076 Y167.823 E.04909
G1 X139.076 Y168.356
G1 X140.241 Y169.522 E.04909
G1 X140.241 Y170.055
G1 X139.076 Y168.89 E.04909
G1 X139.076 Y169.423
G1 X140.241 Y170.588 E.04909
G1 X140.241 Y171.121
G1 X139.076 Y169.956 E.04909
G1 X139.076 Y170.489
G1 X140.241 Y171.655 E.04909
G1 X140.241 Y172.188
G1 X139.076 Y171.023 E.04909
G1 X139.076 Y171.556
G1 X140.241 Y172.721 E.04909
G1 X140.241 Y173.254
G1 X139.076 Y172.089 E.04909
G1 X139.076 Y172.622
G1 X140.241 Y173.788 E.04909
G1 X140.241 Y174.321
G1 X139.076 Y173.156 E.04909
G1 X139.076 Y173.689
G1 X140.241 Y174.854 E.04909
G1 X140.241 Y175.387
G1 X139.076 Y174.222 E.04909
G1 X139.076 Y174.755
G1 X140.241 Y175.921 E.04909
G1 X140.241 Y176.454
G1 X139.076 Y175.289 E.04909
G1 X139.076 Y175.822
G1 X140.241 Y176.987 E.04909
G1 X140.241 Y177.52
G1 X139.076 Y176.355 E.04909
G1 X139.076 Y176.888
G1 X140.241 Y178.054 E.04909
G1 X140.241 Y178.587
G1 X139.076 Y177.422 E.04909
G1 X139.076 Y177.955
G1 X140.241 Y179.12 E.04909
G1 X140.241 Y179.653
G1 X139.076 Y178.488 E.04909
G1 X139.076 Y179.021
G1 X140.241 Y180.187 E.04909
G1 X140.241 Y180.72
G1 X139.076 Y179.555 E.04909
G1 X139.076 Y180.088
G1 X140.241 Y181.253 E.04909
G1 X140.241 Y181.786
G1 X139.076 Y180.621 E.04909
G1 X139.076 Y181.154
G1 X140.241 Y182.32 E.04909
G1 X140.241 Y182.853
G1 X139.076 Y181.688 E.04909
G1 X139.076 Y182.221
G1 X140.241 Y183.386 E.04909
G1 X140.241 Y183.919
G1 X139.076 Y182.754 E.04909
G1 X139.076 Y183.287
G1 X140.241 Y184.453 E.04909
G1 X140.241 Y184.986
G1 X139.076 Y183.821 E.04909
G1 X139.076 Y184.354
G1 X140.241 Y185.519 E.04909
; WIPE_START
M204 S5000
G1 X139.076 Y184.354 E-.62621
G1 X139.076 Y184.002 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X146.546 Y185.568 Z3.8 F15000
G1 X148.751 Y186.03 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X149.475 Y186.754 E.03049
G1 X149.383 Y187.195
G1 X148.218 Y186.03 E.04909
G1 X147.684 Y186.03
G1 X148.85 Y187.195 E.04909
G1 X148.316 Y187.195
G1 X147.151 Y186.03 E.04909
G1 X146.618 Y186.03
G1 X147.783 Y187.195 E.04909
G1 X147.25 Y187.195
G1 X146.085 Y186.03 E.04909
G1 X145.551 Y186.03
G1 X146.717 Y187.195 E.04909
G1 X146.183 Y187.195
G1 X145.018 Y186.03 E.04909
G1 X144.485 Y186.03
G1 X145.65 Y187.195 E.04909
G1 X145.117 Y187.195
G1 X143.952 Y186.03 E.04909
G1 X143.418 Y186.03
G1 X144.584 Y187.195 E.04909
G1 X144.05 Y187.195
G1 X142.885 Y186.03 E.04909
G1 X142.352 Y186.03
G1 X143.517 Y187.195 E.04909
G1 X142.984 Y187.195
G1 X141.819 Y186.03 E.04909
G1 X141.285 Y186.03
G1 X142.451 Y187.195 E.04909
G1 X141.917 Y187.195
G1 X140.752 Y186.03 E.04909
; WIPE_START
M204 S5000
G1 X141.917 Y187.195 E-.6262
G1 X142.269 Y187.195 E-.1338
; WIPE_END
G1 E-.04 F1800
G1 X141.384 Y187.195 Z3.8 F15000
G1 Z3.4
M73 P97 R0
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X139.076 Y184.887 E.09722
G1 X139.076 Y185.421
G1 X140.851 Y187.195 E.07476
G1 X140.318 Y187.195
G1 X139.076 Y185.954 E.05229
G1 X139.076 Y186.487
G1 X139.784 Y187.195 E.02983
; OBJECT_ID: 470
; WIPE_START
M204 S5000
G1 X139.076 Y186.487 E-.38054
G1 X139.076 Y185.954 E-.20264
G1 X139.405 Y186.283 E-.17682
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 503
M625
; start printing object, unique label id: 470
M624 AQAAAAAAAAA=
G1 X139.507 Y178.651 Z3.8 F15000
G1 X141.411 Y36.445 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6000
M204 S2500
G1 X141.411 Y86.865 E1.50184
G1 X150.645 Y86.865 E.27503
G1 X150.645 Y88.445 E.04706
G1 X139.831 Y88.445 E.32209
G1 X139.831 Y34.865 E1.59597
G1 X150.645 Y34.865 E.32209
G1 X150.645 Y36.445 E.04706
G1 X141.471 Y36.445 E.27324
; WIPE_START
M204 S5000
G1 X141.469 Y38.445 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X148.729 Y36.09 Z3.8 F15000
G1 X150.437 Y35.537 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X149.973 Y35.072 E.01957
G1 X149.439 Y35.072
G1 X150.437 Y36.07 E.04203
G1 X150.071 Y36.237
G1 X148.906 Y35.072 E.04909
G1 X148.373 Y35.072
G1 X149.538 Y36.237 E.04909
G1 X149.005 Y36.237
G1 X147.84 Y35.072 E.04909
G1 X147.306 Y35.072
G1 X148.472 Y36.237 E.04909
G1 X147.938 Y36.237
G1 X146.773 Y35.072 E.04909
G1 X146.24 Y35.072
G1 X147.405 Y36.237 E.04909
G1 X146.872 Y36.237
G1 X145.707 Y35.072 E.04909
G1 X145.173 Y35.072
G1 X146.339 Y36.237 E.04909
G1 X145.805 Y36.237
G1 X144.64 Y35.072 E.04909
G1 X144.107 Y35.072
G1 X145.272 Y36.237 E.04909
G1 X144.739 Y36.237
G1 X143.574 Y35.072 E.04909
G1 X143.04 Y35.072
G1 X144.206 Y36.237 E.04909
G1 X143.672 Y36.237
G1 X142.507 Y35.072 E.04909
G1 X141.974 Y35.072
G1 X143.139 Y36.237 E.04909
G1 X142.606 Y36.237
G1 X141.44 Y35.072 E.04909
G1 X140.907 Y35.072
G1 X142.072 Y36.237 E.04909
G1 X141.539 Y36.237
G1 X140.374 Y35.072 E.04909
G1 X140.039 Y35.27
G1 X141.204 Y36.435 E.04909
G1 X141.204 Y36.968
G1 X140.039 Y35.803 E.04909
G1 X140.039 Y36.336
G1 X141.204 Y37.502 E.04909
G1 X141.204 Y38.035
G1 X140.039 Y36.87 E.04909
G1 X140.039 Y37.403
G1 X141.204 Y38.568 E.04909
G1 X141.204 Y39.101
G1 X140.039 Y37.936 E.04909
G1 X140.039 Y38.47
G1 X141.204 Y39.635 E.04909
G1 X141.204 Y40.168
G1 X140.039 Y39.003 E.04909
G1 X140.039 Y39.536
G1 X141.204 Y40.701 E.04909
G1 X141.204 Y41.235
G1 X140.039 Y40.069 E.04909
G1 X140.039 Y40.603
G1 X141.204 Y41.768 E.04909
G1 X141.204 Y42.301
G1 X140.039 Y41.136 E.04909
G1 X140.039 Y41.669
G1 X141.204 Y42.834 E.04909
G1 X141.204 Y43.368
G1 X140.039 Y42.202 E.04909
G1 X140.039 Y42.736
G1 X141.204 Y43.901 E.04909
G1 X141.204 Y44.434
G1 X140.039 Y43.269 E.04909
G1 X140.039 Y43.802
G1 X141.204 Y44.967 E.04909
G1 X141.204 Y45.501
G1 X140.039 Y44.335 E.04909
G1 X140.039 Y44.869
G1 X141.204 Y46.034 E.04909
G1 X141.204 Y46.567
G1 X140.039 Y45.402 E.04909
G1 X140.039 Y45.935
G1 X141.204 Y47.1 E.04909
G1 X141.204 Y47.634
G1 X140.039 Y46.468 E.04909
G1 X140.039 Y47.002
G1 X141.204 Y48.167 E.04909
G1 X141.204 Y48.7
G1 X140.039 Y47.535 E.04909
G1 X140.039 Y48.068
G1 X141.204 Y49.233 E.04909
G1 X141.204 Y49.767
G1 X140.039 Y48.601 E.04909
G1 X140.039 Y49.135
G1 X141.204 Y50.3 E.04909
G1 X141.204 Y50.833
G1 X140.039 Y49.668 E.04909
G1 X140.039 Y50.201
G1 X141.204 Y51.366 E.04909
G1 X141.204 Y51.9
G1 X140.039 Y50.734 E.04909
G1 X140.039 Y51.268
G1 X141.204 Y52.433 E.04909
G1 X141.204 Y52.966
G1 X140.039 Y51.801 E.04909
G1 X140.039 Y52.334
G1 X141.204 Y53.499 E.04909
G1 X141.204 Y54.033
G1 X140.039 Y52.867 E.04909
G1 X140.039 Y53.401
G1 X141.204 Y54.566 E.04909
G1 X141.204 Y55.099
G1 X140.039 Y53.934 E.04909
G1 X140.039 Y54.467
G1 X141.204 Y55.632 E.04909
G1 X141.204 Y56.166
G1 X140.039 Y55 E.04909
G1 X140.039 Y55.534
G1 X141.204 Y56.699 E.04909
G1 X141.204 Y57.232
G1 X140.039 Y56.067 E.04909
G1 X140.039 Y56.6
G1 X141.204 Y57.766 E.04909
G1 X141.204 Y58.299
G1 X140.039 Y57.134 E.04909
G1 X140.039 Y57.667
G1 X141.204 Y58.832 E.04909
G1 X141.204 Y59.365
G1 X140.039 Y58.2 E.04909
G1 X140.039 Y58.733
G1 X141.204 Y59.899 E.04909
G1 X141.204 Y60.432
G1 X140.039 Y59.267 E.04909
G1 X140.039 Y59.8
G1 X141.204 Y60.965 E.04909
G1 X141.204 Y61.498
G1 X140.039 Y60.333 E.04909
G1 X140.039 Y60.866
G1 X141.204 Y62.032 E.04909
G1 X141.204 Y62.565
G1 X140.039 Y61.4 E.04909
G1 X140.039 Y61.933
G1 X141.204 Y63.098 E.04909
G1 X141.204 Y63.631
G1 X140.039 Y62.466 E.04909
G1 X140.039 Y62.999
G1 X141.204 Y64.165 E.04909
G1 X141.204 Y64.698
G1 X140.039 Y63.533 E.04909
G1 X140.039 Y64.066
G1 X141.204 Y65.231 E.04909
G1 X141.204 Y65.764
G1 X140.039 Y64.599 E.04909
G1 X140.039 Y65.132
G1 X141.204 Y66.298 E.04909
G1 X141.204 Y66.831
G1 X140.039 Y65.666 E.04909
G1 X140.039 Y66.199
G1 X141.204 Y67.364 E.04909
G1 X141.204 Y67.897
G1 X140.039 Y66.732 E.04909
G1 X140.039 Y67.265
G1 X141.204 Y68.431 E.04909
G1 X141.204 Y68.964
G1 X140.039 Y67.799 E.04909
G1 X140.039 Y68.332
G1 X141.204 Y69.497 E.04909
G1 X141.204 Y70.03
G1 X140.039 Y68.865 E.04909
G1 X140.039 Y69.398
G1 X141.204 Y70.564 E.04909
G1 X141.204 Y71.097
G1 X140.039 Y69.932 E.04909
G1 X140.039 Y70.465
G1 X141.204 Y71.63 E.04909
G1 X141.204 Y72.163
G1 X140.039 Y70.998 E.04909
G1 X140.039 Y71.531
G1 X141.204 Y72.697 E.04909
G1 X141.204 Y73.23
G1 X140.039 Y72.065 E.04909
G1 X140.039 Y72.598
G1 X141.204 Y73.763 E.04909
G1 X141.204 Y74.296
G1 X140.039 Y73.131 E.04909
G1 X140.039 Y73.664
G1 X141.204 Y74.83 E.04909
G1 X141.204 Y75.363
G1 X140.039 Y74.198 E.04909
G1 X140.039 Y74.731
G1 X141.204 Y75.896 E.04909
G1 X141.204 Y76.43
G1 X140.039 Y75.264 E.04909
G1 X140.039 Y75.798
G1 X141.204 Y76.963 E.04909
G1 X141.204 Y77.496
G1 X140.039 Y76.331 E.04909
G1 X140.039 Y76.864
G1 X141.204 Y78.029 E.04909
G1 X141.204 Y78.563
G1 X140.039 Y77.397 E.04909
G1 X140.039 Y77.931
G1 X141.204 Y79.096 E.04909
G1 X141.204 Y79.629
G1 X140.039 Y78.464 E.04909
G1 X140.039 Y78.997
G1 X141.204 Y80.162 E.04909
G1 X141.204 Y80.696
G1 X140.039 Y79.53 E.04909
G1 X140.039 Y80.064
G1 X141.204 Y81.229 E.04909
G1 X141.204 Y81.762
G1 X140.039 Y80.597 E.04909
G1 X140.039 Y81.13
G1 X141.204 Y82.295 E.04909
G1 X141.204 Y82.829
G1 X140.039 Y81.663 E.04909
G1 X140.039 Y82.197
G1 X141.204 Y83.362 E.04909
G1 X141.204 Y83.895
G1 X140.039 Y82.73 E.04909
G1 X140.039 Y83.263
G1 X141.204 Y84.428 E.04909
G1 X141.204 Y84.962
G1 X140.039 Y83.796 E.04909
G1 X140.039 Y84.33
G1 X141.204 Y85.495 E.04909
G1 X141.204 Y86.028
G1 X140.039 Y84.863 E.04909
G1 X140.039 Y85.396
G1 X141.204 Y86.561 E.04909
; WIPE_START
M204 S5000
G1 X140.039 Y85.396 E-.62621
G1 X140.039 Y85.044 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X147.509 Y86.61 Z3.8 F15000
G1 X149.713 Y87.072 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X150.437 Y87.796 E.03049
G1 X150.345 Y88.237
G1 X149.18 Y87.072 E.04909
G1 X148.647 Y87.072
G1 X149.812 Y88.237 E.04909
G1 X149.279 Y88.237
G1 X148.114 Y87.072 E.04909
G1 X147.58 Y87.072
G1 X148.746 Y88.237 E.04909
G1 X148.212 Y88.237
G1 X147.047 Y87.072 E.04909
G1 X146.514 Y87.072
G1 X147.679 Y88.237 E.04909
G1 X147.146 Y88.237
G1 X145.981 Y87.072 E.04909
G1 X145.447 Y87.072
G1 X146.613 Y88.237 E.04909
G1 X146.079 Y88.237
G1 X144.914 Y87.072 E.04909
G1 X144.381 Y87.072
G1 X145.546 Y88.237 E.04909
G1 X145.013 Y88.237
G1 X143.848 Y87.072 E.04909
G1 X143.314 Y87.072
G1 X144.48 Y88.237 E.04909
G1 X143.946 Y88.237
G1 X142.781 Y87.072 E.04909
G1 X142.248 Y87.072
G1 X143.413 Y88.237 E.04909
G1 X142.88 Y88.237
G1 X141.715 Y87.072 E.04909
; WIPE_START
M204 S5000
G1 X142.88 Y88.237 E-.6262
G1 X143.232 Y88.237 E-.1338
; WIPE_END
G1 E-.04 F1800
G1 X142.347 Y88.237 Z3.8 F15000
G1 Z3.4
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X140.039 Y85.929 E.09722
G1 X140.039 Y86.463
G1 X141.813 Y88.237 E.07476
G1 X141.28 Y88.237
G1 X140.039 Y86.996 E.05229
G1 X140.039 Y87.529
G1 X140.747 Y88.237 E.02983
; OBJECT_ID: 481
; WIPE_START
M204 S5000
G1 X140.039 Y87.529 E-.38054
G1 X140.039 Y86.996 E-.20264
G1 X140.368 Y87.325 E-.17682
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 470
M625
; start printing object, unique label id: 481
M624 AgAAAAAAAAA=
G1 X133.191 Y84.727 Z3.8 F15000
G1 X43.762 Y52.361 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6000
M204 S2500
G1 X43.762 Y102.781 E1.50184
G1 X52.995 Y102.781 E.27503
G1 X52.995 Y104.361 E.04706
G1 X42.182 Y104.361 E.32209
G1 X42.182 Y50.781 E1.59597
G1 X52.995 Y50.781 E.32209
G1 X52.995 Y52.361 E.04706
G1 X43.822 Y52.361 E.27324
; WIPE_START
M204 S5000
G1 X43.82 Y54.361 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X51.08 Y52.007 Z3.8 F15000
G1 X52.788 Y51.453 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X52.323 Y50.988 E.01957
G1 X51.79 Y50.988
G1 X52.788 Y51.986 E.04203
G1 X52.422 Y52.154
G1 X51.257 Y50.988 E.04909
G1 X50.724 Y50.988
G1 X51.889 Y52.154 E.04909
G1 X51.356 Y52.154
G1 X50.19 Y50.988 E.04909
G1 X49.657 Y50.988
G1 X50.822 Y52.154 E.04909
G1 X50.289 Y52.154
M73 P98 R0
G1 X49.124 Y50.988 E.04909
G1 X48.591 Y50.988
G1 X49.756 Y52.154 E.04909
G1 X49.223 Y52.154
G1 X48.057 Y50.988 E.04909
G1 X47.524 Y50.988
G1 X48.689 Y52.154 E.04909
G1 X48.156 Y52.154
G1 X46.991 Y50.988 E.04909
G1 X46.457 Y50.988
G1 X47.623 Y52.154 E.04909
G1 X47.09 Y52.154
G1 X45.924 Y50.988 E.04909
G1 X45.391 Y50.988
G1 X46.556 Y52.154 E.04909
G1 X46.023 Y52.154
G1 X44.858 Y50.988 E.04909
G1 X44.324 Y50.988
G1 X45.49 Y52.154 E.04909
G1 X44.956 Y52.154
G1 X43.791 Y50.988 E.04909
G1 X43.258 Y50.988
G1 X44.423 Y52.154 E.04909
G1 X43.89 Y52.154
G1 X42.725 Y50.988 E.04909
G1 X42.389 Y51.186
G1 X43.555 Y52.352 E.04909
G1 X43.555 Y52.885
G1 X42.389 Y51.72 E.04909
G1 X42.389 Y52.253
G1 X43.555 Y53.418 E.04909
G1 X43.555 Y53.951
G1 X42.389 Y52.786 E.04909
G1 X42.389 Y53.319
G1 X43.555 Y54.485 E.04909
G1 X43.555 Y55.018
G1 X42.389 Y53.853 E.04909
G1 X42.389 Y54.386
G1 X43.555 Y55.551 E.04909
G1 X43.555 Y56.084
G1 X42.389 Y54.919 E.04909
G1 X42.389 Y55.452
G1 X43.555 Y56.618 E.04909
G1 X43.555 Y57.151
G1 X42.389 Y55.986 E.04909
G1 X42.389 Y56.519
G1 X43.555 Y57.684 E.04909
G1 X43.555 Y58.217
G1 X42.389 Y57.052 E.04909
G1 X42.389 Y57.585
G1 X43.555 Y58.751 E.04909
G1 X43.555 Y59.284
G1 X42.389 Y58.119 E.04909
G1 X42.389 Y58.652
G1 X43.555 Y59.817 E.04909
G1 X43.555 Y60.35
G1 X42.389 Y59.185 E.04909
G1 X42.389 Y59.718
G1 X43.555 Y60.884 E.04909
G1 X43.555 Y61.417
G1 X42.389 Y60.252 E.04909
G1 X42.389 Y60.785
G1 X43.555 Y61.95 E.04909
G1 X43.555 Y62.484
G1 X42.389 Y61.318 E.04909
G1 X42.389 Y61.852
G1 X43.555 Y63.017 E.04909
G1 X43.555 Y63.55
G1 X42.389 Y62.385 E.04909
G1 X42.389 Y62.918
G1 X43.555 Y64.083 E.04909
G1 X43.555 Y64.617
G1 X42.389 Y63.451 E.04909
G1 X42.389 Y63.985
G1 X43.555 Y65.15 E.04909
G1 X43.555 Y65.683
G1 X42.389 Y64.518 E.04909
G1 X42.389 Y65.051
G1 X43.555 Y66.216 E.04909
G1 X43.555 Y66.75
G1 X42.389 Y65.584 E.04909
G1 X42.389 Y66.118
G1 X43.555 Y67.283 E.04909
G1 X43.555 Y67.816
G1 X42.389 Y66.651 E.04909
G1 X42.389 Y67.184
G1 X43.555 Y68.349 E.04909
G1 X43.555 Y68.883
G1 X42.389 Y67.717 E.04909
G1 X42.389 Y68.251
G1 X43.555 Y69.416 E.04909
G1 X43.555 Y69.949
G1 X42.389 Y68.784 E.04909
G1 X42.389 Y69.317
G1 X43.555 Y70.482 E.04909
G1 X43.555 Y71.016
G1 X42.389 Y69.85 E.04909
G1 X42.389 Y70.384
G1 X43.555 Y71.549 E.04909
G1 X43.555 Y72.082
G1 X42.389 Y70.917 E.04909
G1 X42.389 Y71.45
G1 X43.555 Y72.615 E.04909
G1 X43.555 Y73.149
G1 X42.389 Y71.983 E.04909
G1 X42.389 Y72.517
G1 X43.555 Y73.682 E.04909
G1 X43.555 Y74.215
G1 X42.389 Y73.05 E.04909
G1 X42.389 Y73.583
G1 X43.555 Y74.748 E.04909
G1 X43.555 Y75.282
G1 X42.389 Y74.116 E.04909
G1 X42.389 Y74.65
G1 X43.555 Y75.815 E.04909
G1 X43.555 Y76.348
G1 X42.389 Y75.183 E.04909
G1 X42.389 Y75.716
G1 X43.555 Y76.881 E.04909
G1 X43.555 Y77.415
G1 X42.389 Y76.249 E.04909
G1 X42.389 Y76.783
G1 X43.555 Y77.948 E.04909
G1 X43.555 Y78.481
G1 X42.389 Y77.316 E.04909
G1 X42.389 Y77.849
G1 X43.555 Y79.015 E.04909
G1 X43.555 Y79.548
G1 X42.389 Y78.383 E.04909
G1 X42.389 Y78.916
G1 X43.555 Y80.081 E.04909
G1 X43.555 Y80.614
G1 X42.389 Y79.449 E.04909
G1 X42.389 Y79.982
G1 X43.555 Y81.148 E.04909
G1 X43.555 Y81.681
G1 X42.389 Y80.516 E.04909
G1 X42.389 Y81.049
G1 X43.555 Y82.214 E.04909
G1 X43.555 Y82.747
G1 X42.389 Y81.582 E.04909
G1 X42.389 Y82.115
G1 X43.555 Y83.281 E.04909
G1 X43.555 Y83.814
G1 X42.389 Y82.649 E.04909
G1 X42.389 Y83.182
G1 X43.555 Y84.347 E.04909
G1 X43.555 Y84.88
G1 X42.389 Y83.715 E.04909
G1 X42.389 Y84.248
G1 X43.555 Y85.414 E.04909
G1 X43.555 Y85.947
G1 X42.389 Y84.782 E.04909
G1 X42.389 Y85.315
G1 X43.555 Y86.48 E.04909
G1 X43.555 Y87.013
G1 X42.389 Y85.848 E.04909
G1 X42.389 Y86.381
G1 X43.555 Y87.547 E.04909
G1 X43.555 Y88.08
G1 X42.389 Y86.915 E.04909
G1 X42.389 Y87.448
G1 X43.555 Y88.613 E.04909
G1 X43.555 Y89.146
G1 X42.389 Y87.981 E.04909
G1 X42.389 Y88.514
G1 X43.555 Y89.68 E.04909
G1 X43.555 Y90.213
G1 X42.389 Y89.048 E.04909
G1 X42.389 Y89.581
G1 X43.555 Y90.746 E.04909
G1 X43.555 Y91.279
G1 X42.389 Y90.114 E.04909
G1 X42.389 Y90.647
G1 X43.555 Y91.813 E.04909
G1 X43.555 Y92.346
G1 X42.389 Y91.181 E.04909
G1 X42.389 Y91.714
G1 X43.555 Y92.879 E.04909
G1 X43.555 Y93.412
G1 X42.389 Y92.247 E.04909
G1 X42.389 Y92.78
G1 X43.555 Y93.946 E.04909
G1 X43.555 Y94.479
G1 X42.389 Y93.314 E.04909
G1 X42.389 Y93.847
G1 X43.555 Y95.012 E.04909
G1 X43.555 Y95.545
G1 X42.389 Y94.38 E.04909
G1 X42.389 Y94.913
G1 X43.555 Y96.079 E.04909
G1 X43.555 Y96.612
G1 X42.389 Y95.447 E.04909
G1 X42.389 Y95.98
G1 X43.555 Y97.145 E.04909
G1 X43.555 Y97.679
G1 X42.389 Y96.513 E.04909
G1 X42.389 Y97.047
G1 X43.555 Y98.212 E.04909
G1 X43.555 Y98.745
G1 X42.389 Y97.58 E.04909
G1 X42.389 Y98.113
G1 X43.555 Y99.278 E.04909
G1 X43.555 Y99.812
G1 X42.389 Y98.646 E.04909
G1 X42.389 Y99.18
G1 X43.555 Y100.345 E.04909
G1 X43.555 Y100.878
G1 X42.389 Y99.713 E.04909
G1 X42.389 Y100.246
G1 X43.555 Y101.411 E.04909
G1 X43.555 Y101.945
G1 X42.389 Y100.779 E.04909
G1 X42.389 Y101.313
G1 X43.555 Y102.478 E.04909
; WIPE_START
M204 S5000
G1 X42.389 Y101.313 E-.62621
G1 X42.389 Y100.96 E-.13379
; WIPE_END
G1 E-.04 F1800
G1 X49.859 Y102.526 Z3.8 F15000
G1 X52.064 Y102.988 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X52.788 Y103.712 E.03049
G1 X52.696 Y104.154
G1 X51.531 Y102.988 E.04909
G1 X50.998 Y102.988
G1 X52.163 Y104.154 E.04909
G1 X51.63 Y104.154
G1 X50.464 Y102.988 E.04909
G1 X49.931 Y102.988
G1 X51.096 Y104.154 E.04909
G1 X50.563 Y104.154
G1 X49.398 Y102.988 E.04909
G1 X48.865 Y102.988
G1 X50.03 Y104.154 E.04909
G1 X49.497 Y104.154
G1 X48.331 Y102.988 E.04909
G1 X47.798 Y102.988
G1 X48.963 Y104.154 E.04909
G1 X48.43 Y104.154
G1 X47.265 Y102.988 E.04909
G1 X46.732 Y102.988
G1 X47.897 Y104.154 E.04909
G1 X47.364 Y104.154
G1 X46.198 Y102.988 E.04909
G1 X45.665 Y102.988
G1 X46.83 Y104.154 E.04909
G1 X46.297 Y104.154
G1 X45.132 Y102.988 E.04909
G1 X44.599 Y102.988
G1 X45.764 Y104.154 E.04909
G1 X45.231 Y104.154
G1 X44.065 Y102.988 E.04909
; WIPE_START
M204 S5000
G1 X45.231 Y104.154 E-.6262
G1 X45.583 Y104.154 E-.1338
; WIPE_END
G1 E-.04 F1800
G1 X44.697 Y104.154 Z3.8 F15000
G1 Z3.4
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X42.389 Y101.846 E.09722
G1 X42.389 Y102.379
G1 X44.164 Y104.154 E.07476
G1 X43.631 Y104.154
G1 X42.389 Y102.912 E.05229
G1 X42.389 Y103.446
G1 X43.097 Y104.154 E.02983
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F6000
M204 S5000
G1 X42.389 Y103.446 E-.38054
G1 X42.389 Y102.912 E-.20264
G1 X42.718 Y103.241 E-.17682
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.217 J0 P1  F15000
; stop printing object, unique label id: 481
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
G1 Z3.9 F900 ; lower z a little
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
M73 P99 R0
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

    G1 Z103.4 F600
    G1 Z101.4

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

