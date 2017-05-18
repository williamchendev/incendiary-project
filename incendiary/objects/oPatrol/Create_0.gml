/// @description Init

//Path
path = noone;

patrol_areas = noone;
if (instance_exists(oPatrolCheck)){
	for (var i = 0; i < instance_number(oPatrolCheck); i++){
		patrol_areas[i] = instance_find(oPatrolCheck, i);
	}
}

if ((path != noone) or (patrol_areas != noone)){
	active = true;
}

//ROOM DATA
rooms = noone;

rooms[0] = living_room;
room_path[0, 0] = 1;

rooms[1] = hallway1_room;
room_path[1, 0] = 0;
room_path[1, 1] = 2;

rooms[2] = hallway2_room;
room_path[2, 0] = 1;
room_path[2, 1] = 3;

rooms[3] = downstairs_room;
room_path[3, 0] = 2;

/*
rooms[8] = test_hall0;
rooms[8, 0] = 1;
rooms[8, 1] = 11;
rooms[8, 2] = 7;
rooms[8, 3] = 9;

rooms[9] = template_room;
rooms[9, 0] = 8;

rooms[10] = template_room;
rooms[10, 0] = 11;

rooms[11] = template_room;
rooms[11, 0] = 12;
rooms[11, 1] = 10;

rooms[12] = template_room;
rooms[12, 0] = 11;
rooms[12, 1] = 13;

rooms[13] = template_room;
rooms[13, 0] = 16;
rooms[13, 1] = 12;
rooms[13, 2] = 14;
rooms[13, 3] = 6;

rooms[14] = template_room;
rooms[14, 0] = 13;
rooms[14, 1] = 5;

rooms[15] = template_room;
rooms[15, 0] = 16;

rooms[16] = template_room;
rooms[16, 0] = 13;
rooms[16, 1] = 15;
*/