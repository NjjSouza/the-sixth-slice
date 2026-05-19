depth = -10;

scroll_y    = 40;
scroll_vel  = 0.8;  // velocidade do scroll — ajuste ao gosto

linhas = [
    "",
    "",
    "ORBITANDO",
    "",
    "Desenvolvido para a GameJam",
    "Coding, Pizza & Glory - 2026",
    "INATEL",
    "",
    "Tema: Ctrl + Alt + Math",
    "",
    "",
    "== EQUIPE ==",
    "",
    "NjjSouza (GitHub)",
    "carolferreirauai (Github)",
    "samilebarb (Github)",
    "Julia de Santana Neves",
    "",
    "",
    "== ARTE ==",
    "",
    "Autorais - criadas por",
    "Julia de Santana Neves",
    "",
    "",
    "== MUSICAS ==",
    "",
    "Autorais - criadas por",
    "Arthur Fonseca",
    "",
    "",
    "",
    "Obrigada por jogar! :))",
    "",
    "",
    "",
];

total_altura = array_length(linhas) * 28;
scroll_y = display_get_gui_height() - 100; // começa já dentro do quadro, na borda inferior
