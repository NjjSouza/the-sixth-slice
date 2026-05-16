
// =====================
// HUD BASE (alpha leve opcional)
// =====================

draw_set_alpha(1);


// =====================
// FUNDO DAS CAIXAS
// =====================

draw_set_color(make_color_rgb(15,20,30));

draw_rectangle(20,20,260,190,false);
draw_rectangle(980,20,1240,110,false);


// =====================
// ALERTA - COR
// =====================

var cor_alerta;

if (alerta == "SISTEMAS ESTAVEIS")
{
    cor_alerta = make_color_rgb(80,180,220);
}
else if (alerta == "MULTIPLAS FALHAS")
{
    cor_alerta = make_color_rgb(255,140,60);
}
else if (alerta == "NAVE EM COLAPSO")
{
    cor_alerta = c_red;
}
else
{
    cor_alerta = make_color_rgb(255,210,80);
}


// =====================
// GLOW ALERTA
// =====================

draw_set_color(cor_alerta);
draw_set_alpha(0.18);
draw_rectangle(295,660,985,695,false);


// =====================
// BARRA ALERTA
// =====================

draw_set_color(cor_alerta);
draw_set_alpha(1);
draw_rectangle(300,660,980,695,false);


// =====================
// BORDAS
// =====================

draw_set_color(make_color_rgb(80,180,220));
draw_rectangle(20,20,260,190,true);
draw_rectangle(980,20,1240,110,true);

draw_set_color(cor_alerta);
draw_rectangle(300,660,980,695,true);


// =====================
// SCORE E TEMPO
// =====================

var mins     = floor(obj_game.game_time / 60);
var secs     = floor(obj_game.game_time mod 60);
var time_str = string(mins) + ":" + (secs < 10 ? "0" : "") + string(secs);

draw_set_color(c_white);
draw_text(1000, 40, "SCORE: " + string(obj_game.player_score));
draw_text(1000, 75, "TEMPO: " + time_str);


// =====================
// TEXTOS BASE
// =====================

draw_set_color(c_white);

draw_text(40,30,"ENERGIA: " + string(floor(energia)) + "%");
draw_text(40,75,"OXIGENIO: " + string(floor(oxigenio)) + "%");
draw_text(40,120,"INTEGRIDADE: " + string(floor(integridade)) + "%");


// =====================
// ALERTA COM SHAKE
// =====================

var shake_x = 0;
var shake_y = 0;

if (shake_alerta > 0)
{
    shake_x = irandom_range(-2, 2);
    shake_y = irandom_range(-2, 2);
    shake_alerta -= 1;
}


// sombra (melhora leitura)
draw_set_color(c_black);
draw_text(322 + shake_x, 670 + shake_y, "ALERTA: " + alerta);

// texto principal
draw_set_color(c_white);
draw_text(320 + shake_x, 668 + shake_y, "ALERTA: " + alerta);


// ícone de alerta
if (alerta != "SISTEMAS ESTAVEIS")
{
    draw_set_color(c_white);
    draw_text(280 + shake_x, 667 + shake_y, "!");
}


// =====================
// BARRAS DE STATUS
// =====================


// ENERGIA
draw_set_color(c_white);
draw_rectangle(38,48,222,64,true);

draw_set_color(make_color_rgb(30,30,30));
draw_rectangle(40,50,220,62,false);

if (energia > 70)
{
    draw_set_color(make_color_rgb(120,255,120));
}
else if (energia > 30)
{
    draw_set_color(make_color_rgb(255,210,80));
}
else
{
    draw_set_color(c_red);
}

draw_rectangle(40,50,40 + ((180 * energia) / 100),62,false);


// OXIGENIO
draw_set_color(c_white);
draw_rectangle(38,93,222,109,true);

draw_set_color(make_color_rgb(30,30,30));
draw_rectangle(40,95,220,107,false);

if (oxigenio > 70)
{
    draw_set_color(make_color_rgb(100,220,255));
}
else if (oxigenio > 30)
{
    draw_set_color(make_color_rgb(60,140,255));
}
else
{
    draw_set_color(make_color_rgb(180,80,255));
}

draw_rectangle(40,95,40 + ((180 * oxigenio) / 100),107,false);


// INTEGRIDADE
draw_set_color(c_white);
draw_rectangle(38,138,222,154,true);

draw_set_color(make_color_rgb(30,30,30));
draw_rectangle(40,140,220,152,false);

if (integridade > 70)
{
    draw_set_color(make_color_rgb(200,170,70));
}
else if (integridade > 30)
{
    draw_set_color(make_color_rgb(255,140,60));
}
else
{
    draw_set_color(make_color_rgb(180,40,40));
}

draw_rectangle(40,140,40 + ((180 * integridade) / 100),152,false);


// =====================
// RESET FINAL
// =====================

draw_set_alpha(1);
draw_set_color(c_white);