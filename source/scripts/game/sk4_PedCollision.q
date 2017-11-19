
	script ped_initialize_collision_exceptions
		GetTags
		switch <collision_mode>
			case fall
				Obj_SetInnerAvoidRadius 4
				Obj_SetException {
					ex = SkaterInAvoidRadius
					scr = Ped_FallDownState
				}
			case knock
				Obj_SetInnerAvoidRadius 2
				Obj_SetException {
					ex = SkaterInAvoidRadius
					scr = Ped_KnockDownState
				}
			case avoid
				Obj_SetInnerAvoidRadius 8
				Obj_SetException {
					ex = SkaterInAvoidRadius
					scr = AVOIDSTATE_STOP
				}
			case bump
				Obj_SetInnerAvoidRadius 2
				Obj_SetException {
					ex = SkaterInAvoidRadius
					scr = goal_pro_bounce_skater
				}
			case ignore
				Obj_ClearException SkaterInAvoidRadius
			case shot
				Obj_SetInnerAvoidRadius 8
				Obj_SetException {
					ex = SkaterInAvoidRadius
					scr = Ped_ShotState
				}
		endswitch
	endscript
	script ped_return_to_precollision_state
		GetTags
		SetTags pissed = 0
		ped_initialize_collision_exceptions
		goto <collision_exception_return_state>
	endscript
	script AVOIDSTATE_STOP
		Ped_SetLogicState avoid
		Obj_ClearException SkaterInAvoidRadius
		Obj_SetInnerAvoidRadius 4
		Obj_SetException {
			ex = SkaterInAvoidRadius
			scr = AVOIDSTATE_INIT
		}
		wait 1 gameframe
		ped_stop_movement
		while
			ped_rotate_to_skater_from_idle
			Random(
				@ped_play_idle_anim
				@ped_play_idle_anim
				@ped_play_idle_anim
				@ped_play_wave_anim
			)
			Obj_GetDistanceToObject Skater
			if (<objectDistance> > 12.0)
				ped_initialize_movement
				goto ped_return_to_precollision_state
			endif
		repeat
	endscript
	script AVOIDSTATE_INIT
		Obj_ClearException SkaterInAvoidRadius
		SetTags pissed = 0
		Ped_RememberNextWaypoint
		Ped_RememberCurrentPosition
		Obj_StorePos
		Ped_RememberStickToGround
		goto AVOIDSTATE_JUMP
	endscript
	script AVOIDSTATE_JUMP
		Obj_ClearException SkaterInAvoidRadius
		GetTags
		SetTags pissed = (<pissed> + 1)
		if NOT Ped_SelectAvoidPoint <AvoidAnims>
			if NOT GotParam stand
				goto AVOIDSTATE_KNOCKDOWN
			endif
		endif
		while
			Ped_MoveTowardsAvoidPoint
			Obj_StickToGround
			if Ped_AvoidPointReached
				break
			endif
			wait 1 gameframe
		repeat
		goto AVOIDSTATE_LAND
	endscript
	script AVOIDSTATE_LAND
		GetTags
		<maxPissedCount> = RandomRange(2.0,4.0)
		if (<pissed> > <maxPissedCount>)
			Obj_SetInnerAvoidRadius 4
			Obj_SetException {
				ex = SkaterInAvoidRadius
				scr = AVOIDSTATE_KNOCKDOWN
			}
		else
			Obj_SetInnerAvoidRadius 4
			Obj_SetException {
				ex = SkaterInAvoidRadius
				scr = AVOIDSTATE_JUMP
			}
		endif
		if SkaterSpeedLessThan 1
			<stopped> = 1
		else
			<stopped> = 0
		endif
		while
			Obj_GetDistanceToObject Skater
			if (<objectDistance> > 6.0)
				<stopped> = 0
			endif
			if (<stopped> = 1)
				ped_rotate_to_skater_from_idle
				Random(
					@ped_play_disgust_anim
					@ped_play_idle_anim
					@ped_play_idle_anim
				)
			else
				if (<is_moving_ped> = 1)
					ped_rotate_to_node_from_idle
				endif
				break
			endif
		repeat
		while
			Obj_GetDistanceToObject Skater
			if (<objectDistance> > 20.0)
				printf "returning to idle"
				break
			endif
			wait 1 gameframe
		repeat
		ped_initialize_movement
		Ped_RestoreStickToGround
		goto ped_return_to_precollision_state
	endscript
	script AVOIDSTATE_KNOCKDOWN
		Obj_ClearException SkaterInAvoidRadius
		ped_rotate_to_skater_from_idle
		ped_play_attack_anim no_block
		wait 10 gameframes
		Obj_GetOrientationToObject Skater
		if (<dotProd> < 0.5)
			if (<dotProd> > -0.5)
				Obj_GetDistanceToObject Skater
				if (<objectDistance> < 6.0)
					Obj_GetId
					Skater::Obj_GetOrientationToObject <objId>
					Skater::Rotate y = (180.0 - <orientation>)
					MakeSkaterGoto PedKnockDown
					Obj_WaitAnimFinished
				endif
			endif
		endif
		GetTags
		if NOT GotParam stand
			ped_initialize_movement
		endif
		Ped_RestoreStickToGround
		goto ped_return_to_precollision_state
	endscript
	script Ped_FallDownState
		Obj_GetId
		TerminateObjectsScripts id = <objId> script_name = ped_walker_hit_dead_end use_proper_version
		TerminateObjectsScripts id = <objId> script_name = ped_adjust_speed_to_match_anim use_proper_version
		TerminateObjectsScripts id = <objId> script_name = ped_standing_look_at_skater use_proper_version
		TerminateObjectsScripts id = <objId> script_name = ped_skater_start_moving use_proper_version
		Ped_SetLogicState fall
		TerminateObjectsScripts id = <objId> script_name = ped_standing_idle use_proper_version
		GetTags
		Obj_ClearException SkaterInAvoidRadius
		if SkaterSpeedLessThan 1
			goto Ped_DisgustState
		endif
		<pissed> = (<pissed> + 1)
		if (<pissed> > 3)
			SetTags pissed = <pissed>
			goto Ped_KnockDownState
		endif
		Temp_Ped_Fall_Sound
		ped_play_falldown_anim
		Obj_SetOuterAvoidRadius 10
		Obj_SetException {
			ex = SkaterOutOfAvoidRadius
			scr = Ped_GetUpState
		}
		while
			wait Random(@10 @60 @90) frames
			ped_play_layidle_anim
		repeat
		goto Ped_GetUpState
	endscript
	script Ped_ShotState
		Ped_SetLogicState shot
		Obj_GetId
		TerminateObjectsScripts id = <objId> script_name = ped_standing_idle use_proper_version
		GetTags
		Obj_ClearException SkaterInAvoidRadius
		ped_play_falldown_anim
		Obj_SetOuterAvoidRadius 10
		Obj_SetException {
			ex = SkaterOutOfAvoidRadius
			scr = Ped_GetUpState
		}
		while
			wait Random(@10 @60 @90) frames
			ped_play_layidle_anim
		repeat
		goto Ped_GetUpState
	endscript
	script Ped_GetUpState
		GetTags
		Obj_ClearException SkaterOutOfAvoidRadius
		ped_initialize_collision_exceptions
		ped_play_getup_anim
		goto Ped_DisgustState
	endscript
	script Ped_DisgustState
		GetTags
		if NOT (<should_look_at_skater> = 0)
			ped_rotate_to_skater_from_idle
		endif
		ped_play_disgust_anim
		if NOT GotParam stand
			ped_initialize_movement
		endif
		goto ped_return_to_precollision_state
	endscript
	script Ped_KnockDownState
		Ped_StopMoving
		GetTags
		Obj_ClearException SkaterInAvoidRadius
		Obj_LookAtObject type = Skater time = 0.05
		ped_play_attack_anim no_block
		wait 10 gameframes
		if GoalManager_CanStartGoal
			MakeSkaterGoto PedKnockDown
		endif
		Obj_WaitAnimFinished
		ped_rotate_to_skater_from_idle
		goto Ped_DisgustState
	endscript
	script Ped_AvoidState
		GetTags
		Obj_ClearException SkaterInAvoidRadius
		if SkaterSpeedLessThan 1
			goto Ped_DisgustState
		endif
		if SkaterSpeedGreaterThan 700
			goto Ped_FallDownState
		endif
		<pissed> = (<pissed> + 1)
		if (<pissed> > 3)
			goto Ped_KnockDownState
		endif
		Obj_StorePos
		Obj_StoreNode
		Ped_SelectAvoidPoint <AvoidAnims>
		while
			Ped_MoveTowardsAvoidPoint
			if Ped_AvoidPointReached
				break
			endif
			wait 1 gameframe
		repeat
		Obj_PlayAnim anim = <idle> cycle
		ped_rotate_to_skater_from_idle
		ped_play_disgust_anim
		ped_initialize_movement
		goto ped_return_to_precollision_state
	endscript
	script Ped_BumpSkaterState
		GetTags
		Obj_ClearException SkaterInAvoidRadius
		Obj_GetId
		<index> = 0
		while
			printf "Ped_BumpSkaterState %d %e" d = <objId> e = <index>
			<index> = (<index> + 1)
		repeat 10
		goto ped_return_to_precollision_state
		GetSkaterState
		if NOT (<state> = skater_OnGround)
			return
		endif
		if IsHidden
			return
		endif
		root_window::GetTags
		if GotParam giving_rewards
			if (<giving_rewards> = 1)
				return
			endif
		endif
		Obj_ClearException SkaterInAvoidRadius
		Obj_SpawnScript goal_pro_wait_and_reset_avoid_exception params = {goal_id = <goal_id> avoid_radius = <avoid_radius>}
		if Skater::SpeedGreaterThan 200
			if GotParam goal_id
				GoalManager_PlayGoalStream name = <goal_id> type = "avoid" play_random
			endif
			return
		endif
		Skater::GetTags
		if NOT (<racemode> = none)
			return
		endif
		GetTags
		Skater::Obj_GetOrientationToObject <id>
		if (<dotProd> < 0.0)
			if (<dotProd> > -0.1)
				<speed> = 500
				<heading> = 180
			else
				<heading> = 90.0
			endif
		else
			if (<dotProd> < 0.1)
				<speed> = 500
				<heading> = 180
			else
				<heading> = -90
			endif
		endif
		SkaterAvoidGoalPed heading = <heading> speed = <speed>
	endscript
