/// @Burst Alarm

var i = 0;
for (i = 0; i < snow_amount; i++){
	part_emitter_burst(partSnow_sys, partSnow_emit, partSnow, 1);
}

alarm[0] = snow_delay;