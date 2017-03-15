/// Draw Arc

var anna_x_pos = oAnna.anna_x;
var anna_y_pos = oAnna.anna_y - 20;

var canthrow1 = false;
var canthrow2 = false;
var inside_throw_distance = (sqr(oAnna.mouse_scale_x - anna_x_pos) / sqr(anna_throw_width) + sqr(oAnna.mouse_scale_y - anna_y_pos) / sqr(anna_throw_height));

if (instance_position(oAnna.mouse_scale_x, oAnna.mouse_scale_y, oMove) != noone){
	canthrow1 = true;
}
if (instance_position(oAnna.mouse_scale_x, oAnna.mouse_scale_y, oSolid) == noone){
	canthrow2 = true;
}

var max_arc_alpha = 0.2;
if (canthrow1){
	if (canthrow2){
		max_arc_alpha = 1;
	}
}
arc_alpha = clamp((1 - inside_throw_distance)+ 0.6, 0, max_arc_alpha);
DrawArcScript(anna_x_pos, anna_y_pos, oAnna.mouse_scale_x - 1, oAnna.mouse_scale_y - 2, make_color_rgb(155, 143, 141), c_white, arc_alpha, surface_arc_1, surface_arc_2);
draw_ellipse(anna_x_pos - anna_throw_width, anna_y_pos - anna_throw_height, anna_x_pos + anna_throw_width, anna_y_pos + anna_throw_height, true);