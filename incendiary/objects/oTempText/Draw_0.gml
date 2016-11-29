///Draw Event

//Black Rectangle
draw_set_alpha(alpha);
draw_set_color(c_black);
var corner_radius_sin = ((sin(sin_val * 2 * pi) + 1) / 2) * (string_width_ext(string_hash_to_newline(text), -1, text_limit) / 3);
var corner_radius_cos = ((cos(sin_val * 2 * pi) + 1) / 2) * (string_height_ext(string_hash_to_newline(text), -1, text_limit) / 3);
draw_roundrect_ext(x - ((string_width_ext(string_hash_to_newline(text), -1, text_limit) / 2) + border_width + move_x), y - ((string_height_ext(string_hash_to_newline(text), -1, text_limit) / 2) + border_height + move_x), x + ((string_width_ext(string_hash_to_newline(text), -1, text_limit) / 2) + border_width + move_x), y + ((string_height_ext(string_hash_to_newline(text), -1, text_limit) / 2) + border_height + move_x), corner_radius_sin + 10, corner_radius_cos + 10, false);

//Text
draw_set_color(text_color);
draw_set_font(RegularFont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_alpha(alpha * 0.3);
draw_text_ext(x + 1, y + 1, string_hash_to_newline(string_copy(text, 0, clamp(time, 0, string_length(text)))), -1, text_limit);
draw_set_alpha(alpha);
draw_text_ext(x + 1, y, string_hash_to_newline(string_copy(text, 0, clamp(time, 0, string_length(text)))), -1, text_limit);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_alpha(1);

