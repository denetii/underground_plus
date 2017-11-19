	script InitSkaterParticles
		Obj_GetId
		MangleChecksums a = skater_blood_system b = <objId>
		MangleChecksums a = <mangled_id> b = Bone_Head
		if NOT ParticleExists <mangled_id>
			CreateParticleSystem params = {objId = <objId> bone = Bone_Head name = <mangled_id>} name = <mangled_id> max = 25 emitscript = skater_blood_emit updatescript = skater_blood_update texture = particle_test02 blendmode = blend perm = 1
		endif
		Obj_GetId
		MangleChecksums a = skater_sparks_system b = <objId>
		MangleChecksums a = <mangled_id> b = Bone_Board_Tail
		if NOT ParticleExists <mangled_id>
			CreateParticleSystem params = {objId = <objId> bone = Bone_Board_Tail name = <mangled_id>} name = <mangled_id> max = 40 emitscript = skater_sparks_emit updatescript = skater_sparks_update blendmode = blend type = GlowRibbontrail history = 2 perm = 1
		endif
		Obj_GetId
		MangleChecksums a = skatersplash b = <objId>
		if NOT ParticleExists name = <mangled_id>
			if InMultiPlayerGame
				CreateParticleSystem params = {objId = <objId> bone = Bone_Pelvis name = <mangled_id>} name = <mangled_id> max = 30 emitscript = emit_skatersplash blendmode = blend type = Glow perm = 1 segments = 5
			else
				CreateParticleSystem params = {objId = <objId> bone = Bone_Pelvis name = <mangled_id>} name = <mangled_id> max = 80 emitscript = emit_skatersplash blendmode = blend type = Glow perm = 1 segments = 5
			endif
			Skatersplashoff
		endif
	endscript
	script DestroySkaterParticles
		Obj_GetId
		MangleChecksums a = skater_blood_system b = <objId>
		MangleChecksums a = <mangled_id> b = Bone_Head
		DestroyParticleSystem name = <mangled_id>
		Obj_GetId
		MangleChecksums a = skater_sparks_system b = <objId>
		MangleChecksums a = <mangled_id> b = Bone_Board_Tail
		DestroyParticleSystem name = <mangled_id>
		Obj_GetId
		MangleChecksums a = skatersplash b = <objId>
		DestroyParticleSystem name = <mangled_id>
	endscript
	script ResetSkaterParticleSystems
		CleanUp_SpecialTrickParticles
		BloodParticlesOff
		Skatersplashoff
		SparksOff
		Obj_GetId
		MangleChecksums a = skater_blood_system b = <objId>
		MangleChecksums a = <mangled_id> b = Bone_Head
		SetScript name = <mangled_id> emitscript = skater_blood_emit
		Obj_GetId
		MangleChecksums a = skater_sparks_system b = <objId>
		MangleChecksums a = <mangled_id> b = Bone_Board_Tail
		SetScript name = <mangled_id> emitscript = skater_sparks_emit updatescript = skater_sparks_update
		Obj_GetId
		MangleChecksums a = skatersplash b = <objId>
		SetScript name = <mangled_id> emitscript = emit_skatersplash
	endscript
	script skater_blood_emit
		setlife min = 0.25 max = 1
		setanglespread spread = 0.1
		setspeedrange min = 4 max = 8
		setforce force = (0.0,-0.5,0.0)
		setparticlesize sw = 2 sh = 2 ew = 2 eh = 2
		setcolor corner = 0 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
		setcolor corner = 1 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
		setcolor corner = 2 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
		setcolor corner = 3 sr = 100 sg = 0 sb = 0 sa = 255 er = 80 eg = 0 eb = 0 ea = 0
		while
			if ShouldEmitParticles name = <name>
				emit num = 1
			endif
			wait 1 gameframe
		repeat
	endscript
	script skater_blood_emit_super
		setlife min = 0.25 max = 1
		setanglespread spread = 0.30000001
		setspeedrange min = 4 max = 10
		setforce force = (0.0,-0.5,0.0)
		setparticlesize sw = 2 sh = 2 ew = 6 eh = 6
		setcolor corner = 0 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
		setcolor corner = 1 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
		setcolor corner = 2 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
		setcolor corner = 3 sr = 50 sg = 0 sb = 0 sa = 255 er = 50 eg = 0 eb = 0 ea = 0
		while
			if ShouldEmitParticles name = <name>
				emit num = 1
			endif
			wait 1 gameframe
		repeat
	endscript
	script skater_sparks_emit
		setlife min = 0.25 max = 0.30000001
		setanglespread spread = 0.25
		setspeedrange min = 4 max = 8
		setforce force = (0.0,-0.30000001,0.0)
		setparticlesize sw = 1.25 sh = 1.25 ew = 0.75 eh = 0.75
		setcolor corner = 0 sr = 255 sg = 255 sb = 255 sa = 255 ma = 255 er = 255 eg = 255 eb = 255 ea = 0
		setcolor corner = 1 sr = 255 sg = 255 sb = 64 sa = 128 ma = 128 er = 255 eg = 64 eb = 64 ea = 0
		setcolor corner = 2 sr = 255 sg = 64 sb = 64 sa = 0 ma = 0 er = 255 eg = 64 eb = 64 ea = 0
		setcolor corner = 3 sr = 255 sg = 255 sb = 64 sa = 80 ma = 80 er = 255 eg = 128 eb = 64 ea = 0
		setcolor corner = 4 sr = 255 sg = 255 sb = 64 sa = 64 ma = 64 er = 255 eg = 128 eb = 64 ea = 0
		setcolor corner = 5 sr = 255 sg = 255 sb = 64 sa = 0 ma = 0 er = 255 eg = 128 eb = 64 ea = 0
		while
			if ShouldEmitParticles name = <name>
				emit num = RandomRange(1.0,2.0)
			endif
			wait 1 gameframe
		repeat
	endscript
	script skater_elec_sparks_emit
		setlife min = 0.25 max = 0.30000001
		setanglespread spread = 0.25
		setspeedrange min = 4 max = 8
		setforce force = (0.0,-0.30000001,0.0)
		setparticlesize sw = 1.25 sh = 1.25 ew = 0.75 eh = 0.75
		setcolor corner = 0 sr = 255 sg = 255 sb = 255 sa = 255 ma = 255 er = 255 eg = 255 eb = 255 ea = 0
		setcolor corner = 1 sr = 124 sg = 255 sb = 255 sa = 128 ma = 128 er = 124 eg = 64 eb = 255 ea = 0
		setcolor corner = 2 sr = 124 sg = 64 sb = 255 sa = 0 ma = 0 er = 124 eg = 64 eb = 255 ea = 0
		setcolor corner = 3 sr = 124 sg = 255 sb = 255 sa = 80 ma = 80 er = 124 eg = 128 eb = 255 ea = 0
		setcolor corner = 4 sr = 124 sg = 255 sb = 255 sa = 64 ma = 64 er = 124 eg = 128 eb = 255 ea = 0
		setcolor corner = 5 sr = 124 sg = 255 sb = 255 sa = 0 ma = 0 er = 124 eg = 128 eb = 255 ea = 0
		while
			if ShouldEmitParticles name = <name>
				emit num = RandomRange(1.0,2.0)
			endif
			wait 1 gameframe
		repeat
	endscript
	script skater_flames_emit
		setlife min = 0.25 max = 0.30000001
		setanglespread spread = 0.25
		setspeedrange min = 4 max = 8
		setforce force = (0.0,-0.30000001,0.0)
		setparticlesize sw = 4 sh = 4 ew = 4 eh = 4
		setcolor corner = 0 sr = 255 sg = 255 sb = 255 sa = 255 ma = 255 er = 255 eg = 255 eb = 255 ea = 0
		setcolor corner = 1 sr = 255 sg = 255 sb = 64 sa = 128 ma = 128 er = 255 eg = 64 eb = 64 ea = 0
		setcolor corner = 2 sr = 255 sg = 64 sb = 64 sa = 0 ma = 0 er = 255 eg = 64 eb = 64 ea = 0
		setcolor corner = 3 sr = 255 sg = 255 sb = 64 sa = 80 ma = 80 er = 255 eg = 128 eb = 64 ea = 0
		setcolor corner = 4 sr = 255 sg = 255 sb = 64 sa = 64 ma = 64 er = 255 eg = 128 eb = 64 ea = 0
		setcolor corner = 5 sr = 255 sg = 255 sb = 64 sa = 0 ma = 0 er = 255 eg = 128 eb = 64 ea = 0
		while
			if ShouldEmitParticles name = <name>
				emit num = RandomRange(2.0,4.0)
			endif
			wait 1 gameframe
		repeat
	endscript
	script sparks_on bone = Bone_Board_Tail
		Obj_GetId
		MangleChecksums a = skater_sparks_system b = <objId>
		MangleChecksums a = <mangled_id> b = <bone>
		if NOT GetGlobalFlag Flag = CHEAT_FLAME
			set_spark_script name = <mangled_id>
		else
			SetScript name = <mangled_id> emitscript = skater_flames_emit
		endif
		ParticlesOn name = <mangled_id>
	endscript
	script set_spark_script
		GetTerrain
		if ((<Terrain> = 41) || (<Terrain> = 50) || (<Terrain> = 54))
			SetScript name = <name> emitscript = skater_elec_sparks_emit
		else
			SetScript name = <name> emitscript = skater_sparks_emit
		endif
	endscript
	script sparks_off bone = Bone_Board_Tail
		Obj_GetId
		MangleChecksums a = skater_sparks_system b = <objId>
		MangleChecksums a = <mangled_id> b = <bone>
		ParticlesOff name = <mangled_id>
	endscript
	script TurnOffSkaterSparks
		sparks_off bone = Bone_Board_Tail
	endscript
	script SkaterBloodOn num = 10
		VerifyParam param = name func = SkaterBloodOn <...>
		if NOT GetGlobalFlag Flag = CHEAT_SUPER_BLOOD
			SetScript name = <name> emitscript = skater_blood_emit
		else
			SetScript name = <name> emitscript = skater_blood_emit_super
		endif
		while
			ParticlesOn name = <name>
			wait 1 gameframe
		repeat <num>
		ParticlesOff name = <name>
	endscript
	script SkaterBloodOff
		VerifyParam param = name func = SkaterBloodOff <...>
		ParticlesOff name = <name>
	endscript
	script BloodParticlesOn bone = Bone_Head
		Obj_GetId
		MangleChecksums a = skater_blood_system b = <objId>
		MangleChecksums a = <mangled_id> b = <bone>
		Obj_SpawnScript SkaterBloodOn params = {name = <mangled_id> num = <num>}
	endscript
	script BloodParticlesOff bone = Bone_Head
		Obj_GetId
		MangleChecksums a = skater_blood_system b = <objId>
		MangleChecksums a = <mangled_id> b = Bone_Head
		SkaterBloodOff name = <mangled_id>
		EmptyParticleSystem name = <mangled_id>
	endscript
	script skater_blood_update
		while
			<objId>::Obj_GetBonePosition bone = <bone>
			setpos x = <x> y = <y> z = <z>
			wait 1 gameframe
		repeat
	endscript
	script SetSparksTruckFromNollie
		if InNollie
			SetFrontTruckSparks
		else
			SetRearTruckSparks
		endif
	endscript
	script skater_sparks_update bone_front = Bone_Board_Nose bone_back = Bone_Board_Tail Nosegrind = 0
		while
			if ShouldEmitParticles name = <name>
				<objId>::Obj_GetOrientation
				RotateVector x = <x> y = <y> z = <z> ry = 180
				SetEmitTarget x = <x> y = 0.5 z = <z>
				if <objId>::FrontTruckSparks
					if <objId>::BoardIsRotated
						<objId>::Obj_GetBonePosition bone = <bone_back>
					else
						<objId>::Obj_GetBonePosition bone = <bone_front>
					endif
				else
					if <objId>::BoardIsRotated
						<objId>::Obj_GetBonePosition bone = <bone_front>
					else
						<objId>::Obj_GetBonePosition bone = <bone_back>
					endif
				endif
				<y> = (<y> -2.0)
				setpos x = <x> y = <y> z = <z>
			endif
			wait 1 gameframe
		repeat
	endscript
	script skatersplash_update bone = Bone_Pelvis
		while
			<objId>::Obj_GetBonePosition bone = <bone>
			setpos x = <x> y = <y> z = <z>
			wait 1 gameframe
		repeat
	endscript
	script Skatersplashoff
		Obj_GetId
		MangleChecksums a = skatersplash b = <objId>
		ParticlesOff name = <mangled_id>
		EmptyParticleSystem name = <mangled_id>
	endscript
	script SkaterSplashOn
		Obj_GetId
		MangleChecksums a = skatersplash b = <objId>
		SetScript name = <mangled_id> emitscript = emit_skatersplash
		ParticlesOn name = <mangled_id>
	endscript
	script emit_skatersplash
		setlife min = 0.25 max = 0.25
		setanglespread spread = 0.40000001
		setspeedrange min = 1.0 max = 10.0
		setemitrange width = 4.0 height = 4.0
		setforce force = (0.0,-0.30000001,0.0)
		SetEmitTarget target = (0.0,1.0,0.0)
		setparticlesize sw = 3.0 sh = 6.0 ew = 0.1 eh = 0.2
		setcolor corner = 0 sr = 255 sg = 255 sb = 255 sa = 64 ma = 64 er = 255 eg = 255 eb = 255 ea = 0 midtime = -1
		setcolor corner = 1 sr = 255 sg = 255 sb = 255 sa = 32 ma = 32 er = 255 eg = 255 eb = 255 ea = 0 midtime = -1
		setcolor corner = 2 sr = 255 sg = 255 sb = 255 sa = 0 ma = 0 er = 255 eg = 255 eb = 255 ea = 0 midtime = -1
		SetCircularEmit circular = 0
		while
			if ShouldEmitParticles name = <name>
				<objId>::Obj_GetBonePosition bone = Bone_Bone_Pelvis
				setpos x = <x> y = <y> z = <z>
				emit num = 50
			endif
			wait 1 game frame
		repeat
	endscript
	script emit_jumpjets
		setlife min = 0.30000001 max = 0.40000001
		setanglespread spread = 0.2
		setspeedrange min = 3.0 max = 10.0
		setemitrange width = 2.0 height = 2.0
		setforce force = (0.0,-0.30000001,0.0)
		SetEmitTarget target = (0.0,-1.0,0.0)
		setparticlesize sw = 10.0 sh = 15.0 ew = 1 eh = 1.0
		setcolor corner = 0 sr = 255 sg = 255 sb = 255 sa = 255 ma = 255 er = 255 eg = 255 eb = 255 ea = 0
		setcolor corner = 1 sr = 255 sg = 255 sb = 64 sa = 128 ma = 128 er = 255 eg = 64 eb = 64 ea = 0
		setcolor corner = 2 sr = 255 sg = 64 sb = 64 sa = 0 ma = 0 er = 255 eg = 64 eb = 64 ea = 0
		SetCircularEmit circular = 0
		while
			if ShouldEmitParticles name = <name>
				emit num = 5
			endif
			wait 1 game frame
		repeat
	endscript
	script update_jumpjets
		while
			<objId>::Obj_GetBonePosition bone = Bone_Pelvis
			setpos x = <x> y = <y> z = <z>
			wait 1 gameframe
		repeat
	endscript
	script chad_sparks_emit
		setlife min = 0.2 max = 0.30000001
		setanglespread spread = 0.15000001
		setspeedrange min = 4 max = 8
		setforce force = (0.0,-0.30000001,0.0)
		setparticlesize sw = 1 sh = 1 ew = 2 eh = 2
		setcolor corner = 0 sr = 128 sg = 0 sb = 200 sa = 240 ma = 240 er = 128 eg = 0 eb = 240 ea = 0
		setcolor corner = 1 sr = 128 sg = 0 sb = 200 sa = 128 ma = 128 er = 128 eg = 0 eb = 200 ea = 0
		setcolor corner = 2 sr = 128 sg = 0 sb = 200 sa = 0 ma = 0 er = 128 eg = 0 eb = 64 ea = 0
		setcolor corner = 3 sr = 0 sg = 0 sb = 128 sa = 80 ma = 80 er = 0 eg = 0 eb = 64 ea = 0
		setcolor corner = 4 sr = 0 sg = 0 sb = 128 sa = 64 ma = 64 er = 0 eg = 0 eb = 64 ea = 0
		setcolor corner = 5 sr = 0 sg = 0 sb = 128 sa = 0 ma = 0 er = 0 eg = 0 eb = 64 ea = 0
		while
			if ShouldEmitParticles name = <name>
				emit num = 5
			endif
			wait 1 gameframe
		repeat
	endscript
	script jango_laser_emit
		setlife min = 0.5 max = 0.5
		setanglespread spread = 0
		setspeedrange min = 8 max = 8
		setforce force = (0.0,0.0,0.0)
		setparticlesize sw = 2 sh = 2 ew = 12 eh = 12
		setcolor corner = 0 sr = 255 sg = 200 sb = 200 sa = 255 ma = 255 er = 255 eg = 200 eb = 200 ea = 0
		setcolor corner = 1 sr = 255 sg = 64 sb = 64 sa = 128 ma = 128 er = 255 eg = 64 eb = 64 ea = 0
		setcolor corner = 2 sr = 255 sg = 64 sb = 64 sa = 0 ma = 0 er = 255 eg = 64 eb = 64 ea = 0
		emit num = 5
		while
			if ShouldEmitParticles name = <name>
				emit num = 5
			endif
			wait 76 frames
		repeat
	endscript
	script laser_update
		while
			<objId>::Obj_GetOrientation
			RotateVector x = <x> y = <y> z = <z> ry = 180
			SetEmitTarget x = <x> y = 0.40000001 z = <z>
			<objId>::Obj_GetBonePosition bone = Bone_Board_Tail
			<y> = (<y> + 10)
			setpos x = <x> y = <y> z = <z>
			wait 1 gameframe
		repeat
	endscript
	skater_particle_composite_structure =
	[
		{component = suspend}
		{component = particle}
		{component = lockobj}
	]
	script CleanUp_SpecialTrickParticles
		Obj_GetId
		MangleChecksums a = <objId> b = SpecialTrickParticles
		particle_id = <mangled_id>
		if ObjectExists id = <particle_id>
			<particle_id>::Die
		endif
	endscript
	script Emit_SpecialTrickParticles bone = Bone_Head specialtrick_particles = barf_particles
		Obj_GetId
		MangleChecksums a = <objId> b = SpecialTrickParticles
		particle_id = <mangled_id>
		if ObjectExists id = <particle_id>
			<particle_id>::Die
		endif
		wait 1 game frame
		printf "about to create .........................."
		if NOT GotParam dont_orient_toskater
			GetSkaterVelocity
			vel = (<vel_x> * (1.0,0.0,0.0) + <vel_y> * (0.0,1.0,0.0) + <vel_z> * (0.0,0.0,1.0))
			CreateCompositeObject {
				Components = skater_particle_composite_structure
				params = {
					name = <particle_id>
					LocalSpace
					vel = <vel>
					orient_to_vel
					<specialtrick_particles>
				}}
		else
			printf "Here?"
			CreateCompositeObject {
				Components = skater_particle_composite_structure
				params = {
					name = <particle_id>
					LocalSpace
					<specialtrick_particles>
				}}
		endif
		<particle_id>::Obj_LockToObject bone = <bone> id = <objId>
		if GotParam StopEmitAt
			wait <StopEmitAt> seconds
			if ObjectExists id = <particle_id>
				<particle_id>::SetEmitRate 0
			endif
		endif
	endscript
	fire_particles =
	{
		Class = ParticleObject
		type = #"Default"
		BoxDimsStart = (20.41944122,20.24608994,0.35107499)
		MidPosition = (-0.002134,-10.85268879,-0.058679)
		BoxDimsMid = (6.27889776,6.27889776,6.27889776)
		EndPosition = (-0.015868,-40.33533478,-0.05868)
		BoxDimsEnd = (14.71387482,14.71387482,14.71387482)
		texture = dt_generic_particle01
		CreatedAtStart
		AbsentInNetGames
		UseMidPoint
		UseColorMidTime
		type = NEWFLAT
		blendmode = Add
		FixedAlpha = 128
		AlphaCutoff = 1
		MaxStreams = 2
		SuspendDistance = 0
		lod_dist1 = 400
		lod_dist2 = 401
		EmitRate = 160.0
		Lifetime = 0.40000001
		MidPointPCT = 50
		StartRadius = 7.0
		MidRadius = 5.0
		EndRadius = 3.5
		StartRadiusSpread = 1.0
		MidRadiusSpread = 1.0
		EndRadiusSpread = 1.0
		StartRGB = [150, 72, 25]
		StartAlpha = 85
		ColorMidTime = 50
		MidRGB = [150, 67, 18]
		MidAlpha = 85
		EndRGB = [150, 67, 18]
		EndAlpha = 0
	}
	barf_particles =
	{
		Class = ParticleObject
		type = #"Default"
		BoxDimsStart = (1.40137804,1.40137804,1.40137804)
		MidPosition = (-0.00909,-17.0761013,-0.03492)
		BoxDimsMid = (4.44386387,4.44386387,4.44386387)
		EndPosition = (-0.06448,-64.39933014,-0.034921)
		BoxDimsEnd = (6.66731977,6.66731977,6.66731977)
		texture = dt_barf02
		CreatedAtStart
		AbsentInNetGames
		UseMidPoint
		UseColorMidTime
		type = NEWFLAT
		blendmode = blend
		FixedAlpha = 128
		AlphaCutoff = 1
		MaxStreams = 2
		SuspendDistance = 0
		lod_dist1 = 400
		lod_dist2 = 401
		EmitRate = 100.0
		Lifetime = 0.30000001
		MidPointPCT = 50
		StartRadius = 1.0
		MidRadius = 2.0
		EndRadius = 3.0
		StartRadiusSpread = 1.0
		MidRadiusSpread = 1.0
		EndRadiusSpread = 1.0
		StartRGB = [105, 111, 96]
		StartAlpha = 122
		ColorMidTime = 50
		MidRGB = [105, 111, 96]
		MidAlpha = 160
		EndRGB = [105, 111, 96]
		EndAlpha = 50
	}
	firebreath_particles =
	{
		Class = ParticleObject
		type = #"Default"
		BoxDimsStart = (0.69999999,0.69999999,0.69999999)
		MidPosition = (-0.002138,10.16623592,-0.058679)
		BoxDimsMid = (4.54235411,4.54235411,4.54235411)
		EndPosition = (-0.015876,38.12525558,-0.058676)
		BoxDimsEnd = (9.0638752,9.0638752,9.0638752)
		texture = dt_generic_particle01
		CreatedAtStart
		AbsentInNetGames
		UseMidPoint
		UseColorMidTime
		type = NEWFLAT
		blendmode = Add
		FixedAlpha = 128
		AlphaCutoff = 1
		MaxStreams = 2
		SuspendDistance = 0
		lod_dist1 = 400
		lod_dist2 = 401
		EmitRate = 250.0
		Lifetime = 0.2
		MidPointPCT = 50
		StartRadius = 4.0
		MidRadius = 4.0
		EndRadius = 6.0
		StartRadiusSpread = 1.0
		MidRadiusSpread = 1.0
		EndRadiusSpread = 1.0
		StartRGB = [150, 93, 59]
		StartAlpha = 82
		ColorMidTime = 50
		MidRGB = [150, 67, 18]
		MidAlpha = 109
		EndRGB = [150, 67, 18]
		EndAlpha = 0
	}
	iron_particles =
	{
		Class = ParticleObject
		type = #"Default"
		BoxDimsStart = (0.184903,0.184903,0.184903)
		MidPosition = (0.000028,0.03515,550.59631348)
		BoxDimsMid = (0.38812399,0.38812399,0.38812399)
		EndPosition = (-0.004006,1.28396201,1078.80957031)
		BoxDimsEnd = (0.389736,0.389736,0.389736)
		texture = dt_ironblast01
		CreatedAtStart
		AbsentInNetGames
		UseMidPoint
		UseColorMidTime
		type = NEWFLAT
		blendmode = Add
		FixedAlpha = 128
		AlphaCutoff = 1
		MaxStreams = 2
		SuspendDistance = 0
		lod_dist1 = 400
		lod_dist2 = 401
		EmitRate = 1500.0
		Lifetime = 0.1
		MidPointPCT = 50
		StartRadius = 6.0
		MidRadius = 6.0
		EndRadius = 6.0
		StartRadiusSpread = 0.0
		MidRadiusSpread = 0.0
		EndRadiusSpread = 0.0
		StartRGB = [150, 93, 59]
		StartAlpha = 105
		ColorMidTime = 50
		MidRGB = [150, 67, 18]
		MidAlpha = 122
		EndRGB = [150, 67, 18]
		EndAlpha = 0
	}
