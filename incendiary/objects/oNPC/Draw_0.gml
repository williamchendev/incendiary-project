///Draw Event

//Action
if (point_distance(x, y - 42, oAnna.mouse_scale_x, oAnna.mouse_scale_y) <= (26)){    
    action.prox = true;
}
else {
    action.prox = false;
}

//Draw Self
draw_sprite(sprite_index, image_index, x, y);

