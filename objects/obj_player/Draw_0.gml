// obj_player/Draw_0.gml
var escala = 0.07; // ajuste esse valor até ficar do tamanho certo

draw_sprite_ext(
    sprite_index,  // usa a sprite atual (já trocada pelo Step)
    0,
    x, y,
    escala, escala,
    0,
    c_white,
    1
);