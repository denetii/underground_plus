	script set_join_mode
		StopServerList
		SetJoinMode <...>
	endscript
	script chosen_leave_server
		ClearOmnigons
		change check_for_unplugged_controllers = 0
		printf "****************** DEACTIVATING GOALS!!!! ********************"
		GoalManager_DeactivateAllGoals force_all
		GoalManager_UninitializeAllGoals
		GoalManager_RemoveAllGoals
		ParkEditorCommand command = DestroyGeneratedPark instant
		LeaveServer
		SetNetworkMode
	endscript
	script server_setup_complete
		FreeServerList
		SetGameType NetLobby
		SetServerMode
		Request_Level level = use_preferences
		SetGameState On
	endscript
	script stop_server_list
		StopServerList
	endscript
	script start_server_list
		StartServerList
	endscript
	script set_ui_from_preferences
		printf "show detected"
		SetUIFromPreferences <...>
	endscript
	script set_preferences_from_ui
		printf "contents changed detected"
		SetPreferencesFromUI <...>
	endscript
	script join_with_password
		printf "Attempting join with password"
		JoinWithPassword <...>
	endscript
	script choose_level
		printf <...>
		set_preferences_from_ui prefs = network field = "level" level_checksum = <level> <...>
		go_back id = front_net_level_main_menu
	endscript
