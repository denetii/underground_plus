	script Play_BMX_Anim
		Random(
			@
			TRG_BMX_Rider::Obj_PlayAnim anim = BS_Stall
			TRG_BMX_Bike::Obj_PlayAnim anim = BMX_BS_Stall
			@
			TRG_BMX_Rider::Obj_PlayAnim anim = Backflip
			TRG_BMX_Bike::Obj_PlayAnim anim = BMX_Backflip
			@
			TRG_BMX_Rider::Obj_PlayAnim anim = _180LateTurn
			TRG_BMX_Bike::Obj_PlayAnim anim = BMX_180LateTurn
			@
			TRG_BMX_Rider::Obj_PlayAnim anim = OneFooter
			TRG_BMX_Bike::Obj_PlayAnim anim = BMX_OneFooter
			@
			TRG_BMX_Rider::Obj_PlayAnim anim = _540
			TRG_BMX_Bike::Obj_PlayAnim anim = BMX_540
		)
	endscript
	script AI_BMX_Rider
		while
			Play_BMX_Anim
			Obj_WaitAnimFinished
			TRG_BMX_Rider::Obj_Rotate absolute = (0.0,-90.0,0.0)
			TRG_BMX_Bike::Obj_Rotate absolute = (0.0,-90.0,0.0)
			Play_BMX_Anim
			Obj_WaitAnimFinished
			TRG_BMX_Rider::Obj_Rotate absolute = (0.0,90.0,0.0)
			TRG_BMX_Bike::Obj_Rotate absolute = (0.0,90.0,0.0)
		repeat
	endscript
	script AI_BMX_Bike
	endscript
	script Skateshop_PedProInitialSetup
		GetNodeName
		Obj_SetPathVelocity 55 fps
		Obj_SetPathAcceleration 55 fpsps
		Obj_PathHeading Off
		Obj_SpawnScript Skateshop_PedProDistanceCheck
		Obj_MoveToNode name = <nodename> orient
	endscript
	script Skateshop_PedProStartRun
		if NOT LevelIs load_skateshop
			Obj_PlayAnim anim = StandIdleFromPedIdle
			Obj_WaitAnimFinished
			Obj_MoveToNode name = <Path> time = 0.81 second
			Obj_PlayAnim anim = DropIn_Ped
			Obj_SetPathAcceleration 43 fpsps
			Obj_FollowPath name = <dropin>
			Skateshop_PedProPlayLandSound
			Obj_Rotate relative = (90.0,0.0,0.0)
		else
			Obj_PlayAnim anim = StandIdleFromPedIdle
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = DropInApproach
			Obj_WaitAnimFinished
			Skateshop_PedProPlayLandSound
			Obj_PlayAnim anim = <DropInAnim>
			Obj_WaitAnimFinished
			Obj_SetPathAcceleration 43000 fpsps
			Obj_MoveToNode name = <start>
			Obj_Flip
			Obj_FollowPath name = <start>
		endif
		Obj_SpawnScript Skateshop_PedProIncreaseAcceleration
		Obj_WaitAnimFinished
		wait 1 frame
		Obj_PlayAnim anim = Crouchidle Cycle
		Obj_WaitMove
	endscript
	script Skateshop_PedProIncreaseAcceleration
		wait 1 second
		Obj_SetPathAcceleration 555 fpsps
	endscript
	script Skateshop_PedProCrossBottom
		Skateshop_PedProNormalBottom Path = <Path>
	endscript
	script Skateshop_PedProNormalBottom
		Obj_PlayAnim anim = Random(@CrouchedLand @SketchyCrouchLand speed = 1.39999998)
		Obj_FollowPath name = <Path>
		Obj_WaitAnimFinished
		Obj_PlayAnim anim = Crouchidle Cycle
		Obj_WaitMove
	endscript
	script Skateshop_PedProManualBottom
		Obj_PlayAnim anim = RevertFS speed = 1.39999998
		Obj_FollowPath name = <Path>
		Obj_Playsound RevertWood pitch = Random(@90 @100 @110)
		Obj_WaitAnimFinished
		Obj_PlayAnim anim = Manual
		Obj_WaitAnimFinished
		Obj_PlayAnim anim = Manual_Range from = 40 to = 1
		Obj_WaitMove
	endscript
	script Skateshop_PedProTransfer
		Obj_MoveToNode name = <Path4> speed = 10
		Skateshop_PedProDoJumpTrick
		Skateshop_PedProNormalBottom Path = <Path4>
		Skateshop_PedProDoJumpTrick
		Skateshop_PedProNormalBottom Path = <Path3>
		Obj_MoveToNode name = <Path2> speed = 10
		Skateshop_PedProDoJumpTrick
	endscript
	script Skateshop_PedProGrind
		Obj_Playsound GrindMetalOn
		Obj_MoveToNode name = <Path4> speed = 10
		Obj_PlayAnim anim = Init_FiftyFifty from = 20 to = end
		Skateshop_PedProRotateDown
		Obj_WaitRotate
		Obj_RotY angle = 90 speed = 800
		Obj_WaitMove
		Obj_StopSound
		Obj_Playsound GrindMetalOff
		Obj_RotY angle = 90 speed = 800
		Skateshop_PedProRotateDown
		Skateshop_PedProManualBottom Path = <Path4>
		Skateshop_PedProDoJumpTrick
		Skateshop_PedProManualBottom Path = <Path3>
		Obj_Playsound GrindMetalOn
		Obj_MoveToNode name = <Path2> speed = 10
		Obj_PlayAnim anim = Init_FiftyFifty from = 20 to = end
		Skateshop_PedProRotateDown
		Obj_WaitRotate
		Obj_RotY angle = -90 speed = 800
		Obj_WaitMove
		Obj_StopSound
		Obj_Playsound GrindMetalOff
		Obj_RotY angle = -90 speed = 800
		Skateshop_PedProRotateDown
	endscript
	script Skateshop_PedProDoTrick
		Obj_ShadowOff
		Random(@@@@@@Skateshop_PedPlayProCongrats)
		Random(
			@Skateshop_PedProDoJumpTrick
			@Skateshop_PedProDoJumpTrick
			@Skateshop_PedProDoJumpTrick
			@Skateshop_PedProDoLipTrick Path = <Path>
		)
		Skateshop_PedProPlayLandSound
		Obj_ShadowOn
	endscript
	script Skateshop_PedProPlayLandSound
		if LevelIs load_skateshop
			if NOT ScreenElementExists id = kill_skating_sounds_anchor
				Obj_Playsound Random(@landWood @landWood2 @landWood3) pitch = Random(@90 @100 @110)
			endif
		endif
	endscript
	script Skateshop_PedProDoLipTrick
		Random(
			@
			Obj_PlayAnim anim = MuteInvert_Init
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = MuteInvert_Range from = 20 to = end
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = MuteInvert_Out
			@
			Obj_PlayAnim anim = OneFootInvert_Init
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = OneFootInvert_Range from = 20 to = end
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = OneFootInvert_Out
			@
			Obj_PlayAnim anim = BSFootplant_Init
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = BSFootplant_Range from = 20 to = end
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = BSFootplant_Out
			@
			Obj_PlayAnim anim = NoseTailStall_Init
			if NOT ScreenElementExists id = kill_skating_sounds_anchor
				Obj_Playsound copinghit3_11 pitch = Random(@90 @100 @110)
			endif
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = NoseTailStall_Range from = 20 to = end
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = NoseTailStall_Out
			@
			Obj_PlayAnim anim = FS180Noseblunt_Init
			Obj_WaitAnimFinished
			if NOT ScreenElementExists id = kill_skating_sounds_anchor
				Obj_Playsound copinghit3_11 pitch = Random(@90 @100 @110)
			endif
			Obj_PlayAnim anim = FS180Noseblunt_Range from = 20 to = end
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = FS180Noseblunt_Out
		)
		wait 25 frames
		Obj_SetPathAcceleration 55 fpsps
		Obj_FollowPath name = <Path>
		Obj_WaitAnimFinished
		Obj_SetPathAcceleration 555 fpsps
		Obj_Flip
		Obj_Rotate relative = (0.0,180.0,0.0)
	endscript
	script Skateshop_PedProDoJumpTrick
		Random(
			@Obj_RotY angle = 180 speed = 180
			@Obj_RotY angle = 180 speed = 180
			@Obj_RotY angle = 180 speed = 180
			@Obj_RotY angle = 180 speed = 180
			@Obj_RotY angle = 180 speed = 180
			@Obj_RotY angle = 180 speed = 180
			@Obj_RotY angle = 540 speed = 400
			@Obj_RotY angle = 900 speed = 700
			@Obj_RotY angle = -180 speed = 180
			@Obj_RotY angle = -180 speed = 180
			@Obj_RotY angle = -180 speed = 180
			@Obj_RotY angle = -180 speed = 180
			@Obj_RotY angle = -180 speed = 180
			@Obj_RotY angle = -180 speed = 180
			@Obj_RotY angle = -540 speed = 400
			@Obj_RotY angle = -900 speed = 700
		)
		if LevelIs load_skateshop
			if NOT ScreenElementExists id = kill_skating_sounds_anchor
				Obj_Playsound Random(@OllieWood @OllieWood2 @OllieWood3) pitch = Random(@90 @100 @110)
			endif
		endif
		Obj_PlayAnim anim = Random(@FastPlant @NoComply @BeanPlant) speed = 1.5
		Obj_Jump gravity = -400 speed = 350
		Obj_WaitAnimFinished
		Random(
			@
			while
				Obj_PlayAnim anim = Random(@Impossible @HeelFlip @KickFlip @HardFlip @VarialKickFlip @VarialHeelFlip) speed = 1.5
				Obj_WaitAnimFinished
			repeat 3
			@
			Obj_PlayAnim anim = NoseGrab
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = NoseGrab backwards
			@
			Obj_PlayAnim anim = Method
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = Method backwards
			@
			Obj_PlayAnim anim = Benihana
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = Benihana backwards
			@
			Obj_PlayAnim anim = RocketAir
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = RocketAir backwards
			@
			Obj_PlayAnim anim = JapanAir
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = JapanAir backwards
			@
			Obj_PlayAnim anim = Stiffy
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = Stiffy backwards
			@
			Obj_PlayAnim anim = CrossBone
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = CrossBone backwards
			@
			Obj_PlayAnim anim = IndyDelMar
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = IndyDelMar backwards
			@
			Obj_PlayAnim anim = CannonBall
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = CannonBall backwards
			@
			Obj_PlayAnim anim = CrookedCop
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = CrookedCop backwards
			@
			Obj_PlayAnim anim = OneFootJapan
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = OneFootJapan backwards
		)
		Obj_WaitJumpFinished
	endscript
	script Skateshop_PedProEndRun
		GetNodeName
		Obj_PlayAnim anim = ExitHalfPipe
		Obj_Rotate relative = (90.0,0.0,0.0)
		wait 15 frames
		Obj_MoveToNode name = <nodename> speed = 10
		Obj_WaitAnimFinished
		Obj_Flip
		Obj_LookAtNode name = <Node> time = 1
		Obj_PlayAnim anim = StandIdleRotate Cycle
		wait 1 seconds
		Obj_MoveToNode name = <nodename> orient
		Obj_PlayAnim anim = StandIdleToPedIdle
		Obj_WaitAnimFinished
		Obj_SetPathAcceleration 55 fpsps
	endscript
	script Skateshop_PedProRotateUp speed = 400
		Obj_WaitRotate
		Obj_RotX angle = -90 speed = 400
	endscript
	script Skateshop_PedProRotateDown
		Obj_WaitRotate
		Obj_RotX angle = 90 speed = 400
	endscript
	script Skateshop_PedPlayProCongrats
		if NOT ScreenElementExists id = select_skater_anchor
			if LevelIs load_skateshop
				Obj_Playstream RandomNoRepeat(
					@andrew_success08
					@andrew_success10
					@chad_success01
					@chad_success05
					@chad_success12
					@chad_success45
					@elissa_success08
					@elissa_success09
					@elissa_success13
					@elissa_success27
					@eric_success02
					@eric_success21
					@eric_success28
					@geoff_success09
					@geoff_success20
					@geoff_success22
					@jamie_success18
					@jamie_success22
					@jamie_success28
					@jamie_success29
					@steve_success04
					@tony_success03
					@tony_success04
					@tony_success12
					@tony_success19
				)
			endif
		endif
	endscript
	script Skateshop_PedProDistanceCheck
		while
			wait 1 frame
			if Obj_ObjectInRadius radius = 3 feet type = skater
				if LevelIs load_skateshop
					if NOT ScreenElementExists id = select_skater_anchor
						PlayStream RandomNoRepeat(
							@Bucky_Avoid01
							@Bucky_Avoid02
							@Bucky_Avoid03
							@Bucky_Avoid04
							@Bucky_Avoid05
							@Bucky_Avoid06
							@Bucky_Avoid07
							@Bucky_Avoid08
							@Bucky_Avoid09
							@Rodney_Avoid01
							@Rodney_Avoid02
							@Rodney_Avoid03
							@Rodney_Avoid04
							@Steve_Avoid01
							@Steve_Avoid02
							@Steve_Avoid03
							@Steve_Avoid04
							@Steve_Avoid05
							@Steve_Avoid06
							@Steve_Avoid07
							@Steve_Avoid08
							@Steve_Avoid09
							@Steve_Avoid010
							@Steve_Avoid011
							@Steve_Avoid012
							@Steve_Avoid013
							@Steve_Avoid014
							@Steve_Avoid015
							@Tony_Avoid01
							@Tony_Avoid02
							@Tony_Avoid03
							@Tony_Avoid04
							@Tony_Avoid05
							@Tony_Avoid06
							@Tony_Avoid07
							@Tony_Avoid08
							@Tony_Avoid09
							@Tony_Avoid010
						) volume = Random(@30 @50 @90) dropoff = 500
						wait 5 seconds
					endif
				endif
			endif
		repeat
	endscript
	script Ped_AI_Skater Path = TRG_Ped_AI_SkaterNav01
		GetNodeName
		Obj_SetPathVelocity 35 fps
		Obj_SetPathAcceleration 55 fpsps
		Obj_PathHeading On
		Obj_StickToGround distAbove = 3 distBelow = 16
		Obj_SetPathTurnDist 10 feet
		Obj_MoveToNode name = <nodename> orient
		Obj_SetPathAcceleration 43 fpsps
		Obj_FollowPathLinked
		Obj_PlayAnim anim = Crouchidle Cycle
	endscript
	script ai_printf
		if IsTrue ai_debug
			printf <...>
		endif
	endscript
	script Ped_AI_Skater_GroundTrick
		ai_printf "AI skater doing ground trick"
		Ped_AI_Skater_FlipTrick
		Ped_AI_Skater_Land
		Obj_PlayAnim anim = Crouchidle Cycle
	endscript
	script Ped_AI_Skater_JumpTo
		ai_printf "AI skater jumping up"
		Obj_StickToGround Off
		Obj_Playsound OllieConc pitch = Random(@90 @100 @110)
		Obj_PlayAnim anim = Random(@Ollie @FastPlant @NoComply @BeanPlant) speed = 1.5
		Obj_WaitAnimFinished
		Obj_PlayAnim anim = AirIdle Cycle
	endscript
	script Ped_AI_Skater_StartGrind
		ai_printf "AI skater starting grind"
		Obj_SetPathVelocity 45 fps
		Obj_Playsound GrindMetalOn pitch = Random(@90 @100 @110)
		Random(
			@Ped_AI_Skater_Grind init = Init_FiftyFifty range = FiftyFifty_Range
			@Ped_AI_Skater_Grind init = Init_TailSlide range = TailSlide_Range
		)
	endscript
	script Ped_AI_Skater_Grind
		Obj_PlayAnim anim = <init>
		Obj_WaitAnimFinished
		Obj_PlayAnim anim = <range> from = 40 to = 20
		Obj_WaitAnimFinished
		while
			ai_printf "AI skater grinding"
			Obj_PlayAnim anim = <range> from = 20 to = 60
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = <range> from = 60 to = 20
			Obj_WaitAnimFinished
		repeat
	endscript
	script Ped_AI_Skater_StartManual
		ai_printf "AI skater starting manual"
		Obj_SetPathVelocity 25 fps
		Obj_StickToGround On
		Random(
			@Ped_AI_Skater_Manual init = Manual range = Manual_Range
			@Ped_AI_Skater_Manual init = NoseManual range = NoseManual_Range
		)
	endscript
	script Ped_AI_Skater_Manual
		Obj_PlayAnim anim = <init>
		Obj_WaitAnimFinished
		Obj_PlayAnim anim = <range> from = 40 to = 20
		Obj_WaitAnimFinished
		while
			ai_printf "AI skater Manualing"
			Obj_PlayAnim anim = <range> from = 20 to = 60
			Obj_WaitAnimFinished
			Obj_PlayAnim anim = <range> from = 60 to = 20
			Obj_WaitAnimFinished
		repeat
	endscript
	script Ped_AI_Skater_FlipTrick
		ai_printf "AI skater doing grind hop trick"
		Obj_PathHeading Off
		Obj_Playsound OllieConc pitch = Random(@90 @100 @110)
		Random(
			@
			@Obj_RotY angle = 360 speed = 360
			@Obj_RotY angle = -360 speed = 360
		)
		Obj_PlayAnim anim = Random(@Ollie @FastPlant @NoComply @BeanPlant) speed = 1.5
		Obj_Jump gravity = -420 speed = 200
		Obj_WaitAnimFinished
		ai_printf "AI skater doing grind hop trick2"
		Obj_PlayAnim anim = Random(@Impossible @HeelFlip @KickFlip @HardFlip @VarialKickFlip @VarialHeelFlip) speed = 1.5
		Obj_WaitAnimFinished
		Obj_WaitJumpFinished
		Obj_PathHeading On
	endscript
	script Ped_AI_Skater_Land
		ai_printf "AI skater landing"
		Obj_Playsound LandConc pitch = Random(@90 @100 @110)
		Obj_SetPathVelocity 35 fps
		Obj_StickToGround On
		Obj_PathHeading On
		Obj_PlayAnim anim = Random(@CrouchedLand @SketchyCrouchLand speed = 1.39999998)
		Obj_WaitJumpFinished
		Obj_PlayAnim anim = Crouchidle Cycle
	endscript
	script Ped_AI_Skater_GrindHopTrickGrind
		Obj_Playsound GrindMetalOff pitch = Random(@90 @100 @110)
		Ped_AI_Skater_FlipTrick
		Ped_AI_Skater_StartGrind
	endscript
	script Ped_AI_Skater_GrindHopTrickManual
		Obj_Playsound GrindMetalOff
		Ped_AI_Skater_FlipTrick
		Ped_AI_Skater_Land
		Ped_AI_Skater_StartManual
	endscript
	script Ped_AI_Skater_ManualHopTrickManual
		Ped_AI_Skater_FlipTrick
		Ped_AI_Skater_Land
		Ped_AI_Skater_StartManual
	endscript
