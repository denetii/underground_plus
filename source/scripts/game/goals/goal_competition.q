
	Goal_Comp_GenericParams = {
		goal_text = "Competition test..."
		goal_description = "3 Runs\nYou lose points for bailing\nBest two runs wins"
		view_goals_text = "Medal the Competition"
		time = 30
		init = goal_comp_init
		uninit = goal_uninit
		activate = goal_comp_activate
		deactivate = goal_comp_deactivate
		expire = goal_comp_expire
		success = goal_comp_success
		trigger_obj_id = TRG_G_JUDGE_COMP
		geo_prefix = "G_COMP_"
		restart_node = TRG_G_COMP_RestartNode
		start_pad_id = G_COMP_StartPad
		already_ended_run = 0
		competition
		record_type = score
	}
	Goal_Comp2_GenericParams = {
		goal_text = "Competition2 test..."
		goal_description = "3 Runs\nYou lose points for bailing\nBest two runs wins"
		view_goals_text = "Medal the Competition"
		time = 30
		init = goal_comp_init
		uninit = goal_uninit
		activate = goal_comp_activate
		deactivate = goal_comp_deactivate
		expire = goal_comp_expire
		success = goal_comp_success
		trigger_obj_id = TRG_G_JUDGE_COMP2
		geo_prefix = "G_COMP2_"
		restart_node = TRG_G_COMP2_RestartNode
		start_pad_id = G_COMP2_StartPad
		already_ended_run = 0
		competition
		record_type = score
	}
	script goal_comp_init
		goal_init goal_id = <goal_id>
	endscript
	script goal_comp_activate
		GoalManager_EditGoal name = <goal_id> params = {already_ended_run = 0}
		goal_start goal_id = <goal_id>
		GoalManager_PauseCompetition name = <goal_id>
		if NOT CompetitionEnded
			EndCompetition
		endif
		if GotParam leader_board_names
			PermuteArray NewArrayName = leader_board_names Array = <leader_board_names>
		endif
		StartCompetition {
			gold = <gold>
			silver = <silver>
			bronze = <bronze>
			gold_score = <gold_score>
			silver_score = <silver_score>
			bronze_score = <bronze_score>
			bail = <bail>
			extra_params = {
				leader_board_names = <leader_board_names>
				first_place_name = <first_place_name>
			}
		}
		SetScoreAccumulation 1
		StartCompetitionRun
		Skater::RunStarted
		KillSpawnedScript name = KillNixonTimer
		wait 0.1 seconds
		if ObjectExists id = nixon_timer_box
			DestroyScreenElement id = nixon_timer_box
			wait 0.1 seconds
		endif
		CreateScreenElement {
			type = ContainerElement
			id = nixon_timer_box
			parent = root_window
			pos = (311.0,35.0)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = nixon_timer_box
			id = nixon_timer_sprite
			texture = nixon
			scale = (1.70000005,1.70000005)
			just = [center center]
			z_priority = -2000
		}
		DoScreenElementMorph id = nixon_timer_sprite time = 0 scale = (0.0,0.0) alpha = 0
		DoScreenElementMorph id = nixon_timer_sprite time = 0.30000001 scale = (0.72500002,0.72500002) alpha = 1
	endscript
	script goal_comp_expire
		kill_start_key_binding
		GoalManager_GetGoalParams name = <goal_id>
		GoalManager_EditGoal name = <goal_id> params = {already_ended_run = 1}
		pause_trick_text
		GoalManager_PauseCompetition name = <goal_id>
		if NOT RoundIs 3
			GoalManager_SetGoalTimer name = <goal_id>
		endif
		SpawnSkaterScript goal_comp_expire2 params = <...>
	endscript
	script goal_comp_expire2
		root_window::SetTags giving_rewards = 1
		root_window::SetTags showing_comp_results = 1
		if ObjectExists id = goal_comp_out_of_bounds_warning
			DestroyScreenElement id = goal_comp_out_of_bounds_warning
		endif
		wait 1 frame
		PauseSkaters
		if RoundIs 3
			EndCompetitionRun
			WaitForEvent type = comp_continue
			goal_comp_show_results goal_id = <goal_id>
			WaitForEvent type = comp_continue
			GoalManager_UnPauseCompetition name = <goal_id>
			GoalManager_DeactivateGoal name = <goal_id>
		else
			EndCompetitionRun
			ResetScore
			WaitForEvent type = comp_continue
			if ObjectExists id = goal_comp_out_of_bounds_warning
				DestroyScreenElement id = goal_comp_out_of_bounds_warning
			endif
			if ObjectExists id = comp_root_anchor
				DestroyScreenElement id = comp_root_anchor
			endif
			ResetSkaters node_name = <restart_node>
			GoalManager_EditGoal name = <goal_id> params = {already_ended_run = 0}
			SetScoreAccumulation 1
			StartCompetitionRun
			DeBounce X time = 0.30000001 clear = 1
			wait 1 frame
			GoalManager_UnPauseCompetition name = <goal_id>
			RunStarted
		endif
		root_window::SetTags giving_rewards = 0
		root_window::SetTags showing_comp_results = 0
	endscript
	script goal_comp_deactivate
		KillSkaterCamAnim all
		KillSpawnedScript name = goal_comp_expire2
		KillSpawnedScript name = goal_comp_end_current_run
		EndCompetition
		GoalManager_ResetGoalTrigger name = <goal_id>
		goal_deactivate goal_id = <goal_id>
		if ObjectExists id = comp_root_anchor
			DestroyScreenElement id = comp_root_anchor
		endif
		if ObjectExists id = goal_comp_out_of_bounds_warning
			DestroyScreenElement id = goal_comp_out_of_bounds_warning
		endif
		if ObjectExists id = comp_leader_board_anchor
			DestroyScreenElement id = comp_leader_board_anchor
		endif
		if ObjectExists id = comp_scores_anchor
			DestroyScreenElement id = comp_scores_anchor
		endif
		unpause_trick_text
		KillSpawnedScript name = KillNixonTimer
		wait 0.1 seconds
		SpawnScript KillNixonTimer
		ResetSkaters node_name = <restart_node>
		MakeSkaterGoto HandBrake
	endscript
	script KillNixonTimer
		if ObjectExists nixon_timer_box
			DoScreenElementMorph id = nixon_timer_sprite time = 0.30000001 scale = (0.0,0.0) alpha = 0
			RunScriptOnScreenElement id = the_time clock_morph
			wait 0.5 seconds
			DestroyScreenElement id = nixon_timer_box
		endif
		KillSpawnedScript name = KillNixonTimer
	endscript
	script goal_comp_leave_area
		if GoalManager_GoalIsActive name = <goal_id>
			create_panel_message id = goal_comp_out_of_bounds_warning text = "You're out of the competition area!" style = goal_comp_out_of_bounds_text
			ResetScorePot UseBailStyle
			SetScoreAccumulation 0 freeze_score
		endif
	endscript
	script goal_comp_enter_area
		if GoalManager_GoalIsActive name = <goal_id>
			if ObjectExists id = goal_comp_out_of_bounds_warning
				DestroyScreenElement id = goal_comp_out_of_bounds_warning
			endif
			ResetScorePot
			SetScoreAccumulation 1
		endif
	endscript
	script goal_comp_enable_input
		EnablePlayerInput
	endscript
	script goal_comp_continue
		KillSpawnedScript name = goal_comp_show_run_scores
		KillSpawnedScript name = goal_comp_add_leader_board
		SetScreenElementProps {
			id = root_window
			event_handlers = [{pad_start handle_start_pressed}]
			replace_handlers
		}
		if ObjectExists id = comp_root_anchor
			DestroyScreenElement id = comp_root_anchor
		endif
		unpause_trick_text
		UnPauseSkaters
		DeBounce X time = 0.30000001 clear = 1
		FireEvent type = comp_continue
		speech_box_exit
	endscript
	script goal_comp_success
		goal_success goal_id = <goal_id>
	endscript
	script goal_comp_show_run_scores
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = comp_root_anchor
			dims = (640.0,480.0)
			pos = (340.0,250.0)
		}
		PauseSkaters
		SetScreenElementProps {
			id = root_window
			event_handlers = [{pad_start nullscript}]
			replace_handlers
		}
		CreateScreenElement {
			type = ContainerElement
			parent = comp_root_anchor
			id = comp_scores_anchor
			pos = (330.0,250.0)
			dims = (640.0,480.0)
		}
		CreateScreenElement {
			type = HMenu
			parent = comp_scores_anchor
			id = scores_hmenu
			pos = (400.0,117.0)
			just = [right top]
			padding_scale = 1.29999995
			regular_space_amount = 40
		}
		FormatText TextName = score_text "%i" i = (<total_score>)
		CreateScreenElement {
			type = TextElement
			id = goal_comp_average_score
			scale = (1.0)
			parent = comp_scores_anchor
			pos = (460.0,117.0)
			just = [right top]
			font = dialog
			text = <score_text>
			rgba = [0 0 0 0]
			not_focusable
			z_priority = 10
		}
		CreateScreenElement {
			type = TextElement
			parent = comp_scores_anchor
			id = comp_scores_judges
			font = small
			text = "Judges"
			rgba = [128 128 128 108]
			pos = (128.0,98.0)
			just = [left top]
			scale = 0.89999998
		}
		CreateScreenElement {
			type = TextElement
			parent = comp_scores_anchor
			id = comp_scores_judge1
			font = small
			text = "1"
			rgba = [88 105 112 128]
			pos = (215.0,98.0)
			just = [left top]
			scale = 0.89999998
		}
		CreateScreenElement {
			type = TextElement
			parent = comp_scores_anchor
			id = comp_scores_judge2
			font = small
			text = "2"
			rgba = [88 105 112 128]
			pos = (253.0,98.0)
			just = [left top]
			scale = 0.89999998
		}
		CreateScreenElement {
			type = TextElement
			parent = comp_scores_anchor
			id = comp_scores_judge3
			font = small
			text = "3"
			rgba = [88 105 112 128]
			pos = (293.0,98.0)
			just = [left top]
			scale = 0.89999998
		}
		CreateScreenElement {
			type = TextElement
			parent = comp_scores_anchor
			id = comp_scores_judge4
			font = small
			text = "4"
			rgba = [88 105 112 128]
			pos = (333.0,98.0)
			just = [left top]
			scale = 0.89999998
		}
		CreateScreenElement {
			type = TextElement
			parent = comp_scores_anchor
			id = comp_scores_judge5
			font = small
			text = "5"
			rgba = [88 105 112 128]
			pos = (374.0,98.0)
			just = [left top]
			scale = 0.89999998
		}
		CreateScreenElement {
			type = TextElement
			parent = comp_scores_anchor
			id = comp_scores_average
			font = small
			text = "Average"
			rgba = [128 128 128 108]
			pos = (414.0,98.0)
			just = [left top]
			scale = 0.89999998
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_scores_anchor
			texture = comp_tall_line
			pos = (115.0,92.0)
			scale = (1.20000005,0.69999999)
			just = [center top]
			rgba = [128 128 128 110]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_scores_anchor
			texture = comp_tall_line
			pos = (200.0,92.0)
			scale = (1.20000005,0.69999999)
			just = [center top]
			rgba = [128 128 128 110]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_scores_anchor
			texture = comp_tall_line
			pos = (400.0,92.0)
			scale = (1.20000005,0.69999999)
			just = [center top]
			rgba = [128 128 128 110]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_scores_anchor
			texture = comp_tall_line
			pos = (238.0,92.0)
			scale = (1.20000005,0.69999999)
			just = [center top]
			rgba = [128 128 128 110]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_scores_anchor
			texture = comp_tall_line
			pos = (280.0,92.0)
			scale = (1.20000005,0.69999999)
			just = [center top]
			rgba = [128 128 128 110]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_scores_anchor
			texture = comp_tall_line
			pos = (318.0,92.0)
			scale = (1.20000005,0.69999999)
			just = [center top]
			rgba = [128 128 128 110]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_scores_anchor
			texture = comp_tall_line
			pos = (358.0,92.0)
			scale = (1.20000005,0.69999999)
			just = [center top]
			rgba = [128 128 128 110]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_scores_anchor
			texture = comp_fill
			pos = (288.0,91.0)
			scale = (58.5,1.0)
			just = [center top]
			rgba = [80 80 80 110]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_scores_anchor
			texture = comp_end_cap
			pos = (484.0,91.0)
			scale = (1.29999995,0.98000002)
			just = [center top]
			rgba = [80 80 80 110]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_scores_anchor
			texture = options_bg
			pos = (309.0,118.0)
			scale = (1.66999996,0.69999999)
			just = [center top]
			rgba = [15 15 15 80]
		}
		GetArraySize <scores>
		index = 0
		while
			FormatText ChecksumName = score_id "score%i" i = <index>
			goal_comp_add_score_to_hmenu (<scores>[<index>]) id = <score_id>
			index = (<index> + 1)
		repeat <array_size>
		RunScriptOnScreenElement id = comp_scores_anchor goal_comp_animate_scores
		create_speech_box text = "Press \m0 to continue" pos = (320.0,400.0) pad_choose_script = goal_comp_skip_scores pad_choose_params = {scores = <scores>}
		WaitForEvent type = goal_comp_scores_done
		SetScreenElementProps {
			id = goal_comp_average_score
			rgba = [117 14 14 100]
		}
	endscript
	script goal_comp_animate_scores
		DoMorph time = 0 scale = 1.0 alpha = 0 pos = (305.0,0.0)
		wait 1 frame
		DoMorph time = 0.2 scale = 1.0 alpha = 1 pos = (305.0,232.0)
	endscript
	script goal_comp_add_score_to_hmenu
		FormatText TextName = score_text "%i" i = (<score>)
		CreateScreenElement {
			type = TextElement
			parent = scores_hmenu
			font = dialog
			text = <score_text>
			not_focusable
		}
		if NOT GotParam top_judge
			RunScriptOnScreenElement id = <id> goal_comp_fade_lower_score
		endif
	endscript
	script goal_comp_fade_lower_score
		wait 1 second
		DoMorph time = 1.20000005 alpha = 0.30000001
		FireEvent type = goal_comp_scores_done
	endscript
	script goal_comp_skip_scores
		GetArraySize <scores>
		index = 0
		while
			FormatText ChecksumName = score_id "score%i" i = <index>
			if NOT StructureContains structure = (<scores>[<index>]) top_judge
				if ObjectExists id = <score_id>
					DoScreenElementMorph id = <score_id> alpha = 0.30000001
				endif
			endif
			index = (<index> + 1)
		repeat <array_size>
		SetScreenElementProps {
			id = goal_comp_average_score
			rgba = [127 102 0 128]
		}
		if RoundIs 3
		endif
		FireEvent type = goal_comp_scores_done
	endscript
	script goal_comp_end_current_run
		if ObjectExists id = current_menu_anchor
			exit_pause_menu
		endif
		if GoalManager_IsInCompetition
			GoalManager_EditGoal name = <goal_id> params = {already_ended_run = 1}
			GoalManager_PauseCompetition name = <goal_id>
			KillSpawnedScript name = SK3_Killskater_Finish
			GoalManager_GetGoalParams name = <goal_id>
			ResetSkaters node_name = <restart_node>
			goal_comp_expire goal_id = <goal_id>
		else
			printf "WARNING: you're not in a competition!!!"
		endif
	endscript
	script goal_comp_add_leader_board
		WaitForEvent type = goal_comp_scores_done
		SpawnScript TemporarilyDisableInput params = {time = 1500}
		if ObjectExists id = speech_box_anchor
			SetScreenElementProps {
				id = speech_box_anchor
				event_handlers = [{pad_choose goal_comp_continue}]
				replace_handlers
			}
		endif
		wait 20 frame
		if NOT ObjectExists id = comp_root_anchor
			return
		endif
		SetScreenElementProps {
			id = root_window
			event_handlers = [{pad_start goal_comp_continue}]
			replace_handlers
		}
		SetScreenElementLock id = comp_root_anchor off
		CreateScreenElement {
			type = ContainerElement
			parent = comp_root_anchor
			id = comp_leader_board_anchor
			pos = (300.0,232.0)
			dims = (640.0,480.0)
		}
		CreateScreenElement {
			type = VMenu
			parent = comp_leader_board_anchor
			id = comp_leader_board_vmenu
			pos = (208.0,169.0)
			internal_just = [left center]
			just = [center top]
			z_priority = 20
		}
		CreateScreenElement {
			type = TextElement
			parent = comp_leader_board_vmenu
			id = comp_leader_board_vmenu_title
			font = testtitle
			text = "STANDINGS"
			rgba = [128 128 128 75]
			just = [left top]
			scale = 1.37
			not_focusable
		}
		if RoundIs 1
			FormatText TextName = round_info "(AFTER 1 ROUND)"
		else
			if RoundIs 2
				FormatText TextName = round_info "(AFTER 2 ROUNDS)"
			else
				FormatText TextName = round_info "(BEST 2 ROUNDS)"
			endif
		endif
		CreateScreenElement {
			type = TextElement
			parent = comp_leader_board_vmenu_title
			font = dialog
			text = <round_info>
			rgba = [117 14 14 90]
			pos = (264.0,0.0)
			scale = 0.64999998
			just = [right top]
			not_focusable
		}
		if LevelIs load_FL
			CreateScreenElement {
				type = SpriteElement
				parent = comp_leader_board_anchor
				texture = spot_goals
				pos = (100.0,139.0)
				scale = (1.20000005)
				just = [center top]
				SetProps rgba = [128 128 128 110]
				z_priority = 100
			}
		else
			if LevelIs load_SJ
				CreateScreenElement {
					type = SpriteElement
					parent = comp_leader_board_anchor
					texture = scj_goals
					pos = (105.0,128.0)
					scale = (1.29999995)
					just = [center top]
					SetProps rgba = [128 128 128 110]
					z_priority = 100
				}
			else
				if LevelIs load_HI
					FormatText ChecksumName = hi_goals_icon "5050_goals"
					CreateScreenElement {
						type = SpriteElement
						parent = comp_leader_board_anchor
						texture = <hi_goals_icon>
						pos = (106.0,132.0)
						scale = (1.20000005)
						just = [center top]
						SetProps rgba = [128 128 128 110]
						z_priority = 100
					}
				else
					CreateScreenElement {
						type = SpriteElement
						parent = comp_leader_board_anchor
						texture = PA_goals
						pos = (100.0,132.0)
						scale = (1.20000005)
						just = [center top]
						SetProps rgba = [128 128 128 110]
						z_priority = 100
					}
				endif
			endif
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = comp_leader_board_anchor
			texture = options_bg
			pos = (315.0,160.0)
			scale = (1.70000005,1.0)
			just = [center top]
			rgba = [80 80 80 128]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_leader_board_anchor
			texture = comp_hori_lines
			pos = (316.0,186.0)
			scale = (55.5,0.95999998)
			just = [center top]
			rgba = [128 128 128 90]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_leader_board_anchor
			texture = comp_tall_line
			pos = (120.0,165.0)
			scale = (1.20000005,2.25)
			just = [center top]
			rgba = [0 0 0 108]
			z_priority = 30
		}
		CreateScreenElement {
			type = SpriteElement
			parent = comp_leader_board_anchor
			texture = comp_tall_line
			pos = (512.0,165.0)
			scale = (1.20000005,2.25)
			just = [center top]
			rgba = [0 0 0 108]
			z_priority = 30
		}
		ForEachIn <leader_board> do = goal_comp_add_leader_board_entry
		RunScriptOnScreenElement id = comp_leader_board_anchor goal_comp_animate_leaderboard
	endscript
	script goal_comp_animate_leaderboard
		DoMorph time = 0 scale = 0.0 alpha = 0
		wait 20 frame
		PlaySound BailSlap01
		DoMorph time = 0.2 scale = 1.0 alpha = 1
	endscript
	script goal_comp_add_leader_board_entry
		CreateScreenElement {
			type = TextElement
			parent = comp_leader_board_vmenu
			font = small
			text = <name>
			rgba = [128 128 128 128]
			not_focusable
			just = [left top]
		}
		<leader_board_name_id> = <id>
		FormatText TextName = score_text "%i" i = (<score>)
		CreateScreenElement {
			type = TextElement
			parent = <leader_board_name_id>
			font = dialog
			text = <score_text>
			pos = (320.0,0.0)
			just = [right top]
		}
		if GotParam player
			SetScreenElementProps {
				id = <leader_board_name_id>
				rgba = [127 102 0 128]
			}
			SetScreenElementProps {
				id = <id>
				rgba = [127 102 0 128]
			}
		endif
	endscript
	script goal_comp_show_results
		if PlaceIs 1
			create_speech_box text = "You got gold!" no_pad_start pad_choose_script = nullscript style = goal_comp_speech_box_style
			GoalManager_WinGoal name = <goal_id>
		else
			if PlaceIs 2
				create_speech_box text = "You got silver!" no_pad_start pad_choose_script = nullscript style = goal_comp_speech_box_style
				GoalManager_WinGoal name = <goal_id>
			else
				if PlaceIs 3
					create_speech_box text = "You got bronze!" no_pad_start pad_choose_script = nullscript style = goal_comp_speech_box_style
					GoalManager_WinGoal name = <goal_id>
				else
					create_speech_box text = "You didn't get a medal" no_pad_start pad_choose_script = null_script style = goal_comp_speech_box_style
					GoalManager_LoseGoal name = <goal_id>
				endif
			endif
		endif
	endscript
	script goal_comp_out_of_bounds_text
		DoMorph time = 0 pos = (320.0,140.0)
	endscript
	script goal_comp_speech_box_style
		wait 2000
		Die
	endscript
