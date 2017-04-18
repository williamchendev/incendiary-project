event_inherited();

if (text_index == 3){
	if (event > 2){
		text1 = noone;
		text2 = noone;
	
		text1[0, 0] = "See ya later, Alligator.";
		text1[0, 1] = self;
		text1[0, 2] = c_ltgray;
		text1[0, 3] = RegularFont;
	
		text1[1, 0] = "In a while, Crocodile.";
		text1[1, 1] = -1;
		text1[1, 2] = c_white;
		text1[1, 3] = RegularFont;
		
		oRoom.active = true;
	}
}

/*
if (!give_item){
	if (text_index == 2){
		if (event >= 6){
			if (talk_end){
				if (ItemAddScript(0)){
					give_item = true;
					oAnna.gui_access = true;
					oAnna.gui = true;
					oAnna.canmove = false;
					talk_end = true;
				}
			}
		}
	}
}
*/