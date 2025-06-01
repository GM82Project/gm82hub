globalvars()

if (!directory_exists(working_directory+"\help")) set_working_directory(directory_previous(working_directory))

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

GIT=undefined
GITSPR=10

find=registry_read_string_ext("SOFTWARE\GitExtensions","InstallDir")+"\GitExtensions.exe"
if (file_exists(find)) {
    GIT=find
    GITCMD=" browse "+qt+"%"+qt
    GITSPR=11
    GITNAME="GitExtensions"
} else {
    /*find=whatever github desktop installs to
    if (file_exists(find)) {
        GIT=find
    } else {
        find=ask square wtf is that tortoise thing he uses
        if (file_exists(find)) {
            GIT=find
        }
    } */
}

theme_init()

createui()

background_y[0]=32

load_recent()
load_extensions()

set_application_title(room_caption)
