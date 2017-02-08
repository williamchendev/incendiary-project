///Step Event

if (path_position == 1){
	hit_ground = true;
}

if (hit_ground){
	instance_destroy();
}

if (path_get_x(path, 1) > x){
	image_angle -= 6;
}
else {
	image_angle += 6;
}