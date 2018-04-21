
	check_for_unplugged_controllers = 0
	TimeOfDayDebug = 0
	script PrintState
		if InAir
			printf "In air"
		endif
		if OnGround
			printf "On ground"
		endif
		if OnWall
			printf "On wall"
		endif
		if OnLip
			printf "On lip"
		endif
		if OnRail
			printf "OnRail"
		endif
	endscript
	script DefaultGapScript
		PlaySound HUD_jumpgap
		if Skating
			if OnGround
				LandGapsImmediately = 1
			endif
		else
			if Walking
				LandGapsImmediately = 1
			else
				if Driving
					LandGapsImmediately = 1
				endif
			endif
		endif
		if GotParam LandGapsImmediately
			GetNumberOfNonGapTricks
			if (<NumberOfNonGapTricks> = 0)
				LandSkaterTricks
			endif
		endif
	endscript
	script SetAllStats value = 3
		printf "Overriding Stats to %d" d = <value>
		SetStatOverride <value>
	endscript
	script ToggleMinMetrics
		ToggleMetricItem item = METRIC_TIME
		ToggleMetricItem item = METRIC_TOTALPOLYS
		ToggleMetricItem item = METRIC_VERTS
		ToggleMetricItem item = METRIC_RESOURCEALLOCS
		ToggleMetricItem item = METRIC_TEXTUREUPLOADS
		ToggleMetricItem item = METRIC_VU1
		ToggleMetricItem item = METRIC_DMA1
		ToggleMetricItem item = METRIC_DMA2
		ToggleMetricItem item = METRIC_IHANDLERTIME
		ToggleMetricItem item = METRIC_SKYCACHE
		ToggleMetricItem item = METRIC_VIDEOMODE
		ToggleMetricItem item = METRIC_MEMFREE
		ToggleMetricItem item = METRIC_REGIONINFO
	endscript
	script MaybePause Button = r1
		if held <Button>
			while
			repeat 800000
		endif
	endscript
	script WaitOneGameFrame
		Wait 1 gameframes
	endscript
	script WaitAnimFinished
		Obj_WaitAnimFinished
	endscript
	script WaitAnimWhilstChecking
		while
			DoNextTrick
			if GotParam AndManuals
				DoNextManualTrick
			endif
			if AnimFinished
				break
			endif
			Wait 1 GameFrame
		repeat
	endscript
	script WaitWhilstChecking
		GetStartTime
		while
			DoNextTrick
			if GotParam AndManuals
				DoNextManualTrick
			endif
			Wait 1 GameFrame
			GetElapsedTime StartTime = <StartTime>
			if (<ElapsedTime> > <Duration>)
				break
			endif
		repeat
	endscript
	script Reverse
		PlayAnim Anim = Current From = Current To = 0
	endscript
	script Obj_WaitForFlag
		while
			if Obj_FlagSet <...>
				break
			endif
			WaitOneGameFrame
		repeat
	endscript
	script PollUntilFinished
		if GotParam Func
			while
				if <Func> <...>
					break
				endif
				Wait 1 GameFrame
			repeat
		else
			while
				printf "AAAAAAAARGH !!!!  PollUntilFinished needs a Func parameter !"
				Wait 1 GameFrame
			repeat
		endif
	endscript
	script autolaunch
		if GotParam game
			SetGameType <game>
		else
			SetGameType career
		endif
		SetCurrentGameType
		request_level level = <level>
		cleanup_before_loading_level
		load_requested_level
	endscript
	script change_level
		change is_changing_levels = 1
		if LevelIs load_sk5ed
			SwitchOffRailEditor
		endif
		ResetScore
		SetMusicLooping 0
		if NOT IsObserving
			Skater::reset_model_lights
		endif
		if ObjectExists id = Skater2
			Skater2::reset_model_lights
		endif
		change check_for_unplugged_controllers = 0
		if GotParam next_level_script
			change next_level_script = <next_level_script>
		endif
		if NOT IsObserving
			Skater::ClearPanel_Landed
		endif
		if NOT GotParam no_levelUnload
			printf "performing LevelUnload"
			GoalManager_LevelUnload
		endif
		ResetScore
		ResetScorePot
		hide_console_window
		GoalManager_LevelUnload
		GoalManager_DeactivateAllGoals
		if NOT IsObserving
			Skater::StatsManager_DeactivateGoals
		endif
		ScreenElementSystemCleanup
		if NOT inNetGame
			hide_everything
		endif
		kill_blur
		if InSplitScreenGame
			launch_two_player
		endif
		if IsXbox
			DisplayLoadingScreen freeze
		endif
		ChangeLevel <...>
	endscript
	script QuickScript
		printf "Running quickscript...."
		ReloadNodeArray
		if ScriptExists LoadAllParticleTextures
			LoadAllParticleTextures
		endif
		Retry
	endscript
	script ReloadScene
		Skater::SetCustomRestart Set
		if GotParam scene
			if UnloadScene <...>
				Cleanup
				if NOT inNetGame
					AllocatePathManMemory
				endif
				FormatText ChecksumName = struct_name "level_%s" s = <scene>
				AddParams <struct_name>
				if GotParam sky
					LoadScene scene = <sky>
				endif
				LoadScene <...>
				if GotParam level_name
					SetLevelName <level_name>
				else
					SetLevelName <level>
				endif
				if GotParam qb
					LoadNodeArray <qb>
				endif
				if GotParam level_qb
					LoadQB <level_qb> LevelSpecific
				endif
				if GotParam level_sfx_qb
					LoadQB <level_sfx_qb> LevelSpecific
				endif
				LoadTerrain
				if GotParam temp_script
					<temp_script>
				endif
				if NOT inNetGame
					PushMemProfile "Level Specific Anims"
					load_level_anims
					PopMemProfile
				endif
				PushMemProfile "Level Cameras"
				LoadCameras
				PopMemProfile
				if ScriptExists LoadObjectAnims
					PushMemProfile "Object Anims"
					LoadObjectAnims
					PopMemProfile
				endif
				if ScriptExists LoadAllParticleTextures
					LoadAllParticleTextures
				endif
				if GotParam startup_script
					<startup_script>
				endif
				LoadCollision <...>
				ParseNodeArray
				if GotParam setup_script
					<setup_script>
				endif
				refresh_poly_count
				if (SHOWPOLYS_ONQUICKVIEW)
					if (poly_count_on = 0)
						show_poly_count
					endif
				endif
			else
				autolaunch level = <scene>
			endif
		else
			script_assert "No scene param specified for autolaunching"
		endif
		Skater::SkipToCustomRestart
		if IsTrue TimeOfDayDebug
			set_all_light_values level_only
		endif
	endscript
	script AddToScene
		if GotParam add
		else
			add "update"
		endif
		if GotParam scene
			AddScene scene = <scene> add = <add>
			AddCollision scene = <scene> add = <add>
		else
			script_assert "No scene param specified for autolaunching"
		endif
	endscript
	script LoadLevelGeometry
		if GotParam sky
			LoadScene scene = <sky>
		endif
		if GotParam level
			LoadScene scene = <level>
			LoadCollision scene = <level>
		endif
	endscript
	script QuickStart scene = "default" sky = "ru_sky"
		LoadScene scene = <sky>
		LoadScene scene = <scene>
		gameflow StandardGameFlowToggleView
	endscript
	script VerifyParam
		if GotParam <param>
		else
			printf "Required param not found in script function:"
			printf <param>
			printf <Func>
			script_assert "Terminating..."
		endif
	endscript
	TRIGGER_THROUGH = 0
	TRIGGER_SKATE_OFF_EDGE = 1
	TRIGGER_JUMP_OFF = 2
	TRIGGER_LAND_ON = 3
	TRIGGER_SKATE_OFF = 4
	TRIGGER_SKATE_ONTO = 5
	TRIGGER_BONK = 6
	TRIGGER_LIP_ON = 7
	TRIGGER_LIP_OFF = 8
	TRIGGER_LIP_JUMP = 9
	CANCEL_GROUND = 1
	CANCEL_AIR = 2
	CANCEL_RAIL = 4
	CANCEL_WALL = 8
	CANCEL_LIP = 16
	CANCEL_WALLPLANT = 32
	CANCEL_MANUAL = 64
	CANCEL_HANG = 128
	CANCEL_LADDER = 256
	PURE_GROUND = 510
	PURE_AIR = 509
	PURE_RAIL = 507
	PURE_WALL = 503
	PURE_LIP = 495
	PURE_WALLPLANT = 479
	PURE_MANUAL = 447
	PURE_HANG = 383
	PURE_LADDER = 255
	REQUIRE_GROUND = 65536
	REQUIRE_AIR = 131072
	REQUIRE_RAIL = 262144
	REQUIRE_WALL = 524288
	REQUIRE_LIP = 1048576
	REQUIRE_WALLPLANT = 2097152
	REQUIRE_MANUAL = 4194304
	REQUIRE_HANG = 8388608
	REQUIRE_LADDER = 16777216
	CANCEL_SKATE = 512
	CANCEL_WALK = 1024
	CANCEL_DRIVE = 2048
	REQUIRE_SKATE = 33554432
	REQUIRE_WALK = 67108864
	REQUIRE_DRIVE = 134217728
	script CareerRestartLevel
		CareerStartLevel level = -1
	endscript
	script DefaultHiScoreScript
	endscript
	script DefaultProScoreScript
	endscript
	script DisablePause
		AllowPause off
	endscript
	script EnablePause
		AllowPause
	endscript
	script LaunchLocalMessage
		LaunchLocalPanelMessage message_prop_default <...>
	endscript
	mFD_SKATABLE = 1
	mFD_NOT_SKATABLE = 2
	mFD_WALL_RIDABLE = 4
	mFD_VERT = 8
	mFD_NON_COLLIDABLE = 16
	mFD_DECAL = 32
	mFD_TRIGGER = 64
	mFD_CAMERA_COLLIDABLE = 128
	mFD_NO_SKATER_SHADOW = 256
	mFD_SKATER_SHADOW = 512
	mFD_NO_SKATER_SHADOW_WALL = 1024
	mFD_UNDER_OK = 2048
	mFD_INVISIBLE = 4096
	mFD_CASFACEFLAGSEXIST = 8192
	mFD_PASS_1_DISABLED = 16384
	mFD_PASS_2_ENABLED = 32768
	mFD_PASS_3_ENABLED = 65536
	mFD_PASS_4_ENABLED = 131072
	mFD_RENDER_SEPARATE = 262144
	mFD_LIGHTMAPPED = 524288
	mFD_NON_WALL_RIDABLE = 1048576
	mFD_NON_CAMERA_COLLIDABLE = 2097152
	mFD_EXPORT_COLLISION = 4194304
	script show_all
		DebugRenderIgnore
	endscript
	script show_vert
		DebugRenderIgnore ignore_0 = mFD_VERT
	endscript
	script show_wallride
		DebugRenderIgnore ignore_0 = mFD_WALL_RIDABLE
	endscript
	script show_wall_ridable
		DebugRenderIgnore ignore_0 = mFD_WALL_RIDABLE
	endscript
	script show_trigger
		DebugRenderIgnore ignore_0 = mFD_TRIGGER
	endscript
	script show_invisible
		DebugRenderIgnore ignore_0 = mFD_INVISIBLE
	endscript
	script show_triggers
		show_trigger
	endscript
	script show_CAMERA
		DebugRenderIgnore ignore_0 = mFD_NON_CAMERA_COLLIDABLE
	endscript
	script show_CAMERA_COLLIDE
		DebugRenderIgnore ignore_0 = mFD_CAMERA_COLLIDABLE
	endscript
	script show_skatable
		DebugRenderIgnore ignore_0 = mFD_SKATABLE
	endscript
	script show_not_skatable
		DebugRenderIgnore ignore_0 = mFD_NOT_SKATABLE
	endscript
	script show_no_skater_shadow
		DebugRenderIgnore ignore_0 = mFD_NO_SKATER_SHADOW
	endscript
	script show_skater_shadow
		DebugRenderIgnore ignore_0 = mFD_SKATER_SHADOW
	endscript
	script show_no_skater_shadow_wall
		DebugRenderIgnore ignore_0 = mFD_NO_SKATER_SHADOW_WALL
	endscript
	script show_non_collidable
		DebugRenderIgnore ignore_0 = mFD_NON_COLLIDABLE
	endscript
	script show_collidable
		DebugRenderIgnore ignore_1 = mFD_NON_COLLIDABLE
	endscript
	script frame_advance
		spawnscript s_frame_advance
		toggleviewmode
		unpausegame
		unpauseskaters
	endscript
	script s_frame_advance
		toggleviewmode
		toggleviewmode
		pausegame
		pauseskaters
	endscript
	script JumpSkaterToNode
		GoalManager_DeactivateAllMinigames
		MakeSkaterGoto JumpToNode Params = {NodeName = <NodeName> <...>}
	endscript
	script JumpToNode
		if NodeExists <NodeName>
			StopBalanceTrick
			SetSpeed 0
			if GotParam MoveUpABit
				Move y = 10
			endif
			Obj_MoveToNode name = <NodeName> Orient NoReset
			Goto GroundGone
		endif
	endscript
	script ScreenElementSystemCleanup
		printf "************ CLEANING UP SYSTEM ***************"
		if ObjectExists id = root_window
			DestroyScreenElement id = root_window
			ScreenElementSystemInit
			SetScreenElementProps {
				id = root_window
				event_handlers = [
					{pad_start handle_start_pressed}
				]
				replace_handlers
				tags = {menu_state = off}
			}
			FireEvent type = focus target = root_window
			create_panel_stuff
		endif
	endscript
	script CreateLocal
		create <...>
	endscript
	script KillLocal
		kill <...>
	endscript
	script KillElement3d
		Wait 1 GameFrame
		Die
	endscript
	script attach_arrow_to_object model = "Arrow"
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			parent = root_window
			type = Element3D
			id = <arrow_id>
			model = <model>
			HoverParams = {Amp = 10 Freq = 2}
			AngVelY = 0.16
			ParentParams = {name = <object_id> (0.0,100.0,0.0) IgnoreParentsYRotation}
		}
	endscript
	script attach_arrow_to_node model = "GoalArrow" offset = (0.0,100.0,0.0)
		SetScreenElementLock id = root_window off
		printstruct <...>
		CreateScreenElement {
			parent = root_window
			type = Element3D
			id = <arrow_id>
			model = <model>
			HoverParams = {Amp = 10 Freq = 2}
			AngVelY = 0.16
			ParentParams = {node = <node> <offset> IgnoreParentsYRotation}
		}
	endscript
	script setup_ped_speech {
			inner_radius = 8
			outer_radius = 24
			speed = 20
			pad_choose_script = ped_speech_exit
		}
		<ped_id>::Obj_ClearException SkaterInRadius
		<ped_id>::Obj_ClearException SkaterOutOfRadius
		<ped_id>::Obj_SetInnerRadius <inner_radius>
		<ped_id>::Obj_SetException ex = SkaterInRadius scr = ped_speech_got_trigger Params = <...>
	endscript
	script ped_speech_got_trigger
		if ObjectExists id = ped_speech_dialog
			<should_destroy> = 0
			if Skater::IsInBail
				<should_destroy> = 1
			endif
			if NOT GoalManager_CanStartGoal
				<should_destroy> = 1
			endif
			if GoalManager_IsInCompetition
				<should_destroy> = 1
			endif
			if (<should_destroy> = 1)
				DestroyScreenElement id = ped_speech_dialog
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
			if NOT GoalManager_CanStartGoal
				return
			endif
			if GoalManager_IsInCompetition
				return
			endif
			if Skater::OnGround
				if NOT Skater::IsInBail
					Obj_SetOuterRadius <outer_radius>
					Obj_SetException ex = SkaterOutOfRadius scr = ped_speech_refuse Params = <...>
					if NOT GotParam display_name
						<display_name> = "Ped"
					endif
					FormatText TextName = accept_text "%s: \m5 to talk." s = <display_name>
					if ObjectExists id = ped_speech_dialog
						DestroyScreenElement id = ped_speech_dialog
					endif
					create_speech_box {
						anchor_id = ped_speech_dialog
						text = <accept_text>
						no_pad_choose
						no_pad_start
						pad_circle_script = ped_speech_accept
						pad_circle_params = <...>
						bg_rgba = [100 100 100 128]
						text_rgba = [128 128 128 128]
						pos = (320.0,400.0)
						font = small
						z_priority = 5
					}
				endif
			endif
		endif
	endscript
	script ped_speech_accept
		speech_box_exit
		if NOT ObjectExists <ped_id>
			return
		endif
		DeBounce X time = 0.5
		if Skater::OnGround
			if NOT SkaterCurrentScorePotGreaterThan 0
				Wait 5 frame
				if Skater::OnGround
					ped_speech_accept2 <...>
				else
					if NOT Skater::RightPressed
						if NOT Skater::LeftPressed
							if NOT Skater::UpPressed
								if NOT Skater::DownPressed
									ped_speech_accept2 <...>
								endif
							endif
						endif
					endif
				endif
			endif
		else
			if NOT Skater::RightPressed
				if NOT Skater::LeftPressed
					if NOT Skater::UpPressed
						if NOT Skater::DownPressed
							ped_speech_accept2 <...>
						endif
					endif
				endif
			endif
		endif
	endscript
	script ped_speech_accept2
		if NOT GameModeEquals is_singlesession
			GoalManager_DeactivateAllGoals
		endif
		pauseskaters
		<ped_id>::Obj_ClearException SkaterInRadius
		if ObjectExists id = ped_speech_dialog
			DestroyScreenElement id = ped_speech_dialog
		endif
		if GotParam activation_script
			Skater::Obj_SpawnScript <activation_script> Params = <activation_script_params>
		endif
		if GotParam cam_anim
			PlaySkaterCamAnim name = <cam_anim>
		endif
		create_speech_box <...>
	endscript
	script ped_speech_refuse
		Obj_ClearException SkaterOutOfRadius
		speech_box_exit anchor_id = ped_speech_dialog
		ped_speech_reset <...>
	endscript
	script ped_speech_set_outer_trigger_radius
		Obj_ClearException SkaterInRadius
		Obj_SetOuterRadius <outer_radius>
		Obj_SetException ex = SkaterOutOfRadius scr = ped_speech_reset Params = <...>
	endscript
	script ped_speech_reset
		if GotParam outer_radius_script
			<outer_radius_script> <outer_radius_params>
		endif
		if NOT GotParam no_repeat
			setup_ped_speech <...>
		endif
	endscript
	script ped_speech_exit
		unpauseskaters
		speech_box_exit
	endscript
	script GetStackedScreenElementPos
		if GotParam XY
			GetStackedScreenElementPosOnXY <...>
		else
			if GotParam X
				if GotParam y
					GetStackedScreenElementPosOnXY <...>
				else
					GetStackedScreenElementPosOnX <...>
				endif
			else
				if GotParam y
					GetStackedScreenElementPosOnY <...>
				else
					script_assert "GetStackedScreenElementPos called without an axis"
				endif
			endif
		endif
		return pos = <pos>
	endscript
	script GetStackedScreenElementPosOnX
		GetScreenElementPosition id = <id>
		GetScreenElementDims id = <id>
		<unit_pair> = (1.0,0.0)
		if GotParam negative
			<unit_pair> = (-1.0,0.0)
		endif
		if GotParam offset
			return pos = (<ScreenElementPos> + (<unit_pair> * <width> + <offset>))
		else
			return pos = (<ScreenElementPos> + (<unit_pair> * <width>))
		endif
	endscript
	script GetStackedScreenElementPosOnY
		GetScreenElementPosition id = <id>
		GetScreenElementDims id = <id>
		<unit_pair> = (0.0,1.0)
		if GotParam negative
			<unit_pair> = (0.0,-1.0)
		endif
		if GotParam offset
			return pos = (<ScreenElementPos> + (<unit_pair> * <height> + <offset>))
		else
			return pos = (<ScreenElementPos> + (<unit_pair> * <height>))
		endif
	endscript
	script GetStackedScreenElementPosOnXY
		GetScreenElementPosition id = <id>
		GetScreenElementDims id = <id>
		<x_unit_pair> = (1.0,0.0)
		<y_unit_pair> = (0.0,1.0)
		if GotParam negative
			<x_unit_pair> = (-1.0,0.0)
			<y_unit_pair> = (0.0,-1.0)
		endif
		if GotParam offset
			return pos = (<ScreenElementPos> + (<y_unit_pair> * <height> + <x_unit_pair> * <width> + <offset>))
		else
			return pos = (<ScreenElementPos> + (<y_unit_pair> * <height> + <x_unit_pair> * <width>))
		endif
	endscript
	script kill_blur
		if NOT InSplitScreenGame
			KillSpawnedScript name = pulse_blur_script_down
			KillSpawnedScript name = pulse_blur_script_up
			SetScreenBlur <start>
		endif
	endscript
	script pulse_blur start = 200 end = 0 speed = 4
		KillSpawnedScript name = pulse_blur_script_down
		KillSpawnedScript name = pulse_blur_script_up
		if (<start> > <end>)
			spawnscript pulse_blur_script_down Params = <...>
		else
			spawnscript pulse_blur_script_up Params = <...>
		endif
	endscript
	script pulse_blur_script_down
		if GotParam force_pulse
			while
				if (<start> < <end>)
					SetScreenBlur <end>
					break
				endif
				SetScreenBlur <start>
				<start> = (<start> - <speed>)
				Wait 1 GameFrame
			repeat
			return
		endif
		if NOT InSplitScreenGame
			while
				if (<start> < <end>)
					SetScreenBlur <end>
					break
				endif
				SetScreenBlur <start>
				<start> = (<start> - <speed>)
				Wait 1 GameFrame
			repeat
		endif
	endscript
	script pulse_blur_script_up
		if GotParam force_pulse
			while
				if (<start> > <end>)
					SetScreenBlur <end>
					break
				endif
				SetScreenBlur <start>
				<start> = (<start> + <speed>)
				Wait 1 GameFrame
			repeat
			return
		endif
		if NOT InSplitScreenGame
			while
				if (<start> > <end>)
					SetScreenBlur <end>
					break
				endif
				SetScreenBlur <start>
				<start> = (<start> + <speed>)
				Wait 1 GameFrame
			repeat
		endif
	endscript
	script NullScript
	endscript
	script BloodOff
	endscript
	script mark_first_input_received
		printf "mark_first_input_received"
		GetCurrentSkaterProfileIndex
		GetSkaterId
		if GotParam device_num
			<controller_index> = <device_num>
		else
			<controller_index> = <controller>
		endif
		BindControllerToSkater skater_heap_index = <currentSkaterProfileIndex> controller = <controller_index>
		FirstInputReceived
		change check_for_unplugged_controllers = 1
	endscript
	script lighting target = 8421504 percent = 0
		if GotParam lights
			if GotParam id
				FakeLights percent = <lights> id = <id> prefix = <prefix>
			else
				if GotParam prefix
					FakeLights percent = <lights> prefix = <prefix>
				else
					FakeLights percent = <lights> prefix = TRG_LevelLight
				endif
			endif
		endif
		if GotParam color
			if NOT GotParam sky
				<sky> = <color>
			endif
			SetSceneColor color = <color> sky = <sky> lightgroup = <lightgroup>
		endif
	endscript
	script DumpMetrics
		GetMetrics
		printf
		printf "Dumping Metrics Structure"
		printstruct <...>
	endscript
	script recreate
		if ObjectExists id = <id>
			<id>::Die
		endif
		create name = <id>
	endscript
	dummy_metrics_struct = {
		mainscene = 0
		skyscene = 0
		metrics = 0
		Sectors = 0
		ColSectors = 0
		Verts = 0
		BasePolys = 0
		TextureMemory = 0
	}
	test_letter_a = {
		model = "gameobjects\skate\letter_a\letter_a.mdl"
	}
	proximobj_composite_structure = [
		{component = sound}
		{component = stream}
	]
	gameobj_composite_structure = [
		{component = suspend}
		{component = motion}
		{component = skaterproximity}
		{component = sound}
	]
	bouncy_composite_structure = [
		{component = suspend}
		{component = rigidbody}
		{component = model UseModelLights}
		{component = sound}
        {component = shadow ShadowType = detailed}
	]
	particle_composite_structure = [
		{component = suspend}
		{component = particle}
	]
	moving_particle_composite_structure = [
		{component = suspend}
		{component = motion}
		{component = particle}
	]
	skatercam_composite_structure = [
		{component = cameralookaround}
		{component = skatercamera}
		{component = walkcamera}
		{component = camera}
		{component = input}
	]
	viewercam_composite_structure = [
		{component = camera}
	]
	parkedcam_composite_structure = [
		{component = camera}
	]
	menucam_composite_structure =
	[
		{component = camera}
	]
	explosion_composite_structure =
	[
		{component = suspend}
		{component = particle}
	]
	fireball_composite_structure =
	[
		{component = velocity}
		{component = suspend}
		{component = collideanddie}
		{component = particle}
	]
	server_fireball_composite_structure =
	[
		{component = velocity}
		{component = suspend}
		{component = projectilecollision}
		{component = collideanddie}
		{component = particle}
	]
	script Restore_skater_camera
		if IsObserving
			SetActiveCamera id = SkaterCam0
		else
			if NOT LocalSkaterExists
				SetActiveCamera id = SkaterCam0
			else
				if NOT Skater::Driving
					SetActiveCamera id = SkaterCam0
				else
					SetActiveCamera id = PlayerVehicleCamera
				endif
			endif
		endif
		if NOT LevelIs load_skateshop
			if NOT LevelIs load_cas
				if NOT LevelIs load_boardshop
					if NOT IsObserving
						if LocalSkaterExists
							Skater::Obj_EnableScaling
						endif
					endif
				endif
			endif
		endif
	endscript
	script disable_skater_scaling
		if NOT LevelIs load_skateshop
			if NOT LevelIs load_cas
				if NOT LevelIs load_boardshop
					if NOT IsObserving
						if NOT GetGlobalFlag flag = CHEAT_KID
							Skater::Obj_DisableScaling
						endif
					endif
				endif
			endif
		endif
	endscript
	script create_menu_camera
		if NOT ObjectExists id = menu_cam
			MemPushContext FrontEndHeap
			printf "Creating camera on front end heap"
			CreateCompositeObject {
				Components = menucam_composite_structure
				Params = {name = menu_cam}
			}
			MemPopContext
		endif
	endscript
	script SetSkaterCamOverride
		SkaterCam0::SC_SetSkaterCamOverride <...>
	endscript
	script ClearSkaterCamOverride
		SkaterCam0::SC_ClearSkaterCamOverride <...>
	endscript
	script ShakeCamera
		SkaterCam0::SC_ShakeCamera <...>
	endscript
	script empty_script
	endscript
	script HideSkaterAndMiscSkaterEffects
		KillAllTextureSplats
		Skater::SparksOff
		Skater::SwitchOnBoard
		Skater::RemoveSkaterFromWorld
	endscript
	script SwitchToMenu
		printf "SwitchToMenu"
	endscript
	script ResetLookAround
		printf "ResetLookAround is not currently working....."
	endscript
	script toggle_framerate
		switch lock_framerate
			case 0
				change lock_framerate = 2
			case 1
				change lock_framerate = 2
			case 2
				change lock_framerate = 1
		endswitch
	endscript
	script CalcPosRelative ob = Skater dx = 0 dy = 0 dz = 0
		<ob>::Obj_GetPosition
		<ob>::Obj_GetOrientation
		unit_z = ((1.0,0.0,0.0) * <X> + (0.0,1.0,0.0) * <y> + (0.0,0.0,1.0) * <z>)
		unit_x = ((0.0,1.0,0.0) * <unit_z>)
		unit_y = (<unit_z> * <unit_x>)
		pos = (<pos> + <dx> * <unit_x> + <dy> * <unit_y> + <dz> * <unit_z>)
		return X = (<pos>.(1.0,0.0,0.0)) y = (<pos>.(0.0,1.0,0.0)) z = (<pos>.(0.0,0.0,1.0)) pos = <pos>
	endscript
	script Forced_Create
		if GotParam prefix
			kill prefix = <prefix>
			create prefix = <prefix>
		else
			if GotParam name
				if NodeExists <name>
					kill name = <name>
					create name = <name>
				else
					printf "### Forced_Create: %n does not exist" n = <name>
				endif
			else
				printf "### Forced_Create: Must specifiy a name or prefix"
			endif
		endif
	endscript
	script loadspecial
	endscript
	skater_special_index = 0
	script find_special_name
	endscript
	have_loaded_permanent = 0
	have_loaded_unloadable = 0
	have_loaded_net = 0
	script do_load_permanent
		if (have_loaded_permanent)
		else
			if IsNGC
				LoadPreFile "anims.pre"
				PushMemProfile "Permanent Anims"
				MemPushContext TopDownHeap
				load_permanent_anims
				MemPopContext
				PopMemProfile
				UnloadPreFile "anims.pre"
			else
				do_unload_unloadable
				PushMemProfile "Permanent Anims"
				MemPushContext TopDownHeap
				SetDefaultPermanent 1
				LoadPipPre "anims.pre"
				load_permanent_anims use_pip
				SetDefaultPermanent 0
				MemPopContext
				PopMemProfile
			endif
			change have_loaded_permanent = 1
		endif
	endscript
	script do_unload_permanent
		if NOT IsNGC
			if (have_loaded_permanent)
				load_permanent_anims LoadFunction = UnloadAnim
				printf " ------------------ UnloadPipPre anims.pre"
				if NOT UnloadPipPre "anims.pre"
					script_assert "couldn't unload pip pre"
				endif
				change have_loaded_permanent = 0
			endif
		endif
	endscript
	script do_load_unloadable load_peds = 1
		printf "**************************** do_load_unloadable"
		if inNetGame
			load_peds = 0
		endif
		if (<load_peds> = 1)
			if (have_loaded_unloadable)
			else
				if (have_loaded_net)
					do_unload_unloadable
				endif
				do_load_permanent
				if IsNGC
					LoadPreFile "unloadableanims.pre"
					PushMemProfile "Unloadable Anims"
					MemPushContext TopDownHeap
					load_unloadable_anims
					MemPopContext
					PopMemProfile
					UnloadPreFile "unloadableanims.pre"
				else
					PushMemProfile "Unloadable Anims"
					MemPushContext TopDownHeap
					LoadPipPre "unloadableanims.pre"
					SetDefaultPermanent 1
					load_unloadable_anims use_pip
					SetDefaultPermanent 0
					MemPopContext
					PopMemProfile
				endif
				RunScriptOnComponentType component = animation target = InvalidateCache Params = {}
				change have_loaded_unloadable = 1
			endif
		else
			if NOT IsNGC
				if (have_loaded_net)
				else
					if (have_loaded_unloadable)
						do_unload_unloadable
					endif
					do_unload_permanent
					PushMemProfile "Net Anims"
					MemPushContext TopDownHeap
					LoadPipPre "Netanims.pre"
					SetDefaultPermanent 1
					load_net_anims use_pip
					SetDefaultPermanent 0
					RunScriptOnComponentType component = animation target = InvalidateCache Params = {}
					MemPopContext
					PopMemProfile
					change have_loaded_net = 1
				endif
			endif
		endif
	endscript
	script do_unload_unloadable
		if NOT IsNGC
			if (have_loaded_unloadable)
				load_unloadable_anims LoadFunction = UnloadAnim
				if NOT UnloadPipPre "unloadableanims.pre"
					script_assert "couldn't unload pip pre"
				endif
				change have_loaded_unloadable = 0
			endif
			if (have_loaded_net)
				load_net_anims LoadFunction = UnloadAnim
				if NOT UnloadPipPre "netanims.pre"
					script_assert "couldn't unload pip pre"
				endif
				change have_loaded_net = 0
			endif
		endif
	endscript
	script what_is_loaded
		if (have_loaded_permanent)
			printf "PERMANENT"
		endif
		if (have_loaded_unloadable)
			printf "UNLOADABLE"
		endif
		if (have_loaded_net)
			printf "NET"
		endif
	endscript
	script fireball_death
		CreateCompositeObject {
			Components = explosion_composite_structure
			Params = {
				pos = <pos>
				vel = <vel>
				orient_to_vel
				scale = <scale>
				LocalSpace
				UseStartPosition
				NoName
				SystemLifetime = 400
				NeverSuspend
				StartPosition = (0.0,0.0,-50.0)
				BoxDimsStart = (20.2204628,20.2204628,20.2204628)
				MidPosition = (0.65409303,-0.767708,0.417743)
				BoxDimsMid = (74.37434387,74.37434387,74.37434387)
				EndPosition = (-0.94729298,-0.83414102,-0.78278702)
				BoxDimsEnd = (227.08786011,227.08786011,227.08786011)
				Texture = dt_nj_flame02
				CreatedAtStart
				AbsentInNetGames
				UseMidPoint
				UseColorMidTime
				type = NEWFLAT
				BlendMode = add
				FixedAlpha = 128
				AlphaCutoff = 0
				MaxStreams = 2
				SuspendDistance = 0
				lod_dist1 = 400
				lod_dist2 = 401
				EmitRate = 30.0
				Lifetime = 0.30000001
				MidPointPCT = 50
				StartRadius = 20.0
				MidRadius = 100.0
				EndRadius = 6.0
				StartRadiusSpread = 0.0
				MidRadiusSpread = 0.0
				EndRadiusSpread = 10.0
				StartRGB = [255, 111, 54]
				StartAlpha = 129
				ColorMidTime = 50
				MidRGB = [135, 35, 0]
				MidAlpha = 133
				EndRGB = [0, 0, 0]
				EndAlpha = 51}
		}
	endscript
	script ClientLaunchFireball
		if NOT GameModeEquals is_firefight
			return
		endif
		TheParams = {owner_id = <owner_id>
			pos = (<X> * (1.0,0.0,0.0) + <y> * (0.0,1.0,0.0) + <z> * (0.0,0.0,1.0))
			vel = (<scaled_x> * (1.0,0.0,0.0) + <scaled_y> * (0.0,1.0,0.0) + <scaled_z> * (0.0,0.0,1.0))
			orient_to_vel
			scale = <scale>
			radius = <radius>
			LocalSpace
			UseStartPosition
			NoName
			SystemLifetime = 10000
			NeverSuspend
			death_script = fireball_death
			StartPosition = (0.0,0.0,0.0)
			BoxDimsStart = (3.33959389,3.33959389,3.33959389)
			MidPosition = (-0.101934,2.32613802,-75.07246399)
			BoxDimsMid = (10.16847038,10.16847038,10.16847038)
			EndPosition = (-1.16847098,1.35173905,-301.16650391)
			BoxDimsEnd = (2.50771403,2.50771403,2.50771403)
			Texture = dt_nj_flame02
			CreatedAtStart
			AbsentInNetGames
			UseMidPoint
			UseColorMidTime
			type = NEWFLAT
			BlendMode = add
			FixedAlpha = 128
			AlphaCutoff = 0
			MaxStreams = 2
			SuspendDistance = 0
			lod_dist1 = 400
			lod_dist2 = 401
			EmitRate = 30.0
			Lifetime = 0.75
			MidPointPCT = 50
			StartRadius = 20.0
			MidRadius = 20.0
			EndRadius = 5.0
			StartRadiusSpread = 0.0
			MidRadiusSpread = 0.0
			EndRadiusSpread = 10.0
			StartRGB = [54, 97, 255]
			StartAlpha = 129
			ColorMidTime = 50
			MidRGB = [135, 35, 0]
			MidAlpha = 27
			EndRGB = [0, 0, 0]
			EndAlpha = 0
		}
		if OnServer
			CreateCompositeObject {
				Components = server_fireball_composite_structure
				Params = <TheParams>
			}
		else
			CreateCompositeObject {
				Components = fireball_composite_structure
				Params = <TheParams>
			}
		endif
		Obj_PlaySound FlamingFireBall01 vol = (130 + <scale> * 15) pitch = (190 - <scale> * 7) dropoff = 140
	endscript
	script LaunchFireball vel_scale = 1.0
		if NOT GameModeEquals is_firefight
			return
		endif
		GetFireballLevel
		point_scale = 3
		switch <level>
			case 1
				point_scale = 1
			case 2
				point_scale = 5
			case 3
				point_scale = 25
			case 4
				point_scale = 100
			case 5
				point_scale = 250
		endswitch
		GetSkaterPosition
		scaled_vel = (<vel_scale> * 5000.0)
		GetSkaterVelocity scale = <scaled_vel> <...>
		if CurrentScorePotGreaterThan (20000 * <point_scale>)
			radius = 400
			scale = 10.0
		else
			if CurrentScorePotGreaterThan (10000 * <point_scale>)
				radius = 200
				scale = 5.0
			else
				if CurrentScorePotGreaterThan (5000 * <point_scale>)
					radius = 100
					scale = 3.5
				else
					if CurrentScorePotGreaterThan (2500 * <point_scale>)
						radius = 75
						scale = 2.5
					else
						if CurrentScorePotGreaterThan (750 * <point_scale>)
							radius = 60
							scale = 2.0
						else
							if CurrentScorePotGreaterThan (250 * <point_scale>)
								radius = 45
								scale = 1.5
							else
								radius = 24
								scale = 1.0
							endif
						endif
					endif
				endif
			endif
		endif
		new_y = (<y>)
		<y> = <new_y>
		GetCurrentSkaterId
		if inNetGame
			BroadcastProjectile objID = <objID> type = fireball scale = <scale> radius = <radius> pos = (<X> * (1.0,0.0,0.0) + <new_y> * (0.0,1.0,0.0) + <z> * (0.0,0.0,1.0)) vel = (<scaled_x> * (1.0,0.0,0.0) + <scaled_y> * (0.0,1.0,0.0) + <scaled_z> * (0.0,0.0,1.0))
		endif
		GetCurrentSkaterId
		ClientLaunchFireball owner_id = <objID> <...>
	endscript
	script SetObjectColor_CurrentTOD
		switch current_tod
			case morning
				set_tod_morning
			case day
				set_tod_day
			case evening
				set_tod_evening
			case night
				set_tod_night
			default
				printf "NO TOD SET TO SWITCH BACK TO"
		endswitch
		SetObjectColor <...> color = (lev_red + (lev_green * 256) + (lev_blue * 65536))
	endscript
	script KillCreateSponsorGeo
		GoalManager_GetSponsor
		if GotParam sponsor_kill_prefix
			kill prefix = <sponsor_kill_prefix>
		else
			printf " >>>>>>>> WARNING: NO GEO PREFIX SENT TO KillCreateSponsorGeo >>>>>>>>>>> "
			return
		endif
		if GotParam nosponsor_prefix
			kill prefix = <nosponsor_prefix>
		endif
		switch <sponsor>
			case sponsor_birdhouse
				printf "I'm on Birdhouse!"
				create prefix = <sponsor_birdhouse_prefix>
			case sponsor_element
				printf "I'm on Element!"
				create prefix = <sponsor_element_prefix>
			case sponsor_flip
				printf "I'm on Flip!"
				create prefix = <sponsor_flip_prefix>
			case sponsor_girl
				printf "I'm on Girl!"
				create prefix = <sponsor_girl_prefix>
			case sponsor_zero
				printf "I'm on Zero!"
				create prefix = <sponsor_zero_prefix>
			default
				if GotParam nosponsor_prefix
					create prefix = <nosponsor_prefix>
				endif
		endswitch
	endscript
	script GetNetworkNumPlayers
		GetPreferenceChecksum pref_type = network num_players
		switch <checksum>
			case num_2
				return num_players = 2
			case num_3
				return num_players = 3
			case num_4
				return num_players = 4
			case num_5
				return num_players = 5
			case num_6
				return num_players = 6
			case num_7
				return num_players = 7
			case num_8
				return num_players = 8
			default
				return num_players = 1
		endswitch
	endscript
