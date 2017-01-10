///Step Event

ControlScript();
if (keyboard_check_pressed(vk_f11)){
    window_set_fullscreen(!window_get_fullscreen());
}

//Window Scale
window_scale = round(((window_get_width() / 480) + (window_get_height() / 270)) / 2);

//Dog Fluff Var
dog_fluff_text = "";
if (global.dog_fluff == 0){
	dog_fluff_text = "Fluffy";
}
else if (global.dog_fluff == 1){
	dog_fluff_text = "Fluffier";
}
else if (global.dog_fluff == 2){
	dog_fluff_text = "Fluffiest";
}

//Cursor
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);

cursor_num = -1;
if (abs((view_y + 60) - mouse_y) < 8){
	if (abs((view_x + 120 + (string_width("Fullscreen: " + BooleanTextScript(window_get_fullscreen())) / 2)) - mouse_x) < (string_width("Fullscreen: " + BooleanTextScript(window_get_fullscreen())) / 2) + 6){
		cursor_num = 0;
	}
}
else if (abs((view_y + 76) - mouse_y) < 8){
	if (!window_get_fullscreen()){
		var string_w = string_width("Scale: x" + string(window_scale)) / 2;
		var abs_w = abs(view_x + 120 + string_w - mouse_x);
		if (abs_w < string_w + 6){
			cursor_num = 1;
		}
	}
	else {
		var string_w = string_width("Scale: n/a") / 2;
		var abs_w = abs(view_x + 120 + string_w - mouse_x);
		if (abs_w < string_w + 6){
			cursor_num = 1;
		}
	}
}
else if (abs((view_y + 92) - mouse_y) < 8){
	var string_w = string_width("Music Volume: " + string(global.music_vol)) / 2;
	var abs_w = abs(view_x + 120 + string_w - mouse_x);
	if (abs_w < string_w + 6){
		cursor_num = 2;
	}
}
else if (abs((view_y + 108) - mouse_y) < 8){
	var string_w = string_width("SFX Volume: " + string(global.sfx_vol)) / 2;
	var abs_w = abs(view_x + 120 + string_w - mouse_x);
	if (abs_w < string_w + 6){
		cursor_num = 3;
	}
}
else if (abs((view_y + 124) - mouse_y) < 8){
	var string_w = string_width("Dog Fluffiness: " + dog_fluff_text) / 2;
	var abs_w = abs(view_x + 120 + string_w - mouse_x);
	if (abs_w < string_w + 6){
		cursor_num = 4;
	}
}
else if (abs((view_y + 140) - mouse_y) < 8){
	var string_w = string_width("Resume") / 2;
	var abs_w = abs(view_x + 120 + string_w - mouse_x);
	if (abs_w < string_w + 6){
		cursor_num = 5;
	}
}

//Menu
if (mouse_click){
	if (cursor_num == 0){
		window_set_fullscreen(!window_get_fullscreen());
	}
	else if (cursor_num == 1){
		if (!window_get_fullscreen()){
			var window_w = 0;
			var window_h = 0;
			if (window_scale < 3){
				window_w = ((window_scale + 1) * 480);
				window_h = ((window_scale + 1) * 270);
			}
			else {
				window_w = 480;
				window_h = 270;
			}
		
			//surface_resize(application_surface, window_w, window_h);
			window_set_size(window_w, window_h);
			window_set_position(clamp((display_get_width() - window_w) / 2, 10, display_get_width() - 10), clamp((display_get_height() - window_h) / 2, 40, display_get_height() - 40));
		}
	}
	else if (cursor_num == 2){
	
	}
	else if (cursor_num == 3){
	
	}
	else if (cursor_num == 4){
		if (global.dog_fluff < 2){
			global.dog_fluff++;
		}
		else {
			global.dog_fluff = 0;
		}
	}
	else if (cursor_num == 5){
		instance_destroy();
		instance_activate_all();
	}
}