///Step

if (y < end_y_val){
	y += lengthdir_y(hspd, angle);
	x += lengthdir_x(hspd * 0.25, angle);
	hspd += hacc;
}
if (y >= end_y_val){
	depth = 1;
	
	x = round(x);
	y = end_y_val;
	grounded = true;
	if (size < 0.8){
		size = 0;
	}
	else if (size < 1.2){
		size = 1;
	}
	else if (size < 1.8){
		size = 2;
	}
	else if (size < 2){
		size = 3;
	}
	else if (size < 2.3){
		size = 4;
	}
	else if (size < 2.7){
		size = 5;
	}
	else if (size <= 3){
		size = 6;
	}
}

y = clamp(y, start_y_val, end_y_val);