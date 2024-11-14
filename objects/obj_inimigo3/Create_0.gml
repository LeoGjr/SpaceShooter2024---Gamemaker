/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


vida = 10;

estado = "chegando";

contador = 0;

decidi_direcao = false;

tempo_carregando = game_get_speed(gamespeed_fps) * 3;
timer_carregando = 0;

inicia_efeito_mola();
inicia_efeito_branco();

maquina_de_estado = function()
{
	switch(estado)
	{
		case "chegando":
		{
			if(y < 160)
			{
				vspeed = 1.2;
			}
			else
			{
				estado = "carregando";
			}
		}
		break;
		
		case "carregando":
		{
			vspeed = 0;
			
			timer_carregando++;
			
			if(timer_carregando >= tempo_carregando)
			{
				estado = choose("atirando", "atirando2");
				
				timer_carregando = 0;
				
				contador++;
			}						
		}
		break;
		
		case "atirando":
		{			
			efeito_som(sfx_laser2, .1);
			if(instance_exists(obj_player))
			{
				var _dir = point_direction(x, y, obj_player.x, obj_player.y);
			
				var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro_inimigo3a);
				_tiro.speed = 2;
				_tiro.direction = _dir;
				_tiro.image_angle = _dir + 90;
			}
			
			if(contador < 3)
			{
				estado = "carregando";
			}
			else
			{
				estado = "fugindo";
			}
			
			
		}
		break;
		
		case "atirando2":
		{
			var _ang = 255;
			
			efeito_som(sfx_laser2, .1);
			
			repeat(3)
			{
				var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro_inimigo_3b);
				_tiro.speed = 4;
				_tiro.direction = _ang;
				
				_ang += 15;
			}					
			
			if(contador < 3)
			{
				estado = "carregando";
			}
			else
			{
				estado = "fugindo";
			}
			
		}
		break;
		
		case "fugindo":
		{
			if(decidi_direcao == false)
			{
				hspeed = choose(-1, 1);
				
				decidi_direcao = true;
			}
			vspeed = -1;
			
			if(y < -100)
			{
				instance_destroy();
			}
			
		}
		break;		
	}
}

morrendo = function()
{
	
	efeito_mola(1.5, .5);
	timer_efeito_branco(3);
	
	if(vida > 1)
	{
		vida--;
	}
	else
	{
		instance_destroy();
		instance_create_layer(x, y, "Particulas", obj_part_explosao_inimigo);
		
		screenskahe(20);
		
		efeito_som(sfx_explosion, .1);
	}
}