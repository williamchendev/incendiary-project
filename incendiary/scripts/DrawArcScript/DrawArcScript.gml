///DrawArcScript(x1, y1, x2, y2, color1, color2, alpha, surface1, surface2);

var xm = argument0;
var ym = argument1;

var xp = argument2;
var yp = argument3;

var mdy = ((ym + yp) / 2.5) - 60;

var temp_arc_surface1 = argument7;
var temp_arc_surface2 = argument8;

if (!surface_exists(temp_arc_surface1)){
	temp_arc_surface1 = surface_create(room_width, room_height);
}
if (!surface_exists(temp_arc_surface2)){
	temp_arc_surface2 = surface_create(room_width, room_height);
}

var draw_x = xp;
var draw_y = yp;

surface_set_target(temp_arc_surface1);
draw_clear_alpha(c_black, 0);

if (abs(xm - xp) >= 3){
	var i;
	for (i = 0; i < abs(xm - xp); i++){
		var t = i / abs(xm - xp);
		var temp_y = (((1 - t) * ((yp * (1 - t)) + (mdy * t))) + (t * ((mdy * (1 - t)) + (ym * t))));
	
		draw_set_color(c_white);
		draw_line(draw_x, draw_y, xp + (i * sign(xm - xp)), temp_y);
	
		draw_x = xp + (i * sign(xm - xp));
		draw_y = temp_y;
	}
}
else {
	var t = 0.5;
	var temp_y = (((1 - t) * ((yp * (1 - t)) + (mdy * t))) + (t * ((mdy * (1 - t)) + (ym * t))));
	draw_set_color(c_white);
	if (ym < yp){
		draw_line(xp, yp, xm, temp_y);
	}
	else {
		draw_line(xm, ym, xp, temp_y);
	}
}

surface_reset_target();

surface_set_target(temp_arc_surface2);
draw_clear_alpha(c_black, 0);

draw_surface_ext(temp_arc_surface1, 1, 0, 1, 1, 0, c_white, 1);
draw_surface_ext(temp_arc_surface1, 0, 1, 1, 1, 0, c_white, 1);
draw_surface_ext(temp_arc_surface1, -1, 0, 1, 1, 0, c_white, 1);
draw_surface_ext(temp_arc_surface1, 0, -1, 1, 1, 0, c_white, 1);

surface_reset_target();

draw_surface_ext(temp_arc_surface2, 0, 0, 1, 1, 0, argument4, 0.8 * argument6);
draw_surface_ext(temp_arc_surface1, 0, 0, 1, 1, 0, argument5, 1 * argument6);

draw_set_color(c_black);