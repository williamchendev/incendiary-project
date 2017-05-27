/// @description Step Event

var move = false;
var move_room = noone;

if (canmove){
	if (room_pathfind != noone){
		if (current_room == goal_room){
			move = true;
		}
		else {
			if (room_timer <= 0){
				if (behavior == "chase"){
					room_timer *= 0.5;
				}
				room_timer = room_reset_time;
				var temp_pre_room = 0;
				for (var c = 1; c < array_length_1d(room_pathfind); c++){
					if (rooms[room_pathfind[c]] == current_room){
						current_room = rooms[room_pathfind[c - 1]];
						temp_pre_room = c;
						break;
					}
				}
				for (var i = 0; i < instance_number(oRoom); i++){
					var temp_room = instance_find(oRoom, i);
					if (temp_room.room_type == rooms[room_pathfind[temp_pre_room]]){
						x = temp_room.move_x;
						y = temp_room.move_y;
						break;
					}
				}
			}
			else {
				room_timer -= room_spd;
				if (current_room == room){
					if (behavior == "chase"){
						if (instance_exists(oAnna)){
							x = oAnna.x;
							y = oAnna.y;
						}
					}
					else {
						if (instance_exists(oPatrol)){
							var patrol_xy = PatrolScript();
							x = patrol_xy[0];
							y = patrol_xy[1];
						}
					}
				}
			}
		}
	}
	else {
		move = true;
	}
	
	if (behavior == "chase"){
		if (goal_room != room){
			var found_chase_room = false;
			for (var c = 0; c < array_length_1d(rooms); c++){
				if (rooms[c] == room){
					move_room = c;
					found_chase_room = true;
				}
			}
			if (found_chase_room){
				goal_room = rooms[move_room];
				move = true;
			}
			else {
				behavior = "patrol";
				move = true;
			}
		}
	}
}
else {
	/*
	if (current_room == room){
		if (instance_exists(oPatrol)){
			var patrol_xy = PatrolScript();
			x = patrol_xy[0];
			y = patrol_xy[1];
		}
	}
	*/
}

if (move){
	if (behavior == "guard"){
		if (current_room != guard_room){
			for (var c = 0; c < array_length_1d(rooms); c++){
				if (rooms[c] == guard_room){
					move_room = c;
				}
			}
		}
	}
	else if (behavior == "patrol"){
		var temp_goal = 0;
		var temp_priority = room_priority[0];
		for (var k = 0; k < array_length_1d(room_priority); k++){
			var more_temp_priority = room_priority[k];
			if (temp_priority == noone){
				temp_priority = more_temp_priority;
			}
			else if (max(temp_priority, more_temp_priority) == more_temp_priority){
				temp_priority = more_temp_priority;
			}
				
			if (temp_priority == more_temp_priority){
				temp_goal = k;
			}
			room_priority[k] = irandom_range(0, 100);
		}
		goal_room = rooms[temp_goal];
		move_room = temp_goal;
	}
}

if (move){
	if (move_room != noone){
		var checks = noone;
		var temp_current = 0;
		for (var h = 0; h < array_length_1d(rooms); h++){
			checks[h] = false;
			if (current_room == rooms[h]){
				temp_current = h;
			}
		}
		room_pathfind = RoomPathFind(room_path, checks, temp_current, move_room);
		room_timer = room_reset_time;
	}
}

if (current_room == room){
	if (can_spawn){
		var inst_ai = instance_create_layer(x, y, "Player_Layer", oAI);
		
		if (behavior == "guard"){
			if (room == guard_room){
				inst_ai.x = guard_x;
				inst_ai.y = guard_y;
			}
		}
		
		inst_ai.karma = karma;
		inst_ai.creepy = creepy;
		inst_ai.nature = nature;
		inst_ai.behavior = behavior;
		inst_ai.vitality = vitality;
		
		inst_ai.canmove = canmove;

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
		
		//Guard
		inst_ai.guard_room = guard_room;
		inst_ai.guard_facing = guard_facing;
		inst_ai.guard_x = guard_x;
		inst_ai.guard_y = guard_y;

		//Path Finding
		inst_ai.path_redirect_range = path_redirect_range;

		inst_ai.follow = follow;
		inst_ai.follow_radius = follow_radius;
		inst_ai.follow_radius_p = follow_radius_p;

		//Rooms
		inst_ai.room_priority = room_priority;
		inst_ai.goal_room = goal_room;
		inst_ai.room_pathfind = room_pathfind;
		
		instance_destroy();
	}
}

can_spawn = true;