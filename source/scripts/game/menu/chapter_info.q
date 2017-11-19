	Display_Story_Peralta_LoadingScreen = 0
	Display_Story_Final_LoadingScreen = 0
	Display_Story_Premiere_LoadingScreen = 0
	CHAPTER_STATUS = [
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	]
	CHAPTER_NUM_GOALS_TO_COMPLETE = [
		[1, 3, 1]
		[3, 1]
		[1, 1, 1, 1]
		[4]
		[2, 1, 1]
		[2]
		[3, 1]
		[4, 1]
		[2, 1]
		[1]
		[3, 1]
		[3, 1]
		[3, 1]
		[3, 1]
		[5, 1]
		[1, 1]
		[7, 1]
		[3, 1]
		[1, 1]
		[2, 1]
		[4, 1]
		[3, 1]
		[1, 1]
		[2]
		[1]
		[5]
		[1]
	]
	total_num_goals = 129
	STAGE_TOD_SETTINGS = [
		[set_tod_day, set_tod_day, set_tod_day]
		[set_tod_nj_evening, set_tod_nj_night]
		[set_tod_nj_morning, set_tod_day, set_tod_day, set_tod_nj_fog]
		[set_tod_day]
		[set_tod_night, set_tod_night, set_tod_night]
		[set_tod_day]
		[set_tod_day, set_tod_day]
		[set_tod_day, set_tod_day]
		[set_tod_day, set_tod_day]
		[set_tod_day]
		[set_tod_day, set_tod_day]
		[set_tod_day, set_tod_day]
		[set_tod_day, set_tod_day]
		[set_tod_day, set_tod_day]
		[set_tod_day, set_tod_day]
		[set_tod_day, set_tod_day]
		[set_tod_day, set_tod_vc_evening]
		[set_tod_day, set_tod_day]
		[set_tod_vc_evening, set_tod_vc_evening]
		[set_tod_ru_day, set_tod_ru_day]
		[set_tod_ru_day_snow, set_tod_ru_day_snow]
		[set_tod_ru_night, set_tod_ru_night]
		[set_tod_day, set_tod_day]
		[set_tod_day]
		[set_tod_day]
		[set_tod_day]
		[set_tod_evening]
	]
	CHAPTER_COMPLETION_SCRIPTS = [
		[{script_name = NJ_StageSwitch_0_to_1_1}, {script_name = NJ_StageSwitch_1_1_to_1_2}, {script_name = NJ_StageSwitch_1_2_to_2_1}]
		[{script_name = NJ_StageSwitch_2_1_to_2_2}, {script_name = NJ_StageSwitch_2_2_to_3_1}]
		[{script_name = NJ_StageSwitch_3_1_to_3_2}, {script_name = NJ_StageSwitch_3_2_to_3_3}, {script_name = NJ_StageSwitch_3_3_to_3_4}, {script_name = NJ_StageSwitch_GoingToNY}]
		[{script_name = NY_StageSwitch_1_1_to_2_1}]
		[{script_name = NY_StageSwitch_2_1_to_2_2}, {script_name = NY_StageSwitch_2_2_to_2_3}, {script_name = NY_StageSwitch_2_3_to_3_1}]
		[{script_name = NY_StageSwitch_GoingToFL}]
		[{script_name = FL_StageSwitch_1_1_to_1_2}, {script_name = FL_StageSwitch_1_2_to_2_1}]
		[{script_name = FL_StageSwitch_2_1_to_2_2}, {script_name = FL_StageSwitch_2_2_to_3_1}]
		[{script_name = FL_StageSwitch_3_1_to_3_2}, {script_name = FL_StageSwitch_GoingToSponsor}]
		[{script_name = boardshop_do_nothing_script}]
		[{script_name = SD_StageSwitch_1_1_to_1_2}, {script_name = SD_StageSwitch_1_2_to_2_1}]
		[{script_name = SD_StageSwitch_2_1_to_2_2}, {script_name = SD_StageSwitch_2_2_to_3_1}]
		[{script_name = SD_StageSwitch_3_1_to_3_2}, {script_name = SD_StageSwitch_GoingToHI}]
		[{script_name = HI_StageSwitch_1_1_to_1_2}, {script_name = HI_StageSwitch_1_2_to_2_1}]
		[{script_name = HI_StageSwitch_2_1_to_2_2}, {script_name = HI_StageSwitch_2_2_to_3_1}]
		[{script_name = HI_StageSwitch_3_1_to_3_2}, {script_name = HI_StageSwitch_GoingToVC}]
		[{script_name = VC_StageSwitch_1_1_to_1_2}, {script_name = VC_StageSwitch_GoingToSJ}]
		[{script_name = SJ_StageSwitch_1_1_to_1_2}, {script_name = SJ_StageSwitch_GoingToVC}]
		[{script_name = VC_StageSwitch_2_1_to_2_2}, {script_name = VC_StageSwitch_GoingToRU}]
		[{script_name = RU_StageSwitch_1_1_to_1_2}, {script_name = RU_StageSwitch_1_2_to_2_1}]
		[{script_name = RU_StageSwitch_2_1_to_2_2}, {script_name = RU_StageSwitch_2_2_to_3_1}]
		[{script_name = RU_StageSwitch_3_1_to_3_2}, {script_name = RU_StageSwitch_GoingToNJ}]
		[{script_name = NJ_StageSwitch_FindYourself}, {script_name = NJ_StageSwitch_GoingToPros}]
		[{script_name = Pros_StageSwitch_ChooseYourPro}]
		[{script_name = UnlockTeamDecks}]
		[{script_name = Movies_StageSwitch_GoingToEric}]
		[{script_name = Eric_StageSwitch_GoingToGameOver}]
	]
	LEVEL_PEDS_HIDE = [
		[TRG_G_Special_Pro TRG_Ped_Walking TRG_Ped_Walking01 TRG_Ped_Walking02 TRG_Ped_Walking03 TRG_Ped_Walking04 TRG_Ped_Walking05]
		[]
		[]
		[]
		[]
		[]
		[]
		[]
		[]
	]
	dont_lock_goals = 0
	script unlock_all_chapters
		GetArraySize CHAPTER_STATUS
		index = 0
		while
			chapter_status2 = CHAPTER_STATUS
			SetArrayElement arrayname = chapter_status2 index = <index> newvalue = 1
			index = (<index> + 1)
		repeat <array_size>
		change dont_lock_goals = 1
	endscript
	CHAPTER_LEVELS = [
		{text = "NEW JERSEY" checksum = load_nj num = 1}
		{text = "NEW JERSEY" checksum = load_nj num = 1}
		{text = "NEW JERSEY" checksum = load_nj num = 1}
		{text = "MANHATTAN" checksum = load_ny num = 2}
		{text = "MANHATTAN" checksum = load_ny num = 2}
		{text = "MANHATTAN" checksum = load_ny num = 2}
		{text = "TAMPA" checksum = load_fl num = 3}
		{text = "TAMPA" checksum = load_fl num = 3}
		{text = "TAMPA" checksum = load_fl num = 3}
		{text = "SPONSOR PICK" checksum = everywhere num = 10}
		{text = "SAN DIEGO" checksum = load_sd num = 4}
		{text = "SAN DIEGO" checksum = load_sd num = 4}
		{text = "SAN DIEGO" checksum = load_sd num = 4}
		{text = "HAWAII" checksum = load_hi num = 5}
		{text = "HAWAII" checksum = load_hi num = 5}
		{text = "HAWAII" checksum = load_hi num = 5}
		{text = "VANCOUVER" checksum = load_vc num = 6}
		{text = "SLAM CITY JAM" checksum = load_sj num = 7}
		{text = "VANCOUVER" checksum = load_vc num = 6}
		{text = "MOSCOW" checksum = load_ru num = 8}
		{text = "MOSCOW" checksum = load_ru num = 8}
		{text = "MOSCOW" checksum = load_ru num = 8}
		{text = "NEW JERSEY" checksum = load_nj num = 1}
		{text = "NEW JERSEY" checksum = load_nj num = 1}
		{text = "TEAM PICK" checksum = everywhere num = 25}
		{text = "EVERYWHERE" checksum = everywhere num = 26}
		{text = "NEW JERSEY" checksum = load_nj num = 1}
	]
	LEVEL_CHAPTER_MAP = {
		load_nj = 0
		load_ny = 3
		load_fl = 6
		load_sd = 10
		load_hi = 13
		load_vc = 16
		load_sj = 17
		load_ru = 19
	}
	CHAPTER_TITLES = [
		"HOMETOWN HIJINKS",
		"IMPRESSING THE LOCALS",
		"GETTING OUTTA DODGE",
		"SKATE THE BIG APPLE",
		"SKATING WITH THE LOCALS",
		"FAVORS FOR A RIDE",
		"WITH SYRUP OR JELLY",
		"GREASE THE PROS",
		"KILL THE COMP",
		"JOIN A TEAM",
		"PROVE YOURSELF WORTHY",
		"PARTY! PARTY! PARTY!",
		"DEMO TIME",
		"GET LEI'D",
		"FIND THE ULTIMATE SPOT",
		"GET THE SHOT",
		"LAST MINUTE TASKS",
		"DESTROY THE SLAM CITY JAM",
		"IT'S GOTTA BE THE SHOES",
		"WELCOME TO RUSSIA",
		"TIME TO SKATE COMRADE",
		"GOODBYE SWEET MOSCOW",
		"KEEPIN IT REAL",
		"SPREADIN' THE NEWS",
		"PICK YOUR TEAM MEMBERS"
		"THE VIDEO TO END ALL"
		"SHOWDOWN IN NEW JERSEY"
	]
	CHAPTER_DESCRIPTIONS = [
		"Clear your head and have some fun skating your hometown.",
		"Get in tight with the local skateshop and its riders...",
		"Eric is in deep with the local dealers! Gotta find a way to get you guys outta there!",
		"Out of that dump of a hometown and in the big city! Time to hit some of those great skate spots.",
		"Time to shoot your own skate video to send off to Mr. Peralta. Get the locals' help.",
		"Mr. Peralta thinks you guys might actually have a chance in Tampa.  Do some errands for him and he'll let you borrow his car to get down there!",
		"The Tampa Cops are holding Eric and they won't let him go unless you run their errands.",
		"This sucks! Got all the way down here and they won't let you enter the contest... maybe some of the pros that are in town can lend a hand...",
		"Time to lay down the law - if you can kill this competition, you might just make a name for yourself.",
		"Too many choices! Time to join a real team. Check out the team videos then choose a team...",
		"Damn! A team skater! Well, better get to know the rest of your team - probably wouldn't hurt to start gettin' some press too...",
		"Your first ad! Time to celebrate - but you hafta get the party favors...",
		"Your first team demo - but where is everyone? Get all your guys to the demo and show the kids what you can do!",
		"Go Explore! Just don't get into any trouble like those crazy Brady kids!",
		"Gotta find the perfect spot.",
		"The perfect spot. The video killer. Sack up and get the footage.",
		"The premiere is right around the corner and the video isn't even done! Help out getting it finished!",
		"What the F&@*! Your part was gone from the video! Well, only one thing to do... destroy EVERYONE in the competition!",
		"Not gonna stop now - get that shoe sponsor!",
		"Welcome to Russia, comrade. Skate. Explore. Enjoy... and remember, prostitution is legal here.",
		"You gotta job to do - Time to show these Ruskies what you can do!",
		"Screw this super spy stuff, time to get out of Mother Russia",
		"Too much crap - go have some fun!",
		"The other pros are gonna want to have a good reason to join... time to go do some sick stuff!!"
		"Pick Your Pros."
		"You've got the team - time to do the video!"
		"You've always known that you were better - time to prove it!"
	]
	CHAPTER_GOALS = [
		[
			[
				{text = "Help Eric" goal_id = NJ_Goal_Collect5}
			]
			[
				{text = "Walk Charles" goal_id = NJ_Goal_Gaps4}
				{text = "Eric's challenge" goal_id = NJ_Goal_trickspot4}
				{text = "Get in tight with the Street Warriors" goal_id = nj_goal_race6}
				{text = "Flyer for the Muska demo" goal_id = nj_goal_Counter2}
			]
			[{text = "IMPRESS MUSKA" final goal_id = nj_goal_proscore}
			]
		]
		[
			[
				{text = "Impress Shawn" goal_id = nj_goal_Trickspot2}
				{text = "Demo the New Playground Setup" goal_id = nj_goal_highscore}
				{text = "Impress Joey" goal_id = nj_goal_trickspot6 no_ped_cam = no_ped_cam targetOffset = (-61.483078,19.80982399,2241.0378418) positionOffset = (-54.83562469,21.69812584,2240.75048828)}
				{text = "Do Chris' Best Lines" goal_id = nj_goal_race3 no_ped_cam = no_ped_cam targetOffset = (-2671.17651367,99.13886261,2742.9206543) positionOffset = (-2659.80102539,78.29908752,2773.37426758)}
			]
			[{text = "Get the stolen items back from the Dealers" final goal_id = nj_goal_collect}
			]
		]
		[
			[
				{text = "Get the Scrapmetal for the Tombstone Maker" goal_id = nj_goal_collect4}
			]
			[
				{text = "Get access to the Train Station" goal_id = nj_goal_Counter3}
			]
			[{text = "Impress the bratty kid" goal_id = nj_goal_GenericScore2}
				{text = "Catch Ollie's house" goal_id = nj_goal_Collect2}
			]
			[{text = "Rescue Eric!" final goal_id = nj_goal_race}]
		]
		[
			[
				{text = "High Score" goal_id = NY_Goal_Highscore}
				{text = "Hold-grind combos" goal_id = NY_Goal_Tetris}
				{text = "Help the student" goal_id = NY_Goal_Collect}
				{text = "Kill 5 famous skatespots" goal_id = NY_Goal_GenericScore}
				{text = "Nut Vendors Unite!" goal_id = NY_Goal_Race}
			]
		]
		[
			[
				{text = "Film the local" goal_id = NY_Goal_Film}
				{text = "Hit the killer banks line" goal_id = NY_Goal_Race2}
				{text = "Crash and burn the car" goal_id = NY_Goal_Gaps3}
			]
			[
				{text = "Help the local skater" goal_id = NY_Goal_Race3}
			]
			[
				{text = "Gap the burning taxi" final goal_id = NY_Goal_Tetris2}
			]
		]
		[
			[
				{text = "Help Stacy's relative" goal_id = NY_Goal_GenericScore6 no_ped_cam = no_ped_cam targetOffset = (-3579.07299805,61.08202362,-4978.12988281) positionOffset = (-3579.73657227,59.38602066,-4962.23779297)}
				{text = "Old school skating techniques" goal_id = NY_Goal_Counter}
				{text = "Find the stolen skateshop goods" goal_id = NY_Goal_Collect2}
			]
		]
		[
			[
				{text = "Remove all of the Stickers" goal_id = FL_Goal_Gaps2}
				{text = "Get the best donuts" goal_id = FL_Goal_Collect}
				{text = "The Skateboarding Bandit" goal_id = FL_Goal_Collect2}
				{text = "Help the Private Eye" goal_id = FL_Goal_Counter}
			]
			[
				{text = "Revenge!!!" final goal_id = FL_Goal_Gaps3}
			]
		]
		[
			[
				{text = "Party boat Skate-Tricks" goal_id = FL_Goal_Tetris no_ped_cam = no_ped_cam targetOffset = (3950.10961914,89.72080231,4601.5703125) positionOffset = (4110.02392578,3.50602293,4738.77148438)}
				{text = "Wallplant Combo" goal_id = FL_Goal_Gaps no_ped_cam = no_ped_cam targetOffset = (5021.47509766,253.92591858,-1781.83105469) positionOffset = (5261.79980469,255.69186401,-1783.79492188)}
				{text = "Beat Andrew's best combos" goal_id = FL_Goal_Horse}
				{text = "Bowl Grind" goal_id = FL_Goal_Gaps4}
				{text = "Prove yourself" goal_id = FL_Goal_Counter3}
			]
			[
				{text = "Impress Tony Hawk" final goal_id = FL_Goal_Tetris2}
			]
		]
		[
			[
				{text = "Place in street contest" goal_id = FL_Goal_Comp}
				{text = "Place in vert contest" goal_id = FL_Goal_Comp2}
				{text = "Get onto the roof of SPoT" goal_id = FL_Goal_Trickspot}
			]
			[
				{text = "Win best trick contest" final goal_id = FL_Goal_Trickspot3}
			]
		]
		[
			[
				{text = "Join Birdhouse" sponsor = sponsor_birdhouse}
				{text = "Join Element" sponsor = sponsor_element}
				{text = "Join Flip" sponsor = sponsor_flip}
				{text = "Join Girl" sponsor = sponsor_girl}
				{text = "Join Zero" sponsor = sponsor_zero}
				{text = "View Sponsor Videos Again" replay_videos}
			]
		]
		[
			[
				{text = "Flip the Big Stairs" goal_id = SD_Goal_Gaps}
				{text = "Daredevil High Line" goal_id = SD_Goal_Collect}
				{text = "Air Out the Atrium" goal_id = SD_Goal_Gaps5}
				{text = "Rooftop Technician" goal_id = SD_Goal_Gaps9}
			]
			[
				{text = "See a Man About a Horse" final goal_id = SD_Goal_Tetris}
			]
		]
		[
			[
				{text = "Let's Get This Party Started" goal_id = SD_Goal_Gaps11}
				{text = "No Band...No Party. Bummer!" goal_id = SD_Goal_Collect2}
				{text = "No One Likes a Dude Festival" goal_id = SD_Goal_Race2}
				{text = "Acid Drop the Two Towers" goal_id = SD_Goal_Gaps10}
			]
			[
				{text = "All We Need Is a System and Some Rims" final goal_id = SD_Goal_Race}
			]
		]
		[
			[
				{text = "Get Your Gear Back From the Fuzz" goal_id = SD_Goal_Gaps12}
				{text = "Round Up the Posse For the Demo" goal_id = SD_Goal_Collect3}
				{text = "3 Is No Crowd. Find More Kids" goal_id = SD_Goal_HighCombo}
				{text = "The Kids Love Those Free Stickers!" goal_id = SD_Goal_Counter3}
			]
			[
				{text = "Tear It Up at the Demo" final goal_id = SD_Goal_Tetris2}
			]
		]
		[
			[
				{text = "Wedding Guest" goal_id = HI_Goal_Trickspot3}
				{text = "Get Lei'd" goal_id = HI_Goal_Collect}
				{text = "Pineapple Killer" goal_id = HI_Goal_Collect2}
				{text = "Speak Hawaiian" goal_id = HI_Goal_Collect3}
			]
			[
				{text = "Drain the pool" final goal_id = HI_Goal_Counter2}
			]
		]
		[
			[
				{text = "Impress the girls" goal_id = HI_Goal_Counter}
				{text = "Luau Competition" goal_id = HI_Goal_Comp}
				{text = "Wallows combo bowls" goal_id = HI_Goal_Trickspot2 no_ped_cam = no_ped_cam targetOffset = (-698.98760986,-96.81425476,-5766.19335938) positionOffset = (-828.28808594,5.86229277,-5488.19482422)}
				{text = "High Lines" goal_id = HI_Goal_Gaps2}
				{text = "Off The Walls" goal_id = HI_Goal_Gaps3}
				{text = "Kill Wallows" goal_id = HI_Goal_Kill}
				{text = "Island Liptrick Tour" goal_id = HI_Goal_Trickspot4}
			]
			[
				{text = "Climb the Hotel" final goal_id = HI_Goal_Trickspot no_ped_cam = no_ped_cam targetOffset = (-698.98760986,-96.81425476,-5766.19335938) positionOffset = (204.38563538,71.19428253,808.88519287)}
			]
		]
		[
			[
				{text = "Hotel Hopper" goal_id = HI_Goal_Gaps}
			]
			[
				{text = "Craziest Footage ever" final goal_id = HI_Goal_GenericScore no_ped_cam = no_ped_cam targetOffset = (0.0,0.0,0.0) positionOffset = (715.81268311,1578.23400879,1303.22717285)}
			]
		]
		[
			[
				{text = "Skate Tom's Part" goal_id = VC_Goal_trickspot}
				{text = "Filming a Line" goal_id = VC_Goal_Film}
				{text = "Bust some Flatland" goal_id = VC_Goal_tetris no_ped_cam = no_ped_cam targetOffset = (3544.23510742,-101.28214264,3230.42407227) positionOffset = (3376.24755859,-100.68465424,3225.953125)}
				{text = "Race the Blowcart" goal_id = VC_Goal_Race2}
				{text = "Party dregs" goal_id = VC_Goal_Collect2}
				{text = "Slam City Fan" goal_id = VC_Goal_Collect3 no_ped_cam = no_ped_cam targetOffset = (5236.55078125,269.43624878,-2739.85791016) positionOffset = (5380.48388672,318.54779053,-2272.2175293)}
				{text = "Ralphie got busted" goal_id = VC_Goal_Race no_ped_cam = no_ped_cam targetOffset = (3667.59887695,149.4859314,1785.01184082) positionOffset = (3669.56518555,147.34617615,1784.60351563)}
				{text = "Impress the reporter" goal_id = VC_Goal_HighScore}
				{text = "Return the Guest Passes" goal_id = VC_Goal_Collect}
			]
			[
				{text = "Pick up everyone in the limo" final goal_id = VC_Goal_Race4}
			]
		]
		[
			[
				{text = "Blimp" goal_id = SJ_Goal_Collect2}
				{text = "Learn the hip transfers" goal_id = SJ_Goal_TrickSpot}
				{text = "Destroy the Vert Contest" goal_id = SJ_Goal_Comp no_ped_cam = no_ped_cam targetOffset = (-2232.44873047,-234.96044922,-226.10220337) positionOffset = (-1799.2298584,-1249.16162109,-17.24891663)}
				{text = "Destroy the Street Contest" goal_id = SJ_Goal_Comp2}
			]
			[
				{text = "Best of Show" final goal_id = SJ_Goal_TrickSpot4}
			]
		]
		[
			[
				{text = "ADIO - Show off your skills" goal_id = VC_Goal_Gaps}
				{text = "Vans - whoop it up for the crowds" goal_id = VC_Goal_Counter5}
				{text = "Circa - Pass the test" goal_id = VC_Goal_Collect5}
				{text = "Es - Kill the score spots." goal_id = VC_Goal_Horse}
			]
			[
				{text = "Get the Moscow trip" final goal_id = VC_Goal_Collect4}
			]
		]
		[
			[
				{text = "Serve the people" goal_id = RU_Goal_Tetris2 no_ped_cam = no_ped_cam targetOffset = (3950.10961914,89.72080231,4601.5703125) positionOffset = (4110.02392578,170.50602722,4738.77148438)}
				{text = "Blind Big Brother" goal_id = RU_Goal_race2}
				{text = "Ready for Battle" goal_id = RU_Goal_trickspot no_ped_cam = no_ped_cam targetOffset = (3950.10961914,89.72080231,4601.5703125) positionOffset = (-1619.00769043,27.3973465,-413.56878662)}
			]
			[
				{text = "Over the Wall" final goal_id = RU_Goal_Gaps}
			]
		]
		[
			[
				{text = "Manuals for Muskovites" goal_id = RU_Goal_Tetris}
				{text = "Ratings stunts" goal_id = RU_Goal_Proscore}
				{text = "Circus Act" goal_id = RU_Goal_Gaps2}
				{text = "Gap hunting" goal_id = RU_Goal_Findgaps}
				{text = "Warm up" goal_id = RU_Goal_highscore}
			]
			[
				{text = "Double Dome" final goal_id = RU_goal_GenericScore2}
			]
		]
		[
			[
				{text = "Anonymous caller" goal_id = RU_Goal_race3 no_ped_cam = no_ped_cam targetOffset = (1099.66638184,-102.66417694,2106.47167969) positionOffset = (1304.3527832,-20.62909698,3007.78125)}
				{text = "Party Favors" goal_id = RU_Goal_Race6}
				{text = "Hangover Cure" goal_id = RU_Goal_Race5 no_ped_cam = no_ped_cam targetOffset = (0.0,0.0,0.0) positionOffset = (-1359.08557129,517.37927246,-3747.73901367)}
			]
			[
				{text = "Straight outta Moscow" final goal_id = RU_Goal_race4}
			]
		]
		[
			[
				{text = "Create - a - Trick" goal_id = nj_goal_CAT}
			]
			[
				{text = "Combo the Entire City" goal_id = nj_goal_Counter4}
			]
		]
		[
			[
				{text = "Do ALL of the Tricks" goal_id = nj_goal_tetris2}
				{text = "Score Big" goal_id = nj_goal_GenericScore4 no_ped_cam = no_ped_cam targetOffset = (0.0,0.0,0.0) positionOffset = (-3945.86669922,97.83377075,2937.32885742)}
			]
		]
		[
			[
				{text = "BOB BURNQUIST" pro = burnquist movie = MOVIE_UNLOCKED_BURNQUIST}
				{text = "TONY HAWK" pro = hawk movie = MOVIE_UNLOCKED_HAWK}
				{text = "ERIC KOSTON" pro = koston movie = MOVIE_UNLOCKED_KOSTON}
				{text = "BUCKY LASEK" pro = lasek movie = MOVIE_UNLOCKED_LASEK}
				{text = "BAM MARGERA" pro = margera movie = MOVIE_UNLOCKED_MARGERA}
				{text = "RODNEY MULLEN" pro = mullen movie = MOVIE_UNLOCKED_MULLEN}
				{text = "CHAD MUSKA" pro = muska movie = MOVIE_UNLOCKED_MUSKA}
				{text = "ANDREW REYNOLDS" pro = reynolds movie = MOVIE_UNLOCKED_REYNOLDS}
				{text = "PAUL RODRIGUEZ" pro = rodriguez movie = MOVIE_UNLOCKED_RODRIGUEZ}
				{text = "GEOFF ROWLEY" pro = rowley movie = MOVIE_UNLOCKED_ROWLEY}
				{text = "ARTO SAARI" pro = saari movie = MOVIE_UNLOCKED_SAARI}
				{text = "JAMIE THOMAS" pro = thomas movie = MOVIE_UNLOCKED_THOMAS}
				{text = "MIKE VALLELY" pro = vallely movie = MOVIE_UNLOCKED_VALLELEY}
			]
		]
		[
			[
				{text = "Jersey Spine Trickspot Challenge" goal_id = NJ_Goal_Tetris5 level = load_nj}
				{text = "Big Apple Spot Challenge" goal_id = NY_Goal_Collect3 level = load_ny}
				{text = "Florida THPS Challenge" goal_id = FL_Goal_Horse2 level = load_fl}
				{text = "San Diego Transfer Challenge" goal_id = SD_Goal_Gaps13 level = load_sd}
				{text = "Hawaii Huge Spine Challenge" goal_id = HI_Goal_Gaps5 level = load_hi}
				{text = "Vancouver Spine Transfer Challenge" goal_id = VC_Goal_Gaps8 level = load_vc}
				{text = "Slamma Jamma" goal_id = SJ_Goal_Collect level = load_sj}
				{text = "Moscow's Lost Tapes" goal_id = RU_goal_Collect2 level = load_ru}
			]
		]
		[
			[{text = "Tear Up Eric's Best Line" goal_id = nj_goal_Counter5}]
		]
	]
	script ShownChapterTitle
		SpawnScript ShownChapterTitle_Spawned
	endscript
	script ShownChapterTitle_Spawned
		kill_chapter_intro_title
		GoalManager_GetCurrentChapterAndStage
		ShowChapter = (<currentchapter> + 1)
		create_chapter_intro_title chapter = <ShowChapter>
		wait 2.0 seconds
		kill_chapter_intro_title
	endscript
	script NJ_StageSwitch_0_to_1_1
		printf "NJ_StageSwitch_0_to_1_1"
		if NOT IsAlive name = TRGP_killskater_gap
			create prefix = "TRGP_killskater_gap"
		endif
		NJ_VallelyChecker
		NJ_Race6_CreateFluff
		NJ_Goal_Gaps4_DogChecker
		goal_stage_script_done
	endscript
	script NJ_StageSwitch_1_1_to_1_2
		SpawnScript NJ_StageSwitch_1_1_to_1_2_Spawned params = <...>
		if NOT IsAlive name = TRGP_killskater_gap
			create prefix = "TRGP_killskater_gap"
		endif
		NJ_Race6_KillFluff
		goal_stage_script_done
	endscript
	script NJ_StageSwitch_1_1_to_1_2_Spawned
		printf "Chapter1 - Going from Stage1 to Stage2"
		kill prefix = "TRG_PS_G_Ped_"
		NJ_Goal_Gaps4_DogChecker
		if NOT IsAlive name = TRGP_killskater_gap
			create prefix = "TRGP_killskater_gap"
		endif
		NJ_StageSwitch_1_1_to_1_2_WeatherChange
		if GotParam just_won_goal
			NJ_Car_Drivable
			SetGlobalFlag flag = VIEWED_CUTSCENE_NJ_02
			SetGlobalFlag flag = VIEWED_CUTSCENE_NJ_02A
			kill prefix = "TRG_G_Counter2_Eric"
			create prefix = "TRG_G_Counter2_Eric"
			SpawnScript NJ_StageSwitch_1_1_to_1_2_Spawned_PedAI id = spawnedpedai
			goal_cam_anim_play goal_id = NJ_Goal_Null5
			PlaySkaterCamAnim use_last_camera
			goal_want_to_save
			WaitForEvent type = goal_wait_for_save
			killskatercamanim all
			killspawnedscript id = spawnedpedai
			kill prefix = "TRG_G_Counter2_Eric"
			PlayCutscene {
				name = "cutscenes\NJ_02.cut"
				unload_anims = 1
				reload_anims = 0
				unload_goals = 1
				reload_goals = 0
				RestartNode = TRG_G_PS_RestartNode
				exitScript = spawn_next_cutscene
				exitParams = {name = "cutscenes\nj_02a.cut" unload_anims = 0 reload_anims = 1 unload_goals = 0 reload_goals = 1 exitScript = unhide_everything RestartNode = TRG_G_PS_RestartNode exitParams = {<...>}}
			}
		else
			goal_stage_script_done
		endif
	endscript
	script NJ_StageSwitch_1_1_to_1_2_Spawned_PedAI
		TRG_G_Counter2_Eric::Ped_InitAI stand
	endscript
	script NJ_StageSwitch_1_1_to_1_2_WeatherChange
		DisableFog
	endscript
	script NJ_StageSwitch_1_2_to_2_1
		printf "Chapter1 - Going to Chapter2"
		if GotParam just_won_goal
			SetGlobalFlag flag = VIEWED_CUTSCENE_NJ_02B
			PlayCutscene name = "cutscenes\NJ_02b.cut" exitScript = NJ_StageSwitch_1_2_to_2_1_WeatherChange RestartNode = TRG_G_PS_RestartNode exitParams = {<...>}
		else
			SpawnScript NJ_StageSwitch_1_2_to_2_1_WeatherChange params = <...>
			goal_stage_script_done
		endif
		if NOT IsAlive name = TRGP_killskater_gap
			create prefix = "TRGP_killskater_gap"
		endif
		create prefix = "ProSet1_"
	endscript
	script NJ_StageSwitch_1_2_to_2_1_WeatherChange
		unhide_everything
		change_deck_to_muska
		script_change_tod tod_action = set_tod_nj_evening
		if GotParam just_won_goal
			SpawnScript NJ_Chapter2_Test
		endif
	endscript
	script NJ_Chapter2_Test
		PauseSkaters
		create name = TRG_G_Null_Pro
		goal_cam_anim_play goal_id = NJ_Goal_Null
		kill name = TRG_G_Null_Pro
		Skater::killskater RestartWalking node = TRG_G_Null_RestartNode
		UnPauseSkaters
		goal_want_to_save
		WaitForEvent type = goal_wait_for_save
		ShownChapterTitle
	endscript
	script change_deck_to_muska
		GetCurrentSkaterProfileIndex
		EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = deck_graphic desc_id = #"PR Deck 17"}
		FormatText checksumName = grip_id "Generic 2"
		EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = griptape desc_id = <grip_id>}
		SetPlayerAppearanceColor player = <currentSkaterProfileIndex> part = board h = 50 s = 0 v = 0 use_default_hsv = 1
		RefreshSkaterModel Skater = <currentSkaterProfileIndex> profile = <currentSkaterProfileIndex>
		RefreshSkaterColors Skater = <currentSkaterProfileIndex> profile = <currentSkaterProfileIndex>
	endscript
	script change_clothes male_part = skater_m_torso part_id = #"Birdhouse Team"
		GetCurrentSkaterProfileIndex
		GetSkaterProfileInfo player = <currentSkaterProfileIndex>
		if (<is_male> = 1)
			EditPlayerAppearance profile = <currentSkaterProfileIndex> target = SetPart targetParams = {part = <male_part> desc_id = <part_id>}
			EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = {part = front_logo}
			EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = {part = back_logo}
			GoalManager_GetCurrentChapterAndStage
			if (<currentchapter> = 19)
				EditPlayerAppearance profile = <currentSkaterProfileIndex> target = ClearPart targetParams = {part = skater_m_backpack}
			endif
			RefreshSkaterModel Skater = <currentSkaterProfileIndex> profile = <currentSkaterProfileIndex>
		endif
	endscript
	script NJ_StageSwitch_2_1_to_2_2
		printf "Chapter2 - Going from Stage1 to Stage2"
		kill prefix = "TRG_Ped_Walk"
		kill prefix = "TRG_Veh"
		kill prefix = "TRG_Chpt3_Veh_DrugDealer"
		kill prefix = "TRG_SFX_TrigBox_CarFire01"
		NJ_FlyChecker
		script_change_tod tod_action = set_tod_nj_night tod_action2 = set_tod_newrain
		create prefix = "TRG_Chpt3_Veh_DrugDealer"
		if NOT IsAlive name = TRGP_killskater_gap
			create prefix = "TRGP_killskater_gap"
		endif
		if GotParam just_won_goal
			SpawnScript NJ_StageSwitch_2_1_to_2_2_Spawned params = <...>
		else
			goal_stage_script_done
		endif
	endscript
	script NJ_StageSwitch_2_1_to_2_2_Spawned
		wait 1 frame
		Skater::killskater node = TRG_G_COLLECT_RestartNode
		GoalManager_ActivateGoal name = nj_goal_collect
	endscript
	script NJ_StageSwitch_2_2_to_3_1
		printf "Chapter2 - Going to Chapter3"
		TRG_G_Collect4_Pro::Obj_PlayAnim anim = Ped_M_Idle1
		if NOT IsAlive name = TRGP_killskater_gap
			create prefix = "TRGP_killskater_gap"
		endif
		NJ_FlyChecker
		SpawnScript NJ_StageSwitch_2_2_to_3_1_Spawned params = <...>
	endscript
	script NJ_StageSwitch_2_2_to_3_1_Spawned
		printf "===================================== NJ_StageSwitch_2_2_to_3_1_Spawned reached"
		kill prefix = "TRG_SFX_TrigBox_CarFire01"
		kill prefix = "TRG_Ped_Dealer"
		kill prefix = "TRG_Ped_Crackhead"
		if NOT IsAlive name = fireA01
			create prefix = "fireA"
		endif
		if NOT IsAlive name = TRG_Chpt3_Veh_DrugDealer
			create prefix = "TRG_Chpt3_Veh_DrugDealer"
		endif
		if GotParam just_won_goal
			create name = TRG_G_Null2_Pro
			Skater::killskater RestartWalking node = TRG_G_Null2_RestartNode
			TRG_G_Null2_Pro::SwitchOffAtomic ped_board
			kill prefix = "fireA"
			goal_cam_anim_play goal_id = NJ_Goal_Null2
			DisplayLoadingScreen Blank
			Skater::killskater RestartWalking node = TRG_G_Collect4_IntroNode
			kill name = TRG_G_Null2_Pro
		endif
		create prefix = "TRG_Ped_Crackhead"
		create prefix = "TRG_Ped_Dealer"
		script_change_tod tod_action = set_tod_nj_morning tod_action2 = set_tod_day
		kill prefix = "TRG_Ped_Walk"
		kill prefix = "TRG_Veh"
		if GotParam just_won_goal
			SetGlobalFlag flag = VIEWED_CUTSCENE_NJ_03
			PlayCutscene name = "cutscenes\NJ_03.cut" exitScript = NJ_StageSwitch_2_2_to_3_1_WeatherChange RestartNode = TRG_G_Collect4_IntroNode exitParams = {<...>}
		else
			goal_stage_script_done
			SpawnScript NJ_StageSwitch_2_2_to_3_1_WeatherChange params = <...>
		endif
		if NOT IsAlive name = TRGP_killskater_gap
			create prefix = "TRGP_killskater_gap"
		endif
	endscript
	script NJ_StageSwitch_2_2_to_3_1_WeatherChange
		if NOT IsAlive name = TRG_Ped_Walking05
			create prefix = "TRG_Ped_Walk"
		endif
		if NOT IsAlive name = TRG_Veh_Car_03
			create name = TRG_Veh_Car_03
		endif
		create prefix = "ProSet1_"
		EnableFog 4
		script_change_tod tod_action = set_tod_nj_morning
		if GotParam just_won_goal
			PlaySkaterCamAnim Skater = 0 {virtual_cam
				targetid = world
				targetOffset = (-5332.70019531,-1993.90002441,-8017.10009766)
				positionOffset = (-3759.89990234,134.69999695,1626.30004883)
				frames = 100
				skippable = 1
				play_hold
			}
			goal_want_to_save
			SpawnScript NJ_Chapter3_Test
		endif
	endscript
	script NJ_Chapter3_Test
		WaitForEvent type = goal_wait_for_save
		PlaySkaterCamAnim Skater = 0 stop
		ShownChapterTitle
	endscript
	script NJ_StageSwitch_3_1_to_3_2
		WeatherSetRainRate 0.0
		printf "Chapter3 - Going from Stage1 to Stage2"
		kill prefix = "Veh_PoliceCar_NJ_"
		kill prefix = "NJ_G_NOT_BridgeQP_"
		kill prefix = "fireA"
		kill prefix = "TRG_SFX_TrigBox_CarFire01"
		kill prefix = "TRG_Chpt3_Veh_DrugDealer"
		create prefix = "ProSet1_"
		create prefix = "fireA"
		create prefix = "TRG_SFX_TrigBox_CarFire01"
		create prefix = "TRG_Chpt3_Veh_DrugDealer"
		if IsAlive name = TRGP_killskater_gap
			kill prefix = "TRGP_killskater_gap"
		endif
		SpawnScript NJ_StageSwitch_3_1_to_3_2_Spawned params = <...>
	endscript
	script NJ_StageSwitch_3_1_to_3_2_Spawned
		start_dynamic_tod tod_start = set_tod_nj_morning tod_end = set_tod_day tod_speed = 0.06 dontchangelights = 1
		if GotParam just_won_goal
			create prefix = "TRG_G_Null4_Vehicle0"
			goal_cam_anim_play goal_id = NJ_Goal_Null4
			kill prefix = "TRG_G_Null4_Vehicle0"
			Skater::killskater node = TRG_StageSwitch_31to32_RestartNode
		else
			goal_stage_script_done
		endif
	endscript
	script NJ_StageSwitch_3_2_to_3_3
		printf "Chapter3 - Going from Stage2 to Stage3"
		EnableFog
		start_dynamic_tod tod_start = set_tod_day tod_end = set_tod_nj_evening tod_speed = 0.06 dontchangelights = 1
		SetFogColor r = 118 b = 68 g = 108 a = 100
		SetFogDistance distance = 600
		create prefix = "ProSet1_"
		kill prefix = "Veh_PoliceCar_NJ_"
		kill prefix = "NJ_G_NOT_BridgeQP_"
		kill prefix = "fireA"
		kill prefix = "TRG_SFX_TrigBox_CarFire01"
		kill prefix = "TRG_Chpt3_Veh_DrugDealer"
		create prefix = "fireA"
		create prefix = "TRG_SFX_TrigBox_CarFire01"
		create prefix = "TRG_Chpt3_Veh_DrugDealer"
		NJ_UnlockTrainStation
		if IsAlive name = TRGP_killskater_gap
			kill prefix = "TRGP_killskater_gap"
		endif
		goal_stage_script_done
	endscript
	script NJ_StageSwitch_3_3_to_3_4
		printf "Chapter3 - Going from Stage3 to Stage4"
		EnableFog
		script_change_tod tod_action = set_tod_nj_fog
		SetFogColor r = 118 b = 68 g = 108 a = 100
		SetFogDistance distance = 600
		create prefix = "ProSet1_"
		kill prefix = "Veh_PoliceCar_NJ_"
		kill prefix = "NJ_G_NOT_BridgeQP_"
		kill prefix = "fireA"
		kill prefix = "TRG_SFX_TrigBox_CarFire01"
		kill prefix = "TRG_Chpt3_Veh_DrugDealer"
		NJ_UnlockTrainStation
		if GotParam just_won_goal
			SpawnScript NJ_StageSwitch_3_3_to_3_4_Spawned params = <...>
		else
			goal_stage_script_done
		endif
		if IsAlive name = TRGP_killskater_gap
			kill prefix = "TRGP_killskater_gap"
		endif
	endscript
	script NJ_StageSwitch_3_3_to_3_4_Spawned
		wait 1 frame
		GoalManager_ActivateGoal name = nj_goal_race
	endscript
	script NJ_Load_Skateshop
		printf "loading skateshop"
		change entered_skateshop_through_door = 1
		change_level level = load_boardshop
	endscript
	script NJ_StageSwitch_GoingToNY
		printf "Going to New York"
		SetGlobalFlag flag = LEVEL_UNLOCKED_NY
		if GotParam just_won_goal
			NJ_Goal_Race7_Outro
			goal_cam_anim_play goal_id = NJ_Goal_Null3
			SetGlobalFlag flag = VIEWED_CUTSCENE_NJ_04
			DisableFog
			PlayCutscene name = "cutscenes\NJ_04.cut" dont_unpause_rain_sounds exitScript = NJ_StageSwitch_GoingToNY_LevelChange exitParams = {<...>}
		else
			SpawnScript NJ_StageSwitch_GoingToNY_LevelChange params = <...>
		endif
	endscript
	script NJ_StageSwitch_GoingToNY_LevelChange
		if GotParam just_won_goal
			change_level level = load_ny next_level_script = NY_Intro_play_cutscene
		endif
	endscript
	script NY_Intro_play_cutscene
		SetGlobalFlag flag = VIEWED_CUTSCENE_NY_01V
		PlayCutscene name = "cutscenes\NY_01v.cut" exitScript = NY_IntroSave
	endscript
	script NY_IntroSave
		goal_want_to_save
		SpawnScript NY_IntroSave_Spawned params = <...>
	endscript
	script NY_IntroSave_Spawned
		WaitForEvent type = goal_wait_for_save
		ShownChapterTitle
	endscript
	script NY_StageSwitch_1_1_to_2_1
		if GotParam just_won_goal
		endif
		SpawnScript NY_StageSwitch_1_1_to_2_1_Spawned params = <...>
	endscript
	script NY_StageSwitch_1_1_to_2_1_Spawned
		printf "Chapter Stage Switching Script - running NY_StageSwitch_1_1_to_2_1"
		if GotParam just_won_goal
			NY_Null2_PreScript
			start_dynamic_tod tod_start = set_tod_day tod_end = set_tod_night dontchangelights = 1
			goal_cam_anim_play goal_id = NY_Goal_Null2
			PlaySkaterCamAnim use_last_camera
			goal_want_to_save
			WaitForEvent type = goal_wait_for_save
			killskatercamanim all
			DisplayLoadingScreen Blank
			kill name = TRG_G_Null_Eric
			Skater::hide
		endif
		script_change_tod tod_action = set_tod_night stop_tod = 1
		if GotParam just_won_goal
			SetGlobalFlag flag = VIEWED_CUTSCENE_NY_02
			PlayCutscene name = "cutscenes\NY_02.cut" exitScript = NY_StageSwitch_1_1_to_2_1_Spawned_Spawned RestartNode = TRG_G_HS_Pro
		else
			goal_stage_script_done
		endif
	endscript
	script NY_StageSwitch_1_1_to_2_1_Spawned_Spawned
		DisplayLoadingScreen Blank
		script_change_tod tod_action = set_tod_newrain
		kill_start_key_binding
		wait 0.1 seconds
		Skater::unhide
		HideLoadingScreen
		restore_start_key_binding
		ShownChapterTitle
	endscript
	script NY_StageSwitch_2_1_to_2_2
		printf "Chapter Stage Switching Script - running NY_StageSwitch_2_1_to_2_2"
		script_change_tod tod_action = set_tod_rainoff
		SpawnScript NY_StageSwitch_2_1_to_2_2_Spawned params = <...>
	endscript
	script NY_StageSwitch_2_1_to_2_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = NY_Goal_Race3
		else
			goal_stage_script_done
		endif
	endscript
	script NY_StageSwitch_2_2_to_2_3
		printf "Chapter Stage Switching Script - running NY_StageSwitch_2_2_to_2_3"
		goal_stage_script_done
	endscript
	script NY_StageSwitch_2_3_to_3_1
		printf "Chapter Stage Switching Script - running NY_StageSwitch_2_3_to_3_1"
		if GotParam just_won_goal
			DisplayLoadingScreen Blank
			change Display_Story_Peralta_LoadingScreen = 1
			change_level level = load_boardshop next_level_script = NY03_CutscenePlay
		else
			goal_stage_script_done
		endif
	endscript
	script NY03_CutscenePlay
		change_clothes male_part = skater_m_torso part_id = #"Peralta Team"
		PlayCutscene name = "cutscenes\NY_03.cut" exitScript = NY03_SkateshopUnlocked
	endscript
	script NY03_SkateshopUnlocked
		array = return_to_level
		SetArrayElement arrayname = array index = 0 newvalue = load_ny
		change in_ny03_sequence = 1
		SetGlobalFlag flag = BOARDSHOP_UNLOCKED
		create_dialog_box {title = "Skateshop Unlocked"
			text = "Free gear from Peralta is now available in the Skateshop. You can now return to the Skateshop from the Edit Skater menu."
			just = [center center]
			buttons = [{font = small text = "Ok" pad_choose_script = NY03_EnterBoardshop}
			]
			text_dims = (300.0,0.0)
		}
	endscript
	script NY03_EnterBoardshop
		dialog_box_exit
		boardshop_create_main_menu
	endscript
	in_ny03_sequence = 0
	script NY03_back_from_boardshop
		change in_ny03_sequence = 0
		change check_for_unplugged_controllers = 1
		goal_want_to_save
		SpawnScript NY03_Save_Spawned params = <...>
	endscript
	script NY03_Save_Spawned
		WaitForEvent type = goal_wait_for_save
		ShownChapterTitle
	endscript
	script NY_StageSwitch_GoingToFL
		printf "Chapter Stage Switching Script - running NY_StageSwitch_GoingToFL"
		SetGlobalFlag flag = LEVEL_UNLOCKED_FL
		SpawnScript NY_StageSwitch_GoingToFL_Spawned params = <...>
	endscript
	script NY_StageSwitch_GoingToFL_Spawned
		if GotParam just_won_goal
			NY_Null_PreScript
			create name = TRG_G_Null_Eric
			goal_cam_anim_play goal_id = NY_Goal_Null
			DisplayLoadingScreen Blank
			kill name = TRG_G_Null_Eric
			Ny_StageSwitch_GoingToFL_LevelChange
		else
			goal_stage_script_done
		endif
	endscript
	script Ny_StageSwitch_GoingToFL_LevelChange
		change_level level = load_fl next_level_script = FL_IntroCutscene
	endscript
	script FL_IntroCutscene
		SetGlobalFlag flag = VIEWED_CUTSCENE_FL_01
		PlayCutscene name = "cutscenes\FL_01.cut" exitScript = FL_IntroCutsceneSave
	endscript
	script FL_IntroCutsceneSave
		goal_want_to_save
		SpawnScript FL_IntroSave_Spawned params = <...>
	endscript
	script FL_IntroSave_Spawned
		WaitForEvent type = goal_wait_for_save
		ShownChapterTitle
	endscript
	script FL_StageSwitch_1_1_to_1_2
		printf "Chapter Stage Switching Script - running FL_StageSwitch_1_1_to_1_2"
		SpawnScript FL_StageSwitch_1_1_to_1_2_Spawned params = <...>
	endscript
	script FL_StageSwitch_1_1_to_1_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = FL_Goal_Gaps3
		else
			goal_stage_script_done
		endif
	endscript
	script FL_StageSwitch_1_2_to_2_1
		printf "Chapter Stage Switching Script - running FL_StageSwitch_1_2_to_2_1"
		if GotParam just_won_goal
			FL_GOAL_RACE_Outro
			goal_cam_anim_play goal_id = FL_Goal_Null
			PlaySkaterCamAnim use_last_camera
			goal_want_to_save
			SpawnScript FL_StageSwitch_1_2_to_2_1Save_Spawned params = <...>
		else
			instant_tod_change current_tod = day stop_tod = 1
			if NOT IsAlive name = FL_Spot_Fence_Entrance_door_Closed
				create name = FL_Spot_Fence_Entrance_door_Closed
			endif
			kill name = FL_Spot_Fence_Entrance_door_Open
			goal_stage_script_done
		endif
	endscript
	script FL_StageSwitch_1_2_to_2_1Save_Spawned
		WaitForEvent type = goal_wait_for_save
		killskatercamanim all
		DisplayLoadingScreen Blank
		kill name = FL_Spot_Fence_Entrance_door_Closed
		create name = FL_Spot_Fence_Entrance_door_Open
		instant_tod_change current_tod = day stop_tod = 1
		SetGlobalFlag flag = VIEWED_CUTSCENE_FL_02
		PlayCutscene name = "cutscenes\FL_02.cut" exitScript = FL_StageSwitch_1_2_to_2_1exitScript RestartNode = TRG_G_TS_RestartNode
	endscript
	script FL_StageSwitch_1_2_to_2_1exitScript
		ShownChapterTitle
		if NOT IsAlive name = FL_Spot_Fence_Entrance_door_Closed
			create name = FL_Spot_Fence_Entrance_door_Closed
		endif
		kill name = FL_Spot_Fence_Entrance_door_Open
	endscript
	script FL_StageSwitch_2_1_to_2_2
		printf "Chapter Stage Switching Script - running FL_StageSwitch_2_1_to_2_2"
		SpawnScript FL_StageSwitch_2_1_to_2_2_Spawned params = <...>
	endscript
	script FL_StageSwitch_2_1_to_2_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = FL_Goal_Tetris2
		else
			goal_stage_script_done
		endif
	endscript
	script FL_StageSwitch_2_2_to_3_1
		printf "Chapter Stage Switching Script - running FL_StageSwitch_2_2_to_3_1"
		if GotParam just_won_goal
			goal_want_to_save
			SpawnScript FL_StageSwitch_2_2_to_3_1Save_Spawned params = <...>
		else
			goal_stage_script_done
		endif
	endscript
	script FL_StageSwitch_2_2_to_3_1Save_Spawned
		WaitForEvent type = goal_wait_for_save
		instant_tod_change current_tod = day stop_tod = 1
		SetGlobalFlag flag = VIEWED_CUTSCENE_FL_03
		PlayCutscene name = "cutscenes\FL_03.cut" exitScript = FL_StageSwitch_2_2_to_3_1exitScript RestartNode = TRG_Restart_Inside_SPoT
	endscript
	script FL_StageSwitch_2_2_to_3_1exitScript
		ShownChapterTitle
		kill name = FL_Spot_Fence_Entrance_door_Closed
		kill name = FL_Spot_Fence_Entrance_SIgn01
		kill name = FL_Spot_Fence_Entrance01
		kill name = FL_Spot_Fence_Entrance02
		kill name = FL_Skylight
		if NOT IsAlive name = FL_Skylight_Breakable
			create name = FL_Skylight_Breakable
		endif
	endscript
	script FL_StageSwitch_3_1_to_3_2
		printf "Chapter Stage Switching Script - running FL_StageSwitch_3_1_to_3_2"
		SpawnScript FL_StageSwitch_3_1_to_3_2_Spawned params = <...>
	endscript
	script FL_StageSwitch_3_1_to_3_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = FL_Goal_Trickspot3
		else
			goal_stage_script_done
		endif
	endscript
	script FL_StageSwitch_GoingToSponsor
		printf "Chapter Stage Switching Script - running FL_StageSwitch_GoingToSponsor"
		if GotParam just_won_goal
			DisplayLoadingScreen Blank
			SetGlobalFlag flag = VIEWED_CUTSCENE_FL_04
			PlayCutscene name = "cutscenes\FL_04.cut" exitScript = Sponsor_Challenge_Pre_Movie_Info exitParams = {<...>}
		else
			SpawnScript Sponsor_Challenge_Chapter_Menu params = <...>
		endif
	endscript
	script Sponsor_Challenge_Pre_Movie_Info
		pausegame
		create_dialog_box {title = "Congrats: You're an Am!"
			text = "All the major deck companies are after you. Time to check out some videos to see which sponsor best fits your style. The choice is yours!"
			just = [center center]
			buttons = [{font = small text = "Ok" pad_choose_script = Sponsor_Challenge_Chapter_Menu}
			]
			text_dims = (340.0,0.0)
		}
	endscript
	script Sponsor_Challenge_Chapter_Menu
		if NOT (DEMO_BUILD)
			SpawnScript Sponsor_Challenge_Chapter_Menu2 params = <...>
		else
			goal_stage_script_done
			SpawnScript FL_DEMO_BUILD_END params = <...>
		endif
	endscript
	script FL_DEMO_BUILD_END
		while
			create_panel_message id = goal_complete_line2 text = "DEMO BUILD" style = panel_message_goalcompleteline2
			wait 3 seconds
		repeat 5
	endscript
	script Sponsor_Challenge_Chapter_Menu2
		wait 1 frame
		SetGlobalFlag flag = LEVEL_UNLOCKED_SD
		Skater::StatsManager_UnlockAmGoals
		select_sponsor_play_movies select_sponsor
	endscript
	script boardshop_do_nothing_script
	endscript
	script SD_IntroCutscene
		printf "SD_IntroCutscene"
		SetGlobalFlag flag = VIEWED_CUTSCENE_SD_01
		PlayCutscene name = "cutscenes\SD_01.cut" exitScript = SD_intro_save
	endscript
	script SD_intro_save
		goal_want_to_save
		SpawnScript SD_IntroSave_Spawned params = <...>
	endscript
	script SD_IntroSave_Spawned
		WaitForEvent type = goal_wait_for_save
		ShownChapterTitle
		kill prefix = "TRG_TeamMember_Ped"
		create prefix = "TRG_TeamMember_Ped"
	endscript
	script SD_StageSwitch_1_1_to_1_2
		printf "Chapter Stage Switching Script - running SD_StageSwitch_1_1_to_1_2"
		kill prefix = "TRG_TeamMember_Ped"
		create prefix = "TRG_TeamMember_Ped"
		SpawnScript SD_StageSwitch_1_1_to_1_2_Spawned params = <...>
	endscript
	script SD_StageSwitch_1_1_to_1_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = SD_Goal_Tetris
		else
			goal_stage_script_done
		endif
	endscript
	script SD_StageSwitch_1_2_to_2_1
		printf "Chapter Stage Switching Script - running SD_StageSwitch_1_2_to_2_1"
		if GotParam just_won_goal
			goal_want_to_save
		endif
		SpawnScript SD_StageSwitch_1_2_to_2_1Save_Spawned params = <...>
	endscript
	script SD_StageSwitch_1_2_to_2_1Save_Spawned
		if GotParam just_won_goal
			WaitForEvent type = goal_wait_for_save
		endif
		if GotParam just_won_goal
			SetGlobalFlag flag = VIEWED_CUTSCENE_SD_02
			PlayCutscene name = "cutscenes\SD_02.cut" exitScript = SD_StageSwitch_1_2_to_2_1Save_Spawned_Spawned RestartNode = TRG_G_Race_IntroNode
		else
			goal_stage_script_done
			SD_StageSwitch_1_2_to_2_1Save_Spawned_Spawned
		endif
	endscript
	script SD_StageSwitch_1_2_to_2_1Save_Spawned_Spawned
		ShownChapterTitle
		kill prefix = "TRG_TeamMember_Ped"
		kill prefix = "TRG_Ped_Party"
		create prefix = "TRG_Ped_Party"
	endscript
	script SD_StageSwitch_2_1_to_2_2
		printf "Chapter Stage Switching Script - running SD_StageSwitch_2_1_to_2_2"
		kill prefix = "TRG_Ped_Party"
		create prefix = "TRG_Ped_Party"
		SpawnScript SD_StageSwitch_2_1_to_2_2_Spawned params = <...>
	endscript
	script SD_StageSwitch_2_1_to_2_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = SD_Goal_Race
		else
			goal_stage_script_done
		endif
	endscript
	script SD_StageSwitch_2_2_to_3_1
		printf "Chapter Stage Switching Script - running SD_StageSwitch_2_2_to_3_1"
		if GotParam just_won_goal
			SD_Null2_PreScript
			goal_cam_anim_play goal_id = SD_Goal_Null2
			PlaySkaterCamAnim use_last_camera
			goal_want_to_save
		endif
		kill prefix = "TRG_Ped_Party"
		kill prefix = "TRG_Demo"
		kill prefix = "TRG_No_Demo"
		create prefix = "TRG_Demo_ledge"
		create prefix = "TRG_Demo_Rail"
		create prefix = "Geo_Demo"
		SpawnScript SD_StageSwitch_2_2_to_3_1Save_Spawned params = <...>
	endscript
	script SD_StageSwitch_2_2_to_3_1Save_Spawned
		if GotParam just_won_goal
			WaitForEvent type = goal_wait_for_save
			DisplayLoadingScreen Blank
			killskatercamanim all
		endif
		if GotParam just_won_goal
			instant_tod_change current_tod = day stop_tod = 1
			SetGlobalFlag flag = VIEWED_CUTSCENE_SD_03
			PlayCutscene name = "cutscenes\SD_03.cut" exitScript = ShownChapterTitle RestartNode = TRG_G_Race_IntroNode
		else
			goal_stage_script_done
		endif
	endscript
	script SD_StageSwitch_3_1_to_3_2
		printf "Chapter Stage Switching Script - running SD_StageSwitch_3_1_to_3_2"
		create prefix = "Geo_Demo"
		kill prefix = "TRG_Demo"
		kill prefix = "TRG_No_Demo"
		create prefix = "TRG_Demo_ledge"
		create prefix = "TRG_Demo_Rail"
		create prefix = "TRG_Demo_Ped"
		SpawnScript SD_StageSwitch_3_1_to_3_2_Spawned params = <...>
	endscript
	script SD_StageSwitch_3_1_to_3_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			goal_cam_anim_play goal_id = SD_Goal_Null3
			GoalManager_ActivateGoal name = SD_Goal_Tetris2
		else
			goal_stage_script_done
		endif
	endscript
	script SD_StageSwitch_GoingToHI
		printf "Chapter Stage Switching Script - running SD_StageSwitch_GoingToHI"
		SetGlobalFlag flag = LEVEL_UNLOCKED_HI
		kill prefix = "TRG_Demo"
		SpawnScript SD_StageSwitch_GoingToHI_Spawned params = <...>
	endscript
	script SD_StageSwitch_GoingToHI_Spawned
		if GotParam just_won_goal
			SD_Null_PreScript
			goal_cam_anim_play goal_id = SD_Goal_Null
			SetGlobalFlag flag = VIEWED_CUTSCENE_HI_01
			PlayCutscene name = "cutscenes\HI_01.cut" exitScript = SD_StageSwitch_GoingToHI_LevelChange
		else
			goal_stage_script_done
		endif
	endscript
	script SD_StageSwitch_GoingToHI_LevelChange
		change_level level = load_hi next_level_script = HI_IntroCutscene
	endscript
	script HI_IntroCutscene
		SetGlobalFlag flag = VIEWED_CUTSCENE_HI_02V
		DisplayLoadingScreen Blank
		PlayCutscene name = "cutscenes\HI_02v.cut" exitScript = HI_intro_save_game
	endscript
	script HI_intro_save_game
		goal_want_to_save
		SpawnScript HI_intro_save_game2 params = <...>
	endscript
	script HI_intro_save_game2
		WaitForEvent type = goal_wait_for_save
		ShownChapterTitle
	endscript
	script HI_StageSwitch_1_1_to_1_2
		printf "Chapter Stage Switching Script - running HI_StageSwitch_1_1_to_1_2"
		SpawnScript HI_StageSwitch_1_1_to_1_2_Spawned params = <...>
	endscript
	script HI_StageSwitch_1_1_to_1_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = HI_Goal_Counter2
		else
			goal_stage_script_done
		endif
	endscript
	script HI_StageSwitch_1_2_to_2_1
		printf "Chapter Stage Switching Script - running HI_StageSwitch_1_2_to_2_1"
		SpawnScript HI_StageSwitch_1_2_to_2_1_Spawn params = <...>
	endscript
	script HI_StageSwitch_1_2_to_2_1_Spawn
		if GotParam just_won_goal
			Skater::hide
			goal_cam_anim_play goal_id = HI_Goal_Null
			PlaySkaterCamAnim use_last_camera
			Skater::unhide
			goal_want_to_save
		endif
		SpawnScript HI_StageSwitch_1_2_to_2_1Save_Spawned params = <...>
	endscript
	script HI_StageSwitch_1_2_to_2_1Save_Spawned
		if GotParam just_won_goal
			WaitForEvent type = goal_wait_for_save
			killskatercamanim all
		endif
		if GotParam just_won_goal
			SetGlobalFlag flag = VIEWED_CUTSCENE_HI_03
			PlayCutscene name = "cutscenes\HI_03.cut" exitScript = ShownChapterTitle RestartNode = TRG_Restart_Boardwalk
		else
			goal_stage_script_done
		endif
	endscript
	script HI_StageSwitch_2_1_to_2_2
		printf "Chapter Stage Switching Script - running HI_StageSwitch_2_1_to_2_2"
		SpawnScript HI_StageSwitch_2_1_to_2_2_Spawned params = <...>
	endscript
	script HI_StageSwitch_2_1_to_2_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = HI_Goal_Trickspot
		else
			goal_stage_script_done
		endif
	endscript
	script HI_StageSwitch_2_2_to_3_1
		printf "Chapter Stage Switching Script - running HI_StageSwitch_2_2_to_3_1"
		if GotParam just_won_goal
			PlaySkaterCamAnim use_last_camera
			goal_want_to_save
		endif
		SpawnScript HI_StageSwitch_2_2_to_3_1Save_Spawned params = <...>
	endscript
	script HI_StageSwitch_2_2_to_3_1Save_Spawned
		if GotParam just_won_goal
			WaitForEvent type = goal_wait_for_save
			killskatercamanim all
		endif
		if GotParam just_won_goal
			SetGlobalFlag flag = VIEWED_CUTSCENE_HI_04
			PlayCutscene name = "cutscenes\HI_04.cut" exitScript = ShownChapterTitle RestartNode = TRG_G_GS_RestartNode
		else
			goal_stage_script_done
		endif
	endscript
	script HI_StageSwitch_3_1_to_3_2
		printf "Chapter Stage Switching Script - running HI_StageSwitch_3_1_to_3_2"
		SpawnScript HI_StageSwitch_3_1_to_3_2_Spawned params = <...>
	endscript
	script HI_StageSwitch_3_1_to_3_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = HI_Goal_GenericScore
		else
			goal_stage_script_done
		endif
	endscript
	script HI_StageSwitch_GoingToVC
		printf "Chapter Stage Switching Script - running HI_StageSwitch_GoingToVC"
		SetGlobalFlag flag = LEVEL_UNLOCKED_VC
		instant_tod_change current_tod = day stop_tod = 1
		if GotParam just_won_goal
			SetGlobalFlag flag = VIEWED_CUTSCENE_HI_05
			PlayCutscene name = "cutscenes\HI_05.cut" exitScript = HI_StageSwitch_GoingToVC_LevelChange
		else
			goal_stage_script_done
		endif
	endscript
	script HI_StageSwitch_GoingToVC_LevelChange
		change_level level = load_vc next_level_script = VC_IntroCutscene
	endscript
	script VC_IntroCutscene
		SetGlobalFlag flag = VIEWED_CUTSCENE_VC_01V
		PlayCutscene name = "cutscenes\VC_01V.cut" exitScript = VC_IntroCutsceneSave
	endscript
	script VC_IntroCutsceneSave
		goal_want_to_save
		SpawnScript VC_IntroCutsceneSave_Spawned
	endscript
	script VC_IntroCutsceneSave_Spawned
		WaitForEvent type = goal_wait_for_save
		ShownChapterTitle
	endscript
	script VC_StageSwitch_1_1_to_1_2
		printf "Chapter Stage Switching Script - running VC_StageSwitch_1_1_to_1_2"
		SpawnScript VC_StageSwitch_1_1_to_1_2_Spawned params = <...>
	endscript
	script VC_StageSwitch_1_1_to_1_2_Spawned
		script_change_tod tod_action = set_tod_night
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = VC_Goal_Race4
		else
			goal_stage_script_done
		endif
	endscript
	script VC_StageSwitch_GoingToSJ
		printf "Chapter Stage Switching Script - running VC_StageSwitch_GoingToSJ"
		SetGlobalFlag flag = LEVEL_UNLOCKED_SP
		if GotParam just_won_goal
			DisplayLoadingScreen Blank
			change Display_Story_Premiere_LoadingScreen = 1
			change_level level = load_sj next_level_script = VC_StageSwitch_GoingToSJ_play_firstcutscene
		else
			goal_stage_script_done
		endif
	endscript
	script VC_StageSwitch_GoingToSJ_play_firstcutscene
		script_change_tod tod_action = set_tod_night tod_action2 = set_tod_rainoff
		PlayCutscene {
			name = "cutscenes\SJ_01A.cut"
			unload_anims = 1
			reload_anims = 0
			unload_goals = 1
			reload_goals = 0
			exitScript = spawn_next_cutscene
			exitParams = {name = "cutscenes\sj_01b.cut" unload_anims = 0 reload_anims = 1 unload_goals = 0 reload_goals = 1 exitScript = VC_StageSwitch_GoingToSJ_save exitParams = {<...>}}
		}
	endscript
	script VC_StageSwitch_GoingToSJ_save
		script_change_tod tod_action = set_tod_day tod_action2 = set_tod_rainoff
		SetGlobalFlag flag = VIEWED_CUTSCENE_SJ_01
		goal_want_to_save
		SpawnScript VC_GoingToSJSave_Spawned params = <...>
	endscript
	script VC_GoingToSJSave_Spawned
		WaitForEvent type = goal_wait_for_save
		ShownChapterTitle
	endscript
	script SJ_StageSwitch_1_1_to_1_2
		printf "Chapter Stage Switching Script - running SJ_StageSwitch_1_1_to_1_2"
		if GotParam just_won_goal
			SpawnScript SJ_StageSwitch_1_1_to_1_2_Spawned
		else
			goal_stage_script_done
		endif
	endscript
	script SJ_StageSwitch_1_1_to_1_2_Spawned
		wait 1 frame
		GoalManager_ActivateGoal name = SJ_Goal_TrickSpot4
	endscript
	script SJ_StageSwitch_GoingToVC
		printf "Chapter Stage Switching Script - running SJ_StageSwitch_GoingToVC"
		if GotParam just_won_goal
			SetGlobalFlag flag = VIEWED_CUTSCENE_SJ_02
			PlayCutscene name = "cutscenes\SJ_02.cut" exitScript = SJ_StageSwitch_GoingToVC_LevelChange
		else
			goal_stage_script_done
		endif
	endscript
	script SJ_StageSwitch_GoingToVC_LevelChange
		SetGlobalFlag flag = CAS_PARTS_UNLOCKED_2
		Skater::StatsManager_UnlockProGoals
		change in_cad_cutscene_sequence = 1
		SetGlobalFlag flag = CAD_UNLOCKED
		change_level_to_cad
	endscript
	script cad_exit_to_vc
		change in_cad_cutscene_sequence = 0
		if ScreenElementExists id = current_menu_anchor
			DestroyScreenElement id = current_menu_anchor
		endif
		load_cas_textures_to_main_memory unload
		GoalManager_SetCurrentChapterAndStage chapter = 18 stage = 0
		change_level level = load_vc next_level_script = VC_IntroCutscene1_9
	endscript
	script VC_IntroCutscene1_9
		VC_IntroCutscene2 just_came_from_cad
	endscript
	script VC_IntroCutscene2
		printf "VC_IntroCutscene2"
		if GotParam just_came_from_cad
			script_change_tod tod_action = set_tod_vc_evening
			change in_deck_design = 0
			SpawnScript VC_IntroCutscene2Save_Spawned params = <...>
		endif
	endscript
	script VC_IntroCutscene2Save_Spawned
		printf "VC_IntroCutscene2Save_Spawned"
		VC_Goal_Null_CreatePed
		goal_cam_anim_play goal_id = VC_Goal_Null
		PlaySkaterCamAnim use_last_camera
		VC_Goal_Null_KillPed
		goal_want_to_save
		WaitForEvent type = goal_wait_for_save
		killskatercamanim all
		instant_tod_change tod_action = set_tod_newrain
		ShownChapterTitle
	endscript
	script VC_Goal_Null_CreatePed
		create name = TRG_G_Null_Ped
		Skater::killskater RestartWalking node = TRG_G_Null_IntroNode
	endscript
	script VC_Goal_Null_KillPed
		kill name = TRG_G_Null_Ped
	endscript
	script VC_StageSwitch_2_1_to_2_2
		printf "Chapter Stage Switching Script - running VC_StageSwitch_2_1_to_2_2"
		if GotParam just_won_goal
			SpawnScript VC_StageSwitch_2_1_to_2_2_Spawned params = <...>
		else
			goal_stage_script_done
		endif
	endscript
	script VC_StageSwitch_2_1_to_2_2_Spawned
		wait 1 frame
		instant_tod_change current_tod = evening stop_tod = 1
		GoalManager_ActivateGoal name = VC_Goal_Collect4
	endscript
	script VC_StageSwitch_GoingToRU
		printf "Chapter Stage Switching Script - running VC_StageSwitch_GoingToRU"
		SetGlobalFlag flag = LEVEL_UNLOCKED_RU
		if GotParam just_won_goal
			PauseSkaters
			DisplayLoadingScreen Blank
			change_level level = load_ru next_level_script = RU_play_intro_cutscene
		else
			goal_stage_script_done
		endif
	endscript
	script VC_StageSwitch_GoingToRU2
	endscript
	script RU_play_intro_cutscene
		SetGlobalFlag flag = VIEWED_CUTSCENE_RU_01V
		script_change_tod tod_action = set_tod_ru_day
		PlayCutscene name = "cutscenes\RU_01v.cut" exitScript = VC_StageSwitch_GoingToRU_LevelChangeSave_Spawned
	endscript
	script VC_StageSwitch_GoingToRU_LevelChangeSave_Spawned
		change_clothes male_part = skater_m_torso part_id = #"Russian Coat"
		goal_want_to_save
		SpawnScript RU_waitforsave
	endscript
	script RU_waitforsave
		WaitForEvent type = goal_wait_for_save
		ShownChapterTitle
	endscript
	script RU_StageSwitch_1_1_to_1_2
		printf "Chapter Stage Switching Script - running RU_StageSwitch_1_1_to_1_2"
		SpawnScript RU_StageSwitch_1_1_to_1_2_Spawned params = <...>
	endscript
	script RU_StageSwitch_1_1_to_1_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = RU_Goal_Gaps
		else
			goal_stage_script_done
		endif
	endscript
	script RU_StageSwitch_1_2_to_2_1
		printf "Chapter Stage Switching Script - running RU_StageSwitch_1_2_to_2_1"
		if GotParam just_won_goal
			goal_want_to_save
		endif
		SpawnScript RU_StageSwitch_1_2_to_2_1Save_Spawned params = <...>
	endscript
	script RU_StageSwitch_1_2_to_2_1Save_Spawned
		if GotParam just_won_goal
			WaitForEvent type = goal_wait_for_save
			DisplayLoadingScreen Blank
		endif
		script_change_tod tod_action = set_tod_ru_day_snow
		if GotParam just_won_goal
			SetGlobalFlag flag = VIEWED_CUTSCENE_RU_02
			PlayCutscene name = "cutscenes\RU_02.cut" exitScript = ShownChapterTitle
		else
			goal_stage_script_done
		endif
	endscript
	script RU_StageSwitch_2_1_to_2_2
		printf "Chapter Stage Switching Script - running RU_StageSwitch_2_1_to_2_2"
		SpawnScript RU_StageSwitch_2_1_to_2_2_Spawned params = <...>
	endscript
	script RU_StageSwitch_2_1_to_2_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = RU_goal_GenericScore2
		else
			goal_stage_script_done
		endif
	endscript
	script RU_StageSwitch_2_2_to_3_1
		printf "Chapter Stage Switching Script - running RU_StageSwitch_2_2_to_3_1"
		SpawnScript RU_StageSwitch_2_2_to_3_1_Spawned params = <...>
	endscript
	script RU_StageSwitch_2_2_to_3_1_Spawned
		if GotParam just_won_goal
			PauseSkaters
			kill prefix = "TRG_G_GS2_Pro"
			create name = TRG_G_GS2_Pro
			SpawnScript RU_StageSwitch_2_2_to_3_1_Spawned_Eric
			Skater::hide
			goal_cam_anim_play goal_id = RU_Goal_Null
			PlaySkaterCamAnim use_last_camera
			Skater::unhide
			kill prefix = "TRG_G_GS2_Pro"
			UnPauseSkaters
			goal_want_to_save
		endif
		SpawnScript RU_StageSwitch_2_2_to_3_1Save_Spawned params = <...>
	endscript
	script RU_StageSwitch_2_2_to_3_1_Spawned_Eric
		TRG_G_GS2_Pro::Ped_InitAI stand
	endscript
	script RU_StageSwitch_2_2_to_3_1Save_Spawned
		if GotParam just_won_goal
			WaitForEvent type = goal_wait_for_save
			DisplayLoadingScreen Blank
			killskatercamanim all
		endif
		script_change_tod tod_action = set_tod_ru_night
		if GotParam just_won_goal
			SetGlobalFlag flag = VIEWED_CUTSCENE_RU_03
			PlayCutscene {
				name = "cutscenes\RU_03.cut"
				unload_anims = 1
				reload_anims = 0
				unload_goals = 1
				reload_goals = 0
				exitScript = spawn_next_cutscene
				exitParams = {name = "cutscenes\RU_03B.cut" unload_anims = 0 reload_anims = 1 unload_goals = 0 reload_goals = 1 exitScript = RU_StageSwitch_2_2_to_3_1Save_Spawned_Spawned exitParams = {<...>}}
			}
		else
			goal_stage_script_done
		endif
	endscript
	script RU_StageSwitch_2_2_to_3_1Save_Spawned_Spawned
		set_current_theme theme_num = 3 story_swap
		script_change_tod tod_action = set_tod_ru_night
		SpawnScript RU_StageSwitch_2_2_to_3_1Save_Spawned_Spawned_Spawned
	endscript
	script RU_StageSwitch_2_2_to_3_1Save_Spawned_Spawned_Spawned
		PauseSkaters
		kill prefix = "TRG_G_TS_Crew15"
		create name = TRG_G_TS_Crew15
		goal_cam_anim_play goal_id = RU_Goal_Null2
		kill prefix = "TRG_G_TS_Crew15"
		UnPauseSkaters
		Skater::killskater node = TRG_G_Tetris2_Pro
		ShownChapterTitle
	endscript
	script RU_StageSwitch_3_1_to_3_2
		script_change_tod tod_action = set_tod_ru_night
		SpawnScript RU_StageSwitch_3_1_to_3_2_Spawned params = <...>
	endscript
	script RU_StageSwitch_3_1_to_3_2_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = RU_Goal_race4
		else
			goal_stage_script_done
		endif
	endscript
	script RU_StageSwitch_GoingToNJ
		printf "Chapter Stage Switching Script - running RU_StageSwitch_GoingToNJ"
		if GotParam just_won_goal
			SpawnScript RU_StageSwitch_GoingToNJ_LevelChange params = <...>
		else
			goal_stage_script_done
		endif
	endscript
	script RU_StageSwitch_GoingToNJ_LevelChange
		goal_want_to_save
		WaitForEvent type = goal_wait_for_save
		DisplayLoadingScreen Blank
		change_level level = load_nj next_level_script = NJ_IntroCutscene
	endscript
	script NJ_IntroCutscene
		DisplayLoadingScreen Blank
		change_clothes male_part = skater_m_torso part_id = #"Peralta Team"
		SpawnScript NJ_IntroCutsceneSave_Spawned params = <...>
	endscript
	script NJ_IntroCutsceneSave_Spawned
		kill prefix = "Veh_PoliceCar_NJ_"
		kill prefix = "NJ_G_NOT_BridgeQP_05"
		kill prefix = "NJ_G_NOT_BridgeQP_06"
		kill prefix = "TRGP_killskater_gap"
		SetGlobalFlag flag = VIEWED_CUTSCENE_NJ_05
		PlayCutscene {
			name = "cutscenes\NJ_05.cut"
			unload_anims = 1
			reload_anims = 0
			unload_goals = 1
			reload_goals = 0
			RestartNode = TRG_G_PS_RestartNode
			exitScript = spawn_next_cutscene
			exitParams = {name = "cutscenes\nj_05b.cut" unload_anims = 0 reload_anims = 1 unload_goals = 0 reload_goals = 1 exitScript = ShownChapterTitle RestartNode = TRG_G_PS_RestartNode exitParams = {<...>}}
		}
	endscript
	script NJ_IntroCutsceneSave_Spawned_FromMovie
		PlayCutscene name = "cutscenes\NJ_05b.cut" exitScript = ShownChapterTitle
	endscript
	script NJ_StageSwitch_FindYourself
		printf "Chapter Stage Switching Script - running NJ_StageSwitch_FindYourself"
		goal_stage_script_done
	endscript
	script NJ_StageSwitch_FindYourself_Spawned
		if GotParam just_won_goal
			wait 1 frame
			GoalManager_ActivateGoal name = nj_goal_Counter4
		endif
	endscript
	script NJ_StageSwitch_GoingToPros
		printf "Chapter Stage Switching Script - running NJ_StageSwitch_GoingToPros"
		if GotParam just_won_goal
			PlaySkaterCamAnim use_last_camera
			goal_want_to_save
			SpawnScript NJ_StageSwitch_GoingToProsSave_Spawned params = <...>
		else
			goal_stage_script_done
		endif
	endscript
	script NJ_StageSwitch_GoingToProsSave_Spawned
		WaitForEvent type = goal_wait_for_save
		SetGlobalFlag flag = VIEWED_CUTSCENE_NJ_06
		DisplayLoadingScreen Blank
		killskatercamanim all
		PlayCutscene name = "cutscenes\NJ_06.cut" exitScript = NJ_StageSwitch_GoingToChoosePro_Spawned
	endscript
	script NJ_StageSwitch_GoingToChoosePro_Spawned
		SpawnScript NJ_StageSwitch_GoingToChoosePro_Spawned_Spawned
	endscript
	script NJ_StageSwitch_GoingToChoosePro_Spawned_Spawned
		NJ_Goal_Null9_MoveSkater
		goal_cam_anim_play goal_id = NJ_Goal_Null9
		ShownChapterTitle
	endscript
	script Pros_StageSwitch_ChooseYourPro
		printf "Chapter Stage Switching Script - running Pros_StageSwitch_ChooseYourPro"
		create name = TRG_G_Special_Stand
		TRG_G_Special_Stand::Obj_MoveToNode name = TRG_G_Counter5_Pro orient
		Skater::Obj_MoveToNode name = TRG_G_Counter5_IntroNode orient
		goal_cam_anim_play goal_id = NJ_Goal_Null6
		kill name = TRG_G_Special_Stand
		SpawnScript Pros_StageSwitch_ChooseYourPro_Spawned params = <...>
	endscript
	script Pros_StageSwitch_ChooseYourPro_Spawned
		kill_start_key_binding
		select_sponsor_post_movies_cleanup
		create_chapter_menu select_team load_em = 1
	endscript
	script UnlockTeamDecks
		unlock_all_sponsor_decks
		create_dialog_box {title = "Unlocked"
			text = "New decks available in Skateshop!"
			just = [center center]
			buttons = [{font = small text = "Ok" pad_choose_script = dialog_box_exit}
			]
		}
	endscript
	script Movies_StageSwitch_GoingToEric
		printf "Chapter Stage Switching Script - running Movies_StageSwitch_GoingToEric"
		if GotParam just_won_goal
			goal_want_to_save
		endif
		SpawnScript Movies_StageSwitch_GoingToEricSave_Spawned params = <...>
	endscript
	script Movies_StageSwitch_GoingToEricSave_Spawned
		if GotParam just_won_goal
			WaitForEvent type = goal_wait_for_save
			kill_start_key_binding
			script_change_tod tod_action = set_tod_evening
			pausegame
			PauseMusic
			make_custom_video_intro
			select_sponsor_play_movies show_team_movies
		endif
		kill prefix = "Veh_PoliceCar_NJ_"
		kill prefix = "NJ_G_NOT_BridgeQP_05"
		kill prefix = "NJ_G_NOT_BridgeQP_06"
		kill prefix = "TRGP_killskater_gap"
		if GotParam just_won_goal
			kill_start_key_binding
		else
			goal_stage_script_done
		endif
		SpawnScript Movies_StageSwitch_GoingToEricSave_Spawned_Spawned params = <...>
	endscript
	script Movies_StageSwitch_GoingToEricSave_Spawned_Spawned
		script_change_tod tod_action = set_tod_evening
	endscript
	script Movies_StageSwitch_GoingToEricSave_FromMovie
		if NOT (GetGlobalFlag flag = LEVEL_UNLOCKED_SE)
			wait 1 frame
			script_change_tod tod_action = set_tod_evening
			GoalManager_ActivateGoal name = nj_goal_Counter5
		endif
	endscript
	script Eric_StageSwitch_GoingToGameOver
		printf "Chapter Stage Switching Script - running Eric_StageSwitch_GoingToGameOver"
		DisplayLoadingScreen Blank
		SetGlobalFlag flag = VIEWED_CUTSCENE_NJ_10
		if NOT (GetGlobalFlag flag = LEVEL_UNLOCKED_SE)
			PlayCutscene name = "cutscenes\NJ_10.cut" exitScript = Eric_StageSwitch_GoingToGameOver_AfterMovie
		else
			SpawnScript Eric_StageSwitch_GoingToGameOver_AfterMovie params = <...>
		endif
	endscript
	script Eric_StageSwitch_GoingToGameOver_AfterMovie
		change Display_Story_Final_LoadingScreen = 1
		change_level level = load_hi next_level_script = HI_Endgame_play_cutscene
	endscript
	script HI_Endgame_play_cutscene
		DisplayLoadingScreen Blank
		SetGlobalFlag flag = VIEWED_CUTSCENE_FINAL
		PlayCutscene name = "cutscenes\final.cut" exitScript = HI_Endgame_show_messages
	endscript
	script HI_Endgame_show_messages
		SpawnScript HI_Endgame_show_messages_spawned
	endscript
	script HI_Endgame_show_messages_spawned
		pausegame
		StopStream
		PlayStream FoundAllGaps vol = 150
		GoalManager_GetDifficultyLevel
		switch <difficulty_level>
			case 0
				if GetGlobalFlag flag = DIFFICULTY_MODE_TOO_EASY
					<text> = "You've unlocked:\n\c5- The Secret Level\n\c5- Additional Pro Movies\n"
					SetGlobalFlag flag = GAME_COMPLETED_TOO_EASY
				else
					<text> = "You've unlocked:\n\c5- The Secret Level\n\c5- Additional Pro Movies\n\c5- Secret Skater: \c2Iron Man\n\n\c0Marvel, Iron Man and Marvel characters: TM & (c) 2003 Marvel Characters, Inc. All rights reserved."
					SetGlobalFlag flag = GAME_COMPLETED_BEGINNER
					SetGlobalFlag flag = SKATER_UNLOCKED_IRONMAN
				endif
			case 1
				<text> = "You've unlocked:\n\c5- The Secret Level\n\c5- Additional Pro Movies\n\c5- Secret Skaters: \c2Iron Man\n\c5and \c2Gene Simmons\n\n\c0Marvel, Iron Man and Marvel characters: TM & (c) 2003 Marvel Characters, Inc. All rights reserved."
				SetGlobalFlag flag = GAME_COMPLETED_NORMAL
				SetGlobalFlag flag = SKATER_UNLOCKED_IRONMAN
				SetGlobalFlag flag = SKATER_UNLOCKED_KISSDUDE
			case 2
				<text> = "You've unlocked:\n\c5- The Secret Level\n\c5- Additional Pro Movies\n\c5- Secret Skaters: \c2Iron Man,\n\c2Gene Simmons,\n \c5and \c2T.H.U.D.\n\n\c0Marvel, Iron Man and Marvel characters: TM & (c) 2003 Marvel Characters, Inc. All rights reserved."
				SetGlobalFlag flag = GAME_COMPLETED_SICK
				SetGlobalFlag flag = SKATER_UNLOCKED_IRONMAN
				SetGlobalFlag flag = SKATER_UNLOCKED_KISSDUDE
				SetGlobalFlag flag = SKATER_UNLOCKED_CREATURE
			default
				<text> = "You've unlocked:\n- Nothing for having a incorrect difficulty level"
		endswitch
		SetGlobalFlag flag = LEVEL_UNLOCKED_SE
		unlock_team_movies
		create_dialog_box {title = "CONGRATULATIONS!"
			title_font = testtitle
			text = <text>
			pos = (320.0,240.0)
			just = [center center]
			text_rgba = [88 105 112 128]
			text_dims = (330.0,0.0)
			line_spacing = 0.85000002
			buttons = [{font = small text = "OK" pad_choose_script = eric_unlock_accept}]
			delay_input
			pad_focus_script = text_twitch_effect
			style = special_dialog_style
		}
		WaitForEvent type = eric_unlock_accept_done
		goal_want_to_save
		WaitForEvent type = goal_wait_for_save
		cleanup_play_movie "movies\pccredits"
		ingame_play_movie "movies\credits" level = load_skateshop
	endscript
	script unlock_team_movies
		GoalManager_GetTeam
		<index> = 0
		GetArraySize CHAPTER_GOALS index1 = 24 index2 = 0
		while
			Get3DArrayData arrayname = CHAPTER_GOALS index1 = 24 index2 = 0 index3 = <index>
			SetGlobalFlag flag = (<val>.movie)
			<index> = (<index> + 1)
		repeat <array_size>
	endscript
	script eric_unlock_accept
		end_special_dialog_style
		wait 0.2 seconds
		dialog_box_exit
		FireEvent type = eric_unlock_accept_done
	endscript
	script secret_level_unlock_cas_parts
	endscript
