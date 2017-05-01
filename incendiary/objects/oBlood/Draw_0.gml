///Draw

draw_set_alpha(1);

if (grounded){
	draw_sprite(sBlood, size, x, y);
}
else {
	draw_set_color(make_color_rgb(127, 25, 45));
	draw_circle(x, y, 3, false);
}

draw_set_color(c_black);