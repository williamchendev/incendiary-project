///@description Debug

if (global.debug){
	draw_set_color(c_purple);
	draw_set_alpha(0.6);
	if (path == noone){
		draw_rectangle(x, y, x + (sprite_width * image_xscale), y + (sprite_height * image_yscale), false);
	}
	else {
		draw_path(path, x, y, false);
	}
	draw_set_color(c_black);
	draw_set_alpha(1);
}