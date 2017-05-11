///Step Event

time += spd;

event_inherited();

if (trans){
	instance_create_depth(0, 0, -12000, oCircleTransReverse);
}