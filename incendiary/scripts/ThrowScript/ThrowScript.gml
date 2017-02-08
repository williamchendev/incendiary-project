///ThrowScript(x1, y1, x2, y2, path);

var xm = argument0;
var ym = argument1;

var xp = argument2;
var yp = argument3;

var throw_path = argument4;

var temp_distance = point_distance(xm, ym, xp, yp) / 120;

var mdy = ((ym + yp) / 2.5) + (5 * temp_distance);
var high_temp = max(ym, yp, mdy);
var low_temp = min(ym, yp, mdy);

var draw_x = xp;
var draw_y = yp;

path_set_closed(throw_path, false);

var i;
for (i = 0; i < abs(xm - xp); i++){
	var t = i / abs(xm - xp);
	var temp_y = (((1 - t) * ((yp * (1 - t)) + (mdy * t))) + (t * ((mdy * (1 - t)) + (ym * t))));
	
	var temp_grav = (power(4.642 * ((i + 5) / abs(xm - xp)), 3) / 100) * 40;
	temp_grav = clamp((temp_grav) + (60 * temp_distance), 5, 100);
	
	if (i mod 2 == 0){
		path_add_point(throw_path, xp + (i * sign(xm - xp)), temp_y, temp_grav);
	}
	
	draw_x = xp + (i * sign(xm - xp));
	draw_y = temp_y;
}

path_add_point(throw_path, xm, ym, 100);
path_set_precision(throw_path, 8);