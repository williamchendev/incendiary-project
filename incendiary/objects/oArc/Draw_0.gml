/// Draw Arc

var xm = oAnna.mouse_scale_x;
var ym = oAnna.mouse_scale_y;

var xp = oAnna.anna_x;
var yp = oAnna.anna_y - 19;

var mdy = ((min(ym, yp) + ((ym + yp) / 2)) / 2) - 60;

var canthrow1 = false;
var canthrow2 = false;

if (instance_position(xm, ym, oMove) != noone){
	canthrow1 = true;
}
if (instance_position(xm, ym, oSolid) == noone){
	canthrow2 = true;
}

var draw_x = xp;
var draw_y = yp;

var i;
for (i = 0; i < abs(xm - xp); i++){
	var t = i / abs(xm - xp);
	var temp_y = ((1 - t) * ((yp * (1 - t)) + (mdy * t))) + (t * ((mdy * (1 - t)) + (ym * t)));
	draw_line(draw_x, draw_y, xp + (i * sign(xm - xp)), temp_y);
	draw_x = xp + (i * sign(xm - xp));
	draw_y = temp_y;
}