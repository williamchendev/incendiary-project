rooms = oPatrol.rooms;
room_path = oPatrol.room_path;

for (var k = 0; k < array_length_1d(rooms); k++){
	room_priority[k] = irandom_range(0, 100);
}

current_room = room;
debug_text = "";
move_x = 0;
move_y = 0;

var checks = noone;
var temp_current = 0;
for (var h = 0; h < array_length_1d(rooms); h++){
	checks[h] = false;
	if (rooms[h] == room){
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


var temp_move_room = 0;
for (var i = 0; i < array_length_1d(room_pathfind); i++){
	if (rooms[room_pathfind[i]] == current_room){
		if (i > 0){
			temp_move_room = room_pathfind[i - 1];
		}
		break;
	}
}
for (var m = 0; m < instance_number(oRoom); m++){
	var inst_room = instance_find(oRoom, m);
	if (inst_room.room_type == rooms[temp_move_room]){
		move = true;
		move_x = inst_room.x;
		move_y = inst_room.y;
		break;
	}
}
/*
}
else if (instance_exists(oPatrol)){
	move = true;
				
	var patrol_xy = PatrolScript();
	move_x = patrol_xy[0];
	move_y = patrol_xy[1];
}
*/

debug_text = "x: " + string(move_x) + " y: " + string(move_y) + " move_room: " + string(temp_move_room);