
// =====================
// ENTRAR NO JOGO
// =====================

if (keyboard_check_pressed(vk_enter))
{
    room_goto(rm_game);
}


// =====================
// GLITCH RANDOM
// =====================

if (irandom(100) < 2)
{
    glitch_timer = irandom_range(3, 8);
}

if (glitch_timer > 0)
{
    glitch_timer--;
}