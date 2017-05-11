///Step Event

if (path_position == 1){
	hit_ground = true;
}

if (hit_ground){
	with (instance_nearest(x, y, oAI)){
		move_x = other.x;
		move_y = other.y;
		distracted_x = x;
		distracted_y = y;
		temp_behavior = behavior;
		behavior = "distracted";
	}
	instance_destroy();
}

if (path_get_x(path, 1) > x){
	image_angle -= 6;
}
else {
	image_angle += 6;
}