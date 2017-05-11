///RoomPathFind(room_array, check_array, current_room, goal_room);
///@param room_array Array of Rooms to Pathfind
///@param check_array Array of Rooms Checkd
///@param current_room The current room
///@param goal_room Ending goal room

var path = noone;

var rooms_and_balances = argument0;

if (argument2 == argument3){
	path[0] = argument2;
	return path;
}
else if (argument1[argument2] == true){
	path[0] = argument2;
	return path;
}
else {
	var temp_check = argument1;
	temp_check[argument2] = true;
	
	for (var t = 0; t < array_length_2d(rooms_and_balances, argument2); t++){
		var temp_path = RoomPathFind(rooms_and_balances, temp_check, rooms_and_balances[argument2, t], argument3);
		if (path == noone){
			path = temp_path;
		}
		else if (temp_path[0] == argument3){
			if (path[0] == argument3){
				var temp_minimum_array_length = min(array_length_1d(path), array_length_1d(temp_path));
				if (temp_minimum_array_length == array_length_1d(temp_path)){
					path = temp_path;
				}
			}
			else {
				path = temp_path;
			}
		}
	}
	path[array_length_1d(path)] = argument2;
	return path;
}