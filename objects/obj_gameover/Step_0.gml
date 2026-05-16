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

// =====================
// ROTAÇÃO E MOVIMENTO CIRCULAR
// =====================

angulo += vel_rotacao;
if (angulo >= 360) angulo = 0;

circulo_angulo += 1; // velocidade do movimento circular
if (circulo_angulo >= 360) circulo_angulo = 0;