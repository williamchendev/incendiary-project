/// Draw Event

if (global.debug){
	draw_path(path, x, y, true);
	draw_text(x + 5, y - 5, string(path_get_point_speed(path, (max(x, start_x) - min(x, start_x)) / 2)));
}

draw_self();