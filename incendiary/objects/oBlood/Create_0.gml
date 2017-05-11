//Init
size = random_range(0.5, 3);
hspd = 0.1;
hacc = random_range(0.2, 0.3);
angle = irandom_range(-45, 45) + 270;

start_y_val = y;
end_y_val = -1 * depth;
grounded = false;