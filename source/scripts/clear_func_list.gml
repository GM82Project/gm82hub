i=0 repeat (ds_list_size(FUNCLIST)) {ds_map_destroy(dslist(FUNCLIST,i)) i+=1}
ds_list_clear(FUNCLIST)
