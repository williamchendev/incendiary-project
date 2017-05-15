///@description Debug Draw

if (global.debug){
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(DebugFont);
	
	var debugtext = "Room: " + room_get_name(current_room) + " Behavior: " + room_behavior + " Temp: " + room_get_name(goal_room);
	draw_text(x, y, debugtext);
	
	draw_set_color(c_black);
}