
	script Airborne Blendperiod = 0.30000001
		SetExtraTricks FlipRoll Duration = 30
		while
			if Obj_FlagSet FLAG_SKATER_INLOOP
				Goto LoopGapStart
			endif
			InAirExceptions <...>
			
			
			while
				DoNextTrick
				GetAirTimeLeft
				GetAirtime
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
							
							
							if Held R1
								if Flipped
									PlayAnim Anim = AirTurnRight AirAnimParams
								else
									PlayAnim Anim = AirTurnLeft AirAnimParams
								endif
							else
								if Held L1
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
					endif
				endif
				waitonegameframe
			repeat
			waitanimwhilstchecking
			
			
			DoNextTrick
			waitonegameframe
		repeat
	endscript
	
	
	
	
	script Land
		SetSkaterCamLerpReductionTimer time = 0
		GetSpeed
		if AirTimeGreaterThan 1.5 seconds
			ShakeCamera {
				Duration = 0.5
				vert_amp = (0.01 * <Speed>)
				horiz_amp = (0.005 * <Speed>)
				vert_vel = 10.27000046
				horiz_vel = 5.92000008
			}
		endif
		
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
						ClearComboBonusPot
						Goto YawBail
					endif
				endif
			else
				if SpeedGreaterThan 500
					if YawBetween (60.0,120.0)
						ClearComboBonusPot
						Goto YawBail
					endif
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
				Printf "DOING A TRICK"
				ClearComboBonusPot
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
				if Backwards
					Goto ToTail_Bail Params = {Anim1 = ManualBack Anim2 = ManualGetup IntoAirFrame = 30 Friction = 5 SmackAnim = SmackWallFeet Sound = Bail04
						BoardOffFrame = 10 BoardVel = (0.0,500.0,70.0) BoardRotVel = (20.0,0.0,0.0) BoardSkaterVel = 1
						GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFallBack AnimFall2 = BigDrop AnimFall3 = GetUpFacing}
				endif
				SetTrickName "To Tail"
				SetTrickScore 500
				Display
				CopingHit Terrain = 3
				Obj_Spawnscript CessTrail Params = {repeat_times = 20}
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
		
		ClearComboBonusPot
		
		OnGroundExceptions
		CheckForNetBrake
		waitanimwhilstchecking AndManuals
		Goto OnGroundAi
	endscript
	
	
	
	
	script ToTail_Bail Friction = 8 Friction2 = 10 HeavyFriction = 70
		Obj_SetBoundingSphere 100
		if GotParam UnrotateBoardFirst
			if BoardIsRotated
				BoardRotate
			endif
		endif
		if GotParam NoBailBoard
			NoBailBoard = 1
		endif
		NollieOff
		PressureOff
		KillSpecial
		created_trick_cleanup
		SpawnClothingLandScript
		if NOT GotParam NoScuff
			PlaySkaterStream type = "bail"
		endif
		SetSkaterCamLerpReductionTimer time = 0
		InBail
		LaunchStateChangeEvent State = Skater_InBail
		SetExtraPush radius = 48 Speed = 100 Rotate = 6
		Obj_Spawnscript BailBoardControl Params = {BoardOffFrame = <BoardOffFrame> BoardVel = <BoardVel> BoardRotVel = <BoardRotVel> BoardSkaterVel = <BoardSkaterVel> NoBailBoard = <NoBailBoard>}
		SparksOff
		VibrateOff
		ClearExceptions
		DisablePlayerInput AllowCameraControl
		BailSkaterTricks
		StopBalanceTrick
		SetException Ex = CarBail Scr = CarBail
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
			PlayAnim Anim = <Anim1> NoRestart Blendperiod = 0.0
		else
			PlayAnim Anim = <Anim1> NoRestart Blendperiod = 0.30000001
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
				Obj_Spawnscript BloodSmall
				Playsound Random(@hitblood01 @hitblood02 @hitblood03)
			endif
		endif
		Vibrate Actuator = 1 Percent = 100 Duration = 0.2
		SetRollingFriction <HeavyFriction>
		if GotParam HitBody
			Spawnscript HitBody Params = {<...>}
		endif
		wait 3 frames
		SetRollingFriction <Friction>
		WaitAnim 30 Percent
		SpeedCheckStop
		SetRollingFriction <Friction2>
		WaitAnim 50 Percent
		SpeedCheckStop
		BashOn
		if GotParam BoardEarlyOn
			BoardRotate normal
			SwitchOnBoard
		endif
		WaitAnim 75 Percent
		SpeedCheckStop
		if GotParam FoleySound
		endif
		WaitAnimFinished
		if GotParam SpeedBasedAnim1
			if SpeedGreaterThan <Speed>
				PlayAnim Anim = <SpeedBasedAnim2>
			else
				PlayAnim Anim = <SpeedBasedAnim1>
			endif
			Vibrate Actuator = 1 Percent = 100 Duration = 0.2
			Obj_Spawnscript BloodSmall
			SetRollingFriction 20
			WaitAnimFinished
		endif
		SpeedCheckStop
		if GotParam Anim2
			PlayAnim Anim = <Anim2> Blendperiod = 0.0
		endif
		SetRollingFriction 20
		SpeedCheckStop
		VibrateOff
		WaitAnim 20 frames fromend
		SwitchOnBoard
		if GotParam BoardAlwaysOn
		else
			BoardRotate normal
		endif
		WaitAnimFinished
		Goto Baildone
	endscript
	
	
	perfect_bonus = 0
	
	
	
	script ClearComboBonusPot
		Change perfect_bonus = 0
	endscript
	
	
	
	script AwardPerfect
		GetSpin
		SkaterGetScoreInfo
		
		
		base_perfect_score = (<spin> * 1.5)
		bonus_perfect_score = (perfect_bonus * 0.02)
		CastToInteger bonus_perfect_score
		CastToInteger base_perfect_score
		
		total_bonus = (<base_perfect_score> + <bonus_perfect_score>)
		Change perfect_bonus = (perfect_bonus + <total_bonus>)
		
		if (<spin> > 359.0)
			if NOT InSplitScreenGame
				if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
					FormatText TextName = ScoreText "+%s Points" s = <total_bonus>
					
					Create_Panel_Message text = "Perfect Landing!" id = perfect rgba = [50 150 50 128] pos = (110.0,340.0) style = perfect_style
					Create_Panel_Message text = <ScoreText> id = perfect2 rgba = [40 140 40 100] pos = (110.0,360.0) style = perfect_style
				endif
			else
				if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
					PerfectSloppy_2p text = "Perfect!" rgb = [50 150 50 128]
				endif
			endif
			
			Ksk_DebugValue value_name = "total_bonus" value_value = <total_bonus>
			
			SetTrickName ''
			SetTrickScore <total_bonus>
			Display Blockspin NoDegrade
			if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
				Obj_Spawnscript PlayPerfectSound Params = {Sound = PerfectLanding wait = 0.2 pitch = 80}
			endif
		endif
	endscript
	
	
	
	script AwardSloppy
		GetSpin
		SkaterGetScoreInfo
		bonus_score = (<ScorePot> * -0.01)
		CastToInteger bonus_score
		
		if (<spin> > 359.0)
			if NOT InSplitScreenGame
				if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
					FormatText TextName = ScoreText "%s Points" s = <bonus_score>
					
					Create_Panel_Message text = "Sloppy Landing" id = perfect rgba = [200 50 50 128] pos = (110.0,340.0) style = sloppy_style
					Create_Panel_Message text = <ScoreText> id = perfect2 rgba = [107 51 27 100] pos = (110.0,360.0) style = sloppy_style
				endif
			else
				if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
					PerfectSloppy_2p text = "Sloppy!" rgb = [200 50 50 128]
				endif
			endif
			
			Ksk_DebugValue value_name = "bonus_score" value_value = <bonus_score>
			
			SetTrickName ''
			SetTrickScore <bonus_score>
			Display Blockspin NoDegrade
			if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
				Obj_Spawnscript PlayPerfectSound Params = {Sound = HUDtrickslopC pitch = 150 wait = 0.12}
			endif
		endif
	endscript
	
	
	script FlyAi Move = 8
		ClearExceptions
		SetQueueTricks NoTricks
		SetSpeed 0
		setstate Air
		SetRollingFriction 1000
		NoRailTricks
		while
			if Held White
				break
			endif
			if Held R2
				Move y = 1
			endif
			if Held L2
				Move y = -1
			endif
			if Held Square
				Move X = 1
			endif
			if Held Circle
				Move X = -1
			endif
			if Held Triangle
				Move z = 1
			endif
			if Held X
				Move z = -1
			endif
			waitonegameframe
		repeat
		AllowRailTricks
		MakeSkaterGoto OnGroundAi
	endscript
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
