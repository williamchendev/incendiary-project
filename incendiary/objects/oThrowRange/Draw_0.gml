///Draw

if (!instance_exists(oAnna)){
	instance_destroy();
}

if (oAnna.throw){
	draw_set_alpha(clamp(0.6 - ((oAnna.inside_throw_distance * 0.3) + 0.1), 0, 0.4));
	var color = c_red;
	if (oAnna.canthrow1){
		if (oAnna.canthrow2){
			if (oAnna.inside_throw_distance <= 1){
				if (oAnna.outside_throw_distance >= 1){
					color = c_green;
				}
			}
		}
		else {
			draw_set_alpha(0);
		}
	}
	else {
		draw_set_alpha(0);
	}
	draw_set_color(color);
	draw_ellipse(oAnna.mouse_scale_x - 8, oAnna.mouse_scale_y - 5, oAnna.mouse_scale_x + 8, oAnna.mouse_scale_y + 5, false);
	draw_set_alpha(1);
	draw_set_color(c_black);
}
else {
	instance_destroy();
}