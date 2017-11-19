
	
	script CreateRailEditor
		CreateCompositeObject {
			Components =
			[
				{component = camera}
				{component = input controller = 0}
				{component = editorcamera min_height = 0 min_radius = 5 max_radius = 5000 SimpleCollision}
				{component = raileditor}
			]
			Params = {Name = raileditor permanent}
		}
		raileditor::Hide
		raileditor::Suspend
	endscript
	script SwitchOnRailEditor
		raileditor::SetEditingMode Mode = FreeRoaming
		Debounce X time = 0.2 clear = 1
		raileditor::Unsuspend
		raileditor::Unhide
		GetParkEditorCursorPos
		raileditor::EditorCam_Initialise position = <pos> cursor_height = 20
		SetActiveCamera id = raileditor
	endscript
	script SwitchOffRailEditor
		if raileditor::GetEditedRailInfo CurrentRail
			if (<num_points> < 1)
				raileditor::DeleteRail rail_id = <rail_id>
			endif
		endif
		raileditor::Hide
		raileditor::Suspend
		SetActiveCamera id = parked_cam
	endscript
	
	
	
	
	
	
	
	
