	balance_meter_info = {
		bar_positions = [
			(320.0,165.0)
			(250.0,224.0)
		]
		bar_positions_mp_h = [
			(320.0,70.0)
			(250.0,130.0)
		]
		bar_positions_mp_v = [
			(140.0,130.0)
			(80.0,224.0)
		]
		arrow_positions = [
			(0.0,-17.0)
			(10.0,-17.0)
			(20.0,-15.0)
			(30.0,-11.0)
			(40.0,-6.0)
			(50.0,1.0)
			(60.0,12.0)
		]
	}
	special_bar_colors = default_bar_colors
	default_bar_colors = [
		[128 0 9 128]
		[81 107 128 128]
		[128 0 9 128]
	]
	special_bar_iterpolator_rate = 0.1
	script hide_panel_stuff
		printf "*************** HIDING PANEL STUFF *********************"
		if ObjectExists id = player1_panel_container
			printf "*************** HIDING PANEL STUFF 2 *********************"
			DoScreenElementMorph {
				id = player1_panel_container
				alpha = 0
			}
		endif
	endscript
	script show_panel_stuff
		printf "*************** SHOWING PANEL STUFF *********************"
		if ObjectExists id = player1_panel_container
			printf "*************** HIDING PANEL STUFF 2 *********************"
			DoScreenElementMorph {
				id = player1_panel_container
				alpha = 1
			}
		endif
	endscript
	script destroy_panel_stuff
		if ScreenElementExists id = player1_panel_container
			DestroyScreenElement id = player1_panel_container
		endif
		if ScreenElementExists id = player2_panel_container
			DestroyScreenElement id = player2_panel_container
		endif
		if ScreenElementExists id = the_time
			DestroyScreenElement id = the_time
		endif
		if ScreenElementExists id = current_goal
			DestroyScreenElement id = current_goal
		endif
		if ScreenElementExists id = current_goal_key_combo_text
			DestroyScreenElement id = current_goal_key_combo_text
		endif
		if ScreenElementExists id = cash_goal_sprite
			DestroyScreenElement id = cash_goal_sprite
		endif
		if ScreenElementExists id = cash_text
			DestroyScreenElement id = cash_text
		endif
		if ScreenElementExists id = goal_points_text
			DestroyScreenElement id = goal_points_text
		endif
		if ScreenElementExists id = minigame_timer
			DestroyScreenElement id = minigame_timer
		endif
		if ScreenElementExists id = minigame_timer
			DestroyScreenElement id = minigame_timer
		endif
		if ScreenElementExists id = net_score_menu
			DestroyScreenElement id = net_score_menu
		endif
	endscript
	script create_panel_stuff
		if InSplitScreenGame
			ScriptGetScreenMode
			switch <screen_mode>
				case horse1
				case horse2
				case split_vertical
				case one_camera
					timer_pos = (285.0,20.0)
					timer_scale = 1.0
					if GameModeEquals is_horse
						trick_text_dims = (575.0,70.0)
						trick_text_pos = (287.0,2.0)
						player1_panel_dims = (640.0,448.0)
						player1_panel_pos = (0.0,0.0)
						player2_panel_dims = (640.0,448.0)
						player2_panel_pos = (0.0,0.0)
					else
						trick_text_dims = (240.0,70.0)
						trick_text_pos = (120.0,2.0)
						player1_panel_dims = (320.0,448.0)
						player1_panel_pos = (0.0,0.0)
						player2_panel_dims = (320.0,448.0)
						player2_panel_pos = (320.0,0.0)
					endif
					CreateScreenElement {
						id = player1_panel_container
						type = ContainerElement
						parent = root_window
						scale = 1.0
						dims = (320.0,448.0)
						pos = (0.0,0.0)
						just = [top left]
					}
					CreateScreenElement {
						id = player2_panel_container
						type = ContainerElement
						parent = root_window
						scale = 1.0
						dims = <player2_panel_dims>
						pos = <player2_panel_pos>
						just = [top left]
					}
				case split_horizontal
					trick_text_dims = (575.0,30.0)
					trick_text_pos = (287.0,2.0)
					timer_pos = (300.0,20.0)
					timer_scale = 1.0
					CreateScreenElement {
						id = player1_panel_container
						type = ContainerElement
						parent = root_window
						scale = 1.0
						dims = <player1_panel_dims>
						pos = <player1_panel_pos>
						just = [top left]
					}
					CreateScreenElement {
						id = player2_panel_container
						type = ContainerElement
						parent = root_window
						scale = 1.0
						dims = (640.0,224.0)
						pos = (0.0,224.0)
						just = [top left]
					}
			endswitch
		else
			trick_text_dims = (575.0,70.0)
			trick_text_pos = (287.0,2.0)
			timer_pos = (300.0,20.0)
			timer_scale = 1.29999995
			CreateScreenElement {
				id = player1_panel_container
				type = ContainerElement
				parent = root_window
				scale = 1.0
				dims = (640.0,448.0)
				pos = (0.0,0.0)
				just = [top left]
			}
		endif
		if ScreenElementExists id = goal_retry_pad_select
			DestroyScreenElement id = goal_retry_pad_select
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = goal_retry_pad_select
			pos = (0.0,0.0)
			dims = (0.0,0.0)
			event_handlers = [
				{pad_select goal_retry_select_handler}
			]
		}
		FireEvent type = focus target = goal_retry_pad_select
		CreateScreenElement {
			id = the_time
			type = textelement
			parent = root_window
			font = newtimerfont
			text = ""
			scale = <timer_scale>
			pos = <timer_pos>
			just = [center top]
			rgba = [128 128 128 68]
			z_priority = -1
		}
		CreateScreenElement {
			id = current_goal
			type = TextBlockElement
			parent = root_window
			font = small
			internal_scale = 0.80000001
			text = " "
			pos = (620.0,10.0)
			just = [right top]
			internal_just = [center top]
			dims = (250.0,100.0)
			rgba = [128 128 128 110]
			shadow
			shadow_offs = (0.5,0.5)
			shadow_rgba = [30 30 30 100]
		}
		FormatText ChecksumName = cash_color "%i_HUD_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = SpriteElement
			parent = root_window
			id = cash_goal_sprite
			texture = cash_goal
			scale = 0
			just = [left top]
			pos = (473.0,28.0)
			alpha = 0
			rgba = <cash_color>
			z_priority = -10
		}
		CreateScreenElement {
			type = textelement
			parent = root_window
			id = cash_text
			font = small
			text = " "
			scale = 0
			pos = (563.0,25.0)
			just = [left top]
			rgba = [105 105 105 128]
		}
		CreateScreenElement {
			type = textelement
			parent = root_window
			id = goal_points_text
			font = small
			pos = (585.0,40.0)
			just = [left top]
			scale = 0
			rgba = [105 105 105 128]
			text = " "
		}
		CreateScreenElement {
			type = textelement
			parent = root_window
			id = minigame_timer
			font = small
			pos = (19.0,180.0)
			just = [left, top]
			scale = 0.80000001
			rgba = [26 51 83 128]
		}
		CreateScreenElement {
			id = the_score
			type = textelement
			parent = player1_panel_container
			font = small
			text = "0"
			scale = 1.0
			pos = (136.0,27.0)
			just = [left top]
			rgba = [105 105 105 128]
		}
		FormatText ChecksumName = score_color "%i_HUD_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = special_color "%i_HUD_SPECIAL_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			id = the_score_sprite
			type = SpriteElement
			parent = the_score
			texture = score_small
			scale = (1.20000005,0.85000002)
			pos = (-17.0,23.0)
			rgba = <score_color>
		}
		CreateScreenElement {
			id = the_special_bar_special
			type = SpriteElement
			parent = the_score_sprite
			texture = special
			scale = (1.73000002,0.87)
			pos = (10.0,34.0)
			just = [left top]
			rgba = <special_color>
			z_priority = 5000
		}
		CreateScreenElement {
			id = the_special_bar_sprite
			type = SpriteElement
			parent = the_score_sprite
			texture = specialbar
			scale = (1.0,1.20000005)
			pos = (9.0,35.0)
			just = [left top]
			rgba = [128 128 128 100]
		}
		CreateScreenElement {
			id = the_boardstance_sprite
			type = SpriteElement
			parent = the_score_sprite
			texture = nollie_icon
			scale = (0.75,1.29999995)
			just = [left top]
			pos = (123.0,45.0)
			rot_angle = 90
			rgba = [128 128 128 78]
		}
		FormatText ChecksumName = sponsor_texture "%i_sponsor" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			id = generic_sponsor_logo
			type = SpriteElement
			parent = the_score_sprite
			texture = <sponsor_texture>
			scale = (0.85000002,0.85000002)
			just = [left top]
			pos = (-32.0,0.0)
			rgba = [128 128 128 108]
			z_priority = 3
		}
		CreateScreenElement {
			id = trick_text_container
			type = ContainerElement
			parent = player1_panel_container
			scale = 1.0
			dims = <trick_text_dims>
			just = [center center]
			alpha = 0.0
		}
		CreateScreenElement {
			id = the_trick_text
			type = TextBlockElement
			parent = trick_text_container
			scale = 1.0
			pos = {(0.5,0.0) proportional}
			dims = <trick_text_dims>
			just = [center top]
			internal_just = [center top]
			font = newtrickfont
			text = " "
			internal_scale = 0.69999999
			alpha = 1.0
			tags = {tag_state = inactive}
			shadow
			shadow_offs = (1.0,1.0)
			shadow_rgba = [30 30 30 75]
			z_priority = 0
		}
		CreateScreenElement {
			id = the_score_pot_text
			type = textelement
			parent = trick_text_container
			scale = 1.0
			pos = {(0.5,0.0) proportional}
			just = [center bottom]
			font = small
			text = " "
			alpha = 1.0
			z_priority = 0
		}
		reset_trick_text_appearance the_score_pot_text_id = the_score_pot_text the_trick_text_id = the_trick_text trick_text_container_id = trick_text_container
		CreateScreenElement {
			id = the_balance_meter
			type = SpriteElement
			parent = player1_panel_container
			texture = balancemeter
			scale = 1.0
			just = [center center]
			rgba = [128 128 128 0]
			tags = {tag_turned_on = 0 tag_mode = balance}
		}
		CreateScreenElement {
			type = SpriteElement
			parent = the_balance_meter
			texture = balancearrow_glow
			scale = 1.20000005
			pos = (0.0,0.0)
			just = [center center]
			rgba = [128 128 128 0]
			z_priority = 3
		}
		if InSplitScreenGame
			ScriptGetScreenMode
			ScriptGetScreenMode
			switch <screen_mode>
				case split_vertical
					CreateScreenElement {
						id = the_run_timer
						type = SpriteElement
						parent = player1_panel_container
						texture = watch
						scale = 1.0
						just = [center center]
						pos = (240.0,240.0)
						alpha = 0
						rgba = [128 128 128 90]
						tags = {tag_turned_on = 0 tag_mode = balance}
					}
				case split_horizontal
					CreateScreenElement {
						id = the_run_timer
						type = SpriteElement
						parent = player1_panel_container
						texture = watch
						scale = 1.0
						just = [center center]
						pos = (500.0,120.0)
						alpha = 0
						rgba = [128 128 128 90]
						tags = {tag_turned_on = 0 tag_mode = balance}
					}
				default
					CreateScreenElement {
						id = the_run_timer
						type = SpriteElement
						parent = player1_panel_container
						texture = watch
						scale = 1.0
						just = [center center]
						pos = (400.0,240.0)
						alpha = 0
						rgba = [128 128 128 90]
						tags = {tag_turned_on = 0 tag_mode = balance}
					}
			endswitch
		else
			CreateScreenElement {
				id = the_run_timer
				type = SpriteElement
				parent = player1_panel_container
				texture = watch
				scale = 1.0
				just = [center center]
				pos = (400.0,240.0)
				alpha = 0
				rgba = [128 128 128 90]
				tags = {tag_turned_on = 0 tag_mode = balance}
			}
		endif
		CreateScreenElement {
			id = the_run_timer_hand
			type = SpriteElement
			parent = the_run_timer
			texture = hand
			scale = 1.0
			pos = (24.0,24.0)
			just = [center center]
			rgba = [128 128 128 128]
			z_priority = 5
		}
		CreateScreenElement {
			type = SpriteElement
			parent = the_run_timer
			texture = time_1
			scale = 1.0
			pos = (7.0,8.0)
			just = [left top]
			rgba = [128 128 128 128]
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = the_run_timer
			texture = time_2
			scale = 1.0
			pos = <pos>
			just = [left top]
			rgba = [128 128 128 128]
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = the_run_timer
			texture = time_3
			scale = 1.0
			pos = <pos>
			just = [left top]
			rgba = [128 128 128 128]
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = the_run_timer
			texture = time_4
			scale = 1.0
			pos = <pos>
			just = [left top]
			rgba = [128 128 128 128]
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = the_run_timer
			texture = time_5
			scale = 1.0
			pos = <pos>
			just = [left top]
			rgba = [128 128 128 128]
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = the_run_timer
			texture = time_6
			scale = 1.0
			pos = <pos>
			just = [left top]
			rgba = [128 128 128 128]
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = the_run_timer
			texture = time_7
			scale = 1.0
			pos = <pos>
			just = [left top]
			rgba = [128 128 128 128]
			z_priority = 3
		}
		GetStackedScreenElementPos Y id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = the_run_timer
			texture = time_8
			scale = 1.0
			pos = <pos>
			just = [left top]
			rgba = [128 128 128 128]
			z_priority = 3
		}
		if InSplitScreenGame
			CreateScreenElement {
				id = (the_score + 1)
				type = textelement
				parent = player2_panel_container
				font = small
				text = "0"
				scale = 1.0
				pos = (136.0,27.0)
				just = [left top]
				rgba = [105 105 105 128]
			}
			FormatText ChecksumName = score_color "%i_HUD_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
			FormatText ChecksumName = special_color "%i_HUD_SPECIAL_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
			CreateScreenElement {
				id = (the_score_sprite + 1)
				type = SpriteElement
				parent = (the_score + 1)
				texture = score_small
				scale = (1.20000005,0.85000002)
				pos = (-17.0,23.0)
				rgba = <score_color>
			}
			CreateScreenElement {
				id = (the_special_bar_special + 1)
				type = SpriteElement
				parent = (the_score_sprite + 1)
				texture = special
				scale = (1.73000002,0.87)
				pos = (10.0,34.0)
				just = [left top]
				rgba = <special_color>
				z_priority = 5000
			}
			CreateScreenElement {
				id = (the_special_bar_sprite + 1)
				type = SpriteElement
				parent = (the_score_sprite + 1)
				texture = specialbar
				scale = (1.0,1.20000005)
				pos = (9.0,35.0)
				just = [left top]
				rgba = [128 128 128 100]
			}
			CreateScreenElement {
				id = (the_boardstance_sprite + 1)
				type = SpriteElement
				parent = (the_score_sprite + 1)
				texture = nollie_icon
				scale = (0.75,1.29999995)
				just = [left top]
				pos = (123.0,45.0)
				rot_angle = 90
				rgba = [128 128 128 78]
			}
			CreateScreenElement {
				id = (generic_sponsor_logo + 1)
				type = SpriteElement
				parent = (the_score_sprite + 1)
				texture = <sponsor_texture>
				scale = (0.85000002,0.85000002)
				just = [left top]
				pos = (-32.0,0.0)
				rgba = [128 128 128 108]
				z_priority = 3
			}
			CreateScreenElement {
				id = (trick_text_container + 1)
				type = ContainerElement
				parent = player2_panel_container
				scale = 1.0
				dims = <trick_text_dims>
				just = [center center]
				alpha = 0.0
			}
			CreateScreenElement {
				id = (the_trick_text + 1)
				type = TextBlockElement
				parent = (trick_text_container + 1)
				scale = 1.0
				pos = {(0.5,0.0) proportional}
				dims = <trick_text_dims>
				just = [center top]
				internal_just = [center top]
				font = newtrickfont
				text = " "
				internal_scale = 0.69999999
				alpha = 1.0
				tags = {tag_state = inactive}
				shadow
				shadow_offs = (1.0,1.0)
				shadow_rgba = [30 30 30 75]
				z_priority = 0
			}
			CreateScreenElement {
				id = (the_score_pot_text + 1)
				type = textelement
				parent = (trick_text_container + 1)
				scale = 1.0
				pos = <trick_text_pos>
				just = [center bottom]
				font = small
				text = " "
				alpha = 1.0
				z_priority = 0
			}
			reset_trick_text_appearance the_score_pot_text_id = (the_score_pot_text + 1) the_trick_text_id = (the_trick_text + 1) trick_text_container_id = (trick_text_container + 1)
			CreateScreenElement {
				id = (the_balance_meter + 1)
				type = SpriteElement
				parent = player2_panel_container
				texture = balancemeter
				scale = 1.0
				just = [center center]
				rgba = [128 128 128 0]
				tags = {tag_turned_on = 0 tag_mode = balance}
			}
			CreateScreenElement {
				type = SpriteElement
				parent = (the_balance_meter + 1)
				texture = balancearrow_glow
				scale = 1.20000005
				pos = (0.0,0.0)
				just = [center center]
				rgba = [128 128 128 0]
			}
			ScriptGetScreenMode
			switch <screen_mode>
				case split_vertical
					CreateScreenElement {
						id = (the_run_timer + 1)
						type = SpriteElement
						parent = player2_panel_container
						texture = watch
						scale = 1.0
						just = [center center]
						pos = (240.0,240.0)
						alpha = 0
						rgba = [128 128 128 90]
						tags = {tag_turned_on = 0 tag_mode = balance}
					}
				case split_horizontal
					CreateScreenElement {
						id = (the_run_timer + 1)
						type = SpriteElement
						parent = player2_panel_container
						texture = watch
						scale = 1.0
						just = [center center]
						pos = (500.0,120.0)
						alpha = 0
						rgba = [128 128 128 90]
						tags = {tag_turned_on = 0 tag_mode = balance}
					}
				default
					CreateScreenElement {
						id = (the_run_timer + 1)
						type = SpriteElement
						parent = player2_panel_container
						texture = watch
						scale = 1.0
						just = [center center]
						pos = (400.0,240.0)
						alpha = 0
						rgba = [128 128 128 90]
						tags = {tag_turned_on = 0 tag_mode = balance}
					}
			endswitch
			CreateScreenElement {
				id = (the_run_timer_hand + 1)
				type = SpriteElement
				parent = (the_run_timer + 1)
				texture = hand
				scale = 1.0
				pos = (24.0,24.0)
				just = [center center]
				rgba = [128 128 128 128]
				z_priority = 5
			}
			CreateScreenElement {
				type = SpriteElement
				parent = (the_run_timer + 1)
				texture = time_1
				scale = 1.0
				pos = (7.0,8.0)
				just = [left top]
				rgba = [128 128 128 128]
				z_priority = 3
			}
			GetStackedScreenElementPos Y id = <id>
			CreateScreenElement {
				type = SpriteElement
				parent = (the_run_timer + 1)
				texture = time_2
				scale = 1.0
				pos = <pos>
				just = [left top]
				rgba = [128 128 128 128]
				z_priority = 3
			}
			GetStackedScreenElementPos Y id = <id>
			CreateScreenElement {
				type = SpriteElement
				parent = (the_run_timer + 1)
				texture = time_3
				scale = 1.0
				pos = <pos>
				just = [left top]
				rgba = [128 128 128 128]
				z_priority = 3
			}
			GetStackedScreenElementPos Y id = <id>
			CreateScreenElement {
				type = SpriteElement
				parent = (the_run_timer + 1)
				texture = time_4
				scale = 1.0
				pos = <pos>
				just = [left top]
				rgba = [128 128 128 128]
				z_priority = 3
			}
			GetStackedScreenElementPos Y id = <id>
			CreateScreenElement {
				type = SpriteElement
				parent = (the_run_timer + 1)
				texture = time_5
				scale = 1.0
				pos = <pos>
				just = [left top]
				rgba = [128 128 128 128]
				z_priority = 3
			}
			GetStackedScreenElementPos Y id = <id>
			CreateScreenElement {
				type = SpriteElement
				parent = (the_run_timer + 1)
				texture = time_6
				scale = 1.0
				pos = <pos>
				just = [left top]
				rgba = [128 128 128 128]
				z_priority = 3
			}
			GetStackedScreenElementPos Y id = <id>
			CreateScreenElement {
				type = SpriteElement
				parent = (the_run_timer + 1)
				texture = time_7
				scale = 1.0
				pos = <pos>
				just = [left top]
				rgba = [128 128 128 128]
				z_priority = 3
			}
			GetStackedScreenElementPos Y id = <id>
			CreateScreenElement {
				type = SpriteElement
				parent = (the_run_timer + 1)
				texture = time_8
				scale = 1.0
				pos = <pos>
				just = [left top]
				rgba = [128 128 128 128]
				z_priority = 3
			}
		endif
		if GetGlobalFlag flag = NO_DISPLAY_HUD
			GoalManager_HidePoints
			GoalManager_HideGoalPoints
		endif
		if InNetGame
			if IsObserving
				hide_panel_stuff
			endif
			create_score_menu
		endif
	endscript
	newtrickfont_colors = [
		[0 128 230 60]
		[200 90 11 60]
		[0 128 0 60]
		[128 0 0 60]
		[88 105 112 128]
	]
	script UpdateScorepot
		if GetGlobalFlag flag = NO_DISPLAY_BASESCORE
			DoScreenElementMorph id = the_score_pot_text alpha = 0.0 remember_alpha
			if InSplitScreenGame
				if ScreenElementExists id = (the_score_pot_text + 1)
					DoScreenElementMorph id = (the_score_pot_text + 1) alpha = 0.0 remember_alpha
				endif
			endif
		endif
	endscript
	script UpdateTrickText
		if GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			DoScreenElementMorph id = the_trick_text alpha = 0.0 remember_alpha
			SetScreenElementProps id = the_trick_text override_encoded_rgba remember_override_rgba_state
			if InSplitScreenGame
				if ScreenElementExists id = (the_trick_text + 1)
					DoScreenElementMorph id = (the_trick_text + 1) alpha = 0.0 remember_alpha
					SetScreenElementProps id = (the_trick_text + 1) override_encoded_rgba remember_override_rgba_state
				endif
			endif
		endif
	endscript
	script pause_trick_text
		SetScreenElementProps id = the_trick_text hide
		if InSplitScreenGame
			if ScreenElementExists id = (the_trick_text + 1)
				SetScreenElementProps id = (the_trick_text + 1) hide
			endif
		endif
		SetScreenElementProps id = the_score_pot_text hide
		if InSplitScreenGame
			if ScreenElementExists id = (the_score_pot_text + 1)
				SetScreenElementProps id = (the_score_pot_text + 1) hide
			endif
		endif
	endscript
	script unpause_trick_text
		if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			SetScreenElementProps id = the_trick_text unhide
			if InSplitScreenGame
				if ScreenElementExists id = (the_trick_text + 1)
					SetScreenElementProps id = (the_trick_text + 1) unhide
				endif
			endif
		endif
		if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
			SetScreenElementProps id = the_score_pot_text unhide
			if InSplitScreenGame
				if ScreenElementExists id = (the_score_pot_text + 1)
					SetScreenElementProps id = (the_score_pot_text + 1) unhide
				endif
			endif
		endif
	endscript
	script trick_text_pulse
		if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			TerminateObjectsScripts id = <trick_text_container_id>
			TerminateObjectsScripts id = <the_trick_text_id>
			RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_pulse params = {<...>}
		endif
		if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
			TerminateObjectsScripts id = <the_score_pot_text_id> script_name = do_score_pot_text_landed
			RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_pulse params = {<...>}
		endif
	endscript
	script do_trick_text_pulse
		reset_trick_text_appearance <...>
		if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			if InSplitScreenGame
				ScriptGetScreenMode
				if (<screen_mode> = split_vertical)
					DoMorph scale = 1.0 time = 0.2
					DoMorph scale = 0.60000002 time = 0.30000001
					DoMorph scale = 0.94999999 time = 0.40000001
				else
					DoMorph scale = 1.20000005 time = 0.2
					DoMorph scale = 0.89999998 time = 0.30000001
					DoMorph scale = 1.0 time = 0.40000001
				endif
			else
				DoMorph scale = 1.20000005 time = 0.2
				DoMorph scale = 0.89999998 time = 0.30000001
				DoMorph scale = 1.0 time = 0.40000001
			endif
		endif
	endscript
	script trick_text_landed
		if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			TerminateObjectsScripts id = <trick_text_container_id>
			TerminateObjectsScripts id = <the_trick_text_id>
		endif
		if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
			TerminateObjectsScripts id = <the_score_pot_text_id>
		endif
		RunScriptOnScreenElement id = <the_score_pot_text_id> do_score_pot_text_landed params = {<...>}
		RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_landed params = {<...>}
	endscript
	script do_trick_text_landed
		reset_trick_text_appearance <...>
		if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			if InSplitScreenGame
				ScriptGetScreenMode
				if (<screen_mode> = split_vertical)
					DoMorph scale = 0 time = 0
					DoMorph scale = 1.79999995 time = 0.2
					DoMorph scale = 0.5 time = 0.08
					DoMorph scale = 1.0 time = 0.05
					DoMorph scale = 0.80000001 time = 0.04
					DoMorph scale = 1.0 time = 0.04
				else
					DoMorph scale = 0 time = 0
					DoMorph scale = 1.39999998 time = 0.2
					DoMorph scale = 0.80000001 time = 0.08
					DoMorph scale = 1.20000005 time = 0.05
					DoMorph scale = 0.89999998 time = 0.04
					DoMorph scale = 1.0 time = 0.04
				endif
			else
				DoMorph scale = 0 time = 0
				DoMorph scale = 1.39999998 time = 0.2
				DoMorph scale = 0.80000001 time = 0.08
				DoMorph scale = 1.20000005 time = 0.05
				DoMorph scale = 0.89999998 time = 0.04
				DoMorph scale = 1.0 time = 0.04
			endif
		endif
	endscript
	script do_score_pot_text_landed
		if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
			wait 1 gameframe
			SetScreenElementProps id = <the_score_pot_text_id> rgba = [42 80 128 120]
			SetScreenElementProps id = <the_score_pot_text_id> override_encoded_rgba
			if InSplitScreenGame
				ScriptGetScreenMode
				if (<screen_mode> = split_vertical)
					DoMorph scale = 0 time = 0
					DoMorph scale = 1.29999995 time = 0.2
					DoMorph scale = 0.5 time = 0.08
					DoMorph scale = 1.0 time = 0.05
					DoMorph scale = 0.80000001 time = 0.04
					DoMorph scale = 1.20000005 time = 0.04
				else
					DoMorph scale = 0 time = 0.05
					DoMorph scale = 1.79999995 time = 0.12
					DoMorph scale = 0.80000001 time = 0.1
					DoMorph scale = 1.5 time = 0.07
					DoMorph scale = 0.89999998 time = 0.07
					DoMorph scale = 1.29999995 time = 0.05
					DoMorph scale = 1.0 time = 0.05
					DoMorph scale = 1.25 time = 0.04
					DoMorph scale = 1.10000002 time = 0.03
					DoMorph scale = 1.20000005 time = 0.02
				endif
			else
				DoMorph scale = 0 time = 0.05
				DoMorph scale = 1.79999995 time = 0.12
				DoMorph scale = 0.80000001 time = 0.1
				DoMorph scale = 1.5 time = 0.07
				DoMorph scale = 0.89999998 time = 0.07
				DoMorph scale = 1.29999995 time = 0.05
				DoMorph scale = 1.0 time = 0.05
				DoMorph scale = 1.25 time = 0.04
				DoMorph scale = 1.10000002 time = 0.03
				DoMorph scale = 1.20000005 time = 0.02
			endif
		endif
	endscript
	script trick_text_countdown
		if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			TerminateObjectsScripts id = <trick_text_container_id>
			TerminateObjectsScripts id = <the_trick_text_id>
		endif
		RunScriptOnScreenElement id = <the_trick_text_id> do_trick_text_countdown params = {<...>}
	endscript
	script do_trick_text_countdown
		if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			DoMorph scale = 0.0 time = 0.5
			DoMorph alpha = 0.0
		endif
	endscript
	script trick_text_bail
		if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			TerminateObjectsScripts id = <trick_text_container_id>
			TerminateObjectsScripts id = <the_trick_text_id>
		endif
		RunScriptOnScreenElement id = <trick_text_container_id> do_trick_text_bail params = {<...>}
	endscript
	script do_trick_text_bail
		reset_trick_text_appearance <...>
		if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
			SetScreenElementProps id = <the_score_pot_text_id> rgba = [128 32 32 80]
		endif
		if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			GetTextElementString id = <the_trick_text_id>
			SetScreenElementProps id = <the_trick_text_id> rgba = [128 32 32 80] text = <string>
			SetScreenElementProps id = <the_trick_text_id> override_encoded_rgba
		endif
		wait 0.05 seconds
		if InSplitScreenGame
			ScriptGetScreenMode
			if (<screen_mode> = split_vertical)
				DoMorph alpha = 0 scale = 0 time = 0
				DoMorph pos = {(0.0,25.0) relative} scale = (0.40000001,0.69999999) alpha = 1 time = 0.05
				DoMorph pos = {(0.0,-25.0) relative} scale = 0.40000001 time = 0.1
				DoMorph pos = {(0.0,20.0) relative} scale = 0.80000001 time = 0.06
				DoMorph pos = {(0.0,-20.0) relative} scale = 0.60000002 time = 0.06
				DoMorph pos = {(0.0,10.0) relative} scale = 0.80000001 time = 0.05
			else
				DoMorph alpha = 0 scale = 0 time = 0
				DoMorph pos = {(0.0,25.0) relative} scale = (0.69999999,1.79999995) alpha = 1 time = 0.05
				DoMorph pos = {(0.0,-25.0) relative} scale = 0.89999998 time = 0.1
				DoMorph pos = {(0.0,20.0) relative} scale = 1.14999998 time = 0.06
				DoMorph pos = {(0.0,-20.0) relative} scale = 1.12 time = 0.06
				DoMorph pos = {(0.0,10.0) relative} scale = 1.10000002 time = 0.05
			endif
		else
			DoMorph alpha = 0 scale = 0 time = 0
			DoMorph pos = {(0.0,25.0) relative} scale = (0.69999999,1.79999995) alpha = 1 time = 0.05
			DoMorph pos = {(0.0,-25.0) relative} scale = 0.89999998 time = 0.1
			DoMorph pos = {(0.0,20.0) relative} scale = 1.14999998 time = 0.06
			DoMorph pos = {(0.0,-20.0) relative} scale = 1.12 time = 0.06
			DoMorph pos = {(0.0,10.0) relative} scale = 1.10000002 time = 0.05
		endif
		DoMorph pos = {(0.0,-10.0) relative} time = 0.05
		DoMorph pos = {(0.0,5.0) relative} time = 0.04
		DoMorph pos = {(0.0,-5.0) relative} time = 0.04
		wait 1.29999995 seconds
		DoMorph pos = {(-2.0,4.0) relative} time = 0.05
		DoMorph pos = {(-3.0,6.0) relative} time = 0.05
		DoMorph pos = {(5.0,1.0) relative} time = 0.05
		DoMorph pos = {(-3.0,-4.0) relative} time = 0.05
		DoMorph pos = {(2.0,-5.0) relative} time = 0.05
		DoMorph pos = {(4.0,-1.0) relative} time = 0.05
		DoMorph pos = {(-3.0,2.0) relative} time = 0.05
		DoMorph pos = {(4.0,-5.0) relative} time = 0.05
		DoMorph pos = {(-1.0,2.0) relative} time = 0.05
		DoMorph pos = {(-3.0,-4.0) relative} time = 0.05
		DoMorph pos = {(2.0,-4.0) relative} time = 0.05
		DoMorph pos = {(3.0,-6.0) relative} time = 0.05
		DoMorph pos = {(-5.0,-1.0) relative} time = 0.05
		DoMorph pos = {(3.0,4.0) relative} time = 0.05
		DoMorph pos = {(-2.0,5.0) relative} time = 0.05
		DoMorph pos = {(-4.0,1.0) relative} time = 0.05
		DoMorph pos = {(3.0,-2.0) relative} time = 0.05
		DoMorph pos = {(-4.0,5.0) relative} time = 0.05
		DoMorph pos = {(1.0,-2.0) relative} time = 0.05
		DoMorph pos = {(3.0,4.0) relative} time = 0.05
		Random(@runtwoscripts script_text = bail1 script_score = bail1 <...>
			@runtwoscripts script_text = bail1 script_score = bail1 <...>
			@runtwoscripts script_text = bail2 script_score = bail3 <...>
			@runtwoscripts script_text = bail4 script_score = bail5 <...>
			@runtwoscripts script_text = bail5 script_score = bail4 <...>
			@runtwoscripts script_text = bail1 script_score = bail6 <...>
			@runtwoscripts script_text = bail6 script_score = bail6 <...>
			@runtwoscripts script_text = bail4 script_score = bail4 <...>
			@runtwoscripts script_text = bail5 script_score = bail5 <...>
			@runtwoscripts script_text = bail2 script_score = bail1 <...>
		)
	endscript
	script runtwoscripts
		if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			RunScriptOnScreenElement id = <the_trick_text_id> <script_text>
		endif
		if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
			RunScriptOnScreenElement id = <the_score_pot_text_id> <script_score>
		endif
	endscript
	script bail1
		DoMorph pos = {(0.0,0.0) relative} time = 0.1 scale = 1.89999998 fast_in
		DoMorph pos = {(0.0,0.0) relative} time = 0.30000001 scale = 3.0 alpha = 0 fast_in
		DoMorph pos = {(0.0,0.0) relative} scale = 1.0 alpha = 0 fast_in
	endscript
	script bail2
		DoMorph pos = {(0.0,-5.0) relative} time = 0.40000001
		DoMorph pos = {(0.0,448.0) relative} time = 0.69999999 fast_in
		DoMorph alpha = 0.0
		DoMorph pos = {(0.0,-443.0) relative} scale = 1.0 alpha = 0 fast_in
	endscript
	script bail3
		wait 0.1 second
		DoMorph pos = {(0.0,-5.0) relative} time = 0.2
		DoMorph pos = {(3.0,0.0) relative} time = 0.05
		DoMorph pos = {(-3.0,0.0) relative} time = 0.05
		DoMorph pos = {(4.0,0.0) relative} time = 0.05
		DoMorph pos = {(-4.0,0.0) relative} time = 0.05
		DoMorph pos = {(0.0,448.0) relative} time = 0.5 fast_in
		DoMorph alpha = 0.0
		DoMorph pos = {(0.0,-443.0) relative} scale = 1.0 alpha = 0 fast_in
	endscript
	script bail4
		DoMorph pos = {(-15.0,0.0) relative} time = 0.1
		DoMorph pos = {(0.0,4.0) relative} time = 0.02
		DoMorph pos = {(0.0,-4.0) relative} time = 0.02
		DoMorph pos = {(0.0,2.0) relative} time = 0.02
		DoMorph pos = {(0.0,-2.0) relative} time = 0.02
		DoMorph pos = {(150.0,0.0) relative} time = 0.06 alpha = 0.69999999
		DoMorph pos = {(200.0,0.0) relative} scale = (2.0,0.1) time = 0.06 alpha = 0 fast_in
		DoMorph pos = {(200.0,0.0) relative} time = 0
		DoMorph pos = {(-535.0,0.0) relative} scale = 1.0 alpha = 0 fast_in
	endscript
	script bail5
		DoMorph pos = {(15.0,0.0) relative} time = 0.1
		DoMorph pos = {(0.0,4.0) relative} time = 0.02
		DoMorph pos = {(0.0,-4.0) relative} time = 0.02
		DoMorph pos = {(0.0,2.0) relative} time = 0.02
		DoMorph pos = {(0.0,-2.0) relative} time = 0.02
		DoMorph pos = {(-150.0,0.0) relative} time = 0.06 alpha = 0.69999999
		DoMorph pos = {(-200.0,0.0) relative} scale = (2.0,0.1) time = 0.06 alpha = 0 fast_in
		DoMorph pos = {(-200.0,0.0) relative} time = 0
		DoMorph pos = {(535.0,0.0) relative} scale = 1.0 alpha = 0 fast_in
	endscript
	script bail6
		DoMorph pos = {(0.0,0.0) relative} time = 0.2 scale = 1.29999995 alpha = 0.60000002 fast_in
		wait 0.2 second
		DoMorph pos = {(0.0,0.0) relative} time = 0.15000001 scale = 0 alpha = 0 fast_in
	endscript
	script reset_just_trick_text_appearance
		if NOT GetGlobalFlag flag = NO_DISPLAY_TRICKSTRING
			if InSplitScreenGame
				if GameModeEquals is_horse
					trick_text_pos = (320.0,410.0)
					text_scale = 1.0
				else
					ScriptGetScreenMode
					switch <screen_mode>
						case split_vertical
						case one_camera
							trick_text_pos = (142.0,410.0)
							text_scale = 0.94999999
						case split_horizontal
							trick_text_pos = (320.0,200.0)
							text_scale = 1.0
					endswitch
				endif
				DoScreenElementMorph {
					id = <trick_text_container_id>
					alpha = 1.0
					pos = <trick_text_pos>
					just = [center top]
					scale = <text_scale>
				}
				DoScreenElementMorph {
					id = <the_trick_text_id>
					scale = <text_scale>
					pos = {(0.5,0.0) proportional}
					just = [center top]
					internal_just = [center top]
					internal_scale = 0.69999999
					alpha = 1.0
				}
				SetScreenElementProps id = <the_trick_text_id> dont_override_encoded_rgba
				SetScreenElementProps id = <the_trick_text_id> rgba = [128 128 128 80]
			else
				DoScreenElementMorph {
					id = <trick_text_container_id>
					alpha = 1.0
					pos = (320.0,410.0)
					scale = 1.0
				}
				DoScreenElementMorph {
					id = <the_trick_text_id>
					scale = 1.0
					pos = {(0.5,0.0) proportional}
					just = [center top]
					internal_just = [center top]
					internal_scale = 0.69999999
					alpha = 1.0
				}
				SetScreenElementProps id = <the_trick_text_id> dont_override_encoded_rgba
				SetScreenElementProps id = <the_trick_text_id> rgba = [128 128 128 80]
			endif
		else
			if InSplitScreenGame
				if GameModeEquals is_horse
					trick_text_pos = (320.0,410.0)
					text_scale = 1.0
				else
					ScriptGetScreenMode
					switch <screen_mode>
						case split_vertical
						case one_camera
							trick_text_pos = (142.0,410.0)
							text_scale = 0.94999999
						case split_horizontal
							trick_text_pos = (320.0,200.0)
							text_scale = 1.0
					endswitch
				endif
				DoScreenElementMorph {
					id = <trick_text_container_id>
					alpha = 1.0
					pos = <trick_text_pos>
					just = [center top]
					scale = <text_scale>
				}
			else
				DoScreenElementMorph {
					id = <trick_text_container_id>
					alpha = 1.0
					pos = (320.0,410.0)
					scale = 1.0
				}
			endif
		endif
	endscript
	script reset_trick_text_appearance
		TerminateObjectsScripts id = <the_trick_text_id> script_name = bail1
		TerminateObjectsScripts id = <the_trick_text_id> script_name = bail2
		TerminateObjectsScripts id = <the_trick_text_id> script_name = bail3
		TerminateObjectsScripts id = <the_trick_text_id> script_name = bail4
		TerminateObjectsScripts id = <the_trick_text_id> script_name = bail5
		TerminateObjectsScripts id = <the_trick_text_id> script_name = bail6
		reset_just_trick_text_appearance <...>
		if NOT GetGlobalFlag flag = NO_DISPLAY_BASESCORE
			TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail1
			TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail2
			TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail3
			TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail4
			TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail5
			TerminateObjectsScripts id = <the_score_pot_text_id> script_name = bail6
			SetScreenElementProps id = <the_score_pot_text_id> rgba = [127 102 0 85]
			SetScreenElementProps id = <the_score_pot_text_id> dont_override_encoded_rgba
			if InSplitScreenGame
				if GameModeEquals is_horse
					DoScreenElementMorph {
						id = <the_score_pot_text_id>
						scale = 1.0
						pos = (287.0,2.0)
						just = [center bottom]
						alpha = 1.0
					}
				else
					ScriptGetScreenMode
					switch <screen_mode>
						case split_vertical
						case one_camera
							DoScreenElementMorph {
								id = <the_score_pot_text_id>
								scale = 1.0
								pos = (120.0,2.0)
								just = [center bottom]
								alpha = 1.0
							}
						case split_horizontal
							DoScreenElementMorph {
								id = <the_score_pot_text_id>
								scale = 1.0
								pos = (287.0,2.0)
								just = [center bottom]
								alpha = 1.0
							}
					endswitch
				endif
			else
				DoScreenElementMorph {
					id = <the_score_pot_text_id>
					scale = 1.0
					pos = (287.0,2.0)
					just = [center bottom]
					alpha = 1.0
				}
			endif
		endif
	endscript
	script HideClock
		KillSpawnedScript name = clock_morph
		DoScreenElementMorph {id = the_time alpha = 0}
	endscript
	script ShowClock
		DoScreenElementMorph {id = the_time alpha = 1}
	endscript
	script hide_balance_meter
		SetScreenElementProps id = <id> tags = {tag_turned_on = 0}
		RunScriptOnScreenElement id = <id> do_hide_balance_meter params = {id = <id>}
	endscript
	script pause_balance_meter
		RunScriptOnScreenElement id = the_balance_meter do_hide_balance_meter params = {id = the_balance_meter}
		if InSplitScreenGame
			RunScriptOnScreenElement id = (the_balance_meter + 1) do_hide_balance_meter params = {id = (the_balance_meter + 1)}
		endif
	endscript
	script do_hide_balance_meter
		SetScreenElementProps id = <id> rgba = [128 128 128 0]
		SetScreenElementProps id = {<id> child = 0} rgba = [128 128 128 0]
	endscript
	script show_balance_meter
		if NOT GetGlobalFlag flag = NO_DISPLAY_BALANCE
			if NOT ((InNetGame) && (GetGlobalFlag flag = NO_G_DISPLAY_BALANCE))
				SetScreenElementProps id = <id> tags = {tag_turned_on = 1}
				RunScriptOnScreenElement id = <id> do_show_balance_meter params = {id = <id>}
			endif
		endif
	endscript
	script unpause_balance_meter
		RunScriptOnScreenElement id = the_balance_meter do_show_balance_meter params = {id = the_balance_meter}
		if InSplitScreenGame
			RunScriptOnScreenElement id = (the_balance_meter + 1) do_show_balance_meter params = {id = (the_balance_meter + 1)}
		endif
	endscript
	script do_show_balance_meter
		if NOT GetGlobalFlag flag = NO_DISPLAY_BALANCE
			if NOT ((InNetGame) && (GetGlobalFlag flag = NO_G_DISPLAY_BALANCE))
				GetTags
				FormatText ChecksumName = balance_meter_color "%i_BALANCE_METER_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
				FormatText ChecksumName = balance_arrow_color "%i_BALANCE_ARROW_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
				if IntegerEquals a = <tag_turned_on> b = 1
					SetScreenElementProps id = <id> rgba = <balance_meter_color>
					SetScreenElementProps id = {<id> child = 0} rgba = <balance_arrow_color>
				endif
			endif
		endif
	endscript
	script hide_run_timer
		if ObjectExists id = <id>
			SetScreenElementProps id = <id> tags = {tag_turned_on = 0}
			RunScriptOnScreenElement id = <id> do_hide_run_timer params = {id = <id>}
		endif
	endscript
	script pause_run_timer
		RunScriptOnScreenElement id = the_run_timer do_hide_run_timer params = {id = the_run_timer}
		if ScreenElementExists id = (the_run_timer + 1)
			RunScriptOnScreenElement id = (the_run_timer + 1) do_hide_run_timer params = {id = (the_run_timer + 1)}
		endif
	endscript
	script do_hide_run_timer
		DoScreenElementMorph id = <id> alpha = 0
	endscript
	script show_run_timer
		GetScreenElementPosition id = <id>
		SetScreenElementProps id = <id> tags = {tag_turned_on = 1}
		RunScriptOnScreenElement id = <id> do_show_run_timer params = {id = <id>}
		DoScreenElementMorph id = {<id> child = 1} alpha = 0
		DoScreenElementMorph id = {<id> child = 2} alpha = 0
		DoScreenElementMorph id = {<id> child = 3} alpha = 0
		DoScreenElementMorph id = {<id> child = 4} alpha = 0
		DoScreenElementMorph id = {<id> child = 5} alpha = 0
		DoScreenElementMorph id = {<id> child = 6} alpha = 0
		DoScreenElementMorph id = {<id> child = 7} alpha = 0
		DoScreenElementMorph id = {<id> child = 8} alpha = 0
		if (<rot_angle> > 320)
			DoScreenElementMorph id = {<id> child = 1} alpha = 1
		endif
		if (<rot_angle> > 280)
			DoScreenElementMorph id = {<id> child = 2} alpha = 1
		endif
		if (<rot_angle> > 240)
			DoScreenElementMorph id = {<id> child = 3} alpha = 1
		endif
		if (<rot_angle> > 200)
			DoScreenElementMorph id = {<id> child = 4} alpha = 1
		endif
		if (<rot_angle> > 160)
			DoScreenElementMorph id = {<id> child = 5} alpha = 1
		endif
		if (<rot_angle> > 120)
			DoScreenElementMorph id = {<id> child = 6} alpha = 1
		endif
		if (<rot_angle> > 80)
			DoScreenElementMorph id = {<id> child = 7} alpha = 1
		endif
		if (<rot_angle> > 40)
			DoScreenElementMorph id = {<id> child = 8} alpha = 1
		endif
	endscript
	script soft_hide_run_timer
		SetScreenElementProps id = <id> tags = {tag_turned_on = 0}
		RunScriptOnScreenElement id = <id> do_soft_hide_run_timer params = {id = <id>}
	endscript
	script do_soft_hide_run_timer
		DoScreenElementMorph id = <id> alpha = 0 time = 0.30000001
	endscript
	script unpause_run_timer
		RunScriptOnScreenElement id = the_run_timer do_show_run_timer params = {id = the_run_timer}
		if InSplitScreenGame
			RunScriptOnScreenElement id = (the_run_timer + 1) do_show_run_timer params = {id = (the_run_timer + 1)}
		endif
	endscript
	script do_show_run_timer
		GetTags
		if IntegerEquals a = <tag_turned_on> b = 1
			DoScreenElementMorph id = <id> alpha = 1
		endif
	endscript
	script hide_run_timer_piece
		if (320 > <rot_angle>)
			DoScreenElementMorph id = {<id> child = 1} alpha = 0
		endif
		if (280 > <rot_angle>)
			DoScreenElementMorph id = {<id> child = 2} alpha = 0
		endif
		if (240 > <rot_angle>)
			DoScreenElementMorph id = {<id> child = 3} alpha = 0
		endif
		if (200 > <rot_angle>)
			DoScreenElementMorph id = {<id> child = 4} alpha = 0
		endif
		if (160 > <rot_angle>)
			DoScreenElementMorph id = {<id> child = 5} alpha = 0
		endif
		if (120 > <rot_angle>)
			DoScreenElementMorph id = {<id> child = 6} alpha = 0
		endif
		if (80 > <rot_angle>)
			DoScreenElementMorph id = {<id> child = 7} alpha = 0
		endif
		if (40 > <rot_angle>)
			DoScreenElementMorph id = {<id> child = 8} alpha = 0
		endif
	endscript
	script blink_run_timer
		while
			DoScreenElementMorph id = <id> alpha = 0.30000001 time = 0.05
			wait 5 gameframes
			DoScreenElementMorph id = <id> alpha = 1 time = 0.05
			wait 5 gameframes
		repeat
	endscript
	script start_oldtime_effects
		start_bg_grain_effect
		start_flashinglines_effect
		start_cigburn_effect
		start_hairghost_effect
	endscript
	script end_oldtime_effects
		end_bg_grain_effect
		end_flashinglines_effect
		end_cigburn_effect
		end_hairghost_effect
	endscript
	script start_bg_grain_effect
		KillSpawnedScript name = tv_outline_pulse
		if ObjectExists id = tv_outline
			DestroyScreenElement id = tv_outline
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = SpriteElement
			parent = root_window
			id = tv_outline
			texture = bg_grain
			scale = (5.0,7.5)
			just = [left top]
			z_priority = 2000
			pos = (0.0,0.0)
		}
		SetScreenElementLock id = root_window on
		SpawnScript tv_outline_pulse
	endscript
	script tv_outline_pulse
		DoScreenElementMorph id = tv_outline time = 0 alpha = 0
		DoScreenElementMorph id = tv_outline time = 1 alpha = 0.15000001
		wait 0.15000001 seconds
		while
			if ObjectExists id = tv_outline
				alpha = ((RandomRange(200.0,280.0)) * 0.004)
				time = ((RandomRange(5.0,50.0)) * 0.01)
				DoScreenElementMorph id = tv_outline time = <time> alpha = <alpha>
				wait <time> seconds
				time = ((RandomRange(5.0,20.0)) * 0.01)
				DoScreenElementMorph id = tv_outline time = <time> alpha = 0.60000002
				wait <time> seconds
			endif
		repeat
	endscript
	script end_bg_grain_effect
		KillSpawnedScript name = tv_outline_pulse
		if ObjectExists id = tv_outline
			DestroyScreenElement id = tv_outline
		endif
	endscript
	flashingline_intensity = 2
	script start_flashinglines_effect
		KillSpawnedScript name = flash_lines
		if ObjectExists id = line_container
			DestroyScreenElement id = line_container
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = line_container
			dims = (640.0,480.0)
			pos = (0.0,0.0)
			just = [left top]
		}
		while
			CreateScreenElement {
				type = SpriteElement
				parent = line_container
				scale = (0.25,120.0)
				texture = white2
				rgba = [0 0 0 128]
				just = [left top]
				z_priority = 1999
			}
		repeat 6
		SetScreenElementLock id = line_container on
		SetScreenElementLock id = root_window on
		SpawnScript flash_lines
	endscript
	script flash_lines
		while
			<index> = 0
			while
				<x> = RandomRange(0.0,640.0)
				<pos> = ((1.0,0.0) * <x>)
				if ObjectExists id = line_container
					DoScreenElementMorph id = {line_container child = <index>} time = 0 alpha = 0.2 pos = <pos>
				endif
				<index> = (<index> + 1)
				wait 1 frame
			repeat flashingline_intensity
			while
				if (<index> = 6)
					break
				endif
				if ObjectExists id = line_container
					DoScreenElementMorph id = {line_container child = <index>} time = 0 alpha = 0
				endif
				wait 1 frame
				<index> = (<index> + 1)
			repeat
			wait 1 frame
		repeat
	endscript
	script end_flashinglines_effect
		KillSpawnedScript name = flash_lines
		if ObjectExists id = line_container
			DestroyScreenElement id = line_container
		endif
	endscript
	script start_cigburn_effect
		KillSpawnedScript name = flash_cigburn
		if ObjectExists id = cig_burn
			DestroyScreenElement id = cig_burn
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = SpriteElement
			id = cig_burn
			parent = root_window
			pos = (560.0,50.0)
			texture = recdot
			scale = (3.0,1.0)
			z_priority = 1998
			rgba = [0 0 0 128]
		}
		SetScreenElementLock id = root_window on
		SpawnScript flash_cigburn
	endscript
	script flash_cigburn
		DoScreenElementMorph id = cig_burn time = 0 alpha = 0
		while
			if ObjectExists id = cig_burn
				DoScreenElementMorph id = cig_burn time = 0 alpha = 0.5
				<time> = (RandomRange(5.0,15.0))
				wait <time> frames
				<time> = (RandomRange(10.0,30.0))
				DoScreenElementMorph id = cig_burn time = 0 alpha = 0
				wait <time> frames
				DoScreenElementMorph id = cig_burn time = 0 alpha = 0.5
				<time> = (RandomRange(5.0,15.0))
				wait <time> frames
				<time> = (RandomRange(10.0,30.0))
				DoScreenElementMorph id = cig_burn time = 0 alpha = 0
				wait <time> frames
				DoScreenElementMorph id = cig_burn time = 0 alpha = 0.5
				<time> = (RandomRange(5.0,15.0))
				wait <time> frames
				<time> = (RandomRange(10.0,30.0))
				DoScreenElementMorph id = cig_burn time = 0 alpha = 0
				wait <time> frames
				DoScreenElementMorph id = cig_burn time = 0 alpha = 0
				<time> = (RandomRange(4.0,7.0))
				wait <time> seconds
			endif
			wait 1 frame
		repeat
	endscript
	script end_cigburn_effect
		KillSpawnedScript name = flash_cigburn
		if ObjectExists id = cig_burn
			DestroyScreenElement id = cig_burn
		endif
	endscript
	script start_hairghost_effect
		KillSpawnedScript name = flash_hairghost
		if ObjectExists id = hair_ghost
			DestroyScreenElement id = hair_ghost
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = SpriteElement
			id = hair_ghost
			parent = root_window
			pos = (320.0,240.0)
			texture = hair
			scale = (3.0,1.0)
			z_priority = 2001
			rgba = [0 0 0 128]
		}
		SetScreenElementLock id = root_window on
		SpawnScript flash_hairghost
	endscript
	script flash_hairghost
		while
			if ObjectExists id = hair_ghost
				<theta> = (RandomRange(0.0,360.0))
				<x> = (RandomRange(0.0,640.0))
				<Y> = (RandomRange(0.0,480.0))
				<pos> = ((1.0,0.0) * <x> + (0.0,1.0) * <Y>)
				DoScreenElementMorph id = hair_ghost time = 0 alpha = 0.5 pos = <pos> rot_angle = <theta>
				<time> = (RandomRange(20.0,40.0))
				wait <time> frames
				DoScreenElementMorph id = hair_ghost time = 0 alpha = 0
				<time> = (RandomRange(1.0,2.0))
				wait <time> seconds
			endif
			wait 1 frame
		repeat
	endscript
	script end_hairghost_effect
		KillSpawnedScript name = flash_hairghost
		if ObjectExists id = hair_ghost
			DestroyScreenElement id = hair_ghost
		endif
	endscript
