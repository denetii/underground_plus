	script create_menu_test_menu
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = menu_test_menu
			font = small
			pos = (320.0,224.0)
			just = [center center]
			scale = 0
			dims = (200.0,400.0)
			focusable_child = menu_test_vmenu
		}
		CreateScreenElement {
			type = TextElement
			parent = menu_test_menu
			font = small
			text = "Test Stuff"
			scale = 1.25
			pos = (100.0,70.0)
			just = [center top]
			rgba = [32 32 144 128]
		}
		CreateScreenElement {
			type = VScrollingMenu
			parent = menu_test_menu
			id = the_scrolling_menu
			just = [center top]
			pos = (100.0,90.0)
			dims = (200.0,80.0)
			internal_just = [center center]
		}
		CreateScreenElement {
			type = VMenu
			parent = the_scrolling_menu
			id = menu_test_vmenu
			font = small
			just = [center top]
			pos = (100.0,0.0)
			dims = (200.0,170.0)
			internal_just = [center center]
			dont_allow_wrap
		}
		AssignAlias id = menu_test_menu alias = current_menu_anchor
		AssignAlias id = menu_test_vmenu alias = current_menu
		SetScreenElementProps {
			id = menu_test_vmenu
			event_handlers = [
				{pad_back leave_menu_test_menu}
			]
		}
		make_text_menu_item text = "Sprite Test On" id = menu_sprite_test_on pad_choose_script = start_sprite_test focus_script = make_text_sub_menu_item text = "Focus here to assert" focus_script = menu_test_focus_position
		make_text_menu_item text = "Sprite Test Off" id = menu_sprite_test_off pad_choose_script = stop_sprite_test
		make_text_menu_item text = "Font Test" id = menu_font_test pad_choose_script = launch_font_test_menu
		make_text_menu_item text = "Exit" id = menu_exit_test pad_choose_script = leave_menu_test_menu
		hookup_hmenu
		SetScreenElementProps {
			id = root_window
			event_handlers = [
				{pad_start nullscript}
			]
			replace_handlers
		}
		LoadTexture "sht_volcom01"
		CreateScreenElement {
			type = TextElement
			id = blur_test_element
			parent = root_window
			font = small
			text = "Vapor Trails"
			scale = 2.0
			pos = (320.0,250.0)
			just = [center center]
			rgba = [128 128 128 128]
			blur_effect
			blur_rgba = [128 0 0 128]
		}
		CreateScreenElement {
			type = TextElement
			id = dumb_monkey
			parent = root_window
			font = small
			text = "O\m0\m1\m2\m3\m4\m5\m6ne\bcTwo\bc\m7Three\b1"
			scale = 1.0
			pos = (25.0,150.0)
			just = [left center]
			rgba = [128 128 128 128]
		}
		AssignAlias id = blur_test_element alias = blur_alias
		RunScriptOnScreenElement id = blur_alias do_blur_effect2
		RunScriptOnScreenElement id = menu_test_menu animate_in
		printf "create_menu_test_menu done"
		AddTextureToVram "bottom_mid"
		CreateScreenElement {
			type = SpriteElement
			parent = root_window
			id = bottom_mid_test
			texture = bottom_mid
			pos = (320.0,400.0)
			scale = (15.0,1.0)
			just = [center bottom]
		}
	endscript
	script menu_test_focus_position
		GetTags
		SetScreenElementLock id = <id> off
		CreateScreenElement {
			type = SpriteElement
			parent = <id>
			texture = GO_fail
		}
		SetScreenElementLock id = <id> off
	endscript
	script do_blur_effect
		DoMorph time = 0 blur_alpha_pair = (4.0,0.0) blur_bottom_scales = (1.0,1.0) blur_max_displacement = (0.0,0.0) scale = (0.89999998,0.89999998) scale = (1.0,1.0) relative_scale
		DoMorph time = 0.09 blur_alpha_pair = (0.0,0.0) blur_bottom_scales = (2.0,0.0) scale = (1.0,1.0) relative_scale
		DoMorph time = 0.09 blur_alpha_pair = (4.0,0.0) blur_bottom_scales = (1.0,1.0) scale = (1.0,1.0) relative_scale
	endscript
	script do_blur_effect_accept
		DoMorph time = 0 blur_alpha_pair = (4.0,0.0) blur_bottom_scales = (1.0,1.0) blur_max_displacement = (0.0,0.0) scale = (0.89999998,0.89999998) scale = (1.0,1.0) relative_scale
		DoMorph time = 0.07 blur_alpha_pair = (0.0,0.0) blur_bottom_scales = (3.5,0.0) scale = (1.0,1.0) relative_scale
		DoMorph time = 0.07 blur_alpha_pair = (4.0,0.0) blur_bottom_scales = (1.0,1.0) scale = (1.0,1.0) relative_scale
	endscript
	script do_blur_effect_highlight
		DoMorph time = 0 blur_alpha_pair = (4.0,0.0) blur_bottom_scales = (1.0,1.0) blur_max_displacement = (0.0,0.0) scale = (0.89999998,0.89999998) blur_top_alpha_mult = 8.0 scale = (1.0,1.0) relative_scale
		DoMorph time = 0.07 blur_alpha_pair = (0.2,0.2) blur_bottom_scales = (2.5999999,0.0) scale = (1.0,1.0) relative_scale
		DoMorph time = 0.07 blur_alpha_pair = (4.0,0.0) blur_bottom_scales = (1.0,1.0) scale = (1.0,1.0) relative_scale
	endscript
	script do_blur_effect2
		while
			DoMorph time = 0 blur_alpha_pair = (1.0,0.0) blur_bottom_scales = (1.0,1.0) blur_max_displacement = (0.0,0.0) alpha = 0.0625 scale = (2.0,2.0) relative_scale
			DoMorph time = 0.75 blur_alpha_pair = (0.5,0.0) blur_bottom_scales = (3.0,3.0) scale = (2.0,2.0) relative_scale
			DoMorph time = 0.75 blur_alpha_pair = (1.0,0.0) blur_bottom_scales = (1.0,1.0) scale = (2.0,2.0) relative_scale
			wait 0.60000002 seconds
			DoMorph time = 0.5 pos = (320.0,320.0) blur_max_displacement = (0.0,70.0)
			DoMorph time = 0.5 blur_max_displacement = (0.0,0.0)
			wait 0.60000002 seconds
			DoMorph time = 0.5 pos = (320.0,250.0) blur_max_displacement = (0.0,-70.0)
			DoMorph time = 0.5 pos = (320.0,250.0) blur_max_displacement = (0.0,0.0) alpha = 1.0
			wait 0.60000002 seconds
			SetProps no_blur_effect
			wait 0.60000002 seconds
			SetProps blur_effect
		repeat
	endscript
	script leave_menu_test_menu
		DestroyScreenElement id = dumb_monkey
		DestroyScreenElement id = blur_test_element
		stop_sprite_test
		UnloadTexture "sht_volcom01"
		SetScreenElementProps {
			id = root_window
			event_handlers = [
				{pad_start handle_start_pressed}
			]
			replace_handlers
		}
		GetTags
		printf "death or glory"
		DestroyScreenElement id = menu_test_menu
		printf "ack"
		create_debug_menu
		RemoveTextureFromVram "bottom_mid"
		DestroyScreenElement id = bottom_mid_test
	endscript
	script hookup_hmenu
		printf "hookup_hmenu"
		CreateScreenElement {
			type = hmenu
			id = test_h_menu
			parent = current_menu
			just = [center center]
			padding_scale = 1.25
			spacing_between = 30
		}
		CreateScreenElement {
			type = TextElement
			parent = test_h_menu
			local_id = something_something
			text = "do something"
			font = small
			rgba = [128 64 64 75]
			event_handlers = [
				{focus do_scale_up}
				{unfocus do_scale_down}
			]
			not_focusable
		}
		CreateScreenElement {
			type = TextElement
			parent = test_h_menu
			text = "yes"
			font = small
			rgba = [128 128 128 75]
			event_handlers = [
				{focus do_scale_up}
				{unfocus do_scale_down}
				{pad_choose choose_h_menu_yes}
			]
		}
		CreateScreenElement {
			type = TextElement
			parent = test_h_menu
			text = "no"
			font = small
			rgba = [128 128 128 75]
			event_handlers = [
				{focus do_scale_up}
				{unfocus do_scale_down}
				{pad_choose choose_h_menu_no}
			]
		}
		SetScreenElementLock id = test_h_menu
		printf "hookup_hmenu done"
	endscript
	script choose_h_menu_yes
		SetScreenElementProps id = {test_h_menu child = something_something} focusable
		SetScreenElementProps id = current_menu disable_pad_handling
	endscript
	script choose_h_menu_no
		SetScreenElementProps id = {test_h_menu child = something_something} not_focusable
		SetScreenElementProps id = current_menu enable_pad_handling
	endscript
	script start_sprite_test
		if ObjectExists id = test_sprite
		else
			SetScreenElementLock id = root_window off
			CreateScreenElement {
				id = test_sprite
				type = SpriteElement
				parent = root_window
				scale = 1.0
				pos = (610.0,30.0)
				just = [right top]
				rgba = [128 128 128 128]
				texture = sht_volcom01
				debug_outline
			}
			FireEvent type = focus target = current_menu
		endif
	endscript
	script stop_sprite_test
		if ObjectExists id = test_sprite
			SetScreenElementLock id = root_window off
			DestroyScreenElement id = test_sprite recurse
			FireEvent type = focus target = current_menu
		endif
	endscript
	script launch_font_test_menu
	endscript
	script font_test font1 = small font2 = small_test_1 font3 = small_test_2
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = font_test_anchor1
			pos = (0.0,324.0)
			just = [left top]
			dims = (640.0,100.0)
			focusable_child = font_test_vmenu
		}
		make_new_menu menu_id = font_test_menu vmenu_id = font_test_vmenu menu_title = "Font test"
		SetScreenElementProps {id = font_test_menu
			event_handlers = [
				{pad_back exit_font_test}
			]
		}
		make_text_sub_menu_item {text = "Exit font test"
			id = "eft"
			unfocus_script = do_scale_up
			pad_choose_script = exit_font_test
		}
		CreateScreenElement {
			type = TextElement
			parent = font_test_anchor1
			font = <font1>
			text = "Tony Hawks Pro Skater - original THPS3 font"
			scale = 1.0
			rgba = [92 92 92 128]
			just = [left top]
			pos = (15.0,0.0)
		}
		CreateScreenElement {
			type = TextElement
			parent = font_test_anchor1
			font = <font2>
			text = "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
			scale = 1.0
			rgba = [92 92 92 0]
			just = [left top]
			pos = (15.0,20.0)
		}
		CreateScreenElement {
			type = TextElement
			parent = font_test_anchor1
			font = <font2>
			text = "a b c d e f g h i j k l m n o p q r s t u v w x y z"
			scale = 1.0
			rgba = [92 92 92 0]
			just = [left top]
			pos = (15.0,40.0)
		}
		CreateScreenElement {
			type = TextElement
			parent = font_test_anchor1
			font = <font2>
			text = "0 1 2 3 4 5 6 7 8 9 . , - ! ? : ' + / ^ ® ( ) * @ `"
			scale = 1.0
			rgba = [92 92 92 0]
			just = [left top]
			pos = (15.0,60.0)
		}
		CreateScreenElement {
			type = TextElement
			parent = font_test_anchor1
			font = <font2>
			text = " ¡ ¢ £ ¤ ¥ ¦ § ¨ © ª « ¬ { _ # $ % & \ = < > ß Ä Ü"
			scale = 1.0
			rgba = [92 92 92 0]
			just = [left top]
			pos = (15.0,80.0)
		}
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = font_test_anchor2
			pos = (0.0,15.0)
			just = [left top]
			dims = (640.0,100.0)
		}
		CreateScreenElement {
			type = TextElement
			parent = font_test_anchor2
			font = <font3>
			text = "ABCD EFGHI JKL MNOPQR"
			scale = 1.0
			rgba = [111 53 18 128]
			just = [left top]
			pos = (15.0,200.0)
		}
		CreateScreenElement {
			type = TextElement
			parent = font_test_anchor2
			font = <font3>
			text = "STUV WXYZa bcd efghij"
			scale = 1.0
			rgba = [78 79 127 128]
			just = [left top]
			pos = (15.0,220.0)
		}
		CreateScreenElement {
			type = TextElement
			parent = font_test_anchor2
			font = <font3>
			text = "klmn opqrs tuv wxyz01"
			scale = 1.0
			rgba = [118 110 14 128]
			just = [left top]
			pos = (15.0,240.0)
		}
		RunScriptOnScreenElement id = font_test_menu animate_in
	endscript
	script exit_font_test
		SetScreenElementLock id = root_window off
		DestroyScreenElement id = font_test_anchor1 recurse
		DestroyScreenElement id = font_test_anchor2 recurse
		RunScriptOnScreenElement id = font_test_menu animate_out callback = create_pause_menu
	endscript
	script Create3dArrowPointer model = "Arrow" angleX = 42.5 pos = (320.0,50.0) scale = 0.03 active_viewport = 0
		if GotParam ArrowId
			printf "Create3dArrowPointer now uses 'Id' instead of 'ArrowId'"
			goto abort
		endif
		if ObjectExists id = <id>
			DestroyScreenElement id = <id>
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			parent = root_window
			type = Element3d
			id = <id>
			model = <model>
			pos = <pos>
			CameraZ = -6
			scale = <scale>
			Tilt = <Tilt>
			active_viewport = <active_viewport>
			angleX = <angleX>
			NodeToPointTo = <Node>
			ObjectToPointTo = <Name>
		}
	endscript
	script SetArrowNode
		RunScriptOnScreenElement id = <id> SetElement3dNode params = {Node = <Node>}
	endscript
	script SetElement3dNode
		SetProps NodeToPointTo = <Node>
	endscript
	script FlyingLetters
		while
			CreateTestElement3d model = "Letter_S" pos = (100.0,100.0)
			CreateTestElement3d model = "Letter_K" pos = (180.0,100.0)
			CreateTestElement3d model = "Letter_A" pos = (260.0,100.0)
			CreateTestElement3d model = "Letter_T" pos = (340.0,100.0)
			CreateTestElement3d model = "Letter_E" pos = (420.0,100.0)
			wait 0.18000001 seconds
		repeat 100
	endscript
	script CreateTestElement3d
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			parent = root_window
			type = Element3d
			model = <model>
			pos = <pos>
			CameraZ = -10
			scale = 0.03
			AngVelX = Random(@-0.1 @-0.12 @-0.11 @0.11 @0.12 @0.1)
			AngVelY = Random(@-0.1 @-0.12 @-0.11 @0.11 @0.12 @0.1)
			AngVelZ = Random(@-0.1 @-0.12 @-0.11 @0.11 @0.12 @0.1)
		}
		RunScriptOnScreenElement id = <id> TestElement3d params = {pos = <pos>}
	endscript
	script TestElement3d
		DoMorph time = 0 pos = Random(@(0.0,0.0) @(-100.0,240.0) @(740.0,240.0) @(740.0,580.0))
		DoMorph time = 0.5 pos = <pos>
		DoMorph time = 1 pos = Random(@(-200.0,0.0) @(-200.0,240.0) @(840.0,240.0) @(840.0,580.0))
		wait 1 seconds
		Die
	endscript
