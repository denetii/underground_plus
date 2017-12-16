
	script cas_add_item
		printf "Adding CAS item here"
        //DumpHeaps
		if GotParam play_deck_sound
			PlaySound DE_MenuSelect vol = 100
		endif
		change_current_part_highlight {id = <id> unfocus_script = <unfocus_script> unfocus_params = <unfocus_params>}
		cas_handle_disqualifications <...>
		if ChecksumEquals a = <part> b = skater_m_head
			clear_face_texture_from_profile
		endif
		if ChecksumEquals a = <part> b = skater_f_head
			clear_face_texture_from_profile
		endif
		GetCurrentSkaterProfileIndex
		if LevelIs Load_cas
			player = 0
		else
			player = <currentSkaterProfileIndex>
		endif
		if StructureContains structure = (<part>[0]) cad_graphic
			EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = deck_graphic desc_id = None}
		else
			if StructureContains structure = (<part>[0]) deck_graphic
				EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = cad_graphic desc_id = None}
				EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = deck_layer1 desc_id = None}
				EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = deck_layer2 desc_id = None}
				EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = deck_layer3 desc_id = None}
				EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = deck_layer4 desc_id = None}
				EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = deck_layer5 desc_id = None}
			endif
		endif
		EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {<...>}
		if LevelIs Load_cas
			if NOT (in_deck_design = 1)
				no_board = no_board
			endif
		endif
		RefreshSkaterModel skater = <player> profile = <currentSkaterProfileIndex> no_board = <no_board>
		if IsTrue cas_debug
			DumpHeaps
		endif
	endscript
	script cas_remove_item
		printf "Removing CAS item here"
		PrintStruct <...>
		GetCurrentSkaterProfileIndex
		if LevelIs Load_Skateshop
			EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = {<...>}
			RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
		else
			EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = {<...>}
			RefreshSkaterModel skater = <currentSkaterProfileIndex> profile = <currentSkaterProfileIndex>
		endif
	endscript
	script launch_bodyshape_menu
		RunScriptOnScreenElement id = current_menu_anchor animate_out callback = create_bodyshape_menu callback_params = {<...>}
	endscript
	script create_bodyshape_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		make_new_menu menu_id = cas_submenu vmenu_id = cas_subvmenu menu_title = "BUILDS" type = vscrollingmenu dims = (320.0,200.0)
		SetScreenElementProps {
			id = cas_submenu
			event_handlers = [{pad_back create_cas_menu}]
			replace_handlers
		}
		add_bodyshapes_to_menu <...>
		RunScriptOnScreenElement id = current_menu_anchor animate_in
	endscript
	script add_bodyshapes_to_menu
		GetArraySize master_bodyshape_list
		<index> = 0
		while
			make_text_sub_menu_item {
				text = ((master_bodyshape_list[<index>]).text)
				pad_choose_script = cas_apply_bodyshape
				pad_choose_params = {field = body_shape value = ((master_bodyshape_list[<index>]).scaling_table)}
			}
			<index> = (<index> + 1)
		repeat <array_size>
	endscript
	master_bodyshape_list = [
		{text = "Normal" scaling_table = normal_scale_info}
		{text = "Large" scaling_table = fat_scale_info}
		{text = "Athletic" scaling_table = athletic_scale_info}
		{text = "Kid" scaling_table = kid_scale_info}
	]
	script cas_apply_bodyshape
		printf "Applying body shape here"
		GetCurrentSkaterProfileIndex
		if LevelIs Load_Skateshop
			EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetChecksum targetParams = {<...>}
			RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
		else
			EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {<...>}
			RefreshSkaterModel skater = <currentSkaterProfileIndex> profile = <currentSkaterProfileIndex>
		endif
	endscript
	script cas_apply_sex apply_male = 1
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if (<is_male> = 1)
			<success> = 1
		else
			<success> = 0
		endif
		if (<success> = <apply_male>)
			printf "Same sex"
		else
			if (<apply_male> = 1)
				SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = appearance_custom_skater_male
				SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1
			else
				SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = appearance_custom_skater_female
				SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0
			endif
			RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
		endif
	endscript
	script refresh_skater_model
		GetCurrentSkaterProfileIndex
		if LevelIs Load_Skateshop
			<skaterIndex> = 0
		else
			<skaterIndex> = <currentSkaterProfileIndex>
		endif
		RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = <skaterIndex>
		RefreshSkaterScale profile = <currentSkaterProfileIndex> skater = <skaterIndex>
		RefreshSkaterVisibility profile = <currentSkaterProfileIndex> skater = <skaterIndex>
	endscript
	script refresh_skater_model_for_cheats
		<refresh_both_skaters> = 0
		if InSplitScreenGame
			<refresh_both_skaters> = 1
			if LevelIs Load_Skateshop
				<refresh_both_skaters> = 0
			endif
		endif
		if (<refresh_both_skaters> = 1)
			RefreshSkaterScale profile = 0 skater = 0
			RefreshSkaterVisibility profile = 0 skater = 0
			RefreshSkaterScale profile = 1 skater = 1
			RefreshSkaterVisibility profile = 1 skater = 1
		else
			GetCurrentSkaterProfileIndex
			if LevelIs Load_Skateshop
				<skaterIndex> = 0
			else
				<skaterIndex> = <currentSkaterProfileIndex>
			endif
			RefreshSkaterScale profile = <currentSkaterProfileIndex> skater = <skaterIndex>
			RefreshSkaterVisibility profile = <currentSkaterProfileIndex> skater = <skaterIndex>
		endif
	endscript
	script load_pro_skater
		SelectCurrentSkater name = <name>
		if LevelIs Load_cas
			skater::SwitchOffBoard
			no_board = no_board
		endif
		GetCurrentSkaterProfileIndex
		RefreshSkaterModel profile = <currentSkaterProfileIndex> skater = 0 no_board = <no_board>
		if NOT ObjectExists id = select_skater_top_anchor
			maybe_revert_theme
		endif
	endscript
