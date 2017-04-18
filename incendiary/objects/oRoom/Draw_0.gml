/// @description Debug

draw_set_color(c_aqua);
draw_set_alpha(0.3);
	
draw_rectangle(x, y, x + (sprite_width * image_xscale), y + (sprite_height * image_yscale), false);
	
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(DebugFont);
	
if (active){
	draw_text(x + 1, y + 1, "Active");
}
else {
	draw_text(x + 1, y + 1, "Inactive");
}
	
draw_set_color(c_black);