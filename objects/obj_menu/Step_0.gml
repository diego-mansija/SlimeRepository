//
//controller input
var _dev = 0;
if gamepad_is_connected(_dev) {
	left_btnhold = gamepad_button_check(_dev, gp_shoulderl);
	right_btnhold = gamepad_button_check(_dev, gp_shoulderr);
	menu_navu = gamepad_button_check_pressed(_dev, gp_padu);
	menu_navd = gamepad_button_check_pressed(_dev, gp_padd);
	menu_navl = gamepad_button_check_pressed(_dev, gp_padl);
	menu_navr = gamepad_button_check_pressed(_dev, gp_padr);
	augm_navl = gamepad_axis_value(_dev, gp_axisrh) < 0;
	augm_navr = gamepad_axis_value(_dev, gp_axisrh) > 0;
	augm_navu = gamepad_axis_value(_dev, gp_axisrv) < 0;
	augm_navd = gamepad_axis_value(_dev, gp_axisrv) > 0;
	var left_btn = gamepad_button_check_pressed(_dev, gp_shoulderl);
	var right_btn = gamepad_button_check_pressed(_dev, gp_shoulderr);
} else {
	left_btnhold = keyboard_check(ord("Q"));
	right_btnhold = keyboard_check(ord("E"));
	menu_navu = keyboard_check_pressed(ord("W"));
	menu_navd = keyboard_check_pressed(ord("S"));
	menu_navl = keyboard_check_pressed(ord("A"));
	menu_navr = keyboard_check_pressed(ord("D"));
	augm_navl = keyboard_check_pressed(vk_left);
	augm_navr = keyboard_check_pressed(vk_right);
	augm_navu = keyboard_check_pressed(vk_up);
	augm_navd = keyboard_check_pressed(vk_down);
	var left_btn = keyboard_check_pressed(ord("Q"));
	var right_btn = keyboard_check_pressed(ord("E"));
}

//entrada e saída do menu
if obj_control.inmenu = true {
	if image_alpha < 0.5 {image_alpha += 0.1;}
	if image_alpha >= 0.5 && front_alpha < 1 {front_alpha += 0.1;};
	if grad_alpha < 1 {grad_alpha += 0.05;}
	if front_alpha >= 1 {
		opt_bool = true;
		if icon_alpha < 1 {icon_alpha += 0.1;}
	}
	cursor_rot -= 1.5;
} else {
	opt_bool = false;
	if opt_bool = false && opt1_alpha > 0 {opt1_alpha -= 0.1;}
	if icon_alpha > 0 {icon_alpha -= 0.1;}
	if textbox_alpha > 0 {textbox_alpha -= 0.1};
	if texteff_alpha > 0 {texteff_alpha -= 0.1};
	if grad_alpha > 0 {grad_alpha -= 0.05;}
	if icon_alpha <= 0 && front_alpha > 0 {front_alpha -= 0.1};
	if front_alpha <= 0.1 && image_alpha > 0 {image_alpha -= 0.1;}
	cursor_rot = 0;
	if image_alpha <= 0 {
		instance_activate_layer("Instances");
		if instance_exists(obj_screenshot) {instance_destroy(obj_screenshot);}
		instance_destroy();
	}
}

//traçado do ícone do menu principal
var altscale = 0;
if trace_effxscale = 0 {altscale = 0;}
if trace_effxscale < 0 {
	altscale = -1;
	if altscale = -1 {
		trace_effxscale += 0.1;
	}
}

if trace_effxscale > 0 {
	altscale = 1;
	if altscale = 1 {
		trace_effxscale -= 0.1;
	}
}

