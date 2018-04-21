
    script UGPlus_UpdateControlSettings
        UGPlus_GetControlOption Setting = ControlScheme
        Change UNDERGROUNDPLUS_CONTROLS = <value>
        UGPlus_GetControlOption Setting = OneButtonSpine
        UGPlus_SetOneButtonSpine enabled = <value>
        UGPlus_GetControlOption Setting = DitchBoardEnabled
        Change UNDERGROUNDPLUS_ENABLE_EXITBOARD = <value>
        UGPlus_GetControlOption Setting = FlipsEnabled
        Change UNDERGROUNDPLUS_ENABLE_FLIPS = <value>
        UGPlus_GetControlOption Setting = PoleSwingEnabled
        Change UNDERGROUNDPLUS_ENABLE_POLESWING = <value>
        UGPlus_GetControlOption Setting = StallsEnabled
        Change UNDERGROUNDPLUS_ENABLE_RAILSTALL = <value>
        printf "Control settings updated"
    endscript
    
	script UndergroundPlus_IfPressedRailSwing
        if ( UNDERGROUNDPLUS_ENABLE_POLESWING = 0 )
            return ksk_is_held = 0
        endif
		if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
			if Held Black
				return ksk_is_held = 1
			endif
			return ksk_is_held = 0
		endif
		if Held R1
			if Held L1
				return ksk_is_held = 1
			endif
		endif
		return ksk_is_held = 0
	endscript
	
	script UndergroundPlus_IfPressedExitBoard
        if ( UNDERGROUNDPLUS_ENABLE_EXITBOARD = 0 )
            return ksk_is_held = 0
        endif
		if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
			if Held White
				if Held Black
					return ksk_is_held = 1
				endif
			endif
			return ksk_is_held = 0
		endif
		return ksk_is_held = 0
	endscript
	
	script UndergroundPlus_IfPressedRailStall
        if ( UNDERGROUNDPLUS_ENABLE_RAILSTALL = 0 )
            return ksk_is_held = 0
        endif
		if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
			if Held White
				return ksk_is_held = 1
			endif
			return ksk_is_held = 0
		endif
		if Held R1
			if Held L1
				return ksk_is_held = 1
			endif
		endif
		return ksk_is_held = 0
	endscript
	
	
	
	script UndergroundPlus_IfPressedReturnBoard
		if (UNDERGROUNDPLUS_CONTROLS = CONTROL_SCHEME_PS2)
			if Held Black
				if Held White
					return ksk_is_held = 1
				else
					return ksk_is_held = 2
				endif
			else 
                if Held White
					return ksk_is_held = 3
				endif
			endif
			return ksk_is_held = 0
		endif
		if Held R1
			if Held L1
				return ksk_is_held = 1
			else
				return ksk_is_held = 2
			endif
		else 
            if Held L1
				return ksk_is_held = 3
			endif
		endif
		return ksk_is_held = 0
	endscript
	
