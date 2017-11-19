
	ped_skater_min_square_distance_to_waypoint = 3
	ped_skater_min_square_distance_to_skater = 144
	ped_skater_min_square_distance_to_crouch_for_jump = 14400
	ped_skater_fade_target_bias_max_distance_square = 7056
	ped_skater_stick_dist_below = 24.0
	ped_skater_stick_dist_above = 18.0
	ped_skater_jump_col_dist_above = 12
	ped_skater_jump_col_dist_below = 12
	ped_skater_vert_jump_speed_slop = 1
	ped_skater_bail_deceleration = 9
	ped_skater_stop_deceleration = 10
	ped_skater_min_180_spin_time = 0.30000001
	ped_skater_vert_rotation_time_slop = 1.10000002
	ped_skater_spine_rotation_slop = 60
	ped_skater_jump_to_next_node_height_slop = 12
	ped_skater_jump_speed = 280
	ped_skater_jump_gravity = -700
	ped_skater_grind_anims = [
		{InitAnim = Init_BSBoardslide Anim = BSBoardslide_range OutAnim = BSBoardslide_Out BailAnim = NutterFallForward GetUpAnim = GetUpForwards}
		{InitAnim = Init_FiftyFifty Anim = FiftyFifty_range BailAnim = FiftyFiftyFallForward GetUpAnim = GetUpFacing}
		{InitAnim = Init_FSCrooked Anim = FSCrooked_range BailAnim = FiftyFiftyFallForward GetUpAnim = GetUpFacing}
		{InitAnim = Init_FSOvercrook Anim = FSOvercrook_range BailAnim = FiftyFiftyFallForward GetUpAnim = GetUpFacing}
		{InitAnim = Init_FSSmith Anim = FSSmith_range BailAnim = NutterFallForward GetUpAnim = GetUpForwards}
		{InitAnim = Init_BSSmith Anim = BSSmith_range BailAnim = NutterFallForward GetUpAnim = GetUpForwards}
		{InitAnim = Init_FSFeeble Anim = FSFeeble_range BailAnim = NutterFallForward GetUpAnim = GetUpForwards}
		{InitAnim = Init_Nosegrind Anim = Nosegrind_range BailAnim = FiftyFiftyFallForward GetUpAnim = GetUpFacing}
		{InitAnim = Init_Tailgrind Anim = Tailgrind_range BailAnim = FiftyFiftyFallForward GetUpAnim = GetUpFacing}
	]
	ped_skater_brake_idle_anims = [
		NewBrakeIdle
		NewBrakeIdle
		NewBrakeIdle
		NewBrakeIdle
		NewBrakeIdle
		NewBrakeIdle
		NewBrakeIdle
		NewBrakeIdle2
		NewBrakeIdle3
		NewBrakeIdle4
		NewBrakeIdle5
		NewBrakeIdle6
		NewBrakeIdle7
		NewBrakeIdle8
	]
	ped_skater_action_scripts = [
		ped_skater_idle
		ped_skater_grind
		ped_skater_grind_off
		ped_skater_grab_trick
		ped_skater_lip_trick
		ped_skater_land
		ped_skater_manual
		ped_skater_manual_down
		ped_skater_jump
		ped_skater_vert_jump
		ped_skater_roll_off
		ped_skater_crouch_for_jump
		ped_skater_flip_trick
		ped_skater_wait_and_stop_grab_anim
		ped_skater_stop
	]
	script ped_skater_crouch_for_jump
		Obj_PlayAnim Anim = Crouch
		Obj_WaitAnimFinished Anim = CrouchIdle cycle
	endscript
	script ped_skater_jump
		Obj_ShadowOff
		if NOT GotParam jumpSpeed
			<jumpSpeed> = ped_skater_jump_speed
		endif
		Ped_PlayJumpSound
		if GotParam land_height
			Obj_Jump {speed = <jumpSpeed>
				gravity = ped_skater_jump_gravity
				heading = <heading>
				land_height = <land_height>
			}
		else
			Obj_Jump speed = <jumpSpeed> gravity = ped_skater_jump_gravity
		endif
		Obj_SpawnScript ped_skater_play_midair_anim params = {Anim = Ollie}
		Obj_WaitJumpFinished
		Obj_GetID
		TerminateObjectsScripts id = <objId> script_name = ped_skater_play_midair_anim use_proper_version
		Ped_PlayLandSound
		if GotParam land_height
			if GotParam should_land
				ped_skater_land
			endif
			Ped_StartMoving
			Ped_HitWaypoint
		else
			ped_skater_land
		endif
	endscript
	script ped_skater_vert_jump
		Obj_ShadowOff
		Ped_StopMoving
		if NOT GotParam jumpSpeed
			<jumpSpeed> = ped_skater_jump_speed
		endif
		Obj_PlayAnim Anim = Ollie
		Ped_PlayJumpSound
		Obj_Jump heading = <heading> speed = (<jumpSpeed> * ped_skater_vert_jump_speed_slop) gravity = ped_skater_jump_gravity
		Obj_WaitAnimFinished
		Obj_PlayAnim Anim = AirIdle cycle
		Obj_WaitJumpFinished
		Ped_PlayLandSound
		if GotParam should_flip
			Obj_Flip
		endif
		Ped_StartMoving
		ped_skater_land Anim = CrouchedLandTurn
	endscript
	script ped_skater_roll_off
		Obj_ShadowOff
		Ped_GetCurrentVelocity
		Ped_StopMoving
		Obj_Jump use_current_heading speed = <velocity> gravity = ped_skater_jump_gravity
		Obj_WaitJumpFinished
		Ped_PlayLandSound
		Ped_StartMoving
		ped_skater_land small
	endscript
	script ped_skater_grind
		Obj_ShadowOff
		if NOT GotParam range_anim
			GetRandomArrayElement ped_skater_grind_anims
			<range_anim> = (<element>.Anim)
			<init_anim> = (<element>.InitAnim)
			<bail_anim> = (<element>.BailAnim)
			<get_up_anim> = (<element>.GetUpAnim)
			if StructureContains structure = <element> OutAnim
				<out_anim> = (<element>.OutAnim)
			endif
		endif
		SetTags {
			grind_init_anim = <init_anim>
			grind_range_anim = <range_anim>
			grind_out_anim = <out_anim>
			grind_bail_anim = <bail_anim>
			grind_get_up_anim = <get_up_anim>
		}
		Obj_PlayAnim Anim = <init_anim>
		Obj_WaitAnimFinished
		<wobble_to> = Random(@Start @End)
		Obj_PlayAnim Anim = <range_anim> PingPong From = Current To = <wobble_to> speed = 0.89999998 BlendPeriod = 0.1
	endscript
	script ped_skater_grind_off
		GetTags
		Obj_EnableAnimBlending enabled = 1
		if GotParam grind_out_anim
			Obj_PlayAnim Anim = <grind_out_anim>
		else
			Obj_PlayAnim Anim = <grind_init_anim> backwards
		endif
		ped_skater_roll_off <...>
	endscript
	script ped_skater_grab_trick
		Obj_ShadowOff
		if NOT GotParam jumpSpeed
			<jumpSpeed> = ped_skater_jump_speed
		endif
		if GotParam is_vert
			Ped_StopMoving
		endif
		if NOT GotParam Anim
			GetConfigurableTricksFromType type = GrabTrick
			GetRandomArrayElement <ConfigurableTricks>
			<trick_params> = (<element>.params)
			<Anim> = (<trick_params>.Anim)
			<idle_anim> = (<trick_params>.Idle)
			if StructureContains structure = <trick_params> OutAnim
				<out_anim> = (<trick_params>.OutAnim)
			endif
		endif
		Ped_PlayJumpSound
		if GotParam is_vert
			Obj_Jump heading = <heading> speed = <jumpSpeed> gravity = ped_skater_jump_gravity
		else
			if (<is_jumping> = 0)
				Obj_Jump speed = <jumpSpeed> gravity = ped_skater_jump_gravity
			endif
		endif
		Obj_PlayAnim Anim = <Anim>
		Obj_SpawnScript ped_skater_wait_and_stop_grab_anim params = <...>
		Obj_WaitJumpFinished
		Ped_PlayLandSound
		Obj_GetID
		TerminateObjectsScripts use_proper_version id = <objId> script_name = ped_skater_wait_and_stop_grab_anim
		if GotParam is_vert
			if GotParam should_flip
				Obj_Flip
			endif
			Ped_StartMoving
			<land_anim> = CrouchedLandTurn
		else
			<land_anim> = Land
		endif
		ped_skater_land Anim = <land_anim>
	endscript
	script ped_skater_wait_and_stop_grab_anim
		if GotParam jumpTime
			wait (<jumpTime> * 0.5) seconds
			if GotParam out_anim
				Obj_PlayAnim Anim = <out_anim>
				Obj_WaitAnimFinished
			else
				Obj_PlayAnim Anim = <Anim> backwards
				Obj_WaitAnimFinished
			endif
			Obj_PlayAnim Anim = AirIdle cycle
		endif
	endscript
	script ped_skater_stop
		Ped_StoreMaxVelocity
		if NOT GotParam deceleration
			<deceleration> = ped_skater_stop_deceleration
		endif
		Obj_SetPathDeceleration <deceleration>
		Obj_SetPathVelocity 0
		while
			Ped_GetCurrentVelocity
			if (<velocity> = 0)
				Ped_StopMoving
				break
			endif
			wait 1 frame
		repeat
		Obj_PlayAnim Anim = NewBrake
		Obj_WaitAnimFinished
		if GotParam RandomStopTime
			<StopTime> = RandomRange(1.0,30.0)
		endif
		if GotParam StopTime
			if (<StopTime> > 0)
				Obj_SpawnScript ped_skater_wait_and_start_moving params = {StopTime = <StopTime>}
			endif
		endif
		GetTags
		while
			GetRandomArrayElement <brake_idle_anims>
			Obj_PlayAnim Anim = <element>
			Obj_WaitAnimFinished
		repeat
	endscript
	script ped_skater_wait_and_start_moving
		wait <StopTime> seconds
		Obj_GetID
		TerminateObjectsScripts use_proper_version id = <objId> script_name = ped_skater_stop
		Obj_WaitAnimFinished
		Ped_StartMoving
	endscript
	script ped_skater_start_moving
		Ped_GetOriginalMaxVelocity
		GetTags
		if GotParam ped_skater_acceleration
			Obj_SetPathAcceleration <ped_skater_acceleration>
		endif
		Obj_SetPathVelocity <original_max_velocity> ips
		Obj_PlayAnim Anim = NewBrakeIdleToIdle
		Obj_WaitAnimFinished
		ped_skater_idle
	endscript
	script ped_skater_manual
		Obj_ShadowOn
		switch <ManualType>
			case Manual
				SetTags manual_out_anim = PutDownManual
				init_anim = Manual
				range_anim = Manual_range
			case Handstand
				SetTags manual_out_anim = RustySlide_Out
				init_anim = RustySlide_Init
				range_anim = Primo_Range
			default
				SetTags manual_out_anim = PutDownManual
				init_anim = Manual
				range_anim = Manual_range
		endswitch
		Obj_PlayAnim Anim = <init_anim>
		Obj_WaitAnimFinished
		Obj_PlayAnim Anim = <range_anim> PingPong From = Start To = End speed = 1.10000002 BlendPeriod = 0.1
	endscript
	script ped_skater_manual_down
		Obj_ShadowOn
		GetTags
		if NOT GotParam manual_out_anim
			<Anim> = PutDownManual
		endif
		Obj_PlayAnim Anim = <manual_out_anim>
		Obj_WaitAnimFinished
		ped_skater_idle
	endscript
	script ped_skater_manual_bail
	endscript
	script ped_skater_lip_trick
		Obj_ShadowOff
		Ped_SetLogicState lip_trick
		Ped_StopMoving
		Obj_EnableAnimBlending enabled = 1
		if NOT GotParam Anim
			GetConfigurableTricksFromType type = LipMacro2
			GetRandomArrayElement <ConfigurableTricks>
			<trick_params> = (<element>.params)
			<init_anim> = (<trick_params>.InitAnim)
			<Anim> = (<trick_params>.Anim)
			<out_anim> = (<trick_params>.OutAnim)
		endif
		Obj_PlayAnim Anim = <init_anim>
		Obj_WaitAnimFinished
		if NOT GotParam HoldLipTime
			<HoldLipTime> = RandomRange(1.0,3.0)
		endif
		Obj_PlayAnim Anim = <Anim> PingPong From = Current To = Start speed = 0.89999998
		wait <HoldLipTime> seconds
		Obj_PlayAnim Anim = <out_anim>
		if NOT StructureContains structure = <trick_params> FlipAfter
			Obj_Flip
		endif
		Obj_WaitAnimFinished
		Obj_EnableAnimBlending enabled = 0
		Ped_StartMoving
		Ped_SetLogicState generic_skater
		ped_skater_land
	endscript
	script ped_skater_flip_trick
		Obj_ShadowOff
		if GotParam is_vert
			Ped_StopMoving
		endif
		if (<is_jumping> = 0)
			Obj_PlayAnim Anim = Ollie
			if GotParam is_vert
				<jumpSpeed> = (<jumpSpeed> * ped_skater_vert_jump_speed_slop)
			endif
			Ped_PlayJumpSound
			if GotParam land_height
				Obj_Jump {speed = <jumpSpeed>
					gravity = ped_skater_jump_gravity
					heading = <heading>
					land_height = <land_height>
				}
			else
				Obj_Jump {
					speed = <jumpSpeed>
					heading = <heading>
					gravity = ped_skater_jump_gravity
				}
			endif
			wait 8 frame
		endif
		if NOT GotParam Anim
			GetConfigurableTricksFromType type = FlipTrick
			GetRandomArrayElement <ConfigurableTricks>
			<trick_params> = (<element>.params)
			<Anim> = (<trick_params>.Anim)
		endif
		Obj_GetID
		Obj_SpawnScript ped_skater_play_midair_anim params = {Anim = <Anim>}
		Obj_WaitJumpFinished
		TerminateObjectsScripts id = <objId> script_name = ped_skater_play_midair_anim use_proper_version
		Ped_PlayLandSound
		if GotParam is_vert
			Ped_StartMoving
			<land_anim> = CrouchedLandTurn
		else
			<land_anim> = Land
		endif
		if GotParam land_height
			Ped_StartMoving
			Obj_SpawnScript ped_skater_land Anim = <land_anim>
			Ped_HitWaypoint
		else
			ped_skater_land Anim = <land_anim>
		endif
	endscript
	script ped_skater_play_midair_anim
		Obj_PlayAnim Anim = <Anim>
		Obj_WaitAnimFinished
		Obj_PlayAnim Anim = AirIdle cycle
	endscript
	script ped_skater_land
		Obj_ShadowOn
		if NOT GotParam Anim
			<Anim> = Land
		endif
		Obj_PlayAnim Anim = <Anim> BlendPeriod = 0.30000001
		Obj_WaitAnimFinished
		ped_skater_idle
	endscript
	script ped_skater_idle
		while
			if Ped_NearVertNode
				<anim_struct> = Random(@*10 {Anim = Idle} @{init_anim = Crouch Anim = CrouchIdle out_anim = CrouchIdleToIdle cycle = 10})
			else
				<anim_struct> = Random(@*5 {Anim = Idle} @*10 {Anim = PushIdle} @{init_anim = Crouch Anim = CrouchIdle out_anim = CrouchIdleToIdle cycle = 10})
			endif
			RemoveParameter init_anim
			RemoveParameter Anim
			RemoveParameter cycle
			RemoveParameter out_anim
			if StructureContains structure = <anim_struct> init_anim
				<init_anim> = (<anim_struct>.init_anim)
			endif
			<Anim> = (<anim_struct>.Anim)
			if StructureContains structure = <anim_struct> cycle
				<cycle> = (<anim_struct>.cycle)
			else
				<cycle> = 1
			endif
			if StructureContains structure = <anim_struct> out_anim
				<out_anim> = (<anim_struct>.out_anim)
			endif
			if (GotParam init_anim)
				Obj_PlayAnim Anim = <init_anim>
				Obj_WaitAnimFinished
			endif
			while
				Obj_PlayAnim Anim = <Anim>
				Obj_WaitAnimFinished
			repeat <cycle>
			if GotParam out_anim
				Obj_PlayAnim Anim = <out_anim>
				Obj_WaitAnimFinished
			endif
		repeat
	endscript
	script ped_skater_generic_bail
		GetTags
		if NOT GotParam grind_bail_anim
			<grind_bail_anim> = FaceFall
			<grind_get_up_anim> = GetUpFaceSmash
		endif
		Ped_SetIsBailing 1
		Ped_StoreMaxVelocity
		Obj_SetPathDeceleration ped_skater_bail_deceleration
		Obj_SetPathVelocity 0
		Obj_PlayAnim Anim = <grind_bail_anim> NoRestart BlendPeriod = 0.30000001
		Obj_WaitAnimFinished
		Obj_PlayAnim Anim = <grind_get_up_anim> BlendPeriod = 0.1
		Obj_WaitAnimFinished
		Ped_GetOriginalMaxVelocity
		Obj_SetPathVelocity <original_max_velocity> ips
		Ped_SetIsBailing 0
		Obj_SpawnScript ped_skater_idle
	endscript
	script ped_skater_grind_bail
		GetTags
		if NOT GotParam grind_bail_anim
			<grind_bail_anim> = FiftyFiftyFallForward
			<grind_get_up_anim> = GetUpFacing
		endif
		Ped_SetIsBailing grind 1
		if GoalManager_GetActiveGoalId
			GoalManager_GetGoalParams name = <goal_id>
			if GotParam film
				Obj_GetID
				printstruct <...>
				if (<film_target> = <objId>)
					SpawnScript goal_film_bailed_skater params = {goal_id = <goal_id>}
				endif
			endif
		endif
		SpawnSound Ped_Skater_Grind_Bail_Sound
		ped_skater_generic_bail <...>
		Ped_SetIsBailing grind 0
	endscript
	script ped_skater_stop_actions
		Obj_GetID
		GetArraySize ped_skater_action_scripts
		<index> = 0
		while
			TerminateObjectsScripts use_proper_version id = <objId> script_name = (ped_skater_action_scripts[<index>])
			<index> = (<index> + 1)
		repeat <array_size>
	endscript
