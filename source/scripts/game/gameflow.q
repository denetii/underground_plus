	dont_unhide_loading_screen = 0
	script Game_Update
		GoalManager_UpdateAllGoals
	endscript
	script WaitFrameLoop
		while
			wait 1 gameframe
		repeat
	endscript
	script SetGameState
		SetCurrentGameType
		cleanup_before_loading_level
		LaunchGame
	endscript
	script load_requested_level
		GetCurrentLevel
		LoadLevel level = <level>
	endscript
	script InitializeGameFlow
		load_requested_level
		StandardGameFlow
	endscript
	script ChangeLevelGameFlow
		change FirstTimeInSplitScreen = 1
		if NOT IsObserving
			Skater::SetCustomRestart clear
		endif
		load_requested_level
		if NOT InSplitScreenGame
			ResetSkaters
		endif
		if InNetGame
			if NOT GameModeEquals is_lobby
				SetGameType netlobby
				SetCurrentGameType
			endif
			if OnServer
				GetPreferenceChecksum pref_type = network team_mode
				switch <checksum>
					case teams_none
						SetNumTeams 0
						printf "Team mode off"
					case teams_two
						SetNumTeams 2
						printf "2 Teams"
					case teams_three
						SetNumTeams 3
						printf "3 Teams"
					case teams_four
						SetNumTeams 4
						printf "4 Teams"
				endswitch
			endif
		endif
		while
			if SkatersAreReady
				break
			endif
			wait 1 gameframe
		repeat
		SetScreenModeFromGameMode
		StandardGameFlow
	endscript
	script pause_game_flow
		printf "Pausing game flow"
		PauseGameFlow
		wait 1 gameframe
	endscript
	script unpause_game_flow
		printf "Unpausing game flow"
		UnpauseGameFlow
	endscript
	script GameFlow_Startup
		DisablePause
		if InSplitScreenGame
			if VibrationIsOn 0
				VibrationOff 0
				turn_vibration_back_on = 1
			endif
			if VibrationIsOn 1
				VibrationOff 1
				turn_player2_vibration_back_on = 1
			endif
		endif
		if InNetGame
			while
				wait 1 gameframe
				if SkatersAreReady
					break
				endif
			repeat 120
			while
				if SkatersAreReady
					dialog_box_exit
					break
				endif
				if NOT SkatersAreReady
					if NOT ScreenElementExists id = dialog_box_anchor
						if NOT ScreenElementExists id = quit_dialog_anchor
							HideLoadingScreen
							exit_pause_menu
							create_dialog_box {title = net_status_msg
								text = net_message_waiting
								buttons = [{text = "Quit" pad_choose_script = quit_network_game}
								]
								no_animate
							}
						endif
					endif
				endif
				wait 1 gameframe
			repeat
		else
			while
				wait 1 gameframe
				if SkatersAreReady
					break
				endif
			repeat
		endif
		if GotParam turn_vibration_back_on
			wait 2 gameframes
			VibrationOn 0
		endif
		if GotParam turn_player2_vibration_back_on
			if NOT GotParam turn_vibration_back_on
				wait 2 gameframes
			endif
			VibrationOn 1
		endif
		RestartLevel
		InitializeSkaters
		KillMessages
		PauseStream 0
		if InNetGame
			if GameModeEquals is_lobby
				if OnServer
					server_enter_free_skate
				else
					if IsHost
						server_enter_free_skate
					endif
					client_enter_free_skate
				endif
				if InInternetMode
					if OnServer
						PostGame
					endif
				endif
			endif
		endif
		if NOT InNetGame
			ReinsertSkaters
		endif
		SetScreenModeFromGameMode
		if InMultiplayerGame
			destroy_panel_stuff
			create_panel_stuff
		endif
		if GameModeEquals is_horse
			StartHorse
		endif
		DeallocateReplayMemory
		if NOT InMultiplayerGame
			if NOT CareerLevelIs LevelNum_Skateshop
				AllocateReplayMemory
				change EndOfReplayShouldJumpToPauseMenu = 0
				if NeedToLoadReplayBuffer
					if LoadReplayData
						view_loaded_replay
					else
						printf "Loading replay from mem card failed !!!"
					endif
				endif
			endif
		endif
		if CustomParkMode editing
			SetActiveCamera id = parked_cam
		endif
		create_menu_camera
	endscript
	dont_restore_start_key_binding = 0
	show_career_startup_menu = 1
	script GameFlow_StartRun
		if NOT LevelIs load_skateshop
			if GameModeEquals is_singlesession
				GoalManager_SetEndRunType name = TrickAttack EndOfRun
				GoalManager_EditGoal name = TrickAttack params = {time = 120 restart_node = #"P1: Restart"}
			endif
		endif
		if InSplitScreenGame
			GetSkaterId Skater = 0
			<ObjId>::Obj_SpawnScript CleanUp_Scuffs
			GetSkaterId Skater = 1
			<ObjId>::Obj_SpawnScript CleanUp_Scuffs
		else
			if NOT IsObserving
				Skater::Obj_SpawnScript CleanUp_Scuffs
			endif
		endif
		if NOT IsTrue Bootstrap_Build
			if NOT InNetGame
				toggle_geo_nomenu toggle_comp_geo_params
			endif
		endif
		toggle_geo_nomenu toggle_proset1_params
		toggle_geo_nomenu toggle_proset2_params
		toggle_geo_nomenu toggle_proset3_params
		toggle_geo_nomenu toggle_proset4_params
		toggle_geo_nomenu toggle_proset5_params
		toggle_geo_nomenu toggle_proset6_params
		toggle_geo_nomenu toggle_proset7_params
		if NOT LevelIs load_cas
			PlaySkaterCamAnim Skater = 0 stop
		endif
		DisablePause
		ResetSkaters
		if IsCareerMode
			UnSetGlobalFlag flag = PROMPT_FOR_SAVE
		endif
		printf "starting a run....skip tracks and crank up the music"
		if GameModeEquals is_horse
		else
			SkipMusicTrack
		endif
		if IsCareerMode
			if IsTrue ALWAYSPLAYMUSIC
				PauseMusic 0
			else
				PauseMusic 1
			endif
		else
			PauseMusic 0
		endif
		if GameModeEquals default_time_limit
			UnSetFlag flag = GOAL_MID_GOAL
			ResetClock
		else
		endif
		if GameModeEquals is_horse
			horse_start_run
		endif
		if InNetGame
			if OnServer
			else
				LaunchQueuedScripts
				if IsObserving
					ShowAllObjects
					if GameModeEquals is_goal_attack
						GoalManager_InitializeAllSelectedGoals
					endif
				endif
			endif
		endif
		if LevelIs load_cas
			if (in_cinematic_sequence = 1)
				killskatercamanim all
				unpausegame
				change check_for_unplugged_controllers = 0
				play_first_cutscene
				return
			endif
		endif
		if NOT (next_level_script = nullscript)
			if (next_level_script = select_sponsor_select_after_movies)
				DisplayLoadingScreen blank
				change dont_unhide_loading_screen = 1
				change dont_restore_start_key_binding = 1
			endif
			SpawnScript next_level_script
			change next_level_script = nullscript
		endif
		<should_check_for_controllers> = 1
		if LevelIs load_nj
			if (in_cinematic_sequence = 1)
				<should_check_for_controllers> = 0
				change in_cinematic_sequence = 0
				killskatercamanim all
				unpausegame
				SetGlobalFlag flag = VIEWED_CUTSCENE_NJ_01V
				PlayCutscene name = "cutscenes\NJ_01V.cut" exitScript = ChapterTitle_and_Restore_Start_Key dont_unload_anims
				return
			endif
		endif
		if (<should_check_for_controllers> = 1)
			SpawnScript wait_and_check_for_unplugged_controllers
		endif
		if GameModeEquals is_career
			if NOT LevelIs load_skateshop
				if NOT LevelIs load_cas
					if NOT LevelIs load_boardshop
						Skater::StatsManager_ActivateGoals
						if (show_career_startup_menu = 1)
							create_career_startup_menu
							SpawnScript reset_show_career_startup_menu
							return
						else
							if NOT ((change_level_goal_id[0]) = null)
								goal_accept_trigger goal_id = (change_level_goal_id[0]) force_start
								array_name = change_level_goal_id
								SetArrayElement ArrayName = array_name index = 0 newvalue = null
								return
							endif
						endif
					endif
				endif
			endif
		endif
		if NOT LevelIs load_skateshop
			if NOT (dont_restore_start_key_binding = 1)
				restore_start_key_binding
			endif
		endif
		if NOT LevelIs load_skateshop
			if NOT LevelIs load_cas
				if NOT LevelIs load_boardshop
					if (launch_to_createatrick = 1)
						if LevelIs load_nj
							Skater::Obj_MoveToNode name = TRG_G_CAT_RestartNode Orient NoReset
						endif
						PauseGame
						change inside_pause = 1
						if MusicIsPaused
							change music_was_paused = 1
						else
							change music_was_paused = 0
						endif
						PauseMusicAndStreams 1
						pause_menu_gradient on
						create_pre_cat_menu from_mainmenu
						change launch_to_createatrick = 0
						change check_for_unplugged_controllers = 1
						return
					endif
				endif
			endif
		endif
		if LevelIs load_sk5ed_gameplay
			parked_set_tod
		else
			if InMultiplayerGame
				script_set_level_tod
			endif
		endif
	endscript
	script GameFlow_PlayRun
		if IsTrue AlwaysDump
			DumpHeaps
			change AlwaysDump = 0
		endif
		if NOT LevelIs load_skateshop
			if NOT RunningReplay
				if ScreenElementExists id = controller_unplugged_dialog_anchor
					kill_start_key_binding
				else
					if (show_career_startup_menu = 0)
						if NOT (dont_restore_start_key_binding = 1)
							restore_start_key_binding
						endif
					endif
				endif
			endif
		endif
		if GameModeEquals is_creategoals
			restore_start_key_binding
		endif
		if IsTrue Bootstrap_Build
			if CareerLevelIs LevelNum_Sch
				if IsTrue STARTGAME_FIRST_TIME
					create_startup_menu
				endif
			endif
		endif
		if InSplitScreenGame
			if IsTrue FirstTimeInSplitScreen
				PauseGame
			endif
		endif
		wait 1 gameframe
		if IsMovieQueued
			while
				if HasMovieStarted
					break
				endif
				wait 1 gameframe
			repeat
		endif
		wait 2 gameframe
		change is_changing_levels = 0
		if NOT (dont_unhide_loading_screen = 1)
			HideLoadingScreen
		endif
		if InSplitScreenGame
			SetActiveCamera id = skatercam0 viewport = 0
			SetActiveCamera id = skatercam1 viewport = 1
			if IsTrue FirstTimeInSplitScreen
				ScreenElementSystemCleanup
				change FirstTimeInSplitScreen = 0
				PauseGame
				create_end_run_menu
			endif
		endif
		if InMultiplayerGame
		else
			UseOnePadInFrontEnd
		endif
		EnableActuators
		EnablePause
		refresh_poly_count
		while
			if ShouldEndRun
				printf "************ SHOULD BREAK"
				break
			endif
			if GameModeEquals is_horse
				if FirstTrickStarted
					HideClock
					GoalManager_ZeroGoalTimer name = horse_mp
					printf "************ TRICK STARTED"
					break
				endif
			endif
			wait 1 gameframe
		repeat
	endscript
	script GameFlow_WaitEnd
		printf "************ IN GAMEFLOW_WAITEND"
		while
			if EndRunSelected
				break
			endif
			if IsCareerMode
				if TimeUp
					TimeUpScript
				endif
			else
				if GameModeEquals is_singlesession
					break
				else
					if NOT LevelIs load_skateshop
						if AllSkatersAreIdle
							break
						endif
					endif
				endif
			endif
			wait 1 gameframe
		repeat
		EnableActuators 0
		printf "About to disable"
		DisablePause
		wait 2 game frames
		if NOT GameModeEquals is_singlesession
			if NOT InSplitScreenGame
				unpausegame
			endif
		endif
		wait 2 game frames
		KillMessages
		KillSpawnedScript name = SK3_Killskater_Finish
	endscript
	script GameFlow_End
		printf "************** IN GAMEFLOW END************"
		while
			if CalculateFinalScores
				break
			endif
			wait 1 gameframe
		repeat
		if IsCareerMode
			if GetGlobalFlag flag = SHOW_CREDITS
				UnSetGlobalFlag flag = SHOW_CREDITS
				if CD
					wait 1 gameframe
					cleanup_play_movie "movies\pccredits"
					ingame_play_movie "movies\credits"
				endif
			endif
		else
			if IsCustomPark
			else
				if GameModeEquals is_singlesession
				endif
			endif
		endif
		if JustGotFlag flag = GOAL_STAT_POINT1
			printf "stat point"
			SwitchToMenu menu = stats_menu
			pause_game_flow
		else
			if JustGotFlag flag = GOAL_STAT_POINT2
				printf "stat point"
				SwitchToMenu menu = stats_menu
				pause_game_flow
			else
				if JustGotFlag flag = GOAL_STAT_POINT3
					printf "stat point"
					SwitchToMenu menu = stats_menu
					pause_game_flow
				else
					if JustGotFlag flag = GOAL_STAT_POINT4
						printf "stat point"
						SwitchToMenu menu = stats_menu
						pause_game_flow
					else
						if JustGotFlag flag = GOAL_STAT_POINT5
							printf "stat point"
							SwitchToMenu menu = stats_menu
							pause_game_flow
						endif
					endif
				endif
			endif
		endif
		if GameModeEquals show_ranking_screen
		endif
		if InNetGame
			if OnServer
				wait 5 gameframes
				LoadPendingPlayers
			endif
		endif
	endscript
	script StandardGameFlow
		printf "starting standard gameflow"
		GameFlow_Startup
		StandardGameFlowBody
	endscript
	script StandardGameFlowToggleView
		printf "starting standard gameflow"
		GameFlow_Startup
		ToggleViewMode
		StandardGameFlowBody
	endscript
	script StandardGameFlowBody
		while
			GameFlow_StartRun
			GameFlow_PlayRun
			GameFlow_WaitEnd
			if GameModeEquals is_horse
				if EndRunSelected
					break
				endif
				horse_end_run
				if HorseEnded
					break
				else
					InitializeSkaters
				endif
			else
				break
			endif
		repeat
		if GameModeEquals is_horse
			horse_uninit
		endif
		GameFlow_End
		WaitFrameLoop
	endscript
	script spawn_movie
		SpawnScript play_movie_task params = {<...>}
	endscript
	script play_movie_task
		playmovie_script <...>
	endscript
	script ShowAllObjects
	endscript
	script TimeUpScript
		if IsCareerMode
		endif
	endscript
	script ChapterTitle_and_Restore_Start_Key
		restore_start_key_binding
		if GameModeEquals is_career
			GoalManager_GetCurrentChapterAndStage
			if ((<currentchapter> = 0) && (<currentstage> = 0))
				ShownChapterTitle
			endif
		endif
	endscript
