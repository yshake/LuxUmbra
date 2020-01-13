draw_self();

var ballWidth = sprite_get_width(sSmallBall);
for (var i = 0; i < balls; i++){
    draw_sprite(sSmallBall, i, x - 7 + (i * ballWidth), y-40);
}


if(oPlayer.balls > 0){
	//draw_sprite(sBall, image_index, x, y);
}else{
	draw_sprite(sEmpty, image_index, x, y);
}