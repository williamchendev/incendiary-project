/// @description Light Variables

//Settings
alpha = 1;
light_alpha = 0.6;

//Lights
anna_size = 64;
anna_alpha = 0.3;
anna_light = 0.3;

flicker = 0.05;
flicker_delay = 5;
grow = 3;

flicker_num = 0;
grow_num = 0;
sin_val = 1;
spd = 0.003;

light_alarm = 1;

//Lighting Surfaces
light_surface = surface_create(room_width, room_height);
temp_surface = surface_create(room_width, room_height);
final_surface = surface_create(room_width, room_height);