
    script car_add_components
        CreateComponentFromStructure component = shadow ShadowType = detailed
    endscript
    script levelobject_setup
        printf "omg2! woohoo!"
        Obj_EnableAmbientLight index = 0
        Obj_EnableAmbientLight index = 1
    endscript
    
	script gameobj_add_components
		if GotParam animName
			CreateComponentFromStructure component = animation <...>
		endif
		if GotParam skeletonName
			CreateComponentFromStructure component = skeleton <...> skeleton = <skeletonName>
		endif
		<is_level_obj> = 0
		if GotParam class
			if ChecksumEquals a = <class> b = LevelObject
				<is_level_obj> = 1
			endif
		endif
		if (<is_level_obj> = 1)
			CreateComponentFromStructure component = model <...>
            CreateComponentFromStructure component = shadow <...> ShadowType = detailed
		else
			if GotParam model
				if NOT StringEquals a = <model> b = "none"
					CreateComponentFromStructure component = model <...>
                    CreateComponentFromStructure component = shadow <...> ShadowType = detailed
				endif
			endif
		endif
		CreateComponentFromStructure component = collision <...>
	endscript
	script ped_add_components
		CreateComponentFromStructure component = avoid
		if NOT GotParam NoPedLogic
			CreateComponentFromStructure component = pedlogic <...>
		endif
		CreateComponentFromStructure component = SkaterLoopingSound <...> volume_mult = 0.2
		CreateComponentFromStructure component = SkaterSound <...> volume_mult = 0.2
		if ((InNetGame) || (LevelIs load_sk5ed) || (LevelIs load_sk5ed_gameplay))
			GetAnimEventTableName animName = thps5_human
			CreateComponentFromStructure {
				component = animation
				<...>
				animName = animload_thps5_human
				animEventTableName = <animEventTableName>
			}
			CreateComponentFromStructure component = skeleton <...> skeletonName = thps5_human
		else
			if GotParam animName
				if NOT GotParam animEventTableName
					GetAnimEventTableName animName = <animName>
				endif
				if NOT GotParam defaultAnimName
					if ChecksumEquals a = <skeletonName> b = thps5_human
						<defaultAnimName> = WStandIdle1
					endif
					if NOT (have_loaded_net)
						if ChecksumEquals a = <skeletonName> b = Ped_Female
							<defaultAnimName> = Ped_F_Idle1
						endif
					endif
				endif
				CreateComponentFromStructure component = animation animEventTableName = <animEventTableName> <...>
			endif
			if GotParam skeletonName
				CreateComponentFromStructure component = skeleton <...> skeleton = <skeletonName>
			endif
		endif
		CreateComponentFromStructure component = model
		if NOT GotParam ShadowOff
			CreateComponentFromStructure component = shadow <...> ShadowType = detailed
		endif
	endscript
	script ped_init_model
		if InNetGame
			Obj_InitModel model = "Peds/Ped_Judge/Ped_Judge.skin" use_asset_manager = 1
			return
		endif
		if ((LevelIs load_sk5ed) || (LevelIs load_sk5ed_gameplay))
			ChooseRandomCreatedGoalPedModel
			return
		endif
		if GotParam profile
			Obj_InitModelFromProfile struct = <profile> use_asset_manager = 1 buildscript = create_ped_model_from_appearance
		else
			if NOT GotParam model
				script_assert "no model name!"
			endif
			Obj_InitModel model = <model> use_asset_manager = 1
		endif
		Obj_GetID
		RunScriptOnObject id = <objID> set_ped_anim_handlers
	endscript
	script ped_disable_bones
		Obj_SetBoneActive bone = Cloth_Cuff_L active = 0
		Obj_SetBoneActive bone = Cloth_Cuff_R active = 0
		Obj_SetBoneActive bone = Cloth_Hat active = 0
		Obj_SetBoneActive bone = Cloth_Shirt_L active = 0
		Obj_SetBoneActive bone = Cloth_Shirt_C active = 0
		Obj_SetBoneActive bone = Cloth_Shirt_R active = 0
		Obj_SetBoneActive bone = Cloth_Trouser_L active = 0
		Obj_SetBoneActive bone = Cloth_Trouser_R active = 0
	endscript
	script Ped_Printf
		if IsTrue ped_debug
			printf <...>
		endif
	endscript
	script Ped_PrintStruct
		if IsTrue ped_debug
			PrintStruct <...>
		endif
	endscript
	script Ped_Assert
		if IsTrue ped_debug
			printf "SCRIPT ASSERT!"
			printf <...>
			while
			repeat
		endif
	endscript
	script Ped_PrintTags
		if IsTrue ped_debug
			GetTags
			PrintStruct <...>
		endif
	endscript
