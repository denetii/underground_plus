
	
	
	
	
	
	selected_camera = 6
	selected_camera_range = 0
	le_camera_count = 0
	
	le_cameras = [
		{Name = "fancy2"}
		{Name = "standard"}
		{Name = "near"}
		{Name = "standard ltg"}
		{Name = "dynamic"}
		{Name = "stationary"}
		{Name = "static"}
		{Name = "top view"}
		{Name = "first person"}
	]
	le_cameras_range = [
		{Name = "Standard" inside = 75 outside = 85 scale = 1.0}
		{Name = "Far" inside = 85 outside = 95 scale = 1.10000002}
		{Name = "Farther" inside = 125 outside = 135 scale = 1.79999995}
		{Name = "Farthest" inside = 500 outside = 510 scale = 5.5}
	]
	
	script LevelEditor_Light_Init
		leveleditor_cursor::die
		leveleditor::GetCursorPosition
		
		cursor_components = [
			{component = model model = "UndergroundPlus\CameraTest\CameraTest.mdl" UseModelLights}
			{component = modellightupdate}
			{component = motion}
		]
		CreateCompositeObject {
			Components = <cursor_components>
			Params = {Name = leveleditor_cursor type = <type> Pos = <Pos>}
		}
		
		
		SetScreenElementProps {id = leveleditor_piece_label text = "Camera:"}
		SetScreenElementProps {id = leveleditor_desc_label text = "Range:"}
		GetElement le_cameras Index = selected_camera
		SetScreenElementProps {
			id = leveleditor_piece
			text = (<Element>.Name)
		}
		SetScreenElementProps {
			id = leveleditor_menu_title
			text = "Level Editor - Place Cameras"
		}
		GetElement le_cameras_range Index = selected_camera_range
		SetScreenElementProps {
			id = leveleditor_desc
			text = (<Element>.Name)
		}
		change le_camera_count = 0
		while
			MangleChecksums a = leveleditor_camera_icon_ b = (le_camera_count)
			if ObjectExists id = <mangled_id>
				<mangled_id>::unhide
				change le_camera_count = (le_camera_count + 1)
			else
				break
			endif
		repeat
	endscript
	
	script LevelEditor_Light_Close
		
		leveleditor_cursor::hide
		change le_camera_count = 0
		
		while
			MangleChecksums a = leveleditor_camera_icon_ b = (le_camera_count)
			if ObjectExists id = <mangled_id>
				<mangled_id>::hide
				change le_camera_count = (le_camera_count + 1)
			else
				break
			endif
		repeat
	endscript
	
	script LevelEditor_Light_EveryFrame
		leveleditor::GetCursorPosition
		leveleditor_cursor::Obj_SetPosition position = <Pos>
	endscript
	
	
	
	
	
	script LevelEditor_Light_PlaceLight
		if ObjectExists id = leveleditor_custom_camera_proxim
			leveleditor_custom_camera_proxim::die
		endif
		if ObjectExists id = leveleditor_custom_camera
			leveleditor_custom_camera::die
		endif
		
		leveleditor::GetCursorPosition
		
		MangleChecksums a = leveleditor_proxim_ b = (le_camera_count)
		le_cam_name_prox = <mangled_id>
		
		CreateCompositeObject {
			Components = [
				{component = skaterproximity}
			]
			Params = {Name = <le_cam_name_prox> Pos = <Pos>}
		}
		
		
		MangleChecksums a = leveleditor_placed_camera_ b = (le_camera_count)
		le_cam_name = <mangled_id>
		CreateCompositeObject {
			Components = [
				{component = cameralookaround}
				{component = skatercamera}
				{component = walkcamera}
				{component = camera}
				{component = input player = 0}
			]
			Params = {
				Name = <le_cam_name>
				Pos = <Pos>
				CameraTarget = Skater
			}
		}
		<le_cam_name>::Obj_SetPosition position = <Pos>
		
		RunScriptOnObject LevelEditor_Cam_SetupCamera id = <le_cam_name_prox> Params = {
			prox_name = <le_cam_name_prox>
			cam_name = <le_cam_name>
			camera_angle = (selected_camera)
		}
		MangleChecksums a = leveleditor_camera_icon_ b = (le_camera_count)
		CreateCompositeObject {
			Components = [
				{component = model model = "UndergroundPlus\CameraTest\CameraTest.mdl" UseModelLights}
				{component = modellightupdate}
			]
			Params = {Name = <mangled_id> type = <type> Pos = <Pos>}
		}
		GetElement le_cameras_range Index = selected_camera_range
		<mangled_id>::Obj_ApplyScaling X = (<Element>.scale) y = (<Element>.scale) z = (<Element>.scale)
		Ksk_DebugValue value_name = "cam_count" value_value = le_camera_count
		change le_camera_count = (le_camera_count + 1)
	endscript
	
	script LevelEditor_Cam_SetupCamera
		ClearExceptions
		
		GetElement le_cameras_range Index = selected_camera_range
		
		Obj_SetInnerRadius (<Element>.inside)
		Obj_SetOuterRadius (<Element>.outside)
		
		SetException Ex = SkaterInRadius scr = ksk_switchtocam Params = {<...>}
		
	endscript
	
	script ksk_switchtocam
		
		<prox_name>::Obj_ClearException SkaterInRadius
		<prox_name>::Obj_SetException Ex = SkaterOutOfRadius scr = ksk_restorecam Params = {<...>}
		SetSlomo 0.5
		
		Ksk_DebugValue value_name = "ksk camera test" value_value = <camera_angle>
		
		<prox_name>::Obj_GetPosition
		<cam_name>::Obj_SetPosition position = <Pos>
		wait 1 gameframe
		<cam_name>::sc_setmode mode = <camera_angle>
		SetActiveCamera id = <cam_name> viewport = 0
		wait 1 gameframe
	endscript
	
	script ksk_restorecam
		
		<prox_name>::Obj_ClearException SkaterOutOfRadius
		<prox_name>::Obj_SetException Ex = SkaterInRadius scr = ksk_switchtocam Params = {<...>}
		
		SetSlomo 1.0
		SetActiveCamera id = skatercam0 viewport = 0
		
		skatercam0::sc_setmode mode = skater_cam_0_mode
	endscript
	
	
	
	
	script LevelEditor_Light_X
		LevelEditor_Light_PlaceLight
		ControllerDebounce X time = 0.89999998 clear = 1
	endscript
	
	script LevelEditor_Light_Square
		increment_camera_id = (selected_camera + 1)
		GetArraySize le_cameras
		if (<increment_camera_id> = <array_size>)
			change selected_camera = 0
		else
			if (<increment_camera_id> < 1)
				change selected_camera = 0
			else
				change selected_camera = <increment_camera_id>
			endif
		endif
		GetElement le_cameras Index = selected_camera
		SetScreenElementProps {
			id = leveleditor_piece
			text = (<Element>.Name)
		}
		ControllerDebounce Square time = 0.2 clear = 1
	endscript
	
	script LevelEditor_Light_Circle
		increment_camera_id = (selected_camera_range + 1)
		GetArraySize le_cameras_range
		if (<increment_camera_id> = <array_size>)
			change selected_camera_range = 0
		else
			if (<increment_camera_id> < 1)
				change selected_camera_range = 0
			else
				change selected_camera_range = <increment_camera_id>
			endif
		endif
		GetElement le_cameras_range Index = selected_camera_range
		SetScreenElementProps {
			id = leveleditor_desc
			text = (<Element>.Name)
		}
		leveleditor_cursor::Obj_ApplyScaling X = (<Element>.scale) y = (<Element>.scale) z = (<Element>.scale)
		ControllerDebounce Circle time = 0.1 clear = 1
	endscript
	
	
	
	
	
	
	
	
	
	
	
	
	
