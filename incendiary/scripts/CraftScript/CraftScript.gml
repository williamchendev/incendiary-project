///CraftScript(item1, item2);

var item_return = -1;
var item1 = min(argument0, argument1);
var item2 = max(argument0, argument1);

if (item1 == 2){
	//Gasoline
}
else if (item1 == 3){
	//Knife
}
else if (item1 == 5){
	//Water
}
else if (item1 == 6){
	//Alcohol
	if (item2 == 7){
		item_return = 20; //Molotov
	}
}
else if (item1 == 7){
	//Rag
}
else if (item1 == 8){
	//Flour
}
else if (item1 == 9){
	//Nails/Bolts
}
else if (item1 == 10){
	//Bottle
}
else if (item1 == 13){
	//Adhesive
}
else if (item1 == 14){
	//Wood Board
}
else if (item1 == 16){
	//Hairpin
}

return item_return;