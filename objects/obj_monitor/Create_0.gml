// "tipo" é definido pelo objeto filho antes desse evento rodar.
// Fallback caso chamado diretamente:
if (!variable_instance_exists(id, "tipo")) tipo = "energia";

raio_interacao = 80;
player_perto   = false;
pulso          = 0; // animação de borda