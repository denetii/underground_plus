
	Ksk_SwitchControl_Trigger = {Trigger = {PressTwoAnyOrder, R1, L1, 400}}
	Ksk_OffBoard_Trigger = {Trigger = {PressTwoAnyOrder, Black, White, 200}}
	Ksk_SwitchControl_Trigger_XBOX = {
		Trigger = {Press, Black, 10}
		Xbox_Trigger = {Press, Black, 10}
		NGC_Trigger = {Press, z, 10}
		Alt_Trigger = {Press, White, 10}}
	
	WalkGroundTricks = [
		{Ksk_SwitchControl_Trigger Scr = WalkingRunToSkating}
	]
	WalkGroundTricks_XBOX = [
		{Ksk_SwitchControl_Trigger_XBOX Scr = WalkingRunToSkating}
	]
	WalkAirTricks = [
		{Ksk_SwitchControl_Trigger Scr = WalkingAirToSkating}
	]
	WalkAirTricks_XBOX = [
		{Ksk_SwitchControl_Trigger_XBOX Scr = WalkingAirToSkating}
	]
	SkateToWalkTricks = [
		{Ksk_SwitchControl_Trigger Scr = CheckforSwitchVehicles}
	]
	SkateToWalkTricks_XBOX = [
		{Ksk_SwitchControl_Trigger_XBOX Scr = CheckforSwitchVehicles}
	]
	
	FlipRoll =
	[
		{Trigger = {TripleInOrder, a = Down, b = Down, Black, 300} Scr = Ksk_Backflip}
		{Trigger = {TripleInOrder, a = Up, b = Up, Black, 300} Scr = Ksk_Frontflip}
		{Trigger = {TripleInOrder, a = Left, b = Left, Black, 300} Scr = Ksk_FSRoll}
		{Trigger = {TripleInOrder, a = Right, b = Right, Black, 300} Scr = Ksk_BSRoll}
	]
	FlipRoll_WithWalking =
	[
		{Trigger = {TripleInOrder, a = Down, b = Down, Black, 300} Scr = Ksk_Backflip}
		{Trigger = {TripleInOrder, a = Up, b = Up, Black, 300} Scr = Ksk_Frontflip}
		{Trigger = {TripleInOrder, a = Left, b = Left, Black, 300} Scr = Ksk_FSRoll}
		{Trigger = {TripleInOrder, a = Right, b = Right, Black, 300} Scr = Ksk_BSRoll}
		{Ksk_SwitchControl_Trigger Scr = CheckforSwitchVehicles}
	]
	
	ExitBoardComponents = [
		{
			component = suspend
		}
		{
			component = rigidbody
			coeff_friction = 0.69999999
			coeff_restitution = 0.15000001
			const_acc = -500
			mass_over_moment = 0.007
			center_of_mass = (0.0,3.0,0.0)
			spring_const = 10
			linear_velocity_sleep_point = 3
			angular_velocity_sleep_point = 0.1
			skater_collision_radius = 28
			skater_collision_application_radius = 8
			skater_collision_impulse_factor = 1.0
			contacts = [
				(6.0,7.0,18.0)
				(6.0,7.0,-18.0)
				(-6.0,7.0,18.0)
				(-6.0,7.0,-18.0)
				(6.0,0.0,13.0)
				(6.0,0.0,-13.0)
				(-6.0,0.0,13.0)
				(-6.0,0.0,-13.0)
			]
			directed_friction = [
				{none}
				{none}
				{none}
				{none}
				{(1.0,0.0,0.0)}
				{(1.0,0.0,0.0)}
				{(1.0,0.0,0.0)}
				{(1.0,0.0,0.0)}
			]
			SoundType = SkaterBoardWhenBail
		}
		{
			component = skeleton
			skeletonName = thps5_human
		}
		{
			component = model
			UseModelLights
			ShadowVolume = 1
			model = "board_default/board_default.mdl"
		}
		{
			component = modellightupdate
		}
		{
			component = Sound
		}
		{component = skaterproximity}
	]
	
	Walking_Air_ExtraTricks =
	[
		{Trigger = {InOrder, a = White, b = White, 300} Scr = KskAirBackflipState}
		{Trigger = {InOrder, a = Black, b = Black, 300} Scr = KskAirFrontflipState}
	]
	
	script ToTail
		if NOT InVertAir
			RestoreEvents UsedBy = Regular Duration = 200
			Goto Airborne
		endif
		
		OnExitRun ToTail_Cleanup
		NoRailTricks
		PlayAnim Anim = ToTail_In Speed = 1.25
		NoSpin
		while
			if Released Triangle
				if AnimEquals ToTail_Idle
					PlayAnim Anim = ToTail_Out
				else
					PlayAnim Anim = ToTail_In From = Current To = Start
				endif
				break
			else
				if AnimEquals ToTail_In
					if AnimFinished
						PlayAnim Anim = ToTail_Idle Cycle
					endif
				endif
			endif
			DoNextTrick
			Wait 1 game frame
		repeat
		WaitAnimWhilstChecking
		Goto Airborne
	endscript
	script ToTail_Cleanup
		Printf "Cleanup"
		AllowRailTricks
		CanSpin
	endscript
	
	script KskBigBrake
		ClearExceptions
		WaitOnGround
		SetRollingFriction 20
		StopSkitch
		StopBalanceTrick
		
		ClearEventBuffer
		if SpeedGreaterThan 300
			if Crouched
				PlayAnim Anim = CrouchCessSlide180_FS From = Start To = 28 Speed = 1.20000005
				WaitAnim frame 5
				PlayCessSound
				WaitAnim frame 25
				PlayAnim Anim = CrouchCessSlide180_FS From = 27 To = Start Speed = 1.20000005
			else
				PlayAnim Anim = CessSlide180_FS From = Start To = 28 Speed = 1.20000005
				WaitAnim frame 5
				PlayCessSound
				WaitAnim frame 25
				PlayAnim Anim = CessSlide180_FS From = 27 To = Start Speed = 1.20000005
			endif
			
			waitanimfinished
		endif
		Goto HandBrake
	endscript
	
	script Ksk_Backflip
		SetException Ex = Landed Scr = PitchBail
		BailOn
		RotateDisplay x Duration = 0.69999999 Seconds StartAngle = 0.0 EndAngle = -360.0 SinePower = 0 RotationOffset = (0.0,30.0,0.0)
		SetTrickName "Backflip"
		SetTrickScore 500
		Display
		Wait 0.60000002 Seconds
		Bailoff
		Goto Airborne
	endscript
	script Ksk_Frontflip
		SetException Ex = Landed Scr = PitchBail
		BailOn
		RotateDisplay x Duration = 0.75 Seconds StartAngle = 0.0 EndAngle = 360.0 SinePower = 0 RotationOffset = (0.0,30.0,0.0)
		SetTrickName "Frontflip"
		SetTrickScore 500
		Display
		Wait 0.60000002 Seconds
		Bailoff
		Goto Airborne
	endscript
	script Ksk_FSRoll
		SetException Ex = Landed Scr = YawBail
		BailOn
		RotateDisplay z Duration = 0.75 Seconds StartAngle = 0.0 EndAngle = 360.0 SinePower = 0 RotationOffset = (0.0,30.0,0.0)
		SetTrickName "FS Roll"
		SetTrickScore 500
		Display
		Wait 0.60000002 Seconds
		Bailoff
		Goto Airborne
	endscript
	script Ksk_BSRoll
		SetException Ex = Landed Scr = YawBail
		BailOn
		RotateDisplay z Duration = 0.75 Seconds StartAngle = 0.0 EndAngle = -360.0 SinePower = 0 RotationOffset = (0.0,30.0,0.0)
		SetTrickName "BS Roll"
		SetTrickScore 500
		Display
		Wait 0.60000002 Seconds
		Bailoff
		Goto Airborne
	endscript
	
	
	script Ksk_StartSkating
		RestartSkaterExceptions
		SetRollingFriction #"default"
		DisablePlayerInput AllowCameraControl
		SetRollingFriction 10000
		PlayAnim Anim = MullenStart BlendPeriod = 0.2
		WaitAnim 40 Percent
		Playsound boneless09 pitch = 110
		PlayBonkSound
		BlendPeriodOut 0
		WaitAnim 60 Percent
		SetRollingFriction #"default"
		ClearSkaterCamOverride
		EnablePlayerInput
		OnGroundExceptions
		waitanimfinished
		Goto OnGroundAi
	endscript
	
	script Ksk_StartSkating2
		RestartSkaterExceptions
		SetRollingFriction #"default"
		DisablePlayerInput AllowCameraControl
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
			PlayAnim Anim = StartSkatingPush BlendPeriod = 0.2
			WaitAnim 75 Percent
		endif
		ClearSkaterCamOverride
		EnablePlayerInput
		OnGroundExceptions
		waitanimfinished
		Goto OnGroundAi
	endscript
	
	ksk_board_count = 0
	script CreateExitBoard vel = (0.0,0.0,0.0) rotvel = (0.0,0.0,0.0) object_vel_factor = 0
		Change ksk_board_count = (ksk_board_count + 1)
		Ksk_DebugValue value_name = "board count" value_value = ksk_board_count
		
		Obj_GetId
		
		MangleChecksums a = ExitBoard b = <ObjId>
		
		Skeleton_SpawnCompositeObject <...> offset = (0.0,3.0,2.0) bone = Bone_Board_Root components = BailBoardComponents Params = {name = <mangled_id> cloneFrom = <ObjId> geoms = [Board]}
		<mangled_id>::RigidBody_IgnoreSkater 15 frames
		<mangled_id>::RigidBody_Wake
		<mangled_id>::Obj_Invisible
		if GotParam DontMatchSpeed
		else
			<mangled_id>::Rigidbody_MatchVelocityTo skater
		endif
		RunScriptOnObject ksk_exit_board_ex Id = <mangled_id>
		
	endscript
	
	script ksk_exit_board_ex
		ClearExceptions
		Obj_SetInnerRadius 4
		Obj_SetOuterRadius 4000
		Wait 35 frames
		SetException Ex = SkaterInRadius Scr = ksk_exit_board_handler
		SetException Ex = SkaterOutOfRadius Scr = ksk_exit_board_toofar
	endscript
	
	script ksk_exit_board_toofar
		Die
	endscript
	
	script ksk_exit_board_handler
		ClearExceptions
		
		if skater::IsBoardMissing
			Obj_GetOrientationToObject skater
			Ksk_DebugValue value_name = "orientation" value_value = <dotProd>
			skater::ReturnBoardToSkater
			skater::SwitchToSkatingPhysics
			if skater::InAir
				MakeSkaterGoto WalkingToRailTrick
			endif
			if skater::OnGround
				MakeSkaterGoto WalkingRunToSkating
			endif
			Die
		else
			if ControllerPressed Triangle
				if skater::InAir
					BroadcastEvent Type = SkaterPointRail
					skater::DoCarPlantBoost
					Obj_Playsound OllieWood
					MakeSkaterGoto PointRail
				endif
				
			endif
		endif
		
		Wait 30 gameframes
		SetException Ex = SkaterInRadius Scr = ksk_exit_board_handler
	endscript
	
	
	
	
	script kskOffBoard_FromAir
		TakeBoardFromSkater
		CreateExitBoard vel = (0.0,0.0,0.0) rotvel = (5.0,2.0,7.0) object_vel_factor = 0.1
		Goto kskOffBoard_Air
	endscript
	
	script kskOffBoard_FromGround
        if (UNDERGROUNDPLUS_ENABLE_EXITBOARD = UNDERGROUNDPLUS_OPTION_OFF)
            Goto OnGroundAi
        else
            ClearTrickQueue
            ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
            ClearEventBuffer Buttons = [x] OlderThan = 0
            
            ClearExceptions
            LaunchStateChangeEvent State = Skater_InAir
            SetExtraTricks NoTricks
            SetQueueTricks NoTricks
            
            TakeBoardFromSkater
            CreateExitBoard vel = (0.0,0.0,0.0) rotvel = (10.0,0.0,2.0) object_vel_factor = 0.0
            Jump BonelessHeight
            PlayAnim Anim = Ollie BlendPeriod = 0.2 NoRestart
            Goto kskOffBoard_Air
        endif
	endscript
	
	script kskOffBoard_Air BlendPeriod = 0.30000001
		ClearExceptions
		KillExtraTricks
		SetQueueTricks NoTricks
		SetExtraTricks FlipRoll_WithWalking
		NoRailTricks
		
		SetException Ex = Wallplant Scr = kskOffBoard_Wallplant
		SetException Ex = Landed Scr = kskOffBoard_Land
		SetException Ex = FlailHitWall Scr = BailSmack Params = {}
		SetException Ex = FlailLeft Scr = BailSmack Params = {}
		SetException Ex = FlailRight Scr = BailSmack Params = {}
		
		PlayWalkAnim Anim = JumpAir Cycle BlendPeriod = <BlendPeriod> NoRestart
		
		
		while
			while
				DoNextTrick
				GetAirTimeLeft
				GetAirtime
				if (<AirTimeLeft> < 0.40000001)
					if AirTimeGreaterThan 1.0 Seconds
						if Released x
							Goto kskOffBoard_Air_FlailingFall
						endif
					endif
					break
				endif
				waitonegameframe
			repeat
			WaitAnimWhilstChecking
			
			DoNextTrick
			waitonegameframe
		repeat
	endscript
	
	script kskOffBoard_Land
		SetSkaterCamLerpReductionTimer time = 0
		GetSpeed
		
		if SpeedGreaterThan 500
			if YawBetween (80.0,100.0)
				ClearComboBonusPot
				Goto YawBail
			endif
			if YawBetween (60.0,120.0)
				ClearComboBonusPot
				Goto YawBail
			endif
		endif
		if AbsolutePitchGreaterThan 60
			if PitchGreaterThan 60
				ClearComboBonusPot
				Goto PitchBail
			endif
		endif
		if LandedFromSpine
			GetMatrixNormal
			if (<y> > 0.94999999)
				Printf "Bailing due to landing from spine onto flat ground"
				ClearComboBonusPot
				Goto PitchBail
			endif
		endif
		if RollGreaterThan 50
			ClearComboBonusPot
			Goto DoingTrickBail
		endif
		if DoingTrick
			ClearComboBonusPot
			Goto DoingTrickBail
		endif
		
		DoPerfectCheck
		NollieOff
		PressureOff
		ClearLipCombos
		
		if LandedFromVert
			OverrideCancelGround
			Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
			GetSpeed
		endif
		Vibrate Actuator = 1 Percent = 80 Duration = 0.1
		GetAirtime
		SpawnClothingLandScript
		if Backwards
			FlipAndRotate
			BoardRotate
		endif
		
		ClearTrickQueue
		OnGroundExceptions NoEndRun
		OnExceptionRun LandSkaterTricks
		if GoalManager_GoalShouldExpire
			ClearException Ollied
			ClearException GroundGone
			ClearException WallPush
		endif
		
		LandSkaterTricks
		ClearComboBonusPot
		CheckForNetBrake
		
		if AirTimeLessThan 1.0 Seconds
			if SpeedGreaterThan 300
				PlayAnim Anim = JumpLandToWalk
			else
				PlayAnim Anim = JumpLandToStand
			endif
		else
			if SpeedGreaterThan 300
				PlayAnim Anim = RunJumpLand
			else
				PlayAnim Anim = BigJumpLandToWalk
			endif
		endif
		SetRollingFriction 20
		SwitchToWalkingPhysics
		WaitAnimWhilstChecking
		Goto StandState
	endscript
	
	script kskOffBoard_Wallplant
		
		PressureOff
		NollieOff
		ClearException Ollied
		LaunchStateChangeEvent State = Skater_InWallplant
		Vibrate Actuator = 1 Percent = 100 Duration = 0.1
		SetTrickName ""
		SetTrickScore 0
		Display Blockspin
		PlayAnim Anim = Wallplant_Ollie BlendPeriod = 0
		SetTrickName 'Wallplant'
		SetTrickScore 750
		Display
		GetStartTime
		while
			GetElapsedTime StartTime = <StartTime>
			if (<ElapsedTime> > Post_Wallplant_No_Ollie_Window)
				break
			endif
			DoNextTrick
			Wait 1 GameFrame
		repeat
		ClearEventBuffer Buttons = [x] OlderThan = 0
		SetSkaterAirTricks AllowWallplantOllie
		GetStartTime
		while
			GetElapsedTime StartTime = <StartTime>
			if (<ElapsedTime> > Post_Wallplant_Allow_Ollie_Window)
				break
			endif
			DoNextTrick
			Wait 1 GameFrame
		repeat
		WaitAnimWhilstChecking
		Goto kskOffBoard_Air
	endscript
	
	script kskOffBoard_Air_FlailingFall
		PlayAnim Anim = FlailingFall PingPong From = End To = 5 Speed = 1.20000005 BlendPeriod = 0.1
		
		ClearExceptions
		SetException Ex = Landed Scr = kskOffBoard_Air_BailLand
	endscript
	
	script kskOffBoard_Air_BailLand
		Goto kskOffBoard_GeneralBail Params = {Anim1 = RollingBail Anim2 = RollingGetup}
	endscript
	
	script kskOffBoard_GeneralBail Friction = 18 Friction2 = 20 HeavyFriction = 100
		Obj_SetBoundingSphere 100
		
		ClearEventBuffer Buttons = [x]
		NollieOff
		PressureOff
		KillSpecial
		created_trick_cleanup
		
		SetSkaterCamLerpReductionTimer time = 0
		InBail
		LaunchStateChangeEvent State = Skater_InBail
		SetExtraPush radius = 48 Speed = 100 Rotate = 6
		TurnToFaceVelocity
		
		SparksOff
		VibrateOff
		ClearExceptions
		DisablePlayerInput AllowCameraControl
		BailSkaterTricks
		StopBalanceTrick
		if GotParam GroundGoneBail
			SetException Ex = GroundGone Scr = <GroundGoneBail> Params = {<...>}
		endif
		if GotParam SmackAnim
			SetException Ex = FlailHitWall Scr = BailSmack Params = {SmackAnim = <SmackAnim>}
			SetException Ex = FlailLeft Scr = BailSmack Params = {SmackAnim = <SmackAnim>}
			SetException Ex = FlailRight Scr = BailSmack Params = {SmackAnim = <SmackAnim>}
		endif
		if InSlapGame
			SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		else
			if GameModeEquals is_firefight
				SetEventHandler Ex = SkaterCollideBail Scr = Bail_FireFight_SkaterCollideBail
			endif
		endif
		if GotParam Sound
		else
			PlayBonkSound
		endif
		if GotParam NoBlending
			PlayAnim Anim = <Anim1> NoRestart BlendPeriod = 0.0
		else
			PlayAnim Anim = <Anim1> NoRestart BlendPeriod = 0.30000001
		endif
		if GotParam BashOff
		else
			BashOn
		endif
		
		WaitOnGround
		if NOT GotParam NoScuff
			if NOT GetGlobalFlag flag = BLOOD_OFF
				Scuff_skater
			endif
		endif
		if NOT GetGlobalFlag flag = BLOOD_OFF
			if GotParam Bloodframe
				WaitAnim frame <Bloodframe>
				Obj_SpawnScript BloodSmall
				Playsound Random(@hitblood01 @hitblood02 @hitblood03)
			endif
		endif
		Vibrate Actuator = 1 Percent = 100 Duration = 0.2
		SetRollingFriction <HeavyFriction>
		
		Wait 3 frames
		SetRollingFriction <Friction>
		WaitAnim 30 Percent
		SpeedCheckStop
		SetRollingFriction <Friction2>
		WaitAnim 50 Percent
		SpeedCheckStop
		BashOn
		
		WaitAnim 75 Percent
		SpeedCheckStop
		waitanimfinished
		if GotParam SpeedBasedAnim1
			if SpeedGreaterThan <Speed>
				PlayAnim Anim = <SpeedBasedAnim2>
			else
				PlayAnim Anim = <SpeedBasedAnim1>
			endif
			Vibrate Actuator = 1 Percent = 100 Duration = 0.2
			Obj_SpawnScript BloodSmall
			SetRollingFriction 20
			waitanimfinished
		endif
		SpeedCheckStop
		if GotParam Anim2
			PlayAnim Anim = <Anim2> BlendPeriod = 0.0
		endif
		SetRollingFriction 20
		SpeedCheckStop
		VibrateOff
		WaitAnim 20 frames fromend
		
		waitanimfinished
		EnablePlayerInput
		SwitchToWalkingPhysics
		Goto JustStoppedSkatingState
	endscript
	
	
	script GibbonHangState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = HangMoveLeft Scr = GibbonSwingLeftState Group = WalkingStateExceptions
		SetException Ex = HangMoveRight Scr = GibbonSwingRightState Group = WalkingStateExceptions
		SetException Ex = AIR Scr = GibbonToAirState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = GibbonToAirState Group = WalkingStateExceptions
		SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_InHang
		Walk_ScaleAnimSpeed Off
		if AnimEquals[JumpToSwingHang JumpToWallHang JumpToGibbonIdle]
			WaitAnimWalking
		endif
		PlayWalkAnim Anim = GibbonIdle Cycle NoRestart BlendPeriod = 0.30000001
		WaitWalking
	endscript
	
	script AirToGibbonState
		Rotate y = 90
		
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = HangMoveLeft Scr = GibbonSwingLeftState Group = WalkingStateExceptions
		SetException Ex = HangMoveRight Scr = GibbonSwingRightState Group = WalkingStateExceptions
		SetException Ex = AIR Scr = GibbonToAirState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = GibbonToAirState Group = WalkingStateExceptions
		SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = Off
		LaunchStateChangeEvent State = Skater_InHang
		Walk_ScaleAnimSpeed Off
		Walk_GetHangInitAnimType
		switch <HangInitAnimType>
			case SWING
				PlayWalkAnim Anim = GibbonSwingToGibbonIdle BlendPeriod = 0
			case WALL
				PlayWalkAnim Anim = JumpToGibbonIdle BlendPeriod = 0
		endswitch
		WaitAnimWalking
		Goto GibbonHangState
	endscript
	
	script GibbonSwingLeftState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Hang Scr = GibbonHangState Group = WalkingStateExceptions
		SetException Ex = HangMoveRight Scr = GibbonSwingRightState Group = WalkingStateExceptions
		SetException Ex = AIR Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = Off
		Walk_ScaleAnimSpeed HangMove
		PlayGibbonMoveAnimCycle HangAnim = GibbonSwing
	endscript
	
	script GibbonSwingRightState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Hang Scr = GibbonHangState Group = WalkingStateExceptions
		SetException Ex = HangMoveLeft Scr = GibbonSwingLeftState Group = WalkingStateExceptions
		SetException Ex = AIR Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = HangToAirState Group = WalkingStateExceptions
		SetException Ex = PullUpFromHang Scr = PullUpFromHangState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = Off
		Walk_ScaleAnimSpeed HangMove
		PlayWalkAnim Anim = GibbonTurn BlendPeriod = 0.30000001
		waitanimfinished
		
		Rotate y = -180
		
		PlayGibbonMoveAnimCycle HangAnim = GibbonSwing
		
	endscript
	
	script GibbonToAirState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = LandState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToGibbonState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		ClearException JumpRequested
		SetWalkingTrickState NewWalkingTrickState = AIR
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = GibbonIdleToDrop BlendPeriod = 0.05
		WaitAnimWalking
		Goto AirState
	endscript
	
	script PlayGibbonMoveAnimCycle
		BlendPeriodOut 0.30000001
		PreviousPartialAnimOverlay = UndeterminedOverlay
		while
			if NOT (<PreviousPartialAnimOverlay> = <PartialAnimOverlay>)
				if (<PartialAnimOverlay> = NoOverlay)
					PlayAnim Anim = <HangAnim> Cycle <SyncToPreviousAnim> BlendPeriod = 0.1
				else
					PlayAnim Anim = <HangAnim> PartialAnimOverlay = <PartialAnimOverlay> Cycle <SyncToPreviousAnim> BlendPeriod = 0.1
				endif
			endif
			PreviousPartialAnimOverlay = <PartialAnimOverlay>
			SyncToPreviousAnim = SyncToPreviousAnim
			DoNextManualTrick ScriptToRunFirst = BeginWalkingManualTrick FromWalk
			DoNextTrick ScriptToRunFirst = BeginWalkingGenericTrick
			Wait 1 GameFrame
		repeat
	endscript
	
	
	script KskGroundPunchState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = LadderOntoBottom Scr = LadderOntoBottomState Group = WalkingStateExceptions
		SetException Ex = LadderOntoTop Scr = LadderOntoTopState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = WalkOffEdge Scr = AirState Group = WalkingStateExceptions
		SetException Ex = DropToHang Scr = DropToHangState Group = WalkingStateExceptions
		SetException Ex = Ride Scr = StandToRideState Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = JumpRequestedEvent Group = WalkingEvents
		SetWalkingTrickState NewWalkingTrickState = GROUND
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = WalkingSlap BlendPeriod = 0.1
		WaitAnimWalking
		Goto StandState
	endscript
	
	
	script KskAirPunchState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = LandState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = AIR
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = WalkingSlap BlendPeriod = 0.1
		WaitAnimWalking
		Goto AirState
	endscript
	
	script KskBailState BoardOffFrame = 1 BoardVel = (20.0,70.0,-200.0) BoardRotVel = (2.0,5.0,1.0) BoardSkaterVel = 0
		
		ClearExceptionGroup WalkingStateExceptions
		BailSkaterTricks
		DisablePlayerInput AllowCameraControl
		
		Obj_SpawnScript BailBoardControl Params = {BoardOffFrame = <BoardOffFrame> BoardVel = <BoardVel> BoardRotVel = <BoardRotVel> BoardSkaterVel = <BoardSkaterVel> NoBailBoard = 1}
		
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = WalkingBail BlendPeriod = 0.1
		waitanimfinished
		PlayWalkAnim Anim = WalkingBailGetUp BlendPeriod = 0.1
		waitanimfinished
		EnablePlayerInput
		Goto StandState
	endscript
	
	script KskAirBackflipState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = KskBailState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = AIR
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = RunToJump BlendPeriod = 0.1
		RotateDisplay x Duration = 0.59999996 Seconds StartAngle = 0.0 EndAngle = -360.0 SinePower = 0 RotationOffset = (0.0,45.0,0.0)
		SetTrickName "Backflip"
		SetTrickScore 500
		Display
		WaitAnimWalking
		Goto AirState
	endscript
	script KskAirFrontflipState
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = KskBailState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = AIR
		Walk_ScaleAnimSpeed Off
		PlayWalkAnim Anim = RunToJump BlendPeriod = 0.1
		RotateDisplay x Duration = 0.59999996 Seconds StartAngle = 0.0 EndAngle = 360.0 SinePower = 0 RotationOffset = (0.0,45.0,0.0)
		SetTrickName "Frontflip"
		SetTrickScore 500
		Display
		WaitAnimWalking
		Goto AirState
	endscript
	
	HANG_SPINOUT_SPEED = 450
	SPIN_OUT_MAX_SPEED = 1800
	SPIN_OUT_STOP_SPEED = 450
	spin_out_speed = 0.0
	spin_out_speed2 = 0.0
	spin_out_angle = 0.0
	spin_out_angle2 = 0.0
	SPIN_OUT_ANGLE_STEP = -45.0
	spin_out_time = 0.80000001
	spin_out_speed_multi = 0.75
	spin_out_first = 1
	script PreventRailSpinMove Position = (0.0,0.0,0.0)
		while
			skater::Obj_SetPosition Position = <pos>
			Wait 1 frames
		repeat
	endscript
	
	script HangSpinOutState
		
		Change spin_out_first = 1
		Change spin_out_angle = 0.0
		Change spin_out_angle2 = 0.0
		
		if (<exit_speed> > SPIN_OUT_MAX_SPEED)
			Change spin_out_speed = SPIN_OUT_MAX_SPEED
		else
			Change spin_out_speed = <exit_speed>
		endif
		
		Change spin_out_speed2 = spin_out_speed
		
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = AIR Scr = HangSpinAirState Params = {drop_speed = <exit_speed>} Group = WalkingStateExceptions
		SetEventHandler Ex = JumpRequested Scr = HangSpinJumpState Params = {jump_angle = spin_out_angle jump_speed = spin_out_speed} Group = WalkingEvents
		
		SetWalkingTrickState NewWalkingTrickState = Off
		Walk_ScaleAnimSpeed Off
		
		PlayWalkAnim Anim = JumpToSwingHang Cycle NoRestart BlendPeriod = 0.30000001
		skater::Obj_GetPosition
		SpawnScript PreventRailSpinMove Params = {Position = <pos>}
		
		while
			
			if (spin_out_speed < SPIN_OUT_STOP_SPEED)
				RotateDisplay x Duration = (spin_out_time / 1.5) Seconds StartAngle = spin_out_angle EndAngle = -99.0 SinePower = 0 RotationOffset = (0.0,90.0,0.0)
				Wait (spin_out_time / 1.5) Seconds
				
				Change spin_out_speed = (spin_out_speed2 / 2.0)
				Change spin_out_speed2 = spin_out_speed
				RotateDisplay x Duration = spin_out_time Seconds StartAngle = -99.0 EndAngle = 40.0 SinePower = 0 RotationOffset = (0.0,90.0,0.0)
				Wait spin_out_time Seconds
				
				Change spin_out_speed = (spin_out_speed2 / 4.0)
				Change spin_out_speed2 = spin_out_speed
				RotateDisplay x Duration = spin_out_time Seconds StartAngle = 40.0 EndAngle = -5.0 SinePower = 0 RotationOffset = (0.0,90.0,0.0)
				Wait spin_out_time Seconds
				break
			endif
			
			RotateDisplay x Duration = (spin_out_time - (spin_out_speed / 10000.0)) Seconds StartAngle = 0.0 EndAngle = -360.0 SinePower = 0 RotationOffset = (0.0,90.0,0.0)
			
			while
				if (spin_out_angle = -90.0)
					if (spin_out_first = 0)
						Change spin_out_speed = (spin_out_speed2 - 125.0)
						Change spin_out_speed2 = spin_out_speed
						Ksk_DebugValue value_name = "dropping speed to" value_value = spin_out_speed
					endif
				endif
				
				if (spin_out_angle = -360.0)
					Change spin_out_angle = 0.0
					Change spin_out_angle2 = spin_out_angle
					break
				endif
				
				Wait ((spin_out_time - (spin_out_speed / 10000.0)) / 8.0) Seconds
				
				Change spin_out_angle = (spin_out_angle2 + SPIN_OUT_ANGLE_STEP)
				Change spin_out_angle2 = spin_out_angle
			repeat
			
			Change spin_out_first = 0
			
		repeat
		
		KillSpawnedScript PreventRailSpinMove
		FormatText TextName = MessageText "%s Rail spin" s = spin_out_angle
		SetTrickName <MessageText>
		SetTrickScore 300
		Display
		
		Goto HangState
		
		
	endscript
	
	script HangSpinJumpState jump_angle = 0.0 jump_speed = 0.0
		
		CancelRotateDisplay
		
		Ksk_DebugValue value_name = "jump speed" value_value = <jump_speed>
		Ksk_DebugValue value_name = "jump angle" value_value = <jump_angle>
		
		switch <jump_angle>
			case -360.0
				Walk_Jump
				LaunchEvent Type = Jump
				Goto HangSpinAirState
			case 0.0
				SwitchToSkatingPhysics
				SetSpeed (<jump_speed> * spin_out_speed_multi)
				Jump BonelessHeight no_sound
				DoCarPlantBoost
			case -45.0
				SwitchToSkatingPhysics
				SetSpeed (<jump_speed> * spin_out_speed_multi)
				Jump BonelessHeight no_sound
				DoCarPlantBoost
			case -90.0
				SwitchToSkatingPhysics
				SetSpeed (<jump_speed> * spin_out_speed_multi)
				Jump BonelessHeight no_sound
				DoCarPlantBoost
			case -135.0
				SwitchToSkatingPhysics
				SetSpeed (<jump_speed> * 0.2)
				DoCarPlantBoost
				Jump BonelessHeight no_sound
				if (<jump_speed> > 1200.0)
					Jump BonelessHeight no_sound
					RotateDisplay x Duration = 1.20000005 Seconds StartAngle = -135.0 EndAngle = -1080.0 SinePower = 0 RotationOffset = (0.0,45.0,0.0)
				else
					if (<jump_speed> > 750.0)
						Jump BonelessHeight no_sound
						RotateDisplay x Duration = 0.89999998 Seconds StartAngle = -135.0 EndAngle = -720.0 SinePower = 0 RotationOffset = (0.0,45.0,0.0)
					else
						RotateDisplay x Duration = 0.69999999 Seconds StartAngle = -135.0 EndAngle = -360.0 SinePower = 0 RotationOffset = (0.0,45.0,0.0)
					endif
				endif
			case -180.0
				SwitchToSkatingPhysics
				SetSpeed 15
				Jump BonelessHeight no_sound
				if (<jump_speed> > 1200.0)
					Jump BonelessHeight no_sound
					Jump BonelessHeight no_sound
					RotateDisplay x Duration = 1.0 Seconds StartAngle = -180.0 EndAngle = -1080.0 SinePower = 0 RotationOffset = (0.0,45.0,0.0)
				else
					if (<jump_speed> > 750.0)
						Jump BonelessHeight no_sound
						RotateDisplay x Duration = 0.69999999 Seconds StartAngle = -180.0 EndAngle = -720.0 SinePower = 0 RotationOffset = (0.0,45.0,0.0)
					else
						RotateDisplay x Duration = 0.69999999 Seconds StartAngle = -180.0 EndAngle = -360.0 SinePower = 0 RotationOffset = (0.0,45.0,0.0)
					endif
				endif
			case -225.0
				SwitchToSkatingPhysics
				SetSpeed (<jump_speed> * -0.2)
				DoCarPlantBoost
				Jump BonelessHeight no_sound
				if (<jump_speed> > 1200.0)
					Jump BonelessHeight no_sound
					RotateDisplay x Duration = 1.20000005 Seconds StartAngle = -225.0 EndAngle = -1080.0 SinePower = 0 RotationOffset = (0.0,45.0,0.0)
				else
					if (<jump_speed> > 750.0)
						Jump BonelessHeight no_sound
						RotateDisplay x Duration = 0.89999998 Seconds StartAngle = -225.0 EndAngle = -720.0 SinePower = 0 RotationOffset = (0.0,45.0,0.0)
					else
						RotateDisplay x Duration = 0.69999999 Seconds StartAngle = -225.0 EndAngle = -360.0 SinePower = 0 RotationOffset = (0.0,45.0,0.0)
					endif
				endif
			case -270.0
				SwitchToSkatingPhysics
				SetSpeed ((<jump_speed> * spin_out_speed_multi) * -1.0)
				Jump BonelessHeight no_sound
				DoCarPlantBoost
			case -315.0
				Walk_Jump
				LaunchEvent Type = Jump
				Goto HangSpinAirState
				
		endswitch
		
		if IsBoardMissing
			Goto kskOffBoard_Air
		endif
		if Held White
			Goto kskOffBoard_FromAir
		endif
		Goto Airborne
	endscript
	
	SPIN_OUT_DROP_SPEED = 590
	script HangSpinAirState
		
		ClearExceptionGroup WalkingStateExceptions
		SetException Ex = Land Scr = KskBailState Group = WalkingStateExceptions
		SetException Ex = Hang Scr = AirToHangState Params = {ksk_speed = SPIN_OUT_DROP_SPEED} Group = WalkingStateExceptions
		SetException Ex = Ladder Scr = LadderMoveUpState Group = WalkingStateExceptions
		SetException Ex = Jump Scr = RunJumpState Group = WalkingStateExceptions
		SetException Ex = Wallplant Scr = WallplantState Group = WalkingStateExceptions
		SetWalkingTrickState NewWalkingTrickState = AIR
		Walk_ScaleAnimSpeed Off
		
		PlayWalkAnim Anim = HangIdleToDrop NoRestart BlendPeriod = 0.30000001
		
		WaitAnimWalking
		Goto AirState
	endscript
	
	script KskRailStallOllie jump_speed = 1100
		Ksk_DebugValue value_name = "Rail Stall Speed" value_value = <jump_speed>
		StopBalanceTrick
		DoNextTrick
		ClearTrickQueue
		ClearEventBuffer Buttons = Dpad OlderThan = TRICK_PRELOAD_TIME
		ClearEventBuffer Buttons = [x] OlderThan = 0
		
		if SpeedGreaterThan 100
			
		else
			if Held Down
				SetSpeed (<jump_speed> * -0.69999999)
			else
				if Held DownLeft
					SetSpeed (<jump_speed> * -0.69999999)
					Change Rail_Jump_Angle = -60
				else
					if Held DownRight
						SetSpeed (<jump_speed> * -0.69999999)
						Change Rail_Jump_Angle = -60
					else
						SetSpeed (<jump_speed> * 0.69999999)
						if Held Right
							Change Rail_Jump_Angle = 90
						else
							if Held Left
								Change Rail_Jump_Angle = 90
							else
								Change Rail_Jump_Angle = 60
							endif
						endif
					endif
				endif
			endif
		endif
		
		waitonegameframe
		
		if SpeedLessThan 250
			SetSpeed 250.0
		endif
		
		Jump
		
		Change Rail_Jump_Angle = 15
		InAirExceptions
		if InPressure
			SetTrickName 'Pressure'
			SetTrickScore 200
			Display
		endif
		
		Vibrate Actuator = 1 Percent = 50 Duration = 0.05
		
		if InNollie
			PlayAnim Anim = Nollie BlendPeriod = 0.1
		else
			PlayAnim Anim = Ollie BlendPeriod = 0.0 NoRestart
		endif
		Bailoff
		WaitAnimWhilstChecking
		
		
		Goto Airborne
	endscript
	
	
	script Ksk_DebugValue value_name = "null" value_value = 108
		if UNDERGROUNDPLUS_DEBUG
			FormatText TextName = MessageText "%n: %s" n = <value_name> s = <value_value>
			create_console_message text = <MessageText>
		endif
	endscript
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
