
	goal_trickattack_genericParams = {
		goal_text = "You must score the most points to win!"
		time = 10
		net
		init = goal_trickattack_init
		activate = goal_trickattack_activate
		deactivate = goal_trickattack_deactivate
		expire = goal_trickattack_expire
		goal_description = "TrickAttack!"
	}
	script goal_trickattack_init
	endscript
	script goal_trickattack_activate
		ResetComboRecords
		if InTeamGame
			FormatText TextName = msg_text "\c2Trick Attack:\c0\nMost points wins"
		else
			FormatText TextName = msg_text "\c2Trick Attack:\c0\nMost points wins"
		endif
		if InSplitScreenGame
			MakeSkaterGosub add_skater_to_world skater = 0
			MakeSkaterGosub add_skater_to_world skater = 1
			ScriptGetScreenMode
			switch <screen_mode>
				case split_vertical
					msg_pos = (350.0,42.0)
				case split_horizontal
					msg_pos = (620.0,27.0)
			endswitch
		else
			msg_pos = (620.0,27.0)
		endif
		if InNetGame
			create_panel_block id = mp_goal_text text = <msg_text> style = panel_message_goal final_pos = <msg_pos>
		endif
		if GameModeEquals is_singlesession
			skater::RunStarted
			SetScoreAccumulation 1
			SetScoreDegradation 1
		endif
		RunScriptOnScreenElement id = the_time clock_morph
		ResetScore
	endscript
	script goal_trickattack_deactivate
		if ObjectExists id = mp_goal_text
			DestroyScreenElement id = mp_goal_text
		endif
		if GameModeEquals is_singlesession
			SetScoreAccumulation 0
			SetScoreDegradation 0
			if NOT ObjectExists id = dialog_bg_anchor
				if NOT GotParam quick_start
					PauseGame
					root_window::SetTags menu_state = on
					SpawnScript goal_trick_attack_high_score_menu params = {restart_node = <restart_node>}
				else
					ResetSkaters node = <restart_node>
				endif
			else
				ResetSkaters node = <restart_node>
			endif
		endif
	endscript
	script goal_trick_attack_high_score_menu
		Change EndOfReplayShouldJumpToPauseMenu = 1
		kill_start_key_binding
		PauseGame
		pause_trick_text
		if ScreenElementExists id = goal_start_dialog
			DestroyScreenElement id = goal_start_dialog
		endif
		UpdateRecords
		if NewRecord
			high_scores_menu_enter_initials restart_node = <restart_node>
			FireEvent type = focus target = keyboard_vmenu
		else
			high_scores_menu_create restart_node = <restart_node>
		endif
		ResetComboRecords
	endscript
	script goal_trickattack_expire
		if ObjectExists id = mp_goal_text
			DestroyScreenElement id = mp_goal_text
		endif
		if NOT GameModeEquals is_singlesession
			if InSplitScreenGame
				create_rankings
			else
				if OnServer
					SpawnScript wait_then_create_rankings
				else
					create_rankings
				endif
			endif
		endif
	endscript
	script AddGoal_TrickAttack
		GoalManager_AddGoal name = trickattack {
			params = {goal_trickattack_genericParams
			}
		}
	endscript
	script StartGoal_TrickAttack
		if InSplitScreenGame
			SetScreenModeFromGameMode
		endif
		GoalManager_EditGoal name = trickattack params = <...>
		GoalManager_ActivateGoal name = trickattack
	endscript
	script TrickAttack_MenuStartRun
		GoalManager_ActivateGoal name = trickattack
		exit_pause_menu
	endscript
	script end_high_score_run
		Change check_for_unplugged_controllers = 0
		exit_pause_menu
		GoalManager_DeactivateGoal name = trickattack
		Change check_for_unplugged_controllers = 1
	endscript
