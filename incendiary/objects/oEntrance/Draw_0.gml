///Draw Event

//Action
if (point_distance(oAnna.mouse_scale_x, oAnna.mouse_scale_y, action.x, action.y) <= (32)){
    action.prox = true;
}
else {
    action.prox = false;
}

//Draw Self
draw_sprite(sprite_index, image_index, x, y);