//seleção no menu
if menu_counter = 1 {
	option1 = "Estatísticas";
	augmtextbox_x = 1020;
	if opt_bool = true && opt1_alpha < 1 {opt1_alpha += 0.1;}
	if opt2_alpha > 0 {opt2_alpha -= 0.1;}
	//caixa de texto ao entrar no menu
	if textbox_x > 970 {textbox_x -= 3};
	if textbox_alpha < 1 {textbox_alpha += 0.05};
	if textbox_x <= 970 && texteff_alpha < 1 {texteff_alpha += 0.1};
	//
	menustats = true;
	menuskills = false;
	menuglyphs = false;
	menuitems = false;
	menumaps = false;
	menulogs = false;
	menusettings = false;
	if icon_effx < 775 {icon_effx += 25};
	if icon_effx > 775 {
		icon_effx -= 25;
		trace_effxscale = -1;
	}
	if stats_xscale < 1.5 {stats_xscale += 0.1};
	if stats_yscale < 1.5 {stats_yscale += 0.1};
} else {
	if stats_xscale > 1 {stats_xscale -= 0.1};
	if stats_yscale > 1 {stats_yscale -= 0.1};
}

if menu_counter = 2 {
	option2 = "Evolução";
	textbox_x = 1020;
	textbox_alpha = 0;
	texteff_alpha = 0;
	if opt1_alpha > 0 {opt1_alpha -= 0.1;}
	if opt2_alpha < 1 {opt2_alpha += 0.1;}
	//caixa de texto ao entrar no menu
	if augmtextbox_x > 970 {augmtextbox_x -= 3};
	if augmtextbox_alpha < 1 {augmtextbox_alpha += 0.05};
	if augmtextbox_x <= 970 && augmtexteff_alpha < 1 {augmtexteff_alpha += 0.1};
	menustats = false;
	menuskills = true;
	menuglyphs = false;
	menuitems = false;
	menumaps = false;
	menulogs = false;
	menusettings = false;
	if icon_effx < 825 {
		icon_effx += 25;
		trace_effxscale = 1;
	}
	if icon_effx > 825 { 
		icon_effx -= 25;
		trace_effxscale = -1;
	}
	if skills_xscale < 1.5 {skills_xscale += 0.1};
	if skills_yscale < 1.5 {skills_yscale += 0.1};
} else {
	if skills_xscale > 1 {skills_xscale -= 0.1};
	if skills_yscale > 1 {skills_yscale -= 0.1};
}

if menu_counter = 3 {
	option1 = "Glifos";
	augmtextbox_x = 1020;
	if opt1_alpha < 1 {opt1_alpha += 0.1;}
	if opt2_alpha > 0 {opt2_alpha -= 0.1;}
	menustats = false;
	menuskills = false;
	menuglyphs = true;
	menuitems = false;
	menumaps = false;
	menulogs = false;
	menusettings = false;
	if icon_effx < 875 {
		icon_effx += 25;
		trace_effxscale = 1;}
	if icon_effx > 875 {
		icon_effx -= 25
		trace_effxscale = -1;}
	if glyphs_xscale < 1.5 {glyphs_xscale += 0.1};
	if glyphs_yscale < 1.5 {glyphs_yscale += 0.1};
} else {
	if glyphs_xscale > 1 {glyphs_xscale -= 0.1};
	if glyphs_yscale > 1 {glyphs_yscale -= 0.1};
}

if menu_counter = 4 {
	option2 = "Itens";
	if opt1_alpha > 0 {opt1_alpha -= 0.1;}
	if opt2_alpha < 1 {opt2_alpha += 0.1;}
	menustats = false;
	menuskills = false;
	menuglyphs = false;
	menuitems = true;
	menumaps = false;
	menulogs = false;
	menusettings = false;
	if icon_effx < 925 {
		icon_effx += 25;
		trace_effxscale = 1;}
	if icon_effx > 925 {
		icon_effx -= 25;
		trace_effxscale = -1;
	}
	if items_xscale < 1.5 {items_xscale += 0.1};
	if items_yscale < 1.5 {items_yscale += 0.1};
} else {
	if items_xscale > 1 {items_xscale -= 0.1};
	if items_yscale > 1 {items_yscale -= 0.1};
}

