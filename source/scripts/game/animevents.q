
	script GetAnimEventTableName
		animEventTableName = PedAnimEventTable
		switch <animName>
			case animload_anl_dog
				<animEventTableName> = DogAnimEventTable
		endswitch
		return animEventTableName = <animEventTableName>
	endscript
	SkaterAnimEventTable = {
		runfromidle = [
			{time = 0.02 event = FootstepScuffSoundEffect}
		]
		run = [
			{time = 0.02 event = FootstepRunSoundEffect}
			{time = 0.34999999 event = FootstepRunSoundEffect}
		]
		runtoidle = [
			{time = 0.05 event = FootstepScuffSoundEffect}
			{time = 0.25 event = FootstepWalkSoundEffect}
		]
		run1 = [
			{time = 0.02 event = FootstepRunSoundEffect}
			{time = 0.34999999 event = FootstepRunSoundEffect}
		]
		runjumpidle = [
			{time = 0.02 event = FootstepRunSoundEffect}
			{time = 0.34999999 event = FootstepRunSoundEffect}
			{time = 0.66000003 event = FootstepRunSoundEffect}
		]
		runjumpland = [
			{time = 0.02 event = FootstepRunSoundEffect}
			{time = 0.34999999 event = FootstepRunSoundEffect}
			{time = 0.66000003 event = FootstepRunSoundEffect}
		]
		bigjumplandtostand = [
			{time = 0.06 event = FootstepLandSoundEffect}
			{time = 1.39999998 event = FootstepScuffSoundEffect}
		]
		bigjumplandtorun = [
			{time = 0.06 event = FootstepLandSoundEffect}
			{time = 0.30000001 event = FootstepScuffSoundEffect}
			{time = 0.69999999 event = FootstepRunSoundEffect}
		]
		hangontothetop = [
			{time = 1.10000002 event = FootstepWalkSoundEffect}
			{time = 1.70000005 event = FootstepWalkSoundEffect}
			{time = 2.0999999 event = FootstepScuffSoundEffect}
		]
		jumplandtorun = [
			{time = 0.12 event = FootstepLandSoundEffect}
		]
		jumplandtostand = [
			{time = 0.02 event = FootstepLandSoundEffect}
			{time = 0.5 event = FootstepScuffSoundEffect}
		]
		ladderclimb = [
			{time = 0.17 event = FootstepWalkSoundEffect}
			{time = 0.69999999 event = FootstepWalkSoundEffect}
		]
		ladderclimbfromstandidle = [
			{time = 0.02 event = FootstepScuffSoundEffect}
			{time = 0.5 event = FootstepWalkSoundEffect}
		]
		ladderontothetop = [
			{time = 0.30000001 event = FootstepWalkSoundEffect}
			{time = 0.80000001 event = FootstepWalkSoundEffect}
			{time = 1.39999998 event = FootstepScuffSoundEffect}
		]
		runtojump = [
			{time = 0.02 event = FootstepJumpSoundEffect}
		]
		standtohang = [
			{time = 0.30000001 event = FootstepScuffSoundEffect}
		]
		standtojump = [
			{time = 0.03 event = FootstepJumpSoundEffect}
		]
		standturnleft = [
			{time = 0.02 event = FootstepScuffSoundEffect}
		]
		standturnright = [
			{time = 0.05 event = FootstepScuffSoundEffect}
		]
		newbraketurnleft = [
			{time = 0.01 event = FootstepScuffSoundEffect}
		]
		newbraketurnright = [
			{time = 0.01 event = FootstepScuffSoundEffect}
		]
		_180runskid = [
			{time = 0.02 event = FootstepRunSoundEffect}
			{time = 0.34999999 event = FootstepScuffSoundEffect}
			{time = 0.85000002 event = FootstepWalkSoundEffect}
		]
		skatetostand = [
			{time = 0.02 event = SoundEffect params = {name = FlipTransitionUp01}}
			{time = 0.41999999 event = FootstepRunSoundEffect}
			{time = 0.75 event = FootstepRunSoundEffect}
			{time = 1.29999995 event = FootstepWalkSoundEffect}
			{time = 1.5 event = FootstepScuffSoundEffect}
		]
		skatetowalk = [
			{time = 0.02 event = SoundEffect params = {name = FlipTransitionUp01}}
			{time = 0.41999999 event = FootstepRunSoundEffect}
			{time = 0.75 event = FootstepWalkSoundEffect}
		]
		braketostand = [
			{time = 0.44999999 event = SoundEffect params = {name = FlipTransitionUp01}}
		]
		slowskatetostand = [
			{time = 0.02 event = SoundEffect params = {name = FlipTransitionUp01}}
			{time = 0.30000001 event = FootstepRunSoundEffect}
			{time = 0.69999999 event = FootstepWalkSoundEffect}
			{time = 1.39999998 event = FootstepScuffSoundEffect}
		]
		walkslow = [
			{time = 0.02 event = FootstepWalkSoundEffect}
			{time = 0.51999998 event = FootstepWalkSoundEffect}
		]
		grindnbarf_init = [
			{time = 1.0 event = GenericParticles params = {specialtrick_particles = barf_particles bone = Bone_Jaw dont_orient_toskater = 1 StopEmitAt = 0.2}}
		]
		primohandstand_init = [
			{time = 0.5 event = GenericParticles params = {specialtrick_particles = fire_particles bone = Bone_Board_Root}}
		]
		flames_init = [
			{time = 0.1 event = GenericParticles params = {specialtrick_particles = firebreath_particles bone = Bone_Jaw StopEmitAt = 0.40000001}}
			{time = 0.60000002 event = GenericParticles params = {specialtrick_particles = fire_particles bone = Bone_Board_Root}}
		]
		BlastGrind_Init = [
			{time = 0.80000001 event = IronParticles}
		]
		bootburst_init = [
			{time = 0.5 event = GenericParticles params = {specialtrick_particles = fire_particles bone = Bone_Ankle_R dont_orient_toskater = 1}}
		]
		walkfast = [
			{time = 0.02 event = FootstepWalkSoundEffect}
			{time = 0.40000001 event = FootstepWalkSoundEffect}
		]
		fastrun = [
			{time = 0.02 event = FootstepRunSoundEffect}
			{time = 0.33000001 event = FootstepRunSoundEffect}
		]
		wrun = [
			{time = 0.02 event = FootstepRunSoundEffect}
			{time = 0.34999999 event = FootstepRunSoundEffect}
		]
		wruntoskate = [
			{time = 0.02 event = FootstepRunSoundEffect}
			{time = 0.34999999 event = FootstepRunSoundEffect}
			{time = 0.51999998 event = TurnOnSkaterLoopingSound}
			{time = 0.51999998 event = SoundEffect params = {name = FlipTransitionDown01}}
		]
		wskatetorun = [
			{time = 0.02 event = SoundEffect params = {name = FlipTransitionUp01}}
			{time = 0.41999999 event = FootstepRunSoundEffect}
			{time = 0.75 event = FootstepRunSoundEffect}
		]
		wstandtorun = [
			{time = 0.02 event = FootstepScuffSoundEffect}
		]
		wstandtowalk = [
			{time = 0.02 event = FootstepScuffSoundEffect}
		]
		wwalk = [
			{time = 0.02 event = FootstepWalkSoundEffect}
			{time = 0.51999998 event = FootstepWalkSoundEffect}
		]
		wwalktostand = [
			{time = 0.05 event = FootstepWalkSoundEffect}
			{time = 0.44999999 event = FootstepScuffSoundEffect}
		]
		wallplant_ollie = [
			{time = 0.02 event = FootstepWalkSoundEffect}
		]
		wallplant_ollie2 = [
			{time = 0.02 event = FootstepLandSoundEffect}
		]
		wallplant_ollie3 = [
			{time = 0.02 event = FootstepWalkSoundEffect}
		]
		wallplant_ollie3_flip = [
			{time = 0.02 event = FootstepLandSoundEffect}
		]
		wallplant_out = [
			{time = 0.02 event = FootstepLandSoundEffect}
		]
		jumpairto5050 = [
			{time = 0.22 event = SoundEffect params = {name = FlipTransitionDown01}}
			{time = 0.34999999 event = TerrainLandSound}
			{time = 0.38 event = TurnOnSkaterLoopingSound}
		]
		jumpairtomanual = [
			{time = 0.30000001 event = SoundEffect params = {name = FlipTransitionDown01}}
			{time = 0.55000001 event = TurnOnSkaterLoopingSound}
		]
		facesmash_resume = [
			{time = 0.89999998 event = FootstepScuffSoundEffect}
			{time = 0.94 event = FootstepScuffSoundEffect}
			{time = 1.39999998 event = FootstepWalkSoundEffect}
			{time = 1.5 event = FootstepWalkSoundEffect}
		]
		fallback = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.5 event = BailBodyFallSoundEffect}
			{time = 0.36000001 event = BailBodyPunchSoundEffect}
			{time = 0.40000001 event = BailSlapSoundEffect}
		]
		fallback_resume = [
			{time = 0.38 event = FootstepScuffSoundEffect}
			{time = 0.44999999 event = FootstepScuffSoundEffect}
			{time = 0.92000002 event = FootstepWalkSoundEffect}
			{time = 1.16999996 event = FootstepWalkSoundEffect}
		]
		slipbackwards = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.40000001 event = BailBodyFallSoundEffect}
			{time = 0.38 event = BailBodyPunchSoundEffect}
		]
		kneeslide = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.47 event = BailScrapeSoundEffect}
			{time = 0.43000001 event = BailBodyPunchSoundEffect}
		]
		nutterfallbackward = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.34 event = BailCrackSoundEffect}
			{time = 0.56 event = BailBodyPunchSoundEffect}
			{time = 0.60000002 event = BailBodyFallSoundEffect}
		]
		kneeslide_resume = [
			{time = 0.76999998 event = FootstepWalkSoundEffect}
			{time = 1.16999996 event = FootstepWalkSoundEffect}
		]
		slipforwards = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.34999999 event = BailBodyFallSoundEffect}
			{time = 0.57999998 event = BailBodyPunchSoundEffect}
			{time = 0.60000002 event = BailSlapSoundEffect}
		]
		fiftyfiftyfallbackward = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.40000001 event = BailBodyFallSoundEffect}
			{time = 0.38 event = BailBodyPunchSoundEffect}
			{time = 1.0 event = BailSlapSoundEffect}
		]
		fiftyfiftyfallforward = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.38 event = BailBodyPunchSoundEffect}
			{time = 0.36000001 event = BailScrapeSoundEffect}
			{time = 1.14999998 event = FootstepLandSoundEffect}
			{time = 1.14999998 event = BailBodyFallSoundEffect}
		]
		nutterfallforward = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.30000001 event = BailCrackSoundEffect}
			{time = 0.56 event = BailBodyPunchSoundEffect}
			{time = 0.60000002 event = BailBodyFallSoundEffect}
		]
		backwardstest = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.30000001 event = FootstepRunSoundEffect}
			{time = 0.30000001 event = FootstepScuffSoundEffect}
			{time = 0.69999999 event = FootstepRunSoundEffect}
			{time = 0.69999999 event = FootstepScuffSoundEffect}
			{time = 1.25 event = BailBodyPunchSoundEffect}
			{time = 1.25 event = BailBodyFallSoundEffect}
			{time = 1.33000004 event = BailSlapSoundEffect}
		]
		facefall = [
			{time = 0.01 event = BailBoardSoundEffect}
		]
		facefallsmallhit = [
			{time = 0.02 event = BailBodyPunchSoundEffect}
			{time = 0.06 event = BailSlapSoundEffect}
		]
		facefallbighit = [
			{time = 0.02 event = BailBodyPunchSoundEffect}
			{time = 0.06 event = BailSlapSoundEffect}
			{time = 0.02 event = BailBodyFallSoundEffect}
		]
		facefallresume = [
			{time = 1.0 event = FootstepWalkSoundEffect}
		]
		backwardfaceslam = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.38 event = BailBodyPunchSoundEffect}
			{time = 0.43000001 event = BailSlapSoundEffect}
		]
		getupbackwards = [
			{time = 0.30000001 event = FootstepScuffSoundEffect}
			{time = 0.37 event = FootstepScuffSoundEffect}
			{time = 0.87 event = FootstepRunSoundEffect}
			{time = 0.88 event = FootstepScuffSoundEffect}
			{time = 0.94 event = FootstepRunSoundEffect}
			{time = 1.39999998 event = FootstepWalkSoundEffect}
			{time = 1.79999995 event = FootstepWalkSoundEffect}
		]
		getupforwards = [
			{time = 0.15000001 event = FootstepScuffSoundEffect}
			{time = 0.5 event = FootstepRunSoundEffect}
			{time = 1.10000002 event = FootstepWalkSoundEffect}
			{time = 1.5 event = FootstepWalkSoundEffect}
		]
		getupfacing = [
			{time = 0.69999999 event = FootstepScuffSoundEffect}
			{time = 1.20000005 event = FootstepWalkSoundEffect}
			{time = 1.5 event = FootstepWalkSoundEffect}
		]
		getupfacesmash = [
			{time = 0.94999999 event = FootstepRunSoundEffect}
			{time = 0.97000003 event = FootstepScuffSoundEffect}
			{time = 1.0 event = FootstepRunSoundEffect}
			{time = 1.39999998 event = FootstepWalkSoundEffect}
			{time = 1.60000002 event = FootstepWalkSoundEffect}
		]
		smackwall = [
			{time = 0.02 event = BailBodyPunchSoundEffect}
			{time = 0.04 event = BailSlapSoundEffect}
		]
		smackwallfeet = [
			{time = 0.07 event = BailBodyPunchSoundEffect}
			{time = 0.01 event = FootstepRunSoundEffect}
			{time = 0.04 event = FootstepRunSoundEffect}
		]
		smackwallupright = [
			{time = 0.02 event = BailBodyPunchSoundEffect}
			{time = 0.04 event = BailSlapSoundEffect}
			{time = 0.5 event = BailBodyFallSoundEffect}
		]
		runout = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.30000001 event = BailBoardSoundEffect}
			{time = 0.18000001 event = FootstepRunSoundEffect}
			{time = 0.60000002 event = FootstepRunSoundEffect}
			{time = 0.97000003 event = FootstepScuffSoundEffect}
			{time = 1.5 event = FootstepWalkSoundEffect}
			{time = 2.0999999 event = FootstepWalkSoundEffect}
			{time = 2.48000002 event = FootstepWalkSoundEffect}
		]
		runoutquick = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.34999999 event = FootstepRunSoundEffect}
			{time = 0.44999999 event = FootstepRunSoundEffect}
			{time = 0.44999999 event = FootstepScuffSoundEffect}
			{time = 1.14999998 event = FootstepWalkSoundEffect}
			{time = 1.60000002 event = FootstepWalkSoundEffect}
			{time = 2.0 event = FootstepWalkSoundEffect}
		]
		landpartiallyonboard = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.30000001 event = BailBodyPunchSoundEffect}
			{time = 0.38 event = BailSlapSoundEffect}
			{time = 0.41999999 event = BailCrackSoundEffect}
			{time = 1.10000002 event = BailBodyFallSoundEffect}
			{time = 1.10000002 event = BailKneeStream}
		]
		runoutdrop = [
			{time = 0.05 event = FootstepRunSoundEffect}
			{time = 0.12 event = FootstepRunSoundEffect}
			{time = 0.12 event = FootstepScuffSoundEffect}
			{time = 1.5 event = FootstepWalkSoundEffect}
			{time = 1.89999998 event = FootstepWalkSoundEffect}
		]
		headfirstsplat = [
			{time = 0.02 event = BailBodyPunchSoundEffect}
			{time = 0.09 event = BailSlapSoundEffect}
			{time = 0.5 event = BailBodyFallSoundEffect}
		]
		feetfirstsplat = [
			{time = 0.41 event = BailBodyPunchSoundEffect}
			{time = 0.47999999 event = BailSlapSoundEffect}
			{time = 0.02 event = BailBodyFallSoundEffect}
		]
		bigdrop = [
			{time = 0.1 event = FootstepLandSoundEffect}
			{time = 0.2 event = BailBodyPunchSoundEffect}
			{time = 0.28999999 event = FootstepScuffSoundEffect}
			{time = 0.80000001 event = BailBodyFallSoundEffect}
		]
		neckbreaker = [
			{time = 0.02 event = BailBodyPunchSoundEffect}
			{time = 0.07 event = BailSlapSoundEffect}
			{time = 0.09 event = BailCrackSoundEffect}
			{time = 0.69999999 event = BailBodyFallSoundEffect}
		]
		getupdarthmaul = [
			{time = 1.0 event = FootstepLandSoundEffect}
			{time = 1.14999998 event = FootstepScuffSoundEffect}
			{time = 1.54999995 event = FootstepWalkSoundEffect}
			{time = 1.70000005 event = FootstepWalkSoundEffect}
		]
		shoulders = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.41 event = BailBodyPunchSoundEffect}
			{time = 0.5 event = BailBodyFallSoundEffect}
		]
		hips = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.38 event = BailBodyPunchSoundEffect}
			{time = 0.44999999 event = BailBodyFallSoundEffect}
		]
		rolling = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.34999999 event = BailBodyPunchSoundEffect}
			{time = 0.40000001 event = BailSlapSoundEffect}
			{time = 0.60000002 event = BailBodyFallSoundEffect}
			{time = 2.29999995 event = FootstepWalkSoundEffect}
			{time = 2.68000007 event = FootstepWalkSoundEffect}
		]
		getuphips = [
			{time = 0.44999999 event = FootstepScuffSoundEffect}
			{time = 1.0 event = FootstepWalkSoundEffect}
			{time = 1.5 event = FootstepWalkSoundEffect}
		]
		spasmodic = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.30000001 event = FootstepRunSoundEffect}
			{time = 0.30000001 event = FootstepScuffSoundEffect}
			{time = 0.56999999 event = FootstepRunSoundEffect}
			{time = 0.56999999 event = FootstepScuffSoundEffect}
			{time = 0.85000002 event = BailBodyPunchSoundEffect}
			{time = 0.85000002 event = BailBodyFallSoundEffect}
			{time = 0.94 event = BailSlapSoundEffect}
		]
		getupspasmodic = [
			{time = 0.44999999 event = FootstepScuffSoundEffect}
			{time = 1.0 event = FootstepWalkSoundEffect}
			{time = 1.48000002 event = FootstepWalkSoundEffect}
		]
		tailslideout = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.12 event = BailBodyPunchSoundEffect}
			{time = 0.17 event = BailSlapSoundEffect}
			{time = 0.19 event = BailCrackSoundEffect}
			{time = 0.69999999 event = BailBodyFallSoundEffect}
		]
		getuptailslideout = [
			{time = 1.14999998 event = FootstepScuffSoundEffect}
			{time = 1.25 event = FootstepScuffSoundEffect}
			{time = 1.5 event = FootstepWalkSoundEffect}
			{time = 1.70000005 event = FootstepWalkSoundEffect}
		]
		splits = [
			{time = 0.08 event = BailBodyPunchSoundEffect}
			{time = 0.13 event = BailSlapSoundEffect}
			{time = 0.15000001 event = BailCrackSoundEffect}
			{time = 0.89999998 event = FootstepScuffSoundEffect}
			{time = 1.29999995 event = FootstepWalkSoundEffect}
		]
		anklebust1 = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.34999999 event = BailBodyPunchSoundEffect}
			{time = 0.41999999 event = BailSlapSoundEffect}
			{time = 0.47999999 event = BailCrackSoundEffect}
			{time = 1.04999995 event = BailBodyFallSoundEffect}
			{time = 1.20000005 event = BailAnkleStream}
		]
		anklebust2 = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.30000001 event = BailBodyPunchSoundEffect}
			{time = 0.37 event = BailSlapSoundEffect}
			{time = 0.43000001 event = BailCrackSoundEffect}
			{time = 0.94999999 event = BailBodyFallSoundEffect}
			{time = 1.10000002 event = BailAnkleStream}
		]
		faceplant = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.37 event = BailBodyPunchSoundEffect}
			{time = 0.44 event = BailSlapSoundEffect}
			{time = 2.0 event = FootstepScuffSoundEffect}
			{time = 2.5999999 event = FootstepWalkSoundEffect}
		]
		nsmissbackfoot = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.30000001 event = BailBodyPunchSoundEffect}
			{time = 0.37 event = BailSlapSoundEffect}
			{time = 0.41999999 event = BailCrackSoundEffect}
			{time = 0.69999999 event = BailBodyFallSoundEffect}
		]
		nsmissbackfoot_resume = [
			{time = 0.60000002 event = FootstepScuffSoundEffect}
			{time = 0.80000001 event = FootstepScuffSoundEffect}
			{time = 1.29999995 event = FootstepWalkSoundEffect}
			{time = 1.70000005 event = FootstepWalkSoundEffect}
		]
		anklebust3 = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.30000001 event = BailBodyPunchSoundEffect}
			{time = 0.37 event = BailSlapSoundEffect}
			{time = 0.43000001 event = BailCrackSoundEffect}
			{time = 0.69999999 event = BailScrapeSoundEffect}
			{time = 1.60000002 event = BailBodyFallSoundEffect}
			{time = 1.10000002 event = BailAnkleStream}
		]
		getupanklebust = [
			{time = 1.5 event = FootstepScuffSoundEffect}
			{time = 2.20000005 event = FootstepScuffSoundEffect}
			{time = 3.20000005 event = FootstepWalkSoundEffect}
			{time = 3.79999995 event = FootstepWalkSoundEffect}
		]
		boardsplit = [
			{time = 0.5 event = BailBodyPunchSoundEffect}
			{time = 0.1 event = BailSlapSoundEffect}
			{time = 0.15000001 event = SoundEffect params = {name = BailCrack01}}
			{time = 0.60000002 event = BailBodyFallSoundEffect}
			{time = 1.79999995 event = BailKickStream}
			{time = 2.01999998 event = FootstepScuffSoundEffect}
			{time = 2.1500001 event = FootstepScuffSoundEffect}
			{time = 2.5999999 event = SoundEffect params = {name = BailScrape01}}
			{time = 2.5999999 event = SoundEffect params = {name = BailBodyPunch04_11}}
			{time = 3.20000005 event = FootstepWalkSoundEffect}
			{time = 3.79999995 event = FootstepWalkSoundEffect}
			{time = 4.30000019 event = FootstepWalkSoundEffect}
			{time = 4.69999981 event = FootstepWalkSoundEffect}
		]
		flailbail = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.47999999 event = BailBodyPunchSoundEffect}
			{time = 0.54000002 event = BailSlapSoundEffect}
			{time = 0.80000001 event = BailBodyFallSoundEffect}
		]
		flailgetup = [
			{time = 1.5 event = FootstepScuffSoundEffect}
			{time = 2.0 event = FootstepScuffSoundEffect}
			{time = 2.3499999 event = FootstepWalkSoundEffect}
			{time = 2.70000005 event = FootstepWalkSoundEffect}
		]
		headsmack = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.25 event = FootstepScuffSoundEffect}
			{time = 0.34999999 event = FootstepScuffSoundEffect}
			{time = 0.63999999 event = BailBodyPunchSoundEffect}
			{time = 0.69999999 event = BailSlapSoundEffect}
			{time = 0.55000001 event = BailBodyFallSoundEffect}
		]
		headgetup = [
			{time = 0.69999999 event = FootstepScuffSoundEffect}
			{time = 1.5 event = FootstepScuffSoundEffect}
			{time = 2.0999999 event = FootstepWalkSoundEffect}
			{time = 2.70000005 event = FootstepWalkSoundEffect}
		]
		manualback = [
			{time = 0.02 event = BailBoardSoundEffect}
			{time = 0.51999998 event = BailBodyPunchSoundEffect}
			{time = 0.61000001 event = BailSlapSoundEffect}
			{time = 1.58000004 event = SoundEffect params = {name = BailBodyPunch02_11}}
		]
		manualgetup = [
			{time = 1.10000002 event = FootstepWalkSoundEffect}
			{time = 1.60000002 event = FootstepWalkSoundEffect}
			{time = 2.18000007 event = FootstepScuffSoundEffect}
			{time = 2.27999997 event = FootstepScuffSoundEffect}
			{time = 2.22000003 event = FootstepRunSoundEffect}
			{time = 2.31999993 event = FootstepRunSoundEffect}
		]
		manualforwards = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.38 event = BailBodyPunchSoundEffect}
			{time = 0.44999999 event = BailSlapSoundEffect}
		]
		manual_fgetup = [
			{time = 0.69999999 event = FootstepWalkSoundEffect}
			{time = 1.5 event = FootstepRunSoundEffect}
			{time = 1.5 event = FootstepScuffSoundEffect}
			{time = 1.95000005 event = FootstepRunSoundEffect}
			{time = 2.31999993 event = FootstepWalkSoundEffect}
		]
		newanklebust = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.30000001 event = BailBodyPunchSoundEffect}
			{time = 0.37 event = BailSlapSoundEffect}
			{time = 0.43000001 event = BailCrackSoundEffect}
			{time = 1.29999995 event = BailBodyFallSoundEffect}
			{time = 1.20000005 event = BailAnkleStream}
		]
		nutsac = [
			{time = 0.2 event = BailBodyPunchSoundEffect}
			{time = 0.27000001 event = BailSlapSoundEffect}
			{time = 0.33000001 event = BailCrackSoundEffect}
			{time = 1.0 event = BailBodyFallSoundEffect}
		]
		nutsacgetup = [
			{time = 0.5 event = FootstepWalkSoundEffect}
			{time = 1.29999995 event = FootstepRunSoundEffect}
			{time = 1.60000002 event = FootstepScuffSoundEffect}
			{time = 1.79999995 event = FootstepWalkSoundEffect}
			{time = 3.0999999 event = FootstepWalkSoundEffect}
			{time = 3.5 event = FootstepWalkSoundEffect}
		]
		nutsacgetupquick = [
			{time = 1.10000002 event = FootstepWalkSoundEffect}
			{time = 1.5 event = FootstepScuffSoundEffect}
			{time = 2.4000001 event = FootstepRunSoundEffect}
			{time = 2.5 event = FootstepRunSoundEffect}
		]
		onefootbail = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.2 event = BailBodyPunchSoundEffect}
			{time = 0.27000001 event = BailSlapSoundEffect}
			{time = 0.33000001 event = BailCrackSoundEffect}
			{time = 1.0 event = BailBodyFallSoundEffect}
			{time = 1.95000005 event = BailBodyFallSoundEffect}
			{time = 1.10000002 event = BailKneeStream}
		]
		onefootgetup = [
			{time = 0.60000002 event = FootstepScuffSoundEffect}
			{time = 1.0 event = FootstepWalkSoundEffect}
			{time = 1.79999995 event = FootstepWalkSoundEffect}
			{time = 2.18000007 event = FootstepWalkSoundEffect}
			{time = 2.18000007 event = FootstepScuffSoundEffect}
		]
		railbail = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.40000001 event = BailBodyPunchSoundEffect}
			{time = 0.47999999 event = BailSlapSoundEffect}
			{time = 0.60000002 event = BailBodyFallSoundEffect}
		]
		railbailgetup = [
			{time = 0.33000001 event = FootstepScuffSoundEffect}
			{time = 1.0 event = FootstepWalkSoundEffect}
			{time = 2.04999995 event = FootstepWalkSoundEffect}
			{time = 2.5 event = FootstepWalkSoundEffect}
		]
		railbailhitground = [
			{time = 0.02 event = BailBodyPunchSoundEffect}
			{time = 0.1 event = BailSlapSoundEffect}
		]
		rollingbail = [
			{time = 0.01 event = BailBoardSoundEffect}
			{time = 0.44999999 event = BailBodyPunchSoundEffect}
			{time = 0.52999997 event = BailSlapSoundEffect}
			{time = 0.95999998 event = BailScrapeSoundEffect}
			{time = 0.60000002 event = BailBodyFallSoundEffect}
		]
		rollinggetup = [
			{time = 0.80000001 event = FootstepScuffSoundEffect}
			{time = 1.70000005 event = FootstepScuffSoundEffect}
			{time = 2.20000005 event = FootstepRunSoundEffect}
			{time = 2.32999992 event = FootstepRunSoundEffect}
		]
		walkingslap = [
			{time = 0.28 event = BailSlapSoundEffect}
			{time = 0.56999999 event = FootstepRunSoundEffect}
			{time = 0.89999998 event = FootstepWalkSoundEffect}
		]
		walkingbail = [
			{time = 0.01 event = BailSlapSoundEffect}
			{time = 0.44999999 event = BailBoardSoundEffect}
			{time = 0.60000002 event = BailBodyFallSoundEffect}
		]
		walkingbailgetup = [
			{time = 0.69999999 event = FootstepScuffSoundEffect}
			{time = 1.20000005 event = FootstepScuffSoundEffect}
			{time = 1.60000002 event = FootstepWalkSoundEffect}
			{time = 1.89999998 event = FootstepWalkSoundEffect}
		]
	}
	PedAnimEventTable = {
		Ped_Tombstone_Chisel1 = [
			{time = 0.02 event = Print params = {string = "Chisel1"}}
			{time = 0.30000001 event = TombstoneChiselSound}
			{time = 0.60000002 event = TombstoneChiselSound}
			{time = 0.89999998 event = TombstoneChiselSound}
		]
		Ped_Tombstone_Inspect = [
			{time = 0.02 event = Print params = {string = "Inspect"}}
			{time = 0.02 event = PedObjPlayStream params = {name = "TombstoneManInspect"}}
		]
		Ped_Tombstone_WipeBrow = [
			{time = 0.02 event = Print params = {string = "Wipebrow"}}
			{time = 0.02 event = PedObjPlayStream params = {name = "TombstoneManWipeBrow"}}
		]
		Ped_Tombstone_Chisel2 = [
			{time = 0.02 event = Print params = {string = "Chisel2"}}
			{time = 0.5 event = TombstoneChiselSound}
		]
		Ped_Tombstone_Chisel3 = [
			{time = 0.02 event = Print params = {string = "Chisel3"}}
			{time = 0.64999998 event = TombstoneChiselSound}
			{time = 0.86000001 event = TombstoneChiselSound}
			{time = 1.10000002 event = TombstoneChiselSound}
			{time = 1.35000002 event = TombstoneChiselSound}
		]
		Ped_Tombstone_StandToKneel = [
			{time = 0.02 event = Print params = {string = "StandToKneel"}}
			{time = 0.02 event = PedObjPlayStream params = {name = "TombstoneManStandToKneel"}}
		]
		Ped_Tombstone_KneelChisel = [
			{time = 0.02 event = Print params = {string = "KneelChisel"}}
			{time = 0.5 event = TombstoneChiselSound}
			{time = 1.0 event = TombstoneChiselSound}
			{time = 1.49000001 event = TombstoneChiselSound}
		]
		Ped_Tombstone_KneelBadBack = [
			{time = 0.02 event = Print params = {string = "KneelBadBack"}}
			{time = 0.02 event = PedObjPlayStream params = {name = "TombstoneManKneelBadBack"}}
		]
		Ped_Tombstone_StandFromKneel = [
			{time = 0.02 event = Print params = {string = "StandFromKneel"}}
			{time = 0.02 event = PedObjPlayStream params = {name = "TombstoneManStandFromKneel"}}
		]
		Ped_Tombstone_StandToChisel = [
			{time = 0.02 event = Print params = {string = "StandToChisel"}}
			{time = 0.02 event = PedObjPlayStream params = {name = "TombstoneManStandToChisel"}}
		]
		Ped_Tombstone_StandFromChisel = [
			{time = 0.02 event = Print params = {string = "StandFromChisel"}}
			{time = 0.02 event = PedObjPlayStream params = {name = "StandFromChisel"}}
		]
		Ped_Tombstone_StandIdle = [
			{time = 0.02 event = Print params = {string = "StandIdle"}}
		]
		BarkIdle = [
			{time = 0.02 event = DogBarkStream}
		]
		Ped_M_jumpback = [
			{time = 0.57999998 event = FootstepScuffSoundEffect}
			{time = 0.85000002 event = FootstepRunSoundEffect}
			{time = 1.0 event = FootstepRunSoundEffect}
		]
		Ped_f_jumpback = [
			{time = 0.1 event = FootstepScuffSoundEffect}
			{time = 0.5 event = FootstepRunSoundEffect}
			{time = 0.64999998 event = FootstepRunSoundEffect}
		]
		Ped_M_jumpforward = [
			{time = 0.60000002 event = FootstepScuffSoundEffect}
			{time = 0.60000002 event = FootstepRunSoundEffect}
			{time = 1.10000002 event = FootstepWalkSoundEffect}
		]
		Ped_f_jumpforward = [
			{time = 0.40000001 event = FootstepScuffSoundEffect}
			{time = 0.40000001 event = FootstepRunSoundEffect}
			{time = 0.56 event = FootstepRunSoundEffect}
			{time = 1.70000005 event = FootstepWalkSoundEffect}
		]
		Ped_M_jumpleft = [
			{time = 0.44999999 event = FootstepScuffSoundEffect}
			{time = 0.44999999 event = FootstepRunSoundEffect}
			{time = 0.80000001 event = FootstepRunSoundEffect}
			{time = 1.29999995 event = FootstepWalkSoundEffect}
		]
		Ped_f_jumpright = [
			{time = 0.44999999 event = FootstepScuffSoundEffect}
			{time = 0.44999999 event = FootstepRunSoundEffect}
			{time = 0.60000002 event = FootstepRunSoundEffect}
			{time = 1.29999995 event = FootstepWalkSoundEffect}
		]
		Ped_M_falldownA = [
			{time = 0.44999999 event = BailBodyFallSoundEffect}
			{time = 0.69999999 event = BailBodyFallSoundEffect}
		]
		Ped_M_falldownB = [
			{time = 0.41999999 event = BailBodyFallSoundEffect}
			{time = 0.64999998 event = BailBodyFallSoundEffect}
		]
		Ped_M_falldownC = [
			{time = 0.30000001 event = BailBodyFallSoundEffect}
		]
		Ped_M_falldownD = [
			{time = 0.2 event = FootstepScuffSoundEffect}
			{time = 0.40000001 event = BailBodyFallSoundEffect}
		]
		Ped_M_falldownE = [
			{time = 0.2 event = FootstepScuffSoundEffect}
			{time = 0.34999999 event = BailBodyFallSoundEffect}
			{time = 0.55000001 event = BailBodyFallSoundEffect}
		]
		Ped_M_Run = [
			{time = 0.12 event = FootstepRunSoundEffect}
			{time = 0.46000001 event = FootstepRunSoundEffect}
		]
		Ped_f_Run = [
			{time = 0.18000001 event = FootstepRunSoundEffect}
			{time = 0.60000002 event = FootstepRunSoundEffect}
		]
		Ped_M_runtoidle = [
			{time = 0.12 event = FootstepRunSoundEffect}
			{time = 0.46000001 event = FootstepRunSoundEffect}
			{time = 0.75 event = FootstepScuffSoundEffect}
		]
		Ped_f_runtoidle1 = [
			{time = 0.12 event = FootstepRunSoundEffect}
			{time = 0.46000001 event = FootstepRunSoundEffect}
			{time = 0.12 event = FootstepScuffSoundEffect}
		]
		Ped_f_runtoidle2 = [
			{time = 0.2 event = FootstepRunSoundEffect}
			{time = 0.46000001 event = FootstepRunSoundEffect}
		]
		Ped_M_Run1 = [
			{time = 0.12 event = FootstepRunSoundEffect}
			{time = 0.46000001 event = FootstepRunSoundEffect}
		]
		Ped_M_Run2 = [
			{time = 0.05 event = FootstepRunSoundEffect}
			{time = 0.38 event = FootstepRunSoundEffect}
		]
		Ped_M_Walk1 = [
			{time = 0.01 event = FootstepWalkSoundEffect}
			{time = 0.52999997 event = FootstepWalkSoundEffect}
		]
		Ped_f_Walk = [
			{time = 0.01 event = FootstepWalkSoundEffect}
			{time = 0.62 event = FootstepWalkSoundEffect}
		]
		Ped_f_Walk2 = [
			{time = 0.01 event = FootstepWalkSoundEffect}
			{time = 0.62 event = FootstepWalkSoundEffect}
		]
		Ped_f_Walk2toidle1 = [
			{time = 0.01 event = FootstepWalkSoundEffect}
		]
		Ped_f_Walk3 = [
			{time = 0.01 event = FootstepWalkSoundEffect}
			{time = 0.69999999 event = FootstepWalkSoundEffect}
		]
		Ped_f_Walk3toidle1 = [
			{time = 0.01 event = FootstepWalkSoundEffect}
		]
		Ped_f_Walk4 = [
			{time = 0.01 event = FootstepWalkSoundEffect}
			{time = 0.43000001 event = FootstepWalkSoundEffect}
		]
		Ped_f_Walk4toidle1 = [
			{time = 0.01 event = FootstepWalkSoundEffect}
		]
		Ped_f_Walkingwave = [
			{time = 0.01 event = FootstepWalkSoundEffect}
			{time = 0.62 event = FootstepWalkSoundEffect}
		]
		Ped_M_Walk3 = [
			{time = 0.08 event = FootstepWalkSoundEffect}
			{time = 0.55000001 event = FootstepWalkSoundEffect}
		]
		Ped_M_Walk4 = [
			{time = 0.05 event = FootstepWalkSoundEffect}
			{time = 0.40000001 event = FootstepWalkSoundEffect}
		]
		Ped_M_Walkcool = [
			{time = 0.01 event = FootstepWalkSoundEffect}
			{time = 0.80000001 event = FootstepWalkSoundEffect}
		]
		Ped_M_Walktired = [
			{time = 0.01 event = FootstepWalkSoundEffect}
			{time = 0.80000001 event = FootstepWalkSoundEffect}
		]
		Ped_M_Walk1toIdle = [
			{time = 0.40000001 event = FootstepScuffSoundEffect}
		]
		Ped_f_WalktoIdle1 = [
			{time = 0.01 event = FootstepWalkSoundEffect}
			{time = 0.60000002 event = FootstepScuffSoundEffect}
		]
		Ped_f_WalktoIdle2 = [
			{time = 0.01 event = FootstepWalkSoundEffect}
		]
		Ped_M_Walk2 = [
			{time = 0.01 event = FootstepWalkSoundEffect}
			{time = 0.52999997 event = FootstepWalkSoundEffect}
		]
		Ped_M_Walk2toIdle = [
			{time = 0.40000001 event = FootstepScuffSoundEffect}
		]
		Ped_M_Run1toIdle = [
			{time = 0.30000001 event = FootstepScuffSoundEffect}
		]
	}
	DogAnimEventTable = {
		run = [
			{time = 0.02 event = Print params = {string = "Dog Run"}}
		]
		BarkIdle = [
			{time = 0.02 event = DogBarkStream}
		]
		LiftLeg = [
			{time = 0.02 event = Print params = {string = "Dog Lift Leg"}}
		]
	}
	script set_actual_skater_anim_handlers
		SetEventHandler ex = SoundEffect scr = HandleSoundEffectEvent group = anim
		SetEventHandler ex = FootstepWalkSoundEffect scr = HandleFootstepWalkSoundEffectEvent group = anim
		SetEventHandler ex = FootstepRunSoundEffect scr = HandleFootstepRunSoundEffectEvent group = anim
		SetEventHandler ex = FootstepScuffSoundEffect scr = HandleFootstepScuffSoundEffect group = anim
		SetEventHandler ex = FootstepJumpSoundEffect scr = HandleFootstepJumpSoundEffect group = anim
		SetEventHandler ex = FootstepLandSoundEffect scr = HandleFootstepLandSoundEffect group = anim
		SetEventHandler ex = BailBodyFallSoundEffect scr = HandleBailBodyFallSoundEffect group = anim
		SetEventHandler ex = BailBodyPunchSoundEffect scr = HandleBailBodyPunchSoundEffect group = anim
		SetEventHandler ex = BailCrackSoundEffect scr = HandleBailCrackSoundEffect group = anim
		SetEventHandler ex = BailSlapSoundEffect scr = HandleBailSlapSoundEffect group = anim
		SetEventHandler ex = BailScrapeSoundEffect scr = HandleBailScrapeSoundEffect group = anim
		SetEventHandler ex = BailBoardSoundEffect scr = HandleBailBoardSoundEffect group = anim
		SetEventHandler ex = BailHitGroundSoundEffect scr = HandleHitGroundSoundEffect group = anim
		SetEventHandler ex = TerrainLandSound scr = HandleTerrainLandSound group = anim
		SetEventHandler ex = TerrainBonkSound scr = HandleTerrainBonkSound group = anim
		SetEventHandler ex = TurnOnSkaterLoopingSound scr = HandleTurnOnSkaterLoopingSound group = anim
		SetEventHandler ex = BailKneeStream scr = HandleBailKneeStream group = anim
		SetEventHandler ex = BailAnkleStream scr = HandleBailAnkleStream group = anim
		SetEventHandler ex = BailKickStream scr = HandleBailKickStream group = anim
		SetEventHandler ex = GenericParticles scr = Emit_SpecialTrickParticles group = anim
		SetEventHandler ex = IronParticles scr = IronParticles_emitfromHand group = anim
	endscript
	script set_actual_ped_anim_handlers
		SetEventHandler ex = Print scr = HandlePrintEvent group = anim
		SetEventHandler ex = TombstoneChiselSound scr = HandleTombstoneChiselSound group = anim
		SetEventHandler ex = TombstoneInspectStream scr = HandleTombstoneInspectStream group = anim
		SetEventHandler ex = PedObjPlayStream scr = HandlePedObjPlayStream group = anim
		SetEventHandler ex = DogBarkStream scr = HandleDogBarkStream group = anim
		SetEventHandler ex = FootstepWalkSoundEffect scr = HandlePedFootstepWalkSoundEffectEvent group = anim
		SetEventHandler ex = FootstepRunSoundEffect scr = HandlePedFootstepRunSoundEffectEvent group = anim
		SetEventHandler ex = FootstepScuffSoundEffect scr = HandlePedFootstepScuffSoundEffect group = anim
		SetEventHandler ex = FootstepJumpSoundEffect scr = HandlePedFootstepJumpSoundEffect group = anim
		SetEventHandler ex = FootstepLandSoundEffect scr = HandlePedFootstepLandSoundEffect group = anim
		SetEventHandler ex = BailBodyFallSoundEffect scr = HandlePedBailBodyFallSoundEffect group = anim
		SetEventHandler ex = BailBodyPunchSoundEffect scr = HandlePedBailBodyPunchSoundEffect group = anim
		SetEventHandler ex = BailCrackSoundEffect scr = HandlePedBailCrackSoundEffect group = anim
		SetEventHandler ex = BailSlapSoundEffect scr = HandlePedBailSlapSoundEffect group = anim
		SetEventHandler ex = BailScrapeSoundEffect scr = HandlePedBailScrapeSoundEffect group = anim
		SetEventHandler ex = BailBoardSoundEffect scr = HandlePedBailBoardSoundEffect group = anim
	endscript
	script IronParticles_emitfromHand specialtrick_particles = iron_particles
		if Flipped
			Emit_SpecialTrickParticles specialtrick_particles = <specialtrick_particles> bone = Bone_Wrist_L StopEmitAt = 0.12
		else
			Emit_SpecialTrickParticles specialtrick_particles = <specialtrick_particles> bone = Bone_Wrist_R StopEmitAt = 0.12
		endif
		Obj_PlaySound FlamingFireball01 vol = 450
	endscript
	script set_skater_anim_handlers
		ClearExceptionGroup anim
		set_actual_skater_anim_handlers
	endscript
	script set_ped_anim_handlers
		ClearExceptionGroup anim
		set_actual_ped_anim_handlers
	endscript
	script set_viewerobj_anim_handlers
		ClearExceptionGroup anim
		set_actual_skater_anim_handlers
		set_actual_ped_anim_handlers
	endscript
	script HandlePrintEvent
		printf "Handling %s event" s = <string>
	endscript
	script HandlePedObjPlayStream
		printf <name>
	endscript
	script HandleTombstoneChiselSound
		Obj_PlaySound NJ_TombstoneAnvilHit01 vol = RandomRange(40.0,75.0) pitch = RandomRange(95.0,102.0)
	endscript
	script HandleTombstoneInspectStream
	endscript
	script HandleDogBarkStream
		if Obj_Visible
			RandomNoRepeat(
				@Obj_PlayStream NJ_DogBark03 vol = 130 dropoff = 100
				@Obj_PlayStream NJ_DogBark04 vol = 130 dropoff = 100
			)
			wait 1 seconds
			RandomNoRepeat(
				@Obj_PlayStream NJ_DogBark01 vol = 130 dropoff = 100
				@Obj_PlayStream NJ_DogBark02 vol = 130 dropoff = 100
				@Obj_PlayStream NJ_DogBark05 vol = 130 dropoff = 100
				@Obj_PlayStream NJ_DogBark06 vol = 130 dropoff = 100
			)
		endif
	endscript
	script HandleBailKneeStream
		if ProfileEquals is_custom
			if ProfileEquals is_male
				RandomNoRepeat(
					@PlayStream customm_knee01 vol = 200
					@PlayStream customm_knee02 vol = 200
					@PlayStream customm_knee03 vol = 200
					@PlayStream customm_knee04 vol = 200
					@PlayStream customm_knee05 vol = 200
					@PlayStream customm_knee06 vol = 200
				)
			else
				RandomNoRepeat(
					@PlayStream customf_knee01 vol = 200
					@PlayStream customf_knee02 vol = 200
					@PlayStream customf_knee03 vol = 200
					@PlayStream customf_knee04 vol = 200
					@PlayStream customf_knee05 vol = 200
					@PlayStream customf_knee06 vol = 200
				)
			endif
		endif
	endscript
	script HandleBailAnkleStream
		if ProfileEquals is_custom
			if ProfileEquals is_male
				RandomNoRepeat(
					@PlayStream customm_ankle01 vol = 200
					@PlayStream customm_ankle02 vol = 200
					@PlayStream customm_ankle03 vol = 200
					@PlayStream customm_ankle04 vol = 200
					@PlayStream customm_ankle05 vol = 200
				)
			else
				RandomNoRepeat(
					@PlayStream customf_ankle01 vol = 200
					@PlayStream customf_ankle03 vol = 200
					@PlayStream customf_ankle04 vol = 200
					@PlayStream customf_ankle05 vol = 200
				)
			endif
		endif
	endscript
	script HandleBailKickStream
		if ProfileEquals is_custom
			if ProfileEquals is_male
				RandomNoRepeat(
					@PlayStream customm_kick01 vol = 200
					@PlayStream customm_kick02 vol = 200
					@PlayStream customm_kick03 vol = 200
					@PlayStream customm_kick04 vol = 200
				)
			else
				RandomNoRepeat(
					@PlayStream customf_kick01 vol = 200
					@PlayStream customf_kick02 vol = 200
					@PlayStream customf_kick03 vol = 200
					@PlayStream customf_kick04 vol = 200
				)
			endif
		endif
	endscript
	script HandleTurnOnSkaterLoopingSound
		SkaterLoopingSound_TurnOn
	endscript
	script HandleTerrainLandSound
		PlayLandSound
	endscript
	script HandleTerrainBonkSound
		PlayBonkSound
	endscript
	script HandleSoundEffectEvent
		Obj_PlaySound <name>
	endscript
	script HandleHitGroundSoundEffect
	endscript
	script HandleFootstepWalkSoundEffectEvent
		RandomNoRepeat(
			@Obj_PlaySound WalkStepConc01_11 pitch = RandomRange(97.0,102.0) vol = RandomRange(105.0,120.0)
			@Obj_PlaySound WalkStepConc03_11 pitch = RandomRange(97.0,102.0) vol = RandomRange(105.0,120.0)
			@Obj_PlaySound WalkStepConc05_11 pitch = RandomRange(97.0,102.0) vol = RandomRange(105.0,120.0)
		)
	endscript
	script HandlePedFootstepWalkSoundEffectEvent
		RandomNoRepeat(
			@Obj_PlaySound WalkStepConc01_11 pitch = RandomRange(97.0,102.0) vol = RandomRange(30.0,40.0)
			@Obj_PlaySound WalkStepConc03_11 pitch = RandomRange(97.0,102.0) vol = RandomRange(30.0,40.0)
			@Obj_PlaySound WalkStepConc05_11 pitch = RandomRange(97.0,102.0) vol = RandomRange(30.0,40.0)
		)
	endscript
	script HandleFootstepRunSoundEffectEvent
		RandomNoRepeat(
			@Obj_PlaySound RunStepConc01 pitch = RandomRange(97.0,102.0) vol = RandomRange(105.0,120.0)
			@Obj_PlaySound RunStepConc02 pitch = RandomRange(97.0,102.0) vol = RandomRange(105.0,120.0)
			@Obj_PlaySound RunStepConc03 pitch = RandomRange(97.0,102.0) vol = RandomRange(105.0,120.0)
			@Obj_PlaySound RunStepConc04 pitch = RandomRange(97.0,102.0) vol = RandomRange(105.0,120.0)
			@Obj_PlaySound RunStepConc05 pitch = RandomRange(97.0,102.0) vol = RandomRange(105.0,120.0)
		)
	endscript
	script HandlePedFootstepRunSoundEffectEvent
		RandomNoRepeat(
			@Obj_PlaySound RunStepConc01 pitch = RandomRange(97.0,102.0) vol = RandomRange(30.0,40.0)
			@Obj_PlaySound RunStepConc02 pitch = RandomRange(97.0,102.0) vol = RandomRange(30.0,40.0)
			@Obj_PlaySound RunStepConc03 pitch = RandomRange(97.0,102.0) vol = RandomRange(30.0,40.0)
			@Obj_PlaySound RunStepConc04 pitch = RandomRange(97.0,102.0) vol = RandomRange(30.0,40.0)
			@Obj_PlaySound RunStepConc05 pitch = RandomRange(97.0,102.0) vol = RandomRange(30.0,40.0)
		)
	endscript
	script HandleFootstepScuffSoundEffect
		RandomNoRepeat(
			@Obj_PlaySound ScuffStepConc01 pitch = RandomRange(85.0,102.0) vol = RandomRange(105.0,120.0)
			@Obj_PlaySound ScuffStepConc02 pitch = RandomRange(85.0,102.0) vol = RandomRange(105.0,120.0)
		)
	endscript
	script HandlePedFootstepScuffSoundEffect
		RandomNoRepeat(
			@Obj_PlaySound ScuffStepConc01 pitch = RandomRange(85.0,102.0) vol = RandomRange(30.0,40.0)
			@Obj_PlaySound ScuffStepConc02 pitch = RandomRange(85.0,102.0) vol = RandomRange(30.0,40.0)
		)
	endscript
	script HandleFootstepJumpSoundEffect
		Obj_PlaySound JumpStepConc01 pitch = RandomRange(97.0,102.0) vol = RandomRange(105.0,120.0)
	endscript
	script HandlePedFootstepJumpSoundEffect
		Obj_PlaySound JumpStepConc01 pitch = RandomRange(97.0,102.0) vol = RandomRange(30.0,40.0)
	endscript
	script HandleFootstepLandSoundEffect
		Obj_PlaySound LandStepConc02 pitch = RandomRange(97.0,102.0) vol = RandomRange(105.0,120.0)
	endscript
	script HandlePedFootstepLandSoundEffect
		Obj_PlaySound LandStepConc02 pitch = RandomRange(97.0,102.0) vol = RandomRange(30.0,40.0)
	endscript
	script HandleBailBodyFallSoundEffect
		RandomNoRepeat(
			@Obj_PlaySound BailBodyFall01 pitch = RandomRange(95.0,105.0) vol = RandomRange(90.0,100.0)
			@Obj_PlaySound BailBodyFall02 pitch = RandomRange(95.0,105.0) vol = RandomRange(90.0,100.0)
			@Obj_PlaySound BailBodyFall03 pitch = RandomRange(95.0,105.0) vol = RandomRange(90.0,100.0)
			@Obj_PlaySound BailBodyFall04 pitch = RandomRange(95.0,105.0) vol = RandomRange(90.0,100.0)
			@Obj_PlaySound BailBodyFall05 pitch = RandomRange(95.0,105.0) vol = RandomRange(90.0,100.0)
		)
	endscript
	script HandlePedBailBodyFallSoundEffect
		RandomNoRepeat(
			@Obj_PlaySound BailBodyFall01 pitch = RandomRange(95.0,105.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBodyFall02 pitch = RandomRange(95.0,105.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBodyFall03 pitch = RandomRange(95.0,105.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBodyFall04 pitch = RandomRange(95.0,105.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBodyFall05 pitch = RandomRange(95.0,105.0) vol = RandomRange(40.0,50.0)
		)
	endscript
	script HandleBailBodyPunchSoundEffect
		RandomNoRepeat(
			@Obj_PlaySound BailBodyPunch01_11 pitch = RandomRange(80.0,102.0) vol = RandomRange(140.0,150.0)
			@Obj_PlaySound BailBodyPunch02_11 pitch = RandomRange(80.0,102.0) vol = RandomRange(140.0,150.0)
			@Obj_PlaySound BailBodyPunch03_11 pitch = RandomRange(80.0,102.0) vol = RandomRange(140.0,150.0)
			@Obj_PlaySound BailBodyPunch04_11 pitch = RandomRange(80.0,102.0) vol = RandomRange(140.0,150.0)
			@Obj_PlaySound BailBodyPunch05_11 pitch = RandomRange(80.0,102.0) vol = RandomRange(140.0,150.0)
		)
	endscript
	script HandlePedBailBodyPunchSoundEffect
		RandomNoRepeat(
			@Obj_PlaySound BailBodyPunch01_11 pitch = RandomRange(80.0,102.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBodyPunch02_11 pitch = RandomRange(80.0,102.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBodyPunch03_11 pitch = RandomRange(80.0,102.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBodyPunch04_11 pitch = RandomRange(80.0,102.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBodyPunch05_11 pitch = RandomRange(80.0,102.0) vol = RandomRange(40.0,50.0)
		)
	endscript
	script HandleBailCrackSoundEffect
		Obj_PlaySound BailCrack01 pitch = RandomRange(100.0,110.0) vol = RandomRange(120.0,130.0)
	endscript
	script HandlePedBailCrackSoundEffect
		Obj_PlaySound BailCrack01 pitch = RandomRange(100.0,110.0) vol = RandomRange(40.0,50.0)
	endscript
	script HandleBailSlapSoundEffect
		printf "******playing bail slap sfx"
		RandomNoRepeat(
			@Obj_PlaySound BailSlap01 pitch = RandomRange(95.0,115.0) vol = RandomRange(140.0,150.0)
			@Obj_PlaySound BailSlap02 pitch = RandomRange(95.0,115.0) vol = RandomRange(140.0,150.0)
			@Obj_PlaySound BailSlap03 pitch = RandomRange(95.0,115.0) vol = RandomRange(140.0,150.0)
		)
	endscript
	script HandlePedBailSlapSoundEffect
		RandomNoRepeat(
			@Obj_PlaySound BailSlap01 pitch = RandomRange(95.0,115.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailSlap02 pitch = RandomRange(95.0,115.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailSlap03 pitch = RandomRange(95.0,115.0) vol = RandomRange(40.0,50.0)
		)
	endscript
	script HandleBailScrapeSoundEffect
		RandomNoRepeat(
			@Obj_PlaySound BailScrape01 pitch = RandomRange(95.0,115.0) vol = RandomRange(120.0,130.0)
			@Obj_PlaySound BailScrape02 pitch = RandomRange(95.0,115.0) vol = RandomRange(120.0,130.0)
			@Obj_PlaySound BailScrape03 pitch = RandomRange(95.0,115.0) vol = RandomRange(120.0,130.0)
		)
	endscript
	script HandlePedBailScrapeSoundEffect
		RandomNoRepeat(
			@Obj_PlaySound BailScrape01 pitch = RandomRange(95.0,115.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailScrape02 pitch = RandomRange(95.0,115.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailScrape03 pitch = RandomRange(95.0,115.0) vol = RandomRange(40.0,50.0)
		)
	endscript
	script HandleBailBoardSoundEffect
		RandomNoRepeat(
			@Obj_PlaySound BailBoard01 pitch = RandomRange(100.0,102.0) vol = RandomRange(115.0,125.0)
			@Obj_PlaySound BailBoard02 pitch = RandomRange(100.0,102.0) vol = RandomRange(115.0,125.0)
			@Obj_PlaySound BailBoard03 pitch = RandomRange(100.0,102.0) vol = RandomRange(115.0,125.0)
			@Obj_PlaySound BailBoard04 pitch = RandomRange(100.0,102.0) vol = RandomRange(115.0,125.0)
			@Obj_PlaySound BailBoard05 pitch = RandomRange(100.0,102.0) vol = RandomRange(115.0,125.0)
		)
	endscript
	script HandlePedBailBoardSoundEffect
		RandomNoRepeat(
			@Obj_PlaySound BailBoard01 pitch = RandomRange(100.0,102.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBoard02 pitch = RandomRange(100.0,102.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBoard03 pitch = RandomRange(100.0,102.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBoard04 pitch = RandomRange(100.0,102.0) vol = RandomRange(40.0,50.0)
			@Obj_PlaySound BailBoard05 pitch = RandomRange(100.0,102.0) vol = RandomRange(40.0,50.0)
		)
	endscript
