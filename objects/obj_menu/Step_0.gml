
// =====================
// GLITCH LEVE
// =====================

if (!booting && irandom(100) < 2)
{
    glitch_timer = 6;
}

if (glitch_timer > 0)
{
    glitch_timer--;
}


// =====================
// INICIAR BOOT
// =====================

if (!booting)
{
    if (keyboard_check_pressed(vk_enter))
    {
        booting = true;
        boot_index = 0;
        boot_counter = 0;
    }

    if (keyboard_check_pressed(vk_escape))
    {
        game_end();
    }
}


// =====================
// EXECUÇÃO DO BOOT
// =====================

if (booting)
{
    boot_counter++;

    if (boot_counter >= boot_delay)
    {
        boot_counter = 0;

        if (boot_index < array_length(boot_texts))
        {
            boot_index++;
        }
        else
        {
            room_goto(rm_game);
        }
    }
}