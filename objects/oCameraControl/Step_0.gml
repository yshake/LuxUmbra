x = round( (oPlayer.x + oPlayer1.x) / 2 );
y = round( (oPlayer.y + oPlayer1.y) / 2 ) - 50;

dist = point_distance(x,oPlayer.y,x,oPlayer1.y); 

scale = 1;
if(dist > 400){
	scale = 1 + ((dist - 400) / 500);
}

view_width = (view_wport[0] * scale);
view_height = (view_hport[0] * scale);

camera_set_view_size(view_camera[0], view_width, view_height);