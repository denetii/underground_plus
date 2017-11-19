
	CHEAT_SUPER_BLOOD = CHEAT_ON_1
	CHEAT_ALWAYS_SPECIAL = CHEAT_ON_2
	CHEAT_PERFECT_RAIL = CHEAT_ON_3
	CHEAT_STATS_13 = CHEAT_ON_4
	CHEAT_COOL_SPECIAL_TRICKS = CHEAT_ON_5
	CHEAT_MATRIX = CHEAT_ON_6
	CHEAT_PERFECT_MANUAL = CHEAT_ON_7
	CHEAT_KID = CHEAT_ON_8
	CHEAT_MOON = CHEAT_ON_9
	CHEAT_SIM = CHEAT_ON_10
	CHEAT_GORILLA = CHEAT_ON_11
	CHEAT_PERFECT_SKITCH = CHEAT_ON_12
	CHEAT_BIGHEAD = CHEAT_ON_13
	CHEAT_HOVERBOARD = CHEAT_ON_14
	CHEAT_SLOMO = CHEAT_ON_15
	CHEAT_DISCO = CHEAT_ON_16
	CHEAT_INVISIBLE = CHEAT_ON_17
	CHEAT_FLAME = CHEAT_ON_18
	CHEAT_INLINE = CHEAT_ON_19
	script client_toggle_cheat
		if GotParam on
			SetGlobalFlag flag = <cheat_flag>
		else
			UnSetGlobalFlag flag = <cheat_flag>
		endif
	endscript
	script toggle_cheat
		if InNetGame
			if OnServer
				if (GetGlobalFlag flag = <cheat_flag>)
					BroadcastOmnigon <...> off
				else
					BroadcastOmnigon <...> on
				endif
			endif
		endif
		if InNetGame
			if NOT OmnigonAllowed <...>
				return
			endif
		endif
		if InNetGame
			if NOT LastBroadcastedOmnigonWas <...>
				return
			endif
		endif
		if LastBroadcastedOmnigonWas cheat_flag = CHEAT_MADE_UP
			return
		endif
		GetTags
		if (GetGlobalFlag flag = <cheat_flag>)
			SetScreenelementProps id = {<id> child = 3} text = "Off"
			UnSetGlobalFlag flag = <cheat_flag>
			if GotParam off_callback
				<off_callback> <...>
			endif
		else
			SetScreenelementProps id = {<id> child = 3} text = "On"
			SetGlobalFlag flag = <cheat_flag>
			if (<cheat_flag> = CHEAT_BIGHEAD)
				if ScreenElementExists id = menu_gorilla
					SetScreenelementProps id = {menu_gorilla child = 3} text = "Off"
					UnSetGlobalFlag flag = CHEAT_GORILLA
				endif
			endif
			if (<cheat_flag> = CHEAT_GORILLA)
				if ScreenElementExists id = menu_bighead
					SetScreenelementProps id = {menu_bighead child = 0} text = "Off"
					UnSetGlobalFlag flag = CHEAT_BIGHEAD
				endif
			endif
			if GotParam on_callback
				<on_callback> <...>
			endif
		endif
	endscript
	script unlock_all_cheat_codes
		SetGlobalFlag flag = CHEAT_UNLOCKED_1
		SetGlobalFlag flag = CHEAT_UNLOCKED_3
		SetGlobalFlag flag = CHEAT_UNLOCKED_5
		SetGlobalFlag flag = CHEAT_UNLOCKED_10
	endscript
	script unlock_all_gameplay_cheat_codes
		SetGlobalFlag flag = CHEAT_UNLOCKED_12
		SetGlobalFlag flag = CHEAT_UNLOCKED_13
		SetGlobalFlag flag = CHEAT_UNLOCKED_14
		SetGlobalFlag flag = CHEAT_UNLOCKED_16
		SetGlobalFlag flag = CHEAT_UNLOCKED_17
	endscript
	script unlock_all_sponsors
		SetGlobalFlag flag = BOARDS_UNLOCKED_BIRDHOUSE
		SetGlobalFlag flag = BOARDS_UNLOCKED_ELEMENT
		SetGlobalFlag flag = BOARDS_UNLOCKED_FLIP
		SetGlobalFlag flag = BOARDS_UNLOCKED_GIRL
		SetGlobalFlag flag = BOARDS_UNLOCKED_ZERO
		SetGlobalFlag flag = MOVIE_UNLOCKED_ELEMENT
		SetGlobalFlag flag = MOVIE_UNLOCKED_GIRL
		SetGlobalFlag flag = MOVIE_UNLOCKED_FLIP
		SetGlobalFlag flag = MOVIE_UNLOCKED_BIRDHOUSE
		SetGlobalFlag flag = MOVIE_UNLOCKED_ZERO
	endscript
	script unlock_all_cheats
		unlock_all_cheat_codes
		unlock_all_gameplay_cheat_codes
		cheat_unlockmovies
		cheat_reallygivelevels
		cheat_give_skaters
		SetGlobalFlag flag = CAREER_STARTED
		unlock_all_chapters
		unlock_all_sponsors
		unlock_all_cutscenes
		cheat_unlock_pedgroup1
		cheat_unlock_pedgroup2
		cheat_unlock_pedgroup3
		cheat_unlock_pedgroup4
		cheat_unlock_pedgroup5
		cheat_unlock_pedgroup6
		cheat_unlock_pedgroup7
		cheat_unlock_pedgroup8
		cheat_unlock_pedgroup9
	endscript
	script cheat_give_skaters
		SetGlobalFlag flag = SKATER_UNLOCKED_IRONMAN
		SetGlobalFlag flag = SKATER_UNLOCKED_KISSDUDE
		SetGlobalFlag flag = SKATER_UNLOCKED_CREATURE
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
		SetGlobalFlag flag = GOT_ALL_GAPS
	endscript
	script cheat_give_im
		SetGlobalFlag flag = SKATER_UNLOCKED_IRONMAN
	endscript
	script cheat_give_kiss
		SetGlobalFlag flag = SKATER_UNLOCKED_KISSDUDE
	endscript
	script cheat_give_thud
		SetGlobalFlag flag = SKATER_UNLOCKED_CREATURE
	endscript
	script cheat_unlock_pedgroup1
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP1
	endscript
	script cheat_unlock_pedgroup2
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP2
	endscript
	script cheat_unlock_pedgroup3
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP3
	endscript
	script cheat_unlock_pedgroup4
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP4
	endscript
	script cheat_unlock_pedgroup5
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP5
	endscript
	script cheat_unlock_pedgroup6
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP6
	endscript
	script cheat_unlock_pedgroup7
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP7
	endscript
	script cheat_unlock_pedgroup8
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP8
	endscript
	script cheat_unlock_pedgroup9
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDS
		SetGlobalFlag flag = SKATER_UNLOCKED_PEDGROUP9
	endscript
	script cheat_give_jenna
	endscript
	script cheat_togglemetrics
		Togglemetrics
	endscript
	script cheat_togglememmetrics
		ToggleMemMetrics
	endscript
	script cheat_unlockmovies
		SetGlobalFlag flag = MOVIE_UNLOCKED_HAWK
		SetGlobalFlag flag = MOVIE_UNLOCKED_CABALLERO
		SetGlobalFlag flag = MOVIE_UNLOCKED_CAMPBELL
		SetGlobalFlag flag = MOVIE_UNLOCKED_GLIFBERG
		SetGlobalFlag flag = MOVIE_UNLOCKED_KOSTON
		SetGlobalFlag flag = MOVIE_UNLOCKED_LASEK
		SetGlobalFlag flag = MOVIE_UNLOCKED_MARGERA
		SetGlobalFlag flag = MOVIE_UNLOCKED_MULLEN
		SetGlobalFlag flag = MOVIE_UNLOCKED_MUSKA
		SetGlobalFlag flag = MOVIE_UNLOCKED_REYNOLDS
		SetGlobalFlag flag = MOVIE_UNLOCKED_ROWLEY
		SetGlobalFlag flag = MOVIE_UNLOCKED_STEAMER
		SetGlobalFlag flag = MOVIE_UNLOCKED_THOMAS
		SetGlobalFlag flag = MOVIE_UNLOCKED_BURNQUIST
		SetGlobalFlag flag = MOVIE_UNLOCKED_VALLELEY
		SetGlobalFlag flag = MOVIE_UNLOCKED_RODRIGUEZ
		SetGlobalFlag flag = MOVIE_UNLOCKED_SAARI
		SetGlobalFlag flag = MOVIE_UNLOCKED_CAS
		SetGlobalFlag flag = MOVIE_UNLOCKED_ELEMENT
		SetGlobalFlag flag = MOVIE_UNLOCKED_GIRL
		SetGlobalFlag flag = MOVIE_UNLOCKED_FLIP
		SetGlobalFlag flag = MOVIE_UNLOCKED_BIRDHOUSE
		SetGlobalFlag flag = MOVIE_UNLOCKED_ZERO
		SetGlobalFlag flag = MOVIE_UNLOCKED_HOMIES1
		SetGlobalFlag flag = MOVIE_UNLOCKED_KISS
		SetGlobalFlag flag = MOVIE_UNLOCKED_OUTTAKES
		SetGlobalFlag flag = MOVIE_UNLOCKED_BAILS2
		SetGlobalFlag flag = MOVIE_UNLOCKED_KONA
	endscript
	script unlock_all_cutscenes1
		<index> = 250
		while
			SetGlobalFlag flag = <index>
			<index> = (<index> + 1)
		repeat 36
	endscript
	script cheat_xxx
		printf "Cheat without a cheatscript"
	endscript
	script cheat_give_neversoft_skaters
		change give_neversoft_skaters = 1
	endscript
	script cheat_select_shift
		change select_shift = 1
	endscript
	script cheat_playsound_good
		PlaySound CheatGood
	endscript
	script cheat_playsound_bad
		printf "******************Playing Cheat Bad Sound*****************"
		PlaySound CheatBad
	endscript
	script cheat_toggle_net_metrics
		ToggleNetMetrics
	endscript
	script cheat_reset
		ResetPS2
	endscript
	script cheat_resethd
		ResetHD
	endscript
	script cheat_reallygivelevels
		printf "unlocking levels"
		SetGlobalFlag flag = LEVEL_UNLOCKED_NJ
		SetGlobalFlag flag = LEVEL_UNLOCKED_NY
		SetGlobalFlag flag = LEVEL_UNLOCKED_FL
		SetGlobalFlag flag = LEVEL_UNLOCKED_SD
		SetGlobalFlag flag = LEVEL_UNLOCKED_HI
		SetGlobalFlag flag = LEVEL_UNLOCKED_VC
		SetGlobalFlag flag = LEVEL_UNLOCKED_SP
		SetGlobalFlag flag = LEVEL_UNLOCKED_RU
		SetGlobalFlag flag = LEVEL_UNLOCKED_SE
		SetGlobalFlag flag = LEVEL_UNLOCKED_SC2
		SetGlobalFlag flag = LEVEL_UNLOCKED_VN
		SetGlobalFlag flag = LEVEL_UNLOCKED_HN
		SetGlobalFlag flag = LEVEL_UNLOCKED_VN
		SetGlobalFlag flag = LEVEL_UNLOCKED_HN
		SetGlobalFlag flag = CAD_UNLOCKED
		SetGlobalFlag flag = BOARDSHOP_UNLOCKED
	endscript
	script cheat_enable_screenshots
		printf "screenshots"
		change select_shift = 1
		change memcard_screenshots = 1
	endscript
	script cheat_unlock_always_special
		SetGlobalFlag flag = CHEAT_UNLOCKED_12
	endscript
	script cheat_unlock_perfect_rail
		SetGlobalFlag flag = CHEAT_UNLOCKED_13
	endscript
	script cheat_unlock_perfect_skitch
		SetGlobalFlag flag = CHEAT_UNLOCKED_14
	endscript
	script cheat_unlock_perfect_manual
		SetGlobalFlag flag = CHEAT_UNLOCKED_16
	endscript
	script cheat_unlock_moon_grav
		SetGlobalFlag flag = CHEAT_UNLOCKED_17
	endscript
	script cheat_unlock_inline
		if (GetGlobalFlag flag = CHEAT_ON_19)
			UnSetGlobalFlag flag = CHEAT_ON_19
		else
			SetGlobalFlag flag = CHEAT_ON_19
		endif
	endscript
