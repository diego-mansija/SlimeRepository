var dmg = (other.damage - p_def);
var dmg_show = dmg;
if dmg > 0 {
	hp -= dmg;
} else {
	hp -= 1;
	dmg_show = 1;
	};
instance_create_depth(random_range(x - 10, x + 10), y - 40, depth + 1, obj_showdmg);
obj_showdmg.showdmg = dmg_show;