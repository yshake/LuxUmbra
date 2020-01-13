//Collision
if(place_meeting(x+hspeed ,y , PlayerCollision) || place_meeting(x, y+vspeed, PlayerCollision)){
	bounces += 1;
	move_bounce_solid(1);
	audio_play_sound(choose(Bounce1, Bounce2, Bounce3, Bounce4), 1, false);
}

//Remove ball when no bounces are left or it slows down too much
if(bounces > maxBounces || speed < 0.5){
	instance_destroy();
}

if(place_meeting(x,y,oPlayer1)){
	instance_destroy();
	audio_play_sound(Player1Hit, 1, false);
}

//Turn sprite towards direction it's moving
image_angle = direction;