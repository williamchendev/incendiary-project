///OutlineScript(sprite_index, image_index);

shader_set(shader_outline);
draw_sprite_ext(argument0, argument1, x + 1, y, 1, 1, 0, c_black, 0.8);
draw_sprite_ext(argument0, argument1, x - 1, y, 1, 1, 0, c_black, 0.8);
draw_sprite_ext(argument0, argument1, x, y + 1, 1, 1, 0, c_black, 0.8);
draw_sprite_ext(argument0, argument1, x, y - 1, 1, 1, 0, c_black, 0.8);
shader_reset();
