///Step

///Settings
depth = -1 * round(y);

///AI Behavior
var move = false;

//Sight
var light_c = 0;
if (!anna_vis){
	if (instance_exists(oAnna)){
		if (point_in_circle(x - oAnna.x, (y - oAnna.y) * 4, 0, 0, aware_radius)){
			var sight_v = sight + sight_tilt;
			if (abs(sight_v - point_direction(0, 0, x - oAnna.x, (y - oAnna.y) / 4)) < sight_angle){
				if (instance_exists(oLighting)){
					if (oLighting.alpha < 0.4){
						light_c = 1 - oLighting.alpha;
					}
				}
				if (point_in_circle(x - oAnna.x, (y - oAnna.y) * 4, 0, 0, sight_radius)){
					light_c = max(light_c, oAnna.visibility);
				}
			}
			light_c = clamp(light_c, 0, 1);
		}
	}
}
else {
	if (instance_exists(oAnna)){
		if (point_in_circle(x - oAnna.x, (y - oAnna.y) * 4, 0, 0, aware_radius)){
			light_c = 1;
		}
	}
}

if (light_c > 0){
	alert += alertness * light_c;
}
else {
	alert -= 0.007;
}
alert = clamp(alert, 0, 1);

if (anna_vis){
	if (alert == 0){
		anna_vis = false;
	}
}
else {
	if (alert == 1){
		anna_vis = true;
	}
}

//Behavior
if (canmove){
	if (behavior == "idle"){
		if (karma < -0.5){
			if (anna_vis){
				behavior = "chase";
			}
		}
		else if (karma < -0.2){
			if (anna_vis){
				behavior = "follow";
			}
		}
	}
	else if (behavior == "follow"){
		
	}
	else if (behavior == "chase"){
		if (instance_exists(oAnna)){
			if (anna_vis){
				if (!point_in_circle(oAnna.x - move_x, (oAnna.y - move_y) * 4, 0, 0, combat_range)){
					move = true;
					move_x = oAnna.x;
					move_y = oAnna.y;
				}
				
			}
			else {
				if (karma < -0.2){
					if (nature == "support"){
						behavior = choose("patrol", "follow");
					}
					else {
						behavior = "patrol";
					}
				}
				else if (karma >= -0.2){
					if (nature == "alone"){
						behavior = choose("idle", "search", "patrol");
					}
					else if (nature == "support"){
						behavior = choose("idle", "follow");
					}
					else if (nature == "leader"){
						behavior = choose("search", "patrol");
					}
				}
			}
		}
		else {
			behavior = "idle";
		}
	}
	else if (behavior == "patrol"){
	
	}
	else if (behavior == "search"){
	
	}
}
else {
	if (path_index != -1){
        path_end();
    }
}

//Movement
if (move){
	if (instance_exists(oAnna)){
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
/*

//Movement
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