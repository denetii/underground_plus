
	script create_snazzy_dialog_box {title = "Title"
			text = "Default text"
			bg_anchor_id = dialog_bg_anchor
			anchor_id = dialog_box_anchor
			vmenu_id = dialog_box_vmenu
			title_font = small
			font = small
			pos = (320.0,240.0)
			just = [center top]
			scale = 1
			line_spacing = 0.69999999
			title_scale = 1
			text_scale = 0.89999998
			text_dims = (200.0,0.0)
			pos_tweak = (0.0,-50.0)
			bg_rgba = [0 0 0 70]
			bg_scale = 1
			hmenu_pos = (0.0,40.0)
			z_priority = 10
		}
		FormatText ChecksumName = title_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if ScreenElementExists id = <anchor_id>
			dialog_box_exit anchor_id = <anchor_id>
		endif
		if NOT InNetGame
			if NOT LevelIs load_skateshop
			endif
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = <bg_anchor_id>
			dims = (640.0,480.0)
			pos = (320.0,240.0)
			just = [center center]
			z_priority = <z_priority>
		}
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = <anchor_id>
			dims = (640.0,480.0)
			pos = <pos>
			just = [center center]
			z_priority = <z_priority>
		}
		if LevelIs load_skateshop
			if NOT GotParam no_bg
				build_top_and_bottom_blocks parent = <bg_anchor_id>
				make_mainmenu_3d_plane parent = <bg_anchor_id>
			endif
		endif
		if GotParam forced_pos
			pos = <forced_pos>
		endif
		CreateScreenElement {
			type = VMenu
			parent = <anchor_id>
			id = <vmenu_id>
			pos = <pos>
			just = [center top]
			internal_just = [center top]
			scale = <scale>
			z_priority = <z_priority>
		}
		if GotParam buttons
			GetArraySize <buttons>
			if GotParam pad_back_script
				if (<array_size> = 1)
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						generic_dialog_helper_text3
						bg_rgba = <helper_text_bg_rgba>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						generic_helper_text
						bg_rgba = <helper_text_bg_rgba>
					}
				endif
			else
				if (<array_size> = 1)
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						generic_dialog_helper_text
						bg_rgba = <helper_text_bg_rgba>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						generic_dialog_helper_text2
						bg_rgba = <helper_text_bg_rgba>
					}
				endif
			endif
		endif
		CreateScreenElement {
			type = TextElement
			parent = <vmenu_id>
			font = <title_font>
			text = <title>
			just = [center top]
			rgba = <title_rgba>
			scale = <title_scale>
			scale = 1.5
			z_priority = <z_priority>
			not_focusable
		}
		<title_id> = <id>
		GetScreenElementDims id = <title_id>
		CreateScreenElement {
			type = TextBlockElement
			parent = <vmenu_id>
			font = dialog
			text = <text>
			just = [center top]
			dims = <text_dims>
			rgba = <text_rgba>
			scale = <text_scale>
			line_spacing = <line_spacing>
			allow_expansion
			not_focusable
			z_priority = <z_priority>
		}
		<text_id> = <id>
		GetScreenElementDims id = <text_id>
		if GotParam buttons
			CreateScreenElement {
				type = ContainerElement
				parent = <vmenu_id>
				dims = (<text_dims> + (50.0,20.0))
				not_focusable
			}
		endif
		if GotParam logo
			CreateScreenElement {
				type = SpriteElement
				parent = <vmenu_id>
				texture = <logo>
				just = [center center]
				rgba = [128 128 128 128]
				scale = 1.0
			}
			no_icon = no_icon
			if (<logo> = dnas)
				CreateScreenElement {
					type = TextBlockElement
					parent = <vmenu_id>
					text = "\nDNAS is a trademark of \nSony Computer Entertainment Inc."
					font = dialog
					dims = (300.0,100.0)
					just = [center center]
					rgba = <text_rgba>
					scale = <text_scale>
				}
			endif
		endif
		if GotParam pad_back_script
			SetScreenElementProps {
				id = <vmenu_id>
				event_handlers = [{pad_back <pad_back_script> params = <pad_back_params>}]
				replace_handlers
			}
		endif
		SetScreenElementLock id = <vmenu_id> on
		SetScreenElementLock id = <vmenu_id> off
		GetScreenElementDims id = <vmenu_id>
		section_width = ((<width> / 100.0) + 0.0)
		if GotParam buttons
			ForEachIn <buttons> do = create_dialog_button params = {font = <font> parent = <vmenu_id> z_priority = (<z_priority> + 4) width = <section_width> pad_focus_script = <pad_focus_script>}
			GetArraySize <buttons>
			if (<array_size> > 1)
				SetScreenElementProps {
					id = <vmenu_id>
					event_handlers = [
						{pad_up generic_menu_up_or_down_sound params = {up}}
						{pad_down generic_menu_up_or_down_sound params = {down}}
					]
				}
			endif
		endif
		if GotParam sub_logo
			CreateScreenElement {
				type = SpriteElement
				parent = <vmenu_id>
				texture = <sub_logo>
				just = [center center]
				rgba = [128 128 128 88]
				scale = 1.20000005
				not_focusable
			}
			no_icon = no_icon
		endif
		SetScreenElementLock id = <vmenu_id> on
		SetScreenElementLock id = <vmenu_id> off
		GetScreenElementDims id = <vmenu_id>
		section_width = ((<width> / 100.0) + 0.0)
		section_height = 32
		num_parts = (((<height> * 1.0) / (<section_height> * 1.0)) -1.0)
		if NOT GotParam forced_pos
			centered_pos = ((320.0,0.0) + ((0.0,1.0) * (480 - <height>) / 2) + <pos_tweak>)
			SetScreenElementProps id = <vmenu_id> pos = <centered_pos>
		else
			centered_pos = <forced_pos>
		endif
		theme_dialog_background {parent = <anchor_id>
			width = <section_width>
			pos = (<centered_pos> + (0.0,-8.0))
			num_parts = <num_parts>
			z_priority = 10
			no_icon = <no_icon>
			add_loading_anim = <add_loading_anim>
		}
		kill_start_key_binding
		if ObjectExists id = no_button
			FireEvent type = focus target = <vmenu_id> data = {child_id = no_button}
		else
			FireEvent type = focus target = <vmenu_id>
		endif
		if GotParam delay_input
			RunScriptOnScreenElement id = <anchor_id> dialog_box_delay_input params = {delay_input_time = <delay_input_time>}
		endif
		if NOT GotParam no_animate
			if GotParam style
				RunScriptOnScreenElement id = <anchor_id> <style> params = <...>
			else
				RunScriptOnScreenElement id = <anchor_id> animate_dialog_box_in params = <...>
			endif
		endif
	endscript
	script special_dialog_style
		GetScreenElementDims id = <vmenu_id>
		GetScreenElementPosition id = <vmenu_id>
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			id = left_star
			pos = (<ScreenElementPos> + (30.0,0.0))
			texture = PA_goals
			rgba = [128 128 128 100]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			id = right_star
			pos = ((1.0,0.0) * <width> + <ScreenElementPos> + (-30.0,0.0))
			texture = PA_goals
			rgba = [128 128 128 100]
		}
		SpawnScript spin_star params = {id = left_star dir = cw}
		SpawnScript spin_star params = {id = right_star dir = ccw}
		SpawnScript pulse_dialog_title params = {id = <title_id>}
		DoScreenElementMorph id = <anchor_id> time = 0 pos = (320.0,500.0)
		DoScreenElementMorph id = <anchor_id> time = 0.2 pos = (320.0,240.0)
	endscript
	script end_special_dialog_style
		KillSpawnedScript type = spin_star
		KillSpawnedScript type = spin_star
		KillSpawnedScript type = pulse_dialog_title
	endscript
	script spin_star dir = cw
		if (<dir> = cw)
			<sign> = 1
		else
			<sign> = -1
		endif
		while
			if ObjectExists id = <id>
				DoScreenElementMorph id = <id> time = 40.0 rot_angle = (7200 * <sign>)
				wait 40.0 seconds
			else
				break
			endif
			if ObjectExists id = <id>
				DoScreenElementMorph id = <id> time = 0.0 rot_angle = (<sign>)
				wait 1
			else
				break
			endif
		repeat
	endscript
	script pulse_dialog_title
		while
			if ObjectExists id = <id>
				DoScreenElementMorph id = <id> time = 0.2 scale = 1.20000005
				wait 0.2 seconds
			else
				break
			endif
			if ObjectExists id = <id>
				DoScreenElementMorph id = <id> time = 0.2 scale = 1.10000002
				wait 0.2 seconds
			else
				break
			endif
		repeat
	endscript
	script theme_dialog_background parent = current_menu_anchor width = 1 pos = (320.0,120.0) num_parts = 2 top_height = 1
		if ScreenElementExists id = dialog_box_bg_vmenu
			destroyscreenelement id = dialog_box_bg_vmenu
		endif
		FormatText ChecksumName = dialog_bg_rgba "%i_BG_PARTS_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		SetScreenElementLock id = <parent> off
		CreateScreenElement {
			type = VMenu
			parent = <parent>
			id = dialog_box_bg_vmenu
			font = small
			just = [left top]
			pos = <pos>
			padding_scale = 1
			internal_scale = 1
			internal_just = [center center]
		}
		middle_parts = <num_parts>
		CasttoInteger middle_parts
		partial_scale = (<num_parts> - <middle_parts>)
		printf "partial_scale = %p" p = <partial_scale>
		build_theme_dialog_top parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> z_priority = <z_priority> height = <top_height>
		if (<middle_parts> > 0)
			while
				build_theme_dialog_middle parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> z_priority = <z_priority>
			repeat <middle_parts>
		endif
		build_theme_dialog_middle parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> scale_height = <partial_scale> z_priority = <z_priority>
		build_theme_dialog_bottom parent = dialog_box_bg_vmenu width = <width> dialog_bg_rgba = <dialog_bg_rgba> scale_height = <partial_scale> z_priority = <z_priority> no_icon = <no_icon> add_loading_anim = <add_loading_anim>
	endscript
	script build_theme_dialog_top
		CreateScreenElement {
			type = ContainerElement
			dims = (0.0,32.0)
			parent = <parent>
		}
		anchor_id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = snaz_T_M
			pos = (0.0,0.0)
			just = [center top]
			rgba = <dialog_bg_rgba>
			scale = ((1.0,0.0) * <width> + (0.0,1.0) * <height>)
			z_priority = <z_priority>
		}
		<top_height> = <height>
		GetScreenElementDims id = <id>
		right_pos = ((0.5,0.0) * <width>)
		left_pos = ((-0.5,0.0) * <width>)
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = snaz_T_L
			pos = <left_pos>
			just = [right top]
			rgba = <dialog_bg_rgba>
			scale = ((1.0,0.0) + (0.0,1.0) * <top_height>)
			z_priority = <z_priority>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = snaz_T_R
			pos = <right_pos>
			just = [left top]
			rgba = <dialog_bg_rgba>
			scale = ((1.0,0.0) + (0.0,1.0) * <top_height>)
			z_priority = <z_priority>
		}
	endscript
	script build_theme_dialog_middle scale_height = 1
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			dims = (0.0,32.0)
		}
		anchor_id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = snaz_M_M
			pos = (0.0,0.0)
			just = [center top]
			rgba = <dialog_bg_rgba>
			scale = ((1.0,0.0) * <width> + <scale_height> * (0.0,1.0))
			z_priority = <z_priority>
		}
		GetScreenElementDims id = <id>
		right_pos = ((0.5,0.0) * <width>)
		left_pos = ((-0.5,0.0) * <width>)
		side_scale = ((1.0,0.0) * 1 + <scale_height> * (0.0,1.0))
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = snaz_M_L
			pos = <left_pos>
			just = [right top]
			rgba = <dialog_bg_rgba>
			scale = <side_scale>
			z_priority = <z_priority>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = snaz_M_R
			pos = <right_pos>
			just = [left top]
			rgba = <dialog_bg_rgba>
			scale = <side_scale>
			z_priority = <z_priority>
		}
	endscript
	script build_theme_dialog_bottom
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			dims = (0.0,32.0)
		}
		anchor_id = <id>
		pos = ((0.0,-1.0) * (32 - (<scale_height> * 32)))
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = snaz_B_M
			pos = <pos>
			just = [center top]
			rgba = <dialog_bg_rgba>
			scale = ((1.0,0.0) * <width> + (0.0,1.0))
			z_priority = <z_priority>
		}
		GetScreenElementDims id = <id>
		right_pos = ((0.5,0.0) * <width> + <pos>)
		left_pos = ((-0.5,0.0) * <width> + <pos>)
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = snaz_B_L
			pos = <left_pos>
			just = [right top]
			rgba = <dialog_bg_rgba>
			scale = (1.0,1.0)
			z_priority = <z_priority>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = snaz_B_R
			pos = <right_pos>
			just = [left top]
			rgba = <dialog_bg_rgba>
			scale = (1.0,1.0)
			z_priority = <z_priority>
		}
		if NOT GotParam no_icon
			FormatText ChecksumName = theme_icon "%i_snaz_icon" i = (THEME_PREFIXES[current_theme_prefix])
			CreateScreenElement {
				type = SpriteElement
				parent = <anchor_id>
				texture = <theme_icon>
				pos = ((0.0,10.0) + <pos>)
				just = [center center]
				rgba = [50 50 50 70]
				scale = (1.29999995,1.29999995)
				z_priority = (<z_priority> + 1)
			}
			if GotParam add_loading_anim
				RunScriptOnScreenElement id = <id> spin_dialog_icon
			endif
		endif
	endscript
	script spin_dialog_icon
		while
			DoMorph rot_angle = 360 time = 1.0
			DoMorph rot_angle = 0 time = 1.0
		repeat
	endscript
	script create_error_box delay_input_time = 1000
		create_dialog_box <...> error_box
	endscript
	script create_dialog_box
		create_snazzy_dialog_box <...>
	endscript
	script create_dialog_button {focus_script = theme_item_focus
			focus_params = {text_scale = 1.14499998}
			unfocus_script = theme_item_unfocus
			pad_choose_script = dialog_box_exit
			font = small
			parent = dialog_box_vmenu
		}
		SetScreenElementLock id = root_window off
		SetScreenElementLock id = <parent> off
		FormatText ChecksumName = text_color "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if (<text> = "No")
			id = no_button
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			id = <id>
			dims = (0.0,20.0)
			just = [center center]
			event_handlers =
			[
				{focus <focus_script> params = <focus_params>}
				{unfocus <unfocus_script> params = <unfocus_params>}
				{pad_choose generic_menu_pad_choose_sound}
				{pad_start generic_menu_pad_choose_sound}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{pad_start <pad_choose_script> params = <pad_choose_params>}
			]
			<not_focusable>
		}
		anchor_id = <id>
		CreateScreenElement {
			type = TextElement
			parent = <anchor_id>
			pos = (0.0,0.0)
			font = <font>
			text = <text>
			just = [center center]
			scale = 1
			rgba = <text_color>
			z_priority = <z_priority>
		}
		highlight_angle = RandomNoRepeat(@2 @-2 @3 @-3 @3.5 @-3 @5 @-4 @2.5 @-4.5)
		bar_scale = ((<width> + 2) * (0.5,0.0) + (0.0,0.69999999))
		highlight_angle = (<highlight_angle> / (<bar_scale>.(1.0,0.0)))
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = DE_highlight_bar
			pos = (0.0,0.0)
			rgba = [0 0 0 0]
			just = [center center]
			scale = <bar_scale>
			z_priority = 11
			rot_angle = <highlight_angle>
		}
	endscript
	script dialog_box_exit {anchor_id = dialog_box_anchor bg_anchor_id = dialog_bg_anchor}
		SetButtonEventMappings unblock_menu_input
		DeBounce x time = 0.30000001
		if ObjectExists id = <anchor_id>
			destroyscreenelement id = <anchor_id>
		endif
		if ObjectExists id = <bg_anchor_id>
			destroyscreenelement id = <bg_anchor_id>
		endif
		if LevelIs load_skateshop
		endif
		if NOT GotParam no_pad_start
			if NOT LevelIs load_skateshop
				SetScreenElementProps {
					id = root_window
					event_handlers = [{pad_start handle_start_pressed}]
					replace_handlers
				}
			endif
		endif
	endscript
	script dialog_box_delay_input delay_input_time = 2000
		SetButtonEventMappings block_menu_input
		wait <delay_input_time>
		SetButtonEventMappings unblock_menu_input
	endscript
	script test_dialog_box
		create_dialog_box {title = "Dialog Box"
			text = "testing this stuff to see if it works"
			buttons = [{text = "Yes"}
				{text = "No" pad_choose_script = dialog_button_test}
			]
		}
	endscript
	script dialog_button_test
		SetProps rgba = [128 0 0 128]
		DoMorph time = 0.25 scale = 2
		DoMorph time = 0.5 scale = 1.20000005
		SetProps rgba = [128 128 0 128]
	endscript
	script create_speech_box {pos = (320.0,440.0)
			text_rgba = [128 128 128 128]
			anchor_id = speech_box_anchor
			scale = 1
			pad_choose_script = speech_box_exit
			pad_choose_params = {anchor_id = <anchor_id>}
			parent = root_window
			font = dialog
			bg_x_scale = 1.12
			pause_input_time = 1000
		}
		FormatText ChecksumName = bg_rgba "%i_SPEECH_BOX_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		if ObjectExists id = <anchor_id>
			destroyscreenelement id = <anchor_id>
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = ContainerElement
			parent = <parent>
			id = <anchor_id>
			pos = (320.0,210.0)
			dims = (640.0,480.0)
			scale = <scale>
			z_priority = <z_priority>
		}
		if NOT GotParam no_pad_choose
			SetScreenElementProps {
				id = <anchor_id>
				event_handlers = [{pad_choose <pad_choose_script> params = <pad_choose_params>}]
				replace_handlers
			}
		endif
		if GotParam pad_back_script
			SetScreenElementProps {
				id = <anchor_id>
				event_handlers = [{pad_back <pad_back_script> params = <pad_back_params>}]
				replace_handlers
			}
		endif
		if GotParam pad_circle_script
			SetScreenElementProps {
				id = <anchor_id>
				event_handlers = [{pad_circle <pad_circle_script> params = <pad_circle_params>}]
				replace_handlers
			}
		endif
		if GotParam pad_square_script
			SetScreenElementProps {
				id = <anchor_id>
				event_handlers = [{pad_square <pad_square_script> params = <pad_square_params>}]
				replace_handlers
			}
		endif
		if GotParam pad_option_script
			SetScreenElementProps {
				id = <anchor_id>
				event_handlers = [{pad_option <pad_option_script> params = <pad_option_params>}]
				replace_handlers
			}
		endif
		if GotParam pad_up_script
			SetScreenElementProps {
				id = <anchor_id>
				event_handlers = [{pad_up <pad_up_script> params = <pad_up_params>}]
				replace_handlers
			}
		endif
		if GotParam pad_down_script
			SetScreenElementProps {
				id = <anchor_id>
				event_handlers = [{pad_down <pad_down_script> params = <pad_down_params>}]
				replace_handlers
			}
		endif
		if GotParam pad_left_script
			SetScreenElementProps {
				id = <anchor_id>
				event_handlers = [{pad_left <pad_left_script> params = <pad_left_params>}]
				replace_handlers
			}
		endif
		if GotParam pad_right_script
			SetScreenElementProps {
				id = <anchor_id>
				event_handlers = [{pad_right <pad_right_script> params = <pad_right_params>}]
				replace_handlers
			}
		endif
		if NOT GotParam no_pad_start
			SetScreenElementProps {
				id = root_window
				event_handlers = [{pad_start <pad_choose_script> params = <pad_choose_params>}]
				replace_handlers
			}
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			pos = <pos>
			just = [center bottom]
			texture = dialog_frame_b
			scale = ((1.0,0.0) * <bg_x_scale> + (0.0,1.0))
			rgba = <bg_rgba>
		}
		CreateScreenElement {
			type = TextBlockElement
			parent = <anchor_id>
			shadow
			shadow_offs = (1.0,1.0)
			shadow_rgba = [10 10 10 100]
			font = <font>
			dims = ((290.0,0.0))
			pos = (0.0,0.0)
			just = [center top]
			text = <text>
			internal_scale = 0.85000002
			internal_just = [center bottom]
			rgba = <text_rgba>
			scale = 1
			allow_expansion
		}
		<speech_text> = <id>
		GetScreenElementDims id = <speech_text>
		SetScreenElementProps {
			id = <speech_text>
			pos = (<pos> - (0.0,16.0) - ((0.0,1.0) * <height>))
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			texture = dialog_middle
			pos = (<pos> - (0.0,16.0))
			scale = (((1.0,0.0) * <bg_x_scale>) + (0.0,1.0) * <height> / 16)
			just = [center bottom]
			rgba = <bg_rgba>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <anchor_id>
			pos = (<pos> - (0.0,16.0) - (0.0,1.0) * <height>)
			just = [center bottom]
			texture = dialog_frame
			scale = ((1.0,0.0) * <bg_x_scale> + (0.0,1.0))
			rgba = <bg_rgba>
		}
		if GotParam style
			RunScriptOnScreenElement id = <anchor_id> <style> params = <...>
		endif
		FireEvent type = focus target = <anchor_id>
		if GotParam pause_input
			SpawnScript TemporarilyDisableInput params = {time = <pause_input_time>}
		endif
	endscript
	script speech_box_exit anchor_id = speech_box_anchor
		if ObjectExists id = <anchor_id>
			destroyscreenelement id = <anchor_id>
		endif
		DeBounce x time = 0.30000001
		if NOT GotParam no_pad_start
			restore_start_key_binding
		endif
		FireEvent type = speech_box_destroyed
	endscript
	script speech_box_style
		RunScriptOnScreenElement id = <speech_text> hide_speech_text params = <...>
		DoMorph time = 0 scale = (1.0,1.0) alpha = 1
		wait 4 frame
		DoMorph time = 0.2 scale = (1.0,1.0) alpha = 1
		RunScriptOnScreenElement id = <speech_text> speech_box_style_scale_text params = <...>
	endscript
	script hide_speech_text
		DoMorph time = 0 scale = 0
	endscript
	script speech_box_style_scale_text anchor_id = <anchor_id>
		wait 0.05 second
		DoMorph time = 0 scale = (1.0,1.0) alpha = 0
		DoMorph time = 0.5 scale = (1.0,1.0) alpha = 1
		FireEvent type = focus target = <anchor_id>
	endscript
	script animate_dialog_box_in
		if NOT GotParam delay_input
			SpawnScript dialog_box_delay_input params = {delay_input_time = 150}
		endif
		DoMorph time = 0 scale = (0.0,0.0) alpha = 0.1
		DoMorph time = 0.15000001 scale = (1.0,0.0) alpha = 0.40000001
		DoMorph time = 0.15000001 scale = (1.0,1.0) alpha = 1.0
	endscript
	script create_test_dialog
		if ScreenElementExists id = current_menu_anchor
			destroyscreenelement id = current_menu_anchor
		endif
		create_dialog_box {pad_back_script = create_test_menu
			buttons = [{font = small text = "No" pad_choose_script = create_test_menu}
				{font = small text = "Yes" pad_choose_script = null_script}
			]
		}
	endscript
