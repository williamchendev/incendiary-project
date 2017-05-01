/// @description Step

if (enemy_hit != noone){
	layer_depth(layer_get_id(layer_id), enemy_hit.depth - 1);
}

var temp_spd = spd;

while(!hit and (temp_spd > 0)){
	layer_depth(layer_get_id(layer_id), -1 * round(hit_y));
	if (!point_in_rectangle(hit_x, hit_y, -32, -32, room_width + 64, room_height + 64)){
		hit = true;
	}
	if (position_meeting(hit_x, hit_y, oDestructible)){
		hit = true;
		var inst_temp = instance_position(hit_x, hit_y, oDestructible);
		hit_x += (inst_temp.x - hit_x) * 0.3;
		hit_y += (inst_temp.y - hit_y) * 0.1;
		layer_depth(layer_get_id(layer_id), inst_temp.depth - 1);
		enemy_hit = noone;
	}
	else if (position_meeting(hit_x, hit_y, oAI)){
		var inst_temp = instance_position(hit_x, hit_y, oAI);
		if (hit_y < inst_temp.y - 14){
			hit = true;
			hit_x += (inst_temp.x - hit_x) * 0.4;
			hit_y += (inst_temp.y - hit_y) * 0.1;
			layer_depth(layer_get_id(layer_id), inst_temp.depth - 1);
			
			enemy_hit = inst_temp;
			enemy_x = hit_x - inst_temp.x;
			enemy_y = hit_y - inst_temp.y;
			
			hit_image = irandom_range(0, 15);
			instance_create_depth(hit_x, hit_y, inst_temp.depth - 3, oBlood);
		}
	}
	hit_x += lengthdir_x(1, hit_direction);
	hit_y += lengthdir_y(1, hit_direction);
	temp_spd--;
}

if (hit){
	start_x += (hit_x - start_x) * 0.5;
	start_y += (hit_y - start_y) * 0.5;
}

life *= 0.99;
if (life <= 0.01){
	ParticleEndScript(partSmoke_sys);
	instance_destroy();
	layer_destroy(layer_get_id(layer_id));
}