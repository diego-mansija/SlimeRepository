//
//controller input
var _dev = 0;
if gamepad_is_connected(_dev) {
	if obj_control.inmenu = false {
		var _deadzone = 0.3;
	    left_key = gamepad_axis_value(_dev, gp_axislh) < -_deadzone;
	    right_key = gamepad_axis_value(_dev, gp_axislh) > _deadzone;
	    up_key = gamepad_axis_value(_dev, gp_axislv) < -_deadzone;
	    down_key = gamepad_axis_value(_dev, gp_axislv) > _deadzone;
		shot_key = gamepad_button_check_pressed(_dev, gp_face3);
		punch_key = gamepad_button_check_pressed(_dev, gp_face1);
		dash_key = gamepad_button_check_pressed(_dev, gp_face2);
		shield_key = gamepad_button_check(_dev, gp_shoulderr);
		//action_key = gamepad_button_check_pressed(_dev, gp_face1);
		//map_key = gamepad_button_check_pressed(_dev, gp_select);
		skill_key = gamepad_button_check_pressed(_dev, gp_shoulderl);
	}
} else {
	//keyboard input
	if obj_control.inmenu = false {
		left_key = keyboard_check(ord("A"));
		right_key = keyboard_check(ord("D"));
		up_key = keyboard_check(ord("W"));
		down_key = keyboard_check(ord("S"));
		shot_key = mouse_check_button(mb_left);
		punch_key = mouse_check_button(mb_right);
		dash_key = keyboard_check(vk_space);
		shield_key = keyboard_check(vk_lshift)
		//action_key = gamepad_button_check_pressed(_dev, gp_face1);
		//map_key = gamepad_button_check_pressed(_dev, gp_select);
		//skill_key = gamepad_button_check_pressed(_dev, gp_shoulderl);
	}
}


xspd = (right_key - left_key) * movspd;
yspd = (down_key - up_key) * movspd;

//colisão básica
if place_meeting(x + xspd, y, obj_wall) {xspd = 0;}
if place_meeting(x, y + yspd, obj_wall) {yspd = 0;}

x += xspd;
y += yspd;

if canwalk = false {movspd = 0;} else {movspd = 5;}
if canwalk = true && shield_key {movspd = 3};

if !shield_key {//guarda sprite e direção atual para uso do escudo
	//(se move sem mudar direção do sprite)
	spr_shieldon = sprite_index;
	dir_shieldon = direction;
} else {
	sprite_index = spr_shieldon;
	direction = dir_shieldon;
}

if !shield_key {
//mudar direção do sprite
	if right_key {
		sprite_index = spr_side;
		image_xscale = -1;
		direction = 0;
		origin_x = 35;
		origin_y = 0;}
	if left_key {
		sprite_index = spr_side;
		image_xscale = 1;
		direction = 180;
		origin_x = -35;
		origin_y = 0;}
	if up_key {
		sprite_index = spr_base;
		direction = 90;
		origin_x = 0;
		origin_y = -25;}
	if down_key {
		sprite_index = spr_down;
		direction = 270;
		origin_x = 0;
		origin_y = 25;}

	if down_key && left_key {
		sprite_index = spr_diag;
		image_xscale = 1;
		direction = 225;
		origin_x = -30;
		origin_y = 20;}
	if down_key && right_key {
		sprite_index = spr_diag;
		image_xscale = -1;
		direction = 315;
		origin_x = 30;
		origin_y = 20;}
	if up_key && left_key {
		sprite_index = spr_base;
		direction = 135;
		origin_x = -20;
		origin_y = -25;}
	if up_key && right_key {
		sprite_index = spr_base;
		direction = 45;
		origin_x = 20;
		origin_y = -25;}
}
	
//atacar
if canshoot {
	if shot_key {
		canshoot = false;
		candash = false;
		canpunch = false;
		alarm[2] = room_speed;
		instance_create_layer(x + origin_x, y + origin_y, "Instances", obj_shot);
	}
}

if punch_key && dashing = false {
	canwalk = false;
	candash = false;
	if !instance_exists(obj_punch) {
		instance_create_depth(x, y, depth-1, obj_punch);
		instance_create_depth(x, y, depth-1, obj_punch2);
	}
}

//dash
if candash {
	if dash_key {
		dashing = true;
		canshoot = false;
		canpunch = false;
		candash = false;
		speed = movspd * 2;
		alarm[0] = 30;
		alarm[1] = 15;
	}
}

//trace
if speed > 0 {
	timer2--;
	if timer2 <= 0 {
		timer2 = timer1;
		instance_create_depth(x, y, 1, obj_trace);
	}
}

if shield_key {
	canshoot = false;
	candash = false;
	canpunch = false;
	if !instance_exists(obj_shield) {
		instance_create_depth(x, y, 0, obj_shield);
	}
} else {
	if alarm[2] <= 0 {canshoot = true;}
	if alarm[0] <= 0 {candash = true;}
	canpunch = true;
}

if xspd != 0 or yspd != 0 or speed > 0 {
	timer4--;
	if timer4 <= 0 {
		timer4 = timer3;
		instance_create_depth(random_range(x + 3, x - 3), random_range(y + 22, y + 28), depth + 1, obj_dusttrace);
		instance_create_depth(random_range(x + 3, x - 3), random_range(y + 22, y + 28), depth + 1, obj_dusttrace);
	}
}