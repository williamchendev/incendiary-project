/// @description Step

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
			hit_x += (inst_temp.x - hit_x) * 0.5;
			hit_y += (inst_temp.y - hit_y) * 0.1;
			
			for (var p = 0; p < array_height_2d(inst_temp.hit_p); p++){
				if (!inst_temp.hit_p[p, 0]){
					inst_temp.hit_p[p, 0] = true;
					inst_temp.hit_p[p, 1] = irandom_range(0, 15);
					inst_temp.hit_p[p, 2] = round(hit_x) - inst_temp.x;
					inst_temp.hit_p[p, 3] = round(hit_y) - inst_temp.y;
					break;
				}
				if (p == array_height_2d(inst_temp.hit_p) - 1){
					inst_temp.hit_p[p + 1, 0] = true;
					inst_temp.hit_p[p + 1, 1] = irandom_range(0, 15);
					inst_temp.hit_p[p + 1, 2] = round(hit_x) - inst_temp.x;
					inst_temp.hit_p[p + 1, 3] = round(hit_y) - inst_temp.y;
					break;
				}
			}
			
			if (!inst_temp.dead){
				if (inst_temp.behavior != "cutscene"){
					for (var q = 0; q < irandom_range(1, 4); q++){
						instance_create_depth(round(hit_x), round(hit_y), inst_temp.depth - irandom_range(1, 3), oBlood);
					}
					inst_temp.vitality--;
					inst_temp.karma = -1;
					inst_temp.behavior = "chase";
					inst_temp.anna_vis = true;
					inst_temp.alert = 1;
					inst_temp.attack_move = true;
				}
			}
			instance_destroy();
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