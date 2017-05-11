///AnnaTransitionScript(tansition_num);

var temp_trans_obj = oInstTrans;

if (argument0 = 0){
	 temp_trans_obj = oTrans;
}
else if (argument0 = 1){
	 temp_trans_obj = oCircleTrans;
}
else if (argument0 = 2){
	 temp_trans_obj = oWipeTrans;
}

return instance_create_depth(0, 0, -12000, temp_trans_obj);