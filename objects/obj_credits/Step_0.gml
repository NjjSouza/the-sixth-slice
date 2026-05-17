scroll_y -= scroll_vel;

// Volta ao menu quando tudo passar ou ESC
if (scroll_y < -total_altura || keyboard_check_pressed(vk_escape)) {
    room_goto(rm_menu);
}