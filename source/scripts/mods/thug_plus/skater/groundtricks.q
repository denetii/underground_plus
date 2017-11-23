
	TRICK_PRELOAD_TIME = 160
	Jumptricks0 =
	[
		{Trigger = {PressAndRelease, Up, X, 300} Scr = NoComply Params = {Name = 'No Comply' Score = 100}}
		
	]
	Jumptricks =
	[
		{Trigger = {TapTwiceRelease, Up, X, 500} TrickSlot = JumpSlot}
		{Trigger = {TapTwiceRelease, Left, X, 500} Scr = Boneless Params = {Name = 'Beanplant' Anim = Beanplant Score = 250}}
		{Trigger = {TapTwiceRelease, Right, X, 500} Scr = Boneless Params = {Name = 'Fastplant' Anim = Fastplant Score = 250}}
		{Trigger = {TapTwiceRelease, Down, X, 500} Scr = MikeVBoneless}
		{Trigger = {TapTwiceRelease, Up, Circle, 500} Scr = kskOffBoard_FromGround}
		{Trigger = {PressAndRelease, Left, X, 300} Scr = NoComply Params = {Name = 'No Comply Flip' Anim = NoComplyFlip Score = 150}}
		{Trigger = {PressAndRelease, Down, X, 300} Scr = NoComply Params = {Name = 'No Comply 360 Shove-it' Anim = NoComply360Shoveit Score = 180}}
	]
	Trick_Boneless = {Scr = Boneless Params = {Name = 'Boneless' Anim = Boneless Score = 250}}
	Trick_Fastplant = {Scr = Boneless Params = {Name = 'Fastplant' Anim = Fastplant Score = 250}}
	Trick_Beanplant = {Scr = Boneless Params = {Name = 'Beanplant' Anim = Beanplant Score = 250}}
	
    // Eventually I will make this a control option!
    // but no one liked the new powerslide control setting so I changed it back
    Trigger_PowerSlide_OLD = {TripleInOrder, a = Down, b = Down, Black, 333}
	Trigger_PowerSlide_NEW = {InOrder, a = L1, b = L1, 300}
    Trigger_PowerSlide = Trigger_PowerSlide_OLD
    GroundTricks =
	[
		{Trigger = Trigger_PowerSlide Scr = ToggleSwitchRegular Params = {PowerSlide}}
		{Trigger = {TripleInOrder, a = Down, b = Down, Triangle, 333} Scr = KskBigBrake}
		{Trigger = {PressAndRelease, Up, X, 300} Scr = NoComply Params = {Name = 'No Comply' Score = 100}}
		{Trigger = {TripleInOrder, a = L1, b = L1, Triangle, 500} Scr = Props Params = {string_id = props_string}}
		{Trigger = {TripleInOrder, a = L1, b = L1, Square, 500} Scr = Taunt Params = {Anim = Taunt1 string_id = your_daddy_string}}
		{Trigger = {TripleInOrder, a = L1, b = L1, Circle, 500} Scr = Taunt Params = {Anim = Taunt2 string_id = no_way_string}}
		{Trigger = {TripleInOrder, a = L1, b = L1, X, 500} Scr = Taunt Params = {Anim = Taunt3 string_id = get_some_string}}
		{Trigger = {Press, Black, 20} Scr = ToggleSwitchRegular NGC_Trigger = {Press, R1, 20}}
		{Trigger = {Press, White, 20} Scr = ToggleNollieRegular NGC_Trigger = {Press, L1, 20}}
	]
	GroundTricks_XBOX =
	[
		{Trigger = Trigger_PowerSlide Scr = ToggleSwitchRegular Params = {PowerSlide}}
		{Trigger = {TripleInOrder, a = Down, b = Down, Triangle, 333} Scr = KskBigBrake}
		{Trigger = {PressAndRelease, Up, X, 300} Scr = NoComply Params = {Name = 'No Comply' Score = 100}}
		{Trigger = {TripleInOrder, a = L1, b = L1, Triangle, 500} Scr = Props Params = {string_id = props_string}}
		{Trigger = {TripleInOrder, a = L1, b = L1, Square, 500} Scr = Taunt Params = {Anim = Taunt1 string_id = your_daddy_string}}
		{Trigger = {TripleInOrder, a = L1, b = L1, Circle, 500} Scr = Taunt Params = {Anim = Taunt2 string_id = no_way_string}}
		{Trigger = {TripleInOrder, a = L1, b = L1, X, 500} Scr = Taunt Params = {Anim = Taunt3 string_id = get_some_string}}
		{Trigger = {Press, R1, 20} Scr = ToggleSwitchRegular NGC_Trigger = {Press, R1, 20}}
		{Trigger = {Press, L1, 20} Scr = ToggleNollieRegular NGC_Trigger = {Press, L1, 20}}
	]
	WalkToSkateTransition_GroundTricks =
	[
		{Trigger = {Press, White, 20} Scr = WalkToSkateTransition_ToggleStance NGC_Trigger = {Press, L1, 20}}
		{Trigger = {PressAndRelease, Up, X, 300} Scr = NoComply Params = {Name = 'No Comply' Score = 100}}
	]
	NoTricks =
	[
	]
	Reverts =
	[
		{Trigger = {Press, Black, 200} TrickSlot = ExtraSlot1 NGC_Trigger = {Press, R1, 200}}
		{Trigger = {Press, White, 200} TrickSlot = ExtraSlot2 NGC_Trigger = {Press, L1, 200}}
	]
	Reverts_XBOX =
	[
		{Trigger = {Press, R1, 200} TrickSlot = ExtraSlot1 NGC_Trigger = {Press, R1, 200}}
		{Trigger = {Press, L1, 200} TrickSlot = ExtraSlot2 NGC_Trigger = {Press, L1, 200}}
	]
	script SetExtraTricks_Reverts duration = 20
		if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_REVERTS
			if NOT ((inNetGame) && (GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_REVERTS))
				if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
					SetExtraTricks tricks = Reverts duration = <duration>
				else
					SetExtraTricks tricks = Reverts_XBOX duration = <duration>
				endif
			endif
		endif
	endscript
	script Revert FSName = 'FS Revert' BSName = 'BS Revert' FSAnim = RevertFS BSAnim = RevertBS
		OnExitRun ExitRevert
		ClearLipCombos
		KillExtraTricks
		SetTrickScore 100
		OnGroundExceptions NoEndRun
		LaunchStateChangeEvent State = Skater_InRevert
		if NOT GetGlobalFlag flag = CHEAT_HOVERBOARD
			Obj_SpawnScript CessTrail Params = {repeat_times = 10}
			PlayCessSound
			Vibrate Actuator = 0 Percent = 80 duration = 0.5
			Vibrate Actuator = 1 Percent = 80 duration = 0.1
		endif
		ClearException Ollied
		SetSpecialFriction[0, 0, 5, 10, 15, 25] duration = 0.667
		CanKickOff
		SetQueueTricks NoTricks
		SetSkaterAirManualTricks
		NollieOff
		PressureOff
		if Obj_FlagSet FLAG_SKATER_REVERTFS
			Obj_ClearFlag FLAG_SKATER_REVERTFS
			PlayAnim Anim = <FSAnim>
			SetTrickName <FSName>
		else
			if Obj_FlagSet FLAG_SKATER_REVERTBS
				Obj_ClearFlag FLAG_SKATER_REVERTBS
				PlayAnim Anim = <BSAnim>
				SetTrickName <BSName>
			else
				if LastSpinWas Frontside
					PlayAnim Anim = <FSAnim>
					SetTrickName <FSName>
				else
					PlayAnim Anim = <BSAnim>
					SetTrickName <BSName>
				endif
			endif
		endif
		Display Blockspin
		FlipAfter
		BoardRotateAfter
		BlendPeriodOut 0.0
		Wait 0.1 seconds
		SetException Ex = Ollied Scr = Ollie
		ResetLandedFromVert
		WaitAnimFinished
		CanKickOn
		DoNextManualTrick FromAir
		OnGroundExceptions
		LandSkaterTricks
		ClearEventBuffer
		PlayAnim Anim = CrouchIdle BlendPeriod = 0.30000001
		WaitAnimWhilstChecking AndManuals
		Goto OnGroundAI
	endscript
	script ExitRevert
		CanKickOn
		SetTrickName ''
		SetTrickScore 0
		Display Blockspin
	endscript
	script RevertCheeseTimer
		Obj_SetFlag FLAG_SKATER_REVERTCHEESE
		Wait 25 seconds
		SetTags RevertCheese = 0
		Obj_ClearFlag FLAG_SKATER_REVERTCHEESE
	endscript
	script RevertCheeseIncrement
		Gettags
		<RevertCheese> = (<RevertCheese> + 1)
		SetTags RevertCheese = <RevertCheese>
		return RevertCheese = <RevertCheese>
	endscript
	script ToggleSwitchRegular
		OnGroundExceptions
		SetQueueTricks NoTricks
		ClearTrickQueues
		if NOT GoalManager_GoalShouldExpire
			SetException Ex = Ollied Scr = Ollie Params = {NoDoNextTrick}
		endif
		NollieOff
		if NOT GetGlobalFlag flag = CHEAT_HOVERBOARD
			Obj_SpawnScript CessTrail Params = {delay = 3}
			Vibrate Actuator = 0 Percent = 80 duration = 0.5
			Vibrate Actuator = 1 Percent = 80 duration = 0.1
		endif
		if GotParam PowerSlide
			Rotate y = 180 duration = 0.30000001 seconds
			if LeftPressed
				if Flipped
					PlayAnim Anim = FSPowerslide
				else
					PlayAnim Anim = BSPowerslide
				endif
			else
				if RightPressed
					if Flipped
						PlayAnim Anim = BSPowerslide
					else
						PlayAnim Anim = FSPowerslide
					endif
				else
					PlayAnim Anim = FSPowerslide
				endif
			endif
		else
			if LeftPressed
				if Flipped
					if NOT crouched
						PlayAnim Random(@Anim = CessSlide180_FS @Anim = CessSlide180_FS2)
					else
						PlayAnim Anim = CrouchCessSlide180_FS
					endif
				else
					if NOT crouched
						PlayAnim Anim = CessSlide180_BS
					else
						PlayAnim Anim = CrouchCessSlide180_BS
					endif
				endif
			else
				if RightPressed
					if Flipped
						if NOT crouched
							PlayAnim Anim = CessSlide180_BS
						else
							PlayAnim Anim = CrouchCessSlide180_BS
						endif
					else
						if NOT crouched
							PlayAnim Random(@Anim = CessSlide180_FS @Anim = CessSlide180_FS2)
						else
							PlayAnim Anim = CrouchCessSlide180_FS
						endif
					endif
				else
					if NOT crouched
						PlayAnim Random(@Anim = CessSlide180_FS @Anim = CessSlide180_FS2)
					else
						PlayAnim Anim = CrouchCessSlide180_FS
					endif
				endif
			endif
		endif
		WaitAnim 30 Percent
		if NOT GetGlobalFlag flag = CHEAT_HOVERBOARD
			PlayCessSound
		endif
		WaitAnim 35 Percent
		SetSkaterGroundTricks
		FlipAfter
		BoardRotateAfter
		BlendPeriodOut 0.0
		WaitAnimWhilstChecking AndManuals
		if NOT GotParam PowerSlide
			if CanKick
				PlayAnim Anim = PushCycle Cycle BlendPeriod = 0.0
			else
				if AnimFinished
					if NOT crouched
						PlayAnim Anim = Idle Cycle BlendPeriod = 0.0
					else
						if NOT AnimEquals[CrouchCessSlide180_FS CrouchCessSlide180_BS]
							PlayAnim Anim = Idle Cycle BlendPeriod = 0.0
							PlayAnim Anim = CrouchIdle Cycle BlendPeriod = 0.2
						else
							PlayAnim Anim = CrouchIdle Cycle BlendPeriod = 0.0
						endif
					endif
				endif
			endif
		else
			PlayAnim Anim = CrouchIdle Cycle BlendPeriod = 0.0
		endif
		ClearTrickQueue
		Goto OnGroundAI
	endscript
	script CessTrail repeat_times = 20
		if SpeedGreaterThan 400
			if GotParam delay
				Wait <delay> frames
			endif
			while
				if NOT onground
					break
				else
					if IsXbox
						TextureSplat size = 6 radius = 0 bone = Bone_Board_Tail Name = "skidtrail" trail lifetime = 15
						TextureSplat size = 6 radius = 0 bone = Bone_Board_Nose Name = "skidtrail" trail lifetime = 15
					else
						TextureSplat size = 6 radius = 0 bone = Bone_Board_Tail Name = "skidtrail_ps2" trail lifetime = 15
						TextureSplat size = 6 radius = 0 bone = Bone_Board_Nose Name = "skidtrail_ps2" trail lifetime = 15
					endif
				endif
				Wait 1 game frame
			repeat <repeat_times>
		endif
	endscript
	script ToggleNollieRegular
		OnGroundExceptions
		ClearTrickQueues
		ApplyStanceToggle
		if NOT InNollie
			if NOT InPressure
				if NOT GoalManager_GoalShouldExpire
					SetException Ex = Ollied Scr = Ollie
				endif
				if crouched
					PlayAnim Anim = CrouchToNollie BlendPeriod = 0.1 Backwards
				else
					PlayAnim Anim = SkatingToNollie BlendPeriod = 0.1 Backwards
				endif
			else
				if NOT GoalManager_GoalShouldExpire
					SetException Ex = Ollied Scr = Ollie
				endif
				if crouched
					PlayAnim Anim = CrouchToPressure BlendPeriod = 0.1
				else
					PlayAnim Anim = SkateToPressure BlendPeriod = 0.1
				endif
			endif
		else
			if NOT GoalManager_GoalShouldExpire
				SetException Ex = Ollied Scr = Nollie
			endif
			if crouched
				PlayAnim Anim = CrouchToNollie BlendPeriod = 0.1
			else
				PlayAnim Anim = SkatingToNollie BlendPeriod = 0.1
			endif
		endif
		WaitAnimWhilstChecking AndManuals
		if InNollie
			Goto OnGroundNollieAI
		else
			Goto OnGroundAI
		endif
	endscript
	script ApplyStanceToggle
		if InNollie
			PressureOff
			NollieOff
		else
			if InPressure
				PressureOff
				NollieOn
			else
				NollieOff
				PressureOn
			endif
		endif
	endscript
	script Nollie
		if GotParam NoDoNextTrick
		else
			DoNextTrick
		endif
		ClearTrickQueue
		ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
		Jump
		InAirExceptions
		Vibrate Actuator = 1 Percent = 50 duration = 0.05
		NollieOn
		PlayAnim Anim = Nollie BlendPeriod = 0.1
		if ProfileEquals stance = regular
			if Flipped
				SetTrickName 'Nollie'
				SetTrickScore 200
			else
				SetTrickName 'Fakie Ollie'
				SetTrickScore 200
			endif
		else
			if Flipped
				SetTrickName 'Fakie Ollie'
				SetTrickScore 200
			else
				SetTrickName 'Nollie'
				SetTrickScore 200
			endif
		endif
		Display
		BailOff
		WaitAnimWhilstChecking
		Goto Airborne
	endscript
	script NollieNoDisplay OutSpeed = 1
		StopBalanceTrick
		ClearTrickQueue
		ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
		SetTrickName 'Nollie'
		SetTrickScore 100
		Display Deferred
		Jump
		InAirExceptions
		Vibrate Actuator = 1 Percent = 80 duration = 0.05
		NollieOn
		if GotParam OutAnim
			PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001 Speed = <OutSpeed>
		else
			PlayAnim Anim = Nollie BlendPeriod = 0.1
		endif
		if GotParam BoardRotate
			BlendPeriodOut 0
			BoardRotateAfter
		endif
		BailOff
		WaitAnimWhilstChecking
		Goto Airborne
	endscript
	Dpad = [Up Down Left Right Upright UpLeft DownRight DownLeft]
	script GetPressureState pressure = 0 pressuretimer = 0
		Gettags
		return pressure = <pressure> pressuretimer = <pressuretimer>
	endscript
	script Ollie OutSpeed = 1
		StopBalanceTrick
		StopSkitch
		if GotParam NoDoNextTrick
		else
			DoNextTrick
		endif
		ClearTrickQueue
		ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
		ClearEventBuffer Buttons = [X] OlderThan = 0
		if NOT GotParam JumpSpeed
			Jump
		else
			Jump Speed = <JumpSpeed>
		endif
		InAirExceptions
		if InPressure
			SetTrickName 'Pressure'
			SetTrickScore 200
			Display
		endif
		if InNollie
			if ProfileEquals stance = regular
				if Flipped
					SetTrickName 'Nollie'
					SetTrickScore 200
				else
					SetTrickName 'Fakie Ollie'
					SetTrickScore 200
				endif
			else
				if Flipped
					SetTrickName 'Fakie Ollie'
					SetTrickScore 200
				else
					SetTrickName 'Nollie'
					SetTrickScore 200
				endif
			endif
			Display
		else
			SetTrickName 'Ollie'
			SetTrickScore 75
			Display Deferred
		endif
		Vibrate Actuator = 1 Percent = 50 duration = 0.05
		if GotParam FromLip
			printf "came from lip=================="
			PlayAnim Anim = <OutAnim> BlendPeriod = 0.0
			BlendPeriodOut 0
		else
			if GotParam OutAnim
				if GotParam SyncOutAnimToPreviousAnim
					PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001 Speed = <OutSpeed> SyncToPreviousAnim
				else
					if GotParam NoBlend
						PlayAnim Anim = <OutAnim> BlendPeriod = 0.0 Speed = <OutSpeed>
					else
						PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001 Speed = <OutSpeed>
					endif
				endif
			else
				if InNollie
					PlayAnim Anim = Nollie BlendPeriod = 0.1
				else
					PlayAnim Anim = Ollie BlendPeriod = 0.0 NoRestart
				endif
			endif
		endif
		if GotParam BoardRotate
			BlendPeriodOut 0
			BoardRotateAfter
		endif
		if GotParam RotateAfter
			RotateAfter
		endif
		if GotParam FlipAfter
			printf "=========flipping the skater in Ollie"
			FlipAfter
		endif
		if GotParam NoBlend
			BlendPeriodOut 0
		endif
		if GotParam WaitOnOlliePercent
			BailOn
			WaitAnim <WaitOnOlliePercent> Percent
		endif
		BailOff
		WaitAnimWhilstChecking
		Goto Airborne
	endscript
	script NoComply Anim = NoComply Name = 'No Comply' Score = 100
		ClearTrickQueue
		ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
		Jump
		NollieOff
		PressureOff
		InAirExceptions
		Vibrate Actuator = 1 Percent = 80 duration = 0.05
		SetTrickName <Name>
		SetTrickScore <Score>
		Display
		BailOff
		PlayAnim Anim = <Anim> BlendPeriod = 0.2
		WaitAnimWhilstChecking
		Goto Airborne
	endscript
	script Beanplant
		ClearTrickQueue
		ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
		Jump BonelessHeight
		InAirExceptions
		Vibrate Actuator = 1 Percent = 80 duration = 0.1
		PlaySound boneless09 pitch = 85
		SetTrickName <Name>
		SetTrickScore <Score>
		Display
		PlayAnim Anim = Beanplant BlendPeriod = 0.2
		WaitAnimWhilstChecking
		Goto Airborne
	endscript
	script Fastplant
		ClearTrickQueue
		ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
		Jump BonelessHeight
		InAirExceptions
		Vibrate Actuator = 1 Percent = 80 duration = 0.1
		SetTrickName <Name>
		SetTrickScore <Score>
		Display
		PlayAnim Anim = Fastplant BlendPeriod = 0.2
		BailOff
		WaitAnimWhilstChecking
		Goto Airborne
	endscript
	script Boneless Anim = Boneless Name = 'Boneless' Score = 250
		ClearTrickQueue
		ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
		Jump BonelessHeight
		NollieOff
		PressureOff
		InAirExceptions
		Vibrate Actuator = 1 Percent = 80 duration = 0.1
		PlaySound boneless09 pitch = 85
		SetTrickName <Name>
		SetTrickScore <Score>
		if NOT SkaterIsNamed vallely
			PlayAnim Anim = <Anim> BlendPeriod = 0.2 Speed = <Speed>
		else
			PlayAnim Anim = _540Boneless BlendPeriod = 0.1 Speed = 1.25 from = 10
			SetTrickScore 300
			SetTrickName "MikeV Boneless"
			FlipAfter
			BlendPeriodOut 0
		endif
		Display
		BailOff
		WaitAnimWhilstChecking
		Goto Airborne
	endscript
	script MikeVBoneless
		ClearTrickQueue
		ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
		Jump BonelessHeight
		NollieOff
		PressureOff
		InAirExceptions
		Vibrate Actuator = 1 Percent = 80 duration = 0.1
		PlaySound boneless09 pitch = 85
		SetTrickName 'MikeV Boneless'
		SetTrickScore 200
		PlayAnim Anim = _540Boneless BlendPeriod = 0.1 Speed = 1.25 from = 10
		SetTrickScore 300
		SetTrickName "MikeV Boneless"
		FlipAfter
		BlendPeriodOut 0
		Display
		BailOff
		WaitAnimWhilstChecking
		Goto Airborne
		
		
	endscript
	script BonelessWaitAnimWhilstChecking
		while
			DoNextTrick
			if GotParam AndManuals
				DoNextManualTrick
			endif
			if AnimFinished
				break
			endif
			WaitOneGameFrame
			if onground
				Goto Land
			endif
		repeat
	endscript
	script SendTauntMessage
		GetPreferenceString pref_type = Taunt <string_id>
		SendChatMessage string = <ui_string>
	endscript
	script Taunt
		LandSkaterTricks
		ClearException Ollied
		PlayAnim Anim = <Anim> BlendPeriod = 0.30000001
		GetPreferenceString pref_type = Taunt <string_id>
		if inNetGame
			SendChatMessage string = <ui_string>
		endif
		Wait 10 game frame
		OnGroundExceptions
		if SpeedLessThan 1
			SetRollingFriction 100
			WaitAnimWhilstChecking AndManuals
			Goto Handbrake
		else
			WaitAnimWhilstChecking AndManuals
			Goto OnGroundAI
		endif
	endscript
	script Props
		LandSkaterTricks
		OnGroundExceptions
		PlayAnim Random(@Anim = Prop @Anim = Cheer1) BlendPeriod = 0.30000001
		GetPreferenceString pref_type = Taunt <string_id>
		if inNetGame
			SendChatMessage string = <ui_string>
		endif
		if SpeedLessThan 1
			SetRollingFriction 100
			WaitAnimWhilstChecking AndManuals
			Goto Handbrake
		else
			WaitAnimWhilstChecking AndManuals
			Goto OnGroundAI
		endif
	endscript
	script BitchSlap
		OnGroundExceptions
		PlayAnim Anim = Slapright NoRestart BlendPeriod = 0.30000001
		WaitAnimWhilstChecking AndManuals
		Goto OnGroundAI
	endscript
	script Skitch
		StopBalanceTrick
		ClearExceptions
		ResetLandedFromVert
		KillExtraTricks
		SetEventHandler Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called
		SetException Ex = Ollied Scr = Ollie Params = {<...>}
		SetException Ex = OffMeterTop Scr = SkitchOut
		SetException Ex = OffMeterBottom Scr = SkitchOut
		SetException Ex = CarBail Scr = CarBail
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		LaunchStateChangeEvent State = Skater_Skitching
		ClearTrickQueue
		SetQueueTricks NoTricks
		ClearManualTrick
		SetManualTricks NoTricks
		StartSkitch
		StartBalanceTrick
		PlayAnim Anim = SkitchInit
		WaitAnimFinished
		PlaySound Hud_jumpgap
		SetTrickName "\c2Skitchin\C0"
		SetTrickScore 500
		Display Blockspin
		DoBalanceTrick ButtonA = Right ButtonB = Left Type = Skitch Tweak = 5
		PlayAnim Anim = SkitchRange wobble
		SetEventHandler Ex = SkitchLeft Scr = SkitchAnimLeft
		SetEventHandler Ex = SkitchRight Scr = SkitchAnimRight
		while
			overridelimits max = 1750 friction = 0 time = 5 gravity = 0
			if AnimFinished
				PlayAnim Anim = SkitchRange wobble NoRestart
			endif
			if held Down
				Obj_SpawnScript NoBrake_Timer
				Goto SkitchOut
			endif
			WaitOneGameFrame
		repeat
	endscript
	script SkitchAnimLeft
		PlayAnim Anim = SkitchMoveLeft from = 20 NoRestart Speed = 2 BlendPeriod = 0.1
	endscript
	script SkitchAnimRight
		PlayAnim Anim = SkitchMoveRight from = 20 NoRestart Speed = 2 BlendPeriod = 0.1
	endscript
	script SkitchOut
		StopSkitch
		StopBalanceTrick
		PlayAnim Anim = SkitchInit Backwards
		OnGroundExceptions
		ClearException Skitched
		LandSkaterTricks
		WaitAnimFinished
		Goto OnGroundAI
	endscript
	script NoBrake_Timer
		CanBrakeOff
		Wait 0.5 seconds
		CanBrakeOn
	endscript
	
	
	
	
	
	
	
	
	
	
	
	
