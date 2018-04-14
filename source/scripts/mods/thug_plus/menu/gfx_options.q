
gfx_settings_custom = [
    {
        menu_id = gfxmenu_setting_quality
        name = " Quality" 
        property = GraphicsSetting 
        type = dropdown 
        value_names = [
            "None"
            "Ultra Low"
            "Low"
            "Medium"
            "High"
            "Very High"
            "Maximum"
            "Custom"
        ]
        min = 1 max = 7 step = 1 break_after = 1
    }
    { menu_id = gfxmenu_setting_clipping name = " Distance Clipping" property = UseDistanceClipping type = toggle break_after = 0 }
    { menu_id = gfxmenu_setting_distance name = " Distance" property = ClippingDistance type = slider min = 100 max = 2000 step = 100 break_after = 0 }
    { menu_id = gfxmenu_setting_fog name = " Distance Fog" property = UseDistanceFog type = toggle break_after = 1 }
    { menu_id = gfxmenu_setting_useshaders name = " Use New Shaders" property = UseNewShaders type = toggle break_after = 0 }
    { menu_id = gfxmenu_setting_shaderdetail name = " Shader Quality" property = ShaderDetail type = dropdown value_names = 
        [   "None"
            "Low"
            "Medium"
            "High"
            "Ultra" ] 
        min = 1 max = 4 step = 1 break_after = 0 }
    { menu_id = gfxmenu_setting_texturequality name = " Texture Quality" property = TextureQuality type = dropdown value_names = 
        [   "None"
            "Low"
            "Medium"
            "High"
            "Ultra" ] 
        min = 1 max = 4 step = 1 break_after = 0 }
    { menu_id = gfxmenu_setting_pp name = " Postprocessing" property = UsePostProcessing type = toggle break_after = 1 }
    { menu_id = gfxmenu_setting_particles name = " Particles" property = ParticlesEnabled type = toggle break_after = 0 }
    { menu_id = gfxmenu_setting_shatter name = " Shatter" property = RenderShatter type = toggle break_after = 0 }
]

