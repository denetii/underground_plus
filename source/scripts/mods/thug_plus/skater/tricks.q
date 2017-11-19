
	script SetSkaterGroundTricks
		if inNetGame
			if NOT GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_WALKING
				if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING
					if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
						SetQueueTricks Jumptricks GroundTricks SkateToWalkTricks
					else
						SetQueueTricks Jumptricks GroundTricks_XBOX SkateToWalkTricks_XBOX
					endif
				else
					if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
						SetQueueTricks Jumptricks GroundTricks
					else
						SetQueueTricks Jumptricks GroundTricks_XBOX
					endif
				endif
			else
				if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
					SetQueueTricks Jumptricks GroundTricks
				else
					SetQueueTricks Jumptricks GroundTricks_XBOX
				endif
			endif
		else
			if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_WALKING
				if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
					SetQueueTricks Jumptricks GroundTricks SkateToWalkTricks
				else
					SetQueueTricks Jumptricks GroundTricks_XBOX SkateToWalkTricks_XBOX
				endif
			else
				if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
					SetQueueTricks Jumptricks GroundTricks
				else
					SetQueueTricks Jumptricks GroundTricks_XBOX
				endif
			endif
		endif
		SetExtraGrindTricks special = SpecialGrindTricks GrindTricks
		if NOT GetGlobalFlag flag = FLAG_EXPERT_MODE_NO_MANUALS
			if NOT ((inNetGame) && (GetGlobalFlag flag = FLAG_G_EXPERT_MODE_NO_MANUALS))
				SetManualTricks special = SpecialManualTricks GroundManualTricks
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
						if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
							SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks
						else
							SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks
							
						endif
					else
						if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
							SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks WallplantOllie
						else
							SetQueueTricks special = SpecialTricks PressureTricks2 AirTricks SkateToWalkTricks_XBOX WallplantOllie
						endif
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
						if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
							SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks
						else
							SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks_XBOX
						endif
					else
						if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
							SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks WallplantOllie
						else
							SetQueueTricks special = SpecialTricks AirTricks SkateToWalkTricks_XBOX WallplantOllie
						endif
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
				if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
					SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0 SkateToWalkTricks
				else
					SetQueueTricks special = SpecialTricks AirTricks Jumptricks JumpTricks0 SkateToWalkTricks_XBOX
				endif
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
	
	
	
	
	
