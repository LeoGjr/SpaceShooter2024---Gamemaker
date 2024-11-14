/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

layer_sequence_create("seq_inimigos", 0, 0, ondas[atual]);



if(atual < array_length(ondas) - 1)
{
	atual++;
	
	alarm[0] = 320;
}
