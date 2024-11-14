/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.debug)
{
	draw_text(20, 20, "Level tiro: " + string(level_tiro));
}

if(global.transicao) exit;
var _gui_height = display_get_gui_height();

desenha_icone(spr_icone_escudo, escudos, _gui_height - 20);

desenha_icone(spr_icone_vida, vida, _gui_height - 50);
