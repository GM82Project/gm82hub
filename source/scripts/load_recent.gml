RECLIST=dslist()
CURREC=noone

if (file_exists("recent.txt")) {
    f=file_text_open_read("recent.txt")
    while (!file_text_eof(f)) {
        str=file_text_read_string(f) file_text_readln(f)
        add_recent(str)
    }
    file_text_close(f)
}

i=0 repeat (8) {
    name=registry_read_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Recent"+string(i))
    if (name=="") continue
    add_recent(name)
i+=1}

if (ds_list_size(RECLIST)) {
    change_currec(0)
    write_recent()
}
