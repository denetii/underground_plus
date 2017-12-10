
	
	le_active = 0
	
	
	LE_MODE_MODEL = 0
	LE_MODE_GEOM = 1
	LE_MODE_RAIL = 2
	LE_MODE_RAIL_PLACE = 32
	LE_MODE_LIGHT = 3
	LE_MODE_PED = 4
	le_current_mode = LE_MODE_MODEL
	
	
	
	LE_CURSOR_MODE_COLLISION = 0
	LE_CURSOR_MODE_FREE = 1
	le_cursor_mode = LE_CURSOR_MODE_COLLISION
	
	
	le_nodes = [
	]
	le_node_counter = 0
	node_array_size = 0
	
	
	
	
	script SaveLevelData
		SetPreference prefs = splitscreen field = NodeArray Params = {TestValue = (NodeArray)}
	endscript
	
	script LoadLevelData
		
	endscript
	
	script CreateLevelEditor
		if ObjectExists id = leveleditor
			leveleditor::die
		endif
		if ObjectExists id = leveleditor_cursor
			leveleditor_cursor::die
		endif
		
		
		
		
		
		PauseSkaters
		CreateCompositeObject {
			Components =
			[
				{component = camera}
				{component = input controller = 0}
				{component = editorcamera min_height = 0 max_height = 30000 min_radius = 10 max_radius = 6000 SimpleCollision}
				{component = raileditor}
			]
			Params = {Name = leveleditor}
		}
		CreateCompositeObject {
			Components =
			[
				{
					component = model
					UseModelLights
				}
				{
					component = modellightupdate
				}
				{component = motion}
			]
			Params = {Name = leveleditor_cursor}
		}
		leveleditor::Hide
		leveleditor::Suspend
		
		
		
		Change le_active = 1
	endscript
	script SwitchOnLevelEditor position = (0.0,0.0,0.0)
		leveleditor::SetEditingMode Mode = FreeRoaming
		ControllerDebounce X time = 0.2 clear = 1
		
		leveleditor::Unsuspend
		leveleditor::Unhide
		
		Skater::Obj_GetPosition
		
		leveleditor::EditorCam_Initialise position = <pos> cursor_height = 0
		SetActiveCamera id = leveleditor
		
		leveleditor_cursor::Unhide
		
		leveleditor_hud_create
		
		LevelEditor_InitMode
		
		
		GetArraySize NodeArray
		Change node_array_size = <array_size>
		
		SetScreenElementProps {
			id = leveleditor_desc
			text = node_array_size
		}
		
		wait 0.2 seconds
		leveleditor::Obj_SpawnScript LevelEditor_HandleInput Params = {}
	endscript
	
	script ResumeLevelEditor
		leveleditor::Unsuspend
		SetActiveCamera id = leveleditor
	endscript
	
	script LevelEditor_SetCursorModel model_name = "none"
		leveleditor_cursor::Obj_InitModel model = <model_name>
	endscript
	
	
	script LevelEditor_InitMode
		switch le_current_mode
			case LE_MODE_MODEL
				LevelEditor_Model_Init
			case LE_MODE_GEOM
				LevelEditor_Geom_Init
			case LE_MODE_RAIL
				LevelEditor_Rail_Init
			case LE_MODE_LIGHT
				LevelEditor_Light_Init
			case LE_MODE_PED
				LevelEditor_Ped_Init
		endswitch
	endscript
	
	
	script LevelEditor_SwapMode
		switch le_current_mode
			case LE_MODE_MODEL
				LevelEditor_Model_Close
				Change le_current_mode = LE_MODE_GEOM
			case LE_MODE_GEOM
				LevelEditor_Geom_Close
				Change le_current_mode = LE_MODE_RAIL
			case LE_MODE_RAIL
				LevelEditor_Rail_Close
				Change le_current_mode = LE_MODE_LIGHT
			case LE_MODE_LIGHT
				LevelEditor_Light_Close
				Change le_current_mode = LE_MODE_MODEL
			case LE_MODE_PED
				LevelEditor_Ped_CLose
				Change le_current_mode = LE_MODE_MODEL
		endswitch
		LevelEditor_InitMode
	endscript
	
	
	
	script LevelEditor_EveryFrame
		leveleditor::GetCursorPosition
		FormatText TextName = le_pos_text "%i" i = <pos>
		SetScreenElementProps {
			id = leveleditor_cursor_pos
			text = <le_pos_text>
		}
	endscript
	
	
	script LevelEditor_HandleInput
		while
			
			LevelEditor_EveryFrame
			switch le_current_mode
				case LE_MODE_MODEL
					LevelEditor_Model_EveryFrame
				case LE_MODE_GEOM
					LevelEditor_Geom_EveryFrame
				case LE_MODE_RAIL
					LevelEditor_Rail_EveryFrame
				case LE_MODE_LIGHT
					LevelEditor_Light_EveryFrame
				case LE_MODE_PED
					LevelEditor_Ped_EveryFrame
			endswitch
			
			if ControllerPressed Black
				if ControllerPressed White
					LevelEditor_SwapMode
					
					ControllerDebounce Black time = 0.2 clear = 1
					ControllerDebounce White time = 0.2 clear = 1
				else 
                    if ControllerPressed triangle
						break
					endif
				endif
			endif
			
			if ControllerPressed X
				switch le_current_mode
					case LE_MODE_MODEL
						LevelEditor_Model_X
					case LE_MODE_GEOM
						LevelEditor_Geom_X
					case LE_MODE_RAIL
						LevelEditor_Rail_X
					case LE_MODE_LIGHT
						LevelEditor_Light_X
					case LE_MODE_PED
						LevelEditor_Ped_X
				endswitch
			endif
            // ALERT: BAD HACK! 
            // I wasn't able to completely swap the Square/R2 button assignments in the OBS exe, 
            // so we have to change ControllerPressed calls in scripts. Woohoo!
            if (LAUNCHER_SETTING_OBSHACK = 1)
                //printf "Found OBS hack"
                if ControllerPressed Black
                    switch le_current_mode
                        case LE_MODE_MODEL
                            LevelEditor_Model_Square
                        case LE_MODE_GEOM
                            LevelEditor_Geom_Square
                        case LE_MODE_RAIL
                            LevelEditor_Rail_Square
                        case LE_MODE_LIGHT
                            LevelEditor_Light_Square
                        case LE_MODE_PED
                            LevelEditor_Ped_Square
                    endswitch
                endif
            else
                if ControllerPressed Square
                    switch le_current_mode
                        case LE_MODE_MODEL
                            LevelEditor_Model_Square
                        case LE_MODE_GEOM
                            LevelEditor_Geom_Square
                        case LE_MODE_RAIL
                            LevelEditor_Rail_Square
                        case LE_MODE_LIGHT
                            LevelEditor_Light_Square
                        case LE_MODE_PED
                            LevelEditor_Ped_Square
                    endswitch
                endif
            endif
            // END BAD HACK
			if ControllerPressed Circle
				switch le_current_mode
					case LE_MODE_MODEL
						LevelEditor_Model_Circle
					case LE_MODE_GEOM
						LevelEditor_Geom_Circle
					case LE_MODE_RAIL
						LevelEditor_Rail_Circle
					case LE_MODE_LIGHT
						LevelEditor_Light_Circle
					case LE_MODE_PED
						LevelEditor_Ped_Circle
				endswitch
			endif
			if ControllerPressed triangle
				switch le_current_mode
					case LE_MODE_MODEL
						LevelEditor_Model_Triangle
					case LE_MODE_GEOM
						LevelEditor_Geom_Triangle
					case LE_MODE_RAIL
						
					case LE_MODE_LIGHT
						
					case LE_MODE_PED
						
				endswitch
			endif
			
			
			
			if ControllerPressed L1
				if ControllerPressed R1
					switch le_cursor_mode
						case LE_CURSOR_MODE_COLLISION
							Change le_cursor_mode = LE_CURSOR_MODE_FREE
							create_console_message text = "Grid mode"
							
						case LE_CURSOR_MODE_FREE
							Change le_cursor_mode = LE_CURSOR_MODE_COLLISION
							create_console_message text = "Free-roaming mode"
					endswitch
					ControllerDebounce L1 time = 0.2 clear = 1
					ControllerDebounce R1 time = 0.2 clear = 1
				endif
			endif
			
			if (le_cursor_mode = LE_CURSOR_MODE_FREE)
				leveleditor::GetCursorPosition
				if ControllerPressed left
					leveleditor::EditorCam_SetCursorPos position = (<pos> + (50.0,0.0,0.0))
					ControllerDebounce left time = 0.40000001 clear = 1
				endif
				if ControllerPressed Right
					leveleditor::EditorCam_Initialise position = (<pos> - (50.0,0.0,0.0))
					ControllerDebounce Right time = 0.40000001 clear = 1
				endif
				if ControllerPressed Up
					leveleditor::EditorCam_Initialise position = (<pos> + (0.0,0.0,50.0))
					ControllerDebounce Up time = 0.40000001 clear = 1
				endif
				if ControllerPressed Down
					leveleditor::EditorCam_SetCursorPos position = (<pos> - (0.0,0.0,50.0))
					ControllerDebounce Down time = 0.40000001 clear = 1
				endif
				if ControllerPressed R1
					leveleditor::EditorCam_SetCursorPos position = (<pos> + (0.0,50.0,0.0))
					ControllerDebounce R1 time = 0.40000001 clear = 1
					
				endif
				if ControllerPressed L1
					leveleditor::EditorCam_SetCursorPos position = (<pos> - (0.0,50.0,0.0))
					ControllerDebounce L1 time = 0.40000001 clear = 1
					
				endif
			endif
			wait 1 gameframe
		repeat
		SwitchOffLevelEditor
	endscript
	
	
	script SwitchOffLevelEditor
		
		if NOT ObjectExists id = leveleditor
			return
		endif
		if NOT ObjectExists id = leveleditor_cursor
			return
		endif
		
		switch le_current_mode
			case LE_MODE_MODEL
				LevelEditor_Model_Close
			case LE_MODE_GEOM
				LevelEditor_Geom_Close
			case LE_MODE_RAIL
				LevelEditor_Rail_Close
			case LE_MODE_LIGHT
				LevelEditor_Light_Close
			case LE_MODE_PED
				LevelEditor_Ped_CLose
		endswitch
		le_active = 0
		SetActiveCamera id = skatercam0
		UnPauseSkaters
		leveleditor_hud_destroy
		
		
		
		leveleditor::Hide
		leveleditor::Suspend
		leveleditor::die
		leveleditor_cursor::Hide
		leveleditor_cursor::Suspend
		leveleditor_cursor::die
	endscript
	
	
	
	
	
	
	
	
	
	
	
	
