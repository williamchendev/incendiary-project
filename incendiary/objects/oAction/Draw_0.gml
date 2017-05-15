///Draw Event

//Animation
var multiplier = 0.2;

//Action
if (prox){    
    //Sprite Scale and Alpha
    action_sprite_scale = clamp(action_sprite_scale, 0.01, 1);
    if (action_sprite_scale != 1){
        action_sprite_scale *= 1 + 0.3;
    }
    if (action_sprite_alpha != 0.9){
        action_sprite_alpha *= 1 + multiplier;
        action_sprite_alpha = clamp(action_sprite_alpha, 0.1, 0.9);
    }
}
else {
    //Sprite Scale and Alpha
    if (action_sprite_scale != 0){
        action_sprite_scale *= 1 - multiplier;
        action_sprite_scale = clamp(action_sprite_scale, 0, 1);
    }
    if (action_sprite_alpha != 0){
        action_sprite_alpha *= 1 - multiplier;
    }
}
action_sprite_alpha = clamp(action_sprite_alpha, 0, 0.9);

//Draw Self
if (!selected){
    if (oAnna.canmove){
		var draw_shoot = true;
		if (oAnna.shoot){
			draw_shoot = false;
			if (shoot_bypass){
				draw_shoot = true;
			}
		}
		
		if (draw_shoot){
			draw_sprite_ext(sActions, action_type, x, y, action_sprite_scale, action_sprite_scale, 0, c_white, action_sprite_alpha);
		}
	}
    else {
        action_sprite_scale = 0;
        action_sprite_alpha = 0;
    }
}
else {
    action_sprite_scale = 0;
    action_sprite_alpha = 0;
}

