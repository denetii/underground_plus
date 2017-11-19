
	SwitchControl_Trigger = {Trigger = {PressTwoAnyOrder, L1, R1, 400} Xbox_Trigger = {Press, Black, 10} NGC_Trigger = {Press, Z, 10} Alt_Trigger = {Press, White, 10}}
	CAVEMAN_SCORE = 750
	COMBO_RUNOUT_SCORE = 50
	CavemanBailDuration = 0.30000001
	RunOutTrickDelay = 0.75
	script RunTimerController_Reset
		RunTimer_GetRunTimerControllerId
		Obj_KillSpawnedScript Id = <RunTimerControllerId>
		Obj_SpawnScript RunTimerController_Start Id = <RunTimerControllerId> PauseWithObject
		RunTimer_GetRunTimerId
		Obj_KillSpawnedScript Id = (<RunTimerId> + 2)
		hide_run_timer Id = <RunTimerId>
	endscript
	script RunTimerController_Start
		ClearExceptionGroup RunTimeController
		SetExceptionHandler Ex = ShowRunTimer Scr = RunTimerController_Displayed Group = RunTimeController
		Block
	endscript
	script RunTimerController_Displayed
		ClearExceptionGroup RunTimeController
		SetExceptionHandler Ex = HideRunTimer Scr = RunTimerController_Hidden Group = RunTimeController
		RunTimer_GetRunTimerId
		FadingSpawned = 0
		SoundCounter = 0
		SoundWait = 4
		SoundType = 0
		RunTimer_GetFactorComplete
		RotationAngle = (360 * <FactorComplete>)
		show_run_timer Id = <RunTimerId> rot_angle = <RotationAngle>
		while
			DoScreenElementMorph Id = {<RunTimerId> child = 0} rot_angle = (180 - <RotationAngle>)
			hide_run_timer_piece Id = <RunTimerId> rot_angle = <RotationAngle>
			if (<FadingSpawned> = 0)
				if (<RotationAngle> < 140)
					Obj_SpawnScript blink_run_timer Id = (<RunTimerId> + 2) Params = {Id = <RunTimerId>} PauseWithObject
					FadingSpawned = 1
				endif
			endif
			if (<SoundCounter> > <SoundWait>)
				if (<SoundType> = 0)
					if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
						PlaySound ClockTickDown
					endif
					SoundType = 1
				else
					if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
						PlaySound ClockTickUp vol = 150
					endif
					SoundType = 0
				endif
				SoundCounter = 0
			else
				SoundCounter = (<SoundCounter> + 1)
			endif
			if (<RotationAngle> < 270)
				if (<RotationAngle> < 180)
					if (<RotationAngle> < 90)
						SoundWait = 1
					else
						SoundWait = 2
					endif
				else
					SoundWait = 3
				endif
			endif
			Wait 1 GameFrame
			RunTimer_GetFactorComplete
			RotationAngle = (360 * <FactorComplete>)
		repeat
	endscript
	script RunTimerController_Hidden
		ClearExceptionGroup RunTimeController
		SetExceptionHandler Ex = ShowRunTimer Scr = RunTimerController_Displayed Group = RunTimeController
		RunTimer_GetRunTimerId
		Obj_KillSpawnedScript Id = (<RunTimerId> + 2)
		soft_hide_run_timer Id = <RunTimerId>
		Block
	endscript
	script CleanUp_WalkingtoSkating
		AllowRailTricks
		GetTags
		if NOT GotParam AnimTags
			SkaterLoopingSound_TurnOn
		else
			if NOT StructureContains WalkToSkateTransition Structure = <AnimTags>
				SkaterLoopingSound_TurnOn
			endif
		endif
		SetException Ex = PointRail Scr = PointRailWalkingToSkating
		SwitchToSkatingPhysics
		if InAir
			SetQueueTricks NoTricks
			InAirExceptions NoSkateToWalkTricks
		else
			OnGroundExceptions
		endif
	endscript
	script PointRailWalkingToSkating
		SetQueueTricks NoTricks
		Goto PointRail
	endscript
	script Switch_OnGroundAI newscript = land
		UnPausePhysics
		Unhide
		ClearExceptions
		ClearTrickQueues
		StopBalanceTrick
		NotInBail
		if Driving
			ToggleUserControlledVehicleMode
		endif
		switch <newscript>
			case OnGroundAi
				SetRollingFriction #"default"
				DestroyAllSpecialItems
				SwitchOnBoard
				CleanUp_WalkingtoSkating
				if InAir
					Goto Airborne
				else
					Goto OnGroundAi
				endif
			case Walking_onGroundAi
				DestroyAllSpecialItems
				SwitchOnBoard
				SwitchToWalkingPhysics
				AllowRailTricks
				if GotParam Restart
					Goto JustStoppedSkatingState Params = {Restart}
				else
					Goto JustStoppedSkatingState
				endif
			case TransAm
				Goto ToggleUserControlledVehicleMode Params = {<...>}
			default
				ScriptAssert "Bad NewScript passed to Switch_OnGroundAi"
		endswitch
	endscript
	script CheckforSwitchVehicles newscript = OnGroundAi
		if Walking
			Goto Switch_OnGroundAI Params = {newscript = OnGroundAi}
		else
			Goto Switch_OnGroundAI Params = {newscript = Walking_onGroundAi}
		endif
	endscript
