/// @description Step

var temp_spd = spd;
depth = -hit_y;

while(!hit and (temp_spd > 0)){
	if (!point_in_rectangle(hit_x, hit_y, 0, 0, room_width, room_height)){
		hit = true;
	}
	if (position_meeting(hit_x, hit_y, oEnemy)){
		hit = true;
		var inst_temp = instance_position(hit_x, hit_y, oEnemy);
		hit_x += (inst_temp.x - hit_x) * 0.3;
		hit_y += (inst_temp.y - hit_y) * 0.1;
	}
	hit_x += lengthdir_x(1, hit_direction);
	hit_y += lengthdir_y(1, hit_direction);
	temp_spd--;
}

life *= 0.95;
if (life <= 0.01){
	ParticleEndScript(partSmoke_sys);
	instance_destroy();
}