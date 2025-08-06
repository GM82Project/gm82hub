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
    find="C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe"
    if (file_exists(find)) {
        GIT=find
        GITCMD=" /command:sync /path:"+qt+"%"+qt
        GITSPR=13
        GITNAME="TortoiseGit"
    } else {
        find=directory_appdata+"Local\GitHubDesktop\bin\github.bat"
        if (file_exists(find)) {
            GIT=find
            GITCMD=" "+qt+"%"+qt
            GITSPR=10
            GITNAME="GitHub Desktop"
        }
    }
}

theme_init()

createui()

background_y[0]=32

load_recent()
load_extensions()

set_application_title(room_caption)

file_drag_enable(1)
