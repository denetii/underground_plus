
	accelCarRot = -1.0
	decelCarRot = 3.0
	speedCarRot = 0.125
	accelCarRotFactor = 5.0
	driving_parked_car = 0
	script SetupDrivableCar
		if GameModeEquals is_creategoals
			return
		endif
		RunScriptOnObject car_set_exceptions Id = <Id> Params = {<...>}
	endscript
	script car_set_exceptions trigger_radius = 16
		if ObjectExists Id = goal_start_dialog
			speech_box_exit anchor_id = goal_start_dialog
		endif
		SetTags control_type = <control_type> restart_node = <restart_node> exit_node = <exit_node> destroy_car = <destroy_car>
		ClearException SkaterOutOfRadius
		Obj_SetInnerRadius <trigger_radius>
		SetException ex = SkaterInRadius scr = car_inner_radius_handler
		Block
	endscript
	script car_inner_radius_handler
		GetSkaterId
		<skaterId> = <objId>
		Obj_GetId
		if CustomParkMode editing
			return
		endif
		if ObjectExists Id = goal_start_dialog
			<should_destroy> = 0
			if <skaterId>::IsInBail
				<should_destroy> = 1
			endif
			if SkaterCurrentScorePotGreaterThan 0
				<should_destroy> = 1
			endif
			if NOT GoalManager_CanStartGoal
				<should_destroy> = 1
			endif
			if (in_cat_preview_mode = 1)
				<should_destroy> = 1
			endif
			if (<should_destroy> = 1)
				DestroyScreenElement Id = goal_start_dialog
			endif
		else
			if ObjectExists Id = root_window
				root_window::GetTags
				if GotParam menu_state
					if (<menu_state> = on)
						return
					endif
				endif
			endif
			if (in_cat_preview_mode = 0)
				if GoalManager_CanStartGoal
					<skater_ready_for_goal> = 0
					if NOT <skaterId>::Driving
						if <skaterId>::OnGround
							<skater_ready_for_goal> = 1
						else
							if <skaterId>::Walking
								<skater_ready_for_goal> = 1
							endif
						endif
					endif
					if (<skater_ready_for_goal> = 1)
						if NOT <skaterId>::IsInBail
							if NOT SkaterCurrentScorePotGreaterThan 0
								<objId>::Obj_SetOuterRadius 20
								<objId>::SetException ex = SkaterOutOfRadius scr = car_refuse
								FormatText TextName = accept_text "Press \m5 to drive."
								create_speech_box {
									anchor_id = goal_start_dialog
									text = <accept_text>
									no_pad_choose
									no_pad_start
									pad_circle_script = car_accept
									pad_circle_params = {objId = <objId>}
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
		endif
	endscript
	script car_refuse anchor_id = goal_start_dialog
		ClearException SkaterOutOfRadius
		speech_box_exit anchor_id = <anchor_id>
	endscript
	script car_accept anchor_id = goal_start_dialog
		ClearException SkaterInRadius
		speech_box_exit anchor_id = goal_start_dialog
		<objId>::car_begin_driving_run
	endscript
	script car_begin_driving_run
		if NOT GameModeEquals is_singlesession
			GoalManager_DeactivateAllGoals
		endif
		Obj_GetId
		GoalManager_GetLevelPrefix
		FormatText ChecksumName = ReadyLevelScript "%l_KillVehicles" l = <level_prefix>
		if ScriptExists <ReadyLevelScript>
			<ReadyLevelScript> CalledByParkedCar ParkedCar = <objId>
		endif
		GetTags
		goal_initialize_skater control_type = <control_type> restart_node = <restart_node> Exitable
		if GotParam destroy_car
			kill name = <destroy_car>
		endif
		Change driving_parked_car = 1
		SpawnScript car_wait_for_exit_request
		PlayerVehicle::SetTags ParkedCarId = <objId> ExitNode = <exit_node> DestroyCar = <destroy_car>
		if PlayerVehicle::Vehicle_HandbrakeActive
			create_panel_block Id = current_goal text = "\b3 = Accelerate\n\b1 = Brake/Reverse\n\b0 = Ditch" style = panel_message_goal
		else
			create_panel_block Id = current_goal text = "\b3 = Accelerate\n\b1 = Brake/Reverse\n\bf = Handbrake\n\b0 = Ditch" style = panel_message_goal
		endif
		Die
	endscript
	script car_wait_for_exit_request
		Wait 0.5 Seconds
		WaitForEvent Type = ExitVehicleRequest
		Goto handle_exit_vehicle_request
	endscript
	script handle_exit_vehicle_request
		PlayerVehicle::GetTags
		car_end_driving_run
		ResetSkaters node_name = <ExitNode>
		MakeSkaterGoto HandBrake
	endscript
	script car_end_driving_run
		KillSpawnedScript name = car_wait_for_exit_request
		if ObjectExists Id = current_goal
			DestroyScreenElement Id = current_goal
		endif
		PlayerVehicle::GetTags
		GoalManager_GetLevelPrefix
		FormatText ChecksumName = RestoreLevelScript "%l_CreateVehicles" l = <level_prefix>
		if ScriptExists <RestoreLevelScript>
			<RestoreLevelScript> CalledByParkedCar ParkedCar = <ParkedCarId>
		endif
		Create name = <ParkedCarId>
		if GotParam DestroyCar
			if NOT IsAlive name = <DestroyCar>
				Create name = <DestroyCar>
			endif
		endif
		Change driving_parked_car = 0
	endscript
