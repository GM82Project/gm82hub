var find;

GIT=undefined
GITSPR=10

if (GITPREF==0) {
    if (string_pos("\Git\cmd",environment_get_variable("PATH"))) {
        GIT="git gui"
        GITCMD="--working-dir %"
        GITSPR=14
        GITNAME="Git Gui"
    } else {GITPREF=noone show_message("Git GUI client is unavailable in this system.")}
} else if (GITPREF==1) {
    find=directory_appdata+"Local\GitHubDesktop\bin\github.bat"
    if (file_exists(find)) {
        GIT=find
        GITCMD="%"
        GITSPR=10
        GITNAME="GitHub Desktop"
        GITPREF=1
    } else {GITPREF=noone show_message("GitHub Desktop client is unavailable in this system.")}
} else if (GITPREF==2) {
    find=registry_read_string_ext("SOFTWARE\GitExtensions","InstallDir")+"\GitExtensions.exe"
    if (file_exists(find)) {
        GIT=find
        GITCMD="browse %"
        GITSPR=11
        GITNAME="GitExtensions"
        GITPREF=2
    } else {GITPREF=noone show_message("GitExtensions client is unavailable in this system.")}
} else if (GITPREF==3) {
    find="C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe"
    if (file_exists(find)) {
        GIT=find
        GITCMD="/command:sync /path:%"
        GITSPR=13
        GITNAME="TortoiseGit"
        GITPREF=3
    } else {GITPREF=noone show_message("TortoiseGit client is unavailable in this system.")}
}

if (GITPREF==noone) {
    find=registry_read_string_ext("SOFTWARE\GitExtensions","InstallDir")+"\GitExtensions.exe"
    if (file_exists(find)) {
        GIT=find
        GITCMD="browse %"
        GITSPR=11
        GITNAME="GitExtensions"
        GITPREF=2
    } else {
    find="C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe"
    if (file_exists(find)) {
        GIT=find
        GITCMD="/command:sync /path:%"
        GITSPR=13
        GITNAME="TortoiseGit"
        GITPREF=3
    } else {
    find=directory_appdata+"Local\GitHubDesktop\bin\github.bat"
    if (file_exists(find)) {
        GIT=find
        GITCMD="%"
        GITSPR=10
        GITNAME="GitHub Desktop"
        GITPREF=1
    } else {
    if (string_pos("\Git\cmd",environment_get_variable("PATH"))) {
        GIT="git gui"
        GITCMD="--working-dir %"
        GITSPR=14
        GITNAME="Git Gui"
        GITPREF=0
    }}}}
}

registry_write_dword(GMREGDIR+"\GM82HubPreferredGit",GITPREF)

with (Button) if (action=="gitgmk") spr=GITSPR

with (PrefGit) {
    if (GITPREF==0) ui_set_state(radio0,"checked") else ui_set_state(radio0,"none")
    if (GITPREF==1) ui_set_state(radio1,"checked") else ui_set_state(radio1,"none")
    if (GITPREF==2) ui_set_state(radio2,"checked") else ui_set_state(radio2,"none")
    if (GITPREF==3) ui_set_state(radio3,"checked") else ui_set_state(radio3,"none")
}
