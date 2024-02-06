image_xscale = obj_punch.image_xscale;
if image_xscale = 1 {image_angle = obj_player.direction + 135;}
if image_xscale = -1 {image_angle = obj_player.direction - 315;}
image_alpha = 0;
angle_init = image_angle;