	script Veh_TaxiUS_TOD
	endscript
	script Veh_IsuzuTruck_TOD
	endscript
	script Veh_Lada_TOD
	endscript
	script Veh_SUV_TOD
	endscript
	script Veh_TransAm_TOD
	endscript
	script Gap_CarHop
		StartGap {GapID = <StartGapID> flags = PURE_AIR}
		EndGap {GapID = <EndGapID> text = "Car hop" score = 100 GapScript = <GapScript>}
	endscript
	script Veh_Generic_TOD
		switch <current_tod>
			case morning
				ReplaceCarTextures {
					array = [
						{
							src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle_Transparent"
						}
						{
							src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow"
						}
					]
				}
			case day
				ReplaceCarTextures {
					array = [
						{
							src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle_Transparent"
						}
						{
							src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow_Transparent"
						}
					]
				}
			case evening
				ReplaceCarTextures {
					array = [
						{
							src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle_Transparent"
						}
						{
							src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow"
						}
					]
				}
			case night
				ReplaceCarTextures {
					array = [
						{
							src = "JKU_LightCircle_Transparent.png" dest = "textures/cars/JKU_LightCircle"
						}
						{
							src = "JKU_HeadlightGlow_Transparent.png" dest = "textures/cars/JKU_HeadlightGlow"
						}
					]
				}
			default
				printf "### no tod set ###"
		endswitch
	endscript
	script Cone_Contacts
		contacts = [
			(6.0,6.0,17.0)
			(6.0,6.0,-17.0)
			(-6.0,6.0,17.0)
			(-6.0,6.0,-17.0)
			(-6.0,0.0,-12.0)
		]
	endscript
