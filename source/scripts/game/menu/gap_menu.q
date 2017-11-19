
	script launch_gap_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		create_gap_menu <...>
	endscript
	script create_gap_menu back_script = gap_menu_exit_to_pause_menu choose_script = nullscript
		GoalManager_HidePoints
		GoalManager_HideGoalPoints
		hide_current_goal
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = gap_anchor
			dims = (640.0,480.0)
			pos = (320.0,240.0)
		}
		AssignAlias id = gap_anchor alias = current_menu_anchor
		create_helper_text {helper_text_elements = [{text = "\b7/\b4 = Select"}
				{text = "\bn = Back"}
			]
		}
		kill_start_key_binding
		FormatText ChecksumName = title_icon "%i_gap" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_sub_title title = "GAP CHECKLIST" title_icon = <title_icon>
		FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_box_icons icon_texture = <paused_icon>
		build_grunge_piece
		build_top_bar pos = (0.0,62.0)
		CreateScreenElement {
			type = ContainerElement
			parent = gap_anchor
			id = gap_menu
			dims = (640.0,480.0)
			pos = (320.0,640.0)
		}
		AssignAlias id = gap_menu alias = current_menu_anchor
		theme_background width = 6.3499999 pos = (320.0,85.0) num_parts = 10.5
		<root_pos> = (80.0,25.0)
		FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = view_gaps_menu_top_bar
			texture = black
			rgba = [0 0 0 85]
			scale = (130.0,7.0)
			pos = (65.0,87.0)
			just = [left top]
			z_priority = 2
		}
		GetStackedScreenElementPos Y id = <id> offset = (6.0,-25.0)
		CreateScreenElement {
			type = TextElement
			parent = current_menu_anchor
			font = dialog
			text = "Score"
			rgba = <text_rgba>
			scale = 1
			pos = <pos>
			just = [left top]
			z_priority = 3
		}
		GetStackedScreenElementPos X id = <id> offset = (15.0,0.0)
		CreateScreenElement {
			type = TextElement
			parent = current_menu_anchor
			font = dialog
			text = "Name"
			rgba = <text_rgba>
			pos = <pos>
			just = [left top]
			scale = 1
			z_priority = 3
		}
		GetStackedScreenElementPos X id = <id> offset = (115.0,0.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = view_gaps_menu_up_arrow
			texture = up_arrow
			rgba = [128 128 128 85]
			pos = <pos>
			just = [left top]
			z_priority = 3
		}
		GetStackedScreenElementPos X id = <id> offset = (168.0,0.0)
		CreateScreenElement {
			type = TextElement
			parent = current_menu_anchor
			font = dialog
			text = "Times"
			rgba = <text_rgba>
			pos = <pos>
			just = [left top]
			scale = 1
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = view_gaps_menu_top_bar offset = (60.0,0.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			texture = black
			scale = (2.0,68.0)
			pos = <pos>
			just = [left top]
			rgba = [0 0 0 0]
		}
		GetStackedScreenElementPos X id = <id> offset = (355.0,0.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			texture = black
			scale = (2.0,68.0)
			pos = <pos>
			just = [left top]
			rgba = [0 0 0 0]
		}
		GetStackedScreenElementPos Y id = view_gaps_menu_top_bar offset = (0.0,250.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			texture = black
			rgba = [0 0 0 0]
			scale = (124.0,6.0)
			pos = <pos>
			just = [left top]
			z_priority = 2
		}
		GetStackedScreenElementPos Y id = view_gaps_menu_up_arrow offset = (0.0,260.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = view_gaps_menu_down_arrow
			texture = down_arrow
			rgba = [128 128 128 85]
			pos = <pos>
			just = [left top]
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = view_gaps_menu_top_bar offset = (20.0,5.0)
		CreateScreenElement {
			type = VScrollingMenu
			parent = current_menu_anchor
			dims = (640.0,245.0)
			pos = <pos>
			just = [left top]
			internal_just = [center top]
		}
		CreateScreenElement {
			type = VMenu
			parent = <id>
			id = gap_vmenu
			pos = (0.0,0.0)
			just = [left top]
			internal_just = [left top]
			dont_allow_wrap
			event_handlers = [
				{pad_up set_which_arrow params = {arrow = view_gaps_menu_up_arrow}}
				{pad_down set_which_arrow params = {arrow = view_gaps_menu_down_arrow}}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back generic_menu_pad_back_sound}
			]
		}
		AssignAlias id = gap_vmenu alias = current_menu
		SetScreenElementProps {
			id = current_menu
			event_handlers = [{pad_back generic_menu_pad_back params = {callback = <back_script>}}]
		}
		AddGapsToMenu initial_scale = 0.80000001 choose_script = <choose_script>
		DoScreenElementMorph id = current_menu_anchor pos = (320.0,240.0) time = 0.2
		FireEvent type = focus target = current_menu
	endscript
	script gap_menu_add_item choose_script = nullscript
		FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = text_rgba2 "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if GotParam first_item
			focus_params = {first_item}
		else
			if GotParam last_item
				focus_params = {last_item}
			endif
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = current_menu
			dims = (200.0,20.0)
			event_handlers = [{focus gap_menu_focus params = {<focus_params> times = <times>}}
				{unfocus gap_menu_unfocus params = {times = <times>}}
				{focus gap_menu_focus_show_gap params = <...>}
				{pad_choose <choose_script> params = {gap_number = <gap_number> times = <times>}}
			]
		}
		<anchor_id> = <id>
		if (<times> > 0)
			rgba = <text_rgba>
			alpha = 1.0
		else
			rgba = <text_rgba>
			alpha = 0.40000001
		endif
		FormatText TextName = gap_score "%i" i = <gap_score>
		CreateScreenElement {
			type = TextElement
			parent = <anchor_id>
			font = small
			text = <gap_score>
			pos = (13.0,0.0)
			just = [center top]
			rgba = <rgba>
			alpha = <alpha>
			scale = 0.80000001
		}
		CreateScreenElement {
			type = TextElement
			parent = <anchor_id>
			font = small
			text = <gap_name>
			pos = (55.0,0.0)
			just = [left top]
			rgba = <rgba>
			alpha = <alpha>
			scale = 0.80000001
		}
		if (<times> > 99999)
			<times> = 99999
		endif
		FormatText TextName = times "%i" i = <times>
		CreateScreenElement {
			type = TextElement
			parent = <anchor_id>
			font = small
			text = <times>
			pos = (444.0,0.0)
			just = [center top]
			rgba = <rgba>
			alpha = <alpha>
			scale = 0.80000001
		}
		highlight_angle = RandomNoRepeat(@2 @-2 @3 @-3 @3.5 @-3 @5 @-4 @2.5 @-4.5)
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = de_highlight_bar
			pos = (232.0,10.0)
			just = [center center]
			rgba = [0 0 0 0]
			z_priority = 3
			scale = (4.0999999,0.69999999)
			rot_angle = (<highlight_angle> / 4)
		}
	endscript
	script gap_menu_focus_show_gap
		if (<times> > 0)
			menu_cam::UnPause
			menu_cam::Obj_SetPosition position = (<skater_start_pos> + (0.0,80.0,0.0))
			dir_x = (<skater_start_dir>.(-1.0,0.0,0.0))
			dir_y = 0.1
			dir_z = (<skater_start_dir>.(0.0,0.0,-1.0))
			dir = (<dir_x> * (1.0,0.0,0.0) + <dir_y> * (0.0,1.0,0.0) + <dir_z> * (0.0,0.0,1.0))
			menu_cam::Obj_SetOrientation dir = <dir>
			SetActiveCamera id = menu_cam
		else
			restore_skater_camera
		endif
	endscript
	script skip_to_selected_gap
	endscript
	script preview_gap
		SetProps rgba = [127 102 0 100]
		DoMorph time = 0.1 scale = 0.85000002
		GetTags
	endscript
	script gap_menu_focus
		GetTags
		FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if (<times> > 0)
			rgba = <text_rgba>
		else
			rgba = <text_rgba>
		endif
		RunScriptOnScreenElement id = {<id> child = 0} text_twitch_effect2
		DoScreenElementMorph {
			id = {<id> child = 0}
			rgba = <rgba>
			scale = 1.0
		}
		RunScriptOnScreenElement id = {<id> child = 1} text_twitch_effect2
		DoScreenElementMorph {
			id = {<id> child = 1}
			rgba = <rgba>
			scale = 1.0
		}
		RunScriptOnScreenElement id = {<id> child = 2} text_twitch_effect2
		DoScreenElementMorph {
			id = {<id> child = 2}
			rgba = <rgba>
			scale = 1.0
		}
		FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		SetScreenElementProps {
			id = {<id> child = 3}
			rgba = <bar_rgba>
		}
		if GotParam first_item
			SetScreenElementProps {
				id = view_gaps_menu_up_arrow
				rgba = [128 128 128 0]
			}
		else
			SetScreenElementProps {
				id = view_gaps_menu_up_arrow
				rgba = [128 128 128 85]
			}
		endif
		if GotParam last_item
			SetScreenElementProps {
				id = view_gaps_menu_down_arrow
				rgba = [128 128 128 0]
			}
		else
			SetScreenElementProps {
				id = view_gaps_menu_down_arrow
				rgba = [128 128 128 85]
			}
		endif
		gap_vmenu::GetTags
		if GotParam arrow_id
			menu_vert_blink_arrow {id = <arrow_id>}
		endif
	endscript
	script gap_menu_unfocus
		GetTags
		FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		KillSpawnedScript name = text_twitch_effect2
		if (<times> > 0)
			rgba = <text_rgba>
		else
			rgba = <text_rgba>
		endif
		DoScreenElementMorph {
			id = {<id> child = 0}
			rgba = <rgba>
			scale = 0.80000001
		}
		DoScreenElementMorph {
			id = {<id> child = 1}
			rgba = <rgba>
			scale = 0.80000001
		}
		DoScreenElementMorph {
			id = {<id> child = 2}
			rgba = <rgba>
			scale = 0.80000001
		}
		SetScreenElementProps {
			id = {<id> child = 3}
			rgba = [0 0 0 0]
		}
	endscript
	script gap_menu_exit_to_pause_menu
		GoalManager_ShowPoints
		if NOT GoalManager_HasActiveGoals
			GoalManager_ShowGoalPoints
		endif
		restore_skater_camera
		restore_start_key_binding
		AssignAlias id = gap_anchor alias = current_menu_anchor
		create_pause_menu
	endscript
	script got_all_gaps_screen_create
		GetCurrentLevel
		switch <level>
			case load_skateshop
			case load_cas
			case load_boardshop
			case load_sk5ed
			case load_sk5ed_gameplay
				return
		endswitch
		if GetGlobalFlag flag = GOT_ALL_GAPS
		endif
		SetGlobalFlag flag = GOT_ALL_GAPS
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
		if NOT InNetGame
			PauseGame
		endif
		StopStream
		PlayStream FoundAllGaps vol = 150
		create_dialog_box {title = "Holy Crap! All Gaps!"
			text = "Did you use a strategy guide? Online cheat site? No? You found them legit? Well hell, you should come hang with us. Just don't knock your own teeth out. \n\nYou've unlocked:\n\c3- 26 selectable skaters!\n (ok, so they're just pedestrians, but hey, they're pretty damn cool)."
			pos = (310.0,240.0)
			just = [center center]
			text_rgba = [88 105 112 128]
			text_dims = (330.0,0.0)
			style = special_dialog_style
			pad_back_script = <back_script>
			buttons = [{font = small text = "OK" pad_choose_script = got_all_gaps_screen_exit}]
			delay_input
		}
	endscript
	script got_all_gaps_screen_exit
		dialog_box_exit
		UnPauseGame
	endscript
	script got_gap_for_first_time
		printf <gap_text>
		if GotParam multiple_new_gaps
			FormatText TextName = text "Found Gaps:"
			SetScreenElementProps id = first_time_goal_info_title text = <text>
			if (<multiple_new_gaps> < 9)
				CreateScreenElement {
					type = TextElement
					parent = first_time_goal_info
					font = small
					text = <gap_text>
					pos = ((0.0,20.0) * <multiple_new_gaps>)
					just = [center center]
					internal_just = [center center]
					line_spacing = 0.80000001
					rgba = [20 98 114 108]
					allow_expansion
					z_priority = -5
				}
			else
				if (<multiple_new_gaps> = 9)
					CreateScreenElement {
						type = TextElement
						parent = first_time_goal_info
						font = small
						text = "..."
						pos = ((0.0,20.0) * <multiple_new_gaps>)
						just = [center center]
						internal_just = [center center]
						line_spacing = 0.80000001
						rgba = [20 98 114 108]
						allow_expansion
						z_priority = -5
					}
				endif
			endif
		else
			SetScreenElementLock id = root_window off
			if ObjectExists id = first_time_goal_info
				DestroyScreenElement id = first_time_goal_info
			else
				SpawnSound found_gap_success_sound
			endif
			CreateScreenElement {
				type = ContainerElement
				parent = root_window
				id = first_time_goal_info
				pos = (320.0,0.0)
				dims = (0.0,0.0)
				just = [center center]
				internal_just = [center center]
			}
			CreateScreenElement {
				type = TextElement
				parent = first_time_goal_info
				id = first_time_goal_info_title
				font = small
				text = "Found Gap: "
				pos = (0.0,0.0)
				just = [center center]
				internal_just = [center center]
				line_spacing = 0.80000001
				rgba = [20 98 114 108]
				allow_expansion
				z_priority = -5
			}
			CreateScreenElement {
				type = TextElement
				parent = first_time_goal_info
				font = small
				text = <gap_text>
				pos = (0.0,20.0)
				just = [center center]
				internal_just = [center center]
				line_spacing = 0.80000001
				rgba = [20 98 114 108]
				allow_expansion
				z_priority = -5
			}
			RunScriptOnScreenElement id = first_time_goal_info goal_message_got_gap params = <...>
		endif
	endscript
