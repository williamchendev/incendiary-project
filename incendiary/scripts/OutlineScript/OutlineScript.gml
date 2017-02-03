///OutlineScript(sprite_index, image_index, surface);

var outline_temp_surface = argument2;

if (!surface_exists(outline_temp_surface)){
	outline_temp_surface = surface_create(room_width, room_height);
}

surface_set_target(outline_temp_surface);
draw_clear_alpha(c_black, 0);

draw_sprite_ext(argument0, argument1, x + 1, y, 1, 1, 0, c_black, 1);
draw_sprite_ext(argument0, argument1, x - 1, y, 1, 1, 0, c_black, 1);
draw_sprite_ext(argument0, argument1, x, y + 1, 1, 1, 0, c_black, 1);
draw_sprite_ext(argument0, argument1, x, y - 1, 1, 1, 0, c_black, 1);

surface_reset_target();

shader_set(shader_outline);
draw_surface_ext(outline_temp_surface, 0, 0, 1, 1, 0, c_white, 0.6);
shader_reset();
