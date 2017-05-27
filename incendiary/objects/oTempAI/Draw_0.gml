///@description Debug Draw

if (global.debug){
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(DebugFont);
	
	var pathfindtext = "";
	if (room_pathfind != noone){
		for (var k = 0; k < array_length_1d(room_pathfind); k++){
			pathfindtext += string(room_pathfind[k]) + " ";
		}
	}
	var debugtext = "Room: " + room_get_name(current_room) + " Behavior: " + string(canmove) + " Temp: " + pathfindtext;
	for (var k = 0; k < instance_number(oTempAI); k++){
		if (instance_find(oTempAI, k) == self){
			draw_text(10, 200 + (k * 7), debugtext);
		}
	}
	
	draw_set_color(c_black);
}