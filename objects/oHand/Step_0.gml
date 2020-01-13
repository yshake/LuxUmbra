key_leftmb = mouse_check_button_pressed(mb_left);

//Make hand aim towards mouse
image_angle = point_direction(x,y,mouse_x,mouse_y);

//Set hand location to player
x = oPlayer.x;
y = oPlayer.y;

//Shoot
if(key_leftmb && oPlayer.balls > 0){
	ball = instance_create_depth(x,y,0,oBallThrow);
	ball.direction = image_angle;
	oPlayer.balls -= 1;
}