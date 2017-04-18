///Step

//Depth
depth = -1 * round(y);

//Movement
var follow_obj = false;

if (canmove){
	if (follow != noone){
		if (point_distance(0, 0, abs(x - follow.x), abs(y - follow.y) * 4) > follow_radius){
			if (point_distance(0, 0, abs(move_x - follow.x), abs(move_y - follow.y) * 4) > 20){
				move_x = round(follow.x);
				move_y = round(follow.y);
				follow_obj = true;
				if (follow == oAnna){
					if (oAnna.visibility < 0.2){
						follow_obj = false;
						move_x = x;
						move_y = y;
					}
				}
			}
		}
		else if (point_distance(0, 0, abs(x - follow.x), abs(y - follow.y) * 4) < round(follow_radius * follow_radius_p)) {
			path_end();
			walking = false;
		}
	}
}
else {
	if (path_index != -1){
        path_end();
    }
}

if (follow_obj){
	if (instance_exists(oAnna)){
		//Pathfinding on Click
		path_end();
            
		if (mp_grid_path(oAnna.grid, path, x, y, move_x, move_y, true)){
			var point_a = 0;
			var point_b = 2;
                
			while (point_b < path_get_number(path)){
			    if (!collision_line(path_get_point_x(path, point_a), path_get_point_y(path, point_a), path_get_point_x(path, point_b),path_get_point_y(path, point_b), oSolid, false, true) and (point_b < path_get_number(path) - 1)){
			        point_b += 1;
			    }
			    else {
			        repeat((point_b - 2) - point_a){
			            path_delete_point(path, point_a + 1);
			        }
                        
			        point_a += 1;
			        point_b = point_a + 2;
			    }
			}
                
			path_delete_point(path, path_get_number(path) - 2);
                
			path_start(path, spd, path_action_stop, true);
			path_set_kind(path, 0);
			walking = true;
		}
	}
}