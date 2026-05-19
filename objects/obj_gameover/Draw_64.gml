// =====================
// DEFINIR TEMA POR CAUSA
// =====================

var cor_principal;
var cor_sombra;
var cor_overlay;
var titulo;
var subtitulo;

if (causa_morte == "oxigenio")
{
    cor_principal = make_color_rgb(80,180,255);
    cor_sombra    = make_color_rgb(20,60,120);
    cor_overlay   = make_color_rgb(0,30,80);
    titulo        = "SEM OXIGENIO";
    subtitulo     = "A TRIPULACAO SUFOCOU";
}
else if (causa_morte == "energia")
{
    cor_principal = make_color_rgb(255,210,80);
    cor_sombra    = make_color_rgb(120,80,0);
    cor_overlay   = make_color_rgb(40,30,0);
    titulo        = "FALHA DE ENERGIA";
    subtitulo     = "A NAVE APAGOU";
}
else if (causa_morte == "estrutura")
{
    cor_principal = c_red;
    cor_sombra    = make_color_rgb(100,0,0);
    cor_overlay   = make_color_rgb(40,0,0);
    titulo        = "COLAPSO ESTRUTURAL";
    subtitulo     = "A NAVE SE DESPEDACOU";
}
else if (causa_morte == "alien")
{
    cor_principal = make_color_rgb(0,220,80);
    cor_sombra    = make_color_rgb(0,80,30);
    cor_overlay   = make_color_rgb(0,30,10);
    titulo        = "INVASAO ALIENIGENA";
    subtitulo     = "ELES TOMARAM O CONTROLE";
}


// =====================
// SHAKE
// =====================

var sx = 0;
var sy = 0;

if (shake_timer > 0)
{
    sx = irandom_range(-2, 2);
    sy = irandom_range(-1, 1);
    shake_timer--;
}

// =====================
// FUNDO
// =====================

draw_set_color(make_color_rgb(5,5,10));
draw_rectangle(0, 0, 1366, 768, false);


// =====================
// OVERLAY COM COR DA CAUSA
// =====================

draw_set_alpha(0.15);
draw_set_color(cor_overlay);
draw_rectangle(sx, sy, 1366 + sx, 768 + sy, false);
draw_set_alpha(1);


// =====================
// VINHETA COM COR DA CAUSA
// =====================

var camadas    = 18;
var cx = display_get_gui_width() / 2;
var cy = display_get_gui_height() / 2;
var raio_max_x = 1366;
var raio_max_y = 768;

for (var i = 1; i <= camadas; i++)
{
    var t     = i / camadas;
    var alpha = 0.25 * (t * t);
    var rx    = raio_max_x * t;
    var ry    = raio_max_y * t;

    draw_set_alpha(alpha);
    draw_set_color(cor_principal);
    draw_ellipse(cx - rx, cy - ry, cx + rx, cy + ry, true);
}

draw_set_alpha(1);


// =====================
// EFEITO OXIGENIO - TUNNEL VISION
// =====================

if (causa_morte == "oxigenio")
{
    var tunnel_camadas = 12;
    for (var i = 1; i <= tunnel_camadas; i++)
    {
        var t     = i / tunnel_camadas;
        var alpha = 0.6 * (t * t);
        var rx    = 300 * t;
        var ry    = 200 * t;

        draw_set_alpha(alpha);
        draw_set_color(c_black);
        // borda esquerda
        draw_rectangle(0, 0, cx - rx, 768, false);
        // borda direita
        draw_rectangle(cx + rx, 0, 1366, 768, false);
        // borda cima
        draw_rectangle(0, 0, 1366, cy - ry, false);
        // borda baixo
        draw_rectangle(0, cy + ry, 1366, 768, false);
    }
    draw_set_alpha(1);
}


// =====================
// EFEITO ENERGIA - LUZ FALHANDO
// =====================

