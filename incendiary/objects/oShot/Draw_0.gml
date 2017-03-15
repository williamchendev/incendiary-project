/// @description Draw

//Bullet Trail
var bullet_length = 80;
var shot_direction = point_direction(hit_x, hit_y, start_x, start_y);

for (var i = 2; i < bullet_length; i++){
	var shot_length = clamp(point_distance(start_x, start_y, hit_x, hit_y), 0, i);
	var x1 = hit_x + lengthdir_x(shot_length, shot_direction);
	var y1 = hit_y + lengthdir_y(shot_length, shot_direction);
	
	draw_set_alpha(((bullet_length - i) / bullet_length) * 0.8);
	draw_point_color(x1, y1, hit_color);
}

draw_set_alpha(1);

//Bullet
var shot_length = clamp(point_distance(start_x, start_y, hit_x, hit_y), 0, 3);
var x1 = hit_x + lengthdir_x(shot_length, shot_direction);
var y1 = hit_y + lengthdir_y(shot_length, shot_direction);
draw_line_color(x1, y1, hit_x, hit_y, merge_color(hit_color, c_white, 0.4), merge_color(hit_color, c_white, 0.4));

//Bullet Hole
if (hit){
	draw_sprite(sprite_index, hit_image, hit_x, hit_y);
}