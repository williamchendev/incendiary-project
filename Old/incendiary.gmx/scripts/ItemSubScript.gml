///ItemSubScript(item_id);

var i;
for (i = 0; i < 12; i++){
    if (oAnna.item_slot[i].item == argument0){
        oAnna.item_slot[i].item = -1;
        return true;
    }
}
return false;
