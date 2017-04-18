///Draw Event

//Black Rectangle
draw_set_alpha(alpha);
draw_set_color(c_black);
draw_set_font(RegularFont);
var temp_text = string_copy(text, 0, clamp(time, 0, string_length(text)));
var corner_radius_sin = ((sin(sin_val * 2 * pi) + 1) / 2) * (string_width_ext(temp_text, -1, 200) / 3);
var corner_radius_cos = ((cos(sin_val * 2 * pi) + 1) / 2) * (string_height_ext(temp_text, -1, 200) / 3);
draw_roundrect_ext(x - ((string_width_ext(text, -1, 200) / 2) + border_width + move_x), y - clamp(((string_height_ext(temp_text, -1, 200) / 2) + border_height + move_x), 6, 400), x + ((string_width_ext(temp_text, -1, 200)) + border_width + move_x) - (string_width_ext(text, -1, 200) / 2), y + clamp(((string_height_ext(temp_text, -1, 200) / 2) + border_height + move_x), 6, 400), corner_radius_sin + 10, corner_radius_cos + 10, false);

//Text
draw_set_color(text_color);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var shift_letter_start = string_pos(shift_text, text) - 1;
var shift_letter_end = shift_letter_start + string_length(shift_text);
var shift_letter = 0;

//var s = 0; s <= round(clamp(time, 0, shift_text_limit)); s++){
for (var s = 0; s <= round(clamp(time, 0, shift_text_limit)); s++){
	var xpos = x + string_width(string_copy(text, 0, s)) + 1;
	
	var y_shift = 5;
	if (s >= shift_letter_start){
		if (s < shift_letter_end){
			y_shift += shift_y[shift_letter];
			shift_letter++;
		}
	}
	
	draw_set_alpha(alpha * 0.3);
	draw_text(xpos - (string_width_ext(text, -1, 200) / 2), y + y_shift + 1, string_char_at(text, s + 1));
	draw_set_alpha(alpha);
	draw_text(xpos - (string_width_ext(text, -1, 200) / 2), y + y_shift, string_char_at(text, s + 1));
}

draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_alpha(1);