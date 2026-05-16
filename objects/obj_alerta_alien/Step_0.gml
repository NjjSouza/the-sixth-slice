// =====================
// TESTE - APERTA T PRA ATIVAR/DESATIVAR
// =====================

if (keyboard_check_pressed(ord("T")))
{
    ativo = !ativo;
}


// =====================
// VINHETA PULSANDO
// =====================

if (ativo)
{
    vinheta_alpha += 0.02 * vinheta_dir;

    if (vinheta_alpha >= 0.35)
    {
        vinheta_dir = -1;
    }
    else if (vinheta_alpha <= 0.05)
    {
        vinheta_dir = 1;
    }

    // =====================
    // GLITCH ALEATORIO
    // =====================

    if (irandom(100) < 8)
    {
        glitch_timer = irandom_range(3, 8);
    }

    if (glitch_timer > 0)
    {
        glitch_timer--;
    }

    // =====================
    // TEXTO GLITCHADO
    // =====================

    var base   = "SINAL ALIENIGENA DETECTADO";
    var chars  = "!@#$%&*?/\\[]<>^~";
    var result = "";

    for (var i = 1; i <= string_length(base); i++)
    {
        if (glitch_timer > 0 && irandom(100) < 25)
        {
            // troca por caractere aleatório
            result += string_char_at(chars, 1 + irandom(string_length(chars) - 1));
        }
        else
        {
            result += string_char_at(base, i);
        }
    }

    texto_glitch = result;
}
else
{
    vinheta_alpha = 0;
    glitch_timer  = 0;
    texto_glitch  = "SINAL ALIENIGENA DETECTADO";
}