script gfx_settings_menu_create
    if ObjectExists id = current_menu_anchor
        DestroyScreenElement id = current_menu_anchor
    endif
    GoalManager_HidePoints
    GoalManager_HideGoalPoints
    if NOT LevelIs load_skateshop
        PauseMusicAndStreams 1
    else
        //skater::remove_skater_from_world
    endif
    SetScreenElementLock id = root_window off
    CreateScreenElement {
        type = ContainerElement
        parent = root_window
        id = gfx_anchor
        dims = (640.0,480.0)
        pos = (320.0,240.0)
    }
    AssignAlias id = gfx_anchor alias = current_menu_anchor
    create_helper_text {helper_text_elements = [{text = "\b7/\b4 = Select"}
            {text = "\bn = Back"}
        ]
    }
    kill_start_key_binding
    FormatText ChecksumName = title_icon "%i_pro" i = (THEME_PREFIXES[current_theme_prefix])
    build_theme_sub_title title = "GRAPHICS SETTINGS" title_icon = <title_icon>
    FormatText ChecksumName = paused_icon "%i_paused_icon" i = (THEME_PREFIXES[current_theme_prefix])
    if LevelIs load_skateshop
        build_top_and_bottom_blocks
        make_mainmenu_3d_plane
    else
        build_theme_box_icons icon_texture = <paused_icon>
        build_grunge_piece
        build_top_bar pos = (0.0,62.0)
    endif
    CreateScreenElement {
        type = ContainerElement
        parent = gfx_anchor
        id = gfx_settings_menu
        dims = (640.0,480.0)
        pos = (320.0,640.0)
    }
    AssignAlias id = gfx_settings_menu alias = current_menu_anchor
    theme_background width = 6.3499999 pos = (320.0,85.0) num_parts = 10.5
    <root_pos> = (80.0,25.0)
    FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
    FormatText ChecksumName = icon_color "%i_ICON_ON_VALUE" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
    GetStackedScreenElementPos X id = <id> offset = (115.0,0.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = gfx_settings_menu_up_arrow
        texture = up_arrow
        rgba = [128 128 128 85]
        pos = (300.0,90.0)
        just = [left top]
        z_priority = 3
    }
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        texture = black
        scale = (2.0,75.0)
        pos = (380.0,90.0)
        just = [left top]
        rgba = [0 0 0 128]
    }
    GetStackedScreenElementPos Y id = gfx_settings_menu_up_arrow offset = (0.0,260.0)
    CreateScreenElement {
        type = SpriteElement
        parent = current_menu_anchor
        id = gfx_settings_menu_down_arrow
        texture = down_arrow
        rgba = [128 128 128 85]
        pos = <pos>
        just = [left top]
        z_priority = 3
    }
    CreateScreenElement {
        type = VScrollingMenu
        parent = current_menu_anchor
        id = vs1
        dims = (640.0,245.0)
        pos = (54.0,110.0)
        just = [left top]
        internal_just = [center top]
    }
    CreateScreenElement {
        type = VMenu
        parent = <id>
        id = gfx_settings_vmenu
        pos = (0.0,0.0)
        just = [left top]
        internal_just = [left top]
        dont_allow_wrap
        event_handlers = [
            {pad_up menu_vert_blink_arrow params = {id = gfx_settings_menu_up_arrow rgba = <text_rgba>}}
            {pad_down menu_vert_blink_arrow params = {id = gfx_settings_menu_down_arrow rgba = <text_rgba>}}
            {pad_up generic_menu_up_or_down_sound params = {up}}
            {pad_down generic_menu_up_or_down_sound params = {down}}
        ]
    }
    AssignAlias id = gfx_settings_vmenu alias = current_menu
    SetScreenElementProps {
        id = current_menu
        event_handlers = [{pad_back generic_menu_pad_back params = {callback = gfx_settings_menu_exit}}]
    }
    GoalManager_GetNumberOfGoalPoints total
    FormatText TextName = goal_points "%i / %j" i = <goal_points> j = total_num_goals
    //gfx_settings_menu_add_item id1 = gfx_settings_vmenu left_col_text = "QUALITY:" right_col_text = "Ultra"
    
    <index> = 0
    while
        UGPlus_GetPerformanceOption Setting = ((gfx_settings_custom[<index>]).property)
        
        // Toggle options - on/off checkbox items
        if ( (gfx_settings_custom[<index>]).type = toggle )
            gfx_settings_menu_add_item {
                item_id = ((gfx_settings_custom[<index>]).menu_id) 
                id1 = gfx_settings_vmenu 
                left_col_text = ((gfx_settings_custom[<index>]).name) 
                check_box = <value>
                pad_choose_script = gfx_settings_toggle
                pad_choose_params = { setting = (gfx_settings_custom[<index>]) }
            }
        else
            // Dropdown options - list of indexed options with names
            if ( (gfx_settings_custom[<index>]).type = dropdown )
                gfx_settings_menu_add_item {
                    item_id = ((gfx_settings_custom[<index>]).menu_id) 
                    id1 = gfx_settings_vmenu 
                    left_col_text = ((gfx_settings_custom[<index>]).name) 
                    right_col_text = ((gfx_settings_custom[<index>]).value_names[<value>])
                    pad_left_script = gfx_settings_slidedown
                    pad_right_script = gfx_settings_slideup
                    pad_slide_params = { setting = (gfx_settings_custom[<index>]) }
                }
            else
            // Slider options - numerical values with a range
                FormatText TextName = gfx_options_slider_name "%i" i = <value>
                gfx_settings_menu_add_item {
                    item_id = ((gfx_settings_custom[<index>]).menu_id) 
                    id1 = gfx_settings_vmenu 
                    left_col_text = ((gfx_settings_custom[<index>]).name) 
                    right_col_text = <gfx_options_slider_name>
                    pad_left_script = gfx_settings_slidedown
                    pad_right_script = gfx_settings_slideup
                    pad_slide_params = { setting = (gfx_settings_custom[<index>]) }
                }
            endif
        endif
        if ( (gfx_settings_custom[<index>]).break_after = 1 )
            gfx_settings_menu_add_item { id1 = gfx_settings_vmenu seperator }
        endif
        <index> = (<index> + 1)
    repeat 10
    
    if LevelIs load_skateshop
        DoScreenElementMorph id = current_menu_anchor pos = (320.0,218.0) time = 0.2
    else
        DoScreenElementMorph id = current_menu_anchor pos = (320.0,240.0) time = 0.2
    endif
    DoScreenElementMorph id = gfx_settings_vmenu time = 0.2 pos = (0.0,-200.0)
    FireEvent type = focus target = current_menu
endscript
	
script gfx_settings_slidedown 
    if NOT GotParam setting
        printf "gfx_settings_slidedown: setting parameter not passed!"
        return
    endif
    printf ((<setting>).name)
    UGPlus_GetPerformanceOption Setting = ((<setting>).property)
    if ( <value> = ((<setting>).min) )
        return
    endif
    <value> = ( <value> - ((<setting>).step) )
    printf (<value>)
    UGPlus_SetPerformanceOption Setting = ((<setting>).property) Value = (<value>)
    // Update the UI to reflect the change
    if ( ((<setting>).type) = dropdown )
        FormatText TextName = gfx_options_cur_value "%i" i = ((<setting>).value_names[<value>])
    else
        FormatText TextName = gfx_options_cur_value "%i" i = <value>
    endif
    SetScreenElementProps {
        id = ((<setting>).menu_id)
        text = <gfx_options_cur_value>
    }
