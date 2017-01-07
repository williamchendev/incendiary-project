///Draw Event

//Settings
//x = round(x);
//y = round(y);

//path
if (global.debug){
    draw_path(path, x, y, true);
    draw_point(x, y);
}

if (canmove){
	if (round(x) == move_x){
		if (round(y) == move_y){
			walking = false;
		}
	}
	if (!position_meeting(move_x, move_y, oMove)){
		walking = false;
	}
	if (position_meeting(move_x, move_y, oSolid)){
		walking = false;
	}
}

//Anna Sprite
var sprite_spd = 0.2;
var pre_anna_x = anna_x;
var pre_anna_y = anna_y;

anna_x += (x - anna_x) * sprite_spd;
anna_y += (y - anna_y) * sprite_spd;

if (round(pre_anna_x) != round(anna_x)){
    image_xscale = sign(round(anna_x) - round(pre_anna_x));
}

//Sprite Image
if (walking){
	sprite_index = sAnnaWalk;
}
else {
	sprite_index = sAnna;
}

draw_sprite_ext(sprite_index, image_index, anna_x, anna_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

