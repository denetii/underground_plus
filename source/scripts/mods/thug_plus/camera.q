
	camera_fov = 72.0
	widescreen_camera_fov = 88.18000031
	compact_camera_fov = 80.0
	current_screen_mode = standard_screen_mode
	script screen_setup_standard
		SetScreen Aspect = 1.33333325 Angle = camera_fov letterbox = 0
		UnSetGlobalFlag flag = SCREEN_MODE_WIDE
		SetGlobalFlag flag = SCREEN_MODE_STANDARD
		change current_screen_mode = standard_screen_mode
		printf "change to standard"
		if GotParam mm_bg
			if LevelIs load_skateshop
				make_mainmenu_3d_plane
			endif
		endif
	endscript
	script screen_setup_widescreen
		SetScreen Aspect = 1.77777767 Angle = widescreen_camera_fov letterbox = 0
		UnSetGlobalFlag flag = SCREEN_MODE_STANDARD
		SetGlobalFlag flag = SCREEN_MODE_WIDE
		change current_screen_mode = widescreen_screen_mode
		printf "change to widescreen"
		if GotParam mm_bg
			if LevelIs load_skateshop
				make_mainmenu_3d_plane
			endif
		endif
	endscript
	script screen_setup_widescreen2
		SetScreen Aspect = 2.33333325 Angle = 104.0 letterbox = 0
		UnSetGlobalFlag flag = SCREEN_MODE_STANDARD
		SetGlobalFlag flag = SCREEN_MODE_WIDE
		change current_screen_mode = widescreen_screen_mode
		printf "change to widescreen2"
		if GotParam mm_bg
			if LevelIs load_skateshop
				make_mainmenu_3d_plane
			endif
		endif
	endscript
	script screen_setup_letterbox
		SetScreen Aspect = 1.77777767 Angle = widescreen_camera_fov letterbox = 1
		SetGlobalFlag flag = SCREEN_MODE_STANDARD
		SetGlobalFlag flag = SCREEN_MODE_WIDE
		change current_screen_mode = letterbox_screen_mode
		printf "change to letterbox"
		if GotParam mm_bg
			if LevelIs load_skateshop
				make_mainmenu_3d_plane
			endif
		endif
	endscript
	
