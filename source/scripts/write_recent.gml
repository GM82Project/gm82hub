var i;

i=0 repeat (min(8,ds_list_size(RECLIST))) {
    registry_write_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Recent"+string(i),dsmap(dslist(RECLIST,i),"path"))
i+=1}

repeat (8-i) {
    registry_write_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Recent"+string(i),"")
i+=1}

f=file_text_open_write("recent.txt")
i=0 repeat (ds_list_size(RECLIST)) {
    file_text_write_string(f,dsmap(dslist(RECLIST,i),"path"))
    file_text_writeln(f)
i+=1}
file_text_close(f)
