
	script default_system_startup
		WriteDNASBinary
		Change select_shift = 1
		PushMemProfile "script default_system_startup before autolaunch"
		SetGlobalFlag flag = LEVEL_UNLOCKED_SCH
		unlock_initial_boards
		
		SetSfxVolume 100
		SetMusicVolume 50
		SetRandomMode 1
		SetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
		if CD
			Change UsePreFilesForLevelLoading = 1
			Change DEVKIT_LEVELS = 0
			Change All_Levels_Unlocked = 0
		endif
		if IsNgc
			Change UsePreFilesForLevelLoading = 1
		endif
		new_screen_element_test
		SetScreenElementProps id = root_window event_handlers = [{pad_start nullscript}] replace_handlers
		printf "replace_handlers to take away start key in load_level"
		setservermode on
		SetJoinMode JOIN_MODE_PLAY
		StartServer
		JoinServer <...>
		CreateGoalEditor
		CreateRailEditor
		PopMemProfile
		
		if Bootstrap
			Change bootstrap_build = 1
			Change STARTGAME_FIRST_TIME = 1
			Change BUMP_STATS = 0
			Change All_Levels_Unlocked = 0
		else
			if CD
				Change BUMP_STATS = 1
				if (DEMO_BUILD)
					autolaunch level = load_skateshop game = career
				else
					launchviewer
					autolaunch level = load_skateshop game = career
				endif
			else
				cheat_select_shift
				auto_launch_viewer
				cheat_give_neversoft_skaters
				LaunchScriptDebugger
			endif
		endif
	endscript
	
	script ksk_menu_starttod
		SpawnScript ksk_looping_tod
	endscript
	script ksk_menu_pausetod
		KillSpawnedScript name = ksk_dynamic_tod
		KillSpawnedScript name = ksk_dynamic_weather
	endscript
	
	_night_lights_on = 0
	script ksk_menu_toggle_lights
		switch _night_lights_on
			case 1
				Change _night_lights_on = 0
				FakeLights percent = 0 time = 0 prefix = TRG_levellight
			case 0
				Change _night_lights_on = 1
				FakeLights percent = 100 time = 0 prefix = TRG_levellight
		endswitch
	endscript
	
	_nighton_on = 0
	script ksk_menu_toggle_nighton
		switch _nighton_on
			case 1
				Change _nighton_on = 0
				kill prefix = "NightOn"
			case 0
				Change _nighton_on = 1
				create prefix = "NightOn"
		endswitch
	endscript
	
	script ksk_menu_dotest
		Skater::Obj_SetFlag FLAG_SKATER_KILLING
		screen_setup_widescreen
		hide_root_window
		SetGlobalFlag flag = CHEAT_PERFECT_SKITCH
		SetGlobalFlag flag = CHEAT_PERFECT_MANUAL
		exit_pause_menu
	endscript
	script ksk_menu_dotest2
		if Skater::Obj_FlagSet FLAG_SKATER_KILLING
			Skater::Obj_ClearFlag FLAG_SKATER_KILLING
		else
			Skater::Obj_SetFlag FLAG_SKATER_KILLING
		endif
		exit_pause_menu
	endscript
	
	script ksk_menu_toggleshift
		if select_shift = 0
			Change select_shift = 1
		else
			Change select_shift = 1
		endif
		exit_pause_menu
	endscript
	
	script ksk_menu_quickmerge
		SpawnScript ksk_menu_quickmerge2 params = {<...>}
		exit_pause_menu
	endscript
	
	script ksk_menu_quickmerge2 level_name = "levels\VN.mdl"
		
		if ObjectExists id = ksk_merged_level
			ksk_merged_level::Die
		endif
		CreateCompositeObject {
			Components = [
				{component = model model = (<level_name>)}
				{component = modellightupdate}
				{component = motion}
				{component = collision Class = LevelGeometry CollisionMode = Geometry}
				{component = NodeArray model = (<level_name>)}
				{component = RailManager}
			]
			params = {name = ksk_merged_level}
		}
		ksk_merged_level::Obj_SetPosition position = (0.0,-10.0,0.0)
	endscript
	
	ksk_skybox_sky = 0
	script ksk_load_skybox sky = "NJ_Sky"
		if (ksk_skybox_sky = 0)
			GetCurrentLevel
			UnloadScene scene = (<level_structure>.sky)
		else
			UnloadScene scene = ksk_skybox_sky
		endif
		LoadScene scene = <sky>
		Change ksk_skybox_sky = <sky>
	endscript
	
	
	ksk_tod_speed = 0.005
	ksk_tod_frames = 1000
	is_cloudy = 0
	
	ksk_tod_morning = [
		{tod = set_tod_morning name = "Morning"}
		{tod = set_tod_nj_morning name = "NJ Morning" cloudy}
	]
	ksk_tod_day = [
		{tod = set_tod_day name = "Day"}
		{tod = set_tod_nj_fog name = "NJ Fog" cloudy}
	]
	ksk_tod_evening = [
		{tod = set_tod_evening name = "Evening" cloudy}
		{tod = set_tod_nj_evening name = "NJ Evening"}
		{tod = set_tod_vc_evening name = "VC Evening" cloudy}
	]
	ksk_tod_night = [
		{tod = set_tod_night name = "Night" cloudy}
		{tod = set_tod_nj_night name = "NJ Night" cloudy}
		{tod = set_tod_ru_night name = "RU Night" cloudy}
	]
	
	script ksk_smooth_nighton
		switch _nighton_on
			case 1
				Change _nighton_on = 0
				kill prefix = "NightOn_A"
				kill prefix = "NightOn_B"
				kill prefix = "NightOn_C"
				wait 120 frames
				kill prefix = "NightOn_D"
				kill prefix = "NightOn_E"
				kill prefix = "NightOn_F"
				wait 120 frames
				kill prefix = "NightOn_G"
				kill prefix = "NightOn_H"
				kill prefix = "NightOn_I"
				wait 120 frames
				kill prefix = "NightOn_J"
				kill prefix = "NightOn_K"
				kill prefix = "NightOn_L"
				wait 120 frames
				kill prefix = "NightOn_M"
				kill prefix = "NightOn_N"
				kill prefix = "NightOn_O"
				wait 120 frames
				kill prefix = "NightOn_P"
				kill prefix = "NightOn_Q"
				kill prefix = "NightOn_R"
				wait 120 frames
				kill prefix = "NightOn_S"
				kill prefix = "NightOn_T"
				kill prefix = "NightOn_U"
				wait 120 frames
				kill prefix = "NightOn_V"
				kill prefix = "NightOn_W"
				kill prefix = "NightOn_X"
				wait 120 frames
				kill prefix = "NightOn"
			case 0
				Change _nighton_on = 1
				create prefix = "NightOn_A"
				create prefix = "NightOn_B"
				create prefix = "NightOn_C"
				wait 120 frames
				create prefix = "NightOn_D"
				create prefix = "NightOn_E"
				create prefix = "NightOn_F"
				wait 120 frames
				create prefix = "NightOn_G"
				create prefix = "NightOn_H"
				create prefix = "NightOn_I"
				wait 120 frames
				create prefix = "NightOn_J"
				create prefix = "NightOn_K"
				create prefix = "NightOn_L"
				wait 120 frames
				create prefix = "NightOn_M"
				create prefix = "NightOn_N"
				create prefix = "NightOn_O"
				wait 120 frames
				create prefix = "NightOn_P"
				create prefix = "NightOn_Q"
				create prefix = "NightOn_R"
				wait 120 frames
				create prefix = "NightOn_S"
				create prefix = "NightOn_T"
				create prefix = "NightOn_U"
				wait 120 frames
				create prefix = "NightOn_V"
				create prefix = "NightOn_W"
				create prefix = "NightOn_X"
				wait 120 frames
				create prefix = "NightOn"
		endswitch
	endscript
	
	script ksk_looping_tod
		
		LoadSound "Weather\Weather_Rain_Light01" FLAG_PERM
		LoadSound "Weather\Weather_Rain_Medium01" FLAG_PERM
		
		KillSpawnedScript name = dynamic_tod
		KillSpawnedScript name = ksk_dynamic_tod
		KillSpawnedScript name = ksk_dynamic_weather
		SpawnScript ksk_dynamic_tod params = {TOD_SPEED = ksk_tod_speed}
		SpawnScript ksk_dynamic_weather
	endscript
	
	script ksk_dynamic_tod TOD_SPEED = 0.025
		
		last_tod = {tod = set_tod_day name = "Day"}
		ksk_cur_tod = 1
		while
			GetRandomArrayElement ksk_tod_morning
			selected_tod_morning = <Element>
			
			
			GetRandomArrayElement ksk_tod_day
			selected_tod_day = <Element>
			
			
			GetRandomArrayElement ksk_tod_evening
			selected_tod_evening = <Element>
			
			
			GetRandomArrayElement ksk_tod_night
			selected_tod_night = <Element>
			
			while
				if (<ksk_cur_tod> < 4)
					
					switch <ksk_cur_tod>
						case 0
							ksk_end_tod = <selected_tod_day>
							<ksk_cur_tod> = 1
						case 1
							ksk_end_tod = <selected_tod_evening>
							<ksk_cur_tod> = 2
						case 2
							ksk_end_tod = <selected_tod_night>
							<ksk_cur_tod> = 3
						case 3
							ksk_end_tod = <selected_tod_morning>
							<ksk_cur_tod> = 4
					endswitch
					
					
					ksk_start_tod = <last_tod>
					<last_tod> = <ksk_end_tod>
					ksk_start_tod_action = (<ksk_start_tod>.tod)
					ksk_end_tod_action = (<ksk_end_tod>.tod)
					
					
					if (StructureContains structure = <ksk_end_tod> name = cloudy)
						Change is_cloudy = 1
					else
						Change is_cloudy = 0
					endif
					
					script_change_tod tod_action = <ksk_start_tod_action> is_local = 1 dynamic_on dontchangelights = <dontchangelights>
					tod_dynamic_start = {lev_red = (lev_red) lev_blue = (lev_blue) lev_green = (lev_green) sky_red = (sky_red) sky_green = (sky_green) sky_blue = (sky_blue)
						fog_red = (fog_red) fog_blue = (fog_blue) fog_green = (fog_green) fog_alpha = (fog_alpha) fog_dist = (fog_dist)
					}
					tod_dynamic_skaterlights_start = (tod_skaterlights)
					<ksk_end_tod_action> dynamic_on
					tod_dynamic_end = {lev_red = (lev_red) lev_blue = (lev_blue) lev_green = (lev_green) sky_red = (sky_red) sky_green = (sky_green) sky_blue = (sky_blue)
						fog_red = (fog_red) fog_blue = (fog_blue) fog_green = (fog_green) fog_alpha = (fog_alpha) fog_dist = (fog_dist)
					}
					tod_dynamic_skaterlights_end = (tod_skaterlights)
					Get_Skaterlight_direction_levelsq
					
					
					FakeLights_running = 0
					Proportion = 0
					Diff = <TOD_SPEED>
					while
						<Proportion> = (<Proportion> + <Diff>)
						if (<Proportion> > 1)
							<FakeLights_running> = 0
							break
						else
							
							
							if ((<ksk_cur_tod> = 3) && (<Proportion> > 0.5) && (<FakeLights_running> = 0))
								<FakeLights_running> = 1
								FakeLights percent = 100 time = 1000 prefix = TRG_levellight
								CarTOD_TurnOnHeadlights
								SpawnScript ksk_smooth_nighton
								
							else
								if ((<ksk_cur_tod> = 4) && (<Proportion> > 0.5) && (<FakeLights_running> = 0))
									<FakeLights_running> = 1
									FakeLights percent = 0 time = 1000 prefix = TRG_levellight
									CarTOD_TurnOffHeadlights
									SpawnScript ksk_smooth_nighton
									
								endif
							endif
							InterpolateParameters a = <tod_dynamic_start> b = <tod_dynamic_end> Proportion = <Proportion> Ignore = [FakeLights_Night_ FakeLights_Night_on FakeLights_Evening_on Headlights_on]
							set_tod_from_params <interpolated>
							InterpolateParameters a = <tod_dynamic_skaterlights_start> b = <tod_dynamic_skaterlights_end> Proportion = <Proportion> Ignore = [] Angles = [heading_0 heading_1 pitch_0 pitch_1]
							set_level_lights <interpolated>
							wait 20 gameframes
						endif
					repeat
					script_change_tod tod_action = <ksk_end_tod_action> is_local = 1 dynamic_on dontchangelights = <dontchangelights>
					
					wait 300 gameframes
				else
					<ksk_cur_tod> = 0
					
					break
				endif
			repeat
		repeat
	endscript
	
	ksk_weather_array = [
		{
			type = rain
			name = "None"
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		{
			type = rain
			name = "None"
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		{
			type = rain
			name = "None"
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		{
			type = rain
			name = "None"
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		{
			type = rain
			name = "None"
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		{
			type = rain
			name = "None"
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		{
			type = rain
			name = "None"
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		{
			type = rain
			name = "None"
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		{
			type = rain
			name = "None"
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		{
			type = rain
			name = "None"
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		{
			type = rain
			name = "None"
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		{
			type = rain
			name = "Heavy rain"
			rain_rate = 40
			splash_rate = 1.5
			snow_rate = 0
		}
		{
			type = rain
			name = "Really Heavy rain"
			rain_rate = 80
			splash_rate = 2.0
			snow_rate = 0
		}
		{
			type = rain
			name = "Showers"
			rain_rate = 10
			splash_rate = 1.0
			snow_rate = 0
		}
		{
			type = snow
			name = "Snow"
			rain_rate = 0
			splash_rate = 0.0
			snow_rate = 3000
		}
	]
	ksk_weather_defaults = {
		
		rain_frames = 26
		rain_height = 1050
		rain_length = 93
		rain_blend = 5
		rain_fixed = 20
		rain_red = 185
		rain_green = 180
		rain_blue = 185
		rain_alpha = 245
		rain_red2 = 130
		rain_green2 = 140
		rain_blue2 = 90
		rain_alpha2 = 255
		splash_rate = 1.0
		splash_life = 8
		splash_size = 6
		splash_blend = 1
		splash_fixed = 1
		splash_red = 244
		splash_green = 246
		splash_blue = 247
		splash_alpha = 128
		
		snow_frames = 194
		snow_height = 464
		snow_size = 3
		snow_blend = 6
		snow_fixed = 24
		snow_red = 128
		snow_green = 128
		snow_blue = 128
		snow_alpha = 128
	}
	script ksk_dynamic_weather WEATHER_SPEED = 0.005
		
		
		snowcolor = 0
		WeatherSetSnowActive
		WeatherSetsnowRate 0
		WeatherSetsnowHeight (ksk_weather_defaults.snow_height)
		WeatherSetsnowFrames (ksk_weather_defaults.snow_frames)
		WeatherSetsnowSize (ksk_weather_defaults.snow_size)
		<snowcolor> = ((ksk_weather_defaults.snow_red) + ((ksk_weather_defaults.snow_green) * 256) + ((ksk_weather_defaults.snow_blue) * 65536) + ((ksk_weather_defaults.snow_alpha) * 16777216))
		get_rain_mode_string snow
		WeatherSetSnowBlendMode <checksum> ((ksk_weather_defaults.snow_fixed) + 0)
		WeatherSetSnowColor <snowcolor>
		
		raincolor = 0
		raincolor2 = 0
		WeatherSetRainActive
		WeatherSetRainHeight (ksk_weather_defaults.rain_height)
		WeatherSetRainFrames (ksk_weather_defaults.rain_frames)
		WeatherSetRainLength (ksk_weather_defaults.rain_length)
		get_rain_mode_string
		WeatherSetRainBlendMode <checksum> ((ksk_weather_defaults.rain_fixed) + 0)
		<raincolor> = ((ksk_weather_defaults.rain_red) + ((ksk_weather_defaults.rain_green) * 256) + ((ksk_weather_defaults.rain_blue) * 65536) + ((ksk_weather_defaults.rain_alpha) * 16777216))
		<raincolor2> = ((ksk_weather_defaults.rain_red2) + ((ksk_weather_defaults.rain_green2) * 256) + ((ksk_weather_defaults.rain_blue2) * 65536) + ((ksk_weather_defaults.rain_alpha2) * 16777216))
		WeatherSetRainColor <raincolor> <raincolor2>
		
		
		WeatherSetSplashLife (ksk_weather_defaults.splash_life)
		WeatherSetSplashSize (ksk_weather_defaults.splash_size)
		<splashcolor> = ((ksk_weather_defaults.splash_red) + ((ksk_weather_defaults.splash_green) * 256) + ((ksk_weather_defaults.splash_blue) * 65536) + ((ksk_weather_defaults.splash_alpha) * 16777216))
		WeatherSetSplashColor <splashcolor>
		
		WeatherSetSplashBlendMode add
		
		ksk_weather_none = {
			type = rain
			rain_rate = 0
			snow_rate = 0
			splash_rate = 0.0
		}
		
		first_item_weather = 0
		
		while
			PermuteArray Array = ksk_weather_array PermuteSource
			while
				Diff = <WEATHER_SPEED>
				Proportion = 0
				if GetNextArrayElement ksk_weather_array
					if (is_cloudy = 1)
						if (<first_item_weather> = 0)
							<first_item> = <ksk_weather_none>
							<first_item_weather> = 1
						endif
						
						
						if ((<Element>.type) = snow)
							WeatherSetRainRate 0
							WeatherSetSplashRate 0
							WeatherSetSnowActive
							
						else
							WeatherSetsnowRate 0
							WeatherSetRainActive
						endif
						
						
						Heavy_Rain_SFX_Off
						Light_Rain_SFX_Off
						if ((<Element>.rain_rate) > 20)
							Heavy_Rain_SFX_On
						else
							if ((<Element>.rain_rate) > 0)
								Light_Rain_SFX_On
							endif
						endif
						
						while
							<Proportion> = (<Proportion> + <Diff>)
							if (<Proportion> > 1)
								break
							endif
							second_item = <Element>
							InterpolateParameters a = <first_item> b = <second_item> Proportion = <Proportion>
							
							if ((<second_item>.type) = rain)
								WeatherSetRainRate (<interpolated>.rain_rate)
								WeatherSetSplashRate (<interpolated>.splash_rate)
							else
								WeatherSetsnowRate (<interpolated>.snow_rate)
							endif
							wait 20 gameframes
						repeat
					else
						
					endif
				else
					
					break
				endif
				wait 400 gameframes
			repeat
		repeat
	endscript
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
