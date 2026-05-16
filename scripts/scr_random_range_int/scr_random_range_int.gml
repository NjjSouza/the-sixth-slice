/// @function scr_random_range_int(minimo, maximo)
/// @description Retorna um número inteiro aleatório entre minimo e maximo (incluso)
/// @param {real} minimo  O menor número possível
/// @param {real} maximo  O maior número possível

function scr_random_range_int(minimo, maximo) {
    // irandom_range já vem no GameMaker e retorna inteiro aleatório
    // Ex: scr_random_range_int(1, 10) pode retornar 1, 5, 7, 10, etc.
    return irandom_range(minimo, maximo);
}