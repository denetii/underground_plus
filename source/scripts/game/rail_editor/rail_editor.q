
	script CreateRailEditor
		CreateCompositeObject {
			Components =
			[
				{component = camera}
				{component = input controller = 0}
				{component = editorcamera min_height = 20 min_radius = 10 max_radius = 1000 SimpleCollision}
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
			if (<num_points> < 2)
				raileditor::DeleteRail rail_id = <rail_id>
			endif
		endif
		raileditor::Hide
		raileditor::Suspend
		SetActiveCamera id = parked_cam
	endscript
