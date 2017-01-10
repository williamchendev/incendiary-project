/// Step

ControlScript();
if (keyboard_check_pressed(vk_f11)){
    window_set_fullscreen(!window_get_fullscreen());
}

//If OS is paused
if (os_is_paused()){
	GamePauseScript();
}

//Menu
cursor_num = -1;
if (abs(140 - mouse_y) < 12){
	var string_w = string_width("Play") / 2;
	var abs_w = abs(60 + string_w - mouse_x);
	if (abs_w < string_w + 8){
		cursor_num = 1;
	}
}

if (mouse_click){
	if (cursor_num == 1){
		room_goto(room_template);
	}
	else if (mouse_x > 464){
		if (mouse_y < 16){
			GamePauseScript();
		}
	}
}