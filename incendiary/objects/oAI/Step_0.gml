/// @description Behavior

///Settings
depth = -1 * round(y);
if (sign(image_xscale) != 0){
	sight = 90 + (90 * sign(image_xscale));
}
if (instance_exists(oLighting)){
	sight_wide = round(((clamp(1 - oLighting.alpha, 0, 1) * 0.3) * sight_angle) + (0.7 * sight_angle));
}

///AI Behavior
var move = false;

//Sight
var light_c = 0;
if (!anna_vis){
	if (instance_exists(oAnna)){
		if (point_distance(0, 0, abs(x - oAnna.x), abs(y - oAnna.y) * 4) < aware_radius){
			var sight_v = sight + sight_tilt;
			if (abs(sight_v - point_direction(0, 0, (x - oAnna.x) * 0.16, y - oAnna.y)) < sight_wide){
				light_c = 0.05;
				if (point_distance(0, 0, abs(x - oAnna.x), abs(y - oAnna.y) * 4) < sight_radius){
					light_c = max(light_c, ((oAnna.visibility * 0.5) + 0.5) * sqr(1 - (point_distance(0, 0, abs(x - oAnna.x), abs(y - oAnna.y) * 4) / sight_radius)));
				}
			}
			light_c = clamp(light_c, 0, 1);
		}
	}
}
else {
	if (instance_exists(oAnna)){
		if (point_distance(0, 0, abs(x - oAnna.x), abs(y - oAnna.y) * 4) < aware_radius){
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
		path_end();
		walking = false;
		
		if (karma < -0.5){
			if (anna_vis){
				behavior = "chase";
			}
		}
		else if (karma < -0.1){
			if (anna_vis){
				if (creepy >= 0.7){
					behavior = "follow";
					follow = oAnna;
				}
			}
		}
	}
	else if (behavior == "follow"){
		if (follow != noone){
			var should_move = false;
			if (follow == oAnna){
				if (karma < 0.5){
					if (anna_vis){
						should_move = true;
						if (karma < -0.5){
							path_end();
							walking = false;
							behavior = "chase";
							follow = noone;
							should_move = false;
						}
					}
					else {
						path_end();
						walking = false;
						follow = noone;
						
						if (karma < -0.5){
							if (nature == "alone"){
								behavior = choose("patrol", "follow");
							}
							else {
								behavior = "patrol";
							}
						}
						else {
							if (nature == "alone"){
								behavior = choose("idle", "search");
							}
							else if (nature == "support"){
								behavior = choose("idle", "follow", "search");
							}
							else if (nature == "leader"){
								behavior = choose("search", "patrol");
							}
						}
					}
				}
				else {
					should_move = true;
				}
			}
			else {
				should_move = true;
				if (anna_vis){
					if (karma < -0.5){
						path_end();
						walking = false;
						behavior = "chase";
						follow = noone;
						should_move = false;
					}
				}
			}
			
			if (should_move){
				if (point_distance(0, 0, abs(x - follow.x), abs(y - follow.y) * 4) > follow_radius){
					if (!point_in_circle(follow.x - move_x, (follow.y - move_y) * 4, 0, 0, path_redirect_range)){
						move = true;
						move_x = follow.x;
						move_y = follow.y;
					}
				}
				else if (point_distance(0, 0, abs(x - follow.x), abs(y - follow.y) * 4) < round(follow_radius * follow_radius_p)){
					path_end();
					walking = false;
				}
			}
		}
		else {
			path_end();
			walking = false;
			//Find New Follow
		}
	}
	else if (behavior == "chase"){
		if (instance_exists(oAnna)){
			if (anna_vis){
				if (!point_in_circle(oAnna.x - move_x, (oAnna.y - move_y) * 4, 0, 0, path_redirect_range)){
					move = true;
					move_x = oAnna.x;
					move_y = oAnna.y;
				}
				if (point_in_circle(oAnna.x - x, (oAnna.y - y) * 4, 0, 0, combat_range)){
					canmove = false;
					attack = true;
					attack_timer = combat_delay;
				}
			}
			else {
				path_end();
				walking = false;
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
		//Secure Areas
	}
	else if (behavior == "search"){
		//Find Objects and scavenge
	}
}
else {
	if (path_index != -1){
        path_end();
    }
	if (attack){
		if (attack_timer <= 0){
			attack = false;
			canmove = true;
		}
		else {
			attack_timer--;
		}
	}
	walking = false;
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