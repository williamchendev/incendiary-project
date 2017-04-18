///Draw Event

draw_set_alpha(1);
draw_set_color(c_black);

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
image_speed = 1;

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
	if (shoot){
		sprite_index = sAnnaGunWalk;
	}
}
else if (action_timer != -1){
	sprite_index = sAnnaCombine;
}
else if (ammoload){
	sprite_index = sAnnaGunReload;
}
else if (pick){
	sprite_index = sAnnaItem;
	
	if (end_pick){
		image_speed = -1;
	}
	
	if (image_index <= 0){
		if (image_speed == -1){
			pick = false;
			end_pick = false;
			image_speed = 1;
		}
		else {
			end_pick = false;
		}
	}
	else if (image_index >= image_number - 1){
		end_pick = true;
	}
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
		draw_ellipse(anna_x - ellipse1_width, (anna_y - 20) - ellipse1_height, anna_x + ellipse1_width, (anna_y - 20) + ellipse1_height, true);
		draw_ellipse(anna_x - ellipse2_width, (anna_y - 20) - ellipse2_height, anna_x + ellipse2_width, (anna_y - 20) + ellipse2_height, true);
	}
	//Sprite
	if (anna_x != mouse_scale_x){
		image_xscale = sign(mouse_scale_x - anna_x);
	}
}
else if (shoot){
	if (!ammoload){
		if (ammo > 0){
			//Shoot
			var shoot_mouse_angle = point_direction(0, 0, (mouse_scale_x - anna_x) * 0.42, mouse_scale_y - (anna_y - 30));
	
			if (!instance_exists(oShootRange)){
				instance_create_depth(anna_x, anna_y, 0, oShootRange);
			}
			with(oShootRange){
				shoot_distance = clamp(sqr(point_distance(other.mouse_scale_x, other.mouse_scale_y, other.anna_x, other.anna_y - 30) / 42), 0, 1);
				shoot_direction = shoot_mouse_angle;
			}
	
			//Sprite
			sprite_index = sAnnaShoot;
	
			if ((shoot_mouse_angle > 70) and (shoot_mouse_angle < 110)){
				image_index = 1;
				shoot_mouse_angle = point_direction(0, 0, (mouse_scale_x - anna_x), mouse_scale_y - (anna_y - 30));
	
				var arm1_x = anna_x - (image_xscale * 4) - 1;
				var arm1_y = anna_y - 32;
				var arm1_angle = shoot_mouse_angle - (image_xscale * 70);
				var temp_angle = arm1_angle;
				if (image_xscale == 1){
					if ((arm1_angle > -25) and (arm1_angle < 30)){
						arm1_angle = -25;
					}
				}
				else {
					if ((arm1_angle < 205) and (arm1_angle > 155)){
						arm1_angle = 205;
					}
				}
				var arm1_length = lengthdir_x(4, arm1_angle);
				var arm1_height = lengthdir_y(4, arm1_angle);
				var arm1_x_end = lengthdir_x(3, shoot_mouse_angle - (image_xscale * 50)) + (image_xscale * 2) + anna_x - 1;
				var arm1_y_end = lengthdir_y(3, shoot_mouse_angle - (image_xscale * 50)) + (anna_y - 30);
	
				var arm2_x = anna_x + (image_xscale * 5) - 1;
				var arm2_y = anna_y - 31;
				var arm2_length = lengthdir_x(3, shoot_mouse_angle - (image_xscale * 50));
				var arm2_height = lengthdir_y(3, shoot_mouse_angle - (image_xscale * 50))
				var arm2_x_end = lengthdir_x(11, shoot_mouse_angle - (image_xscale * 10)) + (image_xscale * 2) + anna_x - 1;
				var arm2_y_end = lengthdir_y(11, shoot_mouse_angle - (image_xscale * 10)) + (anna_y - 31);

				//Arm 2
				draw_line_width_color(arm2_x, arm2_y, arm2_x + arm2_length, arm2_y + arm2_height, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
				draw_line_width_color(arm2_x + arm2_length, arm2_y + arm2_height, arm2_x_end, arm2_y_end, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
	
				//Hand 2
				draw_circle_color(arm2_x_end, arm2_y_end, 1.3, make_color_rgb(167, 125, 100), make_color_rgb(167, 125, 100), false);
	
				//Hand 1
				draw_circle_color(arm1_x_end, arm1_y_end, 2, make_color_rgb(167, 125, 100), make_color_rgb(167, 125, 100), false);
	
				//Gun
				draw_sprite_ext(sAnnaGun, 1, anna_x + ((image_xscale * 2) + lengthdir_x(recoil * 0.7, shoot_mouse_angle)), anna_y - 30 + lengthdir_y(recoil, shoot_mouse_angle), 1, image_xscale, shoot_mouse_angle, c_white, 1);
	
				//Arm 1
				draw_line_width_color(arm1_x, arm1_y, arm1_x + arm1_length, arm1_y + arm1_height, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
				draw_line_width_color(arm1_x + arm1_length, arm1_y + arm1_height, arm1_x_end, arm1_y_end + 1, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
			}
			else if ((shoot_mouse_angle > 250) and (shoot_mouse_angle < 290)){
				image_index = 2;
			}
			else {
				image_index = 0;
			}
		
			if (anna_x != mouse_scale_x){
				image_xscale = sign(mouse_scale_x - anna_x);
			}
		}
		else {
			sprite_index = sAnnaGunIdle;
		}
	}
}
else {
	sprite_index = sAnna;
}

if (sprite_index != sAnnaItem){
	pick = false;
	end_pick = false;
	image_speed = 1;
}

draw_sprite_ext(sprite_index, image_index, anna_x, anna_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (shoot){
	if (!ammoload){
		if (!walking){
			if (ammo > 0){
				if (image_index != 1){
					var shoot_mouse_angle = point_direction(0, 0, (mouse_scale_x - anna_x), mouse_scale_y - (anna_y - 30));
	
					var arm1_x = anna_x - (image_xscale * 4) - 1;
					var arm1_y = anna_y - 32;
					var arm1_angle = shoot_mouse_angle - (image_xscale * 70);
					var temp_angle = arm1_angle;
					if (image_xscale == 1){
						if ((arm1_angle > -25) and (arm1_angle < 30)){
							arm1_angle = -25;
						}
					}
					else {
						if ((arm1_angle < 205) and (arm1_angle > 155)){
							arm1_angle = 205;
						}
					}
					var arm1_length = lengthdir_x(4, arm1_angle);
					var arm1_height = lengthdir_y(4, arm1_angle);
					var arm1_x_end = lengthdir_x(3, shoot_mouse_angle - (image_xscale * 50)) + (image_xscale * 2) + anna_x - 1;
					var arm1_y_end = lengthdir_y(3, shoot_mouse_angle - (image_xscale * 50)) + (anna_y - 30);
	
					var arm2_x = anna_x + (image_xscale * 5) - 1;
					var arm2_y = anna_y - 31;
					var arm2_length = lengthdir_x(3, shoot_mouse_angle - (image_xscale * 50));
					var arm2_height = lengthdir_y(3, shoot_mouse_angle - (image_xscale * 50))
					var arm2_x_end = lengthdir_x(11, shoot_mouse_angle - (image_xscale * 10)) + (image_xscale * 2) + anna_x - 1;
					var arm2_y_end = lengthdir_y(11, shoot_mouse_angle - (image_xscale * 10)) + (anna_y - 31);

					//Arm 2
					draw_line_width_color(arm2_x, arm2_y, arm2_x + arm2_length, arm2_y + arm2_height, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
					draw_line_width_color(arm2_x + arm2_length, arm2_y + arm2_height, arm2_x_end, arm2_y_end, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
	
					//Hand 2
					draw_circle_color(arm2_x_end, arm2_y_end, 1.3, make_color_rgb(167, 125, 100), make_color_rgb(167, 125, 100), false);
	
					//Hand 1
					draw_circle_color(arm1_x_end, arm1_y_end, 2, make_color_rgb(167, 125, 100), make_color_rgb(167, 125, 100), false);
	
					//Gun
					var temp_img_recoil = 1;
					var temp_recoil_angle = (image_xscale * round(recoil));
					if (image_index == 2){
						temp_img_recoil = 0.3;
						temp_recoil_angle = 0;
					}
					draw_sprite_ext(sAnnaGun, image_index, anna_x + ((image_xscale * 2) + lengthdir_x(recoil * temp_img_recoil, shoot_mouse_angle)), anna_y - 30 + lengthdir_y(recoil * temp_img_recoil, shoot_mouse_angle), 1, image_xscale, shoot_mouse_angle - temp_recoil_angle, c_white, 1);
	
					//Arm 1
					draw_line_width_color(arm1_x, arm1_y, arm1_x + arm1_length, arm1_y + arm1_height, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
					draw_line_width_color(arm1_x + arm1_length, arm1_y + arm1_height, arm1_x_end, arm1_y_end + 1, 2, make_color_rgb(98, 109, 102), make_color_rgb(98, 109, 102));
				}
			}
		}
	}
}