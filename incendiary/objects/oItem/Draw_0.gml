///Draw Event

//Action
if (point_distance(oAnna.mouse_scale_x, oAnna.mouse_scale_y, action.x, action.y) <= (24)){
    //Player
    if (instance_exists(oAnna)){
        //Outline
        if (oAnna.canmove){
            if (!selected){
                OutlineScript(sprite_index, item + 1, outline_surface);
            }
        }
    }
    
    action.prox = true;
}
else {
    action.prox = false;
}

//Draw Self
draw_sprite(sprite_index, item + 1, x, y);

