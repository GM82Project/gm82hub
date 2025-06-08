var list,token,item,fail,fix;

list=dslist()

fail=false fix=false

repeat (string_token_start(file_text_read_all(root+argument0+"\index.yyd",chr_lf),chr_lf)) {
    item=string_token_next()
    if (item!="") {
        if (ds_list_find_index(list,item)!=-1) {
            if not (fail) {
                fail=true
                fix=show_question("It looks like the "+argument0+" index has duplicate entries. Would you like to fix that?")
            }
            if (fix) {
                index_log+=item+" was removed from the "+argument0+" index#"
                breakage+=1
                continue
            }
        }
    }
    ds_list_add(list,item)
}

return list
