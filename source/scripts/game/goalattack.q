
	goal_goalattack_genericParams = {
		goal_text = "You must complete all of the goals to win!"
		unlimited_time = 1
		no_restart
		net
		init = goal_goalattack_init
		activate = goal_goalattack_activate
		deactivate = goal_goalattack_deactivate
		expire = goal_goalattack_expire
		goal_description = "Goal Attack!"
	}
	script goal_goalattack_init
	endscript
	script goal_goalattack_activate
		if InNetGame
			if IsObserving
				FormatText TextName = msg_text "\c2Goal Attack \n\c0Complete all selected goals.\n"
				create_panel_block id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos>
			endif
		endif
		ResetScore
		GoalManager_ClearLastGoal
		GoalManager_SetCanStartGoal 1
	endscript
	script goal_goalattack_deactivate
		GoalManager_ClearLastGoal
		if ObjectExists id = mp_goal_text
			DestroyScreenElement id = mp_goal_text
		endif
		if ScreenElementExists id = goal_retry_anchor
			DestroyScreenElement id = goal_retry_anchor
		endif
	endscript
	script goalattack_done
		dialog_box_exit
		do_backend_retry
	endscript
	script goal_goalattack_expire
		if ObjectExists id = goal_message
			DestroyScreenElement id = goal_message
		endif
		printf "goal_goalattack_expire"
		GoalManager_LoseGoal name = <goal_id>
		if OnServer
			CalculateFinalScores
			SendGameOverToObservers
			SpawnScript wait_then_create_rankings params = {score_title_text = "GOALS"}
		else
			create_rankings score_title_text = "GOALS"
		endif
	endscript
	script AddGoal_GoalAttack
		GoalManager_AddGoal name = goalattack {
			params = {goal_goalattack_genericParams
				<...>
			}
		}
	endscript
	script StartGoal_GoalAttack
		GoalManager_EditGoal name = goalattack params = <...>
		GoalManager_ActivateGoal name = goalattack
	endscript
	script back_to_game_options
		dialog_box_exit
		create_network_game_options_menu
	endscript
	script create_choose_goals_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		GoalManager_HidePoints
		hide_net_player_names
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = goals_anchor
			dims = (640.0,480.0)
			pos = (320.0,240.0)
		}
		AssignAlias id = goals_anchor alias = current_menu_anchor
		kill_start_key_binding
		FormatText ChecksumName = title_icon "%i_options" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_sub_title title = "CHOOSE GOALS" title_icon = <title_icon>
		FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_box_icons icon_texture = <paused_icon>
		build_grunge_piece
		build_top_bar pos = (0.0,62.0)
		CreateScreenElement {
			type = ContainerElement
			parent = goals_anchor
			id = goals_menu
			dims = (640.0,480.0)
			pos = (320.0,640.0)
		}
		AssignAlias id = goals_menu alias = current_menu_anchor
		theme_background width = 6.3499999 pos = (320.0,85.0) num_parts = 10.5
		<root_pos> = (80.0,25.0)
		FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = view_goals_menu_top_bar
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
			text = "Goals"
			rgba = <text_rgba>
			scale = 1
			pos = <pos>
			just = [left top]
			z_priority = 3
		}
		GetStackedScreenElementPos X id = <id> offset = (115.0,0.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = view_goals_menu_up_arrow
			texture = up_arrow
			rgba = [128 128 128 85]
			pos = <pos>
			just = [left top]
			z_priority = 3
		}
		GetStackedScreenElementPos X id = <id> offset = (210.0,0.0)
		CreateScreenElement {
			type = TextElement
			parent = current_menu_anchor
			font = dialog
			text = "On/Off"
			rgba = <text_rgba>
			pos = <pos>
			just = [left top]
			scale = 1
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = view_goals_menu_top_bar offset = (60.0,0.0)
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
		GetStackedScreenElementPos Y id = view_goals_menu_top_bar offset = (0.0,250.0)
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
		GetStackedScreenElementPos Y id = view_goals_menu_up_arrow offset = (0.0,260.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = view_goals_menu_down_arrow
			texture = down_arrow
			rgba = [128 128 128 85]
			pos = <pos>
			just = [left top]
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = view_goals_menu_top_bar offset = (20.0,5.0)
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
			id = goals_vmenu
			pos = (0.0,0.0)
			just = [left top]
			internal_just = [left top]
			dont_allow_wrap
			event_handlers = [
				{pad_up set_which_arrow params = {arrow = view_goals_menu_up_arrow}}
				{pad_down set_which_arrow params = {arrow = view_goals_menu_down_arrow}}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back generic_menu_pad_back_sound}
			]
		}
		AssignAlias id = goals_vmenu alias = current_menu
		DoScreenElementMorph id = current_menu_anchor pos = (320.0,240.0) time = 0.2
		FireEvent type = focus target = current_menu
		SetScreenElementProps {id = current_menu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = exit_choose_goals_menu}}
			]
		}
		GoalManager_AddGoalChoices
		create_helper_text generic_helper_text
	endscript
	script exit_choose_goals_menu
		if ObjectExists id = goals_anchor
			DestroyScreenElement id = goals_anchor
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
		create_network_game_options_menu
	endscript
	script hide_net_player_names
		if GotParam on
			scale = 1
		else
			scale = 0
		endif
		index = 0
		while
			if ScreenElementExists id = {net_score_menu child = <index>}
				DoScreenElementMorph id = {net_score_menu child = <index>} scale = <scale> time = 0
			endif
		repeat 8
	endscript
	script choose_goals_menu_set_events
		FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = ContainerElement
			parent = current_menu
			just = [left top]
			internal_just = [left top]
			dims = (640.0,20.0)
			event_handlers = [{focus choose_goals_menu_focus}
				{unfocus choose_goals_menu_unfocus}
				{pad_choose choose_goals_menu_choose params = {name = <goal_id>}}
			]
		}
		<row_container_id> = <id>
		CreateScreenElement {
			type = TextElement
			parent = <row_container_id>
			just = [left center]
			font = small
			text = <text>
			scale = 0.80000001
			rgba = <off_rgba>
		}
		GetScreenElementDims id = <id>
		if (<width> > 310)
			printf <width>
			DoScreenElementMorph time = 0 id = <id> scale = (0.80000001 * 310.0 / <width>)
		endif
		highlight_angle = RandomNoRepeat(@2 @-2 @3 @-3 @3.5 @-3 @5 @-4 @2.5 @-4.5)
		CreateScreenElement {
			type = SpriteElement
			parent = <row_container_id>
			texture = de_highlight_bar
			pos = (-25.0,0.0)
			just = [left center]
			rgba = [0 0 0 0]
			z_priority = 3
			scale = (4.0999999,0.69999999)
			rot_angle = (<highlight_angle> / 4)
		}
		if GoalManager_GoalIsSelected name = <goal_id>
			<check_rgba> = <on_rgba>
		else
			<check_rgba> = [0 0 0 0]
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <row_container_id>
			just = [left center]
			font = small
			texture = checkbox
			pos = (420.0,0.0)
			scale = 0.5
			rgba = <off_rgba>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <row_container_id>
			just = [left center]
			font = small
			texture = checkmark
			pos = (420.0,-2.0)
			scale = 0.75
			rgba = <check_rgba>
			z_priority = 10
		}
	endscript
	script view_selected_goals_menu_set_events
		FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = ContainerElement
			parent = current_menu
			just = [left top]
			internal_just = [left top]
			dims = (640.0,20.0)
			event_handlers = [{focus choose_goals_menu_focus}
				{unfocus choose_goals_menu_unfocus}
			]
		}
		<row_container_id> = <id>
		GoalManager_ReplaceTrickText name = <goal_id>
		wait 200
		printstruct <...>
		CreateScreenElement {
			type = TextElement
			parent = <row_container_id>
			just = [left center]
			font = small
			text = <text>
			scale = 0.80000001
			rgba = <off_rgba>
		}
		highlight_angle = RandomNoRepeat(@2 @-2 @3 @-3 @3.5 @-3 @5 @-4 @2.5 @-4.5)
		CreateScreenElement {
			type = SpriteElement
			parent = <row_container_id>
			texture = de_highlight_bar
			pos = (-25.0,0.0)
			just = [left center]
			rgba = [0 0 0 0]
			z_priority = 3
			scale = (4.0999999,0.69999999)
			rot_angle = (<highlight_angle> / 4)
		}
		if GoalManager_HasWonGoal name = <goal_id>
			<check_rgba> = <on_rgba>
		else
			<check_rgba> = [0 0 0 0]
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <row_container_id>
			just = [left center]
			font = small
			texture = checkbox
			pos = (420.0,0.0)
			scale = 0.5
			rgba = <off_rgba>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <row_container_id>
			just = [left center]
			font = small
			texture = checkmark
			pos = (420.0,0.0)
			scale = 0.75
			rgba = <check_rgba>
			z_priority = 10
		}
	endscript
	script choose_goals_menu_choose
		GetTags
		FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if OnServer
			GoalManager_ToggleGoalSelection <...>
		else
			GoalManager_ToggleGoalSelection <...>
			FCFSRequestToggleGoalSelection <...>
		endif
		wait 0.2 seconds
		if GoalManager_GoalIsSelected name = <name>
			DoScreenElementMorph {
				id = {<id> child = 3}
				rgba = <text_rgba>
			}
		else
			DoScreenElementMorph {
				id = {<id> child = 3}
				rgba = [0 0 0 0]
			}
		endif
	endscript
	script choose_goals_menu_focus
		GetTags
		FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		RunScriptOnScreenElement id = {<id> child = 0} text_twitch_effect2
		GetScreenElementDims id = {<id> child = 0}
		if (<width> > 305)
			printf <width>
			DoScreenElementMorph time = 0 id = {<id> child = 0} scale = (0.80000001 * 310.0 / <width>) rgba = <text_rgba>
		else
			DoScreenElementMorph {
				id = {<id> child = 0}
				rgba = <text_rgba>
				scale = (0.80000001 * ((<width> + 5.0) / <width>))
			}
		endif
		FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		SetScreenElementProps {
			id = {<id> child = 1}
			rgba = <bar_rgba>
		}
		if GotParam first_item
			SetScreenElementProps {
				id = view_goals_menu_up_arrow
				rgba = [128 128 128 0]
			}
		else
			SetScreenElementProps {
				id = view_goals_menu_up_arrow
				rgba = [128 128 128 85]
			}
		endif
		if GotParam last_item
			SetScreenElementProps {
				id = view_goals_menu_down_arrow
				rgba = [128 128 128 0]
			}
		else
			SetScreenElementProps {
				id = view_goals_menu_down_arrow
				rgba = [128 128 128 85]
			}
		endif
		goals_vmenu::GetTags
		if GotParam arrow_id
			menu_vert_blink_arrow {id = <arrow_id>}
		endif
	endscript
	script choose_goals_menu_unfocus
		GetTags
		FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		KillSpawnedScript name = text_twitch_effect2
		DoScreenElementMorph {
			id = {<id> child = 0}
			rgba = <text_rgba>
			scale = 0.80000001
		}
		GetScreenElementDims id = {<id> child = 0}
		if (<width> > 310)
			printf <width>
			DoScreenElementMorph time = 0 id = {<id> child = 0} scale = (0.80000001 * 310.0 / <width>)
		endif
		SetScreenElementProps {
			id = {<id> child = 1}
			rgba = [0 0 0 0]
		}
	endscript
	script toggle_selection
		if OnServer
			GoalManager_ToggleGoalSelection <...>
		else
			GoalManager_ToggleGoalSelection <...>
			FCFSRequestToggleGoalSelection <...>
		endif
	endscript
	script wait_and_create_view_selected_goals_menu
		wait 120 frames
		create_view_selected_goals_menu <...>
	endscript
	script create_view_selected_goals_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		edit_tricks_menu_exit just_remove
		if NOT GotParam from_pause
			exit_pause_menu
		endif
		hide_current_goal
		destroy_onscreen_keyboard
		dialog_box_exit
		GoalManager_HidePoints
		pause_balance_meter
		pause_run_timer
		kill_start_key_binding
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = goals_anchor
			dims = (640.0,480.0)
			pos = (320.0,240.0)
		}
		AssignAlias id = goals_anchor alias = current_menu_anchor
		kill_start_key_binding
		FormatText ChecksumName = title_icon "%i_options" i = (THEME_PREFIXES[current_theme_prefix])
		if GotParam goal_summary
			build_theme_sub_title title = "GOAL LIST" title_icon = <title_icon>
		else
			build_theme_sub_title title = "VIEW GOALS" title_icon = <title_icon>
		endif
		FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_box_icons icon_texture = <paused_icon>
		build_grunge_piece
		build_top_bar pos = (0.0,62.0)
		CreateScreenElement {
			type = ContainerElement
			parent = goals_anchor
			id = goals_menu
			dims = (640.0,480.0)
			pos = (320.0,640.0)
		}
		theme_background width = 6.3499999 pos = (320.0,85.0) num_parts = 10.5
		<root_pos> = (80.0,25.0)
		FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = view_goals_menu_top_bar
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
			text = "Goals"
			rgba = <text_rgba>
			scale = 1
			pos = <pos>
			just = [left top]
			z_priority = 3
		}
		GetStackedScreenElementPos X id = <id> offset = (115.0,0.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = view_goals_menu_up_arrow
			texture = up_arrow
			rgba = [128 128 128 85]
			pos = <pos>
			just = [left top]
			z_priority = 3
		}
		GetStackedScreenElementPos X id = <id> offset = (190.0,0.0)
		CreateScreenElement {
			type = TextElement
			parent = current_menu_anchor
			font = dialog
			text = "Completed"
			rgba = <text_rgba>
			pos = <pos>
			just = [left top]
			scale = 1
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = view_goals_menu_top_bar offset = (60.0,0.0)
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
		GetStackedScreenElementPos Y id = view_goals_menu_top_bar offset = (0.0,250.0)
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
		GetStackedScreenElementPos Y id = view_goals_menu_up_arrow offset = (0.0,260.0)
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = view_goals_menu_down_arrow
			texture = down_arrow
			rgba = [128 128 128 85]
			pos = <pos>
			just = [left top]
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = view_goals_menu_top_bar offset = (20.0,5.0)
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
			id = goals_vmenu
			pos = (0.0,0.0)
			just = [left top]
			internal_just = [left top]
			dont_allow_wrap
			event_handlers = [
				{pad_up set_which_arrow params = {arrow = view_goals_menu_up_arrow}}
				{pad_down set_which_arrow params = {arrow = view_goals_menu_down_arrow}}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back generic_menu_pad_back_sound}
			]
		}
		AssignAlias id = goals_vmenu alias = current_menu
		DoScreenElementMorph id = current_menu_anchor pos = (320.0,240.0) time = 0.2
		FireEvent type = focus target = current_menu
		if GotParam goal_summary
			SetScreenElementProps {id = current_menu
				event_handlers = [
					{pad_back generic_menu_pad_back params = {callback = close_goals_menu}}
				]
			}
		else
			SetScreenElementProps {id = current_menu
				event_handlers = [
					{pad_back generic_menu_pad_back params = {callback = exit_view_goals_menu}}
				]
			}
		endif
		GoalManager_AddGoalChoices selected_only
		create_helper_text helper_text_elements = [{text = "\m1 = Back"}]
	endscript
	script exit_view_goals_menu
		if ObjectExists id = goals_anchor
			DestroyScreenElement id = goals_anchor
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
		create_pause_menu
	endscript
	script close_goals_menu
		if ObjectExists id = goals_anchor
			DestroyScreenElement id = goals_anchor
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
		GoalManager_ShowPoints
		unpause_balance_meter
		unpause_run_timer
		restore_start_key_binding
		if ObjectExists id = view_goals_menu
			exit_pause_menu
		endif
	endscript
	script goal_attack_completed_goal
		FormatText TextName = msg_text "Goal Completed! %i to go!" i = <NumGoalsLeft>
		create_net_panel_message text = <msg_text> style = net_team_panel_message
	endscript
	script goal_attack_completed_goal_other_same_team
		FormatText TextName = msg_text "%n Completed %t! %i to go!" n = <PlayerName> t = <GoalText> i = <NumGoalsLeft>
		create_net_panel_message text = <msg_text> style = net_team_panel_message
	endscript
	script goal_attack_started_goal_other_same_team
		FormatText TextName = msg_text "%n Started %t!" n = <PlayerName> t = <GoalText>
		create_net_panel_message text = <msg_text> style = net_team_panel_message
	endscript
