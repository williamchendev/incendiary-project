///Step
if (y <= depth){
	y = depth;
	grounded = true;
}
else {
	y += lengthdir_x(hspd, angle);
	x += lengthdir_x(spd, angle);
	hspd += spd;
}