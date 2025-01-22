var list,token;

list=dslist()

repeat (string_token_start(file_text_read_all(root+argument0+"\index.yyd","|"),"|")) {
    token=string_token_next()
    if (token!="") ds_list_add(list,token)
}

return list
