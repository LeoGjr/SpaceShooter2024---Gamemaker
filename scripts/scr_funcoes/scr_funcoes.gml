// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

global.debug = false;

global.destino = rm_inicio;

global.transicao = false;

function sendo_destruido(_particula = obj_part_tiro)
{
	instance_destroy();
	
	instance_create_layer(x, y, "Particulas", _particula);
}

function screenskahe(_treme = 1)
{
	if(instance_exists(obj_screenshake))
	{
		with(obj_screenshake)
		{
			if(_treme > treme)
			{
				treme = _treme;
			}
		}
		//obj_screenshake.treme = _treme;
	}
}

function inicia_efeito_mola()
{
	xscale = 1;
	yscale = 1;
}

function efeito_mola(_xscale = 1, _yscale = 1)
{
	xscale = _xscale;
	yscale = _yscale;
}

function retorna_mola(_qtd = .1)
{
	xscale = lerp(xscale, 1, _qtd);
	yscale = lerp(yscale, 1, _qtd);
}

function desenha_efeito_mola()
{
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}

function inicia_efeito_branco()
{
	tomei_dano = false;
}

function timer_efeito_branco(_tempo = 1)
{
	tomei_dano = _tempo;
}

function contador_efeito_branco()
{
	if(tomei_dano > 0)
	{
		tomei_dano--;
	}
}

function desenha_efeito_branco(_funcao_desenho = draw_self)
{
	if(tomei_dano)
	{
		shader_set(sh_branco);
		_funcao_desenho();
		shader_reset();
	}
	else
	{
		_funcao_desenho();
	}
	
}

function efeito_som(_som = sfx_laser1, _variacao = .1)
{
	var _pitch = random_range(1 - _variacao, 1 + _variacao);
	
	audio_play_sound(_som, 0, 0, , , _pitch);
}

function mudar_room_transicao()
{
	room_goto(global.destino);
	
	audio_stop_all();
}

function finaliza_transicao()
{
	global.transicao = false;
}