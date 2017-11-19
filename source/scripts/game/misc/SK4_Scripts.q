
	script ScottKills
		sk3_killskater deathsound = boneless09 message1 = "poopoo" message2 = "waaaaa" message3 = "yowsers" message4 = "Cheesy Peasey likes ass" r = 0 g = 255 b = 0
	endscript
	script sk3_killskater
		if Obj_FlagNotSet FLAG_SKATER_KILLING
			Obj_SetFlag FLAG_SKATER_KILLING
			InBail
			if GotParam deathsound
				PlaySound <deathsound>
			else
				PlaySound BailBodyPunch01_11
				PlaySound BailSlap01
				PlaySound BailBodyFall01
			endif
			if NOT GotParam NoMessage
				if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
					if NOT InSplitScreenGame
						if GotParam message1
							Create_Panel_Message style = panel_message_death id = death_message text = Random(
								@<message1>
								@<message2>
								@<message3>
								@<message4>)
						else
							if Driving
								Create_Panel_Message style = panel_message_death id = death_message text = Random(
									@"Don't drink and drive!"
									@"Learn to drive!"
									@*2 "Out of bounds!")
							else
								Create_Panel_Message style = panel_message_death id = death_message text = Random(
									@"You suck!"
									@"Don't do drugs!"
									@"Stay in school!"
									@"This is your brain on drugs!"
									@"Nice one!"
									@"Good one!"
									@"Hmmmmm..."
									@"Loser!"
									@"Who loaned you that board?"
									@*4 "Out of bounds!")
							endif
						endif
					endif
				endif
			endif
			SK3_Killskater_Finish <...>
		endif
	endscript
	script SK3_KillSkater_Water
		if Obj_FlagNotSet FLAG_SKATER_KILLING
			Obj_SetFlag FLAG_SKATER_KILLING
			if GotParam deathsound
				PlaySound <deathsound>
			else
				PlaySound FallWater
			endif
			if NOT InSplitScreenGame
				if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
					if GotParam message1
						Create_Panel_Message style = panel_message_death id = death_message text = Random(
							@<message1>
							@<message2>
							@<message3>
							@<message4>)
					else
						Create_Panel_Message style = panel_message_death id = death_message text = Random(
							@"All wet"
							@"You big drip!"
							@"WATER... BAAAD!"
							@"No swimming"
							@"You're drowning!"
							@"You're hosed!")
					endif
				endif
			endif
			SK3_Killskater_Finish water r = 100 g = 100 b = 200 <...>
		endif
	endscript
	script SK3_KillSkater_Pungee
		if Obj_FlagNotSet FLAG_SKATER_KILLING
			Obj_SetFlag FLAG_SKATER_KILLING
			PlaySound FallPungee_11
			if NOT InSplitScreenGame
				if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
					if NOT GotParam Lava
						Create_Panel_Message style = panel_message_death id = death_message text = Random(
							@"You got shafted"
							@"Who built that?!"
							@"Serve, set, spike!"
							@"Shish kabob?"
							@"Don't build this at home!")
					else
						Create_Panel_Message style = panel_message_death id = death_message text = Random(
							@"Toasted toes!"
							@"Burnt to a crisp!"
							@"Grilled to perfection!"
							@"Ouch!"
							@"Death by hot lava!")
					endif
				endif
			endif
			SK3_Killskater_Finish r = 150 g = 50 b = 50 <...>
		endif
	endscript
	script SK4_Hide_Death_Message
		if ObjectExists id = death_message
			SetScreenElementProps id = death_message rgba = [0 0 0 0]
		endif
	endscript
	script SK3_Killskater_Finish r = 255 g = 255 b = 255
		if NOT Driving
			Obj_GetID
			LaunchEvent type = KillingSkater target = <objId>
		endif
		DisablePlayerInput
		if GotParam Bail
			if Skating
				MakeSkaterGoto Killskater_Bail
			endif
		endif
		pulse_blur start = 0 end = 255 speed = 4
		if GotParam water
			SkaterSplashOn
			PausePhysics
			Hide
			if ObjectExists id = PlayerVehicle
				PlayerVehicle::Hide
			endif
			wait 0.1 seconds
		else
			wait 0.25 seconds
		endif
		ClearTrickQueues
		wait 1 gameframe
		BlendPeriodOut 0
		ClearEventBuffer
		BailSkaterTricks
		if NOT Driving
			if GotParam Nodename
				KillSkater node = <Nodename>
			else
				KillSkater
			endif
		else
			PlayerVehicle::Vehicle_MoveToRestart <Nodename>
			PlayerVehicleCamera::VehicleCamera_Reset
			PlayerVehicle::Unhide
			if PlayerVehicle::Vehicle_IsSkaterVisible
				Unhide
			endif
		endif
		if InNetGame
			if GameModeEquals is_goal_attack
				if NOT GameIsOver
					speech_box_exit
				endif
			endif
		else
			speech_box_exit
		endif
		ResetSkaterParticleSystems
		pulse_blur start = 255 end = 0 speed = 4
		wait 0.75 seconds
		NotInBail
		Obj_ClearFlag FLAG_SKATER_KILLING
		if GoalManager_HasActiveGoals
			if GoalManager_GetActiveGoalId
				GoalManager_GetGoalParams name = <goal_id>
				if GotParam horse
					GoalManager_LoseGoal name = <goal_id>
				endif
			endif
		endif
	endscript
	script panel_message_death
		Domorph pos = (320.0,80.0) alpha = 0 scale = 0
		Domorph alpha = 1 time = 0.25 scale = 1.29999995
		Domorph time = 0.15000001 scale = 1
		wait 2 seconds
		Domorph scale = 1.29999995 time = 0.15000001
		Domorph alpha = 0 time = 0.25 scale = 0
		Die
	endscript
	script Killskater_Bail
		PlayAnim Anim = SlipForwards BlendPeriod = 0.30000001
	endscript
	script SK3_TeleportToNode
		TeleportSkaterToNode <...>
	endscript
	script TeleportSkaterToNode r = 255 g = 255 b = 255
		if GotParam message1
			LaunchPanelMessage properties = panel_message_death Random(
				@<message1>
			)
		else
			LaunchPanelMessage properties = panel_message_death "On the Move!"
		endif
		if GotParam Nodename
			printf "Got the nodename ...................."
			if Skating
				if OnRail
					ClearEventBuffer
					ClearTrickQueue
					KillExtraTricks
					ClearExtraGrindTrick
					StopBalanceTrick
					MakeSkaterGoto GroundGone
				endif
			endif
			Obj_MoveToNode name = <Nodename> Orient NoReset
		else
			LaunchPanelMessage properties = panel_message_death "ERROR! Please pass in nodename="
		endif
		wait 0.25 seconds
	endscript
	script PrepareSkaterForMove
		if Skating
			SetState AIR
			CleanUpSpecialItems
			StopBalanceTrick
			MakeSkaterGoto GroundGone
			LandSkaterTricks
			ClearEventBuffer
		endif
	endscript
	script TeleportSkaterUp dist = 2000
		Skater::SparksOff
		Skater::Move y = <dist>
	endscript
	script TeleportSkaterDown dist = -2000
		Skater::SparksOff
		Skater::Move y = <dist>
	endscript
	script MoveSkaterZ dist = 0
		SparksOff
		Move y = <dist>
	endscript
	FLAG_TRAFFICLIGHT_GREEN = 0
	FLAG_TRAFFICLIGHT_YELLOW = 1
	FLAG_TRAFFICLIGHT_RED = 2
	FLAG_CAR_GENERIC_STOPPED = 3
	FLAG_CAR_GENERIC_NOSOUND = 4
	FLAG_CAR_SOUND_FRANTICSTOP = 5
	FLAG_CAR_SKITCH = 7
	FLAG_CAR_TYPE_BUS = 30
	FLAG_CAR_GENERIC_STOPPED_SKATER = 8
	script SK4_TrafficLight01
		Obj_SetFlag FLAG_TRAFFICLIGHT_GREEN
		create name = <Green>
		wait RandomRange(5000.0,12000.0)
		while
			Obj_SetFlag FLAG_TRAFFICLIGHT_YELLOW
			Obj_ClearFlag FLAG_TRAFFICLIGHT_GREEN
			kill name = <Green>
			create name = <Yellow>
			wait 3000
			Obj_SetFlag FLAG_TRAFFICLIGHT_RED
			Obj_ClearFlag FLAG_TRAFFICLIGHT_YELLOW
			kill name = <Yellow>
			create name = <Red>
			wait RandomRange(9000.0,15000.0)
			Obj_SetFlag FLAG_TRAFFICLIGHT_GREEN
			Obj_ClearFlag FLAG_TRAFFICLIGHT_RED
			kill name = <Red>
			create name = <Green>
			wait RandomRange(7000.0,12000.0)
		repeat
	endscript
	script Car_Generic01 TurnDist = 20 DefaultSpeed = 40 ForwardOffset = 5 SkitchSpeed = 60 CarLoopSFX = CarLoop
		SetTags DefaultSpeed = <DefaultSpeed> Tag_TurnDist = <TurnDist> CarLoopSFX = <CarLoopSFX>
		GetTags
		Obj_SetPathTurnDist <Tag_TurnDist>
		Obj_FollowPathLinked
		Obj_SetPathAcceleration 10 mphps
		Obj_SetPathDeceleration 10 mphps
		Obj_SetPathMinStopVel 5
		Obj_SetPathVelocity <DefaultSpeed> mph
		if NOT GotParam AllowSlow
			if (<DefaultSpeed> < 20)
				printf "### CAR SPEED TOO SLOW! CHANGING TO 20mph ###"
				printstruct <DefaultSpeed>
				<DefaultSpeed> = 20
				printstruct <DefaultSpeed>
			endif
		endif
		if GotParam Bus
			Obj_SetFlag FLAG_CAR_TYPE_BUS
		endif
		if GotParam SkaterDebugBox
			<SkaterDebugBox> = debug
		endif
		if GotParam CarDebugBox
			<CarDebugBox> = debug
		endif
		if GotParam NoSound
			Obj_SetFlag FLAG_CAR_GENERIC_NOSOUND
		else
			Obj_PlaySound <CarLoopSFX>
		endif
		if GotParam NoSkater
		else
			Obj_SpawnScript Car_CheckForSkater01 params = <...>
		endif
		Obj_SpawnScript Car_CheckForOtherCar01 params = <...>
	endscript
	Car_CheckForSkater_Pause = 1
	script Car_CheckForSkater01
		if GotParam Bus
			SkaterCheckOffset = (0.0,0.0,28.0)
		else
			if GotParam truck
				SkaterCheckOffset = (0.0,0.0,16.0)
			else
				if GotParam atv
					SkaterCheckOffset = (0.0,0.0,3.0)
				else
					SkaterCheckOffset = (0.0,0.0,5.5)
				endif
			endif
		endif
		p1 = {dist = (<DefaultSpeed> * 1.5) width = 15 height = 25 type = Skater offset = <SkaterCheckOffset> <SkaterDebugBox>}
		p2 = {dist = (<DefaultSpeed> * 1.5) width = 15 height = 20 type = Skater offset = <SkaterCheckOffset> <SkaterDebugBox>}
		Change Car_CheckForSkater_Pause = (Car_CheckForSkater_Pause + 1)
		if (Car_CheckForSkater_Pause > 10)
			Change Car_CheckForSkater_Pause = 1
		endif
		wait Car_CheckForSkater_Pause gameframes
		while
			wait 10 gameframes
			if LocalSkaterExists
				if Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED
					if Obj_ObjectInRect <p1>
						KillSpawnedScript id = CarAccelSound
						Obj_AdjustSound <CarLoopSFX> volumePercent = 50 volumeStep = 1.5 pitchPercent = 40 pitchStep = 1.5
						Car_Sound_FranticStop01
						Obj_StopAlongPath 8
						Obj_SetFlag FLAG_CAR_GENERIC_STOPPED_SKATER
						while
							wait 90 gameframes
							if Obj_ObjectInRect <p2>
								KillSpawnedScript id = CarAccelSound
								wait 60 gameframes
								Car_Sound_RandomHonk01
							else
								SpawnSound Car_Sound_Accel01 id = CarAccelSound
								Obj_StartAlongPath
								Obj_ClearFlag FLAG_CAR_GENERIC_STOPPED_SKATER
								break
							endif
						repeat
					else
						if Skater::Skitching
							Obj_GetSpeed
							if Obj_FlagNotSet FLAG_CAR_SKITCH
								Obj_SetFlag FLAG_CAR_SKITCH
								if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
									Obj_PlaySound LA_Skid_11
								endif
								Obj_SetPathVelocity <SkitchSpeed> mph
							endif
						else
							if Obj_FlagSet FLAG_CAR_SKITCH
								Obj_ClearFlag FLAG_CAR_SKITCH
								if NOT GotParam NoSkitchStop
									Obj_SetFlag FLAG_CAR_GENERIC_STOPPED
									Obj_StopAlongPath 15 feet
									wait 1 second
									Obj_ClearFlag FLAG_CAR_GENERIC_STOPPED
									Obj_StartAlongPath
								endif
								Obj_SetPathVelocity <DefaultSpeed> mph
							endif
						endif
					endif
				endif
			endif
		repeat
	endscript
	Car_CheckForOtherCar_Pause = 1
	script Car_CheckForOtherCar01
		p1 = {dist = (<DefaultSpeed> * 1.5) width = 20 height = 20 offset = (0.0,0.0,5.0) <CarDebugBox>}
		p2 = {dist = <DefaultSpeed> width = 20 height = 20 offset = (0.0,0.0,5.0) <CarDebugBox>}
		Change Car_CheckForOtherCar_Pause = (Car_CheckForOtherCar_Pause + 1)
		if (Car_CheckForOtherCar_Pause > 10)
			Change Car_CheckForOtherCar_Pause = 1
		endif
		wait Car_CheckForOtherCar_Pause gameframes
		while
			wait 10 gameframes
			if Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED
				CarGeneric_GetNextObjOnPath_Decel <...>
				GetTags
				Obj_GetNextObjOnPath Range = <LookAheadCheckDist_Decel>
				if GotParam Ob
					Obj_SpawnScript Car_DecelForOtherCar01 params = <...>
					if IsAlive name = <Ob>
						CarGeneric_GetNextObjOnPath_Stop <...>
						GetTags
						Obj_GetNextObjOnPath Range = <LookAheadCheckDist>
					endif
					if GotParam Ob
						Car_StopForOtherCar01 <...>
					endif
				endif
			endif
		repeat
	endscript
	script Car_StopForOtherCar01
		KillSpawnedScript id = CarAccelSound
		Obj_SetFlag FLAG_CAR_GENERIC_STOPPED
		Obj_StopAlongPath 7
		GetTags
		if Obj_FlagSet FLAG_CAR_TYPE_BUS
			printf "### distance ahead bus looked before stopping = %d" d = <LookAheadCheckDist>
		endif
		Car_Sound_Stop01
		while
			Car_Sound_RandomHonk01
			if IsAlive name = <Ob>
				CarGeneric_GetNextObjOnPath_Stop <...>
				GetTags
				Obj_GetNextObjOnPath Range = <LookAheadCheckDist>
			endif
			if NOT GotParam Ob
				if Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED_SKATER
					Car_StartForOtherCar01 <...>
					break
				endif
			endif
			wait 60 gameframes
		repeat
	endscript
	script Car_StartForOtherCar01
		SpawnSound Car_Sound_Accel01 id = CarAccelSound
		Obj_ClearFlag FLAG_CAR_GENERIC_STOPPED
		wait 20 gameframes
		if Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED_SKATER
			Obj_SetPathVelocity 30 mph
			Obj_StartAlongPath
		endif
	endscript
	script CarGeneric_GetNextObjOnPath_Decel
		LookAheadCheckDist_Decel = 45
		if GotParam Bus
			LookAheadCheckDist_Decel = (<LookAheadCheckDist_Decel> + 20)
		else
			if GotParam truck
				LookAheadCheckDist_Decel = (<LookAheadCheckDist_Decel> + 10)
			endif
		endif
		SetTags LookAheadCheckDist_Decel = <LookAheadCheckDist_Decel>
	endscript
	script CarGeneric_GetNextObjOnPath_Stop
		LookAheadCheckDist = 37
		if GotParam Bus
			LookAheadCheckDist = (<LookAheadCheckDist> + 20)
		else
			if GotParam truck
				LookAheadCheckDist_Decel = (<LookAheadCheckDist_Decel> + 10)
			endif
		endif
		if Queryflag name = <Ob> FLAG_CAR_TYPE_BUS
			LookAheadCheckDist = (<LookAheadCheckDist> + 10)
		endif
		SetTags LookAheadCheckDist = <LookAheadCheckDist>
	endscript
	script Car_Sound_Accel01
		GetTags
		if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
			Obj_AdjustSound <CarLoopSFX> volumePercent = 80 volumeStep = 0.75 pitchPercent = RandomRange(83.0,87.0) pitchStep = RandomRange(0.60000002,0.89999998)
			wait RandomRange(0.89999998,1.5) seconds
			Obj_AdjustSound <CarLoopSFX> volumePercent = 60 volumeStep = 3 pitchPercent = RandomRange(48.0,52.0) pitchStep = RandomRange(4.0,5.5)
			wait RandomRange(0.15000001,0.40000001) seconds
			GetTags
			if Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED
				Obj_AdjustSound <CarLoopSFX> volumePercent = 80 volumeStep = 0.5 pitchPercent = RandomRange(77.0,81.0) pitchStep = RandomRange(0.40000001,0.60000002)
				wait RandomRange(1.20000005,1.89999998) seconds
				Obj_AdjustSound <CarLoopSFX> volumePercent = 55 volumeStep = 4 pitchPercent = RandomRange(42.0,47.0) pitchStep = RandomRange(0.40000001,0.5)
				wait RandomRange(0.15000001,0.40000001) seconds
			endif
			GetTags
			if Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED
				Obj_AdjustSound <CarLoopSFX> volumePercent = 80 volumeStep = 0.40000001 pitchPercent = 73 pitchStep = 0.40000001
				wait 2.0 seconds
				Obj_AdjustSound <CarLoopSFX> volumePercent = 50 volumeStep = 5 pitchPercent = 45 pitchStep = 5
				wait RandomRange(0.15000001,0.40000001) seconds
			endif
			GetTags
			if Obj_FlagNotSet FLAG_CAR_GENERIC_STOPPED
				Obj_AdjustSound <CarLoopSFX> volumePercent = 80 volumeStep = 0.30000001 pitchPercent = 60 pitchStep = 0.30000001
			endif
		endif
	endscript
	script Car_Sound_Decel01
		KillSpawnedScript id = CarAccelSound
		GetTags
		if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
			Obj_AdjustSound <CarLoopSFX> volumePercent = 80 volumeStep = 2 pitchPercent = RandomRange(40.0,50.0) pitchStep = 1
			wait 1 second
			Obj_PlaySound CarBrakeSqueal vol = RandomRange(5.0,20.0) pitch = RandomRange(80.0,100.0)
		endif
	endscript
	script Car_Sound_Stop01
		KillSpawnedScript id = CarAccelSound
		GetTags
		if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
			Obj_AdjustSound <CarLoopSFX> volumePercent = 50 volumeStep = 1.5 pitchPercent = 30 pitchStep = 1.5
			Obj_PlaySound CarBrakeSqueal vol = RandomRange(40.0,50.0) pitch = 80
		endif
	endscript
	script Car_Sound_FranticStop01
		KillSpawnedScript id = CarAccelSound
		GetTags
		if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
			if Obj_FlagNotSet FLAG_CAR_SOUND_FRANTICSTOP
				Obj_PlaySound LA_Skid_11 vol = RandomRange(30.0,60.0)
				Random(@@@
				Obj_PlaySound CarHorn_11 vol = RandomRange(30.0,70.0) pitch = RandomRange(80.0,100.0))
			endif
		endif
		Obj_SpawnScript Car_Counter_FranticStop01
	endscript
	script Car_Counter_FranticStop01
		Obj_SetFlag FLAG_CAR_SOUND_FRANTICSTOP
		KillSpawnedScript id = CarAccelSound
		wait 120 gameframes
		Obj_ClearFlag FLAG_CAR_SOUND_FRANTICSTOP
	endscript
	script Car_Sound_RandomHonk01
		if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
			Random(@@@@@@@@@@@@@@@@@@@@@@@
				@Obj_PlaySound CarHorn_11 vol = RandomRange(30.0,70.0) pitch = RandomRange(80.0,100.0))
		endif
	endscript
	script Car_PickRandomPath
		Obj_FollowPath name = Random(@<Path1> @<Path2>)
	endscript
	script Car_Accel01
		if Obj_FlagSet FLAG_CAR_SKITCH
		else
			GetTags
			GetRandomValue name = AccelSpeed a = (<DefaultSpeed> * 0.89999998) b = (<DefaultSpeed> * 1.20000005)
			Obj_SetPathVelocity <AccelSpeed> mph
			SpawnSound Car_Sound_Accel01 id = CarAccelSound
			if GotParam printstruct
				printf "##### ACCEL #####"
				printstruct <...>
			endif
		endif
		if GotParam StickToGround
			Obj_StickToGround on DistAbove = 2 DistBelow = 2
		else
			if GotParam NoStickToGround
				Obj_StickToGround off
			endif
		endif
	endscript
	script Car_AccelAfterDecelForCar01
		if Obj_FlagSet FLAG_CAR_SKITCH
		else
			GetTags
			GetRandomValue name = AccelSpeed a = (<DefaultSpeed> * 0.89999998) b = (<DefaultSpeed> * 1.20000005)
			Obj_SetPathVelocity <AccelSpeed> mph
			SpawnSound Car_Sound_Accel01 id = CarAccelSound
		endif
	endscript
	script Car_Decel01
		if Obj_FlagSet FLAG_CAR_SKITCH
		else
			KillSpawnedScript id = CarAccelSound
			GetTags
			GetRandomValue name = DecelSpeed a = (<DefaultSpeed> * 0.60000002) b = (<DefaultSpeed> * 0.69999999)
			Obj_SetPathVelocity <DecelSpeed> mph
			if GotParam printstruct
				printf "##### DECEL #####"
				printstruct <...>
			endif
		endif
	endscript
	script Car_DecelForTurn01
		if Obj_FlagSet FLAG_CAR_SKITCH
		else
			KillSpawnedScript id = CarAccelSound
			SetTags Tag_TurnDist = <TurnDist>
			GetTags
			GetRandomValue name = DecelSpeed a = (<DefaultSpeed> * 0.60000002) b = (<DefaultSpeed> * 0.69999999)
			if (<DecelSpeed> < 20)
				<DecelSpeed> = 20
			endif
			Obj_SetPathVelocity <DecelSpeed> mph
			Obj_SetPathTurnDist <Tag_TurnDist>
			Car_Sound_Decel01
			if GotParam printstruct
				printf "##### DECEL FOR TURN #####"
				printstruct <...>
			endif
		endif
	endscript
	script Car_DecelTrafficLight01
		if Obj_ObjectNotInRect dist = 50 type = [Skater, car]
			if Queryflag name = <LightNode> FLAG_TRAFFICLIGHT_GREEN
				goto Car_DecelForTurn01 params = <...>
			endif
			if Queryflag name = <LightNode> FLAG_TRAFFICLIGHT_YELLOW
				Random(
					@goto Car_BlowYellow01 params = <...>
					@goto Car_BlowYellow01 params = <...>
					@goto Car_BlowYellow01 params = <...>
					@goto Car_Stop01 params = <...>)
			endif
			if Queryflag name = <LightNode> FLAG_TRAFFICLIGHT_RED
				goto Car_Stop01 params = <...>
			endif
		else
		endif
	endscript
	script Car_DecelForOtherCar01
		KillSpawnedScript id = CarAccelSound
		Car_Decel01 <...>
		wait 120 gameframes
		Car_AccelAfterDecelForCar01 <...>
	endscript
	script Car_Start01
		wait RandomRange(800.0,1200.0)
		Obj_ClearFlag FLAG_CAR_GENERIC_STOPPED
		Obj_StartAlongPath
		SpawnSound Car_Sound_Accel01 id = CarAccelSound
	endscript
	script Car_Stop01
		KillSpawnedScript id = CarAccelSound
		Obj_StopAlongPath RandomRange(25.0,30.0) feet
		Obj_SetFlag FLAG_CAR_GENERIC_STOPPED
		Car_Sound_Stop01
		while
			wait 20 gameframes
			if Queryflag name = <LightNode> FLAG_TRAFFICLIGHT_GREEN
				Car_Start01
				break
			endif
		repeat
	endscript
	script Car_BlowYellow01
		GetTags
		Obj_SetPathVelocity 50 mph
		if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
			Obj_AdjustSound <CarLoopSFX> volumePercent = 130 volumeStep = 4 pitchPercent = 130 pitchStep = 4
			Obj_PlaySound LA_Skid_11 vol = 100
		endif
	endscript
	script Car_InchUpAfterStop
		if Obj_ObjectNotInRect dist = 35 width = 50 height = 40 type = [car, Skater] offset = (0.0,0.0,0.0)
			Obj_StartAlongPath
			wait 1 gameframes
			Obj_StopAlongPath 20
			if Obj_FlagNotSet FLAG_CAR_GENERIC_NOSOUND
				Obj_PlaySound CarBrakeSqueal vol = 30 pitch = 80
			endif
		endif
	endscript
	script Ped_Generic01
		Obj_FollowPathLinked
		Obj_RandomPathMode on
		Obj_SetPathAcceleration 10
		Obj_SetPathDeceleration 10
	endscript
	script Ped_StopAtNode01
		Obj_SetAnimCycleMode off
		Obj_WaitAnimFinished
		Obj_PlayAnim Anim = WalkToIdle
		wait 2 gameframes
		Obj_StopAlongPath
		Obj_WaitAnimFinished
	endscript
	script Ped_BackOnPath01
		printf "backonpath"
		Obj_StartAlongPath
		Obj_FollowPathStored
	endscript
	script Ped_WalkToNextNode01
		Random(
			@Obj_SetPathVelocity 4
			Obj_StartAlongPath
			Obj_CycleAnim Anim = IdleToWalk
			Obj_PlayAnim Anim = Walk1 cycle
			@Obj_SetPathVelocity 4
			Obj_StartAlongPath
			Obj_CycleAnim Anim = IdleToWalk
			Obj_PlayAnim Anim = Walk2 cycle)
	endscript
	script Ped_Crosswalk01
		Ped_StopAtNode01
		while
			if Queryflag name = <LightNode> FLAG_TRAFFICLIGHT_YELLOW
				Obj_PlayAnim Anim = Idle cycle
				while
					if Queryflag name = <LightNode> FLAG_TRAFFICLIGHT_RED
						Obj_SetAnimCycleMode off
						Obj_WaitAnimFinished
						wait RandomRange(0.0,300.0)
						goto Ped_WalkToNextNode01
					endif
					wait 30 gameframes
				repeat
			else
				Ped_Idle01
			endif
		repeat
	endscript
	script Ped_RandomWaitAtNode01
		Ped_StopAtNode01
		Obj_CycleAnim Anim = Idle
		while
			Random(
				@Ped_Idle01
				@goto Ped_WalkToNextNode01)
		repeat
	endscript
	script Ped_Idle01
		Random(
			@Obj_CycleAnim Anim = ScratchChin
			@Obj_CycleAnim Anim = LookAtWatch
			@Obj_CycleAnim Anim = LookLeftRight
			@Obj_CycleAnim Anim = LookRight
			@Obj_CycleAnim Anim = LookLeftDown
			@Obj_CycleAnim Anim = Talk
			@Obj_CycleAnim Anim = Talk2
			@Obj_CycleAnim Anim = Idle
			@Obj_CycleAnim Anim = Idle
			@Obj_CycleAnim Anim = Idle
			@Obj_CycleAnim Anim = Idle
			@Obj_CycleAnim Anim = IdleToIdle2
			Obj_CycleAnim Anim = Idle2
			Obj_CycleAnim Anim = Idle2ToIdle
			@Obj_CycleAnim Anim = IdleToIdle3
			Obj_CycleAnim Anim = Idle3
			Obj_CycleAnim Anim = Idle3ToIdle)
	endscript
	script Team_Flag
		Obj_SetInnerRadius 10
		if GameModeEquals is_lobby
			Obj_SetException ex = SkaterInRadius scr = Team_Flag_Trigger params = {<...>}
		else
			if GameModeEquals is_ctf
				if OnServer
					Obj_SetException ex = AnySkaterInRadius scr = CTF_Team_Flag_Trigger params = {<...>}
				endif
			endif
		endif
	endscript
	script Team_Flag_Trigger
		GetNumTeams
		if GotParam blue
			JoinTeam blue
			kill name = TRG_Flag_Red
			kill name = TRG_Flag_Green
			kill name = TRG_Flag_Yellow
			create name = TRG_Flag_Red
			switch <num_teams>
				case 3
					create name = TRG_Flag_Green
				case 4
					create name = TRG_Flag_Green
					create name = TRG_Flag_Yellow
			endswitch
			Die
		endif
		if GotParam Red
			JoinTeam Red
			kill name = TRG_Flag_Blue
			kill name = TRG_Flag_Green
			kill name = TRG_Flag_Yellow
			create name = TRG_Flag_Blue
			switch <num_teams>
				case 3
					create name = TRG_Flag_Green
				case 4
					create name = TRG_Flag_Green
					create name = TRG_Flag_Yellow
			endswitch
			Die
		endif
		if GotParam Green
			JoinTeam Green
			kill name = TRG_Flag_Blue
			kill name = TRG_Flag_Red
			kill name = TRG_Flag_Yellow
			create name = TRG_Flag_Blue
			create name = TRG_Flag_Red
			switch <num_teams>
				case 4
					create name = TRG_Flag_Yellow
			endswitch
			Die
		endif
		if GotParam Yellow
			JoinTeam Yellow
			kill name = TRG_Flag_Blue
			kill name = TRG_Flag_Red
			kill name = TRG_Flag_Green
			create name = TRG_Flag_Blue
			create name = TRG_Flag_Red
			create name = TRG_Flag_Green
			Die
		endif
	endscript
	script CTF_Team_Base_Trigger
		if GotParam Red
			GetCollidingPlayerAndTeam exclude_team = 0 radius = 10
			if (<player> = -1)
			else
				if (<team> = 0)
					if PlayerHasFlag <...>
						if TeamFlagTaken <...>
							DisplayFlagBaseWarning
						endif
					endif
				endif
			endif
		endif
		if GotParam blue
			GetCollidingPlayerAndTeam exclude_team = 1 radius = 10
			if (<player> = -1)
			else
				if (<team> = 1)
					if PlayerHasFlag <...>
						if TeamFlagTaken <...>
							DisplayFlagBaseWarning
						endif
					endif
				endif
			endif
		endif
		if GotParam Green
			GetCollidingPlayerAndTeam exclude_team = 2 radius = 10
			if (<player> = -1)
			else
				if (<team> = 2)
					if PlayerHasFlag <...>
						if TeamFlagTaken <...>
							DisplayFlagBaseWarning
						endif
					endif
				endif
			endif
		endif
		if GotParam Yellow
			GetCollidingPlayerAndTeam exclude_team = 3 radius = 10
			if (<player> = -1)
			else
				if (<team> = 3)
					if PlayerHasFlag <...>
						if TeamFlagTaken <...>
							DisplayFlagBaseWarning
						endif
					endif
				endif
			endif
		endif
	endscript
	script display_flag_base_warning
		create_net_panel_message msg_time = 2000 text = net_message_flag_base_warning
	endscript
	script CTF_Team_Flag_Trigger
		if JustStartedNetGame
			return
		endif
		if GotParam Red
			GetCollidingPlayerAndTeam exclude_team = 0 radius = 10
			if (<player> = -1)
			else
				if (<team> = 0)
					PlayerCapturedFlag flag_team = 0 <...>
				else
					PlayerTookFlag flag_team = 0 <...>
					Obj_ClearExceptions
				endif
			endif
		endif
		if GotParam blue
			GetCollidingPlayerAndTeam exclude_team = 1 radius = 10
			if (<player> = -1)
			else
				if (<team> = 1)
					PlayerCapturedFlag flag_team = 1 <...>
				else
					PlayerTookFlag flag_team = 1 <...>
					Obj_ClearExceptions
				endif
			endif
		endif
		if GotParam Green
			GetCollidingPlayerAndTeam exclude_team = 2 radius = 10
			if (<player> = -1)
			else
				if (<team> = 2)
					PlayerCapturedFlag flag_team = 2 <...>
				else
					PlayerTookFlag flag_team = 2 <...>
					Obj_ClearExceptions
				endif
			endif
		endif
		if GotParam Yellow
			GetCollidingPlayerAndTeam exclude_team = 3 radius = 10
			if (<player> = -1)
			else
				if (<team> = 3)
					PlayerCapturedFlag flag_team = 3 <...>
				else
					PlayerTookFlag flag_team = 3 <...>
					Obj_ClearExceptions
				endif
			endif
		endif
	endscript
	script Kill_Team_Flags
		if NodeExists TRG_Flag_Red
			kill name = TRG_Flag_Red
		endif
		if NodeExists TRG_Flag_Blue
			kill name = TRG_Flag_Blue
		endif
		if NodeExists TRG_Flag_Green
			kill name = TRG_Flag_Green
		endif
		if NodeExists TRG_Flag_Yellow
			kill name = TRG_Flag_Yellow
		endif
		if NodeExists TRG_Flag_Red_Base
			kill name = TRG_Flag_Red_Base
		endif
		if NodeExists TRG_Flag_Blue_Base
			kill name = TRG_Flag_Blue_Base
		endif
		if NodeExists TRG_Flag_Green_Base
			kill name = TRG_Flag_Green_Base
		endif
		if NodeExists TRG_Flag_Yellow_Base
			kill name = TRG_Flag_Yellow_Base
		endif
		if NodeExists TRG_CTF_Red
			kill name = TRG_CTF_Red
		endif
		if NodeExists TRG_CTF_Red_Base
			kill name = TRG_CTF_Red_Base
		endif
		if NodeExists TRG_CTF_Blue
			kill name = TRG_CTF_Blue
		endif
		if NodeExists TRG_CTF_Blue_Base
			kill name = TRG_CTF_Blue_Base
		endif
		if NodeExists TRG_CTF_Green
			kill name = TRG_CTF_Green
		endif
		if NodeExists TRG_CTF_Green_Base
			kill name = TRG_CTF_Green_Base
		endif
		if NodeExists TRG_CTF_Yellow
			kill name = TRG_CTF_Yellow
		endif
		if NodeExists TRG_CTF_Yellow_Base
			kill name = TRG_CTF_Yellow_Base
		endif
	endscript
	script Create_Team_Flags
		if GameModeEquals is_lobby
			switch <num_teams>
				case 1
					if NodeExists TRG_Flag_Red
						create name = TRG_Flag_Red
					endif
					if NodeExists TRG_Flag_Red_Base
						create name = TRG_Flag_Red_Base
					endif
				case 2
					if NodeExists TRG_Flag_Red
						create name = TRG_Flag_Red
					endif
					if NodeExists TRG_Flag_Blue
						create name = TRG_Flag_Blue
					endif
					if NodeExists TRG_Flag_Red_Base
						create name = TRG_Flag_Red_Base
					endif
					if NodeExists TRG_Flag_Blue_Base
						create name = TRG_Flag_Blue_Base
					endif
				case 3
					if NodeExists TRG_Flag_Red
						create name = TRG_Flag_Red
					endif
					if NodeExists TRG_Flag_Blue
						create name = TRG_Flag_Blue
					endif
					if NodeExists TRG_Flag_Green
						create name = TRG_Flag_Green
					endif
					if NodeExists TRG_Flag_Red_Base
						create name = TRG_Flag_Red_Base
					endif
					if NodeExists TRG_Flag_Blue_Base
						create name = TRG_Flag_Blue_Base
					endif
					if NodeExists TRG_Flag_Green_Base
						create name = TRG_Flag_Green_Base
					endif
				case 4
					if NodeExists TRG_Flag_Red
						create name = TRG_Flag_Red
					endif
					if NodeExists TRG_Flag_Blue
						create name = TRG_Flag_Blue
					endif
					if NodeExists TRG_Flag_Green
						create name = TRG_Flag_Green
					endif
					if NodeExists TRG_Flag_Yellow
						create name = TRG_Flag_Yellow
					endif
					if NodeExists TRG_Flag_Red_Base
						create name = TRG_Flag_Red_Base
					endif
					if NodeExists TRG_Flag_Blue_Base
						create name = TRG_Flag_Blue_Base
					endif
					if NodeExists TRG_Flag_Green_Base
						create name = TRG_Flag_Green_Base
					endif
					if NodeExists TRG_Flag_Yellow_Base
						create name = TRG_Flag_Yellow_Base
					endif
			endswitch
		else
			GetNumPlayersOnTeam team = 0
			if (<num_members> = 0)
			else
				if NodeExists TRG_CTF_Red
					create name = TRG_CTF_Red
				endif
				if NodeExists TRG_CTF_Red_Base
					create name = TRG_CTF_Red_Base
				endif
			endif
			GetNumPlayersOnTeam team = 1
			if (<num_members> = 0)
			else
				if NodeExists TRG_CTF_Blue
					create name = TRG_CTF_Blue
				endif
				if NodeExists TRG_CTF_Blue_Base
					create name = TRG_CTF_Blue_Base
				endif
			endif
			GetNumPlayersOnTeam team = 2
			if (<num_members> = 0)
			else
				if NodeExists TRG_CTF_Green
					create name = TRG_CTF_Green
				endif
				if NodeExists TRG_CTF_Green_Base
					create name = TRG_CTF_Green_Base
				endif
			endif
			GetNumPlayersOnTeam team = 3
			if (<num_members> = 0)
			else
				if NodeExists TRG_CTF_Yellow
					create name = TRG_CTF_Yellow
				endif
				if NodeExists TRG_CTF_Yellow_Base
					create name = TRG_CTF_Yellow_Base
				endif
			endif
		endif
	endscript
	script Team_Flag_Base
		Obj_SetInnerRadius 10
		Obj_SetException ex = SkaterInRadius scr = CTF_Team_Base_Trigger params = {<...>}
	endscript
	script BouncyShadow_Kill
		FormatText TextName = ShadowName "%o_shadow" o = <ObjectName>
		printf <ShadowName>
		kill prefix = <ShadowName>
	endscript
	script Pigeon_Generic
		Obj_ShadowOff
		if GotParam perched
			Pigeon_Generic_Idle_Perched
		else
			Pigeon_Generic_Idle
		endif
	endscript
	script Pigeon_Generic_Idle_Perched
		Obj_ClearExceptions
		Obj_SetInnerRadius 15
		Obj_SetException ex = SkaterInRadius scr = Pigeon_Generic_SkaterNear_Perched
		SpawnSound NY_SFX_PigeonIdle
		while
			Obj_CycleAnim Anim = Idle NumCycles = RandomRange(1.0,3.0)
			Obj_CycleAnim Anim = preen
		repeat
	endscript
	script Pigeon_Generic_SkaterNear_Perched
		Obj_ClearExceptions
		SpawnSound NY_SFX_PigeonFlyUp
		Obj_CycleAnim Anim = FlyHop
		goto Pigeon_Generic_Idle_Perched
	endscript
	script Pigeon_Generic_Idle
		Obj_ClearExceptions
		Obj_SetInnerRadius 15
		Obj_SetException ex = SkaterInRadius scr = Pigeon_Generic_SkaterNear
		SpawnSound NY_SFX_PigeonIdle
		while
			Obj_CycleAnim Anim = Idle NumCycles = RandomRange(1.0,3.0)
			Obj_CycleAnim Anim = peckfromidle
			while
				Obj_RotY speed = 25
				Obj_CycleAnim Anim = peck
				Obj_StopRotating
			repeat NumCycles RandomRange(1.0,5.0)
			Obj_CycleAnim Anim = pecktoidle
			Obj_CycleAnim Anim = Idle
			Obj_CycleAnim Anim = preen
		repeat
	endscript
	script Pigeon_Generic_SkaterNear
		Obj_ClearExceptions
		Obj_GetRandomLink
		Obj_MoveToLink speed = 8 LinkNum = <link>
		Obj_LookAtNodeLinked time = 0.2 LinkNum = <link>
		Obj_SetInnerRadius 5
		Obj_SetException ex = SkaterInRadius scr = Pigeon_Generic_SkaterReallyNear
		Obj_PlayAnim Anim = run cycle
		Obj_WaitMove
		Obj_SetAnimCycleMode off
		Obj_WaitAnimFinished
		Obj_CycleAnim Anim = runtoidle
		Obj_SetInnerRadius 15
		Obj_SetException ex = SkaterInRadius scr = Pigeon_Generic_SkaterNear
		goto Pigeon_Generic_Idle
	endscript
	script Pigeon_Generic_SkaterReallyNear
		Obj_ClearExceptions
		SpawnSound NY_SFX_PigeonFlyUp
		Obj_CycleAnim Anim = FlyHop
		Obj_WaitMove
		Obj_SetInnerRadius 15
		Obj_SetException ex = SkaterInRadius scr = Pigeon_Generic_SkaterNear
		goto Pigeon_Generic_Idle
	endscript
	script COMBO_Letter
	endscript
	script SKATE_Letter
	endscript
	script Gap_Gen_Rail2Rail
		Gap_Gen_RailHop <...>
	endscript
	script Gap_Gen_Ledge2Ledge
		Gap_Gen_LedgeHop <...>
	endscript
	script Gap_Gen_Wire2Wire
		Gap_Gen_WireHop <...>
	endscript
	script Gap_Gen_Bench2Bench
		Gap_Gen_BenchHop <...>
	endscript
	script Gap_Gen_Rail2Ledge
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Rail 2 Ledge" score = 50 <...>
		endif
	endscript
	script Gap_Gen_Rail2Wire
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Rail 2 Wire" score = 50 <...>
		endif
	endscript
	script Gap_Gen_Rail2Bench
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Rail 2 Bench" score = 50 <...>
		endif
	endscript
	script Gap_Gen_Ledge2Rail
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Ledge 2 Rail" score = 50 <...>
		endif
	endscript
	script Gap_Gen_Ledge2Wire
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Ledge 2 Wire" score = 50 <...>
		endif
	endscript
	script Gap_Gen_Ledge2Bench
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Ledge 2 Bench" score = 50 <...>
		endif
	endscript
	script Gap_Gen_Wire2Rail
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Wire 2 Rail" score = 50 <...>
		endif
	endscript
	script Gap_Gen_Wire2Ledge
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Wire 2 Ledge" score = 50 <...>
		endif
	endscript
	script Gap_Gen_Bench2Rail
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Bench 2 Rail" score = 50 <...>
		endif
	endscript
	script Gap_Gen_Bench2Ledge
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Bench 2 Ledge" score = 50 <...>
		endif
	endscript
	script Gap_Gen_WireHop
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Wire hop" score = 25 <...>
		endif
	endscript
	script Gap_Gen_BenchHop
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Bench hop" score = 25 <...>
		endif
	endscript
	script Gap_Gen_RailHop
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Rail hop" score = 25 <...>
		endif
	endscript
	script Gap_Gen_LedgeHop
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Ledge hop" score = 25 <...>
		endif
	endscript
	script Gap_Gen_AcrossTheStreet
		if GotParam start
			Gap_Gen_Rail <...>
		else
			Gap_Gen_End GapID = <GapID> text = "Across the street" score = 50 <...>
		endif
	endscript
	script Gap_Gen_HighLip
		if GotParam start
			StartGap {
				GapID = <GapID>
				flags = [REQUIRE_LIP CANCEL_GROUND CANCEL_WALL CANCEL_MANUAL CANCEL_RAIL CANCEL_WALLPLANT CANCEL_HANG CANCEL_LADDER]
				<...>}
		else
			wait 1 frame
			Gap_Gen_End GapID = <GapID> text = "High lip" score = 100 <...>
		endif
	endscript
	script Gap_Gen_RampTransfer
		if GotParam start
			StartGap {
				GapID = <GapID>
				flags = PURE_AIR
				<...>}
		else
			Gap_Gen_End GapID = <GapID> text = "Ramp Transfer" score = 100 <...>
		endif
	endscript
	script Gap_Gen_Rail
		if GotParam start
			StartGap {
				GapID = <GapID>
				flags = [CANCEL_GROUND CANCEL_MANUAL CANCEL_WALL CANCEL_RAIL CANCEL_LIP CANCEL_WALLPLANT CANCEL_HANG CANCEL_LADDER]
				<...>}
		else
			if GotParam end
				Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...>
			else
				printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
			endif
		endif
	endscript
	script Gap_Gen_Lip
		if GotParam start
			StartGap {
				GapID = <GapID>
				flags = [REQUIRE_LIP CANCEL_GROUND CANCEL_WALL CANCEL_MANUAL CANCEL_RAIL CANCEL_WALLPLANT CANCEL_HANG CANCEL_LADDER]
				<...>}
		else
			if GotParam end
				wait 1 frame
				EndGap {
					GapID = <GapID>
					text = <text>
					score = <score>}
			else
				printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
			endif
		endif
	endscript
	script Gap_Gen_Transfer
		if GotParam start
			StartGap {
				GapID = <GapID>
				flags = PURE_AIR
				<...>}
		else
			if GotParam end
				Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...>
			else
				printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
			endif
		endif
	endscript
	script Gap_Gen_PureAir
		if GotParam start
			StartGap {
				GapID = <GapID>
				flags = PURE_AIR
				<...>}
		else
			if GotParam end
				Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...>
			else
				printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
			endif
		endif
	endscript
	script Gap_Gen_Manual
		if GotParam start
			StartGap {
				GapID = <GapID>
				flags = PURE_MANUAL
				<...>}
		else
			if GotParam end
				Gap_Gen_End GapID = <GapID> text = <text> score = <score> <...>
			else
				printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
			endif
		endif
	endscript
	script Gap_Gen_End
		if GotParam end
			EndGap {
				GapID = <GapID>
				text = <text>
				score = <score>
				<...>}
		else
			printf "### NO GAP TYPE SET FOR ID %g.  MUST BE START OR END ###" g = <GapID>
		endif
	endscript
	script Gap_Gen_Print
		printf "fuck = %g" g = <GapID>
	endscript
	script Collect_Hover
		Obj_RotY speed = 150
		Obj_Hover Amp = 10 Freq = 1
	endscript
	script SK5_WinCurrentGoal
		SpawnScript SK5_WinCurrentGoal_Spawned
	endscript
	script SK5_WinCurrentGoal_Spawned
		if GoalManager_GetActiveGoalId
			GoalManager_WinGoal name = <goal_id>
		endif
	endscript
	script SK5_LoseCurrentGoal
		SpawnScript SK5_LoseCurrentGoal_Spawned
	endscript
	script SK5_LoseCurrentGoal_Spawned
		if GoalManager_GetActiveGoalId
			GoalManager_LoseGoal name = <goal_id>
		endif
	endscript
	script SK5_AdvanceStage
		GoalManager_DeactivateAllGoals
		GoalManager_GetCurrentChapterAndStage
		GoalManager_AdvanceStage force
		<stage_struct> = ((CHAPTER_COMPLETION_SCRIPTS[<currentChapter>])[<currentStage>])
		if StructureContains structure = <stage_struct> script_name
			<stage_script> = (<stage_struct>.script_name)
		endif
		if StructureContains structure = <stage_struct> params
			<stage_script_params> = (<stage_struct>.params)
		endif
		<stage_script> <stage_script_params> just_won_goal
	endscript
	script SK5_AdvanceStage_Debug
		GoalManager_DeactivateAllGoals
		GoalManager_GetCurrentChapterAndStage
		GoalManager_AdvanceStage force
		<stage_struct> = ((CHAPTER_COMPLETION_SCRIPTS[<currentChapter>])[<currentStage>])
		if StructureContains structure = <stage_struct> script_name
			<stage_script> = (<stage_struct>.script_name)
		endif
		if StructureContains structure = <stage_struct> params
			<stage_script_params> = (<stage_struct>.params)
		endif
		<stage_script> <stage_script_params>
	endscript
	script ShatterAndDie area = 1000 variance = 4.5999999 vel_x = Random(@0.0 @30 @-30) vel_y = Random(@10 @30 @50) vel_z = Random(@0 @30 @-30) spread = 1.0
		kill name = <name>
		Shatter name = <name> area = <area> variance = <variance> vel_x = <vel_x> vel_y = <vel_y> vel_z = <vel_z> spread = <spread>
	endscript
	script Generic_LeavingGameAreaMessage
		if NOT InSplitScreenGame
			Create_Panel_Message id = leaving_message text = "Leaving Game Area"
		endif
	endscript
	script WAT_Grid u = 0 framerate = 8 grid_size = 4
		grid_size = (<grid_size> + 0.0)
		offset = (1.0 / <grid_size>)
		max_offset = (1 - <offset>)
		v = <max_offset>
		if GotParam RandomOffset
			range_cap = (<grid_size> - 1)
			CastToInteger range_cap
			GetRandomValue name = random_offset a = 0 b = <range_cap> integer
			u = (<offset> * <random_offset>)
			GetRandomValue name = random_offset a = 0 b = <range_cap> integer
			v = (<offset> * <random_offset>)
		endif
		while
			SetUVWibbleOffsets sector = <object> u_off = <u>, v_off = <v>
			if NOT (<v> = 0)
				v = (<v> - <offset>)
			else
				v = <max_offset>
				u = (<u> + <offset>)
				if (<u> = 1)
					u = 0
				endif
			endif
			wait <framerate> frames
		repeat
	endscript
	script SetupProTeam
		GoalManager_SetTeamMember pro = lasek
		GoalManager_SetTeamMember pro = hawk
		GoalManager_SetTeamMember pro = mullen
		GoalManager_SetTeamMember pro = margera
		GoalManager_SetTeamMember pro = reynolds
	endscript
	script CarTOD_TurnOffHeadlights
		printf "### turning off headlights"
		RunScriptOnComponentType component = model target = Obj_ReplaceTexture params = {
			src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle_Transparent"
		}
		RunScriptOnComponentType component = model target = Obj_ReplaceTexture params = {
			src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow_Transparent"
		}
	endscript
	script CarTOD_TurnOnHeadlights
		printf "### turning on headlights"
		RunScriptOnComponentType component = model target = Obj_ReplaceTexture params = {
			src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle"
		}
		RunScriptOnComponentType component = model target = Obj_ReplaceTexture params = {
			src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow"
		}
	endscript
	script PlayKISS_Movie
		SetGlobalFlag flag = MOVIE_UNLOCKED_KISS
		wait 100 frames
		PauseSkaters
		PlaySkaterCamAnim Skater = 0 {virtual_cam
			targetid = world
			targetOffset = (9207.79980469,252.1000061,192.30000305)
			positionOffset = (-789.70001221,450.29998779,92.90000153)
			frames = 1200
			skippable = 0
			play_hold
		}
		create_dialog_box {title = "CONGRATULATIONS!"
			title_font = testtitle
			text = "   KISS movie Unlocked!  Collect K-I-S-S again and they'll put on a show for you!"
			pos = (320.0,240.0)
			just = [center center]
			text_rgba = [88 105 112 128]
			text_dims = (330.0,0.0)
			line_spacing = 0.85000002
			buttons = [{font = small text = "OK" pad_choose_script = KissMovie_unlock_accept}]
			delay_input
			pad_focus_script = text_twitch_effect
			style = special_dialog_style
		}
		WaitForEvent type = KissMovie_unlock_accept_done
		ingame_play_movie "movies\kiss" level = load_se
	endscript
