globalvars()

set_application_title(room_caption)

TAB=tab_recent
WIDTH=room_width
HEIGHT=room_height

GAMEMAKER=registry_read_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Directory")+"GameMaker.exe"

theme_init()
createui()
find_git()
load_recent()
load_extensions()

file_drag_enable(1)

background_y[0]=32
