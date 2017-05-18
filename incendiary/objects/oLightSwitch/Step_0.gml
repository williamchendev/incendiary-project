event_inherited();

action.x = x;
action.y = y - 14;

if (inspect_event){
	toggle = !toggle;
	toggled = true;
}

if (toggled){
	var new_light_alpha = 0;
	if (toggle){
		instance_create_layer(light_x, light_y, "Solids_Layer", light_type);
		new_light_alpha = alpha_on;
		image_index = 1;
	}
	else {
		with(light_type){
			instance_destroy();
		}
		new_light_alpha = alpha_off;
		image_index = 0;
	}
	if (instance_exists(oLighting)){
		oLighting.alpha = new_light_alpha;
	}
	toggled = false;
}