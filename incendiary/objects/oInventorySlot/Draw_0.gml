///Draw Event

var draw_x = round(x);
var draw_y = round(y);

if (sin_val < 1){
    sin_val += 0.007;
}
else {
    sin_val = 0;
}

var sin_draw = (sin(2 * pi * sin_val) + 1) / 2;

//Draw Bubble
draw_set_color(make_color_rgb(200, 200, 200));

if ((alpha >= 0.6) and prox){
	draw_set_alpha(1);
    draw_circle(draw_x, draw_y, 6 + (3 * sin_draw), false);
	draw_set_color(c_white);
	draw_circle(draw_x, draw_y, 4.5, false);
	draw_set_color(make_color_rgb(41, 56, 79));
	draw_circle(draw_x, draw_y, 6 + (3 * sin_draw), true);
	
    if (item != -1){
        draw_sprite(sInventoryItems, item, draw_x + 1, draw_y + 1);
    }
	else {
		if (combo_item != -1){
			draw_set_alpha(0.7);
			draw_sprite(sInventoryItems, combo_item, draw_x + 1, draw_y + 1);
		}
	}
}
else {
    draw_set_alpha(alpha);
    draw_circle(draw_x, draw_y, 6 + (3 * sin_draw), false);
	draw_set_color(make_color_rgb(41, 56, 79));
	draw_circle(draw_x, draw_y, 6 + (3 * sin_draw), true);
    if (item != -1){
		draw_set_alpha(alpha / 0.6);
        draw_sprite(sInventoryItems, item, draw_x + 1, draw_y + 1);
    }
	else {
		if (combo_item != -1){
			draw_set_alpha((alpha / 0.6) * 0.7);
			draw_sprite(sInventoryItems, combo_item, draw_x + 1, draw_y + 1);
		}
	}
}

draw_set_color(c_black);
draw_set_alpha(1);

