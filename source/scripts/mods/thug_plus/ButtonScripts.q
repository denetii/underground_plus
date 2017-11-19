
	select_shift = 1
	memcard_screenshots = 0
	skater_cam_0_mode = 2
	skater_cam_1_mode = 2
	ksk_mode900 = 0
	ksk_slow_mo = 0
	
	script UserSelectSelect
		
		if (ksk_mode900 = 1)
			ToggleViewMode
		else
			if NOT isngc
				if ObjectExists id = skatercam0
					switch skater_cam_0_mode
						case 1
							change skater_cam_0_mode = 2
						case 2
							change skater_cam_0_mode = 3
						case 3
							change skater_cam_0_mode = 4
						case 4
							change skater_cam_0_mode = 5
						case 5
							change skater_cam_0_mode = 6
						case 6
							change skater_cam_0_mode = 7
						case 7
							change skater_cam_0_mode = 8
						case 8
							change skater_cam_0_mode = 9
						case 9
							change skater_cam_0_mode = 1
					endswitch
					skatercam0::sc_setmode mode = skater_cam_0_mode
				endif
			endif
		endif
	endscript
	script UserSelectSelect2
		if NOT isngc
			if ObjectExists id = skatercam1
				switch skater_cam_1_mode
					case 1
						change skater_cam_1_mode = 2
					case 2
						change skater_cam_1_mode = 3
					case 3
						change skater_cam_1_mode = 4
					case 4
						change skater_cam_1_mode = 1
					case 5
						change skater_cam_0_mode = 1
				endswitch
				skatercam1::sc_setmode mode = skater_cam_1_mode
			endif
		endif
	endscript
	view_mode = 0
	render_mode = 0
	wireframe_mode = 0
	drop_in_car = 0
	drop_in_car_setup = MiniBajaCarSetup
	script UserSelectTriangle
		
		if ObjectExists id = skatercam0
			switch skater_cam_0_mode
				case 0
					change skater_cam_0_mode = 1
				case 1
					change skater_cam_0_mode = 2
				case 2
					change skater_cam_0_mode = 3
				case 3
					change skater_cam_0_mode = 4
				case 4
					change skater_cam_0_mode = 5
				case 5
					change skater_cam_0_mode = 6
				case 6
					change skater_cam_0_mode = 7
				case 7
					change skater_cam_0_mode = 8
				case 8
					change skater_cam_0_mode = 9
				case 9
					change skater_cam_0_mode = 0
			endswitch
			skatercam0::sc_setmode mode = skater_cam_0_mode
		endif
	endscript
	
	script Ksk_ShowPos
		GetSkaterPosition
		FormatText TextName = MessageText "x: %s y: %i z: %j" s = <x> i = <y> j = <z>
		create_console_message text = <MessageText>
	endscript
	
	script UserSelectSquare
		
		if ControllerPressed Black
			Skater::SkipToCustomRestart
		else
			
			
			change viewer_rotation_angle = 0
			switch Viewer_move_mode
				case 0
					change Viewer_move_mode = 1
					SetMovementVelocity 400
					SetRotateVelocity 25
					create_panel_message id = viewermovemode text = "Med cam" pos = (320.0,50.0)
					
				case 1
					change Viewer_move_mode = 2
					SetMovementVelocity 800
					SetRotateVelocity 50
					create_panel_message id = viewermovemode text = "Semi-fast cam" pos = (320.0,50.0)
					
				case 2
					change Viewer_move_mode = 3
					SetMovementVelocity 6000
					SetRotateVelocity 300
					create_panel_message id = viewermovemode text = "Fast cam" pos = (320.0,50.0)
					
				case 3
					change Viewer_move_mode = 4
					SetMovementVelocity 100
					SetRotateVelocity 10
					create_panel_message id = viewermovemode text = "Super Slow cam" pos = (320.0,50.0)
				case 4
					change Viewer_move_mode = 0
					SetMovementVelocity 1000
					SetRotateVelocity 0
					create_panel_message id = viewermovemode text = "No Rotation" pos = (320.0,50.0)
					
			endswitch
		endif
	endscript
	script UserSelectCircle
		
		if ControllerPressed Black
			Skater::SetCustomRestart Set
		else
			
			if NOT NotCD
				if (render_mode)
					switch wireframe_mode
						case 0
							change wireframe_mode = 1
						case 1
							change wireframe_mode = 2
						case 2
							change wireframe_mode = 3
						case 3
							change wireframe_mode = 4
						case 4
							change wireframe_mode = 5
						case 5
							change wireframe_mode = 6
						case 6
							change wireframe_mode = 0
					endswitch
					setwireframemode mode = wireframe_mode
					show_wireframe_mode
				else
					if Skater::Driving
						ToggleUserControlledVehicleMode
					endif
					
					if (drop_in_car = 0)
						Skater::PlaceBeforeCamera
						Restore_skater_camera
						change view_mode = 0
						ToggleViewMode
						ToggleViewMode
						ToggleViewMode
					else
						MakeSkaterGoto Switch_OnGroundAI Params = {NewScript = TransAm VehicleSetup = drop_in_car_setup edited_goal}
						SetActiveCamera id = viewer_cam
						PlayerVehicle::Vehicle_PlaceBeforeCamera
						change view_mode = 0
						ToggleViewMode
						ToggleViewMode
						ToggleViewMode
						SetActiveCamera id = PlayerVehicleCamera
						Skater::PausePhysics
					endif
				endif
			endif
		endif
	endscript
	
	script UserSelectStart
		
		switch ksk_slow_mo
			
			case 0
				change ksk_slow_mo = 1
				SetSlomo 0.60000002
				pulse_blur Start = 0 End = 120 time = 10
			case 1
				change ksk_slow_mo = 2
				pulse_blur Start = 120 End = 200 time = 20
				SetSlomo 0.40000001
			case 2
				change ksk_slow_mo = 3
				pulse_blur Start = 0 End = 50 time = 20
				SetSlomo 0.2
			case 3
				change ksk_slow_mo = 4
				pulse_blur Start = 0 End = 50 time = 20
				SetSlomo 0.80000001
			case 4
				change ksk_slow_mo = 0
				kill_blur
				SetSlomo 1
		endswitch
		
		
	endscript
	script ToggleViewMode
		switch view_mode
			case 0
				
				change view_mode = 1
			case 1
				
				change view_mode = 2
			case 2
				change view_mode = 0
		endswitch
		SetViewMode view_mode
	endscript
	script ToggleMode900
		if (select_shift = 0)
			change select_shift = 1
		else
			change select_shift = 0
		endif
	endscript
	script UserSelectX
		if ControllerPressed Black
			CreateLevelEditor
			SwitchOnLevelEditor
		else
			change viewer_rotation_angle = 0
			ToggleViewMode
		endif
	endscript
	viewer_rotation_angle = 0
	script UserViewerX
		
	endscript
	script UserViewerSquare
		
	endscript
	Viewer_move_mode = 0
	script UserViewerCircle
		
	endscript
	script UserViewerTriangle
		
	endscript
	script show_wireframe_mode
		switch wireframe_mode
			case 0
				wireframe_message text = "Wireframe : Face Flags"
			case 1
				wireframe_message text = "Wireframe : Poly Density"
			case 2
				wireframe_message text = "Wireframe : Low Poly Highlight"
			case 3
				wireframe_message text = "Wireframe : Unique object colors"
			case 4
				wireframe_message text = "Wireframe : Renderable Unique MESH colors"
			case 5
				wireframe_message text = "Wireframe : Renderable MESH vertex density"
			case 6
				wireframe_message text = "Wireframe : Occlusion Map"
		endswitch
	endscript
	script wireframe_message text = "wireframe"
		create_panel_message text = <text> id = wireframe_mess rgba = [200 128 128 128] pos = (20.0,340.0) just = [left center] scale = 5 style = wireframe_style
	endscript
	script wireframe_style
		DoMorph time = 0 scale = (1.0,1.0)
		DoMorph time = 3 scale = (1.0,1.0)
		DoMorph time = 1 alpha = 0
		die
	endscript
	
	
	
	
	
	
	
	
	
