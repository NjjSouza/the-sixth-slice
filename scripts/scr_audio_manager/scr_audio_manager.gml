function AudioManager_Play(_sound) {
    if (!instance_exists(obj_audio_manager)) exit;
    with (obj_audio_manager) {
        if (faixa_atual != -1 && audio_is_playing(faixa_atual)) {
            proxima_faixa = _sound;
            fade_out      = true;
        } else {
            faixa_atual  = audio_play_sound(_sound, 1, true);
            fade_volume  = 0;
            fade_in      = true;
        }
    }
}