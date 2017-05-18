/// @description Draw Latern

depth = -1 * (y + 6);

var sin_num = (sin(sin_val * 2 * pi) + 1) / 2;

draw_set_alpha(1);
draw_set_color(merge_color(colorA, colorB, clamp(color_flicker + sin_num, 0, 1)));
draw_rectangle(x - 3, y - 3, x + 2, y + 4, false);

draw_self();

draw_set_alpha(1);
draw_set_color(c_black);