
if (active){
	if (unlock[0] + unlock[1] + unlock[2] + unlock[3] + unlock[4] + unlock[5] + unlock[6] == 7){
		oAnna.x = 64;
		oAnna.y = -64;
		global.story[4] = true;
		active = false;
	}
	else if (oAnna.mouse_click){
		if (point_distance(oAnna.mouse_scale_x, oAnna.mouse_scale_y, 72, 250) < 24){
			oAnna.x = -64;
			oAnna.y = -64;
			active = false;
		}
	}
}

if (!active){
	with(oPuzzle1Blood){
		active = false;
	}
}