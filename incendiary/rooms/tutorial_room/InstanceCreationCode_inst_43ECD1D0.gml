var kill = true;

if (global.story[0]){
	if (!global.story[1]){
		kill = false;
	}
}

if (kill){
	instance_destroy();
}