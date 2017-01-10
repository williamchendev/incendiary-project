///ItemSubScript(item_id, item_stack);

var i;
for (i = 0; i < 12; i++){
    if (oAnna.item_slot[i].item == argument0){
		if (oAnna.item_slot[i].item_stack == argument1){
			oAnna.item_slot[i].item = -1;
			oAnna.item_slot[i].item_stack = -1;
			return true;
		}
    }
}
return false;
