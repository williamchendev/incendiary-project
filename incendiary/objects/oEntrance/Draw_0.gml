///Draw Event

//Action
if (distance_to_point(oAnna.mouse_scale_x, oAnna.mouse_scale_y) <= (sprite_width - (sprite_width div 2.2))){
    action.prox = true;
}
else {
    action.prox = false;
}

//Draw Self
draw_sprite(sprite_index, image_index, x, y);