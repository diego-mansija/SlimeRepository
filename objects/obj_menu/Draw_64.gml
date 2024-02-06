//
draw_self();
if menuskills = true {
	//árvores de skills (está nesta seção para que seja criado antes dos elementos comuns a todas
	//as opções do menu, para ficar atrás das bordas e do gradiente)
	draw_text(room_width/2, 150, augmtree_x);//lembrar de apagar
	draw_text(room_width/2, 200, cursoraugm_y);//lembrar de apagar
	if tiroslime = true {
		draw_sprite_ext(spr_shottree, 0, augmtree_x, 428, 1, 1, 0, c_black, opt2_alpha/2);
		draw_sprite_ext(spr_shottree, 0, augmtree_x, 418, 1, 1, 0, c_white, opt2_alpha);
	}
	if socoslime = true {
		draw_sprite_ext(spr_punchtree, 0, augmtree_x, 428, 1, 1, 0, c_black, opt2_alpha/2);
		draw_sprite_ext(spr_punchtree, 0, augmtree_x, 418, 1, 1, 0, c_white, opt2_alpha);
	}
	if escudoslime = true {
		draw_sprite_ext(spr_shieldtree, 0, augmtree_x, 428, 1, 1, 0, c_black, opt2_alpha/2);
		draw_sprite_ext(spr_shieldtree, 0, augmtree_x, 418, 1, 1, 0, c_white, opt2_alpha);
	}
	if corrida = true {
		draw_sprite_ext(spr_dashtree, 0, augmtree_x, 428, 1, 1, 0, c_black, opt2_alpha/2);
		draw_sprite_ext(spr_dashtree, 0, augmtree_x, 418, 1, 1, 0, c_white, opt2_alpha);
	}
	if vitalidade = true {
		draw_sprite_ext(spr_vittree, 0, augmtree_x, 428, 1, 1, 0, c_black, opt2_alpha/2);
		draw_sprite_ext(spr_vittree, 0, augmtree_x, 418, 1, 1, 0, c_white, opt2_alpha);
	}
	if coletor = true {
		draw_sprite_ext(spr_gathertree, 0, augmtree_x, 428, 1, 1, 0, c_black, opt2_alpha/2);
		draw_sprite_ext(spr_gathertree, 0, augmtree_x, 418, 1, 1, 0, c_white, opt2_alpha);
	}
	if mana = true {
		draw_sprite_ext(spr_manatree, 0, augmtree_x, 428, 1, 1, 0, c_black, opt2_alpha/2);
		draw_sprite_ext(spr_manatree, 0, augmtree_x, 418, 1, 1, 0, c_white, opt2_alpha);
	}
	if tecnicas = true {
		draw_sprite_ext(spr_techtree, 0, augmtree_x, 428, 1, 1, 0, c_black, opt2_alpha/2);
		draw_sprite_ext(spr_techtree, 0, augmtree_x, 418, 1, 1, 0, c_white, opt2_alpha);
	}
	draw_sprite_ext(spr_cursoraugm, 0, 920, cursoraugm_y, cursoraugm_xscale, cursoraugm_yscale, cursor_rot, c_white, opt2_alpha);
}
draw_sprite_ext(spr_auggrad, 0, 0, 0, 1, 1, 0, c_white, grad_alpha);
draw_sprite_ext(spr_menufront, 0, 0, 0, 1, 1, 0, c_white, front_alpha);
if !left_btnhold {
	draw_sprite_ext(spr_leftbtnup, 0, 649, 92, 1, 1, 0, c_white, icon_alpha);
} else {draw_sprite_ext(spr_leftbtndwn, 0, 649, 92, 1, 1, 0, c_white, icon_alpha);}
if !right_btnhold {
	draw_sprite_ext(spr_rightbtnup, 0, 1196, 92, 1, 1, 0, c_white, icon_alpha);
} else {draw_sprite_ext(spr_rightbtndwn, 0, 1196, 92, 1, 1, 0, c_white, icon_alpha);}
draw_set_font(fnt_ban26);
draw_set_halign(fa_center);
draw_text_color(room_width/2, 62, option1, c_white, c_white, c_white, c_white, opt1_alpha);
draw_text_color(room_width/2, 62, option2, c_white, c_white, c_white, c_white, opt2_alpha);

