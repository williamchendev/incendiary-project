///Step Event
event_inherited();

for (var c = string_length(text) - 1; c >= 0; c--){
	if (string_width(string_copy(text, 0, c)) <= 200){
		shake_text_limit = c;
		break;
	}
}

if (shake_text_timer <= 0){
	for (var c = 0; c < string_length(shake_text); c++){
		var offset = 0.75;
		shake_x[c] = random_range(-offset, offset);
		shake_y[c] = random_range(-offset, offset);
	}
	shake_text_timer = 2;
}
else {
	shake_text_timer--;
}