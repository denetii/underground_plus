
	
	
	node_array_index = 0
	search_array_index = 0
	geom_last_node = 0
	
	script LevelEditor_Geom_ShowMenu
		
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		pause_menu_gradient off
		make_new_menu {
			menu_id = leveleditor_menu
			vmenu_id = leveleditor_vmenu
			menu_title = "GEOMETRY"
			type = VScrollingMenu
			dims = (200.0,350.0)
			padding_scale = 0.94999999
			Pos = (108.0,42.0)
		}
		SetScreenElementProps {id = leveleditor_menu
			event_handlers = [
				{pad_back generic_menu_pad_back Params = {callback = exit_pause_menu}}
			]
		}
		set_theme_icons
		make_text_sub_menu_item text = "Clone" id = menu_timeofday pad_choose_script = LevelEditor_Geom_CloneObj pad_choose_params = {Name = geom_last_node}
		make_text_sub_menu_item text = "Delete" id = menu_lighting pad_choose_script = LevelEditor_Geom_KillObject pad_choose_params = {}
		make_text_sub_menu_item text = "Invisible" id = menu_set_pro_skater pad_choose_script = LevelEditor_Geom_HideObject pad_choose_params = {}
		make_text_sub_menu_item text = "Continue" id = menu_done pad_choose_script = leveleditor_menu_resume
		RunScriptOnScreenElement id = current_menu_anchor animate_in Params = {final_pos = (320.0,134.0)}
		
	endscript
	
	
	script LevelEditor_Geom_Init
		leveleditor_cursor::unhide
		leveleditor_cursor::Obj_InitModel model = "Super_Pro_Arrow\Super_Pro_Arrow.mdl"
		
		SetScreenElementProps {
			id = leveleditor_menu_title
			text = "Level Editor - Level Geometry"
		}
		SetScreenElementProps {id = leveleditor_piece_label text = "Object:"}
		SetScreenElementProps {id = leveleditor_desc_label text = ""}
		LevelEditor_Geom_NextLevelObject
	endscript
	
	script LevelEditor_Geom_Close
		LevelEditor_Geom_RemoveHighlight
		leveleditor_cursor::Hide
	endscript
	
	script LevelEditor_Geom_EveryFrame
		leveleditor::GetCursorPosition
		leveleditor_cursor::Obj_SetPosition position = <Pos>
		leveleditor_cursor::Obj_Rotate absolute = (<Angle> * (0.0,1.0,0.0))
		
	endscript
	
	
	
	
	script LevelEditor_Geom_UpdateCursor
		leveleditor_cursor::die
		CreateCompositeObject {
			Components = [
				{component = suspend}
				{component = motion}
				{component = skaterproximity}
				{component = sound}
				{component = model model = "none"}
			]
			Params = {Name = leveleditor_cursor Pos = (0.0,200.0,0.0) cloneFrom = floor}
		}
	endscript
	
	script LevelEditor_Geom_MoveCursor Pos = (0.0,0.0,0.0)
		leveleditor::EditorCam_SetCursorPos position = <Pos>
	endscript
	
	
	script LevelEditor_Geom_NextLevelObject flag = class
		tmp_na_index = node_array_index
		while
			change node_array_index = (<tmp_na_index> + 1)
			
			if GetElement NodeArray Index = node_array_index
				if StructureContains structure = <Element> <flag>
					
					geom_cur_node = (<Element>.class)
					geom_cur_pos = (<Element>.Pos)
					geom_cur_name = (<Element>.Name)
					
					if (<geom_cur_node> = LevelGeometry)
						if StructureContains structure = <Element> TriggerScript
						else
							if StructureContains structure = <Element> TrickObject
								LevelEditor_Geom_MoveCursor Pos = <geom_cur_pos>
								change geom_last_node = <geom_cur_name>
								
								FormatText ChecksumName = cloned_node_name "%i" i = <geom_cur_name>
								SetScreenElementProps {
									id = leveleditor_piece
									text = (<cloned_node_name>)
								}
								SpawnScript LevelEditor_Geom_HighlightObject Params = {Name = <geom_cur_name>}
								break
							endif
						endif
					endif
					
				endif
			else
				change node_array_index = 0
				break
			endif
			
		repeat
	endscript
	
	
	script LevelEditor_Geom_PrevLevelObject flag = class
		tmp_na_index = node_array_index
		while
			change node_array_index = (<tmp_na_index> - 1)
			
			if GetElement NodeArray Index = node_array_index
				if StructureContains structure = <Element> <flag>
					
					geom_cur_node = (<Element>.class)
					geom_cur_pos = (<Element>.Pos)
					geom_cur_name = (<Element>.Name)
					
					if (<geom_cur_node> = LevelGeometry)
						
						
						if StructureContains structure = <Element> TriggerScript
						else
							if StructureContains structure = <Element> TrickObject
								LevelEditor_Geom_MoveCursor Pos = <geom_cur_pos>
								change geom_last_node = <geom_cur_name>
								
								FormatText ChecksumName = cloned_node_name "%i" i = <geom_cur_name>
								SetScreenElementProps {
									id = leveleditor_piece
									text = <cloned_node_name>
								}
								SpawnScript LevelEditor_Geom_HighlightObject Params = {Name = <geom_cur_name>}
								break
							endif
						endif
					endif
					
				endif
			else
				change node_array_index = 0
				break
			endif
			
		repeat
	endscript
	
	script LevelEditor_Geom_HighlightObject
		if GotParam Name
			while
				Invisible Name = <Name>
				wait 10 frames
				Visible Name = <Name>
				wait 10 frames
			repeat
		else
			
		endif
	endscript
	
	script LevelEditor_Geom_RemoveHighlight
		KillSpawnedScript Name = LevelEditor_Geom_HighlightObject
		
		if GetElement NodeArray Index = node_array_index
			if StructureContains structure = <Element> class
				geom_cur_name = (<Element>.Name)
				Visible Name = <geom_cur_name>
			endif
		endif
	endscript
	
	
	script LevelEditor_Geom_CloneObj
		if GotParam Name
			LevelEditor_Geom_GetNode nodename = <Name>
			node_origin = (<node>.Pos)
			node_name = (<node>.Name)
			node_angle = (<node>.angles)
			
			leveleditor::GetCursorPosition
			new_node_pos = (<Pos> - <node_origin>)
			new_node_angles = ((0.0,1.0,0.0) * <Angle>)
			new_node_angles_rad = ((0.0,1.0,0.0) * (<Angle> * (3.14159274 / 180.0)))
			
			RotateVector X = (<new_node_pos>.(1.0,0.0,0.0)) y = (<new_node_pos>.(0.0,1.0,0.0)) z = (<new_node_pos>.(0.0,0.0,1.0)) rx = (0.0) ry = (<new_node_angles>.(0.0,1.0,0.0)) rz = (0.0)
			new_node_x = ((1.0,0.0,0.0) * <X>)
			new_node_y = ((0.0,1.0,0.0) * <y>)
			new_node_z = ((0.0,0.0,1.0) * <z>)
			new_node_pos_final = (<new_node_x> + <new_node_y> + <new_node_z>)
			
			clone_obj_node = {
				Pos = <new_node_pos>
				angles = (0.0,0.0,0.0)
				Name = <node_name>
				class = LevelObject
				CreatedAtStart
				CollisionMode = Geometry
			}
			
			CreateFromStructure <clone_obj_node>
			
			
			Ksk_DebugValue value_name = "Position" value_value = <new_node_pos>
			Ksk_DebugValue value_name = "Angles" value_value = (0.0,0.0,0.0)
			Ksk_DebugValue value_name = "Name" value_value = <node_name>
		else
			
		endif
		exit_pause_menu
	endscript
	
	
	script LevelEditor_Geom_GetNode
		change search_array_index = 0
		if GotParam nodename
			tmp_na_index = search_array_index
			while
				change search_array_index = (<tmp_na_index> + 1)
				if GetElement NodeArray Index = search_array_index
					if StructureContains structure = <Element> class
						geom_cur_name = (<Element>.Name)
						if (<geom_cur_name> = <nodename>)
							return node = <Element>
						endif
					endif
				endif
			repeat
		else
			create_console_message text = "No object name"
		endif
	endscript
	
	script LevelEditor_Geom_HideObject
		KillSpawnedScript Name = LevelEditor_Geom_HighlightObject
		if GetElement NodeArray Index = node_array_index
			if StructureContains structure = <Element> class
				geom_cur_name = (<Element>.Name)
				Invisible Name = <geom_cur_name>
			endif
		endif
		exit_pause_menu
	endscript
	script LevelEditor_Geom_KillObject
		KillSpawnedScript Name = LevelEditor_Geom_HighlightObject
		if GetElement NodeArray Index = node_array_index
			if StructureContains structure = <Element> class
				geom_cur_name = (<Element>.Name)
				kill Name = <geom_cur_name>
			endif
		endif
		exit_pause_menu
	endscript
	
	
	
	script LevelEditor_Geom_X
		LevelEditor_Geom_GetNode nodename = geom_last_node
		node_name = (<node>.Name)
		node_pos = (<node>.Pos)
		leveleditor::GetCursorPosition
		last_position = <Pos>
		while
			wait 5 frames
			leveleditor::GetCursorPosition
			MoveNode Name = <node_name> position = (<Pos> - <node_pos>)
			if ControllerPressed X
				break
			endif
			if ControllerPressed Circle
				MoveNode Name = <node_name> position = <last_position>
				break
			endif
		repeat
		
		
		ControllerDebounce X time = 0.89999998 clear = 1
	endscript
	
	script LevelEditor_Geom_Square
		LevelEditor_Geom_RemoveHighlight
		LevelEditor_Geom_NextLevelObject
		ControllerDebounce Square time = 0.2 clear = 1
	endscript
	
	script LevelEditor_Geom_Circle
		LevelEditor_Geom_RemoveHighlight
		LevelEditor_Geom_PrevLevelObject
		ControllerDebounce Circle time = 0.2 clear = 1
	endscript
	
	script LevelEditor_Geom_Triangle
		LevelEditor_Geom_ShowMenu
		ControllerDebounce Triangle time = 0.89999998 clear = 1
	endscript
	
	
	
	
	
	
	
	
