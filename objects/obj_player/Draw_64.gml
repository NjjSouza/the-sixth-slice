var w = sprite_get_width(sprite_index);
var h = sprite_get_height(sprite_index);

draw_sprite_ext(
    sprite_index, image_index,  // GML avança automaticamente - animações
    x - (w * 0.2) / 2,
    y - (h * 0.2) / 2,
    0.2, 0.2,
    0, c_white, 1
);