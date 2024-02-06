//
if instance_exists(obj_player) {
	obj_player.canwalk = true;
	if obj_player.alarm[2] <= 0 {obj_player.candash = true;}
}