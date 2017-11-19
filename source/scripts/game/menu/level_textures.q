	script display_current_level_texture_values
		if ScreenElementExists id = texture_list
			DestroyScreenElement id = texture_list
		endif
		initials = ["cp" "dt" "hj" "as" "jow" "tw" "cw" "mls" "apm" "dm" "nsn" "cs" "ts" "tb" "tz" "jg"]
		if levelIs load_NJ
			if GotParam NJ
				level = <NJ>
			else
				return
			endif
		endif
		if levelIs load_NY
			if GotParam NY
				level = <NY>
			else
				return
			endif
		endif
		if levelIs load_FL
			if GotParam FL
				level = <FL>
			else
				return
			endif
		endif
		if levelIs load_SD
			if GotParam SD
				level = <SD>
			else
				return
			endif
		endif
		if levelIs load_HI
			if GotParam HI
				level = <HI>
			else
				return
			endif
		endif
		if levelIs load_VC
			if GotParam VC
				level = <VC>
			else
				return
			endif
		endif
		if levelIs load_RU
			if GotParam RU
				level = <RU>
			else
				return
			endif
		endif
		if levelIs load_AU
			if GotParam AU
				level = <AU>
			else
				return
			endif
		endif
		if levelIs load_default
			if GotParam Def_Lev
				level = <Def_Lev>
			else
				return
			endif
		endif
		if NOT GotParam level
			return
		endif
		SetScreenElementLock id = root_window off
		GetArraySize <initials>
		index = 0
		shift = 0
		while
			FormatText checksumname = checksum "%i" i = (<initials>[<index>])
			if (<level>.<checksum> > 0)
				FormatText textname = text "%i = %t KB" i = (<initials>[<index>]) t = ((<level>.<checksum>) / 1024)
				CreateScreenElement {
					type = TextElement
					parent = tex_count_anchor
					pos = (((0.0,15.0) * <shift>) + (0.0,30.0))
					text = <text>
					font = dialog
					rgba = [60 60 100 100]
					just = [left center]
					scale = 0.80000001
				}
				shift = (<shift> + 1)
			endif
			index = (<index> + 1)
		repeat <array_size>
	endscript
