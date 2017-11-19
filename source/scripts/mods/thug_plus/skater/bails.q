
	script DoingTrickBail
		if backwards
			GotoRandomScript[BackwardFaceSlam Shoulders]
		else
			if SpeedLessThan 550
				if AirTimeLessThan 1 second
					Goto Runout
				endif
			endif
			if LandedFromVert
				GotoRandomScript[OneFootBail Boardsplit NutSac FlailBail RollingBail Kneeslide Faceplant LandPartiallyOnBoard Facesmash NoseManualBail ManualBail Hipper Spasmodic TailslideOut]
			else
				GotoRandomScript[Faceplant LandPartiallyOnBoard Facesmash NoseManualBail ManualBail Hipper Spasmodic TailslideOut]
			endif
		endif
	endscript
	script YawBail
		if YawingLeft
			if Flipped
				GotoRandomScript[Boardsplit NutSac FlailBail RollingBail Splits Rolling AnkleBust1 AnkleBust2 AnkleBust3 Facesmash NoseManualBail Hipper Spasmodic Faceplant]
			else
				GotoRandomScript[headsmack fallback Shoulders]
			endif
		else
			if Flipped
				GotoRandomScript[headsmack fallback Shoulders]
			else
				GotoRandomScript[OneFootBail Boardsplit NutSac FlailBail RollingBail Splits Rolling AnkleBust1 AnkleBust2 AnkleBust3 Facesmash NoseManualBail Hipper Spasmodic Faceplant TailslideOut]
			endif
		endif
	endscript
	script PitchBail
		if NOT InSplitscreenGame
			if GetGlobalFlag Flag = TAP_BUTTONS_EXPLAINED
				if NOT GetGlobalFlag Flag = RECOVERY_BUTTONS_EXPLAINED
					Create_Panel_Message {text = "Tip: press \ml in the air to level out"
						id = skater_hint style = skater_hint_style pos = (320.0,150.0) rgba = [32 75 102 100]}
					SetGlobalFlag Flag = RECOVERY_BUTTONS_EXPLAINED
				endif
			endif
		endif
		GotoRandomScript[HeadFirstSplat Neckbreaker]
	endscript
	script FiftyFiftyFall
		Goto leghook
		GotoRandomScript[Rolling FiftyFiftyFallForward FiftyFiftyFallBackward Hipper Spasmodic TailslideOut MissBackFoot]
	endscript
	script Nutter
		if Ledge
			Goto FiftyFiftyFall
		else
			GotoRandomScript[NutterForward NutterBackward MissBackFoot leghook]
		endif
	endscript
	script BackwardsGrindBails
		GotoRandomScript[Shoulders]
	endscript
	script MakeSkaterBail
		if NOT Skater::Driving
			if NOT Skater::Walking
				MakeSkaterGoto Spasmodic
			else
				MakeSkaterGoto WalkBailState
			endif
		endif
	endscript
	BAILSCRIPT = Kneeslide
	script headsmack
		GeneralBail {Anim1 = headsmack NoBlending Anim2 = HeadGetup IntoAirFrame = 1 Friction = 13 SmackAnim = Smackwallupright
			BoardOffFrame = 10 BoardVel = (0.0,0.0,0.0) BoardRotVel = (0.0,0.0,0.0) BoardSkaterVel = 0
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script OneFootBail
		GeneralBail {Anim1 = OneFootBail BoardOffFrame = 150 NoBailBoard Anim2 = OneFootGetup IntoAirFrame = 1 Friction = 14 SmackAnim = SmackWallFeet
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script Kneeslide
		GeneralBail {Anim1 = Kneeslide Anim2 = Kneeslide_resume IntoAirFrame = 1 Friction = 24 SmackAnim = SmackWallFeet
			BoardOffFrame = 0 BoardVel = (-100.0,0.0,50.0) BoardRotVel = (0.0,2.0,1.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script RollingBail
		GeneralBail {Anim1 = RollingBail Anim2 = RollingGetup IntoAirFrame = 1 Friction = 13 SmackAnim = SmackWallFeet
			BoardOffFrame = 0 BoardVel = (200.0,100.0,-50.0) BoardRotVel = (5.0,2.0,10.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script FlailBail
		GeneralBail {Anim1 = FlailBail Anim2 = FlailGetup IntoAirFrame = 1 Friction = 0 SmackAnim = SmackWallFeet
			BoardOffFrame = 0 BoardVel = (20.0,50.0,-200.0) BoardRotVel = (2.0,6.0,8.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script NutSac
		GeneralBail {Anim1 = NutSac Anim2 = Random(@NutsacGetup @NutsacGetupQUick) IntoAirFrame = 1 Friction = 25 SmackAnim = SmackWallFeet
			BoardOffFrame = 50 BoardVel = (0.0,50.0,0.0) BoardRotVel = (0.0,0.0,0.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script Boardsplit
		GeneralBail {Anim1 = Boardsplit IntoAirFrame = 1 Friction = 15 SmackAnim = SmackWallFeet
			BoardAlwaysOn
			UnrotateBoardFirst
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script Faceplant
		GeneralBail {Anim1 = Faceplant Anim2 = Kneeslide_resume IntoAirFrame = 1 Bloodframe = 14 SmackAnim = SmackWallFeet
			BoardOffFrame = 0 BoardVel = (0.0,100.0,-300.0) BoardRotVel = (0.0,5.0,0.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script MissBackFoot
		GeneralBail {Anim1 = NSMissBackFoot Anim2 = NSMissBackFoot_Resume IntoAirFrame = 1 SmackAnim = SmackWallFeet
			BoardOffFrame = 24 BoardVel = (0.0,0.0,-100.0) BoardRotVel = (3.0,2.0,1.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script AnkleBust1
		GeneralBail {Anim1 = NewAnkleBust Anim2 = RailBailGetup IntoAirFrame = 1 Friction = 15 SmackAnim = SmackWallFeet
			BoardOffFrame = 1 BoardVel = (-100.0,50.0,-100.0) BoardRotVel = (5.0,5.0,10.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script AnkleBust2
		GeneralBail {Anim1 = AnkleBust2 Anim2 = GetUpTailslideOut IntoAirFrame = 1 Friction = 17 SmackAnim = SmackWallFeet
			BoardOffFrame = 1 BoardVel = (300.0,200.0,-100.0) BoardRotVel = (5.0,5.0,9.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script AnkleBust3
		GeneralBail {Anim1 = AnkleBust3 Anim2 = GetUpAnkleBust IntoAirFrame = 1 Friction = 17 SmackAnim = SmackWallFeet
			BoardOffFrame = 40 BoardVel = (0.0,60.0,0.0) BoardRotVel = (0.0,0.0,0.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script Splits
		GeneralBail {Anim1 = Splits Anim2 = Kneeslide_resume IntoAirFrame = 1 Friction = 24 SmackAnim = SmackWallFeet
			BoardOffFrame = 1 BoardVel = (-30.0,20.0,50.0) BoardRotVel = (3.0,-1.0,0.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script Rolling
		GeneralBail {Anim1 = Rolling IntoAirFrame = 1 Friction = 15 SmackAnim = SmackWallFeet
			BoardOffFrame = 1 BoardVel = (-300.0,150.0,-100.0) BoardRotVel = (10.0,2.0,-2.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound NoBlending BoardEarlyOn
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script Shoulders
		GeneralBail {Anim1 = Shoulders NoBlending Anim2 = GetUpForwards IntoAirFrame = 20 Friction = 15 SmackAnim = Smackwallupright
			BoardOffFrame = 1 BoardVel = (-100.0,50.0,-250.0) BoardRotVel = (10.0,2.0,-2.0) BoardSkaterVel = 1
			Sound = BoardBail01 FoleySound Bloodframe = 20
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script Hipper
		GeneralBail {Anim1 = Hips Anim2 = GetUpHips Friction = 11 SmackAnim = SmackWallFeet
			IntoAirFrame = 20
			BoardOffFrame = 1 BoardVel = (300.0,250.0,-150.0) BoardRotVel = (10.0,-3.0,3.0) BoardSkaterVel = 1
			Sound = Bail04 NoBlending FoleySound NoBlending Friction2 = 17
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script Spasmodic
		GeneralBail {Anim1 = Spasmodic Anim2 = GetUpSpasmodic IntoAirFrame = 20 Friction = 14 SmackAnim = SmackWallFeet
			BoardOffFrame = 1 BoardVel = (20.0,70.0,-200.0) BoardRotVel = (2.0,5.0,1.0) BoardSkaterVel = 0
			Sound = Bail04 FoleySound NoBlending Friction2 = 14 Bloodframe = 48
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script TailslideOut
		GeneralBail {Anim1 = TailslideOut Anim2 = GetUpTailslideOut Bloodframe = 40 SmackAnim = SmackWall Sound = Bail04
			IntoAirFrame = 30
			BoardOffFrame = 1 BoardVel = (-120.0,150.0,200.0) BoardRotVel = (5.0,0.0,5.0) BoardSkaterVel = 0
			FoleySound BonkSound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script HeadFirstSplat
		GeneralBail {Anim1 = HeadFirstSplat BoardOffFrame = 60 Anim2 = GetUpBackwards IntoAirFrame = 1 Friction = 15 SmackAnim = SmackWallFeet
			Sound = Bail04 FoleySound NoBlending
			BoardOffFrame = 1 BoardVel = (25.0,50.0,0.0) BoardRotVel = (0.5,3.0,2.0) BoardSkaterVel = 0
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script Neckbreaker
		GeneralBail {Anim1 = Neckbreaker Anim2 = GetUpFacing IntoAirFrame = 1 Friction = 15 SmackAnim = SmackWallFeet
			Sound = Bail04 FoleySound NoBlending
			BoardOffFrame = 1 BoardVel = (25.0,150.0,0.0) BoardRotVel = (0.5,3.0,2.0) BoardSkaterVel = 0
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script NoseManualBail2
		GeneralBail {Anim1 = SlipForwards Anim2 = GetUpForwards IntoAirFrame = 20 Friction = 15 SmackAnim = Smackwallupright
			BoardOffFrame = 1 BoardVel = (-60.0,150.0,100.0) BoardRotVel = (10.0,1.0,-2.0) BoardSkaterVel = 0
			Sound = BoardBail01 FoleySound Bloodframe = 20
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script LandPartiallyOnBoard
		GeneralBail {Anim1 = LandPartiallyOnBoard Anim2 = GetUpForwards IntoAirFrame = 1 Friction = 15 SmackAnim = SmackWallFeet
			BoardOffFrame = 1 BoardVel = (-50.0,50.0,150.0) BoardRotVel = (-10.0,0.0,0.0) BoardSkaterVel = 1
			Sound = bail_knee1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script Runout
		if SpeedLessThan 400
			GeneralBail {Anim1 = RunOutQuick IntoAirFrame = 1 Friction = 11 BoardAlwaysOn BashOff NoBlood
				BoardAlwaysOn
				Sound = Bailrunoutflip NoScuff
				GroundGoneBail = GroundGoneBail AnimFall1 = RunOutDropIdle AnimFall2 = RunOutDrop}
		else
			GeneralBail {Anim1 = Runout IntoAirFrame = 1 SmackAnim = Smackwallupright Friction = 13 BoardAlwaysOn BashOff NoBlood
				BoardAlwaysOn
				Sound = Bailrunoutflip NoScuff
				GroundGoneBail = GroundGoneBail AnimFall1 = RunOutDropIdle AnimFall2 = RunOutDrop}
		endif
	endscript
	script BackwardFaceSlam
		Flip
		GeneralBail {Anim1 = BackwardFaceSlam Anim2 = GetUpFacing IntoAirFrame = 50 Bloodframe = 25 SmackAnim = SmackWallFeet
			BoardOffFrame = 1 BoardVel = (0.0,150.0,0.0) BoardRotVel = (0.0,0.0,1.0) BoardSkaterVel = 1
			Sound = bail_backward1 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = FeetFirstFallFront AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script BackwardsFall
		GeneralBail {Anim1 = BackwardsTest Anim2 = GetUpBackwards IntoAirFrame = 62 Bloodframe = 50 SmackAnim = SmackWallFeet
			BoardOffFrame = 1 BoardVel = (0.0,150.0,0.0) BoardRotVel = (0.0,3.0,1.0) BoardSkaterVel = 0.5
			Sound = boardbail02 HitBody FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = FeetFirstFallFront AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script fallback
		GeneralBail {Anim1 = fallback NoBlending Anim2 = Fallback_resume IntoAirFrame = 20 Bloodframe = 35
			BoardOffFrame = 1 BoardVel = (0.0,250.0,0.0) BoardRotVel = (0.0,2.0,5.0) BoardSkaterVel = 0
			Sound = Bail04 FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = fallback AnimFall2 = BigDrop AnimFall3 = GetUpFacing}
	endscript
	script leghook
		GeneralBail {Anim1 = Railbail Anim2 = GetUpFacing IntoAirFrame = 27 ForceFall Friction = 0 Bloodframe = 50 SmackAnim = SmackWall Sound = Bail04
			BoardOffFrame = 1 BoardVel = (-50.0,20.0,0.0) BoardRotVel = (0.0,1.0,-1.0) BoardSkaterVel = 1
			FoleySound FallBlendPeriod = 0 SplatFriction = 20
			GroundGoneBail = GroundGoneBail AnimFall1 = RailBailFall AnimFall2 = RailBailHitGround Friction = 0 AnimFall3 = RailBailGetup}
	endscript
	script FiftyFiftyFallForward
		GeneralBail {Anim1 = FiftyFiftyFallForward Anim2 = GetUpFacing IntoAirFrame = 40 Bloodframe = 50 SmackAnim = SmackWall Sound = Bail04
			BoardOffFrame = 1 BoardVel = (0.0,0.0,0.0) BoardRotVel = (0.0,1.0,-1.0) BoardSkaterVel = 1
			FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script FiftyFiftyFallBackward
		GeneralBail {Anim1 = FiftyFiftyFallBackward Anim2 = GetUpForwards IntoAirFrame = 50 Bloodframe = 50 SmackAnim = SmackWallFeet Sound = Bail04
			BoardOffFrame = 1 BoardVel = (0.0,0.0,0.0) BoardRotVel = (0.0,-1.0,1.0) BoardSkaterVel = 1
			FoleySound
			GroundGoneBail = GroundGoneBail AnimFall1 = FeetFirstFallFront AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script NutterForward
		GeneralBail {Anim1 = NutterFallForward Anim2 = GetUpForwards IntoAirFrame = 30 Bloodframe = 50 SmackAnim = SmackWall Sound = Bail04
			BoardOffFrame = 1 BoardVel = (20.0,0.0,0.0) BoardRotVel = (0.0,1.0,1.0) BoardSkaterVel = 1
			FoleySound BonkSound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script NutterBackward
		GeneralBail {Anim1 = NutterFallBackward Anim2 = FaceSmash_resume IntoAirFrame = 30 SmackAnim = SmackWallFeet Sound = Bail04
			BoardOffFrame = 1 BoardVel = (-20.0,0.0,0.0) BoardRotVel = (1.0,3.0,1.0) BoardSkaterVel = 0
			FoleySound BonkSound
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script ManualBail
		GeneralBail {Anim1 = ManualBack Anim2 = ManualGetup IntoAirFrame = 30 Friction = 15 SmackAnim = SmackWallFeet Sound = Bail04
			BoardOffFrame = 10 BoardVel = (0.0,50.0,400.0) BoardRotVel = (0.0,0.0,0.0) BoardSkaterVel = 1
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFallBack AnimFall2 = BigDrop AnimFall3 = GetUpFacing}
	endscript
	script NoseManualBail
		GeneralBail {Anim1 = manualforwards Anim2 = Manual_FGetup IntoAirFrame = 30 Friction = 10 SmackAnim = Smackwallupright Sound = BoardBail01
			BoardOffFrame = 10 BoardVel = (0.0,50.0,-400.0) BoardRotVel = (0.0,0.0,0.0) BoardSkaterVel = 0
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script Facesmash
		GeneralBail {Anim1 = FaceFall Anim2 = GetUpFacesmash SpeedBasedAnim1 = FaceFallSmallHit SpeedBasedAnim2 = FaceFallBigHit Speed = 300 IntoAirFrame = 30 Friction = 5 Friction2 = 5 SmackAnim = Smackwallupright Sound = bodysmackA
			BoardOffFrame = 1 BoardVel = (0.0,0.0,0.0) BoardRotVel = (0.0,0.0,0.0) BoardSkaterVel = 1
			GroundGoneBail = GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat AnimFall3 = GetUpBackwards}
	endscript
	script GeneralBail Friction = 18 Friction2 = 20 HeavyFriction = 100
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
		SetExtraPush radius = 48 Speed = 100 rotate = 6
		TurnToFaceVelocity
		if NOT GotParam BoardAlwaysOn
			if NOT IsBoardMissing
				Obj_Spawnscript BailBoardControl Params = {BoardOffFrame = <BoardOffFrame> BoardVel = <BoardVel> BoardRotVel = <BoardRotVel> BoardSkaterVel = <BoardSkaterVel> NoBailBoard = <NoBailBoard>}
			endif
		endif
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
		if NOT InSplitscreenGame
			if NOT GetGlobalFlag Flag = TAP_BUTTONS_EXPLAINED
				Create_Panel_Message {text = "Tip: tap buttons to get up faster"
					id = skater_hint style = skater_hint_style pos = (320.0,150.0) rgba = [32 75 102 100]}
				SetGlobalFlag Flag = TAP_BUTTONS_EXPLAINED
			endif
		endif
		if OnRail
			WaitAnim frame <IntoAirFrame>
			SetState Air
			move y = 2.0
			Obj_Spawnscript FallOffRail Params = {xmove = <xmove> moveframes = <moveframes>}
			Vibrate Actuator = 1 Percent = 100 Duration = 0.2
			rotate y = RandomRange(1.0,20.0)
			if GotParam BonkSound
				PlayBonkSound
			endif
			if GotParam ForceFall
				Goto GroundGoneBail Params = {<...>}
			endif
		endif
		WaitOnGround
		if NOT GotParam NoScuff
			if NOT GetGlobalFlag Flag = BLOOD_OFF
				Scuff_skater
			endif
		endif
		if NOT GetGlobalFlag Flag = BLOOD_OFF
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
		Wait 3 frames
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
	script FallOffRail xmove = 5 moveframes = 0
		movetime = (<moveframes> * 1.0)
		if (<moveframes> > 0)
			slicedmove = (<xmove> / <movetime>)
			if NOT Flipped
				slicedmove = (<slicedmove> * -1.0)
			endif
			while
				move x = <slicedmove>
				Wait 1 frame
			repeat <moveframes>
		else
			move x = <xmove>
		endif
	endscript
	script Scuff_skater
		<scuffspot> = RandomRange(0.0,4.0)
		if (<scuffspot> > 3)
		else
			if (<scuffspot> = 3)
				Scuff_DoReplacement src = "CS_NH_scar_armR.png" scuffspot = <scuffspot>
			else
				if (<scuffspot> = 2)
					Scuff_DoReplacement src = "CS_NH_scar_armL.png" scuffspot = <scuffspot>
				else
					if (<scuffspot> = 1)
						Scuff_DoReplacement src = "CS_NH_scar_legR.png" src2 = "CS_NH_scuff_legR.png" scuffspot = <scuffspot>
					else
						Scuff_DoReplacement src = "CS_NH_scar_legL.png" src2 = "CS_NH_scuff_legL.png" scuffspot = <scuffspot>
					endif
				endif
			endif
		endif
	endscript
	script Scuff_DoReplacement leftknee = 0 rightknee = 0 rightelbow = 0 leftelbow = 0
		GetTags
		switch <scuffspot>
			case 0
				leftknee = (<leftknee> + 1)
				bailcount = <leftknee>
			case 1
				rightknee = (<rightknee> + 1)
				bailcount = <rightknee>
			case 2
				leftelbow = (<leftelbow> + 1)
				bailcount = <leftelbow>
			case 3
				rightelbow = (<rightelbow> + 1)
				bailcount = <rightelbow>
		endswitch
		SetTags leftknee = <leftknee> rightknee = <rightknee> leftelbow = <leftelbow> rightelbow = <rightelbow>
		if GetGlobalFlag Flag = CHEAT_SUPER_BLOOD
			bailcount = (<bailcount> + 5)
		endif
		if GotParam src2
			if (<bailcount> > 9)
				Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_06"
			else
				if (<bailcount> > 7)
					Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_05"
				else
					if (<bailcount> > 6)
						Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_04"
						Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_05"
					else
						if (<bailcount> > 5)
							Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_03"
						else
							if (<bailcount> > 4)
								Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scar_02"
							else
								if (<bailcount> > 3)
									Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_04"
									Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_01"
								else
									if (<bailcount> > 2)
										Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_03"
									else
										if (<bailcount> > 1)
											Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_02"
										else
											Obj_ReplaceTexture src = <src2> dest = "textures/scuffs/CS_NH_scuff_01"
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		else
			if (<bailcount> > 9)
				Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_06"
			else
				if (<bailcount> > 7)
					Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_05"
				else
					if (<bailcount> > 5)
						Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_04"
					else
						if (<bailcount> > 3)
							Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_03"
						else
							if (<bailcount> > 1)
								Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_02"
							else
								Obj_ReplaceTexture src = <src> dest = "textures/scuffs/CS_NH_scar_01"
							endif
						endif
					endif
				endif
			endif
		endif
	endscript
	script CleanUp_Scuffs
		Obj_ReplaceTexture src = "CS_NH_scar_armR.png" dest = "textures/scuffs/CS_NH_scar_armR"
		Obj_ReplaceTexture src = "CS_NH_scar_armL.png" dest = "textures/scuffs/CS_NH_scar_armL"
		Obj_ReplaceTexture src = "CS_NH_scar_legR.png" dest = "textures/scuffs/CS_NH_scar_legR"
		Obj_ReplaceTexture src = "CS_NH_scar_legL.png" dest = "textures/scuffs/CS_NH_scar_legL"
		Obj_ReplaceTexture src = "CS_NH_scuff_legR.png" dest = "textures/scuffs/CS_NH_scuff_legR"
		Obj_ReplaceTexture src = "CS_NH_scuff_legL.png" dest = "textures/scuffs/CS_NH_scuff_legL"
		Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_board_trans01"
		SetTags leftknee = 0 rightknee = 0 rightelbow = 0 leftelbow = 0
	endscript
	script CleanUp_Deck
		Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_board_trans01"
		SetTags Boardscuff = 0
	endscript
	script DoBoardScuff
		switch <Boardscuff>
			case 10
				Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_01"
			case 20
				Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_02"
			case 30
				Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_03"
			case 40
				Obj_ReplaceTexture src = "CS_NN_board_trans01.png" dest = "textures/scuffs/CS_NN_boardscuff_04"
			default
		endswitch
	endscript
	script BailBoardControl BoardOffFrame = 5
		Wait <BoardOffFrame> frames
		SwitchOffBoard
		if NOT GotParam NoBailBoard
			CreateBailBoard vel = <BoardVel> rotvel = <BoardRotVel> object_vel_factor = <BoardSkaterVel>
		endif
	endscript
	script SpeedCheckStop
		if SpeedLessThan 300
			SetRollingFriction 100
		endif
	endscript
	script HitBody hitbodyframe = 15
		Wait <hitbodyframe> frames
	endscript
	script BailSmack SmackAnim = SmackWall
		if InSlapGame
			SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		else
			if GameModeEquals is_firefight
				SetEventHandler Ex = SkaterCollideBail Scr = Bail_FireFight_SkaterCollideBail
			endif
		endif
		TurnToFaceVelocity
		SwitchOffBoard
		SetRollingFriction 15
		PlayAnim Anim = <SmackAnim> Blendperiod = 0.1
		Obj_Spawnscript BloodTiny
		Vibrate Actuator = 1 Percent = 100 Duration = 0.2
		WaitAnimFinished
		if AnimEquals SmackWall
			PlayAnim Anim = GetUpFacesmash Blendperiod = 0.1
		else
			if AnimEquals Smackwallupright
				PlayAnim Anim = GetUpBackwards Blendperiod = 0.1
			else
				PlayAnim Anim = GetUpFacing Blendperiod = 0.1
			endif
		endif
		SetRollingFriction 15
		WaitAnim 80 Percent
		SwitchOnBoard
		BoardRotate normal
		WaitAnimFinished
		Goto Baildone
	endscript
	script GroundGoneBail AnimFall1 = HeadFirstFall AnimFall2 = HeadFirstSplat SplatFriction = 100 FallBlendPeriod = 0.30000001
		InBail
		ClearExceptions
		if InSlapGame
			SetException Ex = SkaterCollideBail Scr = SkaterCollideBail
		else
			if GameModeEquals is_firefight
				SetEventHandler Ex = SkaterCollideBail Scr = Bail_FireFight_SkaterCollideBail
			endif
		endif
		DisablePlayerInput AllowCameraControl
		SetExtraPush radius = 48 Speed = 100 rotate = 6
		SwitchOffBoard
		PlayAnim Anim = <AnimFall1> NoRestart Blendperiod = <FallBlendPeriod>
		while
			if AnimFinished
				PlayAnim Anim = <AnimFall1> PingPong From = End To = 20 Speed = 0.5 Blendperiod = 0.1
			endif
			if OnGround
				break
			endif
			WaitOneGameFrame
		repeat
		Vibrate Actuator = 1 Percent = 100 Duration = 0.2
		if GotParam NoBlood
		else
			Obj_Spawnscript BloodTiny
		endif
		SetRollingFriction <SplatFriction>
		PlayAnim Anim = <AnimFall2> NoRestart Blendperiod = 0.1
		BashOn
		if GotParam AnimFall3
			WaitAnimFinished
			PlayAnim Anim = <AnimFall3> NoRestart Blendperiod = 0.1
		endif
		WaitAnim 20 frames fromend
		BoardRotate normal
		SwitchOnBoard
		WaitAnimFinished
		Goto Baildone
	endscript
	script Baildone
		Obj_RestoreBoundingSphere
		ClearLipCombos
		NotifyBailDone
		SetExtraPush radius = 0
		SetRollingFriction #"default"
		ClearTrickQueue
		ClearEventBuffer
		ClearManualTrick
		BashOff
		EnablePlayerInput
		NotInBail
		ClearGapTricks
		KillExtraTricks
		SetSkaterCamLerpReductionTimer time = 0
		ClearSkaterFlags
		LockVelocityDirection Off
		RestoreAutoKick
		CanBrakeOn
		if NOT Walking
			if IsBoardMissing
				SwitchToWalkingPhysics
				Goto StandState
			endif
			Goto OnGroundAI
		endif
	endscript
	script BloodOn size = 1 radius = 1 name = "blood_01"
		TextureSplat radius = RandomRange(1.0,40.0) size = <size> bone = bone_head name = <name> lifetime = 20
	endscript
	script BloodOn_Down size = 1 radius = 1 name = "blood_01"
		TextureSplat radius = RandomRange(10.0,300.0) size = <size> bone = bone_head name = <name> dropdown_length = 100 dropdown_vertical lifetime = 20
	endscript
	script BloodBig
		BloodOn <...> size = 10.0 freq = 2.0 rnd_radius = 12
		Wait 2 frames
		BloodOff <...>
		BloodOn <...> size = 7.0 freq = 2.0 rnd_radius = 12
		Wait 4 frames
		BloodOff <...>
		BloodOn <...> size = 3.0 freq = 0.80000001 rnd_radius = 12
		Wait 3 frames
		BloodOff <...>
	endscript
	script BloodCar
		Wait 30 frames
		TextureSplat radius = 2 size = 20 bone = bone_head name = "blood_01" lifetime = 20
	endscript
	script BloodJackAss
		if NOT GetGlobalFlag Flag = BLOOD_OFF
			Wait 30 frames
			printf "MAKING SOME BIG BLOOD..............."
			BloodOn_Down size = RandomRange(8.0,15.0)
			BloodOn_Down size = RandomRange(8.0,15.0)
			Wait RandomRange(1.0,8.0) frames
			BloodOn_Down <...> size = RandomRange(6.0,12.0)
			BloodOn_Down <...> size = RandomRange(6.0,12.0)
			Wait RandomRange(1.0,8.0) frames
			BloodOn_Down <...> size = RandomRange(4.0,8.0)
			BloodOn_Down <...> size = RandomRange(4.0,8.0)
			Wait RandomRange(1.0,8.0) frames
			BloodOn_Down size = RandomRange(2.0,6.0)
		endif
	endscript
	script BloodSmall
		if NOT GetGlobalFlag Flag = BLOOD_OFF
			if NOT GetGlobalFlag Flag = CHEAT_SUPER_BLOOD
				if OnGround
					Obj_Spawnscript BloodSplat
				endif
				Wait 14 frames
				BloodOn <...> size = RandomRange(8.0,12.0) freq = 2.0 rnd_radius = 36
				Wait RandomRange(1.0,3.0) frames
				BloodOn <...> size = RandomRange(6.0,10.0) freq = 2.0 rnd_radius = 36
				Wait RandomRange(1.0,3.0) frames
				BloodOn <...> size = RandomRange(4.0,8.0) freq = 0.80000001 rnd_radius = 36
				Wait RandomRange(1.0,3.0) frames
				BloodOn size = RandomRange(2.0,6.0)
			else
				Obj_Spawnscript BloodSplat
				Wait 14 frames
				Obj_Spawnscript BloodSplat
				TextureSplat radius = RandomRange(20.0,40.0) size = RandomRange(30.0,40.0) bone = bone_head name = "blood_01" lifetime = 20
				Wait 5 frame
				BloodOn <...> size = RandomRange(15.0,20.0)
				Wait 4 frame
				BloodOn <...> size = RandomRange(10.0,15.0)
				Wait 4 frame
				BloodOn <...> size = RandomRange(10.0,15.0)
				Wait 3 frames
				BloodOn size = RandomRange(6.0,10.0)
				Wait 2 frame
				BloodOn size = RandomRange(6.0,10.0)
				Wait 1 frame
				BloodOn size = RandomRange(6.0,10.0)
			endif
		endif
	endscript
	script BloodTiny
		if NOT GetGlobalFlag Flag = BLOOD_OFF
			Obj_Spawnscript BloodSplat
			BloodOn <...> size = 5.0 freq = 2.0 rnd_radius = 12
			Wait 4 frames
			BloodOff <...>
			BloodOn <...> size = 2.0 freq = 0.80000001 rnd_radius = 12
			Wait 3 frames
			BloodOff <...>
		endif
	endscript
	script BloodSuperTiny
		Obj_Spawnscript BloodSplat
		BloodOn <...> size = 1.0 freq = 2.0 rnd_radius = 12
		Wait 4 frames
		BloodOff <...>
		BloodOn <...> size = 0.5 freq = 0.80000001 rnd_radius = 12
		Wait 3 frames
		BloodOff <...>
	endscript
	script BloodSplat
		if NOT GetGlobalFlag Flag = BLOOD_OFF
			BloodParticlesOn name = "blood_1.png" start_col = -16777046 end_col = 570425514 num = 10 emit_w = 2.0 emit_h = 2.0 angle = 10 size = 2.0 bone = bone_head growth = 1.5 time = 0.30000001 Speed = 250 grav = -900 life = 0.30000001
		endif
	endscript
	
	
	script SwitchOnBoard
		if NOT IsLocalSkater
			return
		endif
		if NOT IsBoardMissing
			SwitchOnAtomic Board
		else
			SwitchOffBoard
		endif
	endscript
	
	BailBoardComponents = [
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
	
	
	script CreateBailBoard vel = (0.0,0.0,0.0) rotvel = (0.0,0.0,0.0) object_vel_factor = 1
		Change KSK_BOARD_COUNT = (KSK_BOARD_COUNT + 1)
		Ksk_DebugValue value_name = "board count" value_value = KSK_BOARD_COUNT
		
		Obj_GetId
		MangleChecksums a = BailBoard b = <objId>
		
		Skeleton_SpawnCompositeObject <...> offset = (0.0,3.0,2.0) bone = Bone_Board_Root components = BailBoardComponents Params = {name = <mangled_id> cloneFrom = <objId> geoms = [Board]}
		<mangled_id>::RigidBody_IgnoreSkater 15 frames
		<mangled_id>::RigidBody_Wake
		<mangled_id>::Obj_Invisible
		
		if ControllerPressed White
			
			PlaySkaterCamAnim Skater = 0 {virtual_cam
				targetid = <mangled_id>
				targetOffset = (0.0,0.0,0.0)
				positionOffset = (50.0,0.0,50.0)
				frames = 9001
				skippable = 1
				play_hold
			}
		endif
		
		RunScriptOnObject ksk_exit_board_ex id = <mangled_id>
		
	endscript
	
	script SwitchOffBoard
		SwitchOffAtomic Board
	endscript
	script CleanUpSpecialItems
		SwitchOffAtomic special_item
		SwitchOnAtomic special_item_2
	endscript
	script SkaterCollideBall
		if InAir
			InAirExceptions
			Obj_Spawnscript CarSparks
			PlayAnim Anim = Boneless Blendperiod = 0.30000001
			SetTrickName "Scratchin the Ball!"
			SetTrickScore 400
			Display
			WaitAnimWhilstChecking AndManuals
			Goto Airborne
		else
			InBail
			Obj_Spawnscript BloodCar
			Goto NoseManualBail
			LaunchPanelMessage "Ball Busted!"
		endif
	endscript
	script skater_play_bail_stream
		Obj_PlayStream <stream_checksum> vol = 500
	endscript
	script skater_hint_style
		DoMorph time = 0 scale = (0.0,0.0)
		DoMorph time = 0.1 scale = (2.5,2.5)
		DoMorph time = 0.1 scale = (0.75,0.75)
		DoMorph time = 0.1 scale = (1.29999995,1.29999995)
		DoMorph time = 0.1 scale = (1.10000002,1.10000002)
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.05 alpha = 0.60000002
		DoMorph time = 0.05 alpha = 1
		DoMorph time = 0.1 scale = (2.5,2.5)
		DoMorph time = 0.2 scale = (12.0,0.0) alpha = 0
		die
	endscript
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
