///PatrolScript();

var points = noone;
points[0] = x;
points[1] = y;

if (instance_exists(oPatrol)){
	with(oPatrol){
		if (path != noone){
			var path_pos = random_range(0, 1);
			points[0] = path_get_point_x(path, path_pos);
			points[1] = path_get_point_y(path, path_pos);
		}
		else if (patrol_areas != noone){
			var random_patrol_area = irandom_range(0, array_length_1d(patrol_areas) - 1);
			points[0] = irandom_range(patrol_areas[random_patrol_area].bbox_left, patrol_areas[random_patrol_area].bbox_right);
			points[1] = irandom_range(patrol_areas[random_patrol_area].bbox_top, patrol_areas[random_patrol_area].bbox_bottom);
		}
	}
}
return points;