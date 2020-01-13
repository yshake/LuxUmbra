if(oPlayer1.balls > 0){
	x = oHand1.x;
	y = oHand1.y;
}
else{
	x = 0;
	y = -300;
}


//Rotate line towards mouse
image_angle = point_direction(0, 0, gamepad_axis_value(0,gp_axisrh), gamepad_axis_value(0,gp_axisrv));