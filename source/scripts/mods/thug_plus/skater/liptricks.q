	script Ksk_DropIn DropInAnim = DropIn
		ResetSkaterParticleSystems
		PausePhysics
		RestartSkaterExceptions
		SetSkaterCamOverride heading = 0 tilt = -0.75 time = 0.000001 zoom = 5
		OnExitRun Ksk_DropIn_Cleanup
		SetRollingFriction 10000
		DisablePlayerInput
		Playanim Anim = <DropInAnim> Blendperiod = 0.0
		WaitAnim 60 Percent
		ClearSkaterCamOverride
		WaitAnim 85 Percent
		UnpausePhysics
		SetState Air
		SetRollingFriction 0
		WaitAnimFinished
		EnablePlayerInput
		OnGroundExceptions
		waitonegameframe
		Goto Airborne
	endscript
	script Ksk_DropIn_Cleanup
		ClearSkaterCamOverride
		EnablePlayerInput
		SetRollingFriction #"default"
	endscript
	
	LIPTRICK_DISPLAY_WAIT = 15
	DefaultLipTrick = {Name = 'Nose Stall' Score = 300 CopingHit = 1 InitAnim = NoseTailStall_init Anim = NoseTailStall_range OutAnim = NoseTailStall_out BoardRotate RotateOnOllie FlipOnOllie ReleaseFrame = 20 ComboLip ExtraTricks = LipTrickExtras}
	Trick_Blunt = {Scr = LipMacro2 Params = {Name = 'Blunt to Fakie' CopingHit = 5 Score = 500 InitAnim = BluntToFakie_init Anim = BluntToFakie_range OutAnim = BluntToFakie_out BoardRotate ExtraTricks = LipTrickExtras}}
	Trick_MuteInvert = {Scr = LipMacro2 Params = {Name = 'Invert' Score = 500 InitAnim = MuteInvert_init Anim = MuteInvert_range OutAnim = MuteInvert_out NoOllie BoardRotate ExtraTricks = InvertExtras}}
	Trick_Eggplant = {Scr = LipMacro2 Params = {Name = 'Eggplant' Score = 550 InitAnim = EggPlant_init Anim = EggPlant_range OutAnim = EggPlant_out NoOllie FlipAfter RevertBS ExtraTricks = InvertExtras}}
	Trick_GymnastPlant = {Scr = LipMacro2 Params = {Name = 'Gymnast Plant' Score = 575 InitAnim = GymnastPlant_init Anim = GymnastPlant_range OutAnim = GymnastPlant_out NoOllie FlipAfter RevertBS ExtraTricks = InvertExtras}}
	Trick_RockToFakie = {Scr = LipMacro2 Params = {Name = 'Rock to Fakie' Score = 500 CopingHit = 1 InitAnim = FakieRockAndRoll_init Anim = FakieRockAndRoll_range OutAnim = FakieRockAndRoll_out BoardRotate ExtraTricks = LipTrickExtras}}
	Trick_Disaster = {Scr = LipMacro2 Params = {Name = 'Disaster' Score = 600 CopingHit = 20 InitAnim = Disaster_init Anim = Disaster_range OutAnim = Disaster_out FlipAfter RotateOnOllie ExtraTricks = LipTrickExtras}}
	Trick_Invert = {Scr = LipMacro2 Params = {Name = 'Varial Invert to Fakie' Score = 450 InitAnim = Invert_init Anim = Invert_range OutAnim = Invert_out NoOllie BoardRotate RevertBS ExtraTricks = InvertExtras}}
	Trick_OneFootInvert = {Scr = LipMacro2 Params = {Name = 'One Foot Invert' Score = 500 InitAnim = OneFootInvert_init Anim = OneFootInvert_range OutAnim = OneFootInvert_out NoOllie BoardRotate ReleaseFrame = 30 RevertBS ExtraTricks = InvertExtras}}
	Trick_BSFootplant = {Scr = LipMacro2 Params = {Name = 'BS Boneless' Score = 550 InitAnim = BSFootplant_init Anim = BSFootplant_range OutAnim = BSFootplant_out OllieOutAnim = BSFootplant_OllieOut FlipAfter UseBoneless ReleaseFrame = 20 BailScript = FaceSmash RevertBS ExtraTricks = LipTrickExtras}}
	Trick_AxleStall = {Scr = LipMacro2 Params = {Name = 'Axle Stall' Score = 400 CopingHit = 8 InitAnim = AxleStall_init Anim = AxleStall_range OutAnim = AxleStall_out OllieOutAnim = AxleStall_OllieOut FlipAfter ExtraTricks = LipTrickExtras}}
	Trick_Nosepick = {Scr = LipMacro2 Params = {Name = 'FS Nosepick' Score = 550 CopingHit = 15 InitAnim = FSIndyNosepick_init Anim = FSIndyNosepick_range OutAnim = FSIndyNosepick_out FlipAfter RotateOnOllie ExtraTricks = LipTrickExtras}}
	Trick_Noseblunt = {Scr = LipMacro2 Params = {Name = 'FS Noseblunt' Score = 550 CopingHit = 20 InitAnim = FS180Noseblunt_init Anim = FS180Noseblunt_range OutAnim = FS180Noseblunt_out FlipAfter RotateOnOllie ExtraTricks = LipTrickExtras}}
	Trick_AndrectInvert = {Scr = LipMacro2 Params = {Name = 'Andrecht Invert' Score = 550 InitAnim = AndrectInvert_init Anim = AndrectInvert_range OutAnim = AndrectInvert_out NoOllie FlipAfter BoardRotate ExtraTricks = InvertExtras ReleaseFrame = 20}}
	Trick_Switcheroo = {Scr = LipMacro2 Params = {Name = 'The Switcheroo' Score = 600 InitAnim = Switcheroo_Init Anim = Switcheroo_range OutAnim = Switcheroo_Out NoOllie BoardRotate FlipAfter ExtraTricks = InvertExtras ReleaseFrame = 30}}
	Trick_Russian = {Scr = LipMacro2 Params = {Name = 'Russian Boneless' Score = 3000 InitAnim = BSFootplant_init PingPong Anim = Russian_Idle OutAnim = Russian_out OllieOutAnim = Russian_OllieOut FlipAfter UseBoneless ReleaseFrame = 20 BailScript = FaceSmash RevertBS ExtraTricks = LipTrickExtras IsSpecial}}
	Trick_HoHoSadplant = {Scr = LipMacro2 Params = {Name = 'Ho Ho Sad Plant' Score = 3500 InitAnim = HoHoSadPlant_Init PingPong Anim = HoHoSadPlant_Idle OutAnim = HoHoSadPlant_Out IsSpecial NoOllie}}
	Trick_HeelflipFSInvert = {Scr = LipMacro2 Params = {Name = 'Heelflip FS Invert' Score = 3200 InitAnim = HeelflipFSInvert_init Anim = HeelflipFSInvert_range OutAnim = HeelflipFSInvert_out NoOllie IsSpecial FlipAfter RevertBS ExtraTricks = InvertExtras}}
	Trick_1990Invert = {Scr = LipMacro2 Params = {Name = '1990 Invert' Score = 3500 InitAnim = _1990Invert_init Anim = _1990Invert_idle Idle OutAnim = _1990Invert_out NoOllie BoardRotate RevertBS NoOllie IsSpecial ExtraTricks = InvertExtras}}
	SpecialLipTricks =
	[
		{Trigger = {TripleInOrder, Up, Right, Triangle, 1000} TrickSlot = SpLip_U_R_Triangle}
		{Trigger = {TripleInOrder, Up, Down, Triangle, 1000} TrickSlot = SpLip_U_D_Triangle}
		{Trigger = {TripleInOrder, Up, Left, Triangle, 1000} TrickSlot = SpLip_U_L_Triangle}
		{Trigger = {TripleInOrder, Right, Up, Triangle, 1000} TrickSlot = SpLip_R_U_Triangle}
		{Trigger = {TripleInOrder, Right, Down, Triangle, 1000} TrickSlot = SpLip_R_D_Triangle}
		{Trigger = {TripleInOrder, Right, Left, Triangle, 1000} TrickSlot = SpLip_R_L_Triangle}
		{Trigger = {TripleInOrder, Down, Up, Triangle, 1000} TrickSlot = SpLip_D_U_Triangle}
		{Trigger = {TripleInOrder, Down, Right, Triangle, 1000} TrickSlot = SpLip_D_R_Triangle}
		{Trigger = {TripleInOrder, Down, Left, Triangle, 1000} TrickSlot = SpLip_D_L_Triangle}
		{Trigger = {TripleInOrder, Left, Up, Triangle, 1000} TrickSlot = SpLip_L_U_Triangle}
		{Trigger = {TripleInOrder, Left, Right, Triangle, 1000} TrickSlot = SpLip_L_R_Triangle}
		{Trigger = {TripleInOrder, Left, Down, Triangle, 1000} TrickSlot = SpLip_L_D_Triangle}
		{Trigger = {TripleInOrder, a = Up, b = Up, Triangle, 1000} TrickSlot = SpLip_U_U_Triangle}
	]
	LipTricks =
	[
		{Trigger = {Press, UpLeft, 500} TrickSlot = Lip_TriangleUL}
		{Trigger = {Press, UpRight, 500} TrickSlot = Lip_TriangleUR}
		{Trigger = {Press, DownLeft, 500} TrickSlot = Lip_TriangleDL}
		{Trigger = {Press, DownRight, 500} TrickSlot = Lip_TriangleDR}
		{Trigger = {Press, Left, 500} TrickSlot = Lip_TriangleL}
		{Trigger = {Press, Right, 500} TrickSlot = Lip_TriangleR}
		{Trigger = {Press, Down, 500} TrickSlot = Lip_TriangleD}
		{Trigger = {Press, Up, 500} TrickSlot = Lip_TriangleU}
		{Trigger = {Press, Triangle, 1000} Scr = LipMacro2 Params = DefaultLipTrick}
	]
	ComboLipTricks =
	[
		{Trigger = {Press, UpLeft, 500} TrickSlot = Lip_TriangleUL}
		{Trigger = {Press, UpRight, 500} TrickSlot = Lip_TriangleUR}
		{Trigger = {Press, DownLeft, 500} TrickSlot = Lip_TriangleDL}
		{Trigger = {Press, DownRight, 500} TrickSlot = Lip_TriangleDR}
		{Trigger = {Press, Left, 500} TrickSlot = Lip_TriangleL}
		{Trigger = {Press, Right, 500} TrickSlot = Lip_TriangleR}
		{Trigger = {Press, Down, 500} TrickSlot = Lip_TriangleD}
		{Trigger = {Press, Up, 500} TrickSlot = Lip_TriangleU}
		{Trigger = {Press, Triangle, 500} DefaultLipTrick}
	]
	LipTrickExtras =
	[
		{Trigger = {InOrder, a = Circle, b = Circle, 300} Trick_AxleStall}
		{Trigger = {InOrder, Circle, Square, 300} Trick_BSFootplant}
		{Trigger = {InOrder, a = Square, b = Square, 300} Trick_Disaster}
		{Trigger = {InOrder, Square, Circle, 300} Trick_RockToFakie}
		{Trigger = {InOrder, a = Triangle, b = Triangle, 300} Trick_Noseblunt}
		{Trigger = {InOrder, Triangle, Square, 300} Trick_Nosepick}
		{Trigger = {InOrder, Triangle, Circle, 300} Trick_Blunt}
	]
	InvertExtras =
	[
		{Trigger = {InOrder, a = Square, b = Square, 300} Trick_OneFootInvert}
		{Trigger = {InOrder, a = Triangle, b = Triangle, 300} Trick_MuteInvert}
		{Trigger = {InOrder, a = Circle, b = Circle, 300} Trick_GymnastPlant}
		{Trigger = {InOrder, Circle, Square, 300} Trick_Invert}
		{Trigger = {InOrder, Square, Circle, 300} Trick_Eggplant}
		{Trigger = {InOrder, Triangle, Circle, 300} Trick_AndrectInvert}
	]
	AndrectExtras =
	{Trigger = {InOrder, Triangle, Triangle, 500} Trick_Switcheroo}
	script LipMacro2
		SetSkaterCamLerpReductionTimer time = 10
		if BailIsOn
			SetState Air
			Goto LipBail
		endif
		KillExtraTricks
		BailOff
		SetState Lip
		ClearExceptions
		ClearTrickQueue
		SetQueueTricks NoTricks
		if Obj_FlagSet FLAG_SKATER_LIPTRICK_CAM_REVERSED
			SetException Ex = OffMeterTop Scr = LipOut Params = {<...>}
			if SkateInAble Lip
				SetException Ex = OffMeterBottom Scr = LipOut Params = {spine y = -24 <...>}
			else
				SetException Ex = OffMeterBottom Scr = LipBail Params = {<...>}
			endif
		else
			SetException Ex = OffMeterBottom Scr = LipOut Params = {<...>}
			if SkateInAble Lip
				SetException Ex = OffMeterTop Scr = LipOut Params = {spine y = -24 <...>}
			else
				SetException Ex = OffMeterTop Scr = LipBail Params = {<...>}
			endif
		endif
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		SetEventHandler Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBail_Called
		LaunchStateChangeEvent State = Skater_OnLip
		SetQueueTricks NoTricks
		if GotParam NoOllie
			SetException Ex = Ollied Scr = LipOut Params = {<...>}
		else
			SetException Ex = Ollied Scr = OllieLipOut Params = {<...>}
		endif
		GetTerrain
		if GotParam CopingHit
			Obj_SpawnScript CopingHit Params = {<...>}
		endif
		SetTrickName <Name>
		SetTrickScore <Score>
		if GotParam BloodFrame
			Obj_SpawnScript LipBlood Params = {<...>}
		endif
		if Obj_FlagSet FLAG_SKATER_LIPCOMBO
			BlendPeriodOut 0.0
			if GotParam ComboLip
				Flip
				BoardRotate
			endif
			DoBalanceTrick ButtonA = Right ButtonB = Left Type = Lip PlayRangeAnimBackwards
			if GotParam NoOllie
				if GotParam InitAnim
					if NOT GotParam Isextra
						Playanim Anim = <InitAnim>
						WaitAnimFinished
					else
						BlendPeriodOut 0.30000001
						Wait LIPTRICK_DISPLAY_WAIT frames
					endif
				else
					Wait LIPTRICK_DISPLAY_WAIT frames
				endif
			else
				if GotParam InitAnim
					if GotParam Isextra
						BlendPeriodOut 0.2
					endif
					Playanim Anim = <InitAnim>
					WaitAnimFinished
				else
					Wait LIPTRICK_DISPLAY_WAIT frames
				endif
			endif
			if GotParam Isextra
				LaunchExtraMessage
			endif
			PlayLipBalancingAnim <...>
			Display Blockspin
		else
			if GotParam Isextra
				LaunchExtraMessage
				if GotParam NoOllie
					PlayLipBalancingAnim <...>
					Display Blockspin
					Wait 40 frames
				else
					Playanim Anim = <InitAnim>
					Display Blockspin
					WaitAnimFinished
					PlayLipBalancingAnim <...>
				endif
			else
				if GotParam InitAnim
					Playanim Anim = <InitAnim>
					Wait LIPTRICK_DISPLAY_WAIT frames
					Display Blockspin
					WaitAnimFinished
				endif
				PlayLipBalancingAnim <...>
			endif
		endif
		if GotParam IsSpecial
			LaunchSpecialMessage
		endif
		if GotParam RevertFS
			Obj_SetFlag FLAG_SKATER_REVERTFS
		endif
		if GotParam RevertBS
			Obj_SetFlag FLAG_SKATER_REVERTBS
		endif
		if GotParam ExtraTricks
			SetExtraTricks tricks = <ExtraTricks> ignore = <Name>
		endif
		if NOT GotParam NoBalance
			while
				Tweaktrick 10
				Wait 1 Gameframe
			repeat
		else
			Goto LipOut Params = {<...>}
		endif
	endscript
	script PlayLipBalancingAnim
		if NOT GotParam NoBalance
			DoBalanceTrick ButtonA = Right ButtonB = Left Type = Lip PlayRangeAnimBackwards
			if GotParam PingPong
				Playanim Anim = <Anim> PingPong
			else
				Playanim Anim = <Anim> wobble from = end To = Start
			endif
			if GotParam Idle
				Playanim Anim = <Anim> cycle
			endif
		endif
	endscript
	script CopingHit CopingHit = 1
		Wait <CopingHit> frames
		if ((<terrain> = 3) || (<terrain> = 4))
			PlaySound copinghit3_11 Random(@pitch = 90 @pitch = 100 @pitch = 110) vol = 80
		else
			PlayBonkSound
		endif
	endscript
	script LipBlood
		Wait <BloodFrame> frames
		Obj_PlaySound Random(@BailSlap01 @BailSlap02 @BailSlap03)
		BloodParticlesOn Name = "breath.png" start_col = -1 end_col = 587202559 num = 2 emit_w = 2.0 emit_h = 2.0 angle = 50 size = 4.0 bone = head growth = 2 time = 0.5 speed = 250 grav = -1000 life = 0.5
		Obj_SpawnScript BloodSuperTiny
		Wait 1 frame
	endscript
	script LipOut y = 1
		ClearException Ollied
		ClearLipCombos
		StopBalanceTrick
		KillExtraTricks
		SetSkaterCamLerpReductionTimer time = 0
		SetException Ex = Landed Scr = LipLand Params = {<...>}
		if GotParam OutAnim
			Playanim Anim = <OutAnim> Blendperiod = 0.0
			BlendPeriodOut 0.30000001
		else
			if GotParam InitAnim
				Playanim Anim = <InitAnim> backwards
			else
			endif
		endif
		if GotParam BoardRotate
			BoardRotateAfter
		endif
		if NOT GotParam spine
			if GotParam ReleaseFrame
				WaitAnim <ReleaseFrame> frames fromend
			else
				WaitAnim 90 frames fromend
			endif
		endif
		SetState Air
		Move z = 1
		Move y = <y>
		if GotParam spine
			Rotate z = 180
			Flip
			SetTrickName "Spine Transfer"
			SetTrickScore TRANSFER_POINTS
			Display
		endif
		DoNextTrick
		NoRailTricks
		InAirExceptions
		SetException Ex = Landed Scr = LipLand Params = {<...>}
		BlendPeriodOut 0
		WaitAnimFinished
		SetException Ex = GroundGone Scr = GroundGone
		if OnGround
			LandSkaterTricks
			DoNextManualTrick
		else
			ClearManualTrick
		endif
		if Inair
			if GotParam FlipAfter
			else
				FlipAfter
			endif
			RotateAfter
			SetLandedFromVert
			Goto Airborne
		else
			LandSkaterTricks
			Goto OnGroundAi
		endif
	endscript
	script ClearLipCombos
		ClearAllowLipNoGrind
		Obj_ClearFlag FLAG_SKATER_LIPCOMBO
	endscript
	script LipLand
		OverrideCancelGround
		ClearTrickQueue
		SetQueueTricks NoTricks
		Land ReturnBacktoLipLand
		AllowRailTricks
		Rotate
		EnableDisplayFlip
		if GotParam FlipAfter
		else
			FlipAfter
		endif
		SetExtraTricks_Reverts
		WaitAnimFinished
		SetLandedFromVert
		Goto Land
	endscript
	script LipBail
		StopBalanceTrick
		Move z = 1
		Move y = 6
		SetState Air
		if GotParam FlipOnOllie
			FlipAfter
		endif
		if GotParam RotateOnOllie
			RotateAfter
		endif
		if GotParam BailScript
			Goto <BailScript>
		else
			GotoRandomScript[FaceSmash NoseManualBail ManualBail]
		endif
	endscript
	script OllieLipOut
		SetSkaterCamLerpReductionTimer time = 1
		StopBalanceTrick
		KillExtraTricks
		NoRailTricks
		Move z = 1
		Move y = 6
		if GotParam BoardRotate
			BoardRotateAfter
		endif
		if GotParam FlipOnOllie
			FlipAfter
		endif
		if GotParam RotateOnOllie
			RotateAfter
		endif
		SetLandedFromVert
		Rotate x = 90
		Rotate x = -45
		if HandleLipOllieDirection
			ClearLipCombos
			AllowRailTricks
			ResetLandedFromVert
		else
			Obj_SpawnScript SetUpLipCombo
		endif
		if GotParam OllieOutAnim
			Ollie OutAnim = <OllieOutAnim> RotateAfter = yes FromLip
		else
			Ollie
		endif
	endscript
	script SetUpLipCombo
		Wait 0.30000001 seconds
		Obj_SetFlag FLAG_SKATER_LIPCOMBO
		AllowRailTricks
		AllowLipNoGrind
		Wait 0.30000001 seconds
		if Inair
			ClearAllowLipNoGrind
			Obj_ClearFlag FLAG_SKATER_LIPCOMBO
			NoRailTricks
		endif
	endscript
	script LipTrick
		ClearExceptions
		SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		ClearTrickQueue
		KillExtraTricks
		
		if Held Black
			Move z = -15
			Move y = 0
			Rotate y = 180
			if Held White
				Goto Ksk_DropIn Params = {DropInAnim = DropIn2}
			else
				Goto Ksk_DropIn
			endif
		else 
            if Held White
				Rotate x = 90
				Rotate x = -45
			endif
			
			if Obj_FlagSet FLAG_SKATER_LIPCOMBO
				SetQueueTricks special = SpecialLipTricks ComboLipTricks
			else
				SetQueueTricks special = SpecialLipTricks LipTricks
			endif
			UseGrindEvents
			Wait 2 Gameframe
			DoNextTrick
			ClearExceptions
			SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
			ClearTrickQueue
			SetQueueTricks NoTricks
			Goto LipMacro2 Params = DefaultLipTrick
        endif
    endscript
		
		
		
		
		
		
		
		
