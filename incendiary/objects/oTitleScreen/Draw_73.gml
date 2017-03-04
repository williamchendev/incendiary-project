/// Draw

//Black
if (colorB == c_black){
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_rectangle(-10, -10, 490, 280, false);
}

//Title
draw_set_halign(fa_left);
draw_set_font(JoustFont);
draw_set_color(colorB);

draw_set_alpha(1);

draw_sprite_ext(sTitle, 0, 240, 25, 1, 1, 0, colorB, 1);

draw_line(189, 77, 289, 77);
draw_line(191, 78, 287, 78);

if (credits_show){
	var start_x = 110;
	var start_y = 94;
	for (i = 0; i < array_length_1d(credits_data); i++){
		draw_text(start_x, start_y + (i * 26), credits_data[i]);
	}
	draw_text(button_data[3, 1], button_data[3, 2], "Menu");
	if (cursor_num == 3){
		if (outline_num < 0.8){
			outline_num *= 1.16;
		}
		var rect_width = (outline_num * (string_width("Menu") + 6));
		var rect_height = (outline_num * (18));
		draw_line(button_data[3, 1] - 5, button_data[3, 2] - 3, button_data[3, 1] - 5 + rect_width, button_data[3, 2] - 3);
		draw_line(button_data[3, 1] - 4, button_data[3, 2] - 3, button_data[3, 1] - 4, button_data[3, 2] - 3 + rect_height);
		draw_line(button_data[3, 1] + (string_width("Menu") + 2) - rect_width, button_data[3, 2] + 15, button_data[3, 1] + (string_width("Menu") + 2), button_data[3, 2] + 15);
		draw_line(button_data[3, 1] + (string_width("Menu") + 2), button_data[3, 2] + 14 - rect_height, button_data[3, 1] + (string_width("Menu") + 2), button_data[3, 2] + 14);
		outline_num = clamp(outline_num, 0.05, 0.8);
	}
}
else {
	for (i = 0; i < array_height_2d(button_data); i++){
		draw_text(button_data[i, 1], button_data[i, 2], button_data[i, 0]);
		if (cursor_num == i){
			if (outline_num < 0.8){
				outline_num *= 1.16;
			}
			var rect_width = (outline_num * (string_width(button_data[i, 0]) + 6));
			var rect_height = (outline_num * (18));
			draw_line(button_data[i, 1] - 5, button_data[i, 2] - 3, button_data[i, 1] - 5 + rect_width, button_data[i, 2] - 3);
			draw_line(button_data[i, 1] - 4, button_data[i, 2] - 3, button_data[i, 1] - 4, button_data[i, 2] - 3 + rect_height);
			draw_line(button_data[i, 1] + (string_width(button_data[i, 0]) + 2) - rect_width, button_data[i, 2] + 15, button_data[i, 1] + (string_width(button_data[i, 0]) + 2), button_data[i, 2] + 15);
			draw_line(button_data[i, 1] + (string_width(button_data[i, 0]) + 2), button_data[i, 2] + 14 - rect_height, button_data[i, 1] + (string_width(button_data[i, 0]) + 2), button_data[i, 2] + 14);
			outline_num = clamp(outline_num, 0.05, 0.8);
		}
	}
}

draw_set_color(c_black);
draw_set_alpha(1);