//
if obj_player.shield_key = true && image_yscale < 1 {image_yscale += 0.2;}

var _dev = 0;
if gamepad_is_connected(_dev) {
    var _deadzone = 0.3;
    left_key = gamepad_axis_value(_dev, gp_axislh) < -_deadzone;
    right_key = gamepad_axis_value(_dev, gp_axislh) > _deadzone;
    up_key = gamepad_axis_value(_dev, gp_axislv) < -_deadzone;
    down_key = gamepad_axis_value(_dev, gp_axislv) > _deadzone;
}

xspd = (right_key - left_key) * movspd;
yspd = (down_key - up_key) * movspd;

//colisão básica
if place_meeting(x + xspd, y, obj_wall) {xspd = 0;}
if place_meeting(x, y + yspd, obj_wall) {yspd = 0;}

x += xspd;
y += yspd;

direction = obj_player.direction;

if direction = 0 {
	sprite_index = spr_shieldside;
	image_xscale = -1;
	depth = obj_player.depth - 1;}
if direction = 45 {
	sprite_index = spr_shielddiagup;
	image_xscale = -1;
	depth = obj_player.depth + 1;}
if direction = 90 {
	sprite_index = spr_shieldup;
	image_xscale = 1;
	depth = obj_player.depth + 1;}
if direction = 135 {
	sprite_index = spr_shielddiagup;
	image_xscale = 1;
	depth = obj_player.depth + 1;}
if direction = 180 {
	sprite_index = spr_shieldside;
	image_xscale = 1;
	depth = obj_player.depth - 1;}
if direction = 225 {
	sprite_index = spr_shielddiagdown;
	image_xscale = 1;
	depth = obj_player.depth - 1;}
if direction = 270 {
	sprite_index = spr_shielddown;
	image_xscale = 1;
	depth = obj_player.depth - 1;}
if direction = 315 {
	sprite_index = spr_shielddiagdown;
	image_xscale = -1;
	depth = obj_player.depth - 1;}
	
if obj_player.shield_key = false {
	image_yscale -= 0.2;
	if image_yscale <= 0 {
		instance_destroy();
	}
}