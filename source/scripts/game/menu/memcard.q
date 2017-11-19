
	VERSION_OPTIONSANDPROS = 31
	VERSION_NETWORKSETTINGS = 9
	VERSION_CAS = 19
	VERSION_CAT = 1
	VERSION_PARK = 5
	VERSION_REPLAY = 30
	VERSION_CREATEDGOALS = 3
	MAX_MEMCARD_FILENAME_LENGTH = 15
	SaveSize_OptionsAndPros = 90000
	SaveSize_NetworkSettings = 1100
	SaveSize_Cat = 34000
	SaveSize_Park = 35000
	SaveSize_Replay = 300000
	SaveSize_CreatedGoals = 100000
	CATIconSpaceRequired = 14
	ParkIconSpaceRequired = 13
	OptionsProsIconSpaceRequired = 14
	NetworkSettingsIconSpaceRequired = 15
	CreatedGoalsIconSpaceRequired = 14
	ReplayIconSpaceRequired = 19
	BadVersionNumber = 'BAD VERSION!'
	DamagedFile = 'DAMAGED!'
	NGCDamagedFile = 'CORRUPT FILE!'
	SavingOrLoading = Saving
	script GetFileTypeName
		switch <file_type>
			case OptionsAndPros
				return filetype_name = 'STORY/SKATER'
			case NetworkSettings
				if NOT IsXBox
					return filetype_name = 'SYSTEM LINK SETTINGS'
				else
					return filetype_name = 'NETWORK SETTINGS'
				endif
			case Cas
				return filetype_name = 'SKATER'
			case CAT
				return filetype_name = 'TRICK'
			case Park
				return filetype_name = 'PARK'
			case Replay
				return filetype_name = 'REPLAY'
			case CreatedGoals
				return filetype_name = 'GOALS'
			default
				return filetype_name = ''
		endswitch
	endscript
	script QuitToDashboard
		GetPlatform
		switch <Platform>
			case PS2
				ResetPS2
			case XBox
				GotoXboxDashboard memory total_blocks_needed = <total_blocks_needed>
			case NGC
				ResetToIPL
		endswitch
	endscript
	script destroy_pause_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
			wait 1 gameframe
		endif
		kill_start_key_binding
	endscript
	script destroy_main_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
			wait 1 gameframe
		endif
	endscript
	script destroy_files_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
			wait 1 frame
		endif
	endscript
	script destroy_net_settings_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
			wait 1 gameframe
		endif
	endscript
	script destroy_internet_options_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
			wait 1 gameframe
		endif
	endscript
	script destroy_level_select
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
			wait 1 frame
		endif
	endscript
	script ResetAbortAndDoneScripts
		Change DoneScript = DefaultDoneScript
		Change AbortScript = DefaultAbortScript
		Change RetryScript = DefaultRetryScript
		Change SavingOrLoading = Saving
	endscript
	DoneScript = DefaultDoneScript
	script DefaultDoneScript
		printf "DefaultDoneScript called !!!"
	endscript
	AbortScript = DefaultAbortScript
	script DefaultAbortScript
		printf "DefaultAbortScript called !!!"
	endscript
	script memcard_menus_cleanup
		EnableReset
		dialog_box_exit no_pad_start
		destroy_files_menu
		destroy_onscreen_keyboard
		if NOT (LevelIs load_skateshop)
			if NOT GoalManager_HasActiveGoals
			endif
		endif
		pause_menu_gradient off
	endscript
	script back_to_main_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		create_main_menu
	endscript
	script back_to_main_menu2
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		launch_main_menu
	endscript
	script career_autoload_launch_current_level
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		if NOT GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
			PlaySongsInOrder
		else
			PlaySongsRandomly
		endif
		GoalManager_GetCurrentChapterAndStage
		if NOT ((<currentChapter> = 9) || (<currentChapter> = 24) || (<currentChapter> = 25))
			level = ((CHAPTER_LEVELS[<currentChapter>]).checksum)
		else
			level = load_nj
		endif
		load_mainmenu_textures_to_main_memory unload
		change_level level = <level>
	endscript
	script back_to_pre_cas_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		create_pre_cas_menu
	endscript
	script back_to_pause_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		restore_start_key_binding
		if (save_successful = 1)
			printf "save complete ========================="
			parked_quit level = load_skateshop
		else
			printf "save aborted ========================="
			create_pause_menu
		endif
		Change save_successful = 2
	endscript
	script back_to_end_replay_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		create_in_game_end_replay_menu
	endscript
	script back_to_net_settings_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		create_network_options_menu
	endscript
	script back_to_beat_goal
		memcard_menus_cleanup
		GoalManager_ShowPoints
		ResetAbortAndDoneScripts
		goal_save_reject
	endscript
	script back_to_select_skater
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		launch_select_skater_menu
	endscript
	script back_to_options_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		create_setup_options_menu
	endscript
	script back_to_career_options_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		Skater::Unhide
		create_career_options_menu
	endscript
	script back_to_created_park_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		if (still_in_net_area = 1)
			back_to_net_host_options
		else
			return_to_created_park_menu
		endif
	endscript
	script load_loaded_created_park
		dialog_box_exit
		if LevelIs load_sk5ed_gameplay
			if inNetGame
				level_select_change_level level = load_sk5ed_gameplay <...> show_warning
				return
			endif
		endif
		return_to_created_park_menu
	endscript
	script back_to_net_host_options
		prefs = network
		field = "level"
		string = "Created Park"
		checksum = load_sk5ed_gameplay
		select_host_option <...>
		Change still_in_net_area = 0
		if ObjectExists id = host_options_menu
			DestroyScreenElement id = host_options_menu
		endif
		create_network_host_options_menu
	endscript
	script back_to_internet_options_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		if (load_successful = 1)
			get_upload_description type = <type> filename = <filename>
		else
			create_internet_options
		endif
		Change load_successful = 2
		Change loadforupload = 0
	endscript
	script back_to_cat_pause
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		create_CAT_pause_menu
	endscript
	script back_to_pre_cat_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		create_pre_CAT_menu
	endscript
	script back_to_edit_cat_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		create_CAT_menu load = 0
	endscript
	script finish_loading_cat
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		auto_assign_cat_to_slot
	endscript
	script back_to_edit_tricks_menu
		memcard_menus_cleanup
		ResetAbortAndDoneScripts
		create_edit_tricks_menu
	endscript
	RetryScript = DefaultRetryScript
	script DefaultRetryScript
		printf "DefaultRetryScript called !!!"
	endscript
	script mem_card_message_pause
		DisableReset
		if NOT GotParam NoTimerReset
			ResetTimer
		endif
		Change check_for_unplugged_controllers = 0
		<CardCheckCounter> = 0
		while
			if NOT CustomParkMode editing
				if ScreenElementExists id = controller_unplugged_dialog_anchor
					Change check_for_unplugged_controllers = 1
					goto NullScript
				endif
			endif
			if NOT GotParam NoCardRemovalCheck
				if (<CardCheckCounter> = 10)
					DisableReset
					if NOT CardIsInSlot
						Change check_for_unplugged_controllers = 1
						goto mcmess_ErrorNoCardInSlot
					endif
					<CardCheckCounter> = 0
				else
					<CardCheckCounter> = (<CardCheckCounter> + 1)
				endif
			endif
			if TimeGreaterThan 1
				break
			endif
			wait 1 gameframe
		repeat
		Change check_for_unplugged_controllers = 1
	endscript
	script check_card
		if NOT CardIsInSlot
			goto mcmess_ErrorNoCardInSlot
		endif
		if BadDevice
			goto mcmess_BadDevice
		endif
		if CardIsDamaged
			goto mcmess_DamagedCard
		endif
		if NOT SectorSizeOK
			if CardIsDamaged
				goto mcmess_DamagedCard
			else
				goto mcmess_BadSectorSize
			endif
		endif
		if NOT CardIsFormatted
			if CardIsDamaged
				goto mcmess_DamagedCard
			else
				if GotParam Save
					goto mcmess_ErrorNotFormatted
				else
					goto mcmess_ErrorNotFormattedNoFormatOption
				endif
			endif
		endif
		if NOT IsXBox
			mcmess_CheckingCard
			mem_card_message_pause
			dialog_box_exit no_pad_start
		endif
	endscript
	StopCheckingForCardRemoval = 0
	script CheckForCardRemoval
		Change StopCheckingForCardRemoval = 0
		<CardCheckCounter> = 0
		while
			if (<CardCheckCounter> = 10)
				if NOT CardIsInSlot
					goto mcmess_ErrorNoCardInSlot
				endif
				<CardCheckCounter> = 0
			else
				<CardCheckCounter> = (<CardCheckCounter> + 1)
			endif
			if NOT ObjectExists id = <menu_id>
				break
			endif
			if istrue StopCheckingForCardRemoval
				break
			endif
			wait 1 gameframe
		repeat
	endscript
	script DoFormatCard
		KillSpawnedScript Name = CheckForCardRemoval
		if NOT IsNGC
			if CardIsFormatted
				goto DoneScript
			endif
		endif
		ResetTimer
		mcmess_FormattingCard
		DisableReset
		if FormatCard
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			goto mcmess_FormatSuccessful
		else
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			goto mcmess_FormatFailed
		endif
	endscript
	script launch_files_menu
		memcard_menus_cleanup
		create_files_menu <...>
	endscript
	script create_files_menu pos_tweak = (-20.0,-45.0)
		if CustomParkMode editing
			if ScreenElementExists id = controller_unplugged_dialog_anchor
				return
			endif
		endif
		if GotParam Save
			UnloadAnimsAndCreateMemCardPools
		endif
		if GotParam Save
			Change SavingOrLoading = Saving
		else
			Change SavingOrLoading = Loading
		endif
		if NOT CardIsInSlot
			goto mcmess_ErrorNoCardInSlot
		endif
		SetScreenElementLock id = root_window off
		GoalManager_HidePoints
		GoalManager_HideGoalPoints
		if GotParam Save
			menu_title = 'SAVE'
			helper_text = {helper_text_elements = [{text = "\b7/\b4 = Select"}
					{text = "\bn = Back"}
					{text = "\bm = Accept"}
					{text = "\bo = Delete"}
				]
			}
		else
			menu_title = 'LOAD'
			helper_text = {helper_text_elements = [{text = "\b7/\b4 = Select"}
					{text = "\bn = Back"}
					{text = "\bm = Accept"}
				]
			}
		endif
		if LevelIs load_skateshop
			pos = (55.0,40.0)
			bg_pos = (318.0,67.0)
			top_bar_pos = (60.0,80.0)
		else
			pos = (55.0,60.0)
			bg_pos = (318.0,87.0)
			top_bar_pos = (60.0,100.0)
		endif
		make_new_menu {menu_title = ""
			padding_scale = 1
			menu_id = files_menu
			vmenu_id = files_vmenu
			pos = <pos>
			dims = (500.0,192.0)
			just = [center top]
			type = VScrollingMenu
			scrolling_menu_id = files_scrolling_menu
			scrolling_menu_title_id = files_scrolling_menu_title
			scrolling_menu_offset = (0.0,32.0)
			dont_allow_wrap = dont_allow_wrap
			helper_text = <helper_text>
		}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [{pad_back generic_menu_pad_back params = {callback = reload_anims_then_run_abort_script}}
				{pad_down menu_vert_blink_arrow params = {id = files_menu_down_arrow}}
				{pad_up menu_vert_blink_arrow params = {id = files_menu_up_arrow}}
			]
		}
		theme_background width = 6.5 pos = <bg_pos> num_parts = 10 z_priority = 1 static = static
		if GotParam Save
			FormatText ChecksumName = title_icon "%i_save" i = (THEME_PREFIXES[current_theme_prefix])
		else
			FormatText ChecksumName = title_icon "%i_load" i = (THEME_PREFIXES[current_theme_prefix])
		endif
		build_theme_sub_title title = <menu_title> title_icon = <title_icon>
		if LevelIs load_skateshop
			build_top_and_bottom_blocks
			CreateScreenElement {
				type = SpriteElement
				parent = current_menu_anchor
				id = blue_bg
				texture = mm_bg_2
				rgba = [10 38 52 128]
				just = [left top]
				pos = (0.0,50.0)
				scale = (5.0,3.0)
				z_priority = -3
			}
		else
			build_top_bar
			FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
			build_theme_box_icons icon_texture = <paused_icon>
			build_grunge_piece
		endif
		files_menu_add_top_bar pos = <top_bar_pos>
		if GotParam Save
			GetMemCardDirectoryListing
			GetMemCardSpaceAvailable
			GetMemCardSpaceRequired <FileType>
			RemoveParameter add_createnew_option
			if (<TotalTHPS4FilesOnCard> = 0)
				if ((<SpaceAvailable> < <SpaceRequired>) || (<FilesLeft> < 1))
					goto mcmess_ErrorNotEnoughRoomNoTHPSFilesExist params = {
						FileType = <FileType>
						SpaceRequired = <SpaceRequired>
						SpaceAvailable = <SpaceAvailable>
					}
				else
					<add_createnew_option> = 1
				endif
			else
				if ((<SpaceAvailable> < <SpaceRequired>) || (<FilesLeft> < 1))
					if NOT GotParam DoNotShowNotEnoughRoomMessage
						goto mcmess_ErrorNotEnoughRoomButTHPSFilesExist params = {FileType = <FileType> SpaceRequired = <SpaceRequired>}
					endif
				else
					if NOT GotParam FilesLimitReached
						<add_createnew_option> = 1
					endif
				endif
			endif
			if GotParam add_createnew_option
				files_menu_add_item {file_type = <FileType>
					filename = '              Create new'
					file_size = ''
					pad_choose_script = CreateNew
					font = small
					icon_alpha = 0.0
				}
				RemoveParameter DirectoryListing
				GetMemCardDirectoryListing FileType = <FileType>
			endif
			RemoveParameter add_createnew_option
		else
			GetMemCardDirectoryListing FileType = <FileType>
		endif
		if GotParam DirectoryListing
			if GotParam Save
				ForEachIn <DirectoryListing> Do = files_menu_add_item params = {pad_choose_script = OKToOverwrite MenuFileType = <FileType> Save}
			else
				ForEachIn <DirectoryListing> Do = files_menu_add_item params = {pad_choose_script = load}
			endif
		else
			if NOT GotParam Save
				goto mcmess_NoFiles params = {MenuFileType = <FileType>}
			endif
		endif
		RemoveParameter DirectoryListing
		files_menu_add_bottom_bar <...>
		if ScreenElementExists id = controller_unplugged_dialog_anchor
			DoScreenElementMorph id = current_menu_anchor scale = 0
		else
			FireEvent type = focus target = files_vmenu
		endif
		wait 2 gameframe
		if ScreenElementExists id = files_scrolling_menu
			SetScreenElementProps id = files_scrolling_menu reset_window_top
		endif
		CheckForCardRemoval menu_id = files_menu
	endscript
	script files_menu_add_item pad_choose_script = NullScript font = dialog icon_alpha = 1.0
		SwitchToTempPoolsIfTheyExist
		FormatText ChecksumName = unhighlight_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if IsNGC
			heap = topdown
		else
			heap = #"default"
		endif
		heap = bottomup
		if IsNGC
			CreateScreenElement {
				type = ContainerElement
				parent = current_menu
				dims = (550.0,24.0)
				event_handlers = [{focus files_menu_focus}
					{unfocus files_menu_unfocus}
					{pad_choose <pad_choose_script>}
					{pad_start <pad_choose_script>}
					{pad_circle files_menu_delete}
				]
				heap = <heap>
			}
		else
			CreateScreenElement {
				type = ContainerElement
				parent = current_menu
				dims = (550.0,24.0)
				event_handlers = [{focus files_menu_focus}
					{unfocus files_menu_unfocus}
					{pad_choose <pad_choose_script>}
					{pad_start <pad_choose_script>}
					{pad_square files_menu_delete}
				]
				heap = <heap>
			}
		endif
		<container_id> = <id>
		if GotParam total_file_size
			if isPal
				FormatText textname = date "%d/%m/%y" m = <month> d = <day> y = <year>
				if (10 > <minutes>)
					mzero = "0"
				else
					mzero = ""
				endif
				FormatText textname = time "%h:%z%m" h = <hour> m = <minutes> z = <mzero>
			else
				FormatText textname = date "%m/%d/%y" m = <month> d = <day> y = <year>
				if (10 > <minutes>)
					mzero = "0"
				else
					mzero = ""
				endif
				if (<hour> < 12)
					ampm = "am"
				else
					ampm = "pm"
					hour = (<hour> - 12)
				endif
				if (<hour> = 0)
					hour = 12
				endif
				FormatText textname = time "%h:%z%m%a" h = <hour> m = <minutes> z = <mzero> a = <ampm>
			endif
		endif
		RemoveParameter year
		RemoveParameter month
		RemoveParameter day
		RemoveParameter hour
		RemoveParameter minutes
		RemoveParameter Seconds
		<container_id>::SetTags <...>
		if IsXBox
			if GotParam Corrupt
				GetFileTypeName file_type = <file_type>
				FormatText textname = filename 'DAMAGED %s' s = <filetype_name>
			endif
		endif
		CreateScreenElement {
			type = TextElement
			parent = <container_id>
			scale = 0.73000002
			font = <font>
			text = <filename>
			pos = (45.0,0.0)
			just = [left center]
			rgba = <unhighlight_rgba>
			z_priority = 6
			heap = <heap>
		}
		if GotParam total_file_size
			GetPlatform
			switch <Platform>
				case PS2
					FormatText textname = file_size_text '%d KB' d = <total_file_size>
				case XBox
					FormatText textname = file_size_text '%d KB' d = <total_file_size>
				case NGC
					FormatText textname = file_size_text '%d blocks' d = <total_file_size>
			endswitch
		else
			<file_size_text> = ""
		endif
		CreateScreenElement {
			type = TextElement
			parent = <container_id>
			scale = 0.73000002
			font = small
			text = <file_size_text>
			pos = (325.0,2.0)
			just = [right center]
			rgba = <unhighlight_rgba>
			z_priority = 6
			heap = <heap>
		}
		switch <file_type>
			case OptionsAndPros
				<file_type_icon> = mem_career
			case NetworkSettings
				<file_type_icon> = mem_net
			case Park
				<file_type_icon> = mem_park
			case Replay
				<file_type_icon> = mem_replay
			case Cas
				<file_type_icon> = mem_skater
			case CAT
				<file_type_icon> = mem_tricks
			case CreatedGoals
				<file_type_icon> = mem_goals
			default
				<file_type_icon> = mem_bad
		endswitch
		CreateScreenElement {
			type = SpriteElement
			parent = <container_id>
			scale = 0.73000002
			texture = <file_type_icon>
			pos = (25.0,0.0)
			just = [center center]
			rgba = [50 50 50 128]
			scale = 0.72000003
			z_priority = 1
			alpha = <icon_alpha>
			heap = <heap>
		}
		highlight_angle = RandomNoRepeat(@2 @-2 @3 @-3 @3.5 @-3 @5 @-4 @2.5 @-4.5)
		CreateScreenElement {
			type = SpriteElement
			parent = <container_id>
			texture = de_highlight_bar
			pos = (264.0,0.0)
			just = [center center]
			scale = (4.19999981,0.69999999)
			rgba = [128 128 128 0]
			rot_angle = (<highlight_angle> / 4)
			heap = <heap>
		}
		CreateScreenElement {
			type = TextElement
			parent = <container_id>
			scale = 0.73000002
			font = small
			text = <date>
			pos = (430.0,2.0)
			just = [right center]
			rgba = <unhighlight_rgba>
			z_priority = 6
			heap = <heap>
		}
		CreateScreenElement {
			type = TextElement
			parent = <container_id>
			scale = 0.73000002
			font = small
			text = <time>
			pos = (500.0,2.0)
			just = [right center]
			rgba = <unhighlight_rgba>
			z_priority = 6
			heap = <heap>
		}
		SwitchToRegularPools
	endscript
	script files_menu_add_top_bar
		CreateScreenElement {
			type = ContainerElement
			parent = current_menu_anchor
			dims = (550.0,24.0)
			pos = <pos>
			just = [left top]
		}
		<container_id> = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <container_id>
			id = files_menu_up_arrow
			texture = up_arrow
			pos = (250.0,0.0)
			just = [center center]
			z_priority = 3
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <container_id>
			texture = black
			pos = (0.0,0.0)
			just = [left center]
			scale = (130.0,6.0)
			rgba = [0 0 0 60]
		}
	endscript
	script files_menu_add_bottom_bar text_scale = 1.0
		FormatText ChecksumName = highlight_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = unhighlight_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		GetStackedScreenElementPos y id = files_scrolling_menu offset = (0.0,15.0)
		CreateScreenElement {
			type = ContainerElement
			parent = current_menu_anchor
			pos = <pos>
			just = [left top]
			not_focusable
		}
		<container_id> = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <container_id>
			id = files_menu_down_arrow
			texture = down_arrow
			pos = (250.0,-15.0)
			just = [left bottom]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <container_id>
			texture = black
			scale = (130.0,6.0)
			pos = (3.0,0.0)
			just = [left center]
			rgba = [0 0 0 60]
		}
		bar_id = <id>
		GetStackedScreenElementPos y id = <container_id>
		CreateScreenElement {
			type = ContainerElement
			parent = current_menu_anchor
			dims = (550.0,24.0)
			pos = <pos>
			just = [left top]
		}
		<info_section_id> = <id>
		CreateScreenElement {
			type = TextElement
			parent = <id>
			id = files_menu_file_info
			font = small
			text = ''
			pos = (20.0,0.0)
			scale = <text_scale>
			rgba = <highlight_rgba>
			just = [left center]
		}
		GetStackedScreenElementPos y id = <info_section_id>
		CreateScreenElement {
			type = ContainerElement
			parent = current_menu_anchor
			dims = (550.0,24.0)
			pos = <pos>
			just = [left top]
		}
		<mem_info_id> = <id>
		GetPlatform
		if GotParam Save
			GetMemCardSpaceRequired <FileType>
			switch <Platform>
				case XBox
				case NGC
					FormatText {
						textname = LeftText
						'Needed: %n KB'
						n = <SpaceRequired>
					}
				case PS2
					FormatText {
						textname = LeftText
						'Needed: %n KB'
						n = <SpaceRequired>
					}
			endswitch
		endif
		GetMemCardSpaceAvailable
		switch <Platform>
			case XBox
				if (<SpaceAvailable> > 49999)
					MiddleText = ''
				else
					FormatText {
						textname = MiddleText
						'Free: %f KB'
						f = <SpaceAvailable>
					}
				endif
			case NGC
				FormatText {
					textname = MiddleText
					'Free: %f blocks'
					f = <SpaceAvailable>
				}
			case PS2
				if (<SpaceAvailable> < 3)
					displayed_space_available = 0
				else
					displayed_space_available = (<SpaceAvailable> -2)
				endif
				FormatText {
					textname = MiddleText
					'Free: %f KB'
					f = <displayed_space_available>
				}
		endswitch
		GetMaxTHPS4FilesAllowed
		FormatText {
			textname = RightText
			'Saves: %t/%m'
			t = <TotalTHPS4FilesOnCard>
			m = <MaxTHPS4FilesAllowed>
		}
		if GotParam Save
			CreateScreenElement {
				type = TextElement
				parent = <mem_info_id>
				font = small
				pos = (20.0,-9.0)
				just = [left top]
				rgba = <unhighlight_rgba>
				scale = <text_scale>
				text = <LeftText>
			}
		endif
		GetStackedScreenElementPos X id = <id> offset = (20.0,0.0)
		CreateScreenElement {
			type = TextElement
			parent = <mem_info_id>
			font = small
			pos = <pos>
			just = [left top]
			rgba = <unhighlight_rgba>
			scale = <text_scale>
			text = <MiddleText>
		}
		GetStackedScreenElementPos X id = <id> offset = (20.0,0.0)
		CreateScreenElement {
			type = TextElement
			parent = <mem_info_id>
			font = small
			pos = <pos>
			just = [left top]
			rgba = <unhighlight_rgba>
			scale = <text_scale>
			text = <RightText>
		}
		GetStackedScreenElementPos y id = <bar_id> offset = (1.0,-22.0)
		CreateScreenElement {
			type = SpriteElement
			parent = <mem_info_id>
			texture = white2
			scale = (64.5,3.0)
			pos = <pos>
			just = [left top]
			rgba = <highlight_rgba>
			alpha = 0.25
		}
	endscript
	script files_menu_focus
		GetTags
		FormatText ChecksumName = highlight_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		<files_menu_file_info_text> = ''
		if NOT GotParam Index
			GetSummaryInfo <file_type> VaultData = savevaultdata
		endif
		if NOT ((GotParam BadVersion) || (GotParam Corrupt))
			switch <file_type>
				case OptionsAndPros
					GetArraySize CHAPTER_GOALS
					if GotParam currentChapter
						c = (<currentChapter> + 1)
						if (<c> > <array_size>)
							c = <array_size>
						endif
					else
						c = "?"
					endif
					FormatText {
						textname = files_menu_file_info_text
						'\c3STORY: Chapter %c of %t'
						c = <c>
						t = <array_size>
					}
				case NetworkSettings
					FormatText {
						textname = files_menu_file_info_text
						'\c3NETWORK SETTINGS: %i'
						i = <network_id>
					}
				case Cas
					<files_menu_file_info_text> = '\c3Create-a-Skater'
				case Park
					if NOT GotParam MaxPlayers
						MaxPlayers = 1
					endif
					colour = '\c3'
					if inNetGame
						GetNetworkNumPlayers
						if (<num_players> > <MaxPlayers>)
							colour = '\c2'
						endif
					endif
					if (<MaxPlayers> = 1)
						FormatText {
							textname = files_menu_file_info_text
							'%cPark for one player'
							c = <colour>
							d = <MaxPlayers>
						}
					else
						FormatText {
							textname = files_menu_file_info_text
							'%cPark for up to %d players'
							c = <colour>
							d = <MaxPlayers>
						}
					endif
				case Replay
					FormatText {
						textname = files_menu_file_info_text
						'\c3Replay: %l'
						l = <LevelName>
					}
				case CreatedGoals
					FormatText {
						textname = files_menu_file_info_text
						'\c3%i created goals'
						i = <num_edited_goals>
					}
				case CAT
			endswitch
		endif
		SetScreenElementProps {
			id = files_menu_file_info
			text = <files_menu_file_info_text>
		}
		GetTags
		RunScriptOnScreenElement id = {<id> child = 0} text_twitch_effect2
		RunScriptOnScreenElement id = {<id> child = 1} text_twitch_effect2
		RunScriptOnScreenElement id = {<id> child = 4} text_twitch_effect2
		RunScriptOnScreenElement id = {<id> child = 5} text_twitch_effect2
		SetScreenElementProps {
			id = {<id> child = 0}
			rgba = <highlight_rgba>
		}
		SetScreenElementProps {
			id = {<id> child = 1}
			rgba = <highlight_rgba>
		}
		SetScreenElementProps {
			id = {<id> child = 2}
			rgba = <highlight_rgba>
			z_priority = 7
		}
		DoScreenElementMorph {
			id = {<id> child = 2}
			scale = 1
		}
		SetScreenElementProps {
			id = {<id> child = 3}
			rgba = <bar_rgba>
		}
		SetScreenElementProps {
			id = {<id> child = 4}
			rgba = <highlight_rgba>
		}
		SetScreenElementProps {
			id = {<id> child = 5}
			rgba = <highlight_rgba>
		}
		GetScreenElementDims id = files_vmenu
		if (<height> > 216)
			SetScreenElementProps {
				id = files_menu_up_arrow
				rgba = [128 128 128 0]
			}
			SetScreenElementProps {
				id = files_menu_down_arrow
				rgba = [128 128 128 0]
			}
		else
			generic_menu_update_arrows {
				menu_id = files_vmenu
				up_arrow_id = files_menu_up_arrow
				down_arrow_id = files_menu_down_arrow
			}
		endif
	endscript
	script files_menu_unfocus
		FormatText ChecksumName = unhighlight_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		GetTags
		KillSpawnedScript Name = text_twitch_effect2
		DoScreenElementMorph {
			id = {<id> child = 0}
			scale = 0.73000002
		}
		DoScreenElementMorph {
			id = {<id> child = 1}
			scale = 0.73000002
		}
		DoScreenElementMorph {
			id = {<id> child = 2}
			scale = 0.73000002
		}
		DoScreenElementMorph {
			id = {<id> child = 4}
			scale = 0.73000002
		}
		DoScreenElementMorph {
			id = {<id> child = 5}
			scale = 0.73000002
		}
		SetScreenElementProps {
			id = {<id> child = 0}
			rgba = <unhighlight_rgba>
		}
		SetScreenElementProps {
			id = {<id> child = 1}
			rgba = <unhighlight_rgba>
		}
		SetScreenElementProps {
			id = {<id> child = 2}
			rgba = [50 50 50 128]
			z_priority = 6
		}
		DoScreenElementMorph {
			id = {<id> child = 2}
			scale = 0.72000003
		}
		SetScreenElementProps {
			id = {<id> child = 3}
			rgba = [128 128 128 0]
		}
		SetScreenElementProps {
			id = {<id> child = 4}
			rgba = <unhighlight_rgba>
		}
		SetScreenElementProps {
			id = {<id> child = 5}
			rgba = <unhighlight_rgba>
		}
	endscript
	script files_menu_delete
		GetTags
		if GotParam Index
			if GotParam Save
				memcard_menus_cleanup
				GetFileTypeName file_type = <file_type>
				if IsXBox
					FormatText {
						textname = DeleteText
						'Delete the %t\n\'%s\' ?'
						t = <filetype_name>
						s = <filename>
					}
				else
					FormatText {
						textname = DeleteText
						'Delete the %t file\n\'%s\' ?'
						t = <filetype_name>
						s = <filename>
					}
				endif
				create_snazzy_dialog_box {
					title = 'Delete'
					text = <DeleteText>
					pad_back_script = launch_files_menu
					pad_back_params = {FileType = <MenuFileType> Save}
					buttons = [
						{font = small text = 'No' pad_choose_script = launch_files_menu pad_choose_params = {FileType = <MenuFileType> Save}}
						{font = small text = 'Yes' pad_choose_script = delete_file pad_choose_params = <...>}
					]
				}
				CheckForCardRemoval menu_id = dialog_box_anchor
			endif
		endif
	endscript
	script delete_file
		memcard_menus_cleanup
		Change StopCheckingForCardRemoval = 1
		ResetTimer
		mcmess_DeletingFile FileType = <file_type>
		DisableReset
		if DeleteMemCardFile CardFileName = <actual_file_name> XBoxDirectoryName = <xbox_directory_name>
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			EnableReset
			create_snazzy_dialog_box {
				title = 'Deleted'
				text = 'Delete successful'
				pad_back_script = launch_files_menu
				pad_back_params = {FileType = <MenuFileType> Save}
				buttons = [
					{font = small text = 'OK' pad_choose_script = launch_files_menu pad_choose_params = {FileType = <MenuFileType> Save}}
				]
			}
			CheckForCardRemoval menu_id = dialog_box_anchor
		else
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			goto mcmess_ErrorDeleteFailed
		endif
	endscript
	script delete_bad_file
		memcard_menus_cleanup
		ResetTimer
		mcmess_DeletingFile FileType = <file_type>
		DisableReset
		if DeleteMemCardFile {
				CardFileName = <actual_file_name>
				XBoxDirectoryName = <xbox_directory_name>
				UserFileName = <filename>
				type = <file_type>
			}
			EnableReset
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			if GotParam GoBackToFilesMenu
				create_snazzy_dialog_box {
					title = 'Deleted'
					text = 'Delete successful'
					pad_back_script = launch_files_menu
					pad_back_params = {FileType = <MenuFileType>}
					buttons = [
						{font = small text = 'OK' pad_choose_script = launch_files_menu pad_choose_params = {FileType = <file_type>}}
					]
				}
			else
				create_snazzy_dialog_box {
					title = 'Deleted'
					text = 'Delete successful'
					pad_back_script = AbortScript
					buttons = [
						{font = small text = 'OK' pad_choose_script = AbortScript}
					]
				}
			endif
			CheckForCardRemoval menu_id = dialog_box_anchor
		else
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			goto mcmess_ErrorDeleteFailed
		endif
	endscript
	script NGC_delete_bad_file
		memcard_menus_cleanup
		ResetTimer
		mcmess_DeletingFile
		DisableReset
		if DeleteMemCardFile {
				CardFileName = <actual_file_name>
				UserFileName = <filename>
				type = <file_type>
			}
			EnableReset
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			create_snazzy_dialog_box {
				title = 'File'
				text = 'Delete successful'
				pad_back_script = launch_files_menu
				pad_back_params = {FileType = <MenuFileType> Save}
				buttons = [
					{font = small text = 'OK' pad_choose_script = launch_files_menu pad_choose_params = {FileType = <MenuFileType> Save}}
				]
			}
			CheckForCardRemoval menu_id = dialog_box_anchor
		else
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			goto mcmess_ErrorDeleteFailed
		endif
	endscript
	script OKToOverwrite
		if GotParam NoGetTags
		else
			GetTags
		endif
		if ((GotParam BadVersion) || (GotParam Corrupt))
			if IsNGC
				goto mcmess_NGCDeleteCorruptFile params = <...>
			endif
			return
		endif
		DisableReset
		GetMemCardSpaceRequired <MenuFileType>
		GetMemCardSpaceAvailable
		EnableReset
		if (<SpaceRequired> > <SpaceAvailable> + <total_file_size>)
			goto mcmess_ErrorNotEnoughRoomButTHPSFilesExist params = {
				Overwrite
				FileType = <MenuFileType>
				SpaceRequired = <SpaceRequired>
				SpaceAvailable = (<SpaceAvailable> + <total_file_size>)
			}
		endif
		memcard_menus_cleanup
		GetFileTypeName file_type = <file_type>
		if IsXBox
			FormatText {
				textname = OverwriteText
				'OK to overwrite the existing %t\n\'%s\' ?'
				t = <filetype_name>
				s = <filename>
			}
		else
			FormatText {
				textname = OverwriteText
				'OK to overwrite the existing %t file\n\'%s\' ?'
				t = <filetype_name>
				s = <filename>
			}
		endif
		create_snazzy_dialog_box {
			title = 'Overwrite'
			text = <OverwriteText>
			pad_back_script = launch_files_menu
			pad_back_params = {FileType = <MenuFileType> Save}
			buttons = [
				{font = small text = 'No' pad_choose_script = launch_files_menu pad_choose_params = {FileType = <MenuFileType> Save}}
				{
					font = small text = 'Yes'
					pad_choose_script = DeleteOldSaveNew
					pad_choose_params =
					{
						filename = <filename>
						old_file_type = <file_type>
						new_file_type = <MenuFileType>
						actual_file_name = <actual_file_name>
					}
				}
			]
		}
		CheckForCardRemoval menu_id = dialog_box_anchor
	endscript
	script DeleteOldSaveNew
		Save {
			filename = <filename>
			file_type = <new_file_type>
			total_file_size = <total_file_size>
			Overwrite = {CardFileName = <actual_file_name> UserFileName = <filename> type = <old_file_type>}
		}
	endscript
	script retry_launch_save_network_settings
		memcard_menus_cleanup
		goto launch_save_network_settings
	endscript
	script launch_save_network_settings
		destroy_net_settings_menu
		Change RetryScript = retry_launch_save_network_settings
		Change AbortScript = back_to_net_settings_menu
		Change DoneScript = back_to_net_settings_menu
		Change SavingOrLoading = Saving
		check_card FileType = NetworkSettings Save
		launch_files_menu Save FileType = NetworkSettings
	endscript
	script retry_launch_save_internet_settings
		memcard_menus_cleanup
		goto launch_save_internet_settings
	endscript
	script launch_save_internet_settings
		destroy_internet_options_menu
		Change RetryScript = retry_launch_save_internet_settings
		Change AbortScript = back_to_internet_options_menu
		Change DoneScript = back_to_internet_options_menu
		Change SavingOrLoading = Saving
		check_card FileType = NetworkSettings Save
		launch_files_menu Save FileType = NetworkSettings
	endscript
	script retry_launch_pause_menu_save_game_sequence
		memcard_menus_cleanup
		goto launch_pause_menu_save_game_sequence
	endscript
	script launch_pause_menu_save_game_sequence
		destroy_pause_menu
		Change RetryScript = retry_launch_pause_menu_save_game_sequence
		Change AbortScript = back_to_pause_menu
		Change DoneScript = back_to_pause_menu
		Change SavingOrLoading = Saving
		check_card FileType = OptionsAndPros Save
		launch_files_menu Save FileType = OptionsAndPros
	endscript
	script retry_launch_end_replay_menu_save_replay_sequence
		memcard_menus_cleanup
		goto launch_end_replay_menu_save_replay_sequence
	endscript
	script launch_end_replay_menu_save_replay_sequence
		destroy_pause_menu
		Change RetryScript = retry_launch_end_replay_menu_save_replay_sequence
		Change AbortScript = back_to_end_replay_menu
		Change DoneScript = back_to_end_replay_menu
		Change SavingOrLoading = Saving
		check_card FileType = Replay Save
		launch_files_menu Save FileType = Replay
	endscript
	save_successful = 2
	script retry_launch_pause_menu_save_park_sequence
		memcard_menus_cleanup
		goto launch_pause_menu_save_park_sequence
	endscript
	script launch_pause_menu_save_park_sequence
		destroy_pause_menu
		Change RetryScript = retry_launch_pause_menu_save_park_sequence
		Change AbortScript = back_to_pause_menu
		Change DoneScript = back_to_pause_menu
		Change SavingOrLoading = Saving
		check_card FileType = Park Save
		launch_files_menu Save FileType = Park
	endscript
	script retry_launch_park_editor_save_park_sequence
		memcard_menus_cleanup
		goto launch_park_editor_save_park_sequence
	endscript
	script launch_park_editor_save_park_sequence
		destroy_pause_menu
		Change RetryScript = retry_launch_park_editor_save_park_sequence
		Change AbortScript = back_to_pause_menu
		Change DoneScript = back_to_pause_menu
		Change SavingOrLoading = Saving
		Change save_successful = 0
		check_card FileType = Park Save
		launch_files_menu Save FileType = Park
	endscript
	script retry_launch_pause_menu_load_park_sequence
		memcard_menus_cleanup
		goto launch_pause_menu_load_park_sequence
	endscript
	script launch_pause_menu_load_park_sequence
		destroy_pause_menu
		Change RetryScript = retry_launch_pause_menu_load_park_sequence
		Change AbortScript = back_to_pause_menu
		Change DoneScript = back_to_pause_menu
		Change SavingOrLoading = Loading
		check_card FileType = Park load
		launch_files_menu load FileType = Park
	endscript
	script retry_launch_level_select_load_park_sequence
		memcard_menus_cleanup
		goto launch_level_select_load_park_sequence
	endscript
	script launch_level_select_load_park_sequence
		destroy_level_select
		Change RetryScript = retry_launch_level_select_load_park_sequence
		Change AbortScript = back_to_created_park_menu
		Change DoneScript = load_loaded_created_park
		Change SavingOrLoading = Loading
		check_card FileType = Park load
		launch_files_menu load FileType = Park
	endscript
	load_successful = 2
	loadforupload = 0
	script retry_launch_upload_file_sequence_cat
		memcard_menus_cleanup
		goto launch_upload_file_sequence params = {type = CAT}
	endscript
	script retry_launch_upload_file_sequence_cas
		memcard_menus_cleanup
		goto launch_upload_file_sequence params = {type = OptionsAndPros}
	endscript
	script retry_launch_upload_file_sequence_cag
		memcard_menus_cleanup
		goto launch_upload_file_sequence params = {type = CreatedGoals}
	endscript
	script retry_launch_upload_file_sequence_cap
		memcard_menus_cleanup
		goto launch_upload_file_sequence params = {type = Park}
	endscript
	script launch_upload_file_sequence
		Change load_successful = 0
		switch <type>
			case CAT
				Change loadforupload = 1
				Change RetryScript = retry_launch_upload_file_sequence_cat
			case OptionsAndPros
				Change loadforupload = 1
				Change RetryScript = retry_launch_upload_file_sequence_cas
			case CreatedGoals
				Change loadforupload = 1
				Change RetryScript = retry_launch_upload_file_sequence_cag
			case Park
				Change loadforupload = 1
				Change RetryScript = retry_launch_upload_file_sequence_cap
		endswitch
		Change AbortScript = back_to_internet_options_menu
		Change DoneScript = back_to_internet_options_menu
		Change SavingOrLoading = Loading
		check_card FileType = <type> load
		launch_files_menu load FileType = <type>
	endscript
	savevaultdata = 0
	script retry_launch_download_save_sequence_cat
		memcard_menus_cleanup
		goto launch_download_save_sequence params = {file_type = CAT}
	endscript
	script retry_launch_download_save_sequence_cas
		memcard_menus_cleanup
		goto launch_download_save_sequence params = {file_type = OptionsAndPros}
	endscript
	script retry_launch_download_save_sequence_cag
		memcard_menus_cleanup
		goto launch_download_save_sequence params = {file_type = CreatedGoals}
	endscript
	script retry_launch_download_save_sequence_cap
		memcard_menus_cleanup
		goto launch_download_save_sequence params = {file_type = Park}
	endscript
	script launch_download_save_sequence
		if NOT GotParam file_type
			printf "missing param file_type"
			return
		endif
		switch <file_type>
			case CAT
				Change RetryScript = retry_launch_download_save_sequence_cat
				Change savevaultdata = 1
			case OptionsAndPros
				Change RetryScript = retry_launch_download_save_sequence_cas
				Change savevaultdata = 1
			case CreatedGoals
				Change RetryScript = retry_launch_download_save_sequence_cag
				Change savevaultdata = 1
			case Park
				Change RetryScript = retry_launch_download_save_sequence_cap
				Change savevaultdata = 1
			default
				printf "bad file_type"
		endswitch
		Change AbortScript = back_from_transfer_succeeded_dialog
		Change DoneScript = back_from_transfer_succeeded_dialog
		Change SavingOrLoading = Saving
		check_card FileType = <file_type> Save
		launch_files_menu Save FileType = <file_type>
	endscript
	script retry_launch_save_cas_sequence
		memcard_menus_cleanup
		goto launch_save_cas_sequence
	endscript
	script launch_save_cas_sequence
		destroy_main_menu
		PlaySkaterCamAnim Name = SS_menucam_credits play_hold
		Change RetryScript = retry_launch_save_cas_sequence
		Change AbortScript = back_to_pre_cas_menu
		Change DoneScript = back_to_pre_cas_menu
		Change SavingOrLoading = Saving
		check_card FileType = OptionsAndPros Save
		launch_files_menu Save FileType = OptionsAndPros
	endscript
	script retry_launch_save_cat_sequence
		memcard_menus_cleanup
		goto launch_save_cat_sequence
	endscript
	script launch_save_cat_sequence
		if ScreenElementExists id = <curren_menu_anchor>
			DestroyScreenElement id = <curren_menu_anchor>
		endif
		Change RetryScript = retry_launch_save_cat_sequence
		Change AbortScript = back_to_cat_pause
		Change DoneScript = back_to_cat_pause
		Change SavingOrLoading = Saving
		check_card FileType = CAT Save
		launch_files_menu Save FileType = CAT
	endscript
	script retry_launch_options_menu_save_game_sequence
		memcard_menus_cleanup
		goto launch_options_menu_save_game_sequence
	endscript
	script launch_options_menu_save_game_sequence
		destroy_main_menu
		Change RetryScript = retry_launch_options_menu_save_game_sequence
		Change AbortScript = back_to_options_menu
		Change DoneScript = back_to_options_menu
		Change SavingOrLoading = Saving
		check_card Save FileType = OptionsAndPros
		launch_files_menu Save FileType = OptionsAndPros
	endscript
	script retry_launch_beat_goal_save_game_sequence
		memcard_menus_cleanup
		goto launch_beat_goal_save_game_sequence
	endscript
	script launch_beat_goal_save_game_sequence
		Change RetryScript = retry_launch_beat_goal_save_game_sequence
		Change AbortScript = back_to_beat_goal
		Change DoneScript = back_to_beat_goal
		Change SavingOrLoading = Saving
		check_card FileType = OptionsAndPros Save
		launch_files_menu Save FileType = OptionsAndPros
	endscript
	script AppendDigitsToFilenameUntilNoClash max_chars = 15
		if NOT IsXBox
			PauseMusic 1
			PauseStream 1
		endif
		<newfilename> = <filename>
		<i> = 2
		while
			DisableReset
			if NOT MemCardFileExists Name = <newfilename> type = <file_type>
				if NOT IsXBox
					PauseMusic -1
					PauseStream -1
				endif
				return filename = <newfilename>
				break
			endif
			AppendSuffix NewTextName = newfilename text = <filename> Suffix = <i> MaxChars = <max_chars>
			<i> = (<i> + 1)
		repeat
		if NOT IsXBox
			PauseMusic -1
			PauseStream -1
		endif
	endscript
	script CreateNew
		GetTags
		memcard_menus_cleanup
		allowed_characters = ["1" "2" "3" "4" "5" "6" "7" "8" "9" "0"
			"a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
			"k" "l" "m" "n" "o" "p" "q" "r" "s" "t"
			"u" "v" "w" "x" "y" "z"
			"A" "B" "C" "D" "E" "F" "G" "H" "I" "J"
			"K" "L" "M" "N" "O" "P" "Q" "R" "S" "T"
			"U" "V" "W" "X" "Y" "Z" " "]
		switch <file_type>
			case OptionsAndPros
				GetCustomSkaterName
				<filename> = <display_name>
			case NetworkSettings
				if NOT IsXBox
					<filename> = 'Sys Lnk Set'
				else
					<filename> = 'Net settings'
				endif
			case CAT
				get_CAT_other_param_values trick_index = 0
				<filename> = <Name>
				allowed_characters = cat_allowed_characters
			case Park
				GetCustomParkName
				<filename> = <Name>
			case Replay
				<filename> = 'Replay'
			case CreatedGoals
				<filename> = 'Created Goals'
			default
				<filename> = 'Dooby Doo'
		endswitch
		if (savevaultdata = 1)
			GetScriptString
			filename = <string>
		endif
		AppendDigitsToFilenameUntilNoClash file_type = <file_type> filename = <filename> max_chars = MAX_MEMCARD_FILENAME_LENGTH
		create_onscreen_keyboard {
			allow_cancel
			keyboard_cancel_script = launch_files_menu
			keyboard_cancel_params = {FileType = <file_type> Save}
			keyboard_done_script = CreateNew_Done
			keyboard_title = 'SAVE NAME'
			text = <filename>
			min_length = 1
			max_length = MAX_MEMCARD_FILENAME_LENGTH
			FileType = <file_type>
			allowed_characters = <allowed_characters>
		}
		CheckForCardRemoval menu_id = keyboard_anchor
	endscript
	script CreateNew_Done
		GetTextElementString id = keyboard_current_string
		memcard_menus_cleanup
		if (savevaultdata = 0)
			switch <FileType>
				case OptionsAndPros
					SetCustomSkaterFilename <string>
				case Park
					SetCustomParkName Name = <string>
					SetParkName <string>
				case CAT
					get_CAT_other_param_values trick_index = 0
					if (<Name> = "")
						set_new_CAT_param_values trick_index = 0 Name = <string> can_spin = <can_spin>
					endif
			endswitch
		endif
		check_card FileType = <FileType> Save
		DisableReset
		if MemCardFileExists Name = <string> type = <FileType>
			OKToOverwrite NoGetTags filename = <string> file_type = <FileType> MenuFileType = <FileType> total_file_size = <total_file_size>
		else
			Save filename = <string> file_type = <FileType>
		endif
	endscript
	script Save
		memcard_menus_cleanup
		if (savevaultdata = 0)
			switch <file_type>
				case Park
					SetCustomParkName Name = <filename>
					SetParkName <filename>
				case OptionsAndPros
					SetCustomSkaterFilename <filename>
			endswitch
		endif
		DisableReset
		ResetTimer
		if GotParam Overwrite
			Change StopCheckingForCardRemoval = 1
			mcmess_OverwritingData FileType = <file_type>
			Change StopCheckingForCardRemoval = 0
			if NOT DeleteMemCardFile CardFileName = (<Overwrite>.CardFileName) UserFileName = (<Overwrite>.UserFileName) type = (<Overwrite>.type)
				RemoveMemCardPoolsAndLoadAnims
				goto mcmess_ErrorOverwriteFailed
			endif
			if MemCardFileExists Name = <filename> type = <file_type>
				goto OKToOverwrite params = {NoGetTags filename = <filename> file_type = <file_type> MenuFileType = <file_type> total_file_size = <total_file_size>}
			endif
		else
			mcmess_SavingData FileType = <file_type>
		endif
		DisableReset
		if SaveToMemoryCard Name = <filename> type = <file_type> savevaultdata = savevaultdata
			RemoveMemCardPoolsAndLoadAnims
			mem_card_message_pause NoTimerReset NoCardRemovalCheck
			if (save_successful = 0)
				Change save_successful = 1
				goto AbortScript params = {type = <file_type>}
			else
				if GotParam Overwrite
					goto mcmess_OverwriteSuccessful params = {type = <file_type>}
				else
					goto mcmess_SaveSuccessful params = {type = <file_type>}
				endif
			endif
		else
			RemoveMemCardPoolsAndLoadAnims
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			if GotParam Overwrite
				goto mcmess_ErrorOverwriteFailed
			else
				goto mcmess_ErrorSaveFailed
			endif
		endif
	endscript
	script PostAutoSaveCas
		Change DoneScript = AbortScript
		Change SavingOrLoading = Saving
		launch_files_menu Save FileType = OptionsAndPros
	endscript
	DoAutoload = 1
	no_load = 0
	most_recent_save_exists = 0
	attempted_xbox_autoload = 0
	goto_secret_shop = 0
	script maybe_auto_load_from_memory_card
		if (DoAutoload = 0)
			Change show_career_startup_menu = 0
			SpawnScript wait_and_pause_skater params = {time = 1}
			if ConnectedToPeer
				SetNetworkMode INTERNET_MODE
				change_gamemode_net
				SetQuietMode off
				rejoin_lobby
				kill_start_key_binding
			else
				launch_main_menu
			endif
		else
			Change DoAutoload = 0
			if IsInternetGameHost
				CheckForCardOnBootup
			else
				if IsJoiningInternetGame
					CheckForCardOnBootup
				else
					if NOT IsXBox
						if NOT GotParam force_autoload
							wait 3 gameframes
							if NOT PadsPluggedIn
								goto back_to_main_menu2
							endif
							SpawnScript wait_and_pause_skater
							goto back_to_main_menu2
						else
							SpawnScript wait_and_pause_skater params = {time = 1}
							CheckForCardOnBootup
						endif
					else
						SpawnScript wait_and_pause_skater
						CheckForCardOnBootup
					endif
				endif
			endif
		endif
	endscript
	script CheckForCardOnBootup
		ResetAbortAndDoneScripts
		DisableReset
		if CardIsInSlot
			if BadDevice
				Change RetryScript = CheckForCardOnBootup
				Change AbortScript = back_to_main_menu2
				goto mcmess_BadDevice
			else
				if SectorSizeOK
					goto auto_load
				else
					Change RetryScript = CheckForCardOnBootup
					Change AbortScript = back_to_main_menu2
					if CardIsDamaged
						goto mcmess_DamagedCard
					else
						goto mcmess_BadSectorSize
					endif
				endif
			endif
		else
			Change RetryScript = CheckForCardOnBootup
			Change AbortScript = back_to_main_menu2
			goto mcmess_ErrorNoCardOnBootup
		endif
	endscript
	script auto_load
		if (no_load = 0)
			memcard_menus_cleanup
		endif
		if IsInternetGameHost
			Change AbortScript = start_internet_game
			Change DoneScript = start_internet_game
		else
			if IsJoiningInternetGame
				Change AbortScript = start_internet_game
				Change DoneScript = start_internet_game
			else
				Change AbortScript = back_to_main_menu2
				Change DoneScript = back_to_main_menu2
			endif
		endif
		Change RetryScript = auto_load
		Change SavingOrLoading = Loading
		StopMusic
		DisableReset
		if NOT CardIsInSlot
			goto mcmess_ErrorNoCardOnBootup
		endif
		ResetTimer
		mcmess_CheckingCard
		DisableReset
		if BadDevice
			mem_card_message_pause NoTimerReset NoCardRemovalCheck
			goto mcmess_BadDevice
		endif
		if CardIsDamaged
			mem_card_message_pause NoTimerReset NoCardRemovalCheck
			goto mcmess_DamagedCard
		endif
		if NOT SectorSizeOK
			if CardIsDamaged
				mem_card_message_pause NoTimerReset NoCardRemovalCheck
				goto mcmess_DamagedCard
			else
				mem_card_message_pause NoTimerReset NoCardRemovalCheck
				goto mcmess_BadSectorSize
			endif
		endif
		DisableReset
		if NOT CardIsFormatted
			if CardIsDamaged
				goto mcmess_DamagedCard
			else
				if IsPS2
					Change show_career_startup_menu = 0
					RemoveMemCardPoolsAndLoadAnims
					KillSpawnedScript Name = wait_and_pause_skater
					goto back_to_main_menu2
				else
					mem_card_message_pause NoTimerReset NoCardRemovalCheck
					goto mcmess_ErrorNotFormatted params = {QuitText = 'Continue without formatting' BackScript = NullScript}
				endif
			endif
		endif
		if (no_load = 0)
			DisableReset
			GetMemCardDirectoryListing
			GetMostRecentSave <DirectoryListing> NetworkSettings
			mem_card_message_pause NoTimerReset NoCardRemovalCheck
			if NOT CardIsInSlot
				goto mcmess_ErrorNoCardOnBootup
			endif
		endif
		<did_load> = 0
		if GotParam MostRecentSave
			Change most_recent_save_exists = 1
			ResetTimer
			mcmess_LoadingData FileType = NetworkSettings
			DisableReset
			if LoadFromMemoryCard Name = (<MostRecentSave>.filename) type = NetworkSettings
				GetPreferenceChecksum pref_type = network config_type
				switch <checksum>
					case config_sony
						LoadNetConfigs
						GetPreferenceString pref_type = network config_type
						ChooseNetConfig Name = <ui_string>
				endswitch
			else
				mem_card_message_pause NoTimerReset NoCardRemovalCheck
				goto mcmess_ErrorLoadFailed params = {
					<...>
					filename = (<MostRecentSave>.filename)
					actual_file_name = (<MostRecentSave>.actual_file_name)
					file_type = NetworkSettings
				}
			endif
			<did_load> = 1
		endif
		DisableReset
		GetMostRecentSave <DirectoryListing> OptionsAndPros
		if GotParam MostRecentSave
			if (<did_load> = 0)
				ResetTimer
				mcmess_LoadingData FileType = OptionsAndPros
			endif
			SetSectionsToApplyWhenLoading All
			DisableReset
			if NOT LoadFromMemoryCard Name = (<MostRecentSave>.filename) type = OptionsAndPros
				mem_card_message_pause NoTimerReset NoCardRemovalCheck
				goto mcmess_ErrorLoadFailed params = {
					<...>
					filename = (<MostRecentSave>.filename)
					actual_file_name = (<MostRecentSave>.actual_file_name)
					file_type = OptionsAndPros
				}
			endif
			<did_load> = 1
		endif
		if (<did_load> = 1)
		endif
		DisableReset
		GetMemCardSpaceAvailable
		GetSaveSizes
		if IsPS2
			if isPal
				<TotalSpaceRequired> = <SaveSize_OptionsAndPros>
			else
				<TotalSpaceRequired> = (<SaveSize_OptionsAndPros> +
				<SaveSize_Park> +
				<SaveSize_CreateATrick> +
				<SaveSize_Goals> +
				<SaveSize_NetworkSettings>)
			endif
		else
			<TotalSpaceRequired> = (<SaveSize_OptionsAndPros> +
			<SaveSize_Park> +
			<SaveSize_CreateATrick> +
			<SaveSize_Goals>)
		endif
		if (<FilesLeft> < 4)
			mem_card_message_pause XSkips NoTimerReset
			goto mcmess_ErrorNotEnoughSpaceToSaveAllTypes
		endif
		if (<SpaceAvailable> < <TotalSpaceRequired>)
			mem_card_message_pause XSkips NoTimerReset
			goto mcmess_ErrorNotEnoughSpaceToSaveAllTypes
		endif
		build_top_and_bottom_blocks parent = root_window
		make_mainmenu_3d_plane parent = root_window
		Change show_career_startup_menu = 0
		if IsInternetGameHost
			start_internet_game
		else
			if IsJoiningInternetGame
				start_internet_game
			else
				goto back_to_main_menu2
			endif
		endif
	endscript
	script retry_launch_pause_menu_save_created_goals
		memcard_menus_cleanup
		goto launch_pause_menu_save_created_goals
	endscript
	script launch_pause_menu_save_created_goals
		memcard_menus_cleanup
		Change RetryScript = retry_launch_pause_menu_save_created_goals
		Change AbortScript = back_to_pause_menu
		Change DoneScript = back_to_pause_menu
		Change SavingOrLoading = Saving
		check_card FileType = CreatedGoals Save
		launch_files_menu Save FileType = CreatedGoals
	endscript
	DoInitialiseCreatedGoalsAfterLoading = 0
	script retry_launch_pause_menu_load_created_goals
		memcard_menus_cleanup
		goto launch_pause_menu_load_created_goals
	endscript
	script launch_pause_menu_load_created_goals
		destroy_pause_menu
		Change RetryScript = retry_launch_pause_menu_load_created_goals
		Change AbortScript = back_to_pause_menu
		Change DoneScript = back_to_pause_menu
		Change SavingOrLoading = Loading
		Change DoInitialiseCreatedGoalsAfterLoading = 1
		check_card FileType = CreatedGoals
		launch_files_menu FileType = CreatedGoals
	endscript
	script launch_load_created_goals_from_select_goals_menu
		Change check_for_unplugged_controllers = 0
		memcard_menus_cleanup
		Change RetryScript = launch_load_created_goals_from_select_goals_menu
		Change AbortScript = create_select_goals_menu
		Change DoneScript = create_select_goals_menu
		Change SavingOrLoading = Loading
		Change DoInitialiseCreatedGoalsAfterLoading = 0
		check_card FileType = CreatedGoals
		launch_files_menu FileType = CreatedGoals
		Change check_for_unplugged_controllers = 1
	endscript
	script launch_load_created_goals_from_host_goals_menu
		memcard_menus_cleanup
		Change RetryScript = launch_load_created_goals_from_host_goals_menu
		Change AbortScript = launch_network_host_options_menu
		Change DoneScript = host_options_goals_sub_menu_return
		Change SavingOrLoading = Loading
		Change DoInitialiseCreatedGoalsAfterLoading = 0
		check_card FileType = CreatedGoals
		launch_files_menu FileType = CreatedGoals
	endscript
	script launch_load_created_goals_from_game_options_menu
		memcard_menus_cleanup
		Change RetryScript = launch_load_created_goals_from_game_options_menu
		Change AbortScript = create_network_game_options_menu
		Change DoneScript = game_options_goals_sub_menu_return
		Change SavingOrLoading = Loading
		Change DoInitialiseCreatedGoalsAfterLoading = 0
		check_card FileType = CreatedGoals
		launch_files_menu FileType = CreatedGoals
	endscript
	script retry_launch_load_network_settings
		memcard_menus_cleanup
		goto launch_load_network_settings
	endscript
	script launch_load_network_settings
		destroy_net_settings_menu
		Change RetryScript = retry_launch_load_network_settings
		Change AbortScript = back_to_net_settings_menu
		Change DoneScript = back_to_net_settings_menu
		Change SavingOrLoading = Loading
		check_card FileType = NetworkSettings
		launch_files_menu FileType = NetworkSettings
	endscript
	script retry_launch_options_menu_load_game_sequence
		memcard_menus_cleanup
		goto launch_options_menu_load_game_sequence
	endscript
	script retry_launch_career_menu_load_game_sequence
		memcard_menus_cleanup
		goto launch_career_menu_load_game_sequence
	endscript
	script launch_career_menu_load_game_sequence
		dialog_box_exit
		destroy_main_menu
		Skater::Hide
		Change RetryScript = retry_launch_career_menu_load_game_sequence
		Change AbortScript = back_to_career_options_menu
		Change DoneScript = back_to_career_options_menu
		Change SavingOrLoading = Loading
		SetSectionsToApplyWhenLoading All
		check_card FileType = OptionsAndPros
		launch_files_menu FileType = OptionsAndPros
	endscript
	script launch_options_menu_load_game_sequence
		destroy_main_menu
		Change RetryScript = retry_launch_options_menu_load_game_sequence
		Change AbortScript = back_to_options_menu
		Change DoneScript = back_to_options_menu
		Change SavingOrLoading = Loading
		SetSectionsToApplyWhenLoading All
		check_card FileType = OptionsAndPros
		launch_files_menu FileType = OptionsAndPros
	endscript
	script retry_launch_options_menu_load_replay_sequence
		memcard_menus_cleanup
		goto launch_options_menu_load_replay_sequence
	endscript
	script launch_options_menu_load_replay_sequence
		destroy_main_menu
		Change RetryScript = retry_launch_options_menu_load_replay_sequence
		Change AbortScript = back_to_options_menu
		Change DoneScript = back_to_options_menu
		Change SavingOrLoading = Loading
		check_card FileType = Replay
		launch_files_menu FileType = Replay
	endscript
	script retry_launch_load_cas_sequence
		memcard_menus_cleanup
		goto launch_load_cas_sequence
	endscript
	script launch_load_cas_sequence
		destroy_main_menu
		Change AbortScript = back_to_pre_cas_menu
		Change DoneScript = jump_to_edit_skater
		Change RetryScript = retry_launch_load_cas_sequence
		Change SavingOrLoading = Loading
		SetSectionsToApplyWhenLoading All
		check_card FileType = OptionsAndPros
		launch_files_menu FileType = OptionsAndPros
	endscript
	script retry_launch_load_cas_from_select_sequence
		memcard_menus_cleanup
		goto launch_load_cas_from_select_sequence
	endscript
	script launch_load_cas_from_select_sequence
		Change check_for_unplugged_controllers = 0
		destroy_main_menu
		dialog_box_exit
		KillSkaterCamAnim All
		PlaySkaterCamAnim {Name = mainmenu_camera02
			Skater = 0
			targetID = <objId>
			targetOffset = <targetOffset>
			positionOffset = <positionOffset>
			play_hold
			frames = 1
		}
		Change AbortScript = back_to_select_skater
		Change DoneScript = back_to_select_skater
		Change RetryScript = retry_launch_load_cas_from_select_sequence
		Change SavingOrLoading = Loading
		GetCurrentSkaterProfileIndex
		if (<currentSkaterProfileIndex> = 0)
			SetSectionsToApplyWhenLoading All
		else
			SetSectionsToApplyWhenLoading ApplyCustomSkater
		endif
		check_card FileType = OptionsAndPros
		launch_files_menu FileType = OptionsAndPros
		Change check_for_unplugged_controllers = 1
	endscript
	script retry_launch_load_cat_sequence
		memcard_menus_cleanup
		goto launch_load_cat_sequence
	endscript
	script launch_load_cat_sequence
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		Change AbortScript = back_to_pre_cat_menu
		Change DoneScript = back_to_edit_cat_menu
		Change RetryScript = retry_launch_load_cat_sequence
		Change SavingOrLoading = Loading
		check_card FileType = CAT
		launch_files_menu FileType = CAT
	endscript
	script retry_launch_load_cat_sequence2
		memcard_menus_cleanup
		goto launch_load_cat_sequence2
	endscript
	script launch_load_cat_sequence2
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		Change loading_cat_from_edit_tricks = 1
		Change AbortScript = back_to_edit_tricks_menu
		Change DoneScript = finish_loading_cat
		Change RetryScript = retry_launch_load_cat_sequence2
		Change SavingOrLoading = Loading
		check_card FileType = CAT
		launch_files_menu FileType = CAT
	endscript
	script load
		GetTags
		if inNetGame
			if (<file_type> = Park)
				if NOT GotParam MaxPlayers
					MaxPlayers = 1
				endif
				GetNetworkNumPlayers
				if inNetGame
					if (<num_players> > <MaxPlayers>)
						memcard_menus_cleanup
						goto mcmess_ErrorbadParkMaxPlayers params = <...>
					endif
				endif
			endif
		endif
		if ((GotParam BadVersion) || (GotParam Corrupt))
			if IsNGC
				memcard_menus_cleanup
				goto mcmess_ErrorLoadFailed params = {<...> CorruptedData GoBackToFilesMenu}
			else
				return
			endif
		endif
		memcard_menus_cleanup
		generic_menu_pad_choose_sound
		ResetTimer
		mcmess_LoadingData FileType = <file_type>
		DisableReset
		if LoadFromMemoryCard Name = <filename> type = <file_type> loadforupload = loadforupload
			Change check_for_unplugged_controllers = 0
			mcmess_LoadingData FileType = <file_type> no_animate = no_animate
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			if (load_successful = 0)
				Change load_successful = 1
				Change check_for_unplugged_controllers = 1
				goto AbortScript params = {type = <file_type> filename = <filename>}
			else
				Change check_for_unplugged_controllers = 1
				if (<file_type> = Park)
					if inNetGame
						goto DoneScript type = <file_type>
					endif
				endif
				goto mcmess_LoadSuccessful params = {type = <file_type> filename = <filename>}
			endif
		else
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			goto mcmess_ErrorLoadFailed params = {<...> GoBackToFilesMenu}
		endif
	endscript
	script post_load_from_memory_card
		if NOT GotParam type
			printstruct <...>
			script_assert "Expected to find parameter 'type'!"
		endif
		switch <type>
			case OptionsAndPros
				career_post_load
				if LoadedCustomSkater
					load_pro_skater Name = custom
					cas_post_load
				endif
				printf current_theme_prefix
			case Park
				SetCustomParkName Name = <Name>
				SetParkName <Name>
				if CustomParkMode editing
					InitialiseCreatedGoals
				endif
			case CreatedGoals
				end_current_goal_run
				if istrue DoInitialiseCreatedGoalsAfterLoading
					InitialiseCreatedGoals
				endif
		endswitch
	endscript
	script UnloadAnimsAndCreateMemCardPools
		if NOT LevelIs load_skateshop
			if NOT LevelIs load_sk5ed
				do_unload_unloadable
				if IsNGC
				else
					CreateTemporaryMemCardPools
				endif
			endif
		endif
	endscript
	script RemoveMemCardPoolsAndLoadAnims
		if NOT LevelIs load_skateshop
			if NOT LevelIs load_sk5ed
				if NOT IsNGC
					RemoveTemporaryMemCardPools
				endif
				do_load_unloadable
			endif
		endif
	endscript
	script reload_anims_then_run_abort_script
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		RemoveMemCardPoolsAndLoadAnims
		goto AbortScript
	endscript
