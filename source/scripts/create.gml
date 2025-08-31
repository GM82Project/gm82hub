globalvars()

set_application_title(room_caption)
file_drag_enable(1)

TAB=tab_recent
WIDTH=room_width
HEIGHT=room_height
background_y[0]=32

GMREGDIR="SOFTWARE\Game Maker\Version 8.2\Preferences"
GAMEMAKER=registry_read_string_ext(GMREGDIR,"Directory")+"GameMaker.exe"
GITPREF=registry_read_dword(GMREGDIR+"\GM82HubPreferredGit",noone)

theme_init()
find_git()
createui()
load_recent()
load_extensions()
