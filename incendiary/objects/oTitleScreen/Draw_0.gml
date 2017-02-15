if (colorB == c_white){
	event_inherited();
}
else {
	//Surface Exists
	if (!surface_exists(light_surface)){
		light_surface = surface_create(room_width, room_height);
	}
	if (!surface_exists(temp1_surface)){
		temp1_surface = surface_create(room_width, room_height);
	}
	if (!surface_exists(temp2_surface)){
		temp2_surface = surface_create(room_width, room_height);
	}
	if (!surface_exists(final_surface)){
		final_surface = surface_create(room_width, room_height);
	}

	gpu_set_blendmode_ext(bm_src_alpha, bm_inv_src_color);
	draw_set_color(c_black);
	draw_set_alpha(1);

	//Clear Lights with Black
	surface_set_target(temp1_surface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();

	surface_set_target(temp2_surface);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();

	//Main Light Source
	surface_set_target(temp1_surface);

	with (oLight){
		draw_circle(x, y, light_size, false);
	}

	surface_reset_target();

	//Secondary Light Source
	surface_set_target(temp2_surface);

	with (oLight){
		draw_circle(x, y, light_size_outline, false);
	}

	surface_reset_target();

	//Draw Final Layer
	surface_set_target(final_surface);
	draw_clear_alpha(c_black, 0);

	gpu_set_blendmode(bm_max);
	draw_surface_ext(temp2_surface, 0, 0, 1, 1, 0, c_white, secondary_light_alpha);
	draw_surface_ext(temp1_surface, 0, 0, 1, 1, 0, c_white, main_light_alpha);

	surface_reset_target();
	gpu_set_blendmode(bm_normal);

	//Draw Light Layer
	surface_set_target(light_surface);
	draw_clear(c_white);

	gpu_set_blendmode(bm_subtract);
	draw_surface_ext(final_surface, 0, 0, 1, 1, 0, c_white, 1);

	surface_reset_target();
	gpu_set_blendmode(bm_normal);

	//Draw Surface
	draw_surface_ext(light_surface, 0, 0, 1, 1, 0, c_white, clamp(alpha, 0, 1));

	//Reset
	draw_set_color(c_black);
	draw_set_alpha(1);
}