var fn,b,extname,size,b2,b3,len,pos;
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

    undo_extension_dat_encryption(b)

    size=buffer_get_size(b)
    pos=4

    do {
        buffer_set_pos(b,pos)
        len=buffer_read_u32(b) pos+=4
        buffer_copy_part(b2,b,buffer_get_pos(b),len) pos+=len
        buffer_inflate(b2)

        if (buffer_read_data(b2,6)=="Johnny") {
            buffer_copy_part(b3,b2,7,buffer_get_size(b2)-7)
            buffer_inflate(b3)
            parse_johnny(extname,buffer_read_data(b3,buffer_get_size(b3)))
            buffer_clear(b3)
        }

        buffer_clear(b2)
    } until (pos>=size)

buffer_destroy(b)
buffer_destroy(b2)
