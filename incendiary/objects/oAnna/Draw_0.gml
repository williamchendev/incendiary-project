///Draw Event

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

if (round(anna_x) == round(x)){
	anna_x = x;
}

if (anna_x != pre_anna_x){
	if (round(anna_x) != round(pre_anna_x)){
		image_xscale = sign(anna_x - pre_anna_x);
	}
	stand_still = false;
}
else {
	stand_still = true;
}

//Sprite Image
if (walking){
	sprite_index = sAnnaWalk;
}
else if (throw){
	//Throw
	if (!instance_exists(oThrowRange)){
		instance_create_depth(mouse_scale_x, mouse_scale_y, 0, oThrowRange);
	}
	if (global.debug){
		var ellipse1_width = 150;
		var ellipse1_height = 54;
		var ellipse2_width = 48;
		var ellipse2_height = 28;
		draw_ellipse(anna_x - ellipse1_width, (anna_y - 19) - ellipse1_height, anna_x + ellipse1_width, (anna_y - 19) + ellipse1_height, true);
		draw_ellipse(anna_x - ellipse2_width, (anna_y - 19) - ellipse2_height, anna_x + ellipse2_width, (anna_y - 19) + ellipse2_height, true);
	}
	//Sprite
	if (anna_x != mouse_scale_x){
		image_xscale = sign(mouse_scale_x - anna_x);
	}
}
else if (shoot){
	//Shoot
	var shoot_alpha = 0;
	var shoot_distance = clamp((sqr(mouse_scale_x - anna_x) / sqr(32) + sqr(mouse_scale_y - (anna_y - 19)) / sqr(32)), 0, 1);
	if (shoot_aim <= 3){
		draw_set_color(make_color_rgb(200, 200, 200));
		shoot_alpha = 0.4;
	}
	else {
		draw_set_color(c_black);
		shoot_alpha = 0.3;
	}
	draw_set_alpha(shoot_alpha * shoot_distance);
	draw_primitive_begin(pr_trianglefan);
	
	draw_vertex(anna_x, (anna_y - 19));
	
	var r;
	var mouse_angle = point_direction(0, 0, (mouse_scale_x - anna_x) * 0.42, mouse_scale_y - (anna_y - 19));
	for (r = 0; r <= shoot_aim; r++){
		draw_vertex(anna_x + lengthdir_x(140, (mouse_angle - (shoot_aim div 2)) + r), (anna_y - 19) + lengthdir_y(60, (mouse_angle - (shoot_aim div 2)) + r));
	}
	draw_primitive_end();
	draw_set_color(c_black);
	draw_set_alpha(1);
	//Sprite
	sprite_index = sAnnaShoot;
	if (anna_x != mouse_scale_x){
		image_xscale = sign(mouse_scale_x - anna_x);
	}
}
else {
	sprite_index = sAnna;
}

draw_sprite_ext(sprite_index, image_index, anna_x, anna_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);