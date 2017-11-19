
	pro_team_members = [
		{pro = burnquist movie_text = "Burnquis" text = "Burnquist"}
		{pro = hawk movie_text = "Hawk" text = "Hawk"}
		{pro = koston movie_text = "Koston" text = "Koston"}
		{pro = lasek movie_text = "Lasek" text = "Lasek"}
		{pro = margera movie_text = "Margera" text = "Margera"}
		{pro = mullen movie_text = "Mullen" text = "Mullen"}
		{pro = muska movie_text = "Muska" text = "Muska"}
		{pro = reynolds movie_text = "Reynolds" text = "Reynolds"}
		{pro = rodriguez movie_text = "Rodrigue" text = "Rodriguez"}
		{pro = rowley movie_text = "Rowley" text = "Rowley"}
		{pro = saari movie_text = "Saari" text = "Saari"}
		{pro = thomas movie_text = "Thomas" text = "Thomas"}
		{pro = vallely movie_text = "Vallely" text = "Vallely"}
	]
	script goal_team_select_init
		if InNetGame
			return
		endif
		GoalManager_GetGoalParams name = <goal_id>
		if GotParam team_pro
			if (<team_pro> = none)
				RemoveParameter team_pro
			endif
		endif
		if GotParam last_start_was_quick_start
			if (<last_start_was_quick_start> = 1)
				if GotParam team_pro
					return
				endif
			endif
		endif
		GoalManager_GetCurrentChapterAndStage
		if (<currentChapter> > 25)
			return
		endif
		Skater::Hide
		PauseGame
		PauseSkaters
		GoalManager_GetTeam
		if GoalManager_HasWonGoal name = <goal_id>
			if GotParam team_pro
				load_pro_skater name = <team_pro>
				UnPauseGame
				UnpauseSkaters
				return
			endif
		endif
		if ((GotParam horse) || (GotParam tour))
		endif
		GoalManager_PauseGoal name = <goal_id>
		PauseSkaters
		Skater::Hide
		SetScreenElementLock id = root_window off
		if ScreenElementExists id = team_menu
			DestroyScreenElement id = team_menu
		endif
		FormatText ChecksumName = title_icon "%i_options" i = (THEME_PREFIXES[current_theme_prefix])
		make_new_themed_sub_menu title = "SELECT TEAMMATE" title_icon = <title_icon>
		pause_menu_gradient on
		GetArraySize pro_team_members
		<index> = 0
		<num_so_far> = 0
		while
			<pro_name> = ((pro_team_members[<index>]).pro)
			if StructureContains structure = <team> <pro_name>
				if (<team>.<pro_name> = 1)
					<not_focusable> = not_focusable
					<rgba> = [60 60 60 75]
				else
					RemoveParameter not_focusable
					RemoveParameter rgba
				endif
				if (<num_so_far> = 4)
					last_menu_item = last_menu_item
				endif
				theme_menu_add_item {
					text = ((pro_team_members[<index>]).text)
					pad_choose_script = goal_team_select_member_chosen
					pad_choose_params = {pro = <pro_name> goal_id = <goal_id> restart_node = <restart_node>}
					not_focusable = <not_focusable>
					rgba = <rgba>
					last_menu_item = <last_menu_item>
					centered
				}
				<num_so_far> = (<num_so_far> + 1)
			endif
			<index> = (<index> + 1)
		repeat <array_size>
		finish_themed_sub_menu time = 0.2
		create_helper_text generic_helper_text_no_back
		GoalManager_HideGoalPoints
		GoalManager_HidePoints
		root_window::SetTags menu_state = on
		WaitForEvent type = goal_select_team_member_done
		pause_menu_gradient off
	endscript
	script goal_team_select_member_chosen
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		DeBounce X time = 0.5
		if GotParam goal_id
			GoalManager_EditGoal name = <goal_id> params = {team_pro = <pro>}
		endif
		Skater::StatsManager_DeactivateGoals
		load_pro_skater name = <pro>
		UnPauseGame
		ResetSkaters node_name = <restart_node>
		GoalManager_UnPauseGoal name = <goal_id>
		GoalManager_ShowGoalPoints
		GoalManager_ShowPoints
		root_window::SetTags menu_state = off
		restore_start_key_binding
		FireEvent type = goal_select_team_member_done
	endscript
	script goal_team_select_deactivate
		if InNetGame
			return
		endif
		GoalManager_GetGoalParams name = <goal_id>
		if GotParam quick_start
			return
		endif
		Skater::Vibrate off
		load_pro_skater name = custom
		Skater::StatsManager_ActivateGoals
		ResetSkaters node_name = <restart_node>
		MakeSkaterGoto HandBrake
		if NOT GoalManager_HasWonGoal name = <goal_id>
			if NOT GotParam just_won_goal
				GoalManager_EditGoal name = <goal_id> params = {team_pro = none}
			endif
		endif
	endscript
	script goal_team_select_success
		if GotParam goal_id
			GoalManager_GetGoalParams name = <goal_id>
			if GotParam team_pro
				GoalManager_SetTeamMember pro = <team_pro> mark_used
			endif
		endif
	endscript
