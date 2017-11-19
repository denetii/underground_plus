
	script kill_panel_message_if_it_exists
		if ScreenElementExists id = <id>
			DestroyScreenElement id = <id>
		endif
	endscript
	script create_panel_message {text = "Default panel message"
			pos = (320.0,70.0)
			rgba = [144 32 32 100]
			font_face = small
			time = 1500
			z_priority = -5
			just = [center center]
		}
		if GotParam id
			kill_panel_message_if_it_exists id = <id>
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = textelement
			parent = root_window
			id = <id>
			font = <font_face>
			text = <text>
			scale = 1
			pos = <pos>
			just = <just>
			rgba = <rgba>
			z_priority = <z_priority>
			not_focusable
		}
		RecordPanelMessage <...>
		if GotParam style
			if GotParam params
				RunScriptOnScreenElement id = <id> <style> params = <params>
			else
				RunScriptOnScreenElement id = <id> <style> params = <...>
			endif
		else
			RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = {time = <time>}
		endif
	endscript
	script create_panel_sprite {pos = (320.0,60.0)
			rgba = [128 128 128 100]
			z_priority = -5
		}
		if GotParam id
			if ObjectExists id = <id>
				RunScriptOnScreenElement id = <id> kill_panel_message
			endif
		endif
		SetScreenElementLock id = root_window off
		CreateScreenElement {
			type = spriteelement parent = root_window
			texture = <texture>
			id = <id>
			scale = 1
			pos = <pos>
			just = [center center]
			rgba = <rgba>
			z_priority = <z_priority>
		}
		if GotParam style
			if GotParam params
				RunScriptOnScreenElement id = <id> <style> params = <params>
			else
				RunScriptOnScreenElement id = <id> <style> params = <...>
			endif
		else
			if GotParam time
				RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = {time = <time>}
			endif
		endif
	endscript
	script create_panel_block {text = "Default panel message"
			pos = (320.0,60.0)
			dims = (250.0,0.0)
			rgba = [144 32 32 100]
			font_face = small
			time = 2000
			just = [center center]
			internal_just = [center center]
			z_priority = -5
		}
		SetScreenElementLock id = root_window off
		if GotParam id
			if ObjectExists id = <id>
				DestroyScreenElement id = <id>
			endif
		endif
		CreateScreenElement {
			type = TextBlockElement
			parent = root_window
			id = <id>
			font = <font_face>
			text = <text>
			dims = <dims>
			pos = <pos>
			just = <just>
			internal_just = <internal_just>
			line_spacing = <line_spacing>
			rgba = <rgba>
			allow_expansion
			z_priority = <z_priority>
		}
		if GotParam style
			if GotParam params
				RunScriptOnScreenElement id = <id> <style> params = <params>
			else
				RunScriptOnScreenElement id = <id> <style> params = <...>
			endif
		else
			RunScriptOnScreenElement id = <id> panel_message_wait_and_die params = {time = <time>}
		endif
	endscript
	script panel_message_wait_and_die time = 1500
		wait <time>
		Die
	endscript
	script kill_panel_message
		Die
	endscript
	script hide_panel_message
		if ObjectExists id = <id>
			SetScreenElementProps {
				id = <id>
				hide
			}
		endif
	endscript
	script show_panel_message
		if ObjectExists id = <id>
			SetScreenElementProps {
				id = <id>
				unhide
			}
		endif
	endscript
	script destroy_panel_message
		if ObjectExists id = <id>
			<id>::Die
		endif
	endscript
	script panel_message_landing time = 1200
		SetProps font = newtrickfont just = [center top] rgba = [144 32 32 75]
		DoMorph time = 0 pos = (80.0,240.0) scale = 0
		DoMorph time = 0.5 scale = 0.69999999 alpha = 1.0
		wait <time>
		DoMorph time = 0.25 alpha = 0.0 scale = 0
		Die
	endscript
	script panel_message_loading
		SetProps font = small just = [center center] rgba = [128 200 128 70]
		DoMorph pos = (320.0,224.0) scale = 5 time = 0
		wait 5
		Die
	endscript
