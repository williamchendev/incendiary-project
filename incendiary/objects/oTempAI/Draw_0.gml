///@description Debug Draw

if (global.debug){
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(DebugFont);
	
	var debugtext = "Room: " + room_get_name(current_room) + " Behavior: " + behavior + " Temp: " + room_get_name(goal_room);
	draw_text(200, 100, debugtext);
	
	draw_set_color(c_black);
}