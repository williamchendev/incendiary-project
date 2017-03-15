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

var shake_letter_start = string_pos(shake_text, text) - 1;
var shake_letter_end = shake_letter_start + string_length(shake_text);
var shake_letter = 0;

for (var s = 0; s <= round(clamp(time, 0, shake_text_limit)); s++){
	var xpos = x + string_width(string_copy(text, 0, s));
	
	var x_shake = 1;
	var y_shake = 5;
	if (s >= shake_letter_start){
		if (s < shake_letter_end){
			x_shake += shake_x[shake_letter];
			y_shake += shake_y[shake_letter];
			shake_letter++;
		}
	}
	
	draw_set_alpha(alpha * 0.3);
	draw_text(xpos + x_shake - (string_width_ext(text, -1, 200) / 2), y + y_shake + 1, string_char_at(text, s + 1));
	draw_set_alpha(alpha);
	draw_text(xpos + x_shake - (string_width_ext(text, -1, 200) / 2), y + y_shake, string_char_at(text, s + 1));
}

draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_alpha(1);