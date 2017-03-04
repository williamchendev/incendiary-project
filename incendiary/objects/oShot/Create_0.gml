/// @description Init Event

//Bullet Data
person = noone;

life = 1;

dmg = 0;
hit = false;

spd = 5;

start_x = x;
start_y = y;

hit_x = x;
hit_y = y;

hit_direction = 0;

partSmoke_sys = part_system_create();
part_system_depth(partSmoke_sys, -1 * (y + 50));