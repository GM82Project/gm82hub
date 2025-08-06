var map,type,gmk,meta,metafn,i,projname;

if not (file_exists(argument0)) exit

projname=filename_change_ext(filename_name(argument0),"")

//select existing entries
i=0 repeat (ds_list_size(RECLIST)) {
    map=dslist(RECLIST,i)
    if (dsmap(map,"name")==projname) {change_currec(i) return 0}
i+=1}


map=dsmap()

type=!!string_pos(".gm82",filename_name(argument0))

if (type) {
    gmk=dsmap()
    ds_map_read_ini(gmk,name)
    dsmap(map,"pname",dsmap(gmk,"info_version"))
    ds_map_destroy(gmk)
    dsmap(map,"icon",sprite_add(filename_dir(argument0)+"\settings\icon.ico",1,0,0,0,0))
}

dsmap(map,"name",projname)
dsmap(map,"type",type)
dsmap(map,"path",argument0)
dsmap(map,"size",file_size(argument0))
dsmap(map,"timestamp",file_get_timestamp(argument0))

ds_list_add(RECLIST,map)

meta=dsmap()
metafn=filename_dir(argument0)+"\cache\gm82hub.meta"
if (file_exists(metafn)) {
    ds_map_read_ini(meta,metafn)
    dsmap(meta,"cleanstamp",real(dsmap(meta,"cleanstamp")))
}/* else {
    dsmap(meta,"cleanstamp",dsmap(map,"timestamp"))
    directory_create(filename_dir(argument0)+"\cache")
    ds_map_write_ini(meta,metafn)
}*/
dsmap(map,"meta",meta)

return 1
