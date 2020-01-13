centerx = window_get_width()/2 - sprite_get_width(sprite_index)/2;
centery = window_get_height()/2 - sprite_get_height(sprite_index)/2;

if(global.playerWin == 1){
	draw_sprite(sLuxWin, image_index, 100, 100);
}
if(global.playerWin == 2){
	draw_sprite(sUmbraWin, image_index, centerx, centery);
}