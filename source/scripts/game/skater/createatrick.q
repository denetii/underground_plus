
	MAX_CREATED_TRICKS = 11
	CAT_BLEND = 0.15000001
	cat_done = 1
	demo_flipped_cat_skater = 0
	Default_CAT_other_info = {name = "" full = 0 can_spin = 1}
	Default_CAT_rotation_info = [
		{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
		{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
		{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
		{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
		{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
		{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
	]
	Default_CAT_animation_info = [
		{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
		{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
		{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
		{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
		{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
		{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
	]
	script get_new_cat_values
		printf "script get_new_cat_values"
		name = ""
		full = 1
		can_spin = 1
		rotation_info = (Default_CAT_rotation_info)
		animation_info = (Default_CAT_animation_info)
		return <...>
	endscript
	script CreateATrick
		printf "CreateATrick"
		GetCurrentSkaterProfileIndex
		change cat_done = 0
		CAT_SetHoldTime 0.0 skater = <currentSkaterProfileIndex>
		CAT_SetAnimsDone 1 skater = <currentSkaterProfileIndex>
		CAT_SetRotsDone 1 skater = <currentSkaterProfileIndex>
		OnExitRun created_trick_cleanup
		get_CAT_param_values skater = 0 trick_index = <trick_index>
		if GotParam demo_loop
			CAT_Skater::Obj_EnableAnimBlending enabled = 1
			CAT_Skater::Obj_SetOrientation y = 0
		else
			ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
			KillExtraTricks
			Bailon
			if GotParam FromGroundGone
				SetEventHandler Ex = Ollied Scr = TrickOllie
			else
				ClearException Ollied
			endif
		endif
		no_rotations = 1
		bailtime = 0
		animtime = 0
		GetArraySize <rotation_info>
		index = 0
		while
			if (((<rotation_info>[<index>]).on) = 1)
				no_rotations = 0
				CAT_SetRotsDone 0 skater = <currentSkaterProfileIndex>
				break
			endif
			index = (<index> + 1)
		repeat <array_size>
		if (<can_spin> = 0)
			if NOT GotParam demo_loop
				NoSpin
			endif
		endif
		index = 0
		if (<no_rotations> = 0)
			while
				if (((<rotation_info>[<index>]).on) = 1)
					Dur = ((<rotation_info>[<index>]).Dur)
					start = ((<rotation_info>[<index>]).start)
					if ((<Dur> + <start>) > <bailtime>)
						bailtime = (<Dur> + <start>)
						last_rot = <index>
					endif
				endif
				index = (<index> + 1)
			repeat <array_size>
			index = 0
			while
				if (((<rotation_info>[<index>]).on) = 1)
					Dur = ((<rotation_info>[<index>]).Dur)
					start = ((<rotation_info>[<index>]).start)
					if (<index> = <last_rot>)
						last = 1
					endif
					spawn_rotation_script {Axis = ((<rotation_info>[<index>]).Axis)
						Deg = ((<rotation_info>[<index>]).Deg)
						Dur = ((<rotation_info>[<index>]).Dur)
						start = ((<rotation_info>[<index>]).start)
						off_x = ((<rotation_info>[<index>]).off_x)
						off_y = ((<rotation_info>[<index>]).off_y)
						off_z = ((<rotation_info>[<index>]).off_z)
						deg_dir = ((<rotation_info>[<index>]).deg_dir)
						last = <last>
						demo_loop = <demo_loop>
					}
				endif
				RemoveParameter last
				index = (<index> + 1)
			repeat <array_size>
		endif
		GetArraySize <animation_info>
		index = 0
		CAT_SetNumAnims 0 skater = <currentSkaterProfileIndex>
		while
			if (((<animation_info>[<index>]).on) = 1)
				GetCurrentSkaterProfileIndex
				CAT_GetNumAnims skater = <currentSkaterProfileIndex>
				CAT_SetNumAnims (<num_animations_on> + 1) skater = <currentSkaterProfileIndex>
			endif
			index = (<index> + 1)
		repeat <array_size>
		count = 1
		anim_order = [0, 0, 0, 0, 0, 0]
		while
			index = 0
			while
				if (((<animation_info>[<index>]).order) = <count>)
					SetArrayElement ArrayName = anim_order index = (<count> -1) newvalue = <index>
					break
				endif
				index = (<index> + 1)
			repeat <array_size>
			count = (<count> + 1)
		repeat <array_size>
		GetCurrentSkaterProfileIndex
		CAT_GetNumAnims skater = <currentSkaterProfileIndex>
		if (<num_animations_on> > 0)
			CAT_SetAnimsDone 0 skater = <currentSkaterProfileIndex>
			Obj_Spawnscript spawned_trick_anim Params = {animation_info = <animation_info>
				array_size = <array_size>
				anim_order = <anim_order>
				demo_loop = <demo_loop>
			}
		endif
		index = 0
		while
			if (((<animation_info>[<index>]).on) = 1)
				if NOT (((<animation_info>[<index>]).trickType) = 4)
					trick_got_idle trick = ((<animation_info>[<index>]).trick)
					if (<got_idle> = 1)
						animtime = (<animtime> + ((<animation_info>[<index>]).Dur) + ((<animation_info>[<index>]).idletime) + ((<animation_info>[<index>]).start))
					else
						animtime = (<animtime> + ((<animation_info>[<index>]).Dur) + ((<animation_info>[<index>]).start))
					endif
				endif
			endif
			index = (<index> + 1)
		repeat <array_size>
		if (<animtime> > <bailtime>)
			bailtime = <animtime>
		endif
		CAT_SetBailDone 0 skater = <currentSkaterProfileIndex>
		Obj_Spawnscript waitforbailoff Params = {time = <bailtime>}
		if NOT GotParam demo_loop
			Obj_Spawnscript cat_update_trick_string Params = {name = <name> bailtime = <bailtime> can_spin = <can_spin>}
		endif
		while
			if GotParam FromGroundGone
				if AirTimeGreaterThan Skater_Late_Jump_Slop
					ClearException Ollied
					RemoveParameter FromGroundGone
				endif
			endif
			CAT_GetBailDone skater = <currentSkaterProfileIndex>
			if (<bailtimescriptdone> = 1)
				break
			endif
			wait 1 gameframe
		repeat
		if GotParam FromGroundGone
			ClearException Ollied
		endif
		if NOT GotParam demo_loop
			Bailoff
			CanSpin
			DoNextTrick
		endif
		while
			CAT_GetAnimsDone skater = <currentSkaterProfileIndex>
			if (<cat_animations_done> = 1)
				break
			endif
			wait 1 gameframe
		repeat
		while
			CAT_GetRotsDone skater = <currentSkaterProfileIndex>
			if (<cat_rotations_done> = 1)
				break
			endif
			wait 1 gameframe
		repeat
		printf "FINISHED CREATEATRICK"
		change cat_done = 1
		if GotParam demo_loop
			if (demo_flipped_cat_skater = 1)
				Obj_Flip
				change demo_flipped_cat_skater = 0
			endif
			return
		endif
		goto Airborne
	endscript
	script spawn_rotation_script Axis = x
		GetCurrentSkaterProfileIndex
		CAT_SetTotalY 0 skater = <currentSkaterProfileIndex>
		CAT_SetTotalX 0 skater = <currentSkaterProfileIndex>
		CAT_SetTotalZ 0 skater = <currentSkaterProfileIndex>
		if (<Axis> = x)
			Obj_Spawnscript RotateOnAxis PauseWithObject Params = {Axis = <Axis>
				Dur = <Dur>
				start_val = <start>
				StartAngle = 0
				EndAngle = <Deg>
				off_x = <off_x>
				off_y = <off_y>
				off_z = <off_z>
				last = <last>
				deg_dir = <deg_dir>
				demo_loop = <demo_loop>
			}
		else
			StartAngle = 0
			EndAngle = <Deg>
			if NOT GotParam demo_loop
				if flipped
					EndAngle = (-1 * <Deg>)
				endif
			endif
			Obj_Spawnscript RotateOnAxis PauseWithObject Params = {Axis = <Axis>
				Dur = <Dur>
				start_val = <start>
				StartAngle = <StartAngle>
				EndAngle = <EndAngle>
				off_x = <off_x>
				off_y = <off_y>
				off_z = <off_z>
				last = <last>
				deg_dir = <deg_dir>
				demo_loop = <demo_loop>
			}
		endif
	endscript
	script RotateOnAxis {off_x = 0 off_y = 30 off_z = 0 Axis = x}
		GetCurrentSkaterProfileIndex
		if GotParam start_val
			wait <start_val> seconds
		endif
		RotationOffset = (((1.0,0.0,0.0) * <off_x>) + ((0.0,1.0,0.0) * <off_y>) + ((0.0,0.0,1.0) * <off_z>))
		if (<deg_dir> = 1)
			EndAngle = (<EndAngle> * -1)
		endif
		RotateDisplay {<Axis>
			Duration = <Dur> seconds
			EndAngle = <EndAngle>
			SinePower = 1
			RotationOffset = <RotationOffset>
			HoldOnLastAngle
		}
		CAT_GetTotalX skater = <currentSkaterProfileIndex>
		CAT_GetTotalY skater = <currentSkaterProfileIndex>
		CAT_GetTotalZ skater = <currentSkaterProfileIndex>
		switch <Axis>
			case x
				total_X_angle = (<total_X_angle> + <EndAngle>)
				CAT_SetTotalX <total_X_angle> skater = <currentSkaterProfileIndex>
			case y
				total_Y_angle = (<total_Y_angle> + <EndAngle>)
				CAT_SetTotalY <total_Y_angle> skater = <currentSkaterProfileIndex>
			case z
				total_Z_angle = (<total_Z_angle> + <EndAngle>)
				CAT_SetTotalZ <total_Z_angle> skater = <currentSkaterProfileIndex>
			default
				printf "CAT: Bad Axis value"
				return
		endswitch
		mod_x = (<total_X_angle> - (<total_X_angle> / 360) * 360)
		mod_y = (<total_Y_angle> - (<total_Y_angle> / 360) * 360)
		mod_z = (<total_Z_angle> - (<total_Z_angle> / 360) * 360)
		if NOT (<mod_y> = 0)
			flip_skater = 1
		else
			flip_skater = 0
		endif
		if NOT (<mod_x> = 0)
			if NOT (<mod_z> = 0)
				if (<flip_skater> = 1)
					flip_skater = 0
				else
					flip_skater = 1
				endif
			endif
		endif
		if (<flip_skater> = 1)
			CAT_SetFlipSkater 1 skater = <currentSkaterProfileIndex>
		else
			CAT_SetFlipSkater 0 skater = <currentSkaterProfileIndex>
		endif
		if GotParam last
			wait <Dur> seconds
			if NOT GotParam demo_loop
				if (<flip_skater> = 1)
					CAT_SetFlipSkater 0 skater = <currentSkaterProfileIndex>
					rotate y = 180
				endif
				CancelRotateDisplay
			endif
			CAT_SetRotsDone 1 skater = <currentSkaterProfileIndex>
		endif
	endscript
	script spawned_trick_anim
		index = 0
		tweak_grab = 99
		anims_played_this_trick = 0
		have_played_real_anim = 0
		GetCurrentSkaterProfileIndex
		while
			if (((<animation_info>[<index>]).on) = 1)
				if (((<animation_info>[<index>]).hold) = 1)
					tweak_grab = <index>
				endif
			endif
			index = (<index> + 1)
		repeat <array_size>
		index = 0
		count = 0
		while
			index = (<anim_order>[<count>])
			if (((<animation_info>[<index>]).on) = 1)
				blend = ((<animation_info>[<index>]).blend)
				from = ((<animation_info>[<index>]).from)
				Dur = ((<animation_info>[<index>]).Dur)
				start = ((<animation_info>[<index>]).start)
				trickType = ((<animation_info>[<index>]).trickType)
				trick = ((<animation_info>[<index>]).trick)
				idletime = ((<animation_info>[<index>]).idletime)
				<backwards> = ((<animation_info>[<index>]).backwards)
				trick_got_idle trick = <trick>
				if NOT IsArray <trick>
					SpecialItem_details = (<trick>.Params.SpecialItem_details)
					SpecialSounds = (<trick>.Params.SpecialSounds)
					Stream = (<trick>.Params.Stream)
				else
					SpecialItem_details = ((<trick>[0]).Params.SpecialItem_details)
					SpecialSounds = ((<trick>[0]).Params.SpecialSounds)
					Stream = ((<trick>[0]).Params.Stream)
				endif
				TurnOffSpecialItem
				if (<trickType> = 4)
					if NOT GotParam demo_loop
						Obj_Spawnscript spawned_cat_sound_script Params = {start = <start> Stream = <Stream>}
					endif
					anims_played_this_trick = (<anims_played_this_trick> + 1)
					GetCurrentSkaterProfileIndex
					CAT_GetNumAnims skater = <currentSkaterProfileIndex>
					printf "	played %p / %o anims" p = <anims_played_this_trick> o = <num_animations_on>
					if (<anims_played_this_trick> = <num_animations_on>)
						Obj_Spawnscript are_cat_anims_done Params = {no_wait flip_skater = <flip_skater> demo_loop = <demo_loop>}
						return
					endif
				else
					if (<got_idle> = 1)
						if NOT IsArray <trick>
							anim = (<trick>.Params.anim)
							idle = (<trick>.Params.idle)
							if StructureContains structure = (<trick>.Params) outanim
								outanim = (<trick>.Params.outanim)
							endif
						else
							anim = ((<trick>[0]).Params.anim)
							idle = ((<trick>[0]).Params.idle)
							if StructureContains structure = ((<trick>[0]).Params) outanim
								outanim = ((<trick>[0]).Params.outanim)
							endif
						endif
						if GotParam outanim
							GetAnimLength anim = <outanim>
							out_length = <length>
						endif
						GetAnimLength anim = <anim>
						if NOT GotParam out_length
							out_length = <length>
						endif
						total_length = (<length> + <out_length>)
						percent = ((<animation_info>[<index>]).percent)
						if (<percent> > 1)
							percent = 1
						endif
						from_seconds = (<from> * (<total_length> / 2.0) * 60)
						to_seconds = (<percent> * (<total_length> / 2.0) * 60)
						in_ratio = (<length> / <total_length>)
						out_ratio = (1.0 - <in_ratio>)
						if ((<in_ratio> = 0) || (<out_ratio> = 0))
							printf "CAT: bad ratio"
							return
						endif
						speed = ((<length> * (1.0 - <from>)) / (<in_ratio> * <Dur>))
						speed2 = ((<out_length> * <percent>) / (<out_ratio> * <Dur>))
						if (0 > <to_seconds>)
							to_seconds = 0
						endif
						blend_seconds = (<blend> * <speed>)
						if NOT (<start> = 0)
							wait <start> seconds
						endif
						if GotParam SpecialItem_details
							printf "I have a special item"
							TurnOnSpecialItem SpecialItem_details = <SpecialItem_details>
						endif
						if NOT GotParam demo_loop
							if GotParam SpecialSounds
								Obj_Spawnscript <SpecialSounds>
							endif
							if GotParam Stream
								Obj_PlayStream <Stream> vol = 250
							endif
						endif
						if NOT (<speed> = 0)
							if NOT (<have_played_real_anim> = 0)
								Obj_PlayAnim {anim = <anim> speed = <speed> from = <from_seconds>}
							else
								Obj_PlayAnim {anim = <anim> speed = <speed> from = <from_seconds> blendperiodpercent = 0}
							endif
						endif
						if NOT IsArray <trick>
							Out_Params = (<trick>.Params)
						else
							Out_Params = ((<trick>[0]).Params)
						endif
						if NOT (<speed> = 0)
							WaitAnimFinished
						endif
						if NOT (<idletime> = 0)
							Obj_PlayAnim anim = <idle> cycle xblendperiodpercent = 0
							wait <idletime> seconds
							if (<index> = <tweak_grab>)
								if NOT GotParam demo_loop
									while
										if Released Circle
											if Released Square
												break
											endif
										endif
										CAT_GetHoldTime skater = <currentSkaterProfileIndex>
										CAT_SetHoldTime (<cat_hold_time> + (1.0 / 60.0)) skater = <currentSkaterProfileIndex>
										WaitOneGameFrame
										TweakTrick GRABTWEAK_MEDIUM
									repeat
									CAT_GetHoldTime skater = <currentSkaterProfileIndex>
									printf "	cat_hold_time = %c" c = <cat_hold_time>
								endif
							endif
						endif
						CATReleased_SquareOrCircle <Out_Params> speed = <speed2> To = <to_seconds> blend = (100 * <blend>)
					else
						if NOT IsArray <trick>
							anim = (<trick>.Params.anim)
						else
							anim = ((<trick>[0]).Params.anim)
						endif
						if NOT GotParam anim
							if StructureContains structure = (<trick>.Params) initanim
								anim = (<trick>.Params.initanim)
							else
								printf "back trick... no anim"
								return
							endif
						endif
						percent = ((<animation_info>[<index>]).percent)
						if (<percent> > 1)
							percent = 1
						endif
						GetAnimLength anim = <anim>
						from_seconds = (<from> * <length> * 60)
						to_seconds = (<percent> * <length> * 60)
						total_percent = (<percent> - <from>)
						if NOT (<Dur> = 0)
							speed = (((<length> * <total_percent>)) / <Dur>)
						else
							speed = 1
						endif
						if (0 > <speed>)
							speed = (<speed> * -1)
						endif
						if (<backwards> = 1)
							temp = <to_seconds>
							to_seconds = <from_seconds>
							from_seconds = <temp>
						endif
						if NOT (<start> = 0)
							wait <start> seconds
						endif
						if GotParam SpecialItem_details
							printf "I have a special item"
							TurnOnSpecialItem SpecialItem_details = <SpecialItem_details>
						endif
						if NOT GotParam demo_loop
							if GotParam SpecialSounds
								Obj_Spawnscript <SpecialSounds>
							endif
							if GotParam Stream
								Obj_PlayStream <Stream> vol = 250
							endif
						endif
						if (<have_played_real_anim> = 0)
							blendperiodpercent = 0
						else
							blendperiodpercent = (<blend> * 100)
						endif
						if NOT (<speed> = 0)
							Obj_PlayAnim {anim = <anim> speed = <speed> blendperiodpercent = <blendperiodpercent> from = <from_seconds> To = <to_seconds>}
						endif
					endif
					if IsArray <trick>
						trick_params = ((<trick>[0]).Params)
					else
						trick_params = (<trick>.Params)
					endif
					if StructureContains BoardRotate structure = <trick_params>
						BlendperiodOut 0
						if NOT GotParam demo_loop
							BoardRotateAfter
						endif
					endif
					if StructureContains RotateAfter structure = <trick_params>
						printf "skater should flip"
						BlendperiodOut 0
						flip_skater = 1
					endif
					if StructureContains FlipAfter structure = <trick_params>
						BlendperiodOut 0
						if NOT GotParam demo_loop
							Flip
						else
							Obj_Flip
							if (demo_flipped_cat_skater = 0)
								change demo_flipped_cat_skater = 1
							else
								change demo_flipped_cat_skater = 0
							endif
						endif
					endif
					anims_played_this_trick = (<anims_played_this_trick> + 1)
					have_played_real_anim = 1
					GetCurrentSkaterProfileIndex
					CAT_GetNumAnims skater = <currentSkaterProfileIndex>
					printf "	played %p / %o anims" p = <anims_played_this_trick> o = <num_animations_on>
					if NOT (<anims_played_this_trick> = <num_animations_on>)
						if NOT GotParam speed2
							if NOT (<speed> = 0)
								WaitAnimFinished
							endif
						else
							if NOT (<speed2> = 0)
								WaitAnimFinished
							endif
						endif
						if GotParam flip_skater
							if NOT GotParam demo_loop
								rotate y = 180
							else
								Obj_SetOrientation y = 180
							endif
							RemoveParameter flip_skater
						endif
					endif
				endif
			endif
			RemoveParameter anim
			RemoveParameter outanim
			RemoveParameter out_length
			RemoveParameter in_ratio
			RemoveParameter out_ratio
			RemoveParameter percent
			RemoveParameter speed2
			RemoveParameter SpecialItem_details
			RemoveParameter SpecialSounds
			RemoveParameter Stream
			count = (<count> + 1)
		repeat <array_size>
		Obj_Spawnscript are_cat_anims_done Params = {flip_skater = <flip_skater> demo_loop = <demo_loop>}
		printf "	finished CAT anim"
	endscript
	script are_cat_anims_done
		if NOT GotParam no_wait
			WaitAnimFinished
		endif
		TurnOffSpecialItem
		if GotParam flip_skater
			if NOT GotParam demo_loop
				rotate y = 180
			else
			endif
		endif
		GetCurrentSkaterProfileIndex
		CAT_SetAnimsDone 1 skater = <currentSkaterProfileIndex>
	endscript
	script trick_got_idle
		if IsArray <trick>
			if StructureContains structure = ((<trick>[0]).Params) idle
				got_idle = 1
			else
				got_idle = 0
			endif
		else
			if StructureContains structure = (<trick>.Params) idle
				got_idle = 1
			else
				got_idle = 0
			endif
		endif
		return got_idle = <got_idle>
	endscript
	script CATReleased_SquareOrCircle from = 0
		printf "		script CATReleased_SquareOrCircle"
		if (<speed> = 0)
			return
		endif
		if GotParam outanim
			printf "			OutAnim"
			Obj_PlayAnim anim = <outanim> blendperiodpercent = <blend> speed = <speed> from = <from> To = <To>
		else
			if GotParam BackwardsAnim
				printf "			BackwardsAnim"
				Obj_PlayAnim anim = <BackwardsAnim> backwards blendperiodpercent = <blend> speed = <speed> from = <from> To = <To>
			else
				if AnimEquals Airwalk
					printf "			Airwalk"
					Obj_PlayAnim anim = <anim> from = Current To = 0 blendperiodpercent = <blend> speed = <speed>
				else
					printf "			Other"
					Obj_PlayAnim anim = <anim> backwards speed = <speed> from = <from> To = <To> blendperiodpercent = <blend>
				endif
			endif
		endif
	endscript
	script spawned_cat_sound_script
		if NOT (<start> = 0)
			wait <start> seconds
		endif
		if GotParam Stream
			Obj_PlayStream <Stream> vol = 250
		endif
	endscript
	script waitforbailoff
		time_passed = 0.0
		bail_point = (<time> * 0.2)
		time = (<time> - <bail_point>)
		GetCurrentSkaterProfileIndex
		CAT_GetHoldTime skater = <currentSkaterProfileIndex>
		printf "	cat_hold_time=%c time=%t bail_point=%b" c = <cat_hold_time> t = <time> b = <bail_point>
		while
			if ((<time_passed> > (<time> + <cat_hold_time>)) || (<time_passed> = (<time> + <cat_hold_time>)))
				break
			endif
			WaitOneGameFrame
			time_passed = (<time_passed> + (1.0 / 60.0))
			CAT_GetHoldTime skater = <currentSkaterProfileIndex>
		repeat
		printf "	time_passed = %t" t = <time_passed>
		CAT_SetBailDone 1 skater = <currentSkaterProfileIndex>
	endscript
	script cat_update_trick_string
		wait 15 gameframes
		if (<name> = "")
			name = "Created Trick"
		endif
		SetTrickName <name>
		cat_get_score_from_bailtime bailtime = <bailtime> can_spin = <can_spin>
		SetTrickScore <Score>
		Display cat
		LaunchSpecialMessage
	endscript
	script created_trick_cleanup
		KillSpawnedScript name = CreateATrick
		change cat_done = 1
		KillSpawnedScript name = RotateOnAxis
		KillSpawnedScript name = spawned_trick_anim
		KillSpawnedScript name = spawned_cat_sound_script
		KillSpawnedScript name = waitforbailoff
		KillSpawnedScript name = cat_update_trick_string
		CancelRotateDisplay
		CAT_GetFlipSkater skater = <currentSkaterProfileIndex>
		if (<cat_flip_skater_180> = 1)
			CAT_SetFlipSkater 0 skater = <currentSkaterProfileIndex>
			rotate y = 180
		endif
		TurnOffSpecialItem
		CanSpin
		if ScreenElementExists id = timeline_anchor
			DestroyScreenElement id = timeline_anchor
		endif
	endscript
	script checkbailon
		if BailIsOn
			printf "BAIL IS ON"
		else
			printf "BAIL IS OFF"
		endif
	endscript
	script set_new_rot_values trick_index = 0
		printf "script set_new_rot_values"
		GetCreateATrickRotations skater = 0 trick_index = <trick_index>
		SetArrayElement ArrayName = rotation_info index = <rot_index> newvalue = {on = <on> Deg = <Deg> Axis = <Axis> Dur = <Dur> start = <start> deg_dir = <deg_dir>}
		SetCreateATrickRotations {trick_index = <trick_index>
			rotation_info = <rotation_info>
		}
	endscript
	script quick_set_anim_values
		set_new_anim_values {anim_index = <anim_index> on = <on> trick = <trick> anim = <anim> Dur = <Dur> percent = <percent> blend = <blend> from = <from> trickType = <trickType> idletime = <idletime> start = <start> order = <order> hold = <hold> backwards = <backwards>}
	endscript
	script set_new_anim_values trick_index = 0
		printf "script set_new_anim_values"
		GetCreateATrickAnimations trick_index = <trick_index>
		SetArrayElement ArrayName = animation_info index = <anim_index> newvalue = {on = <on> trick = <trick> Dur = <Dur> percent = <percent> blend = <blend> from = <from> trickType = <trickType> idletime = <idletime> start = <start> order = <order> hold = <hold> backwards = <backwards>}
		SetCreateATrickAnimations {
			trick_index = <trick_index>
			animation_info = <animation_info>
		}
	endscript
	script set_new_CAT_param_values
		printf "script set_new_CAT_param_values"
		other_params = {name = <name> can_spin = <can_spin> full = <full>}
		SetCreateATrickOtherParams {trick_index = <trick_index>
			other_params = <other_params>
		}
	endscript
	script get_CAT_param_values trick_index = 0
		printf "script get_CAT_param_values"
		if GetCreateATrickParams {trick_index = <trick_index>}
			name = (<other_params>.name)
			can_spin = (<other_params>.can_spin)
			full = (<other_params>.full)
			return <...>
		endif
	endscript
	script get_CAT_rot_values trick_index = 0 rot_index = 0
		printf "script get_CAT_rot_values"
		if GetCreateATrickRotations {trick_index = <trick_index>}
			return (<rotation_info>[<rot_index>])
		endif
	endscript
	script get_CAT_anim_values trick_index = 0 anim_index = 0
		printf "script get_CAT_anim_values"
		if GetCreateATrickAnimations {trick_index = <trick_index>}
			return (<animation_info>[<anim_index>])
		endif
	endscript
	script get_CAT_other_param_values
		printf "script get_CAT_other_param_values"
		if GetCreateATrickOtherParams {trick_index = <trick_index>}
			name = (<other_params>.name)
			can_spin = (<other_params>.can_spin)
			full = (<other_params>.full)
			return <...>
		endif
	endscript
	script print_out_cat index = 0
		get_CAT_param_values trick_index = <index>
		printstruct <...>
	endscript
	script print_out_cat2 index = 1
		get_CAT_other_param_values trick_index = <index>
		printstruct <...>
	endscript
	Premade_CATS = [
		{name = "Bender Flip"
			can_spin = 1
			full = 1
			rotation_info = [
				{on = 1 Axis = z Deg = 360 Dur = 1.10000002 start = CAT_BLEND deg_dir = 0}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
			]
			animation_info = [
				{on = 1 trick = Trick_FlyingSquirrel Dur = 1.60000002 blend = CAT_BLEND from = 0 percent = 1 trickType = 2 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
			]
		}
		{name = "Nut Buster"
			can_spin = 1
			full = 1
			rotation_info = [
				{on = 1 Deg = 360 Axis = z Dur = 1.0 start = 0.0 deg_dir = 0}
				{on = 1 Deg = 180 Axis = y Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Deg = 360 Axis = y Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Deg = 360 Axis = y Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Deg = 360 Axis = y Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Deg = 360 Axis = y Dur = 1.0 start = 0.0 deg_dir = 1}
			]
			animation_info = [
				{on = 1 trick = Trick_SackTap Dur = 0.89999902 percent = 1.0 blend = CAT_BLEND from = 0.5 trickType = 1 idletime = 0.1 start = 0 order = 1 hold = 1 backwards = 0}
				{on = 2 trick = Trick_SackTap Dur = 0.5 percent = 1.0 blend = CAT_BLEND from = 0.5 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
			]
		}
		{name = "Soul Skating"
			can_spin = 0
			full = 1
			rotation_info = [
				{on = 1 Axis = y Deg = 720 Dur = 1.29999995 start = 0.0 deg_dir = 0}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
			]
			animation_info = [
				{on = 1 trick = Trick_Seatbelt Dur = 0.30000001 blend = CAT_BLEND from = 0 percent = 0.5 trickType = 1 idletime = 0.40000001 start = 0 order = 2 hold = 0 backwards = 0}
				{on = 1 trick = Extra360ShoveIt Dur = 0.60000002 blend = CAT_BLEND from = 0.25999999 percent = 1 trickType = 0 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
			]
		}
		{name = "Heelflip Barrel"
			can_spin = 0
			full = 1
			rotation_info = [
				{on = 1 Axis = z Deg = 180 Dur = 1.0 start = 0.0 deg_dir = 0}
				{on = 1 Axis = z Deg = 180 Dur = 0.5 start = 0.80000001 deg_dir = 0}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
			]
			animation_info = [
				{on = 1 trick = trick_QuadrupleHeelFlip Dur = 0.80000001 blend = CAT_BLEND from = 0 percent = 1 trickType = 2 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
				{on = 1 trick = Trick_Heelflip Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 0 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
			]
		}
		{name = "Layback Casper"
			can_spin = 1
			full = 1
			rotation_info = [
				{on = 1 Axis = x Deg = 180 Dur = 1.5 start = 0.0 deg_dir = 1}
				{on = 1 Axis = x Deg = 180 Dur = 0.5 start = 1.0 deg_dir = 0}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
			]
			animation_info = [
				{on = 1 trick = Trick_AirCasperFlip Dur = 1.10000002 blend = CAT_BLEND from = 0 percent = 1 trickType = 2 idletime = 0.40000001 start = 0 order = 1 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
			]
		}
		{name = "360 BodyVarial Kickflip"
			can_spin = 0
			full = 1
			rotation_info = [
				{on = 1 Axis = y Deg = 360 Dur = 0.60000002 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
			]
			animation_info = [
				{on = 1 trick = Extra_VarialKickflip Dur = 0.60000002 blend = CAT_BLEND from = 0 percent = 1 trickType = 0 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
			]
		}
		{name = "Double Barrel"
			can_spin = 1
			full = 1
			rotation_info = [
				{on = 1 Axis = z Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
			]
			animation_info = [
				{on = 1 trick = Trick_BarrelRoll Dur = 1.10000002 blend = CAT_BLEND from = 0 percent = 1 trickType = 2 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
			]
		}
		{name = "Kickflip Method"
			can_spin = 1
			full = 1
			rotation_info = [
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
			]
			animation_info = [
				{on = 1 trick = CATTrick_KickflipBS Dur = 0.30000001 blend = CAT_BLEND from = 0 percent = 1 trickType = 0 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
				{on = 1 trick = Trick_Method Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0.1 start = 0 order = 2 hold = 1 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
			]
		}
		{name = "Flamingo Twist"
			can_spin = 0
			full = 1
			rotation_info = [
				{on = 1 Axis = y Deg = 360 Dur = 0.69999999 start = 0.2 deg_dir = 0}
				{on = 1 Axis = y Deg = 360 Dur = 0.60000002 start = 0.89999998 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
			]
			animation_info = [
				{on = 1 trick = Trick_Flamingo Dur = 1.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 2 idletime = 0 start = 0 order = 1 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
			]
		}
		{name = "Misty In Back Out"
			can_spin = 0
			full = 1
			rotation_info = [
				{on = 1 Axis = z Deg = 360 Dur = 0.80000001 start = 0.0 deg_dir = 1}
				{on = 1 Axis = y Deg = 180 Dur = 0.80000001 start = 0.0 deg_dir = 1}
				{on = 1 Axis = z Deg = 360 Dur = 0.60000002 start = 0.60000002 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
				{on = 2 Axis = y Deg = 360 Dur = 1.0 start = 0.0 deg_dir = 1}
			]
			animation_info = [
				{on = 1 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0.69999999 start = 0 order = 1 hold = 1 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 2 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 3 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 4 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 5 hold = 0 backwards = 0}
				{on = 2 trick = trick_indy Dur = 0.5 blend = CAT_BLEND from = 0 percent = 1 trickType = 1 idletime = 0 start = 0 order = 6 hold = 0 backwards = 0}
			]
		}
	] 
