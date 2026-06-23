; HEADER_BLOCK_START
; BambuStudio 02.06.00.51
; model printing time: 4m 31s; total estimated time: 10m 51s
; total layer number: 10
; total filament length [mm] : 400.32
; total filament volume [cm^3] : 962.87
; total filament weight [g] : 1.23
; filament_density: 1.28
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
M73 P0 R10
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
M73 P5 R10
G1 E50 F200
M400
M104 S250
G92 E0
M73 P45 R5
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S230 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P47 R5
G1 E-0.5 F300

M73 P50 R5
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
M73 P51 R5
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
    G29 A X83.1576 Y98.1576 I89.6848 J59.6848
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
M73 P52 R5
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
; OBJECT_ID: 81
G1 X84.36 Y96.967
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
M73 P53 R5
G1 X84.758 Y96.702 E.01726
G1 X85.25 Y96.502 E.01917
G1 X86.017 Y96.386 E.02802
G1 X169.989 Y96.386 E3.0319
G1 X170.477 Y96.433 E.0177
G1 X170.939 Y96.569 E.01739
M73 P54 R4
G1 X171.297 Y96.745 E.01439
G1 X171.697 Y97.019 E.0175
G1 X172.033 Y97.36 E.0173
G1 X172.298 Y97.758 E.01726
G1 X172.498 Y98.25 E.01917
G1 X172.614 Y99.017 E.02802
G1 X172.614 Y152.989 E1.94871
G1 X172.567 Y153.477 E.0177
G1 X172.431 Y153.941 E.01745
M73 P55 R4
G1 X172.3 Y154.215 E.01096
G1 X171.98 Y154.698 E.02093
G1 X171.64 Y155.033 E.01724
G1 X171.242 Y155.298 E.01726
G1 X170.75 Y155.498 E.01917
G1 X169.983 Y155.614 E.02802
G1 X86.011 Y155.614 E3.03189
G1 X85.523 Y155.567 E.0177
G1 X85.059 Y155.431 E.01745
G1 X84.785 Y155.3 E.01096
G1 X84.302 Y154.98 E.02093
M73 P56 R4
G1 X83.967 Y154.64 E.01724
G1 X83.702 Y154.242 E.01726
G1 X83.502 Y153.75 E.01917
G1 X83.386 Y152.983 E.02802
G1 X83.386 Y99.011 E1.94872
G1 X83.433 Y98.523 E.0177
G1 X83.569 Y98.059 E.01745
G1 X83.7 Y97.785 E.01096
G1 X84.02 Y97.302 E.02093
G1 X84.317 Y97.009 E.01508
M204 S3000
G1 X84.641 Y97.336 F15000
G1 F1500
M204 S250
G1 X84.661 Y97.316 E.00104
M73 P57 R4
G1 X84.986 Y97.102 E.01403
G1 X85.356 Y96.952 E.01444
G1 X86.062 Y96.843 E.02576
G1 X169.974 Y96.844 E3.02974
G1 X170.402 Y96.887 E.01556
M73 P58 R4
G1 X170.783 Y97.002 E.01434
G1 X171.073 Y97.146 E.01172
G1 X171.391 Y97.364 E.01391
G1 X171.668 Y97.641 E.01413
G1 X171.885 Y97.961 E.01398
G1 X172.048 Y98.356 E.01544
G1 X172.157 Y99.062 E.02576
G1 X172.157 Y152.961 E1.94608
G1 X172.118 Y153.377 E.01509
G1 X171.998 Y153.787 E.01542
G1 X171.896 Y153.997 E.00844
G1 X171.633 Y154.394 E.01718
G1 X171.339 Y154.684 E.01492
G1 X171.014 Y154.898 E.01403
G1 X170.644 Y155.048 E.01444
G1 X169.938 Y155.157 E.02576
G1 X86.039 Y155.157 E3.02926
G1 X85.623 Y155.118 E.01509
G1 X85.213 Y154.998 E.01542
M73 P59 R4
G1 X85.003 Y154.896 E.00844
G1 X84.606 Y154.633 E.01718
G1 X84.316 Y154.339 E.01492
G1 X84.102 Y154.014 E.01403
G1 X83.952 Y153.644 E.01444
G1 X83.843 Y152.938 E.02576
G1 X83.843 Y99.039 E1.94609
G1 X83.882 Y98.623 E.01509
G1 X84.002 Y98.213 E.01542
G1 X84.104 Y98.003 E.00844
G1 X84.367 Y97.606 E.01718
G1 X84.598 Y97.378 E.01172
M204 S3000
G1 X84.921 Y97.705 F15000
G1 F1500
M204 S250
G1 X84.961 Y97.665 E.00203
G1 X85.212 Y97.504 E.01075
G1 X85.464 Y97.401 E.00983
G1 X86.107 Y97.3 E.0235
M73 P60 R4
G1 X169.944 Y97.301 E3.02701
G1 X170.3 Y97.336 E.01292
G1 X170.625 Y97.433 E.01224
G1 X170.849 Y97.547 E.00908
G1 X171.087 Y97.71 E.01042
G1 X171.304 Y97.924 E.011
G1 X171.472 Y98.168 E.0107
G1 X171.599 Y98.465 E.01167
G1 X171.7 Y99.107 E.02346
G1 X171.7 Y152.933 E1.94343
G1 X171.663 Y153.303 E.01344
G1 X171.565 Y153.632 E.01241
G1 X171.493 Y153.778 E.00588
G1 X171.286 Y154.09 E.01351
G1 X171.039 Y154.335 E.01256
G1 X170.788 Y154.496 E.01075
G1 X170.536 Y154.599 E.00983
G1 X169.893 Y154.7 E.0235
G1 X86.067 Y154.7 E3.02661
G1 X85.697 Y154.663 E.01344
G1 X85.368 Y154.565 E.01241
M73 P61 R4
G1 X85.222 Y154.493 E.00588
G1 X84.91 Y154.286 E.01351
G1 X84.665 Y154.039 E.01256
G1 X84.504 Y153.788 E.01075
G1 X84.401 Y153.536 E.00983
G1 X84.3 Y152.893 E.0235
G1 X84.3 Y99.067 E1.94343
G1 X84.337 Y98.697 E.01343
G1 X84.435 Y98.368 E.01241
G1 X84.507 Y98.222 E.00588
G1 X84.714 Y97.91 E.01351
G1 X84.879 Y97.747 E.00836
M204 S3000
G1 X85.196 Y98.076 F15000
G1 F1500
M204 S250
G1 X85.403 Y97.929 E.00914
G1 X85.6 Y97.837 E.00786
G1 X85.742 Y97.794 E.00535
G1 X86.019 Y97.757 E.01012
G1 X169.977 Y97.757 E3.03137
G1 X170.293 Y97.806 E.01156
G1 X170.411 Y97.843 E.00446
G1 X170.713 Y98.003 E.01232
G1 X170.923 Y98.194 E.01024
G1 X171.071 Y98.403 E.00926
G1 X171.163 Y98.6 E.00785
G1 X171.206 Y98.742 E.00535
G1 X171.243 Y99.019 E.01012
G1 X171.243 Y152.977 E1.94819
G1 X171.194 Y153.294 E.01156
G1 X171.157 Y153.411 E.00446
M73 P62 R4
G1 X170.997 Y153.713 E.01232
G1 X170.806 Y153.923 E.01024
G1 X170.597 Y154.071 E.00926
G1 X170.4 Y154.163 E.00785
G1 X170.258 Y154.206 E.00535
G1 X169.981 Y154.243 E.01012
G1 X86.023 Y154.243 E3.03137
G1 X85.706 Y154.194 E.01156
G1 X85.589 Y154.157 E.00446
G1 X85.287 Y153.997 E.01232
G1 X85.077 Y153.806 E.01023
G1 X84.929 Y153.597 E.00926
G1 X84.837 Y153.4 E.00786
G1 X84.794 Y153.258 E.00535
G1 X84.757 Y152.981 E.01012
G1 X84.757 Y99.023 E1.94819
G1 X84.806 Y98.705 E.01161
G1 X84.878 Y98.497 E.00794
M73 P63 R3
G1 X84.944 Y98.379 E.00489
G1 X85.158 Y98.122 E.01208
M204 S3000
G1 X85.473 Y98.439 F15000
G1 F1500
M204 S250
G1 X85.586 Y98.348 E.00525
G1 X85.803 Y98.246 E.00865
G1 X86.011 Y98.214 E.00758
G1 X169.988 Y98.214 E3.03207
G1 X170.218 Y98.257 E.00845
G1 X170.409 Y98.344 E.00759
G1 X170.561 Y98.473 E.0072
G1 X170.652 Y98.586 E.00525
G1 X170.754 Y98.803 E.00865
G1 X170.786 Y99.011 E.00758
G1 X170.786 Y152.988 E1.94889
G1 X170.743 Y153.218 E.00845
G1 X170.656 Y153.409 E.00759
G1 X170.527 Y153.561 E.0072
G1 X170.414 Y153.652 E.00525
G1 X170.197 Y153.754 E.00865
G1 X169.989 Y153.786 E.00758
M73 P64 R3
G1 X86.012 Y153.786 E3.03207
G1 X85.782 Y153.743 E.00845
G1 X85.591 Y153.656 E.00759
G1 X85.439 Y153.527 E.0072
G1 X85.348 Y153.414 E.00525
G1 X85.246 Y153.197 E.00865
G1 X85.214 Y152.989 E.00758
G1 X85.214 Y99.012 E1.94889
G1 X85.257 Y98.779 E.00857
G1 X85.304 Y98.661 E.0046
G1 X85.436 Y98.487 E.00789
M204 S3000
G1 X85.747 Y98.805 F15000
G1 F1500
M204 S250
G1 X85.884 Y98.696 E.00632
G1 X86 Y98.671 E.00429
G1 X170 Y98.671 E3.0329
G1 X170.111 Y98.7 E.00413
G1 X170.195 Y98.747 E.0035
M73 P65 R3
G1 X170.304 Y98.884 E.00632
G1 X170.329 Y99 E.00429
G1 X170.329 Y153 E1.94972
G1 X170.3 Y153.111 E.00413
G1 X170.253 Y153.195 E.0035
G1 X170.116 Y153.304 E.00632
G1 X170 Y153.329 E.00429
G1 X86 Y153.329 E3.0329
G1 X85.889 Y153.3 E.00413
G1 X85.805 Y153.253 E.0035
G1 X85.696 Y153.116 E.00632
G1 X85.671 Y153 E.00429
G1 X85.671 Y99 E1.94972
G1 X85.7 Y98.889 E.00413
G1 X85.718 Y98.857 E.00133
; WIPE_START
G1 X85.884 Y98.696 E-.08797
G1 X86 Y98.671 E-.04514
G1 X87.65 Y98.671 E-.6269
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X94.026 Y102.867 Z.6 F15000
G1 X169.6 Y152.6 Z.6
G1 Z.2
M73 P66 R3
G1 E.8 F1800
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X86.4 Y152.6 E3.00402
G1 X86.4 Y99.4 E1.92084
G1 X169.6 Y99.4 E3.00402
G1 X169.6 Y152.54 E1.91867
M204 S3000
G1 X169.143 Y152.143 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X86.857 Y152.143 E2.97101
G1 X86.857 Y99.857 E1.88783
G1 X169.143 Y99.857 E2.97101
G1 X169.143 Y152.083 E1.88567
; WIPE_START
G1 X167.143 Y152.084 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X160.736 Y147.937 Z.6 F15000
G1 X87.6 Y100.6 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
M73 P67 R3
G1 F1500
M204 S250
G1 X168.4 Y100.6 E2.91737
G1 X168.4 Y151.4 E1.83419
G1 X87.6 Y151.4 E2.91737
G1 X87.6 Y100.66 E1.83202
M204 S3000
G1 X87.143 Y100.6 F15000
; FEATURE: Inner wall
G1 F1500
M204 S250
G1 X87.143 Y100.143 E.0165
G1 X168.857 Y100.143 E2.95037
G1 X168.857 Y151.857 E1.86719
G1 X87.143 Y151.857 E2.95037
G1 X87.143 Y100.66 E1.84852
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F1500
M73 P68 R3
G1 X87.143 Y100.143 E-.19649
G1 X88.626 Y100.143 E-.56351
; WIPE_END
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
G3 Z.6 I1.217 J0 P1  F15000
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
; OBJECT_ID: 81
G1 X87.79 Y100.398
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.45
G1 F9000
G1 X168.602 Y100.398 E2.59862
G1 X168.602 Y151.602 E1.64654
G1 X87.398 Y151.602 E2.61123
G1 X87.398 Y100.398 E1.64654
G1 X87.73 Y100.398 E.01068
M204 S250
G1 X87.79 Y100.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X168.21 Y100.79 E2.39544
G1 X168.21 Y151.21 E1.50184
G1 X87.79 Y151.21 E2.39544
M73 P69 R3
G1 X87.79 Y100.85 E1.50005
; WIPE_START
M204 S5000
G1 X89.79 Y100.849 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.197 Y104.997 Z.8 F15000
G1 X169.398 Y152.398 Z.8
G1 Z.4
M73 P70 R3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X86.602 Y152.398 E2.66241
G1 X86.602 Y99.602 E1.69772
M73 P71 R3
G1 X169.398 Y99.602 E2.66241
G1 X169.398 Y152.338 E1.69579
M204 S250
M73 P72 R3
G1 X169.79 Y152.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X86.21 Y152.79 E2.48956
G1 X86.21 Y99.21 E1.59597
M73 P72 R2
G1 X169.79 Y99.21 E2.48956
G1 X169.79 Y152.73 E1.59418
; WIPE_START
M204 S5000
G1 X167.79 Y152.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.967 Y151.967 Z.8 F15000
M73 P73 R2
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
M73 P74 R2
G1 X168.886 Y151.983 E.00278
; LINE_WIDTH: 0.448395
G1 X168.806 Y152 E.00263
; LINE_WIDTH: 0.43172
G1 X87.194 Y152 E2.50648
; LINE_WIDTH: 0.470635
G1 X87.033 Y151.967 E.00556
G1 X87.017 Y151.886 E.00278
; LINE_WIDTH: 0.448395
M73 P75 R2
G1 X87 Y151.806 E.00263
; LINE_WIDTH: 0.431747
G1 X87 Y100.194 E1.58521
G1 X87.017 Y100.114 E.00253
; LINE_WIDTH: 0.481759
G1 X87.033 Y100.033 E.00285
; LINE_WIDTH: 0.481745
G1 X87.114 Y100.017 E.00285
; LINE_WIDTH: 0.448395
G1 X87.194 Y100 E.00263
; LINE_WIDTH: 0.43172
G1 X168.806 Y100 E2.50648
; LINE_WIDTH: 0.470635
G1 X168.967 Y100.033 E.00556
G1 X168.983 Y100.114 E.00278
; LINE_WIDTH: 0.448395
G1 X169 Y100.194 E.00263
; LINE_WIDTH: 0.43172
G1 X169 Y151.806 E1.5851
; LINE_WIDTH: 0.470635
G1 X168.979 Y151.908 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
M73 P76 R2
G1 X168.886 Y151.983 E-.04541
G1 X168.806 Y152 E-.03125
G1 X167.007 Y152 E-.68334
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/10
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F15000
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
; OBJECT_ID: 81
G1 X87.79 Y100.398
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X168.602 Y100.398 E2.59862
G1 X168.602 Y151.602 E1.64654
G1 X87.398 Y151.602 E2.61123
G1 X87.398 Y100.398 E1.64654
G1 X87.73 Y100.398 E.01068
M204 S250
G1 X87.79 Y100.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X168.21 Y100.79 E2.39544
G1 X168.21 Y151.21 E1.50184
G1 X87.79 Y151.21 E2.39544
G1 X87.79 Y100.85 E1.50005
; WIPE_START
M204 S5000
G1 X89.79 Y100.849 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.197 Y104.997 Z1 F15000
M73 P77 R2
G1 X169.398 Y152.398 Z1
G1 Z.6
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
G1 X168.967 Y151.967 Z1 F15000
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X168.886 Y151.983 E.00278
; LINE_WIDTH: 0.448395
G1 X168.806 Y152 E.00263
; LINE_WIDTH: 0.43172
G1 X87.194 Y152 E2.50648
; LINE_WIDTH: 0.470635
G1 X87.033 Y151.967 E.00556
G1 X87.017 Y151.886 E.00278
; LINE_WIDTH: 0.448395
G1 X87 Y151.806 E.00263
; LINE_WIDTH: 0.431747
G1 X87 Y100.194 E1.58521
G1 X87.017 Y100.114 E.00253
; LINE_WIDTH: 0.481759
G1 X87.033 Y100.033 E.00285
; LINE_WIDTH: 0.481745
G1 X87.114 Y100.017 E.00285
; LINE_WIDTH: 0.448395
G1 X87.194 Y100 E.00263
; LINE_WIDTH: 0.43172
G1 X168.806 Y100 E2.50648
; LINE_WIDTH: 0.470635
G1 X168.967 Y100.033 E.00556
G1 X168.983 Y100.114 E.00278
; LINE_WIDTH: 0.448395
G1 X169 Y100.194 E.00263
; LINE_WIDTH: 0.43172
G1 X169 Y151.806 E1.5851
; LINE_WIDTH: 0.470635
G1 X168.979 Y151.908 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
M73 P78 R2
G1 X168.886 Y151.983 E-.04541
G1 X168.806 Y152 E-.03125
G1 X167.007 Y152 E-.68334
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/10
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S89.25
G17
G3 Z1 I1.217 J0 P1  F15000
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
; OBJECT_ID: 81
G1 X87.79 Y100.398
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X168.602 Y100.398 E2.59862
G1 X168.602 Y151.602 E1.64654
G1 X87.398 Y151.602 E2.61123
G1 X87.398 Y100.398 E1.64654
G1 X87.73 Y100.398 E.01068
M204 S250
G1 X87.79 Y100.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X168.21 Y100.79 E2.39544
G1 X168.21 Y151.21 E1.50184
G1 X87.79 Y151.21 E2.39544
G1 X87.79 Y100.85 E1.50005
; WIPE_START
M204 S5000
G1 X89.79 Y100.849 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.197 Y104.997 Z1.2 F15000
M73 P79 R2
G1 X169.398 Y152.398 Z1.2
G1 Z.8
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
G1 X168.967 Y151.967 Z1.2 F15000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.470635
G1 F7500
G1 X168.886 Y151.983 E.00278
; LINE_WIDTH: 0.448395
G1 X168.806 Y152 E.00263
; LINE_WIDTH: 0.43172
G1 X87.194 Y152 E2.50648
; LINE_WIDTH: 0.470635
G1 X87.033 Y151.967 E.00556
G1 X87.017 Y151.886 E.00278
; LINE_WIDTH: 0.448395
G1 X87 Y151.806 E.00263
; LINE_WIDTH: 0.431747
G1 X87 Y100.194 E1.58521
G1 X87.017 Y100.114 E.00253
; LINE_WIDTH: 0.481759
G1 X87.033 Y100.033 E.00285
; LINE_WIDTH: 0.481745
G1 X87.114 Y100.017 E.00285
; LINE_WIDTH: 0.448395
G1 X87.194 Y100 E.00263
; LINE_WIDTH: 0.43172
G1 X168.806 Y100 E2.50648
; LINE_WIDTH: 0.470635
G1 X168.967 Y100.033 E.00556
G1 X168.983 Y100.114 E.00278
; LINE_WIDTH: 0.448395
G1 X169 Y100.194 E.00263
; LINE_WIDTH: 0.43172
G1 X169 Y151.806 E1.5851
; LINE_WIDTH: 0.470635
G1 X168.979 Y151.908 E.00353
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
M73 P80 R2
G1 X168.886 Y151.983 E-.04541
G1 X168.806 Y152 E-.03125
G1 X167.007 Y152 E-.68334
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/10
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
M106 S81.6
G17
G3 Z1.2 I1.217 J0 P1  F15000
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
; OBJECT_ID: 81
G1 X87.79 Y100.398
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.398 Y100.398 E.01261
G1 X87.398 Y151.602 E1.64654
G1 X160.751 Y151.602 E2.35878
G1 X160.751 Y152.398 E.02559
G1 X86.602 Y152.398 E2.38437
G1 X86.602 Y99.602 E1.69772
G1 X160.751 Y99.602 E2.38437
G1 X160.751 Y100.398 E.02559
G1 X87.85 Y100.398 E2.34424
M204 S250
G1 X87.79 Y100.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X168.21 Y100.79 E2.39544
G1 X168.21 Y151.21 E1.50184
G1 X87.79 Y151.21 E2.39544
M73 P81 R2
G1 X87.79 Y100.85 E1.50005
; WIPE_START
M204 S5000
G1 X89.79 Y100.849 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.192 Y105.005 Z1.4 F15000
G1 X169.79 Y152.79 Z1.4
G1 Z1
G1 E.8 F1800
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
G1 X160.548 Y152 Z1.4 F15000
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X87.194 Y152 E2.25286
; LINE_WIDTH: 0.470635
G1 X87.033 Y151.967 E.00556
G1 X87.017 Y151.886 E.00278
; LINE_WIDTH: 0.448395
M73 P81 R1
G1 X87 Y151.806 E.00263
; LINE_WIDTH: 0.43172
G1 X87 Y100.194 E1.5851
; LINE_WIDTH: 0.470635
G1 X87.033 Y100.033 E.00556
G1 X87.114 Y100.017 E.00278
; LINE_WIDTH: 0.448395
G1 X87.194 Y100 E.00263
; LINE_WIDTH: 0.43172
G1 X160.548 Y100 E2.25286
; WIPE_START
G1 X158.548 Y100 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X166.168 Y99.57 Z1.4 F15000
G1 X168.874 Y99.417 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X169.583 Y100.126 E.02983
G1 X169.583 Y100.659
G1 X168.341 Y99.417 E.0523
G1 X167.808 Y99.417
G1 X169.583 Y101.192 E.07476
M73 P82 R1
G1 X169.583 Y101.725
G1 X167.275 Y99.417 E.09722
G1 X166.741 Y99.417
G1 X167.907 Y100.583 E.04908
G1 X167.373 Y100.583
G1 X166.208 Y99.417 E.04908
G1 X165.675 Y99.417
G1 X166.84 Y100.583 E.04908
G1 X166.307 Y100.583
G1 X165.142 Y99.417 E.04908
G1 X164.608 Y99.417
G1 X165.774 Y100.583 E.04908
G1 X165.24 Y100.583
G1 X164.075 Y99.417 E.04908
G1 X163.542 Y99.417
G1 X164.707 Y100.583 E.04908
G1 X164.174 Y100.583
G1 X163.009 Y99.417 E.04908
G1 X162.475 Y99.417
G1 X163.641 Y100.583 E.04908
G1 X163.107 Y100.583
M73 P83 R1
G1 X161.942 Y99.417 E.04908
G1 X161.409 Y99.417
G1 X162.574 Y100.583 E.04908
G1 X162.041 Y100.583
G1 X160.974 Y99.516 E.04494
G1 X160.974 Y100.049
G1 X161.507 Y100.583 E.02248
; WIPE_START
M204 S5000
G1 X160.974 Y100.049 E-.28681
G1 X160.974 Y99.516 E-.20264
G1 X161.477 Y100.019 E-.27056
; WIPE_END
G1 E-.04 F1800
G1 X168.417 Y101.093 Z1.4 F15000
G1 Z1
G1 E.8 F1800
G1 F6000
M204 S1000
G1 X169.583 Y102.259 E.04908
G1 X169.583 Y102.792
G1 X168.417 Y101.627 E.04908
G1 X168.417 Y102.16
G1 X169.583 Y103.325 E.04908
G1 X169.583 Y103.858
G1 X168.417 Y102.693 E.04908
G1 X168.417 Y103.226
G1 X169.583 Y104.392 E.04908
G1 X169.583 Y104.925
G1 X168.417 Y103.76 E.04908
G1 X168.417 Y104.293
G1 X169.583 Y105.458 E.04908
G1 X169.583 Y105.991
G1 X168.417 Y104.826 E.04908
G1 X168.417 Y105.359
G1 X169.583 Y106.525 E.04908
G1 X169.583 Y107.058
G1 X168.417 Y105.893 E.04908
G1 X168.417 Y106.426
G1 X169.583 Y107.591 E.04908
G1 X169.583 Y108.124
G1 X168.417 Y106.959 E.04908
G1 X168.417 Y107.492
G1 X169.583 Y108.658 E.04908
G1 X169.583 Y109.191
G1 X168.417 Y108.026 E.04908
G1 X168.417 Y108.559
G1 X169.583 Y109.724 E.04908
G1 X169.583 Y110.257
G1 X168.417 Y109.092 E.04908
G1 X168.417 Y109.626
G1 X169.583 Y110.791 E.04908
G1 X169.583 Y111.324
G1 X168.417 Y110.159 E.04908
G1 X168.417 Y110.692
G1 X169.583 Y111.857 E.04908
G1 X169.583 Y112.391
G1 X168.417 Y111.225 E.04908
G1 X168.417 Y111.759
G1 X169.583 Y112.924 E.04908
G1 X169.583 Y113.457
G1 X168.417 Y112.292 E.04908
G1 X168.417 Y112.825
G1 X169.583 Y113.99 E.04908
G1 X169.583 Y114.524
G1 X168.417 Y113.358 E.04908
G1 X168.417 Y113.892
G1 X169.583 Y115.057 E.04908
G1 X169.583 Y115.59
G1 X168.417 Y114.425 E.04908
G1 X168.417 Y114.958
G1 X169.583 Y116.123 E.04908
G1 X169.583 Y116.657
G1 X168.417 Y115.491 E.04908
G1 X168.417 Y116.025
G1 X169.583 Y117.19 E.04908
G1 X169.583 Y117.723
G1 X168.417 Y116.558 E.04908
G1 X168.417 Y117.091
G1 X169.583 Y118.256 E.04908
G1 X169.583 Y118.79
G1 X168.417 Y117.624 E.04908
G1 X168.417 Y118.158
G1 X169.583 Y119.323 E.04908
G1 X169.583 Y119.856
G1 X168.417 Y118.691 E.04908
G1 X168.417 Y119.224
G1 X169.583 Y120.389 E.04908
G1 X169.583 Y120.923
M73 P84 R1
G1 X168.417 Y119.757 E.04908
G1 X168.417 Y120.291
G1 X169.583 Y121.456 E.04908
G1 X169.583 Y121.989
G1 X168.417 Y120.824 E.04908
G1 X168.417 Y121.357
G1 X169.583 Y122.522 E.04908
G1 X169.583 Y123.056
G1 X168.417 Y121.89 E.04908
G1 X168.417 Y122.424
G1 X169.583 Y123.589 E.04908
G1 X169.583 Y124.122
G1 X168.417 Y122.957 E.04908
G1 X168.417 Y123.49
G1 X169.583 Y124.655 E.04908
G1 X169.583 Y125.189
G1 X168.417 Y124.023 E.04908
G1 X168.417 Y124.557
G1 X169.583 Y125.722 E.04908
G1 X169.583 Y126.255
G1 X168.417 Y125.09 E.04908
G1 X168.417 Y125.623
G1 X169.583 Y126.788 E.04908
G1 X169.583 Y127.322
G1 X168.417 Y126.157 E.04908
G1 X168.417 Y126.69
G1 X169.583 Y127.855 E.04908
G1 X169.583 Y128.388
G1 X168.417 Y127.223 E.04908
G1 X168.417 Y127.756
G1 X169.583 Y128.922 E.04908
G1 X169.583 Y129.455
G1 X168.417 Y128.29 E.04908
G1 X168.417 Y128.823
G1 X169.583 Y129.988 E.04908
G1 X169.583 Y130.521
G1 X168.417 Y129.356 E.04908
G1 X168.417 Y129.889
G1 X169.583 Y131.055 E.04908
G1 X169.583 Y131.588
G1 X168.417 Y130.423 E.04908
G1 X168.417 Y130.956
G1 X169.583 Y132.121 E.04908
G1 X169.583 Y132.654
G1 X168.417 Y131.489 E.04908
G1 X168.417 Y132.022
G1 X169.583 Y133.188 E.04908
G1 X169.583 Y133.721
G1 X168.417 Y132.556 E.04908
G1 X168.417 Y133.089
G1 X169.583 Y134.254 E.04908
G1 X169.583 Y134.787
G1 X168.417 Y133.622 E.04908
G1 X168.417 Y134.155
G1 X169.583 Y135.321 E.04908
G1 X169.583 Y135.854
G1 X168.417 Y134.689 E.04908
G1 X168.417 Y135.222
G1 X169.583 Y136.387 E.04908
G1 X169.583 Y136.92
G1 X168.417 Y135.755 E.04908
G1 X168.417 Y136.288
G1 X169.583 Y137.454 E.04908
G1 X169.583 Y137.987
G1 X168.417 Y136.822 E.04908
G1 X168.417 Y137.355
G1 X169.583 Y138.52 E.04908
G1 X169.583 Y139.053
G1 X168.417 Y137.888 E.04908
G1 X168.417 Y138.421
G1 X169.583 Y139.587 E.04908
G1 X169.583 Y140.12
G1 X168.417 Y138.955 E.04908
G1 X168.417 Y139.488
G1 X169.583 Y140.653 E.04908
G1 X169.583 Y141.186
G1 X168.417 Y140.021 E.04908
G1 X168.417 Y140.554
G1 X169.583 Y141.72 E.04908
G1 X169.583 Y142.253
G1 X168.417 Y141.088 E.04908
G1 X168.417 Y141.621
G1 X169.583 Y142.786 E.04908
G1 X169.583 Y143.319
G1 X168.417 Y142.154 E.04908
G1 X168.417 Y142.687
G1 X169.583 Y143.853 E.04908
G1 X169.583 Y144.386
G1 X168.417 Y143.221 E.04908
G1 X168.417 Y143.754
G1 X169.583 Y144.919 E.04908
G1 X169.583 Y145.452
G1 X168.417 Y144.287 E.04908
G1 X168.417 Y144.821
G1 X169.583 Y145.986 E.04908
G1 X169.583 Y146.519
G1 X168.417 Y145.354 E.04908
G1 X168.417 Y145.887
G1 X169.583 Y147.052 E.04908
G1 X169.583 Y147.586
G1 X168.417 Y146.42 E.04908
G1 X168.417 Y146.954
G1 X169.583 Y148.119 E.04908
G1 X169.583 Y148.652
G1 X168.417 Y147.487 E.04908
G1 X168.417 Y148.02
G1 X169.583 Y149.185 E.04908
G1 X169.583 Y149.719
G1 X168.417 Y148.553 E.04908
G1 X168.417 Y149.087
G1 X169.583 Y150.252 E.04908
G1 X169.583 Y150.785
G1 X168.417 Y149.62 E.04908
G1 X168.417 Y150.153
G1 X169.583 Y151.318 E.04908
G1 X169.583 Y151.852
G1 X168.417 Y150.686 E.04908
G1 X168.417 Y151.22
G1 X169.583 Y152.385 E.04908
G1 X169.247 Y152.583
G1 X168.082 Y151.417 E.04908
G1 X167.549 Y151.417
G1 X168.714 Y152.583 E.04908
G1 X168.181 Y152.583
G1 X167.015 Y151.417 E.04908
G1 X166.482 Y151.417
G1 X167.647 Y152.583 E.04908
G1 X167.114 Y152.583
G1 X165.949 Y151.417 E.04908
G1 X165.416 Y151.417
G1 X166.581 Y152.583 E.04908
G1 X166.048 Y152.583
G1 X164.882 Y151.417 E.04908
G1 X164.349 Y151.417
G1 X165.514 Y152.583 E.04908
G1 X164.981 Y152.583
G1 X163.816 Y151.417 E.04908
G1 X163.283 Y151.417
G1 X164.448 Y152.583 E.04908
G1 X163.915 Y152.583
G1 X162.749 Y151.417 E.04908
G1 X162.216 Y151.417
M73 P85 R1
G1 X163.381 Y152.583 E.04908
G1 X162.848 Y152.583
G1 X161.683 Y151.417 E.04908
G1 X161.15 Y151.417
G1 X162.315 Y152.583 E.04908
G1 X161.782 Y152.583
G1 X160.974 Y151.775 E.03402
M204 S5000
G1 X160.991 Y151.399 F15000
; FEATURE: Gap infill
; LINE_WIDTH: 0.114645
G1 F7500
G1 X160.991 Y151.758 E.00204
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X160.991 Y151.399 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/10
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
M106 S99.45
G17
G3 Z1.4 I1.217 J0 P1  F15000
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
; OBJECT_ID: 81
G1 X87.398 Y100.398
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X87.398 Y151.602 E1.64654
G1 X143.9 Y151.602 E1.81691
G1 X143.9 Y152.398 E.02559
G1 X86.602 Y152.398 E1.84251
G1 X86.602 Y99.602 E1.69772
G1 X143.9 Y99.602 E1.84251
G1 X143.9 Y100.398 E.02559
G1 X87.458 Y100.398 E1.81499
M204 S250
G1 X87.79 Y100.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X87.79 Y151.21 E1.50184
G1 X161.619 Y151.21 E2.19912
G1 X161.619 Y152.79 E.04706
G1 X86.21 Y152.79 E2.24618
G1 X86.21 Y99.21 E1.59597
G1 X161.619 Y99.21 E2.24618
G1 X161.619 Y100.79 E.04706
G1 X87.85 Y100.79 E2.19733
; WIPE_START
M204 S5000
G1 X87.848 Y102.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.194 Y100 Z1.6 F15000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F7500
G1 X87.114 Y100.017 E.00263
; LINE_WIDTH: 0.470635
G1 X87.033 Y100.033 E.00278
G1 X87 Y100.194 E.00556
; LINE_WIDTH: 0.43172
G1 X87 Y151.806 E1.5851
; LINE_WIDTH: 0.448395
G1 X87.017 Y151.886 E.00263
; LINE_WIDTH: 0.470635
G1 X87.033 Y151.967 E.00278
G1 X87.194 Y152 E.00556
; LINE_WIDTH: 0.43172
G1 X143.697 Y152 E1.73533
; WIPE_START
G1 X141.697 Y152 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X149.326 Y152.232 Z1.6 F15000
G1 X160.876 Y152.583 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X161.412 Y152.046 E.02259
G1 X161.412 Y151.513
G1 X160.342 Y152.583 E.04505
G1 X159.809 Y152.583
G1 X160.974 Y151.417 E.04908
G1 X160.441 Y151.417
G1 X159.276 Y152.583 E.04908
G1 X158.742 Y152.583
G1 X159.908 Y151.417 E.04908
G1 X159.374 Y151.417
G1 X158.209 Y152.583 E.04908
G1 X157.676 Y152.583
G1 X158.841 Y151.417 E.04908
G1 X158.308 Y151.417
G1 X157.143 Y152.583 E.04908
G1 X156.609 Y152.583
G1 X157.775 Y151.417 E.04908
G1 X157.241 Y151.417
G1 X156.076 Y152.583 E.04908
G1 X155.543 Y152.583
G1 X156.708 Y151.417 E.04908
G1 X156.175 Y151.417
G1 X155.01 Y152.583 E.04908
M73 P86 R1
G1 X154.476 Y152.583
G1 X155.642 Y151.417 E.04908
G1 X155.108 Y151.417
G1 X153.943 Y152.583 E.04908
G1 X153.41 Y152.583
G1 X154.575 Y151.417 E.04908
G1 X154.042 Y151.417
G1 X152.877 Y152.583 E.04908
G1 X152.343 Y152.583
G1 X153.509 Y151.417 E.04908
G1 X152.975 Y151.417
G1 X151.81 Y152.583 E.04908
G1 X151.277 Y152.583
G1 X152.442 Y151.417 E.04908
G1 X151.909 Y151.417
G1 X150.744 Y152.583 E.04908
G1 X150.21 Y152.583
G1 X151.376 Y151.417 E.04908
G1 X150.842 Y151.417
G1 X149.677 Y152.583 E.04908
G1 X149.144 Y152.583
G1 X150.309 Y151.417 E.04908
G1 X149.776 Y151.417
G1 X148.611 Y152.583 E.04908
G1 X148.077 Y152.583
G1 X149.243 Y151.417 E.04908
G1 X148.709 Y151.417
G1 X147.544 Y152.583 E.04908
G1 X147.011 Y152.583
G1 X148.176 Y151.417 E.04908
G1 X147.643 Y151.417
G1 X146.478 Y152.583 E.04908
G1 X145.944 Y152.583
G1 X147.11 Y151.417 E.04908
G1 X146.576 Y151.417
G1 X145.411 Y152.583 E.04908
G1 X144.878 Y152.583
G1 X146.043 Y151.417 E.04908
G1 X145.51 Y151.417
G1 X144.345 Y152.583 E.04908
G1 X144.123 Y152.271
G1 X144.977 Y151.417 E.03596
; WIPE_START
M204 S5000
G1 X144.123 Y152.271 E-.45874
G1 X144.345 Y152.583 E-.14531
G1 X144.635 Y152.292 E-.15596
; WIPE_END
G1 E-.04 F1800
G1 X144.498 Y144.661 Z1.6 F15000
G1 X143.697 Y100 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F7500
G1 X87.194 Y100 E1.73533
; WIPE_START
G1 X89.194 Y100 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X96.827 Y100.062 Z1.6 F15000
G1 X160.616 Y100.583 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F6000
M204 S1000
G1 X161.412 Y99.787 E.03351
G1 X161.248 Y99.417
G1 X160.083 Y100.583 E.04908
G1 X159.55 Y100.583
G1 X160.715 Y99.417 E.04908
G1 X160.182 Y99.417
M73 P87 R1
G1 X159.017 Y100.583 E.04908
G1 X158.483 Y100.583
G1 X159.649 Y99.417 E.04908
G1 X159.115 Y99.417
G1 X157.95 Y100.583 E.04908
G1 X157.417 Y100.583
G1 X158.582 Y99.417 E.04908
G1 X158.049 Y99.417
G1 X156.884 Y100.583 E.04908
G1 X156.35 Y100.583
G1 X157.515 Y99.417 E.04908
G1 X156.982 Y99.417
G1 X155.817 Y100.583 E.04908
G1 X155.284 Y100.583
G1 X156.449 Y99.417 E.04908
G1 X155.916 Y99.417
G1 X154.75 Y100.583 E.04908
G1 X154.217 Y100.583
G1 X155.382 Y99.417 E.04908
G1 X154.849 Y99.417
G1 X153.684 Y100.583 E.04908
G1 X153.151 Y100.583
G1 X154.316 Y99.417 E.04908
G1 X153.783 Y99.417
G1 X152.617 Y100.583 E.04908
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
G1 X145.152 Y100.583 E.04908
G1 X144.619 Y100.583
G1 X145.784 Y99.417 E.04908
G1 X145.251 Y99.417
G1 X144.123 Y100.545 E.0475
G1 X144.123 Y100.012
G1 X144.717 Y99.417 E.02504
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X144.123 Y100.012 E-.31943
G1 X144.123 Y100.545 E-.20264
G1 X144.566 Y100.102 E-.23793
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/10
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F15000
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
; OBJECT_ID: 81
G1 X87.398 Y100.398
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5919
G1 X87.398 Y151.602 E1.64654
G1 X127.049 Y151.602 E1.27505
G1 X127.049 Y152.398 E.02559
G1 X86.602 Y152.398 E1.30064
G1 X86.602 Y99.602 E1.69772
G1 X127.049 Y99.602 E1.30064
G1 X127.049 Y100.398 E.02559
G1 X87.458 Y100.398 E1.27312
M204 S250
G1 X87.79 Y100.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5919
M204 S2500
G1 X87.79 Y151.21 E1.50184
G1 X144.768 Y151.21 E1.69719
G1 X144.768 Y152.79 E.04706
G1 X86.21 Y152.79 E1.74425
G1 X86.21 Y99.21 E1.59597
G1 X144.768 Y99.21 E1.74425
G1 X144.768 Y100.79 E.04706
G1 X87.85 Y100.79 E1.6954
; WIPE_START
G1 F6000
M204 S5000
G1 X87.848 Y102.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.194 Y100 Z1.8 F15000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F5919
G1 X126.846 Y100 E1.2178
; WIPE_START
G1 F7500
G1 X124.846 Y100 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.475 Y99.766 Z1.8 F15000
G1 X143.811 Y99.417 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5919
M204 S1000
G1 X144.561 Y100.167 E.03157
G1 X144.443 Y100.583
G1 X143.278 Y99.417 E.04908
G1 X142.745 Y99.417
G1 X143.91 Y100.583 E.04908
G1 X143.377 Y100.583
G1 X142.212 Y99.417 E.04908
G1 X141.678 Y99.417
G1 X142.843 Y100.583 E.04908
G1 X142.31 Y100.583
G1 X141.145 Y99.417 E.04908
G1 X140.612 Y99.417
G1 X141.777 Y100.583 E.04908
G1 X141.244 Y100.583
G1 X140.078 Y99.417 E.04908
G1 X139.545 Y99.417
G1 X140.71 Y100.583 E.04908
M73 P88 R1
G1 X140.177 Y100.583
G1 X139.012 Y99.417 E.04908
G1 X138.479 Y99.417
G1 X139.644 Y100.583 E.04908
G1 X139.111 Y100.583
G1 X137.945 Y99.417 E.04908
G1 X137.412 Y99.417
G1 X138.577 Y100.583 E.04908
G1 X138.044 Y100.583
G1 X136.879 Y99.417 E.04908
G1 X136.346 Y99.417
G1 X137.511 Y100.583 E.04908
G1 X136.978 Y100.583
G1 X135.812 Y99.417 E.04908
G1 X135.279 Y99.417
G1 X136.444 Y100.583 E.04908
G1 X135.911 Y100.583
G1 X134.746 Y99.417 E.04908
G1 X134.213 Y99.417
G1 X135.378 Y100.583 E.04908
G1 X134.845 Y100.583
G1 X133.679 Y99.417 E.04908
G1 X133.146 Y99.417
G1 X134.311 Y100.583 E.04908
G1 X133.778 Y100.583
M73 P89 R1
G1 X132.613 Y99.417 E.04908
G1 X132.08 Y99.417
G1 X133.245 Y100.583 E.04908
G1 X132.712 Y100.583
G1 X131.546 Y99.417 E.04908
G1 X131.013 Y99.417
G1 X132.178 Y100.583 E.04908
G1 X131.645 Y100.583
G1 X130.48 Y99.417 E.04908
G1 X129.947 Y99.417
G1 X131.112 Y100.583 E.04908
G1 X130.579 Y100.583
G1 X129.413 Y99.417 E.04908
G1 X128.88 Y99.417
G1 X130.045 Y100.583 E.04908
G1 X129.512 Y100.583
G1 X128.347 Y99.417 E.04908
G1 X127.814 Y99.417
G1 X128.979 Y100.583 E.04908
G1 X128.446 Y100.583
G1 X127.28 Y99.417 E.04908
G1 X127.272 Y99.942
G1 X127.912 Y100.583 E.02697
; WIPE_START
G1 F6000
M204 S5000
G1 X127.272 Y99.942 E-.34409
G1 X127.28 Y99.417 E-.1995
G1 X127.683 Y99.82 E-.21641
; WIPE_END
G1 E-.04 F1800
G1 X120.051 Y99.854 Z1.8 F15000
G1 X87.194 Y100 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F5919
G1 X87.114 Y100.017 E.00263
; LINE_WIDTH: 0.470635
G1 X87.033 Y100.033 E.00278
G1 X87 Y100.194 E.00556
; LINE_WIDTH: 0.43172
G1 X87 Y151.806 E1.5851
; LINE_WIDTH: 0.448395
G1 X87.017 Y151.886 E.00263
; LINE_WIDTH: 0.470635
G1 X87.033 Y151.967 E.00278
G1 X87.194 Y152 E.00556
; LINE_WIDTH: 0.43172
G1 X126.846 Y152 E1.2178
; WIPE_START
G1 F7500
G1 X124.846 Y152 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.475 Y151.769 Z1.8 F15000
G1 X144.085 Y151.417 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5919
M204 S1000
G1 X144.561 Y151.893 E.02003
G1 X144.561 Y152.426
G1 X143.552 Y151.417 E.04249
G1 X143.019 Y151.417
G1 X144.184 Y152.583 E.04908
G1 X143.651 Y152.583
G1 X142.486 Y151.417 E.04908
G1 X141.952 Y151.417
G1 X143.118 Y152.583 E.04908
G1 X142.584 Y152.583
G1 X141.419 Y151.417 E.04908
G1 X140.886 Y151.417
G1 X142.051 Y152.583 E.04908
G1 X141.518 Y152.583
G1 X140.353 Y151.417 E.04908
G1 X139.819 Y151.417
G1 X140.984 Y152.583 E.04908
G1 X140.451 Y152.583
G1 X139.286 Y151.417 E.04908
G1 X138.753 Y151.417
G1 X139.918 Y152.583 E.04908
G1 X139.385 Y152.583
G1 X138.219 Y151.417 E.04908
G1 X137.686 Y151.417
G1 X138.851 Y152.583 E.04908
G1 X138.318 Y152.583
G1 X137.153 Y151.417 E.04908
G1 X136.62 Y151.417
G1 X137.785 Y152.583 E.04908
G1 X137.252 Y152.583
G1 X136.086 Y151.417 E.04908
G1 X135.553 Y151.417
G1 X136.718 Y152.583 E.04908
G1 X136.185 Y152.583
G1 X135.02 Y151.417 E.04908
G1 X134.487 Y151.417
G1 X135.652 Y152.583 E.04908
G1 X135.119 Y152.583
G1 X133.953 Y151.417 E.04908
G1 X133.42 Y151.417
G1 X134.585 Y152.583 E.04908
G1 X134.052 Y152.583
G1 X132.887 Y151.417 E.04908
G1 X132.354 Y151.417
G1 X133.519 Y152.583 E.04908
G1 X132.986 Y152.583
G1 X131.82 Y151.417 E.04908
G1 X131.287 Y151.417
G1 X132.452 Y152.583 E.04908
G1 X131.919 Y152.583
G1 X130.754 Y151.417 E.04908
G1 X130.221 Y151.417
G1 X131.386 Y152.583 E.04908
G1 X130.853 Y152.583
G1 X129.687 Y151.417 E.04908
G1 X129.154 Y151.417
G1 X130.319 Y152.583 E.04908
G1 X129.786 Y152.583
G1 X128.621 Y151.417 E.04908
G1 X128.088 Y151.417
G1 X129.253 Y152.583 E.04908
G1 X128.72 Y152.583
G1 X127.554 Y151.417 E.04908
G1 X127.272 Y151.668
G1 X128.186 Y152.583 E.03852
G1 X127.653 Y152.583
G1 X127.272 Y152.202 E.01605
; WIPE_START
G1 F6000
M204 S5000
G1 X127.653 Y152.583 E-.20478
G1 X128.186 Y152.583 E-.20264
G1 X127.53 Y151.927 E-.35258
; WIPE_END
G1 E-.04 F1800
G1 X135.157 Y152.217 Z1.8 F15000
G1 X144.58 Y152.577 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0920794
G1 F5919
G1 X144.19 Y152.577 E.00151
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X144.58 Y152.577 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/10
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I1.217 J0 P1  F15000
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
; OBJECT_ID: 81
G1 X87.398 Y100.398
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4795
M73 P90 R1
G1 X87.398 Y151.602 E1.64654
G1 X110.199 Y151.602 E.73319
G1 X110.199 Y152.398 E.02559
G1 X86.602 Y152.398 E.75878
G1 X86.602 Y99.602 E1.69772
G1 X110.199 Y99.602 E.75878
G1 X110.199 Y100.398 E.02559
G1 X87.458 Y100.398 E.73126
M204 S250
G1 X87.79 Y100.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4795
M204 S2500
G1 X87.79 Y151.21 E1.50184
G1 X127.917 Y151.21 E1.19525
G1 X127.917 Y152.79 E.04706
G1 X86.21 Y152.79 E1.24232
G1 X86.21 Y99.21 E1.59597
G1 X127.917 Y99.21 E1.24232
G1 X127.917 Y100.79 E.04706
G1 X87.85 Y100.79 E1.19347
; WIPE_START
G1 F6000
M204 S5000
G1 X87.848 Y102.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.194 Y100 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.448395
G1 F4795
G1 X87.114 Y100.017 E.00263
; LINE_WIDTH: 0.470635
G1 X87.033 Y100.033 E.00278
G1 X87 Y100.194 E.00556
; LINE_WIDTH: 0.43172
G1 X87 Y151.806 E1.5851
; LINE_WIDTH: 0.448395
G1 X87.017 Y151.886 E.00263
; LINE_WIDTH: 0.470635
G1 X87.033 Y151.967 E.00278
G1 X87.194 Y152 E.00556
; LINE_WIDTH: 0.43172
G1 X109.995 Y152 E.70026
; WIPE_START
G1 F7500
G1 X107.995 Y152 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X115.624 Y152.23 Z2 F15000
G1 X127.28 Y152.583 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4795
M204 S1000
G1 X127.71 Y152.153 E.0181
G1 X127.71 Y151.62
G1 X126.747 Y152.583 E.04056
G1 X126.214 Y152.583
G1 X127.379 Y151.417 E.04908
G1 X126.846 Y151.417
G1 X125.681 Y152.583 E.04908
G1 X125.147 Y152.583
G1 X126.312 Y151.417 E.04908
G1 X125.779 Y151.417
G1 X124.614 Y152.583 E.04908
G1 X124.081 Y152.583
G1 X125.246 Y151.417 E.04908
G1 X124.713 Y151.417
G1 X123.547 Y152.583 E.04908
G1 X123.014 Y152.583
G1 X124.179 Y151.417 E.04908
G1 X123.646 Y151.417
G1 X122.481 Y152.583 E.04908
G1 X121.948 Y152.583
G1 X123.113 Y151.417 E.04908
M73 P90 R0
G1 X122.58 Y151.417
G1 X121.414 Y152.583 E.04908
M73 P91 R0
G1 X120.881 Y152.583
G1 X122.046 Y151.417 E.04908
G1 X121.513 Y151.417
G1 X120.348 Y152.583 E.04908
G1 X119.815 Y152.583
G1 X120.98 Y151.417 E.04908
G1 X120.447 Y151.417
G1 X119.281 Y152.583 E.04908
G1 X118.748 Y152.583
G1 X119.913 Y151.417 E.04908
G1 X119.38 Y151.417
G1 X118.215 Y152.583 E.04908
G1 X117.682 Y152.583
G1 X118.847 Y151.417 E.04908
G1 X118.314 Y151.417
G1 X117.148 Y152.583 E.04908
G1 X116.615 Y152.583
G1 X117.78 Y151.417 E.04908
G1 X117.247 Y151.417
G1 X116.082 Y152.583 E.04908
G1 X115.549 Y152.583
G1 X116.714 Y151.417 E.04908
G1 X116.181 Y151.417
G1 X115.015 Y152.583 E.04908
G1 X114.482 Y152.583
G1 X115.647 Y151.417 E.04908
G1 X115.114 Y151.417
G1 X113.949 Y152.583 E.04908
G1 X113.416 Y152.583
G1 X114.581 Y151.417 E.04908
G1 X114.048 Y151.417
G1 X112.882 Y152.583 E.04908
G1 X112.349 Y152.583
G1 X113.514 Y151.417 E.04908
G1 X112.981 Y151.417
G1 X111.816 Y152.583 E.04908
G1 X111.283 Y152.583
G1 X112.448 Y151.417 E.04908
G1 X111.915 Y151.417
G1 X110.749 Y152.583 E.04908
G1 X110.421 Y152.378
G1 X111.381 Y151.417 E.04045
G1 X110.848 Y151.417
G1 X110.421 Y151.844 E.01799
; WIPE_START
G1 F6000
M204 S5000
G1 X110.848 Y151.417 E-.22944
G1 X111.381 Y151.417 E-.20264
G1 X110.771 Y152.028 E-.32792
; WIPE_END
G1 E-.04 F1800
G1 X118.399 Y151.768 Z2 F15000
G1 X127.729 Y151.45 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.149798
G1 F4795
G1 X127.54 Y151.45 E.00159
G1 X127.449 Y151.488 E.00083
; WIPE_START
G1 F7500
G1 X127.54 Y151.45 E-.26041
G1 X127.729 Y151.45 E-.49959
; WIPE_END
G1 E-.04 F1800
G1 X127.623 Y143.818 Z2 F15000
G1 X127.021 Y100.583 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4795
M204 S1000
G1 X127.71 Y99.894 E.02901
G1 X127.653 Y99.417
G1 X126.488 Y100.583 E.04908
G1 X125.955 Y100.583
G1 X127.12 Y99.417 E.04908
G1 X126.587 Y99.417
G1 X125.421 Y100.583 E.04908
G1 X124.888 Y100.583
G1 X126.053 Y99.417 E.04908
G1 X125.52 Y99.417
G1 X124.355 Y100.583 E.04908
G1 X123.822 Y100.583
G1 X124.987 Y99.417 E.04908
G1 X124.454 Y99.417
G1 X123.288 Y100.583 E.04908
G1 X122.755 Y100.583
G1 X123.92 Y99.417 E.04908
G1 X123.387 Y99.417
G1 X122.222 Y100.583 E.04908
G1 X121.689 Y100.583
G1 X122.854 Y99.417 E.04908
G1 X122.32 Y99.417
G1 X121.155 Y100.583 E.04908
G1 X120.622 Y100.583
G1 X121.787 Y99.417 E.04908
G1 X121.254 Y99.417
G1 X120.089 Y100.583 E.04908
G1 X119.555 Y100.583
G1 X120.721 Y99.417 E.04908
G1 X120.187 Y99.417
G1 X119.022 Y100.583 E.04908
G1 X118.489 Y100.583
G1 X119.654 Y99.417 E.04908
G1 X119.121 Y99.417
G1 X117.956 Y100.583 E.04909
G1 X117.422 Y100.583
G1 X118.588 Y99.417 E.04908
M73 P92 R0
G1 X118.054 Y99.417
G1 X116.889 Y100.583 E.04908
G1 X116.356 Y100.583
G1 X117.521 Y99.417 E.04908
G1 X116.988 Y99.417
G1 X115.823 Y100.583 E.04908
G1 X115.289 Y100.583
G1 X116.455 Y99.417 E.04908
G1 X115.921 Y99.417
G1 X114.756 Y100.583 E.04908
G1 X114.223 Y100.583
G1 X115.388 Y99.417 E.04908
G1 X114.855 Y99.417
G1 X113.69 Y100.583 E.04908
G1 X113.156 Y100.583
G1 X114.322 Y99.417 E.04908
G1 X113.788 Y99.417
G1 X112.623 Y100.583 E.04908
G1 X112.09 Y100.583
G1 X113.255 Y99.417 E.04908
G1 X112.722 Y99.417
G1 X111.557 Y100.583 E.04908
G1 X111.023 Y100.583
G1 X112.189 Y99.417 E.04908
G1 X111.655 Y99.417
G1 X110.49 Y100.583 E.04908
G1 X110.421 Y100.118
G1 X111.122 Y99.417 E.02953
; WIPE_START
G1 F6000
M204 S5000
G1 X110.421 Y100.118 E-.37671
G1 X110.49 Y100.583 E-.17835
G1 X110.871 Y100.201 E-.20494
; WIPE_END
G1 E-.04 F1800
G1 X109.995 Y100 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F4795
G1 X87.194 Y100 E.70026
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X89.194 Y100 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/10
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F15000
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
; OBJECT_ID: 81
G1 X87.398 Y100.398
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3522
G1 X87.398 Y151.602 E1.64654
G1 X93.348 Y151.602 E.19132
G1 X93.348 Y152.398 E.02559
G1 X86.602 Y152.398 E.21691
G1 X86.602 Y99.602 E1.69772
G1 X93.348 Y99.602 E.21691
G1 X93.348 Y100.398 E.02559
G1 X87.458 Y100.398 E.18939
M204 S250
G1 X87.79 Y100.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3522
M204 S2500
G1 X87.79 Y151.21 E1.50184
G1 X111.066 Y151.21 E.69332
G1 X111.066 Y152.79 E.04706
G1 X86.21 Y152.79 E.74039
G1 X86.21 Y99.21 E1.59597
G1 X111.066 Y99.21 E.74039
G1 X111.066 Y100.79 E.04706
G1 X87.85 Y100.79 E.69154
; WIPE_START
G1 F6000
M204 S5000
G1 X87.848 Y102.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.194 Y100 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F3522
G1 X93.144 Y100 E.18273
; WIPE_START
G1 F7500
G1 X91.144 Y100 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X87.194 Y100 Z2.2 F15000
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.448395
G1 F3522
G1 X87.114 Y100.017 E.00263
; LINE_WIDTH: 0.470635
G1 X87.033 Y100.033 E.00278
G1 X87 Y100.194 E.00556
; LINE_WIDTH: 0.43172
G1 X87 Y151.806 E1.5851
; LINE_WIDTH: 0.448395
G1 X87.017 Y151.886 E.00263
; LINE_WIDTH: 0.470635
G1 X87.033 Y151.967 E.00278
G1 X87.194 Y152 E.00556
; LINE_WIDTH: 0.43172
G1 X93.144 Y152 E.18273
; WIPE_START
G1 F7500
G1 X91.144 Y152 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X98.776 Y151.917 Z2.2 F15000
G1 X110.859 Y151.786 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3522
M204 S1000
G1 X110.49 Y151.417 E.01554
G1 X109.957 Y151.417
G1 X110.859 Y152.32 E.038
G1 X110.589 Y152.583
G1 X109.424 Y151.417 E.04908
G1 X108.89 Y151.417
G1 X110.056 Y152.583 E.04908
G1 X109.522 Y152.583
G1 X108.357 Y151.417 E.04908
G1 X107.824 Y151.417
G1 X108.989 Y152.583 E.04908
G1 X108.456 Y152.583
M73 P93 R0
G1 X107.291 Y151.417 E.04908
G1 X106.757 Y151.417
G1 X107.923 Y152.583 E.04908
G1 X107.389 Y152.583
G1 X106.224 Y151.417 E.04908
G1 X105.691 Y151.417
G1 X106.856 Y152.583 E.04908
G1 X106.323 Y152.583
G1 X105.158 Y151.417 E.04908
G1 X104.624 Y151.417
G1 X105.789 Y152.583 E.04908
G1 X105.256 Y152.583
G1 X104.091 Y151.417 E.04908
G1 X103.558 Y151.417
G1 X104.723 Y152.583 E.04908
G1 X104.19 Y152.583
G1 X103.024 Y151.417 E.04908
G1 X102.491 Y151.417
G1 X103.656 Y152.583 E.04908
G1 X103.123 Y152.583
G1 X101.958 Y151.417 E.04908
G1 X101.425 Y151.417
G1 X102.59 Y152.583 E.04908
G1 X102.057 Y152.583
G1 X100.891 Y151.417 E.04908
G1 X100.358 Y151.417
G1 X101.523 Y152.583 E.04908
G1 X100.99 Y152.583
G1 X99.825 Y151.417 E.04908
G1 X99.292 Y151.417
G1 X100.457 Y152.583 E.04908
G1 X99.924 Y152.583
G1 X98.758 Y151.417 E.04908
G1 X98.225 Y151.417
G1 X99.39 Y152.583 E.04908
G1 X98.857 Y152.583
G1 X97.692 Y151.417 E.04908
G1 X97.159 Y151.417
G1 X98.324 Y152.583 E.04908
G1 X97.791 Y152.583
G1 X96.625 Y151.417 E.04908
G1 X96.092 Y151.417
G1 X97.257 Y152.583 E.04908
G1 X96.724 Y152.583
G1 X95.559 Y151.417 E.04908
G1 X95.026 Y151.417
G1 X96.191 Y152.583 E.04908
G1 X95.658 Y152.583
G1 X94.492 Y151.417 E.04908
G1 X93.959 Y151.417
G1 X95.124 Y152.583 E.04908
G1 X94.591 Y152.583
G1 X93.57 Y151.562 E.04301
G1 X93.57 Y152.095
G1 X94.058 Y152.583 E.02054
; WIPE_START
G1 F6000
M204 S5000
G1 X93.57 Y152.095 E-.26206
G1 X93.57 Y151.562 E-.20264
G1 X94.12 Y152.111 E-.2953
; WIPE_END
G1 E-.04 F1800
G1 X96.349 Y144.812 Z2.2 F15000
G1 X110.216 Y99.417 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F3522
M204 S1000
G1 X110.859 Y100.06 E.02708
G1 X110.848 Y100.583
G1 X109.683 Y99.417 E.04908
M73 P94 R0
G1 X109.15 Y99.417
G1 X110.315 Y100.583 E.04908
G1 X109.782 Y100.583
G1 X108.616 Y99.417 E.04908
G1 X108.083 Y99.417
G1 X109.248 Y100.583 E.04908
G1 X108.715 Y100.583
G1 X107.55 Y99.417 E.04908
G1 X107.017 Y99.417
G1 X108.182 Y100.583 E.04908
G1 X107.648 Y100.583
G1 X106.483 Y99.417 E.04908
G1 X105.95 Y99.417
G1 X107.115 Y100.583 E.04908
G1 X106.582 Y100.583
G1 X105.417 Y99.417 E.04908
G1 X104.883 Y99.417
G1 X106.049 Y100.583 E.04908
G1 X105.515 Y100.583
G1 X104.35 Y99.417 E.04908
G1 X103.817 Y99.417
G1 X104.982 Y100.583 E.04908
G1 X104.449 Y100.583
G1 X103.284 Y99.417 E.04908
G1 X102.75 Y99.417
G1 X103.916 Y100.583 E.04908
G1 X103.382 Y100.583
G1 X102.217 Y99.417 E.04908
G1 X101.684 Y99.417
G1 X102.849 Y100.583 E.04908
G1 X102.316 Y100.583
G1 X101.151 Y99.417 E.04908
G1 X100.617 Y99.417
G1 X101.783 Y100.583 E.04908
G1 X101.249 Y100.583
G1 X100.084 Y99.417 E.04908
G1 X99.551 Y99.417
G1 X100.716 Y100.583 E.04908
G1 X100.183 Y100.583
G1 X99.018 Y99.417 E.04908
G1 X98.484 Y99.417
G1 X99.65 Y100.583 E.04908
G1 X99.116 Y100.583
G1 X97.951 Y99.417 E.04908
G1 X97.418 Y99.417
G1 X98.583 Y100.583 E.04908
G1 X98.05 Y100.583
G1 X96.885 Y99.417 E.04908
G1 X96.351 Y99.417
G1 X97.517 Y100.583 E.04908
G1 X96.983 Y100.583
G1 X95.818 Y99.417 E.04908
G1 X95.285 Y99.417
G1 X96.45 Y100.583 E.04908
G1 X95.917 Y100.583
G1 X94.752 Y99.417 E.04908
G1 X94.218 Y99.417
G1 X95.384 Y100.583 E.04908
G1 X94.85 Y100.583
G1 X93.685 Y99.417 E.04908
G1 X93.57 Y99.836
G1 X94.317 Y100.583 E.03146
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F6000
M204 S5000
G1 X93.57 Y99.836 E-.40137
G1 X93.685 Y99.417 E-.16486
G1 X94.046 Y99.778 E-.19377
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/10
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F15000
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
; OBJECT_ID: 81
G1 X87.79 Y100.79
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F2619
M204 S2500
G1 X87.79 Y151.21 E1.50184
G1 X94.215 Y151.21 E.19139
G1 X94.215 Y152.79 E.04706
G1 X86.21 Y152.79 E.23846
G1 X86.21 Y99.21 E1.59597
G1 X94.215 Y99.21 E.23846
G1 X94.215 Y100.79 E.04706
G1 X87.85 Y100.79 E.18961
; WIPE_START
G1 F6000
M204 S5000
G1 X87.848 Y102.79 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X88.801 Y110.363 Z2.4 F15000
G1 X94.008 Y151.726 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Top surface
G1 F2619
M204 S1000
G1 X93.152 Y152.583 E.03607
G1 X92.619 Y152.583
G1 X93.784 Y151.417 E.04909
G1 X93.251 Y151.417
G1 X92.085 Y152.583 E.04909
G1 X91.552 Y152.583
G1 X92.717 Y151.417 E.04909
G1 X92.184 Y151.417
G1 X91.019 Y152.583 E.04909
G1 X90.486 Y152.583
G1 X91.651 Y151.417 E.04909
G1 X91.118 Y151.417
G1 X89.952 Y152.583 E.04909
G1 X89.419 Y152.583
G1 X90.584 Y151.417 E.04909
G1 X90.051 Y151.417
G1 X88.886 Y152.583 E.04909
G1 X88.352 Y152.583
G1 X89.518 Y151.417 E.04909
G1 X88.984 Y151.417
G1 X87.819 Y152.583 E.04909
G1 X87.286 Y152.583
G1 X88.451 Y151.417 E.04909
G1 X87.918 Y151.417
G1 X86.753 Y152.583 E.04909
G1 X86.417 Y152.385
G1 X87.583 Y151.219 E.04909
G1 X87.583 Y150.686
G1 X86.417 Y151.851 E.04909
G1 X86.417 Y151.318
G1 X87.583 Y150.153 E.04909
G1 X87.583 Y149.62
G1 X86.417 Y150.785 E.04909
G1 X86.417 Y150.252
G1 X87.583 Y149.086 E.04909
M73 P95 R0
G1 X87.583 Y148.553
G1 X86.417 Y149.718 E.04909
G1 X86.417 Y149.185
G1 X87.583 Y148.02 E.04909
G1 X87.583 Y147.487
G1 X86.417 Y148.652 E.04909
G1 X86.417 Y148.119
G1 X87.583 Y146.953 E.04909
G1 X87.583 Y146.42
G1 X86.417 Y147.585 E.04909
G1 X86.417 Y147.052
G1 X87.583 Y145.887 E.04909
G1 X87.583 Y145.354
G1 X86.417 Y146.519 E.04909
G1 X86.417 Y145.986
G1 X87.583 Y144.82 E.04909
G1 X87.583 Y144.287
G1 X86.417 Y145.452 E.04909
G1 X86.417 Y144.919
G1 X87.583 Y143.754 E.04909
G1 X87.583 Y143.221
G1 X86.417 Y144.386 E.04909
G1 X86.417 Y143.853
G1 X87.583 Y142.687 E.04909
G1 X87.583 Y142.154
G1 X86.417 Y143.319 E.04909
G1 X86.417 Y142.786
G1 X87.583 Y141.621 E.04909
G1 X87.583 Y141.088
G1 X86.417 Y142.253 E.04909
G1 X86.417 Y141.72
G1 X87.583 Y140.554 E.04909
G1 X87.583 Y140.021
G1 X86.417 Y141.186 E.04909
G1 X86.417 Y140.653
G1 X87.583 Y139.488 E.04909
G1 X87.583 Y138.955
G1 X86.417 Y140.12 E.04909
G1 X86.417 Y139.587
G1 X87.583 Y138.421 E.04909
M73 P96 R0
G1 X87.583 Y137.888
G1 X86.417 Y139.053 E.04909
G1 X86.417 Y138.52
G1 X87.583 Y137.355 E.04909
G1 X87.583 Y136.822
G1 X86.417 Y137.987 E.04909
G1 X86.417 Y137.453
G1 X87.583 Y136.288 E.04909
G1 X87.583 Y135.755
G1 X86.417 Y136.92 E.04909
G1 X86.417 Y136.387
G1 X87.583 Y135.222 E.04909
G1 X87.583 Y134.688
G1 X86.417 Y135.854 E.04909
G1 X86.417 Y135.32
G1 X87.583 Y134.155 E.04909
G1 X87.583 Y133.622
G1 X86.417 Y134.787 E.04909
G1 X86.417 Y134.254
G1 X87.583 Y133.089 E.04909
G1 X87.583 Y132.555
G1 X86.417 Y133.721 E.04909
G1 X86.417 Y133.187
G1 X87.583 Y132.022 E.04909
G1 X87.583 Y131.489
G1 X86.417 Y132.654 E.04909
G1 X86.417 Y132.121
G1 X87.583 Y130.956 E.04909
G1 X87.583 Y130.422
G1 X86.417 Y131.588 E.04909
G1 X86.417 Y131.054
G1 X87.583 Y129.889 E.04909
G1 X87.583 Y129.356
G1 X86.417 Y130.521 E.04909
G1 X86.417 Y129.988
G1 X87.583 Y128.823 E.04909
G1 X87.583 Y128.289
G1 X86.417 Y129.455 E.04909
G1 X86.417 Y128.921
G1 X87.583 Y127.756 E.04909
G1 X87.583 Y127.223
G1 X86.417 Y128.388 E.04909
G1 X86.417 Y127.855
G1 X87.583 Y126.69 E.04909
G1 X87.583 Y126.156
G1 X86.417 Y127.322 E.04909
G1 X86.417 Y126.788
G1 X87.583 Y125.623 E.04909
G1 X87.583 Y125.09
G1 X86.417 Y126.255 E.04909
G1 X86.417 Y125.722
G1 X87.583 Y124.557 E.04909
G1 X87.583 Y124.023
G1 X86.417 Y125.189 E.04909
G1 X86.417 Y124.655
G1 X87.583 Y123.49 E.04909
G1 X87.583 Y122.957
G1 X86.417 Y124.122 E.04909
G1 X86.417 Y123.589
G1 X87.583 Y122.424 E.04909
G1 X87.583 Y121.89
G1 X86.417 Y123.056 E.04909
G1 X86.417 Y122.522
G1 X87.583 Y121.357 E.04909
G1 X87.583 Y120.824
G1 X86.417 Y121.989 E.04909
G1 X86.417 Y121.456
G1 X87.583 Y120.291 E.04909
G1 X87.583 Y119.757
G1 X86.417 Y120.923 E.04909
G1 X86.417 Y120.389
G1 X87.583 Y119.224 E.04909
G1 X87.583 Y118.691
G1 X86.417 Y119.856 E.04909
G1 X86.417 Y119.323
G1 X87.583 Y118.158 E.04909
G1 X87.583 Y117.624
G1 X86.417 Y118.789 E.04909
G1 X86.417 Y118.256
G1 X87.583 Y117.091 E.04909
G1 X87.583 Y116.558
G1 X86.417 Y117.723 E.04909
G1 X86.417 Y117.19
G1 X87.583 Y116.024 E.04909
G1 X87.583 Y115.491
G1 X86.417 Y116.656 E.04909
G1 X86.417 Y116.123
G1 X87.583 Y114.958 E.04909
G1 X87.583 Y114.425
G1 X86.417 Y115.59 E.04909
G1 X86.417 Y115.057
G1 X87.583 Y113.891 E.04909
G1 X87.583 Y113.358
G1 X86.417 Y114.523 E.04909
G1 X86.417 Y113.99
G1 X87.583 Y112.825 E.04909
G1 X87.583 Y112.292
G1 X86.417 Y113.457 E.04909
G1 X86.417 Y112.924
G1 X87.583 Y111.758 E.04909
G1 X87.583 Y111.225
G1 X86.417 Y112.39 E.04909
G1 X86.417 Y111.857
G1 X87.583 Y110.692 E.04909
G1 X87.583 Y110.159
G1 X86.417 Y111.324 E.04909
G1 X86.417 Y110.791
G1 X87.583 Y109.625 E.04909
G1 X87.583 Y109.092
G1 X86.417 Y110.257 E.04909
G1 X86.417 Y109.724
G1 X87.583 Y108.559 E.04909
G1 X87.583 Y108.026
G1 X86.417 Y109.191 E.04909
G1 X86.417 Y108.658
G1 X87.583 Y107.492 E.04909
G1 X87.583 Y106.959
G1 X86.417 Y108.124 E.04909
G1 X86.417 Y107.591
G1 X87.583 Y106.426 E.04909
G1 X87.583 Y105.893
G1 X86.417 Y107.058 E.04909
G1 X86.417 Y106.525
G1 X87.583 Y105.359 E.04909
G1 X87.583 Y104.826
G1 X86.417 Y105.991 E.04909
G1 X86.417 Y105.458
G1 X87.583 Y104.293 E.04909
G1 X87.583 Y103.76
G1 X86.417 Y104.925 E.04909
G1 X86.417 Y104.392
G1 X87.583 Y103.226 E.04909
G1 X87.583 Y102.693
G1 X86.417 Y103.858 E.04909
G1 X86.417 Y103.325
G1 X87.583 Y102.16 E.04909
G1 X87.583 Y101.627
G1 X86.417 Y102.792 E.04909
G1 X86.417 Y102.259
G1 X87.583 Y101.093 E.04909
; WIPE_START
G1 F6000
M204 S5000
M73 P97 R0
G1 X86.417 Y102.259 E-.6262
G1 X86.417 Y102.611 E-.1338
; WIPE_END
G1 E-.04 F1800
G1 X93.426 Y100.583 Z2.4 F15000
G1 Z2
G1 E.8 F1800
G1 F2619
M204 S1000
G1 X94.008 Y100 E.02453
G1 X94.008 Y99.467
G1 X92.893 Y100.583 E.04699
G1 X92.359 Y100.583
G1 X93.525 Y99.417 E.04909
G1 X92.991 Y99.417
G1 X91.826 Y100.583 E.04909
G1 X91.293 Y100.583
G1 X92.458 Y99.417 E.04909
G1 X91.925 Y99.417
G1 X90.76 Y100.583 E.04909
G1 X90.226 Y100.583
G1 X91.392 Y99.417 E.04909
G1 X90.858 Y99.417
G1 X89.693 Y100.583 E.04909
G1 X89.16 Y100.583
G1 X90.325 Y99.417 E.04909
G1 X89.792 Y99.417
G1 X88.627 Y100.583 E.04909
G1 X88.093 Y100.583
G1 X89.259 Y99.417 E.04909
G1 X88.725 Y99.417
G1 X86.417 Y101.725 E.09722
G1 X86.417 Y101.192
G1 X88.192 Y99.417 E.07476
G1 X87.659 Y99.417
G1 X86.417 Y100.659 E.05229
G1 X86.417 Y100.125
G1 X87.125 Y99.417 E.02983
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F6000
M204 S5000
G1 X86.417 Y100.125 E-.38054
G1 X86.417 Y100.659 E-.20264
G1 X86.746 Y100.33 E-.17682
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.217 J0 P1  F15000
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