if menu_counter = 5 {
	option1 = "Mapas";
	if opt1_alpha < 1 {opt1_alpha += 0.1;}
	if opt2_alpha > 0 {opt2_alpha -= 0.1;}
	menustats = false;
	menuskills = false;
	menuglyphs = false;
	menuitems = false;
	menumaps = true;
	menulogs = false;
	menusettings = false;
	if icon_effx < 975 {
		icon_effx += 25
		trace_effxscale = 1;
	}
	if icon_effx > 975 {
		icon_effx -= 25;
		trace_effxscale = -1;
	}
	if maps_xscale < 1.5 {maps_xscale += 0.1};
	if maps_yscale < 1.5 {maps_yscale += 0.1};
} else {
	if maps_xscale > 1 {maps_xscale -= 0.1};
	if maps_yscale > 1 {maps_yscale -= 0.1};
}

if menu_counter = 6 {
	option2 = "Registros";
	if opt1_alpha > 0 {opt1_alpha -= 0.1;}
	if opt2_alpha < 1 {opt2_alpha += 0.1;}
	menustats = false;
	menuskills = false;
	menuglyphs = false;
	menuitems = false;
	menumaps = false;
	menulogs = true;
	menusettings = false;
	if icon_effx < 1025 {
		icon_effx += 25;
		trace_effxscale = 1;
	}
	if icon_effx > 1025 {
		icon_effx -= 25;
		trace_effxscale = -1;
	}
	if logs_xscale < 1.5 {logs_xscale += 0.1};
	if logs_yscale < 1.5 {logs_yscale += 0.1};
} else {
	if logs_xscale > 1 {logs_xscale -= 0.1};
	if logs_yscale > 1 {logs_yscale -= 0.1};
}

if menu_counter = 7 {
	option1 = "Sistema";
	if opt1_alpha < 1 {opt1_alpha += 0.1;}
	if opt2_alpha > 0 {opt2_alpha -= 0.1;}
	menustats = false;
	menuskills = false;
	menuglyphs = false;
	menuitems = false;
	menumaps = false;
	menulogs = false;
	menusettings = true;
	if icon_effx < 1075 {
		icon_effx += 25;
		trace_effxscale = 1;
	}
	if icon_effx > 1075 {
		icon_effx -= 25;
		trace_effxscale = -1;
	}
	if settings_xscale < 1.5 {settings_xscale += 0.1};
	if settings_yscale < 1.5 {settings_yscale += 0.1};
} else {
	if settings_xscale > 1 {settings_xscale -= 0.1};
	if settings_yscale > 1 {settings_yscale -= 0.1};
}

//cursor nos atributos (menu stats)
if obj_control.inmenu = true {
	if menustats = true {
		if cursor_effxscale < 1 {cursor_effxscale += 0.1;}
		if cursor_effyscale < 1 {cursor_effyscale += 0.1;}
		if menu_navu {
			if cursor_effy > 423 {
				textbox_x = 1020;
				textbox_alpha = 0;
				cursor_effy -=35
			};
			cursor_effxscale = 0.05;
			cursor_effyscale = 0.05;
		}
		if menu_navd {
			if cursor_effy < 563 {
				textbox_x = 1020;
				textbox_alpha = 0;
				cursor_effy +=35;
			}
			cursor_effxscale = 0.05;
			cursor_effyscale = 0.05;
		}
		if menu_navl {
			if cursor_effx > 983 {
				textbox_x = 1020;
				textbox_alpha = 0;
				cursor_effx -=270;
			}
			cursor_effxscale = 0.05;
			cursor_effyscale = 0.05;
		}
		if menu_navr {
			if cursor_effx < 1253 {
				textbox_x = 1020;
				textbox_alpha = 0;
				cursor_effx += 270;
			}
			cursor_effxscale = 0.05;
			cursor_effyscale = 0.05;
		}
	}
	if left_btn {
		if menu_counter > 1 {
			menu_counter --;
			cursor_xscale = 0.05;
			cursor_yscale = 0.05;
		}
	}
	if right_btn {
		if menu_counter < 7 {
			menu_counter ++;
			cursor_xscale = 0.05;
			cursor_yscale = 0.05;
		}
	}
}

