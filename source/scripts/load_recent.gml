ds_list_clear(RECLIST)

i=0 repeat (8) {
    name=registry_read_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Recent"+string(i))
    if (name!="") if (file_exists(name)) {
        map=dsmap()

        type=!!string_pos(".gm82",filename_name(name))

        if (type) {
            gmk=dsmap()
            ds_map_read_ini(gmk,name)
            dsmap(map,"pname",dsmap(gmk,"info_version"))
            ds_map_destroy(gmk)
            dsmap(map,"icon",sprite_add(filename_dir(name)+"\settings\icon.ico",1,0,0,0,0))
        }

        dsmap(map,"name",filename_change_ext(filename_name(name),""))
        dsmap(map,"type",type)
        dsmap(map,"path",name)
        dsmap(map,"size",file_size(name))
        dsmap(map,"timestamp",file_get_timestamp(name))

        ds_list_add(RECLIST,map)

        meta=dsmap()
        metafn=filename_dir(name)+"\cache\gm82hub.meta"
        if (file_exists(metafn)) {
            ds_map_read_ini(meta,metafn)
            dsmap(meta,"cleanstamp",real(dsmap(meta,"cleanstamp")))
        }/* else {
            dsmap(meta,"cleanstamp",dsmap(map,"timestamp"))
            directory_create(filename_dir(name)+"\cache")
            ds_map_write_ini(meta,metafn)
        }*/
        dsmap(map,"meta",meta)
    }
i+=1}

if (ds_list_size(RECLIST)) {
    change_currec(0)
    i=0 repeat (min(8,ds_list_size(RECLIST))) {
        registry_write_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Recent"+string(i),dsmap(dslist(RECLIST,i),"path"))
    i+=1}
    repeat (8-i) {
    registry_write_string_ext("SOFTWARE\Game Maker\Version 8.2\Preferences","Recent"+string(i),"")
    i+=1}
}
