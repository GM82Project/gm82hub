CURREC=argument0
if (dsmap(dslist(RECLIST,CURREC),"type")) {
    with (Button) if (action=="cleangmk") {gray=false alt="Remove unused files and#check for broken trees"}
} else {
    with (Button) if (action=="cleangmk") {gray=true alt="You can't clean a gmk file"}
}

path=dsmap(dslist(RECLIST,CURREC),"path")

var yay;yay=false
repeat (string_count("\",path)) {
    if (directory_exists(path+"\.git")) {yay=true break}
    path=directory_previous(path)
}

with (Button) if (action=="gitgmk" and GIT!=undefined) {gray=!yay if (gray) alt="No repository found" else alt="Launch "+GITNAME}
