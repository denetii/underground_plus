
	select_shift = 1
	memcard_screenshots = 0
	skater_cam_0_mode = 2
	skater_cam_1_mode = 2
	script UserSelectSelect
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
						change skater_cam_0_mode = 1
				endswitch
				skatercam0::sc_setmode mode = skater_cam_0_mode
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
		if NotCD
			switch render_mode
				case 0
					change render_mode = 1
					show_wireframe_mode
				case 1
					change render_mode = 2
					show_wireframe_mode
				case 2
					change render_mode = 0
			endswitch
			setRenderMode mode = render_mode
		endif
	endscript
	script UserSelectSquare
		if NotCD
			ScreenShot
		endif
	endscript
	script UserSelectCircle
		if NotCD
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
				UnpauseSkaters 0
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
	endscript
	script UserSelectStart
		if NotCD
			change render_mode = 0
			setRenderMode mode = render_mode
			TogglePass pass = 0
		endif
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
	script UserSelectX
		change viewer_rotation_angle = 0
		ToggleViewMode
	endscript
	viewer_rotation_angle = 0
	script UserViewerX
		if (viewer_rotation_angle = 0)
			change viewer_rotation_angle = 1
			CenterCamera scale = 0.5 y = -45
		else
			if (viewer_rotation_angle = 1)
				CenterCamera scale = 0.5 y = -135
				change viewer_rotation_angle = 2
			else
				if (viewer_rotation_angle = 2)
					change viewer_rotation_angle = 3
					CenterCamera scale = 0.5 y = -225
				else
					if (viewer_rotation_angle = 3)
						change viewer_rotation_angle = 0
						CenterCamera scale = 0.5 y = -315
					endif
				endif
			endif
		endif
	endscript
	script UserViewerSquare
		if (viewer_rotation_angle = 0)
			change viewer_rotation_angle = 1
			CenterCamera x = -10 y = -90 scale = 0.69999999
		else
			if (viewer_rotation_angle = 1)
				CenterCamera x = -10 y = -180 scale = 0.69999999
				change viewer_rotation_angle = 2
			else
				if (viewer_rotation_angle = 2)
					change viewer_rotation_angle = 3
					CenterCamera x = -10 y = -270 scale = 0.69999999
				else
					if (viewer_rotation_angle = 3)
						change viewer_rotation_angle = 0
						CenterCamera x = -10 y = 0 scale = 0.69999999
					endif
				endif
			endif
		endif
	endscript
	Viewer_move_mode = 0
	script UserViewerCircle
		change viewer_rotation_angle = 0
		switch Viewer_move_mode
			case 0
				change Viewer_move_mode = 1
				SetMovementVelocity 400
				SetRotateVelocity 120
				create_panel_message id = viewermovemode text = "Med cam" pos = (320.0,50.0)
			case 1
				change Viewer_move_mode = 2
				SetMovementVelocity 6000
				SetRotateVelocity 300
				create_panel_message id = viewermovemode text = "Fast cam" pos = (320.0,50.0)
			case 2
				change Viewer_move_mode = 0
				SetMovementVelocity 100
				SetRotateVelocity 50
				create_panel_message id = viewermovemode text = "Super Slow cam" pos = (320.0,50.0)
		endswitch
	endscript
	script UserViewerTriangle
		change viewer_rotation_angle = 0
		CenterCamera x = -90 y = 0 scale = 0.69999999
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
