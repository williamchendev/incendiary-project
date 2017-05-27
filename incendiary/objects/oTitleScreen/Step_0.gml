/// Step

ControlScript();
if (keyboard_check_pressed(vk_f11)){
    window_set_fullscreen(!window_get_fullscreen());
}

//Menu
cursor_num = -1;
for (i = 0; i < array_height_2d(button_data); i++){
	if (abs((button_data[i, 2] + (string_height(button_data[i, 0]) / 2)) - mouse_scale_y) < 12){
		var string_w = string_width(button_data[i, 0]) / 2;
		var abs_w = abs(button_data[i, 1] + string_w - mouse_scale_x);
		if (abs_w < string_w + 8){
			cursor_num = i;
		}
	}
}

//Mouse Actions
if (mouse_click){
	if (start_time == 60){
		if(credits_show){
			if (cursor_num == 3){
				credits_show = false;
			}
		}
		else if (cursor_num == 0){
			if (start_time == wait){
				start_time = wait - 1;
				colorA = c_white;
				colorB = c_black;
			}
		}
		else if (cursor_num == 1){
			
		}
		else if (cursor_num == 2){
			game_end();
		}
		else if (cursor_num == 3){
			credits_show = true;
		}
	}
}

if (cursor_num == -1){
	outline_num = 0;
}

//Start
if (start_time == 0){
	room_goto(intro_room);
	//room_goto(living_room);
}
else if (start_time < wait){
	start_time--;
}