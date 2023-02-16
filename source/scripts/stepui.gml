MOUSE_X=window_mouse_get_x()
MOUSE_Y=window_mouse_get_y()

if (mouse_check_button_pressed(mb_left)) {
    with (Button) if (instance_position(MOUSE_X,MOUSE_Y,id)) {
        event_user(2)
    }
}
