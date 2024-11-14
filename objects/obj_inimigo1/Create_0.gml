/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


alarm[0] = 120;

criado_em_sequence = in_sequence;

atirando = function()
{
	
	efeito_som(sfx_laser2, .1);
	
	if(x < room_width && x > 0 && y > 0 && y < room_height)
	{
		var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro_inimigo1);
		_tiro.vspeed = 4;
	}	
}

morrendo = function()
{
	sendo_destruido(obj_part_explosao_inimigo);
	
	var _chance = random(100);

	efeito_som(sfx_explosion, .1);
	
	if(_chance > 95)
	{
		instance_create_layer(x, y, layer, obj_power_up);
	}
		
}