
	script TurnBackAround movetonode = TRG_TurnAround01 text = "Whooah, easy bub. You don't have enough goal points to go to the next level. Beat some more goals, then come see me again."
		if InNetGame
			<text> = "Sorry bub, taxi's busted. \n Don't you have a game to play anyway?"
		endif
		if isTrue Bootstrap_Build
			<text> = "Sorry, the taxi's out of service for the demo. Maybe if you buy the real game, I can afford to get it fixed."
		endif
		StopSkitch
		MakeSkaterGoto EndOfRun Params = {FromTaxiGuy}
		pause_trick_text
		pause_balance_meter
		if NOT InNetGame
			GoalManager_PauseAllGoals
		endif
		create_speech_box {pos = (320.0,300.0)
			text = <text>
			pad_choose_script = TurnBackAround_Finish
		}
	endscript
	script TurnBackAround_Finish
		unpause_trick_text
		unpause_balance_meter
		if NOT InNetGame
			GoalManager_UnPauseAllGoals
		endif
		Skater::SK3_Killskater nodename = TRG_TurnAround01 nomessage
	endscript
	script GetSkaterState
		Skater::GetTags
		return state = <state>
	endscript
