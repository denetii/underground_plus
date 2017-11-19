
	ExcludeFromSkaterDebug =
	[
		waitonegameframe
		waitanimfinished
		waitanimwhilstchecking
		WaitWhilstChecking
		just_coasting
		DoCrouch_slope
		SetClothesInactive
		SetClothesActive
		ShutDownWindyBone
		PlayLeftRightTennisAnim
		PlayBrakeAnim
		CessBrake
		CheckforSwitchVehicles
		cheese_jump
		PlayTurnAnimOrTurnIdle
		SetException
		SetEventHandler
		ClearException
		ClearOnExceptionRun
		ClearExceptionGroup
		WaitWalking
		WaitAnimWalking
		WaitWalkingFrame
		WaitAnimWalkingFrame
		PlaySpeedChosenAnim
		RunSpeedChosenAnim
		CycleSpeedChosenAnim
		hide_run_timer_piece
		SetExceptionHandler
		PlayWalkAnim
		CheckForNetBrake
	]
	CrouchIdles = [CrouchIdle CrouchIdle CrouchIdle2 CrouchIdle2 CrouchIdle4 CrouchIdle4 CrouchLookDown CrouchLookLeft CrouchLookRight CrouchShiftFoot CrouchIdleAdjustFeet]
	CrouchTurnRightIdles = [CrouchTurnRightIdle CrouchTurnRightIdle2]
	CrouchTurnLeftIdles = [CrouchTurnLeftIdle CrouchTurnLeftIdle2]
	CrouchTurnRightAnims = [CrouchTurnRight CrouchTurnRight2]
	CrouchTurnLeftAnims = [CrouchTurnLeft CrouchTurnLeft2]
	TurnRightIdles = [TurnRightIdle]
	TurnLeftIdles = [TurnLeftIdle]
	TurnRightAnims = [TurnRight]
	TurnLeftAnims = [TurnLeft]
	EXPERT_MODE_NO_REVERTS = 0
	EXPERT_MODE_NO_WALKING = 0
	EXPERT_MODE_NO_MANUALS = 0
	perfect_landing_slop = 5
	script DumpSkaterEventHandlerTable
		PrintEventHandlerTable
	endscript
	script KillingSkater
		ClearExceptions
		ClearExceptionGroup Group = RunTimerEvents
		ClearExceptionGroup Group = WalkingEndRunEvents
	endscript
	script SkaterInit
		ClearAllExceptionGroups
		if NOT GotParam no_board
			SwitchOnBoard
		else
			SwitchOffBoard
		endif
		Obj_StopStream
		Unhide
		UnpausePhysics
		NotInBail
		BashOff
		NollieOff
		PressureOff
		NotifyBailDone
		Obj_KillSpawnedScript name = BailBoardControl
		SetSkaterCamLerpReductionTimer time = 0
		ClearLipCombos
		AllowRailTricks
		Obj_KillSpawnedScript name = SetUpLipCombo
		ClearTrickQueues
		StatsManager_Reset
		ResetLandedFromVert
		BlendperiodOut 0
		PressureOff
		if Driving
			if (driving_parked_car = 1)
				if NOT GotParam InCleanup
					car_end_driving_run
				endif
			endif
			ToggleUserControlledVehicleMode
		endif
		InitializeStateChangeEvent
		SetTags racemode = none
		if NOT GotParam NoEndRun
			SetException Ex = RunHasEnded Scr = EndOfRun
			SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
		endif
		StopBalanceTrick
		if Skitching
			StopSkitch
			setstate ground
		endif
		SetEventHandler Ex = KillingSkater Scr = KillingSkater Group = KillingSkaterGroup
		SetEventHandler Ex = DumpSkaterEventHandlerTable Scr = DumpSkaterEventHandlerTable Group = DebugSkaterGroup
		VibrateOff
		ClearSkaterFlags
		SetBoneTransActive bone = breast_cloth_zz 0
		if NOT GotParam NoAnims
			if NOT (in_cinematic_sequence = 1)
				PlayAnim Anim = Idle
			endif
		endif
		Obj_KillSpawnedScript name = BloodSmall
		Obj_KillSpawnedScript name = BloodSplat
		Obj_KillSpawnedScript name = SkaterBloodOn
		RunTimerController_Reset
		ResetSkaterParticleSystems
		LockVelocityDirection Off
		CanBrakeOn
		RestoreAutoKick
		OverrideLimits End
		CleanUpExtraProps
		SetSlomo 1
		kill_blur
		KillExtraTricks
		created_trick_cleanup
		ClearSkaterCamOverride
		LandSkaterTricks
		set_skater_anim_handlers
		if GotParam ReturnControl
			return
		endif
		if IsBoardMissing
			Walk = 1
		endif
		if NOT GotParam Walk
			Goto Switch_OnGroundAi Params = {NewScript = OnGroundAi Restart}
		else
			Goto Switch_OnGroundAi Params = {NewScript = Walking_OnGroundAi Restart}
		endif
	endscript
	script CleanUpExtraProps
		if GameModeEquals is_career
			if levelis load_alc
				kill prefix = "ago_ShoppingCart"
			endif
		endif
	endscript
	script ClientSkaterInit
		SwitchOffAtomic special_item
	endscript
	script OnGroundExceptions
		ClearExceptions
		SetException Ex = GroundGone Scr = GroundGone
		SetException Ex = Ollied Scr = Ollie
		SetException Ex = FlailHitWall Scr = FlailHitWall
		SetException Ex = FlailLeft Scr = FlailLeft
		SetException Ex = FlailRight Scr = FlailRight
		SetException Ex = Carplant Scr = Carplant
		SetException Ex = CarBail Scr = CarBail
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		SetException Ex = Skitched Scr = Skitch
		SetException Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail
		SetException Ex = WallPush Scr = Ground_WallPush
		if NOT GotParam NoEndRun
			SetException Ex = RunHasEnded Scr = EndOfRun
			SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
			if GoalManager_GoalShouldExpire
				ClearException Ollied
				ClearException GroundGone
				ClearException WallPush
			endif
		endif
		SetSkaterGroundTricks
		LaunchStateChangeEvent State = Skater_OnGround
		VibrateOff
		SwitchOnBoard
		EnablePlayerInput
		BailOff
		BashOff
		SetRollingFriction #"default"
		CanSpin
		AllowRailTricks
		SetSkaterCamLerpReductionTimer time = 0
		Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
		BloodParticlesOff
		if NOT GotParam NoEndRun
			ResetLandedFromVert
		endif
	endscript
	script SetSkaterGroundTricks
		if inNetGame
			if NOT GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING
				if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING
					SetQueueTricks Jumptricks GroundTricks SkateToWalkTricks
				else
					SetQueueTricks Jumptricks GroundTricks
				endif
			else
				SetQueueTricks Jumptricks GroundTricks
			endif
		else
			if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING
				SetQueueTricks Jumptricks GroundTricks SkateToWalkTricks
			else
				SetQueueTricks Jumptricks GroundTricks
			endif
		endif
		SetExtraGrindTricks special = SpecialGrindTricks GrindTricks
		if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS
			if NOT ((inNetGame) && (GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS))
				SetManualTricks special = SpecialManualTricks GroundManualTricks
			endif
		endif
	endscript
	script InAirExceptions
		ClearExceptions
		SetException Ex = Landed Scr = Land
		SetException Ex = WallRideLeft Scr = WallRide Params = {Left}
		SetException Ex = WallRideRight Scr = WallRide Params = {Right}
		SetException Ex = WallPlant Scr = Air_WallPlant
		SetException Ex = PointRail Scr = PointRail
		SetEventHandler Ex = Carplant Scr = Carplant
		SetException Ex = CarBail Scr = CarBail
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		SetEventHandler Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBailAir
		SetSkaterAirTricks
		LaunchStateChangeEvent State = Skater_InAir
		if NOT GotParam AllowVibration
			VibrateOff
		endif
		EnablePlayerInput
		BailOff
		BashOff
		SetRollingFriction #"default"
		setstate Air
		CanSpin
		OverrideCancelGround Off
	endscript
	script SetSkaterAirManualTricks
		if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS
			if NOT ((inNetGame) && (GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS))
				SetManualTricks special = SpecialManualTricks Manualtricks
			endif
		endif
	endscript
	script SetSkaterAirTricks
		if InPressure
			if NOT GotParam NoSkateToWalkTricks
				if ((GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING) || ((inNetGame) && (GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING)))
					if NOT GotParam AllowWallplantOllie
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks
					else
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks WallplantOllie
					endif
				else
					if NOT GotParam AllowWallplantOllie
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks
					else
						SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks WallplantOllie
					endif
				endif
			else
				if NOT GotParam AllowWallplantOllie
					SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks
				else
					SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks WallplantOllie
				endif
			endif
		else
			if NOT GotParam NoSkateToWalkTricks
				if ((GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING) || ((inNetGame) && (GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING)))
					if NOT GotParam AllowWallplantOllie
						SetQueueTricks special = SpecialTricks AirTricks
					else
						SetQueueTricks special = SpecialTricks AirTricks WallplantOllie
					endif
				else
					if NOT GotParam AllowWallplantOllie
						SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks
					else
						SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks WallplantOllie
					endif
				endif
			else
				if NOT GotParam AllowWallplantOllie
					SetQueueTricks special = SpecialTricks AirTricks
				else
					SetQueueTricks special = SpecialTricks AirTricks WallplantOllie
				endif
			endif
		endif
		SetExtraGrindTricks special = SpecialGrindTricks GrindTricks
		SetSkaterAirManualTricks
	endscript
	script ClearTrickQueues
		ClearTrickQueue
		ClearManualTrick
		ClearExtraGrindTrick
	endscript
	script OnGroundAi Coasting = 0 Pushes = 0 PressureTimer = 0
		if NOT OnGround
			setstate ground
		endif
		OnGroundExceptions
		NollieOff
		while
			GetSlope
			if LeftPressed
				if Crouched
					if Flipped
						PlayTurnAnimOrTurnIdle TurnIdles = CrouchTurnRightIdles TurnAnims = CrouchTurnRightAnims
					else
						PlayTurnAnimOrTurnIdle TurnIdles = CrouchTurnLeftIdles TurnAnims = CrouchTurnLeftAnims
					endif
				else
					if Flipped
						PlayTurnAnimOrTurnIdle TurnIdles = TurnRightIdles TurnAnims = TurnRightAnims
					else
						PlayTurnAnimOrTurnIdle TurnIdles = TurnLeftIdles TurnAnims = TurnLeftAnims
					endif
				endif
			else
				if RightPressed
					if Crouched
						if Flipped
							PlayTurnAnimOrTurnIdle TurnIdles = CrouchTurnLeftIdles TurnAnims = CrouchTurnLeftAnims
						else
							PlayTurnAnimOrTurnIdle TurnIdles = CrouchTurnRightIdles TurnAnims = CrouchTurnRightAnims
						endif
					else
						if Flipped
							PlayTurnAnimOrTurnIdle TurnIdles = TurnLeftIdles TurnAnims = TurnLeftAnims
						else
							PlayTurnAnimOrTurnIdle TurnIdles = TurnRightIdles TurnAnims = TurnRightAnims
						endif
					endif
				else
					if Crouched
						DoCrouch_slope Slope = <Slope> ChangeInSlope = <ChangeInSlope>
					else
						if Braking
							if SpeedLessThan 1
								PlayBrakeAnim
								if HeldLongerThan Button = down 2 second
									Goto HandBrake
								endif
							else
								if HeldLongerThan Button = down 0.2 second
									CessBrake
								else
									PlayBrakeAnim
								endif
							endif
						else
							if (<Slope> > PUSH_IF_SLOPE)
								if AutoKickIsOff
									OnGround_AutoKickOff_UpHill
								else
									if ShouldMongo
										if AnimEquals MongoPushCycle
											PlayAnim Anim = MongoPushCycle Cycle NoRestart
										else
											PlayAnim Anim = MongoPush NoRestart
											waitanimfinished
											PlayAnim Anim = MongoPushCycle Cycle NoRestart
										endif
									else
										just_coasting
									endif
								endif
							else
								if AutoKickIsOff
									OnGround_AutoKickOff_Flat
								else
									just_coasting
								endif
							endif
						endif
					endif
				endif
			endif
			DoNextTrick
			DoNextManualTrick
			waitonegameframe
			if inNetGame
				CheckForNetBrake
			endif
		repeat
	endscript
	crouch_wobble_params = {
		WobbleAmpA = {(10.10000038,10.10000038) STATS_RAILBALANCE}
		WobbleAmpB = {(10.10000038,10.10000038) STATS_RAILBALANCE}
		WobbleK1 = {(20.0,20.0) STATS_RAILBALANCE}
		WobbleK2 = {(10.0,10.0) STATS_RAILBALANCE}
		SpazFactor = {(1.0,1.0) STATS_RAILBALANCE}
	}
	script PlayTurnAnimOrTurnIdle
		if NOT AnimEquals <TurnIdles>
			if NOT AnimEquals <TurnAnims>
				GetRandomArrayElement <TurnAnims>
				PlayAnim Anim = <Element> NoRestart
				SetTags TurnAnimIndex = <index>
			endif
			if AnimFinished
				GetTags
				index = <TurnAnimIndex>
				PlayAnim Anim = (<TurnIdles>[<index>]) Cycle NoRestart
			endif
		endif
	endscript
	script DoCrouch_slope
		if ((<ChangeInSlope> > 5) || (<ChangeInSlope> < -5))
			if AnimEquals[CrouchBumpUp CrouchBumpDown]
				if AnimFinished
					if (<ChangeInSlope> > 5)
						PlayAnim Anim = CrouchBumpUp Blendperiod = 0.30000001
					else
						PlayAnim Anim = CrouchBumpDown Blendperiod = 0.30000001
					endif
				endif
			else
				if (<ChangeInSlope> > 5)
					PlayAnim Anim = CrouchBumpUp Blendperiod = 0.30000001
				else
					PlayAnim Anim = CrouchBumpDown Blendperiod = 0.30000001
				endif
			endif
		else
			if SpeedLessThan 100
				if Released down
					if NOT AutoKickIsOff
						PlayAnim Anim = CrouchPush1 NoRestart
					endif
				endif
			endif
			if AutoKickIsOff
				if SpeedLessThan 600
					if Held Square
						PlayAnim Anim = CrouchPush1 NoRestart
					endif
				endif
			endif
			if NOT AnimEquals CrouchIdles CrouchPush1 CrouchBumpUp CrouchBumpDown
				GetRandomArrayElement CrouchIdles
				PlayAnim Anim = <Element> NoRestart
			else
				if AnimFinished
					GetRandomArrayElement CrouchIdles
					PlayAnim Anim = <Element> NoRestart
				endif
			endif
		endif
	endscript
	SLOPE_CUTOFF = 40
	PUSH_IF_SLOPE = 2
	script just_coasting
		GetSlope
		if (<Slope> > PUSH_IF_SLOPE)
			if AnimEquals[MongoPushCycle PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5]
				if AnimFinished
					DoAPush
				endif
			else
				PlayAnim Anim = Idle NoRestart
			endif
		else
			if AnimEquals[MongoPushCycle PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5]
				if AnimFinished
					RandomPush = RandomRange(1.0,2.0)
					if (<RandomPush> < 2)
						DoAPush
					else
						PlayAnim Anim = Idle NoRestart
					endif
				endif
			else
				if AnimEquals Idle
					if AnimFinished
						RandomPush = RandomRange(1.0,3.0)
						if (<RandomPush> < 2)
							DoAPush
						else
							PlayAnim Anim = Idle
						endif
					endif
				else
					PlayAnim Anim = Idle NoRestart
				endif
			endif
		endif
	endscript
	script DoAPush
		if ShouldMongo
			PlayAnim Random(@Anim = MongoPushCycle @Anim = Idle) NoRestart
		else
			if AnimEquals[PushCycle PushCycleArms1 PushCycleArms2 PushCycleArms3 PushCycleArms4 PushCycleArms5]
				if AnimFinished
					PlayAnim Random(@Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5) NoRestart
				endif
			else
				PlayAnim Random(@Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5) NoRestart
			endif
		endif
	endscript
	script CheckForNetBrake
		if inNetGame
			GetPreferenceChecksum pref_type = network auto_brake
			if (<checksum> = boolean_true)
				if ScreenElementExists id = current_menu_anchor
					Goto NetBrake
				endif
				if ScreenElementExists id = dialog_box_anchor
					Goto NetBrake
				endif
				if ScreenElementExists id = quit_dialog_anchor
					Goto NetBrake
				endif
				if ScreenElementExists id = controller_unplugged_dialog_anchor
					Goto NetBrake
				endif
			endif
		endif
	endscript
	script PlayBrakeAnim
		if ShouldMongo
			PlayAnim Anim = SlowDownBrake_Mongo NoRestart
		else
			PlayAnim Anim = SlowDownBrake NoRestart
		endif
	endscript
	script CessBrake
		ClearEventBuffer
		if SpeedGreaterThan 300
			PlayAnim Anim = CessSlide180_FS From = Start To = 28 Speed = 1.20000005
			WaitAnim Frame 5
			PlayCessSound
			WaitAnim Frame 25
			PlayAnim Anim = CessSlide180_FS From = 27 To = Start Speed = 1.20000005
			waitanimfinished
		endif
		PlayBrakeAnim
	endscript
	script SlalomBrake
		BigBrake
	endscript
	script BigBrake
		ClearExceptions
		DisablePlayerInput
		WaitOnGround
		SetRollingFriction 20
		StopSkitch
		StopBalanceTrick
		CessBrake
		wait 1 second
		Goto SkaterInit
	endscript
	script OnGround_AutoKickOff_UpHill
		if ShouldMongo
			if Held Square
				PlayAnim Anim = MongoPush NoRestart
				waitanimfinished
				PlayAnim Anim = MongoPushCycle NoRestart
				waitanimfinished
			endif
			PlayAnim Anim = Idle Cycle NoRestart
		else
			if Held Square
				PlayAnim Random(@Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5) NoRestart
				waitanimfinished
			endif
			PlayAnim Anim = Idle Cycle NoRestart
		endif
	endscript
	script OnGround_AutoKickOff_Flat
		if Held Square
			if ShouldMongo
				PlayAnim Anim = MongoPushCycle Cycle NoRestart
			else
				PlayAnim Random(@Anim = PushCycle @Anim = PushCycleArms1 @Anim = PushCycleArms2 @Anim = PushCycleArms3 @Anim = PushCycleArms4 @Anim = PushCycleArms5) NoRestart
				waitanimfinished
				PlayAnim Anim = Idle Cycle NoRestart
			endif
		else
			if AnimEquals[PushCycle MongoPushCycle MongoPush]
			else
				PlayAnim Anim = Idle Cycle NoRestart
			endif
		endif
	endscript
	script NetBrake
		SetRollingFriction 20
		OnExceptionRun NetBrake_out
		CessBrake
		while
			if SpeedLessThan 5
				HandBrake
				if ShouldMongo
					PlayAnim Anim = MongoBrakeIdle Cycle NoRestart
				else
					PlayAnim Anim = BrakeIdle Cycle NoRestart
				endif
			endif
			if ObjectExists id = current_menu_anchor
				waitonegameframe
			else
				if ObjectExists id = dialog_box_anchor
					waitonegameframe
				else
					if ObjectExists id = controller_unplugged_dialog_anchor
						waitonegameframe
					else
						break
					endif
				endif
			endif
		repeat
		SetRollingFriction #"default"
		if SpeedLessThan 5
			Goto HandBrake
		else
			if InNollie
				Goto OnGroundNollieAI
			else
				Goto OnGroundAi
			endif
		endif
	endscript
	script NetBrake_out
		SetRollingFriction #"default"
	endscript
	script HandBrake
		ClearEventBuffer
		OnExceptionRun BrakeDone
		SetRollingFriction 100
		if ShouldMongo
			PlayAnim Anim = NewBrake_Mongo
		else
			PlayAnim Anim = NewBrake
		endif
		while
			DoNextTrick
			if AnimFinished
				break
			endif
			if Crouched
				break
			endif
			wait 1 game Frame
		repeat
		if ShouldMongo
			flip
			BlendperiodOut 0.2
		endif
		while
			if AutoKickIsOff
				if Held Square
					waitonegameframe
					break
				endif
			else
				if Held up
					break
				endif
				if Crouched
					break
				endif
			endif
			if RightPressed
				if Flipped
					PlayAnim Anim = NewBrakeTurnLeft Cycle NoRestart
				else
					PlayAnim Anim = NewBrakeTurnRight Cycle NoRestart
				endif
			else
				if LeftPressed
					if Flipped
						PlayAnim Anim = NewBrakeTurnRight Cycle NoRestart
					else
						PlayAnim Anim = NewBrakeTurnLeft Cycle NoRestart
					endif
				else
					if AnimEquals[NewBrakeIdle NewBrakeIdle3 NewBrakeIdle5 NewBrakeIdle6 NewBrakeIdle7 NewBrakeIdle8]
						if AnimFinished
							PlayBrakeIdle
						endif
					else
						PlayBrakeIdle
					endif
				endif
			endif
			waitonegameframe
			DoNextTrick
			DoNextManualTrick
		repeat
		PlayAnim Anim = NewBrakeIdleToIdle
		wait 0.25 seconds
		SetRollingFriction #"default"
		waitanimwhilstchecking
		if InNollie
			Goto OnGroundNollieAI
		else
			Goto OnGroundAi
		endif
	endscript
	script PlayBrakeIdle
		PlayAnim RandomNoRepeat(@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle2
			@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle3
			@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle4
			@Anim = NewBrakeIdle5
			@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle6
			@Anim = NewBrakeIdle7
			@Anim = NewBrakeIdle8
			@Anim = NewBrakeIdle
			@Anim = NewBrakeIdle)
	endscript
	script BrakeDone
		SetRollingFriction #"default"
	endscript
	script OnGroundNollieAI
		setstate ground
		OnGroundExceptions
		if NOT GoalManager_GoalShouldExpire
			SetException Ex = Ollied Scr = Nollie
		endif
		NollieOn
		while
			if LeftPressed
				if Crouched
					if Flipped
						PlayAnim Anim = NollieCrouchTurnRight NoRestart
					else
						PlayAnim Anim = NollieCrouchTurnLeft NoRestart
					endif
				else
					if Flipped
						PlayAnim Anim = NollieSkatingTurnRight NoRestart
					else
						PlayAnim Anim = NollieSkatingTurnLeft NoRestart
					endif
				endif
			else
				if RightPressed
					if Crouched
						if Flipped
							PlayAnim Anim = NollieCrouchTurnLeft NoRestart
						else
							PlayAnim Anim = NollieCrouchTurnRight NoRestart
						endif
					else
						if Flipped
							PlayAnim Anim = NollieSkatingTurnLeft NoRestart
						else
							PlayAnim Anim = NollieSkatingTurnRight NoRestart
						endif
					endif
				else
					if Crouched
						PlayAnim Anim = NollieCrouchIdle Cycle NoRestart
					else
						if Braking
							if SpeedLessThan 1
								PlayAnim Anim = NollieSkatingIdle NoRestart
								if HeldLongerThan Button = down 2 second
									Goto HandBrake
								endif
							else
								if HeldLongerThan Button = down 0.2 second
									CessBrake
								else
									PlayBrakeAnim
								endif
							endif
						else
							if CanKick
								if AutoKickIsOff
									if ShouldMongo
										if AnimEquals MongoPushCycle
											PlayAnim Anim = MongoPushCycle NoRestart
										else
											PlayAnim Anim = MongoPush NoRestart
											waitanimfinished
											PlayAnim Anim = MongoPushCycle NoRestart
										endif
									else
										PlayAnim Anim = PushCycle NoRestart
									endif
								else
									if ShouldMongo
										if AnimEquals MongoPushCycle
											PlayAnim Anim = MongoPushCycle Cycle NoRestart
										else
											PlayAnim Anim = MongoPush NoRestart
											waitanimfinished
											PlayAnim Anim = MongoPushCycle Cycle NoRestart
										endif
									else
										PlayAnim Anim = PushCycle Cycle NoRestart
									endif
								endif
							else
								if AnimFinished
									PlayAnim Anim = NollieSkatingIdle Cycle NoRestart
								endif
							endif
						endif
					endif
				endif
			endif
			DoNextTrick
			DoNextManualTrick
			CheckForNetBrake
			waitonegameframe
		repeat
	endscript
	script FlailExceptions
		SetException Ex = CarBail Scr = CarBail
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		SetException Ex = RunHasEnded Scr = EndOfRun
		SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
		if GoalManager_GoalShouldExpire
			ClearException Ollied
			ClearException GroundGone
			ClearException WallPush
		endif
		ClearTrickQueue
		ClearManualTrick
		ClearEventBuffer
		LandSkaterTricks
		SpawnClothingLandScript
	endscript
	script FlailHitWall
		Goto FlailLeft
	endscript
	script FlailLeft
		StopBalanceTrick
		FlailExceptions
		FlailVibrate
		if Crouched
			if SpeedGreaterThan 400
				PlayAnim Random(@Anim = FlailLeftCrouched_small @Anim = FlailLeftCrouched2) Blendperiod = 0.03
			else
				PlayAnim Random(@Anim = FlailLeftCrouched2 @Anim = FlailLeftCrouched3) Blendperiod = 0.03
			endif
		else
			PlayAnim Random(@Anim = FlailLeft @Anim = FlailLeft2) Blendperiod = 0.03
		endif
		waitanimwhilstchecking
		if InNollie
			Goto OnGroundNollieAI
		else
			Goto OnGroundAi
		endif
	endscript
	script FlailRight
		StopBalanceTrick
		FlailExceptions
		FlailVibrate
		if Crouched
			if SpeedGreaterThan 400
				PlayAnim Random(@Anim = FlailRightCrouched_small @Anim = FlailRightCrouched2) Blendperiod = 0.03
			else
				PlayAnim Random(@Anim = FlailRightCrouched2 @Anim = FlailRightCrouched3) Blendperiod = 0.03
			endif
		else
			PlayAnim Random(@Anim = FlailRight @Anim = FlailRight2) Blendperiod = 0.03
		endif
		waitanimwhilstchecking
		if InNollie
			Goto OnGroundNollieAI
		else
			Goto OnGroundAi
		endif
	endscript
	script FlailVibrate
		if SpeedGreaterThan 600
			Vibrate Actuator = 1 Percent = 80 Duration = 0.25
		else
			Vibrate Actuator = 1 Percent = 50 Duration = 0.15000001
		endif
	endscript
	script GroundGone
		InAirExceptions
		StopBalanceTrick
		SetException Ex = Ollied Scr = Ollie
		ClearTricksFrom GroundTricks
		if GotParam NoBoneless
			SetSkaterAirTricks
		else
			if ((GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING) || ((inNetGame) && (GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING)))
				SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0
			else
				SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0 SkateToWalkTricks
			endif
		endif
		if Crouched
			PlayAnim Anim = Crouch2InAir
		else
			PlayAnim Anim = Idle2InAir
		endif
		WaitAnimWhilstCheckingLateOllie
		SetSkaterAirTricks
		ClearException Ollied
		Goto Airborne
	endscript
	script WaitAnimWhilstCheckingLateOllie
		while
			if AirTimeGreaterThan Skater_Late_Jump_Slop
				return
			endif
			DoNextTrick TrickParams = {FromGroundGone}
			if AnimFinished
				return
			endif
			wait 1 GameFrame
		repeat
	endscript
	script WaitFramesLateOllie
		while
			if (<Frames> = 0)
				return Frames = 0
			endif
			if AirTimeGreaterThan Skater_Late_Jump_Slop
				return Frames = <Frames>
			endif
			Frames = (<Frames> - 1)
			wait 1 GameFrame
		repeat
	endscript
	script TrickOllie
		Jump
	endscript
	AirAnimParams = {Hold Blendperiod = 0.30000001 NoRestart}
	script Airborne Blendperiod = 0.30000001
		if Obj_FlagSet FLAG_SKATER_INLOOP
			Goto LoopGapStart
		endif
		InAirExceptions <...>
		while
			DoNextTrick
			GetAirTimeLeft
			if (<AirTimeLeft> < 0.40000001)
				PlayAnim Anim = StretchLegsInit Blendperiod = <Blendperiod> NoRestart
				break
			else
				if LeftPressed
					if Flipped
						PlayAnim Anim = AirTurnRight AirAnimParams
					else
						PlayAnim Anim = AirTurnLeft AirAnimParams
					endif
				else
					if RightPressed
						if Flipped
							PlayAnim Anim = AirTurnLeft AirAnimParams
						else
							PlayAnim Anim = AirTurnRight AirAnimParams
						endif
					else
						if Held R2
							PlayAnim Anim = SpineTransfer Blendperiod = 0.30000001 NoRestart
						else
							if Held L2
								PlayAnim Anim = SpineTransfer Blendperiod = 0.30000001 NoRestart
							else
								PlayAnim Anim = AirIdle Cycle Blendperiod = <Blendperiod> NoRestart
							endif
						endif
					endif
				endif
			endif
			waitonegameframe
		repeat
		waitanimwhilstchecking
		while
			DoNextTrick
			waitonegameframe
		repeat
	endscript
	script Land
		SetSkaterCamLerpReductionTimer time = 0
		easy_no_bail = 0
		if GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
			if NOT inNetGame
				<easy_no_bail> = 1
			endif
		endif
		if (<easy_no_bail> = 1)
			ClearTrickQueue
			KillExtraTricks
		else
			GoalManager_GetDifficultyLevel
			if (<difficulty_level> = 0)
				if SpeedGreaterThan 500
					if YawBetween (80.0,100.0)
						Goto YawBail
					endif
				endif
			else
				if SpeedGreaterThan 500
					if YawBetween (60.0,120.0)
						Goto YawBail
					endif
				endif
			endif
			if AbsolutePitchGreaterThan 60
				if PitchGreaterThan 60
					Goto PitchBail
				endif
			endif
			if LandedFromSpine
				GetMatrixNormal
				if (<y> > 0.94999999)
					Printf "Bailing due to landing from spine onto flat ground"
					Goto PitchBail
				endif
			endif
			if RollGreaterThan 50
				Goto DoingTrickBail
			endif
			if DoingTrick
				Printf "DOING A TRICK"
				Goto DoingTrickBail
			endif
		endif
		if GotParam NoBlend
			BlendperiodOut 0
		endif
		if GotParam ReturnBacktoLipLand
		else
			if GotParam IgnoreAirTime
				Goto Land2 Params = {IgnoreAirTime}
			else
				if AirTimeLessThan 0.2 seconds
					Goto Land2 Params = {LittleAir}
				else
					GotoPreserveParams Land2
				endif
			endif
		endif
	endscript
	script Land2 RevertTime = 5
		DoPerfectCheck
		AllowRailTricks
		NollieOff
		PressureOff
		ClearLipCombos
		if LandedFromVert
			OverrideCancelGround
			Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
			GetSpeed
			if (<Speed> > 250)
				SetExtraTricks_Reverts Duration = <RevertTime>
			endif
			if AnimEquals[ToTail_In ToTail_Idle ToTail_Out]
				SetTrickName "To Tail"
				SetTrickScore 500
				Display
				CopingHit Terrain = 3
			endif
		else
			DoNextManualTrick FromAir
		endif
		Vibrate Actuator = 1 Percent = 80 Duration = 0.1
		GetAirtime
		SpawnClothingLandScript
		if Crouched
			if GotParam LittleAir
				PlayAnim Anim = CrouchBumpDown
			else
				if Backwards
					FlipAndRotate
					PlayAnim RandomNoRepeat(@Anim = CrouchedLandTurn @Anim = CrouchedLandTurn1 @Anim = CrouchedLandTurn2 @Anim = CrouchedLandTurn3 @Anim = StretchLegsLand) Blendperiod = 0.0
					BoardRotate
				else
					if YawBetween (45.0,60.0)
						if AirTimeGreaterThan 0.75 second
							PlayAnim Random(@Anim = SketchyCrouchLand @Anim = SketchyLand1) Blendperiod = 0.1
							if InSplitScreenGame
							else
								LaunchPanelMessage "&C1Sketchy" properties = panelcombo
							endif
						else
							PlayLandAnim <...>
						endif
					else
						PlayLandAnim <...>
					endif
				endif
			endif
		else
			if GotParam LittleAir
				PlayAnim Anim = IdleBump
			else
				if Backwards
					FlipAndRotate
					PlayAnim Random(@Anim = CrouchedLandTurn @Anim = CrouchedLandTurn1 @Anim = CrouchedLandTurn2 @Anim = CrouchedLandTurn3) Blendperiod = 0
					BoardRotate
				else
					if YawBetween (45.0,60.0)
						if AirTimeGreaterThan 0.5 second
							PlayAnim Random(@Anim = SketchyLand @Anim = SketchyLand1) Blendperiod = 0.1
							if InSplitScreenGame
							else
								LaunchPanelMessage "&C1Sketchy" properties = panelcombo
							endif
						else
							PlayLandAnim <...>
						endif
					else
						PlayLandAnim <...>
					endif
				endif
			endif
		endif
		ClearTrickQueue
		ClearEventBuffer buttons = [X]
		SetSkaterAirManualTricks
		OnGroundExceptions NoEndRun
		OnExceptionRun LandSkaterTricks
		if GoalManager_GoalShouldExpire
			ClearException Ollied
			ClearException GroundGone
			ClearException WallPush
		endif
		if GotParam NoReverts
		else
			if LandedFromVert
				ResetLandedFromVert
				while
					wait 1
				repeat <RevertTime>
			else
				while
					DoNextManualTrick FromAir
					wait 1
				repeat 10
			endif
		endif
		LandSkaterTricks
		OnGroundExceptions
		CheckForNetBrake
		waitanimwhilstchecking AndManuals
		Goto OnGroundAi
	endscript
	script PlayLandAnim
		if GotParam IgnoreAirTime
			PlayAnim RandomNoRepeat(@Anim = CrouchedLand @Anim = CrouchedLand1 @Anim = CrouchedLand2 @Anim = CrouchedLand3 @Anim = StretchLegsLand) Blendperiod = 0.1
		else
			if AirTimeLessThan 0.5 seconds
				PlayAnim Anim = CrouchBumpDown
			else
				if AirTimeLessThan 0.75 seconds
					PlayAnim RandomNoRepeat(@Anim = CrouchedLand1_small @Anim = CrouchedLand2_small @Anim = CrouchedLand3_small) Blendperiod = 0.1
				else
					PlayAnim RandomNoRepeat(@Anim = CrouchedLand @Anim = CrouchedLand1 @Anim = CrouchedLand2 @Anim = CrouchedLand3 @Anim = StretchLegsLand) Blendperiod = 0.1
				endif
			endif
		endif
	endscript
	script LandSkaterTricks
		if currentscorepotgreaterthan 1500
			SpawnScript LandPointsSound
		endif
		CheckGapTricks
		ClearGapTricks NotInSameFrame
		ClearPanel_Landed
		ClearManualTrick
		OverrideCancelGround Off
		ResetSpin
		Obj_ClearFlag FLAG_SKATER_REVERTCHEESE
	endscript
	script BailSkaterTricks
		ClearGapTricks
		ClearPanel_Bailed
	endscript
	script DoPerfectCheck
		if currentscorepotgreaterthan 1
			if YawBetween (0.0,5.0)
				AwardPerfect
			endif
			if YawBetween (175.0,180.0)
				AwardPerfect
			endif
			if YawBetween (45.0,60.0)
				AwardSloppy
			endif
			if YawBetween (120.0,135.0)
				AwardSloppy
			endif
		endif
	endscript
	script AwardPerfect
		GetSpin
		if (<spin> > 359.0)
			if NOT InSplitScreenGame
				Create_Panel_Message text = "Perfect Landing!" id = perfect rgba = [50 150 50 128] pos = (110.0,340.0) style = perfect_style
				Create_Panel_Message text = "+1000 Points" id = perfect2 rgba = [40 140 40 100] pos = (110.0,360.0) style = perfect_style
			else
				PerfectSloppy_2p text = "Perfect!" rgb = [50 150 50 128]
			endif
			SetTrickName ''
			SetTrickScore 1000
			Display Blockspin NoDegrade
			Obj_SpawnScript PlayPerfectSound Params = {sound = PerfectLanding wait = 0.2 pitch = 80}
		endif
	endscript
	script AwardSloppy
		if currentscorepotgreaterthan 750
			GetSpin
			if (<spin> > 359.0)
				if NOT InSplitScreenGame
					Create_Panel_Message text = "Sloppy Landing" id = perfect rgba = [200 50 50 128] pos = (110.0,340.0) style = sloppy_style
					Create_Panel_Message text = "-500 Points" id = perfect2 rgba = [107 51 27 100] pos = (110.0,360.0) style = sloppy_style
				else
					PerfectSloppy_2p text = "Sloppy!" rgb = [200 50 50 128]
				endif
				SetTrickName ''
				SetTrickScore -500
				Display Blockspin NoDegrade
				Obj_SpawnScript PlayPerfectSound Params = {sound = HUDtrickslopC pitch = 150 wait = 0.12}
			endif
		endif
	endscript
	script PlayPerfectSound
		wait <wait> seconds
		Playsound <sound> pitch = <pitch>
	endscript
	script PerfectSloppy_2p
		ScriptGetScreenMode
		GetSkaterNumber
		switch <screen_mode>
			case split_vertical
				switch <skaternumber>
					case 0
						Create_Panel_Message text = <text> id = perfect rgba = <rgb> pos = (70.0,340.0) style = perfect_style
					case 1
						Create_Panel_Message text = <text> id = perfect_p2 rgba = <rgb> pos = (370.0,340.0) style = perfect_style
				endswitch
			case split_horizontal
				switch <skaternumber>
					case 0
						Create_Panel_Message text = <text> id = perfect rgba = <rgb> pos = (70.0,154.0) style = perfect_style
					case 1
						Create_Panel_Message text = <text> id = perfect_p2 rgba = <rgb> pos = (70.0,375.0) style = perfect_style
				endswitch
		endswitch
	endscript
	script perfect_style
		DoMorph time = 0 scale = (0.0,0.0)
		DoMorph time = 0.1 scale = (0.94999999,0.94999999)
		DoMorph time = 0.1 scale = (0.75,0.75)
		DoMorph time = 0.1 scale = (0.80000001,0.80000001)
		DoMorph time = 0.05 alpha = 0
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 1.20000005 alpha = 0
		die
	endscript
	script sloppy_style
		DoMorph time = 0 scale = (0.0,0.0)
		DoMorph time = 0.1 scale = (0.80000001,0.80000001)
		DoMorph time = 0.02 alpha = 0
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0
		DoMorph time = 0.03 alpha = 1
		DoMorph time = 0.05 alpha = 0
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.04 alpha = 0
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0
		DoMorph time = 0.02 alpha = 1
		DoMorph time = 1 alpha = 0
		die
	endscript
	script WaitOnGround
		while
			if OnGround
				break
			endif
			waitonegameframe
		repeat
	endscript
	script VibrateOff
		Vibrate Off
	endscript
	script EndOfRun_WalkingEvent
		if currentscorepotgreaterthan 0
			return
		endif
		MakeSkaterGoto EndOfRun
	endscript
	script Goal_EndOfRun_WalkingEvent
		if currentscorepotgreaterthan 0
			return
		endif
		Goal_EndOfRun
	endscript
	script SlowSkaterToStop
		MakeSkaterGoto EndOfRun
		WaitForEvent Type = EndofRunDone
	endscript
	script EndOfRun
		ClearExceptions
		if Walking
			ClearAllWalkingExceptions
		endif
		EndOfRunStarted
		CleanUpSpecialItems
		StopBalanceTrick
		LandSkaterTricks
		ClearEventBuffer
		LaunchStateChangeEvent State = Skater_EndOfRun
		SetException Ex = LostGame Scr = LostGame
		DisablePlayerInput AllowCameraControl
		if Skating
			setstate ground
			if NOT GotParam NoBrake
				SetException Ex = SkaterCollideBail Scr = EndBail
				WaitOnGround
				SetRollingFriction 19
				wait 10 Frames
				WaitOnGround
				if SpeedGreaterThan 250
					PlayCessSound
					PlayAnim Anim = CessSlide180_FS
					WaitAnim 50 Percent
					PlayAnim Anim = CessSlide180_FS From = Current To = 0
					Obj_WaitAnimFinished
				else
					PlayAnim Anim = brake Blendperiod = 0.30000001
					Obj_WaitAnimFinished
				endif
				PlayAnim Anim = BrakeIdle Blendperiod = 0.30000001 Cycle
				while
					SetRollingFriction 19
					if SpeedLessThan 40
						if OnGround
							break
						endif
					endif
					waitonegameframe
				repeat
			endif
		else
			if Walking
				if NOT GotParam NoBrake
					if Walk_Ground
						Walk_ScaleAnimSpeed Off
						if SpeedGreaterThan (walk_parameters.max_slow_walk_speed)
							PlayAnim Anim = _180RunSkid NoRestart Blendperiod = 0.0
							Obj_WaitAnimFinished
						endif
						PlayAnim Anim = WStand NoRestart Cycle Blendperiod = 0.30000001
					endif
				endif
			endif
		endif
		if inNetGame
			SetException Ex = WonGame Scr = WonGame
			SetException Ex = LostGame Scr = LostGame
		endif
		wait 1 seconds
		FireEvent Type = EndofRunDone
		if NOT GotParam FromTaxiGuy
			EndofRunDone
		endif
		if inNetGame
			if NOT GameIsOver
				if NOT GameModeEquals is_king
					if NOT GameModeEquals is_score_challenge
						if NOT GotParam FromTaxiGuy
							if NOT GameModeEquals is_goal_attack
								wait 1 seconds
								if GameModeEquals is_firefight
									if NOT IsObserving
										Skater::remove_skater_from_world
									endif
									Create_Panel_Message id = goal_message text = "You've been eliminated!" style = panel_message_generic_loss time = 5000
								else
									Create_Panel_Message id = goal_message text = "Waiting for others to finish. Press \m0 to observe" style = panel_message_generic_loss time = 2000
								endif
								if NOT IsObserving
									EnterSurveyorMode
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endscript
	script Goal_EndOfRun
		ClearExceptions
		ClearExceptionGroup WalkingEndRunEvents
		Goal_EndOfRunStarted
		CleanUpSpecialItems
		StopBalanceTrick
		LandSkaterTricks
		ClearEventBuffer
		FireEvent Type = EndofRunDone
		if NOT GotParam FromTaxiGuy
			Goal_EndOfRunDone
		endif
		if inNetGame
			if GameIsOver
			else
				if GameModeEquals is_king
				else
					if NOT GotParam FromTaxiGuy
						if NOT GameModeEquals is_goal_attack
							Create_Panel_Message id = goal_message text = "Waiting for other players to finish their runs..." style = panel_message_generic_loss
						endif
					endif
				endif
			endif
		endif
	endscript
	script ForceEndOfRun
		VibrateOff
		MakeSkaterGoto EndOfRun
	endscript
	script WonGame
		if Skating
			PlayAnim Random(@Anim = Prop @Anim = Cheer1) Blendperiod = 0.30000001
			EndofRunDone
			waitanimfinished
			if ShouldMongo
				PlayAnim Anim = MongoBrakeIdle Cycle
			else
				PlayAnim Anim = BrakeIdle Cycle
			endif
		else
			EndofRunDone
		endif
	endscript
	script LostGame
		if Skating
			PlayAnim Anim = BrakeDefeat
			waitanimfinished
			EndofRunDone
			if ShouldMongo
				PlayAnim Anim = MongoBrakeIdle Cycle
			else
				PlayAnim Anim = BrakeIdle Cycle
			endif
			waitanimfinished
		else
			EndofRunDone
		endif
	endscript
	script EndBail
		EndofRunDone
		ClearExceptions
		InBail
		TurnToFaceVelocity
		VibrateOff
		PlayAnim Anim = SlipForwards NoRestart Blendperiod = 0.30000001
		wait 10 Frames
		SwitchOffBoard
		wait 10 Frame
		wait 10 Frames
		SetRollingFriction 18
		Vibrate Actuator = 1 Percent = 100 Duration = 0.2
		if NOT GetGlobalFlag flag = BLOOD_OFF
			Obj_SpawnScript BloodSmall
		endif
		WaitAnim 25 Percent fromend
		waitanimfinished
		PlayAnim Anim = GetUpForwards Blendperiod = 0.1
		SetRollingFriction 20
		wait 50 Frames
		SwitchOnBoard
		BoardRotate normal
		waitanimfinished
		NotifyBailDone
		NotInBail
		Goto EndOfRun
	endscript
	script Carplant
		StopBalanceTrick
		ClearExceptions
		InAirExceptions
		ClearException Carplant
		Playsound GrindMetalOn Random(@pitch = 80 @pitch = 90 @pitch = 85)
		Obj_SpawnScript CarSparks
		DoCarPlantBoost
		SetTrickName "Car Plant"
		SetTrickScore 400
		Display
		if DoingTrick
		else
			PlayAnim Anim = Beanplant Blendperiod = 0.30000001
			waitanimwhilstchecking
			Goto Airborne
		endif
	endscript
	script CarSparks
		SetSparksTruckFromNollie
		SparksOn
		wait 0.333 seconds
		SetException Ex = Carplant Scr = Carplant
		wait 3 seconds
		SparksOff
	endscript
	script FreezeSkater
		SwitchOnBoard
		ClearExceptions
		SetQueueTricks NoTricks
		DisablePlayerInput
		SetRollingFriction 10000
		PlayAnim Anim = StandIdle Cycle
	endscript
	script CarBail
		StopBalanceTrick
		InBail
		Obj_SpawnScript BloodCar
		Playsound BonkMetal_11
		Playsound Random(@hitblood01 @hitblood02 @hitblood03)
		Goto NoseManualBail
	endscript
	script FlailingFall
		InBail
		ClearExceptions
		SetQueueTricks NoTricks
		DisablePlayerInput AllowCameraControl
		PlayAnim Anim = StretchtoFlailingFall Blendperiod = 0.30000001
		BailSkaterTricks
		WaitAnim 90 Percent
		SwitchOffBoard
		waitanimfinished
		PlayAnim Anim = FlailingFall Cycle
	endscript
	script DropIn DropInAnim = DropIn
		Printf "DropIn"
		if GameModeEquals is_horse
			Printf "**** IN DROPIN ****"
			GetCurrentSkaterID
			KenTest1
			printstruct <...>
			if NOT IsCurrentHorseSkater <objId>
				Printf "**** WASN'T CURRENT HORSE PLAYER ****"
				return
			endif
		endif
		ResetSkaterParticleSystems
		PausePhysics
		RestartSkaterExceptions
		SetSkaterCamOverride heading = 0 tilt = -0.75 time = 0.000001 zoom = 5
		OnExitRun DropIn_Cleanup
		SetRollingFriction 10000
		DisablePlayerInput
		PlayAnim Anim = <DropInAnim> Blendperiod = 0.0
		WaitAnim 60 Percent
		ClearSkaterCamOverride
		WaitAnim 85 Percent
		UnpausePhysics
		setstate ground
		SetRollingFriction 0
		waitanimfinished
		EnablePlayerInput
		OnGroundExceptions
		waitonegameframe
		SetLandedFromVert
		Goto Land
	endscript
	script DropIn_Cleanup
		ClearSkaterCamOverride
		EnablePlayerInput
		SetRollingFriction #"default"
	endscript
	script ZoomIn
		Skater::SetSkaterCamOverride heading = 0 time = 0.00001 zoom = 1.03999996
	endscript
	script ZoomOut
		Skater::ClearSkaterCamOverride
	endscript
	script StartSkating1
		RestartSkaterExceptions
		SetRollingFriction #"default"
		DisablePlayerInput AllowCameraControl
		if ProfileEquals is_named = mullen
			SetRollingFriction 10000
			PlayAnim Anim = MullenStart Blendperiod = 0.0
			WaitAnim 40 Percent
			Playsound boneless09 pitch = 110
			PlayBonkSound
			BlendperiodOut 0
			WaitAnim 60 Percent
			SetRollingFriction #"default"
		else
			if NOT Flipped
				flip
			endif
			if AutoKickIsOff
				if ShouldMongo
					PlayAnim Anim = MongoBrakeIdle
				else
					PlayAnim Anim = BrakeIdle
				endif
			else
				PlayAnim Anim = StartSkating1 Blendperiod = 0.0
				WaitAnim 75 Percent
			endif
		endif
		ClearSkaterCamOverride
		EnablePlayerInput
		OnGroundExceptions
		waitanimfinished
		Goto OnGroundAi
	endscript
	script PedProps name = "Ped Props" score = 500
		if InSplitScreenGame
		else
			LaunchPanelMessage "Spectator Bonus" properties = Panelcombo2
		endif
		if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
			Playsound ExtraTrick Vol = 100
		endif
		SetTrickName <name>
		SetTrickScore <score>
		Display Blockspin
		waitonegameframe
		if OnGround
			if DoingTrick
			else
				LandSkaterTricks
			endif
		endif
	endscript
	script RestartSkaterExceptions
		AllowRailTricks
		BoardRotate normal
		ClearExceptions
		ClearTrickQueue
		SetQueueTricks NoTricks
		ClearManualTrick
		ClearEventBuffer
		SwitchOnBoard
	endscript
	script LaunchSpecialMessage text = "Special Trick" Vol = 100 pitch = 100
		if InMultiplayergame
			if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
				Playsound HUD_specialtrickAA Vol = <Vol> pitch = <pitch>
			endif
		else
			if (GetGlobalFlag flag = CHEAT_COOL_SPECIAL_TRICKS)
				if GotParam Cool
					SetSlomo 0.60000002
					pulse_blur Start = 0 End = 150 Speed = 10
					if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
						Playsound HUD_specialtrickAA Vol = 200 pitch = 75
					endif
					OnExceptionRun KillSpecial
				else
					if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
						Playsound HUD_specialtrickAA Vol = <Vol> pitch = <pitch>
					endif
				endif
			else
				if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
					Playsound HUD_specialtrickAA Vol = <Vol> pitch = <pitch>
				endif
			endif
		endif
	endscript
	script EndSpecial
		if (GetGlobalFlag flag = CHEAT_COOL_SPECIAL_TRICKS)
			pulse_blur Start = 150 End = 0 time = 10
			SetSlomo 1
		endif
	endscript
	script KillSpecial
		kill_blur
		SetSlomo 1
	endscript
	script LaunchExtraMessage text = "Hidden Combo!"
		if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
			Playsound ExtraTrick Vol = 80
		endif
	endscript
	script PedKnockDown
		if ObjectExists id = speech_box_anchor
			DestroyScreenElement id = speech_box_anchor
		endif
		if ObjectExists id = goal_start_dialog
			DestroyScreenElement id = goal_start_dialog
		endif
		Obj_SpawnScript BloodSmall
		if Skating
			SetRollingFriction 0
			StopBalanceTrick
			if OnLip
				StopBalanceTrick
				setstate Air
				Move z = 1
				Move y = 1
			endif
			if GotParam Jump
				SetSpeed -150
				wait 1 game Frame
				Jump
				FlipAndRotate
				GotoRandomScript[Faceplant Facesmash NoseManualBail ManualBail Hipper TailslideOut]
			endif
			if Backwards
				GotoRandomScript[BackwardFaceSlam Shoulders]
			else
				if Onrail
					Goto FiftyFiftyFall
				else
					GotoRandomScript[Faceplant LandPartiallyOnBoard Facesmash NoseManualBail ManualBail Hipper Spasmodic TailslideOut]
				endif
			endif
		else
			Goto WalkBailState
		endif
	endscript
	script SkaterAvoidGoalPed
		if GotParam heading
			Skater::Rotate y = <heading>
		endif
		if NOT Skater::SpeedGreaterThan 100
			Skater::SetSpeed <Speed>
		endif
		SetException Ex = CarBail Scr = CarBail
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		Skater::FlailVibrate
		Skater::NollieOff
		Skater::StopBalanceTrick
		Skater::Obj_PlaySound Random(@BailSlap03) 
		if NOT Skater::Walking
			MakeSkaterGoto FlailHitWall
		endif
	endscript
	script SkaterBreakGlass
		SetException Ex = CarBail Scr = CarBail
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		FlailVibrate
		NollieOff
		PressureOff
		StopBalanceTrick
		if AnimEquals[CrouchIdle SkateIdle Land MongoPushCycle PushCycle]
			Goto FlailHitWall
		endif
		if AnimEquals[runout runoutquick Smackwallupright]
			Goto Bailsmack Params = {SmackAnim = Smackwallupright}
		endif
		if InAir
			Goto Airborne
		else
			if IsInBail
				if AnimEquals[Smackwallfeet NutterFallBackward FiftyFiftyFallBackward BackwardsTest BackwardFaceSlam Smackwallfeet SlipBackwards]
					Goto Bailsmack Params = {SmackAnim = Smackwallfeet}
				else
					Goto Bailsmack Params = {<...>}
				endif
			endif
			Goto OnGroundAi
		endif
	endscript
	TRANSFER_POINTS = 250
	ACID_DROP_POINTS = 250
	ACID_BOMB_POINTS = 350
	script SkaterAwardTransfer name = "Spine Transfer"
		SetTrickName <name>
		SetTrickScore TRANSFER_POINTS
		Display NoDegrade
		LaunchSubStateEntryEvent SubState = Transfer
		if NOT DoingTrick
			GetTags
			if (<racemode> = none)
				setstate Air
				InAirExceptions
				PlayAnim Anim = SpineTransfer
			endif
		endif
	endscript
	script SkaterAwardHipTransfer
		SkaterAwardTransfer name = "Hip Transfer"
	endscript
	script SkaterAcidDropTriggered
		LaunchSubStateEntryEvent SubState = AcidDrop
		SetTrickName 'Acid Drop'
		if (<DropHeight> < 350)
			SetTrickScore ACID_DROP_POINTS
		else
			SetTrickScore ACID_BOMB_POINTS
		endif
		Display NoDegrade
	endscript
	script PlayAnim_InLoop
		if AnimEquals <Anim>
			if NOT AnimFinished <Anim>
				PlayAnim Anim = <Anim> NoRestart
			else
				PlayAnim Anim = <Cycle> Cycle NoRestart
			endif
		else
			PlayAnim Anim = <Cycle> Cycle NoRestart
		endif
	endscript
	script MakeSkaterFly
		MakeSkaterGoto FlyAi
	endscript
	script FlyAi Move = 8
		ClearExceptions
		SetQueueTricks NoTricks
		SetSpeed 0
		setstate Air
		SetRollingFriction 1000
		NoRailTricks
		while
			if Held R2
				Jump
				wait 8 Frames
			endif
			if Held L1
				break
			endif
			if Held L2
				if Held Square
					Move X = 18
				endif
				if Held Circle
					Move X = -18
				endif
				if Held Triangle
					Move z = 18
				endif
				if Held X
					Move z = -18
				endif
			else
				if Held Square
					Move X = 6
				endif
				if Held Circle
					Move X = -6
				endif
				if Held Triangle
					Move z = 8
				endif
				if Held X
					Move z = -8
				endif
			endif
			waitonegameframe
		repeat
		AllowRailTricks
		MakeSkaterGoto OnGroundAi
	endscript
