/// @description Debug

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(DebugFont);

for (var l = 0; l < array_length_1d(room_pathfind); l++){
	draw_text(x, y + (l * 7), string(room_pathfind[l]));
}

draw_text(x, y - 7, debug_text);
	
draw_set_color(c_black);