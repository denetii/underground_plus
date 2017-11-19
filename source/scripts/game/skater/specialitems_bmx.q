
	bmx_collision_details = {
		Position = (0.0,0.0,0.0)
		Angles = (0.0,0.0,0.0)
		Name = Bmx_Collision
		Class = GameObject
		Type = Ghost
		CollisionMode = None
		IgnoredLights = [0, 1]
		Model = "none"
		SuspendDistance = 0
		lod_dist1 = 400
		lod_dist2 = 401
		TriggerScript = Bmx_Collision_Script
	}
	Saw_Ghost_details = {
		Position = (0.0,0.0,0.0)
		Angles = (0.0,0.0,0.0)
		Name = Saw_Ghost
		Class = GameObject
		Type = Ghost
		CollisionMode = None
		IgnoredLights = [0, 1]
		Model = "none"
		SuspendDistance = 0
		lod_dist1 = 400
		lod_dist2 = 401
	}
	Saw_Ghost2_details = {
		Position = (0.0,0.0,0.0)
		Angles = (0.0,0.0,0.0)
		Name = Saw_Ghost2
		Class = GameObject
		Type = Ghost
		CollisionMode = None
		IgnoredLights = [0, 1]
		Model = "none"
		SuspendDistance = 0
		lod_dist1 = 400
		lod_dist2 = 401
	}
	script Bmx_Collision_Script
		Obj_ClearExceptions
		Obj_SetInnerRadius 2
		Obj_SetException ex = SkaterInRadius scr = Bmx_Collision_Collide
		while
			Obj_GetSpeed
			if (<speed> = 0)
			else
				if (<speed> < 29.89999962)
					SendFlag FLAG_TRICK_NOW Name = TRG_BMX_Checker
				else
					ClearFlag FLAG_TRICK_NOW Name = TRG_BMX_Checker
				endif
			endif
			wait 3 frames
		repeat
	endscript
	script Bmx_Collision_Collide
		Obj_ClearExceptions
		Obj_SetOuterRadius 5
		Obj_SetException ex = SkaterOutOfRadius scr = Bmx_Collision_Script
		printf "Bail now Bitch"
		Obj_PlayStream Random(
			@rick_Collide01
			@rick_Collide02
			@rick_Collide03
			@rick_Collide04
			@rick_Collide05
			@rick_Collide06
			@rick_Collide07
			@rick_Collide08
		)
		MakeSkaterGoto PedKnockDown
	endscript
