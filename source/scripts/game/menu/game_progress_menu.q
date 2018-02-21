
	script game_progress_menu_create
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		GoalManager_HidePoints
		GoalManager_HideGoalPoints
		if NOT LevelIs load_skateshop
			PauseMusicAndStreams 1
		else
			skater::remove_skater_from_world
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = progress_anchor
			dims = (640.0,480.0)
			pos = (320.0,240.0)
		}
		AssignAlias id = progress_anchor alias = current_menu_anchor
		create_helper_text {helper_text_elements = [{text = "\b7/\b4 = Select"}
				{text = "\bn = Back"}
			]
		}
		kill_start_key_binding
		FormatText ChecksumName = title_icon "%i_pro" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_sub_title title = "GAME PROGRESS" title_icon = <title_icon>
		FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
		if LevelIs load_skateshop
			build_top_and_bottom_blocks
			make_mainmenu_3d_plane
		else
			build_theme_box_icons icon_texture = <paused_icon>
			build_grunge_piece
			build_top_bar pos = (0.0,62.0)
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = progress_anchor
			id = progress_menu
			dims = (640.0,480.0)
			pos = (320.0,640.0)
		}
		AssignAlias id = progress_menu alias = current_menu_anchor
		theme_background width = 6.3499999 pos = (320.0,85.0) num_parts = 10.5
		<root_pos> = (80.0,25.0)
		FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = icon_color "%i_ICON_ON_VALUE" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		GetStackedScreenElementPos X id = <id> offset = (115.0,0.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = view_progress_menu_up_arrow
			texture = up_arrow
			rgba = [128 128 128 85]
			pos = (300.0,90.0)
			just = [left top]
			z_priority = 3
		}
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			texture = black
			scale = (2.0,75.0)
			pos = (380.0,90.0)
			just = [left top]
			rgba = [0 0 0 128]
		}
		GetStackedScreenElementPos Y id = view_progress_menu_up_arrow offset = (0.0,260.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = view_progress_menu_down_arrow
			texture = down_arrow
			rgba = [128 128 128 85]
			pos = <pos>
			just = [left top]
			z_priority = 3
		}
		CreateScreenElement {
			type = VScrollingMenu
			parent = current_menu_anchor
			id = vs1
			dims = (640.0,245.0)
			pos = (54.0,110.0)
			just = [left top]
			internal_just = [center top]
		}
		CreateScreenElement {
			type = VMenu
			parent = <id>
			id = progress_vmenu
			pos = (0.0,0.0)
			just = [left top]
			internal_just = [left top]
			dont_allow_wrap
			event_handlers = [
				{pad_up menu_vert_blink_arrow params = {id = view_progress_menu_up_arrow rgba = <text_rgba>}}
				{pad_down menu_vert_blink_arrow params = {id = view_progress_menu_down_arrow rgba = <text_rgba>}}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		AssignAlias id = progress_vmenu alias = current_menu
		SetScreenElementProps {
			id = current_menu
			event_handlers = [{pad_back generic_menu_pad_back params = {callback = game_progress_menu_exit}}]
		}
		GoalManager_GetNumberOfGoalPoints total
		FormatText TextName = goal_points "%i / %j" i = <goal_points> j = total_num_goals
		progress_menu_add_item id1 = progress_vmenu left_col_text = " GOALS COMPLETED:" right_col_text = <goal_points>
		progress_menu_add_item id1 = progress_vmenu seperator
		GetCompletionStatusText mode = SKATER_UNLOCKED_IRONMAN
		progress_menu_add_item id1 = progress_vmenu left_col_text = " BEGINNER STORY MODE SECRET:" right_col_text = <completion_status>
		GetCompletionStatusText mode = SKATER_UNLOCKED_KISSDUDE
		progress_menu_add_item id1 = progress_vmenu left_col_text = " NORMAL STORY MODE SECRET:" right_col_text = <completion_status>
		GetCompletionStatusText mode = SKATER_UNLOCKED_CREATURE
		progress_menu_add_item id1 = progress_vmenu left_col_text = " SICK STORY MODE SECRET:" right_col_text = <completion_status>
		progress_menu_add_item id1 = progress_vmenu seperator
		GetArraySize base_game_level_info
		<index> = 0
		while
			if NOT (((base_game_level_info[<index>]).level) = load_sk5ed_gameplay)
				<level_num> = ((base_game_level_info[<index>]).level_num)
				GetLevelNumTapeCollected level = <level_num>
				if GetGlobalFlag flag = ((base_game_level_info[<index>]).flag)
					FormatText TextName = level_text " %s SECRET TAPE:" s = ((base_game_level_info[<index>]).text)
				else
					if (all_levels_unlocked = 1)
						FormatText TextName = level_text " %s SECRET TAPE:" s = ((base_game_level_info[<index>]).text)
					else
						FormatText TextName = level_text " %s SECRET TAPE:" s = "??????"
					endif
				endif
				progress_menu_add_item id1 = progress_vmenu left_col_text = <level_text> check_box = <collected>
			endif
			<index> = (<index> + 1)
		repeat 9
		progress_menu_add_item id1 = progress_vmenu seperator
		GetCompletionStatus mode = LEVEL_UNLOCKED_SC2
		if ((GetGlobalFlag flag = LEVEL_UNLOCKED_NJ) || (all_levels_unlocked = 1))
			progress_menu_add_item id1 = progress_vmenu left_col_text = " NEW JERSEY OLD SKOOL LEVEL:" check_box = <completion_status>
		else
			progress_menu_add_item id1 = progress_vmenu left_col_text = " ?????? SKOOL LEVEL:" check_box = <completion_status>
		endif
		GetCompletionStatus mode = LEVEL_UNLOCKED_VN
		if ((GetGlobalFlag flag = LEVEL_UNLOCKED_HI) || (all_levels_unlocked = 1))
			progress_menu_add_item id1 = progress_vmenu left_col_text = " HAWAII OLD SKOOL LEVEL:" check_box = <completion_status>
		else
			progress_menu_add_item id1 = progress_vmenu left_col_text = " ?????? OLD SKOOL LEVEL:" check_box = <completion_status>
		endif
		GetCompletionStatus mode = LEVEL_UNLOCKED_HN
		if ((GetGlobalFlag flag = LEVEL_UNLOCKED_RU) || (all_levels_unlocked = 1))
			progress_menu_add_item id1 = progress_vmenu left_col_text = " MOSCOW OLD SKOOL LEVEL:" check_box = <completion_status>
		else
			progress_menu_add_item id1 = progress_vmenu left_col_text = " ?????? OLD SKOOL LEVEL:" check_box = <completion_status>
		endif
		progress_menu_add_item id1 = progress_vmenu seperator
		GetArraySize base_game_level_info
		<index> = 0
		while
			if NOT (((base_game_level_info[<index>]).level) = load_sk5ed_gameplay)
				if NOT (((base_game_level_info[<index>]).level) = load_TestLevel)
					if NOT (((base_game_level_info[<index>]).level) = load_Default)
						if NOT StructureContains structure = ((base_game_level_info[<index>])) DEVKIT_ONLY
							<level_num> = ((base_game_level_info[<index>]).level_num)
							GetLevelGapTotals level = <level_num>
							if (<num_gaps> = 0)
								<gaps_text> = "0 / ??"
							else
								FormatText TextName = gaps_text "%i / %j" i = <num_collected_gaps> j = <num_gaps>
							endif
							if GetGlobalFlag flag = ((base_game_level_info[<index>]).flag)
								FormatText TextName = level_text " %s GAPS:" s = ((base_game_level_info[<index>]).text)
							else
								if (all_levels_unlocked = 1)
									FormatText TextName = level_text " %s GAPS:" s = ((base_game_level_info[<index>]).text)
								else
									FormatText TextName = level_text " %s GAPS:" s = "??????"
								endif
							endif
							progress_menu_add_item id1 = progress_vmenu left_col_text = <level_text> right_col_text = <gaps_text>
						endif
					endif
				endif
			endif
			<index> = (<index> + 1)
		repeat (<array_size>)
		if LevelIs load_skateshop
			DoScreenElementMorph id = current_menu_anchor pos = (320.0,218.0) time = 0.2
		else
			DoScreenElementMorph id = current_menu_anchor pos = (320.0,240.0) time = 0.2
		endif
		DoScreenElementMorph id = progress_vmenu time = 0.2 pos = (0.0,-200.0)
		FireEvent type = focus target = current_menu
	endscript
	script GetCompletionStatus
		if (GetGlobalFlag flag = <mode>)
			<completion_status> = 1
		else
			<completion_status> = 0
		endif
		return completion_status = <completion_status>
	endscript
	script GetCompletionStatusText
		if (GetGlobalFlag flag = <mode>)
			switch <mode>
				case SKATER_UNLOCKED_IRONMAN
					<completion_status> = "DONE: IRON MAN"
				case SKATER_UNLOCKED_KISSDUDE
					<completion_status> = "DONE: GENE"
				case SKATER_UNLOCKED_CREATURE
					<completion_status> = "DONE: T.H.U.D."
			endswitch
		else
			<completion_status> = "NOT FINISHED"
		endif
		return completion_status = <completion_status>
	endscript
	script progress_menu_add_item choose_script = nullscript left_col_text = "" right_col_text = ""
		FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		<anchor_id1> = <id1>
		if GotParam seperator
			CreateScreenElement {
				type = ContainerElement
				parent = <id1>
				pos = (65.0,10.0)
				dims = (200.0,20.0)
				not_focusable
			}
			<anchor_id1> = <id>
			CreateScreenElement {
				type = SpriteElement
				parent = <anchor_id1>
				texture = black
				scale = (132.0,3.29999995)
				pos = (4.0,0.0)
				just = [left top]
				rgba = [0 0 0 90]
				not_focusable
			}
		else
			if GotParam check_box
				FormatText ChecksumName = check_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
				FormatText ChecksumName = checkmark_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
				CreateScreenElement {
					type = ContainerElement
					parent = <id1>
					pos = (65.0,10.0)
					dims = (200.0,25.0)
					event_handlers = [
						{focus progress_menu_focus params = {checkbox_item = checkbox_item}}
						{unfocus progress_menu_unfocus params = {checkbox_item = checkbox_item}}
					]
				}
				<anchor_id1> = <id>
				CreateScreenElement {
					type = TextElement
					parent = <anchor_id1>
					font = small
					text = <left_col_text>
					pos = (10.0,0.0)
					just = [left top]
					rgba = <off_rgba>
					scale = 1.0
				}
				CreateScreenElement {
					type = SpriteElement
					parent = <anchor_id1>
					texture = checkbox
					pos = ((420.0,0.0) + (0.0,5.0))
					just = [center top]
					scale = 0.55000001
					rgba = <check_rgba>
					z_priority = 5
				}
				if (<check_box> = 1)
					CreateScreenElement {
						type = SpriteElement
						parent = <id>
						texture = checkmark
						pos = (25.0,-7.0)
						just = [center top]
						rgba = <checkmark_rgba>
						z_priority = 6
						scale = 1.39999998
					}
				else
					CreateScreenElement {
						type = SpriteElement
						parent = <id>
						texture = checkmark
						pos = (25.0,-7.0)
						just = [center top]
						rgba = [0 0 0 0]
						z_priority = 6
						scale = 1.39999998
					}
				endif
				highlight_angle = RandomNoRepeat(@2 @-2 @3 @-3 @3.5 @-3 @5 @-4 @2.5 @-4.5)
				CreateScreenElement {
					type = SpriteElement
					parent = <anchor_id1>
					texture = de_highlight_bar
					pos = (262.0,10.0)
					just = [center center]
					rgba = [0 0 0 0]
					z_priority = 3
					scale = (4.0999999,0.69999999)
					rot_angle = (<highlight_angle> / 4)
				}
			else
				CreateScreenElement {
					type = ContainerElement
					parent = <id1>
					pos = (65.0,10.0)
					dims = (200.0,25.0)
					event_handlers = [
						{focus progress_menu_focus}
						{unfocus progress_menu_unfocus}
					]
				}
				<anchor_id1> = <id>
				CreateScreenElement {
					type = TextElement
					parent = <anchor_id1>
					font = small
					text = <left_col_text>
					pos = (10.0,0.0)
					just = [left top]
					rgba = <off_rgba>
					scale = 1.0
				}
				CreateScreenElement {
					type = TextElement
					parent = <anchor_id1>
					font = small
					text = <right_col_text>
					pos = (420.0,0.0)
					just = [center top]
					rgba = <off_rgba>
					scale = 1.0
				}
				highlight_angle = RandomNoRepeat(@2 @-2 @3 @-3 @3.5 @-3 @5 @-4 @2.5 @-4.5)
				CreateScreenElement {
					type = SpriteElement
					parent = <anchor_id1>
					texture = de_highlight_bar
					pos = (262.0,10.0)
					just = [center center]
					rgba = [0 0 0 0]
					z_priority = 3
					scale = (4.0999999,0.69999999)
					rot_angle = (<highlight_angle> / 4)
				}
			endif
		endif
	endscript
	script progress_menu_focus
		GetTags
		FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		RunScriptOnScreenElement id = {<id> child = 0} text_twitch_effect2
		DoScreenElementMorph {
			id = {<id> child = 0}
			rgba = <text_rgba>
		}
		if GotParam checkbox_item
			FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
			SetScreenElementProps {
				id = {<id> child = 2}
				rgba = <bar_rgba>
			}
		else
			RunScriptOnScreenElement id = {<id> child = 1} text_twitch_effect2
			DoScreenElementMorph {
				id = {<id> child = 1}
				rgba = <text_rgba>
			}
			FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
			SetScreenElementProps {
				id = {<id> child = 2}
				rgba = <bar_rgba>
			}
		endif
	endscript
	script progress_menu_unfocus
		GetTags
		FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		KillSpawnedScript name = text_twitch_effect2
		DoScreenElementMorph {
			id = {<id> child = 0}
			rgba = <text_rgba>
		}
		if GotParam checkbox_item
			SetScreenElementProps {
				id = {<id> child = 2}
				rgba = [0 0 0 0]
			}
		else
			DoScreenElementMorph {
				id = {<id> child = 1}
				rgba = <text_rgba>
			}
			SetScreenElementProps {
				id = {<id> child = 2}
				rgba = [0 0 0 0]
			}
		endif
	endscript
	script game_progress_menu_exit
		if ObjectExists id = progress_anchor
			DestroyScreenElement id = progress_anchor
			wait 1 gameframe
		endif
		if ObjectExists id = box_icon
			DestroyScreenElement id = box_icon
			wait 1 gameframe
		endif
		if ObjectExists id = box_icon_2
			DestroyScreenElement id = box_icon_2
			wait 1 gameframe
		endif
		if ObjectExists id = grunge_anchor
			DestroyScreenElement id = grunge_anchor
			wait 1 gameframe
		endif
		if LevelIs load_skateshop
			create_setup_options_menu
		else
			create_options_menu
		endif
	endscript
