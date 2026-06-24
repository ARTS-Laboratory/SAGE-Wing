; HEADER_BLOCK_START
; BambuStudio 02.07.01.57
; model printing time: 11m 32s; total estimated time: 17m 53s
; total layer number: 10
; total filament length [mm] : 1498.40
; total filament volume [cm^3] : 3604.08
; total filament weight [g] : 4.54
; model label id: 113,149
; object max height: 2.00,2.00
; filament_density: 1.26
; filament_diameter: 1.75
; max_z_height: 2.00
; filament: 1
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
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
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
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
; different_settings_to_system = default_acceleration;gap_infill_speed;initial_layer_acceleration;initial_layer_infill_speed;initial_layer_speed;initial_layer_travel_acceleration;inner_wall_speed;internal_solid_infill_speed;outer_wall_acceleration;outer_wall_speed;small_perimeter_speed;sparse_infill_acceleration;sparse_infill_speed;top_surface_acceleration;top_surface_speed;travel_acceleration;travel_speed;vertical_shell_speed;;
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
; enable_support = 0
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
; filament_change_length = 5
; filament_change_length_nc = 10
; filament_colour = #00AE42
; filament_colour_type = 1
; filament_cooling_before_tower = 0
; filament_cost = 24.99
; filament_density = 1.26
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
; filament_ids = P0188981
; filament_is_mixed = 0
; filament_is_support = 0
; filament_long_retractions_when_cut = 1
; filament_map = 1
; filament_map_2 = 0
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 21
; filament_metal_stickiness = None
; filament_minimal_purge_on_wipe_tower = 15
; filament_mixed_components = ""
; filament_mixed_gradient = 0
; filament_mixed_gradient_curve = ""
; filament_mixed_gradient_per_part = 0
; filament_mixed_gradient_range = ""
; filament_mixed_sublayer_ratios = ""
; filament_multi_colour = #00AE42
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
; filament_settings_id = "Protopasta PLA Conductive @Bambu Lab P1S 0.4 nozzle"
; filament_shrink = 100%
; filament_soluble = 0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
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
; impact_strength_z = 13.8
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
; internal_solid_infill_speed = 125
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
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
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
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; overhang_threshold_participating_cooling = 95%
; overhang_totally_speed = 10
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
; print_settings_id = Print
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
; skeleton_infill_density = 15%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 15%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; skirt_per_object = 1
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1
; slow_down_layer_time = 4
; slow_down_min_speed = 20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 25%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 0
; sparse_infill_acceleration = 50%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 0
; sparse_infill_lattice_angle_1 = -45
; sparse_infill_lattice_angle_2 = 45
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 135
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
; support_interface_speed = 80
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
; support_speed = 150
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
; vertical_shell_speed = 40%
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
M620.1 E F523.843 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P3 R17
G1 E50 F200
M400
M104 S220
G92 E0
M73 P27 R12
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P28 R12
G1 E-0.5 F300

M73 P30 R12
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
M73 P31 R12
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
    G29 A X78 Y123 I101.131 J40.0348
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

