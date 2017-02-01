///Draw Event

if (sin_val < 1){
    sin_val += 0.007;
}
else {
    sin_val = 0;
}

var sin_draw = (sin(2 * pi * sin_val) + 1) / 2;

//Draw Bubble
draw_set_color(make_color_rgb(218, 219, 217));

if ((alpha >= 0.6) and prox){
    draw_set_alpha(1);
    draw_circle(x, y - 1, 6 + (3 * sin_draw), false);
	draw_set_color(make_color_rgb(230, 234, 227));
	draw_circle(x, y - 1, 6 + (3 * sin_draw), true);
    if (item != -1){
        draw_sprite(sInventoryItems, item, x + 1, y);
    }
}
else {
    draw_set_alpha(alpha);
    draw_circle(x, y - 1, 6 + (3 * sin_draw), false);
	draw_set_alpha(alpha / 0.6);
	draw_set_color(make_color_rgb(230, 234, 227));
	draw_circle(x, y - 1, 6 + (3 * sin_draw), true);
    if (item != -1){
		draw_set_alpha(alpha);
        draw_sprite(sInventoryItems, item, x + 1, y);
    }
}

draw_set_color(c_black);
draw_set_alpha(1);

