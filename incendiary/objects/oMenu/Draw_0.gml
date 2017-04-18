///Draw Event

var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);

//Background
draw_set_alpha(0.6);
draw_set_color(c_black);

draw_rectangle(view_x - 10, view_y - 10, view_x + 490, view_y + 280, false);

//Text
draw_set_font(JoustFont);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(view_x + 240, 30, "Settings");

draw_set_font(RegularFont);
draw_set_halign(fa_left);

//Fullscreen
draw_text(view_x + 120, 60, "Fullscreen: " + BooleanTextScript(window_get_fullscreen()));
//Window Scale
if (window_get_fullscreen()){
	draw_text(view_x + 120, 76, "Scale: n/a");
}
else {
	draw_text(view_x + 120, 76, "Scale: x" + string(window_scale));
}
//Volume
draw_text(view_x + 120, 92, "Music Volume: " + string(global.music_vol));
draw_text(view_x + 120, 108, "SFX Volume: " + string(global.sfx_vol));
//Dog Fluffiness
draw_text(view_x + 120, 124, "Dog Fluffiness: " + dog_fluff_text);
//Exit
draw_text(view_x + 120, 140, "Resume");
draw_text(view_x + 120, 155, "Hold Esc to exit");

draw_set_valign(fa_top);

//Cursor
if (cursor_num != -1){
	draw_circle(view_x + 112, 55 + (cursor_num * 16), 3, false);
}

//Escape Key
if (escape){
	global.escape_game++;
}

if (global.escape_game != -1){
	draw_set_font(RegularFont);
	draw_set_color(make_colour_rgb(25, 25, 25));
	draw_sprite(sSandTimer, round(global.escape_game / 6), view_x, view_y);
	draw_text(view_x + 16, view_y + 4, "Exit");
	
	if (!escape){
		global.escape_game = -1;
	}
	if (global.escape_game == 80){
		game_end();
	}
}

draw_set_color(c_black);