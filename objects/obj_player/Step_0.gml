/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if(keyboard_check_released(vk_tab))
{
	global.debug = !global.debug;
}

controla_player();

if(keyboard_check_pressed(ord("O")))
{
	level_tiro--;
}

if(keyboard_check_pressed(ord("L")))
{
	level_tiro++;
}

retorna_mola(.3);

contador_efeito_branco();
