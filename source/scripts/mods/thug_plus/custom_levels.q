THUGPLUS_LEVELS_CUSTOM = [
		{text = "Empty Slot 1" level_num = 0 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_NJ level = Load_Custom01}
		{text = "Empty Slot 2" cross_it_out = 1 level_num = 0 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_NJ level = Load_Custom02}
		{text = "Empty Slot 3" cross_it_out = 1 level_num = 0 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_NJ level = Load_Custom03}
		{text = "Empty Slot 4" cross_it_out = 1 level_num = 0 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_NJ level = Load_Custom04}
		{text = "Empty Slot 5" cross_it_out = 1 level_num = 0 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_NJ level = Load_Custom05}
		{text = "Empty Slot 6" cross_it_out = 1 level_num = 0 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_NJ level = Load_Custom06}
		{text = "Empty Slot 7" cross_it_out = 1 level_num = 0 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_NJ level = Load_Custom07}
		{text = "Empty Slot 8" cross_it_out = 1 level_num = 0 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_NJ level = Load_Custom08}
		{text = "Empty Slot 9" cross_it_out = 1 level_num = 0 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_NJ level = Load_Custom09}
		{text = "Empty Slot 10" cross_it_out = 1 level_num = 0 points_to_unlock = 0 num_am_goals = 0 num_goals = 0 flag = LEVEL_UNLOCKED_NJ level = Load_Custom10}
	]
    
Level_Custom01 = {
    structure_name = Level_Custom01
    load_script = Load_Custom01
    name = "Custom Test"
    loading_screen = "loadscrn_generic"
    loading_time = 8.5
    level = "Foo"
    sky = "Foo_Sky"
    qb = "levels\Foo\Foo.qb"
    level_qb = "levels\Foo\Foo_scripts.qb"
    desired_tod = set_tod_day
    startup_script = Foo_Startup
    goals_script = Foo_goals
    setup_script = Foo_setup
    default_stats = 5
    level_number = LevelNum_Default
    ambient_red = 72
    ambient_green = 72
    ambient_blue = 72
    ambient_mod_factor = 0.2
    heading_0 = -30
    pitch_0 = -60
    red_0 = 110
    green_0 = 110
    blue_0 = 105
    mod_factor_0 = 0.89999998
    heading_1 = 200
    pitch_1 = 33
    red_1 = 23
    green_1 = 24
    blue_1 = 30
    mod_factor_1 = 0.89999998
    fog_red = 0
    fog_green = 0
    fog_blue = 0
    fog_alpha = 0
    fog_dist = 0
}
Level_Custom02 = {
    structure_name = Level_Custom02
    load_script = Load_Custom02
    name = "Empty Slot"
    loading_screen = "loadscrn_generic"
    loading_time = 8.5
    level = "NJ"
    sky = "NJ_Sky"
    qb = "levels\NJ\NJ.qb"
    level_qb = "levels\NJ\NJ_scripts.qb"
    desired_tod = set_tod_day
    startup_script = Level_Custom02_Startup
    goals_script = Level_Custom02_goals
    setup_script = Level_Custom02_setup
    default_stats = 5
    level_number = LevelNum_Default
    ambient_red = 72
    ambient_green = 72
    ambient_blue = 72
    ambient_mod_factor = 0.2
    heading_0 = -30
    pitch_0 = -60
    red_0 = 110
    green_0 = 110
    blue_0 = 105
    mod_factor_0 = 0.89999998
    heading_1 = 200
    pitch_1 = 33
    red_1 = 23
    green_1 = 24
    blue_1 = 30
    mod_factor_1 = 0.89999998
    fog_red = 0
    fog_green = 0
    fog_blue = 0
    fog_alpha = 0
    fog_dist = 0
}