
if (!ativo) exit;


// =====================
// VINHETA VERDE COM FADE
// =====================

var cor_alien  = make_color_rgb(0, 200, 80);
var camadas    = 18;
var cx         = 1366 / 2;
var cy         = 768 / 2;
var raio_max_x = 1366;
var raio_max_y = 768;

for (var i = 1; i <= camadas; i++)
{
    var t     = i / camadas;
    var alpha = vinheta_alpha * (t * t);
    var rx    = raio_max_x * t;
    var ry    = raio_max_y * t;

    draw_set_alpha(alpha);
    draw_set_color(cor_alien);
    draw_ellipse(cx - rx, cy - ry, cx + rx, cy + ry, true);
}

draw_set_alpha(1);


// =====================
// GLITCH OFFSET
// =====================

var gx = 0;
var gy = 0;

if (glitch_timer > 0)
{
    gx = irandom_range(-6, 6);
    gy = irandom_range(-3, 3);
}


// =====================
// TEXTO DE ALERTA COM GLITCH
// =====================

var texto  = texto_glitch;
var scale  = 2;
var text_w = string_width(texto) * scale;
var draw_x = cx - (text_w / 2);
var draw_y = cy - 20;

// camada glitch verde deslocada
draw_set_alpha(0.6);
draw_set_color(make_color_rgb(0, 255, 100));
draw_text_transformed(draw_x + gx + 4, draw_y + gy, texto, scale, scale, 0);

// camada glitch vermelha
draw_set_alpha(0.4);
draw_set_color(make_color_rgb(255, 0, 80));
draw_text_transformed(draw_x - gx - 4, draw_y - gy, texto, scale, scale, 0);

draw_set_alpha(1);

// sombra
draw_set_color(make_color_rgb(0, 80, 30));
draw_text_transformed(draw_x + 3, draw_y + 3, texto, scale, scale, 0);

// texto principal
draw_set_color(make_color_rgb(0, 200, 80));
draw_text_transformed(draw_x + gx, draw_y + gy, texto, scale, scale, 0);


// =====================
// RESET FINAL
// =====================

draw_set_alpha(1);
draw_set_color(c_white);