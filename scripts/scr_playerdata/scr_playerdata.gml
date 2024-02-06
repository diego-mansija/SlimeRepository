//stats
globalvar player_level, player_atk, player_def, player_hp, fr_total, fr_augm, fr_glifo,
punch_atk, shot_atk, pa, xp, xp_next, xp_total, manapoints, cas;

//timer
globalvar steps, seconds, minutes, hours;

//cálculo do ataque preciso (inclusos todos os efeitos)
globalvar atq_base, atq_tiro, atq_soco, augm_tiro, augm_soco, glifo_elem, glifo_fis, glifo_align,
fator_prop, fator_align, planta_fis, planta_elem, augm_arcane, skill;

//timer
steps = 0;
seconds = 0;
minutes = 0;
hours = 0;

//
player_level = 1;
manapoints = 0;

//fórmula do ataque preciso
atq_base = player_level * 5;
atq_tiro = player_level * 5;
atq_soco = atq_base * 2;
augm_tiro = 0; //aumento na skill base
augm_soco = 0; //aumento na skill base
glifo_elem = player_level * 5; //só entra no cálculo quando usada uma erva para alteração de propriedade elemental.
glifo_fis = 0;
glifo_align = 0;
planta_fis = 0;
planta_elem = 0;
augm_arcane = player_level * manapoints;
fator_prop = 1;
fator_align = 1;
skill = 0;

//
xp = 0;
xp_next = 0;
xp_total = 0;
pa = 0;
player_atk = atq_base + glifo_fis;
player_def = player_level * 5;
player_hp = player_level * 50;
fr_augm = 0;
fr_glifo = 0;
fr_total = (player_level + 100) + fr_augm + fr_glifo;

cas = 6413;

punch_atk = player_atk*2;
shot_atk = player_atk;