M142 P1 R35 S40
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
; object ids of layer 1 start: 113,149
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
; object ids of this layer1 end: 113,149
M625
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
M73 P32 R12
G1 X178.274 Y160.178
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
G1 X79.989 Y160.178 E3.66078
G1 X79.989 Y151.892 E.30862
G1 X178.274 Y151.892 E3.66078
G1 X178.274 Y160.118 E.30638
M204 S3000
G1 X178.731 Y160.635 F15000
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X79.531 Y160.635 E3.69482
G1 X79.531 Y151.435 E.34267
G1 X178.731 Y151.435 E3.69482
G1 X178.731 Y160.575 E.34043
; WIPE_START
M73 P33 R11
G1 X176.731 Y160.576 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X178.081 Y153.064 Z.6 F15000
G1 X178.092 Y153.004 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50246
G1 F3000
M204 S250
G1 X177.368 Y152.28 E.03832
G1 X176.718 Y152.28 E.02434
G1 X177.886 Y153.448 E.06184
G1 X177.886 Y154.098 E.02434
G1 X176.068 Y152.28 E.09626
G1 X175.418 Y152.28 E.02434
G1 X177.886 Y154.748 E.13067
G1 X177.886 Y155.398 E.02434
G1 X174.769 Y152.28 E.16509
M73 P34 R11
G1 X174.119 Y152.28 E.02434
G1 X177.886 Y156.048 E.19951
G1 X177.886 Y156.697 E.02434
G1 X173.469 Y152.28 E.23392
G1 X172.819 Y152.28 E.02434
G1 X177.886 Y157.347 E.26834
G1 X177.886 Y157.997 E.02434
G1 X172.169 Y152.28 E.30276
G1 X171.519 Y152.28 E.02434
G1 X177.886 Y158.647 E.33717
G1 X177.886 Y159.297 E.02434
G1 X170.869 Y152.28 E.37159
G1 X170.219 Y152.28 E.02434
G1 X177.728 Y159.789 E.39765
G1 X177.078 Y159.789 E.02434
G1 X169.569 Y152.28 E.39765
G1 X168.92 Y152.28 E.02434
G1 X176.428 Y159.789 E.39765
M73 P35 R11
G1 X175.778 Y159.789 E.02434
G1 X168.27 Y152.28 E.39765
G1 X167.62 Y152.28 E.02434
G1 X175.129 Y159.789 E.39765
G1 X174.479 Y159.789 E.02434
G1 X166.97 Y152.28 E.39765
G1 X166.32 Y152.28 E.02434
G1 X173.829 Y159.789 E.39765
G1 X173.179 Y159.789 E.02434
M73 P36 R11
G1 X165.67 Y152.28 E.39765
G1 X165.02 Y152.28 E.02434
G1 X172.529 Y159.789 E.39765
G1 X171.879 Y159.789 E.02434
G1 X164.37 Y152.28 E.39765
G1 X163.72 Y152.28 E.02434
M73 P37 R11
G1 X171.229 Y159.789 E.39765
G1 X170.579 Y159.789 E.02434
G1 X163.071 Y152.28 E.39765
G1 X162.421 Y152.28 E.02434
G1 X169.93 Y159.789 E.39765
G1 X169.28 Y159.789 E.02434
G1 X161.771 Y152.28 E.39765
G1 X161.121 Y152.28 E.02434
G1 X168.63 Y159.789 E.39765
G1 X167.98 Y159.789 E.02434
G1 X160.471 Y152.28 E.39765
G1 X159.821 Y152.28 E.02434
G1 X167.33 Y159.789 E.39765
G1 X166.68 Y159.789 E.02434
G1 X159.171 Y152.28 E.39765
G1 X158.521 Y152.28 E.02434
G1 X166.03 Y159.789 E.39765
G1 X165.38 Y159.789 E.02434
G1 X157.871 Y152.28 E.39765
G1 X157.222 Y152.28 E.02434
G1 X164.73 Y159.789 E.39765
G1 X164.081 Y159.789 E.02434
G1 X156.572 Y152.28 E.39765
G1 X155.922 Y152.28 E.02434
G1 X163.431 Y159.789 E.39765
G1 X162.781 Y159.789 E.02434
G1 X155.272 Y152.28 E.39765
G1 X154.622 Y152.28 E.02434
G1 X162.131 Y159.789 E.39765
G1 X161.481 Y159.789 E.02434
G1 X153.972 Y152.28 E.39765
G1 X153.322 Y152.28 E.02434
G1 X160.831 Y159.789 E.39765
G1 X160.181 Y159.789 E.02434
G1 X152.672 Y152.28 E.39765
G1 X152.022 Y152.28 E.02434
G1 X159.531 Y159.789 E.39765
G1 X158.881 Y159.789 E.02434
G1 X151.373 Y152.28 E.39765
G1 X150.723 Y152.28 E.02434
G1 X158.232 Y159.789 E.39765
G1 X157.582 Y159.789 E.02434
G1 X150.073 Y152.28 E.39765
G1 X149.423 Y152.28 E.02434
G1 X156.932 Y159.789 E.39765
G1 X156.282 Y159.789 E.02434
G1 X148.773 Y152.28 E.39765
G1 X148.123 Y152.28 E.02434
G1 X155.632 Y159.789 E.39765
G1 X154.982 Y159.789 E.02434
G1 X147.473 Y152.28 E.39765
G1 X146.823 Y152.28 E.02434
G1 X154.332 Y159.789 E.39765
G1 X153.682 Y159.789 E.02434
G1 X146.173 Y152.28 E.39765
G1 X145.524 Y152.28 E.02434
G1 X153.032 Y159.789 E.39765
G1 X152.383 Y159.789 E.02434
G1 X144.874 Y152.28 E.39765
G1 X144.224 Y152.28 E.02434
G1 X151.733 Y159.789 E.39765
G1 X151.083 Y159.789 E.02434
G1 X143.574 Y152.28 E.39765
G1 X142.924 Y152.28 E.02434
G1 X150.433 Y159.789 E.39765
M73 P38 R11
G1 X149.783 Y159.789 E.02434
G1 X142.274 Y152.28 E.39765
G1 X141.624 Y152.28 E.02434
G1 X149.133 Y159.789 E.39765
G1 X148.483 Y159.789 E.02434
G1 X140.974 Y152.28 E.39765
G1 X140.324 Y152.28 E.02434
G1 X147.833 Y159.789 E.39765
G1 X147.183 Y159.789 E.02434
G1 X139.675 Y152.28 E.39765
G1 X139.025 Y152.28 E.02434
G1 X146.534 Y159.789 E.39765
G1 X145.884 Y159.789 E.02434
G1 X138.375 Y152.28 E.39765
G1 X137.725 Y152.28 E.02434
G1 X145.234 Y159.789 E.39765
G1 X144.584 Y159.789 E.02434
G1 X137.075 Y152.28 E.39765
G1 X136.425 Y152.28 E.02434
G1 X143.934 Y159.789 E.39765
G1 X143.284 Y159.789 E.02434
G1 X135.775 Y152.28 E.39765
G1 X135.125 Y152.28 E.02434
G1 X142.634 Y159.789 E.39765
G1 X141.984 Y159.789 E.02434
G1 X134.475 Y152.28 E.39765
G1 X133.826 Y152.28 E.02434
G1 X141.334 Y159.789 E.39765
G1 X140.685 Y159.789 E.02434
G1 X133.176 Y152.28 E.39765
M73 P38 R10
G1 X132.526 Y152.28 E.02434
G1 X140.035 Y159.789 E.39765
G1 X139.385 Y159.789 E.02434
G1 X131.876 Y152.28 E.39765
G1 X131.226 Y152.28 E.02434
G1 X138.735 Y159.789 E.39765
G1 X138.085 Y159.789 E.02434
G1 X130.576 Y152.28 E.39765
G1 X129.926 Y152.28 E.02434
G1 X137.435 Y159.789 E.39765
G1 X136.785 Y159.789 E.02434
G1 X129.276 Y152.28 E.39765
G1 X128.627 Y152.28 E.02434
G1 X136.135 Y159.789 E.39765
G1 X135.485 Y159.789 E.02434
G1 X127.977 Y152.28 E.39765
G1 X127.327 Y152.28 E.02434
G1 X134.836 Y159.789 E.39765
G1 X134.186 Y159.789 E.02434
G1 X126.677 Y152.28 E.39765
G1 X126.027 Y152.28 E.02434
G1 X133.536 Y159.789 E.39765
G1 X132.886 Y159.789 E.02434
G1 X125.377 Y152.28 E.39765
G1 X124.727 Y152.28 E.02434
G1 X132.236 Y159.789 E.39765
M73 P39 R10
G1 X131.586 Y159.789 E.02434
G1 X124.077 Y152.28 E.39765
G1 X123.427 Y152.28 E.02434
G1 X130.936 Y159.789 E.39765
G1 X130.286 Y159.789 E.02434
G1 X122.778 Y152.28 E.39765
G1 X122.128 Y152.28 E.02434
G1 X129.636 Y159.789 E.39765
G1 X128.987 Y159.789 E.02434
G1 X121.478 Y152.28 E.39765
G1 X120.828 Y152.28 E.02434
G1 X128.337 Y159.789 E.39765
G1 X127.687 Y159.789 E.02434
G1 X120.178 Y152.28 E.39765
G1 X119.528 Y152.28 E.02434
G1 X127.037 Y159.789 E.39765
G1 X126.387 Y159.789 E.02434
G1 X118.878 Y152.28 E.39765
G1 X118.228 Y152.28 E.02434
G1 X125.737 Y159.789 E.39765
G1 X125.087 Y159.789 E.02434
G1 X117.578 Y152.28 E.39765
G1 X116.929 Y152.28 E.02434
G1 X124.437 Y159.789 E.39765
G1 X123.787 Y159.789 E.02434
G1 X116.279 Y152.28 E.39765
G1 X115.629 Y152.28 E.02434
G1 X123.138 Y159.789 E.39765
G1 X122.488 Y159.789 E.02434
G1 X114.979 Y152.28 E.39765
G1 X114.329 Y152.28 E.02434
G1 X121.838 Y159.789 E.39765
G1 X121.188 Y159.789 E.02434
G1 X113.679 Y152.28 E.39765
G1 X113.029 Y152.28 E.02434
G1 X120.538 Y159.789 E.39765
G1 X119.888 Y159.789 E.02434
G1 X112.379 Y152.28 E.39765
G1 X111.729 Y152.28 E.02434
G1 X119.238 Y159.789 E.39765
G1 X118.588 Y159.789 E.02434
G1 X111.08 Y152.28 E.39765
G1 X110.43 Y152.28 E.02434
G1 X117.938 Y159.789 E.39765
G1 X117.289 Y159.789 E.02434
G1 X109.78 Y152.28 E.39765
G1 X109.13 Y152.28 E.02434
G1 X116.639 Y159.789 E.39765
G1 X115.989 Y159.789 E.02434
G1 X108.48 Y152.28 E.39765
G1 X107.83 Y152.28 E.02434
G1 X115.339 Y159.789 E.39765
G1 X114.689 Y159.789 E.02434
G1 X107.18 Y152.28 E.39765
G1 X106.53 Y152.28 E.02434
G1 X114.039 Y159.789 E.39765
M73 P40 R10
G1 X113.389 Y159.789 E.02434
G1 X105.88 Y152.28 E.39765
G1 X105.231 Y152.28 E.02434
G1 X112.739 Y159.789 E.39765
G1 X112.09 Y159.789 E.02434
G1 X104.581 Y152.28 E.39765
G1 X103.931 Y152.28 E.02434
G1 X111.44 Y159.789 E.39765
G1 X110.79 Y159.789 E.02434
G1 X103.281 Y152.28 E.39765
G1 X102.631 Y152.28 E.02434
G1 X110.14 Y159.789 E.39765
G1 X109.49 Y159.789 E.02434
G1 X101.981 Y152.28 E.39765
G1 X101.331 Y152.28 E.02434
G1 X108.84 Y159.789 E.39765
G1 X108.19 Y159.789 E.02434
G1 X100.681 Y152.28 E.39765
G1 X100.031 Y152.28 E.02434
G1 X107.54 Y159.789 E.39765
G1 X106.89 Y159.789 E.02434
G1 X99.382 Y152.28 E.39765
G1 X98.732 Y152.28 E.02434
G1 X106.241 Y159.789 E.39765
G1 X105.591 Y159.789 E.02434
G1 X98.082 Y152.28 E.39765
G1 X97.432 Y152.28 E.02434
G1 X104.941 Y159.789 E.39765
G1 X104.291 Y159.789 E.02434
G1 X96.782 Y152.28 E.39765
G1 X96.132 Y152.28 E.02434
G1 X103.641 Y159.789 E.39765
G1 X102.991 Y159.789 E.02434
G1 X95.482 Y152.28 E.39765
G1 X94.832 Y152.28 E.02434
G1 X102.341 Y159.789 E.39765
G1 X101.691 Y159.789 E.02434
G1 X94.182 Y152.28 E.39765
G1 X93.533 Y152.28 E.02434
G1 X101.041 Y159.789 E.39765
G1 X100.392 Y159.789 E.02434
G1 X92.883 Y152.28 E.39765
G1 X92.233 Y152.28 E.02434
G1 X99.742 Y159.789 E.39765
G1 X99.092 Y159.789 E.02434
G1 X91.583 Y152.28 E.39765
G1 X90.933 Y152.28 E.02434
G1 X98.442 Y159.789 E.39765
G1 X97.792 Y159.789 E.02434
G1 X90.283 Y152.28 E.39765
G1 X89.633 Y152.28 E.02434
G1 X97.142 Y159.789 E.39765
G1 X96.492 Y159.789 E.02434
G1 X88.983 Y152.28 E.39765
G1 X88.333 Y152.28 E.02434
G1 X95.842 Y159.789 E.39765
M73 P41 R10
G1 X95.192 Y159.789 E.02434
G1 X87.684 Y152.28 E.39765
G1 X87.034 Y152.28 E.02434
G1 X94.543 Y159.789 E.39765
G1 X93.893 Y159.789 E.02434
G1 X86.384 Y152.28 E.39765
G1 X85.734 Y152.28 E.02434
G1 X93.243 Y159.789 E.39765
G1 X92.593 Y159.789 E.02434
G1 X85.084 Y152.28 E.39765
G1 X84.434 Y152.28 E.02434
G1 X91.943 Y159.789 E.39765
G1 X91.293 Y159.789 E.02434
G1 X83.784 Y152.28 E.39765
G1 X83.134 Y152.28 E.02434
G1 X90.643 Y159.789 E.39765
G1 X89.993 Y159.789 E.02434
G1 X82.484 Y152.28 E.39765
G1 X81.835 Y152.28 E.02434
G1 X89.343 Y159.789 E.39765
G1 X88.694 Y159.789 E.02434
G1 X81.185 Y152.28 E.39765
G1 X80.535 Y152.28 E.02434
G1 X88.044 Y159.789 E.39765
G1 X87.394 Y159.789 E.02434
G1 X80.377 Y152.772 E.37159
G1 X80.377 Y153.422 E.02434
G1 X86.744 Y159.789 E.33717
G1 X86.094 Y159.789 E.02434
G1 X80.377 Y154.072 E.30276
G1 X80.377 Y154.722 E.02434
G1 X85.444 Y159.789 E.26834
G1 X84.794 Y159.789 E.02434
G1 X80.377 Y155.372 E.23392
G1 X80.377 Y156.022 E.02434
G1 X84.144 Y159.789 E.19951
G1 X83.494 Y159.789 E.02434
G1 X80.377 Y156.672 E.16509
G1 X80.377 Y157.322 E.02434
G1 X82.845 Y159.789 E.13067
G1 X82.195 Y159.789 E.02434
G1 X80.377 Y157.972 E.09626
G1 X80.377 Y158.621 E.02434
G1 X81.545 Y159.789 E.06184
G1 X80.895 Y159.789 E.02434
G1 X80.171 Y159.066 E.03832
; OBJECT_ID: 113
; WIPE_START
G1 X80.895 Y159.789 E-.38882
G1 X81.545 Y159.789 E-.24696
G1 X81.314 Y159.558 E-.12422
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 113
M624 AQAAAAAAAAA=
M204 S3000
G1 X88.61 Y157.318 Z.6 F15000
G1 X177.143 Y130.143 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1500
M204 S250
G1 X78.857 Y130.143 E3.66078
M73 P42 R10
G1 X78.857 Y121.857 E.30862
G1 X177.143 Y121.857 E3.66078
G1 X177.143 Y130.083 E.30638
M204 S3000
G1 X177.6 Y130.6 F15000
; FEATURE: Outer wall
G1 F1500
M204 S250
G1 X78.4 Y130.6 E3.69482
G1 X78.4 Y121.4 E.34267
G1 X177.6 Y121.4 E3.69482
G1 X177.6 Y130.54 E.34043
; WIPE_START
G1 X175.6 Y130.541 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S3000
G1 X176.949 Y123.029 Z.6 F15000
G1 X176.96 Y122.969 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.50246
G1 F3000
M204 S250
G1 X176.237 Y122.246 E.03832
G1 X175.587 Y122.246 E.02434
G1 X176.754 Y123.413 E.06184
G1 X176.754 Y124.063 E.02434
G1 X174.937 Y122.246 E.09626
G1 X174.287 Y122.246 E.02434
G1 X176.754 Y124.713 E.13067
G1 X176.754 Y125.363 E.02434
G1 X173.637 Y122.246 E.16509
G1 X172.987 Y122.246 E.02434
G1 X176.754 Y126.013 E.19951
G1 X176.754 Y126.663 E.02434
G1 X172.337 Y122.246 E.23392
G1 X171.687 Y122.246 E.02434
G1 X176.754 Y127.313 E.26834
G1 X176.754 Y127.963 E.02434
G1 X171.037 Y122.246 E.30276
G1 X170.388 Y122.246 E.02434
G1 X176.754 Y128.612 E.33717
G1 X176.754 Y129.262 E.02434
G1 X169.738 Y122.246 E.37159
G1 X169.088 Y122.246 E.02434
G1 X176.597 Y129.754 E.39765
G1 X175.947 Y129.754 E.02434
G1 X168.438 Y122.246 E.39765
G1 X167.788 Y122.246 E.02434
G1 X175.297 Y129.754 E.39765
G1 X174.647 Y129.754 E.02434
G1 X167.138 Y122.246 E.39765
G1 X166.488 Y122.246 E.02434
G1 X173.997 Y129.754 E.39765
G1 X173.347 Y129.754 E.02434
G1 X165.838 Y122.246 E.39765
G1 X165.188 Y122.246 E.02434
M73 P43 R10
G1 X172.697 Y129.754 E.39765
G1 X172.047 Y129.754 E.02434
G1 X164.539 Y122.246 E.39765
G1 X163.889 Y122.246 E.02434
G1 X171.398 Y129.754 E.39765
G1 X170.748 Y129.754 E.02434
G1 X163.239 Y122.246 E.39765
G1 X162.589 Y122.246 E.02434
M73 P44 R9
G1 X170.098 Y129.754 E.39765
G1 X169.448 Y129.754 E.02434
G1 X161.939 Y122.246 E.39765
G1 X161.289 Y122.246 E.02434
G1 X168.798 Y129.754 E.39765
G1 X168.148 Y129.754 E.02434
G1 X160.639 Y122.246 E.39765
G1 X159.989 Y122.246 E.02434
G1 X167.498 Y129.754 E.39765
G1 X166.848 Y129.754 E.02434
G1 X159.34 Y122.246 E.39765
G1 X158.69 Y122.246 E.02434
G1 X166.198 Y129.754 E.39765
G1 X165.549 Y129.754 E.02434
G1 X158.04 Y122.246 E.39765
G1 X157.39 Y122.246 E.02434
G1 X164.899 Y129.754 E.39765
G1 X164.249 Y129.754 E.02434
G1 X156.74 Y122.246 E.39765
G1 X156.09 Y122.246 E.02434
G1 X163.599 Y129.754 E.39765
G1 X162.949 Y129.754 E.02434
G1 X155.44 Y122.246 E.39765
G1 X154.79 Y122.246 E.02434
G1 X162.299 Y129.754 E.39765
G1 X161.649 Y129.754 E.02434
G1 X154.14 Y122.246 E.39765
G1 X153.491 Y122.246 E.02434
G1 X160.999 Y129.754 E.39765
G1 X160.349 Y129.754 E.02434
G1 X152.841 Y122.246 E.39765
G1 X152.191 Y122.246 E.02434
G1 X159.7 Y129.754 E.39765
G1 X159.05 Y129.754 E.02434
G1 X151.541 Y122.246 E.39765
G1 X150.891 Y122.246 E.02434
G1 X158.4 Y129.754 E.39765
G1 X157.75 Y129.754 E.02434
G1 X150.241 Y122.246 E.39765
G1 X149.591 Y122.246 E.02434
G1 X157.1 Y129.754 E.39765
G1 X156.45 Y129.754 E.02434
G1 X148.941 Y122.246 E.39765
G1 X148.291 Y122.246 E.02434
G1 X155.8 Y129.754 E.39765
G1 X155.15 Y129.754 E.02434
G1 X147.642 Y122.246 E.39765
G1 X146.992 Y122.246 E.02434
G1 X154.5 Y129.754 E.39765
G1 X153.851 Y129.754 E.02434
G1 X146.342 Y122.246 E.39765
G1 X145.692 Y122.246 E.02434
G1 X153.201 Y129.754 E.39765
M73 P45 R9
G1 X152.551 Y129.754 E.02434
G1 X145.042 Y122.246 E.39765
G1 X144.392 Y122.246 E.02434
G1 X151.901 Y129.754 E.39765
G1 X151.251 Y129.754 E.02434
G1 X143.742 Y122.246 E.39765
G1 X143.092 Y122.246 E.02434
G1 X150.601 Y129.754 E.39765
G1 X149.951 Y129.754 E.02434
G1 X142.442 Y122.246 E.39765
G1 X141.793 Y122.246 E.02434
G1 X149.301 Y129.754 E.39765
G1 X148.651 Y129.754 E.02434
G1 X141.143 Y122.246 E.39765
G1 X140.493 Y122.246 E.02434
G1 X148.002 Y129.754 E.39765
G1 X147.352 Y129.754 E.02434
G1 X139.843 Y122.246 E.39765
G1 X139.193 Y122.246 E.02434
G1 X146.702 Y129.754 E.39765
G1 X146.052 Y129.754 E.02434
G1 X138.543 Y122.246 E.39765
G1 X137.893 Y122.246 E.02434
G1 X145.402 Y129.754 E.39765
G1 X144.752 Y129.754 E.02434
G1 X137.243 Y122.246 E.39765
G1 X136.593 Y122.246 E.02434
G1 X144.102 Y129.754 E.39765
G1 X143.452 Y129.754 E.02434
G1 X135.944 Y122.246 E.39765
G1 X135.294 Y122.246 E.02434
G1 X142.803 Y129.754 E.39765
G1 X142.153 Y129.754 E.02434
G1 X134.644 Y122.246 E.39765
G1 X133.994 Y122.246 E.02434
G1 X141.503 Y129.754 E.39765
G1 X140.853 Y129.754 E.02434
G1 X133.344 Y122.246 E.39765
G1 X132.694 Y122.246 E.02434
G1 X140.203 Y129.754 E.39765
G1 X139.553 Y129.754 E.02434
G1 X132.044 Y122.246 E.39765
G1 X131.394 Y122.246 E.02434
G1 X138.903 Y129.754 E.39765
G1 X138.253 Y129.754 E.02434
G1 X130.744 Y122.246 E.39765
G1 X130.095 Y122.246 E.02434
G1 X137.603 Y129.754 E.39765
G1 X136.954 Y129.754 E.02434
G1 X129.445 Y122.246 E.39765
G1 X128.795 Y122.246 E.02434
G1 X136.304 Y129.754 E.39765
G1 X135.654 Y129.754 E.02434
G1 X128.145 Y122.246 E.39765
G1 X127.495 Y122.246 E.02434
G1 X135.004 Y129.754 E.39765
M73 P46 R9
G1 X134.354 Y129.754 E.02434
G1 X126.845 Y122.246 E.39765
G1 X126.195 Y122.246 E.02434
G1 X133.704 Y129.754 E.39765
G1 X133.054 Y129.754 E.02434
G1 X125.545 Y122.246 E.39765
G1 X124.895 Y122.246 E.02434
G1 X132.404 Y129.754 E.39765
G1 X131.754 Y129.754 E.02434
G1 X124.246 Y122.246 E.39765
G1 X123.596 Y122.246 E.02434
G1 X131.105 Y129.754 E.39765
G1 X130.455 Y129.754 E.02434
G1 X122.946 Y122.246 E.39765
G1 X122.296 Y122.246 E.02434
G1 X129.805 Y129.754 E.39765
G1 X129.155 Y129.754 E.02434
G1 X121.646 Y122.246 E.39765
G1 X120.996 Y122.246 E.02434
G1 X128.505 Y129.754 E.39765
G1 X127.855 Y129.754 E.02434
G1 X120.346 Y122.246 E.39765
G1 X119.696 Y122.246 E.02434
G1 X127.205 Y129.754 E.39765
G1 X126.555 Y129.754 E.02434
G1 X119.046 Y122.246 E.39765
G1 X118.397 Y122.246 E.02434
G1 X125.905 Y129.754 E.39765
G1 X125.256 Y129.754 E.02434
G1 X117.747 Y122.246 E.39765
G1 X117.097 Y122.246 E.02434
G1 X124.606 Y129.754 E.39765
G1 X123.956 Y129.754 E.02434
G1 X116.447 Y122.246 E.39765
G1 X115.797 Y122.246 E.02434
G1 X123.306 Y129.754 E.39765
G1 X122.656 Y129.754 E.02434
G1 X115.147 Y122.246 E.39765
G1 X114.497 Y122.246 E.02434
G1 X122.006 Y129.754 E.39765
G1 X121.356 Y129.754 E.02434
G1 X113.847 Y122.246 E.39765
G1 X113.197 Y122.246 E.02434
G1 X120.706 Y129.754 E.39765
G1 X120.056 Y129.754 E.02434
G1 X112.548 Y122.246 E.39765
G1 X111.898 Y122.246 E.02434
G1 X119.407 Y129.754 E.39765
G1 X118.757 Y129.754 E.02434
G1 X111.248 Y122.246 E.39765
G1 X110.598 Y122.246 E.02434
G1 X118.107 Y129.754 E.39765
G1 X117.457 Y129.754 E.02434
G1 X109.948 Y122.246 E.39765
G1 X109.298 Y122.246 E.02434
G1 X116.807 Y129.754 E.39765
M73 P47 R9
G1 X116.157 Y129.754 E.02434
G1 X108.648 Y122.246 E.39765
G1 X107.998 Y122.246 E.02434
G1 X115.507 Y129.754 E.39765
G1 X114.857 Y129.754 E.02434
G1 X107.348 Y122.246 E.39765
G1 X106.699 Y122.246 E.02434
G1 X114.207 Y129.754 E.39765
G1 X113.558 Y129.754 E.02434
G1 X106.049 Y122.246 E.39765
G1 X105.399 Y122.246 E.02434
G1 X112.908 Y129.754 E.39765
G1 X112.258 Y129.754 E.02434
G1 X104.749 Y122.246 E.39765
G1 X104.099 Y122.246 E.02434
G1 X111.608 Y129.754 E.39765
G1 X110.958 Y129.754 E.02434
G1 X103.449 Y122.246 E.39765
G1 X102.799 Y122.246 E.02434
G1 X110.308 Y129.754 E.39765
G1 X109.658 Y129.754 E.02434
G1 X102.149 Y122.246 E.39765
G1 X101.5 Y122.246 E.02434
G1 X109.008 Y129.754 E.39765
G1 X108.358 Y129.754 E.02434
G1 X100.85 Y122.246 E.39765
G1 X100.2 Y122.246 E.02434
G1 X107.709 Y129.754 E.39765
G1 X107.059 Y129.754 E.02434
G1 X99.55 Y122.246 E.39765
G1 X98.9 Y122.246 E.02434
G1 X106.409 Y129.754 E.39765
G1 X105.759 Y129.754 E.02434
G1 X98.25 Y122.246 E.39765
G1 X97.6 Y122.246 E.02434
G1 X105.109 Y129.754 E.39765
G1 X104.459 Y129.754 E.02434
G1 X96.95 Y122.246 E.39765
G1 X96.3 Y122.246 E.02434
G1 X103.809 Y129.754 E.39765
G1 X103.159 Y129.754 E.02434
G1 X95.651 Y122.246 E.39765
G1 X95.001 Y122.246 E.02434
G1 X102.509 Y129.754 E.39765
G1 X101.86 Y129.754 E.02434
G1 X94.351 Y122.246 E.39765
G1 X93.701 Y122.246 E.02434
G1 X101.21 Y129.754 E.39765
G1 X100.56 Y129.754 E.02434
G1 X93.051 Y122.246 E.39765
G1 X92.401 Y122.246 E.02434
G1 X99.91 Y129.754 E.39765
G1 X99.26 Y129.754 E.02434
G1 X91.751 Y122.246 E.39765
G1 X91.101 Y122.246 E.02434
G1 X98.61 Y129.754 E.39765
M73 P48 R9
G1 X97.96 Y129.754 E.02434
G1 X90.451 Y122.246 E.39765
G1 X89.802 Y122.246 E.02434
G1 X97.31 Y129.754 E.39765
G1 X96.66 Y129.754 E.02434
G1 X89.152 Y122.246 E.39765
G1 X88.502 Y122.246 E.02434
G1 X96.011 Y129.754 E.39765
G1 X95.361 Y129.754 E.02434
G1 X87.852 Y122.246 E.39765
G1 X87.202 Y122.246 E.02434
G1 X94.711 Y129.754 E.39765
G1 X94.061 Y129.754 E.02434
G1 X86.552 Y122.246 E.39765
G1 X85.902 Y122.246 E.02434
G1 X93.411 Y129.754 E.39765
G1 X92.761 Y129.754 E.02434
G1 X85.252 Y122.246 E.39765
G1 X84.602 Y122.246 E.02434
G1 X92.111 Y129.754 E.39765
G1 X91.461 Y129.754 E.02434
G1 X83.953 Y122.246 E.39765
G1 X83.303 Y122.246 E.02434
G1 X90.811 Y129.754 E.39765
G1 X90.162 Y129.754 E.02434
G1 X82.653 Y122.246 E.39765
G1 X82.003 Y122.246 E.02434
G1 X89.512 Y129.754 E.39765
G1 X88.862 Y129.754 E.02434
G1 X81.353 Y122.246 E.39765
G1 X80.703 Y122.246 E.02434
G1 X88.212 Y129.754 E.39765
G1 X87.562 Y129.754 E.02434
G1 X80.053 Y122.246 E.39765
G1 X79.403 Y122.246 E.02434
G1 X86.912 Y129.754 E.39765
G1 X86.262 Y129.754 E.02434
G1 X79.246 Y122.738 E.37159
G1 X79.246 Y123.388 E.02434
G1 X85.612 Y129.754 E.33717
G1 X84.963 Y129.754 E.02434
G1 X79.246 Y124.037 E.30276
G1 X79.246 Y124.687 E.02434
G1 X84.313 Y129.754 E.26834
G1 X83.663 Y129.754 E.02434
G1 X79.246 Y125.337 E.23392
G1 X79.246 Y125.987 E.02434
G1 X83.013 Y129.754 E.19951
G1 X82.363 Y129.754 E.02434
G1 X79.246 Y126.637 E.16509
G1 X79.246 Y127.287 E.02434
G1 X81.713 Y129.754 E.13067
G1 X81.063 Y129.754 E.02434
G1 X79.246 Y127.937 E.09626
G1 X79.246 Y128.587 E.02434
G1 X80.413 Y129.754 E.06184
M73 P49 R9
G1 X79.763 Y129.754 E.02434
G1 X79.04 Y129.031 E.03832
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X79.763 Y129.754 E-.38882
G1 X80.413 Y129.754 E-.24696
G1 X80.182 Y129.523 E-.12422
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 113
M625
; layer num/total_layer_count: 2/10
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S5000
G17
G3 Z.6 I1.217 J0 P1  F15000
; object ids of layer 2 start: 113,149
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
; object ids of this layer2 end: 113,149
M625
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X178.529 Y160.433
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X79.734 Y160.433 E3.27724
G1 X79.734 Y151.637 E.29178
G1 X178.529 Y151.637 E3.27724
G1 X178.529 Y160.373 E.28979
M204 S250
G1 X178.921 Y160.825 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X79.341 Y160.825 E3.05982
G1 X79.341 Y151.245 E.29437
G1 X178.921 Y151.245 E3.05982
G1 X178.921 Y160.765 E.29252
; WIPE_START
M204 S5000
G1 X176.921 Y160.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.601 Y160.269 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42126
G1 F7500
G1 X178.196 Y159.674 E.02595
G1 X178.196 Y159.139 E.0165
G1 X177.236 Y160.099 E.04188
G1 X176.7 Y160.099 E.0165
G1 X178.196 Y158.604 E.06521
G1 X178.196 Y158.069 E.0165
G1 X176.165 Y160.099 E.08854
G1 X175.63 Y160.099 E.0165
G1 X178.196 Y157.534 E.11187
G1 X178.196 Y156.999 E.0165
G1 X175.095 Y160.099 E.1352
G1 X174.56 Y160.099 E.0165
G1 X178.196 Y156.464 E.15853
G1 X178.196 Y155.928 E.0165
M73 P49 R8
G1 X174.025 Y160.099 E.18185
G1 X173.49 Y160.099 E.0165
G1 X178.196 Y155.393 E.20518
G1 X178.196 Y154.858 E.0165
G1 X172.955 Y160.099 E.22851
G1 X172.42 Y160.099 E.0165
G1 X178.196 Y154.323 E.25184
G1 X178.196 Y153.788 E.0165
G1 X171.885 Y160.099 E.27517
G1 X171.35 Y160.099 E.0165
G1 X178.196 Y153.253 E.2985
G1 X178.196 Y152.718 E.0165
G1 X170.815 Y160.099 E.32182
G1 X170.28 Y160.099 E.0165
G1 X178.196 Y152.183 E.34515
G1 X178.196 Y151.97 E.00657
G1 X177.874 Y151.97 E.00993
G1 X169.745 Y160.099 E.35444
G1 X169.21 Y160.099 E.0165
G1 X177.339 Y151.97 E.35444
G1 X176.804 Y151.97 E.0165
G1 X168.675 Y160.099 E.35444
G1 X168.14 Y160.099 E.0165
M73 P50 R8
G1 X176.269 Y151.97 E.35444
G1 X175.734 Y151.97 E.0165
G1 X167.605 Y160.099 E.35444
G1 X167.07 Y160.099 E.0165
G1 X175.199 Y151.97 E.35444
G1 X174.664 Y151.97 E.0165
G1 X166.534 Y160.099 E.35444
G1 X165.999 Y160.099 E.0165
G1 X174.129 Y151.97 E.35444
G1 X173.594 Y151.97 E.0165
G1 X165.464 Y160.099 E.35444
G1 X164.929 Y160.099 E.0165
G1 X173.059 Y151.97 E.35444
G1 X172.524 Y151.97 E.0165
G1 X164.394 Y160.099 E.35444
G1 X163.859 Y160.099 E.0165
G1 X171.989 Y151.97 E.35444
G1 X171.453 Y151.97 E.0165
G1 X163.324 Y160.099 E.35444
G1 X162.789 Y160.099 E.0165
G1 X170.918 Y151.97 E.35444
G1 X170.383 Y151.97 E.0165
G1 X162.254 Y160.099 E.35444
G1 X161.719 Y160.099 E.0165
G1 X169.848 Y151.97 E.35444
G1 X169.313 Y151.97 E.0165
G1 X161.184 Y160.099 E.35444
G1 X160.649 Y160.099 E.0165
G1 X168.778 Y151.97 E.35444
G1 X168.243 Y151.97 E.0165
G1 X160.114 Y160.099 E.35444
G1 X159.579 Y160.099 E.0165
G1 X167.708 Y151.97 E.35444
G1 X167.173 Y151.97 E.0165
G1 X159.044 Y160.099 E.35444
G1 X158.509 Y160.099 E.0165
G1 X166.638 Y151.97 E.35444
G1 X166.103 Y151.97 E.0165
G1 X157.974 Y160.099 E.35444
G1 X157.439 Y160.099 E.0165
G1 X165.568 Y151.97 E.35444
G1 X165.033 Y151.97 E.0165
G1 X156.903 Y160.099 E.35444
G1 X156.368 Y160.099 E.0165
G1 X164.498 Y151.97 E.35444
G1 X163.963 Y151.97 E.0165
G1 X155.833 Y160.099 E.35444
G1 X155.298 Y160.099 E.0165
G1 X163.428 Y151.97 E.35444
G1 X162.893 Y151.97 E.0165
G1 X154.763 Y160.099 E.35444
G1 X154.228 Y160.099 E.0165
G1 X162.358 Y151.97 E.35444
G1 X161.823 Y151.97 E.0165
G1 X153.693 Y160.099 E.35444
G1 X153.158 Y160.099 E.0165
G1 X161.287 Y151.97 E.35444
G1 X160.752 Y151.97 E.0165
G1 X152.623 Y160.099 E.35444
G1 X152.088 Y160.099 E.0165
G1 X160.217 Y151.97 E.35444
G1 X159.682 Y151.97 E.0165
G1 X151.553 Y160.099 E.35444
G1 X151.018 Y160.099 E.0165
G1 X159.147 Y151.97 E.35444
G1 X158.612 Y151.97 E.0165
G1 X150.483 Y160.099 E.35444
G1 X149.948 Y160.099 E.0165
G1 X158.077 Y151.97 E.35444
G1 X157.542 Y151.97 E.0165
G1 X149.413 Y160.099 E.35444
G1 X148.878 Y160.099 E.0165
G1 X157.007 Y151.97 E.35444
G1 X156.472 Y151.97 E.0165
G1 X148.343 Y160.099 E.35444
G1 X147.808 Y160.099 E.0165
G1 X155.937 Y151.97 E.35444
G1 X155.402 Y151.97 E.0165
G1 X147.273 Y160.099 E.35444
G1 X146.737 Y160.099 E.0165
G1 X154.867 Y151.97 E.35444
G1 X154.332 Y151.97 E.0165
G1 X146.202 Y160.099 E.35444
G1 X145.667 Y160.099 E.0165
G1 X153.797 Y151.97 E.35444
G1 X153.262 Y151.97 E.0165
G1 X145.132 Y160.099 E.35444
G1 X144.597 Y160.099 E.0165
G1 X152.727 Y151.97 E.35444
G1 X152.192 Y151.97 E.0165
G1 X144.062 Y160.099 E.35444
G1 X143.527 Y160.099 E.0165
G1 X151.657 Y151.97 E.35444
G1 X151.121 Y151.97 E.0165
G1 X142.992 Y160.099 E.35444
G1 X142.457 Y160.099 E.0165
G1 X150.586 Y151.97 E.35444
G1 X150.051 Y151.97 E.0165
G1 X141.922 Y160.099 E.35444
G1 X141.387 Y160.099 E.0165
G1 X149.516 Y151.97 E.35444
G1 X148.981 Y151.97 E.0165
G1 X140.852 Y160.099 E.35444
G1 X140.317 Y160.099 E.0165
G1 X148.446 Y151.97 E.35444
G1 X147.911 Y151.97 E.0165
G1 X139.782 Y160.099 E.35444
G1 X139.247 Y160.099 E.0165
G1 X147.376 Y151.97 E.35444
G1 X146.841 Y151.97 E.0165
G1 X138.712 Y160.099 E.35444
G1 X138.177 Y160.099 E.0165
G1 X146.306 Y151.97 E.35444
G1 X145.771 Y151.97 E.0165
G1 X137.642 Y160.099 E.35444
G1 X137.106 Y160.099 E.0165
G1 X145.236 Y151.97 E.35444
G1 X144.701 Y151.97 E.0165
G1 X136.571 Y160.099 E.35444
G1 X136.036 Y160.099 E.0165
G1 X144.166 Y151.97 E.35444
G1 X143.631 Y151.97 E.0165
G1 X135.501 Y160.099 E.35444
G1 X134.966 Y160.099 E.0165
G1 X143.096 Y151.97 E.35444
G1 X142.561 Y151.97 E.0165
G1 X134.431 Y160.099 E.35444
G1 X133.896 Y160.099 E.0165
G1 X142.026 Y151.97 E.35444
G1 X141.49 Y151.97 E.0165
G1 X133.361 Y160.099 E.35444
G1 X132.826 Y160.099 E.0165
G1 X140.955 Y151.97 E.35444
G1 X140.42 Y151.97 E.0165
G1 X132.291 Y160.099 E.35444
G1 X131.756 Y160.099 E.0165
G1 X139.885 Y151.97 E.35444
G1 X139.35 Y151.97 E.0165
G1 X131.221 Y160.099 E.35444
G1 X130.686 Y160.099 E.0165
G1 X138.815 Y151.97 E.35444
G1 X138.28 Y151.97 E.0165
G1 X130.151 Y160.099 E.35444
G1 X129.616 Y160.099 E.0165
G1 X137.745 Y151.97 E.35444
G1 X137.21 Y151.97 E.0165
G1 X129.081 Y160.099 E.35444
M73 P51 R8
G1 X128.546 Y160.099 E.0165
G1 X136.675 Y151.97 E.35444
G1 X136.14 Y151.97 E.0165
G1 X128.011 Y160.099 E.35444
G1 X127.476 Y160.099 E.0165
G1 X135.605 Y151.97 E.35444
G1 X135.07 Y151.97 E.0165
G1 X126.94 Y160.099 E.35444
G1 X126.405 Y160.099 E.0165
G1 X134.535 Y151.97 E.35444
G1 X134 Y151.97 E.0165
G1 X125.87 Y160.099 E.35444
G1 X125.335 Y160.099 E.0165
G1 X133.465 Y151.97 E.35444
G1 X132.93 Y151.97 E.0165
G1 X124.8 Y160.099 E.35444
G1 X124.265 Y160.099 E.0165
G1 X132.395 Y151.97 E.35444
G1 X131.86 Y151.97 E.0165
G1 X123.73 Y160.099 E.35444
G1 X123.195 Y160.099 E.0165
G1 X131.324 Y151.97 E.35444
G1 X130.789 Y151.97 E.0165
G1 X122.66 Y160.099 E.35444
G1 X122.125 Y160.099 E.0165
G1 X130.254 Y151.97 E.35444
G1 X129.719 Y151.97 E.0165
G1 X121.59 Y160.099 E.35444
G1 X121.055 Y160.099 E.0165
G1 X129.184 Y151.97 E.35444
G1 X128.649 Y151.97 E.0165
G1 X120.52 Y160.099 E.35444
G1 X119.985 Y160.099 E.0165
G1 X128.114 Y151.97 E.35444
G1 X127.579 Y151.97 E.0165
G1 X119.45 Y160.099 E.35444
G1 X118.915 Y160.099 E.0165
G1 X127.044 Y151.97 E.35444
G1 X126.509 Y151.97 E.0165
G1 X118.38 Y160.099 E.35444
G1 X117.845 Y160.099 E.0165
G1 X125.974 Y151.97 E.35444
G1 X125.439 Y151.97 E.0165
G1 X117.31 Y160.099 E.35444
G1 X116.774 Y160.099 E.0165
G1 X124.904 Y151.97 E.35444
G1 X124.369 Y151.97 E.0165
G1 X116.239 Y160.099 E.35444
G1 X115.704 Y160.099 E.0165
G1 X123.834 Y151.97 E.35444
G1 X123.299 Y151.97 E.0165
G1 X115.169 Y160.099 E.35444
G1 X114.634 Y160.099 E.0165
G1 X122.764 Y151.97 E.35444
G1 X122.229 Y151.97 E.0165
G1 X114.099 Y160.099 E.35444
G1 X113.564 Y160.099 E.0165
G1 X121.694 Y151.97 E.35444
G1 X121.158 Y151.97 E.0165
G1 X113.029 Y160.099 E.35444
G1 X112.494 Y160.099 E.0165
G1 X120.623 Y151.97 E.35444
G1 X120.088 Y151.97 E.0165
G1 X111.959 Y160.099 E.35444
G1 X111.424 Y160.099 E.0165
G1 X119.553 Y151.97 E.35444
G1 X119.018 Y151.97 E.0165
G1 X110.889 Y160.099 E.35444
G1 X110.354 Y160.099 E.0165
G1 X118.483 Y151.97 E.35444
G1 X117.948 Y151.97 E.0165
G1 X109.819 Y160.099 E.35444
G1 X109.284 Y160.099 E.0165
G1 X117.413 Y151.97 E.35444
G1 X116.878 Y151.97 E.0165
G1 X108.749 Y160.099 E.35444
G1 X108.214 Y160.099 E.0165
G1 X116.343 Y151.97 E.35444
G1 X115.808 Y151.97 E.0165
G1 X107.679 Y160.099 E.35444
G1 X107.143 Y160.099 E.0165
G1 X115.273 Y151.97 E.35444
G1 X114.738 Y151.97 E.0165
G1 X106.608 Y160.099 E.35444
G1 X106.073 Y160.099 E.0165
G1 X114.203 Y151.97 E.35444
G1 X113.668 Y151.97 E.0165
G1 X105.538 Y160.099 E.35444
G1 X105.003 Y160.099 E.0165
G1 X113.133 Y151.97 E.35444
G1 X112.598 Y151.97 E.0165
G1 X104.468 Y160.099 E.35444
G1 X103.933 Y160.099 E.0165
G1 X112.063 Y151.97 E.35444
G1 X111.527 Y151.97 E.0165
G1 X103.398 Y160.099 E.35444
G1 X102.863 Y160.099 E.0165
G1 X110.992 Y151.97 E.35444
G1 X110.457 Y151.97 E.0165
G1 X102.328 Y160.099 E.35444
G1 X101.793 Y160.099 E.0165
G1 X109.922 Y151.97 E.35444
G1 X109.387 Y151.97 E.0165
G1 X101.258 Y160.099 E.35444
G1 X100.723 Y160.099 E.0165
G1 X108.852 Y151.97 E.35444
G1 X108.317 Y151.97 E.0165
G1 X100.188 Y160.099 E.35444
G1 X99.653 Y160.099 E.0165
G1 X107.782 Y151.97 E.35444
G1 X107.247 Y151.97 E.0165
G1 X99.118 Y160.099 E.35444
G1 X98.583 Y160.099 E.0165
G1 X106.712 Y151.97 E.35444
G1 X106.177 Y151.97 E.0165
G1 X98.048 Y160.099 E.35444
G1 X97.513 Y160.099 E.0165
G1 X105.642 Y151.97 E.35444
G1 X105.107 Y151.97 E.0165
G1 X96.977 Y160.099 E.35444
G1 X96.442 Y160.099 E.0165
G1 X104.572 Y151.97 E.35444
G1 X104.037 Y151.97 E.0165
G1 X95.907 Y160.099 E.35444
G1 X95.372 Y160.099 E.0165
G1 X103.502 Y151.97 E.35444
G1 X102.967 Y151.97 E.0165
G1 X94.837 Y160.099 E.35444
G1 X94.302 Y160.099 E.0165
G1 X102.432 Y151.97 E.35444
G1 X101.897 Y151.97 E.0165
G1 X93.767 Y160.099 E.35444
G1 X93.232 Y160.099 E.0165
G1 X101.361 Y151.97 E.35444
G1 X100.826 Y151.97 E.0165
G1 X92.697 Y160.099 E.35444
G1 X92.162 Y160.099 E.0165
G1 X100.291 Y151.97 E.35444
G1 X99.756 Y151.97 E.0165
G1 X91.627 Y160.099 E.35444
G1 X91.092 Y160.099 E.0165
G1 X99.221 Y151.97 E.35444
G1 X98.686 Y151.97 E.0165
G1 X90.557 Y160.099 E.35444
G1 X90.022 Y160.099 E.0165
G1 X98.151 Y151.97 E.35444
G1 X97.616 Y151.97 E.0165
G1 X89.487 Y160.099 E.35444
G1 X88.952 Y160.099 E.0165
G1 X97.081 Y151.97 E.35444
G1 X96.546 Y151.97 E.0165
G1 X88.417 Y160.099 E.35444
G1 X87.882 Y160.099 E.0165
G1 X96.011 Y151.97 E.35444
G1 X95.476 Y151.97 E.0165
G1 X87.347 Y160.099 E.35444
G1 X86.811 Y160.099 E.0165
G1 X94.941 Y151.97 E.35444
G1 X94.406 Y151.97 E.0165
G1 X86.276 Y160.099 E.35444
G1 X85.741 Y160.099 E.0165
G1 X93.871 Y151.97 E.35444
G1 X93.336 Y151.97 E.0165
G1 X85.206 Y160.099 E.35444
G1 X84.671 Y160.099 E.0165
G1 X92.801 Y151.97 E.35444
M73 P52 R8
G1 X92.266 Y151.97 E.0165
G1 X84.136 Y160.099 E.35444
G1 X83.601 Y160.099 E.0165
G1 X91.731 Y151.97 E.35444
G1 X91.195 Y151.97 E.0165
G1 X83.066 Y160.099 E.35444
G1 X82.531 Y160.099 E.0165
G1 X90.66 Y151.97 E.35444
G1 X90.125 Y151.97 E.0165
G1 X81.996 Y160.099 E.35444
G1 X81.461 Y160.099 E.0165
G1 X89.59 Y151.97 E.35444
G1 X89.055 Y151.97 E.0165
G1 X80.926 Y160.099 E.35444
G1 X80.391 Y160.099 E.0165
G1 X88.52 Y151.97 E.35444
G1 X87.985 Y151.97 E.0165
G1 X80.067 Y159.888 E.34524
G1 X80.067 Y159.353 E.0165
G1 X87.45 Y151.97 E.32191
G1 X86.915 Y151.97 E.0165
G1 X80.067 Y158.818 E.29858
G1 X80.067 Y158.283 E.0165
G1 X86.38 Y151.97 E.27525
G1 X85.845 Y151.97 E.0165
G1 X80.067 Y157.748 E.25193
G1 X80.067 Y157.213 E.0165
G1 X85.31 Y151.97 E.2286
G1 X84.775 Y151.97 E.0165
G1 X80.067 Y156.678 E.20527
G1 X80.067 Y156.143 E.0165
G1 X84.24 Y151.97 E.18194
G1 X83.705 Y151.97 E.0165
G1 X80.067 Y155.608 E.15861
G1 X80.067 Y155.073 E.0165
G1 X83.17 Y151.97 E.13528
G1 X82.635 Y151.97 E.0165
G1 X80.067 Y154.538 E.11196
G1 X80.067 Y154.003 E.0165
G1 X82.1 Y151.97 E.08863
G1 X81.564 Y151.97 E.0165
G1 X80.067 Y153.468 E.0653
G1 X80.067 Y152.933 E.0165
G1 X81.029 Y151.97 E.04197
G1 X80.494 Y151.97 E.0165
G1 X79.897 Y152.567 E.02604
; OBJECT_ID: 113
; WIPE_START
G1 X80.494 Y151.97 E-.32096
G1 X81.029 Y151.97 E-.20332
G1 X80.591 Y152.409 E-.23572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 113
M624 AQAAAAAAAAA=
G1 X88.033 Y150.717 Z.8 F15000
G1 X177.398 Y130.398 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X78.602 Y130.398 E3.27724
G1 X78.602 Y121.602 E.29178
G1 X177.398 Y121.602 E3.27724
G1 X177.398 Y130.338 E.28979
M204 S250
G1 X177.79 Y130.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X78.21 Y130.79 E3.05982
G1 X78.21 Y121.21 E.29437
G1 X177.79 Y121.21 E3.05982
G1 X177.79 Y130.73 E.29252
; WIPE_START
M204 S5000
G1 X175.79 Y130.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.469 Y130.234 Z.8 F15000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42126
G1 F7500
G1 X177.065 Y129.639 E.02595
G1 X177.065 Y129.104 E.0165
G1 X176.104 Y130.065 E.04188
G1 X175.569 Y130.065 E.0165
G1 X177.065 Y128.569 E.06521
G1 X177.065 Y128.034 E.0165
G1 X175.034 Y130.065 E.08854
G1 X174.499 Y130.065 E.0165
G1 X177.065 Y127.499 E.11187
G1 X177.065 Y126.964 E.0165
G1 X173.964 Y130.065 E.1352
G1 X173.429 Y130.065 E.0165
G1 X177.065 Y126.429 E.15853
G1 X177.065 Y125.894 E.0165
G1 X172.894 Y130.065 E.18185
G1 X172.359 Y130.065 E.0165
G1 X177.065 Y125.359 E.20518
G1 X177.065 Y124.824 E.0165
G1 X171.824 Y130.065 E.22851
G1 X171.289 Y130.065 E.0165
G1 X177.065 Y124.289 E.25184
G1 X177.065 Y123.753 E.0165
G1 X170.753 Y130.065 E.27517
G1 X170.218 Y130.065 E.0165
G1 X177.065 Y123.218 E.2985
G1 X177.065 Y122.683 E.0165
G1 X169.683 Y130.065 E.32182
G1 X169.148 Y130.065 E.0165
G1 X177.065 Y122.148 E.34515
G1 X177.065 Y121.935 E.00657
G1 X176.743 Y121.935 E.00993
G1 X168.613 Y130.065 E.35444
G1 X168.078 Y130.065 E.0165
G1 X176.208 Y121.935 E.35444
G1 X175.673 Y121.935 E.0165
G1 X167.543 Y130.065 E.35444
G1 X167.008 Y130.065 E.0165
G1 X175.137 Y121.935 E.35444
G1 X174.602 Y121.935 E.0165
G1 X166.473 Y130.065 E.35444
G1 X165.938 Y130.065 E.0165
G1 X174.067 Y121.935 E.35444
G1 X173.532 Y121.935 E.0165
G1 X165.403 Y130.065 E.35444
G1 X164.868 Y130.065 E.0165
G1 X172.997 Y121.935 E.35444
G1 X172.462 Y121.935 E.0165
G1 X164.333 Y130.065 E.35444
G1 X163.798 Y130.065 E.0165
G1 X171.927 Y121.935 E.35444
G1 X171.392 Y121.935 E.0165
G1 X163.263 Y130.065 E.35444
G1 X162.728 Y130.065 E.0165
G1 X170.857 Y121.935 E.35444
G1 X170.322 Y121.935 E.0165
G1 X162.193 Y130.065 E.35444
G1 X161.658 Y130.065 E.0165
G1 X169.787 Y121.935 E.35444
G1 X169.252 Y121.935 E.0165
G1 X161.123 Y130.065 E.35444
G1 X160.587 Y130.065 E.0165
G1 X168.717 Y121.935 E.35444
G1 X168.182 Y121.935 E.0165
G1 X160.052 Y130.065 E.35444
G1 X159.517 Y130.065 E.0165
M73 P53 R8
G1 X167.647 Y121.935 E.35444
G1 X167.112 Y121.935 E.0165
G1 X158.982 Y130.065 E.35444
G1 X158.447 Y130.065 E.0165
G1 X166.577 Y121.935 E.35444
G1 X166.042 Y121.935 E.0165
G1 X157.912 Y130.065 E.35444
G1 X157.377 Y130.065 E.0165
G1 X165.507 Y121.935 E.35444
G1 X164.971 Y121.935 E.0165
G1 X156.842 Y130.065 E.35444
G1 X156.307 Y130.065 E.0165
G1 X164.436 Y121.935 E.35444
G1 X163.901 Y121.935 E.0165
G1 X155.772 Y130.065 E.35444
G1 X155.237 Y130.065 E.0165
G1 X163.366 Y121.935 E.35444
G1 X162.831 Y121.935 E.0165
G1 X154.702 Y130.065 E.35444
G1 X154.167 Y130.065 E.0165
G1 X162.296 Y121.935 E.35444
G1 X161.761 Y121.935 E.0165
G1 X153.632 Y130.065 E.35444
G1 X153.097 Y130.065 E.0165
G1 X161.226 Y121.935 E.35444
G1 X160.691 Y121.935 E.0165
G1 X152.562 Y130.065 E.35444
G1 X152.027 Y130.065 E.0165
G1 X160.156 Y121.935 E.35444
G1 X159.621 Y121.935 E.0165
G1 X151.492 Y130.065 E.35444
G1 X150.957 Y130.065 E.0165
G1 X159.086 Y121.935 E.35444
G1 X158.551 Y121.935 E.0165
G1 X150.421 Y130.065 E.35444
G1 X149.886 Y130.065 E.0165
G1 X158.016 Y121.935 E.35444
G1 X157.481 Y121.935 E.0165
G1 X149.351 Y130.065 E.35444
G1 X148.816 Y130.065 E.0165
G1 X156.946 Y121.935 E.35444
G1 X156.411 Y121.935 E.0165
G1 X148.281 Y130.065 E.35444
G1 X147.746 Y130.065 E.0165
G1 X155.876 Y121.935 E.35444
G1 X155.341 Y121.935 E.0165
G1 X147.211 Y130.065 E.35444
G1 X146.676 Y130.065 E.0165
G1 X154.805 Y121.935 E.35444
G1 X154.27 Y121.935 E.0165
G1 X146.141 Y130.065 E.35444
G1 X145.606 Y130.065 E.0165
G1 X153.735 Y121.935 E.35444
G1 X153.2 Y121.935 E.0165
G1 X145.071 Y130.065 E.35444
G1 X144.536 Y130.065 E.0165
G1 X152.665 Y121.935 E.35444
G1 X152.13 Y121.935 E.0165
G1 X144.001 Y130.065 E.35444
G1 X143.466 Y130.065 E.0165
G1 X151.595 Y121.935 E.35444
G1 X151.06 Y121.935 E.0165
G1 X142.931 Y130.065 E.35444
G1 X142.396 Y130.065 E.0165
G1 X150.525 Y121.935 E.35444
G1 X149.99 Y121.935 E.0165
G1 X141.861 Y130.065 E.35444
G1 X141.326 Y130.065 E.0165
G1 X149.455 Y121.935 E.35444
G1 X148.92 Y121.935 E.0165
G1 X140.79 Y130.065 E.35444
G1 X140.255 Y130.065 E.0165
G1 X148.385 Y121.935 E.35444
G1 X147.85 Y121.935 E.0165
G1 X139.72 Y130.065 E.35444
G1 X139.185 Y130.065 E.0165
G1 X147.315 Y121.935 E.35444
G1 X146.78 Y121.935 E.0165
G1 X138.65 Y130.065 E.35444
G1 X138.115 Y130.065 E.0165
G1 X146.245 Y121.935 E.35444
G1 X145.71 Y121.935 E.0165
G1 X137.58 Y130.065 E.35444
G1 X137.045 Y130.065 E.0165
G1 X145.174 Y121.935 E.35444
G1 X144.639 Y121.935 E.0165
G1 X136.51 Y130.065 E.35444
G1 X135.975 Y130.065 E.0165
G1 X144.104 Y121.935 E.35444
G1 X143.569 Y121.935 E.0165
G1 X135.44 Y130.065 E.35444
G1 X134.905 Y130.065 E.0165
G1 X143.034 Y121.935 E.35444
G1 X142.499 Y121.935 E.0165
G1 X134.37 Y130.065 E.35444
G1 X133.835 Y130.065 E.0165
G1 X141.964 Y121.935 E.35444
G1 X141.429 Y121.935 E.0165
G1 X133.3 Y130.065 E.35444
G1 X132.765 Y130.065 E.0165
G1 X140.894 Y121.935 E.35444
G1 X140.359 Y121.935 E.0165
G1 X132.23 Y130.065 E.35444
G1 X131.695 Y130.065 E.0165
G1 X139.824 Y121.935 E.35444
G1 X139.289 Y121.935 E.0165
G1 X131.16 Y130.065 E.35444
G1 X130.624 Y130.065 E.0165
G1 X138.754 Y121.935 E.35444
G1 X138.219 Y121.935 E.0165
G1 X130.089 Y130.065 E.35444
G1 X129.554 Y130.065 E.0165
G1 X137.684 Y121.935 E.35444
G1 X137.149 Y121.935 E.0165
G1 X129.019 Y130.065 E.35444
G1 X128.484 Y130.065 E.0165
G1 X136.614 Y121.935 E.35444
G1 X136.079 Y121.935 E.0165
G1 X127.949 Y130.065 E.35444
G1 X127.414 Y130.065 E.0165
G1 X135.544 Y121.935 E.35444
G1 X135.008 Y121.935 E.0165
G1 X126.879 Y130.065 E.35444
G1 X126.344 Y130.065 E.0165
G1 X134.473 Y121.935 E.35444
G1 X133.938 Y121.935 E.0165
G1 X125.809 Y130.065 E.35444
G1 X125.274 Y130.065 E.0165
G1 X133.403 Y121.935 E.35444
G1 X132.868 Y121.935 E.0165
G1 X124.739 Y130.065 E.35444
G1 X124.204 Y130.065 E.0165
G1 X132.333 Y121.935 E.35444
G1 X131.798 Y121.935 E.0165
G1 X123.669 Y130.065 E.35444
G1 X123.134 Y130.065 E.0165
G1 X131.263 Y121.935 E.35444
G1 X130.728 Y121.935 E.0165
G1 X122.599 Y130.065 E.35444
G1 X122.064 Y130.065 E.0165
G1 X130.193 Y121.935 E.35444
G1 X129.658 Y121.935 E.0165
G1 X121.529 Y130.065 E.35444
G1 X120.994 Y130.065 E.0165
G1 X129.123 Y121.935 E.35444
G1 X128.588 Y121.935 E.0165
G1 X120.458 Y130.065 E.35444
G1 X119.923 Y130.065 E.0165
G1 X128.053 Y121.935 E.35444
G1 X127.518 Y121.935 E.0165
G1 X119.388 Y130.065 E.35444
G1 X118.853 Y130.065 E.0165
G1 X126.983 Y121.935 E.35444
G1 X126.448 Y121.935 E.0165
G1 X118.318 Y130.065 E.35444
G1 X117.783 Y130.065 E.0165
G1 X125.913 Y121.935 E.35444
G1 X125.377 Y121.935 E.0165
G1 X117.248 Y130.065 E.35444
G1 X116.713 Y130.065 E.0165
G1 X124.842 Y121.935 E.35444
G1 X124.307 Y121.935 E.0165
G1 X116.178 Y130.065 E.35444
G1 X115.643 Y130.065 E.0165
G1 X123.772 Y121.935 E.35444
G1 X123.237 Y121.935 E.0165
G1 X115.108 Y130.065 E.35444
G1 X114.573 Y130.065 E.0165
G1 X122.702 Y121.935 E.35444
M73 P54 R8
G1 X122.167 Y121.935 E.0165
G1 X114.038 Y130.065 E.35444
G1 X113.503 Y130.065 E.0165
G1 X121.632 Y121.935 E.35444
G1 X121.097 Y121.935 E.0165
G1 X112.968 Y130.065 E.35444
G1 X112.433 Y130.065 E.0165
G1 X120.562 Y121.935 E.35444
G1 X120.027 Y121.935 E.0165
G1 X111.898 Y130.065 E.35444
G1 X111.363 Y130.065 E.0165
G1 X119.492 Y121.935 E.35444
G1 X118.957 Y121.935 E.0165
G1 X110.827 Y130.065 E.35444
G1 X110.292 Y130.065 E.0165
G1 X118.422 Y121.935 E.35444
G1 X117.887 Y121.935 E.0165
G1 X109.757 Y130.065 E.35444
G1 X109.222 Y130.065 E.0165
G1 X117.352 Y121.935 E.35444
G1 X116.817 Y121.935 E.0165
G1 X108.687 Y130.065 E.35444
G1 X108.152 Y130.065 E.0165
G1 X116.282 Y121.935 E.35444
G1 X115.747 Y121.935 E.0165
G1 X107.617 Y130.065 E.35444
G1 X107.082 Y130.065 E.0165
G1 X115.211 Y121.935 E.35444
G1 X114.676 Y121.935 E.0165
G1 X106.547 Y130.065 E.35444
G1 X106.012 Y130.065 E.0165
G1 X114.141 Y121.935 E.35444
G1 X113.606 Y121.935 E.0165
G1 X105.477 Y130.065 E.35444
G1 X104.942 Y130.065 E.0165
G1 X113.071 Y121.935 E.35444
G1 X112.536 Y121.935 E.0165
G1 X104.407 Y130.065 E.35444
G1 X103.872 Y130.065 E.0165
G1 X112.001 Y121.935 E.35444
G1 X111.466 Y121.935 E.0165
G1 X103.337 Y130.065 E.35444
G1 X102.802 Y130.065 E.0165
G1 X110.931 Y121.935 E.35444
G1 X110.396 Y121.935 E.0165
G1 X102.267 Y130.065 E.35444
G1 X101.732 Y130.065 E.0165
G1 X109.861 Y121.935 E.35444
G1 X109.326 Y121.935 E.0165
G1 X101.197 Y130.065 E.35444
G1 X100.661 Y130.065 E.0165
G1 X108.791 Y121.935 E.35444
G1 X108.256 Y121.935 E.0165
G1 X100.126 Y130.065 E.35444
G1 X99.591 Y130.065 E.0165
G1 X107.721 Y121.935 E.35444
G1 X107.186 Y121.935 E.0165
G1 X99.056 Y130.065 E.35444
G1 X98.521 Y130.065 E.0165
G1 X106.651 Y121.935 E.35444
G1 X106.116 Y121.935 E.0165
G1 X97.986 Y130.065 E.35444
G1 X97.451 Y130.065 E.0165
G1 X105.581 Y121.935 E.35444
G1 X105.045 Y121.935 E.0165
G1 X96.916 Y130.065 E.35444
G1 X96.381 Y130.065 E.0165
G1 X104.51 Y121.935 E.35444
G1 X103.975 Y121.935 E.0165
G1 X95.846 Y130.065 E.35444
G1 X95.311 Y130.065 E.0165
G1 X103.44 Y121.935 E.35444
G1 X102.905 Y121.935 E.0165
G1 X94.776 Y130.065 E.35444
G1 X94.241 Y130.065 E.0165
G1 X102.37 Y121.935 E.35444
G1 X101.835 Y121.935 E.0165
G1 X93.706 Y130.065 E.35444
G1 X93.171 Y130.065 E.0165
G1 X101.3 Y121.935 E.35444
G1 X100.765 Y121.935 E.0165
G1 X92.636 Y130.065 E.35444
G1 X92.101 Y130.065 E.0165
G1 X100.23 Y121.935 E.35444
G1 X99.695 Y121.935 E.0165
G1 X91.566 Y130.065 E.35444
G1 X91.031 Y130.065 E.0165
G1 X99.16 Y121.935 E.35444
G1 X98.625 Y121.935 E.0165
G1 X90.495 Y130.065 E.35444
G1 X89.96 Y130.065 E.0165
G1 X98.09 Y121.935 E.35444
G1 X97.555 Y121.935 E.0165
G1 X89.425 Y130.065 E.35444
G1 X88.89 Y130.065 E.0165
G1 X97.02 Y121.935 E.35444
G1 X96.485 Y121.935 E.0165
G1 X88.355 Y130.065 E.35444
G1 X87.82 Y130.065 E.0165
G1 X95.95 Y121.935 E.35444
G1 X95.414 Y121.935 E.0165
G1 X87.285 Y130.065 E.35444
G1 X86.75 Y130.065 E.0165
G1 X94.879 Y121.935 E.35444
G1 X94.344 Y121.935 E.0165
G1 X86.215 Y130.065 E.35444
G1 X85.68 Y130.065 E.0165
G1 X93.809 Y121.935 E.35444
G1 X93.274 Y121.935 E.0165
G1 X85.145 Y130.065 E.35444
G1 X84.61 Y130.065 E.0165
G1 X92.739 Y121.935 E.35444
G1 X92.204 Y121.935 E.0165
G1 X84.075 Y130.065 E.35444
G1 X83.54 Y130.065 E.0165
G1 X91.669 Y121.935 E.35444
G1 X91.134 Y121.935 E.0165
G1 X83.005 Y130.065 E.35444
G1 X82.47 Y130.065 E.0165
G1 X90.599 Y121.935 E.35444
G1 X90.064 Y121.935 E.0165
G1 X81.935 Y130.065 E.35444
G1 X81.4 Y130.065 E.0165
G1 X89.529 Y121.935 E.35444
G1 X88.994 Y121.935 E.0165
G1 X80.864 Y130.065 E.35444
G1 X80.329 Y130.065 E.0165
G1 X88.459 Y121.935 E.35444
G1 X87.924 Y121.935 E.0165
G1 X79.794 Y130.065 E.35444
G1 X79.259 Y130.065 E.0165
G1 X87.389 Y121.935 E.35444
G1 X86.854 Y121.935 E.0165
G1 X78.935 Y129.854 E.34524
G1 X78.935 Y129.319 E.0165
G1 X86.319 Y121.935 E.32191
G1 X85.784 Y121.935 E.0165
G1 X78.935 Y128.784 E.29858
G1 X78.935 Y128.248 E.0165
G1 X85.248 Y121.935 E.27525
G1 X84.713 Y121.935 E.0165
G1 X78.935 Y127.713 E.25193
G1 X78.935 Y127.178 E.0165
G1 X84.178 Y121.935 E.2286
G1 X83.643 Y121.935 E.0165
G1 X78.935 Y126.643 E.20527
G1 X78.935 Y126.108 E.0165
G1 X83.108 Y121.935 E.18194
G1 X82.573 Y121.935 E.0165
G1 X78.935 Y125.573 E.15861
G1 X78.935 Y125.038 E.0165
G1 X82.038 Y121.935 E.13528
G1 X81.503 Y121.935 E.0165
G1 X78.935 Y124.503 E.11196
G1 X78.935 Y123.968 E.0165
G1 X80.968 Y121.935 E.08863
G1 X80.433 Y121.935 E.0165
G1 X78.935 Y123.433 E.0653
G1 X78.935 Y122.898 E.0165
G1 X79.898 Y121.935 E.04197
G1 X79.363 Y121.935 E.0165
G1 X78.766 Y122.533 E.02604
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X79.363 Y121.935 E-.32096
G1 X79.898 Y121.935 E-.20332
G1 X79.459 Y122.374 E-.23572
; WIPE_END
M73 P55 R8
G1 E-.04 F1800
; stop printing object, unique label id: 113
M625
; layer num/total_layer_count: 3/10
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F15000
; object ids of layer 3 start: 113,149
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
; object ids of this layer3 end: 113,149
M625
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X178.529 Y160.433
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X79.734 Y160.433 E3.27724
G1 X79.734 Y151.637 E.29178
G1 X178.529 Y151.637 E3.27724
G1 X178.529 Y160.373 E.28979
M204 S250
G1 X178.921 Y160.825 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X79.341 Y160.825 E3.05982
G1 X79.341 Y151.245 E.29437
G1 X178.921 Y151.245 E3.05982
G1 X178.921 Y160.765 E.29252
; WIPE_START
M204 S5000
G1 X176.921 Y160.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.245 Y153.249 Z1 F15000
G1 X178.366 Y152.565 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42126
G1 F7500
G1 X177.771 Y151.97 E.02595
G1 X177.236 Y151.97 E.0165
G1 X178.196 Y152.931 E.04188
G1 X178.196 Y153.466 E.0165
G1 X176.7 Y151.97 E.06521
G1 X176.165 Y151.97 E.0165
G1 X178.196 Y154.001 E.08854
G1 X178.196 Y154.536 E.0165
G1 X175.63 Y151.97 E.11187
G1 X175.095 Y151.97 E.0165
G1 X178.196 Y155.071 E.1352
G1 X178.196 Y155.606 E.0165
G1 X174.56 Y151.97 E.15853
G1 X174.025 Y151.97 E.0165
G1 X178.196 Y156.141 E.18185
G1 X178.196 Y156.676 E.0165
G1 X173.49 Y151.97 E.20518
G1 X172.955 Y151.97 E.0165
G1 X178.196 Y157.211 E.22851
G1 X178.196 Y157.746 E.0165
G1 X172.42 Y151.97 E.25184
G1 X171.885 Y151.97 E.0165
G1 X178.196 Y158.281 E.27517
G1 X178.196 Y158.816 E.0165
G1 X171.35 Y151.97 E.2985
G1 X170.815 Y151.97 E.0165
G1 X178.196 Y159.351 E.32182
G1 X178.196 Y159.886 E.0165
G1 X170.28 Y151.97 E.34515
G1 X169.745 Y151.97 E.0165
G1 X177.874 Y160.099 E.35444
G1 X177.339 Y160.099 E.0165
G1 X169.21 Y151.97 E.35444
G1 X168.675 Y151.97 E.0165
M73 P55 R7
G1 X176.804 Y160.099 E.35444
G1 X176.269 Y160.099 E.0165
G1 X168.14 Y151.97 E.35444
G1 X167.605 Y151.97 E.0165
G1 X175.734 Y160.099 E.35444
G1 X175.199 Y160.099 E.0165
G1 X167.069 Y151.97 E.35444
G1 X166.534 Y151.97 E.0165
G1 X174.664 Y160.099 E.35444
G1 X174.129 Y160.099 E.0165
G1 X165.999 Y151.97 E.35444
G1 X165.464 Y151.97 E.0165
G1 X173.594 Y160.099 E.35444
G1 X173.059 Y160.099 E.0165
G1 X164.929 Y151.97 E.35444
G1 X164.394 Y151.97 E.0165
G1 X172.524 Y160.099 E.35444
G1 X171.989 Y160.099 E.0165
G1 X163.859 Y151.97 E.35444
G1 X163.324 Y151.97 E.0165
G1 X171.453 Y160.099 E.35444
G1 X170.918 Y160.099 E.0165
G1 X162.789 Y151.97 E.35444
G1 X162.254 Y151.97 E.0165
G1 X170.383 Y160.099 E.35444
G1 X169.848 Y160.099 E.0165
G1 X161.719 Y151.97 E.35444
G1 X161.184 Y151.97 E.0165
G1 X169.313 Y160.099 E.35444
G1 X168.778 Y160.099 E.0165
G1 X160.649 Y151.97 E.35444
G1 X160.114 Y151.97 E.0165
G1 X168.243 Y160.099 E.35444
G1 X167.708 Y160.099 E.0165
G1 X159.579 Y151.97 E.35444
G1 X159.044 Y151.97 E.0165
G1 X167.173 Y160.099 E.35444
G1 X166.638 Y160.099 E.0165
G1 X158.509 Y151.97 E.35444
G1 X157.974 Y151.97 E.0165
G1 X166.103 Y160.099 E.35444
G1 X165.568 Y160.099 E.0165
G1 X157.439 Y151.97 E.35444
G1 X156.903 Y151.97 E.0165
G1 X165.033 Y160.099 E.35444
G1 X164.498 Y160.099 E.0165
G1 X156.368 Y151.97 E.35444
G1 X155.833 Y151.97 E.0165
G1 X163.963 Y160.099 E.35444
G1 X163.428 Y160.099 E.0165
G1 X155.298 Y151.97 E.35444
G1 X154.763 Y151.97 E.0165
G1 X162.893 Y160.099 E.35444
G1 X162.358 Y160.099 E.0165
G1 X154.228 Y151.97 E.35444
G1 X153.693 Y151.97 E.0165
G1 X161.823 Y160.099 E.35444
G1 X161.287 Y160.099 E.0165
G1 X153.158 Y151.97 E.35444
G1 X152.623 Y151.97 E.0165
G1 X160.752 Y160.099 E.35444
G1 X160.217 Y160.099 E.0165
G1 X152.088 Y151.97 E.35444
G1 X151.553 Y151.97 E.0165
G1 X159.682 Y160.099 E.35444
G1 X159.147 Y160.099 E.0165
G1 X151.018 Y151.97 E.35444
G1 X150.483 Y151.97 E.0165
G1 X158.612 Y160.099 E.35444
G1 X158.077 Y160.099 E.0165
G1 X149.948 Y151.97 E.35444
G1 X149.413 Y151.97 E.0165
G1 X157.542 Y160.099 E.35444
G1 X157.007 Y160.099 E.0165
G1 X148.878 Y151.97 E.35444
G1 X148.343 Y151.97 E.0165
G1 X156.472 Y160.099 E.35444
G1 X155.937 Y160.099 E.0165
G1 X147.808 Y151.97 E.35444
G1 X147.273 Y151.97 E.0165
G1 X155.402 Y160.099 E.35444
G1 X154.867 Y160.099 E.0165
M73 P56 R7
G1 X146.737 Y151.97 E.35444
G1 X146.202 Y151.97 E.0165
G1 X154.332 Y160.099 E.35444
G1 X153.797 Y160.099 E.0165
G1 X145.667 Y151.97 E.35444
G1 X145.132 Y151.97 E.0165
G1 X153.262 Y160.099 E.35444
G1 X152.727 Y160.099 E.0165
G1 X144.597 Y151.97 E.35444
G1 X144.062 Y151.97 E.0165
G1 X152.192 Y160.099 E.35444
G1 X151.656 Y160.099 E.0165
G1 X143.527 Y151.97 E.35444
G1 X142.992 Y151.97 E.0165
G1 X151.121 Y160.099 E.35444
G1 X150.586 Y160.099 E.0165
G1 X142.457 Y151.97 E.35444
G1 X141.922 Y151.97 E.0165
G1 X150.051 Y160.099 E.35444
G1 X149.516 Y160.099 E.0165
G1 X141.387 Y151.97 E.35444
G1 X140.852 Y151.97 E.0165
G1 X148.981 Y160.099 E.35444
G1 X148.446 Y160.099 E.0165
G1 X140.317 Y151.97 E.35444
G1 X139.782 Y151.97 E.0165
G1 X147.911 Y160.099 E.35444
G1 X147.376 Y160.099 E.0165
G1 X139.247 Y151.97 E.35444
G1 X138.712 Y151.97 E.0165
G1 X146.841 Y160.099 E.35444
G1 X146.306 Y160.099 E.0165
G1 X138.177 Y151.97 E.35444
G1 X137.642 Y151.97 E.0165
G1 X145.771 Y160.099 E.35444
G1 X145.236 Y160.099 E.0165
G1 X137.106 Y151.97 E.35444
G1 X136.571 Y151.97 E.0165
G1 X144.701 Y160.099 E.35444
G1 X144.166 Y160.099 E.0165
G1 X136.036 Y151.97 E.35444
G1 X135.501 Y151.97 E.0165
G1 X143.631 Y160.099 E.35444
G1 X143.096 Y160.099 E.0165
G1 X134.966 Y151.97 E.35444
G1 X134.431 Y151.97 E.0165
G1 X142.561 Y160.099 E.35444
G1 X142.026 Y160.099 E.0165
G1 X133.896 Y151.97 E.35444
G1 X133.361 Y151.97 E.0165
G1 X141.49 Y160.099 E.35444
G1 X140.955 Y160.099 E.0165
G1 X132.826 Y151.97 E.35444
G1 X132.291 Y151.97 E.0165
G1 X140.42 Y160.099 E.35444
G1 X139.885 Y160.099 E.0165
G1 X131.756 Y151.97 E.35444
G1 X131.221 Y151.97 E.0165
G1 X139.35 Y160.099 E.35444
G1 X138.815 Y160.099 E.0165
G1 X130.686 Y151.97 E.35444
G1 X130.151 Y151.97 E.0165
G1 X138.28 Y160.099 E.35444
G1 X137.745 Y160.099 E.0165
G1 X129.616 Y151.97 E.35444
G1 X129.081 Y151.97 E.0165
G1 X137.21 Y160.099 E.35444
G1 X136.675 Y160.099 E.0165
G1 X128.546 Y151.97 E.35444
G1 X128.011 Y151.97 E.0165
G1 X136.14 Y160.099 E.35444
G1 X135.605 Y160.099 E.0165
G1 X127.476 Y151.97 E.35444
G1 X126.94 Y151.97 E.0165
G1 X135.07 Y160.099 E.35444
G1 X134.535 Y160.099 E.0165
G1 X126.405 Y151.97 E.35444
G1 X125.87 Y151.97 E.0165
G1 X134 Y160.099 E.35444
G1 X133.465 Y160.099 E.0165
G1 X125.335 Y151.97 E.35444
G1 X124.8 Y151.97 E.0165
G1 X132.93 Y160.099 E.35444
G1 X132.395 Y160.099 E.0165
G1 X124.265 Y151.97 E.35444
G1 X123.73 Y151.97 E.0165
G1 X131.86 Y160.099 E.35444
G1 X131.324 Y160.099 E.0165
G1 X123.195 Y151.97 E.35444
G1 X122.66 Y151.97 E.0165
G1 X130.789 Y160.099 E.35444
G1 X130.254 Y160.099 E.0165
G1 X122.125 Y151.97 E.35444
G1 X121.59 Y151.97 E.0165
G1 X129.719 Y160.099 E.35444
G1 X129.184 Y160.099 E.0165
G1 X121.055 Y151.97 E.35444
G1 X120.52 Y151.97 E.0165
G1 X128.649 Y160.099 E.35444
G1 X128.114 Y160.099 E.0165
G1 X119.985 Y151.97 E.35444
G1 X119.45 Y151.97 E.0165
G1 X127.579 Y160.099 E.35444
G1 X127.044 Y160.099 E.0165
G1 X118.915 Y151.97 E.35444
G1 X118.38 Y151.97 E.0165
G1 X126.509 Y160.099 E.35444
G1 X125.974 Y160.099 E.0165
G1 X117.845 Y151.97 E.35444
G1 X117.31 Y151.97 E.0165
G1 X125.439 Y160.099 E.35444
G1 X124.904 Y160.099 E.0165
G1 X116.774 Y151.97 E.35444
G1 X116.239 Y151.97 E.0165
G1 X124.369 Y160.099 E.35444
G1 X123.834 Y160.099 E.0165
G1 X115.704 Y151.97 E.35444
G1 X115.169 Y151.97 E.0165
G1 X123.299 Y160.099 E.35444
G1 X122.764 Y160.099 E.0165
G1 X114.634 Y151.97 E.35444
G1 X114.099 Y151.97 E.0165
G1 X122.229 Y160.099 E.35444
G1 X121.694 Y160.099 E.0165
G1 X113.564 Y151.97 E.35444
G1 X113.029 Y151.97 E.0165
G1 X121.158 Y160.099 E.35444
G1 X120.623 Y160.099 E.0165
G1 X112.494 Y151.97 E.35444
G1 X111.959 Y151.97 E.0165
G1 X120.088 Y160.099 E.35444
G1 X119.553 Y160.099 E.0165
G1 X111.424 Y151.97 E.35444
G1 X110.889 Y151.97 E.0165
G1 X119.018 Y160.099 E.35444
G1 X118.483 Y160.099 E.0165
G1 X110.354 Y151.97 E.35444
G1 X109.819 Y151.97 E.0165
G1 X117.948 Y160.099 E.35444
G1 X117.413 Y160.099 E.0165
G1 X109.284 Y151.97 E.35444
G1 X108.749 Y151.97 E.0165
G1 X116.878 Y160.099 E.35444
G1 X116.343 Y160.099 E.0165
G1 X108.214 Y151.97 E.35444
G1 X107.679 Y151.97 E.0165
G1 X115.808 Y160.099 E.35444
G1 X115.273 Y160.099 E.0165
G1 X107.144 Y151.97 E.35444
G1 X106.608 Y151.97 E.0165
G1 X114.738 Y160.099 E.35444
G1 X114.203 Y160.099 E.0165
G1 X106.073 Y151.97 E.35444
G1 X105.538 Y151.97 E.0165
G1 X113.668 Y160.099 E.35444
G1 X113.133 Y160.099 E.0165
G1 X105.003 Y151.97 E.35444
G1 X104.468 Y151.97 E.0165
G1 X112.598 Y160.099 E.35444
G1 X112.063 Y160.099 E.0165
G1 X103.933 Y151.97 E.35444
G1 X103.398 Y151.97 E.0165
G1 X111.527 Y160.099 E.35444
G1 X110.992 Y160.099 E.0165
G1 X102.863 Y151.97 E.35444
M73 P57 R7
G1 X102.328 Y151.97 E.0165
G1 X110.457 Y160.099 E.35444
G1 X109.922 Y160.099 E.0165
G1 X101.793 Y151.97 E.35444
G1 X101.258 Y151.97 E.0165
G1 X109.387 Y160.099 E.35444
G1 X108.852 Y160.099 E.0165
G1 X100.723 Y151.97 E.35444
G1 X100.188 Y151.97 E.0165
G1 X108.317 Y160.099 E.35444
G1 X107.782 Y160.099 E.0165
G1 X99.653 Y151.97 E.35444
G1 X99.118 Y151.97 E.0165
G1 X107.247 Y160.099 E.35444
G1 X106.712 Y160.099 E.0165
G1 X98.583 Y151.97 E.35444
G1 X98.048 Y151.97 E.0165
G1 X106.177 Y160.099 E.35444
G1 X105.642 Y160.099 E.0165
G1 X97.513 Y151.97 E.35444
G1 X96.977 Y151.97 E.0165
G1 X105.107 Y160.099 E.35444
G1 X104.572 Y160.099 E.0165
G1 X96.442 Y151.97 E.35444
G1 X95.907 Y151.97 E.0165
G1 X104.037 Y160.099 E.35444
G1 X103.502 Y160.099 E.0165
G1 X95.372 Y151.97 E.35444
G1 X94.837 Y151.97 E.0165
G1 X102.967 Y160.099 E.35444
G1 X102.432 Y160.099 E.0165
G1 X94.302 Y151.97 E.35444
G1 X93.767 Y151.97 E.0165
G1 X101.897 Y160.099 E.35444
G1 X101.361 Y160.099 E.0165
G1 X93.232 Y151.97 E.35444
G1 X92.697 Y151.97 E.0165
G1 X100.826 Y160.099 E.35444
G1 X100.291 Y160.099 E.0165
G1 X92.162 Y151.97 E.35444
G1 X91.627 Y151.97 E.0165
G1 X99.756 Y160.099 E.35444
G1 X99.221 Y160.099 E.0165
G1 X91.092 Y151.97 E.35444
G1 X90.557 Y151.97 E.0165
G1 X98.686 Y160.099 E.35444
G1 X98.151 Y160.099 E.0165
G1 X90.022 Y151.97 E.35444
G1 X89.487 Y151.97 E.0165
G1 X97.616 Y160.099 E.35444
G1 X97.081 Y160.099 E.0165
G1 X88.952 Y151.97 E.35444
G1 X88.417 Y151.97 E.0165
G1 X96.546 Y160.099 E.35444
G1 X96.011 Y160.099 E.0165
G1 X87.882 Y151.97 E.35444
G1 X87.347 Y151.97 E.0165
G1 X95.476 Y160.099 E.35444
G1 X94.941 Y160.099 E.0165
G1 X86.811 Y151.97 E.35444
G1 X86.276 Y151.97 E.0165
G1 X94.406 Y160.099 E.35444
G1 X93.871 Y160.099 E.0165
G1 X85.741 Y151.97 E.35444
G1 X85.206 Y151.97 E.0165
G1 X93.336 Y160.099 E.35444
G1 X92.801 Y160.099 E.0165
G1 X84.671 Y151.97 E.35444
G1 X84.136 Y151.97 E.0165
G1 X92.266 Y160.099 E.35444
G1 X91.731 Y160.099 E.0165
G1 X83.601 Y151.97 E.35444
G1 X83.066 Y151.97 E.0165
G1 X91.195 Y160.099 E.35444
G1 X90.66 Y160.099 E.0165
G1 X82.531 Y151.97 E.35444
G1 X81.996 Y151.97 E.0165
G1 X90.125 Y160.099 E.35444
G1 X89.59 Y160.099 E.0165
G1 X81.461 Y151.97 E.35444
G1 X80.926 Y151.97 E.0165
G1 X89.055 Y160.099 E.35444
G1 X88.52 Y160.099 E.0165
G1 X80.391 Y151.97 E.35444
G1 X80.067 Y151.97 E.00999
G1 X80.067 Y152.181 E.00651
G1 X87.985 Y160.099 E.34524
G1 X87.45 Y160.099 E.0165
G1 X80.067 Y152.716 E.32191
G1 X80.067 Y153.251 E.0165
G1 X86.915 Y160.099 E.29858
G1 X86.38 Y160.099 E.0165
G1 X80.067 Y153.786 E.27525
G1 X80.067 Y154.321 E.0165
G1 X85.845 Y160.099 E.25193
G1 X85.31 Y160.099 E.0165
G1 X80.067 Y154.856 E.2286
G1 X80.067 Y155.391 E.0165
G1 X84.775 Y160.099 E.20527
G1 X84.24 Y160.099 E.0165
G1 X80.067 Y155.926 E.18194
G1 X80.067 Y156.462 E.0165
G1 X83.705 Y160.099 E.15861
G1 X83.17 Y160.099 E.0165
G1 X80.067 Y156.997 E.13528
G1 X80.067 Y157.532 E.0165
G1 X82.635 Y160.099 E.11196
G1 X82.1 Y160.099 E.0165
G1 X80.067 Y158.067 E.08863
G1 X80.067 Y158.602 E.0165
G1 X81.564 Y160.099 E.0653
G1 X81.029 Y160.099 E.0165
G1 X80.067 Y159.137 E.04197
G1 X80.067 Y159.672 E.0165
G1 X80.664 Y160.269 E.02604
; OBJECT_ID: 113
; WIPE_START
G1 X80.067 Y159.672 E-.32096
G1 X80.067 Y159.137 E-.20332
G1 X80.505 Y159.575 E-.23572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 113
M624 AQAAAAAAAAA=
G1 X87.814 Y157.375 Z1 F15000
G1 X177.398 Y130.398 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X78.602 Y130.398 E3.27724
G1 X78.602 Y121.602 E.29178
G1 X177.398 Y121.602 E3.27724
G1 X177.398 Y130.338 E.28979
M204 S250
G1 X177.79 Y130.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X78.21 Y130.79 E3.05982
G1 X78.21 Y121.21 E.29437
G1 X177.79 Y121.21 E3.05982
G1 X177.79 Y130.73 E.29252
; WIPE_START
M204 S5000
G1 X175.79 Y130.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.114 Y123.214 Z1 F15000
G1 X177.234 Y122.531 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42126
G1 F7500
G1 X176.639 Y121.935 E.02595
G1 X176.104 Y121.935 E.0165
G1 X177.065 Y122.896 E.04188
G1 X177.065 Y123.431 E.0165
G1 X175.569 Y121.935 E.06521
G1 X175.034 Y121.935 E.0165
G1 X177.065 Y123.966 E.08854
G1 X177.065 Y124.501 E.0165
G1 X174.499 Y121.935 E.11187
G1 X173.964 Y121.935 E.0165
G1 X177.065 Y125.036 E.1352
G1 X177.065 Y125.571 E.0165
G1 X173.429 Y121.935 E.15853
G1 X172.894 Y121.935 E.0165
G1 X177.065 Y126.106 E.18185
G1 X177.065 Y126.641 E.0165
G1 X172.359 Y121.935 E.20518
G1 X171.824 Y121.935 E.0165
G1 X177.065 Y127.176 E.22851
G1 X177.065 Y127.711 E.0165
G1 X171.289 Y121.935 E.25184
G1 X170.753 Y121.935 E.0165
G1 X177.065 Y128.247 E.27517
G1 X177.065 Y128.782 E.0165
G1 X170.218 Y121.935 E.2985
G1 X169.683 Y121.935 E.0165
G1 X177.065 Y129.317 E.32182
G1 X177.065 Y129.852 E.0165
G1 X169.148 Y121.935 E.34515
G1 X168.613 Y121.935 E.0165
G1 X176.743 Y130.065 E.35444
G1 X176.208 Y130.065 E.0165
G1 X168.078 Y121.935 E.35444
G1 X167.543 Y121.935 E.0165
M73 P58 R7
G1 X175.673 Y130.065 E.35444
G1 X175.137 Y130.065 E.0165
G1 X167.008 Y121.935 E.35444
G1 X166.473 Y121.935 E.0165
G1 X174.602 Y130.065 E.35444
G1 X174.067 Y130.065 E.0165
G1 X165.938 Y121.935 E.35444
G1 X165.403 Y121.935 E.0165
G1 X173.532 Y130.065 E.35444
G1 X172.997 Y130.065 E.0165
G1 X164.868 Y121.935 E.35444
G1 X164.333 Y121.935 E.0165
G1 X172.462 Y130.065 E.35444
G1 X171.927 Y130.065 E.0165
G1 X163.798 Y121.935 E.35444
G1 X163.263 Y121.935 E.0165
G1 X171.392 Y130.065 E.35444
G1 X170.857 Y130.065 E.0165
G1 X162.728 Y121.935 E.35444
G1 X162.193 Y121.935 E.0165
G1 X170.322 Y130.065 E.35444
G1 X169.787 Y130.065 E.0165
G1 X161.658 Y121.935 E.35444
G1 X161.123 Y121.935 E.0165
G1 X169.252 Y130.065 E.35444
G1 X168.717 Y130.065 E.0165
G1 X160.587 Y121.935 E.35444
G1 X160.052 Y121.935 E.0165
G1 X168.182 Y130.065 E.35444
G1 X167.647 Y130.065 E.0165
G1 X159.517 Y121.935 E.35444
G1 X158.982 Y121.935 E.0165
G1 X167.112 Y130.065 E.35444
G1 X166.577 Y130.065 E.0165
G1 X158.447 Y121.935 E.35444
G1 X157.912 Y121.935 E.0165
G1 X166.042 Y130.065 E.35444
G1 X165.507 Y130.065 E.0165
G1 X157.377 Y121.935 E.35444
G1 X156.842 Y121.935 E.0165
G1 X164.971 Y130.065 E.35444
G1 X164.436 Y130.065 E.0165
G1 X156.307 Y121.935 E.35444
G1 X155.772 Y121.935 E.0165
G1 X163.901 Y130.065 E.35444
G1 X163.366 Y130.065 E.0165
G1 X155.237 Y121.935 E.35444
G1 X154.702 Y121.935 E.0165
G1 X162.831 Y130.065 E.35444
G1 X162.296 Y130.065 E.0165
G1 X154.167 Y121.935 E.35444
G1 X153.632 Y121.935 E.0165
G1 X161.761 Y130.065 E.35444
G1 X161.226 Y130.065 E.0165
G1 X153.097 Y121.935 E.35444
G1 X152.562 Y121.935 E.0165
G1 X160.691 Y130.065 E.35444
G1 X160.156 Y130.065 E.0165
G1 X152.027 Y121.935 E.35444
G1 X151.492 Y121.935 E.0165
G1 X159.621 Y130.065 E.35444
G1 X159.086 Y130.065 E.0165
G1 X150.957 Y121.935 E.35444
G1 X150.421 Y121.935 E.0165
G1 X158.551 Y130.065 E.35444
G1 X158.016 Y130.065 E.0165
G1 X149.886 Y121.935 E.35444
G1 X149.351 Y121.935 E.0165
G1 X157.481 Y130.065 E.35444
G1 X156.946 Y130.065 E.0165
G1 X148.816 Y121.935 E.35444
G1 X148.281 Y121.935 E.0165
G1 X156.411 Y130.065 E.35444
G1 X155.876 Y130.065 E.0165
G1 X147.746 Y121.935 E.35444
G1 X147.211 Y121.935 E.0165
G1 X155.34 Y130.065 E.35444
G1 X154.805 Y130.065 E.0165
G1 X146.676 Y121.935 E.35444
G1 X146.141 Y121.935 E.0165
G1 X154.27 Y130.065 E.35444
G1 X153.735 Y130.065 E.0165
G1 X145.606 Y121.935 E.35444
G1 X145.071 Y121.935 E.0165
G1 X153.2 Y130.065 E.35444
G1 X152.665 Y130.065 E.0165
G1 X144.536 Y121.935 E.35444
G1 X144.001 Y121.935 E.0165
G1 X152.13 Y130.065 E.35444
G1 X151.595 Y130.065 E.0165
G1 X143.466 Y121.935 E.35444
G1 X142.931 Y121.935 E.0165
G1 X151.06 Y130.065 E.35444
G1 X150.525 Y130.065 E.0165
G1 X142.396 Y121.935 E.35444
G1 X141.861 Y121.935 E.0165
G1 X149.99 Y130.065 E.35444
G1 X149.455 Y130.065 E.0165
G1 X141.326 Y121.935 E.35444
G1 X140.79 Y121.935 E.0165
G1 X148.92 Y130.065 E.35444
G1 X148.385 Y130.065 E.0165
G1 X140.255 Y121.935 E.35444
G1 X139.72 Y121.935 E.0165
G1 X147.85 Y130.065 E.35444
G1 X147.315 Y130.065 E.0165
G1 X139.185 Y121.935 E.35444
G1 X138.65 Y121.935 E.0165
G1 X146.78 Y130.065 E.35444
G1 X146.245 Y130.065 E.0165
G1 X138.115 Y121.935 E.35444
G1 X137.58 Y121.935 E.0165
G1 X145.71 Y130.065 E.35444
G1 X145.174 Y130.065 E.0165
G1 X137.045 Y121.935 E.35444
G1 X136.51 Y121.935 E.0165
G1 X144.639 Y130.065 E.35444
G1 X144.104 Y130.065 E.0165
G1 X135.975 Y121.935 E.35444
G1 X135.44 Y121.935 E.0165
G1 X143.569 Y130.065 E.35444
G1 X143.034 Y130.065 E.0165
G1 X134.905 Y121.935 E.35444
G1 X134.37 Y121.935 E.0165
G1 X142.499 Y130.065 E.35444
G1 X141.964 Y130.065 E.0165
G1 X133.835 Y121.935 E.35444
G1 X133.3 Y121.935 E.0165
G1 X141.429 Y130.065 E.35444
G1 X140.894 Y130.065 E.0165
G1 X132.765 Y121.935 E.35444
M73 P59 R7
G1 X132.23 Y121.935 E.0165
G1 X140.359 Y130.065 E.35444
G1 X139.824 Y130.065 E.0165
G1 X131.695 Y121.935 E.35444
G1 X131.16 Y121.935 E.0165
G1 X139.289 Y130.065 E.35444
G1 X138.754 Y130.065 E.0165
G1 X130.624 Y121.935 E.35444
G1 X130.089 Y121.935 E.0165
G1 X138.219 Y130.065 E.35444
G1 X137.684 Y130.065 E.0165
G1 X129.554 Y121.935 E.35444
G1 X129.019 Y121.935 E.0165
G1 X137.149 Y130.065 E.35444
G1 X136.614 Y130.065 E.0165
G1 X128.484 Y121.935 E.35444
G1 X127.949 Y121.935 E.0165
G1 X136.079 Y130.065 E.35444
G1 X135.544 Y130.065 E.0165
G1 X127.414 Y121.935 E.35444
G1 X126.879 Y121.935 E.0165
G1 X135.008 Y130.065 E.35444
G1 X134.473 Y130.065 E.0165
G1 X126.344 Y121.935 E.35444
G1 X125.809 Y121.935 E.0165
G1 X133.938 Y130.065 E.35444
G1 X133.403 Y130.065 E.0165
G1 X125.274 Y121.935 E.35444
G1 X124.739 Y121.935 E.0165
G1 X132.868 Y130.065 E.35444
G1 X132.333 Y130.065 E.0165
G1 X124.204 Y121.935 E.35444
G1 X123.669 Y121.935 E.0165
G1 X131.798 Y130.065 E.35444
G1 X131.263 Y130.065 E.0165
G1 X123.134 Y121.935 E.35444
G1 X122.599 Y121.935 E.0165
G1 X130.728 Y130.065 E.35444
G1 X130.193 Y130.065 E.0165
G1 X122.064 Y121.935 E.35444
G1 X121.529 Y121.935 E.0165
G1 X129.658 Y130.065 E.35444
G1 X129.123 Y130.065 E.0165
G1 X120.994 Y121.935 E.35444
G1 X120.458 Y121.935 E.0165
G1 X128.588 Y130.065 E.35444
G1 X128.053 Y130.065 E.0165
G1 X119.923 Y121.935 E.35444
G1 X119.388 Y121.935 E.0165
G1 X127.518 Y130.065 E.35444
G1 X126.983 Y130.065 E.0165
G1 X118.853 Y121.935 E.35444
G1 X118.318 Y121.935 E.0165
G1 X126.448 Y130.065 E.35444
G1 X125.913 Y130.065 E.0165
G1 X117.783 Y121.935 E.35444
G1 X117.248 Y121.935 E.0165
G1 X125.377 Y130.065 E.35444
G1 X124.842 Y130.065 E.0165
G1 X116.713 Y121.935 E.35444
G1 X116.178 Y121.935 E.0165
G1 X124.307 Y130.065 E.35444
G1 X123.772 Y130.065 E.0165
G1 X115.643 Y121.935 E.35444
G1 X115.108 Y121.935 E.0165
G1 X123.237 Y130.065 E.35444
G1 X122.702 Y130.065 E.0165
G1 X114.573 Y121.935 E.35444
G1 X114.038 Y121.935 E.0165
G1 X122.167 Y130.065 E.35444
G1 X121.632 Y130.065 E.0165
G1 X113.503 Y121.935 E.35444
G1 X112.968 Y121.935 E.0165
G1 X121.097 Y130.065 E.35444
G1 X120.562 Y130.065 E.0165
G1 X112.433 Y121.935 E.35444
G1 X111.898 Y121.935 E.0165
G1 X120.027 Y130.065 E.35444
G1 X119.492 Y130.065 E.0165
G1 X111.363 Y121.935 E.35444
G1 X110.827 Y121.935 E.0165
G1 X118.957 Y130.065 E.35444
G1 X118.422 Y130.065 E.0165
G1 X110.292 Y121.935 E.35444
G1 X109.757 Y121.935 E.0165
G1 X117.887 Y130.065 E.35444
G1 X117.352 Y130.065 E.0165
G1 X109.222 Y121.935 E.35444
G1 X108.687 Y121.935 E.0165
G1 X116.817 Y130.065 E.35444
G1 X116.282 Y130.065 E.0165
G1 X108.152 Y121.935 E.35444
G1 X107.617 Y121.935 E.0165
G1 X115.747 Y130.065 E.35444
G1 X115.211 Y130.065 E.0165
G1 X107.082 Y121.935 E.35444
G1 X106.547 Y121.935 E.0165
G1 X114.676 Y130.065 E.35444
G1 X114.141 Y130.065 E.0165
G1 X106.012 Y121.935 E.35444
G1 X105.477 Y121.935 E.0165
G1 X113.606 Y130.065 E.35444
G1 X113.071 Y130.065 E.0165
G1 X104.942 Y121.935 E.35444
G1 X104.407 Y121.935 E.0165
G1 X112.536 Y130.065 E.35444
G1 X112.001 Y130.065 E.0165
G1 X103.872 Y121.935 E.35444
G1 X103.337 Y121.935 E.0165
G1 X111.466 Y130.065 E.35444
G1 X110.931 Y130.065 E.0165
G1 X102.802 Y121.935 E.35444
G1 X102.267 Y121.935 E.0165
G1 X110.396 Y130.065 E.35444
G1 X109.861 Y130.065 E.0165
G1 X101.732 Y121.935 E.35444
G1 X101.197 Y121.935 E.0165
G1 X109.326 Y130.065 E.35444
G1 X108.791 Y130.065 E.0165
G1 X100.661 Y121.935 E.35444
G1 X100.126 Y121.935 E.0165
G1 X108.256 Y130.065 E.35444
G1 X107.721 Y130.065 E.0165
G1 X99.591 Y121.935 E.35444
G1 X99.056 Y121.935 E.0165
G1 X107.186 Y130.065 E.35444
G1 X106.651 Y130.065 E.0165
G1 X98.521 Y121.935 E.35444
G1 X97.986 Y121.935 E.0165
G1 X106.116 Y130.065 E.35444
G1 X105.581 Y130.065 E.0165
G1 X97.451 Y121.935 E.35444
G1 X96.916 Y121.935 E.0165
G1 X105.045 Y130.065 E.35444
G1 X104.51 Y130.065 E.0165
G1 X96.381 Y121.935 E.35444
G1 X95.846 Y121.935 E.0165
G1 X103.975 Y130.065 E.35444
G1 X103.44 Y130.065 E.0165
G1 X95.311 Y121.935 E.35444
G1 X94.776 Y121.935 E.0165
G1 X102.905 Y130.065 E.35444
G1 X102.37 Y130.065 E.0165
G1 X94.241 Y121.935 E.35444
G1 X93.706 Y121.935 E.0165
G1 X101.835 Y130.065 E.35444
G1 X101.3 Y130.065 E.0165
G1 X93.171 Y121.935 E.35444
G1 X92.636 Y121.935 E.0165
G1 X100.765 Y130.065 E.35444
G1 X100.23 Y130.065 E.0165
G1 X92.101 Y121.935 E.35444
G1 X91.566 Y121.935 E.0165
G1 X99.695 Y130.065 E.35444
G1 X99.16 Y130.065 E.0165
G1 X91.031 Y121.935 E.35444
G1 X90.495 Y121.935 E.0165
G1 X98.625 Y130.065 E.35444
G1 X98.09 Y130.065 E.0165
G1 X89.96 Y121.935 E.35444
G1 X89.425 Y121.935 E.0165
G1 X97.555 Y130.065 E.35444
G1 X97.02 Y130.065 E.0165
G1 X88.89 Y121.935 E.35444
G1 X88.355 Y121.935 E.0165
G1 X96.485 Y130.065 E.35444
M73 P60 R7
G1 X95.95 Y130.065 E.0165
G1 X87.82 Y121.935 E.35444
G1 X87.285 Y121.935 E.0165
G1 X95.414 Y130.065 E.35444
G1 X94.879 Y130.065 E.0165
G1 X86.75 Y121.935 E.35444
G1 X86.215 Y121.935 E.0165
G1 X94.344 Y130.065 E.35444
G1 X93.809 Y130.065 E.0165
G1 X85.68 Y121.935 E.35444
G1 X85.145 Y121.935 E.0165
G1 X93.274 Y130.065 E.35444
G1 X92.739 Y130.065 E.0165
G1 X84.61 Y121.935 E.35444
G1 X84.075 Y121.935 E.0165
G1 X92.204 Y130.065 E.35444
G1 X91.669 Y130.065 E.0165
G1 X83.54 Y121.935 E.35444
G1 X83.005 Y121.935 E.0165
G1 X91.134 Y130.065 E.35444
G1 X90.599 Y130.065 E.0165
G1 X82.47 Y121.935 E.35444
G1 X81.935 Y121.935 E.0165
G1 X90.064 Y130.065 E.35444
G1 X89.529 Y130.065 E.0165
G1 X81.4 Y121.935 E.35444
G1 X80.864 Y121.935 E.0165
G1 X88.994 Y130.065 E.35444
G1 X88.459 Y130.065 E.0165
G1 X80.329 Y121.935 E.35444
G1 X79.794 Y121.935 E.0165
G1 X87.924 Y130.065 E.35444
G1 X87.389 Y130.065 E.0165
G1 X79.259 Y121.935 E.35444
G1 X78.935 Y121.935 E.00999
G1 X78.935 Y122.146 E.00651
G1 X86.854 Y130.065 E.34524
G1 X86.319 Y130.065 E.0165
G1 X78.935 Y122.681 E.32191
G1 X78.935 Y123.216 E.0165
G1 X85.784 Y130.065 E.29858
G1 X85.248 Y130.065 E.0165
G1 X78.935 Y123.752 E.27525
G1 X78.935 Y124.287 E.0165
G1 X84.713 Y130.065 E.25193
G1 X84.178 Y130.065 E.0165
G1 X78.935 Y124.822 E.2286
G1 X78.935 Y125.357 E.0165
G1 X83.643 Y130.065 E.20527
G1 X83.108 Y130.065 E.0165
G1 X78.935 Y125.892 E.18194
G1 X78.935 Y126.427 E.0165
G1 X82.573 Y130.065 E.15861
G1 X82.038 Y130.065 E.0165
G1 X78.935 Y126.962 E.13528
G1 X78.935 Y127.497 E.0165
G1 X81.503 Y130.065 E.11196
G1 X80.968 Y130.065 E.0165
G1 X78.935 Y128.032 E.08863
G1 X78.935 Y128.567 E.0165
G1 X80.433 Y130.065 E.0653
G1 X79.898 Y130.065 E.0165
G1 X78.935 Y129.102 E.04197
G1 X78.935 Y129.637 E.0165
G1 X79.533 Y130.234 E.02604
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X78.935 Y129.637 E-.32096
G1 X78.935 Y129.102 E-.20332
G1 X79.374 Y129.541 E-.23572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 113
M625
; layer num/total_layer_count: 4/10
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z1 I1.217 J0 P1  F15000
; object ids of layer 4 start: 113,149
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
; object ids of this layer4 end: 113,149
M625
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X178.529 Y160.433
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X79.734 Y160.433 E3.27724
G1 X79.734 Y151.637 E.29178
G1 X178.529 Y151.637 E3.27724
G1 X178.529 Y160.373 E.28979
M204 S250
G1 X178.921 Y160.825 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X79.341 Y160.825 E3.05982
G1 X79.341 Y151.245 E.29437
G1 X178.921 Y151.245 E3.05982
G1 X178.921 Y160.765 E.29252
; WIPE_START
M204 S5000
G1 X176.921 Y160.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X169.321 Y160.073 Z1.2 F15000
G1 X80.654 Y151.985 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8100
M204 S2500
G1 X80.082 Y151.985 E.01899
G1 X80.082 Y153.041 E.03502
G1 X87.125 Y160.084 E.33043
G1 X86.702 Y160.084 E.01405
G1 X94.801 Y151.985 E.37996
G1 X94.378 Y151.985 E.01404
G1 X102.477 Y160.084 E.37996
G1 X102.054 Y160.084 E.01405
G1 X110.153 Y151.985 E.37996
G1 X109.73 Y151.985 E.01404
G1 X117.829 Y160.084 E.37996
G1 X117.406 Y160.084 E.01404
G1 X125.505 Y151.985 E.37996
G1 X125.082 Y151.985 E.01404
G1 X133.181 Y160.084 E.37996
G1 X132.758 Y160.084 E.01404
G1 X140.857 Y151.985 E.37996
G1 X140.434 Y151.985 E.01404
G1 X148.533 Y160.084 E.37996
G1 X148.11 Y160.084 E.01404
G1 X156.209 Y151.985 E.37996
G1 X155.786 Y151.985 E.01405
G1 X163.885 Y160.084 E.37996
G1 X163.462 Y160.084 E.01404
G1 X171.561 Y151.985 E.37996
G1 X171.138 Y151.985 E.01405
G1 X178.181 Y159.029 E.33043
G1 X178.181 Y153.041 E.19863
G1 X171.138 Y160.084 E.33043
G1 X171.561 Y160.084 E.01404
G1 X163.462 Y151.985 E.37996
G1 X163.885 Y151.985 E.01405
G1 X155.786 Y160.084 E.37996
G1 X156.209 Y160.084 E.01404
G1 X148.11 Y151.985 E.37996
G1 X148.533 Y151.985 E.01405
G1 X140.434 Y160.084 E.37996
G1 X140.857 Y160.084 E.01404
G1 X132.758 Y151.985 E.37996
G1 X133.181 Y151.985 E.01405
M73 P60 R6
G1 X125.082 Y160.084 E.37996
G1 X125.505 Y160.084 E.01405
M73 P61 R6
G1 X117.406 Y151.985 E.37996
G1 X117.829 Y151.985 E.01404
G1 X109.73 Y160.084 E.37996
G1 X110.153 Y160.084 E.01405
G1 X102.054 Y151.985 E.37996
G1 X102.477 Y151.985 E.01404
G1 X94.378 Y160.084 E.37996
G1 X94.801 Y160.084 E.01405
G1 X86.702 Y151.985 E.37996
G1 X87.125 Y151.985 E.01404
G1 X80.082 Y159.029 E.33043
G1 X80.082 Y160.084 E.03502
G1 X80.654 Y160.084 E.01899
; OBJECT_ID: 113
; WIPE_START
M204 S5000
G1 X80.082 Y160.084 E-.21758
G1 X80.082 Y159.029 E-.40118
G1 X80.345 Y158.766 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 113
M624 AQAAAAAAAAA=
G1 X87.671 Y156.625 Z1.2 F15000
G1 X177.398 Y130.398 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X78.602 Y130.398 E3.27724
G1 X78.602 Y121.602 E.29178
G1 X177.398 Y121.602 E3.27724
G1 X177.398 Y130.338 E.28979
M204 S250
G1 X177.79 Y130.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X78.21 Y130.79 E3.05982
G1 X78.21 Y121.21 E.29437
G1 X177.79 Y121.21 E3.05982
G1 X177.79 Y130.73 E.29252
; WIPE_START
M204 S5000
G1 X175.79 Y130.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.189 Y130.038 Z1.2 F15000
G1 X79.523 Y121.95 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8100
M204 S2500
G1 X78.95 Y121.95 E.01899
G1 X78.95 Y123.006 E.03502
G1 X85.994 Y130.05 E.33043
G1 X85.571 Y130.05 E.01405
G1 X93.67 Y121.95 E.37996
G1 X93.246 Y121.95 E.01404
G1 X101.346 Y130.05 E.37996
G1 X100.922 Y130.05 E.01405
G1 X109.022 Y121.95 E.37996
G1 X108.598 Y121.95 E.01404
G1 X116.698 Y130.05 E.37996
G1 X116.274 Y130.05 E.01404
G1 X124.374 Y121.95 E.37996
G1 X123.95 Y121.95 E.01404
G1 X132.05 Y130.05 E.37996
G1 X131.626 Y130.05 E.01404
G1 X139.726 Y121.95 E.37996
G1 X139.302 Y121.95 E.01404
G1 X147.402 Y130.05 E.37996
G1 X146.978 Y130.05 E.01404
G1 X155.078 Y121.95 E.37996
G1 X154.654 Y121.95 E.01405
G1 X162.753 Y130.05 E.37996
G1 X162.33 Y130.05 E.01404
G1 X170.429 Y121.95 E.37996
G1 X170.006 Y121.95 E.01405
G1 X177.05 Y128.994 E.33043
G1 X177.05 Y123.006 E.19863
G1 X170.006 Y130.05 E.33043
G1 X170.429 Y130.05 E.01404
G1 X162.33 Y121.95 E.37996
G1 X162.754 Y121.95 E.01405
G1 X154.654 Y130.05 E.37996
G1 X155.078 Y130.05 E.01404
G1 X146.978 Y121.95 E.37996
G1 X147.402 Y121.95 E.01405
G1 X139.302 Y130.05 E.37996
G1 X139.726 Y130.05 E.01404
G1 X131.626 Y121.95 E.37996
G1 X132.05 Y121.95 E.01405
G1 X123.95 Y130.05 E.37996
G1 X124.374 Y130.05 E.01405
G1 X116.274 Y121.95 E.37996
G1 X116.698 Y121.95 E.01404
G1 X108.598 Y130.05 E.37996
G1 X109.022 Y130.05 E.01405
G1 X100.922 Y121.95 E.37996
G1 X101.346 Y121.95 E.01404
G1 X93.246 Y130.05 E.37996
G1 X93.67 Y130.05 E.01405
G1 X85.571 Y121.95 E.37996
G1 X85.994 Y121.95 E.01404
G1 X78.95 Y128.994 E.33043
G1 X78.95 Y130.05 E.03502
G1 X79.523 Y130.05 E.01899
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F8100
M204 S5000
G1 X78.95 Y130.05 E-.21758
M73 P62 R6
G1 X78.95 Y128.994 E-.40118
G1 X79.213 Y128.731 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 113
M625
; layer num/total_layer_count: 5/10
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F15000
; object ids of layer 5 start: 113,149
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
; object ids of this layer5 end: 113,149
M625
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X178.529 Y160.433
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F9000
G1 X79.734 Y160.433 E3.27724
G1 X79.734 Y151.637 E.29178
G1 X178.529 Y151.637 E3.27724
G1 X178.529 Y160.373 E.28979
M204 S250
G1 X178.921 Y160.825 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X79.341 Y160.825 E3.05982
G1 X79.341 Y151.245 E.29437
G1 X178.921 Y151.245 E3.05982
G1 X178.921 Y160.765 E.29252
; WIPE_START
M204 S5000
G1 X176.921 Y160.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X169.29 Y160.682 Z1.4 F15000
G1 X81.032 Y159.707 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8100
M204 S2500
G1 X80.459 Y159.707 E.01899
G1 X80.459 Y158.652 E.03502
G1 X86.748 Y152.362 E.29504
G1 X87.079 Y152.362 E.01098
G1 X94.424 Y159.707 E.34457
G1 X94.755 Y159.707 E.01098
G1 X102.1 Y152.362 E.34457
G1 X102.431 Y152.362 E.01098
G1 X109.776 Y159.707 E.34457
G1 X110.107 Y159.707 E.01098
G1 X117.452 Y152.362 E.34457
G1 X117.783 Y152.362 E.01098
G1 X125.128 Y159.707 E.34457
G1 X125.459 Y159.707 E.01098
G1 X132.804 Y152.362 E.34457
G1 X133.135 Y152.362 E.01098
G1 X140.48 Y159.707 E.34457
G1 X140.811 Y159.707 E.01098
G1 X148.156 Y152.362 E.34457
G1 X148.487 Y152.362 E.01098
G1 X155.832 Y159.707 E.34457
G1 X156.163 Y159.707 E.01098
G1 X163.508 Y152.362 E.34457
G1 X163.839 Y152.362 E.01098
G1 X171.184 Y159.707 E.34457
G1 X171.515 Y159.707 E.01098
G1 X177.804 Y153.418 E.29504
G1 X177.804 Y158.652 E.17361
G1 X171.515 Y152.362 E.29504
G1 X171.184 Y152.362 E.01098
G1 X163.839 Y159.707 E.34457
G1 X163.508 Y159.707 E.01098
G1 X156.163 Y152.362 E.34457
G1 X155.832 Y152.362 E.01098
G1 X148.487 Y159.707 E.34457
G1 X148.156 Y159.707 E.01098
G1 X140.811 Y152.362 E.34457
G1 X140.48 Y152.362 E.01098
G1 X133.135 Y159.707 E.34457
G1 X132.804 Y159.707 E.01098
G1 X125.459 Y152.362 E.34457
G1 X125.128 Y152.362 E.01098
G1 X117.783 Y159.707 E.34457
G1 X117.452 Y159.707 E.01098
G1 X110.107 Y152.362 E.34457
G1 X109.776 Y152.362 E.01098
G1 X102.431 Y159.707 E.34457
G1 X102.1 Y159.707 E.01098
G1 X94.755 Y152.362 E.34457
G1 X94.424 Y152.362 E.01098
G1 X87.079 Y159.707 E.34457
G1 X86.748 Y159.707 E.01098
G1 X80.459 Y153.418 E.29504
G1 X80.459 Y152.362 E.03502
G1 X81.032 Y152.362 E.01899
M204 S5000
G1 X80.255 Y160.07 F15000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.391786
G1 F3000;_EXTRUDE_SET_SPEED
G1 X80.124 Y160.043 E.00383
G1 X80.096 Y159.911 E.00383
G1 X80.096 Y152.159 E.22038
G1 X80.124 Y152.027 E.00383
G1 X80.255 Y152 E.00383
G1 X178.008 Y152 E2.77891
G1 X178.139 Y152.027 E.00383
G1 X178.167 Y152.159 E.00383
G1 X178.167 Y159.911 E.22038
G1 X178.139 Y160.043 E.00383
G1 X178.008 Y160.07 E.00383
G1 X80.315 Y160.07 E2.7772
; Slow Down End
; OBJECT_ID: 113
; WIPE_START
G1 X82.315 Y160.07 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 113
M624 AQAAAAAAAAA=
G1 X89.601 Y157.796 Z1.4 F15000
G1 X177.398 Y130.398 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X78.602 Y130.398 E3.27724
G1 X78.602 Y121.602 E.29178
G1 X177.398 Y121.602 E3.27724
M73 P63 R6
G1 X177.398 Y130.338 E.28979
M204 S250
G1 X177.79 Y130.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X78.21 Y130.79 E3.05982
G1 X78.21 Y121.21 E.29437
G1 X177.79 Y121.21 E3.05982
G1 X177.79 Y130.73 E.29252
; WIPE_START
M204 S5000
G1 X175.79 Y130.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X168.158 Y130.647 Z1.4 F15000
G1 X79.9 Y129.673 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8100
M204 S2500
G1 X79.327 Y129.673 E.01899
G1 X79.327 Y128.617 E.03502
G1 X85.617 Y122.327 E.29504
G1 X85.948 Y122.327 E.01098
G1 X93.293 Y129.673 E.34457
G1 X93.624 Y129.673 E.01098
G1 X100.969 Y122.327 E.34457
G1 X101.3 Y122.327 E.01098
G1 X108.645 Y129.673 E.34457
G1 X108.976 Y129.672 E.01098
G1 X116.321 Y122.327 E.34457
G1 X116.652 Y122.327 E.01098
G1 X123.997 Y129.673 E.34457
G1 X124.327 Y129.673 E.01098
G1 X131.673 Y122.327 E.34457
G1 X132.003 Y122.327 E.01098
G1 X139.348 Y129.673 E.34457
G1 X139.679 Y129.673 E.01098
G1 X147.024 Y122.327 E.34457
G1 X147.355 Y122.327 E.01098
G1 X154.7 Y129.673 E.34457
G1 X155.031 Y129.673 E.01098
G1 X162.376 Y122.327 E.34457
G1 X162.707 Y122.327 E.01098
G1 X170.052 Y129.673 E.34457
G1 X170.383 Y129.673 E.01098
G1 X176.673 Y123.383 E.29504
G1 X176.673 Y128.617 E.17361
G1 X170.383 Y122.327 E.29504
G1 X170.052 Y122.327 E.01098
G1 X162.707 Y129.673 E.34457
G1 X162.376 Y129.673 E.01098
G1 X155.031 Y122.327 E.34457
G1 X154.7 Y122.327 E.01098
G1 X147.355 Y129.673 E.34457
G1 X147.024 Y129.673 E.01098
G1 X139.679 Y122.327 E.34457
G1 X139.348 Y122.327 E.01098
G1 X132.003 Y129.673 E.34457
G1 X131.673 Y129.673 E.01098
G1 X124.327 Y122.327 E.34457
G1 X123.997 Y122.327 E.01098
G1 X116.652 Y129.673 E.34457
G1 X116.321 Y129.673 E.01098
G1 X108.976 Y122.327 E.34457
G1 X108.645 Y122.327 E.01098
G1 X101.3 Y129.673 E.34457
M73 P64 R6
G1 X100.969 Y129.673 E.01098
G1 X93.624 Y122.327 E.34457
G1 X93.293 Y122.327 E.01098
G1 X85.948 Y129.673 E.34457
G1 X85.617 Y129.673 E.01098
G1 X79.327 Y123.383 E.29504
G1 X79.327 Y122.327 E.03502
G1 X79.9 Y122.327 E.01899
M204 S5000
G1 X79.124 Y130.035 F15000
; Slow Down Start
; FEATURE: Floating vertical shell
; LINE_WIDTH: 0.391786
G1 F3000;_EXTRUDE_SET_SPEED
G1 X78.992 Y130.008 E.00383
G1 X78.965 Y129.876 E.00383
G1 X78.965 Y122.124 E.22038
G1 X78.992 Y121.992 E.00383
G1 X79.124 Y121.965 E.00383
G1 X176.876 Y121.965 E2.77891
G1 X177.008 Y121.992 E.00383
G1 X177.035 Y122.124 E.00383
G1 X177.035 Y129.876 E.22038
G1 X177.008 Y130.008 E.00383
G1 X176.876 Y130.035 E.00383
G1 X79.184 Y130.035 E2.7772
; Slow Down End
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X81.184 Y130.035 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 113
M625
; layer num/total_layer_count: 6/10
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.4 I1.217 J0 P1  F15000
; object ids of layer 6 start: 113,149
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
; object ids of this layer6 end: 113,149
M625
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X178.529 Y160.433
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X79.734 Y160.433 E3.27724
G1 X79.734 Y151.637 E.29178
G1 X178.529 Y151.637 E3.27724
G1 X178.529 Y160.373 E.28979
M204 S250
G1 X178.921 Y160.825 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X79.341 Y160.825 E3.05982
G1 X79.341 Y151.245 E.29437
G1 X178.921 Y151.245 E3.05982
G1 X178.921 Y160.765 E.29252
; WIPE_START
M204 S5000
G1 X176.921 Y160.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.372 Y153.147 Z1.6 F15000
G1 X177.451 Y151.804 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40041
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X178.16 Y152.513 E.05143
G1 X178.16 Y153.15 E.03268
G1 X177.016 Y152.007 E.08295
G1 X176.379 Y152.007 E.03268
G1 X178.16 Y153.787 E.12917
G1 X178.16 Y154.424 E.03268
G1 X175.742 Y152.007 E.17538
G1 X175.106 Y152.007 E.03268
G1 X178.16 Y155.061 E.2216
G1 X178.16 Y155.698 E.03268
G1 X174.469 Y152.007 E.26782
G1 X173.832 Y152.007 E.03268
G1 X178.16 Y156.335 E.31403
G1 X178.16 Y156.972 E.03268
G1 X173.195 Y152.007 E.36025
G1 X172.558 Y152.007 E.03268
G1 X178.16 Y157.609 E.40647
G1 X178.16 Y158.246 E.03268
G1 X171.921 Y152.007 E.45268
G1 X171.284 Y152.007 E.03268
G1 X178.16 Y158.883 E.4989
G1 X178.16 Y159.52 E.03268
G1 X170.647 Y152.007 E.54512
G1 X170.01 Y152.007 E.03268
G1 X178.066 Y160.063 E.58454
G1 X177.429 Y160.063 E.03268
G1 X169.373 Y152.007 E.58454
G1 X168.736 Y152.007 E.03268
G1 X176.792 Y160.063 E.58454
G1 X176.155 Y160.063 E.03268
G1 X168.099 Y152.007 E.58454
G1 X167.462 Y152.007 E.03268
G1 X175.518 Y160.063 E.58454
G1 X174.881 Y160.063 E.03268
G1 X166.825 Y152.007 E.58454
G1 X166.188 Y152.007 E.03268
G1 X174.244 Y160.063 E.58454
G1 X173.607 Y160.063 E.03268
G1 X165.551 Y152.007 E.58454
G1 X164.914 Y152.007 E.03268
M73 P65 R6
G1 X172.97 Y160.063 E.58454
G1 X172.333 Y160.063 E.03268
G1 X164.277 Y152.007 E.58454
G1 X163.64 Y152.007 E.03268
G1 X171.696 Y160.063 E.58454
G1 X171.059 Y160.063 E.03268
G1 X163.003 Y152.007 E.58454
G1 X162.366 Y152.007 E.03268
G1 X170.422 Y160.063 E.58454
G1 X169.785 Y160.063 E.03268
G1 X161.729 Y152.007 E.58454
G1 X161.092 Y152.007 E.03268
G1 X169.148 Y160.063 E.58454
G1 X168.511 Y160.063 E.03268
G1 X160.455 Y152.007 E.58454
G1 X159.818 Y152.007 E.03268
G1 X167.875 Y160.063 E.58454
G1 X167.238 Y160.063 E.03268
G1 X159.181 Y152.007 E.58454
G1 X158.544 Y152.007 E.03268
G1 X166.601 Y160.063 E.58454
G1 X165.964 Y160.063 E.03268
G1 X157.907 Y152.007 E.58454
G1 X157.27 Y152.007 E.03268
G1 X165.327 Y160.063 E.58454
G1 X164.69 Y160.063 E.03268
G1 X156.633 Y152.007 E.58454
G1 X155.996 Y152.007 E.03268
G1 X164.053 Y160.063 E.58454
G1 X163.416 Y160.063 E.03268
G1 X155.359 Y152.007 E.58454
G1 X154.722 Y152.007 E.03268
G1 X162.779 Y160.063 E.58454
G1 X162.142 Y160.063 E.03268
G1 X154.085 Y152.007 E.58454
G1 X153.448 Y152.007 E.03268
G1 X161.505 Y160.063 E.58454
G1 X160.868 Y160.063 E.03268
G1 X152.811 Y152.007 E.58454
G1 X152.174 Y152.007 E.03268
G1 X160.231 Y160.063 E.58454
G1 X159.594 Y160.063 E.03268
G1 X151.537 Y152.007 E.58454
G1 X150.9 Y152.007 E.03268
G1 X158.957 Y160.063 E.58454
G1 X158.32 Y160.063 E.03268
G1 X150.263 Y152.007 E.58454
G1 X149.626 Y152.007 E.03268
G1 X157.683 Y160.063 E.58454
G1 X157.046 Y160.063 E.03268
G1 X148.989 Y152.007 E.58454
G1 X148.353 Y152.007 E.03268
G1 X156.409 Y160.063 E.58454
G1 X155.772 Y160.063 E.03268
G1 X147.716 Y152.007 E.58454
G1 X147.079 Y152.007 E.03268
G1 X155.135 Y160.063 E.58454
G1 X154.498 Y160.063 E.03268
G1 X146.442 Y152.007 E.58454
G1 X145.805 Y152.007 E.03268
G1 X153.861 Y160.063 E.58454
G1 X153.224 Y160.063 E.03268
G1 X145.168 Y152.007 E.58454
G1 X144.531 Y152.007 E.03268
G1 X152.587 Y160.063 E.58454
G1 X151.95 Y160.063 E.03268
G1 X143.894 Y152.007 E.58454
G1 X143.257 Y152.007 E.03268
G1 X151.313 Y160.063 E.58454
G1 X150.676 Y160.063 E.03268
G1 X142.62 Y152.007 E.58454
G1 X141.983 Y152.007 E.03268
G1 X150.039 Y160.063 E.58454
G1 X149.402 Y160.063 E.03268
G1 X141.346 Y152.007 E.58454
G1 X140.709 Y152.007 E.03268
G1 X148.765 Y160.063 E.58454
G1 X148.128 Y160.063 E.03268
G1 X140.072 Y152.007 E.58454
G1 X139.435 Y152.007 E.03268
G1 X147.491 Y160.063 E.58454
G1 X146.854 Y160.063 E.03268
G1 X138.798 Y152.007 E.58454
G1 X138.161 Y152.007 E.03268
G1 X146.217 Y160.063 E.58454
G1 X145.58 Y160.063 E.03268
G1 X137.524 Y152.007 E.58454
M73 P66 R6
G1 X136.887 Y152.007 E.03268
G1 X144.943 Y160.063 E.58454
G1 X144.306 Y160.063 E.03268
G1 X136.25 Y152.007 E.58454
G1 X135.613 Y152.007 E.03268
G1 X143.669 Y160.063 E.58454
G1 X143.032 Y160.063 E.03268
G1 X134.976 Y152.007 E.58454
G1 X134.339 Y152.007 E.03268
G1 X142.395 Y160.063 E.58454
G1 X141.758 Y160.063 E.03268
G1 X133.702 Y152.007 E.58454
G1 X133.065 Y152.007 E.03268
G1 X141.122 Y160.063 E.58454
G1 X140.485 Y160.063 E.03268
G1 X132.428 Y152.007 E.58454
G1 X131.791 Y152.007 E.03268
G1 X139.848 Y160.063 E.58454
G1 X139.211 Y160.063 E.03268
G1 X131.154 Y152.007 E.58454
G1 X130.517 Y152.007 E.03268
G1 X138.574 Y160.063 E.58454
G1 X137.937 Y160.063 E.03268
G1 X129.88 Y152.007 E.58454
G1 X129.243 Y152.007 E.03268
G1 X137.3 Y160.063 E.58454
G1 X136.663 Y160.063 E.03268
G1 X128.606 Y152.007 E.58454
G1 X127.969 Y152.007 E.03268
G1 X136.026 Y160.063 E.58454
G1 X135.389 Y160.063 E.03268
G1 X127.332 Y152.007 E.58454
G1 X126.695 Y152.007 E.03268
G1 X134.752 Y160.063 E.58454
G1 X134.115 Y160.063 E.03268
G1 X126.058 Y152.007 E.58454
G1 X125.421 Y152.007 E.03268
G1 X133.478 Y160.063 E.58454
G1 X132.841 Y160.063 E.03268
G1 X124.784 Y152.007 E.58454
G1 X124.147 Y152.007 E.03268
G1 X132.204 Y160.063 E.58454
M73 P66 R5
G1 X131.567 Y160.063 E.03268
G1 X123.51 Y152.007 E.58454
G1 X122.873 Y152.007 E.03268
G1 X130.93 Y160.063 E.58454
G1 X130.293 Y160.063 E.03268
G1 X122.237 Y152.007 E.58454
G1 X121.6 Y152.007 E.03268
G1 X129.656 Y160.063 E.58454
G1 X129.019 Y160.063 E.03268
G1 X120.963 Y152.007 E.58454
G1 X120.326 Y152.007 E.03268
G1 X128.382 Y160.063 E.58454
G1 X127.745 Y160.063 E.03268
G1 X119.689 Y152.007 E.58454
G1 X119.052 Y152.007 E.03268
G1 X127.108 Y160.063 E.58454
G1 X126.471 Y160.063 E.03268
G1 X118.415 Y152.007 E.58454
G1 X117.778 Y152.007 E.03268
G1 X125.834 Y160.063 E.58454
G1 X125.197 Y160.063 E.03268
G1 X117.141 Y152.007 E.58454
G1 X116.504 Y152.007 E.03268
G1 X124.56 Y160.063 E.58454
G1 X123.923 Y160.063 E.03268
G1 X115.867 Y152.007 E.58454
G1 X115.23 Y152.007 E.03268
G1 X123.286 Y160.063 E.58454
G1 X122.649 Y160.063 E.03268
G1 X114.593 Y152.007 E.58454
G1 X113.956 Y152.007 E.03268
G1 X122.012 Y160.063 E.58454
G1 X121.375 Y160.063 E.03268
G1 X113.319 Y152.007 E.58454
G1 X112.682 Y152.007 E.03268
G1 X120.738 Y160.063 E.58454
G1 X120.101 Y160.063 E.03268
G1 X112.045 Y152.007 E.58454
G1 X111.408 Y152.007 E.03268
G1 X119.464 Y160.063 E.58454
G1 X118.827 Y160.063 E.03268
G1 X110.771 Y152.007 E.58454
M73 P67 R5
G1 X110.134 Y152.007 E.03268
G1 X118.19 Y160.063 E.58454
G1 X117.553 Y160.063 E.03268
G1 X109.497 Y152.007 E.58454
G1 X108.86 Y152.007 E.03268
G1 X116.916 Y160.063 E.58454
G1 X116.279 Y160.063 E.03268
G1 X108.223 Y152.007 E.58454
G1 X107.586 Y152.007 E.03268
G1 X115.642 Y160.063 E.58454
G1 X115.006 Y160.063 E.03268
G1 X106.949 Y152.007 E.58454
G1 X106.312 Y152.007 E.03268
G1 X114.369 Y160.063 E.58454
G1 X113.732 Y160.063 E.03268
G1 X105.675 Y152.007 E.58454
G1 X105.038 Y152.007 E.03268
G1 X113.095 Y160.063 E.58454
G1 X112.458 Y160.063 E.03268
G1 X104.401 Y152.007 E.58454
G1 X103.764 Y152.007 E.03268
G1 X111.821 Y160.063 E.58454
G1 X111.184 Y160.063 E.03268
G1 X103.127 Y152.007 E.58454
G1 X102.49 Y152.007 E.03268
G1 X110.547 Y160.063 E.58454
G1 X109.91 Y160.063 E.03268
G1 X101.853 Y152.007 E.58454
G1 X101.216 Y152.007 E.03268
G1 X109.273 Y160.063 E.58454
G1 X108.636 Y160.063 E.03268
G1 X100.579 Y152.007 E.58454
G1 X99.942 Y152.007 E.03268
G1 X107.999 Y160.063 E.58454
G1 X107.362 Y160.063 E.03268
G1 X99.305 Y152.007 E.58454
G1 X98.668 Y152.007 E.03268
G1 X106.725 Y160.063 E.58454
G1 X106.088 Y160.063 E.03268
G1 X98.031 Y152.007 E.58454
G1 X97.394 Y152.007 E.03268
G1 X105.451 Y160.063 E.58454
G1 X104.814 Y160.063 E.03268
G1 X96.757 Y152.007 E.58454
G1 X96.12 Y152.007 E.03268
G1 X104.177 Y160.063 E.58454
G1 X103.54 Y160.063 E.03268
G1 X95.484 Y152.007 E.58454
G1 X94.847 Y152.007 E.03268
G1 X102.903 Y160.063 E.58454
G1 X102.266 Y160.063 E.03268
G1 X94.21 Y152.007 E.58454
G1 X93.573 Y152.007 E.03268
G1 X101.629 Y160.063 E.58454
G1 X100.992 Y160.063 E.03268
G1 X92.936 Y152.007 E.58454
G1 X92.299 Y152.007 E.03268
G1 X100.355 Y160.063 E.58454
G1 X99.718 Y160.063 E.03268
G1 X91.662 Y152.007 E.58454
G1 X91.025 Y152.007 E.03268
G1 X99.081 Y160.063 E.58454
G1 X98.444 Y160.063 E.03268
G1 X90.388 Y152.007 E.58454
G1 X89.751 Y152.007 E.03268
G1 X97.807 Y160.063 E.58454
G1 X97.17 Y160.063 E.03268
G1 X89.114 Y152.007 E.58454
G1 X88.477 Y152.007 E.03268
G1 X96.533 Y160.063 E.58454
G1 X95.896 Y160.063 E.03268
G1 X87.84 Y152.007 E.58454
G1 X87.203 Y152.007 E.03268
G1 X95.259 Y160.063 E.58454
G1 X94.622 Y160.063 E.03268
G1 X86.566 Y152.007 E.58454
G1 X85.929 Y152.007 E.03268
G1 X93.985 Y160.063 E.58454
G1 X93.348 Y160.063 E.03268
G1 X85.292 Y152.007 E.58454
G1 X84.655 Y152.007 E.03268
G1 X92.711 Y160.063 E.58454
G1 X92.074 Y160.063 E.03268
G1 X84.018 Y152.007 E.58454
G1 X83.381 Y152.007 E.03268
G1 X91.437 Y160.063 E.58454
M73 P68 R5
G1 X90.8 Y160.063 E.03268
G1 X82.744 Y152.007 E.58454
G1 X82.107 Y152.007 E.03268
G1 X90.163 Y160.063 E.58454
G1 X89.526 Y160.063 E.03268
G1 X81.47 Y152.007 E.58454
G1 X80.833 Y152.007 E.03268
G1 X88.889 Y160.063 E.58454
G1 X88.253 Y160.063 E.03268
G1 X80.196 Y152.007 E.58454
G1 X80.103 Y152.007 E.00476
G1 X80.103 Y152.551 E.02792
G1 X87.616 Y160.063 E.54506
G1 X86.979 Y160.063 E.03268
G1 X80.103 Y153.188 E.49884
G1 X80.103 Y153.825 E.03268
G1 X86.342 Y160.063 E.45263
G1 X85.705 Y160.063 E.03268
G1 X80.103 Y154.462 E.40641
G1 X80.103 Y155.099 E.03268
G1 X85.068 Y160.063 E.3602
G1 X84.431 Y160.063 E.03268
G1 X80.103 Y155.736 E.31398
G1 X80.103 Y156.373 E.03268
G1 X83.794 Y160.063 E.26776
G1 X83.157 Y160.063 E.03268
G1 X80.103 Y157.01 E.22155
G1 X80.103 Y157.647 E.03268
G1 X82.52 Y160.063 E.17533
G1 X81.883 Y160.063 E.03268
G1 X80.103 Y158.283 E.12911
G1 X80.103 Y158.92 E.03268
G1 X81.246 Y160.063 E.0829
G1 X80.609 Y160.063 E.03268
G1 X79.901 Y159.355 E.05137
; OBJECT_ID: 113
; WIPE_START
G1 X80.609 Y160.063 E-.3805
G1 X81.246 Y160.063 E-.24205
G1 X80.99 Y159.807 E-.13745
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 113
M624 AQAAAAAAAAA=
G1 X88.29 Y157.58 Z1.6 F15000
G1 X177.398 Y130.398 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9000
G1 X78.602 Y130.398 E3.27724
G1 X78.602 Y121.602 E.29178
G1 X177.398 Y121.602 E3.27724
G1 X177.398 Y130.338 E.28979
M204 S250
G1 X177.79 Y130.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X78.21 Y130.79 E3.05982
G1 X78.21 Y121.21 E.29437
G1 X177.79 Y121.21 E3.05982
G1 X177.79 Y130.73 E.29252
; WIPE_START
M204 S5000
G1 X175.79 Y130.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.24 Y123.112 Z1.6 F15000
G1 X176.319 Y121.769 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40041
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X177.028 Y122.478 E.05143
G1 X177.028 Y123.115 E.03268
G1 X175.885 Y121.972 E.08295
G1 X175.248 Y121.972 E.03268
G1 X177.028 Y123.752 E.12917
G1 X177.028 Y124.389 E.03268
G1 X174.611 Y121.972 E.17538
G1 X173.974 Y121.972 E.03268
G1 X177.028 Y125.026 E.2216
G1 X177.028 Y125.663 E.03268
G1 X173.337 Y121.972 E.26782
G1 X172.7 Y121.972 E.03268
G1 X177.028 Y126.3 E.31403
G1 X177.028 Y126.937 E.03268
G1 X172.063 Y121.972 E.36025
G1 X171.426 Y121.972 E.03268
G1 X177.028 Y127.574 E.40647
G1 X177.028 Y128.211 E.03268
G1 X170.789 Y121.972 E.45268
G1 X170.152 Y121.972 E.03268
G1 X177.028 Y128.848 E.4989
G1 X177.028 Y129.485 E.03268
G1 X169.515 Y121.972 E.54512
G1 X168.878 Y121.972 E.03268
G1 X176.935 Y130.028 E.58454
G1 X176.298 Y130.028 E.03268
G1 X168.241 Y121.972 E.58454
G1 X167.604 Y121.972 E.03268
G1 X175.661 Y130.028 E.58454
G1 X175.024 Y130.028 E.03268
G1 X166.967 Y121.972 E.58454
G1 X166.33 Y121.972 E.03268
G1 X174.387 Y130.028 E.58454
G1 X173.75 Y130.028 E.03268
G1 X165.693 Y121.972 E.58454
M73 P69 R5
G1 X165.056 Y121.972 E.03268
G1 X173.113 Y130.028 E.58454
G1 X172.476 Y130.028 E.03268
G1 X164.419 Y121.972 E.58454
G1 X163.782 Y121.972 E.03268
G1 X171.839 Y130.028 E.58454
G1 X171.202 Y130.028 E.03268
G1 X163.145 Y121.972 E.58454
G1 X162.508 Y121.972 E.03268
G1 X170.565 Y130.028 E.58454
G1 X169.928 Y130.028 E.03268
G1 X161.871 Y121.972 E.58454
G1 X161.235 Y121.972 E.03268
G1 X169.291 Y130.028 E.58454
G1 X168.654 Y130.028 E.03268
G1 X160.598 Y121.972 E.58454
G1 X159.961 Y121.972 E.03268
G1 X168.017 Y130.028 E.58454
G1 X167.38 Y130.028 E.03268
G1 X159.324 Y121.972 E.58454
G1 X158.687 Y121.972 E.03268
G1 X166.743 Y130.028 E.58454
G1 X166.106 Y130.028 E.03268
G1 X158.05 Y121.972 E.58454
G1 X157.413 Y121.972 E.03268
G1 X165.469 Y130.028 E.58454
G1 X164.832 Y130.028 E.03268
G1 X156.776 Y121.972 E.58454
G1 X156.139 Y121.972 E.03268
G1 X164.195 Y130.028 E.58454
G1 X163.558 Y130.028 E.03268
G1 X155.502 Y121.972 E.58454
G1 X154.865 Y121.972 E.03268
G1 X162.921 Y130.028 E.58454
G1 X162.284 Y130.028 E.03268
G1 X154.228 Y121.972 E.58454
G1 X153.591 Y121.972 E.03268
G1 X161.647 Y130.028 E.58454
G1 X161.01 Y130.028 E.03268
G1 X152.954 Y121.972 E.58454
G1 X152.317 Y121.972 E.03268
G1 X160.373 Y130.028 E.58454
G1 X159.736 Y130.028 E.03268
G1 X151.68 Y121.972 E.58454
G1 X151.043 Y121.972 E.03268
G1 X159.099 Y130.028 E.58454
G1 X158.462 Y130.028 E.03268
G1 X150.406 Y121.972 E.58454
G1 X149.769 Y121.972 E.03268
G1 X157.825 Y130.028 E.58454
G1 X157.188 Y130.028 E.03268
G1 X149.132 Y121.972 E.58454
G1 X148.495 Y121.972 E.03268
G1 X156.551 Y130.028 E.58454
G1 X155.914 Y130.028 E.03268
G1 X147.858 Y121.972 E.58454
G1 X147.221 Y121.972 E.03268
G1 X155.277 Y130.028 E.58454
G1 X154.64 Y130.028 E.03268
G1 X146.584 Y121.972 E.58454
G1 X145.947 Y121.972 E.03268
G1 X154.004 Y130.028 E.58454
G1 X153.367 Y130.028 E.03268
G1 X145.31 Y121.972 E.58454
G1 X144.673 Y121.972 E.03268
G1 X152.73 Y130.028 E.58454
G1 X152.093 Y130.028 E.03268
G1 X144.036 Y121.972 E.58454
G1 X143.399 Y121.972 E.03268
G1 X151.456 Y130.028 E.58454
G1 X150.819 Y130.028 E.03268
G1 X142.762 Y121.972 E.58454
G1 X142.125 Y121.972 E.03268
G1 X150.182 Y130.028 E.58454
G1 X149.545 Y130.028 E.03268
G1 X141.488 Y121.972 E.58454
G1 X140.851 Y121.972 E.03268
G1 X148.908 Y130.028 E.58454
G1 X148.271 Y130.028 E.03268
G1 X140.214 Y121.972 E.58454
G1 X139.577 Y121.972 E.03268
G1 X147.634 Y130.028 E.58454
G1 X146.997 Y130.028 E.03268
G1 X138.94 Y121.972 E.58454
M73 P70 R5
G1 X138.303 Y121.972 E.03268
G1 X146.36 Y130.028 E.58454
G1 X145.723 Y130.028 E.03268
G1 X137.666 Y121.972 E.58454
G1 X137.029 Y121.972 E.03268
G1 X145.086 Y130.028 E.58454
G1 X144.449 Y130.028 E.03268
G1 X136.392 Y121.972 E.58454
G1 X135.755 Y121.972 E.03268
G1 X143.812 Y130.028 E.58454
G1 X143.175 Y130.028 E.03268
G1 X135.118 Y121.972 E.58454
G1 X134.482 Y121.972 E.03268
G1 X142.538 Y130.028 E.58454
G1 X141.901 Y130.028 E.03268
G1 X133.845 Y121.972 E.58454
G1 X133.208 Y121.972 E.03268
G1 X141.264 Y130.028 E.58454
G1 X140.627 Y130.028 E.03268
G1 X132.571 Y121.972 E.58454
G1 X131.934 Y121.972 E.03268
G1 X139.99 Y130.028 E.58454
G1 X139.353 Y130.028 E.03268
G1 X131.297 Y121.972 E.58454
G1 X130.66 Y121.972 E.03268
G1 X138.716 Y130.028 E.58454
G1 X138.079 Y130.028 E.03268
G1 X130.023 Y121.972 E.58454
G1 X129.386 Y121.972 E.03268
G1 X137.442 Y130.028 E.58454
G1 X136.805 Y130.028 E.03268
G1 X128.749 Y121.972 E.58454
G1 X128.112 Y121.972 E.03268
G1 X136.168 Y130.028 E.58454
G1 X135.531 Y130.028 E.03268
G1 X127.475 Y121.972 E.58454
G1 X126.838 Y121.972 E.03268
G1 X134.894 Y130.028 E.58454
G1 X134.257 Y130.028 E.03268
G1 X126.201 Y121.972 E.58454
G1 X125.564 Y121.972 E.03268
G1 X133.62 Y130.028 E.58454
G1 X132.983 Y130.028 E.03268
G1 X124.927 Y121.972 E.58454
G1 X124.29 Y121.972 E.03268
G1 X132.346 Y130.028 E.58454
G1 X131.709 Y130.028 E.03268
G1 X123.653 Y121.972 E.58454
G1 X123.016 Y121.972 E.03268
G1 X131.072 Y130.028 E.58454
G1 X130.435 Y130.028 E.03268
G1 X122.379 Y121.972 E.58454
G1 X121.742 Y121.972 E.03268
G1 X129.798 Y130.028 E.58454
G1 X129.161 Y130.028 E.03268
G1 X121.105 Y121.972 E.58454
G1 X120.468 Y121.972 E.03268
G1 X128.524 Y130.028 E.58454
G1 X127.887 Y130.028 E.03268
G1 X119.831 Y121.972 E.58454
G1 X119.194 Y121.972 E.03268
G1 X127.251 Y130.028 E.58454
G1 X126.614 Y130.028 E.03268
G1 X118.557 Y121.972 E.58454
G1 X117.92 Y121.972 E.03268
G1 X125.977 Y130.028 E.58454
G1 X125.34 Y130.028 E.03268
G1 X117.283 Y121.972 E.58454
G1 X116.646 Y121.972 E.03268
G1 X124.703 Y130.028 E.58454
G1 X124.066 Y130.028 E.03268
G1 X116.009 Y121.972 E.58454
G1 X115.372 Y121.972 E.03268
G1 X123.429 Y130.028 E.58454
G1 X122.792 Y130.028 E.03268
G1 X114.735 Y121.972 E.58454
G1 X114.098 Y121.972 E.03268
G1 X122.155 Y130.028 E.58454
G1 X121.518 Y130.028 E.03268
G1 X113.461 Y121.972 E.58454
G1 X112.824 Y121.972 E.03268
G1 X120.881 Y130.028 E.58454
G1 X120.244 Y130.028 E.03268
G1 X112.187 Y121.972 E.58454
G1 X111.55 Y121.972 E.03268
G1 X119.607 Y130.028 E.58454
M73 P71 R5
G1 X118.97 Y130.028 E.03268
G1 X110.913 Y121.972 E.58454
G1 X110.276 Y121.972 E.03268
G1 X118.333 Y130.028 E.58454
G1 X117.696 Y130.028 E.03268
G1 X109.639 Y121.972 E.58454
G1 X109.002 Y121.972 E.03268
G1 X117.059 Y130.028 E.58454
G1 X116.422 Y130.028 E.03268
G1 X108.365 Y121.972 E.58454
G1 X107.729 Y121.972 E.03268
G1 X115.785 Y130.028 E.58454
G1 X115.148 Y130.028 E.03268
G1 X107.092 Y121.972 E.58454
G1 X106.455 Y121.972 E.03268
G1 X114.511 Y130.028 E.58454
G1 X113.874 Y130.028 E.03268
G1 X105.818 Y121.972 E.58454
G1 X105.181 Y121.972 E.03268
G1 X113.237 Y130.028 E.58454
G1 X112.6 Y130.028 E.03268
G1 X104.544 Y121.972 E.58454
G1 X103.907 Y121.972 E.03268
G1 X111.963 Y130.028 E.58454
G1 X111.326 Y130.028 E.03268
G1 X103.27 Y121.972 E.58454
G1 X102.633 Y121.972 E.03268
G1 X110.689 Y130.028 E.58454
G1 X110.052 Y130.028 E.03268
G1 X101.996 Y121.972 E.58454
G1 X101.359 Y121.972 E.03268
G1 X109.415 Y130.028 E.58454
G1 X108.778 Y130.028 E.03268
G1 X100.722 Y121.972 E.58454
G1 X100.085 Y121.972 E.03268
G1 X108.141 Y130.028 E.58454
G1 X107.504 Y130.028 E.03268
G1 X99.448 Y121.972 E.58454
G1 X98.811 Y121.972 E.03268
G1 X106.867 Y130.028 E.58454
G1 X106.23 Y130.028 E.03268
G1 X98.174 Y121.972 E.58454
G1 X97.537 Y121.972 E.03268
G1 X105.593 Y130.028 E.58454
G1 X104.956 Y130.028 E.03268
G1 X96.9 Y121.972 E.58454
G1 X96.263 Y121.972 E.03268
G1 X104.319 Y130.028 E.58454
G1 X103.682 Y130.028 E.03268
G1 X95.626 Y121.972 E.58454
G1 X94.989 Y121.972 E.03268
G1 X103.045 Y130.028 E.58454
G1 X102.408 Y130.028 E.03268
G1 X94.352 Y121.972 E.58454
G1 X93.715 Y121.972 E.03268
G1 X101.771 Y130.028 E.58454
G1 X101.134 Y130.028 E.03268
G1 X93.078 Y121.972 E.58454
G1 X92.441 Y121.972 E.03268
G1 X100.498 Y130.028 E.58454
G1 X99.861 Y130.028 E.03268
G1 X91.804 Y121.972 E.58454
G1 X91.167 Y121.972 E.03268
G1 X99.224 Y130.028 E.58454
G1 X98.587 Y130.028 E.03268
G1 X90.53 Y121.972 E.58454
G1 X89.893 Y121.972 E.03268
G1 X97.95 Y130.028 E.58454
G1 X97.313 Y130.028 E.03268
G1 X89.256 Y121.972 E.58454
G1 X88.619 Y121.972 E.03268
G1 X96.676 Y130.028 E.58454
G1 X96.039 Y130.028 E.03268
G1 X87.982 Y121.972 E.58454
G1 X87.345 Y121.972 E.03268
G1 X95.402 Y130.028 E.58454
G1 X94.765 Y130.028 E.03268
G1 X86.708 Y121.972 E.58454
G1 X86.071 Y121.972 E.03268
G1 X94.128 Y130.028 E.58454
G1 X93.491 Y130.028 E.03268
G1 X85.434 Y121.972 E.58454
G1 X84.797 Y121.972 E.03268
G1 X92.854 Y130.028 E.58454
M73 P72 R5
G1 X92.217 Y130.028 E.03268
G1 X84.16 Y121.972 E.58454
G1 X83.523 Y121.972 E.03268
G1 X91.58 Y130.028 E.58454
G1 X90.943 Y130.028 E.03268
G1 X82.886 Y121.972 E.58454
G1 X82.249 Y121.972 E.03268
G1 X90.306 Y130.028 E.58454
M73 P72 R4
G1 X89.669 Y130.028 E.03268
G1 X81.613 Y121.972 E.58454
G1 X80.976 Y121.972 E.03268
G1 X89.032 Y130.028 E.58454
G1 X88.395 Y130.028 E.03268
G1 X80.339 Y121.972 E.58454
G1 X79.702 Y121.972 E.03268
G1 X87.758 Y130.028 E.58454
G1 X87.121 Y130.028 E.03268
G1 X79.065 Y121.972 E.58454
G1 X78.972 Y121.972 E.00476
G1 X78.972 Y122.516 E.02792
G1 X86.484 Y130.028 E.54506
G1 X85.847 Y130.028 E.03268
G1 X78.972 Y123.153 E.49884
G1 X78.972 Y123.79 E.03268
G1 X85.21 Y130.028 E.45263
G1 X84.573 Y130.028 E.03268
G1 X78.972 Y124.427 E.40641
G1 X78.972 Y125.064 E.03268
G1 X83.936 Y130.028 E.3602
G1 X83.299 Y130.028 E.03268
G1 X78.972 Y125.701 E.31398
G1 X78.972 Y126.338 E.03268
G1 X82.662 Y130.028 E.26776
G1 X82.025 Y130.028 E.03268
G1 X78.972 Y126.975 E.22155
G1 X78.972 Y127.612 E.03268
G1 X81.388 Y130.028 E.17533
G1 X80.751 Y130.028 E.03268
G1 X78.972 Y128.249 E.12911
G1 X78.972 Y128.886 E.03268
G1 X80.114 Y130.028 E.0829
G1 X79.477 Y130.028 E.03268
G1 X78.769 Y129.32 E.05137
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X79.477 Y130.028 E-.3805
G1 X80.114 Y130.028 E-.24205
G1 X79.859 Y129.772 E-.13745
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 113
M625
; layer num/total_layer_count: 7/10
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F15000
; object ids of layer 7 start: 113,149
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
; object ids of this layer7 end: 113,149
M625
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X178.529 Y160.433
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X79.734 Y160.433 E3.27724
G1 X79.734 Y151.637 E.29178
G1 X178.529 Y151.637 E3.27724
G1 X178.529 Y160.373 E.28979
M204 S250
G1 X178.921 Y160.825 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X79.341 Y160.825 E3.05982
G1 X79.341 Y151.245 E.29437
G1 X178.921 Y151.245 E3.05982
G1 X178.921 Y160.765 E.29252
; WIPE_START
M204 S5000
G1 X176.921 Y160.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.245 Y153.249 Z1.8 F15000
G1 X178.366 Y152.565 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42126
G1 F7500
G1 X177.771 Y151.97 E.02595
G1 X177.236 Y151.97 E.0165
G1 X178.196 Y152.931 E.04188
G1 X178.196 Y153.466 E.0165
G1 X176.7 Y151.97 E.06521
G1 X176.165 Y151.97 E.0165
G1 X178.196 Y154.001 E.08854
G1 X178.196 Y154.536 E.0165
G1 X175.63 Y151.97 E.11187
G1 X175.095 Y151.97 E.0165
G1 X178.196 Y155.071 E.1352
G1 X178.196 Y155.606 E.0165
G1 X174.56 Y151.97 E.15853
G1 X174.025 Y151.97 E.0165
G1 X178.196 Y156.141 E.18185
G1 X178.196 Y156.676 E.0165
G1 X173.49 Y151.97 E.20518
G1 X172.955 Y151.97 E.0165
G1 X178.196 Y157.211 E.22851
G1 X178.196 Y157.746 E.0165
G1 X172.42 Y151.97 E.25184
G1 X171.885 Y151.97 E.0165
G1 X178.196 Y158.281 E.27517
G1 X178.196 Y158.816 E.0165
G1 X171.35 Y151.97 E.2985
G1 X170.815 Y151.97 E.0165
G1 X178.196 Y159.351 E.32182
G1 X178.196 Y159.886 E.0165
G1 X170.28 Y151.97 E.34515
G1 X169.745 Y151.97 E.0165
M73 P73 R4
G1 X177.874 Y160.099 E.35444
G1 X177.339 Y160.099 E.0165
G1 X169.21 Y151.97 E.35444
G1 X168.675 Y151.97 E.0165
G1 X176.804 Y160.099 E.35444
G1 X176.269 Y160.099 E.0165
G1 X168.14 Y151.97 E.35444
G1 X167.605 Y151.97 E.0165
G1 X175.734 Y160.099 E.35444
G1 X175.199 Y160.099 E.0165
G1 X167.069 Y151.97 E.35444
G1 X166.534 Y151.97 E.0165
G1 X174.664 Y160.099 E.35444
G1 X174.129 Y160.099 E.0165
G1 X165.999 Y151.97 E.35444
G1 X165.464 Y151.97 E.0165
G1 X173.594 Y160.099 E.35444
G1 X173.059 Y160.099 E.0165
G1 X164.929 Y151.97 E.35444
G1 X164.394 Y151.97 E.0165
G1 X172.524 Y160.099 E.35444
G1 X171.989 Y160.099 E.0165
G1 X163.859 Y151.97 E.35444
G1 X163.324 Y151.97 E.0165
G1 X171.453 Y160.099 E.35444
G1 X170.918 Y160.099 E.0165
G1 X162.789 Y151.97 E.35444
G1 X162.254 Y151.97 E.0165
G1 X170.383 Y160.099 E.35444
G1 X169.848 Y160.099 E.0165
G1 X161.719 Y151.97 E.35444
G1 X161.184 Y151.97 E.0165
G1 X169.313 Y160.099 E.35444
G1 X168.778 Y160.099 E.0165
G1 X160.649 Y151.97 E.35444
G1 X160.114 Y151.97 E.0165
G1 X168.243 Y160.099 E.35444
G1 X167.708 Y160.099 E.0165
G1 X159.579 Y151.97 E.35444
G1 X159.044 Y151.97 E.0165
G1 X167.173 Y160.099 E.35444
G1 X166.638 Y160.099 E.0165
G1 X158.509 Y151.97 E.35444
G1 X157.974 Y151.97 E.0165
G1 X166.103 Y160.099 E.35444
G1 X165.568 Y160.099 E.0165
G1 X157.439 Y151.97 E.35444
G1 X156.903 Y151.97 E.0165
G1 X165.033 Y160.099 E.35444
G1 X164.498 Y160.099 E.0165
G1 X156.368 Y151.97 E.35444
G1 X155.833 Y151.97 E.0165
G1 X163.963 Y160.099 E.35444
G1 X163.428 Y160.099 E.0165
G1 X155.298 Y151.97 E.35444
G1 X154.763 Y151.97 E.0165
G1 X162.893 Y160.099 E.35444
G1 X162.358 Y160.099 E.0165
G1 X154.228 Y151.97 E.35444
G1 X153.693 Y151.97 E.0165
G1 X161.823 Y160.099 E.35444
G1 X161.287 Y160.099 E.0165
G1 X153.158 Y151.97 E.35444
G1 X152.623 Y151.97 E.0165
G1 X160.752 Y160.099 E.35444
G1 X160.217 Y160.099 E.0165
G1 X152.088 Y151.97 E.35444
G1 X151.553 Y151.97 E.0165
G1 X159.682 Y160.099 E.35444
G1 X159.147 Y160.099 E.0165
G1 X151.018 Y151.97 E.35444
G1 X150.483 Y151.97 E.0165
G1 X158.612 Y160.099 E.35444
G1 X158.077 Y160.099 E.0165
G1 X149.948 Y151.97 E.35444
G1 X149.413 Y151.97 E.0165
G1 X157.542 Y160.099 E.35444
G1 X157.007 Y160.099 E.0165
G1 X148.878 Y151.97 E.35444
G1 X148.343 Y151.97 E.0165
G1 X156.472 Y160.099 E.35444
G1 X155.937 Y160.099 E.0165
G1 X147.808 Y151.97 E.35444
G1 X147.273 Y151.97 E.0165
G1 X155.402 Y160.099 E.35444
G1 X154.867 Y160.099 E.0165
G1 X146.737 Y151.97 E.35444
G1 X146.202 Y151.97 E.0165
G1 X154.332 Y160.099 E.35444
G1 X153.797 Y160.099 E.0165
G1 X145.667 Y151.97 E.35444
G1 X145.132 Y151.97 E.0165
G1 X153.262 Y160.099 E.35444
G1 X152.727 Y160.099 E.0165
G1 X144.597 Y151.97 E.35444
G1 X144.062 Y151.97 E.0165
G1 X152.192 Y160.099 E.35444
G1 X151.656 Y160.099 E.0165
G1 X143.527 Y151.97 E.35444
G1 X142.992 Y151.97 E.0165
G1 X151.121 Y160.099 E.35444
G1 X150.586 Y160.099 E.0165
G1 X142.457 Y151.97 E.35444
G1 X141.922 Y151.97 E.0165
G1 X150.051 Y160.099 E.35444
G1 X149.516 Y160.099 E.0165
G1 X141.387 Y151.97 E.35444
G1 X140.852 Y151.97 E.0165
G1 X148.981 Y160.099 E.35444
G1 X148.446 Y160.099 E.0165
G1 X140.317 Y151.97 E.35444
G1 X139.782 Y151.97 E.0165
G1 X147.911 Y160.099 E.35444
G1 X147.376 Y160.099 E.0165
G1 X139.247 Y151.97 E.35444
G1 X138.712 Y151.97 E.0165
G1 X146.841 Y160.099 E.35444
G1 X146.306 Y160.099 E.0165
G1 X138.177 Y151.97 E.35444
G1 X137.642 Y151.97 E.0165
G1 X145.771 Y160.099 E.35444
G1 X145.236 Y160.099 E.0165
G1 X137.106 Y151.97 E.35444
G1 X136.571 Y151.97 E.0165
G1 X144.701 Y160.099 E.35444
G1 X144.166 Y160.099 E.0165
G1 X136.036 Y151.97 E.35444
G1 X135.501 Y151.97 E.0165
M73 P74 R4
G1 X143.631 Y160.099 E.35444
G1 X143.096 Y160.099 E.0165
G1 X134.966 Y151.97 E.35444
G1 X134.431 Y151.97 E.0165
G1 X142.561 Y160.099 E.35444
G1 X142.026 Y160.099 E.0165
G1 X133.896 Y151.97 E.35444
G1 X133.361 Y151.97 E.0165
G1 X141.49 Y160.099 E.35444
G1 X140.955 Y160.099 E.0165
G1 X132.826 Y151.97 E.35444
G1 X132.291 Y151.97 E.0165
G1 X140.42 Y160.099 E.35444
G1 X139.885 Y160.099 E.0165
G1 X131.756 Y151.97 E.35444
G1 X131.221 Y151.97 E.0165
G1 X139.35 Y160.099 E.35444
G1 X138.815 Y160.099 E.0165
G1 X130.686 Y151.97 E.35444
G1 X130.151 Y151.97 E.0165
G1 X138.28 Y160.099 E.35444
G1 X137.745 Y160.099 E.0165
G1 X129.616 Y151.97 E.35444
G1 X129.081 Y151.97 E.0165
G1 X137.21 Y160.099 E.35444
G1 X136.675 Y160.099 E.0165
G1 X128.546 Y151.97 E.35444
G1 X128.011 Y151.97 E.0165
G1 X136.14 Y160.099 E.35444
G1 X135.605 Y160.099 E.0165
G1 X127.476 Y151.97 E.35444
G1 X126.94 Y151.97 E.0165
G1 X135.07 Y160.099 E.35444
G1 X134.535 Y160.099 E.0165
G1 X126.405 Y151.97 E.35444
G1 X125.87 Y151.97 E.0165
G1 X134 Y160.099 E.35444
G1 X133.465 Y160.099 E.0165
G1 X125.335 Y151.97 E.35444
G1 X124.8 Y151.97 E.0165
G1 X132.93 Y160.099 E.35444
G1 X132.395 Y160.099 E.0165
G1 X124.265 Y151.97 E.35444
G1 X123.73 Y151.97 E.0165
G1 X131.86 Y160.099 E.35444
G1 X131.324 Y160.099 E.0165
G1 X123.195 Y151.97 E.35444
G1 X122.66 Y151.97 E.0165
G1 X130.789 Y160.099 E.35444
G1 X130.254 Y160.099 E.0165
G1 X122.125 Y151.97 E.35444
G1 X121.59 Y151.97 E.0165
G1 X129.719 Y160.099 E.35444
G1 X129.184 Y160.099 E.0165
G1 X121.055 Y151.97 E.35444
G1 X120.52 Y151.97 E.0165
G1 X128.649 Y160.099 E.35444
G1 X128.114 Y160.099 E.0165
G1 X119.985 Y151.97 E.35444
G1 X119.45 Y151.97 E.0165
G1 X127.579 Y160.099 E.35444
G1 X127.044 Y160.099 E.0165
G1 X118.915 Y151.97 E.35444
G1 X118.38 Y151.97 E.0165
G1 X126.509 Y160.099 E.35444
G1 X125.974 Y160.099 E.0165
G1 X117.845 Y151.97 E.35444
G1 X117.31 Y151.97 E.0165
G1 X125.439 Y160.099 E.35444
G1 X124.904 Y160.099 E.0165
G1 X116.774 Y151.97 E.35444
G1 X116.239 Y151.97 E.0165
G1 X124.369 Y160.099 E.35444
G1 X123.834 Y160.099 E.0165
G1 X115.704 Y151.97 E.35444
G1 X115.169 Y151.97 E.0165
G1 X123.299 Y160.099 E.35444
G1 X122.764 Y160.099 E.0165
G1 X114.634 Y151.97 E.35444
G1 X114.099 Y151.97 E.0165
G1 X122.229 Y160.099 E.35444
G1 X121.694 Y160.099 E.0165
G1 X113.564 Y151.97 E.35444
G1 X113.029 Y151.97 E.0165
G1 X121.158 Y160.099 E.35444
G1 X120.623 Y160.099 E.0165
G1 X112.494 Y151.97 E.35444
G1 X111.959 Y151.97 E.0165
G1 X120.088 Y160.099 E.35444
G1 X119.553 Y160.099 E.0165
G1 X111.424 Y151.97 E.35444
G1 X110.889 Y151.97 E.0165
G1 X119.018 Y160.099 E.35444
G1 X118.483 Y160.099 E.0165
G1 X110.354 Y151.97 E.35444
G1 X109.819 Y151.97 E.0165
G1 X117.948 Y160.099 E.35444
G1 X117.413 Y160.099 E.0165
G1 X109.284 Y151.97 E.35444
G1 X108.749 Y151.97 E.0165
G1 X116.878 Y160.099 E.35444
G1 X116.343 Y160.099 E.0165
G1 X108.214 Y151.97 E.35444
G1 X107.679 Y151.97 E.0165
G1 X115.808 Y160.099 E.35444
G1 X115.273 Y160.099 E.0165
G1 X107.144 Y151.97 E.35444
G1 X106.608 Y151.97 E.0165
G1 X114.738 Y160.099 E.35444
G1 X114.203 Y160.099 E.0165
G1 X106.073 Y151.97 E.35444
G1 X105.538 Y151.97 E.0165
G1 X113.668 Y160.099 E.35444
G1 X113.133 Y160.099 E.0165
G1 X105.003 Y151.97 E.35444
G1 X104.468 Y151.97 E.0165
G1 X112.598 Y160.099 E.35444
G1 X112.063 Y160.099 E.0165
G1 X103.933 Y151.97 E.35444
G1 X103.398 Y151.97 E.0165
G1 X111.527 Y160.099 E.35444
G1 X110.992 Y160.099 E.0165
G1 X102.863 Y151.97 E.35444
G1 X102.328 Y151.97 E.0165
G1 X110.457 Y160.099 E.35444
G1 X109.922 Y160.099 E.0165
G1 X101.793 Y151.97 E.35444
G1 X101.258 Y151.97 E.0165
G1 X109.387 Y160.099 E.35444
G1 X108.852 Y160.099 E.0165
G1 X100.723 Y151.97 E.35444
G1 X100.188 Y151.97 E.0165
G1 X108.317 Y160.099 E.35444
G1 X107.782 Y160.099 E.0165
G1 X99.653 Y151.97 E.35444
G1 X99.118 Y151.97 E.0165
G1 X107.247 Y160.099 E.35444
G1 X106.712 Y160.099 E.0165
G1 X98.583 Y151.97 E.35444
G1 X98.048 Y151.97 E.0165
G1 X106.177 Y160.099 E.35444
G1 X105.642 Y160.099 E.0165
G1 X97.513 Y151.97 E.35444
G1 X96.977 Y151.97 E.0165
G1 X105.107 Y160.099 E.35444
G1 X104.572 Y160.099 E.0165
G1 X96.442 Y151.97 E.35444
G1 X95.907 Y151.97 E.0165
G1 X104.037 Y160.099 E.35444
G1 X103.502 Y160.099 E.0165
G1 X95.372 Y151.97 E.35444
G1 X94.837 Y151.97 E.0165
G1 X102.967 Y160.099 E.35444
G1 X102.432 Y160.099 E.0165
G1 X94.302 Y151.97 E.35444
G1 X93.767 Y151.97 E.0165
G1 X101.897 Y160.099 E.35444
G1 X101.361 Y160.099 E.0165
G1 X93.232 Y151.97 E.35444
G1 X92.697 Y151.97 E.0165
G1 X100.826 Y160.099 E.35444
G1 X100.291 Y160.099 E.0165
G1 X92.162 Y151.97 E.35444
G1 X91.627 Y151.97 E.0165
G1 X99.756 Y160.099 E.35444
M73 P75 R4
G1 X99.221 Y160.099 E.0165
G1 X91.092 Y151.97 E.35444
G1 X90.557 Y151.97 E.0165
G1 X98.686 Y160.099 E.35444
G1 X98.151 Y160.099 E.0165
G1 X90.022 Y151.97 E.35444
G1 X89.487 Y151.97 E.0165
G1 X97.616 Y160.099 E.35444
G1 X97.081 Y160.099 E.0165
G1 X88.952 Y151.97 E.35444
G1 X88.417 Y151.97 E.0165
G1 X96.546 Y160.099 E.35444
G1 X96.011 Y160.099 E.0165
G1 X87.882 Y151.97 E.35444
G1 X87.347 Y151.97 E.0165
G1 X95.476 Y160.099 E.35444
G1 X94.941 Y160.099 E.0165
G1 X86.811 Y151.97 E.35444
G1 X86.276 Y151.97 E.0165
G1 X94.406 Y160.099 E.35444
G1 X93.871 Y160.099 E.0165
G1 X85.741 Y151.97 E.35444
G1 X85.206 Y151.97 E.0165
G1 X93.336 Y160.099 E.35444
G1 X92.801 Y160.099 E.0165
G1 X84.671 Y151.97 E.35444
G1 X84.136 Y151.97 E.0165
G1 X92.266 Y160.099 E.35444
G1 X91.731 Y160.099 E.0165
G1 X83.601 Y151.97 E.35444
G1 X83.066 Y151.97 E.0165
G1 X91.195 Y160.099 E.35444
G1 X90.66 Y160.099 E.0165
G1 X82.531 Y151.97 E.35444
G1 X81.996 Y151.97 E.0165
G1 X90.125 Y160.099 E.35444
G1 X89.59 Y160.099 E.0165
G1 X81.461 Y151.97 E.35444
G1 X80.926 Y151.97 E.0165
G1 X89.055 Y160.099 E.35444
G1 X88.52 Y160.099 E.0165
G1 X80.391 Y151.97 E.35444
G1 X80.067 Y151.97 E.00999
G1 X80.067 Y152.181 E.00651
G1 X87.985 Y160.099 E.34524
G1 X87.45 Y160.099 E.0165
G1 X80.067 Y152.716 E.32191
G1 X80.067 Y153.251 E.0165
G1 X86.915 Y160.099 E.29858
G1 X86.38 Y160.099 E.0165
G1 X80.067 Y153.786 E.27525
G1 X80.067 Y154.321 E.0165
G1 X85.845 Y160.099 E.25193
G1 X85.31 Y160.099 E.0165
G1 X80.067 Y154.856 E.2286
G1 X80.067 Y155.391 E.0165
G1 X84.775 Y160.099 E.20527
G1 X84.24 Y160.099 E.0165
G1 X80.067 Y155.926 E.18194
G1 X80.067 Y156.462 E.0165
G1 X83.705 Y160.099 E.15861
G1 X83.17 Y160.099 E.0165
G1 X80.067 Y156.997 E.13528
G1 X80.067 Y157.532 E.0165
G1 X82.635 Y160.099 E.11196
G1 X82.1 Y160.099 E.0165
G1 X80.067 Y158.067 E.08863
G1 X80.067 Y158.602 E.0165
G1 X81.564 Y160.099 E.0653
G1 X81.029 Y160.099 E.0165
G1 X80.067 Y159.137 E.04197
G1 X80.067 Y159.672 E.0165
G1 X80.664 Y160.269 E.02604
; OBJECT_ID: 113
; WIPE_START
G1 X80.067 Y159.672 E-.32096
G1 X80.067 Y159.137 E-.20332
G1 X80.505 Y159.575 E-.23572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 113
M624 AQAAAAAAAAA=
G1 X87.814 Y157.375 Z1.8 F15000
G1 X177.398 Y130.398 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X78.602 Y130.398 E3.27724
G1 X78.602 Y121.602 E.29178
G1 X177.398 Y121.602 E3.27724
G1 X177.398 Y130.338 E.28979
M204 S250
G1 X177.79 Y130.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X78.21 Y130.79 E3.05982
G1 X78.21 Y121.21 E.29437
G1 X177.79 Y121.21 E3.05982
G1 X177.79 Y130.73 E.29252
; WIPE_START
M204 S5000
G1 X175.79 Y130.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.114 Y123.214 Z1.8 F15000
G1 X177.234 Y122.531 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42126
G1 F7500
G1 X176.639 Y121.935 E.02595
G1 X176.104 Y121.935 E.0165
G1 X177.065 Y122.896 E.04188
G1 X177.065 Y123.431 E.0165
G1 X175.569 Y121.935 E.06521
G1 X175.034 Y121.935 E.0165
G1 X177.065 Y123.966 E.08854
G1 X177.065 Y124.501 E.0165
G1 X174.499 Y121.935 E.11187
G1 X173.964 Y121.935 E.0165
G1 X177.065 Y125.036 E.1352
G1 X177.065 Y125.571 E.0165
G1 X173.429 Y121.935 E.15853
G1 X172.894 Y121.935 E.0165
G1 X177.065 Y126.106 E.18185
G1 X177.065 Y126.641 E.0165
G1 X172.359 Y121.935 E.20518
G1 X171.824 Y121.935 E.0165
G1 X177.065 Y127.176 E.22851
G1 X177.065 Y127.711 E.0165
G1 X171.289 Y121.935 E.25184
G1 X170.753 Y121.935 E.0165
G1 X177.065 Y128.247 E.27517
G1 X177.065 Y128.782 E.0165
G1 X170.218 Y121.935 E.2985
G1 X169.683 Y121.935 E.0165
G1 X177.065 Y129.317 E.32182
G1 X177.065 Y129.852 E.0165
G1 X169.148 Y121.935 E.34515
G1 X168.613 Y121.935 E.0165
G1 X176.743 Y130.065 E.35444
G1 X176.208 Y130.065 E.0165
G1 X168.078 Y121.935 E.35444
G1 X167.543 Y121.935 E.0165
G1 X175.673 Y130.065 E.35444
G1 X175.137 Y130.065 E.0165
G1 X167.008 Y121.935 E.35444
G1 X166.473 Y121.935 E.0165
G1 X174.602 Y130.065 E.35444
G1 X174.067 Y130.065 E.0165
G1 X165.938 Y121.935 E.35444
G1 X165.403 Y121.935 E.0165
M73 P76 R4
G1 X173.532 Y130.065 E.35444
G1 X172.997 Y130.065 E.0165
G1 X164.868 Y121.935 E.35444
G1 X164.333 Y121.935 E.0165
G1 X172.462 Y130.065 E.35444
G1 X171.927 Y130.065 E.0165
G1 X163.798 Y121.935 E.35444
G1 X163.263 Y121.935 E.0165
G1 X171.392 Y130.065 E.35444
G1 X170.857 Y130.065 E.0165
G1 X162.728 Y121.935 E.35444
G1 X162.193 Y121.935 E.0165
G1 X170.322 Y130.065 E.35444
G1 X169.787 Y130.065 E.0165
G1 X161.658 Y121.935 E.35444
G1 X161.123 Y121.935 E.0165
G1 X169.252 Y130.065 E.35444
G1 X168.717 Y130.065 E.0165
G1 X160.587 Y121.935 E.35444
G1 X160.052 Y121.935 E.0165
G1 X168.182 Y130.065 E.35444
G1 X167.647 Y130.065 E.0165
G1 X159.517 Y121.935 E.35444
G1 X158.982 Y121.935 E.0165
G1 X167.112 Y130.065 E.35444
G1 X166.577 Y130.065 E.0165
G1 X158.447 Y121.935 E.35444
G1 X157.912 Y121.935 E.0165
G1 X166.042 Y130.065 E.35444
G1 X165.507 Y130.065 E.0165
G1 X157.377 Y121.935 E.35444
G1 X156.842 Y121.935 E.0165
G1 X164.971 Y130.065 E.35444
G1 X164.436 Y130.065 E.0165
G1 X156.307 Y121.935 E.35444
G1 X155.772 Y121.935 E.0165
G1 X163.901 Y130.065 E.35444
G1 X163.366 Y130.065 E.0165
G1 X155.237 Y121.935 E.35444
G1 X154.702 Y121.935 E.0165
G1 X162.831 Y130.065 E.35444
G1 X162.296 Y130.065 E.0165
G1 X154.167 Y121.935 E.35444
G1 X153.632 Y121.935 E.0165
G1 X161.761 Y130.065 E.35444
G1 X161.226 Y130.065 E.0165
G1 X153.097 Y121.935 E.35444
G1 X152.562 Y121.935 E.0165
G1 X160.691 Y130.065 E.35444
G1 X160.156 Y130.065 E.0165
G1 X152.027 Y121.935 E.35444
G1 X151.492 Y121.935 E.0165
G1 X159.621 Y130.065 E.35444
G1 X159.086 Y130.065 E.0165
G1 X150.957 Y121.935 E.35444
G1 X150.421 Y121.935 E.0165
G1 X158.551 Y130.065 E.35444
G1 X158.016 Y130.065 E.0165
G1 X149.886 Y121.935 E.35444
G1 X149.351 Y121.935 E.0165
G1 X157.481 Y130.065 E.35444
G1 X156.946 Y130.065 E.0165
G1 X148.816 Y121.935 E.35444
G1 X148.281 Y121.935 E.0165
G1 X156.411 Y130.065 E.35444
G1 X155.876 Y130.065 E.0165
G1 X147.746 Y121.935 E.35444
G1 X147.211 Y121.935 E.0165
G1 X155.34 Y130.065 E.35444
G1 X154.805 Y130.065 E.0165
G1 X146.676 Y121.935 E.35444
G1 X146.141 Y121.935 E.0165
G1 X154.27 Y130.065 E.35444
G1 X153.735 Y130.065 E.0165
G1 X145.606 Y121.935 E.35444
G1 X145.071 Y121.935 E.0165
G1 X153.2 Y130.065 E.35444
G1 X152.665 Y130.065 E.0165
G1 X144.536 Y121.935 E.35444
G1 X144.001 Y121.935 E.0165
G1 X152.13 Y130.065 E.35444
G1 X151.595 Y130.065 E.0165
G1 X143.466 Y121.935 E.35444
G1 X142.931 Y121.935 E.0165
G1 X151.06 Y130.065 E.35444
G1 X150.525 Y130.065 E.0165
G1 X142.396 Y121.935 E.35444
G1 X141.861 Y121.935 E.0165
G1 X149.99 Y130.065 E.35444
G1 X149.455 Y130.065 E.0165
G1 X141.326 Y121.935 E.35444
G1 X140.79 Y121.935 E.0165
G1 X148.92 Y130.065 E.35444
G1 X148.385 Y130.065 E.0165
G1 X140.255 Y121.935 E.35444
G1 X139.72 Y121.935 E.0165
G1 X147.85 Y130.065 E.35444
G1 X147.315 Y130.065 E.0165
G1 X139.185 Y121.935 E.35444
G1 X138.65 Y121.935 E.0165
G1 X146.78 Y130.065 E.35444
G1 X146.245 Y130.065 E.0165
G1 X138.115 Y121.935 E.35444
G1 X137.58 Y121.935 E.0165
G1 X145.71 Y130.065 E.35444
G1 X145.174 Y130.065 E.0165
G1 X137.045 Y121.935 E.35444
G1 X136.51 Y121.935 E.0165
G1 X144.639 Y130.065 E.35444
G1 X144.104 Y130.065 E.0165
G1 X135.975 Y121.935 E.35444
G1 X135.44 Y121.935 E.0165
G1 X143.569 Y130.065 E.35444
G1 X143.034 Y130.065 E.0165
G1 X134.905 Y121.935 E.35444
G1 X134.37 Y121.935 E.0165
G1 X142.499 Y130.065 E.35444
G1 X141.964 Y130.065 E.0165
G1 X133.835 Y121.935 E.35444
G1 X133.3 Y121.935 E.0165
G1 X141.429 Y130.065 E.35444
G1 X140.894 Y130.065 E.0165
G1 X132.765 Y121.935 E.35444
G1 X132.23 Y121.935 E.0165
G1 X140.359 Y130.065 E.35444
G1 X139.824 Y130.065 E.0165
G1 X131.695 Y121.935 E.35444
G1 X131.16 Y121.935 E.0165
G1 X139.289 Y130.065 E.35444
G1 X138.754 Y130.065 E.0165
G1 X130.624 Y121.935 E.35444
G1 X130.089 Y121.935 E.0165
G1 X138.219 Y130.065 E.35444
G1 X137.684 Y130.065 E.0165
G1 X129.554 Y121.935 E.35444
G1 X129.019 Y121.935 E.0165
G1 X137.149 Y130.065 E.35444
G1 X136.614 Y130.065 E.0165
G1 X128.484 Y121.935 E.35444
G1 X127.949 Y121.935 E.0165
G1 X136.079 Y130.065 E.35444
G1 X135.544 Y130.065 E.0165
G1 X127.414 Y121.935 E.35444
G1 X126.879 Y121.935 E.0165
G1 X135.008 Y130.065 E.35444
G1 X134.473 Y130.065 E.0165
G1 X126.344 Y121.935 E.35444
G1 X125.809 Y121.935 E.0165
G1 X133.938 Y130.065 E.35444
G1 X133.403 Y130.065 E.0165
G1 X125.274 Y121.935 E.35444
G1 X124.739 Y121.935 E.0165
G1 X132.868 Y130.065 E.35444
G1 X132.333 Y130.065 E.0165
G1 X124.204 Y121.935 E.35444
G1 X123.669 Y121.935 E.0165
G1 X131.798 Y130.065 E.35444
G1 X131.263 Y130.065 E.0165
G1 X123.134 Y121.935 E.35444
G1 X122.599 Y121.935 E.0165
G1 X130.728 Y130.065 E.35444
G1 X130.193 Y130.065 E.0165
G1 X122.064 Y121.935 E.35444
G1 X121.529 Y121.935 E.0165
G1 X129.658 Y130.065 E.35444
M73 P77 R4
G1 X129.123 Y130.065 E.0165
G1 X120.994 Y121.935 E.35444
G1 X120.458 Y121.935 E.0165
G1 X128.588 Y130.065 E.35444
G1 X128.053 Y130.065 E.0165
G1 X119.923 Y121.935 E.35444
G1 X119.388 Y121.935 E.0165
G1 X127.518 Y130.065 E.35444
G1 X126.983 Y130.065 E.0165
G1 X118.853 Y121.935 E.35444
G1 X118.318 Y121.935 E.0165
G1 X126.448 Y130.065 E.35444
G1 X125.913 Y130.065 E.0165
G1 X117.783 Y121.935 E.35444
G1 X117.248 Y121.935 E.0165
G1 X125.377 Y130.065 E.35444
G1 X124.842 Y130.065 E.0165
G1 X116.713 Y121.935 E.35444
G1 X116.178 Y121.935 E.0165
G1 X124.307 Y130.065 E.35444
G1 X123.772 Y130.065 E.0165
G1 X115.643 Y121.935 E.35444
G1 X115.108 Y121.935 E.0165
G1 X123.237 Y130.065 E.35444
G1 X122.702 Y130.065 E.0165
G1 X114.573 Y121.935 E.35444
G1 X114.038 Y121.935 E.0165
G1 X122.167 Y130.065 E.35444
G1 X121.632 Y130.065 E.0165
G1 X113.503 Y121.935 E.35444
G1 X112.968 Y121.935 E.0165
G1 X121.097 Y130.065 E.35444
G1 X120.562 Y130.065 E.0165
G1 X112.433 Y121.935 E.35444
G1 X111.898 Y121.935 E.0165
G1 X120.027 Y130.065 E.35444
G1 X119.492 Y130.065 E.0165
G1 X111.363 Y121.935 E.35444
G1 X110.827 Y121.935 E.0165
G1 X118.957 Y130.065 E.35444
G1 X118.422 Y130.065 E.0165
G1 X110.292 Y121.935 E.35444
G1 X109.757 Y121.935 E.0165
G1 X117.887 Y130.065 E.35444
G1 X117.352 Y130.065 E.0165
G1 X109.222 Y121.935 E.35444
G1 X108.687 Y121.935 E.0165
G1 X116.817 Y130.065 E.35444
G1 X116.282 Y130.065 E.0165
G1 X108.152 Y121.935 E.35444
G1 X107.617 Y121.935 E.0165
G1 X115.747 Y130.065 E.35444
G1 X115.211 Y130.065 E.0165
G1 X107.082 Y121.935 E.35444
G1 X106.547 Y121.935 E.0165
G1 X114.676 Y130.065 E.35444
G1 X114.141 Y130.065 E.0165
G1 X106.012 Y121.935 E.35444
G1 X105.477 Y121.935 E.0165
G1 X113.606 Y130.065 E.35444
G1 X113.071 Y130.065 E.0165
G1 X104.942 Y121.935 E.35444
G1 X104.407 Y121.935 E.0165
G1 X112.536 Y130.065 E.35444
G1 X112.001 Y130.065 E.0165
G1 X103.872 Y121.935 E.35444
G1 X103.337 Y121.935 E.0165
G1 X111.466 Y130.065 E.35444
G1 X110.931 Y130.065 E.0165
G1 X102.802 Y121.935 E.35444
G1 X102.267 Y121.935 E.0165
G1 X110.396 Y130.065 E.35444
G1 X109.861 Y130.065 E.0165
G1 X101.732 Y121.935 E.35444
G1 X101.197 Y121.935 E.0165
G1 X109.326 Y130.065 E.35444
G1 X108.791 Y130.065 E.0165
G1 X100.661 Y121.935 E.35444
G1 X100.126 Y121.935 E.0165
G1 X108.256 Y130.065 E.35444
G1 X107.721 Y130.065 E.0165
G1 X99.591 Y121.935 E.35444
G1 X99.056 Y121.935 E.0165
G1 X107.186 Y130.065 E.35444
G1 X106.651 Y130.065 E.0165
G1 X98.521 Y121.935 E.35444
G1 X97.986 Y121.935 E.0165
G1 X106.116 Y130.065 E.35444
G1 X105.581 Y130.065 E.0165
G1 X97.451 Y121.935 E.35444
G1 X96.916 Y121.935 E.0165
G1 X105.045 Y130.065 E.35444
G1 X104.51 Y130.065 E.0165
G1 X96.381 Y121.935 E.35444
G1 X95.846 Y121.935 E.0165
G1 X103.975 Y130.065 E.35444
G1 X103.44 Y130.065 E.0165
G1 X95.311 Y121.935 E.35444
G1 X94.776 Y121.935 E.0165
G1 X102.905 Y130.065 E.35444
G1 X102.37 Y130.065 E.0165
G1 X94.241 Y121.935 E.35444
G1 X93.706 Y121.935 E.0165
G1 X101.835 Y130.065 E.35444
G1 X101.3 Y130.065 E.0165
G1 X93.171 Y121.935 E.35444
G1 X92.636 Y121.935 E.0165
G1 X100.765 Y130.065 E.35444
G1 X100.23 Y130.065 E.0165
G1 X92.101 Y121.935 E.35444
G1 X91.566 Y121.935 E.0165
G1 X99.695 Y130.065 E.35444
G1 X99.16 Y130.065 E.0165
G1 X91.031 Y121.935 E.35444
M73 P77 R3
G1 X90.495 Y121.935 E.0165
G1 X98.625 Y130.065 E.35444
G1 X98.09 Y130.065 E.0165
G1 X89.96 Y121.935 E.35444
G1 X89.425 Y121.935 E.0165
G1 X97.555 Y130.065 E.35444
G1 X97.02 Y130.065 E.0165
G1 X88.89 Y121.935 E.35444
G1 X88.355 Y121.935 E.0165
G1 X96.485 Y130.065 E.35444
G1 X95.95 Y130.065 E.0165
G1 X87.82 Y121.935 E.35444
G1 X87.285 Y121.935 E.0165
G1 X95.414 Y130.065 E.35444
G1 X94.879 Y130.065 E.0165
G1 X86.75 Y121.935 E.35444
G1 X86.215 Y121.935 E.0165
G1 X94.344 Y130.065 E.35444
G1 X93.809 Y130.065 E.0165
G1 X85.68 Y121.935 E.35444
G1 X85.145 Y121.935 E.0165
G1 X93.274 Y130.065 E.35444
G1 X92.739 Y130.065 E.0165
G1 X84.61 Y121.935 E.35444
G1 X84.075 Y121.935 E.0165
G1 X92.204 Y130.065 E.35444
G1 X91.669 Y130.065 E.0165
G1 X83.54 Y121.935 E.35444
G1 X83.005 Y121.935 E.0165
G1 X91.134 Y130.065 E.35444
G1 X90.599 Y130.065 E.0165
G1 X82.47 Y121.935 E.35444
G1 X81.935 Y121.935 E.0165
G1 X90.064 Y130.065 E.35444
G1 X89.529 Y130.065 E.0165
G1 X81.4 Y121.935 E.35444
G1 X80.864 Y121.935 E.0165
G1 X88.994 Y130.065 E.35444
G1 X88.459 Y130.065 E.0165
G1 X80.329 Y121.935 E.35444
G1 X79.794 Y121.935 E.0165
G1 X87.924 Y130.065 E.35444
G1 X87.389 Y130.065 E.0165
G1 X79.259 Y121.935 E.35444
G1 X78.935 Y121.935 E.00999
G1 X78.935 Y122.146 E.00651
G1 X86.854 Y130.065 E.34524
G1 X86.319 Y130.065 E.0165
G1 X78.935 Y122.681 E.32191
G1 X78.935 Y123.216 E.0165
G1 X85.784 Y130.065 E.29858
G1 X85.248 Y130.065 E.0165
M73 P78 R3
G1 X78.935 Y123.752 E.27525
G1 X78.935 Y124.287 E.0165
G1 X84.713 Y130.065 E.25193
G1 X84.178 Y130.065 E.0165
G1 X78.935 Y124.822 E.2286
G1 X78.935 Y125.357 E.0165
G1 X83.643 Y130.065 E.20527
G1 X83.108 Y130.065 E.0165
G1 X78.935 Y125.892 E.18194
G1 X78.935 Y126.427 E.0165
G1 X82.573 Y130.065 E.15861
G1 X82.038 Y130.065 E.0165
G1 X78.935 Y126.962 E.13528
G1 X78.935 Y127.497 E.0165
G1 X81.503 Y130.065 E.11196
G1 X80.968 Y130.065 E.0165
G1 X78.935 Y128.032 E.08863
G1 X78.935 Y128.567 E.0165
G1 X80.433 Y130.065 E.0653
G1 X79.898 Y130.065 E.0165
G1 X78.935 Y129.102 E.04197
G1 X78.935 Y129.637 E.0165
G1 X79.533 Y130.234 E.02604
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X78.935 Y129.637 E-.32096
G1 X78.935 Y129.102 E-.20332
G1 X79.374 Y129.541 E-.23572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 113
M625
; layer num/total_layer_count: 8/10
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.8 I1.217 J0 P1  F15000
; object ids of layer 8 start: 113,149
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
; object ids of this layer8 end: 113,149
M625
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X178.529 Y160.433
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X79.734 Y160.433 E3.27724
G1 X79.734 Y151.637 E.29178
G1 X178.529 Y151.637 E3.27724
G1 X178.529 Y160.373 E.28979
M204 S250
G1 X178.921 Y160.825 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X79.341 Y160.825 E3.05982
G1 X79.341 Y151.245 E.29437
G1 X178.921 Y151.245 E3.05982
G1 X178.921 Y160.765 E.29252
; WIPE_START
M204 S5000
G1 X176.921 Y160.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.601 Y160.269 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42126
G1 F7500
G1 X178.196 Y159.674 E.02595
G1 X178.196 Y159.139 E.0165
G1 X177.236 Y160.099 E.04188
G1 X176.7 Y160.099 E.0165
G1 X178.196 Y158.604 E.06521
G1 X178.196 Y158.069 E.0165
G1 X176.165 Y160.099 E.08854
G1 X175.63 Y160.099 E.0165
G1 X178.196 Y157.534 E.11187
G1 X178.196 Y156.999 E.0165
G1 X175.095 Y160.099 E.1352
G1 X174.56 Y160.099 E.0165
G1 X178.196 Y156.464 E.15853
G1 X178.196 Y155.928 E.0165
G1 X174.025 Y160.099 E.18185
G1 X173.49 Y160.099 E.0165
G1 X178.196 Y155.393 E.20518
G1 X178.196 Y154.858 E.0165
G1 X172.955 Y160.099 E.22851
G1 X172.42 Y160.099 E.0165
G1 X178.196 Y154.323 E.25184
G1 X178.196 Y153.788 E.0165
G1 X171.885 Y160.099 E.27517
G1 X171.35 Y160.099 E.0165
G1 X178.196 Y153.253 E.2985
G1 X178.196 Y152.718 E.0165
G1 X170.815 Y160.099 E.32182
G1 X170.28 Y160.099 E.0165
G1 X178.196 Y152.183 E.34515
G1 X178.196 Y151.97 E.00657
G1 X177.874 Y151.97 E.00993
G1 X169.745 Y160.099 E.35444
G1 X169.21 Y160.099 E.0165
G1 X177.339 Y151.97 E.35444
G1 X176.804 Y151.97 E.0165
G1 X168.675 Y160.099 E.35444
G1 X168.14 Y160.099 E.0165
G1 X176.269 Y151.97 E.35444
G1 X175.734 Y151.97 E.0165
G1 X167.605 Y160.099 E.35444
G1 X167.07 Y160.099 E.0165
G1 X175.199 Y151.97 E.35444
G1 X174.664 Y151.97 E.0165
G1 X166.534 Y160.099 E.35444
G1 X165.999 Y160.099 E.0165
G1 X174.129 Y151.97 E.35444
G1 X173.594 Y151.97 E.0165
G1 X165.464 Y160.099 E.35444
G1 X164.929 Y160.099 E.0165
G1 X173.059 Y151.97 E.35444
G1 X172.524 Y151.97 E.0165
G1 X164.394 Y160.099 E.35444
G1 X163.859 Y160.099 E.0165
G1 X171.989 Y151.97 E.35444
G1 X171.453 Y151.97 E.0165
G1 X163.324 Y160.099 E.35444
G1 X162.789 Y160.099 E.0165
G1 X170.918 Y151.97 E.35444
G1 X170.383 Y151.97 E.0165
G1 X162.254 Y160.099 E.35444
G1 X161.719 Y160.099 E.0165
G1 X169.848 Y151.97 E.35444
G1 X169.313 Y151.97 E.0165
G1 X161.184 Y160.099 E.35444
G1 X160.649 Y160.099 E.0165
G1 X168.778 Y151.97 E.35444
G1 X168.243 Y151.97 E.0165
G1 X160.114 Y160.099 E.35444
G1 X159.579 Y160.099 E.0165
G1 X167.708 Y151.97 E.35444
G1 X167.173 Y151.97 E.0165
G1 X159.044 Y160.099 E.35444
G1 X158.509 Y160.099 E.0165
G1 X166.638 Y151.97 E.35444
G1 X166.103 Y151.97 E.0165
G1 X157.974 Y160.099 E.35444
G1 X157.439 Y160.099 E.0165
G1 X165.568 Y151.97 E.35444
G1 X165.033 Y151.97 E.0165
G1 X156.903 Y160.099 E.35444
G1 X156.368 Y160.099 E.0165
G1 X164.498 Y151.97 E.35444
G1 X163.963 Y151.97 E.0165
G1 X155.833 Y160.099 E.35444
G1 X155.298 Y160.099 E.0165
G1 X163.428 Y151.97 E.35444
G1 X162.893 Y151.97 E.0165
G1 X154.763 Y160.099 E.35444
G1 X154.228 Y160.099 E.0165
G1 X162.358 Y151.97 E.35444
G1 X161.823 Y151.97 E.0165
G1 X153.693 Y160.099 E.35444
M73 P79 R3
G1 X153.158 Y160.099 E.0165
G1 X161.287 Y151.97 E.35444
G1 X160.752 Y151.97 E.0165
G1 X152.623 Y160.099 E.35444
G1 X152.088 Y160.099 E.0165
G1 X160.217 Y151.97 E.35444
G1 X159.682 Y151.97 E.0165
G1 X151.553 Y160.099 E.35444
G1 X151.018 Y160.099 E.0165
G1 X159.147 Y151.97 E.35444
G1 X158.612 Y151.97 E.0165
G1 X150.483 Y160.099 E.35444
G1 X149.948 Y160.099 E.0165
G1 X158.077 Y151.97 E.35444
G1 X157.542 Y151.97 E.0165
G1 X149.413 Y160.099 E.35444
G1 X148.878 Y160.099 E.0165
G1 X157.007 Y151.97 E.35444
G1 X156.472 Y151.97 E.0165
G1 X148.343 Y160.099 E.35444
G1 X147.808 Y160.099 E.0165
G1 X155.937 Y151.97 E.35444
G1 X155.402 Y151.97 E.0165
G1 X147.273 Y160.099 E.35444
G1 X146.737 Y160.099 E.0165
G1 X154.867 Y151.97 E.35444
G1 X154.332 Y151.97 E.0165
G1 X146.202 Y160.099 E.35444
G1 X145.667 Y160.099 E.0165
G1 X153.797 Y151.97 E.35444
G1 X153.262 Y151.97 E.0165
G1 X145.132 Y160.099 E.35444
G1 X144.597 Y160.099 E.0165
G1 X152.727 Y151.97 E.35444
G1 X152.192 Y151.97 E.0165
G1 X144.062 Y160.099 E.35444
G1 X143.527 Y160.099 E.0165
G1 X151.657 Y151.97 E.35444
G1 X151.121 Y151.97 E.0165
G1 X142.992 Y160.099 E.35444
G1 X142.457 Y160.099 E.0165
G1 X150.586 Y151.97 E.35444
G1 X150.051 Y151.97 E.0165
G1 X141.922 Y160.099 E.35444
G1 X141.387 Y160.099 E.0165
G1 X149.516 Y151.97 E.35444
G1 X148.981 Y151.97 E.0165
G1 X140.852 Y160.099 E.35444
G1 X140.317 Y160.099 E.0165
G1 X148.446 Y151.97 E.35444
G1 X147.911 Y151.97 E.0165
G1 X139.782 Y160.099 E.35444
G1 X139.247 Y160.099 E.0165
G1 X147.376 Y151.97 E.35444
G1 X146.841 Y151.97 E.0165
G1 X138.712 Y160.099 E.35444
G1 X138.177 Y160.099 E.0165
G1 X146.306 Y151.97 E.35444
G1 X145.771 Y151.97 E.0165
G1 X137.642 Y160.099 E.35444
G1 X137.106 Y160.099 E.0165
G1 X145.236 Y151.97 E.35444
G1 X144.701 Y151.97 E.0165
G1 X136.571 Y160.099 E.35444
G1 X136.036 Y160.099 E.0165
G1 X144.166 Y151.97 E.35444
G1 X143.631 Y151.97 E.0165
G1 X135.501 Y160.099 E.35444
G1 X134.966 Y160.099 E.0165
G1 X143.096 Y151.97 E.35444
G1 X142.561 Y151.97 E.0165
G1 X134.431 Y160.099 E.35444
G1 X133.896 Y160.099 E.0165
G1 X142.026 Y151.97 E.35444
G1 X141.49 Y151.97 E.0165
G1 X133.361 Y160.099 E.35444
G1 X132.826 Y160.099 E.0165
G1 X140.955 Y151.97 E.35444
G1 X140.42 Y151.97 E.0165
G1 X132.291 Y160.099 E.35444
G1 X131.756 Y160.099 E.0165
G1 X139.885 Y151.97 E.35444
G1 X139.35 Y151.97 E.0165
G1 X131.221 Y160.099 E.35444
G1 X130.686 Y160.099 E.0165
G1 X138.815 Y151.97 E.35444
G1 X138.28 Y151.97 E.0165
G1 X130.151 Y160.099 E.35444
G1 X129.616 Y160.099 E.0165
G1 X137.745 Y151.97 E.35444
G1 X137.21 Y151.97 E.0165
G1 X129.081 Y160.099 E.35444
G1 X128.546 Y160.099 E.0165
G1 X136.675 Y151.97 E.35444
G1 X136.14 Y151.97 E.0165
G1 X128.011 Y160.099 E.35444
G1 X127.476 Y160.099 E.0165
G1 X135.605 Y151.97 E.35444
G1 X135.07 Y151.97 E.0165
G1 X126.94 Y160.099 E.35444
G1 X126.405 Y160.099 E.0165
G1 X134.535 Y151.97 E.35444
G1 X134 Y151.97 E.0165
G1 X125.87 Y160.099 E.35444
G1 X125.335 Y160.099 E.0165
G1 X133.465 Y151.97 E.35444
G1 X132.93 Y151.97 E.0165
G1 X124.8 Y160.099 E.35444
G1 X124.265 Y160.099 E.0165
G1 X132.395 Y151.97 E.35444
G1 X131.86 Y151.97 E.0165
G1 X123.73 Y160.099 E.35444
G1 X123.195 Y160.099 E.0165
G1 X131.324 Y151.97 E.35444
G1 X130.789 Y151.97 E.0165
G1 X122.66 Y160.099 E.35444
G1 X122.125 Y160.099 E.0165
G1 X130.254 Y151.97 E.35444
G1 X129.719 Y151.97 E.0165
G1 X121.59 Y160.099 E.35444
G1 X121.055 Y160.099 E.0165
G1 X129.184 Y151.97 E.35444
G1 X128.649 Y151.97 E.0165
G1 X120.52 Y160.099 E.35444
G1 X119.985 Y160.099 E.0165
G1 X128.114 Y151.97 E.35444
G1 X127.579 Y151.97 E.0165
G1 X119.45 Y160.099 E.35444
G1 X118.915 Y160.099 E.0165
G1 X127.044 Y151.97 E.35444
G1 X126.509 Y151.97 E.0165
G1 X118.38 Y160.099 E.35444
G1 X117.845 Y160.099 E.0165
G1 X125.974 Y151.97 E.35444
G1 X125.439 Y151.97 E.0165
G1 X117.31 Y160.099 E.35444
G1 X116.774 Y160.099 E.0165
G1 X124.904 Y151.97 E.35444
G1 X124.369 Y151.97 E.0165
G1 X116.239 Y160.099 E.35444
G1 X115.704 Y160.099 E.0165
G1 X123.834 Y151.97 E.35444
G1 X123.299 Y151.97 E.0165
G1 X115.169 Y160.099 E.35444
G1 X114.634 Y160.099 E.0165
G1 X122.764 Y151.97 E.35444
G1 X122.229 Y151.97 E.0165
G1 X114.099 Y160.099 E.35444
G1 X113.564 Y160.099 E.0165
G1 X121.694 Y151.97 E.35444
G1 X121.158 Y151.97 E.0165
G1 X113.029 Y160.099 E.35444
G1 X112.494 Y160.099 E.0165
G1 X120.623 Y151.97 E.35444
G1 X120.088 Y151.97 E.0165
G1 X111.959 Y160.099 E.35444
G1 X111.424 Y160.099 E.0165
G1 X119.553 Y151.97 E.35444
G1 X119.018 Y151.97 E.0165
G1 X110.889 Y160.099 E.35444
G1 X110.354 Y160.099 E.0165
G1 X118.483 Y151.97 E.35444
G1 X117.948 Y151.97 E.0165
G1 X109.819 Y160.099 E.35444
G1 X109.284 Y160.099 E.0165
G1 X117.413 Y151.97 E.35444
M73 P80 R3
G1 X116.878 Y151.97 E.0165
G1 X108.749 Y160.099 E.35444
G1 X108.214 Y160.099 E.0165
G1 X116.343 Y151.97 E.35444
G1 X115.808 Y151.97 E.0165
G1 X107.679 Y160.099 E.35444
G1 X107.143 Y160.099 E.0165
G1 X115.273 Y151.97 E.35444
G1 X114.738 Y151.97 E.0165
G1 X106.608 Y160.099 E.35444
G1 X106.073 Y160.099 E.0165
G1 X114.203 Y151.97 E.35444
G1 X113.668 Y151.97 E.0165
G1 X105.538 Y160.099 E.35444
G1 X105.003 Y160.099 E.0165
G1 X113.133 Y151.97 E.35444
G1 X112.598 Y151.97 E.0165
G1 X104.468 Y160.099 E.35444
G1 X103.933 Y160.099 E.0165
G1 X112.063 Y151.97 E.35444
G1 X111.527 Y151.97 E.0165
G1 X103.398 Y160.099 E.35444
G1 X102.863 Y160.099 E.0165
G1 X110.992 Y151.97 E.35444
G1 X110.457 Y151.97 E.0165
G1 X102.328 Y160.099 E.35444
G1 X101.793 Y160.099 E.0165
G1 X109.922 Y151.97 E.35444
G1 X109.387 Y151.97 E.0165
G1 X101.258 Y160.099 E.35444
G1 X100.723 Y160.099 E.0165
G1 X108.852 Y151.97 E.35444
G1 X108.317 Y151.97 E.0165
G1 X100.188 Y160.099 E.35444
G1 X99.653 Y160.099 E.0165
G1 X107.782 Y151.97 E.35444
G1 X107.247 Y151.97 E.0165
G1 X99.118 Y160.099 E.35444
G1 X98.583 Y160.099 E.0165
G1 X106.712 Y151.97 E.35444
G1 X106.177 Y151.97 E.0165
G1 X98.048 Y160.099 E.35444
G1 X97.513 Y160.099 E.0165
G1 X105.642 Y151.97 E.35444
G1 X105.107 Y151.97 E.0165
G1 X96.977 Y160.099 E.35444
G1 X96.442 Y160.099 E.0165
G1 X104.572 Y151.97 E.35444
G1 X104.037 Y151.97 E.0165
G1 X95.907 Y160.099 E.35444
G1 X95.372 Y160.099 E.0165
G1 X103.502 Y151.97 E.35444
G1 X102.967 Y151.97 E.0165
G1 X94.837 Y160.099 E.35444
G1 X94.302 Y160.099 E.0165
G1 X102.432 Y151.97 E.35444
G1 X101.897 Y151.97 E.0165
G1 X93.767 Y160.099 E.35444
G1 X93.232 Y160.099 E.0165
G1 X101.361 Y151.97 E.35444
G1 X100.826 Y151.97 E.0165
G1 X92.697 Y160.099 E.35444
G1 X92.162 Y160.099 E.0165
G1 X100.291 Y151.97 E.35444
G1 X99.756 Y151.97 E.0165
G1 X91.627 Y160.099 E.35444
G1 X91.092 Y160.099 E.0165
G1 X99.221 Y151.97 E.35444
G1 X98.686 Y151.97 E.0165
G1 X90.557 Y160.099 E.35444
G1 X90.022 Y160.099 E.0165
G1 X98.151 Y151.97 E.35444
G1 X97.616 Y151.97 E.0165
G1 X89.487 Y160.099 E.35444
G1 X88.952 Y160.099 E.0165
G1 X97.081 Y151.97 E.35444
G1 X96.546 Y151.97 E.0165
G1 X88.417 Y160.099 E.35444
G1 X87.882 Y160.099 E.0165
G1 X96.011 Y151.97 E.35444
G1 X95.476 Y151.97 E.0165
G1 X87.347 Y160.099 E.35444
G1 X86.811 Y160.099 E.0165
G1 X94.941 Y151.97 E.35444
G1 X94.406 Y151.97 E.0165
G1 X86.276 Y160.099 E.35444
G1 X85.741 Y160.099 E.0165
G1 X93.871 Y151.97 E.35444
G1 X93.336 Y151.97 E.0165
G1 X85.206 Y160.099 E.35444
G1 X84.671 Y160.099 E.0165
G1 X92.801 Y151.97 E.35444
G1 X92.266 Y151.97 E.0165
G1 X84.136 Y160.099 E.35444
G1 X83.601 Y160.099 E.0165
G1 X91.731 Y151.97 E.35444
G1 X91.195 Y151.97 E.0165
G1 X83.066 Y160.099 E.35444
G1 X82.531 Y160.099 E.0165
G1 X90.66 Y151.97 E.35444
G1 X90.125 Y151.97 E.0165
G1 X81.996 Y160.099 E.35444
G1 X81.461 Y160.099 E.0165
G1 X89.59 Y151.97 E.35444
G1 X89.055 Y151.97 E.0165
G1 X80.926 Y160.099 E.35444
G1 X80.391 Y160.099 E.0165
G1 X88.52 Y151.97 E.35444
G1 X87.985 Y151.97 E.0165
G1 X80.067 Y159.888 E.34524
G1 X80.067 Y159.353 E.0165
G1 X87.45 Y151.97 E.32191
G1 X86.915 Y151.97 E.0165
G1 X80.067 Y158.818 E.29858
G1 X80.067 Y158.283 E.0165
G1 X86.38 Y151.97 E.27525
G1 X85.845 Y151.97 E.0165
G1 X80.067 Y157.748 E.25193
G1 X80.067 Y157.213 E.0165
G1 X85.31 Y151.97 E.2286
G1 X84.775 Y151.97 E.0165
G1 X80.067 Y156.678 E.20527
G1 X80.067 Y156.143 E.0165
G1 X84.24 Y151.97 E.18194
G1 X83.705 Y151.97 E.0165
G1 X80.067 Y155.608 E.15861
G1 X80.067 Y155.073 E.0165
G1 X83.17 Y151.97 E.13528
G1 X82.635 Y151.97 E.0165
G1 X80.067 Y154.538 E.11196
G1 X80.067 Y154.003 E.0165
G1 X82.1 Y151.97 E.08863
G1 X81.564 Y151.97 E.0165
G1 X80.067 Y153.468 E.0653
G1 X80.067 Y152.933 E.0165
G1 X81.029 Y151.97 E.04197
G1 X80.494 Y151.97 E.0165
G1 X79.897 Y152.567 E.02604
; OBJECT_ID: 113
; WIPE_START
G1 X80.494 Y151.97 E-.32096
G1 X81.029 Y151.97 E-.20332
G1 X80.591 Y152.409 E-.23572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 113
M624 AQAAAAAAAAA=
G1 X88.033 Y150.717 Z2 F15000
G1 X177.398 Y130.398 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X78.602 Y130.398 E3.27724
G1 X78.602 Y121.602 E.29178
G1 X177.398 Y121.602 E3.27724
G1 X177.398 Y130.338 E.28979
M204 S250
G1 X177.79 Y130.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X78.21 Y130.79 E3.05982
G1 X78.21 Y121.21 E.29437
G1 X177.79 Y121.21 E3.05982
G1 X177.79 Y130.73 E.29252
; WIPE_START
M204 S5000
G1 X175.79 Y130.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.469 Y130.234 Z2 F15000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42126
G1 F7500
G1 X177.065 Y129.639 E.02595
G1 X177.065 Y129.104 E.0165
G1 X176.104 Y130.065 E.04188
M73 P81 R3
G1 X175.569 Y130.065 E.0165
G1 X177.065 Y128.569 E.06521
G1 X177.065 Y128.034 E.0165
G1 X175.034 Y130.065 E.08854
G1 X174.499 Y130.065 E.0165
G1 X177.065 Y127.499 E.11187
G1 X177.065 Y126.964 E.0165
G1 X173.964 Y130.065 E.1352
G1 X173.429 Y130.065 E.0165
G1 X177.065 Y126.429 E.15853
G1 X177.065 Y125.894 E.0165
G1 X172.894 Y130.065 E.18185
G1 X172.359 Y130.065 E.0165
G1 X177.065 Y125.359 E.20518
G1 X177.065 Y124.824 E.0165
G1 X171.824 Y130.065 E.22851
G1 X171.289 Y130.065 E.0165
G1 X177.065 Y124.289 E.25184
G1 X177.065 Y123.753 E.0165
G1 X170.753 Y130.065 E.27517
G1 X170.218 Y130.065 E.0165
G1 X177.065 Y123.218 E.2985
G1 X177.065 Y122.683 E.0165
G1 X169.683 Y130.065 E.32182
G1 X169.148 Y130.065 E.0165
G1 X177.065 Y122.148 E.34515
G1 X177.065 Y121.935 E.00657
G1 X176.743 Y121.935 E.00993
G1 X168.613 Y130.065 E.35444
G1 X168.078 Y130.065 E.0165
G1 X176.208 Y121.935 E.35444
G1 X175.673 Y121.935 E.0165
G1 X167.543 Y130.065 E.35444
G1 X167.008 Y130.065 E.0165
G1 X175.137 Y121.935 E.35444
G1 X174.602 Y121.935 E.0165
G1 X166.473 Y130.065 E.35444
G1 X165.938 Y130.065 E.0165
G1 X174.067 Y121.935 E.35444
G1 X173.532 Y121.935 E.0165
G1 X165.403 Y130.065 E.35444
G1 X164.868 Y130.065 E.0165
G1 X172.997 Y121.935 E.35444
G1 X172.462 Y121.935 E.0165
G1 X164.333 Y130.065 E.35444
G1 X163.798 Y130.065 E.0165
G1 X171.927 Y121.935 E.35444
G1 X171.392 Y121.935 E.0165
G1 X163.263 Y130.065 E.35444
G1 X162.728 Y130.065 E.0165
G1 X170.857 Y121.935 E.35444
G1 X170.322 Y121.935 E.0165
G1 X162.193 Y130.065 E.35444
G1 X161.658 Y130.065 E.0165
G1 X169.787 Y121.935 E.35444
G1 X169.252 Y121.935 E.0165
G1 X161.123 Y130.065 E.35444
G1 X160.587 Y130.065 E.0165
G1 X168.717 Y121.935 E.35444
G1 X168.182 Y121.935 E.0165
G1 X160.052 Y130.065 E.35444
G1 X159.517 Y130.065 E.0165
G1 X167.647 Y121.935 E.35444
G1 X167.112 Y121.935 E.0165
G1 X158.982 Y130.065 E.35444
G1 X158.447 Y130.065 E.0165
G1 X166.577 Y121.935 E.35444
G1 X166.042 Y121.935 E.0165
G1 X157.912 Y130.065 E.35444
G1 X157.377 Y130.065 E.0165
G1 X165.507 Y121.935 E.35444
G1 X164.971 Y121.935 E.0165
G1 X156.842 Y130.065 E.35444
G1 X156.307 Y130.065 E.0165
G1 X164.436 Y121.935 E.35444
G1 X163.901 Y121.935 E.0165
G1 X155.772 Y130.065 E.35444
G1 X155.237 Y130.065 E.0165
G1 X163.366 Y121.935 E.35444
G1 X162.831 Y121.935 E.0165
G1 X154.702 Y130.065 E.35444
G1 X154.167 Y130.065 E.0165
G1 X162.296 Y121.935 E.35444
G1 X161.761 Y121.935 E.0165
G1 X153.632 Y130.065 E.35444
G1 X153.097 Y130.065 E.0165
G1 X161.226 Y121.935 E.35444
G1 X160.691 Y121.935 E.0165
G1 X152.562 Y130.065 E.35444
G1 X152.027 Y130.065 E.0165
G1 X160.156 Y121.935 E.35444
G1 X159.621 Y121.935 E.0165
G1 X151.492 Y130.065 E.35444
G1 X150.957 Y130.065 E.0165
G1 X159.086 Y121.935 E.35444
G1 X158.551 Y121.935 E.0165
G1 X150.421 Y130.065 E.35444
G1 X149.886 Y130.065 E.0165
G1 X158.016 Y121.935 E.35444
G1 X157.481 Y121.935 E.0165
G1 X149.351 Y130.065 E.35444
G1 X148.816 Y130.065 E.0165
G1 X156.946 Y121.935 E.35444
G1 X156.411 Y121.935 E.0165
G1 X148.281 Y130.065 E.35444
G1 X147.746 Y130.065 E.0165
G1 X155.876 Y121.935 E.35444
G1 X155.341 Y121.935 E.0165
G1 X147.211 Y130.065 E.35444
G1 X146.676 Y130.065 E.0165
G1 X154.805 Y121.935 E.35444
G1 X154.27 Y121.935 E.0165
G1 X146.141 Y130.065 E.35444
G1 X145.606 Y130.065 E.0165
G1 X153.735 Y121.935 E.35444
G1 X153.2 Y121.935 E.0165
G1 X145.071 Y130.065 E.35444
G1 X144.536 Y130.065 E.0165
G1 X152.665 Y121.935 E.35444
G1 X152.13 Y121.935 E.0165
G1 X144.001 Y130.065 E.35444
G1 X143.466 Y130.065 E.0165
G1 X151.595 Y121.935 E.35444
G1 X151.06 Y121.935 E.0165
G1 X142.931 Y130.065 E.35444
G1 X142.396 Y130.065 E.0165
G1 X150.525 Y121.935 E.35444
G1 X149.99 Y121.935 E.0165
G1 X141.861 Y130.065 E.35444
G1 X141.326 Y130.065 E.0165
G1 X149.455 Y121.935 E.35444
G1 X148.92 Y121.935 E.0165
G1 X140.79 Y130.065 E.35444
G1 X140.255 Y130.065 E.0165
G1 X148.385 Y121.935 E.35444
G1 X147.85 Y121.935 E.0165
G1 X139.72 Y130.065 E.35444
G1 X139.185 Y130.065 E.0165
G1 X147.315 Y121.935 E.35444
M73 P82 R3
G1 X146.78 Y121.935 E.0165
G1 X138.65 Y130.065 E.35444
G1 X138.115 Y130.065 E.0165
G1 X146.245 Y121.935 E.35444
G1 X145.71 Y121.935 E.0165
G1 X137.58 Y130.065 E.35444
G1 X137.045 Y130.065 E.0165
G1 X145.174 Y121.935 E.35444
G1 X144.639 Y121.935 E.0165
G1 X136.51 Y130.065 E.35444
G1 X135.975 Y130.065 E.0165
G1 X144.104 Y121.935 E.35444
G1 X143.569 Y121.935 E.0165
G1 X135.44 Y130.065 E.35444
G1 X134.905 Y130.065 E.0165
G1 X143.034 Y121.935 E.35444
G1 X142.499 Y121.935 E.0165
G1 X134.37 Y130.065 E.35444
G1 X133.835 Y130.065 E.0165
G1 X141.964 Y121.935 E.35444
G1 X141.429 Y121.935 E.0165
G1 X133.3 Y130.065 E.35444
G1 X132.765 Y130.065 E.0165
G1 X140.894 Y121.935 E.35444
G1 X140.359 Y121.935 E.0165
G1 X132.23 Y130.065 E.35444
G1 X131.695 Y130.065 E.0165
G1 X139.824 Y121.935 E.35444
G1 X139.289 Y121.935 E.0165
G1 X131.16 Y130.065 E.35444
G1 X130.624 Y130.065 E.0165
G1 X138.754 Y121.935 E.35444
G1 X138.219 Y121.935 E.0165
G1 X130.089 Y130.065 E.35444
G1 X129.554 Y130.065 E.0165
G1 X137.684 Y121.935 E.35444
G1 X137.149 Y121.935 E.0165
G1 X129.019 Y130.065 E.35444
G1 X128.484 Y130.065 E.0165
G1 X136.614 Y121.935 E.35444
G1 X136.079 Y121.935 E.0165
G1 X127.949 Y130.065 E.35444
G1 X127.414 Y130.065 E.0165
G1 X135.544 Y121.935 E.35444
G1 X135.008 Y121.935 E.0165
G1 X126.879 Y130.065 E.35444
G1 X126.344 Y130.065 E.0165
G1 X134.473 Y121.935 E.35444
G1 X133.938 Y121.935 E.0165
G1 X125.809 Y130.065 E.35444
G1 X125.274 Y130.065 E.0165
G1 X133.403 Y121.935 E.35444
G1 X132.868 Y121.935 E.0165
G1 X124.739 Y130.065 E.35444
G1 X124.204 Y130.065 E.0165
G1 X132.333 Y121.935 E.35444
G1 X131.798 Y121.935 E.0165
G1 X123.669 Y130.065 E.35444
G1 X123.134 Y130.065 E.0165
G1 X131.263 Y121.935 E.35444
G1 X130.728 Y121.935 E.0165
G1 X122.599 Y130.065 E.35444
G1 X122.064 Y130.065 E.0165
G1 X130.193 Y121.935 E.35444
G1 X129.658 Y121.935 E.0165
G1 X121.529 Y130.065 E.35444
G1 X120.994 Y130.065 E.0165
G1 X129.123 Y121.935 E.35444
G1 X128.588 Y121.935 E.0165
G1 X120.458 Y130.065 E.35444
G1 X119.923 Y130.065 E.0165
G1 X128.053 Y121.935 E.35444
G1 X127.518 Y121.935 E.0165
G1 X119.388 Y130.065 E.35444
G1 X118.853 Y130.065 E.0165
G1 X126.983 Y121.935 E.35444
G1 X126.448 Y121.935 E.0165
G1 X118.318 Y130.065 E.35444
G1 X117.783 Y130.065 E.0165
G1 X125.913 Y121.935 E.35444
G1 X125.377 Y121.935 E.0165
G1 X117.248 Y130.065 E.35444
G1 X116.713 Y130.065 E.0165
G1 X124.842 Y121.935 E.35444
G1 X124.307 Y121.935 E.0165
G1 X116.178 Y130.065 E.35444
G1 X115.643 Y130.065 E.0165
G1 X123.772 Y121.935 E.35444
G1 X123.237 Y121.935 E.0165
G1 X115.108 Y130.065 E.35444
G1 X114.573 Y130.065 E.0165
G1 X122.702 Y121.935 E.35444
G1 X122.167 Y121.935 E.0165
G1 X114.038 Y130.065 E.35444
G1 X113.503 Y130.065 E.0165
G1 X121.632 Y121.935 E.35444
G1 X121.097 Y121.935 E.0165
G1 X112.968 Y130.065 E.35444
G1 X112.433 Y130.065 E.0165
G1 X120.562 Y121.935 E.35444
G1 X120.027 Y121.935 E.0165
G1 X111.898 Y130.065 E.35444
G1 X111.363 Y130.065 E.0165
G1 X119.492 Y121.935 E.35444
G1 X118.957 Y121.935 E.0165
G1 X110.827 Y130.065 E.35444
G1 X110.292 Y130.065 E.0165
G1 X118.422 Y121.935 E.35444
G1 X117.887 Y121.935 E.0165
G1 X109.757 Y130.065 E.35444
G1 X109.222 Y130.065 E.0165
G1 X117.352 Y121.935 E.35444
G1 X116.817 Y121.935 E.0165
G1 X108.687 Y130.065 E.35444
G1 X108.152 Y130.065 E.0165
G1 X116.282 Y121.935 E.35444
G1 X115.747 Y121.935 E.0165
G1 X107.617 Y130.065 E.35444
G1 X107.082 Y130.065 E.0165
G1 X115.211 Y121.935 E.35444
G1 X114.676 Y121.935 E.0165
G1 X106.547 Y130.065 E.35444
G1 X106.012 Y130.065 E.0165
G1 X114.141 Y121.935 E.35444
G1 X113.606 Y121.935 E.0165
G1 X105.477 Y130.065 E.35444
G1 X104.942 Y130.065 E.0165
G1 X113.071 Y121.935 E.35444
G1 X112.536 Y121.935 E.0165
G1 X104.407 Y130.065 E.35444
G1 X103.872 Y130.065 E.0165
G1 X112.001 Y121.935 E.35444
G1 X111.466 Y121.935 E.0165
G1 X103.337 Y130.065 E.35444
G1 X102.802 Y130.065 E.0165
G1 X110.931 Y121.935 E.35444
G1 X110.396 Y121.935 E.0165
G1 X102.267 Y130.065 E.35444
G1 X101.732 Y130.065 E.0165
G1 X109.861 Y121.935 E.35444
G1 X109.326 Y121.935 E.0165
G1 X101.197 Y130.065 E.35444
G1 X100.661 Y130.065 E.0165
G1 X108.791 Y121.935 E.35444
G1 X108.256 Y121.935 E.0165
G1 X100.126 Y130.065 E.35444
G1 X99.591 Y130.065 E.0165
G1 X107.721 Y121.935 E.35444
G1 X107.186 Y121.935 E.0165
G1 X99.056 Y130.065 E.35444
G1 X98.521 Y130.065 E.0165
G1 X106.651 Y121.935 E.35444
G1 X106.116 Y121.935 E.0165
G1 X97.986 Y130.065 E.35444
G1 X97.451 Y130.065 E.0165
G1 X105.581 Y121.935 E.35444
G1 X105.045 Y121.935 E.0165
G1 X96.916 Y130.065 E.35444
G1 X96.381 Y130.065 E.0165
G1 X104.51 Y121.935 E.35444
G1 X103.975 Y121.935 E.0165
G1 X95.846 Y130.065 E.35444
G1 X95.311 Y130.065 E.0165
G1 X103.44 Y121.935 E.35444
G1 X102.905 Y121.935 E.0165
G1 X94.776 Y130.065 E.35444
M73 P83 R3
G1 X94.241 Y130.065 E.0165
G1 X102.37 Y121.935 E.35444
G1 X101.835 Y121.935 E.0165
G1 X93.706 Y130.065 E.35444
G1 X93.171 Y130.065 E.0165
G1 X101.3 Y121.935 E.35444
G1 X100.765 Y121.935 E.0165
G1 X92.636 Y130.065 E.35444
G1 X92.101 Y130.065 E.0165
G1 X100.23 Y121.935 E.35444
G1 X99.695 Y121.935 E.0165
G1 X91.566 Y130.065 E.35444
G1 X91.031 Y130.065 E.0165
G1 X99.16 Y121.935 E.35444
G1 X98.625 Y121.935 E.0165
G1 X90.495 Y130.065 E.35444
G1 X89.96 Y130.065 E.0165
G1 X98.09 Y121.935 E.35444
G1 X97.555 Y121.935 E.0165
G1 X89.425 Y130.065 E.35444
G1 X88.89 Y130.065 E.0165
G1 X97.02 Y121.935 E.35444
G1 X96.485 Y121.935 E.0165
G1 X88.355 Y130.065 E.35444
G1 X87.82 Y130.065 E.0165
G1 X95.95 Y121.935 E.35444
G1 X95.414 Y121.935 E.0165
G1 X87.285 Y130.065 E.35444
G1 X86.75 Y130.065 E.0165
G1 X94.879 Y121.935 E.35444
G1 X94.344 Y121.935 E.0165
G1 X86.215 Y130.065 E.35444
G1 X85.68 Y130.065 E.0165
G1 X93.809 Y121.935 E.35444
G1 X93.274 Y121.935 E.0165
G1 X85.145 Y130.065 E.35444
G1 X84.61 Y130.065 E.0165
G1 X92.739 Y121.935 E.35444
G1 X92.204 Y121.935 E.0165
G1 X84.075 Y130.065 E.35444
G1 X83.54 Y130.065 E.0165
G1 X91.669 Y121.935 E.35444
G1 X91.134 Y121.935 E.0165
G1 X83.005 Y130.065 E.35444
G1 X82.47 Y130.065 E.0165
M73 P83 R2
G1 X90.599 Y121.935 E.35444
G1 X90.064 Y121.935 E.0165
G1 X81.935 Y130.065 E.35444
G1 X81.4 Y130.065 E.0165
G1 X89.529 Y121.935 E.35444
G1 X88.994 Y121.935 E.0165
G1 X80.864 Y130.065 E.35444
G1 X80.329 Y130.065 E.0165
G1 X88.459 Y121.935 E.35444
G1 X87.924 Y121.935 E.0165
G1 X79.794 Y130.065 E.35444
G1 X79.259 Y130.065 E.0165
G1 X87.389 Y121.935 E.35444
G1 X86.854 Y121.935 E.0165
G1 X78.935 Y129.854 E.34524
G1 X78.935 Y129.319 E.0165
G1 X86.319 Y121.935 E.32191
G1 X85.784 Y121.935 E.0165
G1 X78.935 Y128.784 E.29858
G1 X78.935 Y128.248 E.0165
G1 X85.248 Y121.935 E.27525
G1 X84.713 Y121.935 E.0165
G1 X78.935 Y127.713 E.25193
G1 X78.935 Y127.178 E.0165
G1 X84.178 Y121.935 E.2286
G1 X83.643 Y121.935 E.0165
G1 X78.935 Y126.643 E.20527
G1 X78.935 Y126.108 E.0165
G1 X83.108 Y121.935 E.18194
G1 X82.573 Y121.935 E.0165
G1 X78.935 Y125.573 E.15861
G1 X78.935 Y125.038 E.0165
G1 X82.038 Y121.935 E.13528
G1 X81.503 Y121.935 E.0165
G1 X78.935 Y124.503 E.11196
G1 X78.935 Y123.968 E.0165
G1 X80.968 Y121.935 E.08863
G1 X80.433 Y121.935 E.0165
G1 X78.935 Y123.433 E.0653
G1 X78.935 Y122.898 E.0165
G1 X79.898 Y121.935 E.04197
G1 X79.363 Y121.935 E.0165
G1 X78.766 Y122.533 E.02604
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X79.363 Y121.935 E-.32096
G1 X79.898 Y121.935 E-.20332
G1 X79.459 Y122.374 E-.23572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 113
M625
; layer num/total_layer_count: 9/10
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F15000
; object ids of layer 9 start: 113,149
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
; object ids of this layer9 end: 113,149
M625
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X178.529 Y160.433
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X79.734 Y160.433 E3.27724
G1 X79.734 Y151.637 E.29178
G1 X178.529 Y151.637 E3.27724
G1 X178.529 Y160.373 E.28979
M204 S250
G1 X178.921 Y160.825 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X79.341 Y160.825 E3.05982
G1 X79.341 Y151.245 E.29437
G1 X178.921 Y151.245 E3.05982
G1 X178.921 Y160.765 E.29252
; WIPE_START
M204 S5000
G1 X176.921 Y160.766 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.245 Y153.249 Z2.2 F15000
G1 X178.366 Y152.565 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42126
G1 F7500
G1 X177.771 Y151.97 E.02595
G1 X177.236 Y151.97 E.0165
G1 X178.196 Y152.931 E.04188
G1 X178.196 Y153.466 E.0165
G1 X176.7 Y151.97 E.06521
G1 X176.165 Y151.97 E.0165
G1 X178.196 Y154.001 E.08854
G1 X178.196 Y154.536 E.0165
G1 X175.63 Y151.97 E.11187
G1 X175.095 Y151.97 E.0165
G1 X178.196 Y155.071 E.1352
G1 X178.196 Y155.606 E.0165
G1 X174.56 Y151.97 E.15853
G1 X174.025 Y151.97 E.0165
G1 X178.196 Y156.141 E.18185
G1 X178.196 Y156.676 E.0165
G1 X173.49 Y151.97 E.20518
G1 X172.955 Y151.97 E.0165
G1 X178.196 Y157.211 E.22851
G1 X178.196 Y157.746 E.0165
G1 X172.42 Y151.97 E.25184
G1 X171.885 Y151.97 E.0165
G1 X178.196 Y158.281 E.27517
G1 X178.196 Y158.816 E.0165
G1 X171.35 Y151.97 E.2985
G1 X170.815 Y151.97 E.0165
G1 X178.196 Y159.351 E.32182
G1 X178.196 Y159.886 E.0165
G1 X170.28 Y151.97 E.34515
G1 X169.745 Y151.97 E.0165
G1 X177.874 Y160.099 E.35444
G1 X177.339 Y160.099 E.0165
G1 X169.21 Y151.97 E.35444
G1 X168.675 Y151.97 E.0165
G1 X176.804 Y160.099 E.35444
G1 X176.269 Y160.099 E.0165
G1 X168.14 Y151.97 E.35444
G1 X167.605 Y151.97 E.0165
G1 X175.734 Y160.099 E.35444
G1 X175.199 Y160.099 E.0165
M73 P84 R2
G1 X167.069 Y151.97 E.35444
G1 X166.534 Y151.97 E.0165
G1 X174.664 Y160.099 E.35444
G1 X174.129 Y160.099 E.0165
G1 X165.999 Y151.97 E.35444
G1 X165.464 Y151.97 E.0165
G1 X173.594 Y160.099 E.35444
G1 X173.059 Y160.099 E.0165
G1 X164.929 Y151.97 E.35444
G1 X164.394 Y151.97 E.0165
G1 X172.524 Y160.099 E.35444
G1 X171.989 Y160.099 E.0165
G1 X163.859 Y151.97 E.35444
G1 X163.324 Y151.97 E.0165
G1 X171.453 Y160.099 E.35444
G1 X170.918 Y160.099 E.0165
G1 X162.789 Y151.97 E.35444
G1 X162.254 Y151.97 E.0165
G1 X170.383 Y160.099 E.35444
G1 X169.848 Y160.099 E.0165
G1 X161.719 Y151.97 E.35444
G1 X161.184 Y151.97 E.0165
G1 X169.313 Y160.099 E.35444
G1 X168.778 Y160.099 E.0165
G1 X160.649 Y151.97 E.35444
G1 X160.114 Y151.97 E.0165
G1 X168.243 Y160.099 E.35444
G1 X167.708 Y160.099 E.0165
G1 X159.579 Y151.97 E.35444
G1 X159.044 Y151.97 E.0165
G1 X167.173 Y160.099 E.35444
G1 X166.638 Y160.099 E.0165
G1 X158.509 Y151.97 E.35444
G1 X157.974 Y151.97 E.0165
G1 X166.103 Y160.099 E.35444
G1 X165.568 Y160.099 E.0165
G1 X157.439 Y151.97 E.35444
G1 X156.903 Y151.97 E.0165
G1 X165.033 Y160.099 E.35444
G1 X164.498 Y160.099 E.0165
G1 X156.368 Y151.97 E.35444
G1 X155.833 Y151.97 E.0165
G1 X163.963 Y160.099 E.35444
G1 X163.428 Y160.099 E.0165
G1 X155.298 Y151.97 E.35444
G1 X154.763 Y151.97 E.0165
G1 X162.893 Y160.099 E.35444
G1 X162.358 Y160.099 E.0165
G1 X154.228 Y151.97 E.35444
G1 X153.693 Y151.97 E.0165
G1 X161.823 Y160.099 E.35444
G1 X161.287 Y160.099 E.0165
G1 X153.158 Y151.97 E.35444
G1 X152.623 Y151.97 E.0165
G1 X160.752 Y160.099 E.35444
G1 X160.217 Y160.099 E.0165
G1 X152.088 Y151.97 E.35444
G1 X151.553 Y151.97 E.0165
G1 X159.682 Y160.099 E.35444
G1 X159.147 Y160.099 E.0165
G1 X151.018 Y151.97 E.35444
G1 X150.483 Y151.97 E.0165
G1 X158.612 Y160.099 E.35444
G1 X158.077 Y160.099 E.0165
G1 X149.948 Y151.97 E.35444
G1 X149.413 Y151.97 E.0165
G1 X157.542 Y160.099 E.35444
G1 X157.007 Y160.099 E.0165
G1 X148.878 Y151.97 E.35444
G1 X148.343 Y151.97 E.0165
G1 X156.472 Y160.099 E.35444
G1 X155.937 Y160.099 E.0165
G1 X147.808 Y151.97 E.35444
G1 X147.273 Y151.97 E.0165
G1 X155.402 Y160.099 E.35444
G1 X154.867 Y160.099 E.0165
G1 X146.737 Y151.97 E.35444
G1 X146.202 Y151.97 E.0165
G1 X154.332 Y160.099 E.35444
G1 X153.797 Y160.099 E.0165
G1 X145.667 Y151.97 E.35444
G1 X145.132 Y151.97 E.0165
G1 X153.262 Y160.099 E.35444
G1 X152.727 Y160.099 E.0165
G1 X144.597 Y151.97 E.35444
G1 X144.062 Y151.97 E.0165
G1 X152.192 Y160.099 E.35444
G1 X151.656 Y160.099 E.0165
G1 X143.527 Y151.97 E.35444
G1 X142.992 Y151.97 E.0165
G1 X151.121 Y160.099 E.35444
G1 X150.586 Y160.099 E.0165
G1 X142.457 Y151.97 E.35444
G1 X141.922 Y151.97 E.0165
G1 X150.051 Y160.099 E.35444
G1 X149.516 Y160.099 E.0165
G1 X141.387 Y151.97 E.35444
G1 X140.852 Y151.97 E.0165
G1 X148.981 Y160.099 E.35444
G1 X148.446 Y160.099 E.0165
G1 X140.317 Y151.97 E.35444
G1 X139.782 Y151.97 E.0165
G1 X147.911 Y160.099 E.35444
G1 X147.376 Y160.099 E.0165
G1 X139.247 Y151.97 E.35444
G1 X138.712 Y151.97 E.0165
G1 X146.841 Y160.099 E.35444
G1 X146.306 Y160.099 E.0165
G1 X138.177 Y151.97 E.35444
G1 X137.642 Y151.97 E.0165
G1 X145.771 Y160.099 E.35444
G1 X145.236 Y160.099 E.0165
G1 X137.106 Y151.97 E.35444
G1 X136.571 Y151.97 E.0165
G1 X144.701 Y160.099 E.35444
G1 X144.166 Y160.099 E.0165
G1 X136.036 Y151.97 E.35444
G1 X135.501 Y151.97 E.0165
G1 X143.631 Y160.099 E.35444
G1 X143.096 Y160.099 E.0165
G1 X134.966 Y151.97 E.35444
G1 X134.431 Y151.97 E.0165
G1 X142.561 Y160.099 E.35444
G1 X142.026 Y160.099 E.0165
G1 X133.896 Y151.97 E.35444
G1 X133.361 Y151.97 E.0165
G1 X141.49 Y160.099 E.35444
G1 X140.955 Y160.099 E.0165
G1 X132.826 Y151.97 E.35444
G1 X132.291 Y151.97 E.0165
G1 X140.42 Y160.099 E.35444
G1 X139.885 Y160.099 E.0165
G1 X131.756 Y151.97 E.35444
G1 X131.221 Y151.97 E.0165
G1 X139.35 Y160.099 E.35444
G1 X138.815 Y160.099 E.0165
G1 X130.686 Y151.97 E.35444
G1 X130.151 Y151.97 E.0165
G1 X138.28 Y160.099 E.35444
G1 X137.745 Y160.099 E.0165
G1 X129.616 Y151.97 E.35444
G1 X129.081 Y151.97 E.0165
G1 X137.21 Y160.099 E.35444
G1 X136.675 Y160.099 E.0165
G1 X128.546 Y151.97 E.35444
G1 X128.011 Y151.97 E.0165
G1 X136.14 Y160.099 E.35444
G1 X135.605 Y160.099 E.0165
G1 X127.476 Y151.97 E.35444
M73 P85 R2
G1 X126.94 Y151.97 E.0165
G1 X135.07 Y160.099 E.35444
G1 X134.535 Y160.099 E.0165
G1 X126.405 Y151.97 E.35444
G1 X125.87 Y151.97 E.0165
G1 X134 Y160.099 E.35444
G1 X133.465 Y160.099 E.0165
G1 X125.335 Y151.97 E.35444
G1 X124.8 Y151.97 E.0165
G1 X132.93 Y160.099 E.35444
G1 X132.395 Y160.099 E.0165
G1 X124.265 Y151.97 E.35444
G1 X123.73 Y151.97 E.0165
G1 X131.86 Y160.099 E.35444
G1 X131.324 Y160.099 E.0165
G1 X123.195 Y151.97 E.35444
G1 X122.66 Y151.97 E.0165
G1 X130.789 Y160.099 E.35444
G1 X130.254 Y160.099 E.0165
G1 X122.125 Y151.97 E.35444
G1 X121.59 Y151.97 E.0165
G1 X129.719 Y160.099 E.35444
G1 X129.184 Y160.099 E.0165
G1 X121.055 Y151.97 E.35444
G1 X120.52 Y151.97 E.0165
G1 X128.649 Y160.099 E.35444
G1 X128.114 Y160.099 E.0165
G1 X119.985 Y151.97 E.35444
G1 X119.45 Y151.97 E.0165
G1 X127.579 Y160.099 E.35444
G1 X127.044 Y160.099 E.0165
G1 X118.915 Y151.97 E.35444
G1 X118.38 Y151.97 E.0165
G1 X126.509 Y160.099 E.35444
G1 X125.974 Y160.099 E.0165
G1 X117.845 Y151.97 E.35444
G1 X117.31 Y151.97 E.0165
G1 X125.439 Y160.099 E.35444
G1 X124.904 Y160.099 E.0165
G1 X116.774 Y151.97 E.35444
G1 X116.239 Y151.97 E.0165
G1 X124.369 Y160.099 E.35444
G1 X123.834 Y160.099 E.0165
G1 X115.704 Y151.97 E.35444
G1 X115.169 Y151.97 E.0165
G1 X123.299 Y160.099 E.35444
G1 X122.764 Y160.099 E.0165
G1 X114.634 Y151.97 E.35444
G1 X114.099 Y151.97 E.0165
G1 X122.229 Y160.099 E.35444
G1 X121.694 Y160.099 E.0165
G1 X113.564 Y151.97 E.35444
G1 X113.029 Y151.97 E.0165
G1 X121.158 Y160.099 E.35444
G1 X120.623 Y160.099 E.0165
G1 X112.494 Y151.97 E.35444
G1 X111.959 Y151.97 E.0165
G1 X120.088 Y160.099 E.35444
G1 X119.553 Y160.099 E.0165
G1 X111.424 Y151.97 E.35444
G1 X110.889 Y151.97 E.0165
G1 X119.018 Y160.099 E.35444
G1 X118.483 Y160.099 E.0165
G1 X110.354 Y151.97 E.35444
G1 X109.819 Y151.97 E.0165
G1 X117.948 Y160.099 E.35444
G1 X117.413 Y160.099 E.0165
G1 X109.284 Y151.97 E.35444
G1 X108.749 Y151.97 E.0165
G1 X116.878 Y160.099 E.35444
G1 X116.343 Y160.099 E.0165
G1 X108.214 Y151.97 E.35444
G1 X107.679 Y151.97 E.0165
G1 X115.808 Y160.099 E.35444
G1 X115.273 Y160.099 E.0165
G1 X107.144 Y151.97 E.35444
G1 X106.608 Y151.97 E.0165
G1 X114.738 Y160.099 E.35444
G1 X114.203 Y160.099 E.0165
G1 X106.073 Y151.97 E.35444
G1 X105.538 Y151.97 E.0165
G1 X113.668 Y160.099 E.35444
G1 X113.133 Y160.099 E.0165
G1 X105.003 Y151.97 E.35444
G1 X104.468 Y151.97 E.0165
G1 X112.598 Y160.099 E.35444
G1 X112.063 Y160.099 E.0165
G1 X103.933 Y151.97 E.35444
G1 X103.398 Y151.97 E.0165
G1 X111.527 Y160.099 E.35444
G1 X110.992 Y160.099 E.0165
G1 X102.863 Y151.97 E.35444
G1 X102.328 Y151.97 E.0165
G1 X110.457 Y160.099 E.35444
G1 X109.922 Y160.099 E.0165
G1 X101.793 Y151.97 E.35444
G1 X101.258 Y151.97 E.0165
G1 X109.387 Y160.099 E.35444
G1 X108.852 Y160.099 E.0165
G1 X100.723 Y151.97 E.35444
G1 X100.188 Y151.97 E.0165
G1 X108.317 Y160.099 E.35444
G1 X107.782 Y160.099 E.0165
G1 X99.653 Y151.97 E.35444
G1 X99.118 Y151.97 E.0165
G1 X107.247 Y160.099 E.35444
G1 X106.712 Y160.099 E.0165
G1 X98.583 Y151.97 E.35444
G1 X98.048 Y151.97 E.0165
G1 X106.177 Y160.099 E.35444
G1 X105.642 Y160.099 E.0165
G1 X97.513 Y151.97 E.35444
G1 X96.977 Y151.97 E.0165
G1 X105.107 Y160.099 E.35444
G1 X104.572 Y160.099 E.0165
G1 X96.442 Y151.97 E.35444
G1 X95.907 Y151.97 E.0165
G1 X104.037 Y160.099 E.35444
G1 X103.502 Y160.099 E.0165
G1 X95.372 Y151.97 E.35444
G1 X94.837 Y151.97 E.0165
G1 X102.967 Y160.099 E.35444
G1 X102.432 Y160.099 E.0165
G1 X94.302 Y151.97 E.35444
G1 X93.767 Y151.97 E.0165
G1 X101.897 Y160.099 E.35444
G1 X101.361 Y160.099 E.0165
G1 X93.232 Y151.97 E.35444
G1 X92.697 Y151.97 E.0165
G1 X100.826 Y160.099 E.35444
G1 X100.291 Y160.099 E.0165
G1 X92.162 Y151.97 E.35444
G1 X91.627 Y151.97 E.0165
G1 X99.756 Y160.099 E.35444
G1 X99.221 Y160.099 E.0165
G1 X91.092 Y151.97 E.35444
G1 X90.557 Y151.97 E.0165
G1 X98.686 Y160.099 E.35444
G1 X98.151 Y160.099 E.0165
G1 X90.022 Y151.97 E.35444
G1 X89.487 Y151.97 E.0165
G1 X97.616 Y160.099 E.35444
G1 X97.081 Y160.099 E.0165
G1 X88.952 Y151.97 E.35444
G1 X88.417 Y151.97 E.0165
G1 X96.546 Y160.099 E.35444
G1 X96.011 Y160.099 E.0165
G1 X87.882 Y151.97 E.35444
G1 X87.347 Y151.97 E.0165
G1 X95.476 Y160.099 E.35444
G1 X94.941 Y160.099 E.0165
G1 X86.811 Y151.97 E.35444
G1 X86.276 Y151.97 E.0165
G1 X94.406 Y160.099 E.35444
G1 X93.871 Y160.099 E.0165
G1 X85.741 Y151.97 E.35444
G1 X85.206 Y151.97 E.0165
G1 X93.336 Y160.099 E.35444
G1 X92.801 Y160.099 E.0165
G1 X84.671 Y151.97 E.35444
G1 X84.136 Y151.97 E.0165
G1 X92.266 Y160.099 E.35444
G1 X91.731 Y160.099 E.0165
G1 X83.601 Y151.97 E.35444
G1 X83.066 Y151.97 E.0165
G1 X91.195 Y160.099 E.35444
M73 P86 R2
G1 X90.66 Y160.099 E.0165
G1 X82.531 Y151.97 E.35444
G1 X81.996 Y151.97 E.0165
G1 X90.125 Y160.099 E.35444
G1 X89.59 Y160.099 E.0165
G1 X81.461 Y151.97 E.35444
G1 X80.926 Y151.97 E.0165
G1 X89.055 Y160.099 E.35444
G1 X88.52 Y160.099 E.0165
G1 X80.391 Y151.97 E.35444
G1 X80.067 Y151.97 E.00999
G1 X80.067 Y152.181 E.00651
G1 X87.985 Y160.099 E.34524
G1 X87.45 Y160.099 E.0165
G1 X80.067 Y152.716 E.32191
G1 X80.067 Y153.251 E.0165
G1 X86.915 Y160.099 E.29858
G1 X86.38 Y160.099 E.0165
G1 X80.067 Y153.786 E.27525
G1 X80.067 Y154.321 E.0165
G1 X85.845 Y160.099 E.25193
G1 X85.31 Y160.099 E.0165
G1 X80.067 Y154.856 E.2286
G1 X80.067 Y155.391 E.0165
G1 X84.775 Y160.099 E.20527
G1 X84.24 Y160.099 E.0165
G1 X80.067 Y155.926 E.18194
G1 X80.067 Y156.462 E.0165
G1 X83.705 Y160.099 E.15861
G1 X83.17 Y160.099 E.0165
G1 X80.067 Y156.997 E.13528
G1 X80.067 Y157.532 E.0165
G1 X82.635 Y160.099 E.11196
G1 X82.1 Y160.099 E.0165
G1 X80.067 Y158.067 E.08863
G1 X80.067 Y158.602 E.0165
G1 X81.564 Y160.099 E.0653
G1 X81.029 Y160.099 E.0165
G1 X80.067 Y159.137 E.04197
G1 X80.067 Y159.672 E.0165
G1 X80.664 Y160.269 E.02604
; OBJECT_ID: 113
; WIPE_START
G1 X80.067 Y159.672 E-.32096
G1 X80.067 Y159.137 E-.20332
G1 X80.505 Y159.575 E-.23572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 113
M624 AQAAAAAAAAA=
G1 X87.814 Y157.375 Z2.2 F15000
G1 X177.398 Y130.398 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9000
G1 X78.602 Y130.398 E3.27724
G1 X78.602 Y121.602 E.29178
G1 X177.398 Y121.602 E3.27724
G1 X177.398 Y130.338 E.28979
M204 S250
G1 X177.79 Y130.79 F15000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6000
M204 S2500
G1 X78.21 Y130.79 E3.05982
G1 X78.21 Y121.21 E.29437
G1 X177.79 Y121.21 E3.05982
G1 X177.79 Y130.73 E.29252
; WIPE_START
M204 S5000
G1 X175.79 Y130.731 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.114 Y123.214 Z2.2 F15000
G1 X177.234 Y122.531 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42126
G1 F7500
G1 X176.639 Y121.935 E.02595
G1 X176.104 Y121.935 E.0165
G1 X177.065 Y122.896 E.04188
G1 X177.065 Y123.431 E.0165
G1 X175.569 Y121.935 E.06521
G1 X175.034 Y121.935 E.0165
G1 X177.065 Y123.966 E.08854
G1 X177.065 Y124.501 E.0165
G1 X174.499 Y121.935 E.11187
G1 X173.964 Y121.935 E.0165
G1 X177.065 Y125.036 E.1352
G1 X177.065 Y125.571 E.0165
G1 X173.429 Y121.935 E.15853
G1 X172.894 Y121.935 E.0165
G1 X177.065 Y126.106 E.18185
G1 X177.065 Y126.641 E.0165
G1 X172.359 Y121.935 E.20518
G1 X171.824 Y121.935 E.0165
G1 X177.065 Y127.176 E.22851
G1 X177.065 Y127.711 E.0165
G1 X171.289 Y121.935 E.25184
G1 X170.753 Y121.935 E.0165
G1 X177.065 Y128.247 E.27517
G1 X177.065 Y128.782 E.0165
G1 X170.218 Y121.935 E.2985
G1 X169.683 Y121.935 E.0165
G1 X177.065 Y129.317 E.32182
G1 X177.065 Y129.852 E.0165
G1 X169.148 Y121.935 E.34515
G1 X168.613 Y121.935 E.0165
G1 X176.743 Y130.065 E.35444
G1 X176.208 Y130.065 E.0165
G1 X168.078 Y121.935 E.35444
G1 X167.543 Y121.935 E.0165
G1 X175.673 Y130.065 E.35444
G1 X175.137 Y130.065 E.0165
G1 X167.008 Y121.935 E.35444
G1 X166.473 Y121.935 E.0165
G1 X174.602 Y130.065 E.35444
G1 X174.067 Y130.065 E.0165
G1 X165.938 Y121.935 E.35444
G1 X165.403 Y121.935 E.0165
G1 X173.532 Y130.065 E.35444
G1 X172.997 Y130.065 E.0165
G1 X164.868 Y121.935 E.35444
G1 X164.333 Y121.935 E.0165
G1 X172.462 Y130.065 E.35444
G1 X171.927 Y130.065 E.0165
G1 X163.798 Y121.935 E.35444
G1 X163.263 Y121.935 E.0165
G1 X171.392 Y130.065 E.35444
G1 X170.857 Y130.065 E.0165
G1 X162.728 Y121.935 E.35444
G1 X162.193 Y121.935 E.0165
G1 X170.322 Y130.065 E.35444
G1 X169.787 Y130.065 E.0165
G1 X161.658 Y121.935 E.35444
G1 X161.123 Y121.935 E.0165
G1 X169.252 Y130.065 E.35444
G1 X168.717 Y130.065 E.0165
G1 X160.587 Y121.935 E.35444
G1 X160.052 Y121.935 E.0165
G1 X168.182 Y130.065 E.35444
G1 X167.647 Y130.065 E.0165
G1 X159.517 Y121.935 E.35444
G1 X158.982 Y121.935 E.0165
G1 X167.112 Y130.065 E.35444
G1 X166.577 Y130.065 E.0165
G1 X158.447 Y121.935 E.35444
G1 X157.912 Y121.935 E.0165
G1 X166.042 Y130.065 E.35444
G1 X165.507 Y130.065 E.0165
G1 X157.377 Y121.935 E.35444
M73 P87 R2
G1 X156.842 Y121.935 E.0165
G1 X164.971 Y130.065 E.35444
G1 X164.436 Y130.065 E.0165
G1 X156.307 Y121.935 E.35444
G1 X155.772 Y121.935 E.0165
G1 X163.901 Y130.065 E.35444
G1 X163.366 Y130.065 E.0165
G1 X155.237 Y121.935 E.35444
G1 X154.702 Y121.935 E.0165
G1 X162.831 Y130.065 E.35444
G1 X162.296 Y130.065 E.0165
G1 X154.167 Y121.935 E.35444
G1 X153.632 Y121.935 E.0165
G1 X161.761 Y130.065 E.35444
G1 X161.226 Y130.065 E.0165
G1 X153.097 Y121.935 E.35444
G1 X152.562 Y121.935 E.0165
G1 X160.691 Y130.065 E.35444
G1 X160.156 Y130.065 E.0165
G1 X152.027 Y121.935 E.35444
G1 X151.492 Y121.935 E.0165
G1 X159.621 Y130.065 E.35444
G1 X159.086 Y130.065 E.0165
G1 X150.957 Y121.935 E.35444
G1 X150.421 Y121.935 E.0165
G1 X158.551 Y130.065 E.35444
G1 X158.016 Y130.065 E.0165
G1 X149.886 Y121.935 E.35444
G1 X149.351 Y121.935 E.0165
G1 X157.481 Y130.065 E.35444
G1 X156.946 Y130.065 E.0165
G1 X148.816 Y121.935 E.35444
G1 X148.281 Y121.935 E.0165
G1 X156.411 Y130.065 E.35444
G1 X155.876 Y130.065 E.0165
G1 X147.746 Y121.935 E.35444
G1 X147.211 Y121.935 E.0165
G1 X155.34 Y130.065 E.35444
G1 X154.805 Y130.065 E.0165
G1 X146.676 Y121.935 E.35444
G1 X146.141 Y121.935 E.0165
G1 X154.27 Y130.065 E.35444
G1 X153.735 Y130.065 E.0165
G1 X145.606 Y121.935 E.35444
G1 X145.071 Y121.935 E.0165
G1 X153.2 Y130.065 E.35444
G1 X152.665 Y130.065 E.0165
G1 X144.536 Y121.935 E.35444
G1 X144.001 Y121.935 E.0165
G1 X152.13 Y130.065 E.35444
G1 X151.595 Y130.065 E.0165
G1 X143.466 Y121.935 E.35444
G1 X142.931 Y121.935 E.0165
G1 X151.06 Y130.065 E.35444
G1 X150.525 Y130.065 E.0165
G1 X142.396 Y121.935 E.35444
G1 X141.861 Y121.935 E.0165
G1 X149.99 Y130.065 E.35444
G1 X149.455 Y130.065 E.0165
G1 X141.326 Y121.935 E.35444
G1 X140.79 Y121.935 E.0165
G1 X148.92 Y130.065 E.35444
G1 X148.385 Y130.065 E.0165
G1 X140.255 Y121.935 E.35444
G1 X139.72 Y121.935 E.0165
G1 X147.85 Y130.065 E.35444
G1 X147.315 Y130.065 E.0165
G1 X139.185 Y121.935 E.35444
G1 X138.65 Y121.935 E.0165
G1 X146.78 Y130.065 E.35444
G1 X146.245 Y130.065 E.0165
G1 X138.115 Y121.935 E.35444
G1 X137.58 Y121.935 E.0165
G1 X145.71 Y130.065 E.35444
G1 X145.174 Y130.065 E.0165
G1 X137.045 Y121.935 E.35444
G1 X136.51 Y121.935 E.0165
G1 X144.639 Y130.065 E.35444
G1 X144.104 Y130.065 E.0165
G1 X135.975 Y121.935 E.35444
G1 X135.44 Y121.935 E.0165
G1 X143.569 Y130.065 E.35444
G1 X143.034 Y130.065 E.0165
G1 X134.905 Y121.935 E.35444
G1 X134.37 Y121.935 E.0165
G1 X142.499 Y130.065 E.35444
G1 X141.964 Y130.065 E.0165
G1 X133.835 Y121.935 E.35444
G1 X133.3 Y121.935 E.0165
G1 X141.429 Y130.065 E.35444
G1 X140.894 Y130.065 E.0165
G1 X132.765 Y121.935 E.35444
G1 X132.23 Y121.935 E.0165
G1 X140.359 Y130.065 E.35444
G1 X139.824 Y130.065 E.0165
G1 X131.695 Y121.935 E.35444
G1 X131.16 Y121.935 E.0165
G1 X139.289 Y130.065 E.35444
G1 X138.754 Y130.065 E.0165
G1 X130.624 Y121.935 E.35444
G1 X130.089 Y121.935 E.0165
G1 X138.219 Y130.065 E.35444
G1 X137.684 Y130.065 E.0165
G1 X129.554 Y121.935 E.35444
G1 X129.019 Y121.935 E.0165
G1 X137.149 Y130.065 E.35444
G1 X136.614 Y130.065 E.0165
G1 X128.484 Y121.935 E.35444
G1 X127.949 Y121.935 E.0165
G1 X136.079 Y130.065 E.35444
G1 X135.544 Y130.065 E.0165
G1 X127.414 Y121.935 E.35444
G1 X126.879 Y121.935 E.0165
G1 X135.008 Y130.065 E.35444
G1 X134.473 Y130.065 E.0165
G1 X126.344 Y121.935 E.35444
G1 X125.809 Y121.935 E.0165
G1 X133.938 Y130.065 E.35444
G1 X133.403 Y130.065 E.0165
G1 X125.274 Y121.935 E.35444
G1 X124.739 Y121.935 E.0165
G1 X132.868 Y130.065 E.35444
G1 X132.333 Y130.065 E.0165
G1 X124.204 Y121.935 E.35444
G1 X123.669 Y121.935 E.0165
G1 X131.798 Y130.065 E.35444
G1 X131.263 Y130.065 E.0165
G1 X123.134 Y121.935 E.35444
G1 X122.599 Y121.935 E.0165
G1 X130.728 Y130.065 E.35444
G1 X130.193 Y130.065 E.0165
G1 X122.064 Y121.935 E.35444
G1 X121.529 Y121.935 E.0165
G1 X129.658 Y130.065 E.35444
G1 X129.123 Y130.065 E.0165
G1 X120.994 Y121.935 E.35444
G1 X120.458 Y121.935 E.0165
G1 X128.588 Y130.065 E.35444
G1 X128.053 Y130.065 E.0165
G1 X119.923 Y121.935 E.35444
G1 X119.388 Y121.935 E.0165
G1 X127.518 Y130.065 E.35444
G1 X126.983 Y130.065 E.0165
G1 X118.853 Y121.935 E.35444
G1 X118.318 Y121.935 E.0165
G1 X126.448 Y130.065 E.35444
G1 X125.913 Y130.065 E.0165
G1 X117.783 Y121.935 E.35444
G1 X117.248 Y121.935 E.0165
G1 X125.377 Y130.065 E.35444
G1 X124.842 Y130.065 E.0165
G1 X116.713 Y121.935 E.35444
G1 X116.178 Y121.935 E.0165
G1 X124.307 Y130.065 E.35444
G1 X123.772 Y130.065 E.0165
G1 X115.643 Y121.935 E.35444
G1 X115.108 Y121.935 E.0165
G1 X123.237 Y130.065 E.35444
G1 X122.702 Y130.065 E.0165
G1 X114.573 Y121.935 E.35444
G1 X114.038 Y121.935 E.0165
G1 X122.167 Y130.065 E.35444
G1 X121.632 Y130.065 E.0165
G1 X113.503 Y121.935 E.35444
G1 X112.968 Y121.935 E.0165
G1 X121.097 Y130.065 E.35444
M73 P88 R2
G1 X120.562 Y130.065 E.0165
G1 X112.433 Y121.935 E.35444
G1 X111.898 Y121.935 E.0165
G1 X120.027 Y130.065 E.35444
G1 X119.492 Y130.065 E.0165
G1 X111.363 Y121.935 E.35444
G1 X110.827 Y121.935 E.0165
G1 X118.957 Y130.065 E.35444
G1 X118.422 Y130.065 E.0165
G1 X110.292 Y121.935 E.35444
G1 X109.757 Y121.935 E.0165
G1 X117.887 Y130.065 E.35444
G1 X117.352 Y130.065 E.0165
G1 X109.222 Y121.935 E.35444
G1 X108.687 Y121.935 E.0165
G1 X116.817 Y130.065 E.35444
G1 X116.282 Y130.065 E.0165
G1 X108.152 Y121.935 E.35444
G1 X107.617 Y121.935 E.0165
G1 X115.747 Y130.065 E.35444
G1 X115.211 Y130.065 E.0165
G1 X107.082 Y121.935 E.35444
G1 X106.547 Y121.935 E.0165
G1 X114.676 Y130.065 E.35444
G1 X114.141 Y130.065 E.0165
G1 X106.012 Y121.935 E.35444
G1 X105.477 Y121.935 E.0165
G1 X113.606 Y130.065 E.35444
G1 X113.071 Y130.065 E.0165
G1 X104.942 Y121.935 E.35444
G1 X104.407 Y121.935 E.0165
G1 X112.536 Y130.065 E.35444
G1 X112.001 Y130.065 E.0165
G1 X103.872 Y121.935 E.35444
G1 X103.337 Y121.935 E.0165
G1 X111.466 Y130.065 E.35444
G1 X110.931 Y130.065 E.0165
G1 X102.802 Y121.935 E.35444
G1 X102.267 Y121.935 E.0165
G1 X110.396 Y130.065 E.35444
G1 X109.861 Y130.065 E.0165
G1 X101.732 Y121.935 E.35444
G1 X101.197 Y121.935 E.0165
G1 X109.326 Y130.065 E.35444
G1 X108.791 Y130.065 E.0165
G1 X100.661 Y121.935 E.35444
G1 X100.126 Y121.935 E.0165
G1 X108.256 Y130.065 E.35444
G1 X107.721 Y130.065 E.0165
G1 X99.591 Y121.935 E.35444
G1 X99.056 Y121.935 E.0165
G1 X107.186 Y130.065 E.35444
G1 X106.651 Y130.065 E.0165
G1 X98.521 Y121.935 E.35444
G1 X97.986 Y121.935 E.0165
G1 X106.116 Y130.065 E.35444
G1 X105.581 Y130.065 E.0165
G1 X97.451 Y121.935 E.35444
G1 X96.916 Y121.935 E.0165
G1 X105.045 Y130.065 E.35444
G1 X104.51 Y130.065 E.0165
G1 X96.381 Y121.935 E.35444
G1 X95.846 Y121.935 E.0165
G1 X103.975 Y130.065 E.35444
G1 X103.44 Y130.065 E.0165
G1 X95.311 Y121.935 E.35444
G1 X94.776 Y121.935 E.0165
G1 X102.905 Y130.065 E.35444
G1 X102.37 Y130.065 E.0165
G1 X94.241 Y121.935 E.35444
G1 X93.706 Y121.935 E.0165
G1 X101.835 Y130.065 E.35444
G1 X101.3 Y130.065 E.0165
G1 X93.171 Y121.935 E.35444
G1 X92.636 Y121.935 E.0165
G1 X100.765 Y130.065 E.35444
G1 X100.23 Y130.065 E.0165
G1 X92.101 Y121.935 E.35444
G1 X91.566 Y121.935 E.0165
G1 X99.695 Y130.065 E.35444
G1 X99.16 Y130.065 E.0165
G1 X91.031 Y121.935 E.35444
G1 X90.495 Y121.935 E.0165
G1 X98.625 Y130.065 E.35444
G1 X98.09 Y130.065 E.0165
G1 X89.96 Y121.935 E.35444
G1 X89.425 Y121.935 E.0165
G1 X97.555 Y130.065 E.35444
G1 X97.02 Y130.065 E.0165
G1 X88.89 Y121.935 E.35444
G1 X88.355 Y121.935 E.0165
G1 X96.485 Y130.065 E.35444
G1 X95.95 Y130.065 E.0165
G1 X87.82 Y121.935 E.35444
G1 X87.285 Y121.935 E.0165
G1 X95.414 Y130.065 E.35444
G1 X94.879 Y130.065 E.0165
G1 X86.75 Y121.935 E.35444
G1 X86.215 Y121.935 E.0165
G1 X94.344 Y130.065 E.35444
G1 X93.809 Y130.065 E.0165
G1 X85.68 Y121.935 E.35444
G1 X85.145 Y121.935 E.0165
G1 X93.274 Y130.065 E.35444
G1 X92.739 Y130.065 E.0165
G1 X84.61 Y121.935 E.35444
G1 X84.075 Y121.935 E.0165
G1 X92.204 Y130.065 E.35444
G1 X91.669 Y130.065 E.0165
G1 X83.54 Y121.935 E.35444
G1 X83.005 Y121.935 E.0165
G1 X91.134 Y130.065 E.35444
G1 X90.599 Y130.065 E.0165
G1 X82.47 Y121.935 E.35444
G1 X81.935 Y121.935 E.0165
G1 X90.064 Y130.065 E.35444
G1 X89.529 Y130.065 E.0165
G1 X81.4 Y121.935 E.35444
G1 X80.864 Y121.935 E.0165
G1 X88.994 Y130.065 E.35444
G1 X88.459 Y130.065 E.0165
G1 X80.329 Y121.935 E.35444
G1 X79.794 Y121.935 E.0165
G1 X87.924 Y130.065 E.35444
G1 X87.389 Y130.065 E.0165
G1 X79.259 Y121.935 E.35444
G1 X78.935 Y121.935 E.00999
G1 X78.935 Y122.146 E.00651
G1 X86.854 Y130.065 E.34524
G1 X86.319 Y130.065 E.0165
G1 X78.935 Y122.681 E.32191
G1 X78.935 Y123.216 E.0165
G1 X85.784 Y130.065 E.29858
G1 X85.248 Y130.065 E.0165
G1 X78.935 Y123.752 E.27525
G1 X78.935 Y124.287 E.0165
G1 X84.713 Y130.065 E.25193
G1 X84.178 Y130.065 E.0165
G1 X78.935 Y124.822 E.2286
G1 X78.935 Y125.357 E.0165
G1 X83.643 Y130.065 E.20527
G1 X83.108 Y130.065 E.0165
G1 X78.935 Y125.892 E.18194
G1 X78.935 Y126.427 E.0165
M73 P88 R1
G1 X82.573 Y130.065 E.15861
G1 X82.038 Y130.065 E.0165
G1 X78.935 Y126.962 E.13528
G1 X78.935 Y127.497 E.0165
G1 X81.503 Y130.065 E.11196
G1 X80.968 Y130.065 E.0165
G1 X78.935 Y128.032 E.08863
G1 X78.935 Y128.567 E.0165
G1 X80.433 Y130.065 E.0653
G1 X79.898 Y130.065 E.0165
G1 X78.935 Y129.102 E.04197
G1 X78.935 Y129.637 E.0165
G1 X79.533 Y130.234 E.02604
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F7500
G1 X78.935 Y129.637 E-.32096
G1 X78.935 Y129.102 E-.20332
G1 X79.374 Y129.541 E-.23572
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 113
M625
; layer num/total_layer_count: 10/10
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F15000
; object ids of layer 10 start: 113,149
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
; object ids of this layer10 end: 113,149
M625
; OBJECT_ID: 149
; start printing object, unique label id: 149
M624 AgAAAAAAAAA=
G1 X178.921 Y160.825
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P89 R1
G1 F6000
M204 S2500
G1 X79.341 Y160.825 E3.05982
G1 X79.341 Y151.245 E.29437
G1 X178.921 Y151.245 E3.05982
G1 X178.921 Y160.765 E.29252
M204 S5000
G1 X178.714 Y160.044 F15000
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X178.141 Y160.617 E.0249
G1 X177.608 Y160.617
G1 X178.714 Y159.511 E.04807
G1 X178.714 Y158.978
G1 X177.075 Y160.617 E.07124
G1 X176.541 Y160.617
G1 X178.714 Y158.445 E.09441
G1 X178.714 Y157.911
G1 X176.008 Y160.617 E.11759
G1 X175.475 Y160.617
G1 X178.714 Y157.378 E.14076
G1 X178.714 Y156.845
G1 X174.942 Y160.617 E.16393
G1 X174.408 Y160.617
G1 X178.714 Y156.312 E.18711
G1 X178.714 Y155.778
G1 X173.875 Y160.617 E.21028
G1 X173.342 Y160.617
G1 X178.714 Y155.245 E.23345
G1 X178.714 Y154.712
G1 X172.809 Y160.617 E.25662
G1 X172.275 Y160.617
G1 X178.714 Y154.179 E.2798
G1 X178.714 Y153.645
G1 X171.742 Y160.617 E.30297
G1 X171.209 Y160.617
G1 X178.714 Y153.112 E.32614
G1 X178.714 Y152.579
G1 X170.676 Y160.617 E.34931
G1 X170.142 Y160.617
G1 X178.714 Y152.046 E.37249
G1 X178.714 Y151.512
G1 X169.609 Y160.617 E.39566
G1 X169.076 Y160.617
G1 X178.241 Y151.452 E.39828
G1 X177.708 Y151.452
G1 X168.543 Y160.617 E.39827
G1 X168.009 Y160.617
G1 X177.175 Y151.452 E.39827
G1 X176.641 Y151.452
G1 X167.476 Y160.617 E.39828
G1 X166.943 Y160.617
G1 X176.108 Y151.452 E.39828
G1 X175.575 Y151.452
G1 X166.41 Y160.617 E.39827
G1 X165.876 Y160.617
G1 X175.042 Y151.452 E.39827
G1 X174.508 Y151.452
G1 X165.343 Y160.617 E.39828
G1 X164.81 Y160.617
G1 X173.975 Y151.452 E.39828
G1 X173.442 Y151.452
G1 X164.276 Y160.617 E.39827
G1 X163.743 Y160.617
G1 X172.908 Y151.452 E.39827
G1 X172.375 Y151.452
G1 X163.21 Y160.617 E.39828
G1 X162.677 Y160.617
G1 X171.842 Y151.452 E.39828
G1 X171.309 Y151.452
G1 X162.143 Y160.617 E.39827
G1 X161.61 Y160.617
G1 X170.775 Y151.452 E.39827
G1 X170.242 Y151.452
G1 X161.077 Y160.617 E.39828
G1 X160.544 Y160.617
G1 X169.709 Y151.452 E.39828
G1 X169.176 Y151.452
G1 X160.01 Y160.617 E.39827
G1 X159.477 Y160.617
G1 X168.642 Y151.452 E.39827
G1 X168.109 Y151.452
G1 X158.944 Y160.617 E.39828
G1 X158.411 Y160.617
G1 X167.576 Y151.452 E.39828
G1 X167.043 Y151.452
G1 X157.877 Y160.617 E.39827
G1 X157.344 Y160.617
G1 X166.509 Y151.452 E.39827
G1 X165.976 Y151.452
G1 X156.811 Y160.617 E.39828
G1 X156.278 Y160.617
G1 X165.443 Y151.452 E.39828
G1 X164.91 Y151.452
G1 X155.744 Y160.617 E.39827
G1 X155.211 Y160.617
G1 X164.376 Y151.452 E.39827
G1 X163.843 Y151.452
G1 X154.678 Y160.617 E.39828
G1 X154.145 Y160.617
G1 X163.31 Y151.452 E.39828
G1 X162.777 Y151.452
G1 X153.611 Y160.617 E.39828
G1 X153.078 Y160.617
G1 X162.243 Y151.452 E.39828
G1 X161.71 Y151.452
G1 X152.545 Y160.617 E.39828
G1 X152.012 Y160.617
G1 X161.177 Y151.452 E.39828
G1 X160.644 Y151.452
G1 X151.478 Y160.617 E.39828
G1 X150.945 Y160.617
G1 X160.11 Y151.452 E.39828
G1 X159.577 Y151.452
G1 X150.412 Y160.617 E.39828
G1 X149.879 Y160.617
G1 X159.044 Y151.452 E.39828
G1 X158.511 Y151.452
G1 X149.345 Y160.617 E.39828
M73 P90 R1
G1 X148.812 Y160.617
G1 X157.977 Y151.452 E.39828
G1 X157.444 Y151.452
G1 X148.279 Y160.617 E.39828
G1 X147.745 Y160.617
G1 X156.911 Y151.452 E.39828
G1 X156.378 Y151.452
G1 X147.212 Y160.617 E.39828
G1 X146.679 Y160.617
G1 X155.844 Y151.452 E.39828
G1 X155.311 Y151.452
G1 X146.146 Y160.617 E.39828
G1 X145.612 Y160.617
G1 X154.778 Y151.452 E.39828
G1 X154.244 Y151.452
G1 X145.079 Y160.617 E.39828
G1 X144.546 Y160.617
G1 X153.711 Y151.452 E.39828
G1 X153.178 Y151.452
G1 X144.013 Y160.617 E.39828
G1 X143.479 Y160.617
G1 X152.645 Y151.452 E.39827
G1 X152.111 Y151.452
G1 X142.946 Y160.617 E.39827
G1 X142.413 Y160.617
G1 X151.578 Y151.452 E.39828
G1 X151.045 Y151.452
G1 X141.88 Y160.617 E.39828
G1 X141.346 Y160.617
G1 X150.512 Y151.452 E.39827
G1 X149.978 Y151.452
G1 X140.813 Y160.617 E.39827
G1 X140.28 Y160.617
G1 X149.445 Y151.452 E.39828
G1 X148.912 Y151.452
G1 X139.747 Y160.617 E.39828
G1 X139.213 Y160.617
G1 X148.379 Y151.452 E.39827
G1 X147.845 Y151.452
G1 X138.68 Y160.617 E.39827
G1 X138.147 Y160.617
G1 X147.312 Y151.452 E.39828
G1 X146.779 Y151.452
G1 X137.614 Y160.617 E.39828
G1 X137.08 Y160.617
G1 X146.246 Y151.452 E.39827
G1 X145.712 Y151.452
G1 X136.547 Y160.617 E.39827
G1 X136.014 Y160.617
G1 X145.179 Y151.452 E.39828
G1 X144.646 Y151.452
G1 X135.481 Y160.617 E.39828
G1 X134.947 Y160.617
G1 X144.113 Y151.452 E.39827
G1 X143.579 Y151.452
G1 X134.414 Y160.617 E.39827
G1 X133.881 Y160.617
G1 X143.046 Y151.452 E.39828
G1 X142.513 Y151.452
G1 X133.348 Y160.617 E.39828
G1 X132.814 Y160.617
G1 X141.98 Y151.452 E.39827
G1 X141.446 Y151.452
G1 X132.281 Y160.617 E.39827
G1 X131.748 Y160.617
G1 X140.913 Y151.452 E.39828
G1 X140.38 Y151.452
G1 X131.215 Y160.617 E.39828
G1 X130.681 Y160.617
G1 X139.847 Y151.452 E.39827
G1 X139.313 Y151.452
G1 X130.148 Y160.617 E.39827
G1 X129.615 Y160.617
G1 X138.78 Y151.452 E.39828
G1 X138.247 Y151.452
G1 X129.081 Y160.617 E.39828
G1 X128.548 Y160.617
G1 X137.713 Y151.452 E.39827
G1 X137.18 Y151.452
G1 X128.015 Y160.617 E.39827
G1 X127.482 Y160.617
G1 X136.647 Y151.452 E.39828
G1 X136.114 Y151.452
G1 X126.948 Y160.617 E.39828
G1 X126.415 Y160.617
G1 X135.58 Y151.452 E.39827
G1 X135.047 Y151.452
G1 X125.882 Y160.617 E.39827
G1 X125.349 Y160.617
G1 X134.514 Y151.452 E.39828
M73 P91 R1
G1 X133.981 Y151.452
G1 X124.815 Y160.617 E.39828
G1 X124.282 Y160.617
G1 X133.447 Y151.452 E.39827
G1 X132.914 Y151.452
G1 X123.749 Y160.617 E.39827
G1 X123.216 Y160.617
G1 X132.381 Y151.452 E.39828
G1 X131.848 Y151.452
G1 X122.682 Y160.617 E.39828
G1 X122.149 Y160.617
G1 X131.314 Y151.452 E.39827
G1 X130.781 Y151.452
G1 X121.616 Y160.617 E.39827
G1 X121.083 Y160.617
G1 X130.248 Y151.452 E.39828
G1 X129.715 Y151.452
G1 X120.549 Y160.617 E.39828
G1 X120.016 Y160.617
G1 X129.181 Y151.452 E.39828
G1 X128.648 Y151.452
G1 X119.483 Y160.617 E.39827
G1 X118.95 Y160.617
G1 X128.115 Y151.452 E.39828
G1 X127.582 Y151.452
G1 X118.416 Y160.617 E.39828
G1 X117.883 Y160.617
G1 X127.048 Y151.452 E.39828
G1 X126.515 Y151.452
G1 X117.35 Y160.617 E.39827
G1 X116.817 Y160.617
G1 X125.982 Y151.452 E.39828
G1 X125.449 Y151.452
G1 X116.283 Y160.617 E.39828
G1 X115.75 Y160.617
G1 X124.915 Y151.452 E.39828
G1 X124.382 Y151.452
G1 X115.217 Y160.617 E.39827
G1 X114.684 Y160.617
G1 X123.849 Y151.452 E.39828
G1 X123.316 Y151.452
G1 X114.15 Y160.617 E.39828
G1 X113.617 Y160.617
G1 X122.782 Y151.452 E.39828
G1 X122.249 Y151.452
G1 X113.084 Y160.617 E.39827
G1 X112.55 Y160.617
G1 X121.716 Y151.452 E.39827
G1 X121.183 Y151.452
G1 X112.017 Y160.617 E.39828
G1 X111.484 Y160.617
G1 X120.649 Y151.452 E.39828
G1 X120.116 Y151.452
G1 X110.951 Y160.617 E.39827
G1 X110.417 Y160.617
G1 X119.583 Y151.452 E.39827
G1 X119.049 Y151.452
G1 X109.884 Y160.617 E.39828
G1 X109.351 Y160.617
G1 X118.516 Y151.452 E.39828
G1 X117.983 Y151.452
G1 X108.818 Y160.617 E.39827
G1 X108.284 Y160.617
G1 X117.45 Y151.452 E.39827
G1 X116.916 Y151.452
G1 X107.751 Y160.617 E.39828
G1 X107.218 Y160.617
G1 X116.383 Y151.452 E.39828
G1 X115.85 Y151.452
G1 X106.685 Y160.617 E.39827
G1 X106.151 Y160.617
G1 X115.317 Y151.452 E.39827
G1 X114.783 Y151.452
G1 X105.618 Y160.617 E.39828
G1 X105.085 Y160.617
G1 X114.25 Y151.452 E.39828
G1 X113.717 Y151.452
G1 X104.552 Y160.617 E.39827
G1 X104.018 Y160.617
G1 X113.184 Y151.452 E.39828
G1 X112.65 Y151.452
G1 X103.485 Y160.617 E.39828
G1 X102.952 Y160.617
G1 X112.117 Y151.452 E.39828
G1 X111.584 Y151.452
G1 X102.419 Y160.617 E.39828
G1 X101.885 Y160.617
G1 X111.051 Y151.452 E.39828
G1 X110.517 Y151.452
G1 X101.352 Y160.617 E.39828
M73 P92 R1
G1 X100.819 Y160.617
G1 X109.984 Y151.452 E.39828
G1 X109.451 Y151.452
G1 X100.286 Y160.617 E.39828
G1 X99.752 Y160.617
G1 X108.918 Y151.452 E.39828
G1 X108.384 Y151.452
G1 X99.219 Y160.617 E.39828
G1 X98.686 Y160.617
G1 X107.851 Y151.452 E.39828
G1 X107.318 Y151.452
G1 X98.153 Y160.617 E.39828
G1 X97.619 Y160.617
G1 X106.785 Y151.452 E.39828
G1 X106.251 Y151.452
G1 X97.086 Y160.617 E.39828
G1 X96.553 Y160.617
G1 X105.718 Y151.452 E.39828
G1 X105.185 Y151.452
G1 X96.02 Y160.617 E.39828
G1 X95.486 Y160.617
G1 X104.652 Y151.452 E.39828
G1 X104.118 Y151.452
G1 X94.953 Y160.617 E.39827
G1 X94.42 Y160.617
G1 X103.585 Y151.452 E.39827
G1 X103.052 Y151.452
G1 X93.886 Y160.617 E.39828
G1 X93.353 Y160.617
G1 X102.518 Y151.452 E.39828
G1 X101.985 Y151.452
G1 X92.82 Y160.617 E.39827
G1 X92.287 Y160.617
G1 X101.452 Y151.452 E.39827
G1 X100.919 Y151.452
G1 X91.753 Y160.617 E.39828
G1 X91.22 Y160.617
G1 X100.385 Y151.452 E.39828
G1 X99.852 Y151.452
G1 X90.687 Y160.617 E.39828
G1 X90.154 Y160.617
G1 X99.319 Y151.452 E.39827
G1 X98.786 Y151.452
G1 X89.62 Y160.617 E.39828
G1 X89.087 Y160.617
G1 X98.252 Y151.452 E.39828
G1 X97.719 Y151.452
G1 X88.554 Y160.617 E.39828
G1 X88.021 Y160.617
G1 X97.186 Y151.452 E.39827
G1 X96.653 Y151.452
G1 X87.487 Y160.617 E.39828
G1 X86.954 Y160.617
G1 X96.119 Y151.452 E.39828
G1 X95.586 Y151.452
G1 X86.421 Y160.617 E.39828
G1 X85.888 Y160.617
G1 X95.053 Y151.452 E.39827
G1 X94.52 Y151.452
G1 X85.354 Y160.617 E.39827
G1 X84.821 Y160.617
G1 X93.986 Y151.452 E.39828
G1 X93.453 Y151.452
G1 X84.288 Y160.617 E.39828
G1 X83.755 Y160.617
G1 X92.92 Y151.452 E.39827
G1 X92.387 Y151.452
G1 X83.221 Y160.617 E.39827
G1 X82.688 Y160.617
G1 X91.853 Y151.452 E.39828
G1 X91.32 Y151.452
G1 X82.155 Y160.617 E.39828
G1 X81.622 Y160.617
G1 X90.787 Y151.452 E.39827
G1 X90.254 Y151.452
G1 X81.088 Y160.617 E.39827
G1 X80.555 Y160.617
G1 X89.72 Y151.452 E.39828
G1 X89.187 Y151.452
G1 X80.022 Y160.617 E.39828
G1 X79.549 Y160.557
G1 X88.654 Y151.452 E.39565
G1 X88.121 Y151.452
G1 X79.549 Y160.024 E.37248
G1 X79.549 Y159.491
G1 X87.587 Y151.452 E.34931
G1 X87.054 Y151.452
G1 X79.549 Y158.957 E.32614
G1 X79.549 Y158.424
G1 X86.521 Y151.452 E.30296
M73 P93 R1
G1 X85.987 Y151.452
G1 X79.549 Y157.891 E.27979
G1 X79.549 Y157.358
G1 X85.454 Y151.452 E.25662
G1 X84.921 Y151.452
G1 X79.549 Y156.824 E.23345
G1 X79.549 Y156.291
G1 X84.388 Y151.452 E.21027
G1 X83.854 Y151.452
G1 X79.549 Y155.758 E.1871
G1 X79.549 Y155.224
G1 X83.321 Y151.452 E.16393
G1 X82.788 Y151.452
G1 X79.549 Y154.691 E.14075
G1 X79.549 Y154.158
G1 X82.255 Y151.452 E.11758
G1 X81.721 Y151.452
G1 X79.549 Y153.625 E.09441
G1 X79.549 Y153.091
G1 X81.188 Y151.452 E.07124
G1 X80.655 Y151.452
G1 X79.549 Y152.558 E.04806
G1 X79.549 Y152.025
G1 X80.122 Y151.452 E.02489
; OBJECT_ID: 113
; WIPE_START
M204 S5000
G1 X79.549 Y152.025 E-.30783
G1 X79.549 Y152.558 E-.20264
G1 X80.013 Y152.094 E-.24954
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 149
M625
; start printing object, unique label id: 113
M624 AQAAAAAAAAA=
G1 X87.471 Y150.469 Z2.4 F15000
G1 X177.79 Y130.79 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F6000
M204 S2500
G1 X78.21 Y130.79 E3.05982
G1 X78.21 Y121.21 E.29437
G1 X177.79 Y121.21 E3.05982
G1 X177.79 Y130.73 E.29252
M204 S5000
G1 X177.583 Y130.01 F15000
; FEATURE: Top surface
G1 F6000
M204 S1000
G1 X177.01 Y130.583 E.0249
G1 X176.476 Y130.583
G1 X177.583 Y129.476 E.04807
G1 X177.583 Y128.943
G1 X175.943 Y130.583 E.07124
G1 X175.41 Y130.583
G1 X177.583 Y128.41 E.09441
G1 X177.583 Y127.877
G1 X174.877 Y130.583 E.11759
G1 X174.343 Y130.583
G1 X177.583 Y127.343 E.14076
G1 X177.583 Y126.81
G1 X173.81 Y130.583 E.16393
G1 X173.277 Y130.583
G1 X177.583 Y126.277 E.18711
G1 X177.583 Y125.744
G1 X172.744 Y130.583 E.21028
G1 X172.21 Y130.583
G1 X177.583 Y125.21 E.23345
G1 X177.583 Y124.677
G1 X171.677 Y130.583 E.25662
G1 X171.144 Y130.583
G1 X177.583 Y124.144 E.2798
G1 X177.583 Y123.611
G1 X170.611 Y130.583 E.30297
G1 X170.077 Y130.583
G1 X177.583 Y123.077 E.32614
G1 X177.583 Y122.544
G1 X169.544 Y130.583 E.34931
G1 X169.011 Y130.583
G1 X177.583 Y122.011 E.37249
G1 X177.583 Y121.478
G1 X168.478 Y130.583 E.39566
G1 X167.944 Y130.583
G1 X177.11 Y121.417 E.39828
G1 X176.576 Y121.417
G1 X167.411 Y130.583 E.39827
G1 X166.878 Y130.583
G1 X176.043 Y121.417 E.39827
G1 X175.51 Y121.417
G1 X166.345 Y130.583 E.39828
G1 X165.811 Y130.583
G1 X174.977 Y121.417 E.39828
G1 X174.443 Y121.417
G1 X165.278 Y130.583 E.39827
G1 X164.745 Y130.583
G1 X173.91 Y121.417 E.39827
G1 X173.377 Y121.417
M73 P94 R1
G1 X164.212 Y130.583 E.39828
G1 X163.678 Y130.583
G1 X172.844 Y121.417 E.39828
G1 X172.31 Y121.417
G1 X163.145 Y130.583 E.39827
G1 X162.612 Y130.583
G1 X171.777 Y121.417 E.39827
G1 X171.244 Y121.417
G1 X162.078 Y130.583 E.39828
G1 X161.545 Y130.583
G1 X170.71 Y121.417 E.39828
G1 X170.177 Y121.417
G1 X161.012 Y130.583 E.39827
G1 X160.479 Y130.583
G1 X169.644 Y121.417 E.39827
G1 X169.111 Y121.417
G1 X159.945 Y130.583 E.39828
G1 X159.412 Y130.583
G1 X168.577 Y121.417 E.39828
G1 X168.044 Y121.417
G1 X158.879 Y130.583 E.39827
G1 X158.346 Y130.583
G1 X167.511 Y121.417 E.39827
G1 X166.978 Y121.417
G1 X157.812 Y130.583 E.39828
G1 X157.279 Y130.583
G1 X166.444 Y121.417 E.39828
G1 X165.911 Y121.417
G1 X156.746 Y130.583 E.39827
G1 X156.213 Y130.583
G1 X165.378 Y121.417 E.39827
G1 X164.845 Y121.417
G1 X155.679 Y130.583 E.39828
G1 X155.146 Y130.583
G1 X164.311 Y121.417 E.39828
G1 X163.778 Y121.417
G1 X154.613 Y130.583 E.39827
G1 X154.08 Y130.583
G1 X163.245 Y121.417 E.39827
G1 X162.712 Y121.417
G1 X153.546 Y130.583 E.39828
G1 X153.013 Y130.583
G1 X162.178 Y121.417 E.39828
G1 X161.645 Y121.417
G1 X152.48 Y130.583 E.39828
G1 X151.947 Y130.583
G1 X161.112 Y121.417 E.39828
G1 X160.579 Y121.417
G1 X151.413 Y130.583 E.39828
G1 X150.88 Y130.583
G1 X160.045 Y121.417 E.39828
G1 X159.512 Y121.417
G1 X150.347 Y130.583 E.39828
M73 P94 R0
G1 X149.814 Y130.583
G1 X158.979 Y121.417 E.39828
G1 X158.446 Y121.417
G1 X149.28 Y130.583 E.39828
G1 X148.747 Y130.583
G1 X157.912 Y121.417 E.39828
G1 X157.379 Y121.417
G1 X148.214 Y130.583 E.39828
G1 X147.681 Y130.583
G1 X156.846 Y121.417 E.39828
G1 X156.313 Y121.417
G1 X147.147 Y130.583 E.39828
G1 X146.614 Y130.583
G1 X155.779 Y121.417 E.39828
G1 X155.246 Y121.417
G1 X146.081 Y130.583 E.39828
G1 X145.547 Y130.583
G1 X154.713 Y121.417 E.39828
G1 X154.18 Y121.417
G1 X145.014 Y130.583 E.39828
G1 X144.481 Y130.583
G1 X153.646 Y121.417 E.39828
G1 X153.113 Y121.417
G1 X143.948 Y130.583 E.39828
G1 X143.414 Y130.583
G1 X152.58 Y121.417 E.39828
G1 X152.046 Y121.417
G1 X142.881 Y130.583 E.39828
G1 X142.348 Y130.583
G1 X151.513 Y121.417 E.39827
G1 X150.98 Y121.417
G1 X141.815 Y130.583 E.39827
G1 X141.281 Y130.583
G1 X150.447 Y121.417 E.39828
G1 X149.913 Y121.417
G1 X140.748 Y130.583 E.39828
G1 X140.215 Y130.583
G1 X149.38 Y121.417 E.39827
G1 X148.847 Y121.417
G1 X139.682 Y130.583 E.39827
G1 X139.148 Y130.583
G1 X148.314 Y121.417 E.39828
G1 X147.78 Y121.417
G1 X138.615 Y130.583 E.39828
G1 X138.082 Y130.583
G1 X147.247 Y121.417 E.39827
G1 X146.714 Y121.417
G1 X137.549 Y130.583 E.39827
G1 X137.015 Y130.583
M73 P95 R0
G1 X146.181 Y121.417 E.39828
G1 X145.647 Y121.417
G1 X136.482 Y130.583 E.39828
G1 X135.949 Y130.583
G1 X145.114 Y121.417 E.39827
G1 X144.581 Y121.417
G1 X135.416 Y130.583 E.39827
G1 X134.882 Y130.583
G1 X144.048 Y121.417 E.39828
G1 X143.514 Y121.417
G1 X134.349 Y130.583 E.39828
G1 X133.816 Y130.583
G1 X142.981 Y121.417 E.39827
G1 X142.448 Y121.417
G1 X133.283 Y130.583 E.39827
G1 X132.749 Y130.583
G1 X141.915 Y121.417 E.39828
G1 X141.381 Y121.417
G1 X132.216 Y130.583 E.39828
G1 X131.683 Y130.583
G1 X140.848 Y121.417 E.39827
G1 X140.315 Y121.417
G1 X131.15 Y130.583 E.39827
G1 X130.616 Y130.583
G1 X139.782 Y121.417 E.39828
G1 X139.248 Y121.417
G1 X130.083 Y130.583 E.39828
G1 X129.55 Y130.583
G1 X138.715 Y121.417 E.39827
G1 X138.182 Y121.417
G1 X129.017 Y130.583 E.39827
G1 X128.483 Y130.583
G1 X137.649 Y121.417 E.39828
G1 X137.115 Y121.417
G1 X127.95 Y130.583 E.39828
G1 X127.417 Y130.583
G1 X136.582 Y121.417 E.39827
G1 X136.049 Y121.417
G1 X126.883 Y130.583 E.39827
G1 X126.35 Y130.583
G1 X135.515 Y121.417 E.39828
G1 X134.982 Y121.417
G1 X125.817 Y130.583 E.39828
G1 X125.284 Y130.583
G1 X134.449 Y121.417 E.39827
G1 X133.916 Y121.417
G1 X124.75 Y130.583 E.39827
G1 X124.217 Y130.583
G1 X133.382 Y121.417 E.39828
G1 X132.849 Y121.417
G1 X123.684 Y130.583 E.39828
G1 X123.151 Y130.583
G1 X132.316 Y121.417 E.39827
G1 X131.783 Y121.417
G1 X122.617 Y130.583 E.39827
G1 X122.084 Y130.583
G1 X131.249 Y121.417 E.39828
G1 X130.716 Y121.417
G1 X121.551 Y130.583 E.39828
G1 X121.018 Y130.583
G1 X130.183 Y121.417 E.39827
G1 X129.65 Y121.417
G1 X120.484 Y130.583 E.39827
G1 X119.951 Y130.583
G1 X129.116 Y121.417 E.39828
G1 X128.583 Y121.417
G1 X119.418 Y130.583 E.39828
G1 X118.885 Y130.583
G1 X128.05 Y121.417 E.39828
G1 X127.517 Y121.417
G1 X118.351 Y130.583 E.39827
G1 X117.818 Y130.583
G1 X126.983 Y121.417 E.39828
G1 X126.45 Y121.417
G1 X117.285 Y130.583 E.39828
G1 X116.752 Y130.583
G1 X125.917 Y121.417 E.39828
G1 X125.384 Y121.417
G1 X116.218 Y130.583 E.39827
G1 X115.685 Y130.583
G1 X124.85 Y121.417 E.39828
G1 X124.317 Y121.417
G1 X115.152 Y130.583 E.39828
G1 X114.619 Y130.583
G1 X123.784 Y121.417 E.39828
G1 X123.251 Y121.417
G1 X114.085 Y130.583 E.39827
G1 X113.552 Y130.583
G1 X122.717 Y121.417 E.39828
G1 X122.184 Y121.417
M73 P96 R0
G1 X113.019 Y130.583 E.39828
G1 X112.486 Y130.583
G1 X121.651 Y121.417 E.39828
G1 X121.118 Y121.417
G1 X111.952 Y130.583 E.39827
G1 X111.419 Y130.583
G1 X120.584 Y121.417 E.39827
G1 X120.051 Y121.417
G1 X110.886 Y130.583 E.39828
G1 X110.352 Y130.583
G1 X119.518 Y121.417 E.39828
G1 X118.984 Y121.417
G1 X109.819 Y130.583 E.39827
G1 X109.286 Y130.583
G1 X118.451 Y121.417 E.39827
G1 X117.918 Y121.417
G1 X108.753 Y130.583 E.39828
G1 X108.219 Y130.583
G1 X117.385 Y121.417 E.39828
G1 X116.851 Y121.417
G1 X107.686 Y130.583 E.39827
G1 X107.153 Y130.583
G1 X116.318 Y121.417 E.39827
G1 X115.785 Y121.417
G1 X106.62 Y130.583 E.39828
G1 X106.086 Y130.583
G1 X115.252 Y121.417 E.39828
G1 X114.718 Y121.417
G1 X105.553 Y130.583 E.39827
G1 X105.02 Y130.583
G1 X114.185 Y121.417 E.39827
G1 X113.652 Y121.417
G1 X104.487 Y130.583 E.39828
G1 X103.953 Y130.583
G1 X113.119 Y121.417 E.39828
G1 X112.585 Y121.417
G1 X103.42 Y130.583 E.39827
G1 X102.887 Y130.583
G1 X112.052 Y121.417 E.39828
G1 X111.519 Y121.417
G1 X102.354 Y130.583 E.39828
G1 X101.82 Y130.583
G1 X110.986 Y121.417 E.39828
G1 X110.452 Y121.417
G1 X101.287 Y130.583 E.39828
G1 X100.754 Y130.583
G1 X109.919 Y121.417 E.39828
G1 X109.386 Y121.417
G1 X100.221 Y130.583 E.39828
G1 X99.687 Y130.583
G1 X108.853 Y121.417 E.39828
G1 X108.319 Y121.417
G1 X99.154 Y130.583 E.39828
G1 X98.621 Y130.583
G1 X107.786 Y121.417 E.39828
G1 X107.253 Y121.417
G1 X98.088 Y130.583 E.39828
G1 X97.554 Y130.583
G1 X106.72 Y121.417 E.39828
G1 X106.186 Y121.417
G1 X97.021 Y130.583 E.39828
G1 X96.488 Y130.583
G1 X105.653 Y121.417 E.39828
G1 X105.12 Y121.417
G1 X95.955 Y130.583 E.39828
M73 P97 R0
G1 X95.421 Y130.583
G1 X104.587 Y121.417 E.39828
G1 X104.053 Y121.417
G1 X94.888 Y130.583 E.39828
G1 X94.355 Y130.583
G1 X103.52 Y121.417 E.39828
G1 X102.987 Y121.417
G1 X93.822 Y130.583 E.39827
G1 X93.288 Y130.583
G1 X102.454 Y121.417 E.39827
G1 X101.92 Y121.417
G1 X92.755 Y130.583 E.39828
G1 X92.222 Y130.583
G1 X101.387 Y121.417 E.39828
G1 X100.854 Y121.417
G1 X91.688 Y130.583 E.39827
G1 X91.155 Y130.583
G1 X100.32 Y121.417 E.39827
G1 X99.787 Y121.417
G1 X90.622 Y130.583 E.39828
G1 X90.089 Y130.583
G1 X99.254 Y121.417 E.39828
G1 X98.721 Y121.417
G1 X89.555 Y130.583 E.39828
G1 X89.022 Y130.583
G1 X98.187 Y121.417 E.39827
G1 X97.654 Y121.417
G1 X88.489 Y130.583 E.39828
G1 X87.956 Y130.583
G1 X97.121 Y121.417 E.39828
G1 X96.588 Y121.417
G1 X87.422 Y130.583 E.39828
G1 X86.889 Y130.583
G1 X96.054 Y121.417 E.39827
G1 X95.521 Y121.417
G1 X86.356 Y130.583 E.39828
G1 X85.823 Y130.583
G1 X94.988 Y121.417 E.39828
G1 X94.455 Y121.417
G1 X85.289 Y130.583 E.39828
G1 X84.756 Y130.583
G1 X93.921 Y121.417 E.39827
G1 X93.388 Y121.417
G1 X84.223 Y130.583 E.39827
G1 X83.69 Y130.583
G1 X92.855 Y121.417 E.39828
G1 X92.322 Y121.417
G1 X83.156 Y130.583 E.39828
G1 X82.623 Y130.583
G1 X91.788 Y121.417 E.39827
G1 X91.255 Y121.417
G1 X82.09 Y130.583 E.39827
G1 X81.557 Y130.583
G1 X90.722 Y121.417 E.39828
G1 X90.189 Y121.417
G1 X81.023 Y130.583 E.39828
G1 X80.49 Y130.583
G1 X89.655 Y121.417 E.39827
G1 X89.122 Y121.417
G1 X79.957 Y130.583 E.39827
G1 X79.424 Y130.583
G1 X88.589 Y121.417 E.39828
G1 X88.056 Y121.417
G1 X78.89 Y130.583 E.39828
G1 X78.417 Y130.522
G1 X87.522 Y121.417 E.39565
G1 X86.989 Y121.417
G1 X78.417 Y129.989 E.37248
G1 X78.417 Y129.456
G1 X86.456 Y121.417 E.34931
G1 X85.923 Y121.417
G1 X78.417 Y128.923 E.32614
G1 X78.417 Y128.389
G1 X85.389 Y121.417 E.30296
G1 X84.856 Y121.417
G1 X78.417 Y127.856 E.27979
G1 X78.417 Y127.323
G1 X84.323 Y121.417 E.25662
G1 X83.789 Y121.417
G1 X78.417 Y126.789 E.23345
G1 X78.417 Y126.256
G1 X83.256 Y121.417 E.21027
G1 X82.723 Y121.417
G1 X78.417 Y125.723 E.1871
G1 X78.417 Y125.19
G1 X82.19 Y121.417 E.16393
G1 X81.656 Y121.417
G1 X78.417 Y124.656 E.14075
G1 X78.417 Y124.123
G1 X81.123 Y121.417 E.11758
M73 P98 R0
G1 X80.59 Y121.417
G1 X78.417 Y123.59 E.09441
G1 X78.417 Y123.057
G1 X80.057 Y121.417 E.07124
G1 X79.523 Y121.417
G1 X78.417 Y122.523 E.04806
G1 X78.417 Y121.99
G1 X78.99 Y121.417 E.02489
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F6000
M204 S5000
G1 X78.417 Y121.99 E-.30783
G1 X78.417 Y122.523 E-.20264
G1 X78.882 Y122.059 E-.24953
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.217 J0 P1  F15000
; stop printing object, unique label id: 113
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

