///Draw Event

//Action
if (point_distance(x, y - 42, oAnna.mouse_scale_x, oAnna.mouse_scale_y) <= (26)){
	if (oAnna.canmove){
		if (!selected){   
			action.prox = true;
		}
	}
}
else {
    action.prox = false;
}

//Draw Self
draw_self();