//informação dos atributos na caixa de texto
//phys
if cursor_effx = 983 && cursor_effy = 423 {
	eff_default = eff_phys;
}
//azul
if cursor_effx = 983 && cursor_effy = 458 {
	eff_default = eff_tidem;
}
//red
if cursor_effx = 983 && cursor_effy = 493 {
	eff_default = eff_kardi;
}
//yellow
if cursor_effx = 983 && cursor_effy = 528 {
	eff_default = eff_vari;
}
//green
if cursor_effx = 983 && cursor_effy = 563 {
	eff_default = eff_gara;
}
//white
if cursor_effx = 1253 && cursor_effy = 423 {
	eff_default = eff_kouem;
}
//black
if cursor_effx = 1253 && cursor_effy = 458 {
	eff_default = eff_jiriah;
}
//poison
if cursor_effx = 1253 && cursor_effy = 493 {
	eff_default = eff_jian;
}
//atma
if cursor_effx = 1253 && cursor_effy = 528 {
	eff_default = eff_atma;
}
//anatta
if cursor_effx = 1253 && cursor_effy = 563 {
	eff_default = eff_anatta;
}

//cursor na lista de augments (menu evolução)
var augmscale = 0;
if trace_augmyscale = 0 {augmscale = 0;}
if trace_augmyscale < 0 {
	augmscale = -1;
	if augmscale = -1 {
		trace_augmyscale += 0.1;
	}
}

if trace_augmyscale > 0 {
	augmscale = 1;
	if augmscale = 1 {
		trace_augmyscale -= 0.1;
	}
}
//cursor nas arvores
if cursoraugm_xscale < 1 {cursoraugm_xscale += 0.1};
if cursoraugm_yscale < 1 {cursoraugm_yscale += 0.1};

//seleção das opções na lista (mostra a respectiva skill tree)
if augm_counter = 1 {
	tiroslime = false;
	socoslime = false;
	escudoslime = false;
	corrida = false;
	vitalidade = false;
	coletor = false;
	mana = false;
	tecnicas = false;
}

switch (augm_counter) {
    case 1:
        tiroslime = true;
		socoslime = false;
		escudoslime = false;
		corrida = false;
		vitalidade = false;
		coletor = false;
		mana = false;
		tecnicas = false;
        break;
	case 2:
        tiroslime = false;
		socoslime = true;
		escudoslime = false;
		corrida = false;
		vitalidade = false;
		coletor = false;
		mana = false;
		tecnicas = false;
        break;
	case 3:
        tiroslime = false;
		socoslime = false;
		escudoslime = true;
		corrida = false;
		vitalidade = false;
		coletor = false;
		mana = false;
		tecnicas = false;
        break;
	case 4:
        tiroslime = false;
		socoslime = false;
		escudoslime = false;
		corrida = true;
		vitalidade = false;
		coletor = false;
		mana = false;
		tecnicas = false;
        break;
	case 5:
        tiroslime = false;
		socoslime = false;
		escudoslime = false;
		corrida = false;
		vitalidade = true;
		coletor = false;
		mana = false;
		tecnicas = false;
        break;
	case 6:
        tiroslime = false;
		socoslime = false;
		escudoslime = false;
		corrida = false;
		vitalidade = false;
		coletor = true;
		mana = false;
		tecnicas = false;
        break;
	case 7:
        tiroslime = false;
		socoslime = false;
		escudoslime = false;
		corrida = false;
		vitalidade = false;
		coletor = false;
		mana = true;
		tecnicas = false;
        break;
	case 8:
        tiroslime = false;
		socoslime = false;
		escudoslime = false;
		corrida = false;
		vitalidade = false;
		coletor = false;
		mana = false;
		tecnicas = true;
        break;
    default:
        tiroslime = false;
		socoslime = false;
		escudoslime = false;
		corrida = false;
		vitalidade = false;
		coletor = false;
		mana = false;
		tecnicas = false;
        break;
}

