
	generic_pro_name = "peds/PedPros/PedPro_Neversoft/PedPro_Neversoft.skin"
	generic_pro_first_name = "Neversoft"
	generic_pro_full_name = "Neversoft Skater"
	goal_want_to_save_volume = 0
	goal_bind_retry_to_select = 0
	max_number_of_special_trickslots = 11
	script goal_init
		GoalManager_GetGoalParams name = <goal_id>
		GoalManager_InitGoalTrigger name = <goal_id>
		if GotParam init_geo_prefix
			create prefix = <init_geo_prefix>
		else
			if GotParam init_geo_prefixes
				GetArraySize <init_geo_prefixes>
				<index> = 0
				while
					create prefix = (<init_geo_prefixes>[<index>])
					<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
		if GotParam init_script
			<init_script> <init_script_params>
		endif
	endscript
	script goal_check_chapter_flags
		GetArraySize CHAPTER_GOALS
		<chapter_goals_size> = <array_size>
		GetArraySize CHAPTER_NUM_GOALS_TO_COMPLETE
		if NOT (<chapter_goals_size> = <array_size>)
			script_assert "chapter_goals and chapter_num_goals_to_complete are not the same size!"
		endif
		<chapter_goals_index> = 0
		while
			<chapter_array> = (CHAPTER_GOALS[<chapter_goals_index>])
			GetArraySize <chapter_array>
			<chapter_array_size> = <array_size>
			<chapter_array_index> = 0
			while
				<stage_array> = (<chapter_array>[<chapter_array_index>])
				GetArraySize <stage_array>
				<stage_array_size> = <array_size>
				<stage_array_index> = 0
				<stage_total> = 0
				<stage_total_target> = ((CHAPTER_NUM_GOALS_TO_COMPLETE[<chapter_goals_index>])[<chapter_array_index>])
				while
					<temp_struct> = (<stage_array>[<stage_array_index>])
					if StructureContains structure = <temp_struct> goal_id
						if GoalManager_GoalExists name = (<temp_struct>.goal_id)
							if GoalManager_HasWonGoal name = (<temp_struct>.goal_id)
								goal_check_chapter_flags_goal_beaten goal_id = (<temp_struct>.goal_id)
								<stage_total> = (<stage_total> + 1)
							endif
						endif
					endif
					<stage_array_index> = (<stage_array_index> + 1)
				repeat <stage_array_size>
				if (<stage_total> > (<stage_total_target> - 1))
					goal_check_chapter_flags_stage_beaten {
						stage_array = <stage_array>
						completion_struct = ((CHAPTER_COMPLETION_SCRIPTS[<chapter_goals_index>])[<chapter_array_index>])
					}
				endif
				<chapter_array_index> = (<chapter_array_index> + 1)
			repeat <chapter_array_size>
			<chapter_goals_index> = (<chapter_goals_index> + 1)
		repeat <chapter_goals_size>
	endscript
	script goal_check_chapter_flags_goal_beaten
		GoalManager_GetGoalParams name = <goal_id>
		if GotParam some_shit
		endif
	endscript
	script goal_check_chapter_flags_stage_beaten
		GetArraySize <stage_array>
		<index> = 0
		while
			<temp_struct> = (<stage_array>[<index>])
			if StructureContains structure = <temp_struct> goal_id
				if GoalManager_GoalExists name = (<temp_struct>.goal_id)
					GoalManager_UninitializeGoal name = (<temp_struct>.goal_id) affect_tree
				endif
			endif
			<index> = (<index> + 1)
		repeat <array_size>
		if GotParam completion_struct
			if StructureContains structure = <completion_struct> script_name
				<script_name> = (<completion_struct>.script_name)
			endif
			if StructureContains structure = <completion_struct> params
				<script_params> = (<completion_struct>.params)
			endif
			<script_name> <script_params>
		endif
	endscript
	cur_tod_cur_action = set_tod_day
	script goal_start
		GetCurrentLevel
		if ChecksumEquals a = <level> b = Load_Sk5Ed
			GoalManager_EditGoal name = <goal_id> params = {testing_goal}
		endif
		ResetScore
		Skater::Vibrate Off
		KillAllTextureSplats
		destroy_goal_panel_messages
		KillSpawnedScript name = goal_wait_and_show_key_combo_text
		KillSpawnedScript name = SK3_Killskater_Finish use_proper_version
		GoalManager_GetGoalParams name = <goal_id>
		if NOT GotParam quick_start
			kill_start_key_binding
		endif
		if NOT IsAlive name = <trigger_obj_id>
			GoalManager_EditGoal name = <goal_id> params = {force_create_trigger = 1}
			GoalManager_InitializeGoal name = <goal_id>
			GoalManager_EditGoal name = <goal_id> params = {force_create_trigger = 0}
			GoalManager_GetGoalParams name = <goal_id>
		endif
		if InNetGame
			GoalManager_AnnounceGoalStarted name = <goal_id>
		endif
		<trigger_obj_id>::Obj_ClearExceptions
		if GotParam custom_score_record
			GoalManager_EditGoal name = <goal_id> params = {custom_score_record = 0}
		endif
		if ObjectExists id = goal_start_dialog
			speech_box_exit anchor_id = goal_start_dialog
		endif
		if ObjectExists id = goal_retry_anchor
			DestroyScreenElement id = goal_retry_anchor
		endif
		FormatText ChecksumName = arrow_id "%s_ped_arrow" s = <goal_name>
		if ScreenElementExists id = <arrow_id>
			DestroyScreenElement id = <arrow_id>
		endif
		KillSpawnedScript name = goal_init_after_end_of_run
		GetSkaterId
		KillSkaterCamAnim skaterId = <ObjId> all
		GoalManager_HideGoalPoints
		GoalManager_GetGoalParams name = <goal_id>
		if GameModeEquals is_career
			goal_get_chapter_stage_from_id id = <goal_id>
			if GotParam stage
				change cur_tod_cur_action = ((STAGE_TOD_SETTINGS[<chapter>])[<stage>])
			endif
		endif
		if GotParam geo_prefix
			goal_create_geo_prefix geo_prefix = <geo_prefix>
		else
			if GotParam geo_prefixes
				GetArraySize <geo_prefixes>
				<index> = 0
				while
					goal_create_geo_prefix geo_prefix = (<geo_prefixes>[<index>])
					<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
		Skater::RunStarted
		if GotParam quick_start
			goal_initialize_skater <...>
			DeBounce x time = 0.30000001
		else
			if GotParam intro_node
				ResetSkaters Node_Name = <intro_node>
			else
				ResetSkaters Node_Name = <restart_node>
			endif
		endif
		if GotParam goal_intro_script
			<goal_intro_script> <goal_intro_script_params>
		endif
		GoalManager_GetGoalParams name = <goal_id>
		if NOT InNetGame
			goal_create_proset_geom <...>
		endif
		if GotParam edited_goal
			if GotParam control_type
				if NOT ((<control_type> = Skate) || (<control_type> = Walk) || (<control_type> = WalkOnly))
					GoalManager_GetLevelPrefix
					FormatText ChecksumName = ReadyLevelScript "%l_KillVehicles" l = <level_prefix>
					if ScriptExists <ReadyLevelScript>
						<ReadyLevelScript>
					endif
				endif
			endif
		endif
		SetScoreAccumulation 1
		SetScoreDegradation 1
		if (Inside_Light_Rain = 1)
			if IsSoundPlaying TestLight01
				SetSoundParams TestLight01 vol = LightRainVolume
			endif
			change Paused_Light_Rain = 0
			change Inside_Light_Rain = 0
		endif
		if (Inside_Heavy_Rain = 1)
			if IsSoundPlaying TestLight02
				SetSoundParams TestLight02 vol = LightRainVolume
			endif
			if IsSoundPlaying TestMedium02
				SetSoundParams TestMedium02 vol = MediumRainVolume
			endif
			change Paused_Heavy_Rain = 0
			change Inside_Heavy_Rain = 0
		endif
		if GotParam trigger_prefix
			create prefix = <trigger_prefix>
		endif
		if GotParam quick_start
			if GotParam hide_goal_pro
				<trigger_obj_id>::Obj_Invisible
			endif
			if GotParam use_hud_counter
				goal_create_counter goal_id = <goal_id> hud_counter_caption = <hud_counter_caption>
			endif
			if NOT GotParam dont_show_goal_text
				create_panel_block id = current_goal text = <goal_text> style = panel_message_goal
				if GotParam key_combo_text
					SpawnScript goal_wait_and_show_key_combo_text params = {text = <key_combo_text>}
				endif
			endif
			if GotParam goal_start_script
				<goal_start_script> <goal_start_script_params>
			endif
			if NOT GoalManager_HasWonGoal name = <goal_id>
				SpawnScript goal_show_tips params = {goal_id = <goal_id>}
			endif
			goal_pro_stop_anim_scripts <...>
			if NOT GotParam trigger_wait_script
				<trigger_wait_script> = GenericProWaiting
			endif
			<trigger_obj_id>::Obj_SpawnScript <trigger_wait_script> params = {type = "midgoal" goal_id = <goal_id> pro = <pro>}
			FireEvent type = goal_cam_anim_post_start_done
		else
			if GameModeEquals is_career
				goal_get_chapter_stage_from_id id = <goal_id>
				if NOT GotParam always_initialize_goal
					if GotParam stage
						GoalManager_GetCurrentChapterAndStage
						tod_cur_action = ((STAGE_TOD_SETTINGS[<currentChapter>])[<currentStage>])
						tod_req_action = ((STAGE_TOD_SETTINGS[<chapter>])[<stage>])
						if NOT (<tod_cur_action> = <tod_req_action>)
							script_change_tod tod_action = <tod_req_action>
							change cur_tod_cur_action = <tod_req_action>
						endif
					else
						GoalManager_GetCurrentChapterAndStage
						tod_cur_action = cur_tod_cur_action
						tod_req_action = ((STAGE_TOD_SETTINGS[<currentChapter>])[<currentStage>])
						if NOT (<tod_cur_action> = <tod_req_action>)
							script_change_tod tod_action = <tod_cur_action>
						endif
					endif
				endif
			endif
			goal_pro_stop_anim_scripts <...>
			if GotParam goal_start_trigger_script
				<trigger_obj_id>::Obj_SpawnScript <goal_start_trigger_script> params = {goal_id = <goal_id> type = "talking" pro = <pro>}
			else
				<trigger_obj_id>::Obj_SpawnScript GenericProTalking params = {goal_id = <goal_id> type = "talking" pro = <pro>}
			endif
			if NOT GotParam trigger_wait_script
				<trigger_wait_script> = GenericProWaiting
			endif
			if GotParam goal_start_movie_script
				<goal_start_movie_script> <goal_start_movie_script_params>
			endif
			if GotParam no_play_hold
				<no_play_hold> = no_play_hold
			endif
			SpawnScript goal_cam_anim_play id = new_goal_cam_anim params = {goal_id = <goal_id>
				next_trigger_script = <trigger_wait_script>
				type = "midgoal"
				<no_play_hold>
				dont_unpause = <dont_unpause>
			}
		endif
		if GotParam kill_radius
			<trigger_obj_id>::Obj_SetOuterRadius <kill_radius>
			<trigger_obj_id>::Obj_SetException ex = SkaterOutOfRadius scr = goal_crossed_kill_radius params = {goal_id = <goal_id>}
		endif
		RunScriptOnScreenElement id = the_time clock_morph
	endscript
	script goal_get_chapter_stage_from_id
		chapter = 0
		GetArraySize CHAPTER_GOALS
		num_chapters = <array_size>
		while
			GetArraySize CHAPTER_GOALS index1 = <chapter>
			num_stages = <array_size>
			stage = 0
			while
				GetArraySize CHAPTER_GOALS index1 = <chapter> index2 = <stage>
				index = 0
				while
					Get3DArrayData ArrayName = CHAPTER_GOALS index1 = <chapter> index2 = <stage> index3 = <index>
					goal_id = (<val>.goal_id)
					if GotParam goal_id
						if (<goal_id> = <id>)
							return stage = <stage> chapter = <chapter>
						endif
					endif
					index = (<index> + 1)
				repeat <array_size>
				stage = (<stage> + 1)
			repeat <num_stages>
			chapter = (<chapter> + 1)
		repeat <num_chapters>
	endscript
	script goal_create_geo_prefix
		create prefix = <geo_prefix>
		FormatText TextName = geo_trigger_prefix "TRG_%p" p = <geo_prefix>
		create prefix = <geo_trigger_prefix>
		GoalManager_GetProsetNotPrefix <geo_prefix>
		kill prefix = <proset_not_prefix>
		FormatText TextName = geo_not_trigger_prefix "TRG_%p" p = <proset_not_prefix>
		kill prefix = <geo_not_trigger_prefix>
	endscript
	script goal_kill_geo_prefix
		kill prefix = <geo_prefix>
		FormatText TextName = geo_trigger_prefix "TRG_%p" p = <geo_prefix>
		kill prefix = <geo_trigger_prefix>
		GoalManager_GetProsetNotPrefix <geo_prefix>
		create prefix = <proset_not_prefix>
		FormatText TextName = geo_not_trigger_prefix "TRG_%p" p = <proset_not_prefix>
		create prefix = <geo_not_trigger_prefix>
	endscript
	script goal_create_proset_geom
		if GotParam proset_prefix
			FormatText ChecksumName = proset_flag "FLAG_%pGEO_ON" p = <proset_prefix>
			SetFlag flag = <proset_flag>
			create prefix = <proset_prefix>
			FormatText TextName = proset_trigger_prefix "TRG_%p" p = <proset_prefix>
			create prefix = <proset_trigger_prefix>
			GoalManager_GetProsetNotPrefix <proset_prefix>
			kill prefix = <proset_not_prefix>
			FormatText TextName = proset_not_trigger_prefix "TRG_%p" p = <proset_not_prefix>
			kill prefix = <proset_not_trigger_prefix>
		endif
	endscript
	script goal_kill_proset_geom
		if GotParam proset_prefix
			FormatText ChecksumName = proset_flag "FLAG_%pGEO_ON" p = <proset_prefix>
			UnSetFlag flag = <proset_flag>
			kill prefix = <proset_prefix>
			FormatText TextName = proset_trigger_prefix "TRG_%p" p = <proset_prefix>
			kill prefix = <proset_trigger_prefix>
			GoalManager_GetProsetNotPrefix <proset_prefix>
			create prefix = <proset_not_prefix>
			FormatText TextName = proset_not_trigger_prefix "TRG_%p" p = <proset_not_prefix>
			create prefix = <proset_not_trigger_prefix>
		endif
	endscript
	script goal_crossed_kill_radius
		create_panel_message id = goal_message text = "You left the goal area!" style = panel_message_generic_loss
		Obj_ClearException SkaterOutOfRadius
		GoalManager_LoseGoal name = <goal_id>
	endscript
	script goal_expire
		destroy_goal_panel_messages
		create_panel_message id = goal_message text = "Out of time!" style = panel_message_generic_loss
		if GoalManager_EndRunCalled name = <goal_id>
			if GoalManager_StartedEndOfRun name = <goal_id>
				SpawnSkaterScript goal_init_after_end_of_run params = {goal_id = <goal_id>}
			else
				GoalManager_ClearEndRun name = <goal_id>
			endif
		endif
	endscript
	script goal_success goal_text = "Default goal success text"
		SwitchToReplayIdleMode
		if NOT InNetGame
			kill_start_key_binding
		endif
		destroy_goal_panel_messages
		goal_destroy_counter
		GoalManager_GetGoalParams name = <goal_id>
		if NOT GotParam testing_goal
			GoalEditor::FlagGoalAsWon goal_id = <goal_id>
		endif
		if GotParam goal_outro_script
			<goal_outro_script> <goal_outro_script_params>
		endif
		if ObjectExists id = goal_message
			RunScriptOnScreenElement id = goal_message kill_panel_message
		endif
		goal_pro_stop_anim_scripts <...>
		if ObjectExists id = <trigger_obj_id>
			if GotParam trigger_success_script
				<trigger_obj_id>::Obj_SpawnScript <trigger_success_script> params = {goal_id = <goal_id> pro = <pro> type = "Success"}
			else
				<trigger_obj_id>::Obj_SpawnScript GenericProSuccess params = {goal_id = <goal_id> pro = <pro> type = "Success"}
			endif
		endif
		if NOT GotParam trigger_wait_script
			<trigger_wait_script> = GenericProWaiting
		endif
		<already_beat_goal> = 0
		if GoalManager_HasWonGoal name = <goal_id>
			<already_beat_goal> = 1
		endif
		if NOT (<already_beat_goal> = 1)
			if GotParam reward_trickslot
				if NOT GotParam already_added_trickslot
					GoalManager_EditGoal name = <goal_id> params = {just_added_trickslot = 1}
					GetSkaterProfileInfoByName name = custom
					if (<max_specials> < max_number_of_special_trickslots)
						AwardSpecialTrickslot
					endif
				endif
			endif
		endif
		SpawnScript goal_success_messages params = <...>
		if NOT InMultiplayerGame
			<played_success_movie> = 0
			if ((GotParam success_cam_anim) || (GotParam success_cam_anims))
				<played_success_movie> = 1
				change check_for_unplugged_controllers = 0
				SpawnScript goal_cam_anim_play params = {goal_id = <goal_id>
					just_won_goal = 1
					gonna_show_message
					already_beat_goal = <already_beat_goal>
				}
			endif
			if (<played_success_movie> = 0)
				SpawnScript goal_success_no_anims params = <...>
			endif
		endif
	endscript
	script goal_success_no_anims
		goal_cam_anim_post_cleanup <...>
		goal_cam_anim_post_success dont_kill_messages <...>
	endscript
	script goal_success_messages
		SpawnScript Goal_Success_Message_Sound
		if GotParam view_goals_text
			create_panel_block id = goal_complete text = <view_goals_text> style = panel_message_goalcomplete
		else
			create_panel_block id = goal_complete text = <goal_text> style = panel_message_goalcomplete
		endif
		create_panel_sprite id = goal_complete_sprite texture = GO_done style = panel_sprite_goalcomplete
		create_panel_message id = goal_complete_line2 text = "Complete!" style = panel_message_goalcompleteline2
		if GotParam reward_trickslot
			if GotParam just_added_trickslot
				if (<just_added_trickslot> = 1)
					GoalManager_EditGoal name = <goal_id> params = {just_added_trickslot = 0}
					goal_got_trickslot
				endif
			endif
		endif
	endscript
	script already_in_goal
		create_panel_message id = goal_message text = "Already in goal run" style = panel_message_goal
	endscript
	script goal_lose_next_frame
		wait 1 frame
		if GoalManager_GoalIsActive name = <goal_id>
			GoalManager_LoseGoal name = <goal_id>
		endif
	endscript
	script goal_fail
		destroy_goal_panel_messages
		PlaySound GoalFail vol = 200
		GoalManager_GetGoalParams name = <goal_id>
		if GotParam goal_fail_script
			<goal_fail_script> <goal_fail_script_params>
		endif
		create_panel_sprite id = goalfail_sprite texture = GO_fail style = panel_sprite_goalfail
		if GotParam view_goals_text
			create_panel_block dims = (640.0,0.0) id = GoalFail text = <view_goals_text> style = panel_message_goalfail
		else
			create_panel_block dims = (640.0,0.0) id = GoalFail text = <goal_text> style = panel_message_goalfail
		endif
		create_panel_message id = goalfailedline2 text = "Failed!" style = panel_message_goalfailline2
		if isxbox
			retry_text = "Press \b8 to retry goal"
		else
			retry_text = "Press START (\b8) to retry goal"
		endif
		create_speech_box {
			anchor_id = goal_retry_anchor
			text = <retry_text>
			style = goal_fail_retry_box_style
			no_pad_start
			no_pad_choose
			z_priority = 10
		}
	endscript
	script goal_fail_retry_box_style
		wait 4000
		Die
	endscript
	script goal_uninit
		GoalManager_GetGoalParams name = <goal_id>
		goal_kill_proset_geom <...>
		if IsAlive name = <trigger_obj_id>
			GoalManager_StopLastStream name = <goal_id>
			GoalManager_UnloadLastFam name = <goal_id>
			kill name = <trigger_obj_id>
		endif
		if GotParam init_geo_prefix
			kill prefix = <init_geo_prefix>
		else
			if GotParam init_geo_prefixes
				GetArraySize <init_geo_prefixes>
				<index> = 0
				while
					kill prefix = (<init_geo_prefixes>[<index>])
					<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
	endscript
	script goal_deactivate
		if GameModeEquals is_goal_attack
			KillSpawnedScript name = goal_cam_anim_play
			KillSpawnedScript name = goal_cam_anim_play_single_element
			KillSpawnedScript name = TemporarilyDisableInput
			KillSkaterCamAnim all
			restore_skater_camera
			speech_box_exit anchor_id = goal_description_anchor no_pad_start
			Skater::NetEnablePlayerInput
			SetButtonEventMappings unblock_menu_input
			restore_start_key_binding
			if NOT GoalManager_CanStartGoal
				MakeSkaterGoto OnGroundAI
			endif
			GoalManager_SetCanStartGoal 1
		endif
		KillAllTextureSplats
		KillSpawnedScript name = goal_show_tips
		KillSpawnedScript name = goal_wait_and_show_key_combo_text
		goal_destroy_counter
		if GoalManager_EndRunCalled name = <goal_id>
			if GoalManager_StartedEndOfRun name = <goal_id>
				SpawnSkaterScript goal_init_after_end_of_run params = {goal_id = <goal_id>}
			else
				GoalManager_ClearEndRun name = <goal_id>
			endif
		endif
		GoalManager_StopLastStream name = <goal_id>
		GoalManager_UnloadLastFam name = <goal_id>
		SetScoreAccumulation 0
		SetScoreDegradation 0
		GoalManager_GetGoalParams name = <goal_id>
		if GotParam quick_start
			GoalManager_EditGoal name = <goal_id> params = {last_start_was_quick_start = 1}
		else
			GoalManager_EditGoal name = <goal_id> params = {last_start_was_quick_start = 0}
		endif
		if GotParam goal_intro_script
			KillSpawnedScript name = goal_intro_script
		endif
		if GotParam goal_deactivate_script
			<goal_deactivate_script> <goal_deactivate_script_params>
		endif
		KillSpawnedScript name = goal_description_and_speech
		KillSpawnedScript name = goal_wait_for_cam_anim
		if ScreenElementExists id = current_goal
			DestroyScreenElement id = current_goal
		endif
		if ScreenElementExists id = current_goal_key_combo_text
			DestroyScreenElement id = current_goal_key_combo_text
		endif
		if ObjectExists id = current_goal_description
			DestroyScreenElement id = current_goal_description
		endif
		if NOT GotParam quick_start
			if GameModeEquals is_career
				goal_get_chapter_stage_from_id id = <goal_id>
				GoalManager_GetCurrentChapterAndStage
				<level> = ((CHAPTER_LEVELS[<currentChapter>]).checksum)
				if LevelIs <level>
					if GotParam stage
						tod_req_action = ((STAGE_TOD_SETTINGS[<currentChapter>])[<currentStage>])
						tod_cur_action = ((STAGE_TOD_SETTINGS[<chapter>])[<stage>])
						if NOT (<tod_cur_action> = <tod_req_action>)
							script_change_tod tod_action = <tod_req_action>
						endif
					else
						tod_req_action = ((STAGE_TOD_SETTINGS[<currentChapter>])[<currentStage>])
						tod_cur_action = cur_tod_cur_action
						if NOT (<tod_cur_action> = <tod_req_action>)
							script_change_tod tod_action = <tod_req_action>
						endif
					endif
				endif
			endif
			if NOT GotParam just_won_goal
				goal_pro_stop_anim_scripts <...>
				if GotParam trigger_wait_script
					<trigger_obj_id>::Obj_SpawnScript <trigger_wait_script> params = {goal_id = <goal_id> pro = <pro>}
				else
					<trigger_obj_id>::Obj_SpawnScript GenericProWaiting params = {goal_id = <goal_id> type = "wait" pro = <pro>}
				endif
			endif
		endif
		if GotParam control_type
			if NOT ((<control_type> = Skate) || (<control_type> = Walk) || (<control_type> = WalkOnly))
				if GotParam exit_node
					ResetSkaters Node_Name = <exit_node>
				else
					ResetSkaters Node_Name = <restart_node>
				endif
				MakeSkaterGoto HandBrake
				if GameIsPaused
					Skater::Pause
				endif
				if GotParam edited_goal
					GoalManager_GetLevelPrefix
					FormatText ChecksumName = ReadyLevelScript "%l_CreateVehicles" l = <level_prefix>
					if ScriptExists <ReadyLevelScript>
						<ReadyLevelScript>
					endif
				endif
			endif
			if (<control_type> = WalkOnly)
				Skater::ReturnBoardToSkater
			endif
		endif
		if GotParam geo_prefix
			goal_kill_geo_prefix geo_prefix = <geo_prefix>
		else
			if GotParam geo_prefixes
				GetArraySize <geo_prefixes>
				<index> = 0
				while
					goal_kill_geo_prefix geo_prefix = (<geo_prefixes>[<index>])
					<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
		if GotParam trigger_prefix
			kill prefix = <trigger_prefix>
		endif
		if NOT GotParam quick_start
			<trigger_obj_id>::Obj_Visible
			GoalManager_ShowGoalPoints
			if NOT IsTrue ALWAYSPLAYMUSIC
				if NOT GoalManager_HasWonGoal name = <goal_id>
					PauseMusic 1
				endif
			endif
		endif
		if NOT GotParam just_won_goal
			if NOT GotParam quick_start
				if NOT GoalManager_HasWonGoal name = <goal_id>
					goal_add_ped_arrow goal_id = <goal_id>
				endif
			endif
		endif
		if GoalManager_HasWonGoal name = <goal_id>
			if NOT GotParam quick_start
				if GotParam just_won_goal
				else
					GoalManager_UninitializeGoal name = <goal_id>
				endif
			endif
		endif
		if GotParam just_won_goal
			GoalManager_GetNumberOfGoalPoints total
			if (<goal_points> = total_num_goals)
				if NOT GetGlobalFlag flag = GOT_ALL_GOALS
					SetGlobalFlag flag = GOT_ALL_GOALS
					unlock_all_cheat_codes
					unlock_all_gameplay_cheat_codes
					SpawnScript GotAllGoalsMessage
				endif
			endif
		endif
	endscript
	script GotAllGoalsMessage
		dialog_box_exit
		PauseGame
		create_dialog_box {title = "CONGRATULATIONS!"
			title_font = testtitle
			text = "Way to go back and clean out the story goals. \n\nYou've unlocked \c3new cheats\c0 to help you take it further. Access them from the Pause menu under Options. Good luck!"
			pos = (320.0,240.0)
			just = [center center]
			text_rgba = [88 105 112 128]
			text_dims = (330.0,0.0)
			line_spacing = 0.85000002
			buttons = [{font = small text = "OK" pad_choose_script = EndGotAllMessgaes}]
			delay_input
			pad_focus_script = text_twitch_effect
			style = special_dialog_style
		}
	endscript
	script EndGotAllMessgaes
		dialog_box_exit
		UnpauseGame
	endscript
	script SetCurrentGoal
		Obj_VarSet var = 0 value = <value>
	endscript
	script goal_retry_select_handler
		if (goal_bind_retry_to_select = 1)
			if GoalManager_CanStartGoal
				RetryCurrentGoal
			endif
		endif
	endscript
	script RetryCurrentGoal
		if GoalManager_CanRetryGoal
			if GoalManager_GetLastGoalId
				if InNetGame
					if GoalManager_HasWonGoal name = <goal_id>
						return
					endif
				endif
				goal_check_for_required_tricks goal_id = <goal_id>
				if (<found_unmapped_trick> = 1)
					return
				endif
			endif
			GoalManager_RestartLastGoal
		else
		endif
	endscript
	script goal_restart_stage
		GoalManager_RestartStage
	endscript
	script end_current_goal_run
		wait 1 gameframe
		if ObjectExists id = goal_message
			RunScriptOnScreenElement id = goal_message kill_panel_message
		endif
		if GoalManager_HasActiveGoals
			GoalManager_DeactivateCurrentGoal
		endif
	endscript
	script ready_skater_for_early_end_current_goal
		if InNetGame
			if GotParam Net
				return
			endif
		endif
		if InSplitScreenGame
			return
		endif
		if IsObserving
			return
		endif
		if NOT ObjectExists id = Skater
			return
		endif
		if Skater::IsInEndOfRun
			ResetSkaters Node_Name = <restart_node>
		endif
	endscript
	goal_cam_anim_offsets = [
		{targetOffset = (0.0,46.79999924,0.0) positionOffset = (9.60000038,10.80000019,75.59999847)}
		{targetOffset = (1.20000005,62.40000153,0.0) positionOffset = (-2.4000001,0.0,26.39999962)}
		{targetOffset = (3.5999999,57.59999847,0.0) positionOffset = (-7.19999981,-31.20000076,70.80000305)}
		{targetOffset = (8.39999962,49.20000076,1.20000005) positionOffset = (-8.39999962,30.0,63.59999847)}
		{targetOffset = (-24.0,58.79999924,13.19999981) positionOffset = (51.59999847,-2.4000001,91.19999695)}
		{targetOffset = (30.0,58.79999924,20.39999962) positionOffset = (-56.40000153,-2.4000001,85.19999695)}
		{targetOffset = (30.0,58.79999924,20.39999962) positionOffset = (-56.40000153,-2.4000001,85.19999695)}
		{targetOffset = (-20.39999962,43.20000076,32.40000153) positionOffset = (100.80000305,6.0,63.59999847)}
		{targetOffset = (30.0,-14.39999962,2.4000001) positionOffset = (-36.0,148.80000305,446.3999939)}
		{targetOffset = (12.0,-25.20000076,-9.60000038) positionOffset = (312.0,159.6000061,366.0)}
		{targetOffset = (7.19999981,4.80000019,21.60000038) positionOffset = (-420.0,128.3999939,129.6000061)}
	]
	script goal_cam_anim_play
		GoalManager_GetGoalParams name = <goal_id>
		goal_cam_anim_pre_cleanup <...>
		if GotParam just_won_goal
			if GotParam success_cam_anim
				<anim> = <success_cam_anim>
			else
				if GotParam success_cam_anims
					<anims> = <success_cam_anims>
				else
					<virtual_cam> = virtual_cam
				endif
			endif
			goal_cam_anim_pre_success <...>
			just_won_goal = just_won_goal
		else
			if GotParam start_cam_anim
				<anim> = <start_cam_anim>
			else
				if GotParam start_cam_anims
					<anims> = <start_cam_anims>
				else
					<virtual_cam> = virtual_cam
				endif
			endif
			goal_cam_anim_pre_start <...>
		endif
		GetSkaterId
		<skaterId> = <ObjId>
		if NOT GotParam no_cam_anim
			if GotParam anims
				GetArraySize <anims>
				<index> = 0
				while
					if (<index> = (<array_size> - 1))
						<last_anim> = 1
					else
						<last_anim> = 0
					endif
					goal_cam_anim_play_single_element {(<anims>[<index>])
						goal_id = <goal_id>
						anim_index = <index>
						last_anim = <last_anim>
						<just_won_goal>
						cam_anim_index = <index>
					}
					<index> = (<index> + 1)
				repeat <array_size>
			else
				goal_cam_anim_play_single_element <...> last_anim = 1 cam_anim_index = 0
			endif
		endif
		goal_cam_anim_post_cleanup <...>
		if GotParam just_won_goal
			goal_cam_anim_post_success <...>
		else
			goal_cam_anim_post_start <...>
		endif
	endscript
	script goal_cam_anim_pre_cleanup
		GoalManager_PauseAllGoals
		GetValueFromVolume cdvol
		if NOT InNetGame
			if (<value> > 0)
				<volume> = <value>
				SetMusicVolume 20
			endif
		endif
		if GotParam edited_goal
			Skater::PausePhysics
		endif
		change check_for_unplugged_controllers = 0
		Skater::StatsManager_DeactivateGoals
		if InNetGame
			Skater::NetDisablePlayerInput
		else
			Skater::DisablePlayerInput
		endif
		GoalManager_SetCanStartGoal 0
		if GotParam trigger_obj_id
			if IsAlive name = <trigger_obj_id>
				TerminateObjectsScripts id = <trigger_obj_id> script_name = GenericPro_LookAtSkater use_proper_version
				<trigger_obj_id>::Obj_StopRotating
				<trigger_obj_id>::Obj_LookAtObject type = Skater AngleThreshold = 15 speed = 500 time = 0
			endif
		endif
		pause_trick_text
		if ScreenElementExists id = the_time
			SetScreenElementProps {
				id = the_time
				hide
			}
		endif
		SetButtonEventMappings block_menu_input
		GetSkaterId
		if InNetGame
			<ObjId>::NetDisablePlayerInput
		else
			<ObjId>::DisablePlayerInput
		endif
		kill_start_key_binding
		SpawnScript TemporarilyDisableInput
		return volume = <volume>
	endscript
	script goal_cam_anim_post_cleanup
		change check_for_unplugged_controllers = 1
		restore_start_key_binding
		if GotParam edited_goal
			Skater::UnPausePhysics
		endif
		if InNetGame
			Skater::NetEnablePlayerInput
		else
			Skater::EnablePlayerInput
		endif
		if NOT GotParam dont_unpause
			GoalManager_UnPauseAllGoals
		endif
		GoalManager_SetCanStartGoal
		Skater::StatsManager_ActivateGoals
		PauseMusic 0
		if GotParam volume
			SetMusicVolume (<volume> * 10)
		endif
		if ObjectExists id = speech_box_anchor
			DestroyScreenElement id = speech_box_anchor
		endif
		if NOT Skater::Driving
			UnPauseSkaters
		endif
		unpause_trick_text
		if ScreenElementExists id = the_time
			SetScreenElementProps {
				id = the_time
				unhide
			}
		endif
		if GotParam trigger_obj_id
			if IsAlive name = <trigger_obj_id>
				GoalManager_StopLastStream name = <goal_id>
				GoalManager_UnloadLastFam name = <goal_id>
			endif
		endif
		if GotParam next_trigger_script
			goal_pro_stop_anim_scripts <...>
			if ObjectExists id = <trigger_obj_id>
				<trigger_obj_id>::Obj_SpawnScript <next_trigger_script> params = {type = <type> goal_id = <goal_id> pro = <pro>}
			endif
		endif
		restore_start_key_binding
		FireEvent type = goal_cam_anim_done
		if GotParam show_movie
			if (<show_movie> = 1)
				if GotParam movie_file
					ingame_play_movie <movie_file>
				endif
			endif
		endif
	endscript
	script goal_cam_anim_pre_success
		if NOT InMultiplayerGame
			SetButtonEventMappings block_menu_input
			GetSkaterId
			<ObjId>::DisablePlayerInput
			SetScreenElementProps {
				id = root_window
				event_handlers = [{pad_start nullscript}]
				replace_handlers
			}
			SpawnScript TemporarilyDisableInput
			PauseSkaters
		endif
		Skater::Obj_SetFlag FLAG_SKATER_INGOALINIT
		if GotParam success_node
			ResetSkaters Node_Name = <success_node>
		endif
		PauseSkaters
		if NOT GotParam dont_hide_skater
			Skater::RemoveSkaterFromWorld
		endif
		if GotParam success_movie_wait_frames
			wait <success_movie_wait_frames> gameframe
		endif
		root_window::SetTags giving_rewards = 1
	endscript
	script goal_cam_anim_mid_success
		GoalManager_GetGoalParams name = <goal_id>
		create_speech_box {
			text = "Press \m0 to continue"
			pad_choose_script = goal_description_and_speech_continue
			pad_choose_params = {no_pad_start anim = <anim>}
		}
	endscript
	script goal_cam_anim_post_success
		Skater::Obj_ClearFlag FLAG_SKATER_INGOALINIT
		if NOT GotParam dont_hide_skater
			Skater::AddSkaterToWorld
		endif
		KillSpawnedScript name = TemporarilyDisableInput
		SetButtonEventMappings unblock_menu_input
		<ObjId>::EnablePlayerInput
		root_window::SetTags giving_rewards = 0
		if NOT GotParam dont_kill_messages
			KillSpawnedScript name = goal_success_messages
			if ScreenElementExists id = goal_complete_sprite
				DestroyScreenElement id = goal_complete_sprite
			endif
			if ScreenElementExists id = goal_complete
				DestroyScreenElement id = goal_complete
			endif
			if ScreenElementExists id = goal_complete_line2
				DestroyScreenElement id = goal_complete_line2
			endif
			if ScreenElementExists id = goal_new_record
				DestroyScreenElement id = goal_new_record
			endif
			if ScreenElementExists id = goal_current_reward
				DestroyScreenElement id = goal_current_reward
			endif
		endif
		goal_uninit goal_id = <goal_id>
		if GotParam goal_success_script
			<goal_success_script> <goal_success_params>
		endif
		GoalManager_GetNumberOfGoalPoints total
		if (<goal_points> = 129)
			if NOT GetGlobalFlag flag = GOT_ALL_GOALS
			endif
		endif
		GoalManager_GetCurrentChapterAndStage
		if GoalManager_AdvanceStage
			kill_start_key_binding
			if ControllerBoundToSkater controller = 0 Skater = 0
				VibrateController port = 0 actuator = 0 percent = 0
				VibrateController port = 0 actuator = 1 percent = 0
			endif
			if ControllerBoundToSkater controller = 1 Skater = 0
				VibrateController port = 1 actuator = 0 percent = 0
				VibrateController port = 1 actuator = 1 percent = 0
			endif
			if ((isxbox) || (IsNGC))
				if ControllerBoundToSkater controller = 2 Skater = 0
					VibrateController port = 2 actuator = 0 percent = 0
					VibrateController port = 2 actuator = 1 percent = 0
				endif
				if ControllerBoundToSkater controller = 3 Skater = 0
					VibrateController port = 3 actuator = 0 percent = 0
					VibrateController port = 3 actuator = 1 percent = 0
				endif
			endif
			<stage_struct> = ((CHAPTER_COMPLETION_SCRIPTS[<currentChapter>])[<currentStage>])
			if StructureContains structure = <stage_struct> script_name
				<stage_script> = (<stage_struct>.script_name)
			endif
			if StructureContains structure = <stage_struct> params
				<stage_script_params> = (<stage_struct>.params)
			endif
			SpawnScript <stage_script> params = {<stage_script_params> just_won_goal}
			GetArraySize CHAPTER_NUM_GOALS_TO_COMPLETE index1 = <currentChapter>
			if (<currentStage> = (<array_size> -1))
				goal_mark_chapter_complete currentChapter = <currentChapter>
			endif
		else
			goal_get_chapter_stage_from_id id = <goal_id>
			if ((GotParam chapter) && (GotParam stage))
				if ((<chapter> = 25) && (<stage> = 0))
					GoalManager_GetCurrentChapterAndStage
					if ((<currentChapter> = 25) && (<currentStage> = 0))
						DisplayLoadingScreen blank
						kill_start_key_binding
						select_sponsor_post_movies_cleanup
						if ScreenElementExists id = current_menu_anchor
							DestroyScreenElement id = current_menu_anchor
						endif
						restore_skater_camera
						launch_chapter_menu
						HideLoadingScreen
					endif
				endif
			endif
		endif
		if GotParam create_a_trick
			goal_cat_create_menu goal_id = <goal_id>
		endif
	endscript
	script goal_mark_chapter_complete
		<status_array> = CHAPTER_STATUS
		SetArrayElement ArrayName = status_array index = <currentChapter> NewValue = 2
		GetArraySize <status_array>
		if (<currentChapter> < (<array_size> - 1))
			SetArrayElement ArrayName = status_array index = (<currentChapter> + 1) NewValue = 1
		endif
	endscript
	script goal_stage_script_done
		restore_start_key_binding
	endscript
	script show_all_goals_done_dlg
		wait 2 seconds
		PauseGame
		SetGlobalFlag flag = GOT_ALL_GOALS
		goal_got_all_goals
		WaitForEvent type = goal_got_all_goals_done
		UnpauseGame
		KillSpawnedScript name = show_all_goals_done_dlg
	endscript
	script goal_cam_anim_pre_start
		MakeSkaterGoto Skater_GoalInit
		KillSpawnedScript name = goal_description_and_speech
		KillSpawnedScript name = goal_description_and_speech2
	endscript
	script goal_cam_anim_post_start
		if NOT GoalManager_GoalIsActive name = <goal_id>
			FireEvent type = goal_cam_anim_post_start_done
			return
		endif
		if GotParam use_hud_counter
			goal_create_counter goal_id = <goal_id> hud_counter_caption = <hud_counter_caption>
		endif
		goal_initialize_skater <...>
		if GotParam goal_start_script
			<goal_start_script> <goal_start_script_params>
		endif
		if GotParam hide_goal_pro
			<trigger_obj_id>::Obj_Invisible
		endif
		DeBounce x time = 0.30000001
		FireEvent type = goal_cam_anim_post_start_done
	endscript
	script hide_loading_screen
		HideLoadingScreen
	endscript
	script goal_cam_anim_play_single_element
		GoalManager_GetGoalParams name = <goal_id>
		GetSkaterId
		<skaterId> = <ObjId>
		if GotParam pre_anim_script
			<pre_anim_script> <pre_anim_script_params>
		endif
		if GotParam skater_node
			ResetSkaters Node_Name = <skater_node>
		endif
		if GotParam walk_into_frame
			if NOT GotParam walk_into_frame_distance
				<walk_into_frame_distance> = 120
			endif
			MakeSkaterGoto Skater_GoalInit params = {Walk walk_distance = <walk_into_frame_distance>}
		endif
		if GotParam ped_node
			if GotParam trigger_obj_id
				<trigger_obj_id>::Obj_MoveToNode name = <ped_node> orient
			endif
		endif
		if GotParam trigger_obj_id
			if IsAlive name = <trigger_obj_id>
				<trigger_obj_id>::Obj_StopRotating
				<trigger_obj_id>::Obj_LookAtObject type = Skater AngleThreshold = 15 speed = 50600 time = 0
			endif
		endif
		if GotParam ped_script
			if GotParam trigger_obj_id
				goal_pro_stop_anim_scripts <...>
				<trigger_obj_id>::Obj_SpawnScript <ped_script> params = {goal_id = <goal_id>}
			endif
		endif
		if NOT GotParam no_play_hold
			<play_hold> = play_hold
		endif
		if NOT GotParam skippable
			<skippable> = 1
		endif
		if (<last_anim> = 1)
			if NOT GotParam just_won_goal
				<skippable> = 0
			endif
			<play_hold> = play_hold
		endif
		if GotParam virtual_cam
			<anim> = <goal_id>
			<virtual_cam> = virtual_cam
			if NOT GotParam targetId
				<trigger_obj_id>::Obj_GetID
				<targetId> = <ObjId>
			endif
			if NOT ((GotParam targetOffset) && (GotParam positionOffset))
				GetRandomArrayElement goal_cam_anim_offsets
				<targetOffset> = (<element>.targetOffset)
				<positionOffset> = (<element>.positionOffset)
			endif
			if NOT GotParam frames
				<frames> = 120
			endif
		else
			if NOT GotParam anim
				printstruct <...>
				script_assert "No anim specified and no virtual_cam flag present"
			endif
		endif
		DisplayLoadingScreen freeze
		PlaySkaterCamAnim {name = <anim>
			skaterId = <skaterId>
			targetId = <targetId>
			targetOffset = <targetOffset>
			positionOffset = <positionOffset>
			frames = <frames>
			<play_hold>
			skippable = <skippable>
			<virtual_cam>
		}
		DeBounce x time = 0.30000001
		if GotParam null_goal
			if (<last_anim> = 1)
				<cam_anim_index> = -2
			endif
			<last_anim> = 0
			<skippable> = 1
		endif
		if ((GotParam edited_goal) && (GotParam just_won_goal))
			<last_anim> = 0
			<skippable> = 1
		endif
		<should_use_cam_anim_text> = 1
		if (<last_anim> = 1)
			if NOT GotParam just_won_goal
				<should_use_cam_anim_text> = 0
			endif
		endif
		if (<should_use_cam_anim_text> = 0)
			SpawnScript goal_description_and_speech params = <...>
		else
			if GotParam cam_anim_text
				if ((GotParam trigger_obj_id) || (GotParam speaker_obj_id))
					if GotParam just_won_goal
						GoalManager_PlayGoalWinStream {
							name = <goal_id>
							speaker_obj_id = <speaker_obj_id>
							speaker_name = <speaker_name>
							cam_anim_index = (<cam_anim_index> + 1)
						}
					else
						GoalManager_PlayGoalStartStream {
							name = <goal_id>
							speaker_obj_id = <speaker_obj_id>
							speaker_name = <speaker_name>
							cam_anim_index = (<cam_anim_index> + 1)
						}
					endif
				endif
			endif
			if GotParam cam_anim_text
				<display_cam_anim_text> = ""
				if GotParam cam_anim_speaker_name
					FormatText TextName = display_cam_anim_text "\ca%s :\c0\n" s = <cam_anim_speaker_name>
				else
					if GotParam full_name
						FormatText TextName = display_cam_anim_text "\ca%s :\c0\n" s = <full_name>
					else
						if GotParam pro
							FormatText ChecksumName = pro_checksum "%s" s = <pro>
							if StructureContains structure = goal_pro_last_names <pro_checksum>
								<pro_last_name> = (goal_pro_last_names.<pro_checksum>)
								FormatText TextName = pro_name_text "\ca%s %l :\c0\n" s = <pro> l = <pro_last_name>
							endif
						endif
					endif
				endif
				if IsArray <cam_anim_text>
					GetArraySize <cam_anim_text>
					<index> = 0
					while
						FormatText TextName = display_cam_anim_text "%s%n" s = <display_cam_anim_text> n = (<cam_anim_text>[<index>])
						<index> = (<index> + 1)
					repeat <array_size>
				else
					FormatText TextName = display_cam_anim_text "%s%n" s = <display_cam_anim_text> n = <cam_anim_text>
				endif
				if NOT (<skippable> = 0)
					SetSkaterCamAnimSkippable skaterId = <skaterId> name = <anim> skippable = 0
					FormatText TextName = display_cam_anim_text "%s\nPress \m0 to continue." s = <display_cam_anim_text>
					<pad_choose_script> = goal_description_and_speech_continue
					<pad_choose_params> = {no_pad_start anim = <anim> skippable = <skippable>}
				endif
				if ScreenElementExists id = speech_box_anchor
					DestroyScreenElement id = speech_box_anchor
				endif
				kill_start_key_binding
				create_speech_box {
					anchor_id = goal_description_anchor
					text = <display_cam_anim_text>
					pos = <text_anchor_pos>
					style = speech_box_style
					bg_x_scale = 1.29999995
					pad_choose_script = <pad_choose_script>
					pad_choose_params = <pad_choose_params>
				}
			else
				<pad_choose_script> = goal_description_and_speech_continue
				<pad_choose_params> = {no_pad_start anim = <anim> skippable = <skippable>}
				create_speech_box {
					anchor_id = goal_description_anchor
					text = "Press \m0 to continue."
					pos = <text_anchor_pos>
					style = speech_box_style
					bg_x_scale = 1.29999995
					pad_choose_script = <pad_choose_script>
					pad_choose_params = <pad_choose_params>
				}
			endif
		endif
		while
			if SkaterCamAnimFinished skaterId = <skaterId> name = <anim>
				if ScreenElementExists id = goal_description_anchor
					DestroyScreenElement id = goal_description_anchor
				endif
				GoalManager_StopLastStream name = <goal_id>
				GoalManager_UnloadLastFam name = <goal_id>
				DeBounce x time = 0.30000001
				break
			endif
			wait 1 gameframe
		repeat
		if GotParam post_anim_script
			<post_anim_script> goal_id = <goal_id> <post_anim_script_params>
		endif
		DisplayLoadingScreen freeze
		wait 1 gameframe
		HideLoadingScreen
	endscript
	script goal_initialize_skater
		if NOT GotParam control_type
			NonVehicleControlType = 1
		else
			if ((<control_type> = Skate) || (<control_type> = Walk) || (<control_type> = WalkOnly))
				NonVehicleControlType = 1
			endif
		endif
		if GotParam NonVehicleControlType
			switch <control_type>
				case WalkOnly
					Skater::TakeBoardFromSkater
					ResetSkaters Node_Name = <restart_node> RestartWalking
				case Walk
					ResetSkaters Node_Name = <restart_node> RestartWalking
				case Skate
					ResetSkaters Node_Name = <restart_node>
					if GotParam start_skater_standing
						MakeSkaterGoto HandBrake
					endif
				default
					ResetSkaters Node_Name = <restart_node>
					if GotParam start_skater_standing
						MakeSkaterGoto HandBrake
					endif
			endswitch
		else
			GetVehicleSetup control_type = <control_type>
			if NOT GotParam Exitable
				if GotParam edited_goal
					MakeSkaterGoto Switch_OnGroundAI params = {NewScript = TransAm VehicleSetup = <VehicleSetup> edited_goal}
				else
					MakeSkaterGoto Switch_OnGroundAI params = {NewScript = TransAm VehicleSetup = <VehicleSetup>}
				endif
			else
				if GotParam edited_goal
					MakeSkaterGoto Switch_OnGroundAI params = {NewScript = TransAm VehicleSetup = <VehicleSetup> Exitable edited_goal}
				else
					MakeSkaterGoto Switch_OnGroundAI params = {NewScript = TransAm VehicleSetup = <VehicleSetup> Exitable}
				endif
			endif
			PlayerVehicle::Vehicle_MoveToRestart <restart_node>
			PlayerVehicleCamera::VehicleCamera_Reset
			SetActiveCamera id = PlayerVehicleCamera
			if GotParam edited_goal
				PlayerVehicle::Vehicle_Wake
			endif
			if GotParam goal_id
				GoalManager_SetEndRunType name = <goal_id> None
			endif
		endif
	endscript
	script PauseThenStartRecording
	endscript
	script TemporarilyDisableInput time = 1500
		SetButtonEventMappings block_menu_input
		wait <time>
		SetButtonEventMappings unblock_menu_input
	endscript
	script goal_wait_and_show_key_combo_text
		WaitForEvent type = panel_message_goal_done2
		SetScreenElementLock id = current_goal on
		SetScreenElementLock id = current_goal Off
		SetScreenElementLock id = root_window Off
		GetScreenElementPosition id = current_goal
		<ScreenElementPos> = (<ScreenElementPos> + (120.0,0.0))
		GetScreenElementDims id = current_goal
		if ScreenElementExists id = current_goal_key_combo_text
			DestroyScreenElement id = current_goal_key_combo_text
		endif
		CreateScreenElement {
			type = TextBlockElement
			parent = root_window
			id = current_goal_key_combo_text
			dims = (300.0,0.0)
			allow_expansion
			z_priority = -5
			font = small
			scale = 1
			rgba = [128 128 128 110]
			text = <text>
			pos = (<ScreenElementPos> + ((0.0,1.0) * <height> / 0.77999997))
			just = [center top]
			internal_just = [center top]
			scale = 0.75
		}
	endscript
	script hide_key_combo_text
		if ObjectExists id = current_goal_key_combo_text
			DoScreenElementMorph id = current_goal_key_combo_text time = 0 scale = 0
		endif
	endscript
	script unhide_key_combo_text
		if ObjectExists id = current_goal_key_combo_text
			DoScreenElementMorph id = current_goal_key_combo_text time = 0 scale = 0.75
		endif
	endscript
	script goal_description_and_speech
		GoalManager_GetGoalParams name = <goal_id>
		if ScreenElementExists id = current_goal
			DestroyScreenElement id = current_goal
		endif
		if ScreenElementExists id = current_goal_key_combo_text
			DestroyScreenElement id = current_goal_key_combo_text
		endif
		if NOT GotParam null_goal
			SpawnScript goal_wait_for_cam_anim params = <...>
		endif
		<pro_name_text> = ""
		if GotParam cam_anim_speaker_name
			FormatText TextName = pro_name_text "\ca%s :\c0\n" s = <cam_anim_speaker_name>
		else
			if GotParam full_name
				FormatText TextName = pro_name_text "\ca%s :\c0\n" s = <full_name>
			else
				if GotParam pro
					FormatText ChecksumName = pro_checksum "%s" s = <pro>
					if StructureContains structure = goal_pro_last_names <pro_checksum>
						<pro_last_name> = (goal_pro_last_names.<pro_checksum>)
						FormatText TextName = pro_name_text "\ca%s %l :\c0\n" s = <pro> l = <pro_last_name>
					endif
				endif
			endif
		endif
		if GotParam goal_description
			if IsArray <goal_description>
				GetArraySize <goal_description>
				<index> = 0
				while
					FormatText TextName = pro_name_text "%s%n" s = <pro_name_text> n = (<goal_description>[<index>])
					<index> = (<index> + 1)
				repeat <array_size>
			else
				FormatText TextName = pro_name_text "%s%n" s = <pro_name_text> n = <goal_description>
			endif
			FormatText TextName = pro_name_text "%s\nPress \m0 to continue." s = <pro_name_text>
		endif
		if NOT GotParam just_won_goal
			if GotParam goal_description
				GetSkaterId
				if NOT SkaterCamAnimFinished skaterId = <ObjId> name = <anim>
					if ObjectExists id = speech_box_anchor
						DestroyScreenElement id = speech_box_anchor
					endif
					create_speech_box {
						anchor_id = goal_description_anchor
						text = <pro_name_text>
						pos = <text_anchor_pos>
						style = speech_box_style
						bg_x_scale = 1.29999995
						pad_choose_script = goal_description_and_speech_continue
						pad_choose_params = {no_pad_start anim = <anim> skippable = 0}
					}
					goal_description_anchor::SetTags anim = <anim>
					AssignAlias id = goal_description_anchor alias = current_goal_description
					wait 60 frame
					if NOT SkaterCamAnimFinished skaterId = <ObjId> name = <anim>
						GoalManager_PlayGoalStartStream {
							name = <goal_id>
							speaker_obj_id = <speaker_obj_id>
							speaker_name = <speaker_name>
							last_anim
						}
					endif
				endif
			endif
		endif
	endscript
	script goal_description_and_speech_continue
		DeBounce x time = 0.30000001
		<should_kill_anim> = 1
		if ((GotParam anim) && (<should_kill_anim> = 1))
			GetSkaterId
			KillSkaterCamAnim skaterId = <ObjId> name = <anim>
		endif
		if GotParam no_pad_start
			speech_box_exit anchor_id = goal_description_anchor no_pad_start
		else
			speech_box_exit anchor_id = goal_description_anchor
		endif
		FireEvent type = goal_description_and_speech_continue
	endscript
	script goal_wait_for_cam_anim
		GetSkaterId
		while
			if SkaterCamAnimFinished skaterId = <ObjId> name = <anim>
				SpawnScript goal_show_tips params = {goal_id = <goal_id>}
				if NOT GotParam dont_show_goal_text
					create_panel_block id = current_goal text = <goal_text> style = panel_message_goal params = <...>
					if GotParam key_combo_text
						SpawnScript goal_wait_and_show_key_combo_text params = {text = <key_combo_text>}
					endif
				endif
				break
			endif
			wait 10 one_per_frame
		repeat
	endscript
	script goal_description_and_speech2 blink_time = 0.05
		SetProps just = [center top] internal_just = [center center] rgba = [128 128 128 128]
		DoMorph pos = (320.0,114.0) scale = 0
		DoMorph pos = (320.0,114.0) scale = 1.20000005 time = 0.1
		DoMorph pos = (320.0,114.0) scale = 0.80000001 time = 0.1
		DoMorph pos = (320.0,114.0) scale = 1 time = 0.1
		DoMorph pos = (320.0,114.0) scale = 0.89999998 time = 0.05
		DoMorph pos = (321.0,116.0) time = 0.1
		DoMorph pos = (319.0,113.0) time = 0.1
		DoMorph pos = (321.0,115.0) time = 0.1
		DoMorph pos = (318.0,113.0) time = 0.1
		DoMorph pos = (321.0,115.0) time = 0.1
		DoMorph pos = (319.0,113.0) time = 0.1
		DoMorph pos = (321.0,117.0) time = 0.1
		DoMorph pos = (319.0,113.0) time = 0.1
		DoMorph pos = (320.0,120.0) scale = 1.25 time = 0.1
		SetProps internal_just = [center top] rgba = [128 128 128 110] just = [right top]
		DoMorph pos = (625.0,15.0) scale = 0.77999997 time = 0.05
		RunScriptOnScreenElement id = current_goal blink_current_goal params = {blink_time = <blink_time>}
	endscript
	script blink_current_goal
		while
			DoMorph alpha = 0
			wait <blink_time> seconds
			DoMorph alpha = 1
			wait <blink_time> seconds
		repeat 6
	endscript
	script GoalManager_InitGoalTrigger
		GoalManager_GetGoalParams name = <name>
		if NOT IsAlive name = <trigger_obj_id>
			create name = <trigger_obj_id>
		endif
		<trigger_obj_id>::SetTags goal_id = <goal_id>
		if NOT GotParam quick_start
			goal_add_ped_arrow goal_id = <goal_id>
		endif
		goal_pro_stop_anim_scripts <...>
		if GotParam trigger_wait_script
			<trigger_obj_id>::Obj_SpawnScript <trigger_wait_script> params = {goal_id = <goal_id> pro = <pro>}
		else
			<trigger_obj_id>::Obj_SpawnScript GenericProWaiting params = {goal_id = <goal_id> type = "wait" pro = <pro>}
		endif
		RunScriptOnObject id = <trigger_obj_id> goal_set_trigger_exceptions params = {goal_id = <goal_id>}
	endscript
	script goal_add_ped_arrow
		GoalManager_GetGoalParams name = <goal_id>
		if NOT IsAlive name = <trigger_obj_id>
			return
		endif
		if NOT GotParam goal_ped_arrow_height
			<goal_ped_arrow_height> = 100
		endif
		<goal_arrow_pos> = ((0.0,1.0,0.0) * <goal_ped_arrow_height>)
		if GotParam trigger_arrow_model
			<arrow> = <trigger_arrow_model>
		else
			if GotParam always_initialize_goal
				<arrow> = "Special_Arrow"
			else
				<arrow> = "arrow"
			endif
		endif
		FormatText ChecksumName = arrow_id "%s_ped_arrow" s = <goal_name>
		if ScreenElementExists id = <arrow_id>
			DestroyScreenElement id = <arrow_id>
		endif
		SetScreenElementLock id = root_window Off
		if NOT IsTrue no_arrows
			CreateScreenElement {
				parent = root_window
				type = Element3D
				id = <arrow_id>
				model = <arrow>
				HoverParams = {Amp = 9.5 Freq = 2.5}
				AngVelY = 0.16
				ParentParams = {name = <trigger_obj_id> <goal_arrow_pos> IgnoreParentsYRotation}
			}
		endif
	endscript
	script goal_ped_kill_arrow
		GoalManager_GetGoalParams name = <goal_id>
		FormatText ChecksumName = arrow_id "%s_ped_arrow" s = <goal_name>
		if ScreenElementExists id = <arrow_id>
			DestroyScreenElement id = <arrow_id>
		endif
	endscript
	script goal_set_trigger_exceptions trigger_radius = 16 avoid_radius = 3
		if ObjectExists id = goal_start_dialog
			speech_box_exit anchor_id = goal_start_dialog
		endif
		Obj_ClearException SkaterOutOfRadius
		Obj_SetInnerRadius <trigger_radius>
		Obj_SetException ex = SkaterInRadius scr = goal_got_trigger params = {goal_id = <goal_id>}
		GoalManager_GetGoalParams name = <goal_id>
		if NOT GotParam dont_bounce_skater
			Obj_SetInnerAvoidRadius <avoid_radius>
			Obj_SetException ex = SkaterInAvoidRadius scr = goal_pro_bounce_skater params = {avoid_radius = <avoid_radius> goal_id = <goal_id>}
		endif
	endscript
	script goal_pro_bounce_skater speed = 88
		GetSkaterId
		<skaterId> = <ObjId>
		if NOT <skaterId>::IsLocalSkater
			return
		endif
		if <skaterId>::Driving
			return
		endif
		GetSkaterState
		Obj_ClearException SkaterInAvoidRadius
		GetTags
		SpawnScript goal_pro_wait_and_reset_avoid_exception params = {goal_id = <goal_id> trigger_obj_id = <id>}
		<should_bounce_skater> = 1
		if SkaterCurrentScorePotGreaterThan 0
			return
		endif
		if NOT (<state> = Skater_OnGround)
			return
		endif
		if IsHidden
			return
		endif
		root_window::GetTags
		if GotParam giving_rewards
			if (<giving_rewards> = 1)
				return
			endif
		endif
		if Skater::SpeedGreaterThan 200
			if GotParam goal_id
				GoalManager_PlayGoalStream name = <goal_id> type = "avoid" play_random
			endif
			return
		endif
		Skater::GetTags
		if NOT (<racemode> = None)
			return
		endif
		GetTags
		Skater::Obj_GetOrientationToObject <id>
		if (<dotProd> < 0.0)
			if (<dotProd> > -0.1)
				<speed> = 500
				<heading> = 180
			else
				<heading> = 90.0
			endif
		else
			if (<dotProd> < 0.1)
				<speed> = 500
				<heading> = 180
			else
				<heading> = -90
			endif
		endif
		SkaterAvoidGoalPed heading = <heading> speed = <speed>
		if GotParam collision_exception_return_state
			goto <collision_exception_return_state>
		endif
	endscript
	script goal_pro_wait_and_reset_avoid_exception
		wait 20 gameframe
		RunScriptOnObject {
			id = <trigger_obj_id>
			goal_trigger_reset_avoid_radius_exception
			params = {goal_id = <goal_id>}
		}
	endscript
	script goal_trigger_reset_avoid_radius_exception
		Obj_SetException ex = SkaterInAvoidRadius scr = goal_pro_bounce_skater params = {goal_id = <goal_id>}
	endscript
	script goal_got_trigger
		GetSkaterId
		<skaterId> = <ObjId>
		if GoalManager_HasWonGoal name = <goal_id>
			return
		endif
		if GoalManager_GoalIsActive name = <goal_id>
			return
		endif
		if CustomParkMode editing
			return
		endif
		if ObjectExists id = goal_start_dialog
			<should_destroy> = 0
			if <skaterId>::IsInBail
				<should_destroy> = 1
			endif
			if SkaterCurrentScorePotGreaterThan 0
				<should_destroy> = 1
			endif
			if <skaterId>::Driving
				<should_destroy> = 1
			endif
			if NOT GoalManager_CanStartGoal
				<should_destroy> = 1
			endif
			if (<should_destroy> = 1)
				DestroyScreenElement id = goal_start_dialog
			endif
		else
			if ObjectExists id = root_window
				root_window::GetTags
				if GotParam menu_state
					if (<menu_state> = on)
						return
					endif
				endif
			endif
			if GoalManager_CanStartGoal name = <goal_id>
				<skater_ready_for_goal> = 0
				if NOT <skaterId>::Driving
					if <skaterId>::Skating
						if <skaterId>::OnGround
							<skater_ready_for_goal> = 1
						endif
					else
						if <skaterId>::Walk_Ground
							<skater_ready_for_goal> = 1
						endif
					endif
				endif
				if (<skater_ready_for_goal> = 1)
					if NOT <skaterId>::IsInBail
						if NOT SkaterCurrentScorePotGreaterThan 0
							GoalManager_GetGoalParams name = <goal_id>
							<trigger_obj_id>::Obj_SetOuterRadius 20
							<trigger_obj_id>::Obj_SetException ex = SkaterOutOfRadius scr = goal_trigger_refuse params = {goal_id = <goal_id>}
							if (InNetGame)
								<quick_start_text> = "\n\m7 to quick start."
								<pad_square_script> = goal_accept_trigger
								<pad_square_params> = {goal_id = <goal_id> quick_start}
							else
								<quick_start_text> = ""
							endif
							if GotParam full_name
								FormatText TextName = accept_text "%f: \m5 to talk.%q" f = <full_name> q = <quick_start_text>
							else
								if GotParam pro
									FormatText ChecksumName = name_checksum "%s" s = <pro>
									<last_name> = (goal_pro_last_names.<name_checksum>)
									if GotParam last_name
										FormatText TextName = accept_text "%s %l: \m5 to talk.%q" s = <pro> l = <last_name> q = <quick_start_text>
									else
										FormatText TextName = accept_text "%s: \m5 to talk.%q" s = <pro> q = <quick_start_text>
									endif
								else
									FormatText TextName = accept_text "\m5 to talk.%q" q = <quick_start_text>
								endif
							endif
							create_speech_box {
								anchor_id = goal_start_dialog
								text = <accept_text>
								no_pad_choose
								no_pad_start
								pad_circle_script = goal_accept_trigger
								pad_circle_params = {goal_id = <goal_id>}
								pad_square_script = <pad_square_script>
								pad_square_params = <pad_square_params>
								bg_rgba = [100 100 100 128]
								text_rgba = [128 128 128 128]
								font = small
								z_priority = 5
							}
						endif
					endif
				endif
			endif
		endif
	endscript
	script goal_trigger_refuse anchor_id = goal_start_dialog
		Obj_ClearException SkaterOutOfRadius
		speech_box_exit anchor_id = <anchor_id>
		GoalManager_ResetGoalTrigger name = <goal_id>
	endscript
	script goal_accept_trigger
		DeBounce x time = 0.5
		speech_box_exit anchor_id = goal_start_dialog
		goal_check_for_required_tricks goal_id = <goal_id>
		if (<found_unmapped_trick> = 1)
			GoalManager_GetGoalParams name = <goal_id>
			if IsAlive name = <trigger_obj_id>
				<trigger_obj_id>::Obj_ClearException SkaterInRadius
			endif
			return
		endif
		if GotParam force_start
			if NOT GoalManager_GoalInitialized name = <goal_id>
				GoalManager_InitializeGoal name = <goal_id>
			endif
			GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
			if IsAlive name = <trigger_obj_id>
				<trigger_obj_id>::Obj_ClearException SkaterInRadius
			endif
			GoalManager_DeactivateAllGoals
			GoalManager_ActivateGoal name = <goal_id> <...>
			return
		endif
		if NOT SkaterCurrentScorePotGreaterThan 0
			if GoalManager_CanStartGoal name = <goal_id>
				GetSkaterId
				if <ObjId>::OnGround
					if SkaterCurrentScorePotLessThan 1
						if <ObjId>::OnGround
							GoalManager_GetGoalParams name = <goal_id>
							GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
							if IsAlive name = <trigger_obj_id>
								<trigger_obj_id>::Obj_ClearException SkaterInRadius
							endif
							GoalManager_DeactivateAllGoals
							if GotParam quick_start
								GoalManager_QuickStartGoal name = <goal_id>
							else
								GoalManager_ActivateGoal name = <goal_id> <...>
							endif
						else
							if NOT <ObjId>::RightPressed
								if NOT <ObjId>::LeftPressed
									if NOT <ObjId>::UpPressed
										if NOT <ObjId>::DownPressed
											GoalManager_GetGoalParams name = <goal_id>
											GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
											if IsAlive name = <trigger_obj_id>
												<trigger_obj_id>::Obj_ClearException SkaterInRadius
											endif
											GoalManager_DeactivateAllGoals
											if GotParam quick_start
												GoalManager_QuickStartGoal name = <goal_id>
											else
												GoalManager_ActivateGoal name = <goal_id> <...>
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				else
					if NOT <ObjId>::RightPressed
						if NOT <ObjId>::LeftPressed
							if NOT <ObjId>::UpPressed
								if NOT <ObjId>::DownPressed
									GoalManager_GetGoalParams name = <goal_id>
									GoalManager_ResetGoalTrigger name = <goal_id> no_new_exceptions
									if IsAlive name = <trigger_obj_id>
										<trigger_obj_id>::Obj_ClearException SkaterInRadius
									endif
									GoalManager_DeactivateAllGoals
									if GotParam quick_start
										GoalManager_QuickStartGoal name = <goal_id>
									else
										GoalManager_ActivateGoal name = <goal_id> <...>
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endscript
	script GoalManager_ResetGoalTrigger
		if GotParam goal_id
			GoalManager_GetGoalParams name = <goal_id>
		else
			GoalManager_GetGoalParams name = <name>
		endif
		if IsAlive name = <trigger_obj_id>
			<trigger_obj_id>::Obj_ClearException SkaterInRadius
			if NOT GotParam no_new_exceptions
				if NOT GotParam just_won_goal
					RunScriptOnObject id = <trigger_obj_id> goal_set_trigger_exceptions params = {goal_id = <goal_id>}
				endif
			endif
		endif
	endscript
	script goal_check_for_required_tricks
		<found_unmapped_trick> = 0
		GoalManager_GetGoalParams name = <goal_id>
		if GotParam required_tricks
			FormatText TextName = warning_string "You do not have all the tricks you will need to complete this goal. You will need to assign:"
			GetArraySize <required_tricks>
			<index> = 0
			while
				if NOT GetKeyComboBoundToTrick trick = (<required_tricks>[<index>])
					if NOT GetKeyComboBoundToTrick trick = (<required_tricks>[<index>]) special
						<trick_name> = (<required_tricks>[<index>])
						<trick_params> = (<trick_name>.params)
						<trick_string> = (<trick_params>.name)
						if (<found_unmapped_trick> = 0)
							FormatText TextName = warning_string "%s\n%t" s = <warning_string> t = <trick_string>
						else
							FormatText TextName = warning_string "%s, %t" s = <warning_string> t = <trick_string>
						endif
						<found_unmapped_trick> = 1
					endif
				endif
				<index> = (<index> + 1)
			repeat <array_size>
		endif
		if (<found_unmapped_trick> = 1)
			PauseGame
			create_error_box {title = "WARNING!"
				text = <warning_string>
				text_dims = (400.0,0.0)
				bg_scale = 1.20000005
				buttons = [{text = "Edit Tricks" pad_choose_script = goal_unmapped_tricks_box_accept}
					{text = "Skip this challenge" pad_choose_script = goal_unmapped_tricks_box_exit pad_choose_params = {goal_id = <goal_id>}}
				]
			}
		endif
		return found_unmapped_trick = <found_unmapped_trick>
	endscript
	script goal_unmapped_tricks_box_accept
		dialog_box_exit
		create_edit_tricks_menu
	endscript
	script goal_unmapped_tricks_box_exit
		GoalManager_ResetGoalTrigger name = <goal_id>
		dialog_box_exit
		UnpauseGame
	endscript
	script goal_got_trickslot
		create_panel_message {
			id = goal_current_reward
			text = "You got a new special trick slot"
			style = goal_message_got_trickslot
		}
	endscript
	script goal_got_cash
		FormatText TextName = message "You got $%i!" i = <amount>
		create_panel_message {
			id = goal_current_reward
			text = <message>
			style = goal_message_got_stat
			params = {sound = cash}
		}
	endscript
	script goal_got_all_goals
		StopStream
		PlayStream FoundAllGaps vol = 150
		unlock_all_cheat_codes
		unlock_all_gameplay_cheat_codes
		StopStream
		PlayStream FoundAllGaps vol = 150
		<text> = "Way to go back and clean out the story goals. \n\nYou've unlocked \c3new cheats\c0 to help you take it further. Access them from the Pause menu under Options. Good luck!"
		create_dialog_box {title = "All Goals"
			text = <text>
			pos = (310.0,225.0)
			just = [center center]
			text_rgba = [88 105 112 128]
			text_dims = (400.0,0.0)
			buttons = [{font = small text = "OK" pad_choose_script = goal_got_all_goals_accept}]
			delay_input
		}
	endscript
	script goal_got_all_goals_accept
		dialog_box_exit
		FireEvent type = goal_got_all_goals_done
	endscript
	script goal_play_stream
		if GotParam streamId
			while
				if PreLoadStreamDone <streamId>
					break
				endif
				wait 1 frame
			repeat
		endif
		if GotParam play_anim
			AddAnimController {
				type = partialAnim
				id = jawRotation
				animName = <stream_checksum>
				from = start
				to = end
				speed = 1.0
			}
		endif
		if GotParam streamId
			StartPreloadedStream {
				streamId = <streamId>
				volume = 190
			}
		else
			Obj_PlayStream {
				<stream_checksum>
				vol = 120
				dropoff = 300
				use_pos_info = <use_pos_info>
			}
		endif
	endscript
	script goal_turn_pro
		create_panel_block text = "You just turned pro\n"
	endscript
	script goal_init_after_end_of_run
		if NOT GoalManager_GoalExists name = <goal_id>
			return
		endif
		GoalManager_GetGoalParams name = <goal_id>
		if GotParam competition
			return
		endif
		GetSkaterId
		while
			if GoalManager_GoalExists name = <goal_id>
				if GoalManager_FinishedEndOfRun name = <goal_id>
					GoalManager_ClearEndRun name = <goal_id>
					if <ObjId>::Skating
						MakeSkaterGoto OnGroundAI
					endif
					if InNetGame
						<ObjId>::NetEnablePlayerInput
					else
						<ObjId>::EnablePlayerInput
					endif
					break
				endif
			else
				break
			endif
			wait 1 frame
		repeat
	endscript
	script goal_stats_menu_exit
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
			SetScreenElementProps {
				id = root_window
				tags = {menu_state = Off}
			}
			wait 1 frame
		endif
		restore_start_key_binding
		goalmanager_showpoints
		GoalManager_ShowGoalPoints
		FireEvent type = goal_stats_menu_done
	endscript
	script goal_new_level_unlocked
		DeBounce x time = 0.30000001
		FormatText TextName = dialog_box_text "You have enough goal points to go to a new level."
		PlayStream UnlockLevel vol = 150
		create_snazzy_dialog_box {text = <dialog_box_text>
			title = "Congratulations!"
			buttons = [{text = "Change Level" pad_choose_script = goal_new_level_accept}
				{text = "Keep Playing" pad_choose_script = goal_new_level_reject}
			]
		}
	endscript
	script goal_new_level_accept
		dialog_box_exit
		launch_level_select_menu chose_same_level_script = goal_new_level_reject pad_back_script = goal_new_level_reject no_cam_anim
	endscript
	script goal_new_level_reject
		dialog_box_exit
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		SetScreenElementProps {
			id = root_window
			tags = {menu_state = Off}
		}
		FireEvent type = goal_new_level_unlocked_done
	endscript
	script goal_want_to_save
		GetValueFromVolume cdvol
		root_window::SetTags menu_state = on
		hide_console_window
		pause_trick_text
		destroy_goal_panel_messages
		GoalManager_SetCanStartGoal 0
		pause_rain
		DeBounce x time = 0.30000001
		PauseGame
		kill_start_key_binding
		FormatText TextName = dialog_box_text "Do you want to save now?"
		create_snazzy_dialog_box {text = <dialog_box_text>
			title = ""
			buttons = [{text = "Yes" pad_choose_script = goal_save_accept}
				{text = "No" pad_choose_script = goal_save_reject}
			]
			pad_back_script = goal_save_reject
		}
		AssignAlias id = dialog_box_anchor alias = current_menu_anchor
		create_helper_text generic_helper_text
	endscript
	script goal_save_accept
		dialog_box_exit
		kill_start_key_binding
		launch_beat_goal_save_game_sequence pad_back_script = goal_save_reject no_cam_anim
	endscript
	script goal_save_reject
		UnpauseGame
		GoalManager_SetCanStartGoal 1
		restore_start_key_binding
		dialog_box_exit
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		SetScreenElementProps {
			id = root_window
			tags = {menu_state = Off}
		}
		root_window::SetTags menu_state = Off
		unpause_rain
		unhide_console_window
		unpause_trick_text
		FireEvent type = goal_wait_for_save
	endscript
	script goal_create_counter
		SetScreenElementLock id = root_window Off
		goal_destroy_counter
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = goal_counter_anchor
			dims = (640.0,480.0)
			pos = (305.0,320.0)
		}
		<root_pos> = (550.0,90.0)
		FormatText ChecksumName = rgba_off "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = rgba_on "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = TextElement
			parent = goal_counter_anchor
			id = goal_counter_number_collected
			font = small
			text = "0"
			pos = <root_pos>
			just = [center top]
			scale = 0.89999998
			rgba = <rgba_on>
		}
		if GoalManager_GetNumberOfFlags name = <goal_id>
			<total_number> = <number_of_flags>
		else
			GoalManager_GetGoalParams name = <goal_id>
			if GotParam number
				<total_number> = <number>
			else
				if GotParam num_gaps_to_find
					<total_number> = <num_gaps_to_find>
				else
					script_assert "Couldn't find number param.  Are the params for the hud counter setup?"
				endif
			endif
		endif
		FormatText TextName = total_number "%i" i = <total_number>
		CreateScreenElement {
			type = TextElement
			parent = goal_counter_anchor
			id = goal_counter_number_total
			rgba = <rgba_off>
			font = small
			text = <total_number>
			pos = (<root_pos> + (47.0,0.0))
			just = [center top]
			scale = 0.89999998
		}
		FormatText ChecksumName = bg_rgba "%i_SPEECH_BOX_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = SpriteElement
			parent = goal_counter_anchor
			id = mini_score_hud_box
			texture = mini_score_hud
			pos = (<root_pos> - (25.0,6.0))
			just = [left top]
			scale = (1.47000003,1.0)
			rgba = <bg_rgba>
		}
		if GotParam hud_counter_caption
			GetStackedScreenElementPos Y id = <id> offset = (48.0,-12.0)
			CreateScreenElement {
				type = TextBlockElement
				parent = goal_counter_anchor
				id = goal_counter_caption
				font = small
				text = <hud_counter_caption>
				rgba = [128 128 128 108]
				pos = <pos>
				just = [center top]
				scale = 0.80000001
				line_spacing = 0.60000002
				dims = (117.5,0.0)
				allow_expansion
			}
		endif
		goal_update_counter <...>
	endscript
	script goal_update_counter
		GoalManager_GetNumberCollected name = <goal_id>
		if NOT ScreenElementExists id = goal_counter_number_collected
			return
		endif
		FormatText TextName = new_number_collected "%i" i = <number_collected>
		SetScreenElementProps {
			id = goal_counter_number_collected
			text = <new_number_collected>
		}
		GoalManager_GetGoalParams name = <goal_id>
		if GotParam hud_counter_caption
			if ScreenElementExists id = goal_counter_caption
				SetScreenElementProps {
					id = goal_counter_caption
					text = <hud_counter_caption>
				}
			endif
		endif
		KillSpawnedScript name = mini_hud_anim
		RunScriptOnScreenElement id = goal_counter_number_collected mini_hud_anim
	endscript
	script goal_destroy_counter
		if ObjectExists id = goal_counter_anchor
			DestroyScreenElement id = goal_counter_anchor
		endif
	endscript
	script mini_hud_anim
		DoMorph time = 0.08 scale = 0 alpha = 0
		DoMorph time = 0.12 scale = 1.29999995 alpha = 1
		DoMorph time = 0.14 scale = 0.69999999
		DoMorph time = 0.16 scale = 0.89999998
	endscript
	script goal_got_flag_sound
		PlaySound GoalMidGood vol = 200
	endscript
	goal_panel_message_ids = [
		goal_complete
		goal_complete_line2
		goal_complete_sprite
		current_goal
		goal_message
		GoalFail
		goalfail_sprite
		goalfailedline2
		goal_tip
		new_goal_message
		new_goal_sprite
		tetris_menu_anchor
		current_horse_spot
		goal_counter_anchor
		goal_instruction1
		goal_film_update_message
		skater_hint
		death_message
		perfect
		perfect2
		goal_current_reward
		Eric_text
	]
	script hide_goal_panel_messages
		GetArraySize goal_panel_message_ids
		<index> = 0
		while
			if NOT ((goal_panel_message_ids[<index>]) = current_goal)
				hide_panel_message id = (goal_panel_message_ids[<index>])
			endif
			<index> = (<index> + 1)
		repeat <array_size>
	endscript
	script show_goal_panel_messages
		GetArraySize goal_panel_message_ids
		<index> = 0
		while
			show_panel_message id = (goal_panel_message_ids[<index>])
			<index> = (<index> + 1)
		repeat <array_size>
	endscript
	script destroy_goal_panel_messages
		GetArraySize goal_panel_message_ids
		if GotParam all
			<index> = 0
		else
			<index> = 3
			<array_size> = (<array_size> - 3)
		endif
		if (<index> < <array_size>)
			while
				destroy_panel_message id = (goal_panel_message_ids[<index>])
				<index> = (<index> + 1)
			repeat <array_size>
		endif
	endscript
	script GoalManager_HidePoints
		DoScreenElementMorph {
			id = the_score_sprite
			alpha = 0
		}
		DoScreenElementMorph {
			id = the_score
			alpha = 0
		}
		if ScreenElementExists id = player2_panel_container
			DoScreenElementMorph id = player2_panel_container time = 0 scale = 0
		endif
	endscript
	script goalmanager_showpoints
		if NOT GetGlobalFlag flag = NO_DISPLAY_HUD
			if CustomParkMode editing
			else
				DoScreenElementMorph {
					id = the_score_sprite
					alpha = 1
				}
				DoScreenElementMorph {
					id = the_score
					alpha = 1
				}
				if ScreenElementExists id = player2_panel_container
					DoScreenElementMorph id = player2_panel_container time = 0 scale = 1
				endif
			endif
		endif
	endscript
	script GoalManager_HideGoalPoints
		DoScreenElementMorph {
			id = cash_goal_sprite
			alpha = 0
		}
		DoScreenElementMorph {
			id = cash_text
			alpha = 0
		}
		DoScreenElementMorph {
			id = goal_points_text
			alpha = 0
		}
	endscript
	script GoalManager_ShowGoalPoints
		if CustomParkMode editing
			return
		endif
		if InMultiplayerGame
			return
		endif
		if GameModeEquals is_singlesession
			return
		endif
		if GameModeEquals is_freeskate
			return
		endif
		DoScreenElementMorph {
			id = cash_goal_sprite
			alpha = 1
		}
		GoalManager_GetCash
		FormatText TextName = cash "%i" i = <cash>
		SetScreenElementProps {
			id = cash_text
			text = <cash>
		}
		DoScreenElementMorph {
			id = cash_text
			alpha = 1
		}
		GoalManager_GetNumberOfGoalPoints total
		FormatText TextName = goal_points "%i" i = <goal_points>
		SetScreenElementProps {
			id = goal_points_text
			text = <goal_points>
		}
		DoScreenElementMorph {
			id = goal_points_text
			alpha = 1
		}
	endscript
	script goal_show_tips
		WaitForEvent type = panel_message_goal_done
		GoalManager_GetGoalParams name = <goal_id>
		<tip_pos> = (320.0,140.0)
		if NOT GotParam goal_tips
			return
		endif
		if NOT GotParam goal_tip_interval
			goal_tip_interval = 5
		endif
		GoalManager_GetNumberOfTimesGoalStarted name = <goal_id>
		GetArraySize <goal_tips>
		if (<array_size> = 0)
			return
		endif
		tips_index = (<array_size> - 1)
		current_multiple = (<goal_tip_interval> * <array_size>)
		if (<times_started> = 0)
			return
		endif
		if NOT (((<times_started> / <goal_tip_interval>) * <goal_tip_interval>) = <times_started>)
			return
		endif
		times_started = (<times_started> - (<times_started> / <current_multiple>) * <current_multiple>)
		while
			if (((<times_started> / <current_multiple>) * <current_multiple>) = <times_started>)
				create_panel_block id = goal_tip text = (<goal_tips>[<tips_index>]) pos = <tip_pos> style = panel_message_tips just = [center top]
				break
			else
				tips_index = (<tips_index> - 1)
				current_multiple = (<current_multiple> - <goal_tip_interval>)
			endif
		repeat <array_size>
	endscript
	script goal_no_valid_key_combos
		create_panel_message text = "You don't know enough tricks!  Come back when you've learned something."
		GoalManager_DeactivateGoal name = <goal_id>
	endscript
	script AddGoal_Null
		if GotParam version
			FormatText TextName = goal_type "Null%v" v = <version>
		else
			<goal_type> = "Null"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> params = {<...> null_goal unlocked_by_another}
	endscript
	script AddGoal_Combo
		if GotParam version
			FormatText TextName = goal_type "Combo%v" v = <version>
			if NOT GotParam letter_info
				FormatText ChecksumName = c_obj_id "TRG_Goal_COMBO_C%v" v = <version>
				FormatText ChecksumName = o_obj_id "TRG_Goal_COMBO_O%v" v = <version>
				FormatText ChecksumName = m_obj_id "TRG_Goal_COMBO_M%v" v = <version>
				FormatText ChecksumName = b_obj_id "TRG_Goal_COMBO_B%v" v = <version>
				FormatText ChecksumName = o2_obj_id "TRG_Goal_COMBO_O2%v" v = <version>
				letter_info = [
					{obj_id = <c_obj_id> text = "C"}
					{obj_id = <o_obj_id> text = "O"}
					{obj_id = <m_obj_id> text = "M"}
					{obj_id = <b_obj_id> text = "B"}
					{obj_id = <o2_obj_id> text = "O"}
				]
			endif
			FormatText ChecksumName = trigger_obj_id "TRG_G_COMBO%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_COMBO%v_RestartNode" v = <version>
		else
			<goal_type> = "Combo"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_amateurCOMBOline_genericParams
				<...>
			}
		}
	endscript
	script AddGoal_ProCombo
		GoalManager_CreateGoalName goal_type = "ProCombo"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_ProComboLine_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_MedCombo
		GoalManager_CreateGoalName goal_type = "MedCombo"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_MedComboLine_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Skate
		if GotParam version
			FormatText TextName = goal_type "Skate%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_SKATE%v_Pro" v = <version>
			FormatText ChecksumName = s_obj_id "TRG_Goal_Letter_S%v" v = <version>
			FormatText ChecksumName = k_obj_id "TRG_Goal_Letter_K%v" v = <version>
			FormatText ChecksumName = a_obj_id "TRG_Goal_Letter_A%v" v = <version>
			FormatText ChecksumName = t_obj_id "TRG_Goal_Letter_T%v" v = <version>
			FormatText ChecksumName = e_obj_id "TRG_Goal_Letter_E%v" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_SKATE%v_RestartNode" v = <version>
		else
			<goal_type> = "Skate"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_SkateLetters_genericParams
				<...>
			}
		}
	endscript
	script AddGoal_HighScore
		GoalManager_CreateGoalName goal_type = "HighScore"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_HighScore_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_GenericScore
		if GotParam version
			FormatText TextName = goal_type "GenericScore%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_GS%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_GS%v_RestartNode" v = <version>
		else
			<goal_type> = "GenericScore"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_GenericScore_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_ProScore
		GoalManager_CreateGoalName goal_type = "ProScore"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_ProScore_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_SickScore
		GoalManager_CreateGoalName goal_type = "SickScore"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_SickScore_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Collect
		if GotParam version
			FormatText TextName = goal_type "Collect%v" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_Collect%v_RestartNode" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_Collect%v_Pro" v = <version>
		else
			<goal_type> = "Collect"
		endif
		if GotParam career_only
			if InNetGame
				return
			endif
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Collect_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Collect2
		if GotParam career_only
			if InNetGame
				return
			endif
		endif
		GoalManager_CreateGoalName goal_type = "Collect2"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Collect2_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Collect3
		if GotParam career_only
			if InNetGame
				return
			endif
		endif
		GoalManager_CreateGoalName goal_type = "Collect3"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Collect3_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Collect4
		if GotParam career_only
			if InNetGame
				return
			endif
		endif
		GoalManager_CreateGoalName goal_type = "Collect4"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Collect4_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Collect5
		if GotParam career_only
			if InNetGame
				return
			endif
		endif
		GoalManager_CreateGoalName goal_type = "Collect5"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Collect5_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Collect6
		if GotParam career_only
			if InNetGame
				return
			endif
		endif
		GoalManager_CreateGoalName goal_type = "Collect6"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Collect6_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_UntimedCollect
		if GotParam version
			FormatText TextName = goal_type "UntimedCollect%v" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_UntimedCollect%v_RestartNode" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_UntimedCollect%v_Pro" v = <version>
		else
			<goal_type> = "UntimedCollect"
		endif
		if GotParam career_only
			if InNetGame
				return
			endif
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_UntimedCollect_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Film
		if GotParam version
			FormatText TextName = goal_type "Film%v" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_Film%v_RestartNode" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_Film%v_Pro" v = <version>
		else
			<goal_type> = "Film"
		endif
		if GotParam career_only
			if InNetGame
				return
			endif
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Film_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Competition
		if GotParam version
			FormatText TextName = goal_type "Comp%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_JUDGE_COMP%v" v = <version>
			FormatText TextName = geo_prefix "G_COMP%v" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_COMP%v_RestartNode" v = <version>
		else
			<goal_type> = "Comp"
		endif
		if GotParam career_only
			if InNetGame
				return
			endif
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Comp_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Competition2
		if GotParam career_only
			if InNetGame
				return
			endif
		endif
		GoalManager_CreateGoalName goal_type = "Comp2"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Comp2_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Trickspot
		if GotParam version
			FormatText TextName = goal_type "Trickspot%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_TS%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_TS%v_RestartNode" v = <version>
		else
			<goal_type> = "Trickspot"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Trickspot_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Trickspot2
		GoalManager_CreateGoalName goal_type = "Trickspot2"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Trickspot2_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Trickspot3
		GoalManager_CreateGoalName goal_type = "Trickspot3"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Trickspot3_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Trickspot4
		GoalManager_CreateGoalName goal_type = "Trickspot4"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Trickspot4_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Trickspot5
		GoalManager_CreateGoalName goal_type = "Trickspot5"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Trickspot5_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Gaps
		if GotParam version
			FormatText TextName = goal_type "GAps%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_GAP%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_GAP%v_RestartNode" v = <version>
		else
			<goal_type> = "GAps"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Gaps_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Gaps2
		GoalManager_CreateGoalName goal_type = "GAps2"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Gaps2_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Gaps3
		GoalManager_CreateGoalName goal_type = "GAps3"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Gaps3_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Gaps4
		GoalManager_CreateGoalName goal_type = "GAps4"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Gaps4_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Gaps5
		GoalManager_CreateGoalName goal_type = "GAps5"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Gaps5_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Gaps6
		GoalManager_CreateGoalName goal_type = "GAps6"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Gaps6_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Race
		if GotParam version
			FormatText TextName = goal_type "RAce%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_RACE%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_RACE%v_RestartNode" v = <version>
		else
			<goal_type> = "RAce"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Race_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Race2
		GoalManager_CreateGoalName goal_type = "RAce2"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Race2_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Race3
		GoalManager_CreateGoalName goal_type = "RAce3"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Race3_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Race4
		GoalManager_CreateGoalName goal_type = "RAce4"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Race4_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Race5
		GoalManager_CreateGoalName goal_type = "RAce5"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Race5_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Race6
		GoalManager_CreateGoalName goal_type = "RAce6"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Race6_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Horse
		if GotParam version
			FormatText TextName = goal_type "HOrse%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_HORSE%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_HORSE%v_RestartNode" v = <version>
		else
			<goal_type> = "HOrse"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Horse_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Horse2
		GoalManager_CreateGoalName goal_type = "HOrse2"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Horse2_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_HighCombo
		if GotParam version
			FormatText TextName = goal_type "HIghCombo%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_HIGHCOMBO%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_HIGHCOMBO%v_RestartNode" v = <version>
		else
			<goal_type> = "HIghCombo"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_HighCombo_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_HighCombo2
		GoalManager_CreateGoalName goal_type = "HIghCombo2"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_HighCombo2_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Kill
		if GotParam version
			FormatText TextName = goal_type "KIll%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_KILL%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_KILL%v_RestartNode" v = <version>
		else
			<goal_type> = "KIll"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Kill_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Special
		if GotParam version
			FormatText TextName = goal_type "SPecial%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_SPECIAL%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_SPECIAL%v_RestartNode" v = <version>
		else
			<goal_type> = "SPecial"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Special_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Tetris
		if GotParam version
			FormatText TextName = goal_type "TEtris%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_TETRIS%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_TETRIS%v_RestartNode" v = <version>
		else
			<goal_type> = "TEtris"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Tetris_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Tetris2
		GoalManager_CreateGoalName goal_type = "TEtris2"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Tetris2_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Counter
		if GotParam version
			FormatText TextName = goal_type "COunter%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_COUNTER%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_COUNTER%v_RestartNode" v = <version>
		else
			<goal_type> = "COunter"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Counter_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Counter2
		GoalManager_CreateGoalName goal_type = "COunter2"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Counter2_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Counter3
		GoalManager_CreateGoalName goal_type = "COunter3"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Counter3_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_Counter4
		GoalManager_CreateGoalName goal_type = "COunter4"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_Counter4_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_CounterCombo
		if GotParam version
			FormatText TextName = goal_type "COunterCombo%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_COUNTERCOMBO%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_COUNTERCOMBO%v_RestartNode" v = <version>
		else
			<goal_type> = "COunterCombo"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_CounterCombo_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_CounterCombo2
		GoalManager_CreateGoalName goal_type = "COunterCombo2"
		GoalManager_AddGoal name = <goal_id> {
			params = {Goal_CounterCombo2_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_SkateTheLine
		GoalManager_CreateGoalName goal_type = "SKateTheLine"
		GoalManager_AddGoal name = <goal_id> {
			params = {goal_SkateTheLine_genericparams
				<...>
			}
		}
	endscript
	script AddGoal_FindGaps
		if GotParam version
			FormatText TextName = goal_type "FindGaps%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_FINDGAPS%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_FINDGAPS%v_RestartNode" v = <version>
		else
			<goal_type> = "FindGaps"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {goal_findGaps_GenericParams
				<...>
			}
		}
	endscript
	script AddGoal_CreateATrick
		if GotParam version
			FormatText TextName = goal_type "CAT%v" v = <version>
			FormatText ChecksumName = trigger_obj_id "TRG_G_CAT%v_Pro" v = <version>
			FormatText ChecksumName = restart_node "TRG_G_CAT%v_RestartNode" v = <version>
		else
			<goal_type> = "CAT"
		endif
		GoalManager_CreateGoalName goal_type = <goal_type>
		GoalManager_AddGoal name = <goal_id> {
			params = {goal_CAT_GenericParams
				<...>
			}
		}
	endscript
	script AddMinigame_TimedCombo
		GoalManager_CreateGoalName goal_type = "minigame_TimedCombo"
		GoalManager_AddGoal name = <goal_id> {
			params = {minigame_TimedCombo_GenericParams
				<...>
			}
		}
	endscript
	script AddMinigame_Fountain
		GoalManager_CreateGoalName goal_type = "minigame_fountain"
		GoalManager_AddGoal name = <goal_id> {
			params = {minigame_fountain_genericParams
				<...>
			}
		}
	endscript
	script AddMinigame_Fountain2
		GoalManager_CreateGoalName goal_type = "minigame_fountain2"
		GoalManager_AddGoal name = <goal_id> {
			params = {minigame_fountain2_genericParams
				<...>
			}
		}
	endscript
	script AddMinigame_Height
		GoalManager_CreateGoalName goal_type = "minigame_height"
		GoalManager_AddGoal name = <goal_id> {
			params = {minigame_Height_GenericParams
				<...>
			}
		}
	endscript
	script AddBettingGuy
		GoalManager_CreateGoalName goal_type = "betting_guy"
		GoalManager_AddGoal name = <goal_id> {
			params = {betting_guy_GenericParams
				career_only
				<...>
			}
		}
	endscript
	script AddMinigame_trickspot
		GoalManager_CreateGoalName goal_type = "minigame_trickspot"
		GoalManager_AddGoal name = <goal_id> {
			params = {minigame_trickspot_genericParams
				<...>
			}
		}
	endscript
	script AddMinigame_Timer
		GoalManager_CreateGoalName goal_type = "minigame_timer"
		GoalManager_AddGoal name = <goal_id> {
			params = {minigame_timer_GenericParams
				<...>
			}
		}
	endscript
	script AddMinigame_Generic
		GoalManager_CreateGoalName goal_type = "minigame_generic"
		GoalManager_AddGoal name = <goal_id> {
			params = {minigame_generic_GenericParams
				<...>
			}
		}
	endscript
	script AddMinigame_Generic2
		GoalManager_CreateGoalName goal_type = "minigame_generic2"
		GoalManager_AddGoal name = <goal_id> {
			params = {minigame_generic2_GenericParams
				<...>
			}
		}
	endscript
	script AddMinigame_Generic3
		GoalManager_CreateGoalName goal_type = "minigame_generic3"
		GoalManager_AddGoal name = <goal_id> {
			params = {minigame_generic3_GenericParams
				<...>
			}
		}
	endscript
	script AddMinigame_Generic4
		GoalManager_CreateGoalName goal_type = "minigame_generic4"
		GoalManager_AddGoal name = <goal_id> {
			params = {minigame_generic4_GenericParams
				<...>
			}
		}
	endscript
	script panel_message_goalfail
		SetProps just = [center bottom] rgba = [128 30 12 108]
		RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = {time = 1800}
		DoMorph pos = (320.0,149.0) time = 0 scale = 0 alpha = 0
		DoMorph pos = (320.0,149.0) scale = 1.79999995 time = 0.1 alpha = 1
		DoMorph pos = (320.0,149.0) scale = 0.89999998 time = 0.15000001
		DoMorph pos = (320.0,149.0) scale = 1.39999998 time = 0.17
		DoMorph pos = (320.0,149.0) scale = 1.20000005 time = 0.18000001
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 0 time = 0.05 scale = (10.0,0.0) rgba = [0 0 0 128]
	endscript
	script panel_sprite_goalfail time = 1500
		SetProps just = [center center] rgba = [128 30 12 108]
		RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = {time = <time>}
		DoMorph time = 0 scale = 0 pos = (320.0,114.0) alpha = 0
		DoMorph time = 0.34999999 scale = 2.5 alpha = 1
		DoMorph time = 0.5 scale = 3.5 alpha = 0
	endscript
	script panel_message_goalfailline2 time = 1500
		SetProps font = dialog just = [center center] rgba = [128 30 12 108]
		RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = {time = <time>}
		DoMorph pos = (320.0,157.0) time = 0 alpha = 0
		DoMorph pos = (320.0,157.0) scale = 8 time = 0.1 alpha = 1
		DoMorph pos = (320.0,157.0) scale = 0.89999998 time = 0.15000001
		DoMorph pos = (320.0,157.0) scale = 1.79999995 time = 0.17
		DoMorph pos = (320.0,157.0) scale = 1.20000005 time = 0.18000001
		DoMorph pos = (320.0,157.0) scale = 1.5 time = 0.19
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0 time = 0.05 scale = (10.0,0.0) rgba = [0 0 0 128]
	endscript
	script panel_message_goalcomplete time = 1500
		GetTags
		RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = {time = <time>}
		SetProps just = [center bottom] rgba = [36 125 24 128]
		DoMorph time = 0 scale = 0 alpha = 0
		DoMorph time = 0.1 scale = 0 alpha = 0
		DoMorph pos = (320.0,149.0) time = 0 alpha = 0 scale = 6
		DoMorph pos = (320.0,149.0) scale = 6 time = 0.1 alpha = 1
		DoMorph pos = (320.0,149.0) scale = 0.89999998 time = 0.15000001
		DoMorph pos = (320.0,149.0) scale = 1.60000002 time = 0.17
		DoMorph pos = (320.0,149.0) scale = 1.10000002 time = 0.18000001
		DoMorph pos = (320.0,149.0) scale = 1.29999995 time = 0.19
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0 time = 0.05 scale = (10.0,0.0) rgba = [0 0 0 128]
	endscript
	script panel_sprite_goalcomplete time = 1500
		SetProps just = [center center] rgba = [36 125 24 128]
		DoMorph time = 0 scale = 0 pos = (320.0,114.0) alpha = 0
		DoMorph time = 0.1 scale = 0 alpha = 0
		DoMorph time = 0.34999999 scale = 2.5 alpha = 1
		DoMorph time = 0.5 scale = 3.5 alpha = 0
		FireEvent type = panel_sprite_goalcomplete_done
	endscript
	script panel_message_goalcompleteline2 time = 1500
		SetProps font = dialog just = [center center] rgba = [36 125 24 128]
		DoMorph time = 0 scale = 0 alpha = 0
		DoMorph time = 0.1 scale = 0 alpha = 0
		DoMorph pos = (320.0,157.0) scale = 6 alpha = 1 time = 0
		DoMorph pos = (320.0,157.0) scale = 0.75 alpha = 1 time = 0.1
		wait 1 frame
		DoMorph pos = (320.0,157.0) scale = 1.60000002 alpha = 1 time = 0.1
		wait 1 frame
		DoMorph pos = (320.0,157.0) scale = 1.29999995 alpha = 1 time = 0.1
		wait 1 frame
		SetProps blur_effect
		do_blur_effect
		SetProps no_blur_effect
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph alpha = 0 time = 0.05 scale = (10.0,0.0) rgba = [0 0 0 128]
		Die
		FireEvent type = panel_message_goalcompleteline2_done
	endscript
	script panel_message_new_record
		SetProps font = dialog just = [center center] rgba = [125 123 7 128]
		DoMorph time = 0 pos = (320.0,204.0) scale = 0 alpha = 0
		DoMorph time = 0.5 alpha = 1
		if GotParam sound
			PlaySound <sound> vol = 150
		endif
		DoMorph time = 0.1 scale = 2.5
		DoMorph time = 0.1 scale = 1.5
		DoMorph time = 0.1 scale = 2.0
		DoMorph time = 0.1 scale = 1.39999998
		DoMorph pos = (321.0,205.0) time = 0.1
		DoMorph pos = (319.0,203.0) time = 0.1
		DoMorph pos = (321.0,205.0) time = 0.1
		DoMorph pos = (319.0,203.0) time = 0.1
		DoMorph time = 0.1 scale = 1.79999995
		DoMorph time = 0.15000001 scale = 0 alpha = 0
		FireEvent type = panel_message_new_record_done
		Die
	endscript
	script panel_message_goal blink_time = 0.1 final_pos = (620.0,27.0)
		if NOT GotParam dont_animate
			SetProps just = [center top] internal_just = [center center] rgba = [128 128 128 128]
			DoMorph pos = (320.0,120.0) scale = 0 alpha = 0
			DoMorph pos = (320.0,120.0) scale = 1.10000002 time = 0.30000001 alpha = 0.34999999
			wait 0.2 second
		endif
		SetProps internal_just = [center top] rgba = [128 128 128 110] just = [right top]
		DoMorph pos = <final_pos> scale = 0.82999998 time = 0.09 alpha = 1
		FireEvent type = panel_message_goal_done
		FireEvent type = panel_message_goal_done2
	endscript
	script panel_message_found_secret time = 1500
		SetProps just = [center center] rgba = [115 116 13 128]
		DoMorph pos = (320.0,157.0) scale = 6 alpha = 0 time = 0
		DoMorph pos = (320.0,157.0) scale = 0.75 alpha = 1 time = 0.1
		wait 1 frame
		DoMorph pos = (320.0,157.0) scale = 1.60000002 alpha = 1 time = 0.1
		wait 1 frame
		DoMorph pos = (320.0,157.0) scale = 1.29999995 alpha = 1 time = 0.1
		wait 1 frame
		SetProps blur_effect
		do_blur_effect
		SetProps no_blur_effect
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 alpha = 0.40000001
		DoMorph time = 0.1 alpha = 1
		DoMorph alpha = 0 time = 0.05 scale = (10.0,0.0) rgba = [0 0 0 128]
		Die
		FireEvent type = panel_message_found_secret_done
	endscript
	script panel_message_new_goal
		SetProps font = dialog just = [center center] rgba = [128 30 12 108]
		DoMorph pos = (320.0,184.0) time = 0 alpha = 0
		DoMorph pos = (320.0,184.0) scale = 8 time = 0.1
		DoMorph pos = (320.0,184.0) scale = 0.89999998 time = 0.15000001 alpha = 1
		DoMorph pos = (320.0,184.0) scale = 1.60000002 time = 0.17
		DoMorph pos = (320.0,184.0) scale = 1.20000005 time = 0.18000001
		DoMorph pos = (320.0,184.0) scale = 1.39999998 time = 0.19
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0.5 time = 0.1
		DoMorph alpha = 1.0 time = 0.1
		DoMorph alpha = 0 time = 0.15000001 scale = (15.0,0.0) rgba = [128 128 128 128]
		Die
	endscript
	script panel_sprite_new_goal time = 1500
		SetProps just = [center center] rgba = [128 128 128 128]
		RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = {time = <time>}
		DoMorph time = 0 scale = 0 pos = (320.0,190.0) alpha = 0
		DoMorph time = 0.30000001 scale = 2.5 alpha = 1
		DoMorph time = 0.40000001 scale = 3.5 alpha = 0
		wait 2 second
		DoMorph alpha = 0 time = 2
	endscript
	script panel_message_generic_loss
		SetProps just = [center center] rgba = [128 128 128 100]
		RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = {time = 1500}
		DoMorph pos = (320.0,185.0) time = 0 scale = 0
		DoMorph time = 0.30000001 scale = 1.29999995
		DoMorph time = 0.2 scale = 1.0
		DoMorph pos = (319.0,184.0) time = 0.1
		DoMorph pos = (321.0,186.0) time = 0.1
		DoMorph pos = (319.0,184.0) time = 0.1
		DoMorph pos = (322.0,186.0) time = 0.1
		DoMorph pos = (319.0,184.0) time = 0.1
		DoMorph pos = (321.0,186.0) time = 0.1
		DoMorph pos = (319.0,182.0) time = 0.1
		DoMorph pos = (321.0,186.0) time = 0.1
		DoMorph pos = (319.0,184.0) time = 0.1
		DoMorph pos = (321.0,186.0) time = 0.1
		DoMorph pos = (318.0,184.0) time = 0.1
		DoMorph pos = (321.0,187.0) time = 0.1
	endscript
	script panel_message_goal_description
		SetProps rgba = [128 128 128 128] just = [center center]
		DoMorph time = 0 scale = 1 pos = (320.0,120.0)
	endscript
	script panel_message_tips blink_time = 0.05
		SetProps just = [center top] internal_just = [center center] rgba = [127 102 0 100]
		DoMorph scale = 0
		DoMorph scale = 1.20000005 time = 0.1
		DoMorph scale = 0.80000001 time = 0.1
		DoMorph scale = 1 time = 0.1
		DoMorph scale = 0.89999998 time = 0.1
		DoMorph pos = {(1.0,2.0) relative} time = 0.1
		DoMorph pos = {(-2.0,-3.0) relative} time = 0.1
		DoMorph pos = {(2.0,2.0) relative} time = 0.1
		DoMorph pos = {(-3.0,-2.0) relative} time = 0.1
		DoMorph pos = {(3.0,2.0) relative} time = 0.1
		DoMorph pos = {(-2.0,-2.0) relative} time = 0.1
		DoMorph pos = {(2.0,4.0) relative} time = 0.1
		DoMorph pos = {(-2.0,-4.0) relative} time = 0.1
		DoMorph pos = {(1.0,7.0) relative} scale = 1.25 time = 0.1
		SetProps internal_just = [center top] rgba = [127 102 0 90] just = [right top]
		DoMorph pos = {(155.0,-40.0) relative} scale = 0.77999997 time = 0.05
		while
			DoMorph alpha = 0
			wait <blink_time> seconds
			DoMorph alpha = 1
			wait <blink_time> seconds
		repeat 6
	endscript
	script clock_morph
		DoMorph scale = 0 alpha = 0 time = 0.1
		DoMorph scale = 1.0 alpha = 1 time = 0.30000001
	endscript
	script goal_message_got_trickslot
		SetProps rgba = [43 95 53 128]
		DoMorph time = 0 pos = (320.0,214.0) scale = 0 alpha = 0
		DoMorph time = 0.5 alpha = 1
		if GotParam sound
			PlaySound <sound> vol = 150
		endif
		DoMorph time = 0.1 scale = 2.5
		DoMorph time = 0.1 scale = 1.5
		DoMorph time = 0.1 scale = 2.0
		DoMorph time = 0.1 scale = 1.39999998
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph time = 0.1 scale = 1.39999998
		DoMorph time = 0.15000001 scale = 0 alpha = 0
		Die
		FireEvent type = goal_got_reward_done
	endscript
	script goal_message_got_stat
		SetProps rgba = [43 95 53 128]
		DoMorph time = 0 pos = (320.0,214.0) scale = 0 alpha = 0
		DoMorph time = 0.5 alpha = 1
		if GotParam sound
			PlaySound <sound> vol = 150
		endif
		DoMorph time = 0.1 scale = 2.5
		DoMorph time = 0.1 scale = 1.5
		DoMorph time = 0.1 scale = 2.0
		DoMorph time = 0.1 scale = 1.39999998
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph time = 0.1 scale = 1.39999998
		DoMorph time = 0.15000001 scale = 0 alpha = 0
		Die
		FireEvent type = goal_got_reward_done
	endscript
	script goal_message_stat_up
		SetProps rgba = [33 112 15 128]
		DoMorph time = 0 pos = (320.0,195.0) scale = 0 alpha = 0
		DoMorph time = 0.2 alpha = 1
		if GotParam sound
			PlaySound <sound> vol = 150
		endif
		DoMorph time = 0.1 scale = 2.5
		DoMorph time = 0.1 scale = 1.5
		DoMorph time = 0.1 scale = 2.0
		DoMorph time = 0.1 scale = 1.39999998
		DoMorph pos = (321.0,196.0) time = 0.1
		DoMorph pos = (319.0,194.0) time = 0.1
		DoMorph time = 0.1 scale = 1.39999998
		DoMorph time = 0.15000001 scale = 0 alpha = 0
		Die
	endscript
	script goal_message_got_bigbucks
		SetProps rgba = [43 95 53 128]
		DoMorph time = 0 pos = (320.0,214.0) scale = 0 alpha = 0
		DoMorph time = 0.5 alpha = 1
		if GotParam sound
			PlaySound <sound> vol = 150
		endif
		DoMorph time = 0.1 scale = 1.70000005
		DoMorph time = 0.1 scale = 0.80000001
		DoMorph time = 0.1 scale = 1.20000005
		DoMorph time = 0.1 scale = 0.89999998
		DoMorph time = 0.1 scale = 1.0
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph time = 0.1 scale = 1.39999998
		DoMorph time = 0.15000001 scale = 0 alpha = 0
		Die
		FireEvent type = goal_got_reward_done
	endscript
	script goal_message_got_money
		SetProps rgba = [36 125 24 128]
		DoMorph time = 0 pos = (320.0,114.0) scale = 0 alpha = 0
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 scale = 1.70000005
		DoMorph time = 0.1 scale = 0.89999998
		DoMorph time = 0.1 scale = 1.0
		DoMorph alpha = 0.40000001 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.30000001 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph time = 0.1 scale = 1.39999998
		DoMorph time = 0.1 scale = 0 alpha = 0
		Die
		FireEvent type = goal_got_reward_done
	endscript
	script goal_message_got_money2
		SetProps rgba = [36 125 24 128]
		DoMorph time = 0 pos = (320.0,114.0) scale = 0 alpha = 0
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 scale = 1.70000005
		DoMorph time = 0.1 scale = 0.89999998
		DoMorph time = 0.1 scale = 1.0
		DoMorph alpha = 0.40000001 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.30000001 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.30000001 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.30000001 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.30000001 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07 scale = 1.0
		DoMorph time = 0.1 scale = 1.39999998
		DoMorph time = 0.1 scale = 0 alpha = 0
		Die
		FireEvent type = goal_got_reward_done
	endscript
	script goal_got_goal_point
		SetProps rgba = [43 95 53 128]
		DoMorph time = 0 pos = (320.0,214.0) scale = 0 alpha = 0
		DoMorph time = 0.5 alpha = 1
		DoMorph time = 0.1 scale = 2.5
		DoMorph time = 0.1 scale = 1.5
		DoMorph time = 0.1 scale = 2.0
		DoMorph time = 0.1 scale = 1.39999998
		DoMorph pos = (321.0,215.0) time = 0.1
		DoMorph pos = (319.0,213.0) time = 0.1
		DoMorph time = 0.5 alpha = 0 pos = (320.0,384.0) rgb = [50 50 50]
		Die
		FireEvent type = goal_got_goal_point_done
	endscript
	script panel_message_current_goal_key_combo
		SetProps just = [right top] rgba = [128 128 128 128]
		DoMorph pos = (445.0,175.0)
		DoMorph pos = (445.0,175.0) time = 1.20000005
		DoMorph pos = (630.0,63.0) scale = 1.29999995 time = 0.1
		DoMorph pos = (630.0,63.0) scale = 0.80000001 time = 0.11
		while
			DoMorph alpha = 0
			wait <blink_time> seconds
			DoMorph alpha = 1
			wait <blink_time> seconds
		repeat 6
	endscript
	script goal_message_got_gap
		SetProps rgba = [20 98 114 108]
		DoMorph time = 0 pos = (320.0,74.0) scale = 0 alpha = 0
		DoMorph time = 0.1 alpha = 1
		DoMorph time = 0.1 scale = 1.89999998
		DoMorph time = 0.1 scale = 0.89999998
		DoMorph time = 0.1 scale = 1.20000005
		DoMorph time = 0.1 scale = 0.94999999
		DoMorph time = 0.1 scale = 1.0
		DoMorph alpha = 0.40000001 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.30000001 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.30000001 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.30000001 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.30000001 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.30000001 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.30000001 time = 0.07
		DoMorph alpha = 1 time = 0.07
		DoMorph alpha = 0.60000002 time = 0.07
		DoMorph alpha = 1 time = 0.07 scale = 1.0
		DoMorph time = 0.1 scale = 1.70000005
		DoMorph time = 0.1 scale = 0 alpha = 0
		Die
	endscript
	goal_pro_last_names = {
		tony = "Hawk"
		bam = "Margera"
		bucky = "Lasek"
		chad = "Muska"
		jamie = "Thomas"
		rodney = "Mullen"
		eric = "Koston"
		rune = "Glifberg"
		geoff = "Rowley"
		andrew = "Reynolds"
		steve = "Caballero"
		elissa = "Steamer"
		bob = "Burnquist"
		kareem = "Campbell"
		paul = "Rodriguez"
		Arto = "Saari"
		Mike = "Vallely"
		Gene = "Simmons"
		Iron = "Iron Man"
		Creature = "Creature"
		Ped = "Pedestrian"
	}
	goal_pro_last_name_checksums = {
		tony = Hawk
		bam = Margera
		bucky = Lasek
		chad = Muska
		jamie = Thomas
		rodney = Mullen
		eric = Koston
		rune = Glifberg
		geoff = Rowley
		andrew = Reynolds
		steve = Caballero
		elissa = Steamer
		bob = Burnquist
		kareem = Campbell
		custom = custom
		jenna = jameson
		jango = fett
		eddie = eddie
		Mike = vallely
	}