//icones do menu
draw_sprite_ext(spr_traceeff, 0, icon_effx, 925, trace_effxscale, 1, 0, c_white, icon_alpha);
draw_sprite_ext(spr_iconeff, 0, icon_effx, 925, 1, 1, 0, c_white, icon_alpha);
draw_sprite_ext(spr_stats, 0, 775, 960, stats_xscale, stats_yscale, 0, c_white, icon_alpha);
draw_sprite_ext(spr_skills, 0, 825, 960, skills_xscale, skills_yscale, 0, c_white, icon_alpha);
draw_sprite_ext(spr_glyphs, 0, 875, 960, glyphs_xscale, glyphs_yscale, 0, c_white, icon_alpha);
draw_sprite_ext(spr_items, 0, 925, 960, items_xscale, items_yscale, 0, c_white, icon_alpha);
draw_sprite_ext(spr_maps, 0, 975, 960, maps_xscale, maps_yscale, 0, c_white, icon_alpha);
draw_sprite_ext(spr_logs, 0, 1025, 960, logs_xscale, logs_yscale, 0, c_white, icon_alpha);
draw_sprite_ext(spr_settings, 0, 1075, 960, settings_xscale, settings_yscale, 0, c_white, icon_alpha);

//menu estatísticas
if menustats = true {
	draw_set_halign(fa_left);
	//nível e exp
	draw_set_font(fnt_ban26);
	draw_text_color(350, 275, "Nv. " + string_repeat("0", 3-string_length(string(player_level))) + string(player_level) + "  " + "Slime", c_white, c_white, c_white, c_white, opt1_alpha);
	draw_set_font(fnt_ban20);
	draw_text_color(350, 336, "EXP", c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(350, 371, "Prox. Nível", c_white, c_white, c_white, c_white, opt1_alpha);
	//efeitos ativos
	draw_text_color(970, 336, "Atributos", c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(1030, 405, bonus_phys, c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(1030, 440, bonus_tidem, c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(1030, 475, bonus_kardi, c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(1030, 510, bonus_vari, c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(1030, 545, bonus_gara, c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(1300, 405, bonus_kouem, c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(1300, 440, bonus_jiriah, c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(1300, 475, bonus_jian, c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(1300, 510, bonus_atma, c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(1300, 545, bonus_anatta, c_white, c_white, c_white, c_white, opt1_alpha);
	draw_sprite_ext(spr_cursoreff, 0, cursor_effx, cursor_effy, cursor_effxscale, cursor_effyscale, cursor_rot, c_white, opt1_alpha);
	draw_sprite_ext(spr_effect1, 0, 970, 410, 1, 1, 0, c_white, opt1_alpha);
	draw_sprite_ext(spr_effect2, 0, 1240, 410, 1, 1, 0, c_white, opt1_alpha);
	//estatísticas
	draw_text_color(350, 490, "Ataque", c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(350, 525, "Defesa", c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(350, 560, "HP", c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(350, 595, "FR", c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(350, 630, "Mana", c_white, c_white, c_white, c_white, opt1_alpha);
	//
	draw_text_color(394, 763, string_repeat("0", 7-string_length(string(cas))) + string(cas), c_white, c_white, c_white, c_white, opt1_alpha);
	//timer
	draw_text_color(394, 808, (string_repeat("0", 3-string_length(string(hours))) + string(hours) + ":" +
							   string_repeat("0", 2-string_length(string(minutes))) + string(minutes) + ":" +
							   string_repeat("0", 2-string_length(string(seconds))) + string(seconds)), c_white, c_white, c_white, c_white, opt1_alpha);
	//
	draw_set_halign(fa_right);
	draw_text_color(653, 336, string(xp_total), c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(653, 371, string(xp_next), c_white, c_white, c_white, c_white, opt1_alpha);
	//
	draw_text_color(540, 490, string_repeat("0", 4-string_length(string(player_atk))) + string(player_atk), c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(540, 525, string_repeat("0", 4-string_length(string(player_def))) + string(player_def), c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(540, 560, string_repeat("0", 4-string_length(string(player_hp))) + string(player_hp), c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(540, 595, string_repeat("0", 3-string_length(string(fr_total))) + string(fr_total), c_white, c_white, c_white, c_white, opt1_alpha);
	draw_text_color(540, 525, string_repeat("0", 4-string_length(string(player_def))) + string(player_def), c_white, c_white, c_white, c_white, opt1_alpha);
	draw_sprite_ext(spr_manapoint, 0, 486, 645, 1, 1, 0, c_white, opt1_alpha);
	draw_sprite_ext(spr_cashour, 0, 350, 768, 1, 1, 0, c_white, opt1_alpha);
	
	//caixa de texto
	draw_sprite_ext(spr_descrtextbox, 0, textbox_x, 680, 1, 1, 0, c_white, textbox_alpha);
	if textbox_x <= 970 {
		draw_set_halign(fa_left);
		draw_set_font(fnt_ban20);
		draw_text_color(1015, 700, "Efeitos Ativos", c_white, c_white, c_white, c_white, texteff_alpha);
		draw_text_color(1015, 740, eff_default, c_white, c_white, c_white, c_white, texteff_alpha);
	}
	
	//opções de botões no rodapé
	draw_sprite_ext(spr_optstats, 0, 755, 1016, 1, 1, 0, c_white, opt1_alpha);
}

//menu evolução
if menuskills = true {
	draw_set_halign(fa_left);
	draw_set_font(fnt_ban20);
	draw_text_color(170, 335, "Tiro de Slime", c_white, c_white, c_white, c_white, opt2_alpha);
	draw_text_color(170, 375, "Soco de Slime", c_white, c_white, c_white, c_white, opt2_alpha);
	draw_text_color(170, 415, "Escudo de Slime", c_white, c_white, c_white, c_white, opt2_alpha);
	draw_text_color(170, 455, "Corrida", c_white, c_white, c_white, c_white, opt2_alpha);
	draw_text_color(170, 495, "Vitalidade", c_white, c_white, c_white, c_white, opt2_alpha);
	draw_text_color(170, 535, "Coletor", c_white, c_white, c_white, c_white, opt2_alpha);
	draw_text_color(170, 575, "Mana", c_white, c_white, c_white, c_white, opt2_alpha);
	draw_text_color(170, 615, "Técnicas", c_white, c_white, c_white, c_white, opt2_alpha);
	//icone da lista
	draw_sprite_ext(spr_traceaugm, 0, 150, icon_augmy, 1, trace_augmyscale, 0, c_white, icon_alpha);
	draw_sprite_ext(spr_iconaugm, 0, 150, icon_augmy, 1, 1, 0, c_white, icon_alpha);
	//contagem de genes
	draw_sprite_ext(spr_geneqty, 0, 170, 860, 1, 1, 0, c_white, opt2_alpha);
	draw_text_color(215, 830, string_repeat("0", 7-string_length(string(cas))) + string(cas), c_white, c_white, c_white, c_white, opt2_alpha);
	//caixa de texto
	draw_sprite_ext(spr_descrtextbox, 0, augmtextbox_x, 680, 1, 1, 0, c_white, augmtextbox_alpha);
	//opções de botões no rodapé
	draw_sprite_ext(spr_optaugm, 0, 675, 1010, 1, 1, 0, c_white, opt2_alpha);
};