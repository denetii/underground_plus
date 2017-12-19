	script Boardshop_Startup
		printf "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
		printf "X                                               X"
		printf "X              Boardshop Startup                X"
		printf "X                                               X"
		printf "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
		GoalManager_HidePoints
		GoalManager_HideGoalPoints
		Change EndOfReplayShouldJumpToPauseMenu = 0
		Randomize
		SetScoreDegradation 0
		launch_boardshop_menu
	endscript
	script boardshop_create_initial_menus
		SetScreenElementLock id = root_window off
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		GoalManager_HidePoints
		GoalManager_HideGoalPoints
		if (next_level_script = nullscript)
			boardshop_create_main_menu
		endif
	endscript
	script boardshop_create_main_menu
		printf "script boardshop_create_main_menu"
		UnpauseSkaters
		Change in_boardshop = 1
		Skater::Obj_ShadowOn shadowtype = detailed
		SpawnScript set_boardshop_cam params = {no_wait}
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		FormatText ChecksumName = title_icon "%i_skateshop" i = (THEME_PREFIXES[current_theme_prefix])
		make_new_themed_sub_menu title = "SKATESHOP" title_icon = <title_icon>
		create_helper_text generic_helper_text_no_back
		GetCurrentSkaterProfileIndex
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentskaterprofileindex>
		if (<stance> = goofy)
			Change was_goofy = 1
			SetSkaterProfileInfo player = <currentskaterprofileindex> params = {stance = regular}
			RefreshSkaterModel Skater = 0 profile = <currentskaterprofileindex>
		endif
		theme_menu_add_item {
			text = "Boards"
			centered
			pad_choose_script = boardshop_launch_edit_skater_menu
			pad_choose_params = {callback = edit_skater_create_options_menu
				title = "BOARD"
				title_icon = <title_icon>
				options_array = boardshop_board_options
				from_level_1
				pad_back_script = boardshop_create_main_menu
			}
		}
		theme_menu_add_item {
			text = "Decks"
			centered
			pad_choose_script = boardshop_launch_edit_skater_menu
			pad_choose_params = {callback = edit_skater_create_options_menu
				title = "DECK"
				title_icon = <title_icon>
				options_array = boardshop_deck_options
				from_level_1
				pad_back_script = boardshop_create_main_menu
			}
		}
		get_current_skater_griptape_menu_enabled
		if (<griptape_menu_enabled> = 0)
			<griptape_menu_not_focusable> = not_focusable
			<griptape_menu_rgba> = [60 60 60 85]
		endif
		theme_menu_add_item {
			text = "Griptape"
			not_focusable = <griptape_menu_not_focusable>
			rgba = <griptape_menu_rgba>
			centered
			pad_choose_script = boardshop_launch_edit_skater_menu
			pad_choose_params = {callback = edit_skater_create_options_menu
				title = "GRIPTAPE"
				title_icon = <title_icon>
				options_array = boardshop_griptape_options
				from_level_1
				griptape
				pad_back_script = boardshop_create_main_menu
			}
		}
		theme_menu_add_item {
			text = "WHEEL COLOR"
			pad_choose_script = boardshop_launch_edit_skater_menu
			pad_choose_params = {callback = edit_skater_create_cas_menu
				pad_back_script = boardshop_create_main_menu
				text = "WHEEL COLOR"
				male = 1
				female = 1
				submenu = wheel_color_menu
				part = board
			}
			centered
		}
		if NOT cd
			theme_menu_add_item {
				text = "view cutscenes"
				pad_choose_script = debug_the_boardshop
				centered
			}
		endif
		theme_menu_add_item {
			last_menu_item = last_menu_item
			text = "Done"
			pad_choose_script = boardshop_menu_exit
			pad_choose_params = <...>
			centered
		}
		finish_themed_sub_menu no_sound = no_sound
	endscript
	script debug_the_boardshop
		load_boardshop_textures_to_main_memory unload
		killskatercamanim all
		restore_start_key_binding
		launch_view_cutscenes_menu
	endscript
	script boardshop_launch_edit_skater_menu
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		if NOT ScreenElementExists id = edit_skater_anchor
			CreateScreenElement {
				type = ContainerElement
				parent = root_window
				id = edit_skater_anchor
				pos = (315.0,230.0)
				dims = (640.0,480.0)
			}
		else
			SetScreenElementLock off id = edit_skater_anchor
		endif
		AssignAlias id = edit_skater_anchor alias = current_menu_anchor
		Skater::PlayAnim Anim = BoardPlacement BlendPeriod = 0 cycle
		Skater::Obj_MoveToNode name = skateshop_deck_spot orient
		Skater::Obj_ShadowOff
		if GotParam griptape
			Skater::Obj_SetOrientation Y = 150
		endif
		<callback> {<...> parent = edit_skater_anchor}
		wait 5 gameframes
		PauseSkaters
		killskatercamanim all
		PlaySkaterCamAnim name = skateshop_board_select_cam play_hold
	endscript
	script boardshop_menu_exit
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
			wait 1 gameframe
		endif
		if (was_goofy = 1)
			GetCurrentSkaterProfileIndex
			GetSkaterProfileInfo player = <currentskaterprofileindex>
			Change was_goofy = 0
			SetSkaterProfileInfo player = <currentskaterprofileindex> params = {stance = goofy}
			RefreshSkaterModel Skater = 0 profile = <currentskaterprofileindex>
		endif
		GoalManager_HideGoalPoints
		load_boardshop_textures_to_main_memory unload
		if (in_ny03_sequence = 1)
			nextlevelscript = NY03_back_from_boardshop
		endif
		Change in_boardshop = 0
		if (entered_skateshop_through_door = 1)
			Change entered_skateshop_through_door = 0
			change_level level = load_nj
		else
			if (unlock_sponsor_boards = 1)
				Change unlock_sponsor_boards = 0
				level = load_sd nextlevelscript = SD_IntroCutscene
			else
				if NOT (return_to_level[0] = null)
					level = (return_to_level[0])
					array = return_to_level
					SetArrayElement arrayname = array index = 0 newvalue = null
				else
					level = load_skateshop
				endif
			endif
			change_level level = <level> next_level_script = <nextlevelscript>
		endif
	endscript
	script boardshop_menu_choose_deck
		cas_add_item part = deck_graphic desc_id = <desc_id> play_deck_sound
	endscript
	script boardshop_menu_choose_griptape
		cas_add_item part = griptape desc_id = <desc_id>
	endscript
	script boardshop_sync_to_skater_graphic
		GetCurrentSkaterProfileIndex
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = deck_graphic
			GetActualCASOptionStruct part = deck_graphic desc_id = <desc_id>
			TRG_Deck_Main::Obj_ReplaceTexture src = "DM_thps4_board01.png" dest = <with>
		endif
	endscript
	script boardshop_sync_to_skater_griptape
		GetCurrentSkaterProfileIndex
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = griptape
			GetActualCASOptionStruct part = griptape desc_id = <desc_id>
			TRG_Deck_Main::Obj_ReplaceTexture src = "cw_ss_generic_griptape_01.png" dest = <with>
		endif
	endscript
	script unlock_sponsor_decks
		unlock_sponsor_movies
		GoalManager_GetSponsor
		switch <sponsor>
			case sponsor_birdhouse
				SetGlobalFlag flag = BOARDS_UNLOCKED_BIRDHOUSE
			case sponsor_element
				SetGlobalFlag flag = BOARDS_UNLOCKED_ELEMENT
			case sponsor_flip
				SetGlobalFlag flag = BOARDS_UNLOCKED_FLIP
			case sponsor_girl
				SetGlobalFlag flag = BOARDS_UNLOCKED_GIRL
			case sponsor_zero
				SetGlobalFlag flag = BOARDS_UNLOCKED_ZERO
			default
				printf "bad sponsor! no decks!"
		endswitch
	endscript
	script unlock_sponsor_movies
		SetGlobalFlag flag = MOVIE_UNLOCKED_BIRDHOUSE
		SetGlobalFlag flag = MOVIE_UNLOCKED_ELEMENT
		SetGlobalFlag flag = MOVIE_UNLOCKED_FLIP
		SetGlobalFlag flag = MOVIE_UNLOCKED_GIRL
		SetGlobalFlag flag = MOVIE_UNLOCKED_ZERO
	endscript
	script unlock_all_sponsor_decks
		SetGlobalFlag flag = BOARDS_UNLOCKED_BIRDHOUSE
		SetGlobalFlag flag = BOARDS_UNLOCKED_ELEMENT
		SetGlobalFlag flag = BOARDS_UNLOCKED_FLIP
		SetGlobalFlag flag = BOARDS_UNLOCKED_GIRL
		SetGlobalFlag flag = BOARDS_UNLOCKED_ZERO
	endscript
	boardshop_current_deck_list_index = 0
	boardshop_deck_options = [
		{
			group_title = "DECKS"
			text = 'Peralta 1'
			submenu = deck_graphic_menu
			endlist = 9
			show_logos
		}
		{
			text = 'Peralta 2'
			submenu = deck_graphic_menu
			startlist = 10
			endlist = 19
			show_logos
		}
		{
			text = 'Birdhouse'
			submenu = deck_graphic_menu
			startlist = 20
			endlist = 29
			show_logos
			is_enabled_script = any_decks_unlocked
			is_enabled_params = {startlist = 20 endlist = 29}
		}
		{
			text = 'Element'
			submenu = deck_graphic_menu
			startlist = 30
			endlist = 39
			show_logos
			is_enabled_script = any_decks_unlocked
			is_enabled_params = {startlist = 30 endlist = 39}
		}
		{
			text = 'Flip'
			submenu = deck_graphic_menu
			startlist = 40
			endlist = 49
			show_logos
			is_enabled_script = any_decks_unlocked
			is_enabled_params = {startlist = 40 endlist = 49}
		}
		{
			text = 'Girl'
			submenu = deck_graphic_menu
			startlist = 50
			endlist = 59
			show_logos
			is_enabled_script = any_decks_unlocked
			is_enabled_params = {startlist = 50 endlist = 59}
		}
		{
			text = 'Zero'
			submenu = deck_graphic_menu
			startlist = 60
			endlist = 69
			show_logos
			is_enabled_script = any_decks_unlocked
			is_enabled_params = {startlist = 60 endlist = 69}
		}
	]
	script any_decks_unlocked
		<i> = <startlist>
		<is_enabled> = 0
		while
			if (<i> = (<endlist> + 1))
				break
			endif
			if GetGlobalFlag flag = (((deck_graphic)[<i>]).unlock_flag)
				<is_enabled> = 1
			endif
			<i> = (<i> + 1)
		repeat
		return is_enabled = <is_enabled>
	endscript
	boardshop_griptape_options = [
		{
			group_title = "GRIPTAPE"
			text = 'Griptape  - Black'
			submenu = grip_tape_style_menu
			endlist = 9
			show_logos
		}
		{
			text = 'Griptape - Colors'
			submenu = grip_tape_style_menu
			startlist = 10
			endlist = 13
			show_logos
		}
		{
			text = 'Griptape - Pros'
			submenu = grip_tape_style_menu
			startlist = 14
			show_logos
		}
	]
	boardshop_board_options = [
		{
			group_title = "BOARDS"
			text = 'Basic Boards'
			submenu = board_menu
			show_logos
		}
	]
	script boardshop_buy_deck
		FireEvent type = unfocus target = boardshop_deck_design_menu
		DoScreenElementMorph {
			id = current_menu_anchor
			scale = 0
		}
		FormatText TextName = text "Buy this board for $%i?" i = boardshop_deck_price
		create_dialog_box {title = "Boardshop"
			text = <text>
			pos = (310.0,183.0)
			just = [center center]
			text_rgba = [88 105 112 128]
			no_pad_start
			pad_back_script = boardshop_buy_deck_reject
			buttons = [{font = small text = "Yes" pad_choose_script = boardshop_buy_deck_accept pad_choose_params = <...>}
				{font = small text = "No" pad_choose_script = boardshop_buy_deck_reject}
			]
		}
	endscript
	script boardshop_buy_deck_reject
		dialog_box_exit no_pad_start
		GoalManager_GetCash
		FormatText TextName = cash_text "Cash Available: $%i" i = <cash>
		if ObjectExists id = boardshop_cash_available
			SetScreenElementProps {
				id = boardshop_cash_available
				text = <cash_text>
			}
		endif
		DoScreenElementMorph {
			id = current_menu_anchor
			scale = 1
		}
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentskaterprofileindex>
		if (<name> = custom)
			create_helper_text generic_helper_text_up_down_left_right
		else
			create_helper_text generic_helper_text
		endif
		FireEvent type = focus target = boardshop_deck_design_menu
	endscript
	script boardshop_buy_deck_accept
		if GoalManager_SpendCash boardshop_deck_price
			GoalManager_ShowGoalPoints
			SetGlobalFlag flag = <flag>
			boardshop_reset_small_decks
			boardshop_replace_small_deck_textures <...>
			if GotParam dest
				boardshop_menu_choose_deck <...>
			endif
			boardshop_buy_deck_reject
		else
			boardshop_buy_deck_reject
		endif
	endscript
	script boardshop_not_enough_money
		printf "you don't have the money!"
		PlaySound GUI_buzzer01 vol = 50
	endscript
