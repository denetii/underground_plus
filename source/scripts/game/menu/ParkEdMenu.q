
	script parked_menu_blink_arrow
		RunScriptOnScreenElement id = <id> menu_blink_arrow
	endscript
	parked_helper_text_pos = (320.0,405.0)
	script parked_make_piece_menu {
			total_dims = (430.0,60.0)
			separation = 60
		}
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		SetScreenElementLock id = root_window Off
		if ObjectExists id = piece_menu_container
			DestroyScreenElement id = piece_menu_container
		endif
		CreateScreenElement {
			parent = root_window
			id = piece_menu_container
			type = ContainerElement
			dims = (640.0,480.0)
			pos = (320.0,240.0)
			just = [center center]
			event_handlers = [
				{parked_menu_left parked_scroll_sideways_sound params = {}}
				{parked_menu_right parked_scroll_sideways_sound params = {}}
				{parked_menu_left parked_menu_blink_arrow params = {id = piece_menu_left_arrow}}
				{parked_menu_right parked_menu_blink_arrow params = {id = piece_menu_right_arrow}}
			]
		}
		FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_box_icons just_top icon_texture = <paused_icon> parent = piece_menu_container pos = (550.0,-5.0) scale = (1.79999995,2.29999995)
		build_grunge_piece parent = piece_menu_container rgba = [128 128 128 128]
		build_top_bar scale = (1.48000002,1.5) pos = (230.0,73.0) parent = piece_menu_container
		CreateScreenElement {
			type = SpriteElement
			parent = piece_menu_container
			id = right_bracket2
			pos = (575.0,123.0)
			texture = generic_sub_frame
			rgba = [128 128 128 128]
			scale = (1.5,1.10000002)
			alpha = 0.80000001
			z_priority = 1
			rot_angle = 180
		}
		CreateScreenElement {
			parent = piece_menu_container
			type = HScrollingMenu
			id = piece_menu_scrolling
			just = [left bottom]
			pos = (235.0,141.0)
			dims = <total_dims>
			internal_just = [center center]
			num_items_to_show = 6
		}
		CreateScreenElement {
			parent = piece_menu_scrolling
			type = HMenu
			id = piece_menu_hmenu
			just = [center top]
			pos = (30.0,0.0)
			dims = <total_dims>
			internal_just = [left center]
			regular_space_amount = <separation>
			disable_pad_handling
		}
		CreateScreenElement {
			type = TextElement
			parent = piece_menu_container
			id = piece_menu_name_text
			font = dialog
			text = "Monkey Stew"
			just = [center center]
			pos = (417.0,84.0)
			rgba = <on_rgba>
			scale = 0.85000002
		}
		CreateScreenElement {
			type = SpriteElement
			parent = piece_menu_container
			id = piece_menu_left_arrow
			texture = left_arrow
			just = [center center]
			pos = (240.0,83.0)
			scale = 0.80000001
		}
		CreateScreenElement {
			type = SpriteElement
			parent = piece_menu_container
			id = piece_menu_right_arrow
			texture = right_arrow
			just = [center center]
			pos = (595.0,83.0)
		} scale = 0.80000001
		CreateScreenElement {
			type = ContainerElement
			id = piece_slider_container
			parent = piece_menu_container
			dims = (320.0,50.0)
			just = [left top]
			pos = (230.0,70.0)
		}
		CreateScreenElement {
			type = SpriteElement
			id = piece_slider_orange
			parent = piece_slider_container
			dims = (4.0,4.0)
			scale = (26.0,1.5)
			rgba = <on_rgba>
			alpha = 1.0
			just = [left top]
			z_priority = 5
		}
		CreateScreenElement {
			type = SpriteElement
			id = piece_slider_gray
			parent = piece_slider_container
			dims = (4.0,4.0)
			scale = (95.0,1.20000005)
			rgba = [31 31 31 128]
			alpha = 1.0
			just = [left top]
			z_priority = 4
		}
	endscript
	script parked_destroy_piece_menu
		if ObjectExists id = piece_menu_container
			DestroyScreenElement id = piece_menu_container
		endif
	endscript
	script parked_make_piece_menu_item {
			item_dims = (50.0,50.0)
			item_midpoint = (30.0,25.0)
		}
		SetScreenElementLock id = piece_menu_hmenu Off
		CreateScreenElement {
			parent = piece_menu_hmenu
			type = ContainerElement
			id = <metapiece_id>
			dims = <item_dims>
			just = [center center]
			event_handlers = [
				{focus parked_piece_focus_script}
				{unfocus parked_piece_unfocus_script}
			]
		}
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = SpriteElement
			parent = <metapiece_id>
			texture = parked_piece_frame
			scale = (0.85900003,0.85900003)
			alpha = 0
			just = [center center]
			pos = <item_midpoint>
			rgba = <on_rgba>
		}
		if GotParam ClipBoardIndex
			FormatText TextName = text "%d" d = <ClipBoardIndex>
			CreateScreenElement {
				parent = <metapiece_id>
				type = TextElement
				font = dialog
				text = <text>
				just = [center center]
				pos = (30.0,35.0)
				scale = 1
			}
		else
			if GotParam EmptyClipBoard
				CreateScreenElement {
					parent = <metapiece_id>
					type = TextElement
					font = dialog
					text = 'None'
					just = [center center]
					pos = (30.0,35.0)
					scale = 1
				}
			else
				CreateScreenElement {
					parent = <metapiece_id>
					type = Element3d
					Sector = <Sector>
					Sectors = <Sectors>
					pos = <item_midpoint>
					dims = <item_dims>
					just = [center center]
					CameraZ = -6
					scale = 0.85000002
					anglex = 0.5
					angley = 0.78500003
					scale_to_screen_dims
				}
			endif
		endif
	endscript
	script parked_piece_focus_script
		GetTags
		DoScreenElementMorph {
			id = {<id> child = 1}
			scale = 1.20000005
			time = 0.25
		}
		DoScreenElementMorph id = {<id> child = 0} scale = 1.27499998 alpha = 0.55000001
	endscript
	script parked_piece_unfocus_script
		GetTags
		DoScreenElementMorph {
			id = {<id> child = 1}
			scale = 0.85000002
			time = 0.25
		}
		DoScreenElementMorph id = {<id> child = 0} scale = 1.27499998 alpha = 0
	endscript
	script parked_set_helper_text_mode
		if NOT ObjectExists id = piece_menu_container
			AddParams failed
			return
		endif
		SetScreenElementLock id = piece_menu_container Off
		switch <mode>
			case regular
				if isps2
					create_helper_text park_editor_helper_text parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999998
				else
					if isxbox
						create_helper_text park_editor_helper_text_xbox parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999998
					else
						create_helper_text park_editor_helper_text_ngc parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999998
					endif
				endif
			case gap_regular
				if isps2
					create_helper_text gap_regular_helper_text parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999998
				else
					if isxbox
						create_helper_text gap_regular_helper_text_xbox parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999998
					else
						create_helper_text gap_regular_helper_text_ngc parent = piece_menu_container helper_pos = parked_helper_text_pos scale = 0.89999998
					endif
				endif
			case gap_adjust
				if isps2
					create_helper_text gap_adjust_helper_text parent = piece_menu_container helper_pos = parked_helper_text_pos
				else
					if isxbox
						create_helper_text gap_adjust_helper_text_xbox parent = piece_menu_container helper_pos = parked_helper_text_pos
					else
						create_helper_text gap_adjust_helper_text_ngc parent = piece_menu_container helper_pos = parked_helper_text_pos
					endif
				endif
			case rail_placement
				helper_text = park_editor_helper_text
				RailEditor::GetEditingMode
				<scale> = 0.89999998
				switch <mode>
					case FreeRoaming
						helper_text = rail_editor_free_roam_helper_text
						<scale> = 0.80000001
					case RailLayout
						helper_text = rail_editor_layout_helper_text
						<scale> = 0.89999998
					case Grab
						helper_text = rail_editor_grab_helper_text
						<scale> = 0.89999998
				endswitch
				if isxbox
					switch <mode>
						case FreeRoaming
							helper_text = rail_editor_free_roam_helper_text_xbox
							<scale> = 0.80000001
						case RailLayout
							helper_text = rail_editor_layout_helper_text_xbox
							<scale> = 0.89999998
						case Grab
							helper_text = rail_editor_grab_helper_text_xbox
							<scale> = 0.89999998
					endswitch
				endif
				if isNGC
					switch <mode>
						case FreeRoaming
							helper_text = rail_editor_free_roam_helper_text_ngc
							<scale> = 0.80000001
						case RailLayout
							helper_text = rail_editor_layout_helper_text_ngc
							<scale> = 0.89999998
						case Grab
							helper_text = rail_editor_grab_helper_text_ngc
							<scale> = 0.89999998
					endswitch
				endif
				create_helper_text <helper_text> parent = piece_menu_container helper_pos = parked_helper_text_pos scale = <scale>
			default
		endswitch
		SetScreenElementLock id = piece_menu_container on
	endscript
	script parked_make_set_menu {
			corner_pos = (10.0,30.0)
			top_arrow_pos = (100.0,8.0)
			bottom_arrow_pos = (100.0,85.0)
			item_spacing = 19
			menu_offset_from_top = (33.0,5.0)
		}
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		SetScreenElementLock id = root_window Off
		if ObjectExists id = set_menu_container
		else
			make_new_menu {
				menu_id = set_menu_container
				type = VScrollingMenu
				scrolling_menu_id = set_menu_scrolling
				scrolling_menu_offset = (0.0,0.0)
				just = [left top]
				internal_just = [center center]
				pos = (150.0,40.0)
				dims = (150.0,120.0)
				vmenu_id = set_menu_vertical
				regular_space_amount = <item_spacing>
				internal_scale = 0.5
				dont_allow_wrap = 1
				num_items_to_show = 5
			}
			SetScreenElementProps {
				id = set_menu_container
				event_handlers = [
					{parked_menu_up generic_menu_up_or_down_sound params = {Up}}
					{parked_menu_down generic_menu_up_or_down_sound params = {Down}}
					{parked_menu_up parked_menu_blink_arrow params = {id = set_menu_up_arrow}}
					{parked_menu_down parked_menu_blink_arrow params = {id = set_menu_down_arrow}}
				]
			}
			CreateScreenElement {
				type = SpriteElement
				parent = set_menu_container
				id = set_menu_up_arrow
				texture = up_arrow
				just = [center center]
				pos = (200.0,30.0)
				scale = 0.80000001
			}
			CreateScreenElement {
				type = SpriteElement
				parent = set_menu_container
				id = set_menu_down_arrow
				texture = down_arrow
				just = [center center]
				pos = (200.0,138.0)
				scale = 0.80000001
			}
			theme_background {
				parent = set_menu_container
				id = set_bg
				width = 1.14999998
				pos = (130.0,20.0)
				num_parts = 3.0
				use_mm_parts = use_mm_parts
				bg_rgba = [60 60 60 128]
			}
		endif
		if NOT ObjectExists id = percent_bar
			CreateScreenElement {
				type = SpriteElement
				parent = root_window
				id = percent_bar
				just = [left top]
				pos = (20.0,410.0)
				rgba = [0 0 0 100]
				dims = (600.0,12.0)
			}
			CreateScreenElement {
				type = SpriteElement
				parent = percent_bar
				id = percent_bar_colored_part
				just = [left top]
				pos = (0.0,0.0)
				rgba = <on_rgba>
				dims = (600.0,12.0)
			}
		endif
		SetScreenElementLock id = root_window on
		wait 0.2 seconds
	endscript
	script parked_make_set_menu_item
		SetScreenElementLock id = current_menu Off
		theme_menu_add_item text = <set_name> no_choose_sound no_bg no_highlight_bar = no_highlight_bar
		SetScreenElementLock id = current_menu on
	endscript
	script parked_destroy_set_menu
		if ObjectExists id = set_menu_container
			DestroyScreenElement id = set_menu_container
		endif
		if ObjectExists id = percent_bar
			DestroyScreenElement id = percent_bar
		endif
	endscript
	script parked_lock_piece_and_set_menus
		SetScreenElementLock id = piece_menu_hmenu on
		SetScreenElementLock id = piece_menu_scrolling on
		SetScreenElementLock id = set_menu_scrolling on
		SetScreenElementLock id = set_menu_vertical on
		FireEvent type = unfocus target = {set_menu_vertical child = <last_set_number>}
		FireEvent type = focus target = {set_menu_vertical child = <set_number>}
	endscript
