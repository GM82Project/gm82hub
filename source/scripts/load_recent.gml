ds_list_clear(RECLIST)

i=0 do {
    name=registry_read_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Recent"+string(i))
    if (name=="") break
    add_recent(name)
i+=1} until 0

if (ds_list_size(RECLIST)) {
    change_currec(0)
    write_recent()
}
