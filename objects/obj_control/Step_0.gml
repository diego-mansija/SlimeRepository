//controller input
var _dev = 0;
if gamepad_is_connected(_dev) {
	menu_key = gamepad_button_check_pressed(_dev, gp_face4);
} else {
	menu_key = keyboard_check_pressed(vk_tab);
}

if menu_key {
	if inmenu = false {
		inmenu = true;
	} else {inmenu = false;}
}

if inmenu = true {
	if menuback = noone {
		menuback = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), 0, 1, 0, 0);
	}
	instance_deactivate_layer("Instances");
	if !instance_exists(obj_screenshot) {
		instance_create_layer(x, y, "screenshot", obj_screenshot);
	}
	if !instance_exists(obj_menu) {
		instance_create_layer(room_width/2, room_height/2, "GUI", obj_menu);
	}
}

//reseta o screenshot
if inmenu = false {menuback = noone};

//ganho de exp e aumento de level
xp_next = (player_level * 100) - xp;
if (xp >= player_level * 100) {
	xp = xp - player_level * 100;
	player_level++;
	pa++;
}

//timer
steps++;
if steps > 59 {
	steps = 0;
	seconds ++;
}
if seconds > 59 {
	seconds = 0;
	minutes ++;
}
if minutes > 59 {
	minutes = 0;
	hours ++;
}

		