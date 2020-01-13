//Get input
key_left = keyboard_check(ord("A"));
key_start_walking = keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("D"));
key_right = keyboard_check(ord("D"));
key_down = keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W"));

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

if(sprite_index == sPlayerWalking && (image_index == 0 || image_index == 6)){
	audio_play_sound(Walking, 1, false);
}

//Animation
if(move != 0){
	image_xscale = move;
	sprite_index = sPlayerWalking;
}else{
	sprite_index = sPlayer;
}

//Gravity
vsp += grv;

if(place_meeting(x,y,oBallThrow1)){
	alarm[0] = 2 * room_speed;
	stunned = true;
}

//Stunned
if(stunned){
	hsp = 0;
	jumps = 0;
	sprite_index = sPlayer;
	image_alpha = 0.5;
}else{
	image_alpha = 1;
}

//Crouch
if(place_meeting(x,y+1,Collision) && key_down){
	hsp = 0;
	jumps = 0;
	sprite_index = sPlayerCrouch;
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
	sprite_index = sPlayerJumping;
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
if(place_meeting(x,y,oBallPile)) && (balls < 3){
	balls = 3;
}