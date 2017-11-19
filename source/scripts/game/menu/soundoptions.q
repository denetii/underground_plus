
	current_soundtrack = #"0xFFFFFFFF"
	script launch_sound_options_menu
		if GotParam from_options
			create_sound_options_menu from_options
		else
			create_sound_options_menu
		endif
	endscript
	script create_sound_options_menu
		FormatText ChecksumName = title_icon "%i_sound" i = (THEME_PREFIXES[current_theme_prefix])
		make_new_themed_sub_menu title = "SOUND OPTIONS" title_icon = <title_icon>
		if LevelIs load_skateshop
			sound_options_graphic
		endif
		create_helper_text {helper_text_elements = [{text = "\b7/\b4 = Select"}
				{text = "\b6/\b5 = Adjust Levels"}
				{text = "\bn = Back"}
				{text = "\bm = Accept"}
			]
		}
		SetScreenElementProps {id = sub_menu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = sound_options_exit}}
			]
		}
		if GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
			song_text = "Random"
		else
			song_text = "In Order"
		endif
		theme_menu_add_item {text = "Songs:"
			extra_text = <song_text>
			id = menu_song_order
			pad_choose_script = toggle_song_order
		}
		theme_menu_add_item {text = "Skip Track"
			id = menu_skip_track
			focus_script = skip_track_focus
			unfocus_script = skip_track_unfocus
			pad_choose_script = skip_track
			pad_choose_params = {}
		}
		if NOT isxbox
			if NOT (DEMO_BUILD)
				theme_menu_add_item {text = "Soundtrack"
					id = menu_soundtrack
					pad_choose_script = create_soundtrack_menu
					pad_choose_params = {}
				}
			endif
		endif
		if NOT inNetGame
			if (current_soundtrack = #"0xFFFFFFFF")
				theme_menu_add_item {text = "Playlist"
					id = menu_playlist
					pad_choose_script = create_playlist_menu
					pad_choose_params = {}
				}
			else
				theme_menu_add_item {text = "Playlist"
					id = menu_playlist
					pad_choose_script = nullscript
					not_focusable = not_focusable
				}
			endif
		endif
		theme_menu_add_item {text = "Music Level:"
			id = menu_music_level
			focus_script = menu_music_level_focus
			focus_params = {music_level = music_level}
			unfocus_script = menu_music_level_unfocus
			no_sound
		}
		theme_menu_add_item {text = "Sound Level:"
			id = menu_sound_level
			focus_script = menu_music_level_focus
			unfocus_script = menu_music_level_unfocus
			no_sound
		}
		theme_menu_add_item {text = "Special Sounds:"
			id = menu_sound_special
			extra_text = ""
			focus_script = menu_music_special_focus
			unfocus_script = menu_music_special_unfocus
			pad_choose_script = toggle_special_sounds
			no_sound
		}
		FormatText ChecksumName = checkmark_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = checkbox_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = SpriteElement
			parent = menu_sound_special
			texture = checkbox
			pos = (130.0,-13.0)
			just = [center top]
			scale = 0.55000001
			rgba = <checkbox_rgba>
			z_priority = 5
		}
		if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
			CreateScreenElement {
				type = SpriteElement
				parent = <id>
				id = menu_sound_special_chk
				texture = checkmark
				pos = (25.0,-9.0)
				just = [center top]
				rgba = <checkmark_rgba>
				z_priority = 6
				scale = 1.39999998
			}
		else
			CreateScreenElement {
				type = SpriteElement
				parent = <id>
				id = menu_sound_special_chk
				texture = checkmark
				pos = (25.0,-7.0)
				just = [center top]
				rgba = [0 0 0 0]
				z_priority = 6
				scale = 1.39999998
			}
		endif
		if GotParam from_options
			theme_menu_add_item text = "Done" id = menu_done pad_choose_script = sound_options_exit pad_choose_params = {from_options} last_menu_item = 1
		else
			theme_menu_add_item text = "Done" id = menu_done pad_choose_script = sound_options_exit last_menu_item = 1
		endif
		sound_options_show_levels
		add_music_track_text
		finish_themed_sub_menu
		PauseMusic
	endscript
	script sound_options_graphic
		CreateScreenElement {
			type = containerElement
			parent = current_menu_anchor
			id = boombox_anchor
			dims = (320.0,240.0)
			pos = (340.0,0.0)
			just = [left top]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = boombox_anchor
			id = boombox1
			texture = so_icon_1
			pos = (170.0,140.0)
			just = [center center]
			alpha = 0.30000001
			rot_angle = 11
			z_priority = -2
			scale = (0.80000001,0.80000001)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = boombox_anchor
			id = boombox2
			texture = so_icon_2
			pos = (160.0,150.0)
			just = [center center]
			alpha = 0.035
			rot_angle = 10
			z_priority = -2
		}
		CreateScreenElement {
			type = SpriteElement
			parent = boombox_anchor
			id = speaker1
			texture = so_icon_3
			pos = (101.0,128.0)
			just = [center center]
			alpha = 0.25
			rot_angle = 10
			z_priority = 1
		}
		CreateScreenElement {
			type = SpriteElement
			parent = boombox_anchor
			id = speaker2
			texture = so_icon_3
			pos = (208.0,180.0)
			just = [center center]
			alpha = 0.5
			rot_angle = 10
			z_priority = 1
			scale = 1.14999998
		}
		FormatText ChecksumName = highlight_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = SpriteElement
			parent = boombox_anchor
			id = volume_bar
			texture = white2
			rgba = <highlight_rgba>
			pos = (146.0,84.0)
			just = [left center]
			rot_angle = 22
			z_priority = 1
			scale = (7.5,0.5)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = bg_star
			texture = so_star
			pos = (0.0,315.0)
			just = [left center]
			alpha = 0.69999999
			z_priority = -2
			scale = (1.29999995,2.0)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = so_rotating_bg
			texture = bg_vector_1
			rgba = [23 58 75 15]
			just = [center, center]
			pos = (210.0,180.0)
			z_priority = -4
		}
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = so_rotating_bg2
			texture = bg_vector_1
			rgba = [100 25 3 15]
			just = [center, center]
			pos = (210.0,180.0)
			z_priority = -3
		}
		spawnscript boombox_speaker_pulse
		spawnscript update_volume_bar
		spawnscript chap_new_rotating_bg params = {id = so_rotating_bg scale = 1.39999998}
		spawnscript chap_new_rotating_bg_2 params = {id = so_rotating_bg2 scale = 1.10000002}
	endscript
	script GetTracksEnabled
		<num_enabled> = 0
		GetArraySize playlist_tracks
		index = 0
		while
			if TrackEnabled <index>
				<num_enabled> = (<num_enabled> + 1)
				break
			endif
			index = (<index> + 1)
		repeat <array_size>
		return num_enabled = <num_enabled>
	endscript
	script add_music_track_text parent = current_menu_anchor pos = (575.0,320.0)
		if NOT (current_soundtrack = #"0xFFFFFFFF")
			return
		endif
		GetTracksEnabled
		if (<num_enabled> = 0)
			return
		endif
		if LevelIs load_skateshop
			pos = (575.0,320.0)
		endif
		GetCurrentTrack
		if (<current_track> = 999)
			return
		endif
		if NOT TrackEnabled <current_track>
			return
		endif
		CreateScreenElement {
			type = containerElement
			parent = <parent>
			id = music_track_anchor
			pos = <pos>
			dims = (0.0,0.0)
		}
		current_band_text = ((playlist_tracks[<current_track>]).band)
		GetUpperCaseString <current_band_text>
		FormatText textName = current_track_text "''%t''" t = ((playlist_tracks[<current_track>]).track_title)
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = textElement
			parent = music_track_anchor
			id = music_band_text
			text = <uppercasestring>
			font = testtitle
			just = [right top]
			scale = 1
			pos = (4.0,10.0)
			rgba = <on_rgba>
			alpha = 0.80000001
		}
		GetScreenElementDims id = music_band_text
		if (<width> > 260)
			<scale> = (260.0 / <width>)
			DoScreenElementMorph id = music_band_text time = 0 scale = <scale>
		endif
		CreateScreenElement {
			type = textElement
			parent = music_track_anchor
			id = music_track_text
			text = <current_track_text>
			font = dialog
			just = [right top]
			scale = 0.80000001
			pos = (4.0,23.0)
			rgba = <off_rgba>
			alpha = 0.80000001
		}
		GetScreenElementDims id = music_track_text
		if (<width> > 250)
			<scale> = (0.80000001 * 250.0 / <width>)
			DoScreenElementMorph id = music_track_text time = 0 scale = <scale>
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = music_track_anchor
			texture = kyron
			just = [center center]
			scale = 1
			pos = (14.0,15.0)
			rgba = <on_rgba>
			alpha = 0.69999999
		}
	endscript
	script spawn_update_music_track_text
		if ScreenElementExists id = music_track_anchor
			RunScriptOnScreenElement id = music_track_anchor update_music_track_text params = {<...>}
		endif
	endscript
	script update_music_track_text
		if ScreenElementExists id = music_track_anchor
			if LevelIs load_skateshop
				pos = (900.0,320.0)
			else
				pos = (900.0,320.0)
			endif
			DoScreenElementMorph id = music_track_anchor pos = <pos> time = 0.30000001
			wait 0.30000001 seconds
		else
			return
		endif
		if NOT GotParam current_track
			wait 2.5 seconds
			GetCurrentTrack
		endif
		current_band_text = ((playlist_tracks[<current_track>]).band)
		GetUpperCaseString <current_band_text>
		FormatText textName = current_track_text "''%t''" t = ((playlist_tracks[<current_track>]).track_title)
		if ScreenElementExists id = music_band_text
			SetScreenElementProps id = music_band_text text = <uppercasestring>
			SetScreenElementProps id = music_track_text text = <current_track_text>
		endif
		DoScreenElementMorph id = music_band_text time = 0 scale = 1.0
		GetScreenElementDims id = music_band_text
		if (<width> > 245)
			<scale> = (245.0 / <width>)
			DoScreenElementMorph id = music_band_text time = 0 scale = <scale>
		endif
		GetScreenElementDims id = music_band_text
		DoScreenElementMorph id = music_band_text time = 0 scale = 1.0
		if (<width> > 250)
			<scale> = (250.0 / <width>)
			DoScreenElementMorph id = music_track_text time = 0 scale = <scale>
		endif
		if ScreenElementExists id = music_track_anchor
			if LevelIs load_skateshop
				pos = (575.0,320.0)
			else
				pos = (575.0,320.0)
			endif
			DoScreenElementMorph id = music_track_anchor pos = <pos> time = 0.30000001
		endif
	endscript
	script update_volume_bar
		shaking = 0
		while
			if ScreenElementExists id = volume_bar
				GetValueFromVolume sfxvol
				new_scale = ((0.75 * <value>) * (1.0,0.0) + (0.0,0.5))
				DoScreenElementMorph id = volume_bar scale = <new_scale> time = 0.1
				wait 0.1 seconds
				if (<value> = 10)
					GetValueFromVolume cdvol
					if (<value> = 10)
						if (<shaking> = 0)
							spawnscript shake_projector params = {id = boombox_anchor amplitude = 5 time = 0.05}
							shaking = 1
						endif
					else
						KillSpawnedScript name = shake_projector
						shaking = 0
					endif
				else
					KillSpawnedScript name = shake_projector
					shaking = 0
				endif
			else
				break
			endif
		repeat
	endscript
	script boombox_speaker_pulse
		while
			GetValueFromVolume cdvol
			new_scale = ((<value> / 10.0) + 1.0)
			if ScreenElementExists id = speaker1
				if (<value> = 0)
					DoScreenElementMorph id = speaker1 scale = <new_scale> relative_scale time = 0.1
					DoScreenElementMorph id = speaker2 scale = <new_scale> relative_scale time = 0.1
				else
					DoScreenElementMorph id = speaker1 scale = <new_scale> relative_scale time = 0.1 alpha = 0.60000002
					DoScreenElementMorph id = speaker2 scale = <new_scale> relative_scale time = 0.1 alpha = 0.60000002
				endif
			else
				break
			endif
			wait 0.1 seconds
			if ScreenElementExists id = speaker1
				DoScreenElementMorph id = speaker1 scale = 1 relative_scale time = 0.1 alpha = 0.1
				DoScreenElementMorph id = speaker2 scale = 1 relative_scale time = 0.1 alpha = 0.1
			else
				break
			endif
			wait 0.2 seconds
		repeat
	endscript
	script sound_options_exit
		KillSpawnedScript name = boombox_speaker_pulse
		KillSpawnedScript name = update_volume_bar
		KillSpawnedScript name = shake_projector
		KillSpawnedScript name = chap_new_rotating_bg
		KillSpawnedScript name = chap_new_rotating_bg_2
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		if GotParam just_remove
			return
		endif
		if NOT LevelIs load_skateshop
			PauseMusic 1
			create_options_menu
		else
			PauseMusic 0
			create_setup_options_menu
		endif
	endscript
	script sound_options_show_levels
		FormatText ChecksumName = text_color "%i_unhighlighted_text_color" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		GetValueFromVolume cdvol
		FormatText textName = cdvol "%v" v = <value>
		CreateScreenElement {
			type = textElement
			parent = menu_music_level
			font = small
			just = [center top]
			pos = (128.0,-17.0)
			text = <cdvol>
			rgba = <text_color>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = menu_music_level
			texture = left_arrow
			rgba = [128 128 128 0]
			pos = (115.0,-17.0)
			just = [right top]
			scale = 0.75
		}
		CreateScreenElement {
			type = SpriteElement
			parent = menu_music_level
			texture = right_arrow
			rgba = [128 128 128 0]
			pos = (143.0,-17.0)
			just = [left top]
			scale = 0.75
		}
		GetValueFromVolume sfxvol
		FormatText textName = sfxvol "%v" v = <value>
		CreateScreenElement {
			type = textElement
			parent = menu_sound_level
			font = small
			just = [center top]
			pos = (128.0,-17.0)
			text = <sfxvol>
			rgba = <text_color>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = menu_sound_level
			texture = left_arrow
			rgba = [128 128 128 0]
			pos = (115.0,-17.0)
			just = [right top]
			scale = 0.75
		}
		CreateScreenElement {
			type = SpriteElement
			parent = menu_sound_level
			texture = right_arrow
			rgba = [128 128 128 0]
			pos = (143.0,-17.0)
			just = [left top]
			scale = 0.75
		}
		SetScreenElementProps {
			id = menu_music_level
			event_handlers = [{pad_left menu_turn_music_down}
				{pad_right menu_turn_music_up}
			]
			replace_handlers
		}
		SetScreenElementProps {
			id = menu_sound_level
			event_handlers = [{pad_left menu_turn_sound_down}
				{pad_right menu_turn_sound_up}
			]
			replace_handlers
		}
	endscript
	script toggle_song_order
		if NOT GetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
			SetScreenElementProps id = {menu_song_order child = 3} text = "Random"
			PlaySongsRandomly
			SetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
		else
			SetScreenElementProps id = {menu_song_order child = 3} text = "In Order"
			PlaySongsInOrder
			UnsetGlobalFlag flag = SOUNDS_SONGORDER_RANDOM
		endif
	endscript
	script toggle_special_sounds
		FormatText ChecksumName = check_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if NOT GetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
			SetScreenElementProps id = menu_sound_special_chk rgba = [0 0 0 0]
			SetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
		else
			SetScreenElementProps id = menu_sound_special_chk rgba = <check_rgba>
			UnsetGlobalFlag flag = SOUNDS_SPECIALSOUNDS_OFF
			PlaySound HUD_specialtrickAA vol = 200 pitch = 75
		endif
	endscript
	script menu_music_level_focus
		PauseMusic 0
		menu_sound_level_focus {music_level = <music_level> <...>}
	endscript
	script menu_music_level_unfocus
		menu_sound_level_unfocus <...>
		PauseMusic 1
	endscript
	script menu_music_special_focus
		PauseMusic 0
		main_theme_focus
	endscript
	script menu_music_special_unfocus
		main_theme_unfocus
		PauseMusic 1
	endscript
	script skip_track_focus
		PauseMusic 0
		main_theme_focus <...>
	endscript
	script skip_track_unfocus
		main_theme_unfocus <...>
		PauseMusic 1
	endscript
	script menu_sound_level_focus
		GetTags
		FormatText ChecksumName = arrow_color "%i_unhighlighted_text_color" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		main_theme_focus
		if GotParam music_level
			GetValueFromVolume cdvol
		else
			GetValueFromVolume sfxvol
		endif
		printf <value>
		if (<value> = 0)
			SetScreenElementProps {id = {<id> child = 5} rgba = [128 128 128 0]}
		else
			SetScreenElementProps {id = {<id> child = 5} rgba = <arrow_color>}
		endif
		if (<value> = 10)
			SetScreenElementProps {id = {<id> child = 6} rgba = [128 128 128 0]}
		else
			SetScreenElementProps {id = {<id> child = 6} rgba = <arrow_color>}
		endif
	endscript
	script menu_sound_level_unfocus
		GetTags
		main_theme_unfocus
		SetScreenElementProps {id = {<id> child = 5} rgba = [128 128 128 0]}
		SetScreenElementProps {id = {<id> child = 6} rgba = [128 128 128 0]}
	endscript
	script menu_turn_music_down
		GetTags
		GetValueFromVolume cdvol
		if (<value> > 0)
			SetScreenElementProps id = {<id> child = 6} rgba = [128 128 128 128]
			<value> = (<value> - 1)
			sound_options_set_level level = <value> id = menu_music_level type = cdvol
			menu_horiz_blink_arrow arrow_id = {<id> child = 5}
		endif
		if (<value> = 0)
			SetScreenElementProps id = {<id> child = 5} rgba = [128 128 128 0]
		endif
	endscript
	script menu_turn_music_up
		GetTags
		GetValueFromVolume cdvol
		if (<value> < 10)
			SetScreenElementProps id = {<id> child = 5} rgba = [128 128 128 128]
			<value> = (<value> + 1)
			sound_options_set_level level = <value> id = menu_music_level type = cdvol
			menu_horiz_blink_arrow arrow_id = {<id> child = 6}
		endif
		if (<value> = 10)
			SetScreenElementProps id = {<id> child = 6} rgba = [128 128 128 0]
		endif
		if (<value> = 1)
			SetCDToMusic
			printf "SetCDToMusic"
		endif
	endscript
	script menu_turn_sound_down
		GetTags
		GetValueFromVolume sfxvol
		if (<value> > 0)
			SetScreenElementProps id = {<id> child = 6} rgba = [128 128 128 128]
			<value> = (<value> - 1)
			sound_options_set_level level = <value> id = menu_sound_level type = sfxvol
			menu_horiz_blink_arrow arrow_id = {<id> child = 5}
			PlaySound ollieconc vol = 70
		endif
		if (<value> = 0)
			SetScreenElementProps id = {<id> child = 5} rgba = [128 128 128 0]
		endif
	endscript
	script menu_turn_sound_up
		GetTags
		GetValueFromVolume sfxvol
		if (<value> < 10)
			SetScreenElementProps id = {<id> child = 5} rgba = [128 128 128 128]
			<value> = (<value> + 1)
			sound_options_set_level level = <value> id = menu_sound_level type = sfxvol
			menu_horiz_blink_arrow arrow_id = {<id> child = 6}
			PlaySound ollieconc vol = 70
		endif
		if (<value> = 10)
			SetScreenElementProps id = {<id> child = 6} rgba = [128 128 128 0]
		endif
	endscript
	script sound_options_set_level
		FormatText textName = vol "%v" v = <level>
		SetScreenElementProps {
			id = {<id> child = 4}
			text = <vol>
		}
		<level> = (<level> * 10)
		switch <type>
			case cdvol
				SetMusicVolume <level>
			case sfxvol
				SetSfxVolume <level>
		endswitch
	endscript
	script focus_skip_track
		do_scale_up
		PauseMusic 0
	endscript
	script unfocus_skip_track
		do_scale_down
		PauseMusic 1
	endscript
	script skip_track
		skiptrack
	endscript
	script pulse_item
		DoMorph time = 0.05 scale = 0.89999998
		DoMorph time = 0.05 scale = 1.0
	endscript
	script change_music_mode
		DoMorph time = 0.1 scale = 0.89999998
		DoMorph time = 0.1 scale = 1.20000005
		DoMorph time = 0.1 scale = 1
		if IsTrue ALWAYSPLAYMUSIC
			change ALWAYSPLAYMUSIC = 0
			SetScreenElementProps text = "Music Mode: Goals Only" id = menu_change_musicmode
		else
			change ALWAYSPLAYMUSIC = 1
			SetScreenElementProps text = "Music Mode: Always On" id = menu_change_musicmode
		endif
	endscript
	script create_playlist_menu
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if NOT cd
			if NOT (testmusicfromhost = 1)
				return
			endif
		endif
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = containerElement
			parent = root_window
			id = playlist_bg_anchor
			dims = (640.0,480.0)
			pos = (320.0,240.0)
		}
		AssignAlias id = playlist_bg_anchor alias = current_menu_anchor
		create_helper_text {helper_text_elements = [{text = "\b7/\b4 = Select"}
				{text = "\bn = Back"}
				{text = "\bm = Toggle"}
				{text = "\bo = Preview Track"}
			]
		}
		kill_start_key_binding
		if LevelIs load_skateshop
			build_top_and_bottom_blocks
			make_mainmenu_3d_plane
		endif
		FormatText ChecksumName = title_icon "%i_sound" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_sub_title title = "PLAYLIST" title_icon = <title_icon>
		if NOT LevelIs load_skateshop
			FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
			build_theme_box_icons icon_texture = <paused_icon>
			build_grunge_piece
		endif
		build_top_bar pos = (-400.0,62.0)
		CreateScreenElement {
			type = containerElement
			parent = playlist_bg_anchor
			id = playlist_menu
			dims = (640.0,480.0)
			pos = (320.0,620.0)
		}
		theme_background width = 7.0 pos = (320.0,85.0) num_parts = 10.5 parent = playlist_menu
		CreateScreenElement {
			type = containerElement
			parent = playlist_menu
			id = playlist_top_anchor
			dims = (640.0,480.0)
			pos = (320.0,240.0)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = playlist_menu
			texture = white2
			scale = (71.0,6.0)
			pos = (36.0,90.0)
			rgba = [0 0 0 128]
			alpha = 0.80000001
			just = [left top]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = playlist_top_anchor
			id = left_arrow
			texture = left_arrow
			pos = (55.0,113.0)
			just = [right center]
			z_priority = 50
		}
		CreateScreenElement {
			type = SpriteElement
			parent = playlist_top_anchor
			id = right_arrow
			texture = right_arrow
			pos = (580.0,113.0)
			just = [left center]
			z_priority = 5
		}
		CreateScreenElement {
			type = hmenu
			parent = playlist_top_anchor
			id = playlist_hmenu
			pos = (320.0,140.0)
			event_handlers = [{pad_down focus_playlist_vmenu}
				{pad_back generic_menu_pad_back params = {callback = exit_playlist_menu}}
				{pad_left generic_menu_scroll_sideways_sound params = {}}
				{pad_right generic_menu_scroll_sideways_sound params = {}}
				{pad_left set_which_arrow params = {arrow = left_arrow}}
				{pad_right set_which_arrow params = {arrow = right_arrow}}
			]
		}
		playlist_hmenu_add_item {text = "Punk" genre = 0}
		playlist_hmenu_add_item {text = "Hip Hop" genre = 1}
		playlist_hmenu_add_item {text = "Rock/Other" genre = 2}
		CreateScreenElement {
			type = SpriteElement
			parent = playlist_menu
			texture = white2
			scale = (71.0,0.1)
			pos = (36.0,138.0)
			rgba = <on_rgba>
			just = [left top]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = playlist_menu
			texture = white2
			scale = (71.0,3.0)
			pos = (36.0,138.0)
			rgba = [0 0 0 128]
			alpha = 0.80000001
			just = [left top]
			z_priority = 2
		}
		CreateScreenElement {
			type = containerElement
			parent = playlist_menu
			id = playlist_bottom_anchor
			dims = (640.0,480.0)
			pos = (320.0,240.0)
			alpha = 0.5
		}
		CreateScreenElement {
			type = textElement
			parent = playlist_bottom_anchor
			text = "Band"
			font = dialog
			scale = 1
			rgba = <on_rgba>
			pos = (75.0,150.0)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = playlist_menu
			texture = white2
			scale = (0.80000001,28.5)
			pos = (210.0,160.0)
			rgba = [0 0 0 128]
			alpha = 0.80000001
			just = [left top]
			z_priority = 2
		}
		CreateScreenElement {
			type = textElement
			parent = playlist_bottom_anchor
			text = "Song"
			font = dialog
			scale = 1
			rgba = <on_rgba>
			pos = (245.0,150.0)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = playlist_menu
			texture = white2
			scale = (0.80000001,28.5)
			pos = (460.0,160.0)
			rgba = [0 0 0 128]
			alpha = 0.80000001
			just = [left top]
			z_priority = 2
		}
		CreateScreenElement {
			type = textElement
			parent = playlist_bottom_anchor
			text = "Genre"
			font = dialog
			scale = 1
			rgba = <on_rgba>
			pos = (505.0,150.0)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = playlist_menu
			texture = white2
			scale = (0.80000001,28.5)
			pos = (555.0,160.0)
			rgba = [0 0 0 128]
			alpha = 0.80000001
			just = [left top]
			z_priority = 2
		}
		CreateScreenElement {
			type = SpriteElement
			parent = playlist_bottom_anchor
			id = view_gaps_menu_up_arrow
			texture = up_arrow
			pos = (320.0,142.0)
			just = [left top]
			z_priority = 5
		}
		CreateScreenElement {
			type = SpriteElement
			parent = playlist_bottom_anchor
			id = view_gaps_menu_down_arrow
			texture = down_arrow
			pos = (320.0,370.0)
			just = [left top]
			z_priority = 3
		}
		CreateScreenElement {
			type = VScrollingMenu
			parent = playlist_bottom_anchor
			id = playlist_scrolling_menu
			dims = (640.0,200.0)
			pos = (320.0,180.0)
			just = [center top]
			internal_just = [center top]
		}
		CreateScreenElement {
			type = VMenu
			parent = playlist_scrolling_menu
			id = playlist_vmenu
			pos = (0.0,0.0)
			just = [left top]
			internal_just = [left top]
			dont_allow_wrap
			event_handlers = [
				{pad_up focus_playlist_hmenu}
				{pad_up set_which_arrow params = {arrow = view_gaps_menu_up_arrow}}
				{pad_down set_which_arrow params = {arrow = view_gaps_menu_down_arrow}}
				{pad_back generic_menu_pad_back params = {callback = exit_playlist_menu}}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		AssignAlias id = playlist_vmenu alias = current_menu
		kill_start_key_binding
		add_tracks_to_menu
		wait 2 gameframes
		SetScreenElementProps id = playlist_scrolling_menu reset_window_top
		if LevelIs load_skateshop
			end_pos = (320.0,215.0)
		endif
		finish_themed_sub_menu menu = playlist_menu end_pos = <end_pos>
		FireEvent type = focus target = playlist_hmenu
	endscript
	script exit_playlist_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		if GotParam from_options
			create_sound_options_menu from_options
		else
			create_sound_options_menu
		endif
	endscript
	script add_tracks_to_menu
		GetArraySize playlist_tracks
		index = 0
		while
			if ((<index> = locked_track1) || (<index> = locked_track2))
				if GetGlobalFlag flag = KISS_SONGS_UNLOCKED
					playlist_menu_add_item {index = <index>}
				else
					CreateScreenElement {
						type = containerElement
						parent = current_menu
						dims = (0.0,0.0)
						heap = topdown
						not_focusable
					}
				endif
			else
				playlist_menu_add_item {index = <index>}
			endif
			<index> = (<index> + 1)
		repeat <array_size>
	endscript
	script change_track_state
		GetTags
		if TrackEnabled <index>
			ChangeTrackState <index> off
			PauseMusic 1
			if ScreenElementExists id = {<id> child = 4}
				DoScreenElementMorph id = {<id> child = 4} alpha = 0
			endif
		else
			ChangeTrackState <index> on
			if ScreenElementExists id = {<id> child = 4}
				DoScreenElementMorph id = {<id> child = 4} alpha = 1
			endif
		endif
		update_genre_checks
	endscript
	script is_genre_on
		printf "is_genre_on"
		on = 1
		GetArraySize playlist_tracks
		index = 0
		while
			if (((playlist_tracks[<index>]).genre) = <genre>)
				if ((<index> = locked_track1) || (<index> = locked_track2))
					if GetGlobalFlag flag = KISS_SONGS_UNLOCKED
						if NOT TrackEnabled <index>
							on = 0
							break
						endif
					else
					endif
				else
					if NOT TrackEnabled <index>
						on = 0
						break
					endif
				endif
			endif
			index = (<index> + 1)
		repeat <array_size>
		return on = <on>
	endscript
	script toggle_playlist_genre genre = 0
		found_first = 0
		GetArraySize playlist_tracks
		index = 0
		while
			if (((playlist_tracks[<index>]).genre) = <genre>)
				if (<found_first> = 0)
					found_first = 1
					if TrackEnabled <index>
						toggle = 0
					else
						toggle = 1
					endif
				endif
				if (<toggle> = 1)
					if ScreenElementExists id = {playlist_vmenu child = {<index> child = 4}}
						ChangeTrackState <index> on
						DoScreenElementMorph id = {playlist_vmenu child = {<index> child = 4}} alpha = 1
					endif
				else
					if ScreenElementExists id = {playlist_vmenu child = {<index> child = 4}}
						ChangeTrackState <index> off
						DoScreenElementMorph id = {playlist_vmenu child = {<index> child = 4}} alpha = 0
					endif
				endif
			endif
			index = (<index> + 1)
		repeat <array_size>
		if NOT GetGlobalFlag flag = KISS_SONGS_UNLOCKED
			ChangeTrackState locked_track1 off
			ChangeTrackState locked_track2 off
		endif
		PlaySound DE_MenuSelect vol = 100
		update_genre_checks
	endscript
	script preview_music_track
		GetTags
		if NOT TrackEnabled <index>
			ChangeTrackState <index> on
			if ScreenElementExists id = {<id> child = 4}
				DoScreenElementMorph id = {<id> child = 4} alpha = 1
			endif
		endif
		if MusicIsPaused
			PauseMusic 0
			PlayTrack <index>
		else
			PauseMusic 1
		endif
		update_genre_checks
	endscript
	script playlist_hmenu_add_item
		FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		switch <genre>
			case 0
				dims = (130.0,50.0)
			case 1
				dims = (165.0,50.0)
			case 2
				dims = (220.0,50.0)
			default
				return
		endswitch
		CreateScreenElement {
			type = containerElement
			parent = playlist_hmenu
			dims = <dims>
			event_handlers = [{pad_choose toggle_playlist_genre params = {genre = <genre>}}
				{focus playlist_hmenu_focus}
				{unfocus playlist_hmenu_unfocus}
			]
		}
		anchor_id = <id>
		CreateScreenElement {
			type = textElement
			parent = <anchor_id>
			z_priority = 50
			font = small
			text = <text>
			rgba = <off_rgba>
			scale = 1.5
			just = [left center]
		}
		GetStackedScreenElementPos X id = <id> offset = (4.0,13.0)
		is_genre_on genre = <genre>
		if (<on> = 1)
			alpha = 1
		else
			alpha = 0
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = checkmark
			pos = <pos>
			alpha = <alpha>
			just = [left center]
			rgba = <off_rgba>
			z_priority = 5
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = checkbox
			pos = (<pos> + (0.0,5.0))
			just = [left center]
			scale = 0.5
			rgba = <off_rgba>
			z_priority = 5
		}
	endscript
	script update_genre_checks
		genre = 0
		while
			is_genre_on genre = <genre>
			if (<on> = 1)
				alpha = 1
			else
				alpha = 0
			endif
			DoScreenElementMorph id = {playlist_hmenu child = {<genre> child = 1}} alpha = <alpha>
			genre = (<genre> + 1)
		repeat 3
	endscript
	script playlist_hmenu_focus
		GetTags
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		DoScreenElementMorph {id = {<id> child = 0} rgba = <on_rgba>}
		DoScreenElementMorph {id = {<id> child = 1} rgba = <on_rgba>}
		playlist_hmenu::GetTags
		if GotParam arrow_id
			blink_arrow {id = <arrow_id>}
		endif
	endscript
	script playlist_hmenu_unfocus
		GetTags
		FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		DoScreenElementMorph {id = {<id> child = 0} rgba = <off_rgba>}
		DoScreenElementMorph {id = {<id> child = 1} rgba = <off_rgba>}
		playlist_hmenu::GetTags
		if GotParam arrow_id
			blink_arrow {id = <arrow_id>}
		endif
	endscript
	script focus_playlist_hmenu
		GetTags
		if (<tag_selected_id> = top_item)
			FireEvent type = unfocus target = playlist_vmenu
			DoScreenElementMorph id = playlist_bottom_anchor alpha = 0.5
			FireEvent type = focus target = playlist_hmenu
			DoScreenElementMorph id = playlist_top_anchor alpha = 1.0
		endif
	endscript
	script focus_playlist_vmenu
		FireEvent type = unfocus target = playlist_hmenu
		DoScreenElementMorph id = playlist_top_anchor alpha = 0.5
		FireEvent type = focus target = playlist_vmenu
		DoScreenElementMorph id = playlist_bottom_anchor alpha = 1.0
	endscript
	script playlist_menu_add_item highlight_bar_scale = (4.3499999,0.5) highlight_bar_pos = (321.0,0.0)
		FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if (<index> = 0)
			id = top_item
		endif
		CreateScreenElement {
			type = containerElement
			parent = current_menu
			id = <id>
			dims = (500.0,20.0)
			event_handlers = [{focus playlist_menu_focus params = <focus_params>}
				{unfocus playlist_menu_unfocus}
				{pad_choose change_track_state params = {index = <index>}}
				{pad_choose generic_menu_pad_choose_sound}
				{pad_start change_track_state params = {index = <index>}}
				{pad_start generic_menu_pad_choose_sound}
				{pad_option preview_music_track params = {index = <index>}}
			]
			heap = topdown
		}
		<anchor_id> = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = de_highlight_bar
			pos = <highlight_bar_pos>
			scale = <highlight_bar_scale>
			just = [center center]
			rgba = <bar_rgba>
			alpha = 0
			z_priority = 3
			heap = topdown
		}
		band = ((playlist_tracks[<index>]).band)
		track_title = ((playlist_tracks[<index>]).track_title)
		genre = ((playlist_tracks[<index>]).genre)
		CreateScreenElement {
			type = textElement
			parent = <anchor_id>
			font = dialog
			text = <band>
			pos = (55.0,0.0)
			just = [left center]
			rgba = <off_rgba>
			scale = 0.69999999
			heap = topdown
		}
		CreateScreenElement {
			type = textElement
			parent = <anchor_id>
			font = dialog
			text = <track_title>
			pos = (220.0,0.0)
			just = [left center]
			rgba = <off_rgba>
			scale = 0.69999999
			heap = topdown
		}
		switch <genre>
			case 0
				genre_text = "Punk"
			case 1
				genre_text = "Hip Hop"
			case 2
				genre_text = "Rock/Other"
			default
				genre_text = ""
		endswitch
		CreateScreenElement {
			type = textElement
			parent = <anchor_id>
			font = dialog
			text = <genre_text>
			pos = (510.0,0.0)
			just = [center center]
			rgba = <off_rgba>
			scale = 0.69999999
			heap = topdown
		}
		if TrackEnabled <index>
			alpha = 1
		else
			alpha = 0
		endif
		checkboxpos = (568.0,-4.0)
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = checkmark
			pos = <checkboxpos>
			alpha = <alpha>
			just = [left center]
			rgba = <off_rgba>
			z_priority = 5
			heap = topdown
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = checkbox
			pos = (<checkboxpos> + (0.0,5.0))
			just = [left center]
			scale = 0.5
			rgba = <off_rgba>
			z_priority = 5
			heap = topdown
		}
	endscript
	script playlist_menu_focus
		GetTags
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		DoScreenElementMorph id = {<id> child = 0} alpha = 1
		index = 1
		while
			if ScreenElementExists id = {<id> child = <index>}
				DoScreenElementMorph {id = {<id> child = <index>} rgba = <on_rgba>}
			else
				break
			endif
			index = (<index> + 1)
		repeat 4
		playlist_vmenu::GetTags
		if GotParam arrow_id
			menu_vert_blink_arrow {id = <arrow_id>}
		endif
		generic_menu_update_arrows menu_id = playlist_vmenu up_arrow_id = view_gaps_menu_up_arrow down_arrow_id = view_gaps_menu_down_arrow
	endscript
	script playlist_menu_unfocus
		GetTags
		FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		DoScreenElementMorph id = {<id> child = 0} alpha = 0
		index = 1
		while
			if ScreenElementExists id = {<id> child = <index>}
				DoScreenElementMorph {id = {<id> child = <index>} rgba = <off_rgba>}
			else
				break
			endif
			index = (<index> + 1)
		repeat
		PauseMusic 1
	endscript
	script create_soundtrack_menu
		FormatText ChecksumName = title_icon "%i_sound" i = (THEME_PREFIXES[current_theme_prefix])
		make_new_themed_scrolling_menu title = "SOUNDTRACKS" title_icon = <title_icon>
		SetScreenElementProps {id = sub_menu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = create_sound_options_menu}}
			]
		}
		theme_menu_add_item {text = "THUG Playlist"
			pad_choose_script = SetSoundtrack
			pad_choose_params = {track = ""}
			centered
			no_bg
			first_item
		}
		if isxbox
			GetNumSoundtracks
		else
			numsoundtracks = 0
		endif
		if (<numsoundtracks> > 0)
			index = 0
			while
				GetSoundtrackName <index>
				theme_menu_add_item {text = <soundtrackname>
					pad_choose_script = SetSoundtrack
					pad_choose_params = {track = <soundtrackname>}
					centered
					no_bg
					max_width = 380
				}
				<index> = (<index> + 1)
			repeat <numsoundtracks>
		endif
		theme_menu_add_item {text = "Done"
			id = menu_done
			pad_choose_script = create_sound_options_menu
			centered
			no_bg
			last_item
		}
		finish_themed_scrolling_menu
	endscript
	script GetSoundtracks
		GetNumSoundtracks
		index = 0
		while
			GetSoundtrackName <index>
			soundtracks[<index>] = <soundtrackname>
		repeat <numsoundtracks>
		return soundtracks
	endscript
	script SetSoundtrack
		if isps2
			return
		endif
		FormatText ChecksumName = trackchecksum "%t" t = <track>
		printf "soundtrack = %i" i = <trackchecksum>
		generic_menu_pad_choose
		SoundtrackExists trackname = <track>
		printf "soundtrack index = %i" i = <index>
		if NOT (current_soundtrack = <trackchecksum>)
			StopMusic
		endif
		if (<index> = -1)
			printf "use playlist"
			UseStandardSoundtrack
		else
			printf "use soundtrack"
			UseUserSoundtrack <index>
		endif
		change current_soundtrack = <trackchecksum>
		if LevelIs load_skateshop
			create_sound_options_menu
		else
			create_sound_options_menu from_options
		endif
	endscript
	script SoundtrackExists trackname = ""
		printf "trackname = %t" t = <trackname>
		FormatText ChecksumName = tracknamesum "%t" t = <trackname>
		GetNumSoundtracks
		if NOT (<numsoundtracks> = 0)
			index = 0
			while
				GetSoundtrackName <index>
				printf "soundtrackname = %t" t = <soundtrackname>
				FormatText ChecksumName = soundtracksum "%s" s = <soundtrackname>
				if (<tracknamesum> = <soundtracksum>)
					return {index = <index>}
				endif
				index = (<index> + 1)
			repeat <numsoundtracks>
		endif
		return {index = -1}
	endscript
	script set_loaded_soundtrack
		printf "set_loaded_soundtrack"
		if NOT isxbox
			return
		endif
		current_soundtrack_exists
		if NOT (current_soundtrack = #"0xFFFFFFFF")
			StopMusic
		endif
		if (<index> = -1)
			printf "use playlist"
			UseStandardSoundtrack
		else
			printf "use soundtrack %i" i = <index>
			UseUserSoundtrack <index>
		endif
		change current_soundtrack = <trackchecksum>
	endscript
	script current_soundtrack_exists
		GetNumSoundtracks
		if NOT (<numsoundtracks> = 0)
			index = 0
			while
				GetSoundtrackName <index>
				FormatText ChecksumName = soundtracksum "%s" s = <soundtrackname>
				if (current_soundtrack = <soundtracksum>)
					return {index = <index>}
				endif
				index = (<index> + 1)
			repeat <numsoundtracks>
		endif
		return {index = -1}
	endscript
