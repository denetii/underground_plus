
	skater_select_light0_heading = 60
	skater_select_light1_heading = -190
	script PlayThrowBoardSound
		if NOT GotParam NoSFX
			Wait 1.22000003 second
			PlaySound BoardThrowDown vol = 300
		endif
	endscript
	script TurnOnSSGuitar
		DestroyAllSpecialItems
		TurnOnSpecialItem specialitem_details = guitar_skateshop_details
	endscript
	script Play_HawkIdleSet
		PlayAnim Anim = Idle_HawkFromStandIdle
		WaitAnimFinished
		PlayAnim Anim = Idle_Hawk
		WaitAnimFinished
		PlayAnim Anim = Idle_HawkDropBoard
		WaitAnimFinished
		PlayAnim Anim = Idle_HawkGetBoard
		WaitAnimFinished
		PlayAnim Anim = Idle_Hawk
		WaitAnimFinished
		PlayAnim Anim = Idle_Hawk
		WaitAnimFinished
		PlayAnim Anim = Idle_HawkToStandIdle
		WaitAnimFinished
		PlayAnim Anim = StandIdleA
	endscript
	skater_rot_angle = 0
	script skateshop_rotate_skater_left
		if InSplitScreenGame
			GetCurrentSkaterProfileIndex
			<skater> = <currentSkaterProfileIndex>
		else
			<skater> = 0
		endif
		KillSpawnedScript name = skateshop_rotate_skater
		SpawnScript skateshop_rotate_skater params = {dif = -3 button = L1}
	endscript
	script skateshop_rotate_skater_right
		if InSplitScreenGame
			GetCurrentSkaterProfileIndex
			<skater> = <currentSkaterProfileIndex>
		else
			<skater> = 0
		endif
		KillSpawnedScript name = skateshop_rotate_skater
		SpawnScript skateshop_rotate_skater params = {dif = 3 button = R1}
	endscript
	script skateshop_rotate_skater
		while
			if ControllerPressed <button>
				skater::CancelRotateDisplay
				change skater_rot_angle = (skater_rot_angle + <dif>)
				skater::RotateDisplay {Y
					Duration = 0 seconds
					EndAngle = skater_rot_angle
					HoldOnLastAngle
				}
			else
				break
			endif
			Wait 1 frame
		repeat
	endscript
	script wait_and_pause_skater time = 10
		while
			if ObjectExists id = skater
				Wait <time> gameframes
				pauseskaters
				PauseMusic 1
				break
			endif
			Wait 1 gameframe
		repeat
		SetActiveCamera id = SkaterCam0
		skater::Obj_GetID
		MakeSkaterGoto ShadowSkaterFreestyleAI params = <...>
		targetOffset = (-65000.0,35.0,0.0)
		positionOffset = (180.0,0.0,180.0)
		KillSkaterCamAnim all
		PlaySkaterCamAnim {name = mainmenu_camera02
			skater = 0
			targetID = <objId>
			targetOffset = <targetOffset>
			positionOffset = <positionOffset>
			play_hold
			frames = 1
		}
	endscript
	script SkateshopAI stopskateshopstreams = 1
		if levelis load_cas
			no_board = no_board
		endif
		SkaterInit NoEndRun ReturnControl NoAnims no_board = <no_board>
		stream_repetition = 4
		TurnOffSpecialItem
		if ((levelis load_boardshop) || (levelis load_cas))
			UnpausePhysics
		else
			PausePhysics
		endif
		ClearExceptions
		SetQueueTricks NoTricks
		DisablePlayerInput
		SetRollingFriction 10000
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		switch <name>
			case creature
			case Iron_Man
			case Gene
			default
				skater::unhide
				TurnOffSpecialItem
		endswitch
		if GotParam BlendOK
			WaitAnimFinished
		else
			BlendperiodOut 0
		endif
		if GotParam CAS_Screen
			if (<is_male> = 1)
				<name> = editskater_male
				TurnOffSpecialItem
			else
				switch <name>
					case steamer
						printf "THIS IS ELISSA"
						<name> = editskater_male
					case jenna
						<name> = jenna
					default
						<name> = editskater_female
						printf "THIS IS A CHICK"
				endswitch
			endif
		else
		endif
		if GotParam Credits
			<name> = neversoft
		endif
		if (<name> = custom)
			if (<is_male> = 0)
				<name> = editskater_female
			endif
		endif
		printf "------------- THIS SKATER IS: %n" n = <name>
		stream_freq = 0
		stream_freq = RandomRange(0.0,7.0)
		if NOT (<stream_repetition> > 3)
			<stream_repetition> = (<stream_repetition> + 1)
		endif
		if NOT levelis load_skateshop
			Random(
				@PlayAnim Anim = Ped_M_Idle1
			)
			
		else
			if ObjectExists id = ss_play_level
				WaitAnimFinished
				Random(
					@PlayAnim Anim = Ped_M_Idle1
				)
				
			else
				KillSpawnedScript name = wait_start_kill_ironman_dust
				kill name = manhole_cover_smoke
				kill name = Gene_Simmons_pyro
				kill name = Gene_Simmons_pyro01
				kill name = Iron_Man_Dust_1
				switch <name>
					case creature
						if NOT ObjectExists id = manhole_cover_smoke
							create name = manhole_cover_smoke
						endif
						PlayAnim Anim = FrontEnd_Creature
					case Iron_Man
						KillSpawnedScript name = wait_start_kill_ironman_dust
						SpawnScript wait_start_kill_ironman_dust
						PlayAnim Anim = FrontEnd_IronMan
					case Gene
						if NOT ObjectExists id = Gene_Simmons_pyro
							create name = Gene_Simmons_pyro
							create name = Gene_Simmons_pyro01
						endif
						PlayAnim Anim = FrontEnd_Gene
					default
						Random(
							@PlayAnim Anim = Ped_M_Idle1
							@PlayAnim Anim = FrontEnd_1
							@PlayAnim Anim = FrontEnd_2
							@PlayAnim Anim = FrontEnd_3
							@PlayAnim Anim = FrontEnd_4
						)
				endswitch
			endif
		endif
		GetTags
		if (<stopskateshopstreams> = 0)
			if (<stream_freq> = 1)
				if (<stream_repetition> > 2)
					StopStream
					PlaySkaterStream Type = "SSIntro"
					stream_repetition = 0
				endif
			endif
		else
		endif
		WaitAnimFinished
		while
			Wait 1 frame
			PlayAnim Anim = Ped_M_Idle1
			WaitAnimFinished
		repeat
	endscript
	script wait_start_kill_ironman_dust
		Wait 1.45000005 seconds
		kill name = Iron_Man_Dust_1
		create name = Iron_Man_Dust_1
		Iron_Man_Dust_1::SetLifetime 2.0
		Iron_Man_Dust_1::SetEmitRate 100.0
		Wait 0.2 seconds
		kill name = Iron_Man_Dust_1
		Wait 1 frame
		create name = Iron_Man_Dust_1
		Iron_Man_Dust_1::SetEmitRate 90.0
		Wait 0.2 seconds
		kill name = Iron_Man_Dust_1
		Wait 1 frame
		create name = Iron_Man_Dust_1
		Iron_Man_Dust_1::SetEmitRate 80.0
		Wait 0.2 seconds
		kill name = Iron_Man_Dust_1
		Wait 1 frame
		create name = Iron_Man_Dust_1
		Iron_Man_Dust_1::SetEmitRate 60.0
		Iron_Man_Dust_1::SetLifetime 1.0
		Wait 0.2 seconds
		kill name = Iron_Man_Dust_1
		Wait 1 frame
		create name = Iron_Man_Dust_1
		Iron_Man_Dust_1::SetEmitRate 40.0
		Iron_Man_Dust_1::SetLifetime 1.0
		Wait 0.2 seconds
		kill name = Iron_Man_Dust_1
		Wait 1 frame
		create name = Iron_Man_Dust_1
		Iron_Man_Dust_1::SetEmitRate 20.0
		Iron_Man_Dust_1::SetLifetime 1.0
		Wait 0.2 seconds
		kill name = Iron_Man_Dust_1
		Wait 1 frame
		create name = Iron_Man_Dust_1
		Iron_Man_Dust_1::SetEmitRate 10.0
		Iron_Man_Dust_1::SetLifetime 1.0
		Wait 0.2 seconds
		kill name = Iron_Man_Dust_1
		Wait 1 frame
		create name = Iron_Man_Dust_1
		Iron_Man_Dust_1::SetEmitRate 5.0
		Iron_Man_Dust_1::SetLifetime 0.40000001
		Wait 0.2 seconds
		kill name = Iron_Man_Dust_1
		Wait 1 frame
		create name = Iron_Man_Dust_1
		Iron_Man_Dust_1::SetEmitRate 2.0
		Iron_Man_Dust_1::SetLifetime 0.2
		Wait 0.2 seconds
		kill name = Iron_Man_Dust_1
	endscript
	script skateshop_not_yet
		launch_main_menu
	endscript
	script start_internet_game
		memcard_menus_cleanup
		InitPrefsBeenox
		SetNetworkMode LAN_MODE
		KillSkaterCamAnim all
		PlaySkaterCamAnim name = SS_MenuCam play_hold
		MakeSkaterGoto SkateshopAI params = {NoSFX}
		SetMemThreadSafe off
		KillSpawnedScript name = Skateshop_Slideshow
		SpawnScript attract_mode_timer
		SpawnSecondControllerCheck
		Wait 5 gameframe
		kill_start_key_binding
		select_xbox_multiplayer {change_gamemode = change_gamemode_net}
	endscript
	script make_new_skateshop_menu
		SetScreenElementProps {id = root_window
			replace_handlers
			event_handlers = [
				{pad_start main_menu_start_pressed}
			]
		}
		make_new_menu <...>
	endscript
	script main_menu_start_pressed
	endscript
	script skateshop_transition menu_anim = animate_out
		RunScriptOnScreenElement id = current_menu_anchor <menu_anim> callback = skateshop_transition2 callback_params = <...>
	endscript
	script skateshop_transition2
		if GotParam cam_anim
			printf "got a cam_anim"
			PlaySkaterCamAnim skater = 0 name = <cam_anim>
		endif
		if GotParam came_from_main_menu
			<new_menu_script> came_from_main_menu
		else
			<new_menu_script>
		endif
	endscript
	script main_menu_add_item {parent = current_menu
			font = small
			highlight_bar_scale = (2.0,0.69999999)
			highlight_bar_pos = (97.0,-7.0)
			text_just = [center center]
			focus_script = main_menu_focus
			unfocus_script = main_menu_unfocus
			text_pos = (95.0,-5.0)
			dims = (200.0,20.0)
			pad_choose_script = nullscript
		}
		if GotParam not_focusable
			CreateScreenElement {
				Type = ContainerElement
				parent = <parent>
				id = <id>
				dims = <dims>
				event_handlers = [{focus <focus_script> params = <focus_params>}
					{unfocus <unfocus_script> params = <unfocus_params>}
					{pad_choose <pad_choose_script> params = <pad_choose_params>}
					{pad_start <pad_choose_script> params = <pad_choose_params>}
				]
				replace_handlers
				not_focusable
			}
		else
			CreateScreenElement {
				Type = ContainerElement
				parent = <parent>
				id = <id>
				dims = <dims>
				event_handlers = [{focus <focus_script> params = <focus_params>}
					{unfocus <unfocus_script> params = <unfocus_params>}
				]
				replace_handlers
			}
		endif
		<anchor_id> = <id>
		if NOT GotParam no_sound
			SetScreenElementProps id = <anchor_id> event_handlers = [{pad_choose generic_menu_pad_choose_sound}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{pad_start generic_menu_pad_choose_sound}
				{pad_start <pad_choose_script> params = <pad_choose_params>}
			]
		else
			SetScreenElementProps id = <anchor_id> event_handlers = [{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{pad_start <pad_choose_script> params = <pad_choose_params>}
			]
		endif
		if GotParam mark_first_input
			SetScreenElementProps {
				id = <anchor_id>
				event_handlers = [{pad_choose mark_first_input_received}
					{pad_choose generic_menu_pad_choose_sound}
					{pad_choose <pad_choose_script> params = <pad_choose_params>}
					{pad_start mark_first_input_received}
					{pad_start generic_menu_pad_choose_sound}
					{pad_start <pad_choose_script> params = <pad_choose_params>}
				]
				replace_handlers
			}
		endif
		if GotParam not_focusable
			text_rgba = [60 60 60 75]
			CreateScreenElement {
				Type = TextElement
				parent = <anchor_id>
				font = <font>
				text = <text>
				scale = <scale>
				pos = <text_pos>
				just = <text_just>
				rgba = <text_rgba>
				not_focusable
			}
		else
			FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
			CreateScreenElement {
				Type = TextElement
				parent = <anchor_id>
				id = <text_id>
				font = <font>
				text = <text>
				scale = <scale>
				pos = <text_pos>
				just = <text_just>
				rgba = <text_rgba>
			}
		endif
		if GotParam max_width
			truncate_string id = <id> max_width = <max_width>
		endif
		FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			Type = SpriteElement
			parent = <anchor_id>
			texture = de_highlight_bar
			pos = <highlight_bar_pos>
			scale = <highlight_bar_scale>
			just = [center center]
			rgba = <bar_rgba>
			alpha = 0
			z_priority = 3
		}
	endscript
	script make_main_menu_item {
			focus_script = main_menu_item_focus
			dims = (300.0,18.0)
		}
		make_theme_menu_item <...> no_highlight_bar
	endscript
	script main_menu_item_focus
		GetTags
		if GotParam attract_timer
			reset_attract_mode_timer
		endif
		theme_item_focus <...>
	endscript
	script main_menu_focus
		GetTags
		FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		DoScreenElementMorph id = {<id> child = 0} rgba = <text_rgba>
		RunScriptOnScreenElement id = <id> text_twitch_effect
		if ObjectExists id = park_menu_up_arrow
			generic_menu_update_arrows {
				up_arrow_id = park_menu_up_arrow
				down_arrow_id = park_menu_down_arrow
			}
		endif
		if GotParam attract_timer
			reset_attract_mode_timer
		endif
		DoScreenElementMorph {
			id = {<id> child = 1}
			alpha = 1
		}
	endscript
	script main_menu_unfocus
		GetTags
		FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		DoScreenElementMorph id = {<id> child = 0} rgba = <text_rgba>
		KillSpawnedScript name = text_twitch_effect
		DoScreenElementMorph {
			id = {<id> child = 1}
			alpha = 0
		}
	endscript
	launch_to_createatrick = 0
	script system_link_main_menu_exit
		if SystemLinkEnabled
			main_menu_exit <...>
		endif
	endscript
	script main_menu_exit
		if NOT GotParam hold_camera
			skater::reset_model_lights
			skater::PausePhysics
			skater::CancelRotateDisplay
			play_no_skater_cam
		endif
		KillSpawnedScript name = attract_mode_timer
		StopSecondControllerCheck
		if GotParam kill_clouds
			if ObjectExists id = cloud_anchor
				DestroyScreenElement id = cloud_anchor
			endif
		endif
		if GotParam set_cat_mode_flag
			change launch_to_createatrick = 1
		else
			change launch_to_createatrick = 0
		endif
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		if GotParam new_menu_script
			<new_menu_script> <...>
		endif
	endscript
	script play_no_skater_cam
		KillSkaterCamAnim all
		PlaySkaterCamAnim skater = 0 name = mainmenu_camera03 play_hold
	endscript
	script hide_the_skater
		while
			if LocalSkaterExists
				Wait 0.125 second
				play_no_skater_cam
				break
			endif
			Wait 1 frame
		repeat
	endscript
	script make_mainmenu_3d_plane id = bg_plane parent = current_menu_anchor z_priority = -500 model = "UI_bg\UI_bg.mdl" scale = (2.0999999,2.20000005) pos = (320.0,225.0)
		if ScreenElementExists id = <id>
			DestroyScreenElement id = <id>
		endif
		if GetGlobalFlag flag = SCREEN_MODE_WIDE
			scale = (<scale>.(1.0,0.0) * (1.33299994,0.0) + <scale>.(0.0,1.0) * (0.0,1.0))
		endif
		if ScreenElementExists id = <parent>
			SetScreenElementLock off id = <parent>
			CreateScreenElement {
				parent = <parent>
				Type = Element3d
				id = <id>
				model = <model>
				TexDictOffset = 20
				pos = <pos>
				CameraZ = <z_priority>
				scale = <scale>
				Tilt = 0
			}
		else
			printf "make_mainmenu_3d_plane: parent %p doesn't exist" p = <parent>
		endif
	endscript
	current_attract_movie = 0
	script attract_mode_timer
		max_time = 30
		while
			Wait <max_time> seconds
		repeat
	endscript
	script reset_attract_mode_timer
		KillSpawnedScript name = attract_mode_timer
		SpawnScript attract_mode_timer
	endscript
	in_options_menu = 0
	script check_cheat_from_keyboard
		GetTextElementString id = keyboard_current_string
		if NOT GotParam cancel
			TryCheatString string = <string>
		endif
		destroy_onscreen_keyboard
		create_setup_options_menu
	endscript
	script launch_career_options_menu
		RunScriptOnScreenElement id = current_menu_anchor menu_offscreen callback = create_career_options_menu
	endscript
	script create_career_options_menu
		dialog_box_exit
		pulse_blur speed = 2 start = 255
		if GotParam change_gamemode
			<change_gamemode>
		endif
		make_new_menu {
			pos = (120.0,100.0)
			internal_just = [center center]
			menu_id = career_options_menu
			vmenu_id = career_options_vmenu
			menu_title = ""
			helper_text = generic_helper_text
		}
		FormatText ChecksumName = title_icon "%i_career_ops" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_sub_title title_icon = <title_icon> title = "STORY OPTIONS"
		build_top_and_bottom_blocks
		make_mainmenu_3d_plane model = "mainmenu_bg\mainmenu_bg.mdl" scale = (1.25,1.25) pos = (360.0,217.0)
		CreateScreenElement {
			Type = SpriteElement
			parent = current_menu_anchor
			id = mm_building
			texture = mm_building
			just = [left top]
			pos = (0.0,62.0)
			scale = (1.20000005,1.25)
			z_priority = -3
			alpha = 1
		}
		make_mainmenu_clouds
		kill_start_key_binding
		SetScreenElementProps {id = career_options_vmenu event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = career_options_menu_exit new_menu_script = create_main_menu}}
			]
		}
		FormatText ChecksumName = bracket_texture "%i_sub_frame" i = (THEME_PREFIXES[current_theme_prefix])
		if NOT cd
			make_main_menu_item {text = 'Level Select'
				id = ss_play_level
				pad_choose_script = career_options_menu_exit
				pad_choose_params = {new_menu_script = launch_level_select_menu kill_all}
			}
		endif
		if GetGlobalFlag flag = CAREER_STARTED
			GoalManager_GetCurrentChapterAndStage
			if NOT ((<currentChapter> = 9) || (<currentChapter> = 24) || (<currentChapter> = 25))
				level = ((CHAPTER_LEVELS[<currentChapter>]).checksum)
			else
				level = load_nj
			endif
			make_main_menu_item {text = 'Continue Story'
				pad_choose_script = career_options_menu_exit
				pad_choose_params = {new_menu_script = story_options_change_level level = <level> kill_all continue_story}
			}
			make_main_menu_item {text = 'Start New Story'
				pad_choose_script = career_overwrite_warning
				pad_choose_params = {title = 'Create New'}
			}
			make_main_menu_item {text = 'Load Story'
				pad_choose_script = career_overwrite_warning
				pad_choose_params = {title = 'Load Story' pad_choose_script = launch_career_menu_load_game_sequence}
			}
		else
			make_main_menu_item {text = 'Continue Story'
				pad_choose_script = null_script
				not_focusable = not_focusable
			}
			make_main_menu_item {text = 'Start New Story'
				pad_choose_script = career_options_menu_exit
				pad_choose_params = {new_menu_script = create_career_difficulty_menu level = load_cas kill_all}
			}
			make_main_menu_item {text = 'Load Story'
				pad_choose_script = career_options_menu_exit
				pad_choose_params = {new_menu_script = launch_career_menu_load_game_sequence from_career}
			}
		endif
		if cd
			GetStackedScreenElementPos Y id = <id> offset = (180.0,0.0)
		else
			GetStackedScreenElementPos Y id = <id> offset = (180.0,20.0)
		endif
		FireEvent Type = focus target = current_menu_anchor
		if GotParam from_skater_select
			SpawnScript shadow_skater_script2 params = {make_it_safe}
		endif
	endscript
	script career_options_menu_exit
		dialog_box_exit
		if NOT GotParam from_ss_menu
			if GotParam kill_all
				if ScreenElementExists id = cloud_anchor
					DestroyScreenElement id = cloud_anchor
				endif
				skater::reset_model_lights
			endif
			if ObjectExists id = current_menu_anchor
				DestroyScreenElement id = current_menu_anchor
			endif
			<new_menu_script> <...> continue_shadow_skater_ai
		else
			<new_menu_script> <...>
		endif
	endscript
	script new_career_launch_select_skater_menu
		GoalManager_ResetCareer
		launch_select_skater_menu
	endscript
	script career_overwrite_warning title = 'Overwrite' pad_choose_script = pre_cas_menu_exit
		FireEvent Type = unfocus target = current_menu_anchor
		DoScreenElementMorph id = career_options_vmenu alpha = 0 time = 0.1
		create_snazzy_dialog_box {
			title = <title>
			text = 'Warning !\nAny unsaved changes to your current STORY/SKATER will be lost.\n\nNote: items unlocked from beating the game will not be lost\nContinue ?' text_dims = (400.0,0.0)
			no_bg
			pad_back_script = cancel_new_career
			buttons = [{font = small text = 'No' pad_choose_script = cancel_new_career}
				{font = small text = 'Yes'
					pad_choose_script = <pad_choose_script>
					pad_choose_params =
					{
						new_menu_script = reset_career
					}
				}
			]
		}
	endscript
	script cancel_new_career
		dialog_box_exit
		DoScreenElementMorph id = career_options_vmenu alpha = 1 time = 0.1
		FireEvent Type = focus target = current_menu_anchor
		SetScreenElementLock id = current_menu_anchor off
		create_helper_text generic_helper_text
	endscript
	script reset_career
		if GetGlobalFlag flag = CAREER_STARTED
			ResetToDefaultProfile name = custom
			load_pro_skater name = custom
		endif
		CareerReset
		GoalManager_ResetCareer
		<status_array> = CHAPTER_STATUS
		SetArrayElement ArrayName = status_array Index = 0 NewValue = 1
		GetArraySize <status_array>
		<array_size> = (<array_size> - 1)
		<Index> = 1
		while
			SetArrayElement ArrayName = status_array Index = <Index> NewValue = 0
			<Index> = (<Index> + 1)
		repeat <array_size>
		GoalManager_KillTeamMembers
		if GetGlobalFlag flag = SCREEN_MODE_WIDE
			stay_wide = 1
		endif
		UnSetGlobalFlag flag = GOT_ALL_GOALS
		Index = 0
		while
			if ArrayContains array = CLEAR_GLOBAL_FLAGS contains = <Index>
				if NOT GetGlobalFlag flag = GAME_COMPLETED_TOO_EASY
					if NOT GetGlobalFlag flag = GAME_COMPLETED_BEGINNER
						if NOT GetGlobalFlag flag = GAME_COMPLETED_NORMAL
							if NOT GetGlobalFlag flag = GAME_COMPLETED_SICK
								UnSetGlobalFlag flag = <Index>
							endif
						endif
					endif
				endif
			endif
			<Index> = (<Index> + 1)
		repeat 512
		if GotParam stay_wide
			SetGlobalFlag flag = SCREEN_MODE_WIDE
		endif
		<level_flag> = 128
		while
			<level> = 1
			while
				UnSetFlag flag = <level_flag> level = <level>
				<level> = (<level> + 1)
			repeat 9
			<level_flag> = (<level_flag> + 1)
		repeat 8
		SetGlobalFlag flag = LEVEL_UNLOCKED_SCH
		reset_secret_skaters
		unlock_initial_boards
		UnSetGlobalFlag flag = CAREER_STARTED
		create_career_difficulty_menu
	endscript
	script reset_secret_skaters
		SetSkaterProfileInfoByName name = eddie params = {is_hidden = 1}
		SetSkaterProfileInfoByName name = jango params = {is_hidden = 1}
		SetSkaterProfileInfoByName name = vallely params = {is_hidden = 1}
		SetSkaterProfileInfoByName name = jenna params = {is_hidden = 1}
	endscript
	script create_career_difficulty_menu
		dialog_box_exit
		if NOT GotParam from_ss_menu
			load_pro_skater name = custom
			unpauseskaters
			KillSpawnedScript Type = shadow_skater_script2
			SpawnScript shadow_skater_script2 params = {make_it_safe launched = <launched>}
		endif
		make_new_menu {
			pos = (120.0,100.0)
			internal_just = [center center]
			menu_id = career_dif_menu
			vmenu_id = career_dif_vmenu
			menu_title = ""
			helper_text = generic_helper_text
		}
		FormatText ChecksumName = title_icon "%i_career_ops" i = (THEME_PREFIXES[current_theme_prefix])
		if NOT GotParam from_ss_menu
			build_theme_sub_title title_icon = <title_icon> title = "DIFFICULTY"
		else
			build_theme_sub_title title_icon = <title_icon> title = "DIFFICULTY" pos = (-255.0,73.0) static
		endif
		build_top_and_bottom_blocks
		if NOT GotParam from_ss_menu
			make_mainmenu_3d_plane model = "mainmenu_bg\mainmenu_bg.mdl" pos = (360.0,217.0) scale = (1.25,1.25)
			CreateScreenElement {
				Type = SpriteElement
				parent = current_menu_anchor
				id = mm_building
				texture = mm_building
				just = [left top]
				pos = (0.0,62.0)
				scale = (1.20000005,1.25)
				z_priority = -3
				alpha = 1
			}
			make_mainmenu_clouds
		else
			CreateScreenElement {
				Type = SpriteElement
				parent = current_menu_anchor
				id = mm_building
				texture = ss_sidewall
				just = [center center]
				pos = (-40.0,195.0)
				scale = (2.0,1.79999995)
				z_priority = -3
				alpha = 1
			}
		endif
		kill_start_key_binding
		if NOT GotParam from_ss_menu
			SetScreenElementProps {id = career_dif_vmenu event_handlers = [
					{pad_back generic_menu_pad_back params = {callback = career_options_menu_exit new_menu_script = create_career_options_menu}}
				]
			}
		else
			SetScreenElementProps {id = career_dif_vmenu event_handlers = [
					{pad_back generic_menu_pad_back params = {callback = launch_ss_menu no_animate}}
				]
			}
		endif
		FormatText ChecksumName = bracket_texture "%i_sub_frame" i = (THEME_PREFIXES[current_theme_prefix])
		make_main_menu_item {text = 'Too Easy'
			pad_choose_script = career_options_menu_exit
			pad_choose_params = {new_menu_script = set_career_difficulty dif = -1 from_ss_menu = <from_ss_menu>}
		}
		SetScreenElementProps {
			id = {current_menu child = 1}
			event_handlers = [
				{focus difficulty_menu_item_focus params = {description = "Easy physics and fewer bails for first time Tony Hawk players"}}
				{unfocus difficulty_menu_item_unfocus}
			]
			replace_handlers
		}
		make_main_menu_item {text = 'Beginner'
			pad_choose_script = career_options_menu_exit
			pad_choose_params = {new_menu_script = set_career_difficulty dif = 0 from_ss_menu = <from_ss_menu>}
		}
		SetScreenElementProps {
			id = {current_menu child = 2}
			event_handlers = [
				{focus difficulty_menu_item_focus params = {description = "Less difficult goals for those fairly new to the Tony Hawk series"}}
				{unfocus difficulty_menu_item_unfocus}
			]
			replace_handlers
		}
		make_main_menu_item {text = 'Normal'
			pad_choose_script = career_options_menu_exit
			pad_choose_params = {new_menu_script = set_career_difficulty dif = 1 from_ss_menu = <from_ss_menu>}
		}
		SetScreenElementProps {
			id = {current_menu child = 3}
			event_handlers = [
				{focus difficulty_menu_item_focus params = {description = "Challenging goals for the average to good Tony Hawk player"}}
				{unfocus difficulty_menu_item_unfocus}
			]
			replace_handlers
		}
		if NOT GotParam from_ss_menu
			make_main_menu_item {text = 'Sick'
				pad_choose_script = career_options_menu_exit
				pad_choose_params = {new_menu_script = set_career_difficulty dif = 2 from_ss_menu = <from_ss_menu>}
			}
			SetScreenElementProps {
				id = {current_menu child = 4}
				event_handlers = [
					{focus difficulty_menu_item_focus params = {description = "For hardcore veterans who have mastered the Tony Hawk games"}}
					{unfocus difficulty_menu_item_unfocus}
				]
				replace_handlers
			}
		endif
		FormatText ChecksumName = bar_color "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = text_color "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			Type = ContainerElement
			parent = current_menu_anchor
			id = diff_desc_box
			internal_just = [center top]
			just = [center center]
			pos = (320.0,320.0)
			just = [center top]
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = diff_desc_box
			texture = black
			scale = (70.0,15.0)
			just = [center top]
			rgba = [0 0 0 90]
		}
		CreateScreenElement {
			Type = textBlockElement
			parent = diff_desc_box
			id = diff_desc_bg_text
			text = ""
			font = small
			pos = (0.0,6.0)
			dims = (250.0,0.0)
			line_spacing = 0.60000002
			just = [center center]
			rgba = [80 80 80 50]
			not_focusable
			allow_expansion
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = diff_desc_box
			texture = white
			scale = (70.0,1.0)
			z_priority = 10
			just = [center top]
			rgba = <bar_color>
		}
		FireEvent Type = focus target = current_menu_anchor
		change disable_menu_sounds = 1
		if GotParam from_ss_menu
			GoalManager_GetDifficultyLevel
			FireEvent Type = pad_down target = current_menu
			if NOT GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
				FireEvent Type = pad_down target = current_menu
				if (<difficulty_level> > 0)
					FireEvent Type = pad_down target = current_menu
				endif
			endif
			DoScreenElementMorph id = submenu_title_anchor time = 0.0 pos = (-255.0,53.0)
			DoScreenElementMorph id = submenu_title_anchor time = 0.2 pos = (55.0,53.0)
			DoScreenElementMorph id = current_menu time = 0.0 pos = (120.0,412.0)
			DoScreenElementMorph id = current_menu time = 0.2 pos = (120.0,100.0)
		else
			FireEvent Type = pad_down target = current_menu
			FireEvent Type = pad_down target = current_menu
			FireEvent Type = pad_down target = current_menu
		endif
		change disable_menu_sounds = 0
		DoScreenElementMorph id = diff_desc_box time = 0 pos = (315.0,520.0)
		DoScreenElementMorph id = diff_desc_box time = 0.2 pos = (315.0,310.0)
		if NOT GotParam from_ss_menu
			ShadowSkaterOptionsTricks
			MakeSkaterGoto ShadowSkaterAI
		endif
	endscript
	script difficulty_menu_item_focus
		GetTags
		SetScreenElementProps id = diff_desc_bg_text text = <description>
		theme_item_focus
	endscript
	script difficulty_menu_item_unfocus
		GetTags
		if ScreenElementExists id = {<id> child = 1}
			DestroyScreenElement id = {<id> child = 1}
		endif
		if ScreenElementExists id = {<id> child = 2}
			DestroyScreenElement id = {<id> child = 2}
		endif
		theme_item_unfocus
	endscript
	script set_career_difficulty
		if (<dif> = -1)
			SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
			GetGameMode
			switch <GameMode>
				case career
					SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_STORY
				case freeskate
					if InSplitScreenGame
						SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_2P
					endif
				case creategoals
					SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_CAG
				case singlesession
					SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_FREESKATE
			endswitch
			<dif> = 0
		else
			UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
			GetGameMode
			switch <GameMode>
				case career
					UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_STORY
				case freeskate
					if InSplitScreenGame
						UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_2P
					endif
				case creategoals
					UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_CAG
				case singlesession
					UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_FREESKATE
			endswitch
		endif
		GoalManager_SetDifficultyLevel <dif>
		if GotParam set_flag
			SetGlobalFlag flag = <flag>
		endif
		if NOT GotParam from_ss_menu
			skater::StatsManager_ReInit
			ResetAllToDefaultStats
			ResetDeck
			skater::remove_skater_from_world
			maybe_reset_theme
			change check_for_unplugged_controllers = 0
			career_options_menu_exit {new_menu_script = story_options_change_level level = load_cas kill_all}
		else
			launch_ss_menu no_animate
		endif
	endscript
	script ResetDeck
		GetCurrentSkaterProfileIndex
		EditPlayerAppearance {
			profile = <currentSkaterProfileIndex>
			target = SetPart
			targetParams = {part = deck_layer1 desc_id = None}
		}
		EditPlayerAppearance {
			profile = <currentSkaterProfileIndex>
			target = SetPart
			targetParams = {part = deck_layer2 desc_id = None}
		}
		EditPlayerAppearance {
			profile = <currentSkaterProfileIndex>
			target = SetPart
			targetParams = {part = deck_layer3 desc_id = None}
		}
		EditPlayerAppearance {
			profile = <currentSkaterProfileIndex>
			target = SetPart
			targetParams = {part = deck_layer4 desc_id = None}
		}
		EditPlayerAppearance {
			profile = <currentSkaterProfileIndex>
			target = SetPart
			targetParams = {part = deck_layer5 desc_id = None}
		}
		EditPlayerAppearance {
			profile = <currentSkaterProfileIndex>
			target = SetPart
			targetParams = {part = cad_graphic desc_id = None}
		}
		GetPlayerAppearancePart {
			profile = <currentSkaterProfileIndex>
			player = 0
			part = board
		}
		SetPlayerAppearanceColor player = <currentSkaterProfileIndex> part = board h = 0 s = 0 v = 0 use_default_hsv = 1
		EditPlayerAppearance {
			profile = <currentSkaterProfileIndex>
			target = SetPart
			targetParams = {part = board desc_id = #"Default"}
		}
		RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
	endscript
	script story_options_change_level
		dialog_box_exit
		if GotParam continue_story
			load_pro_skater name = custom
		endif
		GetGameMode
		switch <GameMode>
			case career
				if GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_STORY
					SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
				else
					UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
				endif
			case freeskate
				if InSplitScreenGame
					if GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_2P
						SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
					else
						UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
					endif
				endif
			case creategoals
				if GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_CAG
					SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
				else
					UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
				endif
			case singlesession
				if GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_FREESKATE
					SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
				else
					UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_FREESKATE
				endif
		endswitch
		load_mainmenu_textures_to_main_memory unload
		printstruct <...>
		if ((<level> = load_cas) || (GotParam continue_story))
			select_skater_get_current_skater_name
			if NOT (<current_skater> = custom)
				load_pro_skater {profile = 0 skater = 0 name = custom}
			endif
			if (<level> = load_cas)
				change in_cinematic_sequence = 1
				SetGameType freeskate
				SetCurrentGameType
			endif
		endif
		restore_start_key_binding
		change_level level = <level>
	endscript
	script create_select_goals_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		skater::unhide
		if GotParam change_gamemode
			<change_gamemode>
		endif
		make_new_menu {
			pos = (120.0,100.0)
			internal_just = [center center]
			menu_id = select_goals_menu
			vmenu_id = select_goals_vmenu
			menu_title = ""
			helper_text = generic_helper_text
		}
		FormatText ChecksumName = title_icon "%i_sound" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_sub_title title_icon = <title_icon> title = "SELECT GOALS"
		build_top_and_bottom_blocks
		make_mainmenu_3d_plane model = "mainmenu_bg\mainmenu_bg.mdl" scale = (1.25,1.25) pos = (360.0,217.0)
		CreateScreenElement {
			Type = SpriteElement
			parent = current_menu_anchor
			id = mm_building
			texture = mm_building
			just = [left top]
			pos = (0.0,62.0)
			scale = (1.20000005,1.25)
			z_priority = -3
			alpha = 1
		}
		make_mainmenu_clouds
		kill_start_key_binding
		SetScreenElementProps {id = select_goals_vmenu event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = select_goals_menu_exit new_menu_script = create_main_menu}}
			]
		}
		GoalEditor::GetNumEditedGoals
		if (<NumGoals> = 0)
			text = 'Create New Goals'
		else
			text = 'Play Current Goals'
		endif
		make_main_menu_item {text = <text>
			pad_choose_script = select_goals_menu_exit
			pad_choose_params = {new_menu_script = launch_select_skater_menu}
		}
		make_main_menu_item {text = 'Load Goals'
			pad_choose_script = select_goals_menu_exit
			pad_choose_params = {new_menu_script = prompt_launch_cag_menu_load}
		}
		if (<NumGoals> > 0)
			make_main_menu_item {text = 'Nuke All Goals'
				pad_choose_script = select_goals_menu_exit
				pad_choose_params = {new_menu_script = prompt_nuke_goals}
			}
		endif
		FireEvent Type = focus target = current_menu_anchor
		if GotParam from_skater_select
			SpawnScript shadow_skater_script2 params = {make_it_safe}
		endif
	endscript
	script prompt_launch_cag_menu_load
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		skater::hide
		create_dialog_box {title = "Load Goals"
			text = 'Warning !\nAny unsaved changes to your current CREATED GOALS will be lost.\nContinue ?'
			pos = (320.0,240.0)
			text_dims = (400.0,0.0)
			just = [center center]
			text_rgba = [88 105 112 128]
			text_scale = 1
			buttons = [{font = small text = "Yes" pad_choose_script = launch_load_created_goals_from_select_goals_menu}
				{font = small text = "No" pad_choose_script = no_launch_cag_menu_load}
			]
		}
	endscript
	script no_launch_cag_menu_load
		dialog_box_exit
		skater::unhide
		create_select_goals_menu
	endscript
	script prompt_nuke_goals
		skater::hide
		menu_confirm_quit back_script = nuke_goals_deny no_script = nuke_goals_deny yes_script = nuke_goals_confirm title = "CLEAR GOALS?"
	endscript
	script nuke_goals_confirm
		dialog_box_exit
		select_goals_menu_exit new_menu_script = nuke_all_goals
	endscript
	script nuke_goals_deny
		dialog_box_exit
		create_select_goals_menu
	endscript
	script select_goals_menu_exit
		dialog_box_exit
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
			Wait 1 frame
		endif
		<new_menu_script> <...> continue_shadow_skater_ai
	endscript
	script nuke_all_goals
		GoalEditor::NukeAllGoals
		create_select_goals_menu
	endscript
	script launch_ss_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
			Wait 1 frame
		endif
		create_ss_menu <...>
	endscript
	script create_ss_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		skater::add_skater_to_world
		skater::BlendperiodOut 0.0
		if GotParam change_gamemode
			<change_gamemode>
		endif
		GetGameMode
		switch <GameMode>
			case career
				if GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_STORY
					SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
				else
					UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
				endif
			case freeskate
				if InSplitScreenGame
					if GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_2P
						SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
					else
						UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
					endif
				endif
			case creategoals
				if GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_CAG
					SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
				else
					UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
				endif
			case singlesession
				if GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_FREESKATE
					SetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
				else
					UnSetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY_FREESKATE
				endif
		endswitch
		FormatText ChecksumName = title_icon "%i_career_ops" i = (THEME_PREFIXES[current_theme_prefix])
		GetCurrentSkaterProfileIndex
		GetGameMode
		switch <GameMode>
			case career
				<menu_title> = 'CAREER'
			case freeskate
				if InSplitScreenGame
					FormatText ChecksumName = title_icon "%i_2_player" i = (THEME_PREFIXES[current_theme_prefix])
					MakeSkaterGoto SkateshopAI params = {BlendOK}
					if (<currentSkaterProfileIndex> = 1)
						<menu_title> = 'PLAYER TWO'
					else
						<menu_title> = 'PLAYER ONE'
					endif
				else
					<menu_title> = 'FREE SKATE'
				endif
			case net
				FormatText ChecksumName = title_icon "%i_online" i = (THEME_PREFIXES[current_theme_prefix])
				if isxbox
					if (network_connection_type = internet)
						<menu_title> = 'THUG ONLINE'
					else
						<menu_title> = 'NETWORK PLAY'
					endif
				else
					<menu_title> = 'THUG ONLINE'
				endif
			case singlesession
				<menu_title> = 'SINGLE SESSION'
			case creategoals
				FormatText ChecksumName = title_icon "%i_sound" i = (THEME_PREFIXES[current_theme_prefix])
				<menu_title> = 'CREATE GOALS'
			default
				<menu_title> = 'SKATESHOP'
		endswitch
		if GameModeEquals is_net
			if isxbox
				if (network_connection_type = internet)
					<menu_title> = 'THUG ONLINE'
				else
					<menu_title> = 'NETWORK PLAY'
				endif
			else
				<menu_title> = 'THUG ONLINE'
			endif
		endif
		if (launch_to_createatrick = 1)
			<menu_title> = 'CREATE TRICKS'
		endif
		make_new_menu {
			pos = (120.0,100.0)
			internal_just = [center center]
			menu_id = ss_menu
			vmenu_id = ss_vmenu
			menu_title = ""
			helper_text = generic_helper_text
		}
		build_theme_sub_title title_icon = <title_icon> title = <menu_title> pos = (-255.0,73.0) static
		build_top_and_bottom_blocks
		make_mainmenu_3d_plane model = "mainmenu_bg\mainmenu_bg.mdl" scale = (1.25,1.25) pos = (360.0,217.0)
		CreateScreenElement {
			Type = SpriteElement
			parent = current_menu_anchor
			id = mm_building
			texture = ss_sidewall
			just = [center center]
			pos = (158.0,218.0)
			scale = (1.20000005,1.25)
			z_priority = -3
			alpha = 1
		}
		make_mainmenu_clouds
		create_helper_text = generic_helper_text
		kill_start_key_binding
		SetScreenElementProps {
			id = ss_vmenu
			event_handlers = [{pad_back generic_menu_pad_back params = {callback = ss_menu_exit new_menu_script = launch_select_skater_menu} animate_in = 1}]
			replace_handlers
		}
		GetCurrentSkaterProfileIndex
		if InSplitScreenGame
			if (<currentSkaterProfileIndex> = 1)
				make_main_menu_item {text = 'Ready'
					id = ss_play_level
					pad_choose_script = ss_menu_exit
					pad_choose_params = {new_menu_script = launch_level_select_menu player_two}
				}
			else
				make_main_menu_item {text = 'Ready'
					id = ss_play_level
					pad_choose_script = ss_menu_exit
					pad_choose_params = {new_menu_script = player_1_ready}
				}
			endif
		else
			if GameModeEquals is_net
				if IsInternetGameHost
					make_main_menu_item {text = 'Ready'
						id = ss_play_level
						pad_choose_script = ss_menu_exit
						pad_choose_params = {new_menu_script = create_network_select_games_menu play_cam}
					}
				else
					if (network_connection_type = internet)
						make_main_menu_item {text = 'Ready'
							id = ss_play_level
							pad_choose_script = ss_menu_exit
							pad_choose_params = {new_menu_script = chose_internet}
						}
					else
						make_main_menu_item {text = 'Ready'
							id = ss_play_level
							pad_choose_script = ss_menu_exit
							pad_choose_params = {new_menu_script = launch_network_select_lan_games_menu}
						}
					endif
				endif
			else
				RemoveParameter callback
				make_main_menu_item {text = 'Play Level'
					id = ss_play_level
					pad_choose_script = ss_menu_exit
					pad_choose_params = {new_menu_script = launch_level_select_menu <...>}
				}
			endif
		endif
		make_main_menu_item {text = 'Edit Tricks'
			pad_choose_script = ss_menu_exit
			pad_choose_params = {new_menu_script = create_edit_tricks_menu from_ss_menu hide_bg = 1}
		}
		if ((GameModeEquals is_creategoals) || (GameModeEquals is_singlesession))
			make_main_menu_item {text = 'Difficulty'
				pad_choose_script = ss_menu_exit
				pad_choose_params = {new_menu_script = create_career_difficulty_menu from_ss_menu = 1}
			}
		endif
		if InSplitScreenGame
			if (<currentSkaterProfileIndex> = 0)
				make_main_menu_item {text = 'Difficulty'
					pad_choose_script = ss_menu_exit
					pad_choose_params = {new_menu_script = create_career_difficulty_menu from_ss_menu = 1}
				}
			endif
		endif
		if GameModeEquals is_net
			if isps2
				GetPreferenceChecksum pref_type = network device_type
				switch <checksum>
					case device_none
					case device_sony_modem
					case device_usb_modem
						can_lan = 0
						SetNetworkMode INTERNET_MODE
						change network_connection_type = internet
					default
						can_lan = 1
				endswitch
				if (<can_lan> = 1)
					if (network_connection_type = internet)
						ui_string = "internet"
					else
						ui_string = "lan"
					endif
					make_main_menu_item {text = "Connection:"
						id = menu_connection
						pad_choose_script = toggle_net_connection_type
						pad_choose_params = {new_menu_script = <new_menu_script>}
					}
					CreateScreenElement {
						Type = ContainerElement
						parent = menu_connection
					}
					CreateScreenElement {
						Type = TextElement
						parent = menu_connection
						id = connection_type_string
						text = <ui_string>
						font = small
						rgba = [60 60 60 100]
						scale = 1
						pos = (200.0,-3.0)
						just = [left top]
						z_priority = 5
					}
				endif
				if IsOnline
					GetPreferenceChecksum pref_type = network device_type
					switch <checksum>
						case device_sony_modem
						case device_usb_modem
							make_main_menu_item {
								text = "Hang Up Modem"
								id = menu_network_select_hang_up
								pad_choose_script = disconnect_from_internet
							}
					endswitch
				endif
			endif
			GetPreferenceString pref_type = network network_id
			make_main_menu_item {text = 'Player Name:'
				id = menu_player_name
				pad_choose_script = ss_menu_exit
				pad_choose_params = {new_menu_script = launch_onscreen_keyboard_from_ss_menu
					field = "network_id"
					text = <ui_string>
					title = "PLAYER NAME"
					min_length = 1
					max_length = 15
					highlight_bar_scale = (1.39999998,1.29999995)
				}
			}
			CreateScreenElement {
				Type = ContainerElement
				parent = menu_player_name
			}
			CreateScreenElement {
				Type = TextElement
				parent = menu_player_name
				id = network_option_player_name_string
				text = <ui_string>
				font = small
				rgba = [60 60 60 100]
				scale = 1
				pos = (200.0,-3.0)
				just = [left top]
				z_priority = 5
			}
		endif
		MakeSkaterGoto SkaterSelectAI
		MakeSkaterGoto SkateshopAI
		DoScreenElementMorph id = mm_building time = 0.047 scale = (2.0,1.79999995) pos = (-40.0,195.0)
		if NOT GotParam no_animate
			KillSkaterCamAnim all
			PlaySkaterCamAnim skater = 0 name = skater_select_cam play_hold
		else
			KillSkaterCamAnim all
			PlaySkaterCamAnim skater = 0 name = stationary_skater_cam play_hold
		endif
		FireEvent Type = focus target = current_menu_anchor
		DoScreenElementMorph id = submenu_title_anchor time = 0.0 pos = (-255.0,53.0)
		DoScreenElementMorph id = submenu_title_anchor time = 0.2 pos = (55.0,53.0)
		if GameModeEquals is_net
			DoScreenElementMorph id = current_menu time = 0.0 pos = (-20.0,412.0)
			DoScreenElementMorph id = current_menu time = 0.2 pos = (-20.0,100.0)
		else
			DoScreenElementMorph id = current_menu time = 0.0 pos = (120.0,412.0)
			DoScreenElementMorph id = current_menu time = 0.2 pos = (120.0,100.0)
		endif
	endscript
	network_connection_type = internet
	script toggle_net_connection_type
		GetCurrentSkaterProfileIndex
		GetGameMode
		switch network_connection_type
			case lan
				SetNetworkMode INTERNET_MODE
				change network_connection_type = internet
				SetScreenElementProps id = connection_type_string text = "internet"
			case internet
				SetNetworkMode LAN_MODE
				change network_connection_type = lan
				SetScreenElementProps id = connection_type_string text = "lan"
		endswitch
		if InSplitScreenGame
			if (<currentSkaterProfileIndex> = 1)
				SetScreenElementProps {
					id = ss_play_level
					event_handlers = [{pad_choose ss_menu_exit params = {new_menu_script = launch_level_select_menu player_two}}]
					replace_handlers
				}
			else
				SetScreenElementProps {
					id = ss_play_level
					event_handlers = [{pad_choose ss_menu_exit params = {new_menu_script = player_1_ready}}]
					replace_handlers
				}
			endif
		else
			if GameModeEquals is_net
				if isxbox
					SetScreenElementProps {
						id = ss_play_level
						event_handlers = [{pad_choose ss_menu_exit params = {new_menu_script = create_network_select_games_menu play_cam}}]
						replace_handlers
					}
				else
					if (network_connection_type = internet)
						SetScreenElementProps {
							id = ss_play_level
							event_handlers = [{pad_choose ss_menu_exit params = {new_menu_script = chose_internet}}]
							replace_handlers
						}
					else
						SetScreenElementProps {
							id = ss_play_level
							event_handlers = [{pad_choose ss_menu_exit params = {new_menu_script = launch_network_select_lan_games_menu}}]
							replace_handlers
						}
					endif
				endif
			else
				SetScreenElementProps {
					id = ss_play_level
					event_handlers = [{pad_choose ss_menu_exit params = {new_menu_script = launch_level_select_menu <...>}}]
					replace_handlers
				}
			endif
		endif
	endscript
	script player_1_ready
		load_second_skater_profile
		MakeSkaterGoto SkateshopAI params = {}
		launch_select_skater_menu
	endscript
	script ss_menu_exit
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		if GotParam hide_bg
			play_no_skater_cam
		endif
		if GotParam new_menu_script
			<new_menu_script> <...> animate_in = 1
		endif
		if OnXbox
			if GameModeEquals is_net
				if (<new_menu_script> = launch_select_skater_menu)
					SetNetworkMode
				endif
			endif
		endif
	endscript
	script launch_select_skater_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		if levelis load_skateshop
			if (goto_secret_shop = 2)
				Wait 1 gameframe
				change goto_secret_shop = 0
			endif
			if NOT GotParam From2p
			else
				printf "GOTPARAM FROM 2p"
			endif
		endif
		GetCurrentSkaterProfileIndex
		if (<currentSkaterProfileIndex> = 1)
			SetMenuPadMappings[active
				use_as_first
			]
		else
			printf "Resetting skater profile number"
			SetCurrentSkaterProfile 0
			RefreshSkaterModel profile = 0 skater = 0
			if levelis load_skateshop
			endif
			SetMenuPadMappings[active
				use_as_first
			]
		endif
		GoalManager_HidePoints
		GoalManager_HideGoalPoints
		create_select_skater_menu <...>
	endscript
	script create_select_skater_menu
		kill_blur
		MakeSkaterGoto SkaterSelectAI
		MakeSkaterGoto SkateshopAI params = {BlendOK}
		KillSkaterCamAnim all
		PlaySkaterCamAnim skater = 0 name = skater_select_cam01 play_hold
		ResetComboRecords
		if GotParam change_gamemode
			<change_gamemode>
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			Type = ContainerElement
			parent = root_window
			id = select_skater_anchor
			pos = (320.0,240.0)
			dims = (640.0,480.0)
		}
		AssignAlias id = select_skater_anchor alias = current_menu_anchor
		build_top_and_bottom_blocks
		FormatText ChecksumName = main_icon "%i_mainicon" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			Type = SpriteElement
			parent = current_menu_anchor
			id = mm_icon
			texture = <main_icon>
			just = [center center]
			pos = (62.0,80.0)
			scale = (2.0,2.0)
			rot_angle = -10
			z_priority = 2
			alpha = 0.69999999
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = current_menu_anchor
			id = mm_building
			texture = ss_sidewall
			just = [left top]
			pos = (0.0,52.0)
			scale = (1.20000005,1.25)
			z_priority = -3
			alpha = 1
		}
		create_helper_text {helper_text_elements = [{text = "\b6/\b5=Select"}
				{text = "\bm=Accept"}
				{text = "\bn=Back"}
				{text = "\bo=Load Skater"}
			]
		}
		root_pos = (22.0,60.0)
		pos = <root_pos>
		select_skater_create_top_bar root_pos = <root_pos> create_dots <...>
		kill_start_key_binding
		if ObjectExists id = stats_block_anchor_parent
			DestroyScreenElement id = stats_block_anchor_parent
		endif
		CreateScreenElement {
			Type = ContainerElement
			parent = select_skater_anchor
			id = stats_block_anchor_parent
			pos = (-40.0,445.0)
			just = [left top]
			dims = (640.0,480.0)
			scale = 1.0
		}
		stats_menu_create_stats_block parent = stats_block_anchor_parent not_focusable on = on pos = (0.0,0.0) scale = 0.85000002
		DoScreenElementMorph id = stats_block_anchor_parent time = 0.5 pos = (-40.0,20.0)
		AssignAlias id = select_skater_hmenu alias = current_menu
		Wait 2 gameframes
		SetScreenElementProps id = select_skater_scrolling_hmenu reset_window
		select_skater_get_current_skater_name
		AssignAlias id = select_skater_hmenu alias = current_menu
		FireEvent Type = focus target = select_skater_hmenu data = {child_id = <current_skater>}
		skater::SetTags stopskateshopstreams = 0
		if GotParam animate_in
			KillSkaterCamAnim all
			PlaySkaterCamAnim skater = 0 name = skater_select_cam02 play_hold
			DoScreenElementMorph id = mm_building time = 0.0 scale = (2.0,1.79999995) pos = (-40.0,195.0)
			DoScreenElementMorph id = mm_building time = 0.04 scale = (1.20000005,1.25) pos = (0.0,54.0)
		else
		endif
	endscript
	script SkaterSelectAI stopskateshopstreams = 1
		SkaterInit NoEndRun ReturnControl NoAnims
		Obj_SetLightAmbientColor r = 53 g = 50 b = 60
		Obj_SetLightDiffuseColor Index = 0 r = 100 g = 115 b = 145
		Obj_SetLightDiffuseColor Index = 1 r = 5 g = 3 b = 5
		Obj_SetLightDirection Index = 0 heading = skater_select_light0_heading pitch = 350
		Obj_SetLightDirection Index = 1 heading = skater_select_light1_heading pitch = 270
		SetLightDirection Index = 0 heading = skater_select_light0_heading pitch = 350
		SetLightDirection Index = 1 heading = skater_select_light1_heading pitch = 270
		stream_repetition = 4
		TurnOffSpecialItem
		SwitchOffBoard
		ClearExceptions
		SetQueueTricks NoTricks
		DisablePlayerInput
		SetRollingFriction 10000
		Obj_MoveToNode name = SS_player_restart Orient NoReset
		PausePhysics
	endscript
	script reset_model_lights
		if Obj_HasModelLights
			Obj_DisableAmbientLight
			Obj_DisableDiffuseLight Index = 0
			Obj_DisableDiffuseLight Index = 1
		else
			printf "No model lights to reset"
		endif
	endscript
	script select_skater_menu_fire_focus
		printf "select_skater_menu_fire_focus"
		Wait 1 frame
		select_skater_get_current_skater_name
		FireEvent Type = focus target = select_skater_hmenu data = {child_id = <current_skater>}
		printf "select_skater_menu_fire_focus done"
	endscript
	script select_skater_create_top_bar scale = (1.13999999,1.0) text = "" parent = select_skater_anchor
		CreateScreenElement {
			Type = ContainerElement
			parent = <parent>
			id = select_skater_top_anchor
			pos = (320.0,242.0)
			dims = (640.0,480.0)
		}
		CreateScreenElement {
			Type = TextElement
			parent = select_skater_top_anchor
			id = select_skater_name
			text = <text>
			font = testtitle
			pos = (-330.0,90.0)
			scale = 1.63
			just = [center top]
		}
		CreateScreenElement {
			Type = TextElement
			parent = select_skater_top_anchor
			id = select_skater_name_2
			text = <text>
			font = testtitle
			pos = (-330.0,92.0)
			scale = 1.67999995
			rgba = [6 25 32 60]
			just = [center top]
		}
		if GotParam create_dots
			CreateScreenElement {
				Type = HScrollingMenu
				parent = select_skater_top_anchor
				id = select_skater_scrolling_hmenu
				pos = (320.0,-260.0)
				dims = (534.0,74.0)
			}
			CreateScreenElement {
				Type = HMenu
				parent = select_skater_scrolling_hmenu
				id = select_skater_hmenu
				pos = (0.0,10.0)
				just = [center top]
				internal_just = [center top]
				padding_scale = 0.85000002
			}
			AssignAlias id = select_skater_hmenu alias = current_menu
			ForEachSkaterProfile do = select_skater_menu_add_hmenu_items params = {root_pos = <root_pos> <...>}
			GetCurrentSkaterProfileIndex
			if levelis load_skateshop
				if (<currentSkaterProfileIndex> = 1)
					SetScreenElementProps {
						id = select_skater_hmenu
						event_handlers = [
							{pad_back generic_menu_pad_back_sound}
							{pad_back select_skater_menu_back params = {callback = back_from_player_two_select}}
							{pad_option ss_overwrite_warning params = {}}
							{pad_option generic_menu_pad_choose_sound}
						]
						replace_handlers
					}
					SetScreenElementProps {
						id = select_skater_hmenu
						event_handlers = [{pad_left generic_menu_scroll_sideways_sound}
							{pad_right generic_menu_scroll_sideways_sound}
							{pad_left menu_horiz_blink_arrow params = {arrow_id = select_skater_left_arrow}}
							{pad_right menu_horiz_blink_arrow params = {arrow_id = select_skater_right_arrow}}
						]
					}
				else
					SetScreenElementProps {
						id = select_skater_hmenu
						event_handlers = [{pad_back generic_menu_pad_back_sound}
							{pad_back select_skater_menu_back params = {callback = create_main_menu}}
							{pad_option ss_overwrite_warning params = {}}
							{pad_option generic_menu_pad_choose_sound}
						]
						replace_handlers
					}
					if GameModeEquals is_career
						if NOT GameModeEquals is_net
							SetScreenElementProps {
								id = select_skater_hmenu
								event_handlers = [{pad_back generic_menu_pad_back_sound}
									{pad_back select_skater_menu_back params = {callback = create_career_options_menu}}
									{pad_option ss_overwrite_warning params = {}}
									{pad_option generic_menu_pad_choose_sound}
								]
								replace_handlers
							}
						endif
					endif
					SetScreenElementProps {
						id = select_skater_hmenu
						event_handlers = [{pad_left generic_menu_scroll_sideways_sound}
							{pad_right generic_menu_scroll_sideways_sound}
							{pad_left menu_horiz_blink_arrow params = {arrow_id = select_skater_left_arrow}}
							{pad_right menu_horiz_blink_arrow params = {arrow_id = select_skater_right_arrow}}
						]
					}
				endif
			else
				SetScreenElementProps {
					id = select_skater_hmenu
					event_handlers = [{pad_back select_skater_menu_back params = {callback = create_options_menu}}]
					replace_handlers
				}
			endif
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = select_skater_top_anchor
			id = select_skater_left_arrow
			texture = left_arrow
			pos = (40.0,30.0)
			just = [right top]
			z_priority = 6
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = select_skater_top_anchor
			id = select_skater_right_arrow
			texture = right_arrow
			pos = (600.0,30.0)
			just = [left top]
			z_priority = 6
		}
		CreateScreenElement {
			Type = ContainerElement
			id = piece_slider_container
			parent = select_skater_top_anchor
			just = [left top]
			pos = (40.0,-340.0)
		}
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			Type = SpriteElement
			id = piece_slider_orange
			parent = piece_slider_container
			dims = (4.0,4.0)
			scale = (27.0,1.39999998)
			rgba = <on_rgba>
			alpha = 1.0
			just = [left top]
			z_priority = 5
		}
		CreateScreenElement {
			Type = SpriteElement
			id = piece_slider_gray
			parent = piece_slider_container
			dims = (4.0,4.0)
			scale = (140.0,2.29999995)
			rgba = [60 60 60 58]
			alpha = 1.0
			just = [left top]
			z_priority = 4
		}
		DoScreenElementMorph id = select_skater_name_2 time = 0.30000001 pos = (230.0,92.0)
		DoScreenElementMorph id = select_skater_name time = 0.30000001 pos = (230.0,102.0)
		DoScreenElementMorph id = select_skater_scrolling_hmenu time = 0.5 pos = (320.0,50.0)
		DoScreenElementMorph id = piece_slider_container time = 0.5 pos = (40.0,15.0)
	endscript
	script ss_overwrite_warning title = 'Load Skater' callback = cas_reset_skater_and_goto_menu
		FireEvent Type = unfocus target = select_skater_hmenu
		create_snazzy_dialog_box {
			title = <title>
			text = 'Warning !\nAny unsaved changes to your current STORY/SKATER will be lost.\nContinue ?'
			text_dims = (400.0,0.0)
			pad_back_script = generic_menu_pad_back
			pad_back_params = {callback = ss_cancel_load_skater}
			buttons = [
				{font = small text = 'No' pad_choose_script = ss_cancel_load_skater}
				{
					font = small text = 'Yes'
					pad_choose_script = launch_load_cas_from_select_sequence
					pad_choose_params =
					{
					}
				}
			]
		}
	endscript
	script ss_cancel_load_skater
		dialog_box_exit
		build_top_and_bottom_blocks
		create_helper_text {helper_text_elements = [{text = "\b6/\b5=Select"}
				{text = "\bm=Accept"}
				{text = "\bn=Back"}
				{text = "\bo=Load Skater"}
			]
		}
		FireEvent Type = focus target = select_skater_hmenu
	endscript
	script menu_horiz_blink_arrow
		TerminateObjectsScripts id = <arrow_id>
		RunScriptOnScreenElement id = <arrow_id> menu_blink_arrow
	endscript
	script back_from_player_two_select
		SetCurrentSkaterProfile 0
		RefreshSkaterModel profile = 0 skater = 0
		launch_select_skater_menu From2p
	endscript
	script select_skater_menu_add_hmenu_items
		rgba = [50 50 50 108]
		if (<is_pro> = 1)
			if GotParam is_secret
				if NOT GetGlobalFlag flag = (<unlock_flag> + 0)
					return
				else
					FormatText ChecksumName = headshot "SS_%n" n = <first_name>
					CreateScreenElement {
						Type = SpriteElement
						parent = select_skater_hmenu
						id = <name>
						texture = <headshot>
						scale = 0.85000002
						rgba = <rgba>
						event_handlers = [{focus select_skater_hmenu_focus params = <...>}
							{unfocus select_skater_hmenu_unfocus}
							{pad_choose select_skater_hmenu_choose params = <...>}
							{pad_start select_skater_hmenu_choose params = <...>}
							{pad_choose generic_menu_pad_choose_sound}
							{pad_start generic_menu_pad_choose_sound}
						]
					}
				endif
			else
				FormatText ChecksumName = headshot "SS_%n" n = <first_name>
				CreateScreenElement {
					Type = SpriteElement
					parent = select_skater_hmenu
					id = <name>
					texture = <headshot>
					scale = 0.85000002
					rgba = <rgba>
					event_handlers = [{focus select_skater_hmenu_focus params = <...>}
						{unfocus select_skater_hmenu_unfocus}
						{pad_choose select_skater_hmenu_choose params = <...>}
						{pad_start select_skater_hmenu_choose params = <...>}
						{pad_choose generic_menu_pad_choose_sound}
						{pad_start generic_menu_pad_choose_sound}
					]
				}
			endif
		else
			if (<name> = custom)
				CreateScreenElement {
					Type = SpriteElement
					parent = select_skater_hmenu
					id = <name>
					texture = ss_cas
					scale = 0.85000002
					rgba = <rgba>
					event_handlers = [{focus select_skater_hmenu_focus params = <...>}
						{unfocus select_skater_hmenu_unfocus}
						{pad_choose select_skater_hmenu_choose params = <...>}
						{pad_start select_skater_hmenu_choose params = <...>}
						{pad_choose generic_menu_pad_choose_sound}
						{pad_start generic_menu_pad_choose_sound}
					]
				}
			endif
		endif
	endscript
	script get_current_skater_display_name
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		return display_name = <display_name>
	endscript
	script select_skater_hmenu_focus
		GetTags
		if levelis load_skateshop
			select_skater_get_current_skater_name
			GetCurrentSkaterProfileIndex
			load_pro_skater {profile = <currentSkaterProfileIndex> skater = 0 <...>}
			GetSkaterProfileInfo player = <currentSkaterProfileIndex>
			if (<name> = ped)
				skater::Obj_SetLightAmbientColor r = 0 g = 0 b = 0
				skater::Obj_SetLightDiffuseColor Index = 0 r = 0 g = 0 b = 0
				skater::Obj_SetLightDiffuseColor Index = 1 r = 0 g = 0 b = 0
				skater::Obj_SetLightAmbientColor r = 0 g = 0 b = 0
				skater::Obj_SetLightDiffuseColor Index = 0 r = 0 g = 0 b = 0
				skater::Obj_SetLightDiffuseColor Index = 1 r = 0 g = 0 b = 0
				if ObjectExists id = TRG_LightController
					kill name = TRG_LightController
				endif
				FakeLights percent = 0 prefix = TRG_LevelLightSS
			else
				skater::Obj_SetLightAmbientColor r = 73 g = 70 b = 80
				skater::Obj_SetLightDiffuseColor Index = 0 r = 110 g = 125 b = 155
				skater::Obj_SetLightDiffuseColor Index = 1 r = 10 g = 3 b = 5
				skater::Obj_SetLightAmbientColor r = 73 g = 70 b = 80
				skater::Obj_SetLightDiffuseColor Index = 0 r = 110 g = 125 b = 155
				skater::Obj_SetLightDiffuseColor Index = 1 r = 10 g = 3 b = 5
				skater::Obj_SetLightDirection Index = 0 heading = skater_select_light0_heading pitch = 350
				skater::Obj_SetLightDirection Index = 1 heading = skater_select_light1_heading pitch = 270
				SetLightDirection Index = 0 heading = skater_select_light0_heading pitch = 350
				SetLightDirection Index = 1 heading = skater_select_light1_heading pitch = 270
				if NOT ObjectExists id = TRG_LightController
					create name = TRG_LightController
				endif
			endif
			StopStream
			MakeSkaterGoto SkateshopAI params = {}
			skater::SwitchOffBoard
			get_current_skater_display_name
			GetUpperCaseString <display_name>
			SetScreenElementProps {
				id = select_skater_name
				text = <UpperCaseString>
				pos = (-350.0,102.0)
			}
			GetUpperCaseString <display_name>
			SetScreenElementProps {
				id = select_skater_name_2
				text = <UpperCaseString>
				pos = (-350.0,102.0)
			}
		endif
		if ObjectExists id = select_skater_name
			DoScreenElementMorph id = select_skater_name_2 time = 0 alpha = 0.0
			DoScreenElementMorph id = select_skater_name time = 0 alpha = 0.0
			DoScreenElementMorph id = select_skater_name_2 time = 0.30000001 pos = (230.0,102.0) alpha = 0.69999999
			DoScreenElementMorph id = select_skater_name time = 0.30000001 pos = (230.0,102.0) alpha = 1.0
		endif
		GetArraySize master_skater_list
		num_profiles = ((<array_size> -1) * 1.0)
		DoScreenElementMorph id = piece_slider_orange time = 0 pos = ((0.0,0.0) + ((<skater_index>) / <num_profiles>) * (450.0,0.0))
		DoScreenElementMorph id = <id> rgba = [100 100 100 128] scale = 1.0
		SetScreenElementProps id = <id> z_priority = 9
		SetScreenElementLock id = <id> off
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			Type = SpriteElement
			parent = <id>
			id = select_skater_highlight_box
			texture = ss_highlightbox
			rgba = <on_rgba>
			just = [center center]
			pos = (24.0,31.0)
			z_priority = 10
		}
		KillSpawnedScript name = highlight_box_pulse
		RunScriptOnScreenElement id = select_skater_highlight_box highlight_box_pulse params = {id = select_skater_highlight_box}
		if ObjectExists id = stats_block_anchor
			DestroyScreenElement id = stats_block_anchor
		endif
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		stats_menu_create_stats_block {
			parent = stats_block_anchor_parent
			id = stats_block_anchor
			not_focusable
			on = on
			scale = 0.85000002
			pos = (0.0,145.0)
		}
		AssignAlias id = select_skater_hmenu alias = current_menu
		if isxbox
			SpawnScript TemporarilyDisableInput params = {time = 100}
		endif
	endscript
	script highlight_box_pulse
		while
			DoScreenElementMorph id = <id> time = 0.03 scale = (1.07000005,1.04999995)
			Wait 0.2 second
			DoScreenElementMorph id = <id> time = 0.03 scale = (1.10000002,1.07000005)
			Wait 0.2 second
		repeat
	endscript
	script select_skater_get_current_skater_name
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		return current_skater = <name>
	endscript
	script select_skater_hmenu_unfocus
		GetTags
		generic_menu_pad_up_down_sound
		DoScreenElementMorph id = <id> rgba = [50 50 50 128] scale = 0.85000002
		SetScreenElementProps id = <id> z_priority = 7
		if ScreenElementExists id = {<id> child = 0}
			DestroyScreenElement id = {<id> child = 0}
		endif
		skater::reset_model_lights
	endscript
	script select_skater_hmenu_choose
		GetCurrentSkaterProfileIndex
		if ControllerBoundToDifferentSkater controller = <device_num> skater = <currentSkaterProfileIndex>
			return
		endif
		if levelis load_skateshop
			if (<name> = ped)
				if NOT GotParam choose_ped
					goto MakeSelectPedMenu params = {ped_info = <...>}
				endif
			endif
		endif
		FireEvent Type = unfocus target = select_skater_hmenu
		KillSpawnedScript name = highlight_box_pulse
		GetSkaterId
		if ObjectExists id = select_skater_name
			DoScreenElementMorph id = select_skater_name_2 time = 0.30000001 pos = (-230.0,92.0)
			DoScreenElementMorph id = select_skater_name time = 0.30000001 pos = (-230.0,102.0)
		endif
		DoScreenElementMorph id = select_skater_scrolling_hmenu time = 0.5 pos = (320.0,-250.0)
		DoScreenElementMorph id = piece_slider_container time = 0.5 pos = (40.0,-215.0)
		DoScreenElementMorph id = stats_block_anchor_parent time = 0.5 pos = (-40.0,620.0)
		Wait 0.30000001 seconds
		if ObjectExists id = select_skater_anchor
			DestroyScreenElement id = select_skater_anchor
			restore_start_key_binding
		endif
		if levelis load_skateshop
			GetSkaterId
			switch <name>
				case Iron_Man
					if NOT (current_theme_prefix = 12)
						set_current_theme theme_num = 12 dont_keep_it story_swap
					endif
				case Gene
					if NOT (current_theme_prefix = 11)
						set_current_theme theme_num = 11 dont_keep_it story_swap
					endif
				case creature
					if NOT (current_theme_prefix = 13)
						set_current_theme theme_num = 13 dont_keep_it story_swap
					endif
			endswitch
			maybe_revert_theme
			if GotParam device_num
				<controller_index> = <device_num>
			else
				<controller_index> = <controller>
			endif
			BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <controller_index>
			BindFrontEndToController front_end_pad = <currentSkaterProfileIndex> controller = <controller_index>
			StopStream
			skater::Obj_MoveToNode name = trg_playerrestart Orient NoReset
			skater::CancelRotateDisplay
			skater::reset_model_lights
			GetCurrentSkaterProfileIndex
			skater::Obj_SpawnScript SkateshopGO
			if InSplitScreenGame
				launch_ss_menu <...>
			else
				launch_ss_menu
			endif
		else
			if NOT GoalManager_HasActiveGoals
				GoalManager_ShowGoalPoints
			endif
			select_skater_get_current_skater_name
			if NOT (<current_skater> = <name>)
				GetCurrentSkaterProfileIndex
				load_pro_skater {profile = <currentSkaterProfileIndex> skater = 0 <...>}
			endif
			GoalManager_ShowPoints
			GoalManager_ReplaceTrickText all
			exit_pause_menu
		endif
		skater::SetTags stopskateshopstreams = 1
	endscript
	script MakeSelectPedMenu dims = (300.0,150.0) pos = (220.0,-10.0) menu_id = sub_menu vmenu_id = sub_vmenu
		FireEvent Type = unfocus target = select_skater_hmenu
		SetScreenElementLock id = root_window off
		change widest_menu_item_width = 0
		CreateScreenElement {
			Type = ContainerElement
			parent = root_window
			id = ped_menu_parts_anchor
			dims = (640.0,150.0)
			pos = (320.0,240.0)
		}
		skater::Obj_SetLightAmbientColor r = 73 g = 70 b = 80
		skater::Obj_SetLightDiffuseColor Index = 0 r = 110 g = 125 b = 155
		skater::Obj_SetLightDiffuseColor Index = 1 r = 10 g = 3 b = 5
		skater::Obj_SetLightAmbientColor r = 73 g = 70 b = 80
		skater::Obj_SetLightDiffuseColor Index = 0 r = 110 g = 125 b = 155
		skater::Obj_SetLightDiffuseColor Index = 1 r = 10 g = 3 b = 5
		skater::Obj_SetLightDirection Index = 0 heading = skater_select_light0_heading pitch = 350
		skater::Obj_SetLightDirection Index = 1 heading = skater_select_light1_heading pitch = 270
		SetLightDirection Index = 0 heading = skater_select_light0_heading pitch = 350
		SetLightDirection Index = 1 heading = skater_select_light1_heading pitch = 270
		if NOT ObjectExists id = TRG_LightController
			create name = TRG_LightController
		endif
		Type = VScrollingMenu
		scrolling_menu_id = sub_scrolling_menu
		make_new_menu {
			pos = <pos>
			parent = ped_menu_parts_anchor
			internal_just = [left center]
			menu_id = <menu_id>
			vmenu_id = <vmenu_id>
			scrolling_menu_id = <scrolling_menu_id>
			Type = <Type>
			dims = <dims>
			dont_allow_wrap = <dont_allow_wrap>
			<no_menu_title>
		}
		DoScreenElementMorph id = <menu_id> time = 0 pos = (310.0,620.0)
		AssignAlias id = ped_menu_parts_anchor alias = current_menu_anchor
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_back BackFromPedMenu}
				{pad_up set_which_arrow params = {arrow = scrolling_menu_up_arrow}}
				{pad_down set_which_arrow params = {arrow = scrolling_menu_down_arrow}}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		GetArraySize ped_profile_list
		<Index> = 0
		while
			if GetGlobalFlag flag = ((ped_profile_list[<Index>]).ped_group_flag)
				theme_menu_add_item {text = ((ped_profile_list[<Index>]).display_name)
					focus_script = PedFocus
					focus_params = {appearance = ((ped_profile_list[<Index>]).ped_appearance_structure)}
					pad_choose_script = PedChoose
					pad_choose_params = {info = <ped_info>}
					centered
					highlight_bar_scale = (1.70000005,0.69999999)
					no_bg
				}
			else
				if GetGlobalFlag flag = GOT_ALL_GAPS
					theme_menu_add_item {text = ((ped_profile_list[<Index>]).display_name)
						focus_script = PedFocus
						focus_params = {appearance = ((ped_profile_list[<Index>]).ped_appearance_structure)}
						pad_choose_script = PedChoose
						pad_choose_params = {info = <ped_info>}
						centered
						highlight_bar_scale = (1.70000005,0.69999999)
						no_bg
					}
				endif
			endif
			<Index> = (<Index> + 1)
		repeat <array_size>
		theme_menu_add_item {text = "Done"
			pad_choose_script = BackFromPedMenu
			centered
			highlight_bar_scale = (1.70000005,0.69999999)
			no_bg
		}
		finish_themed_scrolling_menu pos = (310.0,0.0) bg_width = 1.39999998
		DoScreenElementMorph id = bg_box_vmenu pos = (310.0,-10.0)
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		DoScreenElementMorph id = scrolling_menu_up_arrow time = 0 rgba = <on_rgba>
		DoScreenElementMorph id = scrolling_menu_down_arrow time = 0 rgba = <on_rgba>
		SetScreenElementLock id = ped_menu_parts_anchor off
		create_helper_text generic_helper_text parent = ped_menu_parts_anchor helper_pos = (320.0,261.0)
		SetScreenElementLock id = ped_menu_parts_anchor on
	endscript
	script PedChoose
		GetCurrentSkaterProfileIndex
		if ControllerBoundToDifferentSkater controller = <device_num> skater = <currentSkaterProfileIndex>
			return
		endif
		if ObjectExists id = ped_menu_parts_anchor
			DestroyScreenElement id = ped_menu_parts_anchor
		endif
		select_skater_hmenu_choose <info> choose_ped
	endscript
	script PedFocus
		main_theme_focus
		GetCurrentSkaterProfileIndex
		SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = <appearance>
		SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1
		EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = board desc_id = #"Default"}
		EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = {part = ped_board}
		RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = <controller> no_board = no_board
		current_menu::GetTags
		if GotParam arrow_id
			FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
			menu_vert_blink_arrow id = <arrow_id> rgba = <on_rgba>
		endif
	endscript
	script BackFromPedMenu
		if ObjectExists id = ped_menu_parts_anchor
			DestroyScreenElement id = ped_menu_parts_anchor
		endif
		SetScreenElementLock id = select_skater_anchor off
		create_helper_text {helper_text_elements = [{text = "\b6/\b5=Select"}
				{text = "\bm=Accept"}
				{text = "\bn=Back"}
				{text = "\bo=Load Skater"}
			]
			parent = select_skater_anchor
		}
		SetScreenElementLock id = select_skater_anchor on
		Debounce X time = 0.5
		FireEvent Type = focus target = select_skater_hmenu data = {child_id = 19}
		AssignAlias id = select_skater_anchor alias = current_menu_anchor
	endscript
	script SkateshopGO
		Wait 0.18000001 seconds
		PlaySkaterStream Type = "SSGo"
	endscript
	script load_second_skater_profile
		printf "REFRESHING SKATER MODEL"
		SetCurrentSkaterProfile 1
		RefreshSkaterModel profile = 1 skater = 0
		SyncPlayer2Profile
	endscript
	script select_skater_menu_back
		if IsInternetGameHost
			QuitGame
			return
		endif
		if IsJoiningInternetGame
			QuitGame
			return
		endif
		KillSpawnedScript name = highlight_box_pulse
		if ObjectExists id = select_skater_anchor
			DestroyScreenElement id = select_skater_anchor
			restore_start_key_binding
		endif
		skater::Obj_MoveToNode name = trg_playerrestart Orient NoReset
		skater::CancelRotateDisplay
		skater::SetTags stopskateshopstreams = 1
		<callback> from_skater_select
	endscript
	script select_skater_menu_animate_top
		PlaySound DE_MenuFlyUp
		DoMorph pos = {(0.0,-120.0) relative} alpha = 0
		DoMorph time = 0.2 pos = {(0.0,120.0) relative} alpha = 1
	endscript
	script select_skater_menu_animate_stats
		FireEvent Type = select_skater_menu_animate_stats_done
	endscript
	script select_skater_menu_animate_bottom
		DoMorph pos = {(0.0,140.0) relative} alpha = 0
		DoMorph time = 0.40000001
		DoMorph time = 0.2 pos = {(0.0,-138.0) relative} alpha = 1
	endscript
	script menu_blink_arrow
		DoMorph alpha = 0
		Wait 100
		DoMorph time = 0.30000001 alpha = 1
	endscript
	script blink_arrow
		DoScreenElementMorph id = <id> alpha = 0
		Wait 100
		DoScreenElementMorph id = <id> time = 0.30000001 alpha = 1
	endscript
	script set_which_arrow
		SetTags arrow_id = <arrow>
	endscript
	script menu_vert_blink_arrow menu_id = current_menu rgba = [128 128 128 128]
		if NOT ObjectExists id = <id>
			printf "bad arrow id"
			return
		endif
		TerminateObjectsScripts id = <id>
		DoScreenElementMorph {
			id = <id>
			alpha = 1
		}
		Wait 1 gameframe
		if NOT ((MenuSelectedIndexIs id = <menu_id> first) || (MenuSelectedIndexIs id = <menu_id> last))
			SetScreenElementProps {id = <id> rgba = <rgba>}
			RunScriptOnScreenElement id = <id> menu_blink_arrow
		endif
	endscript
	script draw_menu_box delta_pos = (100.0,30.0) middle_repeat = 7 scale = (1.0,1.0) box_right_scale = (0.80000001,0.625) box_bottom_scale = (0.95999998,1.0) box_right_offset = (-20.0,0.0) current_menu_anchor = current_menu_anchor
		GetStackedScreenElementPos X id = <current_menu_anchor>
		CreateScreenElement {
			Type = SpriteElement
			parent = <current_menu_anchor>
			id = menu_box_top
			texture = level_top_piece
			pos = ((230.0,100.0) + <delta_pos>)
			rgba = [128 128 128 80]
			scale = <scale>
			just = [center top]
			z_priority = 0
		}
		while
			GetStackedScreenElementPos Y id = <id>
			CreateScreenElement {
				Type = SpriteElement
				parent = <current_menu_anchor>
				texture = level_repeat_mid
				pos = <pos>
				scale = <scale>
				rgba = [128 128 128 80]
				just = [left top]
				z_priority = 0
			}
		repeat <middle_repeat>
		GetStackedScreenElementPos Y id = <id>
		CreateScreenElement {
			Type = SpriteElement
			parent = <current_menu_anchor>
			texture = level_bottom_piece
			pos = <pos>
			rgba = [128 128 128 80]
			scale = <box_bottom_scale>
			just = [left top]
			z_priority = 0
		}
		GetStackedScreenElementPos X id = menu_box_top offset = <box_right_offset>
		CreateScreenElement {
			Type = SpriteElement
			parent = <current_menu_anchor>
			texture = goal_right
			scale = <box_right_scale>
			rgba = [128 128 128 80]
			pos = <pos>
			just = [left top]
			z_priority = 0
		}
	endscript
	script launch_park_editor
		SetGameType creategoals
		SetCurrentGameType
		SetParkName ""
		BindParkEditorToController <device_num>
		GetCurrentSkaterProfileIndex
		BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <device_num>
		BindFrontEndToController front_end_pad = <currentSkaterProfileIndex> controller = <device_num>
		main_menu_play_level level = load_Sk5Ed
	endscript
	script main_menu_play_level
		main_menu_exit new_menu_script = main_menu_play_level2 kill_clouds <...>
	endscript
	script main_menu_play_level2
		load_mainmenu_textures_to_main_memory unload
		restore_start_key_binding
		skater::reset_model_lights
		change_level level = <level>
	endscript
	script leave_front_end
		restore_start_key_binding
		load_mainmenu_textures_to_main_memory unload
	endscript
	script spawn_two_player
		Cleanup preserve_skaters
		LeaveServer
		FlushDeadObjects
		InitSkaterHeaps
		SetServerMode
		StartServer
		SetJoinMode JOIN_MODE_PLAY
		JoinServer
		while
			if JoinServerComplete
				break
			else
				Wait 1
			endif
		repeat
		ScreenElementSystemCleanup
	endscript
	script launch_two_player
		SetCurrentSkaterProfile 0
		RefreshSkaterModel profile = 0 skater = 0
		SetMenuPadMappings[active
			use_as_first
		]
		SpawnScript spawn_two_player NotSessionSpecific = 1
	endscript
	script enable_two_player_option
		if ObjectExists id = main_menu_2_player_option
			main_menu_2_player_option::GetTags
			if GotParam tag_not_focusable
				main_vmenu::GetTags
				if GotParam tag_selected_id
					if (<tag_selected_id> = main_menu_2_player_option)
						SetScreenElementProps {
							id = {main_menu_2_player_option child = 0}
							rgba = [127 123 0 100]
							z_priority = 4
							focusable
						}
					else
						FormatText ChecksumName = rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
						SetScreenElementProps {
							id = {main_menu_2_player_option child = 0}
							rgba = <rgba>
							focusable
						}
					endif
					SetScreenElementProps {
						id = main_menu_2_player_option
						focusable
					}
				endif
			endif
		endif
	endscript
	script disable_two_player_option
		if ObjectExists id = main_menu_2_player_option
			main_menu_2_player_option::GetTags
			if NOT GotParam tag_not_focusable
				main_vmenu::GetTags
				if GotParam tag_selected_id
					if (<tag_selected_id> = main_menu_2_player_option)
						FireEvent Type = pad_up target = current_menu
					endif
				endif
				SetScreenElementProps {
					id = {main_menu_2_player_option child = 0}
					rgba = [60 60 60 75]
					not_focusable
				}
				SetScreenElementProps {
					id = main_menu_2_player_option
					not_focusable
				}
			endif
		endif
	endscript
	script enable_system_link_option
		if ObjectExists id = mm_multi_play
			mm_multi_play::GetTags
			if GotParam tag_not_focusable
				main_vmenu::GetTags
				if GotParam tag_selected_id
					if (<tag_selected_id> = mm_multi_play)
						SetScreenElementProps {
							id = {mm_multi_play child = 0}
							rgba = [127 123 0 100]
							z_priority = 4
							focusable
						}
					else
						FormatText ChecksumName = text_color "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
						text_rgba = <text_color>
						SetScreenElementProps {
							id = {mm_multi_play child = 0}
							rgba = <text_rgba>
							focusable
						}
					endif
					SetScreenElementProps {
						id = mm_multi_play
						focusable
					}
				endif
			endif
		endif
	endscript
	script disable_system_link_option
		if ObjectExists id = mm_multi_play
			mm_multi_play::GetTags
			if NOT GotParam tag_not_focusable
				main_vmenu::GetTags
				if GotParam tag_selected_id
					if (<tag_selected_id> = mm_multi_play)
						FireEvent Type = pad_up target = current_menu
					endif
				endif
				SetScreenElementProps {
					id = {mm_multi_play child = 0}
					rgba = [60 60 60 75]
					not_focusable
				}
				SetScreenElementProps {
					id = mm_multi_play
					not_focusable
				}
			endif
		endif
	endscript
	script make_mainmenu_clouds
		if NOT ScreenElementExists id = cloud_anchor
			CreateScreenElement {
				Type = ContainerElement
				parent = root_window
				id = cloud_anchor
				dims = (640.0,480.0)
				pos = (320.0,240.0)
			}
			CreateScreenElement {
				Type = SpriteElement
				parent = cloud_anchor
				id = clouds1
				texture = mm_clouds
				just = [left top]
				pos = (200.0,70.0)
				scale = (4.0,0.64999998)
				z_priority = -4
				alpha = 0.1
			}
			GetStackedScreenElementPos X id = clouds1
			CreateScreenElement {
				Type = SpriteElement
				parent = cloud_anchor
				id = clouds2
				texture = mm_clouds
				just = [left top]
				pos = <pos>
				scale = (4.0,0.64999998)
				z_priority = -4
				alpha = 0.05
			}
			GetStackedScreenElementPos X id = clouds2
			CreateScreenElement {
				Type = SpriteElement
				parent = cloud_anchor
				id = clouds3
				texture = mm_clouds
				just = [left top]
				pos = <pos>
				scale = (4.0,0.64999998)
				z_priority = -4
				alpha = 0.05
			}
			RunScriptOnScreenElement id = clouds1 check_for_building
			RunScriptOnScreenElement id = clouds1 move_mainmenu_clouds params = {id = clouds1}
			RunScriptOnScreenElement id = clouds2 move_mainmenu_clouds params = {id = clouds2}
			RunScriptOnScreenElement id = clouds3 move_mainmenu_clouds params = {id = clouds3}
		endif
	endscript
	script move_mainmenu_clouds time = 35 start_x = 718 end_x = -50
		GetScreenElementPosition id = <id>
		initial_x = (<ScreenElementPos>.(1.0,0.0))
		initial_y = (<ScreenElementPos>.(0.0,1.0))
		start_pos = ((<start_x> * (1.0,0.0)) + ((0.0,1.0) * <initial_y>))
		end_pos = ((<end_x> * (1.0,0.0)) + ((0.0,1.0) * <initial_y>))
		initial_time = ((<initial_x> - <end_x>) / ((<start_x> - <end_x>) / <time>))
		DoScreenElementMorph id = <id> pos = <end_pos> time = <initial_time>
		Wait <initial_time> seconds
		while
			DoScreenElementMorph id = <id> pos = <start_pos>
			DoScreenElementMorph id = <id> pos = <end_pos> time = <time>
			Wait <time> seconds
		repeat
	endscript
	script check_for_building
		while
			if NOT ScreenElementExists id = mm_building
				DestroyScreenElement id = cloud_anchor
				break
			else
				Wait 1 gameframe
			endif
		repeat
	endscript
	attract_mode_movies = [
		"movies\demo_1"
		"movies\demo_2"
		"movies\demo_3"
	] 
