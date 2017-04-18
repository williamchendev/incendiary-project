///Draw

if (!instance_exists(oAnna)){
	instance_destroy();
}
if (oAnna.ammoload){
	instance_destroy();
}

if (alpha < 1){
	alpha += 0.02;
}

if (oAnna.shoot){
	var can_shoot = false;
	if (!oAnna.walking){
		if (oAnna.ammo > 0){
			var shoot_alpha = 0;
			if (oAnna.shoot_aim <= 3){
				draw_set_color(make_color_rgb(200, 200, 200));
				shoot_alpha = 0.4;
			}
			else {
				draw_set_color(c_black);
				shoot_alpha = 0.3;
			}
			draw_set_alpha(shoot_alpha * shoot_distance * alpha);
			draw_primitive_begin(pr_trianglefan);
	
			draw_vertex(oAnna.anna_x, oAnna.anna_y);
	
			var r;
			for (r = 0; r <= oAnna.shoot_aim; r++){
				draw_vertex(oAnna.anna_x + lengthdir_x(140, (shoot_direction - (oAnna.shoot_aim div 2)) + r), (oAnna.anna_y) + lengthdir_y(60, (shoot_direction - (oAnna.shoot_aim div 2)) + r));
			}
			draw_primitive_end();
			draw_set_alpha(1);
			draw_set_color(c_black);
			
			can_shoot = true;
		}
	}
	if (!can_shoot){
		alpha = 0;
	}
}
else {
	instance_destroy();
}