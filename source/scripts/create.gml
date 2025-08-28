globalvars()

set_application_title(room_caption)

TAB=tab_recent
WIDTH=room_width
HEIGHT=room_height

GAMEMAKER=registry_read_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Directory")+"GameMaker.exe"

theme_init()
find_git()
createui()
load_recent()
load_extensions()

file_drag_enable(1)

background_y[0]=32
