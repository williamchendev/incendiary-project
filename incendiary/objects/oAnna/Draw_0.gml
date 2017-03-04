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
	var shoot_distance = clamp((sqr(mouse_scale_x - anna_x) / sqr(32) + sqr(mouse_scale_y - (anna_y - 28)) / sqr(32)), 0, 1);
	var shoot_mouse_angle = point_direction(0, 0, (mouse_scale_x - anna_x) * 0.42, mouse_scale_y - (anna_y - 28));
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
	
	draw_vertex(anna_x, (anna_y));
	
	var r;
	for (r = 0; r <= shoot_aim; r++){
		draw_vertex(anna_x + lengthdir_x(140, (shoot_mouse_angle - (shoot_aim div 2)) + r), (anna_y) + lengthdir_y(60, (shoot_mouse_angle - (shoot_aim div 2)) + r));
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

if (shoot){
	var shoot_mouse_angle = point_direction(0, 0, (mouse_scale_x - anna_x), mouse_scale_y - (anna_y - 28));
	
	var arm1_x = anna_x - (image_xscale * 4) - 1;
	var arm1_y = anna_y - 29;
	var arm1_length = lengthdir_x(4, shoot_mouse_angle - (image_xscale * 60));
	var arm1_height = lengthdir_y(4, shoot_mouse_angle - (image_xscale * 60))
	var arm1_x_end = lengthdir_x(3, shoot_mouse_angle - (image_xscale * 70)) + (image_xscale * 2) + anna_x - 1;
	var arm1_y_end = lengthdir_y(3, shoot_mouse_angle - (image_xscale * 70)) + (anna_y - 29);
	
	var arm2_x = anna_x + (image_xscale * 5) - 1;
	var arm2_y = anna_y - 28;
	var arm2_length = lengthdir_x(3, shoot_mouse_angle - (image_xscale * 50));
	var arm2_height = lengthdir_y(3, shoot_mouse_angle - (image_xscale * 50))
	var arm2_x_end = lengthdir_x(11, shoot_mouse_angle - (image_xscale * 10)) + (image_xscale * 2) + anna_x - 1;
	var arm2_y_end = lengthdir_y(11, shoot_mouse_angle - (image_xscale * 10)) + (anna_y - 29);

	//Arm 2
	draw_line_width_color(arm2_x, arm2_y, arm2_x + arm2_length, arm2_y + arm2_height, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
	draw_line_width_color(arm2_x + arm2_length, arm2_y + arm2_height, arm2_x_end, arm2_y_end, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
	
	//Hand 2
	draw_circle_color(arm2_x_end, arm2_y_end, 1, make_color_rgb(167, 125, 100), make_color_rgb(167, 125, 100), false);
	
	//Hand 1
	draw_circle_color(arm1_x_end, arm1_y_end, 2, make_color_rgb(167, 125, 100), make_color_rgb(167, 125, 100), false);
	
	//Gun
	draw_sprite_ext(sAnnaGun, 0, anna_x + (image_xscale * 2), anna_y - 28, 1, image_xscale, shoot_mouse_angle, c_white, 1);
	
	//Arm 1
	draw_line_width_color(arm1_x, arm1_y, arm1_x + arm1_length, arm1_y + arm1_height, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
	draw_line_width_color(arm1_x + arm1_length, arm1_y + arm1_height, arm1_x_end, arm1_y_end + 1, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
	
	draw_set_color(c_black);
	//draw_point(arm_x_end, arm_y_end);
}