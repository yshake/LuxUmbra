//Get input
gamepad_set_axis_deadzone(0, 0.2);
key_left = gamepad_axis_value(0,gp_axislh) < 0;
key_start_walking = gamepad_axis_value(0,gp_axislh) < 0 || gamepad_axis_value(0,gp_axislh) > 0;
key_right = gamepad_axis_value(0,gp_axislh) > 0;
key_down = gamepad_axis_value(0,gp_axislv) < 0;
key_jump = gamepad_button_check_pressed(0, gp_face1) || gamepad_axis_value(0,gp_axislv) > 0;

//Calculate movement
var move = key_right - key_left;

hsp = move * walksp;

//Change sound pitch randomly
p=random_range(.8,1.2);
audio_sound_pitch(Walking, p);

//Play walking sound on landing
if (place_meeting(x,y+1,Collision)) {
   if (hit_play) {
      audio_play_sound(Walking, 10, false);
      hit_play = false;
   }
}
else {
   hit_play = true;
}

//Play walking sound
if(place_meeting(x,y+1,Collision) && key_start_walking){
	image_index = 0;
}

if(sprite_index == sPlayerWalking1 && (image_index == 0 || image_index == 6)){
	audio_play_sound(Walking, 1, false);
}

//Animation
if(move != 0){
	image_xscale = move;
	sprite_index = sPlayerWalking1;
}else{
	sprite_index = sPlayer1;
}

//Gravity
vsp += grv;

if(place_meeting(x,y,oBallThrow)){
	alarm[0] = 2 * room_speed;
	stunned = true;
}

//Stunned
if(stunned){
	hsp = 0;
	jumps = 0;
	sprite_index = sPlayer1;
	image_alpha = 0.5;
}else{
	image_alpha = 1;
}

//Crouch
if(place_meeting(x,y+1,Collision) && key_down){
	hsp = 0;
	jumps = 0;
	sprite_index = sPlayerCrouch1;
}

//Jump
if(place_meeting(x,y+1,Collision)){
	jumps = maxJumps;
}

if(key_jump && jumps > 0) && (stunned != true){
	jumps--;
	vsp = -jumpHeight;
}

if(!place_meeting(x,y+1,Collision) && stunned != true){
	sprite_index = sPlayerJumping1;
}

//Horizontal collision
if(place_meeting(x+hsp,y,Collision)){
	while(!place_meeting(x+sign(hsp),y,Collision)){
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical collision
if(place_meeting(x,y+vsp,Collision)){
	while(!place_meeting(x,y+sign(vsp),Collision)){
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Ball pickup
if(place_meeting(x,y,oBallPile)) && (balls > 3){
	balls = 3;
}