/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

menu = ["Jogar", "Tutorial", "Sair"];

atual = 0;

margem = 40;

controla_menu = function()
{
	if(keyboard_check_pressed(vk_down))
	{
		atual += 1;
	
		efeito_som(sfx_zap, .1);
	
		margem = 0;
	}

	if(keyboard_check_pressed(vk_up))
	{
		atual--;		
	
		efeito_som(sfx_zap, .1);
	
		margem = 0;
	}

	atual = clamp(atual, 0, array_length(menu)-1);

	margem = lerp(margem, 40, .1);
	
	if(keyboard_check_pressed(vk_enter))
	{
		ativa_menu();
	}		
}

ativa_menu = function()
{
	switch(atual)
	{
		case 0:
			layer_sequence_create("sq_transicao", room_width / 2, room_height / 2, sq_transicao1);
			
			global.destino = rm_jogo;
			
			global.transicao = true;
		break;
		
		case 1:
			layer_sequence_create("sq_transicao", room_width / 2, room_height / 2, sq_transicao1);
			
			global.destino = rm_tutorial;
			
			global.transicao = true;
		break;
		
		case 2:
			game_end();
		break;
	}
}

desenha_menu = function()
{
	var _meio_tela = display_get_gui_height() / 2;

	draw_set_valign(1);

	for(var i = 0; i < array_length(menu); i++)
	{
	
		var _cor = c_white;
	
		var _marg = 0;
	
		if(i == atual)
		{
			_cor = c_red;
		
			_marg = margem;
		}
	
		draw_set_color(_cor);
		draw_text(20 + _marg, _meio_tela + i * 20, menu[i]);
		draw_set_color(-1);
	}


	draw_set_valign(0);
}