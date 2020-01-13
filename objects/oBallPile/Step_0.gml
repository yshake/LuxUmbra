if(place_meeting(x,y,oPlayer)){
		visible = false;
		alarm[0] = 10 * room_speed;
		audio_play_sound(BallPickup, 1, false);
}

if(place_meeting(x,y,oPlayer1)){
		visible = false;
		alarm[0] = 10 * room_speed;
		audio_play_sound(BallPickup, 1, false);
}

if(visible){
	y = ystart;
}else{
	y = -300;
}