if (causa_morte == "energia")
{
    // linhas horizontais finas como scan de TV falhando
    var linha_alpha = 0.15 + 0.1 * sin(current_time / 80);
    draw_set_alpha(linha_alpha);
    draw_set_color(c_black);

    for (var i = 0; i < 768; i += 6)
    {
        draw_rectangle(0, i, 1366, i + 3, false);
    }

    // flash irregular
    if (irandom(100) < 12)
    {
        draw_set_alpha(0.4);
        draw_set_color(c_black);
        draw_rectangle(0, 0, 1366, 768, false);
    }

    draw_set_alpha(1);
}


// =====================
// EFEITO ESTRUTURA - RACHADURAS
// =====================

if (causa_morte == "estrutura")
{
    draw_set_alpha(0.5);
    draw_set_color(make_color_rgb(255,60,60));

    // rachaduras diagonais fixas
    draw_line_width(0,   0,   300, 400, 2);
    draw_line_width(100, 0,   350, 300, 1);
    draw_line_width(1366, 0,  900, 500, 2);
    draw_line_width(1266, 0,  1050, 250, 1);
    draw_line_width(600, 0,   400, 768, 2);
    draw_line_width(700, 100, 500, 768, 1);
    draw_line_width(0,   300, 500, 768, 2);
    draw_line_width(1366, 400, 800, 768, 2);

    draw_set_alpha(1);
}


// =====================
// EFEITO ALIEN - GLITCH LINHAS
// =====================

var gx = 0;
var gy = 0;

if (causa_morte == "alien")
{
    // linhas horizontais deslocadas
    if (irandom(100) < 30)
    {
        draw_set_alpha(0.5);
        draw_set_color(make_color_rgb(0,220,80));

        var linha_y   = irandom(768);
        var linha_h   = irandom_range(4, 20);
        var linha_off = irandom_range(-60, 60);

        draw_rectangle(0, linha_y, 1366, linha_y + linha_h, false);
        draw_set_alpha(1);
    }

    if (irandom(100) < 15)
    {
        gx = irandom_range(-4, 4);
        gy = irandom_range(-2, 2);
    }
}


// =====================
// TITULO
// =====================

var scale  = 2;
var text_w = string_width(titulo) * scale;
var draw_x = cx - (text_w / 2);
var draw_y = 140;

// sombra
draw_set_color(cor_sombra);
draw_text_transformed(draw_x + gx + sx + 3, draw_y + gy + sy, titulo, scale, scale, 0);

// principal
draw_set_color(cor_principal);
draw_text_transformed(draw_x + gx + sx, draw_y + gy + sy, titulo, scale, scale, 0);


draw_set_halign(fa_center);

// =====================
// SUBTITULO
// =====================

draw_set_color(c_white);
draw_text(cx + sx, 260 + sy, subtitulo);

// =====================
// SCORE E TEMPO FINAIS
// =====================

var minutos  = tempo_final div 60;
var segundos = tempo_final mod 60;
var seg_str  = (segundos < 10 ? "0" : "") + string(segundos);

draw_set_color(make_color_rgb(255, 210, 80));
draw_text(cx + sx, 310 + sy, "SCORE: " + string(score_final));

draw_set_color(make_color_rgb(180, 220, 255));
draw_text(cx + sx, 340 + sy, "TEMPO: " + string(minutos) + ":" + seg_str);

// =====================
// INSTRUÇÃO
// =====================
draw_set_color(make_color_rgb(180, 220, 255));
draw_text(cx + sx, 410 + sy, "PRESSIONE R PARA REINICIAR");

draw_set_halign(fa_left);


// =====================
// PERSONAGEM GIRANDO E CIRCULANDO
// =====================

var pos_x = cx + lengthdir_x(circulo_raio, circulo_angulo);
var pos_y = 300 + lengthdir_y(circulo_raio, circulo_angulo);

draw_sprite_ext(
    spr_player_dead,
    0,
    pos_x,
    pos_y,
    0.1,
    0.1,
    angulo,
    c_white,
    1
);
// =====================
// RESET FINAL
// =====================

draw_set_alpha(1);
draw_set_color(c_white);