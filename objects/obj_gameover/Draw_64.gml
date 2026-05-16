// =====================
// SHAKE
// =====================

var sx = 0;
var sy = 0;

if (shake_timer > 0)
{
    sx = irandom_range(-4, 4);
    sy = irandom_range(-3, 3);
    shake_timer--;
}


// =====================
// FUNDO
// =====================

draw_set_color(make_color_rgb(5,5,10));
draw_rectangle(0, 0, room_width, room_height, false);


// =====================
// OVERLAY VERMELHO FIXO
// =====================

draw_set_alpha(0.15);
draw_set_color(c_red);
draw_rectangle(sx, sy, room_width + sx, room_height + sy, false);
draw_set_alpha(1);


// =====================
// GAME OVER
// =====================

var texto = "GAME OVER";

var gx = 0;
var gy = 0;

if (irandom(100) < 3)
{
    gx = irandom_range(-2, 2);
    gy = irandom_range(-2, 2);
}

var scale    = 2;
var center_x = room_width / 2;
var center_y = 140;
var text_w   = string_width(texto) * scale;
var draw_x   = center_x - (text_w / 2);
var draw_y   = center_y;


// sombra/glitch vermelho
draw_set_color(c_red);
draw_text_transformed(draw_x + gx + sx + 3, draw_y + gy + sy, texto, scale, scale, 0);
draw_text_transformed(draw_x + gx + sx - 2, draw_y + gy + sy, texto, scale, scale, 0);

// principal
draw_set_color(c_white);
draw_text_transformed(draw_x + gx + sx, draw_y + gy + sy, texto, scale, scale, 0);


// =====================
// SUBTEXTO
// =====================

var sub = "A NAVE COLAPSOU";

draw_set_color(c_white);
draw_text(room_width/2 - string_width(sub)/2 + sx, 260 + sy, sub);


// =====================
// SCORE E TEMPO FINAIS
// =====================

var minutos  = tempo_final div 60;
var segundos = tempo_final mod 60;
var seg_str  = (segundos < 10 ? "0" : "") + string(segundos);

draw_set_color(make_color_rgb(255,210,80));
draw_text(room_width/2 - string_width("SCORE: " + string(score_final))/2 + sx, 310 + sy, "SCORE: " + string(score_final));

draw_set_color(make_color_rgb(180,220,255));
draw_text(room_width/2 - string_width("TEMPO: " + string(minutos) + ":" + seg_str)/2 + sx, 340 + sy, "TEMPO: " + string(minutos) + ":" + seg_str);


// =====================
// INSTRUÇÃO
// =====================

var txt = "PRESSIONE R PARA REINICIAR";

draw_set_color(make_color_rgb(180,220,255));
draw_text(room_width/2 - string_width(txt)/2 + sx, 410 + sy, txt);


// =====================
// RESET FINAL
// =====================

draw_set_alpha(1);
draw_set_color(c_white);