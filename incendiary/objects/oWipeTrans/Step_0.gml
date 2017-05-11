///Step Event

time += 1;
time *= 1.3;

event_inherited();

if (trans){
	with(instance_create_depth(0, 0, -12000, oWipeTransReverse)){
		image_xscale = other.image_xscale;
	}
}