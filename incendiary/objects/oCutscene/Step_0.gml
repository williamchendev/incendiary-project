/// @description Cutscene

//Trigger Event
if (!triggered){
	if (instance_exists(oAnna)){
		if (position_meeting(oAnna.x, oAnna.y, self)){
			oAnna.canmove = false;
	        oAnna.moving = false;
			oAnna.walking = false;
			oAnna.shoot = false;
			start_event = true;
			with (oAI){
				other.behavior = "cutscene";
			}
			triggered = true;
		}
	}
}

//Action
if (triggered){
	if (event >= array_height_2d(action)){
		oAnna.canmove = true;
		end_event = true;
		instance_destroy();
	}
	else {
		if (action[event, 0] == "text"){
			if (start_event){
				var text_x = 0;
				var text_y = 0;
				if (actor[action[event, 1]] == oAnna){
					text_x = oAnna.x;
	                text_y = oAnna.y - (text_displace_y + (string_height_ext(action[event, 2], -1, 220) / 2));
	            }
	            else {
	                text_x = actor[action[event, 1]].x;
	                text_y = actor[action[event, 1]].y - ((((actor[action[event, 1]].sprite_height div 4) * 3) + 8) + (string_height_ext(action[event, 2], -1, 220) / 2));
	            }
				TextFontScript(text_x, text_y, action[event, 2], action[event, 4], action[event, 3], 220, text_spd);
				start_event = false;
			}
			else if (!instance_exists(oText)){
				start_event = true;
				event++;
			}
		}
		else if (action[event, 0] == "movement"){
			if (start_event){
				if (actor[action[event, 1]] == oAnna){
					AnnaMoveScript(action[event, 2], action[event, 3]);
				}
				else {
					actor[action[event, 1]].cutscene_x = action[event, 2];
					actor[action[event, 1]].cutscene_y = action[event, 3];
				}
				start_event = false;
			}
			else {
				if ((point_distance(actor[action[event, 1]].x, actor[action[event, 1]].y, action[event, 2], action[event, 3]) < 1) or action[1, 4]){
					start_event = true;
					event++;
				}
			}
		}
		else if (action[event, 0] == "animation"){
			actor[action[event, 1]].sprite_index = action[event, 2];
			start_event = true;
			event++;
		}
		else if (action[event, 0] == "pause"){
			if (action[event, 1] > 0){
				action[event, 1]--;
			}
			else {
				start_event = true;
				event++;
			}
		}
		else if (action[event, 0] == "lights"){
			if (instance_exists(oLighting)){
				if (light_time == 0){
					light_alpha = oLighting.alpha;
					light_destroy = false;
					light_trigger = 0;
					light_time++;
				}
				else {
					if (light_time > action[event, 1]){
						light_time = 0;
						oLighting.alpha = light_alpha;
						event++;
					}
					else {
						if (light_trigger <= 0){
							oLighting.alpha = random_range(action[event, 2], action[event, 3]);
							light_trigger = irandom_range(1, 7);
						}
						if (action[event, 4] != -1){
							if (!light_destroy){
								if (light_time > (action[event, 1] * 0.75)){
									oLighting.alpha = max(action[event, 2], action[event, 3]);
									light_trigger = 7;
									if (instance_exists(actor[action[event, 4]])){
										with(actor[action[event, 4]]){
											instance_destroy();
										}
									}
									light_destroy = true;
								}
							}
						}
						light_trigger--;
						light_time++;
					}
				}
			}
			else {
				event++;
			}
		}
	}
}