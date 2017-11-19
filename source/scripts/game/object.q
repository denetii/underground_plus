
	DefaultMovingObjectSuspendDistance = 80
	X_AXIS = 1
	Y_AXIS = 2
	Z_AXIS = 4
	XY_AXIS = 3
	XZ_AXIS = 5
	YZ_AXIS = 6
	BOUNCEOBJ_REST_TOP_OR_BOTTOM = 1
	BOUNCEOBJ_REST_ANY_SIDE = 2
	BOUNCEOBJ_REST_TRAFFIC_CONE = 3
	GameObjExceptions =
	[
		SkaterLanded
		SkaterBailed
		SkaterInRadius
		SkaterOutOfRadius
		AnySkaterInRadius
	]
	CarExceptions =
	[
		SkaterInRadius
		SkaterOutOfRadius
	]
	BouncyObjExceptions =
	[
		SkaterInRadius
		SkaterOutOfRadius
		Bounce
		DoneBouncing
	]
	script Obj_WaitPlayerDist interval = 3
		while
			if Obj_ObjectInRadius radius = <radius> type = skater
				break
			else
				wait <interval> gameframes
			endif
		repeat
	endscript
	script Obj_CycleAnim numCycles = 1
		while
			Obj_PlayAnim <...>
			Obj_WaitAnimFinished
		repeat <numCycles>
	endscript
	script GetGap
		StartGap GapID = GetGap_DefaultID Flags = <Flags> TrickText = <TrickText> TrickScript = <TrickScript>
		EndGap GapID = GetGap_DefaultID Score = <Score> Text = <Text> GapScript = <GapScript>
	endscript
	script EmptyScript
	endscript
	script DefaultAvoidSkater
		AvoidSkater
	endscript
