function scr_puzzle_init() {

    randomize();

    // ============================================================
    // CONTROLE DE FASES
    // ============================================================

    global.puzzle_fase             = 1;
    global.puzzle_contador_na_fase = 0;
    global.puzzle_por_fase         = 6;
    global.score_final             = 0;
    global.tempo_final             = 0;

    // ============================================================
    // DADOS DO PUZZLE ATUAL
    // ============================================================

    global.puzzle_num_a            = 0;
    global.puzzle_num_b            = 0;
    global.puzzle_resposta_correta = 0;
    global.puzzle_operador         = "+";
    global.puzzle_pergunta         = "";
    global.puzzle_pergunta2        = "";
    global.puzzle_resposta_jogador = "";

    // ============================================================
    // ESTADO DO PUZZLE
    // ============================================================

    global.puzzle_ativo            = false;
    global.puzzle_resultado        = "";
    global.puzzle_feedback_timer   = 0;
    global.puzzle_feedback_duracao = 120;
    global.puzzle_alieniga         = false;

    // ============================================================
    // QUAL MONITOR ATIVOU O PUZZLE ATUAL
    // ============================================================

    global.puzzle_tipo_monitor = ""; // "energia" | "oxigenio" | "integridade"

    // ============================================================
    // CAUSA DA MORTE (padrão — sobrescrita em obj_hud)
    // ============================================================

    global.causa_morte = "oxigenio";
    global.game_over = false;
}