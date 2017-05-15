/// @description Debug
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(DebugFont);

draw_self();
	
if (active){
	draw_text(x + 1, y + 1, "Active");
}
else {
	draw_text(x + 1, y + 1, "Inactive");
}
	
draw_set_color(c_black);