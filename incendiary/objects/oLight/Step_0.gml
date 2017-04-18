/// @description Effects

if (sin_val >= 1){
	sin_val = 0;
}
else {
	sin_val += spd;
}

var sin_num = (sin(sin_val * 2 * pi) + 1) / 2;

grow_num = (sin_num * grow) + (0.8 * (flicker_num / flicker));

light_size = size;