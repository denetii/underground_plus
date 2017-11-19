
	script Ped_IdleState
		GetTags
		ped_start_movement
		Ped_SetLogicState generic
	endscript
	script Ped_ReactionState
		Ped_SetLogicState none
		GetTags
		switch <talking_mode>
			case friendly
				<should_wave> = 1
				<should_stop> = 0
			default
				<should_wave> = 0
				<should_stop> = 1
		endswitch
		if (<should_stop> = 1)
			ped_stop_movement
		endif
		while
			if (<is_moving_ped> = 1)
				if (<should_wave> = 1)
					ped_walking_wave
				else
					ped_wave
				endif
			else
				ped_wave
			endif
			Obj_GetDistanceToObject Skater
			if (<objectDistance> > <talking_radius>)
				goto Ped_IdleState
			endif
			wait 1 gameframe
		repeat
	endscript
	script ped_walking_wave
		GetTags
		ped_in_front_of_skater
		if (<in_front>)
			Random(
				@Obj_PlayAnim Anim = <WalkingWave>
				@Obj_PlayAnim Anim = <Walk>
				@Obj_PlayAnim Anim = <Walk>
				@Obj_PlayAnim Anim = <Walk>
				@Obj_PlayAnim Anim = <Walk>
			)
		else
			Obj_PlayAnim Anim = <Walk>
		endif
		Obj_WaitAnimFinished
	endscript
	script ped_wave
		GetTags
		ped_rotate_to_skater_from_idle
		switch <talking_mode>
			case friendly
				Obj_PlayAnim Anim = <Wave>
				Obj_WaitAnimFinished
			case mean
				ped_play_disgust_anim
		endswitch
	endscript
