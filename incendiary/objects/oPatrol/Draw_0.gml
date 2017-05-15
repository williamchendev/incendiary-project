///@description Debug

if (global.debug){
	draw_set_color(c_purple);
	draw_set_alpha(0.6);
	if (path == noone){
		for (var c = 0; c < array_length_1d(patrol_areas); c++){
			var inst_draw = patrol_areas[c];
			draw_rectangle(inst_draw.bbox_left, inst_draw.bbox_top, inst_draw.bbox_right, inst_draw.bbox_bottom, false);
		}
	}
	else {
		draw_path(path, x, y, false);
	}
	
	draw_set_alpha(1);
	draw_set_font(DebugFont);
	draw_set_color(c_white);
	for (var i = 0; i < array_length_1d(rooms); i++){
		draw_text(x, y + (7 * i), room_get_name(rooms[i]) + " " + string(i));
	}
}
draw_set_color(c_black);
draw_set_alpha(1);