endscript
script gfx_settings_slideup
    if NOT GotParam setting
        printf "gfx_settings_slideup: setting parameter not passed!"
        return
    endif
    printf ((<setting>).name)
    UGPlus_GetPerformanceOption Setting = ((<setting>).property)
    if ( <value> = ((<setting>).max) )
        return
    endif
    <value> = ( <value> + ((<setting>).step) )
    printf (<value>)
    UGPlus_SetPerformanceOption Setting = ((<setting>).property) Value = (<value>)
    // Update the UI to reflect the change
    if ( (<setting>).type = dropdown )
        FormatText TextName = gfx_options_cur_value "%i" i = ((<setting>).value_names[<value>])
    else
        FormatText TextName = gfx_options_cur_value "%i" i = <value>
    endif
    SetScreenElementProps {
        id = ((<setting>).menu_id)
        text = <gfx_options_cur_value>
    }
endscript
script gfx_settings_toggle
    if NOT GotParam setting
        printf "gfx_settings_toggle: setting parameter not passed!"
        return
    endif
    printf ((<setting>).name)
    UGPlus_GetPerformanceOption Setting = ((<setting>).property)
    if ( <value> = 1 )
        <value> = 0
    else
        <value> = 1
    endif
    printf <value>
    UGPlus_SetPerformanceOption Setting = ((<setting>).property) Value = (<value>)
    // Update the UI to reflect the change
    if ( <value> = 1 )
        FormatText ChecksumName = checkmark_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
        SetScreenElementProps {
            id = ((<setting>).menu_id)
            rgba = <checkmark_rgba>
        }
    else
        SetScreenElementProps {
            id = ((<setting>).menu_id)
            rgba = [0 0 0 0]
        }
    endif
endscript

script gfx_settings_menu_add_item pad_choose_script = nullscript pad_choose_params = { } left_col_text = "" right_col_text = "" pad_left_script = nullscript pad_right_script = nullscript pad_slide_params = { }
    FormatText ChecksumName = off_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
    FormatText ChecksumName = on_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
    <anchor_id1> = <id1>
    if GotParam seperator
        CreateScreenElement {
            type = ContainerElement
            parent = <id1>
            pos = (65.0,10.0)
            dims = (200.0,20.0)
            not_focusable
        }
        <anchor_id1> = <id>
        CreateScreenElement {
            type = SpriteElement
            parent = <anchor_id1>
            texture = black
            scale = (132.0,3.29999995)
            pos = (4.0,0.0)
            just = [left top]
            rgba = [0 0 0 90]
            not_focusable
        }
    else
        if GotParam check_box
            FormatText ChecksumName = check_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
            FormatText ChecksumName = checkmark_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
            CreateScreenElement {
                type = ContainerElement
                parent = <id1>
                pos = (65.0,10.0)
                dims = (200.0,25.0)
                event_handlers = [
                    {focus gfx_settings_menu_focus params = {checkbox_item = checkbox_item}}
                    {unfocus gfx_settings_menu_unfocus params = {checkbox_item = checkbox_item}}
					{pad_choose <pad_choose_script> params = <pad_choose_params>}
					{pad_start <pad_choose_script> params = <pad_choose_params>}
                ]
            }
            <anchor_id1> = <id>
            CreateScreenElement {
                type = TextElement
                parent = <anchor_id1>
                font = small
                text = <left_col_text>
                pos = (10.0,0.0)
                just = [left top]
                rgba = <off_rgba>
                scale = 1.0
            }
            CreateScreenElement {
                type = SpriteElement
                parent = <anchor_id1>
                texture = checkbox
                pos = ((420.0,0.0) + (0.0,5.0))
                just = [center top]
                scale = 0.55000001
                rgba = <check_rgba>
                z_priority = 5
            }
            if (<check_box> = 1)
                CreateScreenElement {
                    type = SpriteElement
                    id = <item_id>
                    parent = <id>
                    texture = checkmark
                    pos = (25.0,-7.0)
                    just = [center top]
                    rgba = <checkmark_rgba>
                    z_priority = 6
                    scale = 1.39999998
                }
            else
                CreateScreenElement {
                    type = SpriteElement
                    id = <item_id>
                    parent = <id>
                    texture = checkmark
                    pos = (25.0,-7.0)
                    just = [center top]
                    rgba = [0 0 0 0]
                    z_priority = 6
                    scale = 1.39999998
                }
            endif
            highlight_angle = RandomNoRepeat(@2 @-2 @3 @-3 @3.5 @-3 @5 @-4 @2.5 @-4.5)
            CreateScreenElement {
                type = SpriteElement
                parent = <anchor_id1>
                texture = de_highlight_bar
                pos = (262.0,10.0)
                just = [center center]
                rgba = [0 0 0 0]
                z_priority = 3
                scale = (4.0999999,0.69999999)
                rot_angle = (<highlight_angle> / 4)
            }
        else
            CreateScreenElement {
                type = ContainerElement
                parent = <id1>
                pos = (65.0,10.0)
                dims = (200.0,25.0)
                event_handlers = [
                    {focus gfx_settings_menu_focus}
                    {unfocus gfx_settings_menu_unfocus}
					{pad_choose <pad_choose_script> params = <pad_choose_params>}
					{pad_start <pad_choose_script> params = <pad_choose_params>}
					{pad_left <pad_left_script> params = <pad_slide_params>}
					{pad_right <pad_right_script> params = <pad_slide_params>}
                ]
            }
            <anchor_id1> = <id>
            CreateScreenElement {
                type = TextElement
                parent = <anchor_id1>
                font = small
                text = <left_col_text>
                pos = (10.0,0.0)
                just = [left top]
                rgba = <off_rgba>
                scale = 1.0
            }
            CreateScreenElement {
                type = TextElement
                id = <item_id>
                parent = <anchor_id1>
                font = small
                text = <right_col_text>
                pos = (420.0,0.0)
                just = [center top]
                rgba = <off_rgba>
                scale = 1.0
            }
            highlight_angle = RandomNoRepeat(@2 @-2 @3 @-3 @3.5 @-3 @5 @-4 @2.5 @-4.5)
            CreateScreenElement {
                type = SpriteElement
                parent = <anchor_id1>
                texture = de_highlight_bar
                pos = (262.0,10.0)
                just = [center center]
                rgba = [0 0 0 0]
                z_priority = 3
                scale = (4.0999999,0.69999999)
                rot_angle = (<highlight_angle> / 4)
            }
        endif
    endif
