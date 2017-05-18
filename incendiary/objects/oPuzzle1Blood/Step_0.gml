
if (active){
	if (instance_exists(oAnna)){
		if (oAnna.mouse_click){
			if (position_meeting(oAnna.mouse_scale_x, oAnna.mouse_scale_y, self)){
				toggle = !toggle;
				image = irandom_range(0, 2);
			}
		}
	}
}

if (num != -1){
	if (toggle){
		oPuzzle1.unlock[num] = 1;
	}
	else {
		oPuzzle1.unlock[num] = 0;
	}
}