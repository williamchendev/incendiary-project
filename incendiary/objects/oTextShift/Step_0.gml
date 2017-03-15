///Step Event
event_inherited();

for (var c = string_length(text) - 1; c >= 0; c--){
	if (string_width(string_copy(text, 0, c)) <= 200){
		shift_text_limit = c;
		break;
	}
}

var shift_word_length = clamp(string_length(shift_text) - 1, 0, string_length(shift_text));

if (shift_style == 0){
	for (var c = 0; c < string_length(shift_text); c++){
		var c_shift = (c + shift_val) mod shift_word_length;
		shift_y[c] = sin(2 * pi * (c_shift / shift_word_length)) * 3;
	}

	if (shift_val < shift_word_length){
		shift_val += shift_word_length * 0.05;
	}
	else {
		shift_val = 0;
	}
}
else if (shift_style == 1){
	for (var c = 0; c < string_length(shift_text); c++){
		var c_shift = ((c * 0.15) + shift_val) mod 1;
		shift_y[c] = sin(2 * pi * c_shift) * 3;
	}

	if (shift_val < 1){
		shift_val += 0.02;
	}
	else {
		shift_val = 0;
	}
}