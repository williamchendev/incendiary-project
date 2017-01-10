/// Draw End

//Menu
draw_sprite(sMenu, 0, 464, 0);

//Escape Key
if (escape){
	global.escape_game++;
}

if (global.escape_game != -1){
	draw_set_font(RegularFont);
	draw_set_color(make_colour_hsv(0, 0, 10));
	draw_sprite(sSandTimer, round(global.escape_game / 6), 0, 0);
	draw_text(16, 4, "Exit");
	
	if (!escape){
		global.escape_game = -1;
	}
	if (global.escape_game == 80){
		game_end();
	}
}

//Debug
if (debug_key){
    global.debug = !global.debug;
}

if (global.debug){
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_set_font(DebugFont);
    draw_set_halign(fa_left);
    
    draw_text(1, 1, "FPS: " + string(fps));
}

//Mouse
draw_sprite(sMenu, 1, mouse_x, mouse_y);