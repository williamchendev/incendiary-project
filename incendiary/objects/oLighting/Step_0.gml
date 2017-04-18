/// @description Visibility

if instance_exists(oAnna){
	var daylight = clamp((1 - alpha), 0, 1);
	var anna_vis = 0;

	for (var c = 0; c < 4; c++){
		var pow_vis = power(0.7, 2 - c);
		with (oLight){
			var rad_vis = round(light_size * (alpha + (power(0.5, c) * (1 - alpha))));
			if (point_in_circle(oAnna.anna_x, oAnna.anna_y - 22, x, y, rad_vis)){
				var dis_vis = 1 - (point_distance(oAnna.anna_x, oAnna.anna_y - 22, x, y) / light_size);
				var cur_vis = dis_vis * pow_vis;
				anna_vis = max(anna_vis, cur_vis);
			}
		}
	}
	if (oAnna.light){
		anna_vis = max(anna_vis, 0.5);
	}

	oAnna.visibility = clamp(anna_vis, sqr(daylight), 1);
}