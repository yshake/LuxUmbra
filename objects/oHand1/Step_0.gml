key_leftmb = gamepad_button_check_pressed(0, gp_shoulderrb);

//Make hand aim towards mouse
image_angle = point_direction(0, 0, gamepad_axis_value(0,gp_axisrh), gamepad_axis_value(0,gp_axisrv));

//Set hand location to player
x = oPlayer1.x;
y = oPlayer1.y;

//Shoot
if(key_leftmb && oPlayer1.balls > 0){
	ball = instance_create_depth(x,y,0,oBallThrow1);
	ball.direction = image_angle;
	oPlayer1.balls -= 1;
}