// =====================
// FUNDO ESCURO
// =====================

draw_set_color(make_color_rgb(5,8,18));
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);


// =====================
// NEBULOSA
// =====================


for (var i = 0; i < neb_qtd; i++)
{
    var passos = 6;

    for (var j = passos; j >= 1; j--)
    {
        var alpha = 0.03 * (j / passos);
        var raio  = neb_r[i] * (j / passos);

        draw_set_alpha(alpha);
        draw_set_color(neb_cor[i]);
        draw_circle(neb_x[i], neb_y[i], raio, false);
    }
}

draw_set_alpha(1);


// =====================
// ESTRELAS
// =====================


for (var i = 0; i < estrelas_qtd; i++)
{
    var alpha_estrela = 0.4 + (estrelas_tam[i] / 3) * 0.6;

    draw_set_alpha(alpha_estrela);
    draw_set_color(c_white);

    if (estrelas_tam[i] == 1)
    {
        draw_point(estrelas_x[i], estrelas_y[i]);
    }
    else
    {
        draw_circle(estrelas_x[i], estrelas_y[i], estrelas_tam[i] - 1, false);
    }
}


// =====================
// RESET FINAL
// =====================

draw_set_alpha(1);
draw_set_color(c_white);