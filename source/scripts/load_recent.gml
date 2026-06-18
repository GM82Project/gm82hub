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

numb=ds_list_size(RECLIST)

if (numb) {
    //sort list by project timestamp
    prio=ds_priority_create()

    i=0 repeat (numb) {
        map=dslist(RECLIST,i)
        ds_priority_add(prio,map,dsmap(map,"timestamp"))
    i+=1}

    newlist=dslist()
    repeat (numb) {
        ds_list_add(newlist,ds_priority_delete_max(prio))
    }

    ds_priority_destroy(prio)

    ds_list_destroy(RECLIST)

    RECLIST=newlist


    change_currec(0)
    write_recent()
}
