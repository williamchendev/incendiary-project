///PatrolScript();

var points = noone;

var found_patrol = noone;
var move_farther = true;

if (instance_exists(oPatrol)){
	while(found_patrol == noone){
		var patrol_inst = instance_find(oPatrol, irandom_range(0, instance_number(oPatrol) - 1));
		if (move_farther){
			if (instance_nearest(x, y, oPatrol) == patrol_inst){
				move_farther = false;
			}
			else {
				found_patrol = patrol_inst;
			}
		}
		else {
			found_patrol = patrol_inst;
		}
	}
}
points[0] = x;
points[1] = y;
if (found_patrol != noone){
	if (found_patrol.path != noone){
		var random_path_pos = random_range(0, 1);
		points[0] = path_get_x(found_patrol.path, random_path_pos);
		points[1] = path_get_y(found_patrol.path, random_path_pos);
	}
	else {
		points[0] = irandom_range(found_patrol.x, found_patrol.x + (found_patrol.sprite_width * found_patrol.image_xscale));
		points[1] = irandom_range(found_patrol.y, found_patrol.y + (found_patrol.sprite_height * found_patrol.image_yscale));
	}
}
return points;