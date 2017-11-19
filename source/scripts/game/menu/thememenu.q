
	theme_menu_bg_parts_height = 23
	script set_theme_icons
		FormatText ChecksumName = continue_icon "%i_continue" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = options_icon "%i_options" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = level_icon "%i_level" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = save_icon "%i_save" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = replay_icon "%i_replay" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = end_icon "%i_end" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = gap_icon "%i_gap" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = quit_icon "%i_quit" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = model_icon "%i_model" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = retry_icon "%i_retry" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = view_icon "%i_view" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = stats_icon "%i_stats" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = split_icon "%i_split" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = back_icon "%i_back" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = load_icon "%i_load" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = new_icon "%i_new" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = special_icon "%i_special" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = name_cat_icon "%i_name_cat" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = career_ops_icon "%i_career_ops" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = edit_skater_icon "%i_edit_skater" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = skateshop_icon "%i_skateshop" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = cheats_icon "%i_cheats" i = (THEME_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = online_icon "%i_online" i = (THEME_PREFIXES[current_theme_prefix])
		return <...>
	endscript
	script build_pause_menu_parts
		FormatText ChecksumName = paused_piece "%i_paused_piece" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
		build_grunge_piece pos = (0.0,240.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = paused_piece
			texture = <paused_piece>
			pos = (-200.0,70.0)
			rgba = [128 128 128 108]
			just = [center center]
			scale = (1.10000002,1.14999998)
			alpha = 0
			z_priority = 2
			rot_angle = 40
		}
		if (inside_pause = 0)
			change inside_pause = 1
			PlaySound DE_MenuFlyUp vol = 100
			PlaySound DE_PauseFlyIn vol = 100
			DoScreenElementMorph scale = 1 time = 0 id = pause_menu
			DoScreenElementMorph id = pause_menu time = 0.2 pos = (320.0,255.0)
			FireEvent type = focus target = pause_menu
			SetScreenElementProps id = root_window tags = {menu_state = on}
			if ScreenElementExists id = grunge_anchor
				DoScreenElementMorph id = grunge_anchor time = 0.34999999 pos = (320.0,240.0)
				wait 0.2 seconds
			endif
			if ScreenElementExists id = paused_piece
				DoScreenElementMorph id = paused_piece time = 0.25 pos = (172.0,90.0) rot_angle = -9 alpha = 1
				if GotParam show_deck
					pause_show_deck parent = current_menu_anchor
				endif
				if ScreenElementExists id = music_track_anchor
					DoScreenElementMorph id = music_track_anchor time = 0.25 pos = (575.0,320.0)
				endif
				wait 0.30000001 seconds
			endif
		else
			DoScreenElementMorph id = grunge_anchor time = 0 pos = (320.0,240.0)
			DoScreenElementMorph id = paused_piece time = 0 pos = (172.0,90.0) rot_angle = -9 alpha = 1
			DoScreenElementMorph scale = 1 time = 0 id = pause_menu
			DoScreenElementMorph id = pause_menu time = 0 pos = (320.0,255.0)
			if GotParam show_deck
				pause_show_deck parent = current_menu_anchor no_slide
			endif
			if ScreenElementExists id = music_track_anchor
				DoScreenElementMorph id = music_track_anchor pos = (575.0,320.0)
			endif
			if ScreenElementExists id = box_icon
				DoScreenElementMorph id = box_icon time = 0.94999999 alpha = 0.60000002
				if ScreenElementExists id = box_icon_2
					DoScreenElementMorph id = box_icon_2 time = 0.75 alpha = 0.25
				endif
			endif
			FireEvent type = focus target = pause_menu
			SetScreenElementProps id = root_window tags = {menu_state = on}
		endif
	endscript
	script build_theme_box_icons parent = current_menu_anchor alpha = 0.75 z_priority = 5 pos = (530.0,-5.0) pos2 = (530.0,398.0) scale = (1.79999995,2.0999999)
		FormatText ChecksumName = icon_color "%i_BOX_ICON_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = SpriteElement
			parent = <parent>
			id = box_icon
			texture = <icon_texture>
			pos = <pos>
			rgba = <icon_color>
			alpha = <alpha>
			just = [left top]
			scale = <scale>
			z_priority = <z_priority>
		}
		if NOT GotParam just_top
			CreateScreenElement {
				type = SpriteElement
				parent = <parent>
				id = box_icon_2
				texture = <icon_texture>
				pos = <pos2>
				rgba = <icon_color>
				alpha = <alpha>
				just = [left top]
				scale = <scale>
				z_priority = 1
			}
		endif
	endscript
	script build_grunge_piece parent = current_menu_anchor pos = (320.0,240.0) z_priority = 2 rgba = [128 128 128 100]
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			id = grunge_anchor
			dims = (640.0,480.0)
			pos = <pos>
		}
		FormatText ChecksumName = grunge_texture "%i_grunge" i = (THEME_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = SpriteElement
			parent = grunge_anchor
			texture = <grunge_texture>
			pos = (0.0,0.0)
			rgba = <rgba>
			just = [left top]
			scale = (1.10000002,0.80000001)
			z_priority = <z_priority>
		}
	endscript
	script build_top_bar parent = current_menu_anchor pos = (0.0,62.0) scale = (2.29999995,1.5) z_priority = 1 alpha = 1
		if NOT GotParam static
			if LevelIs load_skateshop
				alpha = 0
			endif
		endif
		if ScreenElementExists id = top_bar_anchor
			DestroyScreenElement id = top_bar_anchor
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			id = top_bar_anchor
			alpha = <alpha>
			pos = <pos>
			just = <just>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = top_bar_anchor
			texture = DE_TOP_BAR
			rgba = [128 128 128 100]
			just = [left top]
			pos = (0.0,0.0)
			scale = <scale>
			z_priority = <z_priority>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = top_bar_anchor
			texture = DE_TOP_BAR_2
			rgba = [128 128 128 100]
			just = [left top]
			pos = (<pos> + (1.0,0.0))
			scale = <scale>
			z_priority = <z_priority>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = top_bar_anchor
			texture = DE_TOP_BAR_3
			rgba = [128 128 128 100]
			just = [left top]
			pos = (<pos> + (1.0,0.0))
			scale = <scale>
			z_priority = <z_priority>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = top_bar_anchor
			texture = DE_TOP_BAR_4
			rgba = [128 128 128 100]
			just = [left top]
			pos = (<pos> + (1.0,0.0))
			scale = <scale>
			z_priority = <z_priority>
		}
	endscript
	script build_theme_sub_title parent = current_menu_anchor title_scale = 1.89999998 pos = (55.0,73.0) z_priority = 10 right_bracket_z = 1 right_bracket_alpha = 1.0
		FormatText ChecksumName = icon_rgba "%i_SUBMENU_TITLE_ICON_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = bracket_texture "%i_sub_frame" i = (THEME_PREFIXES[current_theme_prefix])
		if ScreenElementExists id = submenu_title_anchor
			DestroyScreenElement id = submenu_title_anchor
		endif
		if NOT GotParam static
			if LevelIs load_skateshop
				pos = (55.0,50.0)
				right_bracket_alpha = 0
			endif
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			id = submenu_title_anchor
			pos = <pos>
			just = [left top]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = submenu_title_anchor
			id = left_bracket
			texture = <bracket_texture>
			pos = (0.0,0.0)
			rgba = [0 0 0 0]
			scale = (1.0,1.0)
			z_priority = <z_priority>
		}
		GetStackedScreenElementPos X id = <id>
		FormatText ChecksumName = title_color "%i_MENU_TITLE_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = TextElement
			parent = submenu_title_anchor
			id = title_text
			pos = (<pos> + (-35.0,15.0))
			just = [left top]
			font = testtitle
			text = <title>
			scale = <title_scale>
			z_priority = (<z_priority> + 1)
			rgba = <title_color>
		}
		if GotParam max_width
			truncate_string id = title_text max_width = <max_width>
		endif
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = submenu_title_anchor
			id = right_bracket
			pos = (<pos> + (-10.0,20.0))
			texture = <bracket_texture>
			rgba = [128 128 128 128]
			scale = (1.0,1.0)
			alpha = <right_bracket_alpha>
			z_priority = <right_bracket_z>
			rot_angle = 180
		}
		CreateScreenElement {
			type = SpriteElement
			parent = left_bracket
			id = title_icon
			texture = <title_icon>
			rgba = <icon_rgba>
			just = [center center]
			scale = 1.29999995
			alpha = 1
			pos = (13.0,32.0)
			z_priority = <z_priority>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = left_bracket
			texture = <title_icon>
			rgba = <icon_rgba>
			just = [center center]
			scale = 1.60000002
			alpha = 0.69999999
			pos = (13.0,32.0)
			z_priority = (<z_priority> - 1)
		}
		KillSpawnedScript name = title_icon_twitch_effect
		RunScriptOnScreenElement id = title_icon title_icon_twitch_effect
	endscript
	script build_top_and_bottom_blocks {top_pos = (0.0,-29.0)
			bot_pos = (0.0,370.0)
			top_z = 1
			bot_z = 5
			parent = current_menu_anchor
			scale = (1.20000005,2.04999995)
			rgba = [100 100 100 128]
		}
		if NOT GotParam static
			if LevelIs load_skateshop
				scale = (1.20000005,1.45000005)
			endif
		endif
		SetScreenElementLock off id = <parent>
		if NOT GotParam double
			if ScreenElementExists id = top_block_anchor
				DestroyScreenElement id = top_block_anchor
				DestroyScreenElement id = bottom_block_anchor
			endif
			top_block_anchor = top_block_anchor
			bottom_block_anchor = bottom_block_anchor
		else
			top_block_anchor = top_block_anchor2
			bottom_block_anchor = bottom_block_anchor2
		endif
		FormatText ChecksumName = highlight_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = alt_rgba "%i_ALT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			id = <top_block_anchor>
			pos = <top_pos>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <top_block_anchor>
			texture = strip_1
			rgba = <rgba>
			just = [left top]
			pos = (0.0,0.0)
			scale = <scale>
			z_priority = <top_z>
		}
		top_first_id = <id>
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <top_block_anchor>
			texture = strip_2
			rgba = <rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <top_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <top_block_anchor>
			texture = strip_3
			rgba = <rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <top_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <top_block_anchor>
			texture = strip_4
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <top_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <top_block_anchor>
			texture = strip_5
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <top_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <top_block_anchor>
			texture = strip_6
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <top_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <top_block_anchor>
			texture = strip_7
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <top_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <top_block_anchor>
			texture = strip_8
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <top_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <top_block_anchor>
			texture = strip_9
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <top_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <top_block_anchor>
			texture = strip_10
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <top_z>
		}
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			id = <bottom_block_anchor>
			internal_just = [center center]
			pos = <bot_pos>
		}
		scale = (1.20000005,1.60000002)
		CreateScreenElement {
			type = SpriteElement
			parent = <bottom_block_anchor>
			texture = strip_10
			rgba = <alt_rgba>
			just = [left top]
			pos = (0.0,0.0)
			scale = <scale>
			z_priority = <bot_z>
			rot_angle
		}
		bot_first_id = <id>
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <bottom_block_anchor>
			texture = strip_9
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <bot_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <bottom_block_anchor>
			texture = strip_8
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <bot_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <bottom_block_anchor>
			texture = strip_7
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <bot_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <bottom_block_anchor>
			texture = strip_6
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <bot_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <bottom_block_anchor>
			texture = strip_5
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <bot_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <bottom_block_anchor>
			texture = strip_4
			rgba = <alt_rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <bot_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <bottom_block_anchor>
			texture = strip_3
			rgba = <rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <bot_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <bottom_block_anchor>
			texture = strip_2
			rgba = <rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <bot_z>
		}
		GetStackedScreenElementPos X id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <bottom_block_anchor>
			texture = strip_1
			rgba = <rgba>
			just = [left top]
			pos = <pos>
			scale = <scale>
			z_priority = <bot_z>
		}
		if NOT GotParam no_lines
			GetStackedScreenElementPos Y id = <top_first_id> offset = (0.0,-3.0)
			CreateScreenElement {
				type = SpriteElement
				parent = <top_block_anchor>
				texture = streak_2
				rgba = <highlight_rgba>
				just = [left top]
				pos = <pos>
				scale = (12.0,0.85000002)
				z_priority = (<top_z> + 1)
				alpha = 0.60000002
			}
			CreateScreenElement {
				type = SpriteElement
				parent = <bottom_block_anchor>
				texture = streak_2
				rgba = <highlight_rgba>
				just = [left top]
				pos = (0.0,-2.0)
				scale = (12.0,0.85000002)
				z_priority = (<bot_z> + 1)
			}
		endif
	endscript
	script pause_menu_gradient texture = bg_gradient_1 scale = (3.70000005,150.0) time = 0.2 alpha = 1.0 id = screenfader pos = (320.0,240.0)
		if LevelIs load_skateshop
			return
		endif
		if LevelIs load_cas
			return
		endif
		FormatText ChecksumName = value_name "%i_GRADIENT_VALUE" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if GotParam on
			if NOT ScreenElementExists id = <id>
				SetScreenElementLock off id = root_window
				CreateScreenElement {
					type = SpriteElement
					parent = root_window
					id = <id>
					texture = <texture>
					pos = <pos>
					rgba = <value_name>
					just = [center center]
					scale = <scale>
					alpha = 0
					z_priority = 0
				}
				DoScreenElementMorph id = <id> time = <time> alpha = <alpha>
			endif
		endif
		if GotParam off
			if ScreenElementExists id = <id>
				DoScreenElementMorph id = <id> time = <time> alpha = 0
				wait <time> seconds
				if ScreenElementExists id = <id>
					DestroyScreenElement id = <id>
				endif
			endif
		endif
	endscript
	script make_new_themed_sub_menu dims = (300.0,300.0) pos = (215.0,80.0) menu_id = sub_menu vmenu_id = sub_vmenu right_bracket_alpha = <right_bracket_alpha> right_bracket_z = 1
		if LevelIs load_skateshop
			if NOT GotParam skateshop_pos
				pos = (100.0,55.0)
			else
				pos = <skateshop_pos>
			endif
		endif
		if ObjectExists id = current_menu_anchor
			pulse_blur speed = 2 start = 225
			DestroyScreenElement id = current_menu_anchor
		endif
		GoalManager_HidePoints
		GoalManager_HideGoalPoints
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = menu_parts_anchor
			dims = (640.0,480.0)
			pos = (320.0,240.0)
		}
		if GotParam Scrolling
			type = VScrollingMenu
			scrolling_menu_id = sub_scrolling_menu
		endif
		make_new_menu {
			pos = <pos>
			parent = menu_parts_anchor
			internal_just = [left center]
			menu_id = <menu_id>
			vmenu_id = <vmenu_id>
			scrolling_menu_id = <scrolling_menu_id>
			type = <type>
			dims = <dims>
			dont_allow_wrap = <dont_allow_wrap>
			<no_menu_title>
		}
		DoScreenElementMorph id = <menu_id> time = 0 pos = (320.0,620.0)
		AssignAlias id = menu_parts_anchor alias = current_menu_anchor
		if LevelIs load_skateshop
			build_top_and_bottom_blocks
			make_mainmenu_3d_plane
		endif
		if NOT GotParam helper_text
			create_helper_text {helper_text_elements = [{text = "\b7/\b4 = Select"}
					{text = "\bn = Back"}
					{text = "\bm = Accept"}
				]
			}
		else
			create_helper_text <helper_text>
		endif
		kill_start_key_binding
		build_theme_sub_title title = <title> title_icon = <title_icon> right_bracket_z = <right_bracket_z> right_bracket_alpha = <right_bracket_alpha> title_scale = <title_scale>
		if NOT LevelIs load_skateshop
			FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
			build_theme_box_icons icon_texture = <paused_icon>
			build_grunge_piece
		endif
		if NOT GotParam no_bar
			build_top_bar pos = (-400.0,62.0)
		endif
	endscript
	script finish_themed_sub_menu menu = sub_menu end_pos = (320.0,240.0) time = 0.2
		change widest_menu_item_width = 0
		if NOT GotParam no_sound
			PlaySound DE_MenuFlyUp vol = 100
		endif
		DoScreenElementMorph id = <menu> time = <time> pos = <end_pos>
		if ScreenElementExists id = top_bar_anchor
			DoScreenElementMorph id = top_bar_anchor time = <time> pos = (0.0,62.0)
		endif
		FireEvent type = focus target = <menu>
	endscript
	script make_new_themed_option_menu menu_id = options_menu vmenu_id = options_vmenu right_bracket_alpha = <right_bracket_alpha>
		pulse_blur
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		if InSplitScreenGame
			GoalManager_ShowPoints
			options_pos = (120.0,68.0)
		else
			options_pos = (120.0,60.0)
		endif
		make_new_menu {
			menu_id = <menu_id>
			vmenu_id = <vmenu_id>
			menu_title = ""
			pos = <options_pos>
		}
		build_theme_sub_title title = <title> title_icon = <title_icon> right_bracket_alpha = <right_bracket_alpha>
		FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_box_icons icon_texture = <paused_icon>
		build_grunge_piece
		create_helper_text generic_helper_text
		kill_start_key_binding
	endscript
	script make_theme_menu_item {focus_script = theme_item_focus
			text = "Default text"
			unfocus_script = theme_item_unfocus
			pad_choose_script = null_script
			pad_choose_sound = theme_menu_pad_choose_sound
			scale = 1.0
			rgba = [88 105 112 118]
			dims = (300.0,18.0)
			just = [right center]
			parent = current_menu
		}
		if GotParam not_focusable
			<rgba> = [60 60 60 75]
			CreateScreenElement {
				type = ContainerElement
				parent = <parent>
				id = <id>
				dims = <dims>
				just = [center center]
				not_focusable
			}
		else
			FormatText ChecksumName = text_color "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
			<rgba> = <text_color>
			CreateScreenElement {
				type = ContainerElement
				parent = <parent>
				id = <id>
				dims = <dims>
				just = [center center]
				event_handlers = [
					{focus <focus_script> params = {text = <text>}}
					{unfocus <unfocus_script>}
					{pad_start <pad_choose_sound>}
					{pad_choose <pad_choose_sound>}
					{pad_choose <pad_choose_script> params = <pad_choose_params>}
					{pad_start <pad_choose_script> params = <pad_choose_params>}
				]
			}
		endif
		container_id = <id>
		CreateScreenElement {
			type = TextElement
			parent = <id>
			font = small
			text = <text>
			rgba = <rgba>
			scale = <scale>
			pos = (190.0,10.0)
			just = <just>
		}
		if NOT GotParam no_highlight_bar
			highlight_angle = RandomNoRepeat(@2 @-2 @3 @-3 @3.5 @-3 @5 @-4 @2.5 @-4.5)
			CreateScreenElement {
				type = SpriteElement
				parent = <container_id>
				texture = DE_highlight_bar
				pos = (120.0,10.0)
				rgba = [0 0 0 0]
				just = [center center]
				scale = (6.30000019,0.69999999)
				z_priority = 1
				rot_angle = <highlight_angle>
			}
		endif
		if GotParam mark_first_input
			SetScreenElementProps {
				id = <container_id>
				event_handlers = [{pad_choose mark_first_input_received}
					{pad_start mark_first_input_received}
				]
			}
		endif
	endscript
	script theme_menu_add_item {parent = current_menu
			font = small
			highlight_bar_scale = (2.0999999,0.69999999)
			highlight_bar_pos = (90.0,-7.0)
			text_just = [right center]
			focus_script = main_theme_focus
			unfocus_script = main_theme_unfocus
			text_pos = (95.0,-5.0)
			dims = (200.0,20.0)
			pad_choose_script = nullscript
			text_alpha = 1.0
			scale = 1.0
			z_priority = 3
		}
		if NOT GotParam text_rgba
			FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		endif
		if NOT GotParam line_rgba
			FormatText ChecksumName = line_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		endif
		if GotParam first_item
			focus_params = {first_item text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params>}
		else
			if GotParam last_item
				focus_params = {last_item text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params>}
			else
				focus_params = {text_rgba = <text_rgba> text_alpha = <text_alpha> highlighted_text_rgba = <highlighted_text_rgba> <focus_params>}
			endif
		endif
		if GotParam not_focusable
			CreateScreenElement {
				type = ContainerElement
				parent = <parent>
				id = <id>
				dims = <dims>
				event_handlers = [{focus <focus_script> params = <focus_params>}
					{unfocus <unfocus_script> params = <focus_params>}
				]
				replace_handlers
				not_focusable
			}
		else
			CreateScreenElement {
				type = ContainerElement
				parent = <parent>
				id = <id>
				dims = <dims>
				event_handlers = [{focus <focus_script> params = <focus_params>}
					{unfocus <unfocus_script> params = <focus_params>}
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
		if GotParam cat_edit_item
			SetScreenElementProps {id = <anchor_id>
				event_handlers = [
					{pad_left <pad_right_script> params = {reverse id = <id> value = <value> <params>}}
					{pad_right <pad_right_script> params = {id = <id> value = <value> <params>}}
					{pad_choose <pad_choose_script> params = <params>}
					{pad_start <pad_choose_script> params = <params>}
				]
				replace_handlers
			}
		else
			if GotParam pad_right_script
				SetScreenElementProps {id = <anchor_id>
					event_handlers = [
						{pad_left <pad_left_script> params = {<pad_left_params>}}
						{pad_right <pad_right_script> params = {<pad_right_params>}}
					]
					replace_handlers
				}
			endif
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
		if GotParam centered
			text_just = [center center]
			text_pos = (85.0,-5.0)
		endif
		if GotParam not_focusable
			<text_rgba> = [60 60 60 75]
			CreateScreenElement {
				type = TextElement
				parent = <anchor_id>
				id = <text_id>
				font = <font>
				text = <text>
				scale = <scale>
				pos = <text_pos>
				just = <text_just>
				rgba = <text_rgba>
				alpha = <text_alpha>
				not_focusable
				z_priority = <z_priority>
			}
		else
			CreateScreenElement {
				type = TextElement
				parent = <anchor_id>
				id = <text_id>
				font = <font>
				text = <text>
				scale = <scale>
				pos = <text_pos>
				just = <text_just>
				rgba = <text_rgba>
				alpha = <text_alpha>
				z_priority = <z_priority>
			}
		endif
		if GotParam max_width
			truncate_string id = <id> max_width = <max_width>
		endif
		highlight_angle = RandomNoRepeat(@2 @-2 @3 @-3 @3.5 @-3.5 @4 @-4 @4.5 @-4.5 @5 @-5)
		if GotParam menu
			FormatText ChecksumName = bar_id "highlight_bar%m_%i" m = <menu> i = middle_piece_id_num
			FormatText ChecksumName = line_id "text_line%m_%i" m = <menu> i = middle_piece_id_num
			FormatText ChecksumName = box_id "text_box%m_%i" m = <menu> i = middle_piece_id_num
		else
			FormatText ChecksumName = bar_id "highlight_bar_%i" i = middle_piece_id_num
			FormatText ChecksumName = line_id "text_line_%i" i = middle_piece_id_num
			FormatText ChecksumName = box_id "text_box_%i" i = middle_piece_id_num
		endif
		if NOT GotParam no_highlight_bar
			CreateScreenElement {
				type = SpriteElement
				parent = <anchor_id>
				id = <bar_id>
				texture = DE_highlight_bar
				pos = <highlight_bar_pos>
				rgba = [0 0 0 0]
				just = [center center]
				scale = <highlight_bar_scale>
				z_priority = (<z_priority> -1)
				rot_angle = <highlight_angle>
			}
		else
			CreateScreenElement {
				type = ContainerElement
				parent = <anchor_id>
				pos = (0.0,0.0)
			}
		endif
		if NOT GotParam no_bg
			build_theme_menu_middle {parent = <anchor_id>
				last_menu_item = <last_menu_item>
				centered = <centered>
				static_width = <static_width>
				middle_scale = <middle_scale>
				menu = <menu>
				dark_menu = <dark_menu>
				height = <item_bg_height>
			}
		else
			if GotParam first_item
				change widest_menu_item_width = 0
			endif
			CreateScreenElement {
				type = ContainerElement
				parent = <anchor_id>
				pos = (0.0,0.0)
			}
			change middle_piece_id_num = (middle_piece_id_num + 1)
			GetScreenElementDims id = <id>
		endif
		if GotParam extra_text
			CreateScreenElement {
				type = TextElement
				parent = <anchor_id>
				font = <font>
				text = <extra_text>
				scale = <scale>
				pos = (<text_pos> + (10.0,0.0))
				just = [left center]
				rgba = <text_rgba>
				z_priority = <z_priority>
			}
			if NOT GotParam ignore_width
				GetScreenElementDims id = {<anchor_id> child = 3}
				if (<width> > widest_menu_item_width)
					change widest_menu_item_width = (<width> + 15)
				endif
			endif
		else
			CreateScreenElement {
				type = TextElement
				parent = <anchor_id>
				font = small
				text = ""
				alpha = 0
			}
		endif
		if GotParam cross_it_out
			CreateScreenElement {
				type = SpriteElement
				parent = <anchor_id>
				id = <line_id>
				texture = streak_2
				pos = <highlight_bar_pos>
				rgba = <line_rgba>
				just = [center center]
				scale = <highlight_bar_scale>
				z_priority = (<z_priority> + 1)
				rot_angle = <highlight_angle>
			}
		endif
		if GotParam box_it_up
			CreateScreenElement {
				type = SpriteElement
				parent = <anchor_id>
				id = <box_id>
				texture = black
				pos = <highlight_bar_pos>
				rgba = [0 0 0 60]
				just = [center center]
				scale = <highlight_bar_scale>
				z_priority = <z_priority>
			}
		endif
		if NOT GotParam ignore_width
			GetScreenElementDims id = {<anchor_id> child = 0}
			if (<width> > widest_menu_item_width)
				change widest_menu_item_width = <width>
			endif
		endif
		if ((GotParam last_menu_item) || (GotParam last_item))
			if NOT GotParam static_width
				if GotParam centered
					RunScriptOnScreenElement id = <id> set_all_menu_items_width params = {centered menu = <menu> height = <item_bg_height>}
				else
					RunScriptOnScreenElement id = <id> set_all_menu_items_width params = {menu = <menu> height = <item_bg_height>}
				endif
			endif
		endif
	endscript
	script theme_menu_add_centered_item
		theme_menu_add_item <...> centered = centered
	endscript
	script theme_menu_add_checkbox_item
		if NOT GotParam id
			printf "checkbox items must have an id"
			return
		endif
		if NOT GotParam value
			printf "checkbox items must have a value"
			return
		endif
		anchor_id = <id>
		theme_menu_add_item focus_script = theme_checkbox_focus unfocus_script = theme_checkbox_unfocus <...>
		FormatText ChecksumName = check_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if (<value> = 0)
			alpha = 0
		else
			alpha = 1
		endif
		GetStackedScreenElementPos X id = {<id> child = 0} offset = (20.0,5.0)
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = checkmark
			pos = <pos>
			alpha = <alpha>
			just = [left center]
			rgba = <check_rgba>
			z_priority = 5
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = checkbox
			pos = (<pos> + (0.0,5.0))
			just = [left center]
			scale = 0.5
			rgba = <check_rgba>
			z_priority = 5
		}
	endscript
	script theme_set_checkbox
		if NOT GotParam value
			printf "theme_set_checkbox must have value"
			return
		endif
		GetTags
		if (<value> = 1)
			DoScreenElementMorph id = {<id> child = 4} alpha = 1
		else
			DoScreenElementMorph id = {<id> child = 4} alpha = 0
		endif
	endscript
	script theme_menu_add_number_item min = 0 max = 10 step = 1
		if NOT GotParam id
			printf "number items must have an id"
			return
		endif
		if NOT GotParam value
			printf "number items must have a value"
			return
		endif
		anchor_id = <id>
		if GotParam trailingtext
			FormatText textname = value_text "%v%t" v = <value> decimalplaces = <decimalplaces> t = <trailingtext>
		else
			if GotParam percent
				FormatText textname = value_text "%v\%" v = <value> decimalplaces = <decimalplaces>
			else
				FormatText textname = value_text "%v" v = <value> decimalplaces = <decimalplaces>
			endif
		endif
		theme_menu_add_item <...> extra_text = <value_text> focus_script = theme_number_item_focus unfocus_script = theme_number_item_unfocus
		if NOT GotParam cat_edit_item
			SetScreenElementProps {id = <anchor_id>
				event_handlers = [{pad_left theme_menu_toggle_number_item params = {reverse
							callback = <pad_left_script>
							pad_left_script = <pad_left_script>
							pad_right_script = <pad_right_script>
							value = <value>
							max = <max>
							min = <min>
							step = <step>
							avoid = <avoid>
							<pad_left_params>
						}
					}
					{pad_right theme_menu_toggle_number_item params = {callback = <pad_right_script>
							pad_left_script = <pad_left_script>
							pad_right_script = <pad_right_script>
							value = <value>
							max = <max>
							min = <min>
							step = <step>
							avoid = <avoid>
							<pad_right_params>
						}
					}
				]
				replace_handlers
			}
		endif
		FormatText ChecksumName = arrow_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if GotParam far_left
			GetScreenElementPosition id = {<anchor_id> child = 0}
		else
			GetScreenElementPosition id = {<anchor_id> child = 3}
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = left_arrow
			pos = (<ScreenElementPos> + (0.0,2.0))
			alpha = 0
			just = [right top]
			rgba = <arrow_rgba>
			z_priority = 5
			scale = 0.64999998
		}
		if GotParam right_arrow_pos
			pos = <right_arrow_pos>
		else
			GetStackedScreenElementPos X id = {<anchor_id> child = 3} offset = (3.0,2.0)
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = right_arrow
			pos = <pos>
			alpha = 0
			just = [left top]
			rgba = <arrow_rgba>
			z_priority = 5
			scale = 0.64999998
		}
	endscript
	script theme_menu_toggle_number_item
		GetTags
		if GotParam NoStep
		else
			while
				if GotParam reverse
					if (((<value> - <step>) > <min>) || ((<value> - <step>) = <min>))
						value = (<value> - <step>)
					else
						return
					endif
				else
					if (<max> > ((<value> + <step>)) || ((<value> + <step>) = <max>))
						value = (<value> + <step>)
					else
						return
					endif
				endif
				if GotParam avoid
					if (<value> = <avoid>)
					else
						break
					endif
				else
					break
				endif
			repeat 2
		endif
		FormatText textname = value_text "%v" v = <value>
		SetScreenElementProps {id = {<id> child = 3} text = <value_text>}
		theme_menu_update_number_item_right_arrow
		SetScreenElementProps {id = <id>
			event_handlers = [{pad_left theme_menu_toggle_number_item params = {reverse
						callback = <pad_left_script>
						pad_left_script = <pad_left_script>
						pad_right_script = <pad_right_script>
						value = <value>
						max = <max>
						min = <min>
						step = <step>
						avoid = <avoid>
						<pad_left_params>
					}
				}
				{pad_right theme_menu_toggle_number_item params = {callback = <pad_right_script>
						pad_left_script = <pad_left_script>
						pad_right_script = <pad_right_script>
						value = <value>
						max = <max>
						min = <min>
						step = <step>
						avoid = <avoid>
						<pad_right_params>
					}
				}
			]
			replace_handlers
		}
		if GotParam callback
			<callback> <...>
		endif
	endscript
	script theme_menu_update_number_item_right_arrow
		GetTags
		GetStackedScreenElementPos X id = {<id> child = 3} offset = (3.0,2.0)
		SetScreenElementProps {id = {<id> child = 5} pos = <pos>}
	endscript
	script theme_menu_add_flag_item
		if NOT GotParam flag
			printf "theme_menu_add_flag_item requires a flag param"
			return
		endif
		if NOT GotParam flag
			printf "theme_menu_add_flag_item requires an id param"
			return
		endif
		if GetGlobalFlag flag = <flag>
			if GotParam reverse
				extra_text = "Off"
				reverse = reverse
			else
				extra_text = "On"
			endif
		else
			if GotParam reverse
				extra_text = "On"
				reverse = reverse
			else
				extra_text = "Off"
			endif
		endif
		theme_menu_add_item <...> pad_choose_script = theme_toggle_flag pad_choose_params = {flag = <flag> id = <id> reverse = <reverse>}
	endscript
	script theme_toggle_flag
		if GetGlobalFlag flag = <flag>
			if GotParam reverse
				SetScreenElementProps id = {<id> child = 3} text = "On"
			else
				SetScreenElementProps id = {<id> child = 3} text = "Off"
			endif
			UnSetGlobalFlag flag = <flag>
		else
			if GotParam reverse
				SetScreenElementProps id = {<id> child = 3} text = "Off"
			else
				SetScreenElementProps id = {<id> child = 3} text = "On"
			endif
			SetGlobalFlag flag = <flag>
		endif
	endscript
	widest_menu_item_width = 0
	middle_piece_id_num = 0
	script build_theme_menu_top parent = current_menu_anchor pos = (90.0,-29.0)
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			id = <top_id>
			pos = <pos>
		}
		anchor_id = <id>
		if LevelIs load_skateshop
			m_texture = MM_T_M
			l_texture = MM_T_L
			r_texture = MM_T_R
		else
			if GotParam dark_menu
				m_texture = spec_T_M
				l_texture = spec_T_L
				r_texture = spec_T_R
			else
				m_texture = DE_T_M
				l_texture = DE_T_L
				r_texture = DE_T_R
			endif
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			id = <mid_id>
			texture = <m_texture>
			pos = (0.0,0.0)
			just = [center top]
			rgba = <bg_piece_rgba>
			scale = <middle_scale>
			z_priority = 1
		}
		GetScreenElementDims id = <id>
		right_pos = ((0.5,0.0) * <width>)
		left_pos = ((-0.5,0.0) * <width>)
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			id = <left_id>
			texture = <l_texture>
			pos = <left_pos>
			just = [right top]
			rgba = <bg_piece_rgba>
			scale = (1.0,1.0)
			z_priority = 1
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			id = <right_id>
			texture = <r_texture>
			pos = <right_pos>
			just = [left top]
			rgba = <bg_piece_rgba>
			scale = (1.0,1.0)
			z_priority = 1
		}
		change widest_menu_item_width = 0
	endscript
	script build_theme_menu_middle pos = (90.0,-20.0) middle_scale = (2.5,1.0) height = 1
		FormatText ChecksumName = bg_piece_rgba "%i_BG_PARTS_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if NOT GotParam menu
			FormatText ChecksumName = mid_id "middle_piece_%i" i = middle_piece_id_num
			FormatText ChecksumName = left_id "left_piece_%i" i = middle_piece_id_num
			FormatText ChecksumName = right_id "right_piece_%i" i = middle_piece_id_num
			top_id = box_top_anchor
		else
			FormatText ChecksumName = mid_id "middle_piece%m_%i" i = middle_piece_id_num m = <menu>
			FormatText ChecksumName = left_id "left_piece%m_%i" i = middle_piece_id_num m = <menu>
			FormatText ChecksumName = right_id "right_piece%m_%i" i = middle_piece_id_num m = <menu>
			FormatText ChecksumName = top_id "box_top_anchor%i" i = <menu>
		endif
		change middle_piece_id_num = (middle_piece_id_num + 1)
		if NOT ScreenElementExists id = <top_id>
			build_theme_menu_top {parent = <parent>
				top_id = <top_id>
				middle_scale = <middle_scale>
				bg_piece_rgba = <bg_piece_rgba>
				mid_id = <mid_id> left_id = <left_id>
				right_id = <right_id>
				menu = <menu>
				dark_menu = <dark_menu>
			}
			return
		endif
		if GotParam last_menu_item
			build_theme_menu_bottom {parent = <parent>
				pos = <pos>
				middle_scale = <middle_scale>
				bg_piece_rgba = <bg_piece_rgba>
				mid_id = <mid_id>
				left_id = <left_id>
				right_id = <right_id>
				static_width = <static_width>
				centered = <centered>
				menu = <menu>
				dark_menu = <dark_menu>
			}
			return
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			pos = <pos>
		}
		anchor_id = <id>
		modded_middle_scale = ((<middle_scale> - (0.0,1.0)) + ((0.0,1.0) * <height>))
		left_right_scale = ((1.0,0.0) + (0.0,1.0) * <height>)
		if LevelIs load_skateshop
			m_texture = MM_M_M
			l_texture = MM_M_L
			r_texture = MM_M_R
		else
			if GotParam dark_menu
				m_texture = spec_M_M
				l_texture = spec_M_L
				r_texture = spec_M_R
			else
				m_texture = DE_M_M
				l_texture = DE_M_L
				r_texture = DE_M_R
			endif
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			id = <mid_id>
			texture = <m_texture>
			pos = (0.0,0.0)
			just = [center top]
			rgba = <bg_piece_rgba>
			scale = <modded_middle_scale>
			z_priority = 1
		}
		GetScreenElementDims id = <id>
		right_pos = ((0.5,0.0) * <width>)
		left_pos = ((-0.5,0.0) * <width>)
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			id = <left_id>
			texture = <l_texture>
			pos = <left_pos>
			just = [right top]
			rgba = <bg_piece_rgba>
			scale = <left_right_scale>
			z_priority = 1
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			id = <right_id>
			texture = <r_texture>
			pos = <right_pos>
			just = [left top]
			rgba = <bg_piece_rgba>
			scale = <left_right_scale>
			z_priority = 1
		}
	endscript
	script build_theme_menu_bottom pos = (0.0,23.0)
		if GotParam menu
			FormatText textname = con_id "box_bottom_anchor%i" i = <menu>
		else
			con_id = box_bottom_anchor
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			id = <con_id>
			pos = <pos>
		}
		anchor_id = <id>
		if LevelIs load_skateshop
			m_texture = MM_B_M
			l_texture = MM_B_L
			r_texture = MM_B_R
		else
			if GotParam dark_menu
				m_texture = spec_B_M
				l_texture = spec_B_L
				r_texture = spec_B_R
			else
				m_texture = DE_B_M
				l_texture = DE_B_L
				r_texture = DE_B_R
			endif
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			id = <mid_id>
			texture = <m_texture>
			pos = (0.0,0.0)
			just = [center top]
			rgba = <bg_piece_rgba>
			scale = <middle_scale>
			z_priority = 1
		}
		GetScreenElementDims id = <id>
		right_pos = ((0.5,0.0) * <width>)
		left_pos = ((-0.5,0.0) * <width>)
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			id = <left_id>
			texture = <l_texture>
			pos = <left_pos>
			just = [right top]
			rgba = <bg_piece_rgba>
			scale = (1.0,1.0)
			z_priority = 1
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			id = <right_id>
			texture = <r_texture>
			pos = <right_pos>
			just = [left top]
			rgba = <bg_piece_rgba>
			scale = (1.0,1.0)
			z_priority = 1
		}
		change middle_piece_id_num = 0
	endscript
	script set_all_menu_items_width
		change middle_piece_id_num = 0
		if NOT GotParam centered
			new_scale = (widest_menu_item_width * (0.025,0.0) + (0.0,1.0))
			bar_scale = (widest_menu_item_width * (0.012,0.0) + (1.0,0.69999999))
			line_scale = (widest_menu_item_width * (0.032,0.0) + (1.0,0.30000001))
			box_scale = (widest_menu_item_width * (0.63999999,0.0) + (1.0,6.0))
		else
			new_scale = (widest_menu_item_width * (0.0125,0.0) + (0.0,1.0))
			bar_scale = (widest_menu_item_width * (0.006,0.0) + (1.0,0.69999999))
			line_scale = (widest_menu_item_width * (0.016,0.0) + (1.0,0.30000001))
			box_scale = (((<bar_scale> * 32).(1.0,0.0)) * (1.0,0.0) + (0.0,6.0))
		endif
		index = 0
		while
			if NOT GotParam menu
				FormatText ChecksumName = mid_id "middle_piece_%i" i = <index>
				FormatText ChecksumName = left_id "left_piece_%i" i = <index>
				FormatText ChecksumName = right_id "right_piece_%i" i = <index>
				FormatText ChecksumName = bar_id "highlight_bar_%i" i = <index>
				FormatText ChecksumName = line_id "text_line_%i" i = <index>
				FormatText ChecksumName = box_id "text_box_%i" i = <index>
			else
				FormatText ChecksumName = mid_id "middle_piece%m_%i" m = <menu> i = <index>
				FormatText ChecksumName = left_id "left_piece%m_%i" m = <menu> i = <index>
				FormatText ChecksumName = right_id "right_piece%m_%i" m = <menu> i = <index>
				FormatText ChecksumName = bar_id "highlight_bar%m_%i" m = <menu> i = <index>
				FormatText ChecksumName = line_id "text_line%m_%i" m = <menu> i = <index>
				FormatText ChecksumName = box_id "text_box%m_%i" m = <menu> i = <index>
			endif
			if ScreenElementExists id = <mid_id>
				DoScreenElementMorph id = <mid_id> scale = <new_scale>
				GetScreenElementDims id = <mid_id>
				right_pos = ((0.5,0.0) * <width>)
				left_pos = ((-0.5,0.0) * <width>)
				DoScreenElementMorph id = <left_id> pos = <left_pos>
				DoScreenElementMorph id = <right_id> pos = <right_pos>
			endif
			if ScreenElementExists id = <bar_id>
				GetScreenElementProps id = <bar_id>
				if NOT (widest_menu_item_width = 0)
					new_angle = ((<rot_angle> * 5.0) / (widest_menu_item_width * 0.001))
					DoScreenElementMorph id = <bar_id> scale = <bar_scale> rot_angle = <new_angle>
					if ScreenElementExists id = <line_id>
						DoScreenElementMorph id = <line_id> scale = <line_scale> rot_angle = <new_angle>
					endif
					if ScreenElementExists id = <box_id>
						DoScreenElementMorph id = <box_id> scale = <box_scale>
					endif
				endif
			else
			endif
			index = (<index> + 1)
		repeat 100
	endscript
	no_focus_sound = 1
	script main_theme_focus
		GetTags
		if NOT GotParam highlighted_text_rgba
			FormatText ChecksumName = highlighted_text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		endif
		FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		DoScreenElementMorph {
			id = {<id> child = 0}
			rgba = <highlighted_text_rgba>
			scale = 1.10000002
			relative_scale
		}
		if ScreenElementExists id = {<id> child = 3}
			DoScreenElementMorph {
				id = {<id> child = 3}
				rgba = <highlighted_text_rgba>
				scale = 1.10000002
				relative_scale
			}
		endif
		SetScreenElementProps {
			id = {<id> child = 1}
			rgba = <bar_rgba>
		}
		if ScreenElementExists id = scrolling_menu_up_arrow
			if GotParam first_item
				DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 0
			else
				DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 1
			endif
		endif
		if ScreenElementExists id = scrolling_menu_down_arrow
			if GotParam last_item
				DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 0
			else
				DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 1
			endif
		endif
		RunScriptOnScreenElement id = <id> text_twitch_effect
	endscript
	script main_theme_unfocus text_alpha = 1.0
		GetTags
		if NOT GotParam text_rgba
			FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		endif
		KillSpawnedScript name = text_twitch_effect
		DoScreenElementMorph {
			id = {<id> child = 0}
			rgba = <text_rgba>
			alpha = <text_alpha>
			scale = 1
		}
		if ScreenElementExists id = {<id> child = 3}
			DoScreenElementMorph {
				id = {<id> child = 3}
				rgba = <text_rgba>
				alpha = <text_alpha>
				scale = 1
			}
		endif
		SetScreenElementProps {
			id = {<id> child = 1}
			rgba = [128 128 128 0]
		}
	endscript
	script main_theme_focus_noscale
		GetTags
		if NOT GotParam highlighted_text_rgba
			FormatText ChecksumName = highlighted_text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		endif
		FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		DoScreenElementMorph {
			id = {<id> child = 0}
			rgba = <highlighted_text_rgba>
			relative_scale
		}
		if ScreenElementExists id = {<id> child = 3}
			DoScreenElementMorph {
				id = {<id> child = 3}
				rgba = <highlighted_text_rgba>
				relative_scale
			}
		endif
		SetScreenElementProps {
			id = {<id> child = 1}
			rgba = <bar_rgba>
		}
		if ScreenElementExists id = scrolling_menu_up_arrow
			if GotParam first_item
				DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 0
			else
				DoScreenElementMorph id = scrolling_menu_up_arrow alpha = 1
			endif
		endif
		if ScreenElementExists id = scrolling_menu_down_arrow
			if GotParam last_item
				DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 0
			else
				DoScreenElementMorph id = scrolling_menu_down_arrow alpha = 1
			endif
		endif
	endscript
	script main_theme_unfocus_noscale
		GetTags
		if NOT GotParam text_rgba
			FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		endif
		KillSpawnedScript name = text_twitch_effect
		DoScreenElementMorph {
			id = {<id> child = 0}
			rgba = <text_rgba>
			alpha = <text_alpha>
		}
		if ScreenElementExists id = {<id> child = 3}
			DoScreenElementMorph {
				id = {<id> child = 3}
				rgba = <text_rgba>
				alpha = <text_alpha>
			}
		endif
		SetScreenElementProps {
			id = {<id> child = 1}
			rgba = [128 128 128 0]
		}
	endscript
	script theme_checkbox_focus
		main_theme_focus <...>
		GetTags
		FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		SetScreenElementProps {
			id = {<id> child = 4}
			rgba = <text_rgba>
			alpha = <text_alpha>
			relative_scale
		}
	endscript
	script theme_checkbox_unfocus
		main_theme_unfocus <...>
		GetTags
		FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		SetScreenElementProps {
			id = {<id> child = 4}
			rgba = <text_rgba>
			alpha = <text_alpha>
			scale = 1
			relative_scale
		}
	endscript
	script theme_number_item_focus
		main_theme_focus <...>
		GetTags
		DoScreenElementMorph {
			id = {<id> child = 4}
			alpha = 1
		}
		DoScreenElementMorph {
			id = {<id> child = 5}
			alpha = 1
		}
	endscript
	script theme_number_item_unfocus
		main_theme_unfocus <...>
		GetTags
		DoScreenElementMorph {
			id = {<id> child = 4}
			alpha = 0
		}
		DoScreenElementMorph {
			id = {<id> child = 5}
			alpha = 0
		}
	endscript
	script theme_item_focus
		GetTags
		FormatText ChecksumName = text_color "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = hbar_color "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		SetScreenElementProps id = {<id> child = 0} rgba = <text_color>
		DoScreenElementMorph id = {<id> child = 0} time = 0.05 scale = 1.10000002
		if ScreenElementExists id = {<id> child = 1}
			SetScreenElementProps {
				id = {<id> child = 1}
				rgba = <hbar_color>
			}
		endif
		RunScriptOnScreenElement id = <id> text_twitch_effect params = {text_scale = <text_scale>}
	endscript
	script sprite_focus
		theme_item_focus <...>
		GetTags
		FormatText ChecksumName = icon_color "%i_ICON_ON_VALUE" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if (no_focus_sound = 1)
			change no_focus_sound = 0
		else
			SpawnScript play_icon_spin_sound
		endif
		wait 3 gameframes
		RunScriptOnScreenElement id = {<id> child = 2} scale_sprite_up
		RunScriptOnScreenElement id = <id> do_blur_effect
		SetScreenElementProps {
			id = {<id> child = 2}
			rgba = <icon_color>
		}
		RunScriptOnScreenElement id = <id> icon_twitch_effect
	endscript
	script sprite_desc_focus
		theme_item_focus <...>
		GetTags
		FormatText ChecksumName = icon_color "%i_ICON_ON_VALUE" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if (no_focus_sound = 1)
			change no_focus_sound = 0
		else
			SpawnScript play_icon_spin_sound
		endif
		wait 3 gameframes
		RunScriptOnScreenElement id = {<id> child = 2} scale_sprite_up
		RunScriptOnScreenElement id = <id> do_blur_effect
		SetScreenElementProps {
			id = {<id> child = 2}
			rgba = <icon_color>
		}
		RunScriptOnScreenElement id = <id> icon_twitch_effect
	endscript
	script play_icon_spin_sound
		wait 12 gameframes
		PlaySound DE_IconTurnZoom vol = 60
	endscript
	script theme_item_unfocus
		GetTags
		generic_menu_pad_up_down_sound
		KillSpawnedScript name = text_twitch_effect
		FormatText ChecksumName = text_color "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		SetScreenElementProps id = {<id> child = 0} rgba = <text_color>
		SetScreenElementProps id = {<id> child = 0} no_blur_effect
		DoScreenElementMorph id = {<id> child = 0} time = 0.05 restore_alpha scale = 1
		if ScreenElementExists id = {<id> child = 1}
			DoScreenElementMorph id = {<id> child = 1} rgba = [0 0 0 0]
		endif
	endscript
	script sprite_unfocus
		KillSpawnedScript name = play_icon_spin_sound
		GetTags
		theme_item_unfocus <...>
		KillSpawnedScript name = icon_twitch_effect
		RunScriptOnScreenElement id = {<id> child = 2} scale_sprite_down
		SetScreenElementProps {
			id = {<id> child = 2}
			rgba = [0 0 0 0]
		}
		wait 4 gameframes
		RunScriptOnScreenElement id = {<id> child = 2} scale_sprite_down
		SetScreenElementProps {
			id = {<id> child = 2}
			rgba = [0 0 0 0]
		}
	endscript
	script sprite_desc_unfocus
		KillSpawnedScript name = play_icon_spin_sound
		GetTags
		theme_item_unfocus <...>
		KillSpawnedScript name = icon_twitch_effect
		RunScriptOnScreenElement id = {<id> child = 2} scale_sprite_down
		SetScreenElementProps {
			id = {<id> child = 2}
			rgba = [0 0 0 0]
		}
		wait 4 gameframes
		RunScriptOnScreenElement id = {<id> child = 2} scale_sprite_down
		SetScreenElementProps {
			id = {<id> child = 2}
			rgba = [0 0 0 0]
		}
	endscript
	script icon_twitch_effect
		GetTags
		FormatText ChecksumName = twitch_color "%i_ICON_TWITCH_VALUE" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = icon_color "%i_ICON_ON_VALUE" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		while
			SetScreenElementProps id = {<id> child = 2} rot_angle = 10 rgba = <twitch_color>
			wait 1 gameframe
			SetScreenElementProps id = {<id> child = 2} rot_angle = 0 rgba = <icon_color>
			wait_time = Random(@0.25 @0.5 @2.25)
			wait <wait_time> seconds
		repeat
	endscript
	script text_twitch_effect
		GetTags
		FormatText ChecksumName = text_color "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = twitch_color "%i_TEXT_TWITCH_VALUE" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		while
			GetScreenElementDims id = {<id> child = 0}
			ScaleH = ((<width> + 5.0) / (<width>))
			DoScreenElementMorph id = {<id> child = 0} time = 0.03 scale = <ScaleH> alpha = 1
			if NOT GotParam no_extra
				if ScreenElementExists id = {<id> child = 3}
					GetScreenElementDims id = {<id> child = 3}
					if NOT (<width> = 0)
						ScaleH = ((<width> + 5.0) / (<width>))
						DoScreenElementMorph id = {<id> child = 3} time = 0.03 scale = <ScaleH> alpha = 1
					endif
				endif
			endif
			wait 2 gameframe
			DoScreenElementMorph id = {<id> child = 0} time = 0.01 scale = 1 alpha = 0.89999998
			if NOT GotParam no_extra
				if ScreenElementExists id = {<id> child = 3}
					DoScreenElementMorph id = {<id> child = 3} time = 0.01 scale = 1 alpha = 0.89999998
				endif
			endif
			wait 0.23 seconds
		repeat
	endscript
	script text_twitch_effect2 scale = 1.07500005 scale2 = 1.0
		GetTags
		FormatText ChecksumName = text_color "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = twitch_color "%i_TEXT_TWITCH_VALUE" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		while
			DoScreenElementMorph id = <id> time = 0.03 scale = <scale> relative_scale
			wait 2 frames
			DoScreenElementMorph id = <id> time = 0.01 scale = <scale2> relative_scale
			wait 0.23 seconds
		repeat
	endscript
	script text_twitch_effect3 scale = 1.04999995 scale2 = 1.07500005
		text_twitch_effect2 <...>
	endscript
	script title_icon_twitch_effect
		FormatText ChecksumName = twitch_color "%i_ICON_TWITCH_VALUE" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = icon_color "%i_ICON_ON_VALUE" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		while
			if ScreenElementExists id = title_icon
				SetScreenElementProps id = title_icon rot_angle = 10 rgba = <twitch_color>
				wait 1 gameframe
				if ScreenElementExists id = title_icon
					SetScreenElementProps id = title_icon rot_angle = 0 rgba = <icon_color>
				else
					return
				endif
				wait_time = Random(@0.25 @0.5 @2.25)
				wait <wait_time> seconds
			else
				return
			endif
		repeat
	endscript
	script test_scrolling_menu
		FormatText ChecksumName = title_icon "%i_sound" i = (THEME_PREFIXES[current_theme_prefix])
		make_new_themed_scrolling_menu title = "SCROLLING" title_icon = <title_icon>
		SetScreenElementProps {
			id = sub_menu
			event_handlers = [{pad_back generic_menu_pad_back params = {callback = create_test_menu}}]
			replace_handlers
		}
		theme_menu_add_item text = "Standard" pad_choose_script = null_script centered no_bg first_item
		theme_menu_add_item text = "Stuff" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Things" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Other" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Blah" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Wow" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Tony" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Hawk's" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Pro" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Skater" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "1 2 3 4 5 6 7 8 9" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "One" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Two" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Three" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Four" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Five" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Six" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Seven" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Eight" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Nine" pad_choose_script = null_script centered no_bg
		theme_menu_add_item text = "Ten" pad_choose_script = null_script centered no_bg last_item
		finish_themed_scrolling_menu
	endscript
	script make_new_themed_scrolling_menu title = "SCROLL" dims = (300.0,227.0) pos = (229.0,80.0) right_bracket_z = 1
		if GotParam no_bar
			make_new_themed_sub_menu title = <title> title_icon = <title_icon> Scrolling no_bar dims = <dims> pos = <pos> right_bracket_z = <right_bracket_z>
		else
			make_new_themed_sub_menu title = <title> title_icon = <title_icon> Scrolling dims = <dims> pos = <pos> right_bracket_z = <right_bracket_z>
		endif
		FormatText ChecksumName = arrow_rgba "%i_BG_PARTS_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		SetScreenElementProps {
			id = sub_vmenu
			event_handlers = [{pad_up menu_vert_blink_arrow params = {id = scrolling_menu_up_arrow rgba = <arrow_rgba>}}
				{pad_down menu_vert_blink_arrow params = {id = scrolling_menu_down_arrow rgba = <arrow_rgba>}}
			]
		}
	endscript
	script finish_themed_scrolling_menu pos = (320.0,85.0) time = 0.2
		GetScreenElementDims id = sub_scrolling_menu
		parts = (<height> / theme_menu_bg_parts_height)
		if LevelIs load_skateshop
			pos = (188.0,60.0)
		endif
		if NOT GotParam bg_width
			if NOT GotParam wide_menu
				bg_width = (widest_menu_item_width * 0.0125)
			else
				bg_width = (widest_menu_item_width * 0.025)
			endif
		endif
		theme_background width = <bg_width> pos = <pos> num_parts = <parts> z_priority = <z_priority> parent = sub_menu
		if ScreenElementExists id = bg_box_top
			CreateScreenElement {
				type = SpriteElement
				parent = bg_box_top
				id = scrolling_menu_up_arrow
				texture = up_arrow
				pos = (0.0,13.0)
				just = [center center]
				rgba = <bg_piece_rgba>
				scale = (0.80000001,1.0)
				z_priority = 3
			}
			GetScreenElementPosition id = sub_scrolling_menu
			DoScreenElementMorph id = sub_scrolling_menu pos = (<ScreenElementPos> + (0.0,30.0))
		endif
		if ScreenElementExists id = bg_box_bottom
			CreateScreenElement {
				type = SpriteElement
				parent = bg_box_bottom
				id = scrolling_menu_down_arrow
				texture = down_arrow
				pos = (0.0,-5.0)
				just = [center center]
				rgba = <bg_piece_rgba>
				scale = (0.80000001,1.0)
				z_priority = 3
			}
		endif
		wait 2 gameframes
		SetScreenElementProps id = sub_scrolling_menu reset_window_top
		finish_themed_sub_menu time = <time>
	endscript
	script theme_background parent = current_menu_anchor id = bg_box_vmenu width = 5 pos = (320.0,85.0) num_parts = 5 z_priority = 1
		if NOT GotParam bg_rgba
			FormatText ChecksumName = bg_rgba "%i_BG_PARTS_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		endif
		CreateScreenElement {
			type = VMenu
			parent = <parent>
			id = <id>
			font = small
			just = [left top]
			pos = <pos>
			padding_scale = 1
			internal_scale = 1
			internal_just = [center center]
		}
		anchor_id = <id>
		middle_parts = <num_parts>
		CasttoInteger middle_parts
		partial_scale = (<num_parts> - <middle_parts>)
		printf "partial_scale = %p" p = <partial_scale>
		build_theme_bg_top parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts>
		while
			build_theme_bg_middle parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts>
		repeat <middle_parts>
		build_theme_bg_middle parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts>
		build_theme_bg_bottom parent = <anchor_id> width = <width> bg_rgba = <bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> dark_menu = <dark_menu> static = <static> use_mm_parts = <use_mm_parts>
	endscript
	script build_theme_bg_top
		if GotParam dark_menu
			m_texture = spec_T_M
			l_texture = spec_T_L
			r_texture = spec_T_R
		else
			if GotParam use_mm_parts
				m_texture = MM_T_M
				l_texture = MM_T_L
				r_texture = MM_T_R
			else
				m_texture = DE_T_M
				l_texture = DE_T_L
				r_texture = DE_T_R
			endif
		endif
		if NOT GotParam static
			if LevelIs load_skateshop
				m_texture = MM_T_M
				l_texture = MM_T_L
				r_texture = MM_T_R
			endif
		endif
		if (<parent> = bg_box_vmenu)
			top_id = bg_box_top
		endif
		CreateScreenElement {
			type = ContainerElement
			id = <top_id>
			dims = (0.0,32.0)
			parent = <parent>
		}
		anchor_id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = <m_texture>
			pos = (0.0,0.0)
			just = [center top]
			rgba = <bg_rgba>
			scale = ((1.0,0.0) * <width> + (0.0,1.0))
			z_priority = <z_priority>
		}
		GetScreenElementDims id = <id>
		right_pos = ((0.5,0.0) * <width>)
		left_pos = ((-0.5,0.0) * <width>)
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = <l_texture>
			pos = <left_pos>
			just = [right top]
			rgba = <bg_rgba>
			scale = (1.0,1.0)
			z_priority = <z_priority>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = <r_texture>
			pos = <right_pos>
			just = [left top]
			rgba = <bg_rgba>
			scale = (1.0,1.0)
			z_priority = <z_priority>
		}
	endscript
	script build_theme_bg_middle scale_height = 1
		if GotParam dark_menu
			m_texture = spec_M_M
			l_texture = spec_M_L
			r_texture = spec_M_R
		else
			if GotParam use_mm_parts
				m_texture = MM_M_M
				l_texture = MM_M_L
				r_texture = MM_M_R
			else
				m_texture = DE_M_M
				l_texture = DE_M_L
				r_texture = DE_M_R
			endif
		endif
		if NOT GotParam static
			if LevelIs load_skateshop
				m_texture = MM_M_M
				l_texture = MM_M_L
				r_texture = MM_M_R
			endif
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			dims = ((0.0,1.0) * theme_menu_bg_parts_height)
		}
		anchor_id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = <m_texture>
			pos = (0.0,0.0)
			just = [center top]
			rgba = <bg_rgba>
			scale = ((1.0,0.0) * <width> + <scale_height> * (0.0,1.0))
			z_priority = <z_priority>
		}
		GetScreenElementDims id = <id>
		right_pos = ((0.5,0.0) * <width>)
		left_pos = ((-0.5,0.0) * <width>)
		side_scale = ((1.0,0.0) * 1 + <scale_height> * (0.0,1.0))
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = <l_texture>
			pos = <left_pos>
			just = [right top]
			rgba = <bg_rgba>
			scale = <side_scale>
			z_priority = <z_priority>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = <r_texture>
			pos = <right_pos>
			just = [left top]
			rgba = <bg_rgba>
			scale = <side_scale>
			z_priority = <z_priority>
		}
	endscript
	script build_theme_bg_bottom
		if GotParam dark_menu
			m_texture = spec_B_M
			l_texture = spec_B_L
			r_texture = spec_B_R
		else
			if GotParam use_mm_parts
				m_texture = MM_B_M
				l_texture = MM_B_L
				r_texture = MM_B_R
			else
				m_texture = DE_B_M
				l_texture = DE_B_L
				r_texture = DE_B_R
			endif
		endif
		if NOT GotParam static
			if LevelIs load_skateshop
				m_texture = MM_B_M
				l_texture = MM_B_L
				r_texture = MM_B_R
			endif
		endif
		if (<parent> = bg_box_vmenu)
			bot_id = bg_box_bottom
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			id = <bot_id>
			dims = (0.0,32.0)
		}
		anchor_id = <id>
		pos = ((0.0,-1.0) * (theme_menu_bg_parts_height - (<scale_height> * theme_menu_bg_parts_height)))
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = <m_texture>
			pos = <pos>
			just = [center top]
			rgba = <bg_rgba>
			scale = ((1.0,0.0) * <width> + (0.0,1.0))
			z_priority = <z_priority>
		}
		GetScreenElementDims id = <id>
		right_pos = ((0.5,0.0) * <width> + <pos>)
		left_pos = ((-0.5,0.0) * <width> + <pos>)
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = <l_texture>
			pos = <left_pos>
			just = [right top]
			rgba = <bg_rgba>
			scale = (1.0,1.0)
			z_priority = <z_priority>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = <r_texture>
			pos = <right_pos>
			just = [left top]
			rgba = <bg_rgba>
			scale = (1.0,1.0)
			z_priority = <z_priority>
		}
	endscript
