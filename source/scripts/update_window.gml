if (window_get_width()!=WIDTH || window_get_height()!=HEIGHT) {
    WIDTH=window_get_width()
    HEIGHT=window_get_height()

    window_set_region_size(WIDTH,HEIGHT,0)
    window_resize_buffer(WIDTH,HEIGHT,1,0)
    view_wport=WIDTH
    view_wview=WIDTH
    view_hport=HEIGHT
    view_hview=HEIGHT
}

if (window_has_focus()) {
    room_speed=display_get_frequency()
    set_automatic_draw(1)
} else {
    room_speed=10
    set_automatic_draw(0)
}
