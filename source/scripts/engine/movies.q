
	script playmovie_script_temp
	endscript
	script PlayAllMovies
		playmovie_script "movies\THPS3"
		if GetGlobalFlag flag = MOVIE_UNLOCKED_PRO_BAILS1
			playmovie_script "movies\bails01"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_HAWK
			playmovie_script "movies\tony"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_CABALLERO
			playmovie_script "movies\cab"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_CAMPBELL
			playmovie_script "movies\kareem"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_GLIFBERG
			playmovie_script "movies\rune"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_KOSTON
			playmovie_script "movies\koston"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_LASEK
			playmovie_script "movies\bucky"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_MARGERA
			playmovie_script "movies\bam"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_MULLEN
			playmovie_script "movies\mullen"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_MUSKA
			playmovie_script "movies\muska"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_REYNOLDS
			playmovie_script "movies\andrew"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_ROWLEY
			playmovie_script "movies\rowley"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_STEAMER
			playmovie_script "movies\elissa"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_THOMAS
			playmovie_script "movies\thomas"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_CAS
			playmovie_script "movies\bails02"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_JEDIKNIGHT
			playmovie_script "movies\NSbails"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_WOLVERINE
			playmovie_script "movies\NSmakes"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_DICK
			playmovie_script "movies\proret"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_CARRERA
			playmovie_script "movies\kflip"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_BUM
			playmovie_script "movies\friends"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_SLATER
			playmovie_script "movies\slater"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_DEMONESS
			playmovie_script "movies\nsret"
		endif
		if GetGlobalFlag flag = MOVIE_UNLOCKED_Eyeball
			playmovie_script "movies\day"
		endif
	endscript
	script playmovie_script
		<anims_unloaded> = 0
		<pre_unloaded> = 0
		if LevelIs load_skateshop
			PauseObjects
			<anims_unloaded> = 1
			printf "Unloading anims here"
			do_unload_permanent
			do_unload_unloadable
			if InPreFile "skaterparts.pre"
				UnloadPreFile "skaterparts.pre"
				<pre_unloaded> = 1
			endif
		endif
		mempushcontext 0
		playmovie <...>
		if isXbox
			<time> = 6.0
		else
			<time> = 4.5
		endif
		if LevelIs load_skateshop
			DisplayLoadingScreen "loadscrn_generic" <time>
		endif
		mempopcontext
		if (<anims_unloaded> = 1)
			printf "Reloading anims here"
			do_load_unloadable
			UnpauseObjects
		endif
		if (<pre_unloaded> = 1)
			if NOT LevelIs load_skateshop
				script_assert "Can only unload skaterparts/play movies from skateshop (mainmenu) level"
			endif
			LoadPreFile "skaterparts.pre"
		endif
		if LevelIs load_skateshop
			HideLoadingScreen
		endif
	endscript
	script cleanup_play_movie
		goalmanager_levelunload
		cleanup preserve_skaters
		KillMessages
		DisablePause
		mempushcontext 0
		playmovie <...>
		mempopcontext
	endscript
	script ingame_play_movie
		cleanup_play_movie <...>
		mempushcontext 0
		DisplayLoadingScreen "loadscrn_generic"
		mempopcontext
		if NOT GotParam level
			GetCurrentLevel
		endif
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		change_level level = <level>
		restore_start_key_binding
	endscript
