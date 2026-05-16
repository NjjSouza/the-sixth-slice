if (!instance_exists(obj_hud)) exit;

var _energia     = 0;
var _oxigenio    = 0;
var _integridade = 0;

with (obj_hud)
{
    _energia     = energia;
    _oxigenio    = oxigenio;
    _integridade = integridade;
}

// =====================
// CHECAR SE DEVE ATIVAR
// =====================

if (_energia <= 30 || _oxigenio <= 30 || _integridade <= 30)
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