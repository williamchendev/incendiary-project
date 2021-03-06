///ShotScript(x, y, direction, spd, color);

var layer_found = false;
var temp_layer = "null";
while(!layer_found){
	temp_layer = "shotlayer_" + string(irandom_range(0, 99999));
	if (!layer_exists(temp_layer)){
		layer_found = true;
	}
} 

var inst_shot = instance_create_layer(argument0, argument1, layer_create(depth, temp_layer), oShot);
inst_shot.hit_direction = argument2;
inst_shot.spd = argument3;
inst_shot.hit_color = argument4;
inst_shot.layer_id = temp_layer;

with(inst_shot){
	//Create Particle Shape
	partSmoke = part_type_create();
	part_type_shape(partSmoke, pt_shape_disk);
	part_type_size(partSmoke, 0.05, 0.08, -0.0035, 0);
	part_type_color_mix(partSmoke, c_ltgray, merge_color(c_dkgray, c_ltgray, 0.6));
	part_type_alpha3(partSmoke, 1, 1, 0);
	part_type_speed(partSmoke, 0.2, 0.8, 0, 0);
	part_type_direction(partSmoke, hit_direction - 30, hit_direction + 30, 0, 1);
	part_type_orientation(partSmoke, 0, 359, 0, 0, 0);
	part_type_life(partSmoke, 10, 20);

	//Create Particle Emitter
	partSmoke_emit = part_emitter_create(partSmoke_sys);
	part_emitter_region(partSmoke_sys, partSmoke_emit, hit_x - 4, hit_x + 4, hit_y - 2, hit_y + 2, ps_shape_rectangle, ps_distr_linear);

	part_emitter_burst(partSmoke_sys, partSmoke_emit, partSmoke, 6);
}