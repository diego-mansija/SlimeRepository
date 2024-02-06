if instance_exists(obj_punch) {
	draw_sprite_ext(spr_punch, 0, x, y + 20, obj_punch.image_xscale, obj_punch.image_yscale, obj_punch.image_angle, c_black, 0.5);
}
if instance_exists(obj_shield) {
	draw_sprite_ext(obj_shield.sprite_index, 0, x, y + 28, obj_shield.image_xscale, obj_shield.image_yscale/2, obj_shield.image_angle, c_black, 0.5);
	if direction = 45 or direction = 135 {
		draw_sprite_ext(obj_shield.sprite_index, 0, x, y, obj_shield.image_xscale, obj_shield.image_yscale, obj_shield.image_angle, c_white, 1);
	}
}
draw_self();