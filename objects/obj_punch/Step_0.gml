//
if image_xscale = 1 {image_angle -= 9;}
if image_xscale = -1 {image_angle += 9};
if image_alpha < 1 {image_alpha += 0.2};

if (image_xscale = 1 && image_angle <= angle_init - 90) or 
	(image_xscale = -1 && image_angle >= angle_init + 90) {
	instance_destroy();
}
