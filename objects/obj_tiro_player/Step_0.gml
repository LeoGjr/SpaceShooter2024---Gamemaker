/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if(y <= -32)
{
	instance_destroy();
}

image_xscale = lerp(image_xscale, 1, .1);
image_yscale = lerp(image_xscale, 1, .1);

vspeed = lerp(vspeed, -10, .1);