
// =====================
// REINICIAR JOGO
// =====================

if (keyboard_check_pressed(ord("R")))
{
    room_goto(rm_menu);
}


// =====================
// INICIAR SHAKE UMA VEZ
// =====================

if (shake_timer == 0)
{
    shake_timer = 12; // duração do shake ao entrar na tela
}