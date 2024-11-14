/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

audio_stop_all();
audio_play_sound(musica_fundo, 0, 1);


vel = 2;

vida = 3;

escudos = 3;
meu_escudo = noone;

inicia_efeito_branco();

espera_tiro = 8;
timer_tiro = 0;

inicia_efeito_mola();

tempo_invencivel = 60;
timer_invencivel = 0;

level_tiro = 1;

controla_player = function()
{
	timer_invencivel--;
	
	var _cima, _baixo, _esq, _dir, _atirar;
	
	_cima = keyboard_check(ord("W")) or keyboard_check(vk_up);
	_baixo = keyboard_check(ord("S")) or keyboard_check(vk_down);
	_esq = keyboard_check(ord("A")) or keyboard_check(vk_left);
	_dir = keyboard_check(ord("D")) or keyboard_check(vk_right);
	
	_atirar = keyboard_check(ord("Z")) or mouse_check_button(mb_left);
	
	var _velh = (_dir - _esq) * vel;
	x += _velh;
	
	x = clamp(x, sprite_width/2, room_width - sprite_width/2);
	
	var _velv = (_baixo - _cima) * vel;
	y += _velv;
	
	y = clamp(y, 19, 500);
	
	if(keyboard_check_pressed(ord("E")))
	{
		usa_escudo();
	}
	
	com_escudo();
	
	timer_tiro--;
	
	if(_atirar && timer_tiro <= 0)
	{
		
		efeito_mola(.8, 1.2);
		audio_stop_sound(sfx_laser1);
		efeito_som(sfx_laser1, .1);
		
		if(level_tiro == 1)
		{
			tiro_1();
		}		
		else if(level_tiro == 2)
		{
			tiro_2();		
		}
		else if(level_tiro == 3)
		{
			tiro_3();
		}
		timer_tiro = espera_tiro;
	}			
}


tiro_1 = function()
{
	var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro_player);
		
	//_tiro.vspeed = -10;			
}

tiro_2 = function()
{
	var _tiro = instance_create_layer(x - 10, y, "Tiros", obj_tiro_player);	
	//_tiro.vspeed = -10;	
	
	_tiro = instance_create_layer(x + 10, y, "Tiros", obj_tiro_player);
	//_tiro.vspeed = -10;	
}

tiro_3 = function()
{
	tiro_1();
	tiro_2();
}

ganha_level_tiro = function()
{
	if(level_tiro < 3)
	{
		level_tiro++;
	}	
}

desenha_icone = function(_icone = spr_icone_vida, _qtd = 1, _y = 20)
{
	var _espaco = 0;
	repeat(_qtd)
	{
		draw_sprite_ext(_icone, 0, 20 + _espaco, _y, 1, 1, 0, c_white, 0.5);
	
		_espaco += 30;
	}
}

perde_vida = function()
{
	if(timer_invencivel > 0) return;	
	
	efeito_mola(2, .5);
	timer_efeito_branco(3);
	
	if(vida > 0)
	{
		vida--;
		
		timer_invencivel = tempo_invencivel;
		
		screenskahe(10);
		
	}
	else
	{
		instance_destroy();
		instance_create_layer(x, y, "Particulas", obj_explosao_player);
		screenskahe(50);
		
		layer_sequence_create("sq_transicao", x, y, sq_transicao1);
		global.transicao = true;
	}
}

usa_escudo = function()
{
	if(escudos > 0 && meu_escudo == noone)
	{
		escudos--;
		
		efeito_som(sfx_shieldUp, 0);
	
		meu_escudo = instance_create_layer(x, y, "Escudo", obj_escudo);
	}	
}

com_escudo = function()
{
	if(instance_exists(meu_escudo))
	{
		meu_escudo.x = x;
		meu_escudo.y = y;
	
		timer_invencivel = 10;
	}
	else
	{
		meu_escudo = noone;
	}
}

layer_sequence_create("sq_transicao", x, y, sq_transicao2);

global.destino = rm_inicio;