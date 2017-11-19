
	script TestPedScript
		setTags obj_idle_state = "BHP"
		while
			getTags
			Random(
				@
				switch <obj_idle_state>
					case "RHP"
						Obj_CycleAnim anim = RHP_2_BHP
					case "BAX"
						Obj_CycleAnim anim = BAX_2_BHP
					case "LGH"
						Obj_CycleAnim anim = LGH_2_BHP speed = 0.5
				endswitch
				Random(
					@Obj_CycleAnim anim = BHP_Breathe
					@Obj_CycleAnim anim = BHP_Breathe NumCycles = Random(@1 @2)
					@Obj_CycleAnim anim = BHP_Scratch
					@Obj_CycleAnim anim = BHP_Point
					@Obj_CycleAnim anim = BHP_LookBack
					@
				)
				setTags obj_idle_state = "BHP"
				@
				switch <obj_idle_state>
					case "BHP"
						Random(
							@Obj_CycleAnim anim = BHP_2_RHP
							@Obj_CycleAnim anim = BHP_2_RHP_Chin
						)
					case "BAX"
						Obj_CycleAnim anim = RHP_2_BAX Backwards
					case "LGH"
						Obj_CycleAnim anim = RHP_2_LGH Backwards speed = 0.5
				endswitch
				Random(
					@Obj_CycleAnim anim = RHP_Breathe NumCycles = Random(@1 @2)
					@OBJ_Playstream KenHelp1
					Obj_CycleAnim anim = RHP_TalkTest
					@Obj_CycleAnim anim = RHP_FootTap NumCycles = Random(@1 @2 @3)
					@Obj_CycleAnim anim = RHP_Handsmack
				)
				setTags obj_idle_state = "RHP"
				@
				switch <obj_idle_state>
					case "BHP"
						Obj_CycleAnim anim = BAX_2_BHP from = end to = start
					case "RHP"
						Obj_CycleAnim anim = RHP_2_BAX
					case "LGH"
						Obj_CycleAnim anim = BAX_2_LGH Backwards speed = 0.69999999
				endswitch
				Random(
					@Obj_CycleAnim anim = BAX_Breathe NumCycles = Random(@1 @2)
					@Obj_CycleAnim anim = BAX_Nod NumCycles = Random(@1 @2)
				)
				setTags obj_idle_state = "BAX"
				@
				switch <obj_idle_state>
					case "BHP"
						Obj_CycleAnim anim = LGH_2_BHP Backwards
					case "RHP"
						Obj_CycleAnim anim = RHP_2_LGH
					case "BAX"
						Obj_CycleAnim anim = BAX_2_LGH
				endswitch
				Random(
					@Obj_CycleAnim anim = LGH_GutBuster NumCycles = Random(@1 @2)
					@Obj_CycleAnim anim = LGH_KneeSlapper speed = 0.75
					Obj_CycleAnim anim = LGH_GutBuster
					@Obj_CycleAnim anim = LGH_Pointing
					Obj_CycleAnim anim = LGH_GutBuster
					@Obj_CycleAnim anim = LGH_Giggle
					Obj_CycleAnim anim = LGH_GutBuster
					@Obj_CycleAnim anim = LGH_Wave
					Obj_CycleAnim anim = LGH_GutBuster
					@Obj_CycleAnim anim = LGH_Wave
					Obj_CycleAnim anim = LGH_GutBuster
				)
				setTags obj_idle_state = "LGH"
			)
		repeat
	endscript
	script PED_Sitting
		setTags obj_idle_state = "STND"
		while
			getTags
			Random(
				@*4 
				switch <obj_idle_state>
					case "STND"
						Obj_CycleAnim anim = PED_STND2SIT
					case "SITB"
						Obj_CycleAnim anim = PED_SIT2SITB Backwards
					case "SITBL"
						Obj_CycleAnim anim = PED_SITBL2SIT
				endswitch
				Random(
					@Obj_CycleAnim anim = PED_SIT_Idle NumCycles = Random(@2 @3 @4 @5)
					@Obj_CycleAnim anim = PED_SIT_LookL
					@Obj_CycleAnim anim = PED_SIT_LookR
					@Obj_CycleAnim anim = PED_SIT_Tap NumCycles = Random(@1 @2 @3)
				)
				setTags obj_idle_state = "SIT"
				@*4 
				switch <obj_idle_state>
					case "STND"
						Obj_CycleAnim anim = PED_STND2SIT
						Obj_CycleAnim anim = PED_SIT2SITB
					case "SIT"
						Obj_CycleAnim anim = PED_SIT2SITB
					case "SITBL"
						Obj_CycleAnim anim = PED_SITB2SITBL Backwards
				endswitch
				Random(
					@Obj_CycleAnim anim = PED_SITB_Idle NumCycles = Random(@2 @3 @4 @5)
					@Obj_CycleAnim anim = PED_SITB_LookL
					@Obj_CycleAnim anim = PED_SITB_LookR
				)
				setTags obj_idle_state = "SITB"
				@*4 
				switch <obj_idle_state>
					case "STND"
						Obj_CycleAnim anim = PED_STND2SIT
						Obj_CycleAnim anim = PED_SITBL2SIT Backwards
					case "SIT"
						Obj_CycleAnim anim = PED_SITBL2SIT Backwards
					case "SITB"
						Obj_CycleAnim anim = PED_SITB2SITBL
				endswitch
				Random(
					@Obj_CycleAnim anim = PED_SITBL_Idle NumCycles = Random(@2 @3 @4 @5)
					@Obj_CycleAnim anim = PED_SITBL_LookL
					@Obj_CycleAnim anim = PED_SITBL_Tap
					@Obj_CycleAnim anim = PED_SITBL_Shake
				)
				setTags obj_idle_state = "SITBL"
				@
				switch <obj_idle_state>
					case "SIT"
						Obj_CycleAnim anim = PED_SIT2STND
					case "SITB"
						Obj_CycleAnim anim = PED_SIT2SITB Backwards
						Obj_CycleAnim anim = PED_SIT2STND
					case "SITBL"
						Obj_CycleAnim anim = PED_SITBL2SIT
						Obj_CycleAnim anim = PED_SIT2STND
				endswitch
				setTags obj_idle_state = "STND"
			)
		repeat
	endscript
