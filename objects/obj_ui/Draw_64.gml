draw_text(20, 20,
"TIME: " + string(floor(obj_game.game_time)));

draw_text(20, 50,
"SCORE: " + string(obj_game.player_score));

draw_text(20, 80,
"OXYGEN: " + string(floor(obj_hud.oxigenio)));

var state_name = "";

switch(obj_game.game_state)
{
    case GAME_STATE.MENU:
        state_name = "MENU";
    break;

    case GAME_STATE.PLAYING:
        state_name = "PLAYING";
    break;

    case GAME_STATE.PUZZLE:
        state_name = "PUZZLE";
    break;

    case GAME_STATE.GAMEOVER:
        state_name = "GAME OVER";
    break;
}

draw_text(20, 110,
"STATE: " + state_name);
