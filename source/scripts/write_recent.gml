var i;

i=0 repeat (ds_list_size(RECLIST)) {
    registry_write_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Recent"+string(i),dsmap(dslist(RECLIST,i),"path"))
i+=1}

repeat (8-i) {
    registry_write_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Recent"+string(i),"")
i+=1}
