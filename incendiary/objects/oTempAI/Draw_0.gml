///@description Debug Draw

if (global.debug){
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(DebugFont);
	
	var debugtext = "Room: " + room_get_name(current_room) + " Behavior: " + behavior + " Temp: " + room_get_name(goal_room);
	for (var k = 0; k < instance_number(oTempAI); k++){
		if (instance_find(oTempAI, k) == self){
			draw_text(10, 200 + (k * 7), debugtext);
		}
	}
	
	draw_set_color(c_black);
}