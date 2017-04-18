//RoomInitScript();

//View
views_enabled = true;

//Grid
var cellwidth = 1;
var cellheight = 1;
        
var room_grid = mp_grid_create(oMove.x, oMove.y, oMove.sprite_width div cellwidth, oMove.sprite_height div cellheight, cellwidth, cellheight);
mp_grid_add_instances(room_grid, oSolid, true);
oAnna.grid = room_grid;

//Textures
draw_texture_flush();
