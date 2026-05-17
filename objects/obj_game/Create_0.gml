// Música
AudioManager_Play(snd_main);

game_state = GAME_STATE.PLAYING;
game_time = 0;
player_score = 0;
score_timer = 0;
global.current_puzzle = noone;
global.system_locked = false;

scr_puzzle_init(); 