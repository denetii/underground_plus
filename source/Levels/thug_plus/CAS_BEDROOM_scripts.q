	script cas_bedroom_Startup
		printf "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
		printf "X                                               X"
		printf "X              CAS Startup                      X"
		printf "X                                               X"
		printf "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
		GoalManager_HidePoints
		GoalManager_HideGoalPoints
		Change EndOfReplayShouldJumpToPauseMenu = 0
		Randomize
		SetScoreDegradation 0
		if (goto_face_menu = 0)
			if (in_cinematic_sequence = 1)
			else
				launch_pre_cas_menu
			endif
		else
			if (goto_face_menu = 1)
				launch_face_menu
			else
				launch_face_menu goto_face_map = goto_face_map
			endif
		endif
	endscript
	script TOD_Script
		switch <current_tod>
			case morning
			case day
			case evening
			case night
			default
				printf "### no tod set ###"
		endswitch
	endscript
	master_neversoft_skater_list = [
		{
			face_texture = "textures\skater_ns\NS_Head_Ralph"
			name = "Ralph D'Amato"
			alias = "deadendroad"
			profile =
			{sleeves = {desc_id = None h = 0 s = 0 v = 14 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1"}
				skater_m_hair = {desc_id = #"Slick 3" h = 245 s = 0 v = 26 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt" h = 0 s = 0 v = 14 use_default_hsv = 0}
				front_logo = {desc_id = #"Dead End Road" uv_u = -17.7922039 uv_v = -19.99999619 uv_scale = 200.0 uv_rot = 1.29867899 use_default_uv = 0}
				back_logo = {desc_id = #"Dead End Road" uv_u = 0.0 uv_v = 42.59739304 uv_scale = 50.0 uv_rot = 0.0 use_default_uv = 0}
				skater_m_legs = {desc_id = #"Cargo Shorts"}
				shoes = {desc_id = #"Glifberg Shoe"}
				accessories = {desc_id = #"Rocker Watch L"}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				object_scaling = {x = 97 y = 97 z = 97 use_default_scale = 0}
				head_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				hat = {desc_id = None}
				skater_m_socks = {desc_id = Medium}
				stomach_bone_group = {x = 108 y = 108 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 104 y = 104 z = 100 use_default_scale = 0}
				nose_bone_group = {x = 88 y = 126 z = 98 use_default_scale = 0}
				Jaw_bone_group = {x = 114 y = 100 z = 94 use_default_scale = 0}
				skater_m_jaw = {desc_id = None}
			}
			face_points = {
				left_eye = [42, 49]
				right_eye = [82, 49]
				nose = [60, 76]
				lips = [61, 95]
				h = 0.109
				s = 1.0
				v = 0.93000001
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = vert
				age = 34
				hometown = "Quaglietta, IT"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Rock"
			name = "Rock"
			alias = "M'YAK"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = Spiked h = 20 s = 20 v = 20 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt"}
				front_logo = {desc_id = Neversoft}
				back_logo = {desc_id = _Flip}
				skater_m_legs = {desc_id = #"Cargo Shorts" h = 250 s = 23 v = 24 use_default_hsv = 0}
				shoes = {desc_id = #"50s Shoe"}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				head_bone_group = {x = 101 y = 95 z = 88 use_default_scale = 0}
				nose_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				right_leg_tattoo = {desc_id = #"Tattoo 11" uv_u = 0.0 uv_v = -4.93506384 uv_scale = 81.42857361 uv_rot = 0.0 use_default_uv = 0}
			}
			face_points = {
				left_eye = [46, 64]
				right_eye = [78, 64]
				nose = [63, 81]
				lips = [63, 95]
				h = 0.12
				s = 0.98000002
				v = 1.11000001
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 33
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Eric"
			name = "Eric Grosser"
			alias = "crom"
			profile =
			{sleeves = {desc_id = None h = 35 s = 41 v = 32 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2" h = 40 s = 0 v = 50 use_default_hsv = 0}
				skater_m_hair = {desc_id = buzzed h = 20 s = 26 v = 24 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt" h = 35 s = 38 v = 28 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Baggy Cargo" h = 35 s = 30 v = 56 use_default_hsv = 0}
				accessories = {desc_id = #"Wrist Watch R" h = 0 s = 50 v = 12 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = None}
				hat = {desc_id = None}
				glasses = {desc_id = None}
				head_bone_group = {x = 105 y = 99 z = 105 use_default_scale = 0}
				nose_bone_group = {x = 112 y = 97 z = 77 use_default_scale = 0}
				Jaw_bone_group = {x = 115 y = 100 z = 97 use_default_scale = 0}
				headtop_bone_group = {x = 119 y = 116 z = 104 use_default_scale = 0}
				object_scaling = {x = 102 y = 102 z = 102 use_default_scale = 0}
				shoes = {desc_id = #"Vallely Shoe"}
				torso_bone_group = {x = 110 y = 110 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 112 y = 112 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 105 y = 105 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 117 y = 117 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 109 y = 109 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 114 y = 114 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 112 y = 112 z = 100 use_default_scale = 0}
				kneepads = {desc_id = None}
				skater_m_backpack = {desc_id = None}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 20"}
				deck_layer5 = {desc_id = #"layer 51" h = 100 s = 47 v = 18 use_default_hsv = 0 uv_u = 0.0 uv_v = 5.45454502 uv_scale = 90.90908813 uv_rot = 0.0 use_default_uv = 0}
				deck_layer1 = {desc_id = #"layer 51" h = 0 s = 90 v = 36 use_default_hsv = 0 uv_u = -13.76623344 uv_v = 5.97402382 uv_scale = 148.57133484 uv_rot = 0.0 use_default_uv = 0}
				deck_layer2 = {desc_id = #"layer 50" h = 115 s = 50 v = 18 use_default_hsv = 0 uv_u = 0.38960999 uv_v = 5.84415483 uv_scale = 200.0 uv_rot = 337.92208862 use_default_uv = 0}
			}
			face_points = {
				left_eye = [36, 33]
				right_eye = [93, 33]
				nose = [64, 64]
				lips = [63, 87]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = street
				age = 28
				hometown = "Austin, TX"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Mark"
			name = "MARCOS XK8R"
			alias = "MARCOS XK8R"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"Ponytail 1"}
				skater_m_torso = {desc_id = #"Leather Jacket A" h = 0 s = 0 v = 26 use_default_hsv = 0}
				skater_m_legs = {desc_id = Tight h = 0 s = 0 v = 18 use_default_hsv = 0}
				accessories = {desc_id = Gloves}
				board = {desc_id = #"default" h = 105 s = 90 v = 60 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = #"Sideburns 2"}
				glasses = {desc_id = #"Round Glasses" h = 0 s = 20 v = 24 use_default_hsv = 0}
				shoes = {desc_id = Boots h = 225 s = 26 v = 26 use_default_hsv = 0}
				head_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				headtop_bone_group = {x = 100 y = 100 z = 68 use_default_scale = 0}
				nose_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				Jaw_bone_group = {x = 119 y = 100 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				stomach_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				upper_arm_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				lower_arm_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				hands_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				upper_leg_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				lower_leg_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				feet_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				board_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				object_scaling = {x = 100 y = 100 z = 100 use_default_scale = 1}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 28"}
				deck_layer5 = {desc_id = #"layer 65" uv_u = 10.5194788 uv_v = -37.40258789 uv_scale = 109.99999237 uv_rot = 47.27272034 use_default_uv = 0 h = 80 s = 90 v = 60 use_default_hsv = 0}
				deck_layer1 = {desc_id = #"layer 57" uv_u = 0.0 uv_v = 0.0 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 1 h = 0 s = 50 v = 50 use_default_hsv = 1}
			}
			face_points =
			{
				left_eye = [41, 58]
				right_eye = [93, 59]
				nose = [67, 84]
				lips = [65, 101]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = mongo_when_switch
				trickstyle = street
				age = 39
				hometown = "Leeds,UK"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Dan"
			name = "Dan Nelson"
			alias = "Dan Nelson"
			profile =
			{sleeves = {desc_id = None h = 0 s = 0 v = 36 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2" h = 0 s = 50 v = 50 use_default_hsv = 1}
				skater_m_hair = {desc_id = buzzed h = 20 s = 26 v = 20 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt Long Sleeve" h = 115 s = 35 v = 26 use_default_hsv = 0}
				skater_m_legs = {desc_id = Baggy h = 65 s = 29 v = 24 use_default_hsv = 0}
				shoes = {desc_id = #"Work Boots" h = 35 s = 0 v = 16 use_default_hsv = 0}
				accessories = {desc_id = None}
				board = {desc_id = #"default" h = 290 s = 75 v = 20 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = None}
				hat = {desc_id = None}
				glasses = {desc_id = #"Casual H" h = 0 s = 0 v = 12 use_default_hsv = 0}
				front_logo = {desc_id = None}
				skater_m_backpack = {desc_id = None}
				skater_m_socks = {desc_id = Medium}
				headtop_bone_group = {x = 108 y = 123 z = 93 use_default_scale = 0}
				head_bone_group = {x = 107 y = 100 z = 90 use_default_scale = 0}
				Jaw_bone_group = {x = 130 y = 100 z = 84 use_default_scale = 0}
				nose_bone_group = {x = 100 y = 98 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 107 y = 107 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 115 y = 115 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 112 y = 112 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 106 y = 106 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 114 y = 114 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 113 y = 113 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 110 y = 110 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				board_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				object_scaling = {x = 100 y = 100 z = 100 use_default_scale = 1}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 26"}
				deck_layer4 = {desc_id = None}
				deck_layer5 = {desc_id = #"layer 50" h = 290 s = 90 v = 20 use_default_hsv = 0 uv_u = 0.0 uv_v = 63.76624298 uv_scale = 115.32466125 uv_rot = 0.0 use_default_uv = 0}
				deck_layer1 = {desc_id = None}
			}
			face_points = {
				left_eye = [45, 59]
				right_eye = [82, 58]
				nose = [64, 79]
				lips = [65, 93]
				h = 0.454
				s = 1.0
				v = 0.99000001
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 28
				hometown = "Gettysburgh, PA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Zac"
			name = "Zac Drake"
			alias = "ZiG"
			profile =
			{sleeves = {desc_id = None h = 0 s = 0 v = 34 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 4" h = 0 s = 0 v = 44 use_default_hsv = 0}
				skater_m_hair = {desc_id = Spiked h = 20 s = 26 v = 34 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt" h = 0 s = 0 v = 34 use_default_hsv = 0}
				skater_m_legs = {desc_id = Baggy h = 215 s = 17 v = 20 use_default_hsv = 0}
				shoes = {desc_id = #"Rowley Vans XL2"}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				hat = {desc_id = #"Backward Cap" h = 215 s = 0 v = 12 use_default_hsv = 0}
				skater_m_socks = {desc_id = Medium}
				right_forearm_tattoo = {desc_id = #"Tattoo 14" uv_u = 0.0 uv_v = 68.44149017 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 0}
				left_bicep_tattoo = {desc_id = #"Tattoo 2" uv_u = -45.97401047 uv_v = -70.64932251 uv_scale = 50.0 uv_rot = 341.81811523 use_default_uv = 0}
				back_tattoo = {desc_id = #"Tattoo 21" uv_u = -2.85714293 uv_v = -51.81816483 uv_scale = 167.5324707 uv_rot = 179.99993896 use_default_uv = 0}
				hat_logo = {desc_id = Volcom}
				front_logo = {desc_id = Independent uv_u = 0.0 uv_v = 0.0 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 1}
				torso_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				stomach_bone_group = {x = 94 y = 94 z = 100 use_default_scale = 0}
				Jaw_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 24"}
				deck_layer5 = {desc_id = #"layer 82" uv_u = -2.59740305 uv_v = -64.41555786 uv_scale = 100.0 uv_rot = 82.59727478 use_default_uv = 0}
				deck_layer1 = {desc_id = #"layer 65" uv_u = 24.80518913 uv_v = 0.0 uv_scale = 200.0 uv_rot = 90.12984467 use_default_uv = 0}
				deck_layer2 = {desc_id = #"layer 63" uv_u = -2.20779204 uv_v = 62.9869957 uv_scale = 100.0 uv_rot = 99.74023438 use_default_uv = 0}
				deck_layer3 = {desc_id = #"layer 54" uv_u = -23.24674797 uv_v = -0.51947999 uv_scale = 200.0 uv_rot = 0.0 use_default_uv = 0}
				deck_layer4 = {desc_id = None}
			}
			face_points = {
				left_eye = [47, 54]
				right_eye = [78, 55]
				nose = [62, 75]
				lips = [62, 89]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 24
				hometown = "Ogden, Utah"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_SteveG"
			name = "The Kraken"
			alias = "The Kraken"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1" h = 0 s = 50 v = 50 use_default_hsv = 1}
				skater_m_hair = {desc_id = #"Slick 3" h = 30 s = 8 v = 16 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Element Team" h = 240 s = 47 v = 16 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Cargo Shorts" h = 25 s = 17 v = 50 use_default_hsv = 0}
				shoes = {desc_id = #"Glifberg Shoe"}
				accessories = {desc_id = #"Wrist watch L" h = 0 s = 2 v = 12 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = Tuft}
				hat = {desc_id = #"Backward Cap" h = 250 s = 53 v = 22 use_default_hsv = 0}
				skater_m_socks = {desc_id = Ankle h = 240 s = 51 v = 14 use_default_hsv = 0}
				glasses = {desc_id = None}
				object_scaling = {x = 107 y = 107 z = 107 use_default_scale = 0}
				nose_bone_group = {x = 92 y = 108 z = 98 use_default_scale = 0}
				Jaw_bone_group = {x = 106 y = 107 z = 101 use_default_scale = 0}
				torso_bone_group = {x = 108 y = 108 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 115 y = 115 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 111 y = 111 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 108 y = 108 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 109 y = 109 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 115 y = 115 z = 100 use_default_scale = 0}
				headtop_bone_group = {x = 110 y = 121 z = 116 use_default_scale = 0}
			}
			face_points = {
				left_eye = [46, 60]
				right_eye = [78, 60]
				nose = [62, 81]
				lips = [62, 99]
				h = 0.125
				s = 0.69999999
				v = 0.93000001
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = street
				age = 27
				hometown = "Huntington Bch"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Jeremy"
			name = "Jeremy Andersen"
			alias = "Jeremy Andersen"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1" h = 0 s = 6 v = 50 use_default_hsv = 0}
				skater_m_hair = {desc_id = #"medium 1"}
				skater_m_torso = {desc_id = Shirtless}
				skater_m_legs = {desc_id = Baggy}
				shoes = {desc_id = #"Burnquist Shoe"}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				back_tattoo = {desc_id = #"Tattoo 2" uv_u = 0.0 uv_v = -37.79219818 uv_scale = 168.44146729 uv_rot = 0.0 use_default_uv = 0}
				glasses = {desc_id = None}
				object_scaling = {x = 108 y = 108 z = 108 use_default_scale = 0}
				torso_bone_group = {x = 110 y = 110 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 110 y = 110 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 101 y = 101 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 114 y = 114 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 116 y = 116 z = 100 use_default_scale = 0}
			}
			face_points = {
				left_eye = [45, 52]
				right_eye = [91, 52]
				nose = [68, 80]
				lips = [69, 100]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = vert
				age = 30
				hometown = "Iowa City, IA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Jake"
			name = "Jake Geiger"
			alias = "GEIGER"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"Ponytail 1" h = 20 s = 26 v = 24 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Button SS 1" h = 105 s = 23 v = 24 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"denim Shorts" h = 10 s = 0 v = 30 use_default_hsv = 0}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = #"Sideburns 2"}
				object_scaling = {x = 97 y = 97 z = 97 use_default_scale = 0}
				Jaw_bone_group = {x = 112 y = 88 z = 104 use_default_scale = 0}
				shoes = {desc_id = #"B-Ball" h = 65 s = 20 v = 16 use_default_hsv = 0}
				skater_m_socks = {desc_id = Medium}
				torso_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 108 y = 108 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 107 y = 107 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 102 y = 102 z = 100 use_default_scale = 0}
				head_bone_group = {x = 104 y = 100 z = 94 use_default_scale = 0}
				nose_bone_group = {x = 65 y = 92 z = 96 use_default_scale = 0}
			}
			face_points = {
				left_eye = [47, 51]
				right_eye = [85, 52]
				nose = [66, 72]
				lips = [65, 91]
				h = 359.79000854
				s = 0.77999997
				v = 1.14999998
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 25
				hometown = "Big Bear, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_David"
			name = "Big Tex"
			alias = "Big Tex"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2" h = 100 s = 77 v = 50 use_default_hsv = 0}
				skater_m_hair = {desc_id = buzzed}
				skater_m_torso = {desc_id = Hawaiian h = 235 s = 50 v = 50 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Cargo Shorts" h = 65 s = 8 v = 40 use_default_hsv = 0}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				hat = {desc_id = Cowboy}
				shoes = {desc_id = #"cowboy boots"}
				skater_m_socks = {desc_id = None}
				left_forearm_tattoo = {desc_id = #"Tattoo 8" uv_u = 0.0 uv_v = -32.72726059 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 0}
				skater_m_jaw = {desc_id = None}
				object_scaling = {x = 105 y = 105 z = 105 use_default_scale = 0}
				upper_arm_bone_group = {x = 108 y = 108 z = 100 use_default_scale = 0}
				nose_bone_group = {x = 99 y = 133 z = 104 use_default_scale = 0}
				Jaw_bone_group = {x = 96 y = 107 z = 89 use_default_scale = 0}
				torso_bone_group = {x = 102 y = 102 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 97 y = 97 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 105 y = 105 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 116 y = 116 z = 100 use_default_scale = 0}
			}
			face_points = {
				left_eye = [39, 46]
				right_eye = [92, 46]
				nose = [67, 69]
				lips = [67, 87]
				h = 2.46000004
				s = 0.89999998
				v = 0.87
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 26
				hometown = "Mo. City, TX"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Andy"
			name = "Andy Marchel"
			alias = "Andy Marchel"
			profile =
			{sleeves = {desc_id = None h = 200 s = 11 v = 18 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"Slick 3" h = 30 s = 29 v = 34 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Shirt line" h = 200 s = 11 v = 18 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Cargo Shorts" h = 100 s = 32 v = 26 use_default_hsv = 0}
				shoes = {desc_id = #"Generic Shoe 2" h = 95 s = 29 v = 50 use_default_hsv = 0}
				accessories = {desc_id = #"Wrist Watch R"}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				glasses = {desc_id = #"Casual J"}
				headtop_bone_group = {x = 109 y = 101 z = 109 use_default_scale = 0}
				object_scaling = {x = 100 y = 100 z = 100 use_default_scale = 0}
				head_bone_group = {x = 95 y = 98 z = 97 use_default_scale = 0}
				nose_bone_group = {x = 88 y = 84 z = 88 use_default_scale = 0}
				Jaw_bone_group = {x = 100 y = 95 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 92 y = 92 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 111 y = 111 z = 100 use_default_scale = 0}
				front_logo = {desc_id = Neversoft}
				feet_bone_group = {x = 109 y = 109 z = 100 use_default_scale = 0}
				skater_m_jaw = {desc_id = #"Sideburns 2"}
			}
			face_points = {
				left_eye = [48, 50]
				right_eye = [81, 50]
				nose = [64, 69]
				lips = [64, 86]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 28
				hometown = "Roanoke,Va"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Dana"
			name = "Dana MacKenzie"
			alias = "Daddy Mac"
			profile =
			{sleeves = {desc_id = None h = 245 s = 20 v = 12 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1"}
				skater_m_hair = {desc_id = #"Medium 3" h = 25 s = 26 v = 34 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt" h = 230 s = 38 v = 12 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Cord Shorts" h = 135 s = 8 v = 32 use_default_hsv = 0}
				shoes = {desc_id = #"Thomas Shoe"}
				accessories = {desc_id = #"Wrist watch L"}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				hat = {desc_id = #"Backward Cap" h = 215 s = 29 v = 16 use_default_hsv = 0}
				hat_logo = {desc_id = Circa}
				skater_m_jaw = {desc_id = #"Sideburns 2"}
				torso_bone_group = {x = 95 y = 95 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 108 y = 108 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 92 y = 92 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 112 y = 112 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 110 y = 110 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 107 y = 107 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 108 y = 108 z = 100 use_default_scale = 0}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 30"}
				deck_layer5 = {desc_id = #"layer 69" uv_u = 29.35064507 uv_v = 145.06483459 uv_scale = 185.32455444 uv_rot = 0.0 use_default_uv = 0 h = 10 s = 90 v = 50 use_default_hsv = 0}
				deck_layer1 = {desc_id = #"layer 57" uv_u = 0.38961199 uv_v = 147.79206848 uv_scale = 193.50636292 uv_rot = 0.0 use_default_uv = 0 h = 5 s = 90 v = 50 use_default_hsv = 0}
				nose_bone_group = {x = 113 y = 119 z = 83 use_default_scale = 0}
				Jaw_bone_group = {x = 91 y = 92 z = 88 use_default_scale = 0}
				glasses = {desc_id = None}
				front_logo = {desc_id = Neversoft uv_u = 1.29870105 uv_v = -1.55844104 uv_scale = 89.22077179 uv_rot = 2.85714293 use_default_uv = 0}
				back_logo = {desc_id = THUG uv_u = 1.94805205 uv_v = 2.20779204 uv_scale = 82.72727203 uv_rot = 2.0778811 use_default_uv = 0}
				head_bone_group = {x = 104 y = 94 z = 100 use_default_scale = 0}
				skater_m_socks = {desc_id = Ankle h = 55 s = 60 v = 44 use_default_hsv = 0}
				deck_layer2 = {desc_id = #"layer 59" uv_u = -27.7922039 uv_v = 147.92196655 uv_scale = 191.42843628 uv_rot = 0.0 use_default_uv = 0 h = 5 s = 89 v = 50 use_default_hsv = 0}
				deck_layer3 = {desc_id = #"layer 14" uv_u = 3.76623297 uv_v = -154.28547668 uv_scale = 90.77919006 uv_rot = 0.0 use_default_uv = 0}
				deck_layer4 = {desc_id = None}
			}
			face_points = {
				left_eye = [33, 43]
				right_eye = [94, 43]
				nose = [60, 64]
				lips = [61, 83]
				h = 2.46000004
				s = 0.94
				v = 1.16999996
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = vert
				age = 33
				hometown = "Ottawa, Canada"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Carlo"
			name = "C Surla"
			alias = "Akira2s"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1" h = 50 s = 14 v = 48 use_default_hsv = 0}
				skater_m_hair = {desc_id = #"Slick 3" h = 25 s = 44 v = 12 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Jogger Jacket" h = 55 s = 81 v = 52 use_default_hsv = 0}
				skater_m_legs = {desc_id = Jogger h = 55 s = 78 v = 54 use_default_hsv = 0}
				accessories = {desc_id = #"Wrist Bands" h = 50 s = 0 v = 16 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				glasses = {desc_id = #"Casual G"}
				object_scaling = {x = 90 y = 90 z = 90 use_default_scale = 0}
				shoes = {desc_id = #"Bare Feet"}
				headtop_bone_group = {x = 104 y = 98 z = 105 use_default_scale = 0}
				head_bone_group = {x = 110 y = 100 z = 99 use_default_scale = 0}
				nose_bone_group = {x = 124 y = 81 z = 96 use_default_scale = 0}
				Jaw_bone_group = {x = 103 y = 100 z = 100 use_default_scale = 0}
			}
			face_points = {
				left_eye = [44, 45]
				right_eye = [87, 45]
				nose = [66, 76]
				lips = [65, 90]
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 24
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Ted"
			name = "Ted Barber"
			alias = "Hammer"
			profile =
			{sleeves = {desc_id = None h = 30 s = 53 v = 40 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1" h = 0 s = 50 v = 50 use_default_hsv = 1}
				skater_m_hair = {desc_id = #"Medium 2" h = 20 s = 29 v = 26 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt Long Sleeve" h = 0 s = 47 v = 36 use_default_hsv = 0
				}
				skater_m_legs = {desc_id = denim h = 150 s = 2 v = 18 use_default_hsv = 0}
				accessories = {desc_id = #"Wrist watch L"}
				board = {desc_id = #"default" h = 205 s = 2 v = 50 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 1"}
				skater_m_jaw = {desc_id = #"Sideburns 2"}
				hat = {desc_id = Russian h = 215 s = 14 v = 20 use_default_hsv = 0}
				glasses = {desc_id = None}
				skater_m_backpack = {desc_id = None}
				object_scaling = {x = 103 y = 103 z = 103 use_default_scale = 0}
				headtop_bone_group = {x = 116 y = 134 z = 112 use_default_scale = 0}
				left_bicep_tattoo = {desc_id = None}
				shoes = {desc_id = #"Vallely Shoe"}
				stomach_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				upper_arm_bone_group = {x = 109 y = 109 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 104 y = 104 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 105 y = 105 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 109 y = 109 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 99 y = 99 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 109 y = 109 z = 100 use_default_scale = 0}
				elbowpads = {desc_id = None}
				back_logo = {desc_id = None}
				Jaw_bone_group = {x = 103 y = 91 z = 93 use_default_scale = 0}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 16"}
				deck_layer5 = {desc_id = #"layer 57" uv_u = 0.0 uv_v = -60.5194664 uv_scale = 175.58432007 uv_rot = 85.71425629 use_default_uv = 0 h = 50 s = 50 v = 50 use_default_hsv = 0}
				deck_layer4 = {desc_id = #"layer 9" uv_u = 0.0 uv_v = 0.0 uv_scale = 184.41548157 uv_rot = 268.83108521 use_default_uv = 0 h = 200 s = 60 v = 12 use_default_hsv = 0}
				head_bone_group = {x = 97 y = 101 z = 97 use_default_scale = 0}
				torso_bone_group = {x = 101 y = 101 z = 100 use_default_scale = 0}
				deck_layer1 = {desc_id = #"layer 68" uv_u = -0.129871 uv_v = -17.14285469 uv_scale = 179.99989319 uv_rot = 90.12984467 use_default_uv = 0 h = 55 s = 50 v = 50 use_default_hsv = 0}
				deck_layer2 = {desc_id = #"layer 61" uv_u = 0.0 uv_v = 20.12986565 uv_scale = 180.64926147 uv_rot = 88.05192566 use_default_uv = 0 h = 55 s = 50 v = 50 use_default_hsv = 0}
				deck_layer3 = {desc_id = #"layer 80" uv_u = -1.68831098 uv_v = 55.84414291 uv_scale = 141.94801331 uv_rot = 89.61035919 use_default_uv = 0 h = 55 s = 50 v = 50 use_default_hsv = 0}
			}
			face_points = {
				left_eye = [46, 49]
				right_eye = [83, 49]
				nose = [65, 75]
				lips = [65, 89]
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = street
				age = 33
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Aaron"
			name = "Skillzombie"
			alias = "Skillzombie"
			profile =
			{sleeves = {desc_id = None h = 50 s = 53 v = 54 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2" h = 0 s = 50 v = 50 use_default_hsv = 1}
				skater_m_hair = {desc_id = buzzed}
				skater_m_torso = {desc_id = #"T-shirt" h = 50 s = 50 v = 54 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Camo Shorts" h = 95 s = 20 v = 40 use_default_hsv = 0}
				shoes = {desc_id = classic}
				accessories = {desc_id = #"Arm Band R" h = 0 s = 0 v = 20 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				hat = {desc_id = Rasta}
				head_bone_group = {x = 100 y = 105 z = 90 use_default_scale = 0}
				nose_bone_group = {x = 101 y = 116 z = 95 use_default_scale = 0}
				Jaw_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				object_scaling = {x = 96 y = 96 z = 96 use_default_scale = 0}
				stomach_bone_group = {x = 108 y = 108 z = 100 use_default_scale = 0}
				skater_m_socks = {desc_id = None}
				front_logo = {desc_id = Neversoft uv_u = -1.55844104 uv_v = -1.03896296 uv_scale = 84.93502045 uv_rot = 1.55834794 use_default_uv = 0}
			}
			face_points = {
				left_eye = [47, 57]
				right_eye = [79, 57]
				nose = [64, 77]
				lips = [64, 90]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = street
				age = 27
				hometown = "Portsmouth, VA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_ToddW"
			name = "Todd Wahoske"
			alias = "Todd Wahoske"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"Medium 3" h = 20 s = 29 v = 38 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Jogger Jacket" h = 40 s = 30 v = 50 use_default_hsv = 0}
				skater_m_legs = {desc_id = Baggy h = 225 s = 17 v = 26 use_default_hsv = 0}
				shoes = {desc_id = #"koston Shoe"}
				accessories = {desc_id = #"Wrist Bands" h = 50 s = 0 v = 16 use_default_hsv = 0}
				board = {desc_id = #"default" h = 115 s = 71 v = 48 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = #"Honest Abe" h = 10 s = 56 v = 60 use_default_hsv = 0}
				object_scaling = {x = 110 y = 110 z = 110 use_default_scale = 0}
				head_bone_group = {x = 93 y = 100 z = 100 use_default_scale = 0}
				Jaw_bone_group = {x = 100 y = 87 z = 114 use_default_scale = 0}
				torso_bone_group = {x = 94 y = 94 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 104 y = 104 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 91 y = 91 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 113 y = 113 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 92 y = 92 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 112 y = 112 z = 100 use_default_scale = 0}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 2"}
				deck_layer5 = {desc_id = #"layer 72" h = 50 s = 90 v = 30 use_default_hsv = 0 uv_u = -2.33766198 uv_v = -61.29867554 uv_scale = 200.0 uv_rot = 270.90893555 use_default_uv = 0}
				deck_layer1 = {desc_id = #"layer 71" h = 20 s = 47 v = 32 use_default_hsv = 0 uv_u = -2.46753311 uv_v = -24.15583611 uv_scale = 200.0 uv_rot = 0.0 use_default_uv = 0}
				deck_layer2 = {desc_id = #"layer 71" h = 45 s = 71 v = 30 use_default_hsv = 0 uv_u = -2.33766198 uv_v = 18.31168365 uv_scale = 200.0 uv_rot = 92.98694611 use_default_uv = 0}
				deck_layer3 = {desc_id = #"layer 72" h = 50 s = 77 v = 30 use_default_hsv = 0 uv_u = -4.0259738 uv_v = 56.88309097 uv_scale = 198.05194092 uv_rot = 269.35043335 use_default_uv = 0}
			}
			face_points = {
				left_eye = [49, 46]
				right_eye = [89, 47]
				nose = [68, 73]
				lips = [67, 92]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 28
				hometown = "Tarzana, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Jon"
			name = "Bailey"
			alias = "Bailey"
			profile =
			{sleeves = {desc_id = None h = 0 s = 0 v = 16 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = buzzed}
				skater_m_torso = {desc_id = #"T-shirt" h = 0 s = 0 v = 16 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Jeans Low" h = 215 s = 17 v = 34 use_default_hsv = 0}
				shoes = {desc_id = #"B-Ball"}
				accessories = {desc_id = #"Left Elbow Band"}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = None}
				front_logo = {desc_id = Neversoft}
				back_logo = {desc_id = Independent uv_u = 0.0 uv_v = 0.0 uv_scale = 77.27272797 uv_rot = 0.0 use_default_uv = 0}
				object_scaling = {x = 103 y = 103 z = 103 use_default_scale = 0}
				Jaw_bone_group = {x = 115 y = 94 z = 105 use_default_scale = 0}
				head_bone_group = {x = 94 y = 93 z = 102 use_default_scale = 0}
				nose_bone_group = {x = 112 y = 90 z = 90 use_default_scale = 0}
				torso_bone_group = {x = 96 y = 96 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 99 y = 99 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 91 y = 91 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 99 y = 99 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 110 y = 110 z = 100 use_default_scale = 0}
				hat = {desc_id = None}
				glasses = {desc_id = None}
			}
			face_points = {
				left_eye = [48, 50]
				right_eye = [81, 50]
				nose = [64, 73]
				lips = [62, 90]
				h = 2.46000004
				s = 0.89999998
				v = 0.93000001
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = always_mongo
				trickstyle = street
				age = 31
				hometown = "Plymouth, MA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Johnny"
			name = "Chum"
			alias = "Johnny Ow"
			profile =
			{sleeves = {desc_id = None h = 195 s = 53 v = 48 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1" h = 50 s = 11 v = 54 use_default_hsv = 0}
				skater_m_hair = {desc_id = buzzed}
				skater_m_torso = {desc_id = #"T-shirt" h = 200 s = 47 v = 46 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Cargo Shorts" h = 30 s = 8 v = 44 use_default_hsv = 0}
				accessories = {desc_id = #"Wrist Tape R" h = 30 s = 23 v = 54 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				object_scaling = {x = 99 y = 99 z = 99 use_default_scale = 0}
				stomach_bone_group = {x = 98 y = 98 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 96 y = 96 z = 100 use_default_scale = 0}
				Jaw_bone_group = {x = 110 y = 102 z = 82 use_default_scale = 0}
				head_bone_group = {x = 99 y = 100 z = 100 use_default_scale = 0}
				headtop_bone_group = {x = 106 y = 100 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 105 y = 105 z = 100 use_default_scale = 0}
				front_logo = {desc_id = Neversoft}
				back_logo = {desc_id = THPS1}
				shoes = {desc_id = sandals h = 20 s = 29 v = 58 use_default_hsv = 0}
				hat = {desc_id = Cowboy h = 40 s = 38 v = 38 use_default_hsv = 0}
				nose_bone_group = {x = 100 y = 98 z = 100 use_default_scale = 0}
			}
			face_points = {
				left_eye = [32, 34]
				right_eye = [92, 35]
				nose = [60, 80]
				lips = [61, 105]
				h = 6.125
				s = 1.0
				v = 1.19000006
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 30
				hometown = "Red China"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_ChrisP"
			name = "Chris Peacock"
			alias = "ChrisP"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2" h = 0 s = 50 v = 50 use_default_hsv = 1}
				skater_m_hair = {desc_id = #"medium 1" h = 30 s = 20 v = 36 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Long Sleeve" h = 345 s = 38 v = 14 use_default_hsv = 0}
				front_logo = {desc_id = None}
				back_logo = {desc_id = None}
				skater_m_legs = {desc_id = denim h = 205 s = 26 v = 28 use_default_hsv = 0}
				accessories = {desc_id = None}
				board = {desc_id = #"default" h = 10 s = 71 v = 58 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = #"Beard 1" h = 40 s = 26 v = 52 use_default_hsv = 0}
				glasses = {desc_id = #"Casual H" h = 5 s = 20 v = 46 use_default_hsv = 0}
				shoes = {desc_id = #"Generic Shoe 2" h = 85 s = 14 v = 30 use_default_hsv = 0}
				torso_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				upper_arm_bone_group = {x = 104 y = 104 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 114 y = 114 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 104 y = 104 z = 100 use_default_scale = 0}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 14"}
				deck_layer5 = {desc_id = #"layer 35" uv_u = -2.72727299 uv_v = -48.96102142 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 0}
				deck_layer1 = {desc_id = #"layer 36" uv_u = -3.24675298 uv_v = 41.42855453 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 0}
				deck_layer2 = {desc_id = #"layer 99" uv_u = -30.64933395 uv_v = -5.58441019 uv_scale = 200.0 uv_rot = 183.6362915 use_default_uv = 0 h = 355 s = 63 v = 40 use_default_hsv = 0}
				deck_layer3 = {desc_id = #"layer 99" uv_u = 25.58441162 uv_v = -4.54545307 uv_scale = 200.0 uv_rot = 0.0 use_default_uv = 0 h = 0 s = 48 v = 44 use_default_hsv = 0}
				object_scaling = {x = 102 y = 102 z = 102 use_default_scale = 0}
				nose_bone_group = {x = 100 y = 119 z = 100 use_default_scale = 0}
				headtop_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				Jaw_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				head_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				stomach_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				hands_bone_group = {x = 115 y = 115 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 104 y = 104 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 109 y = 109 z = 100 use_default_scale = 0}
				board_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				deck_layer4 = {desc_id = None}
			}
			face_points = {
				left_eye = [42, 53]
				right_eye = [82, 55]
				nose = [63, 77]
				lips = [62, 93]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = always_mongo
				trickstyle = vert
				age = 27
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Darren"
			name = "Darren Thorne"
			alias = "DDT"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"Medium 4"}
				skater_m_torso = {desc_id = #"Baseball-T"}
				skater_m_legs = {desc_id = #"Baggy Cargo" h = 85 s = 17 v = 26 use_default_hsv = 0}
				accessories = {desc_id = #"Rocker Watch L"}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				hat = {desc_id = #"Forward Cap" h = 45 s = 8 v = 22 use_default_hsv = 0}
				skater_m_jaw = {desc_id = #"Sideburns 2"}
				hat_logo = {desc_id = Peralta}
				glasses = {desc_id = #"Big Shades" h = 0 s = 0 v = 60 use_default_hsv = 0}
				shoes = {desc_id = sandals}
				nose_bone_group = {x = 135 y = 133 z = 100 use_default_scale = 0}
				Jaw_bone_group = {x = 100 y = 98 z = 92 use_default_scale = 0}
				feet_bone_group = {x = 110 y = 110 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 102 y = 102 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 105 y = 105 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 102 y = 102 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 106 y = 106 z = 100 use_default_scale = 0}
				headtop_bone_group = {x = 107 y = 100 z = 100 use_default_scale = 0}
				head_bone_group = {x = 100 y = 96 z = 102 use_default_scale = 0}
				stomach_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
			}
			face_points =
			{
				left_eye = [36, 49]
				right_eye = [90, 47]
				nose = [61, 77]
				lips = [62, 94]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 36
				hometown = "Anchorage, AK"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Chauwa"
			name = "Chauwa Steel"
			alias = "Chauwa Steel"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1" h = 0 s = 50 v = 50 use_default_hsv = 1}
				skater_m_hair = {desc_id = #"Part Side L" h = 210 s = 23 v = 24 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Button SS 1" h = 230 s = 23 v = 28 use_default_hsv = 0}
				skater_m_legs = {desc_id = denim}
				shoes = {desc_id = #"Biker Boots" h = 0 s = 0 v = 34 use_default_hsv = 0}
				accessories = {desc_id = #"Rocker Watch L"}
				board = {desc_id = #"default" h = 235 s = 74 v = 60 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 9"}
				head_bone_group = {x = 99 y = 97 z = 97 use_default_scale = 0}
				nose_bone_group = {x = 122 y = 100 z = 97 use_default_scale = 0}
				Jaw_bone_group = {x = 77 y = 99 z = 94 use_default_scale = 0}
				glasses = {desc_id = None}
				skater_m_jaw = {desc_id = #"Sideburns 2"}
				torso_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				stomach_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 94 y = 94 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				object_scaling = {x = 108 y = 108 z = 108 use_default_scale = 0}
				headtop_bone_group = {x = 102 y = 114 z = 129 use_default_scale = 0}
				deck_layer4 = {desc_id = #"layer 55" uv_u = 41.42856216 uv_v = 0.0 uv_scale = 157.66227722 uv_rot = 0.0 use_default_uv = 0 h = 60 s = 0 v = 50 use_default_hsv = 0}
				deck_layer5 = {desc_id = #"layer 55" uv_u = -27.92207336 uv_v = 37.27272034 uv_scale = 200.0 uv_rot = 2.33766198 use_default_uv = 0 h = 235 s = 0 v = 60 use_default_hsv = 0}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 35"}
			}
			face_points = {
				left_eye = [40, 33]
				right_eye = [84, 33]
				nose = [62, 64]
				lips = [62, 86]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = always_mongo
				trickstyle = vert
				age = 34
				hometown = "Downey, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_ToddS"
			name = "Todd Sue"
			alias = "TSUEnami!"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = Spiked}
				skater_m_torso = {desc_id = Hawaiian h = 220 s = 56 v = 46 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Surf Shorts" h = 150 s = 14 v = 36 use_default_hsv = 0}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				headtop_bone_group = {x = 89 y = 114 z = 108 use_default_scale = 0}
				nose_bone_group = {x = 100 y = 130 z = 97 use_default_scale = 0}
				Jaw_bone_group = {x = 96 y = 102 z = 98 use_default_scale = 0}
				head_bone_group = {x = 103 y = 98 z = 97 use_default_scale = 0}
				hat = {desc_id = #"Pirate Hat"}
				shoes = {desc_id = Flipflops}
				glasses = {desc_id = #"Eye Patch"}
			}
			face_points = {
				left_eye = [45, 48]
				right_eye = [82, 49]
				nose = [64, 75]
				lips = [63, 91]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = mongo_when_switch
				trickstyle = street
				age = 23
				hometown = "Phoenix, AZ"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Jesse"
			name = "Y2KJ"
			alias = "Y2KJ"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1" h = 0 s = 8 v = 50 use_default_hsv = 0}
				skater_m_hair = {desc_id = Pompadour h = 15 s = 50 v = 30 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Leather Jacket A" h = 40 s = 68 v = 28 use_default_hsv = 0}
				skater_m_legs = {desc_id = Baggy h = 195 s = 15 v = 40 use_default_hsv = 0}
				accessories = {desc_id = #"Wrist Bands" h = 50 s = 0 v = 16 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				deck_layer1 = {desc_id = #"layer 81" uv_u = 0.0 uv_v = -12.07792091 uv_scale = 100.0 uv_rot = 89.09087372 use_default_uv = 0}
				deck_layer2 = {desc_id = #"layer 85" uv_u = 0.0 uv_v = 38.8311615 uv_scale = 100.0 uv_rot = 89.09088135 use_default_uv = 0 h = 220 s = 50 v = 40 use_default_hsv = 0}
				deck_layer3 = {desc_id = None}
				deck_layer4 = {desc_id = #"layer 10"}
				deck_layer5 = {desc_id = None uv_u = 0.0 uv_v = 0.0 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 1 h = 0 s = 50 v = 50 use_default_hsv = 1}
				cad_graphic = {desc_id = #"CAS 24"}
				glasses = {desc_id = None}
				left_bicep_tattoo = {desc_id = #"Tattoo 8" uv_u = -14.67531967 uv_v = -7.92207718 uv_scale = 119.22074127 uv_rot = 10.12987041 use_default_uv = 0}
				headtop_bone_group = {x = 101 y = 87 z = 89 use_default_scale = 0}
				head_bone_group = {x = 100 y = 94 z = 100 use_default_scale = 0}
				nose_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				Jaw_bone_group = {x = 100 y = 88 z = 100 use_default_scale = 0}
				shoes = {desc_id = #"high tops" h = 55 s = 62 v = 36 use_default_hsv = 0}
				skater_m_backpack = {desc_id = None}
				hat = {desc_id = Motorbike h = 240 s = 57 v = 12 use_default_hsv = 0}
				object_scaling = {x = 105 y = 105 z = 105 use_default_scale = 0}
				stomach_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 111 y = 111 z = 100 use_default_scale = 0}
				deck_graphic = {desc_id = None}
			}
			face_points = {
				left_eye = [48, 46]
				right_eye = [86, 50]
				nose = [66, 71]
				lips = [64, 90]
				h = 1.78600001
				s = 1.22000003
				v = 0.82999998
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 25
				hometown = "Elverson, PA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Gary"
			name = "Gary Jesdanun"
			alias = "Yawgurt"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1"}
				skater_m_hair = {desc_id = #"Part Side L" h = 20 s = 32 v = 14 use_default_hsv = 0}
				skater_m_torso = {desc_id = Shirtless}
				skater_m_legs = {desc_id = Boxers}
				accessories = {desc_id = #"Cast Right"}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				glasses = {desc_id = #"Casual H"}
				headtop_bone_group = {x = 95 y = 108 z = 102 use_default_scale = 0}
				head_bone_group = {x = 95 y = 95 z = 99 use_default_scale = 0}
				nose_bone_group = {x = 87 y = 86 z = 87 use_default_scale = 0}
				Jaw_bone_group = {x = 122 y = 85 z = 81 use_default_scale = 0}
				torso_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 108 y = 108 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 117 y = 117 z = 100 use_default_scale = 0}
				shoes = {desc_id = sandals}
				object_scaling = {x = 97 y = 97 z = 97 use_default_scale = 0}
			}
			face_points = {
				left_eye = [33, 29]
				right_eye = [94, 29]
				nose = [66, 74]
				lips = [66, 104]
				h = 2.46000004
				s = 0.89999998
				v = 0.82999998
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 29
				hometown = "Edison, NJ"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_JasonG"
			name = "Greenie"
			alias = "Greenie"
			profile =
			{sleeves = {desc_id = None h = 0 s = 50 v = 50 use_default_hsv = 1}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1"}
				skater_m_hair = {desc_id = #"Part Side R" h = 0 s = 0 v = 20 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt Long Sleeve" h = 120 s = 32 v = 32 use_default_hsv = 0}
				front_logo = {desc_id = None}
				back_logo = {desc_id = None}
				skater_m_legs = {desc_id = #"Cargo Shorts" h = 55 s = 23 v = 42 use_default_hsv = 0}
				shoes = {desc_id = #"Glifberg Shoe"}
				accessories = {desc_id = None}
				board = {desc_id = #"default" h = 230 s = 45 v = 52 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = None}
				kneepads = {desc_id = None}
				elbowpads = {desc_id = None}
				helmet = {desc_id = None}
				skater_m_socks = {desc_id = Ankle}
				head_bone_group = {x = 93 y = 100 z = 100 use_default_scale = 0}
				Jaw_bone_group = {x = 86 y = 100 z = 100 use_default_scale = 0}
				headtop_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				nose_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 94 y = 94 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 92 y = 92 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 105 y = 105 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 107 y = 107 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 116 y = 116 z = 100 use_default_scale = 0}
				glasses = {desc_id = None}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 26"}
				deck_layer5 = {desc_id = #"layer 38" uv_u = 35.97402191 uv_v = 10.25973129 uv_scale = 133.50646973 uv_rot = 85.71425629 use_default_uv = 0}
				deck_layer1 = {desc_id = #"layer 50" h = 245 s = 0 v = 44 use_default_hsv = 0 uv_u = -16.10389328 uv_v = -7.01298618 uv_scale = 123.89608765 uv_rot = 0.0 use_default_uv = 0}
				deck_layer2 = {desc_id = #"layer 99" h = 0 s = 50 v = 50 use_default_hsv = 1 uv_u = -18.83116531 uv_v = -29.48051262 uv_scale = 200.0 uv_rot = 0.0 use_default_uv = 0}
				deck_layer3 = {desc_id = #"layer 99" uv_u = -18.96103477 uv_v = 3.50649309 uv_scale = 155.71421814 uv_rot = 0.0 use_default_uv = 0}
			}
			face_points = {
				left_eye = [44, 52]
				right_eye = [87, 52]
				nose = [64, 83]
				lips = [65, 97]
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = vert
				age = 30
				hometown = "Randolph, NJ"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Josh"
			name = "Glycerin"
			alias = "Glycerin"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Grey Skin 1"}
				skater_m_hair = {desc_id = bald}
				skater_m_torso = {desc_id = #"Hoody Up" h = 15 s = 9 v = 18 use_default_hsv = 0}
				front_logo = {desc_id = None}
				back_logo = {desc_id = THUG}
				skater_m_legs = {desc_id = Baggy h = 335 s = 0 v = 14 use_default_hsv = 0}
				shoes = {desc_id = #"Vallely Shoe"}
				accessories = {desc_id = #"Wrist Bands" h = 50 s = 0 v = 16 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
			}
			face_points = {
				left_eye = [32, 47]
				right_eye = [95, 47]
				nose = [63, 77]
				lips = [62, 105]
				h = 2.46000004
				s = 0.0
				v = 0.85000002
			}
			face_overlay = "faces\CS_NSN_Head_gry_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = vert
				age = 24
				hometown = "L-Town"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Dave"
			name = "Dave Cowling"
			alias = "TOPBLOKE"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1"}
				skater_m_hair = {desc_id = buzzed}
				skater_m_torso = {desc_id = #"Baseball-T"}
				front_logo = {desc_id = Neversoft}
				back_logo = {desc_id = THUG}
				skater_m_legs = {desc_id = #"Baggy Cargo"}
				shoes = {desc_id = #"Glifberg Shoe"}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = #"Sideburns 2" h = 5 s = 20 v = 54 use_default_hsv = 0}
				hat = {desc_id = #"Head Phones"}
				torso_bone_group = {x = 103 y = 103 z = 100 use_default_scale = 0}
			}
			face_points = {
				left_eye = [48, 58]
				right_eye = [76, 59]
				nose = [63, 77]
				lips = [63, 93]
				h = 1.78600001
				s = 1.08000004
				v = 0.93000001
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 32
				hometown = "Norf London"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Alan"
			name = "Alan Flores"
			alias = "Alan Flores"
			profile =
			{sleeves = {desc_id = None h = 0 s = 0 v = 12 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1"}
				skater_m_hair = {desc_id = #"Long 1"}
				skater_m_torso = {desc_id = #"T-shirt" h = 0 s = 0 v = 12 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Cargo Shorts" h = 115 s = 26 v = 38 use_default_hsv = 0}
				shoes = {desc_id = #"50s Shoe"}
				accessories = {desc_id = #"Wrist watch L"}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = Lambchops}
				hat = {desc_id = #"Viking Helmet"}
				front_logo = {desc_id = Spot}
				skater_m_socks = {desc_id = Medium}
				elbowpads = {desc_id = None}
				kneepads = {desc_id = None}
			}
			face_points = {
				left_eye = [32, 27]
				right_eye = [94, 29]
				nose = [65, 53]
				lips = [64, 80]
				h = 358.45300293
				s = 0.81999999
				v = 1.00999999
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = street
				age = 33
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Pete"
			name = "Pete Day"
			alias = "buffoon"
			profile =
			{sleeves = {desc_id = None h = 190 s = 29 v = 16 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1" h = 195 s = 35 v = 42 use_default_hsv = 0}
				skater_m_hair = {desc_id = bald}
				skater_m_torso = {desc_id = #"T-shirt" h = 195 s = 32 v = 14 use_default_hsv = 0}
				front_logo = {desc_id = Neversoft}
				back_logo = {desc_id = THUG}
				skater_m_legs = {desc_id = #"Cargo Shorts" h = 70 s = 32 v = 20 use_default_hsv = 0}
				shoes = {desc_id = #"Slip on's" h = 200 s = 17 v = 34 use_default_hsv = 0}
				accessories = {desc_id = #"Wrist watch L"}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				hat = {desc_id = #"Top Hat"}
				skater_m_socks = {desc_id = Medium}
				head_bone_group = {x = 99 y = 100 z = 107 use_default_scale = 0}
				nose_bone_group = {x = 100 y = 100 z = 97 use_default_scale = 0}
				Jaw_bone_group = {x = 100 y = 100 z = 116 use_default_scale = 0}
				stomach_bone_group = {x = 111 y = 111 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 94 y = 94 z = 100 use_default_scale = 0}
			}
			face_points = {
				left_eye = [44, 56]
				right_eye = [82, 55]
				nose = [65, 82]
				lips = [66, 96]
				h = 2.46000004
				s = 0.89999998
				v = 0.87
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 41
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_SteveS"
			name = "The Swink"
			alias = "The Swink"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1"}
				skater_m_hair = {desc_id = #"Long 1" h = 40 s = 38 v = 58 use_default_hsv = 0}
				skater_m_torso = {desc_id = Collar h = 0 s = 0 v = 12 use_default_hsv = 0}
				skater_m_legs = {desc_id = denim h = 35 s = 20 v = 38 use_default_hsv = 0}
				shoes = {desc_id = #"mullen Shoe"}
				accessories = {desc_id = #"Spike Band L"}
				board = {desc_id = #"default" h = 50 s = 0 v = 0 use_default_hsv = 1}
				griptape = {desc_id = #"Generic 2"}
				deck_graphic = {desc_id = #"PR Deck 17"}
				head_bone_group = {x = 104 y = 102 z = 96 use_default_scale = 0}
				nose_bone_group = {x = 100 y = 108 z = 91 use_default_scale = 0}
				Jaw_bone_group = {x = 116 y = 99 z = 91 use_default_scale = 0}
				headtop_bone_group = {x = 91 y = 100 z = 112 use_default_scale = 0}
				skater_m_jaw = {desc_id = #"Sideburns 1" h = 45 s = 71 v = 36 use_default_hsv = 0}
				object_scaling = {x = 103 y = 103 z = 103 use_default_scale = 0}
				upper_arm_bone_group = {x = 107 y = 107 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				lower_arm_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 104 y = 104 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 111 y = 111 z = 100 use_default_scale = 0}
			}
			face_points = {
				left_eye = [36, 47]
				right_eye = [96, 47]
				nose = [67, 75]
				lips = [66, 94]
				h = 0.78299999
				s = 0.92000002
				v = 0.94999999
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = street
				age = 23
				hometown = "San Jose, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_MikeO"
			name = "Mikey Ortai"
			alias = "MOREUBERTHANED"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1"}
				skater_m_hair = {desc_id = Spiked h = 20 s = 30 v = 12 use_default_hsv = 0}
				skater_m_torso = {desc_id = Shirtless}
				skater_m_legs = {desc_id = #"denim Shorts"}
				accessories = {desc_id = #"Wrist Band R" h = 0 s = 0 v = 18 use_default_hsv = 0}
				board = {desc_id = #"default" h = 0 s = 0 v = 12 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 9"}
				shoes = {desc_id = #"Vallely Shoe"}
				head_tattoo = {desc_id = None}
				back_tattoo = {desc_id = #"Tattoo 12" uv_u = 0.0 uv_v = -58.05192566 uv_scale = 115.19476318 uv_rot = 0.0 use_default_uv = 0}
				left_bicep_tattoo = {desc_id = None}
				left_forearm_tattoo = {desc_id = #"Tattoo 4" uv_u = 0.0 uv_v = 19.3506279 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 0}
				left_leg_tattoo = {desc_id = #"Tattoo 1" uv_u = 0.0 uv_v = 55.71430206 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 0}
				chest_tattoo = {desc_id = None}
				lower_leg_bone_group = {x = 106 y = 106 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 98 y = 98 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 101 y = 101 z = 100 use_default_scale = 0}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 3"}
				deck_layer5 = {desc_id = None}
			}
			face_points = {
				left_eye = [42, 46]
				right_eye = [88, 45]
				nose = [66, 68]
				lips = [67, 86]
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = vert
				age = 24
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Paul"
			name = "Paul Robinson"
			alias = "POOPER"
			profile =
			{sleeves = {desc_id = None h = 25 s = 68 v = 44 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"medium 1" h = 20 s = 32 v = 24 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Shirt line" h = 25 s = 68 v = 44 use_default_hsv = 0}
				front_logo = {desc_id = THUG uv_u = 0.0 uv_v = 15.71428204 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 0}
				back_logo = {desc_id = None}
				skater_m_legs = {desc_id = Jogger h = 20 s = 63 v = 26 use_default_hsv = 0}
				accessories = {desc_id = #"Wrist watch L" h = 0 s = 8 v = 14 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = #"Sideburns 1"}
				object_scaling = {x = 104 y = 104 z = 104 use_default_scale = 0}
				torso_bone_group = {x = 104 y = 104 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 107 y = 107 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 112 y = 112 z = 100 use_default_scale = 0}
				shoes = {desc_id = classic h = 45 s = 47 v = 36 use_default_hsv = 0}
				hat = {desc_id = None}
			}
			face_points = {
				left_eye = [44, 40]
				right_eye = [87, 42]
				nose = [65, 70]
				lips = [66, 88]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 30
				hometown = "Thorne, England"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Jeff"
			name = "Jeff Morgan"
			alias = "NSJEFF"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1" h = 0 s = 6 v = 60 use_default_hsv = 0}
				skater_m_hair = {desc_id = #"Medium 2" h = 15 s = 20 v = 22 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Collar Stripe 2" h = 235 s = 36 v = 18 use_default_hsv = 0}
				skater_m_legs = {desc_id = brown h = 220 s = 8 v = 12 use_default_hsv = 0}
				accessories = {desc_id = None}
				board = {desc_id = #"default" h = 115 s = 90 v = 60 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 9"}
				Jaw_bone_group = {x = 97 y = 76 z = 103 use_default_scale = 0}
				head_bone_group = {x = 90 y = 100 z = 108 use_default_scale = 0}
				nose_bone_group = {x = 88 y = 115 z = 76 use_default_scale = 0}
				headtop_bone_group = {x = 76 y = 100 z = 107 use_default_scale = 0}
				torso_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				shoes = {desc_id = #"Generic Shoe 2" h = 315 s = 0 v = 14 use_default_hsv = 0}
				deck_layer4 = {desc_id = None}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 32"}
			}
			face_points = {
				left_eye = [41, 41]
				right_eye = [93, 41]
				nose = [65, 73]
				lips = [66, 104]
				h = 350.11700439
				s = 2.0
				v = 0.79000002
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 29
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Garrett"
			name = "grjost"
			alias = "grjost"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1"}
				skater_m_hair = {desc_id = #"Part Side R" h = 45 s = 17 v = 42 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt"}
				front_logo = {desc_id = Neversoft}
				back_logo = {desc_id = THUG}
				skater_m_legs = {desc_id = denim}
				shoes = {desc_id = #"Campbell Shoe"}
				accessories = {desc_id = #"Wrist watch L"}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = None}
				hat = {desc_id = None}
				glasses = {desc_id = None}
			}
			face_points = {
				left_eye = [47, 54]
				right_eye = [90, 54]
				nose = [69, 81]
				lips = [69, 99]
				h = 4.79199982
				s = 0.89999998
				v = 1.07000005
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 34
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Ken"
			name = "Kendall"
			alias = "FROGHAM"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"Part Side R" h = 35 s = 15 v = 30 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Suit Coat"}
				skater_m_legs = {desc_id = #"Cord Shorts"}
				shoes = {desc_id = #"50s Shoe"}
				accessories = {desc_id = #"Wrist Bands" h = 50 s = 0 v = 16 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				glasses = {desc_id = #"Casual H"}
				skater_m_socks = {desc_id = Medium h = 335 s = 8 v = 12 use_default_hsv = 0}
			}
			face_points =
			{
				left_eye = [40, 49]
				right_eye = [83, 49]
				nose = [62, 77]
				lips = [62, 94]
				h = 4.11199999
				s = 0.92000002
				v = 0.99000001
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = street
				age = 34
				hometown = "Frogham, UK"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Adam"
			name = "Adam Lippmann"
			alias = "THEDOC"
			profile =
			{sleeves = {desc_id = None h = 0 s = 0 v = 14 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"Part Side L" h = 50 s = 23 v = 26 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Baseball-T" h = 200 s = 0 v = 12 use_default_hsv = 0}
				front_logo = {desc_id = Neversoft}
				back_logo = {desc_id = THUG}
				skater_m_legs = {desc_id = denim h = 205 s = 9 v = 20 use_default_hsv = 0}
				shoes = {desc_id = #"hawk Shoe"}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = None}
				hat = {desc_id = #"Forward Cap" h = 195 s = 6 v = 20 use_default_hsv = 0}
				hat_logo = {desc_id = None}
				glasses = {desc_id = #"Casual P" h = 35 s = 57 v = 44 use_default_hsv = 0}
			}
			face_points = {
				left_eye = [47, 62]
				right_eye = [68, 63]
				nose = [57, 75]
				lips = [57, 84]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 24
				hometown = "N.Huntingdon,PA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_JasonU"
			name = "Jason Uyeda"
			alias = "Jason Uyeda"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1"}
				skater_m_hair = {desc_id = #"Medium 4" h = 20 s = 35 v = 20 use_default_hsv = 0}
				skater_m_torso = {desc_id = Hawaiian h = 225 s = 44 v = 60 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Bunched Cargo" h = 45 s = 5 v = 44 use_default_hsv = 0}
				accessories = {desc_id = #"Arm Band L"}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				head_bone_group = {x = 100 y = 100 z = 93 use_default_scale = 0}
				skater_m_backpack = {desc_id = #"Backpack 6"}
				shoes = {desc_id = #"Bare Feet"}
				torso_bone_group = {x = 110 y = 110 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				head_tattoo = {desc_id = None}
				right_leg_tattoo = {desc_id = None}
				right_forearm_tattoo = {desc_id = None}
			}
			face_points = {
				left_eye = [47, 52]
				right_eye = [87, 54]
				nose = [69, 81]
				lips = [69, 101]
				h = 5.11999989
				s = 0.89999998
				v = 0.87
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 29
				hometown = "A Bar near you"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Tao"
			name = "tao zheng"
			alias = "tao zheng"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1"}
				skater_m_hair = {desc_id = #"Part Side L"}
				skater_m_torso = {desc_id = #"T-shirt"}
				front_logo = {desc_id = Adio}
				back_logo = {desc_id = THUG}
				skater_m_legs = {desc_id = denim}
				shoes = {desc_id = #"B-Ball"}
				accessories = {desc_id = #"Wrist Bands" h = 50 s = 0 v = 16 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				head_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				Jaw_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				object_scaling = {x = 100 y = 100 z = 100 use_default_scale = 0}
				headtop_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				nose_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
			}
			face_points = {
				left_eye = [47, 53]
				right_eye = [83, 53]
				nose = [63, 78]
				lips = [64, 97]
				h = 358.45901489
				s = 0.77999997
				v = 0.85000002
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 30
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_ChrisR"
			name = "Chris Rausch"
			alias = "Chris Rausch"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1" h = 0 s = 50 v = 50 use_default_hsv = 1}
				skater_m_hair = {desc_id = buzzed h = 40 s = 29 v = 30 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Button SS 1" h = 25 s = 38 v = 22 use_default_hsv = 0}
				skater_m_legs = {desc_id = Baggy h = 215 s = 17 v = 26 use_default_hsv = 0}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = #"Sideburns 1" h = 15 s = 44 v = 52 use_default_hsv = 0}
				hat = {desc_id = #"Forward Cap" h = 30 s = 35 v = 60 use_default_hsv = 0}
				glasses = {desc_id = None}
				shoes = {desc_id = #"Vallely Shoe"}
				hat_logo = {desc_id = Independent}
			}
			face_points = {
				left_eye = [33, 23]
				right_eye = [92, 23]
				nose = [63, 58]
				lips = [65, 88]
				h = 1.12600005
				s = 0.83999997
				v = 1.02999997
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 29
				hometown = "O.C."
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Cody"
			name = "Captain Cody"
			alias = "arrr"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2" h = 0 s = 0 v = 58 use_default_hsv = 0}
				skater_m_hair = {desc_id = #"Mohawk 1"}
				skater_m_torso = {desc_id = Shirtless}
				skater_m_legs = {desc_id = snow h = 0 s = 2 v = 18 use_default_hsv = 0}
				accessories = {desc_id = #"Spike Bands"}
				board = {desc_id = #"default" h = 100 s = 8 v = 38 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = #"Honest Abe" h = 35 s = 32 v = 60 use_default_hsv = 0}
				head_bone_group = {x = 94 y = 100 z = 100 use_default_scale = 0}
				headtop_bone_group = {x = 107 y = 109 z = 98 use_default_scale = 0}
				Jaw_bone_group = {x = 97 y = 83 z = 85 use_default_scale = 0}
				nose_bone_group = {x = 95 y = 104 z = 87 use_default_scale = 0}
				hat = {desc_id = #"Pirate Hat"}
				glasses = {desc_id = #"Eye Patch"}
				torso_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 96 y = 96 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 105 y = 105 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				chest_tattoo = {desc_id = #"Tattoo 19" uv_u = -0.25974101 uv_v = -31.16882515 uv_scale = 199.87013245 uv_rot = 1.03896797 use_default_uv = 0}
				object_scaling = {x = 106 y = 106 z = 106 use_default_scale = 0}
				back_tattoo = {desc_id = #"Tattoo 3" uv_u = -1.16883099 uv_v = -0.779221 uv_scale = 71.94805145 uv_rot = 357.14279175 use_default_uv = 0}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 24"}
				deck_layer5 = {desc_id = #"layer 57" uv_u = 0.0 uv_v = -124.28562927 uv_scale = 100.0 uv_rot = 92.20774841 use_default_uv = 0}
				deck_layer1 = {desc_id = #"layer 71" uv_u = 0.0 uv_v = 35.19479752 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 0 h = 0 s = 50 v = 50 use_default_hsv = 1}
				deck_layer2 = {desc_id = #"layer 64" uv_u = 0.0 uv_v = -49.99998474 uv_scale = 100.38961029 uv_rot = 94.80513 use_default_uv = 0 h = 0 s = 50 v = 50 use_default_hsv = 1}
				deck_layer3 = {desc_id = #"layer 81" uv_u = 0.0 uv_v = 121.68823242 uv_scale = 100.0 uv_rot = 91.16880798 use_default_uv = 0}
				shoes = {desc_id = #"Bare Feet"}
			}
			face_points = {
				left_eye = [48, 52]
				right_eye = [79, 53]
				nose = [63, 78]
				lips = [63, 94]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = vert
				age = 24
				hometown = "The Seven Seas"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Brad"
			name = "Brad Bulkley"
			alias = "fatass"
			profile =
			{sleeves = {desc_id = None h = 0 s = 0 v = 38 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"Slick 2" h = 225 s = 18 v = 18 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Shirt line" h = 0 s = 0 v = 38 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Baggy Cargo" h = 200 s = 17 v = 26 use_default_hsv = 0}
				shoes = {desc_id = #"Generic Shoe 1"}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = #"Sideburns 2" h = 240 s = 54 v = 12 use_default_hsv = 0}
				front_logo = {desc_id = THUG uv_u = 0.0 uv_v = 0.64934999 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 0}
				back_logo = {desc_id = Neversoft uv_u = 0.0 uv_v = -4.80519104 uv_scale = 75.97402954 uv_rot = 0.0 use_default_uv = 0}
				headtop_bone_group = {x = 102 y = 108 z = 89 use_default_scale = 0}
				head_bone_group = {x = 98 y = 98 z = 93 use_default_scale = 0}
				nose_bone_group = {x = 93 y = 105 z = 98 use_default_scale = 0}
				Jaw_bone_group = {x = 114 y = 97 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 101 y = 101 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 94 y = 94 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 106 y = 106 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 98 y = 98 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 97 y = 97 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 96 y = 96 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 94 y = 94 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 101 y = 101 z = 100 use_default_scale = 0}
			}
			face_points =
			{
				left_eye = [47, 61]
				right_eye = [78, 60]
				nose = [61, 80]
				lips = [61, 93]
				h = 355.12298584
				s = 0.95999998
				v = 1.11000001
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 25
				hometown = "Los Angeles,CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_NolanN"
			name = "Nolan Nelson"
			alias = "Noly"
			profile =
			{sleeves = {desc_id = None h = 335 s = 0 v = 12 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"Long 1" h = 30 s = 41 v = 50 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt" h = 0 s = 0 v = 12 use_default_hsv = 0}
				skater_m_legs = {desc_id = denim}
				shoes = {desc_id = #"Slip on's" h = 185 s = 6 v = 42 use_default_hsv = 0}
				accessories = {desc_id = Skeletonarms}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_socks = {desc_id = None}
				front_logo = {desc_id = Riktor}
				back_logo = {desc_id = #"Braineaters.com" uv_u = 0.0 uv_v = 59.99998474 uv_scale = 50.0 uv_rot = 0.0 use_default_uv = 0}
				glasses = {desc_id = #"Big Shades"}
			}
			face_points = {
				left_eye = [40, 47]
				right_eye = [85, 47]
				nose = [61, 80]
				lips = [63, 100]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 93
				hometown = "Northskull"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_ChrisW"
			name = "Wardy"
			alias = "leedsleedsleeds"
			profile =
			{
				sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1"}
				skater_m_hair = {desc_id = #"Slick 3" h = 45 s = 50 v = 58 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Tiki Style"}
				skater_m_legs = {desc_id = brown h = 15 s = 62 v = 26 use_default_hsv = 0}
				shoes = {desc_id = Boots h = 355 s = 8 v = 20 use_default_hsv = 0}
				accessories = {desc_id = #"Wrist Band L" h = 15 s = 8 v = 14 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = None}
				glasses = {desc_id = #"Casual O"}
				head_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				nose_bone_group = {x = 127 y = 150 z = 99 use_default_scale = 0}
				headtop_bone_group = {x = 107 y = 100 z = 100 use_default_scale = 0}
				Jaw_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				torso_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				stomach_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				feet_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
			}
			face_points = {
				left_eye = [46, 47]
				right_eye = [85, 47]
				nose = [65, 73]
				lips = [65, 98]
				h = 2.45600009
				s = 1.03999996
				v = 0.93000001
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = vert
				age = 35
				hometown = "Venice, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Kevin"
			name = "Kevin Mulhall"
			alias = "Guilt Ladle"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2" h = 0 s = 50 v = 50 use_default_hsv = 1}
				skater_m_hair = {desc_id = #"Slick 3"}
				skater_m_torso = {desc_id = #"T-shirt"}
				skater_m_legs = {desc_id = Baggy h = 215 s = 32 v = 40 use_default_hsv = 0}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				deck_layer1 = {desc_id = None}
				deck_layer2 = {desc_id = None}
				deck_layer3 = {desc_id = None}
				deck_layer4 = {desc_id = None}
				deck_layer5 = {desc_id = None}
				cad_graphic = {desc_id = None}
				hat = {desc_id = #"Electric Wizard"}
				glasses = {desc_id = None}
				shoes = {desc_id = #"high tops"}
				front_logo = {desc_id = Guilt}
				head_bone_group = {x = 105 y = 105 z = 104 use_default_scale = 0}
			}
			face_points =
			{
				left_eye = [31, 31]
				right_eye = [96, 30]
				nose = [64, 72]
				lips = [63, 98]
				h = 2.46000004
				s = 0.89999998
				v = 1.02999997
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 28
				hometown = "Newbury Park,CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Kurt"
			name = "sik®"
			alias = "sik®"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"Medium 4"}
				skater_m_torso = {desc_id = #"Rain Camo"}
				skater_m_legs = {desc_id = #"Bunched Cargo"}
				shoes = {desc_id = classic}
				accessories = {desc_id = Gloves}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				nose_bone_group = {x = 113 y = 96 z = 90 use_default_scale = 0}
				head_bone_group = {x = 98 y = 95 z = 98 use_default_scale = 0}
				stomach_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 106 y = 106 z = 100 use_default_scale = 0}
				headtop_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				Jaw_bone_group = {x = 87 y = 100 z = 100 use_default_scale = 0}
				torso_bone_group = {x = 106 y = 106 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 109 y = 109 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 97 y = 97 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 97 y = 97 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 120 y = 120 z = 100 use_default_scale = 0}
				board_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				object_scaling = {x = 108 y = 108 z = 108 use_default_scale = 0}
				left_forearm_tattoo = {desc_id = None}
				right_forearm_tattoo = {desc_id = None}
				left_bicep_tattoo = {desc_id = None}
				right_bicep_tattoo = {desc_id = None}
				chest_tattoo = {desc_id = None}
				hat = {desc_id = None}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 8"}
			}
			face_points = {
				left_eye = [35, 40]
				right_eye = [88, 40]
				nose = [62, 68]
				lips = [62, 93]
				h = 3.78600001
				s = 0.86000001
				v = 0.99000001
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 27
				hometown = "TORRANCE, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Michelle"
			name = "Michelle Deyo"
			alias = "WOODCHUCK"
			profile =
			{sleeves = {desc_id = None}
				skater_f_head = {desc_id = #"Light Skin 1" h = 65 s = 14 v = 50 use_default_hsv = 0}
				skater_f_hair = {desc_id = Bushy h = 265 s = 90 v = 60 use_default_hsv = 0}
				body = {desc_id = FemaleBody}
				board = {desc_id = #"default" h = 95 s = 90 v = 60 use_default_hsv = 0}
				deck_graphic = {desc_id = None}
				griptape = {desc_id = #"Generic 9"}
				right_leg_tattoo = {desc_id = None}
				chest_tattoo = {desc_id = #"Tattoo 31"}
				back_tattoo = {desc_id = #"Tattoo 20"}
				skater_f_torso = {desc_id = #"Leather Vest"}
				skater_f_legs = {desc_id = #"Shorts Daisy" h = 235 s = 0 v = 36 use_default_hsv = 0}
				shoes = {desc_id = #"Biker Boots"}
				body_shape = female_scale_info left_leg_tattoo = {desc_id = None}
				left_bicep_tattoo = {desc_id = None}
				right_bicep_tattoo = {desc_id = None}
				left_forearm_tattoo = {desc_id = #"Tattoo 11" uv_u = 0.0 uv_v = -105.19475555 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 0}
				right_forearm_tattoo = {desc_id = #"Tattoo 11" uv_u = 0.0 uv_v = -107.92203522 uv_scale = 100.0 uv_rot = 0.0 use_default_uv = 0}
				torso_bone_group = {x = 105 y = 105 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 116 y = 116 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 102 y = 102 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 105 y = 105 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 106 y = 106 z = 100 use_default_scale = 0}
				head_bone_group = {x = 110 y = 100 z = 95 use_default_scale = 0}
				Jaw_bone_group = {x = 95 y = 95 z = 95 use_default_scale = 0}
				nose_bone_group = {x = 114 y = 107 z = 90 use_default_scale = 0}
				headtop_bone_group = {x = 113 y = 99 z = 75 use_default_scale = 0}
				accessories = {desc_id = #"Wrist Tape" h = 0 s = 0 v = 18 use_default_hsv = 0}
				hat = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 24"}
			}
			face_points = {
				left_eye = [46, 53]
				right_eye = [84, 52]
				nose = [66, 79]
				lips = [65, 94]
			}
			face_overlay = "faces\CS_NSN_Head_f_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = always_mongo
				trickstyle = street
				age = 25
				hometown = "Hollyweird, CA"
				is_male = 0
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Rulon"
			name = "Rulon Raymond"
			alias = "1337"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1"}
				skater_m_hair = {desc_id = #"Slick 1" h = 40 s = 23 v = 18 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"LS Open Skin" h = 355 s = 0 v = 12 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Baggy Cargo" h = 85 s = 0 v = 12 use_default_hsv = 0}
				shoes = {desc_id = #"Burnquist Shoe"}
				accessories = {desc_id = #"Wrist Tape R"}
				board = {desc_id = #"default" h = 0 s = 0 v = 12 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 9"}
				skater_m_socks = {desc_id = Ankle}
				object_scaling = {x = 105 y = 105 z = 105 use_default_scale = 0}
				headtop_bone_group = {x = 100 y = 112 z = 112 use_default_scale = 0}
				head_bone_group = {x = 100 y = 100 z = 94 use_default_scale = 0}
				nose_bone_group = {x = 100 y = 102 z = 96 use_default_scale = 0}
				Jaw_bone_group = {x = 100 y = 99 z = 104 use_default_scale = 0}
				torso_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				stomach_bone_group = {x = 90 y = 90 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 107 y = 107 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 113 y = 113 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 108 y = 108 z = 100 use_default_scale = 0}
				upper_leg_bone_group = {x = 95 y = 95 z = 100 use_default_scale = 0}
				lower_leg_bone_group = {x = 93 y = 93 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 110 y = 110 z = 100 use_default_scale = 0}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 17"}
				deck_layer4 = {desc_id = #"layer 10" uv_u = 49.61037827 uv_v = 0.0 uv_scale = 100.0 uv_rot = 32.4675293 use_default_uv = 0}
				deck_layer5 = {desc_id = #"layer 18" uv_u = 0.0 uv_v = 149.87002563 uv_scale = 158.57136536 uv_rot = 0.0 use_default_uv = 0 h = 50 s = 50 v = 38 use_default_hsv = 0}
				deck_layer1 = {desc_id = #"layer 33" uv_u = 0.0 uv_v = -50.77920532 uv_scale = 197.40248108 uv_rot = 0.0 use_default_uv = 0}
				deck_layer2 = {desc_id = #"layer 34" uv_u = 0.0 uv_v = -2.72727299 uv_scale = 191.42845154 uv_rot = 0.0 use_default_uv = 0}
				deck_layer3 = {desc_id = #"layer 17" uv_u = 1.16883099 uv_v = 46.75323486 uv_scale = 176.62329102 uv_rot = 359.48052979 use_default_uv = 0}
			}
			face_points = {
				left_eye = [36, 40]
				right_eye = [93, 40]
				nose = [65, 72]
				lips = [65, 102]
				h = 3.78699994
				s = 1.15999997
				v = 0.99000001
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 20
				hometown = "Weston, CO"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Joel"
			name = "Joel Jewett"
			alias = "Joel Jewett"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2"}
				skater_m_hair = {desc_id = #"medium 1"}
				skater_m_torso = {desc_id = #"Baggy Vest"}
				skater_m_legs = {desc_id = Tight}
				shoes = {desc_id = #"cowboy boots"}
				accessories = {desc_id = #"Wrist Bands" h = 50 s = 0 v = 16 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				hat = {desc_id = Cowboy}
				skater_m_jaw = {desc_id = #"Handle bars"}
			}
			face_points = {
				left_eye = [43, 39]
				right_eye = [93, 29]
				nose = [69, 71]
				lips = [69, 90]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 40
				hometown = "Great Falls, MT"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_DaveS"
			name = "Dave Stohl"
			alias = "Dave Stohl"
			profile =
			{sleeves = {desc_id = None}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1"}
				skater_m_hair = {desc_id = #"Slick 1" h = 55 s = 29 v = 58 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"Zero Team" h = 240 s = 74 v = 58 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Cargo Shorts" h = 50 s = 23 v = 40 use_default_hsv = 0}
				shoes = {desc_id = #"Slip on's"}
				accessories = {desc_id = #"Wrist watch L"}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				head_bone_group = {x = 104 y = 102 z = 99 use_default_scale = 0}
				hat = {desc_id = #"Head Phones"}
				headtop_bone_group = {x = 106 y = 124 z = 121 use_default_scale = 0}
				nose_bone_group = {x = 100 y = 127 z = 100 use_default_scale = 0}
				Jaw_bone_group = {x = 120 y = 91 z = 104 use_default_scale = 0}
				torso_bone_group = {x = 102 y = 102 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 97 y = 97 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 111 y = 111 z = 100 use_default_scale = 0}
				object_scaling = {x = 105 y = 105 z = 105 use_default_scale = 0}
				skater_m_socks = {desc_id = None}
				lower_leg_bone_group = {x = 106 y = 106 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 116 y = 116 z = 100 use_default_scale = 0}
			}
			face_points =
			{
				left_eye = [48, 51]
				right_eye = [84, 49]
				nose = [68, 72]
				lips = [68, 91]
				h = 5.11600018
				s = 0.89999998
				v = 1.35000002
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 33
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Stacy"
			name = "Stacey D"
			alias = "Stacey D"
			profile =
			{sleeves = {desc_id = None h = 230 s = 35 v = 16 use_default_hsv = 0}
				skater_f_head = {desc_id = #"Light Skin 1"}
				skater_f_hair = {desc_id = Ponytail1}
				body = {desc_id = FemaleBody}
				board = {desc_id = #"default"}
				deck_graphic = {desc_id = #"CAS 2"}
				griptape = {desc_id = #"Generic 9"}
				right_leg_tattoo = {desc_id = #"Tattoo 8"}
				chest_tattoo = {desc_id = #"Tattoo 12"}
				back_tattoo = {desc_id = #"Tattoo 20"}
				skater_f_torso = {desc_id = #"Baseball-T" h = 145 s = 0 v = 50 use_default_hsv = 0}
				skater_f_legs = {desc_id = Baggy h = 220 s = 41 v = 30 use_default_hsv = 0}
				body_shape = female_scale_info shoes = {desc_id = #"Glifberg Shoe"}
				glasses = {desc_id = #"Casual J" h = 30 s = 42 v = 60 use_default_hsv = 0}
				nose_bone_group = {x = 74 y = 100 z = 92 use_default_scale = 0}
				torso_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 0}
				stomach_bone_group = {x = 93 y = 93 z = 100 use_default_scale = 0}
				accessories = {desc_id = #"Wrist watch L" h = 225 s = 33 v = 32 use_default_hsv = 0}
				headtop_bone_group = {x = 95 y = 100 z = 100 use_default_scale = 0}
				Jaw_bone_group = {x = 110 y = 100 z = 102 use_default_scale = 0}
				head_bone_group = {x = 105 y = 100 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
			}
			face_points =
			{
				left_eye = [42, 54]
				right_eye = [83, 53]
				nose = [62, 78]
				lips = [62, 95]
				h = 2.45900011
				s = 0.69999999
				v = 1.25
			}
			face_overlay = "faces\CS_NSN_Head_f_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = street
				age = 26
				hometown = "So Cal"
				is_male = 0
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_MikeW"
			name = "Mike Ward"
			alias = "Mike Ward"
			profile =
			{sleeves = {desc_id = None h = 20 s = 5 v = 40 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Tan Skin 1"}
				skater_m_hair = {desc_id = #"Slick 3" h = 30 s = 26 v = 22 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt Long Sleeve" h = 115 s = 23 v = 22 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Cargo Shorts" h = 40 s = 38 v = 40 use_default_hsv = 0}
				accessories = {desc_id = #"Wrist Bands" h = 50 s = 0 v = 16 use_default_hsv = 0}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				deck_layer1 = {desc_id = None}
				deck_layer2 = {desc_id = None}
				deck_layer3 = {desc_id = None}
				deck_layer4 = {desc_id = None}
				deck_layer5 = {desc_id = None}
				cad_graphic = {desc_id = None}
				hat = {desc_id = None}
				front_logo = {desc_id = Activision}
				back_logo = {desc_id = McDonalds}
				shoes = {desc_id = #"Muska Shoe"}
				skater_m_socks = {desc_id = Ankle}
				object_scaling = {x = 103 y = 103 z = 103 use_default_scale = 0}
				skater_m_jaw = {desc_id = #"Goatee 2"}
				Jaw_bone_group = {x = 127 y = 100 z = 100 use_default_scale = 0}
				head_bone_group = {x = 100 y = 100 z = 96 use_default_scale = 0}
				nose_bone_group = {x = 98 y = 94 z = 73 use_default_scale = 0}
				headtop_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
			}
			face_points = {
				left_eye = [43, 56]
				right_eye = [90, 57]
				nose = [67, 83]
				lips = [67, 108]
				h = 2.78800011
				s = 1.12
				v = 0.85000002
			}
			face_overlay = "faces\CS_NSN_Head_tan_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = vert
				age = 40
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_AlexG"
			name = "Alex Garcia"
			alias = "Alex Garcia"
			profile =
			{sleeves = {desc_id = None h = 355 s = 0 v = 12 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 1" h = 25 s = 21 v = 60 use_default_hsv = 0}
				skater_m_hair = {desc_id = buzzed h = 20 s = 3 v = 12 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt" h = 0 s = 0 v = 12 use_default_hsv = 0}
				front_logo = {desc_id = Independent}
				back_logo = {desc_id = Independent}
				skater_m_legs = {desc_id = Baggy h = 215 s = 11 v = 24 use_default_hsv = 0}
				accessories = {desc_id = None}
				board = {desc_id = #"default"}
				griptape = {desc_id = #"Generic 9"}
				head_bone_group = {x = 100 y = 88 z = 110 use_default_scale = 0}
				headtop_bone_group = {x = 105 y = 97 z = 118 use_default_scale = 0}
				Jaw_bone_group = {x = 113 y = 95 z = 101 use_default_scale = 0}
				nose_bone_group = {x = 100 y = 100 z = 100 use_default_scale = 1}
				torso_bone_group = {x = 101 y = 101 z = 100 use_default_scale = 0}
				upper_arm_bone_group = {x = 114 y = 114 z = 100 use_default_scale = 0}
				lower_arm_bone_group = {x = 119 y = 119 z = 100 use_default_scale = 0}
				hands_bone_group = {x = 114 y = 114 z = 100 use_default_scale = 0}
				feet_bone_group = {x = 117 y = 117 z = 100 use_default_scale = 0}
				object_scaling = {x = 113 y = 113 z = 113 use_default_scale = 0}
				shoes = {desc_id = #"Lasek Vans Sk8 Hi"}
				hat = {desc_id = #"Backward Cap" h = 215 s = 38 v = 36 use_default_hsv = 0}
				glasses = {desc_id = #"Casual I"}
				hat_logo = {desc_id = Activision}
			}
			face_points =
			{
				left_eye = [47, 52]
				right_eye = [85, 52]
				nose = [64, 75]
				lips = [64, 96]
				h = 8.12100029
				s = 0.89999998
				v = 1.35000002
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Goofy
				pushstyle = never_mongo
				trickstyle = street
				age = 30
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
		{
			face_texture = "textures\skater_ns\NS_Head_Henry"
			name = "Henry Ji"
			alias = "Henry Ji"
			profile =
			{sleeves = {desc_id = None h = 140 s = 23 v = 26 use_default_hsv = 0}
				body = {desc_id = MaleBody}
				skater_m_head = {desc_id = #"Light Skin 2" h = 0 s = 50 v = 50 use_default_hsv = 1}
				skater_m_hair = {desc_id = #"Slick 3" h = 30 s = 0 v = 18 use_default_hsv = 0}
				skater_m_torso = {desc_id = #"T-shirt" h = 140 s = 23 v = 24 use_default_hsv = 0}
				skater_m_legs = {desc_id = #"Baggy Cargo" h = 20 s = 6 v = 40 use_default_hsv = 0}
				accessories = {desc_id = None}
				board = {desc_id = #"default" h = 45 s = 29 v = 46 use_default_hsv = 0}
				griptape = {desc_id = #"Generic 9"}
				skater_m_jaw = {desc_id = None}
				hat = {desc_id = None}
				left_forearm_tattoo = {desc_id = None}
				shoes = {desc_id = Flipflops h = 0 s = 6 v = 28 use_default_hsv = 0}
				deck_layer4 = {desc_id = #"layer 15"}
				deck_graphic = {desc_id = None}
				cad_graphic = {desc_id = #"CAS 25"}
				deck_layer5 = {desc_id = #"layer 10" uv_u = 5.19480515 uv_v = 0.0 uv_scale = 104.67529297 uv_rot = 208.57142639 use_default_uv = 0}
				deck_layer1 = {desc_id = #"layer 76" uv_u = 0.0 uv_v = -50.25972366 uv_scale = 180.50999451 9379 uv_rot = 91.42855072 use_default_uv = 0}
				deck_layer2 = {desc_id = #"layer 66" uv_u = -2.33766198 uv_v = 52.59738541 uv_scale = 200.0 uv_rot = 90.12984467 use_default_uv = 0}
			}
			face_points = {
				left_eye = [44, 40]
				right_eye = [87, 42]
				nose = [65, 70]
				lips = [66, 88]
			}
			face_overlay = "faces\CS_NSN_Head_wht_alpha"
			info = {
				stance = Regular
				pushstyle = never_mongo
				trickstyle = street
				age = 16
				hometown = "Los Angeles, CA"
				is_male = 1
			}
		}
	]
	script print_current_skater_profile
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if PlayerFaceIsValid player = <currentSkaterProfileIndex>
			GetPlayerFacePoints player = <currentSkaterProfileIndex>
		endif
		get_default_face_texture_name
		FormatText TextName = sname "name=\"%s\"" s = <display_name>
		if PlayerFaceIsValid player = <currentSkaterProfileIndex>
			FormatText TextName = sface_texture "face_texture = \"textures\\skater_ns\\NS_Head_ChrisW\""
			<left_eye> = (<current_face_points>.left_eye)
			<right_eye> = (<current_face_points>.right_eye)
			<nose> = (<current_face_points>.nose)
			<lips> = (<current_face_points>.lips)
			<face_h> = (<current_face_points>.h)
			<face_s> = (<current_face_points>.s)
			<face_v> = (<current_face_points>.v)
			FormatText TextName = sleft_eye "	left_eye = [%x,%y]" x = (<left_eye>[0]) y = (<left_eye>[1])
			FormatText TextName = sright_eye "	right_eye = [%x,%y]" x = (<right_eye>[0]) y = (<right_eye>[1])
			FormatText TextName = snose "	nose = [%x,%y]" x = (<nose>[0]) y = (<nose>[1])
			FormatText TextName = slips "	lips = [%x,%y]" x = (<lips>[0]) y = (<lips>[1])
			if GotParam face_h
				FormatText TextName = sh "	h = %i" i = <face_h>
				FormatText TextName = ss "	s = %i" i = <face_s>
				FormatText TextName = sv "	v = %i" i = <face_v>
			endif
		endif
		switch <overlayName>
			case CS_NSN_Head_wht_alpha
				<overlay> = "faces\\CS_NSN_Head_wht_alpha"
			case CS_NSN_Head_tan_alpha
				<overlay> = "faces\\CS_NSN_Head_tan_alpha"
			case CS_NSN_Head_blk_alpha
				<overlay> = "faces\\CS_NSN_Head_blk_alpha"
			case CS_NSN_Head_gry_alpha
				<overlay> = "faces\\CS_NSN_Head_gry_alpha"
			case CS_NSN_Head_f_wht_alpha
				<overlay> = "faces\\CS_NSN_Head_f_wht_alpha"
			case CS_NSN_Head_f_tan_alpha
				<overlay> = "faces\\CS_NSN_Head_f_tan_alpha"
			case CS_NSN_Head_f_blk_alpha
				<overlay> = "faces\\CS_NSN_Head_f_blk_alpha"
			case CS_NSN_Head_f_gry_alpha
				<overlay> = "faces\\CS_NSN_Head_f_gry_alpha"
			default
				<overlay> = "faces\\CS_NSN_Head_wht_alpha"
		endswitch
		FormatText TextName = sface_overlay "face_overlay = \"%s\"" s = <overlay>
		if (<stance> = Regular)
			FormatText TextName = sstance "	stance=Regular"
		else
			FormatText TextName = sstance "	stance=Goofy"
		endif
		if (<pushstyle> = never_mongo)
			FormatText TextName = spushstyle "	pushstyle=never_mongo"
		else
			if (<pushstyle> = mongo_when_switch)
				FormatText TextName = spushstyle "	pushstyle=mongo_when_switch"
			else
				FormatText TextName = spushstyle "	pushstyle=always_mongo"
			endif
		endif
		if (<trickstyle> = street)
			FormatText TextName = strickstyle "	trickstyle=street"
		else
			FormatText TextName = strickstyle "	trickstyle=vert"
		endif
		FormatText TextName = sage "	age=%s" s = <age>
		FormatText TextName = shometown "	hometown=\"%s\"" s = <hometown>
		FormatText TextName = sis_male "	is_male=%s" s = <is_male>
		printf " "
		printf "******************START SKATER PROFILE******************* "
		if PlayerFaceIsValid player = <currentSkaterProfileIndex>
			printf <sface_texture>
		endif
		printf <sname>
		printf "profile="
		PrintCurrentAppearance
		if PlayerFaceIsValid player = <currentSkaterProfileIndex>
			printf "face_points = {"
			printf <sleft_eye>
			printf <sright_eye>
			printf <snose>
			printf <slips>
			if GotParam face_h
				printf <sh>
				printf <ss>
				printf <sv>
			endif
			printf "}"
		endif
		printf <sface_overlay>
		printf "info={"
		printf <sstance>
		printf <spushstyle>
		printf <strickstyle>
		printf <sage>
		printf <shometown>
		printf <sis_male>
		printf "}"
		printf "*******************END SKATER PROFILE******************* "
	endscript
	script check_for_neversoft_skaters
		if NOT IsPs2
			return
		endif
		if NOT (give_neversoft_skaters = 0)
			GetCurrentSkaterProfileIndex
			SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {is_head_locked = 0 is_locked = 0}
			GetArraySize master_neversoft_skater_list
			<index> = 0
			while
				if StringEquals a = (master_neversoft_skater_list[<index>].alias) b = <name>
					GetCurrentSkaterProfileIndex
					SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = (master_neversoft_skater_list[<index>].profile)
					clear_face_texture_from_profile
					<face_texture_string> = (master_neversoft_skater_list[<index>].face_texture)
					if GotParam face_texture_string
						SetPlayerFaceTexture {
							player = <currentSkaterProfileIndex>
							texture = <face_texture_string>
							fullPathIncluded
						}
					endif
					face_overlay = (master_neversoft_skater_list[<index>].face_overlay)
					if GotParam face_overlay
						set_selected_skin_2 texture = <face_overlay>
					endif
					SetPlayerFacePoints {
						player = <currentSkaterProfileIndex>
						face_points = (master_neversoft_skater_list[<index>].face_points)
						width = 128
						height = 128
					}
					SetPlayerAppearance player = <currentSkaterProfileIndex> appearance_structure = (master_neversoft_skater_list[<index>].profile)
					<face_texture_string> = (master_neversoft_skater_list[<index>].face_texture)
					if GotParam face_texture_string
						SetPlayerFaceTexture {
							player = <currentSkaterProfileIndex>
							texture = <face_texture_string>
							fullPathIncluded
						}
					endif
					SetPlayerFacePoints {
						player = <currentSkaterProfileIndex>
						face_points = (master_neversoft_skater_list[<index>].face_points)
						width = 128
						height = 128
					}
					RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
					SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {display_name = (master_neversoft_skater_list[<index>].name) is_head_locked = 1 is_locked = 1 (master_neversoft_skater_list[<index>].info)}
					MakeSkaterGoto SkateshopAI params = {CAS_Screen}
					break
				else
				endif
				<index> = (<index> + 1)
			repeat <array_size>
		endif
	endscript
	script create_pre_cas_menu
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		dialog_box_exit
		Change in_deck_design = 0
		FormatText ChecksumName = title_icon "%i_edit_skater" i = (THEME_PREFIXES[current_theme_prefix])
		make_new_themed_sub_menu title = "CREATE OPTIONS" title_icon = <title_icon>
		create_helper_text generic_helper_text_no_back
		kill_start_key_binding
		if (in_cinematic_sequence = 1)
			allow_load = 0
		else
			if GameModeEquals is_career
				if (entered_cas_from_main = 1)
					allow_load = 1
				else
					allow_load = 0
				endif
			else
				allow_load = 1
			endif
		endif
		if (<allow_load> = 1)
			theme_menu_add_item {text = 'Create New'
				pad_choose_script = pre_cas_menu_exit
				pad_choose_params = {new_menu_script = cas_overwrite_warning title = 'Create New'}
				centered
			}
		endif
		theme_menu_add_item {text = 'Edit Current'
			pad_choose_script = pre_cas_menu_exit
			pad_choose_params = {new_menu_script = skateshop_create_cas_menu came_from_main_menu}
			centered
		}
		if (<allow_load> = 1)
			theme_menu_add_item {text = 'Load Skater'
				pad_choose_script = pre_cas_menu_exit
				pad_choose_params = {new_menu_script = cas_overwrite_warning title = 'Load Skater' callback = launch_load_cas_sequence}
				centered
			}
		endif
		theme_menu_add_item {text = 'Save Skater'
			pad_choose_script = pre_cas_menu_exit
			pad_choose_params = {new_menu_script = launch_save_cas_sequence}
			centered
		}
		if IsXbox
			currently_editing_custom
			if (<is_enabled> = 1)
				theme_menu_add_item {text = 'Face Mapping'
					pad_choose_script = pre_cas_menu_exit
					pad_choose_params = {new_menu_script = create_face_map_menu}
					centered
				}
			endif
		endif
		if ((GetGlobalFlag flag = CAD_UNLOCKED) || (all_levels_unlocked = 1))
			theme_menu_add_item {text = 'Design Deck'
				pad_choose_script = pre_cas_menu_exit
				pad_choose_params = {new_menu_script = create_deck_design_menu}
				centered
			}
		else
			theme_menu_add_item {text = 'Design Deck'
				pad_choose_script = pre_cas_menu_exit
				pad_choose_params = {new_menu_script = create_deck_design_menu}
				centered
				not_focusable
			}
		endif
		if NOT CD
			theme_menu_add_item {text = 'Debug CAS'
				pad_choose_script = pre_cas_menu_exit
				pad_choose_params = {new_menu_script = debug_the_cas}
				centered
			}
		endif
		if (in_cinematic_sequence = 1)
			theme_menu_add_item {text = 'Done'
				pad_choose_script = pre_cas_menu_exit
				pad_choose_params = {new_menu_script = show_intro_2}
				centered
				last_menu_item = last_menu_item
			}
		else
			theme_menu_add_item {text = 'Done'
				pad_choose_script = exit_cas
				centered
				last_menu_item = last_menu_item
			}
		endif
		FormatText ChecksumName = bg_piece_rgba "%i_BG_PARTS_COLOR" i = (THEME_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = SpriteElement
			parent = sub_menu
			pos = (304.0,86.0)
			texture = black
			rgba = [0 0 0 80]
			just = [center top]
			scale = (56.0,37.75)
			z_priority = -1
		}
		spawnscript set_cas_cam params = {wait_for_skater = <wait_for_skater>}
		if GotParam wait_for_skater
			finish_themed_sub_menu no_sound
		else
			finish_themed_sub_menu
		endif
	endscript
	script create_edit_skater_menu
		pulse_blur
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = edit_skater_anchor
			pos = (320.0,240.0)
			dims = (640.0,480.0)
		}
		AssignAlias id = edit_skater_anchor alias = current_menu_anchor
		SetScreenElementLock id = root_window on
		wait 1 gameframe
		SetScreenElementLock id = edit_skater_anchor off
		kill_start_key_binding
		<root_pos> = (50.0,50.0)
		<pos> = <root_pos>
		CreateScreenElement {
			type = ContainerElement
			parent = edit_skater_anchor
			id = edit_skater_anchor_top
			pos = (320.0,240.0)
			dims = (640.0,480.0)
		}
		edit_skater_create_top_bar scale = (1.0,1.0) parent = edit_skater_anchor_top root_pos = <root_pos> text = "EDIT SKATER"
		edit_skater_create_main_menu <...>
		if GotParam animate
			RunScriptOnScreenElement id = edit_skater_anchor_top select_skater_menu_animate_top
			RunScriptOnScreenElement id = edit_skater_anchor_middle select_skater_menu_animate_stats
		endif
	endscript
	script edit_skater_create_top_bar text = "" parent = select_skater_anchor pos = (-230.0,64.0)
		build_top_bar z_priority = -1 pos = <pos>
	endscript
	script eventually_setup_camera
		wait 1 gameframe
		skater::pausephysics
		UnPauseSkater 0
		MakeSkaterGoto SkateshopAI params = {CAS_Screen NOSFX}
		skater::Obj_MoveToNode orient name = cas_player_restart
		cas_setup_rotating_camera
	endscript
	script edit_skater_create_main_menu
		if LevelIs load_cas
			spawnscript eventually_setup_camera
		endif
		killspawnedscript name = cas_pull_back_camera
		Change pulled_back = 0
		Change current_cas_category = 0
		create_helper_text generic_helper_text_cas
		FormatText ChecksumName = title_icon "%i_edit_skater" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_sub_title title = "EDIT SKATER" title_icon = <title_icon>
		Change in_deck_design = 0
		Change in_boardshop = 0
		edit_skater_create_menu_block
		GetStackedScreenElementPos y id = edit_skater_menu_tab offset = (130.0,15.0)
		CreateScreenElement {
			type = VMenu
			parent = edit_skater_anchor_middle
			id = edit_skater_vmenu
			pos = <pos>
			just = [center top]
		}
		SetScreenElementProps {
			id = edit_skater_vmenu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = edit_skater_menu_exit <...>}}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			replace_handlers
		}
		if LevelIs load_cas
			SetScreenElementProps {
				id = edit_skater_vmenu
				event_handlers = [{pad_l1 cas_rotate_camera_left params = {wobble_cam}}
					{pad_r1 cas_rotate_camera_right params = {wobble_cam}}
				]
				replace_handlers
			}
		endif
		AssignAlias id = edit_skater_vmenu alias = current_menu
		edit_skater_icon_menu_add_item {
			text = 'Pre-made Skaters'
			pad_choose_script = edit_skater_premade_skater_menu
			child_texture = ED_secret
			index = 0
		}
		edit_skater_icon_menu_add_item {
			text = 'Information'
			pad_choose_script = edit_skater_info_menu
			child_texture = ED_info
			index = 1
		}
		edit_skater_icon_menu_add_item {
			text = 'Head Options'
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {category = 1 options_array = edit_skater_head_options cam_anim = head from_level_1}
			child_texture = ED_head
			is_enabled_script = check_if_group_editable
			is_enabled_params = {group = head_options}
			index = 2
		}
		edit_skater_icon_menu_add_item {
			text = 'Torso Options'
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {category = 2 options_array = edit_skater_torso_options cam_anim = adjtorso from_level_1}
			child_texture = ED_torso
			is_enabled_script = check_if_group_editable
			is_enabled_params = {group = torso_options}
			index = 3
		}
		edit_skater_icon_menu_add_item {
			text = 'Leg Options'
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {category = 3 options_array = edit_skater_leg_options cam_anim = legs from_level_1}
			child_texture = ED_legs
			is_enabled_script = check_if_group_editable
			is_enabled_params = {group = leg_options}
			index = 4
		}
		edit_skater_icon_menu_add_item {
			text = 'Tattoo Options'
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {category = 4 options_array = edit_skater_tattoo_options cam_anim = fullbody from_level_1 should_add_reset_tattoos = 1}
			child_texture = ED_tat
			is_enabled_script = check_if_group_editable
			is_enabled_params = {group = tattoo_options}
			index = 5
			is_visible_script = currently_editing_custom
		}
		edit_skater_icon_menu_add_item {
			text = 'Scale Options'
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {category = 5 options_array = edit_skater_scaling_options cam_anim = fullbody from_level_1 should_add_reset_scaling = 1}
			child_texture = ED_resize
			is_enabled_script = check_if_group_editable
			is_enabled_params = {group = scaling_options not_with_scaling_cheats}
			index = 6
			is_visible_script = currently_editing_custom
		}
		edit_skater_icon_menu_add_item {
			text = 'Pad Options'
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {category = 6 options_array = edit_skater_pad_options cam_anim = fullbody from_level_1}
			child_texture = ED_pads
			is_enabled_script = check_if_group_editable
			is_enabled_params = {group = pad_options}
			index = 7
		}
		edit_skater_menu_add_item {
			text = 'Done'
			pad_choose_script = edit_skater_menu_exit
			index = 10
		}
		FireEvent type = focus target = current_menu data = {grid_index = edit_skater_menu_level_1_index}
	endscript
	script edit_skater_premade_skater_menu from_level_1
		FormatText ChecksumName = title_icon "%i_edit_skater" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_sub_title title = "PRE-MADE" title_icon = <title_icon>
		edit_skater_create_menu_block {
			tab_texture = tab2
			middle_texture = repeat_piece2
			bottom_texture = menu_bottom
		}
		create_helper_text generic_helper_text_cas
		if GotParam parent_index
			Change edit_skater_menu_level_1_index = <parent_index>
		endif
		edit_skater_create_scrolling_menu {
			tab = tab2
			pad_back_script = edit_skater_create_main_menu
			pad_back_params = <pad_back_params>
			no_category_menu
		}
		GetArraySize custom_male_appearances
		index = 0
		while
			edit_skater_menu_add_item {
				text = ((custom_male_appearances[<index>]).name)
				pad_choose_script = edit_skater_premade_skater_choose
				pad_choose_params = {index = <options_index> appearance = ((custom_male_appearances[<index>]).struct) female = ((custom_male_appearances[<index>]).female)}
				focus_script = edit_skater_premade_skater_focus
				focus_params = {index = <options_index> appearance = ((custom_male_appearances[<index>]).struct)}
				tab = tab2
				index = <index>
				not_focusable = <not_focusable>
			}
			index = (<index> + 1)
		repeat <array_size>
		edit_skater_menu_add_item {
			text = "Done"
			pad_choose_script = edit_skater_create_main_menu
			pad_choose_params = <pad_back_params>
			tab = tab2
			index = <index>
		}
		FireEvent type = focus target = current_menu
	endscript
	script edit_skater_premade_skater_focus
		edit_skater_menu_focus <...>
	endscript
	script edit_skater_premade_skater_choose
		GetCurrentSkaterProfileIndex
		if NOT GotParam female
			SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 1
		else
			SetSkaterProfileProperty player = <currentSkaterProfileIndex> is_male 0
		endif
		SetPlayerAppearance appearance_structure = <appearance> player = <currentSkaterProfileIndex>
		RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board
	endscript
	script check_if_group_editable_and_head_is_unlocked
		check_if_group_editable
		if (<is_enabled> = 0)
			return is_enabled = 0
		endif
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if (<is_head_locked> = 1)
			return is_enabled = 0
		endif
		return is_enabled = 1
	endscript
	script edit_skater_info_menu parent = edit_skater_anchor_middle
		dialog_box_exit
		if NOT ObjectExists id = edit_skater_anchor
			create_edit_skater_menu
		endif
		edit_skater_create_menu_block {
			tab_texture = tab2
			scale = (1.5,1.0)
			middle_texture = repeat_piece2
			bottom_texture = menu_bottom
		}
		if GotParam parent_index
			Change edit_skater_menu_level_1_index = <parent_index>
		endif
		FormatText ChecksumName = title_icon "%i_options" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_sub_title title = "INFORMATION" title_icon = <title_icon>
		create_helper_text {helper_text_elements = [{text = "\b7/\b4=Select"}
				{text = "\b6/\b5=Adjust"}
				{text = "\bn=Back"}
				{text = "\bm=Accept"}
			]
		}
		CreateScreenElement {
			type = VMenu
			parent = <parent>
			id = edit_skater_info_vmenu
			pos = (133.0,134.0)
			just = [left top]
			event_handlers = [
				{pad_back generic_menu_pad_back_sound}
				{pad_back edit_skater_create_main_menu}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		AssignAlias id = edit_skater_info_vmenu alias = current_menu
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		info_name = <display_name>
		info_town = <hometown>
		if (<age> = -1)
			<info_age> = "Unknown"
		else
			FormatText TextName = info_age "%a" a = <age>
		endif
		switch <is_male>
			case 1
				info_sex = "Male"
			case 0
				info_sex = "Female"
		endswitch
		switch <stance>
			case Regular
				info_stance = "Regular"
			case Goofy
				info_stance = "Goofy"
		endswitch
		switch <pushstyle>
			case never_mongo
				info_push = "Never Mongo"
			case mongo_when_switch
				info_push = "Mongo Switch"
			case always_mongo
				info_push = "Always Mongo"
		endswitch
		switch <trickstyle>
			case vert
				info_style = "Vert"
			case street
				info_style = "Street"
		endswitch
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if (<is_pro> = 1)
			if (<is_locked> = 1)
				<not_focusable> = not_focusable
			endif
		endif
		edit_skater_info_add_item {
			text = 'NAME:'
			pad_choose_script = launch_onscreen_keyboard_from_edit_skater
			pad_choose_params = {field = "" text = <display_name> title = 'NAME' min_length = 1 max_length = 15 text_to_change = name}
			focus_params = {top_row}
			unfocus_params = {top_row}
			tab = tab2
			top_row
			item_value_text = <info_name>
			not_focusable = <not_focusable>
		}
		if (<is_locked> = 1)
			if NOT GotParam no_bg
				<not_focusable> = not_focusable
			endif
		endif
		edit_skater_info_add_item {
			text = 'HOMETOWN:'
			pad_choose_script = launch_onscreen_keyboard_from_edit_skater
			pad_choose_params = {field = "" text = <hometown> title = 'HOMETOWN' min_length = 1 max_length = 15 text_to_change = town}
			focus_params = {top_row}
			unfocus_params = {top_row}
			tab = tab2
			top_row
			item_value_text = <info_town>
			not_focusable = <not_focusable>
		}
		edit_skater_info_add_item {
			text = 'AGE:'
			pad_choose_script = nullscript
			pad_right_script = edit_skater_info_change
			pad_left_script = edit_skater_info_change
			pad_right_params = {change_age}
			pad_left_params = {change_age left}
			tab = tab2
			item_value_text = <info_age>
			not_focusable = <not_focusable>
		}
		edit_skater_info_add_item {
			text = 'SEX:'
			item_id = skater_sex_value
			pad_choose_script = nullscript
			pad_right_script = edit_skater_info_change
			pad_left_script = edit_skater_info_change
			pad_right_params = {change_is_male}
			pad_left_params = {change_is_male}
			tab = tab2
			item_value_text = <info_sex>
			not_focusable = <not_focusable>
		}
		edit_skater_info_add_item {
			text = 'STANCE:'
			pad_choose_script = nullscript
			pad_right_script = edit_skater_info_change
			pad_left_script = edit_skater_info_change
			pad_right_params = {change_stance}
			pad_left_params = {change_stance}
			tab = tab2
			item_value_text = <info_stance>
			not_focusable = <not_focusable>
		}
		edit_skater_info_add_item {
			text = 'PUSH:'
			pad_choose_script = nullscript
			pad_right_script = edit_skater_info_change
			pad_left_script = edit_skater_info_change
			pad_right_params = {change_push}
			pad_left_params = {change_push left}
			tab = tab2
			item_value_text = <info_push>
			wide_arrows
			not_focusable = <not_focusable>
		}
		edit_skater_info_add_item {
			text = 'TRICKS:'
			pad_choose_script = nullscript
			pad_right_script = edit_skater_info_change
			pad_left_script = edit_skater_info_change
			pad_right_params = {change_trickstyle}
			pad_left_params = {change_trickstyle}
			tab = tab2
			item_value_text = <info_style>
			narrow_arrows
			not_focusable = <not_focusable>
		}
		edit_skater_info_add_item {
			text = 'DONE'
			pad_choose_script = edit_skater_create_main_menu
			focus_params = {no_bg}
			unfocus_params = {no_bg}
			tab = tab2
			no_bg
			text_pos = (110.0,0.0)
		}
		if GotParam cam_anim
			KillSkaterCamAnim all
			cas_setup_rotating_camera cam_anim = <cam_anim>
		endif
		if NOT GotParam from_level_1
			FireEvent type = focus target = current_menu data = {grid_index = edit_skater_menu_level_2_index}
		else
			FireEvent type = focus target = current_menu
		endif
	endscript
	script launch_onscreen_keyboard_from_edit_skater
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if (<is_pro> = 1)
			if (<is_locked> = 1)
				return
			endif
		endif
		DestroyScreenElement id = current_menu_anchor
		wait 1 frame
		create_onscreen_keyboard {
			text = <text>
			keyboard_title = <title>
			min_length = <min_length>
			max_length = <max_length>
			text_to_change = <text_to_change>
			keyboard_done_script = exit_onscreen_keyboard_from_edit_skater
			keyboard_cancel_script = exit_onscreen_keyboard_from_edit_skater
			allow_cancel
		}
	endscript
	script exit_onscreen_keyboard_from_edit_skater
		GetTextElementString id = keyboard_current_string
		GetCurrentSkaterProfileIndex
		switch <text_to_change>
			case name
				SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {display_name = <string>}
				check_for_neversoft_skaters name = <string>
			case town
				SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {hometown = <string>}
		endswitch
		destroy_onscreen_keyboard
		create_edit_skater_menu
		edit_skater_info_menu
	endscript
	script edit_skater_info_change
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		GetTags
		if (<is_locked> = 1)
			return
		endif
		if GotParam change_age
			if GotParam left
				if NOT (<age> > 1)
					return
				endif
				age = (<age> - 1)
			else
				if NOT (99 > <age>)
					return
				endif
				age = (<age> + 1)
			endif
			FormatText TextName = info_age "%a" a = <age>
			SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {age = <age>}
			SetScreenElementProps {id = {<id> child = 2} text = <info_age>}
		endif
		if GotParam change_is_male
			confirm_skater_sexchange is_male = <is_male>
		endif
		if GotParam change_stance
			switch <stance>
				case Regular
					SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {stance = Goofy}
					RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board
					SetScreenElementProps {id = {<id> child = 2} text = "Goofy"}
				case Goofy
					SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {stance = Regular}
					RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board
					SetScreenElementProps {id = {<id> child = 2} text = "Regular"}
			endswitch
		endif
		if GotParam change_trickstyle
			switch <trickstyle>
				case street
					SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {trickstyle = vert}
					SetScreenElementProps {id = {<id> child = 2} text = "Vert"}
				case vert
					SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {trickstyle = street}
					SetScreenElementProps {id = {<id> child = 2} text = "Street"}
			endswitch
		endif
		if GotParam change_push
			if GotParam left
				switch <pushstyle>
					case mongo_when_switch
						SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {pushstyle = never_mongo}
						SetScreenElementProps {id = {<id> child = 2} text = "Never Mongo"}
					case never_mongo
						SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {pushstyle = always_mongo}
						SetScreenElementProps {id = {<id> child = 2} text = "Always Mongo"}
					case always_mongo
						SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {pushstyle = mongo_when_switch}
						SetScreenElementProps {id = {<id> child = 2} text = "Mongo Switch"}
				endswitch
			else
				switch <pushstyle>
					case mongo_when_switch
						SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {pushstyle = always_mongo}
						SetScreenElementProps {id = {<id> child = 2} text = "Always Mongo"}
					case never_mongo
						SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {pushstyle = mongo_when_switch}
						SetScreenElementProps {id = {<id> child = 2} text = "Mongo Switch"}
					case always_mongo
						SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {pushstyle = never_mongo}
						SetScreenElementProps {id = {<id> child = 2} text = "Never Mongo"}
				endswitch
			endif
			RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board
		endif
		GetStackedScreenElementPos x id = {<id> child = 2} offset = (11.0,10.0)
		SetScreenElementProps {id = {<id> child = 4} pos = <pos>}
		generic_menu_scroll_sideways_sound
	endscript
	script confirm_skater_sexchange
		create_error_box {
			title = "WARNING!"
			text = "Changing the sex of your skater will erase any changes.\n Are you sure?"
			text_dims = (400.0,0.0)
			bg_scale = 1.20000005
			buttons = [
				{text = "Yes" pad_choose_script = perform_skater_sexchange}
				{text = "No" pad_choose_script = cancel_skater_sexchange}
			]
		}
		FireEvent type = unfocus target = current_menu_anchor
		FireEvent type = focus target = dialog_box_vmenu
	endscript
	script cancel_skater_sexchange
		edit_skater_info_menu
		FireEvent type = unfocus target = edit_skater_info_vmenu
		FireEvent type = focus target = edit_skater_info_vmenu data = {child_id = skater_sex_value}
	endscript
	script perform_skater_sexchange
		edit_skater_info_menu
		FireEvent type = unfocus target = edit_skater_info_vmenu
		FireEvent type = focus target = edit_skater_info_vmenu data = {child_id = skater_sex_value}
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		switch <is_male>
			case 0
				cas_apply_sex apply_male = 1
				SetScreenElementProps {id = {skater_sex_value child = 2} text = "Male"}
			case 1
				cas_apply_sex apply_male = 0
				SetScreenElementProps {id = {skater_sex_value child = 2} text = "Female"}
		endswitch
		if LevelIs load_cas
			MakeSkaterGoto SkateshopAI params = {NOSFX CAS_Screen}
		endif
	endscript
	script create_face_map_menu brightness = 1.0
		printf "script create_face_map_menu"
		Change goto_face_menu = 0
		GetCurrentSkaterProfileIndex
		if NOT (<currentSkaterProfileIndex> = 0)
			load_pro_skater name = custom
		endif
		if NOT GotParam face_texture
			if NOT GotParam downloaded_face
				maybe_load_default_face
			else
				refresh_skater_model
			endif
		endif
		if NOT GotParam no_textures
			if NOT GotParam no_new_textures
				LoadFaceTextureFromProfile checksum = cas_texture_from_profile
			endif
		endif
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		spawnscript setup_face_map_cam
		FormatText ChecksumName = title_icon "%i_edit_skater" i = (THEME_PREFIXES[current_theme_prefix])
		make_new_themed_sub_menu title = "FACE MAPPING" title_icon = <title_icon> pos = (125.0,80.0) dims = (400.0,300.0)
		SetScreenElementLock id = current_menu on
		wait 1 gameframe
		SetScreenElementLock id = current_menu off
		create_helper_text generic_helper_text_cas
		SetScreenElementProps {id = sub_menu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = face_map_exit}}
				{pad_l1 cas_rotate_skater_left}
				{pad_r1 cas_rotate_skater_right}
			]
		}
		FormatText ChecksumName = rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		theme_menu_add_item {text = "1)" extra_text = "Choose Face" pad_choose_script = retrieve_face_selected text_just = [right center] text_pos = (-30.0,-5.0) ignore_width}
		theme_menu_add_item {text = "2)" extra_text = "Edit Points" pad_choose_script = face_map_menu id = menu_edit_points text_just = [right center] text_pos = (-30.0,-5.0) ignore_width}
		theme_menu_add_item {text = "3)" extra_text = "Pick Skin Tone" pad_choose_script = create_skin_selection_menu text_just = [right center] text_pos = (-30.0,-5.0) ignore_width}
		theme_menu_add_item {text = "4)" extra_text = "Match Your Face" pad_choose_script = face_hsv_menu pad_choose_params = {on_load = on_load hue = 0.0 sat = 1.0 val = 1.0} text_just = [right center] text_pos = (-30.0,-5.0) ignore_width}
		theme_menu_add_item {text = "5)" extra_text = "Color Your Skin" pad_choose_script = face_skin_menu pad_choose_params = {on_load = on_load} text_just = [right center] text_pos = (-30.0,-5.0) ignore_width}
		theme_menu_add_item {text = "6)" extra_text = "Done        "
			pad_choose_script = face_map_exit
			text_just = [right center]
			last_menu_item = last_menu_item
			text_pos = (-30.0,-5.0)
		}
		UnpauseMusicAndStreams
		if GotParam goto_face_map
			FireEvent type = focus target = sub_menu
			FireEvent type = pad_choose target = menu_edit_points
		else
			finish_themed_sub_menu
		endif
		Change disable_menu_sounds = 1
		if GotParam focus_child
			while
				FireEvent type = pad_down target = sub_vmenu
			repeat <focus_child>
		endif
		Change disable_menu_sounds = 0
	endscript
	script setup_face_map_cam
		wait 2 gameframes
		GoalManager_HidePoints
		GoalManager_HideGoalPoints
		skater::pausephysics
		UnPauseSkater 0
		MakeSkaterGoto SkateshopAI params = {CAS_Screen NOSFX}
		skater::Obj_MoveToNode orient name = cas_player_restart
		KillSkaterCamAnim all
		CalcPosRelative
		target_vector = ((-14.0,65.0,0.0))
		pos_vector = ((-14.0,65.0,35.0))
		Change cas_cam_angle = 90
		Change cas_cam_target_x = (<target_vector>.(1.0,0.0,0.0))
		Change cas_cam_target_y = (<target_vector>.(0.0,1.0,0.0))
		Change cas_cam_target_z = (<target_vector>.(0.0,0.0,1.0))
		Change cas_cam_pos_x = (<pos_vector>.(1.0,0.0,0.0))
		Change cas_cam_pos_y = (<pos_vector>.(0.0,1.0,0.0))
		Change cas_cam_pos_z = (<pos_vector>.(0.0,0.0,1.0))
		get_rotated_vector vector = <target_vector>
		t_off = (<vector> + <pos>)
		get_rotated_vector vector = <pos_vector>
		p_off = (<vector> + <pos>)
		printstruct <...>
		skater::Obj_GetId
		PlaySkaterCamAnim {skater = 0
			targetID = world
			targetOffset = <t_off>
			positionOffset = <p_off>
			play_hold
			frames = 1
			virtual_cam
		}
	endscript
	script face_map_exit
		printf "face map exit"
		unload_cas_texture_from_profile
		SetNetworkMode
		create_pre_cas_menu
	endscript
	script face_back_from_net_setup
		printf "script face_back_from_net_setup"
		dialog_box_exit
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		if (in_net_setup_flow = 1)
			create_dialog_box {title = "Loading"
				text = "Please wait..."
				no_animate
			}
			wait 10 gameframes
			load_mainmenu_textures_to_main_memory unload
			load_cas_textures_to_main_memory
			dialog_box_exit
		endif
		Change in_net_setup_flow = 0
		create_face_map_menu focus_child = 1
	endscript
	script create_face_download_menu_from_net_setup
		printf "script face_back_from_net_setup"
		dialog_box_exit
		if ObjectExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		create_dialog_box {title = "Loading"
			text = "Please wait..."
			no_animate
		}
		wait 10 gameframes
		load_mainmenu_textures_to_main_memory unload
		load_cas_textures_to_main_memory
		dialog_box_exit
		Change in_net_setup_flow = 0
		create_face_download_menu
	endscript
	script cancel_face_download_kb
		destroy_onscreen_keyboard
		face_back_from_net_setup
	endscript
	script create_face_download_menu
		dialog_box_exit
		face_download_chosen cancel_script = cancel_face_download_kb
	endscript
	script face_go_to_connection_setup_from_dialog
		dialog_box_exit
		Change in_net_setup_flow = 1
		create_dialog_box {title = "Loading"
			text = "Please wait..."
			no_animate
		}
		wait 10 gameframes
		load_cas_textures_to_main_memory unload
		load_mainmenu_textures_to_main_memory
		dialog_box_exit
		Change InNetOptionsFromFaceDownload = 1
		Change InNetOptionsFromNetPlay = 0
		create_network_options_menu
	endscript
	script face_create_net_startup_need_setup_dialog
		printf "**** in face_create_net_startup_need_setup_dialog"
		create_dialog_box {title = net_status_msg
			text = <text>
			buttons = [{text = " Yes " pad_choose_script = face_go_to_connection_setup_from_dialog}
				{text = " No " pad_choose_script = <error_script>}
			]
		}
	endscript
	script net_setup_succeeded_from_cas
		SetNetworkMode INTERNET_MODE
		ConnectToInternet success = create_face_download_menu failure = face_back_from_net_setup
	endscript
	script unload_cas_texture_from_profile
		printf "Unloading current face texture"
		UnloadTexture cas_texture_from_profile
	endscript
	script cas_hang_up_modem
		unload_cas_texture_from_profile
		disconnect_from_internet
	endscript
	script retrieve_face_selected
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		FormatText ChecksumName = title_icon "%i_edit_skater" i = (THEME_PREFIXES[current_theme_prefix])
		make_new_themed_sub_menu title = "CHOOSE FACE" title_icon = <title_icon> pos = (80.0,80.0)
		SetScreenElementProps {id = sub_menu
			event_handlers = [
				{pad_back done_download_face}
			]
		}
		AddFacesToMenu
		theme_menu_add_item {text = "Done"
			pad_choose_script = done_download_face
			centered = centered
			last_menu_item = last_menu_item
		}
		finish_themed_sub_menu
	endscript
	script add_item_to_face_menu
		theme_menu_add_item {text = <name> pad_choose_script = download_face pad_choose_params = {string = <file>} centered = centered}
	endscript
	script done_download_face
		unload_cas_texture_from_profile
		create_face_map_menu focus_child = 2 downloaded_face = downloaded_face
	endscript
	script download_face
		DownloadFace <...>
	endscript
	script face_hsv_menu hue = 2.46000004 sat = 0.89999998 val = 0.87 left_eye = [44, 40] right_eye = [87, 42] nose = [65, 70] lips = [66, 88]
		printf "script face_hsv_menu"
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		FormatText ChecksumName = title_icon "%i_edit_skater" i = (THEME_PREFIXES[current_theme_prefix])
		make_new_themed_sub_menu title = "FACE COLOR" title_icon = <title_icon> pos = (80.0,80.0)
		create_helper_text {helper_text_elements = [{text = "\b7/\b4=Select"}
				{text = "\b6/\b5=Adjust"}
				{text = "\bn=Back"}
				{text = "\bm=Accept"}
			]
		}
		SetScreenElementProps {id = sub_menu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = exit_face_hsv id = sub_menu no_textures = no_textures}}
			]
		}
		FormatText ChecksumName = rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = highlight_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		load_face_overlay_texture
		get_default_face_texture_name
		SetModelFaceTexturePoints face_points = original_model_face_points
		CopyTexture src = cas_texture_from_profile new = dummy2
		Generate32BitImage dummy2 renderable = 1 store_original = 1
		value = (saved_face_points[0].(1.0,0.0))
		CastToInteger value
		SetArrayElement arrayname = left_eye index = 0 newvalue = <value>
		value = (saved_face_points[0].(0.0,1.0))
		CastToInteger value
		SetArrayElement arrayname = left_eye index = 1 newvalue = <value>
		value = (saved_face_points[1].(1.0,0.0))
		CastToInteger value
		SetArrayElement arrayname = right_eye index = 0 newvalue = <value>
		value = (saved_face_points[1].(0.0,1.0))
		CastToInteger value
		SetArrayElement arrayname = right_eye index = 1 newvalue = <value>
		value = (saved_face_points[2].(1.0,0.0))
		CastToInteger value
		SetArrayElement arrayname = nose index = 0 newvalue = <value>
		value = (saved_face_points[2].(0.0,1.0))
		CastToInteger value
		SetArrayElement arrayname = nose index = 1 newvalue = <value>
		value = (saved_face_points[3].(1.0,0.0))
		CastToInteger value
		SetArrayElement arrayname = lips index = 0 newvalue = <value>
		value = (saved_face_points[3].(0.0,1.0))
		CastToInteger value
		SetArrayElement arrayname = lips index = 1 newvalue = <value>
		AdjustFaceTextureToModel {texture = dummy2
			face_points = {
				left_eye = <left_eye>
				right_eye = <right_eye>
				nose = <nose>
				lips = <lips>
				width = 128
				height = 128
			}
		}
		current_face_points = {h = <hue> s = <sat> v = <val>}
		GetCurrentSkaterProfileIndex
		GetPlayerFacePoints player = <currentSkaterProfileIndex>
		<hue> = (<current_face_points>.h)
		<sat> = (<current_face_points>.s)
		<val> = (<current_face_points>.v)
		AdjustTextureHSV dummy2 h = <hue> s = <sat> v = <val>
		FormatText ChecksumName = highlight_bar "bw_slider"
		CreateScreenElement {
			type = SpriteElement
			id = val_bar
			parent = sub_menu
			just = [left center]
			pos = (132.0,110.0)
			scale = (4.0,2.0)
			texture = <highlight_bar>
			rgba = colormenu_bar_unfocus_rgba
		}
		FormatText ChecksumName = down_arrow_texture "down_arrow"
		CreateScreenElement {
			type = SpriteElement
			parent = sub_menu
			just = [left center]
			pos = ((130.0,103.0) + (<val>) * (60.0,0.0))
			scale = colormenu_arrow_scale
			texture = <down_arrow_texture>
			rgba = [128 128 128 128]
			z_priority = 10
		}
		FormatText ChecksumName = up_arrow_texture "up_arrow"
		CreateScreenElement {
			type = SpriteElement
			parent = sub_menu
			just = [left center]
			pos = ((130.0,117.0) + (<val>) * (60.0,0.0))
			scale = colormenu_arrow_scale
			texture = <up_arrow_texture>
			rgba = [128 128 128 128]
			z_priority = 10
		}
		FormatText ChecksumName = highlight_bar "bw_slider"
		CreateScreenElement {
			type = SpriteElement
			id = sat_bar
			parent = sub_menu
			just = [left center]
			pos = (132.0,133.0)
			scale = (4.0,2.0)
			texture = <highlight_bar>
			rgba = colormenu_bar_unfocus_rgba
		}
		FormatText ChecksumName = down_arrow_texture "down_arrow"
		CreateScreenElement {
			type = SpriteElement
			parent = sub_menu
			just = [left center]
			pos = ((130.0,126.0) + (<sat>) * (60.0,0.0))
			scale = colormenu_arrow_scale
			texture = <down_arrow_texture>
			rgba = [128 128 128 128]
			z_priority = 10
		}
		FormatText ChecksumName = up_arrow_texture "up_arrow"
		CreateScreenElement {
			type = SpriteElement
			parent = sub_menu
			just = [left center]
			pos = ((130.0,140.0) + (<sat>) * (60.0,0.0))
			scale = colormenu_arrow_scale
			texture = <up_arrow_texture>
			rgba = [128 128 128 128]
			z_priority = 10
		}
		FormatText ChecksumName = highlight_bar "bw_slider"
		CreateScreenElement {
			type = SpriteElement
			id = hue_bar
			parent = sub_menu
			just = [left center]
			pos = (132.0,156.0)
			scale = (4.0,2.0)
			texture = <highlight_bar>
			rgba = colormenu_bar_unfocus_rgba
		}
		if (<hue> < 181.0)
			<hue> = (180.0 + (<hue> * 18.0))
		else
			<hue> = ((<hue> -350) * 18.0)
		endif
		FormatText ChecksumName = down_arrow_texture "down_arrow"
		CreateScreenElement {
			type = SpriteElement
			parent = sub_menu
			just = [left center]
			pos = ((130.0,149.0) + (<hue>) * (0.33333001,0.0))
			scale = colormenu_arrow_scale
			texture = <down_arrow_texture>
			z_priority = 10
			rgba = [128 128 128 128]
		}
		FormatText ChecksumName = up_arrow_texture "up_arrow"
		CreateScreenElement {
			type = SpriteElement
			parent = sub_menu
			just = [left center]
			pos = ((130.0,163.0) + (<hue>) * (0.33333001,0.0))
			scale = colormenu_arrow_scale
			z_priority = 10
			texture = <up_arrow_texture>
			rgba = [128 128 128 128]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = sub_menu
			texture = white2
			pos = (320.0,87.0)
			scale = 30
			just = [left top]
			rgba = <highlight_rgba>
			z_priority = 5
		}
		get_default_face_texture_name
		CreateScreenElement {
			type = SpriteElement
			parent = <id>
			id = temp_preview_overlay
			just = [left top]
			pos = (0.15000001,0.08)
			scale = (0.06,0.061)
			texture = <overlayName>
			rgba = [128 128 128 128]
			z_priority = 10
		}
		CreateScreenElement {
			type = SpriteElement
			parent = <id>
			id = temp_preview
			just = [left top]
			pos = (18.0,22.0)
			scale = (0.69999999,0.69999999)
			texture = dummy2
			rgba = [128 128 128 128]
			z_priority = 9
		}
		DoScreenElementMorph id = {sub_menu child = 2} time = 0 alpha = 0
		DoScreenElementMorph id = {sub_menu child = 3} time = 0 alpha = 0
		DoScreenElementMorph id = {sub_menu child = 5} time = 0 alpha = 0
		DoScreenElementMorph id = {sub_menu child = 6} time = 0 alpha = 0
		DoScreenElementMorph id = {sub_menu child = 8} time = 0 alpha = 0
		DoScreenElementMorph id = {sub_menu child = 9} time = 0 alpha = 0
		theme_menu_add_item text = "Val.       " scale = 0.89999998 focus_script = face_hsv_focus focus_params = {type = val} unfocus_script = face_hsv_unfocus unfocus_params = {type = val} pad_choose_script = null_script pad_right_script = face_hsv_increase pad_right_params = {type = val id = sub_menu} pad_left_script = face_hsv_decrease pad_left_params = {type = val id = sub_menu} text_spacing = 2.0
		theme_menu_add_item text = "Sat.       " scale = 0.89999998 focus_script = face_hsv_focus focus_params = {type = sat} unfocus_script = face_hsv_unfocus unfocus_params = {type = sat} pad_choose_script = null_script pad_right_script = face_hsv_increase pad_right_params = {type = sat id = sub_menu} pad_left_script = face_hsv_decrease pad_left_params = {type = sat id = sub_menu} text_spacing = 2.0
		theme_menu_add_item text = "Hue        " scale = 0.89999998 focus_script = face_hsv_focus focus_params = {type = hue} unfocus_script = face_hsv_unfocus unfocus_params = {type = hue} pad_choose_script = null_script pad_right_script = face_hsv_increase pad_right_params = {type = hue id = sub_menu} pad_left_script = face_hsv_decrease pad_left_params = {type = hue id = sub_menu} text_spacing = 2.0
		theme_menu_add_item text = "Reset To Default" pad_choose_script = reset_face_hsv pad_choose_params = {id = sub_menu} centered = 1 ignore_width
		theme_menu_add_item text = "Done" pad_choose_script = exit_face_hsv pad_choose_params = {id = sub_menu no_textures = no_textures} last_menu_item = 1
		if GotParam no_animate
			finish_themed_sub_menu time = 0.0
		else
			finish_themed_sub_menu
		endif
		CreateScreenElement {
			type = textBlockElement
			parent = current_menu_anchor
			id = directions_text
			text = "Adjust your face color so that it blends\n seamlessly with the surrounding skin"
			pos = (320.0,668.0)
			dims = (640.0,60.0)
			font = small
			scale = 0.89999998
			rgba = <rgba>
			line_spacing = 0.64999998
			z_priority = 5
			just = [center center]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = directions_box
			texture = myf_box_mid
			pos = (320.0,670.0)
			scale = (12.0,1.20000005)
			just = [center center]
			rgba = <highlight_rgba>
			z_priority = 5
		}
		DoScreenElementMorph id = directions_text time = 0.2 pos = (320.0,368.0)
		DoScreenElementMorph id = directions_box time = 0.2 pos = (320.0,370.0)
	endscript
	script reset_face_hsv
		get_default_face_texture_name
		AdjustTextureHSV dummy2 h = <hue> s = <sat> v = <val>
		printf <id>
		if (<hue> < 181.0)
			<hue> = (180.0 + (<hue> * 18.0))
		else
			<hue> = ((<hue> -350) * 18.0)
		endif
		SetScreenElementProps {id = {<id> child = 2}
			pos = ((130.0,103.0) + (60.0,0.0) * <val>)
		}
		SetScreenElementProps {id = {<id> child = 3}
			pos = ((130.0,117.0) + (60.0,0.0) * <val>)
		}
		SetScreenElementProps {id = {<id> child = 5}
			pos = ((130.0,126.0) + (60.0,0.0) * <sat>)
		}
		SetScreenElementProps {id = {<id> child = 6}
			pos = ((130.0,140.0) + (60.0,0.0) * <sat>)
		}
		SetScreenElementProps {id = {<id> child = 8}
			pos = ((130.0,149.0) + <hue> * (0.33333001,0.0))
		}
		SetScreenElementProps {id = {<id> child = 9}
			pos = ((130.0,163.0) + <hue> * (0.33333001,0.0))
		}
	endscript
	script face_hsv_focus
		main_theme_focus
		if (<type> = hue)
			DoScreenElementMorph id = {sub_menu child = 8} time = 0 alpha = 1
			DoScreenElementMorph id = {sub_menu child = 9} time = 0 alpha = 1
			SetScreenElementProps {
				id = {sub_menu child = 7}
				rgba = [200 100 100 118]
			}
		endif
		if (<type> = sat)
			DoScreenElementMorph id = {sub_menu child = 5} time = 0 alpha = 1
			DoScreenElementMorph id = {sub_menu child = 6} time = 0 alpha = 1
			SetScreenElementProps {
				id = {sub_menu child = 4}
				rgba = colormenu_bar_focus_rgba
			}
		endif
		if (<type> = val)
			DoScreenElementMorph id = {sub_menu child = 2} time = 0 alpha = 1
			DoScreenElementMorph id = {sub_menu child = 3} time = 0 alpha = 1
			SetScreenElementProps {
				id = {sub_menu child = 1}
				rgba = colormenu_bar_focus_rgba
			}
		endif
	endscript
	script face_hsv_unfocus
		main_theme_unfocus
		if (<type> = hue)
			DoScreenElementMorph id = {sub_menu child = 8} time = 0 alpha = 0
			DoScreenElementMorph id = {sub_menu child = 9} time = 0 alpha = 0
			SetScreenElementProps {
				id = {sub_menu child = 7}
				rgba = colormenu_bar_unfocus_rgba
			}
		endif
		if (<type> = sat)
			DoScreenElementMorph id = {sub_menu child = 5} time = 0 alpha = 0
			DoScreenElementMorph id = {sub_menu child = 6} time = 0 alpha = 0
			SetScreenElementProps {
				id = {sub_menu child = 4}
				rgba = colormenu_bar_unfocus_rgba
			}
		endif
		if (<type> = val)
			DoScreenElementMorph id = {sub_menu child = 2} time = 0 alpha = 0
			DoScreenElementMorph id = {sub_menu child = 3} time = 0 alpha = 0
			SetScreenElementProps {
				id = {sub_menu child = 1}
				rgba = colormenu_bar_unfocus_rgba
			}
		endif
	endscript
	script exit_face_hsv
		if ObjectExists id = temp_preview
			DestroyScreenElement id = temp_preview
		endif
		if ObjectExists id = temp_preview_overlay
			DestroyScreenElement id = temp_preview_overlay
		endif
		GetScreenElementPosition {id = {<id> child = 8}}
		<current_hue> = ((((<ScreenElementPos>).(1.0,0.0)) -130.0) * 3.0)
		if (<current_hue> < 181.0)
			<current_hue> = (350.0 + (<current_hue> / 18.0))
		else
			<current_hue> = ((<current_hue> -180.0) / 18.0)
		endif
		GetScreenElementPosition {id = {<id> child = 5}}
		<current_sat> = ((((<ScreenElementPos>).(1.0,0.0)) -130.0) / 60.0)
		GetScreenElementPosition {id = {<id> child = 2}}
		<current_val> = ((((<ScreenElementPos>).(1.0,0.0)) -130.0) / 60.0)
		unload_face_overlay_texture
		printf "Unloading dummy texture"
		UnloadTexture "dummy2"
		GetCurrentSkaterProfileIndex
		GetPlayerFacePoints player = <currentSkaterProfileIndex>
		current_face_points = {<current_face_points> h = <current_hue> s = <current_sat> v = <current_val>}
		SetPlayerFacePoints player = <currentSkaterProfileIndex> face_points = <current_face_points>
		RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board
		create_face_map_menu <...> focus_child = 5
	endscript
	script load_face_overlay_texture
		get_default_face_texture_name
		LoadTexture <overlayPath>
		SetFaceMassageTextureOverlay <overlayName>
	endscript
	script unload_face_overlay_texture
		get_default_face_texture_name
		UnloadTexture <overlayPath>
	endscript
	script face_hsv_increase
		GetScreenElementPosition {id = {<id> child = 8}}
		<current_hue> = ((((<ScreenElementPos>).(1.0,0.0)) -130.0) * 3.0)
		GetScreenElementPosition {id = {<id> child = 5}}
		<current_sat> = ((((<ScreenElementPos>).(1.0,0.0)) -130.0) / 60.0)
		GetScreenElementPosition {id = {<id> child = 2}}
		<current_val> = ((((<ScreenElementPos>).(1.0,0.0)) -130.0) / 60.0)
		if (<type> = hue)
			<current_hue> = (<current_hue> + 6.0)
			if (<current_hue> > 360)
				<current_hue> = (<current_hue> -6.0)
			else
				SetScreenElementProps {id = {<id> child = 8}
					pos = ((130.0,149.0) + (<current_hue>) * (0.33333001,0.0))
				}
				SetScreenElementProps {id = {<id> child = 9}
					pos = ((130.0,163.0) + (<current_hue>) * (0.33333001,0.0))
				}
			endif
		endif
		if (<type> = sat)
			<current_sat> = (<current_sat> + 0.02)
			if (<current_sat> > 2.0)
				<current_sat> = (<current_sat> -0.02)
			else
				SetScreenElementProps {id = {<id> child = 5}
					pos = ((130.0,126.0) + (<current_sat>) * (60.0,0.0))
				}
				SetScreenElementProps {id = {<id> child = 6}
					pos = ((130.0,140.0) + (<current_sat>) * (60.0,0.0))
				}
			endif
		endif
		if (<type> = val)
			<current_val> = (<current_val> + 0.02)
			if (<current_val> > 2.0)
				<current_val> = (<current_val> -0.02)
			else
				SetScreenElementProps {id = {<id> child = 2}
					pos = ((130.0,103.0) + (<current_val>) * (60.0,0.0))
				}
				SetScreenElementProps {id = {<id> child = 3}
					pos = ((130.0,117.0) + (<current_val>) * (60.0,0.0))
				}
			endif
		endif
		if (<current_hue> < 181.0)
			<current_hue> = (350.0 + (<current_hue> / 18.0))
		else
			<current_hue> = ((<current_hue> -180.0) / 18.0)
		endif
		AdjustTextureHSV dummy2 h = <current_hue> s = <current_sat> v = <current_val>
	endscript
	script face_hsv_decrease
		GetScreenElementPosition {id = {<id> child = 8}}
		<current_hue> = ((((<ScreenElementPos>).(1.0,0.0)) -130.0) * 3.0)
		GetScreenElementPosition {id = {<id> child = 5}}
		<current_sat> = ((((<ScreenElementPos>).(1.0,0.0)) -130.0) / 60.0)
		GetScreenElementPosition {id = {<id> child = 2}}
		<current_val> = ((((<ScreenElementPos>).(1.0,0.0)) -130.0) / 60.0)
		if (<type> = hue)
			<current_hue> = (<current_hue> -6.0)
			if (<current_hue> < 0)
				<current_hue> = (<current_hue> + 6.0)
			else
				SetScreenElementProps {id = {<id> child = 8}
					pos = ((130.0,149.0) + (<current_hue>) * (0.33333001,0.0))
				}
				SetScreenElementProps {id = {<id> child = 9}
					pos = ((130.0,163.0) + (<current_hue>) * (0.33333001,0.0))
				}
			endif
		endif
		if (<type> = sat)
			<current_sat> = (<current_sat> -0.02)
			if (<current_sat> < 0)
				<current_sat> = (<current_sat> + 0.02)
			else
				SetScreenElementProps {id = {<id> child = 5}
					pos = ((130.0,126.0) + (<current_sat>) * (60.0,0.0))
				}
				SetScreenElementProps {id = {<id> child = 6}
					pos = ((130.0,140.0) + (<current_sat>) * (60.0,0.0))
				}
			endif
		endif
		if (<type> = val)
			<current_val> = (<current_val> -0.02)
			if (<current_val> < 0)
				<current_val> = (<current_val> + 0.02)
			else
				SetScreenElementProps {id = {<id> child = 2}
					pos = ((130.0,103.0) + (<current_val>) * (60.0,0.0))
				}
				SetScreenElementProps {id = {<id> child = 3}
					pos = ((130.0,117.0) + (<current_val>) * (60.0,0.0))
				}
			endif
		endif
		if (<current_hue> < 181.0)
			<current_hue> = (350.0 + (<current_hue> / 18.0))
		else
			<current_hue> = ((<current_hue> -180.0) / 18.0)
		endif
		AdjustTextureHSV dummy2 h = <current_hue> s = <current_sat> v = <current_val>
	endscript
	script face_skin_menu
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		FormatText ChecksumName = title_icon "%i_edit_skater" i = (THEME_PREFIXES[current_theme_prefix])
		make_new_themed_sub_menu title = "SKIN COLOR" title_icon = <title_icon> pos = (80.0,80.0)
		theme_background pos = (180.0,87.0) width = 2.04999995 num_parts = 3 parent = current_menu_anchor
		create_helper_text {helper_text_elements = [{text = "\b7/\b4=Select"}
				{text = "\b6/\b5=Adjust"}
				{text = "\bn=Back"}
				{text = "\bm=Accept"}
			]
		}
		SetScreenElementProps {id = sub_menu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = exit_face_skin id = sub_menu no_textures = no_textures}}
			]
		}
		FormatText ChecksumName = rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = highlight_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if (<is_male> = 1)
			<head_part> = skater_m_head
		else
			<head_part> = skater_f_head
		endif
		colormenu_add_options_to_menu part = <head_part> from_caf = 1 text_pos = (0.0,-10.0) icon_pos = (115.0,-10.0) arrow_pos_up = (100.0,-2.0) arrow_pos_down = (100.0,-18.0)
		SetScreenElementLock id = current_menu off
		theme_menu_add_item text = "Reset To Default" no_bg centered = 1 ignore_width static_width = 500 highlight_bar_pos = (98.0,-7.0) highlight_bar_scale = (1.89999998,0.69999999) pad_choose_script = colormenu_reset_to_default pad_choose_params = {part = <head_part>}
		theme_menu_add_item text = "Done" no_bg ignore_width centered = 1 static_width = 500 highlight_bar_pos = (98.0,-7.0) highlight_bar_scale = (1.89999998,0.69999999) pad_choose_script = exit_face_skin pad_choose_params = {id = sub_menu no_textures = no_textures} last_menu_item = 1
		finish_themed_sub_menu
		CreateScreenElement {
			type = textBlockElement
			parent = current_menu_anchor
			id = directions_text
			text = "Adjust the color of the skin on your\n entire body as desired"
			pos = (320.0,668.0)
			dims = (640.0,60.0)
			font = small
			scale = 0.89999998
			rgba = <rgba>
			line_spacing = 0.64999998
			z_priority = 5
			just = [center center]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = directions_box
			texture = myf_box_mid
			pos = (320.0,670.0)
			scale = (12.0,1.20000005)
			just = [center center]
			rgba = <highlight_rgba>
			z_priority = 5
		}
		DoScreenElementMorph id = directions_text time = 0.2 pos = (320.0,368.0)
		DoScreenElementMorph id = directions_box time = 0.2 pos = (320.0,370.0)
		DoScreenElementMorph id = bg_box_vmenu time = 0.0 pos = (180.0,587.0)
		DoScreenElementMorph id = bg_box_vmenu time = 0.2 pos = (180.0,87.0)
	endscript
	script exit_face_skin
		create_face_map_menu <...> focus_child = 6
	endscript
	script face_map_menu scale = 2
		printf "script face_map_menu"
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = face_map_menu_anchor
			dims = (640.0,480.0)
			pos = (320.0,240.0)
		}
		AssignAlias id = face_map_menu_anchor alias = current_menu_anchor
		create_helper_text generic_helper_text_up_down_left_right
		SetScreenElementProps {id = current_menu_anchor
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = cancel_face_map}}
			]
		}
		FormatText ChecksumName = title_icon "%i_options" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_sub_title title = "FACE MAPPING" title_icon = <title_icon>
		build_top_bar
		FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_box_icons icon_texture = <paused_icon>
		theme_background pos = (173.0,85.0) num_parts = 9 parent = current_menu_anchor width = 2.45000005
		theme_background pos = (469.0,85.0) num_parts = 9 parent = current_menu_anchor width = 2.45000005 id = bg_box_vmenu2
		FormatText ChecksumName = highlight_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = unhighlight_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = ContainerElement
			parent = current_menu_anchor
			id = face_anchor
			pos = (45.0,95.0)
			dims = (256.0,256.0)
			just = [left top]
		}
		CreateScreenElement {
			type = textElement
			parent = face_anchor
			text = "Your Face"
			pos = (128.0,5.0)
			font = small
			scale = 1.5
			rgba = <highlight_rgba>
			z_priority = 5
			just = [center center]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = face_anchor
			pos = (128.0,8.0)
			texture = myf_frame
			just = [center center]
			scale = (2.0999999,1.0)
			z_priority = 4
		}
		CreateScreenElement {
			type = SpriteElement
			parent = face_anchor
			id = your_face
			pos = (0.0,0.0)
			texture = cas_texture_from_profile
			just = [left top]
			scale = <scale>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = face_anchor
			pos = (128.0,242.0)
			texture = myf_frame
			just = [center center]
			scale = (2.0999999,1.0)
			z_priority = 4
			rot_angle = 180
		}
		CreateScreenElement {
			type = SpriteElement
			parent = face_anchor
			id = point_arrow
			texture = myf_crosshair
			pos = (85.0,130.0)
			alpha = 0
			z_priority = 900
			just = [center center]
			rgba = [0 0 100 128]
		}
		CreateScreenElement {
			type = ContainerElement
			parent = current_menu_anchor
			id = tony_face_anchor
			pos = (341.0,95.0)
			dims = (256.0,256.0)
			just = [left top]
		}
		CreateScreenElement {
			type = textElement
			parent = tony_face_anchor
			text = "Example"
			pos = (128.0,5.0)
			font = small
			scale = 1.5
			rgba = <unhighlight_rgba>
			z_priority = 5
			just = [center center]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = tony_face_anchor
			pos = (128.0,8.0)
			texture = myf_frame
			just = [center center]
			scale = (2.0999999,1.0)
			z_priority = 4
		}
		CreateScreenElement {
			type = SpriteElement
			parent = tony_face_anchor
			pos = (0.0,0.0)
			texture = myf_example
			just = [left top]
			scale = <scale>
		}
		CreateScreenElement {
			type = SpriteElement
			parent = tony_face_anchor
			pos = (128.0,242.0)
			texture = myf_frame
			just = [center center]
			scale = (2.0999999,1.0)
			z_priority = 4
			rot_angle = 180
		}
		CreateScreenElement {
			type = SpriteElement
			parent = tony_face_anchor
			id = tony_arrow
			texture = myf_crosshair
			pos = (85.0,130.0)
			alpha = 0
			z_priority = 900
			just = [center center]
			rgba = [100 0 0 128]
			scale = 1.39999998
		}
		CreateScreenElement {
			type = textBlockElement
			parent = current_menu_anchor
			id = directions_text
			text = ""
			pos = (320.0,368.0)
			dims = (640.0,60.0)
			font = small
			scale = 0.89999998
			rgba = <unhighlight_rgba>
			line_spacing = 0.64999998
			z_priority = 5
			just = [center center]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			texture = myf_box_mid
			pos = (320.0,370.0)
			scale = (12.0,1.20000005)
			just = [center center]
			rgba = <highlight_rgba>
			z_priority = 5
		}
		GetStackedScreenElementPos x id = <id>
		GetScreenElementPosition id = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			texture = myf_box_right
			pos = <pos>
			scale = (1.0,1.20000005)
			just = [left top]
			rgba = <highlight_rgba>
			z_priority = 5
		}
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			texture = myf_box_left
			pos = <ScreenElementPos>
			scale = (1.0,1.20000005)
			just = [right top]
			rgba = <highlight_rgba>
			z_priority = 5
		}
		FireEvent type = focus target = current_menu_anchor
		killspawnedscript name = get_face_points
		spawnscript get_face_points
	endscript
	script cancel_face_map
		killspawnedscript name = get_face_points
		create_face_map_menu no_textures focus_child = 2
	endscript
	script get_face_points scale = 2
		FormatText ChecksumName = highlight_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		left_eye = [0 0]
		right_eye = [0 0]
		nose = [0 0]
		lips = [0 0]
		GetArraySize default_face_points
		DoScreenElementMorph id = point_arrow alpha = 1
		DoScreenElementMorph id = tony_arrow alpha = 1
		RunScriptOnScreenElement id = point_arrow blink_tony_face_arrow
		if (face_map_points_saved = 1)
			create_saved_face_points highlight_rgba = <highlight_rgba>
		endif
		index = 0
		while
			if (face_map_points_saved = 0)
				pos = ((default_face_points[<index>].pos) * <scale>)
			else
				FormatText ChecksumName = point_id "point%i" i = <index>
				if ScreenElementExists id = <point_id>
					DestroyScreenElement id = <point_id>
				endif
				pos = ((saved_face_points[<index>]) * <scale>)
			endif
			tony_pos = ((tony_face_points[<index>]) * <scale>)
			DoScreenElementMorph id = point_arrow pos = <pos>
			DoScreenElementMorph id = tony_arrow pos = <tony_pos>
			RunScriptOnScreenElement adjust_face_point id = point_arrow params = {pos = <pos>}
			FormatText TextName = directions "Select %i\nusing the \bj and press \b3" i = (default_face_points[<index>].name)
			SetScreenElementProps id = directions_text text = <directions>
			WaitForEvent type = pad_choose
			killspawnedscript name = adjust_face_point
			GetScreenElementPosition id = point_arrow
			face_x = ((<ScreenElementPos>.(1.0,0.0) + 16) * (1.0 / <scale>))
			face_y = ((<ScreenElementPos>.(0.0,1.0) + 16) * (1.0 / <scale>))
			CastToInteger face_x
			CastToInteger face_y
			new_pos = ((1.0,0.0) * <face_x> + (0.0,1.0) * <face_y>)
			switch <index>
				case 0
					SetArrayElement arrayname = left_eye index = 0 newvalue = <face_x>
					SetArrayElement arrayname = left_eye index = 1 newvalue = <face_y>
				case 1
					SetArrayElement arrayname = right_eye index = 0 newvalue = <face_x>
					SetArrayElement arrayname = right_eye index = 1 newvalue = <face_y>
				case 2
					SetArrayElement arrayname = nose index = 0 newvalue = <face_x>
					SetArrayElement arrayname = nose index = 1 newvalue = <face_y>
				case 3
					SetArrayElement arrayname = lips index = 0 newvalue = <face_x>
					SetArrayElement arrayname = lips index = 1 newvalue = <face_y>
			endswitch
			saved_face_points2 = saved_face_points
			SetArrayElement arrayname = saved_face_points2 index = <index> newvalue = <new_pos>
			FormatText ChecksumName = point_id "point%i" i = <index>
			if NOT ScreenElementExists id = <point_id>
				SetScreenElementLock off id = face_anchor
				CreateScreenElement {
					type = SpriteElement
					parent = face_anchor
					id = <point_id>
					texture = myf_dot
					pos = (<new_pos> * 2)
					z_priority = 800
					just = [center center]
					rgba = <highlight_rgba>
					scale = 2
				}
			else
				printf "This should never happen."
			endif
			index = (<index> + 1)
			if (<index> = <array_size>)
				break
			endif
		repeat
		Change face_map_points_saved = 1
		SetScreenElementProps id = directions_text text = "Mapping Face Now..."
		DoScreenElementMorph id = directions_text scale = 1.5
		DoScreenElementMorph id = point_arrow alpha = 0
		wait 2 gameframe
		GetCurrentSkaterProfileIndex
		SetPlayerFacePoints {
			player = <currentSkaterProfileIndex>
			left_eye = <left_eye>
			right_eye = <right_eye>
			nose = <nose>
			lips = <lips>
			width = 128
			height = 128
		}
		GetCurrentSkaterProfileIndex
		RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board
		create_face_map_menu no_new_textures focus_child = 3
	endscript
	script clear_face_texture_from_profile
		GetCurrentSkaterProfileIndex
		ClearPlayerFaceTexture player = <currentSkaterProfileIndex>
		RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board
	endscript
	script blink_tony_face_arrow
		while
			DoMorph alpha = 1
			wait 0.30000001 seconds
			DoMorph alpha = 0.60000002 time = 0.30000001
		repeat
	endscript
	default_face_points = [{name = "the center of your right eye" pos = (42.0,51.0)}
		{name = "the center of your left eye" pos = (80.0,51.0)}
		{name = "the spot between your nostrils" pos = (61.0,77.0)}
		{name = "the center of your lips" pos = (61.0,97.0)}
	]
	tony_face_points = [(43.0,42.0)
		(83.0,44.0)
		(62.0,72.0)
		(62.0,88.0)
	]
	saved_face_points = [(42.0,51.0)
		(80.0,51.0)
		(61.0,77.0)
		(61.0,97.0)
	]
	script adjust_face_point pos = (320.0,240.0)
		controller = 0
		got_controller = 0
		while
			if ControllerBoundToSkater controller = <controller> skater = 0
				got_controller = 1
				break
			endif
			controller = (<controller> + 1)
		repeat 4
		if (got_controller = 0)
			return
		endif
		while
			GetAnalogueInfo controller = <controller>
			new_pos = (<pos> + (<leftx> * (1.0,0.0) + <lefty> * (0.0,1.0)))
			if (0 > <pos>.(1.0,0.0))
				if (0 > <leftx>)
					new_pos = (<new_pos> - (<leftx> * (2.0,0.0)))
				endif
			else
				if (<pos>.(1.0,0.0) > 254)
					if (<leftx> > 0)
						new_pos = (<new_pos> - (<leftx> * (2.0,0.0)))
					endif
				endif
			endif
			if (0 > <pos>.(0.0,1.0))
				if (0 > <lefty>)
					new_pos = (<new_pos> - (<lefty> * (0.0,2.0)))
				endif
			else
				if (<pos>.(0.0,1.0) > 254)
					if (<lefty> > 0)
						new_pos = (<new_pos> - (<lefty> * (0.0,2.0)))
					endif
				endif
			endif
			DoMorph pos = <new_pos>
			pos = <new_pos>
			wait 2 gameframe
		repeat
	endscript
	script create_saved_face_points scale = 2
		index = 1
		SetScreenElementLock off id = face_anchor
		while
			FormatText ChecksumName = point_id "point%i" i = <index>
			pos = ((saved_face_points[<index>]) * <scale>)
			CreateScreenElement {
				type = SpriteElement
				parent = face_anchor
				id = <point_id>
				texture = myf_dot
				pos = <pos>
				z_priority = 800
				just = [center center]
				rgba = <highlight_rgba>
				scale = 2
			}
			index = (<index> + 1)
		repeat 3
	endscript
	cas_head_index = 10
	script swap_cas_head
		Change cas_head_index = (cas_head_index + 1)
		if (cas_head_index > 14)
			Change cas_head_index = 10
		endif
		desc_id = (skater_m_head[cas_head_index].desc_id)
		cas_add_item {part = skater_m_head desc_id = <desc_id>}
	endscript
	script get_default_face_texture_name
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if (<is_male> = 1)
			GetPlayerAppearancePart {
				player = <currentSkaterProfileIndex>
				part = skater_m_head
			}
			GetActualCASOptionStruct part = skater_m_head desc_id = <desc_id>
			if (ChecksumEquals a = <skintone> b = light)
				printf "light texture"
				<texturePath> = "faces\CS_NSN_facemap_male_light"
				<overlayPath> = "faces\CS_NSN_Head_wht_alpha"
				<overlayName> = CS_NSN_Head_wht_alpha
				<hue> = 2.46000004
				<sat> = 0.89999998
				<val> = 0.87
			else
				if (ChecksumEquals a = <skintone> b = tan)
					printf "tan texture"
					<texturePath> = "faces\CS_NSN_facemap_male_tan"
					<overlayPath> = "faces\CS_NSN_Head_tan_alpha"
					<overlayName> = CS_NSN_Head_tan_alpha
					<hue> = 2.46000004
					<sat> = 0.89999998
					<val> = 0.87
				else
					if (ChecksumEquals a = <skintone> b = dark)
						printf "dark texture"
						<texturePath> = "faces\CS_NSN_facemap_male_dark"
						<overlayPath> = "faces\CS_NSN_Head_blk_alpha"
						<overlayName> = CS_NSN_Head_blk_alpha
						<hue> = 2.46000004
						<sat> = 0.89999998
						<val> = 0.87
					else
						if (ChecksumEquals a = <skintone> b = Grey)
							printf "grey texture"
							<texturePath> = "faces\CS_NSN_facemap_male_light"
							<overlayPath> = "faces\CS_NSN_Head_gry_alpha"
							<overlayName> = CS_NSN_Head_gry_alpha
							<hue> = 2.46000004
							<sat> = 0.0
							<val> = 0.87
						else
							script_assert "Unrecognized skintone %c" c = <skintone>
						endif
					endif
				endif
			endif
		else
			GetPlayerAppearancePart {
				player = <currentSkaterProfileIndex>
				part = skater_f_head
			}
			GetActualCASOptionStruct part = skater_f_head desc_id = <desc_id>
			if (ChecksumEquals a = <skintone> b = light)
				printf "light f texture"
				<texturePath> = "faces\CS_NSN_facemap_female_light"
				<overlayPath> = "faces\CS_NSN_Head_f_wht_alpha"
				<overlayName> = CS_NSN_Head_f_wht_alpha
				<hue> = 2.46000004
				<sat> = 0.89999998
				<val> = 0.87
			else
				if (ChecksumEquals a = <skintone> b = tan)
					printf "tan f texture"
					<texturePath> = "faces\CS_NSN_facemap_female_tan"
					<overlayPath> = "faces\CS_NSN_Head_f_tan_alpha"
					<overlayName> = CS_NSN_Head_f_tan_alpha
					<hue> = 2.46000004
					<sat> = 0.89999998
					<val> = 0.87
				else
					if (ChecksumEquals a = <skintone> b = dark)
						printf "dark f texture"
						<texturePath> = "faces\CS_NSN_facemap_female_dark"
						<overlayPath> = "faces\CS_NSN_Head_f_blk_alpha"
						<overlayName> = CS_NSN_Head_f_blk_alpha
						<hue> = 2.46000004
						<sat> = 0.89999998
						<val> = 0.87
					else
						if (ChecksumEquals a = <skintone> b = Grey)
							printf "grey f texture"
							<texturePath> = "faces\CS_NSN_facemap_female_light"
							<overlayPath> = "faces\CS_NSN_Head_f_gry_alpha"
							<overlayName> = CS_NSN_Head_f_gry_alpha
							<hue> = 2.46000004
							<sat> = 0.0
							<val> = 0.87
						else
							script_assert "Unrecognized skintone %c" c = <skintone>
						endif
					endif
				endif
			endif
		endif
		return texturePath = <texturePath> overlayPath = <overlayPath> overlayName = <overlayName> hue = <hue> sat = <sat> val = <val>
	endscript
	script maybe_load_default_face
		GetCurrentSkaterProfileIndex
		if NOT PlayerFaceIsValid player = <currentSkaterProfileIndex>
			get_default_face_texture_name
			if NOT GotParam texturePath
				script_assert "no texture path?"
			endif
			SetPlayerFaceTexture {
				player = <currentSkaterProfileIndex>
				texture = <texturePath>
			}
			SetPlayerFacePoints {
				player = <currentSkaterProfileIndex>
				left_eye = [44, 40]
				right_eye = [87, 42]
				nose = [65, 70]
				lips = [66, 88]
				width = 128
				height = 128
			}
			SetPlayerFaceOverlayTexture {
				player = <currentSkaterProfileIndex>
				texture = <overlayPath>
			}
			refresh_skater_model
		else
			refresh_skater_model
		endif
	endscript
	script create_skin_selection_menu
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		FormatText ChecksumName = title_icon "%i_edit_skater" i = (THEME_PREFIXES[current_theme_prefix])
		make_new_themed_sub_menu title = "SKIN TONE" title_icon = <title_icon> pos = (80.0,80.0)
		create_helper_text generic_helper_text_cas
		SetScreenElementProps {id = sub_menu
			event_handlers = [
				{pad_back generic_menu_pad_back params = {callback = create_face_map_menu no_textures focus_child = 3}}
				{pad_l1 cas_rotate_skater_left}
				{pad_r1 cas_rotate_skater_right}
			]
		}
		theme_menu_add_item {text = "Light" pad_choose_script = set_selected_skin pad_choose_params = {texture = "faces\CS_NSN_Head_wht_alpha" file = CS_NSN_Head_wht_alpha} centered = centered}
		theme_menu_add_item {text = "Tan" pad_choose_script = set_selected_skin pad_choose_params = {texture = "faces\CS_NSN_Head_tan_alpha" file = CS_NSN_Head_tan_alpha} centered = centered}
		theme_menu_add_item {text = "Dark" pad_choose_script = set_selected_skin pad_choose_params = {texture = "faces\CS_NSN_Head_blk_alpha" file = CS_NSN_Head_blk_alpha} centered = centered}
		theme_menu_add_item {text = "Greyscale" pad_choose_script = set_selected_skin pad_choose_params = {texture = "faces\CS_NSN_Head_gry_alpha" file = CS_NSN_Head_gry_alpha} centered = centered last_menu_item = last_menu_item}
		FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
		CreateScreenElement {
			type = textBlockElement
			parent = current_menu_anchor
			id = directions_text
			text = "Choose a tone that best matches your face\nFor tough to match skin tones or crazy colors\ntry grayscale, then re-color your skin\n the way you want it in Step 6"
			pos = (320.0,668.0)
			dims = (640.0,80.0)
			font = small
			scale = 0.89999998
			rgba = <off_rgba>
			line_spacing = 0.64999998
			z_priority = 5
			just = [center center]
		}
		CreateScreenElement {
			type = SpriteElement
			parent = current_menu_anchor
			id = directions_box
			texture = myf_box_mid
			pos = (320.0,670.0)
			scale = (14.0,1.89999998)
			just = [center center]
			rgba = <on_rgba>
			z_priority = 5
		}
		finish_themed_sub_menu
		DoScreenElementMorph id = directions_text time = 0.2 pos = (320.0,363.0)
		DoScreenElementMorph id = directions_box time = 0.2 pos = (320.0,365.0)
	endscript
	script set_selected_skin_2
		printf "script set_selected_skin"
		GetCurrentSkaterProfileIndex
		SetPlayerFaceOverlayTexture {
			player = <currentSkaterProfileIndex>
			texture = <texture>
		}
		<found> = 0
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if (<is_male> = 1)
			<head_part> = skater_m_head
		else
			<head_part> = skater_f_head
		endif
		if StringEquals a = <texture> b = "faces\CS_NSN_Head_wht_alpha"
			EditPlayerAppearance {
				profile = <currentSkaterProfileIndex>
				target = SetPart
				targetParams = {part = <head_part> desc_id = #"Light Skin 1"}
			}
			<found> = 1
		endif
		if StringEquals a = <texture> b = "faces\CS_NSN_Head_blk_alpha"
			EditPlayerAppearance {
				profile = <currentSkaterProfileIndex>
				target = SetPart
				targetParams = {part = <head_part> desc_id = #"Dark Skin 1"}
			}
			<found> = 1
		endif
		if StringEquals a = <texture> b = "faces\CS_NSN_Head_tan_alpha"
			EditPlayerAppearance {
				profile = <currentSkaterProfileIndex>
				target = SetPart
				targetParams = {part = <head_part> desc_id = #"Tan Skin 1"}
			}
			<found> = 1
		endif
		if StringEquals a = <texture> b = "faces\CS_NSN_Head_gry_alpha"
			EditPlayerAppearance {
				profile = <currentSkaterProfileIndex>
				target = SetPart
				targetParams = {part = <head_part> desc_id = #"Grey Skin 1"}
			}
			<found> = 1
		endif
		if StringEquals a = <texture> b = "faces\CS_NSN_Head_f_wht_alpha"
			EditPlayerAppearance {
				profile = <currentSkaterProfileIndex>
				target = SetPart
				targetParams = {part = <head_part> desc_id = #"Light Skin 1"}
			}
			<found> = 1
		endif
		if StringEquals a = <texture> b = "faces\CS_NSN_Head_f_blk_alpha"
			EditPlayerAppearance {
				profile = <currentSkaterProfileIndex>
				target = SetPart
				targetParams = {part = <head_part> desc_id = #"Dark Skin 1"}
			}
			<found> = 1
		endif
		if StringEquals a = <texture> b = "faces\CS_NSN_Head_f_tan_alpha"
			EditPlayerAppearance {
				profile = <currentSkaterProfileIndex>
				target = SetPart
				targetParams = {part = <head_part> desc_id = #"Tan Skin 1"}
			}
			<found> = 1
		endif
		if StringEquals a = <texture> b = "faces\CS_NSN_Head_f_gry_alpha"
			EditPlayerAppearance {
				profile = <currentSkaterProfileIndex>
				target = SetPart
				targetParams = {part = <head_part> desc_id = #"Grey Skin 1"}
			}
			<found> = 1
		endif
		if (<found> = 0)
			printf "%s" s = <overlayTextureName>
			script_assert "Unrecognized overlay name"
		endif
	endscript
	script set_selected_skin
		printf "set_selected_skin was called"
		printstruct <...>
		set_selected_skin_2 <...>
		refresh_skater_model
		create_face_map_menu no_textures focus_child = 4
	endscript
	script cas_rotate_skater_left
		if InSplitScreenGame
			GetCurrentSkaterProfileIndex
			<skater> = <currentSkaterProfileIndex>
		else
			<skater> = 0
		endif
		killspawnedscript name = cas_rotate_skater
		spawnscript cas_rotate_skater params = {angle = -3 button = L1}
	endscript
	script cas_rotate_skater_right
		if InSplitScreenGame
			GetCurrentSkaterProfileIndex
			<skater> = <currentSkaterProfileIndex>
		else
			<skater> = 0
		endif
		killspawnedscript name = cas_rotate_skater
		spawnscript cas_rotate_skater params = {angle = 3 button = R1}
	endscript
	script cas_rotate_skater
		while
			if ControllerPressed <button>
				skater::Rotate y = <angle>
			else
				break
			endif
			wait 1 frame
		repeat
	endscript
	script currently_editing_custom
		GetCurrentSkaterProfileIndex
		if SkaterIsCustom player = <currentSkaterProfileIndex>
			return is_enabled = 1
		else
			return is_enabled = 0
		endif
	endscript
	script currently_editing_female
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if GotParam is_male
			return is_enabled = (<is_male> = 0)
		else
			return is_enabled = 0
		endif
	endscript
	script currently_editing_male
		currently_editing_female
		if (<is_enabled> = 0)
			return is_enabled = 1
		else
			return is_enabled = 0
		endif
	endscript
	script currently_editing_custom_male
		currently_editing_female
		if (<is_enabled> = 1)
			return is_enabled = 0
		else
			return is_enabled = 1
		endif
	endscript
	script currently_editing_custom_male_with_face
		currently_editing_female
		if (<is_enabled> = 1)
			return is_enabled = 0
		else
			GetCurrentSkaterProfileIndex
			GetSkaterProfileInfo player = <currentSkaterProfileIndex>
			if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = skater_m_head
				if NOT ((<desc_id> = Skull) || (<desc_id> = Eyes))
					return is_enabled = 1
				endif
			endif
		endif
		return is_enabled = 0
	endscript
	script get_current_skater_get_lockout_parts
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = <part>
			GetActualCASOptionStruct part = <part> desc_id = <desc_id>
			if GotParam lockout_parts
				return lockout_parts = <lockout_parts>
			endif
		endif
	endscript
	script check_for_shoe_flags
		if GotParam group
			get_current_skater_get_lockout_parts part = shoes
			printstruct <...>
			if GotParam lockout_parts
				GetArraySize <lockout_parts>
				<index> = 0
				while
					printf "testing %s %t" s = <group> t = (<lockout_parts>[<index>])
					if (<group> = (<lockout_parts>[<index>]))
						printf "unenabled item %s" s = <group>
						return is_enabled = 0
					endif
					<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
		printf "enabled item %s" s = <group>
		return is_enabled = 1
	endscript
	script check_for_head_flags
		if GotParam group
			get_current_skater_get_lockout_parts part = skater_m_head
			if GotParam lockout_parts
				GetArraySize <lockout_parts>
				<index> = 0
				while
					if (<group> = (<lockout_parts>[<index>]))
						printf "unenabled item %s" s = <group>
						return is_enabled = 0
					endif
					<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
		printf "enabled item %s" s = <group>
		return is_enabled = 1
	endscript
	edit_skater_head_options = [
		{
			group_title = "HEAD OPTIONS"
			text = 'Face'
			submenu = face_menu
			is_visible_script = currently_editing_custom
			is_enabled_script = check_if_group_editable_and_head_is_unlocked
			is_enabled_params = {group = head_items}
			cam_angle = 0
		}
		{
			text = 'Skin Color'
			submenu = skin_color_menu
			is_visible_script = currently_editing_custom
		}
		{
			text = 'Hair'
			submenu = hair_menu
			is_visible_script = currently_editing_custom
			is_visible_script2 = check_for_head_flags
			is_visible_params2 = {group = hair_items}
			is_enabled_script = check_if_group_editable
			is_enabled_params = {group = hair_items}
		}
		{
			text = 'Hair Color'
			submenu = hair_color_menu
			is_visible_script = currently_editing_custom
			is_visible_params = {group = hair_items}
			is_visible_script2 = check_for_head_flags
			is_visible_params2 = {group = hair_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [skater_m_hair skater_f_hair]}
		}
		{
			text = 'Facial Hair'
			submenu = jaw_menu
			is_visible_script = currently_editing_custom_male
			is_visible_params = {group = facial_hair_items}
			is_visible_script2 = check_for_head_flags
			is_visible_params2 = {group = facial_hair_items}
			is_enabled_script = currently_editing_custom_male_with_face
			cam_angle = 0
		}
		{
			text = 'Facial Hair Color'
			submenu = facial_hair_color_menu
			is_visible_script = currently_editing_custom_male
			is_visible_params = {group = facial_hair_items}
			is_visible_script2 = check_for_head_flags
			is_visible_params2 = {group = facial_hair_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [skater_m_jaw] extra_script = currently_editing_custom_male_with_face}
			cam_angle = 0
		}
		{
			text = 'Hats'
			submenu = hats_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = hat_items}
			is_visible_script2 = check_for_head_flags
			is_visible_params2 = {group = hat_items}
		}
		{
			text = 'Hat Color'
			submenu = hat_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = hat_items}
			is_visible_script2 = check_for_head_flags
			is_visible_params2 = {group = hat_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [hat]}
		}
		{
			text = 'Hat Logo'
			submenu = hat_logo_menu
			show_logos
			is_visible_script = check_if_group_editable
			is_visible_params = {group = hat_items}
			is_visible_script2 = check_for_head_flags
			is_visible_params2 = {group = hat_items}
			is_enabled_script = check_if_part_logoable
			is_enabled_params = {parts = [hat]}
		}
		{
			text = 'Glasses'
			submenu = glasses_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = glasses_items}
			is_visible_script2 = check_for_head_flags
			is_visible_params2 = {group = glasses_items}
			is_enabled_script = check_if_group_editable
			is_enabled_params = {parts = [glasses]}
			cam_angle = 0
		}
		{
			text = 'Glasses Color'
			submenu = glasses_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = glasses_items}
			is_visible_script2 = check_for_head_flags
			is_visible_params2 = {group = glasses_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [glasses]}
			cam_angle = 0
		}
	]
	edit_skater_torso_options = [
		{
			group_title = "TORSO OPTIONS"
			text = 'Shirt Style'
			submenu = shirt_style_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = torso_items}
		}
		{
			text = 'Shirt main Color'
			submenu = shirt_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = torso_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [skater_m_torso skater_f_torso]}
		}
		{
			text = 'Shirt second Color'
			submenu = sleeve_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = torso_items}
			is_enabled_script = check_if_sleeve_colorable
			is_enabled_params = {parts = [skater_m_torso skater_f_torso]}
		}
		{
			text = 'Front Logo'
			submenu = front_logo_menu
			show_logos
			is_visible_script = check_if_group_editable
			is_visible_params = {group = torso_items}
			is_enabled_script = check_if_part_logoable
			is_enabled_params = {parts = [skater_m_torso skater_f_torso]}
			cam_angle = 0
			cam_anim_sub = torso
		}
		{
			text = 'Adjust Front Logo'
			submenu = front_logo_pos_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = torso_items}
			is_enabled_script = check_if_part_logoable
			is_enabled_params = {parts = [skater_m_torso skater_f_torso]}
			cam_angle = 0
		}
		{
			text = 'Back Logo'
			submenu = back_logo_menu
			show_logos
			is_visible_script = check_if_group_editable
			is_visible_params = {group = torso_items}
			is_enabled_script = check_if_part_back_logoable
			is_enabled_params = {parts = [skater_m_torso skater_f_torso]}
			cam_angle = 180
			cam_anim_sub = torso
		}
		{
			text = 'Adjust Back Logo'
			submenu = back_logo_pos_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = torso_items}
			is_enabled_script = check_if_part_back_logoable
			is_enabled_params = {parts = [skater_m_torso skater_f_torso]}
			cam_angle = 180
		}
		{
			text = 'Backpack'
			submenu = backpack_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = backpack_items}
			cam_angle = 180
		}
		{
			text = 'Pack Color'
			submenu = pack_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = backpack_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [skater_m_backpack skater_f_backpack]}
		}
		{
			text = 'Accessories'
			submenu = accessories_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = accessories_items}
		}
		{
			text = 'Accessories Color'
			submenu = accessories_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = accessories_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [accessories]}
		}
	]
	edit_skater_leg_options = [
		{
			group_title = "LEG OPTIONS"
			text = 'Pants'
			submenu = pants_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = legs_items}
		}
		{
			text = 'Pants Color'
			submenu = pants_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = legs_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [skater_m_legs skater_f_legs]}
			group = legs_items
		}
		{
			text = 'Socks'
			submenu = socks_menu
			cam_anim_sub = Feet
			is_visible_script = check_if_group_editable
			is_visible_params = {group = socks_items}
			is_visible_script2 = check_for_shoe_flags
			is_visible_params2 = {group = socks_items}
		}
		{
			text = 'Socks Color'
			submenu = socks_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = socks_items}
			is_visible_script2 = check_for_shoe_flags
			is_visible_params2 = {group = socks_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [skater_m_socks skater_f_socks]}
			cam_anim_sub = Feet
		}
		{
			text = 'Shoes'
			submenu = shoes_menu
			cam_anim_sub = Feet
			is_visible_script = check_if_group_editable
			is_visible_params = {group = shoes_items}
		}
		{
			text = 'Shoe Color'
			submenu = shoe_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = shoes_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [shoes]}
			cam_anim_sub = Feet
		}
	]
	edit_skater_tattoo_options = [
		{
			group_title = "TATTOO OPTIONS"
			text = 'Head Tattoo'
			submenu = head_tattoo_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			cam_anim_sub = HeadTop
			cam_angle = 180
			show_logos
		}
		{
			text = 'Chest Tattoo'
			submenu = chest_tattoo_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			cam_anim_sub = torso
			cam_angle = 0
			show_logos
		}
		{
			text = 'Adjust Chest'
			submenu = chest_tattoo_pos_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			is_enabled_script = check_if_part_editable
			is_enabled_params = {part = chest_tattoo}
			cam_anim_sub = adjtorso
			cam_angle = 0
		}
		{
			text = 'Back Tattoo'
			submenu = back_tattoo_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			cam_anim_sub = torso
			cam_angle = 180
			show_logos
		}
		{
			text = 'Adjust Back'
			submenu = back_tattoo_pos_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			is_enabled_script = check_if_part_editable
			is_enabled_params = {part = back_tattoo}
			cam_anim_sub = adjtorso
			cam_angle = 180
		}
		{
			text = 'L Bicep Tattoo'
			submenu = left_bicep_tattoo_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			cam_anim_sub = torso
			cam_angle = -90
			show_logos
		}
		{
			text = 'Adjust L Bicep'
			submenu = left_bicep_tattoo_pos_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			is_enabled_script = check_if_part_editable
			is_enabled_params = {part = left_bicep_tattoo}
			cam_anim_sub = adjtorso
			cam_angle = -90
		}
		{
			text = 'L Forearm Tattoo'
			submenu = left_forearm_tattoo_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			cam_anim_sub = torso
			cam_angle = -90
			show_logos
		}
		{
			text = 'Adjust L Forearm'
			submenu = left_forearm_tattoo_pos_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			is_enabled_script = check_if_part_editable
			is_enabled_params = {part = left_forearm_tattoo}
			cam_anim_sub = adjtorso
			cam_angle = -90
		}
		{
			text = 'R Bicep Tattoo'
			submenu = right_bicep_tattoo_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			cam_anim_sub = torso
			cam_angle = 70
			show_logos
		}
		{
			text = 'Adjust R Bicep'
			submenu = right_bicep_tattoo_pos_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			is_enabled_script = check_if_part_editable
			is_enabled_params = {part = right_bicep_tattoo}
			cam_anim_sub = adjtorso
			cam_angle = 90
		}
		{
			text = 'R Forearm Tattoo'
			submenu = right_forearm_tattoo_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			cam_anim_sub = torso
			cam_angle = 90
			show_logos
		}
		{
			text = 'Adjust R Forearm'
			submenu = right_forearm_tattoo_pos_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			is_enabled_script = check_if_part_editable
			is_enabled_params = {part = right_forearm_tattoo}
			cam_anim_sub = adjtorso
			cam_angle = 90
		}
		{
			text = 'L Leg Tattoo'
			submenu = left_leg_tattoo_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			cam_anim_sub = legtattoo
			cam_angle = -90
			show_logos
		}
		{
			text = 'Adjust L Leg'
			submenu = left_leg_tattoo_pos_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			is_enabled_script = check_if_part_editable
			is_enabled_params = {part = left_leg_tattoo}
			cam_anim_sub = adjlegtattoo
			cam_angle = -90
		}
		{
			text = 'R Leg Tattoo'
			submenu = right_leg_tattoo_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			cam_anim_sub = legtattoo
			cam_angle = 90
			show_logos
		}
		{
			text = 'Adjust R Leg'
			submenu = right_leg_tattoo_pos_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = tattoo_items}
			is_enabled_script = check_if_part_editable
			is_enabled_params = {part = right_leg_tattoo}
			cam_anim_sub = adjlegtattoo
			cam_angle = 90
		}
	]
	edit_skater_scaling_options = skateshop_scaling_options
	edit_skater_pad_options = [
		{
			group_title = "PAD OPTIONS"
			text = 'Helmet'
			submenu = helmet_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = helmet_items}
			cam_anim_sub = head
		}
		{
			text = 'Helmet Color'
			submenu = helmet_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = helmet_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [helmet]}
			cam_anim_sub = head
		}
		{
			text = 'Helmet Logo'
			show_logos
			submenu = helmet_logo_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = helmet_items}
			is_enabled_script = check_if_part_logoable
			is_enabled_params = {parts = [helmet]}
			cam_anim_sub = head
		}
		{
			text = 'Elbow Pads'
			submenu = elbowpads_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = elbowpads_items}
			cam_anim_sub = adjtorso
		}
		{
			text = 'Elbow Pad Color'
			submenu = elbowpads_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = elbowpads_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [elbowpads]}
			cam_anim_sub = adjtorso
		}
		{
			text = 'Knee Pads'
			submenu = kneepads_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = kneepads_items}
			cam_anim_sub = legs
		}
		{
			text = 'Knee Pad Color'
			submenu = kneepads_color_menu
			is_visible_script = check_if_group_editable
			is_visible_params = {group = kneepads_items}
			is_enabled_script = check_if_part_colorable
			is_enabled_params = {parts = [kneepads]}
			cam_anim_sub = legs
		}
	]
	script edit_skater_create_main_deck_menu item_dims = (10.0,20.0)
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if (<stance> = Goofy)
			Change was_goofy = 1
			SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {stance = Regular}
			RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex>
		endif
		FormatText ChecksumName = title_icon "%i_CAD" i = (THEME_PREFIXES[current_theme_prefix])
		build_theme_sub_title title = "DESIGN DECK" title_icon = <title_icon>
		edit_skater_create_menu_block scale = (0.94999999,1.0) parts = 5
		GetStackedScreenElementPos y id = edit_skater_menu_tab offset = (130.0,15.0)
		CreateScreenElement {
			type = VMenu
			parent = edit_skater_anchor_middle
			id = edit_skater_vmenu
			pos = <pos>
			just = [center top]
		}
		if (in_cad_cutscene_sequence = 1)
			create_helper_text generic_helper_text_no_back helper_pos = (320.0,467.0)
			SetScreenElementProps {
				id = edit_skater_vmenu
				event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
				replace_handlers
			}
		else
			create_helper_text generic_helper_text helper_pos = (320.0,467.0)
			SetScreenElementProps {
				id = edit_skater_vmenu
				event_handlers = [{pad_back generic_menu_pad_back_sound}
					{pad_back edit_skater_menu_exit params = <...>}
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
				replace_handlers
			}
		endif
		AssignAlias id = edit_skater_vmenu alias = current_menu
		RemoveParameter current_desc_id
		RemoveParameter icon_rgba
		RemoveParameter texture
		get_part_current_desc_id part = cad_graphic
		if GotParam current_desc_id
			get_logo_texture part = cad_graphic desc_id = <current_desc_id>
		endif
		if NOT GotParam texture
			texture = cd_base
		else
			icon_rgba = [128 128 128 100]
		endif
		edit_skater_icon_menu_add_item {
			text = 'Base Graphic'
			dims = <item_dims>
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {title = "BASE GRAPHIC"
				title_icon = <title_icon>
				options_array = deck_design_graphic_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
			icon_scale = <icon_scale>
			child_texture = <texture>
			icon_rgba = <icon_rgba>
			deck_icon = deck_icon
			index = 0
		}
		RemoveParameter current_desc_id
		RemoveParameter icon_rgba
		RemoveParameter texture
		get_part_current_desc_id part = deck_layer4
		if GotParam current_desc_id
			get_logo_texture part = deck_layer4 desc_id = <current_desc_id>
		endif
		if NOT GotParam texture
			texture = cd_layer5
		else
			icon_rgba = [128 128 128 100]
		endif
		edit_skater_icon_menu_add_item {
			text = 'Tiled Layer'
			dims = <item_dims>
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {title = "Tiled Layer"
				title_icon = <title_icon>
				options_array = deck_design_layer4_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
			child_texture = <texture>
			icon_rgba = <icon_rgba>
			index = 1
		}
		RemoveParameter current_desc_id
		RemoveParameter texture
		RemoveParameter icon_rgba
		get_part_current_desc_id part = deck_layer5
		if GotParam current_desc_id
			get_logo_texture part = deck_layer5 desc_id = <current_desc_id>
		endif
		if NOT GotParam texture
			texture = cd_layer4
		else
			icon_rgba = [128 128 128 100]
		endif
		edit_skater_icon_menu_add_item {
			text = 'Layer 4'
			dims = <item_dims>
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {title = "LAYER 4"
				title_icon = <title_icon>
				options_array = deck_design_layer5_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
			child_texture = <texture>
			icon_rgba = <icon_rgba>
			index = 2
		}
		RemoveParameter current_desc_id
		RemoveParameter texture
		RemoveParameter icon_rgba
		get_part_current_desc_id part = deck_layer1
		if GotParam current_desc_id
			get_logo_texture part = deck_layer1 desc_id = <current_desc_id>
		endif
		if NOT GotParam texture
			texture = cd_layer3
		else
			icon_rgba = [128 128 128 100]
		endif
		edit_skater_icon_menu_add_item {
			text = 'Layer 3'
			dims = <item_dims>
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {title = "LAYER 3"
				title_icon = <title_icon>
				options_array = deck_design_layer1_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
			child_texture = <texture>
			icon_rgba = <icon_rgba>
			index = 3
		}
		RemoveParameter current_desc_id
		RemoveParameter texture
		RemoveParameter icon_rgba
		get_part_current_desc_id part = deck_layer2
		if GotParam current_desc_id
			get_logo_texture part = deck_layer2 desc_id = <current_desc_id>
		endif
		if NOT GotParam texture
			texture = cd_layer2
		else
			icon_rgba = [128 128 128 100]
		endif
		edit_skater_icon_menu_add_item {
			text = 'Layer 2'
			dims = <item_dims>
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {title = "LAYER 2"
				title_icon = <title_icon>
				options_array = deck_design_layer2_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
			child_texture = <texture>
			icon_rgba = <icon_rgba>
			index = 4
		}
		RemoveParameter current_desc_id
		RemoveParameter texture
		RemoveParameter icon_rgba
		get_part_current_desc_id part = deck_layer3
		if GotParam current_desc_id
			get_logo_texture part = deck_layer3 desc_id = <current_desc_id>
		endif
		if NOT GotParam texture
			texture = cd_layer1
		else
			icon_rgba = [128 128 128 100]
		endif
		edit_skater_icon_menu_add_item {
			text = 'Layer 1'
			dims = <item_dims>
			pad_choose_script = edit_skater_create_options_menu
			pad_choose_params = {title = "LAYER 1"
				title_icon = <title_icon>
				options_array = deck_design_layer3_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
			child_texture = <texture>
			icon_rgba = <icon_rgba>
			index = 5
		}
		if (in_cad_cutscene_sequence = 1)
			pad_choose_script = cad_sequence_done
		else
			pad_choose_script = edit_skater_menu_exit
		endif
		edit_skater_menu_add_item {
			text = 'Done'
			dims = <item_dims>
			pad_choose_script = <pad_choose_script>
			index = 10
		}
		if (in_deck_design = 0)
			skater::SwitchOnBoard
			skater::PlayAnim Anim = BoardPlacement BlendPeriod = 0 cycle
			skater::Obj_MoveToNode name = cad_deck_spot orient
			skater::Obj_ShadowOff
			RunScriptOnScreenElement cad_camera id = current_menu params = {<...> at_cad_menu = 1}
			return
		endif
		FireEvent type = focus target = current_menu data = {grid_index = edit_skater_menu_level_1_index}
	endscript
	script cad_sequence_done
		if (was_goofy = 1)
			GetCurrentSkaterProfileIndex
			GetSkaterProfileInfo player = <currentSkaterProfileIndex>
			Change was_goofy = 0
			SetSkaterProfileInfo player = <currentSkaterProfileIndex> params = {stance = Goofy}
			RefreshSkaterModel skater = 0 profile = <currentSkaterProfileIndex> no_board = no_board
		endif
		cad_exit_to_vc
	endscript
	script is_base_graphic_set
		GetCurrentSkaterProfileIndex
		if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = cad_graphic
			if (<desc_id> = None)
				<is_enabled> = 0
			else
				<is_enabled> = 1
			endif
		else
			<is_enabled> = 0
		endif
		return is_enabled = <is_enabled>
	endscript
	script is_tiledlayer_graphic_set
		GetCurrentSkaterProfileIndex
		if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = deck_layer4
			if (<desc_id> = None)
				<is_enabled> = 0
			else
				<is_enabled> = 1
			endif
		else
			<is_enabled> = 0
		endif
		return is_enabled = <is_enabled>
	endscript
	script is_layer4_graphic_set
		GetCurrentSkaterProfileIndex
		if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = deck_layer5
			if (<desc_id> = None)
				<is_enabled> = 0
			else
				<is_enabled> = 1
			endif
		else
			<is_enabled> = 0
		endif
		return is_enabled = <is_enabled>
	endscript
	script is_layer3_graphic_set
		GetCurrentSkaterProfileIndex
		if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = deck_layer1
			if (<desc_id> = None)
				<is_enabled> = 0
			else
				<is_enabled> = 1
			endif
		else
			<is_enabled> = 0
		endif
		return is_enabled = <is_enabled>
	endscript
	script is_layer2_graphic_set
		GetCurrentSkaterProfileIndex
		if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = deck_layer2
			if (<desc_id> = None)
				<is_enabled> = 0
			else
				<is_enabled> = 1
			endif
		else
			<is_enabled> = 0
		endif
		return is_enabled = <is_enabled>
	endscript
	script is_layer1_graphic_set
		GetCurrentSkaterProfileIndex
		if GetPlayerAppearancePart player = <currentSkaterProfileIndex> part = deck_layer3
			if (<desc_id> = None)
				<is_enabled> = 0
			else
				<is_enabled> = 1
			endif
		else
			<is_enabled> = 0
		endif
		return is_enabled = <is_enabled>
	endscript
	deck_design_graphic_options = [
		{
			group_title = "BASE GRAPHIC"
			cad_part = cad_graphic
			deck_scaling
			text = 'Graphic Set 1'
			submenu = cad_graphic_menu
			endlist = 18
			show_logos
		}
		{
			text = 'Graphic Set 2'
			submenu = cad_graphic_menu
			startlist = 19
			show_logos
		}
		{
			text = 'Wheel Color'
			submenu = wheel_color_menu
			is_enabled_script = is_base_graphic_set
		}
	]
	deck_design_layer1_options = [
		{
			group_title = "LAYER 3"
			cad_part = deck_layer1
			text = 'Bold Grafix'
			submenu = deck_layer1_menu
			endlist = 56
			show_logos
		}
		{
			text = 'Letters Numbers Faces'
			submenu = deck_layer1_menu
			startlist = 57
			show_logos
		}
		{
			text = 'Move/Resize Graphic'
			submenu = deck_layer1_pos_menu
			is_enabled_script = is_layer3_graphic_set
		}
		{
			text = 'Color'
			submenu = deck_layer1_color_menu
			is_enabled_script = is_layer3_graphic_set
		}
		{
			text = 'Move Forward'
			pad_choose_script = swap_deck_layers
			part1 = deck_layer1
			part2 = deck_layer2
			callback = edit_skater_create_options_menu
			callback_params = {options_array = deck_design_layer2_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
		}
		{
			text = 'Move Backward'
			pad_choose_script = swap_deck_layers
			part1 = deck_layer1
			part2 = deck_layer5
			callback = edit_skater_create_options_menu
			callback_params = {options_array = deck_design_layer5_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
		}
	]
	deck_design_layer2_options = [
		{
			group_title = "LAYER 2"
			cad_part = deck_layer2
			text = 'Bold Grafix'
			submenu = deck_layer2_menu
			endlist = 56
			show_logos
		}
		{
			text = 'Letters Numbers Faces'
			submenu = deck_layer2_menu
			startlist = 57
			show_logos
		}
		{
			text = 'Move/Resize Graphic'
			submenu = deck_layer2_pos_menu
			is_enabled_script = is_layer2_graphic_set
		}
		{
			text = 'Color'
			submenu = deck_layer2_color_menu
			is_enabled_script = is_layer2_graphic_set
		}
		{
			text = 'Move Forward'
			pad_choose_script = swap_deck_layers
			part1 = deck_layer2
			part2 = deck_layer3
			callback = edit_skater_create_options_menu
			callback_params = {options_array = deck_design_layer3_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
		}
		{
			text = 'Move Backward'
			pad_choose_script = swap_deck_layers
			part1 = deck_layer2
			part2 = deck_layer1
			callback = edit_skater_create_options_menu
			callback_params = {options_array = deck_design_layer1_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
		}
	]
	deck_design_layer3_options = [
		{
			group_title = "LAYER 1"
			cad_part = deck_layer3
			text = 'Bold Grafix'
			submenu = deck_layer3_menu
			endlist = 56
			show_logos
		}
		{
			text = 'Letters Numbers Faces'
			submenu = deck_layer3_menu
			startlist = 57
			show_logos
		}
		{
			text = 'Move/Resize Graphic'
			submenu = deck_layer3_pos_menu
			is_enabled_script = is_layer1_graphic_set
		}
		{
			text = 'Color'
			submenu = deck_layer3_color_menu
			is_enabled_script = is_layer1_graphic_set
		}
		{
			text = 'Move Backward'
			pad_choose_script = swap_deck_layers
			part1 = deck_layer3
			part2 = deck_layer2
			callback = edit_skater_create_options_menu
			callback_params = {options_array = deck_design_layer2_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
		}
	]
	deck_design_layer4_options = [
		{
			group_title = "TILED LAYER"
			cad_part = deck_layer4
			text = 'Graphic'
			submenu = deck_layer4_menu
			show_logos
		}
		{
			text = 'Move/Resize Graphic'
			submenu = deck_layer4_pos_menu
			is_enabled_script = is_tiledlayer_graphic_set
		}
		{
			text = 'Color'
			submenu = deck_layer4_color_menu
			is_enabled_script = is_tiledlayer_graphic_set
		}
	]
	deck_design_layer5_options = [
		{
			group_title = "LAYER 4"
			cad_part = deck_layer5
			text = 'Bold Grafix'
			submenu = deck_layer5_menu
			endlist = 56
			show_logos
		}
		{
			text = 'Letters Numbers Faces'
			submenu = deck_layer5_menu
			startlist = 57
			show_logos
		}
		{
			text = 'Move/Resize Graphic'
			submenu = deck_layer5_pos_menu
			is_enabled_script = is_layer4_graphic_set
		}
		{
			text = 'Color'
			submenu = deck_layer5_color_menu
			is_enabled_script = is_layer4_graphic_set
		}
		{
			text = 'Move Forward'
			pad_choose_script = swap_deck_layers
			part1 = deck_layer5
			part2 = deck_layer1
			callback = edit_skater_create_options_menu
			callback_params = {options_array = deck_design_layer1_options
				from_level_1
				pad_back_script = edit_skater_create_main_deck_menu
			}
		}
	]
