
	script ShoppingCart_Start startspeed = 600 turn_friction = 4 accelerate_to = 800 acceleration = 10.0
		SetTags startspeed = <startspeed> turn_friction = <turn_friction> accelerate_to = <accelerate_to> bailspeed = <bailspeed> acceleration = <acceleration> racemode = <racemode>
		ClearExceptions
		SetException Ex = GroundGone Scr = Cart_Airborne
		SetException Ex = FlailHitWall Scr = Cart_Flail
		SetException Ex = FlailLeft Scr = Cart_Flail
		SetException Ex = FlailRight Scr = Cart_Flail
		if flipped
			Flip
		endif
		switch <racemode>
			case shoppingcart
				CanBrakeOff
				ForceAutokickOff
				printf "LOCKING CART"
				kill name = ago_ShoppingCart
				create name = ago_ShoppingCart
				ago_ShoppingCart::Obj_LockToObject ObjectName = skater (2.0,4.0,0.0)
			default
				ClearSkaterCamOverride
				CanBrakeOn
				ForceAutoKickOn
				Obj_SetFlag FLAG_SKATER_CARMODE
		endswitch
		NoRailTricks
		VibrateOff
		SwitchOnBoard
		Obj_KillSpawnedScript name = BailBoardControl
		ClearEventBuffer
		EnablePlayerInput
		BailOff
		BashOff
		SetRollingFriction 0
		SetSpeed <startspeed>
		Blendperiodout 0
		PlayShoppingCartStartAnim
		Goto ShoppingCart_OnGround
	endscript
	script PlayShoppingCartStartAnim
		GetTags
		switch <racemode>
			case shoppingcart
				SetSkaterCamOverride heading = 2 tilt = -0.2 time = 0.000001
				PlayAnim Anim = Trolley_PushFromStand BlendPeriod = 0
				WaitAnimFinished
				ClearSkaterCamOverride
				PlayAnim Anim = Trolley_Push BlendPeriod = 0
				WaitAnimFinished
				PlayAnim Anim = Trolley_JumpIn BlendPeriod = 0
				WaitAnimFinished
			case luge
				PlayAnim Anim = Luge_Push
				WaitAnimFinished
			case slalom
				PlayAnim Anim = Slalom_Push
				WaitAnimFinished
		endswitch
	endscript
	script ShoppingCart_OnGround
		SetException Ex = Ollied Scr = Cart_Ollie
		overridelimits max = 10000 friction = 0 time = 1000
		SetSkaterCamLerpReductionTimer time = 0
		ResetLandedFromVert
		GetTags
		switch <racemode>
			case shoppingcart
				PlayAnim Anim = Trolley_Idle NoRestart Cycle
				ShoppingCart_OnGround_Loop
			case luge
				PlayAnim Anim = luge_Idle NoRestart Cycle
				CarMode_OnGround_Loop
			case slalom
				PlayAnim Anim = slalom_Idle NoRestart Cycle
				CarMode_OnGround_Loop
		endswitch
	endscript
	script ShoppingCart_OnGround_Loop
		Obj_StopSound ShoppingCartLoop
		Obj_Playsound ShoppingCartLoop
		while
			if held left
				PlayAnim Anim = Trolley_IdleToLeanLeft NoRestart
			else
				if held right
					PlayAnim Anim = Trolley_IdleToLeanRight NoRestart
				else
					if AnimFinished
						PlayAnim Anim = Random(@Trolley_Idle @Trolley_Idle @Trolley_Idle @Trolley_Idle @Trolley_Idle @Trolley_Idle @Trolley_Idle @Trolley_LookLeft @Trolley_LookRight)
					endif
				endif
			endif
			wait 1 game frame
		repeat
	endscript
	script CarMode_OnGround_Loop
		GetTags
		while
			if held left
				SetRollingFriction <turn_friction>
				switch <racemode>
					case luge
						PlayAnim Anim = Luge_IdleToLeanLeft NoRestart
					case slalom
						PlayAnim Anim = Slalom_IdleToLeanLeft NoRestart
				endswitch
			else
				if held right
					SetRollingFriction <turn_friction>
					switch <racemode>
						case luge
							PlayAnim Anim = Luge_IdleToLeanRight NoRestart
						case slalom
							PlayAnim Anim = Slalom_IdleToLeanRight NoRestart
					endswitch
				else
					if held Down
						switch <racemode>
							case luge
								PlayAnim Anim = Luge_Brake NoRestart
						endswitch
					else
						switch <racemode>
							case luge
								PlayAnim Anim = luge_Idle Cycle NoRestart
							case slalom
								PlayAnim Anim = slalom_Idle Cycle NoRestart
						endswitch
						SetRollingFriction 0
						GetSpeed
						if (<speed> < <accelerate_to>)
							speed = (<speed> + <acceleration>)
						endif
						SetSpeed <speed>
					endif
				endif
			endif
			wait 1 game frame
		repeat
	endscript
	script Cart_Bail
		ClearExceptions
		GetTags
		if NOT LandedFromVert
			switch <racemode>
				case shoppingcart
				case luge
					Jump BonelessHeight
			endswitch
		endif
		CanBrakeOn
		overridelimits max = 10000 friction = 0 time = 0
		RestoreAutoKick
		ClearSkaterCamOverride
		if GotParam BigAir
			Rolling
		endif
		switch <racemode>
			case shoppingcart
				PlaySound ShoppingCartBail
				kill name = ago_ShoppingCart
				Trolley_BailB
			case slalom
				NoseManualBail
			default
				ManualBail
		endswitch
	endscript
	script Cart_Flail speed = 0 bailspeed = 0
		GetTags
		GetSpeed
		if (<speed> > <bailspeed>)
			Goto Cart_Bail
		else
			switch <racemode>
				case luge
					PlayAnim Anim = Luge_Flail
				case slalom
					PlayAnim Anim = Slalom_Flail
			endswitch
			WaitAnimFinished
			Goto ShoppingCart_OnGround
		endif
	endscript
	script Cart_Ollie
		ClearException Ollied
		GetTags
		switch <racemode>
			case shoppingcart
				PlayAnim Anim = Trolley_Ollie
				Jump BonelessHeight
				PlaySound ShoppingCartOllie
			case luge
				PlayAnim Anim = Luge_Ollie
				Jump BonelessHeight
			case slalom
				PlayAnim Anim = Slalom_Ollie
				Jump
		endswitch
		Goto Cart_Airborne
	endscript
	script Cart_Airborne
		SetException Ex = Landed Scr = Cart_Land
		SetState Air
		GetTags
		switch <racemode>
			case shoppingcart
				Obj_StopSound ShoppingCartLoop
				if AnimEquals Trolley_Ollie
					WaitAnimFinished
				endif
				PlayAnim Anim = Trolley_AirIdle
				SetTrickName 'Cart Air'
			case luge
				if AnimEquals Luge_Ollie
					WaitAnimFinished
				endif
				PlayAnim Anim = Luge_AirIdle
				SetTrickName 'Luge Hop'
			case slalom
				if AnimEquals Slalom_Ollie
					WaitAnimFinished
				endif
				PlayAnim Anim = Slalom_AirIdle
				SetTrickName 'Old School Ollie'
		endswitch
		while
			if AirTimeGreaterThan 0.5 seconds
				ClearException Ollied
				break
			endif
			wait 1 game frame
		repeat
		SettrickScore 100
		Display
		if (<racemode> = slalom)
			while
				if AirTimeGreaterThan 1.25 seconds
					PlayAnim Anim = FlailingFall BlendPeriod = 0.30000001 Cycle
					SetException Ex = Landed Scr = Cart_Bail params = {BigAir}
					break
				endif
				wait 1 game frame
			repeat
		endif
	endscript
	script Cart_Land
		GetTags
		SetState Ground
		if AbsolutePitchGreaterThan 60
			if PitchGreaterThan 60
				Goto Cart_Bail
			endif
		endif
		if YawBetween (30.0,150.0)
			Goto Cart_Bail
		endif
		if RollGreaterThan 50
			Goto Cart_Bail
		endif
		switch <racemode>
			case shoppingcart
			case luge
				if LandedFromVert
					Goto Cart_Bail
				endif
		endswitch
		if backwards
			switch <racemode>
				case shoppingcart
				case luge
					Goto Cart_Bail
				case slalom
					Rotate
					Flip
			endswitch
		endif
		ClearPanel_Landed
		switch <racemode>
			case shoppingcart
				SetException Ex = Ollied Scr = Cart_Ollie
				PlaySound ShoppingCartLand
				if AirTimeGreaterThan 1 seconds
					PlayAnim Anim = Trolley_Land
					WaitAnimFinished
				else
					if AirTimeGreaterThan 0.1 seconds
						PlayAnim Anim = Trolley_SmallLand
						WaitAnimFinished
					endif
				endif
			case luge
				PlayAnim Anim = Luge_land
			case slalom
				PlayAnim Anim = Slalom_land
		endswitch
		SetException Ex = Ollied Scr = Cart_Ollie
		WaitAnimFinished
		Goto ShoppingCart_OnGround
	endscript
	script LugeBrake friction = 15
		ClearExceptions
		DisablePlayerInput
		WaitOnGround
		SetRollingFriction <friction>
		PlayAnim Anim = Luge_Fullstop BlendPeriod = 0.30000001
		WaitAnimFinished
		SpeedCheckStop
		wait 30 frames
		SpeedCheckStop
	endscript
