var find;

GIT=undefined
GITSPR=10

find=registry_read_string_ext("SOFTWARE\GitExtensions","InstallDir")+"\GitExtensions.exe"
if (file_exists(find)) {
    GIT=find
    GITCMD="browse %"
    GITSPR=11
    GITNAME="GitExtensions"
} else {
find="C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe"
if (file_exists(find)) {
    GIT=find
    GITCMD="/command:sync /path:%"
    GITSPR=13
    GITNAME="TortoiseGit"
} else {
find=directory_appdata+"Local\GitHubDesktop\bin\github.bat"
if (file_exists(find)) {
    GIT=find
    GITCMD="%"
    GITSPR=10
    GITNAME="GitHub Desktop"
} else {
if (string_pos("\Git\cmd",environment_get_variable("PATH"))) {
    GIT="git gui"
    GITCMD="--working-dir %"
    GITSPR=14
    GITNAME="Git Gui"
}}}}
