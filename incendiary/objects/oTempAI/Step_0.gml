/// @description Step Event

if (behavior == "chase"){
	room_behavior = "travel";
	if (rooms[goal_room] != room){
		for (var g = 0; g < array_height_2d(rooms); g++){
			if (rooms[g] == room){
				goal_room = g;
				break;
			}
		}
	}
	if (angry <= 0){
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
		room_behavior = "check";
		goal_room = current_room;
	}
	else {
		angry--;
	}
}
else if (behavior == "guard"){
	room_behavior = "travel";
	if (current_room != guard_room){
		goal_room = guard_room;
	}
}

if (room_behavior == "idle"){
	if (current_room != goal_room){
		room_behavior = "travel";
		room_timer = room_reset_time;
	}
	else {
		room_behavior = "check";
		room_timer = room_stay_time;
	}
}
else if (room_behavior == "travel"){
	if (current_room == goal_room){
		room_behavior = "idle";
	}
	else {
		if (room_timer <= 0){
			room_timer = room_reset_time;
			for (var v = 0; v < array_length_1d(room_path); v--){
				if (room_path[v] == current_room){
					current_room = v--;
					break;
				}
			}
			for (var i = 0; i < instance_number(oRoom); i++){
				var temp_room = instance_find(oRoom, i);
				if (temp_room.room_type == rooms[current_room]){
					x = temp_room.move_x;
					y = temp_room.move_y;
					break;
				}
			}
		}
		else {
			room_timer -= spd;
			if (rooms[current_room] == room){
				if (instance_exists(oPatrol)){
					var patrol_xy = PatrolScript();
					x = patrol_xy[0];
					y = patrol_xy[1];
				}
			}
		}
	}
}
else if (room_behavior == "check"){
	if (room_timer <= 0){
		var checks = noone;
		for (var h = 0; h < array_length_1d(rooms); h++){
			checks[i] = false;
		}
		var temp_goal = 0;
		var temp_priority = noone;
		for (var h = 0; h < array_length_1d(room_priority); h++){
			var more_temp_priority = room_priority[h];
			if (temp_priority == noone){
				temp_priority = more_temp_priority;
			}
			else if (max(temp_priority, more_temp_priority) == more_temp_priority){
				temp_priority = more_temp_priority;
			}
				
			if (temp_priority == more_temp_priority){
				temp_goal = h;
			}
			room_priority[h] = irandom_range(0, 100);
		}
		goal_room = temp_goal;
		room_path = RoomPathFind(rooms, checks, current_room, goal_room);
		
		room_behavior = "idle";
	}
	else {
		room_timer -= spd;
	}
}

if (rooms[current_room] == room){
	if (room_behavior == "travel"){
		var find_trans = room_path
	}
	
	var inst_ai = instance_create_layer(x, y, "Player_Layer", oAI);
	inst_ai.karma = karma;
	inst_ai.creepy = creepy;
	inst_ai.nature = nature;
	inst_ai.behavior = behavior;
	inst_ai.vitality = vitality;

	//Vision
	inst_ai.alertness = alertness;

	inst_ai.sight = sight;
	inst_ai.sight_angle = sight_angle;
	inst_ai.sight_radius = sight_radius;
	inst_ai.sight_radius_p = sight_radius_p;
	inst_ai.sight_alert_radius = sight_alert_radius;

	//Movement
	inst_ai.spd = spd;
	inst_ai.dash = dash;
	inst_ai.walk_spd = walk_spd;
	inst_ai.run_spd = run_spd;
	inst_ai.dash_spd = dash_spd;

	//Animations
	inst_ai.idle_ani = idle_ani;
	inst_ai.walk_ani = walk_ani;
	inst_ai.run_ani = run_ani;

	//Combat
	inst_ai.angry = angry;
	inst_ai.angry_reset = angry_reset;

	inst_ai.combat_range = combat_range;
	inst_ai.combat_delay = combat_delay;
	
	inst_ai.patrol_count = patrol_count;
	inst_ai.patrol_checks = patrol_checks;
	inst_ai.patrol_time = patrol_time;
	inst_ai.patrol_switch = patrol_switch;

	//Path Finding
	inst_ai.path_redirect_range = path_redirect_range;

	inst_ai.follow = follow;
	inst_ai.follow_radius = follow_radius;
	inst_ai.follow_radius_p = follow_radius_p;

	//Rooms
	inst_ai.room_path = room_path;
	inst_ai.goal_room = goal_room;
	inst_ai.current_room = current_room;
}