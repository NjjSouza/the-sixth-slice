// =====================
// ESTRELAS
// =====================

depth = 100

estrelas_qtd = 120;
estrelas_x   = array_create(estrelas_qtd);
estrelas_y   = array_create(estrelas_qtd);
estrelas_vel = array_create(estrelas_qtd);
estrelas_tam = array_create(estrelas_qtd);

for (var i = 0; i < estrelas_qtd; i++)
{
    estrelas_x[i]   = irandom(room_width);
    estrelas_y[i]   = irandom(room_height);
    estrelas_vel[i] = 0.5 + random(2.5); // velocidades variadas
    estrelas_tam[i] = irandom_range(1, 3); // tamanhos variados
}


// =====================
// NEBULOSA
// =====================

// pontos fixos de cor da nebulosa
neb_qtd = 6;
neb_x   = array_create(neb_qtd);
neb_y   = array_create(neb_qtd);
neb_r   = array_create(neb_qtd);
neb_cor = array_create(neb_qtd);

var cores = [
    make_color_rgb(80,40,120),  // roxo
    make_color_rgb(40,60,140),  // azul escuro
    make_color_rgb(120,40,80),  // vinho
    make_color_rgb(40,100,120), // azul esverdeado
    make_color_rgb(60,40,100),  // roxo escuro
    make_color_rgb(100,60,40),  // laranja escuro
];

for (var i = 0; i < neb_qtd; i++)
{
    neb_x[i]   = irandom(room_width);
    neb_y[i]   = irandom(room_height);
    neb_r[i]   = 80 + irandom(120); // raio da mancha
    neb_cor[i] = cores[i];
}