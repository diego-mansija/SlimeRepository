if place_meeting(x, y, obj_punch2) {
	hp -= punch_atk;
}

if hp <= 0 {
	xp += exp_counter;
	xp_total += exp_counter;
	instance_destroy();
}