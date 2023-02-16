globalvars()

TAB=tab_recent
WIDTH=room_width
HEIGHT=room_height
RECLIST=dslist()
EXTLIST=dslist()
FUNCLIST=dslist()
CURREC=noone
CUREXT=noone
CURFUNC=noone

GAMEMAKER=registry_read_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Directory")+"GameMaker.exe"

theme_init()

createui()

background_y[0]=32

load_recent()
load_extensions()

set_application_title(room_caption)
