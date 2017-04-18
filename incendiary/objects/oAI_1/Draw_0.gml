///Draw
draw_set_color(c_black);

//Path
if (global.debug){
	draw_set_color(c_blue);
	var draw_follow_rad = round(follow_radius * follow_radius_p);
	draw_ellipse(x - (draw_follow_rad), y - (draw_follow_rad / 4), x + (draw_follow_rad), y + (draw_follow_rad / 4), true);
	draw_set_color(c_red);
	draw_ellipse(x - (follow_radius), y - (follow_radius / 4), x + (follow_radius), y + (follow_radius / 4), true);
	
	draw_set_color(c_black);
    draw_path(path, x, y, true);
    draw_point(x, y);
}

if (canmove){
	if (abs(x - move_x) < 1.1){
		if (abs(y - move_y) < 1.1){
			walking = false;
			if (path_index != -1){
		        path_end();
		    }
		}
	}
	if (!position_meeting(move_x, move_y, oMove)){
		walking = false;
	}
	if (position_meeting(move_x, move_y, oSolid)){
		walking = false;
	}
}

//AI Image
image_speed = 1;

var sprite_spd = 0.2;
var pre_draw_x = draw_x;
var pre_draw_y = draw_y;

draw_x += (x - draw_x) * sprite_spd;
draw_y += (y - draw_y) * sprite_spd;

if (round(draw_x) == round(x)){
	draw_x = x;
}

if (draw_x != pre_draw_x){
	if (round(draw_x) != round(pre_draw_x)){
		image_xscale = sign(draw_x - pre_draw_x);
	}
	stand_still = false;
}
else {
	stand_still = true;
}

//AI Sprite
if (walking){
	sprite_index = en_fwalk;
}
else {
	sprite_index = en_f;
}

//Draw Character
draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, image_xscale, image_yscale, 0, image_blend, image_alpha);

draw_set_color(c_black);