/// @description Behavior

///Settings
depth = -1 * round(y);
if (path_index != -1){
	if (path_position <= 0.99){
		sight = point_direction(path_get_x(path_index, path_position + 0.01), path_get_y(path_index, path_position + 0.01), path_get_x(path_index, path_position), path_get_y(path_index, path_position));
	}
}
else {
	if (stand_still){
		if (sign(image_xscale) != 0){
			sight = (90 + (90 * sign(image_xscale))) + (sight_tilt * sin(sin_val * 2 * pi));
		}
	}
}
if (instance_exists(oLighting)){
	sight_wide = round(((clamp(1 - oLighting.alpha, 0, 1) * 0.3) * sight_angle) + (0.7 * sight_angle));
}
else {
	sight_wide = sight_angle;
}

///AI Behavior
var move = false;

//Sight
var light_c = 0;
if (!anna_vis){
	if (instance_exists(oAnna)){
		//Sight Settings
		sight_track = abs(sight_track mod 360);
		if (sight < 0){
			sight = 360 + sight;
		}
		else if (sight > 360){
			sight = sight - 360;
		}
		sight = clamp(sight, 0, 360);
		var in_sight_vis = false;
		var anna_angle = point_direction(0, 0, (x - oAnna.x) * 0.25, y - (oAnna.y));
		
		//Sight Visible
		if (point_distance(0, 0, abs(x - oAnna.x), abs(y - oAnna.y) * 4) < sight_radius){
			if (abs(sight_track - anna_angle) < sight_wide / 2){
				in_sight_vis = true;
			}
			else if (sight_track < sight_wide / 2){
				if (abs((360 - sight_track) - anna_angle) < sight_wide / 2){
					in_sight_vis = true;
				}
			}
			else if (sight_track > 360 - (sight_wide / 2)){
				if (abs(anna_angle - (sight_track - 360)) < sight_wide / 2){
					in_sight_vis = true;
				}
			}
		}
		
		//Sight Lighting & Visibility Variable
		var sight_track_spd = 0.03;
		if (in_sight_vis){
			light_c = 0.05;
			sight_track_spd = 0.08;
			if (point_distance(0, 0, abs(x - oAnna.x), abs(y - oAnna.y) * 4) < (sight_radius * sight_radius_p)){
				sight_track_spd = 0.15;
				light_c = max(light_c, ((oAnna.visibility * 0.5) + 0.5) * sqr(1 - (point_distance(0, 0, abs(x - oAnna.x), abs(y - oAnna.y) * 4) / sight_radius)));
				if (point_distance(0, 0, abs(x - oAnna.x), abs(y - oAnna.y) * 4) < sight_alert_radius){
					alert = 1;
				}
			}
			sight = anna_angle;
		}
		else {
			if (point_distance(0, 0, abs(x - oAnna.x), abs(y - oAnna.y) * 4) < (sight_radius * sight_radius_p)){
				if (sign(oAnna.x - x) == image_xscale){
					sight_track_spd = 0.03;
					sight = anna_angle;
				}
			}
		}
		
		//Sight & Sight Tracking
		if (((360 - sight_track) + sight) < (sight_track - sight)){
			sight_track += ((sight + 360) - sight_track) * sight_track_spd;
			if (sight_track >= 360){
				sight_track = sight_track - 360;
			}
		}
		else if ((sight - sight_track) > ((360 - sight) + sight_track)){
			sight_track += ((sight - 360) - sight_track) * sight_track_spd;
			if (sight_track < 0){
				sight_track = sight_track + 360;
			}
		}
		else {
			sight_track += (sight - sight_track) * sight_track_spd;
		}
		
		light_c = clamp(light_c, 0, 1);
	}
}
else {
	if (instance_exists(oAnna)){
		if (point_distance(0, 0, abs(x - oAnna.x), abs(y - oAnna.y) * 4) < sight_radius){
			light_c = 1;
			sight = point_direction(0, 0, (x - oAnna.x) * 0.2, y - (oAnna.y));
		}
	}
	sight_track = sight;
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

//Knowledge
current_room = room;
if (behavior != "chase"){
	attack_move = true;
}

//Behavior
if (canmove){
	if (behavior == "distracted"){
		spd = walk_spd;
		if (point_distance(move_x, move_y, distracted_x, distracted_y) <= 0){
			if (point_distance(x, y, move_x, move_y) <= 3){
				path_end();
				walking = false;
				behavior = temp_behavior;
				if (string_count(behavior, "idle follow chase patrol search guard cutscene dead") != 1){
					behavior = "patrol";
				}
			}
		}
		else {
			if (point_distance(x, y, move_x, move_y) <= 3){
				path_end();
				walking = false;
				if (patrol_time <= 0){
					move = true;
					move_x = distracted_x;
					move_y = distracted_y
				}
				else {
					patrol_time--;
				}
			}
			else {
				move = true;
				patrol_time = patrol_switch;
			}
		}
		
		if (anna_vis){
			behavior = "chase";
		}
	}
	else if (behavior == "idle"){
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
		spd = walk_spd;
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
			var found_follow = false;
			if (nature == "support"){
				for (var i = 0; i < instance_number(oAI); i++){
					var temp_follow_inst = instance_find(oAI, i);
					if (temp_follow_inst.nature == "leader"){
						found_follow = true;
						follow = temp_follow_inst;
						break;
					}
				}
			}
			if (!found_follow){
				behavior = choose("patrol", "search", "idle");
			}
		}
	}
	else if (behavior == "chase"){
		spd = run_spd;
		if (instance_exists(oAnna)){
			if (anna_vis){
				angry = angry_reset;
				for (var i = 0; i < instance_number(oAI); i++){
					with (instance_find(oAI, i)){
						if (point_distance(x, y, other.x, other.y)){
							if (other.karma < 0.8){
								other.karma = karma;
								other.room_behavior = "chase";
								other.angry = other.angry_reset;
								other.anna_vis = true;
							}
						}
					}
				}
			}
			else {
				if (angry > 0){
					angry--;
				}
			}
			
			if (angry > 0){
				if (!point_in_circle(oAnna.x - move_x, (oAnna.y - move_y) * 4, 0, 0, path_redirect_range)){
					move = true;
					move_x = oAnna.x;
					move_y = oAnna.y;
				}
				if (attack_move){
					move = true;
					move_x = oAnna.x;
					move_y = oAnna.y;
					move_x_p = move_x - 1;
					move_y_p = move_y - 1;
					attack_move = false;
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
		spd = walk_spd;
		var should_move = false;
		var pathfind = false;
		
		if (current_room == goal_room){
			if (patrol_count <= 0){
				pathfind = true;
				patrol_count = clamp(irandom_range(patrol_checks - 2, patrol_checks + 2), 0, patrol_checks + 2);
			}
			else {
				if (patrol_time <= 0){
					should_move = true;
					patrol_count--;
					patrol_time = irandom_range(round(patrol_switch * 0.6), round(patrol_switch * 1.4));
				}
				else {
					if (point_distance(x, y, patrol_x, patrol_y) < 2){
						patrol_time--;
					}
				}
			}
		}
		else {
			if (room_pathfind != noone){
				should_move = true;
			}
			else {
				pathfind = true;
			}
		}
		
		if (anna_vis){
			if (karma < -0.2){
				behavior = "chase";
			}
			else if (karma < 0){
				if (creepy > 0.8){
					behavior = "follow";
					follow = oAnna;
				}
			}
		}
		
		if (pathfind){
			if (rooms != noone){
				var checks = noone;
				var temp_current = 0;
				for (var h = 0; h < array_length_1d(rooms); h++){
					checks[h] = false;
					if (rooms[h] == current_room){
						temp_current = h;
					}
				}
				var temp_goal = 0;
				var temp_priority = room_priority[0];
				for (var h = 0; h < array_length_1d(room_priority); h++){
					var more_temp_priority = room_priority[h];
					if (max(temp_priority, more_temp_priority) == more_temp_priority){
						temp_priority = more_temp_priority;
					}
				
					if (temp_priority == more_temp_priority){
						temp_goal = h;
					}
					room_priority[h] = irandom_range(0, 100);
				}
				goal_room = rooms[temp_goal];
				room_pathfind = RoomPathFind(room_path, checks, temp_current, temp_goal);
				should_move = true;
			}
		}
		if (should_move){
			if (current_room != goal_room){
				var temp_move_room = 0;
				for (var i = 1; i < array_length_1d(room_pathfind); i++){
					if (rooms[room_pathfind[i]] == current_room){
						temp_move_room = i - 1;
						break;
					}
				}
				for (var i = 0; i < instance_number(oRoom); i++){
					var inst_room = instance_find(oRoom, i);
					if (inst_room.room_type == rooms[room_pathfind[temp_move_room]]){
						move = true;
						if (inst_room.click){
							move_x = inst_room.move_x;
							move_y = inst_room.move_y;
						}
						else {
							move_x = inst_room.x;
							move_y = inst_room.y;
						}
						break;
					}
				}
			}
			else if (instance_exists(oPatrol)){
				move = true;
				var patrol_move_check = 10;
				while (patrol_move_check > 0){
					var patrol_xy = PatrolScript();
					move_x = patrol_xy[0];
					move_y = patrol_xy[1];
					if (point_distance(x, y, move_x, move_y) > 64){
						patrol_move_check = -1;
					}
				}
				patrol_x = move_x;
				patrol_y = move_y;
			}
		}
	}
	else if (behavior == "search"){
		//Find Objects and scavenge
		spd = walk_spd;
		behavior = "patrol";
	}
	else if (behavior == "guard"){
		if (!anna_vis){
			spd = walk_spd;
			var pathfind = false;
		
			if (room != guard_room){
				if (goal_room != guard_room){
					pathfind = true;
				}
			}
			else {
				if (point_distance(x, y, guard_x, guard_y) > 3){
					move = true;
					move_x = guard_x;
					move_y = guard_y
				}
				else {
					path_end();
					walking = false;
					if (stand_still){
						if (guard_facing != 0){
							image_xscale = sign(guard_facing);
						}
					}
				}
			}
		
			if (pathfind){
				if (rooms != noone){
					var checks = noone;
					var temp_goal = 0;
					var temp_current = 0;
					for (var h = 0; h < array_length_1d(rooms); h++){
						checks[h] = false;
						if (rooms[h] == guard_room){
							temp_goal = h;
						}
						if (rooms[h] == current_room){
							temp_current = h;
						}
					}
					goal_room = guard_room;
					room_pathfind = RoomPathFind(room_path, checks, temp_current, temp_goal);
				
					var temp_move_room = 0;
					for (var i = 0; i < array_length_1d(room_pathfind); i++){
						if (rooms[room_pathfind[i]] == current_room){
							if (i > 0){
								temp_move_room = room_pathfind[i - 1];
							}
							break;
						}
					}
					for (var i = 0; i < instance_number(oRoom); i++){
						var inst_room = instance_find(oRoom, i);
						if (inst_room.room_type == rooms[temp_move_room]){
							move = true;
							if (inst_room.click){
								move_x = inst_room.move_x;
								move_y = inst_room.move_y;
							}
							else {
								move_x = inst_room.x;
								move_y = inst_room.y;
							}
							break;
						}
					}
				}
			}
		}
		else {
			spd = run_spd;
			if (instance_exists(oAnna)){
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
		}
	}
	else if (behavior == "cutscene"){
		//Cutscene
		spd = walk_spd;
		anna_vis = true;
		var cutscene_move = true;
		if (move_x == cutscene_x){
			if (move_y == cutscene_y){
				cutscene_move = false;
			}
		}
		if (cutscene_move){
			move_x = cutscene_x;
			move_y = cutscene_y;
			move = true;
		}
	}
	else {
		draw_ui = false;
		if (!dead){
			path_end();
			walking = false;
			for (var q = 0; q < array_height_2d(hit_p); q++){
				hit_p[q, 0] = false;
			}
			canmove = false;
			dead = true;
			global.kills += 1;
			image_index = 0;
		}
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
		if (point_distance(move_x, move_y, move_x_p, move_y_p) > 0){
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
			else {
				if (behavior == "distracted"){
					behavior = temp_behavior;
				}
			}
			move_x_p = move_x;
			move_y_p = move_y;
		}
	}
}

//Collision Checking
if (position_meeting(x, y, oSolid)){
	for (var k = 0; k < 5; k++){
		if (!position_meeting(x + k, y, oSolid) and position_meeting(x + k, y, oMove)){
			x = x + k;
			break;
		}
		else if (!position_meeting(x - k, y, oSolid) and position_meeting(x - k, y, oMove)){
			x = x - k;
			break;
		}
		else if (!position_meeting(x, y + k, oSolid) and position_meeting(x, y + k, oMove)){
			y = y + k;
			break;
		}
		else if (!position_meeting(x, y - k, oSolid) and position_meeting(x, y - k, oMove)){
			y = y - k;
			break;
		}
	}
}

//Death and Bleeding
if (vitality <= 0){
	behavior = "dead";
}
else {
	if (hit_p[0, 0]){
		if (bleed <= 0){
			bleed = random_range(100 * vitality, 260 * vitality);
			instance_create_depth(x + hit_p[0, 2], y + hit_p[0, 3], depth - irandom_range(1, 3), oBlood);
		}
		else {
			bleed--;
		}
	}
}

//Sin val
if (sin_val < 1){
	sin_val += 0.002;
}
else {
	sin_val = 0;
}