if (keyboard_check(vk_control) && keyboard_check(vk_alt)) {
    room_goto(rm_credits);
}

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
        booting      = true;
        boot_index   = 0;
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

    // CURSOR PISCANTE
    cursor_timer++;
    if (cursor_timer >= 20)
    {
        cursor_timer   = 0;
        cursor_visivel = !cursor_visivel;
    }

    if (boot_counter >= boot_delay)
    {
        boot_counter = 0;

        if (boot_index >= array_length(boot_texts))
        {
            room_goto(rm_game);
        }
        else
        {
            boot_index++;
        }
    }
}
