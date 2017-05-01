/// @description Debug

if (global.debug){
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_font(DebugFont);
	var anna_angle = point_direction(0, 0, (x - oAnna.x) * 0.16, y - (oAnna.y)); //string(alert)
	draw_text(x, y - 64, "K: " + string(round(karma * 10) / 10) + " A: " + string(alert) + " S: " + string(sight + sight_tilt));
	draw_text(x, y - 57, "B: " + behavior + " N: " + nature);
	draw_set_halign(fa_left);
	draw_set_color(c_black);
}