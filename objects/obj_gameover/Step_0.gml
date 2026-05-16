// =====================
// REINICIAR JOGO
// =====================

if (keyboard_check_pressed(ord("R")))
{
    room_goto(rm_menu);
}


// =====================
// SHAKE CONTINUO
// =====================

if (shake_timer == 0)
{
    shake_timer = 12;
}