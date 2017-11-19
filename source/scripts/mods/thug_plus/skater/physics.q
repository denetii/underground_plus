	Skater_Default_Stats = 5.0
	STATS_AIR = 0
	STATS_RUN = 1
	STATS_OLLIE = 2
	STATS_SPEED = 3
	STATS_SPIN = 4
	STATS_FLIPSPEED = 5
	STATS_SWITCH = 6
	STATS_RAILBALANCE = 7
	STATS_LIPBALANCE = 8
	STATS_MANUAL = 9
	standard_switch = (0.89999998,1.0)
	no_switch = (1.0,1.0)
	LEAN_GRAVITY_DIFF = (0.001,1.0)
	LEAN_ACC_DIFF = (0.75,1.0)
	skater_physics = {
		Physics_RunTimer_Duration = {(3.0,4.0) STATS_RUN #"switch" = no_switch}
		Skater_autoturn_speed = 3.0
		skater_autoturn_cancel_time = 300
		skater_autoturn_vert_angle = 5
		Physics_Standing_Air_Friction = 0.00001
		Physics_Crouched_Air_Friction = 0.000002
		Physics_Rolling_Friction = 0.00001
		Skater_Max_Standing_Kick_Speed_Stat = {(394.0,496.0) limit = 900 STATS_SPEED #"switch" = (0.80000001,1.0)}
		Skater_Max_Crouched_Kick_Speed_Stat = {(532.0,675.0) limit = 900 STATS_SPEED #"switch" = (0.80000001,1.0)}
		Physics_Standing_Acceleration_Stat = {(629.0,700.0) STATS_SPEED #"switch" = standard_switch}
		Physics_Crouching_Acceleration_stat = {(1057.0,1200.0) STATS_SPEED #"switch" = standard_switch}
		Skater_Max_Speed_Stat = {(757.0,900.0) STATS_SPEED #"switch" = no_switch}
		Skater_Max_Max_Speed_Stat = {(957.0,1100.0) STATS_SPEED #"switch" = no_switch}
		Skater_default_head_height = 77
		Physics_Ground_Snap_Up = 13
		Physics_Air_Snap_Up = 15
		Physics_Ground_Snap_Down = 8.19999981
		Skater_First_Forward_Collision_Height = 8.10000038
		Skater_First_Forward_Collision_Length = 10
		Skater_Min_Distance_To_Wall = 8.0
		Physics_Ground_Rotation = 1.79999995
		Physics_Ground_Sharp_Rotation = 3.5999999
		Physics_Air_No_Rotate_Time = 100
		Physics_Air_Ramp_Rotate_Time = 50
		spin_count_slop = 60
		Physics_Air_Gravity = -1350
		Physics_Ground_Gravity = -1000
		Physics_Rail_Gravity = -2000
		Wall_Ride_Gravity = -969
		Ground_stick_angle = 30
		Ground_stick_angle_forward = 60
		Physics_Brake_Acceleration = 900.0
		Physics_Air_Lean_stat = {(1.0,1.0) STATS_SPIN #"switch" = standard_switch}
		Physics_Air_Rotation_stat = {(6.8499999,7.75) STATS_SPIN #"switch" = standard_switch}
		Physics_air_tap_turn_speed_stat = {(6.8499999,7.75) STATS_SPIN #"switch" = standard_switch}
		Physics_Acid_Drop_Pop_Speed = 200
		Physics_Transfer_Speed_Limit_Override_Drop_Rate = 0.5
		Physics_Transfer_Speed_Limit_Override_Max = 75.75
	}
	Skater_Flip_Speed_Stat = {(1.15999997,1.29999995) STATS_FLIPSPEED #"switch" = standard_switch}
	Physics_Jump_Speed_Stat = {(414.0,450.0) STATS_OLLIE #"switch" = standard_switch}
	Physics_Jump_Speed_min_Stat = {(350.0,350.0) STATS_OLLIE #"switch" = standard_switch}
	Physics_Boneless_Jump_Speed_Stat = {(489.0,525.0) STATS_OLLIE #"switch" = standard_switch}
	Physics_Boneless_Jump_Speed_min_Stat = {(400.0,400.0) STATS_OLLIE #"switch" = standard_switch}
	Physics_Air_Jump_Speed_Stat = {(275.0,275.0) STATS_AIR #"switch" = standard_switch}
	Physics_Air_Jump_Speed_min_Stat = {(100.0,100.0) STATS_AIR #"switch" = standard_switch}
	Physics_Boneless_Air_Jump_Speed_Stat = {(264.0,325.0) STATS_AIR #"switch" = standard_switch}
	Physics_Boneless_Air_Jump_Speed_min_Stat = {(200.0,200.0) STATS_AIR #"switch" = standard_switch}
	Physics_Air_No_Lean_Time = 200
	Physics_Air_Ramp_Lean_Time = 200
	Spine_Max_Width = 800
	Physics_recover_rate_stat = {(2.0,2.0) STATS_SPIN #"switch" = standard_switch}
	Physics_Air_hang_Stat = 1.0
	Physics_Vert_hang_Stat = 1.10000002
	Physics_Acid_Drop_Min_Air_Time = 0.25
	Physics_Acid_Drop_Walking_On_Ground_Search_Distance = 100
	Physics_Acid_Drop_Min_Land_Speed = 500
	Physics_Wallplant_Min_Approach_Angle = 20
	Physics_Disallow_Rewallplant_Duration = 1000
	Physics_Wallplant_Speed_Loss = 225
	Physics_Wallplant_Min_Exit_Speed = 200
	Physics_Wallplant_Vertical_Exit_Speed = 500
	Physics_Wallplant_Disallow_Grind_Duration = 200
	Physics_Ignore_Ceilings_After_Wallplant_Duration = 200
	Physics_Min_Wallplant_Height = 24
	Physics_Wallplant_Distance_From_Wall = 27.60000038
	Physics_Wallplant_Duration = (0.16 * 1000)
	Physics_Disallow_Rewallpush_Duration = 800
	Physics_Wallpush_Speed_Loss = 200
	Physics_Wallpush_Min_Exit_Speed = 100
	Physics_Wallpush_Vertical_Exit_Speed = 400
	Physics_Point_Rail_Kick_Upward_Angle = 25
	Physics_Time_Before_Free_Revert = 20
	Lip_side_hop_speed = 10
	Lip_side_jump_speed = 200
	Lip_along_jump_speed = 100
	Lip_held_jump_out_time = 300
	Lip_held_jump_along_time = 300
	skater_upright_sideways_speed = -60.0
	physics_break_air_speed_scale = 0.75
	physics_break_air_up_scale = 0.75
	Skater_Break_Vert_forward_tilt = 45
	Skater_Vert_Allow_break_Time = 200
	Skater_vert_push_time = 130
	Skater_vert_active_up_time = 250
	Rail_Speed_Boost = 150
	Point_Rail_Speed_Boost = 100
	Skater_Drift_Upright_Speed = 0.30000001
	Physics_Vert_Push_Out = 3
	Physics_Heavy_Air_Friction = 0.0001
	Skater_Flip_Speed = 1.0
	Skater_Late_Jump_Slop = 333
	Skater_max_tense_time = 200
	
	Hang_Run_Timer_Speed_Adjustment = 0.40000001
	Skater_side_collide_height = 16
	Skater_side_collide_length = 15
	Skater_air_extra_side_col = 12
	Normal_Lerp_Speed = 0.1
	Normal_Lerp_Velocity_Scale = 250.0
	Rail_Max_Snap = 40.0
	Climb_Max_Snap = 90.0
	Drop_To_Climb_Max_Snap = 36.0
	Rail_jump_rerail_time = 300
	Rail_minimum_rerail_time = 500
	Rail_walk_rerail_time = 1000
	Rail_Corner_Leave_Angle = 50
	Rail_Jump_Angle = 15
	Rail_Tolerance = 0.69999999
	Rail_Bad_Ledge_Side_Dist = 5
	Rail_Bad_Ledge_Drop_Down_Dist = 3
	Wall_Bounce_Angle_Multiplier = 1.10000002
	Wall_Bounce_Dont_Slow_Angle = 30
	Wall_Bounce_Dont_Flail_Speed = 100
	Wall_Non_Skatable_Angle = 25
	Wall_Ride_Min_Speed = 75
	Wall_Ride_Max_Incident_Angle = 60
	Wall_Ride_Max_Tilt = 68.5
	Wall_Ride_Upside_Down_Angle = 53
	Wall_Ride_Triangle_Window = 0.333
	Wall_Ride_Delay = 0.66600001
	Wall_Ride_Down_Collision_Check_Length = -10
	Wall_Ride_Turn_Speed = 0.004
	Wall_Ride_Jump_Out_Speed = 40
	Wall_Ride_Jump_Up_Speed = 80
	Skater_max_sloped_turn_speed = 300.0
	Skater_max_sloped_turn_cosine = 0.5
	Skater_Slow_Turn_on_slopes = 3.0
	BalanceIgnoreButtonPeriod = 0
	BalanceSafeButtonPeriod = 1000
	ManualParams =
	{
		Cheese = {(700.0,700.0) STATS_MANUAL #"switch" = standard_switch}
		CheeseFrames = {(100.0,100.0) STATS_MANUAL #"switch" = standard_switch}
		Lean_Gravity_Stat = {(0.02,0.02) diff = LEAN_GRAVITY_DIFF STATS_MANUAL #"switch" = standard_switch}
		Instable_Rate = {(0.099,0.07) STATS_MANUAL #"switch" = standard_switch diff = (0.5,2.0)}
		Instable_Base = {(1.0,1.0) STATS_MANUAL #"switch" = standard_switch}
		Lean_Min_Speed = {(5.0,5.0) STATS_MANUAL #"switch" = standard_switch}
		Lean_Rnd_Speed = {(20.0,20.0) STATS_MANUAL #"switch" = standard_switch}
		Repeat_Min = {(1.0,1.0) STATS_MANUAL #"switch" = standard_switch}
		Repeat_Multiplier = {(0.25,0.25) STATS_MANUAL #"switch" = standard_switch}
		Lean_Repeat_Multiplier = {(0.80000001,0.80000001) STATS_MANUAL #"switch" = standard_switch}
		Lean_Acc = {(10.0,10.0) diff = LEAN_ACC_DIFF STATS_MANUAL #"switch" = standard_switch}
		Lean_Bail_Angle = {(4000.0,4000.0) STATS_MANUAL #"switch" = standard_switch}
	}
	SkitchParams =
	{
		Cheese = {(700.0,700.0)}
		CheeseFrames = {(1.0,1.0)}
		Lean_Gravity_Stat = {(0.01,0.01)}
		Instable_Rate = {(0.04,0.04)}
		Instable_Base = {(0.5,0.5)}
		Lean_Min_Speed = {(5.0,5.0)}
		Lean_Rnd_Speed = {(10.0,10.0)}
		Repeat_Min = {(1.0,1.0)}
		Repeat_Multiplier = {(0.25,0.25)}
		Lean_Repeat_Multiplier = {(0.80000001,0.80000001)}
		Lean_Acc = {(8.0,8.0)}
		Lean_Bail_Angle = {(4000.0,4000.0)}
	}
	GrindParams =
	{
		Cheese = {(2500.0,2500.0) STATS_RAILBALANCE #"switch" = standard_switch}
		CheeseFrames = {(30.0,30.0) STATS_RAILBALANCE #"switch" = standard_switch}
		Lean_Gravity_Stat = {(0.02,0.02) diff = LEAN_GRAVITY_DIFF STATS_RAILBALANCE #"switch" = standard_switch}
		Instable_Rate = {(0.104,0.09) STATS_RAILBALANCE #"switch" = standard_switch}
		Instable_Base = {(1.0,1.0) STATS_RAILBALANCE #"switch" = standard_switch}
		Lean_Min_Speed = {(5.0,5.0) STATS_RAILBALANCE #"switch" = standard_switch}
		Lean_Rnd_Speed = {(7.07000017,6.0) limit = 6 STATS_RAILBALANCE #"switch" = standard_switch}
		Repeat_Min = {(1.0,1.0) STATS_RAILBALANCE #"switch" = standard_switch}
		Repeat_Multiplier = {(0.31,0.1) STATS_RAILBALANCE #"switch" = standard_switch}
		Lean_Repeat_Multiplier = {(0.60699999,0.5) STATS_RAILBALANCE #"switch" = standard_switch}
		Lean_Acc = {(10.0,10.0) diff = LEAN_ACC_DIFF STATS_RAILBALANCE #"switch" = standard_switch}
		Lean_Bail_Angle = {(4000.0,4000.0) STATS_RAILBALANCE #"switch" = standard_switch}
		Same_Grind_Add_Time = {(2.0,2.0) STATS_RAILBALANCE #"switch" = standard_switch}
		New_Grind_Sub_Time = {(-0.28600001,0.0) STATS_RAILBALANCE #"switch" = standard_switch}
	}
	LipParams =
	{
		Cheese = {(3000.0,1000.0) STATS_LIPBALANCE #"switch" = standard_switch}
		CheeseFrames = {(180.0,180.0) STATS_LIPBALANCE #"switch" = standard_switch}
		Lean_Gravity_Stat = {(0.02,0.02) diff = LEAN_GRAVITY_DIFF STATS_LIPBALANCE #"switch" = standard_switch}
		Instable_Rate = {(0.5,0.2) STATS_LIPBALANCE #"switch" = standard_switch}
		Instable_Base = {(1.0,1.0) STATS_LIPBALANCE #"switch" = standard_switch}
		Lean_Min_Speed = {(10.0,10.0) STATS_LIPBALANCE #"switch" = standard_switch}
		Lean_Rnd_Speed = {(20.0,20.0) STATS_LIPBALANCE #"switch" = standard_switch}
		Repeat_Min = {(1.0,1.0) STATS_LIPBALANCE #"switch" = standard_switch}
		Repeat_Multiplier = {(1.0,1.0) STATS_LIPBALANCE #"switch" = standard_switch}
		Lean_Repeat_Multiplier = {(1.0,1.0) STATS_LIPBALANCE #"switch" = standard_switch}
		Lean_Acc = {(10.0,10.0) diff = LEAN_ACC_DIFF STATS_LIPBALANCE #"switch" = standard_switch}
		Lean_Bail_Angle = {(4000.0,4000.0) STATS_LIPBALANCE #"switch" = standard_switch}
	}
	DefaultWobbleParams =
	{
		WobbleAmpA = {(0.05,0.05) STATS_MANUAL}
		WobbleAmpB = {(0.04,0.04) STATS_MANUAL}
		WobbleK1 = {(0.0022,0.0022) STATS_MANUAL}
		WobbleK2 = {(0.0017,0.0017) STATS_MANUAL}
		SpazFactor = {(1.0,1.0) STATS_MANUAL}
	}
	BashPeriod = 400
	BashSpeedupFactor = 0.2
	BashMaxPercentSpeedup = 100
	SkateInAble_HorizOffset = 30
	SkateInAble_DownOffset = 7
	SkateInAble_LipHorizOffset = 24
	SkateInAble_LipDownOffset = 7
	SkateInAble_LipExtraCheckHorizOffset = 13
	SkateInAble_LipExtraCheckDownOffset = 2400
	LipAllowAngle = 15
	LipAllowAngle_Override = 60
	LipPlayerHorizontalAngle = 47
	LipRampVertAngle = 68.5
	CarPlant_Forward_boost = 400
	CarPlant_Upward_boost = 100
	min_car_height_diff = 60
	min_car_height_downwards = 30
	NewSpecial = 1
	Skate_min_wall_lean_push_speed = 1000
	Skate_wall_lean_push_time = 0.40000001
	Skate_wall_lean_push_length = 35
	Skate_wall_lean_push_height = 30
	Skitch_Max_Distance = 120
	Skitch_Offset = 27
	skitch_suck_speed = 200
	skitch_speed_match = 1.0
	skitch_hold_time = 200
	SnowBoard_Friction = 0.30000001
	Snowboard_turn_multiplier = 2.0
	cess_turn_min_speed = 40
	cess_turn_cap_speed = 500
	cess_turn_multiplier = 1.5
	cess_Friction = 0.06
	Skater_cess_Flip_Speed = 10000.0
	slomo_speed = 0.5
	Matrix_speed = 0.15000001
	Sim_speed = 1.25
	Moon_gravity = 0.5
	rubber_acc = 0.001
	rubber_friction = 0.04
	rubber_limit = 1000
	InternetClientCollCoefficient = 180.0
	InternetServerCollCoefficient = 120.0
	InternetClientCollRadius = 120.0
	InternetServerCollRadius = 94.0
	LanClientCollCoefficient = 100.0
	LanServerCollCoefficient = 55.0
	LanClientCollRadius = 70.0
	LanServerCollRadius = 70.0
	ClientCollCoefficient = 20.0
	ServerCollCoefficient = 20.0
	ClientCollRadius = 70.0
	ServerCollRadius = 70.0
	DrivingRadiusBoostFactor = 0.1
	DrivingCoefficientBoostFactor = 0.1
	ped_push_dist = 24
	ped_push_skater_speed = 400
	
	walk_parameters = {
		walk_speed = 150
		run_speed = 450
		combo_run_speed = 575
		run_adjust_rate = 1
		decel_factor = 4.5
		low_speed_decel_factor = 13.5
		run_accel_rate = 1500
		walk_accel_rate = 350
		walk_point = 0.85000002
		stop_skidding_speed = 50
		pegged_duration_for_skid = 0.2
		rotate_upright_duration = 0.30000001
		initial_vert_vel_boost = 80
		lerp_upright_rate = 6
		dpad_control_damping_factor = 1.29999995
		jump_velocity = 600
		min_jump_factor = 0.89999998
		gravity = 1750
		hold_time_for_max_jump = 300
		hang_jump_factor = 0.85000002
		jump_horiz_speed = 250
		jump_obstruction_check_height = 102
		jump_obstruction_check_back = 24
		jump_obstruction_extra_control_suppression_delay = 0
		sticky_land_threshold_speed = 200
		rotate_in_place_rate = 1200
		max_rotate_in_place_speed = 125
		max_rotate_in_place_angle = 20
		walk_rotate_factor = 0.5
		max_pop_speed = 100
		worse_turn_factor = 10
		worse_worse_turn_factor = 1
		dpad_worse_turn_factor = 5
		dpad_worse_worse_turn_factor = 1
		best_turn_factor = 25
		jump_adjust_speed = 200
		jump_accel_factor = 12
		snap_up_height = 24
		snap_down_height = 24
		max_unnoticed_ground_snap = 4
		feeler_length = 18
		feeler_height = 23
		push_feeler_length = 15
		push_strength = 30
		curb_float_lerp_up_rate = 54
		curb_float_lerp_down_rate = 18
		curb_float_feeler_length = 24
		min_curb_height_adjust_vel = 50
		walker_height = 70
		min_skid_speed = 175
		skid_accel = 1400
		max_reverse_angle = 45
		wall_turn_factor = 5
		wall_turn_speed_threshold = 20
		max_wall_turn_speed_threshold = 400
		forward_tolerance = 15
		stand_pos_search_depth = 18
		hang_move_speed = 110
		hang_move_lerp_rate = 6
		hang_move_cutoff = 20
		hang_vert_control_tolerance = 45
		hang_control_debounce_time = 0.5
		hang_hop_max_rail_angle = 45
		hang_max_rail_ascent = 30
		ledge_top_feeler_up = 6
		ledge_top_feeler_down = 6
		ledge_front_feeler_forward = 12
		ledge_front_feeler_back = 12
		hang_obstruction_feeler_side = 6
		hang_obstruction_feeler_up = 6
		pull_up_obstruction_height = 12
		rehang_delay = (0.30000001 * 1000)
		hang_init_anim_feeler_height = 36
		hang_init_anim_feeler_length = 20
		hang_move_collision_up = 48
		hang_move_collision_back = 8
		hang_move_collision_side_length = 18
		hang_move_collision_side_height = 48
		hang_critical_point_vert_offset = 6
		hang_critical_point_horiz_offset = -14
		drop_to_hang_speed_factor = 0.80000001
		hop_obstruction_feeler_up = 24
		barrier_jump_highest_barrier = 72
		barrier_jump_delay = (0 * 1000)
		barrier_jump_min_clearance = 3
		barrier_jump_max_angle = 30
		max_horiz_snap_distance = 24
		button_horiz_snap_distance = 48
		max_vert_snap_distance = 24
		max_onto_ladder_angle = 60
		ladder_move_speed = 125
		ladder_control_tolerance = 45
		ladder_climb_offset = 4
		acid_drop_jump_velocity = 400
		vert_wall_jump_speed = 600
		horiz_wall_jump_speed = 0
		max_slow_walk_speed = 120
		max_fast_walk_speed = 250
		max_slow_run_speed = 500
		min_anim_run_speed = 50
		hang_vert_origin_offset = 91
		hang_horiz_origin_offset = 1.5
		pull_up_offset_forward = 10.83500004
		pull_up_offset_up = 91
		drop_to_hang_rotate_factor = 0.5
		hang_anim_wait_speed = 1.60000002
		ladder_top_offset_forward = 6.00362015
		ladder_top_offset_up = 59.59719849
		ladder_bottom_offset_forward = 23.98740005
		ladder_bottom_offset_up = 13.0387001
		ladder_anim_wait_speed = 1.5
		hang_move_animation_speed = 46.20000076
		display_offset_restore_rate = 10
		max_cas_scaling = 0.2
	}
	robot_rail_nudge = 400.0
	robot_rail_add_time = 1.0
	robot_kick_in_count = 10
	
	
	
	
	
	
	Skater_Cam_Horiz_FOV = 72.0
	Skater_Cam_Behind = 14
	Skater_Cam_Above = 4.0
	Skater_Cam_Tilt = 0.18000001
	Skater_Cam_Slerp = 0.08
	Skater_Cam_Vert_Air_Slerp = 0.025
	
	Skater_Camera_Undefined = {
		horiz_fov = 72.0,
		behind = 3.0,
		above = 2.0,
		tilt = 0.40000007,
		slerp = 0.01,
		vert_air_slerp = 0.01,
		vert_air_landed_slerp = 0.035,
		lerp_xz = 0.09,
		lerp_y = 0.05,
		vert_air_lerp_xz = 0.06,
		vert_air_lerp_y = 0.04,
		zoom_lerp = 0.005,
		big_air_trick_zoom = 2.70000005,
		lip_trick_zoom = 6.0,
		lip_trick_tilt = 0.45000002,
		lip_trick_above = 1.29999995,
		grind_zoom = 1.89999998,
		origin_offset = 0.89999998,
		name = "fancy"}
	Skater_Camera_Standard_Medium = {
		horiz_fov = 72.0,
		behind = 12.0,
		above = 4.30000019,
		tilt = 0.18000001,
		slerp = 0.04,
		vert_air_slerp = 0.04,
		vert_air_landed_slerp = 0.375,
		lerp_xz = 0.25,
		lerp_y = 0.75,
		vert_air_lerp_xz = 1.0,
		vert_air_lerp_y = 1.0,
		zoom_lerp = 0.0125,
		big_air_trick_zoom = 1.70000005,
		lip_trick_zoom = 0.5,
		lip_trick_tilt = -0.80000001,
		lip_trick_above = 0.40000001,
		grind_zoom = 0.5,
		origin_offset = 0.2,
		name = "standard"}
	Skater_Camera_Standard_Far = {
		horiz_fov = 85.0
		behind = 7.0,
		above = 3.5,
		tilt = -0.5,
		slerp = 0.08,
		vert_air_slerp = 0.04,
		vert_air_landed_slerp = 0.375,
		lerp_xz = 0.25,
		lerp_y = 0.15000001,
		vert_air_lerp_xz = 0.055,
		vert_air_lerp_y = 0.08,
		zoom_lerp = 0.0625,
		big_air_trick_zoom = 0.69999999,
		lip_trick_zoom = 1.0,
		lip_trick_tilt = -0.80000001,
		lip_trick_above = 0.40000001,
		grind_zoom = 1.0,
		origin_offset = -100.19999695,
		name = "fancy2"}
	Skater_Camera_Standard_Near = {
		horiz_fov = 120.0,
		behind = 2.0,
		above = 2.0,
		tilt = 0.18000001,
		slerp = 0.02,
		vert_air_slerp = 0.005,
		vert_air_landed_slerp = 0.015,
		lerp_xz = 0.25,
		lerp_y = 0.1,
		vert_air_lerp_xz = 0.1,
		vert_air_lerp_y = 0.1,
		zoom_lerp = 0.0025,
		big_air_trick_zoom = 0.89999998,
		lip_trick_zoom = 4.5999999,
		lip_trick_tilt = -0.80000001,
		lip_trick_above = 1.20000005,
		grind_zoom = 1.0,
		origin_offset = 0.2,
		name = "near"}
	
	Skater_Camera_Standard_New = {
		horiz_fov = 72.0,
		behind = 0.0,
		above = 10.0,
		tilt = 0.0,
		slerp = 0.0,
		vert_air_slerp = 0.0,
		vert_air_landed_slerp = 0.01,
		lerp_xz = 0.0,
		lerp_y = 0.0,
		vert_air_lerp_xz = 0.005,
		vert_air_lerp_y = 0.005,
		zoom_lerp = 0.0625,
		big_air_trick_zoom = 0.89999998,
		lip_trick_zoom = 1.60000002,
		lip_trick_tilt = 0.0,
		lip_trick_above = 0.40000001,
		grind_zoom = 1.0,
		origin_offset = 0.2,
		name = "stationary"}
	Skater_Camera_Standard_New2 = {
		horiz_fov = 72.0,
		behind = 10.0,
		above = 4.30000019,
		tilt = 0.0,
		slerp = 0.0,
		vert_air_slerp = 0.04,
		vert_air_landed_slerp = 0.1,
		lerp_xz = 0.25,
		lerp_y = 0.75,
		vert_air_lerp_xz = 0.01,
		vert_air_lerp_y = 0.01,
		zoom_lerp = 0.0625,
		big_air_trick_zoom = 0.69999999,
		lip_trick_zoom = 1.29999995,
		lip_trick_tilt = 0.0,
		lip_trick_above = 0.40000001,
		grind_zoom = 1.5,
		origin_offset = 20.20000076,
		name = "static"}
	Skater_Camera_Standard_Dynamic = {
		horiz_fov = 72.0,
		behind = 20.0,
		above = 8.0,
		tilt = 0.0,
		slerp = 0.001,
		vert_air_slerp = 0.04,
		vert_air_landed_slerp = 0.375,
		lerp_xz = 0.25,
		lerp_y = 0.75,
		vert_air_lerp_xz = 1.0,
		vert_air_lerp_y = 1.0,
		zoom_lerp = 0.0625,
		big_air_trick_zoom = 0.69999999,
		lip_trick_zoom = 1.0,
		lip_trick_tilt = -0.80000001,
		lip_trick_above = 0.40000001,
		grind_zoom = 1.0,
		origin_offset = 0.89999998,
		name = "dynamic"}
	Skater_Camera_Standard_Medium_LTG = {
		horiz_fov = 52.0,
		behind = 10.0,
		above = 2.0,
		tilt = 0.15000001,
		slerp = 0.03,
		vert_air_slerp = 0.025,
		vert_air_landed_slerp = 0.075,
		lerp_xz = 0.25,
		lerp_y = 0.15000001,
		vert_air_lerp_xz = 0.69999999,
		vert_air_lerp_y = 0.60000002,
		zoom_lerp = 0.0225,
		big_air_trick_zoom = 0.60000002,
		lip_trick_zoom = 1.0,
		lip_trick_tilt = -0.80000001,
		lip_trick_above = 0.40000001,
		grind_zoom = 1.0,
		origin_offset = 8.19999981,
		name = "standard ltg"}
	Skater_Camera_Above = {
		horiz_fov = 72.0,
		behind = 15.0,
		above = 12.0,
		tilt = 0.40000007,
		slerp = 0.01,
		vert_air_slerp = 0.01,
		vert_air_landed_slerp = 0.035,
		lerp_xz = 0.09,
		lerp_y = 0.05,
		vert_air_lerp_xz = 0.06,
		vert_air_lerp_y = 0.04,
		zoom_lerp = 0.005,
		big_air_trick_zoom = 2.70000005,
		lip_trick_zoom = 6.0,
		lip_trick_tilt = 0.45000002,
		lip_trick_above = 1.29999995,
		grind_zoom = 1.89999998,
		origin_offset = 0.2,
		name = "top view"}
	Skater_Camera_FirstPerson = {
		horiz_fov = 90.0,
		behind = 0.25,
		above = 6.0999999,
		tilt = 0.0,
		slerp = 0.39999998,
		vert_air_slerp = 1.0,
		vert_air_landed_slerp = 0.99000001,
		lerp_xz = 1.0,
		lerp_y = 0.96000004,
		vert_air_lerp_xz = 1.0,
		vert_air_lerp_y = 0.60000002,
		zoom_lerp = 0.89999998,
		big_air_trick_zoom = 2.70000005,
		lip_trick_zoom = 1.0,
		lip_trick_tilt = 0.45000002,
		lip_trick_above = 5.29999971,
		grind_zoom = 1.89999998,
		origin_offset = 100.19999695,
		name = "first person"}
	
	
	Skater_Camera_2P_Vert_Medium = {horiz_fov = 72.0, behind = 14.0, above = 4.30000019, tilt = 0.18000001, slerp = 0.04, vert_air_slerp = 0.04, vert_air_landed_slerp = 0.375, lerp_xz = 0.25, lerp_y = 0.75, vert_air_lerp_xz = 1.0, vert_air_lerp_y = 1.0, zoom_lerp = 0.0625, big_air_trick_zoom = 0.69999999, lip_trick_zoom = 1.0, lip_trick_tilt = -0.80000001, lip_trick_above = 0.40000001, grind_zoom = 1.0, origin_offset = 0.2, name = "standard"}
	Skater_Camera_2P_Vert_Far = {horiz_fov = 72.0, behind = 22.0, above = 6.0, tilt = 0.30000001, slerp = 0.08, vert_air_slerp = 0.025, vert_air_landed_slerp = 0.375, lerp_xz = 0.25, lerp_y = 0.75, vert_air_lerp_xz = 1.0, vert_air_lerp_y = 1.0, zoom_lerp = 0.0625, big_air_trick_zoom = 0.60000002, lip_trick_zoom = 1.0, lip_trick_tilt = -0.80000001, lip_trick_above = 0.40000001, grind_zoom = 1.0, origin_offset = 0.2, name = "far"}
	Skater_Camera_2P_Vert_Near = {horiz_fov = 72.0, behind = 6, above = 2.0, tilt = 0.18000001, slerp = 0.08, vert_air_slerp = 0.025, vert_air_landed_slerp = 0.375, lerp_xz = 0.25, lerp_y = 0.75, vert_air_lerp_xz = 1.0, vert_air_lerp_y = 1.0, zoom_lerp = 0.0625, big_air_trick_zoom = 0.89999998, lip_trick_zoom = 1.60000002, lip_trick_tilt = -0.80000001, lip_trick_above = 0.40000001, grind_zoom = 1.0, origin_offset = 0.2, name = "near"}
	Skater_Camera_2P_Vert_Medium_LTG = {horiz_fov = 72.0, behind = 14.0, above = 3.0, tilt = 0.15000001, slerp = 0.08, vert_air_slerp = 0.025, vert_air_landed_slerp = 0.375, lerp_xz = 0.25, lerp_y = 0.75, vert_air_lerp_xz = 1.0, vert_air_lerp_y = 1.0, zoom_lerp = 0.0625, big_air_trick_zoom = 0.60000002, lip_trick_zoom = 1.0, lip_trick_tilt = -0.80000001, lip_trick_above = 0.40000001, grind_zoom = 1.0, origin_offset = 0.2, name = "standard ltg"}
	Skater_Camera_2P_Horiz_Medium = {horiz_fov = 72.0, behind = 15.0, above = 3.5, tilt = 0.2, slerp = 0.08, vert_air_slerp = 0.025, vert_air_landed_slerp = 0.375, lerp_xz = 0.25, lerp_y = 0.75, vert_air_lerp_xz = 1.0, vert_air_lerp_y = 1.0, zoom_lerp = 0.0625, big_air_trick_zoom = 0.60000002, lip_trick_zoom = 1.0, lip_trick_tilt = -0.80000001, lip_trick_above = 0.40000001, grind_zoom = 1.0, origin_offset = 0.2, name = "far"}
	Skater_Camera_2P_Horiz_Far = {horiz_fov = 72.0, behind = 25.0, above = 3.5, tilt = 0.30000001, slerp = 0.04, vert_air_slerp = 0.04, vert_air_landed_slerp = 0.375, lerp_xz = 0.25, lerp_y = 0.75, vert_air_lerp_xz = 1.0, vert_air_lerp_y = 1.0, zoom_lerp = 0.0625, big_air_trick_zoom = 0.69999999, lip_trick_zoom = 1.0, lip_trick_tilt = -0.80000001, lip_trick_above = 0.40000001, grind_zoom = 1.0, origin_offset = 0.2, name = "standard"}
	Skater_Camera_2P_Horiz_Medium_LTG = {horiz_fov = 72.0, behind = 15.0, above = 3.0, tilt = 0.15000001, slerp = 0.08, vert_air_slerp = 0.025, vert_air_landed_slerp = 0.375, lerp_xz = 0.25, lerp_y = 0.75, vert_air_lerp_xz = 1.0, vert_air_lerp_y = 1.0, zoom_lerp = 0.0625, big_air_trick_zoom = 0.60000002, lip_trick_zoom = 1.0, lip_trick_tilt = -0.80000001, lip_trick_above = 0.40000001, grind_zoom = 1.0, origin_offset = 0.2, name = "standard ltg"}
	Skater_Camera_2P_Horiz_Near = {horiz_fov = 72.0, behind = 8.0, above = 3.20000005, tilt = 0.18000001, slerp = 0.08, vert_air_slerp = 0.025, vert_air_landed_slerp = 0.375, lerp_xz = 0.25, lerp_y = 0.75, vert_air_lerp_xz = 1.0, vert_air_lerp_y = 1.0, zoom_lerp = 0.0625, big_air_trick_zoom = 1.0, lip_trick_zoom = 1.60000002, lip_trick_tilt = -0.80000001, lip_trick_above = 0.40000001, grind_zoom = 1.0, origin_offset = 0.2, name = "near"}
	
	Skater_Camera_Array = [Skater_Camera_Undefined,
		Skater_Camera_Standard_Near,
		Skater_Camera_Standard_Medium,
		Skater_Camera_Standard_Far,
		Skater_Camera_Standard_Medium_LTG,
		Skater_Camera_Standard_Dynamic,
		Skater_Camera_Standard_New,
		Skater_Camera_Standard_New2,
		Skater_Camera_Above,
		Skater_Camera_FirstPerson,
	]
	Skater_Camera_2P_Vert_Array = [Skater_Camera_Undefined,
		Skater_Camera_2P_Vert_Near,
		Skater_Camera_2P_Vert_Medium,
		Skater_Camera_2P_Vert_Far,
		Skater_Camera_2P_Vert_Medium_LTG,
	]
	Skater_Camera_2P_Horiz_Array = [Skater_Camera_Undefined,
		Skater_Camera_2P_Horiz_Near,
		Skater_Camera_2P_Horiz_Medium,
		Skater_Camera_2P_Horiz_Far,
		Skater_Camera_2P_Horiz_Medium_LTG,
	]
	
	
	walk_camera_parameters = {
		matrix_slerp_rate = 0.02
		lookaround_slerp_rate = 0.04
		run_slerp_factor = 1.75
		min_slerp_speed = 130
		full_slerp_speed = 450
		dpad_min_slerp_speed = 50
		dpad_full_slerp_speed = 150
		flush_slerp_factor = 12
		lock_angle = 135
		facing_control = 1.70000005
		control_slerp_factor = 1.29999995
	}
	
	
	
	
