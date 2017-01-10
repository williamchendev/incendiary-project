///ItemCheckScript(item_id);

var i;
for (i = 0; i < 12; i++){
    if (oAnna.item_slot[i].item == argument0){
        return oAnna.item_slot[i].item_stack;
    }
}
return -1;
