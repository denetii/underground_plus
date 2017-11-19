
	park_side_to_move = 0
	ThemeIndicesA = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 16, 17, 19, 21, 23, 24]
	ThemeIndicesB = [11, 12, 13, 14, 15, 18, 20, 22, 25]
	script DoParkGeneration
		setgametype creategoals
		MemPushContext 0
		PreLevelLoad
		if GameModeEquals is_parkeditor
			if IsXbox
				DisplayLoadingScreen "loadscrn_editor_x"
			endif
			if IsNgc
				DisplayLoadingScreen "loadscrn_editor_ngc"
			endif
			if IsPS2
				DisplayLoadingScreen "loadscrn_editor"
			endif
		else
			if IsXbox
				DisplayLoadingScreen "loadscrn_editor_x"
			endif
			if IsNgc
				DisplayLoadingScreen "loadscrn_editor_ngc"
			endif
			if IsPS2
				DisplayLoadingScreen "loadscrn_editor_play"
			endif
		endif
		LaunchLevel Level = custom_park
		printf "Ryan: finished 'LaunchLevel' call"
		PostLevelLoad
		ResetCamera
		MemPopContext
		SetBackgroundColor {r = 0, g = 0, b = 0, alpha = 0}
		SetClippingDistances near = 12 far = 22000
		LaunchConsoleMessage "Stats at 10" 2
		LoadPreFile "parked_sounds.pre"
		LoadSound "ParkEd\GUI_placeblock1"
		LoadSound "ParkEd\GUI_removeblock1"
		LoadSound "ParkEd\select1"
		LoadSound "Shared\Menu\GUI_buzzer01"
		UnloadPreFile "parked_sounds.pre"
	endscript
	script Ed_DropinSkater
		printf "Ed_DropinSkater"
		ParkEditorCommand command = SetCustomParkPlay on
	endscript
	script Ed_RunCommand
		ParkEditorCommand <...>
	endscript
	script Ed_ThemeSwitch
		change_level Level = custom_park game = parkeditor
	endscript
	script PlayEdPlaceSound
		PlaySound GUI_placeblock1 vol = 60
		printf "Play Place Sound"
	endscript
	script PlayEdEraseSound
		PlaySound GUI_removeblock1 vol = 60
	endscript
	script PlayEdChangeSetSound
		PlaySound select1 vol = 60
	endscript
	script PlayEdChangePieceSound
		PlaySound select2b vol = 60
	endscript
	script PlayEdBuzzSound
		PlaySound GUI_buzzer01 vol = 60
	endscript
	script PlayRaiseGroundSound
		PlaySound MenuUp pitch = 35
	endscript
	script PlayLowerGroundSound
		PlaySound MenuUp pitch = 24
	endscript
	script PlayRotatePieceSound
		PlaySound menu03 pitch = 55
	endscript
