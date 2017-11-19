
	script Basketball Shotcounter = 10 ShotsMade = 0
		Skiptrack
		if Flipped
			Flip
		endif
		ClearExceptions
		DisablePlayerInput
		SetRollingFriction 1000
		PlayAnim Anim = Ped_BP_DribbleInPlace Cycle
		Create_Speech_box {text = ["Basketballer:\n 'sup dog. I bet you fitty bucks you can't make 8 shots in 10 tries. "
				"Hold \b3 to shoot, release \b3 at the very top of your jump to bust a 3 pointer. \n"
				"Press \b1 at any time to wuss out, punk."
			]
			pos = (320.0,240.0)
		}
		while
			if Held X
				GotoPreserveParams Basketball_OnGround
			endif
			if Held Square
				speech_box_exit
				Goto SkaterInit
			endif
			WaitOneGameFrame
		repeat
	endscript
	script Basketball_OnGround
		ClearTrickQueue
		ClearEventBuffer
		SetRollingFriction 1000
		if NOT GotParam Shotcounter
			Shotcounter = 10
		endif
		if (<Shotcounter> < 1)
			if (<ShotsMade> < 9)
				Goto Basketball_PlayAgain
			else
				Goto Basketball_YouWin
			endif
		endif
		while
			PlayAnim Anim = Ped_BP_DribbleInPlace Cycle NoRestart
			if Held X
				GotoPreserveParams Basketball_InAir
			endif
			if Held Square
				Goto OnGroundAi
			endif
			WaitOneGameFrame
		repeat
	endscript
	script Basketball_InAir
		ClearExceptions
		PlayAnim Anim = Ped_BP_ShootBall To = 80
		while
			if released X
				<Shotcounter> = (<Shotcounter> - 1)
				Update_ShotCounter <...>
				Trick_MissShot
				WaitAnimFinished
				GotoPreserveParams Basketball_OnGround
			endif
			Wait 1 Frame
		repeat 20
		while
			if released X
				Trick_MakeShot
				<ShotsMade> = (<ShotsMade> + 1)
				<Shotcounter> = (<Shotcounter> - 1)
				Update_ShotCounter <...>
				WaitAnimFinished
				GotoPreserveParams Basketball_OnGround
			endif
			Wait 1 Frame
		repeat 3
		while
			if released X
				<Shotcounter> = (<Shotcounter> - 1)
				Update_ShotCounter <...>
				Trick_MissShot
				WaitAnimFinished
				GotoPreserveParams Basketball_OnGround
			endif
			Wait 1 Frame
		repeat 20
		WaitAnimFinished
		<Shotcounter> = (<Shotcounter> - 1)
		Update_ShotCounter <...>
		Trick_DidNotShoot
		while
			if released X
				GotoPreserveParams Basketball_OnGround
			else
				PlayAnim Anim = Ped_BP_DribbleInPlace Cycle NoRestart
			endif
			WaitOneGameFrame
		repeat
	endscript
	script Update_ShotCounter
		<TotalShots> = (10 - <Shotcounter>)
		FormatText TextName = Baskets_scored "%m for %s" s = <TotalShots> m = <ShotsMade>
		Create_panel_message id = Shotcounter pos = (80.0,240.0) text = <Baskets_scored>
	endscript
	script Trick_MakeShot
		Create_panel_message text = " " id = bball time = 1
		Wait 1 Frame
		Create_panel_message rgba = [32 144 32 100] pos = (320.0,80.0) id = bball Random(@text = "Nice!" @text = "He shoots he scores!" @text = "Bucket!" @text = "Nice!" @text = "Swish!")
	endscript
	script Trick_MissShot
		Create_panel_message text = " " id = bball time = 1
		Wait 1 Frame
		Create_panel_message id = bball pos = (320.0,80.0) Random(@text = "Airball!" @text = "CLANG!" @text = "Weak..." @text = "Brick!")
	endscript
	script Trick_DidNotShoot
		Create_panel_message text = " " id = bball time = 1
		Wait 1 Frame
		Create_panel_message id = bball pos = (320.0,80.0) text = "Release X to shoot, moron!"
	endscript
	script Basketball_PlayAgain
		<Shotcounter> = 10
		<ShotsMade> = 0
		PlayAnim Anim = Ped_M_Disgust
		WaitAnimFinished
		PlayAnim Anim = Ped_BP_DribbleInPlace Cycle
		Create_Speech_box {text = ["Basketballer:\n Man, get your sorry ass out of here."
				" If you still got game, press \b3 to go again, or else press "
				"\b1 to get lost."]
			pos = (320.0,240.0)}
		Debounce X
		while
			if Held X
				GotoPreserveParams Basketball_OnGround
			endif
			if Held Square
				speech_box_exit
				Goto OnGroundAi
			endif
			WaitOneGameFrame
		repeat
	endscript
	script Basketball_YouWin
		<Shotcounter> = 10
		<ShotsMade> = 0
		PlayAnim Anim = Ped_M_Cheering
		WaitAnimFinished
		PlayAnim Anim = Ped_BP_DribbleInPlace Cycle
		Create_Speech_box {text = ["Basketballer:\n Daaaaaamn. You was raisin' up sumthin' righteous. Here's fitty - "
				"press \b3 to go again or \b1 to bolt."]
			pos = (320.0,240.0)}
		GoalMAnager_AddCash 50
		PlaySound cash Vol = 130
		Debounce X
		while
			if Held X
				GotoPreserveParams Basketball_OnGround
			endif
			if Held Square
				speech_box_exit
				Goto OnGroundAi
			endif
			WaitOneGameFrame
		repeat
	endscript
	script Kill_Speech_Box
		if ObjectExists id = speech_box_anchor
			DestroyScreenElement id = speech_box_anchor
		endif
	endscript
	script WaitOnGroundWhilstChecking
		while
			DoNextTrick
			if OnGround
				break
			endif
			WaitOneGameFrame
		repeat
	endscript
	script WaitFramesWhilstChecking Frames = 60
		while
			DoNextTrick
			Wait 1 Frame
		repeat <Frames>
	endscript
	script Basketball2
		PlaySkaterCamAnim name = MG_BBallTop play_hold
		SwitchOffBoard
		Obj_VarSet var = 0 value = 4
		printf "blah blah blah"
		kill prefix = "TRG_Ped_BB_"
		create name = TRG_PedBB_MG_D
		create name = MG_BB_Box
		Skiptrack
		if Flipped
			Flip
		endif
		Obj_SetFlag OBJFLAG_BBALL_IDLE
		ClearExceptions
		SpawnSkaterScript MG_BB_Anims
		DisablePlayerInput
		SetRollingFriction 1000
		if NOT IsAlive name = TRG_MG_BB_AnimControl
			create name = TRG_MG_BB_AnimControl
		endif
		SendFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_IDLE
		Create_Speech_box {text = ["Basketballer:\n So the little skateboarder thinks he can hold his own?! "
				"Hold \b3 to shoot, release \b3 when it looks like the shot is on. \n"
				"Press \b1 at any time to wuss out, punk."]
			pos = (320.0,240.0)}
		while
			PlayAnim Anim = Ped_BP_DribbleInPlace Cycle
			Wait 30 Frames
			while
				if Held X
					if IsAlive name = TRG_MG_BBall_GameBall
					else
						ClearFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_IDLE
						ClearFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_RUN
						SendFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_SHOOTING
						Rotate duration = 10 Frame node = TRG_MG_BBall_GameBall
						Obj_PlayAnim Anim = Ped_BP_ShootBall
						create name = TRG_MG_BBall_GameBall
						PlaySound sch_tennis_11
						SpawnSkaterScript MG_BBall_TakeShot
						while
							if QueryFlag OBJFLAG_BBALL_SHOOTING name = TRG_MG_BB_AnimControl
								break
							endif
							Wait 1 Frame
						repeat
					endif
				endif
				if Held Left
					if Obj_VarEq var = 0 value = 1
						MG_BB_RunToLeft node = TRG_MG_BB_MoveTo01
					endif
					if Obj_VarEq var = 0 value = 2
						MG_BB_RunToLeft node = TRG_MG_BB_MoveTo02
					endif
					if Obj_VarEq var = 0 value = 3
						MG_BB_RunToLeft node = TRG_MG_BB_MoveTo03
					endif
					if Obj_VarEq var = 0 value = 4
						MG_BB_RunToLeft node = TRG_MG_BB_MoveTo04
					endif
					if Obj_VarEq var = 0 value = 5
						MG_BB_RunToLeft node = TRG_MG_BB_MoveTo05
					endif
					if Obj_VarEq var = 0 value = 6
						MG_BB_RunToLeft node = TRG_MG_BB_MoveTo06
					endif
					if Obj_VarEq var = 0 value = 7
						MG_BB_RunToLeft node = TRG_MG_BB_MoveTo07
					endif
					if Obj_VarEq var = 0 value = 8
						MG_BB_RunToLeft node = TRG_MG_BB_MoveTo07
					endif
				endif
				if Held Right
					if Obj_VarEq var = 0 value = 1
						MG_BB_RunToRight node = TRG_MG_BB_MoveTo02
					endif
					if Obj_VarEq var = 0 value = 2
						MG_BB_RunToRight node = TRG_MG_BB_MoveTo03
					endif
					if Obj_VarEq var = 0 value = 3
						MG_BB_RunToRight node = TRG_MG_BB_MoveTo04
					endif
					if Obj_VarEq var = 0 value = 4
						MG_BB_RunToRight node = TRG_MG_BB_MoveTo05
					endif
					if Obj_VarEq var = 0 value = 5
						MG_BB_RunToRight node = TRG_MG_BB_MoveTo06
					endif
					if Obj_VarEq var = 0 value = 6
						MG_BB_RunToRight node = TRG_MG_BB_MoveTo07
					endif
					if Obj_VarEq var = 0 value = 7
						MG_BB_RunToRight node = TRG_MG_BB_MoveTo08
					endif
					if Obj_VarEq var = 0 value = 8
						MG_BB_RunToRight node = TRG_MG_BB_MoveTo08
					endif
				endif
				if Held Square
					kill prefix = "TRG_MG_BB_AnimControl"
					kill prefix = "TRG_PedBB_MG_D"
					kill prefix = "MG_BB_Box"
					PlaySkaterCamAnim skater = 0 stop
					SetRollingFriction 1
					Enableplayerinput
					create prefix = "TRG_Ped_BB_"
					MakeSkaterGoto SkaterInit
					speech_box_exit
					break
				endif
				Wait 1 Frame
			repeat
			Obj_WaitAnimFinished
		repeat
	endscript
	script Sch_MG_BBallShootCheck
		Obj_ClearFlag OBJFLAG_BBALL_TOOKSHOT
		while
			Obj_MoveToRelPos (0.0,5.0,0.0)
			Wait 1 Frame
			Create_panel_message id = bball_shot text = "early"
			if Obj_FlagSet OBJFLAG_BBALL_TOOKSHOT
				Obj_ClearFlag OBJFLAG_BBALL_TOOKSHOT
				Goto Sch_MG_BBallShotEarly
			endif
		repeat 22
		while
			Obj_MoveToRelPos (0.0,5.0,0.0)
			Wait 1 Frame
			Create_panel_message id = bball_shot text = "!!!!NOW!!!!!"
			if Obj_FlagSet OBJFLAG_BBALL_TOOKSHOT
				Obj_ClearFlag OBJFLAG_BBALL_TOOKSHOT
				Goto Sch_MG_BBallShotOn
			endif
		repeat 5
		while
			Obj_MoveToRelPos (0.0,5.0,0.0)
			Wait 1 Frame
			Create_panel_message id = bball_shot text = "late"
			if Obj_FlagSet OBJFLAG_BBALL_TOOKSHOT
				Obj_ClearFlag OBJFLAG_BBALL_TOOKSHOT
				Goto Sch_MG_BBallShotLate
			endif
		repeat 7
		Create_panel_message id = bball_shot text = " "
		Goto Sch_MG_BBallShotLate
		SendFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_IDLE
		ClearFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_SHOOTING
		Die
	endscript
	script Sch_MG_BBallShotEarly
		Create_panel_message id = bball_shot text = "EARLY"
		SendFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_IDLE
		ClearFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_SHOOTING
		Die
	endscript
	script Sch_MG_BBallShotOn
		Create_panel_message id = bball_shot text = "RIGHT ON!"
		SpawnSkaterScript Sch_BB_Sound_BallMake id = MG_BBallSound
		SendFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_IDLE
		ClearFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_SHOOTING
		Die
	endscript
	script Sch_MG_BBallShotLate
		Create_panel_message id = bball_shot text = "LATE"
		SendFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_IDLE
		ClearFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_SHOOTING
		Die
	endscript
	script MG_BBall_TakeShot
		while
			if released X
				if IsAlive name = TRG_MG_BBall_GameBall
					SendFlag name = TRG_MG_BBall_GameBall OBJFLAG_BBALL_TOOKSHOT
					break
				endif
			endif
			Wait 1 Frame
		repeat 50
	endscript
	script MG_BB_RunToLeft node = TRG_MG_BB_MoveTo01
		Rotate duration = 3 Frame node = <node>
		Move z = 5
		SendFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_MOVING
		Obj_GetDistToNode <node>
		if (<dist> < 50)
			printf "Obj_VarDec"
			Obj_VarDec var = 0
			MG_BB_CehckVarSendFlag
		endif
	endscript
	script MG_BB_RunToRight node = TRG_MG_BB_MoveTo08
		Rotate duration = 2 Frame node = <node>
		Move z = 5
		SendFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_MOVING
		Obj_GetDistToNode <node>
		if (<dist> < 50)
			printf "Obj_VarInc"
			Obj_VarInc var = 0
			MG_BB_CehckVarSendFlag
		endif
	endscript
	script MG_BB_ClearFlags
		ClearFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV1
		ClearFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV2
		ClearFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV3
		ClearFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV4
		ClearFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV5
		ClearFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV6
		ClearFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV7
		ClearFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV8
	endscript
	script MG_BB_CehckVarSendFlag
		if Obj_VarEq var = 0 value = 0
			Obj_VarSet var = 0 value = 1
			MG_BB_ClearFlags
			SendFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV1
		endif
		if Obj_VarEq var = 0 value = 1
			MG_BB_ClearFlags
			SendFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV1
		endif
		if Obj_VarEq var = 0 value = 2
			MG_BB_ClearFlags
			SendFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV2
		endif
		if Obj_VarEq var = 0 value = 3
			MG_BB_ClearFlags
			SendFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV3
		endif
		if Obj_VarEq var = 0 value = 4
			MG_BB_ClearFlags
			SendFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV4
		endif
		if Obj_VarEq var = 0 value = 5
			MG_BB_ClearFlags
			SendFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV5
		endif
		if Obj_VarEq var = 0 value = 6
			MG_BB_ClearFlags
			SendFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV6
		endif
		if Obj_VarEq var = 0 value = 7
			MG_BB_ClearFlags
			SendFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV7
		endif
		if Obj_VarEq var = 0 value = 8
			MG_BB_ClearFlags
			SendFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV8
		endif
		if Obj_VarEq var = 0 value = 9
			MG_BB_ClearFlags
			Obj_VarSet var = 0 value = 8
			SendFlag name = TRG_PedBB_MG_D OBJFLAG_BBALL_MOVETONAV8
		endif
	endscript
	script Sch_MG_BB_GotToNav01
		printf "got to nave 01"
	endscript
	script MG_BB_AnimControl
		while
			printf "MG BB anim controller"
			Wait 1 second
		repeat
	endscript
	script MG_BB_AnimsEnd
		if IsAlive name = TRG_MG_BB_AnimControl
			ClearFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_MOVING
		endif
		Wait 1 Frame
		Goto MG_BB_Anims
	endscript
	script MG_BB_SetIdle
		if IsAlive name = TRG_MG_BB_AnimControl
			ClearFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_RUN
			SendFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_IDLE
		endif
	endscript
	script MG_BB_SetRun
		if IsAlive name = TRG_MG_BB_AnimControl
			SendFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_RUN
			ClearFlag name = TRG_MG_BB_AnimControl OBJFLAG_BBALL_IDLE
		endif
	endscript
	script MG_BB_Anims
		Wait 1 Frame
		while
			if IsAlive name = TRG_MG_BB_AnimControl
				if QueryFlag OBJFLAG_BBALL_SHOOTING name = TRG_MG_BB_AnimControl
				else
					if QueryFlag OBJFLAG_BBALL_IDLE name = TRG_MG_BB_AnimControl
						if QueryFlag OBJFLAG_BBALL_MOVING name = TRG_MG_BB_AnimControl
							PlayAnim Anim = Ped_BP_DribbleRunFromIdle Speed = 5 NoRestart Blendperiod = 0.30000001
							WaitAnimFinished
							MG_BB_SetRun
							Goto MG_BB_AnimsEnd
						else
							Rotate duration = 10 Frame node = TRG_MG_BBall_GameBall
							PlayAnim Anim = Ped_BP_DribbleInPlace Cycle NoRestart
							MG_BB_SetIdle
							Goto MG_BB_AnimsEnd
						endif
					endif
					if QueryFlag OBJFLAG_BBALL_RUN name = TRG_MG_BB_AnimControl
						if QueryFlag OBJFLAG_BBALL_MOVING name = TRG_MG_BB_AnimControl
							PlayAnim Anim = Ped_BP_DribbleRun Cycle NoRestart
							MG_BB_SetRun
							Goto MG_BB_AnimsEnd
						else
							Rotate duration = 10 Frame node = TRG_MG_BBall_GameBall
							PlayAnim Anim = Ped_BP_DribbleRunToIdle Speed = 5 NoRestart Blendperiod = 0.30000001
							WaitAnimFinished
							MG_BB_SetIdle
							Goto MG_BB_AnimsEnd
						endif
					endif
				endif
			endif
			Wait 1 Frame
		repeat
	endscript
	script MG_BB_Defense_Goal
		Obj_StickToGround distAbove = 3 distBelow = 6
		Obj_SetPathTurnDist 2.5 feet
		Obj_StickToGround off
		Obj_SetConstantHeight
		Obj_PathHeading On
		Obj_SetPathVelocity 30 fps
		Obj_SetPathAcceleration 45 fpsps
		Obj_SetPathDeceleration 45 fpsps
		while
			Obj_PlayAnim Anim = Ped_BP_GuardPlayer Cycle
			while
				if Obj_FlagSet OBJFLAG_BBALL_MOVETONAV1
					Obj_ClearFlag OBJFLAG_BBALL_MOVETONAV1
					Wait Random(@10 Frames @20 Frames @30 Frames)
					Sch_BB_RunToNav Sch_BBall_Nav = TRG_Ped_BB_Blocker01
					Obj_LookAtNode name = TRG_MG_BB_MoveTo01
					break
				endif
				if Obj_FlagSet OBJFLAG_BBALL_MOVETONAV2
					Obj_ClearFlag OBJFLAG_BBALL_MOVETONAV2
					Wait Random(@10 Frames @20 Frames @30 Frames)
					Sch_BB_RunToNav Sch_BBall_Nav = TRG_Ped_BB_Blocker02
					Obj_LookAtNode name = TRG_MG_BB_MoveTo02
					break
				endif
				if Obj_FlagSet OBJFLAG_BBALL_MOVETONAV3
					Obj_ClearFlag OBJFLAG_BBALL_MOVETONAV3
					Wait Random(@10 Frames @20 Frames @30 Frames)
					Sch_BB_RunToNav Sch_BBall_Nav = TRG_Ped_BB_Blocker03
					Obj_LookAtNode name = TRG_MG_BB_MoveTo03
					break
				endif
				if Obj_FlagSet OBJFLAG_BBALL_MOVETONAV4
					Obj_ClearFlag OBJFLAG_BBALL_MOVETONAV4
					Wait Random(@10 Frames @20 Frames @30 Frames)
					Sch_BB_RunToNav Sch_BBall_Nav = TRG_Ped_BB_Blocker04
					Obj_LookAtNode name = TRG_MG_BB_MoveTo04
					break
				endif
				if Obj_FlagSet OBJFLAG_BBALL_MOVETONAV5
					Obj_ClearFlag OBJFLAG_BBALL_MOVETONAV5
					Wait Random(@10 Frames @20 Frames @30 Frames)
					Sch_BB_RunToNav Sch_BBall_Nav = TRG_Ped_BB_Blocker05
					Obj_LookAtNode name = TRG_MG_BB_MoveTo05
					break
				endif
				if Obj_FlagSet OBJFLAG_BBALL_MOVETONAV6
					Obj_ClearFlag OBJFLAG_BBALL_MOVETONAV6
					Wait Random(@10 Frames @20 Frames @30 Frames)
					Sch_BB_RunToNav Sch_BBall_Nav = TRG_Ped_BB_Blocker06
					Obj_LookAtNode name = TRG_MG_BB_MoveTo06
					break
				endif
				if Obj_FlagSet OBJFLAG_BBALL_MOVETONAV7
					Obj_ClearFlag OBJFLAG_BBALL_MOVETONAV7
					Wait Random(@10 Frames @20 Frames @30 Frames)
					Sch_BB_RunToNav Sch_BBall_Nav = TRG_Ped_BB_Blocker07
					Obj_LookAtNode name = TRG_MG_BB_MoveTo07
					break
				endif
				if Obj_FlagSet OBJFLAG_BBALL_MOVETONAV8
					Obj_ClearFlag OBJFLAG_BBALL_MOVETONAV8
					Wait Random(@10 Frames @20 Frames @30 Frames)
					Sch_BB_RunToNav Sch_BBall_Nav = TRG_Ped_BB_Blocker08
					Obj_LookAtNode name = TRG_MG_BB_MoveTo08
					break
				endif
				Wait 1 Frame
			repeat
		repeat
	endscript
	OBJFLAG_BBALL_TOOKSHOT = 0
	OBJFLAG_BBALL_MOVETONAV1 = 1
	OBJFLAG_BBALL_MOVETONAV2 = 2
	OBJFLAG_BBALL_MOVETONAV3 = 3
	OBJFLAG_BBALL_MOVETONAV4 = 4
	OBJFLAG_BBALL_MOVETONAV5 = 5
	OBJFLAG_BBALL_MOVETONAV6 = 6
	OBJFLAG_BBALL_MOVETONAV7 = 7
	OBJFLAG_BBALL_MOVETONAV8 = 8
	OBJFLAG_BBALL_MOVING = 9
	OBJFLAG_BBALL_IDLE = 10
	OBJFLAG_BBALL_RUN = 12
	OBJFLAG_BBALL_SHOOTING = 13
