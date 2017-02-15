/// @description Step

var temp_spd = spd;

if (!hit){
	for (i = 0; i < spd; i++){
		if (!point_in_rectangle(hit_x, hit_y, 0, 0, room_width, room_height)){
			hit = true;
		}
		hit_x += lengthdir_x(1, hit_direction);
		hit_y += lengthdir_y(1, hit_direction);
	}
}

life *= 0.95;
if (life <= 0.01){
	instance_destroy();
}