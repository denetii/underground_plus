
	script SkateInOrBail moveleft = 1 moveright = -1 movey = -5
		GetTags
		NoRailTricks
		StopBalanceTrick
		KillExtraTricks
		SetExtraTricks NoTricks
		OnGroundExceptions NoEndRun
		ClearException GroundGone
		OnExceptionRun SkateInOrBail_Out
		SetQueueTricks NoTricks
		ClearManualTrick
		if GotParam Fallingright
			Goto SkateIn_Right Params = {<...>}
		endif
		if GotParam FallingLeft
			Goto SkateIn_Left Params = {<...>}
		endif
		if GotParam GrindRelease
			if Held Right
				Goto SkateIn_Right Params = {<...>}
			endif
			if Held Left
				Goto SkateIn_Left Params = {<...>}
			endif
			if SkateInAble Left
				Goto SkateIn_Left Params = {<...>}
			else
				Goto SkateIn_Right Params = {<...>}
			endif
		endif
		printf "Missing a FallingLeft or FallingRight ?"
		if GotParam GrindBail
			Goto <GrindBail>
		else
			Goto FiftyFiftyFall
		endif
	endscript
	script SkateIn_Right
		if NOT SkateInAble Right
			
			if SpeedGreaterThan 100
				Move y = <movey>
				Move x = <moveright>
				SkateIn_Bail <...>
			endif
			
		endif
		
		printf "SkateInable RIGHT >>>>>>>>>>>>>>>>>>>>>>>>"
		SetLandedFromVert
		SetState ground
		Move y = -5
		Move x = -1
		OrientToNormal
		Rotate y = -30 Duration = 0.2 seconds
		OnGroundExceptions NoEndRun
		ClearException GroundGone
		OnExceptionRun SkateInOrBail_Out
		SetQueueTricks NoTricks
		SetManualTricks NoTricks
		SetExtraTricks_Reverts
		if GotParam OutAnim
			PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001
		else
			PlayAnim Anim = <initanim> Backwards BlendPeriod = 0.30000001
		endif
		WaitAnimWhilstChecking
		Goto SkateInLand
	endscript
	script SkateIn_Left
		if NOT SkateInAble Left
			
			if SpeedGreaterThan 100
				printf "Not skateinable left >>>>>>>>>>>>>>>>>>>>>>>>"
				Move y = <movey>
				Move x = <moveright>
				SkateIn_Bail <...>
			endif
			
		endif
		
		SetLandedFromVert
		printf "SkateInable LEFT >>>>>>>>>>>>>>>>>>>>>>>>"
		SetState ground
		Move x = 1
		Move y = -5
		OrientToNormal
		Rotate y = 30 Duration = 0.2 seconds
		SetState ground
		OnGroundExceptions NoEndRun
		ClearException GroundGone
		OnExceptionRun SkateInOrBail_Out
		SetQueueTricks NoTricks
		SetManualTricks NoTricks
		SetExtraTricks_Reverts
		if GotParam OutAnim
			PlayAnim Anim = <OutAnim> BlendPeriod = 0.30000001
		else
			PlayAnim Anim = <initanim> Backwards BlendPeriod = 0.30000001
		endif
		WaitAnimWhilstChecking
		Goto SkateInLand
	endscript
	script SkateIn_Bail
		if GetGlobalFlag Flag = DIFFICULTY_MODE_TOO_EASY
			if NOT InNetGame
				OffRail <...>
				return
			endif
		endif
		if GotParam GrindBail
			Goto <GrindBail>
		else
			Goto FiftyFiftyFall
		endif
	endscript
	script SkateInLand
		OnExceptionRun SkateInLandOut
		NollieOff
		PressureOff
		Vibrate Actuator = 1 Percent = 80 Duration = 0.1
		if Crouched
			PlayAnim Anim = CrouchedLand BlendPeriod = 0.1
		else
			PlayAnim Anim = Land BlendPeriod = 0.1
		endif
		OnExceptionRun SkateInLandOut
		OnGroundExceptions NoEndRun
		SetManualTricks NoTricks
		WaitAnim 10 Percent
		LandSkaterTricks
		OnGroundExceptions
		CheckforNetBrake
		AllowRailtricks
		WaitAnimWhilstChecking AndManuals
		Goto OnGroundAI
	endscript
	script SkateInLandOut
		AllowRailtricks
		LandSkaterTricks
	endscript
	script SkateInOrBail_Out
		printf " =================================== LAND =================================="
		LandSkaterTricks
	endscript
	
	Extra_FS_Grinds =
	[
		{Trigger = {InOrder, a = Triangle, b = Triangle, 300} Scr = Trick_5050_FS Params = {Name = 'FS 50-50' IsExtra = yes}}
		{Trigger = {InOrder, Triangle, Square, 300} Scr = Trick_NoseSlide_FS Params = {Name = 'FS Noseslide' IsExtra = yes}}
		{Trigger = {InOrder, Triangle, Circle, 300} Scr = Trick_Nosegrind_FS Params = {Name = 'FS Nosegrind' IsExtra = yes}}
		{Trigger = {InOrder, a = Circle, b = Circle, 300} Scr = Trick_Crooked_FS Params = {Name = 'FS Crooked' IsExtra = yes}}
		{Trigger = {InOrder, Circle, Square, 300} Scr = Trick_Bluntslide_FS Params = {Name = 'FS Bluntslide' IsExtra = yes}}
		{Trigger = {InOrder, Circle, Triangle, 300} Scr = Trick_NoseBluntSlide_FS Params = {Name = 'FS Nosebluntslide' IsExtra = yes}}
		{Trigger = {InOrder, a = Square, b = Square, 300} Scr = Trick_Smith_FS Params = {Name = 'FS Smith' IsExtra = yes}}
		{Trigger = {InOrder, Square, Circle, 300} Scr = Trick_5_0_FS Params = {Name = 'FS 5-0' IsExtra = yes}}
		{Trigger = {InOrder, Square, Triangle, 300} Scr = Trick_Tailslide_FS Params = {Name = 'FS Tailslide' IsExtra = yes}}
	]
	Extra_BS_Grinds =
	[
		{Trigger = {InOrder, a = Triangle, b = Triangle, 300} Scr = Trick_5050_BS Params = {Name = 'BS 50-50' IsExtra = yes}}
		{Trigger = {InOrder, Triangle, Square, 300} Scr = Trick_NoseSlide_BS Params = {Name = 'BS Noseslide' IsExtra = yes}}
		{Trigger = {InOrder, Triangle, Circle, 300} Scr = Trick_Nosegrind_BS Params = {'BS Nosegrind' IsExtra = yes}}
		{Trigger = {InOrder, a = Circle, b = Circle, 300} Scr = Trick_Crooked_BS Params = {Name = 'BS Crooked' IsExtra = yes}}
		{Trigger = {InOrder, Circle, Square, 300} Scr = Trick_Bluntslide_BS Params = {Name = 'BS Bluntslide' IsExtra = yes}}
		{Trigger = {InOrder, Circle, Triangle, 300} Scr = Trick_NoseBluntSlide_BS Params = {Name = 'BS Nosebluntslide' IsExtra = yes}}
		{Trigger = {InOrder, Square, Triangle, 300} Scr = Trick_Tailslide_BS Params = {Name = 'BS Tailslide' IsExtra = yes}}
		{Trigger = {InOrder, a = Square, b = Square, 300} Scr = Trick_Smith_BS Params = {Name = 'BS Smith' IsExtra = yes}}
		{Trigger = {InOrder, Square, Circle, 300} Scr = Trick_5_0_BS Params = {Name = 'BS 5-0' IsExtra = yes}}
	]
    // Dropdown trick bindings for PS2/Xbox controls
	GrindRelease = [
		{Trigger = {Press, Black, 100} Scr = SkateInOrBail Params = {GrindRelease GrindBail = Airborne moveright = -5 movey = 5}}
	]
	GrindRelease_XBOX =	[ 
        {Trigger = {PressTwoAnyOrder, L1, R1, 300} Scr = SkateInOrBail Params = {GrindRelease GrindBail = Airborne moveright = -5 movey = 5}} 
    ]
	
    GRINDTAP_TIME = 1000
	GRINDTAP_SCORE = 400
	GRINDTAP_TWEAK = 25
	GrindTaps_FS = [
		{Trigger = {TripleInOrderSloppy, UpRight, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_CrailSlide_FS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, DownRight, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_Darkslide_FS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, DownLeft, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_DoubleBluntSlide2 Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, UpLeft, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_HangTenNoseGrind_FS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, Up, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_NosegrindPivot_FS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, Right, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_Salad_FS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, Left, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_Hurricane_FS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, Down, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_GrindOverturn_FS Params = {IsExtra = 1}}
	]
	GrindTaps_BS = [
		{Trigger = {TripleInOrderSloppy, UpRight, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_CrailSlide_BS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, DownRight, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_Darkslide_BS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, DownLeft, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_DoubleBluntSlide2 Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, UpLeft, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_HangTenNoseGrind_BS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, Up, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_NosegrindPivot_BS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, Right, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_Salad_BS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, Down, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_GrindOverturn_BS Params = {IsExtra = 1}}
		{Trigger = {TripleInOrderSloppy, Left, b = Triangle, c = Triangle, GRINDTAP_TIME} Scr = Trick_Hurricane_BS Params = {IsExtra = 1}}
	]
	script Grind GrindTweak = 7 boardscuff = 0 InitSpeed = 1.0
		
		if NOT GetGlobalFlag Flag = DIFFICULTY_MODE_TOO_EASY
			if BailIsOn
				SetState Air
				Goto DoingTrickBail
			endif
		endif
		if InNetGame
			if BailIsOn
				SetState Air
				Goto DoingTrickBail
			endif
		endif
		BailOff
		LaunchStateChangeEvent State = Skater_OnRail
		KillExtraTricks
		if ChecksumEquals a = <Extratricks> b = Extra_BS_Grinds
			SetExtraTricks GrindTaps_BS
		else
			SetExtraTricks GrindTaps_FS
		endif
		SetTags OutAnim = <OutAnim> initanim = <initanim> InitSpeed = <InitSpeed> Anim = <Anim>
		SetTrickName ""
		SetTrickScore 0
		Display Blockspin
		Obj_ClearFlag FLAG_SKATER_MANUALCHEESE
		Obj_ClearFlag FLAG_SKATER_REVERTCHEESE
		if GotParam SpecialItem_details
			TurnOnSpecialItem SpecialItem_details = <SpecialItem_details>
		endif
		if GotParam SwitchBoardOff
			SwitchoffBoard
		endif
		OnExitRun Exit_Grind
		if GotParam SpecialSounds
			Obj_SpawnScript <SpecialSounds>
		endif
		if GotParam Stream
			Obj_PlayStream <Stream>
		endif
		Vibrate Actuator = 1 Percent = 50 Duration = 0.25
		Vibrate Actuator = 0 Percent = 50
		ClearExceptions
		if GotParam Nollie
			SetException Ex = Ollied Scr = NollieNoDisplay
			NollieOn
		else
			if GotParam OutAnimOnOllie
				SetException Ex = Ollied Scr = Ollie Params = {<...>}
			else
				SetException Ex = Ollied Scr = Ollie
			endif
			NollieOff
		endif
		PressureOff
		
		
		if IsGrind <Type>
			if GotParam FrontTruckSparks
				SetFrontTruckSparks
			else
				if GotParam RearTruckSparks
					SetRearTruckSparks
				else
					SetSparksTruckFromNollie
				endif
			endif
			SparksOn
		else
			GetBoardScuff
			<boardscuff> = (<boardscuff> + 1)
			SetTags boardscuff = <boardscuff>
			DoBoardScuff boardscuff = <boardscuff>
			SparksOff
		endif
		SetException Ex = OffRail Scr = OffRail Params = {KissedRail initanim = <initanim> InitSpeed = <InitSpeed> OutAnim = <OutAnim> BoardRotate = <BoardRotate> OutAnimBackwards = <OutAnimBackwards>}
		SetException Ex = Landed Scr = Land
		SetException Ex = OffMeterTop Scr = SkateInOrBail Params = {<...> FallingLeft}
		SetException Ex = OffMeterBottom Scr = SkateInOrBail Params = {<...> Fallingright}
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		SetEventHandler Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called
		OnExceptionRun Grind_Kissed
		ClearTrickQueue
		ClearManualTrick
		ClearExtraGrindTrick
		SetQueueTricks NoTricks
		SetManualTricks NoTricks
		SetRailSound <Type>
		if GotParam IsSpecial
			SetGrindTweak 36
		else
			if GotParam IsATap
				SetGrindTweak GRINDTAP_TWEAK
			else
				SetGrindTweak <GrindTweak>
			endif
		endif
		if GotParam IsExtra
			LaunchExtraMessage
		endif
		if GotParam Profile
			if ProfileEquals is_named = <Profile>
				SwitchOnAtomic special_item
				SwitchOffAtomic special_item_2
			endif
		endif
		if GotParam FullScreenEffect
			<FullScreenEffect>
			OnExitRun Exit_FullScreenEffect
		endif
		if NOT AnimEquals JumpAirTo5050
			if GotParam NoBlend
				PlayAnim Anim = <initanim> BlendPeriod = 0.0 Speed = <InitSpeed>
			else
				PlayAnim Anim = <initanim> BlendPeriod = 0.30000001 Speed = <InitSpeed>
			endif
		endif
		
		if GotParam IsATap
			DoBalanceTrick ButtonA = Right ButtonB = Left Type = <Type> DoFlipCheck ClearCheese
		else
			DoBalanceTrick ButtonA = Right ButtonB = Left Type = <Type> DoFlipCheck
		endif
        //if GotParam IsATap
		//	AdjustBalance TimeAdd = 0 SpeedMult = 0.5 LeanMult = 0.5
		//endif
		
		UndergroundPlus_IfPressedRailStall
		if (<ksk_is_held> = 1)
			GetSpeed
			ClearException Ollied
			SetSpeed 1
			SparksOff
			SetException Ex = Ollied Scr = KskRailStallOllie Params = {jump_speed = <Speed>}
		endif
		
		Wait 15 frames
        // Set the dropdown trick with either PS2 or Xbox style triggers
        if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
            SetExtraTricks GrindRelease
        else
            SetExtraTricks GrindRelease_XBOX
        endif
		Wait 1 frame
		if GotParam IsSpecial
			LaunchSpecialMessage text = "Special Grind"
		endif
		SetException Ex = OffRail Scr = OffRail Params = {initanim = <initanim> InitSpeed = <InitSpeed> OutAnim = <OutAnim> BoardRotate = <BoardRotate> OutAnimBackwards = <OutAnimBackwards>}
		OnExceptionRun Normal_Grind
		SetTrickName <Name>
		SetTrickScore <Score>
		Display Blockspin
		if AnimEquals JumpAirTo5050
			WaitAnimFinished
			PlayAnim Anim = <initanim> BlendPeriod = 0.30000001 Speed = <InitSpeed>
		endif
		WaitAnimFinished
		if GotParam FlipAfterInit
			Flip
			PlayBonkSound
			BoardRotate
			BlendperiodOut 0
		endif
		if GotParam Idle
			PlayAnim Anim = <Anim> Cycle NoRestart
		else
			if GotParam Anim3
				if GotParam Anim2
					PlayAnim Random(@Anim = <Anim> @Anim = <Anim2> @Anim = <Anim3>) wobble wobbleparams = grindwobble_params
				else
					ScriptAssert "Script Assert: Added Anim3 to a grind without a valid anim2...check grindscripts.q Problem Anim =  a" a = <Anim>
				endif
			else
				if GotParam Anim2
					PlayAnim Random(@Anim = <Anim> @Anim = <Anim2>) wobble wobbleparams = grindwobble_params
				else
					PlayAnim Anim = <Anim> wobble wobbleparams = grindwobble_params
				endif
			endif
		endif
		if GotParam FlipBeforeOutAnim
			BlendperiodOut 0.0
			FlipAfter
		endif
		if AnimEquals[FiftyFifty_Range NoseGrind_Range TailGrind_Range]
			Wait 0.25 seconds
		endif
		if GotParam Extratricks
            if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
                SetExtraTricks <Extratricks> ignore = <Name> GrindRelease
            else
                SetExtraTricks <Extratricks> ignore = <Name> GrindRelease_XBOX
            endif
		else
            if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
                SetExtraTricks GrindRelease
            else
                SetExtraTricks GrindRelease_XBOX
            endif
		endif
		if GotParam ScreenShake
			Grind_ScreenShake ScreenShake = <ScreenShake>
		endif
		if GotParam specialtrick_particles
			printf "Going to emit particles ........................."
			Emit_SpecialTrickParticles specialitem_particles = <specialitem_particles>
		endif
		WaitWhilstChecking_ForPressure <...>
	endscript
	script Exit_FullScreenEffect
		<skaterlights_target> = (tod_skaterlights)
		set_level_lights <skaterlights_target>
		SetFogColor r = fog_red b = fog_blue g = fog_green a = fog_alpha
		SetFogDistance distance = fog_dist
		KillManualVibration
		end_oldtime_effects
		Exit_Grind
	endscript
	script Exit_Grind
		SwitchOnBoard
		CleanUp_SpecialTrickParticles
	endscript
	script CreatureScaryGrindEffect
		start_oldtime_effects
	endscript
	script JamieThomasEffect2
		printf "calling JT effect"
		set_level_lights {
			ambient_red = 10
			ambient_green = 10
			ambient_blue = 10
			ambient_mod_factor = 0.30000001
			heading_0 = 60
			pitch_0 = 10
			red_0 = 10
			green_0 = 10
			blue_0 = 10
			mod_factor_0 = 10
			heading_1 = 245
			pitch_1 = 330
			red_1 = 10
			green_1 = 10
			blue_1 = 10
			mod_factor_1 = 0.75}
		Obj_UpdateBrightness
	endscript
	script IronManEffect
		EnableFog
		SetFogColor r = 200 b = 0 g = 0 a = 100
		SetFogDistance distance = 400
		set_level_lights tod_skaterlights_nightvision
	endscript
	script GetBoardScuff ManualName = 'none'
		GetTags
		return boardscuff = <boardscuff>
	endscript
	script Grind_ScreenShake ScreenShake = 60
		if AnimEquals[ElbowSmash_Idle FlipKickDad]
			while
				Wait 1 frame
				if FrameIs <ScreenShake>
					printf " THIS IS THE RIGHT SPOT"
					BloodSplat
					PlaySound BailSlap03
					ShakeCamera {
						Duration = 0.5
						vert_amp = 9.0
						horiz_amp = 3.0
						vert_vel = 10.27000046
						horiz_vel = 5.92000008
					}
				endif
			repeat
		endif
	endscript
	grindwobble_params = {
		WobbleAmpA = {(0.1,0.1) STATS_RAILBALANCE}
		WobbleAmpB = {(0.04,0.04) STATS_RAILBALANCE}
		WobbleK1 = {(0.0022,0.0022) STATS_RAILBALANCE}
		WobbleK2 = {(0.0017,0.0017) STATS_RAILBALANCE}
		SpazFactor = {(1.5,1.5) STATS_RAILBALANCE}
	}
	script Grind_Kissed
		if GotParam MadeOtherSkaterBail
		else
			KillExtraTricks
		endif
		Obj_KillSpawnedScript Name = CheckForShuffle
		Obj_SpawnScript CheckForShuffle
	endscript
	script CheckForShuffle
		SetException Ex = SkaterEnterRail Scr = Awardshuffle
		Wait 15 frames
	endscript
	
	script Awardshuffle
		SetTrickName ''
		SetTrickScore 100
		Display Blockspin NoDegrade
		if NOT InSplitscreenGame
			if NOT GetGlobalFlag Flag = NO_DISPLAY_BASESCORE
				Create_Panel_Message text = "Shuffle Bonus" id = perfect rgba = [50 120 200 128] pos = (110.0,340.0) style = perfect_style
				Create_Panel_Message text = "+100 Points" id = perfect2 rgba = [50 120 200 100] pos = (110.0,360.0) style = perfect_style
			endif
		else
			if NOT GetGlobalFlag Flag = NO_DISPLAY_BASESCORE
				PerfectSloppy_2p text = "Shuffle!" rgb = [50 120 50 128]
			endif
		endif
	endscript
	script Normal_Grind
		if GotParam MadeOtherSkaterBail
		else
			KillExtraTricks
		endif
		SwitchOffAtomic special_item
		SwitchOnAtomic special_item_2
	endscript
	script OffRail InitSpeed = 1.0
		if GotParam KissedRail
			SetTrickScore 50
			SetTrickName "Kissed the Rail"
			Display Blockspin
		endif
		StopBalanceTrick
		KillExtraTricks
		Vibrate Actuator = 0 Percent = 0
		
		
		SetState Air
		
		
		
		SetException Ex = Landed Scr = Land
		SetException Ex = WallRideLeft Scr = WallRide Params = {Left}
		SetException Ex = WallRideRight Scr = WallRide Params = {Right}
		DoNextTrick
		if GotParam EarlyOut
			PlayAnim Anim = <EarlyOut> BlendPeriod = 0.1 Backwards
		else
			if GotParam OutAnim
				if GotParam OutAnimBackwards
					printf "Playing OutAnim Backwards"
					PlayAnim Anim = <OutAnim> Backwards BlendPeriod = 0.1 Speed = <InitSpeed>
				else
					PlayAnim Anim = <OutAnim> BlendPeriod = 0.1 Speed = <InitSpeed>
				endif
			else
				PlayAnim Anim = <initanim> BlendPeriod = 0.1 Backwards Speed = <InitSpeed>
			endif
		endif
		if GotParam BoardRotate
			printf "Setting blendperiod out.................."
			BlendperiodOut 0
			BoardRotateAfter
		endif
		if GotParam FlipAfter
			printf "flipping.................."
			FlipAfter
		endif
		WaitAnimFinished
		Goto Airborne
	endscript
	script Trick_5050_BS Name = 'BS 50-50'
		Grind {Name = <Name> Score = 100 initanim = Init_FiftyFifty Anim = FiftyFifty2_range Anim2 = FiftyFifty_Range Anim3 = FiftyFifty3_range Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_5050_FS Name = 'FS 50-50'
		Grind {Name = <Name> Score = 100 initanim = Init_FiftyFifty Anim = FiftyFifty2_range Anim2 = FiftyFifty_Range Anim3 = FiftyFifty3_range Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_5050_BS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_5050_BS Params = {NoBlend = yes}
	endscript
	script Trick_5050_FS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_5050_FS Params = {NoBlend = yes}
	endscript
	script Trick_Boardslide_FS Name = 'FS Boardslide'
		Rotate
		Grind {Name = <Name> Score = 200 GrindTweak = 14 initanim = Init_FSBoardslide Anim = FSBoardslide_range OutAnim = FSBoardslide_Out Type = Slide NoBlend = yes
			GrindBail = Nutter Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Boardslide_BS Name = 'BS Boardslide'
		Grind {Name = <Name> Score = 200 GrindTweak = 14 initanim = Init_BSBoardslide Anim = BSBoardslide_range OutAnim = BSBoardslide_Out Type = Slide NoBlend = yes
			GrindBail = Nutter Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Lipslide_FS Name = 'FS Lipslide'
		Grind {Name = <Name> Score = 200 GrindTweak = 14 initanim = Init_FSLipslide Anim = BSBoardslide_range OutAnim = BSBoardslide_Out Type = Slide NoBlend = yes
			GrindBail = Nutter Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Lipslide_BS Name = 'BS Lipslide'
		Rotate
		Grind {Name = <Name> Score = 200 GrindTweak = 14 initanim = Init_BSLipslide Anim = FSBoardslide_range OutAnim = FSBoardslide_Out Type = Slide NoBlend = yes
			GrindBail = Nutter Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Tailslide_FS
		if BadLedge
			Goto Trick_NoseSlide_BS_ok Params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
		else
			Goto Trick_Tailslide_FS_ok Params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
		endif
	endscript
	script Trick_Tailslide_FS_ok Name = 'FS Tailslide'
		Grind {Name = <Name> Score = 150 GrindTweak = 11 initanim = Init_FSTailslide InitSpeed = 1.5 Anim = FSTailslide_range OutAnim = FSTailslide_Out Type = Slide NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Tailslide_BS
		if BadLedge
			Goto Trick_NoseSlide_FS_ok Params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
		else
			Goto Trick_Tailslide_BS_ok Params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
		endif
	endscript
	script Trick_Tailslide_BS_ok Name = 'BS Tailslide'
		Grind {Name = <Name> Score = 150 GrindTweak = 11 initanim = Init_Tailslide InitSpeed = 1.5 Anim = Tailslide_range OutAnim = BSTailslide_Out Type = Slide NoBlend = <NoBlend>
			GrindBail = BackwardsGrindBails Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Tailslide_FS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_Tailslide_BS Params = {NoBlend = yes}
	endscript
	script Trick_Tailslide_BS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_Tailslide_FS Params = {NoBlend = yes}
	endscript
	script Trick_NoseSlide_FS
		if BadLedge
			Goto Trick_Tailslide_BS_ok Params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
		else
			Goto Trick_NoseSlide_FS_ok Params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
		endif
	endscript
	script Trick_NoseSlide_FS_ok Name = 'FS Noseslide'
		Grind {Name = <Name> Score = 150 GrindTweak = 11 initanim = Init_FSNoseslide InitSpeed = 1.5 Anim = FSNoseslide_range Type = Slide Nollie = yes OutAnim = FSNoseSlide_Out NoBlend = <NoBlend>
			GrindBail = BackwardsGrindBails Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_NoseSlide_BS
		if BadLedge
			Goto Trick_Tailslide_FS_ok Params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
		else
			Goto Trick_NoseSlide_BS_ok Params = {IsExtra = <IsExtra> NoBlend = <NoBlend>}
		endif
	endscript
	script Trick_NoseSlide_BS_ok Name = 'BS Noseslide'
		Grind {Name = <Name> Score = 150 GrindTweak = 11 initanim = Init_Noseslide InitSpeed = 1.5 Anim = Noseslide_range OutAnim = BSNoseslide_Out Type = Slide Nollie = yes NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Noseslide_FS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_NoseSlide_BS Params = {NoBlend = yes}
	endscript
	script Trick_Noseslide_BS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_NoseSlide_FS Params = {NoBlend = yes}
	endscript
	script Trick_Nosegrind_FS Name = 'FS Nosegrind'
		Grind {Name = <Name> Score = 100 initanim = Init_Nosegrind InitSpeed = 1.5 Anim = NoseGrind_Range Type = Grind Nollie = yes NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Nosegrind_BS Name = 'BS Nosegrind'
		Grind {Name = <Name> Score = 100 initanim = Init_Nosegrind InitSpeed = 1.5 Anim = NoseGrind_Range Type = Grind Nollie = yes NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_NoseGrind_BS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_5_0_FS Params = {NoBlend = yes}
	endscript
	script Trick_NoseGrind_FS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_5_0_BS Params = {NoBlend = yes}
	endscript
	script Trick_5_0_FS Name = 'FS 5-0'
		Grind {Name = <Name> Score = 100 initanim = Init_Tailgrind InitSpeed = 1.5 Anim = TailGrind_Range Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_5_0_BS Name = 'BS 5-0'
		Grind {Name = <Name> Score = 100 initanim = Init_Tailgrind InitSpeed = 1.5 Anim = TailGrind_Range Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_5_0_FS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_Nosegrind_BS Params = {NoBlend = yes}
	endscript
	script Trick_5_0_BS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_Nosegrind_BS Params = {NoBlend = yes}
	endscript
	script Trick_Crooked_FS Name = 'FS Crooked'
		Grind {Name = <Name> Score = 125 GrindTweak = 9 initanim = Init_FSCrooked InitSpeed = 1.5 Anim = FSCrooked_range Type = Grind Nollie = yes NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Crooked_FS_rot
		Rotate
		Goto Trick_Crooked_FS
	endscript
	script Trick_Crooked_BS Name = 'BS Crooked'
		Grind {Name = <Name> Score = 125 GrindTweak = 9 initanim = Init_BSCrooked InitSpeed = 1.5 Anim = BSCrooked_range Type = Grind Nollie = yes NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Crooked_FS_180
		if Backwards
			printf "I'm backwards............"
		endif
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_Crooked_BS Params = {NoBlend = yes}
	endscript
	script Trick_Crooked_BS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_Crooked_FS Params = {NoBlend = yes}
	endscript
	script Trick_NGCRook_FS_rot
		Rotate
		printf "fixed it bitches................................"
		Goto Trick_NGCRook_FS
	endscript
	script Trick_NGCRook_FS Name = 'FS Overcrook'
		Grind {Name = <Name> Score = 125 GrindTweak = 9 initanim = Init_FSOvercrook InitSpeed = 1.5 Anim = FSOvercrook_range Type = Grind Nollie = yes NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_NGCrook_BS Name = 'BS Overcrook'
		Grind {Name = <Name> Score = 125 GrindTweak = 9 initanim = Init_BSOvercrook InitSpeed = 1.5 Anim = BSOvercrook_range Type = Grind Nollie = yes NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_NGCRook_FS_180
		FlipAndRotate
		Goto Trick_NGCrook_BS Params = {NoBlend = yes}
	endscript
	script Trick_NGCrook_BS_180
		FlipAndRotate
		Goto Trick_NGCRook_FS Params = {NoBlend = yes}
	endscript
	script Trick_Smith_FS Name = 'FS Smith'
		Grind {Name = <Name> Score = 125 GrindTweak = 9 initanim = Init_FSSmith InitSpeed = 1.5 Anim = FSSmith_range Type = Grind NoBlend = <NoBlend>
			GrindBail = Nutter Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Smith_FS_rot
		Rotate
		Goto Trick_Smith_FS
	endscript
	script Trick_Smith_BS Name = 'BS Smith'
		Grind {Name = <Name> Score = 125 GrindTweak = 9 initanim = Init_BSSmith InitSpeed = 1.5 Anim = BSSmith_range Type = Grind NoBlend = <NoBlend>
			GrindBail = Nutter Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Smith_FS_180
		FlipAndRotate
		Goto Trick_Smith_BS Params = {NoBlend = yes}
	endscript
	script Trick_Smith_BS_180
		FlipAndRotate
		Goto Trick_Smith_FS Params = {NoBlend = yes}
	endscript
	script Trick_Feeble_FS Name = 'FS Feeble'
		Grind {Name = <Name> Score = 125 GrindTweak = 9 initanim = Init_FSFeeble InitSpeed = 1.5 Anim = FSFeeble_range Type = Grind NoBlend = <NoBlend>
			GrindBail = Nutter Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Feeble_FS_rot
		Rotate
		Goto Trick_Feeble_FS
	endscript
	script Trick_Feeble_BS Name = 'BS Feeble'
		Grind {Name = <Name> Score = 125 GrindTweak = 9 initanim = Init_BSFeeble InitSpeed = 1.5 Anim = BSFeeble_range Type = Grind NoBlend = <NoBlend>
			GrindBail = Nutter Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Feeble_FS_180
		FlipAndRotate
		Goto Trick_Feeble_BS Params = {NoBlend = yes}
	endscript
	script Trick_Feeble_BS_180
		FlipAndRotate
		Goto Trick_Feeble_FS Params = {NoBlend = yes}
	endscript
	script Trick_Bluntslide_BS Name = 'BS Bluntslide'
		Grind {Name = <Name> Score = 250 GrindTweak = 18 initanim = Init_BSBluntSlide InitSpeed = 1.5 Anim = BSBluntSlide_range Type = Slide NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Bluntslide_FS Name = 'FS Bluntslide'
		Grind {Name = <Name> Score = 250 GrindTweak = 18 initanim = Init_FSBluntSlide InitSpeed = 1.5 Anim = FSBluntSlide_range Type = Slide NoBlend = <NoBlend>
			GrindBail = BackwardsGrindBails Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_NoseBluntSlide_BS Name = 'BS Nosebluntslide'
		Grind {Name = <Name> Score = 250 GrindTweak = 18 initanim = Init_BSNoseblunt InitSpeed = 1.5 Anim = BSNoseblunt_range Type = Slide NoBlend = <NoBlend>
			GrindBail = BackwardsGrindBails Extratricks = Extra_BS_Grinds IsExtra = <IsExtra> Nollie = yes}
	endscript
	script Trick_NoseBluntSlide_FS Name = 'FS Nosebluntslide'
		Grind {Name = <Name> Score = 250 GrindTweak = 18 initanim = Init_FSNoseblunt InitSpeed = 1.5 Anim = FSNoseblunt_range Type = Slide NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Nollie = yes IsExtra = <IsExtra> Extratricks = Extra_FS_Grinds}
	endscript
	script Trick_Bluntslide_BS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_Bluntslide_BS Params = {NoBlend = yes}
	endscript
	script Trick_Bluntslide_FS_180
		Rotate
		BoardRotateAfter
		Goto Trick_Bluntslide_FS Params = {NoBlend = yes}
	endscript
	script Trick_Nosebluntslide_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_NoseBluntSlide_BS Params = {NoBlend = yes}
	endscript
	script Trick_Nosebluntslide_FS_180
		Rotate
		BoardRotateAfter
		Goto Trick_NoseBluntSlide_FS Params = {NoBlend = yes}
	endscript
	script Trick_Shortbus2
		Grind {Name = 'Stupid Grind' Score = 400 initanim = Shortbus_Init Anim = Shortbus_idle Idle OutAnim = Shortbus_Out Type = Grind NoBlend = <NoBlend>
			GrindBail = BackwardsGrindBails Nollie = yes IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Shortbus2_180
		Rotate
		BoardRotateAfter
		Goto Trick_Shortbus2 Params = {NoBlend = yes}
	endscript
	script Trick_RodneyGrind2
		Grind {Name = 'Rodney Primo' Score = 400 initanim = RodneyGrind_Init Anim = RodneyGrind_range OutAnim = RodneyGrind_Out Type = Grind BoardRotate = yes
			GrindBail = BackwardsGrindBails Nollie = yes IsSpecial InitSpeed = 0.69999999 OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_GrindNBarf2
		Grind {Name = 'Grind N Barf' InitSpeed = 1.5 Score = 400 initanim = GrindNBarf_Init Anim = GrindNBarf_range OutAnim = GrindNBarf_Out Type = Grind BoardRotate = yes
			GrindBail = BackwardsGrindBails Nollie = yes IsSpecial OutAnimOnOllie Stream = DryHeaveSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_RowleyDarkSlideHandStand2
		Grind {Name = 'Darkslide Handstand' Score = 800 initanim = RowleyDarkSlideHandStand_Init Anim = RowleyDarkSlideHandStand_range OutAnim = RowleyDarkSlideHandStand_Out Type = Slide NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_RowleyDarkSlideHandStand2_180
		Rotate
		BoardRotateAfter
		Goto Trick_RowleyDarkSlideHandStand2 Params = {NoBlend = yes}
	endscript
	script Trick_PrimoHandStand2
		Grind {Name = 'Primo Handstand' Score = 800 initanim = PrimoHandStand_Init Anim = PrimoHandStand_range OutAnim = PrimoHandStand_Out Type = Slide NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Stream = nj_pipeignite Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_PrimoHandStand2_180
		Rotate
		BoardRotateAfter
		Goto Trick_PrimoHandStand2 Params = {NoBlend = yes}
	endscript
	script Trick_OneFootDarkSlide2
		Grind {Name = 'One Foot Darkslide' Score = 800 initanim = OneFootDarkSlide_Init Anim = OneFootDarkSlide_range OutAnim = OneFootDarkSlide_Out Type = Slide NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_OneFootDarkslide2_180
		Rotate
		BoardRotateAfter
		Goto Trick_OneFootDarkSlide2 Params = {NoBlend = yes}
	endscript
	script Trick_FiftyFiftySwitcheroo2
		Grind {Name = '5050 Switcheroo' Score = 400 initanim = FiftyFiftySwitcheroo_Init Anim = FiftyFiftySwitcheroo_Idle Idle Type = Grind
			GrindBail = BackwardsGrindBails IsSpecial Speed = 3 Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_YeaRightSlide2
		Grind {Name = 'Yeah Right Slide' Score = 400 initanim = YeaRightSlide_Init Anim = YeaRightSlide_range OutAnim = YeaRightSlide_Out Type = Slide
			GrindBail = BackwardsGrindBails IsSpecial Extratricks = Extra_BS_Grinds OutAnimOnOllie SwitchBoardOff IsExtra = <IsExtra>}
		spawnscript offboard
	endscript
	script offboard BoardOffFrame = 5
		Wait <BoardOffFrame> frames
		SwitchoffBoard
	endscript
	script Trick_YeaRightSlide2_180
		Rotate
		BoardRotateAfter
		Goto Trick_YeaRightSlide2 Params = {NoBlend = yes}
	endscript
	script Trick_HCNHDF2
		Grind {Name = 'Crooks DarkSlide' Score = 800 initanim = HCNHDF_Init Anim = HCNHDF_range OutAnim = HCNHDF_Out InitSpeed = 1.5 Type = Slide NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_HCNHDF2_180
		Rotate
		BoardRotateAfter
		Goto Trick_HCNHDF2 Params = {NoBlend = yes}
	endscript
	script Trick_FSNollie360FlipCrook2
		Grind {Name = 'Nollie 360flip Crook' Score = 800 initanim = FSNollie360FlipCrook_Init Anim = FSNollie360FlipCrook_range OutAnim = FSNollie360FlipCrook_Out Type = Grind NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_FSNollie360FlipCrook2_180
		Rotate
		BoardRotateAfter
		Goto Trick_FSNollie360FlipCrook2 Params = {NoBlend = yes}
	endscript
	script Trick_MoonwalkGrind2
		Grind {Name = 'Moonwalk Five-O' Score = 800 initanim = Moonwalkgrind_Init Anim = Moonwalkgrind_idle Idle OutAnim = Moonwalkgrind_Out Type = Grind NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_MoonwalkGrind2_180
		Rotate
		BoardRotateAfter
		Goto Trick_MoonwalkGrind2 Params = {NoBlend = yes}
	endscript
	script Trick_Thinkaboutitgrind2
		Grind {Name = 'Levitate Grind' Score = 800 initanim = Thinkaboutitgrind_Init Anim = Thinkaboutitgrind_idle Idle OutAnim = Thinkaboutitgrind_Out Type = Grind NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Thinkaboutitgrind2_180
		Rotate
		BoardRotateAfter
		Goto Trick_Thinkaboutitgrind2 Params = {NoBlend = yes}
	endscript
	script Trick_360ShovitNoseGrind2
		Grind {Name = '360 Shovit NoseGrind' Score = 800 initanim = _360ShovitNoseGrind_Init Anim = _360ShovitNoseGrind_range InitSpeed = 2.0 OutAnim = _360ShovitNoseGrind_Out Type = Grind NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_360ShovitNoseGrind2_180
		Rotate
		BoardRotateAfter
		Goto Trick_360ShovitNoseGrind2 Params = {NoBlend = yes}
	endscript
	script Trick_Flames2
		Grind {Name = 'Fire Fire Fire' Score = 800 initanim = Flames_Init Anim = Flames_Idle Idle OutAnim = Flames_Out Type = Slide NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Flames2_180
		Rotate
		BoardRotateAfter
		Goto Trick_Flames2 Params = {NoBlend = yes}
	endscript
	script Trick_BlastGrind2
		Grind {Name = 'Fire Blaster' Score = 800 InitSpeed = 1.5 initanim = BlastGrind_Init Anim = BlastGrind_Idle Idle OutAnim = BlastGrind_Out Type = Grind NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_BlastGrind2_180
		Rotate
		BoardRotateAfter
		Goto Trick_BlastGrind2 Params = {NoBlend = yes}
	endscript
	script Trick_3DScaryGrind2
		Grind {Name = 'Scary Grind' Score = 800 initanim = _3DScaryGrind_Init Anim = _3DScaryGrind_Range OutAnim = _3DScaryGrind_Out Stream = ClassicMonster01 Type = Grind NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie FullScreenEffect = CreatureScaryGrindEffect Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_3DScaryGrind2_180
		Rotate
		BoardRotateAfter
		Goto Trick_3DScaryGrind2 Params = {NoBlend = yes}
	endscript
	script Trick_CrookedSkull2
		Grind {Name = 'Skull Grind' Score = 800 initanim = CrookedSkull_Init Anim = CrookedSkull_Idle Idle OutAnim = CrokkedSkull_Out Type = Grind NoBlend = yes
			GrindBail = BackwardsGrindBails IsSpecial OutAnimOnOllie Nollie = yes Extratricks = Extra_BS_Grinds SpecialItem_details = skull_details IsExtra = <IsExtra>}
	endscript
	script Trick_CrookedSkull2_180
		Rotate
		BoardRotateAfter
		Goto Trick_CrookedSkull2 Params = {NoBlend = yes}
	endscript
	script Trick_Hurricane_BS
		Grind {Name = 'BS Hurricane' Score = GRINDTAP_SCORE initanim = BSHurricaneGrind_Init InitSpeed = 1.5 Anim = BSHurricaneGrind_Range OutAnim = Init_Tailgrind OutAnimBackwards = 1 Type = Grind RearTruckSparks NoBlend = <NoBlend>
			GrindBail = BackwardsGrindBails Nollie = yes FlipBeforeOutAnim OutAnimOnOllie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_Hurricane_FS
		Grind {Name = 'FS Hurricane' Score = GRINDTAP_SCORE initanim = FSHurricaneGrind_Init InitSpeed = 1.5 Anim = FSHurricaneGrind_Range OutAnim = Nollie Type = Grind NoBlend = NoBlend
			GrindBail = FiftyFiftyFall FlipBeforeOutAnim OutAnimOnOllie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_Hurricane_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_Hurricane_BS Params = {NoBlend = yes}
	endscript
	script Trick_Hurricane_FS_180
		Rotate
		BoardRotateAfter
		Goto Trick_Hurricane_FS Params = {NoBlend = yes}
	endscript
	script Trick_Darkslide_BS
		Grind {Name = 'BS Darkslide' Score = GRINDTAP_SCORE initanim = Darkslide_Init InitSpeed = 1.5 Anim = Darkslide_Range OutAnim = Darkslide_Out Type = Slide NoBlend = <NoBlend>
			GrindBail = BackwardsGrindBails OutAnimOnOllie BoardRotate = yes Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_Darkslide_FS
		Grind {Name = 'FS Darkslide' Score = GRINDTAP_SCORE initanim = FSDarkSlide_Init InitSpeed = 1.5 Anim = FSDarkSlide_Range OutAnim = FSDarkSlide_Out Type = Slide NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall OutAnimOnOllie BoardRotate = yes Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_Darkslide_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_Darkslide_BS Params = {NoBlend = yes}
	endscript
	script Trick_Darkslide_FS_180
		Rotate
		BoardRotateAfter
		Goto Trick_Darkslide_FS Params = {NoBlend = yes}
	endscript
	script Trick_Coffin_BS
		Grind {Name = 'BS Coffin' Score = 500 initanim = CoffinGrind_Init Anim = CoffinGrind_Range OutAnim = CoffinGrind_Out Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Coffin_FS
		Grind {Name = 'FS Coffin' Score = 500 initanim = CoffinGrind_Init Anim = CoffinGrind_Range OutAnim = CoffinGrind_Out Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall IsSpecial OutAnimOnOllie Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Coffin_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_Coffin_BS Params = {NoBlend = yes}
	endscript
	script Trick_Coffin_FS_180
		Rotate
		BoardRotateAfter
		Goto Trick_Coffin_FS Params = {NoBlend = yes}
	endscript
	script Trick_fandangle_BS
		Grind {Name = 'BS Fandangle' Score = 500 initanim = fandangle_Init Anim = fandangle_Range OutAnim = Fandangle_Out Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_BS_Grinds OutAnimOnOllie BoardRotate = yes Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_fandangle_FS
		Grind {Name = 'FS Fandangle' Score = 500 initanim = fandangle_Init Anim = fandangle_Range OutAnim = Fandangle_Out Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds OutAnimOnOllie BoardRotate = yes Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_fandangle_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_fandangle_BS Params = {NoBlend = yes}
	endscript
	script Trick_fandangle_FS_180
		Rotate
		BoardRotateAfter
		Goto Trick_fandangle_FS Params = {NoBlend = yes}
	endscript
	script Trick_CrailSlide_BS
		Grind {Name = 'BS Crail Slide' Score = GRINDTAP_SCORE initanim = CrailSlide_Init Anim = CrailSlide_Range OutAnim = CrailSlide_Out Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds OutAnimOnOllie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_CrailSlide_FS
		Grind {Name = 'FS Crail Slide' Score = GRINDTAP_SCORE initanim = CrailSlide_Init Anim = CrailSlide_Range OutAnim = CrailSlide_Out Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds OutAnimOnOllie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_CrailSlide_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_CrailSlide_BS Params = {NoBlend = yes}
	endscript
	script Trick_CrailSlide_FS_180
		Rotate
		BoardRotateAfter
		Goto Trick_CrailSlide_FS Params = {NoBlend = yes}
	endscript
	script Trick_GrindOverturn_BS
		Grind {Name = 'BS 5-0 Overturn' Score = GRINDTAP_SCORE initanim = GrindOverturn_Init Anim = GrindOverturn_Range OutAnim = Init_Nosegrind OutAnimBackwards = 1 Type = Grind RearTruckSparks NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall FlipBeforeOutAnim Extratricks = Extra_BS_Grinds Nollie = 1 Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_GrindOverturn_FS
		Grind {Name = 'FS 5-0 Overturn' Score = GRINDTAP_SCORE initanim = GrindOverturn_Init Anim = GrindOverturn_Range OutAnim = Init_Nosegrind OutAnimBackwards = 1 Type = Grind RearTruckSparks NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall FlipBeforeOutAnim Extratricks = Extra_FS_Grinds Nollie = 1 Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_GrindOverturn_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_GrindOverturn_BS Params = {NoBlend = yes}
	endscript
	script Trick_GrindOverturn_FS_180
		Rotate
		BoardRotateAfter
		Goto Trick_GrindOverturn_FS Params = {NoBlend = yes}
	endscript
	script Trick_HangTenNoseGrind_BS
		Grind {Name = 'Hang Ten Nosegrind' Score = GRINDTAP_SCORE initanim = HangTenNoseGrind_Init InitSpeed = 1.5 Anim = HangTenNoseGrind_Range OutAnim = HangTenNoseGrind_Out Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds Nollie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_HangTenNoseGrind_FS
		Grind {Name = 'Hang Ten Nosegrind' Score = GRINDTAP_SCORE initanim = HangTenNoseGrind_Init InitSpeed = 1.5 Anim = HangTenNoseGrind_Range OutAnim = HangTenNoseGrind_Out Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_FS_Grinds Nollie Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_HangTenNoseGrind_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_HangTenNoseGrind_BS Params = {NoBlend = yes}
	endscript
	script Trick_HangTenNoseGrind_FS_180
		Rotate
		BoardRotateAfter
		Goto Trick_HangTenNoseGrind_FS Params = {NoBlend = yes}
	endscript
	script Trick_RowleyDarkSlide_BS
		Grind {Name = 'Rowley Darkslide' Score = 500 initanim = RowleyDarkSlide_Init Anim = RowleyDarkSlide_Range OutAnim = RowleyDarkSlide_out Type = Slide NoBlend = <NoBlend>
			GrindBail = Nutter IsSpecial OutAnimOnOllie BoardRotate = yes Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_RowleyDarkSlide_FS
		Goto Trick_RowleyDarkSlide_BS
	endscript
	script Trick_RowleyDarkSlide_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_RowleyDarkSlide_BS Params = {NoBlend = yes}
	endscript
	script Trick_RowleyDarkSlide_FS_180
		Goto Trick_RowleyDarkSlide_BS_180
	endscript
	script Trick_BigHitter_BS Extratricks = Extra_BS_Grinds
		Grind {Name = 'Big Hitter II' Score = 500 initanim = BigHitter_Init Anim = BigHitter_Range OutAnim = BigHitter_out Type = Slide NoBlend = <NoBlend>
			GrindBail = Nutter IsSpecial Extratricks = <Extratricks> OutAnimOnOllie}
	endscript
	script Trick_BigHitter_FS
		Goto Trick_BigHitter_BS Params = {Extratricks = Extra_FS_Grinds}
	endscript
	script Trick_BigHitter_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_BigHitter_BS Params = {NoBlend = yes}
	endscript
	script Trick_BigHitter_FS_180
		Goto Trick_BigHitter_BS_180
	endscript
	script Trick_NosegrindPivot_BS
		Grind {Name = 'Nosegrind to Pivot' Score = GRINDTAP_SCORE initanim = NosegrindPivot_Init InitSpeed = 1.75 Anim = NosegrindPivot_Range OutAnim = Init_Tailgrind OutAnimBackwards = 1 Type = Grind FrontTruckSparks NoBlend = NoBlend
			GrindBail = FiftyFiftyFall BoardRotate = yes FlipBeforeOutAnim EarlyOut = Init_Tailgrind Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_NosegrindPivot_FS
		Goto Trick_NosegrindPivot_BS Params = {IsExtra = IsExtra}
	endscript
	script Trick_NosegrindPivot_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_NosegrindPivot_BS Params = {NoBlend = yes}
	endscript
	script Trick_NosegrindPivot_FS_180
		Goto Trick_NosegrindPivot_BS_180
	endscript
	script Trick_TailblockSlide_BS
		Grind {Name = 'Tailblock Slide' Score = 500 initanim = TailblockSlide_Init Anim = TailblockSlide_Range OutAnim = TailblockSlide_Init Type = Slide NoBlend = <NoBlend>
			GrindBail = Nutter Extratricks = <Extratricks> IsSpecial Extratricks = Extra_BS_Grinds}
	endscript
	script Trick_TailblockSlide_FS
		Goto Trick_TailblockSlide_BS Params = {Extratricks = Extra_FS_Grinds}
	endscript
	script Trick_TailblockSlide_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_TailblockSlide_BS Params = {NoBlend = yes}
	endscript
	script Trick_TailblockSlide_FS_180
		Goto Trick_TailblockSlide_BS_180
	endscript
	script Trick_DrunkGrind_BS
		Grind {Name = 'S.U.I Grind' Score = 500 initanim = DrunkGrind_Init Anim = DrunkGrind_Idle Type = Grind NoBlend = <NoBlend>
			GrindBail = Nutter IsSpecial OutAnimOnOllie Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_Salad_FS Name = 'FS Salad'
		Grind {Name = <Name> Score = 125 GrindTweak = 9 initanim = FSSaladGrind_Init InitSpeed = 1.5 Anim = FSSaladGrind_range Type = Grind NoBlend = <NoBlend>
			GrindBail = Nutter Extratricks = Extra_FS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_Salad_BS Name = 'BS Salad'
		Grind {Name = <Name> Score = 125 GrindTweak = 9 initanim = BSSaladGrind_Init InitSpeed = 1.5 Anim = BSSaladGrind_range Type = Grind NoBlend = <NoBlend>
			GrindBail = Nutter Extratricks = Extra_BS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_Salad_FS_180
		FlipAndRotate
		Goto Trick_Salad_BS Params = {NoBlend = yes}
	endscript
	script Trick_Salad_BS_180
		FlipAndRotate
		Goto Trick_Salad_FS Params = {NoBlend = yes}
	endscript
	script Trick_NoseSlideLipSlide_FS
		if BadLedge
			Goto Trick_NoseSlideLipSlide_BS_ok
		else
			Goto Trick_NoseSlideLipSlide_FS_ok
		endif
	endscript
	script Trick_NoseSlideLipSlide_FS_ok Name = 'FS Noseslide LipSlide'
		Grind {Name = <Name> Score = GRINDTAP_SCORE initanim = FSNoseSlideLipSlide Anim = BSBoardslide_range Type = Slide Nollie = yes NoBlend = <NoBlend>
			GrindBail = Nutter Extratricks = Extra_FS_Grinds IsSpecial IsExtra = <IsExtra>}
	endscript
	script Trick_NoseSlideLipSlide_BS
		if BadLedge
			Goto Trick_NoseSlideLipSlide_FS_ok
		else
			Goto Trick_NoseSlideLipSlide_BS_ok
		endif
	endscript
	script Trick_NoseSlideLipSlide_BS_ok Name = 'BS NoseSlide LipSlide'
		Grind {Name = <Name> Score = GRINDTAP_SCORE initanim = BSNoseSlideLipSlide Anim = FSBoardslide_range Type = Slide Nollie = yes NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall Extratricks = Extra_BS_Grinds IsSpecial IsExtra = <IsExtra>}
	endscript
	script Trick_NoseSlideLipSlide_FS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_NoseSlideLipSlide_BS Params = {NoBlend = yes}
	endscript
	script Trick_NoseSlideLipSlide_BS_180
		FlipAndRotate
		BoardRotateAfter
		Goto Trick_NoseSlideLipSlide_FS Params = {NoBlend = yes}
	endscript
	script Trick_CrookedBigSpin_BS
		Grind {Name = 'Crook BigSpinFlip Switch FS Crook' Score = 500 special_item initanim = CrookBigSpinFlipCrook Anim = FSCrooked_range OutAnim = Init_FSCrooked OutAnimBackwards Type = Grind NoBlend = <NoBlend>
			GrindBail = BackwardsGrindBails IsSpecial FlipAfterInit Extratricks = Extra_FS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_CrookedBigSpin_FS
		Goto Trick_CrookedBigSpin_BS Params = {NoBlend = yes Name = 'Overcrook BigSpinFlip Overcrook'}
	endscript
	script Trick_CrookedBigSpin_BS_180
		Rotate
		BoardRotateAfter
		Goto Trick_CrookedBigSpin_BS Params = {NoBlend = yes}
	endscript
	script Trick_CrookedBigSpin_FS_180
		Goto Trick_CrookedBigSpin_BS_180
	endscript
	script Trick_FlipKickDad2
		Grind {Name = 'Flip Kick Dad' Score = 500 initanim = FlipKickDad_Init Anim = FlipKickDad Stream = FlipKickD Type = Grind NoBlend = <NoBlend> Idle
			GrindBail = FiftyFiftyFall ScreenShake = 45 IsSpecial Extratricks = Extra_BS_Grinds IsExtra = <IsExtra>}
	endscript
	script Trick_FlipKickDad2_180
		Rotate
		BoardRotateAfter
		Goto Trick_FlipKickDad2 Params = {NoBlend = yes}
	endscript
	script Trick_50Fingerflip2
		Grind {Name = '5-0 Fingerflip Nosegrind' Score = 500 initanim = TailGrindFingerFlip Anim = NoseGrind_Range Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_BS_Grinds}
	endscript
	script Trick_50Fingerflip2_180
		BackwardsGrind Grind = Trick_50Fingerflip2
	endscript
	script Trick_SprayPaintGrind2
		Grind {Name = 'Ghetto Tag Grind' Score = 500 initanim = SprayPaint_Init Anim = SprayPaint_Range OutAnim = SprayPaint_Out Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds OutAnimOnOllie Stream = GhettoTagGrind SpecialItem_details = SprayCan_Details}
	endscript
	script Trick_SprayPaintGrind2_180
		BackwardsGrind Grind = Trick_SprayPaintGrind2
	endscript
	script Trick_DaffyBrokenGrind2
		Grind {Name = 'Daffy Grind' Score = 500 initanim = DaffyBroken_Init Anim = DaffyBroken_Range Type = Grind NoBlend = <NoBlend>
			GrindBail = FiftyFiftyFall IsSpecial Extratricks = Extra_FS_Grinds SpecialItem_details = bustedboard_details}
	endscript
	script Trick_DaffyBrokenGrind2_180
		BackwardsGrind Grind = Trick_DaffyBrokenGrind2
	endscript
	script Trick_GuitarSlide2
		Grind {Name = 'Faction Guitar Slide' Score = 500 initanim = Guitar_Init Anim = Guitar_Idle Idle Type = Slide NoBlend = <NoBlend>
			GrindBail = BackwardsGrindBails Extratricks = Extra_FS_Grinds Stream = GuitarSlide SpecialItem_details = Guitar_Details IsSpecial}
	endscript
	script Trick_GuitarSlide2_180
		BackwardsGrind Grind = Trick_GuitarSlide2
	endscript
	script Trick_AmericanHero2
		Grind {Name = 'American Tribute' Score = 500 initanim = AmericanHeroGrind_Init Anim = AmericanHeroGrind_Idle OutAnim = AmericanHeroGrind_out Idle Type = Grind NoBlend = <NoBlend>
			GrindBail = BackwardsGrindBails Extratricks = Extra_FS_Grinds IsSpecial SpecialItem_details = flag_Details SpecialSounds = Jamie_HeroSounds}
	endscript
	script Trick_AmericanHero2_180
		BackwardsGrind Grind = Trick_AmericanHero2
	endscript
	script Trick_BballSlide2_180
		BackwardsGrind Grind = Trick_BballSlide2
	endscript
	script Trick_DoubleBluntSlide2
		Grind {Name = 'Double Blunt Slide' Score = GRINDTAP_SCORE initanim = DoubleBlunt_Init InitSpeed = 1.5 Anim = DoubleBlunt_Idle Idle Type = Slide NoBlend = <NoBlend>
			GrindBail = BackwardsGrindBails Extratricks = Extra_FS_Grinds IsATap IsExtra = <IsExtra>}
	endscript
	script Trick_DoubleBluntSlide2_180
		BackwardsGrind Grind = Trick_DoubleBluntSlide2
	endscript
	script Trick_ElbowSmash2
		Grind {Name = 'Elbow Smash' Score = 500 initanim = ElbowSmash_Init Anim = ElbowSmash_Idle Idle OutAnim = Elbowsmash_out OutAnimOnOllie Type = Slide NoBlend = <NoBlend> Idle
			GrindBail = FiftyFiftyFall ScreenShake = 60 IsSpecial}
	endscript
	script Trick_ElbowSmash2_180
		Rotate
		BoardRotateAfter
		Goto Trick_ElbowSmash2 Params = {NoBlend = yes}
	endscript
	script Trick_OneFootSmith_FS Name = 'FS One Foot Smith'
		Grind {Name = <Name> Score = 500 initanim = SmithFS_Init Anim = SmithFS_Range Type = Slide NoBlend = <NoBlend>
			GrindBail = Nutter Extratricks = Extra_FS_Grinds IsSpecial IsExtra = <IsExtra>}
	endscript
	script Trick_OneFootSmith_BS Name = 'BS One Foot Smith'
		Grind {Name = <Name> Score = 500 initanim = Smith_Init Anim = Smith_Range Type = Grind NoBlend = <NoBlend>
			GrindBail = Nutter Extratricks = Extra_BS_Grinds IsSpecial IsExtra = <IsExtra>}
	endscript
	script Trick_OneFootSmith_FS_180
		FlipAndRotate
		Goto Trick_OneFootSmith_BS Params = {NoBlend = yes}
	endscript
	script Trick_OneFootSmith_BS_180
		FlipAndRotate
		Goto Trick_OneFootSmith_FS Params = {NoBlend = yes}
	endscript
	script BackwardsGrind
		Rotate
		BoardRotateAfter
		Goto <Grind> Params = {NoBlend = yes}
	endscript
	script PointRail
		Vibrate Actuator = 0 Percent = 50 Duration = 0.1
		Obj_SpawnScript PointRailSparks
		BroadcastEvent Type = SkaterPointRail
		SetTrickName 'Kissed the Rail'
		SetTrickScore 50
		Display
		Goto Airborne Params = {AllowVibration}
	endscript
	script PointRailSparks
		SetRearTruckSparks
		SparksOn RailNotRequired
		Wait 0.2 seconds
		SparksOff
	endscript
	
	
	
	
	
	
	
	
	
	
	
	
	
	
