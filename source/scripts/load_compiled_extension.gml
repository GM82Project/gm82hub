var fn,b,extname,size,b2,b3,len,pos,i;
fn=EXTDIR+argument0

b=buffer_create()
b2=buffer_create()
b3=buffer_create()
i=0 repeat (ds_list_size(FUNCLIST)) {ds_map_destroy(dslist(FUNCLIST,i)) i+=1}
ds_list_clear(FUNCLIST)

//get name from ged
    buffer_load(b,fn+".ged")
    buffer_set_pos(b,8)
    extname=buffer_read_data(b,buffer_read_u32(b))

//get johnny file from dat
    buffer_load(b,fn+".dat")

    gex_generate_table(b)

    size=buffer_get_size(b)

    //now some weird-ass shit because the first byte isn't encrypted,
    //so we decrypt 3 starting from 5 and then skip the first decrypt
    gex_decrypt_part(b,5,3)
    
    //make a list of extension files (only decrypt the length field)
    files=ds_list_create()
    pos=4
    do {
        ds_list_add(files,pos)
        buffer_set_pos(b,pos)
        len=buffer_read_u32(b) pos+=4
        pos+=len
        if (pos<size) gex_decrypt_part(b,pos,4)
    } until (pos>=size)
    
    //we sort end first because extension "other" files are sorted last
    ds_list_sort(files,0)
    
    repeat (ds_list_size(files)) {
        pos=ds_list_find_value(files,0)
        ds_list_delete(files,0)
        buffer_set_pos(b,pos)
        len=buffer_read_u32(b) pos+=4
        //decrypt the rest of the file
        gex_decrypt_part(b,pos,len)
        buffer_copy_part(b2,b,buffer_get_pos(b),len) pos+=len
        buffer_inflate(b2)

        if (buffer_read_data(b2,6)=="Johnny") {
            buffer_copy_part(b3,b2,7,buffer_get_size(b2)-7)
            buffer_inflate(b3)
            parse_johnny(extname,buffer_read_data(b3,buffer_get_size(b3)))
            buffer_clear(b3)
        }

        buffer_clear(b2)
    }
    
ds_list_destroy(files)
buffer_destroy(b)
buffer_destroy(b2)
