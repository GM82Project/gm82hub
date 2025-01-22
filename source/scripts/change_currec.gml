CURREC=argument0
if (dsmap(dslist(RECLIST,CURREC),"type")) {
    with (Button) if (action=="cleangmk") gray=false
} else {
    with (Button) if (action=="cleangmk") gray=true
}
