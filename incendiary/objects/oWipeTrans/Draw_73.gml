///Draw Event

draw_set_alpha(1);
draw_set_color(color);

var length = 48;

var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
var draw_length = time - length;

if (image_xscale >= 0){
	draw_triangle(view_x + draw_length, view_y, view_x + draw_length, view_y + 270, view_x + draw_length + length, view_y + 270, false);
	draw_rectangle(view_x - length, view_y, view_x + draw_length, view_y + 270, false);
}
else {
	draw_triangle(480 + view_x - draw_length, view_y, 480 + view_x - draw_length, view_y + 270, 480 + view_x - draw_length - length, view_y, false);
	draw_rectangle(480 + view_x + length, view_y, 480 + view_x - draw_length, view_y + 270, false);
}

draw_set_color(c_black);

