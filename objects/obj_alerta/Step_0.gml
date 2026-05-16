// =====================
// CHECAR SE DEVE ATIVAR
// =====================

if (!instance_exists(obj_hud)) exit;
var hud = obj_hud;

if (hud.energia <= 30 || hud.oxigenio <= 30 || hud.integridade <= 30)
{
    ativo = true;
}
else
{
    ativo         = false;
    pisca_visivel = false;
    vinheta_alpha = 0;
}


// =====================
// PISCA
// =====================

if (ativo)
{
    pisca_timer++;

    if (pisca_timer >= pisca_delay)
    {
        pisca_timer   = 0;
        pisca_visivel = !pisca_visivel;
    }


    // =====================
    // VINHETA PULSANDO
    // =====================

    vinheta_alpha += 0.02 * vinheta_dir;

    if (vinheta_alpha >= 0.35)
    {
        vinheta_dir = -1;
    }
    else if (vinheta_alpha <= 0.05)
    {
        vinheta_dir = 1;
    }
}