endscript
script gfx_settings_menu_focus
    GetTags
    FormatText ChecksumName = text_rgba "%i_HIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
    RunScriptOnScreenElement id = {<id> child = 0} text_twitch_effect2
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <text_rgba>
    }
    if GotParam checkbox_item
        FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
        SetScreenElementProps {
            id = {<id> child = 2}
            rgba = <bar_rgba>
        }
    else
        RunScriptOnScreenElement id = {<id> child = 1} text_twitch_effect2
        DoScreenElementMorph {
            id = {<id> child = 1}
            rgba = <text_rgba>
        }
        FormatText ChecksumName = bar_rgba "%i_HIGHLIGHT_BAR_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
        SetScreenElementProps {
            id = {<id> child = 2}
            rgba = <bar_rgba>
        }
    endif
endscript
script gfx_settings_menu_unfocus
    GetTags
    FormatText ChecksumName = text_rgba "%i_UNHIGHLIGHTED_TEXT_COLOR" i = (THEME_COLOR_PREFIXES[current_theme_prefix])
    KillSpawnedScript name = text_twitch_effect2
    DoScreenElementMorph {
        id = {<id> child = 0}
        rgba = <text_rgba>
    }
    if GotParam checkbox_item
        SetScreenElementProps {
            id = {<id> child = 2}
            rgba = [0 0 0 0]
        }
    else
        DoScreenElementMorph {
            id = {<id> child = 1}
            rgba = <text_rgba>
        }
        SetScreenElementProps {
            id = {<id> child = 2}
            rgba = [0 0 0 0]
        }
    endif
endscript
script gfx_settings_menu_exit
    if ObjectExists id = gfx_anchor
        DestroyScreenElement id = gfx_anchor
        wait 1 gameframe
    endif
    if ObjectExists id = box_icon
        DestroyScreenElement id = box_icon
        wait 1 gameframe
    endif
    if ObjectExists id = box_icon_2
        DestroyScreenElement id = box_icon_2
        wait 1 gameframe
    endif
    if ObjectExists id = grunge_anchor
        DestroyScreenElement id = grunge_anchor
        wait 1 gameframe
    endif
    if LevelIs load_skateshop
        create_setup_options_menu
    else
        create_options_menu
    endif
endscript
