/// @description Effects

if (sin_val >= 1){
	sin_val = 0;
}
else {
	sin_val += spd;
}

var sin_num = (sin(sin_val * 2 * pi) + 1) / 2;

grow_num = sin_num * grow;

light_size = grow_num + size;
light_strength = alpha;

light_size_outline = outline_size + size + grow_num + (0.8 * (flicker_num / flicker));
light_strength_outline = outline_alpha;