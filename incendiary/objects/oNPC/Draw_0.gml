///Draw Event

//Action
if (distance_to_point(oAnna.mouse_scale_x, oAnna.mouse_scale_y) <= (32)){    
    action.prox = true;
}
else {
    action.prox = false;
}

//Draw Self
draw_sprite(sprite_index, image_index, x, y);