//navegação na lista
if menuskills = true {
	if menu_navu {
		if augm_counter > 1 {
			augmtree_x = 860;
			cursoraugm_y = 418;
			augm_counter--;
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
		}
		if icon_augmy > 350 {
			icon_augmy -= 40;
			trace_augmyscale = 1;
		}
	}
	if menu_navd {
		if augm_counter < 8 {
			augmtree_x = 860;
			cursoraugm_y = 418;
			augm_counter++;
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
		}
		if icon_augmy < 630 {
			icon_augmy += 40;
			trace_augmyscale = -1;
		}
	}
	if tiroslime = true {	
//tiro de slime - navegação an árvore
		if augm_navl && treemove = true && augmtree_x < 860 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x += 200};
			treemove = false;
			alarm[0] = room_speed/3;
		
		}
		if augm_navr && treemove = true && augmtree_x > 60 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x -= 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navd && treemove = true && cursoraugm_y < 618 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 60 {cursoraugm_y = 418};
			if augmtree_x = 260 {cursoraugm_y = 418};
			if augmtree_x = 460 {cursoraugm_y = 618};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navu && treemove = true && cursoraugm_y > 218 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 260 {cursoraugm_y = 218};
			if augmtree_x = 460 {cursoraugm_y = 418};
			treemove = false;
			alarm[0] = room_speed/3;
		}
	}
	if socoslime = true {	
//soco de slime - navegação an árvore
		if augm_navl && treemove = true && augmtree_x < 860 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x += 200};
			treemove = false;
			alarm[0] = room_speed/3;
		
		}
		if augm_navr && treemove = true && augmtree_x > 60 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x -= 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navd && treemove = true && cursoraugm_y < 618 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 60 {cursoraugm_y = 418};
			if augmtree_x = 260 {cursoraugm_y = 418};
			if augmtree_x = 460 {cursoraugm_y = 618};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navu && treemove = true && cursoraugm_y > 218 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 260 {cursoraugm_y = 218};
			if augmtree_x = 460 {cursoraugm_y = 418};
			treemove = false;
			alarm[0] = room_speed/3;
		}
	}
	if escudoslime = true {	
//escudo de slime - navegação an árvore
		if augm_navl && treemove = true && augmtree_x < 860 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x += 200};
			treemove = false;
			alarm[0] = room_speed/3;
		
		}
		if augm_navr && treemove = true && augmtree_x > 460 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x -= 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navd && treemove = true {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 460 {cursoraugm_y = 418};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navu && treemove = true {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 460 {cursoraugm_y = 218};
			treemove = false;
			alarm[0] = room_speed/3;
		}
	}
	if corrida = true {	
//corrida - navegação an árvore
		if augm_navl && treemove = true && augmtree_x < 860 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x += 200};
			treemove = false;
			alarm[0] = room_speed/3;
		
		}
		if augm_navr && treemove = true && augmtree_x > 260 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x -= 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navd && treemove = true {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 460 {cursoraugm_y = 418};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navu && treemove = true {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 460 {cursoraugm_y = 218};
			treemove = false;
			alarm[0] = room_speed/3;
		}
	}
	if vitalidade = true {	
//vitalidade - navegação na árvore
		if augm_navl && treemove = true && augmtree_x < 860 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x += 200};
			if cursoraugm_y = 618 {
				if augmtree_x = -140 {augmtree_x = 460};
			}
			if cursoraugm_y = 218 {
				if augmtree_x = -140 {augmtree_x = 260};
			}
			treemove = false;
			alarm[0] = room_speed/3;
		
		}
		if augm_navr && treemove = true && augmtree_x > -140 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x -= 200};
			if cursoraugm_y = 618 {
				if augmtree_x = 460 {augmtree_x = -140};
			}
			if cursoraugm_y = 218 {
				if augmtree_x = 260 {augmtree_x = -140};
			}
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navd && treemove = true && cursoraugm_y < 618 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 260 {cursoraugm_y = 418};
			if augmtree_x = 460 {cursoraugm_y = 618};
			if augmtree_x = -140 && cursoraugm_y < 618 {cursoraugm_y += 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navu && treemove = true && cursoraugm_y > 218 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 260 {cursoraugm_y = 218};
			if augmtree_x = 460 {cursoraugm_y = 418};
			if augmtree_x = -140 && cursoraugm_y > 218 {cursoraugm_y -= 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
	}
	if coletor = true {	
//coletor - navegação na árvore
		if augm_navl && treemove = true && augmtree_x < 860 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x += 200};
			treemove = false;
			alarm[0] = room_speed/3;
		
		}
		if augm_navr && treemove = true && augmtree_x > 260 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x -= 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navd && treemove = true {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 460 && cursoraugm_y < 618 {cursoraugm_y += 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navu && treemove = true {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 460 && cursoraugm_y > 218 {cursoraugm_y -= 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
	}
	if mana = true {	
//mana - navegação na árvore
		if augm_navl && treemove = true && augmtree_x < 860 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x += 200};
			treemove = false;
			alarm[0] = room_speed/3;
		
		}
		if augm_navr && treemove = true && augmtree_x > 60 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x -= 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navd && treemove = true && cursoraugm_y < 618 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 60 {cursoraugm_y = 418};
			if augmtree_x = 460 {cursoraugm_y = 618};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navu && treemove = true && cursoraugm_y > 218 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 60 {cursoraugm_y = 218};
			if augmtree_x = 460 {cursoraugm_y = 418};
			treemove = false;
			alarm[0] = room_speed/3;
		}
	}
	if tecnicas = true {	
//técnicas - navegação na árvore
		if augm_navl && treemove = true && augmtree_x < 860 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x += 200};
			if cursoraugm_y = 618 {
				if augmtree_x = 60 {augmtree_x = 460};
				if augmtree_x < 460 {augmtree_x += 200};
			}
			if cursoraugm_y = 218 {
				if augmtree_x = 60 {augmtree_x = 260};
				if augmtree_x = -340 {augmtree_x = 60};
				if augmtree_x = -740 {augmtree_x = -340};
			
			}
			treemove = false;
			alarm[0] = room_speed/3;
		
		}
		if augm_navr && treemove = true && augmtree_x > -740 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if cursoraugm_y = 418 {augmtree_x -= 200};
			if cursoraugm_y = 618 {
				if augmtree_x <= 60 {augmtree_x -=200};
				if augmtree_x = 460 {augmtree_x = 60};
			}
			if cursoraugm_y = 218 {
				if augmtree_x = -340 {augmtree_x = -740};
				if augmtree_x = 60 {augmtree_x = -340};
				if augmtree_x = 260 {augmtree_x = 60};
			}
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navd && treemove = true && cursoraugm_y < 618 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 260 {cursoraugm_y = 418};
			if augmtree_x = 460 {cursoraugm_y = 618};
			if augmtree_x = 60 && cursoraugm_y < 618 {cursoraugm_y += 200};
			if augmtree_x = -140 && cursoraugm_y < 618 {cursoraugm_y += 200};
			if augmtree_x = -340 && cursoraugm_y < 618 {cursoraugm_y += 200};
			if augmtree_x = -540 {cursoraugm_y = 618};
			if augmtree_x = -740 && cursoraugm_y < 618 {cursoraugm_y += 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
		if augm_navu && treemove = true && cursoraugm_y > 218 {
			augmtextbox_x = 1020;
			augmtextbox_alpha = 0;
			augmtexteff_alpha = 0;
			cursoraugm_xscale = 0;
			cursoraugm_yscale = 0;
			if augmtree_x = 260 {cursoraugm_y = 218};
			if augmtree_x = 460 {cursoraugm_y = 418};
			if augmtree_x = 60 && cursoraugm_y > 218 {cursoraugm_y -= 200};
			if augmtree_x = -140 {cursoraugm_y = 418};
			if augmtree_x = -340 && cursoraugm_y > 218 {cursoraugm_y -= 200};
			if augmtree_x = -540 {cursoraugm_y = 418};
			if augmtree_x = -740 && cursoraugm_y > 218 {cursoraugm_y -= 200};
			treemove = false;
			alarm[0] = room_speed/3;
		}
	}
}
		
