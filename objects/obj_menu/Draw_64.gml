

// =====================
// FUNDO BASE
// =====================

draw_set_color(make_color_rgb(10,15,25));
draw_rectangle(0,0,room_width,room_height,false);


// =====================
// ESTÁTICA (NOISE)
// =====================

draw_set_alpha(0.05);

for (var i = 0; i < 80; i++)
{
    draw_set_color(c_white);
    draw_point(irandom(room_width), irandom(room_height));
}

draw_set_alpha(1);


// =====================
// PULSO DE FUNDO
// =====================

var pulse = 0.5 + 0.5 * sin(current_time / 300);

draw_set_alpha(0.08 * pulse);
draw_set_color(make_color_rgb(80,180,220));
draw_rectangle(0,0,room_width,room_height,false);

draw_set_alpha(1);


// =====================
// SCANLINE
// =====================

var y_scan = (current_time div 10) mod room_height;

draw_set_alpha(0.03);
draw_set_color(c_white);
draw_rectangle(0, y_scan, room_width, y_scan + 2, false);

draw_set_alpha(1);


// =====================
// STATUS DO SISTEMA
// =====================

draw_set_color(make_color_rgb(80,180,220));
draw_text(20, 20, "SISTEMA: INATIVO");

draw_set_color(make_color_rgb(255,80,80));
draw_text(20, 40, "NAVE: INSTAVEL");


// =====================
// TÍTULO COM GLITCH (CORRIGIDO)
// =====================

var texto = "NAVE EM COLAPSO";

var gx = 0;
var gy = 0;

if (glitch_timer > 0)
{
    gx = irandom_range(-3, 3);
    gy = irandom_range(-2, 2);
}

// centralização correta (SEM usar x/y reservados)
var titulo_x = room_width/2 - string_width(texto)/2;
var titulo_y = 180;


// camada glitch (vermelha)
draw_set_color(c_red);
draw_text(titulo_x + gx + 2, titulo_y + gy, texto);

// camada principal
draw_set_color(c_white);
draw_text(titulo_x + gx, titulo_y + gy, texto);

// glitch fantasma leve
if (glitch_timer > 0 && irandom(10) < 2)
{
    draw_text(titulo_x + irandom_range(-6,6), titulo_y, texto);
}


// =====================
// INSTRUÇÃO
// =====================

draw_set_color(make_color_rgb(180,220,255));
draw_text(room_width/2 - 170, 320, "[ ENTER ] INICIAR SEQUÊNCIA DE EMERGÊNCIA");


// =====================
// INDICADOR FINAL
// =====================

draw_set_color(make_color_rgb(255,210,80));
draw_text(room_width/2 - 90, 360, ">> SISTEMA AGUARDANDO <<");