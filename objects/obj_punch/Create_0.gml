image_xscale = choose (1, -1);
if image_xscale = 1 {image_angle = obj_player.direction + 135;}
if image_xscale = -1 {image_angle = obj_player.direction - 315;}
image_alpha = 0;
angle_init = image_angle;