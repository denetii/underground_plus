
	SpecialTricks =
	[
		{Trigger = {TripleInOrder, Up, Right, Square, 400} TrickSlot = SpAir_U_R_Square}
		{Trigger = {TripleInOrder, Up, Down, Square, 400} TrickSlot = SpAir_U_D_Square}
		{Trigger = {TripleInOrder, Up, Left, Square, 400} TrickSlot = SpAir_U_L_Square}
		{Trigger = {TripleInOrder, Right, Up, Square, 400} TrickSlot = SpAir_R_U_Square}
		{Trigger = {TripleInOrder, Right, Down, Square, 400} TrickSlot = SpAir_R_D_Square}
		{Trigger = {TripleInOrder, Right, Left, Square, 400} TrickSlot = SpAir_R_L_Square}
		{Trigger = {TripleInOrder, Down, Up, Square, 400} TrickSlot = SpAir_D_U_Square}
		{Trigger = {TripleInOrder, Down, Right, Square, 400} TrickSlot = SpAir_D_R_Square}
		{Trigger = {TripleInOrder, Down, Left, Square, 400} TrickSlot = SpAir_D_L_Square}
		{Trigger = {TripleInOrder, Left, Up, Square, 400} TrickSlot = SpAir_L_U_Square}
		{Trigger = {TripleInOrder, Left, Right, Square, 400} TrickSlot = SpAir_L_R_Square}
		{Trigger = {TripleInOrder, Left, Down, Square, 400} TrickSlot = SpAir_L_D_Square}
		{Trigger = {TripleInOrder, Up, Right, Circle, 400} TrickSlot = SpAir_U_R_Circle}
		{Trigger = {TripleInOrder, Up, Down, Circle, 400} TrickSlot = SpAir_U_D_Circle}
		{Trigger = {TripleInOrder, Up, Left, Circle, 400} TrickSlot = SpAir_U_L_Circle}
		{Trigger = {TripleInOrder, Right, Up, Circle, 400} TrickSlot = SpAir_R_U_Circle}
		{Trigger = {TripleInOrder, Right, Down, Circle, 400} TrickSlot = SpAir_R_D_Circle}
		{Trigger = {TripleInOrder, Right, Left, Circle, 400} TrickSlot = SpAir_R_L_Circle}
		{Trigger = {TripleInOrder, Down, Up, Circle, 400} TrickSlot = SpAir_D_U_Circle}
		{Trigger = {TripleInOrder, Down, Right, Circle, 400} TrickSlot = SpAir_D_R_Circle}
		{Trigger = {TripleInOrder, Down, Left, Circle, 400} TrickSlot = SpAir_D_L_Circle}
		{Trigger = {TripleInOrder, Left, Up, Circle, 400} TrickSlot = SpAir_L_U_Circle}
		{Trigger = {TripleInOrder, Left, Right, Circle, 400} TrickSlot = SpAir_L_R_Circle}
		{Trigger = {TripleInOrder, Left, Down, Circle, 400} TrickSlot = SpAir_L_D_Circle}
	]
	GRABTWEAK_SMALL = 15
	GRABTWEAK_MEDIUM = 20
	GRABTWEAK_LARGE = 25
	GRABTWEAK_EXTRALARGE = 40
	GRABTWEAK_SPECIAL = 30
	Trick_BamBendAir = {Scr = GrabTrick Params = {Name = 'Bam Bend Air' Speed = 1.29999995 Score = 1300 Anim = BamBendAir_Init Idle = BamBendAir_Idle trickslack = 100 IsSpecial}}
	Trick_FlyingSquirrel = {Scr = GrabTrick Params = {Name = 'Flying Squirrel' Speed = 1.29999995 Score = 1500 Anim = FlyingSquirrel_Init Idle = FlyingSquirrel_Idle IsSpecial}}
	Trick_Shifty360ShovitBSShifty = {Scr = GrabTrick Params = {Name = 'Shifty Shifty' Speed = 2.0 Score = 2000 Anim = Shifty360ShovitBSShifty_Init ForceInit Idle = Shifty360ShovitBSShifty_Idle Idle OutAnim = Shifty360ShovitBSShifty_Out trickslack = 100 IsSpecial boardrotate}}
	Trick_flipflip = {Scr = FlipTrick Params = {Name = 'Rodeo Wrap' Score = 1600 Anim = flipflip ForceInit IsSpecial boardrotate trickslack = 20 RotateAfter NoSpin Speed = 1.20000005 maxspeed = 1.29999995}}
	Trick_540varielheelfliplien = {Scr = FlipTrick Params = {Name = '360 Varial Heelflip Lien' Score = 1500 Anim = _540varielheelfliplien Speed = 1.29999995 IsSpecial boardrotate trickslack = 20 Speed = 1.20000005 maxspeed = 1.29999995}}
	Trick_LickItUp = {Scr = GrabTrick Params = {Name = 'Lick It Up' Speed = 1.29999995 Score = 1500 Anim = LickItUp_Init Idle = LickItUp_Idle Idle OutAnim = LickItUp_Out trickslack = 100 SpecialItem_details = tongue_details Skater = Gene IsSpecial}}
	Trick_3DSwimAir = {Scr = GrabTrick Params = {Name = 'Swimmer' Skater = Creature Speed = 1.29999995 Score = 1500 Anim = _3DSwimAir_Init Idle = _3DSwimAir_Idle Idle OutAnim = _3DSwimAir_Out trickslack = 100 IsSpecial}}
	Trick_BootBurst = {Scr = GrabTrick Params = {Name = 'Boot Burst' Skater = Iron_Man Score = 2000 Speed = 1.29999995 Anim = bootburst_Init Idle = bootburst_Idle Idle OutAnim = bootburst_Out trickslack = 100 IsSpecial}}
	Trick_FSFlipOneFootTailGrab = {Scr = GrabTrick Params = {Name = '360 Flip Tail Grab' Score = 1600 Anim = FSFlipOneFootTailGrab_Init ForceInit InitSpeed = 1.5 Idle = FSFlipOneFootTailGrab_Idle Idle OutAnim = FSFlipOneFootTailGrab_Out IsSpecial trickslack = 10}}
	Trick_Flamingo = {Scr = GrabTrick Params = {Name = 'Flamingo' Score = 1500 Anim = Flamingo_Init Idle = Flamingo_Idle OutAnim = Flamingo_Out Speed = 1.20000005 IsSpecial}}
	Trick_SambaFlip = {Scr = GrabTrick Params = {Name = 'Samba Flip' Score = 1600 Anim = SambaFlip Idle = Indy_Idle BackwardsAnim = Indy trickslack = 10 ForceInit IsSpecial Speed = 1.39999998}}
	Trick_360VarialMcTwist = {Scr = FlipTrick Params = {Name = '360 Varial McTwist' Score = 5750 Anim = _360VarialMcTwist boardrotate IsSpecial RevertBS NoSpin trickslack = 10 RotateAfter Speed = 1.29999995 maxspeed = 1.10000002 Spinslack = 20}}
	Trick_BarrelRoll = {Scr = FlipTrick Params = {Name = 'Barrel Roll' Score = 5000 Anim = BarrelRoll IsSpecial NoSpin trickslack = 10 boardrotate Speed = 1.0 maxspeed = 1.10000002 Spinslack = 10}}
	Trick_Indy900 = {Scr = FlipTrick Params = {Name = 'Indy 900' Score = 11000 Anim = Indy900 IsSpecial boardrotate trickslack = 20 RotateAfter NoSpin Speed = 1.29999995 maxspeed = 1.39999998}}
	Trick_SitDownAir = {Scr = GrabTrick Params = {Name = 'Sit Down Air' Score = 1200 Anim = SitDownAir_Init Idle = SitDownAir_Idle IsSpecial WaitPercent = 80}}
	Trick_ChompOnThis = {Scr = GrabTrick Params = {Name = 'Chomp On This' Score = 1000 Anim = ChompOnThis_Init Idle = ChompOnThis_Idle OutAnim = ChompOnThis_Out IsSpecial maxspeed = 0.89999998 ForceInit Stream = ChompOnThis SpecialItem_details = PizzaBox_details Speed = 0.89999998}}
	
	Trick_GhettoBird = {Scr = FlipTrick Params = {Name = 'Ghetto Bird' Score = 900 Anim = GhettoBird boardrotate trickslack = 20 Speed = 1.0 ExtraTricks = Trick_GhettoBird2}}
	Trick_GhettoBird2 = [{Trigger_Extra_Flip Params = {Name = '360 Ghetto Bird' Score = 1200 Anim = GhettoBird2 boardrotate NoSpin Speed = 1.20000005 trickslack = 20 IsExtra UseCurrent}}]
	
	
	Trick_BreakIn = {Scr = FlipTrick Params = {Name = 'Back Spin Air' Score = 3000 Anim = BreakIn_Init boardrotate trickslack = 20 RotateAfter Speed = 1.79999995 IsSpecial}}
	Trick_BigSpinShifty = {Scr = GrabTrick Params = {Name = 'BigSpin Shifty' Score = 1650 Speed = 1.20000005 Anim = FSBigSpinShifty_Init Idle = FSBigSpinShifty_Idle OutAnim = FSBigSpinShifty_Out IsSpecial ForceInit FlipAfter}}
	Trick_The900 = {Scr = FlipTrick Params = {Name = 'The 900' Score = 9000 Anim = The900 IsSpecial boardrotate trickslack = 20 RotateAfter NoSpin Speed = 1.29999995 maxspeed = 1.39999998}}
	Trick_KFBackflip = {Scr = FlipTrick Params = {Name = 'Kickflip Backflip' Score = 3000 Anim = KickFlipBodyBackFlip IsSpecial Speed = 1.0 NoSpin trickslack = 15 Spinslack = 25}}
	Trick_FS540 = {Scr = FlipTrick Params = {Name = 'FS 540' Score = 5500 Anim = FS540 boardrotate IsSpecial trickslack = 10 RevertBS RotateAfter NoSpin Speed = 0.89999998 Spinslack = 40}}
	Trick_McTwist = {Scr = FlipTrick Params = {Name = 'McTwist' Score = 5000 Anim = McTwist boardrotate IsSpecial RevertBS NoSpin trickslack = 10 RotateAfter Speed = 1.0 maxspeed = 1.10000002 Spinslack = 20}}
	Trick_2KickMadonnaFlip = {Scr = GrabTrick Params = {Name = 'Double Kickflip Madonna' Score = 2250 Anim = _2KickMadonnaFlip_Init Idle = Madonna_Idle OutAnim = _2KickMadonnaFlip_Out IsSpecial ForceInit trickslack = 15 Speed = 1.14999998}}
	Trick_AssumePosition = {Scr = GrabTrick Params = {Name = 'Assume The Position II' Score = 1000 Anim = AssumePosition_Init Idle = AssumePosition_Idle IsSpecial Speed = 0.80000001 ForceInit trickslack = 10}}
	Trick_AirCasperFlip = {Scr = GrabTrick Params = {Name = 'Casper Flip 360 Flip' Score = 2500 Anim = AirCasperFlip_Init Idle = AirCasperFlip_Idle OutAnim = AirCasperFlip_Out IsSpecial Speed = 1.10000002 ForceInit trickslack = 20}}
	Trick_540TailWhip = {Scr = FlipTrick Params = {Name = '540 TailWhip' Score = 2500 Anim = _540TailWhip IsSpecial boardrotate Speed = 1.10000002 maxspeed = 1.20000005 trickslack = 15}}
	Trick_Gazelle = {Scr = FlipTrick Params = {Name = 'Gazelle Underflip' Score = 3500 Anim = GazelleUnderflip IsSpecial boardrotate trickslack = 20 NoSpin}}
	HIGHSPEED = 1.0
	Trick_SemiFlip = {Scr = FlipTrick Params = {Name = 'Semi Flip' Score = 1150 Anim = SemiFlip boardrotate IsSpecial Speed = 1.10000002 trickslack = 20}}
	Trick_FingerFlipAirWalk = {Scr = FlipTrick Params = {Name = 'Fingerflip Airwalk' Score = 1500 Anim = FingerFlipAirWalk IsSpecial boardrotate Speed = 1.0 trickslack = 30 HoldFrame = 40}}
	Trick_Jackass = {Scr = FlipTrick Params = {Name = 'The Jackass' Score = 1600 Anim = Jackass IsSpecial Speed = 1 maxspeed = 1.20000005 trickslack = 20 BloodFrame = 1}}
	Trick_1234 = {Scr = FlipTrick Params = {Name = '1-2-3-4' Score = 1600 Anim = _1234 IsSpecial Speed = 0.80000001 trickslack = 20}}
	
	Trick_Layout = {Scr = FlipTrick Params = {Name = 'Layout' Score = 1600 Anim = Layout IsSpecial Speed = 1.0 trickslack = 20}}
	Trick_LienRodeo = {Scr = FlipTrick Params = {Name = 'Lien Rodeo' Score = 1600 Anim = Lien_Rodeo IsSpecial Speed = 1.0 trickslack = 20 boardrotate}}
	
	Trick_MistyFlip = {Scr = FlipTrick Params = {Name = 'Misty Flip' Score = 5000 Anim = MistyFlip IsSpecial Speed = 1.20000005 NoSpin trickslack = 15 Spinslack = 30}}
	Trick_MightAsWellJump = {Scr = GrabTrick Params = {Name = 'Might As Well Jump' Speed = 1.75 Score = 1750 Anim = MightAsWellJump_Init Idle = MightAsWellJump_Idle OutAnim = MightAsWellJump_Out IsSpecial ForceInit SpecialItem_details = bustedboard_jump_details trickslack = 20}}
	
	
	Trick_DoubleKFindy = {Scr = FlipTrick Params = {Name = 'Double Kickflip Varial Indy' Score = 1200 Anim = DoubleKFVarialIndy maxspeed = 1.20000005 trickslack = 20 IsSpecial boardrotate HoldFrame = 15}}
	Trick_540Flip = {Scr = FlipTrick Params = {Name = '540 Flip' Score = 1450 Anim = _540flip boardrotate IsSpecial Speed = 1.10000002 maxspeed = 1.20000005 trickslack = 20}}
	Trick_NollieFlipUnderflip = {Scr = FlipTrick Params = {Name = 'Nollie Flip Underflip' Score = 1150 Anim = NollieFlipUnderFlip IsSpecial trickslack = 10 Speed = 1.0 maxspeed = 1.29999995}}
	Trick_HardFlipBackFootFlip = {Scr = FlipTrick Params = {Name = 'Hardflip Late Flip' Score = 1500 Anim = HardFlipBackFootFlip IsSpecial trickslack = 15 Speed = 1.0 boardrotate}}
	Trick_KickFlipUnderFlip = {Scr = FlipTrick Params = {Name = 'Kickflip Underflip' Score = 1000 Anim = KickFlipUnderFlip IsSpecial trickslack = 10 maxspeed = 1.29999995 Speed = 1.10000002}}
	Trick_QuadrupleHeelFlip = {Scr = FlipTrick Params = {Name = 'Quad Heelflip' Score = 1400 Anim = QuadrupleHeelFlip IsSpecial trickslack = 10 Speed = 1.0}}
	Trick_OldSkoolKickflip = {Scr = FlipTrick Params = {Name = 'Old Sk00l Kickflip' Score = 300 Speed = 1.20000005 Anim = KickFlipOldSkool FlipAfter Nollie = NollieKickflip ExtraTricks = DoubleKickflip}}
	
	Trick_BigSpinFlip = {Scr = FlipTrick Params = {Name = 'Bigspin Flip' Score = 500 Anim = BigSpinFlip boardrotate FlipAfter Speed = 1.5 maxspeed = 1.5 ExtraTricks = Trick_KickflipShift}}
	Trick_KickflipShift = [{Trigger_Extra_Flip Params = {Name = 'Kickflip Shifty' Score = 1200 Anim = KickflipShift Speed = 1.20000005 trickslack = 25 IsExtra UseCurrent}}]
	Extra_BigSpinFlip = [{Trigger_Extra_Flip Params = {Name = 'Bigspin Flip' Score = 500 Anim = BigSpinFlip boardrotate FlipAfter Speed = 1.5 IsExtra UseCurrent}}]
	
	
	Trick_FSFlip = {Scr = FlipTrick Params = {Name = 'FS Flip' Score = 500 Anim = FSFlip boardrotate FlipAfter maxspeed = 1.5 ExtraTricks = Extra_VarialKickflip}}
	Trick_BSFlip = {Scr = FlipTrick Params = {Name = 'BS Flip' Score = 500 Anim = BSFlip boardrotate FlipAfter maxspeed = 1.5 ExtraTricks = Extra_VarialKickflip}}
	Trick_FSBigSpin = {Scr = FlipTrick Params = {Name = 'BS Bigspin' Score = 500 Anim = FSBigSpin Speed = 1.20000005 FlipAfter maxspeed = 2 ExtraTricks = Trick_KickflipShift}}
	Trick_BSBigSpin = {Scr = FlipTrick Params = {Name = 'FS Bigspin' Score = 500 Anim = BSBigSpin Speed = 1.39999998 FlipAfter maxspeed = 2 ExtraTricks = Extra_BigSpinFlip}}
	
	Trick_BackfootShoveIt = {Scr = FlipTrick Params = {Name = 'Back Foot Shove-It' Score = 150 Anim = NollieBSShoveIt Nollie = PopShoveIt ExtraTricks = Extra_360BackfootShoveIt boardrotate}}
	Extra_360BackfootShoveIt = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '360 Back Foot Shove-It' Score = 500 Anim = NollieBS360ShoveIt IsExtra UseCurrent}}]
	Trick_VarialKickflip = {Scr = FlipTrick Params = {Name = 'Varial Kickflip' Score = 300 Anim = VarialKickflip boardrotate Nollie = NollieVarialKickflip ExtraTricks = Extra_VarialKickflip}}
	Extra_VarialKickflip = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '360 Flip' Score = 550 Speed = 0.89999998 Anim = _360Flip Nollie = Nollie360Flip IsExtra UseCurrent}}]
	Trick_VarialHeelflip = {Scr = FlipTrick Params = {Name = 'Varial Heelflip' Score = 300 Anim = VarialHeelflip boardrotate Nollie = NollieVarialHeelflip ExtraTricks = Extra_VarialHeelflip}}
	Extra_VarialHeelflip = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '360 Heelflip' Score = 500 Anim = laserflip Speed = 1.29999995 trickslack = 20 IsExtra UseCurrent}}]
	Trick_Hardflip = {Scr = FlipTrick Params = {Name = 'Hardflip' Score = 300 Anim = Hardflip boardrotate Nollie = NollieHardflip ExtraTricks = Extra_360Hardflip}}
	Extra_360Hardflip = [{Trigger_Extra_Flip Params = {Name = '360 Hardflip' Score = 500 Anim = _360Hardflip IsExtra trickslack = 20 Speed = 1.10000002 UseCurrent}}]
	Trick_InwardHeelflip = {Scr = FlipTrick Params = {Name = 'Inward Heelflip' Score = 350 Anim = InwardHeelflip boardrotate Nollie = NollieInwardFlip trickslack = 15 ExtraTricks = Extra_360InwardHeelflip}}
	Extra_360InwardHeelflip = [{Trigger_Extra_Flip Params = {Name = '360 Inward Heelflip' Score = 500 Anim = _360InwardHeelFlip IsExtra trickslack = 15 Speed = 1.0 UseCurrent}}]
	Trick_Impossible = {Scr = FlipTrick Params = {Name = 'Impossible' Score = 100 Anim = Impossible Nollie = NollieImpossible ExtraTricks = DoubleImpossible}}
	DoubleImpossible = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = 'Double Impossible' Score = 500 Anim = DoubleImpossible ExtraTricks = TripleImpossible trickslack = 15 Speed = 1.20000005 IsExtra UseCurrent}}]
	TripleImpossible = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = 'Triple Impossible' Score = 1000 Anim = TripleImpossible IsExtra UseCurrent Speed = 1.20000005 trickslack = 15}}]
	Trick_PopShoveIt = {Scr = FlipTrick Params = {Name = 'Pop Shove-It' Score = 100 Anim = PopShoveItBS boardrotate Nollie = NollieBSShoveIt ExtraTricks = Extra360ShoveIt}}
	Extra360ShoveIt = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '360 Shove-It' Score = 500 Anim = _360ShoveIt Nollie = NollieBS360ShoveIt ExtraTricks = Extra540ShoveIt IsExtra UseCurrent}}]
	Extra540ShoveIt = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '540 Shove-It' Score = 1000 Anim = _540ShoveIt IsExtra boardrotate UseCurrent}}]
	Trick_FSShoveIt = {Scr = FlipTrick Params = {Name = 'FS Shove-It' Score = 100 Anim = PopShoveIt Nollie = NollieFSShoveIt boardrotate ExtraTricks = ExtraFS360ShoveIt}}
	ExtraFS360ShoveIt = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '360 FS Shove-It' Score = 500 Anim = FS360ShoveIt Nollie = Nollie360ShoveIt ExtraTricks = ExtraFS540ShoveIt IsExtra UseCurrent}}]
	ExtraFS540ShoveIt = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '540 FS Shove-It' Score = 1000 Anim = FS540ShoveIt IsExtra boardrotate UseCurrent}}]
	Trick_BackfootKickflip = {Scr = FlipTrick Params = {Name = 'Back Foot Kickflip' Score = 150 Speed = 0.94999999 Anim = NollieKickflip Nollie = Kickflip ExtraTricks = Extra_DBackfootKickflip}}
	Extra_DBackfootKickflip = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = 'Double Back Foot Flip' Score = 550 Speed = 0.89999998 trickslack = 15 Anim = DoubleNollieKickflip IsExtra UseCurrent}}]
	Trick_BackfootHeelflip = {Scr = FlipTrick Params = {Name = 'Back Foot Heelflip' Score = 150 Speed = 0.94999999 Anim = NollieHeelflip Nollie = Heelflip ExtraTricks = Extra_DBackfootHeelflip}}
	Extra_DBackfootHeelflip = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = 'Double Back Foot Heelflip' Score = 550 Speed = 0.89999998 trickslack = 15 Anim = DoubleNollieHeelflip IsExtra UseCurrent}}]
	Trick_Kickflip = {Scr = FlipTrick Params = {Name = 'Kickflip' Score = 100 Anim = Kickflip Nollie = NollieKickflip ExtraTricks = DoubleKickflip}}
	DoubleKickflip = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = 'Double Kickflip' Score = 500 Anim = DoubleKickflip Nollie = DoubleNollieKickflip ExtraTricks = TripleKickflip IsExtra trickslack = 15 UseCurrent}}]
	TripleKickflip = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = 'Triple Kickflip' Score = 1000 Anim = TripleKickflip IsExtra Speed = 1 UseCurrent}}]
	Trick_Heelflip = {Scr = FlipTrick Params = {Name = 'Heelflip' Score = 100 Anim = Heelflip Nollie = NollieHeelflip ExtraTricks = DoubleHeelflip}}
	DoubleHeelflip = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = 'Double Heelflip' Score = 500 Anim = DoubleHeelflip Nollie = DoubleNollieHeelflip ExtraTricks = TripleHeelflip trickslack = 15 IsExtra UseCurrent}}]
	TripleHeelflip = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = 'Triple Heelflip' Score = 1000 Anim = TripleHeelflip IsExtra UseCurrent}}]
	Trick_OllieAirwalk = {Scr = FlipTrick Params = {Name = 'Ollie Airwalk' Score = 500 Speed = 1.0 Anim = OllieAirwalk ExtraTricks = Extra_OllieAirwalk}}
	Extra_OllieAirwalk = [{Trigger_Extra_Flip Params = {Name = 'Ollie Airwalk Late Shove-it' Score = 1050 Anim = OllieAirWalkShoveIt boardrotate Speed = 1.0 IsExtra UseCurrent}}]
	Trick_OllieNorth = {Scr = FlipTrick Params = {Name = 'Ollie North' Score = 169 Anim = OllieNorth Speed = 1.0 trickslack = 15 ExtraTricks = Extra_OllieNorth HoldFrame = 15}}
	Extra_OllieNorth = [{Trigger_Extra_Flip Params = {Name = 'Ollie North Back Foot Flip' Score = 1050 Anim = OllieNorthBackFootFlip Speed = 1.0 IsExtra UseCurrent}}]
	Trick_FFImpossible = {Scr = FlipTrick Params = {Name = 'Front Foot Impossible' Score = 525 Anim = FrontFootImposs trickslack = 25 Speed = 1 ExtraTricks = Extra_FFImpossible}}
	Extra_FFImpossible = [{Trigger_Extra_Flip Params = {Name = 'Dbl. FF Impossible' Score = 1075 Anim = doublefrontfootimposs UseCurrent Speed = 0.89999998 trickslack = 25 IsExtra}}]
	
	
	Trick_HFVarialLien = {Scr = FlipTrick Params = {Name = 'Big Varial' Score = 800 Anim = BigVarial boardrotate trickslack = 15 ExtraTricks = Trick_BigVarial}}
	Trick_BigVarial = [{Trigger_Extra_Flip Params = {Name = 'Heelflip Varial Lien' Score = 800 Anim = HeelflipVarialLien boardrotate trickslack = 15 IsExtra UseCurrent}}]
	
	Trick_Fingerflip = {Scr = FlipTrick Params = {Name = 'Fingerflip' Score = 700 Anim = FingerFlipVert trickslack = 25 Speed = 1.10000002 ExtraTricks = Extra_DoubleFingerflip}}
	Extra_DoubleFingerflip = [{Trigger_Extra_Flip Params = {Name = 'Double Fingerflip' Score = 1000 Anim = DoubleFingerFlipVert Speed = 1.10000002 trickslack = 25 IsExtra UseCurrent}}]
	Trick_SalFlip = {Scr = FlipTrick Params = {Name = 'Sal Flip' Score = 900 Anim = SalFlip trickslack = 25 ExtraTricks = Extra_DoubleSalFlip Speed = 1.25}}
	Extra_DoubleSalFlip = [{Trigger_Extra_Flip Params = {Name = '360 Sal Flip' Score = 1150 Anim = DoubleSalFlip boardrotate trickslack = 25 Speed = 1.25 UseCurrent}}]
	Trick_180Varial = {Scr = FlipTrick Params = {Name = '180 Varial' Score = 700 Anim = _180Varial boardrotate Speed = 1.14999998 trickslack = 25 ExtraTricks = Trick_360Varial}}
	
	
	Trick_360Varial = [{Trigger_Extra_Flip Params = {Name = '360 Varial' Score = 900 Anim = _360Varial Speed = 0.89999998 trickslack = 25 boardrotate IsExtra UseCurrent ExtraTricks = Trick_540Varial}}]
	
	
	Trick_540Varial = [{Trigger_Extra_Flip Params = {Name = '540 Varial' Score = 1200 Anim = _540BoardVarial Speed = 1.20000005 trickslack = 25 boardrotate IsExtra UseCurrent}}]
	
	
	
	Trick_Japan = {Scr = GrabTrick Params = {Name = 'Japan' Score = 350 Anim = JapanAir Idle = JapanAir_Idle ExtraTricks = Trick_OneFootJapan}}
	Trick_OneFootJapan = [{Trigger_Extra_Grab Params = {Name = 'One Foot Japan' Score = 800 TweakTrick = GRABTWEAK_LARGE Anim = OneFootJapan Speed = 1.29999995 Idle = OneFootJapan_Idle WaitPercent = 70 IsExtra}}]
	Trick_Crail = {Scr = GrabTrick Params = {Name = 'Crail Grab' Score = 350 Anim = Crail Idle = Crail_Idle ExtraTricks = Extra_TuckKnee}}
	Extra_TuckKnee = [{Trigger_Extra_Grab Params = {Name = 'TuckKnee' Score = 400 Anim = TuckKnee IsExtra Idle = TuckKnee_Idle}}]
	Trick_SaranWrap = {Scr = GrabTrick Params = {Name = 'Wrap Around' Score = 450 TweakTrick = GRABTWEAK_LARGE Anim = SaranWrap Idle = SaranWrap_Idle OutAnim = SaranWrap_Out Speed = 1.5 ExtraTricks = Trick_BetweenTheLegs}}
	Trick_BetweenTheLegs = [{Trigger_Extra_Grab Params = {Name = 'Body Wrap' Score = 600 TweakTrick = GRABTWEAK_LARGE Anim = BetweenTheLegs_In Idle = BetweenTheLegs_Idle OutAnim = BetweenTheLegs_Out Speed = 1.20000005 IsExtra}}]
	Trick_Cannonball = {Scr = GrabTrick Params = {Name = 'Cannonball' Score = 250 TweakTrick = GRABTWEAK_SMALL Anim = Cannonball Idle = Cannonball_Idle Speed = 0.75 ExtraTricks = Extra_CannonballFingerflip}}
	Extra_CannonballFingerflip = [{Trigger_Extra_Grab Params = {Name = 'Fingerflip Cannonball' Score = 500 TweakTrick = GRABTWEAK_SMALL Anim = Cannonballfingerflip BackwardsAnim = Cannonball Idle = Cannonball_Idle Speed = 1.39999998 IsExtra}}]
	Trick_Stalefish = {Scr = GrabTrick Params = {Name = 'Stalefish' Score = 350 Anim = Stalefish Idle = Stalefish_Idle ExtraTricks = Trick_Stalefish_Layback}}
	Trick_Stalefish_Layback = [{Trigger_Extra_Grab Params = {Name = 'Stalefish Tweak' Score = 400 Anim = Stalefish_Layback Idle = Stalefish_Layback_Idle IsExtra}}]
	Trick_Benihana = {Scr = GrabTrick Params = {Name = 'Benihana' Score = 300 Anim = Benihana Idle = Benihana_Idle OutAnim = Benihana_Out ExtraTricks = BenihanaFingerflip ForceInit ExtraTricks = Trick_Sacktap}}
	Trick_Sacktap = [{Trigger_Extra_Grab Params = {Name = 'Sacktap' Score = 1500 Anim = Sacktap_Init Idle = Sacktap_Range OutAnim = Sacktap_out Speed = 1.5 ForceInit trickslack = 20 IsExtra}}]
	Trick_Crossbone = {Scr = GrabTrick Params = {Name = 'Crossbone' Score = 425 Anim = Crossbone Idle = Crossbone_Idle ExtraTricks = Trick_CrookedCop}}
	Trick_CrookedCop = [{Trigger_Extra_Grab Params = {Name = 'CrookedCop' Score = 550 Anim = CrookedCop Idle = CrookedCop_Idle IsExtra}}]
	Trick_Airwalk = {Scr = GrabTrick Params = {Name = 'Airwalk' Score = 450 Anim = Airwalk Idle = Airwalk_Idle2 ExtraTricks = Trick_ChristAir}}
	Trick_ChristAir = [{Trigger_Extra_Grab Params = {Name = 'Christ Air' Score = 550 Anim = ChristAir_Init Idle = ChristAir_Idle OutAnim = ChristAir_Out ForceInit IsExtra}}]
	Trick_IndyNosebone = {Scr = GrabTrick Params = {Name = 'Indy Nosebone' Score = 350 Anim = Nosebone Idle = Nosebone_Idle ExtraTricks = Trick_DelMarIndy}}
	Trick_DelMarIndy = [{Trigger_Extra_Grab Params = {Name = 'Del Mar Indy' Score = 400 Anim = IndyDelMar Idle = IndyDelMar_Idle IsExtra}}]
	Trick_Tailgrab = {Scr = GrabTrick Params = {Name = 'Tailgrab' Score = 300 Anim = Tailgrab Idle = Tailgrab_Idle ExtraTricks = Trick_OneFootTailgrab}}
	Trick_OneFootTailgrab = [{Trigger_Extra_Grab Params = {Name = 'One Foot Tailgrab' Score = 500 Anim = OneFootTailgrab Idle = OneFootTailgrab_Idle IsExtra}}]
	Trick_Madonna = {Scr = GrabTrick Params = {Name = 'Madonna' Score = 750 TweakTrick = GRABTWEAK_EXTRALARGE Anim = Madonna Idle = Madonna_Idle WaitPercent = 70 ExtraTricks = Trick_MadonnaNoHands}}
	Trick_FSShifty = {Scr = GrabTrick Params = {Name = 'FS Shifty' Score = 500 Anim = Shifty Idle = Shifty_Idle ExtraTricks = Extra_BSShifty}}
	Extra_BSShifty = [{Trigger_Extra_Grab Params = {Name = 'BS Shifty' Score = 800 Anim = BSShifty Idle = BSShifty_Idle IsExtra}}]
	Trick_Melon = {Scr = GrabTrick Params = {Name = 'Melon' Score = 300 Anim = MelonGrab Idle = MelonGrab_Idle ExtraTricks = Trick_Method}}
	Trick_Method = [{Trigger_Extra_Grab Params = {Name = 'Method' Score = 400 Anim = Method Idle = Method_Idle Speed = 1.20000005 IsExtra}}]
	Trick_Nosegrab = {Scr = GrabTrick Params = {Name = 'Nosegrab' Score = 300 Anim = Nosegrab Idle = Nosegrab_Idle ExtraTricks = Trick_Rocket}}
	Trick_Rocket = [{Trigger_Extra_Grab Params = {Name = 'Rocket Air' Score = 400 Anim = RocketAir Idle = RocketAir_Idle IsExtra}}]
	Trick_Mute = {Scr = GrabTrick Params = {Name = 'Mute' Score = 350 Anim = MuteGrab Idle = MuteGrab_Idle ExtraTricks = Trick_MuteNoHands}}
	
	
	Trick_MuteNoHands = [{Trigger_Extra_Grab Params = {Name = 'No Handed Mute' Score = 900 Anim = MuteGrabNoHands Idle = MuteGrabNoHands_Idle Speed = 1.0 IsExtra}}]
	Trick_MadonnaNoHands = [{Trigger_Extra_Grab Params = {Name = 'No Handed Madonna' Score = 900 Anim = MadonnaNoHands Idle = MadonnaNoHands_Idle Speed = 1.0 IsExtra}}]
	Trick_ShiftyCannonball = [{Trigger_Extra_Grab Params = {Name = 'Shifty Cannonball' Score = 900 Anim = ShiftyCannonball Idle = ShiftyCannonball_Idle Speed = 1.0 IsExtra}}]
	
	
	Trick_Judo = {Scr = GrabTrick Params = {Name = 'Judo' Score = 1150 TweakTrick = 50 Anim = JudoGrab Idle = JudoGrab_Idle Speed = 1.0 ExtraTricks = Trick_Seatbelt}}
	Trick_Seatbelt = [{Trigger_Extra_Grab Params = {Name = 'Seatbelt Air' Score = 500 Anim = Seatbelt Idle = SeatBelt_Idle Speed = 0.60000002 IsExtra}}]
	
	Trick_Roastbeef = {Scr = GrabTrick Params = {Name = 'Roastbeef' Score = 1150 TweakTrick = 50 Anim = RoastBeef Idle = RoastBeef_Idle Speed = 1.0 ExtraTricks = Trick_ShiftyCannonball}}
	
	Trick_Indy = {Scr = GrabTrick Params = {Name = 'Indy' Score = 300 Anim = Indy Idle = Indy_Idle ExtraTricks = Trick_Stiffy}}
	Trick_Stiffy = [{Trigger_Extra_Grab Params = {Name = 'Stiffy' Score = 500 Anim = Stiffy Idle = Stiffy_Idle Speed = 1.25 ForceInit IsExtra}}]
	FireballF = {Scr = FlipTrick Params = {Name = '\c4Fire!\c0' Score = 100 Anim = Heelflip Skew_Angle = 0.0 Fireball ExtraTricks = DoubleFireballF}}
	DoubleFireballF = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '\c4Double Fire!\c0' Score = 500 Anim = DoubleHeelflip Skew_Angle = -5.0 Fireball ExtraTricks = TripleFireballF IsExtra trickslack = 15 UseCurrent}}]
	TripleFireballF = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '\c4Triple Fire!\c0' Score = 1000 Anim = TripleHeelflip Skew_Angle = 5.0 Fireball ExtraTricks = QuadFireballF IsExtra UseCurrent}}]
	QuadFireballF = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '\c4Quad Fire!\c0' Score = 2000 Anim = QuadrupleHeelFlip Skew_Angle = 10.0 Fireball IsExtra Speed = 1 UseCurrent}}]
	FireballB = {Scr = FlipTrick Params = {Name = '\c4Reverse Fire!\c0' Score = 100 Anim = Heelflip Skew_Angle = 180.0 vel_scale = 0.5 Fireball ExtraTricks = DoubleFireballB}}
	DoubleFireballB = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '\c4Double Reverse Fire!\c0' Score = 500 Skew_Angle = 185.0 vel_scale = 0.5 Fireball Anim = DoubleHeelflip ExtraTricks = TripleFireballB IsExtra UseCurrent}}]
	TripleFireballB = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '\c4Triple Reverse Fire!\c0' Score = 1000 Skew_Angle = 175.0 vel_scale = 0.5 Fireball Anim = TripleHeelflip ExtraTricks = QuadFireballB IsExtra UseCurrent}}]
	QuadFireballB = [{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = '\c4Quad Reverse Fire!\c0' Score = 2000 Skew_Angle = 190.0 vel_scale = 0.5 Fireball Anim = QuadrupleHeelFlip IsExtra UseCurrent}}]
	Trick_Revert = {Scr = Revert}
	AirTricks =
	[
		{Trigger = {TripleInOrder, a = Left, b = Left, Square, 300} TrickSlot = Air_L_L_Square}
		{Trigger = {TripleInOrder, a = Right, b = Right, Square, 300} TrickSlot = Air_R_R_Square}
		{Trigger = {TripleInOrder, a = Up, b = Up, Square, 300} TrickSlot = Air_U_U_Square}
		{Trigger = {TripleInOrder, a = Down, b = Down, Square, 300} TrickSlot = Air_D_D_Square}
		{Trigger = {AirTrickLogic, Square, UpLeft, 500} TrickSlot = Air_SquareUL}
		{Trigger = {AirTrickLogic, Square, UpRight, 500} TrickSlot = Air_SquareUR}
		{Trigger = {AirTrickLogic, Square, DownLeft, 500} TrickSlot = Air_SquareDL}
		{Trigger = {AirTrickLogic, Square, DownRight, 500} TrickSlot = Air_SquareDR}
		{Trigger = {AirTrickLogic, Square, Up, 500} TrickSlot = Air_SquareU}
		{Trigger = {AirTrickLogic, Square, Down, 500} TrickSlot = Air_SquareD}
		{Trigger = {AirTrickLogic, Square, Left, 500} TrickSlot = Air_SquareL}
		{Trigger = {AirTrickLogic, Square, Right, 500} TrickSlot = Air_SquareR}
		{Trigger = {TripleInOrder, a = Left, b = Left, Circle, 300} TrickSlot = Air_L_L_Circle}
		{Trigger = {TripleInOrder, a = Right, b = Right, Circle, 300} TrickSlot = Air_R_R_Circle}
		{Trigger = {TripleInOrder, a = Up, b = Up, Circle, 300} TrickSlot = Air_U_U_Circle}
		{Trigger = {TripleInOrder, a = Down, b = Down, Circle, 300} TrickSlot = Air_D_D_Circle}
		{Trigger = {AirTrickLogic, Circle, UpLeft, 500} TrickSlot = Air_CircleUL}
		{Trigger = {AirTrickLogic, Circle, UpRight, 500} TrickSlot = Air_CircleUR}
		{Trigger = {AirTrickLogic, Circle, DownLeft, 500} TrickSlot = Air_CircleDL}
		{Trigger = {AirTrickLogic, Circle, DownRight, 500} TrickSlot = Air_CircleDR}
		{Trigger = {AirTrickLogic, Circle, Up, 500} TrickSlot = Air_CircleU}
		{Trigger = {AirTrickLogic, Circle, Down, 500} TrickSlot = Air_CircleD}
		{Trigger = {AirTrickLogic, Circle, Right, 500} TrickSlot = Air_CircleR}
		{Trigger = {AirTrickLogic, Circle, Left, 500} TrickSlot = Air_CircleL}
		
		{Trigger = {TripleInOrder, a = Down, b = Down, Triangle, 300} Scr = ToTail}
	]
	
	
	Trigger_Extra_Grab_Tweak = {Trigger = {ExtraGrabTrickLogic, Circle, 300} Scr = GrabTrick}
	Trigger_Extra_Grab = {Trigger = {Press, Circle, 300} Scr = GrabTrick}
	Trigger_Extra_Flip = {Trigger = {Press, Square, 300} Scr = FlipTrick}
	KickflipExtras =
	[{Trigger = {Press, Square, 300} Scr = FlipTrick Params = {Name = 'Double Kickflip' Score = 500 Anim = DoubleKickflip ExtraTricks = TripleKickflip Speed = 1 IsExtra UseCurrent}}
		{Trigger = {Press, Circle, 300} Scr = FlipGrabBlend Params = {Name = 'Kickflip to Indy' Score = 400 Anim1 = KickFlipBlendFS Anim2 = Indy IsExtra}}
		{Trigger = {AirTrickLogic, Circle, Up, 300} Scr = FlipGrabBlend Params = {Name = 'Kickflip to Crail' Score = 400 Anim1 = KickFlipBlendFS Anim2 = Crail IsExtra GrabStart = 5 Speed = 1}}
	]
	BenihanaFingerflip =
	[{Trigger = {AirTrickLogic, Square, Up, 500} Scr = FlipTrick Params = {Name = 'Beni Fingerflip' Score = 1000 Anim = BenihanaFingerflip IsExtra}}]
	COOL_SPECIAL_TRICKS = 0
	script FlipTrick Speed = 1.0 trickslack = 10 grindslack = 25 flip_stat_mod = 1.0
		if GotParam Fireball
			if GameModeEquals is_firefight
				if HasPowerup Fireball
					LaunchFireball Skew_Angle = <Skew_Angle> vel_scale = <vel_scale>
				endif
			endif
		endif
		
		LaunchStateChangeEvent State = Skater_InAir
		
		UndergroundPlus_IfPressedExitBoard
		if (<ksk_is_held> = 1)
			Goto kskOffBoard_FromAir
		endif
		
		LaunchSubStateEntryEvent SubState = Flip
		OnExitRun ExitFlipTrick
		
		if GotParam FullScreenEffect
			<FullScreenEffect>
			OnExitRun ExitFliptrick_FullScreenEffect
		endif
		GetScriptedStat Skater_Flip_Speed_Stat
		Speed = (<Speed> * <stat_value>)
		if GotParam maxspeed
			if (<Speed> > <maxspeed>)
				<Speed> = <maxspeed>
			endif
		else
			if (<Speed> > 1.29999995)
				Speed = 1.29999995
			endif
		endif
		ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
		if GotParam FromGroundGone
			SetEventHandler Ex = Ollied Scr = TrickOllie
		else
			ClearException Ollied
		endif
		KillExtraTricks
		BailOn
		
		if InPressure
			PressureOff
			SetSkaterAirTricks
		endif
		if GotParam NoSpin
			NoSpin
		endif
		if GotParam RevertFS
			Obj_SetFlag FLAG_SKATER_REVERTFS
		endif
		if GotParam RevertBS
			Obj_SetFlag FLAG_SKATER_REVERTBS
		endif
		if InNollie
			if GotParam Nollie
				if GotParam IsExtra
					PlayAnim Anim = <Nollie> From = Current BlendPeriod = 0.2 Speed = <Speed>
				else
					PlayAnim Anim = <Nollie> BlendPeriod = 0.2 Speed = <Speed>
				endif
			else
				if GotParam IsExtra
					PlayAnim Anim = <Anim> From = Current BlendPeriod = 0.2 Speed = <Speed>
				else
					PlayAnim Anim = <Anim> BlendPeriod = 0.2 Speed = <Speed>
				endif
			endif
		else
			if GotParam UseCurrent
				printf "USING THE CURRENT FRAME"
				PlayAnim Anim = <Anim> From = Current BlendPeriod = 0.2 Speed = <Speed>
			else
				PlayAnim Anim = <Anim> BlendPeriod = 0.2 Speed = <Speed>
			endif
		endif
		if NOT GotParam HoldFrame
			if GotParam boardrotate
				BlendperiodOut 0
				BoardRotateAfter
			endif
			if GotParam RotateAfter
				BlendperiodOut 0
				RotateAfter
			endif
			if GotParam FlipAfter
				BlendperiodOut 0
				FlipAfter
			endif
		endif
		if GotParam ExtraTricks
			SetExtraTricks special = FlipRoll tricks = <ExtraTricks> FlipRoll Duration = 15
		else
			SetExtraTricks tricks = FlipRoll Duration = 55
		endif
		
		if GotParam FromGroundGone
			WaitFramesLateOllie Frames = 15
			ClearException Ollied
			if NOT (<Frames> = 0)
				Wait <Frames> Frames
			endif
		else
			Wait 15 Frames
		endif
		
		
		base_score = 500
		extra_bonus = 250
		special_bonus = 500
		
		if GotParam IsExtra
			temp_score = (<base_score> + <extra_bonus>)
		else
			if GotParam IsSpecial
				temp_score = (<base_score> + <special_bonus>)
			else
				temp_score = <base_score>
			endif
		endif
		
		final_score = (<temp_score> * <Speed>)
		
		CastToInteger final_score
		
		NollieOff
		SetTrickName <Name>
		SetTrickScore <final_score>
		
		Display
		
		if GotParam IsExtra
			LaunchExtraMessage
		endif
		if GotParam IsSpecial
			LaunchSpecialMessage Cool
		endif
		if GotParam BloodFrame
			Wait <BloodFrame> Frames
			if GotParam GutsSound
				Playsound Random(@hitblood01 @hitblood02 @hitblood03)
			else
				Obj_PlaySound Random(@BailSlap01 @BailSlap02 @BailSlap03)
			endif
			Bloodsplat
			Obj_SpawnScript BloodJackAss
			Wait 1 frame
			Playsound BailSlap02
		endif
		if GotParam Spinslack
			WaitAnim <Spinslack> Frames fromend
			CanSpin
		endif
		if GotParam HoldFrame
			HoldAbleFlipTrick <...>
		endif
		if GotParam grindslack
			WaitAnim <grindslack> Frames fromend
		endif
		Bailoff
		WaitAnim <trickslack> Frames fromend
		if GotParam IsSpecial
			EndSpecial
		endif
		CanSpin
		DoNextTrick
		WaitAnimWhilstChecking
		KillExtraTricks
		if IsBoardMissing
			Goto kskOffBoard_Air
		endif
		Goto AirBorne
	endscript
	script HoldAbleFlipTrick
		WaitAnim <HoldFrame> Frames fromend
		while
			if Released Circle
				if Released Square
					break
				endif
			endif
			PlayAnim Anim = <Anim> From = Current To = Current BlendPeriod = 0.0
			WaitOneGameFrame
			TweakTrick GRABTWEAK_MEDIUM
		repeat
		PlayAnim Anim = <Anim> From = Current
		if GotParam boardrotate
			BlendperiodOut 0
			BoardRotateAfter
		endif
		if GotParam RotateAfter
			BlendperiodOut 0
			RotateAfter
		endif
		if GotParam FlipAfter
			BlendperiodOut 0
			FlipAfter
		endif
	endscript
	script Shifty_Check
		Wait 10 Frames
		if Held Triangle
			Rotate y = -75 Duration = 0.2 seconds
			Wait 0.2 seconds
			while
				Wait 1 frame
				TweakTrick 10
				if Released Square
					break
				endif
			repeat
			Rotate y = 75 Duration = 0.2 seconds
			DoNextTrick
		endif
	endscript
	script ExitFlipTrick
		LaunchSubStateExitEvent SubState = Flip
		CleanUp_SpecialTrickParticles
	endscript
	script ExitFliptrick_FullScreenEffect
		Exit_FullscreenEffect
		ExitFlipTrick
	endscript
	script GrabTrick Speed = 1.0 x = -180 Duration = 1.0 GrabTweak = GRABTWEAK_MEDIUM WaitPercent = 60 button = Circle
		ClearTricksFrom Jumptricks Jumptricks0 Jumptricks
		KillExtraTricks
		ClearExtraGrindTrick
		if GotParam FromGroundGone
			SetEventHandler Ex = Ollied Scr = TrickOllie
		else
			ClearException Ollied
		endif
		BailOn
		LaunchStateChangeEvent State = Skater_InAir
		LaunchSubStateEntryEvent SubState = Grab
		OnExitRun ExitGrabTrick
		
		if GotParam FullScreenEffect
			<FullScreenEffect>
			OnExitRun ExitGrab_FullScreenEffect
		endif
		if GotParam SpecialSounds
			Obj_SpawnScript <SpecialSounds>
		endif
		if GotParam ExtraTricks
			SetExtraTricks special = FlipRoll tricks = <ExtraTricks> Duration = 15
		else
			SetExtraTricks tricks = FlipRoll Duration = 55
		endif
		if GotParam SpecialItem_details
			TurnOnSpecialItem SpecialItem_details = <SpecialItem_details>
		endif
		if GotParam IsExtra
			PlayAnim Anim = <Anim> BlendPeriod = 0.30000001 From = Current To = end Speed = <Speed>
		else
			PlayAnim Anim = <Anim> BlendPeriod = 0.30000001 Speed = <Speed>
		endif
		if GotParam JumpJets
			Obj_KillSpawnedScript Name = JumpJets
			Obj_SpawnScript JumpJets
		endif
		if GotParam Stream
			Obj_PlayStream <Stream>
		endif
		if GotParam BloodFrame
			Wait <BloodFrame> Frames
			if GotParam GutsSound
				Playsound Random(@hitblood01 @hitblood02 @hitblood03)
			else
				Obj_PlaySound Random(@BailSlap01 @BailSlap02 @BailSlap03)
			endif
			Bloodsplat
			Obj_SpawnScript BloodJackAss
			Wait 1 frame
			Playsound BailSlap02
		endif
		if GotParam FromGroundGone
			WaitFramesLateOllie Frames = 15
			ClearException Ollied
		endif
		
		WaitAnim 50 percent
		SetTrickName <Name>
		SetTrickScore <Score>
		Display
		
		if GotParam IsSpecial
			LaunchSpecialMessage Cool
		endif
		if GotParam IsExtra
			LaunchExtraMessage
		endif
		if GotParam ForceInit
			WaitAnimFinished
		else
			WaitAnim <WaitPercent> percent
		endif
		if NOT Held Circle
			if Held Square
				button = Square
			endif
		endif
		
		SetExtraTricks tricks = FlipRoll Duration = 1024
		
		while
			if Released <button>
				break
			endif
			if AnimFinished
				PlayAnim Anim = <Idle> Cycle Speed = <Speed>
				break
			endif
			WaitOneGameFrame
		repeat
		while
			if Released <button>
				IfReleased_SquareOrCircle <...>
				break
			endif
			WaitOneGameFrame
			if GotParam IsSpecial
				TweakTrick GRABTWEAK_SPECIAL
			else
				TweakTrick <GrabTweak>
			endif
		repeat
		if GotParam boardrotate
			BlendperiodOut 0
			BoardRotateAfter
		endif
		if GotParam trickslack
			WaitAnim <trickslack> Frames fromend
		endif
		Bailoff
		if GotParam IsSpecial
			EndSpecial
		endif
		if GotParam FlipAfter
			FlipAfter
			BlendperiodOut 0
		endif
		if GotParam RotateAfter
			BlendperiodOut 0
			RotateAfter
		endif
		WaitAnimWhilstChecking
		if IsBoardMissing
			Goto kskOffBoard_Air
		endif
		Goto AirBorne
	endscript
	script ExitGrabTrick
		LaunchSubStateExitEvent SubState = Grab
		CleanUp_SpecialTrickParticles
	endscript
	script ExitGrab_FullScreenEffect
		Exit_FullscreenEffect
		ExitGrabTrick
	endscript
	script IfReleased_SquareOrCircle
		if GotParam OutAnim
			Obj_PlayAnim Anim = <OutAnim> BlendPeriod = 0.2 Speed = <Speed>
		else
			if GotParam BackwardsAnim
				Obj_PlayAnim Anim = <BackwardsAnim> Backwards BlendPeriod = 0.2 Speed = <Speed>
			else
				if AnimEquals Airwalk
					Obj_PlayAnim Anim = <Anim> From = Current To = 0 BlendPeriod = 0.2 Speed = <Speed>
				else
					Obj_PlayAnim Anim = <Anim> Backwards BlendPeriod = 0.2 Speed = <Speed>
				endif
			endif
		endif
	endscript
	script JumpJets
		ReplayRecordSimpleScriptCall scriptname = _ReplayJumpJets skaterscript
		Obj_GetID
		MangleChecksums a = skatersplash b = <objId>
		if NOT Obj_FlagSet FLAG_SKATER_JUMPJETSON
			if NOT InNetGame
				if NOT GameModeEquals Is_SingleSession
					while
						Skater::Jump
						Wait 1 game frame
					repeat 2
					Obj_SpawnScript JumpJetTracker Params = {<...>}
				endif
			endif
		endif
		EmptyParticleSystem Name = <mangled_id>
		SetScript Name = <mangled_id> emitscript = emit_jumpjets
		ParticlesOn Name = <mangled_id>
		Wait 0.5 second
		ParticlesOff Name = <mangled_id>
		Wait 0.5 seconds
		SetScript Name = <mangled_id> emitscript = emit_skatersplash
	endscript
	script JumpJetTracker
		Obj_SetFlag FLAG_SKATER_JUMPJETSON
		Wait 2 seconds
		Obj_ClearFlag FLAG_SKATER_JUMPJETSON
	endscript
	script _ReplayJumpJets
		SpawnSkaterScript ReplayJumpJets
	endscript
	script ReplayJumpJets
		Obj_GetID
		MangleChecksums a = skatersplash b = <objId>
		EmptyParticleSystem Name = <mangled_id>
		SetScript Name = <mangled_id> emitscript = emit_jumpjets
		ParticlesOn Name = <mangled_id>
		Wait 0.5 second
		ParticlesOff Name = <mangled_id>
		Wait 0.5 seconds
		SetScript Name = <mangled_id> emitscript = emit_skatersplash
	endscript
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
