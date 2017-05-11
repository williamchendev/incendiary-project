/// @description Init Event

//Bullet Data
person = noone;

life = 1;

dmg = 0;
hit = false;

spd = 5;

layer_id = "null";

start_x = x;
start_y = y;

hit_x = x;
hit_y = y;

hit_image = irandom_range(1, 6);

hit_direction = 0;

hit_color = make_color_rgb(178, 174, 124);

partSmoke_sys = part_system_create();
part_system_depth(partSmoke_sys, -1 * (y + 50));