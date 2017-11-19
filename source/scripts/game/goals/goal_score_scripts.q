
	Goal_GenericScore_genericParams = {
		goal_text = "Get a High Score: 15,000 Points"
		view_goals_text = "High score"
		init = Score_init
		uninit = goal_uninit
		activate = Score_activate
		deactivate = Score_Deactivate
		expire = Score_expire
		fail = Score_fail
		success = Score_success
		trigger_obj_id = TRG_G_GS_Pro
		restart_node = TRG_G_GS_RestartNode
		start_pad_id = G_GS_StartPad
		score = 15000
		time = 120
		already_displayed_win_message = 0
		win_message_text = "High Score: Complete!"
		record_type = time
		score_goal
	}
	Goal_HighScore_genericParams = {
		goal_text = "Get a High Score: 15,000 Points"
		view_goals_text = "High score"
		init = Score_init
		uninit = goal_uninit
		activate = Score_activate
		deactivate = Score_Deactivate
		expire = Score_expire
		fail = Score_fail
		success = Score_success
		trigger_obj_id = TRG_G_HS_Pro
		restart_node = TRG_G_HS_RestartNode
		start_pad_id = G_HS_StartPad
		score = 15000
		time = 120
		already_displayed_win_message = 0
		win_message_text = "High Score: Complete!"
		record_type = time
		score_goal
	}
	Goal_ProScore_GenericParams = {
		goal_text = "Get a Pro Score: 20,000 Points"
		view_goals_text = "Pro score"
		init = Score_init
		uninit = goal_uninit
		activate = Score_activate
		deactivate = Score_Deactivate
		expire = Score_expire
		fail = Score_fail
		success = Score_success
		trigger_obj_id = TRG_G_PS_Pro
		restart_node = TRG_G_PS_RestartNode
		start_pad_id = G_PS_StartPad
		score = 20000
		time = 120
		already_displayed_win_message = 0
		win_message_text = "Pro Score: Complete!"
		record_type = time
		score_goal
	}
	Goal_SickScore_GenericParams = {
		goal_text = "Get a Sick Score: 30,000 Points"
		view_goals_text = "Sick score"
		init = Score_init
		uninit = goal_uninit
		activate = Score_activate
		deactivate = Score_Deactivate
		expire = Score_expire
		fail = Score_fail
		success = Score_success
		trigger_obj_id = TRG_G_SS_Pro
		restart_node = TRG_G_SS_RestartNode
		start_pad_id = G_SS_StartPad
		score = 30000
		time = 120
		already_displayed_win_message = 0
		win_message_text = "Sick Score: Complete!"
		record_type = time
		score_goal
	}
	script Score_init
		goal_init goal_id = <goal_id>
	endscript
	script Score_activate
		goal_start goal_id = <goal_id>
	endscript
	script Score_success
		goal_success goal_id = <goal_id>
		if GotParam winning_score
			FormatText TextName = text "Score: %i" i = <winning_score>
			create_panel_message {
				id = goal_current_reward
				text = <text>
				style = goal_message_got_trickslot
			}
		endif
	endscript
	script Score_Deactivate
		GoalManager_ResetGoalTrigger name = <goal_id>
		goal_deactivate goal_id = <goal_id>
		GoalManager_EditGoal name = <goal_id> params = {already_displayed_win_message = 0}
		SpawnScript goal_score_wait_and_reset_score
	endscript
	script goal_score_wait_and_reset_score
		wait 1 frame
		ResetScore
	endscript
	script Score_expire
		goal_expire goal_id = <goal_id>
		GoalManager_LoseGoal name = <goal_id>
	endscript
	script Score_fail
		goal_fail goal_id = <goal_id>
	endscript
	script goal_score_win_message
		SetProps rgba = [43 95 53 128]
		DoMorph time = 0 pos = (0.0,284.0) scale = 0 alpha = 0
		DoMorph time = 0.2 pos = (321.0,285.0) scale = 1.89999998 alpha = 1
		DoMorph time = 0.2 scale = 0.80000001
		DoMorph time = 0.2 scale = 1.29999995
		DoMorph time = 0.1 scale = 0.89999998
		DoMorph time = 0.1 scale = 1.0
		DoMorph pos = (321.0,285.0) time = 0.1 alpha = 0.60000002
		DoMorph pos = (319.0,283.0) time = 0.1 alpha = 1
		DoMorph pos = (321.0,285.0) time = 0.1 alpha = 0.80000001
		DoMorph pos = (319.0,283.0) time = 0.1 alpha = 1
		DoMorph pos = (321.0,285.0) time = 0.1 alpha = 0.5
		DoMorph pos = (319.0,283.0) time = 0.1 alpha = 1
		DoMorph pos = (321.0,285.0) time = 0.1 alpha = 0.69999999
		DoMorph pos = (319.0,283.0) time = 0.1 alpha = 1
		DoMorph pos = (321.0,285.0) time = 0.1 alpha = 0.89999998
		DoMorph pos = (319.0,283.0) time = 0.1 alpha = 1
		DoMorph pos = (321.0,285.0) time = 0.1 alpha = 0.40000001
		DoMorph pos = (319.0,283.0) time = 0.1 alpha = 1
		DoMorph pos = (321.0,285.0) time = 0.1 alpha = 0.60000002
		DoMorph pos = (319.0,283.0) time = 0.1 alpha = 1
		DoMorph pos = (321.0,285.0) time = 0.1 alpha = 0.80000001
		DoMorph pos = (319.0,283.0) time = 0.1 alpha = 1
		DoMorph pos = (321.0,285.0) time = 0.1 alpha = 0.69999999
		DoMorph pos = (319.0,283.0) time = 0.1 alpha = 1
		DoMorph pos = (305.0,285.0) time = 0.2 alpha = 1
		DoMorph pos = (305.0,285.0) time = 0.40000001 alpha = 1
		DoMorph time = 0.2 alpha = 0 pos = (600.0,284.0) rgb = [50 50 50]
		wait 1500
		Die
	endscript
