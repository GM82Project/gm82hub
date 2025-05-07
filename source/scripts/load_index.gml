var list,token;

list=dslist()

repeat (string_token_start(file_text_read_all(root+argument0+"\index.yyd",chr_lf),chr_lf)) {
    ds_list_add(list,string_token_next())
}

return list
