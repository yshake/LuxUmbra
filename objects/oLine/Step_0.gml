if(oPlayer.balls > 0){
	x = oHand.x;
	y = oHand.y;
}
else{
	x = 0;
	y = -300;
}


//Rotate line towards mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);