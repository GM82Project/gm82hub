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

i=0 repeat (file_drag_count()) {
    fn=file_drag_name(i)
    if (directory_exists(fn)) {
        //gm82 project folder?
        file=file_find_first(fn+"\*.gm82",0) file_find_close()
        if (file!="") {if (add_recent(fn+"\"+file)) change_currec(ds_list_size(RECLIST)-1)}
    } else {
        //gmk?
        ext=string_lower(filename_ext(fn))
        if (ext==".gm82") or (ext==".gm81") {if (add_recent(fn)) change_currec(ds_list_size(RECLIST)-1)}
    }

    //update screen once
    set_automatic_draw(1)
i+=1}
file_drag_clear()
