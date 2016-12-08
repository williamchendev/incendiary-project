///Draw Event

//Settings
//x = round(x);
//y = round(y);

//path
if (global.debug){
    draw_path(path, x, y, true);
    draw_point(x, y);
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

draw_sprite_ext(sprite_index, image_index, anna_x, anna_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

