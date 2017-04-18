///Draw Event

//Action
if (point_distance(oAnna.mouse_scale_x, oAnna.mouse_scale_y, action.x, action.y) <= (32)){
    //Outline
    if (oAnna.canmove){
		if (!oAnna.shoot){
	        if (!selected){
	            OutlineScript(sprite_index, image_index, outline_surface);
	        }
		}
    }
		
    action.prox = true;
}
else {
    action.prox = false;
}

//Draw Self
draw_sprite(sprite_index, image_index, x, y);

