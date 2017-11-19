
	script DrivingAi
		ClearAllWalkingExceptions
		ClearExceptions
		SetEventhandler Ex = Vehicle_BodyCollision Scr = Vehicle_BodyCollision
		SetEventhandler Ex = SkaterCollideBail Scr = DrivingCollisionLost
		SetEventhandler Ex = MadeOtherSkaterBail Scr = MadeOtherSkaterBailCar
		SetException Ex = RunHasEnded Scr = EndOfRun
		SetException Ex = GoalHasEnded Scr = Goal_EndOfRun
		Block
	endscript
	script ToggleUserControlledVehicleMode
		if NOT Skater::Driving
			if InNetGame
				Obj_GetId
				BroadcastEnterVehicle SkaterId = <ObjId> control_type = (<VehicleSetup>.control_type)
			endif
			Skater::BashOff
			Skater::NollieOff
			Skater::PressureOff
			Skater::LandSkaterTricks
			Skater::ResetSwitched
			Skater::ClearTrickQueues
			Skater::DestroyAllSpecialItems
			Skater::SparksOff
			Skater::VibrateOff
			Skater::StopBalanceTrick
			Skater::KillExtraTricks
			Skater::SetExtraTricks NoTricks
			createPlayerVehicle <...>
			Skater::PausePhysics
			Skater::SkaterLoopingSound_TurnOff
			Skater::TakeBoardFromSkater
			Skater::Obj_ShadowOff
			GoalManager_HideAllGoalPeds 1
			Skater::SetDriving
			Debounce X
			Debounce Square
			MakeSkaterGoto DrivingAi
		else
			Skater::GetCameraId
			if NOT GameIsPaused
				<CameraId>::UnPause
			endif
			SetActiveCamera Id = <CameraId>
			PlayerVehicle::Die
			PlayerVehicleCamera::Die
			Skater::UnsetDriving
			Skater::ReturnBoardToSkater
			Skater::Obj_ShadowOn ShadowType = Detailed
			Skater::ResetRigidBodyCollisionRadiusBoost
			GoalManager_HideAllGoalPeds 0
			Change driving_parked_car = 0
		endif
	endscript
	script createPlayerVehicle VehicleSetup = defaultCarSetup
		if GotParam Exitable
			VehicleSetup = (<VehicleSetup> + {Exitable})
		endif
		if GotParam edited_goal
			VehicleSetup = (<VehicleSetup> + {edited_goal})
		endif
		if NOT ObjectExists Id = PlayerVehicle
			CreateCompositeObject {
				components = [
					{
						component = skeleton
						skeletonName = car
					}
					{
						component = vehicle
					}
					{
						component = vehiclesound
					}
					{
						component = sound
					}
					{
						component = input
						player = 0
					}
					{
						component = model
						UseModelLights
					}
				]
				params = {
					name = PlayerVehicle
					<VehicleSetup>
				}
			}
			CreateCompositeObject {
				components = [
					{
						component = cameralookaround
					}
					{
						component = vehiclecamera
						subject = PlayerVehicle
						vehicleCameraSetup
					}
					{
						component = camera
					}
					{
						component = input
						player = 0
					}
				]
				params = {name = PlayerVehicleCamera}
			}
		endif
	endscript
	script NonLocalClientInVehicle
		MangleChecksums A = <SkaterId> B = NonLocalPlayerVehicle
		NonLocalPlayerVehicle = <mangled_id>
		if ObjectExists Id = <NonLocalPlayerVehicle>
			<NonLocalPlayerVehicle>::GetTags
			if NOT (<control_type> = <current_control_type>)
				remove_car_from_non_local_skater SkaterId = <SkaterId>
			endif
		endif
		if NOT ObjectExists Id = <NonLocalPlayerVehicle>
			lock_car_to_non_local_skater SkaterId = <SkaterId> control_type = <control_type>
		endif
		GetVehicleSetup control_type = <control_type>
		if NOT StructureContains Structure = <VehicleSetup> make_skater_visible
			<SkaterId>::Hide
		else
			<SkaterId>::Obj_ShadowOff
			<SkaterId>::SwitchOffAtomic Board
		endif
	endscript
	script NonLocalClientExitVehicle
		remove_car_from_non_local_skater SkaterId = <SkaterId>
		<SkaterId>::UnHide
		<SkaterId>::Obj_ShadowOn ShadowType = Simple
		<SkaterId>::SwitchOnAtomic Board
	endscript
	script lock_car_to_non_local_skater
		MangleChecksums A = <SkaterId> B = NonLocalPlayerVehicle
		NonLocalPlayerVehicle = <mangled_id>
		GetVehicleSetup control_type = <control_type>
		GetCurrentLevel
		VehicleSetupLevel = (<VehicleSetup>.level)
		VehicleSetupAlternateLevel = (<VehicleSetup>.alternate_level)
		if NOT ((<level> = <VehicleSetupLevel>) || (<level> = <VehicleSetupAlternateLevel>))
			return
		endif
		CreateCompositeObject {
			components = [
				{
					component = staticvehicle
				}
				{
					component = skeleton
					skeletonName = car
				}
				{
					component = lockobj
				}
				{
					component = setdisplaymatrix
				}
				{
					component = model
					model = (<VehicleSetup>.model)
					UseModelLights
				}
				{
					component = modellightupdate
				}
			]
			params = {name = <NonLocalPlayerVehicle>}
		}
		<NonLocalPlayerVehicle>::Obj_LockToObject Id = <SkaterId> ((0.0,0.0,0.0) - (<VehicleSetup>.skater_pos))
		<NonLocalPlayerVehicle>::SetTags current_control_type = <control_type>
	endscript
	script remove_car_from_non_local_skater
		MangleChecksums A = <SkaterId> B = NonLocalPlayerVehicle
		NonLocalPlayerVehicle = <mangled_id>
		if ObjectExists Id = <NonLocalPlayerVehicle>
			<NonLocalPlayerVehicle>::Die
		endif
	endscript
	script DrivingCollisionLost
		PlayerVehicle::Vehicle_LostCollision <...>
	endscript
	script GetVehicleSetup
		switch <control_type>
			case JunkerCar
				return VehicleSetup = TransCarSetup
			case RallyCar
				return VehicleSetup = CustomCarSetup
			case ImpalaCar
				return VehicleSetup = ImpalaCarSetup
			case TaxiCar
				return VehicleSetup = TaxiCarSetup
			case PoliceCar
				return VehicleSetup = PoliceCarSetup
			case SecurityCart
				return VehicleSetup = SecurityCartSetup
			case GardnersCart
				return VehicleSetup = GardnersCartSetup
			case ElCaminoCar
				return VehicleSetup = ElCaminoCarSetup
			case Blimp
				return VehicleSetup = BlimpSetup
			case LadaCar
				return VehicleSetup = LadaCarSetup
			case MiniBajaCar
				return VehicleSetup = MiniBajaCarSetup
			case LimoCar
				return VehicleSetup = LimoCarSetup
			case LeafBlower
				return VehicleSetup = LeafBlowerSetup
		endswitch
	endscript
	vehicleCameraSetup = {
		alignment_rate = 3.5
		offset_height = 55
		offset_distance = 240
		angle = 0
	}
	script Vehicle_BodyCollision
		Vibrate Actuator = 1 Percent = (50 + 50 * <Strength>) Duration = (0.1 + 0.1 * <Strength>)
	endscript
	artificial_collision_duration = 3.0
	coll_forward_imp = 150
	coll_sideways_imp = 100
	coll_upwards_imp = 300
	coll_spin_rot = 2
	coll_flip_rot = 3
	vehicle_physics_artificial_collision_duration = 3
	vehicle_physics_netcoll_forward_impulse = 250
	vehicle_physics_netcoll_sideways_impulse = 100
	vehicle_physics_netcoll_upwards_impulse = 300
	vehicle_physics_netcoll_spin_impulse = 2
	vehicle_physics_netcoll_flip_impulse = 3
	TransCarSetup = {
		control_type = JunkerCar
		model = "veh\veh_transam\veh_transam.mdl"
		level = Load_Sk5Ed_gameplay
		alternate_level = 0
		sounds = NJ_nasalracer
		skater_pos = (0.0,0.0,0.0)
		suspension_center_of_mass = -22
		mass = 2943
		moment_of_inertia = (6000000.0,5000000.0,6000000.0)
		body_restitution = 0.30000001
		body_friction = 0.2
		body_wipeout_friction = 0.40000001
		body_spring = 1200
		collision_control = 0.25
		max_steering_angle = 30
		constant_rotational_damping = 2000000
		quadratic_rotational_damping = 0.0001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 1
		in_air_slerp_velocity_cutoff = 350
		colliders = [
			[
				(36.0,28.0,140.0)
				(-36.0,28.0,140.0)
				(36.0,28.0,-44.0)
			]
			[
				(26.0,48.0,58.0)
				(-26.0,48.0,58.0)
				(26.0,48.0,4.0)
			]
		]
		engine = {
			drive_torque = 400
			drag_torque = 800
			upshift_rpm = 5000
			differential_ratio = 5
			reverse_torque_ratio = 1
			gear_ratios = [
				4
				3
				1.5
				0.64999998
				0
			]
		}
		all_wheels = {
			radius = 13
			moment = 3570
			spring_rate = 200
			damping_rate = 28
			static_friction = 4.0
			min_static_grip_velocity = 8
			max_static_grip_velocity = 12
			min_dynamic_grip_velocity = 30
			handbrake_torque = 3000
			brake_torque = 2000
		}
		wheels = [
			{
				max_draw_y_offset = -25.5
				steering = left
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -25.5
				steering = right
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -21
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
			{
				max_draw_y_offset = -21
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
		]
	}
	CustomCarSetup = {
		control_type = RallyCar
		model = "veh\veh_custom\veh_custom.mdl"
		level = Load_NJ
		alternate_level = 0
		sounds = NJ_nasalracer
		skater_pos = (0.0,0.0,0.0)
		suspension_center_of_mass = -22
		mass = 2943
		moment_of_inertia = (6000000.0,5000000.0,6000000.0)
		body_restitution = 0.30000001
		body_friction = 0.2
		body_wipeout_friction = 0.40000001
		body_spring = 1200
		collision_control = 0.25
		max_steering_angle = 30
		constant_rotational_damping = 2000000
		quadratic_rotational_damping = 0.0001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 1
		in_air_slerp_velocity_cutoff = 350
		colliders = [
			[
				(42.0,24.0,134.0)
				(-42.0,24.0,134.0)
				(42.0,24.0,-30.0)
			]
			[
				(22.0,55.0,54.0)
				(-22.0,55.0,54.0)
				(22.0,63.0,-26.0)
			]
		]
		engine = {
			drive_torque = 400
			drag_torque = 800
			upshift_rpm = 5000
			differential_ratio = 5
			reverse_torque_ratio = 1
			gear_ratios = [
				4
				3
				1.5
				0.64999998
				0
			]
		}
		all_wheels = {
			radius = 13
			moment = 3570
			spring_rate = 200
			damping_rate = 28
			static_friction = 4.0
			min_static_grip_velocity = 8
			max_static_grip_velocity = 12
			min_dynamic_grip_velocity = 30
			handbrake_torque = 3000
			brake_torque = 2000
		}
		wheels = [
			{
				max_draw_y_offset = -25.70000076
				steering = left
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -25.70000076
				steering = right
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -25.70000076
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
			{
				max_draw_y_offset = -25.70000076
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
		]
	}
	BlimpSetup = {
		control_type = Blimp
		model = "veh\Veh_Blimp\Veh_Blimp.mdl"
		level = Load_SE
		alternate_level = 0
		sounds = SJ_Blimp
		skater_pos = (0.0,0.0,0.0)
		suspension_center_of_mass = -40
		mass = 800
		moment_of_inertia = (4000000.0,8000000.0,4000000.0)
		body_restitution = 0.2
		body_friction = 0.1
		body_wipeout_friction = 0.40000001
		body_spring = 270
		collision_control = 0.2
		max_steering_angle = 45
		constant_rotational_damping = 0
		quadratic_rotational_damping = 0.00001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 1
		in_air_slerp_velocity_cutoff = 350
		colliders = [
			[
				(28.0,30.0,60.0)
				(-28.0,30.0,60.0)
				(28.0,30.0,-66.0)
			]
			[
				(18.0,45.0,30.0)
				(-18.0,45.0,30.0)
				(18.0,45.0,-30.0)
			]
		]
		engine = {
			drive_torque = 50
			drag_torque = 5
			upshift_rpm = 7500
			differential_ratio = 5
			reverse_torque_ratio = 1.5
			gear_ratios = [
				2.5
				0
			]
		}
		no_handbrake
		all_wheels = {
			radius = 9
			moment = 1000
			spring_rate = 100
			damping_rate = 35
			static_friction = 1.0
			min_static_grip_velocity = 10
			max_static_grip_velocity = 11
			min_dynamic_grip_velocity = 12
			handbrake_torque = 3000
		}
		wheels = [
			{
				max_draw_y_offset = 0
				steering = left
				drive = yes
				brake_torque = 0
				dynamic_friction = 0.80000001
				handbrake_throttle_friction = 0
				handbrake_locked_friction = 0
			}
			{
				max_draw_y_offset = 0
				steering = right
				drive = yes
				brake_torque = 0
				dynamic_friction = 0.80000001
				handbrake_throttle_friction = 0
				handbrake_locked_friction = 0
			}
			{
				max_draw_y_offset = 0
				steering = fixed
				drive = yes
				brake_torque = 500
				dynamic_friction = 0.80000001
				handbrake_throttle_friction = 0
				handbrake_locked_friction = 0
			}
			{
				max_draw_y_offset = 0
				steering = fixed
				drive = yes
				brake_torque = 500
				dynamic_friction = 0.80000001
				handbrake_throttle_friction = 0
				handbrake_locked_friction = 0
			}
		]
	}
	GardnersCartSetup = {
		control_type = GardnersCart
		model = "veh\Veh_SDKart_Gardens\Veh_SDKart_Gardens.mdl"
		level = Load_SD
		alternate_level = 0
		sounds = SD_Cart
		make_skater_visible
		skater_pos = (-10.72999954,1.0,26.18000031)
		skater_anim = Ped_Driver_Turn_Range
		suspension_center_of_mass = -24
		mass = 2943
		moment_of_inertia = (6000000.0,5000000.0,6000000.0)
		body_restitution = 0.30000001
		body_friction = 0.2
		body_wipeout_friction = 0.69999999
		body_spring = 1200
		collision_control = 0.25
		max_steering_angle = 18
		constant_rotational_damping = 2000000
		quadratic_rotational_damping = 0.0001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 0.5
		in_air_slerp_velocity_cutoff = 350
		vert_correction
		colliders = [
			[
				(25.0,25.0,58.0)
				(-25.0,25.0,58.0)
				(25.0,25.0,-60.0)
			]
			[
				(25.0,48.0,56.0)
				(-25.0,48.0,56.0)
				(25.0,48.0,10.0)
			]
		]
		engine = {
			drive_torque = 350
			drag_torque = 300
			upshift_rpm = 5000
			differential_ratio = 5
			reverse_torque_ratio = 1
			gear_ratios = [
				9
				6
				2.5
				0.75
				0
			]
		}
		all_wheels = {
			radius = 9
			moment = 3570
			spring_rate = 200
			damping_rate = 40
			static_friction = 4.0
			min_static_grip_velocity = 8
			max_static_grip_velocity = 20
			min_dynamic_grip_velocity = 30
			handbrake_torque = 3000
		}
		wheels = [
			{
				max_draw_y_offset = -12
				steering = left
				drive = yes
				brake_torque = 2000
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3
				handbrake_locked_friction = 3
			}
			{
				max_draw_y_offset = -12
				steering = right
				drive = yes
				brake_torque = 2000
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3
				handbrake_locked_friction = 3
			}
			{
				max_draw_y_offset = -12
				steering = fixed
				drive = yes
				brake_torque = 1000
				dynamic_friction = 3.5
				handbrake_throttle_friction = 2.0
				handbrake_locked_friction = 2.0
			}
			{
				max_draw_y_offset = -12
				steering = fixed
				drive = yes
				brake_torque = 1000
				dynamic_friction = 3.5
				handbrake_throttle_friction = 2.0
				handbrake_locked_friction = 2.0
			}
		]
	}
	SecurityCartSetup = {
		control_type = SecurityCart
		model = "veh\Veh_SDKart_Security\Veh_SDKart_Security.mdl"
		level = Load_SD
		alternate_level = 0
		sounds = SD_Cart
		make_skater_visible
		skater_pos = (-10.81000042,1.0,26.18000031)
		skater_anim = Ped_Driver_Turn_Range
		suspension_center_of_mass = -24
		mass = 2943
		moment_of_inertia = (6000000.0,5000000.0,6000000.0)
		body_restitution = 0.30000001
		body_friction = 0.2
		body_wipeout_friction = 0.69999999
		body_spring = 1200
		collision_control = 0.25
		max_steering_angle = 18
		constant_rotational_damping = 2000000
		quadratic_rotational_damping = 0.0001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 0.5
		in_air_slerp_velocity_cutoff = 350
		vert_correction
		colliders = [
			[
				(25.0,25.0,58.0)
				(-25.0,25.0,58.0)
				(25.0,25.0,-60.0)
			]
			[
				(25.0,48.0,56.0)
				(-25.0,48.0,56.0)
				(25.0,48.0,10.0)
			]
		]
		engine = {
			drive_torque = 350
			drag_torque = 300
			upshift_rpm = 5000
			differential_ratio = 5
			reverse_torque_ratio = 1
			gear_ratios = [
				9
				6
				2.5
				0.75
				0
			]
		}
		all_wheels = {
			radius = 9
			moment = 3570
			spring_rate = 200
			damping_rate = 40
			static_friction = 4.0
			min_static_grip_velocity = 8
			max_static_grip_velocity = 20
			min_dynamic_grip_velocity = 30
			handbrake_torque = 3000
		}
		wheels = [
			{
				max_draw_y_offset = -12
				steering = left
				drive = yes
				brake_torque = 2000
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3
				handbrake_locked_friction = 3
			}
			{
				max_draw_y_offset = -12
				steering = right
				drive = yes
				brake_torque = 2000
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3
				handbrake_locked_friction = 3
			}
			{
				max_draw_y_offset = -12
				steering = fixed
				drive = yes
				brake_torque = 1000
				dynamic_friction = 3.5
				handbrake_throttle_friction = 2.0
				handbrake_locked_friction = 2.0
			}
			{
				max_draw_y_offset = -12
				steering = fixed
				drive = yes
				brake_torque = 1000
				dynamic_friction = 3.5
				handbrake_throttle_friction = 2.0
				handbrake_locked_friction = 2.0
			}
		]
	}
	LeafBlowerSetup = {
		control_type = LeafBlower
		model = "veh\Veh_LeafBlower\Veh_LeafBlower.mdl"
		level = Load_VC
		alternate_level = 0
		sounds = VC_LeafBlower
		make_skater_visible
		skater_pos = (-0.14,18.0,6.98000002)
		skater_anim = Ped_Driver_Turn_Range
		suspension_center_of_mass = -30
		mass = 800
		moment_of_inertia = (4000000.0,3000000.0,4000000.0)
		body_restitution = 0.2
		body_friction = 0.1
		body_wipeout_friction = 0.40000001
		body_spring = 270
		collision_control = 0.2
		max_steering_angle = 30
		constant_rotational_damping = 500000
		quadratic_rotational_damping = 0.0001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 1
		in_air_slerp_velocity_cutoff = 350
		colliders = [
			[
				(28.0,70.0,40.0)
				(-28.0,70.0,40.0)
				(28.0,70.0,-50.0)
			]
			[
				(28.0,30.0,50.0)
				(-28.0,30.0,50.0)
				(28.0,30.0,-55.0)
			]
		]
		engine = {
			drive_torque = 50
			drag_torque = 50
			upshift_rpm = 7500
			differential_ratio = 5
			reverse_torque_ratio = 1.5
			gear_ratios = [
				2.5
				0
			]
		}
		no_handbrake
		all_wheels = {
			moment = 1000
			spring_rate = 300
			damping_rate = 35
			static_friction = 4.0
			min_static_grip_velocity = 2
			max_static_grip_velocity = 8
			min_dynamic_grip_velocity = 18
			handbrake_torque = 3000
		}
		wheels = [
			{
				radius = 15
				max_draw_y_offset = -25
				steering = left
				drive = yes
				brake_torque = 500
				dynamic_friction = 4.0
				handbrake_throttle_friction = 2.5
				handbrake_locked_friction = 2.5
			}
			{
				radius = 15
				max_draw_y_offset = -25
				steering = right
				drive = yes
				brake_torque = 500
				dynamic_friction = 4.0
				handbrake_throttle_friction = 2.5
				handbrake_locked_friction = 2.5
			}
			{
				radius = 11
				max_draw_y_offset = -5
				steering = fixed
				drive = yes
				brake_torque = 500
				dynamic_friction = 4.0
				handbrake_throttle_friction = 1.5
				handbrake_locked_friction = 1.5
			}
			{
				radius = 11
				max_draw_y_offset = -5
				steering = fixed
				drive = yes
				brake_torque = 500
				dynamic_friction = 4.0
				handbrake_throttle_friction = 1.5
				handbrake_locked_friction = 1.5
			}
		]
	}
	ImpalaCarSetup = {
		control_type = ImpalaCar
		model = "veh\veh_chevy_impala\veh_chevy_impala.mdl"
		level = Load_NY
		alternate_level = 0
		sounds = NY_JunkCar
		skater_pos = (0.0,0.0,0.0)
		suspension_center_of_mass = -20
		mass = 2943
		moment_of_inertia = (6000000.0,5000000.0,6000000.0)
		body_restitution = 0.30000001
		body_friction = 0.2
		body_wipeout_friction = 0.40000001
		body_spring = 1200
		collision_control = 0.25
		max_steering_angle = 30
		constant_rotational_damping = 2000000
		quadratic_rotational_damping = 0.0001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 1
		in_air_slerp_velocity_cutoff = 350
		colliders = [
			[
				(39.5,26.0,126.0)
				(-40.5,26.0,126.0)
				(39.5,26.0,-60.0)
			]
			[
				(31.0,46.0,52.0)
				(-31.0,46.0,52.0)
				(31.0,42.0,-8.0)
			]
		]
		engine = {
			drive_torque = 400
			drag_torque = 800
			upshift_rpm = 5000
			differential_ratio = 5
			reverse_torque_ratio = 1
			gear_ratios = [
				4
				3
				1.5
				0.64999998
				0
			]
		}
		all_wheels = {
			radius = 13
			moment = 3570
			spring_rate = 200
			damping_rate = 28
			static_friction = 3.0
			min_static_grip_velocity = 8
			max_static_grip_velocity = 12
			min_dynamic_grip_velocity = 30
			handbrake_torque = 3000
			brake_torque = 2000
		}
		wheels = [
			{
				max_draw_y_offset = -22.5
				steering = left
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -22.5
				steering = right
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -19.5
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
			{
				max_draw_y_offset = -19.5
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
		]
	}
	PoliceCarSetup = {
		control_type = PoliceCar
		model = "veh\fl\veh_policecar_fl\veh_policecar_fl.mdl"
		level = Load_FL
		alternate_level = 0
		sounds = FL_PoliceCar
		skater_pos = (0.0,0.0,0.0)
		suspension_center_of_mass = -24
		mass = 2943
		moment_of_inertia = (6000000.0,5000000.0,6000000.0)
		body_restitution = 0.30000001
		body_friction = 0.2
		body_wipeout_friction = 0.40000001
		body_spring = 1200
		collision_control = 0.25
		max_steering_angle = 30
		constant_rotational_damping = 2000000
		quadratic_rotational_damping = 0.0001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 1
		in_air_slerp_velocity_cutoff = 350
		colliders = [
			[
				(33.0,25.0,150.0)
				(-33.0,25.0,150.0)
				(33.0,25.0,-65.0)
			]
			[
				(28.0,55.0,62.0)
				(-28.0,55.0,62.0)
				(28.0,55.0,-2.0)
			]
		]
		engine = {
			drive_torque = 400
			drag_torque = 800
			upshift_rpm = 5000
			differential_ratio = 5
			reverse_torque_ratio = 1
			gear_ratios = [
				4
				3
				1.5
				0.64999998
				0
			]
		}
		all_wheels = {
			radius = 13
			moment = 3570
			spring_rate = 200
			damping_rate = 28
			static_friction = 4.0
			min_static_grip_velocity = 8
			max_static_grip_velocity = 12
			min_dynamic_grip_velocity = 30
			handbrake_torque = 3000
			brake_torque = 2000
		}
		wheels = [
			{
				max_draw_y_offset = -25.5
				steering = left
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -25.5
				steering = right
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -20
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
			{
				max_draw_y_offset = -20
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
		]
	}
	ElCaminoCarSetup = {
		control_type = ElCaminoCar
		model = "veh\veh_camino\veh_camino.mdl"
		level = Load_HI
		alternate_level = 0
		sounds = HI_Car
		skater_pos = (0.0,0.0,0.0)
		suspension_center_of_mass = -22
		mass = 2943
		moment_of_inertia = (6000000.0,6000000.0,6000000.0)
		body_restitution = 0.30000001
		body_friction = 0.2
		body_wipeout_friction = 0.40000001
		body_spring = 1200
		collision_control = 0.25
		max_steering_angle = 30
		constant_rotational_damping = 2000000
		quadratic_rotational_damping = 0.0001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 1
		in_air_slerp_velocity_cutoff = 350
		colliders = [
			[
				(36.0,27.0,151.0)
				(-36.0,27.0,151.0)
				(36.0,33.0,-58.0)
			]
			[
				(24.0,53.0,68.0)
				(-24.0,53.0,68.0)
				(24.0,53.0,38.0)
			]
		]
		engine = {
			drive_torque = 400
			drag_torque = 800
			upshift_rpm = 5000
			differential_ratio = 5
			reverse_torque_ratio = 1
			gear_ratios = [
				4
				3
				1.5
				0.64999998
				0
			]
		}
		all_wheels = {
			radius = 13
			moment = 3570
			spring_rate = 200
			damping_rate = 28
			static_friction = 4.0
			min_static_grip_velocity = 8
			max_static_grip_velocity = 12
			min_dynamic_grip_velocity = 30
			handbrake_torque = 3000
			brake_torque = 2000
		}
		wheels = [
			{
				max_draw_y_offset = -24.5
				steering = left
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -24.5
				steering = right
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -17
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
			{
				max_draw_y_offset = -17
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
		]
	}
	LimoCarSetup = {
		control_type = LimoCar
		model = "veh\veh_limo\veh_limo.mdl"
		level = Load_VC
		alternate_level = 0
		sounds = VC_Limo
		skater_pos = (0.0,0.0,0.0)
		suspension_center_of_mass = -15
		mass = 2943
		moment_of_inertia = (6000000.0,20000000.0,6000000.0)
		body_restitution = 0.30000001
		body_friction = 0.2
		body_wipeout_friction = 0.40000001
		body_spring = 1200
		collision_control = 0.25
		max_steering_angle = 30
		constant_rotational_damping = 2000000
		quadratic_rotational_damping = 0.0001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 1
		in_air_slerp_velocity_cutoff = 350
		colliders = [
			[
				(39.5,25.0,212.0)
				(-39.5,25.0,212.0)
				(39.5,25.0,-85.0)
			]
			[
				(27.0,64.0,115.0)
				(-27.0,64.0,115.0)
				(27.0,64.0,-28.0)
			]
		]
		engine = {
			drive_torque = 400
			drag_torque = 800
			upshift_rpm = 5000
			differential_ratio = 5
			reverse_torque_ratio = 1
			gear_ratios = [
				4
				3
				1.5
				0.64999998
				0
			]
		}
		all_wheels = {
			radius = 13
			moment = 3570
			spring_rate = 200
			damping_rate = 28
			static_friction = 2.0
			min_static_grip_velocity = 8
			max_static_grip_velocity = 12
			min_dynamic_grip_velocity = 30
			handbrake_torque = 3000
			brake_torque = 2000
		}
		wheels = [
			{
				max_draw_y_offset = -25.70000076
				steering = left
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -25.70000076
				steering = right
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -26
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
			{
				max_draw_y_offset = -26
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
		]
	}
	MiniBajaCarSetup = {
		control_type = MiniBajaCar
		model = "veh\veh_minibaja\veh_minibaja.mdl"
		level = Load_SE
		alternate_level = Load_Sk5Ed_gameplay
		sounds = SE_ATV
		make_skater_visible
		skater_pos = (-0.64999998,-2.0,4.07000017)
		skater_anim = Ped_Baha_Drive
		suspension_center_of_mass = -21
		mass = 2943
		moment_of_inertia = (6000000.0,5000000.0,6000000.0)
		body_restitution = 0.60000002
		body_friction = 0.2
		body_wipeout_friction = 0.69999999
		body_spring = 1200
		collision_control = 0.25
		max_steering_angle = 25
		constant_rotational_damping = 2000000
		quadratic_rotational_damping = 0.0001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 0.5
		in_air_slerp_velocity_cutoff = 350
		vert_correction
		colliders = [
			[
				(37.0,30.0,41.0)
				(-37.0,30.0,41.0)
				(37.0,30.0,-36.0)
			]
			[
				(12.0,64.0,16.0)
				(-12.0,64.0,16.0)
				(12.0,64.0,-28.0)
			]
		]
		engine = {
			drive_torque = 550
			drag_torque = 450
			upshift_rpm = 5000
			differential_ratio = 5
			reverse_torque_ratio = 1
			gear_ratios = [
				9
				6
				2.5
				0.75
				0
			]
		}
		all_wheels = {
			radius = 14
			moment = 3570
			spring_rate = 200
			damping_rate = 16
			static_friction = 4.0
			min_static_grip_velocity = 8
			max_static_grip_velocity = 20
			min_dynamic_grip_velocity = 30
			handbrake_torque = 3000
		}
		wheels = [
			{
				max_draw_y_offset = -20
				steering = left
				drive = yes
				brake_torque = 2000
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3
				handbrake_locked_friction = 3
			}
			{
				max_draw_y_offset = -20
				steering = right
				drive = yes
				brake_torque = 2000
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3
				handbrake_locked_friction = 3
			}
			{
				max_draw_y_offset = -20
				steering = fixed
				drive = yes
				brake_torque = 1000
				dynamic_friction = 3.5
				handbrake_throttle_friction = 1.0
				handbrake_locked_friction = 1.0
			}
			{
				max_draw_y_offset = -20
				steering = fixed
				drive = yes
				brake_torque = 1000
				dynamic_friction = 3.5
				handbrake_throttle_friction = 1.0
				handbrake_locked_friction = 1.0
			}
		]
	}
	LadaCarSetup = {
		control_type = LadaCar
		model = "veh\veh_lada\veh_lada.mdl"
		level = Load_RU
		alternate_level = 0
		sounds = RU_ForeignCar
		skater_pos = (0.0,0.0,0.0)
		suspension_center_of_mass = -22
		mass = 2943
		moment_of_inertia = (6000000.0,5000000.0,6000000.0)
		body_restitution = 0.30000001
		body_friction = 0.2
		body_wipeout_friction = 0.40000001
		body_spring = 1200
		collision_control = 0.25
		max_steering_angle = 30
		constant_rotational_damping = 2000000
		quadratic_rotational_damping = 0.0001
		in_air_slerp_strength = 5
		in_air_slerp_time_delay = 1
		in_air_slerp_velocity_cutoff = 350
		colliders = [
			[
				(29.0,30.0,118.0)
				(-29.0,30.0,118.0)
				(29.0,30.0,-44.0)
			]
			[
				(24.0,56.0,65.0)
				(-24.0,56.0,65.0)
				(24.0,56.0,0.0)
			]
		]
		engine = {
			drive_torque = 400
			drag_torque = 800
			upshift_rpm = 5000
			differential_ratio = 5
			reverse_torque_ratio = 1
			gear_ratios = [
				4
				3
				1.5
				0.64999998
				0
			]
		}
		all_wheels = {
			radius = 11
			moment = 3570
			spring_rate = 200
			damping_rate = 28
			static_friction = 4.0
			min_static_grip_velocity = 8
			max_static_grip_velocity = 12
			min_dynamic_grip_velocity = 30
			handbrake_torque = 3000
			brake_torque = 2000
		}
		wheels = [
			{
				max_draw_y_offset = -21
				steering = left
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -21
				steering = right
				drive = yes
				dynamic_friction = 2.79999995
				handbrake_throttle_friction = 3.5
				handbrake_locked_friction = 4.0
			}
			{
				max_draw_y_offset = -16
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
			{
				max_draw_y_offset = -16
				steering = fixed
				drive = yes
				dynamic_friction = 3.5
				handbrake_throttle_friction = 3.0
				handbrake_locked_friction = 1.0
			}
		]
	}
	defaultCarSetup = CustomCarSetup
