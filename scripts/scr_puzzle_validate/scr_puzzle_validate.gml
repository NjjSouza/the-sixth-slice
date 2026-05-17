function scr_puzzle_validate() {

    if (!global.puzzle_ativo) exit;

    var resposta_digitada = real(global.puzzle_resposta_jogador);
    var diferenca         = abs(resposta_digitada - global.puzzle_resposta_correta);

    global.puzzle_restantes -= 1;

    if (diferenca <= 0.01) {

        global.puzzle_resultado = "correto";
        obj_game.player_score  += 100;

        if (instance_exists(obj_hud)) {
            var ganho = 25;
            if      (global.puzzle_tipo_monitor == "energia")
                obj_hud.energia     = min(obj_hud.energia     + ganho, 100);
            else if (global.puzzle_tipo_monitor == "oxigenio")
                obj_hud.oxigenio    = min(obj_hud.oxigenio    + ganho, 100);
            else if (global.puzzle_tipo_monitor == "integridade")
                obj_hud.integridade = min(obj_hud.integridade + ganho, 100);
        }

    } else {

        global.puzzle_resultado = "errado";

        if (instance_exists(obj_hud)) {
            obj_hud.energia  = max(obj_hud.energia  - 10, 0);
            obj_hud.oxigenio = max(obj_hud.oxigenio -  8, 0);
        }
    }

    global.puzzle_ativo          = false;
    global.puzzle_feedback_timer = 60;
}