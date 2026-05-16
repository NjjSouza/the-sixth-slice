if (!ativo) exit;


// =====================
// VINHETA CIRCULAR COM FADE
// =====================

var camadas = 18;
var cx = 1366 / 2;
var cy = 768 / 2;
var raio_max_x = 1366;
var raio_max_y = 768;

for (var i = 1; i <= camadas; i++)
{
    var t     = i / camadas;
    var alpha = vinheta_alpha * (t * t);
    var rx    = raio_max_x * t;
    var ry    = raio_max_y * t;

    draw_set_alpha(alpha);
    draw_set_color(c_red);
    draw_ellipse(cx - rx, cy - ry, cx + rx, cy + ry, true);
}

draw_set_alpha(1);



// =====================
// FLASH PISCANTE
// =====================

if (pisca_visivel)
{
    draw_set_alpha(0.06);
    draw_set_color(c_red);
    draw_rectangle(0, 0, 1366, 768, false);
    draw_set_alpha(1);
}


// =====================
// RESET FINAL
// =====================

draw_set_alpha(1);
draw_set_color(c_white);