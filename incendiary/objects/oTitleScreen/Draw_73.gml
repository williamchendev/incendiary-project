/// Draw End

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