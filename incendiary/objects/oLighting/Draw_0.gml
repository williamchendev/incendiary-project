/// @description Lighting Surfaces

layer = layer_get_id("GUI_Layer");

//Light Cosmetics
	if (instance_exists(oAnna)){
	if (sin_val >= 1){
		sin_val = 0;
	}
	else {
		sin_val += spd;
	}

	var sin_num = (sin(sin_val * 2 * pi) + 1) / 2;

	grow_num = (sin_num * grow) + (0.8 * (flicker_num / flicker));

	light_size = anna_size;

	if (light_alarm == 0){
		flicker_num = random_range(0, flicker);
		light_alarm = flicker_delay;
	}
	else {
		light_alarm--;
	}

	if (oAnna.light){
		if (anna_light < 1){
			anna_light *= 1.008;
		}
	}
	else {
		if (anna_light > 0.6){
			anna_light *= 0.992;
		}
	}
	anna_light = clamp(anna_light, 0.6, 1);
	anna_alpha = 0.3 * anna_light;
	anna_size = 56 * anna_light;
}

//Surface Exists
if (!surface_exists(light_surface)){
	light_surface = surface_create(room_width, room_height);
}
if (!surface_exists(temp_surface)){
	temp_surface = surface_create(room_width, room_height);
}
if (!surface_exists(final_surface)){
	final_surface = surface_create(room_width, room_height);
}

surface_set_target(final_surface);
draw_clear_alpha(c_black, 0);
surface_reset_target();

//Light Source Layer
for (var c = 0; c < 5; c++){
	var v_size = power(0.5, c);
	var v_alpha = power(0.5, 4 - c);
	
	//Reset
	gpu_set_blendmode_ext(bm_src_alpha, bm_inv_src_color);
	draw_set_color(c_black);
	draw_set_alpha(1);
	
	//Draw Temporary Layer
	surface_set_target(temp_surface);
	draw_clear_alpha(c_black, 0);
	
	with (oLight){
		draw_circle(x, y, round(light_size * (alpha + (v_size * (1 - alpha)))) + grow_num, false);
	}
	if (instance_exists(oAnna)){
		var draw_light = true;
		if (!oAnna.light){
			if (c > 2){
				draw_light = false;
			}
		}
		else {
			if (c > 3){
				draw_light = false;
			}
		}
		if (draw_light){
			draw_circle(oAnna.anna_x - 1, oAnna.anna_y - 22, round(light_size * (anna_alpha + (v_size * (1 - anna_alpha)))) + grow_num, false);
		}
	}
	
	surface_reset_target();
	
	//Draw Final Layer
	surface_set_target(final_surface);

	gpu_set_blendmode(bm_max);
	draw_surface_ext(temp_surface, 0, 0, 1, 1, 0, c_white, light_alpha * (0.2 + (v_alpha * 0.8)));

	surface_reset_target();
}

//Draw Light Layer
surface_set_target(light_surface);
draw_clear(c_black);

gpu_set_blendmode(bm_subtract);
draw_surface_ext(final_surface, 0, 0, 1, 1, 0, c_white, 1);

surface_reset_target();
gpu_set_blendmode(bm_normal);

//Draw Surface
var draw_light_alpha = alpha;
if (global.debug){
	draw_light_alpha = 0.3;
}
draw_surface_ext(light_surface, 0, 0, 1, 1, 0, c_white, clamp(draw_light_alpha, 0, 1));

//Reset
draw_set_color(c_black);
draw_set_alpha(1);