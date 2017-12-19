
	UsePreFilesForLevelLoading = 0
	fake_net = 0
	AssertOnMissingScripts = 0
	AssertOnMissingAssets = 0
	AlwaysDump = 0
	next_level_script = nullscript
	script cleanup_before_loading_level
		printf "*********************** cleanup_before_loading_level"
		Cleanup
		StopMusic
		PauseMusic
		ClearMusicTrackList
	endscript
	script PreLevelLoad
	endscript
	script PostLevelLoad
	endscript
	script script_assert <...>
		printf "ASSERT MESSAGE:"
		ScriptAssert <...>
	endscript
	script request_level
		if gotparam level
			RequestLevel <level>
		else
			script_assert "request_level needs a level param"
		endif
	endscript
	script LoadLevel
		MemPushContext 0
		PreLevelLoad
		ScreenElementSystemCleanup
		LaunchLevel <...>
		PostLevelLoad
		MemPopContext
	endscript
	LevelNum_NJ = 1
	LevelNum_NY = 2
	LevelNum_FL = 3
	LevelNum_SD = 4
	LevelNum_HI = 5
	LevelNum_VC = 6
	LevelNum_SJ = 7
	LevelNum_RU = 8
	LevelNum_AU = 9
	LevelNum_SE = 10
	LevelNum_Default = 11
	LevelNum_SC = 12
	LevelNum_DJ = 13
	LevelNum_PH = 14
	LevelNum_VN = 16
	LevelNum_HN = 17
	LevelNum_SC2 = 15
	LevelNum_WWW = 18
	LevelNum_CAS = 19
	LevelNum_Boardshop = 20
	LevelNum_TestLevel = 21
	LevelNum_Skateshop = 0
	LevelNum_Sch = 1
	LevelNum_SF2 = 2
	LevelNum_Alc = 3
	LevelNum_Kon = 4
	LevelNum_Jnk = 5
	LevelNum_Lon = 6
	LevelNum_Zoo = 7
	LevelNum_Cnv = 8
	LevelNum_Hof = 9
	LevelNum_Sk5ed = 11
	LevelNum_Airport = 1
	LevelNum_Canada = 2
	LevelNum_Rio = 3
	LevelNum_Suburbia = 4
	LevelNum_Foundry = 5
	LevelNum_SkaterIsland = 6
	LevelNum_LA = 7
	LevelNum_Tokyo = 8
	LevelNum_Ship = 9
	LevelNum_Oil = 10
	LevelNum_Tutorials = 11
	LevelNum_Warehouse = 12
	LevelNum_Burnside = 13
	LevelNum_Roswell = 14
	LevelNum_Rooftops = 15
	levels_with_gaps = [
		LevelNum_NJ
		LevelNum_NY
		LevelNum_FL
		LevelNum_SD
		LevelNum_HI
		LevelNum_VC
		LevelNum_SJ
		LevelNum_RU
		LevelNum_SE
		LevelNum_SC2
		LevelNum_VN
		LevelNum_HN
	]
	script LoadLevelPreFile
		if istrue UsePreFilesForLevelLoading
			LoadPreFile <...>
		endif
	endscript
	script set_level_lights fog_red = 0 fog_blue = 0 fog_green = 0 fog_alpha = 0 fog_dist = 0
		printf "heading=%h" h = <heading_0>
		SetLightAmbientColor r = <ambient_red> g = <ambient_green> b = <ambient_blue>
		SetLightDirection index = 0 heading = <heading_0> pitch = <pitch_0>
		SetLightDiffuseColor index = 0 r = <red_0> g = <green_0> b = <blue_0>
		SetLightDirection index = 1 heading = <heading_1> pitch = <pitch_1>
		SetLightDiffuseColor index = 1 r = <red_1> g = <green_1> b = <blue_1>
		SetDynamicLightModulationFactor ambient value = 0.1
		SetDynamicLightModulationFactor directional = 0 value = 0.1
		SetDynamicLightModulationFactor directional = 1 value = 0.1
		if gotparam load_script
			if NOT (<load_script> = Load_Default)
				if NOT (<fog_dist> = 0)
					EnableFog
					SetFogColor r = <fog_red> b = <fog_blue> g = <fog_green> a = <fog_alpha>
					SetFogDistance distance = <fog_dist>
				else
					DisableFog
				endif
			endif
		endif
	endscript
	ANY_LEVEL_LOADED_YET = 0
	script load_level level_number = 0
		if InNetGame
			if NOT IsObserving
				ExitSurveyorMode
			endif
		endif
		change freemem_script_lowest = 999999999
		change freemem_main_lowest = 999999999
		do_unload_unloadable
		if NOT InNetGame
			if NOT gotparam park_editor
				do_load_permanent
			endif
		endif
		RememberLevelStructureNameForReplays level_structure_name = <structure_name>
		GoalManager_RememberLevelStructureName level_structure_name = <structure_name>
		if ((cd) || (istrue TestMusicFromHost))
			if gotparam ambient_track
				AddMusicTrack <ambient_track>
			endif
		endif
		kill_start_key_binding
		printf "replace_handlers to take away start key in load_level"
        // set_tod_startup should be in the correct place here. Previously, NS had this executing AFTER
        // set_level_lights, which would clear away anything defined in the level struct!
        script_change_tod tod_action = set_tod_startup
		set_level_lights <...>
		SetScoreAccumulation 0
		SetScoreDegradation 0
		if InSplitScreenGame
			UnSetGlobalFlag flag = CHEAT_DISCO
		endif
		if isXbox
			if gotparam loading_time_xbox
				<loading_time> = <loading_time_xbox>
			else
				<loading_time> = (<loading_time> * 0.60000002)
			endif
		else
			if (ANY_LEVEL_LOADED_YET = 0)
				<loading_time> = (<loading_time> + 0)
				change ANY_LEVEL_LOADED_YET = 1
			endif
		endif
		printf "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
		printf "@@@ LOADLEVEL"
		if istrue Bootstrap_build
			DisplayLoadingScreen "loadscrn_demo_controls" 27
		else
			if gotparam loading_screen
				if EnteringNetGame
					if OnServer
						if isXbox
							DisplayLoadingScreen "loadscrn_system_link_x" <loading_time>
						else
							DisplayLoadingScreen "loadscrn_Online" <loading_time>
							printf "@@@ AS SERVER"
						endif
					else
						printf "@@@ AS CLIENT"
						if isXbox
							DisplayLoadingScreen "loadscrn_system_x" <loading_time>
						else
							DisplayLoadingScreen "loadscrn_Online2" <loading_time>
						endif
					endif
				else
					printf "@@@ NON NET GAME"
					if InSplitScreenGame
						DisplayLoadingScreen "loadscrn_2player" <loading_time>
					else
						if (Display_Story_Peralta_LoadingScreen)
							change Display_Story_Peralta_LoadingScreen = 0
							<loading_screen> = "loadscrn_peralta"
						endif
						if (Display_Story_Final_LoadingScreen)
							change Display_Story_Final_LoadingScreen = 0
							<loading_screen> = "loadscrn_final"
						endif
						if (Display_Story_Premiere_LoadingScreen)
							change Display_Story_Premiere_LoadingScreen = 0
							<loading_screen> = "loadscrn_premiere"
						endif
						if (launch_to_createatrick = 1)
							if isXbox
								<loading_screen> = "loadscrn_trick_x"
							else
								if isNGC
									<loading_screen> = "loadscrn_trick_ngc"
								else
									<loading_screen> = "loadscrn_trick"
								endif
							endif
						endif
						DisplayLoadingScreen <loading_screen> <loading_time>
					endif
				endif
			else
				DisplayLoadingScreen "loadscrn_generic"
			endif
		endif
		exit_pause_menu
		printf "KSK: CareerStartLevel"
		CareerStartLevel level = <level_number>
		if NOT InNetGame
			printf "KSK: AllocatePathManMemory"
			AllocatePathManMemory
		endif
		printf "KSK: ResetLevelFlags"
		ResetLevelFlags
		if (<level_number> = LevelNum_Skateshop)
		endif
		if gotparam scnpre
			if NOT InNetGame
				LoadLevelPreFile <scnpre>
			else
				if gotparam park_editor
					LoadLevelPreFile <scnpre>
				else
					LoadLevelPreFile <scnpre> //(<level> + "scn_net.pre")
				endif
			endif
		endif
		if gotparam sky
			printf "KSK: LoadScene sky"
			LoadScene scene = <sky>
		endif
		if gotparam park_editor
			LoadScene scene = <level> is_dictionary
			if gotparam outer_shell
				LoadScene scene = <outer_shell> no_supersectors
			endif
		else
			if gotparam level
				if ((UNDERGROUNDPLUS_GFX_QUALITY = 2) && (gotparam level_low))
                    LoadScene scene = <level_low>
                else
                    if ((UNDERGROUNDPLUS_GFX_QUALITY = 1) && (gotparam level_mid))
                        LoadScene scene = <level_mid>
                    else
                        LoadScene scene = <level>
                    endif
                endif
			endif
		endif
		if gotparam level_name
			
			printf "KSK: SetLevelName"
			SetLevelName <level_name>
		else
			printf "KSK: SetLevelName"
			SetLevelName <level>
		endif
		if gotparam scnpre
			if NOT InNetGame
				
				printf "KSK: UnloadPreFile scnpre"
				UnloadPreFile <scnpre> dont_assert
			else
				if gotparam park_editor
					UnloadPreFile <scnpre> dont_assert
				else
					UnloadPreFile <scnpre> dont_assert //(<level> + "scn_net.pre") dont_assert
				endif
			endif
		endif
		if isNGC
			if NOT InMultiPlayerGame
				if gotparam pedpre
					LoadPreFile <pedpre> dont_assert
				endif
			endif
		endif
		if NOT IsPS2
			if gotparam pre
				
				printf "KSK: LoadLevelPreFile"
				LoadLevelPreFile <pre>
			endif
		endif
		if isNGC
			if german
				LoadPreFile (<pre> + "d") dont_assert
			else
				if french
					LoadPreFile (<pre> + "f") dont_assert
				endif
			endif
		endif
		if gotparam qb
			if isNGC
				if german
					<qb> = (<qb> + "d")
				else
					if french
						<qb> = (<qb> + "f")
					endif
				endif
			endif
			if gotparam park_editor
				LoadNodeArray <qb> park_editor
			else
				printf "KSK: LoadNodeArray"
				LoadNodeArray <qb>
			endif
		endif
		if IsPS2
			if gotparam pre
				LoadLevelPreFile <pre>
			endif
		endif
		if gotparam park_editor
		else
			if gotparam qb
				printf "KSK: PreloadModels"
				PreloadModels
			endif
		endif
		if gotparam level_qb
			if isNGC
				if german
					<level_qb> = (<level_qb> + "d")
				else
					if french
						<level_qb> = (<level_qb> + "f")
					endif
				endif
			endif
			
			printf "KSK: UnloadQB level_qb"
			UnloadQB <level_qb>
			printf "KSK: LoadQB level_qb"
			LoadQB <level_qb> LevelSpecific
		endif
		if gotparam level_sfx_qb
			if isNGC
				if german
					<level_sfx_qb> = (<level_sfx_qb> + "d")
				else
					if french
						<level_sfx_qb> = (<level_sfx_qb> + "f")
					endif
				endif
			endif
			LoadQB <level_sfx_qb> LevelSpecific
		endif
		if isNGC
			if german
				UnloadPreFile (<pre> + "d") dont_assert
			else
				if french
					UnloadPreFile (<pre> + "f") dont_assert
				endif
			endif
		endif
		if gotparam qb
			printf "KSK: preselect_random_parts"
			preselect_random_parts <...>
		endif
		if gotparam park_editor
			LoadTerrain
		else
			printf "KSK: SetTerrainDefault"
			SetTerrainDefault
			if gotparam qb
				printf "KSK: LoadTerrain"
				LoadTerrain
			endif
		endif
		if istrue UseLevelOverrideStats
			if gotparam default_stats
				if (bump_stats = 0)
					SetAllStats value = <default_stats>
				endif
			endif
		endif
		if NOT InNetGame
			if ScriptExists load_level_anims
				
				printf "KSK: load_level_anims"
				PushMemProfile "Level Specific Anims"
				load_level_anims
				PopMemProfile
			endif
		endif
		if NOT InNetGame
			if ScriptExists LoadCameras
				printf "KSK: LoadCameras"
				PushMemProfile "Level Cameras"
				LoadCameras
				PopMemProfile
			endif
		endif
		if ScriptExists LoadObjectAnims
			printf "KSK: LoadObjectAnims"
			PushMemProfile "Object Anims"
			LoadObjectAnims
			PopMemProfile
		endif
		if ScriptExists LoadAllParticleTextures
			printf "KSK: LoadAllParticleTextures"
			PushMemProfile "Particle Textures"
			LoadAllParticleTextures
			PopMemProfile
		endif
		if gotparam extranetanimsscript
			if InNetGame
				printf "                    WE'RE IN A NET GAME!!!!!!!!!!!!!"
				PushMemProfile "Level Specific Anims"
				<extranetanimsscript>
				PopMemProfile
			endif
		endif
		if gotparam park_editor
		else
			if isNGC
				if (<level_number> = LevelNum_CAS)
				else
					if (<level_number> = LevelNum_Skateshop)
					else
						if (<level_number> = LevelNum_Boardshop)
						else
							if gotparam startup_script
								<startup_script>
							endif
						endif
					endif
				endif
			else
				if gotparam startup_script
					<startup_script>
				endif
			endif
		endif
		if NOT isNGC
			if gotparam pre
				
				printf "KSK: UnloadPreFile pre"
				UnloadPreFile <pre> dont_assert
			endif
		endif
		if NOT isNGC
			if NOT InMultiPlayerGame
				if gotparam pedpre
					printf "KSK: UnloadPreFile pedpre"
					LoadPreFile <pedpre> dont_assert
				endif
			endif
		endif
		if NOT InMultiPlayerGame
			if gotparam qb
				if NOT gotparam frontend_level
					if gotparam park_editor
						PreloadPedestrians no_random
					else
						
						printf "KSK: PreloadPedestrians"
						PreloadPedestrians
					endif
				endif
			endif
		endif
		if NOT InNetGame
			if InMultiPlayerGame
				PreloadModel name = "crown"
			endif
		endif
		if NOT isNGC
			if NOT InMultiPlayerGame
				if gotparam pedpre
					UnloadPreFile <pedpre> dont_assert
				endif
			endif
		endif
		if (<level_number> = LevelNum_Skateshop)
			load_mainmenu_textures_to_main_memory
		endif
		if gotparam park_editor
		else
			if isNGC
				if gotparam startup_script
					if (<level_number> = LevelNum_CAS)
						<startup_script>
					endif
					if (<level_number> = LevelNum_Skateshop)
						<startup_script>
					endif
					if (<level_number> = LevelNum_Boardshop)
						<startup_script>
					endif
				endif
			endif
		endif
		PushMemProfile "Level Collision decompressed PIP + Supersectors"
		if istrue UsePreFilesForLevelLoading
			if gotparam colpre
				if NOT InNetGame
					
					printf "KSK: LoadPipPre colpre"
					LoadPipPre <colpre> heap = bottomup
				else
					if gotparam park_editor
						LoadPipPre <colpre> heap = bottomup
					else
						
						printf "KSK: LoadPipPre col_net.pre"
						LoadPipPre <colpre> heap = bottomup //(<level> + "col_net.pre") heap = bottomup
					endif
				endif
			endif
		endif
        
        if ((UNDERGROUNDPLUS_GFX_QUALITY = 2) && (gotparam level_low))
            LoadCollision scene = <level_low>
        else
            if ((UNDERGROUNDPLUS_GFX_QUALITY = 1) && (gotparam level_mid))
                LoadCollision scene = <level_mid>
            else
                LoadCollision scene = <level>
            endif
        endif
        
		if gotparam park_editor
			if gotparam outer_shell
				if istrue UsePreFilesForLevelLoading
				endif
				LoadCollision scene = <outer_shell>
			endif
		endif
		PopMemProfile
		if gotparam park_editor
			if gotparam startup_script
				<startup_script>
			endif
		else
			if gotparam qb
				
				printf "KSK: ParseNodeArray"
				ParseNodeArray
			endif
		endif
		if (auto_change_chapter_and_stage = 1)
			
			printf "KSK: GetCurrentLevel"
			GetCurrentLevel
			if StructureContains structure = LEVEL_CHAPTER_MAP <level>
				
				printf "KSK: GoalManager_SetCurrentChapterAndStage"
				GoalManager_SetCurrentChapterAndStage chapter = (LEVEL_CHAPTER_MAP.<level>) stage = 0
			endif
		endif
		if gotparam goals_script
			<goals_script>
		endif
		if GameModeEquals is_creategoals
			InitialiseCreatedGoals
		else
			if InNetGame
				InitialiseCreatedGoals DoNotCreateGoalPeds
			endif
		endif
		if GameModeEquals is_singlesession
			printf "KSK: AddGoal_TrickAttack"
			AddGoal_TrickAttack
		endif
		if GameModeEquals is_career
			if NOT (<level_number> = 0)
				SetGlobalFlag flag = CAREER_STARTED
				printf "CAREER_STARTED"
			endif
		endif
		init_goal_manager
		if gotparam setup_script
			<setup_script>
		endif
		if gotparam frontend_level
			printf "KSK: script_reset_tod"
			script_reset_tod
		else
			printf "KSK: script_change_tod"
            // This reverts the light settings to default, wiping away all the settings in 
            // the level struct. No idea why NS used this!
			//script_change_tod tod_action = set_tod_startup is_local = 1
			
			if NOT gotparam park_editor
				if NOT InNetGame
					if NOT gotparam desired_tod
						ksk_looping_tod is_local = 1
					endif
				endif
			endif
			if gotparam desired_tod
                if desired_tod = tod_null
                else
                    script_change_tod tod_action = <desired_tod> is_local = 1
                endif
			endif
		endif
		if NOT gotparam park_editor
			printf "KSK: do_load_unloadable"
			do_load_unloadable
		endif
		if gotparam frontend_level
			if (<frontend_level> = 1)
				if isNGC
					LoadPreFile "skaterparts.pre" use_bottom_up_heap
				else
					if NOT istrue cas_artist
						if (<level_number> = LevelNum_Skateshop)
							LoadPreFile "skaterparts.pre"
						else
							LoadPreFile "skaterparts.pre" use_bottom_up_heap
						endif
					endif
				endif
			endif
		endif
		if InSplitScreenGame
			AllocateSplitScreenDMA
		endif
		printf "KSK: UnPauseGame"
		UnPauseGame
		if gotparam viewer_mode
			gameflow StandardGameFlowToggleView
			change AssertOnMissingScripts = 0
			change AssertOnMissingAssets = 0
		else
			change AssertOnMissingScripts = 1
			change AssertOnMissingAssets = 1
			printf "KSK: gameflow"
			gameflow StandardGameFlow
		endif
		if isNGC
			if gotparam pre
				UnloadPreFile <pre> dont_assert
			endif
			if NOT InMultiPlayerGame
				if gotparam pedpre
					UnloadPreFile <pedpre> dont_assert
				endif
			endif
		endif
	endscript
	script LoadTerrain_parked
		SetTerrainDefault
		SetTerrainConcSmooth
		SetTerrainConcRough
		SetTerrainMetalSmooth
		SetTerrainMetalRough
		SetTerrainMetalGrating
		SetTerrainWood
		SetTerrainWoodMasonite
		SetTerrainWoodPlywood
		SetTerrainWoodPier
		SetTerrainBrick
		SetTerrainTile
		SetTerrainAsphalt
		SetTerrainRock
		SetTerrainGravel
		SetTerrainSidewalk
		SetTerrainGrass
		SetTerrainDirt
		SetTerrainWater
		SetTerrainPlexiglass
		SetTerrainChainlink
		SetTerrainGrindwire
		SetTerrainGrindConc
		SetTerrainGrindMetal
		SetTerrainGrindWood
	endscript
	script init_goal_manager
		GoalManager_LevelLoad
		if InNetGame
			GoalManager_InitializeAllMinigames
			UnSetFlag flag = FLAG_PROSET1_GEO_ON
			UnSetFlag flag = FLAG_PROSET2_GEO_ON
			UnSetFlag flag = FLAG_PROSET3_GEO_ON
			UnSetFlag flag = FLAG_PROSET4_GEO_ON
			UnSetFlag flag = FLAG_PROSET5_GEO_ON
			UnSetFlag flag = FLAG_PROSET6_GEO_ON
			UnSetFlag flag = FLAG_PROSET7_GEO_ON
		else
			GoalManager_SetGoalChaptersAndStages
		endif
		GoalManager_UpdateFamilyTrees
		GoalManager_InitializeAllGoals
		GoalManager_GetCurrentChapterAndStage
		if GameModeEquals is_career
			GetCurrentLevel
			if (((CHAPTER_LEVELS[<currentChapter>]).checksum) = <level>)
				GoalManager_RunLastStageScript
			endif
		endif
		GoalManager_SetCanStartGoal 1
		if CareerLevelIs LevelNum_Skateshop
			GoalManager_HideGoalPoints
			GoalManager_HidePoints
		else
			if NOT InMultiPlayerGame
				GoalManager_ShowGoalPoints
			endif
			if NOT (in_cinematic_sequence)
				GoalManager_ShowPoints
			endif
		endif
	endscript
	script Load_Default
		load_level Level_Default
	endscript
	script Load_EmptyDefault
		load_level Level_EmptyDefault
	endscript
	script Load_NJ
		load_level Level_NJ
	endscript
	script Load_NY
		load_level Level_NY
	endscript
	script Load_UP_NY
		load_level Level_UP_NY
	endscript
	script Load_FL
		load_level Level_FL
	endscript
	script Load_UP_FL
		load_level Level_UP_FL
	endscript
	script Load_SD
		load_level Level_SD
	endscript
	script Load_UP_SD
		load_level Level_UP_SD
	endscript
	script Load_HI
		load_level Level_HI
	endscript
	script Load_UP_HI
		load_level Level_UP_HI
	endscript
	script Load_VC
		load_level Level_VC
	endscript
	script Load_SJ
		load_level Level_SJ
	endscript
	script Load_RU
		load_level Level_RU
	endscript
	script Load_AU
		load_level Level_AU
	endscript
	script Load_SE
		load_level Level_SE
	endscript
	script Load_TestLevel
		load_level Level_TestLevel
	endscript
	script Load_SC
		load_level Level_SC
	endscript
	script Load_DJ
		load_level Level_DJ
	endscript
	script Load_PH
		load_level Level_PH
	endscript
	script Load_VN
		load_level Level_VN
	endscript
	script Load_hn
		load_level Level_HN
	endscript
	script Load_sc2
		load_level Level_SC2
	endscript
	script Load_UP_sc2
		load_level Level_UP_SC2
	endscript
	script Load_WWW
		load_level Level_WWW
	endscript
	script Load_Test
		load_level Level_Test
	endscript
	script load_thps4skateshop
		load_level Level_THPS4SkateShop
	endscript
	script load_sk5ed1_shell
		load_level level_sk5ed1_shell
	endscript
	script load_sk5ed2_shell
		load_level level_sk5ed2_shell
	endscript
	script load_sk5ed3_shell
		load_level level_sk5ed3_shell
	endscript
	script load_sk5ed4_shell
		load_level level_sk5ed4_shell
	endscript
	script load_sk5ed5_shell
		load_level level_sk5ed5_shell
	endscript
	
	script Load_Par
		load_level Level_Par
	endscript
	script Load_Foo
		load_level Level_Foo
	endscript
	script Load_BW
		load_level Level_BW
	endscript
	script Load_Oil
		load_level Level_Oil
	endscript
	script Load_Hvn
		load_level Level_Hvn
	endscript
	script Load_devlevel
		load_level Level_devlevel
	endscript
    script Load_UP_VC 
        load_level Level_UP_VC 
    endscript 
    script Load_UP_Alc 
        load_level Level_UP_Alc 
    endscript 
    script Load_HD_VN 
        load_level Level_HD_VN 
    endscript 
    script Load_HD_CA 
        load_level Level_HD_CA 
    endscript 
	
	
	script Load_TH2_Han
		load_level Level_TH2_Han
	endscript
	script Load_TH3_SI
		load_level Level_TH3_SI
	endscript
	script Load_TH3_LA
		load_level Level_TH3_LA
	endscript
	script Load_P8_Sub
		load_level Level_P8_Sub
	endscript
	script Load_AW_Mar
		load_level Level_AW_Mar
	endscript
	
    // ********************************************************
    // Underground+ custom level slots go here!
    // ********************************************************
	script Load_Custom01
		load_level Level_Custom01
	endscript
	script Load_Custom02
		load_level Level_Custom02
	endscript
	script Load_Custom03
		load_level Level_Custom03
	endscript
	script Load_Custom04
		load_level Level_Custom04
	endscript
	script Load_Custom05
		load_level Level_Custom05
	endscript
	script Load_Custom06
		load_level Level_Custom06
	endscript
	script Load_Custom07
		load_level Level_Custom07
	endscript
	script Load_Custom08
		load_level Level_Custom08
	endscript
	script Load_Custom09
		load_level Level_Custom09
	endscript
	script Load_Custom10
		load_level Level_Custom10
	endscript
	
    
	Level_Default = {
		structure_name = Level_Default
		load_script = Load_Default
		name = "Default"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		level = "Default"
		sky = "Default_Sky"
		qb = "levels\Default\Default.qb"
		level_qb = "levels\Default\Default_scripts.qb"
		startup_script = Default_Startup
		goals_script = Default_goals
		setup_script = Default_setup
		default_stats = 5
		level_number = LevelNum_Default
		viewer_mode = 1
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 50
		pitch_0 = 330
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 240
		pitch_1 = 330
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.40000001
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	Level_EmptyDefault = {
		structure_name = Level_EmptyDefault
		load_script = Load_EmptyDefault
		name = "Default"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		level = "Default"
		sky = "NJ_Sky"
		default_stats = 5
		level_number = LevelNum_Default
		viewer_mode = 1
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 120.0
		pitch_0 = -127.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = -45.0
		pitch_1 = -110.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	Level_NJ = {
		structure_name = Level_NJ
		load_script = Load_NJ
		name = "New Jersey"
		loading_screen = "loadscrn_jersey"
		loading_time = 15.5
		pre = "NJ.pre"
		scnpre = "NJscn.pre"
		level = "NJ"
		sky = "NJ_Sky"
		qb = "levels\NJ\NJ.qb"
		colpre = "NJcol.pre"
		pedpre = "NJped.pre"
		level_qb = "levels\NJ\NJ_scripts.qb"
		level_sfx_qb = "levels\NJ\NJ_sfx.qb"
		startup_script = NJ_Startup
		goals_script = NJ_goals
		setup_script = NJ_setup
		default_stats = 5
		level_number = LevelNum_NJ
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 50
		pitch_0 = 330
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 240
		pitch_1 = 330
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.40000001
		fog_red = 0
		fog_blue = 0
		fog_green = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
	}
	Level_NY = {
		structure_name = Level_NY
		load_script = Load_NY
		name = "Manhattan"
		loading_screen = "loadscrn_manhattan"
		loading_time = 22
		pre = "NY.pre"
		scnpre = "NYscn.pre"
		level = "NY"
		sky = "NY_Sky"
		qb = "levels\NY\NY.qb"
		colpre = "NYcol.pre"
		pedpre = "NYped.pre"
		level_qb = "levels\NY\NY_scripts.qb"
		level_sfx_qb = "levels\NY\NY_sfx.qb"
		startup_script = NY_Startup
		goals_script = NY_goals
		setup_script = NY_setup
		default_stats = 6
		level_number = LevelNum_NY
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 330.0
		pitch_0 = 330.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 150.0
		pitch_1 = 330.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 126
		fog_blue = 227
		fog_green = 169
		fog_alpha = 45
		fog_dist = 1000
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
	}
	Level_UP_NY = {
		structure_name = Level_UP_NY
		load_script = Load_UP_NY
		name = "*Manhattan+"
		loading_screen = "loadscrn_manhattan"
		loading_time = 22
		pre = "NY.pre"
		scnpre = "NYscn.pre"
		level = "NY"
		sky = "NY_Sky"
		qb = "levels\thug_plus\NY.qb"
		colpre = "NYcol.pre"
		pedpre = "NYped.pre"
		level_qb = "levels\NY\NY_scripts.qb"
		level_sfx_qb = "levels\NY\NY_sfx.qb"
		startup_script = NY_Startup
		goals_script = NY_goals
		setup_script = NY_setup
		default_stats = 6
		level_number = LevelNum_Default
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 330.0
		pitch_0 = 330.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 150.0
		pitch_1 = 330.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 126
		fog_blue = 227
		fog_green = 169
		fog_alpha = 45
		fog_dist = 1000
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
	}
	Level_FL = {
		structure_name = Level_FL
		load_script = Load_FL
		name = "Florida"
		loading_screen = "loadscrn_florida"
		loading_time = 18
		pre = "FL.pre"
		scnpre = "FLscn.pre"
		level = "FL"
		sky = "FL_Sky"
		qb = "levels\FL\FL.qb"
		colpre = "FLcol.pre"
		pedpre = "FLped.pre"
		level_qb = "levels\FL\FL_scripts.qb"
		level_sfx_qb = "levels\FL\FL_sfx.qb"
		startup_script = FL_Startup
		goals_script = FL_goals
		setup_script = FL_setup
		default_stats = 6
		level_number = LevelNum_FL
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 50.0
		pitch_0 = 330.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 240.0
		pitch_1 = 330.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 150
		fog_blue = 255
		fog_green = 150
		fog_alpha = 20
		fog_dist = 900
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
	}
	Level_UP_FL = {
		structure_name = Level_UP_FL
		load_script = Load_UP_FL
		name = "Florida"
		loading_screen = "loadscrn_florida"
		loading_time = 18
		pre = "FL.pre"
		scnpre = "FLscn.pre"
		level = "FL"
		sky = "FL_Sky"
		qb = "levels\thug_plus\FL.qb"
		colpre = "FLcol.pre"
		pedpre = "FLped.pre"
		level_qb = "levels\FL\FL_scripts.qb"
		level_sfx_qb = "levels\FL\FL_sfx.qb"
		startup_script = FL_Startup
		goals_script = FL_goals
		setup_script = FL_setup
		default_stats = 6
		level_number = LevelNum_Default
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 50.0
		pitch_0 = 330.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 240.0
		pitch_1 = 330.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 150
		fog_blue = 255
		fog_green = 150
		fog_alpha = 20
		fog_dist = 900
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
	}
	Level_SD = {
		structure_name = Level_SD
		load_script = Load_SD
		name = "San Diego"
		loading_screen = "loadscrn_diego"
		loading_time = 18
		pre = "SD.pre"
		scnpre = "SDscn.pre"
		level = "SD"
		sky = "SD_Sky"
		qb = "levels\SD\SD.qb"
		colpre = "SDcol.pre"
		pedpre = "SDped.pre"
		level_qb = "levels\SD\SD_scripts.qb"
		level_sfx_qb = "levels\SD\SD_sfx.qb"
		startup_script = SD_Startup
		goals_script = SD_goals
		setup_script = SD_setup
		default_stats = 7
		level_number = LevelNum_SD
		extranetanimsscript = animload_Ped_Driver
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 80.0
		pitch_0 = 330.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 280.0
		pitch_1 = 330.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 0
		fog_blue = 0
		fog_green = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
		num_f_legs = 3
	}
	Level_UP_SD = {
		structure_name = Level_UP_SD
		load_script = Load_UP_SD
		name = "San Diego"
		loading_screen = "loadscrn_diego"
		loading_time = 18
		pre = "SD.pre"
		scnpre = "SDscn.pre"
		level = "SD"
		sky = "SD_Sky"
		qb = "levels\thug_plus\SD.qb"
		colpre = "SDcol.pre"
		pedpre = "SDped.pre"
		level_qb = "levels\SD\SD_scripts.qb"
		level_sfx_qb = "levels\SD\SD_sfx.qb"
		startup_script = SD_Startup
		goals_script = SD_goals
		setup_script = SD_setup
		default_stats = 7
		level_number = LevelNum_Default
		extranetanimsscript = animload_Ped_Driver
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 80.0
		pitch_0 = 330.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 280.0
		pitch_1 = 330.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 0
		fog_blue = 0
		fog_green = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
		num_f_legs = 3
	}
	Level_HI = {
		structure_name = Level_HI
		load_script = Load_HI
		name = "Hawaii"
		loading_screen = "loadscrn_hawaii"
		loading_time = 20
		pre = "HI.pre"
		scnpre = "HIscn.pre"
		level = "HI"
		sky = "HI_Sky"
		qb = "levels\HI\HI.qb"
		colpre = "HIcol.pre"
		pedpre = "HIped.pre"
		level_qb = "levels\HI\HI_scripts.qb"
		level_sfx_qb = "levels\HI\HI_sfx.qb"
		startup_script = HI_Startup
		goals_script = HI_goals
		setup_script = HI_setup
		default_stats = 7
		level_number = LevelNum_HI
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 320.0
		pitch_0 = 330.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 160.0
		pitch_1 = 330.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 150
		fog_blue = 235
		fog_green = 170
		fog_alpha = 38
		fog_dist = 700
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
		num_f_legs = 3
	}
	Level_UP_HI = {
		structure_name = Level_UP_HI
		load_script = Load_UP_HI
		name = "Hawaii"
		loading_screen = "loadscrn_hawaii"
		loading_time = 20
		pre = "HI.pre"
		scnpre = "HIscn.pre"
		level = "HI"
		sky = "HI_Sky"
		qb = "levels\thug_plus\HI.qb"
		colpre = "HIcol.pre"
		pedpre = "HIped.pre"
		level_qb = "levels\HI\HI_scripts.qb"
		level_sfx_qb = "levels\HI\HI_sfx.qb"
		startup_script = HI_Startup
		goals_script = HI_goals
		setup_script = HI_setup
		default_stats = 7
		level_number = LevelNum_Default
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 320.0
		pitch_0 = 330.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 160.0
		pitch_1 = 330.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 150
		fog_blue = 235
		fog_green = 170
		fog_alpha = 38
		fog_dist = 700
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
		num_f_legs = 3
	}
	Level_VC = {
		structure_name = Level_VC
		load_script = Load_VC
		name = "Vancouver"
		loading_screen = "loadscrn_vancouver"
		loading_time = 19
		pre = "VC.pre"
		scnpre = "VCscn.pre"
		level = "VC"
		sky = "VC_Sky"
		qb = "levels\VC\VC.qb"
		colpre = "VCcol.pre"
		pedpre = "VCped.pre"
		level_qb = "levels\VC\VC_scripts.qb"
		level_sfx_qb = "levels\VC\VC_sfx.qb"
		startup_script = VC_Startup
		goals_script = VC_goals
		setup_script = VC_setup
		default_stats = 8
		level_number = LevelNum_VC
		extranetanimsscript = animload_Ped_Driver
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 200.0
		pitch_0 = 330.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 40.0
		pitch_1 = 330.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 80
		fog_green = 90
		fog_blue = 120
		fog_alpha = 30
		fog_dist = 300.0
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
	}
	Level_SJ = {
		structure_name = Level_SJ
		load_script = Load_SJ
		name = "Slam City Jam"
		loading_screen = "loadscrn_slam"
		loading_time = 12
		pre = "SJ.pre"
		scnpre = "SJscn.pre"
		level = "SJ"
		qb = "levels\SJ\SJ.qb"
		colpre = "SJcol.pre"
		pedpre = "SJped.pre"
		level_qb = "levels\SJ\SJ_scripts.qb"
		level_sfx_qb = "levels\SJ\SJ_sfx.qb"
		startup_script = SJ_Startup
		goals_script = SJ_goals
		setup_script = SJ_setup
		default_stats = 8
		level_number = LevelNum_SJ
		ambient_red = 58
		ambient_green = 57
		ambient_blue = 59
		ambient_mod_factor = 0.75
		heading_0 = 351
		pitch_0 = 303
		red_0 = 80
		green_0 = 63
		blue_0 = 59
		mod_factor_0 = 1.25999999
		heading_1 = 314
		pitch_1 = 272
		red_1 = 47
		green_1 = 50
		blue_1 = 52
		mod_factor_1 = 0.46000001
		fog_red = 27
		fog_blue = 23
		fog_green = 19
		fog_alpha = 70
		fog_dist = 705
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
	}
	Level_RU = {
		structure_name = Level_RU
		load_script = Load_RU
		name = "Moscow"
		loading_screen = "loadscrn_moscow"
		loading_time = 14
		pre = "RU.pre"
		scnpre = "RUscn.pre"
		level = "RU"
		sky = "RU_Sky"
		qb = "levels\RU\RU.qb"
		colpre = "RUcol.pre"
		pedpre = "RUped.pre"
		level_qb = "levels\RU\RU_scripts.qb"
		level_sfx_qb = "levels\RU\RU_sfx.qb"
		startup_script = RU_Startup
		goals_script = RU_goals
		setup_script = RU_setup
		default_stats = 9
		level_number = LevelNum_RU
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 135.0
		pitch_0 = 330.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 300.0
		pitch_1 = 330.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 140
		fog_blue = 135
		fog_green = 135
		fog_alpha = 50
		fog_dist = 500
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
		num_f_legs = 3
	}
	Level_AU = {
		structure_name = Level_AU
		load_script = Load_AU
		name = "Australia"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		pre = "AU.pre"
		scnpre = "AUscn.pre"
		level = "AU"
		sky = "AU_Sky"
		qb = "levels\AU\AU.qb"
		colpre = "AUcol.pre"
		pedpre = "AUped.pre"
		level_qb = "levels\AU\AU_scripts.qb"
		level_sfx_qb = "levels\AU\AU_sfx.qb"
		startup_script = AU_Startup
		goals_script = AU_goals
		setup_script = AU_setup
		default_stats = 9
		level_number = LevelNum_AU
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 120.0
		pitch_0 = -127.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = -45.0
		pitch_1 = -110.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 0
		fog_blue = 0
		fog_green = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
	}
	Level_SE = {
		structure_name = Level_SE
		load_script = Load_SE
		name = "Hotter Than Hell"
		loading_screen = "loadscrn_secret"
		loading_time = 18
		pre = "SE.pre"
		scnpre = "SEscn.pre"
		level = "SE"
		sky = "SE_Sky"
		qb = "levels\SE\SE.qb"
		colpre = "SEcol.pre"
		pedpre = "SEped.pre"
		level_qb = "levels\SE\SE_scripts.qb"
		level_sfx_qb = "levels\SE\SE_sfx.qb"
		startup_script = SE_Startup
		goals_script = SE_goals
		setup_script = SE_setup
		default_stats = 10
		level_number = LevelNum_SE
		extranetanimsscript = animload_Ped_Baha
		ambient_red = 44
		ambient_green = 37
		ambient_blue = 29
		ambient_mod_factor = 0.30000001
		heading_0 = 50.0
		pitch_0 = 360.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = 270.0
		pitch_1 = 330.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 0
		fog_blue = 0
		fog_green = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 8
		num_m_torsos = 8
		num_m_legs = 6
	}
	Level_TestLevel = {
		structure_name = Level_TestLevel
		load_script = Load_TestLevel
		name = "TestLevel"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		pre = "TestLevel.pre"
		scnpre = "TestLevelscn.pre"
		level = "TestLevel"
		qb = "levels\TestLevel\TestLevel.qb"
		colpre = "TestLevelcol.pre"
		pedpre = "TestLevelped.pre"
		level_qb = "levels\TestLevel\TestLevel_scripts.qb"
		startup_script = TestLevel_Startup
		goals_script = TestLevel_goals
		setup_script = TestLevel_setup
		default_stats = 10
		level_number = LevelNum_Default
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 120.0
		pitch_0 = -127.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = -45.0
		pitch_1 = -110.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 0
		fog_blue = 0
		fog_green = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 10
		num_m_torsos = 10
		num_m_legs = 8
	}
	Level_SC = {
		structure_name = Level_SC
		load_script = Load_SC
		name = "Old School"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		loading_time_xbox = 3
		pre = "SC.pre"
		scnpre = "SCscn.pre"
		level = "SC"
		sky = "SC_Sky"
		qb = "levels\SC\SC.qb"
		colpre = "SCcol.pre"
		pedpre = "SCped.pre"
		level_qb = "levels\SC\SC_scripts.qb"
		startup_script = SC_Startup
		goals_script = SC_goals
		setup_script = SC_setup
		default_stats = 5
		level_number = LevelNum_SC
		ambient_red = 89
		ambient_green = 79
		ambient_blue = 79
		ambient_mod_factor = 0.2
		heading_0 = 240
		pitch_0 = 190
		red_0 = 255
		green_0 = 255
		blue_0 = 255
		mod_factor_0 = 1.39999998
		heading_1 = 200
		pitch_1 = 190
		red_1 = 108
		green_1 = 78
		blue_1 = 78
		mod_factor_1 = 0.1
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	Level_DJ = {
		structure_name = Level_DJ
		load_script = Load_DJ
		name = "Old Downhill Jam"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		pre = "DJ.pre"
		scnpre = "DJscn.pre"
		level = "DJ"
		sky = "DJ_Sky"
		qb = "levels\DJ\DJ.qb"
		colpre = "DJcol.pre"
		pedpre = "DJped.pre"
		level_qb = "levels\DJ\DJ_scripts.qb"
		startup_script = DJ_Startup
		goals_script = DJ_goals
		setup_script = DJ_setup
		default_stats = 5
		level_number = LevelNum_DJ
		ambient_red = 89
		ambient_green = 79
		ambient_blue = 79
		ambient_mod_factor = 0.2
		heading_0 = 240
		pitch_0 = 190
		red_0 = 255
		green_0 = 255
		blue_0 = 255
		mod_factor_0 = 1.39999998
		heading_1 = 200
		pitch_1 = 190
		red_1 = 108
		green_1 = 78
		blue_1 = 78
		mod_factor_1 = 0.1
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	Level_PH = {
		structure_name = Level_PH
		load_script = Load_PH
		name = "Old Philly"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		pre = "PH.pre"
		scnpre = "PHscn.pre"
		level = "PH"
		sky = "PH_Sky"
		qb = "levels\PH\PH.qb"
		colpre = "PHcol.pre"
		pedpre = "PHped.pre"
		level_qb = "levels\PH\PH_scripts.qb"
		startup_script = PH_Startup
		goals_script = PH_goals
		setup_script = PH_setup
		default_stats = 5
		level_number = LevelNum_PH
		ambient_red = 89
		ambient_green = 79
		ambient_blue = 79
		ambient_mod_factor = 0.2
		heading_0 = 240
		pitch_0 = 190
		red_0 = 255
		green_0 = 255
		blue_0 = 255
		mod_factor_0 = 1.39999998
		heading_1 = 200
		pitch_1 = 190
		red_1 = 108
		green_1 = 78
		blue_1 = 78
		mod_factor_1 = 0.1
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	Level_VN = {
		structure_name = Level_VN
		load_script = Load_VN
		name = "Old Venice"
		loading_screen = "loadscrn_THPS2_ven"
		loading_time = 7
		pre = "VN.pre"
		scnpre = "VNscn.pre"
		level = "VN"
		sky = "vn_Sky"
		qb = "levels\VN\VN.qb"
		colpre = "VNcol.pre"
		pedpre = "VNped.pre"
		level_qb = "levels\VN\VN_scripts.qb"
		startup_script = VN_Startup
		goals_script = VN_goals
		setup_script = VN_setup
		default_stats = 5
		level_number = LevelNum_VN
		ambient_red = 89
		ambient_green = 79
		ambient_blue = 79
		ambient_mod_factor = 0.2
		heading_0 = 240
		pitch_0 = 190
		red_0 = 255
		green_0 = 255
		blue_0 = 255
		mod_factor_0 = 1.39999998
		heading_1 = 200
		pitch_1 = 190
		red_1 = 108
		green_1 = 78
		blue_1 = 78
		mod_factor_1 = 0.1
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	Level_HN = {
		structure_name = Level_HN
		load_script = Load_hn
		name = "Old Hangar"
		loading_screen = "loadscrn_THPS2_hang"
		loading_time = 5.5
		loading_time_xbox = 3.5
		pre = "HN.pre"
		scnpre = "HNscn.pre"
		level = "HN"
		sky = "HN_Sky"
		qb = "levels\HN\HN.qb"
		colpre = "HNcol.pre"
		pedpre = "HNped.pre"
		level_qb = "levels\HN\HN_scripts.qb"
		startup_script = HN_Startup
		goals_script = HN_goals
		setup_script = HN_setup
		default_stats = 5
		level_number = LevelNum_HN
		ambient_red = 89
		ambient_green = 79
		ambient_blue = 79
		ambient_mod_factor = 0.2
		heading_0 = 240
		pitch_0 = 190
		red_0 = 255
		green_0 = 255
		blue_0 = 255
		mod_factor_0 = 1.39999998
		heading_1 = 200
		pitch_1 = 190
		red_1 = 108
		green_1 = 78
		blue_1 = 78
		mod_factor_1 = 0.1
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	Level_SC2 = {
		structure_name = Level_SC2
		load_script = Load_sc2
		name = "School II"
		loading_screen = "loadscrn_THPS2_sch"
		loading_time = 8.5
		pre = "SC2.pre"
		scnpre = "SC2scn.pre"
		level = "SC2"
		sky = "sc2_Sky"
		qb = "levels\SC2\SC2.qb"
		colpre = "SC2col.pre"
		pedpre = "SC2ped.pre"
		level_qb = "levels\SC2\SC2_scripts.qb"
		startup_script = SC2_Startup
		goals_script = SC2_goals
		setup_script = SC2_setup
		default_stats = 5
		level_number = LevelNum_SC2
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	Level_UP_SC2 = {
		structure_name = Level_UP_SC2
		load_script = Load_UP_sc2
		name = "* School II+"
		loading_screen = "loadscrn_THPS2_sch"
		loading_time = 8.5
		level = "UP_SC2"
		sky = "UP_sc2_Sky"
		qb = "levels\UP_SC2\UP_SC2.qb"
		level_qb = "levels\UP_SC2\UP_SC2_scripts.qb"
		startup_script = UP_SC2_Startup
		goals_script = UP_SC2_goals
		setup_script = UP_SC2_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	
	
	Level_Par = {
		structure_name = Level_Par
		load_script = Load_Par
		name = "* Paris"
		loading_screen = "loadscrn_generic"
		loading_time = 8.5
		level = "Par"
		sky = "Par_Sky"
		qb = "levels\Par\Par.qb"
		level_qb = "levels\Par\Par_scripts.qb"
		startup_script = Par_Startup
		goals_script = Par_goals
		setup_script = Par_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	
	Level_Foo = {
		structure_name = Level_Foo
		load_script = Load_Foo
		name = "* Foo"
		loading_screen = "loadscrn_generic"
		loading_time = 8.5
		level = "Foo"
		sky = "Foo_Sky"
		qb = "levels\Foo\Foo.qb"
		level_qb = "levels\Foo\Foo_scripts.qb"
		startup_script = Foo_Startup
		goals_script = Foo_goals
		setup_script = Foo_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	
	Level_BW = {
		structure_name = Level_BW
		load_script = Load_BW
		name = "* Blackwell"
		loading_screen = "loadscrn_generic"
		loading_time = 8.5
		level = "Blackwell"
		sky = "NJ_Sky"
		qb = "levels\Blackwell\Blackwell.qb"
		level_qb = "levels\Blackwell\Blackwell_scripts.qb"
		startup_script = Blackwell_Startup
		goals_script = Blackwell_goals
		setup_script = Blackwell_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	
	Level_Oil = {
		structure_name = Level_Oil
		load_script = Load_Oil
		name = "* Oil Rig"
		loading_screen = "loadscrn_generic"
		loading_time = 8.5
		level = "Oil"
		sky = "Oil_Sky"
		qb = "levels\Oil\Oil.qb"
		level_qb = "levels\Oil\Oil_scripts.qb"
		desired_tod = set_tod_day
		startup_script = Oil_Startup
		goals_script = Oil_goals
		setup_script = Oil_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	
    // ---------------------------------------------------
    // - THPS2 Skate Heaven
    // ---------------------------------------------------
	Level_Hvn = {
		structure_name = Level_Hvn
		load_script = Load_Hvn
		name = "* Skate Heaven"
		loading_screen = "loadscrn_generic"
		loading_time = 8.5
		level = "Hvn"
		sky = "Hvn_Sky"
		qb = "levels\Hvn\Hvn.qb"
		level_qb = "levels\Hvn\Hvn_scripts.qb"
		startup_script = Hvn_Startup
		goals_script = Hvn_goals
		setup_script = Hvn_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	
    // ---------------------------------------------------
    // - Underground+ THPS4 Alcatraz!
    // ---------------------------------------------------
    Level_UP_Alc = {
        structure_name = Level_UP_Alc 
        load_script = Load_UP_Alc 
        name = "* Alcatraz+" 
        loading_screen = "loadscrn_generic" 
        loading_time = 8.5 
        level = "UP_Alc" 
        sky = "UP_Alc_Sky" 
        pre = "NY.pre" 
        qb = "levels\UP_Alc\UP_Alc.qb" 
        pedpre = "NYped.pre" 
        level_qb = "levels\UP_Alc\UP_Alc_scripts.qb" 
        level_sfx_qb = "levels\UP_Alc\UP_Alc_sfx.qb" 
        startup_script = DevLevel_Startup 
        setup_script = DevLevel_setup 
        default_stats = 5 
        level_number = LevelNum_Default 
        desired_tod = tod_null 
        ambient_red = 30 
        ambient_green = 20 
        ambient_blue = 20 
        ambient_mod_factor = 0.200000002980232 
        heading_0 = 140 
        pitch_0 = 0 
        red_0 = 136 
        green_0 = 120 
        blue_0 = 110 
        mod_factor_0 = 0 
        heading_1 = 0 
        pitch_1 = 0 
        red_1 = 72 
        green_1 = 70 
        blue_1 = 66 
        mod_factor_1 = 0 
        fog_red = 0 
        fog_green = 0 
        fog_blue = 0 
        fog_alpha = 0 
        fog_dist = 0 
        num_m_heads = 4 
        num_m_torsos = 4 
        num_m_legs = 4 
    }

    Level_HD_VN = {
        structure_name = Level_HD_VN 
        load_script = Load_HD_VN 
        name = "* Venice HD+" 
        loading_screen = "loadscrn_generic" 
        loading_time = 8.5 
        level = "HD_VN" 
        level_low = "HD_VN_low" 
        level_mid = "HD_VN_mid" 
        sky = "HD_VN_Sky" 
        pre = "NY.pre" 
        qb = "levels\HD_VN\HD_VN.qb" 
        pedpre = "NYped.pre" 
        level_qb = "levels\HD_VN\HD_VN_scripts.qb" 
        level_sfx_qb = "levels\HD_VN\HD_VN_sfx.qb" 
        startup_script = HD_VN_Startup 
        setup_script = HD_VN_setup 
        goals_script = HD_VN_Goals 
        default_stats = 5 
        level_number = LevelNum_Default 
        desired_tod = tod_null 
        ambient_red = 42 
        ambient_green = 31 
        ambient_blue = 30 
        ambient_mod_factor = 0 
        heading_0 = 352 
        pitch_0 = 350 
        red_0 = 104 
        green_0 = 101 
        blue_0 = 60 
        mod_factor_0 = 0.200000002980232 
        heading_1 = 100 
        pitch_1 = 350 
        red_1 = 45 
        green_1 = 42 
        blue_1 = 38 
        mod_factor_1 = 0.200000002980232 
        fog_red = 0 
        fog_green = 0 
        fog_blue = 0 
        fog_alpha = 0 
        fog_dist = 0 
        num_m_heads = 4 
        num_m_torsos = 4 
        num_m_legs = 4 
    }
    Level_HD_CA = { 
        structure_name = Level_HD_CA 
        load_script = Load_HD_CA 
        name = "* Canada HD+" 
        loading_screen = "loadscrn_generic" 
        loading_time = 8.5 
        level = "HD_CA" 
        sky = "HD_CA_Sky" 
        pre = "NY.pre" 
        qb = "levels\HD_CA\HD_CA.qb" 
        pedpre = "NYped.pre" 
        level_qb = "levels\HD_CA\HD_CA_scripts.qb" 
        level_sfx_qb = "levels\HD_CA\HD_CA_sfx.qb" 
        startup_script = DevLevel_Startup 
        setup_script = DevLevel_setup 
        default_stats = 5 
        level_number = LevelNum_Default 
        ambient_red = 32 
        ambient_green = 21 
        ambient_blue = 20 
        ambient_mod_factor = 0 
        heading_0 = 352 
        pitch_0 = 350 
        red_0 = 104 
        green_0 = 101 
        blue_0 = 60 
        mod_factor_0 = 0.200000002980232 
        heading_1 = 100 
        pitch_1 = 350 
        red_1 = 45 
        green_1 = 42 
        blue_1 = 38 
        mod_factor_1 = 0.200000002980232 
        fog_red = 0 
        fog_green = 0 
        fog_blue = 0 
        fog_alpha = 0 
        fog_dist = 0 
        num_m_heads = 4 
        num_m_torsos = 4 
        num_m_legs = 4 
    } 
    
    // ---------------------------------------------------
    // - Development Level (use when working on a map)
    // ---------------------------------------------------
	Level_devlevel = {
		structure_name = Level_devlevel
		load_script = Load_devlevel
		name = "* Dev Level"
		loading_screen = "loadscrn_generic"
		loading_time = 8.5
		level = "DevLevel"
		sky = "NJ_Sky"
		qb = "levels\DevLevel\DevLevel.qb"
		level_qb = "levels\DevLevel\DevLevel_scripts.qb"
		startup_script = DevLevel_Startup
		goals_script = DevLevel_goals
		setup_script = DevLevel_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	
	
	Level_TH2_Han = {
		structure_name = Level_TH2_Han
		load_script = Load_TH2_Han
		name = "Hangar"
		loading_screen = "loadscrn_generic"
		loading_time = 8.5
		level = "TH2_Han"
		sky = "NJ_Sky"
		qb = "levels\TH2_Han\TH2_Han.qb"
		level_qb = "levels\TH2_Han\TH2_Han_scripts.qb"
		
		startup_script = TH2_Han_Startup
		goals_script = TH2_Han_goals
		setup_script = TH2_Han_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	Level_TH3_SI = {
		structure_name = Level_TH3_SI
		load_script = Load_TH3_SI
		name = "Skater Island"
		loading_screen = "loadscrn_generic"
		loading_time = 8.5
		level = "TH3_SI"
		sky = "TH3_SI_Sky"
		qb = "levels\TH3_SI\TH3_SI.qb"
		level_qb = "levels\TH3_SI\TH3_SI_scripts.qb"
		desired_tod = set_tod_day
		startup_script = TH3_SI_Startup
		goals_script = TH3_SI_goals
		setup_script = TH3_SI_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	
	Level_TH3_LA = {
		structure_name = Level_TH3_LA
		load_script = Load_TH3_LA
		name = "Los Angeles"
		loading_screen = "loadscrn_generic"
		loading_time = 8.5
		level = "TH3_LA"
		sky = "NJ_Sky"
		qb = "levels\TH3_LA\TH3_LA.qb"
		level_qb = "levels\TH3_LA\TH3_LA_scripts.qb"
		desired_tod = set_tod_day
		startup_script = TH3_LA_Startup
		goals_script = TH3_LA_goals
		setup_script = TH3_LA_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	
	Level_P8_Sub = {
		structure_name = Level_P8_Sub
		load_script = Load_P8_Sub
		name = "Suburbs"
		loading_screen = "loadscrn_generic"
		loading_time = 8.5
		level = "P8_Sub"
		sky = "NJ_Sky"
		qb = "levels\P8_Sub\P8_Sub.qb"
		level_qb = "levels\P8_Sub\P8_Sub_scripts.qb"
		
		startup_script = AW_Sub_Startup
		goals_script = AW_Sub_goals
		setup_script = AW_Sub_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	Level_AW_Mar = {
		structure_name = Level_AW_Mar
		load_script = Load_AW_Mar
		name = "Marseille"
		loading_screen = "loadscrn_generic"
		loading_time = 8.5
		level = "AW_Mar"
		sky = "NJ_Sky"
		qb = "levels\AW_Mar\AW_Mar.qb"
		level_qb = "levels\AW_Mar\AW_Mar_scripts.qb"
		desired_tod = set_tod_day
		startup_script = AW_Mar_Startup
		goals_script = AW_Mar_goals
		setup_script = AW_Mar_setup
		default_stats = 5
		level_number = LevelNum_Default
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.2
		heading_0 = -30
		pitch_0 = -60
		red_0 = 110
		green_0 = 110
		blue_0 = 105
		mod_factor_0 = 0.89999998
		heading_1 = 200
		pitch_1 = 33
		red_1 = 23
		green_1 = 24
		blue_1 = 30
		mod_factor_1 = 0.89999998
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	
	
	
	
	
	Level_WWW = {
		structure_name = Level_WWW
		load_script = Load_WWW
		name = "West Side"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		pre = "cas_bedroom.pre"
		scnpre = "cas_bedroomscn.pre"
		level = "cas_bedroom"
		sky = "CAS_bedroom_Sky"
		qb = "levels\cas_bedroom\cas_bedroom.qb"
		colpre = "cas_bedroomcol.pre"
		level_qb = "levels\cas_bedroom\cas_bedroom_scripts.qb"
		default_stats = 5
		level_number = LevelNum_WWW
		ambient_red = 89
		ambient_green = 79
		ambient_blue = 79
		ambient_mod_factor = 0.2
		heading_0 = 240
		pitch_0 = 190
		red_0 = 255
		green_0 = 255
		blue_0 = 255
		mod_factor_0 = 1.39999998
		heading_1 = 200
		pitch_1 = 190
		red_1 = 108
		green_1 = 78
		blue_1 = 78
		mod_factor_1 = 0.1
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	Level_Test = {
		structure_name = Level_Test
		load_script = Load_Test
		name = "Manhattan"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		pre = "Test.pre"
		scnpre = "Testscn.pre"
		level = "Test"
		sky = "NY_Sky"
		qb = "levels\Test\Test.qb"
		colpre = "Testcol.pre"
		pedpre = "Testped.pre"
		level_qb = "levels\NY\NY_scripts.qb"
		startup_script = NY_Startup
		goals_script = NY_goals
		setup_script = NY_setup
		default_stats = 6
		level_number = LevelNum_NY
		ambient_red = 69
		ambient_green = 72
		ambient_blue = 79
		ambient_mod_factor = 0.30000001
		heading_0 = 120.0
		pitch_0 = -127.0
		red_0 = 130
		green_0 = 120
		blue_0 = 97
		mod_factor_0 = 1.39999998
		heading_1 = -45.0
		pitch_1 = -110.0
		red_1 = 58
		green_1 = 62
		blue_1 = 66
		mod_factor_1 = 0.1
		fog_red = 0
		fog_blue = 0
		fog_green = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	script Load_SkateShop
		load_level level_Mainmenu
	endscript
	level_Mainmenu = {
		structure_name = level_Mainmenu
		load_script = Load_SkateShop
		name = "Skateshop"
		loading_screen = "loadscrn_generic"
		loading_time = 7.5
		loading_time_xbox = 3.5
		level_name = "skateshop"
		pre = "mainmenu.pre"
		scnpre = "mainmenuscn.pre"
		level = "mainmenu"
		qb = "levels\mainmenu\mainmenu.qb"
		colpre = "mainmenucol.pre"
		level_qb = "levels\thug_plus\mainmenu_scripts.qb"
		startup_script = mainmenu_startup
		default_stats = 8
		level_number = LevelNum_Skateshop
		frontend_level = 1
		ambient_red = 66
		ambient_green = 67
		ambient_blue = 68
		ambient_mod_factor = 0.0
		heading_0 = -90.0
		pitch_0 = -10.0
		red_0 = 0
		green_0 = 0
		blue_0 = 0
		mod_factor_0 = 0.0
		heading_1 = -120.0
		pitch_1 = 120.0
		red_1 = 0
		green_1 = 0
		blue_1 = 0
		mod_factor_1 = 0.0
	}
	script Load_CAS
		load_level level_cas
	endscript
	level_cas = {
		structure_name = level_cas
		load_script = Load_CAS
		name = "CAS"
		loading_screen = "loadscrn_mainmenu"
		loading_time = 14.5
		loading_time_xbox = 4.5
		pre = "cas_bedroom.pre"
		scnpre = "cas_bedroomscn.pre"
		level = "cas_bedroom"
		sky = "CAS_bedroom_Sky"
		qb = "levels\cas_bedroom\cas_bedroom.qb"
		colpre = "cas_bedroomcol.pre"
		level_qb = "levels\thug_plus\cas_bedroom_scripts.qb"
		startup_script = cas_bedroom_startup
		default_stats = 8
		level_number = LevelNum_CAS
		frontend_level = 1
		ambient_red = 66
		ambient_green = 67
		ambient_blue = 68
		ambient_mod_factor = 0.0
		heading_0 = 220.0
		pitch_0 = 320.0
		red_0 = 45
		green_0 = 35
		blue_0 = 32
		mod_factor_0 = 0.0
		heading_1 = 10.0
		pitch_1 = 320.0
		red_1 = 32
		green_1 = 34
		blue_1 = 26
		mod_factor_1 = 0.0
	}
	script load_boardshop
		load_level level_boardshop
	endscript
	level_boardshop = {
		structure_name = level_boardshop
		load_script = load_boardshop
		name = "Boardshop"
		loading_screen = "loadscrn_boardshop"
		loading_time = 7.5
		loading_time_xbox = 3
		pre = "nj_skateshop.pre"
		scnpre = "nj_skateshopscn.pre"
		level = "nj_skateshop"
		qb = "levels\nj_skateshop\nj_skateshop.qb"
		colpre = "nj_skateshopcol.pre"
		level_qb = "levels\thug_plus\nj_skateshop_scripts.qb"
		startup_script = boardshop_startup
		level_number = LevelNum_Boardshop
		frontend_level = 1
		ambient_red = 66
		ambient_green = 67
		ambient_blue = 68
		ambient_mod_factor = 0.0
		heading_0 = -220.0
		pitch_0 = -40.0
		red_0 = 100
		green_0 = 97
		blue_0 = 92
		mod_factor_0 = 0.0
		heading_1 = -180.0
		pitch_1 = 100.0
		red_1 = 37
		green_1 = 34
		blue_1 = 26
		mod_factor_1 = 0.0
	}
	
	Level_THPS4SkateShop = {
		structure_name = Level_THPS4SkateShop
		load_script = load_thps4skateshop
		name = "SkateShop"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		pre = "skateshop.pre"
		scnpre = "skateshopscn.pre"
		level = "skateshop"
		sky = "skateshop_sky"
		qb = "levels\thug_plus\skateshop.qb"
		colpre = "skateshopcol.pre"
		level_qb = "levels\skateshop\skateshop_scripts.qb"
		startup_script = Skateshop_Startup
		level_number = LevelNum_Boardshop
		frontend_level = 1
		ambient_red = 66
		ambient_green = 67
		ambient_blue = 68
		ambient_mod_factor = 0.0
		heading_0 = -220.0
		pitch_0 = -40.0
		red_0 = 100
		green_0 = 97
		blue_0 = 92
		mod_factor_0 = 0.0
		heading_1 = -180.0
		pitch_1 = 100.0
		red_1 = 37
		green_1 = 34
		blue_1 = 26
		mod_factor_1 = 0.0
	}
	
	level_sk5ed1_shell = {
		structure_name = level_sk5ed1_shell
		load_script = load_sk5ed1_shell
		name = "Sk5Ed1"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		level = "sk5ed_shell"
		sky = "sk5ed_sky"
		qb = "levels\sk5ed_shell\sk5ed_shell.qb"
		colpre = "sk5ed_shellcol.pre"
		startup_script = HN_Startup
		default_stats = 5
		level_number = LevelNum_Boardshop
		ambient_red = 89
		ambient_green = 79
		ambient_blue = 79
		ambient_mod_factor = 0.2
		heading_0 = 240
		pitch_0 = 190
		red_0 = 255
		green_0 = 255
		blue_0 = 255
		mod_factor_0 = 1.39999998
		heading_1 = 200
		pitch_1 = 190
		red_1 = 108
		green_1 = 78
		blue_1 = 78
		mod_factor_1 = 0.1
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	level_sk5ed2_shell = {
		structure_name = level_sk5ed2_shell
		load_script = load_sk5ed2_shell
		name = "Sk5Ed2"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		level = "sk5ed2_shell"
		sky = "sk5ed2_sky"
		qb = "levels\sk5ed2_shell\sk5ed2_shell.qb"
		colpre = "sk5ed2_shellcol.pre"
		startup_script = HN_Startup
		default_stats = 5
		level_number = LevelNum_Boardshop
		ambient_red = 89
		ambient_green = 79
		ambient_blue = 79
		ambient_mod_factor = 0.2
		heading_0 = 240
		pitch_0 = 190
		red_0 = 255
		green_0 = 255
		blue_0 = 255
		mod_factor_0 = 1.39999998
		heading_1 = 200
		pitch_1 = 190
		red_1 = 108
		green_1 = 78
		blue_1 = 78
		mod_factor_1 = 0.1
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	level_sk5ed3_shell = {
		structure_name = level_sk5ed3_shell
		load_script = load_sk5ed3_shell
		name = "Sk5Ed3"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		level = "sk5ed3_shell"
		sky = "sk5ed3_sky"
		qb = "levels\sk5ed3_shell\sk5ed3_shell.qb"
		colpre = "sk5ed3_shellcol.pre"
		startup_script = HN_Startup
		default_stats = 5
		level_number = LevelNum_Boardshop
		ambient_red = 89
		ambient_green = 79
		ambient_blue = 79
		ambient_mod_factor = 0.2
		heading_0 = 240
		pitch_0 = 190
		red_0 = 255
		green_0 = 255
		blue_0 = 255
		mod_factor_0 = 1.39999998
		heading_1 = 200
		pitch_1 = 190
		red_1 = 108
		green_1 = 78
		blue_1 = 78
		mod_factor_1 = 0.1
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	level_sk5ed4_shell = {
		structure_name = level_sk5ed4_shell
		load_script = load_sk5ed4_shell
		name = "Sk5Ed4"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		level = "sk5ed4_shell"
		sky = "sk5ed4_sky"
		qb = "levels\sk5ed4_shell\sk5ed4_shell.qb"
		default_stats = 5
		level_number = LevelNum_Boardshop
		ambient_red = 89
		ambient_green = 79
		ambient_blue = 79
		ambient_mod_factor = 0.2
		heading_0 = 240
		pitch_0 = 190
		red_0 = 255
		green_0 = 255
		blue_0 = 255
		mod_factor_0 = 1.39999998
		heading_1 = 200
		pitch_1 = 190
		red_1 = 108
		green_1 = 78
		blue_1 = 78
		mod_factor_1 = 0.1
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	level_sk5ed5_shell = {
		structure_name = level_sk5ed5_shell
		load_script = load_sk5ed5_shell
		name = "Sk5Ed5"
		loading_screen = "loadscrn_generic"
		loading_time = 9.5
		level = "sk5ed5_shell"
		sky = "sk5ed5_sky"
		qb = "levels\sk5ed5_shell\sk5ed5_shell.qb"
		colpre = "sk5ed5_shellcol.pre"
		startup_script = HN_Startup
		default_stats = 5
		level_number = LevelNum_Boardshop
		ambient_red = 89
		ambient_green = 79
		ambient_blue = 79
		ambient_mod_factor = 0.2
		heading_0 = 240
		pitch_0 = 190
		red_0 = 255
		green_0 = 255
		blue_0 = 255
		mod_factor_0 = 1.39999998
		heading_1 = 200
		pitch_1 = 190
		red_1 = 108
		green_1 = 78
		blue_1 = 78
		mod_factor_1 = 0.1
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
		num_m_heads = 4
		num_m_torsos = 4
		num_m_legs = 4
	}
	
	script GenerateLevelStructureNameFromTheme
		if (<theme> > 0)
			FormatText ChecksumName = structure_name "Level_sk5ed%d" d = (<theme> + 1)
		else
			structure_name = Level_Sk5Ed
		endif
		return structure_name = <structure_name>
	endscript
	script Load_Sk5Ed
		GetEditorTheme
		load_parked_textures_to_main_memory
		GenerateLevelStructureNameFromTheme theme = <theme>
		if isXbox
			load_level <structure_name> loading_screen = "loadscrn_editor_x"
		endif
		if isNGC
			load_level <structure_name> loading_screen = "loadscrn_editor_ngc"
		endif
		if IsPS2
			load_level <structure_name> loading_screen = "loadscrn_editor"
		endif
	endscript
	script Load_Sk5Ed_gameplay
		GetEditorTheme
		if (<theme> > 0)
			FormatText ChecksumName = structure_name "Level_sk5ed%d" d = (<theme> + 1)
		else
			structure_name = Level_Sk5Ed
		endif
		load_level <structure_name> startup_script = Sk5Ed_Startup_gameplay loading_screen = "loadscrn_created"
	endscript
	Level_sk5ed_defaults =
	{
		park_editor
		load_script = Load_Sk5Ed
		name = "Created Park"
		loading_screen = "loadscrn_editor_play"
		loading_time = 11
		loading_time_xbox = 4.5
		startup_script = Sk5Ed_Startup
		goals_script = Sk5Ed_goals
		default_stats = 10
		level_number = LevelNum_Sk5ed
		
		level = "sk5ed"
		level_name = "sk5ed"
		
		
		level_qb = "levels\thug_plus\sk5ed_scripts.qb"
		qb = "levels\sk5ed\sk5ed.qb"
		extranetanimsscript = animload_Ped_Baha
		ambient_red = 72
		ambient_green = 72
		ambient_blue = 72
		ambient_mod_factor = 0.5
		heading_0 = 90.0
		pitch_0 = -60.0
		red_0 = 75
		green_0 = 75
		blue_0 = 75
		mod_factor_0 = 0.69999999
		heading_1 = 0.0
		pitch_1 = -90.0
		red_1 = 0
		green_1 = 0
		blue_1 = 0
		mod_factor_1 = 1.0
		fog_red = 0
		fog_green = 0
		fog_blue = 0
		fog_alpha = 0
		fog_dist = 0
	}
	Level_Sk5Ed = {
		Level_sk5ed_defaults
		structure_name = Level_Sk5Ed
		loading_time = 8
		loading_time_xbox = 4.5
		
		sky = "sk5ed_Sky"
		outer_shell = "sk5ed_shell"
		theme_name = "Suburbia"
	}
	Level_Sk5Ed2 = {
		Level_sk5ed_defaults
		structure_name = Level_Sk5Ed2
		loading_time = 8
		
		sky = "sk5ed2_Sky"
		outer_shell = "sk5ed2_shell"
		theme_name = "City Rooftop"
	}
	Level_Sk5Ed3 = {
		Level_sk5ed_defaults
		structure_name = Level_Sk5Ed3
		loading_time = 8
		
		sky = "sk5ed3_Sky"
		outer_shell = "sk5ed3_shell"
		theme_name = "Lost Island"
	}
	Level_Sk5Ed4 = {
		Level_sk5ed_defaults
		structure_name = Level_Sk5Ed4
		loading_time = 8
		
		sky = "sk5ed4_Sky"
		outer_shell = "sk5ed4_shell"
		theme_name = "Warehouse"
	}
	Level_Sk5Ed5 = {
		Level_sk5ed_defaults
		structure_name = Level_Sk5Ed5
		loading_time = 11
		scnpre = "sk5ed5scn.pre"
		sky = "sk5ed5_Sky"
		outer_shell = "sk5ed5_shell"
		theme_name = "Prison Yard"
	}
	
	Level_Sk5Ed6 = {
		Level_sk5ed_defaults
		structure_name = Level_Sk5Ed5
		loading_time = 11
		scnpre = "sk5ed5scn.pre"
		sky = "NJ_Sky"
		theme_name = "Blank Theme"
	}
	
	Level_Sk5ed7 = {
		Level_sk5ed_defaults
		structure_name = Level_Sk5Ed5
		loading_time = 11
		
		
		outer_shell = "sk5ed7_shell"
		sky = "sk5ed7_sky"
		theme_name = "SCJ"
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
