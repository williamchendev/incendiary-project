///Draw Event

//Action
if (distance_to_point(mouse_x, mouse_y) <= (sprite_width - (sprite_width div 2.2))){    
    action.prox = true;
}
else {
    action.prox = false;
}

//Draw Self
draw_sprite(sprite_index, image_index, x, y);

