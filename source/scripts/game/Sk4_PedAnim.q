
	script pedanim_init
		SetTags <...>
	endscript
	script ped_play_impressed_anim
		GetTags
		GetArraySize <impressedAnims>
		GetRandomValue name = index integer a = 0 b = (<array_size> - 1)
		Obj_PlayAnim Anim = ((<impressedAnims>)[<index>])
		if NOT gotparam no_block
			Obj_WaitAnimFinished
		endif
	endscript
	script ped_play_bored_anim
		GetTags
		GetArraySize <boredAnims>
		GetRandomValue name = index integer a = 0 b = (<array_size> - 1)
		Obj_PlayAnim Anim = ((<boredAnims>)[<index>])
		if NOT gotparam no_block
			Obj_WaitAnimFinished
		endif
	endscript
	script ped_play_wave_anim
		GetTags
		if Obj_AnimEquals <Idle>
			Obj_PlayAnim Anim = <wave>
			if NOT gotparam no_block
				Obj_WaitAnimFinished
			endif
		endif
	endscript
	script ped_play_idle_anim
		GetTags
		GetArraySize <idleAnims>
		GetRandomValue name = index integer a = 0 b = (<array_size> - 1)
		Obj_PlayAnim Anim = ((<idleAnims>)[<index>])
		if NOT gotparam no_block
			Obj_WaitAnimFinished
		endif
	endscript
	script ped_play_disgust_anim
		GetTags
		GetArraySize <disgustAnims>
		GetRandomValue name = index integer a = 0 b = (<array_size> - 1)
		Obj_PlayAnim Anim = ((<disgustAnims>)[<index>])
		if NOT gotparam no_block
			Obj_WaitAnimFinished
		endif
	endscript
	script ped_play_attack_anim
		GetTags
		GetArraySize <attackAnims>
		GetRandomValue name = index integer a = 0 b = (<array_size> - 1)
		Obj_PlayAnim Anim = ((<attackAnims>)[<index>])
		if NOT gotparam no_block
			Obj_WaitAnimFinished
		endif
	endscript
	script ped_play_falldown_anim
		GetTags
		GetArraySize <fallDownAnims>
		GetRandomValue name = index integer a = 0 b = (<array_size> - 1)
		Obj_PlayAnim Anim = ((<fallDownAnims>)[<index>])
		SetTags fallDownAnimIndex = <index>
		if NOT gotparam no_block
			Obj_WaitAnimFinished
		endif
	endscript
	script ped_play_layidle_anim
		GetTags
		if NOT gotparam fallDownAnimIndex
			GetArraySize <layIdleAnims>
			GetRandomValue name = fallDownAnimIndex integer a = 0 b = (<array_size> - 1)
		endif
		Obj_PlayAnim Anim = ((<layIdleAnims>)[<fallDownAnimIndex>])
		if NOT gotparam no_block
			Obj_WaitAnimFinished
		endif
	endscript
	script ped_play_getup_anim
		GetTags
		if NOT gotparam fallDownAnimIndex
			GetArraySize <getupAnims>
			GetRandomValue name = fallDownAnimIndex integer a = 0 b = (<array_size> - 1)
		endif
		Obj_PlayAnim Anim = ((<getupAnims>)[<fallDownAnimIndex>])
		if NOT gotparam no_block
			Obj_WaitAnimFinished
		endif
	endscript
	script ped_play_knockdown_reaction_anim
		GetTags
		GetArraySize <knockdownReactionAnims>
		GetRandomValue name = index integer a = 0 b = (<array_size> - 1)
		Obj_PlayAnim Anim = ((<knockdownReactionAnims>)[<index>])
		if NOT gotparam no_block
			Obj_WaitAnimFinished
		endif
	endscript
	script ped_initialize_movement
		GetTags
		if (<is_moving_ped> = 1)
			Obj_SetPathTurnDist 2.5 feet
			if gotparam skater
				if NOT gotparam speed
					speed = 25
				endif
				Obj_SetPathVelocity <speed> fps
				Obj_SpawnScript ped_skater_idle
			else
				if NOT gotparam speed
					speed = RandomRange(5.0,10.0)
				endif
				Obj_SetPathVelocity <speed> fps
				Obj_PlayAnim Anim = <IdleToWalk>
				Obj_WaitAnimFinished
				if gotparam WalkAnims
					GetRandomArrayElement <WalkAnims>
					<walk> = <element>
					SetTags walk = <walk>
				endif
				Obj_PlayAnim Anim = <walk> Cycle UseAnimTags
				GetTags
				if gotparam animTags
					ped_adjust_speed_to_match_anim <animTags>
				endif
			endif
			if gotparam PathToFollow
			else
			endif
			if gotparam PathToFollow
			else
			endif
		else
			ped_standing_idle
		endif
	endscript
	script ped_start_movement
		GetTags
		if (<is_moving_ped> = 1)
			if NOT Obj_AnimEquals <walk>
				Obj_SetAnimCycleMode off
				Obj_WaitAnimFinished
				ped_rotate_to_node_from_idle
				Obj_SetAnimCycleMode off
				Obj_PlayAnim Anim = <IdleToWalk>
				Obj_WaitAnimFinished
			else
			endif
			Obj_PlayAnim Anim = <walk> Cycle
		else
			Obj_PlayAnim Anim = <Idle> Cycle
		endif
	endscript
	script ped_stop_movement
		GetTags
		<playing_walk_anim> = 0
		if Obj_AnimEquals <walk>
			<playing_walk_anim> = 1
		endif
		if Obj_AnimEquals <WalkingWave>
			<playing_walk_anim> = 1
		endif
		if (<playing_walk_anim> = 1)
			Obj_SetAnimCycleMode off
			Obj_WaitAnimFinished
			Obj_PlayAnim Anim = <WalkToIdle>
			Obj_WaitAnimFinished
		endif
	endscript
	script ped_rotate_to_skater_from_idle time = 0.30000001
		GetTags
		if Obj_AngleToNearestSkaterGreaterThan 15
			if Obj_LookAtObject type = skater time = <time>
				Obj_PlayAnim Anim = <RotateFromIdle1>
				Obj_WaitRotate
				Obj_SetAnimCycleMode off
				Obj_WaitAnimFinished
			endif
		endif
	endscript
	script ped_rotate_to_node_from_idle time = 0.30000001
		GetTags
		if Obj_LookAtNodeLinked time = <time>
			Obj_PlayAnim Anim = <RotateFromIdle1>
			Obj_WaitRotate
			Obj_SetAnimCycleMode off
			Obj_WaitAnimFinished
		endif
	endscript
	script ped_in_front_of_skater
		<retVal> = 0
		Obj_GetOrientationToObject skater
		if (<dotProd> < 0.5)
			if (<dotProd> > -0.5)
				<retVal> = 1
			endif
		endif
		return in_front = <retVal>
	endscript
	script ped_pass_ped
		Obj_StopAlongPath
		Ped_SetLogicState pass_ped
	endscript
	script ped_pass_ped_finish
		Ped_SetLogicState Idle
		Obj_SetPathVelocity <vel> ips
		Obj_StartAlongPath
		Obj_SetPathAcceleration 10000
		Obj_StoreNode
		Obj_FollowPathStored
	endscript
	script ped_wait_to_pass_ped
		Ped_SetLogicState waiting_to_pass_ped
		Obj_SetPathDeceleration 100
		Obj_SetPathVelocity <lead_ped_vel> ips
	endscript
